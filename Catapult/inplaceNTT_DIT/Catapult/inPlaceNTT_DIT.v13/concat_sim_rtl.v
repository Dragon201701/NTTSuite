
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
//  Generated date: Mon May 17 21:39:20 2021
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
      COMP_LOOP_C_80_tr0, COMP_LOOP_3_modExp_1_while_C_24_tr0, COMP_LOOP_C_120_tr0,
      COMP_LOOP_4_modExp_1_while_C_24_tr0, COMP_LOOP_C_160_tr0, VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_6_tr0
);
  input clk;
  input rst;
  output [8:0] fsm_output;
  reg [8:0] fsm_output;
  input STAGE_LOOP_C_5_tr0;
  input modExp_while_C_24_tr0;
  input COMP_LOOP_C_1_tr0;
  input COMP_LOOP_1_modExp_1_while_C_24_tr0;
  input COMP_LOOP_C_40_tr0;
  input COMP_LOOP_2_modExp_1_while_C_24_tr0;
  input COMP_LOOP_C_80_tr0;
  input COMP_LOOP_3_modExp_1_while_C_24_tr0;
  input COMP_LOOP_C_120_tr0;
  input COMP_LOOP_4_modExp_1_while_C_24_tr0;
  input COMP_LOOP_C_160_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_6_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  parameter
    main_C_0 = 9'd0,
    STAGE_LOOP_C_0 = 9'd1,
    STAGE_LOOP_C_1 = 9'd2,
    STAGE_LOOP_C_2 = 9'd3,
    STAGE_LOOP_C_3 = 9'd4,
    STAGE_LOOP_C_4 = 9'd5,
    STAGE_LOOP_C_5 = 9'd6,
    modExp_while_C_0 = 9'd7,
    modExp_while_C_1 = 9'd8,
    modExp_while_C_2 = 9'd9,
    modExp_while_C_3 = 9'd10,
    modExp_while_C_4 = 9'd11,
    modExp_while_C_5 = 9'd12,
    modExp_while_C_6 = 9'd13,
    modExp_while_C_7 = 9'd14,
    modExp_while_C_8 = 9'd15,
    modExp_while_C_9 = 9'd16,
    modExp_while_C_10 = 9'd17,
    modExp_while_C_11 = 9'd18,
    modExp_while_C_12 = 9'd19,
    modExp_while_C_13 = 9'd20,
    modExp_while_C_14 = 9'd21,
    modExp_while_C_15 = 9'd22,
    modExp_while_C_16 = 9'd23,
    modExp_while_C_17 = 9'd24,
    modExp_while_C_18 = 9'd25,
    modExp_while_C_19 = 9'd26,
    modExp_while_C_20 = 9'd27,
    modExp_while_C_21 = 9'd28,
    modExp_while_C_22 = 9'd29,
    modExp_while_C_23 = 9'd30,
    modExp_while_C_24 = 9'd31,
    COMP_LOOP_C_0 = 9'd32,
    COMP_LOOP_C_1 = 9'd33,
    COMP_LOOP_1_modExp_1_while_C_0 = 9'd34,
    COMP_LOOP_1_modExp_1_while_C_1 = 9'd35,
    COMP_LOOP_1_modExp_1_while_C_2 = 9'd36,
    COMP_LOOP_1_modExp_1_while_C_3 = 9'd37,
    COMP_LOOP_1_modExp_1_while_C_4 = 9'd38,
    COMP_LOOP_1_modExp_1_while_C_5 = 9'd39,
    COMP_LOOP_1_modExp_1_while_C_6 = 9'd40,
    COMP_LOOP_1_modExp_1_while_C_7 = 9'd41,
    COMP_LOOP_1_modExp_1_while_C_8 = 9'd42,
    COMP_LOOP_1_modExp_1_while_C_9 = 9'd43,
    COMP_LOOP_1_modExp_1_while_C_10 = 9'd44,
    COMP_LOOP_1_modExp_1_while_C_11 = 9'd45,
    COMP_LOOP_1_modExp_1_while_C_12 = 9'd46,
    COMP_LOOP_1_modExp_1_while_C_13 = 9'd47,
    COMP_LOOP_1_modExp_1_while_C_14 = 9'd48,
    COMP_LOOP_1_modExp_1_while_C_15 = 9'd49,
    COMP_LOOP_1_modExp_1_while_C_16 = 9'd50,
    COMP_LOOP_1_modExp_1_while_C_17 = 9'd51,
    COMP_LOOP_1_modExp_1_while_C_18 = 9'd52,
    COMP_LOOP_1_modExp_1_while_C_19 = 9'd53,
    COMP_LOOP_1_modExp_1_while_C_20 = 9'd54,
    COMP_LOOP_1_modExp_1_while_C_21 = 9'd55,
    COMP_LOOP_1_modExp_1_while_C_22 = 9'd56,
    COMP_LOOP_1_modExp_1_while_C_23 = 9'd57,
    COMP_LOOP_1_modExp_1_while_C_24 = 9'd58,
    COMP_LOOP_C_2 = 9'd59,
    COMP_LOOP_C_3 = 9'd60,
    COMP_LOOP_C_4 = 9'd61,
    COMP_LOOP_C_5 = 9'd62,
    COMP_LOOP_C_6 = 9'd63,
    COMP_LOOP_C_7 = 9'd64,
    COMP_LOOP_C_8 = 9'd65,
    COMP_LOOP_C_9 = 9'd66,
    COMP_LOOP_C_10 = 9'd67,
    COMP_LOOP_C_11 = 9'd68,
    COMP_LOOP_C_12 = 9'd69,
    COMP_LOOP_C_13 = 9'd70,
    COMP_LOOP_C_14 = 9'd71,
    COMP_LOOP_C_15 = 9'd72,
    COMP_LOOP_C_16 = 9'd73,
    COMP_LOOP_C_17 = 9'd74,
    COMP_LOOP_C_18 = 9'd75,
    COMP_LOOP_C_19 = 9'd76,
    COMP_LOOP_C_20 = 9'd77,
    COMP_LOOP_C_21 = 9'd78,
    COMP_LOOP_C_22 = 9'd79,
    COMP_LOOP_C_23 = 9'd80,
    COMP_LOOP_C_24 = 9'd81,
    COMP_LOOP_C_25 = 9'd82,
    COMP_LOOP_C_26 = 9'd83,
    COMP_LOOP_C_27 = 9'd84,
    COMP_LOOP_C_28 = 9'd85,
    COMP_LOOP_C_29 = 9'd86,
    COMP_LOOP_C_30 = 9'd87,
    COMP_LOOP_C_31 = 9'd88,
    COMP_LOOP_C_32 = 9'd89,
    COMP_LOOP_C_33 = 9'd90,
    COMP_LOOP_C_34 = 9'd91,
    COMP_LOOP_C_35 = 9'd92,
    COMP_LOOP_C_36 = 9'd93,
    COMP_LOOP_C_37 = 9'd94,
    COMP_LOOP_C_38 = 9'd95,
    COMP_LOOP_C_39 = 9'd96,
    COMP_LOOP_C_40 = 9'd97,
    COMP_LOOP_C_41 = 9'd98,
    COMP_LOOP_2_modExp_1_while_C_0 = 9'd99,
    COMP_LOOP_2_modExp_1_while_C_1 = 9'd100,
    COMP_LOOP_2_modExp_1_while_C_2 = 9'd101,
    COMP_LOOP_2_modExp_1_while_C_3 = 9'd102,
    COMP_LOOP_2_modExp_1_while_C_4 = 9'd103,
    COMP_LOOP_2_modExp_1_while_C_5 = 9'd104,
    COMP_LOOP_2_modExp_1_while_C_6 = 9'd105,
    COMP_LOOP_2_modExp_1_while_C_7 = 9'd106,
    COMP_LOOP_2_modExp_1_while_C_8 = 9'd107,
    COMP_LOOP_2_modExp_1_while_C_9 = 9'd108,
    COMP_LOOP_2_modExp_1_while_C_10 = 9'd109,
    COMP_LOOP_2_modExp_1_while_C_11 = 9'd110,
    COMP_LOOP_2_modExp_1_while_C_12 = 9'd111,
    COMP_LOOP_2_modExp_1_while_C_13 = 9'd112,
    COMP_LOOP_2_modExp_1_while_C_14 = 9'd113,
    COMP_LOOP_2_modExp_1_while_C_15 = 9'd114,
    COMP_LOOP_2_modExp_1_while_C_16 = 9'd115,
    COMP_LOOP_2_modExp_1_while_C_17 = 9'd116,
    COMP_LOOP_2_modExp_1_while_C_18 = 9'd117,
    COMP_LOOP_2_modExp_1_while_C_19 = 9'd118,
    COMP_LOOP_2_modExp_1_while_C_20 = 9'd119,
    COMP_LOOP_2_modExp_1_while_C_21 = 9'd120,
    COMP_LOOP_2_modExp_1_while_C_22 = 9'd121,
    COMP_LOOP_2_modExp_1_while_C_23 = 9'd122,
    COMP_LOOP_2_modExp_1_while_C_24 = 9'd123,
    COMP_LOOP_C_42 = 9'd124,
    COMP_LOOP_C_43 = 9'd125,
    COMP_LOOP_C_44 = 9'd126,
    COMP_LOOP_C_45 = 9'd127,
    COMP_LOOP_C_46 = 9'd128,
    COMP_LOOP_C_47 = 9'd129,
    COMP_LOOP_C_48 = 9'd130,
    COMP_LOOP_C_49 = 9'd131,
    COMP_LOOP_C_50 = 9'd132,
    COMP_LOOP_C_51 = 9'd133,
    COMP_LOOP_C_52 = 9'd134,
    COMP_LOOP_C_53 = 9'd135,
    COMP_LOOP_C_54 = 9'd136,
    COMP_LOOP_C_55 = 9'd137,
    COMP_LOOP_C_56 = 9'd138,
    COMP_LOOP_C_57 = 9'd139,
    COMP_LOOP_C_58 = 9'd140,
    COMP_LOOP_C_59 = 9'd141,
    COMP_LOOP_C_60 = 9'd142,
    COMP_LOOP_C_61 = 9'd143,
    COMP_LOOP_C_62 = 9'd144,
    COMP_LOOP_C_63 = 9'd145,
    COMP_LOOP_C_64 = 9'd146,
    COMP_LOOP_C_65 = 9'd147,
    COMP_LOOP_C_66 = 9'd148,
    COMP_LOOP_C_67 = 9'd149,
    COMP_LOOP_C_68 = 9'd150,
    COMP_LOOP_C_69 = 9'd151,
    COMP_LOOP_C_70 = 9'd152,
    COMP_LOOP_C_71 = 9'd153,
    COMP_LOOP_C_72 = 9'd154,
    COMP_LOOP_C_73 = 9'd155,
    COMP_LOOP_C_74 = 9'd156,
    COMP_LOOP_C_75 = 9'd157,
    COMP_LOOP_C_76 = 9'd158,
    COMP_LOOP_C_77 = 9'd159,
    COMP_LOOP_C_78 = 9'd160,
    COMP_LOOP_C_79 = 9'd161,
    COMP_LOOP_C_80 = 9'd162,
    COMP_LOOP_C_81 = 9'd163,
    COMP_LOOP_3_modExp_1_while_C_0 = 9'd164,
    COMP_LOOP_3_modExp_1_while_C_1 = 9'd165,
    COMP_LOOP_3_modExp_1_while_C_2 = 9'd166,
    COMP_LOOP_3_modExp_1_while_C_3 = 9'd167,
    COMP_LOOP_3_modExp_1_while_C_4 = 9'd168,
    COMP_LOOP_3_modExp_1_while_C_5 = 9'd169,
    COMP_LOOP_3_modExp_1_while_C_6 = 9'd170,
    COMP_LOOP_3_modExp_1_while_C_7 = 9'd171,
    COMP_LOOP_3_modExp_1_while_C_8 = 9'd172,
    COMP_LOOP_3_modExp_1_while_C_9 = 9'd173,
    COMP_LOOP_3_modExp_1_while_C_10 = 9'd174,
    COMP_LOOP_3_modExp_1_while_C_11 = 9'd175,
    COMP_LOOP_3_modExp_1_while_C_12 = 9'd176,
    COMP_LOOP_3_modExp_1_while_C_13 = 9'd177,
    COMP_LOOP_3_modExp_1_while_C_14 = 9'd178,
    COMP_LOOP_3_modExp_1_while_C_15 = 9'd179,
    COMP_LOOP_3_modExp_1_while_C_16 = 9'd180,
    COMP_LOOP_3_modExp_1_while_C_17 = 9'd181,
    COMP_LOOP_3_modExp_1_while_C_18 = 9'd182,
    COMP_LOOP_3_modExp_1_while_C_19 = 9'd183,
    COMP_LOOP_3_modExp_1_while_C_20 = 9'd184,
    COMP_LOOP_3_modExp_1_while_C_21 = 9'd185,
    COMP_LOOP_3_modExp_1_while_C_22 = 9'd186,
    COMP_LOOP_3_modExp_1_while_C_23 = 9'd187,
    COMP_LOOP_3_modExp_1_while_C_24 = 9'd188,
    COMP_LOOP_C_82 = 9'd189,
    COMP_LOOP_C_83 = 9'd190,
    COMP_LOOP_C_84 = 9'd191,
    COMP_LOOP_C_85 = 9'd192,
    COMP_LOOP_C_86 = 9'd193,
    COMP_LOOP_C_87 = 9'd194,
    COMP_LOOP_C_88 = 9'd195,
    COMP_LOOP_C_89 = 9'd196,
    COMP_LOOP_C_90 = 9'd197,
    COMP_LOOP_C_91 = 9'd198,
    COMP_LOOP_C_92 = 9'd199,
    COMP_LOOP_C_93 = 9'd200,
    COMP_LOOP_C_94 = 9'd201,
    COMP_LOOP_C_95 = 9'd202,
    COMP_LOOP_C_96 = 9'd203,
    COMP_LOOP_C_97 = 9'd204,
    COMP_LOOP_C_98 = 9'd205,
    COMP_LOOP_C_99 = 9'd206,
    COMP_LOOP_C_100 = 9'd207,
    COMP_LOOP_C_101 = 9'd208,
    COMP_LOOP_C_102 = 9'd209,
    COMP_LOOP_C_103 = 9'd210,
    COMP_LOOP_C_104 = 9'd211,
    COMP_LOOP_C_105 = 9'd212,
    COMP_LOOP_C_106 = 9'd213,
    COMP_LOOP_C_107 = 9'd214,
    COMP_LOOP_C_108 = 9'd215,
    COMP_LOOP_C_109 = 9'd216,
    COMP_LOOP_C_110 = 9'd217,
    COMP_LOOP_C_111 = 9'd218,
    COMP_LOOP_C_112 = 9'd219,
    COMP_LOOP_C_113 = 9'd220,
    COMP_LOOP_C_114 = 9'd221,
    COMP_LOOP_C_115 = 9'd222,
    COMP_LOOP_C_116 = 9'd223,
    COMP_LOOP_C_117 = 9'd224,
    COMP_LOOP_C_118 = 9'd225,
    COMP_LOOP_C_119 = 9'd226,
    COMP_LOOP_C_120 = 9'd227,
    COMP_LOOP_C_121 = 9'd228,
    COMP_LOOP_4_modExp_1_while_C_0 = 9'd229,
    COMP_LOOP_4_modExp_1_while_C_1 = 9'd230,
    COMP_LOOP_4_modExp_1_while_C_2 = 9'd231,
    COMP_LOOP_4_modExp_1_while_C_3 = 9'd232,
    COMP_LOOP_4_modExp_1_while_C_4 = 9'd233,
    COMP_LOOP_4_modExp_1_while_C_5 = 9'd234,
    COMP_LOOP_4_modExp_1_while_C_6 = 9'd235,
    COMP_LOOP_4_modExp_1_while_C_7 = 9'd236,
    COMP_LOOP_4_modExp_1_while_C_8 = 9'd237,
    COMP_LOOP_4_modExp_1_while_C_9 = 9'd238,
    COMP_LOOP_4_modExp_1_while_C_10 = 9'd239,
    COMP_LOOP_4_modExp_1_while_C_11 = 9'd240,
    COMP_LOOP_4_modExp_1_while_C_12 = 9'd241,
    COMP_LOOP_4_modExp_1_while_C_13 = 9'd242,
    COMP_LOOP_4_modExp_1_while_C_14 = 9'd243,
    COMP_LOOP_4_modExp_1_while_C_15 = 9'd244,
    COMP_LOOP_4_modExp_1_while_C_16 = 9'd245,
    COMP_LOOP_4_modExp_1_while_C_17 = 9'd246,
    COMP_LOOP_4_modExp_1_while_C_18 = 9'd247,
    COMP_LOOP_4_modExp_1_while_C_19 = 9'd248,
    COMP_LOOP_4_modExp_1_while_C_20 = 9'd249,
    COMP_LOOP_4_modExp_1_while_C_21 = 9'd250,
    COMP_LOOP_4_modExp_1_while_C_22 = 9'd251,
    COMP_LOOP_4_modExp_1_while_C_23 = 9'd252,
    COMP_LOOP_4_modExp_1_while_C_24 = 9'd253,
    COMP_LOOP_C_122 = 9'd254,
    COMP_LOOP_C_123 = 9'd255,
    COMP_LOOP_C_124 = 9'd256,
    COMP_LOOP_C_125 = 9'd257,
    COMP_LOOP_C_126 = 9'd258,
    COMP_LOOP_C_127 = 9'd259,
    COMP_LOOP_C_128 = 9'd260,
    COMP_LOOP_C_129 = 9'd261,
    COMP_LOOP_C_130 = 9'd262,
    COMP_LOOP_C_131 = 9'd263,
    COMP_LOOP_C_132 = 9'd264,
    COMP_LOOP_C_133 = 9'd265,
    COMP_LOOP_C_134 = 9'd266,
    COMP_LOOP_C_135 = 9'd267,
    COMP_LOOP_C_136 = 9'd268,
    COMP_LOOP_C_137 = 9'd269,
    COMP_LOOP_C_138 = 9'd270,
    COMP_LOOP_C_139 = 9'd271,
    COMP_LOOP_C_140 = 9'd272,
    COMP_LOOP_C_141 = 9'd273,
    COMP_LOOP_C_142 = 9'd274,
    COMP_LOOP_C_143 = 9'd275,
    COMP_LOOP_C_144 = 9'd276,
    COMP_LOOP_C_145 = 9'd277,
    COMP_LOOP_C_146 = 9'd278,
    COMP_LOOP_C_147 = 9'd279,
    COMP_LOOP_C_148 = 9'd280,
    COMP_LOOP_C_149 = 9'd281,
    COMP_LOOP_C_150 = 9'd282,
    COMP_LOOP_C_151 = 9'd283,
    COMP_LOOP_C_152 = 9'd284,
    COMP_LOOP_C_153 = 9'd285,
    COMP_LOOP_C_154 = 9'd286,
    COMP_LOOP_C_155 = 9'd287,
    COMP_LOOP_C_156 = 9'd288,
    COMP_LOOP_C_157 = 9'd289,
    COMP_LOOP_C_158 = 9'd290,
    COMP_LOOP_C_159 = 9'd291,
    COMP_LOOP_C_160 = 9'd292,
    VEC_LOOP_C_0 = 9'd293,
    STAGE_LOOP_C_6 = 9'd294,
    main_C_1 = 9'd295;

  reg [8:0] state_var;
  reg [8:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIT_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 9'b000000001;
        state_var_NS = STAGE_LOOP_C_1;
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 9'b000000010;
        state_var_NS = STAGE_LOOP_C_2;
      end
      STAGE_LOOP_C_2 : begin
        fsm_output = 9'b000000011;
        state_var_NS = STAGE_LOOP_C_3;
      end
      STAGE_LOOP_C_3 : begin
        fsm_output = 9'b000000100;
        state_var_NS = STAGE_LOOP_C_4;
      end
      STAGE_LOOP_C_4 : begin
        fsm_output = 9'b000000101;
        state_var_NS = STAGE_LOOP_C_5;
      end
      STAGE_LOOP_C_5 : begin
        fsm_output = 9'b000000110;
        if ( STAGE_LOOP_C_5_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      modExp_while_C_0 : begin
        fsm_output = 9'b000000111;
        state_var_NS = modExp_while_C_1;
      end
      modExp_while_C_1 : begin
        fsm_output = 9'b000001000;
        state_var_NS = modExp_while_C_2;
      end
      modExp_while_C_2 : begin
        fsm_output = 9'b000001001;
        state_var_NS = modExp_while_C_3;
      end
      modExp_while_C_3 : begin
        fsm_output = 9'b000001010;
        state_var_NS = modExp_while_C_4;
      end
      modExp_while_C_4 : begin
        fsm_output = 9'b000001011;
        state_var_NS = modExp_while_C_5;
      end
      modExp_while_C_5 : begin
        fsm_output = 9'b000001100;
        state_var_NS = modExp_while_C_6;
      end
      modExp_while_C_6 : begin
        fsm_output = 9'b000001101;
        state_var_NS = modExp_while_C_7;
      end
      modExp_while_C_7 : begin
        fsm_output = 9'b000001110;
        state_var_NS = modExp_while_C_8;
      end
      modExp_while_C_8 : begin
        fsm_output = 9'b000001111;
        state_var_NS = modExp_while_C_9;
      end
      modExp_while_C_9 : begin
        fsm_output = 9'b000010000;
        state_var_NS = modExp_while_C_10;
      end
      modExp_while_C_10 : begin
        fsm_output = 9'b000010001;
        state_var_NS = modExp_while_C_11;
      end
      modExp_while_C_11 : begin
        fsm_output = 9'b000010010;
        state_var_NS = modExp_while_C_12;
      end
      modExp_while_C_12 : begin
        fsm_output = 9'b000010011;
        state_var_NS = modExp_while_C_13;
      end
      modExp_while_C_13 : begin
        fsm_output = 9'b000010100;
        state_var_NS = modExp_while_C_14;
      end
      modExp_while_C_14 : begin
        fsm_output = 9'b000010101;
        state_var_NS = modExp_while_C_15;
      end
      modExp_while_C_15 : begin
        fsm_output = 9'b000010110;
        state_var_NS = modExp_while_C_16;
      end
      modExp_while_C_16 : begin
        fsm_output = 9'b000010111;
        state_var_NS = modExp_while_C_17;
      end
      modExp_while_C_17 : begin
        fsm_output = 9'b000011000;
        state_var_NS = modExp_while_C_18;
      end
      modExp_while_C_18 : begin
        fsm_output = 9'b000011001;
        state_var_NS = modExp_while_C_19;
      end
      modExp_while_C_19 : begin
        fsm_output = 9'b000011010;
        state_var_NS = modExp_while_C_20;
      end
      modExp_while_C_20 : begin
        fsm_output = 9'b000011011;
        state_var_NS = modExp_while_C_21;
      end
      modExp_while_C_21 : begin
        fsm_output = 9'b000011100;
        state_var_NS = modExp_while_C_22;
      end
      modExp_while_C_22 : begin
        fsm_output = 9'b000011101;
        state_var_NS = modExp_while_C_23;
      end
      modExp_while_C_23 : begin
        fsm_output = 9'b000011110;
        state_var_NS = modExp_while_C_24;
      end
      modExp_while_C_24 : begin
        fsm_output = 9'b000011111;
        if ( modExp_while_C_24_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 9'b000100000;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 9'b000100001;
        if ( COMP_LOOP_C_1_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_1_modExp_1_while_C_0 : begin
        fsm_output = 9'b000100010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_1;
      end
      COMP_LOOP_1_modExp_1_while_C_1 : begin
        fsm_output = 9'b000100011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_2;
      end
      COMP_LOOP_1_modExp_1_while_C_2 : begin
        fsm_output = 9'b000100100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_3;
      end
      COMP_LOOP_1_modExp_1_while_C_3 : begin
        fsm_output = 9'b000100101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_4;
      end
      COMP_LOOP_1_modExp_1_while_C_4 : begin
        fsm_output = 9'b000100110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_5;
      end
      COMP_LOOP_1_modExp_1_while_C_5 : begin
        fsm_output = 9'b000100111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_6;
      end
      COMP_LOOP_1_modExp_1_while_C_6 : begin
        fsm_output = 9'b000101000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_7;
      end
      COMP_LOOP_1_modExp_1_while_C_7 : begin
        fsm_output = 9'b000101001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_8;
      end
      COMP_LOOP_1_modExp_1_while_C_8 : begin
        fsm_output = 9'b000101010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_9;
      end
      COMP_LOOP_1_modExp_1_while_C_9 : begin
        fsm_output = 9'b000101011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_10;
      end
      COMP_LOOP_1_modExp_1_while_C_10 : begin
        fsm_output = 9'b000101100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_11;
      end
      COMP_LOOP_1_modExp_1_while_C_11 : begin
        fsm_output = 9'b000101101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_12;
      end
      COMP_LOOP_1_modExp_1_while_C_12 : begin
        fsm_output = 9'b000101110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_13;
      end
      COMP_LOOP_1_modExp_1_while_C_13 : begin
        fsm_output = 9'b000101111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_14;
      end
      COMP_LOOP_1_modExp_1_while_C_14 : begin
        fsm_output = 9'b000110000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_15;
      end
      COMP_LOOP_1_modExp_1_while_C_15 : begin
        fsm_output = 9'b000110001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_16;
      end
      COMP_LOOP_1_modExp_1_while_C_16 : begin
        fsm_output = 9'b000110010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_17;
      end
      COMP_LOOP_1_modExp_1_while_C_17 : begin
        fsm_output = 9'b000110011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_18;
      end
      COMP_LOOP_1_modExp_1_while_C_18 : begin
        fsm_output = 9'b000110100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_19;
      end
      COMP_LOOP_1_modExp_1_while_C_19 : begin
        fsm_output = 9'b000110101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_20;
      end
      COMP_LOOP_1_modExp_1_while_C_20 : begin
        fsm_output = 9'b000110110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_21;
      end
      COMP_LOOP_1_modExp_1_while_C_21 : begin
        fsm_output = 9'b000110111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_22;
      end
      COMP_LOOP_1_modExp_1_while_C_22 : begin
        fsm_output = 9'b000111000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_23;
      end
      COMP_LOOP_1_modExp_1_while_C_23 : begin
        fsm_output = 9'b000111001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_24;
      end
      COMP_LOOP_1_modExp_1_while_C_24 : begin
        fsm_output = 9'b000111010;
        if ( COMP_LOOP_1_modExp_1_while_C_24_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 9'b000111011;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 9'b000111100;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 9'b000111101;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 9'b000111110;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 9'b000111111;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 9'b001000000;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 9'b001000001;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 9'b001000010;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 9'b001000011;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 9'b001000100;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 9'b001000101;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 9'b001000110;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 9'b001000111;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 9'b001001000;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 9'b001001001;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 9'b001001010;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 9'b001001011;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 9'b001001100;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 9'b001001101;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 9'b001001110;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 9'b001001111;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 9'b001010000;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 9'b001010001;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 9'b001010010;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 9'b001010011;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 9'b001010100;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 9'b001010101;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 9'b001010110;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 9'b001010111;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 9'b001011000;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 9'b001011001;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 9'b001011010;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 9'b001011011;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 9'b001011100;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 9'b001011101;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 9'b001011110;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 9'b001011111;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 9'b001100000;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 9'b001100001;
        if ( COMP_LOOP_C_40_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_41;
        end
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 9'b001100010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
      end
      COMP_LOOP_2_modExp_1_while_C_0 : begin
        fsm_output = 9'b001100011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_1;
      end
      COMP_LOOP_2_modExp_1_while_C_1 : begin
        fsm_output = 9'b001100100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_2;
      end
      COMP_LOOP_2_modExp_1_while_C_2 : begin
        fsm_output = 9'b001100101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_3;
      end
      COMP_LOOP_2_modExp_1_while_C_3 : begin
        fsm_output = 9'b001100110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_4;
      end
      COMP_LOOP_2_modExp_1_while_C_4 : begin
        fsm_output = 9'b001100111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_5;
      end
      COMP_LOOP_2_modExp_1_while_C_5 : begin
        fsm_output = 9'b001101000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_6;
      end
      COMP_LOOP_2_modExp_1_while_C_6 : begin
        fsm_output = 9'b001101001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_7;
      end
      COMP_LOOP_2_modExp_1_while_C_7 : begin
        fsm_output = 9'b001101010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_8;
      end
      COMP_LOOP_2_modExp_1_while_C_8 : begin
        fsm_output = 9'b001101011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_9;
      end
      COMP_LOOP_2_modExp_1_while_C_9 : begin
        fsm_output = 9'b001101100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_10;
      end
      COMP_LOOP_2_modExp_1_while_C_10 : begin
        fsm_output = 9'b001101101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_11;
      end
      COMP_LOOP_2_modExp_1_while_C_11 : begin
        fsm_output = 9'b001101110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_12;
      end
      COMP_LOOP_2_modExp_1_while_C_12 : begin
        fsm_output = 9'b001101111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_13;
      end
      COMP_LOOP_2_modExp_1_while_C_13 : begin
        fsm_output = 9'b001110000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_14;
      end
      COMP_LOOP_2_modExp_1_while_C_14 : begin
        fsm_output = 9'b001110001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_15;
      end
      COMP_LOOP_2_modExp_1_while_C_15 : begin
        fsm_output = 9'b001110010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_16;
      end
      COMP_LOOP_2_modExp_1_while_C_16 : begin
        fsm_output = 9'b001110011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_17;
      end
      COMP_LOOP_2_modExp_1_while_C_17 : begin
        fsm_output = 9'b001110100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_18;
      end
      COMP_LOOP_2_modExp_1_while_C_18 : begin
        fsm_output = 9'b001110101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_19;
      end
      COMP_LOOP_2_modExp_1_while_C_19 : begin
        fsm_output = 9'b001110110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_20;
      end
      COMP_LOOP_2_modExp_1_while_C_20 : begin
        fsm_output = 9'b001110111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_21;
      end
      COMP_LOOP_2_modExp_1_while_C_21 : begin
        fsm_output = 9'b001111000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_22;
      end
      COMP_LOOP_2_modExp_1_while_C_22 : begin
        fsm_output = 9'b001111001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_23;
      end
      COMP_LOOP_2_modExp_1_while_C_23 : begin
        fsm_output = 9'b001111010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_24;
      end
      COMP_LOOP_2_modExp_1_while_C_24 : begin
        fsm_output = 9'b001111011;
        if ( COMP_LOOP_2_modExp_1_while_C_24_tr0 ) begin
          state_var_NS = COMP_LOOP_C_42;
        end
        else begin
          state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 9'b001111100;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 9'b001111101;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 9'b001111110;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 9'b001111111;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 9'b010000000;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 9'b010000001;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 9'b010000010;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 9'b010000011;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 9'b010000100;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 9'b010000101;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 9'b010000110;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 9'b010000111;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 9'b010001000;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 9'b010001001;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 9'b010001010;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 9'b010001011;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 9'b010001100;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 9'b010001101;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 9'b010001110;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 9'b010001111;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 9'b010010000;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 9'b010010001;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 9'b010010010;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 9'b010010011;
        state_var_NS = COMP_LOOP_C_66;
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 9'b010010100;
        state_var_NS = COMP_LOOP_C_67;
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 9'b010010101;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 9'b010010110;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 9'b010010111;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 9'b010011000;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 9'b010011001;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 9'b010011010;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 9'b010011011;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 9'b010011100;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 9'b010011101;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 9'b010011110;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 9'b010011111;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 9'b010100000;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 9'b010100001;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 9'b010100010;
        if ( COMP_LOOP_C_80_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_81;
        end
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 9'b010100011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_0;
      end
      COMP_LOOP_3_modExp_1_while_C_0 : begin
        fsm_output = 9'b010100100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_1;
      end
      COMP_LOOP_3_modExp_1_while_C_1 : begin
        fsm_output = 9'b010100101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_2;
      end
      COMP_LOOP_3_modExp_1_while_C_2 : begin
        fsm_output = 9'b010100110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_3;
      end
      COMP_LOOP_3_modExp_1_while_C_3 : begin
        fsm_output = 9'b010100111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_4;
      end
      COMP_LOOP_3_modExp_1_while_C_4 : begin
        fsm_output = 9'b010101000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_5;
      end
      COMP_LOOP_3_modExp_1_while_C_5 : begin
        fsm_output = 9'b010101001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_6;
      end
      COMP_LOOP_3_modExp_1_while_C_6 : begin
        fsm_output = 9'b010101010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_7;
      end
      COMP_LOOP_3_modExp_1_while_C_7 : begin
        fsm_output = 9'b010101011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_8;
      end
      COMP_LOOP_3_modExp_1_while_C_8 : begin
        fsm_output = 9'b010101100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_9;
      end
      COMP_LOOP_3_modExp_1_while_C_9 : begin
        fsm_output = 9'b010101101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_10;
      end
      COMP_LOOP_3_modExp_1_while_C_10 : begin
        fsm_output = 9'b010101110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_11;
      end
      COMP_LOOP_3_modExp_1_while_C_11 : begin
        fsm_output = 9'b010101111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_12;
      end
      COMP_LOOP_3_modExp_1_while_C_12 : begin
        fsm_output = 9'b010110000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_13;
      end
      COMP_LOOP_3_modExp_1_while_C_13 : begin
        fsm_output = 9'b010110001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_14;
      end
      COMP_LOOP_3_modExp_1_while_C_14 : begin
        fsm_output = 9'b010110010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_15;
      end
      COMP_LOOP_3_modExp_1_while_C_15 : begin
        fsm_output = 9'b010110011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_16;
      end
      COMP_LOOP_3_modExp_1_while_C_16 : begin
        fsm_output = 9'b010110100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_17;
      end
      COMP_LOOP_3_modExp_1_while_C_17 : begin
        fsm_output = 9'b010110101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_18;
      end
      COMP_LOOP_3_modExp_1_while_C_18 : begin
        fsm_output = 9'b010110110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_19;
      end
      COMP_LOOP_3_modExp_1_while_C_19 : begin
        fsm_output = 9'b010110111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_20;
      end
      COMP_LOOP_3_modExp_1_while_C_20 : begin
        fsm_output = 9'b010111000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_21;
      end
      COMP_LOOP_3_modExp_1_while_C_21 : begin
        fsm_output = 9'b010111001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_22;
      end
      COMP_LOOP_3_modExp_1_while_C_22 : begin
        fsm_output = 9'b010111010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_23;
      end
      COMP_LOOP_3_modExp_1_while_C_23 : begin
        fsm_output = 9'b010111011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_24;
      end
      COMP_LOOP_3_modExp_1_while_C_24 : begin
        fsm_output = 9'b010111100;
        if ( COMP_LOOP_3_modExp_1_while_C_24_tr0 ) begin
          state_var_NS = COMP_LOOP_C_82;
        end
        else begin
          state_var_NS = COMP_LOOP_3_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 9'b010111101;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 9'b010111110;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 9'b010111111;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 9'b011000000;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 9'b011000001;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 9'b011000010;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 9'b011000011;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 9'b011000100;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 9'b011000101;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 9'b011000110;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 9'b011000111;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 9'b011001000;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 9'b011001001;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 9'b011001010;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 9'b011001011;
        state_var_NS = COMP_LOOP_C_97;
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 9'b011001100;
        state_var_NS = COMP_LOOP_C_98;
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 9'b011001101;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 9'b011001110;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 9'b011001111;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 9'b011010000;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 9'b011010001;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 9'b011010010;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 9'b011010011;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 9'b011010100;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 9'b011010101;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 9'b011010110;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 9'b011010111;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 9'b011011000;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 9'b011011001;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 9'b011011010;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 9'b011011011;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 9'b011011100;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 9'b011011101;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 9'b011011110;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 9'b011011111;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 9'b011100000;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 9'b011100001;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 9'b011100010;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 9'b011100011;
        if ( COMP_LOOP_C_120_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_121;
        end
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 9'b011100100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_0;
      end
      COMP_LOOP_4_modExp_1_while_C_0 : begin
        fsm_output = 9'b011100101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_1;
      end
      COMP_LOOP_4_modExp_1_while_C_1 : begin
        fsm_output = 9'b011100110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_2;
      end
      COMP_LOOP_4_modExp_1_while_C_2 : begin
        fsm_output = 9'b011100111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_3;
      end
      COMP_LOOP_4_modExp_1_while_C_3 : begin
        fsm_output = 9'b011101000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_4;
      end
      COMP_LOOP_4_modExp_1_while_C_4 : begin
        fsm_output = 9'b011101001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_5;
      end
      COMP_LOOP_4_modExp_1_while_C_5 : begin
        fsm_output = 9'b011101010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_6;
      end
      COMP_LOOP_4_modExp_1_while_C_6 : begin
        fsm_output = 9'b011101011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_7;
      end
      COMP_LOOP_4_modExp_1_while_C_7 : begin
        fsm_output = 9'b011101100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_8;
      end
      COMP_LOOP_4_modExp_1_while_C_8 : begin
        fsm_output = 9'b011101101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_9;
      end
      COMP_LOOP_4_modExp_1_while_C_9 : begin
        fsm_output = 9'b011101110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_10;
      end
      COMP_LOOP_4_modExp_1_while_C_10 : begin
        fsm_output = 9'b011101111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_11;
      end
      COMP_LOOP_4_modExp_1_while_C_11 : begin
        fsm_output = 9'b011110000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_12;
      end
      COMP_LOOP_4_modExp_1_while_C_12 : begin
        fsm_output = 9'b011110001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_13;
      end
      COMP_LOOP_4_modExp_1_while_C_13 : begin
        fsm_output = 9'b011110010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_14;
      end
      COMP_LOOP_4_modExp_1_while_C_14 : begin
        fsm_output = 9'b011110011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_15;
      end
      COMP_LOOP_4_modExp_1_while_C_15 : begin
        fsm_output = 9'b011110100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_16;
      end
      COMP_LOOP_4_modExp_1_while_C_16 : begin
        fsm_output = 9'b011110101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_17;
      end
      COMP_LOOP_4_modExp_1_while_C_17 : begin
        fsm_output = 9'b011110110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_18;
      end
      COMP_LOOP_4_modExp_1_while_C_18 : begin
        fsm_output = 9'b011110111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_19;
      end
      COMP_LOOP_4_modExp_1_while_C_19 : begin
        fsm_output = 9'b011111000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_20;
      end
      COMP_LOOP_4_modExp_1_while_C_20 : begin
        fsm_output = 9'b011111001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_21;
      end
      COMP_LOOP_4_modExp_1_while_C_21 : begin
        fsm_output = 9'b011111010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_22;
      end
      COMP_LOOP_4_modExp_1_while_C_22 : begin
        fsm_output = 9'b011111011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_23;
      end
      COMP_LOOP_4_modExp_1_while_C_23 : begin
        fsm_output = 9'b011111100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_24;
      end
      COMP_LOOP_4_modExp_1_while_C_24 : begin
        fsm_output = 9'b011111101;
        if ( COMP_LOOP_4_modExp_1_while_C_24_tr0 ) begin
          state_var_NS = COMP_LOOP_C_122;
        end
        else begin
          state_var_NS = COMP_LOOP_4_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 9'b011111110;
        state_var_NS = COMP_LOOP_C_123;
      end
      COMP_LOOP_C_123 : begin
        fsm_output = 9'b011111111;
        state_var_NS = COMP_LOOP_C_124;
      end
      COMP_LOOP_C_124 : begin
        fsm_output = 9'b100000000;
        state_var_NS = COMP_LOOP_C_125;
      end
      COMP_LOOP_C_125 : begin
        fsm_output = 9'b100000001;
        state_var_NS = COMP_LOOP_C_126;
      end
      COMP_LOOP_C_126 : begin
        fsm_output = 9'b100000010;
        state_var_NS = COMP_LOOP_C_127;
      end
      COMP_LOOP_C_127 : begin
        fsm_output = 9'b100000011;
        state_var_NS = COMP_LOOP_C_128;
      end
      COMP_LOOP_C_128 : begin
        fsm_output = 9'b100000100;
        state_var_NS = COMP_LOOP_C_129;
      end
      COMP_LOOP_C_129 : begin
        fsm_output = 9'b100000101;
        state_var_NS = COMP_LOOP_C_130;
      end
      COMP_LOOP_C_130 : begin
        fsm_output = 9'b100000110;
        state_var_NS = COMP_LOOP_C_131;
      end
      COMP_LOOP_C_131 : begin
        fsm_output = 9'b100000111;
        state_var_NS = COMP_LOOP_C_132;
      end
      COMP_LOOP_C_132 : begin
        fsm_output = 9'b100001000;
        state_var_NS = COMP_LOOP_C_133;
      end
      COMP_LOOP_C_133 : begin
        fsm_output = 9'b100001001;
        state_var_NS = COMP_LOOP_C_134;
      end
      COMP_LOOP_C_134 : begin
        fsm_output = 9'b100001010;
        state_var_NS = COMP_LOOP_C_135;
      end
      COMP_LOOP_C_135 : begin
        fsm_output = 9'b100001011;
        state_var_NS = COMP_LOOP_C_136;
      end
      COMP_LOOP_C_136 : begin
        fsm_output = 9'b100001100;
        state_var_NS = COMP_LOOP_C_137;
      end
      COMP_LOOP_C_137 : begin
        fsm_output = 9'b100001101;
        state_var_NS = COMP_LOOP_C_138;
      end
      COMP_LOOP_C_138 : begin
        fsm_output = 9'b100001110;
        state_var_NS = COMP_LOOP_C_139;
      end
      COMP_LOOP_C_139 : begin
        fsm_output = 9'b100001111;
        state_var_NS = COMP_LOOP_C_140;
      end
      COMP_LOOP_C_140 : begin
        fsm_output = 9'b100010000;
        state_var_NS = COMP_LOOP_C_141;
      end
      COMP_LOOP_C_141 : begin
        fsm_output = 9'b100010001;
        state_var_NS = COMP_LOOP_C_142;
      end
      COMP_LOOP_C_142 : begin
        fsm_output = 9'b100010010;
        state_var_NS = COMP_LOOP_C_143;
      end
      COMP_LOOP_C_143 : begin
        fsm_output = 9'b100010011;
        state_var_NS = COMP_LOOP_C_144;
      end
      COMP_LOOP_C_144 : begin
        fsm_output = 9'b100010100;
        state_var_NS = COMP_LOOP_C_145;
      end
      COMP_LOOP_C_145 : begin
        fsm_output = 9'b100010101;
        state_var_NS = COMP_LOOP_C_146;
      end
      COMP_LOOP_C_146 : begin
        fsm_output = 9'b100010110;
        state_var_NS = COMP_LOOP_C_147;
      end
      COMP_LOOP_C_147 : begin
        fsm_output = 9'b100010111;
        state_var_NS = COMP_LOOP_C_148;
      end
      COMP_LOOP_C_148 : begin
        fsm_output = 9'b100011000;
        state_var_NS = COMP_LOOP_C_149;
      end
      COMP_LOOP_C_149 : begin
        fsm_output = 9'b100011001;
        state_var_NS = COMP_LOOP_C_150;
      end
      COMP_LOOP_C_150 : begin
        fsm_output = 9'b100011010;
        state_var_NS = COMP_LOOP_C_151;
      end
      COMP_LOOP_C_151 : begin
        fsm_output = 9'b100011011;
        state_var_NS = COMP_LOOP_C_152;
      end
      COMP_LOOP_C_152 : begin
        fsm_output = 9'b100011100;
        state_var_NS = COMP_LOOP_C_153;
      end
      COMP_LOOP_C_153 : begin
        fsm_output = 9'b100011101;
        state_var_NS = COMP_LOOP_C_154;
      end
      COMP_LOOP_C_154 : begin
        fsm_output = 9'b100011110;
        state_var_NS = COMP_LOOP_C_155;
      end
      COMP_LOOP_C_155 : begin
        fsm_output = 9'b100011111;
        state_var_NS = COMP_LOOP_C_156;
      end
      COMP_LOOP_C_156 : begin
        fsm_output = 9'b100100000;
        state_var_NS = COMP_LOOP_C_157;
      end
      COMP_LOOP_C_157 : begin
        fsm_output = 9'b100100001;
        state_var_NS = COMP_LOOP_C_158;
      end
      COMP_LOOP_C_158 : begin
        fsm_output = 9'b100100010;
        state_var_NS = COMP_LOOP_C_159;
      end
      COMP_LOOP_C_159 : begin
        fsm_output = 9'b100100011;
        state_var_NS = COMP_LOOP_C_160;
      end
      COMP_LOOP_C_160 : begin
        fsm_output = 9'b100100100;
        if ( COMP_LOOP_C_160_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 9'b100100101;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_6;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_6 : begin
        fsm_output = 9'b100100110;
        if ( STAGE_LOOP_C_6_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 9'b100100111;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 9'b000000000;
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
      r_rsc_dat, r_rsc_triosy_lz, vec_rsc_0_0_i_adra_d, vec_rsc_0_0_i_qa_d, vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_adra_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
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
  output [10:0] vec_rsc_0_0_i_adra_d;
  input [63:0] vec_rsc_0_0_i_qa_d;
  output vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [10:0] vec_rsc_0_1_i_adra_d;
  input [63:0] vec_rsc_0_1_i_qa_d;
  output vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
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
  wire [8:0] fsm_output;
  wire and_dcpl;
  wire nor_tmp_8;
  wire mux_tmp_43;
  wire or_tmp_47;
  wire not_tmp_50;
  wire or_tmp_69;
  wire and_dcpl_25;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire and_dcpl_34;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_43;
  wire and_dcpl_44;
  wire and_dcpl_45;
  wire and_dcpl_46;
  wire and_dcpl_47;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire mux_tmp_99;
  wire not_tmp_73;
  wire and_dcpl_58;
  wire and_dcpl_62;
  wire and_dcpl_67;
  wire and_dcpl_70;
  wire and_dcpl_74;
  wire and_dcpl_75;
  wire and_dcpl_77;
  wire mux_tmp_106;
  wire and_dcpl_83;
  wire and_dcpl_86;
  wire and_dcpl_87;
  wire or_tmp_135;
  wire and_tmp_7;
  wire or_tmp_142;
  wire mux_tmp_139;
  wire or_tmp_143;
  wire or_tmp_144;
  wire mux_tmp_141;
  wire or_tmp_149;
  wire and_tmp_8;
  wire mux_tmp_145;
  wire or_tmp_154;
  wire or_tmp_156;
  wire mux_tmp_151;
  wire or_tmp_159;
  wire and_dcpl_88;
  wire and_dcpl_89;
  wire xor_dcpl;
  wire and_dcpl_91;
  wire and_dcpl_95;
  wire mux_tmp_164;
  wire nand_tmp_10;
  wire or_tmp_162;
  wire mux_tmp_165;
  wire and_dcpl_96;
  wire and_dcpl_99;
  wire mux_tmp_166;
  wire and_dcpl_100;
  wire and_dcpl_105;
  wire or_tmp_174;
  wire mux_tmp_172;
  wire mux_tmp_173;
  wire and_dcpl_113;
  wire or_tmp_192;
  wire and_dcpl_120;
  wire not_tmp_136;
  wire or_tmp_214;
  wire or_tmp_218;
  wire or_tmp_220;
  wire and_dcpl_133;
  wire or_tmp_226;
  wire or_tmp_229;
  wire and_tmp_10;
  wire mux_tmp_241;
  wire or_tmp_237;
  wire mux_tmp_247;
  wire mux_tmp_249;
  wire mux_tmp_259;
  wire mux_tmp_264;
  wire nor_tmp_51;
  wire mux_tmp_267;
  wire or_tmp_261;
  wire or_tmp_262;
  wire and_dcpl_148;
  wire mux_tmp_326;
  wire not_tmp_190;
  wire and_dcpl_149;
  wire and_dcpl_150;
  wire and_dcpl_152;
  reg exit_COMP_LOOP_1_modExp_1_while_sva;
  reg modExp_exp_1_0_1_sva;
  reg COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  reg [11:0] VEC_LOOP_j_sva_11_0;
  reg [11:0] COMP_LOOP_acc_1_cse_sva;
  wire [12:0] nl_COMP_LOOP_acc_1_cse_sva;
  reg [11:0] COMP_LOOP_acc_1_cse_2_sva;
  reg [11:0] COMP_LOOP_acc_10_cse_12_1_1_sva;
  reg [63:0] tmp_2_lpi_4_dfm;
  wire and_60_ssc;
  wire and_64_ssc;
  wire and_68_ssc;
  wire and_73_ssc;
  wire and_80_ssc;
  wire and_121_m1c;
  wire and_129_m1c;
  reg reg_vec_rsc_triosy_0_1_obj_ld_cse;
  wire or_72_cse;
  wire and_214_cse;
  wire or_351_cse;
  wire or_80_cse;
  wire or_333_cse;
  wire and_170_cse;
  wire nor_84_cse;
  wire and_211_cse;
  wire nand_15_cse;
  wire or_356_cse;
  wire or_270_cse;
  wire or_46_cse;
  wire or_12_cse;
  reg [6:0] COMP_LOOP_k_9_2_sva_6_0;
  wire mux_108_cse;
  wire mux_23_cse;
  wire [9:0] COMP_LOOP_mux1h_3_rmff;
  wire COMP_LOOP_mux1h_40_rmff;
  wire [63:0] modExp_base_1_sva_mx1;
  wire [63:0] modulo_qr_sva_1_mx0w5;
  wire [64:0] nl_modulo_qr_sva_1_mx0w5;
  wire [63:0] COMP_LOOP_1_acc_5_mut_mx0w5;
  wire [64:0] nl_COMP_LOOP_1_acc_5_mut_mx0w5;
  wire modExp_while_and_3;
  wire modExp_while_and_5;
  wire mux_97_itm;
  wire and_dcpl_168;
  wire [64:0] z_out;
  wire [65:0] nl_z_out;
  wire and_dcpl_178;
  wire and_dcpl_183;
  wire and_dcpl_187;
  wire and_dcpl_191;
  wire and_dcpl_199;
  wire [12:0] z_out_1;
  wire [13:0] nl_z_out_1;
  wire and_dcpl_214;
  wire and_dcpl_218;
  wire and_dcpl_220;
  wire and_dcpl_223;
  wire and_dcpl_229;
  wire [64:0] z_out_2;
  wire and_dcpl_232;
  wire and_dcpl_259;
  wire and_dcpl_271;
  wire and_dcpl_273;
  wire [63:0] z_out_5;
  wire [127:0] nl_z_out_5;
  reg [63:0] p_sva;
  reg [63:0] r_sva;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] STAGE_LOOP_lshift_psp_sva;
  reg [63:0] modExp_result_sva;
  reg [9:0] COMP_LOOP_acc_psp_sva;
  reg modExp_exp_1_7_1_sva;
  reg modExp_exp_1_6_1_sva;
  reg modExp_exp_1_5_1_sva;
  reg modExp_exp_1_4_1_sva;
  reg modExp_exp_1_3_1_sva;
  reg modExp_exp_1_2_1_sva;
  reg modExp_exp_1_1_1_sva;
  reg modExp_exp_1_0_1_sva_1;
  reg [10:0] COMP_LOOP_acc_11_psp_sva;
  reg [63:0] modExp_base_1_sva;
  reg [63:0] COMP_LOOP_1_acc_8_itm;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [9:0] STAGE_LOOP_lshift_psp_sva_mx0w0;
  wire VEC_LOOP_j_sva_11_0_mx0c1;
  wire modExp_result_sva_mx0c0;
  wire [62:0] operator_64_false_slc_modExp_exp_63_1_3;
  wire [9:0] COMP_LOOP_acc_psp_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_psp_sva_1;
  wire modExp_result_and_rgt;
  wire modExp_result_and_1_rgt;
  wire COMP_LOOP_or_ssc;
  wire COMP_LOOP_or_1_cse;
  wire and_259_cse;
  wire or_tmp_321;
  wire or_tmp_323;
  wire or_tmp_324;
  wire or_tmp_332;
  wire mux_tmp_361;
  wire mux_tmp_364;
  wire mux_tmp_366;
  wire [64:0] operator_64_false_mux1h_2_rgt;
  reg operator_64_false_acc_mut_64;
  reg [63:0] operator_64_false_acc_mut_63_0;
  wire nor_171_cse;
  wire or_388_cse;
  wire nor_177_cse;
  wire or_425_cse;
  wire nor_172_cse;
  wire or_410_cse;
  wire COMP_LOOP_or_16_itm;
  wire STAGE_LOOP_acc_itm_2_1;
  wire z_out_4_8;
  wire mux_284_cse;
  wire mux_288_cse;
  wire nor_77_cse;
  wire and_271_cse;

  wire[0:0] or_123_nl;
  wire[0:0] modulo_result_or_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] or_179_nl;
  wire[0:0] nor_93_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] or_175_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] or_174_nl;
  wire[0:0] or_173_nl;
  wire[0:0] mux_140_nl;
  wire[0:0] mux_138_nl;
  wire[0:0] mux_137_nl;
  wire[0:0] mux_136_nl;
  wire[0:0] mux_135_nl;
  wire[0:0] mux_134_nl;
  wire[0:0] mux_133_nl;
  wire[0:0] nor_95_nl;
  wire[0:0] mux_132_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] or_164_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] mux_162_nl;
  wire[0:0] and_183_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] mux_158_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] mux_155_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] or_187_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] and_184_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] nor_92_nl;
  wire[0:0] nor_91_nl;
  wire[63:0] mux1h_nl;
  wire[0:0] or_383_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] or_289_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] or_288_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] mux_276_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] or_287_nl;
  wire[0:0] mux_273_nl;
  wire[0:0] or_285_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] mux_269_nl;
  wire[0:0] mux_268_nl;
  wire[0:0] or_284_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] mux_265_nl;
  wire[0:0] or_278_nl;
  wire[0:0] mux_263_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] nor_nl;
  wire[0:0] modExp_while_if_and_1_nl;
  wire[0:0] modExp_while_if_and_2_nl;
  wire[0:0] and_111_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] nor_89_nl;
  wire[0:0] or_202_nl;
  wire[0:0] mux_171_nl;
  wire[0:0] nor_153_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] mux_169_nl;
  wire[0:0] or_197_nl;
  wire[0:0] or_195_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] nor_181_nl;
  wire[0:0] or_398_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] nor_184_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] or_395_nl;
  wire[0:0] mux_353_nl;
  wire[0:0] mux_352_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] or_392_nl;
  wire[0:0] and_344_nl;
  wire[0:0] mux_345_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] or_387_nl;
  wire[0:0] mux_nl;
  wire[0:0] or_385_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] mux_379_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] or_417_nl;
  wire[0:0] nand_52_nl;
  wire[0:0] mux_375_nl;
  wire[0:0] nor_179_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] mux_374_nl;
  wire[0:0] mux_373_nl;
  wire[0:0] or_414_nl;
  wire[0:0] or_413_nl;
  wire[0:0] mux_372_nl;
  wire[0:0] or_412_nl;
  wire[0:0] mux_371_nl;
  wire[0:0] or_409_nl;
  wire[0:0] mux_370_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] or_407_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] or_404_nl;
  wire[0:0] or_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] or_210_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] or_352_nl;
  wire[0:0] nand_18_nl;
  wire[0:0] or_207_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] nor_176_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] or_423_nl;
  wire[0:0] or_422_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] nor_178_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] nor_87_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] or_218_nl;
  wire[0:0] and_124_nl;
  wire[0:0] r_or_nl;
  wire[0:0] r_or_1_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] nor_80_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] nor_81_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] nor_83_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] and_179_nl;
  wire[0:0] and_180_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] nor_85_nl;
  wire[0:0] and_136_nl;
  wire[0:0] mux_218_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] or_245_nl;
  wire[0:0] and_137_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] or_250_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] mux_219_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] and_177_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] nor_78_nl;
  wire[0:0] or_240_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] or_239_nl;
  wire[0:0] COMP_LOOP_mux1h_13_nl;
  wire[7:0] COMP_LOOP_acc_12_nl;
  wire[8:0] nl_COMP_LOOP_acc_12_nl;
  wire[0:0] COMP_LOOP_and_3_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] mux_235_nl;
  wire[0:0] nor_75_nl;
  wire[0:0] nor_76_nl;
  wire[0:0] or_349_nl;
  wire[0:0] mux_234_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] mux_232_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] or_257_nl;
  wire[0:0] or_256_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] mux_258_nl;
  wire[0:0] mux_257_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] or_271_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] mux_251_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] or_267_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] mux_240_nl;
  wire[9:0] COMP_LOOP_1_acc_nl;
  wire[10:0] nl_COMP_LOOP_1_acc_nl;
  wire[63:0] COMP_LOOP_1_acc_8_nl;
  wire[64:0] nl_COMP_LOOP_1_acc_8_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] or_368_nl;
  wire[0:0] or_369_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] mux_298_nl;
  wire[0:0] mux_297_nl;
  wire[0:0] nand_41_nl;
  wire[0:0] or_318_nl;
  wire[0:0] or_317_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] nor_65_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] mux_310_nl;
  wire[0:0] or_324_nl;
  wire[0:0] nor_64_nl;
  wire[0:0] mux_309_nl;
  wire[0:0] COMP_LOOP_mux_24_nl;
  wire[0:0] and_158_nl;
  wire[0:0] mux_312_nl;
  wire[0:0] nor_62_nl;
  wire[0:0] nor_63_nl;
  wire[0:0] mux_324_nl;
  wire[0:0] mux_323_nl;
  wire[0:0] mux_322_nl;
  wire[0:0] mux_321_nl;
  wire[0:0] or_334_nl;
  wire[0:0] mux_320_nl;
  wire[0:0] nor_60_nl;
  wire[0:0] mux_319_nl;
  wire[0:0] mux_318_nl;
  wire[0:0] and_169_nl;
  wire[0:0] or_329_nl;
  wire[0:0] COMP_LOOP_mux1h_20_nl;
  wire[0:0] COMP_LOOP_mux1h_37_nl;
  wire[0:0] and_166_nl;
  wire[0:0] mux_330_nl;
  wire[0:0] and_165_nl;
  wire[0:0] nor_118_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] or_92_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] nor_116_nl;
  wire[0:0] nor_117_nl;
  wire[0:0] or_307_nl;
  wire[0:0] or_5_nl;
  wire[0:0] or_191_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] nor_90_nl;
  wire[0:0] and_182_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] or_223_nl;
  wire[0:0] and_178_nl;
  wire[0:0] nor_79_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] or_251_nl;
  wire[0:0] or_268_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] or_269_nl;
  wire[0:0] or_281_nl;
  wire[0:0] or_41_nl;
  wire[0:0] mux_325_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] mux_327_nl;
  wire[0:0] and_160_nl;
  wire[0:0] mux_328_nl;
  wire[0:0] or_338_nl;
  wire[0:0] mux_329_nl;
  wire[0:0] nor_58_nl;
  wire[0:0] and_168_nl;
  wire[0:0] nor_88_nl;
  wire[2:0] STAGE_LOOP_acc_nl;
  wire[3:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] and_215_nl;
  wire[0:0] nor_86_nl;
  wire[0:0] mux_102_nl;
  wire[0:0] nor_113_nl;
  wire[0:0] nor_114_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] and_190_nl;
  wire[0:0] nor_112_nl;
  wire[0:0] mux_104_nl;
  wire[0:0] nor_110_nl;
  wire[0:0] nor_111_nl;
  wire[0:0] COMP_LOOP_or_5_nl;
  wire[0:0] mux_110_nl;
  wire[0:0] or_362_nl;
  wire[0:0] mux_109_nl;
  wire[0:0] nand_3_nl;
  wire[0:0] or_124_nl;
  wire[0:0] or_363_nl;
  wire[0:0] mux_107_nl;
  wire[0:0] or_120_nl;
  wire[0:0] or_116_nl;
  wire[0:0] mux_105_nl;
  wire[0:0] or_115_nl;
  wire[0:0] or_114_nl;
  wire[0:0] mux_117_nl;
  wire[0:0] nor_103_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] mux_115_nl;
  wire[0:0] or_138_nl;
  wire[0:0] or_137_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] or_135_nl;
  wire[0:0] or_134_nl;
  wire[0:0] and_189_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] nor_104_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] mux_111_nl;
  wire[0:0] nor_105_nl;
  wire[0:0] nor_106_nl;
  wire[0:0] nor_107_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] nand_36_nl;
  wire[0:0] mux_122_nl;
  wire[0:0] and_188_nl;
  wire[0:0] nor_101_nl;
  wire[0:0] or_361_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] nand_5_nl;
  wire[0:0] or_143_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] or_142_nl;
  wire[0:0] or_141_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] nor_96_nl;
  wire[0:0] mux_129_nl;
  wire[0:0] mux_128_nl;
  wire[0:0] or_159_nl;
  wire[0:0] nand_35_nl;
  wire[0:0] mux_127_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] nand_21_nl;
  wire[0:0] and_186_nl;
  wire[0:0] mux_126_nl;
  wire[0:0] nor_97_nl;
  wire[0:0] mux_125_nl;
  wire[0:0] mux_124_nl;
  wire[0:0] nor_98_nl;
  wire[0:0] nor_99_nl;
  wire[0:0] nor_100_nl;
  wire[0:0] nand_54_nl;
  wire[0:0] or_406_nl;
  wire[0:0] or_405_nl;
  wire[0:0] or_408_nl;
  wire[63:0] COMP_LOOP_mux_27_nl;
  wire[6:0] COMP_LOOP_COMP_LOOP_or_6_nl;
  wire[11:0] operator_64_false_1_mux_11_nl;
  wire[0:0] operator_64_false_1_or_2_nl;
  wire[9:0] operator_64_false_1_mux1h_1_nl;
  wire[9:0] COMP_LOOP_acc_18_nl;
  wire[10:0] nl_COMP_LOOP_acc_18_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_or_11_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_nor_5_nl;
  wire[1:0] COMP_LOOP_mux_29_nl;
  wire[0:0] and_350_nl;
  wire[0:0] and_351_nl;
  wire[0:0] and_352_nl;
  wire[0:0] operator_64_false_1_or_3_nl;
  wire[65:0] acc_2_nl;
  wire[66:0] nl_acc_2_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_7_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_8_nl;
  wire[51:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl;
  wire[51:0] COMP_LOOP_mux_28_nl;
  wire[0:0] COMP_LOOP_or_23_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_nor_4_nl;
  wire[1:0] COMP_LOOP_mux1h_71_nl;
  wire[8:0] COMP_LOOP_mux1h_72_nl;
  wire[0:0] COMP_LOOP_or_24_nl;
  wire[6:0] COMP_LOOP_and_10_nl;
  wire[6:0] COMP_LOOP_COMP_LOOP_mux_2_nl;
  wire[0:0] COMP_LOOP_not_68_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_9_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_10_nl;
  wire[8:0] operator_64_false_1_acc_nl;
  wire[9:0] nl_operator_64_false_1_acc_nl;
  wire[0:0] operator_64_false_1_mux_12_nl;
  wire[0:0] operator_64_false_1_mux_13_nl;
  wire[0:0] operator_64_false_1_mux_14_nl;
  wire[0:0] operator_64_false_1_mux_15_nl;
  wire[0:0] operator_64_false_1_mux_16_nl;
  wire[0:0] operator_64_false_1_mux_17_nl;
  wire[0:0] operator_64_false_1_mux_18_nl;
  wire[63:0] modExp_while_if_mux1h_1_nl;
  wire[0:0] and_353_nl;
  wire[0:0] modExp_while_if_or_1_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] or_429_nl;
  wire[0:0] and_355_nl;
  wire[0:0] mux_387_nl;
  wire[0:0] and_356_nl;
  wire[0:0] mux_388_nl;
  wire[0:0] nand_55_nl;
  wire[0:0] mux_390_nl;
  wire[0:0] nor_190_nl;
  wire[0:0] nor_191_nl;
  wire[63:0] modExp_while_if_modExp_while_if_mux1h_1_nl;
  wire[0:0] modExp_while_if_and_4_nl;
  wire[0:0] modExp_while_if_and_5_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [10:0] nl_operator_66_true_div_cmp_b;
  assign nl_operator_66_true_div_cmp_b = {1'b0, operator_66_true_div_cmp_b_9_0};
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_5_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_5_tr0 = ~ (z_out_2[64]);
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 = ~ modExp_exp_1_0_1_sva;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_40_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_40_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_24_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_24_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_80_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_80_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_24_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_24_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_120_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_120_tr0 = ~ modExp_exp_1_0_1_sva;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_24_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_24_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = z_out_1[12];
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
      .COMP_LOOP_C_80_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_80_tr0[0:0]),
      .COMP_LOOP_3_modExp_1_while_C_24_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_24_tr0[0:0]),
      .COMP_LOOP_C_120_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_120_tr0[0:0]),
      .COMP_LOOP_4_modExp_1_while_C_24_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_24_tr0[0:0]),
      .COMP_LOOP_C_160_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_6_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_6_tr0[0:0])
    );
  assign or_123_nl = (fsm_output[8:7]!=2'b10);
  assign mux_108_cse = MUX_s_1_2_2(or_tmp_47, or_123_nl, fsm_output[1]);
  assign or_80_cse = (fsm_output[4:3]!=2'b00);
  assign mux_284_cse = MUX_s_1_2_2(or_tmp_262, or_tmp_261, fsm_output[0]);
  assign or_289_nl = (fsm_output[0]) | (~ and_tmp_7);
  assign mux_285_nl = MUX_s_1_2_2(mux_284_cse, or_289_nl, fsm_output[6]);
  assign mux_278_nl = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[3]);
  assign or_288_nl = (fsm_output[2:1]!=2'b00);
  assign mux_279_nl = MUX_s_1_2_2(mux_278_nl, or_46_cse, or_288_nl);
  assign mux_280_nl = MUX_s_1_2_2(mux_279_nl, mux_tmp_267, fsm_output[7]);
  assign or_287_nl = (~ modExp_exp_1_0_1_sva) | (fsm_output[4:3]!=2'b00);
  assign mux_274_nl = MUX_s_1_2_2(or_287_nl, or_46_cse, fsm_output[2]);
  assign mux_275_nl = MUX_s_1_2_2(mux_23_cse, (~ mux_274_nl), fsm_output[1]);
  assign mux_276_nl = MUX_s_1_2_2(mux_275_nl, mux_23_cse, fsm_output[7]);
  assign or_285_nl = (fsm_output[4:1]!=4'b0000);
  assign mux_273_nl = MUX_s_1_2_2(or_285_nl, mux_tmp_264, fsm_output[7]);
  assign mux_277_nl = MUX_s_1_2_2(mux_276_nl, (~ mux_273_nl), fsm_output[0]);
  assign mux_281_nl = MUX_s_1_2_2(mux_280_nl, mux_277_nl, fsm_output[5]);
  assign mux_260_nl = MUX_s_1_2_2(nor_tmp_8, mux_tmp_259, fsm_output[1]);
  assign mux_270_nl = MUX_s_1_2_2(mux_tmp_267, mux_260_nl, fsm_output[7]);
  assign or_284_nl = (~((fsm_output[3:2]!=2'b01))) | (fsm_output[4]);
  assign mux_268_nl = MUX_s_1_2_2(nor_tmp_51, or_284_nl, fsm_output[1]);
  assign mux_269_nl = MUX_s_1_2_2(mux_268_nl, mux_tmp_267, fsm_output[7]);
  assign mux_271_nl = MUX_s_1_2_2(mux_270_nl, mux_269_nl, fsm_output[0]);
  assign or_278_nl = (~((fsm_output[2:1]!=2'b11) | modExp_exp_1_0_1_sva)) | (fsm_output[4:3]!=2'b00);
  assign mux_265_nl = MUX_s_1_2_2(mux_tmp_264, or_278_nl, fsm_output[7]);
  assign nor_nl = ~((fsm_output[2]) | (~ nor_tmp_8));
  assign mux_262_nl = MUX_s_1_2_2(mux_23_cse, nor_nl, fsm_output[1]);
  assign mux_263_nl = MUX_s_1_2_2(mux_262_nl, mux_23_cse, fsm_output[7]);
  assign mux_266_nl = MUX_s_1_2_2((~ mux_265_nl), mux_263_nl, fsm_output[0]);
  assign mux_272_nl = MUX_s_1_2_2(mux_271_nl, mux_266_nl, fsm_output[5]);
  assign mux_282_nl = MUX_s_1_2_2(mux_281_nl, mux_272_nl, fsm_output[6]);
  assign or_383_nl = and_dcpl_87 | and_dcpl_91 | (~(mux_285_nl | (~ and_dcpl_83)
      | (fsm_output[8]) | (~(mux_282_nl & (~(and_dcpl_133 & (~ modExp_exp_1_0_1_sva)))))));
  assign modExp_while_if_and_1_nl = modExp_while_and_3 & and_dcpl_133;
  assign modExp_while_if_and_2_nl = modExp_while_and_5 & and_dcpl_133;
  assign mux1h_nl = MUX1HOT_v_64_5_2(z_out_5, 64'b0000000000000000000000000000000000000000000000000000000000000001,
      modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, COMP_LOOP_1_acc_5_mut_mx0w5,
      {or_383_nl , and_dcpl_120 , modExp_while_if_and_1_nl , modExp_while_if_and_2_nl
      , and_dcpl_95});
  assign and_111_nl = and_dcpl_100 & and_dcpl_27;
  assign mux_174_nl = MUX_s_1_2_2(or_tmp_69, or_tmp_143, fsm_output[6]);
  assign mux_175_nl = MUX_s_1_2_2(mux_174_nl, mux_tmp_173, fsm_output[3]);
  assign nor_89_nl = ~((fsm_output[3]) | mux_tmp_172);
  assign mux_176_nl = MUX_s_1_2_2(mux_175_nl, nor_89_nl, fsm_output[4]);
  assign mux_171_nl = MUX_s_1_2_2(or_tmp_149, or_tmp_174, nor_171_cse);
  assign or_202_nl = (fsm_output[4:3]!=2'b00) | mux_171_nl;
  assign mux_177_nl = MUX_s_1_2_2(mux_176_nl, or_202_nl, fsm_output[5]);
  assign or_197_nl = (fsm_output[6]) | (~((fsm_output[2:0]!=3'b010))) | (fsm_output[7]);
  assign mux_169_nl = MUX_s_1_2_2(or_388_cse, or_197_nl, fsm_output[3]);
  assign or_195_nl = (fsm_output[3]) | (fsm_output[6]) | or_tmp_144;
  assign mux_170_nl = MUX_s_1_2_2(mux_169_nl, or_195_nl, fsm_output[4]);
  assign nor_153_nl = ~((fsm_output[5]) | mux_170_nl);
  assign mux_178_nl = MUX_s_1_2_2(mux_177_nl, nor_153_nl, fsm_output[8]);
  assign operator_64_false_mux1h_2_rgt = MUX1HOT_v_65_3_2(z_out, ({2'b00 , operator_64_false_slc_modExp_exp_63_1_3}),
      ({1'b0 , mux1h_nl}), {and_111_nl , and_dcpl_105 , mux_178_nl});
  assign nor_171_cse = ~((fsm_output[6]) | (~ (fsm_output[0])));
  assign or_388_cse = (fsm_output[7:6]!=2'b00);
  assign or_425_cse = (~ (fsm_output[6])) | (fsm_output[0]);
  assign nor_172_cse = ~((fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[0])));
  assign or_410_cse = (fsm_output[4]) | (fsm_output[8]);
  assign nor_177_cse = ~((fsm_output[4:3]!=2'b00));
  assign and_121_m1c = and_dcpl_46 & and_dcpl_49;
  assign modExp_result_and_rgt = (~ modExp_while_and_5) & and_121_m1c;
  assign modExp_result_and_1_rgt = modExp_while_and_5 & and_121_m1c;
  assign or_72_cse = (fsm_output[1]) | (~ (fsm_output[7]));
  assign or_351_cse = (fsm_output[1:0]!=2'b00);
  assign nor_84_cse = ~((~ (fsm_output[0])) | (fsm_output[1]) | (~ (fsm_output[7])));
  assign and_214_cse = (fsm_output[1:0]==2'b11);
  assign or_12_cse = (~ (fsm_output[5])) | (fsm_output[8]);
  assign or_270_cse = (~ (fsm_output[4])) | (fsm_output[7]);
  assign or_46_cse = (fsm_output[4:3]!=2'b01);
  assign nor_77_cse = ~((~ (fsm_output[1])) | (fsm_output[7]));
  assign mux_288_cse = MUX_s_1_2_2(or_tmp_261, or_tmp_262, fsm_output[0]);
  assign and_170_cse = (fsm_output[7:6]==2'b11);
  assign or_333_cse = (fsm_output[2]) | (~ (fsm_output[7]));
  assign nand_15_cse = ~((fsm_output[7:6]==2'b11));
  assign COMP_LOOP_or_1_cse = and_dcpl_47 | and_dcpl_62 | and_dcpl_70 | and_dcpl_77;
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign or_356_cse = (~ (fsm_output[1])) | (fsm_output[7]);
  assign nl_COMP_LOOP_1_acc_5_mut_mx0w5 = tmp_2_lpi_4_dfm + modExp_base_1_sva_mx1;
  assign COMP_LOOP_1_acc_5_mut_mx0w5 = nl_COMP_LOOP_1_acc_5_mut_mx0w5[63:0];
  assign operator_64_false_slc_modExp_exp_63_1_3 = MUX_v_63_2_2((operator_66_true_div_cmp_z[63:1]),
      (tmp_2_lpi_4_dfm[63:1]), and_dcpl_113);
  assign nl_modulo_qr_sva_1_mx0w5 = modulo_result_rem_cmp_z + p_sva;
  assign modulo_qr_sva_1_mx0w5 = nl_modulo_qr_sva_1_mx0w5[63:0];
  assign modExp_base_1_sva_mx1 = MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
      modulo_result_rem_cmp_z[63]);
  assign mux_23_cse = MUX_s_1_2_2(nor_177_cse, nor_tmp_8, fsm_output[2]);
  assign nl_COMP_LOOP_acc_psp_sva_1 = (VEC_LOOP_j_sva_11_0[11:2]) + conv_u2u_7_10(COMP_LOOP_k_9_2_sva_6_0);
  assign COMP_LOOP_acc_psp_sva_1 = nl_COMP_LOOP_acc_psp_sva_1[9:0];
  assign modExp_while_and_3 = (~ (modulo_result_rem_cmp_z[63])) & modExp_exp_1_0_1_sva;
  assign modExp_while_and_5 = (modulo_result_rem_cmp_z[63]) & modExp_exp_1_0_1_sva;
  assign and_dcpl = (fsm_output[5]) & (~ (fsm_output[8]));
  assign and_211_cse = (fsm_output[7]) & (fsm_output[2]);
  assign nor_tmp_8 = (fsm_output[4:3]==2'b11);
  assign mux_tmp_43 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[6]);
  assign or_tmp_47 = (fsm_output[8:7]!=2'b01);
  assign not_tmp_50 = ~((fsm_output[7:6]!=2'b00));
  assign or_tmp_69 = ((fsm_output[2:0]==3'b111)) | (fsm_output[7]);
  assign nor_118_nl = ~((fsm_output[7:0]!=8'b00000000));
  assign or_92_nl = (fsm_output[4]) | (fsm_output[3]) | (fsm_output[6]) | or_tmp_69;
  assign mux_96_nl = MUX_s_1_2_2(or_388_cse, or_92_nl, fsm_output[5]);
  assign mux_97_itm = MUX_s_1_2_2(nor_118_nl, mux_96_nl, fsm_output[8]);
  assign and_dcpl_25 = ~((fsm_output[5]) | (fsm_output[8]));
  assign and_dcpl_27 = nor_177_cse & and_dcpl_25;
  assign and_dcpl_28 = ~((fsm_output[0]) | (fsm_output[6]));
  assign and_dcpl_29 = ~((fsm_output[7]) | (fsm_output[1]));
  assign and_dcpl_30 = and_dcpl_29 & (~ (fsm_output[2]));
  assign and_dcpl_31 = and_dcpl_30 & and_dcpl_28;
  assign and_dcpl_34 = nor_177_cse & (fsm_output[5]) & (fsm_output[8]);
  assign and_dcpl_35 = (~ (fsm_output[7])) & (fsm_output[1]);
  assign and_dcpl_36 = and_dcpl_35 & (fsm_output[2]);
  assign and_dcpl_37 = and_dcpl_36 & and_dcpl_28;
  assign and_dcpl_40 = nor_177_cse & and_dcpl;
  assign and_dcpl_41 = and_dcpl_31 & and_dcpl_40;
  assign and_dcpl_43 = nor_tmp_8 & and_dcpl;
  assign and_dcpl_44 = (fsm_output[0]) & (~ (fsm_output[6]));
  assign and_dcpl_45 = and_dcpl_35 & (~ (fsm_output[2]));
  assign and_dcpl_46 = and_dcpl_45 & and_dcpl_44;
  assign and_dcpl_47 = and_dcpl_46 & and_dcpl_43;
  assign and_dcpl_49 = (fsm_output[4:3]==2'b10) & and_dcpl_25;
  assign and_dcpl_50 = (~ (fsm_output[0])) & (fsm_output[6]);
  assign and_dcpl_51 = and_dcpl_29 & (fsm_output[2]);
  assign and_dcpl_52 = and_dcpl_51 & and_dcpl_50;
  assign mux_tmp_99 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[1]);
  assign nor_116_nl = ~((fsm_output[0]) | (~ mux_tmp_99));
  assign mux_100_nl = MUX_s_1_2_2(nor_84_cse, nor_116_nl, fsm_output[6]);
  assign nor_117_nl = ~((fsm_output[6]) | (~ (fsm_output[0])) | (~ (fsm_output[1]))
      | (fsm_output[7]));
  assign not_tmp_73 = MUX_s_1_2_2(mux_100_nl, nor_117_nl, fsm_output[8]);
  assign and_dcpl_58 = ~((fsm_output[3]) | (fsm_output[8]));
  assign and_dcpl_62 = and_dcpl_52 & and_dcpl_43;
  assign and_dcpl_67 = (fsm_output[7]) & (~ (fsm_output[1]));
  assign and_dcpl_70 = and_dcpl_67 & (fsm_output[2]) & and_dcpl_44 & and_dcpl_43;
  assign and_dcpl_74 = (fsm_output[7]) & (fsm_output[1]);
  assign and_dcpl_75 = and_dcpl_74 & (fsm_output[2]);
  assign and_dcpl_77 = and_dcpl_75 & and_dcpl_50 & and_dcpl_43;
  assign or_307_nl = (fsm_output[8:7]!=2'b00);
  assign mux_tmp_106 = MUX_s_1_2_2(or_307_nl, or_tmp_47, fsm_output[1]);
  assign and_dcpl_83 = nor_177_cse & (fsm_output[5]);
  assign and_dcpl_86 = and_dcpl_36 & and_dcpl_44;
  assign and_dcpl_87 = and_dcpl_86 & and_dcpl_27;
  assign or_tmp_135 = (fsm_output[3]) | (fsm_output[6]) | or_tmp_69;
  assign and_tmp_7 = (fsm_output[2]) & mux_tmp_99;
  assign or_tmp_142 = (fsm_output[0]) | (fsm_output[2]) | (fsm_output[1]) | (~ (fsm_output[7]));
  assign mux_tmp_139 = MUX_s_1_2_2((fsm_output[7]), or_tmp_142, fsm_output[6]);
  assign or_tmp_143 = ~((fsm_output[0]) & (fsm_output[2]) & (fsm_output[1]) & (~
      (fsm_output[7])));
  assign or_tmp_144 = ((fsm_output[2:1]==2'b11)) | (fsm_output[7]);
  assign mux_tmp_141 = MUX_s_1_2_2(or_tmp_144, or_tmp_143, fsm_output[6]);
  assign or_tmp_149 = (fsm_output[2]) | and_dcpl_35;
  assign and_tmp_8 = (fsm_output[2]) & or_72_cse;
  assign mux_tmp_145 = MUX_s_1_2_2(and_tmp_8, or_tmp_149, nor_171_cse);
  assign or_tmp_154 = (~ (fsm_output[0])) | (fsm_output[2]) | (fsm_output[1]) | (~
      (fsm_output[7]));
  assign or_tmp_156 = (fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]);
  assign or_5_nl = (fsm_output[7]) | (fsm_output[2]);
  assign mux_tmp_151 = MUX_s_1_2_2(or_5_nl, or_tmp_156, fsm_output[0]);
  assign or_tmp_159 = (fsm_output[6]) | (~ (fsm_output[0])) | (~ (fsm_output[2]))
      | (~ (fsm_output[1])) | (fsm_output[7]);
  assign and_dcpl_88 = and_dcpl_45 & and_dcpl_28;
  assign and_dcpl_89 = and_dcpl_88 & and_dcpl_40;
  assign and_dcpl_91 = and_tmp_7 & xor_dcpl & and_dcpl_43;
  assign and_dcpl_95 = not_tmp_73 & (fsm_output[5:2]==4'b0010);
  assign mux_tmp_164 = MUX_s_1_2_2(or_356_cse, or_72_cse, fsm_output[2]);
  assign nand_tmp_10 = ~((fsm_output[0]) & (~ mux_tmp_164));
  assign or_tmp_162 = (fsm_output[0]) | (~ (fsm_output[2])) | (fsm_output[1]) | (~
      (fsm_output[7]));
  assign mux_tmp_165 = MUX_s_1_2_2(or_tmp_162, nand_tmp_10, fsm_output[6]);
  assign and_dcpl_96 = (~ mux_tmp_165) & and_dcpl_40;
  assign and_dcpl_99 = ((fsm_output[1]) ^ (fsm_output[2])) & not_tmp_50 & and_dcpl_27;
  assign or_191_nl = (fsm_output[4]) | (fsm_output[3]) | (fsm_output[6]) | or_tmp_144;
  assign mux_tmp_166 = MUX_s_1_2_2(or_388_cse, or_191_nl, fsm_output[5]);
  assign and_dcpl_100 = and_dcpl_30 & and_dcpl_44;
  assign nor_90_nl = ~((fsm_output[3]) | (fsm_output[0]));
  assign and_182_nl = (fsm_output[3]) & (fsm_output[0]);
  assign mux_168_nl = MUX_s_1_2_2(nor_90_nl, and_182_nl, fsm_output[4]);
  assign and_dcpl_105 = mux_168_nl & and_dcpl_35 & (fsm_output[2]) & (~ (fsm_output[6]))
      & and_dcpl_25;
  assign or_tmp_174 = (fsm_output[2]) | (fsm_output[1]) | (~ (fsm_output[7]));
  assign mux_tmp_172 = MUX_s_1_2_2(and_tmp_8, or_tmp_149, or_425_cse);
  assign mux_tmp_173 = MUX_s_1_2_2(or_tmp_142, or_tmp_154, fsm_output[6]);
  assign and_dcpl_113 = and_dcpl_86 & nor_tmp_8 & and_dcpl_25;
  assign or_tmp_192 = (fsm_output[0]) | mux_tmp_164;
  assign or_223_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (~ mux_tmp_99);
  assign mux_197_nl = MUX_s_1_2_2(or_223_nl, or_tmp_192, fsm_output[6]);
  assign and_dcpl_120 = (~ mux_197_nl) & and_dcpl_40;
  assign and_178_nl = (fsm_output[3]) & (fsm_output[6]) & (fsm_output[0]) & (fsm_output[2])
      & (fsm_output[1]) & (~ (fsm_output[7]));
  assign nor_79_nl = ~((fsm_output[3]) | mux_tmp_173);
  assign not_tmp_136 = MUX_s_1_2_2(and_178_nl, nor_79_nl, fsm_output[4]);
  assign or_tmp_214 = (fsm_output[6]) | or_tmp_69;
  assign or_tmp_218 = (VEC_LOOP_j_sva_11_0[0]) | (~ (fsm_output[0])) | (fsm_output[2])
      | (~ mux_tmp_99);
  assign or_tmp_220 = ~((VEC_LOOP_j_sva_11_0[0]) & (fsm_output[0]) & (~ (fsm_output[2]))
      & mux_tmp_99);
  assign or_251_nl = (fsm_output[6]) | (fsm_output[0]) | (~ (fsm_output[2])) | (~
      (fsm_output[1])) | (fsm_output[7]);
  assign mux_223_nl = MUX_s_1_2_2(or_251_nl, mux_tmp_165, fsm_output[4]);
  assign and_dcpl_133 = (~ mux_223_nl) & (fsm_output[3]) & (fsm_output[5]) & (~ (fsm_output[8]));
  assign or_tmp_226 = ~((fsm_output[1]) & (fsm_output[0]) & (~ (fsm_output[7])) &
      (fsm_output[4]));
  assign or_tmp_229 = (fsm_output[7]) | (fsm_output[4]);
  assign and_tmp_10 = (fsm_output[4]) & ((fsm_output[7:6]!=2'b10));
  assign mux_tmp_241 = MUX_s_1_2_2(mux_tmp_43, and_170_cse, fsm_output[4]);
  assign or_tmp_237 = (fsm_output[5]) | mux_tmp_241;
  assign or_268_nl = (fsm_output[4]) | (~ and_170_cse);
  assign mux_tmp_247 = MUX_s_1_2_2(and_170_cse, or_268_nl, fsm_output[5]);
  assign mux_248_nl = MUX_s_1_2_2(and_170_cse, mux_tmp_43, fsm_output[4]);
  assign or_269_nl = (fsm_output[4]) | mux_tmp_43;
  assign mux_tmp_249 = MUX_s_1_2_2(mux_248_nl, or_269_nl, fsm_output[5]);
  assign mux_tmp_259 = MUX_s_1_2_2((fsm_output[3]), (fsm_output[4]), fsm_output[2]);
  assign or_281_nl = (~((~ (fsm_output[2])) | modExp_exp_1_0_1_sva)) | (fsm_output[4:3]!=2'b00);
  assign or_41_nl = (fsm_output[4:2]!=3'b000);
  assign mux_tmp_264 = MUX_s_1_2_2(or_281_nl, or_41_nl, fsm_output[1]);
  assign nor_tmp_51 = ((fsm_output[3:2]!=2'b00)) & (fsm_output[4]);
  assign mux_tmp_267 = MUX_s_1_2_2(mux_tmp_259, nor_tmp_51, fsm_output[1]);
  assign or_tmp_261 = (~ (fsm_output[2])) | (fsm_output[1]) | (~ (fsm_output[7]));
  assign or_tmp_262 = (fsm_output[2]) | (~ (fsm_output[1])) | (fsm_output[7]);
  assign and_dcpl_148 = and_dcpl_100 & and_dcpl_40;
  assign mux_325_nl = MUX_s_1_2_2((fsm_output[2]), or_tmp_149, fsm_output[0]);
  assign mux_313_nl = MUX_s_1_2_2(and_tmp_8, or_tmp_149, fsm_output[0]);
  assign mux_tmp_326 = MUX_s_1_2_2(mux_325_nl, mux_313_nl, fsm_output[6]);
  assign not_tmp_190 = ~((fsm_output[3]) | mux_tmp_326);
  assign and_160_nl = (fsm_output[3]) & mux_tmp_326;
  assign mux_327_nl = MUX_s_1_2_2(not_tmp_190, and_160_nl, fsm_output[4]);
  assign and_dcpl_149 = (~ mux_327_nl) & and_dcpl;
  assign or_338_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (~ and_dcpl_74);
  assign mux_328_nl = MUX_s_1_2_2(or_338_nl, or_tmp_192, fsm_output[6]);
  assign and_dcpl_150 = (~ mux_328_nl) & and_dcpl_40;
  assign nor_58_nl = ~((fsm_output[3]) | (fsm_output[6]) | (fsm_output[0]) | (fsm_output[2])
      | (~ (fsm_output[1])) | (fsm_output[7]));
  assign and_168_nl = (fsm_output[3]) & (~ mux_tmp_165);
  assign mux_329_nl = MUX_s_1_2_2(nor_58_nl, and_168_nl, fsm_output[4]);
  assign and_dcpl_152 = mux_329_nl & and_dcpl;
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_37 & and_dcpl_34;
  assign VEC_LOOP_j_sva_11_0_mx0c1 = and_dcpl_51 & and_dcpl_44 & and_dcpl_34;
  assign nor_88_nl = ~((fsm_output[6:3]!=4'b0000) | or_tmp_69);
  assign modExp_result_sva_mx0c0 = MUX_s_1_2_2(nor_88_nl, mux_tmp_166, fsm_output[8]);
  assign nl_STAGE_LOOP_acc_nl = (STAGE_LOOP_i_3_0_sva_2[3:1]) + 3'b011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[2:0];
  assign STAGE_LOOP_acc_itm_2_1 = readslicef_3_1_2(STAGE_LOOP_acc_nl);
  assign xor_dcpl = ~((fsm_output[0]) ^ (fsm_output[6]));
  assign and_215_nl = (fsm_output[2]) & (fsm_output[0]);
  assign nor_86_nl = ~((fsm_output[0]) | (fsm_output[2]));
  assign mux_196_nl = MUX_s_1_2_2(and_215_nl, nor_86_nl, fsm_output[5]);
  assign and_129_m1c = mux_196_nl & and_dcpl_35 & (~ (fsm_output[6])) & (fsm_output[3])
      & (fsm_output[4]) & (~ (fsm_output[8]));
  assign and_60_ssc = and_dcpl_52 & and_dcpl_49;
  assign and_64_ssc = not_tmp_73 & (fsm_output[5:2]==4'b1000);
  assign nor_113_nl = ~((~ (fsm_output[4])) | (fsm_output[6]) | (~ and_211_cse));
  assign nor_114_nl = ~((fsm_output[4]) | (~ (fsm_output[6])) | (fsm_output[2]) |
      (fsm_output[7]));
  assign mux_102_nl = MUX_s_1_2_2(nor_113_nl, nor_114_nl, fsm_output[5]);
  assign and_68_ssc = mux_102_nl & (fsm_output[1:0]==2'b01) & and_dcpl_58;
  assign and_190_nl = (fsm_output[4]) & (fsm_output[6]) & (fsm_output[2]);
  assign nor_112_nl = ~((fsm_output[4]) | (fsm_output[6]) | (fsm_output[2]));
  assign mux_103_nl = MUX_s_1_2_2(and_190_nl, nor_112_nl, fsm_output[5]);
  assign and_73_ssc = mux_103_nl & (fsm_output[7]) & (fsm_output[1]) & (~ (fsm_output[0]))
      & and_dcpl_58;
  assign nor_110_nl = ~((~ (fsm_output[5])) | (fsm_output[4]) | (~ (fsm_output[6]))
      | (fsm_output[2]) | (~ (fsm_output[7])));
  assign nor_111_nl = ~((fsm_output[5]) | (~ (fsm_output[4])) | (fsm_output[6]) |
      (~ (fsm_output[2])) | (fsm_output[7]));
  assign mux_104_nl = MUX_s_1_2_2(nor_110_nl, nor_111_nl, fsm_output[8]);
  assign and_80_ssc = mux_104_nl & (fsm_output[1]) & (fsm_output[0]) & (~ (fsm_output[3]));
  assign COMP_LOOP_mux1h_3_rmff = MUX1HOT_v_10_7_2(COMP_LOOP_acc_psp_sva_1, (z_out_1[12:3]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva[11:2]), (COMP_LOOP_acc_1_cse_2_sva[11:2]),
      (COMP_LOOP_acc_11_psp_sva[10:1]), (COMP_LOOP_acc_1_cse_sva[11:2]), {and_dcpl_41
      , COMP_LOOP_or_1_cse , and_60_ssc , and_64_ssc , and_68_ssc , and_73_ssc ,
      and_80_ssc});
  assign COMP_LOOP_or_5_nl = and_dcpl_41 | and_60_ssc;
  assign COMP_LOOP_mux1h_40_rmff = MUX1HOT_s_1_6_2((VEC_LOOP_j_sva_11_0[1]), (z_out_1[2]),
      (COMP_LOOP_acc_10_cse_12_1_1_sva[1]), (COMP_LOOP_acc_1_cse_2_sva[1]), (COMP_LOOP_acc_11_psp_sva[0]),
      (COMP_LOOP_acc_1_cse_sva[1]), {COMP_LOOP_or_5_nl , COMP_LOOP_or_1_cse , and_64_ssc
      , and_68_ssc , and_73_ssc , and_80_ssc});
  assign vec_rsc_0_0_i_adra_d = {COMP_LOOP_mux1h_3_rmff , COMP_LOOP_mux1h_40_rmff};
  assign vec_rsc_0_0_i_da_d_pff = modExp_base_1_sva_mx1;
  assign nand_3_nl = ~((fsm_output[6]) & (~ mux_tmp_106));
  assign or_124_nl = (fsm_output[6]) | mux_108_cse;
  assign mux_109_nl = MUX_s_1_2_2(nand_3_nl, or_124_nl, fsm_output[0]);
  assign or_362_nl = (fsm_output[5:4]!=2'b10) | (COMP_LOOP_acc_10_cse_12_1_1_sva[0])
      | mux_109_nl;
  assign or_120_nl = (~ (fsm_output[6])) | (VEC_LOOP_j_sva_11_0[0]) | mux_tmp_106;
  assign or_115_nl = (~ (fsm_output[7])) | (COMP_LOOP_acc_1_cse_2_sva[0]) | (fsm_output[8]);
  assign or_114_nl = (fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[0]) | (~ (fsm_output[8]));
  assign mux_105_nl = MUX_s_1_2_2(or_115_nl, or_114_nl, fsm_output[1]);
  assign or_116_nl = (fsm_output[6]) | mux_105_nl;
  assign mux_107_nl = MUX_s_1_2_2(or_120_nl, or_116_nl, fsm_output[0]);
  assign or_363_nl = (fsm_output[5:4]!=2'b01) | mux_107_nl;
  assign mux_110_nl = MUX_s_1_2_2(or_362_nl, or_363_nl, fsm_output[2]);
  assign vec_rsc_0_0_i_wea_d_pff = ~(mux_110_nl | (fsm_output[3]));
  assign or_138_nl = (VEC_LOOP_j_sva_11_0[0]) | (fsm_output[7:6]!=2'b00);
  assign or_137_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_1_cse_2_sva[0])
      | (fsm_output[7:6]!=2'b01);
  assign mux_115_nl = MUX_s_1_2_2(or_138_nl, or_137_nl, fsm_output[0]);
  assign or_135_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (VEC_LOOP_j_sva_11_0[0])
      | (fsm_output[7:6]!=2'b10);
  assign or_134_nl = (~ modExp_exp_1_0_1_sva) | (COMP_LOOP_acc_1_cse_sva[0]) | nand_15_cse;
  assign mux_114_nl = MUX_s_1_2_2(or_135_nl, or_134_nl, fsm_output[0]);
  assign mux_116_nl = MUX_s_1_2_2(mux_115_nl, mux_114_nl, fsm_output[1]);
  assign nor_103_nl = ~((fsm_output[4]) | (fsm_output[2]) | mux_116_nl);
  assign nor_104_nl = ~((fsm_output[1:0]!=2'b11) | (z_out_1[1]) | (fsm_output[7:6]!=2'b00));
  assign nor_105_nl = ~((z_out_1[1]) | (fsm_output[7:6]!=2'b01));
  assign nor_106_nl = ~((z_out_1[1]) | (fsm_output[7:6]!=2'b10));
  assign mux_111_nl = MUX_s_1_2_2(nor_105_nl, nor_106_nl, fsm_output[0]);
  assign nor_107_nl = ~((fsm_output[0]) | (z_out_1[1]) | nand_15_cse);
  assign mux_112_nl = MUX_s_1_2_2(mux_111_nl, nor_107_nl, fsm_output[1]);
  assign mux_113_nl = MUX_s_1_2_2(nor_104_nl, mux_112_nl, fsm_output[2]);
  assign and_189_nl = (fsm_output[4]) & mux_113_nl;
  assign mux_117_nl = MUX_s_1_2_2(nor_103_nl, and_189_nl, fsm_output[3]);
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = mux_117_nl & and_dcpl;
  assign vec_rsc_0_1_i_adra_d = {COMP_LOOP_mux1h_3_rmff , COMP_LOOP_mux1h_40_rmff};
  assign and_188_nl = (fsm_output[6]) & (~ mux_tmp_106);
  assign nor_101_nl = ~((fsm_output[6]) | mux_108_cse);
  assign mux_122_nl = MUX_s_1_2_2(and_188_nl, nor_101_nl, fsm_output[0]);
  assign nand_36_nl = ~((~((fsm_output[5:4]!=2'b10) | (~ (COMP_LOOP_acc_10_cse_12_1_1_sva[0]))))
      & mux_122_nl);
  assign nand_5_nl = ~((fsm_output[6]) & (VEC_LOOP_j_sva_11_0[0]) & (~ mux_tmp_106));
  assign or_142_nl = (~ (fsm_output[7])) | (~ (COMP_LOOP_acc_1_cse_2_sva[0])) | (fsm_output[8]);
  assign or_141_nl = (fsm_output[7]) | (~((COMP_LOOP_acc_1_cse_sva[0]) & (fsm_output[8])));
  assign mux_118_nl = MUX_s_1_2_2(or_142_nl, or_141_nl, fsm_output[1]);
  assign or_143_nl = (fsm_output[6]) | mux_118_nl;
  assign mux_120_nl = MUX_s_1_2_2(nand_5_nl, or_143_nl, fsm_output[0]);
  assign or_361_nl = (fsm_output[5:4]!=2'b01) | mux_120_nl;
  assign mux_123_nl = MUX_s_1_2_2(nand_36_nl, or_361_nl, fsm_output[2]);
  assign vec_rsc_0_1_i_wea_d_pff = ~(mux_123_nl | (fsm_output[3]));
  assign or_159_nl = (~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[7:6]!=2'b00);
  assign nand_35_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm & (COMP_LOOP_acc_1_cse_2_sva[0])
      & (fsm_output[7:6]==2'b01));
  assign mux_128_nl = MUX_s_1_2_2(or_159_nl, nand_35_nl, fsm_output[0]);
  assign nand_20_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm & (VEC_LOOP_j_sva_11_0[0])
      & (fsm_output[7:6]==2'b10));
  assign nand_21_nl = ~(modExp_exp_1_0_1_sva & (COMP_LOOP_acc_1_cse_sva[0]) & (fsm_output[7:6]==2'b11));
  assign mux_127_nl = MUX_s_1_2_2(nand_20_nl, nand_21_nl, fsm_output[0]);
  assign mux_129_nl = MUX_s_1_2_2(mux_128_nl, mux_127_nl, fsm_output[1]);
  assign nor_96_nl = ~((fsm_output[4]) | (fsm_output[2]) | mux_129_nl);
  assign nor_97_nl = ~((fsm_output[1:0]!=2'b11) | (~ (z_out_1[1])) | (fsm_output[7:6]!=2'b00));
  assign nor_98_nl = ~((~ (z_out_1[1])) | (fsm_output[7:6]!=2'b01));
  assign nor_99_nl = ~((~ (z_out_1[1])) | (fsm_output[7:6]!=2'b10));
  assign mux_124_nl = MUX_s_1_2_2(nor_98_nl, nor_99_nl, fsm_output[0]);
  assign nor_100_nl = ~((fsm_output[0]) | (~((z_out_1[1]) & (fsm_output[7:6]==2'b11))));
  assign mux_125_nl = MUX_s_1_2_2(mux_124_nl, nor_100_nl, fsm_output[1]);
  assign mux_126_nl = MUX_s_1_2_2(nor_97_nl, mux_125_nl, fsm_output[2]);
  assign and_186_nl = (fsm_output[4]) & mux_126_nl;
  assign mux_130_nl = MUX_s_1_2_2(nor_96_nl, and_186_nl, fsm_output[3]);
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = mux_130_nl & and_dcpl;
  assign and_dcpl_168 = ~((fsm_output!=9'b000000001));
  assign and_dcpl_178 = and_dcpl & (fsm_output[4:3]==2'b11);
  assign and_dcpl_183 = (fsm_output[1]) & (~ (fsm_output[7])) & (~ (fsm_output[2]))
      & and_dcpl_44 & and_dcpl_178;
  assign and_dcpl_187 = and_dcpl_51 & and_dcpl_50 & and_dcpl_178;
  assign and_dcpl_191 = (~ (fsm_output[1])) & (fsm_output[7]) & (fsm_output[2]) &
      and_dcpl_44 & and_dcpl_178;
  assign and_259_cse = (fsm_output[1]) & (fsm_output[7]) & (fsm_output[2]) & and_dcpl_50
      & and_dcpl_178;
  assign and_dcpl_199 = and_dcpl_51 & and_dcpl_44 & (fsm_output[8]) & (fsm_output[5])
      & nor_177_cse;
  assign and_271_cse = and_dcpl_29 & (~ (fsm_output[2])) & and_dcpl_28 & and_dcpl
      & nor_177_cse;
  assign and_dcpl_214 = and_dcpl_35 & (~ (fsm_output[2])) & and_dcpl_44 & and_dcpl_178;
  assign and_dcpl_218 = and_dcpl_29 & (fsm_output[2]) & and_dcpl_50 & and_dcpl_178;
  assign and_dcpl_220 = (~ (fsm_output[8])) & (~ (fsm_output[5])) & nor_177_cse;
  assign and_dcpl_223 = and_dcpl_36 & and_dcpl_44 & and_dcpl_220;
  assign and_dcpl_229 = and_dcpl_36 & and_dcpl_28 & and_dcpl_220;
  assign and_dcpl_232 = (~ (fsm_output[8])) & (fsm_output[5]) & (fsm_output[3]) &
      (fsm_output[4]);
  assign and_dcpl_259 = (~ (fsm_output[7])) & (fsm_output[1]) & (~ (fsm_output[2]))
      & and_dcpl_28 & (~ (fsm_output[8])) & (fsm_output[5]) & nor_177_cse;
  assign and_dcpl_271 = (~((fsm_output[1]) ^ (fsm_output[7]))) & (fsm_output[2]);
  assign and_dcpl_273 = and_dcpl_271 & xor_dcpl & and_dcpl & (fsm_output[4:3]==2'b11);
  assign COMP_LOOP_or_ssc = and_dcpl_223 | and_259_cse | and_dcpl_229;
  assign or_tmp_321 = (fsm_output[2]) | (~ (fsm_output[8]));
  assign or_tmp_323 = (fsm_output[4]) | (~ (fsm_output[2])) | (fsm_output[8]);
  assign or_tmp_324 = ((fsm_output[4]) & (fsm_output[2])) | (fsm_output[8]);
  assign or_tmp_332 = ~((fsm_output[5]) & (fsm_output[2]) & (fsm_output[3]) & (fsm_output[4])
      & (~ (fsm_output[8])));
  assign nand_54_nl = ~((fsm_output[5]) & modExp_exp_1_0_1_sva & (fsm_output[2])
      & (fsm_output[3]) & (fsm_output[4]) & (~ (fsm_output[8])));
  assign mux_tmp_361 = MUX_s_1_2_2(nand_54_nl, or_tmp_332, fsm_output[1]);
  assign or_406_nl = (fsm_output[2]) | (~ (fsm_output[3])) | (fsm_output[4]) | (fsm_output[8]);
  assign or_405_nl = (~ modExp_exp_1_0_1_sva) | (~ (fsm_output[2])) | (fsm_output[3])
      | (fsm_output[4]) | (fsm_output[8]);
  assign mux_tmp_364 = MUX_s_1_2_2(or_406_nl, or_405_nl, fsm_output[5]);
  assign or_408_nl = (~ (fsm_output[5])) | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4])
      | (fsm_output[8]);
  assign mux_tmp_366 = MUX_s_1_2_2(mux_tmp_364, or_408_nl, fsm_output[1]);
  assign COMP_LOOP_or_16_itm = and_dcpl_214 | and_dcpl_218;
  always @(posedge clk) begin
    if ( mux_97_itm ) begin
      p_sva <= p_rsci_idat;
      r_sva <= r_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_31 & and_dcpl_27) | STAGE_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_0_1_obj_ld_cse <= 1'b0;
      modExp_exp_1_0_1_sva <= 1'b0;
      modExp_exp_1_0_1_sva_1 <= 1'b0;
      modExp_exp_1_7_1_sva <= 1'b0;
      modExp_exp_1_1_1_sva <= 1'b0;
    end
    else begin
      reg_vec_rsc_triosy_0_1_obj_ld_cse <= and_dcpl_37 & and_dcpl_83 & (fsm_output[8])
          & (~ STAGE_LOOP_acc_itm_2_1);
      modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_13_nl & (~(mux_tmp_99 & (~ (fsm_output[2]))
          & and_dcpl_44 & and_dcpl_40))) | mux_258_nl | (fsm_output[8]);
      modExp_exp_1_0_1_sva_1 <= (COMP_LOOP_mux_24_nl & (~(mux_312_nl & (~ (fsm_output[7]))
          & (~ (fsm_output[2])) & and_dcpl_40))) | mux_324_nl | or_12_cse;
      modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_20_nl & (~((~ mux_tmp_165) & and_dcpl_43));
      modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_37_nl & (~(and_dcpl_88 & and_dcpl_43));
    end
  end
  always @(posedge clk) begin
    modulo_result_rem_cmp_a <= MUX1HOT_v_64_4_2(z_out_5, operator_64_false_acc_mut_63_0,
        COMP_LOOP_1_acc_8_itm, COMP_LOOP_1_acc_5_mut_mx0w5, {modulo_result_or_nl
        , mux_150_nl , mux_163_nl , and_dcpl_95});
    modulo_result_rem_cmp_b <= p_sva;
    operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out, ({operator_64_false_acc_mut_64
        , operator_64_false_acc_mut_63_0}), and_dcpl_99);
    operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
        STAGE_LOOP_lshift_psp_sva, and_dcpl_99);
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_91_nl, mux_tmp_166, fsm_output[8]) ) begin
      STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( ~ mux_362_nl ) begin
      operator_64_false_acc_mut_64 <= operator_64_false_mux1h_2_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( ~ mux_380_nl ) begin
      operator_64_false_acc_mut_63_0 <= operator_64_false_mux1h_2_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_sva_11_0 <= 12'b000000000000;
    end
    else if ( and_dcpl_105 | VEC_LOOP_j_sva_11_0_mx0c1 ) begin
      VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(12'b000000000000, (z_out_1[11:0]), VEC_LOOP_j_sva_11_0_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_k_9_2_sva_6_0 <= 7'b0000000;
    end
    else if ( mux_383_nl & (fsm_output[2]) ) begin
      COMP_LOOP_k_9_2_sva_6_0 <= MUX_v_7_2_2(7'b0000000, (z_out_2[6:0]), or_nl);
    end
  end
  always @(posedge clk) begin
    if ( (modExp_while_and_3 | modExp_while_and_5 | modExp_result_sva_mx0c0 | (~
        mux_195_nl)) & (modExp_result_sva_mx0c0 | modExp_result_and_rgt | modExp_result_and_1_rgt)
        ) begin
      modExp_result_sva <= MUX1HOT_v_64_3_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
          modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, {modExp_result_sva_mx0c0
          , modExp_result_and_rgt , modExp_result_and_1_rgt});
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_206_nl & (~ (fsm_output[8]))) ) begin
      modExp_base_1_sva <= MUX1HOT_v_64_4_2(r_sva, modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
          modExp_result_sva, {and_124_nl , r_or_nl , r_or_1_nl , and_dcpl_120});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      tmp_2_lpi_4_dfm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( MUX_s_1_2_2(mux_213_nl, or_240_nl, fsm_output[8]) ) begin
      tmp_2_lpi_4_dfm <= MUX1HOT_v_64_3_2(({1'b0 , operator_64_false_slc_modExp_exp_63_1_3}),
          vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, {and_dcpl_105 , and_136_nl , and_137_nl});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= 1'b0;
    end
    else if ( and_dcpl_87 | and_dcpl_89 | and_dcpl_77 ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((~ (z_out_2[63])), (~
          z_out_4_8), (~ (readslicef_10_1_9(COMP_LOOP_1_acc_nl))), {and_dcpl_87 ,
          and_dcpl_89 , and_dcpl_77});
    end
  end
  always @(posedge clk) begin
    if ( (~(mux_290_nl | (fsm_output[4]) | (fsm_output[8]))) | and_dcpl_95 ) begin
      COMP_LOOP_1_acc_8_itm <= MUX_v_64_2_2(z_out_5, COMP_LOOP_1_acc_8_nl, and_dcpl_95);
    end
  end
  always @(posedge clk) begin
    if ( ~(or_tmp_156 | (fsm_output[0]) | (fsm_output[6]) | or_80_cse | or_12_cse)
        ) begin
      COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_2_sva <= 12'b000000000000;
    end
    else if ( mux_302_nl | (fsm_output[8]) ) begin
      COMP_LOOP_acc_1_cse_2_sva <= z_out[11:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_308_nl | (fsm_output[8]) ) begin
      COMP_LOOP_acc_11_psp_sva <= z_out_2[10:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 12'b000000000000;
    end
    else if ( ~ mux_311_nl ) begin
      COMP_LOOP_acc_1_cse_sva <= nl_COMP_LOOP_acc_1_cse_sva[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_6_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_149 ) begin
      modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[4]), modExp_exp_1_7_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[5]), {and_dcpl_148 , and_dcpl_152 , and_dcpl_150});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_5_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_149 ) begin
      modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[3]), modExp_exp_1_6_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[4]), {and_dcpl_148 , and_dcpl_152 , and_dcpl_150});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_4_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_149 ) begin
      modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[2]), modExp_exp_1_5_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[3]), {and_dcpl_148 , and_dcpl_152 , and_dcpl_150});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_3_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_149 ) begin
      modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[1]), modExp_exp_1_4_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[2]), {and_dcpl_148 , and_dcpl_152 , and_dcpl_150});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_2_1_sva <= 1'b0;
    end
    else if ( ~ and_dcpl_149 ) begin
      modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[0]), modExp_exp_1_3_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[1]), {and_dcpl_148 , and_dcpl_152 , and_dcpl_150});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_12_1_1_sva <= 12'b000000000000;
    end
    else if ( COMP_LOOP_or_1_cse ) begin
      COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out_1[12:1];
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_47 | and_dcpl_96 | and_dcpl_62 ) begin
      COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm <= MUX_s_1_2_2((z_out_2[9]), z_out_4_8,
          and_dcpl_96);
    end
  end
  assign modulo_result_or_nl = and_dcpl_87 | and_dcpl_89 | and_dcpl_91 | and_dcpl_96;
  assign or_179_nl = (fsm_output[0]) | (fsm_output[2]) | (~ mux_tmp_99);
  assign mux_146_nl = MUX_s_1_2_2(or_tmp_154, or_179_nl, fsm_output[6]);
  assign mux_147_nl = MUX_s_1_2_2(or_388_cse, mux_146_nl, fsm_output[3]);
  assign nor_93_nl = ~((fsm_output[3]) | mux_tmp_145);
  assign mux_148_nl = MUX_s_1_2_2(mux_147_nl, nor_93_nl, fsm_output[4]);
  assign or_174_nl = (~ (fsm_output[2])) | (fsm_output[7]);
  assign or_173_nl = (~((fsm_output[2:1]!=2'b00))) | (fsm_output[7]);
  assign mux_142_nl = MUX_s_1_2_2(or_174_nl, or_173_nl, fsm_output[0]);
  assign or_175_nl = (fsm_output[6]) | mux_142_nl;
  assign mux_143_nl = MUX_s_1_2_2(or_175_nl, mux_tmp_141, fsm_output[3]);
  assign mux_136_nl = MUX_s_1_2_2((~ (fsm_output[7])), or_356_cse, fsm_output[2]);
  assign mux_135_nl = MUX_s_1_2_2((fsm_output[7]), or_72_cse, fsm_output[2]);
  assign mux_137_nl = MUX_s_1_2_2(mux_136_nl, (~ mux_135_nl), fsm_output[0]);
  assign mux_133_nl = MUX_s_1_2_2(and_dcpl_35, or_356_cse, fsm_output[2]);
  assign mux_134_nl = MUX_s_1_2_2(and_tmp_7, mux_133_nl, fsm_output[0]);
  assign mux_138_nl = MUX_s_1_2_2(mux_137_nl, mux_134_nl, fsm_output[6]);
  assign mux_140_nl = MUX_s_1_2_2((~ mux_tmp_139), mux_138_nl, fsm_output[3]);
  assign mux_144_nl = MUX_s_1_2_2(mux_143_nl, mux_140_nl, fsm_output[4]);
  assign mux_149_nl = MUX_s_1_2_2(mux_148_nl, (~ mux_144_nl), fsm_output[5]);
  assign or_164_nl = (fsm_output[6]) | (~((fsm_output[2:0]!=3'b011))) | (fsm_output[7]);
  assign mux_131_nl = MUX_s_1_2_2(or_388_cse, or_164_nl, fsm_output[3]);
  assign mux_132_nl = MUX_s_1_2_2(mux_131_nl, or_tmp_135, fsm_output[4]);
  assign nor_95_nl = ~((fsm_output[5]) | mux_132_nl);
  assign mux_150_nl = MUX_s_1_2_2(mux_149_nl, nor_95_nl, fsm_output[8]);
  assign mux_161_nl = MUX_s_1_2_2(mux_tmp_145, or_tmp_159, fsm_output[3]);
  assign and_183_nl = (fsm_output[4]) & mux_161_nl;
  assign mux_156_nl = MUX_s_1_2_2(and_dcpl_67, and_dcpl_74, fsm_output[2]);
  assign mux_157_nl = MUX_s_1_2_2(mux_156_nl, and_211_cse, fsm_output[0]);
  assign mux_155_nl = MUX_s_1_2_2(and_dcpl_67, or_72_cse, fsm_output[2]);
  assign mux_158_nl = MUX_s_1_2_2(mux_157_nl, mux_155_nl, fsm_output[6]);
  assign mux_159_nl = MUX_s_1_2_2(mux_158_nl, mux_tmp_141, fsm_output[3]);
  assign or_187_nl = (fsm_output[6]) | (fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]);
  assign mux_154_nl = MUX_s_1_2_2(mux_tmp_139, or_187_nl, fsm_output[3]);
  assign mux_160_nl = MUX_s_1_2_2(mux_159_nl, (~ mux_154_nl), fsm_output[4]);
  assign mux_162_nl = MUX_s_1_2_2(and_183_nl, mux_160_nl, fsm_output[5]);
  assign mux_152_nl = MUX_s_1_2_2(or_tmp_159, or_388_cse, fsm_output[3]);
  assign and_184_nl = (fsm_output[4]) & (~ mux_152_nl);
  assign nor_92_nl = ~((fsm_output[4]) | (fsm_output[3]) | (fsm_output[6]) | mux_tmp_151);
  assign mux_153_nl = MUX_s_1_2_2(and_184_nl, nor_92_nl, fsm_output[5]);
  assign mux_163_nl = MUX_s_1_2_2(mux_162_nl, mux_153_nl, fsm_output[8]);
  assign nl_COMP_LOOP_acc_12_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:3]))})
      + conv_u2u_7_8(COMP_LOOP_k_9_2_sva_6_0) + 8'b00000001;
  assign COMP_LOOP_acc_12_nl = nl_COMP_LOOP_acc_12_nl[7:0];
  assign COMP_LOOP_and_3_nl = (~ and_dcpl_113) & and_dcpl_105;
  assign nor_75_nl = ~(and_214_cse | (fsm_output[7]) | (~ (fsm_output[4])));
  assign nor_76_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[0])) | (fsm_output[7])
      | (fsm_output[4]));
  assign mux_235_nl = MUX_s_1_2_2(nor_75_nl, nor_76_nl, fsm_output[2]);
  assign or_349_nl = (fsm_output[2]) | nor_77_cse | (fsm_output[4]);
  assign mux_236_nl = MUX_s_1_2_2(mux_235_nl, or_349_nl, fsm_output[5]);
  assign mux_231_nl = MUX_s_1_2_2((fsm_output[7]), or_270_cse, fsm_output[0]);
  assign mux_232_nl = MUX_s_1_2_2((~ (fsm_output[4])), mux_231_nl, fsm_output[1]);
  assign mux_233_nl = MUX_s_1_2_2(or_tmp_226, mux_232_nl, fsm_output[2]);
  assign mux_234_nl = MUX_s_1_2_2((~ or_tmp_229), mux_233_nl, fsm_output[5]);
  assign mux_237_nl = MUX_s_1_2_2(mux_236_nl, mux_234_nl, fsm_output[3]);
  assign or_257_nl = (~ (fsm_output[7])) | (fsm_output[4]);
  assign mux_227_nl = MUX_s_1_2_2(or_tmp_229, or_257_nl, and_214_cse);
  assign or_256_nl = (fsm_output[1]) | (fsm_output[0]) | (~ (fsm_output[7])) | (fsm_output[4]);
  assign mux_228_nl = MUX_s_1_2_2(mux_227_nl, or_256_nl, fsm_output[2]);
  assign mux_229_nl = MUX_s_1_2_2((fsm_output[7]), mux_228_nl, fsm_output[5]);
  assign mux_224_nl = MUX_s_1_2_2(or_270_cse, (~ (fsm_output[4])), or_351_cse);
  assign mux_225_nl = MUX_s_1_2_2(or_tmp_226, mux_224_nl, fsm_output[2]);
  assign mux_226_nl = MUX_s_1_2_2((fsm_output[7]), mux_225_nl, fsm_output[5]);
  assign mux_230_nl = MUX_s_1_2_2(mux_229_nl, mux_226_nl, fsm_output[3]);
  assign mux_238_nl = MUX_s_1_2_2(mux_237_nl, mux_230_nl, fsm_output[6]);
  assign COMP_LOOP_mux1h_13_nl = MUX1HOT_s_1_6_2((operator_66_true_div_cmp_z[0]),
      (tmp_2_lpi_4_dfm[0]), (z_out_1[7]), modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva,
      (readslicef_8_1_7(COMP_LOOP_acc_12_nl)), {COMP_LOOP_and_3_nl , and_dcpl_113
      , and_dcpl_41 , and_dcpl_133 , mux_238_nl , and_dcpl_70});
  assign mux_256_nl = MUX_s_1_2_2(mux_tmp_249, or_tmp_237, fsm_output[3]);
  assign or_271_nl = (fsm_output[5]) | and_170_cse;
  assign mux_254_nl = MUX_s_1_2_2(mux_tmp_247, or_271_nl, fsm_output[0]);
  assign mux_253_nl = MUX_s_1_2_2(mux_tmp_241, or_270_cse, fsm_output[5]);
  assign mux_255_nl = MUX_s_1_2_2(mux_254_nl, mux_253_nl, fsm_output[3]);
  assign mux_257_nl = MUX_s_1_2_2(mux_256_nl, mux_255_nl, fsm_output[2]);
  assign mux_250_nl = MUX_s_1_2_2(mux_tmp_249, mux_tmp_247, fsm_output[0]);
  assign or_267_nl = (~ (fsm_output[4])) | (fsm_output[6]) | (fsm_output[7]);
  assign mux_245_nl = MUX_s_1_2_2(mux_tmp_241, or_267_nl, fsm_output[5]);
  assign mux_246_nl = MUX_s_1_2_2(or_tmp_237, mux_245_nl, fsm_output[0]);
  assign mux_251_nl = MUX_s_1_2_2(mux_250_nl, mux_246_nl, fsm_output[3]);
  assign mux_242_nl = MUX_s_1_2_2((~ mux_tmp_241), and_tmp_10, fsm_output[5]);
  assign mux_240_nl = MUX_s_1_2_2((~ mux_tmp_43), and_tmp_10, fsm_output[5]);
  assign mux_243_nl = MUX_s_1_2_2(mux_242_nl, mux_240_nl, fsm_output[0]);
  assign mux_244_nl = MUX_s_1_2_2((~ or_tmp_237), mux_243_nl, fsm_output[3]);
  assign mux_252_nl = MUX_s_1_2_2((~ mux_251_nl), mux_244_nl, fsm_output[2]);
  assign mux_258_nl = MUX_s_1_2_2((~ mux_257_nl), mux_252_nl, fsm_output[1]);
  assign and_158_nl = (~ mux_tmp_164) & xor_dcpl & and_dcpl_43;
  assign COMP_LOOP_mux_24_nl = MUX_s_1_2_2(modExp_exp_1_0_1_sva_1, modExp_exp_1_1_1_sva,
      and_158_nl);
  assign nor_62_nl = ~((fsm_output[1:0]!=2'b01));
  assign nor_63_nl = ~((fsm_output[1:0]!=2'b10));
  assign mux_312_nl = MUX_s_1_2_2(nor_62_nl, nor_63_nl, fsm_output[6]);
  assign or_334_nl = (fsm_output[0]) | nand_15_cse;
  assign mux_321_nl = MUX_s_1_2_2(nor_172_cse, or_334_nl, fsm_output[2]);
  assign mux_322_nl = MUX_s_1_2_2(mux_321_nl, or_333_cse, fsm_output[1]);
  assign mux_323_nl = MUX_s_1_2_2(mux_322_nl, or_388_cse, fsm_output[4]);
  assign nor_60_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[6])
      | (fsm_output[7]));
  assign and_169_nl = ((~ (fsm_output[0])) | (fsm_output[6])) & (fsm_output[7]);
  assign mux_318_nl = MUX_s_1_2_2(or_388_cse, and_169_nl, fsm_output[2]);
  assign or_329_nl = (fsm_output[2]) | nor_172_cse;
  assign mux_319_nl = MUX_s_1_2_2((~ mux_318_nl), or_329_nl, fsm_output[1]);
  assign mux_320_nl = MUX_s_1_2_2(nor_60_nl, mux_319_nl, fsm_output[4]);
  assign mux_324_nl = MUX_s_1_2_2((~ mux_323_nl), mux_320_nl, fsm_output[3]);
  assign COMP_LOOP_mux1h_20_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0[5]), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_2_sva_6_0[6]), {and_dcpl_148 , and_dcpl_89
      , and_dcpl_149 , and_dcpl_150});
  assign and_165_nl = (fsm_output[3]) & mux_tmp_172;
  assign mux_330_nl = MUX_s_1_2_2(not_tmp_190, and_165_nl, fsm_output[4]);
  assign and_166_nl = (~ mux_330_nl) & and_dcpl;
  assign COMP_LOOP_mux1h_37_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0[6]), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_2_sva_6_0[0]), {and_dcpl_148 , and_dcpl_152
      , and_166_nl , and_dcpl_150});
  assign nor_91_nl = ~((fsm_output[7:1]!=7'b0000000));
  assign nor_181_nl = ~((~((~((fsm_output[0]) | (fsm_output[4]))) | (fsm_output[2])))
      | (fsm_output[8]));
  assign mux_358_nl = MUX_s_1_2_2(nor_181_nl, or_tmp_324, fsm_output[6]);
  assign or_398_nl = (or_425_cse & (fsm_output[4]) & (fsm_output[2])) | (fsm_output[8]);
  assign mux_359_nl = MUX_s_1_2_2(mux_358_nl, or_398_nl, fsm_output[7]);
  assign nor_184_nl = ~((fsm_output[2]) | (fsm_output[8]));
  assign mux_355_nl = MUX_s_1_2_2(nor_184_nl, or_tmp_321, fsm_output[4]);
  assign or_395_nl = (fsm_output[4]) | (fsm_output[2]) | (fsm_output[8]);
  assign mux_354_nl = MUX_s_1_2_2(or_tmp_324, or_395_nl, fsm_output[0]);
  assign mux_356_nl = MUX_s_1_2_2(mux_355_nl, mux_354_nl, fsm_output[6]);
  assign mux_357_nl = MUX_s_1_2_2(mux_356_nl, or_tmp_324, fsm_output[7]);
  assign mux_360_nl = MUX_s_1_2_2(mux_359_nl, mux_357_nl, fsm_output[1]);
  assign mux_351_nl = MUX_s_1_2_2((fsm_output[4]), or_410_cse, fsm_output[6]);
  assign mux_349_nl = MUX_s_1_2_2(or_tmp_323, or_410_cse, fsm_output[0]);
  assign mux_348_nl = MUX_s_1_2_2(or_410_cse, or_tmp_323, fsm_output[0]);
  assign mux_350_nl = MUX_s_1_2_2(mux_349_nl, mux_348_nl, fsm_output[6]);
  assign mux_352_nl = MUX_s_1_2_2(mux_351_nl, mux_350_nl, fsm_output[7]);
  assign or_392_nl = (fsm_output[4]) | (~ or_tmp_321);
  assign and_344_nl = (fsm_output[4]) & ((~ (fsm_output[2])) | (fsm_output[8]));
  assign mux_346_nl = MUX_s_1_2_2(or_392_nl, and_344_nl, fsm_output[0]);
  assign mux_347_nl = MUX_s_1_2_2(mux_346_nl, or_410_cse, or_388_cse);
  assign mux_353_nl = MUX_s_1_2_2(mux_352_nl, mux_347_nl, fsm_output[1]);
  assign mux_361_nl = MUX_s_1_2_2(mux_360_nl, mux_353_nl, fsm_output[3]);
  assign or_387_nl = (~(nor_172_cse | (fsm_output[4]) | (fsm_output[2]))) | (fsm_output[8]);
  assign or_385_nl = (~(nor_171_cse | (fsm_output[4]) | (fsm_output[2]))) | (fsm_output[8]);
  assign mux_nl = MUX_s_1_2_2((fsm_output[8]), or_385_nl, fsm_output[7]);
  assign mux_344_nl = MUX_s_1_2_2(or_387_nl, mux_nl, fsm_output[1]);
  assign mux_345_nl = MUX_s_1_2_2(mux_344_nl, (fsm_output[8]), fsm_output[3]);
  assign mux_362_nl = MUX_s_1_2_2(mux_361_nl, mux_345_nl, fsm_output[5]);
  assign or_417_nl = (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[8]);
  assign nor_179_nl = ~((fsm_output[3]) | (fsm_output[4]) | (fsm_output[8]));
  assign nor_180_nl = ~((~ (fsm_output[3])) | (fsm_output[4]) | (fsm_output[8]));
  assign mux_375_nl = MUX_s_1_2_2(nor_179_nl, nor_180_nl, fsm_output[2]);
  assign nand_52_nl = ~(modExp_exp_1_0_1_sva & mux_375_nl);
  assign mux_376_nl = MUX_s_1_2_2(or_417_nl, nand_52_nl, fsm_output[5]);
  assign mux_377_nl = MUX_s_1_2_2(or_tmp_332, mux_376_nl, fsm_output[1]);
  assign mux_378_nl = MUX_s_1_2_2(mux_377_nl, mux_tmp_361, fsm_output[7]);
  assign or_414_nl = (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[8]);
  assign or_412_nl = (~ (fsm_output[3])) | (fsm_output[4]) | (~ (fsm_output[8]));
  assign or_409_nl = (~ (fsm_output[4])) | (fsm_output[8]);
  assign mux_371_nl = MUX_s_1_2_2(or_410_cse, or_409_nl, fsm_output[3]);
  assign mux_372_nl = MUX_s_1_2_2(or_412_nl, mux_371_nl, fsm_output[2]);
  assign or_413_nl = (fsm_output[5]) | mux_372_nl;
  assign mux_373_nl = MUX_s_1_2_2(or_414_nl, or_413_nl, fsm_output[1]);
  assign mux_374_nl = MUX_s_1_2_2(mux_373_nl, mux_tmp_366, fsm_output[7]);
  assign mux_379_nl = MUX_s_1_2_2(mux_378_nl, mux_374_nl, fsm_output[0]);
  assign or_407_nl = (~ (fsm_output[5])) | (~ (fsm_output[2])) | (fsm_output[3])
      | (fsm_output[4]) | (fsm_output[8]);
  assign mux_367_nl = MUX_s_1_2_2(or_407_nl, mux_tmp_364, fsm_output[1]);
  assign mux_369_nl = MUX_s_1_2_2(mux_tmp_366, mux_367_nl, fsm_output[7]);
  assign or_404_nl = (~ (fsm_output[5])) | (~ modExp_exp_1_0_1_sva) | (fsm_output[2])
      | (~ (fsm_output[3])) | (~ (fsm_output[4])) | (fsm_output[8]);
  assign mux_364_nl = MUX_s_1_2_2(or_tmp_332, or_404_nl, fsm_output[1]);
  assign mux_365_nl = MUX_s_1_2_2(mux_364_nl, mux_tmp_361, fsm_output[7]);
  assign mux_370_nl = MUX_s_1_2_2(mux_369_nl, mux_365_nl, fsm_output[0]);
  assign mux_380_nl = MUX_s_1_2_2(mux_379_nl, mux_370_nl, fsm_output[6]);
  assign or_352_nl = (fsm_output[3]) | (fsm_output[0]) | (~ (fsm_output[1]));
  assign nand_18_nl = ~((fsm_output[3]) & (fsm_output[0]) & (fsm_output[1]));
  assign mux_187_nl = MUX_s_1_2_2(or_352_nl, nand_18_nl, fsm_output[4]);
  assign or_210_nl = (fsm_output[5]) | mux_187_nl;
  assign or_207_nl = (~ (fsm_output[5])) | (fsm_output[4]) | (fsm_output[3]) | (~
      (fsm_output[0])) | (fsm_output[1]);
  assign mux_188_nl = MUX_s_1_2_2(or_210_nl, or_207_nl, fsm_output[8]);
  assign or_nl = mux_188_nl | (fsm_output[7]) | (~ (fsm_output[2])) | (fsm_output[6]);
  assign or_423_nl = (~ (fsm_output[8])) | (~ (fsm_output[5])) | (~ (fsm_output[0]))
      | (fsm_output[4]) | (fsm_output[3]);
  assign mux_381_nl = MUX_s_1_2_2(nor_177_cse, nor_tmp_8, fsm_output[0]);
  assign or_422_nl = (fsm_output[8]) | (fsm_output[5]) | (~ mux_381_nl);
  assign mux_382_nl = MUX_s_1_2_2(or_423_nl, or_422_nl, fsm_output[1]);
  assign nor_176_nl = ~((fsm_output[7]) | mux_382_nl);
  assign nor_178_nl = ~((~ (fsm_output[7])) | (~ (fsm_output[1])) | (fsm_output[8])
      | (~ (fsm_output[5])) | (fsm_output[0]) | (~ nor_tmp_8));
  assign mux_383_nl = MUX_s_1_2_2(nor_176_nl, nor_178_nl, fsm_output[6]);
  assign or_218_nl = (fsm_output[3]) | (fsm_output[6]) | (~ (fsm_output[0])) | (fsm_output[2])
      | (~ (fsm_output[1])) | (fsm_output[7]);
  assign mux_194_nl = MUX_s_1_2_2(or_tmp_135, or_218_nl, fsm_output[4]);
  assign nor_87_nl = ~((fsm_output[5]) | mux_194_nl);
  assign mux_195_nl = MUX_s_1_2_2(nor_87_nl, mux_tmp_166, fsm_output[8]);
  assign and_124_nl = and_dcpl_37 & and_dcpl_27;
  assign r_or_nl = ((~ (modulo_result_rem_cmp_z[63])) & and_129_m1c) | (not_tmp_136
      & and_dcpl & (~ (modulo_result_rem_cmp_z[63])));
  assign r_or_1_nl = ((modulo_result_rem_cmp_z[63]) & and_129_m1c) | (not_tmp_136
      & and_dcpl & (modulo_result_rem_cmp_z[63]));
  assign nor_80_nl = ~((fsm_output[3]) | (fsm_output[4]) | (~ (fsm_output[2])) |
      (fsm_output[6]) | (~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[7]));
  assign nor_81_nl = ~((fsm_output[0]) | (~ (fsm_output[1])) | (fsm_output[7]));
  assign nor_82_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[7]));
  assign mux_202_nl = MUX_s_1_2_2(nor_81_nl, nor_82_nl, fsm_output[6]);
  assign nor_83_nl = ~((fsm_output[0]) | (fsm_output[1]) | (~ (fsm_output[7])));
  assign mux_201_nl = MUX_s_1_2_2(nor_83_nl, nor_84_cse, fsm_output[6]);
  assign mux_203_nl = MUX_s_1_2_2(mux_202_nl, mux_201_nl, fsm_output[2]);
  assign and_179_nl = or_351_cse & (fsm_output[7]);
  assign mux_199_nl = MUX_s_1_2_2(and_179_nl, or_72_cse, fsm_output[6]);
  assign mux_200_nl = MUX_s_1_2_2(mux_199_nl, or_388_cse, fsm_output[2]);
  assign mux_204_nl = MUX_s_1_2_2(mux_203_nl, mux_200_nl, fsm_output[4]);
  assign nor_85_nl = ~(nor_171_cse | (fsm_output[1]) | (~ (fsm_output[7])));
  assign mux_198_nl = MUX_s_1_2_2(or_388_cse, nor_85_nl, fsm_output[2]);
  assign and_180_nl = (fsm_output[4]) & mux_198_nl;
  assign mux_205_nl = MUX_s_1_2_2(mux_204_nl, and_180_nl, fsm_output[3]);
  assign mux_206_nl = MUX_s_1_2_2(nor_80_nl, mux_205_nl, fsm_output[5]);
  assign mux_216_nl = MUX_s_1_2_2(or_tmp_192, or_tmp_162, COMP_LOOP_acc_1_cse_2_sva[0]);
  assign mux_217_nl = MUX_s_1_2_2(or_tmp_218, mux_216_nl, fsm_output[6]);
  assign or_245_nl = (COMP_LOOP_acc_1_cse_2_sva[0]) | (fsm_output[0]) | (fsm_output[2])
      | (~ (fsm_output[1])) | (fsm_output[7]);
  assign mux_215_nl = MUX_s_1_2_2(or_tmp_218, or_245_nl, fsm_output[6]);
  assign mux_218_nl = MUX_s_1_2_2(mux_217_nl, mux_215_nl, COMP_LOOP_acc_1_cse_sva[0]);
  assign and_136_nl = (~ mux_218_nl) & and_dcpl_40;
  assign or_250_nl = (~ (COMP_LOOP_acc_1_cse_2_sva[0])) | (fsm_output[0]) | (fsm_output[2])
      | (~ (fsm_output[1])) | (fsm_output[7]);
  assign mux_221_nl = MUX_s_1_2_2(or_tmp_220, or_250_nl, fsm_output[6]);
  assign mux_219_nl = MUX_s_1_2_2(or_tmp_162, or_tmp_192, COMP_LOOP_acc_1_cse_2_sva[0]);
  assign mux_220_nl = MUX_s_1_2_2(or_tmp_220, mux_219_nl, fsm_output[6]);
  assign mux_222_nl = MUX_s_1_2_2(mux_221_nl, mux_220_nl, COMP_LOOP_acc_1_cse_sva[0]);
  assign and_137_nl = (~ mux_222_nl) & and_dcpl_40;
  assign and_177_nl = ((fsm_output[2:0]!=3'b000)) & (fsm_output[7]);
  assign mux_210_nl = MUX_s_1_2_2(and_177_nl, or_tmp_174, fsm_output[6]);
  assign mux_211_nl = MUX_s_1_2_2((~ or_tmp_214), mux_210_nl, fsm_output[3]);
  assign mux_209_nl = MUX_s_1_2_2(or_388_cse, or_tmp_214, fsm_output[3]);
  assign mux_212_nl = MUX_s_1_2_2(mux_211_nl, mux_209_nl, fsm_output[4]);
  assign nor_78_nl = ~((fsm_output[4:3]!=2'b00) | mux_tmp_172);
  assign mux_213_nl = MUX_s_1_2_2(mux_212_nl, nor_78_nl, fsm_output[5]);
  assign or_239_nl = (fsm_output[6]) | mux_tmp_151;
  assign mux_208_nl = MUX_s_1_2_2(or_388_cse, or_239_nl, fsm_output[3]);
  assign or_240_nl = (fsm_output[5:4]!=2'b00) | mux_208_nl;
  assign nl_COMP_LOOP_1_acc_nl = ({(z_out_2[7:0]) , 2'b00}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))})
      + 10'b0000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[9:0];
  assign nl_COMP_LOOP_1_acc_8_nl = tmp_2_lpi_4_dfm - modExp_base_1_sva_mx1;
  assign COMP_LOOP_1_acc_8_nl = nl_COMP_LOOP_1_acc_8_nl[63:0];
  assign or_368_nl = (~ (fsm_output[3])) | (fsm_output[6]) | (fsm_output[0]) | (fsm_output[2])
      | (fsm_output[1]) | (fsm_output[7]);
  assign mux_289_nl = MUX_s_1_2_2(mux_288_cse, nand_tmp_10, fsm_output[6]);
  assign or_369_nl = (fsm_output[3]) | mux_289_nl;
  assign mux_290_nl = MUX_s_1_2_2(or_368_nl, or_369_nl, fsm_output[5]);
  assign nand_41_nl = ~((~((fsm_output[2:1]==2'b11))) & (fsm_output[7]));
  assign mux_297_nl = MUX_s_1_2_2(nand_41_nl, or_333_cse, fsm_output[0]);
  assign mux_298_nl = MUX_s_1_2_2(mux_297_nl, (fsm_output[7]), fsm_output[6]);
  assign or_318_nl = (fsm_output[7:6]!=2'b01);
  assign mux_299_nl = MUX_s_1_2_2(mux_298_nl, or_318_nl, fsm_output[3]);
  assign mux_301_nl = MUX_s_1_2_2(mux_tmp_43, mux_299_nl, fsm_output[4]);
  assign or_317_nl = (~((fsm_output[4]) | (fsm_output[3]) | (fsm_output[6]) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[1]))) | (fsm_output[7]);
  assign mux_302_nl = MUX_s_1_2_2(mux_301_nl, or_317_nl, fsm_output[5]);
  assign mux_305_nl = MUX_s_1_2_2((~ (fsm_output[7])), and_dcpl_75, fsm_output[6]);
  assign mux_306_nl = MUX_s_1_2_2(mux_305_nl, mux_tmp_43, fsm_output[3]);
  assign mux_307_nl = MUX_s_1_2_2(not_tmp_50, mux_306_nl, fsm_output[4]);
  assign nor_65_nl = ~((fsm_output[0]) | (fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]));
  assign mux_303_nl = MUX_s_1_2_2(nor_65_nl, (fsm_output[7]), fsm_output[6]);
  assign mux_304_nl = MUX_s_1_2_2(mux_303_nl, and_170_cse, or_80_cse);
  assign mux_308_nl = MUX_s_1_2_2(mux_307_nl, mux_304_nl, fsm_output[5]);
  assign nl_COMP_LOOP_acc_1_cse_sva  = VEC_LOOP_j_sva_11_0 + conv_u2u_9_12({COMP_LOOP_k_9_2_sva_6_0
      , 2'b11});
  assign or_324_nl = (fsm_output[4]) | (fsm_output[3]) | (fsm_output[6]) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]);
  assign mux_310_nl = MUX_s_1_2_2(or_388_cse, or_324_nl, fsm_output[5]);
  assign mux_309_nl = MUX_s_1_2_2(or_388_cse, or_tmp_135, fsm_output[4]);
  assign nor_64_nl = ~((fsm_output[5]) | mux_309_nl);
  assign mux_311_nl = MUX_s_1_2_2(mux_310_nl, nor_64_nl, fsm_output[8]);
  assign COMP_LOOP_mux_27_nl = MUX_v_64_2_2(({52'b0000000000000000000000000000000000000000000000000000
      , VEC_LOOP_j_sva_11_0}), p_sva, and_dcpl_168);
  assign COMP_LOOP_COMP_LOOP_or_6_nl = MUX_v_7_2_2(COMP_LOOP_k_9_2_sva_6_0, 7'b1111111,
      and_dcpl_168);
  assign nl_z_out = conv_u2u_64_65(COMP_LOOP_mux_27_nl) + conv_s2u_10_65({and_dcpl_168
      , COMP_LOOP_COMP_LOOP_or_6_nl , and_dcpl_168 , 1'b1});
  assign z_out = nl_z_out[64:0];
  assign operator_64_false_1_or_2_nl = and_dcpl_183 | and_dcpl_187 | and_dcpl_191
      | and_259_cse | and_dcpl_199;
  assign operator_64_false_1_mux_11_nl = MUX_v_12_2_2(({5'b00001 , (~ COMP_LOOP_k_9_2_sva_6_0)}),
      VEC_LOOP_j_sva_11_0, operator_64_false_1_or_2_nl);
  assign and_350_nl = (~ (fsm_output[1])) & (fsm_output[7]) & (fsm_output[2]) & and_dcpl_44
      & and_dcpl_232;
  assign COMP_LOOP_mux_29_nl = MUX_v_2_2_2(2'b10, 2'b01, and_350_nl);
  assign and_351_nl = (fsm_output[1]) & (~ (fsm_output[7])) & (~ (fsm_output[2]))
      & and_dcpl_44 & and_dcpl_232;
  assign COMP_LOOP_COMP_LOOP_nor_5_nl = ~(MUX_v_2_2_2(COMP_LOOP_mux_29_nl, 2'b11,
      and_351_nl));
  assign and_352_nl = (fsm_output[1]) & (fsm_output[7]) & (fsm_output[2]) & and_dcpl_50
      & and_dcpl_232;
  assign COMP_LOOP_COMP_LOOP_or_11_nl = MUX_v_2_2_2(COMP_LOOP_COMP_LOOP_nor_5_nl,
      2'b11, and_352_nl);
  assign nl_COMP_LOOP_acc_18_nl = STAGE_LOOP_lshift_psp_sva + conv_u2u_9_10({COMP_LOOP_k_9_2_sva_6_0
      , COMP_LOOP_COMP_LOOP_or_11_nl});
  assign COMP_LOOP_acc_18_nl = nl_COMP_LOOP_acc_18_nl[9:0];
  assign operator_64_false_1_or_3_nl = and_dcpl_183 | and_dcpl_187 | and_dcpl_191
      | and_259_cse;
  assign operator_64_false_1_mux1h_1_nl = MUX1HOT_v_10_3_2(10'b0000000001, COMP_LOOP_acc_18_nl,
      STAGE_LOOP_lshift_psp_sva, {and_271_cse , operator_64_false_1_or_3_nl , and_dcpl_199});
  assign nl_z_out_1 = conv_u2u_12_13(operator_64_false_1_mux_11_nl) + conv_u2u_10_13(operator_64_false_1_mux1h_1_nl);
  assign z_out_1 = nl_z_out_1[12:0];
  assign COMP_LOOP_COMP_LOOP_or_7_nl = (~(and_271_cse | and_dcpl_214 | and_dcpl_218
      | and_259_cse)) | and_dcpl_223 | and_dcpl_229;
  assign COMP_LOOP_COMP_LOOP_or_8_nl = (~((operator_66_true_div_cmp_z[63]) | and_271_cse
      | and_dcpl_214 | and_dcpl_218 | and_259_cse)) | and_dcpl_223;
  assign COMP_LOOP_mux_28_nl = MUX_v_52_2_2((operator_64_false_acc_mut_63_0[62:11]),
      (operator_66_true_div_cmp_z[62:11]), and_dcpl_229);
  assign COMP_LOOP_or_23_nl = and_271_cse | and_dcpl_214 | and_dcpl_218 | and_259_cse;
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl = ~(MUX_v_52_2_2(COMP_LOOP_mux_28_nl,
      52'b1111111111111111111111111111111111111111111111111111, COMP_LOOP_or_23_nl));
  assign COMP_LOOP_mux1h_71_nl = MUX1HOT_v_2_4_2((~ (VEC_LOOP_j_sva_11_0[11:10])),
      2'b10, (operator_64_false_acc_mut_63_0[10:9]), (operator_66_true_div_cmp_z[10:9]),
      {and_271_cse , COMP_LOOP_or_16_itm , and_dcpl_223 , and_dcpl_229});
  assign COMP_LOOP_COMP_LOOP_nor_4_nl = ~(MUX_v_2_2_2(COMP_LOOP_mux1h_71_nl, 2'b11,
      and_259_cse));
  assign COMP_LOOP_mux1h_72_nl = MUX1HOT_v_9_5_2((VEC_LOOP_j_sva_11_0[9:1]), (~ (STAGE_LOOP_lshift_psp_sva[9:1])),
      (~ (operator_64_false_acc_mut_63_0[8:0])), ({2'b00 , COMP_LOOP_k_9_2_sva_6_0}),
      (~ (operator_66_true_div_cmp_z[8:0])), {and_271_cse , COMP_LOOP_or_16_itm ,
      and_dcpl_223 , and_259_cse , and_dcpl_229});
  assign COMP_LOOP_or_24_nl = (~(and_271_cse | and_dcpl_223 | and_259_cse | and_dcpl_229))
      | and_dcpl_214 | and_dcpl_218;
  assign COMP_LOOP_COMP_LOOP_mux_2_nl = MUX_v_7_2_2(({1'b0 , (COMP_LOOP_k_9_2_sva_6_0[6:1])}),
      COMP_LOOP_k_9_2_sva_6_0, COMP_LOOP_or_16_itm);
  assign COMP_LOOP_not_68_nl = ~ COMP_LOOP_or_ssc;
  assign COMP_LOOP_and_10_nl = MUX_v_7_2_2(7'b0000000, COMP_LOOP_COMP_LOOP_mux_2_nl,
      COMP_LOOP_not_68_nl);
  assign COMP_LOOP_COMP_LOOP_or_9_nl = ((COMP_LOOP_k_9_2_sva_6_0[0]) & (~(and_dcpl_214
      | COMP_LOOP_or_ssc))) | and_dcpl_218;
  assign COMP_LOOP_COMP_LOOP_or_10_nl = (~ and_dcpl_218) | and_271_cse | and_dcpl_214
      | COMP_LOOP_or_ssc;
  assign nl_acc_2_nl = ({COMP_LOOP_COMP_LOOP_or_7_nl , COMP_LOOP_COMP_LOOP_or_8_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl , COMP_LOOP_COMP_LOOP_nor_4_nl , COMP_LOOP_mux1h_72_nl
      , COMP_LOOP_or_24_nl}) + conv_u2u_10_66({COMP_LOOP_and_10_nl , COMP_LOOP_COMP_LOOP_or_9_nl
      , COMP_LOOP_COMP_LOOP_or_10_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[65:0];
  assign z_out_2 = readslicef_66_65_1(acc_2_nl);
  assign operator_64_false_1_mux_12_nl = MUX_s_1_2_2((~ modExp_exp_1_7_1_sva), (~
      modExp_exp_1_1_1_sva), and_dcpl_259);
  assign operator_64_false_1_mux_13_nl = MUX_s_1_2_2((~ modExp_exp_1_6_1_sva), (~
      modExp_exp_1_7_1_sva), and_dcpl_259);
  assign operator_64_false_1_mux_14_nl = MUX_s_1_2_2((~ modExp_exp_1_5_1_sva), (~
      modExp_exp_1_6_1_sva), and_dcpl_259);
  assign operator_64_false_1_mux_15_nl = MUX_s_1_2_2((~ modExp_exp_1_4_1_sva), (~
      modExp_exp_1_5_1_sva), and_dcpl_259);
  assign operator_64_false_1_mux_16_nl = MUX_s_1_2_2((~ modExp_exp_1_3_1_sva), (~
      modExp_exp_1_4_1_sva), and_dcpl_259);
  assign operator_64_false_1_mux_17_nl = MUX_s_1_2_2((~ modExp_exp_1_2_1_sva), (~
      modExp_exp_1_3_1_sva), and_dcpl_259);
  assign operator_64_false_1_mux_18_nl = MUX_s_1_2_2((~ modExp_exp_1_1_1_sva), (~
      modExp_exp_1_2_1_sva), and_dcpl_259);
  assign nl_operator_64_false_1_acc_nl = ({1'b1 , operator_64_false_1_mux_12_nl ,
      operator_64_false_1_mux_13_nl , operator_64_false_1_mux_14_nl , operator_64_false_1_mux_15_nl
      , operator_64_false_1_mux_16_nl , operator_64_false_1_mux_17_nl , operator_64_false_1_mux_18_nl
      , (~ modExp_exp_1_0_1_sva_1)}) + 9'b000000001;
  assign operator_64_false_1_acc_nl = nl_operator_64_false_1_acc_nl[8:0];
  assign z_out_4_8 = readslicef_9_1_8(operator_64_false_1_acc_nl);
  assign and_353_nl = (fsm_output[1]) & (~ (fsm_output[7])) & (fsm_output[2]) & (fsm_output[0])
      & (~ (fsm_output[6])) & and_dcpl_25 & nor_177_cse;
  assign or_429_nl = (fsm_output[0]) | (~ and_dcpl_271);
  assign mux_385_nl = MUX_s_1_2_2(mux_284_cse, or_429_nl, fsm_output[6]);
  assign modExp_while_if_or_1_nl = and_dcpl_273 | ((~ mux_385_nl) & and_dcpl & nor_177_cse);
  assign nor_190_nl = ~((~ (fsm_output[7])) | (fsm_output[1]));
  assign mux_390_nl = MUX_s_1_2_2(nor_77_cse, nor_190_nl, fsm_output[2]);
  assign nand_55_nl = ~((fsm_output[0]) & mux_390_nl);
  assign mux_388_nl = MUX_s_1_2_2(mux_288_cse, nand_55_nl, fsm_output[6]);
  assign and_356_nl = (fsm_output[5]) & (~ mux_388_nl);
  assign nor_191_nl = ~((fsm_output[5]) | (fsm_output[6]) | (fsm_output[0]) | (fsm_output[2])
      | (fsm_output[7]) | (fsm_output[1]));
  assign mux_387_nl = MUX_s_1_2_2(and_356_nl, nor_191_nl, fsm_output[3]);
  assign and_355_nl = mux_387_nl & (~((fsm_output[8]) | (fsm_output[4])));
  assign modExp_while_if_mux1h_1_nl = MUX1HOT_v_64_3_2(modExp_result_sva, operator_64_false_acc_mut_63_0,
      modExp_base_1_sva, {and_353_nl , modExp_while_if_or_1_nl , and_355_nl});
  assign modExp_while_if_and_4_nl = (~ (COMP_LOOP_acc_10_cse_12_1_1_sva[0])) & and_dcpl_273;
  assign modExp_while_if_and_5_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[0]) & and_dcpl_273;
  assign modExp_while_if_modExp_while_if_mux1h_1_nl = MUX1HOT_v_64_3_2(modExp_base_1_sva,
      vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, {(~ and_dcpl_273) , modExp_while_if_and_4_nl
      , modExp_while_if_and_5_nl});
  assign nl_z_out_5 = modExp_while_if_mux1h_1_nl * modExp_while_if_modExp_while_if_mux1h_1_nl;
  assign z_out_5 = nl_z_out_5[63:0];

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


  function automatic [9:0] MUX1HOT_v_10_7_2;
    input [9:0] input_6;
    input [9:0] input_5;
    input [9:0] input_4;
    input [9:0] input_3;
    input [9:0] input_2;
    input [9:0] input_1;
    input [9:0] input_0;
    input [6:0] sel;
    reg [9:0] result;
  begin
    result = input_0 & {10{sel[0]}};
    result = result | ( input_1 & {10{sel[1]}});
    result = result | ( input_2 & {10{sel[2]}});
    result = result | ( input_3 & {10{sel[3]}});
    result = result | ( input_4 & {10{sel[4]}});
    result = result | ( input_5 & {10{sel[5]}});
    result = result | ( input_6 & {10{sel[6]}});
    MUX1HOT_v_10_7_2 = result;
  end
  endfunction


  function automatic [1:0] MUX1HOT_v_2_4_2;
    input [1:0] input_3;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [3:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    result = result | ( input_3 & {2{sel[3]}});
    MUX1HOT_v_2_4_2 = result;
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


  function automatic [8:0] MUX1HOT_v_9_5_2;
    input [8:0] input_4;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [4:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    result = result | ( input_3 & {9{sel[3]}});
    result = result | ( input_4 & {9{sel[4]}});
    MUX1HOT_v_9_5_2 = result;
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


  function automatic [6:0] MUX_v_7_2_2;
    input [6:0] input_0;
    input [6:0] input_1;
    input [0:0] sel;
    reg [6:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_7_2_2 = result;
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


  function automatic [0:0] readslicef_8_1_7;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_8_1_7 = tmp[0:0];
  end
  endfunction


  function automatic [0:0] readslicef_9_1_8;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 8;
    readslicef_9_1_8 = tmp[0:0];
  end
  endfunction


  function automatic [64:0] conv_s2u_10_65 ;
    input [9:0]  vector ;
  begin
    conv_s2u_10_65 = {{55{vector[9]}}, vector};
  end
  endfunction


  function automatic [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_7_10 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_10 = {{3{1'b0}}, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
  end
  endfunction


  function automatic [11:0] conv_u2u_9_12 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_12 = {{3{1'b0}}, vector};
  end
  endfunction


  function automatic [12:0] conv_u2u_10_13 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_13 = {{3{1'b0}}, vector};
  end
  endfunction


  function automatic [65:0] conv_u2u_10_66 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_66 = {{56{1'b0}}, vector};
  end
  endfunction


  function automatic [12:0] conv_u2u_12_13 ;
    input [11:0]  vector ;
  begin
    conv_u2u_12_13 = {1'b0, vector};
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
  wire [10:0] vec_rsc_0_0_i_adra_d;
  wire [63:0] vec_rsc_0_0_i_qa_d;
  wire vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [10:0] vec_rsc_0_1_i_adra_d;
  wire [63:0] vec_rsc_0_1_i_qa_d;
  wire vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
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
      .adra_d(vec_rsc_0_0_i_adra_d),
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
      .adra_d(vec_rsc_0_1_i_adra_d),
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
      .vec_rsc_0_0_i_adra_d(vec_rsc_0_0_i_adra_d),
      .vec_rsc_0_0_i_qa_d(vec_rsc_0_0_i_qa_d),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_1_i_adra_d(vec_rsc_0_1_i_adra_d),
      .vec_rsc_0_1_i_qa_d(vec_rsc_0_1_i_qa_d),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_0_i_da_d_pff(vec_rsc_0_0_i_da_d_iff),
      .vec_rsc_0_0_i_wea_d_pff(vec_rsc_0_0_i_wea_d_iff),
      .vec_rsc_0_1_i_wea_d_pff(vec_rsc_0_1_i_wea_d_iff)
    );
endmodule



