
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


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_inout_prereg_en_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2019 Mentor Graphics Corp.
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


module mgc_inout_prereg_en_v1 (din, ldout, dout, zin, lzout, zout);

    parameter integer rscid = 1;
    parameter integer width = 8;

    output [width-1:0] din;
    input              ldout;
    input  [width-1:0] dout;
    input  [width-1:0] zin;
    output             lzout;
    output [width-1:0] zout;

    wire   [width-1:0] din;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzout = ldout;
    assign din = zin;
    assign zout = dout;

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


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_rem_beh.v 
module mgc_rem(a,b,z);
   parameter width_a = 8;
   parameter width_b = 8;
   parameter signd = 1;
   input [width_a-1:0] a;
   input [width_b-1:0] b; 
   output [width_b-1:0] z;  
   reg  [width_b-1:0] z;

   always@(a or b)
     begin
	if(signd)
	  rem_s(a,b,z);
	else
          rem_u(a,b,z);
     end


//-----------------------------------------------------------------
//     -- Vectorized Overloaded Arithmetic Operators
//-----------------------------------------------------------------
   
   function [width_a-1:0] fabs_l; 
      input [width_a-1:0] arg1;
      begin
         case(arg1[width_a-1])
            1'b1:
               fabs_l = {(width_a){1'b0}} - arg1;
            default: // was: 1'b0:
               fabs_l = arg1;
         endcase
      end
   endfunction
   
   function [width_b-1:0] fabs_r; 
      input [width_b-1:0] arg1;
      begin
         case (arg1[width_b-1])
            1'b1:
               fabs_r =  {(width_b){1'b0}} - arg1;
            default: // was: 1'b0:
               fabs_r = arg1;
         endcase
      end
   endfunction

   function [width_b:0] minus;
     input [width_b:0] in1;
     input [width_b:0] in2;
     reg [width_b+1:0] tmp;
     begin
       tmp = in1 - in2;
       minus = tmp[width_b:0];
     end
   endfunction

   
   task divmod;
      input [width_a-1:0] l;
      input [width_b-1:0] r;
      output [width_a-1:0] rdiv;
      output [width_b-1:0] rmod;
      
      parameter llen = width_a;
      parameter rlen = width_b;
      reg [(llen+rlen)-1:0] lbuf;
      reg [rlen:0] diff;
	  integer i;
      begin
	 lbuf = {(llen+rlen){1'b0}};
//64'b0;
	 lbuf[llen-1:0] = l;
	 for(i=width_a-1;i>=0;i=i-1)
	   begin
              diff = minus(lbuf[(llen+rlen)-1:llen-1], {1'b0,r});
	      rdiv[i] = ~diff[rlen];
	      if(diff[rlen] == 0)
		lbuf[(llen+rlen)-1:llen-1] = diff;
	      lbuf[(llen+rlen)-1:1] = lbuf[(llen+rlen)-2:0];
	   end
	 rmod = lbuf[(llen+rlen)-1:llen];
      end
   endtask
      

   task div_u;
      input [width_a-1:0] l;
      input [width_b-1:0] r;
      output [width_a-1:0] rdiv;
      
      reg [width_a-01:0] rdiv;
      reg [width_b-1:0] rmod;
      begin
	 divmod(l, r, rdiv, rmod);
      end
   endtask
   
   task mod_u;
      input [width_a-1:0] l;
      input [width_b-1:0] r;
      output [width_b-1:0] rmod;
      
      reg [width_a-01:0] rdiv;
      reg [width_b-1:0] rmod;
      begin
	 divmod(l, r, rdiv, rmod);
      end
   endtask

   task rem_u; 
      input [width_a-1:0] l;
      input [width_b-1:0] r;    
      output [width_b-1:0] rmod;
      begin
	 mod_u(l,r,rmod);
      end
   endtask // rem_u

   task div_s;
      input [width_a-1:0] l;
      input [width_b-1:0] r;
      output [width_a-1:0] rdiv;
      
      reg [width_a-01:0] rdiv;
      reg [width_b-1:0] rmod;
      begin
	 divmod(fabs_l(l), fabs_r(r),rdiv,rmod);
	 if(l[width_a-1] != r[width_b-1])
	   rdiv = {(width_a){1'b0}} - rdiv;
      end
   endtask

   task mod_s;
      input [width_a-1:0] l;
      input [width_b-1:0] r;
      output [width_b-1:0] rmod;
      
      reg [width_a-01:0] rdiv;
      reg [width_b-1:0] rmod;
      reg [width_b-1:0] rnul;
      reg [width_b:0] rmod_t;
      begin
         rnul = {width_b{1'b0}};
	 divmod(fabs_l(l), fabs_r(r), rdiv, rmod);
         if (l[width_a-1])
	   rmod = {(width_b){1'b0}} - rmod;
	 if((rmod != rnul) && (l[width_a-1] != r[width_b-1]))
            begin
               rmod_t = r + rmod;
               rmod = rmod_t[width_b-1:0];
            end
      end
   endtask // mod_s
   
   task rem_s; 
      input [width_a-1:0] l;
      input [width_b-1:0] r;    
      output [width_b-1:0] rmod;   
      reg [width_a-01:0] rdiv;
      reg [width_b-1:0] rmod;
      begin
	 divmod(fabs_l(l),fabs_r(r),rdiv,rmod);
	 if(l[width_a-1])
	   rmod = {(width_b){1'b0}} - rmod;
      end
   endtask

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

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Sat Aug 14 12:19:03 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    modExp_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module modExp_core_core_fsm (
  clk, rst, fsm_output, main_C_1_tr0, while_C_25_tr0
);
  input clk;
  input rst;
  output [29:0] fsm_output;
  reg [29:0] fsm_output;
  input main_C_1_tr0;
  input while_C_25_tr0;


  // FSM State Type Declaration for modExp_core_core_fsm_1
  parameter
    core_rlp_C_0 = 5'd0,
    main_C_0 = 5'd1,
    main_C_1 = 5'd2,
    while_C_0 = 5'd3,
    while_C_1 = 5'd4,
    while_C_2 = 5'd5,
    while_C_3 = 5'd6,
    while_C_4 = 5'd7,
    while_C_5 = 5'd8,
    while_C_6 = 5'd9,
    while_C_7 = 5'd10,
    while_C_8 = 5'd11,
    while_C_9 = 5'd12,
    while_C_10 = 5'd13,
    while_C_11 = 5'd14,
    while_C_12 = 5'd15,
    while_C_13 = 5'd16,
    while_C_14 = 5'd17,
    while_C_15 = 5'd18,
    while_C_16 = 5'd19,
    while_C_17 = 5'd20,
    while_C_18 = 5'd21,
    while_C_19 = 5'd22,
    while_C_20 = 5'd23,
    while_C_21 = 5'd24,
    while_C_22 = 5'd25,
    while_C_23 = 5'd26,
    while_C_24 = 5'd27,
    while_C_25 = 5'd28,
    main_C_2 = 5'd29;

  reg [4:0] state_var;
  reg [4:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : modExp_core_core_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 30'b000000000000000000000000000010;
        state_var_NS = main_C_1;
      end
      main_C_1 : begin
        fsm_output = 30'b000000000000000000000000000100;
        if ( main_C_1_tr0 ) begin
          state_var_NS = main_C_2;
        end
        else begin
          state_var_NS = while_C_0;
        end
      end
      while_C_0 : begin
        fsm_output = 30'b000000000000000000000000001000;
        state_var_NS = while_C_1;
      end
      while_C_1 : begin
        fsm_output = 30'b000000000000000000000000010000;
        state_var_NS = while_C_2;
      end
      while_C_2 : begin
        fsm_output = 30'b000000000000000000000000100000;
        state_var_NS = while_C_3;
      end
      while_C_3 : begin
        fsm_output = 30'b000000000000000000000001000000;
        state_var_NS = while_C_4;
      end
      while_C_4 : begin
        fsm_output = 30'b000000000000000000000010000000;
        state_var_NS = while_C_5;
      end
      while_C_5 : begin
        fsm_output = 30'b000000000000000000000100000000;
        state_var_NS = while_C_6;
      end
      while_C_6 : begin
        fsm_output = 30'b000000000000000000001000000000;
        state_var_NS = while_C_7;
      end
      while_C_7 : begin
        fsm_output = 30'b000000000000000000010000000000;
        state_var_NS = while_C_8;
      end
      while_C_8 : begin
        fsm_output = 30'b000000000000000000100000000000;
        state_var_NS = while_C_9;
      end
      while_C_9 : begin
        fsm_output = 30'b000000000000000001000000000000;
        state_var_NS = while_C_10;
      end
      while_C_10 : begin
        fsm_output = 30'b000000000000000010000000000000;
        state_var_NS = while_C_11;
      end
      while_C_11 : begin
        fsm_output = 30'b000000000000000100000000000000;
        state_var_NS = while_C_12;
      end
      while_C_12 : begin
        fsm_output = 30'b000000000000001000000000000000;
        state_var_NS = while_C_13;
      end
      while_C_13 : begin
        fsm_output = 30'b000000000000010000000000000000;
        state_var_NS = while_C_14;
      end
      while_C_14 : begin
        fsm_output = 30'b000000000000100000000000000000;
        state_var_NS = while_C_15;
      end
      while_C_15 : begin
        fsm_output = 30'b000000000001000000000000000000;
        state_var_NS = while_C_16;
      end
      while_C_16 : begin
        fsm_output = 30'b000000000010000000000000000000;
        state_var_NS = while_C_17;
      end
      while_C_17 : begin
        fsm_output = 30'b000000000100000000000000000000;
        state_var_NS = while_C_18;
      end
      while_C_18 : begin
        fsm_output = 30'b000000001000000000000000000000;
        state_var_NS = while_C_19;
      end
      while_C_19 : begin
        fsm_output = 30'b000000010000000000000000000000;
        state_var_NS = while_C_20;
      end
      while_C_20 : begin
        fsm_output = 30'b000000100000000000000000000000;
        state_var_NS = while_C_21;
      end
      while_C_21 : begin
        fsm_output = 30'b000001000000000000000000000000;
        state_var_NS = while_C_22;
      end
      while_C_22 : begin
        fsm_output = 30'b000010000000000000000000000000;
        state_var_NS = while_C_23;
      end
      while_C_23 : begin
        fsm_output = 30'b000100000000000000000000000000;
        state_var_NS = while_C_24;
      end
      while_C_24 : begin
        fsm_output = 30'b001000000000000000000000000000;
        state_var_NS = while_C_25;
      end
      while_C_25 : begin
        fsm_output = 30'b010000000000000000000000000000;
        if ( while_C_25_tr0 ) begin
          state_var_NS = main_C_2;
        end
        else begin
          state_var_NS = while_C_0;
        end
      end
      main_C_2 : begin
        fsm_output = 30'b100000000000000000000000000000;
        state_var_NS = main_C_0;
      end
      // core_rlp_C_0
      default : begin
        fsm_output = 30'b000000000000000000000000000001;
        state_var_NS = main_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= core_rlp_C_0;
    end
    else begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    modExp_core_wait_dp
// ------------------------------------------------------------------


module modExp_core_wait_dp (
  ensig_cgo_iro, ensig_cgo, while_mul_cmp_en
);
  input ensig_cgo_iro;
  input ensig_cgo;
  output while_mul_cmp_en;



  // Interconnect Declarations for Component Instantiations 
  assign while_mul_cmp_en = ensig_cgo | ensig_cgo_iro;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    modExp_core
// ------------------------------------------------------------------


module modExp_core (
  clk, rst, base_rsc_dat, base_rsc_triosy_lz, exp_rsc_dat, exp_rsc_triosy_lz, m_rsc_dat,
      m_rsc_triosy_lz, result_rsc_zout, result_rsc_lzout, result_rsc_zin, result_rsc_triosy_lz
);
  input clk;
  input rst;
  input [63:0] base_rsc_dat;
  output base_rsc_triosy_lz;
  input [63:0] exp_rsc_dat;
  output exp_rsc_triosy_lz;
  input [63:0] m_rsc_dat;
  output m_rsc_triosy_lz;
  output [63:0] result_rsc_zout;
  output result_rsc_lzout;
  input [63:0] result_rsc_zin;
  output result_rsc_triosy_lz;


  // Interconnect Declarations
  wire [63:0] base_rsci_idat;
  wire [63:0] exp_rsci_idat;
  wire [63:0] m_rsci_idat;
  wire [63:0] result_rsci_din;
  reg [63:0] while_rem_cmp_a;
  reg [63:0] while_rem_cmp_b;
  wire [63:0] while_rem_cmp_z;
  wire while_mul_cmp_en;
  wire [63:0] while_mul_cmp_z;
  wire [29:0] fsm_output;
  wire and_dcpl_6;
  wire and_dcpl_15;
  wire or_tmp_6;
  reg exit_while_sva;
  reg reg_base_rsc_triosy_obj_ld_cse;
  reg reg_ensig_cgo_cse;
  wire or_10_rmff;
  reg [63:0] base_sva;
  reg [63:0] m_sva;
  reg [63:0] exp_count_sva;
  reg [63:0] while_mul_mut;
  wire [63:0] exp_count_sva_2;
  wire [64:0] nl_exp_count_sva_2;
  wire z_out_64;

  wire[0:0] nor_nl;
  wire[64:0] operator_64_false_acc_nl;
  wire[65:0] nl_operator_64_false_acc_nl;
  wire[63:0] operator_64_false_mux_3_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_result_rsci_ldout;
  assign nl_result_rsci_ldout = (fsm_output[27]) | (fsm_output[1]);
  wire [63:0] nl_result_rsci_dout;
  assign nl_result_rsci_dout = MUX_v_64_2_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
      while_rem_cmp_z, fsm_output[27]);
  wire [63:0] nl_while_mul_cmp_b;
  assign nl_while_mul_cmp_b = base_sva;
  wire [0:0] nl_modExp_core_core_fsm_inst_main_C_1_tr0;
  assign nl_modExp_core_core_fsm_inst_main_C_1_tr0 = ~ exit_while_sva;
  ccs_in_v1 #(.rscid(32'sd1),
  .width(32'sd64)) base_rsci (
      .dat(base_rsc_dat),
      .idat(base_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) exp_rsci (
      .dat(exp_rsc_dat),
      .idat(exp_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd3),
  .width(32'sd64)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_inout_prereg_en_v1 #(.rscid(32'sd4),
  .width(32'sd64)) result_rsci (
      .din(result_rsci_din),
      .ldout(nl_result_rsci_ldout[0:0]),
      .dout(nl_result_rsci_dout[63:0]),
      .zin(result_rsc_zin),
      .lzout(result_rsc_lzout),
      .zout(result_rsc_zout)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) base_rsc_triosy_obj (
      .ld(reg_base_rsc_triosy_obj_ld_cse),
      .lz(base_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) exp_rsc_triosy_obj (
      .ld(reg_base_rsc_triosy_obj_ld_cse),
      .lz(exp_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) m_rsc_triosy_obj (
      .ld(reg_base_rsc_triosy_obj_ld_cse),
      .lz(m_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_obj (
      .ld(reg_base_rsc_triosy_obj_ld_cse),
      .lz(result_rsc_triosy_lz)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) while_rem_cmp (
      .a(while_rem_cmp_a),
      .b(while_rem_cmp_b),
      .z(while_rem_cmp_z)
    );
  mgc_mul_pipe #(.width_a(32'sd64),
  .signd_a(32'sd0),
  .width_b(32'sd64),
  .signd_b(32'sd0),
  .width_z(32'sd64),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd3),
  .n_inreg(32'sd1)) while_mul_cmp (
      .a(result_rsci_din),
      .b(nl_while_mul_cmp_b[63:0]),
      .clk(clk),
      .en(while_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(while_mul_cmp_z)
    );
  modExp_core_wait_dp modExp_core_wait_dp_inst (
      .ensig_cgo_iro(or_10_rmff),
      .ensig_cgo(reg_ensig_cgo_cse),
      .while_mul_cmp_en(while_mul_cmp_en)
    );
  modExp_core_core_fsm modExp_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .main_C_1_tr0(nl_modExp_core_core_fsm_inst_main_C_1_tr0[0:0]),
      .while_C_25_tr0(exit_while_sva)
    );
  assign or_10_rmff = (fsm_output[5:3]!=3'b000);
  assign nl_exp_count_sva_2 = exp_count_sva + 64'b1111111111111111111111111111111111111111111111111111111111111111;
  assign exp_count_sva_2 = nl_exp_count_sva_2[63:0];
  assign and_dcpl_6 = ~((fsm_output[1]) | (fsm_output[3]));
  assign and_dcpl_15 = ~((fsm_output[29]) | (fsm_output[0]));
  assign or_tmp_6 = and_dcpl_15 & (~ (fsm_output[1]));
  always @(posedge clk) begin
    if ( rst ) begin
      reg_base_rsc_triosy_obj_ld_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
    end
    else begin
      reg_base_rsc_triosy_obj_ld_cse <= ((~ exit_while_sva) & (fsm_output[2])) |
          (exit_while_sva & (fsm_output[28]));
      reg_ensig_cgo_cse <= or_10_rmff;
    end
  end
  always @(posedge clk) begin
    while_rem_cmp_a <= MUX_v_64_2_2(while_mul_cmp_z, while_mul_mut, nor_nl);
    while_rem_cmp_b <= m_sva;
  end
  always @(posedge clk) begin
    if ( ~ or_tmp_6 ) begin
      m_sva <= m_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( ~(and_dcpl_15 & and_dcpl_6) ) begin
      exp_count_sva <= MUX_v_64_2_2(exp_rsci_idat, exp_count_sva_2, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( ~ or_tmp_6 ) begin
      base_sva <= base_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_while_sva <= 1'b0;
    end
    else if ( (fsm_output[1]) | (fsm_output[3]) ) begin
      exit_while_sva <= MUX_s_1_2_2(z_out_64, (~ z_out_64), fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[6] ) begin
      while_mul_mut <= while_mul_cmp_z;
    end
  end
  assign nor_nl = ~((fsm_output[28]) | (fsm_output[29]) | (fsm_output[0]) | (fsm_output[2])
      | (fsm_output[5]) | (fsm_output[4]) | (fsm_output[27]) | (fsm_output[6]) |
      (~ and_dcpl_6));
  assign operator_64_false_mux_3_nl = MUX_v_64_2_2((~ exp_rsci_idat), (~ exp_count_sva_2),
      fsm_output[3]);
  assign nl_operator_64_false_acc_nl = ({1'b1 , operator_64_false_mux_3_nl}) + 65'b00000000000000000000000000000000000000000000000000000000000000001;
  assign operator_64_false_acc_nl = nl_operator_64_false_acc_nl[64:0];
  assign z_out_64 = readslicef_65_1_64(operator_64_false_acc_nl);

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


  function automatic [63:0] MUX_v_64_2_2;
    input [63:0] input_0;
    input [63:0] input_1;
    input [0:0] sel;
    reg [63:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_64_2_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_65_1_64;
    input [64:0] vector;
    reg [64:0] tmp;
  begin
    tmp = vector >> 64;
    readslicef_65_1_64 = tmp[0:0];
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    modExp
// ------------------------------------------------------------------


module modExp (
  clk, rst, base_rsc_dat, base_rsc_triosy_lz, exp_rsc_dat, exp_rsc_triosy_lz, m_rsc_dat,
      m_rsc_triosy_lz, result_rsc_zout, result_rsc_lzout, result_rsc_zin, result_rsc_triosy_lz
);
  input clk;
  input rst;
  input [63:0] base_rsc_dat;
  output base_rsc_triosy_lz;
  input [63:0] exp_rsc_dat;
  output exp_rsc_triosy_lz;
  input [63:0] m_rsc_dat;
  output m_rsc_triosy_lz;
  output [63:0] result_rsc_zout;
  output result_rsc_lzout;
  input [63:0] result_rsc_zin;
  output result_rsc_triosy_lz;



  // Interconnect Declarations for Component Instantiations 
  modExp_core modExp_core_inst (
      .clk(clk),
      .rst(rst),
      .base_rsc_dat(base_rsc_dat),
      .base_rsc_triosy_lz(base_rsc_triosy_lz),
      .exp_rsc_dat(exp_rsc_dat),
      .exp_rsc_triosy_lz(exp_rsc_triosy_lz),
      .m_rsc_dat(m_rsc_dat),
      .m_rsc_triosy_lz(m_rsc_triosy_lz),
      .result_rsc_zout(result_rsc_zout),
      .result_rsc_lzout(result_rsc_lzout),
      .result_rsc_zin(result_rsc_zin),
      .result_rsc_triosy_lz(result_rsc_triosy_lz)
    );
endmodule



