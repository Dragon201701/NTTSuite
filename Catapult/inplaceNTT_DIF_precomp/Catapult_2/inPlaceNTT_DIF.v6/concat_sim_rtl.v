
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
//  Generated date: Wed Aug 18 21:31:42 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen
    (
  q, re, radr, radr_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output re;
  output [8:0] radr;
  input [8:0] radr_d;
  input re_d;
  output [63:0] q_d;
  input port_0_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign re = (port_0_r_ram_ir_internal_RMASK_B_d);
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen
    (
  q, re, radr, radr_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output re;
  output [8:0] radr;
  input [8:0] radr_d;
  input re_d;
  output [63:0] q_d;
  input port_0_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign re = (port_0_r_ram_ir_internal_RMASK_B_d);
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen
    (
  we, d, wadr, q, re, radr, radr_d, wadr_d, d_d, we_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d,
      port_1_w_ram_ir_internal_WMASK_B_d
);
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] q;
  output re;
  output [8:0] radr;
  input [8:0] radr_d;
  input [8:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen
    (
  we, d, wadr, q, re, radr, radr_d, wadr_d, d_d, we_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d,
      port_1_w_ram_ir_internal_WMASK_B_d
);
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] q;
  output re;
  output [8:0] radr;
  input [8:0] radr_d;
  input [8:0] wadr_d;
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
  clk, rst, fsm_output, COMP_LOOP_C_79_tr0, COMP_LOOP_C_157_tr0, VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input COMP_LOOP_C_79_tr0;
  input COMP_LOOP_C_157_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIF_core_core_fsm_1
  parameter
    main_C_0 = 8'd0,
    STAGE_LOOP_C_0 = 8'd1,
    COMP_LOOP_C_0 = 8'd2,
    COMP_LOOP_C_1 = 8'd3,
    COMP_LOOP_C_2 = 8'd4,
    COMP_LOOP_C_3 = 8'd5,
    COMP_LOOP_C_4 = 8'd6,
    COMP_LOOP_C_5 = 8'd7,
    COMP_LOOP_C_6 = 8'd8,
    COMP_LOOP_C_7 = 8'd9,
    COMP_LOOP_C_8 = 8'd10,
    COMP_LOOP_C_9 = 8'd11,
    COMP_LOOP_C_10 = 8'd12,
    COMP_LOOP_C_11 = 8'd13,
    COMP_LOOP_C_12 = 8'd14,
    COMP_LOOP_C_13 = 8'd15,
    COMP_LOOP_C_14 = 8'd16,
    COMP_LOOP_C_15 = 8'd17,
    COMP_LOOP_C_16 = 8'd18,
    COMP_LOOP_C_17 = 8'd19,
    COMP_LOOP_C_18 = 8'd20,
    COMP_LOOP_C_19 = 8'd21,
    COMP_LOOP_C_20 = 8'd22,
    COMP_LOOP_C_21 = 8'd23,
    COMP_LOOP_C_22 = 8'd24,
    COMP_LOOP_C_23 = 8'd25,
    COMP_LOOP_C_24 = 8'd26,
    COMP_LOOP_C_25 = 8'd27,
    COMP_LOOP_C_26 = 8'd28,
    COMP_LOOP_C_27 = 8'd29,
    COMP_LOOP_C_28 = 8'd30,
    COMP_LOOP_C_29 = 8'd31,
    COMP_LOOP_C_30 = 8'd32,
    COMP_LOOP_C_31 = 8'd33,
    COMP_LOOP_C_32 = 8'd34,
    COMP_LOOP_C_33 = 8'd35,
    COMP_LOOP_C_34 = 8'd36,
    COMP_LOOP_C_35 = 8'd37,
    COMP_LOOP_C_36 = 8'd38,
    COMP_LOOP_C_37 = 8'd39,
    COMP_LOOP_C_38 = 8'd40,
    COMP_LOOP_C_39 = 8'd41,
    COMP_LOOP_C_40 = 8'd42,
    COMP_LOOP_C_41 = 8'd43,
    COMP_LOOP_C_42 = 8'd44,
    COMP_LOOP_C_43 = 8'd45,
    COMP_LOOP_C_44 = 8'd46,
    COMP_LOOP_C_45 = 8'd47,
    COMP_LOOP_C_46 = 8'd48,
    COMP_LOOP_C_47 = 8'd49,
    COMP_LOOP_C_48 = 8'd50,
    COMP_LOOP_C_49 = 8'd51,
    COMP_LOOP_C_50 = 8'd52,
    COMP_LOOP_C_51 = 8'd53,
    COMP_LOOP_C_52 = 8'd54,
    COMP_LOOP_C_53 = 8'd55,
    COMP_LOOP_C_54 = 8'd56,
    COMP_LOOP_C_55 = 8'd57,
    COMP_LOOP_C_56 = 8'd58,
    COMP_LOOP_C_57 = 8'd59,
    COMP_LOOP_C_58 = 8'd60,
    COMP_LOOP_C_59 = 8'd61,
    COMP_LOOP_C_60 = 8'd62,
    COMP_LOOP_C_61 = 8'd63,
    COMP_LOOP_C_62 = 8'd64,
    COMP_LOOP_C_63 = 8'd65,
    COMP_LOOP_C_64 = 8'd66,
    COMP_LOOP_C_65 = 8'd67,
    COMP_LOOP_C_66 = 8'd68,
    COMP_LOOP_C_67 = 8'd69,
    COMP_LOOP_C_68 = 8'd70,
    COMP_LOOP_C_69 = 8'd71,
    COMP_LOOP_C_70 = 8'd72,
    COMP_LOOP_C_71 = 8'd73,
    COMP_LOOP_C_72 = 8'd74,
    COMP_LOOP_C_73 = 8'd75,
    COMP_LOOP_C_74 = 8'd76,
    COMP_LOOP_C_75 = 8'd77,
    COMP_LOOP_C_76 = 8'd78,
    COMP_LOOP_C_77 = 8'd79,
    COMP_LOOP_C_78 = 8'd80,
    COMP_LOOP_C_79 = 8'd81,
    COMP_LOOP_C_80 = 8'd82,
    COMP_LOOP_C_81 = 8'd83,
    COMP_LOOP_C_82 = 8'd84,
    COMP_LOOP_C_83 = 8'd85,
    COMP_LOOP_C_84 = 8'd86,
    COMP_LOOP_C_85 = 8'd87,
    COMP_LOOP_C_86 = 8'd88,
    COMP_LOOP_C_87 = 8'd89,
    COMP_LOOP_C_88 = 8'd90,
    COMP_LOOP_C_89 = 8'd91,
    COMP_LOOP_C_90 = 8'd92,
    COMP_LOOP_C_91 = 8'd93,
    COMP_LOOP_C_92 = 8'd94,
    COMP_LOOP_C_93 = 8'd95,
    COMP_LOOP_C_94 = 8'd96,
    COMP_LOOP_C_95 = 8'd97,
    COMP_LOOP_C_96 = 8'd98,
    COMP_LOOP_C_97 = 8'd99,
    COMP_LOOP_C_98 = 8'd100,
    COMP_LOOP_C_99 = 8'd101,
    COMP_LOOP_C_100 = 8'd102,
    COMP_LOOP_C_101 = 8'd103,
    COMP_LOOP_C_102 = 8'd104,
    COMP_LOOP_C_103 = 8'd105,
    COMP_LOOP_C_104 = 8'd106,
    COMP_LOOP_C_105 = 8'd107,
    COMP_LOOP_C_106 = 8'd108,
    COMP_LOOP_C_107 = 8'd109,
    COMP_LOOP_C_108 = 8'd110,
    COMP_LOOP_C_109 = 8'd111,
    COMP_LOOP_C_110 = 8'd112,
    COMP_LOOP_C_111 = 8'd113,
    COMP_LOOP_C_112 = 8'd114,
    COMP_LOOP_C_113 = 8'd115,
    COMP_LOOP_C_114 = 8'd116,
    COMP_LOOP_C_115 = 8'd117,
    COMP_LOOP_C_116 = 8'd118,
    COMP_LOOP_C_117 = 8'd119,
    COMP_LOOP_C_118 = 8'd120,
    COMP_LOOP_C_119 = 8'd121,
    COMP_LOOP_C_120 = 8'd122,
    COMP_LOOP_C_121 = 8'd123,
    COMP_LOOP_C_122 = 8'd124,
    COMP_LOOP_C_123 = 8'd125,
    COMP_LOOP_C_124 = 8'd126,
    COMP_LOOP_C_125 = 8'd127,
    COMP_LOOP_C_126 = 8'd128,
    COMP_LOOP_C_127 = 8'd129,
    COMP_LOOP_C_128 = 8'd130,
    COMP_LOOP_C_129 = 8'd131,
    COMP_LOOP_C_130 = 8'd132,
    COMP_LOOP_C_131 = 8'd133,
    COMP_LOOP_C_132 = 8'd134,
    COMP_LOOP_C_133 = 8'd135,
    COMP_LOOP_C_134 = 8'd136,
    COMP_LOOP_C_135 = 8'd137,
    COMP_LOOP_C_136 = 8'd138,
    COMP_LOOP_C_137 = 8'd139,
    COMP_LOOP_C_138 = 8'd140,
    COMP_LOOP_C_139 = 8'd141,
    COMP_LOOP_C_140 = 8'd142,
    COMP_LOOP_C_141 = 8'd143,
    COMP_LOOP_C_142 = 8'd144,
    COMP_LOOP_C_143 = 8'd145,
    COMP_LOOP_C_144 = 8'd146,
    COMP_LOOP_C_145 = 8'd147,
    COMP_LOOP_C_146 = 8'd148,
    COMP_LOOP_C_147 = 8'd149,
    COMP_LOOP_C_148 = 8'd150,
    COMP_LOOP_C_149 = 8'd151,
    COMP_LOOP_C_150 = 8'd152,
    COMP_LOOP_C_151 = 8'd153,
    COMP_LOOP_C_152 = 8'd154,
    COMP_LOOP_C_153 = 8'd155,
    COMP_LOOP_C_154 = 8'd156,
    COMP_LOOP_C_155 = 8'd157,
    COMP_LOOP_C_156 = 8'd158,
    COMP_LOOP_C_157 = 8'd159,
    VEC_LOOP_C_0 = 8'd160,
    STAGE_LOOP_C_1 = 8'd161,
    main_C_1 = 8'd162;

  reg [7:0] state_var;
  reg [7:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIF_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 8'b00000001;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 8'b00000010;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 8'b00000011;
        state_var_NS = COMP_LOOP_C_2;
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 8'b00000100;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 8'b00000101;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 8'b00000110;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 8'b00000111;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 8'b00001000;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 8'b00001001;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 8'b00001010;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 8'b00001011;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 8'b00001100;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 8'b00001101;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 8'b00001110;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 8'b00001111;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 8'b00010000;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 8'b00010001;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 8'b00010010;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 8'b00010011;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 8'b00010100;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 8'b00010101;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 8'b00010110;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 8'b00010111;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 8'b00011000;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 8'b00011001;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 8'b00011010;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 8'b00011011;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 8'b00011100;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 8'b00011101;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 8'b00011110;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 8'b00011111;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 8'b00100000;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 8'b00100001;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 8'b00100010;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 8'b00100011;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 8'b00100100;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 8'b00100101;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 8'b00100110;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 8'b00100111;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 8'b00101000;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 8'b00101001;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 8'b00101010;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 8'b00101011;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 8'b00101100;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 8'b00101101;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 8'b00101110;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 8'b00101111;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 8'b00110000;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 8'b00110001;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 8'b00110010;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 8'b00110011;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 8'b00110100;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 8'b00110101;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 8'b00110110;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 8'b00110111;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 8'b00111000;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 8'b00111001;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 8'b00111010;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 8'b00111011;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 8'b00111100;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 8'b00111101;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 8'b00111110;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 8'b00111111;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 8'b01000000;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 8'b01000001;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 8'b01000010;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 8'b01000011;
        state_var_NS = COMP_LOOP_C_66;
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 8'b01000100;
        state_var_NS = COMP_LOOP_C_67;
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 8'b01000101;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 8'b01000110;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 8'b01000111;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 8'b01001000;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 8'b01001001;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 8'b01001010;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 8'b01001011;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 8'b01001100;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 8'b01001101;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 8'b01001110;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 8'b01001111;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 8'b01010000;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 8'b01010001;
        if ( COMP_LOOP_C_79_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_80;
        end
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 8'b01010010;
        state_var_NS = COMP_LOOP_C_81;
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 8'b01010011;
        state_var_NS = COMP_LOOP_C_82;
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 8'b01010100;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 8'b01010101;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 8'b01010110;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 8'b01010111;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 8'b01011000;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 8'b01011001;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 8'b01011010;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 8'b01011011;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 8'b01011100;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 8'b01011101;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 8'b01011110;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 8'b01011111;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 8'b01100000;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 8'b01100001;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 8'b01100010;
        state_var_NS = COMP_LOOP_C_97;
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 8'b01100011;
        state_var_NS = COMP_LOOP_C_98;
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 8'b01100100;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 8'b01100101;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 8'b01100110;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 8'b01100111;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 8'b01101000;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 8'b01101001;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 8'b01101010;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 8'b01101011;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 8'b01101100;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 8'b01101101;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 8'b01101110;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 8'b01101111;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 8'b01110000;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 8'b01110001;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 8'b01110010;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 8'b01110011;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 8'b01110100;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 8'b01110101;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 8'b01110110;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 8'b01110111;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 8'b01111000;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 8'b01111001;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 8'b01111010;
        state_var_NS = COMP_LOOP_C_121;
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 8'b01111011;
        state_var_NS = COMP_LOOP_C_122;
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 8'b01111100;
        state_var_NS = COMP_LOOP_C_123;
      end
      COMP_LOOP_C_123 : begin
        fsm_output = 8'b01111101;
        state_var_NS = COMP_LOOP_C_124;
      end
      COMP_LOOP_C_124 : begin
        fsm_output = 8'b01111110;
        state_var_NS = COMP_LOOP_C_125;
      end
      COMP_LOOP_C_125 : begin
        fsm_output = 8'b01111111;
        state_var_NS = COMP_LOOP_C_126;
      end
      COMP_LOOP_C_126 : begin
        fsm_output = 8'b10000000;
        state_var_NS = COMP_LOOP_C_127;
      end
      COMP_LOOP_C_127 : begin
        fsm_output = 8'b10000001;
        state_var_NS = COMP_LOOP_C_128;
      end
      COMP_LOOP_C_128 : begin
        fsm_output = 8'b10000010;
        state_var_NS = COMP_LOOP_C_129;
      end
      COMP_LOOP_C_129 : begin
        fsm_output = 8'b10000011;
        state_var_NS = COMP_LOOP_C_130;
      end
      COMP_LOOP_C_130 : begin
        fsm_output = 8'b10000100;
        state_var_NS = COMP_LOOP_C_131;
      end
      COMP_LOOP_C_131 : begin
        fsm_output = 8'b10000101;
        state_var_NS = COMP_LOOP_C_132;
      end
      COMP_LOOP_C_132 : begin
        fsm_output = 8'b10000110;
        state_var_NS = COMP_LOOP_C_133;
      end
      COMP_LOOP_C_133 : begin
        fsm_output = 8'b10000111;
        state_var_NS = COMP_LOOP_C_134;
      end
      COMP_LOOP_C_134 : begin
        fsm_output = 8'b10001000;
        state_var_NS = COMP_LOOP_C_135;
      end
      COMP_LOOP_C_135 : begin
        fsm_output = 8'b10001001;
        state_var_NS = COMP_LOOP_C_136;
      end
      COMP_LOOP_C_136 : begin
        fsm_output = 8'b10001010;
        state_var_NS = COMP_LOOP_C_137;
      end
      COMP_LOOP_C_137 : begin
        fsm_output = 8'b10001011;
        state_var_NS = COMP_LOOP_C_138;
      end
      COMP_LOOP_C_138 : begin
        fsm_output = 8'b10001100;
        state_var_NS = COMP_LOOP_C_139;
      end
      COMP_LOOP_C_139 : begin
        fsm_output = 8'b10001101;
        state_var_NS = COMP_LOOP_C_140;
      end
      COMP_LOOP_C_140 : begin
        fsm_output = 8'b10001110;
        state_var_NS = COMP_LOOP_C_141;
      end
      COMP_LOOP_C_141 : begin
        fsm_output = 8'b10001111;
        state_var_NS = COMP_LOOP_C_142;
      end
      COMP_LOOP_C_142 : begin
        fsm_output = 8'b10010000;
        state_var_NS = COMP_LOOP_C_143;
      end
      COMP_LOOP_C_143 : begin
        fsm_output = 8'b10010001;
        state_var_NS = COMP_LOOP_C_144;
      end
      COMP_LOOP_C_144 : begin
        fsm_output = 8'b10010010;
        state_var_NS = COMP_LOOP_C_145;
      end
      COMP_LOOP_C_145 : begin
        fsm_output = 8'b10010011;
        state_var_NS = COMP_LOOP_C_146;
      end
      COMP_LOOP_C_146 : begin
        fsm_output = 8'b10010100;
        state_var_NS = COMP_LOOP_C_147;
      end
      COMP_LOOP_C_147 : begin
        fsm_output = 8'b10010101;
        state_var_NS = COMP_LOOP_C_148;
      end
      COMP_LOOP_C_148 : begin
        fsm_output = 8'b10010110;
        state_var_NS = COMP_LOOP_C_149;
      end
      COMP_LOOP_C_149 : begin
        fsm_output = 8'b10010111;
        state_var_NS = COMP_LOOP_C_150;
      end
      COMP_LOOP_C_150 : begin
        fsm_output = 8'b10011000;
        state_var_NS = COMP_LOOP_C_151;
      end
      COMP_LOOP_C_151 : begin
        fsm_output = 8'b10011001;
        state_var_NS = COMP_LOOP_C_152;
      end
      COMP_LOOP_C_152 : begin
        fsm_output = 8'b10011010;
        state_var_NS = COMP_LOOP_C_153;
      end
      COMP_LOOP_C_153 : begin
        fsm_output = 8'b10011011;
        state_var_NS = COMP_LOOP_C_154;
      end
      COMP_LOOP_C_154 : begin
        fsm_output = 8'b10011100;
        state_var_NS = COMP_LOOP_C_155;
      end
      COMP_LOOP_C_155 : begin
        fsm_output = 8'b10011101;
        state_var_NS = COMP_LOOP_C_156;
      end
      COMP_LOOP_C_156 : begin
        fsm_output = 8'b10011110;
        state_var_NS = COMP_LOOP_C_157;
      end
      COMP_LOOP_C_157 : begin
        fsm_output = 8'b10011111;
        if ( COMP_LOOP_C_157_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 8'b10100000;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 8'b10100001;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b10100010;
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
//  Design Unit:    inPlaceNTT_DIF_core
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core (
  clk, rst, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_triosy_lz, twiddle_rsc_triosy_0_0_lz, twiddle_rsc_triosy_0_1_lz, vec_rsc_0_0_i_q_d,
      vec_rsc_0_1_i_q_d, twiddle_rsc_0_0_i_radr_d, twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_radr_d,
      twiddle_rsc_0_1_i_q_d, vec_rsc_0_0_i_radr_d_pff, vec_rsc_0_0_i_wadr_d_pff,
      vec_rsc_0_0_i_d_d_pff, vec_rsc_0_0_i_we_d_pff, vec_rsc_0_0_i_re_d_pff, vec_rsc_0_1_i_we_d_pff,
      vec_rsc_0_1_i_re_d_pff, twiddle_rsc_0_0_i_re_d_pff, twiddle_rsc_0_1_i_re_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_0_0_lz;
  output vec_rsc_triosy_0_1_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_0_0_lz;
  output twiddle_rsc_triosy_0_1_lz;
  input [63:0] vec_rsc_0_0_i_q_d;
  input [63:0] vec_rsc_0_1_i_q_d;
  output [8:0] twiddle_rsc_0_0_i_radr_d;
  input [63:0] twiddle_rsc_0_0_i_q_d;
  output [8:0] twiddle_rsc_0_1_i_radr_d;
  input [63:0] twiddle_rsc_0_1_i_q_d;
  output [8:0] vec_rsc_0_0_i_radr_d_pff;
  output [8:0] vec_rsc_0_0_i_wadr_d_pff;
  output [63:0] vec_rsc_0_0_i_d_d_pff;
  output vec_rsc_0_0_i_we_d_pff;
  output vec_rsc_0_0_i_re_d_pff;
  output vec_rsc_0_1_i_we_d_pff;
  output vec_rsc_0_1_i_re_d_pff;
  output twiddle_rsc_0_0_i_re_d_pff;
  output twiddle_rsc_0_1_i_re_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  reg [63:0] COMP_LOOP_1_modulo_dev_result_rem_cmp_a;
  reg [63:0] COMP_LOOP_1_modulo_dev_result_rem_cmp_b;
  wire [63:0] COMP_LOOP_1_modulo_dev_result_rem_cmp_z;
  wire [7:0] fsm_output;
  wire nor_tmp_6;
  wire and_dcpl_6;
  wire and_dcpl_7;
  wire and_dcpl_8;
  wire and_dcpl_10;
  wire and_dcpl_11;
  wire and_dcpl_13;
  wire and_dcpl_14;
  wire or_tmp_36;
  wire mux_tmp_35;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire and_dcpl_19;
  wire or_tmp_39;
  wire mux_tmp_38;
  wire or_tmp_42;
  wire mux_tmp_40;
  wire or_tmp_43;
  wire mux_tmp_44;
  wire nor_tmp_11;
  wire or_tmp_48;
  wire mux_tmp_54;
  wire and_dcpl_21;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_27;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_37;
  wire and_dcpl_50;
  wire and_dcpl_53;
  wire and_dcpl_54;
  wire mux_tmp_61;
  wire or_tmp_59;
  wire mux_tmp_64;
  wire and_tmp_4;
  wire and_dcpl_56;
  wire and_dcpl_60;
  wire and_dcpl_63;
  wire and_dcpl_65;
  wire and_dcpl_67;
  wire or_dcpl_9;
  wire or_dcpl_11;
  wire or_tmp_78;
  wire not_tmp_68;
  wire and_dcpl_81;
  wire and_tmp_6;
  wire and_dcpl_107;
  wire or_tmp_103;
  wire mux_tmp_108;
  reg COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm;
  reg [9:0] VEC_LOOP_j_10_0_sva_9_0;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_1_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_sva;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_sva;
  reg COMP_LOOP_2_tmp_mul_idiv_sva_0;
  reg [10:0] STAGE_LOOP_lshift_psp_sva;
  reg [8:0] COMP_LOOP_k_10_1_sva_8_0;
  reg [8:0] reg_COMP_LOOP_k_10_1_ftd_1;
  reg reg_twiddle_rsc_triosy_0_0_obj_ld_cse;
  wire or_82_cse;
  wire or_5_cse;
  wire nor_35_cse;
  wire and_119_cse;
  reg [8:0] COMP_LOOP_acc_psp_sva;
  wire [9:0] nl_COMP_LOOP_acc_psp_sva;
  reg [63:0] COMP_LOOP_1_acc_8_itm;
  wire and_dcpl_121;
  wire [10:0] z_out;
  wire and_dcpl_126;
  wire and_dcpl_128;
  wire and_dcpl_133;
  wire and_dcpl_139;
  wire [63:0] z_out_1;
  wire and_dcpl_150;
  wire [3:0] z_out_2;
  wire [4:0] nl_z_out_2;
  wire [9:0] z_out_3;
  wire [10:0] nl_z_out_3;
  wire [10:0] z_out_4;
  wire and_dcpl_181;
  wire and_dcpl_188;
  wire and_dcpl_193;
  wire and_dcpl_194;
  wire and_dcpl_197;
  wire [63:0] z_out_5;
  wire [127:0] nl_z_out_5;
  reg [63:0] p_sva;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [3:0] COMP_LOOP_1_tmp_acc_cse_sva;
  reg [63:0] tmp_2_lpi_4_dfm;
  reg [63:0] COMP_LOOP_1_acc_6_mut;
  reg [63:0] COMP_LOOP_tmp_asn_itm;
  reg [63:0] COMP_LOOP_tmp_mux_itm;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire VEC_LOOP_j_10_0_sva_9_0_mx0c0;
  wire COMP_LOOP_1_acc_8_itm_mx0c0;
  wire COMP_LOOP_1_acc_8_itm_mx0c1;
  wire COMP_LOOP_1_acc_8_itm_mx0c2;
  wire COMP_LOOP_1_acc_8_itm_mx0c3;
  wire COMP_LOOP_1_acc_6_mut_mx0c1;
  wire tmp_2_lpi_4_dfm_mx0c1;
  wire nor_64_cse;
  wire or_141_cse;
  wire [9:0] COMP_LOOP_1_acc_10_itm_10_1_1;

  wire[0:0] nor_36_nl;
  wire[0:0] mux_43_nl;
  wire[0:0] COMP_LOOP_or_7_nl;
  wire[0:0] mux_57_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] mux_55_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] mux_53_nl;
  wire[0:0] mux_52_nl;
  wire[0:0] or_50_nl;
  wire[0:0] mux_50_nl;
  wire[0:0] or_49_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] mux_48_nl;
  wire[0:0] mux_46_nl;
  wire[0:0] nor_46_nl;
  wire[0:0] mux_64_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] mux_62_nl;
  wire[0:0] mux_60_nl;
  wire[0:0] mux_59_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] or_52_nl;
  wire[0:0] VEC_LOOP_j_not_1_nl;
  wire[0:0] nor_28_nl;
  wire[0:0] mux_84_nl;
  wire[0:0] or_nl;
  wire[0:0] mux_35_nl;
  wire[0:0] or_132_nl;
  wire[0:0] or_133_nl;
  wire[0:0] mux_122_nl;
  wire[0:0] mux_121_nl;
  wire[0:0] and_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] nor_nl;
  wire[0:0] mux_94_nl;
  wire[10:0] COMP_LOOP_2_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_2_acc_10_nl;
  wire[0:0] mux_10_nl;
  wire[0:0] or_9_nl;
  wire[0:0] or_93_nl;
  wire[10:0] COMP_LOOP_1_acc_nl;
  wire[11:0] nl_COMP_LOOP_1_acc_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] COMP_LOOP_or_8_nl;
  wire[0:0] and_110_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] nor_25_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] mux_117_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] or_120_nl;
  wire[10:0] COMP_LOOP_1_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_1_acc_10_nl;
  wire[0:0] or_46_nl;
  wire[0:0] or_45_nl;
  wire[0:0] or_51_nl;
  wire[0:0] nand_nl;
  wire[0:0] nand_10_nl;
  wire[0:0] or_124_nl;
  wire[0:0] or_123_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] nor_26_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] and_118_nl;
  wire[0:0] mux_102_nl;
  wire[0:0] mux_104_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] nand_11_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] and_71_nl;
  wire[0:0] and_73_nl;
  wire[0:0] and_74_nl;
  wire[0:0] and_62_nl;
  wire[0:0] and_64_nl;
  wire[0:0] and_69_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] or_137_nl;
  wire[0:0] mux_76_nl;
  wire[0:0] or_73_nl;
  wire[0:0] or_72_nl;
  wire[0:0] nand_12_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] nor_30_nl;
  wire[0:0] nor_31_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] mux_80_nl;
  wire[0:0] or_77_nl;
  wire[0:0] mux_79_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] or_76_nl;
  wire[0:0] mux_67_nl;
  wire[0:0] or_138_nl;
  wire[0:0] mux_66_nl;
  wire[0:0] or_61_nl;
  wire[0:0] or_60_nl;
  wire[0:0] nand_13_nl;
  wire[0:0] mux_65_nl;
  wire[0:0] and_130_nl;
  wire[0:0] nor_34_nl;
  wire[0:0] mux_74_nl;
  wire[0:0] mux_73_nl;
  wire[0:0] nand_7_nl;
  wire[0:0] mux_72_nl;
  wire[0:0] mux_70_nl;
  wire[0:0] nand_8_nl;
  wire[0:0] mux_69_nl;
  wire[0:0] mux_nl;
  wire[0:0] nand_15_nl;
  wire[11:0] acc_nl;
  wire[12:0] nl_acc_nl;
  wire[10:0] COMP_LOOP_mux_11_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nand_1_nl;
  wire[9:0] COMP_LOOP_mux_12_nl;
  wire[64:0] acc_1_nl;
  wire[65:0] nl_acc_1_nl;
  wire[63:0] COMP_LOOP_COMP_LOOP_mux1h_1_nl;
  wire[0:0] COMP_LOOP_and_3_nl;
  wire[0:0] COMP_LOOP_and_4_nl;
  wire[0:0] COMP_LOOP_or_10_nl;
  wire[63:0] COMP_LOOP_mux1h_18_nl;
  wire[63:0] COMP_LOOP_mux_13_nl;
  wire[3:0] STAGE_LOOP_mux_8_nl;
  wire[8:0] COMP_LOOP_mux_14_nl;
  wire[0:0] and_221_nl;
  wire[54:0] COMP_LOOP_and_5_nl;
  wire[54:0] COMP_LOOP_mux1h_19_nl;
  wire[0:0] not_337_nl;
  wire[8:0] COMP_LOOP_mux1h_20_nl;
  wire[0:0] COMP_LOOP_or_11_nl;
  wire[63:0] COMP_LOOP_mux1h_21_nl;
  wire[0:0] COMP_LOOP_or_12_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[3:0] STAGE_LOOP_mux1h_1_nl;
  wire[0:0] and_192_nl;
  wire [4:0] nl_COMP_LOOP_1_tmp_lshift_rg_s;
  assign and_192_nl = and_dcpl_10 & nor_64_cse & and_dcpl_128 & (fsm_output[1:0]==2'b11);
  assign STAGE_LOOP_mux1h_1_nl = MUX1HOT_v_4_3_2(STAGE_LOOP_i_3_0_sva, COMP_LOOP_1_tmp_acc_cse_sva,
      z_out_2, {(~ (fsm_output[1])) , and_192_nl , (~ (fsm_output[0]))});
  assign nl_COMP_LOOP_1_tmp_lshift_rg_s = {1'b0, STAGE_LOOP_mux1h_1_nl};
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_79_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_79_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_157_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_157_tr0 = ~ COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = z_out[10];
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = ~ (z_out_3[4]);
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_1_obj (
      .ld(reg_twiddle_rsc_triosy_0_0_obj_ld_cse),
      .lz(vec_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_0_obj (
      .ld(reg_twiddle_rsc_triosy_0_0_obj_ld_cse),
      .lz(vec_rsc_triosy_0_0_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_0_0_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_0_0_obj_ld_cse),
      .lz(r_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_1_obj (
      .ld(reg_twiddle_rsc_triosy_0_0_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_0_obj (
      .ld(reg_twiddle_rsc_triosy_0_0_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_0_lz)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) COMP_LOOP_1_modulo_dev_result_rem_cmp (
      .a(COMP_LOOP_1_modulo_dev_result_rem_cmp_a),
      .b(COMP_LOOP_1_modulo_dev_result_rem_cmp_b),
      .z(COMP_LOOP_1_modulo_dev_result_rem_cmp_z)
    );
  mgc_shift_bl_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd5),
  .width_z(32'sd11)) COMP_LOOP_1_tmp_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_1_tmp_lshift_rg_s[4:0]),
      .z(z_out_4)
    );
  inPlaceNTT_DIF_core_core_fsm inPlaceNTT_DIF_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .COMP_LOOP_C_79_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_79_tr0[0:0]),
      .COMP_LOOP_C_157_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_157_tr0[0:0]),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_82_cse = (fsm_output[1:0]!=2'b00);
  assign or_141_cse = (fsm_output[6:5]!=2'b00);
  assign or_5_cse = (fsm_output[4]) | (fsm_output[6]);
  assign and_119_cse = (fsm_output[1:0]==2'b11);
  assign nl_COMP_LOOP_1_acc_10_nl = STAGE_LOOP_lshift_psp_sva + conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0)
      + conv_u2u_10_11({COMP_LOOP_k_10_1_sva_8_0 , 1'b0});
  assign COMP_LOOP_1_acc_10_nl = nl_COMP_LOOP_1_acc_10_nl[10:0];
  assign COMP_LOOP_1_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_1_acc_10_nl);
  assign nor_tmp_6 = (fsm_output[4]) & (fsm_output[6]);
  assign and_dcpl_6 = ~((fsm_output[0]) | (fsm_output[7]));
  assign and_dcpl_7 = ~((fsm_output[5]) | (fsm_output[1]));
  assign and_dcpl_8 = and_dcpl_7 & and_dcpl_6;
  assign and_dcpl_10 = ~((fsm_output[4:3]!=2'b00));
  assign and_dcpl_11 = and_dcpl_10 & (~ (fsm_output[2])) & (~ (fsm_output[6]));
  assign and_dcpl_13 = (fsm_output[0]) & (fsm_output[7]);
  assign and_dcpl_14 = (fsm_output[5]) & (~ (fsm_output[1]));
  assign or_tmp_36 = (fsm_output[6]) | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign mux_tmp_35 = MUX_s_1_2_2((fsm_output[6]), or_tmp_36, fsm_output[5]);
  assign and_dcpl_17 = (fsm_output[2]) & (~ (fsm_output[6]));
  assign and_dcpl_18 = and_dcpl_10 & and_dcpl_17;
  assign and_dcpl_19 = and_dcpl_18 & and_dcpl_8;
  assign nor_35_cse = ~((fsm_output[6:5]!=2'b00));
  assign or_tmp_39 = nor_35_cse | (fsm_output[7]);
  assign or_46_nl = (fsm_output[5]) | (fsm_output[7]);
  assign or_45_nl = (~ (fsm_output[5])) | (fsm_output[7]);
  assign mux_tmp_38 = MUX_s_1_2_2(or_46_nl, or_45_nl, fsm_output[6]);
  assign or_tmp_42 = (~((fsm_output[6:5]!=2'b01))) | (fsm_output[7]);
  assign mux_tmp_40 = MUX_s_1_2_2(or_tmp_42, or_tmp_39, fsm_output[4]);
  assign or_tmp_43 = (~((fsm_output[6:4]!=3'b010))) | (fsm_output[7]);
  assign or_51_nl = (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_tmp_44 = MUX_s_1_2_2(or_51_nl, (fsm_output[7]), fsm_output[6]);
  assign nor_tmp_11 = (fsm_output[4:3]==2'b11);
  assign or_tmp_48 = (fsm_output[7]) | nor_tmp_11;
  assign nand_nl = ~((fsm_output[7]) & ((fsm_output[4:3]!=2'b00)));
  assign mux_tmp_54 = MUX_s_1_2_2(nand_nl, or_tmp_48, fsm_output[5]);
  assign and_dcpl_21 = (fsm_output[0]) & (~ (fsm_output[7]));
  assign and_dcpl_22 = (~ (fsm_output[5])) & (fsm_output[1]);
  assign and_dcpl_23 = and_dcpl_22 & and_dcpl_21;
  assign and_dcpl_25 = (fsm_output[4:3]==2'b10);
  assign and_dcpl_26 = and_dcpl_25 & (~ (fsm_output[2])) & (fsm_output[6]);
  assign and_dcpl_27 = and_dcpl_26 & and_dcpl_23;
  assign and_dcpl_31 = (~ (fsm_output[4])) & (fsm_output[3]) & (fsm_output[2]) &
      (fsm_output[6]);
  assign and_dcpl_32 = and_dcpl_31 & and_dcpl_14 & and_dcpl_6;
  assign and_dcpl_37 = and_dcpl_10 & (~ (fsm_output[2]));
  assign and_dcpl_50 = and_dcpl_11 & and_dcpl_23;
  assign and_dcpl_53 = ~((fsm_output[3:2]!=2'b00));
  assign and_dcpl_54 = and_dcpl_53 & (~ (fsm_output[5])) & (~ (fsm_output[7]));
  assign nand_10_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm & nor_tmp_6);
  assign mux_tmp_61 = MUX_s_1_2_2(nand_10_nl, or_5_cse, fsm_output[1]);
  assign or_tmp_59 = (~ (fsm_output[1])) | (fsm_output[6]) | (fsm_output[4]);
  assign mux_tmp_64 = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[6]);
  assign and_tmp_4 = (fsm_output[1]) & mux_tmp_64;
  assign and_dcpl_56 = and_dcpl_26 & and_dcpl_8;
  assign and_dcpl_60 = (~ (fsm_output[0])) & (fsm_output[7]);
  assign and_dcpl_63 = (fsm_output[4:3]==2'b11) & and_dcpl_17;
  assign and_dcpl_65 = and_dcpl_22 & and_dcpl_6;
  assign and_dcpl_67 = and_dcpl_7 & and_dcpl_21;
  assign or_dcpl_9 = (fsm_output[5]) | (~ (fsm_output[1]));
  assign or_dcpl_11 = or_tmp_36 | or_dcpl_9 | (fsm_output[0]) | (fsm_output[7]);
  assign or_tmp_78 = (fsm_output[6:5]!=2'b00) | ((fsm_output[4:2]==3'b111));
  assign not_tmp_68 = ~(and_119_cse | (fsm_output[6:2]!=5'b00000));
  assign and_dcpl_81 = (~ (fsm_output[2])) & (~ (fsm_output[5])) & (fsm_output[1])
      & and_dcpl_21;
  assign and_tmp_6 = (fsm_output[6]) & (((fsm_output[3:2]==2'b11)) | (fsm_output[4]));
  assign and_dcpl_107 = (~ (fsm_output[3])) & (~ (fsm_output[5])) & and_dcpl_6;
  assign or_tmp_103 = (fsm_output[1]) | (fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[4]);
  assign or_124_nl = (fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[4]);
  assign or_123_nl = (~ (fsm_output[6])) | (fsm_output[2]) | (~ (fsm_output[4]));
  assign mux_tmp_108 = MUX_s_1_2_2(or_124_nl, or_123_nl, fsm_output[1]);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_11 & and_dcpl_14 & and_dcpl_13;
  assign VEC_LOOP_j_10_0_sva_9_0_mx0c0 = and_dcpl_11 & and_dcpl_67;
  assign mux_100_nl = MUX_s_1_2_2(mux_tmp_64, (~ or_5_cse), COMP_LOOP_acc_10_cse_10_1_sva[0]);
  assign nor_26_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[0]) | (~ nor_tmp_6));
  assign mux_101_nl = MUX_s_1_2_2(mux_100_nl, nor_26_nl, COMP_LOOP_acc_10_cse_10_1_1_sva[0]);
  assign COMP_LOOP_1_acc_8_itm_mx0c0 = mux_101_nl & (~ (fsm_output[3])) & and_dcpl_81;
  assign and_118_nl = (COMP_LOOP_acc_10_cse_10_1_sva[0]) & (fsm_output[6]) & (fsm_output[4]);
  assign mux_102_nl = MUX_s_1_2_2((~ or_5_cse), mux_tmp_64, COMP_LOOP_acc_10_cse_10_1_sva[0]);
  assign mux_103_nl = MUX_s_1_2_2(and_118_nl, mux_102_nl, COMP_LOOP_acc_10_cse_10_1_1_sva[0]);
  assign COMP_LOOP_1_acc_8_itm_mx0c1 = mux_103_nl & (~ (fsm_output[3])) & and_dcpl_81;
  assign mux_104_nl = MUX_s_1_2_2((~ nor_tmp_6), or_5_cse, fsm_output[0]);
  assign COMP_LOOP_1_acc_8_itm_mx0c2 = ~(mux_104_nl | (fsm_output[3]) | (~ (fsm_output[2]))
      | (fsm_output[5]) | (fsm_output[1]) | (fsm_output[7]));
  assign COMP_LOOP_1_acc_8_itm_mx0c3 = and_dcpl_25 & and_dcpl_17 & (fsm_output[5])
      & (fsm_output[1]) & and_dcpl_6;
  assign COMP_LOOP_1_acc_6_mut_mx0c1 = and_dcpl_63 & and_dcpl_67;
  assign nand_11_nl = ~((COMP_LOOP_acc_1_cse_sva[0]) & (fsm_output[1]) & (fsm_output[6])
      & (~ (fsm_output[2])) & (fsm_output[4]));
  assign mux_118_nl = MUX_s_1_2_2(or_tmp_103, mux_tmp_108, COMP_LOOP_acc_1_cse_sva[0]);
  assign mux_119_nl = MUX_s_1_2_2(nand_11_nl, mux_118_nl, VEC_LOOP_j_10_0_sva_9_0[0]);
  assign tmp_2_lpi_4_dfm_mx0c1 = (~ mux_119_nl) & and_dcpl_107;
  assign and_71_nl = and_dcpl_11 & and_dcpl_65;
  assign and_73_nl = and_dcpl_26 & and_dcpl_67;
  assign and_74_nl = and_dcpl_26 & and_dcpl_65;
  assign vec_rsc_0_0_i_radr_d_pff = MUX1HOT_v_9_4_2((COMP_LOOP_1_acc_10_itm_10_1_1[9:1]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_1_cse_sva[9:1]), (COMP_LOOP_acc_10_cse_10_1_sva[9:1]),
      {and_71_nl , and_dcpl_50 , and_73_nl , and_74_nl});
  assign and_62_nl = and_dcpl_31 & and_dcpl_23;
  assign and_64_nl = and_dcpl_18 & and_dcpl_7 & and_dcpl_13;
  assign and_69_nl = and_dcpl_63 & and_dcpl_22 & and_dcpl_60;
  assign vec_rsc_0_0_i_wadr_d_pff = MUX1HOT_v_9_4_2((COMP_LOOP_acc_10_cse_10_1_1_sva[9:1]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_10_1_sva[9:1]), (COMP_LOOP_acc_1_cse_sva[9:1]),
      {and_62_nl , and_dcpl_56 , and_64_nl , and_69_nl});
  assign vec_rsc_0_0_i_d_d_pff = MUX_v_64_2_2(COMP_LOOP_1_modulo_dev_result_rem_cmp_z,
      COMP_LOOP_1_acc_8_itm, and_dcpl_56);
  assign or_73_nl = (fsm_output[0]) | (~ (fsm_output[4])) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | (fsm_output[7:6]!=2'b01);
  assign or_72_nl = (~ (fsm_output[0])) | (fsm_output[4]) | (COMP_LOOP_acc_10_cse_10_1_sva[0])
      | (fsm_output[7:6]!=2'b10);
  assign mux_76_nl = MUX_s_1_2_2(or_73_nl, or_72_nl, fsm_output[2]);
  assign or_137_nl = (fsm_output[3]) | mux_76_nl;
  assign nor_30_nl = ~((~ (fsm_output[4])) | (COMP_LOOP_acc_1_cse_sva[0]) | (fsm_output[7:6]!=2'b10));
  assign nor_31_nl = ~((fsm_output[4]) | (COMP_LOOP_acc_10_cse_10_1_1_sva[0]) | (fsm_output[7:6]!=2'b01));
  assign mux_75_nl = MUX_s_1_2_2(nor_30_nl, nor_31_nl, fsm_output[0]);
  assign nand_12_nl = ~((fsm_output[3:2]==2'b11) & mux_75_nl);
  assign mux_77_nl = MUX_s_1_2_2(or_137_nl, nand_12_nl, fsm_output[1]);
  assign vec_rsc_0_0_i_we_d_pff = ~(mux_77_nl | (fsm_output[5]));
  assign mux_80_nl = MUX_s_1_2_2((~ and_tmp_4), or_tmp_59, COMP_LOOP_acc_10_cse_10_1_sva[0]);
  assign or_77_nl = (COMP_LOOP_acc_10_cse_10_1_sva[0]) | (~((fsm_output[1]) & (fsm_output[6])
      & (fsm_output[4])));
  assign mux_81_nl = MUX_s_1_2_2(mux_80_nl, or_77_nl, COMP_LOOP_1_acc_10_itm_10_1_1[0]);
  assign mux_78_nl = MUX_s_1_2_2(mux_tmp_61, or_tmp_59, COMP_LOOP_acc_1_cse_sva[0]);
  assign or_76_nl = (COMP_LOOP_acc_1_cse_sva[0]) | (fsm_output[1]) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm)
      | (~ nor_tmp_6);
  assign mux_79_nl = MUX_s_1_2_2(mux_78_nl, or_76_nl, VEC_LOOP_j_10_0_sva_9_0[0]);
  assign mux_82_nl = MUX_s_1_2_2(mux_81_nl, mux_79_nl, fsm_output[0]);
  assign vec_rsc_0_0_i_re_d_pff = (~ mux_82_nl) & and_dcpl_54;
  assign or_61_nl = (fsm_output[0]) | (~ (fsm_output[4])) | (~ (VEC_LOOP_j_10_0_sva_9_0[0]))
      | (fsm_output[7:6]!=2'b01);
  assign or_60_nl = (~ (fsm_output[0])) | (fsm_output[4]) | (~ (COMP_LOOP_acc_10_cse_10_1_sva[0]))
      | (fsm_output[7:6]!=2'b10);
  assign mux_66_nl = MUX_s_1_2_2(or_61_nl, or_60_nl, fsm_output[2]);
  assign or_138_nl = (fsm_output[3]) | mux_66_nl;
  assign and_130_nl = (fsm_output[4]) & (COMP_LOOP_acc_1_cse_sva[0]) & (fsm_output[7:6]==2'b10);
  assign nor_34_nl = ~((fsm_output[4]) | (~ (COMP_LOOP_acc_10_cse_10_1_1_sva[0]))
      | (fsm_output[7:6]!=2'b01));
  assign mux_65_nl = MUX_s_1_2_2(and_130_nl, nor_34_nl, fsm_output[0]);
  assign nand_13_nl = ~((fsm_output[3:2]==2'b11) & mux_65_nl);
  assign mux_67_nl = MUX_s_1_2_2(or_138_nl, nand_13_nl, fsm_output[1]);
  assign vec_rsc_0_1_i_we_d_pff = ~(mux_67_nl | (fsm_output[5]));
  assign nand_7_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[0]) & (fsm_output[1]) & (fsm_output[6])
      & (fsm_output[4]));
  assign mux_72_nl = MUX_s_1_2_2(or_tmp_59, (~ and_tmp_4), COMP_LOOP_acc_10_cse_10_1_sva[0]);
  assign mux_73_nl = MUX_s_1_2_2(nand_7_nl, mux_72_nl, COMP_LOOP_1_acc_10_itm_10_1_1[0]);
  assign nand_8_nl = ~((COMP_LOOP_acc_1_cse_sva[0]) & (~ (fsm_output[1])) & COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm
      & nor_tmp_6);
  assign mux_69_nl = MUX_s_1_2_2(or_tmp_59, mux_tmp_61, COMP_LOOP_acc_1_cse_sva[0]);
  assign mux_70_nl = MUX_s_1_2_2(nand_8_nl, mux_69_nl, VEC_LOOP_j_10_0_sva_9_0[0]);
  assign mux_74_nl = MUX_s_1_2_2(mux_73_nl, mux_70_nl, fsm_output[0]);
  assign vec_rsc_0_1_i_re_d_pff = (~ mux_74_nl) & and_dcpl_54;
  assign twiddle_rsc_0_0_i_radr_d = MUX_v_9_2_2((z_out_5[8:0]), (z_out_5[9:1]), and_dcpl_50);
  assign twiddle_rsc_0_0_i_re_d_pff = and_dcpl_37 & (fsm_output[7:6]==2'b00) & and_dcpl_22
      & (~((fsm_output[0]) & (z_out_5[0])));
  assign twiddle_rsc_0_1_i_radr_d = z_out_5[9:1];
  assign twiddle_rsc_0_1_i_re_d_pff = and_dcpl_37 & nor_35_cse & (fsm_output[1])
      & (fsm_output[0]) & (~ (fsm_output[7])) & (z_out_5[0]);
  assign and_dcpl_121 = and_dcpl_10 & (~ (fsm_output[6])) & (fsm_output[7]) & (fsm_output[5])
      & (~ (fsm_output[2])) & (~ (fsm_output[0])) & (~ (fsm_output[1]));
  assign nand_15_nl = ~((fsm_output[6]) & (fsm_output[4]));
  assign mux_nl = MUX_s_1_2_2(nand_15_nl, or_5_cse, fsm_output[0]);
  assign and_dcpl_126 = ~(mux_nl | (fsm_output[3]) | (~ (fsm_output[2])) | (fsm_output[5])
      | (fsm_output[7]) | (fsm_output[1]));
  assign and_dcpl_128 = ~((fsm_output[5]) | (fsm_output[7]));
  assign and_dcpl_133 = ~((fsm_output[3]) | (fsm_output[4]) | (~ (fsm_output[2]))
      | (fsm_output[6]) | (~ and_dcpl_128) | (fsm_output[1:0]!=2'b00));
  assign and_dcpl_139 = (~ (fsm_output[3])) & (fsm_output[4]) & (~ (fsm_output[2]))
      & (fsm_output[6]) & and_dcpl_128 & (fsm_output[1:0]==2'b11);
  assign nor_64_cse = ~((fsm_output[2]) | (fsm_output[6]));
  assign and_dcpl_150 = and_dcpl_10 & nor_64_cse & and_dcpl_128 & (fsm_output[1:0]==2'b10);
  assign and_dcpl_181 = (fsm_output[3]) & (fsm_output[4]) & (fsm_output[2]) & (~
      (fsm_output[6])) & and_dcpl_128 & (fsm_output[1:0]==2'b01);
  assign and_dcpl_188 = (fsm_output==8'b01101100);
  assign and_dcpl_193 = ~((fsm_output[3]) | (fsm_output[4]) | (fsm_output[2]) | (fsm_output[6]));
  assign and_dcpl_194 = and_dcpl_193 & and_dcpl_128 & (fsm_output[1:0]==2'b11);
  assign and_dcpl_197 = and_dcpl_193 & and_dcpl_128 & (fsm_output[1:0]==2'b10);
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_i_3_0_sva <= 4'b0000;
    end
    else if ( (and_dcpl_11 & and_dcpl_8) | STAGE_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1010, z_out_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      p_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( MUX_s_1_2_2(nor_36_nl, mux_43_nl, fsm_output[7]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_modulo_dev_result_rem_cmp_b <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      COMP_LOOP_1_modulo_dev_result_rem_cmp_a <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= 1'b0;
      COMP_LOOP_1_tmp_acc_cse_sva <= 4'b0000;
      COMP_LOOP_2_tmp_mul_idiv_sva_0 <= 1'b0;
    end
    else begin
      COMP_LOOP_1_modulo_dev_result_rem_cmp_b <= p_sva;
      COMP_LOOP_1_modulo_dev_result_rem_cmp_a <= MUX1HOT_v_64_4_2(z_out_1, COMP_LOOP_1_acc_6_mut,
          COMP_LOOP_1_acc_8_itm, z_out_5, {COMP_LOOP_or_7_nl , (~ mux_57_nl) , nor_46_nl
          , and_dcpl_32});
      reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= and_dcpl_37 & (~ (fsm_output[6]))
          & (fsm_output[5]) & (~ (fsm_output[1])) & (fsm_output[0]) & (fsm_output[7])
          & (~ (z_out_3[4]));
      COMP_LOOP_1_tmp_acc_cse_sva <= z_out_2;
      COMP_LOOP_2_tmp_mul_idiv_sva_0 <= z_out_5[0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_0_sva_9_0 <= 10'b0000000000;
    end
    else if ( VEC_LOOP_j_10_0_sva_9_0_mx0c0 | (and_dcpl_11 & and_dcpl_14 & and_dcpl_60)
        ) begin
      VEC_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (z_out[9:0]), VEC_LOOP_j_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_lshift_psp_sva <= 11'b00000000000;
    end
    else if ( MUX_s_1_2_2(nor_28_nl, mux_84_nl, fsm_output[7]) ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_k_10_1_sva_8_0 <= 9'b000000000;
    end
    else if ( MUX_s_1_2_2((~ mux_122_nl), or_141_cse, fsm_output[7]) ) begin
      COMP_LOOP_k_10_1_sva_8_0 <= MUX_v_9_2_2(9'b000000000, reg_COMP_LOOP_k_10_1_ftd_1,
          or_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva <= 10'b0000000000;
    end
    else if ( ~ or_dcpl_11 ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva <= COMP_LOOP_1_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_psp_sva <= 9'b000000000;
    end
    else if ( ~ or_dcpl_11 ) begin
      COMP_LOOP_acc_psp_sva <= nl_COMP_LOOP_acc_psp_sva[8:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm <= 1'b0;
    end
    else if ( ~ or_dcpl_11 ) begin
      COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm <= z_out[10];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_68, mux_94_nl, fsm_output[7]) ) begin
      COMP_LOOP_acc_1_cse_sva <= nl_COMP_LOOP_acc_1_cse_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_68, mux_10_nl, fsm_output[7]) ) begin
      COMP_LOOP_acc_10_cse_10_1_sva <= readslicef_11_10_1(COMP_LOOP_2_acc_10_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm <= 1'b0;
    end
    else if ( MUX_s_1_2_2(not_tmp_68, mux_98_nl, fsm_output[7]) ) begin
      COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_1_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_asn_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~(or_tmp_36 | or_dcpl_9 | (~ (fsm_output[0])) | (fsm_output[7])) )
        begin
      COMP_LOOP_tmp_asn_itm <= twiddle_rsc_0_0_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_acc_8_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( COMP_LOOP_1_acc_8_itm_mx0c0 | COMP_LOOP_1_acc_8_itm_mx0c1 | COMP_LOOP_1_acc_8_itm_mx0c2
        | COMP_LOOP_1_acc_8_itm_mx0c3 ) begin
      COMP_LOOP_1_acc_8_itm <= MUX1HOT_v_64_4_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
          z_out_1, COMP_LOOP_1_modulo_dev_result_rem_cmp_z, {COMP_LOOP_1_acc_8_itm_mx0c0
          , COMP_LOOP_1_acc_8_itm_mx0c1 , COMP_LOOP_1_acc_8_itm_mx0c2 , COMP_LOOP_1_acc_8_itm_mx0c3});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_acc_6_mut <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( and_dcpl_19 | COMP_LOOP_1_acc_6_mut_mx0c1 | and_dcpl_27 | and_dcpl_32
        ) begin
      COMP_LOOP_1_acc_6_mut <= MUX_v_64_2_2(z_out_1, z_out_5, COMP_LOOP_or_8_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_mux_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( mux_114_nl | (fsm_output[7]) ) begin
      COMP_LOOP_tmp_mux_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
          and_110_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      tmp_2_lpi_4_dfm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ((~ mux_117_nl) & and_dcpl_107) | tmp_2_lpi_4_dfm_mx0c1 ) begin
      tmp_2_lpi_4_dfm <= MUX_v_64_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, tmp_2_lpi_4_dfm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_COMP_LOOP_k_10_1_ftd_1 <= 9'b000000000;
    end
    else if ( ~ or_dcpl_11 ) begin
      reg_COMP_LOOP_k_10_1_ftd_1 <= z_out_3[8:0];
    end
  end
  assign nor_36_nl = ~((fsm_output[6:0]!=7'b0000000));
  assign mux_43_nl = MUX_s_1_2_2(mux_tmp_35, or_141_cse, fsm_output[1]);
  assign COMP_LOOP_or_7_nl = and_dcpl_19 | and_dcpl_27;
  assign mux_55_nl = MUX_s_1_2_2(mux_tmp_44, mux_tmp_38, fsm_output[4]);
  assign mux_56_nl = MUX_s_1_2_2(mux_55_nl, or_tmp_43, fsm_output[3]);
  assign or_50_nl = (fsm_output[0]) | (fsm_output[4]);
  assign mux_52_nl = MUX_s_1_2_2(mux_tmp_44, or_tmp_42, or_50_nl);
  assign or_49_nl = (~((fsm_output[5:4]!=2'b10))) | (fsm_output[7]);
  assign mux_50_nl = MUX_s_1_2_2(or_49_nl, mux_tmp_40, fsm_output[0]);
  assign mux_53_nl = MUX_s_1_2_2(mux_52_nl, mux_50_nl, fsm_output[3]);
  assign mux_46_nl = MUX_s_1_2_2(mux_tmp_38, or_tmp_39, fsm_output[4]);
  assign mux_48_nl = MUX_s_1_2_2(mux_tmp_40, mux_46_nl, fsm_output[0]);
  assign mux_49_nl = MUX_s_1_2_2(or_tmp_43, mux_48_nl, fsm_output[3]);
  assign mux_54_nl = MUX_s_1_2_2(mux_53_nl, mux_49_nl, fsm_output[1]);
  assign mux_57_nl = MUX_s_1_2_2(mux_56_nl, mux_54_nl, fsm_output[2]);
  assign mux_60_nl = MUX_s_1_2_2((~ or_tmp_48), or_tmp_48, fsm_output[5]);
  assign mux_62_nl = MUX_s_1_2_2(mux_tmp_54, mux_60_nl, fsm_output[0]);
  assign mux_58_nl = MUX_s_1_2_2((~ nor_tmp_11), nor_tmp_11, fsm_output[7]);
  assign or_52_nl = (fsm_output[7]) | (fsm_output[4]);
  assign mux_59_nl = MUX_s_1_2_2(mux_58_nl, or_52_nl, fsm_output[5]);
  assign mux_63_nl = MUX_s_1_2_2(mux_62_nl, mux_59_nl, fsm_output[1]);
  assign mux_64_nl = MUX_s_1_2_2(mux_tmp_54, mux_63_nl, fsm_output[2]);
  assign nor_46_nl = ~(mux_64_nl | (fsm_output[6]));
  assign VEC_LOOP_j_not_1_nl = ~ VEC_LOOP_j_10_0_sva_9_0_mx0c0;
  assign nor_28_nl = ~((fsm_output[6:1]!=6'b000000));
  assign mux_84_nl = MUX_s_1_2_2(mux_tmp_35, or_141_cse, or_82_cse);
  assign or_132_nl = (~ (fsm_output[0])) | (fsm_output[5]);
  assign or_133_nl = (fsm_output[0]) | (~ (fsm_output[5]));
  assign mux_35_nl = MUX_s_1_2_2(or_132_nl, or_133_nl, fsm_output[7]);
  assign or_nl = mux_35_nl | (fsm_output[4]) | (~ and_dcpl_53) | (fsm_output[6])
      | (fsm_output[1]);
  assign and_nl = (fsm_output[6]) & (fsm_output[4]) & ((fsm_output[3:2]!=2'b00));
  assign nor_nl = ~((fsm_output[0]) | (fsm_output[4]) | (fsm_output[3]) | (fsm_output[2]));
  assign mux_120_nl = MUX_s_1_2_2(nor_nl, (fsm_output[4]), fsm_output[6]);
  assign mux_121_nl = MUX_s_1_2_2(and_nl, mux_120_nl, fsm_output[1]);
  assign mux_122_nl = MUX_s_1_2_2(mux_121_nl, (fsm_output[6]), fsm_output[5]);
  assign nl_COMP_LOOP_acc_psp_sva  = (VEC_LOOP_j_10_0_sva_9_0[9:1]) + COMP_LOOP_k_10_1_sva_8_0;
  assign nl_COMP_LOOP_acc_1_cse_sva  = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_1_sva_8_0
      , 1'b1});
  assign mux_94_nl = MUX_s_1_2_2(or_141_cse, or_tmp_78, fsm_output[1]);
  assign nl_COMP_LOOP_2_acc_10_nl = STAGE_LOOP_lshift_psp_sva + conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0)
      + conv_u2u_10_11({COMP_LOOP_k_10_1_sva_8_0 , 1'b1});
  assign COMP_LOOP_2_acc_10_nl = nl_COMP_LOOP_2_acc_10_nl[10:0];
  assign or_9_nl = (fsm_output[6:3]!=4'b0000);
  assign or_93_nl = (fsm_output[6:2]!=5'b00000);
  assign mux_10_nl = MUX_s_1_2_2(or_9_nl, or_93_nl, or_82_cse);
  assign nl_COMP_LOOP_1_acc_nl = ({z_out_3 , 1'b0}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + 11'b00000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[10:0];
  assign mux_98_nl = MUX_s_1_2_2(or_141_cse, or_tmp_78, and_119_cse);
  assign COMP_LOOP_or_8_nl = COMP_LOOP_1_acc_6_mut_mx0c1 | and_dcpl_32;
  assign and_110_nl = and_dcpl_10 & (fsm_output[2]) & nor_35_cse & (~((fsm_output[1:0]!=2'b00)))
      & (~ (fsm_output[7])) & COMP_LOOP_2_tmp_mul_idiv_sva_0;
  assign nor_25_nl = ~((fsm_output[6]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_113_nl = MUX_s_1_2_2(nor_25_nl, and_tmp_6, fsm_output[5]);
  assign mux_112_nl = MUX_s_1_2_2(and_dcpl_11, and_tmp_6, fsm_output[5]);
  assign mux_114_nl = MUX_s_1_2_2(mux_113_nl, mux_112_nl, or_82_cse);
  assign mux_116_nl = MUX_s_1_2_2(mux_tmp_108, or_tmp_103, COMP_LOOP_acc_1_cse_sva[0]);
  assign or_120_nl = (COMP_LOOP_acc_1_cse_sva[0]) | (~ (fsm_output[1])) | (~ (fsm_output[6]))
      | (fsm_output[2]) | (~ (fsm_output[4]));
  assign mux_117_nl = MUX_s_1_2_2(mux_116_nl, or_120_nl, VEC_LOOP_j_10_0_sva_9_0[0]);
  assign COMP_LOOP_mux_11_nl = MUX_v_11_2_2(({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))}),
      STAGE_LOOP_lshift_psp_sva, and_dcpl_121);
  assign COMP_LOOP_COMP_LOOP_nand_1_nl = ~(and_dcpl_121 & (~(and_dcpl_10 & (~((fsm_output[7:6]!=2'b00)))
      & (~((fsm_output[5]) | (fsm_output[2]))) & (~ (fsm_output[0])) & (fsm_output[1]))));
  assign COMP_LOOP_mux_12_nl = MUX_v_10_2_2(({COMP_LOOP_k_10_1_sva_8_0 , 1'b1}),
      VEC_LOOP_j_10_0_sva_9_0, and_dcpl_121);
  assign nl_acc_nl = ({COMP_LOOP_mux_11_nl , COMP_LOOP_COMP_LOOP_nand_1_nl}) + conv_u2u_11_12({COMP_LOOP_mux_12_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[11:0];
  assign z_out = readslicef_12_11_1(acc_nl);
  assign COMP_LOOP_and_3_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[0])) & and_dcpl_133;
  assign COMP_LOOP_and_4_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & and_dcpl_133;
  assign COMP_LOOP_COMP_LOOP_mux1h_1_nl = MUX1HOT_v_64_3_2(tmp_2_lpi_4_dfm, vec_rsc_0_0_i_q_d,
      vec_rsc_0_1_i_q_d, {(~ and_dcpl_133) , COMP_LOOP_and_3_nl , COMP_LOOP_and_4_nl});
  assign COMP_LOOP_or_10_nl = (~ and_dcpl_126) | and_dcpl_133 | and_dcpl_139;
  assign COMP_LOOP_mux_13_nl = MUX_v_64_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
      COMP_LOOP_acc_10_cse_10_1_sva[0]);
  assign COMP_LOOP_mux1h_18_nl = MUX1HOT_v_64_3_2(COMP_LOOP_1_acc_8_itm, (~ COMP_LOOP_1_acc_8_itm),
      (~ COMP_LOOP_mux_13_nl), {and_dcpl_126 , and_dcpl_133 , and_dcpl_139});
  assign nl_acc_1_nl = ({COMP_LOOP_COMP_LOOP_mux1h_1_nl , COMP_LOOP_or_10_nl}) +
      ({COMP_LOOP_mux1h_18_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[64:0];
  assign z_out_1 = readslicef_65_64_1(acc_1_nl);
  assign STAGE_LOOP_mux_8_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (~ STAGE_LOOP_i_3_0_sva),
      and_dcpl_150);
  assign nl_z_out_2 = STAGE_LOOP_mux_8_nl + ({1'b1 , (~ and_dcpl_150) , 2'b11});
  assign z_out_2 = nl_z_out_2[3:0];
  assign and_221_nl = and_dcpl_10 & nor_64_cse & (fsm_output[5]) & (fsm_output[7])
      & (~ (fsm_output[1])) & (fsm_output[0]);
  assign COMP_LOOP_mux_14_nl = MUX_v_9_2_2(COMP_LOOP_k_10_1_sva_8_0, ({5'b00001 ,
      (~ z_out_2)}), and_221_nl);
  assign nl_z_out_3 = conv_u2u_9_10(COMP_LOOP_mux_14_nl) + 10'b0000000001;
  assign z_out_3 = nl_z_out_3[9:0];
  assign COMP_LOOP_mux1h_19_nl = MUX1HOT_v_55_3_2((COMP_LOOP_tmp_asn_itm[63:9]),
      (COMP_LOOP_tmp_mux_itm[63:9]), ({54'b000000000000000000000000000000000000000000000000000000
      , (z_out_4[9])}), {and_dcpl_181 , and_dcpl_188 , and_dcpl_194});
  assign not_337_nl = ~ and_dcpl_197;
  assign COMP_LOOP_and_5_nl = MUX_v_55_2_2(55'b0000000000000000000000000000000000000000000000000000000,
      COMP_LOOP_mux1h_19_nl, not_337_nl);
  assign COMP_LOOP_or_11_nl = and_dcpl_194 | and_dcpl_197;
  assign COMP_LOOP_mux1h_20_nl = MUX1HOT_v_9_3_2((COMP_LOOP_tmp_asn_itm[8:0]), (COMP_LOOP_tmp_mux_itm[8:0]),
      (z_out_4[8:0]), {and_dcpl_181 , and_dcpl_188 , COMP_LOOP_or_11_nl});
  assign COMP_LOOP_or_12_nl = and_dcpl_181 | and_dcpl_188;
  assign COMP_LOOP_mux1h_21_nl = MUX1HOT_v_64_3_2(COMP_LOOP_1_modulo_dev_result_rem_cmp_z,
      ({54'b000000000000000000000000000000000000000000000000000000 , COMP_LOOP_k_10_1_sva_8_0
      , 1'b1}), ({55'b0000000000000000000000000000000000000000000000000000000 , COMP_LOOP_k_10_1_sva_8_0}),
      {COMP_LOOP_or_12_nl , and_dcpl_194 , and_dcpl_197});
  assign nl_z_out_5 = ({COMP_LOOP_and_5_nl , COMP_LOOP_mux1h_20_nl}) * COMP_LOOP_mux1h_21_nl;
  assign z_out_5 = nl_z_out_5[63:0];

  function automatic [3:0] MUX1HOT_v_4_3_2;
    input [3:0] input_2;
    input [3:0] input_1;
    input [3:0] input_0;
    input [2:0] sel;
    reg [3:0] result;
  begin
    result = input_0 & {4{sel[0]}};
    result = result | ( input_1 & {4{sel[1]}});
    result = result | ( input_2 & {4{sel[2]}});
    MUX1HOT_v_4_3_2 = result;
  end
  endfunction


  function automatic [54:0] MUX1HOT_v_55_3_2;
    input [54:0] input_2;
    input [54:0] input_1;
    input [54:0] input_0;
    input [2:0] sel;
    reg [54:0] result;
  begin
    result = input_0 & {55{sel[0]}};
    result = result | ( input_1 & {55{sel[1]}});
    result = result | ( input_2 & {55{sel[2]}});
    MUX1HOT_v_55_3_2 = result;
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


  function automatic [8:0] MUX1HOT_v_9_3_2;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [2:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    MUX1HOT_v_9_3_2 = result;
  end
  endfunction


  function automatic [8:0] MUX1HOT_v_9_4_2;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [3:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    result = result | ( input_3 & {9{sel[3]}});
    MUX1HOT_v_9_4_2 = result;
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


  function automatic [54:0] MUX_v_55_2_2;
    input [54:0] input_0;
    input [54:0] input_1;
    input [0:0] sel;
    reg [54:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_55_2_2 = result;
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


  function automatic [10:0] readslicef_12_11_1;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_12_11_1 = tmp[10:0];
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


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
  end
  endfunction


  function automatic [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction


  function automatic [11:0] conv_u2u_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2u_11_12 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF
// ------------------------------------------------------------------


module inPlaceNTT_DIF (
  clk, rst, vec_rsc_0_0_radr, vec_rsc_0_0_re, vec_rsc_0_0_q, vec_rsc_0_0_wadr, vec_rsc_0_0_d,
      vec_rsc_0_0_we, vec_rsc_triosy_0_0_lz, vec_rsc_0_1_radr, vec_rsc_0_1_re, vec_rsc_0_1_q,
      vec_rsc_0_1_wadr, vec_rsc_0_1_d, vec_rsc_0_1_we, vec_rsc_triosy_0_1_lz, p_rsc_dat,
      p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_0_0_radr, twiddle_rsc_0_0_re,
      twiddle_rsc_0_0_q, twiddle_rsc_triosy_0_0_lz, twiddle_rsc_0_1_radr, twiddle_rsc_0_1_re,
      twiddle_rsc_0_1_q, twiddle_rsc_triosy_0_1_lz
);
  input clk;
  input rst;
  output [8:0] vec_rsc_0_0_radr;
  output vec_rsc_0_0_re;
  input [63:0] vec_rsc_0_0_q;
  output [8:0] vec_rsc_0_0_wadr;
  output [63:0] vec_rsc_0_0_d;
  output vec_rsc_0_0_we;
  output vec_rsc_triosy_0_0_lz;
  output [8:0] vec_rsc_0_1_radr;
  output vec_rsc_0_1_re;
  input [63:0] vec_rsc_0_1_q;
  output [8:0] vec_rsc_0_1_wadr;
  output [63:0] vec_rsc_0_1_d;
  output vec_rsc_0_1_we;
  output vec_rsc_triosy_0_1_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [8:0] twiddle_rsc_0_0_radr;
  output twiddle_rsc_0_0_re;
  input [63:0] twiddle_rsc_0_0_q;
  output twiddle_rsc_triosy_0_0_lz;
  output [8:0] twiddle_rsc_0_1_radr;
  output twiddle_rsc_0_1_re;
  input [63:0] twiddle_rsc_0_1_q;
  output twiddle_rsc_triosy_0_1_lz;


  // Interconnect Declarations
  wire [63:0] vec_rsc_0_0_i_q_d;
  wire [63:0] vec_rsc_0_1_i_q_d;
  wire [8:0] twiddle_rsc_0_0_i_radr_d;
  wire [63:0] twiddle_rsc_0_0_i_q_d;
  wire [8:0] twiddle_rsc_0_1_i_radr_d;
  wire [63:0] twiddle_rsc_0_1_i_q_d;
  wire [8:0] vec_rsc_0_0_i_radr_d_iff;
  wire [8:0] vec_rsc_0_0_i_wadr_d_iff;
  wire [63:0] vec_rsc_0_0_i_d_d_iff;
  wire vec_rsc_0_0_i_we_d_iff;
  wire vec_rsc_0_0_i_re_d_iff;
  wire vec_rsc_0_1_i_we_d_iff;
  wire vec_rsc_0_1_i_re_d_iff;
  wire twiddle_rsc_0_0_i_re_d_iff;
  wire twiddle_rsc_0_1_i_re_d_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen
      vec_rsc_0_0_i (
      .we(vec_rsc_0_0_we),
      .d(vec_rsc_0_0_d),
      .wadr(vec_rsc_0_0_wadr),
      .q(vec_rsc_0_0_q),
      .re(vec_rsc_0_0_re),
      .radr(vec_rsc_0_0_radr),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .we_d(vec_rsc_0_0_i_we_d_iff),
      .re_d(vec_rsc_0_0_i_re_d_iff),
      .q_d(vec_rsc_0_0_i_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_re_d_iff),
      .port_1_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_0_i_we_d_iff)
    );
  inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen
      vec_rsc_0_1_i (
      .we(vec_rsc_0_1_we),
      .d(vec_rsc_0_1_d),
      .wadr(vec_rsc_0_1_wadr),
      .q(vec_rsc_0_1_q),
      .re(vec_rsc_0_1_re),
      .radr(vec_rsc_0_1_radr),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .we_d(vec_rsc_0_1_i_we_d_iff),
      .re_d(vec_rsc_0_1_i_re_d_iff),
      .q_d(vec_rsc_0_1_i_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_re_d_iff),
      .port_1_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_1_i_we_d_iff)
    );
  inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen twiddle_rsc_0_0_i
      (
      .q(twiddle_rsc_0_0_q),
      .re(twiddle_rsc_0_0_re),
      .radr(twiddle_rsc_0_0_radr),
      .radr_d(twiddle_rsc_0_0_i_radr_d),
      .re_d(twiddle_rsc_0_0_i_re_d_iff),
      .q_d(twiddle_rsc_0_0_i_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_re_d_iff)
    );
  inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen twiddle_rsc_0_1_i
      (
      .q(twiddle_rsc_0_1_q),
      .re(twiddle_rsc_0_1_re),
      .radr(twiddle_rsc_0_1_radr),
      .radr_d(twiddle_rsc_0_1_i_radr_d),
      .re_d(twiddle_rsc_0_1_i_re_d_iff),
      .q_d(twiddle_rsc_0_1_i_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_re_d_iff)
    );
  inPlaceNTT_DIF_core inPlaceNTT_DIF_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
      .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
      .vec_rsc_0_0_i_q_d(vec_rsc_0_0_i_q_d),
      .vec_rsc_0_1_i_q_d(vec_rsc_0_1_i_q_d),
      .twiddle_rsc_0_0_i_radr_d(twiddle_rsc_0_0_i_radr_d),
      .twiddle_rsc_0_0_i_q_d(twiddle_rsc_0_0_i_q_d),
      .twiddle_rsc_0_1_i_radr_d(twiddle_rsc_0_1_i_radr_d),
      .twiddle_rsc_0_1_i_q_d(twiddle_rsc_0_1_i_q_d),
      .vec_rsc_0_0_i_radr_d_pff(vec_rsc_0_0_i_radr_d_iff),
      .vec_rsc_0_0_i_wadr_d_pff(vec_rsc_0_0_i_wadr_d_iff),
      .vec_rsc_0_0_i_d_d_pff(vec_rsc_0_0_i_d_d_iff),
      .vec_rsc_0_0_i_we_d_pff(vec_rsc_0_0_i_we_d_iff),
      .vec_rsc_0_0_i_re_d_pff(vec_rsc_0_0_i_re_d_iff),
      .vec_rsc_0_1_i_we_d_pff(vec_rsc_0_1_i_we_d_iff),
      .vec_rsc_0_1_i_re_d_pff(vec_rsc_0_1_i_re_d_iff),
      .twiddle_rsc_0_0_i_re_d_pff(twiddle_rsc_0_0_i_re_d_iff),
      .twiddle_rsc_0_1_i_re_d_pff(twiddle_rsc_0_1_i_re_d_iff)
    );
endmodule



