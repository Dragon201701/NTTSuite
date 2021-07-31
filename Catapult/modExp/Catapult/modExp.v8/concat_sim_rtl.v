
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

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Thu Jul 15 15:14:31 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    modExp_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module modExp_core_core_fsm (
  clk, rst, fsm_output, main_C_1_tr0, while_C_26_tr0
);
  input clk;
  input rst;
  output [30:0] fsm_output;
  reg [30:0] fsm_output;
  input main_C_1_tr0;
  input while_C_26_tr0;


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
    while_C_26 = 5'd29,
    main_C_2 = 5'd30;

  reg [4:0] state_var;
  reg [4:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : modExp_core_core_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 31'b0000000000000000000000000000010;
        state_var_NS = main_C_1;
      end
      main_C_1 : begin
        fsm_output = 31'b0000000000000000000000000000100;
        if ( main_C_1_tr0 ) begin
          state_var_NS = main_C_2;
        end
        else begin
          state_var_NS = while_C_0;
        end
      end
      while_C_0 : begin
        fsm_output = 31'b0000000000000000000000000001000;
        state_var_NS = while_C_1;
      end
      while_C_1 : begin
        fsm_output = 31'b0000000000000000000000000010000;
        state_var_NS = while_C_2;
      end
      while_C_2 : begin
        fsm_output = 31'b0000000000000000000000000100000;
        state_var_NS = while_C_3;
      end
      while_C_3 : begin
        fsm_output = 31'b0000000000000000000000001000000;
        state_var_NS = while_C_4;
      end
      while_C_4 : begin
        fsm_output = 31'b0000000000000000000000010000000;
        state_var_NS = while_C_5;
      end
      while_C_5 : begin
        fsm_output = 31'b0000000000000000000000100000000;
        state_var_NS = while_C_6;
      end
      while_C_6 : begin
        fsm_output = 31'b0000000000000000000001000000000;
        state_var_NS = while_C_7;
      end
      while_C_7 : begin
        fsm_output = 31'b0000000000000000000010000000000;
        state_var_NS = while_C_8;
      end
      while_C_8 : begin
        fsm_output = 31'b0000000000000000000100000000000;
        state_var_NS = while_C_9;
      end
      while_C_9 : begin
        fsm_output = 31'b0000000000000000001000000000000;
        state_var_NS = while_C_10;
      end
      while_C_10 : begin
        fsm_output = 31'b0000000000000000010000000000000;
        state_var_NS = while_C_11;
      end
      while_C_11 : begin
        fsm_output = 31'b0000000000000000100000000000000;
        state_var_NS = while_C_12;
      end
      while_C_12 : begin
        fsm_output = 31'b0000000000000001000000000000000;
        state_var_NS = while_C_13;
      end
      while_C_13 : begin
        fsm_output = 31'b0000000000000010000000000000000;
        state_var_NS = while_C_14;
      end
      while_C_14 : begin
        fsm_output = 31'b0000000000000100000000000000000;
        state_var_NS = while_C_15;
      end
      while_C_15 : begin
        fsm_output = 31'b0000000000001000000000000000000;
        state_var_NS = while_C_16;
      end
      while_C_16 : begin
        fsm_output = 31'b0000000000010000000000000000000;
        state_var_NS = while_C_17;
      end
      while_C_17 : begin
        fsm_output = 31'b0000000000100000000000000000000;
        state_var_NS = while_C_18;
      end
      while_C_18 : begin
        fsm_output = 31'b0000000001000000000000000000000;
        state_var_NS = while_C_19;
      end
      while_C_19 : begin
        fsm_output = 31'b0000000010000000000000000000000;
        state_var_NS = while_C_20;
      end
      while_C_20 : begin
        fsm_output = 31'b0000000100000000000000000000000;
        state_var_NS = while_C_21;
      end
      while_C_21 : begin
        fsm_output = 31'b0000001000000000000000000000000;
        state_var_NS = while_C_22;
      end
      while_C_22 : begin
        fsm_output = 31'b0000010000000000000000000000000;
        state_var_NS = while_C_23;
      end
      while_C_23 : begin
        fsm_output = 31'b0000100000000000000000000000000;
        state_var_NS = while_C_24;
      end
      while_C_24 : begin
        fsm_output = 31'b0001000000000000000000000000000;
        state_var_NS = while_C_25;
      end
      while_C_25 : begin
        fsm_output = 31'b0010000000000000000000000000000;
        state_var_NS = while_C_26;
      end
      while_C_26 : begin
        fsm_output = 31'b0100000000000000000000000000000;
        if ( while_C_26_tr0 ) begin
          state_var_NS = main_C_2;
        end
        else begin
          state_var_NS = while_C_0;
        end
      end
      main_C_2 : begin
        fsm_output = 31'b1000000000000000000000000000000;
        state_var_NS = main_C_0;
      end
      // core_rlp_C_0
      default : begin
        fsm_output = 31'b0000000000000000000000000000001;
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
  wire [30:0] fsm_output;
  wire and_dcpl_12;
  wire or_tmp_5;
  reg exit_while_sva;
  reg reg_result_rsc_triosy_obj_ld_cse;
  wire [64:0] z_out;
  wire [65:0] nl_z_out;
  reg [63:0] base_sva;
  reg [63:0] exp_sva;
  reg [63:0] m_sva;
  reg [63:0] while_mul_mut;
  wire [63:0] while_mul_mut_mx0w0;
  wire [127:0] nl_while_mul_mut_mx0w0;

  wire[0:0] nor_5_nl;
  wire[64:0] operator_64_false_acc_nl;
  wire[65:0] nl_operator_64_false_acc_nl;
  wire[63:0] operator_64_false_mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_result_rsci_ldout;
  assign nl_result_rsci_ldout = (fsm_output[28]) | (fsm_output[1]);
  wire [63:0] nl_result_rsci_dout;
  assign nl_result_rsci_dout = MUX_v_64_2_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
      while_rem_cmp_z, fsm_output[28]);
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
      .ld(reg_result_rsc_triosy_obj_ld_cse),
      .lz(base_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) exp_rsc_triosy_obj (
      .ld(reg_result_rsc_triosy_obj_ld_cse),
      .lz(exp_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) m_rsc_triosy_obj (
      .ld(reg_result_rsc_triosy_obj_ld_cse),
      .lz(m_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_obj (
      .ld(reg_result_rsc_triosy_obj_ld_cse),
      .lz(result_rsc_triosy_lz)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) while_rem_cmp (
      .a(while_rem_cmp_a),
      .b(while_rem_cmp_b),
      .z(while_rem_cmp_z)
    );
  modExp_core_core_fsm modExp_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .main_C_1_tr0(nl_modExp_core_core_fsm_inst_main_C_1_tr0[0:0]),
      .while_C_26_tr0(exit_while_sva)
    );
  assign nl_while_mul_mut_mx0w0 = result_rsci_din * base_sva;
  assign while_mul_mut_mx0w0 = nl_while_mul_mut_mx0w0[63:0];
  assign and_dcpl_12 = ~((fsm_output[30]) | (fsm_output[0]));
  assign or_tmp_5 = and_dcpl_12 & (~ (fsm_output[1]));
  always @(posedge clk) begin
    if ( rst ) begin
      while_rem_cmp_b <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      while_rem_cmp_a <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      reg_result_rsc_triosy_obj_ld_cse <= 1'b0;
    end
    else begin
      while_rem_cmp_b <= m_sva;
      while_rem_cmp_a <= MUX_v_64_2_2(while_mul_mut_mx0w0, while_mul_mut, nor_5_nl);
      reg_result_rsc_triosy_obj_ld_cse <= (exit_while_sva & (fsm_output[29])) | ((~
          exit_while_sva) & (fsm_output[2]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      m_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~ or_tmp_5 ) begin
      m_sva <= m_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exp_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~(and_dcpl_12 & (~((fsm_output[1]) | (fsm_output[3])))) ) begin
      exp_sva <= MUX_v_64_2_2(exp_rsci_idat, (z_out[63:0]), fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      base_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~ or_tmp_5 ) begin
      base_sva <= base_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_while_sva <= 1'b0;
    end
    else if ( (fsm_output[1]) | (fsm_output[3]) ) begin
      exit_while_sva <= MUX_s_1_2_2((z_out[64]), (~ (readslicef_65_1_64(operator_64_false_acc_nl))),
          fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      while_mul_mut <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( fsm_output[3] ) begin
      while_mul_mut <= while_mul_mut_mx0w0;
    end
  end
  assign nor_5_nl = ~((fsm_output[29]) | (fsm_output[30]) | (fsm_output[28]) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[1]) | (fsm_output[3]));
  assign nl_operator_64_false_acc_nl = ({1'b1 , (~ (z_out[63:0]))}) + 65'b00000000000000000000000000000000000000000000000000000000000000001;
  assign operator_64_false_acc_nl = nl_operator_64_false_acc_nl[64:0];
  assign operator_64_false_mux_2_nl = MUX_v_64_2_2((~ exp_rsci_idat), exp_sva, fsm_output[3]);
  assign nl_z_out = ({(~ (fsm_output[3])) , operator_64_false_mux_2_nl}) + conv_s2u_2_65({(fsm_output[3])
      , 1'b1});
  assign z_out = nl_z_out[64:0];

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


  function automatic [64:0] conv_s2u_2_65 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_65 = {{63{vector[1]}}, vector};
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



