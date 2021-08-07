
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
//  Generated date: Wed Jun 30 21:34:12 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
    (
  qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [63:0] qa;
  output wea;
  output [63:0] da;
  output [9:0] adra;
  input [9:0] adra_d;
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
    (
  qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [63:0] qa;
  output wea;
  output [63:0] da;
  output [9:0] adra;
  input [9:0] adra_d;
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
    (
  qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [63:0] qa;
  output wea;
  output [63:0] da;
  output [9:0] adra;
  input [9:0] adra_d;
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
    (
  qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [63:0] qa;
  output wea;
  output [63:0] da;
  output [9:0] adra;
  input [9:0] adra_d;
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
  clk, rst, fsm_output, STAGE_LOOP_C_9_tr0, modExp_while_C_40_tr0, COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_40_tr0, COMP_LOOP_C_66_tr0, COMP_LOOP_2_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_132_tr0, COMP_LOOP_3_modExp_1_while_C_40_tr0, COMP_LOOP_C_198_tr0,
      COMP_LOOP_4_modExp_1_while_C_40_tr0, COMP_LOOP_C_264_tr0, VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_10_tr0
);
  input clk;
  input rst;
  output [8:0] fsm_output;
  reg [8:0] fsm_output;
  input STAGE_LOOP_C_9_tr0;
  input modExp_while_C_40_tr0;
  input COMP_LOOP_C_1_tr0;
  input COMP_LOOP_1_modExp_1_while_C_40_tr0;
  input COMP_LOOP_C_66_tr0;
  input COMP_LOOP_2_modExp_1_while_C_40_tr0;
  input COMP_LOOP_C_132_tr0;
  input COMP_LOOP_3_modExp_1_while_C_40_tr0;
  input COMP_LOOP_C_198_tr0;
  input COMP_LOOP_4_modExp_1_while_C_40_tr0;
  input COMP_LOOP_C_264_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_10_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  parameter
    main_C_0 = 9'd0,
    STAGE_LOOP_C_0 = 9'd1,
    STAGE_LOOP_C_1 = 9'd2,
    STAGE_LOOP_C_2 = 9'd3,
    STAGE_LOOP_C_3 = 9'd4,
    STAGE_LOOP_C_4 = 9'd5,
    STAGE_LOOP_C_5 = 9'd6,
    STAGE_LOOP_C_6 = 9'd7,
    STAGE_LOOP_C_7 = 9'd8,
    STAGE_LOOP_C_8 = 9'd9,
    STAGE_LOOP_C_9 = 9'd10,
    modExp_while_C_0 = 9'd11,
    modExp_while_C_1 = 9'd12,
    modExp_while_C_2 = 9'd13,
    modExp_while_C_3 = 9'd14,
    modExp_while_C_4 = 9'd15,
    modExp_while_C_5 = 9'd16,
    modExp_while_C_6 = 9'd17,
    modExp_while_C_7 = 9'd18,
    modExp_while_C_8 = 9'd19,
    modExp_while_C_9 = 9'd20,
    modExp_while_C_10 = 9'd21,
    modExp_while_C_11 = 9'd22,
    modExp_while_C_12 = 9'd23,
    modExp_while_C_13 = 9'd24,
    modExp_while_C_14 = 9'd25,
    modExp_while_C_15 = 9'd26,
    modExp_while_C_16 = 9'd27,
    modExp_while_C_17 = 9'd28,
    modExp_while_C_18 = 9'd29,
    modExp_while_C_19 = 9'd30,
    modExp_while_C_20 = 9'd31,
    modExp_while_C_21 = 9'd32,
    modExp_while_C_22 = 9'd33,
    modExp_while_C_23 = 9'd34,
    modExp_while_C_24 = 9'd35,
    modExp_while_C_25 = 9'd36,
    modExp_while_C_26 = 9'd37,
    modExp_while_C_27 = 9'd38,
    modExp_while_C_28 = 9'd39,
    modExp_while_C_29 = 9'd40,
    modExp_while_C_30 = 9'd41,
    modExp_while_C_31 = 9'd42,
    modExp_while_C_32 = 9'd43,
    modExp_while_C_33 = 9'd44,
    modExp_while_C_34 = 9'd45,
    modExp_while_C_35 = 9'd46,
    modExp_while_C_36 = 9'd47,
    modExp_while_C_37 = 9'd48,
    modExp_while_C_38 = 9'd49,
    modExp_while_C_39 = 9'd50,
    modExp_while_C_40 = 9'd51,
    COMP_LOOP_C_0 = 9'd52,
    COMP_LOOP_C_1 = 9'd53,
    COMP_LOOP_1_modExp_1_while_C_0 = 9'd54,
    COMP_LOOP_1_modExp_1_while_C_1 = 9'd55,
    COMP_LOOP_1_modExp_1_while_C_2 = 9'd56,
    COMP_LOOP_1_modExp_1_while_C_3 = 9'd57,
    COMP_LOOP_1_modExp_1_while_C_4 = 9'd58,
    COMP_LOOP_1_modExp_1_while_C_5 = 9'd59,
    COMP_LOOP_1_modExp_1_while_C_6 = 9'd60,
    COMP_LOOP_1_modExp_1_while_C_7 = 9'd61,
    COMP_LOOP_1_modExp_1_while_C_8 = 9'd62,
    COMP_LOOP_1_modExp_1_while_C_9 = 9'd63,
    COMP_LOOP_1_modExp_1_while_C_10 = 9'd64,
    COMP_LOOP_1_modExp_1_while_C_11 = 9'd65,
    COMP_LOOP_1_modExp_1_while_C_12 = 9'd66,
    COMP_LOOP_1_modExp_1_while_C_13 = 9'd67,
    COMP_LOOP_1_modExp_1_while_C_14 = 9'd68,
    COMP_LOOP_1_modExp_1_while_C_15 = 9'd69,
    COMP_LOOP_1_modExp_1_while_C_16 = 9'd70,
    COMP_LOOP_1_modExp_1_while_C_17 = 9'd71,
    COMP_LOOP_1_modExp_1_while_C_18 = 9'd72,
    COMP_LOOP_1_modExp_1_while_C_19 = 9'd73,
    COMP_LOOP_1_modExp_1_while_C_20 = 9'd74,
    COMP_LOOP_1_modExp_1_while_C_21 = 9'd75,
    COMP_LOOP_1_modExp_1_while_C_22 = 9'd76,
    COMP_LOOP_1_modExp_1_while_C_23 = 9'd77,
    COMP_LOOP_1_modExp_1_while_C_24 = 9'd78,
    COMP_LOOP_1_modExp_1_while_C_25 = 9'd79,
    COMP_LOOP_1_modExp_1_while_C_26 = 9'd80,
    COMP_LOOP_1_modExp_1_while_C_27 = 9'd81,
    COMP_LOOP_1_modExp_1_while_C_28 = 9'd82,
    COMP_LOOP_1_modExp_1_while_C_29 = 9'd83,
    COMP_LOOP_1_modExp_1_while_C_30 = 9'd84,
    COMP_LOOP_1_modExp_1_while_C_31 = 9'd85,
    COMP_LOOP_1_modExp_1_while_C_32 = 9'd86,
    COMP_LOOP_1_modExp_1_while_C_33 = 9'd87,
    COMP_LOOP_1_modExp_1_while_C_34 = 9'd88,
    COMP_LOOP_1_modExp_1_while_C_35 = 9'd89,
    COMP_LOOP_1_modExp_1_while_C_36 = 9'd90,
    COMP_LOOP_1_modExp_1_while_C_37 = 9'd91,
    COMP_LOOP_1_modExp_1_while_C_38 = 9'd92,
    COMP_LOOP_1_modExp_1_while_C_39 = 9'd93,
    COMP_LOOP_1_modExp_1_while_C_40 = 9'd94,
    COMP_LOOP_C_2 = 9'd95,
    COMP_LOOP_C_3 = 9'd96,
    COMP_LOOP_C_4 = 9'd97,
    COMP_LOOP_C_5 = 9'd98,
    COMP_LOOP_C_6 = 9'd99,
    COMP_LOOP_C_7 = 9'd100,
    COMP_LOOP_C_8 = 9'd101,
    COMP_LOOP_C_9 = 9'd102,
    COMP_LOOP_C_10 = 9'd103,
    COMP_LOOP_C_11 = 9'd104,
    COMP_LOOP_C_12 = 9'd105,
    COMP_LOOP_C_13 = 9'd106,
    COMP_LOOP_C_14 = 9'd107,
    COMP_LOOP_C_15 = 9'd108,
    COMP_LOOP_C_16 = 9'd109,
    COMP_LOOP_C_17 = 9'd110,
    COMP_LOOP_C_18 = 9'd111,
    COMP_LOOP_C_19 = 9'd112,
    COMP_LOOP_C_20 = 9'd113,
    COMP_LOOP_C_21 = 9'd114,
    COMP_LOOP_C_22 = 9'd115,
    COMP_LOOP_C_23 = 9'd116,
    COMP_LOOP_C_24 = 9'd117,
    COMP_LOOP_C_25 = 9'd118,
    COMP_LOOP_C_26 = 9'd119,
    COMP_LOOP_C_27 = 9'd120,
    COMP_LOOP_C_28 = 9'd121,
    COMP_LOOP_C_29 = 9'd122,
    COMP_LOOP_C_30 = 9'd123,
    COMP_LOOP_C_31 = 9'd124,
    COMP_LOOP_C_32 = 9'd125,
    COMP_LOOP_C_33 = 9'd126,
    COMP_LOOP_C_34 = 9'd127,
    COMP_LOOP_C_35 = 9'd128,
    COMP_LOOP_C_36 = 9'd129,
    COMP_LOOP_C_37 = 9'd130,
    COMP_LOOP_C_38 = 9'd131,
    COMP_LOOP_C_39 = 9'd132,
    COMP_LOOP_C_40 = 9'd133,
    COMP_LOOP_C_41 = 9'd134,
    COMP_LOOP_C_42 = 9'd135,
    COMP_LOOP_C_43 = 9'd136,
    COMP_LOOP_C_44 = 9'd137,
    COMP_LOOP_C_45 = 9'd138,
    COMP_LOOP_C_46 = 9'd139,
    COMP_LOOP_C_47 = 9'd140,
    COMP_LOOP_C_48 = 9'd141,
    COMP_LOOP_C_49 = 9'd142,
    COMP_LOOP_C_50 = 9'd143,
    COMP_LOOP_C_51 = 9'd144,
    COMP_LOOP_C_52 = 9'd145,
    COMP_LOOP_C_53 = 9'd146,
    COMP_LOOP_C_54 = 9'd147,
    COMP_LOOP_C_55 = 9'd148,
    COMP_LOOP_C_56 = 9'd149,
    COMP_LOOP_C_57 = 9'd150,
    COMP_LOOP_C_58 = 9'd151,
    COMP_LOOP_C_59 = 9'd152,
    COMP_LOOP_C_60 = 9'd153,
    COMP_LOOP_C_61 = 9'd154,
    COMP_LOOP_C_62 = 9'd155,
    COMP_LOOP_C_63 = 9'd156,
    COMP_LOOP_C_64 = 9'd157,
    COMP_LOOP_C_65 = 9'd158,
    COMP_LOOP_C_66 = 9'd159,
    COMP_LOOP_C_67 = 9'd160,
    COMP_LOOP_2_modExp_1_while_C_0 = 9'd161,
    COMP_LOOP_2_modExp_1_while_C_1 = 9'd162,
    COMP_LOOP_2_modExp_1_while_C_2 = 9'd163,
    COMP_LOOP_2_modExp_1_while_C_3 = 9'd164,
    COMP_LOOP_2_modExp_1_while_C_4 = 9'd165,
    COMP_LOOP_2_modExp_1_while_C_5 = 9'd166,
    COMP_LOOP_2_modExp_1_while_C_6 = 9'd167,
    COMP_LOOP_2_modExp_1_while_C_7 = 9'd168,
    COMP_LOOP_2_modExp_1_while_C_8 = 9'd169,
    COMP_LOOP_2_modExp_1_while_C_9 = 9'd170,
    COMP_LOOP_2_modExp_1_while_C_10 = 9'd171,
    COMP_LOOP_2_modExp_1_while_C_11 = 9'd172,
    COMP_LOOP_2_modExp_1_while_C_12 = 9'd173,
    COMP_LOOP_2_modExp_1_while_C_13 = 9'd174,
    COMP_LOOP_2_modExp_1_while_C_14 = 9'd175,
    COMP_LOOP_2_modExp_1_while_C_15 = 9'd176,
    COMP_LOOP_2_modExp_1_while_C_16 = 9'd177,
    COMP_LOOP_2_modExp_1_while_C_17 = 9'd178,
    COMP_LOOP_2_modExp_1_while_C_18 = 9'd179,
    COMP_LOOP_2_modExp_1_while_C_19 = 9'd180,
    COMP_LOOP_2_modExp_1_while_C_20 = 9'd181,
    COMP_LOOP_2_modExp_1_while_C_21 = 9'd182,
    COMP_LOOP_2_modExp_1_while_C_22 = 9'd183,
    COMP_LOOP_2_modExp_1_while_C_23 = 9'd184,
    COMP_LOOP_2_modExp_1_while_C_24 = 9'd185,
    COMP_LOOP_2_modExp_1_while_C_25 = 9'd186,
    COMP_LOOP_2_modExp_1_while_C_26 = 9'd187,
    COMP_LOOP_2_modExp_1_while_C_27 = 9'd188,
    COMP_LOOP_2_modExp_1_while_C_28 = 9'd189,
    COMP_LOOP_2_modExp_1_while_C_29 = 9'd190,
    COMP_LOOP_2_modExp_1_while_C_30 = 9'd191,
    COMP_LOOP_2_modExp_1_while_C_31 = 9'd192,
    COMP_LOOP_2_modExp_1_while_C_32 = 9'd193,
    COMP_LOOP_2_modExp_1_while_C_33 = 9'd194,
    COMP_LOOP_2_modExp_1_while_C_34 = 9'd195,
    COMP_LOOP_2_modExp_1_while_C_35 = 9'd196,
    COMP_LOOP_2_modExp_1_while_C_36 = 9'd197,
    COMP_LOOP_2_modExp_1_while_C_37 = 9'd198,
    COMP_LOOP_2_modExp_1_while_C_38 = 9'd199,
    COMP_LOOP_2_modExp_1_while_C_39 = 9'd200,
    COMP_LOOP_2_modExp_1_while_C_40 = 9'd201,
    COMP_LOOP_C_68 = 9'd202,
    COMP_LOOP_C_69 = 9'd203,
    COMP_LOOP_C_70 = 9'd204,
    COMP_LOOP_C_71 = 9'd205,
    COMP_LOOP_C_72 = 9'd206,
    COMP_LOOP_C_73 = 9'd207,
    COMP_LOOP_C_74 = 9'd208,
    COMP_LOOP_C_75 = 9'd209,
    COMP_LOOP_C_76 = 9'd210,
    COMP_LOOP_C_77 = 9'd211,
    COMP_LOOP_C_78 = 9'd212,
    COMP_LOOP_C_79 = 9'd213,
    COMP_LOOP_C_80 = 9'd214,
    COMP_LOOP_C_81 = 9'd215,
    COMP_LOOP_C_82 = 9'd216,
    COMP_LOOP_C_83 = 9'd217,
    COMP_LOOP_C_84 = 9'd218,
    COMP_LOOP_C_85 = 9'd219,
    COMP_LOOP_C_86 = 9'd220,
    COMP_LOOP_C_87 = 9'd221,
    COMP_LOOP_C_88 = 9'd222,
    COMP_LOOP_C_89 = 9'd223,
    COMP_LOOP_C_90 = 9'd224,
    COMP_LOOP_C_91 = 9'd225,
    COMP_LOOP_C_92 = 9'd226,
    COMP_LOOP_C_93 = 9'd227,
    COMP_LOOP_C_94 = 9'd228,
    COMP_LOOP_C_95 = 9'd229,
    COMP_LOOP_C_96 = 9'd230,
    COMP_LOOP_C_97 = 9'd231,
    COMP_LOOP_C_98 = 9'd232,
    COMP_LOOP_C_99 = 9'd233,
    COMP_LOOP_C_100 = 9'd234,
    COMP_LOOP_C_101 = 9'd235,
    COMP_LOOP_C_102 = 9'd236,
    COMP_LOOP_C_103 = 9'd237,
    COMP_LOOP_C_104 = 9'd238,
    COMP_LOOP_C_105 = 9'd239,
    COMP_LOOP_C_106 = 9'd240,
    COMP_LOOP_C_107 = 9'd241,
    COMP_LOOP_C_108 = 9'd242,
    COMP_LOOP_C_109 = 9'd243,
    COMP_LOOP_C_110 = 9'd244,
    COMP_LOOP_C_111 = 9'd245,
    COMP_LOOP_C_112 = 9'd246,
    COMP_LOOP_C_113 = 9'd247,
    COMP_LOOP_C_114 = 9'd248,
    COMP_LOOP_C_115 = 9'd249,
    COMP_LOOP_C_116 = 9'd250,
    COMP_LOOP_C_117 = 9'd251,
    COMP_LOOP_C_118 = 9'd252,
    COMP_LOOP_C_119 = 9'd253,
    COMP_LOOP_C_120 = 9'd254,
    COMP_LOOP_C_121 = 9'd255,
    COMP_LOOP_C_122 = 9'd256,
    COMP_LOOP_C_123 = 9'd257,
    COMP_LOOP_C_124 = 9'd258,
    COMP_LOOP_C_125 = 9'd259,
    COMP_LOOP_C_126 = 9'd260,
    COMP_LOOP_C_127 = 9'd261,
    COMP_LOOP_C_128 = 9'd262,
    COMP_LOOP_C_129 = 9'd263,
    COMP_LOOP_C_130 = 9'd264,
    COMP_LOOP_C_131 = 9'd265,
    COMP_LOOP_C_132 = 9'd266,
    COMP_LOOP_C_133 = 9'd267,
    COMP_LOOP_3_modExp_1_while_C_0 = 9'd268,
    COMP_LOOP_3_modExp_1_while_C_1 = 9'd269,
    COMP_LOOP_3_modExp_1_while_C_2 = 9'd270,
    COMP_LOOP_3_modExp_1_while_C_3 = 9'd271,
    COMP_LOOP_3_modExp_1_while_C_4 = 9'd272,
    COMP_LOOP_3_modExp_1_while_C_5 = 9'd273,
    COMP_LOOP_3_modExp_1_while_C_6 = 9'd274,
    COMP_LOOP_3_modExp_1_while_C_7 = 9'd275,
    COMP_LOOP_3_modExp_1_while_C_8 = 9'd276,
    COMP_LOOP_3_modExp_1_while_C_9 = 9'd277,
    COMP_LOOP_3_modExp_1_while_C_10 = 9'd278,
    COMP_LOOP_3_modExp_1_while_C_11 = 9'd279,
    COMP_LOOP_3_modExp_1_while_C_12 = 9'd280,
    COMP_LOOP_3_modExp_1_while_C_13 = 9'd281,
    COMP_LOOP_3_modExp_1_while_C_14 = 9'd282,
    COMP_LOOP_3_modExp_1_while_C_15 = 9'd283,
    COMP_LOOP_3_modExp_1_while_C_16 = 9'd284,
    COMP_LOOP_3_modExp_1_while_C_17 = 9'd285,
    COMP_LOOP_3_modExp_1_while_C_18 = 9'd286,
    COMP_LOOP_3_modExp_1_while_C_19 = 9'd287,
    COMP_LOOP_3_modExp_1_while_C_20 = 9'd288,
    COMP_LOOP_3_modExp_1_while_C_21 = 9'd289,
    COMP_LOOP_3_modExp_1_while_C_22 = 9'd290,
    COMP_LOOP_3_modExp_1_while_C_23 = 9'd291,
    COMP_LOOP_3_modExp_1_while_C_24 = 9'd292,
    COMP_LOOP_3_modExp_1_while_C_25 = 9'd293,
    COMP_LOOP_3_modExp_1_while_C_26 = 9'd294,
    COMP_LOOP_3_modExp_1_while_C_27 = 9'd295,
    COMP_LOOP_3_modExp_1_while_C_28 = 9'd296,
    COMP_LOOP_3_modExp_1_while_C_29 = 9'd297,
    COMP_LOOP_3_modExp_1_while_C_30 = 9'd298,
    COMP_LOOP_3_modExp_1_while_C_31 = 9'd299,
    COMP_LOOP_3_modExp_1_while_C_32 = 9'd300,
    COMP_LOOP_3_modExp_1_while_C_33 = 9'd301,
    COMP_LOOP_3_modExp_1_while_C_34 = 9'd302,
    COMP_LOOP_3_modExp_1_while_C_35 = 9'd303,
    COMP_LOOP_3_modExp_1_while_C_36 = 9'd304,
    COMP_LOOP_3_modExp_1_while_C_37 = 9'd305,
    COMP_LOOP_3_modExp_1_while_C_38 = 9'd306,
    COMP_LOOP_3_modExp_1_while_C_39 = 9'd307,
    COMP_LOOP_3_modExp_1_while_C_40 = 9'd308,
    COMP_LOOP_C_134 = 9'd309,
    COMP_LOOP_C_135 = 9'd310,
    COMP_LOOP_C_136 = 9'd311,
    COMP_LOOP_C_137 = 9'd312,
    COMP_LOOP_C_138 = 9'd313,
    COMP_LOOP_C_139 = 9'd314,
    COMP_LOOP_C_140 = 9'd315,
    COMP_LOOP_C_141 = 9'd316,
    COMP_LOOP_C_142 = 9'd317,
    COMP_LOOP_C_143 = 9'd318,
    COMP_LOOP_C_144 = 9'd319,
    COMP_LOOP_C_145 = 9'd320,
    COMP_LOOP_C_146 = 9'd321,
    COMP_LOOP_C_147 = 9'd322,
    COMP_LOOP_C_148 = 9'd323,
    COMP_LOOP_C_149 = 9'd324,
    COMP_LOOP_C_150 = 9'd325,
    COMP_LOOP_C_151 = 9'd326,
    COMP_LOOP_C_152 = 9'd327,
    COMP_LOOP_C_153 = 9'd328,
    COMP_LOOP_C_154 = 9'd329,
    COMP_LOOP_C_155 = 9'd330,
    COMP_LOOP_C_156 = 9'd331,
    COMP_LOOP_C_157 = 9'd332,
    COMP_LOOP_C_158 = 9'd333,
    COMP_LOOP_C_159 = 9'd334,
    COMP_LOOP_C_160 = 9'd335,
    COMP_LOOP_C_161 = 9'd336,
    COMP_LOOP_C_162 = 9'd337,
    COMP_LOOP_C_163 = 9'd338,
    COMP_LOOP_C_164 = 9'd339,
    COMP_LOOP_C_165 = 9'd340,
    COMP_LOOP_C_166 = 9'd341,
    COMP_LOOP_C_167 = 9'd342,
    COMP_LOOP_C_168 = 9'd343,
    COMP_LOOP_C_169 = 9'd344,
    COMP_LOOP_C_170 = 9'd345,
    COMP_LOOP_C_171 = 9'd346,
    COMP_LOOP_C_172 = 9'd347,
    COMP_LOOP_C_173 = 9'd348,
    COMP_LOOP_C_174 = 9'd349,
    COMP_LOOP_C_175 = 9'd350,
    COMP_LOOP_C_176 = 9'd351,
    COMP_LOOP_C_177 = 9'd352,
    COMP_LOOP_C_178 = 9'd353,
    COMP_LOOP_C_179 = 9'd354,
    COMP_LOOP_C_180 = 9'd355,
    COMP_LOOP_C_181 = 9'd356,
    COMP_LOOP_C_182 = 9'd357,
    COMP_LOOP_C_183 = 9'd358,
    COMP_LOOP_C_184 = 9'd359,
    COMP_LOOP_C_185 = 9'd360,
    COMP_LOOP_C_186 = 9'd361,
    COMP_LOOP_C_187 = 9'd362,
    COMP_LOOP_C_188 = 9'd363,
    COMP_LOOP_C_189 = 9'd364,
    COMP_LOOP_C_190 = 9'd365,
    COMP_LOOP_C_191 = 9'd366,
    COMP_LOOP_C_192 = 9'd367,
    COMP_LOOP_C_193 = 9'd368,
    COMP_LOOP_C_194 = 9'd369,
    COMP_LOOP_C_195 = 9'd370,
    COMP_LOOP_C_196 = 9'd371,
    COMP_LOOP_C_197 = 9'd372,
    COMP_LOOP_C_198 = 9'd373,
    COMP_LOOP_C_199 = 9'd374,
    COMP_LOOP_4_modExp_1_while_C_0 = 9'd375,
    COMP_LOOP_4_modExp_1_while_C_1 = 9'd376,
    COMP_LOOP_4_modExp_1_while_C_2 = 9'd377,
    COMP_LOOP_4_modExp_1_while_C_3 = 9'd378,
    COMP_LOOP_4_modExp_1_while_C_4 = 9'd379,
    COMP_LOOP_4_modExp_1_while_C_5 = 9'd380,
    COMP_LOOP_4_modExp_1_while_C_6 = 9'd381,
    COMP_LOOP_4_modExp_1_while_C_7 = 9'd382,
    COMP_LOOP_4_modExp_1_while_C_8 = 9'd383,
    COMP_LOOP_4_modExp_1_while_C_9 = 9'd384,
    COMP_LOOP_4_modExp_1_while_C_10 = 9'd385,
    COMP_LOOP_4_modExp_1_while_C_11 = 9'd386,
    COMP_LOOP_4_modExp_1_while_C_12 = 9'd387,
    COMP_LOOP_4_modExp_1_while_C_13 = 9'd388,
    COMP_LOOP_4_modExp_1_while_C_14 = 9'd389,
    COMP_LOOP_4_modExp_1_while_C_15 = 9'd390,
    COMP_LOOP_4_modExp_1_while_C_16 = 9'd391,
    COMP_LOOP_4_modExp_1_while_C_17 = 9'd392,
    COMP_LOOP_4_modExp_1_while_C_18 = 9'd393,
    COMP_LOOP_4_modExp_1_while_C_19 = 9'd394,
    COMP_LOOP_4_modExp_1_while_C_20 = 9'd395,
    COMP_LOOP_4_modExp_1_while_C_21 = 9'd396,
    COMP_LOOP_4_modExp_1_while_C_22 = 9'd397,
    COMP_LOOP_4_modExp_1_while_C_23 = 9'd398,
    COMP_LOOP_4_modExp_1_while_C_24 = 9'd399,
    COMP_LOOP_4_modExp_1_while_C_25 = 9'd400,
    COMP_LOOP_4_modExp_1_while_C_26 = 9'd401,
    COMP_LOOP_4_modExp_1_while_C_27 = 9'd402,
    COMP_LOOP_4_modExp_1_while_C_28 = 9'd403,
    COMP_LOOP_4_modExp_1_while_C_29 = 9'd404,
    COMP_LOOP_4_modExp_1_while_C_30 = 9'd405,
    COMP_LOOP_4_modExp_1_while_C_31 = 9'd406,
    COMP_LOOP_4_modExp_1_while_C_32 = 9'd407,
    COMP_LOOP_4_modExp_1_while_C_33 = 9'd408,
    COMP_LOOP_4_modExp_1_while_C_34 = 9'd409,
    COMP_LOOP_4_modExp_1_while_C_35 = 9'd410,
    COMP_LOOP_4_modExp_1_while_C_36 = 9'd411,
    COMP_LOOP_4_modExp_1_while_C_37 = 9'd412,
    COMP_LOOP_4_modExp_1_while_C_38 = 9'd413,
    COMP_LOOP_4_modExp_1_while_C_39 = 9'd414,
    COMP_LOOP_4_modExp_1_while_C_40 = 9'd415,
    COMP_LOOP_C_200 = 9'd416,
    COMP_LOOP_C_201 = 9'd417,
    COMP_LOOP_C_202 = 9'd418,
    COMP_LOOP_C_203 = 9'd419,
    COMP_LOOP_C_204 = 9'd420,
    COMP_LOOP_C_205 = 9'd421,
    COMP_LOOP_C_206 = 9'd422,
    COMP_LOOP_C_207 = 9'd423,
    COMP_LOOP_C_208 = 9'd424,
    COMP_LOOP_C_209 = 9'd425,
    COMP_LOOP_C_210 = 9'd426,
    COMP_LOOP_C_211 = 9'd427,
    COMP_LOOP_C_212 = 9'd428,
    COMP_LOOP_C_213 = 9'd429,
    COMP_LOOP_C_214 = 9'd430,
    COMP_LOOP_C_215 = 9'd431,
    COMP_LOOP_C_216 = 9'd432,
    COMP_LOOP_C_217 = 9'd433,
    COMP_LOOP_C_218 = 9'd434,
    COMP_LOOP_C_219 = 9'd435,
    COMP_LOOP_C_220 = 9'd436,
    COMP_LOOP_C_221 = 9'd437,
    COMP_LOOP_C_222 = 9'd438,
    COMP_LOOP_C_223 = 9'd439,
    COMP_LOOP_C_224 = 9'd440,
    COMP_LOOP_C_225 = 9'd441,
    COMP_LOOP_C_226 = 9'd442,
    COMP_LOOP_C_227 = 9'd443,
    COMP_LOOP_C_228 = 9'd444,
    COMP_LOOP_C_229 = 9'd445,
    COMP_LOOP_C_230 = 9'd446,
    COMP_LOOP_C_231 = 9'd447,
    COMP_LOOP_C_232 = 9'd448,
    COMP_LOOP_C_233 = 9'd449,
    COMP_LOOP_C_234 = 9'd450,
    COMP_LOOP_C_235 = 9'd451,
    COMP_LOOP_C_236 = 9'd452,
    COMP_LOOP_C_237 = 9'd453,
    COMP_LOOP_C_238 = 9'd454,
    COMP_LOOP_C_239 = 9'd455,
    COMP_LOOP_C_240 = 9'd456,
    COMP_LOOP_C_241 = 9'd457,
    COMP_LOOP_C_242 = 9'd458,
    COMP_LOOP_C_243 = 9'd459,
    COMP_LOOP_C_244 = 9'd460,
    COMP_LOOP_C_245 = 9'd461,
    COMP_LOOP_C_246 = 9'd462,
    COMP_LOOP_C_247 = 9'd463,
    COMP_LOOP_C_248 = 9'd464,
    COMP_LOOP_C_249 = 9'd465,
    COMP_LOOP_C_250 = 9'd466,
    COMP_LOOP_C_251 = 9'd467,
    COMP_LOOP_C_252 = 9'd468,
    COMP_LOOP_C_253 = 9'd469,
    COMP_LOOP_C_254 = 9'd470,
    COMP_LOOP_C_255 = 9'd471,
    COMP_LOOP_C_256 = 9'd472,
    COMP_LOOP_C_257 = 9'd473,
    COMP_LOOP_C_258 = 9'd474,
    COMP_LOOP_C_259 = 9'd475,
    COMP_LOOP_C_260 = 9'd476,
    COMP_LOOP_C_261 = 9'd477,
    COMP_LOOP_C_262 = 9'd478,
    COMP_LOOP_C_263 = 9'd479,
    COMP_LOOP_C_264 = 9'd480,
    VEC_LOOP_C_0 = 9'd481,
    STAGE_LOOP_C_10 = 9'd482,
    main_C_1 = 9'd483;

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
        state_var_NS = STAGE_LOOP_C_6;
      end
      STAGE_LOOP_C_6 : begin
        fsm_output = 9'b000000111;
        state_var_NS = STAGE_LOOP_C_7;
      end
      STAGE_LOOP_C_7 : begin
        fsm_output = 9'b000001000;
        state_var_NS = STAGE_LOOP_C_8;
      end
      STAGE_LOOP_C_8 : begin
        fsm_output = 9'b000001001;
        state_var_NS = STAGE_LOOP_C_9;
      end
      STAGE_LOOP_C_9 : begin
        fsm_output = 9'b000001010;
        if ( STAGE_LOOP_C_9_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      modExp_while_C_0 : begin
        fsm_output = 9'b000001011;
        state_var_NS = modExp_while_C_1;
      end
      modExp_while_C_1 : begin
        fsm_output = 9'b000001100;
        state_var_NS = modExp_while_C_2;
      end
      modExp_while_C_2 : begin
        fsm_output = 9'b000001101;
        state_var_NS = modExp_while_C_3;
      end
      modExp_while_C_3 : begin
        fsm_output = 9'b000001110;
        state_var_NS = modExp_while_C_4;
      end
      modExp_while_C_4 : begin
        fsm_output = 9'b000001111;
        state_var_NS = modExp_while_C_5;
      end
      modExp_while_C_5 : begin
        fsm_output = 9'b000010000;
        state_var_NS = modExp_while_C_6;
      end
      modExp_while_C_6 : begin
        fsm_output = 9'b000010001;
        state_var_NS = modExp_while_C_7;
      end
      modExp_while_C_7 : begin
        fsm_output = 9'b000010010;
        state_var_NS = modExp_while_C_8;
      end
      modExp_while_C_8 : begin
        fsm_output = 9'b000010011;
        state_var_NS = modExp_while_C_9;
      end
      modExp_while_C_9 : begin
        fsm_output = 9'b000010100;
        state_var_NS = modExp_while_C_10;
      end
      modExp_while_C_10 : begin
        fsm_output = 9'b000010101;
        state_var_NS = modExp_while_C_11;
      end
      modExp_while_C_11 : begin
        fsm_output = 9'b000010110;
        state_var_NS = modExp_while_C_12;
      end
      modExp_while_C_12 : begin
        fsm_output = 9'b000010111;
        state_var_NS = modExp_while_C_13;
      end
      modExp_while_C_13 : begin
        fsm_output = 9'b000011000;
        state_var_NS = modExp_while_C_14;
      end
      modExp_while_C_14 : begin
        fsm_output = 9'b000011001;
        state_var_NS = modExp_while_C_15;
      end
      modExp_while_C_15 : begin
        fsm_output = 9'b000011010;
        state_var_NS = modExp_while_C_16;
      end
      modExp_while_C_16 : begin
        fsm_output = 9'b000011011;
        state_var_NS = modExp_while_C_17;
      end
      modExp_while_C_17 : begin
        fsm_output = 9'b000011100;
        state_var_NS = modExp_while_C_18;
      end
      modExp_while_C_18 : begin
        fsm_output = 9'b000011101;
        state_var_NS = modExp_while_C_19;
      end
      modExp_while_C_19 : begin
        fsm_output = 9'b000011110;
        state_var_NS = modExp_while_C_20;
      end
      modExp_while_C_20 : begin
        fsm_output = 9'b000011111;
        state_var_NS = modExp_while_C_21;
      end
      modExp_while_C_21 : begin
        fsm_output = 9'b000100000;
        state_var_NS = modExp_while_C_22;
      end
      modExp_while_C_22 : begin
        fsm_output = 9'b000100001;
        state_var_NS = modExp_while_C_23;
      end
      modExp_while_C_23 : begin
        fsm_output = 9'b000100010;
        state_var_NS = modExp_while_C_24;
      end
      modExp_while_C_24 : begin
        fsm_output = 9'b000100011;
        state_var_NS = modExp_while_C_25;
      end
      modExp_while_C_25 : begin
        fsm_output = 9'b000100100;
        state_var_NS = modExp_while_C_26;
      end
      modExp_while_C_26 : begin
        fsm_output = 9'b000100101;
        state_var_NS = modExp_while_C_27;
      end
      modExp_while_C_27 : begin
        fsm_output = 9'b000100110;
        state_var_NS = modExp_while_C_28;
      end
      modExp_while_C_28 : begin
        fsm_output = 9'b000100111;
        state_var_NS = modExp_while_C_29;
      end
      modExp_while_C_29 : begin
        fsm_output = 9'b000101000;
        state_var_NS = modExp_while_C_30;
      end
      modExp_while_C_30 : begin
        fsm_output = 9'b000101001;
        state_var_NS = modExp_while_C_31;
      end
      modExp_while_C_31 : begin
        fsm_output = 9'b000101010;
        state_var_NS = modExp_while_C_32;
      end
      modExp_while_C_32 : begin
        fsm_output = 9'b000101011;
        state_var_NS = modExp_while_C_33;
      end
      modExp_while_C_33 : begin
        fsm_output = 9'b000101100;
        state_var_NS = modExp_while_C_34;
      end
      modExp_while_C_34 : begin
        fsm_output = 9'b000101101;
        state_var_NS = modExp_while_C_35;
      end
      modExp_while_C_35 : begin
        fsm_output = 9'b000101110;
        state_var_NS = modExp_while_C_36;
      end
      modExp_while_C_36 : begin
        fsm_output = 9'b000101111;
        state_var_NS = modExp_while_C_37;
      end
      modExp_while_C_37 : begin
        fsm_output = 9'b000110000;
        state_var_NS = modExp_while_C_38;
      end
      modExp_while_C_38 : begin
        fsm_output = 9'b000110001;
        state_var_NS = modExp_while_C_39;
      end
      modExp_while_C_39 : begin
        fsm_output = 9'b000110010;
        state_var_NS = modExp_while_C_40;
      end
      modExp_while_C_40 : begin
        fsm_output = 9'b000110011;
        if ( modExp_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 9'b000110100;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 9'b000110101;
        if ( COMP_LOOP_C_1_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_1_modExp_1_while_C_0 : begin
        fsm_output = 9'b000110110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_1;
      end
      COMP_LOOP_1_modExp_1_while_C_1 : begin
        fsm_output = 9'b000110111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_2;
      end
      COMP_LOOP_1_modExp_1_while_C_2 : begin
        fsm_output = 9'b000111000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_3;
      end
      COMP_LOOP_1_modExp_1_while_C_3 : begin
        fsm_output = 9'b000111001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_4;
      end
      COMP_LOOP_1_modExp_1_while_C_4 : begin
        fsm_output = 9'b000111010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_5;
      end
      COMP_LOOP_1_modExp_1_while_C_5 : begin
        fsm_output = 9'b000111011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_6;
      end
      COMP_LOOP_1_modExp_1_while_C_6 : begin
        fsm_output = 9'b000111100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_7;
      end
      COMP_LOOP_1_modExp_1_while_C_7 : begin
        fsm_output = 9'b000111101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_8;
      end
      COMP_LOOP_1_modExp_1_while_C_8 : begin
        fsm_output = 9'b000111110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_9;
      end
      COMP_LOOP_1_modExp_1_while_C_9 : begin
        fsm_output = 9'b000111111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_10;
      end
      COMP_LOOP_1_modExp_1_while_C_10 : begin
        fsm_output = 9'b001000000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_11;
      end
      COMP_LOOP_1_modExp_1_while_C_11 : begin
        fsm_output = 9'b001000001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_12;
      end
      COMP_LOOP_1_modExp_1_while_C_12 : begin
        fsm_output = 9'b001000010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_13;
      end
      COMP_LOOP_1_modExp_1_while_C_13 : begin
        fsm_output = 9'b001000011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_14;
      end
      COMP_LOOP_1_modExp_1_while_C_14 : begin
        fsm_output = 9'b001000100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_15;
      end
      COMP_LOOP_1_modExp_1_while_C_15 : begin
        fsm_output = 9'b001000101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_16;
      end
      COMP_LOOP_1_modExp_1_while_C_16 : begin
        fsm_output = 9'b001000110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_17;
      end
      COMP_LOOP_1_modExp_1_while_C_17 : begin
        fsm_output = 9'b001000111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_18;
      end
      COMP_LOOP_1_modExp_1_while_C_18 : begin
        fsm_output = 9'b001001000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_19;
      end
      COMP_LOOP_1_modExp_1_while_C_19 : begin
        fsm_output = 9'b001001001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_20;
      end
      COMP_LOOP_1_modExp_1_while_C_20 : begin
        fsm_output = 9'b001001010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_21;
      end
      COMP_LOOP_1_modExp_1_while_C_21 : begin
        fsm_output = 9'b001001011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_22;
      end
      COMP_LOOP_1_modExp_1_while_C_22 : begin
        fsm_output = 9'b001001100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_23;
      end
      COMP_LOOP_1_modExp_1_while_C_23 : begin
        fsm_output = 9'b001001101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_24;
      end
      COMP_LOOP_1_modExp_1_while_C_24 : begin
        fsm_output = 9'b001001110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_25;
      end
      COMP_LOOP_1_modExp_1_while_C_25 : begin
        fsm_output = 9'b001001111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_26;
      end
      COMP_LOOP_1_modExp_1_while_C_26 : begin
        fsm_output = 9'b001010000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_27;
      end
      COMP_LOOP_1_modExp_1_while_C_27 : begin
        fsm_output = 9'b001010001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_28;
      end
      COMP_LOOP_1_modExp_1_while_C_28 : begin
        fsm_output = 9'b001010010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_29;
      end
      COMP_LOOP_1_modExp_1_while_C_29 : begin
        fsm_output = 9'b001010011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_30;
      end
      COMP_LOOP_1_modExp_1_while_C_30 : begin
        fsm_output = 9'b001010100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_31;
      end
      COMP_LOOP_1_modExp_1_while_C_31 : begin
        fsm_output = 9'b001010101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_32;
      end
      COMP_LOOP_1_modExp_1_while_C_32 : begin
        fsm_output = 9'b001010110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_33;
      end
      COMP_LOOP_1_modExp_1_while_C_33 : begin
        fsm_output = 9'b001010111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_34;
      end
      COMP_LOOP_1_modExp_1_while_C_34 : begin
        fsm_output = 9'b001011000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_35;
      end
      COMP_LOOP_1_modExp_1_while_C_35 : begin
        fsm_output = 9'b001011001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_36;
      end
      COMP_LOOP_1_modExp_1_while_C_36 : begin
        fsm_output = 9'b001011010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_37;
      end
      COMP_LOOP_1_modExp_1_while_C_37 : begin
        fsm_output = 9'b001011011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_38;
      end
      COMP_LOOP_1_modExp_1_while_C_38 : begin
        fsm_output = 9'b001011100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_39;
      end
      COMP_LOOP_1_modExp_1_while_C_39 : begin
        fsm_output = 9'b001011101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_40;
      end
      COMP_LOOP_1_modExp_1_while_C_40 : begin
        fsm_output = 9'b001011110;
        if ( COMP_LOOP_1_modExp_1_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 9'b001011111;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 9'b001100000;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 9'b001100001;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 9'b001100010;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 9'b001100011;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 9'b001100100;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 9'b001100101;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 9'b001100110;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 9'b001100111;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 9'b001101000;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 9'b001101001;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 9'b001101010;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 9'b001101011;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 9'b001101100;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 9'b001101101;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 9'b001101110;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 9'b001101111;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 9'b001110000;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 9'b001110001;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 9'b001110010;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 9'b001110011;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 9'b001110100;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 9'b001110101;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 9'b001110110;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 9'b001110111;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 9'b001111000;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 9'b001111001;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 9'b001111010;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 9'b001111011;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 9'b001111100;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 9'b001111101;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 9'b001111110;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 9'b001111111;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 9'b010000000;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 9'b010000001;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 9'b010000010;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 9'b010000011;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 9'b010000100;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 9'b010000101;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 9'b010000110;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 9'b010000111;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 9'b010001000;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 9'b010001001;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 9'b010001010;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 9'b010001011;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 9'b010001100;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 9'b010001101;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 9'b010001110;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 9'b010001111;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 9'b010010000;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 9'b010010001;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 9'b010010010;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 9'b010010011;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 9'b010010100;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 9'b010010101;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 9'b010010110;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 9'b010010111;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 9'b010011000;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 9'b010011001;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 9'b010011010;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 9'b010011011;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 9'b010011100;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 9'b010011101;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 9'b010011110;
        state_var_NS = COMP_LOOP_C_66;
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 9'b010011111;
        if ( COMP_LOOP_C_66_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_67;
        end
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 9'b010100000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
      end
      COMP_LOOP_2_modExp_1_while_C_0 : begin
        fsm_output = 9'b010100001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_1;
      end
      COMP_LOOP_2_modExp_1_while_C_1 : begin
        fsm_output = 9'b010100010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_2;
      end
      COMP_LOOP_2_modExp_1_while_C_2 : begin
        fsm_output = 9'b010100011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_3;
      end
      COMP_LOOP_2_modExp_1_while_C_3 : begin
        fsm_output = 9'b010100100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_4;
      end
      COMP_LOOP_2_modExp_1_while_C_4 : begin
        fsm_output = 9'b010100101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_5;
      end
      COMP_LOOP_2_modExp_1_while_C_5 : begin
        fsm_output = 9'b010100110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_6;
      end
      COMP_LOOP_2_modExp_1_while_C_6 : begin
        fsm_output = 9'b010100111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_7;
      end
      COMP_LOOP_2_modExp_1_while_C_7 : begin
        fsm_output = 9'b010101000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_8;
      end
      COMP_LOOP_2_modExp_1_while_C_8 : begin
        fsm_output = 9'b010101001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_9;
      end
      COMP_LOOP_2_modExp_1_while_C_9 : begin
        fsm_output = 9'b010101010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_10;
      end
      COMP_LOOP_2_modExp_1_while_C_10 : begin
        fsm_output = 9'b010101011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_11;
      end
      COMP_LOOP_2_modExp_1_while_C_11 : begin
        fsm_output = 9'b010101100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_12;
      end
      COMP_LOOP_2_modExp_1_while_C_12 : begin
        fsm_output = 9'b010101101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_13;
      end
      COMP_LOOP_2_modExp_1_while_C_13 : begin
        fsm_output = 9'b010101110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_14;
      end
      COMP_LOOP_2_modExp_1_while_C_14 : begin
        fsm_output = 9'b010101111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_15;
      end
      COMP_LOOP_2_modExp_1_while_C_15 : begin
        fsm_output = 9'b010110000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_16;
      end
      COMP_LOOP_2_modExp_1_while_C_16 : begin
        fsm_output = 9'b010110001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_17;
      end
      COMP_LOOP_2_modExp_1_while_C_17 : begin
        fsm_output = 9'b010110010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_18;
      end
      COMP_LOOP_2_modExp_1_while_C_18 : begin
        fsm_output = 9'b010110011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_19;
      end
      COMP_LOOP_2_modExp_1_while_C_19 : begin
        fsm_output = 9'b010110100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_20;
      end
      COMP_LOOP_2_modExp_1_while_C_20 : begin
        fsm_output = 9'b010110101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_21;
      end
      COMP_LOOP_2_modExp_1_while_C_21 : begin
        fsm_output = 9'b010110110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_22;
      end
      COMP_LOOP_2_modExp_1_while_C_22 : begin
        fsm_output = 9'b010110111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_23;
      end
      COMP_LOOP_2_modExp_1_while_C_23 : begin
        fsm_output = 9'b010111000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_24;
      end
      COMP_LOOP_2_modExp_1_while_C_24 : begin
        fsm_output = 9'b010111001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_25;
      end
      COMP_LOOP_2_modExp_1_while_C_25 : begin
        fsm_output = 9'b010111010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_26;
      end
      COMP_LOOP_2_modExp_1_while_C_26 : begin
        fsm_output = 9'b010111011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_27;
      end
      COMP_LOOP_2_modExp_1_while_C_27 : begin
        fsm_output = 9'b010111100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_28;
      end
      COMP_LOOP_2_modExp_1_while_C_28 : begin
        fsm_output = 9'b010111101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_29;
      end
      COMP_LOOP_2_modExp_1_while_C_29 : begin
        fsm_output = 9'b010111110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_30;
      end
      COMP_LOOP_2_modExp_1_while_C_30 : begin
        fsm_output = 9'b010111111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_31;
      end
      COMP_LOOP_2_modExp_1_while_C_31 : begin
        fsm_output = 9'b011000000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_32;
      end
      COMP_LOOP_2_modExp_1_while_C_32 : begin
        fsm_output = 9'b011000001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_33;
      end
      COMP_LOOP_2_modExp_1_while_C_33 : begin
        fsm_output = 9'b011000010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_34;
      end
      COMP_LOOP_2_modExp_1_while_C_34 : begin
        fsm_output = 9'b011000011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_35;
      end
      COMP_LOOP_2_modExp_1_while_C_35 : begin
        fsm_output = 9'b011000100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_36;
      end
      COMP_LOOP_2_modExp_1_while_C_36 : begin
        fsm_output = 9'b011000101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_37;
      end
      COMP_LOOP_2_modExp_1_while_C_37 : begin
        fsm_output = 9'b011000110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_38;
      end
      COMP_LOOP_2_modExp_1_while_C_38 : begin
        fsm_output = 9'b011000111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_39;
      end
      COMP_LOOP_2_modExp_1_while_C_39 : begin
        fsm_output = 9'b011001000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_40;
      end
      COMP_LOOP_2_modExp_1_while_C_40 : begin
        fsm_output = 9'b011001001;
        if ( COMP_LOOP_2_modExp_1_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_68;
        end
        else begin
          state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 9'b011001010;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 9'b011001011;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 9'b011001100;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 9'b011001101;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 9'b011001110;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 9'b011001111;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 9'b011010000;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 9'b011010001;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 9'b011010010;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 9'b011010011;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 9'b011010100;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 9'b011010101;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 9'b011010110;
        state_var_NS = COMP_LOOP_C_81;
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 9'b011010111;
        state_var_NS = COMP_LOOP_C_82;
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 9'b011011000;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 9'b011011001;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 9'b011011010;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 9'b011011011;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 9'b011011100;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 9'b011011101;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 9'b011011110;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 9'b011011111;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 9'b011100000;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 9'b011100001;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 9'b011100010;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 9'b011100011;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 9'b011100100;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 9'b011100101;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 9'b011100110;
        state_var_NS = COMP_LOOP_C_97;
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 9'b011100111;
        state_var_NS = COMP_LOOP_C_98;
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 9'b011101000;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 9'b011101001;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 9'b011101010;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 9'b011101011;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 9'b011101100;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 9'b011101101;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 9'b011101110;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 9'b011101111;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 9'b011110000;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 9'b011110001;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 9'b011110010;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 9'b011110011;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 9'b011110100;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 9'b011110101;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 9'b011110110;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 9'b011110111;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 9'b011111000;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 9'b011111001;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 9'b011111010;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 9'b011111011;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 9'b011111100;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 9'b011111101;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 9'b011111110;
        state_var_NS = COMP_LOOP_C_121;
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 9'b011111111;
        state_var_NS = COMP_LOOP_C_122;
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 9'b100000000;
        state_var_NS = COMP_LOOP_C_123;
      end
      COMP_LOOP_C_123 : begin
        fsm_output = 9'b100000001;
        state_var_NS = COMP_LOOP_C_124;
      end
      COMP_LOOP_C_124 : begin
        fsm_output = 9'b100000010;
        state_var_NS = COMP_LOOP_C_125;
      end
      COMP_LOOP_C_125 : begin
        fsm_output = 9'b100000011;
        state_var_NS = COMP_LOOP_C_126;
      end
      COMP_LOOP_C_126 : begin
        fsm_output = 9'b100000100;
        state_var_NS = COMP_LOOP_C_127;
      end
      COMP_LOOP_C_127 : begin
        fsm_output = 9'b100000101;
        state_var_NS = COMP_LOOP_C_128;
      end
      COMP_LOOP_C_128 : begin
        fsm_output = 9'b100000110;
        state_var_NS = COMP_LOOP_C_129;
      end
      COMP_LOOP_C_129 : begin
        fsm_output = 9'b100000111;
        state_var_NS = COMP_LOOP_C_130;
      end
      COMP_LOOP_C_130 : begin
        fsm_output = 9'b100001000;
        state_var_NS = COMP_LOOP_C_131;
      end
      COMP_LOOP_C_131 : begin
        fsm_output = 9'b100001001;
        state_var_NS = COMP_LOOP_C_132;
      end
      COMP_LOOP_C_132 : begin
        fsm_output = 9'b100001010;
        if ( COMP_LOOP_C_132_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_133;
        end
      end
      COMP_LOOP_C_133 : begin
        fsm_output = 9'b100001011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_0;
      end
      COMP_LOOP_3_modExp_1_while_C_0 : begin
        fsm_output = 9'b100001100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_1;
      end
      COMP_LOOP_3_modExp_1_while_C_1 : begin
        fsm_output = 9'b100001101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_2;
      end
      COMP_LOOP_3_modExp_1_while_C_2 : begin
        fsm_output = 9'b100001110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_3;
      end
      COMP_LOOP_3_modExp_1_while_C_3 : begin
        fsm_output = 9'b100001111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_4;
      end
      COMP_LOOP_3_modExp_1_while_C_4 : begin
        fsm_output = 9'b100010000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_5;
      end
      COMP_LOOP_3_modExp_1_while_C_5 : begin
        fsm_output = 9'b100010001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_6;
      end
      COMP_LOOP_3_modExp_1_while_C_6 : begin
        fsm_output = 9'b100010010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_7;
      end
      COMP_LOOP_3_modExp_1_while_C_7 : begin
        fsm_output = 9'b100010011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_8;
      end
      COMP_LOOP_3_modExp_1_while_C_8 : begin
        fsm_output = 9'b100010100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_9;
      end
      COMP_LOOP_3_modExp_1_while_C_9 : begin
        fsm_output = 9'b100010101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_10;
      end
      COMP_LOOP_3_modExp_1_while_C_10 : begin
        fsm_output = 9'b100010110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_11;
      end
      COMP_LOOP_3_modExp_1_while_C_11 : begin
        fsm_output = 9'b100010111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_12;
      end
      COMP_LOOP_3_modExp_1_while_C_12 : begin
        fsm_output = 9'b100011000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_13;
      end
      COMP_LOOP_3_modExp_1_while_C_13 : begin
        fsm_output = 9'b100011001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_14;
      end
      COMP_LOOP_3_modExp_1_while_C_14 : begin
        fsm_output = 9'b100011010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_15;
      end
      COMP_LOOP_3_modExp_1_while_C_15 : begin
        fsm_output = 9'b100011011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_16;
      end
      COMP_LOOP_3_modExp_1_while_C_16 : begin
        fsm_output = 9'b100011100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_17;
      end
      COMP_LOOP_3_modExp_1_while_C_17 : begin
        fsm_output = 9'b100011101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_18;
      end
      COMP_LOOP_3_modExp_1_while_C_18 : begin
        fsm_output = 9'b100011110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_19;
      end
      COMP_LOOP_3_modExp_1_while_C_19 : begin
        fsm_output = 9'b100011111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_20;
      end
      COMP_LOOP_3_modExp_1_while_C_20 : begin
        fsm_output = 9'b100100000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_21;
      end
      COMP_LOOP_3_modExp_1_while_C_21 : begin
        fsm_output = 9'b100100001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_22;
      end
      COMP_LOOP_3_modExp_1_while_C_22 : begin
        fsm_output = 9'b100100010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_23;
      end
      COMP_LOOP_3_modExp_1_while_C_23 : begin
        fsm_output = 9'b100100011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_24;
      end
      COMP_LOOP_3_modExp_1_while_C_24 : begin
        fsm_output = 9'b100100100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_25;
      end
      COMP_LOOP_3_modExp_1_while_C_25 : begin
        fsm_output = 9'b100100101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_26;
      end
      COMP_LOOP_3_modExp_1_while_C_26 : begin
        fsm_output = 9'b100100110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_27;
      end
      COMP_LOOP_3_modExp_1_while_C_27 : begin
        fsm_output = 9'b100100111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_28;
      end
      COMP_LOOP_3_modExp_1_while_C_28 : begin
        fsm_output = 9'b100101000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_29;
      end
      COMP_LOOP_3_modExp_1_while_C_29 : begin
        fsm_output = 9'b100101001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_30;
      end
      COMP_LOOP_3_modExp_1_while_C_30 : begin
        fsm_output = 9'b100101010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_31;
      end
      COMP_LOOP_3_modExp_1_while_C_31 : begin
        fsm_output = 9'b100101011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_32;
      end
      COMP_LOOP_3_modExp_1_while_C_32 : begin
        fsm_output = 9'b100101100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_33;
      end
      COMP_LOOP_3_modExp_1_while_C_33 : begin
        fsm_output = 9'b100101101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_34;
      end
      COMP_LOOP_3_modExp_1_while_C_34 : begin
        fsm_output = 9'b100101110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_35;
      end
      COMP_LOOP_3_modExp_1_while_C_35 : begin
        fsm_output = 9'b100101111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_36;
      end
      COMP_LOOP_3_modExp_1_while_C_36 : begin
        fsm_output = 9'b100110000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_37;
      end
      COMP_LOOP_3_modExp_1_while_C_37 : begin
        fsm_output = 9'b100110001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_38;
      end
      COMP_LOOP_3_modExp_1_while_C_38 : begin
        fsm_output = 9'b100110010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_39;
      end
      COMP_LOOP_3_modExp_1_while_C_39 : begin
        fsm_output = 9'b100110011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_40;
      end
      COMP_LOOP_3_modExp_1_while_C_40 : begin
        fsm_output = 9'b100110100;
        if ( COMP_LOOP_3_modExp_1_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_134;
        end
        else begin
          state_var_NS = COMP_LOOP_3_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_134 : begin
        fsm_output = 9'b100110101;
        state_var_NS = COMP_LOOP_C_135;
      end
      COMP_LOOP_C_135 : begin
        fsm_output = 9'b100110110;
        state_var_NS = COMP_LOOP_C_136;
      end
      COMP_LOOP_C_136 : begin
        fsm_output = 9'b100110111;
        state_var_NS = COMP_LOOP_C_137;
      end
      COMP_LOOP_C_137 : begin
        fsm_output = 9'b100111000;
        state_var_NS = COMP_LOOP_C_138;
      end
      COMP_LOOP_C_138 : begin
        fsm_output = 9'b100111001;
        state_var_NS = COMP_LOOP_C_139;
      end
      COMP_LOOP_C_139 : begin
        fsm_output = 9'b100111010;
        state_var_NS = COMP_LOOP_C_140;
      end
      COMP_LOOP_C_140 : begin
        fsm_output = 9'b100111011;
        state_var_NS = COMP_LOOP_C_141;
      end
      COMP_LOOP_C_141 : begin
        fsm_output = 9'b100111100;
        state_var_NS = COMP_LOOP_C_142;
      end
      COMP_LOOP_C_142 : begin
        fsm_output = 9'b100111101;
        state_var_NS = COMP_LOOP_C_143;
      end
      COMP_LOOP_C_143 : begin
        fsm_output = 9'b100111110;
        state_var_NS = COMP_LOOP_C_144;
      end
      COMP_LOOP_C_144 : begin
        fsm_output = 9'b100111111;
        state_var_NS = COMP_LOOP_C_145;
      end
      COMP_LOOP_C_145 : begin
        fsm_output = 9'b101000000;
        state_var_NS = COMP_LOOP_C_146;
      end
      COMP_LOOP_C_146 : begin
        fsm_output = 9'b101000001;
        state_var_NS = COMP_LOOP_C_147;
      end
      COMP_LOOP_C_147 : begin
        fsm_output = 9'b101000010;
        state_var_NS = COMP_LOOP_C_148;
      end
      COMP_LOOP_C_148 : begin
        fsm_output = 9'b101000011;
        state_var_NS = COMP_LOOP_C_149;
      end
      COMP_LOOP_C_149 : begin
        fsm_output = 9'b101000100;
        state_var_NS = COMP_LOOP_C_150;
      end
      COMP_LOOP_C_150 : begin
        fsm_output = 9'b101000101;
        state_var_NS = COMP_LOOP_C_151;
      end
      COMP_LOOP_C_151 : begin
        fsm_output = 9'b101000110;
        state_var_NS = COMP_LOOP_C_152;
      end
      COMP_LOOP_C_152 : begin
        fsm_output = 9'b101000111;
        state_var_NS = COMP_LOOP_C_153;
      end
      COMP_LOOP_C_153 : begin
        fsm_output = 9'b101001000;
        state_var_NS = COMP_LOOP_C_154;
      end
      COMP_LOOP_C_154 : begin
        fsm_output = 9'b101001001;
        state_var_NS = COMP_LOOP_C_155;
      end
      COMP_LOOP_C_155 : begin
        fsm_output = 9'b101001010;
        state_var_NS = COMP_LOOP_C_156;
      end
      COMP_LOOP_C_156 : begin
        fsm_output = 9'b101001011;
        state_var_NS = COMP_LOOP_C_157;
      end
      COMP_LOOP_C_157 : begin
        fsm_output = 9'b101001100;
        state_var_NS = COMP_LOOP_C_158;
      end
      COMP_LOOP_C_158 : begin
        fsm_output = 9'b101001101;
        state_var_NS = COMP_LOOP_C_159;
      end
      COMP_LOOP_C_159 : begin
        fsm_output = 9'b101001110;
        state_var_NS = COMP_LOOP_C_160;
      end
      COMP_LOOP_C_160 : begin
        fsm_output = 9'b101001111;
        state_var_NS = COMP_LOOP_C_161;
      end
      COMP_LOOP_C_161 : begin
        fsm_output = 9'b101010000;
        state_var_NS = COMP_LOOP_C_162;
      end
      COMP_LOOP_C_162 : begin
        fsm_output = 9'b101010001;
        state_var_NS = COMP_LOOP_C_163;
      end
      COMP_LOOP_C_163 : begin
        fsm_output = 9'b101010010;
        state_var_NS = COMP_LOOP_C_164;
      end
      COMP_LOOP_C_164 : begin
        fsm_output = 9'b101010011;
        state_var_NS = COMP_LOOP_C_165;
      end
      COMP_LOOP_C_165 : begin
        fsm_output = 9'b101010100;
        state_var_NS = COMP_LOOP_C_166;
      end
      COMP_LOOP_C_166 : begin
        fsm_output = 9'b101010101;
        state_var_NS = COMP_LOOP_C_167;
      end
      COMP_LOOP_C_167 : begin
        fsm_output = 9'b101010110;
        state_var_NS = COMP_LOOP_C_168;
      end
      COMP_LOOP_C_168 : begin
        fsm_output = 9'b101010111;
        state_var_NS = COMP_LOOP_C_169;
      end
      COMP_LOOP_C_169 : begin
        fsm_output = 9'b101011000;
        state_var_NS = COMP_LOOP_C_170;
      end
      COMP_LOOP_C_170 : begin
        fsm_output = 9'b101011001;
        state_var_NS = COMP_LOOP_C_171;
      end
      COMP_LOOP_C_171 : begin
        fsm_output = 9'b101011010;
        state_var_NS = COMP_LOOP_C_172;
      end
      COMP_LOOP_C_172 : begin
        fsm_output = 9'b101011011;
        state_var_NS = COMP_LOOP_C_173;
      end
      COMP_LOOP_C_173 : begin
        fsm_output = 9'b101011100;
        state_var_NS = COMP_LOOP_C_174;
      end
      COMP_LOOP_C_174 : begin
        fsm_output = 9'b101011101;
        state_var_NS = COMP_LOOP_C_175;
      end
      COMP_LOOP_C_175 : begin
        fsm_output = 9'b101011110;
        state_var_NS = COMP_LOOP_C_176;
      end
      COMP_LOOP_C_176 : begin
        fsm_output = 9'b101011111;
        state_var_NS = COMP_LOOP_C_177;
      end
      COMP_LOOP_C_177 : begin
        fsm_output = 9'b101100000;
        state_var_NS = COMP_LOOP_C_178;
      end
      COMP_LOOP_C_178 : begin
        fsm_output = 9'b101100001;
        state_var_NS = COMP_LOOP_C_179;
      end
      COMP_LOOP_C_179 : begin
        fsm_output = 9'b101100010;
        state_var_NS = COMP_LOOP_C_180;
      end
      COMP_LOOP_C_180 : begin
        fsm_output = 9'b101100011;
        state_var_NS = COMP_LOOP_C_181;
      end
      COMP_LOOP_C_181 : begin
        fsm_output = 9'b101100100;
        state_var_NS = COMP_LOOP_C_182;
      end
      COMP_LOOP_C_182 : begin
        fsm_output = 9'b101100101;
        state_var_NS = COMP_LOOP_C_183;
      end
      COMP_LOOP_C_183 : begin
        fsm_output = 9'b101100110;
        state_var_NS = COMP_LOOP_C_184;
      end
      COMP_LOOP_C_184 : begin
        fsm_output = 9'b101100111;
        state_var_NS = COMP_LOOP_C_185;
      end
      COMP_LOOP_C_185 : begin
        fsm_output = 9'b101101000;
        state_var_NS = COMP_LOOP_C_186;
      end
      COMP_LOOP_C_186 : begin
        fsm_output = 9'b101101001;
        state_var_NS = COMP_LOOP_C_187;
      end
      COMP_LOOP_C_187 : begin
        fsm_output = 9'b101101010;
        state_var_NS = COMP_LOOP_C_188;
      end
      COMP_LOOP_C_188 : begin
        fsm_output = 9'b101101011;
        state_var_NS = COMP_LOOP_C_189;
      end
      COMP_LOOP_C_189 : begin
        fsm_output = 9'b101101100;
        state_var_NS = COMP_LOOP_C_190;
      end
      COMP_LOOP_C_190 : begin
        fsm_output = 9'b101101101;
        state_var_NS = COMP_LOOP_C_191;
      end
      COMP_LOOP_C_191 : begin
        fsm_output = 9'b101101110;
        state_var_NS = COMP_LOOP_C_192;
      end
      COMP_LOOP_C_192 : begin
        fsm_output = 9'b101101111;
        state_var_NS = COMP_LOOP_C_193;
      end
      COMP_LOOP_C_193 : begin
        fsm_output = 9'b101110000;
        state_var_NS = COMP_LOOP_C_194;
      end
      COMP_LOOP_C_194 : begin
        fsm_output = 9'b101110001;
        state_var_NS = COMP_LOOP_C_195;
      end
      COMP_LOOP_C_195 : begin
        fsm_output = 9'b101110010;
        state_var_NS = COMP_LOOP_C_196;
      end
      COMP_LOOP_C_196 : begin
        fsm_output = 9'b101110011;
        state_var_NS = COMP_LOOP_C_197;
      end
      COMP_LOOP_C_197 : begin
        fsm_output = 9'b101110100;
        state_var_NS = COMP_LOOP_C_198;
      end
      COMP_LOOP_C_198 : begin
        fsm_output = 9'b101110101;
        if ( COMP_LOOP_C_198_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_199;
        end
      end
      COMP_LOOP_C_199 : begin
        fsm_output = 9'b101110110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_0;
      end
      COMP_LOOP_4_modExp_1_while_C_0 : begin
        fsm_output = 9'b101110111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_1;
      end
      COMP_LOOP_4_modExp_1_while_C_1 : begin
        fsm_output = 9'b101111000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_2;
      end
      COMP_LOOP_4_modExp_1_while_C_2 : begin
        fsm_output = 9'b101111001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_3;
      end
      COMP_LOOP_4_modExp_1_while_C_3 : begin
        fsm_output = 9'b101111010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_4;
      end
      COMP_LOOP_4_modExp_1_while_C_4 : begin
        fsm_output = 9'b101111011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_5;
      end
      COMP_LOOP_4_modExp_1_while_C_5 : begin
        fsm_output = 9'b101111100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_6;
      end
      COMP_LOOP_4_modExp_1_while_C_6 : begin
        fsm_output = 9'b101111101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_7;
      end
      COMP_LOOP_4_modExp_1_while_C_7 : begin
        fsm_output = 9'b101111110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_8;
      end
      COMP_LOOP_4_modExp_1_while_C_8 : begin
        fsm_output = 9'b101111111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_9;
      end
      COMP_LOOP_4_modExp_1_while_C_9 : begin
        fsm_output = 9'b110000000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_10;
      end
      COMP_LOOP_4_modExp_1_while_C_10 : begin
        fsm_output = 9'b110000001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_11;
      end
      COMP_LOOP_4_modExp_1_while_C_11 : begin
        fsm_output = 9'b110000010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_12;
      end
      COMP_LOOP_4_modExp_1_while_C_12 : begin
        fsm_output = 9'b110000011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_13;
      end
      COMP_LOOP_4_modExp_1_while_C_13 : begin
        fsm_output = 9'b110000100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_14;
      end
      COMP_LOOP_4_modExp_1_while_C_14 : begin
        fsm_output = 9'b110000101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_15;
      end
      COMP_LOOP_4_modExp_1_while_C_15 : begin
        fsm_output = 9'b110000110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_16;
      end
      COMP_LOOP_4_modExp_1_while_C_16 : begin
        fsm_output = 9'b110000111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_17;
      end
      COMP_LOOP_4_modExp_1_while_C_17 : begin
        fsm_output = 9'b110001000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_18;
      end
      COMP_LOOP_4_modExp_1_while_C_18 : begin
        fsm_output = 9'b110001001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_19;
      end
      COMP_LOOP_4_modExp_1_while_C_19 : begin
        fsm_output = 9'b110001010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_20;
      end
      COMP_LOOP_4_modExp_1_while_C_20 : begin
        fsm_output = 9'b110001011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_21;
      end
      COMP_LOOP_4_modExp_1_while_C_21 : begin
        fsm_output = 9'b110001100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_22;
      end
      COMP_LOOP_4_modExp_1_while_C_22 : begin
        fsm_output = 9'b110001101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_23;
      end
      COMP_LOOP_4_modExp_1_while_C_23 : begin
        fsm_output = 9'b110001110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_24;
      end
      COMP_LOOP_4_modExp_1_while_C_24 : begin
        fsm_output = 9'b110001111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_25;
      end
      COMP_LOOP_4_modExp_1_while_C_25 : begin
        fsm_output = 9'b110010000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_26;
      end
      COMP_LOOP_4_modExp_1_while_C_26 : begin
        fsm_output = 9'b110010001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_27;
      end
      COMP_LOOP_4_modExp_1_while_C_27 : begin
        fsm_output = 9'b110010010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_28;
      end
      COMP_LOOP_4_modExp_1_while_C_28 : begin
        fsm_output = 9'b110010011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_29;
      end
      COMP_LOOP_4_modExp_1_while_C_29 : begin
        fsm_output = 9'b110010100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_30;
      end
      COMP_LOOP_4_modExp_1_while_C_30 : begin
        fsm_output = 9'b110010101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_31;
      end
      COMP_LOOP_4_modExp_1_while_C_31 : begin
        fsm_output = 9'b110010110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_32;
      end
      COMP_LOOP_4_modExp_1_while_C_32 : begin
        fsm_output = 9'b110010111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_33;
      end
      COMP_LOOP_4_modExp_1_while_C_33 : begin
        fsm_output = 9'b110011000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_34;
      end
      COMP_LOOP_4_modExp_1_while_C_34 : begin
        fsm_output = 9'b110011001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_35;
      end
      COMP_LOOP_4_modExp_1_while_C_35 : begin
        fsm_output = 9'b110011010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_36;
      end
      COMP_LOOP_4_modExp_1_while_C_36 : begin
        fsm_output = 9'b110011011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_37;
      end
      COMP_LOOP_4_modExp_1_while_C_37 : begin
        fsm_output = 9'b110011100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_38;
      end
      COMP_LOOP_4_modExp_1_while_C_38 : begin
        fsm_output = 9'b110011101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_39;
      end
      COMP_LOOP_4_modExp_1_while_C_39 : begin
        fsm_output = 9'b110011110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_40;
      end
      COMP_LOOP_4_modExp_1_while_C_40 : begin
        fsm_output = 9'b110011111;
        if ( COMP_LOOP_4_modExp_1_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_200;
        end
        else begin
          state_var_NS = COMP_LOOP_4_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_200 : begin
        fsm_output = 9'b110100000;
        state_var_NS = COMP_LOOP_C_201;
      end
      COMP_LOOP_C_201 : begin
        fsm_output = 9'b110100001;
        state_var_NS = COMP_LOOP_C_202;
      end
      COMP_LOOP_C_202 : begin
        fsm_output = 9'b110100010;
        state_var_NS = COMP_LOOP_C_203;
      end
      COMP_LOOP_C_203 : begin
        fsm_output = 9'b110100011;
        state_var_NS = COMP_LOOP_C_204;
      end
      COMP_LOOP_C_204 : begin
        fsm_output = 9'b110100100;
        state_var_NS = COMP_LOOP_C_205;
      end
      COMP_LOOP_C_205 : begin
        fsm_output = 9'b110100101;
        state_var_NS = COMP_LOOP_C_206;
      end
      COMP_LOOP_C_206 : begin
        fsm_output = 9'b110100110;
        state_var_NS = COMP_LOOP_C_207;
      end
      COMP_LOOP_C_207 : begin
        fsm_output = 9'b110100111;
        state_var_NS = COMP_LOOP_C_208;
      end
      COMP_LOOP_C_208 : begin
        fsm_output = 9'b110101000;
        state_var_NS = COMP_LOOP_C_209;
      end
      COMP_LOOP_C_209 : begin
        fsm_output = 9'b110101001;
        state_var_NS = COMP_LOOP_C_210;
      end
      COMP_LOOP_C_210 : begin
        fsm_output = 9'b110101010;
        state_var_NS = COMP_LOOP_C_211;
      end
      COMP_LOOP_C_211 : begin
        fsm_output = 9'b110101011;
        state_var_NS = COMP_LOOP_C_212;
      end
      COMP_LOOP_C_212 : begin
        fsm_output = 9'b110101100;
        state_var_NS = COMP_LOOP_C_213;
      end
      COMP_LOOP_C_213 : begin
        fsm_output = 9'b110101101;
        state_var_NS = COMP_LOOP_C_214;
      end
      COMP_LOOP_C_214 : begin
        fsm_output = 9'b110101110;
        state_var_NS = COMP_LOOP_C_215;
      end
      COMP_LOOP_C_215 : begin
        fsm_output = 9'b110101111;
        state_var_NS = COMP_LOOP_C_216;
      end
      COMP_LOOP_C_216 : begin
        fsm_output = 9'b110110000;
        state_var_NS = COMP_LOOP_C_217;
      end
      COMP_LOOP_C_217 : begin
        fsm_output = 9'b110110001;
        state_var_NS = COMP_LOOP_C_218;
      end
      COMP_LOOP_C_218 : begin
        fsm_output = 9'b110110010;
        state_var_NS = COMP_LOOP_C_219;
      end
      COMP_LOOP_C_219 : begin
        fsm_output = 9'b110110011;
        state_var_NS = COMP_LOOP_C_220;
      end
      COMP_LOOP_C_220 : begin
        fsm_output = 9'b110110100;
        state_var_NS = COMP_LOOP_C_221;
      end
      COMP_LOOP_C_221 : begin
        fsm_output = 9'b110110101;
        state_var_NS = COMP_LOOP_C_222;
      end
      COMP_LOOP_C_222 : begin
        fsm_output = 9'b110110110;
        state_var_NS = COMP_LOOP_C_223;
      end
      COMP_LOOP_C_223 : begin
        fsm_output = 9'b110110111;
        state_var_NS = COMP_LOOP_C_224;
      end
      COMP_LOOP_C_224 : begin
        fsm_output = 9'b110111000;
        state_var_NS = COMP_LOOP_C_225;
      end
      COMP_LOOP_C_225 : begin
        fsm_output = 9'b110111001;
        state_var_NS = COMP_LOOP_C_226;
      end
      COMP_LOOP_C_226 : begin
        fsm_output = 9'b110111010;
        state_var_NS = COMP_LOOP_C_227;
      end
      COMP_LOOP_C_227 : begin
        fsm_output = 9'b110111011;
        state_var_NS = COMP_LOOP_C_228;
      end
      COMP_LOOP_C_228 : begin
        fsm_output = 9'b110111100;
        state_var_NS = COMP_LOOP_C_229;
      end
      COMP_LOOP_C_229 : begin
        fsm_output = 9'b110111101;
        state_var_NS = COMP_LOOP_C_230;
      end
      COMP_LOOP_C_230 : begin
        fsm_output = 9'b110111110;
        state_var_NS = COMP_LOOP_C_231;
      end
      COMP_LOOP_C_231 : begin
        fsm_output = 9'b110111111;
        state_var_NS = COMP_LOOP_C_232;
      end
      COMP_LOOP_C_232 : begin
        fsm_output = 9'b111000000;
        state_var_NS = COMP_LOOP_C_233;
      end
      COMP_LOOP_C_233 : begin
        fsm_output = 9'b111000001;
        state_var_NS = COMP_LOOP_C_234;
      end
      COMP_LOOP_C_234 : begin
        fsm_output = 9'b111000010;
        state_var_NS = COMP_LOOP_C_235;
      end
      COMP_LOOP_C_235 : begin
        fsm_output = 9'b111000011;
        state_var_NS = COMP_LOOP_C_236;
      end
      COMP_LOOP_C_236 : begin
        fsm_output = 9'b111000100;
        state_var_NS = COMP_LOOP_C_237;
      end
      COMP_LOOP_C_237 : begin
        fsm_output = 9'b111000101;
        state_var_NS = COMP_LOOP_C_238;
      end
      COMP_LOOP_C_238 : begin
        fsm_output = 9'b111000110;
        state_var_NS = COMP_LOOP_C_239;
      end
      COMP_LOOP_C_239 : begin
        fsm_output = 9'b111000111;
        state_var_NS = COMP_LOOP_C_240;
      end
      COMP_LOOP_C_240 : begin
        fsm_output = 9'b111001000;
        state_var_NS = COMP_LOOP_C_241;
      end
      COMP_LOOP_C_241 : begin
        fsm_output = 9'b111001001;
        state_var_NS = COMP_LOOP_C_242;
      end
      COMP_LOOP_C_242 : begin
        fsm_output = 9'b111001010;
        state_var_NS = COMP_LOOP_C_243;
      end
      COMP_LOOP_C_243 : begin
        fsm_output = 9'b111001011;
        state_var_NS = COMP_LOOP_C_244;
      end
      COMP_LOOP_C_244 : begin
        fsm_output = 9'b111001100;
        state_var_NS = COMP_LOOP_C_245;
      end
      COMP_LOOP_C_245 : begin
        fsm_output = 9'b111001101;
        state_var_NS = COMP_LOOP_C_246;
      end
      COMP_LOOP_C_246 : begin
        fsm_output = 9'b111001110;
        state_var_NS = COMP_LOOP_C_247;
      end
      COMP_LOOP_C_247 : begin
        fsm_output = 9'b111001111;
        state_var_NS = COMP_LOOP_C_248;
      end
      COMP_LOOP_C_248 : begin
        fsm_output = 9'b111010000;
        state_var_NS = COMP_LOOP_C_249;
      end
      COMP_LOOP_C_249 : begin
        fsm_output = 9'b111010001;
        state_var_NS = COMP_LOOP_C_250;
      end
      COMP_LOOP_C_250 : begin
        fsm_output = 9'b111010010;
        state_var_NS = COMP_LOOP_C_251;
      end
      COMP_LOOP_C_251 : begin
        fsm_output = 9'b111010011;
        state_var_NS = COMP_LOOP_C_252;
      end
      COMP_LOOP_C_252 : begin
        fsm_output = 9'b111010100;
        state_var_NS = COMP_LOOP_C_253;
      end
      COMP_LOOP_C_253 : begin
        fsm_output = 9'b111010101;
        state_var_NS = COMP_LOOP_C_254;
      end
      COMP_LOOP_C_254 : begin
        fsm_output = 9'b111010110;
        state_var_NS = COMP_LOOP_C_255;
      end
      COMP_LOOP_C_255 : begin
        fsm_output = 9'b111010111;
        state_var_NS = COMP_LOOP_C_256;
      end
      COMP_LOOP_C_256 : begin
        fsm_output = 9'b111011000;
        state_var_NS = COMP_LOOP_C_257;
      end
      COMP_LOOP_C_257 : begin
        fsm_output = 9'b111011001;
        state_var_NS = COMP_LOOP_C_258;
      end
      COMP_LOOP_C_258 : begin
        fsm_output = 9'b111011010;
        state_var_NS = COMP_LOOP_C_259;
      end
      COMP_LOOP_C_259 : begin
        fsm_output = 9'b111011011;
        state_var_NS = COMP_LOOP_C_260;
      end
      COMP_LOOP_C_260 : begin
        fsm_output = 9'b111011100;
        state_var_NS = COMP_LOOP_C_261;
      end
      COMP_LOOP_C_261 : begin
        fsm_output = 9'b111011101;
        state_var_NS = COMP_LOOP_C_262;
      end
      COMP_LOOP_C_262 : begin
        fsm_output = 9'b111011110;
        state_var_NS = COMP_LOOP_C_263;
      end
      COMP_LOOP_C_263 : begin
        fsm_output = 9'b111011111;
        state_var_NS = COMP_LOOP_C_264;
      end
      COMP_LOOP_C_264 : begin
        fsm_output = 9'b111100000;
        if ( COMP_LOOP_C_264_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 9'b111100001;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_10;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_10 : begin
        fsm_output = 9'b111100010;
        if ( STAGE_LOOP_C_10_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 9'b111100011;
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
  clk, rst, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz, vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_3_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz,
      vec_rsc_0_0_i_qa_d, vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d, vec_rsc_0_1_i_qa_d,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d, vec_rsc_0_2_i_qa_d, vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_3_i_qa_d, vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d, vec_rsc_0_0_i_adra_d_pff,
      vec_rsc_0_0_i_da_d_pff, vec_rsc_0_0_i_wea_d_pff, vec_rsc_0_1_i_wea_d_pff, vec_rsc_0_2_i_wea_d_pff,
      vec_rsc_0_3_i_wea_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_0_0_lz;
  output vec_rsc_triosy_0_1_lz;
  output vec_rsc_triosy_0_2_lz;
  output vec_rsc_triosy_0_3_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  input [63:0] vec_rsc_0_0_i_qa_d;
  output vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_1_i_qa_d;
  output vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_2_i_qa_d;
  output vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_3_i_qa_d;
  output vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [9:0] vec_rsc_0_0_i_adra_d_pff;
  output [63:0] vec_rsc_0_0_i_da_d_pff;
  output vec_rsc_0_0_i_wea_d_pff;
  output vec_rsc_0_1_i_wea_d_pff;
  output vec_rsc_0_2_i_wea_d_pff;
  output vec_rsc_0_3_i_wea_d_pff;


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
  wire or_tmp_2;
  wire or_tmp_7;
  wire nor_tmp_4;
  wire or_tmp_32;
  wire or_tmp_43;
  wire mux_tmp_55;
  wire and_dcpl_2;
  wire and_tmp_6;
  wire not_tmp_73;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_27;
  wire and_dcpl_29;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_44;
  wire and_dcpl_45;
  wire and_dcpl_46;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire nor_tmp_40;
  wire not_tmp_90;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire and_dcpl_64;
  wire and_dcpl_70;
  wire and_dcpl_71;
  wire and_dcpl_72;
  wire or_tmp_111;
  wire or_tmp_113;
  wire and_dcpl_76;
  wire and_dcpl_77;
  wire and_dcpl_82;
  wire and_dcpl_83;
  wire mux_tmp_170;
  wire not_tmp_130;
  wire mux_tmp_171;
  wire and_dcpl_85;
  wire nor_tmp_57;
  wire mux_tmp_172;
  wire or_tmp_230;
  wire mux_tmp_177;
  wire mux_tmp_178;
  wire mux_tmp_179;
  wire mux_tmp_180;
  wire nor_tmp_61;
  wire mux_tmp_181;
  wire mux_tmp_183;
  wire mux_tmp_184;
  wire not_tmp_144;
  wire or_tmp_251;
  wire or_tmp_255;
  wire not_tmp_152;
  wire nor_tmp_68;
  wire and_tmp_13;
  wire or_dcpl_31;
  wire and_dcpl_98;
  wire and_dcpl_100;
  wire or_tmp_268;
  wire or_tmp_269;
  wire and_dcpl_110;
  wire and_dcpl_111;
  wire and_dcpl_116;
  wire or_tmp_285;
  wire or_tmp_291;
  wire and_dcpl_122;
  wire not_tmp_185;
  wire not_tmp_191;
  wire or_tmp_330;
  wire or_tmp_334;
  wire not_tmp_201;
  wire mux_tmp_257;
  wire nor_tmp_87;
  wire mux_tmp_258;
  wire or_tmp_349;
  wire or_tmp_351;
  wire mux_tmp_265;
  wire or_tmp_353;
  wire mux_tmp_268;
  wire not_tmp_215;
  wire and_dcpl_145;
  wire or_dcpl_40;
  wire or_dcpl_42;
  wire or_dcpl_43;
  wire not_tmp_227;
  wire mux_tmp_327;
  wire mux_tmp_328;
  wire mux_tmp_335;
  wire mux_tmp_345;
  wire and_dcpl_152;
  wire not_tmp_245;
  wire not_tmp_250;
  wire nor_tmp_104;
  wire and_dcpl_155;
  wire not_tmp_252;
  wire not_tmp_253;
  wire or_dcpl_47;
  wire or_dcpl_49;
  wire or_dcpl_52;
  wire or_dcpl_53;
  reg exit_COMP_LOOP_1_modExp_1_while_sva;
  reg modExp_exp_1_0_1_sva;
  reg COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  reg [11:0] VEC_LOOP_j_sva_11_0;
  reg [6:0] COMP_LOOP_k_9_2_sva_6_0;
  reg [11:0] COMP_LOOP_acc_10_cse_12_1_1_sva;
  reg [11:0] COMP_LOOP_acc_1_cse_2_sva;
  reg [11:0] COMP_LOOP_acc_1_cse_sva;
  wire [12:0] nl_COMP_LOOP_acc_1_cse_sva;
  reg [10:0] COMP_LOOP_acc_11_psp_sva;
  reg [63:0] operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm;
  reg [63:0] COMP_LOOP_1_acc_5_mut;
  wire and_137_m1c;
  wire and_181_m1c;
  wire nor_43_cse;
  reg reg_vec_rsc_triosy_0_3_obj_ld_cse;
  wire or_278_cse;
  wire and_192_cse;
  wire or_376_cse;
  wire nor_149_cse;
  wire [63:0] modulo_result_mux_cse;
  wire or_540_cse;
  wire or_52_cse;
  wire nor_161_cse;
  wire and_190_cse;
  wire and_284_cse;
  wire or_57_cse;
  wire and_285_cse;
  wire or_574_cse;
  wire or_107_cse;
  wire or_71_cse;
  wire nand_56_cse;
  wire nor_143_cse;
  wire or_353_cse;
  wire mux_249_cse;
  wire or_123_cse;
  wire [9:0] COMP_LOOP_acc_psp_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_psp_sva_1;
  reg [9:0] COMP_LOOP_acc_psp_sva;
  reg [63:0] modExp_base_1_sva;
  wire mux_185_itm;
  wire mux_204_itm;
  wire mux_269_itm;
  wire mux_353_itm;
  wire and_dcpl_170;
  wire and_dcpl_175;
  wire [11:0] z_out;
  wire and_dcpl_178;
  wire and_dcpl_181;
  wire and_dcpl_182;
  wire and_dcpl_183;
  wire not_tmp_289;
  wire not_tmp_291;
  wire and_dcpl_186;
  wire and_dcpl_188;
  wire and_dcpl_190;
  wire and_dcpl_194;
  wire and_dcpl_199;
  wire and_dcpl_201;
  wire and_dcpl_202;
  wire and_dcpl_206;
  wire and_dcpl_208;
  wire [12:0] z_out_1;
  wire [13:0] nl_z_out_1;
  wire and_dcpl_212;
  wire and_dcpl_227;
  wire and_dcpl_242;
  wire and_dcpl_249;
  wire and_dcpl_252;
  wire and_dcpl_254;
  wire and_dcpl_255;
  wire and_dcpl_256;
  wire and_dcpl_258;
  wire and_dcpl_261;
  wire and_dcpl_267;
  wire and_dcpl_268;
  wire [64:0] z_out_3;
  wire [63:0] z_out_4;
  wire [127:0] nl_z_out_4;
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
  reg [63:0] modExp_while_if_mul_mut;
  reg [63:0] COMP_LOOP_1_modExp_1_while_if_mul_mut;
  reg [63:0] COMP_LOOP_1_mul_mut;
  reg [63:0] COMP_LOOP_2_modExp_1_while_mul_mut;
  reg [63:0] COMP_LOOP_2_mul_mut;
  reg [63:0] COMP_LOOP_3_modExp_1_while_mul_mut;
  reg [63:0] COMP_LOOP_3_mul_mut;
  reg [63:0] COMP_LOOP_4_modExp_1_while_mul_mut;
  reg [63:0] COMP_LOOP_4_mul_mut;
  reg [63:0] modExp_while_mul_itm;
  reg [63:0] COMP_LOOP_1_modExp_1_while_mul_itm;
  reg [63:0] COMP_LOOP_2_modExp_1_while_if_mul_itm;
  reg [63:0] COMP_LOOP_3_modExp_1_while_if_mul_itm;
  reg [63:0] COMP_LOOP_4_modExp_1_while_if_mul_itm;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [63:0] COMP_LOOP_1_acc_5_mut_mx0w7;
  wire [64:0] nl_COMP_LOOP_1_acc_5_mut_mx0w7;
  wire [64:0] operator_64_false_acc_mut_mx0w0;
  wire [65:0] nl_operator_64_false_acc_mut_mx0w0;
  wire [9:0] STAGE_LOOP_lshift_psp_sva_mx0w0;
  wire VEC_LOOP_j_sva_11_0_mx0c1;
  wire modExp_result_sva_mx0c0;
  wire [62:0] operator_64_false_slc_modExp_exp_63_1_3;
  wire [63:0] modulo_qr_sva_1_mx0w8;
  wire [64:0] nl_modulo_qr_sva_1_mx0w8;
  wire modExp_while_and_3;
  wire modExp_while_and_5;
  wire and_144_m1c;
  wire modExp_result_and_rgt;
  wire modExp_result_and_1_rgt;
  wire operator_64_false_1_or_ssc;
  wire COMP_LOOP_or_ssc;
  wire COMP_LOOP_or_2_cse;
  wire and_203_cse;
  wire nor_263_cse;
  wire or_384_cse;
  wire nor_tmp;
  wire mux_tmp_413;
  wire or_tmp_497;
  wire [64:0] operator_64_false_mux1h_1_rgt;
  reg operator_64_false_acc_mut_64;
  reg [63:0] operator_64_false_acc_mut_63_0;
  wire or_607_cse;
  wire nand_cse;
  wire nand_57_cse;
  wire operator_64_false_1_or_itm;
  wire COMP_LOOP_or_20_itm;
  wire STAGE_LOOP_acc_itm_2_1;
  wire nor_287_cse;

  wire[0:0] modulo_result_or_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] and_236_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] or_263_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] or_261_nl;
  wire[0:0] nor_186_nl;
  wire[0:0] and_93_nl;
  wire[0:0] and_96_nl;
  wire[0:0] and_98_nl;
  wire[0:0] and_99_nl;
  wire[0:0] and_101_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] nand_62_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] nand_26_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] or_277_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] nand_61_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] nor_182_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] and_103_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] or_284_nl;
  wire[0:0] and_106_nl;
  wire[0:0] and_108_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] and_111_nl;
  wire[0:0] and_113_nl;
  wire[0:0] and_117_nl;
  wire[0:0] and_118_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] nand_59_nl;
  wire[0:0] and_119_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] and_222_nl;
  wire[0:0] nor_179_nl;
  wire[0:0] and_121_nl;
  wire[0:0] and_122_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] nor_177_nl;
  wire[63:0] COMP_LOOP_mux1h_40_nl;
  wire[63:0] COMP_LOOP_1_acc_8_nl;
  wire[64:0] nl_COMP_LOOP_1_acc_8_nl;
  wire[0:0] COMP_LOOP_or_6_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] nor_138_nl;
  wire[0:0] nor_139_nl;
  wire[0:0] nor_140_nl;
  wire[0:0] COMP_LOOP_or_7_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] mux_366_nl;
  wire[0:0] nor_135_nl;
  wire[0:0] nor_136_nl;
  wire[0:0] nor_137_nl;
  wire[0:0] COMP_LOOP_or_8_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] mux_368_nl;
  wire[0:0] nor_132_nl;
  wire[0:0] nor_133_nl;
  wire[0:0] nor_134_nl;
  wire[0:0] COMP_LOOP_or_9_nl;
  wire[0:0] mux_371_nl;
  wire[0:0] mux_370_nl;
  wire[0:0] nor_129_nl;
  wire[0:0] nor_130_nl;
  wire[0:0] nor_131_nl;
  wire[0:0] and_127_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] or_323_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] or_576_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] or_320_nl;
  wire[0:0] or_319_nl;
  wire[0:0] nand_91_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] or_316_nl;
  wire[0:0] nand_92_nl;
  wire[0:0] mux_424_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] or_609_nl;
  wire[0:0] or_608_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] or_606_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] or_605_nl;
  wire[0:0] mux_413_nl;
  wire[0:0] and_413_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] nor_315_nl;
  wire[0:0] mux_431_nl;
  wire[0:0] or_619_nl;
  wire[0:0] or_618_nl;
  wire[0:0] mux_430_nl;
  wire[0:0] or_617_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] nor_316_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] or_614_nl;
  wire[0:0] or_613_nl;
  wire[0:0] nor_317_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] mux_426_nl;
  wire[0:0] or_610_nl;
  wire[0:0] or_601_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] or_333_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] or_332_nl;
  wire[0:0] nand_86_nl;
  wire[0:0] or_328_nl;
  wire[0:0] mux_435_nl;
  wire[0:0] or_628_nl;
  wire[0:0] mux_434_nl;
  wire[0:0] or_626_nl;
  wire[0:0] nand_101_nl;
  wire[0:0] nand_102_nl;
  wire[0:0] mux_433_nl;
  wire[0:0] nor_313_nl;
  wire[0:0] nor_314_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] nor_171_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] nor_169_nl;
  wire[0:0] nor_170_nl;
  wire[0:0] and_141_nl;
  wire[0:0] r_or_nl;
  wire[0:0] r_or_1_nl;
  wire[0:0] and_146_nl;
  wire[0:0] and_148_nl;
  wire[0:0] and_150_nl;
  wire[0:0] and_152_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] or_99_nl;
  wire[0:0] or_379_nl;
  wire[0:0] mux_251_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] nand_32_nl;
  wire[0:0] or_548_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] mux_247_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] or_372_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] nand_50_nl;
  wire[0:0] or_370_nl;
  wire[0:0] or_95_nl;
  wire[0:0] COMP_LOOP_and_nl;
  wire[0:0] COMP_LOOP_and_1_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] mux_288_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] nand_83_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] or_388_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] mux_276_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] mux_273_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] mux_267_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] mux_264_nl;
  wire[0:0] or_386_nl;
  wire[0:0] and_210_nl;
  wire[0:0] mux_263_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] mux_259_nl;
  wire[0:0] COMP_LOOP_mux1h_14_nl;
  wire[0:0] COMP_LOOP_and_9_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] mux_312_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] or_405_nl;
  wire[0:0] mux_310_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] and_202_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] or_403_nl;
  wire[0:0] or_402_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] mux_61_nl;
  wire[0:0] mux_300_nl;
  wire[0:0] and_263_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] mux_297_nl;
  wire[0:0] mux_296_nl;
  wire[0:0] mux_295_nl;
  wire[0:0] mux_294_nl;
  wire[0:0] or_400_nl;
  wire[0:0] or_399_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] mux_317_nl;
  wire[0:0] nor_154_nl;
  wire[0:0] nor_155_nl;
  wire[0:0] mux_318_nl;
  wire[9:0] COMP_LOOP_1_acc_nl;
  wire[10:0] nl_COMP_LOOP_1_acc_nl;
  wire[0:0] mux_321_nl;
  wire[0:0] nand_48_nl;
  wire[0:0] or_425_nl;
  wire[0:0] and_166_nl;
  wire[0:0] COMP_LOOP_mux_19_nl;
  wire[0:0] mux_334_nl;
  wire[0:0] and_200_nl;
  wire[0:0] mux_333_nl;
  wire[0:0] nor_150_nl;
  wire[0:0] nor_151_nl;
  wire[0:0] mux_332_nl;
  wire[0:0] or_433_nl;
  wire[0:0] or_431_nl;
  wire[0:0] mux_324_nl;
  wire[0:0] nand_90_nl;
  wire[0:0] or_575_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] or_442_nl;
  wire[0:0] mux_343_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] or_440_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] or_439_nl;
  wire[0:0] mux_336_nl;
  wire[0:0] COMP_LOOP_mux1h_22_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] and_198_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] and_290_nl;
  wire[0:0] COMP_LOOP_mux1h_39_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] or_464_nl;
  wire[0:0] mux_391_nl;
  wire[0:0] mux_398_nl;
  wire[0:0] nand_39_nl;
  wire[0:0] mux_399_nl;
  wire[0:0] nor_125_nl;
  wire[0:0] mux_400_nl;
  wire[0:0] and_188_nl;
  wire[0:0] nor_124_nl;
  wire[0:0] or_560_nl;
  wire[0:0] nand_74_nl;
  wire[0:0] nor_236_nl;
  wire[0:0] nor_237_nl;
  wire[0:0] or_266_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] and_230_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] nor_183_nl;
  wire[0:0] and_231_nl;
  wire[0:0] and_232_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] nor_184_nl;
  wire[0:0] nor_185_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] or_293_nl;
  wire[0:0] or_291_nl;
  wire[0:0] and_292_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] nor_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] nor_175_nl;
  wire[0:0] nor_176_nl;
  wire[0:0] and_214_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] and_215_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] and_216_nl;
  wire[0:0] nor_166_nl;
  wire[0:0] nor_167_nl;
  wire[0:0] nor_168_nl;
  wire[0:0] and_213_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] nor_163_nl;
  wire[0:0] nor_164_nl;
  wire[0:0] nor_165_nl;
  wire[0:0] mux_232_nl;
  wire[0:0] or_352_nl;
  wire[0:0] and_212_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] or_366_nl;
  wire[0:0] nor_162_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] or_545_nl;
  wire[0:0] nand_52_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] or_362_nl;
  wire[0:0] mux_235_nl;
  wire[0:0] nand_53_nl;
  wire[0:0] or_360_nl;
  wire[0:0] nand_54_nl;
  wire[0:0] nor_156_nl;
  wire[0:0] nor_157_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] or_393_nl;
  wire[0:0] nand_33_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] nor_158_nl;
  wire[0:0] and_291_nl;
  wire[0:0] mux_326_nl;
  wire[0:0] mux_325_nl;
  wire[0:0] or_430_nl;
  wire[0:0] nand_98_nl;
  wire[0:0] or_444_nl;
  wire[0:0] mux_352_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] or_445_nl;
  wire[0:0] nor_146_nl;
  wire[0:0] and_199_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] nor_147_nl;
  wire[0:0] nor_148_nl;
  wire[0:0] nor_142_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] or_460_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] nand_82_nl;
  wire[0:0] nor_172_nl;
  wire[2:0] STAGE_LOOP_acc_nl;
  wire[3:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] and_66_nl;
  wire[0:0] mux_111_nl;
  wire[0:0] nor_238_nl;
  wire[0:0] mux_110_nl;
  wire[0:0] or_137_nl;
  wire[0:0] or_135_nl;
  wire[0:0] and_257_nl;
  wire[0:0] mux_109_nl;
  wire[0:0] nor_239_nl;
  wire[0:0] and_70_nl;
  wire[0:0] and_77_nl;
  wire[0:0] and_84_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] nor_231_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] or_154_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] or_153_nl;
  wire[0:0] or_151_nl;
  wire[0:0] mux_117_nl;
  wire[0:0] or_150_nl;
  wire[0:0] or_149_nl;
  wire[0:0] and_256_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] mux_115_nl;
  wire[0:0] nor_232_nl;
  wire[0:0] nor_233_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] nor_234_nl;
  wire[0:0] nor_235_nl;
  wire[0:0] and_254_nl;
  wire[0:0] mux_126_nl;
  wire[0:0] nor_224_nl;
  wire[0:0] and_255_nl;
  wire[0:0] mux_125_nl;
  wire[0:0] nor_225_nl;
  wire[0:0] mux_124_nl;
  wire[0:0] nor_226_nl;
  wire[0:0] nor_227_nl;
  wire[0:0] nor_228_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] or_163_nl;
  wire[0:0] mux_122_nl;
  wire[0:0] or_162_nl;
  wire[0:0] or_160_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] mux_121_nl;
  wire[0:0] nor_229_nl;
  wire[0:0] nor_230_nl;
  wire[0:0] nor_218_nl;
  wire[0:0] mux_133_nl;
  wire[0:0] nand_10_nl;
  wire[0:0] mux_132_nl;
  wire[0:0] nor_219_nl;
  wire[0:0] nor_220_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] or_178_nl;
  wire[0:0] nand_71_nl;
  wire[0:0] and_252_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] mux_129_nl;
  wire[0:0] nor_221_nl;
  wire[0:0] nor_222_nl;
  wire[0:0] mux_128_nl;
  wire[0:0] nor_223_nl;
  wire[0:0] and_253_nl;
  wire[0:0] and_250_nl;
  wire[0:0] mux_140_nl;
  wire[0:0] nor_211_nl;
  wire[0:0] and_251_nl;
  wire[0:0] mux_139_nl;
  wire[0:0] nor_212_nl;
  wire[0:0] mux_138_nl;
  wire[0:0] nor_213_nl;
  wire[0:0] nor_214_nl;
  wire[0:0] nor_215_nl;
  wire[0:0] mux_137_nl;
  wire[0:0] or_190_nl;
  wire[0:0] mux_136_nl;
  wire[0:0] or_189_nl;
  wire[0:0] or_187_nl;
  wire[0:0] nand_11_nl;
  wire[0:0] mux_135_nl;
  wire[0:0] nor_216_nl;
  wire[0:0] nor_217_nl;
  wire[0:0] nor_207_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] or_210_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] or_209_nl;
  wire[0:0] or_207_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] or_206_nl;
  wire[0:0] nand_69_nl;
  wire[0:0] and_248_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] nor_208_nl;
  wire[0:0] nor_209_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] nor_210_nl;
  wire[0:0] and_249_nl;
  wire[0:0] and_246_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] nor_200_nl;
  wire[0:0] and_247_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] nor_201_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] nor_202_nl;
  wire[0:0] nor_203_nl;
  wire[0:0] nor_204_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] or_219_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] or_218_nl;
  wire[0:0] or_216_nl;
  wire[0:0] nand_15_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] nor_205_nl;
  wire[0:0] nor_206_nl;
  wire[0:0] nor_194_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] nand_19_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] nor_195_nl;
  wire[0:0] nor_196_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] or_235_nl;
  wire[0:0] nand_67_nl;
  wire[0:0] and_244_nl;
  wire[0:0] mux_158_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] and_293_nl;
  wire[0:0] nor_198_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] nor_199_nl;
  wire[0:0] and_245_nl;
  wire[0:0] and_241_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] nor_188_nl;
  wire[0:0] and_242_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] nor_189_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] and_294_nl;
  wire[0:0] and_295_nl;
  wire[0:0] nor_192_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] or_247_nl;
  wire[0:0] mux_164_nl;
  wire[0:0] nand_85_nl;
  wire[0:0] nand_66_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] and_243_nl;
  wire[0:0] nor_193_nl;
  wire[0:0] and_nl;
  wire[0:0] mux_411_nl;
  wire[0:0] nor_288_nl;
  wire[0:0] nor_289_nl;
  wire[12:0] acc_nl;
  wire[13:0] nl_acc_nl;
  wire[11:0] COMP_LOOP_mux_22_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nand_1_nl;
  wire[8:0] COMP_LOOP_mux_23_nl;
  wire[3:0] operator_64_false_1_operator_64_false_1_or_1_nl;
  wire[3:0] operator_64_false_1_and_1_nl;
  wire[0:0] not_1275_nl;
  wire[0:0] operator_64_false_1_or_6_nl;
  wire[0:0] operator_64_false_1_mux1h_9_nl;
  wire[0:0] operator_64_false_1_mux1h_10_nl;
  wire[0:0] operator_64_false_1_mux1h_11_nl;
  wire[0:0] operator_64_false_1_mux1h_12_nl;
  wire[0:0] operator_64_false_1_mux1h_13_nl;
  wire[0:0] operator_64_false_1_mux1h_14_nl;
  wire[0:0] operator_64_false_1_mux1h_15_nl;
  wire[0:0] operator_64_false_1_mux1h_16_nl;
  wire[9:0] operator_64_false_1_mux1h_17_nl;
  wire[9:0] COMP_LOOP_acc_34_nl;
  wire[10:0] nl_COMP_LOOP_acc_34_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_or_5_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_nor_4_nl;
  wire[1:0] COMP_LOOP_mux_24_nl;
  wire[0:0] and_417_nl;
  wire[0:0] and_418_nl;
  wire[0:0] and_419_nl;
  wire[0:0] operator_64_false_1_or_7_nl;
  wire[0:0] operator_64_false_1_or_8_nl;
  wire[65:0] acc_3_nl;
  wire[66:0] nl_acc_3_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_6_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_7_nl;
  wire[51:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl;
  wire[51:0] COMP_LOOP_mux_25_nl;
  wire[0:0] COMP_LOOP_or_27_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_nor_6_nl;
  wire[1:0] COMP_LOOP_mux1h_75_nl;
  wire[8:0] COMP_LOOP_mux1h_76_nl;
  wire[0:0] COMP_LOOP_or_28_nl;
  wire[6:0] COMP_LOOP_and_17_nl;
  wire[6:0] COMP_LOOP_COMP_LOOP_mux_2_nl;
  wire[0:0] COMP_LOOP_not_101_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_8_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_9_nl;
  wire[63:0] modExp_while_if_mux1h_2_nl;
  wire[0:0] and_420_nl;
  wire[0:0] mux_436_nl;
  wire[0:0] nor_322_nl;
  wire[0:0] mux_437_nl;
  wire[0:0] or_632_nl;
  wire[0:0] nand_105_nl;
  wire[0:0] mux_438_nl;
  wire[0:0] nor_323_nl;
  wire[0:0] nor_324_nl;
  wire[0:0] mux_439_nl;
  wire[0:0] nor_325_nl;
  wire[0:0] mux_440_nl;
  wire[0:0] or_633_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] mux_442_nl;
  wire[0:0] nor_326_nl;
  wire[0:0] mux_443_nl;
  wire[0:0] or_634_nl;
  wire[0:0] or_635_nl;
  wire[0:0] nor_327_nl;
  wire[0:0] nor_328_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] or_636_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [10:0] nl_operator_66_true_div_cmp_b;
  assign nl_operator_66_true_div_cmp_b = {1'b0, operator_66_true_div_cmp_b_9_0};
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0 = ~ (z_out_3[64]);
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 = ~ modExp_exp_1_0_1_sva;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_66_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_66_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_132_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_132_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_198_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_198_tr0 = ~ modExp_exp_1_0_1_sva;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = z_out_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 = ~ STAGE_LOOP_acc_itm_2_1;
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
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_3_obj (
      .ld(reg_vec_rsc_triosy_0_3_obj_ld_cse),
      .lz(vec_rsc_triosy_0_3_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_2_obj (
      .ld(reg_vec_rsc_triosy_0_3_obj_ld_cse),
      .lz(vec_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_1_obj (
      .ld(reg_vec_rsc_triosy_0_3_obj_ld_cse),
      .lz(vec_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_3_obj_ld_cse),
      .lz(vec_rsc_triosy_0_0_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_3_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_3_obj_ld_cse),
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
      .STAGE_LOOP_C_9_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0[0:0]),
      .modExp_while_C_40_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .COMP_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0[0:0]),
      .COMP_LOOP_1_modExp_1_while_C_40_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .COMP_LOOP_C_66_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_66_tr0[0:0]),
      .COMP_LOOP_2_modExp_1_while_C_40_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0[0:0]),
      .COMP_LOOP_C_132_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_132_tr0[0:0]),
      .COMP_LOOP_3_modExp_1_while_C_40_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0[0:0]),
      .COMP_LOOP_C_198_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_198_tr0[0:0]),
      .COMP_LOOP_4_modExp_1_while_C_40_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0[0:0]),
      .COMP_LOOP_C_264_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_10_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0[0:0])
    );
  assign nor_43_cse = ~((fsm_output[3]) | (~ (fsm_output[5])));
  assign or_278_cse = (fsm_output[1:0]!=2'b00);
  assign or_574_cse = (fsm_output[3:2]!=2'b00);
  assign and_192_cse = (fsm_output[1:0]==2'b11);
  assign and_190_cse = (fsm_output[4:3]==2'b11);
  assign nl_COMP_LOOP_1_acc_8_nl = operator_64_false_acc_mut_63_0 - modulo_result_mux_cse;
  assign COMP_LOOP_1_acc_8_nl = nl_COMP_LOOP_1_acc_8_nl[63:0];
  assign nor_138_nl = ~((fsm_output[6]) | (VEC_LOOP_j_sva_11_0[1:0]!=2'b00) | (fsm_output[1:0]!=2'b01)
      | not_tmp_253);
  assign nor_139_nl = ~((fsm_output[6]) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b00)
      | (fsm_output[0]) | (fsm_output[1]) | (fsm_output[2]) | (fsm_output[4]));
  assign mux_364_nl = MUX_s_1_2_2(nor_138_nl, nor_139_nl, fsm_output[7]);
  assign nor_140_nl = ~((fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b00) |
      (~ (fsm_output[6])) | (fsm_output[0]) | not_tmp_252);
  assign mux_365_nl = MUX_s_1_2_2(mux_364_nl, nor_140_nl, fsm_output[8]);
  assign COMP_LOOP_or_6_nl = (mux_365_nl & and_dcpl_155) | ((~((VEC_LOOP_j_sva_11_0[0])
      | (COMP_LOOP_acc_11_psp_sva[0]))) & and_181_m1c);
  assign nor_135_nl = ~((fsm_output[6]) | (VEC_LOOP_j_sva_11_0[1:0]!=2'b01) | (fsm_output[1:0]!=2'b01)
      | not_tmp_253);
  assign nor_136_nl = ~((fsm_output[6]) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b01)
      | (fsm_output[0]) | (fsm_output[1]) | (fsm_output[2]) | (fsm_output[4]));
  assign mux_366_nl = MUX_s_1_2_2(nor_135_nl, nor_136_nl, fsm_output[7]);
  assign nor_137_nl = ~((fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b01) |
      (~ (fsm_output[6])) | (fsm_output[0]) | not_tmp_252);
  assign mux_367_nl = MUX_s_1_2_2(mux_366_nl, nor_137_nl, fsm_output[8]);
  assign COMP_LOOP_or_7_nl = (mux_367_nl & and_dcpl_155) | ((VEC_LOOP_j_sva_11_0[0])
      & (~ (COMP_LOOP_acc_11_psp_sva[0])) & and_181_m1c);
  assign nor_132_nl = ~((fsm_output[6]) | (VEC_LOOP_j_sva_11_0[1:0]!=2'b10) | (fsm_output[1:0]!=2'b01)
      | not_tmp_253);
  assign nor_133_nl = ~((fsm_output[6]) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b10)
      | (fsm_output[0]) | (fsm_output[1]) | (fsm_output[2]) | (fsm_output[4]));
  assign mux_368_nl = MUX_s_1_2_2(nor_132_nl, nor_133_nl, fsm_output[7]);
  assign nor_134_nl = ~((fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b10) |
      (~ (fsm_output[6])) | (fsm_output[0]) | not_tmp_252);
  assign mux_369_nl = MUX_s_1_2_2(mux_368_nl, nor_134_nl, fsm_output[8]);
  assign COMP_LOOP_or_8_nl = (mux_369_nl & and_dcpl_155) | ((COMP_LOOP_acc_11_psp_sva[0])
      & (~ (VEC_LOOP_j_sva_11_0[0])) & and_181_m1c);
  assign nor_129_nl = ~((fsm_output[6]) | (VEC_LOOP_j_sva_11_0[1:0]!=2'b11) | (fsm_output[1:0]!=2'b01)
      | not_tmp_253);
  assign nor_130_nl = ~((fsm_output[6]) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b11)
      | (fsm_output[0]) | (fsm_output[1]) | (fsm_output[2]) | (fsm_output[4]));
  assign mux_370_nl = MUX_s_1_2_2(nor_129_nl, nor_130_nl, fsm_output[7]);
  assign nor_131_nl = ~((fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b11) |
      (~ (fsm_output[6])) | (fsm_output[0]) | not_tmp_252);
  assign mux_371_nl = MUX_s_1_2_2(mux_370_nl, nor_131_nl, fsm_output[8]);
  assign COMP_LOOP_or_9_nl = (mux_371_nl & and_dcpl_155) | ((VEC_LOOP_j_sva_11_0[0])
      & (COMP_LOOP_acc_11_psp_sva[0]) & and_181_m1c);
  assign COMP_LOOP_mux1h_40_nl = MUX1HOT_v_64_5_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d,
      vec_rsc_0_2_i_qa_d, vec_rsc_0_3_i_qa_d, COMP_LOOP_1_acc_8_nl, {COMP_LOOP_or_6_nl
      , COMP_LOOP_or_7_nl , COMP_LOOP_or_8_nl , COMP_LOOP_or_9_nl , not_tmp_144});
  assign and_127_nl = and_dcpl_111 & and_dcpl_27;
  assign or_323_nl = (fsm_output[6:5]!=2'b00) | (~ and_dcpl_49);
  assign mux_215_nl = MUX_s_1_2_2(or_tmp_291, or_323_nl, fsm_output[7]);
  assign or_320_nl = (fsm_output[4:2]!=3'b010);
  assign or_319_nl = (fsm_output[4:2]!=3'b001);
  assign mux_212_nl = MUX_s_1_2_2(or_320_nl, or_319_nl, and_192_cse);
  assign or_576_nl = (fsm_output[5]) | mux_212_nl;
  assign or_316_nl = (fsm_output[4:2]!=3'b100);
  assign mux_211_nl = MUX_s_1_2_2(or_tmp_285, or_316_nl, fsm_output[1]);
  assign nand_91_nl = ~((fsm_output[5]) & (~ mux_211_nl));
  assign mux_213_nl = MUX_s_1_2_2(or_576_nl, nand_91_nl, fsm_output[6]);
  assign nand_92_nl = ~((fsm_output[6]) & ((fsm_output[5]) | (or_278_cse & (fsm_output[4:2]==3'b111))));
  assign mux_214_nl = MUX_s_1_2_2(mux_213_nl, nand_92_nl, fsm_output[7]);
  assign mux_216_nl = MUX_s_1_2_2(mux_215_nl, mux_214_nl, fsm_output[8]);
  assign operator_64_false_mux1h_1_rgt = MUX1HOT_v_65_3_2(operator_64_false_acc_mut_mx0w0,
      ({2'b00 , operator_64_false_slc_modExp_exp_63_1_3}), ({1'b0 , COMP_LOOP_mux1h_40_nl}),
      {and_127_nl , and_dcpl_116 , mux_216_nl});
  assign or_607_cse = (~ (fsm_output[8])) | (fsm_output[6]);
  assign nand_cse = ~((fsm_output[7]) & (fsm_output[8]) & (fsm_output[1]));
  assign or_71_cse = (fsm_output[6:5]!=2'b00);
  assign and_137_m1c = and_dcpl_50 & and_dcpl_27;
  assign modExp_result_and_rgt = (~ modExp_while_and_5) & and_137_m1c;
  assign modExp_result_and_1_rgt = modExp_while_and_5 & and_137_m1c;
  assign or_376_cse = (fsm_output[8:6]!=3'b110);
  assign modulo_result_mux_cse = MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w8,
      modulo_result_rem_cmp_z[63]);
  assign nor_161_cse = ~((fsm_output[1:0]!=2'b00));
  assign or_107_cse = (fsm_output[8:6]!=3'b011);
  assign mux_249_cse = MUX_s_1_2_2(or_607_cse, or_tmp_32, fsm_output[7]);
  assign nor_169_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[0])) | (fsm_output[2])
      | (fsm_output[3]));
  assign nor_170_nl = ~((fsm_output[5]) | (fsm_output[0]) | (~ and_284_cse));
  assign mux_228_nl = MUX_s_1_2_2(nor_169_nl, nor_170_nl, fsm_output[6]);
  assign and_144_m1c = mux_228_nl & (fsm_output[4]) & (fsm_output[1]) & and_dcpl_25;
  assign or_57_cse = (fsm_output[2:1]!=2'b00);
  assign and_203_cse = (fsm_output[2]) & (fsm_output[4]);
  assign nor_149_cse = ~((fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[0])
      | (fsm_output[7]));
  assign nor_143_cse = ~((fsm_output[4]) | (~ (fsm_output[6])) | (fsm_output[8])
      | (fsm_output[1]) | (~ (fsm_output[0])) | (~ (fsm_output[3])) | (fsm_output[5])
      | (~ (fsm_output[7])));
  assign COMP_LOOP_or_2_cse = and_dcpl_51 | and_dcpl_63 | and_dcpl_72 | and_dcpl_77;
  assign or_540_cse = (fsm_output[2:0]!=3'b000);
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_COMP_LOOP_acc_psp_sva_1 = (VEC_LOOP_j_sva_11_0[11:2]) + conv_u2u_7_10(COMP_LOOP_k_9_2_sva_6_0);
  assign COMP_LOOP_acc_psp_sva_1 = nl_COMP_LOOP_acc_psp_sva_1[9:0];
  assign nl_COMP_LOOP_1_acc_5_mut_mx0w7 = operator_64_false_acc_mut_63_0 + modulo_result_mux_cse;
  assign COMP_LOOP_1_acc_5_mut_mx0w7 = nl_COMP_LOOP_1_acc_5_mut_mx0w7[63:0];
  assign nl_operator_64_false_acc_mut_mx0w0 = conv_u2s_64_65(p_sva) + 65'b11111111111111111111111111111111111111111111111111111111111111111;
  assign operator_64_false_acc_mut_mx0w0 = nl_operator_64_false_acc_mut_mx0w0[64:0];
  assign operator_64_false_slc_modExp_exp_63_1_3 = MUX_v_63_2_2((operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm[63:1]),
      (COMP_LOOP_1_acc_5_mut[63:1]), and_dcpl_122);
  assign nl_modulo_qr_sva_1_mx0w8 = modulo_result_rem_cmp_z + p_sva;
  assign modulo_qr_sva_1_mx0w8 = nl_modulo_qr_sva_1_mx0w8[63:0];
  assign or_52_cse = (fsm_output[8:6]!=3'b100);
  assign modExp_while_and_3 = (~ (modulo_result_rem_cmp_z[63])) & modExp_exp_1_0_1_sva;
  assign modExp_while_and_5 = (modulo_result_rem_cmp_z[63]) & modExp_exp_1_0_1_sva;
  assign or_tmp_2 = (fsm_output[8:7]!=2'b00);
  assign or_tmp_7 = (fsm_output[8:7]!=2'b01);
  assign nor_tmp_4 = (fsm_output[8:7]==2'b11);
  assign and_284_cse = (fsm_output[3:2]==2'b11);
  assign and_285_cse = (fsm_output[5]) & (((fsm_output[2:0]==3'b111)) | (fsm_output[3]))
      & (fsm_output[4]);
  assign or_tmp_32 = (fsm_output[8]) | (fsm_output[6]);
  assign or_tmp_43 = (fsm_output[8:7]!=2'b10);
  assign mux_tmp_55 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[8]);
  assign and_dcpl_2 = (fsm_output[6:5]==2'b11);
  assign and_tmp_6 = (fsm_output[7:5]==3'b111) & ((fsm_output[4:1]!=4'b0000));
  assign or_123_cse = and_192_cse | (fsm_output[4:2]!=3'b000);
  assign or_560_nl = (fsm_output[7:0]!=8'b00000000);
  assign nand_74_nl = ~((fsm_output[7:5]==3'b111) & or_123_cse);
  assign not_tmp_73 = MUX_s_1_2_2(or_560_nl, nand_74_nl, fsm_output[8]);
  assign and_dcpl_25 = ~((fsm_output[8:7]!=2'b00));
  assign and_dcpl_26 = ~((fsm_output[6:5]!=2'b00));
  assign and_dcpl_27 = and_dcpl_26 & and_dcpl_25;
  assign and_dcpl_29 = ~((fsm_output[4:3]!=2'b00));
  assign and_dcpl_30 = and_dcpl_29 & (~ (fsm_output[2]));
  assign and_dcpl_31 = and_dcpl_30 & nor_161_cse;
  assign and_dcpl_35 = and_dcpl_2 & nor_tmp_4;
  assign and_dcpl_36 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_37 = and_dcpl_30 & and_dcpl_36;
  assign and_dcpl_39 = (fsm_output[6:5]==2'b01);
  assign and_dcpl_40 = and_dcpl_39 & and_dcpl_25;
  assign and_dcpl_41 = (fsm_output[4:3]==2'b10);
  assign and_dcpl_42 = and_dcpl_41 & (fsm_output[2]);
  assign and_dcpl_44 = and_dcpl_42 & nor_161_cse & and_dcpl_40;
  assign and_dcpl_45 = (fsm_output[6:5]==2'b10);
  assign and_dcpl_46 = and_dcpl_45 & and_dcpl_25;
  assign and_dcpl_49 = and_190_cse & (fsm_output[2]);
  assign and_dcpl_50 = and_dcpl_49 & and_192_cse;
  assign and_dcpl_51 = and_dcpl_50 & and_dcpl_46;
  assign and_dcpl_52 = (fsm_output[8:7]==2'b01);
  assign and_dcpl_55 = (fsm_output[4:2]==3'b010);
  assign and_dcpl_56 = and_dcpl_55 & and_dcpl_36;
  assign nor_tmp_40 = (fsm_output[8]) & (fsm_output[2]) & (fsm_output[4]) & (fsm_output[6]);
  assign nor_236_nl = ~((fsm_output[5]) | (~((fsm_output[1]) & (fsm_output[3]))));
  assign nor_237_nl = ~((~ (fsm_output[5])) | (fsm_output[1]) | (fsm_output[3]));
  assign not_tmp_90 = MUX_s_1_2_2(nor_236_nl, nor_237_nl, fsm_output[6]);
  assign and_dcpl_62 = and_dcpl_45 & and_dcpl_52;
  assign and_dcpl_63 = and_dcpl_56 & and_dcpl_62;
  assign and_dcpl_64 = (fsm_output[8:7]==2'b10);
  assign and_dcpl_70 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_71 = and_dcpl_42 & and_dcpl_70;
  assign and_dcpl_72 = and_dcpl_71 & and_dcpl_39 & and_dcpl_64;
  assign or_tmp_111 = (fsm_output[5:1]!=5'b00101);
  assign or_tmp_113 = (fsm_output[5:1]!=5'b11010);
  assign and_dcpl_76 = and_dcpl_39 & nor_tmp_4;
  assign and_dcpl_77 = and_dcpl_31 & and_dcpl_76;
  assign and_dcpl_82 = and_dcpl_55 & and_192_cse;
  assign and_dcpl_83 = and_dcpl_82 & and_dcpl_27;
  assign mux_tmp_170 = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), and_284_cse);
  assign not_tmp_130 = ~(and_284_cse | (fsm_output[4]));
  assign mux_tmp_171 = MUX_s_1_2_2(not_tmp_130, mux_tmp_170, and_192_cse);
  assign and_dcpl_85 = ~((fsm_output[7:6]!=2'b00));
  assign nor_tmp_57 = (and_192_cse | (fsm_output[3:2]!=2'b00)) & (fsm_output[4]);
  assign mux_tmp_172 = MUX_s_1_2_2((~ and_dcpl_50), nor_tmp_57, fsm_output[5]);
  assign or_tmp_230 = (fsm_output[7]) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (~ (fsm_output[1])) | (fsm_output[6]);
  assign or_266_nl = (fsm_output[5]) | (or_57_cse & (fsm_output[3])) | (fsm_output[4]);
  assign mux_tmp_177 = MUX_s_1_2_2((~ and_285_cse), or_266_nl, fsm_output[6]);
  assign mux_tmp_178 = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[3]);
  assign mux_tmp_179 = MUX_s_1_2_2(and_dcpl_29, mux_tmp_178, fsm_output[2]);
  assign mux_tmp_180 = MUX_s_1_2_2(not_tmp_130, mux_tmp_179, fsm_output[1]);
  assign nor_tmp_61 = or_574_cse & (fsm_output[4]);
  assign mux_tmp_181 = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), or_574_cse);
  assign mux_tmp_183 = MUX_s_1_2_2(mux_tmp_178, and_190_cse, fsm_output[2]);
  assign mux_tmp_184 = MUX_s_1_2_2(mux_tmp_183, nor_tmp_61, fsm_output[1]);
  assign mux_182_nl = MUX_s_1_2_2(mux_tmp_181, nor_tmp_61, fsm_output[1]);
  assign mux_185_itm = MUX_s_1_2_2(mux_tmp_184, mux_182_nl, fsm_output[0]);
  assign nor_183_nl = ~((fsm_output[4]) | (~ (fsm_output[6])) | (fsm_output[0]) |
      (~ (fsm_output[7])));
  assign and_231_nl = (fsm_output[4]) & (fsm_output[6]) & (fsm_output[0]) & (~ (fsm_output[7]));
  assign mux_187_nl = MUX_s_1_2_2(nor_183_nl, and_231_nl, fsm_output[2]);
  assign and_230_nl = (~((fsm_output[8]) | (fsm_output[3]) | (~ (fsm_output[5]))))
      & mux_187_nl;
  assign nor_184_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (fsm_output[6]) | (fsm_output[0]) | (~ (fsm_output[7])));
  assign nor_185_nl = ~((fsm_output[5]) | (fsm_output[2]) | (fsm_output[4]) | (~
      (fsm_output[6])) | (~ (fsm_output[0])) | (fsm_output[7]));
  assign mux_186_nl = MUX_s_1_2_2(nor_184_nl, nor_185_nl, fsm_output[3]);
  assign and_232_nl = (fsm_output[8]) & mux_186_nl;
  assign not_tmp_144 = MUX_s_1_2_2(and_230_nl, and_232_nl, fsm_output[1]);
  assign or_tmp_251 = (fsm_output[5]) | (or_540_cse & (fsm_output[3])) | (fsm_output[4]);
  assign or_tmp_255 = (fsm_output[5:3]!=3'b000);
  assign or_293_nl = (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[0]))
      | (fsm_output[3]) | (~ (fsm_output[5]));
  assign or_291_nl = (fsm_output[7]) | (~ (fsm_output[8])) | (fsm_output[0]) | (~
      (fsm_output[3])) | (fsm_output[5]);
  assign mux_199_nl = MUX_s_1_2_2(or_293_nl, or_291_nl, fsm_output[2]);
  assign nor_180_nl = ~((fsm_output[4]) | (fsm_output[6]) | mux_199_nl);
  assign and_292_nl = (fsm_output[4]) & (fsm_output[6]) & (fsm_output[2]) & (~ (fsm_output[7]))
      & (fsm_output[8]) & (fsm_output[0]) & (~ (fsm_output[3])) & (fsm_output[5]);
  assign not_tmp_152 = MUX_s_1_2_2(nor_180_nl, and_292_nl, fsm_output[1]);
  assign nor_tmp_68 = ((or_278_cse & (fsm_output[2])) | (fsm_output[3])) & (fsm_output[4]);
  assign and_tmp_13 = (fsm_output[5]) & nor_tmp_68;
  assign or_dcpl_31 = (and_284_cse & or_278_cse) | (fsm_output[4]);
  assign and_dcpl_98 = and_dcpl_26 & and_dcpl_64;
  assign and_dcpl_100 = and_dcpl_85 & (fsm_output[8]);
  assign or_tmp_268 = ((and_192_cse | (fsm_output[2])) & (fsm_output[3])) | (fsm_output[4]);
  assign or_tmp_269 = (fsm_output[5]) | or_tmp_268;
  assign mux_204_itm = MUX_s_1_2_2(not_tmp_130, mux_tmp_179, and_192_cse);
  assign mux_207_nl = MUX_s_1_2_2((fsm_output[3]), (~ (fsm_output[3])), or_57_cse);
  assign nor_nl = ~((~((fsm_output[2:1]!=2'b00))) | (fsm_output[3]));
  assign mux_208_nl = MUX_s_1_2_2(mux_207_nl, nor_nl, fsm_output[0]);
  assign and_dcpl_110 = mux_208_nl & (~ (fsm_output[4])) & and_dcpl_27;
  assign and_dcpl_111 = and_dcpl_30 & and_dcpl_70;
  assign nor_175_nl = ~((fsm_output[0]) | (~ (fsm_output[3])) | (fsm_output[4]));
  assign nor_176_nl = ~((~ (fsm_output[0])) | (fsm_output[3]) | (~ (fsm_output[4])));
  assign mux_210_nl = MUX_s_1_2_2(nor_175_nl, nor_176_nl, fsm_output[5]);
  assign and_dcpl_116 = mux_210_nl & (~ (fsm_output[2])) & (fsm_output[1]) & (~ (fsm_output[6]))
      & and_dcpl_25;
  assign or_tmp_285 = (fsm_output[4:2]!=3'b101);
  assign or_tmp_291 = (fsm_output[6]) | and_tmp_13;
  assign and_dcpl_122 = and_dcpl_41 & (~ (fsm_output[2])) & and_192_cse & and_dcpl_40;
  assign nand_57_cse = ~((fsm_output[1]) & (fsm_output[8]));
  assign and_216_nl = (fsm_output[6]) & (fsm_output[1]) & (fsm_output[8]);
  assign nor_166_nl = ~((fsm_output[6]) | (fsm_output[1]) | (fsm_output[8]));
  assign mux_229_nl = MUX_s_1_2_2(and_216_nl, nor_166_nl, fsm_output[0]);
  assign and_215_nl = (fsm_output[2]) & (fsm_output[4]) & mux_229_nl;
  assign nor_167_nl = ~((fsm_output[2]) | (fsm_output[4]) | (fsm_output[0]) | (fsm_output[6])
      | (fsm_output[1]) | (fsm_output[8]));
  assign mux_230_nl = MUX_s_1_2_2(and_215_nl, nor_167_nl, fsm_output[7]);
  assign and_214_nl = (fsm_output[5]) & mux_230_nl;
  assign nor_168_nl = ~((fsm_output[5]) | (fsm_output[7]) | (fsm_output[2]) | (fsm_output[4])
      | (~ (fsm_output[0])) | (fsm_output[6]) | nand_57_cse);
  assign not_tmp_185 = MUX_s_1_2_2(and_214_nl, nor_168_nl, fsm_output[3]);
  assign nand_56_cse = ~((fsm_output[0]) & (fsm_output[7]));
  assign or_353_cse = (fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[0]) | (fsm_output[7]);
  assign nor_163_nl = ~((fsm_output[4]) | (fsm_output[1]) | (fsm_output[3]) | (~((fsm_output[5])
      & (fsm_output[0]) & (fsm_output[7]))));
  assign nor_164_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[1])) | (fsm_output[3])
      | (~ (fsm_output[5])) | (fsm_output[0]) | (fsm_output[7]));
  assign mux_233_nl = MUX_s_1_2_2(nor_163_nl, nor_164_nl, fsm_output[2]);
  assign and_213_nl = (fsm_output[8]) & mux_233_nl;
  assign or_352_nl = (~ (fsm_output[3])) | (fsm_output[5]) | nand_56_cse;
  assign mux_232_nl = MUX_s_1_2_2(or_353_cse, or_352_nl, fsm_output[1]);
  assign nor_165_nl = ~((fsm_output[8]) | (fsm_output[2]) | (fsm_output[4]) | mux_232_nl);
  assign not_tmp_191 = MUX_s_1_2_2(and_213_nl, nor_165_nl, fsm_output[6]);
  assign or_tmp_330 = (fsm_output[4]) | (fsm_output[2]) | (fsm_output[1]) | (~ (fsm_output[8]))
      | (fsm_output[7]);
  assign or_tmp_334 = (~ (fsm_output[4])) | (~ (fsm_output[2])) | (fsm_output[1])
      | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_242_nl = MUX_s_1_2_2(or_tmp_330, or_tmp_334, fsm_output[6]);
  assign or_366_nl = (~ (fsm_output[4])) | (fsm_output[2]) | (~ (fsm_output[1]))
      | (~ (fsm_output[8])) | (fsm_output[7]);
  assign mux_241_nl = MUX_s_1_2_2(or_tmp_334, or_366_nl, fsm_output[6]);
  assign mux_243_nl = MUX_s_1_2_2(mux_242_nl, mux_241_nl, fsm_output[0]);
  assign and_212_nl = (fsm_output[5]) & (~ mux_243_nl);
  assign or_545_nl = (fsm_output[2]) | nand_cse;
  assign nand_52_nl = ~((fsm_output[2]) & (fsm_output[1]) & (fsm_output[8]) & (fsm_output[7]));
  assign mux_238_nl = MUX_s_1_2_2(or_545_nl, nand_52_nl, fsm_output[4]);
  assign mux_239_nl = MUX_s_1_2_2(or_tmp_330, mux_238_nl, fsm_output[6]);
  assign nand_53_nl = ~((fsm_output[8:7]==2'b11));
  assign mux_235_nl = MUX_s_1_2_2(or_tmp_7, nand_53_nl, fsm_output[1]);
  assign or_362_nl = (fsm_output[2]) | mux_235_nl;
  assign or_360_nl = (~ (fsm_output[2])) | (fsm_output[1]) | (fsm_output[8]) | (~
      (fsm_output[7]));
  assign mux_236_nl = MUX_s_1_2_2(or_362_nl, or_360_nl, fsm_output[4]);
  assign nand_54_nl = ~((fsm_output[4]) & (fsm_output[2]) & (fsm_output[1]) & (fsm_output[8])
      & (~ (fsm_output[7])));
  assign mux_237_nl = MUX_s_1_2_2(mux_236_nl, nand_54_nl, fsm_output[6]);
  assign mux_240_nl = MUX_s_1_2_2(mux_239_nl, mux_237_nl, fsm_output[0]);
  assign nor_162_nl = ~((fsm_output[5]) | mux_240_nl);
  assign not_tmp_201 = MUX_s_1_2_2(and_212_nl, nor_162_nl, fsm_output[3]);
  assign mux_tmp_257 = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[7]);
  assign nor_tmp_87 = (fsm_output[7:6]==2'b11);
  assign mux_tmp_258 = MUX_s_1_2_2(nor_tmp_87, mux_tmp_257, fsm_output[8]);
  assign or_tmp_349 = (fsm_output[7:6]!=2'b00);
  assign or_tmp_351 = (fsm_output[7:6]!=2'b10);
  assign mux_tmp_265 = MUX_s_1_2_2((fsm_output[7]), nor_tmp_87, fsm_output[8]);
  assign or_tmp_353 = (fsm_output[7:6]!=2'b01);
  assign mux_tmp_268 = MUX_s_1_2_2((~ or_tmp_353), or_tmp_349, fsm_output[8]);
  assign mux_269_itm = MUX_s_1_2_2(or_tmp_349, (fsm_output[7]), fsm_output[8]);
  assign nor_156_nl = ~((~ (fsm_output[5])) | (fsm_output[0]) | (fsm_output[7]) |
      (fsm_output[1]) | (~ (fsm_output[2])) | (~ (fsm_output[4])) | (fsm_output[6])
      | (~ (fsm_output[8])));
  assign or_393_nl = (fsm_output[7]) | (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[4])
      | (~ (fsm_output[6])) | (fsm_output[8]);
  assign nor_158_nl = ~((fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[6])) |
      (fsm_output[8]));
  assign and_291_nl = (fsm_output[2]) & (fsm_output[4]) & (~ (fsm_output[6])) & (fsm_output[8]);
  assign mux_290_nl = MUX_s_1_2_2(nor_158_nl, and_291_nl, fsm_output[1]);
  assign nand_33_nl = ~((fsm_output[7]) & mux_290_nl);
  assign mux_291_nl = MUX_s_1_2_2(or_393_nl, nand_33_nl, fsm_output[0]);
  assign nor_157_nl = ~((fsm_output[5]) | mux_291_nl);
  assign not_tmp_215 = MUX_s_1_2_2(nor_156_nl, nor_157_nl, fsm_output[3]);
  assign and_dcpl_145 = and_dcpl_42 & and_dcpl_36 & and_dcpl_40;
  assign or_dcpl_40 = (fsm_output[4:2]!=3'b011) | or_278_cse;
  assign or_dcpl_42 = (fsm_output[6:5]!=2'b01);
  assign or_dcpl_43 = or_dcpl_42 | or_tmp_2;
  assign not_tmp_227 = ~((fsm_output[7:6]!=2'b00) | and_tmp_13);
  assign mux_325_nl = MUX_s_1_2_2(not_tmp_130, nor_tmp_61, fsm_output[5]);
  assign mux_326_nl = MUX_s_1_2_2(mux_325_nl, (~ and_285_cse), fsm_output[6]);
  assign or_430_nl = (fsm_output[6:5]!=2'b00) | and_dcpl_50;
  assign mux_tmp_327 = MUX_s_1_2_2(mux_326_nl, or_430_nl, fsm_output[7]);
  assign nand_98_nl = ~((fsm_output[5]) & ((fsm_output[4:0]!=5'b00000)));
  assign mux_tmp_328 = MUX_s_1_2_2(nand_98_nl, or_tmp_251, fsm_output[6]);
  assign mux_tmp_335 = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[8]);
  assign or_444_nl = (fsm_output[8]) | (~ (fsm_output[6]));
  assign mux_tmp_345 = MUX_s_1_2_2(or_444_nl, mux_tmp_335, fsm_output[7]);
  assign and_dcpl_152 = and_dcpl_71 & and_dcpl_40;
  assign or_445_nl = (fsm_output[5]) | and_dcpl_50;
  assign mux_351_nl = MUX_s_1_2_2((~ and_285_cse), or_445_nl, fsm_output[6]);
  assign mux_352_nl = MUX_s_1_2_2(mux_351_nl, mux_tmp_328, fsm_output[7]);
  assign mux_353_itm = MUX_s_1_2_2(mux_352_nl, mux_tmp_327, fsm_output[8]);
  assign nor_263_cse = ~((fsm_output[8:7]!=2'b10));
  assign nor_146_nl = ~((~ (fsm_output[7])) | (fsm_output[8]) | (fsm_output[2]) |
      (fsm_output[4]) | (fsm_output[6]) | (fsm_output[0]) | (fsm_output[3]) | (~
      (fsm_output[5])));
  assign nor_147_nl = ~((fsm_output[4]) | (fsm_output[6]) | (~ (fsm_output[0])) |
      (~ (fsm_output[3])) | (fsm_output[5]));
  assign nor_148_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[6])) | (fsm_output[0])
      | (fsm_output[3]) | (~ (fsm_output[5])));
  assign mux_354_nl = MUX_s_1_2_2(nor_147_nl, nor_148_nl, fsm_output[2]);
  assign and_199_nl = nor_263_cse & mux_354_nl;
  assign not_tmp_245 = MUX_s_1_2_2(nor_146_nl, and_199_nl, fsm_output[1]);
  assign or_460_nl = (~ (fsm_output[8])) | (fsm_output[0]) | (fsm_output[3]) | (~
      (fsm_output[5])) | (fsm_output[7]);
  assign nand_82_nl = ~((fsm_output[0]) & (fsm_output[3]) & (~ (fsm_output[5])) &
      (fsm_output[7]));
  assign mux_358_nl = MUX_s_1_2_2(or_353_cse, nand_82_nl, fsm_output[8]);
  assign mux_359_nl = MUX_s_1_2_2(or_460_nl, mux_358_nl, fsm_output[1]);
  assign nor_142_nl = ~((~ (fsm_output[4])) | (fsm_output[6]) | mux_359_nl);
  assign not_tmp_250 = MUX_s_1_2_2(nor_143_cse, nor_142_nl, fsm_output[2]);
  assign nor_tmp_104 = (fsm_output[4:1]==4'b1111);
  assign and_dcpl_155 = (~ (fsm_output[3])) & (fsm_output[5]);
  assign not_tmp_252 = ~((fsm_output[1]) & (fsm_output[2]) & (fsm_output[4]));
  assign not_tmp_253 = ~((fsm_output[2]) & (fsm_output[4]));
  assign or_dcpl_47 = or_tmp_285 | (fsm_output[1:0]!=2'b11);
  assign or_dcpl_49 = ~((fsm_output[6:5]==2'b11));
  assign or_dcpl_52 = (fsm_output[4:2]!=3'b000);
  assign or_dcpl_53 = or_dcpl_52 | (fsm_output[1:0]!=2'b01);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_37 & and_dcpl_35;
  assign VEC_LOOP_j_sva_11_0_mx0c1 = and_dcpl_111 & and_dcpl_35;
  assign nor_172_nl = ~((fsm_output[7:5]!=3'b000) | or_tmp_268);
  assign modExp_result_sva_mx0c0 = MUX_s_1_2_2(nor_172_nl, and_tmp_6, fsm_output[8]);
  assign or_384_cse = (~ (fsm_output[0])) | (fsm_output[7]) | (fsm_output[6]);
  assign nl_STAGE_LOOP_acc_nl = (STAGE_LOOP_i_3_0_sva_2[3:1]) + 3'b011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[2:0];
  assign STAGE_LOOP_acc_itm_2_1 = readslicef_3_1_2(STAGE_LOOP_acc_nl);
  assign and_181_m1c = and_dcpl_82 & and_dcpl_98;
  assign and_66_nl = and_dcpl_56 & and_dcpl_26 & and_dcpl_52;
  assign or_137_nl = (~ (fsm_output[5])) | (fsm_output[0]) | (~ nor_tmp_40);
  assign or_135_nl = (fsm_output[5]) | (~ (fsm_output[0])) | (~ (fsm_output[8]))
      | (fsm_output[2]) | (fsm_output[4]) | (fsm_output[6]);
  assign mux_110_nl = MUX_s_1_2_2(or_137_nl, or_135_nl, fsm_output[3]);
  assign nor_238_nl = ~((fsm_output[7]) | mux_110_nl);
  assign nor_239_nl = ~((fsm_output[8]) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (fsm_output[6]));
  assign mux_109_nl = MUX_s_1_2_2(nor_239_nl, nor_tmp_40, fsm_output[0]);
  assign and_257_nl = (fsm_output[7]) & (fsm_output[3]) & (~ (fsm_output[5])) & mux_109_nl;
  assign mux_111_nl = MUX_s_1_2_2(nor_238_nl, and_257_nl, fsm_output[1]);
  assign and_70_nl = not_tmp_90 & (fsm_output[4]) & (fsm_output[2]) & (fsm_output[0])
      & and_dcpl_52;
  assign and_77_nl = not_tmp_90 & (~ (fsm_output[4])) & (~ (fsm_output[2])) & (~
      (fsm_output[0])) & and_dcpl_64;
  assign mux_113_nl = MUX_s_1_2_2(or_tmp_113, or_tmp_111, fsm_output[7]);
  assign and_84_nl = (~ mux_113_nl) & (fsm_output[0]) & (fsm_output[6]) & (fsm_output[8]);
  assign vec_rsc_0_0_i_adra_d_pff = MUX1HOT_v_10_7_2(COMP_LOOP_acc_psp_sva_1, (z_out_1[12:3]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva[11:2]), (COMP_LOOP_acc_1_cse_2_sva[11:2]),
      (COMP_LOOP_acc_11_psp_sva[10:1]), (COMP_LOOP_acc_1_cse_sva[11:2]), {and_dcpl_44
      , COMP_LOOP_or_2_cse , and_66_nl , mux_111_nl , and_70_nl , and_77_nl , and_84_nl});
  assign vec_rsc_0_0_i_da_d_pff = modExp_base_1_sva;
  assign or_153_nl = (COMP_LOOP_acc_11_psp_sva[0]) | (~ (fsm_output[8])) | (fsm_output[7])
      | (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[5]));
  assign or_151_nl = (VEC_LOOP_j_sva_11_0[1]) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign mux_118_nl = MUX_s_1_2_2(or_153_nl, or_151_nl, fsm_output[1]);
  assign or_154_nl = (VEC_LOOP_j_sva_11_0[0]) | mux_118_nl;
  assign or_150_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b00) | (~ (fsm_output[8]))
      | (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign or_149_nl = (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b00) | (~ (fsm_output[8]))
      | (~ (fsm_output[7])) | (~ (fsm_output[6])) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign mux_117_nl = MUX_s_1_2_2(or_150_nl, or_149_nl, fsm_output[1]);
  assign mux_119_nl = MUX_s_1_2_2(or_154_nl, mux_117_nl, fsm_output[0]);
  assign nor_231_nl = ~((fsm_output[4]) | mux_119_nl);
  assign nor_232_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b00) | (~ (fsm_output[8]))
      | (fsm_output[7]) | (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[5])));
  assign nor_233_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b00) | (fsm_output[8])
      | (~ (fsm_output[7])) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]));
  assign mux_115_nl = MUX_s_1_2_2(nor_232_nl, nor_233_nl, fsm_output[1]);
  assign nor_234_nl = ~((fsm_output[8]) | (~ (fsm_output[7])) | (~ (fsm_output[6]))
      | (fsm_output[3]) | (~ (fsm_output[5])) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b00));
  assign nor_235_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b00) | (~ (fsm_output[8]))
      | (~ (fsm_output[7])) | (~ (fsm_output[6])) | (~ (fsm_output[3])) | (fsm_output[5]));
  assign mux_114_nl = MUX_s_1_2_2(nor_234_nl, nor_235_nl, fsm_output[1]);
  assign mux_116_nl = MUX_s_1_2_2(mux_115_nl, mux_114_nl, fsm_output[0]);
  assign and_256_nl = (fsm_output[4]) & mux_116_nl;
  assign vec_rsc_0_0_i_wea_d_pff = MUX_s_1_2_2(nor_231_nl, and_256_nl, fsm_output[2]);
  assign nor_224_nl = ~((fsm_output[4]) | (fsm_output[0]) | (fsm_output[6]) | (~
      (fsm_output[7])) | (z_out_1[2:1]!=2'b00) | (~ (fsm_output[8])));
  assign nor_225_nl = ~((fsm_output[6]) | (VEC_LOOP_j_sva_11_0[1:0]!=2'b00) | (fsm_output[8:7]!=2'b00));
  assign nor_226_nl = ~((z_out_1[2:1]!=2'b00) | (fsm_output[8:7]!=2'b10));
  assign nor_227_nl = ~((~ modExp_exp_1_0_1_sva) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b00)
      | (fsm_output[8:7]!=2'b10));
  assign mux_124_nl = MUX_s_1_2_2(nor_226_nl, nor_227_nl, fsm_output[6]);
  assign mux_125_nl = MUX_s_1_2_2(nor_225_nl, mux_124_nl, fsm_output[0]);
  assign and_255_nl = (fsm_output[4]) & mux_125_nl;
  assign mux_126_nl = MUX_s_1_2_2(nor_224_nl, and_255_nl, fsm_output[2]);
  assign and_254_nl = nor_43_cse & mux_126_nl;
  assign or_162_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_11_psp_sva[0])
      | (VEC_LOOP_j_sva_11_0[0]) | (fsm_output[8:7]!=2'b10);
  assign or_160_nl = (z_out_1[2:1]!=2'b00) | (fsm_output[8:7]!=2'b01);
  assign mux_122_nl = MUX_s_1_2_2(or_162_nl, or_160_nl, fsm_output[6]);
  assign or_163_nl = (fsm_output[4]) | (fsm_output[0]) | mux_122_nl;
  assign nor_229_nl = ~((~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b00)
      | (fsm_output[8:7]!=2'b01));
  assign nor_230_nl = ~((z_out_1[2:1]!=2'b00) | (fsm_output[8:7]!=2'b00));
  assign mux_121_nl = MUX_s_1_2_2(nor_229_nl, nor_230_nl, fsm_output[6]);
  assign nand_6_nl = ~((fsm_output[4]) & (fsm_output[0]) & mux_121_nl);
  assign mux_123_nl = MUX_s_1_2_2(or_163_nl, nand_6_nl, fsm_output[2]);
  assign nor_228_nl = ~((~ (fsm_output[3])) | (fsm_output[5]) | mux_123_nl);
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(and_254_nl,
      nor_228_nl, fsm_output[1]);
  assign nor_219_nl = ~((COMP_LOOP_acc_11_psp_sva[0]) | (~ (fsm_output[8])) | (fsm_output[7])
      | (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[5])));
  assign nor_220_nl = ~((VEC_LOOP_j_sva_11_0[1]) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]));
  assign mux_132_nl = MUX_s_1_2_2(nor_219_nl, nor_220_nl, fsm_output[1]);
  assign nand_10_nl = ~((VEC_LOOP_j_sva_11_0[0]) & mux_132_nl);
  assign or_178_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b01) | (~ (fsm_output[8]))
      | (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign nand_71_nl = ~((COMP_LOOP_acc_1_cse_sva[1:0]==2'b01) & (fsm_output[8]) &
      (fsm_output[7]) & (fsm_output[6]) & (fsm_output[3]) & (~ (fsm_output[5])));
  assign mux_131_nl = MUX_s_1_2_2(or_178_nl, nand_71_nl, fsm_output[1]);
  assign mux_133_nl = MUX_s_1_2_2(nand_10_nl, mux_131_nl, fsm_output[0]);
  assign nor_218_nl = ~((fsm_output[4]) | mux_133_nl);
  assign nor_221_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b01) | (~ (fsm_output[8]))
      | (fsm_output[7]) | (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[5])));
  assign nor_222_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b01) | (fsm_output[8])
      | (~ (fsm_output[7])) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]));
  assign mux_129_nl = MUX_s_1_2_2(nor_221_nl, nor_222_nl, fsm_output[1]);
  assign nor_223_nl = ~((fsm_output[8]) | (~ (fsm_output[7])) | (~ (fsm_output[6]))
      | (fsm_output[3]) | (~ (fsm_output[5])) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b01));
  assign and_253_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b01) & (fsm_output[8])
      & (fsm_output[7]) & (fsm_output[6]) & (fsm_output[3]) & (~ (fsm_output[5]));
  assign mux_128_nl = MUX_s_1_2_2(nor_223_nl, and_253_nl, fsm_output[1]);
  assign mux_130_nl = MUX_s_1_2_2(mux_129_nl, mux_128_nl, fsm_output[0]);
  assign and_252_nl = (fsm_output[4]) & mux_130_nl;
  assign vec_rsc_0_1_i_wea_d_pff = MUX_s_1_2_2(nor_218_nl, and_252_nl, fsm_output[2]);
  assign nor_211_nl = ~((fsm_output[4]) | (fsm_output[0]) | (fsm_output[6]) | (~
      (fsm_output[7])) | (z_out_1[2]) | (~((z_out_1[1]) & (fsm_output[8]))));
  assign nor_212_nl = ~((fsm_output[6]) | (VEC_LOOP_j_sva_11_0[1:0]!=2'b01) | (fsm_output[8:7]!=2'b00));
  assign nor_213_nl = ~((z_out_1[2:1]!=2'b01) | (fsm_output[8:7]!=2'b10));
  assign nor_214_nl = ~((~ modExp_exp_1_0_1_sva) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b01)
      | (fsm_output[8:7]!=2'b10));
  assign mux_138_nl = MUX_s_1_2_2(nor_213_nl, nor_214_nl, fsm_output[6]);
  assign mux_139_nl = MUX_s_1_2_2(nor_212_nl, mux_138_nl, fsm_output[0]);
  assign and_251_nl = (fsm_output[4]) & mux_139_nl;
  assign mux_140_nl = MUX_s_1_2_2(nor_211_nl, and_251_nl, fsm_output[2]);
  assign and_250_nl = nor_43_cse & mux_140_nl;
  assign or_189_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_11_psp_sva[0])
      | (~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[8:7]!=2'b10);
  assign or_187_nl = (z_out_1[2:1]!=2'b01) | (fsm_output[8:7]!=2'b01);
  assign mux_136_nl = MUX_s_1_2_2(or_189_nl, or_187_nl, fsm_output[6]);
  assign or_190_nl = (fsm_output[4]) | (fsm_output[0]) | mux_136_nl;
  assign nor_216_nl = ~((~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b01)
      | (fsm_output[8:7]!=2'b01));
  assign nor_217_nl = ~((z_out_1[2:1]!=2'b01) | (fsm_output[8:7]!=2'b00));
  assign mux_135_nl = MUX_s_1_2_2(nor_216_nl, nor_217_nl, fsm_output[6]);
  assign nand_11_nl = ~((fsm_output[4]) & (fsm_output[0]) & mux_135_nl);
  assign mux_137_nl = MUX_s_1_2_2(or_190_nl, nand_11_nl, fsm_output[2]);
  assign nor_215_nl = ~((~ (fsm_output[3])) | (fsm_output[5]) | mux_137_nl);
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(and_250_nl,
      nor_215_nl, fsm_output[1]);
  assign or_209_nl = (~ (COMP_LOOP_acc_11_psp_sva[0])) | (~ (fsm_output[8])) | (fsm_output[7])
      | (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[5]));
  assign or_207_nl = (~ (VEC_LOOP_j_sva_11_0[1])) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign mux_146_nl = MUX_s_1_2_2(or_209_nl, or_207_nl, fsm_output[1]);
  assign or_210_nl = (VEC_LOOP_j_sva_11_0[0]) | mux_146_nl;
  assign or_206_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b10) | (~ (fsm_output[8]))
      | (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign nand_69_nl = ~((COMP_LOOP_acc_1_cse_sva[1:0]==2'b10) & (fsm_output[8]) &
      (fsm_output[7]) & (fsm_output[6]) & (fsm_output[3]) & (~ (fsm_output[5])));
  assign mux_145_nl = MUX_s_1_2_2(or_206_nl, nand_69_nl, fsm_output[1]);
  assign mux_147_nl = MUX_s_1_2_2(or_210_nl, mux_145_nl, fsm_output[0]);
  assign nor_207_nl = ~((fsm_output[4]) | mux_147_nl);
  assign nor_208_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b10) | (~ (fsm_output[8]))
      | (fsm_output[7]) | (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[5])));
  assign nor_209_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b10) | (fsm_output[8])
      | (~ (fsm_output[7])) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]));
  assign mux_143_nl = MUX_s_1_2_2(nor_208_nl, nor_209_nl, fsm_output[1]);
  assign nor_210_nl = ~((fsm_output[8]) | (~ (fsm_output[7])) | (~ (fsm_output[6]))
      | (fsm_output[3]) | (~ (fsm_output[5])) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b10));
  assign and_249_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b10) & (fsm_output[8])
      & (fsm_output[7]) & (fsm_output[6]) & (fsm_output[3]) & (~ (fsm_output[5]));
  assign mux_142_nl = MUX_s_1_2_2(nor_210_nl, and_249_nl, fsm_output[1]);
  assign mux_144_nl = MUX_s_1_2_2(mux_143_nl, mux_142_nl, fsm_output[0]);
  assign and_248_nl = (fsm_output[4]) & mux_144_nl;
  assign vec_rsc_0_2_i_wea_d_pff = MUX_s_1_2_2(nor_207_nl, and_248_nl, fsm_output[2]);
  assign nor_200_nl = ~((fsm_output[4]) | (fsm_output[0]) | (fsm_output[6]) | (~
      (fsm_output[7])) | (z_out_1[2:1]!=2'b10) | (~ (fsm_output[8])));
  assign nor_201_nl = ~((fsm_output[6]) | (VEC_LOOP_j_sva_11_0[1:0]!=2'b10) | (fsm_output[8:7]!=2'b00));
  assign nor_202_nl = ~((z_out_1[2:1]!=2'b10) | (fsm_output[8:7]!=2'b10));
  assign nor_203_nl = ~((~ modExp_exp_1_0_1_sva) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b10)
      | (fsm_output[8:7]!=2'b10));
  assign mux_152_nl = MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output[6]);
  assign mux_153_nl = MUX_s_1_2_2(nor_201_nl, mux_152_nl, fsm_output[0]);
  assign and_247_nl = (fsm_output[4]) & mux_153_nl;
  assign mux_154_nl = MUX_s_1_2_2(nor_200_nl, and_247_nl, fsm_output[2]);
  assign and_246_nl = nor_43_cse & mux_154_nl;
  assign or_218_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (~ (COMP_LOOP_acc_11_psp_sva[0]))
      | (VEC_LOOP_j_sva_11_0[0]) | (fsm_output[8:7]!=2'b10);
  assign or_216_nl = (z_out_1[2:1]!=2'b10) | (fsm_output[8:7]!=2'b01);
  assign mux_150_nl = MUX_s_1_2_2(or_218_nl, or_216_nl, fsm_output[6]);
  assign or_219_nl = (fsm_output[4]) | (fsm_output[0]) | mux_150_nl;
  assign nor_205_nl = ~((~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b10)
      | (fsm_output[8:7]!=2'b01));
  assign nor_206_nl = ~((z_out_1[2:1]!=2'b10) | (fsm_output[8:7]!=2'b00));
  assign mux_149_nl = MUX_s_1_2_2(nor_205_nl, nor_206_nl, fsm_output[6]);
  assign nand_15_nl = ~((fsm_output[4]) & (fsm_output[0]) & mux_149_nl);
  assign mux_151_nl = MUX_s_1_2_2(or_219_nl, nand_15_nl, fsm_output[2]);
  assign nor_204_nl = ~((~ (fsm_output[3])) | (fsm_output[5]) | mux_151_nl);
  assign vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(and_246_nl,
      nor_204_nl, fsm_output[1]);
  assign nor_195_nl = ~((~ (COMP_LOOP_acc_11_psp_sva[0])) | (~ (fsm_output[8])) |
      (fsm_output[7]) | (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[5])));
  assign nor_196_nl = ~((~ (VEC_LOOP_j_sva_11_0[1])) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]));
  assign mux_160_nl = MUX_s_1_2_2(nor_195_nl, nor_196_nl, fsm_output[1]);
  assign nand_19_nl = ~((VEC_LOOP_j_sva_11_0[0]) & mux_160_nl);
  assign or_235_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b11) | (~ (fsm_output[8]))
      | (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign nand_67_nl = ~((COMP_LOOP_acc_1_cse_sva[1:0]==2'b11) & (fsm_output[8]) &
      (fsm_output[7]) & (fsm_output[6]) & (fsm_output[3]) & (~ (fsm_output[5])));
  assign mux_159_nl = MUX_s_1_2_2(or_235_nl, nand_67_nl, fsm_output[1]);
  assign mux_161_nl = MUX_s_1_2_2(nand_19_nl, mux_159_nl, fsm_output[0]);
  assign nor_194_nl = ~((fsm_output[4]) | mux_161_nl);
  assign and_293_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b11) & (fsm_output[8])
      & (~ (fsm_output[7])) & (fsm_output[6]) & (~ (fsm_output[3])) & (fsm_output[5]);
  assign nor_198_nl = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b11) | (fsm_output[8])
      | (~ (fsm_output[7])) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[5]));
  assign mux_157_nl = MUX_s_1_2_2(and_293_nl, nor_198_nl, fsm_output[1]);
  assign nor_199_nl = ~((fsm_output[8]) | (~ (fsm_output[7])) | (~ (fsm_output[6]))
      | (fsm_output[3]) | (~((fsm_output[5]) & (COMP_LOOP_acc_1_cse_2_sva[1:0]==2'b11))));
  assign and_245_nl = (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b11) & (fsm_output[8])
      & (fsm_output[7]) & (fsm_output[6]) & (fsm_output[3]) & (~ (fsm_output[5]));
  assign mux_156_nl = MUX_s_1_2_2(nor_199_nl, and_245_nl, fsm_output[1]);
  assign mux_158_nl = MUX_s_1_2_2(mux_157_nl, mux_156_nl, fsm_output[0]);
  assign and_244_nl = (fsm_output[4]) & mux_158_nl;
  assign vec_rsc_0_3_i_wea_d_pff = MUX_s_1_2_2(nor_194_nl, and_244_nl, fsm_output[2]);
  assign nor_188_nl = ~((fsm_output[4]) | (fsm_output[0]) | (fsm_output[6]) | (~((fsm_output[7])
      & (z_out_1[2:1]==2'b11) & (fsm_output[8]))));
  assign nor_189_nl = ~((fsm_output[6]) | (VEC_LOOP_j_sva_11_0[1:0]!=2'b11) | (fsm_output[8:7]!=2'b00));
  assign and_294_nl = (z_out_1[2:1]==2'b11) & (fsm_output[8:7]==2'b10);
  assign and_295_nl = modExp_exp_1_0_1_sva & (COMP_LOOP_acc_1_cse_sva[1:0]==2'b11)
      & (fsm_output[8:7]==2'b10);
  assign mux_166_nl = MUX_s_1_2_2(and_294_nl, and_295_nl, fsm_output[6]);
  assign mux_167_nl = MUX_s_1_2_2(nor_189_nl, mux_166_nl, fsm_output[0]);
  assign and_242_nl = (fsm_output[4]) & mux_167_nl;
  assign mux_168_nl = MUX_s_1_2_2(nor_188_nl, and_242_nl, fsm_output[2]);
  assign and_241_nl = nor_43_cse & mux_168_nl;
  assign nand_85_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm & (COMP_LOOP_acc_11_psp_sva[0])
      & (VEC_LOOP_j_sva_11_0[0]) & (fsm_output[8:7]==2'b10));
  assign nand_66_nl = ~((z_out_1[2:1]==2'b11) & (fsm_output[8:7]==2'b01));
  assign mux_164_nl = MUX_s_1_2_2(nand_85_nl, nand_66_nl, fsm_output[6]);
  assign or_247_nl = (fsm_output[4]) | (fsm_output[0]) | mux_164_nl;
  assign and_243_nl = COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm & (COMP_LOOP_acc_1_cse_2_sva[1:0]==2'b11)
      & (fsm_output[8:7]==2'b01);
  assign nor_193_nl = ~((z_out_1[2:1]!=2'b11) | (fsm_output[8:7]!=2'b00));
  assign mux_163_nl = MUX_s_1_2_2(and_243_nl, nor_193_nl, fsm_output[6]);
  assign nand_20_nl = ~((fsm_output[4]) & (fsm_output[0]) & mux_163_nl);
  assign mux_165_nl = MUX_s_1_2_2(or_247_nl, nand_20_nl, fsm_output[2]);
  assign nor_192_nl = ~((~ (fsm_output[3])) | (fsm_output[5]) | mux_165_nl);
  assign vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(and_241_nl,
      nor_192_nl, fsm_output[1]);
  assign and_dcpl_170 = and_dcpl_85 & (fsm_output[5]) & (~((fsm_output[3]) | (fsm_output[1])));
  assign and_dcpl_175 = and_dcpl_170 & (~ (fsm_output[0])) & (fsm_output[2]) & (fsm_output[4])
      & (~ (fsm_output[8]));
  assign and_dcpl_178 = and_203_cse & (fsm_output[8:7]==2'b00);
  assign and_dcpl_181 = (~ (fsm_output[6])) & (fsm_output[5]) & (~ (fsm_output[3]));
  assign and_dcpl_182 = and_dcpl_181 & (fsm_output[1:0]==2'b00);
  assign and_dcpl_183 = and_dcpl_182 & and_dcpl_178;
  assign not_tmp_289 = ~((fsm_output[0]) & (fsm_output[5]));
  assign nor_287_cse = ~((~ (fsm_output[7])) | (fsm_output[8]) | (fsm_output[4])
      | (fsm_output[1]) | (fsm_output[6]) | (fsm_output[3]) | not_tmp_289);
  assign nor_288_nl = ~((fsm_output[1]) | (fsm_output[6]) | (~ (fsm_output[3])) |
      (fsm_output[0]) | (fsm_output[5]));
  assign nor_289_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[6])) | (fsm_output[3])
      | not_tmp_289);
  assign mux_411_nl = MUX_s_1_2_2(nor_288_nl, nor_289_nl, fsm_output[4]);
  assign and_nl = nor_263_cse & mux_411_nl;
  assign not_tmp_291 = MUX_s_1_2_2(nor_287_cse, and_nl, fsm_output[2]);
  assign and_dcpl_186 = (fsm_output[6]) & (~ (fsm_output[5])) & (fsm_output[3]);
  assign and_dcpl_188 = and_dcpl_186 & (fsm_output[1:0]==2'b11) & and_dcpl_178;
  assign and_dcpl_190 = ~((fsm_output[2]) | (fsm_output[4]));
  assign and_dcpl_194 = and_dcpl_186 & and_dcpl_36 & and_dcpl_190 & (fsm_output[8:7]==2'b01);
  assign and_dcpl_199 = and_dcpl_181 & and_dcpl_70 & and_203_cse & (fsm_output[8:7]==2'b10);
  assign and_dcpl_201 = and_dcpl_190 & (fsm_output[8:7]==2'b11);
  assign and_dcpl_202 = and_dcpl_182 & and_dcpl_201;
  assign and_dcpl_206 = (fsm_output[6]) & (fsm_output[5]) & (~ (fsm_output[3])) &
      and_dcpl_70 & and_dcpl_201;
  assign and_dcpl_208 = and_dcpl_181 & and_dcpl_36 & and_dcpl_178;
  assign and_dcpl_212 = (fsm_output[0]) & (fsm_output[2]);
  assign and_dcpl_227 = (fsm_output[5]) & (~ (fsm_output[3])) & (~ (fsm_output[1]));
  assign and_dcpl_242 = (fsm_output[4:0]==5'b10100) & and_dcpl_39 & and_dcpl_25;
  assign and_dcpl_249 = (fsm_output[4:0]==5'b11111) & and_dcpl_45 & and_dcpl_25;
  assign and_dcpl_252 = ~((fsm_output[0]) | (fsm_output[4]));
  assign and_dcpl_254 = (fsm_output[3:1]==3'b101);
  assign and_dcpl_255 = and_dcpl_254 & and_dcpl_252;
  assign and_dcpl_256 = and_dcpl_255 & and_dcpl_45 & (fsm_output[8:7]==2'b01);
  assign and_dcpl_258 = (fsm_output[6:5]==2'b00) & and_dcpl_25;
  assign and_dcpl_261 = and_dcpl_254 & (fsm_output[0]) & (~ (fsm_output[4])) & and_dcpl_258;
  assign and_dcpl_267 = (fsm_output[3:1]==3'b000) & and_dcpl_252 & and_dcpl_39 &
      (fsm_output[8:7]==2'b11);
  assign and_dcpl_268 = and_dcpl_255 & and_dcpl_258;
  assign operator_64_false_1_or_ssc = and_dcpl_188 | and_dcpl_194 | and_dcpl_199
      | and_dcpl_202 | and_dcpl_206;
  assign COMP_LOOP_or_ssc = and_dcpl_261 | and_dcpl_267 | and_dcpl_268;
  assign nor_tmp = (fsm_output[8]) & (fsm_output[6]);
  assign mux_tmp_413 = MUX_s_1_2_2(mux_tmp_335, nor_tmp, fsm_output[0]);
  assign or_tmp_497 = (fsm_output[7]) | nand_57_cse;
  assign operator_64_false_1_or_itm = not_tmp_291 | and_dcpl_208;
  assign COMP_LOOP_or_20_itm = and_dcpl_249 | and_dcpl_256;
  always @(posedge clk) begin
    if ( ~ not_tmp_73 ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_31 & and_dcpl_27) | STAGE_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( ~ not_tmp_73 ) begin
      r_sva <= r_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_0_3_obj_ld_cse <= 1'b0;
      operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      modExp_exp_1_0_1_sva <= 1'b0;
      modExp_exp_1_0_1_sva_1 <= 1'b0;
      modExp_exp_1_7_1_sva <= 1'b0;
      modExp_exp_1_1_1_sva <= 1'b0;
    end
    else begin
      reg_vec_rsc_triosy_0_3_obj_ld_cse <= and_dcpl_37 & and_dcpl_2 & (fsm_output[8:7]==2'b11)
          & (~ STAGE_LOOP_acc_itm_2_1);
      operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm <= operator_66_true_div_cmp_z[63:0];
      modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_14_nl & (mux_293_nl | (~ (fsm_output[0]))
          | (fsm_output[6]) | (fsm_output[7]))) | (mux_317_nl & (~ (fsm_output[3]))
          & (~ (fsm_output[0])) & (fsm_output[5]));
      modExp_exp_1_0_1_sva_1 <= (COMP_LOOP_mux_19_nl & (mux_324_nl | (fsm_output[3])
          | (fsm_output[1]) | (~ (fsm_output[5])) | (fsm_output[6]) | (fsm_output[8])))
          | mux_350_nl;
      modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_22_nl & (~ mux_357_nl);
      modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_39_nl & (~(and_dcpl_49 & and_dcpl_36
          & and_dcpl_46));
    end
  end
  always @(posedge clk) begin
    modulo_result_rem_cmp_a <= MUX1HOT_v_64_18_2(z_out_4, modExp_while_if_mul_mut,
        modExp_while_mul_itm, COMP_LOOP_1_modExp_1_while_if_mul_mut, COMP_LOOP_1_modExp_1_while_mul_itm,
        COMP_LOOP_1_mul_mut, COMP_LOOP_1_acc_5_mut_mx0w7, COMP_LOOP_1_acc_5_mut,
        operator_64_false_acc_mut_63_0, COMP_LOOP_2_modExp_1_while_mul_mut, COMP_LOOP_2_modExp_1_while_if_mul_itm,
        COMP_LOOP_2_mul_mut, COMP_LOOP_3_modExp_1_while_mul_mut, COMP_LOOP_3_modExp_1_while_if_mul_itm,
        COMP_LOOP_3_mul_mut, COMP_LOOP_4_modExp_1_while_mul_mut, COMP_LOOP_4_modExp_1_while_if_mul_itm,
        COMP_LOOP_4_mul_mut, {modulo_result_or_nl , and_93_nl , and_96_nl , and_98_nl
        , and_99_nl , and_101_nl , not_tmp_144 , (~ mux_193_nl) , (~ mux_198_nl)
        , and_106_nl , and_108_nl , and_111_nl , and_113_nl , and_117_nl , and_118_nl
        , and_119_nl , and_121_nl , and_122_nl});
    modulo_result_rem_cmp_b <= p_sva;
    operator_66_true_div_cmp_a <= MUX_v_65_2_2(operator_64_false_acc_mut_mx0w0, ({operator_64_false_acc_mut_64
        , operator_64_false_acc_mut_63_0}), and_dcpl_110);
    operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
        STAGE_LOOP_lshift_psp_sva, and_dcpl_110);
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_177_nl, and_tmp_6, fsm_output[8]) ) begin
      STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_424_nl, (~ mux_413_nl), fsm_output[7]) ) begin
      operator_64_false_acc_mut_64 <= operator_64_false_mux1h_1_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_315_nl, mux_429_nl, fsm_output[5]) ) begin
      operator_64_false_acc_mut_63_0 <= operator_64_false_mux1h_1_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_sva_11_0 <= 12'b000000000000;
    end
    else if ( and_dcpl_116 | VEC_LOOP_j_sva_11_0_mx0c1 ) begin
      VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(12'b000000000000, (z_out_1[11:0]), VEC_LOOP_j_sva_11_0_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_k_9_2_sva_6_0 <= 7'b0000000;
    end
    else if ( ~(mux_435_nl | (fsm_output[2])) ) begin
      COMP_LOOP_k_9_2_sva_6_0 <= MUX_v_7_2_2(7'b0000000, (z_out_3[6:0]), or_601_nl);
    end
  end
  always @(posedge clk) begin
    if ( (modExp_while_and_3 | modExp_while_and_5 | modExp_result_sva_mx0c0 | (~
        mux_227_nl)) & (modExp_result_sva_mx0c0 | modExp_result_and_rgt | modExp_result_and_1_rgt)
        ) begin
      modExp_result_sva <= MUX1HOT_v_64_3_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
          modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w8, {modExp_result_sva_mx0c0
          , modExp_result_and_rgt , modExp_result_and_1_rgt});
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_255_nl, mux_251_nl, fsm_output[5]) ) begin
      modExp_base_1_sva <= MUX1HOT_v_64_8_2(r_sva, modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w8,
          modExp_result_sva, vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_2_i_qa_d,
          vec_rsc_0_3_i_qa_d, {and_141_nl , r_or_nl , r_or_1_nl , not_tmp_185 , and_146_nl
          , and_148_nl , and_150_nl , and_152_nl});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_acc_5_mut <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( (modExp_while_and_3 | modExp_while_and_5 | and_dcpl_116 | not_tmp_185
        | not_tmp_144) & mux_289_nl ) begin
      COMP_LOOP_1_acc_5_mut <= MUX1HOT_v_64_5_2(({1'b0 , operator_64_false_slc_modExp_exp_63_1_3}),
          64'b0000000000000000000000000000000000000000000000000000000000000001, modulo_result_rem_cmp_z,
          modulo_qr_sva_1_mx0w8, COMP_LOOP_1_acc_5_mut_mx0w7, {and_dcpl_116 , not_tmp_185
          , COMP_LOOP_and_nl , COMP_LOOP_and_1_nl , not_tmp_144});
    end
  end
  always @(posedge clk) begin
    if ( ~((~ mux_318_nl) & and_dcpl_27) ) begin
      modExp_while_if_mul_mut <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= 1'b0;
    end
    else if ( and_dcpl_83 | and_dcpl_145 | and_dcpl_77 ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((~ (z_out_3[63])), (~
          (z_out_1[8])), (~ (readslicef_10_1_9(COMP_LOOP_1_acc_nl))), {and_dcpl_83
          , and_dcpl_145 , and_dcpl_77});
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_40 | or_71_cse | or_tmp_2) ) begin
      modExp_while_mul_itm <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_tmp_285 | or_278_cse | or_dcpl_43) ) begin
      COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_2_sva <= 12'b000000000000;
    end
    else if ( ~(mux_321_nl & (~ (fsm_output[8]))) ) begin
      COMP_LOOP_acc_1_cse_2_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_11_psp_sva <= 11'b00000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_227, or_425_nl, fsm_output[8]) ) begin
      COMP_LOOP_acc_11_psp_sva <= z_out_3[10:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 12'b000000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_227, and_166_nl, fsm_output[8]) ) begin
      COMP_LOOP_acc_1_cse_sva <= nl_COMP_LOOP_acc_1_cse_sva[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_6_1_sva <= 1'b0;
      modExp_exp_1_5_1_sva <= 1'b0;
      modExp_exp_1_4_1_sva <= 1'b0;
      modExp_exp_1_3_1_sva <= 1'b0;
      modExp_exp_1_2_1_sva <= 1'b0;
    end
    else if ( mux_353_itm ) begin
      modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[4]), modExp_exp_1_7_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[5]), {and_dcpl_152 , not_tmp_250 , not_tmp_245});
      modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[3]), modExp_exp_1_6_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[4]), {and_dcpl_152 , not_tmp_250 , not_tmp_245});
      modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[2]), modExp_exp_1_5_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[3]), {and_dcpl_152 , not_tmp_250 , not_tmp_245});
      modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[1]), modExp_exp_1_4_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[2]), {and_dcpl_152 , not_tmp_250 , not_tmp_245});
      modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[0]), modExp_exp_1_3_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[1]), {and_dcpl_152 , not_tmp_250 , not_tmp_245});
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_391_nl & and_dcpl_25) ) begin
      COMP_LOOP_1_modExp_1_while_if_mul_mut <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_47 | or_dcpl_43) ) begin
      COMP_LOOP_1_modExp_1_while_mul_itm <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_12_1_1_sva <= 12'b000000000000;
    end
    else if ( COMP_LOOP_or_2_cse ) begin
      COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out_1[12:1];
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_51 | not_tmp_152 | and_dcpl_63 ) begin
      COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm <= MUX_s_1_2_2((z_out_3[9]), (z_out_1[8]),
          not_tmp_152);
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_53 | or_dcpl_49 | or_tmp_2) ) begin
      COMP_LOOP_1_mul_mut <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_53 | or_dcpl_42 | or_tmp_7) ) begin
      COMP_LOOP_2_modExp_1_while_mul_mut <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~((~ mux_398_nl) & and_dcpl_52) ) begin
      COMP_LOOP_2_modExp_1_while_if_mul_itm <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_40 | (fsm_output[6:5]!=2'b10) | or_tmp_7) ) begin
      COMP_LOOP_2_mul_mut <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_40 | or_71_cse | or_tmp_43) ) begin
      COMP_LOOP_3_modExp_1_while_mul_mut <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~((~ mux_399_nl) & and_dcpl_100) ) begin
      COMP_LOOP_3_modExp_1_while_if_mul_itm <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_47 | or_dcpl_42 | or_tmp_43) ) begin
      COMP_LOOP_3_mul_mut <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_47 | or_dcpl_49 | or_tmp_43) ) begin
      COMP_LOOP_4_modExp_1_while_mul_mut <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_400_nl & (fsm_output[8])) ) begin
      COMP_LOOP_4_modExp_1_while_if_mul_itm <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_52 | (fsm_output[1:0]!=2'b10) | or_dcpl_42 | (fsm_output[8:7]!=2'b11))
        ) begin
      COMP_LOOP_4_mul_mut <= z_out_4;
    end
  end
  assign or_263_nl = (fsm_output[7]) | (fsm_output[2]) | (fsm_output[4]) | (fsm_output[1])
      | (~ (fsm_output[6]));
  assign mux_174_nl = MUX_s_1_2_2(or_tmp_230, or_263_nl, fsm_output[0]);
  assign or_261_nl = (~ (fsm_output[7])) | (fsm_output[2]) | (fsm_output[4]) | (~
      (fsm_output[1])) | (fsm_output[6]);
  assign mux_173_nl = MUX_s_1_2_2(or_261_nl, or_tmp_230, fsm_output[0]);
  assign mux_175_nl = MUX_s_1_2_2(mux_174_nl, mux_173_nl, fsm_output[8]);
  assign and_236_nl = (fsm_output[5]) & (~ mux_175_nl);
  assign nor_186_nl = ~((fsm_output[5]) | (fsm_output[8]) | (fsm_output[0]) | (~
      (fsm_output[7])) | (~ (fsm_output[2])) | (fsm_output[4]) | (fsm_output[1])
      | (~ (fsm_output[6])));
  assign mux_176_nl = MUX_s_1_2_2(and_236_nl, nor_186_nl, fsm_output[3]);
  assign modulo_result_or_nl = and_dcpl_83 | mux_176_nl | not_tmp_152;
  assign and_93_nl = (~ mux_tmp_171) & and_dcpl_27;
  assign and_96_nl = (~ mux_tmp_172) & and_dcpl_85 & (~ (fsm_output[8]));
  assign and_98_nl = (~ mux_tmp_177) & and_dcpl_25;
  assign and_99_nl = (~ mux_tmp_180) & and_dcpl_46;
  assign and_101_nl = (~ mux_185_itm) & and_dcpl_2 & and_dcpl_25;
  assign nand_62_nl = ~((fsm_output[6:5]==2'b11) & (((fsm_output[2:1]==2'b11)) |
      (fsm_output[3])) & (fsm_output[4]));
  assign mux_190_nl = MUX_s_1_2_2(mux_tmp_181, nor_tmp_61, or_278_cse);
  assign nand_26_nl = ~((fsm_output[5]) & (~ mux_190_nl));
  assign mux_191_nl = MUX_s_1_2_2(or_tmp_251, nand_26_nl, fsm_output[6]);
  assign mux_192_nl = MUX_s_1_2_2(nand_62_nl, mux_191_nl, fsm_output[7]);
  assign or_277_nl = (fsm_output[6:5]!=2'b10) | mux_tmp_171;
  assign mux_189_nl = MUX_s_1_2_2(or_277_nl, mux_tmp_177, fsm_output[7]);
  assign mux_193_nl = MUX_s_1_2_2(mux_192_nl, mux_189_nl, fsm_output[8]);
  assign mux_196_nl = MUX_s_1_2_2(not_tmp_130, mux_tmp_179, or_278_cse);
  assign nor_182_nl = ~((fsm_output[5]) | mux_196_nl);
  assign and_103_nl = (fsm_output[5]) & nor_tmp_61;
  assign mux_197_nl = MUX_s_1_2_2(nor_182_nl, and_103_nl, fsm_output[6]);
  assign nand_61_nl = ~((fsm_output[7]) & mux_197_nl);
  assign mux_194_nl = MUX_s_1_2_2(or_tmp_255, mux_tmp_172, fsm_output[6]);
  assign or_284_nl = (fsm_output[6:5]!=2'b10) | mux_tmp_180;
  assign mux_195_nl = MUX_s_1_2_2(mux_194_nl, or_284_nl, fsm_output[7]);
  assign mux_198_nl = MUX_s_1_2_2(nand_61_nl, mux_195_nl, fsm_output[8]);
  assign and_106_nl = (~ mux_185_itm) & and_dcpl_39 & and_dcpl_52;
  assign mux_201_nl = MUX_s_1_2_2(and_tmp_13, (~ or_tmp_251), fsm_output[6]);
  assign and_108_nl = mux_201_nl & and_dcpl_52;
  assign and_111_nl = or_dcpl_31 & and_dcpl_62;
  assign and_113_nl = or_dcpl_31 & and_dcpl_98;
  assign and_117_nl = (~(or_574_cse & (fsm_output[4]))) & (fsm_output[5]) & and_dcpl_100;
  assign nand_59_nl = ~((fsm_output[5:3]==3'b111));
  assign mux_202_nl = MUX_s_1_2_2(nand_59_nl, or_tmp_269, fsm_output[6]);
  assign and_118_nl = (~ mux_202_nl) & and_dcpl_64;
  assign and_222_nl = (fsm_output[6:3]==4'b1111);
  assign nor_179_nl = ~((fsm_output[6:5]!=2'b00) | or_tmp_268);
  assign mux_203_nl = MUX_s_1_2_2(and_222_nl, nor_179_nl, fsm_output[7]);
  assign and_119_nl = mux_203_nl & (fsm_output[8]);
  assign and_121_nl = (~ mux_204_itm) & and_dcpl_26 & nor_tmp_4;
  assign mux_205_nl = MUX_s_1_2_2(mux_tmp_183, mux_tmp_181, fsm_output[1]);
  assign mux_206_nl = MUX_s_1_2_2(mux_205_nl, mux_tmp_184, fsm_output[0]);
  assign and_122_nl = (~ mux_206_nl) & and_dcpl_76;
  assign COMP_LOOP_and_9_nl = (~ and_dcpl_122) & and_dcpl_116;
  assign mux_313_nl = MUX_s_1_2_2(nor_tmp_4, or_tmp_7, fsm_output[4]);
  assign or_405_nl = (fsm_output[4]) | (fsm_output[0]) | (fsm_output[1]);
  assign mux_311_nl = MUX_s_1_2_2(or_tmp_43, mux_tmp_55, or_405_nl);
  assign mux_54_nl = MUX_s_1_2_2(or_tmp_7, nor_tmp_4, fsm_output[1]);
  assign mux_310_nl = MUX_s_1_2_2(mux_tmp_55, mux_54_nl, fsm_output[4]);
  assign mux_312_nl = MUX_s_1_2_2(mux_311_nl, mux_310_nl, fsm_output[2]);
  assign mux_314_nl = MUX_s_1_2_2((~ mux_313_nl), mux_312_nl, fsm_output[5]);
  assign and_202_nl = ((fsm_output[4]) | (fsm_output[8])) & (fsm_output[7]);
  assign or_403_nl = (fsm_output[1]) | (~ (fsm_output[8])) | (fsm_output[7]);
  assign or_402_nl = (~ (fsm_output[1])) | (~ (fsm_output[8])) | (fsm_output[7]);
  assign mux_306_nl = MUX_s_1_2_2(or_403_nl, or_402_nl, fsm_output[0]);
  assign mux_307_nl = MUX_s_1_2_2(or_tmp_43, mux_306_nl, and_203_cse);
  assign mux_308_nl = MUX_s_1_2_2(and_202_nl, mux_307_nl, fsm_output[5]);
  assign mux_315_nl = MUX_s_1_2_2(mux_314_nl, mux_308_nl, fsm_output[6]);
  assign mux_61_nl = MUX_s_1_2_2(nor_tmp_4, mux_tmp_55, and_192_cse);
  assign mux_302_nl = MUX_s_1_2_2(mux_61_nl, or_tmp_7, fsm_output[4]);
  assign and_263_nl = (fsm_output[4]) & (fsm_output[1]) & (fsm_output[0]);
  assign mux_300_nl = MUX_s_1_2_2((~ or_tmp_7), or_tmp_43, and_263_nl);
  assign mux_303_nl = MUX_s_1_2_2((~ mux_302_nl), mux_300_nl, fsm_output[2]);
  assign mux_299_nl = MUX_s_1_2_2(mux_tmp_55, nor_tmp_4, fsm_output[4]);
  assign mux_304_nl = MUX_s_1_2_2(mux_303_nl, mux_299_nl, fsm_output[5]);
  assign mux_294_nl = MUX_s_1_2_2(nor_tmp_4, or_tmp_43, fsm_output[1]);
  assign or_400_nl = (fsm_output[4]) | (fsm_output[0]);
  assign mux_295_nl = MUX_s_1_2_2(mux_294_nl, (fsm_output[7]), or_400_nl);
  assign or_399_nl = ((fsm_output[4]) & (fsm_output[0]) & (fsm_output[1]) & (~ (fsm_output[8])))
      | (fsm_output[7]);
  assign mux_296_nl = MUX_s_1_2_2(mux_295_nl, or_399_nl, fsm_output[2]);
  assign mux_297_nl = MUX_s_1_2_2(mux_296_nl, or_tmp_43, fsm_output[5]);
  assign mux_305_nl = MUX_s_1_2_2(mux_304_nl, mux_297_nl, fsm_output[6]);
  assign mux_316_nl = MUX_s_1_2_2(mux_315_nl, mux_305_nl, fsm_output[3]);
  assign COMP_LOOP_mux1h_14_nl = MUX1HOT_s_1_6_2((operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm[0]),
      (COMP_LOOP_1_acc_5_mut[0]), (z_out_1[7]), modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva,
      (z_out[7]), {COMP_LOOP_and_9_nl , and_dcpl_122 , and_dcpl_44 , not_tmp_215
      , (~ mux_316_nl) , and_dcpl_72});
  assign mux_293_nl = MUX_s_1_2_2(or_tmp_113, or_tmp_111, fsm_output[8]);
  assign nor_154_nl = ~((~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[1]) |
      (fsm_output[2]) | (fsm_output[4]));
  assign nor_155_nl = ~((fsm_output[7]) | (~((fsm_output[6]) & (fsm_output[1]) &
      (fsm_output[2]) & (fsm_output[4]))));
  assign mux_317_nl = MUX_s_1_2_2(nor_154_nl, nor_155_nl, fsm_output[8]);
  assign nor_150_nl = ~((~ (fsm_output[3])) | (fsm_output[5]) | nand_56_cse);
  assign mux_333_nl = MUX_s_1_2_2(nor_149_cse, nor_150_nl, fsm_output[1]);
  assign and_200_nl = (fsm_output[8]) & (fsm_output[2]) & (fsm_output[4]) & mux_333_nl;
  assign or_433_nl = (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[3])) | (fsm_output[5])
      | nand_56_cse;
  assign or_431_nl = (~ (fsm_output[4])) | (~ (fsm_output[1])) | (~ (fsm_output[3]))
      | (fsm_output[5]) | (fsm_output[0]) | (fsm_output[7]);
  assign mux_332_nl = MUX_s_1_2_2(or_433_nl, or_431_nl, fsm_output[2]);
  assign nor_151_nl = ~((fsm_output[8]) | mux_332_nl);
  assign mux_334_nl = MUX_s_1_2_2(and_200_nl, nor_151_nl, fsm_output[6]);
  assign COMP_LOOP_mux_19_nl = MUX_s_1_2_2(modExp_exp_1_0_1_sva_1, modExp_exp_1_1_1_sva,
      mux_334_nl);
  assign nand_90_nl = ~((fsm_output[0]) & (fsm_output[2]) & (fsm_output[4]));
  assign or_575_nl = (fsm_output[0]) | (fsm_output[2]) | (fsm_output[4]);
  assign mux_324_nl = MUX_s_1_2_2(nand_90_nl, or_575_nl, fsm_output[7]);
  assign mux_346_nl = MUX_s_1_2_2(mux_tmp_345, or_376_cse, fsm_output[1]);
  assign mux_347_nl = MUX_s_1_2_2(mux_346_nl, or_607_cse, fsm_output[2]);
  assign mux_348_nl = MUX_s_1_2_2(mux_tmp_345, mux_347_nl, fsm_output[3]);
  assign or_442_nl = (~ (fsm_output[3])) | (~ (fsm_output[2])) | (fsm_output[0])
      | (~ (fsm_output[1])) | (fsm_output[7]);
  assign mux_344_nl = MUX_s_1_2_2(mux_tmp_335, or_607_cse, or_442_nl);
  assign mux_349_nl = MUX_s_1_2_2(mux_348_nl, mux_344_nl, fsm_output[4]);
  assign or_440_nl = (fsm_output[1]) | (fsm_output[7]);
  assign mux_338_nl = MUX_s_1_2_2(or_607_cse, or_tmp_32, or_440_nl);
  assign or_439_nl = (~ (fsm_output[1])) | (fsm_output[7]);
  assign mux_337_nl = MUX_s_1_2_2((~ mux_tmp_335), or_tmp_32, or_439_nl);
  assign mux_339_nl = MUX_s_1_2_2(mux_338_nl, mux_337_nl, fsm_output[0]);
  assign mux_341_nl = MUX_s_1_2_2(mux_249_cse, mux_339_nl, fsm_output[2]);
  assign mux_336_nl = MUX_s_1_2_2((~ mux_tmp_335), or_tmp_32, fsm_output[7]);
  assign mux_342_nl = MUX_s_1_2_2(mux_341_nl, mux_336_nl, fsm_output[3]);
  assign mux_343_nl = MUX_s_1_2_2(mux_249_cse, mux_342_nl, fsm_output[4]);
  assign mux_350_nl = MUX_s_1_2_2(mux_349_nl, mux_343_nl, fsm_output[5]);
  assign COMP_LOOP_mux1h_22_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0[5]), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_2_sva_6_0[6]), {and_dcpl_152 , and_dcpl_145
      , (~ mux_353_itm) , not_tmp_245});
  assign and_290_nl = (fsm_output[0]) & (fsm_output[3]) & (~ (fsm_output[5])) & (fsm_output[7]);
  assign mux_356_nl = MUX_s_1_2_2(nor_149_cse, and_290_nl, fsm_output[1]);
  assign and_198_nl = (~((~ (fsm_output[4])) | (fsm_output[6]) | (~ (fsm_output[8]))))
      & mux_356_nl;
  assign mux_357_nl = MUX_s_1_2_2(nor_143_cse, and_198_nl, fsm_output[2]);
  assign or_464_nl = (fsm_output[5]) | nor_tmp_104;
  assign mux_361_nl = MUX_s_1_2_2((~ and_285_cse), or_464_nl, fsm_output[6]);
  assign mux_362_nl = MUX_s_1_2_2(mux_361_nl, mux_tmp_328, fsm_output[7]);
  assign mux_363_nl = MUX_s_1_2_2(mux_362_nl, mux_tmp_327, fsm_output[8]);
  assign COMP_LOOP_mux1h_39_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0[6]), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_2_sva_6_0[0]), {and_dcpl_152 , not_tmp_250
      , (~ mux_363_nl) , not_tmp_245});
  assign nor_177_nl = ~((fsm_output[7:1]!=7'b0000000));
  assign or_609_nl = (~((fsm_output[1:0]!=2'b01))) | (fsm_output[8]) | (fsm_output[6]);
  assign or_608_nl = ((~((fsm_output[1:0]==2'b11))) & (fsm_output[8])) | (fsm_output[6]);
  assign mux_421_nl = MUX_s_1_2_2(or_609_nl, or_608_nl, fsm_output[2]);
  assign mux_418_nl = MUX_s_1_2_2(or_607_cse, or_tmp_32, fsm_output[0]);
  assign mux_419_nl = MUX_s_1_2_2((fsm_output[6]), mux_418_nl, fsm_output[1]);
  assign mux_420_nl = MUX_s_1_2_2(mux_419_nl, or_tmp_32, fsm_output[2]);
  assign mux_422_nl = MUX_s_1_2_2(mux_421_nl, mux_420_nl, fsm_output[3]);
  assign mux_423_nl = MUX_s_1_2_2(mux_422_nl, or_tmp_32, fsm_output[4]);
  assign mux_415_nl = MUX_s_1_2_2(or_tmp_32, (~ mux_tmp_413), fsm_output[1]);
  assign or_605_nl = (fsm_output[1]) | (~ mux_tmp_413);
  assign mux_416_nl = MUX_s_1_2_2(mux_415_nl, or_605_nl, fsm_output[2]);
  assign or_606_nl = (fsm_output[3]) | mux_416_nl;
  assign mux_417_nl = MUX_s_1_2_2(or_tmp_32, or_606_nl, fsm_output[4]);
  assign mux_424_nl = MUX_s_1_2_2(mux_423_nl, mux_417_nl, fsm_output[5]);
  assign mux_412_nl = MUX_s_1_2_2((~ or_tmp_32), mux_tmp_335, or_278_cse);
  assign and_413_nl = (fsm_output[4:2]==3'b111) & mux_412_nl;
  assign mux_413_nl = MUX_s_1_2_2(and_413_nl, nor_tmp, fsm_output[5]);
  assign or_619_nl = (fsm_output[4]) | (~ (fsm_output[0])) | (fsm_output[6]) | (fsm_output[7])
      | (fsm_output[8]) | (fsm_output[1]);
  assign or_617_nl = (fsm_output[6]) | (fsm_output[7]) | (fsm_output[8]) | (~ (fsm_output[1]));
  assign mux_430_nl = MUX_s_1_2_2(or_617_nl, or_tmp_497, fsm_output[0]);
  assign or_618_nl = (fsm_output[4]) | mux_430_nl;
  assign mux_431_nl = MUX_s_1_2_2(or_619_nl, or_618_nl, fsm_output[3]);
  assign nor_315_nl = ~((fsm_output[2]) | mux_431_nl);
  assign or_614_nl = (fsm_output[0]) | (~ (fsm_output[7])) | (fsm_output[8]) | (fsm_output[1]);
  assign or_613_nl = (~ (fsm_output[0])) | (fsm_output[6]) | (fsm_output[7]) | (fsm_output[8])
      | (~ (fsm_output[1]));
  assign mux_428_nl = MUX_s_1_2_2(or_614_nl, or_613_nl, fsm_output[4]);
  assign nor_316_nl = ~((fsm_output[3]) | mux_428_nl);
  assign mux_426_nl = MUX_s_1_2_2(nand_cse, or_tmp_497, fsm_output[6]);
  assign or_610_nl = (fsm_output[7]) | (fsm_output[8]) | (fsm_output[1]);
  assign mux_427_nl = MUX_s_1_2_2(mux_426_nl, or_610_nl, fsm_output[0]);
  assign nor_317_nl = ~((fsm_output[4:3]!=2'b10) | mux_427_nl);
  assign mux_429_nl = MUX_s_1_2_2(nor_316_nl, nor_317_nl, fsm_output[2]);
  assign or_332_nl = (fsm_output[0]) | (~ (fsm_output[1])) | (~ (fsm_output[3]))
      | (fsm_output[4]);
  assign nand_86_nl = ~((fsm_output[0]) & (fsm_output[1]) & (~ (fsm_output[3])) &
      (fsm_output[4]));
  assign mux_222_nl = MUX_s_1_2_2(or_332_nl, nand_86_nl, fsm_output[5]);
  assign or_333_nl = (fsm_output[7:6]!=2'b00) | mux_222_nl;
  assign or_328_nl = (~ (fsm_output[7])) | (~ (fsm_output[6])) | (~ (fsm_output[5]))
      | (~ (fsm_output[0])) | (fsm_output[1]) | (fsm_output[3]) | (fsm_output[4]);
  assign mux_223_nl = MUX_s_1_2_2(or_333_nl, or_328_nl, fsm_output[8]);
  assign or_601_nl = mux_223_nl | (fsm_output[2]);
  assign or_626_nl = (fsm_output[5]) | (~ (fsm_output[1])) | (fsm_output[4]) | (~
      (fsm_output[3]));
  assign nand_101_nl = ~((fsm_output[5]) & (fsm_output[1]) & (fsm_output[4]) & (~
      (fsm_output[3])));
  assign mux_434_nl = MUX_s_1_2_2(or_626_nl, nand_101_nl, fsm_output[0]);
  assign or_628_nl = (fsm_output[7:6]!=2'b00) | mux_434_nl;
  assign nor_313_nl = ~((fsm_output[0]) | (~ (fsm_output[5])) | (fsm_output[1]) |
      (fsm_output[4]) | (fsm_output[3]));
  assign nor_314_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[5])) | (fsm_output[1])
      | (fsm_output[4]) | (fsm_output[3]));
  assign mux_433_nl = MUX_s_1_2_2(nor_313_nl, nor_314_nl, fsm_output[6]);
  assign nand_102_nl = ~((fsm_output[7]) & mux_433_nl);
  assign mux_435_nl = MUX_s_1_2_2(or_628_nl, nand_102_nl, fsm_output[8]);
  assign nor_171_nl = ~((fsm_output[7:5]!=3'b000) | (~ mux_204_itm));
  assign mux_227_nl = MUX_s_1_2_2(nor_171_nl, and_tmp_6, fsm_output[8]);
  assign and_141_nl = and_dcpl_56 & and_dcpl_27;
  assign r_or_nl = ((~ (modulo_result_rem_cmp_z[63])) & and_144_m1c) | (not_tmp_201
      & (~ (modulo_result_rem_cmp_z[63])));
  assign r_or_1_nl = ((modulo_result_rem_cmp_z[63]) & and_144_m1c) | (not_tmp_201
      & (modulo_result_rem_cmp_z[63]));
  assign and_146_nl = not_tmp_191 & (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b00);
  assign and_148_nl = not_tmp_191 & (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b01);
  assign and_150_nl = not_tmp_191 & (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b10);
  assign and_152_nl = not_tmp_191 & (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b11);
  assign or_99_nl = (~ (fsm_output[0])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[6]);
  assign mux_252_nl = MUX_s_1_2_2(or_107_cse, or_99_nl, fsm_output[1]);
  assign or_379_nl = (~(nor_161_cse | (fsm_output[7]))) | (~ (fsm_output[8])) | (fsm_output[6]);
  assign mux_253_nl = MUX_s_1_2_2(mux_252_nl, or_379_nl, fsm_output[2]);
  assign mux_254_nl = MUX_s_1_2_2(or_107_cse, mux_253_nl, fsm_output[3]);
  assign mux_255_nl = MUX_s_1_2_2(mux_254_nl, or_376_cse, fsm_output[4]);
  assign nand_32_nl = ~((fsm_output[0]) & (~ mux_249_cse));
  assign or_548_nl = (fsm_output[3:1]!=3'b000);
  assign mux_250_nl = MUX_s_1_2_2(nand_32_nl, or_52_cse, or_548_nl);
  assign or_372_nl = (fsm_output[0]) | (fsm_output[7]) | (~ (fsm_output[8])) | (fsm_output[6]);
  assign nand_50_nl = ~((fsm_output[8]) & (fsm_output[6]));
  assign or_370_nl = (~ (fsm_output[0])) | (fsm_output[7]);
  assign mux_245_nl = MUX_s_1_2_2(nand_50_nl, or_tmp_32, or_370_nl);
  assign mux_246_nl = MUX_s_1_2_2(or_372_nl, mux_245_nl, fsm_output[1]);
  assign mux_247_nl = MUX_s_1_2_2(or_52_cse, mux_246_nl, fsm_output[2]);
  assign or_95_nl = (fsm_output[8:6]!=3'b010);
  assign mux_248_nl = MUX_s_1_2_2(mux_247_nl, or_95_nl, fsm_output[3]);
  assign mux_251_nl = MUX_s_1_2_2(mux_250_nl, mux_248_nl, fsm_output[4]);
  assign COMP_LOOP_and_nl = (~ modExp_while_and_5) & not_tmp_215;
  assign COMP_LOOP_and_1_nl = modExp_while_and_5 & not_tmp_215;
  assign nand_83_nl = ~(nand_56_cse & (fsm_output[6]));
  assign mux_283_nl = MUX_s_1_2_2((~ (fsm_output[7])), or_tmp_351, fsm_output[0]);
  assign mux_284_nl = MUX_s_1_2_2(nand_83_nl, mux_283_nl, fsm_output[8]);
  assign mux_281_nl = MUX_s_1_2_2(nor_tmp_87, or_tmp_351, fsm_output[0]);
  assign mux_282_nl = MUX_s_1_2_2((~ mux_281_nl), or_tmp_351, fsm_output[8]);
  assign mux_285_nl = MUX_s_1_2_2(mux_284_nl, mux_282_nl, fsm_output[1]);
  assign mux_286_nl = MUX_s_1_2_2((~ mux_269_itm), mux_285_nl, fsm_output[3]);
  assign mux_278_nl = MUX_s_1_2_2((fsm_output[7]), (~ or_tmp_353), fsm_output[0]);
  assign mux_279_nl = MUX_s_1_2_2(mux_278_nl, (fsm_output[6]), fsm_output[8]);
  assign or_388_nl = (fsm_output[3]) | (fsm_output[1]);
  assign mux_280_nl = MUX_s_1_2_2(mux_279_nl, mux_tmp_268, or_388_nl);
  assign mux_287_nl = MUX_s_1_2_2(mux_286_nl, mux_280_nl, fsm_output[5]);
  assign mux_273_nl = MUX_s_1_2_2((~ or_tmp_353), or_tmp_351, fsm_output[0]);
  assign mux_274_nl = MUX_s_1_2_2(mux_273_nl, or_tmp_349, fsm_output[8]);
  assign mux_275_nl = MUX_s_1_2_2(mux_tmp_268, mux_274_nl, fsm_output[1]);
  assign mux_276_nl = MUX_s_1_2_2(mux_275_nl, mux_tmp_258, fsm_output[3]);
  assign mux_277_nl = MUX_s_1_2_2(mux_tmp_265, mux_276_nl, fsm_output[5]);
  assign mux_288_nl = MUX_s_1_2_2(mux_287_nl, mux_277_nl, fsm_output[4]);
  assign mux_270_nl = MUX_s_1_2_2((~ mux_269_itm), mux_tmp_265, fsm_output[3]);
  assign mux_271_nl = MUX_s_1_2_2(mux_270_nl, mux_tmp_268, fsm_output[5]);
  assign or_386_nl = ((fsm_output[0]) & (fsm_output[7])) | (fsm_output[6]);
  assign mux_264_nl = MUX_s_1_2_2((fsm_output[7]), or_386_nl, fsm_output[8]);
  assign and_210_nl = (fsm_output[3]) & (fsm_output[1]);
  assign mux_266_nl = MUX_s_1_2_2(mux_tmp_265, mux_264_nl, and_210_nl);
  assign mux_261_nl = MUX_s_1_2_2(or_tmp_351, or_384_cse, fsm_output[8]);
  assign mux_259_nl = MUX_s_1_2_2(or_tmp_349, mux_tmp_257, fsm_output[0]);
  assign mux_260_nl = MUX_s_1_2_2(nor_tmp_87, mux_259_nl, fsm_output[8]);
  assign mux_262_nl = MUX_s_1_2_2(mux_261_nl, mux_260_nl, fsm_output[1]);
  assign mux_263_nl = MUX_s_1_2_2(mux_262_nl, mux_tmp_258, fsm_output[3]);
  assign mux_267_nl = MUX_s_1_2_2(mux_266_nl, mux_263_nl, fsm_output[5]);
  assign mux_272_nl = MUX_s_1_2_2(mux_271_nl, mux_267_nl, fsm_output[4]);
  assign mux_289_nl = MUX_s_1_2_2(mux_288_nl, mux_272_nl, fsm_output[2]);
  assign mux_318_nl = MUX_s_1_2_2(not_tmp_130, mux_tmp_170, fsm_output[1]);
  assign nl_COMP_LOOP_1_acc_nl = ({(z_out_3[7:0]) , 2'b00}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))})
      + 10'b0000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[9:0];
  assign nand_48_nl = ~((fsm_output[6:5]==2'b11) & nor_tmp_68);
  assign mux_321_nl = MUX_s_1_2_2(or_tmp_291, nand_48_nl, fsm_output[7]);
  assign or_425_nl = (fsm_output[7]) | and_dcpl_2;
  assign nl_COMP_LOOP_acc_1_cse_sva  = VEC_LOOP_j_sva_11_0 + conv_u2u_9_12({COMP_LOOP_k_9_2_sva_6_0
      , 2'b11});
  assign and_166_nl = (fsm_output[7:6]==2'b11) & or_tmp_269;
  assign mux_391_nl = MUX_s_1_2_2(and_285_cse, (~ or_tmp_251), fsm_output[6]);
  assign nand_39_nl = ~((fsm_output[5]) & or_123_cse);
  assign mux_398_nl = MUX_s_1_2_2(nand_39_nl, or_tmp_255, fsm_output[6]);
  assign nor_125_nl = ~(((fsm_output[3:1]==3'b111)) | (fsm_output[4]));
  assign mux_399_nl = MUX_s_1_2_2(nor_125_nl, nor_tmp_57, fsm_output[5]);
  assign and_188_nl = (fsm_output[6:5]==2'b11) & or_540_cse & (fsm_output[4:3]==2'b11);
  assign nor_124_nl = ~((fsm_output[6:5]!=2'b00) | nor_tmp_104);
  assign mux_400_nl = MUX_s_1_2_2(and_188_nl, nor_124_nl, fsm_output[7]);
  assign COMP_LOOP_mux_22_nl = MUX_v_12_2_2(({5'b00001 , (~ (STAGE_LOOP_lshift_psp_sva[9:3]))}),
      VEC_LOOP_j_sva_11_0, and_dcpl_175);
  assign COMP_LOOP_COMP_LOOP_nand_1_nl = ~(and_dcpl_175 & (~(and_dcpl_170 & (fsm_output[0])
      & (fsm_output[2]) & (fsm_output[4]) & (fsm_output[8]))));
  assign COMP_LOOP_mux_23_nl = MUX_v_9_2_2(({2'b00 , COMP_LOOP_k_9_2_sva_6_0}), ({COMP_LOOP_k_9_2_sva_6_0
      , 2'b01}), and_dcpl_175);
  assign nl_acc_nl = ({COMP_LOOP_mux_22_nl , COMP_LOOP_COMP_LOOP_nand_1_nl}) + conv_u2u_10_13({COMP_LOOP_mux_23_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[12:0];
  assign z_out = readslicef_13_12_1(acc_nl);
  assign not_1275_nl = ~ and_dcpl_183;
  assign operator_64_false_1_and_1_nl = MUX_v_4_2_2(4'b0000, (VEC_LOOP_j_sva_11_0[11:8]),
      not_1275_nl);
  assign operator_64_false_1_operator_64_false_1_or_1_nl = MUX_v_4_2_2(operator_64_false_1_and_1_nl,
      4'b1111, operator_64_false_1_or_itm);
  assign operator_64_false_1_mux1h_9_nl = MUX1HOT_s_1_3_2((~ modExp_exp_1_7_1_sva),
      (VEC_LOOP_j_sva_11_0[7]), (~ modExp_exp_1_1_1_sva), {not_tmp_291 , operator_64_false_1_or_ssc
      , and_dcpl_208});
  assign operator_64_false_1_or_6_nl = operator_64_false_1_mux1h_9_nl | and_dcpl_183;
  assign operator_64_false_1_mux1h_10_nl = MUX1HOT_s_1_4_2((~ (COMP_LOOP_k_9_2_sva_6_0[6])),
      (~ modExp_exp_1_6_1_sva), (VEC_LOOP_j_sva_11_0[6]), (~ modExp_exp_1_7_1_sva),
      {and_dcpl_183 , not_tmp_291 , operator_64_false_1_or_ssc , and_dcpl_208});
  assign operator_64_false_1_mux1h_11_nl = MUX1HOT_s_1_4_2((~ (COMP_LOOP_k_9_2_sva_6_0[5])),
      (~ modExp_exp_1_5_1_sva), (VEC_LOOP_j_sva_11_0[5]), (~ modExp_exp_1_6_1_sva),
      {and_dcpl_183 , not_tmp_291 , operator_64_false_1_or_ssc , and_dcpl_208});
  assign operator_64_false_1_mux1h_12_nl = MUX1HOT_s_1_4_2((~ (COMP_LOOP_k_9_2_sva_6_0[4])),
      (~ modExp_exp_1_4_1_sva), (VEC_LOOP_j_sva_11_0[4]), (~ modExp_exp_1_5_1_sva),
      {and_dcpl_183 , not_tmp_291 , operator_64_false_1_or_ssc , and_dcpl_208});
  assign operator_64_false_1_mux1h_13_nl = MUX1HOT_s_1_4_2((~ (COMP_LOOP_k_9_2_sva_6_0[3])),
      (~ modExp_exp_1_3_1_sva), (VEC_LOOP_j_sva_11_0[3]), (~ modExp_exp_1_4_1_sva),
      {and_dcpl_183 , not_tmp_291 , operator_64_false_1_or_ssc , and_dcpl_208});
  assign operator_64_false_1_mux1h_14_nl = MUX1HOT_s_1_4_2((~ (COMP_LOOP_k_9_2_sva_6_0[2])),
      (~ modExp_exp_1_2_1_sva), (VEC_LOOP_j_sva_11_0[2]), (~ modExp_exp_1_3_1_sva),
      {and_dcpl_183 , not_tmp_291 , operator_64_false_1_or_ssc , and_dcpl_208});
  assign operator_64_false_1_mux1h_15_nl = MUX1HOT_s_1_4_2((~ (COMP_LOOP_k_9_2_sva_6_0[1])),
      (~ modExp_exp_1_1_1_sva), (VEC_LOOP_j_sva_11_0[1]), (~ modExp_exp_1_2_1_sva),
      {and_dcpl_183 , not_tmp_291 , operator_64_false_1_or_ssc , and_dcpl_208});
  assign operator_64_false_1_mux1h_16_nl = MUX1HOT_s_1_3_2((~ (COMP_LOOP_k_9_2_sva_6_0[0])),
      (~ modExp_exp_1_0_1_sva_1), (VEC_LOOP_j_sva_11_0[0]), {and_dcpl_183 , operator_64_false_1_or_itm
      , operator_64_false_1_or_ssc});
  assign and_417_nl = and_dcpl_227 & and_dcpl_212 & (fsm_output[4]) & (~ (fsm_output[6]))
      & (~ (fsm_output[7])) & (fsm_output[8]);
  assign COMP_LOOP_mux_24_nl = MUX_v_2_2_2(2'b10, 2'b01, and_417_nl);
  assign and_418_nl = (~ (fsm_output[5])) & (fsm_output[3]) & (fsm_output[1]) & and_dcpl_212
      & (fsm_output[4]) & (fsm_output[6]) & (~ (fsm_output[7])) & (~ (fsm_output[8]));
  assign COMP_LOOP_COMP_LOOP_nor_4_nl = ~(MUX_v_2_2_2(COMP_LOOP_mux_24_nl, 2'b11,
      and_418_nl));
  assign and_419_nl = and_dcpl_227 & (~((fsm_output[0]) | (fsm_output[2]))) & (~
      (fsm_output[4])) & (~ (fsm_output[6])) & (fsm_output[7]) & (fsm_output[8]);
  assign COMP_LOOP_COMP_LOOP_or_5_nl = MUX_v_2_2_2(COMP_LOOP_COMP_LOOP_nor_4_nl,
      2'b11, and_419_nl);
  assign nl_COMP_LOOP_acc_34_nl = STAGE_LOOP_lshift_psp_sva + conv_u2u_9_10({COMP_LOOP_k_9_2_sva_6_0
      , COMP_LOOP_COMP_LOOP_or_5_nl});
  assign COMP_LOOP_acc_34_nl = nl_COMP_LOOP_acc_34_nl[9:0];
  assign operator_64_false_1_or_7_nl = and_dcpl_183 | not_tmp_291 | and_dcpl_208;
  assign operator_64_false_1_or_8_nl = and_dcpl_188 | and_dcpl_194 | and_dcpl_199
      | and_dcpl_202;
  assign operator_64_false_1_mux1h_17_nl = MUX1HOT_v_10_3_2(10'b0000000001, COMP_LOOP_acc_34_nl,
      STAGE_LOOP_lshift_psp_sva, {operator_64_false_1_or_7_nl , operator_64_false_1_or_8_nl
      , and_dcpl_206});
  assign nl_z_out_1 = conv_u2u_12_13({operator_64_false_1_operator_64_false_1_or_1_nl
      , operator_64_false_1_or_6_nl , operator_64_false_1_mux1h_10_nl , operator_64_false_1_mux1h_11_nl
      , operator_64_false_1_mux1h_12_nl , operator_64_false_1_mux1h_13_nl , operator_64_false_1_mux1h_14_nl
      , operator_64_false_1_mux1h_15_nl , operator_64_false_1_mux1h_16_nl}) + conv_u2u_10_13(operator_64_false_1_mux1h_17_nl);
  assign z_out_1 = nl_z_out_1[12:0];
  assign COMP_LOOP_COMP_LOOP_or_6_nl = (~(and_dcpl_242 | and_dcpl_249 | and_dcpl_256
      | and_dcpl_267)) | and_dcpl_261 | and_dcpl_268;
  assign COMP_LOOP_COMP_LOOP_or_7_nl = (~((operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm[63])
      | and_dcpl_242 | and_dcpl_249 | and_dcpl_256 | and_dcpl_267)) | and_dcpl_261;
  assign COMP_LOOP_mux_25_nl = MUX_v_52_2_2((operator_64_false_acc_mut_63_0[62:11]),
      (operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm[62:11]), and_dcpl_268);
  assign COMP_LOOP_or_27_nl = and_dcpl_242 | and_dcpl_249 | and_dcpl_256 | and_dcpl_267;
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl = ~(MUX_v_52_2_2(COMP_LOOP_mux_25_nl,
      52'b1111111111111111111111111111111111111111111111111111, COMP_LOOP_or_27_nl));
  assign COMP_LOOP_mux1h_75_nl = MUX1HOT_v_2_4_2((~ (VEC_LOOP_j_sva_11_0[11:10])),
      2'b10, (operator_64_false_acc_mut_63_0[10:9]), (operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm[10:9]),
      {and_dcpl_242 , COMP_LOOP_or_20_itm , and_dcpl_261 , and_dcpl_268});
  assign COMP_LOOP_COMP_LOOP_nor_6_nl = ~(MUX_v_2_2_2(COMP_LOOP_mux1h_75_nl, 2'b11,
      and_dcpl_267));
  assign COMP_LOOP_mux1h_76_nl = MUX1HOT_v_9_5_2((VEC_LOOP_j_sva_11_0[9:1]), (~ (STAGE_LOOP_lshift_psp_sva[9:1])),
      (~ (operator_64_false_acc_mut_63_0[8:0])), ({2'b00 , COMP_LOOP_k_9_2_sva_6_0}),
      (~ (operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm[8:0])), {and_dcpl_242
      , COMP_LOOP_or_20_itm , and_dcpl_261 , and_dcpl_267 , and_dcpl_268});
  assign COMP_LOOP_or_28_nl = (~(and_dcpl_242 | and_dcpl_261 | and_dcpl_267 | and_dcpl_268))
      | and_dcpl_249 | and_dcpl_256;
  assign COMP_LOOP_COMP_LOOP_mux_2_nl = MUX_v_7_2_2(({1'b0 , (COMP_LOOP_k_9_2_sva_6_0[6:1])}),
      COMP_LOOP_k_9_2_sva_6_0, COMP_LOOP_or_20_itm);
  assign COMP_LOOP_not_101_nl = ~ COMP_LOOP_or_ssc;
  assign COMP_LOOP_and_17_nl = MUX_v_7_2_2(7'b0000000, COMP_LOOP_COMP_LOOP_mux_2_nl,
      COMP_LOOP_not_101_nl);
  assign COMP_LOOP_COMP_LOOP_or_8_nl = ((COMP_LOOP_k_9_2_sva_6_0[0]) & (~(and_dcpl_249
      | COMP_LOOP_or_ssc))) | and_dcpl_256;
  assign COMP_LOOP_COMP_LOOP_or_9_nl = (~ and_dcpl_256) | and_dcpl_242 | and_dcpl_249
      | COMP_LOOP_or_ssc;
  assign nl_acc_3_nl = ({COMP_LOOP_COMP_LOOP_or_6_nl , COMP_LOOP_COMP_LOOP_or_7_nl
      , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl , COMP_LOOP_COMP_LOOP_nor_6_nl , COMP_LOOP_mux1h_76_nl
      , COMP_LOOP_or_28_nl}) + conv_u2u_10_66({COMP_LOOP_and_17_nl , COMP_LOOP_COMP_LOOP_or_8_nl
      , COMP_LOOP_COMP_LOOP_or_9_nl , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[65:0];
  assign z_out_3 = readslicef_66_65_1(acc_3_nl);
  assign and_420_nl = (fsm_output[4:0]==5'b01011) & and_dcpl_26 & and_dcpl_25;
  assign or_632_nl = (fsm_output[1]) | (fsm_output[6]) | (~ (fsm_output[3])) | (fsm_output[0])
      | (fsm_output[5]);
  assign nor_323_nl = ~((fsm_output[8]) | (fsm_output[3]) | not_tmp_289);
  assign nor_324_nl = ~((~ (fsm_output[8])) | (fsm_output[3]) | not_tmp_289);
  assign mux_438_nl = MUX_s_1_2_2(nor_323_nl, nor_324_nl, fsm_output[6]);
  assign nand_105_nl = ~((fsm_output[1]) & mux_438_nl);
  assign mux_437_nl = MUX_s_1_2_2(or_632_nl, nand_105_nl, fsm_output[4]);
  assign nor_322_nl = ~((fsm_output[7]) | mux_437_nl);
  assign mux_436_nl = MUX_s_1_2_2(nor_287_cse, nor_322_nl, fsm_output[2]);
  assign or_633_nl = (fsm_output[0]) | (~((fsm_output[7:6]==2'b11)));
  assign mux_440_nl = MUX_s_1_2_2(or_633_nl, or_384_cse, fsm_output[8]);
  assign nor_325_nl = ~((fsm_output[4:1]!=4'b0110) | mux_440_nl);
  assign or_634_nl = (fsm_output[8]) | (~ (fsm_output[0])) | (~ (fsm_output[6]))
      | (fsm_output[7]);
  assign or_635_nl = (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[7]));
  assign mux_443_nl = MUX_s_1_2_2(or_634_nl, or_635_nl, fsm_output[1]);
  assign nor_326_nl = ~((fsm_output[4]) | mux_443_nl);
  assign nor_327_nl = ~((~ (fsm_output[4])) | (fsm_output[1]) | (~ (fsm_output[8]))
      | (fsm_output[0]) | (~ (fsm_output[6])) | (fsm_output[7]));
  assign mux_442_nl = MUX_s_1_2_2(nor_326_nl, nor_327_nl, fsm_output[3]);
  assign or_636_nl = (fsm_output[0]) | (fsm_output[6]) | (fsm_output[7]);
  assign mux_444_nl = MUX_s_1_2_2(or_636_nl, or_384_cse, fsm_output[8]);
  assign nor_328_nl = ~((fsm_output[3]) | (~ (fsm_output[4])) | (~ (fsm_output[1]))
      | mux_444_nl);
  assign mux_441_nl = MUX_s_1_2_2(mux_442_nl, nor_328_nl, fsm_output[2]);
  assign mux_439_nl = MUX_s_1_2_2(nor_325_nl, mux_441_nl, fsm_output[5]);
  assign modExp_while_if_mux1h_2_nl = MUX1HOT_v_64_3_2(modExp_result_sva, modExp_base_1_sva,
      COMP_LOOP_1_acc_5_mut, {and_420_nl , mux_436_nl , mux_439_nl});
  assign nl_z_out_4 = modExp_while_if_mux1h_2_nl * modExp_base_1_sva;
  assign z_out_4 = nl_z_out_4[63:0];

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


  function automatic [63:0] MUX1HOT_v_64_18_2;
    input [63:0] input_17;
    input [63:0] input_16;
    input [63:0] input_15;
    input [63:0] input_14;
    input [63:0] input_13;
    input [63:0] input_12;
    input [63:0] input_11;
    input [63:0] input_10;
    input [63:0] input_9;
    input [63:0] input_8;
    input [63:0] input_7;
    input [63:0] input_6;
    input [63:0] input_5;
    input [63:0] input_4;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [17:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    result = result | ( input_3 & {64{sel[3]}});
    result = result | ( input_4 & {64{sel[4]}});
    result = result | ( input_5 & {64{sel[5]}});
    result = result | ( input_6 & {64{sel[6]}});
    result = result | ( input_7 & {64{sel[7]}});
    result = result | ( input_8 & {64{sel[8]}});
    result = result | ( input_9 & {64{sel[9]}});
    result = result | ( input_10 & {64{sel[10]}});
    result = result | ( input_11 & {64{sel[11]}});
    result = result | ( input_12 & {64{sel[12]}});
    result = result | ( input_13 & {64{sel[13]}});
    result = result | ( input_14 & {64{sel[14]}});
    result = result | ( input_15 & {64{sel[15]}});
    result = result | ( input_16 & {64{sel[16]}});
    result = result | ( input_17 & {64{sel[17]}});
    MUX1HOT_v_64_18_2 = result;
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


  function automatic [63:0] MUX1HOT_v_64_8_2;
    input [63:0] input_7;
    input [63:0] input_6;
    input [63:0] input_5;
    input [63:0] input_4;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [7:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    result = result | ( input_3 & {64{sel[3]}});
    result = result | ( input_4 & {64{sel[4]}});
    result = result | ( input_5 & {64{sel[5]}});
    result = result | ( input_6 & {64{sel[6]}});
    result = result | ( input_7 & {64{sel[7]}});
    MUX1HOT_v_64_8_2 = result;
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


  function automatic [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
  end
  endfunction


  function automatic [11:0] readslicef_13_12_1;
    input [12:0] vector;
    reg [12:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_13_12_1 = tmp[11:0];
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


  function automatic [64:0] conv_u2s_64_65 ;
    input [63:0]  vector ;
  begin
    conv_u2s_64_65 =  {1'b0, vector};
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT
// ------------------------------------------------------------------


module inPlaceNTT_DIT (
  clk, rst, vec_rsc_0_0_adra, vec_rsc_0_0_da, vec_rsc_0_0_wea, vec_rsc_0_0_qa, vec_rsc_triosy_0_0_lz,
      vec_rsc_0_1_adra, vec_rsc_0_1_da, vec_rsc_0_1_wea, vec_rsc_0_1_qa, vec_rsc_triosy_0_1_lz,
      vec_rsc_0_2_adra, vec_rsc_0_2_da, vec_rsc_0_2_wea, vec_rsc_0_2_qa, vec_rsc_triosy_0_2_lz,
      vec_rsc_0_3_adra, vec_rsc_0_3_da, vec_rsc_0_3_wea, vec_rsc_0_3_qa, vec_rsc_triosy_0_3_lz,
      p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz
);
  input clk;
  input rst;
  output [9:0] vec_rsc_0_0_adra;
  output [63:0] vec_rsc_0_0_da;
  output vec_rsc_0_0_wea;
  input [63:0] vec_rsc_0_0_qa;
  output vec_rsc_triosy_0_0_lz;
  output [9:0] vec_rsc_0_1_adra;
  output [63:0] vec_rsc_0_1_da;
  output vec_rsc_0_1_wea;
  input [63:0] vec_rsc_0_1_qa;
  output vec_rsc_triosy_0_1_lz;
  output [9:0] vec_rsc_0_2_adra;
  output [63:0] vec_rsc_0_2_da;
  output vec_rsc_0_2_wea;
  input [63:0] vec_rsc_0_2_qa;
  output vec_rsc_triosy_0_2_lz;
  output [9:0] vec_rsc_0_3_adra;
  output [63:0] vec_rsc_0_3_da;
  output vec_rsc_0_3_wea;
  input [63:0] vec_rsc_0_3_qa;
  output vec_rsc_triosy_0_3_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;


  // Interconnect Declarations
  wire [63:0] vec_rsc_0_0_i_qa_d;
  wire vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_1_i_qa_d;
  wire vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_2_i_qa_d;
  wire vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_3_i_qa_d;
  wire vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [9:0] vec_rsc_0_0_i_adra_d_iff;
  wire [63:0] vec_rsc_0_0_i_da_d_iff;
  wire vec_rsc_0_0_i_wea_d_iff;
  wire vec_rsc_0_1_i_wea_d_iff;
  wire vec_rsc_0_2_i_wea_d_iff;
  wire vec_rsc_0_3_i_wea_d_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
      vec_rsc_0_2_i (
      .qa(vec_rsc_0_2_qa),
      .wea(vec_rsc_0_2_wea),
      .da(vec_rsc_0_2_da),
      .adra(vec_rsc_0_2_adra),
      .adra_d(vec_rsc_0_0_i_adra_d_iff),
      .da_d(vec_rsc_0_0_i_da_d_iff),
      .qa_d(vec_rsc_0_2_i_qa_d),
      .wea_d(vec_rsc_0_2_i_wea_d_iff),
      .rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_2_i_wea_d_iff)
    );
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
      vec_rsc_0_3_i (
      .qa(vec_rsc_0_3_qa),
      .wea(vec_rsc_0_3_wea),
      .da(vec_rsc_0_3_da),
      .adra(vec_rsc_0_3_adra),
      .adra_d(vec_rsc_0_0_i_adra_d_iff),
      .da_d(vec_rsc_0_0_i_da_d_iff),
      .qa_d(vec_rsc_0_3_i_qa_d),
      .wea_d(vec_rsc_0_3_i_wea_d_iff),
      .rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_3_i_wea_d_iff)
    );
  inPlaceNTT_DIT_core inPlaceNTT_DIT_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .vec_rsc_triosy_0_2_lz(vec_rsc_triosy_0_2_lz),
      .vec_rsc_triosy_0_3_lz(vec_rsc_triosy_0_3_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_dat(r_rsc_dat),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .vec_rsc_0_0_i_qa_d(vec_rsc_0_0_i_qa_d),
      .vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_1_i_qa_d(vec_rsc_0_1_i_qa_d),
      .vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_2_i_qa_d(vec_rsc_0_2_i_qa_d),
      .vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_3_i_qa_d(vec_rsc_0_3_i_qa_d),
      .vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_0_i_adra_d_pff(vec_rsc_0_0_i_adra_d_iff),
      .vec_rsc_0_0_i_da_d_pff(vec_rsc_0_0_i_da_d_iff),
      .vec_rsc_0_0_i_wea_d_pff(vec_rsc_0_0_i_wea_d_iff),
      .vec_rsc_0_1_i_wea_d_pff(vec_rsc_0_1_i_wea_d_iff),
      .vec_rsc_0_2_i_wea_d_pff(vec_rsc_0_2_i_wea_d_iff),
      .vec_rsc_0_3_i_wea_d_pff(vec_rsc_0_3_i_wea_d_iff)
    );
endmodule



