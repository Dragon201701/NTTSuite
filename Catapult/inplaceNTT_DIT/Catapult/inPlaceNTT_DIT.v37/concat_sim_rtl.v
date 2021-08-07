
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
//  Generated date: Wed Jun 30 21:18:09 2021
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
  clk, rst, fsm_output, STAGE_LOOP_C_8_tr0, modExp_while_C_40_tr0, COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_40_tr0, COMP_LOOP_C_65_tr0, COMP_LOOP_2_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_130_tr0, COMP_LOOP_3_modExp_1_while_C_40_tr0, COMP_LOOP_C_195_tr0,
      COMP_LOOP_4_modExp_1_while_C_40_tr0, COMP_LOOP_C_260_tr0, VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_9_tr0
);
  input clk;
  input rst;
  output [8:0] fsm_output;
  reg [8:0] fsm_output;
  input STAGE_LOOP_C_8_tr0;
  input modExp_while_C_40_tr0;
  input COMP_LOOP_C_1_tr0;
  input COMP_LOOP_1_modExp_1_while_C_40_tr0;
  input COMP_LOOP_C_65_tr0;
  input COMP_LOOP_2_modExp_1_while_C_40_tr0;
  input COMP_LOOP_C_130_tr0;
  input COMP_LOOP_3_modExp_1_while_C_40_tr0;
  input COMP_LOOP_C_195_tr0;
  input COMP_LOOP_4_modExp_1_while_C_40_tr0;
  input COMP_LOOP_C_260_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_9_tr0;


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
    modExp_while_C_0 = 9'd10,
    modExp_while_C_1 = 9'd11,
    modExp_while_C_2 = 9'd12,
    modExp_while_C_3 = 9'd13,
    modExp_while_C_4 = 9'd14,
    modExp_while_C_5 = 9'd15,
    modExp_while_C_6 = 9'd16,
    modExp_while_C_7 = 9'd17,
    modExp_while_C_8 = 9'd18,
    modExp_while_C_9 = 9'd19,
    modExp_while_C_10 = 9'd20,
    modExp_while_C_11 = 9'd21,
    modExp_while_C_12 = 9'd22,
    modExp_while_C_13 = 9'd23,
    modExp_while_C_14 = 9'd24,
    modExp_while_C_15 = 9'd25,
    modExp_while_C_16 = 9'd26,
    modExp_while_C_17 = 9'd27,
    modExp_while_C_18 = 9'd28,
    modExp_while_C_19 = 9'd29,
    modExp_while_C_20 = 9'd30,
    modExp_while_C_21 = 9'd31,
    modExp_while_C_22 = 9'd32,
    modExp_while_C_23 = 9'd33,
    modExp_while_C_24 = 9'd34,
    modExp_while_C_25 = 9'd35,
    modExp_while_C_26 = 9'd36,
    modExp_while_C_27 = 9'd37,
    modExp_while_C_28 = 9'd38,
    modExp_while_C_29 = 9'd39,
    modExp_while_C_30 = 9'd40,
    modExp_while_C_31 = 9'd41,
    modExp_while_C_32 = 9'd42,
    modExp_while_C_33 = 9'd43,
    modExp_while_C_34 = 9'd44,
    modExp_while_C_35 = 9'd45,
    modExp_while_C_36 = 9'd46,
    modExp_while_C_37 = 9'd47,
    modExp_while_C_38 = 9'd48,
    modExp_while_C_39 = 9'd49,
    modExp_while_C_40 = 9'd50,
    COMP_LOOP_C_0 = 9'd51,
    COMP_LOOP_C_1 = 9'd52,
    COMP_LOOP_1_modExp_1_while_C_0 = 9'd53,
    COMP_LOOP_1_modExp_1_while_C_1 = 9'd54,
    COMP_LOOP_1_modExp_1_while_C_2 = 9'd55,
    COMP_LOOP_1_modExp_1_while_C_3 = 9'd56,
    COMP_LOOP_1_modExp_1_while_C_4 = 9'd57,
    COMP_LOOP_1_modExp_1_while_C_5 = 9'd58,
    COMP_LOOP_1_modExp_1_while_C_6 = 9'd59,
    COMP_LOOP_1_modExp_1_while_C_7 = 9'd60,
    COMP_LOOP_1_modExp_1_while_C_8 = 9'd61,
    COMP_LOOP_1_modExp_1_while_C_9 = 9'd62,
    COMP_LOOP_1_modExp_1_while_C_10 = 9'd63,
    COMP_LOOP_1_modExp_1_while_C_11 = 9'd64,
    COMP_LOOP_1_modExp_1_while_C_12 = 9'd65,
    COMP_LOOP_1_modExp_1_while_C_13 = 9'd66,
    COMP_LOOP_1_modExp_1_while_C_14 = 9'd67,
    COMP_LOOP_1_modExp_1_while_C_15 = 9'd68,
    COMP_LOOP_1_modExp_1_while_C_16 = 9'd69,
    COMP_LOOP_1_modExp_1_while_C_17 = 9'd70,
    COMP_LOOP_1_modExp_1_while_C_18 = 9'd71,
    COMP_LOOP_1_modExp_1_while_C_19 = 9'd72,
    COMP_LOOP_1_modExp_1_while_C_20 = 9'd73,
    COMP_LOOP_1_modExp_1_while_C_21 = 9'd74,
    COMP_LOOP_1_modExp_1_while_C_22 = 9'd75,
    COMP_LOOP_1_modExp_1_while_C_23 = 9'd76,
    COMP_LOOP_1_modExp_1_while_C_24 = 9'd77,
    COMP_LOOP_1_modExp_1_while_C_25 = 9'd78,
    COMP_LOOP_1_modExp_1_while_C_26 = 9'd79,
    COMP_LOOP_1_modExp_1_while_C_27 = 9'd80,
    COMP_LOOP_1_modExp_1_while_C_28 = 9'd81,
    COMP_LOOP_1_modExp_1_while_C_29 = 9'd82,
    COMP_LOOP_1_modExp_1_while_C_30 = 9'd83,
    COMP_LOOP_1_modExp_1_while_C_31 = 9'd84,
    COMP_LOOP_1_modExp_1_while_C_32 = 9'd85,
    COMP_LOOP_1_modExp_1_while_C_33 = 9'd86,
    COMP_LOOP_1_modExp_1_while_C_34 = 9'd87,
    COMP_LOOP_1_modExp_1_while_C_35 = 9'd88,
    COMP_LOOP_1_modExp_1_while_C_36 = 9'd89,
    COMP_LOOP_1_modExp_1_while_C_37 = 9'd90,
    COMP_LOOP_1_modExp_1_while_C_38 = 9'd91,
    COMP_LOOP_1_modExp_1_while_C_39 = 9'd92,
    COMP_LOOP_1_modExp_1_while_C_40 = 9'd93,
    COMP_LOOP_C_2 = 9'd94,
    COMP_LOOP_C_3 = 9'd95,
    COMP_LOOP_C_4 = 9'd96,
    COMP_LOOP_C_5 = 9'd97,
    COMP_LOOP_C_6 = 9'd98,
    COMP_LOOP_C_7 = 9'd99,
    COMP_LOOP_C_8 = 9'd100,
    COMP_LOOP_C_9 = 9'd101,
    COMP_LOOP_C_10 = 9'd102,
    COMP_LOOP_C_11 = 9'd103,
    COMP_LOOP_C_12 = 9'd104,
    COMP_LOOP_C_13 = 9'd105,
    COMP_LOOP_C_14 = 9'd106,
    COMP_LOOP_C_15 = 9'd107,
    COMP_LOOP_C_16 = 9'd108,
    COMP_LOOP_C_17 = 9'd109,
    COMP_LOOP_C_18 = 9'd110,
    COMP_LOOP_C_19 = 9'd111,
    COMP_LOOP_C_20 = 9'd112,
    COMP_LOOP_C_21 = 9'd113,
    COMP_LOOP_C_22 = 9'd114,
    COMP_LOOP_C_23 = 9'd115,
    COMP_LOOP_C_24 = 9'd116,
    COMP_LOOP_C_25 = 9'd117,
    COMP_LOOP_C_26 = 9'd118,
    COMP_LOOP_C_27 = 9'd119,
    COMP_LOOP_C_28 = 9'd120,
    COMP_LOOP_C_29 = 9'd121,
    COMP_LOOP_C_30 = 9'd122,
    COMP_LOOP_C_31 = 9'd123,
    COMP_LOOP_C_32 = 9'd124,
    COMP_LOOP_C_33 = 9'd125,
    COMP_LOOP_C_34 = 9'd126,
    COMP_LOOP_C_35 = 9'd127,
    COMP_LOOP_C_36 = 9'd128,
    COMP_LOOP_C_37 = 9'd129,
    COMP_LOOP_C_38 = 9'd130,
    COMP_LOOP_C_39 = 9'd131,
    COMP_LOOP_C_40 = 9'd132,
    COMP_LOOP_C_41 = 9'd133,
    COMP_LOOP_C_42 = 9'd134,
    COMP_LOOP_C_43 = 9'd135,
    COMP_LOOP_C_44 = 9'd136,
    COMP_LOOP_C_45 = 9'd137,
    COMP_LOOP_C_46 = 9'd138,
    COMP_LOOP_C_47 = 9'd139,
    COMP_LOOP_C_48 = 9'd140,
    COMP_LOOP_C_49 = 9'd141,
    COMP_LOOP_C_50 = 9'd142,
    COMP_LOOP_C_51 = 9'd143,
    COMP_LOOP_C_52 = 9'd144,
    COMP_LOOP_C_53 = 9'd145,
    COMP_LOOP_C_54 = 9'd146,
    COMP_LOOP_C_55 = 9'd147,
    COMP_LOOP_C_56 = 9'd148,
    COMP_LOOP_C_57 = 9'd149,
    COMP_LOOP_C_58 = 9'd150,
    COMP_LOOP_C_59 = 9'd151,
    COMP_LOOP_C_60 = 9'd152,
    COMP_LOOP_C_61 = 9'd153,
    COMP_LOOP_C_62 = 9'd154,
    COMP_LOOP_C_63 = 9'd155,
    COMP_LOOP_C_64 = 9'd156,
    COMP_LOOP_C_65 = 9'd157,
    COMP_LOOP_C_66 = 9'd158,
    COMP_LOOP_2_modExp_1_while_C_0 = 9'd159,
    COMP_LOOP_2_modExp_1_while_C_1 = 9'd160,
    COMP_LOOP_2_modExp_1_while_C_2 = 9'd161,
    COMP_LOOP_2_modExp_1_while_C_3 = 9'd162,
    COMP_LOOP_2_modExp_1_while_C_4 = 9'd163,
    COMP_LOOP_2_modExp_1_while_C_5 = 9'd164,
    COMP_LOOP_2_modExp_1_while_C_6 = 9'd165,
    COMP_LOOP_2_modExp_1_while_C_7 = 9'd166,
    COMP_LOOP_2_modExp_1_while_C_8 = 9'd167,
    COMP_LOOP_2_modExp_1_while_C_9 = 9'd168,
    COMP_LOOP_2_modExp_1_while_C_10 = 9'd169,
    COMP_LOOP_2_modExp_1_while_C_11 = 9'd170,
    COMP_LOOP_2_modExp_1_while_C_12 = 9'd171,
    COMP_LOOP_2_modExp_1_while_C_13 = 9'd172,
    COMP_LOOP_2_modExp_1_while_C_14 = 9'd173,
    COMP_LOOP_2_modExp_1_while_C_15 = 9'd174,
    COMP_LOOP_2_modExp_1_while_C_16 = 9'd175,
    COMP_LOOP_2_modExp_1_while_C_17 = 9'd176,
    COMP_LOOP_2_modExp_1_while_C_18 = 9'd177,
    COMP_LOOP_2_modExp_1_while_C_19 = 9'd178,
    COMP_LOOP_2_modExp_1_while_C_20 = 9'd179,
    COMP_LOOP_2_modExp_1_while_C_21 = 9'd180,
    COMP_LOOP_2_modExp_1_while_C_22 = 9'd181,
    COMP_LOOP_2_modExp_1_while_C_23 = 9'd182,
    COMP_LOOP_2_modExp_1_while_C_24 = 9'd183,
    COMP_LOOP_2_modExp_1_while_C_25 = 9'd184,
    COMP_LOOP_2_modExp_1_while_C_26 = 9'd185,
    COMP_LOOP_2_modExp_1_while_C_27 = 9'd186,
    COMP_LOOP_2_modExp_1_while_C_28 = 9'd187,
    COMP_LOOP_2_modExp_1_while_C_29 = 9'd188,
    COMP_LOOP_2_modExp_1_while_C_30 = 9'd189,
    COMP_LOOP_2_modExp_1_while_C_31 = 9'd190,
    COMP_LOOP_2_modExp_1_while_C_32 = 9'd191,
    COMP_LOOP_2_modExp_1_while_C_33 = 9'd192,
    COMP_LOOP_2_modExp_1_while_C_34 = 9'd193,
    COMP_LOOP_2_modExp_1_while_C_35 = 9'd194,
    COMP_LOOP_2_modExp_1_while_C_36 = 9'd195,
    COMP_LOOP_2_modExp_1_while_C_37 = 9'd196,
    COMP_LOOP_2_modExp_1_while_C_38 = 9'd197,
    COMP_LOOP_2_modExp_1_while_C_39 = 9'd198,
    COMP_LOOP_2_modExp_1_while_C_40 = 9'd199,
    COMP_LOOP_C_67 = 9'd200,
    COMP_LOOP_C_68 = 9'd201,
    COMP_LOOP_C_69 = 9'd202,
    COMP_LOOP_C_70 = 9'd203,
    COMP_LOOP_C_71 = 9'd204,
    COMP_LOOP_C_72 = 9'd205,
    COMP_LOOP_C_73 = 9'd206,
    COMP_LOOP_C_74 = 9'd207,
    COMP_LOOP_C_75 = 9'd208,
    COMP_LOOP_C_76 = 9'd209,
    COMP_LOOP_C_77 = 9'd210,
    COMP_LOOP_C_78 = 9'd211,
    COMP_LOOP_C_79 = 9'd212,
    COMP_LOOP_C_80 = 9'd213,
    COMP_LOOP_C_81 = 9'd214,
    COMP_LOOP_C_82 = 9'd215,
    COMP_LOOP_C_83 = 9'd216,
    COMP_LOOP_C_84 = 9'd217,
    COMP_LOOP_C_85 = 9'd218,
    COMP_LOOP_C_86 = 9'd219,
    COMP_LOOP_C_87 = 9'd220,
    COMP_LOOP_C_88 = 9'd221,
    COMP_LOOP_C_89 = 9'd222,
    COMP_LOOP_C_90 = 9'd223,
    COMP_LOOP_C_91 = 9'd224,
    COMP_LOOP_C_92 = 9'd225,
    COMP_LOOP_C_93 = 9'd226,
    COMP_LOOP_C_94 = 9'd227,
    COMP_LOOP_C_95 = 9'd228,
    COMP_LOOP_C_96 = 9'd229,
    COMP_LOOP_C_97 = 9'd230,
    COMP_LOOP_C_98 = 9'd231,
    COMP_LOOP_C_99 = 9'd232,
    COMP_LOOP_C_100 = 9'd233,
    COMP_LOOP_C_101 = 9'd234,
    COMP_LOOP_C_102 = 9'd235,
    COMP_LOOP_C_103 = 9'd236,
    COMP_LOOP_C_104 = 9'd237,
    COMP_LOOP_C_105 = 9'd238,
    COMP_LOOP_C_106 = 9'd239,
    COMP_LOOP_C_107 = 9'd240,
    COMP_LOOP_C_108 = 9'd241,
    COMP_LOOP_C_109 = 9'd242,
    COMP_LOOP_C_110 = 9'd243,
    COMP_LOOP_C_111 = 9'd244,
    COMP_LOOP_C_112 = 9'd245,
    COMP_LOOP_C_113 = 9'd246,
    COMP_LOOP_C_114 = 9'd247,
    COMP_LOOP_C_115 = 9'd248,
    COMP_LOOP_C_116 = 9'd249,
    COMP_LOOP_C_117 = 9'd250,
    COMP_LOOP_C_118 = 9'd251,
    COMP_LOOP_C_119 = 9'd252,
    COMP_LOOP_C_120 = 9'd253,
    COMP_LOOP_C_121 = 9'd254,
    COMP_LOOP_C_122 = 9'd255,
    COMP_LOOP_C_123 = 9'd256,
    COMP_LOOP_C_124 = 9'd257,
    COMP_LOOP_C_125 = 9'd258,
    COMP_LOOP_C_126 = 9'd259,
    COMP_LOOP_C_127 = 9'd260,
    COMP_LOOP_C_128 = 9'd261,
    COMP_LOOP_C_129 = 9'd262,
    COMP_LOOP_C_130 = 9'd263,
    COMP_LOOP_C_131 = 9'd264,
    COMP_LOOP_3_modExp_1_while_C_0 = 9'd265,
    COMP_LOOP_3_modExp_1_while_C_1 = 9'd266,
    COMP_LOOP_3_modExp_1_while_C_2 = 9'd267,
    COMP_LOOP_3_modExp_1_while_C_3 = 9'd268,
    COMP_LOOP_3_modExp_1_while_C_4 = 9'd269,
    COMP_LOOP_3_modExp_1_while_C_5 = 9'd270,
    COMP_LOOP_3_modExp_1_while_C_6 = 9'd271,
    COMP_LOOP_3_modExp_1_while_C_7 = 9'd272,
    COMP_LOOP_3_modExp_1_while_C_8 = 9'd273,
    COMP_LOOP_3_modExp_1_while_C_9 = 9'd274,
    COMP_LOOP_3_modExp_1_while_C_10 = 9'd275,
    COMP_LOOP_3_modExp_1_while_C_11 = 9'd276,
    COMP_LOOP_3_modExp_1_while_C_12 = 9'd277,
    COMP_LOOP_3_modExp_1_while_C_13 = 9'd278,
    COMP_LOOP_3_modExp_1_while_C_14 = 9'd279,
    COMP_LOOP_3_modExp_1_while_C_15 = 9'd280,
    COMP_LOOP_3_modExp_1_while_C_16 = 9'd281,
    COMP_LOOP_3_modExp_1_while_C_17 = 9'd282,
    COMP_LOOP_3_modExp_1_while_C_18 = 9'd283,
    COMP_LOOP_3_modExp_1_while_C_19 = 9'd284,
    COMP_LOOP_3_modExp_1_while_C_20 = 9'd285,
    COMP_LOOP_3_modExp_1_while_C_21 = 9'd286,
    COMP_LOOP_3_modExp_1_while_C_22 = 9'd287,
    COMP_LOOP_3_modExp_1_while_C_23 = 9'd288,
    COMP_LOOP_3_modExp_1_while_C_24 = 9'd289,
    COMP_LOOP_3_modExp_1_while_C_25 = 9'd290,
    COMP_LOOP_3_modExp_1_while_C_26 = 9'd291,
    COMP_LOOP_3_modExp_1_while_C_27 = 9'd292,
    COMP_LOOP_3_modExp_1_while_C_28 = 9'd293,
    COMP_LOOP_3_modExp_1_while_C_29 = 9'd294,
    COMP_LOOP_3_modExp_1_while_C_30 = 9'd295,
    COMP_LOOP_3_modExp_1_while_C_31 = 9'd296,
    COMP_LOOP_3_modExp_1_while_C_32 = 9'd297,
    COMP_LOOP_3_modExp_1_while_C_33 = 9'd298,
    COMP_LOOP_3_modExp_1_while_C_34 = 9'd299,
    COMP_LOOP_3_modExp_1_while_C_35 = 9'd300,
    COMP_LOOP_3_modExp_1_while_C_36 = 9'd301,
    COMP_LOOP_3_modExp_1_while_C_37 = 9'd302,
    COMP_LOOP_3_modExp_1_while_C_38 = 9'd303,
    COMP_LOOP_3_modExp_1_while_C_39 = 9'd304,
    COMP_LOOP_3_modExp_1_while_C_40 = 9'd305,
    COMP_LOOP_C_132 = 9'd306,
    COMP_LOOP_C_133 = 9'd307,
    COMP_LOOP_C_134 = 9'd308,
    COMP_LOOP_C_135 = 9'd309,
    COMP_LOOP_C_136 = 9'd310,
    COMP_LOOP_C_137 = 9'd311,
    COMP_LOOP_C_138 = 9'd312,
    COMP_LOOP_C_139 = 9'd313,
    COMP_LOOP_C_140 = 9'd314,
    COMP_LOOP_C_141 = 9'd315,
    COMP_LOOP_C_142 = 9'd316,
    COMP_LOOP_C_143 = 9'd317,
    COMP_LOOP_C_144 = 9'd318,
    COMP_LOOP_C_145 = 9'd319,
    COMP_LOOP_C_146 = 9'd320,
    COMP_LOOP_C_147 = 9'd321,
    COMP_LOOP_C_148 = 9'd322,
    COMP_LOOP_C_149 = 9'd323,
    COMP_LOOP_C_150 = 9'd324,
    COMP_LOOP_C_151 = 9'd325,
    COMP_LOOP_C_152 = 9'd326,
    COMP_LOOP_C_153 = 9'd327,
    COMP_LOOP_C_154 = 9'd328,
    COMP_LOOP_C_155 = 9'd329,
    COMP_LOOP_C_156 = 9'd330,
    COMP_LOOP_C_157 = 9'd331,
    COMP_LOOP_C_158 = 9'd332,
    COMP_LOOP_C_159 = 9'd333,
    COMP_LOOP_C_160 = 9'd334,
    COMP_LOOP_C_161 = 9'd335,
    COMP_LOOP_C_162 = 9'd336,
    COMP_LOOP_C_163 = 9'd337,
    COMP_LOOP_C_164 = 9'd338,
    COMP_LOOP_C_165 = 9'd339,
    COMP_LOOP_C_166 = 9'd340,
    COMP_LOOP_C_167 = 9'd341,
    COMP_LOOP_C_168 = 9'd342,
    COMP_LOOP_C_169 = 9'd343,
    COMP_LOOP_C_170 = 9'd344,
    COMP_LOOP_C_171 = 9'd345,
    COMP_LOOP_C_172 = 9'd346,
    COMP_LOOP_C_173 = 9'd347,
    COMP_LOOP_C_174 = 9'd348,
    COMP_LOOP_C_175 = 9'd349,
    COMP_LOOP_C_176 = 9'd350,
    COMP_LOOP_C_177 = 9'd351,
    COMP_LOOP_C_178 = 9'd352,
    COMP_LOOP_C_179 = 9'd353,
    COMP_LOOP_C_180 = 9'd354,
    COMP_LOOP_C_181 = 9'd355,
    COMP_LOOP_C_182 = 9'd356,
    COMP_LOOP_C_183 = 9'd357,
    COMP_LOOP_C_184 = 9'd358,
    COMP_LOOP_C_185 = 9'd359,
    COMP_LOOP_C_186 = 9'd360,
    COMP_LOOP_C_187 = 9'd361,
    COMP_LOOP_C_188 = 9'd362,
    COMP_LOOP_C_189 = 9'd363,
    COMP_LOOP_C_190 = 9'd364,
    COMP_LOOP_C_191 = 9'd365,
    COMP_LOOP_C_192 = 9'd366,
    COMP_LOOP_C_193 = 9'd367,
    COMP_LOOP_C_194 = 9'd368,
    COMP_LOOP_C_195 = 9'd369,
    COMP_LOOP_C_196 = 9'd370,
    COMP_LOOP_4_modExp_1_while_C_0 = 9'd371,
    COMP_LOOP_4_modExp_1_while_C_1 = 9'd372,
    COMP_LOOP_4_modExp_1_while_C_2 = 9'd373,
    COMP_LOOP_4_modExp_1_while_C_3 = 9'd374,
    COMP_LOOP_4_modExp_1_while_C_4 = 9'd375,
    COMP_LOOP_4_modExp_1_while_C_5 = 9'd376,
    COMP_LOOP_4_modExp_1_while_C_6 = 9'd377,
    COMP_LOOP_4_modExp_1_while_C_7 = 9'd378,
    COMP_LOOP_4_modExp_1_while_C_8 = 9'd379,
    COMP_LOOP_4_modExp_1_while_C_9 = 9'd380,
    COMP_LOOP_4_modExp_1_while_C_10 = 9'd381,
    COMP_LOOP_4_modExp_1_while_C_11 = 9'd382,
    COMP_LOOP_4_modExp_1_while_C_12 = 9'd383,
    COMP_LOOP_4_modExp_1_while_C_13 = 9'd384,
    COMP_LOOP_4_modExp_1_while_C_14 = 9'd385,
    COMP_LOOP_4_modExp_1_while_C_15 = 9'd386,
    COMP_LOOP_4_modExp_1_while_C_16 = 9'd387,
    COMP_LOOP_4_modExp_1_while_C_17 = 9'd388,
    COMP_LOOP_4_modExp_1_while_C_18 = 9'd389,
    COMP_LOOP_4_modExp_1_while_C_19 = 9'd390,
    COMP_LOOP_4_modExp_1_while_C_20 = 9'd391,
    COMP_LOOP_4_modExp_1_while_C_21 = 9'd392,
    COMP_LOOP_4_modExp_1_while_C_22 = 9'd393,
    COMP_LOOP_4_modExp_1_while_C_23 = 9'd394,
    COMP_LOOP_4_modExp_1_while_C_24 = 9'd395,
    COMP_LOOP_4_modExp_1_while_C_25 = 9'd396,
    COMP_LOOP_4_modExp_1_while_C_26 = 9'd397,
    COMP_LOOP_4_modExp_1_while_C_27 = 9'd398,
    COMP_LOOP_4_modExp_1_while_C_28 = 9'd399,
    COMP_LOOP_4_modExp_1_while_C_29 = 9'd400,
    COMP_LOOP_4_modExp_1_while_C_30 = 9'd401,
    COMP_LOOP_4_modExp_1_while_C_31 = 9'd402,
    COMP_LOOP_4_modExp_1_while_C_32 = 9'd403,
    COMP_LOOP_4_modExp_1_while_C_33 = 9'd404,
    COMP_LOOP_4_modExp_1_while_C_34 = 9'd405,
    COMP_LOOP_4_modExp_1_while_C_35 = 9'd406,
    COMP_LOOP_4_modExp_1_while_C_36 = 9'd407,
    COMP_LOOP_4_modExp_1_while_C_37 = 9'd408,
    COMP_LOOP_4_modExp_1_while_C_38 = 9'd409,
    COMP_LOOP_4_modExp_1_while_C_39 = 9'd410,
    COMP_LOOP_4_modExp_1_while_C_40 = 9'd411,
    COMP_LOOP_C_197 = 9'd412,
    COMP_LOOP_C_198 = 9'd413,
    COMP_LOOP_C_199 = 9'd414,
    COMP_LOOP_C_200 = 9'd415,
    COMP_LOOP_C_201 = 9'd416,
    COMP_LOOP_C_202 = 9'd417,
    COMP_LOOP_C_203 = 9'd418,
    COMP_LOOP_C_204 = 9'd419,
    COMP_LOOP_C_205 = 9'd420,
    COMP_LOOP_C_206 = 9'd421,
    COMP_LOOP_C_207 = 9'd422,
    COMP_LOOP_C_208 = 9'd423,
    COMP_LOOP_C_209 = 9'd424,
    COMP_LOOP_C_210 = 9'd425,
    COMP_LOOP_C_211 = 9'd426,
    COMP_LOOP_C_212 = 9'd427,
    COMP_LOOP_C_213 = 9'd428,
    COMP_LOOP_C_214 = 9'd429,
    COMP_LOOP_C_215 = 9'd430,
    COMP_LOOP_C_216 = 9'd431,
    COMP_LOOP_C_217 = 9'd432,
    COMP_LOOP_C_218 = 9'd433,
    COMP_LOOP_C_219 = 9'd434,
    COMP_LOOP_C_220 = 9'd435,
    COMP_LOOP_C_221 = 9'd436,
    COMP_LOOP_C_222 = 9'd437,
    COMP_LOOP_C_223 = 9'd438,
    COMP_LOOP_C_224 = 9'd439,
    COMP_LOOP_C_225 = 9'd440,
    COMP_LOOP_C_226 = 9'd441,
    COMP_LOOP_C_227 = 9'd442,
    COMP_LOOP_C_228 = 9'd443,
    COMP_LOOP_C_229 = 9'd444,
    COMP_LOOP_C_230 = 9'd445,
    COMP_LOOP_C_231 = 9'd446,
    COMP_LOOP_C_232 = 9'd447,
    COMP_LOOP_C_233 = 9'd448,
    COMP_LOOP_C_234 = 9'd449,
    COMP_LOOP_C_235 = 9'd450,
    COMP_LOOP_C_236 = 9'd451,
    COMP_LOOP_C_237 = 9'd452,
    COMP_LOOP_C_238 = 9'd453,
    COMP_LOOP_C_239 = 9'd454,
    COMP_LOOP_C_240 = 9'd455,
    COMP_LOOP_C_241 = 9'd456,
    COMP_LOOP_C_242 = 9'd457,
    COMP_LOOP_C_243 = 9'd458,
    COMP_LOOP_C_244 = 9'd459,
    COMP_LOOP_C_245 = 9'd460,
    COMP_LOOP_C_246 = 9'd461,
    COMP_LOOP_C_247 = 9'd462,
    COMP_LOOP_C_248 = 9'd463,
    COMP_LOOP_C_249 = 9'd464,
    COMP_LOOP_C_250 = 9'd465,
    COMP_LOOP_C_251 = 9'd466,
    COMP_LOOP_C_252 = 9'd467,
    COMP_LOOP_C_253 = 9'd468,
    COMP_LOOP_C_254 = 9'd469,
    COMP_LOOP_C_255 = 9'd470,
    COMP_LOOP_C_256 = 9'd471,
    COMP_LOOP_C_257 = 9'd472,
    COMP_LOOP_C_258 = 9'd473,
    COMP_LOOP_C_259 = 9'd474,
    COMP_LOOP_C_260 = 9'd475,
    VEC_LOOP_C_0 = 9'd476,
    STAGE_LOOP_C_9 = 9'd477,
    main_C_1 = 9'd478;

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
        if ( STAGE_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      modExp_while_C_0 : begin
        fsm_output = 9'b000001010;
        state_var_NS = modExp_while_C_1;
      end
      modExp_while_C_1 : begin
        fsm_output = 9'b000001011;
        state_var_NS = modExp_while_C_2;
      end
      modExp_while_C_2 : begin
        fsm_output = 9'b000001100;
        state_var_NS = modExp_while_C_3;
      end
      modExp_while_C_3 : begin
        fsm_output = 9'b000001101;
        state_var_NS = modExp_while_C_4;
      end
      modExp_while_C_4 : begin
        fsm_output = 9'b000001110;
        state_var_NS = modExp_while_C_5;
      end
      modExp_while_C_5 : begin
        fsm_output = 9'b000001111;
        state_var_NS = modExp_while_C_6;
      end
      modExp_while_C_6 : begin
        fsm_output = 9'b000010000;
        state_var_NS = modExp_while_C_7;
      end
      modExp_while_C_7 : begin
        fsm_output = 9'b000010001;
        state_var_NS = modExp_while_C_8;
      end
      modExp_while_C_8 : begin
        fsm_output = 9'b000010010;
        state_var_NS = modExp_while_C_9;
      end
      modExp_while_C_9 : begin
        fsm_output = 9'b000010011;
        state_var_NS = modExp_while_C_10;
      end
      modExp_while_C_10 : begin
        fsm_output = 9'b000010100;
        state_var_NS = modExp_while_C_11;
      end
      modExp_while_C_11 : begin
        fsm_output = 9'b000010101;
        state_var_NS = modExp_while_C_12;
      end
      modExp_while_C_12 : begin
        fsm_output = 9'b000010110;
        state_var_NS = modExp_while_C_13;
      end
      modExp_while_C_13 : begin
        fsm_output = 9'b000010111;
        state_var_NS = modExp_while_C_14;
      end
      modExp_while_C_14 : begin
        fsm_output = 9'b000011000;
        state_var_NS = modExp_while_C_15;
      end
      modExp_while_C_15 : begin
        fsm_output = 9'b000011001;
        state_var_NS = modExp_while_C_16;
      end
      modExp_while_C_16 : begin
        fsm_output = 9'b000011010;
        state_var_NS = modExp_while_C_17;
      end
      modExp_while_C_17 : begin
        fsm_output = 9'b000011011;
        state_var_NS = modExp_while_C_18;
      end
      modExp_while_C_18 : begin
        fsm_output = 9'b000011100;
        state_var_NS = modExp_while_C_19;
      end
      modExp_while_C_19 : begin
        fsm_output = 9'b000011101;
        state_var_NS = modExp_while_C_20;
      end
      modExp_while_C_20 : begin
        fsm_output = 9'b000011110;
        state_var_NS = modExp_while_C_21;
      end
      modExp_while_C_21 : begin
        fsm_output = 9'b000011111;
        state_var_NS = modExp_while_C_22;
      end
      modExp_while_C_22 : begin
        fsm_output = 9'b000100000;
        state_var_NS = modExp_while_C_23;
      end
      modExp_while_C_23 : begin
        fsm_output = 9'b000100001;
        state_var_NS = modExp_while_C_24;
      end
      modExp_while_C_24 : begin
        fsm_output = 9'b000100010;
        state_var_NS = modExp_while_C_25;
      end
      modExp_while_C_25 : begin
        fsm_output = 9'b000100011;
        state_var_NS = modExp_while_C_26;
      end
      modExp_while_C_26 : begin
        fsm_output = 9'b000100100;
        state_var_NS = modExp_while_C_27;
      end
      modExp_while_C_27 : begin
        fsm_output = 9'b000100101;
        state_var_NS = modExp_while_C_28;
      end
      modExp_while_C_28 : begin
        fsm_output = 9'b000100110;
        state_var_NS = modExp_while_C_29;
      end
      modExp_while_C_29 : begin
        fsm_output = 9'b000100111;
        state_var_NS = modExp_while_C_30;
      end
      modExp_while_C_30 : begin
        fsm_output = 9'b000101000;
        state_var_NS = modExp_while_C_31;
      end
      modExp_while_C_31 : begin
        fsm_output = 9'b000101001;
        state_var_NS = modExp_while_C_32;
      end
      modExp_while_C_32 : begin
        fsm_output = 9'b000101010;
        state_var_NS = modExp_while_C_33;
      end
      modExp_while_C_33 : begin
        fsm_output = 9'b000101011;
        state_var_NS = modExp_while_C_34;
      end
      modExp_while_C_34 : begin
        fsm_output = 9'b000101100;
        state_var_NS = modExp_while_C_35;
      end
      modExp_while_C_35 : begin
        fsm_output = 9'b000101101;
        state_var_NS = modExp_while_C_36;
      end
      modExp_while_C_36 : begin
        fsm_output = 9'b000101110;
        state_var_NS = modExp_while_C_37;
      end
      modExp_while_C_37 : begin
        fsm_output = 9'b000101111;
        state_var_NS = modExp_while_C_38;
      end
      modExp_while_C_38 : begin
        fsm_output = 9'b000110000;
        state_var_NS = modExp_while_C_39;
      end
      modExp_while_C_39 : begin
        fsm_output = 9'b000110001;
        state_var_NS = modExp_while_C_40;
      end
      modExp_while_C_40 : begin
        fsm_output = 9'b000110010;
        if ( modExp_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 9'b000110011;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 9'b000110100;
        if ( COMP_LOOP_C_1_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_1_modExp_1_while_C_0 : begin
        fsm_output = 9'b000110101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_1;
      end
      COMP_LOOP_1_modExp_1_while_C_1 : begin
        fsm_output = 9'b000110110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_2;
      end
      COMP_LOOP_1_modExp_1_while_C_2 : begin
        fsm_output = 9'b000110111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_3;
      end
      COMP_LOOP_1_modExp_1_while_C_3 : begin
        fsm_output = 9'b000111000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_4;
      end
      COMP_LOOP_1_modExp_1_while_C_4 : begin
        fsm_output = 9'b000111001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_5;
      end
      COMP_LOOP_1_modExp_1_while_C_5 : begin
        fsm_output = 9'b000111010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_6;
      end
      COMP_LOOP_1_modExp_1_while_C_6 : begin
        fsm_output = 9'b000111011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_7;
      end
      COMP_LOOP_1_modExp_1_while_C_7 : begin
        fsm_output = 9'b000111100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_8;
      end
      COMP_LOOP_1_modExp_1_while_C_8 : begin
        fsm_output = 9'b000111101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_9;
      end
      COMP_LOOP_1_modExp_1_while_C_9 : begin
        fsm_output = 9'b000111110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_10;
      end
      COMP_LOOP_1_modExp_1_while_C_10 : begin
        fsm_output = 9'b000111111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_11;
      end
      COMP_LOOP_1_modExp_1_while_C_11 : begin
        fsm_output = 9'b001000000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_12;
      end
      COMP_LOOP_1_modExp_1_while_C_12 : begin
        fsm_output = 9'b001000001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_13;
      end
      COMP_LOOP_1_modExp_1_while_C_13 : begin
        fsm_output = 9'b001000010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_14;
      end
      COMP_LOOP_1_modExp_1_while_C_14 : begin
        fsm_output = 9'b001000011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_15;
      end
      COMP_LOOP_1_modExp_1_while_C_15 : begin
        fsm_output = 9'b001000100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_16;
      end
      COMP_LOOP_1_modExp_1_while_C_16 : begin
        fsm_output = 9'b001000101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_17;
      end
      COMP_LOOP_1_modExp_1_while_C_17 : begin
        fsm_output = 9'b001000110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_18;
      end
      COMP_LOOP_1_modExp_1_while_C_18 : begin
        fsm_output = 9'b001000111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_19;
      end
      COMP_LOOP_1_modExp_1_while_C_19 : begin
        fsm_output = 9'b001001000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_20;
      end
      COMP_LOOP_1_modExp_1_while_C_20 : begin
        fsm_output = 9'b001001001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_21;
      end
      COMP_LOOP_1_modExp_1_while_C_21 : begin
        fsm_output = 9'b001001010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_22;
      end
      COMP_LOOP_1_modExp_1_while_C_22 : begin
        fsm_output = 9'b001001011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_23;
      end
      COMP_LOOP_1_modExp_1_while_C_23 : begin
        fsm_output = 9'b001001100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_24;
      end
      COMP_LOOP_1_modExp_1_while_C_24 : begin
        fsm_output = 9'b001001101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_25;
      end
      COMP_LOOP_1_modExp_1_while_C_25 : begin
        fsm_output = 9'b001001110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_26;
      end
      COMP_LOOP_1_modExp_1_while_C_26 : begin
        fsm_output = 9'b001001111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_27;
      end
      COMP_LOOP_1_modExp_1_while_C_27 : begin
        fsm_output = 9'b001010000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_28;
      end
      COMP_LOOP_1_modExp_1_while_C_28 : begin
        fsm_output = 9'b001010001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_29;
      end
      COMP_LOOP_1_modExp_1_while_C_29 : begin
        fsm_output = 9'b001010010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_30;
      end
      COMP_LOOP_1_modExp_1_while_C_30 : begin
        fsm_output = 9'b001010011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_31;
      end
      COMP_LOOP_1_modExp_1_while_C_31 : begin
        fsm_output = 9'b001010100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_32;
      end
      COMP_LOOP_1_modExp_1_while_C_32 : begin
        fsm_output = 9'b001010101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_33;
      end
      COMP_LOOP_1_modExp_1_while_C_33 : begin
        fsm_output = 9'b001010110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_34;
      end
      COMP_LOOP_1_modExp_1_while_C_34 : begin
        fsm_output = 9'b001010111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_35;
      end
      COMP_LOOP_1_modExp_1_while_C_35 : begin
        fsm_output = 9'b001011000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_36;
      end
      COMP_LOOP_1_modExp_1_while_C_36 : begin
        fsm_output = 9'b001011001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_37;
      end
      COMP_LOOP_1_modExp_1_while_C_37 : begin
        fsm_output = 9'b001011010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_38;
      end
      COMP_LOOP_1_modExp_1_while_C_38 : begin
        fsm_output = 9'b001011011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_39;
      end
      COMP_LOOP_1_modExp_1_while_C_39 : begin
        fsm_output = 9'b001011100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_40;
      end
      COMP_LOOP_1_modExp_1_while_C_40 : begin
        fsm_output = 9'b001011101;
        if ( COMP_LOOP_1_modExp_1_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 9'b001011110;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 9'b001011111;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 9'b001100000;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 9'b001100001;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 9'b001100010;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 9'b001100011;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 9'b001100100;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 9'b001100101;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 9'b001100110;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 9'b001100111;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 9'b001101000;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 9'b001101001;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 9'b001101010;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 9'b001101011;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 9'b001101100;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 9'b001101101;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 9'b001101110;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 9'b001101111;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 9'b001110000;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 9'b001110001;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 9'b001110010;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 9'b001110011;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 9'b001110100;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 9'b001110101;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 9'b001110110;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 9'b001110111;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 9'b001111000;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 9'b001111001;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 9'b001111010;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 9'b001111011;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 9'b001111100;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 9'b001111101;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 9'b001111110;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 9'b001111111;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 9'b010000000;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 9'b010000001;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 9'b010000010;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 9'b010000011;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 9'b010000100;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 9'b010000101;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 9'b010000110;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 9'b010000111;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 9'b010001000;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 9'b010001001;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 9'b010001010;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 9'b010001011;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 9'b010001100;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 9'b010001101;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 9'b010001110;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 9'b010001111;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 9'b010010000;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 9'b010010001;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 9'b010010010;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 9'b010010011;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 9'b010010100;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 9'b010010101;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 9'b010010110;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 9'b010010111;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 9'b010011000;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 9'b010011001;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 9'b010011010;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 9'b010011011;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 9'b010011100;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 9'b010011101;
        if ( COMP_LOOP_C_65_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_66;
        end
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 9'b010011110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
      end
      COMP_LOOP_2_modExp_1_while_C_0 : begin
        fsm_output = 9'b010011111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_1;
      end
      COMP_LOOP_2_modExp_1_while_C_1 : begin
        fsm_output = 9'b010100000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_2;
      end
      COMP_LOOP_2_modExp_1_while_C_2 : begin
        fsm_output = 9'b010100001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_3;
      end
      COMP_LOOP_2_modExp_1_while_C_3 : begin
        fsm_output = 9'b010100010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_4;
      end
      COMP_LOOP_2_modExp_1_while_C_4 : begin
        fsm_output = 9'b010100011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_5;
      end
      COMP_LOOP_2_modExp_1_while_C_5 : begin
        fsm_output = 9'b010100100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_6;
      end
      COMP_LOOP_2_modExp_1_while_C_6 : begin
        fsm_output = 9'b010100101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_7;
      end
      COMP_LOOP_2_modExp_1_while_C_7 : begin
        fsm_output = 9'b010100110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_8;
      end
      COMP_LOOP_2_modExp_1_while_C_8 : begin
        fsm_output = 9'b010100111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_9;
      end
      COMP_LOOP_2_modExp_1_while_C_9 : begin
        fsm_output = 9'b010101000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_10;
      end
      COMP_LOOP_2_modExp_1_while_C_10 : begin
        fsm_output = 9'b010101001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_11;
      end
      COMP_LOOP_2_modExp_1_while_C_11 : begin
        fsm_output = 9'b010101010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_12;
      end
      COMP_LOOP_2_modExp_1_while_C_12 : begin
        fsm_output = 9'b010101011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_13;
      end
      COMP_LOOP_2_modExp_1_while_C_13 : begin
        fsm_output = 9'b010101100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_14;
      end
      COMP_LOOP_2_modExp_1_while_C_14 : begin
        fsm_output = 9'b010101101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_15;
      end
      COMP_LOOP_2_modExp_1_while_C_15 : begin
        fsm_output = 9'b010101110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_16;
      end
      COMP_LOOP_2_modExp_1_while_C_16 : begin
        fsm_output = 9'b010101111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_17;
      end
      COMP_LOOP_2_modExp_1_while_C_17 : begin
        fsm_output = 9'b010110000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_18;
      end
      COMP_LOOP_2_modExp_1_while_C_18 : begin
        fsm_output = 9'b010110001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_19;
      end
      COMP_LOOP_2_modExp_1_while_C_19 : begin
        fsm_output = 9'b010110010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_20;
      end
      COMP_LOOP_2_modExp_1_while_C_20 : begin
        fsm_output = 9'b010110011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_21;
      end
      COMP_LOOP_2_modExp_1_while_C_21 : begin
        fsm_output = 9'b010110100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_22;
      end
      COMP_LOOP_2_modExp_1_while_C_22 : begin
        fsm_output = 9'b010110101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_23;
      end
      COMP_LOOP_2_modExp_1_while_C_23 : begin
        fsm_output = 9'b010110110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_24;
      end
      COMP_LOOP_2_modExp_1_while_C_24 : begin
        fsm_output = 9'b010110111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_25;
      end
      COMP_LOOP_2_modExp_1_while_C_25 : begin
        fsm_output = 9'b010111000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_26;
      end
      COMP_LOOP_2_modExp_1_while_C_26 : begin
        fsm_output = 9'b010111001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_27;
      end
      COMP_LOOP_2_modExp_1_while_C_27 : begin
        fsm_output = 9'b010111010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_28;
      end
      COMP_LOOP_2_modExp_1_while_C_28 : begin
        fsm_output = 9'b010111011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_29;
      end
      COMP_LOOP_2_modExp_1_while_C_29 : begin
        fsm_output = 9'b010111100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_30;
      end
      COMP_LOOP_2_modExp_1_while_C_30 : begin
        fsm_output = 9'b010111101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_31;
      end
      COMP_LOOP_2_modExp_1_while_C_31 : begin
        fsm_output = 9'b010111110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_32;
      end
      COMP_LOOP_2_modExp_1_while_C_32 : begin
        fsm_output = 9'b010111111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_33;
      end
      COMP_LOOP_2_modExp_1_while_C_33 : begin
        fsm_output = 9'b011000000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_34;
      end
      COMP_LOOP_2_modExp_1_while_C_34 : begin
        fsm_output = 9'b011000001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_35;
      end
      COMP_LOOP_2_modExp_1_while_C_35 : begin
        fsm_output = 9'b011000010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_36;
      end
      COMP_LOOP_2_modExp_1_while_C_36 : begin
        fsm_output = 9'b011000011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_37;
      end
      COMP_LOOP_2_modExp_1_while_C_37 : begin
        fsm_output = 9'b011000100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_38;
      end
      COMP_LOOP_2_modExp_1_while_C_38 : begin
        fsm_output = 9'b011000101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_39;
      end
      COMP_LOOP_2_modExp_1_while_C_39 : begin
        fsm_output = 9'b011000110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_40;
      end
      COMP_LOOP_2_modExp_1_while_C_40 : begin
        fsm_output = 9'b011000111;
        if ( COMP_LOOP_2_modExp_1_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_67;
        end
        else begin
          state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 9'b011001000;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 9'b011001001;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 9'b011001010;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 9'b011001011;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 9'b011001100;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 9'b011001101;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 9'b011001110;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 9'b011001111;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 9'b011010000;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 9'b011010001;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 9'b011010010;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 9'b011010011;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 9'b011010100;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 9'b011010101;
        state_var_NS = COMP_LOOP_C_81;
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 9'b011010110;
        state_var_NS = COMP_LOOP_C_82;
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 9'b011010111;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 9'b011011000;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 9'b011011001;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 9'b011011010;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 9'b011011011;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 9'b011011100;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 9'b011011101;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 9'b011011110;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 9'b011011111;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 9'b011100000;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 9'b011100001;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 9'b011100010;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 9'b011100011;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 9'b011100100;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 9'b011100101;
        state_var_NS = COMP_LOOP_C_97;
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 9'b011100110;
        state_var_NS = COMP_LOOP_C_98;
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 9'b011100111;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 9'b011101000;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 9'b011101001;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 9'b011101010;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 9'b011101011;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 9'b011101100;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 9'b011101101;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 9'b011101110;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 9'b011101111;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 9'b011110000;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 9'b011110001;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 9'b011110010;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 9'b011110011;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 9'b011110100;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 9'b011110101;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 9'b011110110;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 9'b011110111;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 9'b011111000;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 9'b011111001;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 9'b011111010;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 9'b011111011;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 9'b011111100;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 9'b011111101;
        state_var_NS = COMP_LOOP_C_121;
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 9'b011111110;
        state_var_NS = COMP_LOOP_C_122;
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 9'b011111111;
        state_var_NS = COMP_LOOP_C_123;
      end
      COMP_LOOP_C_123 : begin
        fsm_output = 9'b100000000;
        state_var_NS = COMP_LOOP_C_124;
      end
      COMP_LOOP_C_124 : begin
        fsm_output = 9'b100000001;
        state_var_NS = COMP_LOOP_C_125;
      end
      COMP_LOOP_C_125 : begin
        fsm_output = 9'b100000010;
        state_var_NS = COMP_LOOP_C_126;
      end
      COMP_LOOP_C_126 : begin
        fsm_output = 9'b100000011;
        state_var_NS = COMP_LOOP_C_127;
      end
      COMP_LOOP_C_127 : begin
        fsm_output = 9'b100000100;
        state_var_NS = COMP_LOOP_C_128;
      end
      COMP_LOOP_C_128 : begin
        fsm_output = 9'b100000101;
        state_var_NS = COMP_LOOP_C_129;
      end
      COMP_LOOP_C_129 : begin
        fsm_output = 9'b100000110;
        state_var_NS = COMP_LOOP_C_130;
      end
      COMP_LOOP_C_130 : begin
        fsm_output = 9'b100000111;
        if ( COMP_LOOP_C_130_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_131;
        end
      end
      COMP_LOOP_C_131 : begin
        fsm_output = 9'b100001000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_0;
      end
      COMP_LOOP_3_modExp_1_while_C_0 : begin
        fsm_output = 9'b100001001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_1;
      end
      COMP_LOOP_3_modExp_1_while_C_1 : begin
        fsm_output = 9'b100001010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_2;
      end
      COMP_LOOP_3_modExp_1_while_C_2 : begin
        fsm_output = 9'b100001011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_3;
      end
      COMP_LOOP_3_modExp_1_while_C_3 : begin
        fsm_output = 9'b100001100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_4;
      end
      COMP_LOOP_3_modExp_1_while_C_4 : begin
        fsm_output = 9'b100001101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_5;
      end
      COMP_LOOP_3_modExp_1_while_C_5 : begin
        fsm_output = 9'b100001110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_6;
      end
      COMP_LOOP_3_modExp_1_while_C_6 : begin
        fsm_output = 9'b100001111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_7;
      end
      COMP_LOOP_3_modExp_1_while_C_7 : begin
        fsm_output = 9'b100010000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_8;
      end
      COMP_LOOP_3_modExp_1_while_C_8 : begin
        fsm_output = 9'b100010001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_9;
      end
      COMP_LOOP_3_modExp_1_while_C_9 : begin
        fsm_output = 9'b100010010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_10;
      end
      COMP_LOOP_3_modExp_1_while_C_10 : begin
        fsm_output = 9'b100010011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_11;
      end
      COMP_LOOP_3_modExp_1_while_C_11 : begin
        fsm_output = 9'b100010100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_12;
      end
      COMP_LOOP_3_modExp_1_while_C_12 : begin
        fsm_output = 9'b100010101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_13;
      end
      COMP_LOOP_3_modExp_1_while_C_13 : begin
        fsm_output = 9'b100010110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_14;
      end
      COMP_LOOP_3_modExp_1_while_C_14 : begin
        fsm_output = 9'b100010111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_15;
      end
      COMP_LOOP_3_modExp_1_while_C_15 : begin
        fsm_output = 9'b100011000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_16;
      end
      COMP_LOOP_3_modExp_1_while_C_16 : begin
        fsm_output = 9'b100011001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_17;
      end
      COMP_LOOP_3_modExp_1_while_C_17 : begin
        fsm_output = 9'b100011010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_18;
      end
      COMP_LOOP_3_modExp_1_while_C_18 : begin
        fsm_output = 9'b100011011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_19;
      end
      COMP_LOOP_3_modExp_1_while_C_19 : begin
        fsm_output = 9'b100011100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_20;
      end
      COMP_LOOP_3_modExp_1_while_C_20 : begin
        fsm_output = 9'b100011101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_21;
      end
      COMP_LOOP_3_modExp_1_while_C_21 : begin
        fsm_output = 9'b100011110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_22;
      end
      COMP_LOOP_3_modExp_1_while_C_22 : begin
        fsm_output = 9'b100011111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_23;
      end
      COMP_LOOP_3_modExp_1_while_C_23 : begin
        fsm_output = 9'b100100000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_24;
      end
      COMP_LOOP_3_modExp_1_while_C_24 : begin
        fsm_output = 9'b100100001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_25;
      end
      COMP_LOOP_3_modExp_1_while_C_25 : begin
        fsm_output = 9'b100100010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_26;
      end
      COMP_LOOP_3_modExp_1_while_C_26 : begin
        fsm_output = 9'b100100011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_27;
      end
      COMP_LOOP_3_modExp_1_while_C_27 : begin
        fsm_output = 9'b100100100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_28;
      end
      COMP_LOOP_3_modExp_1_while_C_28 : begin
        fsm_output = 9'b100100101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_29;
      end
      COMP_LOOP_3_modExp_1_while_C_29 : begin
        fsm_output = 9'b100100110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_30;
      end
      COMP_LOOP_3_modExp_1_while_C_30 : begin
        fsm_output = 9'b100100111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_31;
      end
      COMP_LOOP_3_modExp_1_while_C_31 : begin
        fsm_output = 9'b100101000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_32;
      end
      COMP_LOOP_3_modExp_1_while_C_32 : begin
        fsm_output = 9'b100101001;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_33;
      end
      COMP_LOOP_3_modExp_1_while_C_33 : begin
        fsm_output = 9'b100101010;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_34;
      end
      COMP_LOOP_3_modExp_1_while_C_34 : begin
        fsm_output = 9'b100101011;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_35;
      end
      COMP_LOOP_3_modExp_1_while_C_35 : begin
        fsm_output = 9'b100101100;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_36;
      end
      COMP_LOOP_3_modExp_1_while_C_36 : begin
        fsm_output = 9'b100101101;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_37;
      end
      COMP_LOOP_3_modExp_1_while_C_37 : begin
        fsm_output = 9'b100101110;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_38;
      end
      COMP_LOOP_3_modExp_1_while_C_38 : begin
        fsm_output = 9'b100101111;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_39;
      end
      COMP_LOOP_3_modExp_1_while_C_39 : begin
        fsm_output = 9'b100110000;
        state_var_NS = COMP_LOOP_3_modExp_1_while_C_40;
      end
      COMP_LOOP_3_modExp_1_while_C_40 : begin
        fsm_output = 9'b100110001;
        if ( COMP_LOOP_3_modExp_1_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_132;
        end
        else begin
          state_var_NS = COMP_LOOP_3_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_132 : begin
        fsm_output = 9'b100110010;
        state_var_NS = COMP_LOOP_C_133;
      end
      COMP_LOOP_C_133 : begin
        fsm_output = 9'b100110011;
        state_var_NS = COMP_LOOP_C_134;
      end
      COMP_LOOP_C_134 : begin
        fsm_output = 9'b100110100;
        state_var_NS = COMP_LOOP_C_135;
      end
      COMP_LOOP_C_135 : begin
        fsm_output = 9'b100110101;
        state_var_NS = COMP_LOOP_C_136;
      end
      COMP_LOOP_C_136 : begin
        fsm_output = 9'b100110110;
        state_var_NS = COMP_LOOP_C_137;
      end
      COMP_LOOP_C_137 : begin
        fsm_output = 9'b100110111;
        state_var_NS = COMP_LOOP_C_138;
      end
      COMP_LOOP_C_138 : begin
        fsm_output = 9'b100111000;
        state_var_NS = COMP_LOOP_C_139;
      end
      COMP_LOOP_C_139 : begin
        fsm_output = 9'b100111001;
        state_var_NS = COMP_LOOP_C_140;
      end
      COMP_LOOP_C_140 : begin
        fsm_output = 9'b100111010;
        state_var_NS = COMP_LOOP_C_141;
      end
      COMP_LOOP_C_141 : begin
        fsm_output = 9'b100111011;
        state_var_NS = COMP_LOOP_C_142;
      end
      COMP_LOOP_C_142 : begin
        fsm_output = 9'b100111100;
        state_var_NS = COMP_LOOP_C_143;
      end
      COMP_LOOP_C_143 : begin
        fsm_output = 9'b100111101;
        state_var_NS = COMP_LOOP_C_144;
      end
      COMP_LOOP_C_144 : begin
        fsm_output = 9'b100111110;
        state_var_NS = COMP_LOOP_C_145;
      end
      COMP_LOOP_C_145 : begin
        fsm_output = 9'b100111111;
        state_var_NS = COMP_LOOP_C_146;
      end
      COMP_LOOP_C_146 : begin
        fsm_output = 9'b101000000;
        state_var_NS = COMP_LOOP_C_147;
      end
      COMP_LOOP_C_147 : begin
        fsm_output = 9'b101000001;
        state_var_NS = COMP_LOOP_C_148;
      end
      COMP_LOOP_C_148 : begin
        fsm_output = 9'b101000010;
        state_var_NS = COMP_LOOP_C_149;
      end
      COMP_LOOP_C_149 : begin
        fsm_output = 9'b101000011;
        state_var_NS = COMP_LOOP_C_150;
      end
      COMP_LOOP_C_150 : begin
        fsm_output = 9'b101000100;
        state_var_NS = COMP_LOOP_C_151;
      end
      COMP_LOOP_C_151 : begin
        fsm_output = 9'b101000101;
        state_var_NS = COMP_LOOP_C_152;
      end
      COMP_LOOP_C_152 : begin
        fsm_output = 9'b101000110;
        state_var_NS = COMP_LOOP_C_153;
      end
      COMP_LOOP_C_153 : begin
        fsm_output = 9'b101000111;
        state_var_NS = COMP_LOOP_C_154;
      end
      COMP_LOOP_C_154 : begin
        fsm_output = 9'b101001000;
        state_var_NS = COMP_LOOP_C_155;
      end
      COMP_LOOP_C_155 : begin
        fsm_output = 9'b101001001;
        state_var_NS = COMP_LOOP_C_156;
      end
      COMP_LOOP_C_156 : begin
        fsm_output = 9'b101001010;
        state_var_NS = COMP_LOOP_C_157;
      end
      COMP_LOOP_C_157 : begin
        fsm_output = 9'b101001011;
        state_var_NS = COMP_LOOP_C_158;
      end
      COMP_LOOP_C_158 : begin
        fsm_output = 9'b101001100;
        state_var_NS = COMP_LOOP_C_159;
      end
      COMP_LOOP_C_159 : begin
        fsm_output = 9'b101001101;
        state_var_NS = COMP_LOOP_C_160;
      end
      COMP_LOOP_C_160 : begin
        fsm_output = 9'b101001110;
        state_var_NS = COMP_LOOP_C_161;
      end
      COMP_LOOP_C_161 : begin
        fsm_output = 9'b101001111;
        state_var_NS = COMP_LOOP_C_162;
      end
      COMP_LOOP_C_162 : begin
        fsm_output = 9'b101010000;
        state_var_NS = COMP_LOOP_C_163;
      end
      COMP_LOOP_C_163 : begin
        fsm_output = 9'b101010001;
        state_var_NS = COMP_LOOP_C_164;
      end
      COMP_LOOP_C_164 : begin
        fsm_output = 9'b101010010;
        state_var_NS = COMP_LOOP_C_165;
      end
      COMP_LOOP_C_165 : begin
        fsm_output = 9'b101010011;
        state_var_NS = COMP_LOOP_C_166;
      end
      COMP_LOOP_C_166 : begin
        fsm_output = 9'b101010100;
        state_var_NS = COMP_LOOP_C_167;
      end
      COMP_LOOP_C_167 : begin
        fsm_output = 9'b101010101;
        state_var_NS = COMP_LOOP_C_168;
      end
      COMP_LOOP_C_168 : begin
        fsm_output = 9'b101010110;
        state_var_NS = COMP_LOOP_C_169;
      end
      COMP_LOOP_C_169 : begin
        fsm_output = 9'b101010111;
        state_var_NS = COMP_LOOP_C_170;
      end
      COMP_LOOP_C_170 : begin
        fsm_output = 9'b101011000;
        state_var_NS = COMP_LOOP_C_171;
      end
      COMP_LOOP_C_171 : begin
        fsm_output = 9'b101011001;
        state_var_NS = COMP_LOOP_C_172;
      end
      COMP_LOOP_C_172 : begin
        fsm_output = 9'b101011010;
        state_var_NS = COMP_LOOP_C_173;
      end
      COMP_LOOP_C_173 : begin
        fsm_output = 9'b101011011;
        state_var_NS = COMP_LOOP_C_174;
      end
      COMP_LOOP_C_174 : begin
        fsm_output = 9'b101011100;
        state_var_NS = COMP_LOOP_C_175;
      end
      COMP_LOOP_C_175 : begin
        fsm_output = 9'b101011101;
        state_var_NS = COMP_LOOP_C_176;
      end
      COMP_LOOP_C_176 : begin
        fsm_output = 9'b101011110;
        state_var_NS = COMP_LOOP_C_177;
      end
      COMP_LOOP_C_177 : begin
        fsm_output = 9'b101011111;
        state_var_NS = COMP_LOOP_C_178;
      end
      COMP_LOOP_C_178 : begin
        fsm_output = 9'b101100000;
        state_var_NS = COMP_LOOP_C_179;
      end
      COMP_LOOP_C_179 : begin
        fsm_output = 9'b101100001;
        state_var_NS = COMP_LOOP_C_180;
      end
      COMP_LOOP_C_180 : begin
        fsm_output = 9'b101100010;
        state_var_NS = COMP_LOOP_C_181;
      end
      COMP_LOOP_C_181 : begin
        fsm_output = 9'b101100011;
        state_var_NS = COMP_LOOP_C_182;
      end
      COMP_LOOP_C_182 : begin
        fsm_output = 9'b101100100;
        state_var_NS = COMP_LOOP_C_183;
      end
      COMP_LOOP_C_183 : begin
        fsm_output = 9'b101100101;
        state_var_NS = COMP_LOOP_C_184;
      end
      COMP_LOOP_C_184 : begin
        fsm_output = 9'b101100110;
        state_var_NS = COMP_LOOP_C_185;
      end
      COMP_LOOP_C_185 : begin
        fsm_output = 9'b101100111;
        state_var_NS = COMP_LOOP_C_186;
      end
      COMP_LOOP_C_186 : begin
        fsm_output = 9'b101101000;
        state_var_NS = COMP_LOOP_C_187;
      end
      COMP_LOOP_C_187 : begin
        fsm_output = 9'b101101001;
        state_var_NS = COMP_LOOP_C_188;
      end
      COMP_LOOP_C_188 : begin
        fsm_output = 9'b101101010;
        state_var_NS = COMP_LOOP_C_189;
      end
      COMP_LOOP_C_189 : begin
        fsm_output = 9'b101101011;
        state_var_NS = COMP_LOOP_C_190;
      end
      COMP_LOOP_C_190 : begin
        fsm_output = 9'b101101100;
        state_var_NS = COMP_LOOP_C_191;
      end
      COMP_LOOP_C_191 : begin
        fsm_output = 9'b101101101;
        state_var_NS = COMP_LOOP_C_192;
      end
      COMP_LOOP_C_192 : begin
        fsm_output = 9'b101101110;
        state_var_NS = COMP_LOOP_C_193;
      end
      COMP_LOOP_C_193 : begin
        fsm_output = 9'b101101111;
        state_var_NS = COMP_LOOP_C_194;
      end
      COMP_LOOP_C_194 : begin
        fsm_output = 9'b101110000;
        state_var_NS = COMP_LOOP_C_195;
      end
      COMP_LOOP_C_195 : begin
        fsm_output = 9'b101110001;
        if ( COMP_LOOP_C_195_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_196;
        end
      end
      COMP_LOOP_C_196 : begin
        fsm_output = 9'b101110010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_0;
      end
      COMP_LOOP_4_modExp_1_while_C_0 : begin
        fsm_output = 9'b101110011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_1;
      end
      COMP_LOOP_4_modExp_1_while_C_1 : begin
        fsm_output = 9'b101110100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_2;
      end
      COMP_LOOP_4_modExp_1_while_C_2 : begin
        fsm_output = 9'b101110101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_3;
      end
      COMP_LOOP_4_modExp_1_while_C_3 : begin
        fsm_output = 9'b101110110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_4;
      end
      COMP_LOOP_4_modExp_1_while_C_4 : begin
        fsm_output = 9'b101110111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_5;
      end
      COMP_LOOP_4_modExp_1_while_C_5 : begin
        fsm_output = 9'b101111000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_6;
      end
      COMP_LOOP_4_modExp_1_while_C_6 : begin
        fsm_output = 9'b101111001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_7;
      end
      COMP_LOOP_4_modExp_1_while_C_7 : begin
        fsm_output = 9'b101111010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_8;
      end
      COMP_LOOP_4_modExp_1_while_C_8 : begin
        fsm_output = 9'b101111011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_9;
      end
      COMP_LOOP_4_modExp_1_while_C_9 : begin
        fsm_output = 9'b101111100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_10;
      end
      COMP_LOOP_4_modExp_1_while_C_10 : begin
        fsm_output = 9'b101111101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_11;
      end
      COMP_LOOP_4_modExp_1_while_C_11 : begin
        fsm_output = 9'b101111110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_12;
      end
      COMP_LOOP_4_modExp_1_while_C_12 : begin
        fsm_output = 9'b101111111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_13;
      end
      COMP_LOOP_4_modExp_1_while_C_13 : begin
        fsm_output = 9'b110000000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_14;
      end
      COMP_LOOP_4_modExp_1_while_C_14 : begin
        fsm_output = 9'b110000001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_15;
      end
      COMP_LOOP_4_modExp_1_while_C_15 : begin
        fsm_output = 9'b110000010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_16;
      end
      COMP_LOOP_4_modExp_1_while_C_16 : begin
        fsm_output = 9'b110000011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_17;
      end
      COMP_LOOP_4_modExp_1_while_C_17 : begin
        fsm_output = 9'b110000100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_18;
      end
      COMP_LOOP_4_modExp_1_while_C_18 : begin
        fsm_output = 9'b110000101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_19;
      end
      COMP_LOOP_4_modExp_1_while_C_19 : begin
        fsm_output = 9'b110000110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_20;
      end
      COMP_LOOP_4_modExp_1_while_C_20 : begin
        fsm_output = 9'b110000111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_21;
      end
      COMP_LOOP_4_modExp_1_while_C_21 : begin
        fsm_output = 9'b110001000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_22;
      end
      COMP_LOOP_4_modExp_1_while_C_22 : begin
        fsm_output = 9'b110001001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_23;
      end
      COMP_LOOP_4_modExp_1_while_C_23 : begin
        fsm_output = 9'b110001010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_24;
      end
      COMP_LOOP_4_modExp_1_while_C_24 : begin
        fsm_output = 9'b110001011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_25;
      end
      COMP_LOOP_4_modExp_1_while_C_25 : begin
        fsm_output = 9'b110001100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_26;
      end
      COMP_LOOP_4_modExp_1_while_C_26 : begin
        fsm_output = 9'b110001101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_27;
      end
      COMP_LOOP_4_modExp_1_while_C_27 : begin
        fsm_output = 9'b110001110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_28;
      end
      COMP_LOOP_4_modExp_1_while_C_28 : begin
        fsm_output = 9'b110001111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_29;
      end
      COMP_LOOP_4_modExp_1_while_C_29 : begin
        fsm_output = 9'b110010000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_30;
      end
      COMP_LOOP_4_modExp_1_while_C_30 : begin
        fsm_output = 9'b110010001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_31;
      end
      COMP_LOOP_4_modExp_1_while_C_31 : begin
        fsm_output = 9'b110010010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_32;
      end
      COMP_LOOP_4_modExp_1_while_C_32 : begin
        fsm_output = 9'b110010011;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_33;
      end
      COMP_LOOP_4_modExp_1_while_C_33 : begin
        fsm_output = 9'b110010100;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_34;
      end
      COMP_LOOP_4_modExp_1_while_C_34 : begin
        fsm_output = 9'b110010101;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_35;
      end
      COMP_LOOP_4_modExp_1_while_C_35 : begin
        fsm_output = 9'b110010110;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_36;
      end
      COMP_LOOP_4_modExp_1_while_C_36 : begin
        fsm_output = 9'b110010111;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_37;
      end
      COMP_LOOP_4_modExp_1_while_C_37 : begin
        fsm_output = 9'b110011000;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_38;
      end
      COMP_LOOP_4_modExp_1_while_C_38 : begin
        fsm_output = 9'b110011001;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_39;
      end
      COMP_LOOP_4_modExp_1_while_C_39 : begin
        fsm_output = 9'b110011010;
        state_var_NS = COMP_LOOP_4_modExp_1_while_C_40;
      end
      COMP_LOOP_4_modExp_1_while_C_40 : begin
        fsm_output = 9'b110011011;
        if ( COMP_LOOP_4_modExp_1_while_C_40_tr0 ) begin
          state_var_NS = COMP_LOOP_C_197;
        end
        else begin
          state_var_NS = COMP_LOOP_4_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_197 : begin
        fsm_output = 9'b110011100;
        state_var_NS = COMP_LOOP_C_198;
      end
      COMP_LOOP_C_198 : begin
        fsm_output = 9'b110011101;
        state_var_NS = COMP_LOOP_C_199;
      end
      COMP_LOOP_C_199 : begin
        fsm_output = 9'b110011110;
        state_var_NS = COMP_LOOP_C_200;
      end
      COMP_LOOP_C_200 : begin
        fsm_output = 9'b110011111;
        state_var_NS = COMP_LOOP_C_201;
      end
      COMP_LOOP_C_201 : begin
        fsm_output = 9'b110100000;
        state_var_NS = COMP_LOOP_C_202;
      end
      COMP_LOOP_C_202 : begin
        fsm_output = 9'b110100001;
        state_var_NS = COMP_LOOP_C_203;
      end
      COMP_LOOP_C_203 : begin
        fsm_output = 9'b110100010;
        state_var_NS = COMP_LOOP_C_204;
      end
      COMP_LOOP_C_204 : begin
        fsm_output = 9'b110100011;
        state_var_NS = COMP_LOOP_C_205;
      end
      COMP_LOOP_C_205 : begin
        fsm_output = 9'b110100100;
        state_var_NS = COMP_LOOP_C_206;
      end
      COMP_LOOP_C_206 : begin
        fsm_output = 9'b110100101;
        state_var_NS = COMP_LOOP_C_207;
      end
      COMP_LOOP_C_207 : begin
        fsm_output = 9'b110100110;
        state_var_NS = COMP_LOOP_C_208;
      end
      COMP_LOOP_C_208 : begin
        fsm_output = 9'b110100111;
        state_var_NS = COMP_LOOP_C_209;
      end
      COMP_LOOP_C_209 : begin
        fsm_output = 9'b110101000;
        state_var_NS = COMP_LOOP_C_210;
      end
      COMP_LOOP_C_210 : begin
        fsm_output = 9'b110101001;
        state_var_NS = COMP_LOOP_C_211;
      end
      COMP_LOOP_C_211 : begin
        fsm_output = 9'b110101010;
        state_var_NS = COMP_LOOP_C_212;
      end
      COMP_LOOP_C_212 : begin
        fsm_output = 9'b110101011;
        state_var_NS = COMP_LOOP_C_213;
      end
      COMP_LOOP_C_213 : begin
        fsm_output = 9'b110101100;
        state_var_NS = COMP_LOOP_C_214;
      end
      COMP_LOOP_C_214 : begin
        fsm_output = 9'b110101101;
        state_var_NS = COMP_LOOP_C_215;
      end
      COMP_LOOP_C_215 : begin
        fsm_output = 9'b110101110;
        state_var_NS = COMP_LOOP_C_216;
      end
      COMP_LOOP_C_216 : begin
        fsm_output = 9'b110101111;
        state_var_NS = COMP_LOOP_C_217;
      end
      COMP_LOOP_C_217 : begin
        fsm_output = 9'b110110000;
        state_var_NS = COMP_LOOP_C_218;
      end
      COMP_LOOP_C_218 : begin
        fsm_output = 9'b110110001;
        state_var_NS = COMP_LOOP_C_219;
      end
      COMP_LOOP_C_219 : begin
        fsm_output = 9'b110110010;
        state_var_NS = COMP_LOOP_C_220;
      end
      COMP_LOOP_C_220 : begin
        fsm_output = 9'b110110011;
        state_var_NS = COMP_LOOP_C_221;
      end
      COMP_LOOP_C_221 : begin
        fsm_output = 9'b110110100;
        state_var_NS = COMP_LOOP_C_222;
      end
      COMP_LOOP_C_222 : begin
        fsm_output = 9'b110110101;
        state_var_NS = COMP_LOOP_C_223;
      end
      COMP_LOOP_C_223 : begin
        fsm_output = 9'b110110110;
        state_var_NS = COMP_LOOP_C_224;
      end
      COMP_LOOP_C_224 : begin
        fsm_output = 9'b110110111;
        state_var_NS = COMP_LOOP_C_225;
      end
      COMP_LOOP_C_225 : begin
        fsm_output = 9'b110111000;
        state_var_NS = COMP_LOOP_C_226;
      end
      COMP_LOOP_C_226 : begin
        fsm_output = 9'b110111001;
        state_var_NS = COMP_LOOP_C_227;
      end
      COMP_LOOP_C_227 : begin
        fsm_output = 9'b110111010;
        state_var_NS = COMP_LOOP_C_228;
      end
      COMP_LOOP_C_228 : begin
        fsm_output = 9'b110111011;
        state_var_NS = COMP_LOOP_C_229;
      end
      COMP_LOOP_C_229 : begin
        fsm_output = 9'b110111100;
        state_var_NS = COMP_LOOP_C_230;
      end
      COMP_LOOP_C_230 : begin
        fsm_output = 9'b110111101;
        state_var_NS = COMP_LOOP_C_231;
      end
      COMP_LOOP_C_231 : begin
        fsm_output = 9'b110111110;
        state_var_NS = COMP_LOOP_C_232;
      end
      COMP_LOOP_C_232 : begin
        fsm_output = 9'b110111111;
        state_var_NS = COMP_LOOP_C_233;
      end
      COMP_LOOP_C_233 : begin
        fsm_output = 9'b111000000;
        state_var_NS = COMP_LOOP_C_234;
      end
      COMP_LOOP_C_234 : begin
        fsm_output = 9'b111000001;
        state_var_NS = COMP_LOOP_C_235;
      end
      COMP_LOOP_C_235 : begin
        fsm_output = 9'b111000010;
        state_var_NS = COMP_LOOP_C_236;
      end
      COMP_LOOP_C_236 : begin
        fsm_output = 9'b111000011;
        state_var_NS = COMP_LOOP_C_237;
      end
      COMP_LOOP_C_237 : begin
        fsm_output = 9'b111000100;
        state_var_NS = COMP_LOOP_C_238;
      end
      COMP_LOOP_C_238 : begin
        fsm_output = 9'b111000101;
        state_var_NS = COMP_LOOP_C_239;
      end
      COMP_LOOP_C_239 : begin
        fsm_output = 9'b111000110;
        state_var_NS = COMP_LOOP_C_240;
      end
      COMP_LOOP_C_240 : begin
        fsm_output = 9'b111000111;
        state_var_NS = COMP_LOOP_C_241;
      end
      COMP_LOOP_C_241 : begin
        fsm_output = 9'b111001000;
        state_var_NS = COMP_LOOP_C_242;
      end
      COMP_LOOP_C_242 : begin
        fsm_output = 9'b111001001;
        state_var_NS = COMP_LOOP_C_243;
      end
      COMP_LOOP_C_243 : begin
        fsm_output = 9'b111001010;
        state_var_NS = COMP_LOOP_C_244;
      end
      COMP_LOOP_C_244 : begin
        fsm_output = 9'b111001011;
        state_var_NS = COMP_LOOP_C_245;
      end
      COMP_LOOP_C_245 : begin
        fsm_output = 9'b111001100;
        state_var_NS = COMP_LOOP_C_246;
      end
      COMP_LOOP_C_246 : begin
        fsm_output = 9'b111001101;
        state_var_NS = COMP_LOOP_C_247;
      end
      COMP_LOOP_C_247 : begin
        fsm_output = 9'b111001110;
        state_var_NS = COMP_LOOP_C_248;
      end
      COMP_LOOP_C_248 : begin
        fsm_output = 9'b111001111;
        state_var_NS = COMP_LOOP_C_249;
      end
      COMP_LOOP_C_249 : begin
        fsm_output = 9'b111010000;
        state_var_NS = COMP_LOOP_C_250;
      end
      COMP_LOOP_C_250 : begin
        fsm_output = 9'b111010001;
        state_var_NS = COMP_LOOP_C_251;
      end
      COMP_LOOP_C_251 : begin
        fsm_output = 9'b111010010;
        state_var_NS = COMP_LOOP_C_252;
      end
      COMP_LOOP_C_252 : begin
        fsm_output = 9'b111010011;
        state_var_NS = COMP_LOOP_C_253;
      end
      COMP_LOOP_C_253 : begin
        fsm_output = 9'b111010100;
        state_var_NS = COMP_LOOP_C_254;
      end
      COMP_LOOP_C_254 : begin
        fsm_output = 9'b111010101;
        state_var_NS = COMP_LOOP_C_255;
      end
      COMP_LOOP_C_255 : begin
        fsm_output = 9'b111010110;
        state_var_NS = COMP_LOOP_C_256;
      end
      COMP_LOOP_C_256 : begin
        fsm_output = 9'b111010111;
        state_var_NS = COMP_LOOP_C_257;
      end
      COMP_LOOP_C_257 : begin
        fsm_output = 9'b111011000;
        state_var_NS = COMP_LOOP_C_258;
      end
      COMP_LOOP_C_258 : begin
        fsm_output = 9'b111011001;
        state_var_NS = COMP_LOOP_C_259;
      end
      COMP_LOOP_C_259 : begin
        fsm_output = 9'b111011010;
        state_var_NS = COMP_LOOP_C_260;
      end
      COMP_LOOP_C_260 : begin
        fsm_output = 9'b111011011;
        if ( COMP_LOOP_C_260_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 9'b111011100;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_9;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_9 : begin
        fsm_output = 9'b111011101;
        if ( STAGE_LOOP_C_9_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 9'b111011110;
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
  wire or_dcpl_2;
  wire nor_tmp;
  wire or_tmp_3;
  wire mux_tmp_31;
  wire or_tmp_32;
  wire nor_tmp_11;
  wire nor_tmp_17;
  wire or_tmp_51;
  wire and_dcpl_7;
  wire nor_tmp_25;
  wire or_tmp_58;
  wire or_tmp_75;
  wire mux_tmp_117;
  wire and_dcpl_13;
  wire and_dcpl_23;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_32;
  wire and_dcpl_33;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_38;
  wire and_dcpl_39;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_44;
  wire and_dcpl_45;
  wire and_dcpl_47;
  wire and_dcpl_48;
  wire and_dcpl_49;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire and_dcpl_60;
  wire and_dcpl_65;
  wire and_dcpl_67;
  wire and_dcpl_68;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire not_tmp_126;
  wire nor_tmp_65;
  wire and_dcpl_84;
  wire mux_tmp_232;
  wire mux_tmp_236;
  wire mux_tmp_248;
  wire mux_tmp_251;
  wire or_tmp_268;
  wire and_dcpl_85;
  wire not_tmp_173;
  wire and_dcpl_86;
  wire and_dcpl_88;
  wire nor_tmp_85;
  wire mux_tmp_272;
  wire mux_tmp_279;
  wire mux_tmp_280;
  wire and_dcpl_91;
  wire or_tmp_325;
  wire nor_tmp_100;
  wire or_dcpl_39;
  wire and_dcpl_104;
  wire and_dcpl_105;
  wire and_dcpl_107;
  wire mux_tmp_399;
  wire or_tmp_414;
  wire and_dcpl_123;
  wire mux_tmp_430;
  wire and_dcpl_124;
  wire and_dcpl_126;
  wire and_dcpl_127;
  wire and_dcpl_128;
  wire and_dcpl_135;
  wire not_tmp_280;
  wire and_dcpl_138;
  wire or_tmp_493;
  wire and_dcpl_146;
  wire not_tmp_294;
  reg exit_COMP_LOOP_1_modExp_1_while_sva;
  reg COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  reg [11:0] VEC_LOOP_j_sva_11_0;
  reg modExp_exp_1_0_1_sva;
  reg [6:0] COMP_LOOP_k_9_2_sva_6_0;
  reg operator_64_false_slc_modExp_exp_0_1_itm;
  reg [11:0] COMP_LOOP_acc_10_cse_12_1_1_sva;
  reg [11:0] COMP_LOOP_acc_1_cse_2_sva;
  reg [10:0] COMP_LOOP_acc_11_psp_sva;
  reg [11:0] COMP_LOOP_acc_1_cse_sva;
  wire modExp_while_and_1_rgt;
  wire and_108_m1c;
  reg reg_vec_rsc_triosy_0_3_obj_ld_cse;
  wire or_262_cse;
  wire and_224_cse;
  wire or_261_cse;
  wire and_225_cse;
  wire or_279_cse;
  wire and_254_cse;
  wire or_580_cse;
  wire and_184_cse;
  wire nor_213_cse;
  wire or_303_cse;
  wire and_187_cse;
  wire or_289_cse;
  wire [63:0] modulo_result_mux_1_cse;
  wire mux_388_cse;
  wire or_63_cse;
  wire nor_210_cse;
  wire nor_291_cse;
  wire nand_62_cse;
  wire nand_57_cse;
  wire nand_35_cse;
  wire nand_88_cse;
  wire and_223_cse;
  wire and_244_cse;
  wire nand_29_cse;
  wire or_69_cse;
  wire and_260_cse;
  wire and_173_cse;
  wire or_607_cse;
  wire COMP_LOOP_nor_2_cse;
  wire mux_77_cse;
  wire [9:0] COMP_LOOP_acc_psp_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_psp_sva_1;
  reg [9:0] COMP_LOOP_acc_psp_sva;
  wire mux_140_itm;
  wire mux_431_itm;
  wire and_dcpl_156;
  wire not_tmp_307;
  wire not_tmp_308;
  wire not_tmp_311;
  wire [63:0] z_out;
  wire [127:0] nl_z_out;
  wire and_dcpl_175;
  wire [64:0] z_out_1;
  wire [65:0] nl_z_out_1;
  wire [63:0] z_out_2;
  wire [64:0] nl_z_out_2;
  wire and_dcpl_197;
  wire and_dcpl_202;
  wire and_dcpl_206;
  wire and_dcpl_209;
  wire and_dcpl_211;
  wire and_dcpl_213;
  wire and_dcpl_215;
  wire and_dcpl_218;
  wire and_dcpl_227;
  wire and_dcpl_229;
  wire [12:0] z_out_4;
  wire [13:0] nl_z_out_4;
  wire and_dcpl_240;
  wire and_dcpl_243;
  wire and_dcpl_247;
  wire and_dcpl_252;
  wire and_dcpl_285;
  wire and_dcpl_294;
  wire [64:0] z_out_8;
  reg [63:0] p_sva;
  reg [63:0] r_sva;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] STAGE_LOOP_lshift_psp_sva;
  reg [63:0] modExp_base_sva;
  reg [63:0] modExp_result_sva;
  reg modExp_exp_1_7_1_sva;
  reg modExp_exp_1_6_1_sva;
  reg modExp_exp_1_5_1_sva;
  reg modExp_exp_1_4_1_sva;
  reg modExp_exp_1_3_1_sva;
  reg modExp_exp_1_2_1_sva;
  reg modExp_exp_1_1_1_sva;
  reg modExp_exp_1_0_1_sva_1;
  reg [63:0] tmp_2_lpi_4_dfm;
  reg [63:0] COMP_LOOP_1_mul_mut;
  reg [62:0] operator_64_false_slc_modExp_exp_63_1_itm;
  reg [63:0] COMP_LOOP_1_acc_8_itm;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [63:0] COMP_LOOP_1_acc_5_mut_mx0w5;
  wire [64:0] nl_COMP_LOOP_1_acc_5_mut_mx0w5;
  wire [9:0] STAGE_LOOP_lshift_psp_sva_mx0w0;
  wire VEC_LOOP_j_sva_11_0_mx0c1;
  wire modExp_result_sva_mx0c0;
  wire modExp_base_sva_mx0c1;
  wire [63:0] modulo_qr_sva_1_mx1w1;
  wire [64:0] nl_modulo_qr_sva_1_mx1w1;
  wire [62:0] operator_64_false_slc_modExp_exp_63_1_3;
  wire tmp_2_lpi_4_dfm_mx0c0;
  wire tmp_2_lpi_4_dfm_mx0c1;
  wire tmp_2_lpi_4_dfm_mx0c2;
  wire tmp_2_lpi_4_dfm_mx0c3;
  wire tmp_2_lpi_4_dfm_mx0c4;
  wire modExp_result_and_rgt;
  wire modExp_result_and_1_rgt;
  reg [62:0] modExp_exp_sva_rsp_1;
  wire and_323_ssc;
  wire COMP_LOOP_or_2_cse;
  wire nor_350_cse;
  wire nor_338_cse;
  wire nor_337_cse;
  wire nor_tmp_154;
  wire or_tmp_553;
  wire or_tmp_556;
  wire [64:0] operator_64_false_operator_64_false_mux_rgt;
  wire not_tmp_395;
  reg operator_64_false_acc_mut_64;
  reg [63:0] operator_64_false_acc_mut_63_0;
  wire nor_216_cse;
  wire or_699_cse;
  wire mux_536_cse;
  wire or_685_cse;
  wire or_554_cse;
  wire COMP_LOOP_or_21_itm;
  wire STAGE_LOOP_acc_itm_2_1;
  wire [11:0] z_out_5_11_0;
  wire z_out_7_8;

  wire[0:0] modulo_result_or_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] nor_211_nl;
  wire[0:0] mux_249_nl;
  wire[0:0] nor_212_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] mux_219_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] or_271_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] or_270_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] or_269_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] or_266_nl;
  wire[0:0] nand_90_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] mux_247_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] and_93_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] nor_214_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] mux_235_nl;
  wire[0:0] mux_234_nl;
  wire[0:0] nor_319_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] nor_320_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] nand_14_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] nor_321_nl;
  wire[0:0] mux_264_nl;
  wire[0:0] mux_263_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] or_305_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] mux_259_nl;
  wire[0:0] or_304_nl;
  wire[0:0] mux_258_nl;
  wire[0:0] or_302_nl;
  wire[0:0] mux_257_nl;
  wire[0:0] or_300_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] nand_78_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] nand_50_nl;
  wire[0:0] and_220_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] or_291_nl;
  wire[0:0] nor_203_nl;
  wire[63:0] modExp_while_if_mux1h_nl;
  wire[0:0] modExp_while_if_or_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] nor_188_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] or_399_nl;
  wire[0:0] or_397_nl;
  wire[0:0] and_192_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] nor_189_nl;
  wire[0:0] nor_190_nl;
  wire[0:0] modExp_1_while_and_8_nl;
  wire[0:0] modExp_1_while_and_10_nl;
  wire[0:0] mux_295_nl;
  wire[0:0] mux_294_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] mux_288_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] and_216_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] or_327_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] or_323_nl;
  wire[0:0] mux_522_nl;
  wire[0:0] mux_521_nl;
  wire[0:0] mux_520_nl;
  wire[0:0] mux_519_nl;
  wire[0:0] mux_518_nl;
  wire[0:0] or_672_nl;
  wire[0:0] mux_517_nl;
  wire[0:0] mux_516_nl;
  wire[0:0] mux_515_nl;
  wire[0:0] mux_514_nl;
  wire[0:0] nor_379_nl;
  wire[0:0] mux_513_nl;
  wire[0:0] mux_512_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] mux_507_nl;
  wire[0:0] mux_506_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] mux_504_nl;
  wire[0:0] mux_503_nl;
  wire[0:0] mux_502_nl;
  wire[0:0] mux_501_nl;
  wire[0:0] mux_500_nl;
  wire[0:0] mux_534_nl;
  wire[0:0] mux_533_nl;
  wire[0:0] nor_373_nl;
  wire[0:0] nor_374_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] nor_375_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] or_684_nl;
  wire[0:0] or_683_nl;
  wire[0:0] and_nl;
  wire[0:0] mux_529_nl;
  wire[0:0] or_681_nl;
  wire[0:0] nor_376_nl;
  wire[0:0] mux_528_nl;
  wire[0:0] nand_104_nl;
  wire[0:0] mux_527_nl;
  wire[0:0] mux_526_nl;
  wire[0:0] mux_525_nl;
  wire[0:0] nand_108_nl;
  wire[0:0] nand_103_nl;
  wire[0:0] mux_524_nl;
  wire[0:0] nor_377_nl;
  wire[0:0] nor_378_nl;
  wire[0:0] or_675_nl;
  wire[0:0] mux_523_nl;
  wire[0:0] or_674_nl;
  wire[0:0] or_673_nl;
  wire[0:0] or_697_nl;
  wire[0:0] or_695_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] or_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] nand_44_nl;
  wire[0:0] or_336_nl;
  wire[0:0] or_663_nl;
  wire[0:0] mux_537_nl;
  wire[0:0] nor_370_nl;
  wire[0:0] nor_371_nl;
  wire[0:0] nor_372_nl;
  wire[0:0] mux_317_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] nor_196_nl;
  wire[0:0] nor_197_nl;
  wire[0:0] and_107_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] and_106_nl;
  wire[0:0] mux_313_nl;
  wire[9:0] COMP_LOOP_1_acc_nl;
  wire[10:0] nl_COMP_LOOP_1_acc_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] and_191_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] nor_185_nl;
  wire[0:0] nor_186_nl;
  wire[0:0] nor_187_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] or_414_nl;
  wire[0:0] or_413_nl;
  wire[0:0] mux_374_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] nand_75_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] mux_375_nl;
  wire[0:0] and_124_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] or_442_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] and_125_nl;
  wire[0:0] operator_64_false_1_mux1h_nl;
  wire[8:0] acc_2_nl;
  wire[9:0] nl_acc_2_nl;
  wire[6:0] operator_64_false_1_mux_13_nl;
  wire[0:0] operator_64_false_1_or_3_nl;
  wire[6:0] operator_64_false_1_mux_14_nl;
  wire[0:0] operator_64_false_1_or_2_nl;
  wire[0:0] mux_405_nl;
  wire[0:0] mux_404_nl;
  wire[0:0] mux_403_nl;
  wire[0:0] or_456_nl;
  wire[0:0] mux_402_nl;
  wire[0:0] mux_401_nl;
  wire[0:0] mux_400_nl;
  wire[0:0] mux_398_nl;
  wire[0:0] mux_397_nl;
  wire[0:0] mux_396_nl;
  wire[0:0] mux_395_nl;
  wire[0:0] or_454_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] mux_393_nl;
  wire[0:0] mux_391_nl;
  wire[0:0] mux_390_nl;
  wire[0:0] mux_389_nl;
  wire[0:0] or_450_nl;
  wire[0:0] mux_387_nl;
  wire[0:0] mux_386_nl;
  wire[0:0] or_449_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] or_448_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] nor_181_nl;
  wire[0:0] nor_182_nl;
  wire[0:0] mux_406_nl;
  wire[0:0] nor_178_nl;
  wire[0:0] nor_179_nl;
  wire[0:0] COMP_LOOP_mux_22_nl;
  wire[0:0] and_136_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] and_177_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] and_178_nl;
  wire[0:0] nor_175_nl;
  wire[0:0] nor_176_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] or_469_nl;
  wire[0:0] or_468_nl;
  wire[0:0] mux_407_nl;
  wire[0:0] and_182_nl;
  wire[0:0] nor_177_nl;
  wire[0:0] mux_426_nl;
  wire[0:0] mux_425_nl;
  wire[0:0] mux_424_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] or_474_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] or_473_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] COMP_LOOP_mux1h_15_nl;
  wire[0:0] mux_433_nl;
  wire[0:0] mux_432_nl;
  wire[0:0] and_176_nl;
  wire[0:0] nor_172_nl;
  wire[0:0] nor_173_nl;
  wire[0:0] COMP_LOOP_mux1h_32_nl;
  wire[0:0] mux_439_nl;
  wire[0:0] mux_438_nl;
  wire[0:0] or_491_nl;
  wire[0:0] mux_437_nl;
  wire[0:0] mux_450_nl;
  wire[0:0] nand_23_nl;
  wire[0:0] mux_449_nl;
  wire[0:0] nor_162_nl;
  wire[0:0] nor_163_nl;
  wire[0:0] or_522_nl;
  wire[0:0] mux_448_nl;
  wire[0:0] or_521_nl;
  wire[0:0] nand_32_nl;
  wire[0:0] COMP_LOOP_or_5_nl;
  wire[0:0] COMP_LOOP_or_6_nl;
  wire[0:0] COMP_LOOP_or_7_nl;
  wire[0:0] COMP_LOOP_or_8_nl;
  wire[0:0] COMP_LOOP_or_11_nl;
  wire[0:0] COMP_LOOP_or_12_nl;
  wire[0:0] and_152_nl;
  wire[0:0] and_155_nl;
  wire[0:0] and_157_nl;
  wire[0:0] and_159_nl;
  wire[0:0] nor_316_nl;
  wire[0:0] mux_32_nl;
  wire[0:0] or_632_nl;
  wire[0:0] or_633_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] mux_475_nl;
  wire[0:0] mux_474_nl;
  wire[0:0] nor_154_nl;
  wire[0:0] and_167_nl;
  wire[0:0] mux_473_nl;
  wire[0:0] mux_472_nl;
  wire[0:0] and_168_nl;
  wire[0:0] mux_471_nl;
  wire[0:0] mux_470_nl;
  wire[0:0] mux_469_nl;
  wire[0:0] mux_468_nl;
  wire[0:0] mux_467_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] and_170_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] mux_464_nl;
  wire[0:0] mux_463_nl;
  wire[0:0] mux_462_nl;
  wire[0:0] mux_461_nl;
  wire[0:0] mux_460_nl;
  wire[0:0] or_552_nl;
  wire[0:0] mux_459_nl;
  wire[0:0] or_550_nl;
  wire[0:0] or_548_nl;
  wire[0:0] mux_458_nl;
  wire[0:0] nand_26_nl;
  wire[0:0] mux_457_nl;
  wire[0:0] or_545_nl;
  wire[0:0] or_543_nl;
  wire[0:0] mux_456_nl;
  wire[0:0] or_36_nl;
  wire[0:0] or_35_nl;
  wire[0:0] nor_276_nl;
  wire[0:0] mux_139_nl;
  wire[0:0] and_241_nl;
  wire[0:0] or_286_nl;
  wire[0:0] or_284_nl;
  wire[0:0] mux_267_nl;
  wire[0:0] nand_80_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] nor_207_nl;
  wire[0:0] nor_208_nl;
  wire[0:0] or_613_nl;
  wire[0:0] mux_265_nl;
  wire[0:0] or_308_nl;
  wire[0:0] or_307_nl;
  wire[0:0] nor_205_nl;
  wire[0:0] mux_26_nl;
  wire[0:0] or_635_nl;
  wire[0:0] nor_206_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] nor_nl;
  wire[0:0] and_98_nl;
  wire[0:0] nor_202_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] nor_273_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] nand_65_nl;
  wire[0:0] or_405_nl;
  wire[0:0] and_240_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] nor_274_nl;
  wire[0:0] nor_275_nl;
  wire[0:0] nor_288_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] nand_36_nl;
  wire[0:0] mux_411_nl;
  wire[0:0] and_179_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] nor_174_nl;
  wire[0:0] or_465_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] or_475_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] mux_436_nl;
  wire[0:0] nor_271_nl;
  wire[0:0] mux_435_nl;
  wire[0:0] or_489_nl;
  wire[0:0] or_488_nl;
  wire[0:0] nor_272_nl;
  wire[0:0] mux_434_nl;
  wire[0:0] or_484_nl;
  wire[0:0] or_482_nl;
  wire[0:0] and_175_nl;
  wire[0:0] mux_481_nl;
  wire[0:0] nor_149_nl;
  wire[0:0] nor_150_nl;
  wire[0:0] nor_161_nl;
  wire[0:0] mux_480_nl;
  wire[0:0] or_564_nl;
  wire[0:0] or_562_nl;
  wire[0:0] and_166_nl;
  wire[0:0] mux_478_nl;
  wire[0:0] nor_151_nl;
  wire[0:0] nor_152_nl;
  wire[0:0] nor_153_nl;
  wire[0:0] nor_199_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] nor_170_nl;
  wire[0:0] nor_171_nl;
  wire[0:0] mux_440_nl;
  wire[0:0] or_495_nl;
  wire[0:0] or_494_nl;
  wire[0:0] mux_443_nl;
  wire[0:0] nor_168_nl;
  wire[0:0] nor_169_nl;
  wire[0:0] mux_442_nl;
  wire[0:0] or_501_nl;
  wire[0:0] or_500_nl;
  wire[0:0] mux_445_nl;
  wire[0:0] nor_166_nl;
  wire[0:0] nor_167_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] or_507_nl;
  wire[0:0] or_506_nl;
  wire[0:0] mux_447_nl;
  wire[0:0] nor_164_nl;
  wire[0:0] nor_165_nl;
  wire[0:0] mux_446_nl;
  wire[0:0] or_514_nl;
  wire[0:0] nand_34_nl;
  wire[2:0] STAGE_LOOP_acc_nl;
  wire[3:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] and_62_nl;
  wire[0:0] nor_311_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] or_629_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] or_134_nl;
  wire[0:0] or_133_nl;
  wire[0:0] or_630_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] nand_92_nl;
  wire[0:0] and_66_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] nor_267_nl;
  wire[0:0] nor_268_nl;
  wire[0:0] and_72_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] nor_265_nl;
  wire[0:0] nor_266_nl;
  wire[0:0] and_79_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] nor_263_nl;
  wire[0:0] nor_264_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] nand_85_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] nor_257_nl;
  wire[0:0] nor_258_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] or_625_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] or_156_nl;
  wire[0:0] or_154_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] or_626_nl;
  wire[0:0] or_627_nl;
  wire[0:0] or_628_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] or_147_nl;
  wire[0:0] or_145_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] nor_252_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] and_237_nl;
  wire[0:0] mux_158_nl;
  wire[0:0] nor_253_nl;
  wire[0:0] nor_254_nl;
  wire[0:0] nor_255_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] or_168_nl;
  wire[0:0] or_166_nl;
  wire[0:0] nor_256_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] mux_155_nl;
  wire[0:0] or_164_nl;
  wire[0:0] or_163_nl;
  wire[0:0] or_161_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] nand_84_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] nor_246_nl;
  wire[0:0] nor_247_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] or_621_nl;
  wire[0:0] mux_164_nl;
  wire[0:0] or_186_nl;
  wire[0:0] nand_91_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] or_622_nl;
  wire[0:0] or_623_nl;
  wire[0:0] or_624_nl;
  wire[0:0] mux_162_nl;
  wire[0:0] or_177_nl;
  wire[0:0] or_175_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] and_282_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] and_234_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] nor_241_nl;
  wire[0:0] nor_242_nl;
  wire[0:0] and_235_nl;
  wire[0:0] mux_171_nl;
  wire[0:0] nor_243_nl;
  wire[0:0] nor_244_nl;
  wire[0:0] nor_245_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] mux_169_nl;
  wire[0:0] or_194_nl;
  wire[0:0] or_193_nl;
  wire[0:0] or_191_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] nand_83_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] nor_234_nl;
  wire[0:0] nor_235_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] or_617_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] or_215_nl;
  wire[0:0] or_213_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] or_618_nl;
  wire[0:0] or_619_nl;
  wire[0:0] or_620_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] or_206_nl;
  wire[0:0] or_204_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] and_283_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] and_232_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] nor_230_nl;
  wire[0:0] nor_231_nl;
  wire[0:0] nor_232_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] or_227_nl;
  wire[0:0] or_225_nl;
  wire[0:0] nor_233_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] or_223_nl;
  wire[0:0] or_222_nl;
  wire[0:0] or_220_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] nand_81_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] nor_223_nl;
  wire[0:0] nor_224_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] or_614_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] nor_226_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] nand_82_nl;
  wire[0:0] or_615_nl;
  wire[0:0] or_616_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] or_236_nl;
  wire[0:0] or_234_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] and_281_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] and_227_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] nor_218_nl;
  wire[0:0] nor_219_nl;
  wire[0:0] and_228_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] nor_220_nl;
  wire[0:0] nor_221_nl;
  wire[0:0] nor_222_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] or_251_nl;
  wire[0:0] or_250_nl;
  wire[0:0] or_248_nl;
  wire[0:0] nor_344_nl;
  wire[0:0] mux_487_nl;
  wire[0:0] and_433_nl;
  wire[0:0] nor_346_nl;
  wire[0:0] mux_nl;
  wire[0:0] or_638_nl;
  wire[0:0] or_662_nl;
  wire[0:0] and_431_nl;
  wire[0:0] mux_493_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] mux_491_nl;
  wire[0:0] and_432_nl;
  wire[0:0] nor_340_nl;
  wire[0:0] nor_341_nl;
  wire[0:0] nor_342_nl;
  wire[0:0] nor_343_nl;
  wire[0:0] mux_490_nl;
  wire[0:0] or_647_nl;
  wire[0:0] mux_489_nl;
  wire[0:0] or_646_nl;
  wire[0:0] or_645_nl;
  wire[0:0] mux_318_nl;
  wire[63:0] modExp_while_mux1h_3_nl;
  wire[0:0] and_441_nl;
  wire[0:0] and_442_nl;
  wire[63:0] modExp_while_mux_1_nl;
  wire[0:0] modExp_while_or_1_nl;
  wire[52:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_2_nl;
  wire[0:0] COMP_LOOP_not_104_nl;
  wire[10:0] COMP_LOOP_mux_24_nl;
  wire[6:0] COMP_LOOP_COMP_LOOP_and_4_nl;
  wire[0:0] not_1505_nl;
  wire[55:0] COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_3_nl;
  wire[0:0] COMP_LOOP_not_105_nl;
  wire[6:0] COMP_LOOP_mux_25_nl;
  wire[9:0] COMP_LOOP_mux1h_70_nl;
  wire[9:0] COMP_LOOP_acc_35_nl;
  wire[10:0] nl_COMP_LOOP_acc_35_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_or_5_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_nor_1_nl;
  wire[1:0] COMP_LOOP_mux_26_nl;
  wire[0:0] and_449_nl;
  wire[0:0] and_450_nl;
  wire[0:0] and_451_nl;
  wire[0:0] and_443_nl;
  wire[0:0] COMP_LOOP_or_27_nl;
  wire[0:0] and_448_nl;
  wire[12:0] acc_4_nl;
  wire[13:0] nl_acc_4_nl;
  wire[2:0] COMP_LOOP_COMP_LOOP_mux_3_nl;
  wire[8:0] COMP_LOOP_COMP_LOOP_mux_4_nl;
  wire[0:0] COMP_LOOP_or_28_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_3_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_4_nl;
  wire[8:0] operator_64_false_1_acc_nl;
  wire[9:0] nl_operator_64_false_1_acc_nl;
  wire[0:0] operator_64_false_1_mux_15_nl;
  wire[0:0] operator_64_false_1_mux_16_nl;
  wire[0:0] operator_64_false_1_mux_17_nl;
  wire[0:0] operator_64_false_1_mux_18_nl;
  wire[0:0] operator_64_false_1_mux_19_nl;
  wire[0:0] operator_64_false_1_mux_20_nl;
  wire[0:0] operator_64_false_1_mux_21_nl;
  wire[65:0] acc_7_nl;
  wire[66:0] nl_acc_7_nl;
  wire[63:0] COMP_LOOP_mux_27_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nand_2_nl;
  wire[0:0] mux_540_nl;
  wire[0:0] nand_113_nl;
  wire[0:0] mux_541_nl;
  wire[0:0] and_452_nl;
  wire[0:0] nor_383_nl;
  wire[0:0] nand_114_nl;
  wire[0:0] mux_542_nl;
  wire[0:0] nor_384_nl;
  wire[0:0] nor_385_nl;
  wire[63:0] COMP_LOOP_COMP_LOOP_nand_3_nl;
  wire[0:0] COMP_LOOP_not_106_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [10:0] nl_operator_66_true_div_cmp_b;
  assign nl_operator_66_true_div_cmp_b = {1'b0, operator_66_true_div_cmp_b_9_0};
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0 = ~ (z_out_1[64]);
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 = ~ modExp_exp_1_0_1_sva;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_65_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_65_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_130_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_130_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_195_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_195_tr0 = ~ modExp_exp_1_0_1_sva;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0
      = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = z_out_4[12];
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0 = ~ STAGE_LOOP_acc_itm_2_1;
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
      .STAGE_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0[0:0]),
      .modExp_while_C_40_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .COMP_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0[0:0]),
      .COMP_LOOP_1_modExp_1_while_C_40_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .COMP_LOOP_C_65_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_65_tr0[0:0]),
      .COMP_LOOP_2_modExp_1_while_C_40_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0[0:0]),
      .COMP_LOOP_C_130_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_130_tr0[0:0]),
      .COMP_LOOP_3_modExp_1_while_C_40_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0[0:0]),
      .COMP_LOOP_C_195_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_195_tr0[0:0]),
      .COMP_LOOP_4_modExp_1_while_C_40_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0[0:0]),
      .COMP_LOOP_C_260_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_9_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0[0:0])
    );
  assign or_262_cse = (~ (fsm_output[0])) | (fsm_output[6]);
  assign and_224_cse = (fsm_output[2:1]==2'b11);
  assign or_261_cse = (fsm_output[3:2]!=2'b00);
  assign and_225_cse = (fsm_output[1:0]==2'b11);
  assign or_279_cse = (fsm_output[2:1]!=2'b00);
  assign nor_213_cse = ~((fsm_output[6]) | (~ (fsm_output[8])));
  assign or_303_cse = (fsm_output[1:0]!=2'b00);
  assign or_289_cse = (fsm_output[8]) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (fsm_output[6]);
  assign nor_210_cse = ~((fsm_output[1:0]!=2'b00));
  assign and_223_cse = (fsm_output[3:2]==2'b11);
  assign nor_216_cse = ~((~ (fsm_output[0])) | (fsm_output[6]));
  assign or_399_nl = (~ (fsm_output[7])) | (fsm_output[1]) | (fsm_output[3]) | (~
      (fsm_output[5]));
  assign or_397_nl = (fsm_output[7]) | (~ (fsm_output[1])) | (~ (fsm_output[3]))
      | (fsm_output[5]);
  assign mux_355_nl = MUX_s_1_2_2(or_399_nl, or_397_nl, fsm_output[8]);
  assign nor_188_nl = ~((fsm_output[4]) | (fsm_output[0]) | (fsm_output[6]) | mux_355_nl);
  assign nor_189_nl = ~((~ (fsm_output[6])) | (~ (fsm_output[8])) | (fsm_output[7])
      | (fsm_output[1]) | (fsm_output[3]) | (~ (fsm_output[5])));
  assign nor_190_nl = ~((fsm_output[6]) | (fsm_output[8]) | (fsm_output[7]) | (fsm_output[1])
      | (fsm_output[3]) | (~ (fsm_output[5])));
  assign mux_354_nl = MUX_s_1_2_2(nor_189_nl, nor_190_nl, fsm_output[0]);
  assign and_192_nl = (fsm_output[4]) & mux_354_nl;
  assign mux_356_nl = MUX_s_1_2_2(nor_188_nl, and_192_nl, fsm_output[2]);
  assign modExp_while_if_or_nl = and_dcpl_84 | (mux_356_nl & modExp_exp_1_0_1_sva);
  assign modExp_1_while_and_8_nl = (~ (modulo_result_rem_cmp_z[63])) & modExp_exp_1_0_1_sva
      & and_dcpl_104;
  assign modExp_1_while_and_10_nl = (modulo_result_rem_cmp_z[63]) & modExp_exp_1_0_1_sva
      & and_dcpl_104;
  assign modExp_while_if_mux1h_nl = MUX1HOT_v_64_5_2(z_out, 64'b0000000000000000000000000000000000000000000000000000000000000001,
      modulo_result_rem_cmp_z, modulo_qr_sva_1_mx1w1, COMP_LOOP_1_acc_5_mut_mx0w5,
      {modExp_while_if_or_nl , COMP_LOOP_nor_2_cse , modExp_1_while_and_8_nl , modExp_1_while_and_10_nl
      , and_dcpl_85});
  assign mux_289_nl = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), and_223_cse);
  assign mux_290_nl = MUX_s_1_2_2(mux_289_nl, mux_tmp_279, fsm_output[1]);
  assign mux_291_nl = MUX_s_1_2_2(mux_tmp_280, mux_290_nl, fsm_output[0]);
  assign mux_287_nl = MUX_s_1_2_2(nor_291_cse, mux_tmp_117, and_224_cse);
  assign mux_286_nl = MUX_s_1_2_2(nor_291_cse, and_254_cse, and_224_cse);
  assign mux_288_nl = MUX_s_1_2_2(mux_287_nl, mux_286_nl, fsm_output[0]);
  assign mux_292_nl = MUX_s_1_2_2(mux_291_nl, (~ mux_288_nl), fsm_output[7]);
  assign mux_285_nl = MUX_s_1_2_2(nor_291_cse, and_244_cse, fsm_output[7]);
  assign mux_293_nl = MUX_s_1_2_2(mux_292_nl, mux_285_nl, fsm_output[8]);
  assign mux_283_nl = MUX_s_1_2_2((~ and_260_cse), nor_tmp_25, fsm_output[7]);
  assign mux_284_nl = MUX_s_1_2_2(or_tmp_58, mux_283_nl, fsm_output[8]);
  assign mux_294_nl = MUX_s_1_2_2(mux_293_nl, (~ mux_284_nl), fsm_output[5]);
  assign and_216_nl = (fsm_output[7]) & (~ mux_tmp_280);
  assign mux_277_nl = MUX_s_1_2_2(nor_291_cse, mux_tmp_117, or_607_cse);
  assign or_327_nl = and_173_cse | (fsm_output[4:3]!=2'b00);
  assign mux_278_nl = MUX_s_1_2_2(mux_277_nl, or_327_nl, fsm_output[7]);
  assign mux_281_nl = MUX_s_1_2_2(and_216_nl, mux_278_nl, fsm_output[8]);
  assign mux_274_nl = MUX_s_1_2_2((~ and_260_cse), nor_tmp_11, fsm_output[7]);
  assign or_323_nl = (fsm_output[7]) | (~ nor_tmp_25);
  assign mux_275_nl = MUX_s_1_2_2(mux_274_nl, or_323_nl, fsm_output[8]);
  assign mux_282_nl = MUX_s_1_2_2(mux_281_nl, mux_275_nl, fsm_output[5]);
  assign mux_295_nl = MUX_s_1_2_2(mux_294_nl, mux_282_nl, fsm_output[6]);
  assign operator_64_false_operator_64_false_mux_rgt = MUX_v_65_2_2(({1'b0 , modExp_while_if_mux1h_nl}),
      z_out_8, mux_295_nl);
  assign or_699_cse = (~ (fsm_output[8])) | (fsm_output[6]);
  assign or_685_cse = (~ (fsm_output[8])) | (fsm_output[2]);
  assign and_254_cse = (fsm_output[4:3]==2'b11);
  assign or_697_nl = (fsm_output[1]) | (~ (fsm_output[0])) | (fsm_output[4]) | (~
      (fsm_output[3]));
  assign or_695_nl = (~ (fsm_output[1])) | (fsm_output[0]) | (~ (fsm_output[4]))
      | (fsm_output[3]);
  assign mux_536_cse = MUX_s_1_2_2(or_697_nl, or_695_nl, fsm_output[5]);
  assign and_108_m1c = and_dcpl_47 & and_dcpl_25;
  assign modExp_result_and_rgt = (~ modExp_while_and_1_rgt) & and_108_m1c;
  assign modExp_result_and_1_rgt = modExp_while_and_1_rgt & and_108_m1c;
  assign or_580_cse = (fsm_output[2]) | (fsm_output[4]);
  assign and_184_cse = (fsm_output[2]) & (fsm_output[4]);
  assign and_187_cse = (fsm_output[2:0]==3'b111);
  assign mux_388_cse = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[8]);
  assign or_63_cse = (fsm_output[4:3]!=2'b00);
  assign or_69_cse = (((fsm_output[2:0]!=3'b000)) & (fsm_output[3])) | (fsm_output[4]);
  assign and_260_cse = or_261_cse & (fsm_output[4]);
  assign nand_35_cse = ~((fsm_output[1]) & (fsm_output[7]));
  assign nor_162_nl = ~((fsm_output[1]) | (~ (fsm_output[4])) | (fsm_output[7]) |
      (~ (fsm_output[2])) | (fsm_output[8]));
  assign nor_163_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[4])) | (fsm_output[7])
      | (fsm_output[2]) | (~ (fsm_output[8])));
  assign mux_449_nl = MUX_s_1_2_2(nor_162_nl, nor_163_nl, fsm_output[6]);
  assign nand_23_nl = ~((fsm_output[5]) & mux_449_nl);
  assign or_521_nl = (fsm_output[4]) | (fsm_output[7]) | (fsm_output[2]) | (~ (fsm_output[8]));
  assign nand_32_nl = ~((fsm_output[4]) & (fsm_output[7]) & (fsm_output[2]) & (~
      (fsm_output[8])));
  assign mux_448_nl = MUX_s_1_2_2(or_521_nl, nand_32_nl, fsm_output[1]);
  assign or_522_nl = (fsm_output[6:5]!=2'b00) | mux_448_nl;
  assign mux_450_nl = MUX_s_1_2_2(nand_23_nl, or_522_nl, fsm_output[3]);
  assign COMP_LOOP_nor_2_cse = ~(mux_450_nl | (fsm_output[0]));
  assign modulo_result_mux_1_cse = MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx1w1,
      modulo_result_rem_cmp_z[63]);
  assign and_244_cse = (fsm_output[4:1]==4'b1111);
  assign and_173_cse = or_303_cse & (fsm_output[2]);
  assign or_554_cse = (~ (fsm_output[2])) | (fsm_output[8]);
  assign COMP_LOOP_or_2_cse = and_dcpl_48 | and_dcpl_60 | and_dcpl_68 | and_dcpl_74;
  assign nand_29_cse = ~((fsm_output[1]) & (fsm_output[4]));
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_COMP_LOOP_acc_psp_sva_1 = (VEC_LOOP_j_sva_11_0[11:2]) + conv_u2u_7_10(COMP_LOOP_k_9_2_sva_6_0);
  assign COMP_LOOP_acc_psp_sva_1 = nl_COMP_LOOP_acc_psp_sva_1[9:0];
  assign nl_COMP_LOOP_1_acc_5_mut_mx0w5 = tmp_2_lpi_4_dfm + modulo_result_mux_1_cse;
  assign COMP_LOOP_1_acc_5_mut_mx0w5 = nl_COMP_LOOP_1_acc_5_mut_mx0w5[63:0];
  assign modExp_while_and_1_rgt = (modulo_result_rem_cmp_z[63]) & operator_64_false_slc_modExp_exp_0_1_itm;
  assign nl_modulo_qr_sva_1_mx1w1 = modulo_result_rem_cmp_z + p_sva;
  assign modulo_qr_sva_1_mx1w1 = nl_modulo_qr_sva_1_mx1w1[63:0];
  assign operator_64_false_slc_modExp_exp_63_1_3 = MUX_v_63_2_2((operator_66_true_div_cmp_z[63:1]),
      ({1'b0 , (modExp_exp_sva_rsp_1[62:1])}), or_dcpl_39);
  assign nand_88_cse = ~((fsm_output[7]) & (fsm_output[1]) & (fsm_output[2]) & (fsm_output[3])
      & (fsm_output[4]));
  assign or_dcpl_2 = (~ exit_COMP_LOOP_1_modExp_1_while_sva) | (z_out_1[64]);
  assign nor_tmp = (fsm_output[8:7]==2'b11);
  assign or_tmp_3 = (fsm_output[8]) | (fsm_output[6]);
  assign or_36_nl = (fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[7]);
  assign or_35_nl = (~ (fsm_output[3])) | (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_tmp_31 = MUX_s_1_2_2(or_36_nl, or_35_nl, fsm_output[1]);
  assign or_tmp_32 = and_187_cse | (fsm_output[4:3]!=2'b00);
  assign nor_tmp_11 = ((fsm_output[3:0]!=4'b0000)) & (fsm_output[4]);
  assign or_607_cse = and_225_cse | (fsm_output[2]);
  assign nor_tmp_17 = (fsm_output[8]) & (fsm_output[6]);
  assign nor_291_cse = ~((fsm_output[4:3]!=2'b00));
  assign or_tmp_51 = (fsm_output[8]) | (~ (fsm_output[6]));
  assign mux_77_cse = MUX_s_1_2_2((fsm_output[8]), or_tmp_51, fsm_output[4]);
  assign and_dcpl_7 = (fsm_output[1:0]==2'b10);
  assign nor_tmp_25 = ((fsm_output[3:1]!=3'b000)) & (fsm_output[4]);
  assign or_tmp_58 = (fsm_output[7]) | and_260_cse;
  assign or_tmp_75 = (fsm_output[8:7]!=2'b00);
  assign mux_tmp_117 = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[3]);
  assign and_dcpl_13 = (fsm_output[6:5]==2'b10);
  assign nor_276_nl = ~((fsm_output[5]) | (fsm_output[8]) | (fsm_output[7]) | (fsm_output[0])
      | (fsm_output[1]) | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign and_241_nl = (fsm_output[8]) & (fsm_output[7]) & (fsm_output[1]) & (fsm_output[2])
      & (fsm_output[3]) & (fsm_output[4]);
  assign mux_139_nl = MUX_s_1_2_2(and_241_nl, nor_tmp, fsm_output[5]);
  assign mux_140_itm = MUX_s_1_2_2(nor_276_nl, mux_139_nl, fsm_output[6]);
  assign and_dcpl_23 = ~((fsm_output[6:5]!=2'b00));
  assign and_dcpl_24 = ~((fsm_output[8:7]!=2'b00));
  assign and_dcpl_25 = and_dcpl_24 & and_dcpl_23;
  assign and_dcpl_32 = nor_tmp & and_dcpl_13;
  assign and_dcpl_33 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_35 = and_254_cse & (fsm_output[2]);
  assign and_dcpl_36 = and_dcpl_35 & and_dcpl_33;
  assign and_dcpl_38 = (fsm_output[6:5]==2'b01);
  assign and_dcpl_39 = and_dcpl_24 & and_dcpl_38;
  assign and_dcpl_41 = (fsm_output[4:3]==2'b10);
  assign and_dcpl_42 = and_dcpl_41 & (~ (fsm_output[2]));
  assign and_dcpl_44 = and_dcpl_42 & and_225_cse & and_dcpl_39;
  assign and_dcpl_45 = and_dcpl_24 & and_dcpl_13;
  assign and_dcpl_47 = and_dcpl_35 & and_dcpl_7;
  assign and_dcpl_48 = and_dcpl_47 & and_dcpl_45;
  assign and_dcpl_49 = (fsm_output[8:7]==2'b01);
  assign and_dcpl_52 = (fsm_output[4:2]==3'b010);
  assign and_dcpl_53 = and_dcpl_52 & nor_210_cse;
  assign and_dcpl_60 = and_dcpl_53 & and_dcpl_49 & and_dcpl_13;
  assign and_dcpl_65 = (fsm_output[8:7]==2'b10);
  assign and_dcpl_67 = and_dcpl_42 & and_dcpl_7;
  assign and_dcpl_68 = and_dcpl_67 & and_dcpl_65 & and_dcpl_38;
  assign and_dcpl_73 = and_dcpl_35 & nor_210_cse;
  assign and_dcpl_74 = and_dcpl_73 & nor_tmp & and_dcpl_23;
  assign nand_62_cse = ~((fsm_output[4]) & (fsm_output[7]));
  assign not_tmp_126 = ~((COMP_LOOP_acc_10_cse_12_1_1_sva[1]) & (fsm_output[7]));
  assign nand_57_cse = ~((VEC_LOOP_j_sva_11_0[1]) & (fsm_output[7]));
  assign nor_tmp_65 = (fsm_output[4]) & (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b11)
      & (fsm_output[7]);
  assign and_dcpl_84 = and_dcpl_52 & and_dcpl_7 & and_dcpl_25;
  assign mux_tmp_232 = MUX_s_1_2_2((~ (fsm_output[8])), (fsm_output[8]), fsm_output[6]);
  assign mux_tmp_236 = MUX_s_1_2_2((~ mux_tmp_232), mux_tmp_232, fsm_output[7]);
  assign or_286_nl = (fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[6]));
  assign or_284_nl = (~ (fsm_output[2])) | (~ (fsm_output[4])) | (fsm_output[6]);
  assign mux_tmp_248 = MUX_s_1_2_2(or_286_nl, or_284_nl, fsm_output[8]);
  assign mux_tmp_251 = MUX_s_1_2_2(or_tmp_51, or_699_cse, fsm_output[7]);
  assign or_tmp_268 = (fsm_output[8:6]!=3'b011);
  assign nor_207_nl = ~((~ (fsm_output[8])) | (fsm_output[6]) | nand_35_cse);
  assign nor_208_nl = ~((fsm_output[8]) | (~ (fsm_output[6])) | (fsm_output[1]) |
      (fsm_output[7]));
  assign mux_266_nl = MUX_s_1_2_2(nor_207_nl, nor_208_nl, fsm_output[2]);
  assign nand_80_nl = ~((fsm_output[5:4]==2'b11) & mux_266_nl);
  assign or_308_nl = (fsm_output[2]) | (~ (fsm_output[8])) | (~ (fsm_output[6]))
      | (fsm_output[1]) | (fsm_output[7]);
  assign or_307_nl = (~ (fsm_output[2])) | (fsm_output[8]) | (~((fsm_output[6]) &
      (fsm_output[1]) & (fsm_output[7])));
  assign mux_265_nl = MUX_s_1_2_2(or_308_nl, or_307_nl, fsm_output[4]);
  assign or_613_nl = (fsm_output[5]) | mux_265_nl;
  assign mux_267_nl = MUX_s_1_2_2(nand_80_nl, or_613_nl, fsm_output[3]);
  assign and_dcpl_85 = ~(mux_267_nl | (fsm_output[0]));
  assign or_635_nl = (fsm_output[7]) | (fsm_output[1]) | (fsm_output[2]) | (~ (fsm_output[3]))
      | (fsm_output[4]);
  assign mux_26_nl = MUX_s_1_2_2(nand_88_cse, or_635_nl, fsm_output[8]);
  assign nor_205_nl = ~((fsm_output[5]) | mux_26_nl);
  assign nor_206_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[8])) | (fsm_output[7])
      | (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[3]) | (~ (fsm_output[4])));
  assign not_tmp_173 = MUX_s_1_2_2(nor_205_nl, nor_206_nl, fsm_output[6]);
  assign and_dcpl_86 = not_tmp_173 & (fsm_output[0]);
  assign mux_270_nl = MUX_s_1_2_2((fsm_output[3]), (~ (fsm_output[3])), or_279_cse);
  assign nor_nl = ~((~((fsm_output[2:1]!=2'b00))) | (fsm_output[3]));
  assign mux_271_nl = MUX_s_1_2_2(mux_270_nl, nor_nl, fsm_output[0]);
  assign and_dcpl_88 = mux_271_nl & (~ (fsm_output[4])) & and_dcpl_25;
  assign nor_tmp_85 = or_303_cse & (fsm_output[4:2]==3'b111);
  assign and_98_nl = (fsm_output[8:7]==2'b11) & nor_tmp_85;
  assign mux_tmp_272 = MUX_s_1_2_2(and_98_nl, nor_tmp, fsm_output[5]);
  assign mux_tmp_279 = MUX_s_1_2_2(nor_291_cse, mux_tmp_117, fsm_output[2]);
  assign nor_202_nl = ~(and_223_cse | (fsm_output[4]));
  assign mux_tmp_280 = MUX_s_1_2_2(nor_202_nl, mux_tmp_279, fsm_output[1]);
  assign and_dcpl_91 = ~((fsm_output[8]) | (fsm_output[6]));
  assign or_tmp_325 = (or_279_cse & (fsm_output[3])) | (fsm_output[4]);
  assign nor_tmp_100 = (fsm_output[8:6]==3'b111);
  assign or_dcpl_39 = (fsm_output[4:0]!=5'b01001) | or_tmp_75 | (fsm_output[6:5]!=2'b00);
  assign nand_65_nl = ~((fsm_output[2]) & (fsm_output[1]) & (fsm_output[7]));
  assign or_405_nl = (fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]);
  assign mux_358_nl = MUX_s_1_2_2(nand_65_nl, or_405_nl, fsm_output[3]);
  assign nor_273_nl = ~((~ (fsm_output[6])) | (fsm_output[8]) | (fsm_output[5]) |
      mux_358_nl);
  assign nor_274_nl = ~((fsm_output[3:2]!=2'b10) | nand_35_cse);
  assign nor_275_nl = ~((fsm_output[3]) | (fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]));
  assign mux_357_nl = MUX_s_1_2_2(nor_274_nl, nor_275_nl, fsm_output[5]);
  assign and_240_nl = nor_213_cse & mux_357_nl;
  assign mux_359_nl = MUX_s_1_2_2(nor_273_nl, and_240_nl, fsm_output[4]);
  assign and_dcpl_104 = mux_359_nl & (fsm_output[0]);
  assign and_dcpl_105 = and_dcpl_41 & (fsm_output[2]);
  assign and_dcpl_107 = and_dcpl_105 & and_dcpl_33 & and_dcpl_39;
  assign nor_288_nl = ~((fsm_output[4]) | (~ (fsm_output[8])));
  assign mux_tmp_399 = MUX_s_1_2_2(nor_288_nl, mux_77_cse, fsm_output[2]);
  assign or_tmp_414 = (fsm_output[8:7]!=2'b10) | (~((and_225_cse | (fsm_output[3:2]!=2'b00))
      & (fsm_output[4])));
  assign and_dcpl_123 = and_dcpl_105 & nor_210_cse & and_dcpl_39;
  assign nand_36_nl = ~((fsm_output[7]) & (fsm_output[0]) & (fsm_output[1]) & (fsm_output[2])
      & (fsm_output[3]) & (fsm_output[4]));
  assign and_179_nl = or_607_cse & (fsm_output[4:3]==2'b11);
  assign mux_411_nl = MUX_s_1_2_2((~ or_69_cse), and_179_nl, fsm_output[7]);
  assign mux_412_nl = MUX_s_1_2_2(nand_36_nl, mux_411_nl, fsm_output[8]);
  assign nor_174_nl = ~((fsm_output[7]) | ((and_224_cse | (fsm_output[3])) & (fsm_output[4])));
  assign or_465_nl = (fsm_output[7]) | nor_tmp_11;
  assign mux_429_nl = MUX_s_1_2_2(nor_174_nl, or_465_nl, fsm_output[8]);
  assign mux_tmp_430 = MUX_s_1_2_2(mux_412_nl, mux_429_nl, fsm_output[5]);
  assign mux_427_nl = MUX_s_1_2_2(and_244_cse, or_tmp_32, fsm_output[7]);
  assign or_475_nl = (fsm_output[8]) | mux_427_nl;
  assign mux_428_nl = MUX_s_1_2_2(or_475_nl, or_tmp_414, fsm_output[5]);
  assign mux_431_itm = MUX_s_1_2_2(mux_tmp_430, mux_428_nl, fsm_output[6]);
  assign and_dcpl_124 = not_tmp_173 & (~ (fsm_output[0]));
  assign or_489_nl = (fsm_output[1]) | (~ (fsm_output[5])) | (fsm_output[7]);
  assign or_488_nl = (~ (fsm_output[1])) | (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_435_nl = MUX_s_1_2_2(or_489_nl, or_488_nl, fsm_output[3]);
  assign nor_271_nl = ~((~ (fsm_output[8])) | (~ (fsm_output[4])) | (fsm_output[6])
      | mux_435_nl);
  assign or_484_nl = (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[1]))
      | (fsm_output[5]) | (~ (fsm_output[7]));
  assign or_482_nl = (fsm_output[6]) | (fsm_output[3]) | (fsm_output[1]) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign mux_434_nl = MUX_s_1_2_2(or_484_nl, or_482_nl, fsm_output[4]);
  assign nor_272_nl = ~((fsm_output[8]) | mux_434_nl);
  assign mux_436_nl = MUX_s_1_2_2(nor_271_nl, nor_272_nl, fsm_output[2]);
  assign and_dcpl_126 = mux_436_nl & (fsm_output[0]);
  assign and_dcpl_127 = and_dcpl_36 & and_dcpl_45;
  assign and_dcpl_128 = (fsm_output[4]) & (~ (fsm_output[0]));
  assign and_dcpl_135 = (fsm_output[0]) & (~ (COMP_LOOP_acc_10_cse_12_1_1_sva[0]));
  assign nor_149_nl = ~((~ (fsm_output[5])) | (fsm_output[2]) | (~ (fsm_output[4]))
      | (~ (fsm_output[1])) | (fsm_output[7]));
  assign nor_150_nl = ~((fsm_output[5]) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (fsm_output[1]) | (~ (fsm_output[7])));
  assign mux_481_nl = MUX_s_1_2_2(nor_149_nl, nor_150_nl, fsm_output[3]);
  assign and_175_nl = (fsm_output[8]) & mux_481_nl;
  assign or_564_nl = (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[7]));
  assign or_562_nl = (~ (fsm_output[4])) | (~ (fsm_output[1])) | (fsm_output[7]);
  assign mux_480_nl = MUX_s_1_2_2(or_564_nl, or_562_nl, fsm_output[2]);
  assign nor_161_nl = ~((fsm_output[8]) | (~ (fsm_output[3])) | (fsm_output[5]) |
      mux_480_nl);
  assign not_tmp_280 = MUX_s_1_2_2(and_175_nl, nor_161_nl, fsm_output[6]);
  assign and_dcpl_138 = (fsm_output[0]) & (COMP_LOOP_acc_10_cse_12_1_1_sva[0]);
  assign or_tmp_493 = (fsm_output[2]) | (fsm_output[8]);
  assign and_dcpl_146 = (fsm_output[0]) & (~ (fsm_output[6]));
  assign nor_151_nl = ~((fsm_output[1]) | (~ and_dcpl_35));
  assign nor_152_nl = ~((fsm_output[4:1]!=4'b0011));
  assign mux_478_nl = MUX_s_1_2_2(nor_151_nl, nor_152_nl, fsm_output[7]);
  assign and_166_nl = (fsm_output[8]) & mux_478_nl;
  assign nor_153_nl = ~((fsm_output[8]) | (~ (fsm_output[7])) | (~ (fsm_output[1]))
      | (fsm_output[2]) | (fsm_output[3]) | (~ (fsm_output[4])));
  assign not_tmp_294 = MUX_s_1_2_2(and_166_nl, nor_153_nl, fsm_output[5]);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_36 & and_dcpl_32;
  assign VEC_LOOP_j_sva_11_0_mx0c1 = and_dcpl_73 & and_dcpl_32;
  assign nor_199_nl = ~((fsm_output[5]) | (fsm_output[8]) | (fsm_output[7]) | or_tmp_325);
  assign modExp_result_sva_mx0c0 = MUX_s_1_2_2(nor_199_nl, mux_tmp_272, fsm_output[6]);
  assign modExp_base_sva_mx0c1 = and_dcpl_67 & and_dcpl_39;
  assign nor_170_nl = ~((~ (fsm_output[6])) | (~ (fsm_output[8])) | (~ (fsm_output[1]))
      | (fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b00));
  assign or_495_nl = (VEC_LOOP_j_sva_11_0[1:0]!=2'b00) | (fsm_output[3]) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign or_494_nl = (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b00) | (~ (fsm_output[3]))
      | (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_440_nl = MUX_s_1_2_2(or_495_nl, or_494_nl, fsm_output[1]);
  assign nor_171_nl = ~((fsm_output[6]) | (fsm_output[8]) | mux_440_nl);
  assign mux_441_nl = MUX_s_1_2_2(nor_170_nl, nor_171_nl, fsm_output[2]);
  assign tmp_2_lpi_4_dfm_mx0c0 = mux_441_nl & and_dcpl_128;
  assign nor_168_nl = ~((~ (fsm_output[6])) | (~ (fsm_output[8])) | (~ (fsm_output[1]))
      | (fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b01));
  assign or_501_nl = (VEC_LOOP_j_sva_11_0[1:0]!=2'b01) | (fsm_output[3]) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign or_500_nl = (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b01) | (~ (fsm_output[3]))
      | (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_442_nl = MUX_s_1_2_2(or_501_nl, or_500_nl, fsm_output[1]);
  assign nor_169_nl = ~((fsm_output[6]) | (fsm_output[8]) | mux_442_nl);
  assign mux_443_nl = MUX_s_1_2_2(nor_168_nl, nor_169_nl, fsm_output[2]);
  assign tmp_2_lpi_4_dfm_mx0c1 = mux_443_nl & and_dcpl_128;
  assign nor_166_nl = ~((~ (fsm_output[6])) | (~ (fsm_output[8])) | (~ (fsm_output[1]))
      | (fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b10));
  assign or_507_nl = (VEC_LOOP_j_sva_11_0[1:0]!=2'b10) | (fsm_output[3]) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign or_506_nl = (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b10) | (~ (fsm_output[3]))
      | (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_444_nl = MUX_s_1_2_2(or_507_nl, or_506_nl, fsm_output[1]);
  assign nor_167_nl = ~((fsm_output[6]) | (fsm_output[8]) | mux_444_nl);
  assign mux_445_nl = MUX_s_1_2_2(nor_166_nl, nor_167_nl, fsm_output[2]);
  assign tmp_2_lpi_4_dfm_mx0c2 = mux_445_nl & and_dcpl_128;
  assign nor_164_nl = ~((~ (fsm_output[6])) | (~ (fsm_output[8])) | (~ (fsm_output[1]))
      | (fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[7]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b11));
  assign or_514_nl = (VEC_LOOP_j_sva_11_0[1:0]!=2'b11) | (fsm_output[3]) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign nand_34_nl = ~((COMP_LOOP_acc_1_cse_2_sva[1:0]==2'b11) & (fsm_output[3])
      & (~ (fsm_output[5])) & (fsm_output[7]));
  assign mux_446_nl = MUX_s_1_2_2(or_514_nl, nand_34_nl, fsm_output[1]);
  assign nor_165_nl = ~((fsm_output[6]) | (fsm_output[8]) | mux_446_nl);
  assign mux_447_nl = MUX_s_1_2_2(nor_164_nl, nor_165_nl, fsm_output[2]);
  assign tmp_2_lpi_4_dfm_mx0c3 = mux_447_nl & and_dcpl_128;
  assign tmp_2_lpi_4_dfm_mx0c4 = and_dcpl_53 & and_dcpl_65 & and_dcpl_23;
  assign nl_STAGE_LOOP_acc_nl = (STAGE_LOOP_i_3_0_sva_2[3:1]) + 3'b011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[2:0];
  assign STAGE_LOOP_acc_itm_2_1 = readslicef_3_1_2(STAGE_LOOP_acc_nl);
  assign and_62_nl = and_dcpl_53 & and_dcpl_49 & and_dcpl_23;
  assign or_134_nl = (~ (fsm_output[1])) | (~ (fsm_output[8])) | (fsm_output[4])
      | (~ (fsm_output[2])) | (fsm_output[6]);
  assign or_133_nl = (fsm_output[1]) | (~ (fsm_output[8])) | (~ (fsm_output[4]))
      | (fsm_output[2]) | (~ (fsm_output[6]));
  assign mux_143_nl = MUX_s_1_2_2(or_134_nl, or_133_nl, fsm_output[5]);
  assign or_629_nl = (fsm_output[7]) | mux_143_nl;
  assign nand_92_nl = ~((fsm_output[8]) & (fsm_output[4]) & (~ (fsm_output[2])) &
      (fsm_output[6]));
  assign mux_142_nl = MUX_s_1_2_2(or_289_cse, nand_92_nl, fsm_output[1]);
  assign or_630_nl = (~ (fsm_output[7])) | (fsm_output[5]) | mux_142_nl;
  assign mux_144_nl = MUX_s_1_2_2(or_629_nl, or_630_nl, fsm_output[3]);
  assign nor_311_nl = ~(mux_144_nl | (fsm_output[0]));
  assign nor_267_nl = ~((fsm_output[5]) | (~ (fsm_output[0])) | (fsm_output[1]) |
      (~((fsm_output[3:2]==2'b11))));
  assign nor_268_nl = ~((~ (fsm_output[5])) | (fsm_output[0]) | (~ (fsm_output[1]))
      | (fsm_output[2]) | (fsm_output[3]));
  assign mux_145_nl = MUX_s_1_2_2(nor_267_nl, nor_268_nl, fsm_output[6]);
  assign and_66_nl = mux_145_nl & (fsm_output[4]) & (fsm_output[7]) & (~ (fsm_output[8]));
  assign nor_265_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[3])
      | (fsm_output[4]));
  assign nor_266_nl = ~((fsm_output[1:0]!=2'b00) | (~ and_254_cse));
  assign mux_146_nl = MUX_s_1_2_2(nor_265_nl, nor_266_nl, fsm_output[6]);
  assign and_72_nl = mux_146_nl & (fsm_output[2]) & (~ (fsm_output[7])) & (fsm_output[8])
      & (~ (fsm_output[5]));
  assign nor_263_nl = ~((~ (fsm_output[7])) | (fsm_output[0]) | (~ (fsm_output[1]))
      | (~ (fsm_output[2])) | (fsm_output[4]));
  assign nor_264_nl = ~((fsm_output[7]) | (~ (fsm_output[0])) | (fsm_output[1]) |
      (fsm_output[2]) | (~ (fsm_output[4])));
  assign mux_147_nl = MUX_s_1_2_2(nor_263_nl, nor_264_nl, fsm_output[5]);
  assign and_79_nl = mux_147_nl & (~ (fsm_output[3])) & (fsm_output[8]) & (fsm_output[6]);
  assign vec_rsc_0_0_i_adra_d_pff = MUX1HOT_v_10_7_2(COMP_LOOP_acc_psp_sva_1, (z_out_4[12:3]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva[11:2]), (COMP_LOOP_acc_1_cse_2_sva[11:2]),
      (COMP_LOOP_acc_11_psp_sva[10:1]), (COMP_LOOP_acc_1_cse_sva[11:2]), {and_dcpl_44
      , COMP_LOOP_or_2_cse , and_62_nl , nor_311_nl , and_66_nl , and_72_nl , and_79_nl});
  assign vec_rsc_0_0_i_da_d_pff = modulo_result_mux_1_cse;
  assign nor_257_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b00)
      | (fsm_output[7]));
  assign nor_258_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b00)
      | (~ (fsm_output[7])));
  assign mux_152_nl = MUX_s_1_2_2(nor_257_nl, nor_258_nl, fsm_output[6]);
  assign nand_85_nl = ~((fsm_output[8]) & (fsm_output[1]) & mux_152_nl);
  assign or_156_nl = (VEC_LOOP_j_sva_11_0[0]) | (fsm_output[4]) | (VEC_LOOP_j_sva_11_0[1])
      | (~ (fsm_output[7]));
  assign or_154_nl = (~ (fsm_output[4])) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b00)
      | (~ (fsm_output[7]));
  assign mux_150_nl = MUX_s_1_2_2(or_156_nl, or_154_nl, fsm_output[2]);
  assign or_625_nl = (fsm_output[1]) | (fsm_output[6]) | mux_150_nl;
  assign or_626_nl = (~ (fsm_output[6])) | (~ (fsm_output[2])) | (COMP_LOOP_acc_11_psp_sva[0])
      | (VEC_LOOP_j_sva_11_0[0]) | (~ (fsm_output[4])) | (fsm_output[7]);
  assign or_627_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (~ (fsm_output[4]))
      | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b00) | (~ (fsm_output[7]));
  assign mux_149_nl = MUX_s_1_2_2(or_626_nl, or_627_nl, fsm_output[1]);
  assign mux_151_nl = MUX_s_1_2_2(or_625_nl, mux_149_nl, fsm_output[8]);
  assign mux_153_nl = MUX_s_1_2_2(nand_85_nl, mux_151_nl, fsm_output[3]);
  assign or_147_nl = (~ (fsm_output[1])) | (~ (fsm_output[6])) | (fsm_output[2])
      | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b00) | nand_62_cse;
  assign or_145_nl = (fsm_output[1]) | (~ (fsm_output[6])) | (fsm_output[2]) | (~
      (fsm_output[4])) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b00) | (fsm_output[7]);
  assign mux_148_nl = MUX_s_1_2_2(or_147_nl, or_145_nl, fsm_output[8]);
  assign or_628_nl = (fsm_output[3]) | mux_148_nl;
  assign mux_154_nl = MUX_s_1_2_2(mux_153_nl, or_628_nl, fsm_output[5]);
  assign vec_rsc_0_0_i_wea_d_pff = ~(mux_154_nl | (fsm_output[0]));
  assign nor_252_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[4])) | (~ (fsm_output[6]))
      | (fsm_output[2]) | (~ modExp_exp_1_0_1_sva) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b00)
      | (~ (fsm_output[5])) | (fsm_output[3]) | (~ (fsm_output[8])));
  assign nor_253_nl = ~((fsm_output[2]) | (z_out_4[2:1]!=2'b00) | (~ (fsm_output[5]))
      | (fsm_output[3]) | (~ (fsm_output[8])));
  assign nor_254_nl = ~((~ (fsm_output[2])) | (z_out_4[2:1]!=2'b00) | (fsm_output[5])
      | (~ (fsm_output[3])) | (fsm_output[8]));
  assign mux_158_nl = MUX_s_1_2_2(nor_253_nl, nor_254_nl, fsm_output[6]);
  assign and_237_nl = (fsm_output[4]) & mux_158_nl;
  assign or_168_nl = (fsm_output[6]) | (~ (fsm_output[2])) | (COMP_LOOP_acc_11_psp_sva[0])
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[5]) | (fsm_output[3])
      | (~ (fsm_output[8]));
  assign or_166_nl = (fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[3])
      | (VEC_LOOP_j_sva_11_0[1]) | (fsm_output[8]);
  assign mux_157_nl = MUX_s_1_2_2(or_168_nl, or_166_nl, fsm_output[4]);
  assign nor_255_nl = ~((VEC_LOOP_j_sva_11_0[0]) | mux_157_nl);
  assign mux_159_nl = MUX_s_1_2_2(and_237_nl, nor_255_nl, fsm_output[0]);
  assign mux_160_nl = MUX_s_1_2_2(nor_252_nl, mux_159_nl, fsm_output[1]);
  assign or_164_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (z_out_4[2:1]!=2'b00)
      | (fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign or_163_nl = (fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[5]) | (~
      (fsm_output[3])) | (z_out_4[2:1]!=2'b00) | (~ (fsm_output[8]));
  assign mux_155_nl = MUX_s_1_2_2(or_164_nl, or_163_nl, fsm_output[4]);
  assign or_161_nl = (~ (fsm_output[4])) | (fsm_output[6]) | (~ (fsm_output[2]))
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b00)
      | (fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign mux_156_nl = MUX_s_1_2_2(mux_155_nl, or_161_nl, fsm_output[0]);
  assign nor_256_nl = ~((fsm_output[1]) | mux_156_nl);
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_160_nl,
      nor_256_nl, fsm_output[7]);
  assign nor_246_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b01)
      | (fsm_output[7]));
  assign nor_247_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (COMP_LOOP_acc_1_cse_sva[1:0]!=2'b01)
      | (~ (fsm_output[7])));
  assign mux_166_nl = MUX_s_1_2_2(nor_246_nl, nor_247_nl, fsm_output[6]);
  assign nand_84_nl = ~((fsm_output[8]) & (fsm_output[1]) & mux_166_nl);
  assign or_186_nl = (~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[4]) | (VEC_LOOP_j_sva_11_0[1])
      | (~ (fsm_output[7]));
  assign nand_91_nl = ~((fsm_output[4]) & (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]==2'b01)
      & (fsm_output[7]));
  assign mux_164_nl = MUX_s_1_2_2(or_186_nl, nand_91_nl, fsm_output[2]);
  assign or_621_nl = (fsm_output[1]) | (fsm_output[6]) | mux_164_nl;
  assign or_622_nl = (~ (fsm_output[6])) | (~ (fsm_output[2])) | (COMP_LOOP_acc_11_psp_sva[0])
      | (~ (VEC_LOOP_j_sva_11_0[0])) | (~ (fsm_output[4])) | (fsm_output[7]);
  assign or_623_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (~ (fsm_output[4]))
      | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b01) | (~ (fsm_output[7]));
  assign mux_163_nl = MUX_s_1_2_2(or_622_nl, or_623_nl, fsm_output[1]);
  assign mux_165_nl = MUX_s_1_2_2(or_621_nl, mux_163_nl, fsm_output[8]);
  assign mux_167_nl = MUX_s_1_2_2(nand_84_nl, mux_165_nl, fsm_output[3]);
  assign or_177_nl = (~ (fsm_output[1])) | (~ (fsm_output[6])) | (fsm_output[2])
      | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b01) | nand_62_cse;
  assign or_175_nl = (fsm_output[1]) | (~ (fsm_output[6])) | (fsm_output[2]) | (~
      (fsm_output[4])) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b01) | (fsm_output[7]);
  assign mux_162_nl = MUX_s_1_2_2(or_177_nl, or_175_nl, fsm_output[8]);
  assign or_624_nl = (fsm_output[3]) | mux_162_nl;
  assign mux_168_nl = MUX_s_1_2_2(mux_167_nl, or_624_nl, fsm_output[5]);
  assign vec_rsc_0_1_i_wea_d_pff = ~(mux_168_nl | (fsm_output[0]));
  assign and_282_nl = (fsm_output[0]) & (fsm_output[4]) & (fsm_output[6]) & (~ (fsm_output[2]))
      & modExp_exp_1_0_1_sva & (COMP_LOOP_acc_1_cse_sva[1:0]==2'b01) & (fsm_output[5])
      & (~ (fsm_output[3])) & (fsm_output[8]);
  assign nor_241_nl = ~((fsm_output[2]) | (z_out_4[2:1]!=2'b01) | (~ (fsm_output[5]))
      | (fsm_output[3]) | (~ (fsm_output[8])));
  assign nor_242_nl = ~((~ (fsm_output[2])) | (z_out_4[2:1]!=2'b01) | (fsm_output[5])
      | (~ (fsm_output[3])) | (fsm_output[8]));
  assign mux_172_nl = MUX_s_1_2_2(nor_241_nl, nor_242_nl, fsm_output[6]);
  assign and_234_nl = (fsm_output[4]) & mux_172_nl;
  assign nor_243_nl = ~((fsm_output[6]) | (~ (fsm_output[2])) | (COMP_LOOP_acc_11_psp_sva[0])
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[5]) | (fsm_output[3])
      | (~ (fsm_output[8])));
  assign nor_244_nl = ~((fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[5])) |
      (fsm_output[3]) | (VEC_LOOP_j_sva_11_0[1]) | (fsm_output[8]));
  assign mux_171_nl = MUX_s_1_2_2(nor_243_nl, nor_244_nl, fsm_output[4]);
  assign and_235_nl = (VEC_LOOP_j_sva_11_0[0]) & mux_171_nl;
  assign mux_173_nl = MUX_s_1_2_2(and_234_nl, and_235_nl, fsm_output[0]);
  assign mux_174_nl = MUX_s_1_2_2(and_282_nl, mux_173_nl, fsm_output[1]);
  assign or_194_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (z_out_4[2:1]!=2'b01)
      | (fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign or_193_nl = (fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[5]) | (~
      (fsm_output[3])) | (z_out_4[2]) | (~((z_out_4[1]) & (fsm_output[8])));
  assign mux_169_nl = MUX_s_1_2_2(or_194_nl, or_193_nl, fsm_output[4]);
  assign or_191_nl = (~ (fsm_output[4])) | (fsm_output[6]) | (~ (fsm_output[2]))
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b01)
      | (fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign mux_170_nl = MUX_s_1_2_2(mux_169_nl, or_191_nl, fsm_output[0]);
  assign nor_245_nl = ~((fsm_output[1]) | mux_170_nl);
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_174_nl,
      nor_245_nl, fsm_output[7]);
  assign nor_234_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b10)
      | (fsm_output[7]));
  assign nor_235_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (COMP_LOOP_acc_1_cse_sva[0])
      | (~((COMP_LOOP_acc_1_cse_sva[1]) & (fsm_output[7]))));
  assign mux_180_nl = MUX_s_1_2_2(nor_234_nl, nor_235_nl, fsm_output[6]);
  assign nand_83_nl = ~((fsm_output[8]) & (fsm_output[1]) & mux_180_nl);
  assign or_215_nl = (VEC_LOOP_j_sva_11_0[0]) | (fsm_output[4]) | nand_57_cse;
  assign or_213_nl = (~ (fsm_output[4])) | (COMP_LOOP_acc_10_cse_12_1_1_sva[0]) |
      not_tmp_126;
  assign mux_178_nl = MUX_s_1_2_2(or_215_nl, or_213_nl, fsm_output[2]);
  assign or_617_nl = (fsm_output[1]) | (fsm_output[6]) | mux_178_nl;
  assign or_618_nl = (~ (fsm_output[6])) | (~ (fsm_output[2])) | (~ (COMP_LOOP_acc_11_psp_sva[0]))
      | (VEC_LOOP_j_sva_11_0[0]) | (~ (fsm_output[4])) | (fsm_output[7]);
  assign or_619_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (~ (fsm_output[4]))
      | (COMP_LOOP_acc_10_cse_12_1_1_sva[0]) | not_tmp_126;
  assign mux_177_nl = MUX_s_1_2_2(or_618_nl, or_619_nl, fsm_output[1]);
  assign mux_179_nl = MUX_s_1_2_2(or_617_nl, mux_177_nl, fsm_output[8]);
  assign mux_181_nl = MUX_s_1_2_2(nand_83_nl, mux_179_nl, fsm_output[3]);
  assign or_206_nl = (~ (fsm_output[1])) | (~ (fsm_output[6])) | (fsm_output[2])
      | (COMP_LOOP_acc_1_cse_2_sva[0]) | (~((COMP_LOOP_acc_1_cse_2_sva[1]) & (fsm_output[4])
      & (fsm_output[7])));
  assign or_204_nl = (fsm_output[1]) | (~ (fsm_output[6])) | (fsm_output[2]) | (~
      (fsm_output[4])) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b10) | (fsm_output[7]);
  assign mux_176_nl = MUX_s_1_2_2(or_206_nl, or_204_nl, fsm_output[8]);
  assign or_620_nl = (fsm_output[3]) | mux_176_nl;
  assign mux_182_nl = MUX_s_1_2_2(mux_181_nl, or_620_nl, fsm_output[5]);
  assign vec_rsc_0_2_i_wea_d_pff = ~(mux_182_nl | (fsm_output[0]));
  assign and_283_nl = (fsm_output[0]) & (fsm_output[4]) & (fsm_output[6]) & (~ (fsm_output[2]))
      & modExp_exp_1_0_1_sva & (COMP_LOOP_acc_1_cse_sva[1:0]==2'b10) & (fsm_output[5])
      & (~ (fsm_output[3])) & (fsm_output[8]);
  assign nor_230_nl = ~((fsm_output[2]) | (z_out_4[2:1]!=2'b10) | (~ (fsm_output[5]))
      | (fsm_output[3]) | (~ (fsm_output[8])));
  assign nor_231_nl = ~((~ (fsm_output[2])) | (z_out_4[2:1]!=2'b10) | (fsm_output[5])
      | (~ (fsm_output[3])) | (fsm_output[8]));
  assign mux_186_nl = MUX_s_1_2_2(nor_230_nl, nor_231_nl, fsm_output[6]);
  assign and_232_nl = (fsm_output[4]) & mux_186_nl;
  assign or_227_nl = (fsm_output[6]) | (~ (fsm_output[2])) | (~ (COMP_LOOP_acc_11_psp_sva[0]))
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[5]) | (fsm_output[3])
      | (~ (fsm_output[8]));
  assign or_225_nl = (fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[3])
      | (~ (VEC_LOOP_j_sva_11_0[1])) | (fsm_output[8]);
  assign mux_185_nl = MUX_s_1_2_2(or_227_nl, or_225_nl, fsm_output[4]);
  assign nor_232_nl = ~((VEC_LOOP_j_sva_11_0[0]) | mux_185_nl);
  assign mux_187_nl = MUX_s_1_2_2(and_232_nl, nor_232_nl, fsm_output[0]);
  assign mux_188_nl = MUX_s_1_2_2(and_283_nl, mux_187_nl, fsm_output[1]);
  assign or_223_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (z_out_4[2:1]!=2'b10)
      | (fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign or_222_nl = (fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[5]) | (~
      (fsm_output[3])) | (z_out_4[2:1]!=2'b10) | (~ (fsm_output[8]));
  assign mux_183_nl = MUX_s_1_2_2(or_223_nl, or_222_nl, fsm_output[4]);
  assign or_220_nl = (~ (fsm_output[4])) | (fsm_output[6]) | (~ (fsm_output[2]))
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b10)
      | (fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign mux_184_nl = MUX_s_1_2_2(mux_183_nl, or_220_nl, fsm_output[0]);
  assign nor_233_nl = ~((fsm_output[1]) | mux_184_nl);
  assign vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_188_nl,
      nor_233_nl, fsm_output[7]);
  assign nor_223_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b11)
      | (fsm_output[7]));
  assign nor_224_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (~((COMP_LOOP_acc_1_cse_sva[1:0]==2'b11)
      & (fsm_output[7]))));
  assign mux_194_nl = MUX_s_1_2_2(nor_223_nl, nor_224_nl, fsm_output[6]);
  assign nand_81_nl = ~((fsm_output[8]) & (fsm_output[1]) & mux_194_nl);
  assign nor_226_nl = ~((~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[4]) | nand_57_cse);
  assign mux_192_nl = MUX_s_1_2_2(nor_226_nl, nor_tmp_65, fsm_output[2]);
  assign or_614_nl = (fsm_output[1]) | (fsm_output[6]) | (~ mux_192_nl);
  assign nand_82_nl = ~((fsm_output[6]) & (fsm_output[2]) & (COMP_LOOP_acc_11_psp_sva[0])
      & (VEC_LOOP_j_sva_11_0[0]) & (fsm_output[4]) & (~ (fsm_output[7])));
  assign or_615_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (~ nor_tmp_65);
  assign mux_191_nl = MUX_s_1_2_2(nand_82_nl, or_615_nl, fsm_output[1]);
  assign mux_193_nl = MUX_s_1_2_2(or_614_nl, mux_191_nl, fsm_output[8]);
  assign mux_195_nl = MUX_s_1_2_2(nand_81_nl, mux_193_nl, fsm_output[3]);
  assign or_236_nl = (~ (fsm_output[1])) | (~ (fsm_output[6])) | (fsm_output[2])
      | (~((COMP_LOOP_acc_1_cse_2_sva[1:0]==2'b11) & (fsm_output[4]) & (fsm_output[7])));
  assign or_234_nl = (fsm_output[1]) | (~ (fsm_output[6])) | (fsm_output[2]) | (~
      (fsm_output[4])) | (COMP_LOOP_acc_10_cse_12_1_1_sva[1:0]!=2'b11) | (fsm_output[7]);
  assign mux_190_nl = MUX_s_1_2_2(or_236_nl, or_234_nl, fsm_output[8]);
  assign or_616_nl = (fsm_output[3]) | mux_190_nl;
  assign mux_196_nl = MUX_s_1_2_2(mux_195_nl, or_616_nl, fsm_output[5]);
  assign vec_rsc_0_3_i_wea_d_pff = ~(mux_196_nl | (fsm_output[0]));
  assign and_281_nl = (fsm_output[0]) & (fsm_output[4]) & (fsm_output[6]) & (~ (fsm_output[2]))
      & modExp_exp_1_0_1_sva & (COMP_LOOP_acc_1_cse_sva[1:0]==2'b11) & (fsm_output[5])
      & (~ (fsm_output[3])) & (fsm_output[8]);
  assign nor_218_nl = ~((fsm_output[2]) | (z_out_4[2:1]!=2'b11) | (~ (fsm_output[5]))
      | (fsm_output[3]) | (~ (fsm_output[8])));
  assign nor_219_nl = ~((~ (fsm_output[2])) | (z_out_4[2:1]!=2'b11) | (fsm_output[5])
      | (~ (fsm_output[3])) | (fsm_output[8]));
  assign mux_200_nl = MUX_s_1_2_2(nor_218_nl, nor_219_nl, fsm_output[6]);
  assign and_227_nl = (fsm_output[4]) & mux_200_nl;
  assign nor_220_nl = ~((fsm_output[6]) | (~ (fsm_output[2])) | (~ (COMP_LOOP_acc_11_psp_sva[0]))
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[5]) | (fsm_output[3])
      | (~ (fsm_output[8])));
  assign nor_221_nl = ~((fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[5])) |
      (fsm_output[3]) | (~ (VEC_LOOP_j_sva_11_0[1])) | (fsm_output[8]));
  assign mux_199_nl = MUX_s_1_2_2(nor_220_nl, nor_221_nl, fsm_output[4]);
  assign and_228_nl = (VEC_LOOP_j_sva_11_0[0]) & mux_199_nl;
  assign mux_201_nl = MUX_s_1_2_2(and_227_nl, and_228_nl, fsm_output[0]);
  assign mux_202_nl = MUX_s_1_2_2(and_281_nl, mux_201_nl, fsm_output[1]);
  assign or_251_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (z_out_4[2:1]!=2'b11)
      | (fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign or_250_nl = (fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[5]) | (~((fsm_output[3])
      & (z_out_4[2:1]==2'b11) & (fsm_output[8])));
  assign mux_197_nl = MUX_s_1_2_2(or_251_nl, or_250_nl, fsm_output[4]);
  assign or_248_nl = (~ (fsm_output[4])) | (fsm_output[6]) | (~ (fsm_output[2]))
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (COMP_LOOP_acc_1_cse_2_sva[1:0]!=2'b11)
      | (fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign mux_198_nl = MUX_s_1_2_2(mux_197_nl, or_248_nl, fsm_output[0]);
  assign nor_222_nl = ~((fsm_output[1]) | mux_198_nl);
  assign vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_202_nl,
      nor_222_nl, fsm_output[7]);
  assign and_dcpl_156 = (fsm_output[5:1]==5'b00101);
  assign nor_344_nl = ~((fsm_output[8:1]!=8'b00011011));
  assign and_433_nl = (fsm_output[5]) & (~ (fsm_output[7])) & (fsm_output[4]) & (fsm_output[1])
      & (fsm_output[6]) & (~ (fsm_output[2])) & (fsm_output[8]);
  assign or_638_nl = (fsm_output[4]) | (fsm_output[1]) | (fsm_output[6]) | (fsm_output[2])
      | (~ (fsm_output[8]));
  assign or_662_nl = (~ (fsm_output[4])) | (~ (fsm_output[1])) | (fsm_output[6])
      | (~ (fsm_output[2])) | (fsm_output[8]);
  assign mux_nl = MUX_s_1_2_2(or_638_nl, or_662_nl, fsm_output[7]);
  assign nor_346_nl = ~((fsm_output[5]) | mux_nl);
  assign mux_487_nl = MUX_s_1_2_2(and_433_nl, nor_346_nl, fsm_output[3]);
  assign not_tmp_307 = MUX_s_1_2_2(nor_344_nl, mux_487_nl, fsm_output[0]);
  assign not_tmp_308 = ~((fsm_output[4]) & (fsm_output[2]));
  assign and_432_nl = (fsm_output[0]) & (fsm_output[4]) & (fsm_output[2]);
  assign nor_340_nl = ~((fsm_output[0]) | (fsm_output[4]) | (fsm_output[2]));
  assign mux_491_nl = MUX_s_1_2_2(and_432_nl, nor_340_nl, fsm_output[6]);
  assign nor_341_nl = ~((fsm_output[0]) | not_tmp_308);
  assign mux_492_nl = MUX_s_1_2_2(mux_491_nl, nor_341_nl, fsm_output[8]);
  assign nor_342_nl = ~((fsm_output[8]) | (fsm_output[6]) | (fsm_output[0]) | (fsm_output[4])
      | (fsm_output[2]));
  assign mux_493_nl = MUX_s_1_2_2(mux_492_nl, nor_342_nl, fsm_output[7]);
  assign and_431_nl = (~((fsm_output[1]) | (~ (fsm_output[5])))) & mux_493_nl;
  assign or_647_nl = (~ (fsm_output[8])) | (fsm_output[6]) | (fsm_output[0]) | (fsm_output[4])
      | (fsm_output[2]);
  assign or_646_nl = (~ (fsm_output[6])) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[2]);
  assign or_645_nl = (fsm_output[6]) | (fsm_output[0]) | not_tmp_308;
  assign mux_489_nl = MUX_s_1_2_2(or_646_nl, or_645_nl, fsm_output[8]);
  assign mux_490_nl = MUX_s_1_2_2(or_647_nl, mux_489_nl, fsm_output[7]);
  assign nor_343_nl = ~((~ (fsm_output[1])) | (fsm_output[5]) | mux_490_nl);
  assign not_tmp_311 = MUX_s_1_2_2(and_431_nl, nor_343_nl, fsm_output[3]);
  assign and_dcpl_175 = ~((fsm_output!=9'b000001001));
  assign and_dcpl_197 = (~ (fsm_output[3])) & (fsm_output[4]) & (~ (fsm_output[2]))
      & (fsm_output[1]) & (~ (fsm_output[7]));
  assign and_dcpl_202 = and_dcpl_197 & (fsm_output[8]) & (fsm_output[5]) & (~ (fsm_output[0]))
      & (~ (fsm_output[6]));
  assign and_dcpl_206 = (fsm_output[1]) & (~ (fsm_output[7]));
  assign and_dcpl_209 = (fsm_output[4:2]==3'b100) & and_dcpl_206;
  assign and_dcpl_211 = (~ (fsm_output[0])) & (fsm_output[6]);
  assign and_dcpl_213 = (~ (fsm_output[8])) & (~ (fsm_output[5])) & and_dcpl_211;
  assign and_dcpl_215 = (fsm_output[4:2]==3'b111);
  assign and_dcpl_218 = (~ (fsm_output[1])) & (fsm_output[7]);
  assign nor_350_cse = ~((fsm_output[0]) | (fsm_output[6]));
  assign and_dcpl_227 = (fsm_output[8]) & (~ (fsm_output[5]));
  assign and_dcpl_229 = and_dcpl_215 & and_dcpl_218;
  assign and_dcpl_240 = (fsm_output[4:2]==3'b100) & and_dcpl_206 & (~ (fsm_output[8]))
      & (fsm_output[5]) & (fsm_output[0]) & (~ (fsm_output[6]));
  assign and_dcpl_243 = ~((fsm_output[8]) | (fsm_output[5]) | (fsm_output[0]) | (~
      (fsm_output[6])));
  assign and_dcpl_247 = (fsm_output[4:2]==3'b111) & and_dcpl_206 & and_dcpl_243;
  assign and_dcpl_252 = (fsm_output[3]) & (~ (fsm_output[4])) & (~ (fsm_output[2]))
      & (~ (fsm_output[1])) & (fsm_output[7]) & and_dcpl_243;
  assign nor_338_cse = ~((fsm_output[1]) | (fsm_output[7]));
  assign and_dcpl_285 = (fsm_output[4:2]==3'b101) & nor_338_cse & (~ (fsm_output[8]))
      & (fsm_output[5]) & (fsm_output[0]) & (~ (fsm_output[6]));
  assign nor_337_cse = ~((fsm_output[8]) | (fsm_output[5]));
  assign and_dcpl_294 = (fsm_output[4:2]==3'b000) & nor_338_cse & nor_337_cse & (fsm_output[0])
      & (~ (fsm_output[6]));
  assign and_323_ssc = (~ (fsm_output[4])) & (fsm_output[3]) & (~ (fsm_output[2]))
      & (fsm_output[1]) & (~ (fsm_output[7])) & nor_337_cse & nor_350_cse;
  assign nor_tmp_154 = (fsm_output[7:6]==2'b11);
  assign or_tmp_553 = (fsm_output[7:6]!=2'b00);
  assign or_tmp_556 = ~((~(or_303_cse & (fsm_output[6]))) & (fsm_output[7]));
  assign not_tmp_395 = ~((fsm_output[4:3]==2'b11));
  assign COMP_LOOP_or_21_itm = and_dcpl_247 | and_dcpl_252;
  always @(posedge clk) begin
    if ( mux_140_itm ) begin
      p_sva <= p_rsci_idat;
      r_sva <= r_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( (nor_291_cse & (~ (fsm_output[2])) & nor_210_cse & and_dcpl_25) | STAGE_LOOP_i_3_0_sva_mx0c1
        ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_0_3_obj_ld_cse <= 1'b0;
      modExp_exp_1_0_1_sva <= 1'b0;
      modExp_exp_1_0_1_sva_1 <= 1'b0;
      modExp_exp_1_7_1_sva <= 1'b0;
      modExp_exp_1_1_1_sva <= 1'b0;
    end
    else begin
      reg_vec_rsc_triosy_0_3_obj_ld_cse <= and_dcpl_36 & nor_tmp & (fsm_output[6:5]==2'b10)
          & (~ STAGE_LOOP_acc_itm_2_1);
      modExp_exp_1_0_1_sva <= (operator_64_false_1_mux1h_nl & (~(mux_383_nl & nor_210_cse
          & (fsm_output[7:6]==2'b00)))) | (mux_406_nl & (fsm_output[4]) & (fsm_output[1])
          & (~ (fsm_output[0])));
      modExp_exp_1_0_1_sva_1 <= (COMP_LOOP_mux_22_nl & (~(mux_407_nl & (fsm_output[4])
          & (fsm_output[2]) & (~ (fsm_output[0])) & and_dcpl_91))) | mux_426_nl;
      modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_15_nl & (~(mux_433_nl & (fsm_output[0])));
      modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_32_nl & (~ and_dcpl_127);
    end
  end
  always @(posedge clk) begin
    modulo_result_rem_cmp_a <= MUX1HOT_v_64_5_2(z_out, operator_64_false_acc_mut_63_0,
        COMP_LOOP_1_acc_8_itm, COMP_LOOP_1_mul_mut, COMP_LOOP_1_acc_5_mut_mx0w5,
        {modulo_result_or_nl , (~ mux_228_nl) , mux_247_nl , (~ mux_264_nl) , and_dcpl_85});
    modulo_result_rem_cmp_b <= p_sva;
    operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out_8, ({operator_64_false_acc_mut_64
        , operator_64_false_acc_mut_63_0}), and_dcpl_88);
    operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
        STAGE_LOOP_lshift_psp_sva, and_dcpl_88);
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_203_nl, mux_tmp_272, fsm_output[6]) ) begin
      STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( ~ mux_522_nl ) begin
      operator_64_false_acc_mut_64 <= operator_64_false_operator_64_false_mux_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_534_nl, nor_376_nl, fsm_output[5]) ) begin
      operator_64_false_acc_mut_63_0 <= operator_64_false_operator_64_false_mux_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_sva_11_0 <= 12'b000000000000;
    end
    else if ( (~(mux_536_cse | (fsm_output[2]) | (fsm_output[7]) | (~ and_dcpl_91)))
        | VEC_LOOP_j_sva_11_0_mx0c1 ) begin
      VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(12'b000000000000, (z_out_4[11:0]), VEC_LOOP_j_sva_11_0_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_k_9_2_sva_6_0 <= 7'b0000000;
    end
    else if ( MUX_s_1_2_2(mux_537_nl, nor_372_nl, fsm_output[6]) ) begin
      COMP_LOOP_k_9_2_sva_6_0 <= MUX_v_7_2_2(7'b0000000, (z_out_2[6:0]), mux_305_nl);
    end
  end
  always @(posedge clk) begin
    if ( (operator_64_false_slc_modExp_exp_0_1_itm | modExp_result_sva_mx0c0 | (~
        mux_317_nl)) & (modExp_result_sva_mx0c0 | modExp_result_and_rgt | modExp_result_and_1_rgt)
        ) begin
      modExp_result_sva <= MUX1HOT_v_64_3_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
          modulo_result_rem_cmp_z, modulo_qr_sva_1_mx1w1, {modExp_result_sva_mx0c0
          , modExp_result_and_rgt , modExp_result_and_1_rgt});
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_52 & and_dcpl_33 & and_dcpl_25) | modExp_base_sva_mx0c1 ) begin
      modExp_base_sva <= MUX_v_64_2_2(r_sva, modulo_result_mux_1_cse, modExp_base_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      operator_64_false_slc_modExp_exp_0_1_itm <= 1'b0;
    end
    else if ( (~(mux_536_cse | (fsm_output[2]) | (fsm_output[7]) | (fsm_output[8])
        | (fsm_output[6]))) & or_dcpl_2 ) begin
      operator_64_false_slc_modExp_exp_0_1_itm <= MUX_s_1_2_2((operator_66_true_div_cmp_z[0]),
          (modExp_exp_sva_rsp_1[0]), or_dcpl_39);
    end
  end
  always @(posedge clk) begin
    if ( or_dcpl_2 ) begin
      operator_64_false_slc_modExp_exp_63_1_itm <= operator_64_false_slc_modExp_exp_63_1_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= 1'b0;
    end
    else if ( and_dcpl_84 | and_dcpl_107 | and_dcpl_74 ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((~ (z_out_2[63])), (~
          z_out_7_8), (~ (readslicef_10_1_9(COMP_LOOP_1_acc_nl))), {and_dcpl_84 ,
          and_dcpl_107 , and_dcpl_74});
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_52 & and_225_cse & and_dcpl_25) | mux_364_nl | and_dcpl_85 ) begin
      COMP_LOOP_1_acc_8_itm <= MUX_v_64_2_2(z_out, (z_out_8[63:0]), and_dcpl_85);
    end
  end
  always @(posedge clk) begin
    if ( ~((fsm_output[4:0]!=5'b10011) | or_tmp_75 | (fsm_output[6:5]!=2'b01)) )
        begin
      COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_2_sva <= 12'b000000000000;
    end
    else if ( ~(mux_374_nl & (~ (fsm_output[8]))) ) begin
      COMP_LOOP_acc_1_cse_2_sva <= z_out_4[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_11_psp_sva <= 11'b00000000000;
    end
    else if ( MUX_s_1_2_2(mux_378_nl, mux_375_nl, fsm_output[6]) ) begin
      COMP_LOOP_acc_11_psp_sva <= z_out_1[10:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 12'b000000000000;
    end
    else if ( MUX_s_1_2_2((~ mux_381_nl), mux_380_nl, fsm_output[6]) ) begin
      COMP_LOOP_acc_1_cse_sva <= z_out_5_11_0;
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
    else if ( mux_431_itm ) begin
      modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[4]), modExp_exp_1_7_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[5]), {and_dcpl_123 , and_dcpl_126 , and_dcpl_124});
      modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[3]), modExp_exp_1_6_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[4]), {and_dcpl_123 , and_dcpl_126 , and_dcpl_124});
      modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[2]), modExp_exp_1_5_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[3]), {and_dcpl_123 , and_dcpl_126 , and_dcpl_124});
      modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[1]), modExp_exp_1_4_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[2]), {and_dcpl_123 , and_dcpl_126 , and_dcpl_124});
      modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0[0]), modExp_exp_1_3_1_sva,
          (COMP_LOOP_k_9_2_sva_6_0[1]), {and_dcpl_123 , and_dcpl_126 , and_dcpl_124});
    end
  end
  always @(posedge clk) begin
    if ( tmp_2_lpi_4_dfm_mx0c0 | tmp_2_lpi_4_dfm_mx0c1 | tmp_2_lpi_4_dfm_mx0c2 |
        tmp_2_lpi_4_dfm_mx0c3 | tmp_2_lpi_4_dfm_mx0c4 ) begin
      tmp_2_lpi_4_dfm <= MUX1HOT_v_64_4_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d,
          vec_rsc_0_2_i_qa_d, vec_rsc_0_3_i_qa_d, {COMP_LOOP_or_5_nl , COMP_LOOP_or_6_nl
          , COMP_LOOP_or_7_nl , COMP_LOOP_or_8_nl});
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2((~ mux_476_nl), mux_462_nl, fsm_output[6]) ) begin
      COMP_LOOP_1_mul_mut <= MUX1HOT_v_64_8_2(modExp_result_sva, modulo_result_rem_cmp_z,
          modulo_qr_sva_1_mx1w1, vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_2_i_qa_d,
          vec_rsc_0_3_i_qa_d, z_out, {COMP_LOOP_nor_2_cse , COMP_LOOP_or_11_nl ,
          COMP_LOOP_or_12_nl , and_152_nl , and_155_nl , and_157_nl , and_159_nl
          , nor_316_nl});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_12_1_1_sva <= 12'b000000000000;
    end
    else if ( COMP_LOOP_or_2_cse ) begin
      COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out_4[12:1];
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_48 | and_dcpl_86 | and_dcpl_60 ) begin
      COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm <= MUX_s_1_2_2((z_out_5_11_0[9]), z_out_7_8,
          and_dcpl_86);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_sva_rsp_1 <= 63'b000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~(mux_318_nl & and_dcpl_24 & (~ (fsm_output[6]))) ) begin
      modExp_exp_sva_rsp_1 <= operator_64_false_slc_modExp_exp_63_1_3;
    end
  end
  assign mux_249_nl = MUX_s_1_2_2(mux_tmp_248, or_289_cse, fsm_output[0]);
  assign nor_211_nl = ~((fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[7]) |
      mux_249_nl);
  assign nor_212_nl = ~((~ (fsm_output[3])) | (fsm_output[5]) | (~ (fsm_output[7]))
      | (fsm_output[0]) | mux_tmp_248);
  assign mux_250_nl = MUX_s_1_2_2(nor_211_nl, nor_212_nl, fsm_output[1]);
  assign modulo_result_or_nl = and_dcpl_84 | and_dcpl_86 | mux_250_nl;
  assign mux_222_nl = MUX_s_1_2_2((~ or_tmp_51), nor_tmp_17, fsm_output[0]);
  assign mux_221_nl = MUX_s_1_2_2(nor_tmp_17, mux_388_cse, fsm_output[0]);
  assign mux_223_nl = MUX_s_1_2_2(mux_222_nl, mux_221_nl, fsm_output[1]);
  assign mux_224_nl = MUX_s_1_2_2(mux_223_nl, mux_388_cse, fsm_output[2]);
  assign mux_225_nl = MUX_s_1_2_2(or_tmp_51, (~ mux_224_nl), fsm_output[3]);
  assign mux_226_nl = MUX_s_1_2_2(mux_225_nl, or_699_cse, fsm_output[5]);
  assign or_271_nl = (~((fsm_output[0]) | (~ (fsm_output[8])))) | (fsm_output[6]);
  assign mux_217_nl = MUX_s_1_2_2(or_271_nl, or_699_cse, fsm_output[1]);
  assign mux_219_nl = MUX_s_1_2_2((~ mux_388_cse), mux_217_nl, and_223_cse);
  assign or_270_nl = (fsm_output[1]) | (fsm_output[0]) | (~ (fsm_output[8])) | (fsm_output[6]);
  assign or_269_nl = (~ (fsm_output[0])) | (fsm_output[8]) | (~ (fsm_output[6]));
  assign mux_214_nl = MUX_s_1_2_2(or_269_nl, (fsm_output[8]), fsm_output[1]);
  assign mux_215_nl = MUX_s_1_2_2(or_270_nl, mux_214_nl, fsm_output[2]);
  assign mux_216_nl = MUX_s_1_2_2(mux_215_nl, (fsm_output[8]), fsm_output[3]);
  assign mux_220_nl = MUX_s_1_2_2(mux_219_nl, mux_216_nl, fsm_output[5]);
  assign mux_227_nl = MUX_s_1_2_2(mux_226_nl, mux_220_nl, fsm_output[4]);
  assign mux_209_nl = MUX_s_1_2_2((fsm_output[8]), (fsm_output[6]), fsm_output[0]);
  assign mux_210_nl = MUX_s_1_2_2((~ or_699_cse), mux_209_nl, and_224_cse);
  assign mux_211_nl = MUX_s_1_2_2(mux_210_nl, or_699_cse, fsm_output[3]);
  assign mux_212_nl = MUX_s_1_2_2(mux_211_nl, or_tmp_51, fsm_output[5]);
  assign or_266_nl = and_225_cse | (~ (fsm_output[8])) | (fsm_output[6]);
  assign nand_90_nl = ~((fsm_output[1]) & (fsm_output[0]) & (~ (fsm_output[8])) &
      (fsm_output[6]));
  assign mux_206_nl = MUX_s_1_2_2(or_266_nl, nand_90_nl, fsm_output[2]);
  assign mux_207_nl = MUX_s_1_2_2(or_699_cse, mux_206_nl, fsm_output[3]);
  assign mux_204_nl = MUX_s_1_2_2(or_tmp_51, or_262_cse, fsm_output[1]);
  assign mux_205_nl = MUX_s_1_2_2(mux_204_nl, (fsm_output[6]), or_261_cse);
  assign mux_208_nl = MUX_s_1_2_2(mux_207_nl, mux_205_nl, fsm_output[5]);
  assign mux_213_nl = MUX_s_1_2_2(mux_212_nl, mux_208_nl, fsm_output[4]);
  assign mux_228_nl = MUX_s_1_2_2(mux_227_nl, mux_213_nl, fsm_output[7]);
  assign and_93_nl = (fsm_output[7]) & or_262_cse & (fsm_output[8]);
  assign mux_244_nl = MUX_s_1_2_2(nor_213_cse, and_93_nl, and_224_cse);
  assign nor_214_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[6])) | (fsm_output[8]));
  assign mux_242_nl = MUX_s_1_2_2(nor_214_nl, mux_tmp_232, fsm_output[7]);
  assign mux_243_nl = MUX_s_1_2_2(mux_242_nl, mux_tmp_236, or_279_cse);
  assign mux_245_nl = MUX_s_1_2_2(mux_244_nl, mux_243_nl, fsm_output[3]);
  assign mux_241_nl = MUX_s_1_2_2(mux_tmp_232, (~ or_tmp_3), fsm_output[7]);
  assign mux_246_nl = MUX_s_1_2_2(mux_245_nl, mux_241_nl, fsm_output[5]);
  assign mux_235_nl = MUX_s_1_2_2(mux_tmp_232, or_tmp_3, fsm_output[7]);
  assign mux_237_nl = MUX_s_1_2_2(mux_tmp_236, (~ mux_235_nl), fsm_output[1]);
  assign mux_233_nl = MUX_s_1_2_2(or_tmp_3, nor_tmp_17, fsm_output[0]);
  assign nor_319_nl = ~((fsm_output[7]) | (~ mux_233_nl));
  assign nor_320_nl = ~((fsm_output[7]) | (~ mux_tmp_232));
  assign mux_234_nl = MUX_s_1_2_2(nor_319_nl, nor_320_nl, fsm_output[1]);
  assign mux_238_nl = MUX_s_1_2_2(mux_237_nl, mux_234_nl, fsm_output[2]);
  assign mux_239_nl = MUX_s_1_2_2(mux_tmp_236, mux_238_nl, fsm_output[3]);
  assign nand_14_nl = ~((fsm_output[7]) & (~(nor_216_cse | (fsm_output[8]))));
  assign mux_230_nl = MUX_s_1_2_2(or_tmp_3, nand_14_nl, fsm_output[1]);
  assign nor_321_nl = ~((~ (fsm_output[6])) | (fsm_output[8]));
  assign mux_229_nl = MUX_s_1_2_2(nor_tmp_17, nor_321_nl, fsm_output[7]);
  assign mux_231_nl = MUX_s_1_2_2((~ mux_230_nl), mux_229_nl, or_261_cse);
  assign mux_240_nl = MUX_s_1_2_2(mux_239_nl, mux_231_nl, fsm_output[5]);
  assign mux_247_nl = MUX_s_1_2_2(mux_246_nl, mux_240_nl, fsm_output[4]);
  assign or_305_nl = (fsm_output[8:6]!=3'b101);
  assign mux_262_nl = MUX_s_1_2_2(or_305_nl, or_tmp_268, fsm_output[4]);
  assign or_304_nl = (fsm_output[8:6]!=3'b110);
  assign mux_259_nl = MUX_s_1_2_2(or_304_nl, mux_tmp_251, or_303_cse);
  assign or_302_nl = (fsm_output[8:6]!=3'b001);
  assign mux_258_nl = MUX_s_1_2_2(mux_tmp_251, or_302_nl, fsm_output[1]);
  assign mux_260_nl = MUX_s_1_2_2(mux_259_nl, mux_258_nl, fsm_output[4]);
  assign or_300_nl = nor_210_cse | (fsm_output[8:6]!=3'b100);
  assign mux_257_nl = MUX_s_1_2_2(mux_tmp_251, or_300_nl, fsm_output[4]);
  assign mux_261_nl = MUX_s_1_2_2(mux_260_nl, mux_257_nl, fsm_output[2]);
  assign mux_263_nl = MUX_s_1_2_2(mux_262_nl, mux_261_nl, fsm_output[5]);
  assign nand_78_nl = ~((fsm_output[1]) & (fsm_output[0]) & (fsm_output[7]) & (~
      (fsm_output[8])) & (fsm_output[6]));
  assign mux_254_nl = MUX_s_1_2_2(nand_78_nl, or_tmp_268, fsm_output[4]);
  assign nand_50_nl = ~((fsm_output[0]) & (fsm_output[7]) & (fsm_output[8]) & (~
      (fsm_output[6])));
  assign and_220_nl = (fsm_output[4]) & (fsm_output[1]);
  assign mux_253_nl = MUX_s_1_2_2(or_tmp_268, nand_50_nl, and_220_nl);
  assign mux_255_nl = MUX_s_1_2_2(mux_254_nl, mux_253_nl, fsm_output[2]);
  assign or_291_nl = (fsm_output[8:6]!=3'b100);
  assign mux_252_nl = MUX_s_1_2_2(mux_tmp_251, or_291_nl, fsm_output[4]);
  assign mux_256_nl = MUX_s_1_2_2(mux_255_nl, mux_252_nl, fsm_output[5]);
  assign mux_264_nl = MUX_s_1_2_2(mux_263_nl, mux_256_nl, fsm_output[3]);
  assign operator_64_false_1_mux_13_nl = MUX_v_7_2_2((~ COMP_LOOP_k_9_2_sva_6_0),
      (~ (STAGE_LOOP_lshift_psp_sva[9:3])), and_dcpl_202);
  assign operator_64_false_1_or_3_nl = (~(and_dcpl_197 & (~ (fsm_output[8])) & (fsm_output[5])
      & (fsm_output[0]) & (~ (fsm_output[6])))) | and_dcpl_202;
  assign operator_64_false_1_mux_14_nl = MUX_v_7_2_2(7'b0000001, COMP_LOOP_k_9_2_sva_6_0,
      and_dcpl_202);
  assign nl_acc_2_nl = ({1'b1 , operator_64_false_1_mux_13_nl , operator_64_false_1_or_3_nl})
      + conv_u2u_8_9({operator_64_false_1_mux_14_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[8:0];
  assign operator_64_false_1_or_2_nl = and_dcpl_44 | and_dcpl_68;
  assign or_456_nl = ((fsm_output[4]) & (fsm_output[8])) | (fsm_output[6]);
  assign mux_401_nl = MUX_s_1_2_2((fsm_output[8]), mux_tmp_399, fsm_output[0]);
  assign mux_398_nl = MUX_s_1_2_2((fsm_output[8]), or_tmp_51, and_184_cse);
  assign mux_400_nl = MUX_s_1_2_2(mux_tmp_399, mux_398_nl, fsm_output[0]);
  assign mux_402_nl = MUX_s_1_2_2(mux_401_nl, mux_400_nl, fsm_output[1]);
  assign mux_403_nl = MUX_s_1_2_2(or_456_nl, mux_402_nl, fsm_output[5]);
  assign or_454_nl = (or_580_cse & (fsm_output[8])) | (fsm_output[6]);
  assign mux_394_nl = MUX_s_1_2_2((fsm_output[8]), or_tmp_3, or_580_cse);
  assign mux_395_nl = MUX_s_1_2_2(or_454_nl, mux_394_nl, fsm_output[0]);
  assign mux_393_nl = MUX_s_1_2_2(or_tmp_3, (fsm_output[8]), and_184_cse);
  assign mux_396_nl = MUX_s_1_2_2(mux_395_nl, mux_393_nl, fsm_output[1]);
  assign mux_397_nl = MUX_s_1_2_2(mux_396_nl, mux_77_cse, fsm_output[5]);
  assign mux_404_nl = MUX_s_1_2_2(mux_403_nl, mux_397_nl, fsm_output[3]);
  assign or_450_nl = and_187_cse | (fsm_output[4]);
  assign mux_389_nl = MUX_s_1_2_2(mux_388_cse, or_699_cse, or_450_nl);
  assign mux_390_nl = MUX_s_1_2_2(mux_389_nl, or_tmp_3, fsm_output[5]);
  assign or_449_nl = and_184_cse | (~ (fsm_output[8])) | (fsm_output[6]);
  assign or_448_nl = (fsm_output[4]) | (~ (fsm_output[8])) | (fsm_output[6]);
  assign mux_384_nl = MUX_s_1_2_2(or_699_cse, or_tmp_3, fsm_output[4]);
  assign mux_385_nl = MUX_s_1_2_2(or_448_nl, mux_384_nl, fsm_output[2]);
  assign mux_386_nl = MUX_s_1_2_2(or_449_nl, mux_385_nl, and_225_cse);
  assign mux_387_nl = MUX_s_1_2_2(mux_386_nl, or_tmp_3, fsm_output[5]);
  assign mux_391_nl = MUX_s_1_2_2(mux_390_nl, mux_387_nl, fsm_output[3]);
  assign mux_405_nl = MUX_s_1_2_2(mux_404_nl, (~ mux_391_nl), fsm_output[7]);
  assign operator_64_false_1_mux1h_nl = MUX1HOT_s_1_3_2((readslicef_9_1_8(acc_2_nl)),
      modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva, {operator_64_false_1_or_2_nl
      , and_dcpl_104 , mux_405_nl});
  assign nor_181_nl = ~((~ (fsm_output[8])) | (fsm_output[2]) | (~ (fsm_output[3]))
      | (fsm_output[4]));
  assign nor_182_nl = ~((fsm_output[8]) | (~ (fsm_output[2])) | (fsm_output[3]) |
      (~ (fsm_output[4])));
  assign mux_383_nl = MUX_s_1_2_2(nor_181_nl, nor_182_nl, fsm_output[5]);
  assign nor_178_nl = ~((fsm_output[5]) | (fsm_output[8]) | (~((fsm_output[7]) &
      (fsm_output[2]) & (fsm_output[3]))));
  assign nor_179_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[8])) | (fsm_output[7])
      | (fsm_output[2]) | (fsm_output[3]));
  assign mux_406_nl = MUX_s_1_2_2(nor_178_nl, nor_179_nl, fsm_output[6]);
  assign and_178_nl = (fsm_output[4]) & (fsm_output[3]) & (fsm_output[1]) & (fsm_output[7]);
  assign nor_175_nl = ~((~ (fsm_output[4])) | (fsm_output[3]) | (fsm_output[1]) |
      (fsm_output[7]));
  assign mux_416_nl = MUX_s_1_2_2(and_178_nl, nor_175_nl, fsm_output[5]);
  assign and_177_nl = nor_213_cse & mux_416_nl;
  assign or_469_nl = (fsm_output[3]) | nand_35_cse;
  assign or_468_nl = (~ (fsm_output[3])) | (fsm_output[1]) | (fsm_output[7]);
  assign mux_415_nl = MUX_s_1_2_2(or_469_nl, or_468_nl, fsm_output[4]);
  assign nor_176_nl = ~((~ (fsm_output[6])) | (fsm_output[8]) | (fsm_output[5]) |
      mux_415_nl);
  assign mux_417_nl = MUX_s_1_2_2(and_177_nl, nor_176_nl, fsm_output[2]);
  assign and_136_nl = mux_417_nl & (fsm_output[0]);
  assign COMP_LOOP_mux_22_nl = MUX_s_1_2_2(modExp_exp_1_0_1_sva_1, modExp_exp_1_1_1_sva,
      and_136_nl);
  assign and_182_nl = (fsm_output[7]) & (fsm_output[1]) & (fsm_output[3]);
  assign nor_177_nl = ~((fsm_output[7]) | (fsm_output[1]) | (fsm_output[3]));
  assign mux_407_nl = MUX_s_1_2_2(and_182_nl, nor_177_nl, fsm_output[5]);
  assign mux_423_nl = MUX_s_1_2_2((~ or_69_cse), and_dcpl_35, fsm_output[7]);
  assign mux_424_nl = MUX_s_1_2_2(nand_88_cse, mux_423_nl, fsm_output[8]);
  assign or_474_nl = (fsm_output[7]) | nor_tmp_25;
  assign mux_422_nl = MUX_s_1_2_2((~ or_tmp_58), or_474_nl, fsm_output[8]);
  assign mux_425_nl = MUX_s_1_2_2(mux_424_nl, mux_422_nl, fsm_output[5]);
  assign mux_418_nl = MUX_s_1_2_2((~ mux_tmp_279), or_63_cse, fsm_output[1]);
  assign mux_419_nl = MUX_s_1_2_2(or_tmp_325, mux_418_nl, fsm_output[0]);
  assign mux_420_nl = MUX_s_1_2_2(mux_419_nl, or_63_cse, fsm_output[7]);
  assign or_473_nl = (fsm_output[8]) | mux_420_nl;
  assign mux_421_nl = MUX_s_1_2_2(or_473_nl, or_tmp_414, fsm_output[5]);
  assign mux_426_nl = MUX_s_1_2_2(mux_425_nl, mux_421_nl, fsm_output[6]);
  assign COMP_LOOP_mux1h_15_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0[5]), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_2_sva_6_0[6]), {and_dcpl_123 , and_dcpl_107
      , (~ mux_431_itm) , and_dcpl_124});
  assign and_176_nl = (fsm_output[8]) & (fsm_output[7]) & (fsm_output[1]) & (~ (fsm_output[2]))
      & and_254_cse;
  assign nor_172_nl = ~((~ (fsm_output[8])) | (fsm_output[7]) | (fsm_output[1]) |
      (fsm_output[2]) | (fsm_output[3]) | (~ (fsm_output[4])));
  assign mux_432_nl = MUX_s_1_2_2(and_176_nl, nor_172_nl, fsm_output[5]);
  assign nor_173_nl = ~((fsm_output[5]) | (fsm_output[8]) | (~ (fsm_output[7])) |
      (~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_433_nl = MUX_s_1_2_2(mux_432_nl, nor_173_nl, fsm_output[6]);
  assign mux_437_nl = MUX_s_1_2_2(nor_tmp_85, or_tmp_32, fsm_output[7]);
  assign or_491_nl = (fsm_output[8]) | mux_437_nl;
  assign mux_438_nl = MUX_s_1_2_2(or_491_nl, or_tmp_414, fsm_output[5]);
  assign mux_439_nl = MUX_s_1_2_2(mux_tmp_430, mux_438_nl, fsm_output[6]);
  assign COMP_LOOP_mux1h_32_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0[6]), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_2_sva_6_0[0]), {and_dcpl_123 , and_dcpl_126
      , (~ mux_439_nl) , and_dcpl_124});
  assign nor_203_nl = ~((fsm_output[5]) | (fsm_output[8]) | (fsm_output[7]) | (fsm_output[1])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign or_672_nl = (~((fsm_output[1:0]!=2'b01))) | (fsm_output[7:6]!=2'b00);
  assign mux_517_nl = MUX_s_1_2_2(or_tmp_553, (fsm_output[6]), and_225_cse);
  assign mux_518_nl = MUX_s_1_2_2(or_672_nl, mux_517_nl, fsm_output[2]);
  assign mux_516_nl = MUX_s_1_2_2((fsm_output[6]), (~ (fsm_output[7])), or_279_cse);
  assign mux_519_nl = MUX_s_1_2_2(mux_518_nl, mux_516_nl, fsm_output[3]);
  assign nor_379_nl = ~(nor_216_cse | (fsm_output[7]));
  assign mux_514_nl = MUX_s_1_2_2(nor_379_nl, or_tmp_553, fsm_output[1]);
  assign mux_515_nl = MUX_s_1_2_2((~ (fsm_output[7])), mux_514_nl, and_223_cse);
  assign mux_520_nl = MUX_s_1_2_2(mux_519_nl, mux_515_nl, fsm_output[4]);
  assign mux_511_nl = MUX_s_1_2_2((~ (fsm_output[7])), or_tmp_556, fsm_output[2]);
  assign mux_512_nl = MUX_s_1_2_2(mux_511_nl, nor_tmp_154, fsm_output[3]);
  assign mux_508_nl = MUX_s_1_2_2(nor_tmp_154, (fsm_output[6]), and_225_cse);
  assign mux_507_nl = MUX_s_1_2_2((fsm_output[6]), or_tmp_553, fsm_output[1]);
  assign mux_509_nl = MUX_s_1_2_2(mux_508_nl, mux_507_nl, fsm_output[2]);
  assign mux_510_nl = MUX_s_1_2_2(nor_tmp_154, mux_509_nl, fsm_output[3]);
  assign mux_513_nl = MUX_s_1_2_2(mux_512_nl, mux_510_nl, fsm_output[4]);
  assign mux_521_nl = MUX_s_1_2_2((~ mux_520_nl), mux_513_nl, fsm_output[8]);
  assign mux_504_nl = MUX_s_1_2_2(or_tmp_556, nor_tmp_154, or_261_cse);
  assign mux_505_nl = MUX_s_1_2_2((~ (fsm_output[7])), mux_504_nl, fsm_output[4]);
  assign mux_501_nl = MUX_s_1_2_2(or_tmp_553, nor_tmp_154, fsm_output[1]);
  assign mux_500_nl = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[6]);
  assign mux_502_nl = MUX_s_1_2_2(mux_501_nl, mux_500_nl, or_261_cse);
  assign mux_503_nl = MUX_s_1_2_2(or_tmp_553, mux_502_nl, fsm_output[4]);
  assign mux_506_nl = MUX_s_1_2_2(mux_505_nl, mux_503_nl, fsm_output[8]);
  assign mux_522_nl = MUX_s_1_2_2(mux_521_nl, mux_506_nl, fsm_output[5]);
  assign nor_373_nl = ~((fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[0])) |
      (fsm_output[8]) | (fsm_output[6]) | (fsm_output[2]));
  assign nor_374_nl = ~((fsm_output[4]) | (~ (fsm_output[1])) | (~ (fsm_output[0]))
      | (~ modExp_exp_1_0_1_sva) | (fsm_output[8]) | (~((fsm_output[6]) & (fsm_output[2]))));
  assign mux_533_nl = MUX_s_1_2_2(nor_373_nl, nor_374_nl, fsm_output[7]);
  assign or_684_nl = (~ modExp_exp_1_0_1_sva) | (fsm_output[8]) | (~ (fsm_output[6]))
      | (fsm_output[2]);
  assign mux_530_nl = MUX_s_1_2_2(or_685_cse, or_684_nl, fsm_output[0]);
  assign or_683_nl = (fsm_output[0]) | (~(modExp_exp_1_0_1_sva | (~ (fsm_output[8]))))
      | (fsm_output[6]) | (fsm_output[2]);
  assign mux_531_nl = MUX_s_1_2_2(mux_530_nl, or_683_nl, fsm_output[1]);
  assign nor_375_nl = ~((fsm_output[4]) | mux_531_nl);
  assign or_681_nl = (~ modExp_exp_1_0_1_sva) | (~ (fsm_output[8])) | (fsm_output[6])
      | (fsm_output[2]);
  assign mux_529_nl = MUX_s_1_2_2(or_554_cse, or_681_nl, fsm_output[0]);
  assign and_nl = (fsm_output[4]) & (fsm_output[1]) & (~ mux_529_nl);
  assign mux_532_nl = MUX_s_1_2_2(nor_375_nl, and_nl, fsm_output[7]);
  assign mux_534_nl = MUX_s_1_2_2(mux_533_nl, mux_532_nl, fsm_output[3]);
  assign nand_108_nl = ~(or_699_cse & (fsm_output[2]));
  assign mux_525_nl = MUX_s_1_2_2(or_554_cse, nand_108_nl, modExp_exp_1_0_1_sva);
  assign nor_377_nl = ~((fsm_output[6]) | (~ (fsm_output[2])));
  assign nor_378_nl = ~((fsm_output[6]) | (fsm_output[2]));
  assign mux_524_nl = MUX_s_1_2_2(nor_377_nl, nor_378_nl, fsm_output[8]);
  assign nand_103_nl = ~(modExp_exp_1_0_1_sva & mux_524_nl);
  assign mux_526_nl = MUX_s_1_2_2(mux_525_nl, nand_103_nl, fsm_output[0]);
  assign or_675_nl = (fsm_output[0]) | (~ (fsm_output[8])) | (~ (fsm_output[6]))
      | (fsm_output[2]);
  assign mux_527_nl = MUX_s_1_2_2(mux_526_nl, or_675_nl, fsm_output[1]);
  assign nand_104_nl = ~((fsm_output[4]) & (~ mux_527_nl));
  assign or_674_nl = (fsm_output[1:0]!=2'b00) | (~ modExp_exp_1_0_1_sva) | (fsm_output[8])
      | (fsm_output[6]) | (fsm_output[2]);
  assign or_673_nl = (~ (fsm_output[1])) | (fsm_output[0]) | (~ (fsm_output[8]))
      | (fsm_output[6]) | (fsm_output[2]);
  assign mux_523_nl = MUX_s_1_2_2(or_674_nl, or_673_nl, fsm_output[4]);
  assign mux_528_nl = MUX_s_1_2_2(nand_104_nl, mux_523_nl, fsm_output[7]);
  assign nor_376_nl = ~((fsm_output[3]) | mux_528_nl);
  assign nand_44_nl = ~((fsm_output[4]) & (fsm_output[1]) & (~ (fsm_output[3])) &
      (fsm_output[5]));
  assign or_336_nl = (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign mux_304_nl = MUX_s_1_2_2(nand_44_nl, or_336_nl, fsm_output[0]);
  assign or_nl = (fsm_output[8:6]!=3'b000) | mux_304_nl;
  assign or_663_nl = (~ (fsm_output[6])) | (~ (fsm_output[7])) | (~ (fsm_output[8]))
      | (fsm_output[0]) | (~ (fsm_output[4])) | (fsm_output[1]) | (~ (fsm_output[3]))
      | (fsm_output[5]);
  assign mux_305_nl = MUX_s_1_2_2(or_nl, or_663_nl, fsm_output[2]);
  assign nor_370_nl = ~((fsm_output[8:7]!=2'b00) | mux_536_cse);
  assign nor_371_nl = ~((~ (fsm_output[7])) | (~ (fsm_output[8])) | (fsm_output[5])
      | (fsm_output[1]) | (fsm_output[0]) | not_tmp_395);
  assign mux_537_nl = MUX_s_1_2_2(nor_370_nl, nor_371_nl, fsm_output[2]);
  assign nor_372_nl = ~((~ (fsm_output[2])) | (~ (fsm_output[7])) | (~ (fsm_output[8]))
      | (fsm_output[5]) | (fsm_output[1]) | (fsm_output[0]) | not_tmp_395);
  assign nor_196_nl = ~((fsm_output[8:6]!=3'b000));
  assign nor_197_nl = ~((fsm_output[2]) | (fsm_output[1]) | (fsm_output[6]) | (fsm_output[7])
      | (fsm_output[8]));
  assign mux_315_nl = MUX_s_1_2_2(nor_196_nl, nor_197_nl, fsm_output[3]);
  assign mux_313_nl = MUX_s_1_2_2(and_dcpl_24, nor_tmp, fsm_output[6]);
  assign and_106_nl = (fsm_output[1]) & mux_313_nl;
  assign mux_314_nl = MUX_s_1_2_2(and_106_nl, nor_tmp_100, fsm_output[0]);
  assign and_107_nl = (fsm_output[3:2]==2'b11) & mux_314_nl;
  assign mux_316_nl = MUX_s_1_2_2(mux_315_nl, and_107_nl, fsm_output[4]);
  assign mux_317_nl = MUX_s_1_2_2(mux_316_nl, nor_tmp_100, fsm_output[5]);
  assign nl_COMP_LOOP_1_acc_nl = ({(z_out_2[7:0]) , 2'b00}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))})
      + 10'b0000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[9:0];
  assign nor_185_nl = ~((fsm_output[6]) | (fsm_output[7]) | (~ (fsm_output[2])) |
      (fsm_output[8]) | nand_29_cse);
  assign nor_186_nl = ~((~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[2]) |
      (~((fsm_output[8]) & (fsm_output[1]) & (fsm_output[4]))));
  assign mux_363_nl = MUX_s_1_2_2(nor_185_nl, nor_186_nl, fsm_output[0]);
  assign and_191_nl = (fsm_output[5]) & mux_363_nl;
  assign or_414_nl = (fsm_output[2]) | (~ (fsm_output[8])) | (fsm_output[1]) | (fsm_output[4]);
  assign or_413_nl = (~ (fsm_output[2])) | (fsm_output[8]) | nand_29_cse;
  assign mux_362_nl = MUX_s_1_2_2(or_414_nl, or_413_nl, fsm_output[7]);
  assign nor_187_nl = ~((fsm_output[5]) | (~ (fsm_output[0])) | (fsm_output[6]) |
      mux_362_nl);
  assign mux_364_nl = MUX_s_1_2_2(and_191_nl, nor_187_nl, fsm_output[3]);
  assign mux_87_nl = MUX_s_1_2_2((fsm_output[7]), or_tmp_58, fsm_output[5]);
  assign nand_75_nl = ~((fsm_output[5]) & (fsm_output[7]) & nor_tmp_25);
  assign mux_374_nl = MUX_s_1_2_2(mux_87_nl, nand_75_nl, fsm_output[6]);
  assign mux_377_nl = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[8]);
  assign mux_376_nl = MUX_s_1_2_2((~ or_tmp_58), (fsm_output[7]), fsm_output[8]);
  assign mux_378_nl = MUX_s_1_2_2(mux_377_nl, mux_376_nl, fsm_output[5]);
  assign and_124_nl = (fsm_output[8]) & ((fsm_output[7]) | and_dcpl_35);
  assign mux_375_nl = MUX_s_1_2_2(and_124_nl, (fsm_output[8]), fsm_output[5]);
  assign or_442_nl = (fsm_output[8:7]!=2'b00) | and_260_cse;
  assign mux_381_nl = MUX_s_1_2_2(or_tmp_75, or_442_nl, fsm_output[5]);
  assign and_125_nl = (fsm_output[8:7]==2'b11) & (and_224_cse | (fsm_output[4:3]!=2'b00));
  assign mux_380_nl = MUX_s_1_2_2(and_125_nl, nor_tmp, fsm_output[5]);
  assign COMP_LOOP_or_5_nl = tmp_2_lpi_4_dfm_mx0c0 | ((~((VEC_LOOP_j_sva_11_0[0])
      | (COMP_LOOP_acc_11_psp_sva[0]))) & tmp_2_lpi_4_dfm_mx0c4);
  assign COMP_LOOP_or_6_nl = tmp_2_lpi_4_dfm_mx0c1 | ((VEC_LOOP_j_sva_11_0[0]) &
      (~ (COMP_LOOP_acc_11_psp_sva[0])) & tmp_2_lpi_4_dfm_mx0c4);
  assign COMP_LOOP_or_7_nl = tmp_2_lpi_4_dfm_mx0c2 | ((COMP_LOOP_acc_11_psp_sva[0])
      & (~ (VEC_LOOP_j_sva_11_0[0])) & tmp_2_lpi_4_dfm_mx0c4);
  assign COMP_LOOP_or_8_nl = tmp_2_lpi_4_dfm_mx0c3 | ((VEC_LOOP_j_sva_11_0[0]) &
      (COMP_LOOP_acc_11_psp_sva[0]) & tmp_2_lpi_4_dfm_mx0c4);
  assign COMP_LOOP_or_11_nl = ((~ (modulo_result_rem_cmp_z[63])) & and_dcpl_127)
      | (not_tmp_294 & and_dcpl_146 & (~ (modulo_result_rem_cmp_z[63])));
  assign COMP_LOOP_or_12_nl = ((modulo_result_rem_cmp_z[63]) & and_dcpl_127) | (not_tmp_294
      & and_dcpl_146 & (modulo_result_rem_cmp_z[63]));
  assign and_152_nl = not_tmp_280 & and_dcpl_135 & (~ (COMP_LOOP_acc_10_cse_12_1_1_sva[1]));
  assign and_155_nl = not_tmp_280 & and_dcpl_138 & (~ (COMP_LOOP_acc_10_cse_12_1_1_sva[1]));
  assign and_157_nl = not_tmp_280 & and_dcpl_135 & (COMP_LOOP_acc_10_cse_12_1_1_sva[1]);
  assign and_159_nl = not_tmp_280 & and_dcpl_138 & (COMP_LOOP_acc_10_cse_12_1_1_sva[1]);
  assign or_632_nl = (fsm_output[4]) | (~ (fsm_output[6])) | (fsm_output[8]) | mux_tmp_31;
  assign or_633_nl = (~ (fsm_output[4])) | (fsm_output[6]) | (~ (fsm_output[8]))
      | mux_tmp_31;
  assign mux_32_nl = MUX_s_1_2_2(or_632_nl, or_633_nl, fsm_output[2]);
  assign nor_316_nl = ~(mux_32_nl | (fsm_output[0]));
  assign nor_154_nl = ~((~ (fsm_output[3])) | (fsm_output[1]) | (~ (fsm_output[0]))
      | (fsm_output[2]) | (~ (fsm_output[8])));
  assign and_167_nl = (fsm_output[3]) & (fsm_output[8]);
  assign mux_474_nl = MUX_s_1_2_2(nor_154_nl, and_167_nl, fsm_output[7]);
  assign mux_475_nl = MUX_s_1_2_2(mux_474_nl, (fsm_output[8]), fsm_output[5]);
  assign and_168_nl = (fsm_output[3]) & (fsm_output[1]) & (fsm_output[2]) & (fsm_output[8]);
  assign mux_470_nl = MUX_s_1_2_2((~ or_685_cse), or_tmp_493, and_225_cse);
  assign mux_471_nl = MUX_s_1_2_2((fsm_output[8]), mux_470_nl, fsm_output[3]);
  assign mux_472_nl = MUX_s_1_2_2(and_168_nl, mux_471_nl, fsm_output[7]);
  assign mux_466_nl = MUX_s_1_2_2((~ or_685_cse), or_tmp_493, fsm_output[0]);
  assign and_170_nl = (fsm_output[2]) & (fsm_output[8]);
  assign mux_467_nl = MUX_s_1_2_2(mux_466_nl, and_170_nl, fsm_output[1]);
  assign mux_468_nl = MUX_s_1_2_2(mux_467_nl, (fsm_output[8]), fsm_output[3]);
  assign mux_463_nl = MUX_s_1_2_2((~ (fsm_output[8])), (fsm_output[8]), fsm_output[2]);
  assign mux_464_nl = MUX_s_1_2_2(mux_463_nl, or_554_cse, or_303_cse);
  assign mux_465_nl = MUX_s_1_2_2(mux_464_nl, (fsm_output[8]), fsm_output[3]);
  assign mux_469_nl = MUX_s_1_2_2(mux_468_nl, (~ mux_465_nl), fsm_output[7]);
  assign mux_473_nl = MUX_s_1_2_2(mux_472_nl, mux_469_nl, fsm_output[5]);
  assign mux_476_nl = MUX_s_1_2_2(mux_475_nl, mux_473_nl, fsm_output[4]);
  assign or_552_nl = (fsm_output[3]) | and_187_cse | (~ (fsm_output[8]));
  assign or_550_nl = (~(and_225_cse | (fsm_output[2]))) | (fsm_output[8]);
  assign mux_459_nl = MUX_s_1_2_2((fsm_output[8]), or_550_nl, fsm_output[3]);
  assign mux_460_nl = MUX_s_1_2_2(or_552_nl, mux_459_nl, fsm_output[7]);
  assign or_548_nl = (fsm_output[7]) | (~((fsm_output[3:0]!=4'b0000))) | (fsm_output[8]);
  assign mux_461_nl = MUX_s_1_2_2(mux_460_nl, or_548_nl, fsm_output[5]);
  assign or_545_nl = and_173_cse | (fsm_output[8]);
  assign mux_457_nl = MUX_s_1_2_2((fsm_output[8]), or_545_nl, fsm_output[3]);
  assign nand_26_nl = ~((fsm_output[7]) & (~ mux_457_nl));
  assign mux_456_nl = MUX_s_1_2_2(or_tmp_493, or_685_cse, and_225_cse);
  assign or_543_nl = (fsm_output[7]) | (fsm_output[3]) | mux_456_nl;
  assign mux_458_nl = MUX_s_1_2_2(nand_26_nl, or_543_nl, fsm_output[5]);
  assign mux_462_nl = MUX_s_1_2_2(mux_461_nl, mux_458_nl, fsm_output[4]);
  assign mux_318_nl = MUX_s_1_2_2(or_tmp_325, (~ nor_tmp_25), fsm_output[5]);
  assign and_441_nl = and_dcpl_156 & and_dcpl_24 & (fsm_output[0]) & (~ (fsm_output[6]));
  assign and_442_nl = and_dcpl_156 & and_dcpl_24 & nor_350_cse;
  assign modExp_while_mux1h_3_nl = MUX1HOT_v_64_4_2(modExp_base_sva, modExp_result_sva,
      COMP_LOOP_1_mul_mut, operator_64_false_acc_mut_63_0, {and_441_nl , and_442_nl
      , not_tmp_307 , not_tmp_311});
  assign modExp_while_or_1_nl = not_tmp_307 | not_tmp_311;
  assign modExp_while_mux_1_nl = MUX_v_64_2_2(modExp_base_sva, COMP_LOOP_1_mul_mut,
      modExp_while_or_1_nl);
  assign nl_z_out = modExp_while_mux1h_3_nl * modExp_while_mux_1_nl;
  assign z_out = nl_z_out[63:0];
  assign COMP_LOOP_not_104_nl = ~ and_dcpl_175;
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_2_nl = ~(MUX_v_53_2_2((operator_66_true_div_cmp_z[63:11]),
      53'b11111111111111111111111111111111111111111111111111111, COMP_LOOP_not_104_nl));
  assign COMP_LOOP_mux_24_nl = MUX_v_11_2_2((VEC_LOOP_j_sva_11_0[11:1]), (~ (operator_66_true_div_cmp_z[10:0])),
      and_dcpl_175);
  assign not_1505_nl = ~ and_dcpl_175;
  assign COMP_LOOP_COMP_LOOP_and_4_nl = MUX_v_7_2_2(7'b0000000, COMP_LOOP_k_9_2_sva_6_0,
      not_1505_nl);
  assign nl_z_out_1 = ({and_dcpl_175 , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_2_nl , COMP_LOOP_mux_24_nl})
      + conv_u2u_8_65({COMP_LOOP_COMP_LOOP_and_4_nl , 1'b1});
  assign z_out_1 = nl_z_out_1[64:0];
  assign COMP_LOOP_not_105_nl = ~ and_323_ssc;
  assign COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_3_nl = ~(MUX_v_56_2_2((operator_64_false_slc_modExp_exp_63_1_itm[62:7]),
      56'b11111111111111111111111111111111111111111111111111111111, COMP_LOOP_not_105_nl));
  assign COMP_LOOP_mux_25_nl = MUX_v_7_2_2(COMP_LOOP_k_9_2_sva_6_0, (~ (operator_64_false_slc_modExp_exp_63_1_itm[6:0])),
      and_323_ssc);
  assign nl_z_out_2 = ({and_323_ssc , COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_3_nl , COMP_LOOP_mux_25_nl})
      + 64'b0000000000000000000000000000000000000000000000000000000000000001;
  assign z_out_2 = nl_z_out_2[63:0];
  assign and_449_nl = (fsm_output[4:2]==3'b100) & and_dcpl_206 & (fsm_output[8])
      & (fsm_output[5]) & nor_350_cse;
  assign COMP_LOOP_mux_26_nl = MUX_v_2_2_2(2'b10, 2'b01, and_449_nl);
  assign and_450_nl = and_dcpl_215 & and_dcpl_206 & and_dcpl_243;
  assign COMP_LOOP_COMP_LOOP_nor_1_nl = ~(MUX_v_2_2_2(COMP_LOOP_mux_26_nl, 2'b11,
      and_450_nl));
  assign and_451_nl = and_dcpl_215 & and_dcpl_218 & (fsm_output[8]) & (~ (fsm_output[5]))
      & nor_350_cse;
  assign COMP_LOOP_COMP_LOOP_or_5_nl = MUX_v_2_2_2(COMP_LOOP_COMP_LOOP_nor_1_nl,
      2'b11, and_451_nl);
  assign nl_COMP_LOOP_acc_35_nl = STAGE_LOOP_lshift_psp_sva + conv_u2u_9_10({COMP_LOOP_k_9_2_sva_6_0
      , COMP_LOOP_COMP_LOOP_or_5_nl});
  assign COMP_LOOP_acc_35_nl = nl_COMP_LOOP_acc_35_nl[9:0];
  assign and_443_nl = and_dcpl_209 & (~ (fsm_output[8])) & (fsm_output[5]) & (fsm_output[0])
      & (~ (fsm_output[6]));
  assign COMP_LOOP_or_27_nl = (and_dcpl_215 & and_dcpl_206 & and_dcpl_213) | ((fsm_output[4:2]==3'b010)
      & and_dcpl_218 & and_dcpl_213) | (and_dcpl_209 & (fsm_output[8]) & (fsm_output[5])
      & nor_350_cse) | (and_dcpl_229 & and_dcpl_227 & nor_350_cse);
  assign and_448_nl = and_dcpl_229 & and_dcpl_227 & and_dcpl_211;
  assign COMP_LOOP_mux1h_70_nl = MUX1HOT_v_10_3_2(({1'b0 , COMP_LOOP_k_9_2_sva_6_0
      , 2'b01}), COMP_LOOP_acc_35_nl, STAGE_LOOP_lshift_psp_sva, {and_443_nl , COMP_LOOP_or_27_nl
      , and_448_nl});
  assign nl_z_out_4 = conv_u2u_12_13(VEC_LOOP_j_sva_11_0) + conv_u2u_10_13(COMP_LOOP_mux1h_70_nl);
  assign z_out_4 = nl_z_out_4[12:0];
  assign COMP_LOOP_COMP_LOOP_mux_3_nl = MUX_v_3_2_2((VEC_LOOP_j_sva_11_0[11:9]),
      3'b001, COMP_LOOP_or_21_itm);
  assign COMP_LOOP_COMP_LOOP_mux_4_nl = MUX_v_9_2_2((VEC_LOOP_j_sva_11_0[8:0]), (~
      (STAGE_LOOP_lshift_psp_sva[9:1])), COMP_LOOP_or_21_itm);
  assign COMP_LOOP_or_28_nl = (~ and_dcpl_240) | and_dcpl_247 | and_dcpl_252;
  assign COMP_LOOP_COMP_LOOP_or_3_nl = (~ and_dcpl_247) | and_dcpl_240 | and_dcpl_252;
  assign COMP_LOOP_COMP_LOOP_or_4_nl = (~ and_dcpl_252) | and_dcpl_240 | and_dcpl_247;
  assign nl_acc_4_nl = ({COMP_LOOP_COMP_LOOP_mux_3_nl , COMP_LOOP_COMP_LOOP_mux_4_nl
      , COMP_LOOP_or_28_nl}) + conv_u2u_10_13({COMP_LOOP_k_9_2_sva_6_0 , COMP_LOOP_COMP_LOOP_or_3_nl
      , COMP_LOOP_COMP_LOOP_or_4_nl , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[12:0];
  assign z_out_5_11_0 = readslicef_13_12_1(acc_4_nl);
  assign operator_64_false_1_mux_15_nl = MUX_s_1_2_2((~ modExp_exp_1_7_1_sva), (~
      modExp_exp_1_1_1_sva), and_dcpl_285);
  assign operator_64_false_1_mux_16_nl = MUX_s_1_2_2((~ modExp_exp_1_6_1_sva), (~
      modExp_exp_1_7_1_sva), and_dcpl_285);
  assign operator_64_false_1_mux_17_nl = MUX_s_1_2_2((~ modExp_exp_1_5_1_sva), (~
      modExp_exp_1_6_1_sva), and_dcpl_285);
  assign operator_64_false_1_mux_18_nl = MUX_s_1_2_2((~ modExp_exp_1_4_1_sva), (~
      modExp_exp_1_5_1_sva), and_dcpl_285);
  assign operator_64_false_1_mux_19_nl = MUX_s_1_2_2((~ modExp_exp_1_3_1_sva), (~
      modExp_exp_1_4_1_sva), and_dcpl_285);
  assign operator_64_false_1_mux_20_nl = MUX_s_1_2_2((~ modExp_exp_1_2_1_sva), (~
      modExp_exp_1_3_1_sva), and_dcpl_285);
  assign operator_64_false_1_mux_21_nl = MUX_s_1_2_2((~ modExp_exp_1_1_1_sva), (~
      modExp_exp_1_2_1_sva), and_dcpl_285);
  assign nl_operator_64_false_1_acc_nl = ({1'b1 , operator_64_false_1_mux_15_nl ,
      operator_64_false_1_mux_16_nl , operator_64_false_1_mux_17_nl , operator_64_false_1_mux_18_nl
      , operator_64_false_1_mux_19_nl , operator_64_false_1_mux_20_nl , operator_64_false_1_mux_21_nl
      , (~ modExp_exp_1_0_1_sva_1)}) + 9'b000000001;
  assign operator_64_false_1_acc_nl = nl_operator_64_false_1_acc_nl[8:0];
  assign z_out_7_8 = readslicef_9_1_8(operator_64_false_1_acc_nl);
  assign COMP_LOOP_mux_27_nl = MUX_v_64_2_2(tmp_2_lpi_4_dfm, p_sva, and_dcpl_294);
  assign and_452_nl = (fsm_output[5]) & (fsm_output[4]) & (fsm_output[2]) & (~ (fsm_output[8]));
  assign nor_383_nl = ~((fsm_output[5]) | (fsm_output[4]) | (fsm_output[2]) | (~
      (fsm_output[8])));
  assign mux_541_nl = MUX_s_1_2_2(and_452_nl, nor_383_nl, fsm_output[3]);
  assign nand_113_nl = ~((~((fsm_output[7:6]!=2'b01))) & mux_541_nl);
  assign nor_384_nl = ~((fsm_output[3]) | (~ (fsm_output[5])) | (~ (fsm_output[4]))
      | (fsm_output[2]) | (~ (fsm_output[8])));
  assign nor_385_nl = ~((~ (fsm_output[3])) | (fsm_output[5]) | (~ (fsm_output[4]))
      | (~ (fsm_output[2])) | (fsm_output[8]));
  assign mux_542_nl = MUX_s_1_2_2(nor_384_nl, nor_385_nl, fsm_output[6]);
  assign nand_114_nl = ~((fsm_output[7]) & mux_542_nl);
  assign mux_540_nl = MUX_s_1_2_2(nand_113_nl, nand_114_nl, fsm_output[1]);
  assign COMP_LOOP_COMP_LOOP_nand_2_nl = ~(and_dcpl_294 & (mux_540_nl | (fsm_output[0])));
  assign COMP_LOOP_not_106_nl = ~ and_dcpl_294;
  assign COMP_LOOP_COMP_LOOP_nand_3_nl = ~(MUX_v_64_2_2(64'b0000000000000000000000000000000000000000000000000000000000000000,
      modulo_result_mux_1_cse, COMP_LOOP_not_106_nl));
  assign nl_acc_7_nl = conv_u2u_65_66({COMP_LOOP_mux_27_nl , COMP_LOOP_COMP_LOOP_nand_2_nl})
      + conv_s2u_65_66({COMP_LOOP_COMP_LOOP_nand_3_nl , 1'b1});
  assign acc_7_nl = nl_acc_7_nl[65:0];
  assign z_out_8 = readslicef_66_65_1(acc_7_nl);

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


  function automatic [52:0] MUX_v_53_2_2;
    input [52:0] input_0;
    input [52:0] input_1;
    input [0:0] sel;
    reg [52:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_53_2_2 = result;
  end
  endfunction


  function automatic [55:0] MUX_v_56_2_2;
    input [55:0] input_0;
    input [55:0] input_1;
    input [0:0] sel;
    reg [55:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_56_2_2 = result;
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


  function automatic [0:0] readslicef_9_1_8;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 8;
    readslicef_9_1_8 = tmp[0:0];
  end
  endfunction


  function automatic [65:0] conv_s2u_65_66 ;
    input [64:0]  vector ;
  begin
    conv_s2u_65_66 = {vector[64], vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_7_10 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_10 = {{3{1'b0}}, vector};
  end
  endfunction


  function automatic [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction


  function automatic [64:0] conv_u2u_8_65 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_65 = {{57{1'b0}}, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
  end
  endfunction


  function automatic [12:0] conv_u2u_10_13 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_13 = {{3{1'b0}}, vector};
  end
  endfunction


  function automatic [12:0] conv_u2u_12_13 ;
    input [11:0]  vector ;
  begin
    conv_u2u_12_13 = {1'b0, vector};
  end
  endfunction


  function automatic [65:0] conv_u2u_65_66 ;
    input [64:0]  vector ;
  begin
    conv_u2u_65_66 = {1'b0, vector};
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



