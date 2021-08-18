
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


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_out_dreg_v2.v 
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


module mgc_out_dreg_v2 (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input    [width-1:0] d;
  output   [width-1:0] z;

  wire     [width-1:0] z;

  assign z = d;

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

//------> ../td_ccore_solutions/modulo_7c916ad59326b02df02b1a80099f3e2761bb_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Aug  2 16:56:58 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    modulo_core
// ------------------------------------------------------------------


module modulo_core (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat, ccs_ccore_clk,
      ccs_ccore_srst, ccs_ccore_en
);
  input [63:0] base_rsc_dat;
  input [63:0] m_rsc_dat;
  output [63:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;


  // Interconnect Declarations
  wire [63:0] base_rsci_idat;
  wire [63:0] m_rsci_idat;
  reg [63:0] return_rsci_d;
  wire ccs_ccore_start_rsci_idat;
  wire [64:0] rem_12_cmp_z;
  wire [64:0] rem_12_cmp_1_z;
  wire [64:0] rem_12_cmp_2_z;
  wire [64:0] rem_12_cmp_3_z;
  wire [64:0] rem_12_cmp_4_z;
  wire [64:0] rem_12_cmp_5_z;
  wire [64:0] rem_12_cmp_6_z;
  wire [64:0] rem_12_cmp_7_z;
  wire [64:0] rem_12_cmp_8_z;
  wire [64:0] rem_12_cmp_9_z;
  wire [64:0] rem_12_cmp_10_z;
  wire [64:0] rem_12_cmp_11_z;
  reg [63:0] rem_12_cmp_b_63_0;
  reg [63:0] rem_12_cmp_1_b_63_0;
  reg [63:0] rem_12_cmp_2_b_63_0;
  reg [63:0] rem_12_cmp_3_b_63_0;
  reg [63:0] rem_12_cmp_4_b_63_0;
  reg [63:0] rem_12_cmp_5_b_63_0;
  reg [63:0] rem_12_cmp_6_b_63_0;
  reg [63:0] rem_12_cmp_7_b_63_0;
  reg [63:0] rem_12_cmp_8_b_63_0;
  reg [63:0] rem_12_cmp_9_b_63_0;
  reg [63:0] rem_12_cmp_10_b_63_0;
  reg [63:0] rem_12_cmp_11_b_63_0;
  reg [63:0] rem_12_cmp_a_63_0;
  reg [63:0] rem_12_cmp_1_a_63_0;
  reg [63:0] rem_12_cmp_2_a_63_0;
  reg [63:0] rem_12_cmp_3_a_63_0;
  reg [63:0] rem_12_cmp_4_a_63_0;
  reg [63:0] rem_12_cmp_5_a_63_0;
  reg [63:0] rem_12_cmp_6_a_63_0;
  reg [63:0] rem_12_cmp_7_a_63_0;
  reg [63:0] rem_12_cmp_8_a_63_0;
  reg [63:0] rem_12_cmp_9_a_63_0;
  reg [63:0] rem_12_cmp_10_a_63_0;
  reg [63:0] rem_12_cmp_11_a_63_0;
  wire [1:0] COMP_LOOP_acc_tmp;
  wire [2:0] nl_COMP_LOOP_acc_tmp;
  wire [3:0] COMP_LOOP_acc_1_tmp;
  wire [4:0] nl_COMP_LOOP_acc_1_tmp;
  wire and_dcpl_1;
  wire and_dcpl_2;
  wire and_dcpl_3;
  wire and_dcpl_4;
  wire and_dcpl_6;
  wire and_dcpl_8;
  wire and_dcpl_9;
  wire and_dcpl_11;
  wire and_dcpl_13;
  wire and_dcpl_18;
  wire and_dcpl_23;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire and_dcpl_33;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_38;
  wire and_dcpl_40;
  wire and_dcpl_45;
  wire and_dcpl_50;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire and_dcpl_60;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire and_dcpl_65;
  wire and_dcpl_67;
  wire and_dcpl_72;
  wire and_dcpl_77;
  wire and_dcpl_82;
  wire and_dcpl_83;
  wire and_dcpl_84;
  wire and_dcpl_85;
  wire and_dcpl_87;
  wire and_dcpl_89;
  wire and_dcpl_90;
  wire and_dcpl_92;
  wire and_dcpl_94;
  wire and_dcpl_99;
  wire and_dcpl_104;
  wire and_dcpl_109;
  wire and_dcpl_110;
  wire and_dcpl_111;
  wire and_dcpl_112;
  wire and_dcpl_114;
  wire and_dcpl_115;
  wire and_dcpl_117;
  wire and_dcpl_119;
  wire and_dcpl_121;
  wire and_dcpl_126;
  wire and_dcpl_129;
  wire and_dcpl_136;
  wire and_dcpl_137;
  wire and_dcpl_138;
  wire and_dcpl_139;
  wire and_dcpl_141;
  wire and_dcpl_143;
  wire and_dcpl_144;
  wire and_dcpl_146;
  wire and_dcpl_148;
  wire and_dcpl_153;
  wire and_dcpl_158;
  wire and_dcpl_163;
  wire and_dcpl_164;
  wire and_dcpl_165;
  wire and_dcpl_166;
  wire and_dcpl_168;
  wire and_dcpl_170;
  wire and_dcpl_171;
  wire and_dcpl_173;
  wire and_dcpl_175;
  wire and_dcpl_180;
  wire and_dcpl_185;
  wire and_dcpl_190;
  wire and_dcpl_191;
  wire and_dcpl_192;
  wire and_dcpl_193;
  wire and_dcpl_195;
  wire and_dcpl_197;
  wire and_dcpl_198;
  wire and_dcpl_200;
  wire and_dcpl_202;
  wire and_dcpl_207;
  wire and_dcpl_212;
  wire and_dcpl_217;
  wire and_dcpl_218;
  wire and_dcpl_219;
  wire and_dcpl_220;
  wire and_dcpl_222;
  wire and_dcpl_224;
  wire and_dcpl_225;
  wire and_dcpl_227;
  wire and_dcpl_229;
  wire and_dcpl_234;
  wire and_dcpl_239;
  wire and_dcpl_244;
  wire and_dcpl_245;
  wire and_dcpl_246;
  wire and_dcpl_247;
  wire and_dcpl_249;
  wire and_dcpl_251;
  wire and_dcpl_252;
  wire and_dcpl_254;
  wire and_dcpl_256;
  wire and_dcpl_261;
  wire and_dcpl_266;
  wire and_dcpl_271;
  wire and_dcpl_272;
  wire and_dcpl_274;
  wire and_dcpl_276;
  wire and_dcpl_278;
  wire and_dcpl_280;
  wire and_dcpl_285;
  wire and_dcpl_291;
  wire and_dcpl_292;
  wire and_dcpl_293;
  wire and_dcpl_294;
  wire and_dcpl_295;
  wire and_dcpl_296;
  wire and_dcpl_298;
  wire not_tmp_54;
  wire or_tmp_2;
  wire and_dcpl_300;
  wire and_dcpl_301;
  wire and_dcpl_302;
  wire and_dcpl_304;
  wire and_tmp;
  wire and_dcpl_306;
  wire and_dcpl_307;
  wire and_dcpl_308;
  wire and_dcpl_310;
  wire and_tmp_2;
  wire and_dcpl_312;
  wire and_dcpl_313;
  wire and_dcpl_314;
  wire and_dcpl_316;
  wire and_tmp_5;
  wire and_dcpl_318;
  wire and_tmp_9;
  wire and_dcpl_324;
  wire and_tmp_13;
  wire and_dcpl_330;
  wire mux_tmp_19;
  wire and_tmp_17;
  wire and_dcpl_336;
  wire mux_tmp_22;
  wire mux_tmp_23;
  wire and_tmp_21;
  wire and_dcpl_342;
  wire mux_tmp_26;
  wire mux_tmp_27;
  wire mux_tmp_28;
  wire and_tmp_25;
  wire and_dcpl_348;
  wire and_tmp_35;
  wire and_dcpl_355;
  wire and_dcpl_356;
  wire and_dcpl_358;
  wire or_tmp_80;
  wire and_dcpl_360;
  wire and_dcpl_362;
  wire mux_tmp_32;
  wire and_dcpl_364;
  wire and_dcpl_366;
  wire mux_tmp_34;
  wire mux_tmp_35;
  wire and_dcpl_368;
  wire and_dcpl_370;
  wire mux_tmp_37;
  wire mux_tmp_38;
  wire mux_tmp_39;
  wire and_dcpl_372;
  wire mux_tmp_41;
  wire mux_tmp_42;
  wire mux_tmp_43;
  wire mux_tmp_44;
  wire and_dcpl_376;
  wire mux_tmp_46;
  wire mux_tmp_47;
  wire mux_tmp_48;
  wire mux_tmp_49;
  wire mux_tmp_50;
  wire and_dcpl_379;
  wire mux_tmp_52;
  wire mux_tmp_53;
  wire mux_tmp_54;
  wire mux_tmp_55;
  wire mux_tmp_56;
  wire mux_tmp_57;
  wire and_dcpl_382;
  wire mux_tmp_59;
  wire mux_tmp_60;
  wire mux_tmp_61;
  wire mux_tmp_62;
  wire mux_tmp_63;
  wire mux_tmp_64;
  wire mux_tmp_65;
  wire and_dcpl_385;
  wire mux_tmp_67;
  wire mux_tmp_68;
  wire mux_tmp_69;
  wire mux_tmp_70;
  wire mux_tmp_71;
  wire mux_tmp_72;
  wire mux_tmp_73;
  wire mux_tmp_74;
  wire and_dcpl_388;
  wire and_tmp_44;
  wire mux_tmp_76;
  wire and_dcpl_393;
  wire and_dcpl_394;
  wire and_dcpl_395;
  wire or_tmp_185;
  wire and_dcpl_397;
  wire and_dcpl_398;
  wire and_tmp_45;
  wire and_dcpl_400;
  wire and_dcpl_401;
  wire and_tmp_47;
  wire and_dcpl_403;
  wire and_dcpl_404;
  wire and_tmp_50;
  wire and_dcpl_406;
  wire and_tmp_54;
  wire and_dcpl_409;
  wire and_tmp_58;
  wire and_dcpl_413;
  wire mux_tmp_84;
  wire and_tmp_62;
  wire and_dcpl_417;
  wire mux_tmp_87;
  wire mux_tmp_88;
  wire and_tmp_66;
  wire and_dcpl_421;
  wire mux_tmp_91;
  wire mux_tmp_92;
  wire mux_tmp_93;
  wire and_tmp_70;
  wire and_dcpl_425;
  wire and_tmp_80;
  wire and_dcpl_430;
  wire and_dcpl_431;
  wire or_tmp_263;
  wire and_dcpl_433;
  wire mux_tmp_97;
  wire and_dcpl_435;
  wire mux_tmp_99;
  wire mux_tmp_100;
  wire and_dcpl_437;
  wire mux_tmp_102;
  wire mux_tmp_103;
  wire mux_tmp_104;
  wire and_dcpl_439;
  wire mux_tmp_106;
  wire mux_tmp_107;
  wire mux_tmp_108;
  wire mux_tmp_109;
  wire and_dcpl_442;
  wire mux_tmp_111;
  wire mux_tmp_112;
  wire mux_tmp_113;
  wire mux_tmp_114;
  wire mux_tmp_115;
  wire and_dcpl_445;
  wire mux_tmp_117;
  wire mux_tmp_118;
  wire mux_tmp_119;
  wire mux_tmp_120;
  wire mux_tmp_121;
  wire mux_tmp_122;
  wire and_dcpl_448;
  wire mux_tmp_124;
  wire mux_tmp_125;
  wire mux_tmp_126;
  wire mux_tmp_127;
  wire mux_tmp_128;
  wire mux_tmp_129;
  wire mux_tmp_130;
  wire and_dcpl_451;
  wire mux_tmp_132;
  wire mux_tmp_133;
  wire mux_tmp_134;
  wire mux_tmp_135;
  wire mux_tmp_136;
  wire mux_tmp_137;
  wire mux_tmp_138;
  wire mux_tmp_139;
  wire and_dcpl_454;
  wire and_tmp_89;
  wire mux_tmp_141;
  wire and_dcpl_460;
  wire and_dcpl_461;
  wire and_dcpl_462;
  wire and_dcpl_463;
  wire not_tmp_332;
  wire or_tmp_368;
  wire and_dcpl_465;
  wire and_dcpl_466;
  wire and_dcpl_467;
  wire and_tmp_90;
  wire and_dcpl_469;
  wire and_dcpl_470;
  wire and_dcpl_471;
  wire and_tmp_92;
  wire and_dcpl_473;
  wire and_dcpl_474;
  wire and_dcpl_475;
  wire and_tmp_95;
  wire and_dcpl_477;
  wire and_tmp_99;
  wire and_dcpl_480;
  wire and_tmp_103;
  wire and_dcpl_483;
  wire mux_tmp_149;
  wire and_tmp_107;
  wire and_dcpl_486;
  wire mux_tmp_152;
  wire mux_tmp_153;
  wire and_tmp_111;
  wire and_dcpl_489;
  wire mux_tmp_156;
  wire mux_tmp_157;
  wire mux_tmp_158;
  wire and_tmp_115;
  wire and_dcpl_492;
  wire and_tmp_125;
  wire and_dcpl_498;
  wire or_tmp_446;
  wire and_dcpl_500;
  wire mux_tmp_162;
  wire and_dcpl_502;
  wire mux_tmp_164;
  wire mux_tmp_165;
  wire and_dcpl_504;
  wire mux_tmp_167;
  wire mux_tmp_168;
  wire mux_tmp_169;
  wire and_dcpl_506;
  wire mux_tmp_171;
  wire mux_tmp_172;
  wire mux_tmp_173;
  wire mux_tmp_174;
  wire and_dcpl_508;
  wire mux_tmp_176;
  wire mux_tmp_177;
  wire mux_tmp_178;
  wire mux_tmp_179;
  wire mux_tmp_180;
  wire and_dcpl_510;
  wire mux_tmp_182;
  wire mux_tmp_183;
  wire mux_tmp_184;
  wire mux_tmp_185;
  wire mux_tmp_186;
  wire mux_tmp_187;
  wire and_dcpl_512;
  wire mux_tmp_189;
  wire mux_tmp_190;
  wire mux_tmp_191;
  wire mux_tmp_192;
  wire mux_tmp_193;
  wire mux_tmp_194;
  wire mux_tmp_195;
  wire and_dcpl_514;
  wire mux_tmp_197;
  wire mux_tmp_198;
  wire mux_tmp_199;
  wire mux_tmp_200;
  wire mux_tmp_201;
  wire mux_tmp_202;
  wire mux_tmp_203;
  wire mux_tmp_204;
  wire and_dcpl_516;
  wire and_tmp_134;
  wire mux_tmp_206;
  wire and_dcpl_520;
  wire and_dcpl_521;
  wire or_tmp_551;
  wire and_dcpl_523;
  wire and_dcpl_524;
  wire and_tmp_135;
  wire and_dcpl_526;
  wire and_dcpl_527;
  wire and_tmp_137;
  wire and_dcpl_529;
  wire and_dcpl_530;
  wire and_tmp_140;
  wire and_dcpl_532;
  wire and_tmp_144;
  wire and_dcpl_534;
  wire and_tmp_148;
  wire and_dcpl_536;
  wire mux_tmp_214;
  wire and_tmp_152;
  wire and_dcpl_538;
  wire mux_tmp_217;
  wire mux_tmp_218;
  wire and_tmp_156;
  wire and_dcpl_540;
  wire mux_tmp_221;
  wire mux_tmp_222;
  wire mux_tmp_223;
  wire and_tmp_160;
  wire and_dcpl_542;
  wire and_tmp_170;
  wire and_dcpl_546;
  wire or_tmp_629;
  wire and_dcpl_548;
  wire mux_tmp_227;
  wire and_dcpl_550;
  wire mux_tmp_229;
  wire mux_tmp_230;
  wire and_dcpl_552;
  wire mux_tmp_232;
  wire mux_tmp_233;
  wire mux_tmp_234;
  wire and_dcpl_554;
  wire mux_tmp_236;
  wire mux_tmp_237;
  wire mux_tmp_238;
  wire mux_tmp_239;
  wire and_dcpl_556;
  wire mux_tmp_241;
  wire mux_tmp_242;
  wire mux_tmp_243;
  wire mux_tmp_244;
  wire mux_tmp_245;
  wire and_dcpl_558;
  wire mux_tmp_247;
  wire mux_tmp_248;
  wire mux_tmp_249;
  wire mux_tmp_250;
  wire mux_tmp_251;
  wire mux_tmp_252;
  wire and_dcpl_560;
  wire mux_tmp_254;
  wire mux_tmp_255;
  wire mux_tmp_256;
  wire mux_tmp_257;
  wire mux_tmp_258;
  wire mux_tmp_259;
  wire mux_tmp_260;
  wire and_dcpl_562;
  wire mux_tmp_262;
  wire mux_tmp_263;
  wire mux_tmp_264;
  wire mux_tmp_265;
  wire mux_tmp_266;
  wire mux_tmp_267;
  wire mux_tmp_268;
  wire mux_tmp_269;
  wire and_dcpl_564;
  wire and_tmp_179;
  wire mux_tmp_271;
  wire and_dcpl_568;
  wire and_dcpl_569;
  wire and_dcpl_570;
  wire and_dcpl_571;
  wire or_tmp_733;
  wire and_dcpl_573;
  wire and_dcpl_574;
  wire and_dcpl_575;
  wire and_tmp_180;
  wire and_dcpl_577;
  wire and_dcpl_578;
  wire and_dcpl_579;
  wire and_tmp_182;
  wire and_dcpl_581;
  wire and_dcpl_582;
  wire and_dcpl_583;
  wire and_tmp_185;
  wire and_dcpl_585;
  wire and_tmp_189;
  wire and_dcpl_589;
  wire and_tmp_193;
  wire and_dcpl_593;
  wire mux_tmp_279;
  wire and_tmp_197;
  wire and_dcpl_597;
  wire mux_tmp_282;
  wire mux_tmp_283;
  wire and_tmp_201;
  wire and_dcpl_601;
  wire mux_tmp_286;
  wire mux_tmp_287;
  wire mux_tmp_288;
  wire and_tmp_205;
  wire and_dcpl_605;
  wire or_tmp_808;
  wire mux_tmp_291;
  wire mux_tmp_292;
  wire mux_tmp_293;
  wire mux_tmp_294;
  wire mux_tmp_295;
  wire mux_tmp_296;
  wire mux_tmp_297;
  wire mux_tmp_298;
  wire and_tmp_206;
  wire and_dcpl_610;
  wire or_tmp_820;
  wire and_dcpl_612;
  wire mux_tmp_301;
  wire and_dcpl_614;
  wire mux_tmp_303;
  wire mux_tmp_304;
  wire and_dcpl_616;
  wire mux_tmp_306;
  wire mux_tmp_307;
  wire mux_tmp_308;
  wire and_dcpl_618;
  wire mux_tmp_310;
  wire mux_tmp_311;
  wire mux_tmp_312;
  wire mux_tmp_313;
  wire and_dcpl_622;
  wire mux_tmp_315;
  wire mux_tmp_316;
  wire mux_tmp_317;
  wire mux_tmp_318;
  wire mux_tmp_319;
  wire and_dcpl_625;
  wire mux_tmp_321;
  wire mux_tmp_322;
  wire mux_tmp_323;
  wire mux_tmp_324;
  wire mux_tmp_325;
  wire mux_tmp_326;
  wire and_dcpl_628;
  wire mux_tmp_328;
  wire mux_tmp_329;
  wire mux_tmp_330;
  wire mux_tmp_331;
  wire mux_tmp_332;
  wire mux_tmp_333;
  wire mux_tmp_334;
  wire and_dcpl_631;
  wire mux_tmp_336;
  wire mux_tmp_337;
  wire mux_tmp_338;
  wire mux_tmp_339;
  wire mux_tmp_340;
  wire mux_tmp_341;
  wire mux_tmp_342;
  wire mux_tmp_343;
  wire and_dcpl_634;
  wire or_tmp_921;
  wire mux_tmp_345;
  wire mux_tmp_346;
  wire mux_tmp_347;
  wire mux_tmp_348;
  wire mux_tmp_349;
  wire mux_tmp_350;
  wire mux_tmp_351;
  wire mux_tmp_352;
  wire mux_tmp_353;
  wire mux_tmp_354;
  wire and_dcpl_638;
  wire and_dcpl_639;
  wire or_tmp_934;
  wire and_dcpl_641;
  wire and_dcpl_642;
  wire and_tmp_207;
  wire and_dcpl_644;
  wire and_dcpl_645;
  wire and_tmp_209;
  wire and_dcpl_647;
  wire and_dcpl_648;
  wire and_tmp_212;
  wire and_dcpl_650;
  wire and_tmp_216;
  wire and_dcpl_653;
  wire and_tmp_220;
  wire and_dcpl_657;
  wire mux_tmp_362;
  wire and_tmp_224;
  wire and_dcpl_661;
  wire mux_tmp_365;
  wire mux_tmp_366;
  wire and_tmp_228;
  wire and_dcpl_665;
  wire mux_tmp_369;
  wire mux_tmp_370;
  wire mux_tmp_371;
  wire and_tmp_232;
  wire and_dcpl_669;
  wire or_tmp_1009;
  wire mux_tmp_374;
  wire mux_tmp_375;
  wire mux_tmp_376;
  wire mux_tmp_377;
  wire mux_tmp_378;
  wire mux_tmp_379;
  wire mux_tmp_380;
  wire mux_tmp_381;
  wire and_tmp_233;
  wire and_dcpl_673;
  wire or_tmp_1021;
  wire and_dcpl_675;
  wire mux_tmp_384;
  wire and_dcpl_677;
  wire mux_tmp_386;
  wire mux_tmp_387;
  wire and_dcpl_679;
  wire mux_tmp_389;
  wire mux_tmp_390;
  wire mux_tmp_391;
  wire and_dcpl_681;
  wire mux_tmp_393;
  wire mux_tmp_394;
  wire mux_tmp_395;
  wire mux_tmp_396;
  wire and_dcpl_684;
  wire mux_tmp_398;
  wire mux_tmp_399;
  wire mux_tmp_400;
  wire mux_tmp_401;
  wire mux_tmp_402;
  wire and_dcpl_687;
  wire mux_tmp_404;
  wire mux_tmp_405;
  wire mux_tmp_406;
  wire mux_tmp_407;
  wire mux_tmp_408;
  wire mux_tmp_409;
  wire and_dcpl_690;
  wire mux_tmp_411;
  wire mux_tmp_412;
  wire mux_tmp_413;
  wire mux_tmp_414;
  wire mux_tmp_415;
  wire mux_tmp_416;
  wire mux_tmp_417;
  wire and_dcpl_693;
  wire mux_tmp_419;
  wire mux_tmp_420;
  wire mux_tmp_421;
  wire mux_tmp_422;
  wire mux_tmp_423;
  wire mux_tmp_424;
  wire mux_tmp_425;
  wire mux_tmp_426;
  wire and_dcpl_696;
  wire or_tmp_1122;
  wire mux_tmp_428;
  wire mux_tmp_429;
  wire mux_tmp_430;
  wire mux_tmp_431;
  wire mux_tmp_432;
  wire mux_tmp_433;
  wire mux_tmp_434;
  wire mux_tmp_435;
  wire mux_tmp_436;
  wire mux_tmp_437;
  reg [1:0] rem_12cyc_st_10_1_0;
  reg [1:0] rem_12cyc_st_10_3_2;
  reg [1:0] rem_12cyc_st_9_1_0;
  reg [1:0] rem_12cyc_st_9_3_2;
  reg [1:0] rem_12cyc_st_8_1_0;
  reg [1:0] rem_12cyc_st_8_3_2;
  reg [1:0] rem_12cyc_st_7_1_0;
  reg [1:0] rem_12cyc_st_7_3_2;
  reg [1:0] rem_12cyc_st_6_1_0;
  reg [1:0] rem_12cyc_st_6_3_2;
  reg [1:0] rem_12cyc_st_5_1_0;
  reg [1:0] rem_12cyc_st_5_3_2;
  reg [1:0] rem_12cyc_st_4_1_0;
  reg [1:0] rem_12cyc_st_4_3_2;
  reg [1:0] rem_12cyc_st_3_1_0;
  reg [1:0] rem_12cyc_st_3_3_2;
  reg [1:0] rem_12cyc_st_2_1_0;
  reg [1:0] rem_12cyc_st_2_3_2;
  reg [1:0] rem_12cyc_1_0;
  reg [1:0] rem_12cyc_3_2;
  reg [1:0] rem_12cyc_st_12_3_2;
  reg [63:0] result_sva_duc;
  reg [1:0] rem_12cyc_st_12_1_0;
  reg COMP_LOOP_asn_itm_12;
  reg main_stage_0_13;
  reg main_stage_0_3;
  reg COMP_LOOP_asn_itm_1;
  reg main_stage_0_2;
  reg main_stage_0_4;
  reg COMP_LOOP_asn_itm_2;
  reg main_stage_0_5;
  reg COMP_LOOP_asn_itm_3;
  reg main_stage_0_6;
  reg COMP_LOOP_asn_itm_4;
  reg COMP_LOOP_asn_itm_5;
  reg main_stage_0_8;
  reg COMP_LOOP_asn_itm_7;
  reg main_stage_0_9;
  reg COMP_LOOP_asn_itm_8;
  reg main_stage_0_10;
  reg COMP_LOOP_asn_itm_9;
  reg main_stage_0_7;
  reg COMP_LOOP_asn_itm_6;
  reg main_stage_0_11;
  reg COMP_LOOP_asn_itm_10;
  wire COMP_LOOP_and_cse;
  wire COMP_LOOP_and_2_cse;
  wire COMP_LOOP_and_4_cse;
  wire COMP_LOOP_and_6_cse;
  wire COMP_LOOP_and_8_cse;
  wire COMP_LOOP_and_10_cse;
  wire COMP_LOOP_and_12_cse;
  wire COMP_LOOP_and_14_cse;
  wire COMP_LOOP_and_16_cse;
  wire COMP_LOOP_and_18_cse;
  wire COMP_LOOP_and_20_cse;
  wire COMP_LOOP_and_22_cse;
  wire COMP_LOOP_and_24_cse;
  wire or_1_cse;
  wire or_6_cse;
  wire or_10_cse;
  wire or_15_cse;
  wire or_21_cse;
  wire or_28_cse;
  wire or_37_cse;
  wire or_48_cse;
  wire or_83_cse;
  wire nand_276_cse;
  wire or_88_cse;
  wire nand_274_cse;
  wire or_93_cse;
  wire nand_271_cse;
  wire or_100_cse;
  wire nand_267_cse;
  wire or_109_cse;
  wire or_120_cse;
  wire or_133_cse;
  wire or_148_cse;
  wire or_190_cse;
  wire or_195_cse;
  wire or_199_cse;
  wire or_204_cse;
  wire or_210_cse;
  wire or_217_cse;
  wire or_226_cse;
  wire or_237_cse;
  wire or_270_cse;
  wire or_275_cse;
  wire or_280_cse;
  wire or_287_cse;
  wire or_296_cse;
  wire or_307_cse;
  wire or_320_cse;
  wire or_335_cse;
  wire nand_281_cse;
  wire or_377_cse;
  wire or_382_cse;
  wire or_386_cse;
  wire or_391_cse;
  wire or_397_cse;
  wire nand_215_cse;
  wire or_404_cse;
  wire nand_212_cse;
  wire or_413_cse;
  wire nand_208_cse;
  wire or_424_cse;
  wire or_458_cse;
  wire or_463_cse;
  wire nand_198_cse;
  wire or_468_cse;
  wire or_475_cse;
  wire nand_189_cse;
  wire or_484_cse;
  wire or_495_cse;
  wire or_508_cse;
  wire nand_203_cse;
  wire or_523_cse;
  wire nand_250_cse;
  wire or_564_cse;
  wire or_569_cse;
  wire or_573_cse;
  wire or_578_cse;
  wire or_584_cse;
  wire or_591_cse;
  wire or_600_cse;
  wire or_611_cse;
  wire or_643_cse;
  wire or_648_cse;
  wire or_653_cse;
  wire or_660_cse;
  wire or_669_cse;
  wire or_680_cse;
  wire or_693_cse;
  wire or_708_cse;
  wire or_748_cse;
  wire or_753_cse;
  wire or_757_cse;
  wire or_762_cse;
  wire or_768_cse;
  wire or_775_cse;
  wire or_784_cse;
  wire or_795_cse;
  wire or_837_cse;
  wire nand_84_cse;
  wire or_842_cse;
  wire or_847_cse;
  wire nand_79_cse;
  wire or_854_cse;
  wire or_863_cse;
  wire or_874_cse;
  wire or_887_cse;
  wire or_902_cse;
  wire or_952_cse;
  wire or_957_cse;
  wire or_961_cse;
  wire or_966_cse;
  wire or_972_cse;
  wire or_979_cse;
  wire or_988_cse;
  wire or_999_cse;
  wire nand_57_cse;
  wire or_1045_cse;
  wire or_1050_cse;
  wire or_1057_cse;
  wire or_1066_cse;
  wire nand_36_cse;
  wire nand_29_cse;
  wire nand_21_cse;
  wire nand_222_cse;
  wire nand_223_cse;
  reg main_stage_0_12;
  reg [63:0] m_buf_sva_1;
  reg [63:0] m_buf_sva_2;
  reg [63:0] m_buf_sva_3;
  reg [63:0] m_buf_sva_4;
  reg [63:0] m_buf_sva_5;
  reg [63:0] m_buf_sva_6;
  reg [63:0] m_buf_sva_7;
  reg [63:0] m_buf_sva_8;
  reg [63:0] m_buf_sva_9;
  reg [63:0] m_buf_sva_10;
  reg [63:0] m_buf_sva_11;
  reg [63:0] m_buf_sva_12;
  reg COMP_LOOP_asn_itm_11;
  reg [63:0] mut_2_63_0;
  reg [63:0] mut_3_63_0;
  reg [63:0] mut_4_63_0;
  reg [63:0] mut_5_63_0;
  reg [63:0] mut_6_63_0;
  reg [63:0] mut_7_63_0;
  reg [63:0] mut_8_63_0;
  reg [63:0] mut_9_63_0;
  reg [63:0] mut_10_63_0;
  reg [63:0] mut_11_63_0;
  reg [63:0] mut_1_2_63_0;
  reg [63:0] mut_1_3_63_0;
  reg [63:0] mut_1_4_63_0;
  reg [63:0] mut_1_5_63_0;
  reg [63:0] mut_1_6_63_0;
  reg [63:0] mut_1_7_63_0;
  reg [63:0] mut_1_8_63_0;
  reg [63:0] mut_1_9_63_0;
  reg [63:0] mut_1_10_63_0;
  reg [63:0] mut_1_11_63_0;
  reg [63:0] mut_2_2_63_0;
  reg [63:0] mut_2_3_63_0;
  reg [63:0] mut_2_4_63_0;
  reg [63:0] mut_2_5_63_0;
  reg [63:0] mut_2_6_63_0;
  reg [63:0] mut_2_7_63_0;
  reg [63:0] mut_2_8_63_0;
  reg [63:0] mut_2_9_63_0;
  reg [63:0] mut_2_10_63_0;
  reg [63:0] mut_2_11_63_0;
  reg [63:0] mut_3_2_63_0;
  reg [63:0] mut_3_3_63_0;
  reg [63:0] mut_3_4_63_0;
  reg [63:0] mut_3_5_63_0;
  reg [63:0] mut_3_6_63_0;
  reg [63:0] mut_3_7_63_0;
  reg [63:0] mut_3_8_63_0;
  reg [63:0] mut_3_9_63_0;
  reg [63:0] mut_3_10_63_0;
  reg [63:0] mut_3_11_63_0;
  reg [63:0] mut_4_2_63_0;
  reg [63:0] mut_4_3_63_0;
  reg [63:0] mut_4_4_63_0;
  reg [63:0] mut_4_5_63_0;
  reg [63:0] mut_4_6_63_0;
  reg [63:0] mut_4_7_63_0;
  reg [63:0] mut_4_8_63_0;
  reg [63:0] mut_4_9_63_0;
  reg [63:0] mut_4_10_63_0;
  reg [63:0] mut_4_11_63_0;
  reg [63:0] mut_5_2_63_0;
  reg [63:0] mut_5_3_63_0;
  reg [63:0] mut_5_4_63_0;
  reg [63:0] mut_5_5_63_0;
  reg [63:0] mut_5_6_63_0;
  reg [63:0] mut_5_7_63_0;
  reg [63:0] mut_5_8_63_0;
  reg [63:0] mut_5_9_63_0;
  reg [63:0] mut_5_10_63_0;
  reg [63:0] mut_5_11_63_0;
  reg [63:0] mut_6_2_63_0;
  reg [63:0] mut_6_3_63_0;
  reg [63:0] mut_6_4_63_0;
  reg [63:0] mut_6_5_63_0;
  reg [63:0] mut_6_6_63_0;
  reg [63:0] mut_6_7_63_0;
  reg [63:0] mut_6_8_63_0;
  reg [63:0] mut_6_9_63_0;
  reg [63:0] mut_6_10_63_0;
  reg [63:0] mut_6_11_63_0;
  reg [63:0] mut_7_2_63_0;
  reg [63:0] mut_7_3_63_0;
  reg [63:0] mut_7_4_63_0;
  reg [63:0] mut_7_5_63_0;
  reg [63:0] mut_7_6_63_0;
  reg [63:0] mut_7_7_63_0;
  reg [63:0] mut_7_8_63_0;
  reg [63:0] mut_7_9_63_0;
  reg [63:0] mut_7_10_63_0;
  reg [63:0] mut_7_11_63_0;
  reg [63:0] mut_8_2_63_0;
  reg [63:0] mut_8_3_63_0;
  reg [63:0] mut_8_4_63_0;
  reg [63:0] mut_8_5_63_0;
  reg [63:0] mut_8_6_63_0;
  reg [63:0] mut_8_7_63_0;
  reg [63:0] mut_8_8_63_0;
  reg [63:0] mut_8_9_63_0;
  reg [63:0] mut_8_10_63_0;
  reg [63:0] mut_8_11_63_0;
  reg [63:0] mut_9_2_63_0;
  reg [63:0] mut_9_3_63_0;
  reg [63:0] mut_9_4_63_0;
  reg [63:0] mut_9_5_63_0;
  reg [63:0] mut_9_6_63_0;
  reg [63:0] mut_9_7_63_0;
  reg [63:0] mut_9_8_63_0;
  reg [63:0] mut_9_9_63_0;
  reg [63:0] mut_9_10_63_0;
  reg [63:0] mut_9_11_63_0;
  reg [63:0] mut_10_2_63_0;
  reg [63:0] mut_10_3_63_0;
  reg [63:0] mut_10_4_63_0;
  reg [63:0] mut_10_5_63_0;
  reg [63:0] mut_10_6_63_0;
  reg [63:0] mut_10_7_63_0;
  reg [63:0] mut_10_8_63_0;
  reg [63:0] mut_10_9_63_0;
  reg [63:0] mut_10_10_63_0;
  reg [63:0] mut_10_11_63_0;
  reg [63:0] mut_11_2_63_0;
  reg [63:0] mut_11_3_63_0;
  reg [63:0] mut_11_4_63_0;
  reg [63:0] mut_11_5_63_0;
  reg [63:0] mut_11_6_63_0;
  reg [63:0] mut_11_7_63_0;
  reg [63:0] mut_11_8_63_0;
  reg [63:0] mut_11_9_63_0;
  reg [63:0] mut_11_10_63_0;
  reg [63:0] mut_11_11_63_0;
  reg [63:0] mut_12_2_63_0;
  reg [63:0] mut_12_3_63_0;
  reg [63:0] mut_12_4_63_0;
  reg [63:0] mut_12_5_63_0;
  reg [63:0] mut_12_6_63_0;
  reg [63:0] mut_12_7_63_0;
  reg [63:0] mut_12_8_63_0;
  reg [63:0] mut_12_9_63_0;
  reg [63:0] mut_12_10_63_0;
  reg [63:0] mut_12_11_63_0;
  reg [63:0] mut_13_2_63_0;
  reg [63:0] mut_13_3_63_0;
  reg [63:0] mut_13_4_63_0;
  reg [63:0] mut_13_5_63_0;
  reg [63:0] mut_13_6_63_0;
  reg [63:0] mut_13_7_63_0;
  reg [63:0] mut_13_8_63_0;
  reg [63:0] mut_13_9_63_0;
  reg [63:0] mut_13_10_63_0;
  reg [63:0] mut_13_11_63_0;
  reg [63:0] mut_14_2_63_0;
  reg [63:0] mut_14_3_63_0;
  reg [63:0] mut_14_4_63_0;
  reg [63:0] mut_14_5_63_0;
  reg [63:0] mut_14_6_63_0;
  reg [63:0] mut_14_7_63_0;
  reg [63:0] mut_14_8_63_0;
  reg [63:0] mut_14_9_63_0;
  reg [63:0] mut_14_10_63_0;
  reg [63:0] mut_14_11_63_0;
  reg [63:0] mut_15_2_63_0;
  reg [63:0] mut_15_3_63_0;
  reg [63:0] mut_15_4_63_0;
  reg [63:0] mut_15_5_63_0;
  reg [63:0] mut_15_6_63_0;
  reg [63:0] mut_15_7_63_0;
  reg [63:0] mut_15_8_63_0;
  reg [63:0] mut_15_9_63_0;
  reg [63:0] mut_15_10_63_0;
  reg [63:0] mut_15_11_63_0;
  reg [63:0] mut_16_2_63_0;
  reg [63:0] mut_16_3_63_0;
  reg [63:0] mut_16_4_63_0;
  reg [63:0] mut_16_5_63_0;
  reg [63:0] mut_16_6_63_0;
  reg [63:0] mut_16_7_63_0;
  reg [63:0] mut_16_8_63_0;
  reg [63:0] mut_16_9_63_0;
  reg [63:0] mut_16_10_63_0;
  reg [63:0] mut_16_11_63_0;
  reg [63:0] mut_17_2_63_0;
  reg [63:0] mut_17_3_63_0;
  reg [63:0] mut_17_4_63_0;
  reg [63:0] mut_17_5_63_0;
  reg [63:0] mut_17_6_63_0;
  reg [63:0] mut_17_7_63_0;
  reg [63:0] mut_17_8_63_0;
  reg [63:0] mut_17_9_63_0;
  reg [63:0] mut_17_10_63_0;
  reg [63:0] mut_17_11_63_0;
  reg [63:0] mut_18_2_63_0;
  reg [63:0] mut_18_3_63_0;
  reg [63:0] mut_18_4_63_0;
  reg [63:0] mut_18_5_63_0;
  reg [63:0] mut_18_6_63_0;
  reg [63:0] mut_18_7_63_0;
  reg [63:0] mut_18_8_63_0;
  reg [63:0] mut_18_9_63_0;
  reg [63:0] mut_18_10_63_0;
  reg [63:0] mut_18_11_63_0;
  reg [63:0] mut_19_2_63_0;
  reg [63:0] mut_19_3_63_0;
  reg [63:0] mut_19_4_63_0;
  reg [63:0] mut_19_5_63_0;
  reg [63:0] mut_19_6_63_0;
  reg [63:0] mut_19_7_63_0;
  reg [63:0] mut_19_8_63_0;
  reg [63:0] mut_19_9_63_0;
  reg [63:0] mut_19_10_63_0;
  reg [63:0] mut_19_11_63_0;
  reg [63:0] mut_20_2_63_0;
  reg [63:0] mut_20_3_63_0;
  reg [63:0] mut_20_4_63_0;
  reg [63:0] mut_20_5_63_0;
  reg [63:0] mut_20_6_63_0;
  reg [63:0] mut_20_7_63_0;
  reg [63:0] mut_20_8_63_0;
  reg [63:0] mut_20_9_63_0;
  reg [63:0] mut_20_10_63_0;
  reg [63:0] mut_20_11_63_0;
  reg [63:0] mut_21_2_63_0;
  reg [63:0] mut_21_3_63_0;
  reg [63:0] mut_21_4_63_0;
  reg [63:0] mut_21_5_63_0;
  reg [63:0] mut_21_6_63_0;
  reg [63:0] mut_21_7_63_0;
  reg [63:0] mut_21_8_63_0;
  reg [63:0] mut_21_9_63_0;
  reg [63:0] mut_21_10_63_0;
  reg [63:0] mut_21_11_63_0;
  reg [63:0] mut_22_2_63_0;
  reg [63:0] mut_22_3_63_0;
  reg [63:0] mut_22_4_63_0;
  reg [63:0] mut_22_5_63_0;
  reg [63:0] mut_22_6_63_0;
  reg [63:0] mut_22_7_63_0;
  reg [63:0] mut_22_8_63_0;
  reg [63:0] mut_22_9_63_0;
  reg [63:0] mut_22_10_63_0;
  reg [63:0] mut_22_11_63_0;
  reg [63:0] mut_23_2_63_0;
  reg [63:0] mut_23_3_63_0;
  reg [63:0] mut_23_4_63_0;
  reg [63:0] mut_23_5_63_0;
  reg [63:0] mut_23_6_63_0;
  reg [63:0] mut_23_7_63_0;
  reg [63:0] mut_23_8_63_0;
  reg [63:0] mut_23_9_63_0;
  reg [63:0] mut_23_10_63_0;
  reg [63:0] mut_23_11_63_0;
  reg [1:0] rem_12cyc_st_11_3_2;
  reg [1:0] rem_12cyc_st_11_1_0;
  wire [63:0] result_sva_duc_mx0;
  wire COMP_LOOP_and_26_cse;
  wire COMP_LOOP_and_28_cse;
  wire COMP_LOOP_and_30_cse;
  wire COMP_LOOP_and_32_cse;
  wire COMP_LOOP_and_34_cse;
  wire COMP_LOOP_and_36_cse;
  wire COMP_LOOP_and_38_cse;
  wire COMP_LOOP_and_40_cse;
  wire COMP_LOOP_and_42_cse;
  wire COMP_LOOP_and_44_cse;
  wire COMP_LOOP_and_46_cse;
  wire COMP_LOOP_and_48_cse;
  wire COMP_LOOP_and_50_cse;
  wire COMP_LOOP_and_52_cse;
  wire COMP_LOOP_and_54_cse;
  wire COMP_LOOP_and_56_cse;
  wire COMP_LOOP_and_58_cse;
  wire COMP_LOOP_and_60_cse;
  wire COMP_LOOP_and_62_cse;
  wire COMP_LOOP_and_64_cse;
  wire COMP_LOOP_and_66_cse;
  wire COMP_LOOP_and_68_cse;
  wire COMP_LOOP_and_70_cse;
  wire COMP_LOOP_and_72_cse;
  wire COMP_LOOP_and_74_cse;
  wire COMP_LOOP_and_76_cse;
  wire COMP_LOOP_and_78_cse;
  wire COMP_LOOP_and_80_cse;
  wire COMP_LOOP_and_82_cse;
  wire COMP_LOOP_and_84_cse;
  wire COMP_LOOP_and_86_cse;
  wire COMP_LOOP_and_88_cse;
  wire COMP_LOOP_and_90_cse;
  wire COMP_LOOP_and_92_cse;
  wire COMP_LOOP_and_94_cse;
  wire COMP_LOOP_and_96_cse;
  wire COMP_LOOP_and_98_cse;
  wire COMP_LOOP_and_100_cse;
  wire COMP_LOOP_and_102_cse;
  wire COMP_LOOP_and_104_cse;
  wire COMP_LOOP_and_106_cse;
  wire COMP_LOOP_and_108_cse;
  wire COMP_LOOP_and_110_cse;
  wire COMP_LOOP_and_112_cse;
  wire COMP_LOOP_and_114_cse;
  wire COMP_LOOP_and_116_cse;
  wire COMP_LOOP_and_118_cse;
  wire COMP_LOOP_and_120_cse;
  wire COMP_LOOP_and_122_cse;
  wire COMP_LOOP_and_124_cse;
  wire COMP_LOOP_and_126_cse;
  wire COMP_LOOP_and_128_cse;
  wire COMP_LOOP_and_130_cse;
  wire COMP_LOOP_and_132_cse;
  wire COMP_LOOP_and_134_cse;
  wire COMP_LOOP_and_136_cse;
  wire COMP_LOOP_and_138_cse;
  wire COMP_LOOP_and_140_cse;
  wire COMP_LOOP_and_142_cse;
  wire COMP_LOOP_and_144_cse;
  wire COMP_LOOP_and_146_cse;
  wire COMP_LOOP_and_148_cse;
  wire COMP_LOOP_and_150_cse;
  wire COMP_LOOP_and_152_cse;
  wire COMP_LOOP_and_154_cse;
  wire COMP_LOOP_and_156_cse;
  wire COMP_LOOP_and_158_cse;
  wire COMP_LOOP_and_160_cse;
  wire COMP_LOOP_and_162_cse;
  wire COMP_LOOP_and_164_cse;
  wire COMP_LOOP_and_166_cse;
  wire COMP_LOOP_and_168_cse;
  wire COMP_LOOP_and_170_cse;
  wire COMP_LOOP_and_172_cse;
  wire COMP_LOOP_and_174_cse;
  wire COMP_LOOP_and_176_cse;
  wire COMP_LOOP_and_178_cse;
  wire COMP_LOOP_and_180_cse;
  wire COMP_LOOP_and_182_cse;
  wire COMP_LOOP_and_184_cse;
  wire COMP_LOOP_and_186_cse;
  wire COMP_LOOP_and_188_cse;
  wire COMP_LOOP_and_190_cse;
  wire COMP_LOOP_and_192_cse;
  wire COMP_LOOP_and_194_cse;
  wire COMP_LOOP_and_196_cse;
  wire COMP_LOOP_and_198_cse;
  wire COMP_LOOP_and_200_cse;
  wire COMP_LOOP_and_202_cse;
  wire COMP_LOOP_and_204_cse;
  wire COMP_LOOP_and_206_cse;
  wire COMP_LOOP_and_208_cse;
  wire COMP_LOOP_and_210_cse;
  wire COMP_LOOP_and_212_cse;
  wire COMP_LOOP_and_214_cse;
  wire COMP_LOOP_and_216_cse;
  wire COMP_LOOP_and_218_cse;
  wire COMP_LOOP_and_220_cse;
  wire COMP_LOOP_and_222_cse;
  wire COMP_LOOP_and_224_cse;
  wire COMP_LOOP_and_226_cse;
  wire COMP_LOOP_and_228_cse;
  wire COMP_LOOP_and_230_cse;
  wire COMP_LOOP_and_232_cse;
  wire COMP_LOOP_and_234_cse;
  wire COMP_LOOP_and_236_cse;
  wire COMP_LOOP_and_238_cse;
  wire COMP_LOOP_and_240_cse;
  wire COMP_LOOP_and_242_cse;
  wire COMP_LOOP_and_244_cse;
  wire COMP_LOOP_and_246_cse;
  wire COMP_LOOP_and_248_cse;
  wire COMP_LOOP_and_250_cse;
  wire COMP_LOOP_and_252_cse;
  wire COMP_LOOP_and_254_cse;
  wire COMP_LOOP_and_256_cse;
  wire COMP_LOOP_and_258_cse;
  wire COMP_LOOP_and_260_cse;
  wire COMP_LOOP_and_262_cse;
  wire COMP_LOOP_and_264_cse;
  wire COMP_LOOP_and_266_cse;
  wire COMP_LOOP_and_268_cse;
  wire COMP_LOOP_and_270_cse;
  wire COMP_LOOP_and_272_cse;
  wire COMP_LOOP_and_274_cse;
  wire COMP_LOOP_and_276_cse;
  wire COMP_LOOP_and_278_cse;
  wire COMP_LOOP_and_280_cse;
  wire COMP_LOOP_and_282_cse;
  wire COMP_LOOP_and_284_cse;
  wire COMP_LOOP_and_286_cse;

  wire[63:0] qelse_acc_nl;
  wire[64:0] nl_qelse_acc_nl;
  wire[0:0] mux_11_nl;
  wire[0:0] mux_10_nl;
  wire[0:0] mux_9_nl;
  wire[0:0] mux_8_nl;
  wire[0:0] mux_7_nl;
  wire[0:0] mux_6_nl;
  wire[0:0] mux_5_nl;
  wire[0:0] mux_4_nl;
  wire[0:0] mux_3_nl;
  wire[0:0] mux_2_nl;
  wire[0:0] mux_1_nl;
  wire[0:0] mux_nl;
  wire[0:0] and_273_nl;
  wire[0:0] and_275_nl;
  wire[0:0] and_277_nl;
  wire[0:0] and_279_nl;
  wire[0:0] and_281_nl;
  wire[0:0] and_282_nl;
  wire[0:0] and_283_nl;
  wire[0:0] and_284_nl;
  wire[0:0] and_286_nl;
  wire[0:0] and_287_nl;
  wire[0:0] and_288_nl;
  wire[0:0] and_289_nl;
  wire[0:0] and_290_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_xor_nl;
  wire[0:0] COMP_LOOP_nor_nl;
  wire[0:0] mux_12_nl;
  wire[0:0] nor_nl;
  wire[0:0] mux_13_nl;
  wire[0:0] nor_516_nl;
  wire[0:0] mux_14_nl;
  wire[0:0] nor_515_nl;
  wire[0:0] mux_15_nl;
  wire[0:0] nor_514_nl;
  wire[0:0] mux_16_nl;
  wire[0:0] nor_513_nl;
  wire[0:0] mux_17_nl;
  wire[0:0] nor_511_nl;
  wire[0:0] mux_18_nl;
  wire[0:0] nor_512_nl;
  wire[0:0] nor_508_nl;
  wire[0:0] mux_20_nl;
  wire[0:0] nor_509_nl;
  wire[0:0] mux_21_nl;
  wire[0:0] nor_510_nl;
  wire[0:0] nor_504_nl;
  wire[0:0] nor_505_nl;
  wire[0:0] mux_24_nl;
  wire[0:0] nor_506_nl;
  wire[0:0] mux_25_nl;
  wire[0:0] nor_507_nl;
  wire[0:0] nor_499_nl;
  wire[0:0] or_61_nl;
  wire[0:0] nor_500_nl;
  wire[0:0] nor_501_nl;
  wire[0:0] mux_29_nl;
  wire[0:0] nor_502_nl;
  wire[0:0] mux_30_nl;
  wire[0:0] nor_503_nl;
  wire[0:0] mux_31_nl;
  wire[0:0] nor_498_nl;
  wire[0:0] and_1168_nl;
  wire[0:0] mux_33_nl;
  wire[0:0] nor_497_nl;
  wire[0:0] and_1166_nl;
  wire[0:0] and_1167_nl;
  wire[0:0] mux_36_nl;
  wire[0:0] nor_496_nl;
  wire[0:0] and_1163_nl;
  wire[0:0] and_1164_nl;
  wire[0:0] and_1165_nl;
  wire[0:0] mux_40_nl;
  wire[0:0] nor_495_nl;
  wire[0:0] and_1159_nl;
  wire[0:0] and_1160_nl;
  wire[0:0] and_1161_nl;
  wire[0:0] and_1162_nl;
  wire[0:0] mux_45_nl;
  wire[0:0] nor_494_nl;
  wire[0:0] nor_492_nl;
  wire[0:0] and_1155_nl;
  wire[0:0] and_1156_nl;
  wire[0:0] and_1157_nl;
  wire[0:0] and_1158_nl;
  wire[0:0] mux_51_nl;
  wire[0:0] nor_493_nl;
  wire[0:0] nor_489_nl;
  wire[0:0] nor_490_nl;
  wire[0:0] and_1151_nl;
  wire[0:0] and_1152_nl;
  wire[0:0] and_1153_nl;
  wire[0:0] and_1154_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] nor_491_nl;
  wire[0:0] nor_485_nl;
  wire[0:0] nor_486_nl;
  wire[0:0] nor_487_nl;
  wire[0:0] and_1147_nl;
  wire[0:0] and_1148_nl;
  wire[0:0] and_1149_nl;
  wire[0:0] and_1150_nl;
  wire[0:0] mux_66_nl;
  wire[0:0] nor_488_nl;
  wire[0:0] nor_480_nl;
  wire[0:0] or_165_nl;
  wire[0:0] nor_481_nl;
  wire[0:0] nor_482_nl;
  wire[0:0] nor_483_nl;
  wire[0:0] and_1143_nl;
  wire[0:0] and_1144_nl;
  wire[0:0] and_1145_nl;
  wire[0:0] and_1146_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] nor_484_nl;
  wire[0:0] nor_479_nl;
  wire[0:0] or_175_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] nor_478_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] nor_477_nl;
  wire[0:0] mux_79_nl;
  wire[0:0] nor_476_nl;
  wire[0:0] mux_80_nl;
  wire[0:0] nor_475_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] nor_474_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] nor_472_nl;
  wire[0:0] mux_83_nl;
  wire[0:0] nor_473_nl;
  wire[0:0] nor_469_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] nor_470_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] nor_471_nl;
  wire[0:0] nor_465_nl;
  wire[0:0] nor_466_nl;
  wire[0:0] mux_89_nl;
  wire[0:0] nor_467_nl;
  wire[0:0] mux_90_nl;
  wire[0:0] nor_468_nl;
  wire[0:0] nor_460_nl;
  wire[0:0] or_250_nl;
  wire[0:0] nor_461_nl;
  wire[0:0] nor_462_nl;
  wire[0:0] mux_94_nl;
  wire[0:0] nor_463_nl;
  wire[0:0] mux_95_nl;
  wire[0:0] nor_464_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] nor_459_nl;
  wire[0:0] and_1142_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] nor_458_nl;
  wire[0:0] and_1140_nl;
  wire[0:0] and_1141_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] nor_457_nl;
  wire[0:0] and_1137_nl;
  wire[0:0] and_1138_nl;
  wire[0:0] and_1139_nl;
  wire[0:0] mux_105_nl;
  wire[0:0] nor_456_nl;
  wire[0:0] and_1133_nl;
  wire[0:0] and_1134_nl;
  wire[0:0] and_1135_nl;
  wire[0:0] and_1136_nl;
  wire[0:0] mux_110_nl;
  wire[0:0] nor_455_nl;
  wire[0:0] nor_453_nl;
  wire[0:0] and_1129_nl;
  wire[0:0] and_1130_nl;
  wire[0:0] and_1131_nl;
  wire[0:0] and_1132_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] nor_454_nl;
  wire[0:0] nor_450_nl;
  wire[0:0] nor_451_nl;
  wire[0:0] and_1125_nl;
  wire[0:0] and_1126_nl;
  wire[0:0] and_1127_nl;
  wire[0:0] and_1128_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] nor_452_nl;
  wire[0:0] nor_446_nl;
  wire[0:0] nor_447_nl;
  wire[0:0] nor_448_nl;
  wire[0:0] and_1121_nl;
  wire[0:0] and_1122_nl;
  wire[0:0] and_1123_nl;
  wire[0:0] and_1124_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] nor_449_nl;
  wire[0:0] nor_441_nl;
  wire[0:0] or_352_nl;
  wire[0:0] nor_442_nl;
  wire[0:0] nor_443_nl;
  wire[0:0] nor_444_nl;
  wire[0:0] and_1117_nl;
  wire[0:0] and_1118_nl;
  wire[0:0] and_1119_nl;
  wire[0:0] and_1120_nl;
  wire[0:0] mux_140_nl;
  wire[0:0] nor_445_nl;
  wire[0:0] and_1116_nl;
  wire[0:0] or_362_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] and_1172_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] and_1114_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] and_1113_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] and_1112_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] and_1111_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] and_1109_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] and_1110_nl;
  wire[0:0] and_1106_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] and_1107_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] and_1108_nl;
  wire[0:0] and_1102_nl;
  wire[0:0] and_1103_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] and_1104_nl;
  wire[0:0] mux_155_nl;
  wire[0:0] and_1105_nl;
  wire[0:0] and_1097_nl;
  wire[0:0] or_437_nl;
  wire[0:0] and_1098_nl;
  wire[0:0] and_1099_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] and_1100_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] and_1101_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] and_1171_nl;
  wire[0:0] and_1094_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] and_1095_nl;
  wire[0:0] and_1091_nl;
  wire[0:0] and_1092_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] and_1093_nl;
  wire[0:0] and_1087_nl;
  wire[0:0] and_1088_nl;
  wire[0:0] and_1089_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] and_1090_nl;
  wire[0:0] and_1082_nl;
  wire[0:0] and_1083_nl;
  wire[0:0] and_1084_nl;
  wire[0:0] and_1085_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] and_1086_nl;
  wire[0:0] and_1076_nl;
  wire[0:0] and_1077_nl;
  wire[0:0] and_1078_nl;
  wire[0:0] and_1079_nl;
  wire[0:0] and_1080_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] and_1081_nl;
  wire[0:0] and_1069_nl;
  wire[0:0] and_1070_nl;
  wire[0:0] and_1071_nl;
  wire[0:0] and_1072_nl;
  wire[0:0] and_1073_nl;
  wire[0:0] and_1074_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] and_1075_nl;
  wire[0:0] and_1061_nl;
  wire[0:0] and_1062_nl;
  wire[0:0] and_1063_nl;
  wire[0:0] and_1064_nl;
  wire[0:0] and_1065_nl;
  wire[0:0] and_1066_nl;
  wire[0:0] and_1067_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] and_1068_nl;
  wire[0:0] and_1052_nl;
  wire[0:0] or_540_nl;
  wire[0:0] and_1053_nl;
  wire[0:0] and_1054_nl;
  wire[0:0] and_1055_nl;
  wire[0:0] and_1056_nl;
  wire[0:0] and_1057_nl;
  wire[0:0] and_1058_nl;
  wire[0:0] and_1059_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] and_1060_nl;
  wire[0:0] nor_438_nl;
  wire[0:0] or_550_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] and_1170_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] and_1050_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] and_1049_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] and_1048_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] and_1047_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] and_1045_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] and_1046_nl;
  wire[0:0] and_1042_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] and_1043_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] and_1044_nl;
  wire[0:0] and_1038_nl;
  wire[0:0] and_1039_nl;
  wire[0:0] mux_219_nl;
  wire[0:0] and_1040_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] and_1041_nl;
  wire[0:0] and_1033_nl;
  wire[0:0] or_624_nl;
  wire[0:0] and_1034_nl;
  wire[0:0] and_1035_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] and_1036_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] and_1037_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] and_1169_nl;
  wire[0:0] and_1030_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] and_1031_nl;
  wire[0:0] and_1027_nl;
  wire[0:0] and_1028_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] and_1029_nl;
  wire[0:0] and_1023_nl;
  wire[0:0] and_1024_nl;
  wire[0:0] and_1025_nl;
  wire[0:0] mux_235_nl;
  wire[0:0] and_1026_nl;
  wire[0:0] and_1018_nl;
  wire[0:0] and_1019_nl;
  wire[0:0] and_1020_nl;
  wire[0:0] and_1021_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] and_1022_nl;
  wire[0:0] and_1012_nl;
  wire[0:0] and_1013_nl;
  wire[0:0] and_1014_nl;
  wire[0:0] and_1015_nl;
  wire[0:0] and_1016_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] and_1017_nl;
  wire[0:0] and_1005_nl;
  wire[0:0] and_1006_nl;
  wire[0:0] and_1007_nl;
  wire[0:0] and_1008_nl;
  wire[0:0] and_1009_nl;
  wire[0:0] and_1010_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] and_1011_nl;
  wire[0:0] and_997_nl;
  wire[0:0] and_998_nl;
  wire[0:0] and_999_nl;
  wire[0:0] and_1000_nl;
  wire[0:0] and_1001_nl;
  wire[0:0] and_1002_nl;
  wire[0:0] and_1003_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] and_1004_nl;
  wire[0:0] and_988_nl;
  wire[0:0] or_725_nl;
  wire[0:0] and_989_nl;
  wire[0:0] and_990_nl;
  wire[0:0] and_991_nl;
  wire[0:0] and_992_nl;
  wire[0:0] and_993_nl;
  wire[0:0] and_994_nl;
  wire[0:0] and_995_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] and_996_nl;
  wire[0:0] and_987_nl;
  wire[0:0] or_735_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] nor_435_nl;
  wire[0:0] mux_273_nl;
  wire[0:0] nor_434_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] nor_433_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] nor_432_nl;
  wire[0:0] mux_276_nl;
  wire[0:0] nor_431_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] nor_429_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] nor_430_nl;
  wire[0:0] nor_426_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] nor_427_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] nor_428_nl;
  wire[0:0] nor_422_nl;
  wire[0:0] nor_423_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] nor_424_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] nor_425_nl;
  wire[0:0] nor_417_nl;
  wire[0:0] or_808_nl;
  wire[0:0] nor_418_nl;
  wire[0:0] nor_419_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] nor_420_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] nor_421_nl;
  wire[0:0] nor_408_nl;
  wire[0:0] or_823_nl;
  wire[0:0] nor_409_nl;
  wire[0:0] or_822_nl;
  wire[0:0] nor_410_nl;
  wire[0:0] or_821_nl;
  wire[0:0] nor_411_nl;
  wire[0:0] or_820_nl;
  wire[0:0] nor_412_nl;
  wire[0:0] or_819_nl;
  wire[0:0] nor_413_nl;
  wire[0:0] or_818_nl;
  wire[0:0] nor_414_nl;
  wire[0:0] or_817_nl;
  wire[0:0] nor_415_nl;
  wire[0:0] or_816_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] nor_416_nl;
  wire[0:0] or_815_nl;
  wire[0:0] mux_300_nl;
  wire[0:0] nor_407_nl;
  wire[0:0] and_986_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] nor_406_nl;
  wire[0:0] and_984_nl;
  wire[0:0] and_985_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] nor_405_nl;
  wire[0:0] and_981_nl;
  wire[0:0] and_982_nl;
  wire[0:0] and_983_nl;
  wire[0:0] mux_309_nl;
  wire[0:0] nor_404_nl;
  wire[0:0] and_977_nl;
  wire[0:0] and_978_nl;
  wire[0:0] and_979_nl;
  wire[0:0] and_980_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] nor_403_nl;
  wire[0:0] nor_401_nl;
  wire[0:0] and_973_nl;
  wire[0:0] and_974_nl;
  wire[0:0] and_975_nl;
  wire[0:0] and_976_nl;
  wire[0:0] mux_320_nl;
  wire[0:0] nor_402_nl;
  wire[0:0] nor_398_nl;
  wire[0:0] nor_399_nl;
  wire[0:0] and_969_nl;
  wire[0:0] and_970_nl;
  wire[0:0] and_971_nl;
  wire[0:0] and_972_nl;
  wire[0:0] mux_327_nl;
  wire[0:0] nor_400_nl;
  wire[0:0] nor_394_nl;
  wire[0:0] nor_395_nl;
  wire[0:0] nor_396_nl;
  wire[0:0] and_965_nl;
  wire[0:0] and_966_nl;
  wire[0:0] and_967_nl;
  wire[0:0] and_968_nl;
  wire[0:0] mux_335_nl;
  wire[0:0] nor_397_nl;
  wire[0:0] nor_389_nl;
  wire[0:0] or_919_nl;
  wire[0:0] nor_390_nl;
  wire[0:0] nor_391_nl;
  wire[0:0] nor_392_nl;
  wire[0:0] and_961_nl;
  wire[0:0] and_962_nl;
  wire[0:0] and_963_nl;
  wire[0:0] and_964_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] nor_393_nl;
  wire[0:0] nor_379_nl;
  wire[0:0] or_938_nl;
  wire[0:0] nor_380_nl;
  wire[0:0] or_937_nl;
  wire[0:0] nor_381_nl;
  wire[0:0] or_936_nl;
  wire[0:0] nor_382_nl;
  wire[0:0] or_935_nl;
  wire[0:0] nor_383_nl;
  wire[0:0] or_934_nl;
  wire[0:0] nor_384_nl;
  wire[0:0] or_933_nl;
  wire[0:0] nor_385_nl;
  wire[0:0] or_932_nl;
  wire[0:0] nor_386_nl;
  wire[0:0] or_931_nl;
  wire[0:0] nor_387_nl;
  wire[0:0] or_930_nl;
  wire[0:0] nor_388_nl;
  wire[0:0] or_929_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] nor_378_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] nor_377_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] nor_376_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] nor_375_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] nor_374_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] nor_372_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] nor_373_nl;
  wire[0:0] nor_369_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] nor_370_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] nor_371_nl;
  wire[0:0] nor_365_nl;
  wire[0:0] nor_366_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] nor_367_nl;
  wire[0:0] mux_368_nl;
  wire[0:0] nor_368_nl;
  wire[0:0] nor_360_nl;
  wire[0:0] or_1012_nl;
  wire[0:0] nor_361_nl;
  wire[0:0] nor_362_nl;
  wire[0:0] mux_372_nl;
  wire[0:0] nor_363_nl;
  wire[0:0] mux_373_nl;
  wire[0:0] nor_364_nl;
  wire[0:0] nor_351_nl;
  wire[0:0] or_1027_nl;
  wire[0:0] nor_352_nl;
  wire[0:0] or_1026_nl;
  wire[0:0] nor_353_nl;
  wire[0:0] or_1025_nl;
  wire[0:0] nor_354_nl;
  wire[0:0] or_1024_nl;
  wire[0:0] nor_355_nl;
  wire[0:0] or_1023_nl;
  wire[0:0] nor_356_nl;
  wire[0:0] or_1022_nl;
  wire[0:0] nor_357_nl;
  wire[0:0] or_1021_nl;
  wire[0:0] nor_358_nl;
  wire[0:0] or_1020_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] nor_359_nl;
  wire[0:0] or_1019_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] nor_350_nl;
  wire[0:0] and_960_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] nor_349_nl;
  wire[0:0] and_958_nl;
  wire[0:0] and_959_nl;
  wire[0:0] mux_388_nl;
  wire[0:0] nor_348_nl;
  wire[0:0] and_955_nl;
  wire[0:0] and_956_nl;
  wire[0:0] and_957_nl;
  wire[0:0] mux_392_nl;
  wire[0:0] nor_347_nl;
  wire[0:0] and_951_nl;
  wire[0:0] and_952_nl;
  wire[0:0] and_953_nl;
  wire[0:0] and_954_nl;
  wire[0:0] mux_397_nl;
  wire[0:0] nor_346_nl;
  wire[0:0] nor_344_nl;
  wire[0:0] and_947_nl;
  wire[0:0] and_948_nl;
  wire[0:0] and_949_nl;
  wire[0:0] and_950_nl;
  wire[0:0] mux_403_nl;
  wire[0:0] nor_345_nl;
  wire[0:0] nor_341_nl;
  wire[0:0] nor_342_nl;
  wire[0:0] and_943_nl;
  wire[0:0] and_944_nl;
  wire[0:0] and_945_nl;
  wire[0:0] and_946_nl;
  wire[0:0] mux_410_nl;
  wire[0:0] nor_343_nl;
  wire[0:0] nor_337_nl;
  wire[0:0] nor_338_nl;
  wire[0:0] nor_339_nl;
  wire[0:0] and_939_nl;
  wire[0:0] and_940_nl;
  wire[0:0] and_941_nl;
  wire[0:0] and_942_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] nor_340_nl;
  wire[0:0] nor_332_nl;
  wire[0:0] nand_12_nl;
  wire[0:0] nor_333_nl;
  wire[0:0] nor_334_nl;
  wire[0:0] nor_335_nl;
  wire[0:0] and_935_nl;
  wire[0:0] and_936_nl;
  wire[0:0] and_937_nl;
  wire[0:0] and_938_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] nor_336_nl;
  wire[0:0] nor_323_nl;
  wire[0:0] nand_1_nl;
  wire[0:0] nor_324_nl;
  wire[0:0] nand_2_nl;
  wire[0:0] nor_325_nl;
  wire[0:0] nand_3_nl;
  wire[0:0] nor_326_nl;
  wire[0:0] nand_4_nl;
  wire[0:0] nor_327_nl;
  wire[0:0] nand_5_nl;
  wire[0:0] nor_328_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] nor_329_nl;
  wire[0:0] nand_7_nl;
  wire[0:0] nor_330_nl;
  wire[0:0] nand_8_nl;
  wire[0:0] nor_331_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] and_934_nl;
  wire[0:0] nand_11_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [64:0] nl_rem_12_cmp_a;
  assign nl_rem_12_cmp_a = {{1{rem_12_cmp_a_63_0[63]}}, rem_12_cmp_a_63_0};
  wire [64:0] nl_rem_12_cmp_b;
  assign nl_rem_12_cmp_b = {1'b0 , rem_12_cmp_b_63_0};
  wire [64:0] nl_rem_12_cmp_1_a;
  assign nl_rem_12_cmp_1_a = {{1{rem_12_cmp_1_a_63_0[63]}}, rem_12_cmp_1_a_63_0};
  wire [64:0] nl_rem_12_cmp_1_b;
  assign nl_rem_12_cmp_1_b = {1'b0 , rem_12_cmp_1_b_63_0};
  wire [64:0] nl_rem_12_cmp_2_a;
  assign nl_rem_12_cmp_2_a = {{1{rem_12_cmp_2_a_63_0[63]}}, rem_12_cmp_2_a_63_0};
  wire [64:0] nl_rem_12_cmp_2_b;
  assign nl_rem_12_cmp_2_b = {1'b0 , rem_12_cmp_2_b_63_0};
  wire [64:0] nl_rem_12_cmp_3_a;
  assign nl_rem_12_cmp_3_a = {{1{rem_12_cmp_3_a_63_0[63]}}, rem_12_cmp_3_a_63_0};
  wire [64:0] nl_rem_12_cmp_3_b;
  assign nl_rem_12_cmp_3_b = {1'b0 , rem_12_cmp_3_b_63_0};
  wire [64:0] nl_rem_12_cmp_4_a;
  assign nl_rem_12_cmp_4_a = {{1{rem_12_cmp_4_a_63_0[63]}}, rem_12_cmp_4_a_63_0};
  wire [64:0] nl_rem_12_cmp_4_b;
  assign nl_rem_12_cmp_4_b = {1'b0 , rem_12_cmp_4_b_63_0};
  wire [64:0] nl_rem_12_cmp_5_a;
  assign nl_rem_12_cmp_5_a = {{1{rem_12_cmp_5_a_63_0[63]}}, rem_12_cmp_5_a_63_0};
  wire [64:0] nl_rem_12_cmp_5_b;
  assign nl_rem_12_cmp_5_b = {1'b0 , rem_12_cmp_5_b_63_0};
  wire [64:0] nl_rem_12_cmp_6_a;
  assign nl_rem_12_cmp_6_a = {{1{rem_12_cmp_6_a_63_0[63]}}, rem_12_cmp_6_a_63_0};
  wire [64:0] nl_rem_12_cmp_6_b;
  assign nl_rem_12_cmp_6_b = {1'b0 , rem_12_cmp_6_b_63_0};
  wire [64:0] nl_rem_12_cmp_7_a;
  assign nl_rem_12_cmp_7_a = {{1{rem_12_cmp_7_a_63_0[63]}}, rem_12_cmp_7_a_63_0};
  wire [64:0] nl_rem_12_cmp_7_b;
  assign nl_rem_12_cmp_7_b = {1'b0 , rem_12_cmp_7_b_63_0};
  wire [64:0] nl_rem_12_cmp_8_a;
  assign nl_rem_12_cmp_8_a = {{1{rem_12_cmp_8_a_63_0[63]}}, rem_12_cmp_8_a_63_0};
  wire [64:0] nl_rem_12_cmp_8_b;
  assign nl_rem_12_cmp_8_b = {1'b0 , rem_12_cmp_8_b_63_0};
  wire [64:0] nl_rem_12_cmp_9_a;
  assign nl_rem_12_cmp_9_a = {{1{rem_12_cmp_9_a_63_0[63]}}, rem_12_cmp_9_a_63_0};
  wire [64:0] nl_rem_12_cmp_9_b;
  assign nl_rem_12_cmp_9_b = {1'b0 , rem_12_cmp_9_b_63_0};
  wire [64:0] nl_rem_12_cmp_10_a;
  assign nl_rem_12_cmp_10_a = {{1{rem_12_cmp_10_a_63_0[63]}}, rem_12_cmp_10_a_63_0};
  wire [64:0] nl_rem_12_cmp_10_b;
  assign nl_rem_12_cmp_10_b = {1'b0 , rem_12_cmp_10_b_63_0};
  wire [64:0] nl_rem_12_cmp_11_a;
  assign nl_rem_12_cmp_11_a = {{1{rem_12_cmp_11_a_63_0[63]}}, rem_12_cmp_11_a_63_0};
  wire [64:0] nl_rem_12_cmp_11_b;
  assign nl_rem_12_cmp_11_b = {1'b0 , rem_12_cmp_11_b_63_0};
  ccs_in_v1 #(.rscid(32'sd1),
  .width(32'sd64)) base_rsci (
      .dat(base_rsc_dat),
      .idat(base_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd3),
  .width(32'sd64)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  ccs_in_v1 #(.rscid(32'sd8),
  .width(32'sd1)) ccs_ccore_start_rsci (
      .dat(ccs_ccore_start_rsc_dat),
      .idat(ccs_ccore_start_rsci_idat)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp (
      .a(nl_rem_12_cmp_a[64:0]),
      .b(nl_rem_12_cmp_b[64:0]),
      .z(rem_12_cmp_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_1 (
      .a(nl_rem_12_cmp_1_a[64:0]),
      .b(nl_rem_12_cmp_1_b[64:0]),
      .z(rem_12_cmp_1_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_2 (
      .a(nl_rem_12_cmp_2_a[64:0]),
      .b(nl_rem_12_cmp_2_b[64:0]),
      .z(rem_12_cmp_2_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_3 (
      .a(nl_rem_12_cmp_3_a[64:0]),
      .b(nl_rem_12_cmp_3_b[64:0]),
      .z(rem_12_cmp_3_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_4 (
      .a(nl_rem_12_cmp_4_a[64:0]),
      .b(nl_rem_12_cmp_4_b[64:0]),
      .z(rem_12_cmp_4_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_5 (
      .a(nl_rem_12_cmp_5_a[64:0]),
      .b(nl_rem_12_cmp_5_b[64:0]),
      .z(rem_12_cmp_5_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_6 (
      .a(nl_rem_12_cmp_6_a[64:0]),
      .b(nl_rem_12_cmp_6_b[64:0]),
      .z(rem_12_cmp_6_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_7 (
      .a(nl_rem_12_cmp_7_a[64:0]),
      .b(nl_rem_12_cmp_7_b[64:0]),
      .z(rem_12_cmp_7_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_8 (
      .a(nl_rem_12_cmp_8_a[64:0]),
      .b(nl_rem_12_cmp_8_b[64:0]),
      .z(rem_12_cmp_8_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_9 (
      .a(nl_rem_12_cmp_9_a[64:0]),
      .b(nl_rem_12_cmp_9_b[64:0]),
      .z(rem_12_cmp_9_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_10 (
      .a(nl_rem_12_cmp_10_a[64:0]),
      .b(nl_rem_12_cmp_10_b[64:0]),
      .z(rem_12_cmp_10_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_12_cmp_11 (
      .a(nl_rem_12_cmp_11_a[64:0]),
      .b(nl_rem_12_cmp_11_b[64:0]),
      .z(rem_12_cmp_11_z)
    );
  assign COMP_LOOP_and_26_cse = ccs_ccore_en & main_stage_0_12 & COMP_LOOP_asn_itm_11;
  assign COMP_LOOP_and_cse = ccs_ccore_en & (and_dcpl_294 | and_dcpl_300 | and_dcpl_306
      | and_dcpl_312 | and_dcpl_318 | and_dcpl_324 | and_dcpl_330 | and_dcpl_336
      | and_dcpl_342 | and_dcpl_348 | and_tmp_35);
  assign COMP_LOOP_and_2_cse = ccs_ccore_en & (and_dcpl_356 | and_dcpl_360 | and_dcpl_364
      | and_dcpl_368 | and_dcpl_372 | and_dcpl_376 | and_dcpl_379 | and_dcpl_382
      | and_dcpl_385 | and_dcpl_388 | mux_tmp_76);
  assign COMP_LOOP_and_4_cse = ccs_ccore_en & (and_dcpl_394 | and_dcpl_397 | and_dcpl_400
      | and_dcpl_403 | and_dcpl_406 | and_dcpl_409 | and_dcpl_413 | and_dcpl_417
      | and_dcpl_421 | and_dcpl_425 | and_tmp_80);
  assign COMP_LOOP_and_6_cse = ccs_ccore_en & (and_dcpl_431 | and_dcpl_433 | and_dcpl_435
      | and_dcpl_437 | and_dcpl_439 | and_dcpl_442 | and_dcpl_445 | and_dcpl_448
      | and_dcpl_451 | and_dcpl_454 | mux_tmp_141);
  assign COMP_LOOP_and_8_cse = ccs_ccore_en & (and_dcpl_461 | and_dcpl_465 | and_dcpl_469
      | and_dcpl_473 | and_dcpl_477 | and_dcpl_480 | and_dcpl_483 | and_dcpl_486
      | and_dcpl_489 | and_dcpl_492 | and_tmp_125);
  assign COMP_LOOP_and_10_cse = ccs_ccore_en & (and_dcpl_498 | and_dcpl_500 | and_dcpl_502
      | and_dcpl_504 | and_dcpl_506 | and_dcpl_508 | and_dcpl_510 | and_dcpl_512
      | and_dcpl_514 | and_dcpl_516 | mux_tmp_206);
  assign COMP_LOOP_and_12_cse = ccs_ccore_en & (and_dcpl_520 | and_dcpl_523 | and_dcpl_526
      | and_dcpl_529 | and_dcpl_532 | and_dcpl_534 | and_dcpl_536 | and_dcpl_538
      | and_dcpl_540 | and_dcpl_542 | and_tmp_170);
  assign COMP_LOOP_and_14_cse = ccs_ccore_en & (and_dcpl_546 | and_dcpl_548 | and_dcpl_550
      | and_dcpl_552 | and_dcpl_554 | and_dcpl_556 | and_dcpl_558 | and_dcpl_560
      | and_dcpl_562 | and_dcpl_564 | mux_tmp_271);
  assign COMP_LOOP_and_16_cse = ccs_ccore_en & (and_dcpl_569 | and_dcpl_573 | and_dcpl_577
      | and_dcpl_581 | and_dcpl_585 | and_dcpl_589 | and_dcpl_593 | and_dcpl_597
      | and_dcpl_601 | and_dcpl_605 | and_tmp_206);
  assign COMP_LOOP_and_18_cse = ccs_ccore_en & (and_dcpl_610 | and_dcpl_612 | and_dcpl_614
      | and_dcpl_616 | and_dcpl_618 | and_dcpl_622 | and_dcpl_625 | and_dcpl_628
      | and_dcpl_631 | and_dcpl_634 | mux_tmp_354);
  assign COMP_LOOP_and_20_cse = ccs_ccore_en & (and_dcpl_638 | and_dcpl_641 | and_dcpl_644
      | and_dcpl_647 | and_dcpl_650 | and_dcpl_653 | and_dcpl_657 | and_dcpl_661
      | and_dcpl_665 | and_dcpl_669 | and_tmp_233);
  assign COMP_LOOP_and_22_cse = ccs_ccore_en & (and_dcpl_673 | and_dcpl_675 | and_dcpl_677
      | and_dcpl_679 | and_dcpl_681 | and_dcpl_684 | and_dcpl_687 | and_dcpl_690
      | and_dcpl_693 | and_dcpl_696 | mux_tmp_437);
  assign COMP_LOOP_and_28_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_2;
  assign COMP_LOOP_and_30_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_6;
  assign COMP_LOOP_and_32_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_9;
  assign COMP_LOOP_and_34_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_11;
  assign COMP_LOOP_and_36_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_2;
  assign COMP_LOOP_and_38_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_6;
  assign COMP_LOOP_and_40_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_9;
  assign COMP_LOOP_and_42_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_11;
  assign COMP_LOOP_and_44_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_18 & (~ (rem_12cyc_st_10_1_0[0]));
  assign COMP_LOOP_and_46_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_18 & (rem_12cyc_st_10_1_0[0]);
  assign COMP_LOOP_and_48_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_23 & (~ (rem_12cyc_st_10_1_0[0]));
  assign COMP_LOOP_and_50_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_23 & (rem_12cyc_st_10_1_0[0]);
  assign COMP_LOOP_and_52_cse = ccs_ccore_en & and_dcpl_3;
  assign COMP_LOOP_and_54_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_29;
  assign COMP_LOOP_and_56_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_33;
  assign COMP_LOOP_and_58_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_36;
  assign COMP_LOOP_and_60_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_38;
  assign COMP_LOOP_and_62_cse = ccs_ccore_en & and_dcpl_40 & and_dcpl_29;
  assign COMP_LOOP_and_64_cse = ccs_ccore_en & and_dcpl_40 & and_dcpl_33;
  assign COMP_LOOP_and_66_cse = ccs_ccore_en & and_dcpl_40 & and_dcpl_36;
  assign COMP_LOOP_and_68_cse = ccs_ccore_en & and_dcpl_40 & and_dcpl_38;
  assign COMP_LOOP_and_70_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_45 & (~ (rem_12cyc_st_9_1_0[0]));
  assign COMP_LOOP_and_72_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_45 & (rem_12cyc_st_9_1_0[0]);
  assign COMP_LOOP_and_74_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_50 & (~ (rem_12cyc_st_9_1_0[0]));
  assign COMP_LOOP_and_76_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_50 & (rem_12cyc_st_9_1_0[0]);
  assign COMP_LOOP_and_78_cse = ccs_ccore_en & and_dcpl_30;
  assign COMP_LOOP_and_80_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_56;
  assign COMP_LOOP_and_82_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_60;
  assign COMP_LOOP_and_84_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_63;
  assign COMP_LOOP_and_86_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_65;
  assign COMP_LOOP_and_88_cse = ccs_ccore_en & and_dcpl_67 & and_dcpl_56;
  assign COMP_LOOP_and_90_cse = ccs_ccore_en & and_dcpl_67 & and_dcpl_60;
  assign COMP_LOOP_and_92_cse = ccs_ccore_en & and_dcpl_67 & and_dcpl_63;
  assign COMP_LOOP_and_94_cse = ccs_ccore_en & and_dcpl_67 & and_dcpl_65;
  assign COMP_LOOP_and_96_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_72 & (~ (rem_12cyc_st_8_1_0[0]));
  assign COMP_LOOP_and_98_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_72 & (rem_12cyc_st_8_1_0[0]);
  assign COMP_LOOP_and_100_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_77 & (~ (rem_12cyc_st_8_1_0[0]));
  assign COMP_LOOP_and_102_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_77 & (rem_12cyc_st_8_1_0[0]);
  assign COMP_LOOP_and_104_cse = ccs_ccore_en & and_dcpl_57;
  assign COMP_LOOP_and_106_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_83;
  assign COMP_LOOP_and_108_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_87;
  assign COMP_LOOP_and_110_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_90;
  assign COMP_LOOP_and_112_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_92;
  assign COMP_LOOP_and_114_cse = ccs_ccore_en & and_dcpl_94 & and_dcpl_83;
  assign COMP_LOOP_and_116_cse = ccs_ccore_en & and_dcpl_94 & and_dcpl_87;
  assign COMP_LOOP_and_118_cse = ccs_ccore_en & and_dcpl_94 & and_dcpl_90;
  assign COMP_LOOP_and_120_cse = ccs_ccore_en & and_dcpl_94 & and_dcpl_92;
  assign COMP_LOOP_and_122_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_99 & (~ (rem_12cyc_st_7_1_0[0]));
  assign COMP_LOOP_and_124_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_99 & (rem_12cyc_st_7_1_0[0]);
  assign COMP_LOOP_and_126_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_104 & (~ (rem_12cyc_st_7_1_0[0]));
  assign COMP_LOOP_and_128_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_104 & (rem_12cyc_st_7_1_0[0]);
  assign COMP_LOOP_and_130_cse = ccs_ccore_en & and_dcpl_84;
  assign COMP_LOOP_and_132_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_110;
  assign COMP_LOOP_and_134_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_115;
  assign COMP_LOOP_and_136_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_117;
  assign COMP_LOOP_and_138_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_119;
  assign COMP_LOOP_and_140_cse = ccs_ccore_en & and_dcpl_121 & and_dcpl_110;
  assign COMP_LOOP_and_142_cse = ccs_ccore_en & and_dcpl_121 & and_dcpl_115;
  assign COMP_LOOP_and_144_cse = ccs_ccore_en & and_dcpl_121 & and_dcpl_117;
  assign COMP_LOOP_and_146_cse = ccs_ccore_en & and_dcpl_121 & and_dcpl_119;
  assign COMP_LOOP_and_148_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_126 & (~
      (rem_12cyc_st_6_1_0[1]));
  assign COMP_LOOP_and_150_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_129 & (~
      (rem_12cyc_st_6_1_0[1]));
  assign COMP_LOOP_and_152_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_126 & (rem_12cyc_st_6_1_0[1]);
  assign COMP_LOOP_and_154_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_129 & (rem_12cyc_st_6_1_0[1]);
  assign COMP_LOOP_and_156_cse = ccs_ccore_en & and_dcpl_111;
  assign COMP_LOOP_and_158_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_137;
  assign COMP_LOOP_and_160_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_141;
  assign COMP_LOOP_and_162_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_144;
  assign COMP_LOOP_and_164_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_146;
  assign COMP_LOOP_and_166_cse = ccs_ccore_en & and_dcpl_148 & and_dcpl_137;
  assign COMP_LOOP_and_168_cse = ccs_ccore_en & and_dcpl_148 & and_dcpl_141;
  assign COMP_LOOP_and_170_cse = ccs_ccore_en & and_dcpl_148 & and_dcpl_144;
  assign COMP_LOOP_and_172_cse = ccs_ccore_en & and_dcpl_148 & and_dcpl_146;
  assign COMP_LOOP_and_174_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_153 & (~
      (rem_12cyc_st_5_1_0[0]));
  assign COMP_LOOP_and_176_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_153 & (rem_12cyc_st_5_1_0[0]);
  assign COMP_LOOP_and_178_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_158 & (~
      (rem_12cyc_st_5_1_0[0]));
  assign COMP_LOOP_and_180_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_158 & (rem_12cyc_st_5_1_0[0]);
  assign COMP_LOOP_and_182_cse = ccs_ccore_en & and_dcpl_138;
  assign COMP_LOOP_and_184_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_164;
  assign COMP_LOOP_and_186_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_168;
  assign COMP_LOOP_and_188_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_171;
  assign COMP_LOOP_and_190_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_173;
  assign COMP_LOOP_and_192_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_175 & (~
      (rem_12cyc_st_4_1_0[0]));
  assign COMP_LOOP_and_194_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_175 & (rem_12cyc_st_4_1_0[0]);
  assign COMP_LOOP_and_196_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_180 & (~
      (rem_12cyc_st_4_1_0[0]));
  assign COMP_LOOP_and_198_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_180 & (rem_12cyc_st_4_1_0[0]);
  assign COMP_LOOP_and_200_cse = ccs_ccore_en & and_dcpl_185 & and_dcpl_164;
  assign COMP_LOOP_and_202_cse = ccs_ccore_en & and_dcpl_185 & and_dcpl_168;
  assign COMP_LOOP_and_204_cse = ccs_ccore_en & and_dcpl_185 & and_dcpl_171;
  assign COMP_LOOP_and_206_cse = ccs_ccore_en & and_dcpl_185 & and_dcpl_173;
  assign COMP_LOOP_and_208_cse = ccs_ccore_en & and_dcpl_165;
  assign COMP_LOOP_and_210_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_191;
  assign COMP_LOOP_and_212_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_195;
  assign COMP_LOOP_and_214_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_198;
  assign COMP_LOOP_and_216_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_200;
  assign COMP_LOOP_and_218_cse = ccs_ccore_en & and_dcpl_202 & and_dcpl_191;
  assign COMP_LOOP_and_220_cse = ccs_ccore_en & and_dcpl_202 & and_dcpl_195;
  assign COMP_LOOP_and_222_cse = ccs_ccore_en & and_dcpl_202 & and_dcpl_198;
  assign COMP_LOOP_and_224_cse = ccs_ccore_en & and_dcpl_202 & and_dcpl_200;
  assign COMP_LOOP_and_226_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_207 & (~
      (rem_12cyc_st_3_1_0[0]));
  assign COMP_LOOP_and_228_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_207 & (rem_12cyc_st_3_1_0[0]);
  assign COMP_LOOP_and_230_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_212 & (~
      (rem_12cyc_st_3_1_0[0]));
  assign COMP_LOOP_and_232_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_212 & (rem_12cyc_st_3_1_0[0]);
  assign COMP_LOOP_and_234_cse = ccs_ccore_en & and_dcpl_192;
  assign COMP_LOOP_and_236_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_218;
  assign COMP_LOOP_and_238_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_222;
  assign COMP_LOOP_and_240_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_225;
  assign COMP_LOOP_and_242_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_227;
  assign COMP_LOOP_and_244_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_229 & (~
      (rem_12cyc_st_2_1_0[0]));
  assign COMP_LOOP_and_246_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_229 & (rem_12cyc_st_2_1_0[0]);
  assign COMP_LOOP_and_248_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_234 & (~
      (rem_12cyc_st_2_1_0[0]));
  assign COMP_LOOP_and_250_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_234 & (rem_12cyc_st_2_1_0[0]);
  assign COMP_LOOP_and_252_cse = ccs_ccore_en & and_dcpl_239 & and_dcpl_218;
  assign COMP_LOOP_and_254_cse = ccs_ccore_en & and_dcpl_239 & and_dcpl_222;
  assign COMP_LOOP_and_256_cse = ccs_ccore_en & and_dcpl_239 & and_dcpl_225;
  assign COMP_LOOP_and_258_cse = ccs_ccore_en & and_dcpl_239 & and_dcpl_227;
  assign COMP_LOOP_and_260_cse = ccs_ccore_en & and_dcpl_219;
  assign COMP_LOOP_and_262_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_245;
  assign COMP_LOOP_and_264_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_249;
  assign COMP_LOOP_and_266_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_252;
  assign COMP_LOOP_and_268_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_254;
  assign COMP_LOOP_and_270_cse = ccs_ccore_en & and_dcpl_256 & and_dcpl_245;
  assign COMP_LOOP_and_272_cse = ccs_ccore_en & and_dcpl_256 & and_dcpl_249;
  assign COMP_LOOP_and_274_cse = ccs_ccore_en & and_dcpl_256 & and_dcpl_252;
  assign COMP_LOOP_and_276_cse = ccs_ccore_en & and_dcpl_256 & and_dcpl_254;
  assign COMP_LOOP_and_278_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_261 & (~
      (rem_12cyc_1_0[0]));
  assign COMP_LOOP_and_280_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_261 & (rem_12cyc_1_0[0]);
  assign COMP_LOOP_and_282_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_266 & (~
      (rem_12cyc_1_0[0]));
  assign COMP_LOOP_and_284_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_266 & (rem_12cyc_1_0[0]);
  assign COMP_LOOP_and_286_cse = ccs_ccore_en & and_dcpl_246;
  assign COMP_LOOP_and_24_cse = ccs_ccore_en & ccs_ccore_start_rsci_idat;
  assign and_273_nl = and_dcpl_272 & and_dcpl_271;
  assign and_275_nl = and_dcpl_272 & and_dcpl_274;
  assign and_277_nl = and_dcpl_272 & and_dcpl_276;
  assign and_279_nl = and_dcpl_272 & and_dcpl_278;
  assign and_281_nl = and_dcpl_280 & and_dcpl_271;
  assign and_282_nl = and_dcpl_280 & and_dcpl_274;
  assign and_283_nl = and_dcpl_280 & and_dcpl_276;
  assign and_284_nl = and_dcpl_280 & and_dcpl_278;
  assign and_286_nl = and_dcpl_285 & and_dcpl_271;
  assign and_287_nl = and_dcpl_285 & and_dcpl_274;
  assign and_288_nl = and_dcpl_285 & and_dcpl_276;
  assign and_289_nl = and_dcpl_285 & and_dcpl_278;
  assign and_290_nl = (rem_12cyc_st_12_3_2==2'b11);
  assign result_sva_duc_mx0 = MUX1HOT_v_64_13_2((rem_12_cmp_1_z[63:0]), (rem_12_cmp_2_z[63:0]),
      (rem_12_cmp_3_z[63:0]), (rem_12_cmp_4_z[63:0]), (rem_12_cmp_5_z[63:0]), (rem_12_cmp_6_z[63:0]),
      (rem_12_cmp_7_z[63:0]), (rem_12_cmp_8_z[63:0]), (rem_12_cmp_9_z[63:0]), (rem_12_cmp_10_z[63:0]),
      (rem_12_cmp_11_z[63:0]), (rem_12_cmp_z[63:0]), result_sva_duc, {and_273_nl
      , and_275_nl , and_277_nl , and_279_nl , and_281_nl , and_282_nl , and_283_nl
      , and_284_nl , and_286_nl , and_287_nl , and_288_nl , and_289_nl , and_290_nl});
  assign nl_COMP_LOOP_acc_1_tmp = ({rem_12cyc_3_2 , rem_12cyc_1_0}) + 4'b0001;
  assign COMP_LOOP_acc_1_tmp = nl_COMP_LOOP_acc_1_tmp[3:0];
  assign COMP_LOOP_COMP_LOOP_xor_nl = (COMP_LOOP_acc_1_tmp[2]) ^ (COMP_LOOP_acc_1_tmp[3]);
  assign COMP_LOOP_nor_nl = ~((COMP_LOOP_acc_1_tmp[3:2]!=2'b10));
  assign nl_COMP_LOOP_acc_tmp = conv_u2u_1_2(COMP_LOOP_COMP_LOOP_xor_nl) + conv_u2u_1_2(COMP_LOOP_nor_nl);
  assign COMP_LOOP_acc_tmp = nl_COMP_LOOP_acc_tmp[1:0];
  assign and_dcpl_1 = ~((rem_12cyc_st_10_3_2[1]) | (rem_12cyc_st_10_1_0[1]));
  assign and_dcpl_2 = and_dcpl_1 & (~ (rem_12cyc_st_10_1_0[0]));
  assign and_dcpl_3 = main_stage_0_11 & COMP_LOOP_asn_itm_10;
  assign and_dcpl_4 = and_dcpl_3 & (~ (rem_12cyc_st_10_3_2[0]));
  assign and_dcpl_6 = and_dcpl_1 & (rem_12cyc_st_10_1_0[0]);
  assign and_dcpl_8 = (~ (rem_12cyc_st_10_3_2[1])) & (rem_12cyc_st_10_1_0[1]);
  assign and_dcpl_9 = and_dcpl_8 & (~ (rem_12cyc_st_10_1_0[0]));
  assign and_dcpl_11 = and_dcpl_8 & (rem_12cyc_st_10_1_0[0]);
  assign and_dcpl_13 = and_dcpl_3 & (rem_12cyc_st_10_3_2[0]);
  assign and_dcpl_18 = (rem_12cyc_st_10_3_2[1]) & (~ (rem_12cyc_st_10_1_0[1]));
  assign and_dcpl_23 = (rem_12cyc_st_10_3_2[1]) & (rem_12cyc_st_10_1_0[1]);
  assign and_dcpl_28 = ~((rem_12cyc_st_9_3_2[1]) | (rem_12cyc_st_9_1_0[1]));
  assign and_dcpl_29 = and_dcpl_28 & (~ (rem_12cyc_st_9_1_0[0]));
  assign and_dcpl_30 = main_stage_0_10 & COMP_LOOP_asn_itm_9;
  assign and_dcpl_31 = and_dcpl_30 & (~ (rem_12cyc_st_9_3_2[0]));
  assign and_dcpl_33 = and_dcpl_28 & (rem_12cyc_st_9_1_0[0]);
  assign and_dcpl_35 = (~ (rem_12cyc_st_9_3_2[1])) & (rem_12cyc_st_9_1_0[1]);
  assign and_dcpl_36 = and_dcpl_35 & (~ (rem_12cyc_st_9_1_0[0]));
  assign and_dcpl_38 = and_dcpl_35 & (rem_12cyc_st_9_1_0[0]);
  assign and_dcpl_40 = and_dcpl_30 & (rem_12cyc_st_9_3_2[0]);
  assign and_dcpl_45 = (rem_12cyc_st_9_3_2[1]) & (~ (rem_12cyc_st_9_1_0[1]));
  assign and_dcpl_50 = (rem_12cyc_st_9_3_2[1]) & (rem_12cyc_st_9_1_0[1]);
  assign and_dcpl_55 = ~((rem_12cyc_st_8_3_2[1]) | (rem_12cyc_st_8_1_0[1]));
  assign and_dcpl_56 = and_dcpl_55 & (~ (rem_12cyc_st_8_1_0[0]));
  assign and_dcpl_57 = main_stage_0_9 & COMP_LOOP_asn_itm_8;
  assign and_dcpl_58 = and_dcpl_57 & (~ (rem_12cyc_st_8_3_2[0]));
  assign and_dcpl_60 = and_dcpl_55 & (rem_12cyc_st_8_1_0[0]);
  assign and_dcpl_62 = (~ (rem_12cyc_st_8_3_2[1])) & (rem_12cyc_st_8_1_0[1]);
  assign and_dcpl_63 = and_dcpl_62 & (~ (rem_12cyc_st_8_1_0[0]));
  assign and_dcpl_65 = and_dcpl_62 & (rem_12cyc_st_8_1_0[0]);
  assign and_dcpl_67 = and_dcpl_57 & (rem_12cyc_st_8_3_2[0]);
  assign and_dcpl_72 = (rem_12cyc_st_8_3_2[1]) & (~ (rem_12cyc_st_8_1_0[1]));
  assign and_dcpl_77 = (rem_12cyc_st_8_3_2[1]) & (rem_12cyc_st_8_1_0[1]);
  assign and_dcpl_82 = ~((rem_12cyc_st_7_3_2[1]) | (rem_12cyc_st_7_1_0[1]));
  assign and_dcpl_83 = and_dcpl_82 & (~ (rem_12cyc_st_7_1_0[0]));
  assign and_dcpl_84 = main_stage_0_8 & COMP_LOOP_asn_itm_7;
  assign and_dcpl_85 = and_dcpl_84 & (~ (rem_12cyc_st_7_3_2[0]));
  assign and_dcpl_87 = and_dcpl_82 & (rem_12cyc_st_7_1_0[0]);
  assign and_dcpl_89 = (~ (rem_12cyc_st_7_3_2[1])) & (rem_12cyc_st_7_1_0[1]);
  assign and_dcpl_90 = and_dcpl_89 & (~ (rem_12cyc_st_7_1_0[0]));
  assign and_dcpl_92 = and_dcpl_89 & (rem_12cyc_st_7_1_0[0]);
  assign and_dcpl_94 = and_dcpl_84 & (rem_12cyc_st_7_3_2[0]);
  assign and_dcpl_99 = (rem_12cyc_st_7_3_2[1]) & (~ (rem_12cyc_st_7_1_0[1]));
  assign and_dcpl_104 = (rem_12cyc_st_7_3_2[1]) & (rem_12cyc_st_7_1_0[1]);
  assign and_dcpl_109 = ~((rem_12cyc_st_6_3_2[1]) | (rem_12cyc_st_6_1_0[0]));
  assign and_dcpl_110 = and_dcpl_109 & (~ (rem_12cyc_st_6_1_0[1]));
  assign and_dcpl_111 = main_stage_0_7 & COMP_LOOP_asn_itm_6;
  assign and_dcpl_112 = and_dcpl_111 & (~ (rem_12cyc_st_6_3_2[0]));
  assign and_dcpl_114 = (~ (rem_12cyc_st_6_3_2[1])) & (rem_12cyc_st_6_1_0[0]);
  assign and_dcpl_115 = and_dcpl_114 & (~ (rem_12cyc_st_6_1_0[1]));
  assign and_dcpl_117 = and_dcpl_109 & (rem_12cyc_st_6_1_0[1]);
  assign and_dcpl_119 = and_dcpl_114 & (rem_12cyc_st_6_1_0[1]);
  assign and_dcpl_121 = and_dcpl_111 & (rem_12cyc_st_6_3_2[0]);
  assign and_dcpl_126 = (rem_12cyc_st_6_3_2[1]) & (~ (rem_12cyc_st_6_1_0[0]));
  assign and_dcpl_129 = (rem_12cyc_st_6_3_2[1]) & (rem_12cyc_st_6_1_0[0]);
  assign and_dcpl_136 = ~((rem_12cyc_st_5_3_2[1]) | (rem_12cyc_st_5_1_0[1]));
  assign and_dcpl_137 = and_dcpl_136 & (~ (rem_12cyc_st_5_1_0[0]));
  assign and_dcpl_138 = main_stage_0_6 & COMP_LOOP_asn_itm_5;
  assign and_dcpl_139 = and_dcpl_138 & (~ (rem_12cyc_st_5_3_2[0]));
  assign and_dcpl_141 = and_dcpl_136 & (rem_12cyc_st_5_1_0[0]);
  assign and_dcpl_143 = (~ (rem_12cyc_st_5_3_2[1])) & (rem_12cyc_st_5_1_0[1]);
  assign and_dcpl_144 = and_dcpl_143 & (~ (rem_12cyc_st_5_1_0[0]));
  assign and_dcpl_146 = and_dcpl_143 & (rem_12cyc_st_5_1_0[0]);
  assign and_dcpl_148 = and_dcpl_138 & (rem_12cyc_st_5_3_2[0]);
  assign and_dcpl_153 = (rem_12cyc_st_5_3_2[1]) & (~ (rem_12cyc_st_5_1_0[1]));
  assign and_dcpl_158 = (rem_12cyc_st_5_3_2[1]) & (rem_12cyc_st_5_1_0[1]);
  assign and_dcpl_163 = ~((rem_12cyc_st_4_3_2[0]) | (rem_12cyc_st_4_1_0[1]));
  assign and_dcpl_164 = and_dcpl_163 & (~ (rem_12cyc_st_4_1_0[0]));
  assign and_dcpl_165 = main_stage_0_5 & COMP_LOOP_asn_itm_4;
  assign and_dcpl_166 = and_dcpl_165 & (~ (rem_12cyc_st_4_3_2[1]));
  assign and_dcpl_168 = and_dcpl_163 & (rem_12cyc_st_4_1_0[0]);
  assign and_dcpl_170 = (~ (rem_12cyc_st_4_3_2[0])) & (rem_12cyc_st_4_1_0[1]);
  assign and_dcpl_171 = and_dcpl_170 & (~ (rem_12cyc_st_4_1_0[0]));
  assign and_dcpl_173 = and_dcpl_170 & (rem_12cyc_st_4_1_0[0]);
  assign and_dcpl_175 = (rem_12cyc_st_4_3_2[0]) & (~ (rem_12cyc_st_4_1_0[1]));
  assign and_dcpl_180 = (rem_12cyc_st_4_3_2[0]) & (rem_12cyc_st_4_1_0[1]);
  assign and_dcpl_185 = and_dcpl_165 & (rem_12cyc_st_4_3_2[1]);
  assign and_dcpl_190 = ~((rem_12cyc_st_3_3_2[1]) | (rem_12cyc_st_3_1_0[1]));
  assign and_dcpl_191 = and_dcpl_190 & (~ (rem_12cyc_st_3_1_0[0]));
  assign and_dcpl_192 = main_stage_0_4 & COMP_LOOP_asn_itm_3;
  assign and_dcpl_193 = and_dcpl_192 & (~ (rem_12cyc_st_3_3_2[0]));
  assign and_dcpl_195 = and_dcpl_190 & (rem_12cyc_st_3_1_0[0]);
  assign and_dcpl_197 = (~ (rem_12cyc_st_3_3_2[1])) & (rem_12cyc_st_3_1_0[1]);
  assign and_dcpl_198 = and_dcpl_197 & (~ (rem_12cyc_st_3_1_0[0]));
  assign and_dcpl_200 = and_dcpl_197 & (rem_12cyc_st_3_1_0[0]);
  assign and_dcpl_202 = and_dcpl_192 & (rem_12cyc_st_3_3_2[0]);
  assign and_dcpl_207 = (rem_12cyc_st_3_3_2[1]) & (~ (rem_12cyc_st_3_1_0[1]));
  assign and_dcpl_212 = (rem_12cyc_st_3_3_2[1]) & (rem_12cyc_st_3_1_0[1]);
  assign and_dcpl_217 = ~((rem_12cyc_st_2_3_2[0]) | (rem_12cyc_st_2_1_0[1]));
  assign and_dcpl_218 = and_dcpl_217 & (~ (rem_12cyc_st_2_1_0[0]));
  assign and_dcpl_219 = main_stage_0_3 & COMP_LOOP_asn_itm_2;
  assign and_dcpl_220 = and_dcpl_219 & (~ (rem_12cyc_st_2_3_2[1]));
  assign and_dcpl_222 = and_dcpl_217 & (rem_12cyc_st_2_1_0[0]);
  assign and_dcpl_224 = (~ (rem_12cyc_st_2_3_2[0])) & (rem_12cyc_st_2_1_0[1]);
  assign and_dcpl_225 = and_dcpl_224 & (~ (rem_12cyc_st_2_1_0[0]));
  assign and_dcpl_227 = and_dcpl_224 & (rem_12cyc_st_2_1_0[0]);
  assign and_dcpl_229 = (rem_12cyc_st_2_3_2[0]) & (~ (rem_12cyc_st_2_1_0[1]));
  assign and_dcpl_234 = (rem_12cyc_st_2_3_2[0]) & (rem_12cyc_st_2_1_0[1]);
  assign and_dcpl_239 = and_dcpl_219 & (rem_12cyc_st_2_3_2[1]);
  assign and_dcpl_244 = ~((rem_12cyc_3_2[1]) | (rem_12cyc_1_0[1]));
  assign and_dcpl_245 = and_dcpl_244 & (~ (rem_12cyc_1_0[0]));
  assign and_dcpl_246 = main_stage_0_2 & COMP_LOOP_asn_itm_1;
  assign and_dcpl_247 = and_dcpl_246 & (~ (rem_12cyc_3_2[0]));
  assign and_dcpl_249 = and_dcpl_244 & (rem_12cyc_1_0[0]);
  assign and_dcpl_251 = (~ (rem_12cyc_3_2[1])) & (rem_12cyc_1_0[1]);
  assign and_dcpl_252 = and_dcpl_251 & (~ (rem_12cyc_1_0[0]));
  assign and_dcpl_254 = and_dcpl_251 & (rem_12cyc_1_0[0]);
  assign and_dcpl_256 = and_dcpl_246 & (rem_12cyc_3_2[0]);
  assign and_dcpl_261 = (rem_12cyc_3_2[1]) & (~ (rem_12cyc_1_0[1]));
  assign and_dcpl_266 = (rem_12cyc_3_2[1]) & (rem_12cyc_1_0[1]);
  assign and_dcpl_271 = ~((rem_12cyc_st_12_1_0!=2'b00));
  assign and_dcpl_272 = ~((rem_12cyc_st_12_3_2!=2'b00));
  assign and_dcpl_274 = (rem_12cyc_st_12_1_0==2'b01);
  assign and_dcpl_276 = (rem_12cyc_st_12_1_0==2'b10);
  assign and_dcpl_278 = (rem_12cyc_st_12_1_0==2'b11);
  assign and_dcpl_280 = (rem_12cyc_st_12_3_2==2'b01);
  assign and_dcpl_285 = (rem_12cyc_st_12_3_2==2'b10);
  assign and_dcpl_291 = ~((COMP_LOOP_acc_1_tmp[1:0]!=2'b00));
  assign and_dcpl_292 = ccs_ccore_start_rsci_idat & (~ (COMP_LOOP_acc_tmp[0]));
  assign and_dcpl_293 = and_dcpl_292 & (~ (COMP_LOOP_acc_tmp[1]));
  assign and_dcpl_294 = and_dcpl_293 & and_dcpl_291;
  assign and_dcpl_295 = ~((rem_12cyc_st_2_3_2!=2'b00));
  assign and_dcpl_296 = and_dcpl_295 & (~ (rem_12cyc_st_2_1_0[1]));
  assign and_dcpl_298 = (~ (rem_12cyc_st_2_1_0[0])) & main_stage_0_3 & COMP_LOOP_asn_itm_2;
  assign not_tmp_54 = ~(COMP_LOOP_asn_itm_1 & main_stage_0_2);
  assign or_tmp_2 = (rem_12cyc_1_0!=2'b00) | (rem_12cyc_3_2!=2'b00) | not_tmp_54;
  assign or_1_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b00) | (COMP_LOOP_acc_tmp!=2'b00);
  assign nor_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_2));
  assign mux_12_nl = MUX_s_1_2_2(nor_nl, or_tmp_2, or_1_cse);
  assign and_dcpl_300 = mux_12_nl & and_dcpl_298 & and_dcpl_296;
  assign and_dcpl_301 = ~((rem_12cyc_st_3_3_2!=2'b00));
  assign and_dcpl_302 = and_dcpl_301 & (~ (rem_12cyc_st_3_1_0[1]));
  assign and_dcpl_304 = (~ (rem_12cyc_st_3_1_0[0])) & main_stage_0_4 & COMP_LOOP_asn_itm_3;
  assign or_6_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b00) | (~ COMP_LOOP_asn_itm_2)
      | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp = or_6_cse & or_tmp_2;
  assign nor_516_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp));
  assign mux_13_nl = MUX_s_1_2_2(nor_516_nl, and_tmp, or_1_cse);
  assign and_dcpl_306 = mux_13_nl & and_dcpl_304 & and_dcpl_302;
  assign and_dcpl_307 = ~((rem_12cyc_st_4_3_2!=2'b00));
  assign and_dcpl_308 = and_dcpl_307 & (~ (rem_12cyc_st_4_1_0[1]));
  assign and_dcpl_310 = (~ (rem_12cyc_st_4_1_0[0])) & main_stage_0_5 & COMP_LOOP_asn_itm_4;
  assign or_10_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b00) | (~ COMP_LOOP_asn_itm_3)
      | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_2 = or_6_cse & or_10_cse & or_tmp_2;
  assign nor_515_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_2));
  assign mux_14_nl = MUX_s_1_2_2(nor_515_nl, and_tmp_2, or_1_cse);
  assign and_dcpl_312 = mux_14_nl & and_dcpl_310 & and_dcpl_308;
  assign and_dcpl_313 = ~((rem_12cyc_st_5_3_2!=2'b00));
  assign and_dcpl_314 = and_dcpl_313 & (~ (rem_12cyc_st_5_1_0[1]));
  assign and_dcpl_316 = (~ (rem_12cyc_st_5_1_0[0])) & main_stage_0_6 & COMP_LOOP_asn_itm_5;
  assign or_15_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b00) | (~ COMP_LOOP_asn_itm_4)
      | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_5 = or_6_cse & or_10_cse & or_15_cse & or_tmp_2;
  assign nor_514_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_5));
  assign mux_15_nl = MUX_s_1_2_2(nor_514_nl, and_tmp_5, or_1_cse);
  assign and_dcpl_318 = mux_15_nl & and_dcpl_316 & and_dcpl_314;
  assign or_21_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b00) | (~ COMP_LOOP_asn_itm_5)
      | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_9 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & or_tmp_2;
  assign nor_513_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_9));
  assign mux_16_nl = MUX_s_1_2_2(nor_513_nl, and_tmp_9, or_1_cse);
  assign and_dcpl_324 = mux_16_nl & and_dcpl_112 & and_dcpl_110;
  assign or_28_cse = (rem_12cyc_st_6_1_0!=2'b00) | (rem_12cyc_st_6_3_2!=2'b00);
  assign nor_511_nl = ~(and_dcpl_111 | (~ or_tmp_2));
  assign mux_17_nl = MUX_s_1_2_2(nor_511_nl, or_tmp_2, or_28_cse);
  assign and_tmp_13 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & mux_17_nl;
  assign nor_512_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_13));
  assign mux_18_nl = MUX_s_1_2_2(nor_512_nl, and_tmp_13, or_1_cse);
  assign and_dcpl_330 = mux_18_nl & and_dcpl_85 & and_dcpl_83;
  assign or_37_cse = (rem_12cyc_st_7_1_0!=2'b00) | (rem_12cyc_st_7_3_2!=2'b00);
  assign nor_508_nl = ~(and_dcpl_84 | (~ or_tmp_2));
  assign mux_tmp_19 = MUX_s_1_2_2(nor_508_nl, or_tmp_2, or_37_cse);
  assign nor_509_nl = ~(and_dcpl_111 | (~ mux_tmp_19));
  assign mux_20_nl = MUX_s_1_2_2(nor_509_nl, mux_tmp_19, or_28_cse);
  assign and_tmp_17 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & mux_20_nl;
  assign nor_510_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_17));
  assign mux_21_nl = MUX_s_1_2_2(nor_510_nl, and_tmp_17, or_1_cse);
  assign and_dcpl_336 = mux_21_nl & and_dcpl_58 & and_dcpl_56;
  assign or_48_cse = (rem_12cyc_st_8_1_0!=2'b00) | (rem_12cyc_st_8_3_2!=2'b00);
  assign nor_504_nl = ~(and_dcpl_57 | (~ or_tmp_2));
  assign mux_tmp_22 = MUX_s_1_2_2(nor_504_nl, or_tmp_2, or_48_cse);
  assign nor_505_nl = ~(and_dcpl_84 | (~ mux_tmp_22));
  assign mux_tmp_23 = MUX_s_1_2_2(nor_505_nl, mux_tmp_22, or_37_cse);
  assign nor_506_nl = ~(and_dcpl_111 | (~ mux_tmp_23));
  assign mux_24_nl = MUX_s_1_2_2(nor_506_nl, mux_tmp_23, or_28_cse);
  assign and_tmp_21 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & mux_24_nl;
  assign nor_507_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_21));
  assign mux_25_nl = MUX_s_1_2_2(nor_507_nl, and_tmp_21, or_1_cse);
  assign and_dcpl_342 = mux_25_nl & and_dcpl_31 & and_dcpl_29;
  assign nor_499_nl = ~(and_dcpl_30 | (~ or_tmp_2));
  assign or_61_nl = (rem_12cyc_st_9_1_0!=2'b00) | (rem_12cyc_st_9_3_2!=2'b00);
  assign mux_tmp_26 = MUX_s_1_2_2(nor_499_nl, or_tmp_2, or_61_nl);
  assign nor_500_nl = ~(and_dcpl_57 | (~ mux_tmp_26));
  assign mux_tmp_27 = MUX_s_1_2_2(nor_500_nl, mux_tmp_26, or_48_cse);
  assign nor_501_nl = ~(and_dcpl_84 | (~ mux_tmp_27));
  assign mux_tmp_28 = MUX_s_1_2_2(nor_501_nl, mux_tmp_27, or_37_cse);
  assign nor_502_nl = ~(and_dcpl_111 | (~ mux_tmp_28));
  assign mux_29_nl = MUX_s_1_2_2(nor_502_nl, mux_tmp_28, or_28_cse);
  assign and_tmp_25 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & mux_29_nl;
  assign nor_503_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_25));
  assign mux_30_nl = MUX_s_1_2_2(nor_503_nl, and_tmp_25, or_1_cse);
  assign and_dcpl_348 = mux_30_nl & and_dcpl_4 & and_dcpl_2;
  assign and_tmp_35 = ((~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b00)
      | (rem_12cyc_1_0!=2'b00)) & ((~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) |
      (rem_12cyc_st_7_1_0!=2'b00) | (rem_12cyc_st_7_3_2!=2'b00)) & ((~ main_stage_0_9)
      | (~ COMP_LOOP_asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b00) | (rem_12cyc_st_8_3_2!=2'b00))
      & ((~ main_stage_0_10) | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b00)
      | (rem_12cyc_st_9_3_2!=2'b00)) & or_6_cse & or_10_cse & or_15_cse & or_21_cse
      & ((~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b00)
      | (rem_12cyc_st_6_3_2!=2'b00)) & ((~ main_stage_0_11) | (~ COMP_LOOP_asn_itm_10)
      | (rem_12cyc_st_10_1_0!=2'b00) | (rem_12cyc_st_10_3_2!=2'b00)) & ((COMP_LOOP_acc_tmp!=2'b00)
      | (COMP_LOOP_acc_1_tmp[1:0]!=2'b00) | (~ ccs_ccore_start_rsci_idat));
  assign and_dcpl_355 = (COMP_LOOP_acc_1_tmp[1:0]==2'b01);
  assign and_dcpl_356 = and_dcpl_293 & and_dcpl_355;
  assign and_dcpl_358 = (rem_12cyc_st_2_1_0[0]) & main_stage_0_3 & COMP_LOOP_asn_itm_2;
  assign or_tmp_80 = (rem_12cyc_1_0!=2'b01) | (rem_12cyc_3_2!=2'b00) | not_tmp_54;
  assign or_83_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b01) | (COMP_LOOP_acc_tmp!=2'b00);
  assign nor_498_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_80));
  assign mux_31_nl = MUX_s_1_2_2(nor_498_nl, or_tmp_80, or_83_cse);
  assign and_dcpl_360 = mux_31_nl & and_dcpl_358 & and_dcpl_296;
  assign and_dcpl_362 = (rem_12cyc_st_3_1_0[0]) & main_stage_0_4 & COMP_LOOP_asn_itm_3;
  assign nand_276_cse = ~(COMP_LOOP_asn_itm_2 & main_stage_0_3 & (rem_12cyc_st_2_1_0[0]));
  assign or_88_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b00);
  assign and_1168_nl = nand_276_cse & or_tmp_80;
  assign mux_tmp_32 = MUX_s_1_2_2(and_1168_nl, or_tmp_80, or_88_cse);
  assign nor_497_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_32));
  assign mux_33_nl = MUX_s_1_2_2(nor_497_nl, mux_tmp_32, or_83_cse);
  assign and_dcpl_364 = mux_33_nl & and_dcpl_362 & and_dcpl_302;
  assign and_dcpl_366 = (rem_12cyc_st_4_1_0[0]) & main_stage_0_5 & COMP_LOOP_asn_itm_4;
  assign nand_274_cse = ~(COMP_LOOP_asn_itm_3 & main_stage_0_4 & (rem_12cyc_st_3_1_0[0]));
  assign or_93_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b00);
  assign and_1166_nl = nand_274_cse & or_tmp_80;
  assign mux_tmp_34 = MUX_s_1_2_2(and_1166_nl, or_tmp_80, or_93_cse);
  assign and_1167_nl = nand_276_cse & mux_tmp_34;
  assign mux_tmp_35 = MUX_s_1_2_2(and_1167_nl, mux_tmp_34, or_88_cse);
  assign nor_496_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_35));
  assign mux_36_nl = MUX_s_1_2_2(nor_496_nl, mux_tmp_35, or_83_cse);
  assign and_dcpl_368 = mux_36_nl & and_dcpl_366 & and_dcpl_308;
  assign and_dcpl_370 = (rem_12cyc_st_5_1_0[0]) & main_stage_0_6 & COMP_LOOP_asn_itm_5;
  assign nand_271_cse = ~(COMP_LOOP_asn_itm_4 & main_stage_0_5 & (rem_12cyc_st_4_1_0[0]));
  assign or_100_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b00);
  assign and_1163_nl = nand_271_cse & or_tmp_80;
  assign mux_tmp_37 = MUX_s_1_2_2(and_1163_nl, or_tmp_80, or_100_cse);
  assign and_1164_nl = nand_274_cse & mux_tmp_37;
  assign mux_tmp_38 = MUX_s_1_2_2(and_1164_nl, mux_tmp_37, or_93_cse);
  assign and_1165_nl = nand_276_cse & mux_tmp_38;
  assign mux_tmp_39 = MUX_s_1_2_2(and_1165_nl, mux_tmp_38, or_88_cse);
  assign nor_495_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_39));
  assign mux_40_nl = MUX_s_1_2_2(nor_495_nl, mux_tmp_39, or_83_cse);
  assign and_dcpl_372 = mux_40_nl & and_dcpl_370 & and_dcpl_314;
  assign nand_267_cse = ~(COMP_LOOP_asn_itm_5 & main_stage_0_6 & (rem_12cyc_st_5_1_0[0]));
  assign or_109_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b00);
  assign and_1159_nl = nand_267_cse & or_tmp_80;
  assign mux_tmp_41 = MUX_s_1_2_2(and_1159_nl, or_tmp_80, or_109_cse);
  assign and_1160_nl = nand_271_cse & mux_tmp_41;
  assign mux_tmp_42 = MUX_s_1_2_2(and_1160_nl, mux_tmp_41, or_100_cse);
  assign and_1161_nl = nand_274_cse & mux_tmp_42;
  assign mux_tmp_43 = MUX_s_1_2_2(and_1161_nl, mux_tmp_42, or_93_cse);
  assign and_1162_nl = nand_276_cse & mux_tmp_43;
  assign mux_tmp_44 = MUX_s_1_2_2(and_1162_nl, mux_tmp_43, or_88_cse);
  assign nor_494_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_44));
  assign mux_45_nl = MUX_s_1_2_2(nor_494_nl, mux_tmp_44, or_83_cse);
  assign and_dcpl_376 = mux_45_nl & and_dcpl_112 & and_dcpl_115;
  assign or_120_cse = (rem_12cyc_st_6_1_0!=2'b01) | (rem_12cyc_st_6_3_2!=2'b00);
  assign nor_492_nl = ~(and_dcpl_111 | (~ or_tmp_80));
  assign mux_tmp_46 = MUX_s_1_2_2(nor_492_nl, or_tmp_80, or_120_cse);
  assign and_1155_nl = nand_267_cse & mux_tmp_46;
  assign mux_tmp_47 = MUX_s_1_2_2(and_1155_nl, mux_tmp_46, or_109_cse);
  assign and_1156_nl = nand_271_cse & mux_tmp_47;
  assign mux_tmp_48 = MUX_s_1_2_2(and_1156_nl, mux_tmp_47, or_100_cse);
  assign and_1157_nl = nand_274_cse & mux_tmp_48;
  assign mux_tmp_49 = MUX_s_1_2_2(and_1157_nl, mux_tmp_48, or_93_cse);
  assign and_1158_nl = nand_276_cse & mux_tmp_49;
  assign mux_tmp_50 = MUX_s_1_2_2(and_1158_nl, mux_tmp_49, or_88_cse);
  assign nor_493_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_50));
  assign mux_51_nl = MUX_s_1_2_2(nor_493_nl, mux_tmp_50, or_83_cse);
  assign and_dcpl_379 = mux_51_nl & and_dcpl_85 & and_dcpl_87;
  assign or_133_cse = (rem_12cyc_st_7_1_0!=2'b01) | (rem_12cyc_st_7_3_2!=2'b00);
  assign nor_489_nl = ~(and_dcpl_84 | (~ or_tmp_80));
  assign mux_tmp_52 = MUX_s_1_2_2(nor_489_nl, or_tmp_80, or_133_cse);
  assign nor_490_nl = ~(and_dcpl_111 | (~ mux_tmp_52));
  assign mux_tmp_53 = MUX_s_1_2_2(nor_490_nl, mux_tmp_52, or_120_cse);
  assign and_1151_nl = nand_267_cse & mux_tmp_53;
  assign mux_tmp_54 = MUX_s_1_2_2(and_1151_nl, mux_tmp_53, or_109_cse);
  assign and_1152_nl = nand_271_cse & mux_tmp_54;
  assign mux_tmp_55 = MUX_s_1_2_2(and_1152_nl, mux_tmp_54, or_100_cse);
  assign and_1153_nl = nand_274_cse & mux_tmp_55;
  assign mux_tmp_56 = MUX_s_1_2_2(and_1153_nl, mux_tmp_55, or_93_cse);
  assign and_1154_nl = nand_276_cse & mux_tmp_56;
  assign mux_tmp_57 = MUX_s_1_2_2(and_1154_nl, mux_tmp_56, or_88_cse);
  assign nor_491_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_57));
  assign mux_58_nl = MUX_s_1_2_2(nor_491_nl, mux_tmp_57, or_83_cse);
  assign and_dcpl_382 = mux_58_nl & and_dcpl_58 & and_dcpl_60;
  assign or_148_cse = (rem_12cyc_st_8_1_0!=2'b01) | (rem_12cyc_st_8_3_2!=2'b00);
  assign nor_485_nl = ~(and_dcpl_57 | (~ or_tmp_80));
  assign mux_tmp_59 = MUX_s_1_2_2(nor_485_nl, or_tmp_80, or_148_cse);
  assign nor_486_nl = ~(and_dcpl_84 | (~ mux_tmp_59));
  assign mux_tmp_60 = MUX_s_1_2_2(nor_486_nl, mux_tmp_59, or_133_cse);
  assign nor_487_nl = ~(and_dcpl_111 | (~ mux_tmp_60));
  assign mux_tmp_61 = MUX_s_1_2_2(nor_487_nl, mux_tmp_60, or_120_cse);
  assign and_1147_nl = nand_267_cse & mux_tmp_61;
  assign mux_tmp_62 = MUX_s_1_2_2(and_1147_nl, mux_tmp_61, or_109_cse);
  assign and_1148_nl = nand_271_cse & mux_tmp_62;
  assign mux_tmp_63 = MUX_s_1_2_2(and_1148_nl, mux_tmp_62, or_100_cse);
  assign and_1149_nl = nand_274_cse & mux_tmp_63;
  assign mux_tmp_64 = MUX_s_1_2_2(and_1149_nl, mux_tmp_63, or_93_cse);
  assign and_1150_nl = nand_276_cse & mux_tmp_64;
  assign mux_tmp_65 = MUX_s_1_2_2(and_1150_nl, mux_tmp_64, or_88_cse);
  assign nor_488_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_65));
  assign mux_66_nl = MUX_s_1_2_2(nor_488_nl, mux_tmp_65, or_83_cse);
  assign and_dcpl_385 = mux_66_nl & and_dcpl_31 & and_dcpl_33;
  assign nor_480_nl = ~(and_dcpl_30 | (~ or_tmp_80));
  assign or_165_nl = (rem_12cyc_st_9_1_0!=2'b01) | (rem_12cyc_st_9_3_2!=2'b00);
  assign mux_tmp_67 = MUX_s_1_2_2(nor_480_nl, or_tmp_80, or_165_nl);
  assign nor_481_nl = ~(and_dcpl_57 | (~ mux_tmp_67));
  assign mux_tmp_68 = MUX_s_1_2_2(nor_481_nl, mux_tmp_67, or_148_cse);
  assign nor_482_nl = ~(and_dcpl_84 | (~ mux_tmp_68));
  assign mux_tmp_69 = MUX_s_1_2_2(nor_482_nl, mux_tmp_68, or_133_cse);
  assign nor_483_nl = ~(and_dcpl_111 | (~ mux_tmp_69));
  assign mux_tmp_70 = MUX_s_1_2_2(nor_483_nl, mux_tmp_69, or_120_cse);
  assign and_1143_nl = nand_267_cse & mux_tmp_70;
  assign mux_tmp_71 = MUX_s_1_2_2(and_1143_nl, mux_tmp_70, or_109_cse);
  assign and_1144_nl = nand_271_cse & mux_tmp_71;
  assign mux_tmp_72 = MUX_s_1_2_2(and_1144_nl, mux_tmp_71, or_100_cse);
  assign and_1145_nl = nand_274_cse & mux_tmp_72;
  assign mux_tmp_73 = MUX_s_1_2_2(and_1145_nl, mux_tmp_72, or_93_cse);
  assign and_1146_nl = nand_276_cse & mux_tmp_73;
  assign mux_tmp_74 = MUX_s_1_2_2(and_1146_nl, mux_tmp_73, or_88_cse);
  assign nor_484_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_74));
  assign mux_75_nl = MUX_s_1_2_2(nor_484_nl, mux_tmp_74, or_83_cse);
  assign and_dcpl_388 = mux_75_nl & and_dcpl_4 & and_dcpl_6;
  assign nand_250_cse = ~((COMP_LOOP_acc_1_tmp[0]) & ccs_ccore_start_rsci_idat);
  assign and_tmp_44 = ((~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b01)
      | (rem_12cyc_st_7_3_2!=2'b00)) & ((~ main_stage_0_9) | (~ COMP_LOOP_asn_itm_8)
      | (rem_12cyc_st_8_1_0!=2'b01) | (rem_12cyc_st_8_3_2!=2'b00)) & ((~ main_stage_0_10)
      | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b01) | (rem_12cyc_st_9_3_2!=2'b00))
      & ((~ main_stage_0_3) | (~ COMP_LOOP_asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b01)
      | (rem_12cyc_st_2_3_2!=2'b00)) & ((~ main_stage_0_4) | (~ COMP_LOOP_asn_itm_3)
      | (rem_12cyc_st_3_1_0!=2'b01) | (rem_12cyc_st_3_3_2!=2'b00)) & ((~ main_stage_0_5)
      | (~ COMP_LOOP_asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b01) | (rem_12cyc_st_4_3_2!=2'b00))
      & ((~ main_stage_0_6) | (~ COMP_LOOP_asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b01)
      | (rem_12cyc_st_5_3_2!=2'b00)) & ((~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6)
      | (rem_12cyc_st_6_1_0!=2'b01) | (rem_12cyc_st_6_3_2!=2'b00)) & ((~ main_stage_0_11)
      | (~ COMP_LOOP_asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b01) | (rem_12cyc_st_10_3_2!=2'b00))
      & ((COMP_LOOP_acc_tmp!=2'b00) | (COMP_LOOP_acc_1_tmp[1]) | nand_250_cse);
  assign nor_479_nl = ~((rem_12cyc_1_0[0]) | (~ and_tmp_44));
  assign or_175_nl = (~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b00)
      | (rem_12cyc_1_0[1]);
  assign mux_tmp_76 = MUX_s_1_2_2(nor_479_nl, and_tmp_44, or_175_nl);
  assign and_dcpl_393 = (COMP_LOOP_acc_1_tmp[1:0]==2'b10);
  assign and_dcpl_394 = and_dcpl_293 & and_dcpl_393;
  assign and_dcpl_395 = and_dcpl_295 & (rem_12cyc_st_2_1_0[1]);
  assign or_tmp_185 = (rem_12cyc_1_0!=2'b10) | (rem_12cyc_3_2!=2'b00) | not_tmp_54;
  assign or_190_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b10) | (COMP_LOOP_acc_tmp!=2'b00);
  assign nor_478_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_185));
  assign mux_77_nl = MUX_s_1_2_2(nor_478_nl, or_tmp_185, or_190_cse);
  assign and_dcpl_397 = mux_77_nl & and_dcpl_298 & and_dcpl_395;
  assign and_dcpl_398 = and_dcpl_301 & (rem_12cyc_st_3_1_0[1]);
  assign or_195_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b00) |
      (~ COMP_LOOP_asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_45 = or_195_cse & or_tmp_185;
  assign nor_477_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_45));
  assign mux_78_nl = MUX_s_1_2_2(nor_477_nl, and_tmp_45, or_190_cse);
  assign and_dcpl_400 = mux_78_nl & and_dcpl_304 & and_dcpl_398;
  assign and_dcpl_401 = and_dcpl_307 & (rem_12cyc_st_4_1_0[1]);
  assign or_199_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b00) |
      (~ COMP_LOOP_asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_47 = or_195_cse & or_199_cse & or_tmp_185;
  assign nor_476_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_47));
  assign mux_79_nl = MUX_s_1_2_2(nor_476_nl, and_tmp_47, or_190_cse);
  assign and_dcpl_403 = mux_79_nl & and_dcpl_310 & and_dcpl_401;
  assign and_dcpl_404 = and_dcpl_313 & (rem_12cyc_st_5_1_0[1]);
  assign or_204_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b00) |
      (~ COMP_LOOP_asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_50 = or_195_cse & or_199_cse & or_204_cse & or_tmp_185;
  assign nor_475_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_50));
  assign mux_80_nl = MUX_s_1_2_2(nor_475_nl, and_tmp_50, or_190_cse);
  assign and_dcpl_406 = mux_80_nl & and_dcpl_316 & and_dcpl_404;
  assign or_210_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b00) |
      (~ COMP_LOOP_asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_54 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & or_tmp_185;
  assign nor_474_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_54));
  assign mux_81_nl = MUX_s_1_2_2(nor_474_nl, and_tmp_54, or_190_cse);
  assign and_dcpl_409 = mux_81_nl & and_dcpl_112 & and_dcpl_117;
  assign or_217_cse = (rem_12cyc_st_6_1_0!=2'b10) | (rem_12cyc_st_6_3_2!=2'b00);
  assign nor_472_nl = ~(and_dcpl_111 | (~ or_tmp_185));
  assign mux_82_nl = MUX_s_1_2_2(nor_472_nl, or_tmp_185, or_217_cse);
  assign and_tmp_58 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & mux_82_nl;
  assign nor_473_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_58));
  assign mux_83_nl = MUX_s_1_2_2(nor_473_nl, and_tmp_58, or_190_cse);
  assign and_dcpl_413 = mux_83_nl & and_dcpl_85 & and_dcpl_90;
  assign or_226_cse = (rem_12cyc_st_7_1_0!=2'b10) | (rem_12cyc_st_7_3_2!=2'b00);
  assign nor_469_nl = ~(and_dcpl_84 | (~ or_tmp_185));
  assign mux_tmp_84 = MUX_s_1_2_2(nor_469_nl, or_tmp_185, or_226_cse);
  assign nor_470_nl = ~(and_dcpl_111 | (~ mux_tmp_84));
  assign mux_85_nl = MUX_s_1_2_2(nor_470_nl, mux_tmp_84, or_217_cse);
  assign and_tmp_62 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & mux_85_nl;
  assign nor_471_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_62));
  assign mux_86_nl = MUX_s_1_2_2(nor_471_nl, and_tmp_62, or_190_cse);
  assign and_dcpl_417 = mux_86_nl & and_dcpl_58 & and_dcpl_63;
  assign or_237_cse = (rem_12cyc_st_8_1_0!=2'b10) | (rem_12cyc_st_8_3_2!=2'b00);
  assign nor_465_nl = ~(and_dcpl_57 | (~ or_tmp_185));
  assign mux_tmp_87 = MUX_s_1_2_2(nor_465_nl, or_tmp_185, or_237_cse);
  assign nor_466_nl = ~(and_dcpl_84 | (~ mux_tmp_87));
  assign mux_tmp_88 = MUX_s_1_2_2(nor_466_nl, mux_tmp_87, or_226_cse);
  assign nor_467_nl = ~(and_dcpl_111 | (~ mux_tmp_88));
  assign mux_89_nl = MUX_s_1_2_2(nor_467_nl, mux_tmp_88, or_217_cse);
  assign and_tmp_66 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & mux_89_nl;
  assign nor_468_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_66));
  assign mux_90_nl = MUX_s_1_2_2(nor_468_nl, and_tmp_66, or_190_cse);
  assign and_dcpl_421 = mux_90_nl & and_dcpl_31 & and_dcpl_36;
  assign nor_460_nl = ~(and_dcpl_30 | (~ or_tmp_185));
  assign or_250_nl = (rem_12cyc_st_9_1_0!=2'b10) | (rem_12cyc_st_9_3_2!=2'b00);
  assign mux_tmp_91 = MUX_s_1_2_2(nor_460_nl, or_tmp_185, or_250_nl);
  assign nor_461_nl = ~(and_dcpl_57 | (~ mux_tmp_91));
  assign mux_tmp_92 = MUX_s_1_2_2(nor_461_nl, mux_tmp_91, or_237_cse);
  assign nor_462_nl = ~(and_dcpl_84 | (~ mux_tmp_92));
  assign mux_tmp_93 = MUX_s_1_2_2(nor_462_nl, mux_tmp_92, or_226_cse);
  assign nor_463_nl = ~(and_dcpl_111 | (~ mux_tmp_93));
  assign mux_94_nl = MUX_s_1_2_2(nor_463_nl, mux_tmp_93, or_217_cse);
  assign and_tmp_70 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & mux_94_nl;
  assign nor_464_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_70));
  assign mux_95_nl = MUX_s_1_2_2(nor_464_nl, and_tmp_70, or_190_cse);
  assign and_dcpl_425 = mux_95_nl & and_dcpl_4 & and_dcpl_9;
  assign and_tmp_80 = ((~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b00)
      | (rem_12cyc_1_0!=2'b10)) & ((~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) |
      (rem_12cyc_st_7_1_0!=2'b10) | (rem_12cyc_st_7_3_2!=2'b00)) & ((~ main_stage_0_9)
      | (~ COMP_LOOP_asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b10) | (rem_12cyc_st_8_3_2!=2'b00))
      & ((~ main_stage_0_10) | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b10)
      | (rem_12cyc_st_9_3_2!=2'b00)) & or_195_cse & or_199_cse & or_204_cse & or_210_cse
      & ((~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b10)
      | (rem_12cyc_st_6_3_2!=2'b00)) & ((~ main_stage_0_11) | (~ COMP_LOOP_asn_itm_10)
      | (rem_12cyc_st_10_1_0!=2'b10) | (rem_12cyc_st_10_3_2!=2'b00)) & ((COMP_LOOP_acc_tmp!=2'b00)
      | (COMP_LOOP_acc_1_tmp[1:0]!=2'b10) | (~ ccs_ccore_start_rsci_idat));
  assign and_dcpl_430 = (COMP_LOOP_acc_1_tmp[1:0]==2'b11);
  assign and_dcpl_431 = and_dcpl_293 & and_dcpl_430;
  assign or_tmp_263 = (rem_12cyc_1_0!=2'b11) | (rem_12cyc_3_2!=2'b00) | not_tmp_54;
  assign or_270_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b11) | (COMP_LOOP_acc_tmp!=2'b00);
  assign nor_459_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_263));
  assign mux_96_nl = MUX_s_1_2_2(nor_459_nl, or_tmp_263, or_270_cse);
  assign and_dcpl_433 = mux_96_nl & and_dcpl_358 & and_dcpl_395;
  assign or_275_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b00);
  assign and_1142_nl = nand_276_cse & or_tmp_263;
  assign mux_tmp_97 = MUX_s_1_2_2(and_1142_nl, or_tmp_263, or_275_cse);
  assign nor_458_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_97));
  assign mux_98_nl = MUX_s_1_2_2(nor_458_nl, mux_tmp_97, or_270_cse);
  assign and_dcpl_435 = mux_98_nl & and_dcpl_362 & and_dcpl_398;
  assign or_280_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b00);
  assign and_1140_nl = nand_274_cse & or_tmp_263;
  assign mux_tmp_99 = MUX_s_1_2_2(and_1140_nl, or_tmp_263, or_280_cse);
  assign and_1141_nl = nand_276_cse & mux_tmp_99;
  assign mux_tmp_100 = MUX_s_1_2_2(and_1141_nl, mux_tmp_99, or_275_cse);
  assign nor_457_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_100));
  assign mux_101_nl = MUX_s_1_2_2(nor_457_nl, mux_tmp_100, or_270_cse);
  assign and_dcpl_437 = mux_101_nl & and_dcpl_366 & and_dcpl_401;
  assign or_287_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b00);
  assign and_1137_nl = nand_271_cse & or_tmp_263;
  assign mux_tmp_102 = MUX_s_1_2_2(and_1137_nl, or_tmp_263, or_287_cse);
  assign and_1138_nl = nand_274_cse & mux_tmp_102;
  assign mux_tmp_103 = MUX_s_1_2_2(and_1138_nl, mux_tmp_102, or_280_cse);
  assign and_1139_nl = nand_276_cse & mux_tmp_103;
  assign mux_tmp_104 = MUX_s_1_2_2(and_1139_nl, mux_tmp_103, or_275_cse);
  assign nor_456_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_104));
  assign mux_105_nl = MUX_s_1_2_2(nor_456_nl, mux_tmp_104, or_270_cse);
  assign and_dcpl_439 = mux_105_nl & and_dcpl_370 & and_dcpl_404;
  assign or_296_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b00);
  assign and_1133_nl = nand_267_cse & or_tmp_263;
  assign mux_tmp_106 = MUX_s_1_2_2(and_1133_nl, or_tmp_263, or_296_cse);
  assign and_1134_nl = nand_271_cse & mux_tmp_106;
  assign mux_tmp_107 = MUX_s_1_2_2(and_1134_nl, mux_tmp_106, or_287_cse);
  assign and_1135_nl = nand_274_cse & mux_tmp_107;
  assign mux_tmp_108 = MUX_s_1_2_2(and_1135_nl, mux_tmp_107, or_280_cse);
  assign and_1136_nl = nand_276_cse & mux_tmp_108;
  assign mux_tmp_109 = MUX_s_1_2_2(and_1136_nl, mux_tmp_108, or_275_cse);
  assign nor_455_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_109));
  assign mux_110_nl = MUX_s_1_2_2(nor_455_nl, mux_tmp_109, or_270_cse);
  assign and_dcpl_442 = mux_110_nl & and_dcpl_112 & and_dcpl_119;
  assign or_307_cse = (rem_12cyc_st_6_1_0!=2'b11) | (rem_12cyc_st_6_3_2!=2'b00);
  assign nor_453_nl = ~(and_dcpl_111 | (~ or_tmp_263));
  assign mux_tmp_111 = MUX_s_1_2_2(nor_453_nl, or_tmp_263, or_307_cse);
  assign and_1129_nl = nand_267_cse & mux_tmp_111;
  assign mux_tmp_112 = MUX_s_1_2_2(and_1129_nl, mux_tmp_111, or_296_cse);
  assign and_1130_nl = nand_271_cse & mux_tmp_112;
  assign mux_tmp_113 = MUX_s_1_2_2(and_1130_nl, mux_tmp_112, or_287_cse);
  assign and_1131_nl = nand_274_cse & mux_tmp_113;
  assign mux_tmp_114 = MUX_s_1_2_2(and_1131_nl, mux_tmp_113, or_280_cse);
  assign and_1132_nl = nand_276_cse & mux_tmp_114;
  assign mux_tmp_115 = MUX_s_1_2_2(and_1132_nl, mux_tmp_114, or_275_cse);
  assign nor_454_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_115));
  assign mux_116_nl = MUX_s_1_2_2(nor_454_nl, mux_tmp_115, or_270_cse);
  assign and_dcpl_445 = mux_116_nl & and_dcpl_85 & and_dcpl_92;
  assign or_320_cse = (rem_12cyc_st_7_1_0!=2'b11) | (rem_12cyc_st_7_3_2!=2'b00);
  assign nor_450_nl = ~(and_dcpl_84 | (~ or_tmp_263));
  assign mux_tmp_117 = MUX_s_1_2_2(nor_450_nl, or_tmp_263, or_320_cse);
  assign nor_451_nl = ~(and_dcpl_111 | (~ mux_tmp_117));
  assign mux_tmp_118 = MUX_s_1_2_2(nor_451_nl, mux_tmp_117, or_307_cse);
  assign and_1125_nl = nand_267_cse & mux_tmp_118;
  assign mux_tmp_119 = MUX_s_1_2_2(and_1125_nl, mux_tmp_118, or_296_cse);
  assign and_1126_nl = nand_271_cse & mux_tmp_119;
  assign mux_tmp_120 = MUX_s_1_2_2(and_1126_nl, mux_tmp_119, or_287_cse);
  assign and_1127_nl = nand_274_cse & mux_tmp_120;
  assign mux_tmp_121 = MUX_s_1_2_2(and_1127_nl, mux_tmp_120, or_280_cse);
  assign and_1128_nl = nand_276_cse & mux_tmp_121;
  assign mux_tmp_122 = MUX_s_1_2_2(and_1128_nl, mux_tmp_121, or_275_cse);
  assign nor_452_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_122));
  assign mux_123_nl = MUX_s_1_2_2(nor_452_nl, mux_tmp_122, or_270_cse);
  assign and_dcpl_448 = mux_123_nl & and_dcpl_58 & and_dcpl_65;
  assign or_335_cse = (rem_12cyc_st_8_1_0!=2'b11) | (rem_12cyc_st_8_3_2!=2'b00);
  assign nor_446_nl = ~(and_dcpl_57 | (~ or_tmp_263));
  assign mux_tmp_124 = MUX_s_1_2_2(nor_446_nl, or_tmp_263, or_335_cse);
  assign nor_447_nl = ~(and_dcpl_84 | (~ mux_tmp_124));
  assign mux_tmp_125 = MUX_s_1_2_2(nor_447_nl, mux_tmp_124, or_320_cse);
  assign nor_448_nl = ~(and_dcpl_111 | (~ mux_tmp_125));
  assign mux_tmp_126 = MUX_s_1_2_2(nor_448_nl, mux_tmp_125, or_307_cse);
  assign and_1121_nl = nand_267_cse & mux_tmp_126;
  assign mux_tmp_127 = MUX_s_1_2_2(and_1121_nl, mux_tmp_126, or_296_cse);
  assign and_1122_nl = nand_271_cse & mux_tmp_127;
  assign mux_tmp_128 = MUX_s_1_2_2(and_1122_nl, mux_tmp_127, or_287_cse);
  assign and_1123_nl = nand_274_cse & mux_tmp_128;
  assign mux_tmp_129 = MUX_s_1_2_2(and_1123_nl, mux_tmp_128, or_280_cse);
  assign and_1124_nl = nand_276_cse & mux_tmp_129;
  assign mux_tmp_130 = MUX_s_1_2_2(and_1124_nl, mux_tmp_129, or_275_cse);
  assign nor_449_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_130));
  assign mux_131_nl = MUX_s_1_2_2(nor_449_nl, mux_tmp_130, or_270_cse);
  assign and_dcpl_451 = mux_131_nl & and_dcpl_31 & and_dcpl_38;
  assign nor_441_nl = ~(and_dcpl_30 | (~ or_tmp_263));
  assign or_352_nl = (rem_12cyc_st_9_1_0!=2'b11) | (rem_12cyc_st_9_3_2!=2'b00);
  assign mux_tmp_132 = MUX_s_1_2_2(nor_441_nl, or_tmp_263, or_352_nl);
  assign nor_442_nl = ~(and_dcpl_57 | (~ mux_tmp_132));
  assign mux_tmp_133 = MUX_s_1_2_2(nor_442_nl, mux_tmp_132, or_335_cse);
  assign nor_443_nl = ~(and_dcpl_84 | (~ mux_tmp_133));
  assign mux_tmp_134 = MUX_s_1_2_2(nor_443_nl, mux_tmp_133, or_320_cse);
  assign nor_444_nl = ~(and_dcpl_111 | (~ mux_tmp_134));
  assign mux_tmp_135 = MUX_s_1_2_2(nor_444_nl, mux_tmp_134, or_307_cse);
  assign and_1117_nl = nand_267_cse & mux_tmp_135;
  assign mux_tmp_136 = MUX_s_1_2_2(and_1117_nl, mux_tmp_135, or_296_cse);
  assign and_1118_nl = nand_271_cse & mux_tmp_136;
  assign mux_tmp_137 = MUX_s_1_2_2(and_1118_nl, mux_tmp_136, or_287_cse);
  assign and_1119_nl = nand_274_cse & mux_tmp_137;
  assign mux_tmp_138 = MUX_s_1_2_2(and_1119_nl, mux_tmp_137, or_280_cse);
  assign and_1120_nl = nand_276_cse & mux_tmp_138;
  assign mux_tmp_139 = MUX_s_1_2_2(and_1120_nl, mux_tmp_138, or_275_cse);
  assign nor_445_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_139));
  assign mux_140_nl = MUX_s_1_2_2(nor_445_nl, mux_tmp_139, or_270_cse);
  assign and_dcpl_454 = mux_140_nl & and_dcpl_4 & and_dcpl_11;
  assign nand_222_cse = ~((COMP_LOOP_acc_1_tmp[1:0]==2'b11) & ccs_ccore_start_rsci_idat);
  assign and_tmp_89 = ((~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b11)
      | (rem_12cyc_st_7_3_2!=2'b00)) & ((~ main_stage_0_9) | (~ COMP_LOOP_asn_itm_8)
      | (rem_12cyc_st_8_1_0!=2'b11) | (rem_12cyc_st_8_3_2!=2'b00)) & ((~ main_stage_0_10)
      | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b11) | (rem_12cyc_st_9_3_2!=2'b00))
      & ((~ main_stage_0_3) | (~ COMP_LOOP_asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b11)
      | (rem_12cyc_st_2_3_2!=2'b00)) & ((~ main_stage_0_4) | (~ COMP_LOOP_asn_itm_3)
      | (rem_12cyc_st_3_1_0!=2'b11) | (rem_12cyc_st_3_3_2!=2'b00)) & ((~ main_stage_0_5)
      | (~ COMP_LOOP_asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b11) | (rem_12cyc_st_4_3_2!=2'b00))
      & ((~ main_stage_0_6) | (~ COMP_LOOP_asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b11)
      | (rem_12cyc_st_5_3_2!=2'b00)) & ((~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6)
      | (rem_12cyc_st_6_1_0!=2'b11) | (rem_12cyc_st_6_3_2!=2'b00)) & ((~ main_stage_0_11)
      | (~ COMP_LOOP_asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b11) | (rem_12cyc_st_10_3_2!=2'b00))
      & ((COMP_LOOP_acc_tmp!=2'b00) | nand_222_cse);
  assign nand_223_cse = ~((rem_12cyc_1_0==2'b11));
  assign and_1116_nl = nand_223_cse & and_tmp_89;
  assign or_362_nl = (~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b00);
  assign mux_tmp_141 = MUX_s_1_2_2(and_1116_nl, and_tmp_89, or_362_nl);
  assign and_dcpl_460 = ccs_ccore_start_rsci_idat & (COMP_LOOP_acc_tmp==2'b01);
  assign and_dcpl_461 = and_dcpl_460 & and_dcpl_291;
  assign and_dcpl_462 = (rem_12cyc_st_2_3_2==2'b01);
  assign and_dcpl_463 = and_dcpl_462 & (~ (rem_12cyc_st_2_1_0[1]));
  assign not_tmp_332 = ~((rem_12cyc_3_2[0]) & COMP_LOOP_asn_itm_1 & main_stage_0_2);
  assign or_tmp_368 = (rem_12cyc_1_0!=2'b00) | (rem_12cyc_3_2[1]) | not_tmp_332;
  assign nand_281_cse = ~((COMP_LOOP_acc_tmp[0]) & ccs_ccore_start_rsci_idat);
  assign or_377_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b00) | (COMP_LOOP_acc_tmp[1]);
  assign and_1172_nl = nand_281_cse & or_tmp_368;
  assign mux_142_nl = MUX_s_1_2_2(and_1172_nl, or_tmp_368, or_377_cse);
  assign and_dcpl_465 = mux_142_nl & and_dcpl_298 & and_dcpl_463;
  assign and_dcpl_466 = (rem_12cyc_st_3_3_2==2'b01);
  assign and_dcpl_467 = and_dcpl_466 & (~ (rem_12cyc_st_3_1_0[1]));
  assign or_382_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b01) | (~
      COMP_LOOP_asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_90 = or_382_cse & or_tmp_368;
  assign and_1114_nl = nand_281_cse & and_tmp_90;
  assign mux_143_nl = MUX_s_1_2_2(and_1114_nl, and_tmp_90, or_377_cse);
  assign and_dcpl_469 = mux_143_nl & and_dcpl_304 & and_dcpl_467;
  assign and_dcpl_470 = (rem_12cyc_st_4_3_2==2'b01);
  assign and_dcpl_471 = and_dcpl_470 & (~ (rem_12cyc_st_4_1_0[1]));
  assign or_386_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b01) | (~
      COMP_LOOP_asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_92 = or_382_cse & or_386_cse & or_tmp_368;
  assign and_1113_nl = nand_281_cse & and_tmp_92;
  assign mux_144_nl = MUX_s_1_2_2(and_1113_nl, and_tmp_92, or_377_cse);
  assign and_dcpl_473 = mux_144_nl & and_dcpl_310 & and_dcpl_471;
  assign and_dcpl_474 = (rem_12cyc_st_5_3_2==2'b01);
  assign and_dcpl_475 = and_dcpl_474 & (~ (rem_12cyc_st_5_1_0[1]));
  assign or_391_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b01) | (~
      COMP_LOOP_asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_95 = or_382_cse & or_386_cse & or_391_cse & or_tmp_368;
  assign and_1112_nl = nand_281_cse & and_tmp_95;
  assign mux_145_nl = MUX_s_1_2_2(and_1112_nl, and_tmp_95, or_377_cse);
  assign and_dcpl_477 = mux_145_nl & and_dcpl_316 & and_dcpl_475;
  assign or_397_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b01) | (~
      COMP_LOOP_asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_99 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & or_tmp_368;
  assign and_1111_nl = nand_281_cse & and_tmp_99;
  assign mux_146_nl = MUX_s_1_2_2(and_1111_nl, and_tmp_99, or_377_cse);
  assign and_dcpl_480 = mux_146_nl & and_dcpl_121 & and_dcpl_110;
  assign nand_215_cse = ~((rem_12cyc_st_6_3_2[0]) & COMP_LOOP_asn_itm_6 & main_stage_0_7);
  assign or_404_cse = (rem_12cyc_st_6_1_0!=2'b00) | (rem_12cyc_st_6_3_2[1]);
  assign and_1109_nl = nand_215_cse & or_tmp_368;
  assign mux_147_nl = MUX_s_1_2_2(and_1109_nl, or_tmp_368, or_404_cse);
  assign and_tmp_103 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & mux_147_nl;
  assign and_1110_nl = nand_281_cse & and_tmp_103;
  assign mux_148_nl = MUX_s_1_2_2(and_1110_nl, and_tmp_103, or_377_cse);
  assign and_dcpl_483 = mux_148_nl & and_dcpl_94 & and_dcpl_83;
  assign nand_212_cse = ~((rem_12cyc_st_7_3_2[0]) & COMP_LOOP_asn_itm_7 & main_stage_0_8);
  assign or_413_cse = (rem_12cyc_st_7_1_0!=2'b00) | (rem_12cyc_st_7_3_2[1]);
  assign and_1106_nl = nand_212_cse & or_tmp_368;
  assign mux_tmp_149 = MUX_s_1_2_2(and_1106_nl, or_tmp_368, or_413_cse);
  assign and_1107_nl = nand_215_cse & mux_tmp_149;
  assign mux_150_nl = MUX_s_1_2_2(and_1107_nl, mux_tmp_149, or_404_cse);
  assign and_tmp_107 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & mux_150_nl;
  assign and_1108_nl = nand_281_cse & and_tmp_107;
  assign mux_151_nl = MUX_s_1_2_2(and_1108_nl, and_tmp_107, or_377_cse);
  assign and_dcpl_486 = mux_151_nl & and_dcpl_67 & and_dcpl_56;
  assign nand_208_cse = ~((rem_12cyc_st_8_3_2[0]) & COMP_LOOP_asn_itm_8 & main_stage_0_9);
  assign or_424_cse = (rem_12cyc_st_8_1_0!=2'b00) | (rem_12cyc_st_8_3_2[1]);
  assign and_1102_nl = nand_208_cse & or_tmp_368;
  assign mux_tmp_152 = MUX_s_1_2_2(and_1102_nl, or_tmp_368, or_424_cse);
  assign and_1103_nl = nand_212_cse & mux_tmp_152;
  assign mux_tmp_153 = MUX_s_1_2_2(and_1103_nl, mux_tmp_152, or_413_cse);
  assign and_1104_nl = nand_215_cse & mux_tmp_153;
  assign mux_154_nl = MUX_s_1_2_2(and_1104_nl, mux_tmp_153, or_404_cse);
  assign and_tmp_111 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & mux_154_nl;
  assign and_1105_nl = nand_281_cse & and_tmp_111;
  assign mux_155_nl = MUX_s_1_2_2(and_1105_nl, and_tmp_111, or_377_cse);
  assign and_dcpl_489 = mux_155_nl & and_dcpl_40 & and_dcpl_29;
  assign nand_203_cse = ~((rem_12cyc_st_9_3_2[0]) & COMP_LOOP_asn_itm_9 & main_stage_0_10);
  assign and_1097_nl = nand_203_cse & or_tmp_368;
  assign or_437_nl = (rem_12cyc_st_9_1_0!=2'b00) | (rem_12cyc_st_9_3_2[1]);
  assign mux_tmp_156 = MUX_s_1_2_2(and_1097_nl, or_tmp_368, or_437_nl);
  assign and_1098_nl = nand_208_cse & mux_tmp_156;
  assign mux_tmp_157 = MUX_s_1_2_2(and_1098_nl, mux_tmp_156, or_424_cse);
  assign and_1099_nl = nand_212_cse & mux_tmp_157;
  assign mux_tmp_158 = MUX_s_1_2_2(and_1099_nl, mux_tmp_157, or_413_cse);
  assign and_1100_nl = nand_215_cse & mux_tmp_158;
  assign mux_159_nl = MUX_s_1_2_2(and_1100_nl, mux_tmp_158, or_404_cse);
  assign and_tmp_115 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & mux_159_nl;
  assign and_1101_nl = nand_281_cse & and_tmp_115;
  assign mux_160_nl = MUX_s_1_2_2(and_1101_nl, and_tmp_115, or_377_cse);
  assign and_dcpl_492 = mux_160_nl & and_dcpl_13 & and_dcpl_2;
  assign and_tmp_125 = ((~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b01)
      | (rem_12cyc_1_0!=2'b00)) & ((~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) |
      (rem_12cyc_st_7_1_0!=2'b00) | (rem_12cyc_st_7_3_2!=2'b01)) & ((~ main_stage_0_9)
      | (~ COMP_LOOP_asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b00) | (rem_12cyc_st_8_3_2!=2'b01))
      & ((~ main_stage_0_10) | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b00)
      | (rem_12cyc_st_9_3_2!=2'b01)) & or_382_cse & or_386_cse & or_391_cse & or_397_cse
      & ((~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b00)
      | (rem_12cyc_st_6_3_2!=2'b01)) & ((~ main_stage_0_11) | (~ COMP_LOOP_asn_itm_10)
      | (rem_12cyc_st_10_1_0!=2'b00) | (rem_12cyc_st_10_3_2!=2'b01)) & ((COMP_LOOP_acc_tmp!=2'b01)
      | (COMP_LOOP_acc_1_tmp[1:0]!=2'b00) | (~ ccs_ccore_start_rsci_idat));
  assign and_dcpl_498 = and_dcpl_460 & and_dcpl_355;
  assign or_tmp_446 = (rem_12cyc_1_0!=2'b01) | (rem_12cyc_3_2[1]) | not_tmp_332;
  assign or_458_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b01) | (COMP_LOOP_acc_tmp[1]);
  assign and_1171_nl = nand_281_cse & or_tmp_446;
  assign mux_161_nl = MUX_s_1_2_2(and_1171_nl, or_tmp_446, or_458_cse);
  assign and_dcpl_500 = mux_161_nl & and_dcpl_358 & and_dcpl_463;
  assign or_463_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b01);
  assign and_1094_nl = nand_276_cse & or_tmp_446;
  assign mux_tmp_162 = MUX_s_1_2_2(and_1094_nl, or_tmp_446, or_463_cse);
  assign and_1095_nl = nand_281_cse & mux_tmp_162;
  assign mux_163_nl = MUX_s_1_2_2(and_1095_nl, mux_tmp_162, or_458_cse);
  assign and_dcpl_502 = mux_163_nl & and_dcpl_362 & and_dcpl_467;
  assign nand_198_cse = ~((rem_12cyc_st_3_3_2[0]) & COMP_LOOP_asn_itm_3 & main_stage_0_4
      & (rem_12cyc_st_3_1_0[0]));
  assign or_468_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2[1]);
  assign and_1091_nl = nand_198_cse & or_tmp_446;
  assign mux_tmp_164 = MUX_s_1_2_2(and_1091_nl, or_tmp_446, or_468_cse);
  assign and_1092_nl = nand_276_cse & mux_tmp_164;
  assign mux_tmp_165 = MUX_s_1_2_2(and_1092_nl, mux_tmp_164, or_463_cse);
  assign and_1093_nl = nand_281_cse & mux_tmp_165;
  assign mux_166_nl = MUX_s_1_2_2(and_1093_nl, mux_tmp_165, or_458_cse);
  assign and_dcpl_504 = mux_166_nl & and_dcpl_366 & and_dcpl_471;
  assign or_475_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b01);
  assign and_1087_nl = nand_271_cse & or_tmp_446;
  assign mux_tmp_167 = MUX_s_1_2_2(and_1087_nl, or_tmp_446, or_475_cse);
  assign and_1088_nl = nand_198_cse & mux_tmp_167;
  assign mux_tmp_168 = MUX_s_1_2_2(and_1088_nl, mux_tmp_167, or_468_cse);
  assign and_1089_nl = nand_276_cse & mux_tmp_168;
  assign mux_tmp_169 = MUX_s_1_2_2(and_1089_nl, mux_tmp_168, or_463_cse);
  assign and_1090_nl = nand_281_cse & mux_tmp_169;
  assign mux_170_nl = MUX_s_1_2_2(and_1090_nl, mux_tmp_169, or_458_cse);
  assign and_dcpl_506 = mux_170_nl & and_dcpl_370 & and_dcpl_475;
  assign nand_189_cse = ~((rem_12cyc_st_5_3_2[0]) & COMP_LOOP_asn_itm_5 & main_stage_0_6
      & (rem_12cyc_st_5_1_0[0]));
  assign or_484_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2[1]);
  assign and_1082_nl = nand_189_cse & or_tmp_446;
  assign mux_tmp_171 = MUX_s_1_2_2(and_1082_nl, or_tmp_446, or_484_cse);
  assign and_1083_nl = nand_271_cse & mux_tmp_171;
  assign mux_tmp_172 = MUX_s_1_2_2(and_1083_nl, mux_tmp_171, or_475_cse);
  assign and_1084_nl = nand_198_cse & mux_tmp_172;
  assign mux_tmp_173 = MUX_s_1_2_2(and_1084_nl, mux_tmp_172, or_468_cse);
  assign and_1085_nl = nand_276_cse & mux_tmp_173;
  assign mux_tmp_174 = MUX_s_1_2_2(and_1085_nl, mux_tmp_173, or_463_cse);
  assign and_1086_nl = nand_281_cse & mux_tmp_174;
  assign mux_175_nl = MUX_s_1_2_2(and_1086_nl, mux_tmp_174, or_458_cse);
  assign and_dcpl_508 = mux_175_nl & and_dcpl_121 & and_dcpl_115;
  assign or_495_cse = (rem_12cyc_st_6_1_0!=2'b01) | (rem_12cyc_st_6_3_2[1]);
  assign and_1076_nl = nand_215_cse & or_tmp_446;
  assign mux_tmp_176 = MUX_s_1_2_2(and_1076_nl, or_tmp_446, or_495_cse);
  assign and_1077_nl = nand_189_cse & mux_tmp_176;
  assign mux_tmp_177 = MUX_s_1_2_2(and_1077_nl, mux_tmp_176, or_484_cse);
  assign and_1078_nl = nand_271_cse & mux_tmp_177;
  assign mux_tmp_178 = MUX_s_1_2_2(and_1078_nl, mux_tmp_177, or_475_cse);
  assign and_1079_nl = nand_198_cse & mux_tmp_178;
  assign mux_tmp_179 = MUX_s_1_2_2(and_1079_nl, mux_tmp_178, or_468_cse);
  assign and_1080_nl = nand_276_cse & mux_tmp_179;
  assign mux_tmp_180 = MUX_s_1_2_2(and_1080_nl, mux_tmp_179, or_463_cse);
  assign and_1081_nl = nand_281_cse & mux_tmp_180;
  assign mux_181_nl = MUX_s_1_2_2(and_1081_nl, mux_tmp_180, or_458_cse);
  assign and_dcpl_510 = mux_181_nl & and_dcpl_94 & and_dcpl_87;
  assign or_508_cse = (rem_12cyc_st_7_1_0!=2'b01) | (rem_12cyc_st_7_3_2[1]);
  assign and_1069_nl = nand_212_cse & or_tmp_446;
  assign mux_tmp_182 = MUX_s_1_2_2(and_1069_nl, or_tmp_446, or_508_cse);
  assign and_1070_nl = nand_215_cse & mux_tmp_182;
  assign mux_tmp_183 = MUX_s_1_2_2(and_1070_nl, mux_tmp_182, or_495_cse);
  assign and_1071_nl = nand_189_cse & mux_tmp_183;
  assign mux_tmp_184 = MUX_s_1_2_2(and_1071_nl, mux_tmp_183, or_484_cse);
  assign and_1072_nl = nand_271_cse & mux_tmp_184;
  assign mux_tmp_185 = MUX_s_1_2_2(and_1072_nl, mux_tmp_184, or_475_cse);
  assign and_1073_nl = nand_198_cse & mux_tmp_185;
  assign mux_tmp_186 = MUX_s_1_2_2(and_1073_nl, mux_tmp_185, or_468_cse);
  assign and_1074_nl = nand_276_cse & mux_tmp_186;
  assign mux_tmp_187 = MUX_s_1_2_2(and_1074_nl, mux_tmp_186, or_463_cse);
  assign and_1075_nl = nand_281_cse & mux_tmp_187;
  assign mux_188_nl = MUX_s_1_2_2(and_1075_nl, mux_tmp_187, or_458_cse);
  assign and_dcpl_512 = mux_188_nl & and_dcpl_67 & and_dcpl_60;
  assign or_523_cse = (rem_12cyc_st_8_1_0!=2'b01) | (rem_12cyc_st_8_3_2[1]);
  assign and_1061_nl = nand_208_cse & or_tmp_446;
  assign mux_tmp_189 = MUX_s_1_2_2(and_1061_nl, or_tmp_446, or_523_cse);
  assign and_1062_nl = nand_212_cse & mux_tmp_189;
  assign mux_tmp_190 = MUX_s_1_2_2(and_1062_nl, mux_tmp_189, or_508_cse);
  assign and_1063_nl = nand_215_cse & mux_tmp_190;
  assign mux_tmp_191 = MUX_s_1_2_2(and_1063_nl, mux_tmp_190, or_495_cse);
  assign and_1064_nl = nand_189_cse & mux_tmp_191;
  assign mux_tmp_192 = MUX_s_1_2_2(and_1064_nl, mux_tmp_191, or_484_cse);
  assign and_1065_nl = nand_271_cse & mux_tmp_192;
  assign mux_tmp_193 = MUX_s_1_2_2(and_1065_nl, mux_tmp_192, or_475_cse);
  assign and_1066_nl = nand_198_cse & mux_tmp_193;
  assign mux_tmp_194 = MUX_s_1_2_2(and_1066_nl, mux_tmp_193, or_468_cse);
  assign and_1067_nl = nand_276_cse & mux_tmp_194;
  assign mux_tmp_195 = MUX_s_1_2_2(and_1067_nl, mux_tmp_194, or_463_cse);
  assign and_1068_nl = nand_281_cse & mux_tmp_195;
  assign mux_196_nl = MUX_s_1_2_2(and_1068_nl, mux_tmp_195, or_458_cse);
  assign and_dcpl_514 = mux_196_nl & and_dcpl_40 & and_dcpl_33;
  assign and_1052_nl = nand_203_cse & or_tmp_446;
  assign or_540_nl = (rem_12cyc_st_9_1_0!=2'b01) | (rem_12cyc_st_9_3_2[1]);
  assign mux_tmp_197 = MUX_s_1_2_2(and_1052_nl, or_tmp_446, or_540_nl);
  assign and_1053_nl = nand_208_cse & mux_tmp_197;
  assign mux_tmp_198 = MUX_s_1_2_2(and_1053_nl, mux_tmp_197, or_523_cse);
  assign and_1054_nl = nand_212_cse & mux_tmp_198;
  assign mux_tmp_199 = MUX_s_1_2_2(and_1054_nl, mux_tmp_198, or_508_cse);
  assign and_1055_nl = nand_215_cse & mux_tmp_199;
  assign mux_tmp_200 = MUX_s_1_2_2(and_1055_nl, mux_tmp_199, or_495_cse);
  assign and_1056_nl = nand_189_cse & mux_tmp_200;
  assign mux_tmp_201 = MUX_s_1_2_2(and_1056_nl, mux_tmp_200, or_484_cse);
  assign and_1057_nl = nand_271_cse & mux_tmp_201;
  assign mux_tmp_202 = MUX_s_1_2_2(and_1057_nl, mux_tmp_201, or_475_cse);
  assign and_1058_nl = nand_198_cse & mux_tmp_202;
  assign mux_tmp_203 = MUX_s_1_2_2(and_1058_nl, mux_tmp_202, or_468_cse);
  assign and_1059_nl = nand_276_cse & mux_tmp_203;
  assign mux_tmp_204 = MUX_s_1_2_2(and_1059_nl, mux_tmp_203, or_463_cse);
  assign and_1060_nl = nand_281_cse & mux_tmp_204;
  assign mux_205_nl = MUX_s_1_2_2(and_1060_nl, mux_tmp_204, or_458_cse);
  assign and_dcpl_516 = mux_205_nl & and_dcpl_13 & and_dcpl_6;
  assign and_tmp_134 = ((~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b01)
      | (rem_12cyc_st_7_3_2!=2'b01)) & ((~ main_stage_0_9) | (~ COMP_LOOP_asn_itm_8)
      | (rem_12cyc_st_8_1_0!=2'b01) | (rem_12cyc_st_8_3_2!=2'b01)) & ((~ main_stage_0_10)
      | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b01) | (rem_12cyc_st_9_3_2!=2'b01))
      & ((~ main_stage_0_3) | (~ COMP_LOOP_asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b01)
      | (rem_12cyc_st_2_3_2!=2'b01)) & ((~ main_stage_0_4) | (~ COMP_LOOP_asn_itm_3)
      | (rem_12cyc_st_3_1_0!=2'b01) | (rem_12cyc_st_3_3_2!=2'b01)) & ((~ main_stage_0_5)
      | (~ COMP_LOOP_asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b01) | (rem_12cyc_st_4_3_2!=2'b01))
      & ((~ main_stage_0_6) | (~ COMP_LOOP_asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b01)
      | (rem_12cyc_st_5_3_2!=2'b01)) & ((~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6)
      | (rem_12cyc_st_6_1_0!=2'b01) | (rem_12cyc_st_6_3_2!=2'b01)) & ((~ main_stage_0_11)
      | (~ COMP_LOOP_asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b01) | (rem_12cyc_st_10_3_2!=2'b01))
      & ((COMP_LOOP_acc_tmp!=2'b01) | (COMP_LOOP_acc_1_tmp[1]) | nand_250_cse);
  assign nor_438_nl = ~((rem_12cyc_1_0[0]) | (~ and_tmp_134));
  assign or_550_nl = (~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b01)
      | (rem_12cyc_1_0[1]);
  assign mux_tmp_206 = MUX_s_1_2_2(nor_438_nl, and_tmp_134, or_550_nl);
  assign and_dcpl_520 = and_dcpl_460 & and_dcpl_393;
  assign and_dcpl_521 = and_dcpl_462 & (rem_12cyc_st_2_1_0[1]);
  assign or_tmp_551 = (rem_12cyc_1_0!=2'b10) | (rem_12cyc_3_2[1]) | not_tmp_332;
  assign or_564_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b10) | (COMP_LOOP_acc_tmp[1]);
  assign and_1170_nl = nand_281_cse & or_tmp_551;
  assign mux_207_nl = MUX_s_1_2_2(and_1170_nl, or_tmp_551, or_564_cse);
  assign and_dcpl_523 = mux_207_nl & and_dcpl_298 & and_dcpl_521;
  assign and_dcpl_524 = and_dcpl_466 & (rem_12cyc_st_3_1_0[1]);
  assign or_569_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b01) |
      (~ COMP_LOOP_asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_135 = or_569_cse & or_tmp_551;
  assign and_1050_nl = nand_281_cse & and_tmp_135;
  assign mux_208_nl = MUX_s_1_2_2(and_1050_nl, and_tmp_135, or_564_cse);
  assign and_dcpl_526 = mux_208_nl & and_dcpl_304 & and_dcpl_524;
  assign and_dcpl_527 = and_dcpl_470 & (rem_12cyc_st_4_1_0[1]);
  assign or_573_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b01) |
      (~ COMP_LOOP_asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_137 = or_569_cse & or_573_cse & or_tmp_551;
  assign and_1049_nl = nand_281_cse & and_tmp_137;
  assign mux_209_nl = MUX_s_1_2_2(and_1049_nl, and_tmp_137, or_564_cse);
  assign and_dcpl_529 = mux_209_nl & and_dcpl_310 & and_dcpl_527;
  assign and_dcpl_530 = and_dcpl_474 & (rem_12cyc_st_5_1_0[1]);
  assign or_578_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b01) |
      (~ COMP_LOOP_asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_140 = or_569_cse & or_573_cse & or_578_cse & or_tmp_551;
  assign and_1048_nl = nand_281_cse & and_tmp_140;
  assign mux_210_nl = MUX_s_1_2_2(and_1048_nl, and_tmp_140, or_564_cse);
  assign and_dcpl_532 = mux_210_nl & and_dcpl_316 & and_dcpl_530;
  assign or_584_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b01) |
      (~ COMP_LOOP_asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_144 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & or_tmp_551;
  assign and_1047_nl = nand_281_cse & and_tmp_144;
  assign mux_211_nl = MUX_s_1_2_2(and_1047_nl, and_tmp_144, or_564_cse);
  assign and_dcpl_534 = mux_211_nl & and_dcpl_121 & and_dcpl_117;
  assign or_591_cse = (rem_12cyc_st_6_1_0!=2'b10) | (rem_12cyc_st_6_3_2[1]);
  assign and_1045_nl = nand_215_cse & or_tmp_551;
  assign mux_212_nl = MUX_s_1_2_2(and_1045_nl, or_tmp_551, or_591_cse);
  assign and_tmp_148 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & mux_212_nl;
  assign and_1046_nl = nand_281_cse & and_tmp_148;
  assign mux_213_nl = MUX_s_1_2_2(and_1046_nl, and_tmp_148, or_564_cse);
  assign and_dcpl_536 = mux_213_nl & and_dcpl_94 & and_dcpl_90;
  assign or_600_cse = (rem_12cyc_st_7_1_0!=2'b10) | (rem_12cyc_st_7_3_2[1]);
  assign and_1042_nl = nand_212_cse & or_tmp_551;
  assign mux_tmp_214 = MUX_s_1_2_2(and_1042_nl, or_tmp_551, or_600_cse);
  assign and_1043_nl = nand_215_cse & mux_tmp_214;
  assign mux_215_nl = MUX_s_1_2_2(and_1043_nl, mux_tmp_214, or_591_cse);
  assign and_tmp_152 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & mux_215_nl;
  assign and_1044_nl = nand_281_cse & and_tmp_152;
  assign mux_216_nl = MUX_s_1_2_2(and_1044_nl, and_tmp_152, or_564_cse);
  assign and_dcpl_538 = mux_216_nl & and_dcpl_67 & and_dcpl_63;
  assign or_611_cse = (rem_12cyc_st_8_1_0!=2'b10) | (rem_12cyc_st_8_3_2[1]);
  assign and_1038_nl = nand_208_cse & or_tmp_551;
  assign mux_tmp_217 = MUX_s_1_2_2(and_1038_nl, or_tmp_551, or_611_cse);
  assign and_1039_nl = nand_212_cse & mux_tmp_217;
  assign mux_tmp_218 = MUX_s_1_2_2(and_1039_nl, mux_tmp_217, or_600_cse);
  assign and_1040_nl = nand_215_cse & mux_tmp_218;
  assign mux_219_nl = MUX_s_1_2_2(and_1040_nl, mux_tmp_218, or_591_cse);
  assign and_tmp_156 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & mux_219_nl;
  assign and_1041_nl = nand_281_cse & and_tmp_156;
  assign mux_220_nl = MUX_s_1_2_2(and_1041_nl, and_tmp_156, or_564_cse);
  assign and_dcpl_540 = mux_220_nl & and_dcpl_40 & and_dcpl_36;
  assign and_1033_nl = nand_203_cse & or_tmp_551;
  assign or_624_nl = (rem_12cyc_st_9_1_0!=2'b10) | (rem_12cyc_st_9_3_2[1]);
  assign mux_tmp_221 = MUX_s_1_2_2(and_1033_nl, or_tmp_551, or_624_nl);
  assign and_1034_nl = nand_208_cse & mux_tmp_221;
  assign mux_tmp_222 = MUX_s_1_2_2(and_1034_nl, mux_tmp_221, or_611_cse);
  assign and_1035_nl = nand_212_cse & mux_tmp_222;
  assign mux_tmp_223 = MUX_s_1_2_2(and_1035_nl, mux_tmp_222, or_600_cse);
  assign and_1036_nl = nand_215_cse & mux_tmp_223;
  assign mux_224_nl = MUX_s_1_2_2(and_1036_nl, mux_tmp_223, or_591_cse);
  assign and_tmp_160 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & mux_224_nl;
  assign and_1037_nl = nand_281_cse & and_tmp_160;
  assign mux_225_nl = MUX_s_1_2_2(and_1037_nl, and_tmp_160, or_564_cse);
  assign and_dcpl_542 = mux_225_nl & and_dcpl_13 & and_dcpl_9;
  assign and_tmp_170 = ((~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b01)
      | (rem_12cyc_1_0!=2'b10)) & ((~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) |
      (rem_12cyc_st_7_1_0!=2'b10) | (rem_12cyc_st_7_3_2!=2'b01)) & ((~ main_stage_0_9)
      | (~ COMP_LOOP_asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b10) | (rem_12cyc_st_8_3_2!=2'b01))
      & ((~ main_stage_0_10) | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b10)
      | (rem_12cyc_st_9_3_2!=2'b01)) & or_569_cse & or_573_cse & or_578_cse & or_584_cse
      & ((~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b10)
      | (rem_12cyc_st_6_3_2!=2'b01)) & ((~ main_stage_0_11) | (~ COMP_LOOP_asn_itm_10)
      | (rem_12cyc_st_10_1_0!=2'b10) | (rem_12cyc_st_10_3_2!=2'b01)) & ((COMP_LOOP_acc_tmp!=2'b01)
      | (COMP_LOOP_acc_1_tmp[1:0]!=2'b10) | (~ ccs_ccore_start_rsci_idat));
  assign and_dcpl_546 = and_dcpl_460 & and_dcpl_430;
  assign or_tmp_629 = (rem_12cyc_1_0!=2'b11) | (rem_12cyc_3_2[1]) | not_tmp_332;
  assign or_643_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b11) | (COMP_LOOP_acc_tmp[1]);
  assign and_1169_nl = nand_281_cse & or_tmp_629;
  assign mux_226_nl = MUX_s_1_2_2(and_1169_nl, or_tmp_629, or_643_cse);
  assign and_dcpl_548 = mux_226_nl & and_dcpl_358 & and_dcpl_521;
  assign or_648_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b01);
  assign and_1030_nl = nand_276_cse & or_tmp_629;
  assign mux_tmp_227 = MUX_s_1_2_2(and_1030_nl, or_tmp_629, or_648_cse);
  assign and_1031_nl = nand_281_cse & mux_tmp_227;
  assign mux_228_nl = MUX_s_1_2_2(and_1031_nl, mux_tmp_227, or_643_cse);
  assign and_dcpl_550 = mux_228_nl & and_dcpl_362 & and_dcpl_524;
  assign or_653_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2[1]);
  assign and_1027_nl = nand_198_cse & or_tmp_629;
  assign mux_tmp_229 = MUX_s_1_2_2(and_1027_nl, or_tmp_629, or_653_cse);
  assign and_1028_nl = nand_276_cse & mux_tmp_229;
  assign mux_tmp_230 = MUX_s_1_2_2(and_1028_nl, mux_tmp_229, or_648_cse);
  assign and_1029_nl = nand_281_cse & mux_tmp_230;
  assign mux_231_nl = MUX_s_1_2_2(and_1029_nl, mux_tmp_230, or_643_cse);
  assign and_dcpl_552 = mux_231_nl & and_dcpl_366 & and_dcpl_527;
  assign or_660_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b01);
  assign and_1023_nl = nand_271_cse & or_tmp_629;
  assign mux_tmp_232 = MUX_s_1_2_2(and_1023_nl, or_tmp_629, or_660_cse);
  assign and_1024_nl = nand_198_cse & mux_tmp_232;
  assign mux_tmp_233 = MUX_s_1_2_2(and_1024_nl, mux_tmp_232, or_653_cse);
  assign and_1025_nl = nand_276_cse & mux_tmp_233;
  assign mux_tmp_234 = MUX_s_1_2_2(and_1025_nl, mux_tmp_233, or_648_cse);
  assign and_1026_nl = nand_281_cse & mux_tmp_234;
  assign mux_235_nl = MUX_s_1_2_2(and_1026_nl, mux_tmp_234, or_643_cse);
  assign and_dcpl_554 = mux_235_nl & and_dcpl_370 & and_dcpl_530;
  assign or_669_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2[1]);
  assign and_1018_nl = nand_189_cse & or_tmp_629;
  assign mux_tmp_236 = MUX_s_1_2_2(and_1018_nl, or_tmp_629, or_669_cse);
  assign and_1019_nl = nand_271_cse & mux_tmp_236;
  assign mux_tmp_237 = MUX_s_1_2_2(and_1019_nl, mux_tmp_236, or_660_cse);
  assign and_1020_nl = nand_198_cse & mux_tmp_237;
  assign mux_tmp_238 = MUX_s_1_2_2(and_1020_nl, mux_tmp_237, or_653_cse);
  assign and_1021_nl = nand_276_cse & mux_tmp_238;
  assign mux_tmp_239 = MUX_s_1_2_2(and_1021_nl, mux_tmp_238, or_648_cse);
  assign and_1022_nl = nand_281_cse & mux_tmp_239;
  assign mux_240_nl = MUX_s_1_2_2(and_1022_nl, mux_tmp_239, or_643_cse);
  assign and_dcpl_556 = mux_240_nl & and_dcpl_121 & and_dcpl_119;
  assign or_680_cse = (rem_12cyc_st_6_1_0!=2'b11) | (rem_12cyc_st_6_3_2[1]);
  assign and_1012_nl = nand_215_cse & or_tmp_629;
  assign mux_tmp_241 = MUX_s_1_2_2(and_1012_nl, or_tmp_629, or_680_cse);
  assign and_1013_nl = nand_189_cse & mux_tmp_241;
  assign mux_tmp_242 = MUX_s_1_2_2(and_1013_nl, mux_tmp_241, or_669_cse);
  assign and_1014_nl = nand_271_cse & mux_tmp_242;
  assign mux_tmp_243 = MUX_s_1_2_2(and_1014_nl, mux_tmp_242, or_660_cse);
  assign and_1015_nl = nand_198_cse & mux_tmp_243;
  assign mux_tmp_244 = MUX_s_1_2_2(and_1015_nl, mux_tmp_243, or_653_cse);
  assign and_1016_nl = nand_276_cse & mux_tmp_244;
  assign mux_tmp_245 = MUX_s_1_2_2(and_1016_nl, mux_tmp_244, or_648_cse);
  assign and_1017_nl = nand_281_cse & mux_tmp_245;
  assign mux_246_nl = MUX_s_1_2_2(and_1017_nl, mux_tmp_245, or_643_cse);
  assign and_dcpl_558 = mux_246_nl & and_dcpl_94 & and_dcpl_92;
  assign or_693_cse = (rem_12cyc_st_7_1_0!=2'b11) | (rem_12cyc_st_7_3_2[1]);
  assign and_1005_nl = nand_212_cse & or_tmp_629;
  assign mux_tmp_247 = MUX_s_1_2_2(and_1005_nl, or_tmp_629, or_693_cse);
  assign and_1006_nl = nand_215_cse & mux_tmp_247;
  assign mux_tmp_248 = MUX_s_1_2_2(and_1006_nl, mux_tmp_247, or_680_cse);
  assign and_1007_nl = nand_189_cse & mux_tmp_248;
  assign mux_tmp_249 = MUX_s_1_2_2(and_1007_nl, mux_tmp_248, or_669_cse);
  assign and_1008_nl = nand_271_cse & mux_tmp_249;
  assign mux_tmp_250 = MUX_s_1_2_2(and_1008_nl, mux_tmp_249, or_660_cse);
  assign and_1009_nl = nand_198_cse & mux_tmp_250;
  assign mux_tmp_251 = MUX_s_1_2_2(and_1009_nl, mux_tmp_250, or_653_cse);
  assign and_1010_nl = nand_276_cse & mux_tmp_251;
  assign mux_tmp_252 = MUX_s_1_2_2(and_1010_nl, mux_tmp_251, or_648_cse);
  assign and_1011_nl = nand_281_cse & mux_tmp_252;
  assign mux_253_nl = MUX_s_1_2_2(and_1011_nl, mux_tmp_252, or_643_cse);
  assign and_dcpl_560 = mux_253_nl & and_dcpl_67 & and_dcpl_65;
  assign or_708_cse = (rem_12cyc_st_8_1_0!=2'b11) | (rem_12cyc_st_8_3_2[1]);
  assign and_997_nl = nand_208_cse & or_tmp_629;
  assign mux_tmp_254 = MUX_s_1_2_2(and_997_nl, or_tmp_629, or_708_cse);
  assign and_998_nl = nand_212_cse & mux_tmp_254;
  assign mux_tmp_255 = MUX_s_1_2_2(and_998_nl, mux_tmp_254, or_693_cse);
  assign and_999_nl = nand_215_cse & mux_tmp_255;
  assign mux_tmp_256 = MUX_s_1_2_2(and_999_nl, mux_tmp_255, or_680_cse);
  assign and_1000_nl = nand_189_cse & mux_tmp_256;
  assign mux_tmp_257 = MUX_s_1_2_2(and_1000_nl, mux_tmp_256, or_669_cse);
  assign and_1001_nl = nand_271_cse & mux_tmp_257;
  assign mux_tmp_258 = MUX_s_1_2_2(and_1001_nl, mux_tmp_257, or_660_cse);
  assign and_1002_nl = nand_198_cse & mux_tmp_258;
  assign mux_tmp_259 = MUX_s_1_2_2(and_1002_nl, mux_tmp_258, or_653_cse);
  assign and_1003_nl = nand_276_cse & mux_tmp_259;
  assign mux_tmp_260 = MUX_s_1_2_2(and_1003_nl, mux_tmp_259, or_648_cse);
  assign and_1004_nl = nand_281_cse & mux_tmp_260;
  assign mux_261_nl = MUX_s_1_2_2(and_1004_nl, mux_tmp_260, or_643_cse);
  assign and_dcpl_562 = mux_261_nl & and_dcpl_40 & and_dcpl_38;
  assign and_988_nl = nand_203_cse & or_tmp_629;
  assign or_725_nl = (rem_12cyc_st_9_1_0!=2'b11) | (rem_12cyc_st_9_3_2[1]);
  assign mux_tmp_262 = MUX_s_1_2_2(and_988_nl, or_tmp_629, or_725_nl);
  assign and_989_nl = nand_208_cse & mux_tmp_262;
  assign mux_tmp_263 = MUX_s_1_2_2(and_989_nl, mux_tmp_262, or_708_cse);
  assign and_990_nl = nand_212_cse & mux_tmp_263;
  assign mux_tmp_264 = MUX_s_1_2_2(and_990_nl, mux_tmp_263, or_693_cse);
  assign and_991_nl = nand_215_cse & mux_tmp_264;
  assign mux_tmp_265 = MUX_s_1_2_2(and_991_nl, mux_tmp_264, or_680_cse);
  assign and_992_nl = nand_189_cse & mux_tmp_265;
  assign mux_tmp_266 = MUX_s_1_2_2(and_992_nl, mux_tmp_265, or_669_cse);
  assign and_993_nl = nand_271_cse & mux_tmp_266;
  assign mux_tmp_267 = MUX_s_1_2_2(and_993_nl, mux_tmp_266, or_660_cse);
  assign and_994_nl = nand_198_cse & mux_tmp_267;
  assign mux_tmp_268 = MUX_s_1_2_2(and_994_nl, mux_tmp_267, or_653_cse);
  assign and_995_nl = nand_276_cse & mux_tmp_268;
  assign mux_tmp_269 = MUX_s_1_2_2(and_995_nl, mux_tmp_268, or_648_cse);
  assign and_996_nl = nand_281_cse & mux_tmp_269;
  assign mux_270_nl = MUX_s_1_2_2(and_996_nl, mux_tmp_269, or_643_cse);
  assign and_dcpl_564 = mux_270_nl & and_dcpl_13 & and_dcpl_11;
  assign and_tmp_179 = (~(main_stage_0_8 & COMP_LOOP_asn_itm_7 & (rem_12cyc_st_7_1_0==2'b11)
      & (rem_12cyc_st_7_3_2==2'b01))) & (~(main_stage_0_9 & COMP_LOOP_asn_itm_8 &
      (rem_12cyc_st_8_1_0==2'b11) & (rem_12cyc_st_8_3_2==2'b01))) & (~(main_stage_0_10
      & COMP_LOOP_asn_itm_9 & (rem_12cyc_st_9_1_0==2'b11) & (rem_12cyc_st_9_3_2==2'b01)))
      & (~(main_stage_0_3 & COMP_LOOP_asn_itm_2 & (rem_12cyc_st_2_1_0==2'b11) & (rem_12cyc_st_2_3_2==2'b01)))
      & (~(main_stage_0_4 & COMP_LOOP_asn_itm_3 & (rem_12cyc_st_3_1_0==2'b11) & (rem_12cyc_st_3_3_2==2'b01)))
      & (~(main_stage_0_5 & COMP_LOOP_asn_itm_4 & (rem_12cyc_st_4_1_0==2'b11) & (rem_12cyc_st_4_3_2==2'b01)))
      & (~(main_stage_0_6 & COMP_LOOP_asn_itm_5 & (rem_12cyc_st_5_1_0==2'b11) & (rem_12cyc_st_5_3_2==2'b01)))
      & (~(main_stage_0_7 & COMP_LOOP_asn_itm_6 & (rem_12cyc_st_6_1_0==2'b11) & (rem_12cyc_st_6_3_2==2'b01)))
      & (~(main_stage_0_11 & COMP_LOOP_asn_itm_10 & (rem_12cyc_st_10_1_0==2'b11)
      & (rem_12cyc_st_10_3_2==2'b01))) & ((COMP_LOOP_acc_tmp[1]) | (~((COMP_LOOP_acc_tmp[0])
      & (COMP_LOOP_acc_1_tmp[1:0]==2'b11) & ccs_ccore_start_rsci_idat)));
  assign and_987_nl = (~((rem_12cyc_3_2[0]) & (rem_12cyc_1_0==2'b11))) & and_tmp_179;
  assign or_735_nl = (~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2[1]);
  assign mux_tmp_271 = MUX_s_1_2_2(and_987_nl, and_tmp_179, or_735_nl);
  assign and_dcpl_568 = and_dcpl_292 & (COMP_LOOP_acc_tmp[1]);
  assign and_dcpl_569 = and_dcpl_568 & and_dcpl_291;
  assign and_dcpl_570 = (rem_12cyc_st_2_3_2==2'b10);
  assign and_dcpl_571 = and_dcpl_570 & (~ (rem_12cyc_st_2_1_0[1]));
  assign or_tmp_733 = (rem_12cyc_1_0!=2'b00) | (rem_12cyc_3_2!=2'b10) | not_tmp_54;
  assign or_748_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b00) | (COMP_LOOP_acc_tmp!=2'b10);
  assign nor_435_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_733));
  assign mux_272_nl = MUX_s_1_2_2(nor_435_nl, or_tmp_733, or_748_cse);
  assign and_dcpl_573 = mux_272_nl & and_dcpl_298 & and_dcpl_571;
  assign and_dcpl_574 = (rem_12cyc_st_3_3_2==2'b10);
  assign and_dcpl_575 = and_dcpl_574 & (~ (rem_12cyc_st_3_1_0[1]));
  assign or_753_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b10) | (~
      COMP_LOOP_asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_180 = or_753_cse & or_tmp_733;
  assign nor_434_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_180));
  assign mux_273_nl = MUX_s_1_2_2(nor_434_nl, and_tmp_180, or_748_cse);
  assign and_dcpl_577 = mux_273_nl & and_dcpl_304 & and_dcpl_575;
  assign and_dcpl_578 = (rem_12cyc_st_4_3_2==2'b10);
  assign and_dcpl_579 = and_dcpl_578 & (~ (rem_12cyc_st_4_1_0[1]));
  assign or_757_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b10) | (~
      COMP_LOOP_asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_182 = or_753_cse & or_757_cse & or_tmp_733;
  assign nor_433_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_182));
  assign mux_274_nl = MUX_s_1_2_2(nor_433_nl, and_tmp_182, or_748_cse);
  assign and_dcpl_581 = mux_274_nl & and_dcpl_310 & and_dcpl_579;
  assign and_dcpl_582 = (rem_12cyc_st_5_3_2==2'b10);
  assign and_dcpl_583 = and_dcpl_582 & (~ (rem_12cyc_st_5_1_0[1]));
  assign or_762_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b10) | (~
      COMP_LOOP_asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_185 = or_753_cse & or_757_cse & or_762_cse & or_tmp_733;
  assign nor_432_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_185));
  assign mux_275_nl = MUX_s_1_2_2(nor_432_nl, and_tmp_185, or_748_cse);
  assign and_dcpl_585 = mux_275_nl & and_dcpl_316 & and_dcpl_583;
  assign or_768_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b10) | (~
      COMP_LOOP_asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_189 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & or_tmp_733;
  assign nor_431_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_189));
  assign mux_276_nl = MUX_s_1_2_2(nor_431_nl, and_tmp_189, or_748_cse);
  assign and_dcpl_589 = mux_276_nl & and_dcpl_112 & and_dcpl_126 & (~ (rem_12cyc_st_6_1_0[1]));
  assign or_775_cse = (rem_12cyc_st_6_1_0!=2'b00) | (rem_12cyc_st_6_3_2!=2'b10);
  assign nor_429_nl = ~(and_dcpl_111 | (~ or_tmp_733));
  assign mux_277_nl = MUX_s_1_2_2(nor_429_nl, or_tmp_733, or_775_cse);
  assign and_tmp_193 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & mux_277_nl;
  assign nor_430_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_193));
  assign mux_278_nl = MUX_s_1_2_2(nor_430_nl, and_tmp_193, or_748_cse);
  assign and_dcpl_593 = mux_278_nl & and_dcpl_85 & and_dcpl_99 & (~ (rem_12cyc_st_7_1_0[0]));
  assign or_784_cse = (rem_12cyc_st_7_1_0!=2'b00) | (rem_12cyc_st_7_3_2!=2'b10);
  assign nor_426_nl = ~(and_dcpl_84 | (~ or_tmp_733));
  assign mux_tmp_279 = MUX_s_1_2_2(nor_426_nl, or_tmp_733, or_784_cse);
  assign nor_427_nl = ~(and_dcpl_111 | (~ mux_tmp_279));
  assign mux_280_nl = MUX_s_1_2_2(nor_427_nl, mux_tmp_279, or_775_cse);
  assign and_tmp_197 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & mux_280_nl;
  assign nor_428_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_197));
  assign mux_281_nl = MUX_s_1_2_2(nor_428_nl, and_tmp_197, or_748_cse);
  assign and_dcpl_597 = mux_281_nl & and_dcpl_58 & and_dcpl_72 & (~ (rem_12cyc_st_8_1_0[0]));
  assign or_795_cse = (rem_12cyc_st_8_1_0!=2'b00) | (rem_12cyc_st_8_3_2!=2'b10);
  assign nor_422_nl = ~(and_dcpl_57 | (~ or_tmp_733));
  assign mux_tmp_282 = MUX_s_1_2_2(nor_422_nl, or_tmp_733, or_795_cse);
  assign nor_423_nl = ~(and_dcpl_84 | (~ mux_tmp_282));
  assign mux_tmp_283 = MUX_s_1_2_2(nor_423_nl, mux_tmp_282, or_784_cse);
  assign nor_424_nl = ~(and_dcpl_111 | (~ mux_tmp_283));
  assign mux_284_nl = MUX_s_1_2_2(nor_424_nl, mux_tmp_283, or_775_cse);
  assign and_tmp_201 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & mux_284_nl;
  assign nor_425_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_201));
  assign mux_285_nl = MUX_s_1_2_2(nor_425_nl, and_tmp_201, or_748_cse);
  assign and_dcpl_601 = mux_285_nl & and_dcpl_31 & and_dcpl_45 & (~ (rem_12cyc_st_9_1_0[0]));
  assign nor_417_nl = ~(and_dcpl_30 | (~ or_tmp_733));
  assign or_808_nl = (rem_12cyc_st_9_1_0!=2'b00) | (rem_12cyc_st_9_3_2!=2'b10);
  assign mux_tmp_286 = MUX_s_1_2_2(nor_417_nl, or_tmp_733, or_808_nl);
  assign nor_418_nl = ~(and_dcpl_57 | (~ mux_tmp_286));
  assign mux_tmp_287 = MUX_s_1_2_2(nor_418_nl, mux_tmp_286, or_795_cse);
  assign nor_419_nl = ~(and_dcpl_84 | (~ mux_tmp_287));
  assign mux_tmp_288 = MUX_s_1_2_2(nor_419_nl, mux_tmp_287, or_784_cse);
  assign nor_420_nl = ~(and_dcpl_111 | (~ mux_tmp_288));
  assign mux_289_nl = MUX_s_1_2_2(nor_420_nl, mux_tmp_288, or_775_cse);
  assign and_tmp_205 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & mux_289_nl;
  assign nor_421_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_205));
  assign mux_290_nl = MUX_s_1_2_2(nor_421_nl, and_tmp_205, or_748_cse);
  assign and_dcpl_605 = mux_290_nl & and_dcpl_4 & and_dcpl_18 & (~ (rem_12cyc_st_10_1_0[0]));
  assign or_tmp_808 = (COMP_LOOP_acc_tmp!=2'b10) | (COMP_LOOP_acc_1_tmp[1:0]!=2'b00)
      | (~ ccs_ccore_start_rsci_idat);
  assign nor_408_nl = ~((rem_12cyc_st_10_3_2[1]) | (~ or_tmp_808));
  assign or_823_nl = (~ main_stage_0_11) | (~ COMP_LOOP_asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b00)
      | (rem_12cyc_st_10_3_2[0]);
  assign mux_tmp_291 = MUX_s_1_2_2(nor_408_nl, or_tmp_808, or_823_nl);
  assign nor_409_nl = ~((rem_12cyc_st_6_3_2[1]) | (~ mux_tmp_291));
  assign or_822_nl = (~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b00)
      | (rem_12cyc_st_6_3_2[0]);
  assign mux_tmp_292 = MUX_s_1_2_2(nor_409_nl, mux_tmp_291, or_822_nl);
  assign nor_410_nl = ~((rem_12cyc_st_5_3_2[1]) | (~ mux_tmp_292));
  assign or_821_nl = (~ main_stage_0_6) | (~ COMP_LOOP_asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b00)
      | (rem_12cyc_st_5_3_2[0]);
  assign mux_tmp_293 = MUX_s_1_2_2(nor_410_nl, mux_tmp_292, or_821_nl);
  assign nor_411_nl = ~((rem_12cyc_st_4_3_2[1]) | (~ mux_tmp_293));
  assign or_820_nl = (~ main_stage_0_5) | (~ COMP_LOOP_asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b00)
      | (rem_12cyc_st_4_3_2[0]);
  assign mux_tmp_294 = MUX_s_1_2_2(nor_411_nl, mux_tmp_293, or_820_nl);
  assign nor_412_nl = ~((rem_12cyc_st_3_3_2[1]) | (~ mux_tmp_294));
  assign or_819_nl = (~ main_stage_0_4) | (~ COMP_LOOP_asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b00)
      | (rem_12cyc_st_3_3_2[0]);
  assign mux_tmp_295 = MUX_s_1_2_2(nor_412_nl, mux_tmp_294, or_819_nl);
  assign nor_413_nl = ~((rem_12cyc_st_2_3_2[1]) | (~ mux_tmp_295));
  assign or_818_nl = (~ main_stage_0_3) | (~ COMP_LOOP_asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b00)
      | (rem_12cyc_st_2_3_2[0]);
  assign mux_tmp_296 = MUX_s_1_2_2(nor_413_nl, mux_tmp_295, or_818_nl);
  assign nor_414_nl = ~((rem_12cyc_st_9_3_2[1]) | (~ mux_tmp_296));
  assign or_817_nl = (~ main_stage_0_10) | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b00)
      | (rem_12cyc_st_9_3_2[0]);
  assign mux_tmp_297 = MUX_s_1_2_2(nor_414_nl, mux_tmp_296, or_817_nl);
  assign nor_415_nl = ~((rem_12cyc_st_8_3_2[1]) | (~ mux_tmp_297));
  assign or_816_nl = (~ main_stage_0_9) | (~ COMP_LOOP_asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b00)
      | (rem_12cyc_st_8_3_2[0]);
  assign mux_tmp_298 = MUX_s_1_2_2(nor_415_nl, mux_tmp_297, or_816_nl);
  assign nor_416_nl = ~((rem_12cyc_st_7_3_2[1]) | (~ mux_tmp_298));
  assign or_815_nl = (~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b00)
      | (rem_12cyc_st_7_3_2[0]);
  assign mux_299_nl = MUX_s_1_2_2(nor_416_nl, mux_tmp_298, or_815_nl);
  assign and_tmp_206 = ((~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b10)
      | (rem_12cyc_1_0!=2'b00)) & mux_299_nl;
  assign and_dcpl_610 = and_dcpl_568 & and_dcpl_355;
  assign or_tmp_820 = (rem_12cyc_1_0!=2'b01) | (rem_12cyc_3_2!=2'b10) | not_tmp_54;
  assign or_837_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b01) | (COMP_LOOP_acc_tmp!=2'b10);
  assign nor_407_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_820));
  assign mux_300_nl = MUX_s_1_2_2(nor_407_nl, or_tmp_820, or_837_cse);
  assign and_dcpl_612 = mux_300_nl & and_dcpl_358 & and_dcpl_571;
  assign nand_84_cse = ~((rem_12cyc_st_2_3_2[1]) & COMP_LOOP_asn_itm_2 & main_stage_0_3
      & (rem_12cyc_st_2_1_0[0]));
  assign or_842_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2[0]);
  assign and_986_nl = nand_84_cse & or_tmp_820;
  assign mux_tmp_301 = MUX_s_1_2_2(and_986_nl, or_tmp_820, or_842_cse);
  assign nor_406_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_301));
  assign mux_302_nl = MUX_s_1_2_2(nor_406_nl, mux_tmp_301, or_837_cse);
  assign and_dcpl_614 = mux_302_nl & and_dcpl_362 & and_dcpl_575;
  assign or_847_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b10);
  assign and_984_nl = nand_274_cse & or_tmp_820;
  assign mux_tmp_303 = MUX_s_1_2_2(and_984_nl, or_tmp_820, or_847_cse);
  assign and_985_nl = nand_84_cse & mux_tmp_303;
  assign mux_tmp_304 = MUX_s_1_2_2(and_985_nl, mux_tmp_303, or_842_cse);
  assign nor_405_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_304));
  assign mux_305_nl = MUX_s_1_2_2(nor_405_nl, mux_tmp_304, or_837_cse);
  assign and_dcpl_616 = mux_305_nl & and_dcpl_366 & and_dcpl_579;
  assign nand_79_cse = ~((rem_12cyc_st_4_3_2[1]) & COMP_LOOP_asn_itm_4 & main_stage_0_5
      & (rem_12cyc_st_4_1_0[0]));
  assign or_854_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2[0]);
  assign and_981_nl = nand_79_cse & or_tmp_820;
  assign mux_tmp_306 = MUX_s_1_2_2(and_981_nl, or_tmp_820, or_854_cse);
  assign and_982_nl = nand_274_cse & mux_tmp_306;
  assign mux_tmp_307 = MUX_s_1_2_2(and_982_nl, mux_tmp_306, or_847_cse);
  assign and_983_nl = nand_84_cse & mux_tmp_307;
  assign mux_tmp_308 = MUX_s_1_2_2(and_983_nl, mux_tmp_307, or_842_cse);
  assign nor_404_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_308));
  assign mux_309_nl = MUX_s_1_2_2(nor_404_nl, mux_tmp_308, or_837_cse);
  assign and_dcpl_618 = mux_309_nl & and_dcpl_370 & and_dcpl_583;
  assign or_863_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b10);
  assign and_977_nl = nand_267_cse & or_tmp_820;
  assign mux_tmp_310 = MUX_s_1_2_2(and_977_nl, or_tmp_820, or_863_cse);
  assign and_978_nl = nand_79_cse & mux_tmp_310;
  assign mux_tmp_311 = MUX_s_1_2_2(and_978_nl, mux_tmp_310, or_854_cse);
  assign and_979_nl = nand_274_cse & mux_tmp_311;
  assign mux_tmp_312 = MUX_s_1_2_2(and_979_nl, mux_tmp_311, or_847_cse);
  assign and_980_nl = nand_84_cse & mux_tmp_312;
  assign mux_tmp_313 = MUX_s_1_2_2(and_980_nl, mux_tmp_312, or_842_cse);
  assign nor_403_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_313));
  assign mux_314_nl = MUX_s_1_2_2(nor_403_nl, mux_tmp_313, or_837_cse);
  assign and_dcpl_622 = mux_314_nl & and_dcpl_112 & and_dcpl_129 & (~ (rem_12cyc_st_6_1_0[1]));
  assign or_874_cse = (rem_12cyc_st_6_1_0!=2'b01) | (rem_12cyc_st_6_3_2!=2'b10);
  assign nor_401_nl = ~(and_dcpl_111 | (~ or_tmp_820));
  assign mux_tmp_315 = MUX_s_1_2_2(nor_401_nl, or_tmp_820, or_874_cse);
  assign and_973_nl = nand_267_cse & mux_tmp_315;
  assign mux_tmp_316 = MUX_s_1_2_2(and_973_nl, mux_tmp_315, or_863_cse);
  assign and_974_nl = nand_79_cse & mux_tmp_316;
  assign mux_tmp_317 = MUX_s_1_2_2(and_974_nl, mux_tmp_316, or_854_cse);
  assign and_975_nl = nand_274_cse & mux_tmp_317;
  assign mux_tmp_318 = MUX_s_1_2_2(and_975_nl, mux_tmp_317, or_847_cse);
  assign and_976_nl = nand_84_cse & mux_tmp_318;
  assign mux_tmp_319 = MUX_s_1_2_2(and_976_nl, mux_tmp_318, or_842_cse);
  assign nor_402_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_319));
  assign mux_320_nl = MUX_s_1_2_2(nor_402_nl, mux_tmp_319, or_837_cse);
  assign and_dcpl_625 = mux_320_nl & and_dcpl_85 & and_dcpl_99 & (rem_12cyc_st_7_1_0[0]);
  assign or_887_cse = (rem_12cyc_st_7_1_0!=2'b01) | (rem_12cyc_st_7_3_2!=2'b10);
  assign nor_398_nl = ~(and_dcpl_84 | (~ or_tmp_820));
  assign mux_tmp_321 = MUX_s_1_2_2(nor_398_nl, or_tmp_820, or_887_cse);
  assign nor_399_nl = ~(and_dcpl_111 | (~ mux_tmp_321));
  assign mux_tmp_322 = MUX_s_1_2_2(nor_399_nl, mux_tmp_321, or_874_cse);
  assign and_969_nl = nand_267_cse & mux_tmp_322;
  assign mux_tmp_323 = MUX_s_1_2_2(and_969_nl, mux_tmp_322, or_863_cse);
  assign and_970_nl = nand_79_cse & mux_tmp_323;
  assign mux_tmp_324 = MUX_s_1_2_2(and_970_nl, mux_tmp_323, or_854_cse);
  assign and_971_nl = nand_274_cse & mux_tmp_324;
  assign mux_tmp_325 = MUX_s_1_2_2(and_971_nl, mux_tmp_324, or_847_cse);
  assign and_972_nl = nand_84_cse & mux_tmp_325;
  assign mux_tmp_326 = MUX_s_1_2_2(and_972_nl, mux_tmp_325, or_842_cse);
  assign nor_400_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_326));
  assign mux_327_nl = MUX_s_1_2_2(nor_400_nl, mux_tmp_326, or_837_cse);
  assign and_dcpl_628 = mux_327_nl & and_dcpl_58 & and_dcpl_72 & (rem_12cyc_st_8_1_0[0]);
  assign or_902_cse = (rem_12cyc_st_8_1_0!=2'b01) | (rem_12cyc_st_8_3_2!=2'b10);
  assign nor_394_nl = ~(and_dcpl_57 | (~ or_tmp_820));
  assign mux_tmp_328 = MUX_s_1_2_2(nor_394_nl, or_tmp_820, or_902_cse);
  assign nor_395_nl = ~(and_dcpl_84 | (~ mux_tmp_328));
  assign mux_tmp_329 = MUX_s_1_2_2(nor_395_nl, mux_tmp_328, or_887_cse);
  assign nor_396_nl = ~(and_dcpl_111 | (~ mux_tmp_329));
  assign mux_tmp_330 = MUX_s_1_2_2(nor_396_nl, mux_tmp_329, or_874_cse);
  assign and_965_nl = nand_267_cse & mux_tmp_330;
  assign mux_tmp_331 = MUX_s_1_2_2(and_965_nl, mux_tmp_330, or_863_cse);
  assign and_966_nl = nand_79_cse & mux_tmp_331;
  assign mux_tmp_332 = MUX_s_1_2_2(and_966_nl, mux_tmp_331, or_854_cse);
  assign and_967_nl = nand_274_cse & mux_tmp_332;
  assign mux_tmp_333 = MUX_s_1_2_2(and_967_nl, mux_tmp_332, or_847_cse);
  assign and_968_nl = nand_84_cse & mux_tmp_333;
  assign mux_tmp_334 = MUX_s_1_2_2(and_968_nl, mux_tmp_333, or_842_cse);
  assign nor_397_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_334));
  assign mux_335_nl = MUX_s_1_2_2(nor_397_nl, mux_tmp_334, or_837_cse);
  assign and_dcpl_631 = mux_335_nl & and_dcpl_31 & and_dcpl_45 & (rem_12cyc_st_9_1_0[0]);
  assign nor_389_nl = ~(and_dcpl_30 | (~ or_tmp_820));
  assign or_919_nl = (rem_12cyc_st_9_1_0!=2'b01) | (rem_12cyc_st_9_3_2!=2'b10);
  assign mux_tmp_336 = MUX_s_1_2_2(nor_389_nl, or_tmp_820, or_919_nl);
  assign nor_390_nl = ~(and_dcpl_57 | (~ mux_tmp_336));
  assign mux_tmp_337 = MUX_s_1_2_2(nor_390_nl, mux_tmp_336, or_902_cse);
  assign nor_391_nl = ~(and_dcpl_84 | (~ mux_tmp_337));
  assign mux_tmp_338 = MUX_s_1_2_2(nor_391_nl, mux_tmp_337, or_887_cse);
  assign nor_392_nl = ~(and_dcpl_111 | (~ mux_tmp_338));
  assign mux_tmp_339 = MUX_s_1_2_2(nor_392_nl, mux_tmp_338, or_874_cse);
  assign and_961_nl = nand_267_cse & mux_tmp_339;
  assign mux_tmp_340 = MUX_s_1_2_2(and_961_nl, mux_tmp_339, or_863_cse);
  assign and_962_nl = nand_79_cse & mux_tmp_340;
  assign mux_tmp_341 = MUX_s_1_2_2(and_962_nl, mux_tmp_340, or_854_cse);
  assign and_963_nl = nand_274_cse & mux_tmp_341;
  assign mux_tmp_342 = MUX_s_1_2_2(and_963_nl, mux_tmp_341, or_847_cse);
  assign and_964_nl = nand_84_cse & mux_tmp_342;
  assign mux_tmp_343 = MUX_s_1_2_2(and_964_nl, mux_tmp_342, or_842_cse);
  assign nor_393_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_343));
  assign mux_344_nl = MUX_s_1_2_2(nor_393_nl, mux_tmp_343, or_837_cse);
  assign and_dcpl_634 = mux_344_nl & and_dcpl_4 & and_dcpl_18 & (rem_12cyc_st_10_1_0[0]);
  assign or_tmp_921 = (COMP_LOOP_acc_tmp!=2'b10) | (COMP_LOOP_acc_1_tmp[1]) | nand_250_cse;
  assign nor_379_nl = ~((rem_12cyc_st_10_3_2[1]) | (~ or_tmp_921));
  assign or_938_nl = (~ main_stage_0_11) | (~ COMP_LOOP_asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b01)
      | (rem_12cyc_st_10_3_2[0]);
  assign mux_tmp_345 = MUX_s_1_2_2(nor_379_nl, or_tmp_921, or_938_nl);
  assign nor_380_nl = ~((rem_12cyc_st_6_3_2[1]) | (~ mux_tmp_345));
  assign or_937_nl = (~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b01)
      | (rem_12cyc_st_6_3_2[0]);
  assign mux_tmp_346 = MUX_s_1_2_2(nor_380_nl, mux_tmp_345, or_937_nl);
  assign nor_381_nl = ~((rem_12cyc_st_5_3_2[1]) | (~ mux_tmp_346));
  assign or_936_nl = (~ main_stage_0_6) | (~ COMP_LOOP_asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b01)
      | (rem_12cyc_st_5_3_2[0]);
  assign mux_tmp_347 = MUX_s_1_2_2(nor_381_nl, mux_tmp_346, or_936_nl);
  assign nor_382_nl = ~((rem_12cyc_st_4_3_2[1]) | (~ mux_tmp_347));
  assign or_935_nl = (~ main_stage_0_5) | (~ COMP_LOOP_asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b01)
      | (rem_12cyc_st_4_3_2[0]);
  assign mux_tmp_348 = MUX_s_1_2_2(nor_382_nl, mux_tmp_347, or_935_nl);
  assign nor_383_nl = ~((rem_12cyc_st_3_3_2[1]) | (~ mux_tmp_348));
  assign or_934_nl = (~ main_stage_0_4) | (~ COMP_LOOP_asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b01)
      | (rem_12cyc_st_3_3_2[0]);
  assign mux_tmp_349 = MUX_s_1_2_2(nor_383_nl, mux_tmp_348, or_934_nl);
  assign nor_384_nl = ~((rem_12cyc_st_2_3_2[1]) | (~ mux_tmp_349));
  assign or_933_nl = (~ main_stage_0_3) | (~ COMP_LOOP_asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b01)
      | (rem_12cyc_st_2_3_2[0]);
  assign mux_tmp_350 = MUX_s_1_2_2(nor_384_nl, mux_tmp_349, or_933_nl);
  assign nor_385_nl = ~((rem_12cyc_st_9_3_2[1]) | (~ mux_tmp_350));
  assign or_932_nl = (~ main_stage_0_10) | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b01)
      | (rem_12cyc_st_9_3_2[0]);
  assign mux_tmp_351 = MUX_s_1_2_2(nor_385_nl, mux_tmp_350, or_932_nl);
  assign nor_386_nl = ~((rem_12cyc_st_8_3_2[1]) | (~ mux_tmp_351));
  assign or_931_nl = (~ main_stage_0_9) | (~ COMP_LOOP_asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b01)
      | (rem_12cyc_st_8_3_2[0]);
  assign mux_tmp_352 = MUX_s_1_2_2(nor_386_nl, mux_tmp_351, or_931_nl);
  assign nor_387_nl = ~((rem_12cyc_st_7_3_2[1]) | (~ mux_tmp_352));
  assign or_930_nl = (~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b01)
      | (rem_12cyc_st_7_3_2[0]);
  assign mux_tmp_353 = MUX_s_1_2_2(nor_387_nl, mux_tmp_352, or_930_nl);
  assign nor_388_nl = ~((rem_12cyc_1_0[0]) | (~ mux_tmp_353));
  assign or_929_nl = (~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b10)
      | (rem_12cyc_1_0[1]);
  assign mux_tmp_354 = MUX_s_1_2_2(nor_388_nl, mux_tmp_353, or_929_nl);
  assign and_dcpl_638 = and_dcpl_568 & and_dcpl_393;
  assign and_dcpl_639 = and_dcpl_570 & (rem_12cyc_st_2_1_0[1]);
  assign or_tmp_934 = (rem_12cyc_1_0!=2'b10) | (rem_12cyc_3_2!=2'b10) | not_tmp_54;
  assign or_952_cse = (COMP_LOOP_acc_1_tmp[1:0]!=2'b10) | (COMP_LOOP_acc_tmp!=2'b10);
  assign nor_378_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_934));
  assign mux_355_nl = MUX_s_1_2_2(nor_378_nl, or_tmp_934, or_952_cse);
  assign and_dcpl_641 = mux_355_nl & and_dcpl_298 & and_dcpl_639;
  assign and_dcpl_642 = and_dcpl_574 & (rem_12cyc_st_3_1_0[1]);
  assign or_957_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b10) |
      (~ COMP_LOOP_asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_207 = or_957_cse & or_tmp_934;
  assign nor_377_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_207));
  assign mux_356_nl = MUX_s_1_2_2(nor_377_nl, and_tmp_207, or_952_cse);
  assign and_dcpl_644 = mux_356_nl & and_dcpl_304 & and_dcpl_642;
  assign and_dcpl_645 = and_dcpl_578 & (rem_12cyc_st_4_1_0[1]);
  assign or_961_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b10) |
      (~ COMP_LOOP_asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_209 = or_957_cse & or_961_cse & or_tmp_934;
  assign nor_376_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_209));
  assign mux_357_nl = MUX_s_1_2_2(nor_376_nl, and_tmp_209, or_952_cse);
  assign and_dcpl_647 = mux_357_nl & and_dcpl_310 & and_dcpl_645;
  assign and_dcpl_648 = and_dcpl_582 & (rem_12cyc_st_5_1_0[1]);
  assign or_966_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b10) |
      (~ COMP_LOOP_asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_212 = or_957_cse & or_961_cse & or_966_cse & or_tmp_934;
  assign nor_375_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_212));
  assign mux_358_nl = MUX_s_1_2_2(nor_375_nl, and_tmp_212, or_952_cse);
  assign and_dcpl_650 = mux_358_nl & and_dcpl_316 & and_dcpl_648;
  assign or_972_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b10) |
      (~ COMP_LOOP_asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_216 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & or_tmp_934;
  assign nor_374_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_216));
  assign mux_359_nl = MUX_s_1_2_2(nor_374_nl, and_tmp_216, or_952_cse);
  assign and_dcpl_653 = mux_359_nl & and_dcpl_112 & and_dcpl_126 & (rem_12cyc_st_6_1_0[1]);
  assign or_979_cse = (rem_12cyc_st_6_1_0!=2'b10) | (rem_12cyc_st_6_3_2!=2'b10);
  assign nor_372_nl = ~(and_dcpl_111 | (~ or_tmp_934));
  assign mux_360_nl = MUX_s_1_2_2(nor_372_nl, or_tmp_934, or_979_cse);
  assign and_tmp_220 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & mux_360_nl;
  assign nor_373_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_220));
  assign mux_361_nl = MUX_s_1_2_2(nor_373_nl, and_tmp_220, or_952_cse);
  assign and_dcpl_657 = mux_361_nl & and_dcpl_85 & and_dcpl_104 & (~ (rem_12cyc_st_7_1_0[0]));
  assign or_988_cse = (rem_12cyc_st_7_1_0!=2'b10) | (rem_12cyc_st_7_3_2!=2'b10);
  assign nor_369_nl = ~(and_dcpl_84 | (~ or_tmp_934));
  assign mux_tmp_362 = MUX_s_1_2_2(nor_369_nl, or_tmp_934, or_988_cse);
  assign nor_370_nl = ~(and_dcpl_111 | (~ mux_tmp_362));
  assign mux_363_nl = MUX_s_1_2_2(nor_370_nl, mux_tmp_362, or_979_cse);
  assign and_tmp_224 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & mux_363_nl;
  assign nor_371_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_224));
  assign mux_364_nl = MUX_s_1_2_2(nor_371_nl, and_tmp_224, or_952_cse);
  assign and_dcpl_661 = mux_364_nl & and_dcpl_58 & and_dcpl_77 & (~ (rem_12cyc_st_8_1_0[0]));
  assign or_999_cse = (rem_12cyc_st_8_1_0!=2'b10) | (rem_12cyc_st_8_3_2!=2'b10);
  assign nor_365_nl = ~(and_dcpl_57 | (~ or_tmp_934));
  assign mux_tmp_365 = MUX_s_1_2_2(nor_365_nl, or_tmp_934, or_999_cse);
  assign nor_366_nl = ~(and_dcpl_84 | (~ mux_tmp_365));
  assign mux_tmp_366 = MUX_s_1_2_2(nor_366_nl, mux_tmp_365, or_988_cse);
  assign nor_367_nl = ~(and_dcpl_111 | (~ mux_tmp_366));
  assign mux_367_nl = MUX_s_1_2_2(nor_367_nl, mux_tmp_366, or_979_cse);
  assign and_tmp_228 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & mux_367_nl;
  assign nor_368_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_228));
  assign mux_368_nl = MUX_s_1_2_2(nor_368_nl, and_tmp_228, or_952_cse);
  assign and_dcpl_665 = mux_368_nl & and_dcpl_31 & and_dcpl_50 & (~ (rem_12cyc_st_9_1_0[0]));
  assign nor_360_nl = ~(and_dcpl_30 | (~ or_tmp_934));
  assign or_1012_nl = (rem_12cyc_st_9_1_0!=2'b10) | (rem_12cyc_st_9_3_2!=2'b10);
  assign mux_tmp_369 = MUX_s_1_2_2(nor_360_nl, or_tmp_934, or_1012_nl);
  assign nor_361_nl = ~(and_dcpl_57 | (~ mux_tmp_369));
  assign mux_tmp_370 = MUX_s_1_2_2(nor_361_nl, mux_tmp_369, or_999_cse);
  assign nor_362_nl = ~(and_dcpl_84 | (~ mux_tmp_370));
  assign mux_tmp_371 = MUX_s_1_2_2(nor_362_nl, mux_tmp_370, or_988_cse);
  assign nor_363_nl = ~(and_dcpl_111 | (~ mux_tmp_371));
  assign mux_372_nl = MUX_s_1_2_2(nor_363_nl, mux_tmp_371, or_979_cse);
  assign and_tmp_232 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & mux_372_nl;
  assign nor_364_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_232));
  assign mux_373_nl = MUX_s_1_2_2(nor_364_nl, and_tmp_232, or_952_cse);
  assign and_dcpl_669 = mux_373_nl & and_dcpl_4 & and_dcpl_23 & (~ (rem_12cyc_st_10_1_0[0]));
  assign or_tmp_1009 = (COMP_LOOP_acc_tmp!=2'b10) | (COMP_LOOP_acc_1_tmp[1:0]!=2'b10)
      | (~ ccs_ccore_start_rsci_idat);
  assign nor_351_nl = ~((rem_12cyc_st_10_3_2[1]) | (~ or_tmp_1009));
  assign or_1027_nl = (~ main_stage_0_11) | (~ COMP_LOOP_asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b10)
      | (rem_12cyc_st_10_3_2[0]);
  assign mux_tmp_374 = MUX_s_1_2_2(nor_351_nl, or_tmp_1009, or_1027_nl);
  assign nor_352_nl = ~((rem_12cyc_st_6_3_2[1]) | (~ mux_tmp_374));
  assign or_1026_nl = (~ main_stage_0_7) | (~ COMP_LOOP_asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b10)
      | (rem_12cyc_st_6_3_2[0]);
  assign mux_tmp_375 = MUX_s_1_2_2(nor_352_nl, mux_tmp_374, or_1026_nl);
  assign nor_353_nl = ~((rem_12cyc_st_5_3_2[1]) | (~ mux_tmp_375));
  assign or_1025_nl = (~ main_stage_0_6) | (~ COMP_LOOP_asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b10)
      | (rem_12cyc_st_5_3_2[0]);
  assign mux_tmp_376 = MUX_s_1_2_2(nor_353_nl, mux_tmp_375, or_1025_nl);
  assign nor_354_nl = ~((rem_12cyc_st_4_3_2[1]) | (~ mux_tmp_376));
  assign or_1024_nl = (~ main_stage_0_5) | (~ COMP_LOOP_asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b10)
      | (rem_12cyc_st_4_3_2[0]);
  assign mux_tmp_377 = MUX_s_1_2_2(nor_354_nl, mux_tmp_376, or_1024_nl);
  assign nor_355_nl = ~((rem_12cyc_st_3_3_2[1]) | (~ mux_tmp_377));
  assign or_1023_nl = (~ main_stage_0_4) | (~ COMP_LOOP_asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b10)
      | (rem_12cyc_st_3_3_2[0]);
  assign mux_tmp_378 = MUX_s_1_2_2(nor_355_nl, mux_tmp_377, or_1023_nl);
  assign nor_356_nl = ~((rem_12cyc_st_2_3_2[1]) | (~ mux_tmp_378));
  assign or_1022_nl = (~ main_stage_0_3) | (~ COMP_LOOP_asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b10)
      | (rem_12cyc_st_2_3_2[0]);
  assign mux_tmp_379 = MUX_s_1_2_2(nor_356_nl, mux_tmp_378, or_1022_nl);
  assign nor_357_nl = ~((rem_12cyc_st_9_3_2[1]) | (~ mux_tmp_379));
  assign or_1021_nl = (~ main_stage_0_10) | (~ COMP_LOOP_asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b10)
      | (rem_12cyc_st_9_3_2[0]);
  assign mux_tmp_380 = MUX_s_1_2_2(nor_357_nl, mux_tmp_379, or_1021_nl);
  assign nor_358_nl = ~((rem_12cyc_st_8_3_2[1]) | (~ mux_tmp_380));
  assign or_1020_nl = (~ main_stage_0_9) | (~ COMP_LOOP_asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b10)
      | (rem_12cyc_st_8_3_2[0]);
  assign mux_tmp_381 = MUX_s_1_2_2(nor_358_nl, mux_tmp_380, or_1020_nl);
  assign nor_359_nl = ~((rem_12cyc_st_7_3_2[1]) | (~ mux_tmp_381));
  assign or_1019_nl = (~ main_stage_0_8) | (~ COMP_LOOP_asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b10)
      | (rem_12cyc_st_7_3_2[0]);
  assign mux_382_nl = MUX_s_1_2_2(nor_359_nl, mux_tmp_381, or_1019_nl);
  assign and_tmp_233 = ((~ main_stage_0_2) | (~ COMP_LOOP_asn_itm_1) | (rem_12cyc_3_2!=2'b10)
      | (rem_12cyc_1_0!=2'b10)) & mux_382_nl;
  assign and_dcpl_673 = and_dcpl_568 & and_dcpl_430;
  assign or_tmp_1021 = (~((rem_12cyc_1_0==2'b11) & (rem_12cyc_3_2==2'b10))) | not_tmp_54;
  assign nand_57_cse = ~((COMP_LOOP_acc_1_tmp[1:0]==2'b11) & (COMP_LOOP_acc_tmp==2'b10));
  assign nor_350_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_1021));
  assign mux_383_nl = MUX_s_1_2_2(nor_350_nl, or_tmp_1021, nand_57_cse);
  assign and_dcpl_675 = mux_383_nl & and_dcpl_358 & and_dcpl_639;
  assign or_1045_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2[0]);
  assign and_960_nl = nand_84_cse & or_tmp_1021;
  assign mux_tmp_384 = MUX_s_1_2_2(and_960_nl, or_tmp_1021, or_1045_cse);
  assign nor_349_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_384));
  assign mux_385_nl = MUX_s_1_2_2(nor_349_nl, mux_tmp_384, nand_57_cse);
  assign and_dcpl_677 = mux_385_nl & and_dcpl_362 & and_dcpl_642;
  assign or_1050_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b10);
  assign and_958_nl = nand_274_cse & or_tmp_1021;
  assign mux_tmp_386 = MUX_s_1_2_2(and_958_nl, or_tmp_1021, or_1050_cse);
  assign and_959_nl = nand_84_cse & mux_tmp_386;
  assign mux_tmp_387 = MUX_s_1_2_2(and_959_nl, mux_tmp_386, or_1045_cse);
  assign nor_348_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_387));
  assign mux_388_nl = MUX_s_1_2_2(nor_348_nl, mux_tmp_387, nand_57_cse);
  assign and_dcpl_679 = mux_388_nl & and_dcpl_366 & and_dcpl_645;
  assign or_1057_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2[0]);
  assign and_955_nl = nand_79_cse & or_tmp_1021;
  assign mux_tmp_389 = MUX_s_1_2_2(and_955_nl, or_tmp_1021, or_1057_cse);
  assign and_956_nl = nand_274_cse & mux_tmp_389;
  assign mux_tmp_390 = MUX_s_1_2_2(and_956_nl, mux_tmp_389, or_1050_cse);
  assign and_957_nl = nand_84_cse & mux_tmp_390;
  assign mux_tmp_391 = MUX_s_1_2_2(and_957_nl, mux_tmp_390, or_1045_cse);
  assign nor_347_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_391));
  assign mux_392_nl = MUX_s_1_2_2(nor_347_nl, mux_tmp_391, nand_57_cse);
  assign and_dcpl_681 = mux_392_nl & and_dcpl_370 & and_dcpl_648;
  assign or_1066_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b10);
  assign and_951_nl = nand_267_cse & or_tmp_1021;
  assign mux_tmp_393 = MUX_s_1_2_2(and_951_nl, or_tmp_1021, or_1066_cse);
  assign and_952_nl = nand_79_cse & mux_tmp_393;
  assign mux_tmp_394 = MUX_s_1_2_2(and_952_nl, mux_tmp_393, or_1057_cse);
  assign and_953_nl = nand_274_cse & mux_tmp_394;
  assign mux_tmp_395 = MUX_s_1_2_2(and_953_nl, mux_tmp_394, or_1050_cse);
  assign and_954_nl = nand_84_cse & mux_tmp_395;
  assign mux_tmp_396 = MUX_s_1_2_2(and_954_nl, mux_tmp_395, or_1045_cse);
  assign nor_346_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_396));
  assign mux_397_nl = MUX_s_1_2_2(nor_346_nl, mux_tmp_396, nand_57_cse);
  assign and_dcpl_684 = mux_397_nl & and_dcpl_112 & and_dcpl_129 & (rem_12cyc_st_6_1_0[1]);
  assign nand_36_cse = ~((rem_12cyc_st_6_1_0==2'b11) & (rem_12cyc_st_6_3_2==2'b10));
  assign nor_344_nl = ~(and_dcpl_111 | (~ or_tmp_1021));
  assign mux_tmp_398 = MUX_s_1_2_2(nor_344_nl, or_tmp_1021, nand_36_cse);
  assign and_947_nl = nand_267_cse & mux_tmp_398;
  assign mux_tmp_399 = MUX_s_1_2_2(and_947_nl, mux_tmp_398, or_1066_cse);
  assign and_948_nl = nand_79_cse & mux_tmp_399;
  assign mux_tmp_400 = MUX_s_1_2_2(and_948_nl, mux_tmp_399, or_1057_cse);
  assign and_949_nl = nand_274_cse & mux_tmp_400;
  assign mux_tmp_401 = MUX_s_1_2_2(and_949_nl, mux_tmp_400, or_1050_cse);
  assign and_950_nl = nand_84_cse & mux_tmp_401;
  assign mux_tmp_402 = MUX_s_1_2_2(and_950_nl, mux_tmp_401, or_1045_cse);
  assign nor_345_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_402));
  assign mux_403_nl = MUX_s_1_2_2(nor_345_nl, mux_tmp_402, nand_57_cse);
  assign and_dcpl_687 = mux_403_nl & and_dcpl_85 & and_dcpl_104 & (rem_12cyc_st_7_1_0[0]);
  assign nand_29_cse = ~((rem_12cyc_st_7_1_0==2'b11) & (rem_12cyc_st_7_3_2==2'b10));
  assign nor_341_nl = ~(and_dcpl_84 | (~ or_tmp_1021));
  assign mux_tmp_404 = MUX_s_1_2_2(nor_341_nl, or_tmp_1021, nand_29_cse);
  assign nor_342_nl = ~(and_dcpl_111 | (~ mux_tmp_404));
  assign mux_tmp_405 = MUX_s_1_2_2(nor_342_nl, mux_tmp_404, nand_36_cse);
  assign and_943_nl = nand_267_cse & mux_tmp_405;
  assign mux_tmp_406 = MUX_s_1_2_2(and_943_nl, mux_tmp_405, or_1066_cse);
  assign and_944_nl = nand_79_cse & mux_tmp_406;
  assign mux_tmp_407 = MUX_s_1_2_2(and_944_nl, mux_tmp_406, or_1057_cse);
  assign and_945_nl = nand_274_cse & mux_tmp_407;
  assign mux_tmp_408 = MUX_s_1_2_2(and_945_nl, mux_tmp_407, or_1050_cse);
  assign and_946_nl = nand_84_cse & mux_tmp_408;
  assign mux_tmp_409 = MUX_s_1_2_2(and_946_nl, mux_tmp_408, or_1045_cse);
  assign nor_343_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_409));
  assign mux_410_nl = MUX_s_1_2_2(nor_343_nl, mux_tmp_409, nand_57_cse);
  assign and_dcpl_690 = mux_410_nl & and_dcpl_58 & and_dcpl_77 & (rem_12cyc_st_8_1_0[0]);
  assign nand_21_cse = ~((rem_12cyc_st_8_1_0==2'b11) & (rem_12cyc_st_8_3_2==2'b10));
  assign nor_337_nl = ~(and_dcpl_57 | (~ or_tmp_1021));
  assign mux_tmp_411 = MUX_s_1_2_2(nor_337_nl, or_tmp_1021, nand_21_cse);
  assign nor_338_nl = ~(and_dcpl_84 | (~ mux_tmp_411));
  assign mux_tmp_412 = MUX_s_1_2_2(nor_338_nl, mux_tmp_411, nand_29_cse);
  assign nor_339_nl = ~(and_dcpl_111 | (~ mux_tmp_412));
  assign mux_tmp_413 = MUX_s_1_2_2(nor_339_nl, mux_tmp_412, nand_36_cse);
  assign and_939_nl = nand_267_cse & mux_tmp_413;
  assign mux_tmp_414 = MUX_s_1_2_2(and_939_nl, mux_tmp_413, or_1066_cse);
  assign and_940_nl = nand_79_cse & mux_tmp_414;
  assign mux_tmp_415 = MUX_s_1_2_2(and_940_nl, mux_tmp_414, or_1057_cse);
  assign and_941_nl = nand_274_cse & mux_tmp_415;
  assign mux_tmp_416 = MUX_s_1_2_2(and_941_nl, mux_tmp_415, or_1050_cse);
  assign and_942_nl = nand_84_cse & mux_tmp_416;
  assign mux_tmp_417 = MUX_s_1_2_2(and_942_nl, mux_tmp_416, or_1045_cse);
  assign nor_340_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_417));
  assign mux_418_nl = MUX_s_1_2_2(nor_340_nl, mux_tmp_417, nand_57_cse);
  assign and_dcpl_693 = mux_418_nl & and_dcpl_31 & and_dcpl_50 & (rem_12cyc_st_9_1_0[0]);
  assign nor_332_nl = ~(and_dcpl_30 | (~ or_tmp_1021));
  assign nand_12_nl = ~((rem_12cyc_st_9_1_0==2'b11) & (rem_12cyc_st_9_3_2==2'b10));
  assign mux_tmp_419 = MUX_s_1_2_2(nor_332_nl, or_tmp_1021, nand_12_nl);
  assign nor_333_nl = ~(and_dcpl_57 | (~ mux_tmp_419));
  assign mux_tmp_420 = MUX_s_1_2_2(nor_333_nl, mux_tmp_419, nand_21_cse);
  assign nor_334_nl = ~(and_dcpl_84 | (~ mux_tmp_420));
  assign mux_tmp_421 = MUX_s_1_2_2(nor_334_nl, mux_tmp_420, nand_29_cse);
  assign nor_335_nl = ~(and_dcpl_111 | (~ mux_tmp_421));
  assign mux_tmp_422 = MUX_s_1_2_2(nor_335_nl, mux_tmp_421, nand_36_cse);
  assign and_935_nl = nand_267_cse & mux_tmp_422;
  assign mux_tmp_423 = MUX_s_1_2_2(and_935_nl, mux_tmp_422, or_1066_cse);
  assign and_936_nl = nand_79_cse & mux_tmp_423;
  assign mux_tmp_424 = MUX_s_1_2_2(and_936_nl, mux_tmp_423, or_1057_cse);
  assign and_937_nl = nand_274_cse & mux_tmp_424;
  assign mux_tmp_425 = MUX_s_1_2_2(and_937_nl, mux_tmp_424, or_1050_cse);
  assign and_938_nl = nand_84_cse & mux_tmp_425;
  assign mux_tmp_426 = MUX_s_1_2_2(and_938_nl, mux_tmp_425, or_1045_cse);
  assign nor_336_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_426));
  assign mux_427_nl = MUX_s_1_2_2(nor_336_nl, mux_tmp_426, nand_57_cse);
  assign and_dcpl_696 = mux_427_nl & and_dcpl_4 & and_dcpl_23 & (rem_12cyc_st_10_1_0[0]);
  assign or_tmp_1122 = (COMP_LOOP_acc_tmp!=2'b10) | nand_222_cse;
  assign nor_323_nl = ~((rem_12cyc_st_10_3_2[1]) | (~ or_tmp_1122));
  assign nand_1_nl = ~(main_stage_0_11 & COMP_LOOP_asn_itm_10 & (rem_12cyc_st_10_1_0==2'b11)
      & (~ (rem_12cyc_st_10_3_2[0])));
  assign mux_tmp_428 = MUX_s_1_2_2(nor_323_nl, or_tmp_1122, nand_1_nl);
  assign nor_324_nl = ~((rem_12cyc_st_6_3_2[1]) | (~ mux_tmp_428));
  assign nand_2_nl = ~(main_stage_0_7 & COMP_LOOP_asn_itm_6 & (rem_12cyc_st_6_1_0==2'b11)
      & (~ (rem_12cyc_st_6_3_2[0])));
  assign mux_tmp_429 = MUX_s_1_2_2(nor_324_nl, mux_tmp_428, nand_2_nl);
  assign nor_325_nl = ~((rem_12cyc_st_5_3_2[1]) | (~ mux_tmp_429));
  assign nand_3_nl = ~(main_stage_0_6 & COMP_LOOP_asn_itm_5 & (rem_12cyc_st_5_1_0==2'b11)
      & (~ (rem_12cyc_st_5_3_2[0])));
  assign mux_tmp_430 = MUX_s_1_2_2(nor_325_nl, mux_tmp_429, nand_3_nl);
  assign nor_326_nl = ~((rem_12cyc_st_4_3_2[1]) | (~ mux_tmp_430));
  assign nand_4_nl = ~(main_stage_0_5 & COMP_LOOP_asn_itm_4 & (rem_12cyc_st_4_1_0==2'b11)
      & (~ (rem_12cyc_st_4_3_2[0])));
  assign mux_tmp_431 = MUX_s_1_2_2(nor_326_nl, mux_tmp_430, nand_4_nl);
  assign nor_327_nl = ~((rem_12cyc_st_3_3_2[1]) | (~ mux_tmp_431));
  assign nand_5_nl = ~(main_stage_0_4 & COMP_LOOP_asn_itm_3 & (rem_12cyc_st_3_1_0==2'b11)
      & (~ (rem_12cyc_st_3_3_2[0])));
  assign mux_tmp_432 = MUX_s_1_2_2(nor_327_nl, mux_tmp_431, nand_5_nl);
  assign nor_328_nl = ~((rem_12cyc_st_2_3_2[1]) | (~ mux_tmp_432));
  assign nand_6_nl = ~(main_stage_0_3 & COMP_LOOP_asn_itm_2 & (rem_12cyc_st_2_1_0==2'b11)
      & (~ (rem_12cyc_st_2_3_2[0])));
  assign mux_tmp_433 = MUX_s_1_2_2(nor_328_nl, mux_tmp_432, nand_6_nl);
  assign nor_329_nl = ~((rem_12cyc_st_9_3_2[1]) | (~ mux_tmp_433));
  assign nand_7_nl = ~(main_stage_0_10 & COMP_LOOP_asn_itm_9 & (rem_12cyc_st_9_1_0==2'b11)
      & (~ (rem_12cyc_st_9_3_2[0])));
  assign mux_tmp_434 = MUX_s_1_2_2(nor_329_nl, mux_tmp_433, nand_7_nl);
  assign nor_330_nl = ~((rem_12cyc_st_8_3_2[1]) | (~ mux_tmp_434));
  assign nand_8_nl = ~(main_stage_0_9 & COMP_LOOP_asn_itm_8 & (rem_12cyc_st_8_1_0==2'b11)
      & (~ (rem_12cyc_st_8_3_2[0])));
  assign mux_tmp_435 = MUX_s_1_2_2(nor_330_nl, mux_tmp_434, nand_8_nl);
  assign nor_331_nl = ~((rem_12cyc_st_7_3_2[1]) | (~ mux_tmp_435));
  assign nand_9_nl = ~(main_stage_0_8 & COMP_LOOP_asn_itm_7 & (rem_12cyc_st_7_1_0==2'b11)
      & (~ (rem_12cyc_st_7_3_2[0])));
  assign mux_tmp_436 = MUX_s_1_2_2(nor_331_nl, mux_tmp_435, nand_9_nl);
  assign and_934_nl = nand_223_cse & mux_tmp_436;
  assign nand_11_nl = ~(main_stage_0_2 & COMP_LOOP_asn_itm_1 & (rem_12cyc_3_2==2'b10));
  assign mux_tmp_437 = MUX_s_1_2_2(and_934_nl, mux_tmp_436, nand_11_nl);
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_64_2_2(result_sva_duc_mx0, qelse_acc_nl, mux_11_nl);
      m_buf_sva_12 <= m_buf_sva_11;
      m_buf_sva_11 <= m_buf_sva_10;
      m_buf_sva_10 <= m_buf_sva_9;
      m_buf_sva_9 <= m_buf_sva_8;
      m_buf_sva_8 <= m_buf_sva_7;
      m_buf_sva_7 <= m_buf_sva_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      COMP_LOOP_asn_itm_12 <= 1'b0;
      COMP_LOOP_asn_itm_11 <= 1'b0;
      COMP_LOOP_asn_itm_10 <= 1'b0;
      COMP_LOOP_asn_itm_9 <= 1'b0;
      COMP_LOOP_asn_itm_8 <= 1'b0;
      COMP_LOOP_asn_itm_7 <= 1'b0;
      COMP_LOOP_asn_itm_6 <= 1'b0;
      COMP_LOOP_asn_itm_5 <= 1'b0;
      COMP_LOOP_asn_itm_4 <= 1'b0;
      COMP_LOOP_asn_itm_3 <= 1'b0;
      COMP_LOOP_asn_itm_2 <= 1'b0;
      COMP_LOOP_asn_itm_1 <= 1'b0;
      main_stage_0_2 <= 1'b0;
      main_stage_0_3 <= 1'b0;
      main_stage_0_4 <= 1'b0;
      main_stage_0_5 <= 1'b0;
      main_stage_0_6 <= 1'b0;
      main_stage_0_7 <= 1'b0;
      main_stage_0_8 <= 1'b0;
      main_stage_0_9 <= 1'b0;
      main_stage_0_10 <= 1'b0;
      main_stage_0_11 <= 1'b0;
      main_stage_0_12 <= 1'b0;
      main_stage_0_13 <= 1'b0;
    end
    else if ( ccs_ccore_en ) begin
      COMP_LOOP_asn_itm_12 <= COMP_LOOP_asn_itm_11;
      COMP_LOOP_asn_itm_11 <= COMP_LOOP_asn_itm_10;
      COMP_LOOP_asn_itm_10 <= COMP_LOOP_asn_itm_9;
      COMP_LOOP_asn_itm_9 <= COMP_LOOP_asn_itm_8;
      COMP_LOOP_asn_itm_8 <= COMP_LOOP_asn_itm_7;
      COMP_LOOP_asn_itm_7 <= COMP_LOOP_asn_itm_6;
      COMP_LOOP_asn_itm_6 <= COMP_LOOP_asn_itm_5;
      COMP_LOOP_asn_itm_5 <= COMP_LOOP_asn_itm_4;
      COMP_LOOP_asn_itm_4 <= COMP_LOOP_asn_itm_3;
      COMP_LOOP_asn_itm_3 <= COMP_LOOP_asn_itm_2;
      COMP_LOOP_asn_itm_2 <= COMP_LOOP_asn_itm_1;
      COMP_LOOP_asn_itm_1 <= ccs_ccore_start_rsci_idat;
      main_stage_0_2 <= 1'b1;
      main_stage_0_3 <= main_stage_0_2;
      main_stage_0_4 <= main_stage_0_3;
      main_stage_0_5 <= main_stage_0_4;
      main_stage_0_6 <= main_stage_0_5;
      main_stage_0_7 <= main_stage_0_6;
      main_stage_0_8 <= main_stage_0_7;
      main_stage_0_9 <= main_stage_0_8;
      main_stage_0_10 <= main_stage_0_9;
      main_stage_0_11 <= main_stage_0_10;
      main_stage_0_12 <= main_stage_0_11;
      main_stage_0_13 <= main_stage_0_12;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_sva_duc <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( COMP_LOOP_asn_itm_12 & main_stage_0_13 & ccs_ccore_en & (~((rem_12cyc_st_12_3_2==2'b11)))
        ) begin
      result_sva_duc <= result_sva_duc_mx0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_12_3_2 <= 2'b00;
      rem_12cyc_st_12_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_26_cse ) begin
      rem_12cyc_st_12_3_2 <= rem_12cyc_st_11_3_2;
      rem_12cyc_st_12_1_0 <= rem_12cyc_st_11_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_cse ) begin
      rem_12_cmp_1_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_3_2_63_0, mut_3_3_63_0,
          mut_3_4_63_0, mut_3_5_63_0, mut_3_6_63_0, mut_3_7_63_0, mut_3_8_63_0, mut_3_9_63_0,
          mut_3_10_63_0, mut_3_11_63_0, {and_dcpl_294 , and_dcpl_300 , and_dcpl_306
          , and_dcpl_312 , and_dcpl_318 , and_dcpl_324 , and_dcpl_330 , and_dcpl_336
          , and_dcpl_342 , and_dcpl_348 , and_tmp_35});
      rem_12_cmp_1_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_2_2_63_0, mut_2_3_63_0,
          mut_2_4_63_0, mut_2_5_63_0, mut_2_6_63_0, mut_2_7_63_0, mut_2_8_63_0, mut_2_9_63_0,
          mut_2_10_63_0, mut_2_11_63_0, {and_dcpl_294 , and_dcpl_300 , and_dcpl_306
          , and_dcpl_312 , and_dcpl_318 , and_dcpl_324 , and_dcpl_330 , and_dcpl_336
          , and_dcpl_342 , and_dcpl_348 , and_tmp_35});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_2_cse ) begin
      rem_12_cmp_2_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_5_2_63_0, mut_5_3_63_0,
          mut_5_4_63_0, mut_5_5_63_0, mut_5_6_63_0, mut_5_7_63_0, mut_5_8_63_0, mut_5_9_63_0,
          mut_5_10_63_0, mut_5_11_63_0, {and_dcpl_356 , and_dcpl_360 , and_dcpl_364
          , and_dcpl_368 , and_dcpl_372 , and_dcpl_376 , and_dcpl_379 , and_dcpl_382
          , and_dcpl_385 , and_dcpl_388 , mux_tmp_76});
      rem_12_cmp_2_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_4_2_63_0, mut_4_3_63_0,
          mut_4_4_63_0, mut_4_5_63_0, mut_4_6_63_0, mut_4_7_63_0, mut_4_8_63_0, mut_4_9_63_0,
          mut_4_10_63_0, mut_4_11_63_0, {and_dcpl_356 , and_dcpl_360 , and_dcpl_364
          , and_dcpl_368 , and_dcpl_372 , and_dcpl_376 , and_dcpl_379 , and_dcpl_382
          , and_dcpl_385 , and_dcpl_388 , mux_tmp_76});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_4_cse ) begin
      rem_12_cmp_3_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_7_2_63_0, mut_7_3_63_0,
          mut_7_4_63_0, mut_7_5_63_0, mut_7_6_63_0, mut_7_7_63_0, mut_7_8_63_0, mut_7_9_63_0,
          mut_7_10_63_0, mut_7_11_63_0, {and_dcpl_394 , and_dcpl_397 , and_dcpl_400
          , and_dcpl_403 , and_dcpl_406 , and_dcpl_409 , and_dcpl_413 , and_dcpl_417
          , and_dcpl_421 , and_dcpl_425 , and_tmp_80});
      rem_12_cmp_3_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_6_2_63_0, mut_6_3_63_0,
          mut_6_4_63_0, mut_6_5_63_0, mut_6_6_63_0, mut_6_7_63_0, mut_6_8_63_0, mut_6_9_63_0,
          mut_6_10_63_0, mut_6_11_63_0, {and_dcpl_394 , and_dcpl_397 , and_dcpl_400
          , and_dcpl_403 , and_dcpl_406 , and_dcpl_409 , and_dcpl_413 , and_dcpl_417
          , and_dcpl_421 , and_dcpl_425 , and_tmp_80});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_6_cse ) begin
      rem_12_cmp_4_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_9_2_63_0, mut_9_3_63_0,
          mut_9_4_63_0, mut_9_5_63_0, mut_9_6_63_0, mut_9_7_63_0, mut_9_8_63_0, mut_9_9_63_0,
          mut_9_10_63_0, mut_9_11_63_0, {and_dcpl_431 , and_dcpl_433 , and_dcpl_435
          , and_dcpl_437 , and_dcpl_439 , and_dcpl_442 , and_dcpl_445 , and_dcpl_448
          , and_dcpl_451 , and_dcpl_454 , mux_tmp_141});
      rem_12_cmp_4_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_8_2_63_0, mut_8_3_63_0,
          mut_8_4_63_0, mut_8_5_63_0, mut_8_6_63_0, mut_8_7_63_0, mut_8_8_63_0, mut_8_9_63_0,
          mut_8_10_63_0, mut_8_11_63_0, {and_dcpl_431 , and_dcpl_433 , and_dcpl_435
          , and_dcpl_437 , and_dcpl_439 , and_dcpl_442 , and_dcpl_445 , and_dcpl_448
          , and_dcpl_451 , and_dcpl_454 , mux_tmp_141});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_8_cse ) begin
      rem_12_cmp_5_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_11_2_63_0, mut_11_3_63_0,
          mut_11_4_63_0, mut_11_5_63_0, mut_11_6_63_0, mut_11_7_63_0, mut_11_8_63_0,
          mut_11_9_63_0, mut_11_10_63_0, mut_11_11_63_0, {and_dcpl_461 , and_dcpl_465
          , and_dcpl_469 , and_dcpl_473 , and_dcpl_477 , and_dcpl_480 , and_dcpl_483
          , and_dcpl_486 , and_dcpl_489 , and_dcpl_492 , and_tmp_125});
      rem_12_cmp_5_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_10_2_63_0, mut_10_3_63_0,
          mut_10_4_63_0, mut_10_5_63_0, mut_10_6_63_0, mut_10_7_63_0, mut_10_8_63_0,
          mut_10_9_63_0, mut_10_10_63_0, mut_10_11_63_0, {and_dcpl_461 , and_dcpl_465
          , and_dcpl_469 , and_dcpl_473 , and_dcpl_477 , and_dcpl_480 , and_dcpl_483
          , and_dcpl_486 , and_dcpl_489 , and_dcpl_492 , and_tmp_125});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_10_cse ) begin
      rem_12_cmp_6_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_13_2_63_0, mut_13_3_63_0,
          mut_13_4_63_0, mut_13_5_63_0, mut_13_6_63_0, mut_13_7_63_0, mut_13_8_63_0,
          mut_13_9_63_0, mut_13_10_63_0, mut_13_11_63_0, {and_dcpl_498 , and_dcpl_500
          , and_dcpl_502 , and_dcpl_504 , and_dcpl_506 , and_dcpl_508 , and_dcpl_510
          , and_dcpl_512 , and_dcpl_514 , and_dcpl_516 , mux_tmp_206});
      rem_12_cmp_6_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_12_2_63_0, mut_12_3_63_0,
          mut_12_4_63_0, mut_12_5_63_0, mut_12_6_63_0, mut_12_7_63_0, mut_12_8_63_0,
          mut_12_9_63_0, mut_12_10_63_0, mut_12_11_63_0, {and_dcpl_498 , and_dcpl_500
          , and_dcpl_502 , and_dcpl_504 , and_dcpl_506 , and_dcpl_508 , and_dcpl_510
          , and_dcpl_512 , and_dcpl_514 , and_dcpl_516 , mux_tmp_206});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_12_cse ) begin
      rem_12_cmp_7_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_15_2_63_0, mut_15_3_63_0,
          mut_15_4_63_0, mut_15_5_63_0, mut_15_6_63_0, mut_15_7_63_0, mut_15_8_63_0,
          mut_15_9_63_0, mut_15_10_63_0, mut_15_11_63_0, {and_dcpl_520 , and_dcpl_523
          , and_dcpl_526 , and_dcpl_529 , and_dcpl_532 , and_dcpl_534 , and_dcpl_536
          , and_dcpl_538 , and_dcpl_540 , and_dcpl_542 , and_tmp_170});
      rem_12_cmp_7_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_14_2_63_0, mut_14_3_63_0,
          mut_14_4_63_0, mut_14_5_63_0, mut_14_6_63_0, mut_14_7_63_0, mut_14_8_63_0,
          mut_14_9_63_0, mut_14_10_63_0, mut_14_11_63_0, {and_dcpl_520 , and_dcpl_523
          , and_dcpl_526 , and_dcpl_529 , and_dcpl_532 , and_dcpl_534 , and_dcpl_536
          , and_dcpl_538 , and_dcpl_540 , and_dcpl_542 , and_tmp_170});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_14_cse ) begin
      rem_12_cmp_8_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_17_2_63_0, mut_17_3_63_0,
          mut_17_4_63_0, mut_17_5_63_0, mut_17_6_63_0, mut_17_7_63_0, mut_17_8_63_0,
          mut_17_9_63_0, mut_17_10_63_0, mut_17_11_63_0, {and_dcpl_546 , and_dcpl_548
          , and_dcpl_550 , and_dcpl_552 , and_dcpl_554 , and_dcpl_556 , and_dcpl_558
          , and_dcpl_560 , and_dcpl_562 , and_dcpl_564 , mux_tmp_271});
      rem_12_cmp_8_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_16_2_63_0, mut_16_3_63_0,
          mut_16_4_63_0, mut_16_5_63_0, mut_16_6_63_0, mut_16_7_63_0, mut_16_8_63_0,
          mut_16_9_63_0, mut_16_10_63_0, mut_16_11_63_0, {and_dcpl_546 , and_dcpl_548
          , and_dcpl_550 , and_dcpl_552 , and_dcpl_554 , and_dcpl_556 , and_dcpl_558
          , and_dcpl_560 , and_dcpl_562 , and_dcpl_564 , mux_tmp_271});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_16_cse ) begin
      rem_12_cmp_9_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_19_2_63_0, mut_19_3_63_0,
          mut_19_4_63_0, mut_19_5_63_0, mut_19_6_63_0, mut_19_7_63_0, mut_19_8_63_0,
          mut_19_9_63_0, mut_19_10_63_0, mut_19_11_63_0, {and_dcpl_569 , and_dcpl_573
          , and_dcpl_577 , and_dcpl_581 , and_dcpl_585 , and_dcpl_589 , and_dcpl_593
          , and_dcpl_597 , and_dcpl_601 , and_dcpl_605 , and_tmp_206});
      rem_12_cmp_9_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_18_2_63_0, mut_18_3_63_0,
          mut_18_4_63_0, mut_18_5_63_0, mut_18_6_63_0, mut_18_7_63_0, mut_18_8_63_0,
          mut_18_9_63_0, mut_18_10_63_0, mut_18_11_63_0, {and_dcpl_569 , and_dcpl_573
          , and_dcpl_577 , and_dcpl_581 , and_dcpl_585 , and_dcpl_589 , and_dcpl_593
          , and_dcpl_597 , and_dcpl_601 , and_dcpl_605 , and_tmp_206});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_18_cse ) begin
      rem_12_cmp_10_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_21_2_63_0, mut_21_3_63_0,
          mut_21_4_63_0, mut_21_5_63_0, mut_21_6_63_0, mut_21_7_63_0, mut_21_8_63_0,
          mut_21_9_63_0, mut_21_10_63_0, mut_21_11_63_0, {and_dcpl_610 , and_dcpl_612
          , and_dcpl_614 , and_dcpl_616 , and_dcpl_618 , and_dcpl_622 , and_dcpl_625
          , and_dcpl_628 , and_dcpl_631 , and_dcpl_634 , mux_tmp_354});
      rem_12_cmp_10_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_20_2_63_0, mut_20_3_63_0,
          mut_20_4_63_0, mut_20_5_63_0, mut_20_6_63_0, mut_20_7_63_0, mut_20_8_63_0,
          mut_20_9_63_0, mut_20_10_63_0, mut_20_11_63_0, {and_dcpl_610 , and_dcpl_612
          , and_dcpl_614 , and_dcpl_616 , and_dcpl_618 , and_dcpl_622 , and_dcpl_625
          , and_dcpl_628 , and_dcpl_631 , and_dcpl_634 , mux_tmp_354});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_20_cse ) begin
      rem_12_cmp_11_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_23_2_63_0, mut_23_3_63_0,
          mut_23_4_63_0, mut_23_5_63_0, mut_23_6_63_0, mut_23_7_63_0, mut_23_8_63_0,
          mut_23_9_63_0, mut_23_10_63_0, mut_23_11_63_0, {and_dcpl_638 , and_dcpl_641
          , and_dcpl_644 , and_dcpl_647 , and_dcpl_650 , and_dcpl_653 , and_dcpl_657
          , and_dcpl_661 , and_dcpl_665 , and_dcpl_669 , and_tmp_233});
      rem_12_cmp_11_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_22_2_63_0, mut_22_3_63_0,
          mut_22_4_63_0, mut_22_5_63_0, mut_22_6_63_0, mut_22_7_63_0, mut_22_8_63_0,
          mut_22_9_63_0, mut_22_10_63_0, mut_22_11_63_0, {and_dcpl_638 , and_dcpl_641
          , and_dcpl_644 , and_dcpl_647 , and_dcpl_650 , and_dcpl_653 , and_dcpl_657
          , and_dcpl_661 , and_dcpl_665 , and_dcpl_669 , and_tmp_233});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_22_cse ) begin
      rem_12_cmp_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_1_2_63_0, mut_1_3_63_0,
          mut_1_4_63_0, mut_1_5_63_0, mut_1_6_63_0, mut_1_7_63_0, mut_1_8_63_0, mut_1_9_63_0,
          mut_1_10_63_0, mut_1_11_63_0, {and_dcpl_673 , and_dcpl_675 , and_dcpl_677
          , and_dcpl_679 , and_dcpl_681 , and_dcpl_684 , and_dcpl_687 , and_dcpl_690
          , and_dcpl_693 , and_dcpl_696 , mux_tmp_437});
      rem_12_cmp_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_2_63_0, mut_3_63_0,
          mut_4_63_0, mut_5_63_0, mut_6_63_0, mut_7_63_0, mut_8_63_0, mut_9_63_0,
          mut_10_63_0, mut_11_63_0, {and_dcpl_673 , and_dcpl_675 , and_dcpl_677 ,
          and_dcpl_679 , and_dcpl_681 , and_dcpl_684 , and_dcpl_687 , and_dcpl_690
          , and_dcpl_693 , and_dcpl_696 , mux_tmp_437});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_28_cse ) begin
      mut_3_11_63_0 <= mut_3_10_63_0;
      mut_2_11_63_0 <= mut_2_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_30_cse ) begin
      mut_5_11_63_0 <= mut_5_10_63_0;
      mut_4_11_63_0 <= mut_4_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_32_cse ) begin
      mut_7_11_63_0 <= mut_7_10_63_0;
      mut_6_11_63_0 <= mut_6_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_34_cse ) begin
      mut_9_11_63_0 <= mut_9_10_63_0;
      mut_8_11_63_0 <= mut_8_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_36_cse ) begin
      mut_11_11_63_0 <= mut_11_10_63_0;
      mut_10_11_63_0 <= mut_10_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_38_cse ) begin
      mut_13_11_63_0 <= mut_13_10_63_0;
      mut_12_11_63_0 <= mut_12_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_40_cse ) begin
      mut_15_11_63_0 <= mut_15_10_63_0;
      mut_14_11_63_0 <= mut_14_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_42_cse ) begin
      mut_17_11_63_0 <= mut_17_10_63_0;
      mut_16_11_63_0 <= mut_16_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_44_cse ) begin
      mut_19_11_63_0 <= mut_19_10_63_0;
      mut_18_11_63_0 <= mut_18_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_46_cse ) begin
      mut_21_11_63_0 <= mut_21_10_63_0;
      mut_20_11_63_0 <= mut_20_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_48_cse ) begin
      mut_23_11_63_0 <= mut_23_10_63_0;
      mut_22_11_63_0 <= mut_22_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_50_cse ) begin
      mut_1_11_63_0 <= mut_1_10_63_0;
      mut_11_63_0 <= mut_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_11_3_2 <= 2'b00;
      rem_12cyc_st_11_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_52_cse ) begin
      rem_12cyc_st_11_3_2 <= rem_12cyc_st_10_3_2;
      rem_12cyc_st_11_1_0 <= rem_12cyc_st_10_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_54_cse ) begin
      mut_3_10_63_0 <= mut_3_9_63_0;
      mut_2_10_63_0 <= mut_2_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_56_cse ) begin
      mut_5_10_63_0 <= mut_5_9_63_0;
      mut_4_10_63_0 <= mut_4_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_58_cse ) begin
      mut_7_10_63_0 <= mut_7_9_63_0;
      mut_6_10_63_0 <= mut_6_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_60_cse ) begin
      mut_9_10_63_0 <= mut_9_9_63_0;
      mut_8_10_63_0 <= mut_8_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_62_cse ) begin
      mut_11_10_63_0 <= mut_11_9_63_0;
      mut_10_10_63_0 <= mut_10_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_64_cse ) begin
      mut_13_10_63_0 <= mut_13_9_63_0;
      mut_12_10_63_0 <= mut_12_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_66_cse ) begin
      mut_15_10_63_0 <= mut_15_9_63_0;
      mut_14_10_63_0 <= mut_14_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_68_cse ) begin
      mut_17_10_63_0 <= mut_17_9_63_0;
      mut_16_10_63_0 <= mut_16_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_70_cse ) begin
      mut_19_10_63_0 <= mut_19_9_63_0;
      mut_18_10_63_0 <= mut_18_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_72_cse ) begin
      mut_21_10_63_0 <= mut_21_9_63_0;
      mut_20_10_63_0 <= mut_20_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_74_cse ) begin
      mut_23_10_63_0 <= mut_23_9_63_0;
      mut_22_10_63_0 <= mut_22_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_76_cse ) begin
      mut_1_10_63_0 <= mut_1_9_63_0;
      mut_10_63_0 <= mut_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_10_3_2 <= 2'b00;
      rem_12cyc_st_10_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_78_cse ) begin
      rem_12cyc_st_10_3_2 <= rem_12cyc_st_9_3_2;
      rem_12cyc_st_10_1_0 <= rem_12cyc_st_9_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_80_cse ) begin
      mut_3_9_63_0 <= mut_3_8_63_0;
      mut_2_9_63_0 <= mut_2_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_82_cse ) begin
      mut_5_9_63_0 <= mut_5_8_63_0;
      mut_4_9_63_0 <= mut_4_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_84_cse ) begin
      mut_7_9_63_0 <= mut_7_8_63_0;
      mut_6_9_63_0 <= mut_6_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_86_cse ) begin
      mut_9_9_63_0 <= mut_9_8_63_0;
      mut_8_9_63_0 <= mut_8_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_88_cse ) begin
      mut_11_9_63_0 <= mut_11_8_63_0;
      mut_10_9_63_0 <= mut_10_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_90_cse ) begin
      mut_13_9_63_0 <= mut_13_8_63_0;
      mut_12_9_63_0 <= mut_12_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_92_cse ) begin
      mut_15_9_63_0 <= mut_15_8_63_0;
      mut_14_9_63_0 <= mut_14_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_94_cse ) begin
      mut_17_9_63_0 <= mut_17_8_63_0;
      mut_16_9_63_0 <= mut_16_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_96_cse ) begin
      mut_19_9_63_0 <= mut_19_8_63_0;
      mut_18_9_63_0 <= mut_18_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_98_cse ) begin
      mut_21_9_63_0 <= mut_21_8_63_0;
      mut_20_9_63_0 <= mut_20_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_100_cse ) begin
      mut_23_9_63_0 <= mut_23_8_63_0;
      mut_22_9_63_0 <= mut_22_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_102_cse ) begin
      mut_1_9_63_0 <= mut_1_8_63_0;
      mut_9_63_0 <= mut_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_9_3_2 <= 2'b00;
      rem_12cyc_st_9_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_104_cse ) begin
      rem_12cyc_st_9_3_2 <= rem_12cyc_st_8_3_2;
      rem_12cyc_st_9_1_0 <= rem_12cyc_st_8_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_106_cse ) begin
      mut_3_8_63_0 <= mut_3_7_63_0;
      mut_2_8_63_0 <= mut_2_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_108_cse ) begin
      mut_5_8_63_0 <= mut_5_7_63_0;
      mut_4_8_63_0 <= mut_4_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_110_cse ) begin
      mut_7_8_63_0 <= mut_7_7_63_0;
      mut_6_8_63_0 <= mut_6_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_112_cse ) begin
      mut_9_8_63_0 <= mut_9_7_63_0;
      mut_8_8_63_0 <= mut_8_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_114_cse ) begin
      mut_11_8_63_0 <= mut_11_7_63_0;
      mut_10_8_63_0 <= mut_10_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_116_cse ) begin
      mut_13_8_63_0 <= mut_13_7_63_0;
      mut_12_8_63_0 <= mut_12_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_118_cse ) begin
      mut_15_8_63_0 <= mut_15_7_63_0;
      mut_14_8_63_0 <= mut_14_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_120_cse ) begin
      mut_17_8_63_0 <= mut_17_7_63_0;
      mut_16_8_63_0 <= mut_16_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_122_cse ) begin
      mut_19_8_63_0 <= mut_19_7_63_0;
      mut_18_8_63_0 <= mut_18_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_124_cse ) begin
      mut_21_8_63_0 <= mut_21_7_63_0;
      mut_20_8_63_0 <= mut_20_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_126_cse ) begin
      mut_23_8_63_0 <= mut_23_7_63_0;
      mut_22_8_63_0 <= mut_22_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_128_cse ) begin
      mut_1_8_63_0 <= mut_1_7_63_0;
      mut_8_63_0 <= mut_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_8_3_2 <= 2'b00;
      rem_12cyc_st_8_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_130_cse ) begin
      rem_12cyc_st_8_3_2 <= rem_12cyc_st_7_3_2;
      rem_12cyc_st_8_1_0 <= rem_12cyc_st_7_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_132_cse ) begin
      mut_3_7_63_0 <= mut_3_6_63_0;
      mut_2_7_63_0 <= mut_2_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_134_cse ) begin
      mut_5_7_63_0 <= mut_5_6_63_0;
      mut_4_7_63_0 <= mut_4_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_136_cse ) begin
      mut_7_7_63_0 <= mut_7_6_63_0;
      mut_6_7_63_0 <= mut_6_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_138_cse ) begin
      mut_9_7_63_0 <= mut_9_6_63_0;
      mut_8_7_63_0 <= mut_8_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_140_cse ) begin
      mut_11_7_63_0 <= mut_11_6_63_0;
      mut_10_7_63_0 <= mut_10_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_142_cse ) begin
      mut_13_7_63_0 <= mut_13_6_63_0;
      mut_12_7_63_0 <= mut_12_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_144_cse ) begin
      mut_15_7_63_0 <= mut_15_6_63_0;
      mut_14_7_63_0 <= mut_14_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_146_cse ) begin
      mut_17_7_63_0 <= mut_17_6_63_0;
      mut_16_7_63_0 <= mut_16_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_148_cse ) begin
      mut_19_7_63_0 <= mut_19_6_63_0;
      mut_18_7_63_0 <= mut_18_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_150_cse ) begin
      mut_21_7_63_0 <= mut_21_6_63_0;
      mut_20_7_63_0 <= mut_20_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_152_cse ) begin
      mut_23_7_63_0 <= mut_23_6_63_0;
      mut_22_7_63_0 <= mut_22_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_154_cse ) begin
      mut_1_7_63_0 <= mut_1_6_63_0;
      mut_7_63_0 <= mut_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_7_3_2 <= 2'b00;
      rem_12cyc_st_7_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_156_cse ) begin
      rem_12cyc_st_7_3_2 <= rem_12cyc_st_6_3_2;
      rem_12cyc_st_7_1_0 <= rem_12cyc_st_6_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_158_cse ) begin
      mut_3_6_63_0 <= mut_3_5_63_0;
      mut_2_6_63_0 <= mut_2_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_160_cse ) begin
      mut_5_6_63_0 <= mut_5_5_63_0;
      mut_4_6_63_0 <= mut_4_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_162_cse ) begin
      mut_7_6_63_0 <= mut_7_5_63_0;
      mut_6_6_63_0 <= mut_6_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_164_cse ) begin
      mut_9_6_63_0 <= mut_9_5_63_0;
      mut_8_6_63_0 <= mut_8_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_166_cse ) begin
      mut_11_6_63_0 <= mut_11_5_63_0;
      mut_10_6_63_0 <= mut_10_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_168_cse ) begin
      mut_13_6_63_0 <= mut_13_5_63_0;
      mut_12_6_63_0 <= mut_12_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_170_cse ) begin
      mut_15_6_63_0 <= mut_15_5_63_0;
      mut_14_6_63_0 <= mut_14_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_172_cse ) begin
      mut_17_6_63_0 <= mut_17_5_63_0;
      mut_16_6_63_0 <= mut_16_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_174_cse ) begin
      mut_19_6_63_0 <= mut_19_5_63_0;
      mut_18_6_63_0 <= mut_18_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_176_cse ) begin
      mut_21_6_63_0 <= mut_21_5_63_0;
      mut_20_6_63_0 <= mut_20_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_178_cse ) begin
      mut_23_6_63_0 <= mut_23_5_63_0;
      mut_22_6_63_0 <= mut_22_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_180_cse ) begin
      mut_1_6_63_0 <= mut_1_5_63_0;
      mut_6_63_0 <= mut_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_182_cse ) begin
      m_buf_sva_6 <= m_buf_sva_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_6_3_2 <= 2'b00;
      rem_12cyc_st_6_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_182_cse ) begin
      rem_12cyc_st_6_3_2 <= rem_12cyc_st_5_3_2;
      rem_12cyc_st_6_1_0 <= rem_12cyc_st_5_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_184_cse ) begin
      mut_3_5_63_0 <= mut_3_4_63_0;
      mut_2_5_63_0 <= mut_2_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_186_cse ) begin
      mut_5_5_63_0 <= mut_5_4_63_0;
      mut_4_5_63_0 <= mut_4_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_188_cse ) begin
      mut_7_5_63_0 <= mut_7_4_63_0;
      mut_6_5_63_0 <= mut_6_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_190_cse ) begin
      mut_9_5_63_0 <= mut_9_4_63_0;
      mut_8_5_63_0 <= mut_8_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_192_cse ) begin
      mut_11_5_63_0 <= mut_11_4_63_0;
      mut_10_5_63_0 <= mut_10_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_194_cse ) begin
      mut_13_5_63_0 <= mut_13_4_63_0;
      mut_12_5_63_0 <= mut_12_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_196_cse ) begin
      mut_15_5_63_0 <= mut_15_4_63_0;
      mut_14_5_63_0 <= mut_14_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_198_cse ) begin
      mut_17_5_63_0 <= mut_17_4_63_0;
      mut_16_5_63_0 <= mut_16_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_200_cse ) begin
      mut_19_5_63_0 <= mut_19_4_63_0;
      mut_18_5_63_0 <= mut_18_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_202_cse ) begin
      mut_21_5_63_0 <= mut_21_4_63_0;
      mut_20_5_63_0 <= mut_20_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_204_cse ) begin
      mut_23_5_63_0 <= mut_23_4_63_0;
      mut_22_5_63_0 <= mut_22_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_206_cse ) begin
      mut_1_5_63_0 <= mut_1_4_63_0;
      mut_5_63_0 <= mut_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_208_cse ) begin
      m_buf_sva_5 <= m_buf_sva_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_5_3_2 <= 2'b00;
      rem_12cyc_st_5_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_208_cse ) begin
      rem_12cyc_st_5_3_2 <= rem_12cyc_st_4_3_2;
      rem_12cyc_st_5_1_0 <= rem_12cyc_st_4_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_210_cse ) begin
      mut_3_4_63_0 <= mut_3_3_63_0;
      mut_2_4_63_0 <= mut_2_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_212_cse ) begin
      mut_5_4_63_0 <= mut_5_3_63_0;
      mut_4_4_63_0 <= mut_4_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_214_cse ) begin
      mut_7_4_63_0 <= mut_7_3_63_0;
      mut_6_4_63_0 <= mut_6_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_216_cse ) begin
      mut_9_4_63_0 <= mut_9_3_63_0;
      mut_8_4_63_0 <= mut_8_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_218_cse ) begin
      mut_11_4_63_0 <= mut_11_3_63_0;
      mut_10_4_63_0 <= mut_10_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_220_cse ) begin
      mut_13_4_63_0 <= mut_13_3_63_0;
      mut_12_4_63_0 <= mut_12_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_222_cse ) begin
      mut_15_4_63_0 <= mut_15_3_63_0;
      mut_14_4_63_0 <= mut_14_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_224_cse ) begin
      mut_17_4_63_0 <= mut_17_3_63_0;
      mut_16_4_63_0 <= mut_16_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_226_cse ) begin
      mut_19_4_63_0 <= mut_19_3_63_0;
      mut_18_4_63_0 <= mut_18_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_228_cse ) begin
      mut_21_4_63_0 <= mut_21_3_63_0;
      mut_20_4_63_0 <= mut_20_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_230_cse ) begin
      mut_23_4_63_0 <= mut_23_3_63_0;
      mut_22_4_63_0 <= mut_22_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_232_cse ) begin
      mut_1_4_63_0 <= mut_1_3_63_0;
      mut_4_63_0 <= mut_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_234_cse ) begin
      m_buf_sva_4 <= m_buf_sva_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_4_3_2 <= 2'b00;
      rem_12cyc_st_4_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_234_cse ) begin
      rem_12cyc_st_4_3_2 <= rem_12cyc_st_3_3_2;
      rem_12cyc_st_4_1_0 <= rem_12cyc_st_3_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_236_cse ) begin
      mut_3_3_63_0 <= mut_3_2_63_0;
      mut_2_3_63_0 <= mut_2_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_238_cse ) begin
      mut_5_3_63_0 <= mut_5_2_63_0;
      mut_4_3_63_0 <= mut_4_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_240_cse ) begin
      mut_7_3_63_0 <= mut_7_2_63_0;
      mut_6_3_63_0 <= mut_6_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_242_cse ) begin
      mut_9_3_63_0 <= mut_9_2_63_0;
      mut_8_3_63_0 <= mut_8_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_244_cse ) begin
      mut_11_3_63_0 <= mut_11_2_63_0;
      mut_10_3_63_0 <= mut_10_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_246_cse ) begin
      mut_13_3_63_0 <= mut_13_2_63_0;
      mut_12_3_63_0 <= mut_12_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_248_cse ) begin
      mut_15_3_63_0 <= mut_15_2_63_0;
      mut_14_3_63_0 <= mut_14_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_250_cse ) begin
      mut_17_3_63_0 <= mut_17_2_63_0;
      mut_16_3_63_0 <= mut_16_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_252_cse ) begin
      mut_19_3_63_0 <= mut_19_2_63_0;
      mut_18_3_63_0 <= mut_18_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_254_cse ) begin
      mut_21_3_63_0 <= mut_21_2_63_0;
      mut_20_3_63_0 <= mut_20_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_256_cse ) begin
      mut_23_3_63_0 <= mut_23_2_63_0;
      mut_22_3_63_0 <= mut_22_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_258_cse ) begin
      mut_1_3_63_0 <= mut_1_2_63_0;
      mut_3_63_0 <= mut_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_260_cse ) begin
      m_buf_sva_3 <= m_buf_sva_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_3_3_2 <= 2'b00;
      rem_12cyc_st_3_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_260_cse ) begin
      rem_12cyc_st_3_3_2 <= rem_12cyc_st_2_3_2;
      rem_12cyc_st_3_1_0 <= rem_12cyc_st_2_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_262_cse ) begin
      mut_3_2_63_0 <= rem_12_cmp_1_b_63_0;
      mut_2_2_63_0 <= rem_12_cmp_1_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_264_cse ) begin
      mut_5_2_63_0 <= rem_12_cmp_2_b_63_0;
      mut_4_2_63_0 <= rem_12_cmp_2_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_266_cse ) begin
      mut_7_2_63_0 <= rem_12_cmp_3_b_63_0;
      mut_6_2_63_0 <= rem_12_cmp_3_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_268_cse ) begin
      mut_9_2_63_0 <= rem_12_cmp_4_b_63_0;
      mut_8_2_63_0 <= rem_12_cmp_4_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_270_cse ) begin
      mut_11_2_63_0 <= rem_12_cmp_5_b_63_0;
      mut_10_2_63_0 <= rem_12_cmp_5_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_272_cse ) begin
      mut_13_2_63_0 <= rem_12_cmp_6_b_63_0;
      mut_12_2_63_0 <= rem_12_cmp_6_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_274_cse ) begin
      mut_15_2_63_0 <= rem_12_cmp_7_b_63_0;
      mut_14_2_63_0 <= rem_12_cmp_7_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_276_cse ) begin
      mut_17_2_63_0 <= rem_12_cmp_8_b_63_0;
      mut_16_2_63_0 <= rem_12_cmp_8_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_278_cse ) begin
      mut_19_2_63_0 <= rem_12_cmp_9_b_63_0;
      mut_18_2_63_0 <= rem_12_cmp_9_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_280_cse ) begin
      mut_21_2_63_0 <= rem_12_cmp_10_b_63_0;
      mut_20_2_63_0 <= rem_12_cmp_10_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_282_cse ) begin
      mut_23_2_63_0 <= rem_12_cmp_11_b_63_0;
      mut_22_2_63_0 <= rem_12_cmp_11_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_284_cse ) begin
      mut_1_2_63_0 <= rem_12_cmp_b_63_0;
      mut_2_63_0 <= rem_12_cmp_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_286_cse ) begin
      m_buf_sva_2 <= m_buf_sva_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_2_3_2 <= 2'b00;
      rem_12cyc_st_2_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_286_cse ) begin
      rem_12cyc_st_2_3_2 <= rem_12cyc_3_2;
      rem_12cyc_st_2_1_0 <= rem_12cyc_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( COMP_LOOP_and_24_cse ) begin
      m_buf_sva_1 <= m_rsci_idat;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_3_2 <= 2'b00;
      rem_12cyc_1_0 <= 2'b00;
    end
    else if ( COMP_LOOP_and_24_cse ) begin
      rem_12cyc_3_2 <= COMP_LOOP_acc_tmp;
      rem_12cyc_1_0 <= COMP_LOOP_acc_1_tmp[1:0];
    end
  end
  assign nl_qelse_acc_nl = result_sva_duc_mx0 + m_buf_sva_12;
  assign qelse_acc_nl = nl_qelse_acc_nl[63:0];
  assign mux_8_nl = MUX_s_1_2_2((rem_12_cmp_1_z[63]), (rem_12_cmp_3_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_7_nl = MUX_s_1_2_2((rem_12_cmp_2_z[63]), (rem_12_cmp_4_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_9_nl = MUX_s_1_2_2(mux_8_nl, mux_7_nl, rem_12cyc_st_12_1_0[0]);
  assign mux_5_nl = MUX_s_1_2_2((rem_12_cmp_9_z[63]), (rem_12_cmp_11_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_4_nl = MUX_s_1_2_2((rem_12_cmp_10_z[63]), (rem_12_cmp_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_6_nl = MUX_s_1_2_2(mux_5_nl, mux_4_nl, rem_12cyc_st_12_1_0[0]);
  assign mux_10_nl = MUX_s_1_2_2(mux_9_nl, mux_6_nl, rem_12cyc_st_12_3_2[1]);
  assign mux_1_nl = MUX_s_1_2_2((rem_12_cmp_5_z[63]), (rem_12_cmp_7_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_nl = MUX_s_1_2_2((rem_12_cmp_6_z[63]), (rem_12_cmp_8_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_2_nl = MUX_s_1_2_2(mux_1_nl, mux_nl, rem_12cyc_st_12_1_0[0]);
  assign mux_3_nl = MUX_s_1_2_2(mux_2_nl, (result_sva_duc[63]), rem_12cyc_st_12_3_2[1]);
  assign mux_11_nl = MUX_s_1_2_2(mux_10_nl, mux_3_nl, rem_12cyc_st_12_3_2[0]);

  function automatic [63:0] MUX1HOT_v_64_11_2;
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
    input [10:0] sel;
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
    MUX1HOT_v_64_11_2 = result;
  end
  endfunction


  function automatic [63:0] MUX1HOT_v_64_13_2;
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
    input [12:0] sel;
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
    MUX1HOT_v_64_13_2 = result;
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


  function automatic [1:0] conv_u2u_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_2 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    modulo
// ------------------------------------------------------------------


module modulo (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat, ccs_ccore_clk,
      ccs_ccore_srst, ccs_ccore_en
);
  input [63:0] base_rsc_dat;
  input [63:0] m_rsc_dat;
  output [63:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  modulo_core modulo_core_inst (
      .base_rsc_dat(base_rsc_dat),
      .m_rsc_dat(m_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_start_rsc_dat(ccs_ccore_start_rsc_dat),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_srst(ccs_ccore_srst),
      .ccs_ccore_en(ccs_ccore_en)
    );
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
//  Generated date: Mon Aug  2 17:18:47 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_24_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_24_7_64_128_128_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output [63:0] q_d;
  input [6:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_23_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_23_7_64_128_128_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output [63:0] q_d;
  input [6:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_7_64_128_128_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output [63:0] q_d;
  input [6:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_7_64_128_128_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output [63:0] q_d;
  input [6:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_7_64_128_128_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output [63:0] q_d;
  input [6:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_7_64_128_128_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output [63:0] q_d;
  input [6:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_7_64_128_128_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output [63:0] q_d;
  input [6:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_7_64_128_128_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output [63:0] q_d;
  input [6:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_7_64_128_128_64_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output we;
  output [63:0] d;
  output [6:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_7_64_128_128_64_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output we;
  output [63:0] d;
  output [6:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_7_64_128_128_64_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output we;
  output [63:0] d;
  output [6:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_7_64_128_128_64_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output we;
  output [63:0] d;
  output [6:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_7_64_128_128_64_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output we;
  output [63:0] d;
  output [6:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_7_64_128_128_64_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output we;
  output [63:0] d;
  output [6:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_7_64_128_128_64_1_gen
    (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output we;
  output [63:0] d;
  output [6:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_7_64_128_128_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [6:0] radr;
  output we;
  output [63:0] d;
  output [6:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core_core_fsm (
  clk, rst, fsm_output, COMP_LOOP_C_31_tr0, COMP_LOOP_C_62_tr0, COMP_LOOP_C_93_tr0,
      COMP_LOOP_C_124_tr0, COMP_LOOP_C_155_tr0, COMP_LOOP_C_186_tr0, COMP_LOOP_C_217_tr0,
      COMP_LOOP_C_248_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input COMP_LOOP_C_31_tr0;
  input COMP_LOOP_C_62_tr0;
  input COMP_LOOP_C_93_tr0;
  input COMP_LOOP_C_124_tr0;
  input COMP_LOOP_C_155_tr0;
  input COMP_LOOP_C_186_tr0;
  input COMP_LOOP_C_217_tr0;
  input COMP_LOOP_C_248_tr0;
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
    COMP_LOOP_C_158 = 8'd160,
    COMP_LOOP_C_159 = 8'd161,
    COMP_LOOP_C_160 = 8'd162,
    COMP_LOOP_C_161 = 8'd163,
    COMP_LOOP_C_162 = 8'd164,
    COMP_LOOP_C_163 = 8'd165,
    COMP_LOOP_C_164 = 8'd166,
    COMP_LOOP_C_165 = 8'd167,
    COMP_LOOP_C_166 = 8'd168,
    COMP_LOOP_C_167 = 8'd169,
    COMP_LOOP_C_168 = 8'd170,
    COMP_LOOP_C_169 = 8'd171,
    COMP_LOOP_C_170 = 8'd172,
    COMP_LOOP_C_171 = 8'd173,
    COMP_LOOP_C_172 = 8'd174,
    COMP_LOOP_C_173 = 8'd175,
    COMP_LOOP_C_174 = 8'd176,
    COMP_LOOP_C_175 = 8'd177,
    COMP_LOOP_C_176 = 8'd178,
    COMP_LOOP_C_177 = 8'd179,
    COMP_LOOP_C_178 = 8'd180,
    COMP_LOOP_C_179 = 8'd181,
    COMP_LOOP_C_180 = 8'd182,
    COMP_LOOP_C_181 = 8'd183,
    COMP_LOOP_C_182 = 8'd184,
    COMP_LOOP_C_183 = 8'd185,
    COMP_LOOP_C_184 = 8'd186,
    COMP_LOOP_C_185 = 8'd187,
    COMP_LOOP_C_186 = 8'd188,
    COMP_LOOP_C_187 = 8'd189,
    COMP_LOOP_C_188 = 8'd190,
    COMP_LOOP_C_189 = 8'd191,
    COMP_LOOP_C_190 = 8'd192,
    COMP_LOOP_C_191 = 8'd193,
    COMP_LOOP_C_192 = 8'd194,
    COMP_LOOP_C_193 = 8'd195,
    COMP_LOOP_C_194 = 8'd196,
    COMP_LOOP_C_195 = 8'd197,
    COMP_LOOP_C_196 = 8'd198,
    COMP_LOOP_C_197 = 8'd199,
    COMP_LOOP_C_198 = 8'd200,
    COMP_LOOP_C_199 = 8'd201,
    COMP_LOOP_C_200 = 8'd202,
    COMP_LOOP_C_201 = 8'd203,
    COMP_LOOP_C_202 = 8'd204,
    COMP_LOOP_C_203 = 8'd205,
    COMP_LOOP_C_204 = 8'd206,
    COMP_LOOP_C_205 = 8'd207,
    COMP_LOOP_C_206 = 8'd208,
    COMP_LOOP_C_207 = 8'd209,
    COMP_LOOP_C_208 = 8'd210,
    COMP_LOOP_C_209 = 8'd211,
    COMP_LOOP_C_210 = 8'd212,
    COMP_LOOP_C_211 = 8'd213,
    COMP_LOOP_C_212 = 8'd214,
    COMP_LOOP_C_213 = 8'd215,
    COMP_LOOP_C_214 = 8'd216,
    COMP_LOOP_C_215 = 8'd217,
    COMP_LOOP_C_216 = 8'd218,
    COMP_LOOP_C_217 = 8'd219,
    COMP_LOOP_C_218 = 8'd220,
    COMP_LOOP_C_219 = 8'd221,
    COMP_LOOP_C_220 = 8'd222,
    COMP_LOOP_C_221 = 8'd223,
    COMP_LOOP_C_222 = 8'd224,
    COMP_LOOP_C_223 = 8'd225,
    COMP_LOOP_C_224 = 8'd226,
    COMP_LOOP_C_225 = 8'd227,
    COMP_LOOP_C_226 = 8'd228,
    COMP_LOOP_C_227 = 8'd229,
    COMP_LOOP_C_228 = 8'd230,
    COMP_LOOP_C_229 = 8'd231,
    COMP_LOOP_C_230 = 8'd232,
    COMP_LOOP_C_231 = 8'd233,
    COMP_LOOP_C_232 = 8'd234,
    COMP_LOOP_C_233 = 8'd235,
    COMP_LOOP_C_234 = 8'd236,
    COMP_LOOP_C_235 = 8'd237,
    COMP_LOOP_C_236 = 8'd238,
    COMP_LOOP_C_237 = 8'd239,
    COMP_LOOP_C_238 = 8'd240,
    COMP_LOOP_C_239 = 8'd241,
    COMP_LOOP_C_240 = 8'd242,
    COMP_LOOP_C_241 = 8'd243,
    COMP_LOOP_C_242 = 8'd244,
    COMP_LOOP_C_243 = 8'd245,
    COMP_LOOP_C_244 = 8'd246,
    COMP_LOOP_C_245 = 8'd247,
    COMP_LOOP_C_246 = 8'd248,
    COMP_LOOP_C_247 = 8'd249,
    COMP_LOOP_C_248 = 8'd250,
    VEC_LOOP_C_0 = 8'd251,
    STAGE_LOOP_C_1 = 8'd252,
    main_C_1 = 8'd253;

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
        if ( COMP_LOOP_C_31_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_32;
        end
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
        if ( COMP_LOOP_C_62_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_63;
        end
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
        state_var_NS = COMP_LOOP_C_80;
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
        if ( COMP_LOOP_C_93_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_94;
        end
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
        if ( COMP_LOOP_C_124_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_125;
        end
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
        if ( COMP_LOOP_C_155_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_156;
        end
      end
      COMP_LOOP_C_156 : begin
        fsm_output = 8'b10011110;
        state_var_NS = COMP_LOOP_C_157;
      end
      COMP_LOOP_C_157 : begin
        fsm_output = 8'b10011111;
        state_var_NS = COMP_LOOP_C_158;
      end
      COMP_LOOP_C_158 : begin
        fsm_output = 8'b10100000;
        state_var_NS = COMP_LOOP_C_159;
      end
      COMP_LOOP_C_159 : begin
        fsm_output = 8'b10100001;
        state_var_NS = COMP_LOOP_C_160;
      end
      COMP_LOOP_C_160 : begin
        fsm_output = 8'b10100010;
        state_var_NS = COMP_LOOP_C_161;
      end
      COMP_LOOP_C_161 : begin
        fsm_output = 8'b10100011;
        state_var_NS = COMP_LOOP_C_162;
      end
      COMP_LOOP_C_162 : begin
        fsm_output = 8'b10100100;
        state_var_NS = COMP_LOOP_C_163;
      end
      COMP_LOOP_C_163 : begin
        fsm_output = 8'b10100101;
        state_var_NS = COMP_LOOP_C_164;
      end
      COMP_LOOP_C_164 : begin
        fsm_output = 8'b10100110;
        state_var_NS = COMP_LOOP_C_165;
      end
      COMP_LOOP_C_165 : begin
        fsm_output = 8'b10100111;
        state_var_NS = COMP_LOOP_C_166;
      end
      COMP_LOOP_C_166 : begin
        fsm_output = 8'b10101000;
        state_var_NS = COMP_LOOP_C_167;
      end
      COMP_LOOP_C_167 : begin
        fsm_output = 8'b10101001;
        state_var_NS = COMP_LOOP_C_168;
      end
      COMP_LOOP_C_168 : begin
        fsm_output = 8'b10101010;
        state_var_NS = COMP_LOOP_C_169;
      end
      COMP_LOOP_C_169 : begin
        fsm_output = 8'b10101011;
        state_var_NS = COMP_LOOP_C_170;
      end
      COMP_LOOP_C_170 : begin
        fsm_output = 8'b10101100;
        state_var_NS = COMP_LOOP_C_171;
      end
      COMP_LOOP_C_171 : begin
        fsm_output = 8'b10101101;
        state_var_NS = COMP_LOOP_C_172;
      end
      COMP_LOOP_C_172 : begin
        fsm_output = 8'b10101110;
        state_var_NS = COMP_LOOP_C_173;
      end
      COMP_LOOP_C_173 : begin
        fsm_output = 8'b10101111;
        state_var_NS = COMP_LOOP_C_174;
      end
      COMP_LOOP_C_174 : begin
        fsm_output = 8'b10110000;
        state_var_NS = COMP_LOOP_C_175;
      end
      COMP_LOOP_C_175 : begin
        fsm_output = 8'b10110001;
        state_var_NS = COMP_LOOP_C_176;
      end
      COMP_LOOP_C_176 : begin
        fsm_output = 8'b10110010;
        state_var_NS = COMP_LOOP_C_177;
      end
      COMP_LOOP_C_177 : begin
        fsm_output = 8'b10110011;
        state_var_NS = COMP_LOOP_C_178;
      end
      COMP_LOOP_C_178 : begin
        fsm_output = 8'b10110100;
        state_var_NS = COMP_LOOP_C_179;
      end
      COMP_LOOP_C_179 : begin
        fsm_output = 8'b10110101;
        state_var_NS = COMP_LOOP_C_180;
      end
      COMP_LOOP_C_180 : begin
        fsm_output = 8'b10110110;
        state_var_NS = COMP_LOOP_C_181;
      end
      COMP_LOOP_C_181 : begin
        fsm_output = 8'b10110111;
        state_var_NS = COMP_LOOP_C_182;
      end
      COMP_LOOP_C_182 : begin
        fsm_output = 8'b10111000;
        state_var_NS = COMP_LOOP_C_183;
      end
      COMP_LOOP_C_183 : begin
        fsm_output = 8'b10111001;
        state_var_NS = COMP_LOOP_C_184;
      end
      COMP_LOOP_C_184 : begin
        fsm_output = 8'b10111010;
        state_var_NS = COMP_LOOP_C_185;
      end
      COMP_LOOP_C_185 : begin
        fsm_output = 8'b10111011;
        state_var_NS = COMP_LOOP_C_186;
      end
      COMP_LOOP_C_186 : begin
        fsm_output = 8'b10111100;
        if ( COMP_LOOP_C_186_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_187;
        end
      end
      COMP_LOOP_C_187 : begin
        fsm_output = 8'b10111101;
        state_var_NS = COMP_LOOP_C_188;
      end
      COMP_LOOP_C_188 : begin
        fsm_output = 8'b10111110;
        state_var_NS = COMP_LOOP_C_189;
      end
      COMP_LOOP_C_189 : begin
        fsm_output = 8'b10111111;
        state_var_NS = COMP_LOOP_C_190;
      end
      COMP_LOOP_C_190 : begin
        fsm_output = 8'b11000000;
        state_var_NS = COMP_LOOP_C_191;
      end
      COMP_LOOP_C_191 : begin
        fsm_output = 8'b11000001;
        state_var_NS = COMP_LOOP_C_192;
      end
      COMP_LOOP_C_192 : begin
        fsm_output = 8'b11000010;
        state_var_NS = COMP_LOOP_C_193;
      end
      COMP_LOOP_C_193 : begin
        fsm_output = 8'b11000011;
        state_var_NS = COMP_LOOP_C_194;
      end
      COMP_LOOP_C_194 : begin
        fsm_output = 8'b11000100;
        state_var_NS = COMP_LOOP_C_195;
      end
      COMP_LOOP_C_195 : begin
        fsm_output = 8'b11000101;
        state_var_NS = COMP_LOOP_C_196;
      end
      COMP_LOOP_C_196 : begin
        fsm_output = 8'b11000110;
        state_var_NS = COMP_LOOP_C_197;
      end
      COMP_LOOP_C_197 : begin
        fsm_output = 8'b11000111;
        state_var_NS = COMP_LOOP_C_198;
      end
      COMP_LOOP_C_198 : begin
        fsm_output = 8'b11001000;
        state_var_NS = COMP_LOOP_C_199;
      end
      COMP_LOOP_C_199 : begin
        fsm_output = 8'b11001001;
        state_var_NS = COMP_LOOP_C_200;
      end
      COMP_LOOP_C_200 : begin
        fsm_output = 8'b11001010;
        state_var_NS = COMP_LOOP_C_201;
      end
      COMP_LOOP_C_201 : begin
        fsm_output = 8'b11001011;
        state_var_NS = COMP_LOOP_C_202;
      end
      COMP_LOOP_C_202 : begin
        fsm_output = 8'b11001100;
        state_var_NS = COMP_LOOP_C_203;
      end
      COMP_LOOP_C_203 : begin
        fsm_output = 8'b11001101;
        state_var_NS = COMP_LOOP_C_204;
      end
      COMP_LOOP_C_204 : begin
        fsm_output = 8'b11001110;
        state_var_NS = COMP_LOOP_C_205;
      end
      COMP_LOOP_C_205 : begin
        fsm_output = 8'b11001111;
        state_var_NS = COMP_LOOP_C_206;
      end
      COMP_LOOP_C_206 : begin
        fsm_output = 8'b11010000;
        state_var_NS = COMP_LOOP_C_207;
      end
      COMP_LOOP_C_207 : begin
        fsm_output = 8'b11010001;
        state_var_NS = COMP_LOOP_C_208;
      end
      COMP_LOOP_C_208 : begin
        fsm_output = 8'b11010010;
        state_var_NS = COMP_LOOP_C_209;
      end
      COMP_LOOP_C_209 : begin
        fsm_output = 8'b11010011;
        state_var_NS = COMP_LOOP_C_210;
      end
      COMP_LOOP_C_210 : begin
        fsm_output = 8'b11010100;
        state_var_NS = COMP_LOOP_C_211;
      end
      COMP_LOOP_C_211 : begin
        fsm_output = 8'b11010101;
        state_var_NS = COMP_LOOP_C_212;
      end
      COMP_LOOP_C_212 : begin
        fsm_output = 8'b11010110;
        state_var_NS = COMP_LOOP_C_213;
      end
      COMP_LOOP_C_213 : begin
        fsm_output = 8'b11010111;
        state_var_NS = COMP_LOOP_C_214;
      end
      COMP_LOOP_C_214 : begin
        fsm_output = 8'b11011000;
        state_var_NS = COMP_LOOP_C_215;
      end
      COMP_LOOP_C_215 : begin
        fsm_output = 8'b11011001;
        state_var_NS = COMP_LOOP_C_216;
      end
      COMP_LOOP_C_216 : begin
        fsm_output = 8'b11011010;
        state_var_NS = COMP_LOOP_C_217;
      end
      COMP_LOOP_C_217 : begin
        fsm_output = 8'b11011011;
        if ( COMP_LOOP_C_217_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_218;
        end
      end
      COMP_LOOP_C_218 : begin
        fsm_output = 8'b11011100;
        state_var_NS = COMP_LOOP_C_219;
      end
      COMP_LOOP_C_219 : begin
        fsm_output = 8'b11011101;
        state_var_NS = COMP_LOOP_C_220;
      end
      COMP_LOOP_C_220 : begin
        fsm_output = 8'b11011110;
        state_var_NS = COMP_LOOP_C_221;
      end
      COMP_LOOP_C_221 : begin
        fsm_output = 8'b11011111;
        state_var_NS = COMP_LOOP_C_222;
      end
      COMP_LOOP_C_222 : begin
        fsm_output = 8'b11100000;
        state_var_NS = COMP_LOOP_C_223;
      end
      COMP_LOOP_C_223 : begin
        fsm_output = 8'b11100001;
        state_var_NS = COMP_LOOP_C_224;
      end
      COMP_LOOP_C_224 : begin
        fsm_output = 8'b11100010;
        state_var_NS = COMP_LOOP_C_225;
      end
      COMP_LOOP_C_225 : begin
        fsm_output = 8'b11100011;
        state_var_NS = COMP_LOOP_C_226;
      end
      COMP_LOOP_C_226 : begin
        fsm_output = 8'b11100100;
        state_var_NS = COMP_LOOP_C_227;
      end
      COMP_LOOP_C_227 : begin
        fsm_output = 8'b11100101;
        state_var_NS = COMP_LOOP_C_228;
      end
      COMP_LOOP_C_228 : begin
        fsm_output = 8'b11100110;
        state_var_NS = COMP_LOOP_C_229;
      end
      COMP_LOOP_C_229 : begin
        fsm_output = 8'b11100111;
        state_var_NS = COMP_LOOP_C_230;
      end
      COMP_LOOP_C_230 : begin
        fsm_output = 8'b11101000;
        state_var_NS = COMP_LOOP_C_231;
      end
      COMP_LOOP_C_231 : begin
        fsm_output = 8'b11101001;
        state_var_NS = COMP_LOOP_C_232;
      end
      COMP_LOOP_C_232 : begin
        fsm_output = 8'b11101010;
        state_var_NS = COMP_LOOP_C_233;
      end
      COMP_LOOP_C_233 : begin
        fsm_output = 8'b11101011;
        state_var_NS = COMP_LOOP_C_234;
      end
      COMP_LOOP_C_234 : begin
        fsm_output = 8'b11101100;
        state_var_NS = COMP_LOOP_C_235;
      end
      COMP_LOOP_C_235 : begin
        fsm_output = 8'b11101101;
        state_var_NS = COMP_LOOP_C_236;
      end
      COMP_LOOP_C_236 : begin
        fsm_output = 8'b11101110;
        state_var_NS = COMP_LOOP_C_237;
      end
      COMP_LOOP_C_237 : begin
        fsm_output = 8'b11101111;
        state_var_NS = COMP_LOOP_C_238;
      end
      COMP_LOOP_C_238 : begin
        fsm_output = 8'b11110000;
        state_var_NS = COMP_LOOP_C_239;
      end
      COMP_LOOP_C_239 : begin
        fsm_output = 8'b11110001;
        state_var_NS = COMP_LOOP_C_240;
      end
      COMP_LOOP_C_240 : begin
        fsm_output = 8'b11110010;
        state_var_NS = COMP_LOOP_C_241;
      end
      COMP_LOOP_C_241 : begin
        fsm_output = 8'b11110011;
        state_var_NS = COMP_LOOP_C_242;
      end
      COMP_LOOP_C_242 : begin
        fsm_output = 8'b11110100;
        state_var_NS = COMP_LOOP_C_243;
      end
      COMP_LOOP_C_243 : begin
        fsm_output = 8'b11110101;
        state_var_NS = COMP_LOOP_C_244;
      end
      COMP_LOOP_C_244 : begin
        fsm_output = 8'b11110110;
        state_var_NS = COMP_LOOP_C_245;
      end
      COMP_LOOP_C_245 : begin
        fsm_output = 8'b11110111;
        state_var_NS = COMP_LOOP_C_246;
      end
      COMP_LOOP_C_246 : begin
        fsm_output = 8'b11111000;
        state_var_NS = COMP_LOOP_C_247;
      end
      COMP_LOOP_C_247 : begin
        fsm_output = 8'b11111001;
        state_var_NS = COMP_LOOP_C_248;
      end
      COMP_LOOP_C_248 : begin
        fsm_output = 8'b11111010;
        if ( COMP_LOOP_C_248_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 8'b11111011;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 8'b11111100;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b11111101;
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
//  Design Unit:    inPlaceNTT_DIF_core_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core_wait_dp (
  ensig_cgo_iro, ensig_cgo, COMP_LOOP_1_modulo_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo;
  output COMP_LOOP_1_modulo_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign COMP_LOOP_1_modulo_cmp_ccs_ccore_en = ensig_cgo | ensig_cgo_iro;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_core
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core (
  clk, rst, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz, vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_3_lz, vec_rsc_triosy_0_4_lz, vec_rsc_triosy_0_5_lz, vec_rsc_triosy_0_6_lz,
      vec_rsc_triosy_0_7_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz, twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz, twiddle_rsc_triosy_0_2_lz, twiddle_rsc_triosy_0_3_lz,
      twiddle_rsc_triosy_0_4_lz, twiddle_rsc_triosy_0_5_lz, twiddle_rsc_triosy_0_6_lz,
      twiddle_rsc_triosy_0_7_lz, vec_rsc_0_0_i_q_d, vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_q_d, vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_2_i_q_d,
      vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_3_i_q_d, vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_4_i_q_d, vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_5_i_q_d,
      vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_6_i_q_d, vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_7_i_q_d, vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_0_i_radr_d, twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_4_i_radr_d, twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_5_i_q_d, twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_7_i_q_d, twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_0_i_d_d_pff, vec_rsc_0_0_i_radr_d_pff, vec_rsc_0_0_i_wadr_d_pff,
      vec_rsc_0_0_i_we_d_pff, vec_rsc_0_1_i_we_d_pff, vec_rsc_0_2_i_we_d_pff, vec_rsc_0_3_i_we_d_pff,
      vec_rsc_0_4_i_we_d_pff, vec_rsc_0_5_i_we_d_pff, vec_rsc_0_6_i_we_d_pff, vec_rsc_0_7_i_we_d_pff,
      twiddle_rsc_0_1_i_radr_d_pff, twiddle_rsc_0_2_i_radr_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_0_0_lz;
  output vec_rsc_triosy_0_1_lz;
  output vec_rsc_triosy_0_2_lz;
  output vec_rsc_triosy_0_3_lz;
  output vec_rsc_triosy_0_4_lz;
  output vec_rsc_triosy_0_5_lz;
  output vec_rsc_triosy_0_6_lz;
  output vec_rsc_triosy_0_7_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_0_0_lz;
  output twiddle_rsc_triosy_0_1_lz;
  output twiddle_rsc_triosy_0_2_lz;
  output twiddle_rsc_triosy_0_3_lz;
  output twiddle_rsc_triosy_0_4_lz;
  output twiddle_rsc_triosy_0_5_lz;
  output twiddle_rsc_triosy_0_6_lz;
  output twiddle_rsc_triosy_0_7_lz;
  input [63:0] vec_rsc_0_0_i_q_d;
  output vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_1_i_q_d;
  output vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_2_i_q_d;
  output vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_3_i_q_d;
  output vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_4_i_q_d;
  output vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_5_i_q_d;
  output vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_6_i_q_d;
  output vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_7_i_q_d;
  output vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_0_i_q_d;
  output [6:0] twiddle_rsc_0_0_i_radr_d;
  output twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_1_i_q_d;
  output twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_2_i_q_d;
  output twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_3_i_q_d;
  output twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_4_i_q_d;
  output [6:0] twiddle_rsc_0_4_i_radr_d;
  output twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_5_i_q_d;
  output twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_6_i_q_d;
  output twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_7_i_q_d;
  output twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d;
  output [63:0] vec_rsc_0_0_i_d_d_pff;
  output [6:0] vec_rsc_0_0_i_radr_d_pff;
  output [6:0] vec_rsc_0_0_i_wadr_d_pff;
  output vec_rsc_0_0_i_we_d_pff;
  output vec_rsc_0_1_i_we_d_pff;
  output vec_rsc_0_2_i_we_d_pff;
  output vec_rsc_0_3_i_we_d_pff;
  output vec_rsc_0_4_i_we_d_pff;
  output vec_rsc_0_5_i_we_d_pff;
  output vec_rsc_0_6_i_we_d_pff;
  output vec_rsc_0_7_i_we_d_pff;
  output [6:0] twiddle_rsc_0_1_i_radr_d_pff;
  output [6:0] twiddle_rsc_0_2_i_radr_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  wire [63:0] COMP_LOOP_1_modulo_cmp_return_rsc_z;
  wire COMP_LOOP_1_modulo_cmp_ccs_ccore_en;
  wire [7:0] fsm_output;
  wire or_dcpl;
  wire or_tmp_25;
  wire or_tmp_38;
  wire nor_tmp_29;
  wire nor_tmp_35;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_33;
  wire and_dcpl_35;
  wire nor_tmp_64;
  wire mux_tmp_192;
  wire nand_tmp_2;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_39;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_43;
  wire and_dcpl_44;
  wire and_dcpl_45;
  wire and_dcpl_47;
  wire and_dcpl_48;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_58;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire and_dcpl_65;
  wire and_dcpl_66;
  wire and_dcpl_68;
  wire and_dcpl_69;
  wire and_dcpl_70;
  wire and_dcpl_71;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire and_dcpl_83;
  wire and_dcpl_86;
  wire and_dcpl_88;
  wire not_tmp_134;
  wire not_tmp_135;
  wire not_tmp_138;
  wire not_tmp_147;
  wire not_tmp_153;
  wire and_dcpl_94;
  wire and_dcpl_95;
  wire and_dcpl_96;
  wire and_dcpl_97;
  wire and_dcpl_98;
  wire and_dcpl_99;
  wire and_dcpl_100;
  wire and_dcpl_101;
  wire and_dcpl_102;
  wire and_dcpl_104;
  wire and_dcpl_117;
  wire or_tmp_588;
  wire mux_tmp_472;
  wire mux_tmp_475;
  wire mux_tmp_478;
  wire mux_tmp_486;
  wire mux_tmp_487;
  wire mux_tmp_489;
  wire mux_tmp_490;
  wire and_dcpl_120;
  wire and_dcpl_121;
  wire and_dcpl_122;
  wire and_dcpl_123;
  wire and_dcpl_124;
  wire and_dcpl_125;
  wire and_dcpl_126;
  wire mux_tmp_495;
  wire not_tmp_290;
  wire mux_tmp_501;
  wire mux_tmp_503;
  wire or_tmp_610;
  wire or_dcpl_46;
  wire or_dcpl_51;
  wire or_dcpl_52;
  wire or_tmp_616;
  wire or_tmp_617;
  wire or_tmp_620;
  wire mux_tmp_522;
  wire mux_tmp_523;
  wire mux_tmp_526;
  wire mux_tmp_527;
  wire or_tmp_621;
  wire or_dcpl_53;
  wire and_dcpl_138;
  wire and_dcpl_143;
  wire and_dcpl_144;
  wire mux_tmp_554;
  wire mux_tmp_557;
  wire not_tmp_329;
  wire and_dcpl_145;
  wire and_dcpl_148;
  wire and_dcpl_150;
  wire or_tmp_631;
  wire mux_tmp_575;
  wire or_tmp_634;
  wire and_dcpl_153;
  wire and_dcpl_156;
  wire and_dcpl_159;
  wire and_dcpl_165;
  wire and_dcpl_167;
  wire and_dcpl_168;
  wire or_tmp_649;
  wire and_tmp_15;
  wire or_tmp_651;
  wire and_tmp_16;
  reg COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm;
  wire [9:0] COMP_LOOP_acc_1_cse_6_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_6_sva_1;
  reg [9:0] VEC_LOOP_j_10_0_sva_9_0;
  wire [9:0] COMP_LOOP_acc_1_cse_4_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_4_sva_1;
  wire [8:0] COMP_LOOP_acc_11_psp_sva_1;
  wire [9:0] nl_COMP_LOOP_acc_11_psp_sva_1;
  reg COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm;
  reg COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm;
  reg COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm;
  reg [9:0] COMP_LOOP_2_tmp_mul_idiv_sva;
  reg [9:0] COMP_LOOP_2_tmp_lshift_ncse_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_2_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_2_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_4_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_4_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_6_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_6_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_sva;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_sva;
  reg [7:0] COMP_LOOP_acc_13_psp_sva;
  wire [8:0] nl_COMP_LOOP_acc_13_psp_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_1_sva;
  reg [8:0] COMP_LOOP_acc_11_psp_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_3_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_5_sva;
  reg [8:0] COMP_LOOP_acc_14_psp_sva;
  wire [9:0] nl_COMP_LOOP_acc_14_psp_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_7_sva;
  reg [7:0] COMP_LOOP_5_tmp_mul_idiv_sva;
  reg [8:0] COMP_LOOP_3_tmp_lshift_ncse_sva;
  reg [1:0] COMP_LOOP_3_tmp_mul_idiv_sva_1_0;
  reg [10:0] STAGE_LOOP_lshift_psp_sva;
  reg [6:0] COMP_LOOP_k_10_3_sva_6_0;
  wire [9:0] COMP_LOOP_acc_1_cse_2_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_2_sva_1;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_rgt;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_rgt;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_rgt;
  wire and_203_m1c;
  reg [6:0] reg_COMP_LOOP_k_10_3_ftd;
  wire nand_137_cse;
  wire nand_138_cse;
  wire nand_126_cse;
  wire nand_127_cse;
  reg reg_vec_rsc_triosy_0_7_obj_ld_cse;
  reg reg_ensig_cgo_cse;
  wire and_263_cse;
  wire or_731_cse;
  wire and_280_cse;
  wire COMP_LOOP_tmp_or_2_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_nor_6_cse;
  wire or_735_cse;
  wire nor_441_cse;
  wire nor_474_cse;
  wire nand_132_cse;
  wire nand_130_cse;
  wire nand_97_cse;
  wire nand_98_cse;
  wire nand_99_cse;
  wire nand_133_cse;
  wire and_283_cse;
  wire mux_141_cse;
  reg [63:0] COMP_LOOP_1_acc_8_itm;
  reg [63:0] p_sva;
  reg [6:0] COMP_LOOP_acc_psp_sva;
  wire [7:0] nl_COMP_LOOP_acc_psp_sva;
  wire mux_496_itm;
  wire mux_529_itm;
  wire mux_564_itm;
  wire mux_573_itm;
  wire mux_575_itm;
  wire mux_580_itm;
  wire [10:0] z_out;
  wire [9:0] z_out_1;
  wire [7:0] z_out_2;
  wire [8:0] nl_z_out_2;
  wire and_dcpl_240;
  wire [10:0] z_out_3;
  wire and_dcpl_241;
  wire and_dcpl_242;
  wire and_dcpl_243;
  wire and_dcpl_247;
  wire and_dcpl_248;
  wire and_dcpl_249;
  wire and_dcpl_250;
  wire and_dcpl_253;
  wire and_dcpl_254;
  wire and_dcpl_256;
  wire and_dcpl_257;
  wire and_dcpl_260;
  wire and_dcpl_261;
  wire and_dcpl_263;
  wire and_dcpl_264;
  wire and_dcpl_268;
  wire and_dcpl_270;
  wire and_dcpl_271;
  wire and_dcpl_274;
  wire and_dcpl_275;
  wire and_dcpl_277;
  wire and_dcpl_278;
  wire and_dcpl_280;
  wire and_dcpl_281;
  wire and_dcpl_282;
  wire and_dcpl_284;
  wire and_dcpl_285;
  wire and_dcpl_286;
  wire [63:0] z_out_4;
  wire [127:0] nl_z_out_4;
  wire and_dcpl_300;
  wire [3:0] z_out_5;
  wire [4:0] nl_z_out_5;
  wire and_dcpl_312;
  wire and_dcpl_316;
  wire and_dcpl_377;
  wire [63:0] z_out_8;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [3:0] COMP_LOOP_1_tmp_acc_cse_sva;
  reg [63:0] tmp_16_sva;
  reg [63:0] tmp_21_sva_3;
  reg [63:0] tmp_21_sva_6;
  reg [63:0] tmp_21_sva_7;
  reg [63:0] tmp_23_sva_1;
  reg [63:0] tmp_23_sva_2;
  reg COMP_LOOP_COMP_LOOP_nor_1_itm;
  reg COMP_LOOP_COMP_LOOP_and_11_itm;
  reg COMP_LOOP_COMP_LOOP_and_12_itm;
  reg COMP_LOOP_COMP_LOOP_and_13_itm;
  reg COMP_LOOP_COMP_LOOP_nor_4_itm;
  reg COMP_LOOP_COMP_LOOP_and_30_itm;
  reg COMP_LOOP_COMP_LOOP_and_32_itm;
  reg COMP_LOOP_COMP_LOOP_and_33_itm;
  reg COMP_LOOP_COMP_LOOP_and_34_itm;
  reg COMP_LOOP_COMP_LOOP_nor_5_itm;
  reg COMP_LOOP_COMP_LOOP_and_37_itm;
  reg COMP_LOOP_COMP_LOOP_and_39_itm;
  reg COMP_LOOP_COMP_LOOP_and_40_itm;
  reg COMP_LOOP_COMP_LOOP_and_41_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_itm;
  reg COMP_LOOP_COMP_LOOP_and_60_itm;
  reg COMP_LOOP_COMP_LOOP_and_69_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_1_itm;
  reg COMP_LOOP_COMP_LOOP_and_86_itm;
  reg COMP_LOOP_COMP_LOOP_nor_13_itm;
  reg COMP_LOOP_COMP_LOOP_and_93_itm;
  reg COMP_LOOP_COMP_LOOP_and_95_itm;
  reg COMP_LOOP_COMP_LOOP_and_96_itm;
  reg COMP_LOOP_COMP_LOOP_and_97_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_nor_2_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_2_itm;
  reg COMP_LOOP_COMP_LOOP_nor_17_itm;
  reg COMP_LOOP_COMP_LOOP_and_121_itm;
  reg COMP_LOOP_COMP_LOOP_and_123_itm;
  reg COMP_LOOP_COMP_LOOP_and_124_itm;
  reg COMP_LOOP_COMP_LOOP_and_125_itm;
  reg [63:0] COMP_LOOP_tmp_mux_itm;
  reg COMP_LOOP_COMP_LOOP_and_145_itm;
  reg COMP_LOOP_COMP_LOOP_nor_21_itm;
  reg COMP_LOOP_COMP_LOOP_and_149_itm;
  reg COMP_LOOP_COMP_LOOP_and_151_itm;
  reg COMP_LOOP_COMP_LOOP_and_152_itm;
  reg COMP_LOOP_COMP_LOOP_and_153_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_3_itm;
  reg COMP_LOOP_COMP_LOOP_nor_25_itm;
  reg COMP_LOOP_COMP_LOOP_and_177_itm;
  reg COMP_LOOP_COMP_LOOP_and_179_itm;
  reg COMP_LOOP_COMP_LOOP_and_180_itm;
  reg COMP_LOOP_COMP_LOOP_and_181_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_4_itm;
  reg COMP_LOOP_COMP_LOOP_nor_29_itm;
  reg COMP_LOOP_COMP_LOOP_and_205_itm;
  reg COMP_LOOP_COMP_LOOP_and_207_itm;
  reg COMP_LOOP_COMP_LOOP_and_208_itm;
  reg COMP_LOOP_COMP_LOOP_and_209_itm;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire VEC_LOOP_j_10_0_sva_9_0_mx0c0;
  wire COMP_LOOP_1_acc_8_itm_mx0c3;
  wire COMP_LOOP_1_acc_8_itm_mx0c4;
  wire COMP_LOOP_1_acc_8_itm_mx0c7;
  wire COMP_LOOP_1_acc_8_itm_mx0c10;
  wire COMP_LOOP_1_acc_8_itm_mx0c13;
  wire COMP_LOOP_1_acc_8_itm_mx0c16;
  wire COMP_LOOP_1_acc_8_itm_mx0c19;
  wire COMP_LOOP_1_acc_8_itm_mx0c22;
  wire COMP_LOOP_1_acc_8_itm_mx0c25;
  wire [63:0] COMP_LOOP_tmp_mux1h_itm_mx0w0;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_35;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_37;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_39;
  wire COMP_LOOP_tmp_or_15_ssc;
  wire or_584_cse;
  wire nor_230_cse;
  wire COMP_LOOP_tmp_or_7_cse;
  wire nor_226_cse;
  wire nor_225_cse;
  wire nor_220_cse;
  wire COMP_LOOP_tmp_or_16_cse;
  wire nor_209_cse;
  wire nor_205_cse;
  wire nor_204_cse;
  wire and_235_cse;
  wire and_230_cse;
  wire COMP_LOOP_or_14_cse;
  wire and_459_cse;
  wire and_437_cse;
  wire and_441_cse;
  wire and_443_cse;
  wire and_446_cse;
  wire and_452_cse;
  wire and_455_cse;
  wire and_532_cse;
  wire COMP_LOOP_tmp_nor_24_itm;
  wire COMP_LOOP_tmp_or_31_itm;
  wire COMP_LOOP_tmp_nor_25_itm;
  wire COMP_LOOP_tmp_or_35_itm;
  wire COMP_LOOP_tmp_or_37_itm;
  wire COMP_LOOP_or_9_itm;
  wire [9:0] COMP_LOOP_1_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_2_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_4_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_5_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_6_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_7_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_8_acc_10_itm_10_1_1;
  wire [63:0] COMP_LOOP_mux_95_cse;

  wire[0:0] nor_nl;
  wire[0:0] and_531_nl;
  wire[0:0] mux_495_nl;
  wire[0:0] mux_494_nl;
  wire[0:0] mux_493_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] mux_491_nl;
  wire[0:0] mux_490_nl;
  wire[0:0] mux_487_nl;
  wire[0:0] mux_484_nl;
  wire[0:0] VEC_LOOP_j_not_1_nl;
  wire[0:0] nor_194_nl;
  wire[0:0] and_264_nl;
  wire[0:0] nand_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] nor_438_nl;
  wire[0:0] and_262_nl;
  wire[0:0] or_743_nl;
  wire[0:0] mux_632_nl;
  wire[0:0] or_742_nl;
  wire[0:0] nand_155_nl;
  wire[0:0] mux_631_nl;
  wire[0:0] mux_nl;
  wire[0:0] nand_154_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] or_671_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nor_1_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nor_9_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_11_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_65_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_12_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_67_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_13_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_68_nl;
  wire[0:0] and_140_nl;
  wire[0:0] mux_536_nl;
  wire[0:0] mux_540_nl;
  wire[0:0] mux_539_nl;
  wire[0:0] mux_541_nl;
  wire[0:0] nand_151_nl;
  wire[0:0] mux_542_nl;
  wire[0:0] nand_35_nl;
  wire[10:0] COMP_LOOP_3_acc_nl;
  wire[11:0] nl_COMP_LOOP_3_acc_nl;
  wire[10:0] COMP_LOOP_3_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_3_acc_10_nl;
  wire[0:0] mux_545_nl;
  wire[0:0] mux_544_nl;
  wire[0:0] mux_543_nl;
  wire[8:0] COMP_LOOP_acc_12_nl;
  wire[9:0] nl_COMP_LOOP_acc_12_nl;
  wire[0:0] mux_547_nl;
  wire[0:0] mux_546_nl;
  wire[0:0] mux_548_nl;
  wire[10:0] COMP_LOOP_5_acc_nl;
  wire[11:0] nl_COMP_LOOP_5_acc_nl;
  wire[0:0] mux_549_nl;
  wire[0:0] nand_34_nl;
  wire[0:0] mux_552_nl;
  wire[0:0] mux_554_nl;
  wire[10:0] COMP_LOOP_6_acc_nl;
  wire[11:0] nl_COMP_LOOP_6_acc_nl;
  wire[0:0] mux_557_nl;
  wire[0:0] mux_556_nl;
  wire[0:0] and_155_nl;
  wire[0:0] mux_559_nl;
  wire[10:0] COMP_LOOP_7_acc_nl;
  wire[11:0] nl_COMP_LOOP_7_acc_nl;
  wire[0:0] and_156_nl;
  wire[0:0] mux_566_nl;
  wire[0:0] mux_569_nl;
  wire[7:0] COMP_LOOP_acc_15_nl;
  wire[8:0] nl_COMP_LOOP_acc_15_nl;
  wire[0:0] nor_459_nl;
  wire[0:0] and_158_nl;
  wire[0:0] and_215_nl;
  wire[10:0] COMP_LOOP_1_acc_nl;
  wire[11:0] nl_COMP_LOOP_1_acc_nl;
  wire[0:0] and_159_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_9_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_69_nl;
  wire[63:0] COMP_LOOP_acc_17_nl;
  wire[64:0] nl_COMP_LOOP_acc_17_nl;
  wire[63:0] COMP_LOOP_COMP_LOOP_mux_8_nl;
  wire[0:0] COMP_LOOP_or_nl;
  wire[0:0] COMP_LOOP_or_1_nl;
  wire[0:0] COMP_LOOP_or_2_nl;
  wire[0:0] COMP_LOOP_or_3_nl;
  wire[0:0] COMP_LOOP_or_4_nl;
  wire[0:0] COMP_LOOP_or_5_nl;
  wire[0:0] COMP_LOOP_or_6_nl;
  wire[0:0] COMP_LOOP_or_7_nl;
  wire[0:0] COMP_LOOP_or_12_nl;
  wire[0:0] COMP_LOOP_or_13_nl;
  wire[0:0] mux_608_nl;
  wire[0:0] nor_477_nl;
  wire[0:0] and_184_nl;
  wire[0:0] and_187_nl;
  wire[0:0] and_190_nl;
  wire[0:0] and_193_nl;
  wire[0:0] mux_614_nl;
  wire[0:0] mux_613_nl;
  wire[0:0] mux_612_nl;
  wire[0:0] mux_611_nl;
  wire[0:0] mux_610_nl;
  wire[0:0] mux_609_nl;
  wire[0:0] mux_617_nl;
  wire[0:0] mux_616_nl;
  wire[0:0] mux_615_nl;
  wire[0:0] and_210_nl;
  wire[0:0] and_202_nl;
  wire[0:0] mux_619_nl;
  wire[0:0] mux_618_nl;
  wire[0:0] or_734_nl;
  wire[0:0] COMP_LOOP_tmp_and_11_nl;
  wire[0:0] COMP_LOOP_tmp_and_12_nl;
  wire[0:0] COMP_LOOP_tmp_and_13_nl;
  wire[0:0] COMP_LOOP_tmp_and_14_nl;
  wire[0:0] COMP_LOOP_tmp_and_15_nl;
  wire[0:0] COMP_LOOP_tmp_and_16_nl;
  wire[0:0] COMP_LOOP_tmp_and_17_nl;
  wire[0:0] mux_623_nl;
  wire[0:0] or_725_nl;
  wire[0:0] mux_622_nl;
  wire[0:0] nand_31_nl;
  wire[0:0] mux_621_nl;
  wire[0:0] COMP_LOOP_tmp_and_18_nl;
  wire[0:0] COMP_LOOP_tmp_and_19_nl;
  wire[0:0] COMP_LOOP_tmp_and_5_nl;
  wire[0:0] COMP_LOOP_tmp_and_6_nl;
  wire[0:0] COMP_LOOP_tmp_and_7_nl;
  wire[0:0] COMP_LOOP_tmp_and_8_nl;
  wire[0:0] COMP_LOOP_tmp_and_9_nl;
  wire[0:0] COMP_LOOP_tmp_and_10_nl;
  wire[0:0] mux_626_nl;
  wire[0:0] mux_625_nl;
  wire[0:0] mux_624_nl;
  wire[0:0] nand_30_nl;
  wire[0:0] COMP_LOOP_tmp_and_nl;
  wire[0:0] COMP_LOOP_tmp_and_2_nl;
  wire[0:0] COMP_LOOP_tmp_and_3_nl;
  wire[0:0] mux_630_nl;
  wire[0:0] mux_629_nl;
  wire[0:0] mux_628_nl;
  wire[0:0] mux_627_nl;
  wire[10:0] COMP_LOOP_1_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_1_acc_10_nl;
  wire[10:0] COMP_LOOP_2_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_2_acc_10_nl;
  wire[10:0] COMP_LOOP_4_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_4_acc_10_nl;
  wire[10:0] COMP_LOOP_5_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_5_acc_10_nl;
  wire[10:0] COMP_LOOP_6_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_6_acc_10_nl;
  wire[10:0] COMP_LOOP_7_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_7_acc_10_nl;
  wire[10:0] COMP_LOOP_8_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_8_acc_10_nl;
  wire[0:0] nand_144_nl;
  wire[0:0] or_134_nl;
  wire[0:0] mux_485_nl;
  wire[0:0] nand_38_nl;
  wire[0:0] or_636_nl;
  wire[0:0] or_637_nl;
  wire[0:0] or_640_nl;
  wire[0:0] or_638_nl;
  wire[0:0] nor_197_nl;
  wire[0:0] or_650_nl;
  wire[0:0] nand_152_nl;
  wire[0:0] or_653_nl;
  wire[0:0] mux_528_nl;
  wire[0:0] mux_551_nl;
  wire[0:0] mux_550_nl;
  wire[0:0] and_152_nl;
  wire[0:0] mux_563_nl;
  wire[0:0] mux_562_nl;
  wire[0:0] mux_572_nl;
  wire[0:0] mux_571_nl;
  wire[0:0] and_157_nl;
  wire[0:0] mux_574_nl;
  wire[0:0] mux_579_nl;
  wire[0:0] mux_584_nl;
  wire[0:0] nor_504_nl;
  wire[0:0] nor_505_nl;
  wire[0:0] or_699_nl;
  wire[0:0] nor_192_nl;
  wire[0:0] mux_588_nl;
  wire[0:0] nand_27_nl;
  wire[0:0] and_214_nl;
  wire[0:0] mux_587_nl;
  wire[0:0] nand_25_nl;
  wire[0:0] mux_585_nl;
  wire[0:0] or_696_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] or_137_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] nand_143_nl;
  wire[0:0] or_136_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] or_135_nl;
  wire[0:0] and_54_nl;
  wire[0:0] and_59_nl;
  wire[0:0] and_62_nl;
  wire[0:0] and_65_nl;
  wire[0:0] and_72_nl;
  wire[0:0] and_75_nl;
  wire[0:0] and_80_nl;
  wire[0:0] and_83_nl;
  wire[0:0] and_84_nl;
  wire[0:0] and_85_nl;
  wire[0:0] and_86_nl;
  wire[0:0] and_87_nl;
  wire[0:0] and_88_nl;
  wire[0:0] and_89_nl;
  wire[0:0] and_90_nl;
  wire[0:0] and_92_nl;
  wire[0:0] and_93_nl;
  wire[0:0] and_95_nl;
  wire[0:0] and_97_nl;
  wire[0:0] and_98_nl;
  wire[0:0] and_99_nl;
  wire[0:0] and_100_nl;
  wire[0:0] and_101_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] and_259_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] nor_423_nl;
  wire[0:0] mux_219_nl;
  wire[0:0] nor_424_nl;
  wire[0:0] nor_425_nl;
  wire[0:0] mux_218_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] nor_426_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] nor_427_nl;
  wire[0:0] nor_428_nl;
  wire[0:0] nor_429_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] nor_430_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] nor_431_nl;
  wire[0:0] nor_432_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] nor_433_nl;
  wire[0:0] nor_434_nl;
  wire[0:0] nor_435_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] or_145_nl;
  wire[0:0] or_143_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] or_141_nl;
  wire[0:0] or_139_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] mux_235_nl;
  wire[0:0] and_258_nl;
  wire[0:0] mux_234_nl;
  wire[0:0] nor_410_nl;
  wire[0:0] nor_411_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] nor_412_nl;
  wire[0:0] nor_413_nl;
  wire[0:0] mux_232_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] nor_414_nl;
  wire[0:0] nor_415_nl;
  wire[0:0] nor_416_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] or_187_nl;
  wire[0:0] or_185_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] nor_417_nl;
  wire[0:0] nor_418_nl;
  wire[0:0] nor_419_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] nor_420_nl;
  wire[0:0] nor_421_nl;
  wire[0:0] nor_422_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] or_174_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] or_173_nl;
  wire[0:0] or_171_nl;
  wire[0:0] mux_251_nl;
  wire[0:0] and_257_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] nor_397_nl;
  wire[0:0] mux_249_nl;
  wire[0:0] nor_398_nl;
  wire[0:0] nor_399_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] mux_247_nl;
  wire[0:0] nor_400_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] nor_401_nl;
  wire[0:0] nor_402_nl;
  wire[0:0] nor_403_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] nor_404_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] nor_405_nl;
  wire[0:0] nor_406_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] nor_407_nl;
  wire[0:0] nor_408_nl;
  wire[0:0] nor_409_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] or_204_nl;
  wire[0:0] or_202_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] or_200_nl;
  wire[0:0] or_198_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] mux_265_nl;
  wire[0:0] and_256_nl;
  wire[0:0] mux_264_nl;
  wire[0:0] nor_384_nl;
  wire[0:0] nor_385_nl;
  wire[0:0] mux_263_nl;
  wire[0:0] nor_386_nl;
  wire[0:0] nor_387_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] nor_388_nl;
  wire[0:0] nor_389_nl;
  wire[0:0] nor_390_nl;
  wire[0:0] mux_259_nl;
  wire[0:0] nor_391_nl;
  wire[0:0] nor_392_nl;
  wire[0:0] mux_258_nl;
  wire[0:0] mux_257_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] nor_393_nl;
  wire[0:0] nor_394_nl;
  wire[0:0] nor_395_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] or_238_nl;
  wire[0:0] or_236_nl;
  wire[0:0] nor_396_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] or_233_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] or_232_nl;
  wire[0:0] or_230_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] and_255_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] nor_371_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] nor_372_nl;
  wire[0:0] nor_373_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] nor_374_nl;
  wire[0:0] mux_276_nl;
  wire[0:0] nor_375_nl;
  wire[0:0] nor_376_nl;
  wire[0:0] nor_377_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] nor_378_nl;
  wire[0:0] mux_273_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] nor_379_nl;
  wire[0:0] nor_380_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] nor_381_nl;
  wire[0:0] nor_382_nl;
  wire[0:0] nor_383_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] mux_269_nl;
  wire[0:0] or_263_nl;
  wire[0:0] or_261_nl;
  wire[0:0] mux_268_nl;
  wire[0:0] or_259_nl;
  wire[0:0] or_257_nl;
  wire[0:0] mux_296_nl;
  wire[0:0] mux_295_nl;
  wire[0:0] and_254_nl;
  wire[0:0] mux_294_nl;
  wire[0:0] nor_358_nl;
  wire[0:0] nor_359_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] nor_360_nl;
  wire[0:0] nor_361_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] nor_362_nl;
  wire[0:0] nor_363_nl;
  wire[0:0] nor_364_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] or_305_nl;
  wire[0:0] or_303_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] mux_288_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] nor_365_nl;
  wire[0:0] nor_366_nl;
  wire[0:0] nor_367_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] nor_368_nl;
  wire[0:0] nor_369_nl;
  wire[0:0] nor_370_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] or_292_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] or_291_nl;
  wire[0:0] or_289_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] mux_310_nl;
  wire[0:0] nor_345_nl;
  wire[0:0] mux_309_nl;
  wire[0:0] nor_346_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] nor_347_nl;
  wire[0:0] nor_348_nl;
  wire[0:0] and_253_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] nor_349_nl;
  wire[0:0] nor_350_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] nor_351_nl;
  wire[0:0] nor_352_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] nor_353_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] nor_354_nl;
  wire[0:0] nor_355_nl;
  wire[0:0] nor_356_nl;
  wire[0:0] nor_357_nl;
  wire[0:0] mux_300_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] or_321_nl;
  wire[0:0] or_320_nl;
  wire[0:0] mux_298_nl;
  wire[0:0] or_318_nl;
  wire[0:0] or_316_nl;
  wire[0:0] mux_326_nl;
  wire[0:0] mux_325_nl;
  wire[0:0] and_252_nl;
  wire[0:0] mux_324_nl;
  wire[0:0] nor_332_nl;
  wire[0:0] nor_333_nl;
  wire[0:0] mux_323_nl;
  wire[0:0] nor_334_nl;
  wire[0:0] nor_335_nl;
  wire[0:0] mux_322_nl;
  wire[0:0] mux_321_nl;
  wire[0:0] mux_320_nl;
  wire[0:0] nor_336_nl;
  wire[0:0] nor_337_nl;
  wire[0:0] nor_338_nl;
  wire[0:0] mux_319_nl;
  wire[0:0] nor_339_nl;
  wire[0:0] nor_340_nl;
  wire[0:0] mux_318_nl;
  wire[0:0] mux_317_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] nor_341_nl;
  wire[0:0] nor_342_nl;
  wire[0:0] nor_343_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] or_351_nl;
  wire[0:0] or_349_nl;
  wire[0:0] nor_344_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] or_347_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] or_346_nl;
  wire[0:0] or_344_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] and_251_nl;
  wire[0:0] mux_340_nl;
  wire[0:0] nor_319_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] nor_320_nl;
  wire[0:0] nor_321_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] nor_322_nl;
  wire[0:0] mux_336_nl;
  wire[0:0] nor_323_nl;
  wire[0:0] nor_324_nl;
  wire[0:0] nor_325_nl;
  wire[0:0] mux_335_nl;
  wire[0:0] mux_334_nl;
  wire[0:0] nor_326_nl;
  wire[0:0] mux_333_nl;
  wire[0:0] mux_332_nl;
  wire[0:0] nor_327_nl;
  wire[0:0] nor_328_nl;
  wire[0:0] mux_331_nl;
  wire[0:0] nor_329_nl;
  wire[0:0] nor_330_nl;
  wire[0:0] nor_331_nl;
  wire[0:0] mux_330_nl;
  wire[0:0] mux_329_nl;
  wire[0:0] or_376_nl;
  wire[0:0] or_374_nl;
  wire[0:0] mux_328_nl;
  wire[0:0] or_372_nl;
  wire[0:0] or_370_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] and_250_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] nor_306_nl;
  wire[0:0] nor_307_nl;
  wire[0:0] mux_353_nl;
  wire[0:0] nor_308_nl;
  wire[0:0] nor_309_nl;
  wire[0:0] mux_352_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] nor_310_nl;
  wire[0:0] nor_311_nl;
  wire[0:0] nor_312_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] or_418_nl;
  wire[0:0] or_416_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] nor_313_nl;
  wire[0:0] nor_314_nl;
  wire[0:0] nor_315_nl;
  wire[0:0] mux_345_nl;
  wire[0:0] nor_316_nl;
  wire[0:0] nor_317_nl;
  wire[0:0] nor_318_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] or_405_nl;
  wire[0:0] mux_343_nl;
  wire[0:0] or_404_nl;
  wire[0:0] or_402_nl;
  wire[0:0] mux_371_nl;
  wire[0:0] and_249_nl;
  wire[0:0] mux_370_nl;
  wire[0:0] nor_293_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] nor_294_nl;
  wire[0:0] nor_295_nl;
  wire[0:0] mux_368_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] nor_296_nl;
  wire[0:0] mux_366_nl;
  wire[0:0] nor_297_nl;
  wire[0:0] nor_298_nl;
  wire[0:0] nor_299_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] nor_300_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] nor_301_nl;
  wire[0:0] nor_302_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] nor_303_nl;
  wire[0:0] nor_304_nl;
  wire[0:0] nor_305_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] or_434_nl;
  wire[0:0] or_433_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] or_431_nl;
  wire[0:0] or_429_nl;
  wire[0:0] mux_386_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] and_248_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] nor_280_nl;
  wire[0:0] nor_281_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] nor_282_nl;
  wire[0:0] nor_283_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] nor_284_nl;
  wire[0:0] nor_285_nl;
  wire[0:0] nor_286_nl;
  wire[0:0] mux_379_nl;
  wire[0:0] nor_287_nl;
  wire[0:0] nor_288_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] nor_289_nl;
  wire[0:0] nor_290_nl;
  wire[0:0] nor_291_nl;
  wire[0:0] mux_375_nl;
  wire[0:0] or_467_nl;
  wire[0:0] or_465_nl;
  wire[0:0] nor_292_nl;
  wire[0:0] mux_374_nl;
  wire[0:0] or_462_nl;
  wire[0:0] mux_373_nl;
  wire[0:0] or_461_nl;
  wire[0:0] or_459_nl;
  wire[0:0] mux_401_nl;
  wire[0:0] and_247_nl;
  wire[0:0] mux_400_nl;
  wire[0:0] nor_267_nl;
  wire[0:0] mux_399_nl;
  wire[0:0] nor_268_nl;
  wire[0:0] nor_269_nl;
  wire[0:0] mux_398_nl;
  wire[0:0] mux_397_nl;
  wire[0:0] nor_270_nl;
  wire[0:0] mux_396_nl;
  wire[0:0] nor_271_nl;
  wire[0:0] nor_272_nl;
  wire[0:0] nor_273_nl;
  wire[0:0] mux_395_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] nor_274_nl;
  wire[0:0] mux_393_nl;
  wire[0:0] mux_392_nl;
  wire[0:0] nor_275_nl;
  wire[0:0] nor_276_nl;
  wire[0:0] mux_391_nl;
  wire[0:0] nor_277_nl;
  wire[0:0] nor_278_nl;
  wire[0:0] nor_279_nl;
  wire[0:0] mux_390_nl;
  wire[0:0] mux_389_nl;
  wire[0:0] or_492_nl;
  wire[0:0] or_490_nl;
  wire[0:0] mux_388_nl;
  wire[0:0] or_488_nl;
  wire[0:0] or_486_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] and_246_nl;
  wire[0:0] mux_414_nl;
  wire[0:0] nor_254_nl;
  wire[0:0] nor_255_nl;
  wire[0:0] mux_413_nl;
  wire[0:0] nor_256_nl;
  wire[0:0] nor_257_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] mux_411_nl;
  wire[0:0] nor_258_nl;
  wire[0:0] nor_259_nl;
  wire[0:0] nor_260_nl;
  wire[0:0] mux_410_nl;
  wire[0:0] or_531_nl;
  wire[0:0] or_529_nl;
  wire[0:0] mux_409_nl;
  wire[0:0] mux_408_nl;
  wire[0:0] mux_407_nl;
  wire[0:0] mux_406_nl;
  wire[0:0] nor_261_nl;
  wire[0:0] nor_262_nl;
  wire[0:0] nor_263_nl;
  wire[0:0] mux_405_nl;
  wire[0:0] nor_264_nl;
  wire[0:0] nor_265_nl;
  wire[0:0] nor_266_nl;
  wire[0:0] mux_404_nl;
  wire[0:0] or_518_nl;
  wire[0:0] mux_403_nl;
  wire[0:0] or_517_nl;
  wire[0:0] or_515_nl;
  wire[0:0] mux_431_nl;
  wire[0:0] mux_430_nl;
  wire[0:0] nor_247_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] and_239_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] and_240_nl;
  wire[0:0] nor_248_nl;
  wire[0:0] and_241_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] mux_426_nl;
  wire[0:0] and_242_nl;
  wire[0:0] nor_249_nl;
  wire[0:0] mux_425_nl;
  wire[0:0] and_243_nl;
  wire[0:0] nor_250_nl;
  wire[0:0] mux_424_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] and_244_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] and_245_nl;
  wire[0:0] nor_251_nl;
  wire[0:0] nor_252_nl;
  wire[0:0] nor_253_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] nand_58_nl;
  wire[0:0] or_544_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] nand_60_nl;
  wire[0:0] or_542_nl;
  wire[0:0] mux_446_nl;
  wire[0:0] mux_445_nl;
  wire[0:0] and_237_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] nor_233_nl;
  wire[0:0] nor_234_nl;
  wire[0:0] mux_443_nl;
  wire[0:0] mux_442_nl;
  wire[0:0] nor_235_nl;
  wire[0:0] nor_236_nl;
  wire[0:0] nor_237_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] mux_440_nl;
  wire[0:0] nor_238_nl;
  wire[0:0] nor_239_nl;
  wire[0:0] mux_439_nl;
  wire[0:0] nor_240_nl;
  wire[0:0] nor_241_nl;
  wire[0:0] mux_438_nl;
  wire[0:0] mux_437_nl;
  wire[0:0] mux_436_nl;
  wire[0:0] nor_242_nl;
  wire[0:0] nor_243_nl;
  wire[0:0] mux_435_nl;
  wire[0:0] nor_244_nl;
  wire[0:0] mux_434_nl;
  wire[0:0] nor_245_nl;
  wire[0:0] and_238_nl;
  wire[0:0] nor_246_nl;
  wire[0:0] mux_433_nl;
  wire[0:0] or_728_nl;
  wire[0:0] nand_51_nl;
  wire[6:0] COMP_LOOP_1_tmp_mul_nl;
  wire[13:0] nl_COMP_LOOP_1_tmp_mul_nl;
  wire[0:0] mux_454_nl;
  wire[0:0] mux_453_nl;
  wire[0:0] mux_452_nl;
  wire[0:0] or_588_nl;
  wire[0:0] or_586_nl;
  wire[0:0] mux_451_nl;
  wire[0:0] mux_450_nl;
  wire[0:0] mux_449_nl;
  wire[0:0] or_583_nl;
  wire[0:0] mux_448_nl;
  wire[0:0] or_581_nl;
  wire[0:0] or_580_nl;
  wire[0:0] mux_457_nl;
  wire[0:0] mux_456_nl;
  wire[0:0] nor_229_nl;
  wire[0:0] mux_455_nl;
  wire[0:0] nor_232_nl;
  wire[0:0] mux_462_nl;
  wire[0:0] mux_461_nl;
  wire[0:0] nor_223_nl;
  wire[0:0] nor_224_nl;
  wire[0:0] mux_460_nl;
  wire[0:0] mux_459_nl;
  wire[0:0] mux_458_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] mux_464_nl;
  wire[0:0] nor_219_nl;
  wire[0:0] mux_463_nl;
  wire[0:0] nor_222_nl;
  wire[0:0] mux_471_nl;
  wire[0:0] mux_470_nl;
  wire[0:0] mux_469_nl;
  wire[0:0] nor_212_nl;
  wire[0:0] nor_213_nl;
  wire[0:0] nor_214_nl;
  wire[0:0] mux_468_nl;
  wire[0:0] mux_467_nl;
  wire[0:0] nor_215_nl;
  wire[0:0] nor_216_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] nor_217_nl;
  wire[0:0] nor_218_nl;
  wire[0:0] mux_474_nl;
  wire[0:0] mux_473_nl;
  wire[0:0] nor_208_nl;
  wire[0:0] mux_472_nl;
  wire[0:0] nor_211_nl;
  wire[0:0] mux_479_nl;
  wire[0:0] mux_478_nl;
  wire[0:0] nor_202_nl;
  wire[0:0] nor_203_nl;
  wire[0:0] mux_477_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] mux_475_nl;
  wire[0:0] mux_482_nl;
  wire[0:0] mux_481_nl;
  wire[0:0] and_nl;
  wire[0:0] mux_480_nl;
  wire[0:0] nor_201_nl;
  wire[6:0] COMP_LOOP_mux_92_nl;
  wire[0:0] and_533_nl;
  wire[11:0] acc_1_nl;
  wire[12:0] nl_acc_1_nl;
  wire[10:0] COMP_LOOP_mux_93_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nand_1_nl;
  wire[9:0] COMP_LOOP_mux_94_nl;
  wire[53:0] COMP_LOOP_tmp_and_28_nl;
  wire[53:0] COMP_LOOP_tmp_mux1h_52_nl;
  wire[0:0] COMP_LOOP_tmp_and_29_nl;
  wire[0:0] COMP_LOOP_tmp_mux1h_53_nl;
  wire[8:0] COMP_LOOP_tmp_mux1h_54_nl;
  wire[0:0] COMP_LOOP_tmp_or_40_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_93_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_94_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_95_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_96_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_97_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_98_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_99_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_100_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_101_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_102_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_103_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_104_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_105_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_106_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_107_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_108_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_109_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_110_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_111_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_112_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_113_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_114_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_115_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_116_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_117_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_118_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_119_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_120_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_121_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_122_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_123_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_124_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_125_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_126_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_127_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_128_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_129_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_130_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_131_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_132_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_133_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_134_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_135_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_136_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_137_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_138_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_139_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_140_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_141_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_142_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_143_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_144_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_145_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_146_nl;
  wire[0:0] COMP_LOOP_tmp_and_30_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_mux_12_nl;
  wire[5:0] COMP_LOOP_tmp_mux1h_55_nl;
  wire[0:0] COMP_LOOP_tmp_or_41_nl;
  wire[0:0] COMP_LOOP_tmp_mux1h_56_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_or_3_nl;
  wire[0:0] COMP_LOOP_tmp_mux_8_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_or_4_nl;
  wire[3:0] STAGE_LOOP_mux_4_nl;
  wire[0:0] COMP_LOOP_mux1h_178_nl;
  wire[0:0] COMP_LOOP_mux1h_179_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_210_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_211_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_212_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_213_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_214_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_215_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_216_nl;
  wire[0:0] COMP_LOOP_mux1h_180_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_217_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_218_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_219_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_220_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_221_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_222_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_223_nl;
  wire[0:0] COMP_LOOP_mux1h_181_nl;
  wire[0:0] COMP_LOOP_mux1h_182_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_224_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_225_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_226_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_227_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_228_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_229_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_230_nl;
  wire[0:0] COMP_LOOP_mux1h_183_nl;
  wire[0:0] COMP_LOOP_mux1h_184_nl;
  wire[0:0] COMP_LOOP_mux1h_185_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[64:0] acc_4_nl;
  wire[65:0] nl_acc_4_nl;
  wire[63:0] COMP_LOOP_COMP_LOOP_mux_9_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] mux_504_nl;
  wire[0:0] or_641_nl;
  wire[0:0] mux_503_nl;
  wire[0:0] nand_21_nl;
  wire[0:0] mux_502_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] mux_499_nl;
  wire[0:0] nand_19_nl;
  wire [63:0] nl_COMP_LOOP_1_modulo_cmp_base_rsc_dat;
  assign COMP_LOOP_COMP_LOOP_mux_9_nl = MUX_v_64_2_2((~ COMP_LOOP_1_acc_8_itm), (~
      z_out_8), COMP_LOOP_or_9_itm);
  assign nl_acc_4_nl = ({COMP_LOOP_mux_95_cse , 1'b1}) + ({COMP_LOOP_COMP_LOOP_mux_9_nl
      , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[64:0];
  assign nand_21_nl = ~((fsm_output[1]) & (fsm_output[6]) & (~ mux_tmp_489));
  assign mux_503_nl = MUX_s_1_2_2(nand_21_nl, mux_tmp_487, fsm_output[4]);
  assign or_641_nl = (fsm_output[3]) | mux_503_nl;
  assign mux_504_nl = MUX_s_1_2_2(or_641_nl, mux_tmp_490, fsm_output[7]);
  assign nand_19_nl = ~((fsm_output[1]) & (~ mux_tmp_486));
  assign mux_499_nl = MUX_s_1_2_2(mux_tmp_487, nand_19_nl, fsm_output[4]);
  assign nand_20_nl = ~((fsm_output[3]) & (~ mux_499_nl));
  assign mux_502_nl = MUX_s_1_2_2(mux_tmp_490, nand_20_nl, fsm_output[7]);
  assign mux_505_nl = MUX_s_1_2_2(mux_504_nl, mux_502_nl, fsm_output[2]);
  assign nl_COMP_LOOP_1_modulo_cmp_base_rsc_dat = MUX_v_64_2_2(COMP_LOOP_1_acc_8_itm,
      (readslicef_65_64_1(acc_4_nl)), mux_505_nl);
  wire [63:0] nl_COMP_LOOP_1_modulo_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_cmp_m_rsc_dat = p_sva;
  wire[0:0] mux_521_nl;
  wire[0:0] mux_520_nl;
  wire[0:0] mux_519_nl;
  wire[0:0] mux_518_nl;
  wire[0:0] mux_517_nl;
  wire[0:0] or_655_nl;
  wire[0:0] mux_516_nl;
  wire[0:0] mux_515_nl;
  wire[0:0] or_651_nl;
  wire[0:0] mux_513_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] nor_196_nl;
  wire[0:0] or_645_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] mux_507_nl;
  wire[0:0] or_644_nl;
  wire[0:0] or_643_nl;
  wire [0:0] nl_COMP_LOOP_1_modulo_cmp_ccs_ccore_start_rsc_dat;
  assign or_655_nl = (~ (fsm_output[1])) | (~ (fsm_output[4])) | (fsm_output[3]);
  assign mux_517_nl = MUX_s_1_2_2(or_655_nl, mux_tmp_503, fsm_output[6]);
  assign mux_518_nl = MUX_s_1_2_2(mux_517_nl, or_tmp_610, fsm_output[5]);
  assign or_651_nl = (fsm_output[1]) | (fsm_output[4]) | (fsm_output[3]);
  assign mux_515_nl = MUX_s_1_2_2(mux_tmp_503, or_651_nl, fsm_output[6]);
  assign mux_516_nl = MUX_s_1_2_2(or_tmp_610, mux_515_nl, fsm_output[5]);
  assign mux_519_nl = MUX_s_1_2_2(mux_518_nl, mux_516_nl, fsm_output[0]);
  assign mux_520_nl = MUX_s_1_2_2(mux_519_nl, mux_tmp_501, fsm_output[7]);
  assign nor_196_nl = ~((~ (fsm_output[1])) | (fsm_output[4]) | (~ (fsm_output[3])));
  assign mux_509_nl = MUX_s_1_2_2(nor_196_nl, mux_tmp_495, fsm_output[6]);
  assign or_645_nl = (fsm_output[6]) | not_tmp_290;
  assign mux_510_nl = MUX_s_1_2_2((~ mux_509_nl), or_645_nl, fsm_output[5]);
  assign or_644_nl = (fsm_output[1]) | (~ and_532_cse);
  assign mux_507_nl = MUX_s_1_2_2(not_tmp_290, or_644_nl, fsm_output[6]);
  assign or_643_nl = (fsm_output[6]) | (~ mux_tmp_495);
  assign mux_508_nl = MUX_s_1_2_2(mux_507_nl, or_643_nl, fsm_output[5]);
  assign mux_511_nl = MUX_s_1_2_2(mux_510_nl, mux_508_nl, fsm_output[0]);
  assign mux_513_nl = MUX_s_1_2_2(mux_tmp_501, mux_511_nl, fsm_output[7]);
  assign mux_521_nl = MUX_s_1_2_2(mux_520_nl, mux_513_nl, fsm_output[2]);
  assign nl_COMP_LOOP_1_modulo_cmp_ccs_ccore_start_rsc_dat = ~ mux_521_nl;
  wire[0:0] and_321_nl;
  wire [3:0] nl_COMP_LOOP_5_tmp_lshift_rg_s;
  assign and_321_nl = (fsm_output==8'b00000010);
  assign nl_COMP_LOOP_5_tmp_lshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, z_out_5,
      and_321_nl);
  wire[0:0] and_336_nl;
  wire [3:0] nl_COMP_LOOP_1_tmp_lshift_rg_s;
  assign and_336_nl = (fsm_output==8'b00000010);
  assign nl_COMP_LOOP_1_tmp_lshift_rg_s = MUX_v_4_2_2(COMP_LOOP_1_tmp_acc_cse_sva,
      z_out_5, and_336_nl);
  wire [0:0] nl_inPlaceNTT_DIF_core_wait_dp_inst_ensig_cgo_iro;
  assign nl_inPlaceNTT_DIF_core_wait_dp_inst_ensig_cgo_iro = ~ mux_496_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_31_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_31_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_62_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_62_tr0 = ~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_93_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_93_tr0 = ~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_124_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_124_tr0 = ~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_155_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_155_tr0 = ~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_186_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_186_tr0 = ~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_217_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_217_tr0 = ~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_248_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_248_tr0 = ~ COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = z_out_3[10];
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = ~ (z_out_2[4]);
  ccs_in_v1 #(.rscid(32'sd5),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_7_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(vec_rsc_triosy_0_7_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_6_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(vec_rsc_triosy_0_6_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_5_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(vec_rsc_triosy_0_5_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_4_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(vec_rsc_triosy_0_4_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_3_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(vec_rsc_triosy_0_3_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_2_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(vec_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_1_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(vec_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(vec_rsc_triosy_0_0_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(r_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_7_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_7_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_6_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_6_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_5_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_5_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_4_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_4_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_3_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_3_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_2_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_1_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_0_lz)
    );
  modulo  COMP_LOOP_1_modulo_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_cmp_base_rsc_dat[63:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_cmp_m_rsc_dat[63:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_COMP_LOOP_1_modulo_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_cmp_ccs_ccore_en)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd11)) COMP_LOOP_5_tmp_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_5_tmp_lshift_rg_s[3:0]),
      .z(z_out)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd10)) COMP_LOOP_1_tmp_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_1_tmp_lshift_rg_s[3:0]),
      .z(z_out_1)
    );
  inPlaceNTT_DIF_core_wait_dp inPlaceNTT_DIF_core_wait_dp_inst (
      .ensig_cgo_iro(nl_inPlaceNTT_DIF_core_wait_dp_inst_ensig_cgo_iro[0:0]),
      .ensig_cgo(reg_ensig_cgo_cse),
      .COMP_LOOP_1_modulo_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_cmp_ccs_ccore_en)
    );
  inPlaceNTT_DIF_core_core_fsm inPlaceNTT_DIF_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .COMP_LOOP_C_31_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_31_tr0[0:0]),
      .COMP_LOOP_C_62_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_62_tr0[0:0]),
      .COMP_LOOP_C_93_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_93_tr0[0:0]),
      .COMP_LOOP_C_124_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_124_tr0[0:0]),
      .COMP_LOOP_C_155_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_155_tr0[0:0]),
      .COMP_LOOP_C_186_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_186_tr0[0:0]),
      .COMP_LOOP_C_217_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_217_tr0[0:0]),
      .COMP_LOOP_C_248_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_248_tr0[0:0]),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_731_cse = (fsm_output[1:0]!=2'b00);
  assign nand_137_cse = ~((fsm_output[0]) & (fsm_output[2]) & (fsm_output[3]) & (fsm_output[4]));
  assign nand_138_cse = ~((fsm_output[4:3]==2'b11));
  assign nand_126_cse = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[0]) & (fsm_output[4:2]==3'b111));
  assign nand_127_cse = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[0]) & (fsm_output[4:2]==3'b111));
  assign mux_492_nl = MUX_s_1_2_2(and_dcpl_28, and_532_cse, or_735_cse);
  assign mux_493_nl = MUX_s_1_2_2(mux_492_nl, and_283_cse, fsm_output[0]);
  assign mux_494_nl = MUX_s_1_2_2((~ mux_tmp_478), mux_493_nl, fsm_output[5]);
  assign mux_495_nl = MUX_s_1_2_2(mux_141_cse, mux_494_nl, fsm_output[6]);
  assign mux_487_nl = MUX_s_1_2_2(mux_tmp_475, mux_tmp_472, fsm_output[0]);
  assign mux_490_nl = MUX_s_1_2_2(mux_tmp_478, mux_487_nl, fsm_output[5]);
  assign mux_484_nl = MUX_s_1_2_2((~ mux_tmp_472), and_283_cse, fsm_output[5]);
  assign mux_491_nl = MUX_s_1_2_2((~ mux_490_nl), mux_484_nl, fsm_output[6]);
  assign mux_496_itm = MUX_s_1_2_2(mux_495_nl, mux_491_nl, fsm_output[1]);
  assign and_263_cse = (fsm_output[1:0]==2'b11);
  assign nor_441_cse = ~((fsm_output[7:6]!=2'b00));
  assign and_532_cse = (fsm_output[4:3]==2'b11);
  assign mux_530_nl = MUX_s_1_2_2((~ or_tmp_617), or_tmp_617, fsm_output[6]);
  assign or_671_nl = (fsm_output[6]) | (~ or_tmp_617);
  assign mux_531_nl = MUX_s_1_2_2(mux_530_nl, or_671_nl, fsm_output[1]);
  assign mux_532_nl = MUX_s_1_2_2(mux_531_nl, (fsm_output[6]), fsm_output[5]);
  assign COMP_LOOP_or_14_cse = mux_532_nl | (fsm_output[7]);
  assign or_735_cse = (fsm_output[2]) | (fsm_output[7]);
  assign and_283_cse = or_735_cse & (fsm_output[4:3]==2'b11);
  assign nor_459_nl = ~((fsm_output[7]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_141_cse = MUX_s_1_2_2(nor_459_nl, nor_tmp_35, fsm_output[2]);
  assign and_280_cse = (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]);
  assign COMP_LOOP_tmp_or_2_cse = and_dcpl_42 | and_dcpl_96 | and_dcpl_97 | and_dcpl_101;
  assign COMP_LOOP_tmp_or_7_cse = and_dcpl_95 | and_dcpl_98;
  assign nor_474_cse = ~((fsm_output[2]) | (fsm_output[6]));
  assign and_203_m1c = and_dcpl_100 & and_dcpl_38;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_nor_6_cse = ~((COMP_LOOP_3_tmp_lshift_ncse_sva[1:0]!=2'b00));
  assign nl_COMP_LOOP_1_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b000}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_1_acc_10_nl = nl_COMP_LOOP_1_acc_10_nl[10:0];
  assign COMP_LOOP_1_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_1_acc_10_nl);
  assign nl_COMP_LOOP_acc_1_cse_6_sva_1 = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_3_sva_6_0
      , 3'b101});
  assign COMP_LOOP_acc_1_cse_6_sva_1 = nl_COMP_LOOP_acc_1_cse_6_sva_1[9:0];
  assign nl_COMP_LOOP_acc_1_cse_4_sva_1 = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_3_sva_6_0
      , 3'b011});
  assign COMP_LOOP_acc_1_cse_4_sva_1 = nl_COMP_LOOP_acc_1_cse_4_sva_1[9:0];
  assign nl_COMP_LOOP_acc_11_psp_sva_1 = (VEC_LOOP_j_10_0_sva_9_0[9:1]) + ({COMP_LOOP_k_10_3_sva_6_0
      , 2'b01});
  assign COMP_LOOP_acc_11_psp_sva_1 = nl_COMP_LOOP_acc_11_psp_sva_1[8:0];
  assign nl_COMP_LOOP_acc_1_cse_2_sva_1 = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_3_sva_6_0
      , 3'b001});
  assign COMP_LOOP_acc_1_cse_2_sva_1 = nl_COMP_LOOP_acc_1_cse_2_sva_1[9:0];
  assign nl_COMP_LOOP_2_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b001}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_2_acc_10_nl = nl_COMP_LOOP_2_acc_10_nl[10:0];
  assign COMP_LOOP_2_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_2_acc_10_nl);
  assign nl_COMP_LOOP_4_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b011}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_4_acc_10_nl = nl_COMP_LOOP_4_acc_10_nl[10:0];
  assign COMP_LOOP_4_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_4_acc_10_nl);
  assign nl_COMP_LOOP_5_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b100}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_5_acc_10_nl = nl_COMP_LOOP_5_acc_10_nl[10:0];
  assign COMP_LOOP_5_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_5_acc_10_nl);
  assign nl_COMP_LOOP_6_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b101}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_6_acc_10_nl = nl_COMP_LOOP_6_acc_10_nl[10:0];
  assign COMP_LOOP_6_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_6_acc_10_nl);
  assign nl_COMP_LOOP_7_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b110}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_7_acc_10_nl = nl_COMP_LOOP_7_acc_10_nl[10:0];
  assign COMP_LOOP_7_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_7_acc_10_nl);
  assign nl_COMP_LOOP_8_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b111}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_8_acc_10_nl = nl_COMP_LOOP_8_acc_10_nl[10:0];
  assign COMP_LOOP_8_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_8_acc_10_nl);
  assign COMP_LOOP_tmp_mux1h_itm_mx0w0 = MUX1HOT_v_64_8_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_4_i_q_d,
      twiddle_rsc_0_5_i_q_d, twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_7_i_q_d, {COMP_LOOP_tmp_COMP_LOOP_tmp_nor_2_itm
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_35 , COMP_LOOP_tmp_COMP_LOOP_tmp_and_37 ,
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm , COMP_LOOP_tmp_COMP_LOOP_tmp_and_39
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm , COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm});
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_rgt = (COMP_LOOP_2_tmp_lshift_ncse_sva[2:0]==3'b001);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_rgt = (COMP_LOOP_2_tmp_lshift_ncse_sva[2:0]==3'b010);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_rgt = (COMP_LOOP_2_tmp_lshift_ncse_sva[2:0]==3'b100);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_35 = (COMP_LOOP_2_tmp_mul_idiv_sva[2:0]==3'b001);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_37 = (COMP_LOOP_2_tmp_mul_idiv_sva[2:0]==3'b010);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_39 = (COMP_LOOP_2_tmp_mul_idiv_sva[2:0]==3'b100);
  assign or_dcpl = (fsm_output[4:3]!=2'b00);
  assign or_tmp_25 = (fsm_output[6]) | and_532_cse;
  assign or_tmp_38 = (fsm_output[6]) | (fsm_output[4]) | (fsm_output[3]);
  assign nor_tmp_29 = (fsm_output[7:6]==2'b11);
  assign nor_tmp_35 = (fsm_output[7]) & (fsm_output[3]) & (fsm_output[4]);
  assign and_dcpl_24 = ~((fsm_output[7]) | (fsm_output[5]));
  assign and_dcpl_25 = ~((fsm_output[1:0]!=2'b00));
  assign and_dcpl_26 = and_dcpl_25 & and_dcpl_24;
  assign and_dcpl_28 = ~((fsm_output[4:3]!=2'b00));
  assign and_dcpl_29 = and_dcpl_28 & nor_474_cse;
  assign and_dcpl_31 = (fsm_output[7]) & (fsm_output[5]);
  assign and_dcpl_32 = and_dcpl_25 & and_dcpl_31;
  assign and_dcpl_33 = (fsm_output[2]) & (fsm_output[6]);
  assign and_dcpl_35 = and_532_cse & and_dcpl_33;
  assign nor_tmp_64 = or_731_cse & (fsm_output[6]) & (fsm_output[2]) & (fsm_output[3])
      & (fsm_output[4]);
  assign nand_144_nl = ~((fsm_output[7]) & (fsm_output[3]) & (fsm_output[4]));
  assign or_134_nl = (fsm_output[7]) | nand_138_cse;
  assign mux_tmp_192 = MUX_s_1_2_2(nand_144_nl, or_134_nl, fsm_output[2]);
  assign nand_tmp_2 = ~((fsm_output[0]) & (fsm_output[5]) & (~ mux_tmp_192));
  assign and_dcpl_37 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_38 = and_dcpl_37 & and_dcpl_24;
  assign and_dcpl_39 = and_dcpl_29 & and_dcpl_38;
  assign and_dcpl_41 = and_263_cse & and_dcpl_24;
  assign and_dcpl_42 = and_dcpl_29 & and_dcpl_41;
  assign and_dcpl_43 = (~ (fsm_output[7])) & (fsm_output[5]);
  assign and_dcpl_44 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_45 = and_dcpl_44 & and_dcpl_43;
  assign and_dcpl_47 = and_dcpl_37 & and_dcpl_43;
  assign and_dcpl_48 = and_dcpl_29 & and_dcpl_47;
  assign and_dcpl_49 = (~ (fsm_output[2])) & (fsm_output[6]);
  assign and_dcpl_50 = and_dcpl_28 & and_dcpl_49;
  assign and_dcpl_52 = and_dcpl_44 & and_dcpl_24;
  assign and_dcpl_53 = and_dcpl_50 & and_dcpl_52;
  assign and_dcpl_55 = and_dcpl_25 & and_dcpl_43;
  assign and_dcpl_56 = and_dcpl_50 & and_dcpl_55;
  assign and_dcpl_58 = and_263_cse & and_dcpl_43;
  assign and_dcpl_59 = and_dcpl_35 & and_dcpl_58;
  assign and_dcpl_60 = (fsm_output[7]) & (~ (fsm_output[5]));
  assign and_dcpl_61 = and_dcpl_44 & and_dcpl_60;
  assign and_dcpl_62 = (fsm_output[2]) & (~ (fsm_output[6]));
  assign and_dcpl_63 = and_532_cse & and_dcpl_62;
  assign and_dcpl_65 = and_dcpl_37 & and_dcpl_60;
  assign and_dcpl_66 = and_dcpl_63 & and_dcpl_65;
  assign and_dcpl_68 = and_dcpl_44 & and_dcpl_31;
  assign and_dcpl_69 = and_dcpl_63 & and_dcpl_68;
  assign and_dcpl_70 = and_263_cse & and_dcpl_60;
  assign and_dcpl_71 = and_532_cse & and_dcpl_49;
  assign and_dcpl_73 = and_dcpl_25 & and_dcpl_60;
  assign and_dcpl_74 = and_dcpl_35 & and_dcpl_73;
  assign and_dcpl_83 = and_532_cse & nor_474_cse;
  assign and_dcpl_86 = and_dcpl_37 & and_dcpl_31;
  assign and_dcpl_88 = and_263_cse & and_dcpl_31;
  assign not_tmp_134 = ~((fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]));
  assign not_tmp_135 = ~((fsm_output[0]) & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]));
  assign not_tmp_138 = ~((fsm_output[4:2]==3'b111));
  assign not_tmp_147 = ~((VEC_LOOP_j_10_0_sva_9_0[0]) & (fsm_output[6]) & (fsm_output[3])
      & (fsm_output[4]));
  assign nand_132_cse = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[0]) & (fsm_output[6])
      & (fsm_output[3]) & (fsm_output[4]));
  assign nand_130_cse = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[0]) & (fsm_output[0])
      & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]));
  assign nand_133_cse = ~((COMP_LOOP_acc_1_cse_4_sva[0]) & (fsm_output[6]) & (fsm_output[3])
      & (fsm_output[4]));
  assign not_tmp_153 = ~((VEC_LOOP_j_10_0_sva_9_0[0]) & (fsm_output[4:2]==3'b111));
  assign nand_97_cse = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2]) & (fsm_output[0]) &
      (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]));
  assign nand_98_cse = ~((COMP_LOOP_acc_10_cse_10_1_sva[2]) & (fsm_output[6]) & (fsm_output[3])
      & (fsm_output[4]));
  assign nand_99_cse = ~((COMP_LOOP_acc_1_cse_sva[2]) & (fsm_output[6]) & (fsm_output[3])
      & (fsm_output[4]));
  assign and_dcpl_94 = and_dcpl_28 & and_dcpl_62;
  assign and_dcpl_95 = and_dcpl_94 & and_dcpl_26;
  assign and_dcpl_96 = and_dcpl_94 & and_dcpl_52;
  assign and_dcpl_97 = and_dcpl_94 & and_dcpl_38;
  assign and_dcpl_98 = and_dcpl_94 & and_dcpl_41;
  assign and_dcpl_99 = (fsm_output[4:3]==2'b01);
  assign and_dcpl_100 = and_dcpl_99 & nor_474_cse;
  assign and_dcpl_101 = and_dcpl_100 & and_dcpl_26;
  assign and_dcpl_102 = and_dcpl_100 & and_dcpl_52;
  assign and_dcpl_104 = (~ (fsm_output[4])) & (~ (fsm_output[6])) & and_dcpl_24;
  assign and_dcpl_117 = and_532_cse & (fsm_output[2]);
  assign or_tmp_588 = (fsm_output[7]) | (~ and_532_cse);
  assign mux_tmp_472 = MUX_s_1_2_2((~ nor_tmp_35), or_tmp_588, fsm_output[2]);
  assign mux_485_nl = MUX_s_1_2_2(and_dcpl_28, and_532_cse, fsm_output[7]);
  assign mux_tmp_475 = MUX_s_1_2_2((~ mux_485_nl), or_tmp_588, fsm_output[2]);
  assign mux_tmp_478 = MUX_s_1_2_2((~ mux_141_cse), mux_tmp_475, fsm_output[0]);
  assign nand_38_nl = ~((fsm_output[0]) & (fsm_output[5]));
  assign or_636_nl = (fsm_output[0]) | (fsm_output[5]);
  assign mux_tmp_486 = MUX_s_1_2_2(nand_38_nl, or_636_nl, fsm_output[6]);
  assign or_637_nl = (fsm_output[6]) | (fsm_output[0]) | (fsm_output[5]);
  assign mux_tmp_487 = MUX_s_1_2_2(mux_tmp_486, or_637_nl, fsm_output[1]);
  assign mux_tmp_489 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[0]);
  assign or_640_nl = (fsm_output[4]) | (fsm_output[1]) | (fsm_output[6]) | mux_tmp_489;
  assign or_638_nl = (fsm_output[4]) | (~((fsm_output[1]) & (fsm_output[6]) & (fsm_output[0])
      & (fsm_output[5])));
  assign mux_tmp_490 = MUX_s_1_2_2(or_640_nl, or_638_nl, fsm_output[3]);
  assign and_dcpl_120 = and_dcpl_29 & and_dcpl_58;
  assign and_dcpl_121 = and_dcpl_50 & and_dcpl_38;
  assign and_dcpl_122 = and_dcpl_50 & and_dcpl_45;
  assign and_dcpl_123 = and_dcpl_29 & and_dcpl_73;
  assign and_dcpl_124 = and_dcpl_63 & and_dcpl_70;
  assign and_dcpl_125 = and_dcpl_63 & and_dcpl_86;
  assign and_dcpl_126 = and_dcpl_35 & and_dcpl_61;
  assign nor_197_nl = ~((fsm_output[4:3]!=2'b01));
  assign mux_tmp_495 = MUX_s_1_2_2(nor_197_nl, and_532_cse, fsm_output[1]);
  assign not_tmp_290 = ~((fsm_output[1]) & (fsm_output[4]) & (fsm_output[3]));
  assign and_230_cse = (fsm_output[0]) & (fsm_output[5]);
  assign or_650_nl = (fsm_output[6]) | (fsm_output[1]) | (fsm_output[4]) | (fsm_output[3]);
  assign nand_152_nl = ~((fsm_output[6]) & (fsm_output[1]) & (~ (fsm_output[4]))
      & (fsm_output[3]));
  assign mux_tmp_501 = MUX_s_1_2_2(or_650_nl, nand_152_nl, and_230_cse);
  assign or_653_nl = (fsm_output[4:3]!=2'b10);
  assign mux_tmp_503 = MUX_s_1_2_2(or_653_nl, or_dcpl, fsm_output[1]);
  assign or_tmp_610 = (~ (fsm_output[6])) | (~ (fsm_output[1])) | (fsm_output[4])
      | (fsm_output[3]);
  assign or_dcpl_46 = (fsm_output[7]) | (fsm_output[5]);
  assign or_dcpl_51 = or_dcpl | (fsm_output[6]) | (fsm_output[2]);
  assign or_dcpl_52 = or_dcpl_51 | (fsm_output[1:0]!=2'b10) | or_dcpl_46;
  assign or_tmp_616 = and_263_cse | (fsm_output[6]) | (fsm_output[2]) | (fsm_output[3])
      | (fsm_output[4]);
  assign mux_528_nl = MUX_s_1_2_2((~ or_tmp_616), and_dcpl_35, fsm_output[7]);
  assign mux_529_itm = MUX_s_1_2_2(mux_528_nl, nor_tmp_29, fsm_output[5]);
  assign or_tmp_617 = (fsm_output[4:2]!=3'b000);
  assign or_tmp_620 = (fsm_output[6]) | and_dcpl_117;
  assign mux_tmp_522 = MUX_s_1_2_2(or_tmp_620, or_tmp_25, and_263_cse);
  assign mux_tmp_523 = MUX_s_1_2_2((~ or_tmp_616), (fsm_output[6]), fsm_output[7]);
  assign mux_tmp_526 = MUX_s_1_2_2((~ or_tmp_617), and_dcpl_117, fsm_output[6]);
  assign mux_tmp_527 = MUX_s_1_2_2(mux_tmp_526, and_dcpl_35, fsm_output[0]);
  assign or_tmp_621 = and_263_cse | (fsm_output[4:2]!=3'b000);
  assign or_dcpl_53 = and_263_cse | (fsm_output[5]);
  assign and_dcpl_138 = (or_tmp_621 ^ (fsm_output[5])) & nor_441_cse;
  assign and_152_nl = (fsm_output[6]) & or_tmp_617;
  assign mux_550_nl = MUX_s_1_2_2(and_152_nl, (fsm_output[6]), or_731_cse);
  assign mux_551_nl = MUX_s_1_2_2(or_tmp_616, (~ mux_550_nl), fsm_output[5]);
  assign and_dcpl_143 = mux_551_nl & (~ (fsm_output[7]));
  assign and_dcpl_144 = ~((~(or_dcpl_51 | or_dcpl_53)) | (fsm_output[7]));
  assign mux_562_nl = MUX_s_1_2_2((fsm_output[6]), or_tmp_620, and_263_cse);
  assign mux_563_nl = MUX_s_1_2_2((~ or_tmp_616), mux_562_nl, fsm_output[7]);
  assign mux_564_itm = MUX_s_1_2_2(mux_563_nl, (fsm_output[7]), fsm_output[5]);
  assign mux_tmp_554 = MUX_s_1_2_2(and_dcpl_35, and_280_cse, fsm_output[1]);
  assign mux_tmp_557 = MUX_s_1_2_2(and_dcpl_35, and_280_cse, or_731_cse);
  assign mux_571_nl = MUX_s_1_2_2(and_dcpl_35, and_280_cse, and_263_cse);
  assign mux_572_nl = MUX_s_1_2_2((~ or_tmp_616), mux_571_nl, fsm_output[7]);
  assign mux_573_itm = MUX_s_1_2_2(mux_572_nl, nor_tmp_29, fsm_output[5]);
  assign mux_574_nl = MUX_s_1_2_2((fsm_output[6]), or_tmp_620, fsm_output[1]);
  assign and_157_nl = (fsm_output[7]) & mux_574_nl;
  assign mux_575_itm = MUX_s_1_2_2(mux_tmp_523, and_157_nl, fsm_output[5]);
  assign not_tmp_329 = ~((fsm_output[7]) | or_tmp_616);
  assign mux_579_nl = MUX_s_1_2_2((~ or_tmp_616), nor_tmp_64, fsm_output[7]);
  assign mux_580_itm = MUX_s_1_2_2(mux_579_nl, nor_tmp_29, fsm_output[5]);
  assign and_dcpl_145 = (~ (fsm_output[6])) & (fsm_output[0]);
  assign nor_504_nl = ~((fsm_output[3:2]!=2'b10));
  assign nor_505_nl = ~((fsm_output[3:2]!=2'b01));
  assign mux_584_nl = MUX_s_1_2_2(nor_504_nl, nor_505_nl, fsm_output[1]);
  assign and_dcpl_148 = mux_584_nl & (~ (fsm_output[4])) & and_dcpl_145 & and_dcpl_24;
  assign and_dcpl_150 = (fsm_output[4:3]==2'b10) & nor_474_cse;
  assign or_tmp_631 = (~ (fsm_output[7])) | (~ (fsm_output[3])) | (fsm_output[4]);
  assign or_699_nl = (fsm_output[7]) | (fsm_output[3]) | (~ (fsm_output[4]));
  assign mux_tmp_575 = MUX_s_1_2_2(or_699_nl, or_tmp_631, fsm_output[2]);
  assign or_tmp_634 = (fsm_output[6]) | mux_tmp_575;
  assign and_dcpl_153 = and_dcpl_99 & and_dcpl_33;
  assign and_dcpl_156 = and_dcpl_99 & and_dcpl_62;
  assign and_dcpl_159 = and_dcpl_99 & and_dcpl_49;
  assign and_dcpl_165 = ~((fsm_output[1]) | (fsm_output[7]) | (fsm_output[5]));
  assign and_dcpl_167 = and_dcpl_28 & (fsm_output[2]);
  assign and_dcpl_168 = and_dcpl_167 & and_dcpl_145;
  assign or_tmp_649 = ((fsm_output[3:2]==2'b11)) | (fsm_output[4]);
  assign and_tmp_15 = (fsm_output[6]) & or_tmp_649;
  assign or_tmp_651 = (fsm_output[6]) | or_tmp_649;
  assign and_tmp_16 = (fsm_output[6]) & or_dcpl;
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_35 & and_dcpl_32;
  assign VEC_LOOP_j_10_0_sva_9_0_mx0c0 = and_dcpl_29 & and_dcpl_52;
  assign COMP_LOOP_1_acc_8_itm_mx0c3 = and_dcpl_150 & and_dcpl_52;
  assign nand_27_nl = ~((fsm_output[6]) & (~ mux_tmp_575));
  assign mux_588_nl = MUX_s_1_2_2(nand_27_nl, or_tmp_634, fsm_output[1]);
  assign nor_192_nl = ~((fsm_output[5]) | mux_588_nl);
  assign or_696_nl = (fsm_output[7]) | (~ (fsm_output[3])) | (fsm_output[4]);
  assign mux_585_nl = MUX_s_1_2_2(or_tmp_631, or_696_nl, fsm_output[2]);
  assign nand_25_nl = ~((fsm_output[6]) & (~ mux_585_nl));
  assign mux_587_nl = MUX_s_1_2_2(or_tmp_634, nand_25_nl, fsm_output[1]);
  assign and_214_nl = (fsm_output[5]) & (~ mux_587_nl);
  assign COMP_LOOP_1_acc_8_itm_mx0c4 = MUX_s_1_2_2(nor_192_nl, and_214_nl, fsm_output[0]);
  assign COMP_LOOP_1_acc_8_itm_mx0c7 = and_dcpl_150 & and_dcpl_55;
  assign COMP_LOOP_1_acc_8_itm_mx0c10 = and_dcpl_153 & and_dcpl_41;
  assign COMP_LOOP_1_acc_8_itm_mx0c13 = and_dcpl_153 & and_dcpl_47;
  assign COMP_LOOP_1_acc_8_itm_mx0c16 = and_dcpl_156 & and_dcpl_61;
  assign COMP_LOOP_1_acc_8_itm_mx0c19 = and_dcpl_156 & and_dcpl_32;
  assign COMP_LOOP_1_acc_8_itm_mx0c22 = and_dcpl_159 & and_dcpl_70;
  assign COMP_LOOP_1_acc_8_itm_mx0c25 = and_dcpl_159 & and_dcpl_86;
  assign nand_143_nl = ~((fsm_output[2]) & (fsm_output[7]) & (fsm_output[3]) & (fsm_output[4]));
  assign or_136_nl = (fsm_output[2]) | (fsm_output[7]) | (fsm_output[3]) | (fsm_output[4]);
  assign mux_205_nl = MUX_s_1_2_2(nand_143_nl, or_136_nl, fsm_output[5]);
  assign or_137_nl = (fsm_output[0]) | mux_205_nl;
  assign mux_206_nl = MUX_s_1_2_2(or_137_nl, nand_tmp_2, fsm_output[6]);
  assign or_135_nl = (fsm_output[0]) | (fsm_output[5]) | mux_tmp_192;
  assign mux_204_nl = MUX_s_1_2_2(nand_tmp_2, or_135_nl, fsm_output[6]);
  assign mux_207_nl = MUX_s_1_2_2(mux_206_nl, mux_204_nl, fsm_output[1]);
  assign vec_rsc_0_0_i_d_d_pff = MUX_v_64_2_2(COMP_LOOP_1_acc_8_itm, COMP_LOOP_1_modulo_cmp_return_rsc_z,
      mux_207_nl);
  assign and_54_nl = and_dcpl_29 & and_dcpl_45;
  assign and_59_nl = and_dcpl_50 & and_dcpl_26;
  assign and_62_nl = and_dcpl_35 & and_dcpl_41;
  assign and_65_nl = and_dcpl_35 & and_dcpl_47;
  assign and_72_nl = and_dcpl_63 & and_dcpl_61;
  assign and_75_nl = and_dcpl_63 & and_dcpl_32;
  assign and_80_nl = and_dcpl_71 & and_dcpl_70;
  assign vec_rsc_0_0_i_radr_d_pff = MUX1HOT_v_7_16_2((COMP_LOOP_1_acc_10_itm_10_1_1[9:3]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_1_cse_2_sva[9:3]), (COMP_LOOP_acc_10_cse_10_1_2_sva[9:3]),
      (COMP_LOOP_acc_11_psp_sva[8:2]), (COMP_LOOP_acc_10_cse_10_1_3_sva[9:3]), (COMP_LOOP_acc_1_cse_4_sva[9:3]),
      (COMP_LOOP_acc_10_cse_10_1_4_sva[9:3]), (COMP_LOOP_acc_13_psp_sva[7:1]), (COMP_LOOP_acc_10_cse_10_1_5_sva[9:3]),
      (COMP_LOOP_acc_1_cse_6_sva[9:3]), (COMP_LOOP_acc_10_cse_10_1_6_sva[9:3]), (COMP_LOOP_acc_14_psp_sva[8:2]),
      (COMP_LOOP_acc_10_cse_10_1_7_sva[9:3]), (COMP_LOOP_acc_1_cse_sva[9:3]), (COMP_LOOP_acc_10_cse_10_1_sva[9:3]),
      {and_dcpl_39 , and_dcpl_42 , and_54_nl , and_dcpl_48 , and_59_nl , and_dcpl_53
      , and_62_nl , and_dcpl_56 , and_65_nl , and_dcpl_59 , and_72_nl , and_dcpl_66
      , and_75_nl , and_dcpl_69 , and_80_nl , and_dcpl_74});
  assign and_83_nl = and_dcpl_63 & and_dcpl_41;
  assign and_84_nl = and_dcpl_29 & and_dcpl_55;
  assign and_85_nl = and_dcpl_63 & and_dcpl_47;
  assign and_86_nl = and_dcpl_63 & and_dcpl_58;
  assign and_87_nl = and_dcpl_35 & and_dcpl_52;
  assign and_88_nl = and_dcpl_35 & and_dcpl_38;
  assign and_89_nl = and_dcpl_35 & and_dcpl_55;
  assign and_90_nl = and_dcpl_35 & and_dcpl_45;
  assign and_92_nl = and_dcpl_83 & and_dcpl_70;
  assign and_93_nl = and_dcpl_63 & and_dcpl_73;
  assign and_95_nl = and_dcpl_83 & and_dcpl_86;
  assign and_97_nl = and_dcpl_83 & and_dcpl_88;
  assign and_98_nl = and_dcpl_71 & and_dcpl_61;
  assign and_99_nl = and_dcpl_71 & and_dcpl_65;
  assign and_100_nl = and_dcpl_71 & and_dcpl_32;
  assign and_101_nl = and_dcpl_71 & and_dcpl_68;
  assign vec_rsc_0_0_i_wadr_d_pff = MUX1HOT_v_7_16_2((COMP_LOOP_acc_10_cse_10_1_1_sva[9:3]),
      COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_10_1_2_sva[9:3]), (COMP_LOOP_acc_1_cse_2_sva[9:3]),
      (COMP_LOOP_acc_10_cse_10_1_3_sva[9:3]), (COMP_LOOP_acc_11_psp_sva[8:2]), (COMP_LOOP_acc_10_cse_10_1_4_sva[9:3]),
      (COMP_LOOP_acc_1_cse_4_sva[9:3]), (COMP_LOOP_acc_10_cse_10_1_5_sva[9:3]), (COMP_LOOP_acc_13_psp_sva[7:1]),
      (COMP_LOOP_acc_10_cse_10_1_6_sva[9:3]), (COMP_LOOP_acc_1_cse_6_sva[9:3]), (COMP_LOOP_acc_10_cse_10_1_7_sva[9:3]),
      (COMP_LOOP_acc_14_psp_sva[8:2]), (COMP_LOOP_acc_10_cse_10_1_sva[9:3]), (COMP_LOOP_acc_1_cse_sva[9:3]),
      {and_83_nl , and_84_nl , and_85_nl , and_86_nl , and_87_nl , and_88_nl , and_89_nl
      , and_90_nl , and_92_nl , and_93_nl , and_95_nl , and_97_nl , and_98_nl , and_99_nl
      , and_100_nl , and_101_nl});
  assign nor_423_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]!=3'b000) | not_tmp_135);
  assign nor_424_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b00) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | not_tmp_134);
  assign nor_425_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b000) | (fsm_output[6])
      | nand_138_cse);
  assign mux_219_nl = MUX_s_1_2_2(nor_424_nl, nor_425_nl, fsm_output[0]);
  assign mux_220_nl = MUX_s_1_2_2(nor_423_nl, mux_219_nl, fsm_output[1]);
  assign and_259_nl = (fsm_output[7]) & mux_220_nl;
  assign nor_426_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b000) | not_tmp_135);
  assign nor_427_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b00) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | not_tmp_134);
  assign nor_428_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]!=3'b000) | (fsm_output[6])
      | nand_138_cse);
  assign mux_216_nl = MUX_s_1_2_2(nor_427_nl, nor_428_nl, fsm_output[0]);
  assign mux_217_nl = MUX_s_1_2_2(nor_426_nl, mux_216_nl, fsm_output[1]);
  assign nor_429_nl = ~((COMP_LOOP_acc_13_psp_sva[0]) | (fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[0]) | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[6]) | nand_138_cse);
  assign mux_218_nl = MUX_s_1_2_2(mux_217_nl, nor_429_nl, fsm_output[7]);
  assign mux_221_nl = MUX_s_1_2_2(and_259_nl, mux_218_nl, fsm_output[2]);
  assign nor_430_nl = ~((fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[2:1]!=2'b00) |
      (fsm_output[0]) | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[6]) | (fsm_output[3])
      | (fsm_output[4]));
  assign nor_431_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b000) | not_tmp_134);
  assign nor_432_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b000) | not_tmp_134);
  assign mux_212_nl = MUX_s_1_2_2(nor_431_nl, nor_432_nl, fsm_output[0]);
  assign nor_433_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b000) | (fsm_output[6])
      | nand_138_cse);
  assign nor_434_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b000) | (fsm_output[6])
      | nand_138_cse);
  assign mux_211_nl = MUX_s_1_2_2(nor_433_nl, nor_434_nl, fsm_output[0]);
  assign mux_213_nl = MUX_s_1_2_2(mux_212_nl, mux_211_nl, fsm_output[1]);
  assign mux_214_nl = MUX_s_1_2_2(nor_430_nl, mux_213_nl, fsm_output[7]);
  assign or_145_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b000) | not_tmp_134;
  assign or_143_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b000) | not_tmp_134;
  assign mux_209_nl = MUX_s_1_2_2(or_145_nl, or_143_nl, fsm_output[0]);
  assign or_141_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b000) | (fsm_output[6])
      | nand_138_cse;
  assign or_139_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b000) | (fsm_output[6]) |
      nand_138_cse;
  assign mux_208_nl = MUX_s_1_2_2(or_141_nl, or_139_nl, fsm_output[0]);
  assign mux_210_nl = MUX_s_1_2_2(mux_209_nl, mux_208_nl, fsm_output[1]);
  assign nor_435_nl = ~((fsm_output[7]) | mux_210_nl);
  assign mux_215_nl = MUX_s_1_2_2(mux_214_nl, nor_435_nl, fsm_output[2]);
  assign vec_rsc_0_0_i_we_d_pff = MUX_s_1_2_2(mux_221_nl, mux_215_nl, fsm_output[5]);
  assign nor_410_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b000) | (fsm_output[4:2]!=3'b000));
  assign nor_411_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b000) | (fsm_output[4:2]!=3'b000));
  assign mux_234_nl = MUX_s_1_2_2(nor_410_nl, nor_411_nl, fsm_output[0]);
  assign and_258_nl = (fsm_output[1]) & mux_234_nl;
  assign nor_412_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b000) | (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm)
      | nand_137_cse);
  assign nor_413_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b000) | (fsm_output[0])
      | not_tmp_138);
  assign mux_233_nl = MUX_s_1_2_2(nor_412_nl, nor_413_nl, fsm_output[1]);
  assign mux_235_nl = MUX_s_1_2_2(and_258_nl, mux_233_nl, fsm_output[7]);
  assign nor_414_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b000)
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (fsm_output[4:2]!=3'b000));
  assign nor_415_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b000) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_231_nl = MUX_s_1_2_2(nor_414_nl, nor_415_nl, fsm_output[1]);
  assign or_187_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b00) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | not_tmp_138;
  assign or_185_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]!=3'b000) | not_tmp_138;
  assign mux_230_nl = MUX_s_1_2_2(or_187_nl, or_185_nl, fsm_output[0]);
  assign nor_416_nl = ~((fsm_output[1]) | mux_230_nl);
  assign mux_232_nl = MUX_s_1_2_2(mux_231_nl, nor_416_nl, fsm_output[7]);
  assign mux_236_nl = MUX_s_1_2_2(mux_235_nl, mux_232_nl, fsm_output[5]);
  assign nor_417_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b00) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[4:2]!=3'b000));
  assign nor_418_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b000) | (fsm_output[4:2]!=3'b000));
  assign mux_226_nl = MUX_s_1_2_2(nor_417_nl, nor_418_nl, fsm_output[0]);
  assign nor_419_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b000)
      | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) | not_tmp_138);
  assign mux_227_nl = MUX_s_1_2_2(mux_226_nl, nor_419_nl, fsm_output[1]);
  assign nor_420_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b000) | (fsm_output[0])
      | not_tmp_138);
  assign nor_421_nl = ~((~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b000)
      | (~ (fsm_output[0])) | (fsm_output[2]) | nand_138_cse);
  assign mux_225_nl = MUX_s_1_2_2(nor_420_nl, nor_421_nl, fsm_output[1]);
  assign mux_228_nl = MUX_s_1_2_2(mux_227_nl, mux_225_nl, fsm_output[7]);
  assign or_174_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b000) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign or_173_nl = (VEC_LOOP_j_10_0_sva_9_0[1]) | (COMP_LOOP_acc_13_psp_sva[0])
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | (VEC_LOOP_j_10_0_sva_9_0[0]) |
      not_tmp_138;
  assign or_171_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b000) | not_tmp_138;
  assign mux_223_nl = MUX_s_1_2_2(or_173_nl, or_171_nl, fsm_output[0]);
  assign mux_224_nl = MUX_s_1_2_2(or_174_nl, mux_223_nl, fsm_output[1]);
  assign nor_422_nl = ~((fsm_output[7]) | mux_224_nl);
  assign mux_229_nl = MUX_s_1_2_2(mux_228_nl, nor_422_nl, fsm_output[5]);
  assign vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_236_nl,
      mux_229_nl, fsm_output[6]);
  assign nor_397_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[2:1]!=2'b00) | nand_130_cse);
  assign nor_398_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b00) | not_tmp_147);
  assign nor_399_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b001) | (fsm_output[6])
      | nand_138_cse);
  assign mux_249_nl = MUX_s_1_2_2(nor_398_nl, nor_399_nl, fsm_output[0]);
  assign mux_250_nl = MUX_s_1_2_2(nor_397_nl, mux_249_nl, fsm_output[1]);
  assign and_257_nl = (fsm_output[7]) & mux_250_nl;
  assign nor_400_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b001) | not_tmp_135);
  assign nor_401_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b00) | not_tmp_147);
  assign nor_402_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]!=3'b001) | (fsm_output[6])
      | nand_138_cse);
  assign mux_246_nl = MUX_s_1_2_2(nor_401_nl, nor_402_nl, fsm_output[0]);
  assign mux_247_nl = MUX_s_1_2_2(nor_400_nl, mux_246_nl, fsm_output[1]);
  assign nor_403_nl = ~((COMP_LOOP_acc_13_psp_sva[0]) | (fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[0]) | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[6]) | nand_138_cse);
  assign mux_248_nl = MUX_s_1_2_2(mux_247_nl, nor_403_nl, fsm_output[7]);
  assign mux_251_nl = MUX_s_1_2_2(and_257_nl, mux_248_nl, fsm_output[2]);
  assign nor_404_nl = ~((fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[2:1]!=2'b00) |
      (fsm_output[0]) | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[6]) | (fsm_output[3])
      | (fsm_output[4]));
  assign nor_405_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b001) | not_tmp_134);
  assign nor_406_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b001) | not_tmp_134);
  assign mux_242_nl = MUX_s_1_2_2(nor_405_nl, nor_406_nl, fsm_output[0]);
  assign nor_407_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b001) | (fsm_output[6])
      | nand_138_cse);
  assign nor_408_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b001) | (fsm_output[6])
      | nand_138_cse);
  assign mux_241_nl = MUX_s_1_2_2(nor_407_nl, nor_408_nl, fsm_output[0]);
  assign mux_243_nl = MUX_s_1_2_2(mux_242_nl, mux_241_nl, fsm_output[1]);
  assign mux_244_nl = MUX_s_1_2_2(nor_404_nl, mux_243_nl, fsm_output[7]);
  assign or_204_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:1]!=2'b00) | nand_132_cse;
  assign or_202_nl = (COMP_LOOP_acc_1_cse_4_sva[2:1]!=2'b00) | nand_133_cse;
  assign mux_239_nl = MUX_s_1_2_2(or_204_nl, or_202_nl, fsm_output[0]);
  assign or_200_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b001) | (fsm_output[6])
      | nand_138_cse;
  assign or_198_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b001) | (fsm_output[6]) |
      nand_138_cse;
  assign mux_238_nl = MUX_s_1_2_2(or_200_nl, or_198_nl, fsm_output[0]);
  assign mux_240_nl = MUX_s_1_2_2(mux_239_nl, mux_238_nl, fsm_output[1]);
  assign nor_409_nl = ~((fsm_output[7]) | mux_240_nl);
  assign mux_245_nl = MUX_s_1_2_2(mux_244_nl, nor_409_nl, fsm_output[2]);
  assign vec_rsc_0_1_i_we_d_pff = MUX_s_1_2_2(mux_251_nl, mux_245_nl, fsm_output[5]);
  assign nor_384_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b001) | (fsm_output[4:2]!=3'b000));
  assign nor_385_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b001) | (fsm_output[4:2]!=3'b000));
  assign mux_264_nl = MUX_s_1_2_2(nor_384_nl, nor_385_nl, fsm_output[0]);
  assign and_256_nl = (fsm_output[1]) & mux_264_nl;
  assign nor_386_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b001) | (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm)
      | nand_137_cse);
  assign nor_387_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b001) | (fsm_output[0])
      | not_tmp_138);
  assign mux_263_nl = MUX_s_1_2_2(nor_386_nl, nor_387_nl, fsm_output[1]);
  assign mux_265_nl = MUX_s_1_2_2(and_256_nl, mux_263_nl, fsm_output[7]);
  assign nor_388_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b00) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[4:2]!=3'b000));
  assign nor_389_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b001) | (fsm_output[4:2]!=3'b000));
  assign mux_260_nl = MUX_s_1_2_2(nor_388_nl, nor_389_nl, fsm_output[0]);
  assign nor_390_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b001)
      | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) | not_tmp_138);
  assign mux_261_nl = MUX_s_1_2_2(mux_260_nl, nor_390_nl, fsm_output[1]);
  assign nor_391_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b001) | (fsm_output[0])
      | not_tmp_138);
  assign nor_392_nl = ~((~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b001)
      | (~ (fsm_output[0])) | (fsm_output[2]) | nand_138_cse);
  assign mux_259_nl = MUX_s_1_2_2(nor_391_nl, nor_392_nl, fsm_output[1]);
  assign mux_262_nl = MUX_s_1_2_2(mux_261_nl, mux_259_nl, fsm_output[7]);
  assign mux_266_nl = MUX_s_1_2_2(mux_265_nl, mux_262_nl, fsm_output[6]);
  assign nor_393_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b001)
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (fsm_output[4:2]!=3'b000));
  assign nor_394_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b001) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_256_nl = MUX_s_1_2_2(nor_393_nl, nor_394_nl, fsm_output[1]);
  assign or_238_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b00) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | not_tmp_153;
  assign or_236_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:1]!=2'b00) | nand_126_cse;
  assign mux_255_nl = MUX_s_1_2_2(or_238_nl, or_236_nl, fsm_output[0]);
  assign nor_395_nl = ~((fsm_output[1]) | mux_255_nl);
  assign mux_257_nl = MUX_s_1_2_2(mux_256_nl, nor_395_nl, fsm_output[7]);
  assign or_233_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b001) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign or_232_nl = (VEC_LOOP_j_10_0_sva_9_0[1]) | (COMP_LOOP_acc_13_psp_sva[0])
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_153;
  assign or_230_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:1]!=2'b00) | nand_127_cse;
  assign mux_253_nl = MUX_s_1_2_2(or_232_nl, or_230_nl, fsm_output[0]);
  assign mux_254_nl = MUX_s_1_2_2(or_233_nl, mux_253_nl, fsm_output[1]);
  assign nor_396_nl = ~((fsm_output[7]) | mux_254_nl);
  assign mux_258_nl = MUX_s_1_2_2(mux_257_nl, nor_396_nl, fsm_output[6]);
  assign vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_266_nl,
      mux_258_nl, fsm_output[5]);
  assign nor_371_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]!=3'b010) | not_tmp_135);
  assign nor_372_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b01) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | not_tmp_134);
  assign nor_373_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b010) | (fsm_output[6])
      | nand_138_cse);
  assign mux_279_nl = MUX_s_1_2_2(nor_372_nl, nor_373_nl, fsm_output[0]);
  assign mux_280_nl = MUX_s_1_2_2(nor_371_nl, mux_279_nl, fsm_output[1]);
  assign and_255_nl = (fsm_output[7]) & mux_280_nl;
  assign nor_374_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b010) | not_tmp_135);
  assign nor_375_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b01) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | not_tmp_134);
  assign nor_376_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]!=3'b010) | (fsm_output[6])
      | nand_138_cse);
  assign mux_276_nl = MUX_s_1_2_2(nor_375_nl, nor_376_nl, fsm_output[0]);
  assign mux_277_nl = MUX_s_1_2_2(nor_374_nl, mux_276_nl, fsm_output[1]);
  assign nor_377_nl = ~((COMP_LOOP_acc_13_psp_sva[0]) | (fsm_output[1]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[0]) | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[6]) | nand_138_cse);
  assign mux_278_nl = MUX_s_1_2_2(mux_277_nl, nor_377_nl, fsm_output[7]);
  assign mux_281_nl = MUX_s_1_2_2(and_255_nl, mux_278_nl, fsm_output[2]);
  assign nor_378_nl = ~((fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[2:1]!=2'b01) |
      (fsm_output[0]) | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[6]) | (fsm_output[3])
      | (fsm_output[4]));
  assign nor_379_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b010) | not_tmp_134);
  assign nor_380_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b010) | not_tmp_134);
  assign mux_272_nl = MUX_s_1_2_2(nor_379_nl, nor_380_nl, fsm_output[0]);
  assign nor_381_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b010) | (fsm_output[6])
      | nand_138_cse);
  assign nor_382_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b010) | (fsm_output[6])
      | nand_138_cse);
  assign mux_271_nl = MUX_s_1_2_2(nor_381_nl, nor_382_nl, fsm_output[0]);
  assign mux_273_nl = MUX_s_1_2_2(mux_272_nl, mux_271_nl, fsm_output[1]);
  assign mux_274_nl = MUX_s_1_2_2(nor_378_nl, mux_273_nl, fsm_output[7]);
  assign or_263_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b010) | not_tmp_134;
  assign or_261_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b010) | not_tmp_134;
  assign mux_269_nl = MUX_s_1_2_2(or_263_nl, or_261_nl, fsm_output[0]);
  assign or_259_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b010) | (fsm_output[6])
      | nand_138_cse;
  assign or_257_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b010) | (fsm_output[6]) |
      nand_138_cse;
  assign mux_268_nl = MUX_s_1_2_2(or_259_nl, or_257_nl, fsm_output[0]);
  assign mux_270_nl = MUX_s_1_2_2(mux_269_nl, mux_268_nl, fsm_output[1]);
  assign nor_383_nl = ~((fsm_output[7]) | mux_270_nl);
  assign mux_275_nl = MUX_s_1_2_2(mux_274_nl, nor_383_nl, fsm_output[2]);
  assign vec_rsc_0_2_i_we_d_pff = MUX_s_1_2_2(mux_281_nl, mux_275_nl, fsm_output[5]);
  assign nor_358_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b010) | (fsm_output[4:2]!=3'b000));
  assign nor_359_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b010) | (fsm_output[4:2]!=3'b000));
  assign mux_294_nl = MUX_s_1_2_2(nor_358_nl, nor_359_nl, fsm_output[0]);
  assign and_254_nl = (fsm_output[1]) & mux_294_nl;
  assign nor_360_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b010) | (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm)
      | nand_137_cse);
  assign nor_361_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b010) | (fsm_output[0])
      | not_tmp_138);
  assign mux_293_nl = MUX_s_1_2_2(nor_360_nl, nor_361_nl, fsm_output[1]);
  assign mux_295_nl = MUX_s_1_2_2(and_254_nl, mux_293_nl, fsm_output[7]);
  assign nor_362_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b010)
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (fsm_output[4:2]!=3'b000));
  assign nor_363_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b010) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_291_nl = MUX_s_1_2_2(nor_362_nl, nor_363_nl, fsm_output[1]);
  assign or_305_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b01) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | not_tmp_138;
  assign or_303_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]!=3'b010) | not_tmp_138;
  assign mux_290_nl = MUX_s_1_2_2(or_305_nl, or_303_nl, fsm_output[0]);
  assign nor_364_nl = ~((fsm_output[1]) | mux_290_nl);
  assign mux_292_nl = MUX_s_1_2_2(mux_291_nl, nor_364_nl, fsm_output[7]);
  assign mux_296_nl = MUX_s_1_2_2(mux_295_nl, mux_292_nl, fsm_output[5]);
  assign nor_365_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b01) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[4:2]!=3'b000));
  assign nor_366_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b010) | (fsm_output[4:2]!=3'b000));
  assign mux_286_nl = MUX_s_1_2_2(nor_365_nl, nor_366_nl, fsm_output[0]);
  assign nor_367_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b010)
      | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) | not_tmp_138);
  assign mux_287_nl = MUX_s_1_2_2(mux_286_nl, nor_367_nl, fsm_output[1]);
  assign nor_368_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b010) | (fsm_output[0])
      | not_tmp_138);
  assign nor_369_nl = ~((~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b010)
      | (~ (fsm_output[0])) | (fsm_output[2]) | nand_138_cse);
  assign mux_285_nl = MUX_s_1_2_2(nor_368_nl, nor_369_nl, fsm_output[1]);
  assign mux_288_nl = MUX_s_1_2_2(mux_287_nl, mux_285_nl, fsm_output[7]);
  assign or_292_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b010) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign or_291_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (COMP_LOOP_acc_13_psp_sva[0])
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | (VEC_LOOP_j_10_0_sva_9_0[0]) |
      not_tmp_138;
  assign or_289_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b010) | not_tmp_138;
  assign mux_283_nl = MUX_s_1_2_2(or_291_nl, or_289_nl, fsm_output[0]);
  assign mux_284_nl = MUX_s_1_2_2(or_292_nl, mux_283_nl, fsm_output[1]);
  assign nor_370_nl = ~((fsm_output[7]) | mux_284_nl);
  assign mux_289_nl = MUX_s_1_2_2(mux_288_nl, nor_370_nl, fsm_output[5]);
  assign vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_296_nl,
      mux_289_nl, fsm_output[6]);
  assign nor_345_nl = ~((fsm_output[0]) | (~ (fsm_output[5])) | (VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b011)
      | (fsm_output[6]) | (fsm_output[3]) | (fsm_output[4]));
  assign nor_346_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b011) | (fsm_output[6:3]!=4'b1111));
  assign nor_347_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[2]) | (~((COMP_LOOP_acc_10_cse_10_1_7_sva[1:0]==2'b11)
      & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]))));
  assign nor_348_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b011) | not_tmp_134);
  assign mux_308_nl = MUX_s_1_2_2(nor_347_nl, nor_348_nl, fsm_output[5]);
  assign mux_309_nl = MUX_s_1_2_2(nor_346_nl, mux_308_nl, fsm_output[0]);
  assign mux_310_nl = MUX_s_1_2_2(nor_345_nl, mux_309_nl, fsm_output[7]);
  assign nor_349_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b01) | not_tmp_147);
  assign nor_350_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b011) | (fsm_output[6])
      | nand_138_cse);
  assign mux_306_nl = MUX_s_1_2_2(nor_349_nl, nor_350_nl, fsm_output[5]);
  assign nor_351_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b011) | (fsm_output[6])
      | nand_138_cse);
  assign nor_352_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b011) | (fsm_output[6])
      | nand_138_cse);
  assign mux_305_nl = MUX_s_1_2_2(nor_351_nl, nor_352_nl, fsm_output[5]);
  assign mux_307_nl = MUX_s_1_2_2(mux_306_nl, mux_305_nl, fsm_output[0]);
  assign and_253_nl = (fsm_output[7]) & mux_307_nl;
  assign mux_311_nl = MUX_s_1_2_2(mux_310_nl, and_253_nl, fsm_output[1]);
  assign nor_353_nl = ~((~ (fsm_output[5])) | (COMP_LOOP_acc_10_cse_10_1_4_sva[2:1]!=2'b01)
      | nand_132_cse);
  assign nor_354_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b011) | not_tmp_134);
  assign nor_355_nl = ~((COMP_LOOP_acc_1_cse_4_sva[2]) | (~((COMP_LOOP_acc_1_cse_4_sva[1:0]==2'b11)
      & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]))));
  assign mux_301_nl = MUX_s_1_2_2(nor_354_nl, nor_355_nl, fsm_output[5]);
  assign mux_302_nl = MUX_s_1_2_2(nor_353_nl, mux_301_nl, fsm_output[0]);
  assign nor_356_nl = ~((fsm_output[0]) | (COMP_LOOP_acc_13_psp_sva[0]) | (fsm_output[5])
      | (VEC_LOOP_j_10_0_sva_9_0[1:0]!=2'b11) | (fsm_output[6]) | nand_138_cse);
  assign mux_303_nl = MUX_s_1_2_2(mux_302_nl, nor_356_nl, fsm_output[7]);
  assign or_321_nl = (COMP_LOOP_acc_11_psp_sva[1]) | (~((COMP_LOOP_acc_11_psp_sva[0])
      & (VEC_LOOP_j_10_0_sva_9_0[0]) & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4])));
  assign or_320_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b011) | (fsm_output[6])
      | nand_138_cse;
  assign mux_299_nl = MUX_s_1_2_2(or_321_nl, or_320_nl, fsm_output[5]);
  assign or_318_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]!=3'b011) | (fsm_output[6])
      | nand_138_cse;
  assign or_316_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b011) | (fsm_output[6]) |
      nand_138_cse;
  assign mux_298_nl = MUX_s_1_2_2(or_318_nl, or_316_nl, fsm_output[5]);
  assign mux_300_nl = MUX_s_1_2_2(mux_299_nl, mux_298_nl, fsm_output[0]);
  assign nor_357_nl = ~((fsm_output[7]) | mux_300_nl);
  assign mux_304_nl = MUX_s_1_2_2(mux_303_nl, nor_357_nl, fsm_output[1]);
  assign vec_rsc_0_3_i_we_d_pff = MUX_s_1_2_2(mux_311_nl, mux_304_nl, fsm_output[2]);
  assign nor_332_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b011) | (fsm_output[4:2]!=3'b000));
  assign nor_333_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b011) | (fsm_output[4:2]!=3'b000));
  assign mux_324_nl = MUX_s_1_2_2(nor_332_nl, nor_333_nl, fsm_output[0]);
  assign and_252_nl = (fsm_output[1]) & mux_324_nl;
  assign nor_334_nl = ~((~((COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b011) & COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm))
      | nand_137_cse);
  assign nor_335_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b011) | (fsm_output[0])
      | not_tmp_138);
  assign mux_323_nl = MUX_s_1_2_2(nor_334_nl, nor_335_nl, fsm_output[1]);
  assign mux_325_nl = MUX_s_1_2_2(and_252_nl, mux_323_nl, fsm_output[7]);
  assign nor_336_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b01) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[4:2]!=3'b000));
  assign nor_337_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b011) | (fsm_output[4:2]!=3'b000));
  assign mux_320_nl = MUX_s_1_2_2(nor_336_nl, nor_337_nl, fsm_output[0]);
  assign nor_338_nl = ~((~((fsm_output[0]) & (COMP_LOOP_acc_1_cse_4_sva[2:0]==3'b011)
      & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) | not_tmp_138);
  assign mux_321_nl = MUX_s_1_2_2(mux_320_nl, nor_338_nl, fsm_output[1]);
  assign nor_339_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b011) | (fsm_output[0])
      | not_tmp_138);
  assign nor_340_nl = ~((~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b011)
      | (~ (fsm_output[0])) | (fsm_output[2]) | nand_138_cse);
  assign mux_319_nl = MUX_s_1_2_2(nor_339_nl, nor_340_nl, fsm_output[1]);
  assign mux_322_nl = MUX_s_1_2_2(mux_321_nl, mux_319_nl, fsm_output[7]);
  assign mux_326_nl = MUX_s_1_2_2(mux_325_nl, mux_322_nl, fsm_output[6]);
  assign nor_341_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b011)
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (fsm_output[4:2]!=3'b000));
  assign nor_342_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b011) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_316_nl = MUX_s_1_2_2(nor_341_nl, nor_342_nl, fsm_output[1]);
  assign or_351_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b01) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | not_tmp_153;
  assign or_349_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2]) | (~((COMP_LOOP_acc_10_cse_10_1_7_sva[1:0]==2'b11)
      & (fsm_output[4:2]==3'b111)));
  assign mux_315_nl = MUX_s_1_2_2(or_351_nl, or_349_nl, fsm_output[0]);
  assign nor_343_nl = ~((fsm_output[1]) | mux_315_nl);
  assign mux_317_nl = MUX_s_1_2_2(mux_316_nl, nor_343_nl, fsm_output[7]);
  assign or_347_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b011) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign or_346_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (COMP_LOOP_acc_13_psp_sva[0])
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_153;
  assign or_344_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2]) | (~((COMP_LOOP_acc_10_cse_10_1_5_sva[1:0]==2'b11)
      & (fsm_output[4:2]==3'b111)));
  assign mux_313_nl = MUX_s_1_2_2(or_346_nl, or_344_nl, fsm_output[0]);
  assign mux_314_nl = MUX_s_1_2_2(or_347_nl, mux_313_nl, fsm_output[1]);
  assign nor_344_nl = ~((fsm_output[7]) | mux_314_nl);
  assign mux_318_nl = MUX_s_1_2_2(mux_317_nl, nor_344_nl, fsm_output[6]);
  assign vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_326_nl,
      mux_318_nl, fsm_output[5]);
  assign nor_319_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]!=3'b100) | not_tmp_135);
  assign nor_320_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b10) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | not_tmp_134);
  assign nor_321_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b100) | (fsm_output[6])
      | nand_138_cse);
  assign mux_339_nl = MUX_s_1_2_2(nor_320_nl, nor_321_nl, fsm_output[0]);
  assign mux_340_nl = MUX_s_1_2_2(nor_319_nl, mux_339_nl, fsm_output[1]);
  assign and_251_nl = (fsm_output[7]) & mux_340_nl;
  assign nor_322_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[1:0]!=2'b00) | nand_97_cse);
  assign nor_323_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b10) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | not_tmp_134);
  assign nor_324_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]!=3'b100) | (fsm_output[6])
      | nand_138_cse);
  assign mux_336_nl = MUX_s_1_2_2(nor_323_nl, nor_324_nl, fsm_output[0]);
  assign mux_337_nl = MUX_s_1_2_2(nor_322_nl, mux_336_nl, fsm_output[1]);
  assign nor_325_nl = ~((~ (COMP_LOOP_acc_13_psp_sva[0])) | (fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[0]) | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[6]) | nand_138_cse);
  assign mux_338_nl = MUX_s_1_2_2(mux_337_nl, nor_325_nl, fsm_output[7]);
  assign mux_341_nl = MUX_s_1_2_2(and_251_nl, mux_338_nl, fsm_output[2]);
  assign nor_326_nl = ~((fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[2:1]!=2'b10) |
      (fsm_output[0]) | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[6]) | (fsm_output[3])
      | (fsm_output[4]));
  assign nor_327_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[1:0]!=2'b00) | nand_98_cse);
  assign nor_328_nl = ~((COMP_LOOP_acc_1_cse_sva[1:0]!=2'b00) | nand_99_cse);
  assign mux_332_nl = MUX_s_1_2_2(nor_327_nl, nor_328_nl, fsm_output[0]);
  assign nor_329_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b100) | (fsm_output[6])
      | nand_138_cse);
  assign nor_330_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b100) | (fsm_output[6])
      | nand_138_cse);
  assign mux_331_nl = MUX_s_1_2_2(nor_329_nl, nor_330_nl, fsm_output[0]);
  assign mux_333_nl = MUX_s_1_2_2(mux_332_nl, mux_331_nl, fsm_output[1]);
  assign mux_334_nl = MUX_s_1_2_2(nor_326_nl, mux_333_nl, fsm_output[7]);
  assign or_376_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b100) | not_tmp_134;
  assign or_374_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b100) | not_tmp_134;
  assign mux_329_nl = MUX_s_1_2_2(or_376_nl, or_374_nl, fsm_output[0]);
  assign or_372_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b100) | (fsm_output[6])
      | nand_138_cse;
  assign or_370_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b100) | (fsm_output[6]) |
      nand_138_cse;
  assign mux_328_nl = MUX_s_1_2_2(or_372_nl, or_370_nl, fsm_output[0]);
  assign mux_330_nl = MUX_s_1_2_2(mux_329_nl, mux_328_nl, fsm_output[1]);
  assign nor_331_nl = ~((fsm_output[7]) | mux_330_nl);
  assign mux_335_nl = MUX_s_1_2_2(mux_334_nl, nor_331_nl, fsm_output[2]);
  assign vec_rsc_0_4_i_we_d_pff = MUX_s_1_2_2(mux_341_nl, mux_335_nl, fsm_output[5]);
  assign nor_306_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b100) | (fsm_output[4:2]!=3'b000));
  assign nor_307_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b100) | (fsm_output[4:2]!=3'b000));
  assign mux_354_nl = MUX_s_1_2_2(nor_306_nl, nor_307_nl, fsm_output[0]);
  assign and_250_nl = (fsm_output[1]) & mux_354_nl;
  assign nor_308_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b100) | (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm)
      | nand_137_cse);
  assign nor_309_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b100) | (fsm_output[0])
      | not_tmp_138);
  assign mux_353_nl = MUX_s_1_2_2(nor_308_nl, nor_309_nl, fsm_output[1]);
  assign mux_355_nl = MUX_s_1_2_2(and_250_nl, mux_353_nl, fsm_output[7]);
  assign nor_310_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b100)
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (fsm_output[4:2]!=3'b000));
  assign nor_311_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b100) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_351_nl = MUX_s_1_2_2(nor_310_nl, nor_311_nl, fsm_output[1]);
  assign or_418_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b10) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | not_tmp_138;
  assign or_416_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]!=3'b100) | not_tmp_138;
  assign mux_350_nl = MUX_s_1_2_2(or_418_nl, or_416_nl, fsm_output[0]);
  assign nor_312_nl = ~((fsm_output[1]) | mux_350_nl);
  assign mux_352_nl = MUX_s_1_2_2(mux_351_nl, nor_312_nl, fsm_output[7]);
  assign mux_356_nl = MUX_s_1_2_2(mux_355_nl, mux_352_nl, fsm_output[5]);
  assign nor_313_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b10) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[4:2]!=3'b000));
  assign nor_314_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b100) | (fsm_output[4:2]!=3'b000));
  assign mux_346_nl = MUX_s_1_2_2(nor_313_nl, nor_314_nl, fsm_output[0]);
  assign nor_315_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b100)
      | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) | not_tmp_138);
  assign mux_347_nl = MUX_s_1_2_2(mux_346_nl, nor_315_nl, fsm_output[1]);
  assign nor_316_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b100) | (fsm_output[0])
      | not_tmp_138);
  assign nor_317_nl = ~((~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b100)
      | (~ (fsm_output[0])) | (fsm_output[2]) | nand_138_cse);
  assign mux_345_nl = MUX_s_1_2_2(nor_316_nl, nor_317_nl, fsm_output[1]);
  assign mux_348_nl = MUX_s_1_2_2(mux_347_nl, mux_345_nl, fsm_output[7]);
  assign or_405_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b100) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign or_404_nl = (VEC_LOOP_j_10_0_sva_9_0[1]) | (~ (COMP_LOOP_acc_13_psp_sva[0]))
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | (VEC_LOOP_j_10_0_sva_9_0[0]) |
      not_tmp_138;
  assign or_402_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b100) | not_tmp_138;
  assign mux_343_nl = MUX_s_1_2_2(or_404_nl, or_402_nl, fsm_output[0]);
  assign mux_344_nl = MUX_s_1_2_2(or_405_nl, mux_343_nl, fsm_output[1]);
  assign nor_318_nl = ~((fsm_output[7]) | mux_344_nl);
  assign mux_349_nl = MUX_s_1_2_2(mux_348_nl, nor_318_nl, fsm_output[5]);
  assign vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_356_nl,
      mux_349_nl, fsm_output[6]);
  assign nor_293_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[2:1]!=2'b10) | nand_130_cse);
  assign nor_294_nl = ~((COMP_LOOP_acc_14_psp_sva[0]) | (~((COMP_LOOP_acc_14_psp_sva[1])
      & (VEC_LOOP_j_10_0_sva_9_0[0]) & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]))));
  assign nor_295_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b101) | (fsm_output[6])
      | nand_138_cse);
  assign mux_369_nl = MUX_s_1_2_2(nor_294_nl, nor_295_nl, fsm_output[0]);
  assign mux_370_nl = MUX_s_1_2_2(nor_293_nl, mux_369_nl, fsm_output[1]);
  assign and_249_nl = (fsm_output[7]) & mux_370_nl;
  assign nor_296_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[1:0]!=2'b01) | nand_97_cse);
  assign nor_297_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b10) | not_tmp_147);
  assign nor_298_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]!=3'b101) | (fsm_output[6])
      | nand_138_cse);
  assign mux_366_nl = MUX_s_1_2_2(nor_297_nl, nor_298_nl, fsm_output[0]);
  assign mux_367_nl = MUX_s_1_2_2(nor_296_nl, mux_366_nl, fsm_output[1]);
  assign nor_299_nl = ~((~ (COMP_LOOP_acc_13_psp_sva[0])) | (fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[0]) | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[6]) | nand_138_cse);
  assign mux_368_nl = MUX_s_1_2_2(mux_367_nl, nor_299_nl, fsm_output[7]);
  assign mux_371_nl = MUX_s_1_2_2(and_249_nl, mux_368_nl, fsm_output[2]);
  assign nor_300_nl = ~((fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[2:1]!=2'b10) |
      (fsm_output[0]) | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[6]) | (fsm_output[3])
      | (fsm_output[4]));
  assign nor_301_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[1:0]!=2'b01) | nand_98_cse);
  assign nor_302_nl = ~((COMP_LOOP_acc_1_cse_sva[1:0]!=2'b01) | nand_99_cse);
  assign mux_362_nl = MUX_s_1_2_2(nor_301_nl, nor_302_nl, fsm_output[0]);
  assign nor_303_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b101) | (fsm_output[6])
      | nand_138_cse);
  assign nor_304_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b101) | (fsm_output[6])
      | nand_138_cse);
  assign mux_361_nl = MUX_s_1_2_2(nor_303_nl, nor_304_nl, fsm_output[0]);
  assign mux_363_nl = MUX_s_1_2_2(mux_362_nl, mux_361_nl, fsm_output[1]);
  assign mux_364_nl = MUX_s_1_2_2(nor_300_nl, mux_363_nl, fsm_output[7]);
  assign or_434_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[1]) | (~((COMP_LOOP_acc_10_cse_10_1_4_sva[2])
      & (COMP_LOOP_acc_10_cse_10_1_4_sva[0]) & (fsm_output[6]) & (fsm_output[3])
      & (fsm_output[4])));
  assign or_433_nl = (COMP_LOOP_acc_1_cse_4_sva[2:1]!=2'b10) | nand_133_cse;
  assign mux_359_nl = MUX_s_1_2_2(or_434_nl, or_433_nl, fsm_output[0]);
  assign or_431_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b101) | (fsm_output[6])
      | nand_138_cse;
  assign or_429_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b101) | (fsm_output[6]) |
      nand_138_cse;
  assign mux_358_nl = MUX_s_1_2_2(or_431_nl, or_429_nl, fsm_output[0]);
  assign mux_360_nl = MUX_s_1_2_2(mux_359_nl, mux_358_nl, fsm_output[1]);
  assign nor_305_nl = ~((fsm_output[7]) | mux_360_nl);
  assign mux_365_nl = MUX_s_1_2_2(mux_364_nl, nor_305_nl, fsm_output[2]);
  assign vec_rsc_0_5_i_we_d_pff = MUX_s_1_2_2(mux_371_nl, mux_365_nl, fsm_output[5]);
  assign nor_280_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b101) | (fsm_output[4:2]!=3'b000));
  assign nor_281_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b101) | (fsm_output[4:2]!=3'b000));
  assign mux_384_nl = MUX_s_1_2_2(nor_280_nl, nor_281_nl, fsm_output[0]);
  assign and_248_nl = (fsm_output[1]) & mux_384_nl;
  assign nor_282_nl = ~((~((COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b101) & COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm))
      | nand_137_cse);
  assign nor_283_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b101) | (fsm_output[0])
      | not_tmp_138);
  assign mux_383_nl = MUX_s_1_2_2(nor_282_nl, nor_283_nl, fsm_output[1]);
  assign mux_385_nl = MUX_s_1_2_2(and_248_nl, mux_383_nl, fsm_output[7]);
  assign nor_284_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b10) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[4:2]!=3'b000));
  assign nor_285_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b101) | (fsm_output[4:2]!=3'b000));
  assign mux_380_nl = MUX_s_1_2_2(nor_284_nl, nor_285_nl, fsm_output[0]);
  assign nor_286_nl = ~((~((fsm_output[0]) & (COMP_LOOP_acc_1_cse_4_sva[2:0]==3'b101)
      & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) | not_tmp_138);
  assign mux_381_nl = MUX_s_1_2_2(mux_380_nl, nor_286_nl, fsm_output[1]);
  assign nor_287_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b101) | (fsm_output[0])
      | not_tmp_138);
  assign nor_288_nl = ~((~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b101)
      | (~ (fsm_output[0])) | (fsm_output[2]) | nand_138_cse);
  assign mux_379_nl = MUX_s_1_2_2(nor_287_nl, nor_288_nl, fsm_output[1]);
  assign mux_382_nl = MUX_s_1_2_2(mux_381_nl, mux_379_nl, fsm_output[7]);
  assign mux_386_nl = MUX_s_1_2_2(mux_385_nl, mux_382_nl, fsm_output[6]);
  assign nor_289_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b101)
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (fsm_output[4:2]!=3'b000));
  assign nor_290_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b101) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_376_nl = MUX_s_1_2_2(nor_289_nl, nor_290_nl, fsm_output[1]);
  assign or_467_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b10) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | not_tmp_153;
  assign or_465_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:1]!=2'b10) | nand_126_cse;
  assign mux_375_nl = MUX_s_1_2_2(or_467_nl, or_465_nl, fsm_output[0]);
  assign nor_291_nl = ~((fsm_output[1]) | mux_375_nl);
  assign mux_377_nl = MUX_s_1_2_2(mux_376_nl, nor_291_nl, fsm_output[7]);
  assign or_462_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b101) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign or_461_nl = (VEC_LOOP_j_10_0_sva_9_0[1]) | (~ (COMP_LOOP_acc_13_psp_sva[0]))
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_153;
  assign or_459_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:1]!=2'b10) | nand_127_cse;
  assign mux_373_nl = MUX_s_1_2_2(or_461_nl, or_459_nl, fsm_output[0]);
  assign mux_374_nl = MUX_s_1_2_2(or_462_nl, mux_373_nl, fsm_output[1]);
  assign nor_292_nl = ~((fsm_output[7]) | mux_374_nl);
  assign mux_378_nl = MUX_s_1_2_2(mux_377_nl, nor_292_nl, fsm_output[6]);
  assign vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_386_nl,
      mux_378_nl, fsm_output[5]);
  assign nor_267_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]!=3'b110) | not_tmp_135);
  assign nor_268_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b11) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | not_tmp_134);
  assign nor_269_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b110) | (fsm_output[6])
      | nand_138_cse);
  assign mux_399_nl = MUX_s_1_2_2(nor_268_nl, nor_269_nl, fsm_output[0]);
  assign mux_400_nl = MUX_s_1_2_2(nor_267_nl, mux_399_nl, fsm_output[1]);
  assign and_247_nl = (fsm_output[7]) & mux_400_nl;
  assign nor_270_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[0]) | (~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:1]==2'b11)
      & (fsm_output[0]) & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]))));
  assign nor_271_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b11) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | not_tmp_134);
  assign nor_272_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]!=3'b110) | (fsm_output[6])
      | nand_138_cse);
  assign mux_396_nl = MUX_s_1_2_2(nor_271_nl, nor_272_nl, fsm_output[0]);
  assign mux_397_nl = MUX_s_1_2_2(nor_270_nl, mux_396_nl, fsm_output[1]);
  assign nor_273_nl = ~((~ (COMP_LOOP_acc_13_psp_sva[0])) | (fsm_output[1]) | (~
      (VEC_LOOP_j_10_0_sva_9_0[1])) | (fsm_output[0]) | (VEC_LOOP_j_10_0_sva_9_0[0])
      | (fsm_output[6]) | nand_138_cse);
  assign mux_398_nl = MUX_s_1_2_2(mux_397_nl, nor_273_nl, fsm_output[7]);
  assign mux_401_nl = MUX_s_1_2_2(and_247_nl, mux_398_nl, fsm_output[2]);
  assign nor_274_nl = ~((fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[2:1]!=2'b11) |
      (fsm_output[0]) | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[6]) | (fsm_output[3])
      | (fsm_output[4]));
  assign nor_275_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[0]) | (~((COMP_LOOP_acc_10_cse_10_1_sva[2:1]==2'b11)
      & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]))));
  assign nor_276_nl = ~((COMP_LOOP_acc_1_cse_sva[0]) | (~((COMP_LOOP_acc_1_cse_sva[2:1]==2'b11)
      & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]))));
  assign mux_392_nl = MUX_s_1_2_2(nor_275_nl, nor_276_nl, fsm_output[0]);
  assign nor_277_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b110) | (fsm_output[6])
      | nand_138_cse);
  assign nor_278_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b110) | (fsm_output[6])
      | nand_138_cse);
  assign mux_391_nl = MUX_s_1_2_2(nor_277_nl, nor_278_nl, fsm_output[0]);
  assign mux_393_nl = MUX_s_1_2_2(mux_392_nl, mux_391_nl, fsm_output[1]);
  assign mux_394_nl = MUX_s_1_2_2(nor_274_nl, mux_393_nl, fsm_output[7]);
  assign or_492_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b110) | not_tmp_134;
  assign or_490_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b110) | not_tmp_134;
  assign mux_389_nl = MUX_s_1_2_2(or_492_nl, or_490_nl, fsm_output[0]);
  assign or_488_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b110) | (fsm_output[6])
      | nand_138_cse;
  assign or_486_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b110) | (fsm_output[6]) |
      nand_138_cse;
  assign mux_388_nl = MUX_s_1_2_2(or_488_nl, or_486_nl, fsm_output[0]);
  assign mux_390_nl = MUX_s_1_2_2(mux_389_nl, mux_388_nl, fsm_output[1]);
  assign nor_279_nl = ~((fsm_output[7]) | mux_390_nl);
  assign mux_395_nl = MUX_s_1_2_2(mux_394_nl, nor_279_nl, fsm_output[2]);
  assign vec_rsc_0_6_i_we_d_pff = MUX_s_1_2_2(mux_401_nl, mux_395_nl, fsm_output[5]);
  assign nor_254_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b110) | (fsm_output[4:2]!=3'b000));
  assign nor_255_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b110) | (fsm_output[4:2]!=3'b000));
  assign mux_414_nl = MUX_s_1_2_2(nor_254_nl, nor_255_nl, fsm_output[0]);
  assign and_246_nl = (fsm_output[1]) & mux_414_nl;
  assign nor_256_nl = ~((~((COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b110) & COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm))
      | nand_137_cse);
  assign nor_257_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]!=3'b110) | (fsm_output[0])
      | not_tmp_138);
  assign mux_413_nl = MUX_s_1_2_2(nor_256_nl, nor_257_nl, fsm_output[1]);
  assign mux_415_nl = MUX_s_1_2_2(and_246_nl, mux_413_nl, fsm_output[7]);
  assign nor_258_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b110)
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (fsm_output[4:2]!=3'b000));
  assign nor_259_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b110) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_411_nl = MUX_s_1_2_2(nor_258_nl, nor_259_nl, fsm_output[1]);
  assign or_531_nl = (~((COMP_LOOP_acc_14_psp_sva[1:0]==2'b11) & COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm
      & (~ (VEC_LOOP_j_10_0_sva_9_0[0])))) | not_tmp_138;
  assign or_529_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]!=3'b110) | not_tmp_138;
  assign mux_410_nl = MUX_s_1_2_2(or_531_nl, or_529_nl, fsm_output[0]);
  assign nor_260_nl = ~((fsm_output[1]) | mux_410_nl);
  assign mux_412_nl = MUX_s_1_2_2(mux_411_nl, nor_260_nl, fsm_output[7]);
  assign mux_416_nl = MUX_s_1_2_2(mux_415_nl, mux_412_nl, fsm_output[5]);
  assign nor_261_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b11) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[4:2]!=3'b000));
  assign nor_262_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b110) | (fsm_output[4:2]!=3'b000));
  assign mux_406_nl = MUX_s_1_2_2(nor_261_nl, nor_262_nl, fsm_output[0]);
  assign nor_263_nl = ~((~((fsm_output[0]) & (COMP_LOOP_acc_1_cse_4_sva[2:0]==3'b110)
      & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) | not_tmp_138);
  assign mux_407_nl = MUX_s_1_2_2(mux_406_nl, nor_263_nl, fsm_output[1]);
  assign nor_264_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]!=3'b110) | (fsm_output[0])
      | not_tmp_138);
  assign nor_265_nl = ~((~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b110)
      | (~ (fsm_output[0])) | (fsm_output[2]) | nand_138_cse);
  assign mux_405_nl = MUX_s_1_2_2(nor_264_nl, nor_265_nl, fsm_output[1]);
  assign mux_408_nl = MUX_s_1_2_2(mux_407_nl, mux_405_nl, fsm_output[7]);
  assign or_518_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b110) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign or_517_nl = (~((VEC_LOOP_j_10_0_sva_9_0[1]) & (COMP_LOOP_acc_13_psp_sva[0])
      & COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm & (~ (VEC_LOOP_j_10_0_sva_9_0[0]))))
      | not_tmp_138;
  assign or_515_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]!=3'b110) | not_tmp_138;
  assign mux_403_nl = MUX_s_1_2_2(or_517_nl, or_515_nl, fsm_output[0]);
  assign mux_404_nl = MUX_s_1_2_2(or_518_nl, mux_403_nl, fsm_output[1]);
  assign nor_266_nl = ~((fsm_output[7]) | mux_404_nl);
  assign mux_409_nl = MUX_s_1_2_2(mux_408_nl, nor_266_nl, fsm_output[5]);
  assign vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_416_nl,
      mux_409_nl, fsm_output[6]);
  assign nor_247_nl = ~((~ (fsm_output[5])) | (fsm_output[1]) | (VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b111)
      | (fsm_output[6]) | (fsm_output[3]) | (fsm_output[4]));
  assign and_239_nl = (COMP_LOOP_acc_14_psp_sva[1:0]==2'b11) & (fsm_output[1]) &
      (VEC_LOOP_j_10_0_sva_9_0[0]) & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]);
  assign and_240_nl = (COMP_LOOP_acc_10_cse_10_1_sva[2:0]==3'b111) & (fsm_output[6])
      & (fsm_output[3]) & (fsm_output[4]);
  assign nor_248_nl = ~((~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]==3'b111) & (~ (fsm_output[6]))))
      | nand_138_cse);
  assign mux_428_nl = MUX_s_1_2_2(and_240_nl, nor_248_nl, fsm_output[1]);
  assign mux_429_nl = MUX_s_1_2_2(and_239_nl, mux_428_nl, fsm_output[5]);
  assign mux_430_nl = MUX_s_1_2_2(nor_247_nl, mux_429_nl, fsm_output[7]);
  assign and_242_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]==3'b111) & (fsm_output[6])
      & (fsm_output[3]) & (fsm_output[4]);
  assign nor_249_nl = ~((~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]==3'b111) & (~ (fsm_output[6]))))
      | nand_138_cse);
  assign mux_426_nl = MUX_s_1_2_2(and_242_nl, nor_249_nl, fsm_output[1]);
  assign and_243_nl = (COMP_LOOP_acc_1_cse_sva[2:0]==3'b111) & (fsm_output[6]) &
      (fsm_output[3]) & (fsm_output[4]);
  assign nor_250_nl = ~((~((COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b111) & (~ (fsm_output[6]))))
      | nand_138_cse);
  assign mux_425_nl = MUX_s_1_2_2(and_243_nl, nor_250_nl, fsm_output[1]);
  assign mux_427_nl = MUX_s_1_2_2(mux_426_nl, mux_425_nl, fsm_output[5]);
  assign and_241_nl = (fsm_output[7]) & mux_427_nl;
  assign mux_431_nl = MUX_s_1_2_2(mux_430_nl, and_241_nl, fsm_output[0]);
  assign and_244_nl = (COMP_LOOP_acc_11_psp_sva[1:0]==2'b11) & (fsm_output[1]) &
      (VEC_LOOP_j_10_0_sva_9_0[0]) & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]);
  assign and_245_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]==3'b111) & (fsm_output[6])
      & (fsm_output[3]) & (fsm_output[4]);
  assign nor_251_nl = ~((~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]==3'b111) & (~ (fsm_output[6]))))
      | nand_138_cse);
  assign mux_421_nl = MUX_s_1_2_2(and_245_nl, nor_251_nl, fsm_output[1]);
  assign mux_422_nl = MUX_s_1_2_2(and_244_nl, mux_421_nl, fsm_output[5]);
  assign nor_252_nl = ~((fsm_output[5]) | (~ (COMP_LOOP_acc_13_psp_sva[0])) | (fsm_output[1])
      | (VEC_LOOP_j_10_0_sva_9_0[1:0]!=2'b11) | (fsm_output[6]) | nand_138_cse);
  assign mux_423_nl = MUX_s_1_2_2(mux_422_nl, nor_252_nl, fsm_output[7]);
  assign nand_58_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]==3'b111) & (fsm_output[6])
      & (fsm_output[3]) & (fsm_output[4]));
  assign or_544_nl = (~((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]==3'b111) & (~ (fsm_output[6]))))
      | nand_138_cse;
  assign mux_419_nl = MUX_s_1_2_2(nand_58_nl, or_544_nl, fsm_output[1]);
  assign nand_60_nl = ~((COMP_LOOP_acc_1_cse_4_sva[2:0]==3'b111) & (fsm_output[6])
      & (fsm_output[3]) & (fsm_output[4]));
  assign or_542_nl = (~((COMP_LOOP_acc_1_cse_2_sva[2:0]==3'b111) & (~ (fsm_output[6]))))
      | nand_138_cse;
  assign mux_418_nl = MUX_s_1_2_2(nand_60_nl, or_542_nl, fsm_output[1]);
  assign mux_420_nl = MUX_s_1_2_2(mux_419_nl, mux_418_nl, fsm_output[5]);
  assign nor_253_nl = ~((fsm_output[7]) | mux_420_nl);
  assign mux_424_nl = MUX_s_1_2_2(mux_423_nl, nor_253_nl, fsm_output[0]);
  assign vec_rsc_0_7_i_we_d_pff = MUX_s_1_2_2(mux_431_nl, mux_424_nl, fsm_output[2]);
  assign nor_233_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b111) | (fsm_output[4:2]!=3'b000));
  assign nor_234_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b111) | (fsm_output[4:2]!=3'b000));
  assign mux_444_nl = MUX_s_1_2_2(nor_233_nl, nor_234_nl, fsm_output[0]);
  assign and_237_nl = (fsm_output[1]) & mux_444_nl;
  assign nor_235_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b11) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[4:2]!=3'b000));
  assign nor_236_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b111) | (fsm_output[4:2]!=3'b000));
  assign mux_442_nl = MUX_s_1_2_2(nor_235_nl, nor_236_nl, fsm_output[0]);
  assign nor_237_nl = ~((~((fsm_output[0]) & (COMP_LOOP_acc_1_cse_4_sva[2:0]==3'b111)
      & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) | not_tmp_138);
  assign mux_443_nl = MUX_s_1_2_2(mux_442_nl, nor_237_nl, fsm_output[1]);
  assign mux_445_nl = MUX_s_1_2_2(and_237_nl, mux_443_nl, fsm_output[6]);
  assign nor_238_nl = ~((~((COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b111) & COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm))
      | nand_137_cse);
  assign nor_239_nl = ~((~((COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]==3'b111) & (~ (fsm_output[0]))))
      | not_tmp_138);
  assign mux_440_nl = MUX_s_1_2_2(nor_238_nl, nor_239_nl, fsm_output[1]);
  assign nor_240_nl = ~((~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]==3'b111) & (~ (fsm_output[0]))))
      | not_tmp_138);
  assign nor_241_nl = ~((~(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm & (COMP_LOOP_acc_1_cse_sva[2:0]==3'b111)
      & (fsm_output[0]) & (~ (fsm_output[2])))) | nand_138_cse);
  assign mux_439_nl = MUX_s_1_2_2(nor_240_nl, nor_241_nl, fsm_output[1]);
  assign mux_441_nl = MUX_s_1_2_2(mux_440_nl, mux_439_nl, fsm_output[6]);
  assign mux_446_nl = MUX_s_1_2_2(mux_445_nl, mux_441_nl, fsm_output[7]);
  assign nor_242_nl = ~((~ (fsm_output[0])) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b111)
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (fsm_output[4:2]!=3'b000));
  assign nor_243_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]!=3'b111) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_436_nl = MUX_s_1_2_2(nor_242_nl, nor_243_nl, fsm_output[1]);
  assign nor_244_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b111) | (fsm_output[0])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign nor_245_nl = ~((~((VEC_LOOP_j_10_0_sva_9_0[1]) & (COMP_LOOP_acc_13_psp_sva[0])
      & COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)) | not_tmp_153);
  assign and_238_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]==3'b111) & (fsm_output[4:2]==3'b111);
  assign mux_434_nl = MUX_s_1_2_2(nor_245_nl, and_238_nl, fsm_output[0]);
  assign mux_435_nl = MUX_s_1_2_2(nor_244_nl, mux_434_nl, fsm_output[1]);
  assign mux_437_nl = MUX_s_1_2_2(mux_436_nl, mux_435_nl, fsm_output[6]);
  assign or_728_nl = (~((COMP_LOOP_acc_14_psp_sva[1:0]==2'b11) & COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm))
      | not_tmp_153;
  assign nand_51_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]==3'b111) & (fsm_output[4:2]==3'b111));
  assign mux_433_nl = MUX_s_1_2_2(or_728_nl, nand_51_nl, fsm_output[0]);
  assign nor_246_nl = ~((fsm_output[6]) | (fsm_output[1]) | mux_433_nl);
  assign mux_438_nl = MUX_s_1_2_2(mux_437_nl, nor_246_nl, fsm_output[7]);
  assign vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_446_nl,
      mux_438_nl, fsm_output[5]);
  assign COMP_LOOP_tmp_or_16_cse = and_dcpl_42 | and_dcpl_96;
  assign nl_COMP_LOOP_1_tmp_mul_nl = (z_out_1[6:0]) * COMP_LOOP_k_10_3_sva_6_0;
  assign COMP_LOOP_1_tmp_mul_nl = nl_COMP_LOOP_1_tmp_mul_nl[6:0];
  assign twiddle_rsc_0_0_i_radr_d = MUX1HOT_v_7_7_2(COMP_LOOP_1_tmp_mul_nl, (z_out_4[9:3]),
      (z_out_4[8:2]), (COMP_LOOP_5_tmp_mul_idiv_sva[7:1]), (COMP_LOOP_2_tmp_mul_idiv_sva[9:3]),
      (COMP_LOOP_3_tmp_lshift_ncse_sva[8:2]), (COMP_LOOP_2_tmp_lshift_ncse_sva[9:3]),
      {and_dcpl_39 , COMP_LOOP_tmp_or_16_cse , and_dcpl_95 , and_dcpl_97 , and_dcpl_98
      , and_dcpl_101 , and_dcpl_102});
  assign or_584_cse = (z_out_4[2:0]!=3'b000) | (fsm_output[3]);
  assign or_588_nl = (COMP_LOOP_3_tmp_lshift_ncse_sva[1:0]!=2'b00) | (~ (fsm_output[3]));
  assign or_586_nl = (COMP_LOOP_2_tmp_lshift_ncse_sva[2:0]!=3'b000) | (~ (fsm_output[3]));
  assign mux_452_nl = MUX_s_1_2_2(or_588_nl, or_586_nl, fsm_output[0]);
  assign mux_451_nl = MUX_s_1_2_2((fsm_output[3]), or_584_cse, fsm_output[0]);
  assign mux_453_nl = MUX_s_1_2_2(mux_452_nl, mux_451_nl, fsm_output[1]);
  assign or_583_nl = (z_out_4[1:0]!=2'b00) | (fsm_output[3]);
  assign mux_449_nl = MUX_s_1_2_2(or_583_nl, or_584_cse, fsm_output[0]);
  assign or_581_nl = (COMP_LOOP_5_tmp_mul_idiv_sva[0]) | (fsm_output[3]);
  assign or_580_nl = (COMP_LOOP_2_tmp_mul_idiv_sva[2:0]!=3'b000) | (fsm_output[3]);
  assign mux_448_nl = MUX_s_1_2_2(or_581_nl, or_580_nl, fsm_output[0]);
  assign mux_450_nl = MUX_s_1_2_2(mux_449_nl, mux_448_nl, fsm_output[1]);
  assign mux_454_nl = MUX_s_1_2_2(mux_453_nl, mux_450_nl, fsm_output[2]);
  assign twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d = (~ mux_454_nl) & and_dcpl_104;
  assign twiddle_rsc_0_1_i_radr_d_pff = z_out_4[9:3];
  assign nor_230_cse = ~((z_out_4[2:0]!=3'b001) | (fsm_output[3:2]!=2'b01));
  assign nor_229_nl = ~((z_out_4[2:0]!=3'b001) | (fsm_output[3:2]!=2'b10));
  assign mux_456_nl = MUX_s_1_2_2(nor_229_nl, nor_230_cse, fsm_output[0]);
  assign nor_232_nl = ~((z_out_4[2:0]!=3'b001) | (fsm_output[3:2]!=2'b00));
  assign mux_455_nl = MUX_s_1_2_2(nor_230_cse, nor_232_nl, fsm_output[0]);
  assign mux_457_nl = MUX_s_1_2_2(mux_456_nl, mux_455_nl, fsm_output[1]);
  assign twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d = mux_457_nl & and_dcpl_104;
  assign twiddle_rsc_0_2_i_radr_d_pff = MUX_v_7_2_2((z_out_4[9:3]), (z_out_4[8:2]),
      COMP_LOOP_tmp_or_7_cse);
  assign nor_226_cse = ~((z_out_4[2:0]!=3'b010) | (fsm_output[3]));
  assign nor_225_cse = ~((z_out_4[1:0]!=2'b01) | (fsm_output[3]));
  assign nor_223_nl = ~((fsm_output[0]) | (z_out_4[2:0]!=3'b010) | (~ (fsm_output[3])));
  assign nor_224_nl = ~((~ (fsm_output[0])) | (z_out_4[2:0]!=3'b010) | (fsm_output[3]));
  assign mux_461_nl = MUX_s_1_2_2(nor_223_nl, nor_224_nl, fsm_output[1]);
  assign mux_459_nl = MUX_s_1_2_2(nor_225_cse, nor_226_cse, fsm_output[0]);
  assign mux_458_nl = MUX_s_1_2_2(nor_226_cse, nor_225_cse, fsm_output[0]);
  assign mux_460_nl = MUX_s_1_2_2(mux_459_nl, mux_458_nl, fsm_output[1]);
  assign mux_462_nl = MUX_s_1_2_2(mux_461_nl, mux_460_nl, fsm_output[2]);
  assign twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d = mux_462_nl & and_dcpl_104;
  assign nor_220_cse = ~((z_out_4[2:0]!=3'b011) | (fsm_output[3:2]!=2'b01));
  assign nor_219_nl = ~((z_out_4[2:0]!=3'b011) | (fsm_output[3:2]!=2'b10));
  assign mux_464_nl = MUX_s_1_2_2(nor_219_nl, nor_220_cse, fsm_output[0]);
  assign nor_222_nl = ~((z_out_4[2:0]!=3'b011) | (fsm_output[3:2]!=2'b00));
  assign mux_463_nl = MUX_s_1_2_2(nor_220_cse, nor_222_nl, fsm_output[0]);
  assign mux_465_nl = MUX_s_1_2_2(mux_464_nl, mux_463_nl, fsm_output[1]);
  assign twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d = mux_465_nl & and_dcpl_104;
  assign twiddle_rsc_0_4_i_radr_d = MUX1HOT_v_7_6_2((z_out_4[9:3]), (z_out_4[8:2]),
      (COMP_LOOP_5_tmp_mul_idiv_sva[7:1]), (COMP_LOOP_2_tmp_mul_idiv_sva[9:3]), (COMP_LOOP_3_tmp_lshift_ncse_sva[8:2]),
      (COMP_LOOP_2_tmp_lshift_ncse_sva[9:3]), {COMP_LOOP_tmp_or_16_cse , and_dcpl_95
      , and_dcpl_97 , and_dcpl_98 , and_dcpl_101 , and_dcpl_102});
  assign nor_212_nl = ~((COMP_LOOP_3_tmp_lshift_ncse_sva[0]) | (~((COMP_LOOP_3_tmp_lshift_ncse_sva[1])
      & (fsm_output[3]))));
  assign nor_213_nl = ~((COMP_LOOP_2_tmp_lshift_ncse_sva[1:0]!=2'b00) | (~((COMP_LOOP_2_tmp_lshift_ncse_sva[2])
      & (fsm_output[3]))));
  assign mux_469_nl = MUX_s_1_2_2(nor_212_nl, nor_213_nl, fsm_output[0]);
  assign nor_214_nl = ~((~ (fsm_output[0])) | (z_out_4[2:0]!=3'b100) | (fsm_output[3]));
  assign mux_470_nl = MUX_s_1_2_2(mux_469_nl, nor_214_nl, fsm_output[1]);
  assign nor_215_nl = ~((z_out_4[1:0]!=2'b10) | (fsm_output[3]));
  assign nor_216_nl = ~((z_out_4[2:0]!=3'b100) | (fsm_output[3]));
  assign mux_467_nl = MUX_s_1_2_2(nor_215_nl, nor_216_nl, fsm_output[0]);
  assign nor_217_nl = ~((~ (COMP_LOOP_5_tmp_mul_idiv_sva[0])) | (fsm_output[3]));
  assign nor_218_nl = ~((COMP_LOOP_2_tmp_mul_idiv_sva[2:0]!=3'b100) | (fsm_output[3]));
  assign mux_466_nl = MUX_s_1_2_2(nor_217_nl, nor_218_nl, fsm_output[0]);
  assign mux_468_nl = MUX_s_1_2_2(mux_467_nl, mux_466_nl, fsm_output[1]);
  assign mux_471_nl = MUX_s_1_2_2(mux_470_nl, mux_468_nl, fsm_output[2]);
  assign twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d = mux_471_nl & and_dcpl_104;
  assign nor_209_cse = ~((z_out_4[2:0]!=3'b101) | (fsm_output[3:2]!=2'b01));
  assign nor_208_nl = ~((z_out_4[2:0]!=3'b101) | (fsm_output[3:2]!=2'b10));
  assign mux_473_nl = MUX_s_1_2_2(nor_208_nl, nor_209_cse, fsm_output[0]);
  assign nor_211_nl = ~((z_out_4[2:0]!=3'b101) | (fsm_output[3:2]!=2'b00));
  assign mux_472_nl = MUX_s_1_2_2(nor_209_cse, nor_211_nl, fsm_output[0]);
  assign mux_474_nl = MUX_s_1_2_2(mux_473_nl, mux_472_nl, fsm_output[1]);
  assign twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d = mux_474_nl & and_dcpl_104;
  assign nor_205_cse = ~((z_out_4[2:0]!=3'b110) | (fsm_output[3]));
  assign nor_204_cse = ~((z_out_4[1:0]!=2'b11) | (fsm_output[3]));
  assign nor_202_nl = ~((fsm_output[0]) | (z_out_4[2:0]!=3'b110) | (~ (fsm_output[3])));
  assign nor_203_nl = ~((~ (fsm_output[0])) | (z_out_4[2:0]!=3'b110) | (fsm_output[3]));
  assign mux_478_nl = MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output[1]);
  assign mux_476_nl = MUX_s_1_2_2(nor_204_cse, nor_205_cse, fsm_output[0]);
  assign mux_475_nl = MUX_s_1_2_2(nor_205_cse, nor_204_cse, fsm_output[0]);
  assign mux_477_nl = MUX_s_1_2_2(mux_476_nl, mux_475_nl, fsm_output[1]);
  assign mux_479_nl = MUX_s_1_2_2(mux_478_nl, mux_477_nl, fsm_output[2]);
  assign twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d = mux_479_nl & and_dcpl_104;
  assign and_235_cse = (z_out_4[2:0]==3'b111) & (fsm_output[3:2]==2'b01);
  assign and_nl = (z_out_4[2:0]==3'b111) & (fsm_output[3:2]==2'b10);
  assign mux_481_nl = MUX_s_1_2_2(and_nl, and_235_cse, fsm_output[0]);
  assign nor_201_nl = ~((z_out_4[2:0]!=3'b111) | (fsm_output[3:2]!=2'b00));
  assign mux_480_nl = MUX_s_1_2_2(and_235_cse, nor_201_nl, fsm_output[0]);
  assign mux_482_nl = MUX_s_1_2_2(mux_481_nl, mux_480_nl, fsm_output[1]);
  assign twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d = mux_482_nl & and_dcpl_104;
  assign and_dcpl_240 = (fsm_output==8'b11111011);
  assign and_dcpl_241 = ~((fsm_output[0]) | (fsm_output[5]));
  assign and_dcpl_242 = (~ (fsm_output[7])) & (fsm_output[1]);
  assign and_dcpl_243 = and_dcpl_242 & and_dcpl_241;
  assign and_dcpl_247 = and_dcpl_29 & and_dcpl_243;
  assign and_dcpl_248 = (fsm_output[0]) & (~ (fsm_output[5]));
  assign and_dcpl_249 = ~((fsm_output[7]) | (fsm_output[1]));
  assign and_dcpl_250 = and_dcpl_249 & and_dcpl_248;
  assign and_dcpl_253 = and_dcpl_150 & and_dcpl_250;
  assign and_dcpl_254 = (~ (fsm_output[0])) & (fsm_output[5]);
  assign and_dcpl_256 = and_dcpl_150 & and_dcpl_249 & and_dcpl_254;
  assign and_dcpl_257 = and_dcpl_242 & and_dcpl_248;
  assign and_dcpl_260 = and_dcpl_99 & (fsm_output[2]) & (fsm_output[6]);
  assign and_dcpl_261 = and_dcpl_260 & and_dcpl_257;
  assign and_dcpl_263 = and_dcpl_260 & and_dcpl_242 & and_dcpl_254;
  assign and_dcpl_264 = (fsm_output[7]) & (~ (fsm_output[1]));
  assign and_dcpl_268 = and_dcpl_156 & and_dcpl_264 & and_dcpl_248;
  assign and_dcpl_270 = and_dcpl_156 & and_dcpl_264 & and_dcpl_254;
  assign and_dcpl_271 = (fsm_output[7]) & (fsm_output[1]);
  assign and_dcpl_274 = and_dcpl_99 & (~ (fsm_output[2])) & (fsm_output[6]);
  assign and_dcpl_275 = and_dcpl_274 & and_dcpl_271 & and_dcpl_248;
  assign and_dcpl_277 = and_dcpl_274 & and_dcpl_271 & and_dcpl_254;
  assign and_dcpl_278 = and_dcpl_29 & and_dcpl_257;
  assign and_dcpl_280 = and_dcpl_94 & and_dcpl_250;
  assign and_dcpl_281 = and_dcpl_94 & and_dcpl_243;
  assign and_dcpl_282 = and_dcpl_249 & and_dcpl_241;
  assign and_dcpl_284 = and_dcpl_99 & nor_474_cse & and_dcpl_282;
  assign and_dcpl_285 = and_dcpl_94 & and_dcpl_282;
  assign and_dcpl_286 = and_dcpl_94 & and_dcpl_257;
  assign and_dcpl_300 = ~((fsm_output!=8'b00000010));
  assign and_dcpl_312 = and_dcpl_28 & (~ (fsm_output[2])) & (~ (fsm_output[6]));
  assign and_437_cse = and_dcpl_312 & and_dcpl_242 & and_230_cse;
  assign and_dcpl_316 = and_dcpl_28 & (~ (fsm_output[2])) & (fsm_output[6]);
  assign and_441_cse = and_dcpl_316 & and_dcpl_242 & and_dcpl_241;
  assign and_443_cse = and_dcpl_316 & and_dcpl_249 & and_230_cse;
  assign and_446_cse = and_dcpl_312 & and_dcpl_264 & and_dcpl_241;
  assign and_452_cse = and_dcpl_63 & and_dcpl_271 & and_dcpl_248;
  assign and_455_cse = and_dcpl_63 & and_dcpl_271 & (~ (fsm_output[0])) & (fsm_output[5]);
  assign and_459_cse = and_532_cse & (fsm_output[2]) & (fsm_output[6]) & and_dcpl_264
      & and_dcpl_248;
  assign and_dcpl_377 = and_dcpl_28 & and_dcpl_62 & and_dcpl_249 & and_dcpl_241;
  assign COMP_LOOP_tmp_or_15_ssc = and_dcpl_253 | and_dcpl_256 | and_dcpl_261 | and_dcpl_263
      | and_dcpl_268 | and_dcpl_270 | and_dcpl_275 | and_dcpl_277;
  assign COMP_LOOP_tmp_nor_24_itm = ~(and_dcpl_247 | and_dcpl_278 | and_dcpl_280
      | and_dcpl_281 | and_dcpl_284 | and_dcpl_285 | and_dcpl_286);
  assign COMP_LOOP_tmp_or_31_itm = and_dcpl_280 | and_dcpl_281 | and_dcpl_284;
  assign COMP_LOOP_tmp_nor_25_itm = ~(and_dcpl_247 | and_dcpl_285 | and_dcpl_286);
  assign COMP_LOOP_tmp_or_35_itm = and_dcpl_278 | and_dcpl_280 | and_dcpl_281 | and_dcpl_284;
  assign COMP_LOOP_tmp_or_37_itm = and_dcpl_285 | and_dcpl_286;
  assign COMP_LOOP_or_9_itm = and_437_cse | and_441_cse | and_443_cse | and_446_cse
      | and_452_cse | and_455_cse | and_459_cse;
  always @(posedge clk) begin
    if ( (and_dcpl_29 & and_dcpl_26) | STAGE_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1010, z_out_5, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_nl, and_531_nl, fsm_output[5]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_0_7_obj_ld_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      COMP_LOOP_3_tmp_mul_idiv_sva_1_0 <= 2'b00;
    end
    else begin
      reg_vec_rsc_triosy_0_7_obj_ld_cse <= and_dcpl_117 & (fsm_output[6]) & (~ (fsm_output[0]))
          & (~ (fsm_output[1])) & (fsm_output[7]) & (fsm_output[5]) & (~ (z_out_2[4]));
      reg_ensig_cgo_cse <= ~ mux_496_itm;
      COMP_LOOP_3_tmp_mul_idiv_sva_1_0 <= z_out_4[1:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_0_sva_9_0 <= 10'b0000000000;
    end
    else if ( VEC_LOOP_j_10_0_sva_9_0_mx0c0 | (and_dcpl_71 & and_dcpl_88) ) begin
      VEC_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (z_out_3[9:0]), VEC_LOOP_j_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_194_nl, and_264_nl, fsm_output[5]) ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(or_743_nl, nand_155_nl, fsm_output[7]) ) begin
      COMP_LOOP_k_10_3_sva_6_0 <= MUX_v_7_2_2(7'b0000000, reg_COMP_LOOP_k_10_3_ftd,
          nand_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva <= 10'b0000000000;
    end
    else if ( ~ or_dcpl_52 ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva <= COMP_LOOP_1_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_52 ) begin
      COMP_LOOP_acc_psp_sva <= nl_COMP_LOOP_acc_psp_sva[6:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_5_tmp_mul_idiv_sva <= 8'b00000000;
    end
    else if ( ~ or_dcpl_52 ) begin
      COMP_LOOP_5_tmp_mul_idiv_sva <= z_out_4[7:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_52 ) begin
      COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm <= z_out_3[10];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_52 ) begin
      COMP_LOOP_1_tmp_acc_cse_sva <= z_out_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_86_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_145_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_30_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_60_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_32_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_33_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_34_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_nor_4_itm <= 1'b0;
    end
    else if ( mux_529_itm ) begin
      COMP_LOOP_COMP_LOOP_and_86_itm <= (COMP_LOOP_acc_1_cse_4_sva_1[2:0]==3'b011);
      COMP_LOOP_COMP_LOOP_and_145_itm <= (COMP_LOOP_acc_1_cse_6_sva_1[2:0]==3'b110);
      COMP_LOOP_COMP_LOOP_and_30_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[2:0]==3'b011);
      COMP_LOOP_COMP_LOOP_and_60_itm <= (COMP_LOOP_acc_11_psp_sva_1[1]) & (VEC_LOOP_j_10_0_sva_9_0[0])
          & (~ (COMP_LOOP_acc_11_psp_sva_1[0]));
      COMP_LOOP_COMP_LOOP_and_32_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[2:0]==3'b101);
      COMP_LOOP_COMP_LOOP_and_33_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[2:0]==3'b110);
      COMP_LOOP_COMP_LOOP_and_34_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[2:0]==3'b111);
      COMP_LOOP_COMP_LOOP_nor_4_itm <= ~((COMP_LOOP_acc_1_cse_2_sva_1[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_1_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_11_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_12_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_13_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_69_itm <= 1'b0;
    end
    else if ( COMP_LOOP_or_14_cse ) begin
      COMP_LOOP_COMP_LOOP_nor_1_itm <= MUX_s_1_2_2(COMP_LOOP_COMP_LOOP_nor_1_nl,
          COMP_LOOP_COMP_LOOP_nor_9_nl, and_dcpl_42);
      COMP_LOOP_COMP_LOOP_and_11_itm <= MUX_s_1_2_2(COMP_LOOP_COMP_LOOP_and_11_nl,
          COMP_LOOP_COMP_LOOP_and_65_nl, and_dcpl_42);
      COMP_LOOP_COMP_LOOP_and_12_itm <= MUX_s_1_2_2(COMP_LOOP_COMP_LOOP_and_12_nl,
          COMP_LOOP_COMP_LOOP_and_67_nl, and_dcpl_42);
      COMP_LOOP_COMP_LOOP_and_13_itm <= MUX_s_1_2_2(COMP_LOOP_COMP_LOOP_and_13_nl,
          COMP_LOOP_COMP_LOOP_and_68_nl, and_dcpl_42);
      COMP_LOOP_COMP_LOOP_and_69_itm <= MUX_s_1_2_2(COMP_LOOP_COMP_LOOP_and_9_nl,
          COMP_LOOP_COMP_LOOP_and_69_nl, and_dcpl_42);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_6_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_tmp_523, and_140_nl, fsm_output[5]) ) begin
      COMP_LOOP_acc_1_cse_6_sva <= COMP_LOOP_acc_1_cse_6_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_4_sva <= 10'b0000000000;
    end
    else if ( ~(mux_536_nl & (~ (fsm_output[7]))) ) begin
      COMP_LOOP_acc_1_cse_4_sva <= COMP_LOOP_acc_1_cse_4_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_11_psp_sva <= 9'b000000000;
    end
    else if ( mux_540_nl | (fsm_output[7]) ) begin
      COMP_LOOP_acc_11_psp_sva <= COMP_LOOP_acc_11_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_2_sva <= 10'b0000000000;
    end
    else if ( ~(mux_541_nl & nor_441_cse) ) begin
      COMP_LOOP_acc_1_cse_2_sva <= COMP_LOOP_acc_1_cse_2_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_2_sva <= 10'b0000000000;
    end
    else if ( ~(mux_542_nl & nor_441_cse) ) begin
      COMP_LOOP_acc_10_cse_10_1_2_sva <= COMP_LOOP_2_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( ~((or_tmp_617 | or_dcpl_53) & nor_441_cse) ) begin
      COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_3_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_5_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_138 ) begin
      COMP_LOOP_COMP_LOOP_nor_5_itm <= ~((COMP_LOOP_2_acc_10_itm_10_1_1[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_37_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_138 ) begin
      COMP_LOOP_COMP_LOOP_and_37_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[2:0]==3'b011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_39_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_138 ) begin
      COMP_LOOP_COMP_LOOP_and_39_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[2:0]==3'b101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_40_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_138 ) begin
      COMP_LOOP_COMP_LOOP_and_40_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[2:0]==3'b110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_41_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_138 ) begin
      COMP_LOOP_COMP_LOOP_and_41_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_3_sva <= 10'b0000000000;
    end
    else if ( mux_545_nl | (fsm_output[7]) ) begin
      COMP_LOOP_acc_10_cse_10_1_3_sva <= readslicef_11_10_1(COMP_LOOP_3_acc_10_nl);
    end
  end
  always @(posedge clk) begin
    if ( mux_547_nl | (fsm_output[7]) ) begin
      COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm <= readslicef_9_1_8(COMP_LOOP_acc_12_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_4_sva <= 10'b0000000000;
    end
    else if ( ~(mux_548_nl & (~ (fsm_output[7]))) ) begin
      COMP_LOOP_acc_10_cse_10_1_4_sva <= COMP_LOOP_4_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_549_nl & (~ (fsm_output[7]))) ) begin
      COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_5_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_13_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_143 ) begin
      COMP_LOOP_COMP_LOOP_nor_13_itm <= ~((COMP_LOOP_4_acc_10_itm_10_1_1[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_93_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_143 ) begin
      COMP_LOOP_COMP_LOOP_and_93_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[2:0]==3'b011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_95_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_143 ) begin
      COMP_LOOP_COMP_LOOP_and_95_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[2:0]==3'b101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_96_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_143 ) begin
      COMP_LOOP_COMP_LOOP_and_96_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[2:0]==3'b110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_97_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_143 ) begin
      COMP_LOOP_COMP_LOOP_and_97_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_13_psp_sva <= 8'b00000000;
    end
    else if ( MUX_s_1_2_2(mux_552_nl, (fsm_output[7]), fsm_output[5]) ) begin
      COMP_LOOP_acc_13_psp_sva <= nl_COMP_LOOP_acc_13_psp_sva[7:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_5_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_554_nl, (fsm_output[7]), fsm_output[5]) ) begin
      COMP_LOOP_acc_10_cse_10_1_5_sva <= COMP_LOOP_5_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_557_nl, (fsm_output[7]), fsm_output[5]) ) begin
      COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_6_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_17_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_144 ) begin
      COMP_LOOP_COMP_LOOP_nor_17_itm <= ~((COMP_LOOP_5_acc_10_itm_10_1_1[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_121_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_144 ) begin
      COMP_LOOP_COMP_LOOP_and_121_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[2:0]==3'b011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_123_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_144 ) begin
      COMP_LOOP_COMP_LOOP_and_123_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[2:0]==3'b101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_124_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_144 ) begin
      COMP_LOOP_COMP_LOOP_and_124_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[2:0]==3'b110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_125_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_144 ) begin
      COMP_LOOP_COMP_LOOP_and_125_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_6_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_tmp_523, and_155_nl, fsm_output[5]) ) begin
      COMP_LOOP_acc_10_cse_10_1_6_sva <= COMP_LOOP_6_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_tmp_523, and_156_nl, fsm_output[5]) ) begin
      COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_7_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_21_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_149_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_151_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_152_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_153_itm <= 1'b0;
    end
    else if ( mux_564_itm ) begin
      COMP_LOOP_COMP_LOOP_nor_21_itm <= ~((COMP_LOOP_6_acc_10_itm_10_1_1[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_149_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[2:0]==3'b011);
      COMP_LOOP_COMP_LOOP_and_151_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[2:0]==3'b101);
      COMP_LOOP_COMP_LOOP_and_152_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[2:0]==3'b110);
      COMP_LOOP_COMP_LOOP_and_153_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_14_psp_sva <= 9'b000000000;
    end
    else if ( MUX_s_1_2_2(mux_566_nl, nor_tmp_29, fsm_output[5]) ) begin
      COMP_LOOP_acc_14_psp_sva <= nl_COMP_LOOP_acc_14_psp_sva[8:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_7_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_569_nl, nor_tmp_29, fsm_output[5]) ) begin
      COMP_LOOP_acc_10_cse_10_1_7_sva <= COMP_LOOP_7_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( mux_573_itm ) begin
      COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm <= readslicef_8_1_7(COMP_LOOP_acc_15_nl);
      reg_COMP_LOOP_k_10_3_ftd <= z_out_2[6:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_25_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_177_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_179_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_180_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_181_itm <= 1'b0;
    end
    else if ( mux_575_itm ) begin
      COMP_LOOP_COMP_LOOP_nor_25_itm <= ~((COMP_LOOP_7_acc_10_itm_10_1_1[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_177_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[2:0]==3'b011);
      COMP_LOOP_COMP_LOOP_and_179_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[2:0]==3'b101);
      COMP_LOOP_COMP_LOOP_and_180_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[2:0]==3'b110);
      COMP_LOOP_COMP_LOOP_and_181_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_329, and_158_nl, fsm_output[5]) ) begin
      COMP_LOOP_acc_1_cse_sva <= nl_COMP_LOOP_acc_1_cse_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_329, and_215_nl, fsm_output[5]) ) begin
      COMP_LOOP_acc_10_cse_10_1_sva <= COMP_LOOP_8_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(not_tmp_329, and_159_nl, fsm_output[5]) ) begin
      COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_1_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_29_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_205_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_207_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_208_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_209_itm <= 1'b0;
    end
    else if ( mux_580_itm ) begin
      COMP_LOOP_COMP_LOOP_nor_29_itm <= ~((COMP_LOOP_8_acc_10_itm_10_1_1[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_205_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[2:0]==3'b011);
      COMP_LOOP_COMP_LOOP_and_207_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[2:0]==3'b101);
      COMP_LOOP_COMP_LOOP_and_208_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[2:0]==3'b110);
      COMP_LOOP_COMP_LOOP_and_209_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_2_tmp_mul_idiv_sva <= 10'b0000000000;
    end
    else if ( and_dcpl_42 | and_dcpl_96 | and_dcpl_97 ) begin
      COMP_LOOP_2_tmp_mul_idiv_sva <= z_out_4[9:0];
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_51 | (fsm_output[1:0]!=2'b11) | or_dcpl_46) ) begin
      tmp_16_sva <= twiddle_rsc_0_0_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_2_tmp_lshift_ncse_sva <= 10'b0000000000;
    end
    else if ( and_dcpl_42 | and_dcpl_101 ) begin
      COMP_LOOP_2_tmp_lshift_ncse_sva <= MUX_v_10_2_2(z_out_1, (z_out_4[9:0]), and_dcpl_101);
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_42 | and_dcpl_95 | and_dcpl_148 | COMP_LOOP_1_acc_8_itm_mx0c3 |
        COMP_LOOP_1_acc_8_itm_mx0c4 | and_dcpl_48 | and_dcpl_120 | COMP_LOOP_1_acc_8_itm_mx0c7
        | and_dcpl_53 | and_dcpl_121 | COMP_LOOP_1_acc_8_itm_mx0c10 | and_dcpl_56
        | and_dcpl_122 | COMP_LOOP_1_acc_8_itm_mx0c13 | and_dcpl_59 | and_dcpl_123
        | COMP_LOOP_1_acc_8_itm_mx0c16 | and_dcpl_66 | and_dcpl_124 | COMP_LOOP_1_acc_8_itm_mx0c19
        | and_dcpl_69 | and_dcpl_125 | COMP_LOOP_1_acc_8_itm_mx0c22 | and_dcpl_74
        | and_dcpl_126 | COMP_LOOP_1_acc_8_itm_mx0c25 ) begin
      COMP_LOOP_1_acc_8_itm <= MUX1HOT_v_64_12_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
          vec_rsc_0_2_i_q_d, vec_rsc_0_3_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_5_i_q_d,
          vec_rsc_0_6_i_q_d, vec_rsc_0_7_i_q_d, COMP_LOOP_acc_17_nl, twiddle_rsc_0_5_i_q_d,
          z_out_4, COMP_LOOP_1_modulo_cmp_return_rsc_z, {COMP_LOOP_or_nl , COMP_LOOP_or_1_nl
          , COMP_LOOP_or_2_nl , COMP_LOOP_or_3_nl , COMP_LOOP_or_4_nl , COMP_LOOP_or_5_nl
          , COMP_LOOP_or_6_nl , COMP_LOOP_or_7_nl , COMP_LOOP_or_12_nl , and_dcpl_148
          , COMP_LOOP_or_13_nl , COMP_LOOP_1_acc_8_itm_mx0c4});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_nor_2_itm <= 1'b0;
    end
    else if ( COMP_LOOP_tmp_or_2_cse ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm <= (z_out_4[2:0]==3'b011);
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm <= (z_out_4[2:0]==3'b101);
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm <= (z_out_4[2:0]==3'b110);
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm <= (z_out_4[2:0]==3'b111);
      COMP_LOOP_tmp_COMP_LOOP_tmp_nor_2_itm <= ~((z_out_4[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_3_tmp_lshift_ncse_sva <= 9'b000000000;
    end
    else if ( COMP_LOOP_tmp_or_7_cse ) begin
      COMP_LOOP_3_tmp_lshift_ncse_sva <= MUX_v_9_2_2((z_out_1[8:0]), (z_out_4[8:0]),
          and_dcpl_98);
    end
  end
  always @(posedge clk) begin
    if ( ~((~ mux_608_nl) & nor_441_cse) ) begin
      COMP_LOOP_tmp_mux1h_itm <= COMP_LOOP_tmp_mux1h_itm_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( mux_614_nl | (fsm_output[7]) ) begin
      COMP_LOOP_tmp_mux1h_1_itm <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_2_i_q_d,
          twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_6_i_q_d, {and_184_nl , and_187_nl
          , and_190_nl , and_193_nl});
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_617_nl & (~ (fsm_output[7]))) ) begin
      COMP_LOOP_tmp_mux1h_2_itm <= COMP_LOOP_tmp_mux1h_itm_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_619_nl, (fsm_output[7]), fsm_output[5]) ) begin
      COMP_LOOP_tmp_mux_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_4_i_q_d,
          and_202_nl);
    end
  end
  always @(posedge clk) begin
    if ( ~((~((~ COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm) | COMP_LOOP_tmp_COMP_LOOP_tmp_nor_2_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_rgt | COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_rgt
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_rgt | COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm
        | and_dcpl_148 | and_dcpl_101)) | mux_623_nl) ) begin
      tmp_21_sva_3 <= MUX1HOT_v_64_9_2(twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_6_i_q_d,
          twiddle_rsc_0_0_i_q_d, tmp_23_sva_1, tmp_23_sva_2, twiddle_rsc_0_4_i_q_d,
          COMP_LOOP_1_acc_8_itm, tmp_21_sva_6, tmp_21_sva_7, {and_dcpl_148 , and_dcpl_101
          , COMP_LOOP_tmp_and_11_nl , COMP_LOOP_tmp_and_12_nl , COMP_LOOP_tmp_and_13_nl
          , COMP_LOOP_tmp_and_14_nl , COMP_LOOP_tmp_and_15_nl , COMP_LOOP_tmp_and_16_nl
          , COMP_LOOP_tmp_and_17_nl});
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm ) begin
      tmp_21_sva_6 <= twiddle_rsc_0_6_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm ) begin
      tmp_21_sva_7 <= twiddle_rsc_0_7_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( ~((~((~(COMP_LOOP_tmp_COMP_LOOP_tmp_and_35 | COMP_LOOP_tmp_COMP_LOOP_tmp_and_37))
        | COMP_LOOP_tmp_COMP_LOOP_tmp_nor_2_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm | and_dcpl_98)) | mux_626_nl) )
        begin
      COMP_LOOP_tmp_mux1h_3_itm <= MUX1HOT_v_64_8_2(twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_2_i_q_d,
          twiddle_rsc_0_0_i_q_d, tmp_21_sva_3, twiddle_rsc_0_4_i_q_d, COMP_LOOP_1_acc_8_itm,
          tmp_21_sva_6, tmp_21_sva_7, {COMP_LOOP_tmp_and_18_nl , COMP_LOOP_tmp_and_19_nl
          , COMP_LOOP_tmp_and_5_nl , COMP_LOOP_tmp_and_6_nl , COMP_LOOP_tmp_and_7_nl
          , COMP_LOOP_tmp_and_8_nl , COMP_LOOP_tmp_and_9_nl , COMP_LOOP_tmp_and_10_nl});
    end
  end
  always @(posedge clk) begin
    if ( (COMP_LOOP_tmp_COMP_LOOP_tmp_nor_6_cse | ((COMP_LOOP_3_tmp_lshift_ncse_sva[1:0]==2'b10))
        | ((COMP_LOOP_3_tmp_lshift_ncse_sva[1:0]==2'b11)) | and_dcpl_101) & mux_630_nl
        ) begin
      COMP_LOOP_tmp_mux1h_4_itm <= MUX1HOT_v_64_4_2(twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_0_i_q_d,
          twiddle_rsc_0_4_i_q_d, tmp_21_sva_3, {and_dcpl_101 , COMP_LOOP_tmp_and_nl
          , COMP_LOOP_tmp_and_2_nl , COMP_LOOP_tmp_and_3_nl});
    end
  end
  always @(posedge clk) begin
    if ( (COMP_LOOP_2_tmp_lshift_ncse_sva[2:0]==3'b001) ) begin
      tmp_23_sva_1 <= twiddle_rsc_0_1_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( (COMP_LOOP_2_tmp_lshift_ncse_sva[2:0]==3'b010) ) begin
      tmp_23_sva_2 <= twiddle_rsc_0_2_i_q_d;
    end
  end
  assign nor_nl = ~((fsm_output[7]) | (fsm_output[1]) | (fsm_output[0]) | (fsm_output[6])
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]));
  assign and_531_nl = (fsm_output[7]) & nor_tmp_64;
  assign VEC_LOOP_j_not_1_nl = ~ VEC_LOOP_j_10_0_sva_9_0_mx0c0;
  assign nor_194_nl = ~((fsm_output[7]) | (fsm_output[1]) | (fsm_output[6]) | (fsm_output[2])
      | (fsm_output[3]) | (fsm_output[4]));
  assign and_264_nl = (fsm_output[7]) & (fsm_output[6]) & (fsm_output[2]) & (fsm_output[4])
      & (fsm_output[3]);
  assign nor_438_nl = ~((fsm_output[7]) | (fsm_output[1]) | (fsm_output[6]) | (fsm_output[4])
      | (fsm_output[3]));
  assign and_262_nl = (fsm_output[7]) & (fsm_output[1]) & (fsm_output[6]) & (fsm_output[4])
      & (fsm_output[3]);
  assign mux_196_nl = MUX_s_1_2_2(nor_438_nl, and_262_nl, fsm_output[5]);
  assign nand_nl = ~(mux_196_nl & (~ (fsm_output[2])) & (fsm_output[0]));
  assign or_742_nl = (fsm_output[5]) | (~ (fsm_output[1]));
  assign mux_632_nl = MUX_s_1_2_2(or_742_nl, (fsm_output[5]), fsm_output[2]);
  assign or_743_nl = (fsm_output[6]) | (fsm_output[3]) | (fsm_output[4]) | mux_632_nl;
  assign nand_154_nl = ~((fsm_output[5]) & (~((fsm_output[1:0]==2'b11))));
  assign mux_nl = MUX_s_1_2_2(nand_154_nl, (fsm_output[5]), fsm_output[2]);
  assign mux_631_nl = MUX_s_1_2_2((fsm_output[5]), (~ mux_nl), and_532_cse);
  assign nand_155_nl = ~((fsm_output[6]) & mux_631_nl);
  assign nl_COMP_LOOP_acc_psp_sva  = (VEC_LOOP_j_10_0_sva_9_0[9:3]) + COMP_LOOP_k_10_3_sva_6_0;
  assign COMP_LOOP_COMP_LOOP_nor_1_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b000));
  assign COMP_LOOP_COMP_LOOP_nor_9_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b000));
  assign COMP_LOOP_COMP_LOOP_and_11_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[2:0]==3'b101);
  assign COMP_LOOP_COMP_LOOP_and_65_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]==3'b011);
  assign COMP_LOOP_COMP_LOOP_and_12_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[2:0]==3'b110);
  assign COMP_LOOP_COMP_LOOP_and_67_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]==3'b101);
  assign COMP_LOOP_COMP_LOOP_and_13_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[2:0]==3'b111);
  assign COMP_LOOP_COMP_LOOP_and_68_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]==3'b110);
  assign COMP_LOOP_COMP_LOOP_and_9_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[2:0]==3'b011);
  assign COMP_LOOP_COMP_LOOP_and_69_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]==3'b111);
  assign and_140_nl = (fsm_output[7]) & mux_tmp_522;
  assign mux_536_nl = MUX_s_1_2_2(or_tmp_616, (~ nor_tmp_64), fsm_output[5]);
  assign mux_539_nl = MUX_s_1_2_2(and_dcpl_29, mux_tmp_527, fsm_output[1]);
  assign mux_540_nl = MUX_s_1_2_2(mux_539_nl, (fsm_output[6]), fsm_output[5]);
  assign nand_151_nl = ~((fsm_output[4:0]==5'b11111));
  assign mux_541_nl = MUX_s_1_2_2(or_tmp_621, nand_151_nl, fsm_output[5]);
  assign nand_35_nl = ~((fsm_output[4:1]==4'b1111));
  assign mux_542_nl = MUX_s_1_2_2(or_tmp_621, nand_35_nl, fsm_output[5]);
  assign nl_COMP_LOOP_3_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + conv_u2s_10_11({COMP_LOOP_k_10_3_sva_6_0 , 3'b010}) + 11'b00000000001;
  assign COMP_LOOP_3_acc_nl = nl_COMP_LOOP_3_acc_nl[10:0];
  assign nl_COMP_LOOP_3_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b010}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_3_acc_10_nl = nl_COMP_LOOP_3_acc_10_nl[10:0];
  assign mux_543_nl = MUX_s_1_2_2(and_dcpl_29, mux_tmp_526, fsm_output[0]);
  assign mux_544_nl = MUX_s_1_2_2(mux_543_nl, mux_tmp_527, fsm_output[1]);
  assign mux_545_nl = MUX_s_1_2_2(mux_544_nl, (fsm_output[6]), fsm_output[5]);
  assign nl_COMP_LOOP_acc_12_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:3]))})
      + conv_u2u_8_9({COMP_LOOP_k_10_3_sva_6_0 , 1'b0}) + 9'b000000001;
  assign COMP_LOOP_acc_12_nl = nl_COMP_LOOP_acc_12_nl[8:0];
  assign mux_546_nl = MUX_s_1_2_2(and_dcpl_29, and_dcpl_35, and_263_cse);
  assign mux_547_nl = MUX_s_1_2_2(mux_546_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_548_nl = MUX_s_1_2_2(or_tmp_616, (~ and_dcpl_35), fsm_output[5]);
  assign nl_COMP_LOOP_5_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + conv_u2s_10_11({COMP_LOOP_k_10_3_sva_6_0 , 3'b100}) + 11'b00000000001;
  assign COMP_LOOP_5_acc_nl = nl_COMP_LOOP_5_acc_nl[10:0];
  assign nand_34_nl = ~((fsm_output[1]) & (fsm_output[6]) & (fsm_output[2]) & (fsm_output[3])
      & (fsm_output[4]));
  assign mux_549_nl = MUX_s_1_2_2(or_tmp_616, nand_34_nl, fsm_output[5]);
  assign nl_COMP_LOOP_acc_13_psp_sva  = (VEC_LOOP_j_10_0_sva_9_0[9:2]) + ({COMP_LOOP_k_10_3_sva_6_0
      , 1'b1});
  assign mux_552_nl = MUX_s_1_2_2((~ or_tmp_616), or_tmp_620, fsm_output[7]);
  assign mux_554_nl = MUX_s_1_2_2((~ or_tmp_616), mux_tmp_522, fsm_output[7]);
  assign nl_COMP_LOOP_6_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + conv_u2s_10_11({COMP_LOOP_k_10_3_sva_6_0 , 3'b101}) + 11'b00000000001;
  assign COMP_LOOP_6_acc_nl = nl_COMP_LOOP_6_acc_nl[10:0];
  assign mux_556_nl = MUX_s_1_2_2((fsm_output[6]), or_tmp_620, or_731_cse);
  assign mux_557_nl = MUX_s_1_2_2((~ or_tmp_616), mux_556_nl, fsm_output[7]);
  assign mux_559_nl = MUX_s_1_2_2(or_tmp_620, or_tmp_25, fsm_output[1]);
  assign and_155_nl = (fsm_output[7]) & mux_559_nl;
  assign nl_COMP_LOOP_7_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + conv_u2s_10_11({COMP_LOOP_k_10_3_sva_6_0 , 3'b110}) + 11'b00000000001;
  assign COMP_LOOP_7_acc_nl = nl_COMP_LOOP_7_acc_nl[10:0];
  assign and_156_nl = (fsm_output[7]) & or_tmp_620;
  assign nl_COMP_LOOP_acc_14_psp_sva  = (VEC_LOOP_j_10_0_sva_9_0[9:1]) + ({COMP_LOOP_k_10_3_sva_6_0
      , 2'b11});
  assign mux_566_nl = MUX_s_1_2_2((~ or_tmp_616), mux_tmp_554, fsm_output[7]);
  assign mux_569_nl = MUX_s_1_2_2((~ or_tmp_616), mux_tmp_557, fsm_output[7]);
  assign nl_COMP_LOOP_acc_15_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:4]))})
      + conv_u2u_7_8(COMP_LOOP_k_10_3_sva_6_0) + 8'b00000001;
  assign COMP_LOOP_acc_15_nl = nl_COMP_LOOP_acc_15_nl[7:0];
  assign nl_COMP_LOOP_acc_1_cse_sva  = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_3_sva_6_0
      , 3'b111});
  assign and_158_nl = (fsm_output[7]) & mux_tmp_557;
  assign and_215_nl = (fsm_output[7]) & (fsm_output[6]) & (fsm_output[3]) & (fsm_output[4]);
  assign nl_COMP_LOOP_1_acc_nl = ({z_out_2 , 3'b000}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + 11'b00000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[10:0];
  assign and_159_nl = (fsm_output[7]) & mux_tmp_554;
  assign COMP_LOOP_COMP_LOOP_mux_8_nl = MUX_v_64_2_2(COMP_LOOP_1_acc_8_itm, z_out_8,
      COMP_LOOP_or_9_itm);
  assign nl_COMP_LOOP_acc_17_nl = COMP_LOOP_mux_95_cse + COMP_LOOP_COMP_LOOP_mux_8_nl;
  assign COMP_LOOP_acc_17_nl = nl_COMP_LOOP_acc_17_nl[63:0];
  assign COMP_LOOP_or_nl = (COMP_LOOP_COMP_LOOP_nor_1_itm & and_dcpl_42) | (COMP_LOOP_COMP_LOOP_nor_4_itm
      & and_dcpl_48) | (COMP_LOOP_COMP_LOOP_and_34_itm & and_dcpl_53) | (COMP_LOOP_COMP_LOOP_and_33_itm
      & and_dcpl_56) | (COMP_LOOP_COMP_LOOP_and_32_itm & and_dcpl_59) | (COMP_LOOP_COMP_LOOP_and_60_itm
      & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_30_itm & and_dcpl_69) | (COMP_LOOP_COMP_LOOP_and_145_itm
      & and_dcpl_74);
  assign COMP_LOOP_or_1_nl = ((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]==3'b001) & and_dcpl_42)
      | (COMP_LOOP_COMP_LOOP_and_86_itm & and_dcpl_48) | (COMP_LOOP_COMP_LOOP_nor_4_itm
      & and_dcpl_53) | (COMP_LOOP_COMP_LOOP_and_34_itm & and_dcpl_56) | (COMP_LOOP_COMP_LOOP_and_33_itm
      & and_dcpl_59) | (COMP_LOOP_COMP_LOOP_and_32_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_60_itm
      & and_dcpl_69) | (COMP_LOOP_COMP_LOOP_and_30_itm & and_dcpl_74);
  assign COMP_LOOP_or_2_nl = ((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]==3'b010) & and_dcpl_42)
      | (COMP_LOOP_COMP_LOOP_and_145_itm & and_dcpl_48) | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_53) | (COMP_LOOP_COMP_LOOP_nor_4_itm & and_dcpl_56) | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_59) | (COMP_LOOP_COMP_LOOP_and_33_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_32_itm
      & and_dcpl_69) | (COMP_LOOP_COMP_LOOP_and_60_itm & and_dcpl_74);
  assign COMP_LOOP_or_3_nl = (COMP_LOOP_COMP_LOOP_and_69_itm & and_dcpl_42) | (COMP_LOOP_COMP_LOOP_and_30_itm
      & and_dcpl_48) | (COMP_LOOP_COMP_LOOP_and_145_itm & and_dcpl_53) | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_56) | (COMP_LOOP_COMP_LOOP_nor_4_itm & and_dcpl_59) | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_33_itm & and_dcpl_69) | (COMP_LOOP_COMP_LOOP_and_32_itm
      & and_dcpl_74);
  assign COMP_LOOP_or_4_nl = ((COMP_LOOP_acc_10_cse_10_1_1_sva[2:0]==3'b100) & and_dcpl_42)
      | (COMP_LOOP_COMP_LOOP_and_60_itm & and_dcpl_48) | (COMP_LOOP_COMP_LOOP_and_30_itm
      & and_dcpl_53) | (COMP_LOOP_COMP_LOOP_and_145_itm & and_dcpl_56) | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_59) | (COMP_LOOP_COMP_LOOP_nor_4_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_69) | (COMP_LOOP_COMP_LOOP_and_33_itm & and_dcpl_74);
  assign COMP_LOOP_or_5_nl = (COMP_LOOP_COMP_LOOP_and_11_itm & and_dcpl_42) | (COMP_LOOP_COMP_LOOP_and_32_itm
      & and_dcpl_48) | (COMP_LOOP_COMP_LOOP_and_60_itm & and_dcpl_53) | (COMP_LOOP_COMP_LOOP_and_30_itm
      & and_dcpl_56) | (COMP_LOOP_COMP_LOOP_and_145_itm & and_dcpl_59) | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_nor_4_itm & and_dcpl_69) | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_74);
  assign COMP_LOOP_or_6_nl = (COMP_LOOP_COMP_LOOP_and_12_itm & and_dcpl_42) | (COMP_LOOP_COMP_LOOP_and_33_itm
      & and_dcpl_48) | (COMP_LOOP_COMP_LOOP_and_32_itm & and_dcpl_53) | (COMP_LOOP_COMP_LOOP_and_60_itm
      & and_dcpl_56) | (COMP_LOOP_COMP_LOOP_and_30_itm & and_dcpl_59) | (COMP_LOOP_COMP_LOOP_and_145_itm
      & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_86_itm & and_dcpl_69) | (COMP_LOOP_COMP_LOOP_nor_4_itm
      & and_dcpl_74);
  assign COMP_LOOP_or_7_nl = (COMP_LOOP_COMP_LOOP_and_13_itm & and_dcpl_42) | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_48) | (COMP_LOOP_COMP_LOOP_and_33_itm & and_dcpl_53) | (COMP_LOOP_COMP_LOOP_and_32_itm
      & and_dcpl_56) | (COMP_LOOP_COMP_LOOP_and_60_itm & and_dcpl_59) | (COMP_LOOP_COMP_LOOP_and_30_itm
      & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_145_itm & and_dcpl_69) | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_74);
  assign COMP_LOOP_or_12_nl = and_dcpl_95 | and_dcpl_120 | and_dcpl_121 | and_dcpl_122
      | and_dcpl_123 | and_dcpl_124 | and_dcpl_125 | and_dcpl_126;
  assign COMP_LOOP_or_13_nl = COMP_LOOP_1_acc_8_itm_mx0c3 | COMP_LOOP_1_acc_8_itm_mx0c7
      | COMP_LOOP_1_acc_8_itm_mx0c10 | COMP_LOOP_1_acc_8_itm_mx0c13 | COMP_LOOP_1_acc_8_itm_mx0c16
      | COMP_LOOP_1_acc_8_itm_mx0c19 | COMP_LOOP_1_acc_8_itm_mx0c22 | COMP_LOOP_1_acc_8_itm_mx0c25;
  assign nor_477_nl = ~((or_731_cse & (fsm_output[2])) | (fsm_output[4:3]!=2'b00));
  assign mux_608_nl = MUX_s_1_2_2(nor_477_nl, (fsm_output[4]), fsm_output[5]);
  assign and_184_nl = and_dcpl_168 & and_dcpl_165 & (COMP_LOOP_3_tmp_mul_idiv_sva_1_0==2'b00);
  assign and_187_nl = and_dcpl_168 & and_dcpl_165 & (COMP_LOOP_3_tmp_mul_idiv_sva_1_0==2'b01);
  assign and_190_nl = and_dcpl_168 & and_dcpl_165 & (COMP_LOOP_3_tmp_mul_idiv_sva_1_0==2'b10);
  assign and_193_nl = and_dcpl_168 & and_dcpl_165 & (COMP_LOOP_3_tmp_mul_idiv_sva_1_0==2'b11);
  assign mux_612_nl = MUX_s_1_2_2(and_dcpl_28, (fsm_output[4]), fsm_output[6]);
  assign mux_610_nl = MUX_s_1_2_2((~ or_tmp_617), (fsm_output[4]), fsm_output[6]);
  assign mux_609_nl = MUX_s_1_2_2((~ or_tmp_617), or_tmp_649, fsm_output[6]);
  assign mux_611_nl = MUX_s_1_2_2(mux_610_nl, mux_609_nl, fsm_output[0]);
  assign mux_613_nl = MUX_s_1_2_2(mux_612_nl, mux_611_nl, fsm_output[1]);
  assign mux_614_nl = MUX_s_1_2_2(mux_613_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_616_nl = MUX_s_1_2_2(or_tmp_38, or_dcpl_51, and_263_cse);
  assign and_210_nl = (fsm_output[6]) & (fsm_output[4]);
  assign mux_615_nl = MUX_s_1_2_2(and_210_nl, and_tmp_15, fsm_output[1]);
  assign mux_617_nl = MUX_s_1_2_2(mux_616_nl, (~ mux_615_nl), fsm_output[5]);
  assign and_202_nl = and_dcpl_167 & (~ (fsm_output[6])) & (COMP_LOOP_5_tmp_mul_idiv_sva[0])
      & and_dcpl_41;
  assign or_734_nl = (fsm_output[6]) | (fsm_output[4]);
  assign mux_618_nl = MUX_s_1_2_2(or_734_nl, or_tmp_651, or_731_cse);
  assign mux_619_nl = MUX_s_1_2_2((~ or_tmp_38), mux_618_nl, fsm_output[7]);
  assign COMP_LOOP_tmp_and_11_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_nor_2_itm & and_203_m1c;
  assign COMP_LOOP_tmp_and_12_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_rgt & and_203_m1c;
  assign COMP_LOOP_tmp_and_13_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_rgt & and_203_m1c;
  assign COMP_LOOP_tmp_and_14_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_rgt & and_203_m1c;
  assign COMP_LOOP_tmp_and_15_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm & and_203_m1c;
  assign COMP_LOOP_tmp_and_16_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm & and_203_m1c;
  assign COMP_LOOP_tmp_and_17_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm & and_203_m1c;
  assign mux_622_nl = MUX_s_1_2_2(or_tmp_651, or_tmp_38, and_263_cse);
  assign or_725_nl = (fsm_output[7]) | mux_622_nl;
  assign mux_621_nl = MUX_s_1_2_2(and_tmp_15, and_tmp_16, fsm_output[1]);
  assign nand_31_nl = ~((fsm_output[7]) & mux_621_nl);
  assign mux_623_nl = MUX_s_1_2_2(or_725_nl, nand_31_nl, fsm_output[5]);
  assign COMP_LOOP_tmp_and_18_nl = (~ (COMP_LOOP_2_tmp_mul_idiv_sva[1])) & and_dcpl_98;
  assign COMP_LOOP_tmp_and_19_nl = (COMP_LOOP_2_tmp_mul_idiv_sva[1]) & and_dcpl_98;
  assign COMP_LOOP_tmp_and_5_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_nor_2_itm & and_dcpl_101;
  assign COMP_LOOP_tmp_and_6_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm & and_dcpl_101;
  assign COMP_LOOP_tmp_and_7_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_39 & and_dcpl_101;
  assign COMP_LOOP_tmp_and_8_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm & and_dcpl_101;
  assign COMP_LOOP_tmp_and_9_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_itm & and_dcpl_101;
  assign COMP_LOOP_tmp_and_10_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_itm & and_dcpl_101;
  assign mux_624_nl = MUX_s_1_2_2(or_tmp_651, or_tmp_38, or_731_cse);
  assign mux_625_nl = MUX_s_1_2_2(mux_624_nl, (~ (fsm_output[6])), fsm_output[7]);
  assign nand_30_nl = ~((fsm_output[7]) & or_tmp_651);
  assign mux_626_nl = MUX_s_1_2_2(mux_625_nl, nand_30_nl, fsm_output[5]);
  assign COMP_LOOP_tmp_and_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_nor_6_cse & and_dcpl_102;
  assign COMP_LOOP_tmp_and_2_nl = (COMP_LOOP_3_tmp_lshift_ncse_sva[1:0]==2'b10) &
      and_dcpl_102;
  assign COMP_LOOP_tmp_and_3_nl = (COMP_LOOP_3_tmp_lshift_ncse_sva[1:0]==2'b11) &
      and_dcpl_102;
  assign mux_628_nl = MUX_s_1_2_2(or_tmp_651, or_tmp_38, fsm_output[1]);
  assign mux_627_nl = MUX_s_1_2_2(and_tmp_15, and_tmp_16, and_263_cse);
  assign mux_629_nl = MUX_s_1_2_2((~ mux_628_nl), mux_627_nl, fsm_output[7]);
  assign mux_630_nl = MUX_s_1_2_2(mux_629_nl, nor_tmp_29, fsm_output[5]);
  assign and_533_nl = (fsm_output==8'b11111100);
  assign COMP_LOOP_mux_92_nl = MUX_v_7_2_2(COMP_LOOP_k_10_3_sva_6_0, ({3'b001 , (~
      z_out_5)}), and_533_nl);
  assign nl_z_out_2 = conv_u2u_7_8(COMP_LOOP_mux_92_nl) + 8'b00000001;
  assign z_out_2 = nl_z_out_2[7:0];
  assign COMP_LOOP_mux_93_nl = MUX_v_11_2_2(({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))}),
      STAGE_LOOP_lshift_psp_sva, and_dcpl_240);
  assign COMP_LOOP_COMP_LOOP_nand_1_nl = ~(and_dcpl_240 & (~(and_dcpl_28 & nor_474_cse
      & (~ (fsm_output[7])) & (fsm_output[1]) & and_dcpl_241)));
  assign COMP_LOOP_mux_94_nl = MUX_v_10_2_2(({COMP_LOOP_k_10_3_sva_6_0 , 3'b001}),
      VEC_LOOP_j_10_0_sva_9_0, and_dcpl_240);
  assign nl_acc_1_nl = ({COMP_LOOP_mux_93_nl , COMP_LOOP_COMP_LOOP_nand_1_nl}) +
      conv_u2u_11_12({COMP_LOOP_mux_94_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[11:0];
  assign z_out_3 = readslicef_12_11_1(acc_1_nl);
  assign COMP_LOOP_tmp_mux1h_52_nl = MUX1HOT_v_54_8_2((tmp_16_sva[63:10]), (COMP_LOOP_tmp_mux1h_itm[63:10]),
      (COMP_LOOP_tmp_mux1h_1_itm[63:10]), (COMP_LOOP_tmp_mux1h_2_itm[63:10]), (COMP_LOOP_tmp_mux_itm[63:10]),
      (COMP_LOOP_tmp_mux1h_3_itm[63:10]), (COMP_LOOP_tmp_mux1h_4_itm[63:10]), (tmp_21_sva_3[63:10]),
      {and_dcpl_253 , and_dcpl_256 , and_dcpl_261 , and_dcpl_263 , and_dcpl_268 ,
      and_dcpl_270 , and_dcpl_275 , and_dcpl_277});
  assign COMP_LOOP_tmp_and_28_nl = MUX_v_54_2_2(54'b000000000000000000000000000000000000000000000000000000,
      COMP_LOOP_tmp_mux1h_52_nl, COMP_LOOP_tmp_nor_24_itm);
  assign COMP_LOOP_tmp_mux1h_53_nl = MUX1HOT_s_1_10_2((tmp_16_sva[9]), (COMP_LOOP_tmp_mux1h_itm[9]),
      (COMP_LOOP_tmp_mux1h_1_itm[9]), (COMP_LOOP_tmp_mux1h_2_itm[9]), (COMP_LOOP_tmp_mux_itm[9]),
      (COMP_LOOP_tmp_mux1h_3_itm[9]), (COMP_LOOP_tmp_mux1h_4_itm[9]), (tmp_21_sva_3[9]),
      (z_out_1[9]), (COMP_LOOP_2_tmp_lshift_ncse_sva[9]), {and_dcpl_253 , and_dcpl_256
      , and_dcpl_261 , and_dcpl_263 , and_dcpl_268 , and_dcpl_270 , and_dcpl_275
      , and_dcpl_277 , and_dcpl_278 , COMP_LOOP_tmp_or_31_itm});
  assign COMP_LOOP_tmp_and_29_nl = COMP_LOOP_tmp_mux1h_53_nl & COMP_LOOP_tmp_nor_25_itm;
  assign COMP_LOOP_tmp_or_40_nl = and_dcpl_278 | and_dcpl_285;
  assign COMP_LOOP_tmp_mux1h_54_nl = MUX1HOT_v_9_12_2(({1'b0 , (z_out[7:0])}), (tmp_16_sva[8:0]),
      (COMP_LOOP_tmp_mux1h_itm[8:0]), (COMP_LOOP_tmp_mux1h_1_itm[8:0]), (COMP_LOOP_tmp_mux1h_2_itm[8:0]),
      (COMP_LOOP_tmp_mux_itm[8:0]), (COMP_LOOP_tmp_mux1h_3_itm[8:0]), (COMP_LOOP_tmp_mux1h_4_itm[8:0]),
      (tmp_21_sva_3[8:0]), (z_out_1[8:0]), (COMP_LOOP_2_tmp_lshift_ncse_sva[8:0]),
      COMP_LOOP_3_tmp_lshift_ncse_sva, {and_dcpl_247 , and_dcpl_253 , and_dcpl_256
      , and_dcpl_261 , and_dcpl_263 , and_dcpl_268 , and_dcpl_270 , and_dcpl_275
      , and_dcpl_277 , COMP_LOOP_tmp_or_40_nl , COMP_LOOP_tmp_or_31_itm , and_dcpl_286});
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_93_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[63])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_94_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[62])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_95_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[61])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_96_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[60])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_97_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[59])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_98_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[58])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_99_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[57])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_100_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[56])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_101_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[55])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_102_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[54])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_103_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[53])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_104_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[52])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_105_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[51])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_106_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[50])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_107_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[49])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_108_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[48])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_109_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[47])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_110_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[46])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_111_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[45])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_112_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[44])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_113_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[43])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_114_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[42])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_115_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[41])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_116_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[40])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_117_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[39])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_118_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[38])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_119_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[37])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_120_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[36])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_121_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[35])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_122_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[34])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_123_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[33])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_124_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[32])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_125_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[31])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_126_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[30])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_127_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[29])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_128_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[28])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_129_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[27])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_130_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[26])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_131_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[25])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_132_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[24])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_133_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[23])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_134_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[22])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_135_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[21])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_136_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[20])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_137_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[19])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_138_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[18])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_139_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[17])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_140_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[16])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_141_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[15])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_142_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[14])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_143_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[13])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_144_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[12])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_145_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[11])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_146_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[10])
      & COMP_LOOP_tmp_nor_24_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_mux_12_nl = MUX_s_1_2_2((COMP_LOOP_1_modulo_cmp_return_rsc_z[9]),
      (COMP_LOOP_k_10_3_sva_6_0[6]), COMP_LOOP_tmp_or_35_itm);
  assign COMP_LOOP_tmp_and_30_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_mux_12_nl & COMP_LOOP_tmp_nor_25_itm;
  assign COMP_LOOP_tmp_mux1h_55_nl = MUX1HOT_v_6_4_2(({1'b0 , (COMP_LOOP_k_10_3_sva_6_0[6:2])}),
      (COMP_LOOP_1_modulo_cmp_return_rsc_z[8:3]), (COMP_LOOP_k_10_3_sva_6_0[5:0]),
      (COMP_LOOP_k_10_3_sva_6_0[6:1]), {and_dcpl_247 , COMP_LOOP_tmp_or_15_ssc ,
      COMP_LOOP_tmp_or_35_itm , COMP_LOOP_tmp_or_37_itm});
  assign COMP_LOOP_tmp_mux1h_56_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_10_3_sva_6_0[1]),
      (COMP_LOOP_1_modulo_cmp_return_rsc_z[2]), (COMP_LOOP_k_10_3_sva_6_0[0]), {and_dcpl_247
      , COMP_LOOP_tmp_or_15_ssc , COMP_LOOP_tmp_or_37_itm});
  assign COMP_LOOP_tmp_or_41_nl = (COMP_LOOP_tmp_mux1h_56_nl & (~(and_dcpl_278 |
      and_dcpl_280))) | and_dcpl_281 | and_dcpl_284;
  assign COMP_LOOP_tmp_mux_8_nl = MUX_s_1_2_2((COMP_LOOP_k_10_3_sva_6_0[0]), (COMP_LOOP_1_modulo_cmp_return_rsc_z[1]),
      COMP_LOOP_tmp_or_15_ssc);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_or_3_nl = (COMP_LOOP_tmp_mux_8_nl & (~(and_dcpl_278
      | and_dcpl_281 | and_dcpl_285))) | and_dcpl_280 | and_dcpl_284 | and_dcpl_286;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_or_4_nl = (COMP_LOOP_1_modulo_cmp_return_rsc_z[0])
      | and_dcpl_247 | and_dcpl_278 | and_dcpl_280 | and_dcpl_281 | and_dcpl_284
      | and_dcpl_285 | and_dcpl_286;
  assign nl_z_out_4 = ({COMP_LOOP_tmp_and_28_nl , COMP_LOOP_tmp_and_29_nl , COMP_LOOP_tmp_mux1h_54_nl})
      * ({COMP_LOOP_tmp_COMP_LOOP_tmp_and_93_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_94_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_95_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_96_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_97_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_98_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_99_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_100_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_101_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_102_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_103_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_104_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_105_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_106_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_107_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_108_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_109_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_110_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_111_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_112_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_113_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_114_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_115_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_116_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_117_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_118_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_119_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_120_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_121_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_122_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_123_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_124_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_125_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_126_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_127_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_128_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_129_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_130_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_131_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_132_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_133_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_134_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_135_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_136_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_137_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_138_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_139_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_140_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_141_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_142_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_143_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_144_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_and_145_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_146_nl
      , COMP_LOOP_tmp_and_30_nl , COMP_LOOP_tmp_mux1h_55_nl , COMP_LOOP_tmp_or_41_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_or_3_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_or_4_nl});
  assign z_out_4 = nl_z_out_4[63:0];
  assign STAGE_LOOP_mux_4_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (~ STAGE_LOOP_i_3_0_sva),
      and_dcpl_300);
  assign nl_z_out_5 = STAGE_LOOP_mux_4_nl + ({1'b1 , (~ and_dcpl_300) , 2'b11});
  assign z_out_5 = nl_z_out_5[3:0];
  assign COMP_LOOP_mux_95_cse = MUX_v_64_2_2(z_out_8, COMP_LOOP_1_acc_8_itm, COMP_LOOP_or_9_itm);
  assign COMP_LOOP_mux1h_178_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_86_itm,
      COMP_LOOP_COMP_LOOP_nor_5_itm, COMP_LOOP_COMP_LOOP_nor_1_itm, COMP_LOOP_COMP_LOOP_nor_13_itm,
      COMP_LOOP_COMP_LOOP_nor_17_itm, COMP_LOOP_COMP_LOOP_nor_21_itm, COMP_LOOP_COMP_LOOP_nor_25_itm,
      COMP_LOOP_COMP_LOOP_nor_29_itm, {and_dcpl_377 , and_437_cse , and_441_cse ,
      and_443_cse , and_446_cse , and_452_cse , and_455_cse , and_459_cse});
  assign COMP_LOOP_COMP_LOOP_and_210_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]==3'b001);
  assign COMP_LOOP_COMP_LOOP_and_211_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]==3'b001);
  assign COMP_LOOP_COMP_LOOP_and_212_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]==3'b001);
  assign COMP_LOOP_COMP_LOOP_and_213_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]==3'b001);
  assign COMP_LOOP_COMP_LOOP_and_214_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]==3'b001);
  assign COMP_LOOP_COMP_LOOP_and_215_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]==3'b001);
  assign COMP_LOOP_COMP_LOOP_and_216_nl = (COMP_LOOP_acc_10_cse_10_1_sva[2:0]==3'b001);
  assign COMP_LOOP_mux1h_179_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_145_itm,
      COMP_LOOP_COMP_LOOP_and_210_nl, COMP_LOOP_COMP_LOOP_and_211_nl, COMP_LOOP_COMP_LOOP_and_212_nl,
      COMP_LOOP_COMP_LOOP_and_213_nl, COMP_LOOP_COMP_LOOP_and_214_nl, COMP_LOOP_COMP_LOOP_and_215_nl,
      COMP_LOOP_COMP_LOOP_and_216_nl, {and_dcpl_377 , and_437_cse , and_441_cse ,
      and_443_cse , and_446_cse , and_452_cse , and_455_cse , and_459_cse});
  assign COMP_LOOP_COMP_LOOP_and_217_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]==3'b010);
  assign COMP_LOOP_COMP_LOOP_and_218_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]==3'b010);
  assign COMP_LOOP_COMP_LOOP_and_219_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]==3'b010);
  assign COMP_LOOP_COMP_LOOP_and_220_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]==3'b010);
  assign COMP_LOOP_COMP_LOOP_and_221_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]==3'b010);
  assign COMP_LOOP_COMP_LOOP_and_222_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]==3'b010);
  assign COMP_LOOP_COMP_LOOP_and_223_nl = (COMP_LOOP_acc_10_cse_10_1_sva[2:0]==3'b010);
  assign COMP_LOOP_mux1h_180_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_30_itm,
      COMP_LOOP_COMP_LOOP_and_217_nl, COMP_LOOP_COMP_LOOP_and_218_nl, COMP_LOOP_COMP_LOOP_and_219_nl,
      COMP_LOOP_COMP_LOOP_and_220_nl, COMP_LOOP_COMP_LOOP_and_221_nl, COMP_LOOP_COMP_LOOP_and_222_nl,
      COMP_LOOP_COMP_LOOP_and_223_nl, {and_dcpl_377 , and_437_cse , and_441_cse ,
      and_443_cse , and_446_cse , and_452_cse , and_455_cse , and_459_cse});
  assign COMP_LOOP_mux1h_181_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_60_itm,
      COMP_LOOP_COMP_LOOP_and_37_itm, COMP_LOOP_COMP_LOOP_and_11_itm, COMP_LOOP_COMP_LOOP_and_93_itm,
      COMP_LOOP_COMP_LOOP_and_121_itm, COMP_LOOP_COMP_LOOP_and_149_itm, COMP_LOOP_COMP_LOOP_and_177_itm,
      COMP_LOOP_COMP_LOOP_and_205_itm, {and_dcpl_377 , and_437_cse , and_441_cse
      , and_443_cse , and_446_cse , and_452_cse , and_455_cse , and_459_cse});
  assign COMP_LOOP_COMP_LOOP_and_224_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2:0]==3'b100);
  assign COMP_LOOP_COMP_LOOP_and_225_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]==3'b100);
  assign COMP_LOOP_COMP_LOOP_and_226_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]==3'b100);
  assign COMP_LOOP_COMP_LOOP_and_227_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2:0]==3'b100);
  assign COMP_LOOP_COMP_LOOP_and_228_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[2:0]==3'b100);
  assign COMP_LOOP_COMP_LOOP_and_229_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2:0]==3'b100);
  assign COMP_LOOP_COMP_LOOP_and_230_nl = (COMP_LOOP_acc_10_cse_10_1_sva[2:0]==3'b100);
  assign COMP_LOOP_mux1h_182_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_32_itm,
      COMP_LOOP_COMP_LOOP_and_224_nl, COMP_LOOP_COMP_LOOP_and_225_nl, COMP_LOOP_COMP_LOOP_and_226_nl,
      COMP_LOOP_COMP_LOOP_and_227_nl, COMP_LOOP_COMP_LOOP_and_228_nl, COMP_LOOP_COMP_LOOP_and_229_nl,
      COMP_LOOP_COMP_LOOP_and_230_nl, {and_dcpl_377 , and_437_cse , and_441_cse ,
      and_443_cse , and_446_cse , and_452_cse , and_455_cse , and_459_cse});
  assign COMP_LOOP_mux1h_183_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_33_itm,
      COMP_LOOP_COMP_LOOP_and_39_itm, COMP_LOOP_COMP_LOOP_and_12_itm, COMP_LOOP_COMP_LOOP_and_95_itm,
      COMP_LOOP_COMP_LOOP_and_123_itm, COMP_LOOP_COMP_LOOP_and_151_itm, COMP_LOOP_COMP_LOOP_and_179_itm,
      COMP_LOOP_COMP_LOOP_and_207_itm, {and_dcpl_377 , and_437_cse , and_441_cse
      , and_443_cse , and_446_cse , and_452_cse , and_455_cse , and_459_cse});
  assign COMP_LOOP_mux1h_184_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_34_itm,
      COMP_LOOP_COMP_LOOP_and_40_itm, COMP_LOOP_COMP_LOOP_and_13_itm, COMP_LOOP_COMP_LOOP_and_96_itm,
      COMP_LOOP_COMP_LOOP_and_124_itm, COMP_LOOP_COMP_LOOP_and_152_itm, COMP_LOOP_COMP_LOOP_and_180_itm,
      COMP_LOOP_COMP_LOOP_and_208_itm, {and_dcpl_377 , and_437_cse , and_441_cse
      , and_443_cse , and_446_cse , and_452_cse , and_455_cse , and_459_cse});
  assign COMP_LOOP_mux1h_185_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_nor_4_itm,
      COMP_LOOP_COMP_LOOP_and_41_itm, COMP_LOOP_COMP_LOOP_and_69_itm, COMP_LOOP_COMP_LOOP_and_97_itm,
      COMP_LOOP_COMP_LOOP_and_125_itm, COMP_LOOP_COMP_LOOP_and_153_itm, COMP_LOOP_COMP_LOOP_and_181_itm,
      COMP_LOOP_COMP_LOOP_and_209_itm, {and_dcpl_377 , and_437_cse , and_441_cse
      , and_443_cse , and_446_cse , and_452_cse , and_455_cse , and_459_cse});
  assign z_out_8 = MUX1HOT_v_64_8_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, vec_rsc_0_2_i_q_d,
      vec_rsc_0_3_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_5_i_q_d, vec_rsc_0_6_i_q_d,
      vec_rsc_0_7_i_q_d, {COMP_LOOP_mux1h_178_nl , COMP_LOOP_mux1h_179_nl , COMP_LOOP_mux1h_180_nl
      , COMP_LOOP_mux1h_181_nl , COMP_LOOP_mux1h_182_nl , COMP_LOOP_mux1h_183_nl
      , COMP_LOOP_mux1h_184_nl , COMP_LOOP_mux1h_185_nl});

  function automatic [0:0] MUX1HOT_s_1_10_2;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [9:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    MUX1HOT_s_1_10_2 = result;
  end
  endfunction


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


  function automatic [0:0] MUX1HOT_s_1_8_2;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [7:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    MUX1HOT_s_1_8_2 = result;
  end
  endfunction


  function automatic [53:0] MUX1HOT_v_54_8_2;
    input [53:0] input_7;
    input [53:0] input_6;
    input [53:0] input_5;
    input [53:0] input_4;
    input [53:0] input_3;
    input [53:0] input_2;
    input [53:0] input_1;
    input [53:0] input_0;
    input [7:0] sel;
    reg [53:0] result;
  begin
    result = input_0 & {54{sel[0]}};
    result = result | ( input_1 & {54{sel[1]}});
    result = result | ( input_2 & {54{sel[2]}});
    result = result | ( input_3 & {54{sel[3]}});
    result = result | ( input_4 & {54{sel[4]}});
    result = result | ( input_5 & {54{sel[5]}});
    result = result | ( input_6 & {54{sel[6]}});
    result = result | ( input_7 & {54{sel[7]}});
    MUX1HOT_v_54_8_2 = result;
  end
  endfunction


  function automatic [63:0] MUX1HOT_v_64_12_2;
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
    input [11:0] sel;
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
    MUX1HOT_v_64_12_2 = result;
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


  function automatic [63:0] MUX1HOT_v_64_9_2;
    input [63:0] input_8;
    input [63:0] input_7;
    input [63:0] input_6;
    input [63:0] input_5;
    input [63:0] input_4;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [8:0] sel;
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
    MUX1HOT_v_64_9_2 = result;
  end
  endfunction


  function automatic [5:0] MUX1HOT_v_6_4_2;
    input [5:0] input_3;
    input [5:0] input_2;
    input [5:0] input_1;
    input [5:0] input_0;
    input [3:0] sel;
    reg [5:0] result;
  begin
    result = input_0 & {6{sel[0]}};
    result = result | ( input_1 & {6{sel[1]}});
    result = result | ( input_2 & {6{sel[2]}});
    result = result | ( input_3 & {6{sel[3]}});
    MUX1HOT_v_6_4_2 = result;
  end
  endfunction


  function automatic [6:0] MUX1HOT_v_7_16_2;
    input [6:0] input_15;
    input [6:0] input_14;
    input [6:0] input_13;
    input [6:0] input_12;
    input [6:0] input_11;
    input [6:0] input_10;
    input [6:0] input_9;
    input [6:0] input_8;
    input [6:0] input_7;
    input [6:0] input_6;
    input [6:0] input_5;
    input [6:0] input_4;
    input [6:0] input_3;
    input [6:0] input_2;
    input [6:0] input_1;
    input [6:0] input_0;
    input [15:0] sel;
    reg [6:0] result;
  begin
    result = input_0 & {7{sel[0]}};
    result = result | ( input_1 & {7{sel[1]}});
    result = result | ( input_2 & {7{sel[2]}});
    result = result | ( input_3 & {7{sel[3]}});
    result = result | ( input_4 & {7{sel[4]}});
    result = result | ( input_5 & {7{sel[5]}});
    result = result | ( input_6 & {7{sel[6]}});
    result = result | ( input_7 & {7{sel[7]}});
    result = result | ( input_8 & {7{sel[8]}});
    result = result | ( input_9 & {7{sel[9]}});
    result = result | ( input_10 & {7{sel[10]}});
    result = result | ( input_11 & {7{sel[11]}});
    result = result | ( input_12 & {7{sel[12]}});
    result = result | ( input_13 & {7{sel[13]}});
    result = result | ( input_14 & {7{sel[14]}});
    result = result | ( input_15 & {7{sel[15]}});
    MUX1HOT_v_7_16_2 = result;
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


  function automatic [6:0] MUX1HOT_v_7_7_2;
    input [6:0] input_6;
    input [6:0] input_5;
    input [6:0] input_4;
    input [6:0] input_3;
    input [6:0] input_2;
    input [6:0] input_1;
    input [6:0] input_0;
    input [6:0] sel;
    reg [6:0] result;
  begin
    result = input_0 & {7{sel[0]}};
    result = result | ( input_1 & {7{sel[1]}});
    result = result | ( input_2 & {7{sel[2]}});
    result = result | ( input_3 & {7{sel[3]}});
    result = result | ( input_4 & {7{sel[4]}});
    result = result | ( input_5 & {7{sel[5]}});
    result = result | ( input_6 & {7{sel[6]}});
    MUX1HOT_v_7_7_2 = result;
  end
  endfunction


  function automatic [8:0] MUX1HOT_v_9_12_2;
    input [8:0] input_11;
    input [8:0] input_10;
    input [8:0] input_9;
    input [8:0] input_8;
    input [8:0] input_7;
    input [8:0] input_6;
    input [8:0] input_5;
    input [8:0] input_4;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [11:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    result = result | ( input_3 & {9{sel[3]}});
    result = result | ( input_4 & {9{sel[4]}});
    result = result | ( input_5 & {9{sel[5]}});
    result = result | ( input_6 & {9{sel[6]}});
    result = result | ( input_7 & {9{sel[7]}});
    result = result | ( input_8 & {9{sel[8]}});
    result = result | ( input_9 & {9{sel[9]}});
    result = result | ( input_10 & {9{sel[10]}});
    result = result | ( input_11 & {9{sel[11]}});
    MUX1HOT_v_9_12_2 = result;
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


  function automatic [53:0] MUX_v_54_2_2;
    input [53:0] input_0;
    input [53:0] input_1;
    input [0:0] sel;
    reg [53:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_54_2_2 = result;
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


  function automatic [10:0] conv_u2s_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2s_10_11 =  {1'b0, vector};
  end
  endfunction


  function automatic [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function automatic [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
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
  clk, rst, vec_rsc_0_0_wadr, vec_rsc_0_0_d, vec_rsc_0_0_we, vec_rsc_0_0_radr, vec_rsc_0_0_q,
      vec_rsc_triosy_0_0_lz, vec_rsc_0_1_wadr, vec_rsc_0_1_d, vec_rsc_0_1_we, vec_rsc_0_1_radr,
      vec_rsc_0_1_q, vec_rsc_triosy_0_1_lz, vec_rsc_0_2_wadr, vec_rsc_0_2_d, vec_rsc_0_2_we,
      vec_rsc_0_2_radr, vec_rsc_0_2_q, vec_rsc_triosy_0_2_lz, vec_rsc_0_3_wadr, vec_rsc_0_3_d,
      vec_rsc_0_3_we, vec_rsc_0_3_radr, vec_rsc_0_3_q, vec_rsc_triosy_0_3_lz, vec_rsc_0_4_wadr,
      vec_rsc_0_4_d, vec_rsc_0_4_we, vec_rsc_0_4_radr, vec_rsc_0_4_q, vec_rsc_triosy_0_4_lz,
      vec_rsc_0_5_wadr, vec_rsc_0_5_d, vec_rsc_0_5_we, vec_rsc_0_5_radr, vec_rsc_0_5_q,
      vec_rsc_triosy_0_5_lz, vec_rsc_0_6_wadr, vec_rsc_0_6_d, vec_rsc_0_6_we, vec_rsc_0_6_radr,
      vec_rsc_0_6_q, vec_rsc_triosy_0_6_lz, vec_rsc_0_7_wadr, vec_rsc_0_7_d, vec_rsc_0_7_we,
      vec_rsc_0_7_radr, vec_rsc_0_7_q, vec_rsc_triosy_0_7_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_0_0_radr, twiddle_rsc_0_0_q, twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_0_1_radr, twiddle_rsc_0_1_q, twiddle_rsc_triosy_0_1_lz, twiddle_rsc_0_2_radr,
      twiddle_rsc_0_2_q, twiddle_rsc_triosy_0_2_lz, twiddle_rsc_0_3_radr, twiddle_rsc_0_3_q,
      twiddle_rsc_triosy_0_3_lz, twiddle_rsc_0_4_radr, twiddle_rsc_0_4_q, twiddle_rsc_triosy_0_4_lz,
      twiddle_rsc_0_5_radr, twiddle_rsc_0_5_q, twiddle_rsc_triosy_0_5_lz, twiddle_rsc_0_6_radr,
      twiddle_rsc_0_6_q, twiddle_rsc_triosy_0_6_lz, twiddle_rsc_0_7_radr, twiddle_rsc_0_7_q,
      twiddle_rsc_triosy_0_7_lz
);
  input clk;
  input rst;
  output [6:0] vec_rsc_0_0_wadr;
  output [63:0] vec_rsc_0_0_d;
  output vec_rsc_0_0_we;
  output [6:0] vec_rsc_0_0_radr;
  input [63:0] vec_rsc_0_0_q;
  output vec_rsc_triosy_0_0_lz;
  output [6:0] vec_rsc_0_1_wadr;
  output [63:0] vec_rsc_0_1_d;
  output vec_rsc_0_1_we;
  output [6:0] vec_rsc_0_1_radr;
  input [63:0] vec_rsc_0_1_q;
  output vec_rsc_triosy_0_1_lz;
  output [6:0] vec_rsc_0_2_wadr;
  output [63:0] vec_rsc_0_2_d;
  output vec_rsc_0_2_we;
  output [6:0] vec_rsc_0_2_radr;
  input [63:0] vec_rsc_0_2_q;
  output vec_rsc_triosy_0_2_lz;
  output [6:0] vec_rsc_0_3_wadr;
  output [63:0] vec_rsc_0_3_d;
  output vec_rsc_0_3_we;
  output [6:0] vec_rsc_0_3_radr;
  input [63:0] vec_rsc_0_3_q;
  output vec_rsc_triosy_0_3_lz;
  output [6:0] vec_rsc_0_4_wadr;
  output [63:0] vec_rsc_0_4_d;
  output vec_rsc_0_4_we;
  output [6:0] vec_rsc_0_4_radr;
  input [63:0] vec_rsc_0_4_q;
  output vec_rsc_triosy_0_4_lz;
  output [6:0] vec_rsc_0_5_wadr;
  output [63:0] vec_rsc_0_5_d;
  output vec_rsc_0_5_we;
  output [6:0] vec_rsc_0_5_radr;
  input [63:0] vec_rsc_0_5_q;
  output vec_rsc_triosy_0_5_lz;
  output [6:0] vec_rsc_0_6_wadr;
  output [63:0] vec_rsc_0_6_d;
  output vec_rsc_0_6_we;
  output [6:0] vec_rsc_0_6_radr;
  input [63:0] vec_rsc_0_6_q;
  output vec_rsc_triosy_0_6_lz;
  output [6:0] vec_rsc_0_7_wadr;
  output [63:0] vec_rsc_0_7_d;
  output vec_rsc_0_7_we;
  output [6:0] vec_rsc_0_7_radr;
  input [63:0] vec_rsc_0_7_q;
  output vec_rsc_triosy_0_7_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [6:0] twiddle_rsc_0_0_radr;
  input [63:0] twiddle_rsc_0_0_q;
  output twiddle_rsc_triosy_0_0_lz;
  output [6:0] twiddle_rsc_0_1_radr;
  input [63:0] twiddle_rsc_0_1_q;
  output twiddle_rsc_triosy_0_1_lz;
  output [6:0] twiddle_rsc_0_2_radr;
  input [63:0] twiddle_rsc_0_2_q;
  output twiddle_rsc_triosy_0_2_lz;
  output [6:0] twiddle_rsc_0_3_radr;
  input [63:0] twiddle_rsc_0_3_q;
  output twiddle_rsc_triosy_0_3_lz;
  output [6:0] twiddle_rsc_0_4_radr;
  input [63:0] twiddle_rsc_0_4_q;
  output twiddle_rsc_triosy_0_4_lz;
  output [6:0] twiddle_rsc_0_5_radr;
  input [63:0] twiddle_rsc_0_5_q;
  output twiddle_rsc_triosy_0_5_lz;
  output [6:0] twiddle_rsc_0_6_radr;
  input [63:0] twiddle_rsc_0_6_q;
  output twiddle_rsc_triosy_0_6_lz;
  output [6:0] twiddle_rsc_0_7_radr;
  input [63:0] twiddle_rsc_0_7_q;
  output twiddle_rsc_triosy_0_7_lz;


  // Interconnect Declarations
  wire [63:0] vec_rsc_0_0_i_q_d;
  wire vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_1_i_q_d;
  wire vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_2_i_q_d;
  wire vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_3_i_q_d;
  wire vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_4_i_q_d;
  wire vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_5_i_q_d;
  wire vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_6_i_q_d;
  wire vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_7_i_q_d;
  wire vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_0_i_q_d;
  wire [6:0] twiddle_rsc_0_0_i_radr_d;
  wire twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_1_i_q_d;
  wire twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_2_i_q_d;
  wire twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_3_i_q_d;
  wire twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_4_i_q_d;
  wire [6:0] twiddle_rsc_0_4_i_radr_d;
  wire twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_5_i_q_d;
  wire twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_6_i_q_d;
  wire twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_7_i_q_d;
  wire twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_0_i_d_d_iff;
  wire [6:0] vec_rsc_0_0_i_radr_d_iff;
  wire [6:0] vec_rsc_0_0_i_wadr_d_iff;
  wire vec_rsc_0_0_i_we_d_iff;
  wire vec_rsc_0_1_i_we_d_iff;
  wire vec_rsc_0_2_i_we_d_iff;
  wire vec_rsc_0_3_i_we_d_iff;
  wire vec_rsc_0_4_i_we_d_iff;
  wire vec_rsc_0_5_i_we_d_iff;
  wire vec_rsc_0_6_i_we_d_iff;
  wire vec_rsc_0_7_i_we_d_iff;
  wire [6:0] twiddle_rsc_0_1_i_radr_d_iff;
  wire [6:0] twiddle_rsc_0_2_i_radr_d_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_7_64_128_128_64_1_gen vec_rsc_0_0_i
      (
      .q(vec_rsc_0_0_q),
      .radr(vec_rsc_0_0_radr),
      .we(vec_rsc_0_0_we),
      .d(vec_rsc_0_0_d),
      .wadr(vec_rsc_0_0_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_0_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_7_64_128_128_64_1_gen vec_rsc_0_1_i
      (
      .q(vec_rsc_0_1_q),
      .radr(vec_rsc_0_1_radr),
      .we(vec_rsc_0_1_we),
      .d(vec_rsc_0_1_d),
      .wadr(vec_rsc_0_1_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_1_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_1_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_1_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_7_64_128_128_64_1_gen vec_rsc_0_2_i
      (
      .q(vec_rsc_0_2_q),
      .radr(vec_rsc_0_2_radr),
      .we(vec_rsc_0_2_we),
      .d(vec_rsc_0_2_d),
      .wadr(vec_rsc_0_2_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_2_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_2_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_2_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_7_64_128_128_64_1_gen vec_rsc_0_3_i
      (
      .q(vec_rsc_0_3_q),
      .radr(vec_rsc_0_3_radr),
      .we(vec_rsc_0_3_we),
      .d(vec_rsc_0_3_d),
      .wadr(vec_rsc_0_3_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_3_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_3_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_3_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_7_64_128_128_64_1_gen vec_rsc_0_4_i
      (
      .q(vec_rsc_0_4_q),
      .radr(vec_rsc_0_4_radr),
      .we(vec_rsc_0_4_we),
      .d(vec_rsc_0_4_d),
      .wadr(vec_rsc_0_4_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_4_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_7_64_128_128_64_1_gen vec_rsc_0_5_i
      (
      .q(vec_rsc_0_5_q),
      .radr(vec_rsc_0_5_radr),
      .we(vec_rsc_0_5_we),
      .d(vec_rsc_0_5_d),
      .wadr(vec_rsc_0_5_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_5_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_5_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_5_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_7_64_128_128_64_1_gen vec_rsc_0_6_i
      (
      .q(vec_rsc_0_6_q),
      .radr(vec_rsc_0_6_radr),
      .we(vec_rsc_0_6_we),
      .d(vec_rsc_0_6_d),
      .wadr(vec_rsc_0_6_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_6_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_6_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_6_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_7_64_128_128_64_1_gen vec_rsc_0_7_i
      (
      .q(vec_rsc_0_7_q),
      .radr(vec_rsc_0_7_radr),
      .we(vec_rsc_0_7_we),
      .d(vec_rsc_0_7_d),
      .wadr(vec_rsc_0_7_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_7_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_7_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_7_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_7_64_128_128_64_1_gen twiddle_rsc_0_0_i
      (
      .q(twiddle_rsc_0_0_q),
      .radr(twiddle_rsc_0_0_radr),
      .q_d(twiddle_rsc_0_0_i_q_d),
      .radr_d(twiddle_rsc_0_0_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_7_64_128_128_64_1_gen twiddle_rsc_0_1_i
      (
      .q(twiddle_rsc_0_1_q),
      .radr(twiddle_rsc_0_1_radr),
      .q_d(twiddle_rsc_0_1_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_7_64_128_128_64_1_gen twiddle_rsc_0_2_i
      (
      .q(twiddle_rsc_0_2_q),
      .radr(twiddle_rsc_0_2_radr),
      .q_d(twiddle_rsc_0_2_i_q_d),
      .radr_d(twiddle_rsc_0_2_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_7_64_128_128_64_1_gen twiddle_rsc_0_3_i
      (
      .q(twiddle_rsc_0_3_q),
      .radr(twiddle_rsc_0_3_radr),
      .q_d(twiddle_rsc_0_3_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_7_64_128_128_64_1_gen twiddle_rsc_0_4_i
      (
      .q(twiddle_rsc_0_4_q),
      .radr(twiddle_rsc_0_4_radr),
      .q_d(twiddle_rsc_0_4_i_q_d),
      .radr_d(twiddle_rsc_0_4_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_7_64_128_128_64_1_gen twiddle_rsc_0_5_i
      (
      .q(twiddle_rsc_0_5_q),
      .radr(twiddle_rsc_0_5_radr),
      .q_d(twiddle_rsc_0_5_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_23_7_64_128_128_64_1_gen twiddle_rsc_0_6_i
      (
      .q(twiddle_rsc_0_6_q),
      .radr(twiddle_rsc_0_6_radr),
      .q_d(twiddle_rsc_0_6_i_q_d),
      .radr_d(twiddle_rsc_0_2_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_24_7_64_128_128_64_1_gen twiddle_rsc_0_7_i
      (
      .q(twiddle_rsc_0_7_q),
      .radr(twiddle_rsc_0_7_radr),
      .q_d(twiddle_rsc_0_7_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_core inPlaceNTT_DIF_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .vec_rsc_triosy_0_2_lz(vec_rsc_triosy_0_2_lz),
      .vec_rsc_triosy_0_3_lz(vec_rsc_triosy_0_3_lz),
      .vec_rsc_triosy_0_4_lz(vec_rsc_triosy_0_4_lz),
      .vec_rsc_triosy_0_5_lz(vec_rsc_triosy_0_5_lz),
      .vec_rsc_triosy_0_6_lz(vec_rsc_triosy_0_6_lz),
      .vec_rsc_triosy_0_7_lz(vec_rsc_triosy_0_7_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
      .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
      .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
      .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
      .twiddle_rsc_triosy_0_4_lz(twiddle_rsc_triosy_0_4_lz),
      .twiddle_rsc_triosy_0_5_lz(twiddle_rsc_triosy_0_5_lz),
      .twiddle_rsc_triosy_0_6_lz(twiddle_rsc_triosy_0_6_lz),
      .twiddle_rsc_triosy_0_7_lz(twiddle_rsc_triosy_0_7_lz),
      .vec_rsc_0_0_i_q_d(vec_rsc_0_0_i_q_d),
      .vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_1_i_q_d(vec_rsc_0_1_i_q_d),
      .vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_2_i_q_d(vec_rsc_0_2_i_q_d),
      .vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_3_i_q_d(vec_rsc_0_3_i_q_d),
      .vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_4_i_q_d(vec_rsc_0_4_i_q_d),
      .vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_5_i_q_d(vec_rsc_0_5_i_q_d),
      .vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_6_i_q_d(vec_rsc_0_6_i_q_d),
      .vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_7_i_q_d(vec_rsc_0_7_i_q_d),
      .vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_0_i_q_d(twiddle_rsc_0_0_i_q_d),
      .twiddle_rsc_0_0_i_radr_d(twiddle_rsc_0_0_i_radr_d),
      .twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_1_i_q_d(twiddle_rsc_0_1_i_q_d),
      .twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_2_i_q_d(twiddle_rsc_0_2_i_q_d),
      .twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_3_i_q_d(twiddle_rsc_0_3_i_q_d),
      .twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_4_i_q_d(twiddle_rsc_0_4_i_q_d),
      .twiddle_rsc_0_4_i_radr_d(twiddle_rsc_0_4_i_radr_d),
      .twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_5_i_q_d(twiddle_rsc_0_5_i_q_d),
      .twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_6_i_q_d(twiddle_rsc_0_6_i_q_d),
      .twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_7_i_q_d(twiddle_rsc_0_7_i_q_d),
      .twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_0_i_d_d_pff(vec_rsc_0_0_i_d_d_iff),
      .vec_rsc_0_0_i_radr_d_pff(vec_rsc_0_0_i_radr_d_iff),
      .vec_rsc_0_0_i_wadr_d_pff(vec_rsc_0_0_i_wadr_d_iff),
      .vec_rsc_0_0_i_we_d_pff(vec_rsc_0_0_i_we_d_iff),
      .vec_rsc_0_1_i_we_d_pff(vec_rsc_0_1_i_we_d_iff),
      .vec_rsc_0_2_i_we_d_pff(vec_rsc_0_2_i_we_d_iff),
      .vec_rsc_0_3_i_we_d_pff(vec_rsc_0_3_i_we_d_iff),
      .vec_rsc_0_4_i_we_d_pff(vec_rsc_0_4_i_we_d_iff),
      .vec_rsc_0_5_i_we_d_pff(vec_rsc_0_5_i_we_d_iff),
      .vec_rsc_0_6_i_we_d_pff(vec_rsc_0_6_i_we_d_iff),
      .vec_rsc_0_7_i_we_d_pff(vec_rsc_0_7_i_we_d_iff),
      .twiddle_rsc_0_1_i_radr_d_pff(twiddle_rsc_0_1_i_radr_d_iff),
      .twiddle_rsc_0_2_i_radr_d_pff(twiddle_rsc_0_2_i_radr_d_iff)
    );
endmodule



