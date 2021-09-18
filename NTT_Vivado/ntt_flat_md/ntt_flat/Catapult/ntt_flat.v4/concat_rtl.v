
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

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   ls5382@newnano.poly.edu
//  Generated date: Wed Sep 15 15:48:59 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_6_18_32_245760_245760_32_1_gen
// ------------------------------------------------------------------


module ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_6_18_32_245760_245760_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [17:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [17:0] adra;
  input [35:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[35:18]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[17:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_14_32_16384_16384_32_1_gen (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [13:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [13:0] adra;
  input [27:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[27:14]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[13:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_14_32_16384_16384_32_1_gen (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [13:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [13:0] adra;
  input [27:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[27:14]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[13:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_14_32_16384_16384_32_1_gen (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [13:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [13:0] adra;
  input [27:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[27:14]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[13:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    ntt_flat_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module ntt_flat_core_core_fsm (
  clk, rst, fsm_output, for_C_2_tr0, INNER_LOOP_C_11_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [18:0] fsm_output;
  reg [18:0] fsm_output;
  input for_C_2_tr0;
  input INNER_LOOP_C_11_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for ntt_flat_core_core_fsm_1
  parameter
    main_C_0 = 5'd0,
    for_C_0 = 5'd1,
    for_C_1 = 5'd2,
    for_C_2 = 5'd3,
    STAGE_LOOP_C_0 = 5'd4,
    INNER_LOOP_C_0 = 5'd5,
    INNER_LOOP_C_1 = 5'd6,
    INNER_LOOP_C_2 = 5'd7,
    INNER_LOOP_C_3 = 5'd8,
    INNER_LOOP_C_4 = 5'd9,
    INNER_LOOP_C_5 = 5'd10,
    INNER_LOOP_C_6 = 5'd11,
    INNER_LOOP_C_7 = 5'd12,
    INNER_LOOP_C_8 = 5'd13,
    INNER_LOOP_C_9 = 5'd14,
    INNER_LOOP_C_10 = 5'd15,
    INNER_LOOP_C_11 = 5'd16,
    STAGE_LOOP_C_1 = 5'd17,
    main_C_1 = 5'd18;

  reg [4:0] state_var;
  reg [4:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : ntt_flat_core_core_fsm_1
    case (state_var)
      for_C_0 : begin
        fsm_output = 19'b0000000000000000010;
        state_var_NS = for_C_1;
      end
      for_C_1 : begin
        fsm_output = 19'b0000000000000000100;
        state_var_NS = for_C_2;
      end
      for_C_2 : begin
        fsm_output = 19'b0000000000000001000;
        if ( for_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_0;
        end
        else begin
          state_var_NS = for_C_0;
        end
      end
      STAGE_LOOP_C_0 : begin
        fsm_output = 19'b0000000000000010000;
        state_var_NS = INNER_LOOP_C_0;
      end
      INNER_LOOP_C_0 : begin
        fsm_output = 19'b0000000000000100000;
        state_var_NS = INNER_LOOP_C_1;
      end
      INNER_LOOP_C_1 : begin
        fsm_output = 19'b0000000000001000000;
        state_var_NS = INNER_LOOP_C_2;
      end
      INNER_LOOP_C_2 : begin
        fsm_output = 19'b0000000000010000000;
        state_var_NS = INNER_LOOP_C_3;
      end
      INNER_LOOP_C_3 : begin
        fsm_output = 19'b0000000000100000000;
        state_var_NS = INNER_LOOP_C_4;
      end
      INNER_LOOP_C_4 : begin
        fsm_output = 19'b0000000001000000000;
        state_var_NS = INNER_LOOP_C_5;
      end
      INNER_LOOP_C_5 : begin
        fsm_output = 19'b0000000010000000000;
        state_var_NS = INNER_LOOP_C_6;
      end
      INNER_LOOP_C_6 : begin
        fsm_output = 19'b0000000100000000000;
        state_var_NS = INNER_LOOP_C_7;
      end
      INNER_LOOP_C_7 : begin
        fsm_output = 19'b0000001000000000000;
        state_var_NS = INNER_LOOP_C_8;
      end
      INNER_LOOP_C_8 : begin
        fsm_output = 19'b0000010000000000000;
        state_var_NS = INNER_LOOP_C_9;
      end
      INNER_LOOP_C_9 : begin
        fsm_output = 19'b0000100000000000000;
        state_var_NS = INNER_LOOP_C_10;
      end
      INNER_LOOP_C_10 : begin
        fsm_output = 19'b0001000000000000000;
        state_var_NS = INNER_LOOP_C_11;
      end
      INNER_LOOP_C_11 : begin
        fsm_output = 19'b0010000000000000000;
        if ( INNER_LOOP_C_11_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = INNER_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 19'b0100000000000000000;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 19'b1000000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 19'b0000000000000000001;
        state_var_NS = for_C_0;
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
//  Design Unit:    ntt_flat_core_wait_dp
// ------------------------------------------------------------------


module ntt_flat_core_wait_dp (
  clk, ensig_cgo_iro, mult_z_mul_cmp_z, ensig_cgo, mult_t_mul_cmp_en, mult_z_mul_cmp_z_oreg
);
  input clk;
  input ensig_cgo_iro;
  input [31:0] mult_z_mul_cmp_z;
  input ensig_cgo;
  output mult_t_mul_cmp_en;
  output [31:0] mult_z_mul_cmp_z_oreg;
  reg [31:0] mult_z_mul_cmp_z_oreg;



  // Interconnect Declarations for Component Instantiations 
  assign mult_t_mul_cmp_en = ensig_cgo | ensig_cgo_iro;
  always @(posedge clk) begin
    mult_z_mul_cmp_z_oreg <= mult_z_mul_cmp_z;
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    ntt_flat_core
// ------------------------------------------------------------------


module ntt_flat_core (
  clk, rst, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz, twiddle_rsc_triosy_lz,
      twiddle_h_rsc_triosy_lz, result_rsc_triosy_lz, vec_rsci_adra_d, vec_rsci_qa_d,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d, twiddle_rsci_qa_d, twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsci_qa_d, twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d, result_rsci_adra_d,
      result_rsci_da_d, result_rsci_qa_d, result_rsci_wea_d, result_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsci_rwA_rw_ram_ir_internal_WMASK_B_d, mult_z_mul_cmp_a, mult_z_mul_cmp_b,
      mult_z_mul_cmp_z, twiddle_rsci_adra_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output twiddle_h_rsc_triosy_lz;
  output result_rsc_triosy_lz;
  output [13:0] vec_rsci_adra_d;
  input [63:0] vec_rsci_qa_d;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsci_qa_d;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_h_rsci_qa_d;
  output [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [35:0] result_rsci_adra_d;
  output [31:0] result_rsci_da_d;
  input [63:0] result_rsci_qa_d;
  output [1:0] result_rsci_wea_d;
  output [1:0] result_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] result_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [31:0] mult_z_mul_cmp_a;
  reg [31:0] mult_z_mul_cmp_a;
  output [31:0] mult_z_mul_cmp_b;
  reg [31:0] mult_z_mul_cmp_b;
  input [31:0] mult_z_mul_cmp_z;
  output [13:0] twiddle_rsci_adra_d_pff;


  // Interconnect Declarations
  wire [31:0] p_rsci_idat;
  wire mult_t_mul_cmp_en;
  wire [51:0] mult_t_mul_cmp_z;
  wire [31:0] mult_z_mul_cmp_z_oreg;
  wire [18:0] fsm_output;
  wire or_tmp_30;
  reg [13:0] INNER_LOOP_j_13_0_sva_1;
  reg [14:0] for_i_14_0_sva_1;
  wire [15:0] nl_for_i_14_0_sva_1;
  reg [31:0] modulo_sub_base_sva;
  reg [31:0] p_sva;
  reg [31:0] modulo_add_base_sva;
  reg [13:0] reg_butterFly_idx2_17_0_ftd;
  reg reg_vec_rsc_triosy_obj_ld_cse;
  reg reg_ensig_cgo_cse;
  wire or_23_rmff;
  wire or_26_rmff;
  wire [31:0] modulo_sub_qr_lpi_3_dfm_mx0w0;
  wire [32:0] nl_modulo_sub_qr_lpi_3_dfm_mx0w0;
  reg [31:0] INNER_LOOP_tf_h_slc_twiddle_h_rsci_qa_d_31_0_itm;
  reg [31:0] mult_mux_itm;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  wire [16:0] INNER_LOOP_idx1_acc_psp_sva_mx0w0;
  wire [17:0] nl_INNER_LOOP_idx1_acc_psp_sva_mx0w0;
  reg [17:0] INNER_LOOP_k_17_0_sva;
  wire [18:0] nl_INNER_LOOP_k_17_0_sva;
  wire [17:0] butterFly_idx2_17_0_sva_mx0w0;
  wire [18:0] nl_butterFly_idx2_17_0_sva_mx0w0;
  reg [3:0] operator_20_false_acc_itm;
  wire [4:0] nl_operator_20_false_acc_itm;
  reg [3:0] operator_20_false_1_acc_itm;
  wire [4:0] nl_operator_20_false_1_acc_itm;
  reg [12:0] INNER_LOOP_idx1_acc_psp_sva_12_0;
  reg [13:0] INNER_LOOP_tf_mul_cse_sva;
  wire signed [28:0] nl_INNER_LOOP_tf_mul_cse_sva;
  wire [13:0] operator_33_true_lshift_itm;
  wire [17:0] INNER_LOOP_k_lshift_itm;
  wire [13:0] z_out;
  wire [3:0] z_out_1;
  wire [4:0] nl_z_out_1;
  wire [31:0] z_out_2;
  wire [31:0] z_out_3;
  reg [3:0] operator_20_false_acc_psp_sva;
  wire [4:0] nl_operator_20_false_acc_psp_sva;
  reg [13:0] operator_33_true_return_13_0_sva;
  reg [13:0] operator_20_false_rshift_psp_sva;
  reg [16:0] INNER_LOOP_idx1_mul_itm;
  wire [26:0] nl_INNER_LOOP_idx1_mul_itm;
  reg [31:0] INNER_LOOP_tf_slc_twiddle_rsci_qa_d_31_0_itm;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire INNER_LOOP_idx1_acc_psp_sva_mx0c1;
  wire operator_20_false_acc_itm_4_1;
  wire modulo_add_acc_1_itm_32_1;

  wire[0:0] and_55_nl;
  wire[0:0] and_57_nl;
  wire[13:0] for_i_mux_1_nl;
  wire[13:0] INNER_LOOP_acc_1_nl;
  wire[14:0] nl_INNER_LOOP_acc_1_nl;
  wire[0:0] INNER_LOOP_j_not_3_nl;
  wire[12:0] INNER_LOOP_j_INNER_LOOP_j_and_nl;
  wire[12:0] INNER_LOOP_j_mux_nl;
  wire[0:0] INNER_LOOP_g_or_nl;
  wire[31:0] butterFly_acc_1_nl;
  wire[32:0] nl_butterFly_acc_1_nl;
  wire[32:0] mult_if_acc_1_nl;
  wire[33:0] nl_mult_if_acc_1_nl;
  wire[4:0] operator_20_false_acc_nl;
  wire[5:0] nl_operator_20_false_acc_nl;
  wire[32:0] modulo_add_acc_1_nl;
  wire[33:0] nl_modulo_add_acc_1_nl;
  wire[3:0] for_and_2_nl;
  wire[3:0] for_mux1h_nl;
  wire[3:0] butterFly_f2_acc_nl;
  wire[4:0] nl_butterFly_f2_acc_nl;
  wire[0:0] not_37_nl;
  wire[13:0] for_mux1h_2_nl;
  wire[0:0] for_and_nl;
  wire[0:0] for_and_1_nl;
  wire[3:0] operator_20_false_1_operator_20_false_1_or_1_nl;
  wire[0:0] operator_20_false_1_not_1_nl;
  wire[32:0] acc_1_nl;
  wire[33:0] nl_acc_1_nl;
  wire[31:0] butterFly_mux_2_nl;
  wire[31:0] butterFly_mux_3_nl;
  wire[32:0] acc_2_nl;
  wire[33:0] nl_acc_2_nl;
  wire[31:0] mult_res_mux_1_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_mult_t_mul_cmp_a;
  assign nl_mult_t_mul_cmp_a = MUX_v_32_2_2(({1'b0 , (modulo_sub_base_sva[30:0])}),
      modulo_sub_qr_lpi_3_dfm_mx0w0, modulo_sub_base_sva[31]);
  wire [31:0] nl_mult_t_mul_cmp_b;
  assign nl_mult_t_mul_cmp_b = INNER_LOOP_tf_h_slc_twiddle_h_rsci_qa_d_31_0_itm;
  wire [12:0] nl_INNER_LOOP_k_lshift_rg_a;
  assign nl_INNER_LOOP_k_lshift_rg_a = z_out[12:0];
  wire [3:0] nl_INNER_LOOP_k_lshift_rg_s;
  assign nl_INNER_LOOP_k_lshift_rg_s = operator_20_false_acc_psp_sva;
  wire[12:0] operator_20_false_operator_20_false_and_nl;
  wire [14:0] nl_INNER_LOOP_g_rshift_rg_a;
  assign operator_20_false_operator_20_false_and_nl = MUX_v_13_2_2(13'b0000000000000,
      INNER_LOOP_idx1_acc_psp_sva_12_0, (fsm_output[5]));
  assign nl_INNER_LOOP_g_rshift_rg_a = {(~ (fsm_output[5])) , 1'b0 , operator_20_false_operator_20_false_and_nl};
  wire [3:0] nl_INNER_LOOP_g_rshift_rg_s;
  assign nl_INNER_LOOP_g_rshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, operator_20_false_acc_psp_sva,
      fsm_output[5]);
  wire [0:0] nl_ntt_flat_core_core_fsm_inst_for_C_2_tr0;
  assign nl_ntt_flat_core_core_fsm_inst_for_C_2_tr0 = for_i_14_0_sva_1[14];
  wire [0:0] nl_ntt_flat_core_core_fsm_inst_INNER_LOOP_C_11_tr0;
  assign nl_ntt_flat_core_core_fsm_inst_INNER_LOOP_C_11_tr0 = INNER_LOOP_j_13_0_sva_1[13];
  wire [0:0] nl_ntt_flat_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_ntt_flat_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = operator_20_false_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_obj_ld_cse),
      .lz(vec_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_obj_ld_cse),
      .lz(r_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_obj_ld_cse),
      .lz(twiddle_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_obj_ld_cse),
      .lz(twiddle_h_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_obj_ld_cse),
      .lz(result_rsc_triosy_lz)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd52),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_t_mul_cmp (
      .a(nl_mult_t_mul_cmp_a[31:0]),
      .b(nl_mult_t_mul_cmp_b[31:0]),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_t_mul_cmp_z)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd14)) operator_33_true_lshift_rg (
      .a(1'b1),
      .s(z_out_1),
      .z(operator_33_true_lshift_itm)
    );
  mgc_shift_l_v5 #(.width_a(32'sd13),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd18)) INNER_LOOP_k_lshift_rg (
      .a(nl_INNER_LOOP_k_lshift_rg_a[12:0]),
      .s(nl_INNER_LOOP_k_lshift_rg_s[3:0]),
      .z(INNER_LOOP_k_lshift_itm)
    );
  mgc_shift_r_v5 #(.width_a(32'sd15),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd14)) INNER_LOOP_g_rshift_rg (
      .a(nl_INNER_LOOP_g_rshift_rg_a[14:0]),
      .s(nl_INNER_LOOP_g_rshift_rg_s[3:0]),
      .z(z_out)
    );
  ntt_flat_core_wait_dp ntt_flat_core_wait_dp_inst (
      .clk(clk),
      .ensig_cgo_iro(or_26_rmff),
      .mult_z_mul_cmp_z(mult_z_mul_cmp_z),
      .ensig_cgo(reg_ensig_cgo_cse),
      .mult_t_mul_cmp_en(mult_t_mul_cmp_en),
      .mult_z_mul_cmp_z_oreg(mult_z_mul_cmp_z_oreg)
    );
  ntt_flat_core_core_fsm ntt_flat_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .for_C_2_tr0(nl_ntt_flat_core_core_fsm_inst_for_C_2_tr0[0:0]),
      .INNER_LOOP_C_11_tr0(nl_ntt_flat_core_core_fsm_inst_INNER_LOOP_C_11_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_ntt_flat_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_23_rmff = (fsm_output[2]) | (fsm_output[9]) | (fsm_output[15]);
  assign or_26_rmff = (fsm_output[11:9]!=3'b000);
  assign nl_modulo_sub_qr_lpi_3_dfm_mx0w0 = ({1'b1 , (modulo_sub_base_sva[30:0])})
      + p_sva;
  assign modulo_sub_qr_lpi_3_dfm_mx0w0 = nl_modulo_sub_qr_lpi_3_dfm_mx0w0[31:0];
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_INNER_LOOP_idx1_acc_psp_sva_mx0w0 = INNER_LOOP_idx1_mul_itm + (INNER_LOOP_k_17_0_sva[17:1]);
  assign INNER_LOOP_idx1_acc_psp_sva_mx0w0 = nl_INNER_LOOP_idx1_acc_psp_sva_mx0w0[16:0];
  assign nl_butterFly_idx2_17_0_sva_mx0w0 = ({INNER_LOOP_idx1_acc_psp_sva_mx0w0 ,
      (INNER_LOOP_k_17_0_sva[0])}) + conv_u2u_14_18(operator_20_false_rshift_psp_sva);
  assign butterFly_idx2_17_0_sva_mx0w0 = nl_butterFly_idx2_17_0_sva_mx0w0[17:0];
  assign nl_operator_20_false_acc_nl = ({1'b1 , (~ STAGE_LOOP_i_3_0_sva_2)}) + 5'b01111;
  assign operator_20_false_acc_nl = nl_operator_20_false_acc_nl[4:0];
  assign operator_20_false_acc_itm_4_1 = readslicef_5_1_4(operator_20_false_acc_nl);
  assign or_tmp_30 = ~((fsm_output[18]) | (fsm_output[1]) | (fsm_output[2]) | (fsm_output[3])
      | (fsm_output[4]) | (fsm_output[0]) | (fsm_output[17]));
  assign INNER_LOOP_idx1_acc_psp_sva_mx0c1 = (fsm_output[4]) | (fsm_output[5]) |
      (fsm_output[16]);
  assign nl_modulo_add_acc_1_nl = ({1'b1 , p_sva}) + conv_u2u_32_33(~ modulo_add_base_sva)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_acc_1_nl = nl_modulo_add_acc_1_nl[32:0];
  assign modulo_add_acc_1_itm_32_1 = readslicef_33_1_32(modulo_add_acc_1_nl);
  assign vec_rsci_adra_d = INNER_LOOP_j_13_0_sva_1;
  assign vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = {1'b0 , (fsm_output[1])};
  assign twiddle_rsci_adra_d_pff = INNER_LOOP_tf_mul_cse_sva;
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = {1'b0 , (fsm_output[7])};
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = {1'b0 , (fsm_output[7])};
  assign nl_butterFly_f2_acc_nl = STAGE_LOOP_i_3_0_sva + (butterFly_idx2_17_0_sva_mx0w0[17:14]);
  assign butterFly_f2_acc_nl = nl_butterFly_f2_acc_nl[3:0];
  assign for_mux1h_nl = MUX1HOT_v_4_3_2(butterFly_f2_acc_nl, operator_20_false_acc_itm,
      operator_20_false_1_acc_itm, {(fsm_output[7]) , (fsm_output[9]) , (fsm_output[15])});
  assign not_37_nl = ~ (fsm_output[2]);
  assign for_and_2_nl = MUX_v_4_2_2(4'b0000, for_mux1h_nl, not_37_nl);
  assign for_mux1h_2_nl = MUX1HOT_v_14_4_2(INNER_LOOP_j_13_0_sva_1, (butterFly_idx2_17_0_sva_mx0w0[13:0]),
      ({INNER_LOOP_idx1_acc_psp_sva_12_0 , (INNER_LOOP_k_17_0_sva[0])}), reg_butterFly_idx2_17_0_ftd,
      {(fsm_output[2]) , (fsm_output[7]) , (fsm_output[9]) , (fsm_output[15])});
  assign result_rsci_adra_d = {z_out_1 , (INNER_LOOP_idx1_acc_psp_sva_mx0w0[12:0])
      , (INNER_LOOP_k_17_0_sva[0]) , for_and_2_nl , for_mux1h_2_nl};
  assign for_and_nl = (~ modulo_add_acc_1_itm_32_1) & (fsm_output[9]);
  assign for_and_1_nl = modulo_add_acc_1_itm_32_1 & (fsm_output[9]);
  assign result_rsci_da_d = MUX1HOT_v_32_4_2((vec_rsci_qa_d[31:0]), modulo_add_base_sva,
      z_out_3, mult_mux_itm, {(fsm_output[2]) , for_and_nl , for_and_1_nl , (fsm_output[15])});
  assign result_rsci_wea_d = {1'b0 , or_23_rmff};
  assign result_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = signext_2_1(fsm_output[7]);
  assign result_rsci_rwA_rw_ram_ir_internal_WMASK_B_d = {1'b0 , or_23_rmff};
  always @(posedge clk) begin
    if ( (fsm_output[18]) | (fsm_output[0]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_obj_ld_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      modulo_sub_base_sva <= 32'b00000000000000000000000000000000;
    end
    else begin
      reg_vec_rsc_triosy_obj_ld_cse <= operator_20_false_acc_itm_4_1 & (fsm_output[17]);
      reg_ensig_cgo_cse <= or_26_rmff;
      modulo_sub_base_sva <= z_out_2;
    end
  end
  always @(posedge clk) begin
    mult_z_mul_cmp_a <= MUX1HOT_v_32_3_2(modulo_sub_qr_lpi_3_dfm_mx0w0, ({1'b0 ,
        (modulo_sub_base_sva[30:0])}), (mult_t_mul_cmp_z[51:20]), {and_55_nl , and_57_nl
        , (fsm_output[12])});
    mult_z_mul_cmp_b <= MUX_v_32_2_2(INNER_LOOP_tf_slc_twiddle_rsci_qa_d_31_0_itm,
        p_sva, fsm_output[12]);
    INNER_LOOP_tf_mul_cse_sva <= nl_INNER_LOOP_tf_mul_cse_sva[13:0];
    INNER_LOOP_idx1_mul_itm <= nl_INNER_LOOP_idx1_mul_itm[16:0];
    INNER_LOOP_tf_h_slc_twiddle_h_rsci_qa_d_31_0_itm <= twiddle_h_rsci_qa_d[31:0];
    INNER_LOOP_tf_slc_twiddle_rsci_qa_d_31_0_itm <= twiddle_rsci_qa_d[31:0];
    mult_mux_itm <= MUX_v_32_2_2(z_out_2, z_out_3, readslicef_33_1_32(mult_if_acc_1_nl));
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_j_13_0_sva_1 <= 14'b00000000000000;
    end
    else if ( (fsm_output[3]) | (fsm_output[0]) | (fsm_output[5]) ) begin
      INNER_LOOP_j_13_0_sva_1 <= MUX_v_14_2_2(14'b00000000000000, for_i_mux_1_nl,
          INNER_LOOP_j_not_3_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_i_14_0_sva_1 <= 15'b000000000000000;
    end
    else if ( fsm_output[1] ) begin
      for_i_14_0_sva_1 <= nl_for_i_14_0_sva_1[14:0];
    end
  end
  always @(posedge clk) begin
    if ( (fsm_output[3]) | (fsm_output[17]) ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, fsm_output[17]);
    end
  end
  always @(posedge clk) begin
    if ( ~ or_tmp_30 ) begin
      operator_20_false_rshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( ~ or_tmp_30 ) begin
      operator_33_true_return_13_0_sva <= operator_33_true_lshift_itm;
    end
  end
  always @(posedge clk) begin
    if ( ~ or_tmp_30 ) begin
      operator_20_false_acc_psp_sva <= nl_operator_20_false_acc_psp_sva[3:0];
    end
  end
  always @(posedge clk) begin
    if ( (fsm_output[7]) | INNER_LOOP_idx1_acc_psp_sva_mx0c1 ) begin
      INNER_LOOP_idx1_acc_psp_sva_12_0 <= MUX_v_13_2_2((INNER_LOOP_idx1_acc_psp_sva_mx0w0[12:0]),
          INNER_LOOP_j_INNER_LOOP_j_and_nl, INNER_LOOP_idx1_acc_psp_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[5] ) begin
      INNER_LOOP_k_17_0_sva <= nl_INNER_LOOP_k_17_0_sva[17:0];
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[7] ) begin
      operator_20_false_1_acc_itm <= nl_operator_20_false_1_acc_itm[3:0];
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[7] ) begin
      reg_butterFly_idx2_17_0_ftd <= butterFly_idx2_17_0_sva_mx0w0[13:0];
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[7] ) begin
      operator_20_false_acc_itm <= nl_operator_20_false_acc_itm[3:0];
    end
  end
  always @(posedge clk) begin
    if ( (fsm_output[11]) | (fsm_output[8]) ) begin
      modulo_add_base_sva <= MUX_v_32_2_2(butterFly_acc_1_nl, mult_z_mul_cmp_z_oreg,
          fsm_output[11]);
    end
  end
  assign and_55_nl = (modulo_sub_base_sva[31]) & (fsm_output[9]);
  assign and_57_nl = (~ (modulo_sub_base_sva[31])) & (fsm_output[9]);
  assign nl_INNER_LOOP_tf_mul_cse_sva  = $signed(operator_33_true_return_13_0_sva)
      * $signed(conv_u2s_14_15(INNER_LOOP_k_17_0_sva[13:0]));
  assign nl_INNER_LOOP_idx1_mul_itm  = INNER_LOOP_idx1_acc_psp_sva_12_0 * operator_20_false_rshift_psp_sva;
  assign nl_mult_if_acc_1_nl = ({1'b1 , z_out_3}) + conv_u2u_32_33(~ p_sva) + 33'b000000000000000000000000000000001;
  assign mult_if_acc_1_nl = nl_mult_if_acc_1_nl[32:0];
  assign nl_INNER_LOOP_acc_1_nl = conv_u2u_13_14(INNER_LOOP_idx1_acc_psp_sva_12_0)
      + 14'b00000000000001;
  assign INNER_LOOP_acc_1_nl = nl_INNER_LOOP_acc_1_nl[13:0];
  assign for_i_mux_1_nl = MUX_v_14_2_2((for_i_14_0_sva_1[13:0]), INNER_LOOP_acc_1_nl,
      fsm_output[5]);
  assign INNER_LOOP_j_not_3_nl = ~ (fsm_output[0]);
  assign nl_for_i_14_0_sva_1  = conv_u2u_14_15(INNER_LOOP_j_13_0_sva_1) + 15'b000000000000001;
  assign nl_operator_20_false_acc_psp_sva  = (~ STAGE_LOOP_i_3_0_sva) + 4'b1111;
  assign INNER_LOOP_j_mux_nl = MUX_v_13_2_2((z_out[12:0]), (INNER_LOOP_j_13_0_sva_1[12:0]),
      fsm_output[16]);
  assign INNER_LOOP_g_or_nl = (fsm_output[5]) | (fsm_output[16]);
  assign INNER_LOOP_j_INNER_LOOP_j_and_nl = MUX_v_13_2_2(13'b0000000000000, INNER_LOOP_j_mux_nl,
      INNER_LOOP_g_or_nl);
  assign nl_INNER_LOOP_k_17_0_sva  = conv_u2u_13_18(INNER_LOOP_idx1_acc_psp_sva_12_0)
      - INNER_LOOP_k_lshift_itm;
  assign nl_operator_20_false_1_acc_itm  = STAGE_LOOP_i_3_0_sva + (butterFly_idx2_17_0_sva_mx0w0[17:14])
      + 4'b0001;
  assign nl_operator_20_false_acc_itm  = STAGE_LOOP_i_3_0_sva + (INNER_LOOP_idx1_acc_psp_sva_mx0w0[16:13])
      + 4'b0001;
  assign nl_butterFly_acc_1_nl = (result_rsci_qa_d[63:32]) + (result_rsci_qa_d[31:0]);
  assign butterFly_acc_1_nl = nl_butterFly_acc_1_nl[31:0];
  assign operator_20_false_1_not_1_nl = ~ (fsm_output[7]);
  assign operator_20_false_1_operator_20_false_1_or_1_nl = MUX_v_4_2_2((INNER_LOOP_idx1_acc_psp_sva_mx0w0[16:13]),
      4'b1111, operator_20_false_1_not_1_nl);
  assign nl_z_out_1 = STAGE_LOOP_i_3_0_sva + operator_20_false_1_operator_20_false_1_or_1_nl;
  assign z_out_1 = nl_z_out_1[3:0];
  assign butterFly_mux_2_nl = MUX_v_32_2_2((result_rsci_qa_d[63:32]), z_out_3, fsm_output[14]);
  assign butterFly_mux_3_nl = MUX_v_32_2_2((~ (result_rsci_qa_d[31:0])), (~ p_sva),
      fsm_output[14]);
  assign nl_acc_1_nl = ({butterFly_mux_2_nl , 1'b1}) + ({butterFly_mux_3_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[32:0];
  assign z_out_2 = readslicef_33_32_1(acc_1_nl);
  assign mult_res_mux_1_nl = MUX_v_32_2_2((~ mult_z_mul_cmp_z_oreg), (~ p_sva), fsm_output[9]);
  assign nl_acc_2_nl = ({modulo_add_base_sva , 1'b1}) + ({mult_res_mux_1_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[32:0];
  assign z_out_3 = readslicef_33_32_1(acc_2_nl);

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


  function automatic [0:0] readslicef_33_1_32;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_33_1_32 = tmp[0:0];
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


  function automatic [1:0] signext_2_1;
    input [0:0] vector;
  begin
    signext_2_1= {{1{vector[0]}}, vector};
  end
  endfunction


  function automatic [14:0] conv_u2s_14_15 ;
    input [13:0]  vector ;
  begin
    conv_u2s_14_15 =  {1'b0, vector};
  end
  endfunction


  function automatic [13:0] conv_u2u_13_14 ;
    input [12:0]  vector ;
  begin
    conv_u2u_13_14 = {1'b0, vector};
  end
  endfunction


  function automatic [17:0] conv_u2u_13_18 ;
    input [12:0]  vector ;
  begin
    conv_u2u_13_18 = {{5{1'b0}}, vector};
  end
  endfunction


  function automatic [14:0] conv_u2u_14_15 ;
    input [13:0]  vector ;
  begin
    conv_u2u_14_15 = {1'b0, vector};
  end
  endfunction


  function automatic [17:0] conv_u2u_14_18 ;
    input [13:0]  vector ;
  begin
    conv_u2u_14_18 = {{4{1'b0}}, vector};
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
//  Design Unit:    ntt_flat
// ------------------------------------------------------------------


module ntt_flat (
  clk, rst, vec_rsc_adra, vec_rsc_da, vec_rsc_wea, vec_rsc_qa, vec_rsc_adrb, vec_rsc_db,
      vec_rsc_web, vec_rsc_qb, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat,
      r_rsc_triosy_lz, twiddle_rsc_adra, twiddle_rsc_da, twiddle_rsc_wea, twiddle_rsc_qa,
      twiddle_rsc_adrb, twiddle_rsc_db, twiddle_rsc_web, twiddle_rsc_qb, twiddle_rsc_triosy_lz,
      twiddle_h_rsc_adra, twiddle_h_rsc_da, twiddle_h_rsc_wea, twiddle_h_rsc_qa,
      twiddle_h_rsc_adrb, twiddle_h_rsc_db, twiddle_h_rsc_web, twiddle_h_rsc_qb,
      twiddle_h_rsc_triosy_lz, result_rsc_adra, result_rsc_da, result_rsc_wea, result_rsc_qa,
      result_rsc_adrb, result_rsc_db, result_rsc_web, result_rsc_qb, result_rsc_triosy_lz
);
  input clk;
  input rst;
  output [13:0] vec_rsc_adra;
  output [31:0] vec_rsc_da;
  output vec_rsc_wea;
  input [31:0] vec_rsc_qa;
  output [13:0] vec_rsc_adrb;
  output [31:0] vec_rsc_db;
  output vec_rsc_web;
  input [31:0] vec_rsc_qb;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [13:0] twiddle_rsc_adra;
  output [31:0] twiddle_rsc_da;
  output twiddle_rsc_wea;
  input [31:0] twiddle_rsc_qa;
  output [13:0] twiddle_rsc_adrb;
  output [31:0] twiddle_rsc_db;
  output twiddle_rsc_web;
  input [31:0] twiddle_rsc_qb;
  output twiddle_rsc_triosy_lz;
  output [13:0] twiddle_h_rsc_adra;
  output [31:0] twiddle_h_rsc_da;
  output twiddle_h_rsc_wea;
  input [31:0] twiddle_h_rsc_qa;
  output [13:0] twiddle_h_rsc_adrb;
  output [31:0] twiddle_h_rsc_db;
  output twiddle_h_rsc_web;
  input [31:0] twiddle_h_rsc_qb;
  output twiddle_h_rsc_triosy_lz;
  output [17:0] result_rsc_adra;
  output [31:0] result_rsc_da;
  output result_rsc_wea;
  input [31:0] result_rsc_qa;
  output [17:0] result_rsc_adrb;
  output [31:0] result_rsc_db;
  output result_rsc_web;
  input [31:0] result_rsc_qb;
  output result_rsc_triosy_lz;


  // Interconnect Declarations
  wire [13:0] vec_rsci_adra_d;
  wire [63:0] vec_rsci_qa_d;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsci_qa_d;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_h_rsci_qa_d;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [35:0] result_rsci_adra_d;
  wire [31:0] result_rsci_da_d;
  wire [63:0] result_rsci_qa_d;
  wire [1:0] result_rsci_wea_d;
  wire [1:0] result_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] result_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [31:0] mult_z_mul_cmp_a;
  wire [31:0] mult_z_mul_cmp_b;
  wire [13:0] twiddle_rsci_adra_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [27:0] nl_vec_rsci_adra_d;
  assign nl_vec_rsci_adra_d = {14'b00000000000000 , vec_rsci_adra_d};
  wire [27:0] nl_twiddle_rsci_adra_d;
  assign nl_twiddle_rsci_adra_d = {14'b00000000000000 , twiddle_rsci_adra_d_iff};
  wire [27:0] nl_twiddle_h_rsci_adra_d;
  assign nl_twiddle_h_rsci_adra_d = {14'b00000000000000 , twiddle_rsci_adra_d_iff};
  wire [63:0] nl_result_rsci_da_d;
  assign nl_result_rsci_da_d = {32'b00000000000000000000000000000000 , result_rsci_da_d};
  wire [31:0] nl_ntt_flat_core_inst_mult_z_mul_cmp_z;
  assign nl_ntt_flat_core_inst_mult_z_mul_cmp_z = conv_u2u_64_32(mult_z_mul_cmp_a
      * mult_z_mul_cmp_b);
  ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_14_32_16384_16384_32_1_gen vec_rsci
      (
      .qb(vec_rsc_qb),
      .web(vec_rsc_web),
      .db(vec_rsc_db),
      .adrb(vec_rsc_adrb),
      .qa(vec_rsc_qa),
      .wea(vec_rsc_wea),
      .da(vec_rsc_da),
      .adra(vec_rsc_adra),
      .adra_d(nl_vec_rsci_adra_d[27:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(vec_rsci_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_14_32_16384_16384_32_1_gen twiddle_rsci
      (
      .qb(twiddle_rsc_qb),
      .web(twiddle_rsc_web),
      .db(twiddle_rsc_db),
      .adrb(twiddle_rsc_adrb),
      .qa(twiddle_rsc_qa),
      .wea(twiddle_rsc_wea),
      .da(twiddle_rsc_da),
      .adra(twiddle_rsc_adra),
      .adra_d(nl_twiddle_rsci_adra_d[27:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_rsci_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_14_32_16384_16384_32_1_gen twiddle_h_rsci
      (
      .qb(twiddle_h_rsc_qb),
      .web(twiddle_h_rsc_web),
      .db(twiddle_h_rsc_db),
      .adrb(twiddle_h_rsc_adrb),
      .qa(twiddle_h_rsc_qa),
      .wea(twiddle_h_rsc_wea),
      .da(twiddle_h_rsc_da),
      .adra(twiddle_h_rsc_adra),
      .adra_d(nl_twiddle_h_rsci_adra_d[27:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_h_rsci_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_6_18_32_245760_245760_32_1_gen result_rsci
      (
      .qb(result_rsc_qb),
      .web(result_rsc_web),
      .db(result_rsc_db),
      .adrb(result_rsc_adrb),
      .qa(result_rsc_qa),
      .wea(result_rsc_wea),
      .da(result_rsc_da),
      .adra(result_rsc_adra),
      .adra_d(result_rsci_adra_d),
      .da_d(nl_result_rsci_da_d[63:0]),
      .qa_d(result_rsci_qa_d),
      .wea_d(result_rsci_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(result_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(result_rsci_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  ntt_flat_core ntt_flat_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .result_rsc_triosy_lz(result_rsc_triosy_lz),
      .vec_rsci_adra_d(vec_rsci_adra_d),
      .vec_rsci_qa_d(vec_rsci_qa_d),
      .vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_rsci_qa_d(twiddle_rsci_qa_d),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsci_qa_d(twiddle_h_rsci_qa_d),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .result_rsci_adra_d(result_rsci_adra_d),
      .result_rsci_da_d(result_rsci_da_d),
      .result_rsci_qa_d(result_rsci_qa_d),
      .result_rsci_wea_d(result_rsci_wea_d),
      .result_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(result_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .result_rsci_rwA_rw_ram_ir_internal_WMASK_B_d(result_rsci_rwA_rw_ram_ir_internal_WMASK_B_d),
      .mult_z_mul_cmp_a(mult_z_mul_cmp_a),
      .mult_z_mul_cmp_b(mult_z_mul_cmp_b),
      .mult_z_mul_cmp_z(nl_ntt_flat_core_inst_mult_z_mul_cmp_z[31:0]),
      .twiddle_rsci_adra_d_pff(twiddle_rsci_adra_d_iff)
    );

  function automatic [31:0] conv_u2u_64_32 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_32 = vector[31:0];
  end
  endfunction

endmodule



