
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

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_mul_pipe_beh.v 
//
// File:      $Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_mul_pipe_beh.v
//
// BASELINE:  Catapult-C version 2006b.63
// MODIFIED:  2007-04-03, tnagler
//
// Note: this file uses Verilog2001 features; 
//       please enable Verilog2001 in the flow!

module mgc_mul_pipe (a, b, clk, en, a_rst, s_rst, z);

    // Parameters:
    parameter integer width_a = 32'd4;  // input a bit width
    parameter         signd_a =  1'b1;  // input a type (1=signed, 0=unsigned)
    parameter integer width_b = 32'd4;  // input b bit width
    parameter         signd_b =  1'b1;  // input b type (1=signed, 0=unsigned)
    parameter integer width_z = 32'd8;  // result bit width (= width_a + width_b)
    parameter      clock_edge =  1'b0;  // clock polarity (1=posedge, 0=negedge)
    parameter   enable_active =  1'b0;  // enable polarity (1=posedge, 0=negedge)
    parameter    a_rst_active =  1'b1;  // unused
    parameter    s_rst_active =  1'b1;  // unused
    parameter integer  stages = 32'd2;  // number of output registers + 1 (careful!)
    parameter integer n_inreg = 32'd0;  // number of input registers
   
    localparam integer width_ab = width_a + width_b;  // multiplier result width
    localparam integer n_inreg_min = (n_inreg > 1) ? (n_inreg-1) : 0; // for Synopsys DC
   
    // I/O ports:
    input  [width_a-1:0] a;      // input A
    input  [width_b-1:0] b;      // input B
    input                clk;    // clock
    input                en;     // enable
    input                a_rst;  // async reset (unused)
    input                s_rst;  // sync reset (unused)
    output [width_z-1:0] z;      // output


    // Input registers:

    wire [width_a-1:0] a_f;
    wire [width_b-1:0] b_f;

    integer i;

    generate
    if (clock_edge == 1'b0)
    begin: NEG_EDGE1
        case (n_inreg)
        32'd0: begin: B1
            assign a_f = a, 
                   b_f = b;
        end
        default: begin: B2
            reg [width_a-1:0] a_reg [n_inreg_min:0];
            reg [width_b-1:0] b_reg [n_inreg_min:0];
            always @(negedge clk)
            if (en == enable_active)
            begin: B21
                a_reg[0] <= a;
                b_reg[0] <= b;
                for (i = 0; i < n_inreg_min; i = i + 1)
                begin: B3
                    a_reg[i+1] <= a_reg[i];
                    b_reg[i+1] <= b_reg[i];
                end
            end
            assign a_f = a_reg[n_inreg_min],
                   b_f = b_reg[n_inreg_min];
        end
        endcase
    end
    else
    begin: POS_EDGE1
        case (n_inreg)
        32'd0: begin: B1
            assign a_f = a, 
                   b_f = b;
        end
        default: begin: B2
            reg [width_a-1:0] a_reg [n_inreg_min:0];
            reg [width_b-1:0] b_reg [n_inreg_min:0];
            always @(posedge clk)
            if (en == enable_active)
            begin: B21
                a_reg[0] <= a;
                b_reg[0] <= b;
                for (i = 0; i < n_inreg_min; i = i + 1)
                begin: B3
                    a_reg[i+1] <= a_reg[i];
                    b_reg[i+1] <= b_reg[i];
                end
            end
            assign a_f = a_reg[n_inreg_min],
                   b_f = b_reg[n_inreg_min];
        end
        endcase
    end
    endgenerate


    // Output:
    wire [width_z-1:0]  xz;

    function signed [width_z-1:0] conv_signed;
      input signed [width_ab-1:0] res;
      conv_signed = res[width_z-1:0];
    endfunction

    generate
      wire signed [width_ab-1:0] res;
      if ( (signd_a == 1'b1) && (signd_b == 1'b1) )
      begin: SIGNED_AB
              assign res = $signed(a_f) * $signed(b_f);
              assign xz = conv_signed(res);
      end
      else if ( (signd_a == 1'b1) && (signd_b == 1'b0) )
      begin: SIGNED_A
              assign res = $signed(a_f) * $signed({1'b0, b_f});
              assign xz = conv_signed(res);
      end
      else if ( (signd_a == 1'b0) && (signd_b == 1'b1) )
      begin: SIGNED_B
              assign res = $signed({1'b0,a_f}) * $signed(b_f);
              assign xz = conv_signed(res);
      end
      else
      begin: UNSIGNED_AB
              assign res = a_f * b_f;
	      assign xz = res[width_z-1:0];
      end
    endgenerate


    // Output registers:

    reg  [width_z-1:0] reg_array[stages-2:0];
    wire [width_z-1:0] z;

    generate
    if (clock_edge == 1'b0)
    begin: NEG_EDGE2
        always @(negedge clk)
        if (en == enable_active)
            for (i = stages-2; i >= 0; i = i-1)
                if (i == 0)
                    reg_array[i] <= xz;
                else
                    reg_array[i] <= reg_array[i-1];
    end
    else
    begin: POS_EDGE2
        always @(posedge clk)
        if (en == enable_active)
            for (i = stages-2; i >= 0; i = i-1)
                if (i == 0)
                    reg_array[i] <= xz;
                else
                    reg_array[i] <= reg_array[i-1];
    end
    endgenerate

    assign z = reg_array[stages-2];
endmodule

//------> ../td_ccore_solutions/mult_a75d0bc557d6a6c2ab1eb6d81a22a41170e2_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 19:11:42 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    mult_core_wait_dp
// ------------------------------------------------------------------


module mult_core_wait_dp (
  ccs_ccore_clk, ccs_ccore_en, ensig_cgo_iro, z_mul_cmp_z, z_mul_cmp_1_z, ensig_cgo,
      t_mul_cmp_en, z_mul_cmp_z_oreg, z_mul_cmp_1_z_oreg
);
  input ccs_ccore_clk;
  input ccs_ccore_en;
  input ensig_cgo_iro;
  input [31:0] z_mul_cmp_z;
  input [31:0] z_mul_cmp_1_z;
  input ensig_cgo;
  output t_mul_cmp_en;
  output [31:0] z_mul_cmp_z_oreg;
  reg [31:0] z_mul_cmp_z_oreg;
  output [31:0] z_mul_cmp_1_z_oreg;
  reg [31:0] z_mul_cmp_1_z_oreg;



  // Interconnect Declarations for Component Instantiations 
  assign t_mul_cmp_en = ccs_ccore_en & (ensig_cgo | ensig_cgo_iro);
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
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
      ccs_ccore_clk, ccs_ccore_srst, ccs_ccore_en, z_mul_cmp_a, z_mul_cmp_b, z_mul_cmp_z,
      z_mul_cmp_1_a, z_mul_cmp_1_b, z_mul_cmp_1_z
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
  output [31:0] z_mul_cmp_a;
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
  wire t_mul_cmp_en;
  wire [63:0] t_mul_cmp_z;
  wire [31:0] z_mul_cmp_z_oreg;
  wire [31:0] z_mul_cmp_1_z_oreg;
  wire and_dcpl;
  reg main_stage_0_2;
  reg asn_itm_1;
  reg main_stage_0_4;
  reg asn_itm_3;
  reg slc_32_svs_1;
  reg asn_itm_2;
  reg main_stage_0_3;
  reg reg_CGHpart_irsig_cse;
  reg [31:0] reg_t_mul_cmp_a_cse;
  wire and_4_cse;
  wire and_8_cse;
  wire t_or_rmff;
  reg main_stage_0_5;
  reg main_stage_0_6;
  reg [31:0] p_buf_sva_1;
  reg [31:0] p_buf_sva_2;
  reg [31:0] p_buf_sva_3;
  reg [31:0] p_buf_sva_5;
  reg [31:0] p_buf_sva_6;
  reg [31:0] res_sva_1;
  reg [31:0] z_asn_itm_1;
  reg [31:0] z_asn_itm_2;
  reg [31:0] z_asn_itm_3;
  reg asn_itm_4;
  reg asn_itm_5;
  wire [31:0] res_sva_3;
  wire [32:0] nl_res_sva_3;
  wire res_and_cse;
  wire p_and_2_cse;
  wire p_and_1_cse;
  wire if_acc_1_itm_32_1;

  wire[31:0] if_acc_nl;
  wire[32:0] nl_if_acc_nl;
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
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd64),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) t_mul_cmp (
      .a(x_rsci_idat),
      .b(y_rsci_idat_1),
      .clk(ccs_ccore_clk),
      .en(t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(ccs_ccore_srst),
      .z(t_mul_cmp_z)
    );
  mult_core_wait_dp mult_core_wait_dp_inst (
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_en(ccs_ccore_en),
      .ensig_cgo_iro(t_or_rmff),
      .z_mul_cmp_z(z_mul_cmp_z),
      .z_mul_cmp_1_z(z_mul_cmp_1_z),
      .ensig_cgo(reg_CGHpart_irsig_cse),
      .t_mul_cmp_en(t_mul_cmp_en),
      .z_mul_cmp_z_oreg(z_mul_cmp_z_oreg),
      .z_mul_cmp_1_z_oreg(z_mul_cmp_1_z_oreg)
    );
  assign res_and_cse = ccs_ccore_en & and_dcpl;
  assign p_and_1_cse = ccs_ccore_en & and_8_cse;
  assign t_or_rmff = and_8_cse | and_4_cse | ccs_ccore_start_rsci_idat;
  assign z_mul_cmp_a = reg_t_mul_cmp_a_cse;
  assign p_and_2_cse = ccs_ccore_en & main_stage_0_5 & asn_itm_4;
  assign and_4_cse = main_stage_0_2 & asn_itm_1;
  assign nl_res_sva_3 = z_asn_itm_3 - z_mul_cmp_1_z_oreg;
  assign res_sva_3 = nl_res_sva_3[31:0];
  assign nl_if_acc_1_nl = ({1'b1 , res_sva_3}) + conv_u2u_32_33(~ p_buf_sva_5) +
      33'b000000000000000000000000000000001;
  assign if_acc_1_nl = nl_if_acc_1_nl[32:0];
  assign if_acc_1_itm_32_1 = readslicef_33_1_32(if_acc_1_nl);
  assign and_8_cse = main_stage_0_3 & asn_itm_2;
  assign and_dcpl = main_stage_0_6 & asn_itm_5;
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(if_acc_nl, res_sva_1, slc_32_svs_1);
      z_mul_cmp_1_b <= p_buf_sva_3;
      z_mul_cmp_1_a <= t_mul_cmp_z[63:32];
      reg_t_mul_cmp_a_cse <= x_rsci_idat;
      z_mul_cmp_b <= y_rsci_idat;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      asn_itm_5 <= 1'b0;
      asn_itm_3 <= 1'b0;
      reg_CGHpart_irsig_cse <= 1'b0;
      asn_itm_2 <= 1'b0;
      asn_itm_1 <= 1'b0;
      main_stage_0_2 <= 1'b0;
      main_stage_0_3 <= 1'b0;
      main_stage_0_4 <= 1'b0;
      main_stage_0_6 <= 1'b0;
      asn_itm_4 <= 1'b0;
      main_stage_0_5 <= 1'b0;
    end
    else if ( ccs_ccore_en ) begin
      asn_itm_5 <= asn_itm_4;
      asn_itm_3 <= asn_itm_2;
      reg_CGHpart_irsig_cse <= t_or_rmff;
      asn_itm_2 <= asn_itm_1;
      asn_itm_1 <= ccs_ccore_start_rsci_idat;
      main_stage_0_2 <= 1'b1;
      main_stage_0_3 <= main_stage_0_2;
      main_stage_0_4 <= main_stage_0_3;
      main_stage_0_6 <= main_stage_0_5;
      asn_itm_4 <= asn_itm_3;
      main_stage_0_5 <= main_stage_0_4;
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
      p_buf_sva_6 <= p_buf_sva_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( p_and_1_cse ) begin
      p_buf_sva_3 <= p_buf_sva_2;
      z_asn_itm_1 <= z_mul_cmp_z_oreg;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( p_and_2_cse ) begin
      p_buf_sva_5 <= z_mul_cmp_1_b;
      z_asn_itm_3 <= z_asn_itm_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & and_4_cse ) begin
      p_buf_sva_2 <= p_buf_sva_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & main_stage_0_4 & asn_itm_3 ) begin
      z_asn_itm_2 <= z_asn_itm_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & ccs_ccore_start_rsci_idat ) begin
      p_buf_sva_1 <= p_rsci_idat;
    end
  end
  assign nl_if_acc_nl = res_sva_1 - p_buf_sva_6;
  assign if_acc_nl = nl_if_acc_nl[31:0];

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
  wire [31:0] z_mul_cmp_a;
  wire [31:0] z_mul_cmp_b;
  wire [31:0] z_mul_cmp_1_a;
  wire [31:0] z_mul_cmp_1_b;


  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_mult_core_inst_z_mul_cmp_z;
  assign nl_mult_core_inst_z_mul_cmp_z = conv_u2u_64_32(z_mul_cmp_a * z_mul_cmp_b);
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
      .z_mul_cmp_a(z_mul_cmp_a),
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

endmodule




//------> ../td_ccore_solutions/modulo_sub_ed27d2fff96cb4632dc7a010bcf5d2a46373_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 19:11:43 2021
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




//------> ../td_ccore_solutions/modulo_add_ea1ef4719f519926e0422f22d3282e1f60ea_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 19:11:44 2021
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
//  Generated date: Mon Sep 13 19:12:08 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_23_9_32_512_512_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_23_9_32_512_512_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [8:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [8:0] adra;
  input [17:0] adra_d;
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
  assign adrb = (adra_d[17:9]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[8:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_22_9_32_512_512_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_22_9_32_512_512_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [8:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [8:0] adra;
  input [17:0] adra_d;
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
  assign adrb = (adra_d[17:9]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[8:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_17_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_17_10_32_1024_1024_32_1_gen
    (
  qb, adrb, adrb_d, qb_d, readB_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] qb;
  output [9:0] adrb;
  input [9:0] adrb_d;
  output [31:0] qb_d;
  input readB_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qb_d = qb;
  assign adrb = (adrb_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_16_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_16_10_32_1024_1024_32_1_gen
    (
  qb, adrb, adrb_d, qb_d, readB_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] qb;
  output [9:0] adrb;
  input [9:0] adrb_d;
  output [31:0] qb_d;
  input readB_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qb_d = qb;
  assign adrb = (adrb_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_core_fsm (
  clk, rst, complete_rsci_wen_comp, fsm_output, main_C_0_tr0, COMP_LOOP_1_VEC_LOOP_C_11_tr0,
      COMP_LOOP_C_4_tr0, COMP_LOOP_2_VEC_LOOP_C_11_tr0, COMP_LOOP_C_5_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input complete_rsci_wen_comp;
  output [34:0] fsm_output;
  reg [34:0] fsm_output;
  input main_C_0_tr0;
  input COMP_LOOP_1_VEC_LOOP_C_11_tr0;
  input COMP_LOOP_C_4_tr0;
  input COMP_LOOP_2_VEC_LOOP_C_11_tr0;
  input COMP_LOOP_C_5_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIF_precomp_core_core_fsm_1
  parameter
    main_C_0 = 6'd0,
    STAGE_LOOP_C_0 = 6'd1,
    COMP_LOOP_C_0 = 6'd2,
    COMP_LOOP_C_1 = 6'd3,
    COMP_LOOP_C_2 = 6'd4,
    COMP_LOOP_C_3 = 6'd5,
    COMP_LOOP_1_VEC_LOOP_C_0 = 6'd6,
    COMP_LOOP_1_VEC_LOOP_C_1 = 6'd7,
    COMP_LOOP_1_VEC_LOOP_C_2 = 6'd8,
    COMP_LOOP_1_VEC_LOOP_C_3 = 6'd9,
    COMP_LOOP_1_VEC_LOOP_C_4 = 6'd10,
    COMP_LOOP_1_VEC_LOOP_C_5 = 6'd11,
    COMP_LOOP_1_VEC_LOOP_C_6 = 6'd12,
    COMP_LOOP_1_VEC_LOOP_C_7 = 6'd13,
    COMP_LOOP_1_VEC_LOOP_C_8 = 6'd14,
    COMP_LOOP_1_VEC_LOOP_C_9 = 6'd15,
    COMP_LOOP_1_VEC_LOOP_C_10 = 6'd16,
    COMP_LOOP_1_VEC_LOOP_C_11 = 6'd17,
    COMP_LOOP_C_4 = 6'd18,
    COMP_LOOP_2_VEC_LOOP_C_0 = 6'd19,
    COMP_LOOP_2_VEC_LOOP_C_1 = 6'd20,
    COMP_LOOP_2_VEC_LOOP_C_2 = 6'd21,
    COMP_LOOP_2_VEC_LOOP_C_3 = 6'd22,
    COMP_LOOP_2_VEC_LOOP_C_4 = 6'd23,
    COMP_LOOP_2_VEC_LOOP_C_5 = 6'd24,
    COMP_LOOP_2_VEC_LOOP_C_6 = 6'd25,
    COMP_LOOP_2_VEC_LOOP_C_7 = 6'd26,
    COMP_LOOP_2_VEC_LOOP_C_8 = 6'd27,
    COMP_LOOP_2_VEC_LOOP_C_9 = 6'd28,
    COMP_LOOP_2_VEC_LOOP_C_10 = 6'd29,
    COMP_LOOP_2_VEC_LOOP_C_11 = 6'd30,
    COMP_LOOP_C_5 = 6'd31,
    STAGE_LOOP_C_1 = 6'd32,
    main_C_1 = 6'd33,
    main_C_2 = 6'd34;

  reg [5:0] state_var;
  reg [5:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIF_precomp_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 35'b00000000000000000000000000000000010;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 35'b00000000000000000000000000000000100;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 35'b00000000000000000000000000000001000;
        state_var_NS = COMP_LOOP_C_2;
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 35'b00000000000000000000000000000010000;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 35'b00000000000000000000000000000100000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
      end
      COMP_LOOP_1_VEC_LOOP_C_0 : begin
        fsm_output = 35'b00000000000000000000000000001000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_1;
      end
      COMP_LOOP_1_VEC_LOOP_C_1 : begin
        fsm_output = 35'b00000000000000000000000000010000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_2;
      end
      COMP_LOOP_1_VEC_LOOP_C_2 : begin
        fsm_output = 35'b00000000000000000000000000100000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_3;
      end
      COMP_LOOP_1_VEC_LOOP_C_3 : begin
        fsm_output = 35'b00000000000000000000000001000000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_4;
      end
      COMP_LOOP_1_VEC_LOOP_C_4 : begin
        fsm_output = 35'b00000000000000000000000010000000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_5;
      end
      COMP_LOOP_1_VEC_LOOP_C_5 : begin
        fsm_output = 35'b00000000000000000000000100000000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_6;
      end
      COMP_LOOP_1_VEC_LOOP_C_6 : begin
        fsm_output = 35'b00000000000000000000001000000000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_7;
      end
      COMP_LOOP_1_VEC_LOOP_C_7 : begin
        fsm_output = 35'b00000000000000000000010000000000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_8;
      end
      COMP_LOOP_1_VEC_LOOP_C_8 : begin
        fsm_output = 35'b00000000000000000000100000000000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_9;
      end
      COMP_LOOP_1_VEC_LOOP_C_9 : begin
        fsm_output = 35'b00000000000000000001000000000000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_10;
      end
      COMP_LOOP_1_VEC_LOOP_C_10 : begin
        fsm_output = 35'b00000000000000000010000000000000000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_11;
      end
      COMP_LOOP_1_VEC_LOOP_C_11 : begin
        fsm_output = 35'b00000000000000000100000000000000000;
        if ( COMP_LOOP_1_VEC_LOOP_C_11_tr0 ) begin
          state_var_NS = COMP_LOOP_C_4;
        end
        else begin
          state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 35'b00000000000000001000000000000000000;
        if ( COMP_LOOP_C_4_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_2_VEC_LOOP_C_0 : begin
        fsm_output = 35'b00000000000000010000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_1;
      end
      COMP_LOOP_2_VEC_LOOP_C_1 : begin
        fsm_output = 35'b00000000000000100000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_2;
      end
      COMP_LOOP_2_VEC_LOOP_C_2 : begin
        fsm_output = 35'b00000000000001000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_3;
      end
      COMP_LOOP_2_VEC_LOOP_C_3 : begin
        fsm_output = 35'b00000000000010000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_4;
      end
      COMP_LOOP_2_VEC_LOOP_C_4 : begin
        fsm_output = 35'b00000000000100000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_5;
      end
      COMP_LOOP_2_VEC_LOOP_C_5 : begin
        fsm_output = 35'b00000000001000000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_6;
      end
      COMP_LOOP_2_VEC_LOOP_C_6 : begin
        fsm_output = 35'b00000000010000000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_7;
      end
      COMP_LOOP_2_VEC_LOOP_C_7 : begin
        fsm_output = 35'b00000000100000000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_8;
      end
      COMP_LOOP_2_VEC_LOOP_C_8 : begin
        fsm_output = 35'b00000001000000000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_9;
      end
      COMP_LOOP_2_VEC_LOOP_C_9 : begin
        fsm_output = 35'b00000010000000000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_10;
      end
      COMP_LOOP_2_VEC_LOOP_C_10 : begin
        fsm_output = 35'b00000100000000000000000000000000000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_11;
      end
      COMP_LOOP_2_VEC_LOOP_C_11 : begin
        fsm_output = 35'b00001000000000000000000000000000000;
        if ( COMP_LOOP_2_VEC_LOOP_C_11_tr0 ) begin
          state_var_NS = COMP_LOOP_C_5;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 35'b00010000000000000000000000000000000;
        if ( COMP_LOOP_C_5_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 35'b00100000000000000000000000000000000;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 35'b01000000000000000000000000000000000;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 35'b10000000000000000000000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 35'b00000000000000000000000000000000001;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp (
  clk, rst, vec_rsc_0_1_i_da_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_1_i_da_d_core, vec_rsc_0_1_i_qa_d_mxwt,
      vec_rsc_0_1_i_biwt, vec_rsc_0_1_i_bdwt, vec_rsc_0_1_i_biwt_1, vec_rsc_0_1_i_bdwt_2
);
  input clk;
  input rst;
  output [31:0] vec_rsc_0_1_i_da_d;
  input [63:0] vec_rsc_0_1_i_qa_d;
  input [63:0] vec_rsc_0_1_i_da_d_core;
  output [63:0] vec_rsc_0_1_i_qa_d_mxwt;
  input vec_rsc_0_1_i_biwt;
  input vec_rsc_0_1_i_bdwt;
  input vec_rsc_0_1_i_biwt_1;
  input vec_rsc_0_1_i_bdwt_2;


  // Interconnect Declarations
  reg vec_rsc_0_1_i_bcwt;
  reg vec_rsc_0_1_i_bcwt_1;
  reg [31:0] vec_rsc_0_1_i_qa_d_bfwt_63_32;
  reg [31:0] vec_rsc_0_1_i_qa_d_bfwt_31_0;

  wire[31:0] VEC_LOOP_mux_6_nl;
  wire[31:0] VEC_LOOP_mux_7_nl;

  // Interconnect Declarations for Component Instantiations 
  assign VEC_LOOP_mux_6_nl = MUX_v_32_2_2((vec_rsc_0_1_i_qa_d[63:32]), vec_rsc_0_1_i_qa_d_bfwt_63_32,
      vec_rsc_0_1_i_bcwt_1);
  assign VEC_LOOP_mux_7_nl = MUX_v_32_2_2((vec_rsc_0_1_i_qa_d[31:0]), vec_rsc_0_1_i_qa_d_bfwt_31_0,
      vec_rsc_0_1_i_bcwt);
  assign vec_rsc_0_1_i_qa_d_mxwt = {VEC_LOOP_mux_6_nl , VEC_LOOP_mux_7_nl};
  assign vec_rsc_0_1_i_da_d = vec_rsc_0_1_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_1_i_bcwt <= 1'b0;
      vec_rsc_0_1_i_bcwt_1 <= 1'b0;
    end
    else begin
      vec_rsc_0_1_i_bcwt <= ~((~(vec_rsc_0_1_i_bcwt | vec_rsc_0_1_i_biwt)) | vec_rsc_0_1_i_bdwt);
      vec_rsc_0_1_i_bcwt_1 <= ~((~(vec_rsc_0_1_i_bcwt_1 | vec_rsc_0_1_i_biwt_1))
          | vec_rsc_0_1_i_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_1_i_biwt_1 ) begin
      vec_rsc_0_1_i_qa_d_bfwt_63_32 <= vec_rsc_0_1_i_qa_d[63:32];
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_1_i_biwt ) begin
      vec_rsc_0_1_i_qa_d_bfwt_31_0 <= vec_rsc_0_1_i_qa_d[31:0];
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
  core_wen, core_wten, vec_rsc_0_1_i_oswt, vec_rsc_0_1_i_oswt_1, vec_rsc_0_1_i_wea_d_core_psct,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct,
      vec_rsc_0_1_i_biwt, vec_rsc_0_1_i_bdwt, vec_rsc_0_1_i_biwt_1, vec_rsc_0_1_i_bdwt_2,
      vec_rsc_0_1_i_wea_d_core_sct, vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, core_wten_pff, vec_rsc_0_1_i_oswt_pff,
      vec_rsc_0_1_i_oswt_1_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_1_i_oswt;
  input vec_rsc_0_1_i_oswt_1;
  input [1:0] vec_rsc_0_1_i_wea_d_core_psct;
  input [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output vec_rsc_0_1_i_biwt;
  output vec_rsc_0_1_i_bdwt;
  output vec_rsc_0_1_i_biwt_1;
  output vec_rsc_0_1_i_bdwt_2;
  output [1:0] vec_rsc_0_1_i_wea_d_core_sct;
  output [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input core_wten_pff;
  input vec_rsc_0_1_i_oswt_pff;
  input vec_rsc_0_1_i_oswt_1_pff;


  // Interconnect Declarations
  wire vec_rsc_0_1_i_dswt_pff;

  wire[0:0] VEC_LOOP_and_19_nl;
  wire[0:0] VEC_LOOP_and_23_nl;
  wire[0:0] VEC_LOOP_and_21_nl;

  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_1_i_bdwt = vec_rsc_0_1_i_oswt & core_wen;
  assign vec_rsc_0_1_i_biwt = (~ core_wten) & vec_rsc_0_1_i_oswt;
  assign vec_rsc_0_1_i_bdwt_2 = vec_rsc_0_1_i_oswt_1 & core_wen;
  assign vec_rsc_0_1_i_biwt_1 = (~ core_wten) & vec_rsc_0_1_i_oswt_1;
  assign VEC_LOOP_and_19_nl = (vec_rsc_0_1_i_wea_d_core_psct[0]) & vec_rsc_0_1_i_dswt_pff;
  assign vec_rsc_0_1_i_wea_d_core_sct = {1'b0 , VEC_LOOP_and_19_nl};
  assign vec_rsc_0_1_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_1_i_oswt_pff;
  assign VEC_LOOP_and_23_nl = (~ core_wten_pff) & vec_rsc_0_1_i_oswt_1_pff;
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      & ({VEC_LOOP_and_23_nl , vec_rsc_0_1_i_dswt_pff});
  assign VEC_LOOP_and_21_nl = (vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & vec_rsc_0_1_i_dswt_pff;
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , VEC_LOOP_and_21_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp (
  clk, rst, vec_rsc_0_0_i_da_d, vec_rsc_0_0_i_qa_d, vec_rsc_0_0_i_da_d_core, vec_rsc_0_0_i_qa_d_mxwt,
      vec_rsc_0_0_i_biwt, vec_rsc_0_0_i_bdwt, vec_rsc_0_0_i_biwt_1, vec_rsc_0_0_i_bdwt_2
);
  input clk;
  input rst;
  output [31:0] vec_rsc_0_0_i_da_d;
  input [63:0] vec_rsc_0_0_i_qa_d;
  input [63:0] vec_rsc_0_0_i_da_d_core;
  output [63:0] vec_rsc_0_0_i_qa_d_mxwt;
  input vec_rsc_0_0_i_biwt;
  input vec_rsc_0_0_i_bdwt;
  input vec_rsc_0_0_i_biwt_1;
  input vec_rsc_0_0_i_bdwt_2;


  // Interconnect Declarations
  reg vec_rsc_0_0_i_bcwt;
  reg vec_rsc_0_0_i_bcwt_1;
  reg [31:0] vec_rsc_0_0_i_qa_d_bfwt_63_32;
  reg [31:0] vec_rsc_0_0_i_qa_d_bfwt_31_0;

  wire[31:0] VEC_LOOP_mux_2_nl;
  wire[31:0] VEC_LOOP_mux_3_nl;

  // Interconnect Declarations for Component Instantiations 
  assign VEC_LOOP_mux_2_nl = MUX_v_32_2_2((vec_rsc_0_0_i_qa_d[63:32]), vec_rsc_0_0_i_qa_d_bfwt_63_32,
      vec_rsc_0_0_i_bcwt_1);
  assign VEC_LOOP_mux_3_nl = MUX_v_32_2_2((vec_rsc_0_0_i_qa_d[31:0]), vec_rsc_0_0_i_qa_d_bfwt_31_0,
      vec_rsc_0_0_i_bcwt);
  assign vec_rsc_0_0_i_qa_d_mxwt = {VEC_LOOP_mux_2_nl , VEC_LOOP_mux_3_nl};
  assign vec_rsc_0_0_i_da_d = vec_rsc_0_0_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_0_i_bcwt <= 1'b0;
      vec_rsc_0_0_i_bcwt_1 <= 1'b0;
    end
    else begin
      vec_rsc_0_0_i_bcwt <= ~((~(vec_rsc_0_0_i_bcwt | vec_rsc_0_0_i_biwt)) | vec_rsc_0_0_i_bdwt);
      vec_rsc_0_0_i_bcwt_1 <= ~((~(vec_rsc_0_0_i_bcwt_1 | vec_rsc_0_0_i_biwt_1))
          | vec_rsc_0_0_i_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_0_i_biwt_1 ) begin
      vec_rsc_0_0_i_qa_d_bfwt_63_32 <= vec_rsc_0_0_i_qa_d[63:32];
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_0_i_biwt ) begin
      vec_rsc_0_0_i_qa_d_bfwt_31_0 <= vec_rsc_0_0_i_qa_d[31:0];
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
  core_wen, core_wten, vec_rsc_0_0_i_oswt, vec_rsc_0_0_i_oswt_1, vec_rsc_0_0_i_wea_d_core_psct,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct,
      vec_rsc_0_0_i_biwt, vec_rsc_0_0_i_bdwt, vec_rsc_0_0_i_biwt_1, vec_rsc_0_0_i_bdwt_2,
      vec_rsc_0_0_i_wea_d_core_sct, vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, core_wten_pff, vec_rsc_0_0_i_oswt_pff,
      vec_rsc_0_0_i_oswt_1_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_0_i_oswt;
  input vec_rsc_0_0_i_oswt_1;
  input [1:0] vec_rsc_0_0_i_wea_d_core_psct;
  input [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output vec_rsc_0_0_i_biwt;
  output vec_rsc_0_0_i_bdwt;
  output vec_rsc_0_0_i_biwt_1;
  output vec_rsc_0_0_i_bdwt_2;
  output [1:0] vec_rsc_0_0_i_wea_d_core_sct;
  output [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input core_wten_pff;
  input vec_rsc_0_0_i_oswt_pff;
  input vec_rsc_0_0_i_oswt_1_pff;


  // Interconnect Declarations
  wire vec_rsc_0_0_i_dswt_pff;

  wire[0:0] VEC_LOOP_and_8_nl;
  wire[0:0] VEC_LOOP_and_12_nl;
  wire[0:0] VEC_LOOP_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_0_i_bdwt = vec_rsc_0_0_i_oswt & core_wen;
  assign vec_rsc_0_0_i_biwt = (~ core_wten) & vec_rsc_0_0_i_oswt;
  assign vec_rsc_0_0_i_bdwt_2 = vec_rsc_0_0_i_oswt_1 & core_wen;
  assign vec_rsc_0_0_i_biwt_1 = (~ core_wten) & vec_rsc_0_0_i_oswt_1;
  assign VEC_LOOP_and_8_nl = (vec_rsc_0_0_i_wea_d_core_psct[0]) & vec_rsc_0_0_i_dswt_pff;
  assign vec_rsc_0_0_i_wea_d_core_sct = {1'b0 , VEC_LOOP_and_8_nl};
  assign vec_rsc_0_0_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_0_i_oswt_pff;
  assign VEC_LOOP_and_12_nl = (~ core_wten_pff) & vec_rsc_0_0_i_oswt_1_pff;
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      & ({VEC_LOOP_and_12_nl , vec_rsc_0_0_i_dswt_pff});
  assign VEC_LOOP_and_10_nl = (vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & vec_rsc_0_0_i_dswt_pff;
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , VEC_LOOP_and_10_nl};
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
  clk, rst, twiddle_h_rsci_qb_d, twiddle_h_rsci_qb_d_mxwt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt
);
  input clk;
  input rst;
  input [31:0] twiddle_h_rsci_qb_d;
  output [31:0] twiddle_h_rsci_qb_d_mxwt;
  input twiddle_h_rsci_biwt;
  input twiddle_h_rsci_bdwt;


  // Interconnect Declarations
  reg twiddle_h_rsci_bcwt;
  reg [31:0] twiddle_h_rsci_qb_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_qb_d_mxwt = MUX_v_32_2_2(twiddle_h_rsci_qb_d, twiddle_h_rsci_qb_d_bfwt,
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
      twiddle_h_rsci_qb_d_bfwt <= twiddle_h_rsci_qb_d;
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
      twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct, twiddle_h_rsci_oswt_pff,
      core_wten_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  output twiddle_h_rsci_biwt;
  output twiddle_h_rsci_bdwt;
  output twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;
  input twiddle_h_rsci_oswt_pff;
  input core_wten_pff;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_bdwt = twiddle_h_rsci_oswt & core_wen;
  assign twiddle_h_rsci_biwt = (~ core_wten) & twiddle_h_rsci_oswt;
  assign twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct = twiddle_h_rsci_oswt_pff
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_qb_d, twiddle_rsci_qb_d_mxwt, twiddle_rsci_biwt, twiddle_rsci_bdwt
);
  input clk;
  input rst;
  input [31:0] twiddle_rsci_qb_d;
  output [31:0] twiddle_rsci_qb_d_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;


  // Interconnect Declarations
  reg twiddle_rsci_bcwt;
  reg [31:0] twiddle_rsci_qb_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_qb_d_mxwt = MUX_v_32_2_2(twiddle_rsci_qb_d, twiddle_rsci_qb_d_bfwt,
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
      twiddle_rsci_qb_d_bfwt <= twiddle_rsci_qb_d;
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
  core_wen, core_wten, twiddle_rsci_oswt, twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct,
      twiddle_rsci_oswt_pff, core_wten_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  output twiddle_rsci_biwt;
  output twiddle_rsci_bdwt;
  output twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;
  input twiddle_rsci_oswt_pff;
  input core_wten_pff;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_bdwt = twiddle_rsci_oswt & core_wen;
  assign twiddle_rsci_biwt = (~ core_wten) & twiddle_rsci_oswt;
  assign twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct = twiddle_rsci_oswt_pff
      & (~ core_wten_pff);
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1 (
  clk, rst, vec_rsc_0_1_i_da_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_1_i_wea_d, vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d, core_wen, core_wten, vec_rsc_0_1_i_oswt,
      vec_rsc_0_1_i_oswt_1, vec_rsc_0_1_i_da_d_core, vec_rsc_0_1_i_qa_d_mxwt, vec_rsc_0_1_i_wea_d_core_psct,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct,
      core_wten_pff, vec_rsc_0_1_i_oswt_pff, vec_rsc_0_1_i_oswt_1_pff
);
  input clk;
  input rst;
  output [31:0] vec_rsc_0_1_i_da_d;
  input [63:0] vec_rsc_0_1_i_qa_d;
  output [1:0] vec_rsc_0_1_i_wea_d;
  output [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_1_i_oswt;
  input vec_rsc_0_1_i_oswt_1;
  input [63:0] vec_rsc_0_1_i_da_d_core;
  output [63:0] vec_rsc_0_1_i_qa_d_mxwt;
  input [1:0] vec_rsc_0_1_i_wea_d_core_psct;
  input [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input core_wten_pff;
  input vec_rsc_0_1_i_oswt_pff;
  input vec_rsc_0_1_i_oswt_1_pff;


  // Interconnect Declarations
  wire vec_rsc_0_1_i_biwt;
  wire vec_rsc_0_1_i_bdwt;
  wire vec_rsc_0_1_i_biwt_1;
  wire vec_rsc_0_1_i_bdwt_2;
  wire [1:0] vec_rsc_0_1_i_wea_d_core_sct;
  wire [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] vec_rsc_0_1_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl_inst_vec_rsc_0_1_i_wea_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl_inst_vec_rsc_0_1_i_wea_d_core_psct
      = {1'b0 , (vec_rsc_0_1_i_wea_d_core_psct[0])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [63:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp_inst_vec_rsc_0_1_i_da_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp_inst_vec_rsc_0_1_i_da_d_core
      = {32'b00000000000000000000000000000000 , (vec_rsc_0_1_i_da_d_core[31:0])};
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_1_i_oswt(vec_rsc_0_1_i_oswt),
      .vec_rsc_0_1_i_oswt_1(vec_rsc_0_1_i_oswt_1),
      .vec_rsc_0_1_i_wea_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl_inst_vec_rsc_0_1_i_wea_d_core_psct[1:0]),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .vec_rsc_0_1_i_biwt(vec_rsc_0_1_i_biwt),
      .vec_rsc_0_1_i_bdwt(vec_rsc_0_1_i_bdwt),
      .vec_rsc_0_1_i_biwt_1(vec_rsc_0_1_i_biwt_1),
      .vec_rsc_0_1_i_bdwt_2(vec_rsc_0_1_i_bdwt_2),
      .vec_rsc_0_1_i_wea_d_core_sct(vec_rsc_0_1_i_wea_d_core_sct),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_1_i_oswt_pff(vec_rsc_0_1_i_oswt_pff),
      .vec_rsc_0_1_i_oswt_1_pff(vec_rsc_0_1_i_oswt_1_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_1_i_da_d(vec_rsc_0_1_i_da_d_reg),
      .vec_rsc_0_1_i_qa_d(vec_rsc_0_1_i_qa_d),
      .vec_rsc_0_1_i_da_d_core(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp_inst_vec_rsc_0_1_i_da_d_core[63:0]),
      .vec_rsc_0_1_i_qa_d_mxwt(vec_rsc_0_1_i_qa_d_mxwt),
      .vec_rsc_0_1_i_biwt(vec_rsc_0_1_i_biwt),
      .vec_rsc_0_1_i_bdwt(vec_rsc_0_1_i_bdwt),
      .vec_rsc_0_1_i_biwt_1(vec_rsc_0_1_i_biwt_1),
      .vec_rsc_0_1_i_bdwt_2(vec_rsc_0_1_i_bdwt_2)
    );
  assign vec_rsc_0_1_i_wea_d = vec_rsc_0_1_i_wea_d_core_sct;
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign vec_rsc_0_1_i_da_d = vec_rsc_0_1_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1 (
  clk, rst, vec_rsc_0_0_i_da_d, vec_rsc_0_0_i_qa_d, vec_rsc_0_0_i_wea_d, vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d, core_wen, core_wten, vec_rsc_0_0_i_oswt,
      vec_rsc_0_0_i_oswt_1, vec_rsc_0_0_i_da_d_core, vec_rsc_0_0_i_qa_d_mxwt, vec_rsc_0_0_i_wea_d_core_psct,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct,
      core_wten_pff, vec_rsc_0_0_i_oswt_pff, vec_rsc_0_0_i_oswt_1_pff
);
  input clk;
  input rst;
  output [31:0] vec_rsc_0_0_i_da_d;
  input [63:0] vec_rsc_0_0_i_qa_d;
  output [1:0] vec_rsc_0_0_i_wea_d;
  output [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_0_i_oswt;
  input vec_rsc_0_0_i_oswt_1;
  input [63:0] vec_rsc_0_0_i_da_d_core;
  output [63:0] vec_rsc_0_0_i_qa_d_mxwt;
  input [1:0] vec_rsc_0_0_i_wea_d_core_psct;
  input [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input core_wten_pff;
  input vec_rsc_0_0_i_oswt_pff;
  input vec_rsc_0_0_i_oswt_1_pff;


  // Interconnect Declarations
  wire vec_rsc_0_0_i_biwt;
  wire vec_rsc_0_0_i_bdwt;
  wire vec_rsc_0_0_i_biwt_1;
  wire vec_rsc_0_0_i_bdwt_2;
  wire [1:0] vec_rsc_0_0_i_wea_d_core_sct;
  wire [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] vec_rsc_0_0_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl_inst_vec_rsc_0_0_i_wea_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl_inst_vec_rsc_0_0_i_wea_d_core_psct
      = {1'b0 , (vec_rsc_0_0_i_wea_d_core_psct[0])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [63:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp_inst_vec_rsc_0_0_i_da_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp_inst_vec_rsc_0_0_i_da_d_core
      = {32'b00000000000000000000000000000000 , (vec_rsc_0_0_i_da_d_core[31:0])};
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_0_i_oswt(vec_rsc_0_0_i_oswt),
      .vec_rsc_0_0_i_oswt_1(vec_rsc_0_0_i_oswt_1),
      .vec_rsc_0_0_i_wea_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl_inst_vec_rsc_0_0_i_wea_d_core_psct[1:0]),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .vec_rsc_0_0_i_biwt(vec_rsc_0_0_i_biwt),
      .vec_rsc_0_0_i_bdwt(vec_rsc_0_0_i_bdwt),
      .vec_rsc_0_0_i_biwt_1(vec_rsc_0_0_i_biwt_1),
      .vec_rsc_0_0_i_bdwt_2(vec_rsc_0_0_i_bdwt_2),
      .vec_rsc_0_0_i_wea_d_core_sct(vec_rsc_0_0_i_wea_d_core_sct),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_0_i_oswt_pff(vec_rsc_0_0_i_oswt_pff),
      .vec_rsc_0_0_i_oswt_1_pff(vec_rsc_0_0_i_oswt_1_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_0_i_da_d(vec_rsc_0_0_i_da_d_reg),
      .vec_rsc_0_0_i_qa_d(vec_rsc_0_0_i_qa_d),
      .vec_rsc_0_0_i_da_d_core(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp_inst_vec_rsc_0_0_i_da_d_core[63:0]),
      .vec_rsc_0_0_i_qa_d_mxwt(vec_rsc_0_0_i_qa_d_mxwt),
      .vec_rsc_0_0_i_biwt(vec_rsc_0_0_i_biwt),
      .vec_rsc_0_0_i_bdwt(vec_rsc_0_0_i_bdwt),
      .vec_rsc_0_0_i_biwt_1(vec_rsc_0_0_i_biwt_1),
      .vec_rsc_0_0_i_bdwt_2(vec_rsc_0_0_i_bdwt_2)
    );
  assign vec_rsc_0_0_i_wea_d = vec_rsc_0_0_i_wea_d_core_sct;
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign vec_rsc_0_0_i_da_d = vec_rsc_0_0_i_da_d_reg;
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
  clk, rst, twiddle_h_rsci_qb_d, twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_qb_d_mxwt, twiddle_h_rsci_oswt_pff,
      core_wten_pff
);
  input clk;
  input rst;
  input [31:0] twiddle_h_rsci_qb_d;
  output twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  output [31:0] twiddle_h_rsci_qb_d_mxwt;
  input twiddle_h_rsci_oswt_pff;
  input core_wten_pff;


  // Interconnect Declarations
  wire twiddle_h_rsci_biwt;
  wire twiddle_h_rsci_bdwt;
  wire twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct),
      .twiddle_h_rsci_oswt_pff(twiddle_h_rsci_oswt_pff),
      .core_wten_pff(core_wten_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_qb_d(twiddle_h_rsci_qb_d),
      .twiddle_h_rsci_qb_d_mxwt(twiddle_h_rsci_qb_d_mxwt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt)
    );
  assign twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 (
  clk, rst, twiddle_rsci_qb_d, twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, twiddle_rsci_oswt, twiddle_rsci_qb_d_mxwt, twiddle_rsci_oswt_pff,
      core_wten_pff
);
  input clk;
  input rst;
  input [31:0] twiddle_rsci_qb_d;
  output twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  output [31:0] twiddle_rsci_qb_d_mxwt;
  input twiddle_rsci_oswt_pff;
  input core_wten_pff;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct),
      .twiddle_rsci_oswt_pff(twiddle_rsci_oswt_pff),
      .core_wten_pff(core_wten_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_qb_d(twiddle_rsci_qb_d),
      .twiddle_rsci_qb_d_mxwt(twiddle_rsci_qb_d_mxwt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt)
    );
  assign twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d = twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;
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
  clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz,
      p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz, twiddle_rsc_triosy_lz, twiddle_h_rsc_triosy_lz,
      complete_rsc_rdy, complete_rsc_vld, twiddle_rsci_adrb_d, twiddle_rsci_qb_d,
      twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d, twiddle_h_rsci_adrb_d, twiddle_h_rsci_qb_d,
      twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_0_i_adra_d, vec_rsc_0_0_i_da_d,
      vec_rsc_0_0_i_qa_d, vec_rsc_0_0_i_wea_d, vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d, vec_rsc_0_1_i_adra_d, vec_rsc_0_1_i_da_d,
      vec_rsc_0_1_i_qa_d, vec_rsc_0_1_i_wea_d, vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output vec_rsc_triosy_0_0_lz;
  output vec_rsc_triosy_0_1_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;
  output [9:0] twiddle_rsci_adrb_d;
  input [31:0] twiddle_rsci_qb_d;
  output twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  output [9:0] twiddle_h_rsci_adrb_d;
  input [31:0] twiddle_h_rsci_qb_d;
  output twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  output [17:0] vec_rsc_0_0_i_adra_d;
  output [31:0] vec_rsc_0_0_i_da_d;
  input [63:0] vec_rsc_0_0_i_qa_d;
  output [1:0] vec_rsc_0_0_i_wea_d;
  output [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [17:0] vec_rsc_0_1_i_adra_d;
  output [31:0] vec_rsc_0_1_i_da_d;
  input [63:0] vec_rsc_0_1_i_qa_d;
  output [1:0] vec_rsc_0_1_i_wea_d;
  output [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;


  // Interconnect Declarations
  wire core_wten;
  wire run_rsci_ivld_mxwt;
  wire [31:0] p_rsci_idat;
  wire [31:0] twiddle_rsci_qb_d_mxwt;
  wire [31:0] twiddle_h_rsci_qb_d_mxwt;
  wire complete_rsci_wen_comp;
  wire [63:0] vec_rsc_0_0_i_qa_d_mxwt;
  wire [63:0] vec_rsc_0_1_i_qa_d_mxwt;
  wire [31:0] COMP_LOOP_1_mult_cmp_return_rsc_z;
  wire COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  wire [31:0] COMP_LOOP_1_modulo_sub_cmp_return_rsc_z;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire [31:0] COMP_LOOP_1_modulo_add_cmp_return_rsc_z;
  wire [34:0] fsm_output;
  wire [9:0] COMP_LOOP_1_VEC_LOOP_acc_10_tmp;
  wire [11:0] nl_COMP_LOOP_1_VEC_LOOP_acc_10_tmp;
  wire [9:0] COMP_LOOP_2_VEC_LOOP_acc_10_tmp;
  wire [11:0] nl_COMP_LOOP_2_VEC_LOOP_acc_10_tmp;
  wire [9:0] COMP_LOOP_2_VEC_LOOP_acc_1_tmp;
  wire [10:0] nl_COMP_LOOP_2_VEC_LOOP_acc_1_tmp;
  wire or_dcpl_15;
  wire or_dcpl_16;
  wire or_dcpl_31;
  wire or_tmp_48;
  wire and_60_cse;
  wire and_62_cse;
  wire and_59_cse;
  wire and_94_cse;
  wire and_96_cse;
  wire and_93_cse;
  reg [9:0] COMP_LOOP_2_twiddle_f_lshift_itm;
  reg [10:0] STAGE_LOOP_lshift_psp_sva;
  reg [10:0] VEC_LOOP_j_10_0_1_sva_1;
  reg run_ac_sync_tmp_dobj_sva;
  reg [9:0] VEC_LOOP_acc_10_cse_sva;
  reg [9:0] VEC_LOOP_acc_10_cse_1_sva;
  reg reg_run_rsci_oswt_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_vec_rsc_0_0_i_oswt_cse;
  reg reg_vec_rsc_0_0_i_oswt_1_cse;
  reg reg_vec_rsc_0_1_i_oswt_cse;
  reg reg_vec_rsc_0_1_i_oswt_1_cse;
  reg reg_vec_rsc_triosy_0_1_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_1_cse;
  wire [8:0] COMP_LOOP_twiddle_f_mux_1_rmff;
  wire COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_rmff;
  wire twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg;
  wire or_61_rmff;
  wire core_wten_iff;
  wire twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg;
  wire [8:0] VEC_LOOP_mux_5_rmff;
  wire [8:0] VEC_LOOP_mux1h_1_rmff;
  wire [31:0] vec_rsc_0_0_i_da_d_reg;
  wire [31:0] VEC_LOOP_mux_6_rmff;
  wire [1:0] vec_rsc_0_0_i_wea_d_reg;
  wire or_75_rmff;
  wire or_65_rmff;
  wire [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire or_66_rmff;
  wire [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [31:0] vec_rsc_0_1_i_da_d_reg;
  wire [1:0] vec_rsc_0_1_i_wea_d_reg;
  wire or_80_rmff;
  wire or_78_rmff;
  wire [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire or_79_rmff;
  wire [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire or_84_rmff;
  wire or_86_rmff;
  reg [31:0] COMP_LOOP_twiddle_f_1_sva;
  reg [31:0] COMP_LOOP_twiddle_help_1_sva;
  reg [31:0] COMP_LOOP_1_VEC_LOOP_acc_8_itm;
  reg [31:0] COMP_LOOP_1_VEC_LOOP_acc_5_itm;
  wire [32:0] nl_COMP_LOOP_1_VEC_LOOP_acc_5_itm;
  reg [31:0] p_sva;
  wire [8:0] COMP_LOOP_1_twiddle_f_lshift_itm_1;
  wire [10:0] z_out;
  wire [9:0] z_out_1;
  wire [19:0] nl_z_out_1;
  wire [9:0] z_out_2;
  wire [10:0] nl_z_out_2;
  wire [10:0] z_out_3;
  wire [3:0] z_out_4;
  wire [4:0] nl_z_out_4;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [8:0] COMP_LOOP_1_twiddle_f_mul_psp_sva;
  reg [9:0] COMP_LOOP_twiddle_f_mul_cse_sva;
  reg [8:0] COMP_LOOP_1_twiddle_f_lshift_itm;
  reg [8:0] COMP_LOOP_k_10_1_sva_8_0;
  wire COMP_LOOP_2_twiddle_f_lshift_itm_mx0c1;
  wire [31:0] tmp_lpi_4_dfm_mx0;
  wire [31:0] tmp_1_lpi_4_dfm_mx0;
  wire [31:0] tmp_3_lpi_4_dfm_mx0;
  wire COMP_LOOP_twiddle_help_and_cse;
  wire STAGE_LOOP_acc_itm_4_1;

  wire[0:0] or_74_nl;
  wire[0:0] COMP_LOOP_k_nor_nl;
  wire[9:0] COMP_LOOP_twiddle_f_mux1h_4_nl;
  wire[0:0] not_nl;
  wire[32:0] acc_3_nl;
  wire[33:0] nl_acc_3_nl;
  wire[31:0] VEC_LOOP_mux_36_nl;
  wire[31:0] VEC_LOOP_mux_37_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[9:0] COMP_LOOP_twiddle_f_mux_5_nl;
  wire[9:0] COMP_LOOP_twiddle_f_mux_6_nl;
  wire[8:0] VEC_LOOP_mux_32_nl;
  wire[8:0] VEC_LOOP_mux_33_nl;
  wire[11:0] acc_1_nl;
  wire[12:0] nl_acc_1_nl;
  wire[10:0] VEC_LOOP_mux_34_nl;
  wire[0:0] VEC_LOOP_or_1_nl;
  wire[9:0] VEC_LOOP_mux_35_nl;
  wire[3:0] STAGE_LOOP_mux_4_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat = COMP_LOOP_twiddle_f_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1 = COMP_LOOP_twiddle_help_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_p_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_p_rsc_dat = p_sva;
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat = COMP_LOOP_1_VEC_LOOP_acc_8_itm;
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat = p_sva;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat = COMP_LOOP_1_VEC_LOOP_acc_5_itm;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat = p_sva;
  wire [3:0] nl_COMP_LOOP_2_twiddle_f_lshift_rg_s;
  assign nl_COMP_LOOP_2_twiddle_f_lshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva,
      z_out_4, fsm_output[2]);
  wire [63:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_da_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_da_d_core
      = {32'b00000000000000000000000000000000 , VEC_LOOP_mux_6_rmff};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_wea_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_wea_d_core_psct
      = {1'b0 , or_75_rmff};
  wire[0:0] or_76_nl;
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign or_76_nl = and_59_cse | ((~ (COMP_LOOP_2_twiddle_f_lshift_itm[0])) & (fsm_output[6]));
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {or_66_rmff , or_76_nl};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , or_75_rmff};
  wire [63:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_da_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_da_d_core
      = {32'b00000000000000000000000000000000 , VEC_LOOP_mux_6_rmff};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_wea_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_wea_d_core_psct
      = {1'b0 , or_80_rmff};
  wire[0:0] or_81_nl;
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign or_81_nl = and_93_cse | ((COMP_LOOP_2_twiddle_f_lshift_itm[0]) & (fsm_output[6]));
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {or_79_rmff , or_81_nl};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , or_80_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0 = ~ run_ac_sync_tmp_dobj_sva;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_11_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_11_tr0
      = VEC_LOOP_j_10_0_1_sva_1[10];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 = ~ (z_out_3[10]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_11_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_11_tr0
      = VEC_LOOP_j_10_0_1_sva_1[10];
  wire[10:0] COMP_LOOP_1_acc_nl;
  wire[11:0] nl_COMP_LOOP_1_acc_nl;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0;
  assign nl_COMP_LOOP_1_acc_nl = ({z_out_2 , 1'b0}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + 11'b00000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[10:0];
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 = ~ (readslicef_11_1_10(COMP_LOOP_1_acc_nl));
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
      .ccs_ccore_start_rsc_dat(or_dcpl_15),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en)
    );
  modulo_sub  COMP_LOOP_1_modulo_sub_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(or_dcpl_31),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  modulo_add  COMP_LOOP_1_modulo_add_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_add_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(or_dcpl_31),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd9)) COMP_LOOP_1_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(z_out_4),
      .z(COMP_LOOP_1_twiddle_f_lshift_itm_1)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd11)) COMP_LOOP_2_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_2_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out)
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
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_qb_d(twiddle_rsci_qb_d),
      .twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_rsci_qb_d_mxwt(twiddle_rsci_qb_d_mxwt),
      .twiddle_rsci_oswt_pff(or_61_rmff),
      .core_wten_pff(core_wten_iff)
    );
  inPlaceNTT_DIF_precomp_core_wait_dp inPlaceNTT_DIF_precomp_core_wait_dp_inst (
      .ensig_cgo_iro(or_84_rmff),
      .ensig_cgo_iro_1(or_86_rmff),
      .core_wen(complete_rsci_wen_comp),
      .ensig_cgo(reg_ensig_cgo_cse),
      .COMP_LOOP_1_mult_cmp_ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
      .ensig_cgo_1(reg_ensig_cgo_1_cse),
      .COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1 inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_qb_d(twiddle_h_rsci_qb_d),
      .twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_h_rsci_qb_d_mxwt(twiddle_h_rsci_qb_d_mxwt),
      .twiddle_h_rsci_oswt_pff(or_61_rmff),
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
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_0_i_da_d(vec_rsc_0_0_i_da_d_reg),
      .vec_rsc_0_0_i_qa_d(vec_rsc_0_0_i_qa_d),
      .vec_rsc_0_0_i_wea_d(vec_rsc_0_0_i_wea_d_reg),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_0_i_oswt(reg_vec_rsc_0_0_i_oswt_cse),
      .vec_rsc_0_0_i_oswt_1(reg_vec_rsc_0_0_i_oswt_1_cse),
      .vec_rsc_0_0_i_da_d_core(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_da_d_core[63:0]),
      .vec_rsc_0_0_i_qa_d_mxwt(vec_rsc_0_0_i_qa_d_mxwt),
      .vec_rsc_0_0_i_wea_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_wea_d_core_psct[1:0]),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_0_i_oswt_pff(or_65_rmff),
      .vec_rsc_0_0_i_oswt_1_pff(or_66_rmff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_1_i_da_d(vec_rsc_0_1_i_da_d_reg),
      .vec_rsc_0_1_i_qa_d(vec_rsc_0_1_i_qa_d),
      .vec_rsc_0_1_i_wea_d(vec_rsc_0_1_i_wea_d_reg),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_1_i_oswt(reg_vec_rsc_0_1_i_oswt_cse),
      .vec_rsc_0_1_i_oswt_1(reg_vec_rsc_0_1_i_oswt_1_cse),
      .vec_rsc_0_1_i_da_d_core(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_da_d_core[63:0]),
      .vec_rsc_0_1_i_qa_d_mxwt(vec_rsc_0_1_i_qa_d_mxwt),
      .vec_rsc_0_1_i_wea_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_wea_d_core_psct[1:0]),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_1_i_oswt_pff(or_78_rmff),
      .vec_rsc_0_1_i_oswt_1_pff(or_79_rmff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj_inst
      (
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_1_obj_iswt0(reg_vec_rsc_triosy_0_1_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj_inst
      (
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_0_obj_iswt0(reg_vec_rsc_triosy_0_1_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_inst
      (
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_0_1_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_inst
      (
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_0_1_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_inst
      (
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_0_1_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_inst
      (
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_0_1_obj_iswt0_cse)
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
      .COMP_LOOP_1_VEC_LOOP_C_11_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_11_tr0[0:0]),
      .COMP_LOOP_C_4_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0[0:0]),
      .COMP_LOOP_2_VEC_LOOP_C_11_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_11_tr0[0:0]),
      .COMP_LOOP_C_5_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_61_rmff = ((VEC_LOOP_j_10_0_1_sva_1[10]) & (fsm_output[17])) | (fsm_output[4]);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_rmff = (COMP_LOOP_twiddle_f_mul_cse_sva[0])
      & (fsm_output[17]);
  assign COMP_LOOP_twiddle_f_mux_1_rmff = MUX_v_9_2_2(COMP_LOOP_1_twiddle_f_mul_psp_sva,
      (COMP_LOOP_twiddle_f_mul_cse_sva[9:1]), fsm_output[17]);
  assign or_65_rmff = and_59_cse | and_60_cse | ((~ (COMP_LOOP_2_twiddle_f_lshift_itm[0]))
      & or_dcpl_16) | and_62_cse;
  assign or_66_rmff = ((~ (COMP_LOOP_2_VEC_LOOP_acc_10_tmp[0])) & (fsm_output[19]))
      | ((~ (COMP_LOOP_1_VEC_LOOP_acc_10_tmp[0])) & (fsm_output[6]));
  assign VEC_LOOP_mux1h_1_rmff = MUX1HOT_v_9_6_2((z_out_2[8:0]), COMP_LOOP_1_twiddle_f_lshift_itm,
      (VEC_LOOP_acc_10_cse_1_sva[9:1]), (COMP_LOOP_2_VEC_LOOP_acc_1_tmp[9:1]), (COMP_LOOP_2_twiddle_f_lshift_itm[9:1]),
      (VEC_LOOP_acc_10_cse_sva[9:1]), {(fsm_output[6]) , (fsm_output[9]) , (fsm_output[16])
      , (fsm_output[19]) , (fsm_output[22]) , (fsm_output[29])});
  assign VEC_LOOP_mux_5_rmff = MUX_v_9_2_2((COMP_LOOP_1_VEC_LOOP_acc_10_tmp[9:1]),
      (COMP_LOOP_2_VEC_LOOP_acc_10_tmp[9:1]), fsm_output[19]);
  assign or_74_nl = (fsm_output[29]) | (fsm_output[16]);
  assign VEC_LOOP_mux_6_rmff = MUX_v_32_2_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      COMP_LOOP_1_mult_cmp_return_rsc_z, or_74_nl);
  assign or_75_rmff = and_60_cse | ((~ (COMP_LOOP_2_twiddle_f_lshift_itm[0])) & or_dcpl_15)
      | and_62_cse;
  assign or_78_rmff = and_93_cse | and_94_cse | ((COMP_LOOP_2_twiddle_f_lshift_itm[0])
      & or_dcpl_16) | and_96_cse;
  assign or_79_rmff = ((COMP_LOOP_2_VEC_LOOP_acc_10_tmp[0]) & (fsm_output[19])) |
      ((COMP_LOOP_1_VEC_LOOP_acc_10_tmp[0]) & (fsm_output[6]));
  assign or_80_rmff = and_94_cse | ((COMP_LOOP_2_twiddle_f_lshift_itm[0]) & or_dcpl_15)
      | and_96_cse;
  assign or_84_rmff = (fsm_output[28]) | (fsm_output[27]) | (fsm_output[26]) | (fsm_output[25])
      | (fsm_output[24]) | (fsm_output[23]) | (fsm_output[13]) | (fsm_output[15])
      | (fsm_output[14]) | (fsm_output[12]) | (fsm_output[11]) | (fsm_output[10])
      | (fsm_output[9]) | (fsm_output[22]);
  assign or_86_rmff = or_dcpl_31 | or_dcpl_15;
  assign COMP_LOOP_twiddle_help_and_cse = complete_rsci_wen_comp & or_tmp_48;
  assign nl_COMP_LOOP_2_VEC_LOOP_acc_1_tmp = COMP_LOOP_2_twiddle_f_lshift_itm + ({COMP_LOOP_k_10_1_sva_8_0
      , 1'b1});
  assign COMP_LOOP_2_VEC_LOOP_acc_1_tmp = nl_COMP_LOOP_2_VEC_LOOP_acc_1_tmp[9:0];
  assign nl_COMP_LOOP_1_VEC_LOOP_acc_10_tmp = COMP_LOOP_2_twiddle_f_lshift_itm +
      ({COMP_LOOP_k_10_1_sva_8_0 , 1'b0}) + (STAGE_LOOP_lshift_psp_sva[10:1]);
  assign COMP_LOOP_1_VEC_LOOP_acc_10_tmp = nl_COMP_LOOP_1_VEC_LOOP_acc_10_tmp[9:0];
  assign tmp_lpi_4_dfm_mx0 = MUX_v_32_2_2((vec_rsc_0_0_i_qa_d_mxwt[31:0]), (vec_rsc_0_1_i_qa_d_mxwt[31:0]),
      COMP_LOOP_2_twiddle_f_lshift_itm[0]);
  assign tmp_1_lpi_4_dfm_mx0 = MUX_v_32_2_2((vec_rsc_0_0_i_qa_d_mxwt[63:32]), (vec_rsc_0_1_i_qa_d_mxwt[63:32]),
      VEC_LOOP_acc_10_cse_1_sva[0]);
  assign nl_COMP_LOOP_2_VEC_LOOP_acc_10_tmp = COMP_LOOP_2_twiddle_f_lshift_itm +
      ({COMP_LOOP_k_10_1_sva_8_0 , 1'b1}) + (STAGE_LOOP_lshift_psp_sva[10:1]);
  assign COMP_LOOP_2_VEC_LOOP_acc_10_tmp = nl_COMP_LOOP_2_VEC_LOOP_acc_10_tmp[9:0];
  assign tmp_3_lpi_4_dfm_mx0 = MUX_v_32_2_2((vec_rsc_0_0_i_qa_d_mxwt[63:32]), (vec_rsc_0_1_i_qa_d_mxwt[63:32]),
      VEC_LOOP_acc_10_cse_sva[0]);
  assign or_dcpl_15 = (fsm_output[9]) | (fsm_output[22]);
  assign or_dcpl_16 = or_dcpl_15 | (fsm_output[6]);
  assign or_dcpl_31 = (fsm_output[21]) | (fsm_output[8]);
  assign and_60_cse = (~ (VEC_LOOP_acc_10_cse_sva[0])) & (fsm_output[29]);
  assign and_62_cse = (~ (VEC_LOOP_acc_10_cse_1_sva[0])) & (fsm_output[16]);
  assign and_59_cse = (~ (COMP_LOOP_2_VEC_LOOP_acc_1_tmp[0])) & (fsm_output[19]);
  assign and_94_cse = (VEC_LOOP_acc_10_cse_sva[0]) & (fsm_output[29]);
  assign and_96_cse = (VEC_LOOP_acc_10_cse_1_sva[0]) & (fsm_output[16]);
  assign and_93_cse = (COMP_LOOP_2_VEC_LOOP_acc_1_tmp[0]) & (fsm_output[19]);
  assign or_tmp_48 = (fsm_output[5]) | (fsm_output[18]);
  assign COMP_LOOP_2_twiddle_f_lshift_itm_mx0c1 = (fsm_output[17]) | (fsm_output[30]);
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ z_out_4)}) + 5'b00001;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign twiddle_rsci_adrb_d = {COMP_LOOP_twiddle_f_mux_1_rmff , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_rmff};
  assign twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d = twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsci_adrb_d = {COMP_LOOP_twiddle_f_mux_1_rmff , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_rmff};
  assign twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_0_i_adra_d = {VEC_LOOP_mux_5_rmff , VEC_LOOP_mux1h_1_rmff};
  assign vec_rsc_0_0_i_wea_d = vec_rsc_0_0_i_wea_d_reg;
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign vec_rsc_0_1_i_adra_d = {VEC_LOOP_mux_5_rmff , VEC_LOOP_mux1h_1_rmff};
  assign vec_rsc_0_1_i_wea_d = vec_rsc_0_1_i_wea_d_reg;
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign vec_rsc_0_0_i_da_d = vec_rsc_0_0_i_da_d_reg;
  assign vec_rsc_0_1_i_da_d = vec_rsc_0_1_i_da_d_reg;
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp ) begin
      COMP_LOOP_1_twiddle_f_mul_psp_sva <= z_out_1[8:0];
      COMP_LOOP_1_VEC_LOOP_acc_8_itm <= readslicef_33_32_1(acc_3_nl);
      COMP_LOOP_1_VEC_LOOP_acc_5_itm <= nl_COMP_LOOP_1_VEC_LOOP_acc_5_itm[31:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_run_rsci_oswt_cse <= 1'b0;
      reg_twiddle_rsci_oswt_cse <= 1'b0;
      reg_complete_rsci_oswt_cse <= 1'b0;
      reg_vec_rsc_0_0_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_0_i_oswt_1_cse <= 1'b0;
      reg_vec_rsc_0_1_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_1_i_oswt_1_cse <= 1'b0;
      reg_vec_rsc_triosy_0_1_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_ensig_cgo_1_cse <= 1'b0;
    end
    else if ( complete_rsci_wen_comp ) begin
      reg_run_rsci_oswt_cse <= fsm_output[0];
      reg_twiddle_rsci_oswt_cse <= or_61_rmff;
      reg_complete_rsci_oswt_cse <= (~ STAGE_LOOP_acc_itm_4_1) & (fsm_output[32]);
      reg_vec_rsc_0_0_i_oswt_cse <= or_65_rmff;
      reg_vec_rsc_0_0_i_oswt_1_cse <= or_66_rmff;
      reg_vec_rsc_0_1_i_oswt_cse <= or_78_rmff;
      reg_vec_rsc_0_1_i_oswt_1_cse <= or_79_rmff;
      reg_vec_rsc_triosy_0_1_obj_iswt0_cse <= fsm_output[33];
      reg_ensig_cgo_cse <= or_84_rmff;
      reg_ensig_cgo_1_cse <= or_86_rmff;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((fsm_output[0]) | (fsm_output[32])) ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1010, z_out_4, fsm_output[32]);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((fsm_output[34]) | (fsm_output[33]) | (fsm_output[0]))
        ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      run_ac_sync_tmp_dobj_sva <= 1'b0;
    end
    else if ( complete_rsci_wen_comp & (fsm_output[33]) ) begin
      run_ac_sync_tmp_dobj_sva <= run_rsci_ivld_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~((~((fsm_output[1]) | (fsm_output[34]) | (fsm_output[33])))
        & (~((fsm_output[0]) | (fsm_output[32]))))) ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( ((fsm_output[31]) | (fsm_output[32]) | (fsm_output[0]) | (fsm_output[33])
        | (fsm_output[34]) | (fsm_output[1])) & complete_rsci_wen_comp ) begin
      COMP_LOOP_k_10_1_sva_8_0 <= MUX_v_9_2_2(9'b000000000, (z_out_2[8:0]), COMP_LOOP_k_nor_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_2_twiddle_f_lshift_itm <= 10'b0000000000;
    end
    else if ( complete_rsci_wen_comp & ((fsm_output[2]) | (fsm_output[19]) | COMP_LOOP_2_twiddle_f_lshift_itm_mx0c1
        | or_tmp_48) ) begin
      COMP_LOOP_2_twiddle_f_lshift_itm <= MUX_v_10_2_2(10'b0000000000, COMP_LOOP_twiddle_f_mux1h_4_nl,
          not_nl);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((fsm_output[2]) | (fsm_output[6])) ) begin
      COMP_LOOP_1_twiddle_f_lshift_itm <= MUX_v_9_2_2(COMP_LOOP_1_twiddle_f_lshift_itm_1,
          (z_out_2[8:0]), fsm_output[6]);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (fsm_output[17:5]==13'b0000000000000) ) begin
      COMP_LOOP_twiddle_f_mul_cse_sva <= z_out_1;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_twiddle_help_and_cse ) begin
      COMP_LOOP_twiddle_help_1_sva <= twiddle_h_rsci_qb_d_mxwt;
      COMP_LOOP_twiddle_f_1_sva <= twiddle_rsci_qb_d_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_acc_10_cse_1_sva <= 10'b0000000000;
    end
    else if ( complete_rsci_wen_comp & (fsm_output[6]) ) begin
      VEC_LOOP_acc_10_cse_1_sva <= COMP_LOOP_1_VEC_LOOP_acc_10_tmp;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_0_1_sva_1 <= 11'b00000000000;
    end
    else if ( complete_rsci_wen_comp & ((fsm_output[19]) | (fsm_output[6])) ) begin
      VEC_LOOP_j_10_0_1_sva_1 <= z_out_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_acc_10_cse_sva <= 10'b0000000000;
    end
    else if ( complete_rsci_wen_comp & (fsm_output[19]) ) begin
      VEC_LOOP_acc_10_cse_sva <= COMP_LOOP_2_VEC_LOOP_acc_10_tmp;
    end
  end
  assign VEC_LOOP_mux_36_nl = MUX_v_32_2_2((~ tmp_1_lpi_4_dfm_mx0), (~ tmp_3_lpi_4_dfm_mx0),
      fsm_output[20]);
  assign nl_acc_3_nl = ({tmp_lpi_4_dfm_mx0 , 1'b1}) + ({VEC_LOOP_mux_36_nl , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[32:0];
  assign VEC_LOOP_mux_37_nl = MUX_v_32_2_2(tmp_1_lpi_4_dfm_mx0, tmp_3_lpi_4_dfm_mx0,
      fsm_output[20]);
  assign nl_COMP_LOOP_1_VEC_LOOP_acc_5_itm  = tmp_lpi_4_dfm_mx0 + VEC_LOOP_mux_37_nl;
  assign COMP_LOOP_k_nor_nl = ~((fsm_output[1]) | (fsm_output[34]) | (fsm_output[33])
      | (fsm_output[0]) | (fsm_output[32]));
  assign COMP_LOOP_twiddle_f_mux1h_4_nl = MUX1HOT_v_10_3_2((z_out[9:0]), (VEC_LOOP_j_10_0_1_sva_1[9:0]),
      COMP_LOOP_2_VEC_LOOP_acc_1_tmp, {(fsm_output[2]) , COMP_LOOP_2_twiddle_f_lshift_itm_mx0c1
      , (fsm_output[19])});
  assign not_nl = ~ or_tmp_48;
  assign COMP_LOOP_twiddle_f_mux_5_nl = MUX_v_10_2_2(({1'b0 , COMP_LOOP_1_twiddle_f_lshift_itm}),
      COMP_LOOP_2_twiddle_f_lshift_itm, fsm_output[4]);
  assign COMP_LOOP_twiddle_f_mux_6_nl = MUX_v_10_2_2(({1'b0 , COMP_LOOP_k_10_1_sva_8_0}),
      ({COMP_LOOP_k_10_1_sva_8_0 , 1'b1}), fsm_output[4]);
  assign nl_z_out_1 = COMP_LOOP_twiddle_f_mux_5_nl * COMP_LOOP_twiddle_f_mux_6_nl;
  assign z_out_1 = nl_z_out_1[9:0];
  assign VEC_LOOP_mux_32_nl = MUX_v_9_2_2((COMP_LOOP_2_twiddle_f_lshift_itm[9:1]),
      COMP_LOOP_k_10_1_sva_8_0, fsm_output[31]);
  assign VEC_LOOP_mux_33_nl = MUX_v_9_2_2(COMP_LOOP_k_10_1_sva_8_0, 9'b000000001,
      fsm_output[31]);
  assign nl_z_out_2 = conv_u2u_9_10(VEC_LOOP_mux_32_nl) + conv_u2u_9_10(VEC_LOOP_mux_33_nl);
  assign z_out_2 = nl_z_out_2[9:0];
  assign VEC_LOOP_mux_34_nl = MUX_v_11_2_2(STAGE_LOOP_lshift_psp_sva, ({1'b1 , (~
      (STAGE_LOOP_lshift_psp_sva[10:1]))}), fsm_output[18]);
  assign VEC_LOOP_or_1_nl = (~((fsm_output[6]) | (fsm_output[19]))) | (fsm_output[18]);
  assign VEC_LOOP_mux_35_nl = MUX_v_10_2_2(COMP_LOOP_2_twiddle_f_lshift_itm, ({COMP_LOOP_k_10_1_sva_8_0
      , 1'b1}), fsm_output[18]);
  assign nl_acc_1_nl = ({VEC_LOOP_mux_34_nl , VEC_LOOP_or_1_nl}) + conv_u2u_11_12({VEC_LOOP_mux_35_nl
      , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[11:0];
  assign z_out_3 = readslicef_12_11_1(acc_1_nl);
  assign STAGE_LOOP_mux_4_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (~ STAGE_LOOP_i_3_0_sva),
      fsm_output[2]);
  assign nl_z_out_4 = STAGE_LOOP_mux_4_nl + ({1'b1 , (~ (fsm_output[2])) , 2'b11});
  assign z_out_4 = nl_z_out_4[3:0];

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


  function automatic [0:0] readslicef_11_1_10;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 10;
    readslicef_11_1_10 = tmp[0:0];
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


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
  end
  endfunction


  function automatic [11:0] conv_u2u_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2u_11_12 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp (
  clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_0_0_adra, vec_rsc_0_0_da, vec_rsc_0_0_wea,
      vec_rsc_0_0_qa, vec_rsc_0_0_adrb, vec_rsc_0_0_db, vec_rsc_0_0_web, vec_rsc_0_0_qb,
      vec_rsc_triosy_0_0_lz, vec_rsc_0_1_adra, vec_rsc_0_1_da, vec_rsc_0_1_wea, vec_rsc_0_1_qa,
      vec_rsc_0_1_adrb, vec_rsc_0_1_db, vec_rsc_0_1_web, vec_rsc_0_1_qb, vec_rsc_triosy_0_1_lz,
      p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_adrb, twiddle_rsc_qb,
      twiddle_rsc_triosy_lz, twiddle_h_rsc_adrb, twiddle_h_rsc_qb, twiddle_h_rsc_triosy_lz,
      complete_rsc_rdy, complete_rsc_vld
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [8:0] vec_rsc_0_0_adra;
  output [31:0] vec_rsc_0_0_da;
  output vec_rsc_0_0_wea;
  input [31:0] vec_rsc_0_0_qa;
  output [8:0] vec_rsc_0_0_adrb;
  output [31:0] vec_rsc_0_0_db;
  output vec_rsc_0_0_web;
  input [31:0] vec_rsc_0_0_qb;
  output vec_rsc_triosy_0_0_lz;
  output [8:0] vec_rsc_0_1_adra;
  output [31:0] vec_rsc_0_1_da;
  output vec_rsc_0_1_wea;
  input [31:0] vec_rsc_0_1_qa;
  output [8:0] vec_rsc_0_1_adrb;
  output [31:0] vec_rsc_0_1_db;
  output vec_rsc_0_1_web;
  input [31:0] vec_rsc_0_1_qb;
  output vec_rsc_triosy_0_1_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [9:0] twiddle_rsc_adrb;
  input [31:0] twiddle_rsc_qb;
  output twiddle_rsc_triosy_lz;
  output [9:0] twiddle_h_rsc_adrb;
  input [31:0] twiddle_h_rsc_qb;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;


  // Interconnect Declarations
  wire [9:0] twiddle_rsci_adrb_d;
  wire [31:0] twiddle_rsci_qb_d;
  wire twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  wire [9:0] twiddle_h_rsci_adrb_d;
  wire [31:0] twiddle_h_rsci_qb_d;
  wire twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  wire [17:0] vec_rsc_0_0_i_adra_d;
  wire [31:0] vec_rsc_0_0_i_da_d;
  wire [63:0] vec_rsc_0_0_i_qa_d;
  wire [1:0] vec_rsc_0_0_i_wea_d;
  wire [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [17:0] vec_rsc_0_1_i_adra_d;
  wire [31:0] vec_rsc_0_1_i_da_d;
  wire [63:0] vec_rsc_0_1_i_qa_d;
  wire [1:0] vec_rsc_0_1_i_wea_d;
  wire [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;


  // Interconnect Declarations for Component Instantiations 
  wire [63:0] nl_vec_rsc_0_0_i_da_d;
  assign nl_vec_rsc_0_0_i_da_d = {32'b00000000000000000000000000000000 , vec_rsc_0_0_i_da_d};
  wire [63:0] nl_vec_rsc_0_1_i_da_d;
  assign nl_vec_rsc_0_1_i_da_d = {32'b00000000000000000000000000000000 , vec_rsc_0_1_i_da_d};
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_16_10_32_1024_1024_32_1_gen
      twiddle_rsci (
      .qb(twiddle_rsc_qb),
      .adrb(twiddle_rsc_adrb),
      .adrb_d(twiddle_rsci_adrb_d),
      .qb_d(twiddle_rsci_qb_d),
      .readB_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_17_10_32_1024_1024_32_1_gen
      twiddle_h_rsci (
      .qb(twiddle_h_rsc_qb),
      .adrb(twiddle_h_rsc_adrb),
      .adrb_d(twiddle_h_rsci_adrb_d),
      .qb_d(twiddle_h_rsci_qb_d),
      .readB_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_22_9_32_512_512_32_1_gen
      vec_rsc_0_0_i (
      .qb(vec_rsc_0_0_qb),
      .web(vec_rsc_0_0_web),
      .db(vec_rsc_0_0_db),
      .adrb(vec_rsc_0_0_adrb),
      .qa(vec_rsc_0_0_qa),
      .wea(vec_rsc_0_0_wea),
      .da(vec_rsc_0_0_da),
      .adra(vec_rsc_0_0_adra),
      .adra_d(vec_rsc_0_0_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_vec_rsc_0_0_i_da_d[63:0]),
      .qa_d(vec_rsc_0_0_i_qa_d),
      .wea_d(vec_rsc_0_0_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_23_9_32_512_512_32_1_gen
      vec_rsc_0_1_i (
      .qb(vec_rsc_0_1_qb),
      .web(vec_rsc_0_1_web),
      .db(vec_rsc_0_1_db),
      .adrb(vec_rsc_0_1_adrb),
      .qa(vec_rsc_0_1_qa),
      .wea(vec_rsc_0_1_wea),
      .da(vec_rsc_0_1_da),
      .adra(vec_rsc_0_1_adra),
      .adra_d(vec_rsc_0_1_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_vec_rsc_0_1_i_da_d[63:0]),
      .qa_d(vec_rsc_0_1_i_qa_d),
      .wea_d(vec_rsc_0_1_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_core inPlaceNTT_DIF_precomp_core_inst (
      .clk(clk),
      .rst(rst),
      .run_rsc_rdy(run_rsc_rdy),
      .run_rsc_vld(run_rsc_vld),
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .complete_rsc_rdy(complete_rsc_rdy),
      .complete_rsc_vld(complete_rsc_vld),
      .twiddle_rsci_adrb_d(twiddle_rsci_adrb_d),
      .twiddle_rsci_qb_d(twiddle_rsci_qb_d),
      .twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsci_adrb_d(twiddle_h_rsci_adrb_d),
      .twiddle_h_rsci_qb_d(twiddle_h_rsci_qb_d),
      .twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_0_i_adra_d(vec_rsc_0_0_i_adra_d),
      .vec_rsc_0_0_i_da_d(vec_rsc_0_0_i_da_d),
      .vec_rsc_0_0_i_qa_d(vec_rsc_0_0_i_qa_d),
      .vec_rsc_0_0_i_wea_d(vec_rsc_0_0_i_wea_d),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .vec_rsc_0_1_i_adra_d(vec_rsc_0_1_i_adra_d),
      .vec_rsc_0_1_i_da_d(vec_rsc_0_1_i_da_d),
      .vec_rsc_0_1_i_qa_d(vec_rsc_0_1_i_qa_d),
      .vec_rsc_0_1_i_wea_d(vec_rsc_0_1_i_wea_d),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
endmodule



