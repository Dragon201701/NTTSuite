
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
//  Generated date: Mon May 17 21:38:19 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    (
  qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [63:0] qa;
  output wea;
  output [63:0] da;
  output [10:0] adra;
  input [10:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input wea_d;
  input rwA_rw_ram_ir_internal_RMASK_B_d;
  input rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d);
  assign da = (da_d);
  assign adra = (adra_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    (
  qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [63:0] qa;
  output wea;
  output [63:0] da;
  output [10:0] adra;
  input [10:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input wea_d;
  input rwA_rw_ram_ir_internal_RMASK_B_d;
  input rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d);
  assign da = (da_d);
  assign adra = (adra_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIT_core_core_fsm (
  clk, rst, fsm_output, STAGE_LOOP_C_5_tr0, modExp_while_C_24_tr0, COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_24_tr0, COMP_LOOP_C_40_tr0, COMP_LOOP_2_modExp_1_while_C_24_tr0,
      COMP_LOOP_C_80_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_6_tr0
);
  input clk;
  input rst;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input STAGE_LOOP_C_5_tr0;
  input modExp_while_C_24_tr0;
  input COMP_LOOP_C_1_tr0;
  input COMP_LOOP_1_modExp_1_while_C_24_tr0;
  input COMP_LOOP_C_40_tr0;
  input COMP_LOOP_2_modExp_1_while_C_24_tr0;
  input COMP_LOOP_C_80_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_6_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  parameter
    main_C_0 = 8'd0,
    STAGE_LOOP_C_0 = 8'd1,
    STAGE_LOOP_C_1 = 8'd2,
    STAGE_LOOP_C_2 = 8'd3,
    STAGE_LOOP_C_3 = 8'd4,
    STAGE_LOOP_C_4 = 8'd5,
    STAGE_LOOP_C_5 = 8'd6,
    modExp_while_C_0 = 8'd7,
    modExp_while_C_1 = 8'd8,
    modExp_while_C_2 = 8'd9,
    modExp_while_C_3 = 8'd10,
    modExp_while_C_4 = 8'd11,
    modExp_while_C_5 = 8'd12,
    modExp_while_C_6 = 8'd13,
    modExp_while_C_7 = 8'd14,
    modExp_while_C_8 = 8'd15,
    modExp_while_C_9 = 8'd16,
    modExp_while_C_10 = 8'd17,
    modExp_while_C_11 = 8'd18,
    modExp_while_C_12 = 8'd19,
    modExp_while_C_13 = 8'd20,
    modExp_while_C_14 = 8'd21,
    modExp_while_C_15 = 8'd22,
    modExp_while_C_16 = 8'd23,
    modExp_while_C_17 = 8'd24,
    modExp_while_C_18 = 8'd25,
    modExp_while_C_19 = 8'd26,
    modExp_while_C_20 = 8'd27,
    modExp_while_C_21 = 8'd28,
    modExp_while_C_22 = 8'd29,
    modExp_while_C_23 = 8'd30,
    modExp_while_C_24 = 8'd31,
    COMP_LOOP_C_0 = 8'd32,
    COMP_LOOP_C_1 = 8'd33,
    COMP_LOOP_1_modExp_1_while_C_0 = 8'd34,
    COMP_LOOP_1_modExp_1_while_C_1 = 8'd35,
    COMP_LOOP_1_modExp_1_while_C_2 = 8'd36,
    COMP_LOOP_1_modExp_1_while_C_3 = 8'd37,
    COMP_LOOP_1_modExp_1_while_C_4 = 8'd38,
    COMP_LOOP_1_modExp_1_while_C_5 = 8'd39,
    COMP_LOOP_1_modExp_1_while_C_6 = 8'd40,
    COMP_LOOP_1_modExp_1_while_C_7 = 8'd41,
    COMP_LOOP_1_modExp_1_while_C_8 = 8'd42,
    COMP_LOOP_1_modExp_1_while_C_9 = 8'd43,
    COMP_LOOP_1_modExp_1_while_C_10 = 8'd44,
    COMP_LOOP_1_modExp_1_while_C_11 = 8'd45,
    COMP_LOOP_1_modExp_1_while_C_12 = 8'd46,
    COMP_LOOP_1_modExp_1_while_C_13 = 8'd47,
    COMP_LOOP_1_modExp_1_while_C_14 = 8'd48,
    COMP_LOOP_1_modExp_1_while_C_15 = 8'd49,
    COMP_LOOP_1_modExp_1_while_C_16 = 8'd50,
    COMP_LOOP_1_modExp_1_while_C_17 = 8'd51,
    COMP_LOOP_1_modExp_1_while_C_18 = 8'd52,
    COMP_LOOP_1_modExp_1_while_C_19 = 8'd53,
    COMP_LOOP_1_modExp_1_while_C_20 = 8'd54,
    COMP_LOOP_1_modExp_1_while_C_21 = 8'd55,
    COMP_LOOP_1_modExp_1_while_C_22 = 8'd56,
    COMP_LOOP_1_modExp_1_while_C_23 = 8'd57,
    COMP_LOOP_1_modExp_1_while_C_24 = 8'd58,
    COMP_LOOP_C_2 = 8'd59,
    COMP_LOOP_C_3 = 8'd60,
    COMP_LOOP_C_4 = 8'd61,
    COMP_LOOP_C_5 = 8'd62,
    COMP_LOOP_C_6 = 8'd63,
    COMP_LOOP_C_7 = 8'd64,
    COMP_LOOP_C_8 = 8'd65,
    COMP_LOOP_C_9 = 8'd66,
    COMP_LOOP_C_10 = 8'd67,
    COMP_LOOP_C_11 = 8'd68,
    COMP_LOOP_C_12 = 8'd69,
    COMP_LOOP_C_13 = 8'd70,
    COMP_LOOP_C_14 = 8'd71,
    COMP_LOOP_C_15 = 8'd72,
    COMP_LOOP_C_16 = 8'd73,
    COMP_LOOP_C_17 = 8'd74,
    COMP_LOOP_C_18 = 8'd75,
    COMP_LOOP_C_19 = 8'd76,
    COMP_LOOP_C_20 = 8'd77,
    COMP_LOOP_C_21 = 8'd78,
    COMP_LOOP_C_22 = 8'd79,
    COMP_LOOP_C_23 = 8'd80,
    COMP_LOOP_C_24 = 8'd81,
    COMP_LOOP_C_25 = 8'd82,
    COMP_LOOP_C_26 = 8'd83,
    COMP_LOOP_C_27 = 8'd84,
    COMP_LOOP_C_28 = 8'd85,
    COMP_LOOP_C_29 = 8'd86,
    COMP_LOOP_C_30 = 8'd87,
    COMP_LOOP_C_31 = 8'd88,
    COMP_LOOP_C_32 = 8'd89,
    COMP_LOOP_C_33 = 8'd90,
    COMP_LOOP_C_34 = 8'd91,
    COMP_LOOP_C_35 = 8'd92,
    COMP_LOOP_C_36 = 8'd93,
    COMP_LOOP_C_37 = 8'd94,
    COMP_LOOP_C_38 = 8'd95,
    COMP_LOOP_C_39 = 8'd96,
    COMP_LOOP_C_40 = 8'd97,
    COMP_LOOP_C_41 = 8'd98,
    COMP_LOOP_2_modExp_1_while_C_0 = 8'd99,
    COMP_LOOP_2_modExp_1_while_C_1 = 8'd100,
    COMP_LOOP_2_modExp_1_while_C_2 = 8'd101,
    COMP_LOOP_2_modExp_1_while_C_3 = 8'd102,
    COMP_LOOP_2_modExp_1_while_C_4 = 8'd103,
    COMP_LOOP_2_modExp_1_while_C_5 = 8'd104,
    COMP_LOOP_2_modExp_1_while_C_6 = 8'd105,
    COMP_LOOP_2_modExp_1_while_C_7 = 8'd106,
    COMP_LOOP_2_modExp_1_while_C_8 = 8'd107,
    COMP_LOOP_2_modExp_1_while_C_9 = 8'd108,
    COMP_LOOP_2_modExp_1_while_C_10 = 8'd109,
    COMP_LOOP_2_modExp_1_while_C_11 = 8'd110,
    COMP_LOOP_2_modExp_1_while_C_12 = 8'd111,
    COMP_LOOP_2_modExp_1_while_C_13 = 8'd112,
    COMP_LOOP_2_modExp_1_while_C_14 = 8'd113,
    COMP_LOOP_2_modExp_1_while_C_15 = 8'd114,
    COMP_LOOP_2_modExp_1_while_C_16 = 8'd115,
    COMP_LOOP_2_modExp_1_while_C_17 = 8'd116,
    COMP_LOOP_2_modExp_1_while_C_18 = 8'd117,
    COMP_LOOP_2_modExp_1_while_C_19 = 8'd118,
    COMP_LOOP_2_modExp_1_while_C_20 = 8'd119,
    COMP_LOOP_2_modExp_1_while_C_21 = 8'd120,
    COMP_LOOP_2_modExp_1_while_C_22 = 8'd121,
    COMP_LOOP_2_modExp_1_while_C_23 = 8'd122,
    COMP_LOOP_2_modExp_1_while_C_24 = 8'd123,
    COMP_LOOP_C_42 = 8'd124,
    COMP_LOOP_C_43 = 8'd125,
    COMP_LOOP_C_44 = 8'd126,
    COMP_LOOP_C_45 = 8'd127,
    COMP_LOOP_C_46 = 8'd128,
    COMP_LOOP_C_47 = 8'd129,
    COMP_LOOP_C_48 = 8'd130,
    COMP_LOOP_C_49 = 8'd131,
    COMP_LOOP_C_50 = 8'd132,
    COMP_LOOP_C_51 = 8'd133,
    COMP_LOOP_C_52 = 8'd134,
    COMP_LOOP_C_53 = 8'd135,
    COMP_LOOP_C_54 = 8'd136,
    COMP_LOOP_C_55 = 8'd137,
    COMP_LOOP_C_56 = 8'd138,
    COMP_LOOP_C_57 = 8'd139,
    COMP_LOOP_C_58 = 8'd140,
    COMP_LOOP_C_59 = 8'd141,
    COMP_LOOP_C_60 = 8'd142,
    COMP_LOOP_C_61 = 8'd143,
    COMP_LOOP_C_62 = 8'd144,
    COMP_LOOP_C_63 = 8'd145,
    COMP_LOOP_C_64 = 8'd146,
    COMP_LOOP_C_65 = 8'd147,
    COMP_LOOP_C_66 = 8'd148,
    COMP_LOOP_C_67 = 8'd149,
    COMP_LOOP_C_68 = 8'd150,
    COMP_LOOP_C_69 = 8'd151,
    COMP_LOOP_C_70 = 8'd152,
    COMP_LOOP_C_71 = 8'd153,
    COMP_LOOP_C_72 = 8'd154,
    COMP_LOOP_C_73 = 8'd155,
    COMP_LOOP_C_74 = 8'd156,
    COMP_LOOP_C_75 = 8'd157,
    COMP_LOOP_C_76 = 8'd158,
    COMP_LOOP_C_77 = 8'd159,
    COMP_LOOP_C_78 = 8'd160,
    COMP_LOOP_C_79 = 8'd161,
    COMP_LOOP_C_80 = 8'd162,
    VEC_LOOP_C_0 = 8'd163,
    STAGE_LOOP_C_6 = 8'd164,
    main_C_1 = 8'd165;

  reg [7:0] state_var;
  reg [7:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIT_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 8'b00000001;
        state_var_NS = STAGE_LOOP_C_1;
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 8'b00000010;
        state_var_NS = STAGE_LOOP_C_2;
      end
      STAGE_LOOP_C_2 : begin
        fsm_output = 8'b00000011;
        state_var_NS = STAGE_LOOP_C_3;
      end
      STAGE_LOOP_C_3 : begin
        fsm_output = 8'b00000100;
        state_var_NS = STAGE_LOOP_C_4;
      end
      STAGE_LOOP_C_4 : begin
        fsm_output = 8'b00000101;
        state_var_NS = STAGE_LOOP_C_5;
      end
      STAGE_LOOP_C_5 : begin
        fsm_output = 8'b00000110;
        if ( STAGE_LOOP_C_5_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      modExp_while_C_0 : begin
        fsm_output = 8'b00000111;
        state_var_NS = modExp_while_C_1;
      end
      modExp_while_C_1 : begin
        fsm_output = 8'b00001000;
        state_var_NS = modExp_while_C_2;
      end
      modExp_while_C_2 : begin
        fsm_output = 8'b00001001;
        state_var_NS = modExp_while_C_3;
      end
      modExp_while_C_3 : begin
        fsm_output = 8'b00001010;
        state_var_NS = modExp_while_C_4;
      end
      modExp_while_C_4 : begin
        fsm_output = 8'b00001011;
        state_var_NS = modExp_while_C_5;
      end
      modExp_while_C_5 : begin
        fsm_output = 8'b00001100;
        state_var_NS = modExp_while_C_6;
      end
      modExp_while_C_6 : begin
        fsm_output = 8'b00001101;
        state_var_NS = modExp_while_C_7;
      end
      modExp_while_C_7 : begin
        fsm_output = 8'b00001110;
        state_var_NS = modExp_while_C_8;
      end
      modExp_while_C_8 : begin
        fsm_output = 8'b00001111;
        state_var_NS = modExp_while_C_9;
      end
      modExp_while_C_9 : begin
        fsm_output = 8'b00010000;
        state_var_NS = modExp_while_C_10;
      end
      modExp_while_C_10 : begin
        fsm_output = 8'b00010001;
        state_var_NS = modExp_while_C_11;
      end
      modExp_while_C_11 : begin
        fsm_output = 8'b00010010;
        state_var_NS = modExp_while_C_12;
      end
      modExp_while_C_12 : begin
        fsm_output = 8'b00010011;
        state_var_NS = modExp_while_C_13;
      end
      modExp_while_C_13 : begin
        fsm_output = 8'b00010100;
        state_var_NS = modExp_while_C_14;
      end
      modExp_while_C_14 : begin
        fsm_output = 8'b00010101;
        state_var_NS = modExp_while_C_15;
      end
      modExp_while_C_15 : begin
        fsm_output = 8'b00010110;
        state_var_NS = modExp_while_C_16;
      end
      modExp_while_C_16 : begin
        fsm_output = 8'b00010111;
        state_var_NS = modExp_while_C_17;
      end
      modExp_while_C_17 : begin
        fsm_output = 8'b00011000;
        state_var_NS = modExp_while_C_18;
      end
      modExp_while_C_18 : begin
        fsm_output = 8'b00011001;
        state_var_NS = modExp_while_C_19;
      end
      modExp_while_C_19 : begin
        fsm_output = 8'b00011010;
        state_var_NS = modExp_while_C_20;
      end
      modExp_while_C_20 : begin
        fsm_output = 8'b00011011;
        state_var_NS = modExp_while_C_21;
      end
      modExp_while_C_21 : begin
        fsm_output = 8'b00011100;
        state_var_NS = modExp_while_C_22;
      end
      modExp_while_C_22 : begin
        fsm_output = 8'b00011101;
        state_var_NS = modExp_while_C_23;
      end
      modExp_while_C_23 : begin
        fsm_output = 8'b00011110;
        state_var_NS = modExp_while_C_24;
      end
      modExp_while_C_24 : begin
        fsm_output = 8'b00011111;
        if ( modExp_while_C_24_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 8'b00100000;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 8'b00100001;
        if ( COMP_LOOP_C_1_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_1_modExp_1_while_C_0 : begin
        fsm_output = 8'b00100010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_1;
      end
      COMP_LOOP_1_modExp_1_while_C_1 : begin
        fsm_output = 8'b00100011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_2;
      end
      COMP_LOOP_1_modExp_1_while_C_2 : begin
        fsm_output = 8'b00100100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_3;
      end
      COMP_LOOP_1_modExp_1_while_C_3 : begin
        fsm_output = 8'b00100101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_4;
      end
      COMP_LOOP_1_modExp_1_while_C_4 : begin
        fsm_output = 8'b00100110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_5;
      end
      COMP_LOOP_1_modExp_1_while_C_5 : begin
        fsm_output = 8'b00100111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_6;
      end
      COMP_LOOP_1_modExp_1_while_C_6 : begin
        fsm_output = 8'b00101000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_7;
      end
      COMP_LOOP_1_modExp_1_while_C_7 : begin
        fsm_output = 8'b00101001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_8;
      end
      COMP_LOOP_1_modExp_1_while_C_8 : begin
        fsm_output = 8'b00101010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_9;
      end
      COMP_LOOP_1_modExp_1_while_C_9 : begin
        fsm_output = 8'b00101011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_10;
      end
      COMP_LOOP_1_modExp_1_while_C_10 : begin
        fsm_output = 8'b00101100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_11;
      end
      COMP_LOOP_1_modExp_1_while_C_11 : begin
        fsm_output = 8'b00101101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_12;
      end
      COMP_LOOP_1_modExp_1_while_C_12 : begin
        fsm_output = 8'b00101110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_13;
      end
      COMP_LOOP_1_modExp_1_while_C_13 : begin
        fsm_output = 8'b00101111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_14;
      end
      COMP_LOOP_1_modExp_1_while_C_14 : begin
        fsm_output = 8'b00110000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_15;
      end
      COMP_LOOP_1_modExp_1_while_C_15 : begin
        fsm_output = 8'b00110001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_16;
      end
      COMP_LOOP_1_modExp_1_while_C_16 : begin
        fsm_output = 8'b00110010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_17;
      end
      COMP_LOOP_1_modExp_1_while_C_17 : begin
        fsm_output = 8'b00110011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_18;
      end
      COMP_LOOP_1_modExp_1_while_C_18 : begin
        fsm_output = 8'b00110100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_19;
      end
      COMP_LOOP_1_modExp_1_while_C_19 : begin
        fsm_output = 8'b00110101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_20;
      end
      COMP_LOOP_1_modExp_1_while_C_20 : begin
        fsm_output = 8'b00110110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_21;
      end
      COMP_LOOP_1_modExp_1_while_C_21 : begin
        fsm_output = 8'b00110111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_22;
      end
      COMP_LOOP_1_modExp_1_while_C_22 : begin
        fsm_output = 8'b00111000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_23;
      end
      COMP_LOOP_1_modExp_1_while_C_23 : begin
        fsm_output = 8'b00111001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_24;
      end
      COMP_LOOP_1_modExp_1_while_C_24 : begin
        fsm_output = 8'b00111010;
        if ( COMP_LOOP_1_modExp_1_while_C_24_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 8'b00111011;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 8'b00111100;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 8'b00111101;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 8'b00111110;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 8'b00111111;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 8'b01000000;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 8'b01000001;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 8'b01000010;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 8'b01000011;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 8'b01000100;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 8'b01000101;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 8'b01000110;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 8'b01000111;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 8'b01001000;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 8'b01001001;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 8'b01001010;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 8'b01001011;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 8'b01001100;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 8'b01001101;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 8'b01001110;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 8'b01001111;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 8'b01010000;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 8'b01010001;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 8'b01010010;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 8'b01010011;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 8'b01010100;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 8'b01010101;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 8'b01010110;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 8'b01010111;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 8'b01011000;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 8'b01011001;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 8'b01011010;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 8'b01011011;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 8'b01011100;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 8'b01011101;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 8'b01011110;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 8'b01011111;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 8'b01100000;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 8'b01100001;
        if ( COMP_LOOP_C_40_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_41;
        end
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 8'b01100010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
      end
      COMP_LOOP_2_modExp_1_while_C_0 : begin
        fsm_output = 8'b01100011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_1;
      end
      COMP_LOOP_2_modExp_1_while_C_1 : begin
        fsm_output = 8'b01100100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_2;
      end
      COMP_LOOP_2_modExp_1_while_C_2 : begin
        fsm_output = 8'b01100101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_3;
      end
      COMP_LOOP_2_modExp_1_while_C_3 : begin
        fsm_output = 8'b01100110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_4;
      end
      COMP_LOOP_2_modExp_1_while_C_4 : begin
        fsm_output = 8'b01100111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_5;
      end
      COMP_LOOP_2_modExp_1_while_C_5 : begin
        fsm_output = 8'b01101000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_6;
      end
      COMP_LOOP_2_modExp_1_while_C_6 : begin
        fsm_output = 8'b01101001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_7;
      end
      COMP_LOOP_2_modExp_1_while_C_7 : begin
        fsm_output = 8'b01101010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_8;
      end
      COMP_LOOP_2_modExp_1_while_C_8 : begin
        fsm_output = 8'b01101011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_9;
      end
      COMP_LOOP_2_modExp_1_while_C_9 : begin
        fsm_output = 8'b01101100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_10;
      end
      COMP_LOOP_2_modExp_1_while_C_10 : begin
        fsm_output = 8'b01101101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_11;
      end
      COMP_LOOP_2_modExp_1_while_C_11 : begin
        fsm_output = 8'b01101110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_12;
      end
      COMP_LOOP_2_modExp_1_while_C_12 : begin
        fsm_output = 8'b01101111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_13;
      end
      COMP_LOOP_2_modExp_1_while_C_13 : begin
        fsm_output = 8'b01110000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_14;
      end
      COMP_LOOP_2_modExp_1_while_C_14 : begin
        fsm_output = 8'b01110001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_15;
      end
      COMP_LOOP_2_modExp_1_while_C_15 : begin
        fsm_output = 8'b01110010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_16;
      end
      COMP_LOOP_2_modExp_1_while_C_16 : begin
        fsm_output = 8'b01110011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_17;
      end
      COMP_LOOP_2_modExp_1_while_C_17 : begin
        fsm_output = 8'b01110100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_18;
      end
      COMP_LOOP_2_modExp_1_while_C_18 : begin
        fsm_output = 8'b01110101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_19;
      end
      COMP_LOOP_2_modExp_1_while_C_19 : begin
        fsm_output = 8'b01110110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_20;
      end
      COMP_LOOP_2_modExp_1_while_C_20 : begin
        fsm_output = 8'b01110111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_21;
      end
      COMP_LOOP_2_modExp_1_while_C_21 : begin
        fsm_output = 8'b01111000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_22;
      end
      COMP_LOOP_2_modExp_1_while_C_22 : begin
        fsm_output = 8'b01111001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_23;
      end
      COMP_LOOP_2_modExp_1_while_C_23 : begin
        fsm_output = 8'b01111010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_24;
      end
      COMP_LOOP_2_modExp_1_while_C_24 : begin
        fsm_output = 8'b01111011;
        if ( COMP_LOOP_2_modExp_1_while_C_24_tr0 ) begin
          state_var_NS = COMP_LOOP_C_42;
        end
        else begin
          state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 8'b01111100;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 8'b01111101;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 8'b01111110;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 8'b01111111;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 8'b10000000;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 8'b10000001;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 8'b10000010;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 8'b10000011;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 8'b10000100;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 8'b10000101;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 8'b10000110;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 8'b10000111;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 8'b10001000;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 8'b10001001;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 8'b10001010;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 8'b10001011;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 8'b10001100;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 8'b10001101;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 8'b10001110;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 8'b10001111;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 8'b10010000;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 8'b10010001;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 8'b10010010;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 8'b10010011;
        state_var_NS = COMP_LOOP_C_66;
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 8'b10010100;
        state_var_NS = COMP_LOOP_C_67;
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 8'b10010101;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 8'b10010110;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 8'b10010111;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 8'b10011000;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 8'b10011001;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 8'b10011010;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 8'b10011011;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 8'b10011100;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 8'b10011101;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 8'b10011110;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 8'b10011111;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 8'b10100000;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 8'b10100001;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 8'b10100010;
        if ( COMP_LOOP_C_80_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 8'b10100011;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_6;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_6 : begin
        fsm_output = 8'b10100100;
        if ( STAGE_LOOP_C_6_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b10100101;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 8'b00000000;
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
//  Design Unit:    inPlaceNTT_DIT_core
// ------------------------------------------------------------------


module inPlaceNTT_DIT_core (
  clk, rst, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_dat, r_rsc_triosy_lz, vec_rsc_0_0_i_qa_d, vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_qa_d, vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d, vec_rsc_0_0_i_adra_d_pff,
      vec_rsc_0_0_i_da_d_pff, vec_rsc_0_0_i_wea_d_pff, vec_rsc_0_1_i_wea_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_0_0_lz;
  output vec_rsc_triosy_0_1_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  input [63:0] vec_rsc_0_0_i_qa_d;
  output vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_1_i_qa_d;
  output vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [10:0] vec_rsc_0_0_i_adra_d_pff;
  output [63:0] vec_rsc_0_0_i_da_d_pff;
  output vec_rsc_0_0_i_wea_d_pff;
  output vec_rsc_0_1_i_wea_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  wire [63:0] r_rsci_idat;
  reg [63:0] modulo_result_rem_cmp_a;
  reg [63:0] modulo_result_rem_cmp_b;
  wire [63:0] modulo_result_rem_cmp_z;
  reg [64:0] operator_66_true_div_cmp_a;
  wire [64:0] operator_66_true_div_cmp_z;
  reg [9:0] operator_66_true_div_cmp_b_9_0;
  wire [7:0] fsm_output;
  wire or_tmp_10;
  wire nor_tmp_15;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_27;
  wire and_dcpl_29;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_45;
  wire and_dcpl_46;
  wire and_dcpl_49;
  wire and_dcpl_51;
  wire and_dcpl_56;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire and_dcpl_59;
  wire mux_tmp_55;
  wire and_dcpl_61;
  wire and_dcpl_72;
  wire and_dcpl_75;
  wire or_tmp_68;
  wire mux_tmp_73;
  wire and_tmp_4;
  wire or_tmp_81;
  wire or_tmp_82;
  wire mux_tmp_85;
  wire nand_tmp_5;
  wire and_dcpl_76;
  wire and_dcpl_77;
  wire and_dcpl_78;
  wire and_dcpl_79;
  wire xor_dcpl;
  wire and_dcpl_81;
  wire and_dcpl_84;
  wire and_dcpl_85;
  wire and_dcpl_86;
  wire and_dcpl_87;
  wire and_dcpl_88;
  wire and_dcpl_91;
  wire mux_tmp_90;
  wire and_dcpl_92;
  wire and_dcpl_96;
  wire and_dcpl_97;
  wire or_tmp_88;
  wire or_tmp_113;
  wire and_dcpl_104;
  wire and_dcpl_112;
  wire and_dcpl_115;
  wire and_dcpl_118;
  wire and_dcpl_123;
  wire and_dcpl_125;
  wire and_dcpl_128;
  wire and_dcpl_131;
  wire not_tmp_110;
  wire mux_tmp_137;
  wire or_tmp_148;
  wire and_dcpl_142;
  wire and_dcpl_143;
  wire and_dcpl_146;
  reg exit_COMP_LOOP_1_modExp_1_while_sva;
  reg COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  reg [11:0] VEC_LOOP_j_sva_11_0;
  reg modExp_exp_1_0_1_sva;
  reg [11:0] COMP_LOOP_acc_10_cse_12_1_1_sva;
  reg [11:0] COMP_LOOP_acc_1_cse_sva;
  reg [63:0] tmp_2_lpi_4_dfm;
  wire and_109_m1c;
  wire and_117_m1c;
  reg reg_vec_rsc_triosy_0_1_obj_ld_cse;
  wire and_180_cse;
  wire and_166_cse;
  wire nor_88_cse;
  wire and_181_cse;
  wire and_182_cse;
  wire and_161_cse;
  wire nor_46_cse;
  reg [7:0] COMP_LOOP_k_9_1_sva_7_0;
  wire and_9_cse;
  wire [10:0] COMP_LOOP_acc_psp_sva_1;
  wire [11:0] nl_COMP_LOOP_acc_psp_sva_1;
  reg [10:0] COMP_LOOP_acc_psp_sva;
  wire [63:0] modExp_base_1_sva_mx1;
  wire or_tmp_181;
  wire or_tmp_191;
  wire [63:0] modulo_qr_sva_1_mx0w5;
  wire [64:0] nl_modulo_qr_sva_1_mx0w5;
  wire modExp_while_and_3;
  wire modExp_while_and_5;
  wire or_241_cse;
  wire mux_51_itm;
  wire and_dcpl_151;
  wire and_dcpl_154;
  wire and_dcpl_155;
  wire and_dcpl_159;
  wire and_dcpl_160;
  wire and_dcpl_166;
  wire and_dcpl_169;
  wire and_dcpl_173;
  wire and_dcpl_178;
  wire and_dcpl_181;
  wire and_dcpl_182;
  wire [64:0] z_out;
  wire [65:0] nl_z_out;
  wire and_dcpl_194;
  wire and_dcpl_195;
  wire and_dcpl_200;
  wire and_dcpl_201;
  wire and_dcpl_205;
  wire and_dcpl_206;
  wire and_dcpl_212;
  wire and_dcpl_214;
  wire [64:0] z_out_1;
  wire [9:0] z_out_2;
  wire [10:0] nl_z_out_2;
  wire and_dcpl_240;
  wire [63:0] z_out_3;
  wire [127:0] nl_z_out_3;
  reg [63:0] p_sva;
  reg [63:0] r_sva;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] STAGE_LOOP_lshift_psp_sva;
  reg [63:0] modExp_result_sva;
  reg modExp_exp_1_7_1_sva;
  reg modExp_exp_1_6_1_sva;
  reg modExp_exp_1_5_1_sva;
  reg modExp_exp_1_4_1_sva;
  reg modExp_exp_1_3_1_sva;
  reg modExp_exp_1_2_1_sva;
  reg modExp_exp_1_1_1_sva;
  reg modExp_exp_1_0_1_sva_1;
  reg [63:0] modExp_base_1_sva;
  reg [63:0] COMP_LOOP_1_acc_8_itm;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [9:0] STAGE_LOOP_lshift_psp_sva_mx0w0;
  wire VEC_LOOP_j_sva_11_0_mx0c1;
  wire modExp_result_sva_mx0c0;
  wire [62:0] operator_64_false_slc_modExp_exp_63_1_3;
  wire modExp_result_and_rgt;
  wire modExp_result_and_1_rgt;
  wire COMP_LOOP_or_1_cse;
  wire nor_129_cse;
  wire or_tmp_210;
  wire [64:0] operator_64_false_mux1h_2_rgt;
  reg operator_64_false_acc_mut_64;
  reg [63:0] operator_64_false_acc_mut_63_0;
  wire nor_150_cse;
  wire operator_64_false_1_or_1_itm;
  wire operator_64_false_1_or_5_itm;
  wire STAGE_LOOP_acc_itm_2_1;
  wire mux_164_cse;

  wire[0:0] modulo_result_or_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] mux_76_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] nand_4_nl;
  wire[0:0] mux_74_nl;
  wire[0:0] or_99_nl;
  wire[0:0] or_97_nl;
  wire[0:0] mux_72_nl;
  wire[0:0] or_94_nl;
  wire[0:0] mux_71_nl;
  wire[0:0] or_228_nl;
  wire[0:0] mux_70_nl;
  wire[0:0] or_91_nl;
  wire[0:0] mux_69_nl;
  wire[0:0] mux_68_nl;
  wire[0:0] mux_67_nl;
  wire[0:0] mux_66_nl;
  wire[0:0] mux_89_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] nor_69_nl;
  wire[0:0] mux_84_nl;
  wire[0:0] mux_83_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] mux_80_nl;
  wire[0:0] or_102_nl;
  wire[0:0] mux_79_nl;
  wire[0:0] or_101_nl;
  wire[0:0] or_100_nl;
  wire[0:0] mux_91_nl;
  wire[0:0] nor_68_nl;
  wire[0:0] or_191_nl;
  wire[63:0] mux1h_nl;
  wire[0:0] or_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] and_190_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] and_188_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] or_235_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] and_186_nl;
  wire[0:0] and_nl;
  wire[0:0] modExp_while_if_and_1_nl;
  wire[0:0] modExp_while_if_and_2_nl;
  wire[0:0] and_100_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] mux_99_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] mux_97_nl;
  wire[0:0] or_111_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] mux_95_nl;
  wire[0:0] mux_94_nl;
  wire[0:0] or_109_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] or_295_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] nor_160_nl;
  wire[0:0] nand_26_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] or_270_nl;
  wire[0:0] nor_161_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] mux_nl;
  wire[0:0] nand_25_nl;
  wire[0:0] or_266_nl;
  wire[0:0] nor_164_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] nor_151_nl;
  wire[0:0] nor_152_nl;
  wire[0:0] nor_153_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] nor_154_nl;
  wire[0:0] nor_156_nl;
  wire[0:0] mux_219_nl;
  wire[0:0] or_279_nl;
  wire[0:0] mux_218_nl;
  wire[0:0] or_278_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] and_298_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] nor_157_nl;
  wire[0:0] and_299_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] and_300_nl;
  wire[0:0] nor_158_nl;
  wire[0:0] nor_159_nl;
  wire[0:0] nand_23_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] nor_119_nl;
  wire[0:0] nor_120_nl;
  wire[0:0] nor_148_nl;
  wire[0:0] nor_149_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] or_291_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] or_288_nl;
  wire[0:0] mux_121_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] nor_62_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] and_114_nl;
  wire[0:0] r_or_nl;
  wire[0:0] r_or_1_nl;
  wire[0:0] mux_126_nl;
  wire[0:0] or_146_nl;
  wire[0:0] mux_125_nl;
  wire[0:0] or_25_nl;
  wire[0:0] mux_124_nl;
  wire[0:0] nor_58_nl;
  wire[0:0] or_142_nl;
  wire[0:0] and_135_nl;
  wire[0:0] mux_134_nl;
  wire[0:0] nor_54_nl;
  wire[0:0] nor_55_nl;
  wire[0:0] and_136_nl;
  wire[0:0] mux_135_nl;
  wire[0:0] nor_52_nl;
  wire[0:0] nor_53_nl;
  wire[0:0] mux_132_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] mux_129_nl;
  wire[0:0] or_155_nl;
  wire[0:0] mux_128_nl;
  wire[0:0] nor_140_nl;
  wire[0:0] nor_141_nl;
  wire[0:0] nor_142_nl;
  wire[0:0] or_263_nl;
  wire[0:0] mux_127_nl;
  wire[0:0] and_131_nl;
  wire[0:0] COMP_LOOP_mux1h_12_nl;
  wire[0:0] COMP_LOOP_and_3_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] or_168_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] mux_141_nl;
  wire[0:0] mux_140_nl;
  wire[0:0] mux_139_nl;
  wire[0:0] nor_47_nl;
  wire[0:0] mux_138_nl;
  wire[0:0] nor_48_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] or_169_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] mux_144_nl;
  wire[9:0] COMP_LOOP_1_acc_nl;
  wire[10:0] nl_COMP_LOOP_1_acc_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] nor_38_nl;
  wire[0:0] nor_39_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] and_150_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] mux_17_nl;
  wire[0:0] or_29_nl;
  wire[0:0] or_27_nl;
  wire[0:0] COMP_LOOP_mux1h_19_nl;
  wire[0:0] COMP_LOOP_mux1h_36_nl;
  wire[0:0] and_157_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] and_156_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] nor_86_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] and_25_nl;
  wire[0:0] mux_53_nl;
  wire[0:0] nand_19_nl;
  wire[0:0] or_229_nl;
  wire[0:0] or_68_nl;
  wire[0:0] or_67_nl;
  wire[0:0] or_96_nl;
  wire[0:0] and_98_nl;
  wire[0:0] mux_93_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] nor_60_nl;
  wire[0:0] mux_136_nl;
  wire[0:0] nor_50_nl;
  wire[0:0] nor_51_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] nor_37_nl;
  wire[0:0] and_160_nl;
  wire[0:0] mux_117_nl;
  wire[0:0] nor_63_nl;
  wire[2:0] STAGE_LOOP_acc_nl;
  wire[3:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] mux_122_nl;
  wire[0:0] and_165_nl;
  wire[0:0] nor_90_nl;
  wire[0:0] and_51_nl;
  wire[0:0] and_56_nl;
  wire[0:0] and_59_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] nor_83_nl;
  wire[0:0] mux_57_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] nor_79_nl;
  wire[0:0] nor_80_nl;
  wire[0:0] nor_81_nl;
  wire[0:0] mux_60_nl;
  wire[0:0] nor_76_nl;
  wire[0:0] mux_59_nl;
  wire[0:0] or_79_nl;
  wire[0:0] or_78_nl;
  wire[0:0] and_174_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] nor_77_nl;
  wire[0:0] nor_78_nl;
  wire[0:0] mux_62_nl;
  wire[0:0] mux_61_nl;
  wire[0:0] and_172_nl;
  wire[0:0] nor_75_nl;
  wire[0:0] and_173_nl;
  wire[0:0] mux_65_nl;
  wire[0:0] nor_73_nl;
  wire[0:0] mux_64_nl;
  wire[0:0] or_88_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] and_170_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] and_171_nl;
  wire[0:0] nor_74_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] or_257_nl;
  wire[0:0] or_258_nl;
  wire[51:0] operator_64_false_1_operator_64_false_1_or_1_nl;
  wire[51:0] operator_64_false_1_and_2_nl;
  wire[51:0] operator_64_false_1_mux_1_nl;
  wire[0:0] operator_64_false_1_nor_2_nl;
  wire[1:0] operator_64_false_1_or_11_nl;
  wire[1:0] operator_64_false_1_and_3_nl;
  wire[1:0] operator_64_false_1_mux1h_5_nl;
  wire[0:0] operator_64_false_1_nor_3_nl;
  wire[1:0] operator_64_false_1_or_12_nl;
  wire[1:0] operator_64_false_1_mux1h_6_nl;
  wire[0:0] operator_64_false_1_or_13_nl;
  wire[7:0] operator_64_false_1_mux1h_7_nl;
  wire[63:0] operator_64_false_1_or_14_nl;
  wire[63:0] operator_64_false_1_mux1h_8_nl;
  wire[65:0] acc_1_nl;
  wire[66:0] nl_acc_1_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_3_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_4_nl;
  wire[0:0] COMP_LOOP_mux_43_nl;
  wire[62:0] COMP_LOOP_mux1h_63_nl;
  wire[0:0] COMP_LOOP_or_14_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_55_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_56_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_57_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_58_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_59_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_60_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_61_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_62_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_63_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_64_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_65_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_66_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_67_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_68_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_69_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_70_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_71_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_72_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_73_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_74_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_75_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_76_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_77_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_78_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_79_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_80_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_81_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_82_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_83_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_84_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_85_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_86_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_87_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_88_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_89_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_90_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_91_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_92_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_93_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_94_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_95_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_96_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_97_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_98_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_99_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_100_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_101_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_102_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_103_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_104_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_105_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_106_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_107_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_108_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_109_nl;
  wire[7:0] COMP_LOOP_and_8_nl;
  wire[7:0] COMP_LOOP_COMP_LOOP_mux_3_nl;
  wire[0:0] COMP_LOOP_or_15_nl;
  wire[0:0] COMP_LOOP_nor_8_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_5_nl;
  wire[0:0] and_302_nl;
  wire[63:0] modExp_while_if_mux1h_1_nl;
  wire[0:0] and_303_nl;
  wire[0:0] modExp_while_if_or_1_nl;
  wire[0:0] and_305_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] nor_168_nl;
  wire[0:0] nor_169_nl;
  wire[63:0] modExp_while_if_modExp_while_if_mux1h_1_nl;
  wire[0:0] modExp_while_if_and_4_nl;
  wire[0:0] modExp_while_if_and_5_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [10:0] nl_operator_66_true_div_cmp_b;
  assign nl_operator_66_true_div_cmp_b = {1'b0, operator_66_true_div_cmp_b_9_0};
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_5_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_5_tr0 = ~ (z_out_1[64]);
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 = ~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_40_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_40_tr0 = ~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_24_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_24_tr0
      = ~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = z_out[12];
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_6_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_6_tr0 = ~ STAGE_LOOP_acc_itm_2_1;
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
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_1_obj (
      .ld(reg_vec_rsc_triosy_0_1_obj_ld_cse),
      .lz(vec_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_1_obj_ld_cse),
      .lz(vec_rsc_triosy_0_0_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_1_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_1_obj_ld_cse),
      .lz(r_rsc_triosy_lz)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd1)) modulo_result_rem_cmp (
      .a(modulo_result_rem_cmp_a),
      .b(modulo_result_rem_cmp_b),
      .z(modulo_result_rem_cmp_z)
    );
  mgc_div #(.width_a(32'sd65),
  .width_b(32'sd11),
  .signd(32'sd1)) operator_66_true_div_cmp (
      .a(operator_66_true_div_cmp_a),
      .b(nl_operator_66_true_div_cmp_b[10:0]),
      .z(operator_66_true_div_cmp_z)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd10)) STAGE_LOOP_lshift_rg (
      .a(1'b1),
      .s(STAGE_LOOP_i_3_0_sva),
      .z(STAGE_LOOP_lshift_psp_sva_mx0w0)
    );
  inPlaceNTT_DIT_core_core_fsm inPlaceNTT_DIT_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .STAGE_LOOP_C_5_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_5_tr0[0:0]),
      .modExp_while_C_24_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .COMP_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0[0:0]),
      .COMP_LOOP_1_modExp_1_while_C_24_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .COMP_LOOP_C_40_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_40_tr0[0:0]),
      .COMP_LOOP_2_modExp_1_while_C_24_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_24_tr0[0:0]),
      .COMP_LOOP_C_80_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_6_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_6_tr0[0:0])
    );
  assign and_166_cse = (fsm_output[1:0]==2'b11);
  assign and_161_cse = (fsm_output[2:0]==3'b111);
  assign nor_46_cse = ~((fsm_output[1:0]!=2'b01));
  assign or_241_cse = (fsm_output[1:0]!=2'b00);
  assign or_191_nl = (fsm_output[2:1]!=2'b01);
  assign mux_164_cse = MUX_s_1_2_2(or_191_nl, or_tmp_68, fsm_output[6]);
  assign mux_191_nl = MUX_s_1_2_2(or_tmp_191, (fsm_output[7]), fsm_output[0]);
  assign mux_192_nl = MUX_s_1_2_2(or_tmp_181, mux_191_nl, fsm_output[1]);
  assign mux_193_nl = MUX_s_1_2_2(mux_192_nl, (fsm_output[7]), fsm_output[2]);
  assign and_190_nl = ((~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[7]))
      & or_tmp_181;
  assign mux_189_nl = MUX_s_1_2_2(or_tmp_191, (fsm_output[7]), or_241_cse);
  assign mux_190_nl = MUX_s_1_2_2(and_190_nl, mux_189_nl, fsm_output[2]);
  assign mux_194_nl = MUX_s_1_2_2(mux_193_nl, mux_190_nl, fsm_output[6]);
  assign mux_195_nl = MUX_s_1_2_2(mux_194_nl, (fsm_output[7]), fsm_output[4]);
  assign and_188_nl = ((~((fsm_output[6]) | (~ (fsm_output[2])) | (~ (fsm_output[1]))
      | (fsm_output[0]))) | (fsm_output[7])) & or_tmp_181;
  assign or_235_nl = (~((fsm_output[2:0]!=3'b100))) | (fsm_output[7]);
  assign and_186_nl = or_tmp_148 & or_tmp_181;
  assign mux_182_nl = MUX_s_1_2_2(and_186_nl, (fsm_output[7]), fsm_output[2]);
  assign and_nl = ((fsm_output[2]) | or_tmp_148) & or_tmp_181;
  assign mux_183_nl = MUX_s_1_2_2(mux_182_nl, and_nl, nor_46_cse);
  assign mux_184_nl = MUX_s_1_2_2(or_235_nl, mux_183_nl, fsm_output[6]);
  assign mux_185_nl = MUX_s_1_2_2(and_188_nl, mux_184_nl, fsm_output[4]);
  assign mux_201_nl = MUX_s_1_2_2(mux_195_nl, mux_185_nl, fsm_output[3]);
  assign or_nl = and_dcpl_75 | and_dcpl_81 | ((~ mux_164_cse) & and_dcpl_23 & (fsm_output[5])
      & mux_201_nl);
  assign modExp_while_if_and_1_nl = modExp_while_and_3 & and_dcpl_131;
  assign modExp_while_if_and_2_nl = modExp_while_and_5 & and_dcpl_131;
  assign mux1h_nl = MUX1HOT_v_64_5_2(z_out_3, 64'b0000000000000000000000000000000000000000000000000000000000000001,
      modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, (z_out[63:0]), {or_nl , and_dcpl_112
      , modExp_while_if_and_1_nl , modExp_while_if_and_2_nl , and_dcpl_84});
  assign and_100_nl = and_dcpl_92 & and_dcpl_24;
  assign mux_97_nl = MUX_s_1_2_2((~ and_161_cse), or_tmp_82, fsm_output[4]);
  assign mux_98_nl = MUX_s_1_2_2(mux_97_nl, (fsm_output[4]), fsm_output[3]);
  assign mux_99_nl = MUX_s_1_2_2(mux_98_nl, mux_tmp_73, fsm_output[7]);
  assign mux_95_nl = MUX_s_1_2_2(and_161_cse, or_tmp_10, fsm_output[4]);
  assign mux_96_nl = MUX_s_1_2_2(mux_95_nl, (fsm_output[4]), fsm_output[3]);
  assign or_111_nl = (fsm_output[7]) | mux_96_nl;
  assign mux_100_nl = MUX_s_1_2_2(mux_99_nl, or_111_nl, fsm_output[6]);
  assign or_109_nl = (fsm_output[7]) | (~((fsm_output[4:1]!=4'b0000)));
  assign mux_94_nl = MUX_s_1_2_2(or_tmp_88, or_109_nl, fsm_output[6]);
  assign mux_101_nl = MUX_s_1_2_2(mux_100_nl, mux_94_nl, fsm_output[5]);
  assign operator_64_false_mux1h_2_rgt = MUX1HOT_v_65_3_2(z_out, ({2'b00 , operator_64_false_slc_modExp_exp_63_1_3}),
      ({1'b0 , mux1h_nl}), {and_100_nl , and_dcpl_97 , (~ mux_101_nl)});
  assign and_180_cse = (fsm_output[4]) & (fsm_output[2]);
  assign nor_150_cse = ~((fsm_output[4:3]!=2'b00));
  assign and_109_m1c = and_dcpl_41 & and_dcpl_24;
  assign modExp_result_and_rgt = (~ modExp_while_and_5) & and_109_m1c;
  assign modExp_result_and_1_rgt = modExp_while_and_5 & and_109_m1c;
  assign nor_88_cse = ~((fsm_output[2:1]!=2'b00));
  assign and_182_cse = (fsm_output[2:1]==2'b11);
  assign and_181_cse = (fsm_output[4]) & (fsm_output[0]);
  assign COMP_LOOP_or_1_cse = and_dcpl_42 | and_dcpl_58;
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_COMP_LOOP_acc_psp_sva_1 = (VEC_LOOP_j_sva_11_0[11:1]) + conv_u2u_8_11(COMP_LOOP_k_9_1_sva_7_0);
  assign COMP_LOOP_acc_psp_sva_1 = nl_COMP_LOOP_acc_psp_sva_1[10:0];
  assign operator_64_false_slc_modExp_exp_63_1_3 = MUX_v_63_2_2((operator_66_true_div_cmp_z[63:1]),
      (tmp_2_lpi_4_dfm[63:1]), and_dcpl_104);
  assign nl_modulo_qr_sva_1_mx0w5 = modulo_result_rem_cmp_z + p_sva;
  assign modulo_qr_sva_1_mx0w5 = nl_modulo_qr_sva_1_mx0w5[63:0];
  assign modExp_base_1_sva_mx1 = MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
      modulo_result_rem_cmp_z[63]);
  assign modExp_while_and_3 = (~ (modulo_result_rem_cmp_z[63])) & modExp_exp_1_0_1_sva;
  assign modExp_while_and_5 = (modulo_result_rem_cmp_z[63]) & modExp_exp_1_0_1_sva;
  assign or_tmp_10 = (fsm_output[2]) | and_166_cse;
  assign and_9_cse = (fsm_output[4]) & or_tmp_10;
  assign nor_tmp_15 = or_241_cse & (fsm_output[2]);
  assign nor_86_nl = ~((fsm_output[3]) | (fsm_output[4]) | (fsm_output[2]) | (fsm_output[0])
      | (fsm_output[1]) | (fsm_output[7]));
  assign mux_47_nl = MUX_s_1_2_2(nor_86_nl, (fsm_output[7]), fsm_output[6]);
  assign and_25_nl = (fsm_output[7]) & ((fsm_output[4:3]!=2'b00) | nor_tmp_15);
  assign mux_49_nl = MUX_s_1_2_2(and_25_nl, (fsm_output[7]), fsm_output[6]);
  assign mux_51_itm = MUX_s_1_2_2(mux_47_nl, mux_49_nl, fsm_output[5]);
  assign and_dcpl_22 = ~((fsm_output[6:5]!=2'b00));
  assign and_dcpl_23 = ~((fsm_output[3]) | (fsm_output[7]));
  assign and_dcpl_24 = and_dcpl_23 & and_dcpl_22;
  assign and_dcpl_25 = ~((fsm_output[0]) | (fsm_output[4]));
  assign and_dcpl_27 = nor_88_cse & and_dcpl_25;
  assign and_dcpl_29 = (fsm_output[6:5]==2'b01);
  assign and_dcpl_31 = (~ (fsm_output[3])) & (fsm_output[7]) & and_dcpl_29;
  assign and_dcpl_32 = (fsm_output[2:1]==2'b10);
  assign and_dcpl_35 = and_dcpl_23 & and_dcpl_29;
  assign and_dcpl_36 = and_dcpl_27 & and_dcpl_35;
  assign and_dcpl_37 = (fsm_output[3]) & (~ (fsm_output[7]));
  assign and_dcpl_38 = and_dcpl_37 & and_dcpl_29;
  assign and_dcpl_40 = (fsm_output[2:1]==2'b01);
  assign and_dcpl_41 = and_dcpl_40 & and_181_cse;
  assign and_dcpl_42 = and_dcpl_41 & and_dcpl_38;
  assign and_dcpl_45 = (~ (fsm_output[0])) & (fsm_output[4]);
  assign and_dcpl_46 = and_dcpl_32 & and_dcpl_45;
  assign and_dcpl_49 = ~((fsm_output[1]) | (fsm_output[4]));
  assign nand_19_nl = ~((fsm_output[7]) & (fsm_output[0]));
  assign or_229_nl = (fsm_output[7]) | (fsm_output[0]);
  assign mux_53_nl = MUX_s_1_2_2(nand_19_nl, or_229_nl, fsm_output[6]);
  assign and_dcpl_51 = ~(mux_53_nl | (fsm_output[2]));
  assign and_dcpl_56 = (fsm_output[6:5]==2'b11);
  assign and_dcpl_57 = and_dcpl_37 & and_dcpl_56;
  assign and_dcpl_58 = and_dcpl_46 & and_dcpl_57;
  assign and_dcpl_59 = ~((fsm_output[1]) | (fsm_output[3]));
  assign or_68_nl = (~ (fsm_output[7])) | (fsm_output[4]) | (~ (fsm_output[0])) |
      (fsm_output[2]);
  assign or_67_nl = (fsm_output[7]) | (fsm_output[4]) | (fsm_output[0]) | (fsm_output[2]);
  assign mux_tmp_55 = MUX_s_1_2_2(or_68_nl, or_67_nl, fsm_output[6]);
  assign and_dcpl_61 = (~ (fsm_output[7])) & (fsm_output[5]);
  assign and_dcpl_72 = (fsm_output[0]) & (~ (fsm_output[4]));
  assign and_dcpl_75 = and_182_cse & and_dcpl_72 & and_dcpl_24;
  assign or_tmp_68 = (fsm_output[2:1]!=2'b10);
  assign or_96_nl = (fsm_output[4]) | (~((fsm_output[2:0]!=3'b000)));
  assign mux_tmp_73 = MUX_s_1_2_2(and_180_cse, or_96_nl, fsm_output[3]);
  assign and_tmp_4 = (fsm_output[4]) & nor_tmp_15;
  assign or_tmp_81 = (fsm_output[4:0]!=5'b00000);
  assign or_tmp_82 = (fsm_output[2:1]!=2'b00);
  assign mux_tmp_85 = MUX_s_1_2_2(and_tmp_4, (fsm_output[4]), fsm_output[3]);
  assign nand_tmp_5 = ~((fsm_output[4]) & (~ and_161_cse));
  assign and_dcpl_76 = and_dcpl_40 & and_dcpl_25;
  assign and_dcpl_77 = and_dcpl_76 & and_dcpl_35;
  assign and_dcpl_78 = (fsm_output[4:3]==2'b11);
  assign and_dcpl_79 = and_dcpl_78 & and_dcpl_61;
  assign and_dcpl_81 = and_dcpl_32 & xor_dcpl & and_dcpl_79;
  assign and_dcpl_84 = and_dcpl_51 & and_dcpl_49 & (fsm_output[3]) & (~ (fsm_output[5]));
  assign and_dcpl_85 = and_dcpl_23 & and_dcpl_56;
  assign and_dcpl_86 = and_dcpl_40 & and_dcpl_72;
  assign and_dcpl_87 = and_dcpl_86 & and_dcpl_85;
  assign and_dcpl_88 = ~((fsm_output[7:6]!=2'b00));
  assign and_dcpl_91 = ((fsm_output[2]) ^ (fsm_output[1])) & nor_150_cse & and_dcpl_88
      & (~ (fsm_output[5]));
  assign and_98_nl = (fsm_output[7]) & ((fsm_output[4:2]!=3'b000));
  assign mux_tmp_90 = MUX_s_1_2_2(and_98_nl, (fsm_output[7]), fsm_output[6]);
  assign and_dcpl_92 = nor_88_cse & and_dcpl_72;
  assign mux_93_nl = MUX_s_1_2_2(and_dcpl_25, and_181_cse, fsm_output[3]);
  assign and_dcpl_96 = mux_93_nl & (fsm_output[2]);
  assign and_dcpl_97 = and_dcpl_96 & (fsm_output[1]) & (~ (fsm_output[7])) & and_dcpl_22;
  assign or_tmp_88 = (fsm_output[7]) | (~ or_tmp_81);
  assign or_tmp_113 = (fsm_output[2:0]!=3'b011);
  assign and_dcpl_104 = and_182_cse & and_181_cse & and_dcpl_37 & and_dcpl_22;
  assign nor_60_nl = ~((fsm_output[1:0]!=2'b10));
  assign mux_123_nl = MUX_s_1_2_2(nor_46_cse, nor_60_nl, fsm_output[6]);
  assign and_dcpl_112 = mux_123_nl & (~ (fsm_output[2])) & nor_150_cse & and_dcpl_61;
  assign and_dcpl_115 = (fsm_output[7:6]==2'b01);
  assign and_dcpl_118 = and_161_cse & (fsm_output[4:3]==2'b01);
  assign and_dcpl_123 = ~((fsm_output[2]) | (fsm_output[4]));
  assign and_dcpl_125 = and_dcpl_123 & (~ (fsm_output[3])) & and_dcpl_61;
  assign and_dcpl_128 = and_dcpl_92 & and_dcpl_35;
  assign nor_50_nl = ~((fsm_output[4]) | (fsm_output[0]) | (~ (fsm_output[2])));
  assign nor_51_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[0])) | (fsm_output[2]));
  assign mux_136_nl = MUX_s_1_2_2(nor_50_nl, nor_51_nl, fsm_output[6]);
  assign and_dcpl_131 = mux_136_nl & (fsm_output[1]) & (fsm_output[3]) & and_dcpl_61;
  assign not_tmp_110 = ~((fsm_output[4]) | or_tmp_10);
  assign mux_tmp_137 = MUX_s_1_2_2(not_tmp_110, and_9_cse, fsm_output[3]);
  assign or_tmp_148 = and_166_cse | (fsm_output[7]);
  assign and_dcpl_142 = (~ mux_tmp_137) & and_dcpl_61;
  assign and_dcpl_143 = and_dcpl_76 & and_dcpl_85;
  assign nor_37_nl = ~((fsm_output[3]) | (fsm_output[4]) | (fsm_output[0]));
  assign and_160_nl = (fsm_output[3]) & (fsm_output[4]) & (fsm_output[0]);
  assign mux_178_nl = MUX_s_1_2_2(nor_37_nl, and_160_nl, fsm_output[6]);
  assign and_dcpl_146 = mux_178_nl & and_dcpl_40 & and_dcpl_61;
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_32 & and_dcpl_25 & and_dcpl_31;
  assign VEC_LOOP_j_sva_11_0_mx0c1 = and_dcpl_86 & and_dcpl_31;
  assign nor_63_nl = ~((fsm_output[7]) | (fsm_output[3]) | (fsm_output[4]) | and_161_cse);
  assign mux_117_nl = MUX_s_1_2_2(nor_63_nl, (fsm_output[7]), fsm_output[6]);
  assign modExp_result_sva_mx0c0 = MUX_s_1_2_2(mux_117_nl, mux_tmp_90, fsm_output[5]);
  assign nl_STAGE_LOOP_acc_nl = (STAGE_LOOP_i_3_0_sva_2[3:1]) + 3'b011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[2:0];
  assign STAGE_LOOP_acc_itm_2_1 = readslicef_3_1_2(STAGE_LOOP_acc_nl);
  assign xor_dcpl = ~((fsm_output[0]) ^ (fsm_output[6]));
  assign and_165_nl = (fsm_output[0]) & (fsm_output[2]);
  assign nor_90_nl = ~((fsm_output[0]) | (fsm_output[2]));
  assign mux_122_nl = MUX_s_1_2_2(and_165_nl, nor_90_nl, fsm_output[5]);
  assign and_117_m1c = mux_122_nl & (fsm_output[1]) & and_dcpl_78 & and_dcpl_88;
  assign and_51_nl = and_dcpl_46 & and_dcpl_23 & (fsm_output[6:5]==2'b10);
  assign and_56_nl = and_dcpl_51 & and_dcpl_49 & (~ (fsm_output[3])) & (fsm_output[5]);
  assign nor_82_nl = ~((fsm_output[6]) | (~((fsm_output[7]) & (fsm_output[4]) & (fsm_output[2]))));
  assign nor_83_nl = ~((~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[4]) |
      (fsm_output[2]));
  assign mux_54_nl = MUX_s_1_2_2(nor_82_nl, nor_83_nl, fsm_output[5]);
  assign and_59_nl = mux_54_nl & (~ (fsm_output[1])) & (fsm_output[0]) & (~ (fsm_output[3]));
  assign vec_rsc_0_0_i_adra_d_pff = MUX1HOT_v_11_5_2(COMP_LOOP_acc_psp_sva_1, (z_out[12:2]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva[11:1]), (COMP_LOOP_acc_1_cse_sva[11:1]),
      {and_dcpl_36 , COMP_LOOP_or_1_cse , and_51_nl , and_56_nl , and_59_nl});
  assign vec_rsc_0_0_i_da_d_pff = modExp_base_1_sva_mx1;
  assign nor_79_nl = ~((COMP_LOOP_acc_1_cse_sva[0]) | (~((fsm_output[7]) & (fsm_output[4])
      & (fsm_output[0]) & (fsm_output[2]))));
  assign nor_80_nl = ~((VEC_LOOP_j_sva_11_0[0]) | (fsm_output[7]) | (~ (fsm_output[4]))
      | (fsm_output[0]) | (~ (fsm_output[2])));
  assign mux_56_nl = MUX_s_1_2_2(nor_79_nl, nor_80_nl, fsm_output[6]);
  assign nor_81_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[0]) | mux_tmp_55);
  assign mux_57_nl = MUX_s_1_2_2(mux_56_nl, nor_81_nl, fsm_output[5]);
  assign vec_rsc_0_0_i_wea_d_pff = mux_57_nl & and_dcpl_59;
  assign or_79_nl = (VEC_LOOP_j_sva_11_0[0]) | (fsm_output[6]);
  assign or_78_nl = (~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      | (COMP_LOOP_acc_1_cse_sva[0]) | (~ (fsm_output[6]));
  assign mux_59_nl = MUX_s_1_2_2(or_79_nl, or_78_nl, fsm_output[0]);
  assign nor_76_nl = ~((fsm_output[4]) | (fsm_output[2]) | (fsm_output[1]) | mux_59_nl);
  assign nor_77_nl = ~((fsm_output[1:0]!=2'b11) | (z_out[1]) | (fsm_output[6]));
  assign nor_78_nl = ~((fsm_output[1:0]!=2'b00) | (z_out[1]) | (~ (fsm_output[6])));
  assign mux_58_nl = MUX_s_1_2_2(nor_77_nl, nor_78_nl, fsm_output[2]);
  assign and_174_nl = (fsm_output[4]) & mux_58_nl;
  assign mux_60_nl = MUX_s_1_2_2(nor_76_nl, and_174_nl, fsm_output[3]);
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = mux_60_nl & and_dcpl_61;
  assign and_172_nl = (COMP_LOOP_acc_1_cse_sva[0]) & (fsm_output[7]) & (fsm_output[4])
      & (fsm_output[0]) & (fsm_output[2]);
  assign nor_75_nl = ~((~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[7]) | (~ (fsm_output[4]))
      | (fsm_output[0]) | (~ (fsm_output[2])));
  assign mux_61_nl = MUX_s_1_2_2(and_172_nl, nor_75_nl, fsm_output[6]);
  assign and_173_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[0]) & (~ mux_tmp_55);
  assign mux_62_nl = MUX_s_1_2_2(mux_61_nl, and_173_nl, fsm_output[5]);
  assign vec_rsc_0_1_i_wea_d_pff = mux_62_nl & and_dcpl_59;
  assign or_88_nl = (~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[6]);
  assign nand_9_nl = ~(COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm
      & (COMP_LOOP_acc_1_cse_sva[0]) & (fsm_output[6]));
  assign mux_64_nl = MUX_s_1_2_2(or_88_nl, nand_9_nl, fsm_output[0]);
  assign nor_73_nl = ~((fsm_output[4]) | (fsm_output[2]) | (fsm_output[1]) | mux_64_nl);
  assign and_171_nl = (fsm_output[1:0]==2'b11) & (z_out[1]) & (~ (fsm_output[6]));
  assign nor_74_nl = ~((fsm_output[1:0]!=2'b00) | (~((z_out[1]) & (fsm_output[6]))));
  assign mux_63_nl = MUX_s_1_2_2(and_171_nl, nor_74_nl, fsm_output[2]);
  assign and_170_nl = (fsm_output[4]) & mux_63_nl;
  assign mux_65_nl = MUX_s_1_2_2(nor_73_nl, and_170_nl, fsm_output[3]);
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = mux_65_nl & and_dcpl_61;
  assign or_tmp_181 = (~ and_dcpl_131) | modExp_exp_1_0_1_sva;
  assign or_tmp_191 = (fsm_output[7]) | modExp_exp_1_0_1_sva;
  assign and_dcpl_151 = and_dcpl_61 & (~ (fsm_output[6])) & (~ (fsm_output[0]));
  assign and_dcpl_154 = nor_150_cse & (fsm_output[2:1]==2'b00);
  assign and_dcpl_155 = and_dcpl_154 & and_dcpl_151;
  assign and_dcpl_159 = nor_150_cse & and_dcpl_40;
  assign and_dcpl_160 = and_dcpl_159 & and_dcpl_61 & (fsm_output[6]) & (fsm_output[0]);
  assign or_257_nl = (fsm_output[7:6]!=2'b01);
  assign or_258_nl = (fsm_output[7:6]!=2'b10);
  assign mux_206_nl = MUX_s_1_2_2(or_257_nl, or_258_nl, fsm_output[0]);
  assign nor_129_cse = ~(mux_206_nl | (fsm_output[5:1]!=5'b00100));
  assign and_dcpl_166 = (~ (fsm_output[6])) & (fsm_output[0]);
  assign and_dcpl_169 = and_dcpl_154 & (~ (fsm_output[7])) & (~ (fsm_output[5]))
      & and_dcpl_166;
  assign and_dcpl_173 = and_dcpl_78 & and_dcpl_40 & and_dcpl_61 & and_dcpl_166;
  assign and_dcpl_178 = and_dcpl_78 & (fsm_output[2:1]==2'b10) & and_dcpl_61 & (fsm_output[6])
      & (~ (fsm_output[0]));
  assign and_dcpl_181 = and_dcpl_159 & (fsm_output[7]) & (fsm_output[5]) & and_dcpl_166;
  assign and_dcpl_182 = and_dcpl_159 & and_dcpl_151;
  assign and_dcpl_194 = (fsm_output[4:1]==4'b1101) & and_dcpl_61 & and_dcpl_166;
  assign and_dcpl_195 = ~((fsm_output[6]) | (fsm_output[0]));
  assign and_dcpl_200 = (fsm_output[4:1]==4'b0000) & and_dcpl_61 & and_dcpl_195;
  assign and_dcpl_201 = ~((fsm_output[7]) | (fsm_output[5]));
  assign and_dcpl_205 = (fsm_output[4:1]==4'b0011);
  assign and_dcpl_206 = and_dcpl_205 & and_dcpl_201 & and_dcpl_166;
  assign and_dcpl_212 = (fsm_output[4:1]==4'b1110) & and_dcpl_61 & (fsm_output[6])
      & (~ (fsm_output[0]));
  assign and_dcpl_214 = and_dcpl_205 & and_dcpl_201 & and_dcpl_195;
  assign and_dcpl_240 = (fsm_output[4]) & (fsm_output[2]) & (~ (fsm_output[1])) &
      (fsm_output[3]) & (~ (fsm_output[7])) & (fsm_output[5]) & xor_dcpl;
  assign or_tmp_210 = (fsm_output[6:5]!=2'b00);
  assign operator_64_false_1_or_1_itm = and_dcpl_155 | and_dcpl_160 | and_dcpl_182;
  assign operator_64_false_1_or_5_itm = and_dcpl_173 | and_dcpl_178;
  always @(posedge clk) begin
    if ( mux_51_itm ) begin
      p_sva <= p_rsci_idat;
      r_sva <= r_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_27 & and_dcpl_24) | STAGE_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_0_1_obj_ld_cse <= 1'b0;
      modExp_exp_1_0_1_sva <= 1'b0;
      modExp_exp_1_7_1_sva <= 1'b0;
      modExp_exp_1_1_1_sva <= 1'b0;
    end
    else begin
      reg_vec_rsc_triosy_0_1_obj_ld_cse <= and_dcpl_32 & (~ (fsm_output[0])) & nor_150_cse
          & (fsm_output[7:5]==3'b101) & (~ STAGE_LOOP_acc_itm_2_1);
      modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_12_nl & (~ and_dcpl_128)) | mux_149_nl
          | (fsm_output[7]);
      modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_19_nl & (~(and_dcpl_41 & and_dcpl_57));
      modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_36_nl & (~(and_dcpl_40 & and_dcpl_45
          & and_dcpl_38));
    end
  end
  always @(posedge clk) begin
    modulo_result_rem_cmp_a <= MUX1HOT_v_64_4_2(z_out_3, operator_64_false_acc_mut_63_0,
        COMP_LOOP_1_acc_8_itm, (z_out[63:0]), {modulo_result_or_nl , (~ mux_78_nl)
        , mux_89_nl , and_dcpl_84});
    modulo_result_rem_cmp_b <= p_sva;
    operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out, ({operator_64_false_acc_mut_64
        , operator_64_false_acc_mut_63_0}), and_dcpl_91);
    operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
        STAGE_LOOP_lshift_psp_sva, and_dcpl_91);
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_91_nl, mux_tmp_90, fsm_output[5]) ) begin
      STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_213_nl, mux_208_nl, fsm_output[4]) ) begin
      operator_64_false_acc_mut_64 <= operator_64_false_mux1h_2_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_224_nl, nor_159_nl, fsm_output[7]) ) begin
      operator_64_false_acc_mut_63_0 <= operator_64_false_mux1h_2_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_sva_11_0 <= 12'b000000000000;
    end
    else if ( and_dcpl_97 | VEC_LOOP_j_sva_11_0_mx0c1 ) begin
      VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(12'b000000000000, (z_out[11:0]), VEC_LOOP_j_sva_11_0_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_k_9_1_sva_7_0 <= 8'b00000000;
    end
    else if ( MUX_s_1_2_2(nor_148_nl, nor_149_nl, fsm_output[1]) ) begin
      COMP_LOOP_k_9_1_sva_7_0 <= MUX_v_8_2_2(8'b00000000, (z_out_1[7:0]), nand_23_nl);
    end
  end
  always @(posedge clk) begin
    if ( (modExp_while_and_3 | modExp_while_and_5 | modExp_result_sva_mx0c0 | (~
        mux_121_nl)) & (modExp_result_sva_mx0c0 | modExp_result_and_rgt | modExp_result_and_1_rgt)
        ) begin
      modExp_result_sva <= MUX1HOT_v_64_3_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
          modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, {modExp_result_sva_mx0c0
          , modExp_result_and_rgt , modExp_result_and_1_rgt});
    end
  end
  always @(posedge clk) begin
    if ( mux_126_nl | (fsm_output[7]) ) begin
      modExp_base_1_sva <= MUX1HOT_v_64_4_2(r_sva, modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
          modExp_result_sva, {and_114_nl , r_or_nl , r_or_1_nl , and_dcpl_112});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      tmp_2_lpi_4_dfm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( MUX_s_1_2_2(mux_132_nl, or_263_nl, fsm_output[7]) ) begin
      tmp_2_lpi_4_dfm <= MUX1HOT_v_64_3_2(({1'b0 , operator_64_false_slc_modExp_exp_63_1_3}),
          vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, {and_dcpl_97 , and_135_nl , and_136_nl});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= 1'b0;
    end
    else if ( and_dcpl_75 | and_dcpl_77 | and_dcpl_58 ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((~ (z_out_1[63])), (~
          (z_out[8])), (~ (readslicef_10_1_9(COMP_LOOP_1_acc_nl))), {and_dcpl_75
          , and_dcpl_77 , and_dcpl_58});
    end
  end
  always @(posedge clk) begin
    if ( (mux_167_nl & and_dcpl_123 & (~ (fsm_output[7]))) | and_dcpl_84 ) begin
      COMP_LOOP_1_acc_8_itm <= MUX_v_64_2_2(z_out_3, (z_out_1[63:0]), and_dcpl_84);
    end
  end
  always @(posedge clk) begin
    if ( ~(or_tmp_82 | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[3]) | (fsm_output[7])
        | (fsm_output[6]) | (~ (fsm_output[5]))) ) begin
      COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_36 | and_dcpl_42 | and_dcpl_87 ) begin
      COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm <= MUX1HOT_s_1_3_2((z_out[9]),
          (z_out_1[9]), (z_out[8]), {and_dcpl_36 , and_dcpl_42 , and_dcpl_87});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 12'b000000000000;
    end
    else if ( MUX_s_1_2_2(mux_174_nl, mux_173_nl, fsm_output[5]) ) begin
      COMP_LOOP_acc_1_cse_sva <= z_out_1[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_0_1_sva_1 <= 1'b0;
    end
    else if ( ~((~ mux_177_nl) & and_dcpl_61) ) begin
      modExp_exp_1_0_1_sva_1 <= MUX_s_1_2_2((COMP_LOOP_k_9_1_sva_7_0[0]), modExp_exp_1_1_1_sva,
          and_150_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_6_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_142 ) begin
      modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[5]), modExp_exp_1_7_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[6]), {and_dcpl_128 , and_dcpl_146 , and_dcpl_143});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_5_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_142 ) begin
      modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[4]), modExp_exp_1_6_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[5]), {and_dcpl_128 , and_dcpl_146 , and_dcpl_143});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_4_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_142 ) begin
      modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[3]), modExp_exp_1_5_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[4]), {and_dcpl_128 , and_dcpl_146 , and_dcpl_143});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_3_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_142 ) begin
      modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[2]), modExp_exp_1_4_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[3]), {and_dcpl_128 , and_dcpl_146 , and_dcpl_143});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_2_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_142 ) begin
      modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[1]), modExp_exp_1_3_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[2]), {and_dcpl_128 , and_dcpl_146 , and_dcpl_143});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_12_1_1_sva <= 12'b000000000000;
    end
    else if ( COMP_LOOP_or_1_cse ) begin
      COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out[12:1];
    end
  end
  assign modulo_result_or_nl = and_dcpl_75 | and_dcpl_77 | and_dcpl_81 | and_dcpl_87;
  assign nand_4_nl = ~((fsm_output[4]) & (~ or_tmp_10));
  assign mux_75_nl = MUX_s_1_2_2(nand_4_nl, (fsm_output[4]), fsm_output[3]);
  assign or_99_nl = (fsm_output[4]) | (~((fsm_output[2:0]!=3'b001)));
  assign mux_74_nl = MUX_s_1_2_2(and_tmp_4, or_99_nl, fsm_output[3]);
  assign mux_76_nl = MUX_s_1_2_2(mux_75_nl, mux_74_nl, fsm_output[7]);
  assign or_97_nl = (fsm_output[7]) | mux_tmp_73;
  assign mux_77_nl = MUX_s_1_2_2(mux_76_nl, or_97_nl, fsm_output[6]);
  assign or_228_nl = (fsm_output[4]) | (~ or_tmp_10);
  assign mux_70_nl = MUX_s_1_2_2(and_182_cse, (~ nor_tmp_15), fsm_output[4]);
  assign mux_71_nl = MUX_s_1_2_2(or_228_nl, mux_70_nl, fsm_output[3]);
  assign or_94_nl = (fsm_output[7]) | mux_71_nl;
  assign mux_66_nl = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), fsm_output[1]);
  assign mux_67_nl = MUX_s_1_2_2(or_tmp_68, mux_66_nl, fsm_output[0]);
  assign mux_68_nl = MUX_s_1_2_2(and_161_cse, mux_67_nl, fsm_output[4]);
  assign mux_69_nl = MUX_s_1_2_2((fsm_output[4]), mux_68_nl, fsm_output[3]);
  assign or_91_nl = (fsm_output[7]) | (~ mux_69_nl);
  assign mux_72_nl = MUX_s_1_2_2(or_94_nl, or_91_nl, fsm_output[6]);
  assign mux_78_nl = MUX_s_1_2_2(mux_77_nl, mux_72_nl, fsm_output[5]);
  assign mux_86_nl = MUX_s_1_2_2(and_9_cse, (~ nand_tmp_5), fsm_output[3]);
  assign mux_87_nl = MUX_s_1_2_2(mux_86_nl, mux_tmp_85, fsm_output[7]);
  assign mux_84_nl = MUX_s_1_2_2(and_180_cse, (fsm_output[4]), fsm_output[3]);
  assign nor_69_nl = ~((fsm_output[7]) | (~ mux_84_nl));
  assign mux_88_nl = MUX_s_1_2_2(mux_87_nl, nor_69_nl, fsm_output[6]);
  assign mux_80_nl = MUX_s_1_2_2((~ and_182_cse), or_tmp_82, fsm_output[4]);
  assign mux_81_nl = MUX_s_1_2_2((~ (fsm_output[4])), mux_80_nl, fsm_output[3]);
  assign mux_82_nl = MUX_s_1_2_2(mux_81_nl, or_tmp_81, fsm_output[7]);
  assign or_101_nl = (fsm_output[4]) | (~ (fsm_output[2]));
  assign or_100_nl = (fsm_output[4]) | and_161_cse;
  assign mux_79_nl = MUX_s_1_2_2(or_101_nl, or_100_nl, fsm_output[3]);
  assign or_102_nl = (fsm_output[7]) | mux_79_nl;
  assign mux_83_nl = MUX_s_1_2_2(mux_82_nl, or_102_nl, fsm_output[6]);
  assign mux_89_nl = MUX_s_1_2_2(mux_88_nl, (~ mux_83_nl), fsm_output[5]);
  assign COMP_LOOP_and_3_nl = (~ and_dcpl_104) & and_dcpl_97;
  assign mux_141_nl = MUX_s_1_2_2((~ and_161_cse), or_tmp_10, fsm_output[4]);
  assign mux_142_nl = MUX_s_1_2_2(mux_141_nl, (fsm_output[4]), fsm_output[3]);
  assign or_168_nl = (fsm_output[6]) | mux_142_nl;
  assign nor_47_nl = ~((fsm_output[4]) | (fsm_output[1]) | (fsm_output[2]));
  assign nor_48_nl = ~((fsm_output[0]) | (~ and_182_cse));
  assign mux_138_nl = MUX_s_1_2_2(nor_48_nl, or_tmp_10, fsm_output[4]);
  assign mux_139_nl = MUX_s_1_2_2(nor_47_nl, mux_138_nl, fsm_output[3]);
  assign mux_140_nl = MUX_s_1_2_2(mux_139_nl, mux_tmp_137, fsm_output[6]);
  assign mux_143_nl = MUX_s_1_2_2(or_168_nl, mux_140_nl, fsm_output[5]);
  assign COMP_LOOP_mux1h_12_nl = MUX1HOT_s_1_4_2((operator_66_true_div_cmp_z[0]),
      (tmp_2_lpi_4_dfm[0]), modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva, {COMP_LOOP_and_3_nl
      , and_dcpl_104 , and_dcpl_131 , (~ mux_143_nl)});
  assign mux_147_nl = MUX_s_1_2_2(and_182_cse, (~ or_tmp_10), fsm_output[4]);
  assign mux_148_nl = MUX_s_1_2_2(mux_147_nl, nand_tmp_5, fsm_output[3]);
  assign or_169_nl = (fsm_output[6]) | (~ mux_148_nl);
  assign mux_145_nl = MUX_s_1_2_2(and_dcpl_27, and_9_cse, fsm_output[3]);
  assign mux_144_nl = MUX_s_1_2_2(not_tmp_110, and_180_cse, fsm_output[3]);
  assign mux_146_nl = MUX_s_1_2_2(mux_145_nl, mux_144_nl, fsm_output[6]);
  assign mux_149_nl = MUX_s_1_2_2(or_169_nl, mux_146_nl, fsm_output[5]);
  assign COMP_LOOP_mux1h_19_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0[6]), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_1_sva_7_0[7]), {and_dcpl_128 , and_dcpl_77
      , and_dcpl_142 , and_dcpl_143});
  assign and_156_nl = (fsm_output[4]) & or_tmp_82;
  assign mux_179_nl = MUX_s_1_2_2(not_tmp_110, and_156_nl, fsm_output[3]);
  assign mux_180_nl = MUX_s_1_2_2(mux_179_nl, mux_tmp_137, fsm_output[6]);
  assign and_157_nl = (~ mux_180_nl) & and_dcpl_61;
  assign COMP_LOOP_mux1h_36_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0[7]), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_1_sva_7_0[1]), {and_dcpl_128 , and_dcpl_146
      , and_157_nl , and_dcpl_143});
  assign nor_68_nl = ~((fsm_output[7]) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[1])
      | (fsm_output[2]));
  assign mux_91_nl = MUX_s_1_2_2(nor_68_nl, (fsm_output[7]), fsm_output[6]);
  assign nor_160_nl = ~((fsm_output[6:5]!=2'b10));
  assign nand_26_nl = ~((fsm_output[6:5]==2'b11));
  assign mux_210_nl = MUX_s_1_2_2(nor_160_nl, nand_26_nl, fsm_output[0]);
  assign mux_211_nl = MUX_s_1_2_2(mux_210_nl, or_tmp_210, fsm_output[1]);
  assign or_270_nl = (~ (fsm_output[0])) | (~ (fsm_output[6])) | (fsm_output[5]);
  assign mux_209_nl = MUX_s_1_2_2(or_tmp_210, or_270_nl, fsm_output[1]);
  assign mux_212_nl = MUX_s_1_2_2(mux_211_nl, mux_209_nl, fsm_output[2]);
  assign or_295_nl = (fsm_output[3]) | mux_212_nl;
  assign nor_161_nl = ~((~((fsm_output[3:0]!=4'b1000))) | (fsm_output[6:5]!=2'b00));
  assign mux_213_nl = MUX_s_1_2_2(or_295_nl, nor_161_nl, fsm_output[7]);
  assign nand_25_nl = ~((fsm_output[1]) & (~((~((fsm_output[0]) | (~ (fsm_output[6]))))
      | (fsm_output[5]))));
  assign mux_nl = MUX_s_1_2_2(nand_25_nl, (fsm_output[5]), fsm_output[2]);
  assign or_266_nl = ((fsm_output[2]) & (fsm_output[1]) & (fsm_output[0]) & (~ (fsm_output[6])))
      | (fsm_output[5]);
  assign mux_207_nl = MUX_s_1_2_2(mux_nl, or_266_nl, fsm_output[3]);
  assign nor_164_nl = ~((fsm_output[3]) | (fsm_output[2]) | (fsm_output[6]) | (fsm_output[5]));
  assign mux_208_nl = MUX_s_1_2_2(mux_207_nl, nor_164_nl, fsm_output[7]);
  assign nor_151_nl = ~((fsm_output[3]) | (~ (fsm_output[0])));
  assign nor_152_nl = ~((~ (fsm_output[3])) | (fsm_output[0]) | (fsm_output[5]));
  assign mux_221_nl = MUX_s_1_2_2(nor_151_nl, nor_152_nl, fsm_output[6]);
  assign nor_153_nl = ~((~ (fsm_output[6])) | (~ modExp_exp_1_0_1_sva) | (fsm_output[3])
      | (fsm_output[0]) | (~ (fsm_output[5])));
  assign mux_222_nl = MUX_s_1_2_2(mux_221_nl, nor_153_nl, fsm_output[2]);
  assign nor_154_nl = ~((~((fsm_output[6]) | modExp_exp_1_0_1_sva)) | (fsm_output[3])
      | (fsm_output[0]) | (~ (fsm_output[5])));
  assign or_279_nl = (fsm_output[3]) | (fsm_output[5]);
  assign or_278_nl = (fsm_output[0]) | (~ (fsm_output[5]));
  assign mux_218_nl = MUX_s_1_2_2((fsm_output[5]), or_278_nl, fsm_output[3]);
  assign mux_219_nl = MUX_s_1_2_2(or_279_nl, mux_218_nl, modExp_exp_1_0_1_sva);
  assign nor_156_nl = ~((fsm_output[6]) | mux_219_nl);
  assign mux_220_nl = MUX_s_1_2_2(nor_154_nl, nor_156_nl, fsm_output[2]);
  assign mux_223_nl = MUX_s_1_2_2(mux_222_nl, mux_220_nl, fsm_output[1]);
  assign nor_157_nl = ~((~ (fsm_output[3])) | (fsm_output[0]) | (~ (fsm_output[5])));
  assign and_299_nl = (fsm_output[3]) & (fsm_output[0]) & (fsm_output[5]);
  assign mux_216_nl = MUX_s_1_2_2(nor_157_nl, and_299_nl, fsm_output[6]);
  assign and_298_nl = (fsm_output[2]) & mux_216_nl;
  assign and_300_nl = (fsm_output[6]) & modExp_exp_1_0_1_sva & (fsm_output[3]) &
      (fsm_output[0]) & (fsm_output[5]);
  assign nor_158_nl = ~((fsm_output[6]) | (~ (fsm_output[3])) | (~ (fsm_output[0]))
      | (fsm_output[5]));
  assign mux_215_nl = MUX_s_1_2_2(and_300_nl, nor_158_nl, fsm_output[2]);
  assign mux_217_nl = MUX_s_1_2_2(and_298_nl, mux_215_nl, fsm_output[1]);
  assign mux_224_nl = MUX_s_1_2_2(mux_223_nl, mux_217_nl, fsm_output[4]);
  assign nor_159_nl = ~((fsm_output[6:0]!=7'b0001001));
  assign nor_119_nl = ~((fsm_output[7]) | (~ and_dcpl_96));
  assign nor_120_nl = ~((~ (fsm_output[7])) | (fsm_output[3]) | (fsm_output[4]) |
      (~ (fsm_output[0])) | (fsm_output[2]));
  assign mux_113_nl = MUX_s_1_2_2(nor_119_nl, nor_120_nl, fsm_output[5]);
  assign nand_23_nl = ~(mux_113_nl & (fsm_output[1]) & (~ (fsm_output[6])));
  assign nor_148_nl = ~((~ (fsm_output[6])) | (fsm_output[7]) | (~ (fsm_output[2]))
      | (~ (fsm_output[5])) | (fsm_output[0]) | (~ and_dcpl_78));
  assign mux_226_nl = MUX_s_1_2_2(nor_150_cse, and_dcpl_78, fsm_output[0]);
  assign or_291_nl = (~ (fsm_output[2])) | (fsm_output[5]) | (~ mux_226_nl);
  assign or_288_nl = (fsm_output[2]) | (~ (fsm_output[5])) | (~ (fsm_output[0]))
      | (fsm_output[3]) | (fsm_output[4]);
  assign mux_227_nl = MUX_s_1_2_2(or_291_nl, or_288_nl, fsm_output[7]);
  assign nor_149_nl = ~((fsm_output[6]) | mux_227_nl);
  assign mux_119_nl = MUX_s_1_2_2(and_161_cse, or_tmp_113, fsm_output[4]);
  assign nor_62_nl = ~((fsm_output[7]) | (fsm_output[3]) | mux_119_nl);
  assign mux_120_nl = MUX_s_1_2_2(nor_62_nl, (fsm_output[7]), fsm_output[6]);
  assign mux_121_nl = MUX_s_1_2_2(mux_120_nl, mux_tmp_90, fsm_output[5]);
  assign and_114_nl = and_182_cse & and_dcpl_25 & and_dcpl_24;
  assign r_or_nl = ((~ (modulo_result_rem_cmp_z[63])) & and_117_m1c) | (and_dcpl_118
      & and_dcpl_115 & (fsm_output[5]) & (~ (modulo_result_rem_cmp_z[63])));
  assign r_or_1_nl = ((modulo_result_rem_cmp_z[63]) & and_117_m1c) | (and_dcpl_118
      & and_dcpl_115 & (fsm_output[5]) & (modulo_result_rem_cmp_z[63]));
  assign or_146_nl = (fsm_output[6]) | (fsm_output[3]) | (fsm_output[4]) | (~ and_161_cse);
  assign or_25_nl = (fsm_output[4:0]!=5'b00010);
  assign nor_58_nl = ~((fsm_output[4]) | (~ or_tmp_113));
  assign or_142_nl = (~ (fsm_output[4])) | (fsm_output[2]);
  assign mux_124_nl = MUX_s_1_2_2(nor_58_nl, or_142_nl, fsm_output[3]);
  assign mux_125_nl = MUX_s_1_2_2(or_25_nl, mux_124_nl, fsm_output[6]);
  assign mux_126_nl = MUX_s_1_2_2(or_146_nl, mux_125_nl, fsm_output[5]);
  assign nor_54_nl = ~((VEC_LOOP_j_sva_11_0[0]) | (fsm_output[1:0]!=2'b01));
  assign nor_55_nl = ~((COMP_LOOP_acc_1_cse_sva[0]) | (fsm_output[1:0]!=2'b10));
  assign mux_134_nl = MUX_s_1_2_2(nor_54_nl, nor_55_nl, fsm_output[6]);
  assign and_135_nl = mux_134_nl & and_dcpl_125;
  assign nor_52_nl = ~((~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[1:0]!=2'b01));
  assign nor_53_nl = ~((~ (COMP_LOOP_acc_1_cse_sva[0])) | (fsm_output[1:0]!=2'b10));
  assign mux_135_nl = MUX_s_1_2_2(nor_52_nl, nor_53_nl, fsm_output[6]);
  assign and_136_nl = mux_135_nl & and_dcpl_125;
  assign or_155_nl = (fsm_output[3]) | and_166_cse;
  assign mux_129_nl = MUX_s_1_2_2((fsm_output[3]), or_155_nl, fsm_output[2]);
  assign mux_130_nl = MUX_s_1_2_2((~ mux_129_nl), (fsm_output[3]), fsm_output[6]);
  assign nor_140_nl = ~((fsm_output[3:1]!=3'b000));
  assign nor_141_nl = ~((fsm_output[3:2]!=2'b00) | and_166_cse);
  assign mux_128_nl = MUX_s_1_2_2(nor_140_nl, nor_141_nl, fsm_output[6]);
  assign mux_131_nl = MUX_s_1_2_2(mux_130_nl, mux_128_nl, fsm_output[5]);
  assign nor_142_nl = ~((fsm_output[5]) | (~((fsm_output[6]) | ((fsm_output[3:0]==4'b1111)))));
  assign mux_132_nl = MUX_s_1_2_2(mux_131_nl, nor_142_nl, fsm_output[4]);
  assign and_131_nl = (fsm_output[3]) & or_241_cse;
  assign mux_127_nl = MUX_s_1_2_2(and_131_nl, (fsm_output[3]), fsm_output[2]);
  assign or_263_nl = (fsm_output[6:4]!=3'b000) | mux_127_nl;
  assign nl_COMP_LOOP_1_acc_nl = ({(z_out_1[8:0]) , 1'b0}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))})
      + 10'b0000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[9:0];
  assign nor_38_nl = ~((fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[0]) |
      (fsm_output[1]));
  assign nor_39_nl = ~((fsm_output[3]) | (~((fsm_output[1:0]==2'b11))));
  assign mux_167_nl = MUX_s_1_2_2(nor_38_nl, nor_39_nl, fsm_output[5]);
  assign nand_6_nl = ~((fsm_output[7]) & (~ mux_tmp_85));
  assign mux_174_nl = MUX_s_1_2_2(nand_6_nl, (fsm_output[7]), fsm_output[6]);
  assign mux_173_nl = MUX_s_1_2_2(or_tmp_88, (fsm_output[7]), fsm_output[6]);
  assign and_150_nl = and_dcpl_40 & xor_dcpl & and_dcpl_79;
  assign or_29_nl = (fsm_output[4]) | nor_88_cse;
  assign or_27_nl = (fsm_output[4]) | and_182_cse;
  assign mux_17_nl = MUX_s_1_2_2(or_29_nl, or_27_nl, fsm_output[3]);
  assign mux_177_nl = MUX_s_1_2_2(mux_17_nl, mux_tmp_137, fsm_output[6]);
  assign operator_64_false_1_mux_1_nl = MUX_v_52_2_2((tmp_2_lpi_4_dfm[63:12]), (p_sva[63:12]),
      and_dcpl_169);
  assign operator_64_false_1_nor_2_nl = ~(and_dcpl_173 | and_dcpl_178 | and_dcpl_181);
  assign operator_64_false_1_and_2_nl = MUX_v_52_2_2(52'b0000000000000000000000000000000000000000000000000000,
      operator_64_false_1_mux_1_nl, operator_64_false_1_nor_2_nl);
  assign operator_64_false_1_operator_64_false_1_or_1_nl = MUX_v_52_2_2(operator_64_false_1_and_2_nl,
      52'b1111111111111111111111111111111111111111111111111111, operator_64_false_1_or_1_itm);
  assign operator_64_false_1_mux1h_5_nl = MUX1HOT_v_2_3_2((tmp_2_lpi_4_dfm[11:10]),
      (p_sva[11:10]), (VEC_LOOP_j_sva_11_0[11:10]), {nor_129_cse , and_dcpl_169 ,
      and_dcpl_181});
  assign operator_64_false_1_nor_3_nl = ~(and_dcpl_173 | and_dcpl_178);
  assign operator_64_false_1_and_3_nl = MUX_v_2_2_2(2'b00, operator_64_false_1_mux1h_5_nl,
      operator_64_false_1_nor_3_nl);
  assign operator_64_false_1_or_11_nl = MUX_v_2_2_2(operator_64_false_1_and_3_nl,
      2'b11, operator_64_false_1_or_1_itm);
  assign operator_64_false_1_mux1h_6_nl = MUX1HOT_v_2_5_2(({1'b1 , (~ (COMP_LOOP_k_9_1_sva_7_0[7]))}),
      (tmp_2_lpi_4_dfm[9:8]), (p_sva[9:8]), (z_out_2[9:8]), (VEC_LOOP_j_sva_11_0[9:8]),
      {and_dcpl_155 , nor_129_cse , and_dcpl_169 , operator_64_false_1_or_5_itm ,
      and_dcpl_181});
  assign operator_64_false_1_or_13_nl = and_dcpl_160 | and_dcpl_182;
  assign operator_64_false_1_or_12_nl = MUX_v_2_2_2(operator_64_false_1_mux1h_6_nl,
      2'b11, operator_64_false_1_or_13_nl);
  assign operator_64_false_1_mux1h_7_nl = MUX1HOT_v_8_7_2(({(~ (COMP_LOOP_k_9_1_sva_7_0[6:0]))
      , 1'b1}), ({(~ modExp_exp_1_7_1_sva) , (~ modExp_exp_1_6_1_sva) , (~ modExp_exp_1_5_1_sva)
      , (~ modExp_exp_1_4_1_sva) , (~ modExp_exp_1_3_1_sva) , (~ modExp_exp_1_2_1_sva)
      , (~ modExp_exp_1_1_1_sva) , (~ modExp_exp_1_0_1_sva_1)}), (tmp_2_lpi_4_dfm[7:0]),
      (p_sva[7:0]), (z_out_2[7:0]), (VEC_LOOP_j_sva_11_0[7:0]), ({(~ modExp_exp_1_1_1_sva)
      , (~ modExp_exp_1_7_1_sva) , (~ modExp_exp_1_6_1_sva) , (~ modExp_exp_1_5_1_sva)
      , (~ modExp_exp_1_4_1_sva) , (~ modExp_exp_1_3_1_sva) , (~ modExp_exp_1_2_1_sva)
      , (~ modExp_exp_1_0_1_sva_1)}), {and_dcpl_155 , and_dcpl_160 , nor_129_cse
      , and_dcpl_169 , operator_64_false_1_or_5_itm , and_dcpl_181 , and_dcpl_182});
  assign operator_64_false_1_mux1h_8_nl = MUX1HOT_v_64_4_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
      modExp_base_1_sva_mx1, ({52'b0000000000000000000000000000000000000000000000000000
      , VEC_LOOP_j_sva_11_0}), ({54'b000000000000000000000000000000000000000000000000000000
      , STAGE_LOOP_lshift_psp_sva}), {operator_64_false_1_or_1_itm , nor_129_cse
      , operator_64_false_1_or_5_itm , and_dcpl_181});
  assign operator_64_false_1_or_14_nl = MUX_v_64_2_2(operator_64_false_1_mux1h_8_nl,
      64'b1111111111111111111111111111111111111111111111111111111111111111, and_dcpl_169);
  assign nl_z_out = conv_u2u_64_65({operator_64_false_1_operator_64_false_1_or_1_nl
      , operator_64_false_1_or_11_nl , operator_64_false_1_or_12_nl , operator_64_false_1_mux1h_7_nl})
      + conv_s2u_64_65(operator_64_false_1_or_14_nl);
  assign z_out = nl_z_out[64:0];
  assign COMP_LOOP_COMP_LOOP_or_3_nl = (~(nor_129_cse | and_dcpl_194 | and_dcpl_200
      | and_dcpl_212)) | and_dcpl_206 | and_dcpl_214;
  assign COMP_LOOP_mux_43_nl = MUX_s_1_2_2((tmp_2_lpi_4_dfm[63]), (~ (operator_66_true_div_cmp_z[63])),
      and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_or_4_nl = (COMP_LOOP_mux_43_nl & (~(and_dcpl_194 | and_dcpl_200
      | and_dcpl_212))) | and_dcpl_206;
  assign COMP_LOOP_mux1h_63_nl = MUX1HOT_v_63_6_2((tmp_2_lpi_4_dfm[62:0]), ({54'b000000000000000000000000000000000000000000000000000001
      , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))}), ({51'b000000000000000000000000000000000000000000000000000
      , VEC_LOOP_j_sva_11_0}), (~ (operator_64_false_acc_mut_63_0[62:0])), ({55'b0000000000000000000000000000000000000000000000000000000
      , COMP_LOOP_k_9_1_sva_7_0}), (~ (operator_66_true_div_cmp_z[62:0])), {nor_129_cse
      , and_dcpl_194 , and_dcpl_200 , and_dcpl_206 , and_dcpl_212 , and_dcpl_214});
  assign COMP_LOOP_or_14_nl = (~(and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214))
      | nor_129_cse | and_dcpl_194;
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_55_nl = ~((modExp_base_1_sva_mx1[63])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_56_nl = ~((modExp_base_1_sva_mx1[62])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_57_nl = ~((modExp_base_1_sva_mx1[61])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_58_nl = ~((modExp_base_1_sva_mx1[60])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_59_nl = ~((modExp_base_1_sva_mx1[59])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_60_nl = ~((modExp_base_1_sva_mx1[58])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_61_nl = ~((modExp_base_1_sva_mx1[57])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_62_nl = ~((modExp_base_1_sva_mx1[56])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_63_nl = ~((modExp_base_1_sva_mx1[55])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_64_nl = ~((modExp_base_1_sva_mx1[54])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_65_nl = ~((modExp_base_1_sva_mx1[53])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_66_nl = ~((modExp_base_1_sva_mx1[52])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_67_nl = ~((modExp_base_1_sva_mx1[51])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_68_nl = ~((modExp_base_1_sva_mx1[50])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_69_nl = ~((modExp_base_1_sva_mx1[49])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_70_nl = ~((modExp_base_1_sva_mx1[48])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_71_nl = ~((modExp_base_1_sva_mx1[47])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_72_nl = ~((modExp_base_1_sva_mx1[46])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_73_nl = ~((modExp_base_1_sva_mx1[45])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_74_nl = ~((modExp_base_1_sva_mx1[44])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_75_nl = ~((modExp_base_1_sva_mx1[43])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_76_nl = ~((modExp_base_1_sva_mx1[42])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_77_nl = ~((modExp_base_1_sva_mx1[41])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_78_nl = ~((modExp_base_1_sva_mx1[40])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_79_nl = ~((modExp_base_1_sva_mx1[39])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_80_nl = ~((modExp_base_1_sva_mx1[38])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_81_nl = ~((modExp_base_1_sva_mx1[37])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_82_nl = ~((modExp_base_1_sva_mx1[36])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_83_nl = ~((modExp_base_1_sva_mx1[35])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_84_nl = ~((modExp_base_1_sva_mx1[34])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_85_nl = ~((modExp_base_1_sva_mx1[33])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_86_nl = ~((modExp_base_1_sva_mx1[32])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_87_nl = ~((modExp_base_1_sva_mx1[31])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_88_nl = ~((modExp_base_1_sva_mx1[30])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_89_nl = ~((modExp_base_1_sva_mx1[29])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_90_nl = ~((modExp_base_1_sva_mx1[28])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_91_nl = ~((modExp_base_1_sva_mx1[27])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_92_nl = ~((modExp_base_1_sva_mx1[26])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_93_nl = ~((modExp_base_1_sva_mx1[25])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_94_nl = ~((modExp_base_1_sva_mx1[24])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_95_nl = ~((modExp_base_1_sva_mx1[23])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_96_nl = ~((modExp_base_1_sva_mx1[22])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_97_nl = ~((modExp_base_1_sva_mx1[21])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_98_nl = ~((modExp_base_1_sva_mx1[20])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_99_nl = ~((modExp_base_1_sva_mx1[19])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_100_nl = ~((modExp_base_1_sva_mx1[18])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_101_nl = ~((modExp_base_1_sva_mx1[17])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_102_nl = ~((modExp_base_1_sva_mx1[16])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_103_nl = ~((modExp_base_1_sva_mx1[15])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_104_nl = ~((modExp_base_1_sva_mx1[14])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_105_nl = ~((modExp_base_1_sva_mx1[13])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_106_nl = ~((modExp_base_1_sva_mx1[12])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_107_nl = ~((modExp_base_1_sva_mx1[11])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_108_nl = ~((modExp_base_1_sva_mx1[10])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_109_nl = ~((modExp_base_1_sva_mx1[9])
      | and_dcpl_194 | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_or_15_nl = and_dcpl_194 | and_dcpl_200;
  assign COMP_LOOP_COMP_LOOP_mux_3_nl = MUX_v_8_2_2((~ (modExp_base_1_sva_mx1[8:1])),
      COMP_LOOP_k_9_1_sva_7_0, COMP_LOOP_or_15_nl);
  assign COMP_LOOP_nor_8_nl = ~(and_dcpl_206 | and_dcpl_212 | and_dcpl_214);
  assign COMP_LOOP_and_8_nl = MUX_v_8_2_2(8'b00000000, COMP_LOOP_COMP_LOOP_mux_3_nl,
      COMP_LOOP_nor_8_nl);
  assign COMP_LOOP_COMP_LOOP_or_5_nl = (~ (modExp_base_1_sva_mx1[0])) | and_dcpl_194
      | and_dcpl_200 | and_dcpl_206 | and_dcpl_212 | and_dcpl_214;
  assign nl_acc_1_nl = ({COMP_LOOP_COMP_LOOP_or_3_nl , COMP_LOOP_COMP_LOOP_or_4_nl
      , COMP_LOOP_mux1h_63_nl , COMP_LOOP_or_14_nl}) + conv_s2u_65_66({COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_55_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_56_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_57_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_58_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_59_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_60_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_61_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_62_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_63_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_64_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_65_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_66_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_67_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_68_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_69_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_70_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_71_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_72_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_73_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_74_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_75_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_76_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_77_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_78_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_79_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_80_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_81_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_82_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_83_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_84_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_85_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_86_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_87_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_88_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_89_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_90_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_91_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_92_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_93_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_94_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_95_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_96_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_97_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_98_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_99_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_100_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_101_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_102_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_103_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_104_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_105_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_106_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_107_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_108_nl , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_109_nl
      , COMP_LOOP_and_8_nl , COMP_LOOP_COMP_LOOP_or_5_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[65:0];
  assign z_out_1 = readslicef_66_65_1(acc_1_nl);
  assign and_302_nl = (fsm_output==8'b01111100);
  assign nl_z_out_2 = STAGE_LOOP_lshift_psp_sva + conv_u2u_9_10({COMP_LOOP_k_9_1_sva_7_0
      , and_302_nl});
  assign z_out_2 = nl_z_out_2[9:0];
  assign and_303_nl = (fsm_output[4:1]==4'b0011) & and_dcpl_201 & (~ (fsm_output[6]))
      & (fsm_output[0]);
  assign modExp_while_if_or_1_nl = and_dcpl_240 | ((~(mux_164_cse | (fsm_output[4])))
      & and_dcpl_23 & (fsm_output[5]) & (~ (fsm_output[0])));
  assign nor_168_nl = ~((fsm_output[6]) | (fsm_output[5]) | (~ (fsm_output[3])) |
      (fsm_output[1]));
  assign nor_169_nl = ~((~ (fsm_output[5])) | (fsm_output[3]) | (~ (fsm_output[1])));
  assign mux_231_nl = MUX_s_1_2_2(nor_168_nl, nor_169_nl, fsm_output[0]);
  assign and_305_nl = mux_231_nl & (~((fsm_output[4]) | (fsm_output[2]) | (fsm_output[7])));
  assign modExp_while_if_mux1h_1_nl = MUX1HOT_v_64_3_2(modExp_result_sva, operator_64_false_acc_mut_63_0,
      modExp_base_1_sva, {and_303_nl , modExp_while_if_or_1_nl , and_305_nl});
  assign modExp_while_if_and_4_nl = (~ (COMP_LOOP_acc_10_cse_12_1_1_sva[0])) & and_dcpl_240;
  assign modExp_while_if_and_5_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[0]) & and_dcpl_240;
  assign modExp_while_if_modExp_while_if_mux1h_1_nl = MUX1HOT_v_64_3_2(modExp_base_1_sva,
      vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, {(~ and_dcpl_240) , modExp_while_if_and_4_nl
      , modExp_while_if_and_5_nl});
  assign nl_z_out_3 = modExp_while_if_mux1h_1_nl * modExp_while_if_modExp_while_if_mux1h_1_nl;
  assign z_out_3 = nl_z_out_3[63:0];

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


  function automatic [10:0] MUX1HOT_v_11_5_2;
    input [10:0] input_4;
    input [10:0] input_3;
    input [10:0] input_2;
    input [10:0] input_1;
    input [10:0] input_0;
    input [4:0] sel;
    reg [10:0] result;
  begin
    result = input_0 & {11{sel[0]}};
    result = result | ( input_1 & {11{sel[1]}});
    result = result | ( input_2 & {11{sel[2]}});
    result = result | ( input_3 & {11{sel[3]}});
    result = result | ( input_4 & {11{sel[4]}});
    MUX1HOT_v_11_5_2 = result;
  end
  endfunction


  function automatic [1:0] MUX1HOT_v_2_3_2;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [2:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    MUX1HOT_v_2_3_2 = result;
  end
  endfunction


  function automatic [1:0] MUX1HOT_v_2_5_2;
    input [1:0] input_4;
    input [1:0] input_3;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [4:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    result = result | ( input_3 & {2{sel[3]}});
    result = result | ( input_4 & {2{sel[4]}});
    MUX1HOT_v_2_5_2 = result;
  end
  endfunction


  function automatic [62:0] MUX1HOT_v_63_6_2;
    input [62:0] input_5;
    input [62:0] input_4;
    input [62:0] input_3;
    input [62:0] input_2;
    input [62:0] input_1;
    input [62:0] input_0;
    input [5:0] sel;
    reg [62:0] result;
  begin
    result = input_0 & {63{sel[0]}};
    result = result | ( input_1 & {63{sel[1]}});
    result = result | ( input_2 & {63{sel[2]}});
    result = result | ( input_3 & {63{sel[3]}});
    result = result | ( input_4 & {63{sel[4]}});
    result = result | ( input_5 & {63{sel[5]}});
    MUX1HOT_v_63_6_2 = result;
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


  function automatic [64:0] MUX1HOT_v_65_3_2;
    input [64:0] input_2;
    input [64:0] input_1;
    input [64:0] input_0;
    input [2:0] sel;
    reg [64:0] result;
  begin
    result = input_0 & {65{sel[0]}};
    result = result | ( input_1 & {65{sel[1]}});
    result = result | ( input_2 & {65{sel[2]}});
    MUX1HOT_v_65_3_2 = result;
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


  function automatic [51:0] MUX_v_52_2_2;
    input [51:0] input_0;
    input [51:0] input_1;
    input [0:0] sel;
    reg [51:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_52_2_2 = result;
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


  function automatic [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
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


  function automatic [64:0] readslicef_66_65_1;
    input [65:0] vector;
    reg [65:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_66_65_1 = tmp[64:0];
  end
  endfunction


  function automatic [64:0] conv_s2u_64_65 ;
    input [63:0]  vector ;
  begin
    conv_s2u_64_65 = {vector[63], vector};
  end
  endfunction


  function automatic [65:0] conv_s2u_65_66 ;
    input [64:0]  vector ;
  begin
    conv_s2u_65_66 = {vector[64], vector};
  end
  endfunction


  function automatic [10:0] conv_u2u_8_11 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_11 = {{3{1'b0}}, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
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
//  Design Unit:    inPlaceNTT_DIT
// ------------------------------------------------------------------


module inPlaceNTT_DIT (
  clk, rst, vec_rsc_0_0_adra, vec_rsc_0_0_da, vec_rsc_0_0_wea, vec_rsc_0_0_qa, vec_rsc_triosy_0_0_lz,
      vec_rsc_0_1_adra, vec_rsc_0_1_da, vec_rsc_0_1_wea, vec_rsc_0_1_qa, vec_rsc_triosy_0_1_lz,
      p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz
);
  input clk;
  input rst;
  output [10:0] vec_rsc_0_0_adra;
  output [63:0] vec_rsc_0_0_da;
  output vec_rsc_0_0_wea;
  input [63:0] vec_rsc_0_0_qa;
  output vec_rsc_triosy_0_0_lz;
  output [10:0] vec_rsc_0_1_adra;
  output [63:0] vec_rsc_0_1_da;
  output vec_rsc_0_1_wea;
  input [63:0] vec_rsc_0_1_qa;
  output vec_rsc_triosy_0_1_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;


  // Interconnect Declarations
  wire [63:0] vec_rsc_0_0_i_qa_d;
  wire vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_1_i_qa_d;
  wire vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [10:0] vec_rsc_0_0_i_adra_d_iff;
  wire [63:0] vec_rsc_0_0_i_da_d_iff;
  wire vec_rsc_0_0_i_wea_d_iff;
  wire vec_rsc_0_1_i_wea_d_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
      vec_rsc_0_0_i (
      .qa(vec_rsc_0_0_qa),
      .wea(vec_rsc_0_0_wea),
      .da(vec_rsc_0_0_da),
      .adra(vec_rsc_0_0_adra),
      .adra_d(vec_rsc_0_0_i_adra_d_iff),
      .da_d(vec_rsc_0_0_i_da_d_iff),
      .qa_d(vec_rsc_0_0_i_qa_d),
      .wea_d(vec_rsc_0_0_i_wea_d_iff),
      .rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_0_i_wea_d_iff)
    );
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
      vec_rsc_0_1_i (
      .qa(vec_rsc_0_1_qa),
      .wea(vec_rsc_0_1_wea),
      .da(vec_rsc_0_1_da),
      .adra(vec_rsc_0_1_adra),
      .adra_d(vec_rsc_0_0_i_adra_d_iff),
      .da_d(vec_rsc_0_0_i_da_d_iff),
      .qa_d(vec_rsc_0_1_i_qa_d),
      .wea_d(vec_rsc_0_1_i_wea_d_iff),
      .rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_1_i_wea_d_iff)
    );
  inPlaceNTT_DIT_core inPlaceNTT_DIT_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_dat(r_rsc_dat),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .vec_rsc_0_0_i_qa_d(vec_rsc_0_0_i_qa_d),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_1_i_qa_d(vec_rsc_0_1_i_qa_d),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_0_i_adra_d_pff(vec_rsc_0_0_i_adra_d_iff),
      .vec_rsc_0_0_i_da_d_pff(vec_rsc_0_0_i_da_d_iff),
      .vec_rsc_0_0_i_wea_d_pff(vec_rsc_0_0_i_wea_d_iff),
      .vec_rsc_0_1_i_wea_d_pff(vec_rsc_0_1_i_wea_d_iff)
    );
endmodule



