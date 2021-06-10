
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

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_div_beh.v 
module mgc_div(a,b,z);
   parameter width_a = 8;
   parameter width_b = 8;
   parameter signd = 1;
   input [width_a-1:0] a;
   input [width_b-1:0] b; 
   output [width_a-1:0] z;  
   reg  [width_a-1:0] z;

   always@(a or b)
     begin
	if(signd)
	  div_s(a,b,z);
	else
          div_u(a,b,z);
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
//  Generated by:   jd4691@newnano.poly.edu
//  Generated date: Wed Jun  9 00:32:59 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [9:0] radr;
  output we;
  output [63:0] d;
  output [9:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [9:0] radr_d;
  input [9:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen
    (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [9:0] radr;
  output [63:0] q_d;
  input [9:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core_core_fsm (
  clk, rst, fsm_output, COPY_LOOP_C_2_tr0, STAGE_MAIN_LOOP_C_6_tr0, modExp_while_C_43_tr0,
      STAGE_VEC_LOOP_C_0_tr0, COMP_LOOP_C_45_tr0, modExp_1_while_C_43_tr0, COMP_LOOP_C_133_tr0,
      STAGE_VEC_LOOP_C_1_tr0, STAGE_MAIN_LOOP_C_7_tr0
);
  input clk;
  input rst;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input COPY_LOOP_C_2_tr0;
  input STAGE_MAIN_LOOP_C_6_tr0;
  input modExp_while_C_43_tr0;
  input STAGE_VEC_LOOP_C_0_tr0;
  input COMP_LOOP_C_45_tr0;
  input modExp_1_while_C_43_tr0;
  input COMP_LOOP_C_133_tr0;
  input STAGE_VEC_LOOP_C_1_tr0;
  input STAGE_MAIN_LOOP_C_7_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIF_core_core_fsm_1
  parameter
    main_C_0 = 8'd0,
    COPY_LOOP_C_0 = 8'd1,
    COPY_LOOP_C_1 = 8'd2,
    COPY_LOOP_C_2 = 8'd3,
    STAGE_MAIN_LOOP_C_0 = 8'd4,
    STAGE_MAIN_LOOP_C_1 = 8'd5,
    STAGE_MAIN_LOOP_C_2 = 8'd6,
    STAGE_MAIN_LOOP_C_3 = 8'd7,
    STAGE_MAIN_LOOP_C_4 = 8'd8,
    STAGE_MAIN_LOOP_C_5 = 8'd9,
    STAGE_MAIN_LOOP_C_6 = 8'd10,
    modExp_while_C_0 = 8'd11,
    modExp_while_C_1 = 8'd12,
    modExp_while_C_2 = 8'd13,
    modExp_while_C_3 = 8'd14,
    modExp_while_C_4 = 8'd15,
    modExp_while_C_5 = 8'd16,
    modExp_while_C_6 = 8'd17,
    modExp_while_C_7 = 8'd18,
    modExp_while_C_8 = 8'd19,
    modExp_while_C_9 = 8'd20,
    modExp_while_C_10 = 8'd21,
    modExp_while_C_11 = 8'd22,
    modExp_while_C_12 = 8'd23,
    modExp_while_C_13 = 8'd24,
    modExp_while_C_14 = 8'd25,
    modExp_while_C_15 = 8'd26,
    modExp_while_C_16 = 8'd27,
    modExp_while_C_17 = 8'd28,
    modExp_while_C_18 = 8'd29,
    modExp_while_C_19 = 8'd30,
    modExp_while_C_20 = 8'd31,
    modExp_while_C_21 = 8'd32,
    modExp_while_C_22 = 8'd33,
    modExp_while_C_23 = 8'd34,
    modExp_while_C_24 = 8'd35,
    modExp_while_C_25 = 8'd36,
    modExp_while_C_26 = 8'd37,
    modExp_while_C_27 = 8'd38,
    modExp_while_C_28 = 8'd39,
    modExp_while_C_29 = 8'd40,
    modExp_while_C_30 = 8'd41,
    modExp_while_C_31 = 8'd42,
    modExp_while_C_32 = 8'd43,
    modExp_while_C_33 = 8'd44,
    modExp_while_C_34 = 8'd45,
    modExp_while_C_35 = 8'd46,
    modExp_while_C_36 = 8'd47,
    modExp_while_C_37 = 8'd48,
    modExp_while_C_38 = 8'd49,
    modExp_while_C_39 = 8'd50,
    modExp_while_C_40 = 8'd51,
    modExp_while_C_41 = 8'd52,
    modExp_while_C_42 = 8'd53,
    modExp_while_C_43 = 8'd54,
    STAGE_VEC_LOOP_C_0 = 8'd55,
    COMP_LOOP_C_0 = 8'd56,
    COMP_LOOP_C_1 = 8'd57,
    COMP_LOOP_C_2 = 8'd58,
    COMP_LOOP_C_3 = 8'd59,
    COMP_LOOP_C_4 = 8'd60,
    COMP_LOOP_C_5 = 8'd61,
    COMP_LOOP_C_6 = 8'd62,
    COMP_LOOP_C_7 = 8'd63,
    COMP_LOOP_C_8 = 8'd64,
    COMP_LOOP_C_9 = 8'd65,
    COMP_LOOP_C_10 = 8'd66,
    COMP_LOOP_C_11 = 8'd67,
    COMP_LOOP_C_12 = 8'd68,
    COMP_LOOP_C_13 = 8'd69,
    COMP_LOOP_C_14 = 8'd70,
    COMP_LOOP_C_15 = 8'd71,
    COMP_LOOP_C_16 = 8'd72,
    COMP_LOOP_C_17 = 8'd73,
    COMP_LOOP_C_18 = 8'd74,
    COMP_LOOP_C_19 = 8'd75,
    COMP_LOOP_C_20 = 8'd76,
    COMP_LOOP_C_21 = 8'd77,
    COMP_LOOP_C_22 = 8'd78,
    COMP_LOOP_C_23 = 8'd79,
    COMP_LOOP_C_24 = 8'd80,
    COMP_LOOP_C_25 = 8'd81,
    COMP_LOOP_C_26 = 8'd82,
    COMP_LOOP_C_27 = 8'd83,
    COMP_LOOP_C_28 = 8'd84,
    COMP_LOOP_C_29 = 8'd85,
    COMP_LOOP_C_30 = 8'd86,
    COMP_LOOP_C_31 = 8'd87,
    COMP_LOOP_C_32 = 8'd88,
    COMP_LOOP_C_33 = 8'd89,
    COMP_LOOP_C_34 = 8'd90,
    COMP_LOOP_C_35 = 8'd91,
    COMP_LOOP_C_36 = 8'd92,
    COMP_LOOP_C_37 = 8'd93,
    COMP_LOOP_C_38 = 8'd94,
    COMP_LOOP_C_39 = 8'd95,
    COMP_LOOP_C_40 = 8'd96,
    COMP_LOOP_C_41 = 8'd97,
    COMP_LOOP_C_42 = 8'd98,
    COMP_LOOP_C_43 = 8'd99,
    COMP_LOOP_C_44 = 8'd100,
    COMP_LOOP_C_45 = 8'd101,
    modExp_1_while_C_0 = 8'd102,
    modExp_1_while_C_1 = 8'd103,
    modExp_1_while_C_2 = 8'd104,
    modExp_1_while_C_3 = 8'd105,
    modExp_1_while_C_4 = 8'd106,
    modExp_1_while_C_5 = 8'd107,
    modExp_1_while_C_6 = 8'd108,
    modExp_1_while_C_7 = 8'd109,
    modExp_1_while_C_8 = 8'd110,
    modExp_1_while_C_9 = 8'd111,
    modExp_1_while_C_10 = 8'd112,
    modExp_1_while_C_11 = 8'd113,
    modExp_1_while_C_12 = 8'd114,
    modExp_1_while_C_13 = 8'd115,
    modExp_1_while_C_14 = 8'd116,
    modExp_1_while_C_15 = 8'd117,
    modExp_1_while_C_16 = 8'd118,
    modExp_1_while_C_17 = 8'd119,
    modExp_1_while_C_18 = 8'd120,
    modExp_1_while_C_19 = 8'd121,
    modExp_1_while_C_20 = 8'd122,
    modExp_1_while_C_21 = 8'd123,
    modExp_1_while_C_22 = 8'd124,
    modExp_1_while_C_23 = 8'd125,
    modExp_1_while_C_24 = 8'd126,
    modExp_1_while_C_25 = 8'd127,
    modExp_1_while_C_26 = 8'd128,
    modExp_1_while_C_27 = 8'd129,
    modExp_1_while_C_28 = 8'd130,
    modExp_1_while_C_29 = 8'd131,
    modExp_1_while_C_30 = 8'd132,
    modExp_1_while_C_31 = 8'd133,
    modExp_1_while_C_32 = 8'd134,
    modExp_1_while_C_33 = 8'd135,
    modExp_1_while_C_34 = 8'd136,
    modExp_1_while_C_35 = 8'd137,
    modExp_1_while_C_36 = 8'd138,
    modExp_1_while_C_37 = 8'd139,
    modExp_1_while_C_38 = 8'd140,
    modExp_1_while_C_39 = 8'd141,
    modExp_1_while_C_40 = 8'd142,
    modExp_1_while_C_41 = 8'd143,
    modExp_1_while_C_42 = 8'd144,
    modExp_1_while_C_43 = 8'd145,
    COMP_LOOP_C_46 = 8'd146,
    COMP_LOOP_C_47 = 8'd147,
    COMP_LOOP_C_48 = 8'd148,
    COMP_LOOP_C_49 = 8'd149,
    COMP_LOOP_C_50 = 8'd150,
    COMP_LOOP_C_51 = 8'd151,
    COMP_LOOP_C_52 = 8'd152,
    COMP_LOOP_C_53 = 8'd153,
    COMP_LOOP_C_54 = 8'd154,
    COMP_LOOP_C_55 = 8'd155,
    COMP_LOOP_C_56 = 8'd156,
    COMP_LOOP_C_57 = 8'd157,
    COMP_LOOP_C_58 = 8'd158,
    COMP_LOOP_C_59 = 8'd159,
    COMP_LOOP_C_60 = 8'd160,
    COMP_LOOP_C_61 = 8'd161,
    COMP_LOOP_C_62 = 8'd162,
    COMP_LOOP_C_63 = 8'd163,
    COMP_LOOP_C_64 = 8'd164,
    COMP_LOOP_C_65 = 8'd165,
    COMP_LOOP_C_66 = 8'd166,
    COMP_LOOP_C_67 = 8'd167,
    COMP_LOOP_C_68 = 8'd168,
    COMP_LOOP_C_69 = 8'd169,
    COMP_LOOP_C_70 = 8'd170,
    COMP_LOOP_C_71 = 8'd171,
    COMP_LOOP_C_72 = 8'd172,
    COMP_LOOP_C_73 = 8'd173,
    COMP_LOOP_C_74 = 8'd174,
    COMP_LOOP_C_75 = 8'd175,
    COMP_LOOP_C_76 = 8'd176,
    COMP_LOOP_C_77 = 8'd177,
    COMP_LOOP_C_78 = 8'd178,
    COMP_LOOP_C_79 = 8'd179,
    COMP_LOOP_C_80 = 8'd180,
    COMP_LOOP_C_81 = 8'd181,
    COMP_LOOP_C_82 = 8'd182,
    COMP_LOOP_C_83 = 8'd183,
    COMP_LOOP_C_84 = 8'd184,
    COMP_LOOP_C_85 = 8'd185,
    COMP_LOOP_C_86 = 8'd186,
    COMP_LOOP_C_87 = 8'd187,
    COMP_LOOP_C_88 = 8'd188,
    COMP_LOOP_C_89 = 8'd189,
    COMP_LOOP_C_90 = 8'd190,
    COMP_LOOP_C_91 = 8'd191,
    COMP_LOOP_C_92 = 8'd192,
    COMP_LOOP_C_93 = 8'd193,
    COMP_LOOP_C_94 = 8'd194,
    COMP_LOOP_C_95 = 8'd195,
    COMP_LOOP_C_96 = 8'd196,
    COMP_LOOP_C_97 = 8'd197,
    COMP_LOOP_C_98 = 8'd198,
    COMP_LOOP_C_99 = 8'd199,
    COMP_LOOP_C_100 = 8'd200,
    COMP_LOOP_C_101 = 8'd201,
    COMP_LOOP_C_102 = 8'd202,
    COMP_LOOP_C_103 = 8'd203,
    COMP_LOOP_C_104 = 8'd204,
    COMP_LOOP_C_105 = 8'd205,
    COMP_LOOP_C_106 = 8'd206,
    COMP_LOOP_C_107 = 8'd207,
    COMP_LOOP_C_108 = 8'd208,
    COMP_LOOP_C_109 = 8'd209,
    COMP_LOOP_C_110 = 8'd210,
    COMP_LOOP_C_111 = 8'd211,
    COMP_LOOP_C_112 = 8'd212,
    COMP_LOOP_C_113 = 8'd213,
    COMP_LOOP_C_114 = 8'd214,
    COMP_LOOP_C_115 = 8'd215,
    COMP_LOOP_C_116 = 8'd216,
    COMP_LOOP_C_117 = 8'd217,
    COMP_LOOP_C_118 = 8'd218,
    COMP_LOOP_C_119 = 8'd219,
    COMP_LOOP_C_120 = 8'd220,
    COMP_LOOP_C_121 = 8'd221,
    COMP_LOOP_C_122 = 8'd222,
    COMP_LOOP_C_123 = 8'd223,
    COMP_LOOP_C_124 = 8'd224,
    COMP_LOOP_C_125 = 8'd225,
    COMP_LOOP_C_126 = 8'd226,
    COMP_LOOP_C_127 = 8'd227,
    COMP_LOOP_C_128 = 8'd228,
    COMP_LOOP_C_129 = 8'd229,
    COMP_LOOP_C_130 = 8'd230,
    COMP_LOOP_C_131 = 8'd231,
    COMP_LOOP_C_132 = 8'd232,
    COMP_LOOP_C_133 = 8'd233,
    STAGE_VEC_LOOP_C_1 = 8'd234,
    STAGE_MAIN_LOOP_C_7 = 8'd235,
    main_C_1 = 8'd236;

  reg [7:0] state_var;
  reg [7:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIF_core_core_fsm_1
    case (state_var)
      COPY_LOOP_C_0 : begin
        fsm_output = 8'b00000001;
        state_var_NS = COPY_LOOP_C_1;
      end
      COPY_LOOP_C_1 : begin
        fsm_output = 8'b00000010;
        state_var_NS = COPY_LOOP_C_2;
      end
      COPY_LOOP_C_2 : begin
        fsm_output = 8'b00000011;
        if ( COPY_LOOP_C_2_tr0 ) begin
          state_var_NS = STAGE_MAIN_LOOP_C_0;
        end
        else begin
          state_var_NS = COPY_LOOP_C_0;
        end
      end
      STAGE_MAIN_LOOP_C_0 : begin
        fsm_output = 8'b00000100;
        state_var_NS = STAGE_MAIN_LOOP_C_1;
      end
      STAGE_MAIN_LOOP_C_1 : begin
        fsm_output = 8'b00000101;
        state_var_NS = STAGE_MAIN_LOOP_C_2;
      end
      STAGE_MAIN_LOOP_C_2 : begin
        fsm_output = 8'b00000110;
        state_var_NS = STAGE_MAIN_LOOP_C_3;
      end
      STAGE_MAIN_LOOP_C_3 : begin
        fsm_output = 8'b00000111;
        state_var_NS = STAGE_MAIN_LOOP_C_4;
      end
      STAGE_MAIN_LOOP_C_4 : begin
        fsm_output = 8'b00001000;
        state_var_NS = STAGE_MAIN_LOOP_C_5;
      end
      STAGE_MAIN_LOOP_C_5 : begin
        fsm_output = 8'b00001001;
        state_var_NS = STAGE_MAIN_LOOP_C_6;
      end
      STAGE_MAIN_LOOP_C_6 : begin
        fsm_output = 8'b00001010;
        if ( STAGE_MAIN_LOOP_C_6_tr0 ) begin
          state_var_NS = STAGE_VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      modExp_while_C_0 : begin
        fsm_output = 8'b00001011;
        state_var_NS = modExp_while_C_1;
      end
      modExp_while_C_1 : begin
        fsm_output = 8'b00001100;
        state_var_NS = modExp_while_C_2;
      end
      modExp_while_C_2 : begin
        fsm_output = 8'b00001101;
        state_var_NS = modExp_while_C_3;
      end
      modExp_while_C_3 : begin
        fsm_output = 8'b00001110;
        state_var_NS = modExp_while_C_4;
      end
      modExp_while_C_4 : begin
        fsm_output = 8'b00001111;
        state_var_NS = modExp_while_C_5;
      end
      modExp_while_C_5 : begin
        fsm_output = 8'b00010000;
        state_var_NS = modExp_while_C_6;
      end
      modExp_while_C_6 : begin
        fsm_output = 8'b00010001;
        state_var_NS = modExp_while_C_7;
      end
      modExp_while_C_7 : begin
        fsm_output = 8'b00010010;
        state_var_NS = modExp_while_C_8;
      end
      modExp_while_C_8 : begin
        fsm_output = 8'b00010011;
        state_var_NS = modExp_while_C_9;
      end
      modExp_while_C_9 : begin
        fsm_output = 8'b00010100;
        state_var_NS = modExp_while_C_10;
      end
      modExp_while_C_10 : begin
        fsm_output = 8'b00010101;
        state_var_NS = modExp_while_C_11;
      end
      modExp_while_C_11 : begin
        fsm_output = 8'b00010110;
        state_var_NS = modExp_while_C_12;
      end
      modExp_while_C_12 : begin
        fsm_output = 8'b00010111;
        state_var_NS = modExp_while_C_13;
      end
      modExp_while_C_13 : begin
        fsm_output = 8'b00011000;
        state_var_NS = modExp_while_C_14;
      end
      modExp_while_C_14 : begin
        fsm_output = 8'b00011001;
        state_var_NS = modExp_while_C_15;
      end
      modExp_while_C_15 : begin
        fsm_output = 8'b00011010;
        state_var_NS = modExp_while_C_16;
      end
      modExp_while_C_16 : begin
        fsm_output = 8'b00011011;
        state_var_NS = modExp_while_C_17;
      end
      modExp_while_C_17 : begin
        fsm_output = 8'b00011100;
        state_var_NS = modExp_while_C_18;
      end
      modExp_while_C_18 : begin
        fsm_output = 8'b00011101;
        state_var_NS = modExp_while_C_19;
      end
      modExp_while_C_19 : begin
        fsm_output = 8'b00011110;
        state_var_NS = modExp_while_C_20;
      end
      modExp_while_C_20 : begin
        fsm_output = 8'b00011111;
        state_var_NS = modExp_while_C_21;
      end
      modExp_while_C_21 : begin
        fsm_output = 8'b00100000;
        state_var_NS = modExp_while_C_22;
      end
      modExp_while_C_22 : begin
        fsm_output = 8'b00100001;
        state_var_NS = modExp_while_C_23;
      end
      modExp_while_C_23 : begin
        fsm_output = 8'b00100010;
        state_var_NS = modExp_while_C_24;
      end
      modExp_while_C_24 : begin
        fsm_output = 8'b00100011;
        state_var_NS = modExp_while_C_25;
      end
      modExp_while_C_25 : begin
        fsm_output = 8'b00100100;
        state_var_NS = modExp_while_C_26;
      end
      modExp_while_C_26 : begin
        fsm_output = 8'b00100101;
        state_var_NS = modExp_while_C_27;
      end
      modExp_while_C_27 : begin
        fsm_output = 8'b00100110;
        state_var_NS = modExp_while_C_28;
      end
      modExp_while_C_28 : begin
        fsm_output = 8'b00100111;
        state_var_NS = modExp_while_C_29;
      end
      modExp_while_C_29 : begin
        fsm_output = 8'b00101000;
        state_var_NS = modExp_while_C_30;
      end
      modExp_while_C_30 : begin
        fsm_output = 8'b00101001;
        state_var_NS = modExp_while_C_31;
      end
      modExp_while_C_31 : begin
        fsm_output = 8'b00101010;
        state_var_NS = modExp_while_C_32;
      end
      modExp_while_C_32 : begin
        fsm_output = 8'b00101011;
        state_var_NS = modExp_while_C_33;
      end
      modExp_while_C_33 : begin
        fsm_output = 8'b00101100;
        state_var_NS = modExp_while_C_34;
      end
      modExp_while_C_34 : begin
        fsm_output = 8'b00101101;
        state_var_NS = modExp_while_C_35;
      end
      modExp_while_C_35 : begin
        fsm_output = 8'b00101110;
        state_var_NS = modExp_while_C_36;
      end
      modExp_while_C_36 : begin
        fsm_output = 8'b00101111;
        state_var_NS = modExp_while_C_37;
      end
      modExp_while_C_37 : begin
        fsm_output = 8'b00110000;
        state_var_NS = modExp_while_C_38;
      end
      modExp_while_C_38 : begin
        fsm_output = 8'b00110001;
        state_var_NS = modExp_while_C_39;
      end
      modExp_while_C_39 : begin
        fsm_output = 8'b00110010;
        state_var_NS = modExp_while_C_40;
      end
      modExp_while_C_40 : begin
        fsm_output = 8'b00110011;
        state_var_NS = modExp_while_C_41;
      end
      modExp_while_C_41 : begin
        fsm_output = 8'b00110100;
        state_var_NS = modExp_while_C_42;
      end
      modExp_while_C_42 : begin
        fsm_output = 8'b00110101;
        state_var_NS = modExp_while_C_43;
      end
      modExp_while_C_43 : begin
        fsm_output = 8'b00110110;
        if ( modExp_while_C_43_tr0 ) begin
          state_var_NS = STAGE_VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      STAGE_VEC_LOOP_C_0 : begin
        fsm_output = 8'b00110111;
        if ( STAGE_VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_VEC_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 8'b00111000;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 8'b00111001;
        state_var_NS = COMP_LOOP_C_2;
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 8'b00111010;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 8'b00111011;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 8'b00111100;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 8'b00111101;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 8'b00111110;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 8'b00111111;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 8'b01000000;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 8'b01000001;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 8'b01000010;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 8'b01000011;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 8'b01000100;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 8'b01000101;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 8'b01000110;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 8'b01000111;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 8'b01001000;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 8'b01001001;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 8'b01001010;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 8'b01001011;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 8'b01001100;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 8'b01001101;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 8'b01001110;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 8'b01001111;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 8'b01010000;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 8'b01010001;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 8'b01010010;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 8'b01010011;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 8'b01010100;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 8'b01010101;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 8'b01010110;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 8'b01010111;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 8'b01011000;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 8'b01011001;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 8'b01011010;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 8'b01011011;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 8'b01011100;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 8'b01011101;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 8'b01011110;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 8'b01011111;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 8'b01100000;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 8'b01100001;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 8'b01100010;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 8'b01100011;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 8'b01100100;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 8'b01100101;
        if ( COMP_LOOP_C_45_tr0 ) begin
          state_var_NS = COMP_LOOP_C_46;
        end
        else begin
          state_var_NS = modExp_1_while_C_0;
        end
      end
      modExp_1_while_C_0 : begin
        fsm_output = 8'b01100110;
        state_var_NS = modExp_1_while_C_1;
      end
      modExp_1_while_C_1 : begin
        fsm_output = 8'b01100111;
        state_var_NS = modExp_1_while_C_2;
      end
      modExp_1_while_C_2 : begin
        fsm_output = 8'b01101000;
        state_var_NS = modExp_1_while_C_3;
      end
      modExp_1_while_C_3 : begin
        fsm_output = 8'b01101001;
        state_var_NS = modExp_1_while_C_4;
      end
      modExp_1_while_C_4 : begin
        fsm_output = 8'b01101010;
        state_var_NS = modExp_1_while_C_5;
      end
      modExp_1_while_C_5 : begin
        fsm_output = 8'b01101011;
        state_var_NS = modExp_1_while_C_6;
      end
      modExp_1_while_C_6 : begin
        fsm_output = 8'b01101100;
        state_var_NS = modExp_1_while_C_7;
      end
      modExp_1_while_C_7 : begin
        fsm_output = 8'b01101101;
        state_var_NS = modExp_1_while_C_8;
      end
      modExp_1_while_C_8 : begin
        fsm_output = 8'b01101110;
        state_var_NS = modExp_1_while_C_9;
      end
      modExp_1_while_C_9 : begin
        fsm_output = 8'b01101111;
        state_var_NS = modExp_1_while_C_10;
      end
      modExp_1_while_C_10 : begin
        fsm_output = 8'b01110000;
        state_var_NS = modExp_1_while_C_11;
      end
      modExp_1_while_C_11 : begin
        fsm_output = 8'b01110001;
        state_var_NS = modExp_1_while_C_12;
      end
      modExp_1_while_C_12 : begin
        fsm_output = 8'b01110010;
        state_var_NS = modExp_1_while_C_13;
      end
      modExp_1_while_C_13 : begin
        fsm_output = 8'b01110011;
        state_var_NS = modExp_1_while_C_14;
      end
      modExp_1_while_C_14 : begin
        fsm_output = 8'b01110100;
        state_var_NS = modExp_1_while_C_15;
      end
      modExp_1_while_C_15 : begin
        fsm_output = 8'b01110101;
        state_var_NS = modExp_1_while_C_16;
      end
      modExp_1_while_C_16 : begin
        fsm_output = 8'b01110110;
        state_var_NS = modExp_1_while_C_17;
      end
      modExp_1_while_C_17 : begin
        fsm_output = 8'b01110111;
        state_var_NS = modExp_1_while_C_18;
      end
      modExp_1_while_C_18 : begin
        fsm_output = 8'b01111000;
        state_var_NS = modExp_1_while_C_19;
      end
      modExp_1_while_C_19 : begin
        fsm_output = 8'b01111001;
        state_var_NS = modExp_1_while_C_20;
      end
      modExp_1_while_C_20 : begin
        fsm_output = 8'b01111010;
        state_var_NS = modExp_1_while_C_21;
      end
      modExp_1_while_C_21 : begin
        fsm_output = 8'b01111011;
        state_var_NS = modExp_1_while_C_22;
      end
      modExp_1_while_C_22 : begin
        fsm_output = 8'b01111100;
        state_var_NS = modExp_1_while_C_23;
      end
      modExp_1_while_C_23 : begin
        fsm_output = 8'b01111101;
        state_var_NS = modExp_1_while_C_24;
      end
      modExp_1_while_C_24 : begin
        fsm_output = 8'b01111110;
        state_var_NS = modExp_1_while_C_25;
      end
      modExp_1_while_C_25 : begin
        fsm_output = 8'b01111111;
        state_var_NS = modExp_1_while_C_26;
      end
      modExp_1_while_C_26 : begin
        fsm_output = 8'b10000000;
        state_var_NS = modExp_1_while_C_27;
      end
      modExp_1_while_C_27 : begin
        fsm_output = 8'b10000001;
        state_var_NS = modExp_1_while_C_28;
      end
      modExp_1_while_C_28 : begin
        fsm_output = 8'b10000010;
        state_var_NS = modExp_1_while_C_29;
      end
      modExp_1_while_C_29 : begin
        fsm_output = 8'b10000011;
        state_var_NS = modExp_1_while_C_30;
      end
      modExp_1_while_C_30 : begin
        fsm_output = 8'b10000100;
        state_var_NS = modExp_1_while_C_31;
      end
      modExp_1_while_C_31 : begin
        fsm_output = 8'b10000101;
        state_var_NS = modExp_1_while_C_32;
      end
      modExp_1_while_C_32 : begin
        fsm_output = 8'b10000110;
        state_var_NS = modExp_1_while_C_33;
      end
      modExp_1_while_C_33 : begin
        fsm_output = 8'b10000111;
        state_var_NS = modExp_1_while_C_34;
      end
      modExp_1_while_C_34 : begin
        fsm_output = 8'b10001000;
        state_var_NS = modExp_1_while_C_35;
      end
      modExp_1_while_C_35 : begin
        fsm_output = 8'b10001001;
        state_var_NS = modExp_1_while_C_36;
      end
      modExp_1_while_C_36 : begin
        fsm_output = 8'b10001010;
        state_var_NS = modExp_1_while_C_37;
      end
      modExp_1_while_C_37 : begin
        fsm_output = 8'b10001011;
        state_var_NS = modExp_1_while_C_38;
      end
      modExp_1_while_C_38 : begin
        fsm_output = 8'b10001100;
        state_var_NS = modExp_1_while_C_39;
      end
      modExp_1_while_C_39 : begin
        fsm_output = 8'b10001101;
        state_var_NS = modExp_1_while_C_40;
      end
      modExp_1_while_C_40 : begin
        fsm_output = 8'b10001110;
        state_var_NS = modExp_1_while_C_41;
      end
      modExp_1_while_C_41 : begin
        fsm_output = 8'b10001111;
        state_var_NS = modExp_1_while_C_42;
      end
      modExp_1_while_C_42 : begin
        fsm_output = 8'b10010000;
        state_var_NS = modExp_1_while_C_43;
      end
      modExp_1_while_C_43 : begin
        fsm_output = 8'b10010001;
        if ( modExp_1_while_C_43_tr0 ) begin
          state_var_NS = COMP_LOOP_C_46;
        end
        else begin
          state_var_NS = modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 8'b10010010;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 8'b10010011;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 8'b10010100;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 8'b10010101;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 8'b10010110;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 8'b10010111;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 8'b10011000;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 8'b10011001;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 8'b10011010;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 8'b10011011;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 8'b10011100;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 8'b10011101;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 8'b10011110;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 8'b10011111;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 8'b10100000;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 8'b10100001;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 8'b10100010;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 8'b10100011;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 8'b10100100;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 8'b10100101;
        state_var_NS = COMP_LOOP_C_66;
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 8'b10100110;
        state_var_NS = COMP_LOOP_C_67;
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 8'b10100111;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 8'b10101000;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 8'b10101001;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 8'b10101010;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 8'b10101011;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 8'b10101100;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 8'b10101101;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 8'b10101110;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 8'b10101111;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 8'b10110000;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 8'b10110001;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 8'b10110010;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 8'b10110011;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 8'b10110100;
        state_var_NS = COMP_LOOP_C_81;
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 8'b10110101;
        state_var_NS = COMP_LOOP_C_82;
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 8'b10110110;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 8'b10110111;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 8'b10111000;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 8'b10111001;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 8'b10111010;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 8'b10111011;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 8'b10111100;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 8'b10111101;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 8'b10111110;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 8'b10111111;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 8'b11000000;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 8'b11000001;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 8'b11000010;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 8'b11000011;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 8'b11000100;
        state_var_NS = COMP_LOOP_C_97;
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 8'b11000101;
        state_var_NS = COMP_LOOP_C_98;
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 8'b11000110;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 8'b11000111;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 8'b11001000;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 8'b11001001;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 8'b11001010;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 8'b11001011;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 8'b11001100;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 8'b11001101;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 8'b11001110;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 8'b11001111;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 8'b11010000;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 8'b11010001;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 8'b11010010;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 8'b11010011;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 8'b11010100;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 8'b11010101;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 8'b11010110;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 8'b11010111;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 8'b11011000;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 8'b11011001;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 8'b11011010;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 8'b11011011;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 8'b11011100;
        state_var_NS = COMP_LOOP_C_121;
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 8'b11011101;
        state_var_NS = COMP_LOOP_C_122;
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 8'b11011110;
        state_var_NS = COMP_LOOP_C_123;
      end
      COMP_LOOP_C_123 : begin
        fsm_output = 8'b11011111;
        state_var_NS = COMP_LOOP_C_124;
      end
      COMP_LOOP_C_124 : begin
        fsm_output = 8'b11100000;
        state_var_NS = COMP_LOOP_C_125;
      end
      COMP_LOOP_C_125 : begin
        fsm_output = 8'b11100001;
        state_var_NS = COMP_LOOP_C_126;
      end
      COMP_LOOP_C_126 : begin
        fsm_output = 8'b11100010;
        state_var_NS = COMP_LOOP_C_127;
      end
      COMP_LOOP_C_127 : begin
        fsm_output = 8'b11100011;
        state_var_NS = COMP_LOOP_C_128;
      end
      COMP_LOOP_C_128 : begin
        fsm_output = 8'b11100100;
        state_var_NS = COMP_LOOP_C_129;
      end
      COMP_LOOP_C_129 : begin
        fsm_output = 8'b11100101;
        state_var_NS = COMP_LOOP_C_130;
      end
      COMP_LOOP_C_130 : begin
        fsm_output = 8'b11100110;
        state_var_NS = COMP_LOOP_C_131;
      end
      COMP_LOOP_C_131 : begin
        fsm_output = 8'b11100111;
        state_var_NS = COMP_LOOP_C_132;
      end
      COMP_LOOP_C_132 : begin
        fsm_output = 8'b11101000;
        state_var_NS = COMP_LOOP_C_133;
      end
      COMP_LOOP_C_133 : begin
        fsm_output = 8'b11101001;
        if ( COMP_LOOP_C_133_tr0 ) begin
          state_var_NS = STAGE_VEC_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_VEC_LOOP_C_1 : begin
        fsm_output = 8'b11101010;
        if ( STAGE_VEC_LOOP_C_1_tr0 ) begin
          state_var_NS = STAGE_MAIN_LOOP_C_7;
        end
        else begin
          state_var_NS = STAGE_VEC_LOOP_C_0;
        end
      end
      STAGE_MAIN_LOOP_C_7 : begin
        fsm_output = 8'b11101011;
        if ( STAGE_MAIN_LOOP_C_7_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_MAIN_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b11101100;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 8'b00000000;
        state_var_NS = COPY_LOOP_C_0;
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
//  Design Unit:    inPlaceNTT_DIF_core_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core_wait_dp (
  clk, modExp_while_mul_cmp_z, modExp_while_if_mul_cmp_z, modExp_while_mul_cmp_z_oreg,
      modExp_while_if_mul_cmp_z_oreg
);
  input clk;
  input [128:0] modExp_while_mul_cmp_z;
  input [127:0] modExp_while_if_mul_cmp_z;
  output [128:0] modExp_while_mul_cmp_z_oreg;
  reg [128:0] modExp_while_mul_cmp_z_oreg;
  output [127:0] modExp_while_if_mul_cmp_z_oreg;
  reg [127:0] modExp_while_if_mul_cmp_z_oreg;



  // Interconnect Declarations for Component Instantiations 
  always @(posedge clk) begin
    modExp_while_mul_cmp_z_oreg <= modExp_while_mul_cmp_z;
    modExp_while_if_mul_cmp_z_oreg <= modExp_while_if_mul_cmp_z;
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_core
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core (
  clk, rst, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz,
      result_rsc_triosy_lz, vec_rsci_q_d, vec_rsci_radr_d, vec_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      result_rsci_d_d, result_rsci_q_d, result_rsci_radr_d, result_rsci_wadr_d, result_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      modExp_while_mul_cmp_a, modExp_while_mul_cmp_b, modExp_while_mul_cmp_z, modExp_while_if_mul_cmp_a,
      modExp_while_if_mul_cmp_b, modExp_while_if_mul_cmp_z, result_rsci_we_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output result_rsc_triosy_lz;
  input [63:0] vec_rsci_q_d;
  output [9:0] vec_rsci_radr_d;
  output vec_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output [63:0] result_rsci_d_d;
  input [63:0] result_rsci_q_d;
  output [9:0] result_rsci_radr_d;
  output [9:0] result_rsci_wadr_d;
  output result_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output [63:0] modExp_while_mul_cmp_a;
  reg [63:0] modExp_while_mul_cmp_a;
  output [64:0] modExp_while_mul_cmp_b;
  input [128:0] modExp_while_mul_cmp_z;
  output [63:0] modExp_while_if_mul_cmp_a;
  reg [63:0] modExp_while_if_mul_cmp_a;
  output [63:0] modExp_while_if_mul_cmp_b;
  reg [63:0] modExp_while_if_mul_cmp_b;
  input [127:0] modExp_while_if_mul_cmp_z;
  output result_rsci_we_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  wire [63:0] r_rsci_idat;
  wire [64:0] modExp_while_rem_cmp_z;
  wire [128:0] modExp_while_mul_cmp_z_oreg;
  reg [127:0] modExp_while_if_rem_cmp_a;
  wire [63:0] modExp_while_if_rem_cmp_z;
  wire [127:0] modExp_while_if_mul_cmp_z_oreg;
  reg [63:0] operator_64_false_div_cmp_a;
  wire [63:0] operator_64_false_div_cmp_z;
  reg [1:0] operator_64_false_div_cmp_b_3_2;
  reg operator_64_false_div_cmp_b_1;
  reg operator_64_false_div_cmp_b_0;
  wire [7:0] fsm_output;
  wire not_tmp_23;
  wire and_dcpl_8;
  wire and_dcpl_9;
  wire and_dcpl_11;
  wire and_dcpl_12;
  wire or_tmp_12;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire and_dcpl_19;
  wire and_dcpl_20;
  wire and_dcpl_21;
  wire and_dcpl_23;
  wire or_tmp_19;
  wire or_tmp_20;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_33;
  wire and_dcpl_34;
  wire and_dcpl_36;
  wire and_dcpl_38;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_43;
  wire and_dcpl_53;
  wire or_tmp_31;
  wire or_tmp_32;
  wire mux_tmp_20;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire or_tmp_37;
  wire or_tmp_39;
  wire and_dcpl_63;
  wire and_dcpl_65;
  wire and_dcpl_66;
  wire and_dcpl_70;
  wire and_dcpl_71;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire and_dcpl_75;
  wire and_dcpl_76;
  wire and_dcpl_79;
  wire and_dcpl_80;
  wire and_dcpl_84;
  wire and_dcpl_88;
  wire or_dcpl_8;
  wire or_dcpl_11;
  wire nor_tmp_22;
  wire not_tmp_56;
  wire mux_tmp_46;
  wire mux_tmp_47;
  wire or_dcpl_24;
  wire and_dcpl_103;
  wire and_dcpl_105;
  wire or_dcpl_29;
  wire or_dcpl_32;
  wire or_dcpl_33;
  wire not_tmp_81;
  reg exit_modExp_1_while_sva;
  reg operator_64_false_1_slc_operator_64_false_1_acc_3_1_itm;
  wire [3:0] COMP_LOOP_k_3_0_sva_2;
  wire [4:0] nl_COMP_LOOP_k_3_0_sva_2;
  reg [9:0] COPY_LOOP_i_10_0_sva_9_0;
  reg [10:0] COPY_LOOP_i_10_0_sva_1;
  reg modExp_1_while_asn_2_itm;
  wire mux_23_ssc;
  wire nor_69_ssc;
  wire and_71_ssc;
  wire and_75_ssc;
  reg reg_modExp_while_rem_cmp_a_ftd;
  reg [62:0] reg_modExp_while_rem_cmp_a_ftd_1;
  reg reg_modExp_while_rem_cmp_a_2_ftd;
  reg [63:0] reg_modExp_while_rem_cmp_a_2_ftd_1;
  reg reg_vec_rsc_triosy_obj_ld_cse;
  reg [63:0] reg_modExp_while_rem_cmp_b_63_0_cse;
  wire and_134_cse;
  wire and_131_cse;
  wire and_130_cse;
  wire nor_68_cse;
  wire nor_66_cse;
  wire and_132_cse;
  wire or_56_cse;
  wire reg_modExp_1_while_slc_modExp_while_mul_modExp_1_while_nor_cse;
  wire modExp_while_or_3_cse;
  wire [64:0] COMP_LOOP_acc_12_psp_mx0w1;
  wire [65:0] nl_COMP_LOOP_acc_12_psp_mx0w1;
  reg [64:0] COMP_LOOP_acc_12_psp;
  wire modExp_while_or_cse;
  wire [9:0] COMP_LOOP_acc_2_cse_sva_mx0w0;
  wire [11:0] nl_COMP_LOOP_acc_2_cse_sva_mx0w0;
  reg [9:0] COMP_LOOP_acc_1_cse_sva;
  reg [9:0] COMP_LOOP_acc_2_cse_sva;
  wire and_dcpl;
  wire and_dcpl_119;
  wire and_dcpl_124;
  wire and_dcpl_126;
  wire and_dcpl_131;
  wire [3:0] z_out;
  wire [4:0] nl_z_out;
  wire and_dcpl_134;
  wire and_dcpl_135;
  wire and_dcpl_138;
  wire and_dcpl_141;
  wire and_dcpl_144;
  wire and_dcpl_147;
  wire and_dcpl_149;
  wire and_dcpl_153;
  wire and_dcpl_157;
  wire and_dcpl_162;
  wire and_dcpl_167;
  wire [63:0] z_out_1;
  reg [63:0] p_sva;
  reg [63:0] r_sva;
  reg [3:0] STAGE_MAIN_LOOP_i_3_0_sva;
  reg [63:0] modExp_result_sva;
  reg [63:0] factor1_sva;
  reg [63:0] factor2_sva;
  reg modExp_exp_1_1_sva;
  reg modExp_exp_1_0_sva;
  reg [63:0] modExp_1_result_sva;
  reg [30:0] operator_64_false_slc_modExp_exp_31_0_31_1_1_itm;
  reg [2:0] COMP_LOOP_k_3_0_sva_2_0;
  reg [127:0] modExp_1_while_slc_modExp_while_mul_cmp_z_oreg_127_0_psp;
  wire COPY_LOOP_i_10_0_sva_9_0_mx0c1;
  wire COPY_LOOP_i_10_0_sva_9_0_mx0c2;
  wire STAGE_MAIN_LOOP_i_3_0_sva_mx0c1;
  wire [30:0] operator_64_false_slc_modExp_exp_31_0_31_1_4;
  wire exit_modExp_1_while_sva_mx0c0;
  wire [64:0] COMP_LOOP_acc_5_psp_1;
  wire [65:0] nl_COMP_LOOP_acc_5_psp_1;
  reg reg_modExp_while_mul_cmp_b_ftd;
  reg [63:0] reg_modExp_while_mul_cmp_b_ftd_1;
  reg [30:0] modExp_exp_31_0_sva_rsp_1;
  wire nor_56_cse;
  wire [128:0] modExp_while_modExp_while_mux_rgt;
  reg COMP_LOOP_mul_mut_128;
  reg [127:0] COMP_LOOP_mul_mut_127_0;
  wire or_181_cse;
  wire or_180_cse;
  wire and_208_cse;
  wire or_156_cse;
  wire or_183_tmp;
  wire r_or_cse;
  wire r_and_1_cse;
  wire COPY_LOOP_nor_3_itm;
  wire STAGE_MAIN_LOOP_acc_itm_4_1;
  wire operator_64_false_acc_1_itm_32_1;

  wire[9:0] COPY_LOOP_i_mux_nl;
  wire[0:0] COPY_LOOP_i_not_nl;
  wire[0:0] mux_38_nl;
  wire[0:0] mux_37_nl;
  wire[0:0] mux_36_nl;
  wire[0:0] mux_35_nl;
  wire[0:0] mux_34_nl;
  wire[0:0] mux_33_nl;
  wire[0:0] or_55_nl;
  wire[0:0] nand_nl;
  wire[0:0] nor_77_nl;
  wire[0:0] mux_39_nl;
  wire[0:0] or_160_nl;
  wire[0:0] or_161_nl;
  wire[0:0] and_93_nl;
  wire[0:0] mux_43_nl;
  wire[0:0] mux_42_nl;
  wire[0:0] mux_41_nl;
  wire[0:0] mux_40_nl;
  wire[0:0] and_103_nl;
  wire[0:0] mux_52_nl;
  wire[0:0] mux_51_nl;
  wire[0:0] mux_50_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] mux_48_nl;
  wire[0:0] nor_51_nl;
  wire[0:0] modExp_1_while_and_1_nl;
  wire[0:0] mux_17_nl;
  wire[0:0] or_35_nl;
  wire[0:0] nand_17_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] mux_nl;
  wire[0:0] nand_23_nl;
  wire[0:0] nor_105_nl;
  wire[0:0] nor_106_nl;
  wire[0:0] mux_89_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] nor_102_nl;
  wire[0:0] nor_103_nl;
  wire[0:0] nor_104_nl;
  wire[0:0] nand_21_nl;
  wire[0:0] mux_93_nl;
  wire[0:0] mux_92_nl;
  wire[0:0] mux_91_nl;
  wire[0:0] nor_101_nl;
  wire[0:0] mux_90_nl;
  wire[0:0] and_206_nl;
  wire[0:0] and_117_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] or_165_nl;
  wire[0:0] or_166_nl;
  wire[0:0] or_158_nl;
  wire[0:0] COMP_LOOP_mux1h_8_nl;
  wire[0:0] mux_84_nl;
  wire[4:0] STAGE_MAIN_LOOP_acc_nl;
  wire[5:0] nl_STAGE_MAIN_LOOP_acc_nl;
  wire[0:0] or_154_nl;
  wire[0:0] nand_16_nl;
  wire[0:0] or_40_nl;
  wire[0:0] mux_31_nl;
  wire[0:0] and_nl;
  wire[0:0] nor_58_nl;
  wire[0:0] mux_32_nl;
  wire[0:0] or_52_nl;
  wire[0:0] or_78_nl;
  wire[0:0] mux_9_nl;
  wire[0:0] mux_8_nl;
  wire[0:0] or_20_nl;
  wire[0:0] nand_19_nl;
  wire[32:0] operator_64_false_acc_1_nl;
  wire[33:0] nl_operator_64_false_acc_1_nl;
  wire[0:0] mux_22_nl;
  wire[0:0] nor_59_nl;
  wire[0:0] mux_21_nl;
  wire[0:0] mux_19_nl;
  wire[0:0] mux_18_nl;
  wire[0:0] mux_27_nl;
  wire[0:0] mux_26_nl;
  wire[0:0] mux_25_nl;
  wire[0:0] mux_24_nl;
  wire[0:0] mux_28_nl;
  wire[0:0] and_136_nl;
  wire[0:0] nand_13_nl;
  wire[0:0] mux_30_nl;
  wire[0:0] mux_29_nl;
  wire[0:0] modExp_while_mux1h_nl;
  wire[62:0] modExp_while_mux1h_7_nl;
  wire[0:0] modExp_while_nor_1_nl;
  wire[0:0] and_33_nl;
  wire[0:0] mux_14_nl;
  wire[0:0] and_38_nl;
  wire[0:0] and_40_nl;
  wire[0:0] and_45_nl;
  wire[0:0] and_47_nl;
  wire[0:0] mux_16_nl;
  wire[0:0] mux_15_nl;
  wire[0:0] or_162_nl;
  wire[0:0] or_163_nl;
  wire[0:0] or_164_nl;
  wire[0:0] nor_108_nl;
  wire[0:0] or_184_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] nor_75_nl;
  wire[0:0] and_149_nl;
  wire[0:0] operator_64_false_1_operator_64_false_1_or_1_nl;
  wire[2:0] operator_64_false_1_mux1h_2_nl;
  wire[64:0] acc_1_nl;
  wire[65:0] nl_acc_1_nl;
  wire[63:0] COPY_LOOP_mux1h_4_nl;
  wire[0:0] COPY_LOOP_or_5_nl;
  wire[0:0] COPY_LOOP_or_6_nl;
  wire[0:0] COPY_LOOP_COPY_LOOP_or_2_nl;
  wire[0:0] COPY_LOOP_COPY_LOOP_or_3_nl;
  wire[0:0] COPY_LOOP_mux_3_nl;
  wire[0:0] COPY_LOOP_or_7_nl;
  wire[0:0] COPY_LOOP_mux1h_5_nl;
  wire[0:0] COPY_LOOP_or_8_nl;
  wire[0:0] COPY_LOOP_mux1h_6_nl;
  wire[0:0] COPY_LOOP_or_9_nl;
  wire[0:0] COPY_LOOP_mux1h_7_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [128:0] nl_modExp_while_rem_cmp_a;
  assign nl_modExp_while_rem_cmp_a = {reg_modExp_while_rem_cmp_a_ftd , reg_modExp_while_rem_cmp_a_ftd_1
      , reg_modExp_while_rem_cmp_a_2_ftd , reg_modExp_while_rem_cmp_a_2_ftd_1};
  wire [64:0] nl_modExp_while_rem_cmp_b;
  assign nl_modExp_while_rem_cmp_b = {1'b0, reg_modExp_while_rem_cmp_b_63_0_cse};
  wire [63:0] nl_modExp_while_if_rem_cmp_b;
  assign nl_modExp_while_if_rem_cmp_b = reg_modExp_while_rem_cmp_b_63_0_cse;
  wire [3:0] nl_operator_64_false_div_cmp_b;
  assign nl_operator_64_false_div_cmp_b = {operator_64_false_div_cmp_b_3_2 , operator_64_false_div_cmp_b_1
      , operator_64_false_div_cmp_b_0};
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COPY_LOOP_C_2_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COPY_LOOP_C_2_tr0 = COPY_LOOP_i_10_0_sva_1[10];
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_6_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_6_tr0 = ~ operator_64_false_acc_1_itm_32_1;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_0_tr0 = ~ (z_out[3]);
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_45_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_45_tr0 = ~ operator_64_false_1_slc_operator_64_false_1_acc_3_1_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_1_tr0 = z_out_1[10];
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_7_tr0 = STAGE_MAIN_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd3),
  .width(32'sd64)) r_rsci (
      .dat(r_rsc_dat),
      .idat(r_rsci_idat)
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
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_obj_ld_cse),
      .lz(result_rsc_triosy_lz)
    );
  mgc_rem #(.width_a(32'sd129),
  .width_b(32'sd65),
  .signd(32'sd1)) modExp_while_rem_cmp (
      .a(nl_modExp_while_rem_cmp_a[128:0]),
      .b(nl_modExp_while_rem_cmp_b[64:0]),
      .z(modExp_while_rem_cmp_z)
    );
  mgc_rem #(.width_a(32'sd128),
  .width_b(32'sd64),
  .signd(32'sd0)) modExp_while_if_rem_cmp (
      .a(modExp_while_if_rem_cmp_a),
      .b(nl_modExp_while_if_rem_cmp_b[63:0]),
      .z(modExp_while_if_rem_cmp_z)
    );
  mgc_div #(.width_a(32'sd64),
  .width_b(32'sd4),
  .signd(32'sd0)) operator_64_false_div_cmp (
      .a(operator_64_false_div_cmp_a),
      .b(nl_operator_64_false_div_cmp_b[3:0]),
      .z(operator_64_false_div_cmp_z)
    );
  inPlaceNTT_DIF_core_wait_dp inPlaceNTT_DIF_core_wait_dp_inst (
      .clk(clk),
      .modExp_while_mul_cmp_z(modExp_while_mul_cmp_z),
      .modExp_while_if_mul_cmp_z(modExp_while_if_mul_cmp_z),
      .modExp_while_mul_cmp_z_oreg(modExp_while_mul_cmp_z_oreg),
      .modExp_while_if_mul_cmp_z_oreg(modExp_while_if_mul_cmp_z_oreg)
    );
  inPlaceNTT_DIF_core_core_fsm inPlaceNTT_DIF_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .COPY_LOOP_C_2_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COPY_LOOP_C_2_tr0[0:0]),
      .STAGE_MAIN_LOOP_C_6_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_6_tr0[0:0]),
      .modExp_while_C_43_tr0(exit_modExp_1_while_sva),
      .STAGE_VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_0_tr0[0:0]),
      .COMP_LOOP_C_45_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_45_tr0[0:0]),
      .modExp_1_while_C_43_tr0(exit_modExp_1_while_sva),
      .COMP_LOOP_C_133_tr0(exit_modExp_1_while_sva),
      .STAGE_VEC_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_1_tr0[0:0]),
      .STAGE_MAIN_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_7_tr0[0:0])
    );
  assign nor_68_cse = ~((fsm_output[5]) | (fsm_output[7]));
  assign nor_66_cse = ~((fsm_output[6]) | (fsm_output[4]));
  assign r_or_cse = and_dcpl_76 | and_dcpl_88;
  assign r_and_1_cse = (~ and_dcpl_88) & and_dcpl_79;
  assign modExp_while_mul_cmp_b = {reg_modExp_while_mul_cmp_b_ftd , reg_modExp_while_mul_cmp_b_ftd_1};
  assign and_134_cse = (fsm_output[3:2]==2'b11);
  assign or_56_cse = (fsm_output[1:0]!=2'b00);
  assign nor_56_cse = ~((fsm_output[4:3]!=2'b00));
  assign and_132_cse = (fsm_output[7]) & (fsm_output[5]);
  assign and_131_cse = (fsm_output[2:1]==2'b11);
  assign and_130_cse = (fsm_output[1:0]==2'b11);
  assign or_35_nl = (fsm_output[0]) | (fsm_output[1]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign nand_17_nl = ~((fsm_output[0]) & (fsm_output[1]) & (~ (fsm_output[3])) &
      (fsm_output[6]));
  assign mux_17_nl = MUX_s_1_2_2(or_35_nl, nand_17_nl, fsm_output[5]);
  assign reg_modExp_1_while_slc_modExp_while_mul_modExp_1_while_nor_cse = ~(mux_17_nl
      | (fsm_output[4]) | (~ (fsm_output[2])) | (fsm_output[7]));
  assign modExp_while_modExp_while_mux_rgt = MUX_v_129_2_2(({1'b0 , modExp_while_if_mul_cmp_z_oreg}),
      modExp_while_mul_cmp_z_oreg, and_dcpl_71);
  assign or_181_cse = (fsm_output[3:0]!=4'b0000);
  assign and_208_cse = (fsm_output[2:0]==3'b111);
  assign or_180_cse = (fsm_output[7]) | (fsm_output[5]);
  assign nl_COMP_LOOP_acc_2_cse_sva_mx0w0 = COPY_LOOP_i_10_0_sva_9_0 + conv_u2u_3_10(COMP_LOOP_k_3_0_sva_2_0)
      + conv_u2u_3_10({(STAGE_MAIN_LOOP_i_3_0_sva[3:2]) , (~ (STAGE_MAIN_LOOP_i_3_0_sva[1]))});
  assign COMP_LOOP_acc_2_cse_sva_mx0w0 = nl_COMP_LOOP_acc_2_cse_sva_mx0w0[9:0];
  assign operator_64_false_slc_modExp_exp_31_0_31_1_4 = MUX_v_31_2_2((operator_64_false_div_cmp_z[31:1]),
      ({1'b0 , (modExp_exp_31_0_sva_rsp_1[30:1])}), or_dcpl_24);
  assign nl_COMP_LOOP_acc_5_psp_1 = conv_u2u_64_65(result_rsci_q_d) + conv_u2u_64_65(factor2_sva);
  assign COMP_LOOP_acc_5_psp_1 = nl_COMP_LOOP_acc_5_psp_1[64:0];
  assign nl_COMP_LOOP_acc_12_psp_mx0w1 = ({1'b1 , factor1_sva}) + conv_u2s_64_65(~
      factor2_sva) + 65'b00000000000000000000000000000000000000000000000000000000000000001;
  assign COMP_LOOP_acc_12_psp_mx0w1 = nl_COMP_LOOP_acc_12_psp_mx0w1[64:0];
  assign nl_COMP_LOOP_k_3_0_sva_2 = conv_u2u_3_4(COMP_LOOP_k_3_0_sva_2_0) + 4'b0001;
  assign COMP_LOOP_k_3_0_sva_2 = nl_COMP_LOOP_k_3_0_sva_2[3:0];
  assign nl_STAGE_MAIN_LOOP_acc_nl = conv_u2s_4_5(z_out) + 5'b11111;
  assign STAGE_MAIN_LOOP_acc_nl = nl_STAGE_MAIN_LOOP_acc_nl[4:0];
  assign STAGE_MAIN_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_MAIN_LOOP_acc_nl);
  assign or_156_cse = and_134_cse | (fsm_output[4]);
  assign or_154_nl = (fsm_output[6:0]!=7'b0000000);
  assign nand_16_nl = ~((fsm_output[5]) & or_156_cse & (fsm_output[6]));
  assign not_tmp_23 = MUX_s_1_2_2(or_154_nl, nand_16_nl, fsm_output[7]);
  assign and_dcpl_8 = and_130_cse & nor_68_cse;
  assign and_dcpl_9 = ~((fsm_output[3:2]!=2'b00));
  assign and_dcpl_11 = nor_66_cse & and_dcpl_9;
  assign and_dcpl_12 = and_dcpl_11 & and_dcpl_8;
  assign or_tmp_12 = (fsm_output[4:2]!=3'b010);
  assign and_dcpl_17 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_18 = and_dcpl_17 & and_132_cse;
  assign and_dcpl_19 = (fsm_output[3:2]==2'b10);
  assign and_dcpl_20 = (fsm_output[6]) & (~ (fsm_output[4]));
  assign and_dcpl_21 = and_dcpl_20 & and_dcpl_19;
  assign and_dcpl_23 = (fsm_output[1:0]==2'b01);
  assign or_tmp_19 = (fsm_output[3:2]!=2'b10);
  assign or_tmp_20 = (fsm_output[3:2]!=2'b01);
  assign and_dcpl_31 = (fsm_output[5]) & (~ (fsm_output[7]));
  assign and_dcpl_32 = and_dcpl_23 & and_dcpl_31;
  assign and_dcpl_33 = (~ (fsm_output[6])) & (fsm_output[4]);
  assign and_dcpl_34 = and_dcpl_33 & and_dcpl_19;
  assign and_dcpl_36 = and_dcpl_17 & nor_68_cse;
  assign and_dcpl_38 = ~((fsm_output[1:0]!=2'b00));
  assign and_dcpl_40 = (fsm_output[3:2]==2'b01);
  assign and_dcpl_41 = and_dcpl_20 & and_dcpl_40;
  assign and_dcpl_43 = and_dcpl_38 & and_132_cse;
  assign and_dcpl_53 = (fsm_output[2:1]==2'b01);
  assign or_tmp_31 = (fsm_output[5]) | (or_181_cse & (fsm_output[4])) | (fsm_output[6]);
  assign or_tmp_32 = (~ (fsm_output[4])) | (fsm_output[6]);
  assign or_40_nl = (fsm_output[4]) | (~ (fsm_output[6]));
  assign mux_tmp_20 = MUX_s_1_2_2(or_40_nl, or_tmp_32, fsm_output[3]);
  assign and_dcpl_60 = and_dcpl_17 & and_dcpl_31;
  assign and_dcpl_61 = and_dcpl_34 & and_dcpl_60;
  assign or_tmp_37 = (~ (fsm_output[3])) | (~ (fsm_output[4])) | (fsm_output[6]);
  assign or_tmp_39 = (fsm_output[3]) | (fsm_output[4]) | (~ (fsm_output[6]));
  assign and_dcpl_63 = (~ (fsm_output[5])) & (fsm_output[7]);
  assign and_dcpl_65 = and_dcpl_33 & and_dcpl_9;
  assign and_dcpl_66 = and_dcpl_65 & and_dcpl_17 & and_dcpl_63;
  assign and_dcpl_70 = and_dcpl_33 & (fsm_output[3:2]==2'b11);
  assign and_dcpl_71 = and_dcpl_70 & and_dcpl_18;
  assign and_dcpl_73 = nor_66_cse & and_dcpl_19;
  assign and_dcpl_74 = and_dcpl_73 & and_dcpl_36;
  assign and_dcpl_75 = and_dcpl_33 & and_dcpl_40;
  assign and_dcpl_76 = and_dcpl_75 & and_dcpl_60;
  assign and_nl = (fsm_output[5]) & (fsm_output[2]) & (~ (fsm_output[4])) & (fsm_output[6]);
  assign nor_58_nl = ~((fsm_output[5]) | (fsm_output[2]) | (~ (fsm_output[4])) |
      (fsm_output[6]));
  assign mux_31_nl = MUX_s_1_2_2(and_nl, nor_58_nl, fsm_output[7]);
  assign and_dcpl_79 = mux_31_nl & (~ (fsm_output[3])) & (~ (fsm_output[1])) & (fsm_output[0]);
  assign and_dcpl_80 = and_dcpl_70 & and_dcpl_43;
  assign or_52_nl = (fsm_output[4:2]!=3'b101);
  assign mux_32_nl = MUX_s_1_2_2(or_tmp_12, or_52_nl, fsm_output[5]);
  assign and_dcpl_84 = ~(mux_32_nl | (fsm_output[6]) | (~ (fsm_output[1])) | (fsm_output[0])
      | (fsm_output[7]));
  assign and_dcpl_88 = and_dcpl_65 & and_dcpl_23 & and_dcpl_63;
  assign or_dcpl_8 = (fsm_output[1:0]!=2'b01);
  assign or_dcpl_11 = (fsm_output[6]) | (fsm_output[4]);
  assign nor_tmp_22 = (fsm_output[7:5]==3'b111);
  assign not_tmp_56 = ~((fsm_output[7:5]!=3'b000));
  assign or_78_nl = (fsm_output[4:3]!=2'b00);
  assign mux_tmp_46 = MUX_s_1_2_2(not_tmp_56, nor_tmp_22, or_78_nl);
  assign mux_tmp_47 = MUX_s_1_2_2(not_tmp_56, nor_tmp_22, fsm_output[4]);
  assign or_dcpl_24 = or_dcpl_11 | or_tmp_19 | (fsm_output[1:0]!=2'b10) | or_180_cse;
  assign and_dcpl_103 = and_dcpl_41 & and_dcpl_32;
  assign and_dcpl_105 = and_dcpl_41 & and_dcpl_60;
  assign or_dcpl_29 = (~ (fsm_output[5])) | (fsm_output[7]);
  assign or_dcpl_32 = or_tmp_32 | or_tmp_19;
  assign or_dcpl_33 = or_dcpl_32 | (fsm_output[1:0]!=2'b00) | or_dcpl_29;
  assign not_tmp_81 = ~((fsm_output[5]) & (and_208_cse | (fsm_output[4:3]!=2'b00))
      & (fsm_output[6]));
  assign or_20_nl = (fsm_output[4:2]!=3'b000);
  assign mux_8_nl = MUX_s_1_2_2(or_20_nl, or_tmp_12, fsm_output[1]);
  assign nand_19_nl = ~((fsm_output[4:1]==4'b1011));
  assign mux_9_nl = MUX_s_1_2_2(mux_8_nl, nand_19_nl, fsm_output[5]);
  assign COPY_LOOP_i_10_0_sva_9_0_mx0c1 = ~(mux_9_nl | (fsm_output[6]) | (fsm_output[0])
      | (fsm_output[7]));
  assign COPY_LOOP_i_10_0_sva_9_0_mx0c2 = and_dcpl_21 & and_dcpl_18;
  assign STAGE_MAIN_LOOP_i_3_0_sva_mx0c1 = and_dcpl_21 & and_130_cse & and_132_cse;
  assign exit_modExp_1_while_sva_mx0c0 = and_dcpl_73 & and_dcpl_8;
  assign nl_operator_64_false_acc_1_nl = ({1'b1 , (~ (operator_64_false_div_cmp_z[31:0]))})
      + 33'b000000000000000000000000000000001;
  assign operator_64_false_acc_1_nl = nl_operator_64_false_acc_1_nl[32:0];
  assign operator_64_false_acc_1_itm_32_1 = readslicef_33_1_32(operator_64_false_acc_1_nl);
  assign nor_59_nl = ~((~((or_56_cse & (fsm_output[3:2]==2'b11)) | (fsm_output[4])))
      | (fsm_output[6]));
  assign mux_18_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[4]);
  assign mux_19_nl = MUX_s_1_2_2(mux_18_nl, or_tmp_32, fsm_output[3]);
  assign mux_21_nl = MUX_s_1_2_2(mux_tmp_20, mux_19_nl, and_131_cse);
  assign mux_22_nl = MUX_s_1_2_2(nor_59_nl, mux_21_nl, fsm_output[5]);
  assign mux_23_ssc = MUX_s_1_2_2(mux_22_nl, (~ or_tmp_31), fsm_output[7]);
  assign mux_25_nl = MUX_s_1_2_2(or_tmp_39, or_tmp_37, fsm_output[2]);
  assign mux_24_nl = MUX_s_1_2_2(mux_tmp_20, or_tmp_37, fsm_output[2]);
  assign mux_26_nl = MUX_s_1_2_2(mux_25_nl, mux_24_nl, and_130_cse);
  assign mux_27_nl = MUX_s_1_2_2((~ (fsm_output[6])), mux_26_nl, fsm_output[5]);
  assign nor_69_ssc = ~(mux_27_nl | (fsm_output[7]));
  assign and_136_nl = (and_130_cse | (fsm_output[3:2]!=2'b00)) & (fsm_output[4]);
  assign nand_13_nl = ~((fsm_output[4:2]==3'b111));
  assign mux_28_nl = MUX_s_1_2_2(and_136_nl, nand_13_nl, fsm_output[5]);
  assign and_71_ssc = mux_28_nl & (fsm_output[7:6]==2'b10);
  assign mux_29_nl = MUX_s_1_2_2(or_tmp_39, mux_tmp_20, and_208_cse);
  assign mux_30_nl = MUX_s_1_2_2((fsm_output[6]), (~ mux_29_nl), fsm_output[5]);
  assign and_75_ssc = mux_30_nl & (fsm_output[7]);
  assign modExp_while_or_3_cse = reg_modExp_1_while_slc_modExp_while_mul_modExp_1_while_nor_cse
      | and_dcpl_71;
  assign modExp_while_or_cse = nor_69_ssc | and_71_ssc;
  assign vec_rsci_radr_d = COPY_LOOP_i_10_0_sva_9_0;
  assign vec_rsci_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_11 & and_dcpl_23 &
      nor_68_cse;
  assign mux_14_nl = MUX_s_1_2_2(or_tmp_20, or_tmp_19, fsm_output[7]);
  assign and_33_nl = (~ mux_14_nl) & (fsm_output[6]) & (~ (fsm_output[4])) & (~ (fsm_output[1]))
      & (~ (fsm_output[0])) & (fsm_output[5]);
  assign result_rsci_d_d = MUX_v_64_2_2(vec_rsci_q_d, (modExp_while_rem_cmp_z[63:0]),
      and_33_nl);
  assign and_38_nl = and_dcpl_34 & and_dcpl_32;
  assign result_rsci_radr_d = MUX_v_10_2_2(COMP_LOOP_acc_2_cse_sva_mx0w0, COMP_LOOP_acc_1_cse_sva,
      and_38_nl);
  assign and_40_nl = and_dcpl_11 & and_dcpl_36;
  assign and_45_nl = and_dcpl_41 & and_dcpl_38 & and_dcpl_31;
  assign and_47_nl = and_dcpl_21 & and_dcpl_43;
  assign result_rsci_wadr_d = MUX1HOT_v_10_3_2(COPY_LOOP_i_10_0_sva_9_0, COMP_LOOP_acc_1_cse_sva,
      COMP_LOOP_acc_2_cse_sva, {and_40_nl , and_45_nl , and_47_nl});
  assign or_162_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[6]);
  assign or_163_nl = (fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[3]) | (~
      (fsm_output[6]));
  assign mux_15_nl = MUX_s_1_2_2(or_162_nl, or_163_nl, fsm_output[5]);
  assign or_164_nl = (~ (fsm_output[5])) | (fsm_output[1]) | (fsm_output[2]) | (~((fsm_output[3])
      & (fsm_output[6])));
  assign mux_16_nl = MUX_s_1_2_2(mux_15_nl, or_164_nl, fsm_output[7]);
  assign result_rsci_we_d_pff = ~(mux_16_nl | (fsm_output[4]) | (fsm_output[0]));
  assign result_rsci_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_34 & (~ (fsm_output[1]))
      & (fsm_output[5]) & (~ (fsm_output[7]));
  assign and_dcpl = ~((fsm_output[7:6]!=2'b00));
  assign and_dcpl_119 = (fsm_output[5:0]==6'b111000) & and_dcpl;
  assign and_dcpl_124 = (fsm_output[5]) & (fsm_output[1]);
  assign and_dcpl_126 = and_dcpl_124 & (fsm_output[0]) & (~ (fsm_output[2])) & (fsm_output[3])
      & (~ (fsm_output[4])) & (fsm_output[6]) & (fsm_output[7]);
  assign and_dcpl_131 = and_dcpl_124 & (fsm_output[0]) & (fsm_output[2]) & (~ (fsm_output[3]))
      & (fsm_output[4]) & and_dcpl;
  assign and_dcpl_134 = nor_56_cse & and_dcpl;
  assign and_dcpl_135 = ~((fsm_output[5]) | (fsm_output[2]));
  assign and_dcpl_138 = (fsm_output[1:0]==2'b01) & and_dcpl_135 & and_dcpl_134;
  assign and_dcpl_141 = (fsm_output[5]) & (~ (fsm_output[2]));
  assign and_dcpl_144 = and_dcpl_38 & and_dcpl_141 & (fsm_output[4:3]==2'b11) & and_dcpl;
  assign and_dcpl_147 = and_dcpl_38 & (~ (fsm_output[5])) & (fsm_output[2]) & and_dcpl_134;
  assign and_dcpl_149 = (fsm_output[4:3]==2'b01);
  assign and_dcpl_153 = and_dcpl_17 & and_dcpl_141 & and_dcpl_149 & (fsm_output[7:6]==2'b11);
  assign and_dcpl_157 = (fsm_output[1:0]==2'b11) & and_dcpl_135 & and_dcpl_149 &
      and_dcpl;
  assign and_dcpl_162 = and_dcpl_17 & (fsm_output[5]) & (fsm_output[2]) & nor_56_cse
      & (fsm_output[7:6]==2'b01);
  assign and_dcpl_167 = and_dcpl_17 & and_dcpl_135 & (~ (fsm_output[3])) & (fsm_output[4])
      & (~ (fsm_output[6])) & (fsm_output[7]);
  assign or_183_tmp = and_dcpl_76 | and_dcpl_80;
  assign COPY_LOOP_nor_3_itm = ~(and_dcpl_138 | and_dcpl_157 | and_dcpl_162);
  always @(posedge clk) begin
    if ( ~ not_tmp_23 ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( ~ not_tmp_23 ) begin
      r_sva <= r_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_12 | COPY_LOOP_i_10_0_sva_9_0_mx0c1 | COPY_LOOP_i_10_0_sva_9_0_mx0c2
        ) begin
      COPY_LOOP_i_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, COPY_LOOP_i_mux_nl,
          COPY_LOOP_i_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_obj_ld_cse <= 1'b0;
      modExp_exp_1_0_sva <= 1'b0;
    end
    else begin
      reg_vec_rsc_triosy_obj_ld_cse <= and_dcpl_20 & (fsm_output[3]) & and_dcpl_53
          & (fsm_output[0]) & (fsm_output[5]) & (fsm_output[7]) & STAGE_MAIN_LOOP_acc_itm_4_1;
      modExp_exp_1_0_sva <= COMP_LOOP_mux1h_8_nl & (~ and_dcpl_88);
    end
  end
  always @(posedge clk) begin
    reg_modExp_while_rem_cmp_b_63_0_cse <= p_sva;
    modExp_while_mul_cmp_a <= MUX1HOT_v_64_4_2(r_sva, (modExp_while_rem_cmp_z[63:0]),
        ({32'b00000000000000000000000000000000 , (modExp_result_sva[31:0])}), modExp_1_result_sva,
        {and_dcpl_74 , r_or_cse , r_and_1_cse , and_dcpl_80});
    modExp_while_if_rem_cmp_a <= MUX_v_128_2_2(COMP_LOOP_mul_mut_127_0, modExp_while_if_mul_cmp_z_oreg,
        mux_38_nl);
    modExp_while_if_mul_cmp_a <= MUX1HOT_v_64_3_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
        modExp_result_sva, modExp_1_result_sva, {nor_77_nl , and_dcpl_76 , and_dcpl_88});
    modExp_while_if_mul_cmp_b <= MUX1HOT_v_64_3_2(r_sva, (modExp_while_rem_cmp_z[63:0]),
        ({32'b00000000000000000000000000000000 , (modExp_result_sva[31:0])}), {and_dcpl_74
        , r_or_cse , r_and_1_cse});
    operator_64_false_div_cmp_a <= MUX_v_64_2_2(z_out_1, factor1_sva, and_93_nl);
    operator_64_false_div_cmp_b_1 <= ~ (STAGE_MAIN_LOOP_i_3_0_sva[1]);
    operator_64_false_div_cmp_b_0 <= STAGE_MAIN_LOOP_i_3_0_sva[0];
    operator_64_false_div_cmp_b_3_2 <= STAGE_MAIN_LOOP_i_3_0_sva[3:2];
    reg_modExp_while_rem_cmp_a_ftd <= modExp_while_mux1h_nl & (~(reg_modExp_1_while_slc_modExp_while_mul_modExp_1_while_nor_cse
        | mux_23_ssc | and_dcpl_61 | nor_69_ssc));
    reg_modExp_while_rem_cmp_a_ftd_1 <= MUX_v_63_2_2(63'b000000000000000000000000000000000000000000000000000000000000000,
        modExp_while_mux1h_7_nl, modExp_while_nor_1_nl);
    reg_modExp_while_rem_cmp_a_2_ftd <= MUX1HOT_s_1_6_2((modExp_while_mul_cmp_z_oreg[64]),
        (modExp_1_while_slc_modExp_while_mul_cmp_z_oreg_127_0_psp[64]), (COMP_LOOP_acc_5_psp_1[64]),
        (COMP_LOOP_acc_12_psp[64]), (COMP_LOOP_acc_12_psp_mx0w1[64]), (COMP_LOOP_mul_mut_127_0[64]),
        {modExp_while_or_3_cse , mux_23_ssc , and_dcpl_61 , modExp_while_or_cse ,
        and_dcpl_66 , and_75_ssc});
    reg_modExp_while_rem_cmp_a_2_ftd_1 <= MUX1HOT_v_64_6_2((modExp_while_mul_cmp_z_oreg[63:0]),
        (modExp_1_while_slc_modExp_while_mul_cmp_z_oreg_127_0_psp[63:0]), (COMP_LOOP_acc_5_psp_1[63:0]),
        (COMP_LOOP_acc_12_psp[63:0]), (COMP_LOOP_acc_12_psp_mx0w1[63:0]), (COMP_LOOP_mul_mut_127_0[63:0]),
        {modExp_while_or_3_cse , mux_23_ssc , and_dcpl_61 , modExp_while_or_cse ,
        and_dcpl_66 , and_75_ssc});
    reg_modExp_while_mul_cmp_b_ftd <= (modExp_while_rem_cmp_z[64]) & (~(and_dcpl_84
        | and_dcpl_79));
    reg_modExp_while_mul_cmp_b_ftd_1 <= MUX1HOT_v_64_3_2(r_sva, ({32'b00000000000000000000000000000000
        , (modExp_result_sva[31:0])}), (modExp_while_rem_cmp_z[63:0]), {nor_108_nl
        , r_and_1_cse , or_184_nl});
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COPY_LOOP_i_10_0_sva_1 <= 11'b00000000000;
    end
    else if ( ~(or_dcpl_11 | (fsm_output[3:2]!=2'b00) | or_dcpl_8 | or_180_cse) )
        begin
      COPY_LOOP_i_10_0_sva_1 <= z_out_1[10:0];
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_12 | STAGE_MAIN_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_MAIN_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1010, z_out, STAGE_MAIN_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( (nor_66_cse & and_dcpl_40 & and_dcpl_38 & nor_68_cse) | and_dcpl_61 ) begin
      factor1_sva <= MUX_v_64_2_2(z_out_1, result_rsci_q_d, and_dcpl_61);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_52_nl, mux_tmp_46, fsm_output[2]) ) begin
      modExp_result_sva <= MUX_v_64_2_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
          modExp_while_if_rem_cmp_z, and_103_nl);
    end
  end
  always @(posedge clk) begin
    if ( operator_64_false_acc_1_itm_32_1 | (~ exit_modExp_1_while_sva) ) begin
      operator_64_false_slc_modExp_exp_31_0_31_1_1_itm <= operator_64_false_slc_modExp_exp_31_0_31_1_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_1_while_asn_2_itm <= 1'b0;
    end
    else if ( and_dcpl_84 | and_dcpl_103 | and_dcpl_88 ) begin
      modExp_1_while_asn_2_itm <= MUX1HOT_s_1_4_2((operator_64_false_div_cmp_z[0]),
          (modExp_exp_31_0_sva_rsp_1[0]), (COMP_LOOP_k_3_0_sva_2_0[0]), modExp_exp_1_0_sva,
          {(~ or_dcpl_24) , modExp_1_while_and_1_nl , and_dcpl_103 , and_dcpl_88});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_modExp_1_while_sva <= 1'b0;
    end
    else if ( exit_modExp_1_while_sva_mx0c0 | and_dcpl_105 | and_dcpl_66 ) begin
      exit_modExp_1_while_sva <= MUX1HOT_s_1_3_2((~ (z_out_1[31])), (~ (z_out_1[2])),
          (~ (z_out_1[4])), {exit_modExp_1_while_sva_mx0c0 , and_dcpl_105 , and_dcpl_66});
    end
  end
  always @(posedge clk) begin
    if ( reg_modExp_1_while_slc_modExp_while_mul_modExp_1_while_nor_cse ) begin
      modExp_1_while_slc_modExp_while_mul_cmp_z_oreg_127_0_psp <= modExp_while_mul_cmp_z_oreg[127:0];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_86_nl, nor_106_nl, fsm_output[6]) ) begin
      COMP_LOOP_mul_mut_128 <= modExp_while_modExp_while_mux_rgt[128];
    end
  end
  always @(posedge clk) begin
    if ( mux_89_nl & (fsm_output[2]) ) begin
      COMP_LOOP_mul_mut_127_0 <= modExp_while_modExp_while_mux_rgt[127:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_k_3_0_sva_2_0 <= 3'b000;
    end
    else if ( MUX_s_1_2_2((~ mux_93_nl), mux_90_nl, fsm_output[6]) ) begin
      COMP_LOOP_k_3_0_sva_2_0 <= MUX_v_3_2_2(3'b000, (COMP_LOOP_k_3_0_sva_2[2:0]),
          nand_21_nl);
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_33 ) begin
      COMP_LOOP_acc_2_cse_sva <= COMP_LOOP_acc_2_cse_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_33 ) begin
      operator_64_false_1_slc_operator_64_false_1_acc_3_1_itm <= z_out[3];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_33 ) begin
      COMP_LOOP_acc_1_cse_sva <= z_out_1[9:0];
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_32 | or_dcpl_8 | or_dcpl_29) ) begin
      factor2_sva <= result_rsci_q_d;
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_61 | and_dcpl_66 ) begin
      COMP_LOOP_acc_12_psp <= MUX_v_65_2_2(COMP_LOOP_acc_5_psp_1, COMP_LOOP_acc_12_psp_mx0w1,
          and_dcpl_66);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nand_20_nl, mux_81_nl, fsm_output[7]) ) begin
      modExp_1_result_sva <= MUX_v_64_2_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
          modExp_while_if_rem_cmp_z, and_117_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_1_sva <= 1'b0;
    end
    else if ( MUX_s_1_2_2(not_tmp_81, or_158_nl, fsm_output[7]) ) begin
      modExp_exp_1_1_sva <= MUX_s_1_2_2((COMP_LOOP_k_3_0_sva_2_0[1]), modExp_exp_1_0_sva,
          and_dcpl_105);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_31_0_sva_rsp_1 <= 31'b0000000000000000000000000000000;
    end
    else if ( mux_54_nl | (fsm_output[7:6]!=2'b00) ) begin
      modExp_exp_31_0_sva_rsp_1 <= operator_64_false_slc_modExp_exp_31_0_31_1_4;
    end
  end
  assign COPY_LOOP_i_mux_nl = MUX_v_10_2_2((COPY_LOOP_i_10_0_sva_1[9:0]), (z_out_1[9:0]),
      COPY_LOOP_i_10_0_sva_9_0_mx0c2);
  assign COPY_LOOP_i_not_nl = ~ COPY_LOOP_i_10_0_sva_9_0_mx0c1;
  assign mux_34_nl = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), or_56_cse);
  assign mux_35_nl = MUX_s_1_2_2((~ (fsm_output[7])), mux_34_nl, and_134_cse);
  assign mux_36_nl = MUX_s_1_2_2(mux_35_nl, (fsm_output[7]), fsm_output[4]);
  assign or_55_nl = (fsm_output[3]) | (fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]);
  assign mux_33_nl = MUX_s_1_2_2((fsm_output[7]), or_55_nl, fsm_output[4]);
  assign mux_37_nl = MUX_s_1_2_2(mux_36_nl, mux_33_nl, fsm_output[5]);
  assign nand_nl = ~((fsm_output[5]) & (~(nor_56_cse | (fsm_output[7]))));
  assign mux_38_nl = MUX_s_1_2_2(mux_37_nl, nand_nl, fsm_output[6]);
  assign or_160_nl = (fsm_output[0]) | (~ (fsm_output[1])) | (fsm_output[2]) | (~
      (fsm_output[3])) | (fsm_output[6]);
  assign or_161_nl = (~ (fsm_output[0])) | (fsm_output[1]) | (~ (fsm_output[2]))
      | (fsm_output[3]) | (~ (fsm_output[6]));
  assign mux_39_nl = MUX_s_1_2_2(or_160_nl, or_161_nl, fsm_output[5]);
  assign nor_77_nl = ~(mux_39_nl | (fsm_output[4]) | (fsm_output[7]));
  assign mux_42_nl = MUX_s_1_2_2(or_tmp_19, or_tmp_20, fsm_output[1]);
  assign mux_40_nl = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[2]);
  assign mux_41_nl = MUX_s_1_2_2(mux_40_nl, or_tmp_20, fsm_output[1]);
  assign mux_43_nl = MUX_s_1_2_2(mux_42_nl, mux_41_nl, fsm_output[0]);
  assign and_93_nl = (~ mux_43_nl) & nor_66_cse & nor_68_cse;
  assign mux_84_nl = MUX_s_1_2_2(not_tmp_81, or_tmp_31, fsm_output[7]);
  assign COMP_LOOP_mux1h_8_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_3_0_sva_2_0[2]), modExp_exp_1_1_sva,
      modExp_exp_1_0_sva, {and_dcpl_103 , and_dcpl_105 , (~ mux_84_nl)});
  assign modExp_while_mux1h_nl = MUX1HOT_s_1_4_2((COMP_LOOP_acc_12_psp_mx0w1[64]),
      (COMP_LOOP_acc_12_psp[64]), (modExp_while_mul_cmp_z_oreg[128]), COMP_LOOP_mul_mut_128,
      {and_dcpl_66 , and_71_ssc , and_dcpl_71 , and_75_ssc});
  assign modExp_while_mux1h_7_nl = MUX1HOT_v_63_5_2((modExp_while_mul_cmp_z_oreg[127:65]),
      (modExp_1_while_slc_modExp_while_mul_cmp_z_oreg_127_0_psp[127:65]), (signext_63_1(COMP_LOOP_acc_12_psp_mx0w1[64])),
      (signext_63_1(COMP_LOOP_acc_12_psp[64])), (COMP_LOOP_mul_mut_127_0[127:65]),
      {modExp_while_or_3_cse , mux_23_ssc , and_dcpl_66 , and_71_ssc , and_75_ssc});
  assign modExp_while_nor_1_nl = ~(and_dcpl_61 | nor_69_ssc);
  assign nor_108_nl = ~(and_dcpl_79 | or_183_tmp);
  assign or_184_nl = and_dcpl_88 | or_183_tmp;
  assign and_103_nl = and_dcpl_33 & (~ (fsm_output[3])) & and_dcpl_53 & (~ (fsm_output[0]))
      & modExp_1_while_asn_2_itm & and_dcpl_31;
  assign nor_51_nl = ~((fsm_output[7]) | (~(modExp_1_while_asn_2_itm & (fsm_output[5]))));
  assign mux_48_nl = MUX_s_1_2_2(nor_51_nl, and_132_cse, fsm_output[6]);
  assign mux_49_nl = MUX_s_1_2_2(not_tmp_56, mux_48_nl, fsm_output[4]);
  assign mux_50_nl = MUX_s_1_2_2(mux_49_nl, mux_tmp_47, fsm_output[3]);
  assign mux_51_nl = MUX_s_1_2_2(mux_50_nl, mux_tmp_46, fsm_output[0]);
  assign mux_52_nl = MUX_s_1_2_2(mux_tmp_47, mux_51_nl, fsm_output[1]);
  assign modExp_1_while_and_1_nl = or_dcpl_24 & and_dcpl_84;
  assign mux_85_nl = MUX_s_1_2_2(or_156_cse, (~ or_156_cse), fsm_output[7]);
  assign nand_23_nl = ~(or_181_cse & (fsm_output[4]));
  assign nor_105_nl = ~((fsm_output[4:0]!=5'b11110));
  assign mux_nl = MUX_s_1_2_2(nand_23_nl, nor_105_nl, fsm_output[7]);
  assign mux_86_nl = MUX_s_1_2_2(mux_85_nl, mux_nl, fsm_output[5]);
  assign nor_106_nl = ~((~ (fsm_output[5])) | (fsm_output[7]) | (~((fsm_output[3])
      | and_208_cse | (fsm_output[4]))));
  assign nor_102_nl = ~((~ (fsm_output[3])) | (fsm_output[6]) | (fsm_output[4]) |
      (fsm_output[1]) | (fsm_output[0]));
  assign nor_103_nl = ~((fsm_output[3]) | (~ (fsm_output[6])) | (fsm_output[4]) |
      (~((fsm_output[1:0]==2'b11))));
  assign mux_88_nl = MUX_s_1_2_2(nor_102_nl, nor_103_nl, fsm_output[5]);
  assign nor_104_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[3])) | (fsm_output[6])
      | (~ (fsm_output[4])) | (~ (fsm_output[1])) | (fsm_output[0]));
  assign mux_89_nl = MUX_s_1_2_2(mux_88_nl, nor_104_nl, fsm_output[7]);
  assign nand_21_nl = ~(and_dcpl_75 & and_130_cse & and_dcpl_31);
  assign nor_101_nl = ~((fsm_output[2:0]!=3'b010));
  assign mux_91_nl = MUX_s_1_2_2((fsm_output[7]), and_132_cse, nor_101_nl);
  assign mux_92_nl = MUX_s_1_2_2(mux_91_nl, or_180_cse, fsm_output[3]);
  assign mux_93_nl = MUX_s_1_2_2((fsm_output[7]), mux_92_nl, fsm_output[4]);
  assign and_206_nl = (fsm_output[3]) & ((fsm_output[2:1]!=2'b00)) & (fsm_output[7])
      & (fsm_output[5]);
  assign mux_90_nl = MUX_s_1_2_2(and_206_nl, and_132_cse, fsm_output[4]);
  assign and_117_nl = nor_66_cse & (fsm_output[3:0]==4'b1101) & modExp_1_while_asn_2_itm
      & and_dcpl_63;
  assign nand_20_nl = ~((fsm_output[5]) & (and_131_cse | (fsm_output[4:3]!=2'b00))
      & (fsm_output[6]));
  assign or_165_nl = (~((~ modExp_1_while_asn_2_itm) | (fsm_output[4:0]!=5'b01101)))
      | (fsm_output[6]);
  assign or_166_nl = ((fsm_output[4:2]==3'b111)) | (fsm_output[6]);
  assign mux_81_nl = MUX_s_1_2_2(or_165_nl, or_166_nl, fsm_output[5]);
  assign or_158_nl = (fsm_output[5]) | (((fsm_output[3:1]!=3'b000)) & (fsm_output[4]))
      | (fsm_output[6]);
  assign nor_75_nl = ~(((and_130_cse | (fsm_output[2])) & (fsm_output[3])) | (fsm_output[4]));
  assign and_149_nl = (and_131_cse | (fsm_output[3])) & (fsm_output[4]);
  assign mux_54_nl = MUX_s_1_2_2(nor_75_nl, and_149_nl, fsm_output[5]);
  assign operator_64_false_1_operator_64_false_1_or_1_nl = (STAGE_MAIN_LOOP_i_3_0_sva[3])
      | and_dcpl_119 | and_dcpl_131;
  assign operator_64_false_1_mux1h_2_nl = MUX1HOT_v_3_3_2((~ COMP_LOOP_k_3_0_sva_2_0),
      (STAGE_MAIN_LOOP_i_3_0_sva[2:0]), ({(~ (STAGE_MAIN_LOOP_i_3_0_sva[3:2])) ,
      (STAGE_MAIN_LOOP_i_3_0_sva[1])}), {and_dcpl_119 , and_dcpl_126 , and_dcpl_131});
  assign nl_z_out = ({operator_64_false_1_operator_64_false_1_or_1_nl , operator_64_false_1_mux1h_2_nl})
      + conv_s2u_2_4({and_dcpl_126 , 1'b1});
  assign z_out = nl_z_out[3:0];
  assign COPY_LOOP_or_5_nl = and_dcpl_138 | and_dcpl_144 | and_dcpl_153;
  assign COPY_LOOP_mux1h_4_nl = MUX1HOT_v_64_5_2(({54'b000000000000000000000000000000000000000000000000000000
      , COPY_LOOP_i_10_0_sva_9_0}), p_sva, ({33'b111111111111111111111111111111111
      , (~ operator_64_false_slc_modExp_exp_31_0_31_1_1_itm)}), ({62'b11111111111111111111111111111111111111111111111111111111111111
      , (~ modExp_exp_1_0_sva) , (~ modExp_exp_1_1_sva)}), ({61'b0000000000000000000000000000000000000000000000000000000000011
      , (~ (STAGE_MAIN_LOOP_i_3_0_sva[3:2])) , (STAGE_MAIN_LOOP_i_3_0_sva[1])}),
      {COPY_LOOP_or_5_nl , and_dcpl_147 , and_dcpl_157 , and_dcpl_162 , and_dcpl_167});
  assign COPY_LOOP_or_6_nl = (~(and_dcpl_138 | and_dcpl_144 | and_dcpl_147 | and_dcpl_153
      | and_dcpl_157 | and_dcpl_162)) | and_dcpl_167;
  assign COPY_LOOP_COPY_LOOP_or_2_nl = (~(and_dcpl_138 | and_dcpl_144 | and_dcpl_153
      | and_dcpl_157 | and_dcpl_162 | and_dcpl_167)) | and_dcpl_147;
  assign COPY_LOOP_mux_3_nl = MUX_s_1_2_2((STAGE_MAIN_LOOP_i_3_0_sva[3]), (COMP_LOOP_k_3_0_sva_2[3]),
      and_dcpl_167);
  assign COPY_LOOP_COPY_LOOP_or_3_nl = (COPY_LOOP_mux_3_nl & (~(and_dcpl_138 | and_dcpl_144
      | and_dcpl_157 | and_dcpl_162))) | and_dcpl_147;
  assign COPY_LOOP_mux1h_5_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_3_0_sva_2_0[2]), (STAGE_MAIN_LOOP_i_3_0_sva[2]),
      (COMP_LOOP_k_3_0_sva_2[2]), {and_dcpl_144 , and_dcpl_153 , and_dcpl_167});
  assign COPY_LOOP_or_7_nl = (COPY_LOOP_mux1h_5_nl & COPY_LOOP_nor_3_itm) | and_dcpl_147;
  assign COPY_LOOP_mux1h_6_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_3_0_sva_2_0[1]), (~
      (STAGE_MAIN_LOOP_i_3_0_sva[1])), (COMP_LOOP_k_3_0_sva_2[1]), {and_dcpl_144
      , and_dcpl_153 , and_dcpl_167});
  assign COPY_LOOP_or_8_nl = (COPY_LOOP_mux1h_6_nl & COPY_LOOP_nor_3_itm) | and_dcpl_147;
  assign COPY_LOOP_mux1h_7_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_3_0_sva_2_0[0]), (STAGE_MAIN_LOOP_i_3_0_sva[0]),
      (COMP_LOOP_k_3_0_sva_2[0]), {and_dcpl_144 , and_dcpl_153 , and_dcpl_167});
  assign COPY_LOOP_or_9_nl = COPY_LOOP_mux1h_7_nl | and_dcpl_138 | and_dcpl_147 |
      and_dcpl_157 | and_dcpl_162;
  assign nl_acc_1_nl = ({COPY_LOOP_mux1h_4_nl , COPY_LOOP_or_6_nl}) + conv_s2u_6_65({COPY_LOOP_COPY_LOOP_or_2_nl
      , COPY_LOOP_COPY_LOOP_or_3_nl , COPY_LOOP_or_7_nl , COPY_LOOP_or_8_nl , COPY_LOOP_or_9_nl
      , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[64:0];
  assign z_out_1 = readslicef_65_64_1(acc_1_nl);

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


  function automatic [62:0] MUX1HOT_v_63_5_2;
    input [62:0] input_4;
    input [62:0] input_3;
    input [62:0] input_2;
    input [62:0] input_1;
    input [62:0] input_0;
    input [4:0] sel;
    reg [62:0] result;
  begin
    result = input_0 & {63{sel[0]}};
    result = result | ( input_1 & {63{sel[1]}});
    result = result | ( input_2 & {63{sel[2]}});
    result = result | ( input_3 & {63{sel[3]}});
    result = result | ( input_4 & {63{sel[4]}});
    MUX1HOT_v_63_5_2 = result;
  end
  endfunction


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


  function automatic [63:0] MUX1HOT_v_64_4_2;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [3:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    result = result | ( input_3 & {64{sel[3]}});
    MUX1HOT_v_64_4_2 = result;
  end
  endfunction


  function automatic [63:0] MUX1HOT_v_64_5_2;
    input [63:0] input_4;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [4:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    result = result | ( input_3 & {64{sel[3]}});
    result = result | ( input_4 & {64{sel[4]}});
    MUX1HOT_v_64_5_2 = result;
  end
  endfunction


  function automatic [63:0] MUX1HOT_v_64_6_2;
    input [63:0] input_5;
    input [63:0] input_4;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [5:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    result = result | ( input_3 & {64{sel[3]}});
    result = result | ( input_4 & {64{sel[4]}});
    result = result | ( input_5 & {64{sel[5]}});
    MUX1HOT_v_64_6_2 = result;
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


  function automatic [127:0] MUX_v_128_2_2;
    input [127:0] input_0;
    input [127:0] input_1;
    input [0:0] sel;
    reg [127:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_128_2_2 = result;
  end
  endfunction


  function automatic [128:0] MUX_v_129_2_2;
    input [128:0] input_0;
    input [128:0] input_1;
    input [0:0] sel;
    reg [128:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_129_2_2 = result;
  end
  endfunction


  function automatic [30:0] MUX_v_31_2_2;
    input [30:0] input_0;
    input [30:0] input_1;
    input [0:0] sel;
    reg [30:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_31_2_2 = result;
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


  function automatic [62:0] MUX_v_63_2_2;
    input [62:0] input_0;
    input [62:0] input_1;
    input [0:0] sel;
    reg [62:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_63_2_2 = result;
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


  function automatic [64:0] MUX_v_65_2_2;
    input [64:0] input_0;
    input [64:0] input_1;
    input [0:0] sel;
    reg [64:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_65_2_2 = result;
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


  function automatic [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
  end
  endfunction


  function automatic [63:0] readslicef_65_64_1;
    input [64:0] vector;
    reg [64:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_65_64_1 = tmp[63:0];
  end
  endfunction


  function automatic [62:0] signext_63_1;
    input [0:0] vector;
  begin
    signext_63_1= {{62{vector[0]}}, vector};
  end
  endfunction


  function automatic [3:0] conv_s2u_2_4 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_4 = {{2{vector[1]}}, vector};
  end
  endfunction


  function automatic [64:0] conv_s2u_6_65 ;
    input [5:0]  vector ;
  begin
    conv_s2u_6_65 = {{59{vector[5]}}, vector};
  end
  endfunction


  function automatic [4:0] conv_u2s_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_5 =  {1'b0, vector};
  end
  endfunction


  function automatic [64:0] conv_u2s_64_65 ;
    input [63:0]  vector ;
  begin
    conv_u2s_64_65 =  {1'b0, vector};
  end
  endfunction


  function automatic [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_3_10 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_10 = {{7{1'b0}}, vector};
  end
  endfunction


  function automatic [64:0] conv_u2u_64_65 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_65 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF
// ------------------------------------------------------------------


module inPlaceNTT_DIF (
  clk, rst, vec_rsc_radr, vec_rsc_q, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_dat, r_rsc_triosy_lz, result_rsc_wadr, result_rsc_d, result_rsc_we, result_rsc_radr,
      result_rsc_q, result_rsc_triosy_lz
);
  input clk;
  input rst;
  output [9:0] vec_rsc_radr;
  input [63:0] vec_rsc_q;
  output vec_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [9:0] result_rsc_wadr;
  output [63:0] result_rsc_d;
  output result_rsc_we;
  output [9:0] result_rsc_radr;
  input [63:0] result_rsc_q;
  output result_rsc_triosy_lz;


  // Interconnect Declarations
  wire [63:0] vec_rsci_q_d;
  wire [9:0] vec_rsci_radr_d;
  wire vec_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] result_rsci_d_d;
  wire [63:0] result_rsci_q_d;
  wire [9:0] result_rsci_radr_d;
  wire [9:0] result_rsci_wadr_d;
  wire result_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] modExp_while_mul_cmp_a;
  wire [64:0] modExp_while_mul_cmp_b;
  wire [63:0] modExp_while_if_mul_cmp_a;
  wire [63:0] modExp_while_if_mul_cmp_b;
  wire result_rsci_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [128:0] nl_inPlaceNTT_DIF_core_inst_modExp_while_mul_cmp_z;
  assign nl_inPlaceNTT_DIF_core_inst_modExp_while_mul_cmp_z = conv_u2u_130_129($signed(conv_u2s_64_65(modExp_while_mul_cmp_a))
      * $signed(modExp_while_mul_cmp_b));
  wire [127:0] nl_inPlaceNTT_DIF_core_inst_modExp_while_if_mul_cmp_z;
  assign nl_inPlaceNTT_DIF_core_inst_modExp_while_if_mul_cmp_z = conv_u2u_128_128(modExp_while_if_mul_cmp_a
      * modExp_while_if_mul_cmp_b);
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen vec_rsci
      (
      .q(vec_rsc_q),
      .radr(vec_rsc_radr),
      .q_d(vec_rsci_q_d),
      .radr_d(vec_rsci_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen result_rsci
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
  inPlaceNTT_DIF_core inPlaceNTT_DIF_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_dat(r_rsc_dat),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .result_rsc_triosy_lz(result_rsc_triosy_lz),
      .vec_rsci_q_d(vec_rsci_q_d),
      .vec_rsci_radr_d(vec_rsci_radr_d),
      .vec_rsci_readA_r_ram_ir_internal_RMASK_B_d(vec_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .result_rsci_d_d(result_rsci_d_d),
      .result_rsci_q_d(result_rsci_q_d),
      .result_rsci_radr_d(result_rsci_radr_d),
      .result_rsci_wadr_d(result_rsci_wadr_d),
      .result_rsci_readA_r_ram_ir_internal_RMASK_B_d(result_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .modExp_while_mul_cmp_a(modExp_while_mul_cmp_a),
      .modExp_while_mul_cmp_b(modExp_while_mul_cmp_b),
      .modExp_while_mul_cmp_z(nl_inPlaceNTT_DIF_core_inst_modExp_while_mul_cmp_z[128:0]),
      .modExp_while_if_mul_cmp_a(modExp_while_if_mul_cmp_a),
      .modExp_while_if_mul_cmp_b(modExp_while_if_mul_cmp_b),
      .modExp_while_if_mul_cmp_z(nl_inPlaceNTT_DIF_core_inst_modExp_while_if_mul_cmp_z[127:0]),
      .result_rsci_we_d_pff(result_rsci_we_d_iff)
    );

  function automatic [64:0] conv_u2s_64_65 ;
    input [63:0]  vector ;
  begin
    conv_u2s_64_65 =  {1'b0, vector};
  end
  endfunction


  function automatic [127:0] conv_u2u_128_128 ;
    input [127:0]  vector ;
  begin
    conv_u2u_128_128 = vector;
  end
  endfunction


  function automatic [128:0] conv_u2u_130_129 ;
    input [129:0]  vector ;
  begin
    conv_u2u_130_129 = vector[128:0];
  end
  endfunction

endmodule



