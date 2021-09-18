
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
//  Generated date: Wed Sep 15 15:45:40 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_6_18_32_245760_245760_32_1_gen
// ------------------------------------------------------------------


module ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_6_18_32_245760_245760_32_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] q;
  output [17:0] radr;
  output we;
  output [31:0] d;
  output [17:0] wadr;
  input [31:0] d_d;
  output [31:0] q_d;
  input [17:0] radr_d;
  input [17:0] wadr_d;
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
//  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_14_32_16384_16384_32_1_gen (
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
//  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen (
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
//  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_14_32_16384_16384_32_1_gen (
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
//  Design Unit:    ntt_flat_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module ntt_flat_core_core_fsm (
  clk, rst, fsm_output, for_C_3_tr0, INNER_LOOP_C_12_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [20:0] fsm_output;
  reg [20:0] fsm_output;
  input for_C_3_tr0;
  input INNER_LOOP_C_12_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for ntt_flat_core_core_fsm_1
  parameter
    main_C_0 = 5'd0,
    for_C_0 = 5'd1,
    for_C_1 = 5'd2,
    for_C_2 = 5'd3,
    for_C_3 = 5'd4,
    STAGE_LOOP_C_0 = 5'd5,
    INNER_LOOP_C_0 = 5'd6,
    INNER_LOOP_C_1 = 5'd7,
    INNER_LOOP_C_2 = 5'd8,
    INNER_LOOP_C_3 = 5'd9,
    INNER_LOOP_C_4 = 5'd10,
    INNER_LOOP_C_5 = 5'd11,
    INNER_LOOP_C_6 = 5'd12,
    INNER_LOOP_C_7 = 5'd13,
    INNER_LOOP_C_8 = 5'd14,
    INNER_LOOP_C_9 = 5'd15,
    INNER_LOOP_C_10 = 5'd16,
    INNER_LOOP_C_11 = 5'd17,
    INNER_LOOP_C_12 = 5'd18,
    STAGE_LOOP_C_1 = 5'd19,
    main_C_1 = 5'd20;

  reg [4:0] state_var;
  reg [4:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : ntt_flat_core_core_fsm_1
    case (state_var)
      for_C_0 : begin
        fsm_output = 21'b000000000000000000010;
        state_var_NS = for_C_1;
      end
      for_C_1 : begin
        fsm_output = 21'b000000000000000000100;
        state_var_NS = for_C_2;
      end
      for_C_2 : begin
        fsm_output = 21'b000000000000000001000;
        state_var_NS = for_C_3;
      end
      for_C_3 : begin
        fsm_output = 21'b000000000000000010000;
        if ( for_C_3_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_0;
        end
        else begin
          state_var_NS = for_C_0;
        end
      end
      STAGE_LOOP_C_0 : begin
        fsm_output = 21'b000000000000000100000;
        state_var_NS = INNER_LOOP_C_0;
      end
      INNER_LOOP_C_0 : begin
        fsm_output = 21'b000000000000001000000;
        state_var_NS = INNER_LOOP_C_1;
      end
      INNER_LOOP_C_1 : begin
        fsm_output = 21'b000000000000010000000;
        state_var_NS = INNER_LOOP_C_2;
      end
      INNER_LOOP_C_2 : begin
        fsm_output = 21'b000000000000100000000;
        state_var_NS = INNER_LOOP_C_3;
      end
      INNER_LOOP_C_3 : begin
        fsm_output = 21'b000000000001000000000;
        state_var_NS = INNER_LOOP_C_4;
      end
      INNER_LOOP_C_4 : begin
        fsm_output = 21'b000000000010000000000;
        state_var_NS = INNER_LOOP_C_5;
      end
      INNER_LOOP_C_5 : begin
        fsm_output = 21'b000000000100000000000;
        state_var_NS = INNER_LOOP_C_6;
      end
      INNER_LOOP_C_6 : begin
        fsm_output = 21'b000000001000000000000;
        state_var_NS = INNER_LOOP_C_7;
      end
      INNER_LOOP_C_7 : begin
        fsm_output = 21'b000000010000000000000;
        state_var_NS = INNER_LOOP_C_8;
      end
      INNER_LOOP_C_8 : begin
        fsm_output = 21'b000000100000000000000;
        state_var_NS = INNER_LOOP_C_9;
      end
      INNER_LOOP_C_9 : begin
        fsm_output = 21'b000001000000000000000;
        state_var_NS = INNER_LOOP_C_10;
      end
      INNER_LOOP_C_10 : begin
        fsm_output = 21'b000010000000000000000;
        state_var_NS = INNER_LOOP_C_11;
      end
      INNER_LOOP_C_11 : begin
        fsm_output = 21'b000100000000000000000;
        state_var_NS = INNER_LOOP_C_12;
      end
      INNER_LOOP_C_12 : begin
        fsm_output = 21'b001000000000000000000;
        if ( INNER_LOOP_C_12_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = INNER_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 21'b010000000000000000000;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 21'b100000000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 21'b000000000000000000001;
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
      twiddle_h_rsc_triosy_lz, result_rsc_triosy_lz, vec_rsci_q_d, vec_rsci_radr_d,
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsci_q_d, twiddle_h_rsci_q_d,
      result_rsci_d_d, result_rsci_q_d, result_rsci_radr_d, result_rsci_wadr_d, result_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      mult_z_mul_cmp_a, mult_z_mul_cmp_b, mult_z_mul_cmp_z, twiddle_rsci_radr_d_pff,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff, result_rsci_we_d_pff
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
  input [31:0] vec_rsci_q_d;
  output [13:0] vec_rsci_radr_d;
  output vec_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  input [31:0] twiddle_rsci_q_d;
  input [31:0] twiddle_h_rsci_q_d;
  output [31:0] result_rsci_d_d;
  input [31:0] result_rsci_q_d;
  output [17:0] result_rsci_radr_d;
  output [17:0] result_rsci_wadr_d;
  output result_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output [31:0] mult_z_mul_cmp_a;
  reg [31:0] mult_z_mul_cmp_a;
  output [31:0] mult_z_mul_cmp_b;
  reg [31:0] mult_z_mul_cmp_b;
  input [31:0] mult_z_mul_cmp_z;
  output [13:0] twiddle_rsci_radr_d_pff;
  output twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output result_rsci_we_d_pff;


  // Interconnect Declarations
  wire [31:0] p_rsci_idat;
  wire mult_t_mul_cmp_en;
  wire [51:0] mult_t_mul_cmp_z;
  wire [31:0] mult_z_mul_cmp_z_oreg;
  wire [20:0] fsm_output;
  wire or_tmp_37;
  reg [31:0] modulo_add_base_sva;
  reg [13:0] INNER_LOOP_j_13_0_sva_1;
  reg [14:0] for_i_14_0_sva_1;
  reg mult_slc_32_svs;
  reg [31:0] modulo_sub_base_sva;
  wire [32:0] nl_modulo_sub_base_sva;
  reg [31:0] p_sva;
  reg [13:0] reg_butterFly_idx2_17_0_ftd;
  reg reg_vec_rsc_triosy_obj_ld_cse;
  reg reg_ensig_cgo_cse;
  wire or_28_rmff;
  wire [31:0] modulo_sub_qr_lpi_3_dfm_mx0w0;
  wire [32:0] nl_modulo_sub_qr_lpi_3_dfm_mx0w0;
  reg [31:0] INNER_LOOP_tf_h_asn_itm;
  reg [3:0] operator_20_false_acc_itm;
  wire [4:0] nl_operator_20_false_acc_itm;
  reg [3:0] operator_20_false_1_acc_itm;
  wire [4:0] nl_operator_20_false_1_acc_itm;
  reg [12:0] INNER_LOOP_idx1_acc_psp_sva_12_0;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  wire [16:0] INNER_LOOP_idx1_acc_psp_sva_mx0w1;
  wire [17:0] nl_INNER_LOOP_idx1_acc_psp_sva_mx0w1;
  reg [3:0] butterFly_f2_acc_itm;
  wire [4:0] nl_butterFly_f2_acc_itm;
  reg [31:0] modulo_add_mux_itm;
  wire [17:0] z_out;
  wire [31:0] z_out_1;
  wire [17:0] z_out_2;
  wire [13:0] z_out_3;
  reg [3:0] operator_20_false_acc_psp_sva;
  wire [4:0] nl_operator_20_false_acc_psp_sva;
  reg [13:0] operator_33_true_return_13_0_sva;
  reg [13:0] operator_20_false_rshift_psp_sva;
  reg [17:0] INNER_LOOP_k_lshift_itm;
  reg [16:0] INNER_LOOP_idx1_mul_itm;
  wire [27:0] nl_INNER_LOOP_idx1_mul_itm;
  reg [31:0] INNER_LOOP_tf_asn_itm;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [17:0] butterFly_idx2_17_0_sva_mx0w0;
  wire [18:0] nl_butterFly_idx2_17_0_sva_mx0w0;
  wire [17:0] INNER_LOOP_k_INNER_LOOP_k_mux_rgt;
  reg [4:0] INNER_LOOP_k_17_0_sva_17_13;
  reg [12:0] INNER_LOOP_k_17_0_sva_12_0;
  wire operator_20_false_acc_itm_4_1;

  wire[0:0] and_63_nl;
  wire[0:0] and_65_nl;
  wire[13:0] for_i_mux_1_nl;
  wire[13:0] INNER_LOOP_acc_1_nl;
  wire[14:0] nl_INNER_LOOP_acc_1_nl;
  wire[0:0] INNER_LOOP_j_not_3_nl;
  wire[31:0] butterFly_acc_1_nl;
  wire[32:0] nl_butterFly_acc_1_nl;
  wire[12:0] INNER_LOOP_j_INNER_LOOP_j_and_nl;
  wire[0:0] INNER_LOOP_j_or_2_nl;
  wire[0:0] or_54_nl;
  wire[13:0] INNER_LOOP_idx1_mux_2_nl;
  wire[13:0] INNER_LOOP_idx1_mux_3_nl;
  wire[32:0] modulo_add_acc_1_nl;
  wire[33:0] nl_modulo_add_acc_1_nl;
  wire[32:0] mult_if_acc_1_nl;
  wire[33:0] nl_mult_if_acc_1_nl;
  wire[4:0] operator_20_false_acc_nl;
  wire[5:0] nl_operator_20_false_acc_nl;
  wire[0:0] or_17_nl;
  wire[0:0] and_43_nl;
  wire[3:0] for_mux_nl;
  wire[3:0] butterFly_f1_acc_nl;
  wire[4:0] nl_butterFly_f1_acc_nl;
  wire[12:0] for_mux_4_nl;
  wire[0:0] for_mux_5_nl;
  wire[3:0] for_for_and_nl;
  wire[3:0] for_mux_6_nl;
  wire[0:0] for_not_nl;
  wire[13:0] for_mux1h_nl;
  wire[18:0] acc_nl;
  wire[19:0] nl_acc_nl;
  wire[17:0] for_mux_9_nl;
  wire[0:0] for_or_1_nl;
  wire[12:0] for_mux_10_nl;
  wire[32:0] acc_1_nl;
  wire[33:0] nl_acc_1_nl;
  wire[31:0] mult_res_mux_1_nl;
  wire[0:0] or_78_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_mult_t_mul_cmp_a;
  assign nl_mult_t_mul_cmp_a = MUX_v_32_2_2(({1'b0 , (modulo_sub_base_sva[30:0])}),
      modulo_sub_qr_lpi_3_dfm_mx0w0, modulo_sub_base_sva[31]);
  wire [31:0] nl_mult_t_mul_cmp_b;
  assign nl_mult_t_mul_cmp_b = INNER_LOOP_tf_h_asn_itm;
  wire [12:0] nl_INNER_LOOP_k_lshift_rg_a;
  assign nl_INNER_LOOP_k_lshift_rg_a = MUX_v_13_2_2(13'b0000000000001, (z_out_3[12:0]),
      fsm_output[6]);
  wire[3:0] operator_20_false_1_acc_nl;
  wire[4:0] nl_operator_20_false_1_acc_nl;
  wire [3:0] nl_INNER_LOOP_k_lshift_rg_s;
  assign nl_operator_20_false_1_acc_nl = STAGE_LOOP_i_3_0_sva + 4'b1111;
  assign operator_20_false_1_acc_nl = nl_operator_20_false_1_acc_nl[3:0];
  assign nl_INNER_LOOP_k_lshift_rg_s = MUX_v_4_2_2(operator_20_false_1_acc_nl, operator_20_false_acc_psp_sva,
      fsm_output[6]);
  wire[12:0] operator_20_false_operator_20_false_and_nl;
  wire [14:0] nl_INNER_LOOP_g_rshift_rg_a;
  assign operator_20_false_operator_20_false_and_nl = MUX_v_13_2_2(13'b0000000000000,
      INNER_LOOP_k_17_0_sva_12_0, (fsm_output[6]));
  assign nl_INNER_LOOP_g_rshift_rg_a = {(~ (fsm_output[6])) , 1'b0 , operator_20_false_operator_20_false_and_nl};
  wire [3:0] nl_INNER_LOOP_g_rshift_rg_s;
  assign nl_INNER_LOOP_g_rshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, operator_20_false_acc_psp_sva,
      fsm_output[6]);
  wire [0:0] nl_ntt_flat_core_core_fsm_inst_for_C_3_tr0;
  assign nl_ntt_flat_core_core_fsm_inst_for_C_3_tr0 = for_i_14_0_sva_1[14];
  wire [0:0] nl_ntt_flat_core_core_fsm_inst_INNER_LOOP_C_12_tr0;
  assign nl_ntt_flat_core_core_fsm_inst_INNER_LOOP_C_12_tr0 = INNER_LOOP_j_13_0_sva_1[13];
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
  mgc_shift_l_v5 #(.width_a(32'sd13),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd18)) INNER_LOOP_k_lshift_rg (
      .a(nl_INNER_LOOP_k_lshift_rg_a[12:0]),
      .s(nl_INNER_LOOP_k_lshift_rg_s[3:0]),
      .z(z_out_2)
    );
  mgc_shift_r_v5 #(.width_a(32'sd15),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd14)) INNER_LOOP_g_rshift_rg (
      .a(nl_INNER_LOOP_g_rshift_rg_a[14:0]),
      .s(nl_INNER_LOOP_g_rshift_rg_s[3:0]),
      .z(z_out_3)
    );
  ntt_flat_core_wait_dp ntt_flat_core_wait_dp_inst (
      .clk(clk),
      .ensig_cgo_iro(or_28_rmff),
      .mult_z_mul_cmp_z(mult_z_mul_cmp_z),
      .ensig_cgo(reg_ensig_cgo_cse),
      .mult_t_mul_cmp_en(mult_t_mul_cmp_en),
      .mult_z_mul_cmp_z_oreg(mult_z_mul_cmp_z_oreg)
    );
  ntt_flat_core_core_fsm ntt_flat_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .for_C_3_tr0(nl_ntt_flat_core_core_fsm_inst_for_C_3_tr0[0:0]),
      .INNER_LOOP_C_12_tr0(nl_ntt_flat_core_core_fsm_inst_INNER_LOOP_C_12_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_ntt_flat_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_28_rmff = (fsm_output[13:11]!=3'b000);
  assign INNER_LOOP_j_or_2_nl = (fsm_output[18]) | (fsm_output[6]);
  assign INNER_LOOP_j_INNER_LOOP_j_and_nl = MUX_v_13_2_2(13'b0000000000000, (INNER_LOOP_j_13_0_sva_1[12:0]),
      INNER_LOOP_j_or_2_nl);
  assign or_54_nl = (fsm_output[5]) | (fsm_output[18]) | (fsm_output[6]);
  assign INNER_LOOP_k_INNER_LOOP_k_mux_rgt = MUX_v_18_2_2(z_out, ({5'b00000 , INNER_LOOP_j_INNER_LOOP_j_and_nl}),
      or_54_nl);
  assign nl_modulo_sub_qr_lpi_3_dfm_mx0w0 = ({1'b1 , (modulo_sub_base_sva[30:0])})
      + p_sva;
  assign modulo_sub_qr_lpi_3_dfm_mx0w0 = nl_modulo_sub_qr_lpi_3_dfm_mx0w0[31:0];
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_INNER_LOOP_idx1_acc_psp_sva_mx0w1 = INNER_LOOP_idx1_mul_itm + ({INNER_LOOP_k_17_0_sva_17_13
      , (INNER_LOOP_k_17_0_sva_12_0[12:1])});
  assign INNER_LOOP_idx1_acc_psp_sva_mx0w1 = nl_INNER_LOOP_idx1_acc_psp_sva_mx0w1[16:0];
  assign nl_butterFly_idx2_17_0_sva_mx0w0 = ({INNER_LOOP_idx1_acc_psp_sva_mx0w1 ,
      (INNER_LOOP_k_17_0_sva_12_0[0])}) + conv_u2u_14_18(operator_20_false_rshift_psp_sva);
  assign butterFly_idx2_17_0_sva_mx0w0 = nl_butterFly_idx2_17_0_sva_mx0w0[17:0];
  assign nl_operator_20_false_acc_nl = ({1'b1 , (~ STAGE_LOOP_i_3_0_sva_2)}) + 5'b01111;
  assign operator_20_false_acc_nl = nl_operator_20_false_acc_nl[4:0];
  assign operator_20_false_acc_itm_4_1 = readslicef_5_1_4(operator_20_false_acc_nl);
  assign or_tmp_37 = ~((fsm_output[5]) | (fsm_output[20]) | (fsm_output[1]) | (fsm_output[2])
      | (fsm_output[0]) | (fsm_output[3]) | (fsm_output[19]) | (fsm_output[4]));
  assign vec_rsci_radr_d = INNER_LOOP_j_13_0_sva_1;
  assign vec_rsci_readA_r_ram_ir_internal_RMASK_B_d = fsm_output[1];
  assign twiddle_rsci_radr_d_pff = INNER_LOOP_idx1_mul_itm[13:0];
  assign twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff = fsm_output[9];
  assign or_17_nl = (fsm_output[3]) | (mult_slc_32_svs & (fsm_output[17]));
  assign and_43_nl = (~ mult_slc_32_svs) & (fsm_output[17]);
  assign result_rsci_d_d = MUX1HOT_v_32_3_2(modulo_add_base_sva, modulo_add_mux_itm,
      z_out_1, {or_17_nl , (fsm_output[12]) , and_43_nl});
  assign nl_butterFly_f1_acc_nl = STAGE_LOOP_i_3_0_sva + (INNER_LOOP_idx1_acc_psp_sva_mx0w1[16:13]);
  assign butterFly_f1_acc_nl = nl_butterFly_f1_acc_nl[3:0];
  assign for_mux_nl = MUX_v_4_2_2(butterFly_f1_acc_nl, butterFly_f2_acc_itm, fsm_output[9]);
  assign for_mux_4_nl = MUX_v_13_2_2((INNER_LOOP_idx1_acc_psp_sva_mx0w1[12:0]), (reg_butterFly_idx2_17_0_ftd[13:1]),
      fsm_output[9]);
  assign for_mux_5_nl = MUX_s_1_2_2((INNER_LOOP_k_17_0_sva_12_0[0]), (reg_butterFly_idx2_17_0_ftd[0]),
      fsm_output[9]);
  assign result_rsci_radr_d = {for_mux_nl , for_mux_4_nl , for_mux_5_nl};
  assign for_mux_6_nl = MUX_v_4_2_2(operator_20_false_acc_itm, operator_20_false_1_acc_itm,
      fsm_output[17]);
  assign for_not_nl = ~ (fsm_output[3]);
  assign for_for_and_nl = MUX_v_4_2_2(4'b0000, for_mux_6_nl, for_not_nl);
  assign for_mux1h_nl = MUX1HOT_v_14_3_2(INNER_LOOP_j_13_0_sva_1, ({INNER_LOOP_idx1_acc_psp_sva_12_0
      , (INNER_LOOP_k_17_0_sva_12_0[0])}), reg_butterFly_idx2_17_0_ftd, {(fsm_output[3])
      , (fsm_output[12]) , (fsm_output[17])});
  assign result_rsci_wadr_d = {for_for_and_nl , for_mux1h_nl};
  assign result_rsci_we_d_pff = (fsm_output[17]) | (fsm_output[12]) | (fsm_output[3]);
  assign result_rsci_readA_r_ram_ir_internal_RMASK_B_d = (fsm_output[9:8]!=2'b00);
  always @(posedge clk) begin
    if ( (fsm_output[20]) | (fsm_output[0]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_obj_ld_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      modulo_sub_base_sva <= 32'b00000000000000000000000000000000;
      mult_slc_32_svs <= 1'b0;
    end
    else begin
      reg_vec_rsc_triosy_obj_ld_cse <= operator_20_false_acc_itm_4_1 & (fsm_output[19]);
      reg_ensig_cgo_cse <= or_28_rmff;
      modulo_sub_base_sva <= nl_modulo_sub_base_sva[31:0];
      mult_slc_32_svs <= readslicef_33_1_32(mult_if_acc_1_nl);
    end
  end
  always @(posedge clk) begin
    mult_z_mul_cmp_a <= MUX1HOT_v_32_3_2(modulo_sub_qr_lpi_3_dfm_mx0w0, ({1'b0 ,
        (modulo_sub_base_sva[30:0])}), (mult_t_mul_cmp_z[51:20]), {and_63_nl , and_65_nl
        , (fsm_output[14])});
    mult_z_mul_cmp_b <= MUX_v_32_2_2(INNER_LOOP_tf_asn_itm, p_sva, fsm_output[14]);
    INNER_LOOP_k_lshift_itm <= z_out_2;
    INNER_LOOP_idx1_mul_itm <= nl_INNER_LOOP_idx1_mul_itm[16:0];
    butterFly_f2_acc_itm <= nl_butterFly_f2_acc_itm[3:0];
    INNER_LOOP_tf_h_asn_itm <= twiddle_h_rsci_q_d;
    INNER_LOOP_tf_asn_itm <= twiddle_rsci_q_d;
    modulo_add_mux_itm <= MUX_v_32_2_2(modulo_add_base_sva, z_out_1, readslicef_33_1_32(modulo_add_acc_1_nl));
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_j_13_0_sva_1 <= 14'b00000000000000;
    end
    else if ( (fsm_output[0]) | (fsm_output[4]) | (fsm_output[6]) ) begin
      INNER_LOOP_j_13_0_sva_1 <= MUX_v_14_2_2(14'b00000000000000, for_i_mux_1_nl,
          INNER_LOOP_j_not_3_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_i_14_0_sva_1 <= 15'b000000000000000;
    end
    else if ( fsm_output[1] ) begin
      for_i_14_0_sva_1 <= z_out[14:0];
    end
  end
  always @(posedge clk) begin
    if ( (fsm_output[9]) | (fsm_output[10]) | (fsm_output[16]) | (fsm_output[2])
        | (fsm_output[13]) ) begin
      modulo_add_base_sva <= MUX1HOT_v_32_5_2(vec_rsci_q_d, result_rsci_q_d, butterFly_acc_1_nl,
          mult_z_mul_cmp_z_oreg, z_out_1, {(fsm_output[2]) , (fsm_output[9]) , (fsm_output[10])
          , (fsm_output[13]) , (fsm_output[16])});
    end
  end
  always @(posedge clk) begin
    if ( (fsm_output[4]) | (fsm_output[19]) ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, fsm_output[19]);
    end
  end
  always @(posedge clk) begin
    if ( ~ or_tmp_37 ) begin
      operator_33_true_return_13_0_sva <= z_out_2[13:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_tmp_37 ) begin
      operator_20_false_rshift_psp_sva <= z_out_3;
    end
  end
  always @(posedge clk) begin
    if ( ~ or_tmp_37 ) begin
      operator_20_false_acc_psp_sva <= nl_operator_20_false_acc_psp_sva[3:0];
    end
  end
  always @(posedge clk) begin
    if ( (fsm_output[18]) | (fsm_output[5]) | (fsm_output[7]) | (fsm_output[6]) )
        begin
      INNER_LOOP_k_17_0_sva_17_13 <= INNER_LOOP_k_INNER_LOOP_k_mux_rgt[17:13];
    end
  end
  always @(posedge clk) begin
    if ( (fsm_output[5]) | (fsm_output[7]) | (fsm_output[18]) ) begin
      INNER_LOOP_k_17_0_sva_12_0 <= INNER_LOOP_k_INNER_LOOP_k_mux_rgt[12:0];
    end
  end
  always @(posedge clk) begin
    if ( (fsm_output[8]) | (fsm_output[6]) ) begin
      INNER_LOOP_idx1_acc_psp_sva_12_0 <= MUX_v_13_2_2((z_out_3[12:0]), (INNER_LOOP_idx1_acc_psp_sva_mx0w1[12:0]),
          fsm_output[8]);
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[8] ) begin
      operator_20_false_1_acc_itm <= nl_operator_20_false_1_acc_itm[3:0];
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[8] ) begin
      reg_butterFly_idx2_17_0_ftd <= butterFly_idx2_17_0_sva_mx0w0[13:0];
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[8] ) begin
      operator_20_false_acc_itm <= nl_operator_20_false_acc_itm[3:0];
    end
  end
  assign and_63_nl = (modulo_sub_base_sva[31]) & (fsm_output[11]);
  assign and_65_nl = (~ (modulo_sub_base_sva[31])) & (fsm_output[11]);
  assign INNER_LOOP_idx1_mux_2_nl = MUX_v_14_2_2(({1'b0 , INNER_LOOP_idx1_acc_psp_sva_12_0}),
      operator_33_true_return_13_0_sva, fsm_output[8]);
  assign INNER_LOOP_idx1_mux_3_nl = MUX_v_14_2_2(operator_20_false_rshift_psp_sva,
      ({(INNER_LOOP_k_17_0_sva_17_13[0]) , INNER_LOOP_k_17_0_sva_12_0}), fsm_output[8]);
  assign nl_INNER_LOOP_idx1_mul_itm  = INNER_LOOP_idx1_mux_2_nl * INNER_LOOP_idx1_mux_3_nl;
  assign nl_butterFly_f2_acc_itm  = STAGE_LOOP_i_3_0_sva + (butterFly_idx2_17_0_sva_mx0w0[17:14]);
  assign nl_modulo_sub_base_sva  = modulo_add_base_sva - result_rsci_q_d;
  assign nl_modulo_add_acc_1_nl = ({1'b1 , p_sva}) + conv_u2u_32_33(~ modulo_add_base_sva)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_acc_1_nl = nl_modulo_add_acc_1_nl[32:0];
  assign nl_mult_if_acc_1_nl = ({1'b1 , z_out_1}) + conv_u2u_32_33(~ p_sva) + 33'b000000000000000000000000000000001;
  assign mult_if_acc_1_nl = nl_mult_if_acc_1_nl[32:0];
  assign nl_INNER_LOOP_acc_1_nl = conv_u2u_13_14(INNER_LOOP_k_17_0_sva_12_0) + 14'b00000000000001;
  assign INNER_LOOP_acc_1_nl = nl_INNER_LOOP_acc_1_nl[13:0];
  assign for_i_mux_1_nl = MUX_v_14_2_2((for_i_14_0_sva_1[13:0]), INNER_LOOP_acc_1_nl,
      fsm_output[6]);
  assign INNER_LOOP_j_not_3_nl = ~ (fsm_output[0]);
  assign nl_butterFly_acc_1_nl = modulo_add_base_sva + result_rsci_q_d;
  assign butterFly_acc_1_nl = nl_butterFly_acc_1_nl[31:0];
  assign nl_operator_20_false_acc_psp_sva  = (~ STAGE_LOOP_i_3_0_sva) + 4'b1111;
  assign nl_operator_20_false_1_acc_itm  = STAGE_LOOP_i_3_0_sva + (butterFly_idx2_17_0_sva_mx0w0[17:14])
      + 4'b0001;
  assign nl_operator_20_false_acc_itm  = STAGE_LOOP_i_3_0_sva + (INNER_LOOP_idx1_acc_psp_sva_mx0w1[16:13])
      + 4'b0001;
  assign for_mux_9_nl = MUX_v_18_2_2(({4'b0000 , INNER_LOOP_j_13_0_sva_1}), (~ INNER_LOOP_k_lshift_itm),
      fsm_output[7]);
  assign for_or_1_nl = (~ (fsm_output[1])) | (fsm_output[7]);
  assign for_mux_10_nl = MUX_v_13_2_2(13'b0000000000001, INNER_LOOP_k_17_0_sva_12_0,
      fsm_output[7]);
  assign nl_acc_nl = ({for_mux_9_nl , for_or_1_nl}) + conv_u2u_14_19({for_mux_10_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[18:0];
  assign z_out = readslicef_19_18_1(acc_nl);
  assign or_78_nl = (fsm_output[17]) | (fsm_output[11]);
  assign mult_res_mux_1_nl = MUX_v_32_2_2((~ mult_z_mul_cmp_z_oreg), (~ p_sva), or_78_nl);
  assign nl_acc_1_nl = ({modulo_add_base_sva , 1'b1}) + ({mult_res_mux_1_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[32:0];
  assign z_out_1 = readslicef_33_32_1(acc_1_nl);

  function automatic [13:0] MUX1HOT_v_14_3_2;
    input [13:0] input_2;
    input [13:0] input_1;
    input [13:0] input_0;
    input [2:0] sel;
    reg [13:0] result;
  begin
    result = input_0 & {14{sel[0]}};
    result = result | ( input_1 & {14{sel[1]}});
    result = result | ( input_2 & {14{sel[2]}});
    MUX1HOT_v_14_3_2 = result;
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


  function automatic [31:0] MUX1HOT_v_32_5_2;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [4:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    MUX1HOT_v_32_5_2 = result;
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


  function automatic [17:0] MUX_v_18_2_2;
    input [17:0] input_0;
    input [17:0] input_1;
    input [0:0] sel;
    reg [17:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_18_2_2 = result;
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


  function automatic [17:0] readslicef_19_18_1;
    input [18:0] vector;
    reg [18:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_19_18_1 = tmp[17:0];
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


  function automatic [13:0] conv_u2u_13_14 ;
    input [12:0]  vector ;
  begin
    conv_u2u_13_14 = {1'b0, vector};
  end
  endfunction


  function automatic [17:0] conv_u2u_14_18 ;
    input [13:0]  vector ;
  begin
    conv_u2u_14_18 = {{4{1'b0}}, vector};
  end
  endfunction


  function automatic [18:0] conv_u2u_14_19 ;
    input [13:0]  vector ;
  begin
    conv_u2u_14_19 = {{5{1'b0}}, vector};
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
  clk, rst, vec_rsc_radr, vec_rsc_q, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_radr, twiddle_rsc_q, twiddle_rsc_triosy_lz,
      twiddle_h_rsc_radr, twiddle_h_rsc_q, twiddle_h_rsc_triosy_lz, result_rsc_wadr,
      result_rsc_d, result_rsc_we, result_rsc_radr, result_rsc_q, result_rsc_triosy_lz
);
  input clk;
  input rst;
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
  output [17:0] result_rsc_wadr;
  output [31:0] result_rsc_d;
  output result_rsc_we;
  output [17:0] result_rsc_radr;
  input [31:0] result_rsc_q;
  output result_rsc_triosy_lz;


  // Interconnect Declarations
  wire [31:0] vec_rsci_q_d;
  wire [13:0] vec_rsci_radr_d;
  wire vec_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire [31:0] twiddle_rsci_q_d;
  wire [31:0] twiddle_h_rsci_q_d;
  wire [31:0] result_rsci_d_d;
  wire [31:0] result_rsci_q_d;
  wire [17:0] result_rsci_radr_d;
  wire [17:0] result_rsci_wadr_d;
  wire result_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire [31:0] mult_z_mul_cmp_a;
  wire [31:0] mult_z_mul_cmp_b;
  wire [13:0] twiddle_rsci_radr_d_iff;
  wire twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire result_rsci_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_ntt_flat_core_inst_mult_z_mul_cmp_z;
  assign nl_ntt_flat_core_inst_mult_z_mul_cmp_z = conv_u2u_64_32(mult_z_mul_cmp_a
      * mult_z_mul_cmp_b);
  ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_14_32_16384_16384_32_1_gen vec_rsci
      (
      .q(vec_rsc_q),
      .radr(vec_rsc_radr),
      .q_d(vec_rsci_q_d),
      .radr_d(vec_rsci_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen twiddle_rsci
      (
      .q(twiddle_rsc_q),
      .radr(twiddle_rsc_radr),
      .q_d(twiddle_rsci_q_d),
      .radr_d(twiddle_rsci_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_14_32_16384_16384_32_1_gen twiddle_h_rsci
      (
      .q(twiddle_h_rsc_q),
      .radr(twiddle_h_rsc_radr),
      .q_d(twiddle_h_rsci_q_d),
      .radr_d(twiddle_rsci_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  ntt_flat_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_6_18_32_245760_245760_32_1_gen result_rsci
      (
      .q(result_rsc_q),
      .radr(result_rsc_radr),
      .we(result_rsc_we),
      .d(result_rsc_d),
      .wadr(result_rsc_wadr),
      .d_d(result_rsci_d_d),
      .q_d(result_rsci_q_d),
      .radr_d(result_rsci_radr_d),
      .wadr_d(result_rsci_wadr_d),
      .we_d(result_rsci_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsci_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(result_rsci_readA_r_ram_ir_internal_RMASK_B_d)
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
      .vec_rsci_q_d(vec_rsci_q_d),
      .vec_rsci_radr_d(vec_rsci_radr_d),
      .vec_rsci_readA_r_ram_ir_internal_RMASK_B_d(vec_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsci_q_d(twiddle_rsci_q_d),
      .twiddle_h_rsci_q_d(twiddle_h_rsci_q_d),
      .result_rsci_d_d(result_rsci_d_d),
      .result_rsci_q_d(result_rsci_q_d),
      .result_rsci_radr_d(result_rsci_radr_d),
      .result_rsci_wadr_d(result_rsci_wadr_d),
      .result_rsci_readA_r_ram_ir_internal_RMASK_B_d(result_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .mult_z_mul_cmp_a(mult_z_mul_cmp_a),
      .mult_z_mul_cmp_b(mult_z_mul_cmp_b),
      .mult_z_mul_cmp_z(nl_ntt_flat_core_inst_mult_z_mul_cmp_z[31:0]),
      .twiddle_rsci_radr_d_pff(twiddle_rsci_radr_d_iff),
      .twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .result_rsci_we_d_pff(result_rsci_we_d_iff)
    );

  function automatic [31:0] conv_u2u_64_32 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_32 = vector[31:0];
  end
  endfunction

endmodule



