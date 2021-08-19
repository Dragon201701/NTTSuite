
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

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_bl_beh_v5.v 
module mgc_shift_bl_v5(a,s,z);
   parameter    width_a = 4;
   parameter    signd_a = 1;
   parameter    width_s = 2;
   parameter    width_z = 8;

   input [width_a-1:0] a;
   input [width_s-1:0] s;
   output [width_z -1:0] z;

   generate if ( signd_a )
   begin: SGNED
     assign z = fshl_s(a,s,a[width_a-1]);
   end
   else
   begin: UNSGNED
     assign z = fshl_s(a,s,1'b0);
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

   //Shift left - signed shift argument
   function [width_z-1:0] fshl_s;
      input [width_a-1:0] arg1;
      input [width_s-1:0] arg2;
      input sbit;
      reg [width_a:0] sbit_arg1;
      begin
        // Ignoring the possibility that arg2[width_s-1] could be X
        // because of customer complaints regarding X'es in simulation results
        if ( arg2[width_s-1] == 1'b0 )
        begin
          sbit_arg1[width_a:0] = {(width_a+1){1'b0}};
          fshl_s = fshl_u(arg1, arg2, sbit);
        end
        else
        begin
          sbit_arg1[width_a] = sbit;
          sbit_arg1[width_a-1:0] = arg1;
          fshl_s = fshr_u(sbit_arg1[width_a:1], ~arg2, sbit);
        end
      end
   endfunction

endmodule

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Wed Aug 18 21:09:39 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_4_64_10_1024_1024_64_5_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_4_64_10_1024_1024_64_5_gen
    (
  q, re, radr, radr_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output re;
  output [9:0] radr;
  input [9:0] radr_d;
  input re_d;
  output [63:0] q_d;
  input port_0_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign re = (port_0_r_ram_ir_internal_RMASK_B_d);
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_1_64_10_1024_1024_64_5_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_1_64_10_1024_1024_64_5_gen
    (
  we, d, wadr, q, re, radr, radr_d, wadr_d, d_d, we_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d,
      port_1_w_ram_ir_internal_WMASK_B_d
);
  output we;
  output [63:0] d;
  output [9:0] wadr;
  input [63:0] q;
  output re;
  output [9:0] radr;
  input [9:0] radr_d;
  input [9:0] wadr_d;
  input [63:0] d_d;
  input we_d;
  input re_d;
  output [63:0] q_d;
  input port_0_r_ram_ir_internal_RMASK_B_d;
  input port_1_w_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign we = (port_1_w_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign wadr = (wadr_d);
  assign q_d = q;
  assign re = (port_0_r_ram_ir_internal_RMASK_B_d);
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core_core_fsm (
  clk, rst, fsm_output, COMP_LOOP_C_43_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [48:0] fsm_output;
  reg [48:0] fsm_output;
  input COMP_LOOP_C_43_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIF_core_core_fsm_1
  parameter
    main_C_0 = 6'd0,
    STAGE_LOOP_C_0 = 6'd1,
    COMP_LOOP_C_0 = 6'd2,
    COMP_LOOP_C_1 = 6'd3,
    COMP_LOOP_C_2 = 6'd4,
    COMP_LOOP_C_3 = 6'd5,
    COMP_LOOP_C_4 = 6'd6,
    COMP_LOOP_C_5 = 6'd7,
    COMP_LOOP_C_6 = 6'd8,
    COMP_LOOP_C_7 = 6'd9,
    COMP_LOOP_C_8 = 6'd10,
    COMP_LOOP_C_9 = 6'd11,
    COMP_LOOP_C_10 = 6'd12,
    COMP_LOOP_C_11 = 6'd13,
    COMP_LOOP_C_12 = 6'd14,
    COMP_LOOP_C_13 = 6'd15,
    COMP_LOOP_C_14 = 6'd16,
    COMP_LOOP_C_15 = 6'd17,
    COMP_LOOP_C_16 = 6'd18,
    COMP_LOOP_C_17 = 6'd19,
    COMP_LOOP_C_18 = 6'd20,
    COMP_LOOP_C_19 = 6'd21,
    COMP_LOOP_C_20 = 6'd22,
    COMP_LOOP_C_21 = 6'd23,
    COMP_LOOP_C_22 = 6'd24,
    COMP_LOOP_C_23 = 6'd25,
    COMP_LOOP_C_24 = 6'd26,
    COMP_LOOP_C_25 = 6'd27,
    COMP_LOOP_C_26 = 6'd28,
    COMP_LOOP_C_27 = 6'd29,
    COMP_LOOP_C_28 = 6'd30,
    COMP_LOOP_C_29 = 6'd31,
    COMP_LOOP_C_30 = 6'd32,
    COMP_LOOP_C_31 = 6'd33,
    COMP_LOOP_C_32 = 6'd34,
    COMP_LOOP_C_33 = 6'd35,
    COMP_LOOP_C_34 = 6'd36,
    COMP_LOOP_C_35 = 6'd37,
    COMP_LOOP_C_36 = 6'd38,
    COMP_LOOP_C_37 = 6'd39,
    COMP_LOOP_C_38 = 6'd40,
    COMP_LOOP_C_39 = 6'd41,
    COMP_LOOP_C_40 = 6'd42,
    COMP_LOOP_C_41 = 6'd43,
    COMP_LOOP_C_42 = 6'd44,
    COMP_LOOP_C_43 = 6'd45,
    VEC_LOOP_C_0 = 6'd46,
    STAGE_LOOP_C_1 = 6'd47,
    main_C_1 = 6'd48;

  reg [5:0] state_var;
  reg [5:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIF_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 49'b0000000000000000000000000000000000000000000000010;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 49'b0000000000000000000000000000000000000000000000100;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 49'b0000000000000000000000000000000000000000000001000;
        state_var_NS = COMP_LOOP_C_2;
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 49'b0000000000000000000000000000000000000000000010000;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 49'b0000000000000000000000000000000000000000000100000;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 49'b0000000000000000000000000000000000000000001000000;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 49'b0000000000000000000000000000000000000000010000000;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 49'b0000000000000000000000000000000000000000100000000;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 49'b0000000000000000000000000000000000000001000000000;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 49'b0000000000000000000000000000000000000010000000000;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 49'b0000000000000000000000000000000000000100000000000;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 49'b0000000000000000000000000000000000001000000000000;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 49'b0000000000000000000000000000000000010000000000000;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 49'b0000000000000000000000000000000000100000000000000;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 49'b0000000000000000000000000000000001000000000000000;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 49'b0000000000000000000000000000000010000000000000000;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 49'b0000000000000000000000000000000100000000000000000;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 49'b0000000000000000000000000000001000000000000000000;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 49'b0000000000000000000000000000010000000000000000000;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 49'b0000000000000000000000000000100000000000000000000;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 49'b0000000000000000000000000001000000000000000000000;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 49'b0000000000000000000000000010000000000000000000000;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 49'b0000000000000000000000000100000000000000000000000;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 49'b0000000000000000000000001000000000000000000000000;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 49'b0000000000000000000000010000000000000000000000000;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 49'b0000000000000000000000100000000000000000000000000;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 49'b0000000000000000000001000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 49'b0000000000000000000010000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 49'b0000000000000000000100000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 49'b0000000000000000001000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 49'b0000000000000000010000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 49'b0000000000000000100000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 49'b0000000000000001000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 49'b0000000000000010000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 49'b0000000000000100000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 49'b0000000000001000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 49'b0000000000010000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 49'b0000000000100000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 49'b0000000001000000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 49'b0000000010000000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 49'b0000000100000000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 49'b0000001000000000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 49'b0000010000000000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 49'b0000100000000000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 49'b0001000000000000000000000000000000000000000000000;
        if ( COMP_LOOP_C_43_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 49'b0010000000000000000000000000000000000000000000000;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 49'b0100000000000000000000000000000000000000000000000;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 49'b1000000000000000000000000000000000000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 49'b0000000000000000000000000000000000000000000000001;
        state_var_NS = STAGE_LOOP_C_0;
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
//  Design Unit:    inPlaceNTT_DIF_core
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core (
  clk, rst, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz, twiddle_rsc_triosy_lz,
      vec_rsci_radr_d, vec_rsci_wadr_d, vec_rsci_d_d, vec_rsci_q_d, twiddle_rsci_radr_d,
      twiddle_rsci_q_d, vec_rsci_we_d_pff, vec_rsci_re_d_pff, twiddle_rsci_re_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output [9:0] vec_rsci_radr_d;
  output [9:0] vec_rsci_wadr_d;
  output [63:0] vec_rsci_d_d;
  input [63:0] vec_rsci_q_d;
  output [9:0] twiddle_rsci_radr_d;
  input [63:0] twiddle_rsci_q_d;
  output vec_rsci_we_d_pff;
  output vec_rsci_re_d_pff;
  output twiddle_rsci_re_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  reg [63:0] modulo_dev_result_rem_cmp_a;
  reg [63:0] modulo_dev_result_rem_cmp_b;
  wire [63:0] modulo_dev_result_rem_cmp_z;
  wire [48:0] fsm_output;
  wire and_dcpl_5;
  reg exit_COMP_LOOP_sva;
  wire [10:0] VEC_LOOP_j_10_0_sva_2;
  wire [11:0] nl_VEC_LOOP_j_10_0_sva_2;
  reg reg_twiddle_rsc_triosy_obj_ld_cse;
  wire VEC_LOOP_j_or_cse;
  reg [9:0] COMP_LOOP_acc_1_cse_sva;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_sva;
  reg [63:0] COMP_LOOP_acc_8_itm;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] COMP_LOOP_k_10_0_sva_9_0;
  wire [10:0] z_out;
  wire [63:0] z_out_1;
  wire [127:0] nl_z_out_1;
  reg [63:0] p_sva;
  reg [10:0] STAGE_LOOP_lshift_psp_sva;
  reg [63:0] COMP_LOOP_acc_6_mut;
  reg [63:0] COMP_LOOP_tmp_asn_itm;
  reg [9:0] VEC_LOOP_j_10_0_sva_9_0;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [63:0] COMP_LOOP_acc_6_mut_mx0w0;
  wire [64:0] nl_COMP_LOOP_acc_6_mut_mx0w0;
  wire [10:0] COMP_LOOP_k_10_0_sva_2;
  wire [11:0] nl_COMP_LOOP_k_10_0_sva_2;
  wire [9:0] COMP_LOOP_acc_10_itm_10_1_1;
  wire STAGE_LOOP_acc_itm_4_1;

  wire[0:0] nor_nl;
  wire[0:0] or_24_nl;
  wire[0:0] VEC_LOOP_j_not_1_nl;
  wire[0:0] VEC_LOOP_j_not_nl;
  wire[10:0] COMP_LOOP_acc_nl;
  wire[11:0] nl_COMP_LOOP_acc_nl;
  wire[63:0] COMP_LOOP_acc_8_nl;
  wire[64:0] nl_COMP_LOOP_acc_8_nl;
  wire[10:0] COMP_LOOP_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_acc_10_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[63:0] COMP_LOOP_mux_7_nl;
  wire[63:0] COMP_LOOP_mux_8_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[3:0] STAGE_LOOP_mux_nl;
  wire[3:0] COMP_LOOP_tmp_acc_nl;
  wire[4:0] nl_COMP_LOOP_tmp_acc_nl;
  wire [4:0] nl_COMP_LOOP_tmp_lshift_rg_s;
  assign nl_COMP_LOOP_tmp_acc_nl = (~ STAGE_LOOP_i_3_0_sva) + 4'b1011;
  assign COMP_LOOP_tmp_acc_nl = nl_COMP_LOOP_tmp_acc_nl[3:0];
  assign STAGE_LOOP_mux_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, COMP_LOOP_tmp_acc_nl,
      fsm_output[2]);
  assign nl_COMP_LOOP_tmp_lshift_rg_s = {1'b0, STAGE_LOOP_mux_nl};
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = VEC_LOOP_j_10_0_sva_2[10];
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = ~ STAGE_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_obj_ld_cse),
      .lz(vec_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_obj_ld_cse),
      .lz(r_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_obj_ld_cse),
      .lz(twiddle_rsc_triosy_lz)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) modulo_dev_result_rem_cmp (
      .a(modulo_dev_result_rem_cmp_a),
      .b(modulo_dev_result_rem_cmp_b),
      .z(modulo_dev_result_rem_cmp_z)
    );
  mgc_shift_bl_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd5),
  .width_z(32'sd11)) COMP_LOOP_tmp_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_tmp_lshift_rg_s[4:0]),
      .z(z_out)
    );
  inPlaceNTT_DIF_core_core_fsm inPlaceNTT_DIF_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .COMP_LOOP_C_43_tr0(exit_COMP_LOOP_sva),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign VEC_LOOP_j_or_cse = (fsm_output[1]) | (fsm_output[46]);
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b1111;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_COMP_LOOP_acc_6_mut_mx0w0 = vec_rsci_q_d - COMP_LOOP_acc_6_mut;
  assign COMP_LOOP_acc_6_mut_mx0w0 = nl_COMP_LOOP_acc_6_mut_mx0w0[63:0];
  assign nl_COMP_LOOP_acc_10_nl = STAGE_LOOP_lshift_psp_sva + conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0)
      + conv_u2u_10_11(COMP_LOOP_k_10_0_sva_9_0);
  assign COMP_LOOP_acc_10_nl = nl_COMP_LOOP_acc_10_nl[10:0];
  assign COMP_LOOP_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_acc_10_nl);
  assign nl_COMP_LOOP_k_10_0_sva_2 = conv_u2u_10_11(COMP_LOOP_k_10_0_sva_9_0) + 11'b00000000001;
  assign COMP_LOOP_k_10_0_sva_2 = nl_COMP_LOOP_k_10_0_sva_2[10:0];
  assign nl_VEC_LOOP_j_10_0_sva_2 = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + STAGE_LOOP_lshift_psp_sva;
  assign VEC_LOOP_j_10_0_sva_2 = nl_VEC_LOOP_j_10_0_sva_2[10:0];
  assign and_dcpl_5 = ~((fsm_output[48]) | (fsm_output[0]));
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ STAGE_LOOP_i_3_0_sva_2)}) + 5'b00001;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign vec_rsci_radr_d = MUX_v_10_2_2(COMP_LOOP_acc_10_itm_10_1_1, COMP_LOOP_acc_1_cse_sva,
      fsm_output[3]);
  assign vec_rsci_wadr_d = MUX_v_10_2_2(COMP_LOOP_acc_10_cse_10_1_sva, COMP_LOOP_acc_1_cse_sva,
      fsm_output[44]);
  assign vec_rsci_d_d = MUX_v_64_2_2(modulo_dev_result_rem_cmp_z, COMP_LOOP_acc_8_itm,
      fsm_output[44]);
  assign vec_rsci_we_d_pff = (fsm_output[44:43]!=2'b00);
  assign vec_rsci_re_d_pff = (fsm_output[3:2]!=2'b00);
  assign twiddle_rsci_re_d_pff = fsm_output[2];
  assign twiddle_rsci_radr_d = z_out_1[9:0];
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_i_3_0_sva <= 4'b0000;
    end
    else if ( (fsm_output[47]) | (fsm_output[0]) ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1010, STAGE_LOOP_i_3_0_sva_2, fsm_output[47]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      p_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~ and_dcpl_5 ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modulo_dev_result_rem_cmp_b <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      modulo_dev_result_rem_cmp_a <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      reg_twiddle_rsc_triosy_obj_ld_cse <= 1'b0;
    end
    else begin
      modulo_dev_result_rem_cmp_b <= p_sva;
      modulo_dev_result_rem_cmp_a <= MUX1HOT_v_64_3_2(COMP_LOOP_acc_6_mut_mx0w0,
          COMP_LOOP_acc_6_mut, COMP_LOOP_acc_8_itm, {(fsm_output[4]) , nor_nl , or_24_nl});
      reg_twiddle_rsc_triosy_obj_ld_cse <= (~ STAGE_LOOP_acc_itm_4_1) & (fsm_output[47]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_0_sva_9_0 <= 10'b0000000000;
    end
    else if ( VEC_LOOP_j_or_cse ) begin
      VEC_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (VEC_LOOP_j_10_0_sva_2[9:0]),
          VEC_LOOP_j_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_lshift_psp_sva <= 11'b00000000000;
    end
    else if ( ~(and_dcpl_5 & (~ (fsm_output[47])) & (~ (fsm_output[1]))) ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_k_10_0_sva_9_0 <= 10'b0000000000;
    end
    else if ( (fsm_output[47]) | (fsm_output[2]) | (fsm_output[0]) | (fsm_output[46])
        | (fsm_output[48]) | (fsm_output[1]) ) begin
      COMP_LOOP_k_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (COMP_LOOP_k_10_0_sva_2[9:0]),
          VEC_LOOP_j_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_COMP_LOOP_sva <= 1'b0;
    end
    else if ( fsm_output[2] ) begin
      exit_COMP_LOOP_sva <= ~ (readslicef_11_1_10(COMP_LOOP_acc_nl));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 10'b0000000000;
    end
    else if ( fsm_output[2] ) begin
      COMP_LOOP_acc_1_cse_sva <= nl_COMP_LOOP_acc_1_cse_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_sva <= 10'b0000000000;
    end
    else if ( fsm_output[2] ) begin
      COMP_LOOP_acc_10_cse_10_1_sva <= COMP_LOOP_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_asn_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( fsm_output[3] ) begin
      COMP_LOOP_tmp_asn_itm <= twiddle_rsci_q_d;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_6_mut <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( (fsm_output[17]) | (fsm_output[4]) | (fsm_output[3]) ) begin
      COMP_LOOP_acc_6_mut <= MUX1HOT_v_64_3_2(vec_rsci_q_d, COMP_LOOP_acc_6_mut_mx0w0,
          z_out_1, {(fsm_output[3]) , (fsm_output[4]) , (fsm_output[17])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_8_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( (fsm_output[30]) | (fsm_output[4]) ) begin
      COMP_LOOP_acc_8_itm <= MUX_v_64_2_2(COMP_LOOP_acc_8_nl, modulo_dev_result_rem_cmp_z,
          fsm_output[30]);
    end
  end
  assign nor_nl = ~((fsm_output[29]) | (fsm_output[28]) | (fsm_output[27]) | (fsm_output[26])
      | (fsm_output[25]) | (fsm_output[24]) | (fsm_output[23]) | (fsm_output[22])
      | (fsm_output[21]) | (fsm_output[20]) | (fsm_output[19]) | (fsm_output[18])
      | (fsm_output[45]) | (fsm_output[48]) | (fsm_output[44]) | (fsm_output[43])
      | (fsm_output[0]) | (fsm_output[17]) | (fsm_output[2]) | (fsm_output[46]) |
      (fsm_output[4]) | (fsm_output[3]) | (fsm_output[47]) | (fsm_output[1]));
  assign or_24_nl = (fsm_output[29:17]!=13'b0000000000000);
  assign VEC_LOOP_j_not_1_nl = ~ (fsm_output[1]);
  assign VEC_LOOP_j_not_nl = ~ VEC_LOOP_j_or_cse;
  assign nl_COMP_LOOP_acc_nl = COMP_LOOP_k_10_0_sva_2 + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + 11'b00000000001;
  assign COMP_LOOP_acc_nl = nl_COMP_LOOP_acc_nl[10:0];
  assign nl_COMP_LOOP_acc_1_cse_sva  = VEC_LOOP_j_10_0_sva_9_0 + COMP_LOOP_k_10_0_sva_9_0;
  assign nl_COMP_LOOP_acc_8_nl = vec_rsci_q_d + COMP_LOOP_acc_6_mut;
  assign COMP_LOOP_acc_8_nl = nl_COMP_LOOP_acc_8_nl[63:0];
  assign COMP_LOOP_mux_7_nl = MUX_v_64_2_2(COMP_LOOP_tmp_asn_itm, ({54'b000000000000000000000000000000000000000000000000000000
      , (z_out[9:0])}), fsm_output[2]);
  assign COMP_LOOP_mux_8_nl = MUX_v_64_2_2(modulo_dev_result_rem_cmp_z, ({54'b000000000000000000000000000000000000000000000000000000
      , COMP_LOOP_k_10_0_sva_9_0}), fsm_output[2]);
  assign nl_z_out_1 = COMP_LOOP_mux_7_nl * COMP_LOOP_mux_8_nl;
  assign z_out_1 = nl_z_out_1[63:0];

  function automatic [63:0] MUX1HOT_v_64_3_2;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [2:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    MUX1HOT_v_64_3_2 = result;
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


  function automatic [9:0] readslicef_11_10_1;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_11_10_1 = tmp[9:0];
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


  function automatic [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
  end
  endfunction


  function automatic [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF
// ------------------------------------------------------------------


module inPlaceNTT_DIF (
  clk, rst, vec_rsc_radr, vec_rsc_re, vec_rsc_q, vec_rsc_wadr, vec_rsc_d, vec_rsc_we,
      vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz,
      twiddle_rsc_radr, twiddle_rsc_re, twiddle_rsc_q, twiddle_rsc_triosy_lz
);
  input clk;
  input rst;
  output [9:0] vec_rsc_radr;
  output vec_rsc_re;
  input [63:0] vec_rsc_q;
  output [9:0] vec_rsc_wadr;
  output [63:0] vec_rsc_d;
  output vec_rsc_we;
  output vec_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [9:0] twiddle_rsc_radr;
  output twiddle_rsc_re;
  input [63:0] twiddle_rsc_q;
  output twiddle_rsc_triosy_lz;


  // Interconnect Declarations
  wire [9:0] vec_rsci_radr_d;
  wire [9:0] vec_rsci_wadr_d;
  wire [63:0] vec_rsci_d_d;
  wire [63:0] vec_rsci_q_d;
  wire [9:0] twiddle_rsci_radr_d;
  wire [63:0] twiddle_rsci_q_d;
  wire vec_rsci_we_d_iff;
  wire vec_rsci_re_d_iff;
  wire twiddle_rsci_re_d_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_1_64_10_1024_1024_64_5_gen
      vec_rsci (
      .we(vec_rsc_we),
      .d(vec_rsc_d),
      .wadr(vec_rsc_wadr),
      .q(vec_rsc_q),
      .re(vec_rsc_re),
      .radr(vec_rsc_radr),
      .radr_d(vec_rsci_radr_d),
      .wadr_d(vec_rsci_wadr_d),
      .d_d(vec_rsci_d_d),
      .we_d(vec_rsci_we_d_iff),
      .re_d(vec_rsci_re_d_iff),
      .q_d(vec_rsci_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(vec_rsci_re_d_iff),
      .port_1_w_ram_ir_internal_WMASK_B_d(vec_rsci_we_d_iff)
    );
  inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_4_64_10_1024_1024_64_5_gen
      twiddle_rsci (
      .q(twiddle_rsc_q),
      .re(twiddle_rsc_re),
      .radr(twiddle_rsc_radr),
      .radr_d(twiddle_rsci_radr_d),
      .re_d(twiddle_rsci_re_d_iff),
      .q_d(twiddle_rsci_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_re_d_iff)
    );
  inPlaceNTT_DIF_core inPlaceNTT_DIF_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .vec_rsci_radr_d(vec_rsci_radr_d),
      .vec_rsci_wadr_d(vec_rsci_wadr_d),
      .vec_rsci_d_d(vec_rsci_d_d),
      .vec_rsci_q_d(vec_rsci_q_d),
      .twiddle_rsci_radr_d(twiddle_rsci_radr_d),
      .twiddle_rsci_q_d(twiddle_rsci_q_d),
      .vec_rsci_we_d_pff(vec_rsci_we_d_iff),
      .vec_rsci_re_d_pff(vec_rsci_re_d_iff),
      .twiddle_rsci_re_d_pff(twiddle_rsci_re_d_iff)
    );
endmodule



