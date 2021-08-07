
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
//  Generated date: Wed Jun 30 21:01:23 2021
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
  clk, rst, fsm_output, STAGE_LOOP_C_8_tr0, modExp_while_C_38_tr0, COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_38_tr0, COMP_LOOP_C_61_tr0, COMP_LOOP_2_modExp_1_while_C_38_tr0,
      COMP_LOOP_C_122_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_9_tr0
);
  input clk;
  input rst;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input STAGE_LOOP_C_8_tr0;
  input modExp_while_C_38_tr0;
  input COMP_LOOP_C_1_tr0;
  input COMP_LOOP_1_modExp_1_while_C_38_tr0;
  input COMP_LOOP_C_61_tr0;
  input COMP_LOOP_2_modExp_1_while_C_38_tr0;
  input COMP_LOOP_C_122_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_9_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  parameter
    main_C_0 = 8'd0,
    STAGE_LOOP_C_0 = 8'd1,
    STAGE_LOOP_C_1 = 8'd2,
    STAGE_LOOP_C_2 = 8'd3,
    STAGE_LOOP_C_3 = 8'd4,
    STAGE_LOOP_C_4 = 8'd5,
    STAGE_LOOP_C_5 = 8'd6,
    STAGE_LOOP_C_6 = 8'd7,
    STAGE_LOOP_C_7 = 8'd8,
    STAGE_LOOP_C_8 = 8'd9,
    modExp_while_C_0 = 8'd10,
    modExp_while_C_1 = 8'd11,
    modExp_while_C_2 = 8'd12,
    modExp_while_C_3 = 8'd13,
    modExp_while_C_4 = 8'd14,
    modExp_while_C_5 = 8'd15,
    modExp_while_C_6 = 8'd16,
    modExp_while_C_7 = 8'd17,
    modExp_while_C_8 = 8'd18,
    modExp_while_C_9 = 8'd19,
    modExp_while_C_10 = 8'd20,
    modExp_while_C_11 = 8'd21,
    modExp_while_C_12 = 8'd22,
    modExp_while_C_13 = 8'd23,
    modExp_while_C_14 = 8'd24,
    modExp_while_C_15 = 8'd25,
    modExp_while_C_16 = 8'd26,
    modExp_while_C_17 = 8'd27,
    modExp_while_C_18 = 8'd28,
    modExp_while_C_19 = 8'd29,
    modExp_while_C_20 = 8'd30,
    modExp_while_C_21 = 8'd31,
    modExp_while_C_22 = 8'd32,
    modExp_while_C_23 = 8'd33,
    modExp_while_C_24 = 8'd34,
    modExp_while_C_25 = 8'd35,
    modExp_while_C_26 = 8'd36,
    modExp_while_C_27 = 8'd37,
    modExp_while_C_28 = 8'd38,
    modExp_while_C_29 = 8'd39,
    modExp_while_C_30 = 8'd40,
    modExp_while_C_31 = 8'd41,
    modExp_while_C_32 = 8'd42,
    modExp_while_C_33 = 8'd43,
    modExp_while_C_34 = 8'd44,
    modExp_while_C_35 = 8'd45,
    modExp_while_C_36 = 8'd46,
    modExp_while_C_37 = 8'd47,
    modExp_while_C_38 = 8'd48,
    COMP_LOOP_C_0 = 8'd49,
    COMP_LOOP_C_1 = 8'd50,
    COMP_LOOP_1_modExp_1_while_C_0 = 8'd51,
    COMP_LOOP_1_modExp_1_while_C_1 = 8'd52,
    COMP_LOOP_1_modExp_1_while_C_2 = 8'd53,
    COMP_LOOP_1_modExp_1_while_C_3 = 8'd54,
    COMP_LOOP_1_modExp_1_while_C_4 = 8'd55,
    COMP_LOOP_1_modExp_1_while_C_5 = 8'd56,
    COMP_LOOP_1_modExp_1_while_C_6 = 8'd57,
    COMP_LOOP_1_modExp_1_while_C_7 = 8'd58,
    COMP_LOOP_1_modExp_1_while_C_8 = 8'd59,
    COMP_LOOP_1_modExp_1_while_C_9 = 8'd60,
    COMP_LOOP_1_modExp_1_while_C_10 = 8'd61,
    COMP_LOOP_1_modExp_1_while_C_11 = 8'd62,
    COMP_LOOP_1_modExp_1_while_C_12 = 8'd63,
    COMP_LOOP_1_modExp_1_while_C_13 = 8'd64,
    COMP_LOOP_1_modExp_1_while_C_14 = 8'd65,
    COMP_LOOP_1_modExp_1_while_C_15 = 8'd66,
    COMP_LOOP_1_modExp_1_while_C_16 = 8'd67,
    COMP_LOOP_1_modExp_1_while_C_17 = 8'd68,
    COMP_LOOP_1_modExp_1_while_C_18 = 8'd69,
    COMP_LOOP_1_modExp_1_while_C_19 = 8'd70,
    COMP_LOOP_1_modExp_1_while_C_20 = 8'd71,
    COMP_LOOP_1_modExp_1_while_C_21 = 8'd72,
    COMP_LOOP_1_modExp_1_while_C_22 = 8'd73,
    COMP_LOOP_1_modExp_1_while_C_23 = 8'd74,
    COMP_LOOP_1_modExp_1_while_C_24 = 8'd75,
    COMP_LOOP_1_modExp_1_while_C_25 = 8'd76,
    COMP_LOOP_1_modExp_1_while_C_26 = 8'd77,
    COMP_LOOP_1_modExp_1_while_C_27 = 8'd78,
    COMP_LOOP_1_modExp_1_while_C_28 = 8'd79,
    COMP_LOOP_1_modExp_1_while_C_29 = 8'd80,
    COMP_LOOP_1_modExp_1_while_C_30 = 8'd81,
    COMP_LOOP_1_modExp_1_while_C_31 = 8'd82,
    COMP_LOOP_1_modExp_1_while_C_32 = 8'd83,
    COMP_LOOP_1_modExp_1_while_C_33 = 8'd84,
    COMP_LOOP_1_modExp_1_while_C_34 = 8'd85,
    COMP_LOOP_1_modExp_1_while_C_35 = 8'd86,
    COMP_LOOP_1_modExp_1_while_C_36 = 8'd87,
    COMP_LOOP_1_modExp_1_while_C_37 = 8'd88,
    COMP_LOOP_1_modExp_1_while_C_38 = 8'd89,
    COMP_LOOP_C_2 = 8'd90,
    COMP_LOOP_C_3 = 8'd91,
    COMP_LOOP_C_4 = 8'd92,
    COMP_LOOP_C_5 = 8'd93,
    COMP_LOOP_C_6 = 8'd94,
    COMP_LOOP_C_7 = 8'd95,
    COMP_LOOP_C_8 = 8'd96,
    COMP_LOOP_C_9 = 8'd97,
    COMP_LOOP_C_10 = 8'd98,
    COMP_LOOP_C_11 = 8'd99,
    COMP_LOOP_C_12 = 8'd100,
    COMP_LOOP_C_13 = 8'd101,
    COMP_LOOP_C_14 = 8'd102,
    COMP_LOOP_C_15 = 8'd103,
    COMP_LOOP_C_16 = 8'd104,
    COMP_LOOP_C_17 = 8'd105,
    COMP_LOOP_C_18 = 8'd106,
    COMP_LOOP_C_19 = 8'd107,
    COMP_LOOP_C_20 = 8'd108,
    COMP_LOOP_C_21 = 8'd109,
    COMP_LOOP_C_22 = 8'd110,
    COMP_LOOP_C_23 = 8'd111,
    COMP_LOOP_C_24 = 8'd112,
    COMP_LOOP_C_25 = 8'd113,
    COMP_LOOP_C_26 = 8'd114,
    COMP_LOOP_C_27 = 8'd115,
    COMP_LOOP_C_28 = 8'd116,
    COMP_LOOP_C_29 = 8'd117,
    COMP_LOOP_C_30 = 8'd118,
    COMP_LOOP_C_31 = 8'd119,
    COMP_LOOP_C_32 = 8'd120,
    COMP_LOOP_C_33 = 8'd121,
    COMP_LOOP_C_34 = 8'd122,
    COMP_LOOP_C_35 = 8'd123,
    COMP_LOOP_C_36 = 8'd124,
    COMP_LOOP_C_37 = 8'd125,
    COMP_LOOP_C_38 = 8'd126,
    COMP_LOOP_C_39 = 8'd127,
    COMP_LOOP_C_40 = 8'd128,
    COMP_LOOP_C_41 = 8'd129,
    COMP_LOOP_C_42 = 8'd130,
    COMP_LOOP_C_43 = 8'd131,
    COMP_LOOP_C_44 = 8'd132,
    COMP_LOOP_C_45 = 8'd133,
    COMP_LOOP_C_46 = 8'd134,
    COMP_LOOP_C_47 = 8'd135,
    COMP_LOOP_C_48 = 8'd136,
    COMP_LOOP_C_49 = 8'd137,
    COMP_LOOP_C_50 = 8'd138,
    COMP_LOOP_C_51 = 8'd139,
    COMP_LOOP_C_52 = 8'd140,
    COMP_LOOP_C_53 = 8'd141,
    COMP_LOOP_C_54 = 8'd142,
    COMP_LOOP_C_55 = 8'd143,
    COMP_LOOP_C_56 = 8'd144,
    COMP_LOOP_C_57 = 8'd145,
    COMP_LOOP_C_58 = 8'd146,
    COMP_LOOP_C_59 = 8'd147,
    COMP_LOOP_C_60 = 8'd148,
    COMP_LOOP_C_61 = 8'd149,
    COMP_LOOP_C_62 = 8'd150,
    COMP_LOOP_2_modExp_1_while_C_0 = 8'd151,
    COMP_LOOP_2_modExp_1_while_C_1 = 8'd152,
    COMP_LOOP_2_modExp_1_while_C_2 = 8'd153,
    COMP_LOOP_2_modExp_1_while_C_3 = 8'd154,
    COMP_LOOP_2_modExp_1_while_C_4 = 8'd155,
    COMP_LOOP_2_modExp_1_while_C_5 = 8'd156,
    COMP_LOOP_2_modExp_1_while_C_6 = 8'd157,
    COMP_LOOP_2_modExp_1_while_C_7 = 8'd158,
    COMP_LOOP_2_modExp_1_while_C_8 = 8'd159,
    COMP_LOOP_2_modExp_1_while_C_9 = 8'd160,
    COMP_LOOP_2_modExp_1_while_C_10 = 8'd161,
    COMP_LOOP_2_modExp_1_while_C_11 = 8'd162,
    COMP_LOOP_2_modExp_1_while_C_12 = 8'd163,
    COMP_LOOP_2_modExp_1_while_C_13 = 8'd164,
    COMP_LOOP_2_modExp_1_while_C_14 = 8'd165,
    COMP_LOOP_2_modExp_1_while_C_15 = 8'd166,
    COMP_LOOP_2_modExp_1_while_C_16 = 8'd167,
    COMP_LOOP_2_modExp_1_while_C_17 = 8'd168,
    COMP_LOOP_2_modExp_1_while_C_18 = 8'd169,
    COMP_LOOP_2_modExp_1_while_C_19 = 8'd170,
    COMP_LOOP_2_modExp_1_while_C_20 = 8'd171,
    COMP_LOOP_2_modExp_1_while_C_21 = 8'd172,
    COMP_LOOP_2_modExp_1_while_C_22 = 8'd173,
    COMP_LOOP_2_modExp_1_while_C_23 = 8'd174,
    COMP_LOOP_2_modExp_1_while_C_24 = 8'd175,
    COMP_LOOP_2_modExp_1_while_C_25 = 8'd176,
    COMP_LOOP_2_modExp_1_while_C_26 = 8'd177,
    COMP_LOOP_2_modExp_1_while_C_27 = 8'd178,
    COMP_LOOP_2_modExp_1_while_C_28 = 8'd179,
    COMP_LOOP_2_modExp_1_while_C_29 = 8'd180,
    COMP_LOOP_2_modExp_1_while_C_30 = 8'd181,
    COMP_LOOP_2_modExp_1_while_C_31 = 8'd182,
    COMP_LOOP_2_modExp_1_while_C_32 = 8'd183,
    COMP_LOOP_2_modExp_1_while_C_33 = 8'd184,
    COMP_LOOP_2_modExp_1_while_C_34 = 8'd185,
    COMP_LOOP_2_modExp_1_while_C_35 = 8'd186,
    COMP_LOOP_2_modExp_1_while_C_36 = 8'd187,
    COMP_LOOP_2_modExp_1_while_C_37 = 8'd188,
    COMP_LOOP_2_modExp_1_while_C_38 = 8'd189,
    COMP_LOOP_C_63 = 8'd190,
    COMP_LOOP_C_64 = 8'd191,
    COMP_LOOP_C_65 = 8'd192,
    COMP_LOOP_C_66 = 8'd193,
    COMP_LOOP_C_67 = 8'd194,
    COMP_LOOP_C_68 = 8'd195,
    COMP_LOOP_C_69 = 8'd196,
    COMP_LOOP_C_70 = 8'd197,
    COMP_LOOP_C_71 = 8'd198,
    COMP_LOOP_C_72 = 8'd199,
    COMP_LOOP_C_73 = 8'd200,
    COMP_LOOP_C_74 = 8'd201,
    COMP_LOOP_C_75 = 8'd202,
    COMP_LOOP_C_76 = 8'd203,
    COMP_LOOP_C_77 = 8'd204,
    COMP_LOOP_C_78 = 8'd205,
    COMP_LOOP_C_79 = 8'd206,
    COMP_LOOP_C_80 = 8'd207,
    COMP_LOOP_C_81 = 8'd208,
    COMP_LOOP_C_82 = 8'd209,
    COMP_LOOP_C_83 = 8'd210,
    COMP_LOOP_C_84 = 8'd211,
    COMP_LOOP_C_85 = 8'd212,
    COMP_LOOP_C_86 = 8'd213,
    COMP_LOOP_C_87 = 8'd214,
    COMP_LOOP_C_88 = 8'd215,
    COMP_LOOP_C_89 = 8'd216,
    COMP_LOOP_C_90 = 8'd217,
    COMP_LOOP_C_91 = 8'd218,
    COMP_LOOP_C_92 = 8'd219,
    COMP_LOOP_C_93 = 8'd220,
    COMP_LOOP_C_94 = 8'd221,
    COMP_LOOP_C_95 = 8'd222,
    COMP_LOOP_C_96 = 8'd223,
    COMP_LOOP_C_97 = 8'd224,
    COMP_LOOP_C_98 = 8'd225,
    COMP_LOOP_C_99 = 8'd226,
    COMP_LOOP_C_100 = 8'd227,
    COMP_LOOP_C_101 = 8'd228,
    COMP_LOOP_C_102 = 8'd229,
    COMP_LOOP_C_103 = 8'd230,
    COMP_LOOP_C_104 = 8'd231,
    COMP_LOOP_C_105 = 8'd232,
    COMP_LOOP_C_106 = 8'd233,
    COMP_LOOP_C_107 = 8'd234,
    COMP_LOOP_C_108 = 8'd235,
    COMP_LOOP_C_109 = 8'd236,
    COMP_LOOP_C_110 = 8'd237,
    COMP_LOOP_C_111 = 8'd238,
    COMP_LOOP_C_112 = 8'd239,
    COMP_LOOP_C_113 = 8'd240,
    COMP_LOOP_C_114 = 8'd241,
    COMP_LOOP_C_115 = 8'd242,
    COMP_LOOP_C_116 = 8'd243,
    COMP_LOOP_C_117 = 8'd244,
    COMP_LOOP_C_118 = 8'd245,
    COMP_LOOP_C_119 = 8'd246,
    COMP_LOOP_C_120 = 8'd247,
    COMP_LOOP_C_121 = 8'd248,
    COMP_LOOP_C_122 = 8'd249,
    VEC_LOOP_C_0 = 8'd250,
    STAGE_LOOP_C_9 = 8'd251,
    main_C_1 = 8'd252;

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
        state_var_NS = STAGE_LOOP_C_6;
      end
      STAGE_LOOP_C_6 : begin
        fsm_output = 8'b00000111;
        state_var_NS = STAGE_LOOP_C_7;
      end
      STAGE_LOOP_C_7 : begin
        fsm_output = 8'b00001000;
        state_var_NS = STAGE_LOOP_C_8;
      end
      STAGE_LOOP_C_8 : begin
        fsm_output = 8'b00001001;
        if ( STAGE_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      modExp_while_C_0 : begin
        fsm_output = 8'b00001010;
        state_var_NS = modExp_while_C_1;
      end
      modExp_while_C_1 : begin
        fsm_output = 8'b00001011;
        state_var_NS = modExp_while_C_2;
      end
      modExp_while_C_2 : begin
        fsm_output = 8'b00001100;
        state_var_NS = modExp_while_C_3;
      end
      modExp_while_C_3 : begin
        fsm_output = 8'b00001101;
        state_var_NS = modExp_while_C_4;
      end
      modExp_while_C_4 : begin
        fsm_output = 8'b00001110;
        state_var_NS = modExp_while_C_5;
      end
      modExp_while_C_5 : begin
        fsm_output = 8'b00001111;
        state_var_NS = modExp_while_C_6;
      end
      modExp_while_C_6 : begin
        fsm_output = 8'b00010000;
        state_var_NS = modExp_while_C_7;
      end
      modExp_while_C_7 : begin
        fsm_output = 8'b00010001;
        state_var_NS = modExp_while_C_8;
      end
      modExp_while_C_8 : begin
        fsm_output = 8'b00010010;
        state_var_NS = modExp_while_C_9;
      end
      modExp_while_C_9 : begin
        fsm_output = 8'b00010011;
        state_var_NS = modExp_while_C_10;
      end
      modExp_while_C_10 : begin
        fsm_output = 8'b00010100;
        state_var_NS = modExp_while_C_11;
      end
      modExp_while_C_11 : begin
        fsm_output = 8'b00010101;
        state_var_NS = modExp_while_C_12;
      end
      modExp_while_C_12 : begin
        fsm_output = 8'b00010110;
        state_var_NS = modExp_while_C_13;
      end
      modExp_while_C_13 : begin
        fsm_output = 8'b00010111;
        state_var_NS = modExp_while_C_14;
      end
      modExp_while_C_14 : begin
        fsm_output = 8'b00011000;
        state_var_NS = modExp_while_C_15;
      end
      modExp_while_C_15 : begin
        fsm_output = 8'b00011001;
        state_var_NS = modExp_while_C_16;
      end
      modExp_while_C_16 : begin
        fsm_output = 8'b00011010;
        state_var_NS = modExp_while_C_17;
      end
      modExp_while_C_17 : begin
        fsm_output = 8'b00011011;
        state_var_NS = modExp_while_C_18;
      end
      modExp_while_C_18 : begin
        fsm_output = 8'b00011100;
        state_var_NS = modExp_while_C_19;
      end
      modExp_while_C_19 : begin
        fsm_output = 8'b00011101;
        state_var_NS = modExp_while_C_20;
      end
      modExp_while_C_20 : begin
        fsm_output = 8'b00011110;
        state_var_NS = modExp_while_C_21;
      end
      modExp_while_C_21 : begin
        fsm_output = 8'b00011111;
        state_var_NS = modExp_while_C_22;
      end
      modExp_while_C_22 : begin
        fsm_output = 8'b00100000;
        state_var_NS = modExp_while_C_23;
      end
      modExp_while_C_23 : begin
        fsm_output = 8'b00100001;
        state_var_NS = modExp_while_C_24;
      end
      modExp_while_C_24 : begin
        fsm_output = 8'b00100010;
        state_var_NS = modExp_while_C_25;
      end
      modExp_while_C_25 : begin
        fsm_output = 8'b00100011;
        state_var_NS = modExp_while_C_26;
      end
      modExp_while_C_26 : begin
        fsm_output = 8'b00100100;
        state_var_NS = modExp_while_C_27;
      end
      modExp_while_C_27 : begin
        fsm_output = 8'b00100101;
        state_var_NS = modExp_while_C_28;
      end
      modExp_while_C_28 : begin
        fsm_output = 8'b00100110;
        state_var_NS = modExp_while_C_29;
      end
      modExp_while_C_29 : begin
        fsm_output = 8'b00100111;
        state_var_NS = modExp_while_C_30;
      end
      modExp_while_C_30 : begin
        fsm_output = 8'b00101000;
        state_var_NS = modExp_while_C_31;
      end
      modExp_while_C_31 : begin
        fsm_output = 8'b00101001;
        state_var_NS = modExp_while_C_32;
      end
      modExp_while_C_32 : begin
        fsm_output = 8'b00101010;
        state_var_NS = modExp_while_C_33;
      end
      modExp_while_C_33 : begin
        fsm_output = 8'b00101011;
        state_var_NS = modExp_while_C_34;
      end
      modExp_while_C_34 : begin
        fsm_output = 8'b00101100;
        state_var_NS = modExp_while_C_35;
      end
      modExp_while_C_35 : begin
        fsm_output = 8'b00101101;
        state_var_NS = modExp_while_C_36;
      end
      modExp_while_C_36 : begin
        fsm_output = 8'b00101110;
        state_var_NS = modExp_while_C_37;
      end
      modExp_while_C_37 : begin
        fsm_output = 8'b00101111;
        state_var_NS = modExp_while_C_38;
      end
      modExp_while_C_38 : begin
        fsm_output = 8'b00110000;
        if ( modExp_while_C_38_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_while_C_0;
        end
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 8'b00110001;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 8'b00110010;
        if ( COMP_LOOP_C_1_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_1_modExp_1_while_C_0 : begin
        fsm_output = 8'b00110011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_1;
      end
      COMP_LOOP_1_modExp_1_while_C_1 : begin
        fsm_output = 8'b00110100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_2;
      end
      COMP_LOOP_1_modExp_1_while_C_2 : begin
        fsm_output = 8'b00110101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_3;
      end
      COMP_LOOP_1_modExp_1_while_C_3 : begin
        fsm_output = 8'b00110110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_4;
      end
      COMP_LOOP_1_modExp_1_while_C_4 : begin
        fsm_output = 8'b00110111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_5;
      end
      COMP_LOOP_1_modExp_1_while_C_5 : begin
        fsm_output = 8'b00111000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_6;
      end
      COMP_LOOP_1_modExp_1_while_C_6 : begin
        fsm_output = 8'b00111001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_7;
      end
      COMP_LOOP_1_modExp_1_while_C_7 : begin
        fsm_output = 8'b00111010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_8;
      end
      COMP_LOOP_1_modExp_1_while_C_8 : begin
        fsm_output = 8'b00111011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_9;
      end
      COMP_LOOP_1_modExp_1_while_C_9 : begin
        fsm_output = 8'b00111100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_10;
      end
      COMP_LOOP_1_modExp_1_while_C_10 : begin
        fsm_output = 8'b00111101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_11;
      end
      COMP_LOOP_1_modExp_1_while_C_11 : begin
        fsm_output = 8'b00111110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_12;
      end
      COMP_LOOP_1_modExp_1_while_C_12 : begin
        fsm_output = 8'b00111111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_13;
      end
      COMP_LOOP_1_modExp_1_while_C_13 : begin
        fsm_output = 8'b01000000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_14;
      end
      COMP_LOOP_1_modExp_1_while_C_14 : begin
        fsm_output = 8'b01000001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_15;
      end
      COMP_LOOP_1_modExp_1_while_C_15 : begin
        fsm_output = 8'b01000010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_16;
      end
      COMP_LOOP_1_modExp_1_while_C_16 : begin
        fsm_output = 8'b01000011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_17;
      end
      COMP_LOOP_1_modExp_1_while_C_17 : begin
        fsm_output = 8'b01000100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_18;
      end
      COMP_LOOP_1_modExp_1_while_C_18 : begin
        fsm_output = 8'b01000101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_19;
      end
      COMP_LOOP_1_modExp_1_while_C_19 : begin
        fsm_output = 8'b01000110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_20;
      end
      COMP_LOOP_1_modExp_1_while_C_20 : begin
        fsm_output = 8'b01000111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_21;
      end
      COMP_LOOP_1_modExp_1_while_C_21 : begin
        fsm_output = 8'b01001000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_22;
      end
      COMP_LOOP_1_modExp_1_while_C_22 : begin
        fsm_output = 8'b01001001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_23;
      end
      COMP_LOOP_1_modExp_1_while_C_23 : begin
        fsm_output = 8'b01001010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_24;
      end
      COMP_LOOP_1_modExp_1_while_C_24 : begin
        fsm_output = 8'b01001011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_25;
      end
      COMP_LOOP_1_modExp_1_while_C_25 : begin
        fsm_output = 8'b01001100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_26;
      end
      COMP_LOOP_1_modExp_1_while_C_26 : begin
        fsm_output = 8'b01001101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_27;
      end
      COMP_LOOP_1_modExp_1_while_C_27 : begin
        fsm_output = 8'b01001110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_28;
      end
      COMP_LOOP_1_modExp_1_while_C_28 : begin
        fsm_output = 8'b01001111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_29;
      end
      COMP_LOOP_1_modExp_1_while_C_29 : begin
        fsm_output = 8'b01010000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_30;
      end
      COMP_LOOP_1_modExp_1_while_C_30 : begin
        fsm_output = 8'b01010001;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_31;
      end
      COMP_LOOP_1_modExp_1_while_C_31 : begin
        fsm_output = 8'b01010010;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_32;
      end
      COMP_LOOP_1_modExp_1_while_C_32 : begin
        fsm_output = 8'b01010011;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_33;
      end
      COMP_LOOP_1_modExp_1_while_C_33 : begin
        fsm_output = 8'b01010100;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_34;
      end
      COMP_LOOP_1_modExp_1_while_C_34 : begin
        fsm_output = 8'b01010101;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_35;
      end
      COMP_LOOP_1_modExp_1_while_C_35 : begin
        fsm_output = 8'b01010110;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_36;
      end
      COMP_LOOP_1_modExp_1_while_C_36 : begin
        fsm_output = 8'b01010111;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_37;
      end
      COMP_LOOP_1_modExp_1_while_C_37 : begin
        fsm_output = 8'b01011000;
        state_var_NS = COMP_LOOP_1_modExp_1_while_C_38;
      end
      COMP_LOOP_1_modExp_1_while_C_38 : begin
        fsm_output = 8'b01011001;
        if ( COMP_LOOP_1_modExp_1_while_C_38_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 8'b01011010;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 8'b01011011;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 8'b01011100;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 8'b01011101;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 8'b01011110;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 8'b01011111;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 8'b01100000;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 8'b01100001;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 8'b01100010;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 8'b01100011;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 8'b01100100;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 8'b01100101;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 8'b01100110;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 8'b01100111;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 8'b01101000;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 8'b01101001;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 8'b01101010;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 8'b01101011;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 8'b01101100;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 8'b01101101;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 8'b01101110;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 8'b01101111;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 8'b01110000;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 8'b01110001;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 8'b01110010;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 8'b01110011;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 8'b01110100;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 8'b01110101;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 8'b01110110;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 8'b01110111;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 8'b01111000;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 8'b01111001;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 8'b01111010;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 8'b01111011;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 8'b01111100;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 8'b01111101;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 8'b01111110;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 8'b01111111;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 8'b10000000;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 8'b10000001;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 8'b10000010;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 8'b10000011;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 8'b10000100;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 8'b10000101;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 8'b10000110;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 8'b10000111;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 8'b10001000;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 8'b10001001;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 8'b10001010;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 8'b10001011;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 8'b10001100;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 8'b10001101;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 8'b10001110;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 8'b10001111;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 8'b10010000;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 8'b10010001;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 8'b10010010;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 8'b10010011;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 8'b10010100;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 8'b10010101;
        if ( COMP_LOOP_C_61_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_62;
        end
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 8'b10010110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
      end
      COMP_LOOP_2_modExp_1_while_C_0 : begin
        fsm_output = 8'b10010111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_1;
      end
      COMP_LOOP_2_modExp_1_while_C_1 : begin
        fsm_output = 8'b10011000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_2;
      end
      COMP_LOOP_2_modExp_1_while_C_2 : begin
        fsm_output = 8'b10011001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_3;
      end
      COMP_LOOP_2_modExp_1_while_C_3 : begin
        fsm_output = 8'b10011010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_4;
      end
      COMP_LOOP_2_modExp_1_while_C_4 : begin
        fsm_output = 8'b10011011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_5;
      end
      COMP_LOOP_2_modExp_1_while_C_5 : begin
        fsm_output = 8'b10011100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_6;
      end
      COMP_LOOP_2_modExp_1_while_C_6 : begin
        fsm_output = 8'b10011101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_7;
      end
      COMP_LOOP_2_modExp_1_while_C_7 : begin
        fsm_output = 8'b10011110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_8;
      end
      COMP_LOOP_2_modExp_1_while_C_8 : begin
        fsm_output = 8'b10011111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_9;
      end
      COMP_LOOP_2_modExp_1_while_C_9 : begin
        fsm_output = 8'b10100000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_10;
      end
      COMP_LOOP_2_modExp_1_while_C_10 : begin
        fsm_output = 8'b10100001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_11;
      end
      COMP_LOOP_2_modExp_1_while_C_11 : begin
        fsm_output = 8'b10100010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_12;
      end
      COMP_LOOP_2_modExp_1_while_C_12 : begin
        fsm_output = 8'b10100011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_13;
      end
      COMP_LOOP_2_modExp_1_while_C_13 : begin
        fsm_output = 8'b10100100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_14;
      end
      COMP_LOOP_2_modExp_1_while_C_14 : begin
        fsm_output = 8'b10100101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_15;
      end
      COMP_LOOP_2_modExp_1_while_C_15 : begin
        fsm_output = 8'b10100110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_16;
      end
      COMP_LOOP_2_modExp_1_while_C_16 : begin
        fsm_output = 8'b10100111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_17;
      end
      COMP_LOOP_2_modExp_1_while_C_17 : begin
        fsm_output = 8'b10101000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_18;
      end
      COMP_LOOP_2_modExp_1_while_C_18 : begin
        fsm_output = 8'b10101001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_19;
      end
      COMP_LOOP_2_modExp_1_while_C_19 : begin
        fsm_output = 8'b10101010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_20;
      end
      COMP_LOOP_2_modExp_1_while_C_20 : begin
        fsm_output = 8'b10101011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_21;
      end
      COMP_LOOP_2_modExp_1_while_C_21 : begin
        fsm_output = 8'b10101100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_22;
      end
      COMP_LOOP_2_modExp_1_while_C_22 : begin
        fsm_output = 8'b10101101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_23;
      end
      COMP_LOOP_2_modExp_1_while_C_23 : begin
        fsm_output = 8'b10101110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_24;
      end
      COMP_LOOP_2_modExp_1_while_C_24 : begin
        fsm_output = 8'b10101111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_25;
      end
      COMP_LOOP_2_modExp_1_while_C_25 : begin
        fsm_output = 8'b10110000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_26;
      end
      COMP_LOOP_2_modExp_1_while_C_26 : begin
        fsm_output = 8'b10110001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_27;
      end
      COMP_LOOP_2_modExp_1_while_C_27 : begin
        fsm_output = 8'b10110010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_28;
      end
      COMP_LOOP_2_modExp_1_while_C_28 : begin
        fsm_output = 8'b10110011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_29;
      end
      COMP_LOOP_2_modExp_1_while_C_29 : begin
        fsm_output = 8'b10110100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_30;
      end
      COMP_LOOP_2_modExp_1_while_C_30 : begin
        fsm_output = 8'b10110101;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_31;
      end
      COMP_LOOP_2_modExp_1_while_C_31 : begin
        fsm_output = 8'b10110110;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_32;
      end
      COMP_LOOP_2_modExp_1_while_C_32 : begin
        fsm_output = 8'b10110111;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_33;
      end
      COMP_LOOP_2_modExp_1_while_C_33 : begin
        fsm_output = 8'b10111000;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_34;
      end
      COMP_LOOP_2_modExp_1_while_C_34 : begin
        fsm_output = 8'b10111001;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_35;
      end
      COMP_LOOP_2_modExp_1_while_C_35 : begin
        fsm_output = 8'b10111010;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_36;
      end
      COMP_LOOP_2_modExp_1_while_C_36 : begin
        fsm_output = 8'b10111011;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_37;
      end
      COMP_LOOP_2_modExp_1_while_C_37 : begin
        fsm_output = 8'b10111100;
        state_var_NS = COMP_LOOP_2_modExp_1_while_C_38;
      end
      COMP_LOOP_2_modExp_1_while_C_38 : begin
        fsm_output = 8'b10111101;
        if ( COMP_LOOP_2_modExp_1_while_C_38_tr0 ) begin
          state_var_NS = COMP_LOOP_C_63;
        end
        else begin
          state_var_NS = COMP_LOOP_2_modExp_1_while_C_0;
        end
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 8'b10111110;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 8'b10111111;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 8'b11000000;
        state_var_NS = COMP_LOOP_C_66;
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 8'b11000001;
        state_var_NS = COMP_LOOP_C_67;
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 8'b11000010;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 8'b11000011;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 8'b11000100;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 8'b11000101;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 8'b11000110;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 8'b11000111;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 8'b11001000;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 8'b11001001;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 8'b11001010;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 8'b11001011;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 8'b11001100;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 8'b11001101;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 8'b11001110;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 8'b11001111;
        state_var_NS = COMP_LOOP_C_81;
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 8'b11010000;
        state_var_NS = COMP_LOOP_C_82;
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 8'b11010001;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 8'b11010010;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 8'b11010011;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 8'b11010100;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 8'b11010101;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 8'b11010110;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 8'b11010111;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 8'b11011000;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 8'b11011001;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 8'b11011010;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 8'b11011011;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 8'b11011100;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 8'b11011101;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 8'b11011110;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 8'b11011111;
        state_var_NS = COMP_LOOP_C_97;
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 8'b11100000;
        state_var_NS = COMP_LOOP_C_98;
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 8'b11100001;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 8'b11100010;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 8'b11100011;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 8'b11100100;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 8'b11100101;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 8'b11100110;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 8'b11100111;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 8'b11101000;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 8'b11101001;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 8'b11101010;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 8'b11101011;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 8'b11101100;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 8'b11101101;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 8'b11101110;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 8'b11101111;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 8'b11110000;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 8'b11110001;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 8'b11110010;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 8'b11110011;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 8'b11110100;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 8'b11110101;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 8'b11110110;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 8'b11110111;
        state_var_NS = COMP_LOOP_C_121;
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 8'b11111000;
        state_var_NS = COMP_LOOP_C_122;
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 8'b11111001;
        if ( COMP_LOOP_C_122_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 8'b11111010;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_9;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_9 : begin
        fsm_output = 8'b11111011;
        if ( STAGE_LOOP_C_9_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b11111100;
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
  wire and_dcpl;
  wire and_dcpl_3;
  wire nor_tmp_8;
  wire not_tmp_47;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire and_dcpl_19;
  wire and_dcpl_20;
  wire and_dcpl_21;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_32;
  wire and_dcpl_33;
  wire and_dcpl_34;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_43;
  wire and_dcpl_44;
  wire and_dcpl_47;
  wire and_dcpl_54;
  wire and_dcpl_56;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire not_tmp_60;
  wire and_dcpl_66;
  wire and_dcpl_70;
  wire and_dcpl_72;
  wire mux_tmp_68;
  wire or_tmp_73;
  wire mux_tmp_69;
  wire mux_tmp_70;
  wire mux_tmp_73;
  wire mux_tmp_76;
  wire mux_tmp_77;
  wire mux_tmp_80;
  wire mux_tmp_82;
  wire mux_tmp_90;
  wire or_tmp_78;
  wire mux_tmp_93;
  wire and_tmp_10;
  wire and_dcpl_73;
  wire mux_tmp_99;
  wire mux_tmp_100;
  wire and_dcpl_79;
  wire and_dcpl_80;
  wire and_dcpl_81;
  wire or_dcpl_18;
  wire and_dcpl_89;
  wire and_tmp_11;
  wire and_dcpl_92;
  wire mux_tmp_108;
  wire nor_tmp_38;
  wire mux_tmp_111;
  wire not_tmp_98;
  wire mux_tmp_136;
  wire and_dcpl_95;
  wire and_dcpl_98;
  wire and_dcpl_103;
  wire and_dcpl_112;
  wire nor_tmp_47;
  wire or_tmp_123;
  wire nor_tmp_48;
  wire mux_tmp_154;
  wire mux_tmp_156;
  wire mux_tmp_160;
  wire and_dcpl_118;
  wire and_dcpl_121;
  wire and_dcpl_122;
  wire mux_tmp_175;
  wire or_tmp_138;
  wire mux_tmp_187;
  wire or_dcpl_26;
  wire mux_tmp_226;
  wire and_dcpl_129;
  wire and_dcpl_134;
  reg exit_COMP_LOOP_1_modExp_1_while_sva;
  reg COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  reg [11:0] VEC_LOOP_j_sva_11_0;
  reg modExp_exp_1_0_1_sva;
  reg [11:0] COMP_LOOP_acc_1_cse_sva;
  reg [11:0] COMP_LOOP_acc_10_cse_12_1_1_sva;
  reg [63:0] tmp_2_lpi_4_dfm;
  wire and_111_m1c;
  wire and_117_m1c;
  reg reg_vec_rsc_triosy_0_1_obj_ld_cse;
  wire and_164_cse;
  wire or_97_cse;
  wire or_245_cse;
  wire and_178_cse;
  reg [7:0] COMP_LOOP_k_9_1_sva_7_0;
  wire [10:0] COMP_LOOP_acc_psp_sva_1;
  wire [11:0] nl_COMP_LOOP_acc_psp_sva_1;
  reg [10:0] COMP_LOOP_acc_psp_sva;
  wire [63:0] modExp_base_1_sva_mx1;
  wire [63:0] modulo_qr_sva_1_mx0w5;
  wire [64:0] nl_modulo_qr_sva_1_mx0w5;
  wire modExp_while_and_3;
  wire modExp_while_and_5;
  wire mux_174_itm;
  wire mux_227_itm;
  wire and_dcpl_142;
  wire and_dcpl_146;
  wire and_dcpl_152;
  wire and_dcpl_154;
  wire and_dcpl_157;
  wire and_dcpl_162;
  wire and_dcpl_164;
  wire and_dcpl_166;
  wire [63:0] z_out;
  wire [9:0] z_out_1;
  wire [10:0] nl_z_out_1;
  wire and_dcpl_186;
  wire and_dcpl_192;
  wire and_dcpl_198;
  wire and_dcpl_199;
  wire and_dcpl_200;
  wire and_dcpl_202;
  wire and_dcpl_207;
  wire and_dcpl_208;
  wire [64:0] z_out_2;
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
  reg [63:0] COMP_LOOP_1_mul_mut;
  reg [63:0] COMP_LOOP_2_mul_mut;
  reg [63:0] COMP_LOOP_1_acc_8_itm;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [63:0] COMP_LOOP_1_mul_mut_mx0w4;
  wire signed [128:0] nl_COMP_LOOP_1_mul_mut_mx0w4;
  wire [9:0] STAGE_LOOP_lshift_psp_sva_mx0w0;
  wire VEC_LOOP_j_sva_11_0_mx0c1;
  wire modExp_result_sva_mx0c0;
  wire [62:0] operator_64_false_slc_modExp_exp_63_1_3;
  wire modExp_result_and_rgt;
  wire modExp_result_and_1_rgt;
  wire COMP_LOOP_or_1_cse;
  wire nor_118_cse;
  wire and_217_cse;
  wire [64:0] operator_64_false_mux1h_2_rgt;
  reg operator_64_false_acc_mut_64;
  reg [63:0] operator_64_false_acc_mut_63_0;
  wire and_305_cse;
  wire nor_177_cse;
  wire COMP_LOOP_nor_2_itm;
  wire COMP_LOOP_or_14_itm;
  wire COMP_LOOP_or_16_itm;
  wire COMP_LOOP_or_17_itm;
  wire COMP_LOOP_nor_56_itm;
  wire STAGE_LOOP_acc_itm_2_1;
  wire or_246_cse;

  wire[0:0] modulo_result_or_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] mux_84_nl;
  wire[0:0] mux_83_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] or_93_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] mux_74_nl;
  wire[0:0] nor_100_nl;
  wire[0:0] mux_72_nl;
  wire[0:0] and_182_nl;
  wire[0:0] mux_71_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] mux_97_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] mux_95_nl;
  wire[0:0] nor_99_nl;
  wire[0:0] mux_94_nl;
  wire[0:0] mux_92_nl;
  wire[0:0] or_95_nl;
  wire[0:0] mux_91_nl;
  wire[0:0] nand_4_nl;
  wire[0:0] mux_89_nl;
  wire[0:0] and_87_nl;
  wire[0:0] and_88_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] nand_14_nl;
  wire[0:0] and_97_nl;
  wire[0:0] nor_96_nl;
  wire[63:0] mux1h_nl;
  wire[0:0] or_263_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] nor_69_nl;
  wire[0:0] nor_70_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] nor_71_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] and_210_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] nor_55_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] or_171_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] nor_74_nl;
  wire[0:0] nor_75_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] or_166_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] nor_77_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] and_167_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] modExp_while_if_and_1_nl;
  wire[0:0] modExp_while_if_and_2_nl;
  wire[0:0] and_102_nl;
  wire[0:0] mux_115_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] mux_110_nl;
  wire[0:0] mux_109_nl;
  wire[0:0] and_207_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] nand_48_nl;
  wire[0:0] nor_176_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] nand_51_nl;
  wire[0:0] or_307_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] or_308_nl;
  wire[0:0] nand_52_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] and_310_nl;
  wire[0:0] nor_181_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] mux_nl;
  wire[0:0] nand_50_nl;
  wire[0:0] or_267_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] nor_170_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] or_292_nl;
  wire[0:0] or_290_nl;
  wire[0:0] nor_171_nl;
  wire[0:0] mux_251_nl;
  wire[0:0] or_303_nl;
  wire[0:0] nand_46_nl;
  wire[0:0] nor_172_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] or_284_nl;
  wire[0:0] or_283_nl;
  wire[0:0] and_302_nl;
  wire[0:0] mux_249_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] nor_173_nl;
  wire[0:0] mux_247_nl;
  wire[0:0] nor_174_nl;
  wire[0:0] and_303_nl;
  wire[0:0] nor_175_nl;
  wire[0:0] or_nl;
  wire[0:0] mux_135_nl;
  wire[0:0] or_125_nl;
  wire[0:0] mux_134_nl;
  wire[0:0] or_124_nl;
  wire[0:0] or_123_nl;
  wire[0:0] nand_27_nl;
  wire[0:0] mux_257_nl;
  wire[0:0] nor_167_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] or_301_nl;
  wire[0:0] or_299_nl;
  wire[0:0] and_308_nl;
  wire[0:0] and_309_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] nor_89_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] mux_141_nl;
  wire[0:0] or_133_nl;
  wire[0:0] and_114_nl;
  wire[0:0] r_or_nl;
  wire[0:0] r_or_1_nl;
  wire[0:0] and_121_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] nor_85_nl;
  wire[0:0] nor_86_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] and_172_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] and_173_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] or_140_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] nor_84_nl;
  wire[0:0] and_135_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] nor_81_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] and_136_nl;
  wire[0:0] mux_171_nl;
  wire[0:0] nor_79_nl;
  wire[0:0] nor_80_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] mux_164_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] mux_162_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] mux_158_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] mux_155_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] COMP_LOOP_mux1h_12_nl;
  wire[0:0] COMP_LOOP_and_3_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] or_156_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] nor_78_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] or_159_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] and_169_nl;
  wire[9:0] COMP_LOOP_1_acc_nl;
  wire[10:0] nl_COMP_LOOP_1_acc_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] or_247_nl;
  wire[0:0] or_248_nl;
  wire[0:0] nor_nl;
  wire[0:0] and_nl;
  wire[0:0] and_149_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] and_159_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] and_160_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] or_234_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] nor_120_nl;
  wire[0:0] COMP_LOOP_mux1h_19_nl;
  wire[0:0] COMP_LOOP_mux1h_36_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] or_221_nl;
  wire[63:0] COMP_LOOP_mux_40_nl;
  wire[0:0] or_243_nl;
  wire[0:0] nand_22_nl;
  wire[0:0] mux_79_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] nand_15_nl;
  wire[0:0] or_100_nl;
  wire[0:0] and_187_nl;
  wire[0:0] mux_102_nl;
  wire[0:0] and_208_nl;
  wire[0:0] nor_98_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] or_105_nl;
  wire[0:0] mux_105_nl;
  wire[0:0] nor_94_nl;
  wire[0:0] nor_95_nl;
  wire[0:0] mux_107_nl;
  wire[0:0] nand_13_nl;
  wire[0:0] mux_106_nl;
  wire[0:0] or_110_nl;
  wire[0:0] or_34_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] and_209_nl;
  wire[0:0] nor_116_nl;
  wire[0:0] nand_5_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] nor_63_nl;
  wire[0:0] nor_64_nl;
  wire[0:0] nor_90_nl;
  wire[2:0] STAGE_LOOP_acc_nl;
  wire[3:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] nor_87_nl;
  wire[0:0] nor_88_nl;
  wire[0:0] and_55_nl;
  wire[0:0] and_59_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] nor_113_nl;
  wire[0:0] nor_114_nl;
  wire[0:0] and_63_nl;
  wire[0:0] mux_55_nl;
  wire[0:0] nor_111_nl;
  wire[0:0] nor_112_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] nor_109_nl;
  wire[0:0] mux_57_nl;
  wire[0:0] or_68_nl;
  wire[0:0] or_67_nl;
  wire[0:0] nor_110_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] or_64_nl;
  wire[0:0] or_63_nl;
  wire[0:0] mux_61_nl;
  wire[0:0] and_186_nl;
  wire[0:0] mux_60_nl;
  wire[0:0] nor_106_nl;
  wire[0:0] nor_107_nl;
  wire[0:0] nor_108_nl;
  wire[0:0] mux_59_nl;
  wire[0:0] or_72_nl;
  wire[0:0] or_71_nl;
  wire[0:0] mux_64_nl;
  wire[0:0] and_185_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] nor_103_nl;
  wire[0:0] nor_104_nl;
  wire[0:0] nor_105_nl;
  wire[0:0] mux_62_nl;
  wire[0:0] or_240_nl;
  wire[0:0] nand_18_nl;
  wire[0:0] mux_67_nl;
  wire[0:0] and_183_nl;
  wire[0:0] mux_66_nl;
  wire[0:0] nor_101_nl;
  wire[0:0] and_184_nl;
  wire[0:0] nor_102_nl;
  wire[0:0] mux_65_nl;
  wire[0:0] or_84_nl;
  wire[0:0] or_83_nl;
  wire[0:0] mux_235_nl;
  wire[0:0] nor_144_nl;
  wire[0:0] nor_145_nl;
  wire[64:0] acc_nl;
  wire[65:0] nl_acc_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_110_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_111_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_112_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_113_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_114_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_115_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_116_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_117_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_118_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_119_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_120_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_121_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_122_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_123_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_124_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_125_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_126_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_127_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_128_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_129_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_130_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_131_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_132_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_133_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_134_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_135_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_136_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_137_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_138_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_139_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_140_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_141_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_142_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_143_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_144_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_145_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_146_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_147_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_148_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_149_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_150_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_151_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_152_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_153_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_154_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_155_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_156_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_157_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_158_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_159_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_160_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_161_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_or_162_nl;
  wire[1:0] COMP_LOOP_and_166_nl;
  wire[1:0] COMP_LOOP_mux_45_nl;
  wire[0:0] COMP_LOOP_nor_112_nl;
  wire[1:0] COMP_LOOP_or_26_nl;
  wire[1:0] COMP_LOOP_mux1h_67_nl;
  wire[6:0] COMP_LOOP_mux1h_68_nl;
  wire[0:0] COMP_LOOP_or_27_nl;
  wire[0:0] COMP_LOOP_mux1h_69_nl;
  wire[0:0] COMP_LOOP_or_28_nl;
  wire[63:0] COMP_LOOP_mux1h_70_nl;
  wire[0:0] and_311_nl;
  wire[65:0] acc_2_nl;
  wire[66:0] nl_acc_2_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_163_nl;
  wire[63:0] COMP_LOOP_mux1h_71_nl;
  wire[0:0] COMP_LOOP_or_29_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_164_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_165_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_166_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_167_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_168_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_169_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_170_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_171_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_172_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_173_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_174_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_175_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_176_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_177_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_178_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_179_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_180_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_181_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_182_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_183_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_184_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_185_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_186_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_187_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_188_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_189_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_190_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_191_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_192_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_193_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_194_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_195_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_196_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_197_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_198_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_199_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_200_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_201_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_202_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_203_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_204_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_205_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_206_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_207_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_208_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_209_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_210_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_211_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_212_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_213_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_214_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_215_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_216_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_217_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_218_nl;
  wire[7:0] COMP_LOOP_or_30_nl;
  wire[7:0] COMP_LOOP_and_222_nl;
  wire[7:0] COMP_LOOP_COMP_LOOP_mux_3_nl;
  wire[0:0] COMP_LOOP_nor_116_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_219_nl;
  wire[63:0] modExp_while_if_mux1h_1_nl;
  wire[0:0] and_312_nl;
  wire[0:0] nor_184_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] or_310_nl;
  wire[0:0] or_311_nl;
  wire[0:0] and_313_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] nor_185_nl;
  wire[0:0] nor_186_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [10:0] nl_operator_66_true_div_cmp_b;
  assign nl_operator_66_true_div_cmp_b = {1'b0, operator_66_true_div_cmp_b_9_0};
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0 = ~ (z_out_2[64]);
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 = ~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_61_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_61_tr0 = ~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_38_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_38_tr0
      = ~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = z_out[12];
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
      .STAGE_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0[0:0]),
      .modExp_while_C_38_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .COMP_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0[0:0]),
      .COMP_LOOP_1_modExp_1_while_C_38_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .COMP_LOOP_C_61_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_61_tr0[0:0]),
      .COMP_LOOP_2_modExp_1_while_C_38_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_38_tr0[0:0]),
      .COMP_LOOP_C_122_tr0(exit_COMP_LOOP_1_modExp_1_while_sva),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_9_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0[0:0])
    );
  assign or_97_cse = (fsm_output[1:0]!=2'b00);
  assign and_164_cse = (fsm_output[1:0]==2'b11);
  assign and_178_cse = (fsm_output[1]) & (fsm_output[4]);
  assign nor_69_nl = ~((~ (fsm_output[5])) | (fsm_output[3]) | (~ and_164_cse));
  assign nor_70_nl = ~((fsm_output[5]) | (~ (fsm_output[3])) | (fsm_output[0]) |
      (fsm_output[1]));
  assign mux_209_nl = MUX_s_1_2_2(nor_69_nl, nor_70_nl, fsm_output[7]);
  assign nor_71_nl = ~((fsm_output[7:6]!=2'b01));
  assign mux_201_nl = MUX_s_1_2_2(nor_71_nl, (fsm_output[7]), fsm_output[5]);
  assign and_210_nl = (~((fsm_output[1]) & (fsm_output[0]) & (fsm_output[6]))) &
      (fsm_output[7]);
  assign nor_55_nl = ~((~ (fsm_output[1])) | modExp_exp_1_0_1_sva | (~ (fsm_output[0])));
  assign mux_199_nl = MUX_s_1_2_2(mux_tmp_187, nor_tmp_48, nor_55_nl);
  assign mux_200_nl = MUX_s_1_2_2(and_210_nl, mux_199_nl, fsm_output[5]);
  assign mux_202_nl = MUX_s_1_2_2((~ mux_201_nl), mux_200_nl, fsm_output[4]);
  assign or_171_nl = (~(and_164_cse | (fsm_output[6]))) | (fsm_output[7]);
  assign mux_197_nl = MUX_s_1_2_2(or_171_nl, or_tmp_123, fsm_output[5]);
  assign nor_74_nl = ~((~ modExp_exp_1_0_1_sva) | (fsm_output[0]) | (fsm_output[6])
      | (~ (fsm_output[7])));
  assign nor_75_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[6])) | (fsm_output[7]));
  assign mux_195_nl = MUX_s_1_2_2(nor_74_nl, nor_75_nl, fsm_output[1]);
  assign mux_196_nl = MUX_s_1_2_2(mux_195_nl, nor_tmp_48, fsm_output[5]);
  assign mux_198_nl = MUX_s_1_2_2(mux_197_nl, mux_196_nl, fsm_output[4]);
  assign mux_203_nl = MUX_s_1_2_2(mux_202_nl, mux_198_nl, fsm_output[3]);
  assign or_166_nl = (~((fsm_output[1:0]!=2'b10))) | (fsm_output[7:6]!=2'b01);
  assign mux_192_nl = MUX_s_1_2_2(or_166_nl, or_tmp_123, fsm_output[5]);
  assign nor_77_nl = ~(and_164_cse | (fsm_output[7:6]!=2'b10));
  assign mux_191_nl = MUX_s_1_2_2(nor_77_nl, nor_tmp_48, fsm_output[5]);
  assign mux_193_nl = MUX_s_1_2_2(mux_192_nl, mux_191_nl, fsm_output[4]);
  assign mux_188_nl = MUX_s_1_2_2(or_tmp_123, mux_tmp_187, and_164_cse);
  assign mux_189_nl = MUX_s_1_2_2((fsm_output[7]), mux_188_nl, fsm_output[5]);
  assign and_167_nl = ((fsm_output[0]) | (fsm_output[6])) & (fsm_output[7]);
  assign mux_186_nl = MUX_s_1_2_2((~ (fsm_output[7])), and_167_nl, fsm_output[5]);
  assign mux_190_nl = MUX_s_1_2_2(mux_189_nl, mux_186_nl, fsm_output[4]);
  assign mux_194_nl = MUX_s_1_2_2(mux_193_nl, mux_190_nl, fsm_output[3]);
  assign mux_204_nl = MUX_s_1_2_2(mux_203_nl, mux_194_nl, fsm_output[2]);
  assign or_263_nl = and_dcpl_72 | (mux_209_nl & and_dcpl_28 & mux_204_nl);
  assign mux_206_nl = MUX_s_1_2_2(not_tmp_98, mux_tmp_70, fsm_output[5]);
  assign mux_205_nl = MUX_s_1_2_2((~ mux_174_itm), nor_tmp_38, fsm_output[5]);
  assign mux_207_nl = MUX_s_1_2_2((~ mux_206_nl), mux_205_nl, fsm_output[7]);
  assign mux_208_nl = MUX_s_1_2_2(mux_207_nl, mux_tmp_108, fsm_output[6]);
  assign modExp_while_if_and_1_nl = modExp_while_and_3 & and_dcpl_122;
  assign modExp_while_if_and_2_nl = modExp_while_and_5 & and_dcpl_122;
  assign mux1h_nl = MUX1HOT_v_64_5_2(z_out_3, 64'b0000000000000000000000000000000000000000000000000000000000000001,
      modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, (z_out_2[63:0]), {or_263_nl
      , mux_208_nl , modExp_while_if_and_1_nl , modExp_while_if_and_2_nl , and_dcpl_79});
  assign and_102_nl = and_dcpl_44 & and_dcpl_19;
  assign mux_113_nl = MUX_s_1_2_2(not_tmp_98, mux_tmp_111, fsm_output[5]);
  assign and_207_nl = (fsm_output[4]) & (fsm_output[2]) & (fsm_output[1]);
  assign mux_109_nl = MUX_s_1_2_2(and_207_nl, (fsm_output[4]), fsm_output[3]);
  assign mux_110_nl = MUX_s_1_2_2((~ mux_109_nl), nor_tmp_38, fsm_output[5]);
  assign mux_114_nl = MUX_s_1_2_2((~ mux_113_nl), mux_110_nl, fsm_output[7]);
  assign mux_115_nl = MUX_s_1_2_2(mux_114_nl, mux_tmp_108, fsm_output[6]);
  assign operator_64_false_mux1h_2_rgt = MUX1HOT_v_65_3_2(z_out_2, ({2'b00 , operator_64_false_slc_modExp_exp_63_1_3}),
      ({1'b0 , mux1h_nl}), {and_102_nl , and_dcpl_92 , (~ mux_115_nl)});
  assign and_305_cse = (fsm_output[2:1]==2'b11);
  assign nor_177_cse = ~((fsm_output[2:1]!=2'b00));
  assign and_111_m1c = and_dcpl_95 & and_dcpl_70;
  assign modExp_result_and_rgt = (~ modExp_while_and_5) & and_111_m1c;
  assign modExp_result_and_1_rgt = modExp_while_and_5 & and_111_m1c;
  assign nor_118_cse = ~((fsm_output[7]) | (fsm_output[5]));
  assign or_246_cse = (fsm_output[4:0]!=5'b01011);
  assign or_245_cse = (fsm_output[4]) | (fsm_output[2]);
  assign COMP_LOOP_or_1_cse = and_dcpl_41 | and_dcpl_57;
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_COMP_LOOP_acc_psp_sva_1 = (VEC_LOOP_j_sva_11_0[11:1]) + conv_u2u_8_11(COMP_LOOP_k_9_1_sva_7_0);
  assign COMP_LOOP_acc_psp_sva_1 = nl_COMP_LOOP_acc_psp_sva_1[10:0];
  assign COMP_LOOP_mux_40_nl = MUX_v_64_2_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d,
      COMP_LOOP_acc_10_cse_12_1_1_sva[0]);
  assign nl_COMP_LOOP_1_mul_mut_mx0w4 = $signed(operator_64_false_acc_mut_63_0) *
      $signed(conv_u2s_64_65(COMP_LOOP_mux_40_nl));
  assign COMP_LOOP_1_mul_mut_mx0w4 = nl_COMP_LOOP_1_mul_mut_mx0w4[63:0];
  assign operator_64_false_slc_modExp_exp_63_1_3 = MUX_v_63_2_2((operator_66_true_div_cmp_z[63:1]),
      (tmp_2_lpi_4_dfm[63:1]), and_dcpl_98);
  assign nl_modulo_qr_sva_1_mx0w5 = modulo_result_rem_cmp_z + p_sva;
  assign modulo_qr_sva_1_mx0w5 = nl_modulo_qr_sva_1_mx0w5[63:0];
  assign modExp_base_1_sva_mx1 = MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
      modulo_result_rem_cmp_z[63]);
  assign modExp_while_and_3 = (~ (modulo_result_rem_cmp_z[63])) & modExp_exp_1_0_1_sva;
  assign modExp_while_and_5 = (modulo_result_rem_cmp_z[63]) & modExp_exp_1_0_1_sva;
  assign and_dcpl = (fsm_output[7:6]==2'b10);
  assign and_dcpl_3 = (fsm_output[2]) & (fsm_output[4]);
  assign nor_tmp_8 = (fsm_output[7]) & (fsm_output[5]);
  assign or_243_nl = (fsm_output[7]) | (fsm_output[3]) | (fsm_output[5]) | (fsm_output[4])
      | (fsm_output[2]) | (fsm_output[0]) | (fsm_output[1]);
  assign nand_22_nl = ~((fsm_output[7]) & (fsm_output[5]) & (fsm_output[3]) & (fsm_output[4])
      & (fsm_output[2]));
  assign not_tmp_47 = MUX_s_1_2_2(or_243_nl, nand_22_nl, fsm_output[6]);
  assign and_dcpl_17 = ~((fsm_output[7:6]!=2'b00));
  assign and_dcpl_18 = ~((fsm_output[3]) | (fsm_output[5]));
  assign and_dcpl_19 = and_dcpl_18 & and_dcpl_17;
  assign and_dcpl_20 = ~((fsm_output[1:0]!=2'b00));
  assign and_dcpl_21 = ~((fsm_output[2]) | (fsm_output[4]));
  assign and_dcpl_25 = (fsm_output[3]) & (fsm_output[5]);
  assign and_dcpl_26 = and_dcpl_25 & (fsm_output[7:6]==2'b11);
  assign and_dcpl_28 = (~ (fsm_output[2])) & (fsm_output[4]);
  assign and_dcpl_29 = and_dcpl_28 & and_164_cse;
  assign and_dcpl_32 = (~ (fsm_output[3])) & (fsm_output[5]) & and_dcpl_17;
  assign and_dcpl_33 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_34 = and_dcpl_28 & and_dcpl_33;
  assign and_dcpl_35 = and_dcpl_34 & and_dcpl_32;
  assign and_dcpl_36 = (fsm_output[7:6]==2'b01);
  assign and_dcpl_37 = (fsm_output[3]) & (~ (fsm_output[5]));
  assign and_dcpl_38 = and_dcpl_37 & and_dcpl_36;
  assign and_dcpl_39 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_40 = and_dcpl_28 & and_dcpl_39;
  assign and_dcpl_41 = and_dcpl_40 & and_dcpl_38;
  assign and_dcpl_43 = and_dcpl_18 & and_dcpl;
  assign and_dcpl_44 = and_dcpl_21 & and_dcpl_33;
  assign and_dcpl_47 = (fsm_output[4]) & (~ (fsm_output[1]));
  assign and_dcpl_54 = and_dcpl_25 & and_dcpl;
  assign and_dcpl_56 = and_dcpl_3 & and_dcpl_39;
  assign and_dcpl_57 = and_dcpl_56 & and_dcpl_54;
  assign and_dcpl_58 = (~ (fsm_output[1])) & (fsm_output[7]);
  assign not_tmp_60 = ~((fsm_output[6:5]==2'b11));
  assign and_dcpl_66 = (fsm_output[0]) & (fsm_output[3]);
  assign and_dcpl_70 = and_dcpl_37 & and_dcpl_17;
  assign and_dcpl_72 = and_dcpl_21 & and_dcpl_39 & and_dcpl_70;
  assign mux_tmp_68 = MUX_s_1_2_2((fsm_output[4]), or_245_cse, or_97_cse);
  assign or_tmp_73 = (fsm_output[3]) | mux_tmp_68;
  assign mux_tmp_69 = MUX_s_1_2_2(and_dcpl_3, (fsm_output[4]), and_164_cse);
  assign mux_tmp_70 = MUX_s_1_2_2(mux_tmp_69, (fsm_output[4]), fsm_output[3]);
  assign mux_tmp_73 = MUX_s_1_2_2((fsm_output[4]), or_245_cse, fsm_output[1]);
  assign mux_tmp_76 = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), fsm_output[4]);
  assign mux_tmp_77 = MUX_s_1_2_2(mux_tmp_76, and_dcpl_3, fsm_output[1]);
  assign mux_78_nl = MUX_s_1_2_2(and_dcpl_21, and_dcpl_3, fsm_output[1]);
  assign mux_79_nl = MUX_s_1_2_2(mux_78_nl, mux_tmp_77, fsm_output[0]);
  assign mux_tmp_80 = MUX_s_1_2_2((~ (fsm_output[4])), mux_79_nl, fsm_output[3]);
  assign mux_tmp_82 = MUX_s_1_2_2(and_dcpl_3, (fsm_output[4]), fsm_output[3]);
  assign mux_tmp_90 = MUX_s_1_2_2(and_dcpl_3, (fsm_output[4]), or_97_cse);
  assign or_tmp_78 = (fsm_output[1]) | (fsm_output[4]) | (fsm_output[2]);
  assign mux_tmp_93 = MUX_s_1_2_2((fsm_output[4]), or_tmp_78, fsm_output[3]);
  assign and_tmp_10 = (fsm_output[3]) & or_97_cse & (fsm_output[4]) & (fsm_output[2]);
  assign and_dcpl_73 = and_dcpl_29 & and_dcpl_32;
  assign nand_15_nl = ~((fsm_output[7]) & (fsm_output[5]) & (fsm_output[2]));
  assign or_100_nl = (fsm_output[7]) | (fsm_output[5]) | (fsm_output[2]);
  assign mux_tmp_99 = MUX_s_1_2_2(nand_15_nl, or_100_nl, fsm_output[6]);
  assign and_187_nl = (fsm_output[3]) & (fsm_output[1]);
  assign mux_tmp_100 = MUX_s_1_2_2((fsm_output[4]), or_245_cse, and_187_nl);
  assign and_208_nl = (fsm_output[5:2]==4'b1011);
  assign nor_98_nl = ~((fsm_output[5:2]!=4'b0100));
  assign mux_102_nl = MUX_s_1_2_2(and_208_nl, nor_98_nl, fsm_output[7]);
  assign and_dcpl_79 = mux_102_nl & and_dcpl_39 & (fsm_output[6]);
  assign and_dcpl_80 = and_dcpl_3 & and_164_cse;
  assign and_dcpl_81 = and_dcpl_80 & and_dcpl_43;
  assign or_dcpl_18 = ~((~(nor_177_cse & (~ (fsm_output[3])))) & (fsm_output[4]));
  assign or_105_nl = (fsm_output[2:0]!=3'b000);
  assign mux_103_nl = MUX_s_1_2_2(nor_177_cse, or_105_nl, fsm_output[3]);
  assign and_dcpl_89 = ~(mux_103_nl | (fsm_output[5:4]!=2'b00) | (~ and_dcpl_17));
  assign and_tmp_11 = (fsm_output[7]) & (fsm_output[5]) & (fsm_output[3]) & mux_tmp_69;
  assign nor_94_nl = ~((~ (fsm_output[3])) | (~ (fsm_output[0])) | (fsm_output[4]));
  assign nor_95_nl = ~((fsm_output[3]) | (fsm_output[0]) | (~ (fsm_output[4])));
  assign mux_105_nl = MUX_s_1_2_2(nor_94_nl, nor_95_nl, fsm_output[5]);
  assign and_dcpl_92 = mux_105_nl & nor_177_cse & and_dcpl_17;
  assign nand_13_nl = ~((fsm_output[3]) & mux_tmp_69);
  assign mux_107_nl = MUX_s_1_2_2(nand_13_nl, mux_tmp_100, fsm_output[5]);
  assign or_110_nl = (fsm_output[4:2]!=3'b000);
  assign mux_106_nl = MUX_s_1_2_2(or_dcpl_18, or_110_nl, fsm_output[5]);
  assign mux_tmp_108 = MUX_s_1_2_2((~ mux_107_nl), mux_106_nl, fsm_output[7]);
  assign nor_tmp_38 = (fsm_output[4:0]==5'b11111);
  assign or_34_nl = (fsm_output[3]) | (fsm_output[1]);
  assign mux_tmp_111 = MUX_s_1_2_2(and_dcpl_3, (fsm_output[4]), or_34_nl);
  assign not_tmp_98 = MUX_s_1_2_2((fsm_output[4]), (~ mux_tmp_77), fsm_output[3]);
  assign mux_tmp_136 = MUX_s_1_2_2(and_dcpl_3, (fsm_output[4]), fsm_output[1]);
  assign and_dcpl_95 = and_dcpl_3 & and_dcpl_33;
  assign and_dcpl_98 = and_dcpl_28 & and_dcpl_20 & and_dcpl_32;
  assign and_dcpl_103 = ~((fsm_output[3]) | (fsm_output[6]));
  assign and_dcpl_112 = and_dcpl_21 & (fsm_output[1]) & (~ (fsm_output[0])) & (fsm_output[3]);
  assign nor_tmp_47 = ((fsm_output[5]) | (fsm_output[7])) & (fsm_output[6]);
  assign or_tmp_123 = (fsm_output[7:6]!=2'b10);
  assign nor_tmp_48 = (fsm_output[7:6]==2'b11);
  assign mux_tmp_154 = MUX_s_1_2_2((~ or_tmp_123), nor_tmp_48, fsm_output[5]);
  assign mux_tmp_156 = MUX_s_1_2_2((~ (fsm_output[6])), nor_tmp_48, fsm_output[5]);
  assign mux_tmp_160 = MUX_s_1_2_2((fsm_output[7]), (fsm_output[6]), fsm_output[5]);
  assign and_dcpl_118 = and_178_cse & (~ (fsm_output[0])) & and_dcpl_103;
  assign and_dcpl_121 = and_dcpl_40 & and_dcpl_32;
  assign and_209_nl = (fsm_output[7]) & (fsm_output[5]) & (fsm_output[3]) & (fsm_output[0])
      & (~ (fsm_output[1])) & (fsm_output[4]);
  assign nor_116_nl = ~((fsm_output[7]) | (fsm_output[5]) | (fsm_output[3]) | (fsm_output[0])
      | (~ (fsm_output[1])) | (fsm_output[4]));
  assign mux_172_nl = MUX_s_1_2_2(and_209_nl, nor_116_nl, fsm_output[6]);
  assign and_dcpl_122 = mux_172_nl & (fsm_output[2]);
  assign mux_174_itm = MUX_s_1_2_2(and_dcpl_80, (fsm_output[4]), fsm_output[3]);
  assign mux_tmp_175 = MUX_s_1_2_2((~ mux_174_itm), and_tmp_10, fsm_output[5]);
  assign or_tmp_138 = (fsm_output[7]) | (fsm_output[5]) | ((fsm_output[3]) & mux_tmp_136);
  assign mux_tmp_187 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[6]);
  assign or_dcpl_26 = (fsm_output[2]) | (~ (fsm_output[4]));
  assign nand_5_nl = ~((fsm_output[5]) & mux_tmp_82);
  assign mux_tmp_226 = MUX_s_1_2_2(nand_5_nl, mux_tmp_175, fsm_output[7]);
  assign mux_227_itm = MUX_s_1_2_2(mux_tmp_226, or_tmp_138, fsm_output[6]);
  assign and_dcpl_129 = and_dcpl_56 & and_dcpl_43;
  assign nor_63_nl = ~((fsm_output[3:1]!=3'b001));
  assign nor_64_nl = ~((fsm_output[3:1]!=3'b110));
  assign mux_228_nl = MUX_s_1_2_2(nor_63_nl, nor_64_nl, fsm_output[7]);
  assign and_dcpl_134 = mux_228_nl & (fsm_output[4]) & (fsm_output[0]) & (fsm_output[5])
      & (~ (fsm_output[6]));
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_29 & and_dcpl_26;
  assign VEC_LOOP_j_sva_11_0_mx0c1 = and_dcpl_40 & and_dcpl_26;
  assign nor_90_nl = ~((fsm_output[7]) | (fsm_output[5]) | mux_tmp_93);
  assign modExp_result_sva_mx0c0 = MUX_s_1_2_2(nor_90_nl, and_tmp_11, fsm_output[6]);
  assign nl_STAGE_LOOP_acc_nl = (STAGE_LOOP_i_3_0_sva_2[3:1]) + 3'b011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[2:0];
  assign STAGE_LOOP_acc_itm_2_1 = readslicef_3_1_2(STAGE_LOOP_acc_nl);
  assign nor_87_nl = ~((~ (fsm_output[5])) | (fsm_output[3]) | (fsm_output[0]));
  assign nor_88_nl = ~((fsm_output[5]) | (~ and_dcpl_66));
  assign mux_144_nl = MUX_s_1_2_2(nor_87_nl, nor_88_nl, fsm_output[6]);
  assign and_117_m1c = mux_144_nl & and_dcpl_28 & (~ (fsm_output[1])) & (~ (fsm_output[7]));
  assign and_55_nl = and_dcpl_44 & and_dcpl_43;
  assign nor_113_nl = ~((fsm_output[5]) | (fsm_output[3]) | (~ (fsm_output[2])));
  assign nor_114_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[3])) | (fsm_output[2]));
  assign mux_54_nl = MUX_s_1_2_2(nor_113_nl, nor_114_nl, fsm_output[6]);
  assign and_59_nl = mux_54_nl & and_dcpl_47 & (~ (fsm_output[0])) & (fsm_output[7]);
  assign nor_111_nl = ~((fsm_output[5:4]!=2'b01));
  assign nor_112_nl = ~((fsm_output[5:4]!=2'b10));
  assign mux_55_nl = MUX_s_1_2_2(nor_111_nl, nor_112_nl, fsm_output[6]);
  assign and_63_nl = mux_55_nl & (fsm_output[2]) & and_dcpl_33 & (~ (fsm_output[3]))
      & (fsm_output[7]);
  assign vec_rsc_0_0_i_adra_d_pff = MUX1HOT_v_11_5_2(COMP_LOOP_acc_psp_sva_1, (z_out[12:2]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva[11:1]), (COMP_LOOP_acc_1_cse_sva[11:1]),
      {and_dcpl_35 , COMP_LOOP_or_1_cse , and_55_nl , and_59_nl , and_63_nl});
  assign vec_rsc_0_0_i_da_d_pff = modExp_base_1_sva_mx1;
  assign or_68_nl = (~ (fsm_output[2])) | (fsm_output[5]) | (fsm_output[6]);
  assign or_67_nl = (fsm_output[2]) | not_tmp_60;
  assign mux_57_nl = MUX_s_1_2_2(or_68_nl, or_67_nl, fsm_output[3]);
  assign nor_109_nl = ~((~ (fsm_output[4])) | (COMP_LOOP_acc_10_cse_12_1_1_sva[0])
      | mux_57_nl);
  assign or_64_nl = (VEC_LOOP_j_sva_11_0[0]) | (fsm_output[6:5]!=2'b00);
  assign or_63_nl = (COMP_LOOP_acc_1_cse_sva[0]) | not_tmp_60;
  assign mux_56_nl = MUX_s_1_2_2(or_64_nl, or_63_nl, fsm_output[2]);
  assign nor_110_nl = ~((fsm_output[4:3]!=2'b00) | mux_56_nl);
  assign mux_58_nl = MUX_s_1_2_2(nor_109_nl, nor_110_nl, fsm_output[0]);
  assign vec_rsc_0_0_i_wea_d_pff = mux_58_nl & and_dcpl_58;
  assign nor_106_nl = ~((fsm_output[7]) | (fsm_output[5]) | (z_out[1]) | (~ (fsm_output[6])));
  assign nor_107_nl = ~((~ (fsm_output[7])) | (z_out[1]) | (fsm_output[6:5]!=2'b01));
  assign mux_60_nl = MUX_s_1_2_2(nor_106_nl, nor_107_nl, fsm_output[2]);
  assign and_186_nl = (fsm_output[1]) & (fsm_output[3]) & mux_60_nl;
  assign or_72_nl = (fsm_output[7]) | (VEC_LOOP_j_sva_11_0[0]) | (fsm_output[6:5]!=2'b01);
  assign or_71_nl = (~ (fsm_output[7])) | (fsm_output[5]) | (~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      | (COMP_LOOP_acc_1_cse_sva[0]) | (fsm_output[6]);
  assign mux_59_nl = MUX_s_1_2_2(or_72_nl, or_71_nl, fsm_output[2]);
  assign nor_108_nl = ~((fsm_output[1]) | (fsm_output[3]) | mux_59_nl);
  assign mux_61_nl = MUX_s_1_2_2(and_186_nl, nor_108_nl, fsm_output[0]);
  assign vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = mux_61_nl & (fsm_output[4]);
  assign nor_103_nl = ~((~ (fsm_output[2])) | (fsm_output[5]) | (fsm_output[6]));
  assign nor_104_nl = ~((fsm_output[2]) | not_tmp_60);
  assign mux_63_nl = MUX_s_1_2_2(nor_103_nl, nor_104_nl, fsm_output[3]);
  assign and_185_nl = (fsm_output[4]) & (COMP_LOOP_acc_10_cse_12_1_1_sva[0]) & mux_63_nl;
  assign or_240_nl = (~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[6:5]!=2'b00);
  assign nand_18_nl = ~((COMP_LOOP_acc_1_cse_sva[0]) & (fsm_output[6:5]==2'b11));
  assign mux_62_nl = MUX_s_1_2_2(or_240_nl, nand_18_nl, fsm_output[2]);
  assign nor_105_nl = ~((fsm_output[4:3]!=2'b00) | mux_62_nl);
  assign mux_64_nl = MUX_s_1_2_2(and_185_nl, nor_105_nl, fsm_output[0]);
  assign vec_rsc_0_1_i_wea_d_pff = mux_64_nl & and_dcpl_58;
  assign nor_101_nl = ~((fsm_output[7]) | (fsm_output[5]) | (~((z_out[1]) & (fsm_output[6]))));
  assign and_184_nl = (fsm_output[7]) & (z_out[1]) & (fsm_output[6:5]==2'b01);
  assign mux_66_nl = MUX_s_1_2_2(nor_101_nl, and_184_nl, fsm_output[2]);
  assign and_183_nl = (fsm_output[1]) & (fsm_output[3]) & mux_66_nl;
  assign or_84_nl = (fsm_output[7]) | (~ (VEC_LOOP_j_sva_11_0[0])) | (fsm_output[6:5]!=2'b01);
  assign or_83_nl = (~ (fsm_output[7])) | (fsm_output[5]) | (~ COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      | (~ (COMP_LOOP_acc_1_cse_sva[0])) | (fsm_output[6]);
  assign mux_65_nl = MUX_s_1_2_2(or_84_nl, or_83_nl, fsm_output[2]);
  assign nor_102_nl = ~((fsm_output[1]) | (fsm_output[3]) | mux_65_nl);
  assign mux_67_nl = MUX_s_1_2_2(and_183_nl, nor_102_nl, fsm_output[0]);
  assign vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = mux_67_nl & (fsm_output[4]);
  assign nor_144_nl = ~((~ (fsm_output[7])) | (fsm_output[3]) | (~ (fsm_output[4]))
      | (fsm_output[2]));
  assign nor_145_nl = ~((fsm_output[7]) | (~ (fsm_output[3])) | (fsm_output[4]) |
      (~ (fsm_output[2])));
  assign mux_235_nl = MUX_s_1_2_2(nor_144_nl, nor_145_nl, fsm_output[5]);
  assign and_217_cse = mux_235_nl & and_dcpl_39 & (fsm_output[6]);
  assign and_dcpl_142 = and_dcpl_103 & (~ (fsm_output[7])) & (fsm_output[5]);
  assign and_dcpl_146 = and_dcpl_28 & (fsm_output[1:0]==2'b01) & and_dcpl_142;
  assign and_dcpl_152 = and_dcpl_3 & and_164_cse & and_dcpl_103 & (fsm_output[7])
      & (~ (fsm_output[5]));
  assign and_dcpl_154 = (fsm_output[3]) & (fsm_output[6]);
  assign and_dcpl_157 = and_dcpl_40 & and_dcpl_154 & (~ (fsm_output[7])) & (~ (fsm_output[5]));
  assign and_dcpl_162 = and_dcpl_3 & and_dcpl_39 & (fsm_output[3]) & (~ (fsm_output[6]))
      & nor_tmp_8;
  assign and_dcpl_164 = and_dcpl_40 & and_dcpl_154 & nor_tmp_8;
  assign and_dcpl_166 = and_dcpl_28 & and_164_cse & and_dcpl_142;
  assign and_dcpl_186 = and_dcpl_28 & and_dcpl_39 & (fsm_output[3]) & (fsm_output[6])
      & nor_118_cse;
  assign and_dcpl_192 = and_dcpl_28 & and_dcpl_33 & and_dcpl_103 & (~ (fsm_output[7]))
      & (fsm_output[5]);
  assign and_dcpl_198 = and_dcpl_44 & and_dcpl_103 & nor_118_cse;
  assign and_dcpl_199 = (fsm_output[3]) & (~ (fsm_output[6]));
  assign and_dcpl_200 = and_dcpl_199 & nor_118_cse;
  assign and_dcpl_202 = and_dcpl_21 & and_dcpl_39 & and_dcpl_200;
  assign and_dcpl_207 = (fsm_output[2]) & (fsm_output[4]) & and_dcpl_39 & and_dcpl_199
      & (fsm_output[7]) & (fsm_output[5]);
  assign and_dcpl_208 = and_dcpl_44 & and_dcpl_200;
  assign COMP_LOOP_nor_2_itm = ~(and_dcpl_157 | and_dcpl_162 | and_dcpl_164);
  assign COMP_LOOP_or_14_itm = and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_or_16_itm = and_dcpl_157 | and_dcpl_162;
  assign COMP_LOOP_or_17_itm = and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_nor_56_itm = ~(and_dcpl_186 | and_dcpl_192 | and_dcpl_202 | and_dcpl_207
      | and_dcpl_208);
  always @(posedge clk) begin
    if ( ~ not_tmp_47 ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_21 & and_dcpl_20 & and_dcpl_19) | STAGE_LOOP_i_3_0_sva_mx0c1 )
        begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( ~ not_tmp_47 ) begin
      r_sva <= r_rsci_idat;
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
      reg_vec_rsc_triosy_0_1_obj_ld_cse <= and_dcpl_28 & (fsm_output[1]) & and_dcpl_66
          & nor_tmp_8 & (fsm_output[6]) & (~ STAGE_LOOP_acc_itm_2_1);
      modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_12_nl & (~ and_dcpl_121)) | mux_185_nl;
      modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_19_nl & (~(and_dcpl_95 & and_dcpl_54));
      modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_36_nl & (~(and_dcpl_34 & and_dcpl_38));
    end
  end
  always @(posedge clk) begin
    modulo_result_rem_cmp_a <= MUX1HOT_v_64_7_2(z_out_3, operator_64_false_acc_mut_63_0,
        COMP_LOOP_1_acc_8_itm, COMP_LOOP_1_mul_mut_mx0w4, COMP_LOOP_1_mul_mut, (z_out_2[63:0]),
        COMP_LOOP_2_mul_mut, {modulo_result_or_nl , (~ mux_88_nl) , (~ mux_98_nl)
        , and_87_nl , and_88_nl , and_dcpl_79 , and_97_nl});
    modulo_result_rem_cmp_b <= p_sva;
    operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out_2, ({operator_64_false_acc_mut_64
        , operator_64_false_acc_mut_63_0}), and_dcpl_89);
    operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
        STAGE_LOOP_lshift_psp_sva, and_dcpl_89);
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_96_nl, and_tmp_11, fsm_output[6]) ) begin
      STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_245_nl, (~ mux_239_nl), fsm_output[6]) ) begin
      operator_64_false_acc_mut_64 <= operator_64_false_mux1h_2_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_254_nl, and_302_nl, fsm_output[7]) ) begin
      operator_64_false_acc_mut_63_0 <= operator_64_false_mux1h_2_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_sva_11_0 <= 12'b000000000000;
    end
    else if ( and_dcpl_92 | VEC_LOOP_j_sva_11_0_mx0c1 ) begin
      VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(12'b000000000000, (z_out[11:0]), VEC_LOOP_j_sva_11_0_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_k_9_1_sva_7_0 <= 8'b00000000;
    end
    else if ( MUX_s_1_2_2(mux_257_nl, and_309_nl, fsm_output[2]) ) begin
      COMP_LOOP_k_9_1_sva_7_0 <= MUX_v_8_2_2(8'b00000000, (z_out_2[7:0]), or_nl);
    end
  end
  always @(posedge clk) begin
    if ( (modExp_while_and_3 | modExp_while_and_5 | modExp_result_sva_mx0c0 | (~
        mux_143_nl)) & (modExp_result_sva_mx0c0 | modExp_result_and_rgt | modExp_result_and_1_rgt)
        ) begin
      modExp_result_sva <= MUX1HOT_v_64_3_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
          modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, {modExp_result_sva_mx0c0
          , modExp_result_and_rgt , modExp_result_and_1_rgt});
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_152_nl & (~ (fsm_output[6]))) ) begin
      modExp_base_1_sva <= MUX1HOT_v_64_4_2(r_sva, modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
          modExp_result_sva, {and_114_nl , r_or_nl , r_or_1_nl , and_121_nl});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      tmp_2_lpi_4_dfm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( MUX_s_1_2_2(mux_168_nl, mux_159_nl, fsm_output[3]) ) begin
      tmp_2_lpi_4_dfm <= MUX1HOT_v_64_3_2(({1'b0 , operator_64_false_slc_modExp_exp_63_1_3}),
          vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, {and_dcpl_92 , and_135_nl , and_136_nl});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= 1'b0;
    end
    else if ( and_dcpl_72 | and_dcpl_73 | and_dcpl_57 ) begin
      exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((~ (z_out_2[63])), (~
          (z_out[8])), (~ (readslicef_10_1_9(COMP_LOOP_1_acc_nl))), {and_dcpl_72
          , and_dcpl_73 , and_dcpl_57});
    end
  end
  always @(posedge clk) begin
    if ( (~(mux_213_nl | (fsm_output[6]))) | and_dcpl_79 ) begin
      COMP_LOOP_1_acc_8_itm <= MUX_v_64_2_2(z_out_3, z_out, and_dcpl_79);
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_26 | (fsm_output[1]) | (~ (fsm_output[0])) | (fsm_output[3]) |
        (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[6])) ) begin
      COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_35 | and_dcpl_41 | and_dcpl_81 ) begin
      COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm <= MUX1HOT_s_1_3_2((z_out[9]),
          (z_out_2[9]), (z_out[8]), {and_dcpl_35 , and_dcpl_41 , and_dcpl_81});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 12'b000000000000;
    end
    else if ( MUX_s_1_2_2(nor_nl, and_nl, fsm_output[6]) ) begin
      COMP_LOOP_acc_1_cse_sva <= z_out_2[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modExp_exp_1_0_1_sva_1 <= 1'b0;
    end
    else if ( ~ mux_225_nl ) begin
      modExp_exp_1_0_1_sva_1 <= MUX_s_1_2_2((COMP_LOOP_k_9_1_sva_7_0[0]), modExp_exp_1_1_1_sva,
          and_149_nl);
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
    else if ( mux_227_itm ) begin
      modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[5]), modExp_exp_1_7_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[6]), {and_dcpl_121 , and_dcpl_134 , and_dcpl_129});
      modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[4]), modExp_exp_1_6_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[5]), {and_dcpl_121 , and_dcpl_134 , and_dcpl_129});
      modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[3]), modExp_exp_1_5_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[4]), {and_dcpl_121 , and_dcpl_134 , and_dcpl_129});
      modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[2]), modExp_exp_1_4_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[3]), {and_dcpl_121 , and_dcpl_134 , and_dcpl_129});
      modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0[1]), modExp_exp_1_3_1_sva,
          (COMP_LOOP_k_9_1_sva_7_0[2]), {and_dcpl_121 , and_dcpl_134 , and_dcpl_129});
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
  always @(posedge clk) begin
    if ( ~(or_dcpl_26 | (~ and_164_cse) | (~ (fsm_output[3])) | (fsm_output[5]) |
        (fsm_output[7]) | (~ (fsm_output[6]))) ) begin
      COMP_LOOP_1_mul_mut <= COMP_LOOP_1_mul_mut_mx0w4;
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_80 & (fsm_output[3]) & (fsm_output[5]) & (fsm_output[7]) & (~ (fsm_output[6]))
        ) begin
      COMP_LOOP_2_mul_mut <= COMP_LOOP_1_mul_mut_mx0w4;
    end
  end
  assign modulo_result_or_nl = and_dcpl_72 | and_dcpl_73 | and_dcpl_81;
  assign mux_83_nl = MUX_s_1_2_2(and_dcpl_21, mux_tmp_76, fsm_output[1]);
  assign mux_84_nl = MUX_s_1_2_2(mux_83_nl, mux_tmp_77, fsm_output[0]);
  assign mux_85_nl = MUX_s_1_2_2((~ (fsm_output[4])), mux_84_nl, fsm_output[3]);
  assign mux_86_nl = MUX_s_1_2_2(mux_85_nl, (~ mux_tmp_82), fsm_output[5]);
  assign or_93_nl = (fsm_output[4:0]!=5'b00000);
  assign mux_81_nl = MUX_s_1_2_2(or_93_nl, mux_tmp_80, fsm_output[5]);
  assign mux_87_nl = MUX_s_1_2_2(mux_86_nl, mux_81_nl, fsm_output[7]);
  assign nor_100_nl = ~((fsm_output[3]) | mux_tmp_73);
  assign and_182_nl = (fsm_output[3]) & (fsm_output[0]) & (fsm_output[1]);
  assign mux_72_nl = MUX_s_1_2_2((fsm_output[4]), or_245_cse, and_182_nl);
  assign mux_74_nl = MUX_s_1_2_2(nor_100_nl, mux_72_nl, fsm_output[5]);
  assign mux_71_nl = MUX_s_1_2_2((~ mux_tmp_70), or_tmp_73, fsm_output[5]);
  assign mux_75_nl = MUX_s_1_2_2((~ mux_74_nl), mux_71_nl, fsm_output[7]);
  assign mux_88_nl = MUX_s_1_2_2(mux_87_nl, mux_75_nl, fsm_output[6]);
  assign mux_96_nl = MUX_s_1_2_2((~ and_tmp_10), (fsm_output[4]), fsm_output[5]);
  assign mux_94_nl = MUX_s_1_2_2(mux_tmp_76, and_dcpl_3, or_97_cse);
  assign nor_99_nl = ~((fsm_output[3]) | (~ mux_94_nl));
  assign mux_95_nl = MUX_s_1_2_2(nor_99_nl, mux_tmp_93, fsm_output[5]);
  assign mux_97_nl = MUX_s_1_2_2(mux_96_nl, mux_95_nl, fsm_output[7]);
  assign mux_91_nl = MUX_s_1_2_2((~ mux_tmp_73), mux_tmp_90, fsm_output[3]);
  assign or_95_nl = (fsm_output[5]) | mux_91_nl;
  assign mux_89_nl = MUX_s_1_2_2(mux_tmp_68, (~ (fsm_output[4])), fsm_output[3]);
  assign nand_4_nl = ~((fsm_output[5]) & mux_89_nl);
  assign mux_92_nl = MUX_s_1_2_2(or_95_nl, nand_4_nl, fsm_output[7]);
  assign mux_98_nl = MUX_s_1_2_2(mux_97_nl, mux_92_nl, fsm_output[6]);
  assign and_87_nl = (~ mux_tmp_99) & and_178_cse & and_dcpl_66;
  assign nand_14_nl = ~((fsm_output[4:2]==3'b111));
  assign mux_101_nl = MUX_s_1_2_2(nand_14_nl, mux_tmp_100, fsm_output[5]);
  assign and_88_nl = (~ mux_101_nl) & and_dcpl_36;
  assign and_97_nl = or_dcpl_18 & (fsm_output[7:5]==3'b110);
  assign COMP_LOOP_and_3_nl = (~ and_dcpl_98) & and_dcpl_92;
  assign mux_176_nl = MUX_s_1_2_2(mux_tmp_80, (~ mux_tmp_70), fsm_output[5]);
  assign mux_177_nl = MUX_s_1_2_2(mux_176_nl, mux_tmp_175, fsm_output[7]);
  assign nor_78_nl = ~((fsm_output[0]) | (~ (fsm_output[1])) | (fsm_output[4]) |
      (~ (fsm_output[2])));
  assign mux_173_nl = MUX_s_1_2_2(nor_78_nl, mux_tmp_136, fsm_output[3]);
  assign or_156_nl = (fsm_output[7]) | (fsm_output[5]) | mux_173_nl;
  assign mux_178_nl = MUX_s_1_2_2(mux_177_nl, or_156_nl, fsm_output[6]);
  assign COMP_LOOP_mux1h_12_nl = MUX1HOT_s_1_4_2((operator_66_true_div_cmp_z[0]),
      (tmp_2_lpi_4_dfm[0]), modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva, {COMP_LOOP_and_3_nl
      , and_dcpl_98 , and_dcpl_122 , (~ mux_178_nl)});
  assign mux_181_nl = MUX_s_1_2_2(and_dcpl_21, and_dcpl_3, or_97_cse);
  assign mux_182_nl = MUX_s_1_2_2((~ (fsm_output[4])), mux_181_nl, fsm_output[3]);
  assign or_159_nl = (fsm_output[3]) | (~ (fsm_output[0])) | (fsm_output[1]);
  assign mux_180_nl = MUX_s_1_2_2(and_dcpl_3, (fsm_output[4]), or_159_nl);
  assign mux_183_nl = MUX_s_1_2_2(mux_182_nl, (~ mux_180_nl), fsm_output[5]);
  assign and_169_nl = (fsm_output[4:1]==4'b1111);
  assign mux_179_nl = MUX_s_1_2_2((~ mux_174_itm), and_169_nl, fsm_output[5]);
  assign mux_184_nl = MUX_s_1_2_2(mux_183_nl, mux_179_nl, fsm_output[7]);
  assign mux_185_nl = MUX_s_1_2_2(mux_184_nl, or_tmp_138, fsm_output[6]);
  assign COMP_LOOP_mux1h_19_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0[6]), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_1_sva_7_0[7]), {and_dcpl_121 , and_dcpl_73
      , (~ mux_227_itm) , and_dcpl_129});
  assign or_221_nl = (fsm_output[7]) | (fsm_output[5]) | ((fsm_output[3]) & mux_tmp_90);
  assign mux_229_nl = MUX_s_1_2_2(mux_tmp_226, or_221_nl, fsm_output[6]);
  assign COMP_LOOP_mux1h_36_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0[7]), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_1_sva_7_0[1]), {and_dcpl_121 , and_dcpl_134
      , (~ mux_229_nl) , and_dcpl_129});
  assign nor_96_nl = ~((fsm_output[7]) | (fsm_output[5]) | (fsm_output[3]) | (fsm_output[1])
      | (fsm_output[4]) | (fsm_output[2]));
  assign nand_48_nl = ~(((fsm_output[2:1]!=2'b00)) & (fsm_output[3]));
  assign nor_176_nl = ~(nor_177_cse | (fsm_output[3]));
  assign mux_243_nl = MUX_s_1_2_2(nand_48_nl, nor_176_nl, fsm_output[0]);
  assign nor_180_nl = ~((fsm_output[7]) | mux_243_nl);
  assign nand_51_nl = ~((fsm_output[3:2]==2'b11));
  assign or_307_nl = and_305_cse | (fsm_output[3]);
  assign mux_242_nl = MUX_s_1_2_2(nand_51_nl, or_307_nl, fsm_output[7]);
  assign mux_244_nl = MUX_s_1_2_2(nor_180_nl, mux_242_nl, fsm_output[4]);
  assign or_308_nl = (fsm_output[3:0]!=4'b0001);
  assign nand_52_nl = ~((fsm_output[3:0]==4'b1111));
  assign mux_240_nl = MUX_s_1_2_2(or_308_nl, nand_52_nl, fsm_output[7]);
  assign mux_241_nl = MUX_s_1_2_2((fsm_output[7]), mux_240_nl, fsm_output[4]);
  assign mux_245_nl = MUX_s_1_2_2(mux_244_nl, mux_241_nl, fsm_output[5]);
  assign and_310_nl = (and_164_cse | (fsm_output[2])) & (fsm_output[3]);
  assign nor_181_nl = ~((fsm_output[3:1]!=3'b000));
  assign mux_237_nl = MUX_s_1_2_2(and_310_nl, nor_181_nl, fsm_output[7]);
  assign mux_238_nl = MUX_s_1_2_2((fsm_output[7]), mux_237_nl, fsm_output[4]);
  assign nand_50_nl = ~((fsm_output[3:1]==3'b111));
  assign or_267_nl = (fsm_output[3:2]!=2'b00);
  assign mux_nl = MUX_s_1_2_2(nand_50_nl, or_267_nl, fsm_output[7]);
  assign mux_236_nl = MUX_s_1_2_2(mux_nl, (fsm_output[7]), fsm_output[4]);
  assign mux_239_nl = MUX_s_1_2_2(mux_238_nl, mux_236_nl, fsm_output[5]);
  assign or_292_nl = (~ (fsm_output[3])) | (fsm_output[5]) | (~ (fsm_output[1]));
  assign or_290_nl = (fsm_output[5]) | (fsm_output[1]);
  assign mux_252_nl = MUX_s_1_2_2(or_292_nl, or_290_nl, fsm_output[0]);
  assign nor_170_nl = ~((fsm_output[2]) | mux_252_nl);
  assign or_303_nl = (~ modExp_exp_1_0_1_sva) | (fsm_output[5]) | (~ (fsm_output[1]));
  assign nand_46_nl = ~((fsm_output[5]) & (fsm_output[1]));
  assign mux_251_nl = MUX_s_1_2_2(or_303_nl, nand_46_nl, fsm_output[3]);
  assign nor_171_nl = ~((~ (fsm_output[2])) | (fsm_output[0]) | mux_251_nl);
  assign mux_253_nl = MUX_s_1_2_2(nor_170_nl, nor_171_nl, fsm_output[6]);
  assign or_284_nl = (fsm_output[3]) | (~ (fsm_output[5]));
  assign or_283_nl = (fsm_output[3]) | (~(modExp_exp_1_0_1_sva & (fsm_output[5])
      & (fsm_output[1])));
  assign mux_250_nl = MUX_s_1_2_2(or_284_nl, or_283_nl, fsm_output[0]);
  assign nor_172_nl = ~((fsm_output[6]) | (fsm_output[2]) | mux_250_nl);
  assign mux_254_nl = MUX_s_1_2_2(mux_253_nl, nor_172_nl, fsm_output[4]);
  assign nor_173_nl = ~((fsm_output[0]) | (~ (fsm_output[3])) | (~ modExp_exp_1_0_1_sva)
      | (fsm_output[5]) | (fsm_output[1]));
  assign nor_174_nl = ~((fsm_output[3]) | (fsm_output[5]) | (~ (fsm_output[1])));
  assign and_303_nl = (fsm_output[3]) & modExp_exp_1_0_1_sva & (fsm_output[5]) &
      (~ (fsm_output[1]));
  assign mux_247_nl = MUX_s_1_2_2(nor_174_nl, and_303_nl, fsm_output[0]);
  assign mux_248_nl = MUX_s_1_2_2(nor_173_nl, mux_247_nl, fsm_output[2]);
  assign nor_175_nl = ~((fsm_output[2]) | (fsm_output[0]) | (fsm_output[3]) | (fsm_output[5])
      | (~ (fsm_output[1])));
  assign mux_249_nl = MUX_s_1_2_2(mux_248_nl, nor_175_nl, fsm_output[6]);
  assign and_302_nl = (fsm_output[4]) & mux_249_nl;
  assign or_124_nl = (~ (fsm_output[3])) | (~ (fsm_output[0])) | (fsm_output[1])
      | (fsm_output[4]);
  assign or_123_nl = (fsm_output[3]) | (fsm_output[0]) | (fsm_output[1]) | (~ (fsm_output[4]));
  assign mux_134_nl = MUX_s_1_2_2(or_124_nl, or_123_nl, fsm_output[5]);
  assign or_125_nl = (fsm_output[7]) | mux_134_nl;
  assign nand_27_nl = ~((fsm_output[7]) & (fsm_output[5]) & (fsm_output[3]) & (~
      (fsm_output[0])) & and_178_cse);
  assign mux_135_nl = MUX_s_1_2_2(or_125_nl, nand_27_nl, fsm_output[6]);
  assign or_nl = mux_135_nl | (fsm_output[2]);
  assign or_301_nl = (~ (fsm_output[5])) | (fsm_output[0]) | (~ (fsm_output[4]));
  assign or_299_nl = (fsm_output[5]) | (~ (fsm_output[0])) | (fsm_output[4]);
  assign mux_256_nl = MUX_s_1_2_2(or_301_nl, or_299_nl, fsm_output[3]);
  assign nor_167_nl = ~((fsm_output[7:6]!=2'b00) | mux_256_nl);
  assign and_308_nl = (fsm_output[6]) & (fsm_output[7]) & (fsm_output[3]) & (fsm_output[5])
      & (~ (fsm_output[0])) & (fsm_output[4]);
  assign mux_257_nl = MUX_s_1_2_2(nor_167_nl, and_308_nl, fsm_output[1]);
  assign and_309_nl = (fsm_output[1]) & (~ (fsm_output[6])) & (fsm_output[7]) & (fsm_output[3])
      & (fsm_output[5]) & (~ (fsm_output[0])) & (fsm_output[4]);
  assign or_133_nl = (fsm_output[1]) | (~ mux_tmp_76);
  assign mux_141_nl = MUX_s_1_2_2(or_tmp_78, or_133_nl, fsm_output[0]);
  assign mux_142_nl = MUX_s_1_2_2((fsm_output[4]), mux_141_nl, fsm_output[3]);
  assign nor_89_nl = ~((fsm_output[7]) | (fsm_output[5]) | mux_142_nl);
  assign mux_143_nl = MUX_s_1_2_2(nor_89_nl, and_tmp_11, fsm_output[6]);
  assign and_114_nl = and_dcpl_44 & and_dcpl_70;
  assign r_or_nl = ((~ (modulo_result_rem_cmp_z[63])) & and_117_m1c) | (and_dcpl_112
      & nor_tmp_8 & (~ (fsm_output[6])) & (~ (modulo_result_rem_cmp_z[63])));
  assign r_or_1_nl = ((modulo_result_rem_cmp_z[63]) & and_117_m1c) | (and_dcpl_112
      & nor_tmp_8 & (~ (fsm_output[6])) & (modulo_result_rem_cmp_z[63]));
  assign nor_85_nl = ~((~ (fsm_output[5])) | (fsm_output[2]));
  assign nor_86_nl = ~((fsm_output[5]) | (~ (fsm_output[2])));
  assign mux_145_nl = MUX_s_1_2_2(nor_85_nl, nor_86_nl, fsm_output[7]);
  assign and_121_nl = mux_145_nl & (fsm_output[4]) & and_dcpl_39 & and_dcpl_103;
  assign and_172_nl = (fsm_output[3]) & (fsm_output[2]) & (fsm_output[7]) & (fsm_output[5]);
  assign mux_151_nl = MUX_s_1_2_2(and_172_nl, nor_tmp_8, fsm_output[4]);
  assign or_140_nl = (fsm_output[0]) | (fsm_output[2]);
  assign mux_149_nl = MUX_s_1_2_2(nor_118_cse, nor_tmp_8, or_140_nl);
  assign and_173_nl = (fsm_output[3]) & mux_149_nl;
  assign mux_146_nl = MUX_s_1_2_2((fsm_output[5]), (fsm_output[7]), fsm_output[2]);
  assign mux_147_nl = MUX_s_1_2_2(nor_tmp_8, mux_146_nl, fsm_output[0]);
  assign nor_84_nl = ~((fsm_output[2]) | (~ nor_tmp_8));
  assign mux_148_nl = MUX_s_1_2_2(mux_147_nl, nor_84_nl, fsm_output[3]);
  assign mux_150_nl = MUX_s_1_2_2(and_173_nl, mux_148_nl, fsm_output[4]);
  assign mux_152_nl = MUX_s_1_2_2(mux_151_nl, mux_150_nl, fsm_output[1]);
  assign nor_81_nl = ~((VEC_LOOP_j_sva_11_0[0]) | (~ (fsm_output[5])) | (fsm_output[2]));
  assign nor_82_nl = ~((COMP_LOOP_acc_1_cse_sva[0]) | (fsm_output[5]) | (~ (fsm_output[2])));
  assign mux_170_nl = MUX_s_1_2_2(nor_81_nl, nor_82_nl, fsm_output[7]);
  assign and_135_nl = mux_170_nl & and_dcpl_118;
  assign nor_79_nl = ~((~ (VEC_LOOP_j_sva_11_0[0])) | (~ (fsm_output[5])) | (fsm_output[2]));
  assign nor_80_nl = ~((~ (COMP_LOOP_acc_1_cse_sva[0])) | (fsm_output[5]) | (~ (fsm_output[2])));
  assign mux_171_nl = MUX_s_1_2_2(nor_79_nl, nor_80_nl, fsm_output[7]);
  assign and_136_nl = mux_171_nl & and_dcpl_118;
  assign mux_165_nl = MUX_s_1_2_2((~ or_tmp_123), or_tmp_123, fsm_output[5]);
  assign mux_166_nl = MUX_s_1_2_2(mux_165_nl, mux_tmp_160, fsm_output[2]);
  assign mux_162_nl = MUX_s_1_2_2((fsm_output[7]), or_tmp_123, fsm_output[5]);
  assign mux_163_nl = MUX_s_1_2_2(mux_162_nl, mux_tmp_160, fsm_output[2]);
  assign mux_161_nl = MUX_s_1_2_2(mux_tmp_160, nor_tmp_47, fsm_output[2]);
  assign mux_164_nl = MUX_s_1_2_2(mux_163_nl, mux_161_nl, fsm_output[0]);
  assign mux_167_nl = MUX_s_1_2_2(mux_166_nl, mux_164_nl, fsm_output[1]);
  assign mux_168_nl = MUX_s_1_2_2(mux_tmp_156, mux_167_nl, fsm_output[4]);
  assign mux_157_nl = MUX_s_1_2_2(mux_tmp_156, mux_tmp_154, fsm_output[2]);
  assign mux_153_nl = MUX_s_1_2_2((~ or_tmp_123), (fsm_output[6]), fsm_output[5]);
  assign mux_155_nl = MUX_s_1_2_2(mux_tmp_154, mux_153_nl, fsm_output[2]);
  assign mux_158_nl = MUX_s_1_2_2(mux_157_nl, mux_155_nl, fsm_output[1]);
  assign mux_159_nl = MUX_s_1_2_2(mux_158_nl, nor_tmp_47, fsm_output[4]);
  assign nl_COMP_LOOP_1_acc_nl = ({(z_out_2[8:0]) , 1'b0}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))})
      + 10'b0000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[9:0];
  assign or_247_nl = (fsm_output[3]) | (fsm_output[0]) | (fsm_output[1]) | (~ and_dcpl_3);
  assign mux_212_nl = MUX_s_1_2_2(or_246_cse, or_247_nl, fsm_output[5]);
  assign or_248_nl = (fsm_output[5]) | (fsm_output[3]) | (~ and_dcpl_80);
  assign mux_213_nl = MUX_s_1_2_2(mux_212_nl, or_248_nl, fsm_output[7]);
  assign nor_nl = ~((fsm_output[7]) | ((fsm_output[5]) & mux_tmp_111));
  assign and_nl = (fsm_output[7]) & (fsm_output[5]) & or_tmp_73;
  assign and_149_nl = (~ mux_tmp_99) & and_dcpl_47 & and_dcpl_66;
  assign and_160_nl = (fsm_output[2]) & (fsm_output[0]) & (fsm_output[1]) & (fsm_output[7]);
  assign mux_223_nl = MUX_s_1_2_2(and_160_nl, (fsm_output[7]), fsm_output[3]);
  assign and_159_nl = (fsm_output[4]) & mux_223_nl;
  assign or_234_nl = (fsm_output[2]) | and_164_cse | (fsm_output[7]);
  assign nand_6_nl = ~((fsm_output[2]) & or_97_cse & (fsm_output[7]));
  assign mux_221_nl = MUX_s_1_2_2(or_234_nl, nand_6_nl, fsm_output[3]);
  assign mux_222_nl = MUX_s_1_2_2((fsm_output[7]), mux_221_nl, fsm_output[4]);
  assign mux_224_nl = MUX_s_1_2_2(and_159_nl, mux_222_nl, fsm_output[5]);
  assign nor_120_nl = ~((fsm_output[4:3]!=2'b00) | and_305_cse | (fsm_output[7])
      | (fsm_output[5]));
  assign mux_225_nl = MUX_s_1_2_2(mux_224_nl, nor_120_nl, fsm_output[6]);
  assign COMP_LOOP_COMP_LOOP_or_110_nl = ((tmp_2_lpi_4_dfm[63]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_111_nl = ((tmp_2_lpi_4_dfm[62]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_112_nl = ((tmp_2_lpi_4_dfm[61]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_113_nl = ((tmp_2_lpi_4_dfm[60]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_114_nl = ((tmp_2_lpi_4_dfm[59]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_115_nl = ((tmp_2_lpi_4_dfm[58]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_116_nl = ((tmp_2_lpi_4_dfm[57]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_117_nl = ((tmp_2_lpi_4_dfm[56]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_118_nl = ((tmp_2_lpi_4_dfm[55]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_119_nl = ((tmp_2_lpi_4_dfm[54]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_120_nl = ((tmp_2_lpi_4_dfm[53]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_121_nl = ((tmp_2_lpi_4_dfm[52]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_122_nl = ((tmp_2_lpi_4_dfm[51]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_123_nl = ((tmp_2_lpi_4_dfm[50]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_124_nl = ((tmp_2_lpi_4_dfm[49]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_125_nl = ((tmp_2_lpi_4_dfm[48]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_126_nl = ((tmp_2_lpi_4_dfm[47]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_127_nl = ((tmp_2_lpi_4_dfm[46]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_128_nl = ((tmp_2_lpi_4_dfm[45]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_129_nl = ((tmp_2_lpi_4_dfm[44]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_130_nl = ((tmp_2_lpi_4_dfm[43]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_131_nl = ((tmp_2_lpi_4_dfm[42]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_132_nl = ((tmp_2_lpi_4_dfm[41]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_133_nl = ((tmp_2_lpi_4_dfm[40]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_134_nl = ((tmp_2_lpi_4_dfm[39]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_135_nl = ((tmp_2_lpi_4_dfm[38]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_136_nl = ((tmp_2_lpi_4_dfm[37]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_137_nl = ((tmp_2_lpi_4_dfm[36]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_138_nl = ((tmp_2_lpi_4_dfm[35]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_139_nl = ((tmp_2_lpi_4_dfm[34]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_140_nl = ((tmp_2_lpi_4_dfm[33]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_141_nl = ((tmp_2_lpi_4_dfm[32]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_142_nl = ((tmp_2_lpi_4_dfm[31]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_143_nl = ((tmp_2_lpi_4_dfm[30]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_144_nl = ((tmp_2_lpi_4_dfm[29]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_145_nl = ((tmp_2_lpi_4_dfm[28]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_146_nl = ((tmp_2_lpi_4_dfm[27]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_147_nl = ((tmp_2_lpi_4_dfm[26]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_148_nl = ((tmp_2_lpi_4_dfm[25]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_149_nl = ((tmp_2_lpi_4_dfm[24]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_150_nl = ((tmp_2_lpi_4_dfm[23]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_151_nl = ((tmp_2_lpi_4_dfm[22]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_152_nl = ((tmp_2_lpi_4_dfm[21]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_153_nl = ((tmp_2_lpi_4_dfm[20]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_154_nl = ((tmp_2_lpi_4_dfm[19]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_155_nl = ((tmp_2_lpi_4_dfm[18]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_156_nl = ((tmp_2_lpi_4_dfm[17]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_157_nl = ((tmp_2_lpi_4_dfm[16]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_158_nl = ((tmp_2_lpi_4_dfm[15]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_159_nl = ((tmp_2_lpi_4_dfm[14]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_160_nl = ((tmp_2_lpi_4_dfm[13]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_COMP_LOOP_or_161_nl = ((tmp_2_lpi_4_dfm[12]) & COMP_LOOP_nor_2_itm)
      | and_dcpl_146 | and_dcpl_152 | and_dcpl_166;
  assign COMP_LOOP_mux_45_nl = MUX_v_2_2_2((tmp_2_lpi_4_dfm[11:10]), (VEC_LOOP_j_sva_11_0[11:10]),
      and_dcpl_164);
  assign COMP_LOOP_nor_112_nl = ~(and_dcpl_157 | and_dcpl_162);
  assign COMP_LOOP_and_166_nl = MUX_v_2_2_2(2'b00, COMP_LOOP_mux_45_nl, COMP_LOOP_nor_112_nl);
  assign COMP_LOOP_COMP_LOOP_or_162_nl = MUX_v_2_2_2(COMP_LOOP_and_166_nl, 2'b11,
      COMP_LOOP_or_14_itm);
  assign COMP_LOOP_mux1h_67_nl = MUX1HOT_v_2_4_2((tmp_2_lpi_4_dfm[9:8]), ({1'b1 ,
      (~ (COMP_LOOP_k_9_1_sva_7_0[7]))}), (z_out_1[9:8]), (VEC_LOOP_j_sva_11_0[9:8]),
      {and_217_cse , and_dcpl_146 , COMP_LOOP_or_16_itm , and_dcpl_164});
  assign COMP_LOOP_or_26_nl = MUX_v_2_2_2(COMP_LOOP_mux1h_67_nl, 2'b11, COMP_LOOP_or_17_itm);
  assign COMP_LOOP_mux1h_68_nl = MUX1HOT_v_7_6_2((tmp_2_lpi_4_dfm[7:1]), (~ (COMP_LOOP_k_9_1_sva_7_0[6:0])),
      ({(~ modExp_exp_1_7_1_sva) , (~ modExp_exp_1_6_1_sva) , (~ modExp_exp_1_5_1_sva)
      , (~ modExp_exp_1_4_1_sva) , (~ modExp_exp_1_3_1_sva) , (~ modExp_exp_1_2_1_sva)
      , (~ modExp_exp_1_1_1_sva)}), (z_out_1[7:1]), (VEC_LOOP_j_sva_11_0[7:1]), ({(~
      modExp_exp_1_1_1_sva) , (~ modExp_exp_1_7_1_sva) , (~ modExp_exp_1_6_1_sva)
      , (~ modExp_exp_1_5_1_sva) , (~ modExp_exp_1_4_1_sva) , (~ modExp_exp_1_3_1_sva)
      , (~ modExp_exp_1_2_1_sva)}), {and_217_cse , and_dcpl_146 , and_dcpl_152 ,
      COMP_LOOP_or_16_itm , and_dcpl_164 , and_dcpl_166});
  assign COMP_LOOP_mux1h_69_nl = MUX1HOT_s_1_4_2((tmp_2_lpi_4_dfm[0]), (~ modExp_exp_1_0_1_sva_1),
      (z_out_1[0]), (VEC_LOOP_j_sva_11_0[0]), {and_217_cse , COMP_LOOP_or_17_itm
      , COMP_LOOP_or_16_itm , and_dcpl_164});
  assign COMP_LOOP_or_27_nl = COMP_LOOP_mux1h_69_nl | and_dcpl_146;
  assign COMP_LOOP_or_28_nl = (~(and_dcpl_146 | and_dcpl_152 | and_dcpl_157 | and_dcpl_162
      | and_dcpl_164 | and_dcpl_166)) | and_217_cse;
  assign COMP_LOOP_mux1h_70_nl = MUX1HOT_v_64_4_2((~ modExp_base_1_sva_mx1), 64'b0000000000000000000000000000000000000000000000000000000000000001,
      ({52'b0000000000000000000000000000000000000000000000000000 , VEC_LOOP_j_sva_11_0}),
      ({54'b000000000000000000000000000000000000000000000000000000 , STAGE_LOOP_lshift_psp_sva}),
      {and_217_cse , COMP_LOOP_or_14_itm , COMP_LOOP_or_16_itm , and_dcpl_164});
  assign nl_acc_nl = ({COMP_LOOP_COMP_LOOP_or_110_nl , COMP_LOOP_COMP_LOOP_or_111_nl
      , COMP_LOOP_COMP_LOOP_or_112_nl , COMP_LOOP_COMP_LOOP_or_113_nl , COMP_LOOP_COMP_LOOP_or_114_nl
      , COMP_LOOP_COMP_LOOP_or_115_nl , COMP_LOOP_COMP_LOOP_or_116_nl , COMP_LOOP_COMP_LOOP_or_117_nl
      , COMP_LOOP_COMP_LOOP_or_118_nl , COMP_LOOP_COMP_LOOP_or_119_nl , COMP_LOOP_COMP_LOOP_or_120_nl
      , COMP_LOOP_COMP_LOOP_or_121_nl , COMP_LOOP_COMP_LOOP_or_122_nl , COMP_LOOP_COMP_LOOP_or_123_nl
      , COMP_LOOP_COMP_LOOP_or_124_nl , COMP_LOOP_COMP_LOOP_or_125_nl , COMP_LOOP_COMP_LOOP_or_126_nl
      , COMP_LOOP_COMP_LOOP_or_127_nl , COMP_LOOP_COMP_LOOP_or_128_nl , COMP_LOOP_COMP_LOOP_or_129_nl
      , COMP_LOOP_COMP_LOOP_or_130_nl , COMP_LOOP_COMP_LOOP_or_131_nl , COMP_LOOP_COMP_LOOP_or_132_nl
      , COMP_LOOP_COMP_LOOP_or_133_nl , COMP_LOOP_COMP_LOOP_or_134_nl , COMP_LOOP_COMP_LOOP_or_135_nl
      , COMP_LOOP_COMP_LOOP_or_136_nl , COMP_LOOP_COMP_LOOP_or_137_nl , COMP_LOOP_COMP_LOOP_or_138_nl
      , COMP_LOOP_COMP_LOOP_or_139_nl , COMP_LOOP_COMP_LOOP_or_140_nl , COMP_LOOP_COMP_LOOP_or_141_nl
      , COMP_LOOP_COMP_LOOP_or_142_nl , COMP_LOOP_COMP_LOOP_or_143_nl , COMP_LOOP_COMP_LOOP_or_144_nl
      , COMP_LOOP_COMP_LOOP_or_145_nl , COMP_LOOP_COMP_LOOP_or_146_nl , COMP_LOOP_COMP_LOOP_or_147_nl
      , COMP_LOOP_COMP_LOOP_or_148_nl , COMP_LOOP_COMP_LOOP_or_149_nl , COMP_LOOP_COMP_LOOP_or_150_nl
      , COMP_LOOP_COMP_LOOP_or_151_nl , COMP_LOOP_COMP_LOOP_or_152_nl , COMP_LOOP_COMP_LOOP_or_153_nl
      , COMP_LOOP_COMP_LOOP_or_154_nl , COMP_LOOP_COMP_LOOP_or_155_nl , COMP_LOOP_COMP_LOOP_or_156_nl
      , COMP_LOOP_COMP_LOOP_or_157_nl , COMP_LOOP_COMP_LOOP_or_158_nl , COMP_LOOP_COMP_LOOP_or_159_nl
      , COMP_LOOP_COMP_LOOP_or_160_nl , COMP_LOOP_COMP_LOOP_or_161_nl , COMP_LOOP_COMP_LOOP_or_162_nl
      , COMP_LOOP_or_26_nl , COMP_LOOP_mux1h_68_nl , COMP_LOOP_or_27_nl , COMP_LOOP_or_28_nl})
      + ({COMP_LOOP_mux1h_70_nl , 1'b1});
  assign acc_nl = nl_acc_nl[64:0];
  assign z_out = readslicef_65_64_1(acc_nl);
  assign and_311_nl = (fsm_output==8'b10111110);
  assign nl_z_out_1 = STAGE_LOOP_lshift_psp_sva + conv_u2u_9_10({COMP_LOOP_k_9_1_sva_7_0
      , and_311_nl});
  assign z_out_1 = nl_z_out_1[9:0];
  assign COMP_LOOP_COMP_LOOP_or_163_nl = (~(and_dcpl_186 | and_dcpl_192 | and_217_cse
      | and_dcpl_198 | and_dcpl_207)) | and_dcpl_202 | and_dcpl_208;
  assign COMP_LOOP_mux1h_71_nl = MUX1HOT_v_64_7_2(({55'b0000000000000000000000000000000000000000000000000000001
      , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))}), ({52'b0000000000000000000000000000000000000000000000000000
      , VEC_LOOP_j_sva_11_0}), tmp_2_lpi_4_dfm, p_sva, ({1'b1 , (~ (operator_64_false_acc_mut_63_0[62:0]))}),
      ({56'b00000000000000000000000000000000000000000000000000000000 , COMP_LOOP_k_9_1_sva_7_0}),
      (~ (operator_66_true_div_cmp_z[63:0])), {and_dcpl_186 , and_dcpl_192 , and_217_cse
      , and_dcpl_198 , and_dcpl_202 , and_dcpl_207 , and_dcpl_208});
  assign COMP_LOOP_or_29_nl = (~(and_dcpl_192 | and_217_cse | and_dcpl_198 | and_dcpl_202
      | and_dcpl_207 | and_dcpl_208)) | and_dcpl_186;
  assign COMP_LOOP_COMP_LOOP_or_164_nl = ((modExp_base_1_sva_mx1[63]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_165_nl = ((modExp_base_1_sva_mx1[62]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_166_nl = ((modExp_base_1_sva_mx1[61]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_167_nl = ((modExp_base_1_sva_mx1[60]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_168_nl = ((modExp_base_1_sva_mx1[59]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_169_nl = ((modExp_base_1_sva_mx1[58]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_170_nl = ((modExp_base_1_sva_mx1[57]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_171_nl = ((modExp_base_1_sva_mx1[56]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_172_nl = ((modExp_base_1_sva_mx1[55]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_173_nl = ((modExp_base_1_sva_mx1[54]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_174_nl = ((modExp_base_1_sva_mx1[53]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_175_nl = ((modExp_base_1_sva_mx1[52]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_176_nl = ((modExp_base_1_sva_mx1[51]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_177_nl = ((modExp_base_1_sva_mx1[50]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_178_nl = ((modExp_base_1_sva_mx1[49]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_179_nl = ((modExp_base_1_sva_mx1[48]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_180_nl = ((modExp_base_1_sva_mx1[47]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_181_nl = ((modExp_base_1_sva_mx1[46]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_182_nl = ((modExp_base_1_sva_mx1[45]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_183_nl = ((modExp_base_1_sva_mx1[44]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_184_nl = ((modExp_base_1_sva_mx1[43]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_185_nl = ((modExp_base_1_sva_mx1[42]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_186_nl = ((modExp_base_1_sva_mx1[41]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_187_nl = ((modExp_base_1_sva_mx1[40]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_188_nl = ((modExp_base_1_sva_mx1[39]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_189_nl = ((modExp_base_1_sva_mx1[38]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_190_nl = ((modExp_base_1_sva_mx1[37]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_191_nl = ((modExp_base_1_sva_mx1[36]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_192_nl = ((modExp_base_1_sva_mx1[35]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_193_nl = ((modExp_base_1_sva_mx1[34]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_194_nl = ((modExp_base_1_sva_mx1[33]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_195_nl = ((modExp_base_1_sva_mx1[32]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_196_nl = ((modExp_base_1_sva_mx1[31]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_197_nl = ((modExp_base_1_sva_mx1[30]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_198_nl = ((modExp_base_1_sva_mx1[29]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_199_nl = ((modExp_base_1_sva_mx1[28]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_200_nl = ((modExp_base_1_sva_mx1[27]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_201_nl = ((modExp_base_1_sva_mx1[26]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_202_nl = ((modExp_base_1_sva_mx1[25]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_203_nl = ((modExp_base_1_sva_mx1[24]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_204_nl = ((modExp_base_1_sva_mx1[23]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_205_nl = ((modExp_base_1_sva_mx1[22]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_206_nl = ((modExp_base_1_sva_mx1[21]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_207_nl = ((modExp_base_1_sva_mx1[20]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_208_nl = ((modExp_base_1_sva_mx1[19]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_209_nl = ((modExp_base_1_sva_mx1[18]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_210_nl = ((modExp_base_1_sva_mx1[17]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_211_nl = ((modExp_base_1_sva_mx1[16]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_212_nl = ((modExp_base_1_sva_mx1[15]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_213_nl = ((modExp_base_1_sva_mx1[14]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_214_nl = ((modExp_base_1_sva_mx1[13]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_215_nl = ((modExp_base_1_sva_mx1[12]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_216_nl = ((modExp_base_1_sva_mx1[11]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_217_nl = ((modExp_base_1_sva_mx1[10]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_or_218_nl = ((modExp_base_1_sva_mx1[9]) & COMP_LOOP_nor_56_itm)
      | and_dcpl_198;
  assign COMP_LOOP_COMP_LOOP_mux_3_nl = MUX_v_8_2_2(COMP_LOOP_k_9_1_sva_7_0, (modExp_base_1_sva_mx1[8:1]),
      and_217_cse);
  assign COMP_LOOP_nor_116_nl = ~(and_dcpl_202 | and_dcpl_207 | and_dcpl_208);
  assign COMP_LOOP_and_222_nl = MUX_v_8_2_2(8'b00000000, COMP_LOOP_COMP_LOOP_mux_3_nl,
      COMP_LOOP_nor_116_nl);
  assign COMP_LOOP_or_30_nl = MUX_v_8_2_2(COMP_LOOP_and_222_nl, 8'b11111111, and_dcpl_198);
  assign COMP_LOOP_COMP_LOOP_or_219_nl = (modExp_base_1_sva_mx1[0]) | and_dcpl_186
      | and_dcpl_192 | and_dcpl_198 | and_dcpl_202 | and_dcpl_207 | and_dcpl_208;
  assign nl_acc_2_nl = ({COMP_LOOP_COMP_LOOP_or_163_nl , COMP_LOOP_mux1h_71_nl ,
      COMP_LOOP_or_29_nl}) + conv_s2u_65_66({COMP_LOOP_COMP_LOOP_or_164_nl , COMP_LOOP_COMP_LOOP_or_165_nl
      , COMP_LOOP_COMP_LOOP_or_166_nl , COMP_LOOP_COMP_LOOP_or_167_nl , COMP_LOOP_COMP_LOOP_or_168_nl
      , COMP_LOOP_COMP_LOOP_or_169_nl , COMP_LOOP_COMP_LOOP_or_170_nl , COMP_LOOP_COMP_LOOP_or_171_nl
      , COMP_LOOP_COMP_LOOP_or_172_nl , COMP_LOOP_COMP_LOOP_or_173_nl , COMP_LOOP_COMP_LOOP_or_174_nl
      , COMP_LOOP_COMP_LOOP_or_175_nl , COMP_LOOP_COMP_LOOP_or_176_nl , COMP_LOOP_COMP_LOOP_or_177_nl
      , COMP_LOOP_COMP_LOOP_or_178_nl , COMP_LOOP_COMP_LOOP_or_179_nl , COMP_LOOP_COMP_LOOP_or_180_nl
      , COMP_LOOP_COMP_LOOP_or_181_nl , COMP_LOOP_COMP_LOOP_or_182_nl , COMP_LOOP_COMP_LOOP_or_183_nl
      , COMP_LOOP_COMP_LOOP_or_184_nl , COMP_LOOP_COMP_LOOP_or_185_nl , COMP_LOOP_COMP_LOOP_or_186_nl
      , COMP_LOOP_COMP_LOOP_or_187_nl , COMP_LOOP_COMP_LOOP_or_188_nl , COMP_LOOP_COMP_LOOP_or_189_nl
      , COMP_LOOP_COMP_LOOP_or_190_nl , COMP_LOOP_COMP_LOOP_or_191_nl , COMP_LOOP_COMP_LOOP_or_192_nl
      , COMP_LOOP_COMP_LOOP_or_193_nl , COMP_LOOP_COMP_LOOP_or_194_nl , COMP_LOOP_COMP_LOOP_or_195_nl
      , COMP_LOOP_COMP_LOOP_or_196_nl , COMP_LOOP_COMP_LOOP_or_197_nl , COMP_LOOP_COMP_LOOP_or_198_nl
      , COMP_LOOP_COMP_LOOP_or_199_nl , COMP_LOOP_COMP_LOOP_or_200_nl , COMP_LOOP_COMP_LOOP_or_201_nl
      , COMP_LOOP_COMP_LOOP_or_202_nl , COMP_LOOP_COMP_LOOP_or_203_nl , COMP_LOOP_COMP_LOOP_or_204_nl
      , COMP_LOOP_COMP_LOOP_or_205_nl , COMP_LOOP_COMP_LOOP_or_206_nl , COMP_LOOP_COMP_LOOP_or_207_nl
      , COMP_LOOP_COMP_LOOP_or_208_nl , COMP_LOOP_COMP_LOOP_or_209_nl , COMP_LOOP_COMP_LOOP_or_210_nl
      , COMP_LOOP_COMP_LOOP_or_211_nl , COMP_LOOP_COMP_LOOP_or_212_nl , COMP_LOOP_COMP_LOOP_or_213_nl
      , COMP_LOOP_COMP_LOOP_or_214_nl , COMP_LOOP_COMP_LOOP_or_215_nl , COMP_LOOP_COMP_LOOP_or_216_nl
      , COMP_LOOP_COMP_LOOP_or_217_nl , COMP_LOOP_COMP_LOOP_or_218_nl , COMP_LOOP_or_30_nl
      , COMP_LOOP_COMP_LOOP_or_219_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[65:0];
  assign z_out_2 = readslicef_66_65_1(acc_2_nl);
  assign and_312_nl = and_dcpl_21 & (fsm_output[1]) & (~ (fsm_output[0])) & (fsm_output[3])
      & (~ (fsm_output[6])) & nor_118_cse;
  assign or_310_nl = (fsm_output[4:0]!=5'b10111);
  assign mux_261_nl = MUX_s_1_2_2(or_246_cse, or_310_nl, fsm_output[7]);
  assign or_311_nl = (fsm_output[7]) | (fsm_output[3]) | (fsm_output[0]) | (fsm_output[1])
      | (~((fsm_output[2]) & (fsm_output[4])));
  assign mux_260_nl = MUX_s_1_2_2(mux_261_nl, or_311_nl, fsm_output[5]);
  assign nor_184_nl = ~(mux_260_nl | (fsm_output[6]));
  assign nor_185_nl = ~((~ (fsm_output[7])) | (~ (fsm_output[3])) | (fsm_output[0])
      | (fsm_output[1]));
  assign nor_186_nl = ~((fsm_output[7]) | (fsm_output[3]) | (~((fsm_output[1:0]==2'b11))));
  assign mux_262_nl = MUX_s_1_2_2(nor_185_nl, nor_186_nl, fsm_output[5]);
  assign and_313_nl = mux_262_nl & (fsm_output[4]) & (~ (fsm_output[2])) & (~ (fsm_output[6]));
  assign modExp_while_if_mux1h_1_nl = MUX1HOT_v_64_3_2(modExp_result_sva, modExp_base_1_sva,
      operator_64_false_acc_mut_63_0, {and_312_nl , nor_184_nl , and_313_nl});
  assign nl_z_out_3 = modExp_while_if_mux1h_1_nl * modExp_base_1_sva;
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


  function automatic [63:0] MUX1HOT_v_64_7_2;
    input [63:0] input_6;
    input [63:0] input_5;
    input [63:0] input_4;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [6:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    result = result | ( input_3 & {64{sel[3]}});
    result = result | ( input_4 & {64{sel[4]}});
    result = result | ( input_5 & {64{sel[5]}});
    result = result | ( input_6 & {64{sel[6]}});
    MUX1HOT_v_64_7_2 = result;
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


  function automatic [6:0] MUX1HOT_v_7_6_2;
    input [6:0] input_5;
    input [6:0] input_4;
    input [6:0] input_3;
    input [6:0] input_2;
    input [6:0] input_1;
    input [6:0] input_0;
    input [5:0] sel;
    reg [6:0] result;
  begin
    result = input_0 & {7{sel[0]}};
    result = result | ( input_1 & {7{sel[1]}});
    result = result | ( input_2 & {7{sel[2]}});
    result = result | ( input_3 & {7{sel[3]}});
    result = result | ( input_4 & {7{sel[4]}});
    result = result | ( input_5 & {7{sel[5]}});
    MUX1HOT_v_7_6_2 = result;
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


  function automatic [63:0] readslicef_65_64_1;
    input [64:0] vector;
    reg [64:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_65_64_1 = tmp[63:0];
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


  function automatic [65:0] conv_s2u_65_66 ;
    input [64:0]  vector ;
  begin
    conv_s2u_65_66 = {vector[64], vector};
  end
  endfunction


  function automatic [64:0] conv_u2s_64_65 ;
    input [63:0]  vector ;
  begin
    conv_u2s_64_65 =  {1'b0, vector};
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



