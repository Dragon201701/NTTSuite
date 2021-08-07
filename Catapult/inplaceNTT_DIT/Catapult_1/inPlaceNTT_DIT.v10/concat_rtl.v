
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

//------> ../td_ccore_solutions/modulo_dev_bb61c76201db0c9669a47462bb7d006361ff_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Tue Jul 20 15:24:30 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    modulo_dev_core
// ------------------------------------------------------------------


module modulo_dev_core (
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
  wire [64:0] rem_13_cmp_z;
  wire [64:0] rem_13_cmp_1_z;
  wire [64:0] rem_13_cmp_2_z;
  wire [64:0] rem_13_cmp_3_z;
  wire [64:0] rem_13_cmp_4_z;
  wire [64:0] rem_13_cmp_5_z;
  wire [64:0] rem_13_cmp_6_z;
  wire [64:0] rem_13_cmp_7_z;
  wire [64:0] rem_13_cmp_8_z;
  wire [64:0] rem_13_cmp_9_z;
  wire [64:0] rem_13_cmp_10_z;
  wire [64:0] rem_13_cmp_11_z;
  reg [63:0] rem_13_cmp_b_63_0;
  reg [63:0] rem_13_cmp_1_b_63_0;
  reg [63:0] rem_13_cmp_2_b_63_0;
  reg [63:0] rem_13_cmp_3_b_63_0;
  reg [63:0] rem_13_cmp_4_b_63_0;
  reg [63:0] rem_13_cmp_5_b_63_0;
  reg [63:0] rem_13_cmp_6_b_63_0;
  reg [63:0] rem_13_cmp_7_b_63_0;
  reg [63:0] rem_13_cmp_8_b_63_0;
  reg [63:0] rem_13_cmp_9_b_63_0;
  reg [63:0] rem_13_cmp_10_b_63_0;
  reg [63:0] rem_13_cmp_11_b_63_0;
  reg [63:0] rem_13_cmp_a_63_0;
  reg [63:0] rem_13_cmp_1_a_63_0;
  reg [63:0] rem_13_cmp_2_a_63_0;
  reg [63:0] rem_13_cmp_3_a_63_0;
  reg [63:0] rem_13_cmp_4_a_63_0;
  reg [63:0] rem_13_cmp_5_a_63_0;
  reg [63:0] rem_13_cmp_6_a_63_0;
  reg [63:0] rem_13_cmp_7_a_63_0;
  reg [63:0] rem_13_cmp_8_a_63_0;
  reg [63:0] rem_13_cmp_9_a_63_0;
  reg [63:0] rem_13_cmp_10_a_63_0;
  reg [63:0] rem_13_cmp_11_a_63_0;
  wire [1:0] acc_tmp;
  wire [2:0] nl_acc_tmp;
  wire [3:0] acc_1_tmp;
  wire [4:0] nl_acc_1_tmp;
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
  reg asn_itm_12;
  reg main_stage_0_13;
  reg main_stage_0_3;
  reg asn_itm_1;
  reg main_stage_0_2;
  reg main_stage_0_4;
  reg asn_itm_2;
  reg main_stage_0_5;
  reg asn_itm_3;
  reg main_stage_0_6;
  reg asn_itm_4;
  reg asn_itm_5;
  reg main_stage_0_8;
  reg asn_itm_7;
  reg main_stage_0_9;
  reg asn_itm_8;
  reg main_stage_0_10;
  reg asn_itm_9;
  reg main_stage_0_7;
  reg asn_itm_6;
  reg main_stage_0_11;
  reg asn_itm_10;
  wire and_1173_cse;
  wire and_1175_cse;
  wire and_1177_cse;
  wire and_1179_cse;
  wire and_1181_cse;
  wire and_1183_cse;
  wire and_1185_cse;
  wire and_1187_cse;
  wire and_1189_cse;
  wire and_1191_cse;
  wire and_1193_cse;
  wire and_1195_cse;
  wire and_1197_cse;
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
  reg asn_itm_11;
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
  wire and_1203_cse;
  wire and_1205_cse;
  wire and_1207_cse;
  wire and_1209_cse;
  wire and_1211_cse;
  wire and_1213_cse;
  wire and_1215_cse;
  wire and_1217_cse;
  wire and_1219_cse;
  wire and_1221_cse;
  wire and_1223_cse;
  wire and_1225_cse;
  wire and_1227_cse;
  wire and_1229_cse;
  wire and_1231_cse;
  wire and_1233_cse;
  wire and_1235_cse;
  wire and_1237_cse;
  wire and_1239_cse;
  wire and_1241_cse;
  wire and_1243_cse;
  wire and_1245_cse;
  wire and_1247_cse;
  wire and_1249_cse;
  wire and_1251_cse;
  wire and_1253_cse;
  wire and_1255_cse;
  wire and_1257_cse;
  wire and_1259_cse;
  wire and_1261_cse;
  wire and_1263_cse;
  wire and_1265_cse;
  wire and_1267_cse;
  wire and_1269_cse;
  wire and_1271_cse;
  wire and_1273_cse;
  wire and_1275_cse;
  wire and_1277_cse;
  wire and_1279_cse;
  wire and_1281_cse;
  wire and_1283_cse;
  wire and_1285_cse;
  wire and_1287_cse;
  wire and_1289_cse;
  wire and_1291_cse;
  wire and_1293_cse;
  wire and_1295_cse;
  wire and_1297_cse;
  wire and_1299_cse;
  wire and_1301_cse;
  wire and_1303_cse;
  wire and_1305_cse;
  wire and_1307_cse;
  wire and_1309_cse;
  wire and_1311_cse;
  wire and_1313_cse;
  wire and_1315_cse;
  wire and_1317_cse;
  wire and_1319_cse;
  wire and_1321_cse;
  wire and_1323_cse;
  wire and_1325_cse;
  wire and_1327_cse;
  wire and_1329_cse;
  wire and_1331_cse;
  wire and_1333_cse;
  wire and_1335_cse;
  wire and_1337_cse;
  wire and_1339_cse;
  wire and_1341_cse;
  wire and_1343_cse;
  wire and_1345_cse;
  wire and_1347_cse;
  wire and_1349_cse;
  wire and_1351_cse;
  wire and_1353_cse;
  wire and_1355_cse;
  wire and_1357_cse;
  wire and_1359_cse;
  wire and_1361_cse;
  wire and_1363_cse;
  wire and_1365_cse;
  wire and_1367_cse;
  wire and_1369_cse;
  wire and_1371_cse;
  wire and_1373_cse;
  wire and_1375_cse;
  wire and_1377_cse;
  wire and_1379_cse;
  wire and_1381_cse;
  wire and_1383_cse;
  wire and_1385_cse;
  wire and_1387_cse;
  wire and_1389_cse;
  wire and_1391_cse;
  wire and_1393_cse;
  wire and_1395_cse;
  wire and_1397_cse;
  wire and_1399_cse;
  wire and_1401_cse;
  wire and_1403_cse;
  wire and_1405_cse;
  wire and_1407_cse;
  wire and_1409_cse;
  wire and_1411_cse;
  wire and_1413_cse;
  wire and_1415_cse;
  wire and_1417_cse;
  wire and_1419_cse;
  wire and_1421_cse;
  wire and_1423_cse;
  wire and_1425_cse;
  wire and_1427_cse;
  wire and_1429_cse;
  wire and_1431_cse;
  wire and_1433_cse;
  wire and_1435_cse;
  wire and_1437_cse;
  wire and_1439_cse;
  wire and_1441_cse;
  wire and_1443_cse;
  wire and_1445_cse;
  wire and_1447_cse;
  wire and_1449_cse;
  wire and_1451_cse;
  wire and_1453_cse;
  wire and_1455_cse;
  wire and_1457_cse;
  wire and_1459_cse;
  wire and_1461_cse;
  wire and_1463_cse;

  wire[63:0] qelse_acc_nl;
  wire[64:0] nl_qelse_acc_nl;
  wire[0:0] mux_13_nl;
  wire[0:0] mux_12_nl;
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
  wire[0:0] xor_nl;
  wire[0:0] nor_nl;
  wire[0:0] mux_14_nl;
  wire[0:0] nor_518_nl;
  wire[0:0] mux_15_nl;
  wire[0:0] nor_517_nl;
  wire[0:0] mux_16_nl;
  wire[0:0] nor_516_nl;
  wire[0:0] mux_17_nl;
  wire[0:0] nor_515_nl;
  wire[0:0] mux_18_nl;
  wire[0:0] nor_514_nl;
  wire[0:0] mux_19_nl;
  wire[0:0] nor_512_nl;
  wire[0:0] mux_20_nl;
  wire[0:0] nor_513_nl;
  wire[0:0] nor_509_nl;
  wire[0:0] mux_22_nl;
  wire[0:0] nor_510_nl;
  wire[0:0] mux_23_nl;
  wire[0:0] nor_511_nl;
  wire[0:0] nor_505_nl;
  wire[0:0] nor_506_nl;
  wire[0:0] mux_26_nl;
  wire[0:0] nor_507_nl;
  wire[0:0] mux_27_nl;
  wire[0:0] nor_508_nl;
  wire[0:0] nor_500_nl;
  wire[0:0] or_61_nl;
  wire[0:0] nor_501_nl;
  wire[0:0] nor_502_nl;
  wire[0:0] mux_31_nl;
  wire[0:0] nor_503_nl;
  wire[0:0] mux_32_nl;
  wire[0:0] nor_504_nl;
  wire[0:0] mux_33_nl;
  wire[0:0] nor_499_nl;
  wire[0:0] and_1168_nl;
  wire[0:0] mux_35_nl;
  wire[0:0] nor_498_nl;
  wire[0:0] and_1166_nl;
  wire[0:0] and_1167_nl;
  wire[0:0] mux_38_nl;
  wire[0:0] nor_497_nl;
  wire[0:0] and_1163_nl;
  wire[0:0] and_1164_nl;
  wire[0:0] and_1165_nl;
  wire[0:0] mux_42_nl;
  wire[0:0] nor_496_nl;
  wire[0:0] and_1159_nl;
  wire[0:0] and_1160_nl;
  wire[0:0] and_1161_nl;
  wire[0:0] and_1162_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] nor_495_nl;
  wire[0:0] nor_493_nl;
  wire[0:0] and_1155_nl;
  wire[0:0] and_1156_nl;
  wire[0:0] and_1157_nl;
  wire[0:0] and_1158_nl;
  wire[0:0] mux_53_nl;
  wire[0:0] nor_494_nl;
  wire[0:0] nor_490_nl;
  wire[0:0] nor_491_nl;
  wire[0:0] and_1151_nl;
  wire[0:0] and_1152_nl;
  wire[0:0] and_1153_nl;
  wire[0:0] and_1154_nl;
  wire[0:0] mux_60_nl;
  wire[0:0] nor_492_nl;
  wire[0:0] nor_486_nl;
  wire[0:0] nor_487_nl;
  wire[0:0] nor_488_nl;
  wire[0:0] and_1147_nl;
  wire[0:0] and_1148_nl;
  wire[0:0] and_1149_nl;
  wire[0:0] and_1150_nl;
  wire[0:0] mux_68_nl;
  wire[0:0] nor_489_nl;
  wire[0:0] nor_481_nl;
  wire[0:0] or_165_nl;
  wire[0:0] nor_482_nl;
  wire[0:0] nor_483_nl;
  wire[0:0] nor_484_nl;
  wire[0:0] and_1143_nl;
  wire[0:0] and_1144_nl;
  wire[0:0] and_1145_nl;
  wire[0:0] and_1146_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] nor_485_nl;
  wire[0:0] nor_480_nl;
  wire[0:0] or_175_nl;
  wire[0:0] mux_79_nl;
  wire[0:0] nor_479_nl;
  wire[0:0] mux_80_nl;
  wire[0:0] nor_478_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] nor_477_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] nor_476_nl;
  wire[0:0] mux_83_nl;
  wire[0:0] nor_475_nl;
  wire[0:0] mux_84_nl;
  wire[0:0] nor_473_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] nor_474_nl;
  wire[0:0] nor_470_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] nor_471_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] nor_472_nl;
  wire[0:0] nor_466_nl;
  wire[0:0] nor_467_nl;
  wire[0:0] mux_91_nl;
  wire[0:0] nor_468_nl;
  wire[0:0] mux_92_nl;
  wire[0:0] nor_469_nl;
  wire[0:0] nor_461_nl;
  wire[0:0] or_250_nl;
  wire[0:0] nor_462_nl;
  wire[0:0] nor_463_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] nor_464_nl;
  wire[0:0] mux_97_nl;
  wire[0:0] nor_465_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] nor_460_nl;
  wire[0:0] and_1142_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] nor_459_nl;
  wire[0:0] and_1140_nl;
  wire[0:0] and_1141_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] nor_458_nl;
  wire[0:0] and_1137_nl;
  wire[0:0] and_1138_nl;
  wire[0:0] and_1139_nl;
  wire[0:0] mux_107_nl;
  wire[0:0] nor_457_nl;
  wire[0:0] and_1133_nl;
  wire[0:0] and_1134_nl;
  wire[0:0] and_1135_nl;
  wire[0:0] and_1136_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] nor_456_nl;
  wire[0:0] nor_454_nl;
  wire[0:0] and_1129_nl;
  wire[0:0] and_1130_nl;
  wire[0:0] and_1131_nl;
  wire[0:0] and_1132_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] nor_455_nl;
  wire[0:0] nor_451_nl;
  wire[0:0] nor_452_nl;
  wire[0:0] and_1125_nl;
  wire[0:0] and_1126_nl;
  wire[0:0] and_1127_nl;
  wire[0:0] and_1128_nl;
  wire[0:0] mux_125_nl;
  wire[0:0] nor_453_nl;
  wire[0:0] nor_447_nl;
  wire[0:0] nor_448_nl;
  wire[0:0] nor_449_nl;
  wire[0:0] and_1121_nl;
  wire[0:0] and_1122_nl;
  wire[0:0] and_1123_nl;
  wire[0:0] and_1124_nl;
  wire[0:0] mux_133_nl;
  wire[0:0] nor_450_nl;
  wire[0:0] nor_442_nl;
  wire[0:0] or_352_nl;
  wire[0:0] nor_443_nl;
  wire[0:0] nor_444_nl;
  wire[0:0] nor_445_nl;
  wire[0:0] and_1117_nl;
  wire[0:0] and_1118_nl;
  wire[0:0] and_1119_nl;
  wire[0:0] and_1120_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] nor_446_nl;
  wire[0:0] and_1116_nl;
  wire[0:0] or_362_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] and_1172_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] and_1114_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] and_1113_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] and_1112_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] and_1111_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] and_1109_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] and_1110_nl;
  wire[0:0] and_1106_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] and_1107_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] and_1108_nl;
  wire[0:0] and_1102_nl;
  wire[0:0] and_1103_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] and_1104_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] and_1105_nl;
  wire[0:0] and_1097_nl;
  wire[0:0] or_437_nl;
  wire[0:0] and_1098_nl;
  wire[0:0] and_1099_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] and_1100_nl;
  wire[0:0] mux_162_nl;
  wire[0:0] and_1101_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] and_1171_nl;
  wire[0:0] and_1094_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] and_1095_nl;
  wire[0:0] and_1091_nl;
  wire[0:0] and_1092_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] and_1093_nl;
  wire[0:0] and_1087_nl;
  wire[0:0] and_1088_nl;
  wire[0:0] and_1089_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] and_1090_nl;
  wire[0:0] and_1082_nl;
  wire[0:0] and_1083_nl;
  wire[0:0] and_1084_nl;
  wire[0:0] and_1085_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] and_1086_nl;
  wire[0:0] and_1076_nl;
  wire[0:0] and_1077_nl;
  wire[0:0] and_1078_nl;
  wire[0:0] and_1079_nl;
  wire[0:0] and_1080_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] and_1081_nl;
  wire[0:0] and_1069_nl;
  wire[0:0] and_1070_nl;
  wire[0:0] and_1071_nl;
  wire[0:0] and_1072_nl;
  wire[0:0] and_1073_nl;
  wire[0:0] and_1074_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] and_1075_nl;
  wire[0:0] and_1061_nl;
  wire[0:0] and_1062_nl;
  wire[0:0] and_1063_nl;
  wire[0:0] and_1064_nl;
  wire[0:0] and_1065_nl;
  wire[0:0] and_1066_nl;
  wire[0:0] and_1067_nl;
  wire[0:0] mux_198_nl;
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
  wire[0:0] mux_207_nl;
  wire[0:0] and_1060_nl;
  wire[0:0] nor_439_nl;
  wire[0:0] or_550_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] and_1170_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] and_1050_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] and_1049_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] and_1048_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] and_1047_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] and_1045_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] and_1046_nl;
  wire[0:0] and_1042_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] and_1043_nl;
  wire[0:0] mux_218_nl;
  wire[0:0] and_1044_nl;
  wire[0:0] and_1038_nl;
  wire[0:0] and_1039_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] and_1040_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] and_1041_nl;
  wire[0:0] and_1033_nl;
  wire[0:0] or_624_nl;
  wire[0:0] and_1034_nl;
  wire[0:0] and_1035_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] and_1036_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] and_1037_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] and_1169_nl;
  wire[0:0] and_1030_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] and_1031_nl;
  wire[0:0] and_1027_nl;
  wire[0:0] and_1028_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] and_1029_nl;
  wire[0:0] and_1023_nl;
  wire[0:0] and_1024_nl;
  wire[0:0] and_1025_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] and_1026_nl;
  wire[0:0] and_1018_nl;
  wire[0:0] and_1019_nl;
  wire[0:0] and_1020_nl;
  wire[0:0] and_1021_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] and_1022_nl;
  wire[0:0] and_1012_nl;
  wire[0:0] and_1013_nl;
  wire[0:0] and_1014_nl;
  wire[0:0] and_1015_nl;
  wire[0:0] and_1016_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] and_1017_nl;
  wire[0:0] and_1005_nl;
  wire[0:0] and_1006_nl;
  wire[0:0] and_1007_nl;
  wire[0:0] and_1008_nl;
  wire[0:0] and_1009_nl;
  wire[0:0] and_1010_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] and_1011_nl;
  wire[0:0] and_997_nl;
  wire[0:0] and_998_nl;
  wire[0:0] and_999_nl;
  wire[0:0] and_1000_nl;
  wire[0:0] and_1001_nl;
  wire[0:0] and_1002_nl;
  wire[0:0] and_1003_nl;
  wire[0:0] mux_263_nl;
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
  wire[0:0] mux_272_nl;
  wire[0:0] and_996_nl;
  wire[0:0] and_987_nl;
  wire[0:0] or_735_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] nor_436_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] nor_435_nl;
  wire[0:0] mux_276_nl;
  wire[0:0] nor_434_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] nor_433_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] nor_432_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] nor_430_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] nor_431_nl;
  wire[0:0] nor_427_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] nor_428_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] nor_429_nl;
  wire[0:0] nor_423_nl;
  wire[0:0] nor_424_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] nor_425_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] nor_426_nl;
  wire[0:0] nor_418_nl;
  wire[0:0] or_808_nl;
  wire[0:0] nor_419_nl;
  wire[0:0] nor_420_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] nor_421_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] nor_422_nl;
  wire[0:0] nor_409_nl;
  wire[0:0] or_823_nl;
  wire[0:0] nor_410_nl;
  wire[0:0] or_822_nl;
  wire[0:0] nor_411_nl;
  wire[0:0] or_821_nl;
  wire[0:0] nor_412_nl;
  wire[0:0] or_820_nl;
  wire[0:0] nor_413_nl;
  wire[0:0] or_819_nl;
  wire[0:0] nor_414_nl;
  wire[0:0] or_818_nl;
  wire[0:0] nor_415_nl;
  wire[0:0] or_817_nl;
  wire[0:0] nor_416_nl;
  wire[0:0] or_816_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] nor_417_nl;
  wire[0:0] or_815_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] nor_408_nl;
  wire[0:0] and_986_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] nor_407_nl;
  wire[0:0] and_984_nl;
  wire[0:0] and_985_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] nor_406_nl;
  wire[0:0] and_981_nl;
  wire[0:0] and_982_nl;
  wire[0:0] and_983_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] nor_405_nl;
  wire[0:0] and_977_nl;
  wire[0:0] and_978_nl;
  wire[0:0] and_979_nl;
  wire[0:0] and_980_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] nor_404_nl;
  wire[0:0] nor_402_nl;
  wire[0:0] and_973_nl;
  wire[0:0] and_974_nl;
  wire[0:0] and_975_nl;
  wire[0:0] and_976_nl;
  wire[0:0] mux_322_nl;
  wire[0:0] nor_403_nl;
  wire[0:0] nor_399_nl;
  wire[0:0] nor_400_nl;
  wire[0:0] and_969_nl;
  wire[0:0] and_970_nl;
  wire[0:0] and_971_nl;
  wire[0:0] and_972_nl;
  wire[0:0] mux_329_nl;
  wire[0:0] nor_401_nl;
  wire[0:0] nor_395_nl;
  wire[0:0] nor_396_nl;
  wire[0:0] nor_397_nl;
  wire[0:0] and_965_nl;
  wire[0:0] and_966_nl;
  wire[0:0] and_967_nl;
  wire[0:0] and_968_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] nor_398_nl;
  wire[0:0] nor_390_nl;
  wire[0:0] or_919_nl;
  wire[0:0] nor_391_nl;
  wire[0:0] nor_392_nl;
  wire[0:0] nor_393_nl;
  wire[0:0] and_961_nl;
  wire[0:0] and_962_nl;
  wire[0:0] and_963_nl;
  wire[0:0] and_964_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] nor_394_nl;
  wire[0:0] nor_380_nl;
  wire[0:0] or_938_nl;
  wire[0:0] nor_381_nl;
  wire[0:0] or_937_nl;
  wire[0:0] nor_382_nl;
  wire[0:0] or_936_nl;
  wire[0:0] nor_383_nl;
  wire[0:0] or_935_nl;
  wire[0:0] nor_384_nl;
  wire[0:0] or_934_nl;
  wire[0:0] nor_385_nl;
  wire[0:0] or_933_nl;
  wire[0:0] nor_386_nl;
  wire[0:0] or_932_nl;
  wire[0:0] nor_387_nl;
  wire[0:0] or_931_nl;
  wire[0:0] nor_388_nl;
  wire[0:0] or_930_nl;
  wire[0:0] nor_389_nl;
  wire[0:0] or_929_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] nor_379_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] nor_378_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] nor_377_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] nor_376_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] nor_375_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] nor_373_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] nor_374_nl;
  wire[0:0] nor_370_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] nor_371_nl;
  wire[0:0] mux_366_nl;
  wire[0:0] nor_372_nl;
  wire[0:0] nor_366_nl;
  wire[0:0] nor_367_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] nor_368_nl;
  wire[0:0] mux_370_nl;
  wire[0:0] nor_369_nl;
  wire[0:0] nor_361_nl;
  wire[0:0] or_1012_nl;
  wire[0:0] nor_362_nl;
  wire[0:0] nor_363_nl;
  wire[0:0] mux_374_nl;
  wire[0:0] nor_364_nl;
  wire[0:0] mux_375_nl;
  wire[0:0] nor_365_nl;
  wire[0:0] nor_352_nl;
  wire[0:0] or_1027_nl;
  wire[0:0] nor_353_nl;
  wire[0:0] or_1026_nl;
  wire[0:0] nor_354_nl;
  wire[0:0] or_1025_nl;
  wire[0:0] nor_355_nl;
  wire[0:0] or_1024_nl;
  wire[0:0] nor_356_nl;
  wire[0:0] or_1023_nl;
  wire[0:0] nor_357_nl;
  wire[0:0] or_1022_nl;
  wire[0:0] nor_358_nl;
  wire[0:0] or_1021_nl;
  wire[0:0] nor_359_nl;
  wire[0:0] or_1020_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] nor_360_nl;
  wire[0:0] or_1019_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] nor_351_nl;
  wire[0:0] and_960_nl;
  wire[0:0] mux_387_nl;
  wire[0:0] nor_350_nl;
  wire[0:0] and_958_nl;
  wire[0:0] and_959_nl;
  wire[0:0] mux_390_nl;
  wire[0:0] nor_349_nl;
  wire[0:0] and_955_nl;
  wire[0:0] and_956_nl;
  wire[0:0] and_957_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] nor_348_nl;
  wire[0:0] and_951_nl;
  wire[0:0] and_952_nl;
  wire[0:0] and_953_nl;
  wire[0:0] and_954_nl;
  wire[0:0] mux_399_nl;
  wire[0:0] nor_347_nl;
  wire[0:0] nor_345_nl;
  wire[0:0] and_947_nl;
  wire[0:0] and_948_nl;
  wire[0:0] and_949_nl;
  wire[0:0] and_950_nl;
  wire[0:0] mux_405_nl;
  wire[0:0] nor_346_nl;
  wire[0:0] nor_342_nl;
  wire[0:0] nor_343_nl;
  wire[0:0] and_943_nl;
  wire[0:0] and_944_nl;
  wire[0:0] and_945_nl;
  wire[0:0] and_946_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] nor_344_nl;
  wire[0:0] nor_338_nl;
  wire[0:0] nor_339_nl;
  wire[0:0] nor_340_nl;
  wire[0:0] and_939_nl;
  wire[0:0] and_940_nl;
  wire[0:0] and_941_nl;
  wire[0:0] and_942_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] nor_341_nl;
  wire[0:0] nor_333_nl;
  wire[0:0] nand_12_nl;
  wire[0:0] nor_334_nl;
  wire[0:0] nor_335_nl;
  wire[0:0] nor_336_nl;
  wire[0:0] and_935_nl;
  wire[0:0] and_936_nl;
  wire[0:0] and_937_nl;
  wire[0:0] and_938_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] nor_337_nl;
  wire[0:0] nor_324_nl;
  wire[0:0] nand_1_nl;
  wire[0:0] nor_325_nl;
  wire[0:0] nand_2_nl;
  wire[0:0] nor_326_nl;
  wire[0:0] nand_3_nl;
  wire[0:0] nor_327_nl;
  wire[0:0] nand_4_nl;
  wire[0:0] nor_328_nl;
  wire[0:0] nand_5_nl;
  wire[0:0] nor_329_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] nor_330_nl;
  wire[0:0] nand_7_nl;
  wire[0:0] nor_331_nl;
  wire[0:0] nand_8_nl;
  wire[0:0] nor_332_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] and_934_nl;
  wire[0:0] nand_11_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [64:0] nl_rem_13_cmp_a;
  assign nl_rem_13_cmp_a = {{1{rem_13_cmp_a_63_0[63]}}, rem_13_cmp_a_63_0};
  wire [64:0] nl_rem_13_cmp_b;
  assign nl_rem_13_cmp_b = {1'b0 , rem_13_cmp_b_63_0};
  wire [64:0] nl_rem_13_cmp_1_a;
  assign nl_rem_13_cmp_1_a = {{1{rem_13_cmp_1_a_63_0[63]}}, rem_13_cmp_1_a_63_0};
  wire [64:0] nl_rem_13_cmp_1_b;
  assign nl_rem_13_cmp_1_b = {1'b0 , rem_13_cmp_1_b_63_0};
  wire [64:0] nl_rem_13_cmp_2_a;
  assign nl_rem_13_cmp_2_a = {{1{rem_13_cmp_2_a_63_0[63]}}, rem_13_cmp_2_a_63_0};
  wire [64:0] nl_rem_13_cmp_2_b;
  assign nl_rem_13_cmp_2_b = {1'b0 , rem_13_cmp_2_b_63_0};
  wire [64:0] nl_rem_13_cmp_3_a;
  assign nl_rem_13_cmp_3_a = {{1{rem_13_cmp_3_a_63_0[63]}}, rem_13_cmp_3_a_63_0};
  wire [64:0] nl_rem_13_cmp_3_b;
  assign nl_rem_13_cmp_3_b = {1'b0 , rem_13_cmp_3_b_63_0};
  wire [64:0] nl_rem_13_cmp_4_a;
  assign nl_rem_13_cmp_4_a = {{1{rem_13_cmp_4_a_63_0[63]}}, rem_13_cmp_4_a_63_0};
  wire [64:0] nl_rem_13_cmp_4_b;
  assign nl_rem_13_cmp_4_b = {1'b0 , rem_13_cmp_4_b_63_0};
  wire [64:0] nl_rem_13_cmp_5_a;
  assign nl_rem_13_cmp_5_a = {{1{rem_13_cmp_5_a_63_0[63]}}, rem_13_cmp_5_a_63_0};
  wire [64:0] nl_rem_13_cmp_5_b;
  assign nl_rem_13_cmp_5_b = {1'b0 , rem_13_cmp_5_b_63_0};
  wire [64:0] nl_rem_13_cmp_6_a;
  assign nl_rem_13_cmp_6_a = {{1{rem_13_cmp_6_a_63_0[63]}}, rem_13_cmp_6_a_63_0};
  wire [64:0] nl_rem_13_cmp_6_b;
  assign nl_rem_13_cmp_6_b = {1'b0 , rem_13_cmp_6_b_63_0};
  wire [64:0] nl_rem_13_cmp_7_a;
  assign nl_rem_13_cmp_7_a = {{1{rem_13_cmp_7_a_63_0[63]}}, rem_13_cmp_7_a_63_0};
  wire [64:0] nl_rem_13_cmp_7_b;
  assign nl_rem_13_cmp_7_b = {1'b0 , rem_13_cmp_7_b_63_0};
  wire [64:0] nl_rem_13_cmp_8_a;
  assign nl_rem_13_cmp_8_a = {{1{rem_13_cmp_8_a_63_0[63]}}, rem_13_cmp_8_a_63_0};
  wire [64:0] nl_rem_13_cmp_8_b;
  assign nl_rem_13_cmp_8_b = {1'b0 , rem_13_cmp_8_b_63_0};
  wire [64:0] nl_rem_13_cmp_9_a;
  assign nl_rem_13_cmp_9_a = {{1{rem_13_cmp_9_a_63_0[63]}}, rem_13_cmp_9_a_63_0};
  wire [64:0] nl_rem_13_cmp_9_b;
  assign nl_rem_13_cmp_9_b = {1'b0 , rem_13_cmp_9_b_63_0};
  wire [64:0] nl_rem_13_cmp_10_a;
  assign nl_rem_13_cmp_10_a = {{1{rem_13_cmp_10_a_63_0[63]}}, rem_13_cmp_10_a_63_0};
  wire [64:0] nl_rem_13_cmp_10_b;
  assign nl_rem_13_cmp_10_b = {1'b0 , rem_13_cmp_10_b_63_0};
  wire [64:0] nl_rem_13_cmp_11_a;
  assign nl_rem_13_cmp_11_a = {{1{rem_13_cmp_11_a_63_0[63]}}, rem_13_cmp_11_a_63_0};
  wire [64:0] nl_rem_13_cmp_11_b;
  assign nl_rem_13_cmp_11_b = {1'b0 , rem_13_cmp_11_b_63_0};
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
  ccs_in_v1 #(.rscid(32'sd7),
  .width(32'sd1)) ccs_ccore_start_rsci (
      .dat(ccs_ccore_start_rsc_dat),
      .idat(ccs_ccore_start_rsci_idat)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp (
      .a(nl_rem_13_cmp_a[64:0]),
      .b(nl_rem_13_cmp_b[64:0]),
      .z(rem_13_cmp_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_1 (
      .a(nl_rem_13_cmp_1_a[64:0]),
      .b(nl_rem_13_cmp_1_b[64:0]),
      .z(rem_13_cmp_1_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_2 (
      .a(nl_rem_13_cmp_2_a[64:0]),
      .b(nl_rem_13_cmp_2_b[64:0]),
      .z(rem_13_cmp_2_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_3 (
      .a(nl_rem_13_cmp_3_a[64:0]),
      .b(nl_rem_13_cmp_3_b[64:0]),
      .z(rem_13_cmp_3_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_4 (
      .a(nl_rem_13_cmp_4_a[64:0]),
      .b(nl_rem_13_cmp_4_b[64:0]),
      .z(rem_13_cmp_4_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_5 (
      .a(nl_rem_13_cmp_5_a[64:0]),
      .b(nl_rem_13_cmp_5_b[64:0]),
      .z(rem_13_cmp_5_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_6 (
      .a(nl_rem_13_cmp_6_a[64:0]),
      .b(nl_rem_13_cmp_6_b[64:0]),
      .z(rem_13_cmp_6_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_7 (
      .a(nl_rem_13_cmp_7_a[64:0]),
      .b(nl_rem_13_cmp_7_b[64:0]),
      .z(rem_13_cmp_7_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_8 (
      .a(nl_rem_13_cmp_8_a[64:0]),
      .b(nl_rem_13_cmp_8_b[64:0]),
      .z(rem_13_cmp_8_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_9 (
      .a(nl_rem_13_cmp_9_a[64:0]),
      .b(nl_rem_13_cmp_9_b[64:0]),
      .z(rem_13_cmp_9_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_10 (
      .a(nl_rem_13_cmp_10_a[64:0]),
      .b(nl_rem_13_cmp_10_b[64:0]),
      .z(rem_13_cmp_10_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_13_cmp_11 (
      .a(nl_rem_13_cmp_11_a[64:0]),
      .b(nl_rem_13_cmp_11_b[64:0]),
      .z(rem_13_cmp_11_z)
    );
  assign and_1203_cse = ccs_ccore_en & main_stage_0_12 & asn_itm_11;
  assign and_1173_cse = ccs_ccore_en & (and_dcpl_294 | and_dcpl_300 | and_dcpl_306
      | and_dcpl_312 | and_dcpl_318 | and_dcpl_324 | and_dcpl_330 | and_dcpl_336
      | and_dcpl_342 | and_dcpl_348 | and_tmp_35);
  assign and_1175_cse = ccs_ccore_en & (and_dcpl_356 | and_dcpl_360 | and_dcpl_364
      | and_dcpl_368 | and_dcpl_372 | and_dcpl_376 | and_dcpl_379 | and_dcpl_382
      | and_dcpl_385 | and_dcpl_388 | mux_tmp_76);
  assign and_1177_cse = ccs_ccore_en & (and_dcpl_394 | and_dcpl_397 | and_dcpl_400
      | and_dcpl_403 | and_dcpl_406 | and_dcpl_409 | and_dcpl_413 | and_dcpl_417
      | and_dcpl_421 | and_dcpl_425 | and_tmp_80);
  assign and_1179_cse = ccs_ccore_en & (and_dcpl_431 | and_dcpl_433 | and_dcpl_435
      | and_dcpl_437 | and_dcpl_439 | and_dcpl_442 | and_dcpl_445 | and_dcpl_448
      | and_dcpl_451 | and_dcpl_454 | mux_tmp_141);
  assign and_1181_cse = ccs_ccore_en & (and_dcpl_461 | and_dcpl_465 | and_dcpl_469
      | and_dcpl_473 | and_dcpl_477 | and_dcpl_480 | and_dcpl_483 | and_dcpl_486
      | and_dcpl_489 | and_dcpl_492 | and_tmp_125);
  assign and_1183_cse = ccs_ccore_en & (and_dcpl_498 | and_dcpl_500 | and_dcpl_502
      | and_dcpl_504 | and_dcpl_506 | and_dcpl_508 | and_dcpl_510 | and_dcpl_512
      | and_dcpl_514 | and_dcpl_516 | mux_tmp_206);
  assign and_1185_cse = ccs_ccore_en & (and_dcpl_520 | and_dcpl_523 | and_dcpl_526
      | and_dcpl_529 | and_dcpl_532 | and_dcpl_534 | and_dcpl_536 | and_dcpl_538
      | and_dcpl_540 | and_dcpl_542 | and_tmp_170);
  assign and_1187_cse = ccs_ccore_en & (and_dcpl_546 | and_dcpl_548 | and_dcpl_550
      | and_dcpl_552 | and_dcpl_554 | and_dcpl_556 | and_dcpl_558 | and_dcpl_560
      | and_dcpl_562 | and_dcpl_564 | mux_tmp_271);
  assign and_1189_cse = ccs_ccore_en & (and_dcpl_569 | and_dcpl_573 | and_dcpl_577
      | and_dcpl_581 | and_dcpl_585 | and_dcpl_589 | and_dcpl_593 | and_dcpl_597
      | and_dcpl_601 | and_dcpl_605 | and_tmp_206);
  assign and_1191_cse = ccs_ccore_en & (and_dcpl_610 | and_dcpl_612 | and_dcpl_614
      | and_dcpl_616 | and_dcpl_618 | and_dcpl_622 | and_dcpl_625 | and_dcpl_628
      | and_dcpl_631 | and_dcpl_634 | mux_tmp_354);
  assign and_1193_cse = ccs_ccore_en & (and_dcpl_638 | and_dcpl_641 | and_dcpl_644
      | and_dcpl_647 | and_dcpl_650 | and_dcpl_653 | and_dcpl_657 | and_dcpl_661
      | and_dcpl_665 | and_dcpl_669 | and_tmp_233);
  assign and_1195_cse = ccs_ccore_en & (and_dcpl_673 | and_dcpl_675 | and_dcpl_677
      | and_dcpl_679 | and_dcpl_681 | and_dcpl_684 | and_dcpl_687 | and_dcpl_690
      | and_dcpl_693 | and_dcpl_696 | mux_tmp_437);
  assign and_1205_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_2;
  assign and_1207_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_6;
  assign and_1209_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_9;
  assign and_1211_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_11;
  assign and_1213_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_2;
  assign and_1215_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_6;
  assign and_1217_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_9;
  assign and_1219_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_11;
  assign and_1221_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_18 & (~ (rem_12cyc_st_10_1_0[0]));
  assign and_1223_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_18 & (rem_12cyc_st_10_1_0[0]);
  assign and_1225_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_23 & (~ (rem_12cyc_st_10_1_0[0]));
  assign and_1227_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_23 & (rem_12cyc_st_10_1_0[0]);
  assign and_1229_cse = ccs_ccore_en & and_dcpl_3;
  assign and_1231_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_29;
  assign and_1233_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_33;
  assign and_1235_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_36;
  assign and_1237_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_38;
  assign and_1239_cse = ccs_ccore_en & and_dcpl_40 & and_dcpl_29;
  assign and_1241_cse = ccs_ccore_en & and_dcpl_40 & and_dcpl_33;
  assign and_1243_cse = ccs_ccore_en & and_dcpl_40 & and_dcpl_36;
  assign and_1245_cse = ccs_ccore_en & and_dcpl_40 & and_dcpl_38;
  assign and_1247_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_45 & (~ (rem_12cyc_st_9_1_0[0]));
  assign and_1249_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_45 & (rem_12cyc_st_9_1_0[0]);
  assign and_1251_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_50 & (~ (rem_12cyc_st_9_1_0[0]));
  assign and_1253_cse = ccs_ccore_en & and_dcpl_31 & and_dcpl_50 & (rem_12cyc_st_9_1_0[0]);
  assign and_1255_cse = ccs_ccore_en & and_dcpl_30;
  assign and_1257_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_56;
  assign and_1259_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_60;
  assign and_1261_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_63;
  assign and_1263_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_65;
  assign and_1265_cse = ccs_ccore_en & and_dcpl_67 & and_dcpl_56;
  assign and_1267_cse = ccs_ccore_en & and_dcpl_67 & and_dcpl_60;
  assign and_1269_cse = ccs_ccore_en & and_dcpl_67 & and_dcpl_63;
  assign and_1271_cse = ccs_ccore_en & and_dcpl_67 & and_dcpl_65;
  assign and_1273_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_72 & (~ (rem_12cyc_st_8_1_0[0]));
  assign and_1275_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_72 & (rem_12cyc_st_8_1_0[0]);
  assign and_1277_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_77 & (~ (rem_12cyc_st_8_1_0[0]));
  assign and_1279_cse = ccs_ccore_en & and_dcpl_58 & and_dcpl_77 & (rem_12cyc_st_8_1_0[0]);
  assign and_1281_cse = ccs_ccore_en & and_dcpl_57;
  assign and_1283_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_83;
  assign and_1285_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_87;
  assign and_1287_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_90;
  assign and_1289_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_92;
  assign and_1291_cse = ccs_ccore_en & and_dcpl_94 & and_dcpl_83;
  assign and_1293_cse = ccs_ccore_en & and_dcpl_94 & and_dcpl_87;
  assign and_1295_cse = ccs_ccore_en & and_dcpl_94 & and_dcpl_90;
  assign and_1297_cse = ccs_ccore_en & and_dcpl_94 & and_dcpl_92;
  assign and_1299_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_99 & (~ (rem_12cyc_st_7_1_0[0]));
  assign and_1301_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_99 & (rem_12cyc_st_7_1_0[0]);
  assign and_1303_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_104 & (~ (rem_12cyc_st_7_1_0[0]));
  assign and_1305_cse = ccs_ccore_en & and_dcpl_85 & and_dcpl_104 & (rem_12cyc_st_7_1_0[0]);
  assign and_1307_cse = ccs_ccore_en & and_dcpl_84;
  assign and_1309_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_110;
  assign and_1311_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_115;
  assign and_1313_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_117;
  assign and_1315_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_119;
  assign and_1317_cse = ccs_ccore_en & and_dcpl_121 & and_dcpl_110;
  assign and_1319_cse = ccs_ccore_en & and_dcpl_121 & and_dcpl_115;
  assign and_1321_cse = ccs_ccore_en & and_dcpl_121 & and_dcpl_117;
  assign and_1323_cse = ccs_ccore_en & and_dcpl_121 & and_dcpl_119;
  assign and_1325_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_126 & (~ (rem_12cyc_st_6_1_0[1]));
  assign and_1327_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_129 & (~ (rem_12cyc_st_6_1_0[1]));
  assign and_1329_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_126 & (rem_12cyc_st_6_1_0[1]);
  assign and_1331_cse = ccs_ccore_en & and_dcpl_112 & and_dcpl_129 & (rem_12cyc_st_6_1_0[1]);
  assign and_1333_cse = ccs_ccore_en & and_dcpl_111;
  assign and_1335_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_137;
  assign and_1337_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_141;
  assign and_1339_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_144;
  assign and_1341_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_146;
  assign and_1343_cse = ccs_ccore_en & and_dcpl_148 & and_dcpl_137;
  assign and_1345_cse = ccs_ccore_en & and_dcpl_148 & and_dcpl_141;
  assign and_1347_cse = ccs_ccore_en & and_dcpl_148 & and_dcpl_144;
  assign and_1349_cse = ccs_ccore_en & and_dcpl_148 & and_dcpl_146;
  assign and_1351_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_153 & (~ (rem_12cyc_st_5_1_0[0]));
  assign and_1353_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_153 & (rem_12cyc_st_5_1_0[0]);
  assign and_1355_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_158 & (~ (rem_12cyc_st_5_1_0[0]));
  assign and_1357_cse = ccs_ccore_en & and_dcpl_139 & and_dcpl_158 & (rem_12cyc_st_5_1_0[0]);
  assign and_1359_cse = ccs_ccore_en & and_dcpl_138;
  assign and_1361_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_164;
  assign and_1363_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_168;
  assign and_1365_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_171;
  assign and_1367_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_173;
  assign and_1369_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_175 & (~ (rem_12cyc_st_4_1_0[0]));
  assign and_1371_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_175 & (rem_12cyc_st_4_1_0[0]);
  assign and_1373_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_180 & (~ (rem_12cyc_st_4_1_0[0]));
  assign and_1375_cse = ccs_ccore_en & and_dcpl_166 & and_dcpl_180 & (rem_12cyc_st_4_1_0[0]);
  assign and_1377_cse = ccs_ccore_en & and_dcpl_185 & and_dcpl_164;
  assign and_1379_cse = ccs_ccore_en & and_dcpl_185 & and_dcpl_168;
  assign and_1381_cse = ccs_ccore_en & and_dcpl_185 & and_dcpl_171;
  assign and_1383_cse = ccs_ccore_en & and_dcpl_185 & and_dcpl_173;
  assign and_1385_cse = ccs_ccore_en & and_dcpl_165;
  assign and_1387_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_191;
  assign and_1389_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_195;
  assign and_1391_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_198;
  assign and_1393_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_200;
  assign and_1395_cse = ccs_ccore_en & and_dcpl_202 & and_dcpl_191;
  assign and_1397_cse = ccs_ccore_en & and_dcpl_202 & and_dcpl_195;
  assign and_1399_cse = ccs_ccore_en & and_dcpl_202 & and_dcpl_198;
  assign and_1401_cse = ccs_ccore_en & and_dcpl_202 & and_dcpl_200;
  assign and_1403_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_207 & (~ (rem_12cyc_st_3_1_0[0]));
  assign and_1405_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_207 & (rem_12cyc_st_3_1_0[0]);
  assign and_1407_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_212 & (~ (rem_12cyc_st_3_1_0[0]));
  assign and_1409_cse = ccs_ccore_en & and_dcpl_193 & and_dcpl_212 & (rem_12cyc_st_3_1_0[0]);
  assign and_1411_cse = ccs_ccore_en & and_dcpl_192;
  assign and_1413_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_218;
  assign and_1415_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_222;
  assign and_1417_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_225;
  assign and_1419_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_227;
  assign and_1421_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_229 & (~ (rem_12cyc_st_2_1_0[0]));
  assign and_1423_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_229 & (rem_12cyc_st_2_1_0[0]);
  assign and_1425_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_234 & (~ (rem_12cyc_st_2_1_0[0]));
  assign and_1427_cse = ccs_ccore_en & and_dcpl_220 & and_dcpl_234 & (rem_12cyc_st_2_1_0[0]);
  assign and_1429_cse = ccs_ccore_en & and_dcpl_239 & and_dcpl_218;
  assign and_1431_cse = ccs_ccore_en & and_dcpl_239 & and_dcpl_222;
  assign and_1433_cse = ccs_ccore_en & and_dcpl_239 & and_dcpl_225;
  assign and_1435_cse = ccs_ccore_en & and_dcpl_239 & and_dcpl_227;
  assign and_1437_cse = ccs_ccore_en & and_dcpl_219;
  assign and_1439_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_245;
  assign and_1441_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_249;
  assign and_1443_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_252;
  assign and_1445_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_254;
  assign and_1447_cse = ccs_ccore_en & and_dcpl_256 & and_dcpl_245;
  assign and_1449_cse = ccs_ccore_en & and_dcpl_256 & and_dcpl_249;
  assign and_1451_cse = ccs_ccore_en & and_dcpl_256 & and_dcpl_252;
  assign and_1453_cse = ccs_ccore_en & and_dcpl_256 & and_dcpl_254;
  assign and_1455_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_261 & (~ (rem_12cyc_1_0[0]));
  assign and_1457_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_261 & (rem_12cyc_1_0[0]);
  assign and_1459_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_266 & (~ (rem_12cyc_1_0[0]));
  assign and_1461_cse = ccs_ccore_en & and_dcpl_247 & and_dcpl_266 & (rem_12cyc_1_0[0]);
  assign and_1463_cse = ccs_ccore_en & and_dcpl_246;
  assign and_1197_cse = ccs_ccore_en & ccs_ccore_start_rsci_idat;
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
  assign result_sva_duc_mx0 = MUX1HOT_v_64_13_2((rem_13_cmp_1_z[63:0]), (rem_13_cmp_2_z[63:0]),
      (rem_13_cmp_3_z[63:0]), (rem_13_cmp_4_z[63:0]), (rem_13_cmp_5_z[63:0]), (rem_13_cmp_6_z[63:0]),
      (rem_13_cmp_7_z[63:0]), (rem_13_cmp_8_z[63:0]), (rem_13_cmp_9_z[63:0]), (rem_13_cmp_10_z[63:0]),
      (rem_13_cmp_11_z[63:0]), (rem_13_cmp_z[63:0]), result_sva_duc, {and_273_nl
      , and_275_nl , and_277_nl , and_279_nl , and_281_nl , and_282_nl , and_283_nl
      , and_284_nl , and_286_nl , and_287_nl , and_288_nl , and_289_nl , and_290_nl});
  assign nl_acc_1_tmp = ({rem_12cyc_3_2 , rem_12cyc_1_0}) + 4'b0001;
  assign acc_1_tmp = nl_acc_1_tmp[3:0];
  assign xor_nl = (acc_1_tmp[2]) ^ (acc_1_tmp[3]);
  assign nor_nl = ~((acc_1_tmp[3:2]!=2'b10));
  assign nl_acc_tmp = conv_u2u_1_2(xor_nl) + conv_u2u_1_2(nor_nl);
  assign acc_tmp = nl_acc_tmp[1:0];
  assign and_dcpl_1 = ~((rem_12cyc_st_10_3_2[1]) | (rem_12cyc_st_10_1_0[1]));
  assign and_dcpl_2 = and_dcpl_1 & (~ (rem_12cyc_st_10_1_0[0]));
  assign and_dcpl_3 = main_stage_0_11 & asn_itm_10;
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
  assign and_dcpl_30 = main_stage_0_10 & asn_itm_9;
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
  assign and_dcpl_57 = main_stage_0_9 & asn_itm_8;
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
  assign and_dcpl_84 = main_stage_0_8 & asn_itm_7;
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
  assign and_dcpl_111 = main_stage_0_7 & asn_itm_6;
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
  assign and_dcpl_138 = main_stage_0_6 & asn_itm_5;
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
  assign and_dcpl_165 = main_stage_0_5 & asn_itm_4;
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
  assign and_dcpl_192 = main_stage_0_4 & asn_itm_3;
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
  assign and_dcpl_219 = main_stage_0_3 & asn_itm_2;
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
  assign and_dcpl_246 = main_stage_0_2 & asn_itm_1;
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
  assign and_dcpl_291 = ~((acc_1_tmp[1:0]!=2'b00));
  assign and_dcpl_292 = ccs_ccore_start_rsci_idat & (~ (acc_tmp[0]));
  assign and_dcpl_293 = and_dcpl_292 & (~ (acc_tmp[1]));
  assign and_dcpl_294 = and_dcpl_293 & and_dcpl_291;
  assign and_dcpl_295 = ~((rem_12cyc_st_2_3_2!=2'b00));
  assign and_dcpl_296 = and_dcpl_295 & (~ (rem_12cyc_st_2_1_0[1]));
  assign and_dcpl_298 = (~ (rem_12cyc_st_2_1_0[0])) & main_stage_0_3 & asn_itm_2;
  assign not_tmp_54 = ~(asn_itm_1 & main_stage_0_2);
  assign or_tmp_2 = (rem_12cyc_1_0!=2'b00) | (rem_12cyc_3_2!=2'b00) | not_tmp_54;
  assign or_1_cse = (acc_1_tmp[1:0]!=2'b00) | (acc_tmp!=2'b00);
  assign nor_518_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_2));
  assign mux_14_nl = MUX_s_1_2_2(nor_518_nl, or_tmp_2, or_1_cse);
  assign and_dcpl_300 = mux_14_nl & and_dcpl_298 & and_dcpl_296;
  assign and_dcpl_301 = ~((rem_12cyc_st_3_3_2!=2'b00));
  assign and_dcpl_302 = and_dcpl_301 & (~ (rem_12cyc_st_3_1_0[1]));
  assign and_dcpl_304 = (~ (rem_12cyc_st_3_1_0[0])) & main_stage_0_4 & asn_itm_3;
  assign or_6_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b00) | (~ asn_itm_2)
      | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp = or_6_cse & or_tmp_2;
  assign nor_517_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp));
  assign mux_15_nl = MUX_s_1_2_2(nor_517_nl, and_tmp, or_1_cse);
  assign and_dcpl_306 = mux_15_nl & and_dcpl_304 & and_dcpl_302;
  assign and_dcpl_307 = ~((rem_12cyc_st_4_3_2!=2'b00));
  assign and_dcpl_308 = and_dcpl_307 & (~ (rem_12cyc_st_4_1_0[1]));
  assign and_dcpl_310 = (~ (rem_12cyc_st_4_1_0[0])) & main_stage_0_5 & asn_itm_4;
  assign or_10_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b00) | (~ asn_itm_3)
      | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_2 = or_6_cse & or_10_cse & or_tmp_2;
  assign nor_516_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_2));
  assign mux_16_nl = MUX_s_1_2_2(nor_516_nl, and_tmp_2, or_1_cse);
  assign and_dcpl_312 = mux_16_nl & and_dcpl_310 & and_dcpl_308;
  assign and_dcpl_313 = ~((rem_12cyc_st_5_3_2!=2'b00));
  assign and_dcpl_314 = and_dcpl_313 & (~ (rem_12cyc_st_5_1_0[1]));
  assign and_dcpl_316 = (~ (rem_12cyc_st_5_1_0[0])) & main_stage_0_6 & asn_itm_5;
  assign or_15_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b00) | (~ asn_itm_4)
      | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_5 = or_6_cse & or_10_cse & or_15_cse & or_tmp_2;
  assign nor_515_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_5));
  assign mux_17_nl = MUX_s_1_2_2(nor_515_nl, and_tmp_5, or_1_cse);
  assign and_dcpl_318 = mux_17_nl & and_dcpl_316 & and_dcpl_314;
  assign or_21_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b00) | (~ asn_itm_5)
      | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_9 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & or_tmp_2;
  assign nor_514_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_9));
  assign mux_18_nl = MUX_s_1_2_2(nor_514_nl, and_tmp_9, or_1_cse);
  assign and_dcpl_324 = mux_18_nl & and_dcpl_112 & and_dcpl_110;
  assign or_28_cse = (rem_12cyc_st_6_1_0!=2'b00) | (rem_12cyc_st_6_3_2!=2'b00);
  assign nor_512_nl = ~(and_dcpl_111 | (~ or_tmp_2));
  assign mux_19_nl = MUX_s_1_2_2(nor_512_nl, or_tmp_2, or_28_cse);
  assign and_tmp_13 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & mux_19_nl;
  assign nor_513_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_13));
  assign mux_20_nl = MUX_s_1_2_2(nor_513_nl, and_tmp_13, or_1_cse);
  assign and_dcpl_330 = mux_20_nl & and_dcpl_85 & and_dcpl_83;
  assign or_37_cse = (rem_12cyc_st_7_1_0!=2'b00) | (rem_12cyc_st_7_3_2!=2'b00);
  assign nor_509_nl = ~(and_dcpl_84 | (~ or_tmp_2));
  assign mux_tmp_19 = MUX_s_1_2_2(nor_509_nl, or_tmp_2, or_37_cse);
  assign nor_510_nl = ~(and_dcpl_111 | (~ mux_tmp_19));
  assign mux_22_nl = MUX_s_1_2_2(nor_510_nl, mux_tmp_19, or_28_cse);
  assign and_tmp_17 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & mux_22_nl;
  assign nor_511_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_17));
  assign mux_23_nl = MUX_s_1_2_2(nor_511_nl, and_tmp_17, or_1_cse);
  assign and_dcpl_336 = mux_23_nl & and_dcpl_58 & and_dcpl_56;
  assign or_48_cse = (rem_12cyc_st_8_1_0!=2'b00) | (rem_12cyc_st_8_3_2!=2'b00);
  assign nor_505_nl = ~(and_dcpl_57 | (~ or_tmp_2));
  assign mux_tmp_22 = MUX_s_1_2_2(nor_505_nl, or_tmp_2, or_48_cse);
  assign nor_506_nl = ~(and_dcpl_84 | (~ mux_tmp_22));
  assign mux_tmp_23 = MUX_s_1_2_2(nor_506_nl, mux_tmp_22, or_37_cse);
  assign nor_507_nl = ~(and_dcpl_111 | (~ mux_tmp_23));
  assign mux_26_nl = MUX_s_1_2_2(nor_507_nl, mux_tmp_23, or_28_cse);
  assign and_tmp_21 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & mux_26_nl;
  assign nor_508_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_21));
  assign mux_27_nl = MUX_s_1_2_2(nor_508_nl, and_tmp_21, or_1_cse);
  assign and_dcpl_342 = mux_27_nl & and_dcpl_31 & and_dcpl_29;
  assign nor_500_nl = ~(and_dcpl_30 | (~ or_tmp_2));
  assign or_61_nl = (rem_12cyc_st_9_1_0!=2'b00) | (rem_12cyc_st_9_3_2!=2'b00);
  assign mux_tmp_26 = MUX_s_1_2_2(nor_500_nl, or_tmp_2, or_61_nl);
  assign nor_501_nl = ~(and_dcpl_57 | (~ mux_tmp_26));
  assign mux_tmp_27 = MUX_s_1_2_2(nor_501_nl, mux_tmp_26, or_48_cse);
  assign nor_502_nl = ~(and_dcpl_84 | (~ mux_tmp_27));
  assign mux_tmp_28 = MUX_s_1_2_2(nor_502_nl, mux_tmp_27, or_37_cse);
  assign nor_503_nl = ~(and_dcpl_111 | (~ mux_tmp_28));
  assign mux_31_nl = MUX_s_1_2_2(nor_503_nl, mux_tmp_28, or_28_cse);
  assign and_tmp_25 = or_6_cse & or_10_cse & or_15_cse & or_21_cse & mux_31_nl;
  assign nor_504_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_25));
  assign mux_32_nl = MUX_s_1_2_2(nor_504_nl, and_tmp_25, or_1_cse);
  assign and_dcpl_348 = mux_32_nl & and_dcpl_4 & and_dcpl_2;
  assign and_tmp_35 = ((~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b00)
      | (rem_12cyc_1_0!=2'b00)) & ((~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b00)
      | (rem_12cyc_st_7_3_2!=2'b00)) & ((~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b00)
      | (rem_12cyc_st_8_3_2!=2'b00)) & ((~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b00)
      | (rem_12cyc_st_9_3_2!=2'b00)) & or_6_cse & or_10_cse & or_15_cse & or_21_cse
      & ((~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b00) | (rem_12cyc_st_6_3_2!=2'b00))
      & ((~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b00) | (rem_12cyc_st_10_3_2!=2'b00))
      & ((acc_tmp!=2'b00) | (acc_1_tmp[1:0]!=2'b00) | (~ ccs_ccore_start_rsci_idat));
  assign and_dcpl_355 = (acc_1_tmp[1:0]==2'b01);
  assign and_dcpl_356 = and_dcpl_293 & and_dcpl_355;
  assign and_dcpl_358 = (rem_12cyc_st_2_1_0[0]) & main_stage_0_3 & asn_itm_2;
  assign or_tmp_80 = (rem_12cyc_1_0!=2'b01) | (rem_12cyc_3_2!=2'b00) | not_tmp_54;
  assign or_83_cse = (acc_1_tmp[1:0]!=2'b01) | (acc_tmp!=2'b00);
  assign nor_499_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_80));
  assign mux_33_nl = MUX_s_1_2_2(nor_499_nl, or_tmp_80, or_83_cse);
  assign and_dcpl_360 = mux_33_nl & and_dcpl_358 & and_dcpl_296;
  assign and_dcpl_362 = (rem_12cyc_st_3_1_0[0]) & main_stage_0_4 & asn_itm_3;
  assign nand_276_cse = ~(asn_itm_2 & main_stage_0_3 & (rem_12cyc_st_2_1_0[0]));
  assign or_88_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b00);
  assign and_1168_nl = nand_276_cse & or_tmp_80;
  assign mux_tmp_32 = MUX_s_1_2_2(and_1168_nl, or_tmp_80, or_88_cse);
  assign nor_498_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_32));
  assign mux_35_nl = MUX_s_1_2_2(nor_498_nl, mux_tmp_32, or_83_cse);
  assign and_dcpl_364 = mux_35_nl & and_dcpl_362 & and_dcpl_302;
  assign and_dcpl_366 = (rem_12cyc_st_4_1_0[0]) & main_stage_0_5 & asn_itm_4;
  assign nand_274_cse = ~(asn_itm_3 & main_stage_0_4 & (rem_12cyc_st_3_1_0[0]));
  assign or_93_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b00);
  assign and_1166_nl = nand_274_cse & or_tmp_80;
  assign mux_tmp_34 = MUX_s_1_2_2(and_1166_nl, or_tmp_80, or_93_cse);
  assign and_1167_nl = nand_276_cse & mux_tmp_34;
  assign mux_tmp_35 = MUX_s_1_2_2(and_1167_nl, mux_tmp_34, or_88_cse);
  assign nor_497_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_35));
  assign mux_38_nl = MUX_s_1_2_2(nor_497_nl, mux_tmp_35, or_83_cse);
  assign and_dcpl_368 = mux_38_nl & and_dcpl_366 & and_dcpl_308;
  assign and_dcpl_370 = (rem_12cyc_st_5_1_0[0]) & main_stage_0_6 & asn_itm_5;
  assign nand_271_cse = ~(asn_itm_4 & main_stage_0_5 & (rem_12cyc_st_4_1_0[0]));
  assign or_100_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b00);
  assign and_1163_nl = nand_271_cse & or_tmp_80;
  assign mux_tmp_37 = MUX_s_1_2_2(and_1163_nl, or_tmp_80, or_100_cse);
  assign and_1164_nl = nand_274_cse & mux_tmp_37;
  assign mux_tmp_38 = MUX_s_1_2_2(and_1164_nl, mux_tmp_37, or_93_cse);
  assign and_1165_nl = nand_276_cse & mux_tmp_38;
  assign mux_tmp_39 = MUX_s_1_2_2(and_1165_nl, mux_tmp_38, or_88_cse);
  assign nor_496_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_39));
  assign mux_42_nl = MUX_s_1_2_2(nor_496_nl, mux_tmp_39, or_83_cse);
  assign and_dcpl_372 = mux_42_nl & and_dcpl_370 & and_dcpl_314;
  assign nand_267_cse = ~(asn_itm_5 & main_stage_0_6 & (rem_12cyc_st_5_1_0[0]));
  assign or_109_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b00);
  assign and_1159_nl = nand_267_cse & or_tmp_80;
  assign mux_tmp_41 = MUX_s_1_2_2(and_1159_nl, or_tmp_80, or_109_cse);
  assign and_1160_nl = nand_271_cse & mux_tmp_41;
  assign mux_tmp_42 = MUX_s_1_2_2(and_1160_nl, mux_tmp_41, or_100_cse);
  assign and_1161_nl = nand_274_cse & mux_tmp_42;
  assign mux_tmp_43 = MUX_s_1_2_2(and_1161_nl, mux_tmp_42, or_93_cse);
  assign and_1162_nl = nand_276_cse & mux_tmp_43;
  assign mux_tmp_44 = MUX_s_1_2_2(and_1162_nl, mux_tmp_43, or_88_cse);
  assign nor_495_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_44));
  assign mux_47_nl = MUX_s_1_2_2(nor_495_nl, mux_tmp_44, or_83_cse);
  assign and_dcpl_376 = mux_47_nl & and_dcpl_112 & and_dcpl_115;
  assign or_120_cse = (rem_12cyc_st_6_1_0!=2'b01) | (rem_12cyc_st_6_3_2!=2'b00);
  assign nor_493_nl = ~(and_dcpl_111 | (~ or_tmp_80));
  assign mux_tmp_46 = MUX_s_1_2_2(nor_493_nl, or_tmp_80, or_120_cse);
  assign and_1155_nl = nand_267_cse & mux_tmp_46;
  assign mux_tmp_47 = MUX_s_1_2_2(and_1155_nl, mux_tmp_46, or_109_cse);
  assign and_1156_nl = nand_271_cse & mux_tmp_47;
  assign mux_tmp_48 = MUX_s_1_2_2(and_1156_nl, mux_tmp_47, or_100_cse);
  assign and_1157_nl = nand_274_cse & mux_tmp_48;
  assign mux_tmp_49 = MUX_s_1_2_2(and_1157_nl, mux_tmp_48, or_93_cse);
  assign and_1158_nl = nand_276_cse & mux_tmp_49;
  assign mux_tmp_50 = MUX_s_1_2_2(and_1158_nl, mux_tmp_49, or_88_cse);
  assign nor_494_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_50));
  assign mux_53_nl = MUX_s_1_2_2(nor_494_nl, mux_tmp_50, or_83_cse);
  assign and_dcpl_379 = mux_53_nl & and_dcpl_85 & and_dcpl_87;
  assign or_133_cse = (rem_12cyc_st_7_1_0!=2'b01) | (rem_12cyc_st_7_3_2!=2'b00);
  assign nor_490_nl = ~(and_dcpl_84 | (~ or_tmp_80));
  assign mux_tmp_52 = MUX_s_1_2_2(nor_490_nl, or_tmp_80, or_133_cse);
  assign nor_491_nl = ~(and_dcpl_111 | (~ mux_tmp_52));
  assign mux_tmp_53 = MUX_s_1_2_2(nor_491_nl, mux_tmp_52, or_120_cse);
  assign and_1151_nl = nand_267_cse & mux_tmp_53;
  assign mux_tmp_54 = MUX_s_1_2_2(and_1151_nl, mux_tmp_53, or_109_cse);
  assign and_1152_nl = nand_271_cse & mux_tmp_54;
  assign mux_tmp_55 = MUX_s_1_2_2(and_1152_nl, mux_tmp_54, or_100_cse);
  assign and_1153_nl = nand_274_cse & mux_tmp_55;
  assign mux_tmp_56 = MUX_s_1_2_2(and_1153_nl, mux_tmp_55, or_93_cse);
  assign and_1154_nl = nand_276_cse & mux_tmp_56;
  assign mux_tmp_57 = MUX_s_1_2_2(and_1154_nl, mux_tmp_56, or_88_cse);
  assign nor_492_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_57));
  assign mux_60_nl = MUX_s_1_2_2(nor_492_nl, mux_tmp_57, or_83_cse);
  assign and_dcpl_382 = mux_60_nl & and_dcpl_58 & and_dcpl_60;
  assign or_148_cse = (rem_12cyc_st_8_1_0!=2'b01) | (rem_12cyc_st_8_3_2!=2'b00);
  assign nor_486_nl = ~(and_dcpl_57 | (~ or_tmp_80));
  assign mux_tmp_59 = MUX_s_1_2_2(nor_486_nl, or_tmp_80, or_148_cse);
  assign nor_487_nl = ~(and_dcpl_84 | (~ mux_tmp_59));
  assign mux_tmp_60 = MUX_s_1_2_2(nor_487_nl, mux_tmp_59, or_133_cse);
  assign nor_488_nl = ~(and_dcpl_111 | (~ mux_tmp_60));
  assign mux_tmp_61 = MUX_s_1_2_2(nor_488_nl, mux_tmp_60, or_120_cse);
  assign and_1147_nl = nand_267_cse & mux_tmp_61;
  assign mux_tmp_62 = MUX_s_1_2_2(and_1147_nl, mux_tmp_61, or_109_cse);
  assign and_1148_nl = nand_271_cse & mux_tmp_62;
  assign mux_tmp_63 = MUX_s_1_2_2(and_1148_nl, mux_tmp_62, or_100_cse);
  assign and_1149_nl = nand_274_cse & mux_tmp_63;
  assign mux_tmp_64 = MUX_s_1_2_2(and_1149_nl, mux_tmp_63, or_93_cse);
  assign and_1150_nl = nand_276_cse & mux_tmp_64;
  assign mux_tmp_65 = MUX_s_1_2_2(and_1150_nl, mux_tmp_64, or_88_cse);
  assign nor_489_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_65));
  assign mux_68_nl = MUX_s_1_2_2(nor_489_nl, mux_tmp_65, or_83_cse);
  assign and_dcpl_385 = mux_68_nl & and_dcpl_31 & and_dcpl_33;
  assign nor_481_nl = ~(and_dcpl_30 | (~ or_tmp_80));
  assign or_165_nl = (rem_12cyc_st_9_1_0!=2'b01) | (rem_12cyc_st_9_3_2!=2'b00);
  assign mux_tmp_67 = MUX_s_1_2_2(nor_481_nl, or_tmp_80, or_165_nl);
  assign nor_482_nl = ~(and_dcpl_57 | (~ mux_tmp_67));
  assign mux_tmp_68 = MUX_s_1_2_2(nor_482_nl, mux_tmp_67, or_148_cse);
  assign nor_483_nl = ~(and_dcpl_84 | (~ mux_tmp_68));
  assign mux_tmp_69 = MUX_s_1_2_2(nor_483_nl, mux_tmp_68, or_133_cse);
  assign nor_484_nl = ~(and_dcpl_111 | (~ mux_tmp_69));
  assign mux_tmp_70 = MUX_s_1_2_2(nor_484_nl, mux_tmp_69, or_120_cse);
  assign and_1143_nl = nand_267_cse & mux_tmp_70;
  assign mux_tmp_71 = MUX_s_1_2_2(and_1143_nl, mux_tmp_70, or_109_cse);
  assign and_1144_nl = nand_271_cse & mux_tmp_71;
  assign mux_tmp_72 = MUX_s_1_2_2(and_1144_nl, mux_tmp_71, or_100_cse);
  assign and_1145_nl = nand_274_cse & mux_tmp_72;
  assign mux_tmp_73 = MUX_s_1_2_2(and_1145_nl, mux_tmp_72, or_93_cse);
  assign and_1146_nl = nand_276_cse & mux_tmp_73;
  assign mux_tmp_74 = MUX_s_1_2_2(and_1146_nl, mux_tmp_73, or_88_cse);
  assign nor_485_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_74));
  assign mux_77_nl = MUX_s_1_2_2(nor_485_nl, mux_tmp_74, or_83_cse);
  assign and_dcpl_388 = mux_77_nl & and_dcpl_4 & and_dcpl_6;
  assign nand_250_cse = ~((acc_1_tmp[0]) & ccs_ccore_start_rsci_idat);
  assign and_tmp_44 = ((~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b01)
      | (rem_12cyc_st_7_3_2!=2'b00)) & ((~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b01)
      | (rem_12cyc_st_8_3_2!=2'b00)) & ((~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b01)
      | (rem_12cyc_st_9_3_2!=2'b00)) & ((~ main_stage_0_3) | (~ asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b01)
      | (rem_12cyc_st_2_3_2!=2'b00)) & ((~ main_stage_0_4) | (~ asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b01)
      | (rem_12cyc_st_3_3_2!=2'b00)) & ((~ main_stage_0_5) | (~ asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b01)
      | (rem_12cyc_st_4_3_2!=2'b00)) & ((~ main_stage_0_6) | (~ asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b01)
      | (rem_12cyc_st_5_3_2!=2'b00)) & ((~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b01)
      | (rem_12cyc_st_6_3_2!=2'b00)) & ((~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b01)
      | (rem_12cyc_st_10_3_2!=2'b00)) & ((acc_tmp!=2'b00) | (acc_1_tmp[1]) | nand_250_cse);
  assign nor_480_nl = ~((rem_12cyc_1_0[0]) | (~ and_tmp_44));
  assign or_175_nl = (~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b00)
      | (rem_12cyc_1_0[1]);
  assign mux_tmp_76 = MUX_s_1_2_2(nor_480_nl, and_tmp_44, or_175_nl);
  assign and_dcpl_393 = (acc_1_tmp[1:0]==2'b10);
  assign and_dcpl_394 = and_dcpl_293 & and_dcpl_393;
  assign and_dcpl_395 = and_dcpl_295 & (rem_12cyc_st_2_1_0[1]);
  assign or_tmp_185 = (rem_12cyc_1_0!=2'b10) | (rem_12cyc_3_2!=2'b00) | not_tmp_54;
  assign or_190_cse = (acc_1_tmp[1:0]!=2'b10) | (acc_tmp!=2'b00);
  assign nor_479_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_185));
  assign mux_79_nl = MUX_s_1_2_2(nor_479_nl, or_tmp_185, or_190_cse);
  assign and_dcpl_397 = mux_79_nl & and_dcpl_298 & and_dcpl_395;
  assign and_dcpl_398 = and_dcpl_301 & (rem_12cyc_st_3_1_0[1]);
  assign or_195_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b00) |
      (~ asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_45 = or_195_cse & or_tmp_185;
  assign nor_478_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_45));
  assign mux_80_nl = MUX_s_1_2_2(nor_478_nl, and_tmp_45, or_190_cse);
  assign and_dcpl_400 = mux_80_nl & and_dcpl_304 & and_dcpl_398;
  assign and_dcpl_401 = and_dcpl_307 & (rem_12cyc_st_4_1_0[1]);
  assign or_199_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b00) |
      (~ asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_47 = or_195_cse & or_199_cse & or_tmp_185;
  assign nor_477_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_47));
  assign mux_81_nl = MUX_s_1_2_2(nor_477_nl, and_tmp_47, or_190_cse);
  assign and_dcpl_403 = mux_81_nl & and_dcpl_310 & and_dcpl_401;
  assign and_dcpl_404 = and_dcpl_313 & (rem_12cyc_st_5_1_0[1]);
  assign or_204_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b00) |
      (~ asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_50 = or_195_cse & or_199_cse & or_204_cse & or_tmp_185;
  assign nor_476_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_50));
  assign mux_82_nl = MUX_s_1_2_2(nor_476_nl, and_tmp_50, or_190_cse);
  assign and_dcpl_406 = mux_82_nl & and_dcpl_316 & and_dcpl_404;
  assign or_210_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b00) |
      (~ asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_54 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & or_tmp_185;
  assign nor_475_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_54));
  assign mux_83_nl = MUX_s_1_2_2(nor_475_nl, and_tmp_54, or_190_cse);
  assign and_dcpl_409 = mux_83_nl & and_dcpl_112 & and_dcpl_117;
  assign or_217_cse = (rem_12cyc_st_6_1_0!=2'b10) | (rem_12cyc_st_6_3_2!=2'b00);
  assign nor_473_nl = ~(and_dcpl_111 | (~ or_tmp_185));
  assign mux_84_nl = MUX_s_1_2_2(nor_473_nl, or_tmp_185, or_217_cse);
  assign and_tmp_58 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & mux_84_nl;
  assign nor_474_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_58));
  assign mux_85_nl = MUX_s_1_2_2(nor_474_nl, and_tmp_58, or_190_cse);
  assign and_dcpl_413 = mux_85_nl & and_dcpl_85 & and_dcpl_90;
  assign or_226_cse = (rem_12cyc_st_7_1_0!=2'b10) | (rem_12cyc_st_7_3_2!=2'b00);
  assign nor_470_nl = ~(and_dcpl_84 | (~ or_tmp_185));
  assign mux_tmp_84 = MUX_s_1_2_2(nor_470_nl, or_tmp_185, or_226_cse);
  assign nor_471_nl = ~(and_dcpl_111 | (~ mux_tmp_84));
  assign mux_87_nl = MUX_s_1_2_2(nor_471_nl, mux_tmp_84, or_217_cse);
  assign and_tmp_62 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & mux_87_nl;
  assign nor_472_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_62));
  assign mux_88_nl = MUX_s_1_2_2(nor_472_nl, and_tmp_62, or_190_cse);
  assign and_dcpl_417 = mux_88_nl & and_dcpl_58 & and_dcpl_63;
  assign or_237_cse = (rem_12cyc_st_8_1_0!=2'b10) | (rem_12cyc_st_8_3_2!=2'b00);
  assign nor_466_nl = ~(and_dcpl_57 | (~ or_tmp_185));
  assign mux_tmp_87 = MUX_s_1_2_2(nor_466_nl, or_tmp_185, or_237_cse);
  assign nor_467_nl = ~(and_dcpl_84 | (~ mux_tmp_87));
  assign mux_tmp_88 = MUX_s_1_2_2(nor_467_nl, mux_tmp_87, or_226_cse);
  assign nor_468_nl = ~(and_dcpl_111 | (~ mux_tmp_88));
  assign mux_91_nl = MUX_s_1_2_2(nor_468_nl, mux_tmp_88, or_217_cse);
  assign and_tmp_66 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & mux_91_nl;
  assign nor_469_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_66));
  assign mux_92_nl = MUX_s_1_2_2(nor_469_nl, and_tmp_66, or_190_cse);
  assign and_dcpl_421 = mux_92_nl & and_dcpl_31 & and_dcpl_36;
  assign nor_461_nl = ~(and_dcpl_30 | (~ or_tmp_185));
  assign or_250_nl = (rem_12cyc_st_9_1_0!=2'b10) | (rem_12cyc_st_9_3_2!=2'b00);
  assign mux_tmp_91 = MUX_s_1_2_2(nor_461_nl, or_tmp_185, or_250_nl);
  assign nor_462_nl = ~(and_dcpl_57 | (~ mux_tmp_91));
  assign mux_tmp_92 = MUX_s_1_2_2(nor_462_nl, mux_tmp_91, or_237_cse);
  assign nor_463_nl = ~(and_dcpl_84 | (~ mux_tmp_92));
  assign mux_tmp_93 = MUX_s_1_2_2(nor_463_nl, mux_tmp_92, or_226_cse);
  assign nor_464_nl = ~(and_dcpl_111 | (~ mux_tmp_93));
  assign mux_96_nl = MUX_s_1_2_2(nor_464_nl, mux_tmp_93, or_217_cse);
  assign and_tmp_70 = or_195_cse & or_199_cse & or_204_cse & or_210_cse & mux_96_nl;
  assign nor_465_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_70));
  assign mux_97_nl = MUX_s_1_2_2(nor_465_nl, and_tmp_70, or_190_cse);
  assign and_dcpl_425 = mux_97_nl & and_dcpl_4 & and_dcpl_9;
  assign and_tmp_80 = ((~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b00)
      | (rem_12cyc_1_0!=2'b10)) & ((~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b10)
      | (rem_12cyc_st_7_3_2!=2'b00)) & ((~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b10)
      | (rem_12cyc_st_8_3_2!=2'b00)) & ((~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b10)
      | (rem_12cyc_st_9_3_2!=2'b00)) & or_195_cse & or_199_cse & or_204_cse & or_210_cse
      & ((~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b10) | (rem_12cyc_st_6_3_2!=2'b00))
      & ((~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b10) | (rem_12cyc_st_10_3_2!=2'b00))
      & ((acc_tmp!=2'b00) | (acc_1_tmp[1:0]!=2'b10) | (~ ccs_ccore_start_rsci_idat));
  assign and_dcpl_430 = (acc_1_tmp[1:0]==2'b11);
  assign and_dcpl_431 = and_dcpl_293 & and_dcpl_430;
  assign or_tmp_263 = (rem_12cyc_1_0!=2'b11) | (rem_12cyc_3_2!=2'b00) | not_tmp_54;
  assign or_270_cse = (acc_1_tmp[1:0]!=2'b11) | (acc_tmp!=2'b00);
  assign nor_460_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_263));
  assign mux_98_nl = MUX_s_1_2_2(nor_460_nl, or_tmp_263, or_270_cse);
  assign and_dcpl_433 = mux_98_nl & and_dcpl_358 & and_dcpl_395;
  assign or_275_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b00);
  assign and_1142_nl = nand_276_cse & or_tmp_263;
  assign mux_tmp_97 = MUX_s_1_2_2(and_1142_nl, or_tmp_263, or_275_cse);
  assign nor_459_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_97));
  assign mux_100_nl = MUX_s_1_2_2(nor_459_nl, mux_tmp_97, or_270_cse);
  assign and_dcpl_435 = mux_100_nl & and_dcpl_362 & and_dcpl_398;
  assign or_280_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b00);
  assign and_1140_nl = nand_274_cse & or_tmp_263;
  assign mux_tmp_99 = MUX_s_1_2_2(and_1140_nl, or_tmp_263, or_280_cse);
  assign and_1141_nl = nand_276_cse & mux_tmp_99;
  assign mux_tmp_100 = MUX_s_1_2_2(and_1141_nl, mux_tmp_99, or_275_cse);
  assign nor_458_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_100));
  assign mux_103_nl = MUX_s_1_2_2(nor_458_nl, mux_tmp_100, or_270_cse);
  assign and_dcpl_437 = mux_103_nl & and_dcpl_366 & and_dcpl_401;
  assign or_287_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b00);
  assign and_1137_nl = nand_271_cse & or_tmp_263;
  assign mux_tmp_102 = MUX_s_1_2_2(and_1137_nl, or_tmp_263, or_287_cse);
  assign and_1138_nl = nand_274_cse & mux_tmp_102;
  assign mux_tmp_103 = MUX_s_1_2_2(and_1138_nl, mux_tmp_102, or_280_cse);
  assign and_1139_nl = nand_276_cse & mux_tmp_103;
  assign mux_tmp_104 = MUX_s_1_2_2(and_1139_nl, mux_tmp_103, or_275_cse);
  assign nor_457_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_104));
  assign mux_107_nl = MUX_s_1_2_2(nor_457_nl, mux_tmp_104, or_270_cse);
  assign and_dcpl_439 = mux_107_nl & and_dcpl_370 & and_dcpl_404;
  assign or_296_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b00);
  assign and_1133_nl = nand_267_cse & or_tmp_263;
  assign mux_tmp_106 = MUX_s_1_2_2(and_1133_nl, or_tmp_263, or_296_cse);
  assign and_1134_nl = nand_271_cse & mux_tmp_106;
  assign mux_tmp_107 = MUX_s_1_2_2(and_1134_nl, mux_tmp_106, or_287_cse);
  assign and_1135_nl = nand_274_cse & mux_tmp_107;
  assign mux_tmp_108 = MUX_s_1_2_2(and_1135_nl, mux_tmp_107, or_280_cse);
  assign and_1136_nl = nand_276_cse & mux_tmp_108;
  assign mux_tmp_109 = MUX_s_1_2_2(and_1136_nl, mux_tmp_108, or_275_cse);
  assign nor_456_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_109));
  assign mux_112_nl = MUX_s_1_2_2(nor_456_nl, mux_tmp_109, or_270_cse);
  assign and_dcpl_442 = mux_112_nl & and_dcpl_112 & and_dcpl_119;
  assign or_307_cse = (rem_12cyc_st_6_1_0!=2'b11) | (rem_12cyc_st_6_3_2!=2'b00);
  assign nor_454_nl = ~(and_dcpl_111 | (~ or_tmp_263));
  assign mux_tmp_111 = MUX_s_1_2_2(nor_454_nl, or_tmp_263, or_307_cse);
  assign and_1129_nl = nand_267_cse & mux_tmp_111;
  assign mux_tmp_112 = MUX_s_1_2_2(and_1129_nl, mux_tmp_111, or_296_cse);
  assign and_1130_nl = nand_271_cse & mux_tmp_112;
  assign mux_tmp_113 = MUX_s_1_2_2(and_1130_nl, mux_tmp_112, or_287_cse);
  assign and_1131_nl = nand_274_cse & mux_tmp_113;
  assign mux_tmp_114 = MUX_s_1_2_2(and_1131_nl, mux_tmp_113, or_280_cse);
  assign and_1132_nl = nand_276_cse & mux_tmp_114;
  assign mux_tmp_115 = MUX_s_1_2_2(and_1132_nl, mux_tmp_114, or_275_cse);
  assign nor_455_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_115));
  assign mux_118_nl = MUX_s_1_2_2(nor_455_nl, mux_tmp_115, or_270_cse);
  assign and_dcpl_445 = mux_118_nl & and_dcpl_85 & and_dcpl_92;
  assign or_320_cse = (rem_12cyc_st_7_1_0!=2'b11) | (rem_12cyc_st_7_3_2!=2'b00);
  assign nor_451_nl = ~(and_dcpl_84 | (~ or_tmp_263));
  assign mux_tmp_117 = MUX_s_1_2_2(nor_451_nl, or_tmp_263, or_320_cse);
  assign nor_452_nl = ~(and_dcpl_111 | (~ mux_tmp_117));
  assign mux_tmp_118 = MUX_s_1_2_2(nor_452_nl, mux_tmp_117, or_307_cse);
  assign and_1125_nl = nand_267_cse & mux_tmp_118;
  assign mux_tmp_119 = MUX_s_1_2_2(and_1125_nl, mux_tmp_118, or_296_cse);
  assign and_1126_nl = nand_271_cse & mux_tmp_119;
  assign mux_tmp_120 = MUX_s_1_2_2(and_1126_nl, mux_tmp_119, or_287_cse);
  assign and_1127_nl = nand_274_cse & mux_tmp_120;
  assign mux_tmp_121 = MUX_s_1_2_2(and_1127_nl, mux_tmp_120, or_280_cse);
  assign and_1128_nl = nand_276_cse & mux_tmp_121;
  assign mux_tmp_122 = MUX_s_1_2_2(and_1128_nl, mux_tmp_121, or_275_cse);
  assign nor_453_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_122));
  assign mux_125_nl = MUX_s_1_2_2(nor_453_nl, mux_tmp_122, or_270_cse);
  assign and_dcpl_448 = mux_125_nl & and_dcpl_58 & and_dcpl_65;
  assign or_335_cse = (rem_12cyc_st_8_1_0!=2'b11) | (rem_12cyc_st_8_3_2!=2'b00);
  assign nor_447_nl = ~(and_dcpl_57 | (~ or_tmp_263));
  assign mux_tmp_124 = MUX_s_1_2_2(nor_447_nl, or_tmp_263, or_335_cse);
  assign nor_448_nl = ~(and_dcpl_84 | (~ mux_tmp_124));
  assign mux_tmp_125 = MUX_s_1_2_2(nor_448_nl, mux_tmp_124, or_320_cse);
  assign nor_449_nl = ~(and_dcpl_111 | (~ mux_tmp_125));
  assign mux_tmp_126 = MUX_s_1_2_2(nor_449_nl, mux_tmp_125, or_307_cse);
  assign and_1121_nl = nand_267_cse & mux_tmp_126;
  assign mux_tmp_127 = MUX_s_1_2_2(and_1121_nl, mux_tmp_126, or_296_cse);
  assign and_1122_nl = nand_271_cse & mux_tmp_127;
  assign mux_tmp_128 = MUX_s_1_2_2(and_1122_nl, mux_tmp_127, or_287_cse);
  assign and_1123_nl = nand_274_cse & mux_tmp_128;
  assign mux_tmp_129 = MUX_s_1_2_2(and_1123_nl, mux_tmp_128, or_280_cse);
  assign and_1124_nl = nand_276_cse & mux_tmp_129;
  assign mux_tmp_130 = MUX_s_1_2_2(and_1124_nl, mux_tmp_129, or_275_cse);
  assign nor_450_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_130));
  assign mux_133_nl = MUX_s_1_2_2(nor_450_nl, mux_tmp_130, or_270_cse);
  assign and_dcpl_451 = mux_133_nl & and_dcpl_31 & and_dcpl_38;
  assign nor_442_nl = ~(and_dcpl_30 | (~ or_tmp_263));
  assign or_352_nl = (rem_12cyc_st_9_1_0!=2'b11) | (rem_12cyc_st_9_3_2!=2'b00);
  assign mux_tmp_132 = MUX_s_1_2_2(nor_442_nl, or_tmp_263, or_352_nl);
  assign nor_443_nl = ~(and_dcpl_57 | (~ mux_tmp_132));
  assign mux_tmp_133 = MUX_s_1_2_2(nor_443_nl, mux_tmp_132, or_335_cse);
  assign nor_444_nl = ~(and_dcpl_84 | (~ mux_tmp_133));
  assign mux_tmp_134 = MUX_s_1_2_2(nor_444_nl, mux_tmp_133, or_320_cse);
  assign nor_445_nl = ~(and_dcpl_111 | (~ mux_tmp_134));
  assign mux_tmp_135 = MUX_s_1_2_2(nor_445_nl, mux_tmp_134, or_307_cse);
  assign and_1117_nl = nand_267_cse & mux_tmp_135;
  assign mux_tmp_136 = MUX_s_1_2_2(and_1117_nl, mux_tmp_135, or_296_cse);
  assign and_1118_nl = nand_271_cse & mux_tmp_136;
  assign mux_tmp_137 = MUX_s_1_2_2(and_1118_nl, mux_tmp_136, or_287_cse);
  assign and_1119_nl = nand_274_cse & mux_tmp_137;
  assign mux_tmp_138 = MUX_s_1_2_2(and_1119_nl, mux_tmp_137, or_280_cse);
  assign and_1120_nl = nand_276_cse & mux_tmp_138;
  assign mux_tmp_139 = MUX_s_1_2_2(and_1120_nl, mux_tmp_138, or_275_cse);
  assign nor_446_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_139));
  assign mux_142_nl = MUX_s_1_2_2(nor_446_nl, mux_tmp_139, or_270_cse);
  assign and_dcpl_454 = mux_142_nl & and_dcpl_4 & and_dcpl_11;
  assign nand_222_cse = ~((acc_1_tmp[1:0]==2'b11) & ccs_ccore_start_rsci_idat);
  assign and_tmp_89 = ((~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b11)
      | (rem_12cyc_st_7_3_2!=2'b00)) & ((~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b11)
      | (rem_12cyc_st_8_3_2!=2'b00)) & ((~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b11)
      | (rem_12cyc_st_9_3_2!=2'b00)) & ((~ main_stage_0_3) | (~ asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b11)
      | (rem_12cyc_st_2_3_2!=2'b00)) & ((~ main_stage_0_4) | (~ asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b11)
      | (rem_12cyc_st_3_3_2!=2'b00)) & ((~ main_stage_0_5) | (~ asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b11)
      | (rem_12cyc_st_4_3_2!=2'b00)) & ((~ main_stage_0_6) | (~ asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b11)
      | (rem_12cyc_st_5_3_2!=2'b00)) & ((~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b11)
      | (rem_12cyc_st_6_3_2!=2'b00)) & ((~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b11)
      | (rem_12cyc_st_10_3_2!=2'b00)) & ((acc_tmp!=2'b00) | nand_222_cse);
  assign nand_223_cse = ~((rem_12cyc_1_0==2'b11));
  assign and_1116_nl = nand_223_cse & and_tmp_89;
  assign or_362_nl = (~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b00);
  assign mux_tmp_141 = MUX_s_1_2_2(and_1116_nl, and_tmp_89, or_362_nl);
  assign and_dcpl_460 = ccs_ccore_start_rsci_idat & (acc_tmp==2'b01);
  assign and_dcpl_461 = and_dcpl_460 & and_dcpl_291;
  assign and_dcpl_462 = (rem_12cyc_st_2_3_2==2'b01);
  assign and_dcpl_463 = and_dcpl_462 & (~ (rem_12cyc_st_2_1_0[1]));
  assign not_tmp_332 = ~((rem_12cyc_3_2[0]) & asn_itm_1 & main_stage_0_2);
  assign or_tmp_368 = (rem_12cyc_1_0!=2'b00) | (rem_12cyc_3_2[1]) | not_tmp_332;
  assign nand_281_cse = ~((acc_tmp[0]) & ccs_ccore_start_rsci_idat);
  assign or_377_cse = (acc_1_tmp[1:0]!=2'b00) | (acc_tmp[1]);
  assign and_1172_nl = nand_281_cse & or_tmp_368;
  assign mux_144_nl = MUX_s_1_2_2(and_1172_nl, or_tmp_368, or_377_cse);
  assign and_dcpl_465 = mux_144_nl & and_dcpl_298 & and_dcpl_463;
  assign and_dcpl_466 = (rem_12cyc_st_3_3_2==2'b01);
  assign and_dcpl_467 = and_dcpl_466 & (~ (rem_12cyc_st_3_1_0[1]));
  assign or_382_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b01) | (~
      asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_90 = or_382_cse & or_tmp_368;
  assign and_1114_nl = nand_281_cse & and_tmp_90;
  assign mux_145_nl = MUX_s_1_2_2(and_1114_nl, and_tmp_90, or_377_cse);
  assign and_dcpl_469 = mux_145_nl & and_dcpl_304 & and_dcpl_467;
  assign and_dcpl_470 = (rem_12cyc_st_4_3_2==2'b01);
  assign and_dcpl_471 = and_dcpl_470 & (~ (rem_12cyc_st_4_1_0[1]));
  assign or_386_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b01) | (~
      asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_92 = or_382_cse & or_386_cse & or_tmp_368;
  assign and_1113_nl = nand_281_cse & and_tmp_92;
  assign mux_146_nl = MUX_s_1_2_2(and_1113_nl, and_tmp_92, or_377_cse);
  assign and_dcpl_473 = mux_146_nl & and_dcpl_310 & and_dcpl_471;
  assign and_dcpl_474 = (rem_12cyc_st_5_3_2==2'b01);
  assign and_dcpl_475 = and_dcpl_474 & (~ (rem_12cyc_st_5_1_0[1]));
  assign or_391_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b01) | (~
      asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_95 = or_382_cse & or_386_cse & or_391_cse & or_tmp_368;
  assign and_1112_nl = nand_281_cse & and_tmp_95;
  assign mux_147_nl = MUX_s_1_2_2(and_1112_nl, and_tmp_95, or_377_cse);
  assign and_dcpl_477 = mux_147_nl & and_dcpl_316 & and_dcpl_475;
  assign or_397_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b01) | (~
      asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_99 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & or_tmp_368;
  assign and_1111_nl = nand_281_cse & and_tmp_99;
  assign mux_148_nl = MUX_s_1_2_2(and_1111_nl, and_tmp_99, or_377_cse);
  assign and_dcpl_480 = mux_148_nl & and_dcpl_121 & and_dcpl_110;
  assign nand_215_cse = ~((rem_12cyc_st_6_3_2[0]) & asn_itm_6 & main_stage_0_7);
  assign or_404_cse = (rem_12cyc_st_6_1_0!=2'b00) | (rem_12cyc_st_6_3_2[1]);
  assign and_1109_nl = nand_215_cse & or_tmp_368;
  assign mux_149_nl = MUX_s_1_2_2(and_1109_nl, or_tmp_368, or_404_cse);
  assign and_tmp_103 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & mux_149_nl;
  assign and_1110_nl = nand_281_cse & and_tmp_103;
  assign mux_150_nl = MUX_s_1_2_2(and_1110_nl, and_tmp_103, or_377_cse);
  assign and_dcpl_483 = mux_150_nl & and_dcpl_94 & and_dcpl_83;
  assign nand_212_cse = ~((rem_12cyc_st_7_3_2[0]) & asn_itm_7 & main_stage_0_8);
  assign or_413_cse = (rem_12cyc_st_7_1_0!=2'b00) | (rem_12cyc_st_7_3_2[1]);
  assign and_1106_nl = nand_212_cse & or_tmp_368;
  assign mux_tmp_149 = MUX_s_1_2_2(and_1106_nl, or_tmp_368, or_413_cse);
  assign and_1107_nl = nand_215_cse & mux_tmp_149;
  assign mux_152_nl = MUX_s_1_2_2(and_1107_nl, mux_tmp_149, or_404_cse);
  assign and_tmp_107 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & mux_152_nl;
  assign and_1108_nl = nand_281_cse & and_tmp_107;
  assign mux_153_nl = MUX_s_1_2_2(and_1108_nl, and_tmp_107, or_377_cse);
  assign and_dcpl_486 = mux_153_nl & and_dcpl_67 & and_dcpl_56;
  assign nand_208_cse = ~((rem_12cyc_st_8_3_2[0]) & asn_itm_8 & main_stage_0_9);
  assign or_424_cse = (rem_12cyc_st_8_1_0!=2'b00) | (rem_12cyc_st_8_3_2[1]);
  assign and_1102_nl = nand_208_cse & or_tmp_368;
  assign mux_tmp_152 = MUX_s_1_2_2(and_1102_nl, or_tmp_368, or_424_cse);
  assign and_1103_nl = nand_212_cse & mux_tmp_152;
  assign mux_tmp_153 = MUX_s_1_2_2(and_1103_nl, mux_tmp_152, or_413_cse);
  assign and_1104_nl = nand_215_cse & mux_tmp_153;
  assign mux_156_nl = MUX_s_1_2_2(and_1104_nl, mux_tmp_153, or_404_cse);
  assign and_tmp_111 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & mux_156_nl;
  assign and_1105_nl = nand_281_cse & and_tmp_111;
  assign mux_157_nl = MUX_s_1_2_2(and_1105_nl, and_tmp_111, or_377_cse);
  assign and_dcpl_489 = mux_157_nl & and_dcpl_40 & and_dcpl_29;
  assign nand_203_cse = ~((rem_12cyc_st_9_3_2[0]) & asn_itm_9 & main_stage_0_10);
  assign and_1097_nl = nand_203_cse & or_tmp_368;
  assign or_437_nl = (rem_12cyc_st_9_1_0!=2'b00) | (rem_12cyc_st_9_3_2[1]);
  assign mux_tmp_156 = MUX_s_1_2_2(and_1097_nl, or_tmp_368, or_437_nl);
  assign and_1098_nl = nand_208_cse & mux_tmp_156;
  assign mux_tmp_157 = MUX_s_1_2_2(and_1098_nl, mux_tmp_156, or_424_cse);
  assign and_1099_nl = nand_212_cse & mux_tmp_157;
  assign mux_tmp_158 = MUX_s_1_2_2(and_1099_nl, mux_tmp_157, or_413_cse);
  assign and_1100_nl = nand_215_cse & mux_tmp_158;
  assign mux_161_nl = MUX_s_1_2_2(and_1100_nl, mux_tmp_158, or_404_cse);
  assign and_tmp_115 = or_382_cse & or_386_cse & or_391_cse & or_397_cse & mux_161_nl;
  assign and_1101_nl = nand_281_cse & and_tmp_115;
  assign mux_162_nl = MUX_s_1_2_2(and_1101_nl, and_tmp_115, or_377_cse);
  assign and_dcpl_492 = mux_162_nl & and_dcpl_13 & and_dcpl_2;
  assign and_tmp_125 = ((~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b01)
      | (rem_12cyc_1_0!=2'b00)) & ((~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b00)
      | (rem_12cyc_st_7_3_2!=2'b01)) & ((~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b00)
      | (rem_12cyc_st_8_3_2!=2'b01)) & ((~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b00)
      | (rem_12cyc_st_9_3_2!=2'b01)) & or_382_cse & or_386_cse & or_391_cse & or_397_cse
      & ((~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b00) | (rem_12cyc_st_6_3_2!=2'b01))
      & ((~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b00) | (rem_12cyc_st_10_3_2!=2'b01))
      & ((acc_tmp!=2'b01) | (acc_1_tmp[1:0]!=2'b00) | (~ ccs_ccore_start_rsci_idat));
  assign and_dcpl_498 = and_dcpl_460 & and_dcpl_355;
  assign or_tmp_446 = (rem_12cyc_1_0!=2'b01) | (rem_12cyc_3_2[1]) | not_tmp_332;
  assign or_458_cse = (acc_1_tmp[1:0]!=2'b01) | (acc_tmp[1]);
  assign and_1171_nl = nand_281_cse & or_tmp_446;
  assign mux_163_nl = MUX_s_1_2_2(and_1171_nl, or_tmp_446, or_458_cse);
  assign and_dcpl_500 = mux_163_nl & and_dcpl_358 & and_dcpl_463;
  assign or_463_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b01);
  assign and_1094_nl = nand_276_cse & or_tmp_446;
  assign mux_tmp_162 = MUX_s_1_2_2(and_1094_nl, or_tmp_446, or_463_cse);
  assign and_1095_nl = nand_281_cse & mux_tmp_162;
  assign mux_165_nl = MUX_s_1_2_2(and_1095_nl, mux_tmp_162, or_458_cse);
  assign and_dcpl_502 = mux_165_nl & and_dcpl_362 & and_dcpl_467;
  assign nand_198_cse = ~((rem_12cyc_st_3_3_2[0]) & asn_itm_3 & main_stage_0_4 &
      (rem_12cyc_st_3_1_0[0]));
  assign or_468_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2[1]);
  assign and_1091_nl = nand_198_cse & or_tmp_446;
  assign mux_tmp_164 = MUX_s_1_2_2(and_1091_nl, or_tmp_446, or_468_cse);
  assign and_1092_nl = nand_276_cse & mux_tmp_164;
  assign mux_tmp_165 = MUX_s_1_2_2(and_1092_nl, mux_tmp_164, or_463_cse);
  assign and_1093_nl = nand_281_cse & mux_tmp_165;
  assign mux_168_nl = MUX_s_1_2_2(and_1093_nl, mux_tmp_165, or_458_cse);
  assign and_dcpl_504 = mux_168_nl & and_dcpl_366 & and_dcpl_471;
  assign or_475_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b01);
  assign and_1087_nl = nand_271_cse & or_tmp_446;
  assign mux_tmp_167 = MUX_s_1_2_2(and_1087_nl, or_tmp_446, or_475_cse);
  assign and_1088_nl = nand_198_cse & mux_tmp_167;
  assign mux_tmp_168 = MUX_s_1_2_2(and_1088_nl, mux_tmp_167, or_468_cse);
  assign and_1089_nl = nand_276_cse & mux_tmp_168;
  assign mux_tmp_169 = MUX_s_1_2_2(and_1089_nl, mux_tmp_168, or_463_cse);
  assign and_1090_nl = nand_281_cse & mux_tmp_169;
  assign mux_172_nl = MUX_s_1_2_2(and_1090_nl, mux_tmp_169, or_458_cse);
  assign and_dcpl_506 = mux_172_nl & and_dcpl_370 & and_dcpl_475;
  assign nand_189_cse = ~((rem_12cyc_st_5_3_2[0]) & asn_itm_5 & main_stage_0_6 &
      (rem_12cyc_st_5_1_0[0]));
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
  assign mux_177_nl = MUX_s_1_2_2(and_1086_nl, mux_tmp_174, or_458_cse);
  assign and_dcpl_508 = mux_177_nl & and_dcpl_121 & and_dcpl_115;
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
  assign mux_183_nl = MUX_s_1_2_2(and_1081_nl, mux_tmp_180, or_458_cse);
  assign and_dcpl_510 = mux_183_nl & and_dcpl_94 & and_dcpl_87;
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
  assign mux_190_nl = MUX_s_1_2_2(and_1075_nl, mux_tmp_187, or_458_cse);
  assign and_dcpl_512 = mux_190_nl & and_dcpl_67 & and_dcpl_60;
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
  assign mux_198_nl = MUX_s_1_2_2(and_1068_nl, mux_tmp_195, or_458_cse);
  assign and_dcpl_514 = mux_198_nl & and_dcpl_40 & and_dcpl_33;
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
  assign mux_207_nl = MUX_s_1_2_2(and_1060_nl, mux_tmp_204, or_458_cse);
  assign and_dcpl_516 = mux_207_nl & and_dcpl_13 & and_dcpl_6;
  assign and_tmp_134 = ((~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b01)
      | (rem_12cyc_st_7_3_2!=2'b01)) & ((~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b01)
      | (rem_12cyc_st_8_3_2!=2'b01)) & ((~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b01)
      | (rem_12cyc_st_9_3_2!=2'b01)) & ((~ main_stage_0_3) | (~ asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b01)
      | (rem_12cyc_st_2_3_2!=2'b01)) & ((~ main_stage_0_4) | (~ asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b01)
      | (rem_12cyc_st_3_3_2!=2'b01)) & ((~ main_stage_0_5) | (~ asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b01)
      | (rem_12cyc_st_4_3_2!=2'b01)) & ((~ main_stage_0_6) | (~ asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b01)
      | (rem_12cyc_st_5_3_2!=2'b01)) & ((~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b01)
      | (rem_12cyc_st_6_3_2!=2'b01)) & ((~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b01)
      | (rem_12cyc_st_10_3_2!=2'b01)) & ((acc_tmp!=2'b01) | (acc_1_tmp[1]) | nand_250_cse);
  assign nor_439_nl = ~((rem_12cyc_1_0[0]) | (~ and_tmp_134));
  assign or_550_nl = (~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b01)
      | (rem_12cyc_1_0[1]);
  assign mux_tmp_206 = MUX_s_1_2_2(nor_439_nl, and_tmp_134, or_550_nl);
  assign and_dcpl_520 = and_dcpl_460 & and_dcpl_393;
  assign and_dcpl_521 = and_dcpl_462 & (rem_12cyc_st_2_1_0[1]);
  assign or_tmp_551 = (rem_12cyc_1_0!=2'b10) | (rem_12cyc_3_2[1]) | not_tmp_332;
  assign or_564_cse = (acc_1_tmp[1:0]!=2'b10) | (acc_tmp[1]);
  assign and_1170_nl = nand_281_cse & or_tmp_551;
  assign mux_209_nl = MUX_s_1_2_2(and_1170_nl, or_tmp_551, or_564_cse);
  assign and_dcpl_523 = mux_209_nl & and_dcpl_298 & and_dcpl_521;
  assign and_dcpl_524 = and_dcpl_466 & (rem_12cyc_st_3_1_0[1]);
  assign or_569_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b01) |
      (~ asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_135 = or_569_cse & or_tmp_551;
  assign and_1050_nl = nand_281_cse & and_tmp_135;
  assign mux_210_nl = MUX_s_1_2_2(and_1050_nl, and_tmp_135, or_564_cse);
  assign and_dcpl_526 = mux_210_nl & and_dcpl_304 & and_dcpl_524;
  assign and_dcpl_527 = and_dcpl_470 & (rem_12cyc_st_4_1_0[1]);
  assign or_573_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b01) |
      (~ asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_137 = or_569_cse & or_573_cse & or_tmp_551;
  assign and_1049_nl = nand_281_cse & and_tmp_137;
  assign mux_211_nl = MUX_s_1_2_2(and_1049_nl, and_tmp_137, or_564_cse);
  assign and_dcpl_529 = mux_211_nl & and_dcpl_310 & and_dcpl_527;
  assign and_dcpl_530 = and_dcpl_474 & (rem_12cyc_st_5_1_0[1]);
  assign or_578_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b01) |
      (~ asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_140 = or_569_cse & or_573_cse & or_578_cse & or_tmp_551;
  assign and_1048_nl = nand_281_cse & and_tmp_140;
  assign mux_212_nl = MUX_s_1_2_2(and_1048_nl, and_tmp_140, or_564_cse);
  assign and_dcpl_532 = mux_212_nl & and_dcpl_316 & and_dcpl_530;
  assign or_584_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b01) |
      (~ asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_144 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & or_tmp_551;
  assign and_1047_nl = nand_281_cse & and_tmp_144;
  assign mux_213_nl = MUX_s_1_2_2(and_1047_nl, and_tmp_144, or_564_cse);
  assign and_dcpl_534 = mux_213_nl & and_dcpl_121 & and_dcpl_117;
  assign or_591_cse = (rem_12cyc_st_6_1_0!=2'b10) | (rem_12cyc_st_6_3_2[1]);
  assign and_1045_nl = nand_215_cse & or_tmp_551;
  assign mux_214_nl = MUX_s_1_2_2(and_1045_nl, or_tmp_551, or_591_cse);
  assign and_tmp_148 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & mux_214_nl;
  assign and_1046_nl = nand_281_cse & and_tmp_148;
  assign mux_215_nl = MUX_s_1_2_2(and_1046_nl, and_tmp_148, or_564_cse);
  assign and_dcpl_536 = mux_215_nl & and_dcpl_94 & and_dcpl_90;
  assign or_600_cse = (rem_12cyc_st_7_1_0!=2'b10) | (rem_12cyc_st_7_3_2[1]);
  assign and_1042_nl = nand_212_cse & or_tmp_551;
  assign mux_tmp_214 = MUX_s_1_2_2(and_1042_nl, or_tmp_551, or_600_cse);
  assign and_1043_nl = nand_215_cse & mux_tmp_214;
  assign mux_217_nl = MUX_s_1_2_2(and_1043_nl, mux_tmp_214, or_591_cse);
  assign and_tmp_152 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & mux_217_nl;
  assign and_1044_nl = nand_281_cse & and_tmp_152;
  assign mux_218_nl = MUX_s_1_2_2(and_1044_nl, and_tmp_152, or_564_cse);
  assign and_dcpl_538 = mux_218_nl & and_dcpl_67 & and_dcpl_63;
  assign or_611_cse = (rem_12cyc_st_8_1_0!=2'b10) | (rem_12cyc_st_8_3_2[1]);
  assign and_1038_nl = nand_208_cse & or_tmp_551;
  assign mux_tmp_217 = MUX_s_1_2_2(and_1038_nl, or_tmp_551, or_611_cse);
  assign and_1039_nl = nand_212_cse & mux_tmp_217;
  assign mux_tmp_218 = MUX_s_1_2_2(and_1039_nl, mux_tmp_217, or_600_cse);
  assign and_1040_nl = nand_215_cse & mux_tmp_218;
  assign mux_221_nl = MUX_s_1_2_2(and_1040_nl, mux_tmp_218, or_591_cse);
  assign and_tmp_156 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & mux_221_nl;
  assign and_1041_nl = nand_281_cse & and_tmp_156;
  assign mux_222_nl = MUX_s_1_2_2(and_1041_nl, and_tmp_156, or_564_cse);
  assign and_dcpl_540 = mux_222_nl & and_dcpl_40 & and_dcpl_36;
  assign and_1033_nl = nand_203_cse & or_tmp_551;
  assign or_624_nl = (rem_12cyc_st_9_1_0!=2'b10) | (rem_12cyc_st_9_3_2[1]);
  assign mux_tmp_221 = MUX_s_1_2_2(and_1033_nl, or_tmp_551, or_624_nl);
  assign and_1034_nl = nand_208_cse & mux_tmp_221;
  assign mux_tmp_222 = MUX_s_1_2_2(and_1034_nl, mux_tmp_221, or_611_cse);
  assign and_1035_nl = nand_212_cse & mux_tmp_222;
  assign mux_tmp_223 = MUX_s_1_2_2(and_1035_nl, mux_tmp_222, or_600_cse);
  assign and_1036_nl = nand_215_cse & mux_tmp_223;
  assign mux_226_nl = MUX_s_1_2_2(and_1036_nl, mux_tmp_223, or_591_cse);
  assign and_tmp_160 = or_569_cse & or_573_cse & or_578_cse & or_584_cse & mux_226_nl;
  assign and_1037_nl = nand_281_cse & and_tmp_160;
  assign mux_227_nl = MUX_s_1_2_2(and_1037_nl, and_tmp_160, or_564_cse);
  assign and_dcpl_542 = mux_227_nl & and_dcpl_13 & and_dcpl_9;
  assign and_tmp_170 = ((~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b01)
      | (rem_12cyc_1_0!=2'b10)) & ((~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b10)
      | (rem_12cyc_st_7_3_2!=2'b01)) & ((~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b10)
      | (rem_12cyc_st_8_3_2!=2'b01)) & ((~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b10)
      | (rem_12cyc_st_9_3_2!=2'b01)) & or_569_cse & or_573_cse & or_578_cse & or_584_cse
      & ((~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b10) | (rem_12cyc_st_6_3_2!=2'b01))
      & ((~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b10) | (rem_12cyc_st_10_3_2!=2'b01))
      & ((acc_tmp!=2'b01) | (acc_1_tmp[1:0]!=2'b10) | (~ ccs_ccore_start_rsci_idat));
  assign and_dcpl_546 = and_dcpl_460 & and_dcpl_430;
  assign or_tmp_629 = (rem_12cyc_1_0!=2'b11) | (rem_12cyc_3_2[1]) | not_tmp_332;
  assign or_643_cse = (acc_1_tmp[1:0]!=2'b11) | (acc_tmp[1]);
  assign and_1169_nl = nand_281_cse & or_tmp_629;
  assign mux_228_nl = MUX_s_1_2_2(and_1169_nl, or_tmp_629, or_643_cse);
  assign and_dcpl_548 = mux_228_nl & and_dcpl_358 & and_dcpl_521;
  assign or_648_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b01);
  assign and_1030_nl = nand_276_cse & or_tmp_629;
  assign mux_tmp_227 = MUX_s_1_2_2(and_1030_nl, or_tmp_629, or_648_cse);
  assign and_1031_nl = nand_281_cse & mux_tmp_227;
  assign mux_230_nl = MUX_s_1_2_2(and_1031_nl, mux_tmp_227, or_643_cse);
  assign and_dcpl_550 = mux_230_nl & and_dcpl_362 & and_dcpl_524;
  assign or_653_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2[1]);
  assign and_1027_nl = nand_198_cse & or_tmp_629;
  assign mux_tmp_229 = MUX_s_1_2_2(and_1027_nl, or_tmp_629, or_653_cse);
  assign and_1028_nl = nand_276_cse & mux_tmp_229;
  assign mux_tmp_230 = MUX_s_1_2_2(and_1028_nl, mux_tmp_229, or_648_cse);
  assign and_1029_nl = nand_281_cse & mux_tmp_230;
  assign mux_233_nl = MUX_s_1_2_2(and_1029_nl, mux_tmp_230, or_643_cse);
  assign and_dcpl_552 = mux_233_nl & and_dcpl_366 & and_dcpl_527;
  assign or_660_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b01);
  assign and_1023_nl = nand_271_cse & or_tmp_629;
  assign mux_tmp_232 = MUX_s_1_2_2(and_1023_nl, or_tmp_629, or_660_cse);
  assign and_1024_nl = nand_198_cse & mux_tmp_232;
  assign mux_tmp_233 = MUX_s_1_2_2(and_1024_nl, mux_tmp_232, or_653_cse);
  assign and_1025_nl = nand_276_cse & mux_tmp_233;
  assign mux_tmp_234 = MUX_s_1_2_2(and_1025_nl, mux_tmp_233, or_648_cse);
  assign and_1026_nl = nand_281_cse & mux_tmp_234;
  assign mux_237_nl = MUX_s_1_2_2(and_1026_nl, mux_tmp_234, or_643_cse);
  assign and_dcpl_554 = mux_237_nl & and_dcpl_370 & and_dcpl_530;
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
  assign mux_242_nl = MUX_s_1_2_2(and_1022_nl, mux_tmp_239, or_643_cse);
  assign and_dcpl_556 = mux_242_nl & and_dcpl_121 & and_dcpl_119;
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
  assign mux_248_nl = MUX_s_1_2_2(and_1017_nl, mux_tmp_245, or_643_cse);
  assign and_dcpl_558 = mux_248_nl & and_dcpl_94 & and_dcpl_92;
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
  assign mux_255_nl = MUX_s_1_2_2(and_1011_nl, mux_tmp_252, or_643_cse);
  assign and_dcpl_560 = mux_255_nl & and_dcpl_67 & and_dcpl_65;
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
  assign mux_263_nl = MUX_s_1_2_2(and_1004_nl, mux_tmp_260, or_643_cse);
  assign and_dcpl_562 = mux_263_nl & and_dcpl_40 & and_dcpl_38;
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
  assign mux_272_nl = MUX_s_1_2_2(and_996_nl, mux_tmp_269, or_643_cse);
  assign and_dcpl_564 = mux_272_nl & and_dcpl_13 & and_dcpl_11;
  assign and_tmp_179 = (~(main_stage_0_8 & asn_itm_7 & (rem_12cyc_st_7_1_0==2'b11)
      & (rem_12cyc_st_7_3_2==2'b01))) & (~(main_stage_0_9 & asn_itm_8 & (rem_12cyc_st_8_1_0==2'b11)
      & (rem_12cyc_st_8_3_2==2'b01))) & (~(main_stage_0_10 & asn_itm_9 & (rem_12cyc_st_9_1_0==2'b11)
      & (rem_12cyc_st_9_3_2==2'b01))) & (~(main_stage_0_3 & asn_itm_2 & (rem_12cyc_st_2_1_0==2'b11)
      & (rem_12cyc_st_2_3_2==2'b01))) & (~(main_stage_0_4 & asn_itm_3 & (rem_12cyc_st_3_1_0==2'b11)
      & (rem_12cyc_st_3_3_2==2'b01))) & (~(main_stage_0_5 & asn_itm_4 & (rem_12cyc_st_4_1_0==2'b11)
      & (rem_12cyc_st_4_3_2==2'b01))) & (~(main_stage_0_6 & asn_itm_5 & (rem_12cyc_st_5_1_0==2'b11)
      & (rem_12cyc_st_5_3_2==2'b01))) & (~(main_stage_0_7 & asn_itm_6 & (rem_12cyc_st_6_1_0==2'b11)
      & (rem_12cyc_st_6_3_2==2'b01))) & (~(main_stage_0_11 & asn_itm_10 & (rem_12cyc_st_10_1_0==2'b11)
      & (rem_12cyc_st_10_3_2==2'b01))) & ((acc_tmp[1]) | (~((acc_tmp[0]) & (acc_1_tmp[1:0]==2'b11)
      & ccs_ccore_start_rsci_idat)));
  assign and_987_nl = (~((rem_12cyc_3_2[0]) & (rem_12cyc_1_0==2'b11))) & and_tmp_179;
  assign or_735_nl = (~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2[1]);
  assign mux_tmp_271 = MUX_s_1_2_2(and_987_nl, and_tmp_179, or_735_nl);
  assign and_dcpl_568 = and_dcpl_292 & (acc_tmp[1]);
  assign and_dcpl_569 = and_dcpl_568 & and_dcpl_291;
  assign and_dcpl_570 = (rem_12cyc_st_2_3_2==2'b10);
  assign and_dcpl_571 = and_dcpl_570 & (~ (rem_12cyc_st_2_1_0[1]));
  assign or_tmp_733 = (rem_12cyc_1_0!=2'b00) | (rem_12cyc_3_2!=2'b10) | not_tmp_54;
  assign or_748_cse = (acc_1_tmp[1:0]!=2'b00) | (acc_tmp!=2'b10);
  assign nor_436_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_733));
  assign mux_274_nl = MUX_s_1_2_2(nor_436_nl, or_tmp_733, or_748_cse);
  assign and_dcpl_573 = mux_274_nl & and_dcpl_298 & and_dcpl_571;
  assign and_dcpl_574 = (rem_12cyc_st_3_3_2==2'b10);
  assign and_dcpl_575 = and_dcpl_574 & (~ (rem_12cyc_st_3_1_0[1]));
  assign or_753_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2!=2'b10) | (~
      asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_180 = or_753_cse & or_tmp_733;
  assign nor_435_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_180));
  assign mux_275_nl = MUX_s_1_2_2(nor_435_nl, and_tmp_180, or_748_cse);
  assign and_dcpl_577 = mux_275_nl & and_dcpl_304 & and_dcpl_575;
  assign and_dcpl_578 = (rem_12cyc_st_4_3_2==2'b10);
  assign and_dcpl_579 = and_dcpl_578 & (~ (rem_12cyc_st_4_1_0[1]));
  assign or_757_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b10) | (~
      asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_182 = or_753_cse & or_757_cse & or_tmp_733;
  assign nor_434_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_182));
  assign mux_276_nl = MUX_s_1_2_2(nor_434_nl, and_tmp_182, or_748_cse);
  assign and_dcpl_581 = mux_276_nl & and_dcpl_310 & and_dcpl_579;
  assign and_dcpl_582 = (rem_12cyc_st_5_3_2==2'b10);
  assign and_dcpl_583 = and_dcpl_582 & (~ (rem_12cyc_st_5_1_0[1]));
  assign or_762_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2!=2'b10) | (~
      asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_185 = or_753_cse & or_757_cse & or_762_cse & or_tmp_733;
  assign nor_433_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_185));
  assign mux_277_nl = MUX_s_1_2_2(nor_433_nl, and_tmp_185, or_748_cse);
  assign and_dcpl_585 = mux_277_nl & and_dcpl_316 & and_dcpl_583;
  assign or_768_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b10) | (~
      asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_189 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & or_tmp_733;
  assign nor_432_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_189));
  assign mux_278_nl = MUX_s_1_2_2(nor_432_nl, and_tmp_189, or_748_cse);
  assign and_dcpl_589 = mux_278_nl & and_dcpl_112 & and_dcpl_126 & (~ (rem_12cyc_st_6_1_0[1]));
  assign or_775_cse = (rem_12cyc_st_6_1_0!=2'b00) | (rem_12cyc_st_6_3_2!=2'b10);
  assign nor_430_nl = ~(and_dcpl_111 | (~ or_tmp_733));
  assign mux_279_nl = MUX_s_1_2_2(nor_430_nl, or_tmp_733, or_775_cse);
  assign and_tmp_193 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & mux_279_nl;
  assign nor_431_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_193));
  assign mux_280_nl = MUX_s_1_2_2(nor_431_nl, and_tmp_193, or_748_cse);
  assign and_dcpl_593 = mux_280_nl & and_dcpl_85 & and_dcpl_99 & (~ (rem_12cyc_st_7_1_0[0]));
  assign or_784_cse = (rem_12cyc_st_7_1_0!=2'b00) | (rem_12cyc_st_7_3_2!=2'b10);
  assign nor_427_nl = ~(and_dcpl_84 | (~ or_tmp_733));
  assign mux_tmp_279 = MUX_s_1_2_2(nor_427_nl, or_tmp_733, or_784_cse);
  assign nor_428_nl = ~(and_dcpl_111 | (~ mux_tmp_279));
  assign mux_282_nl = MUX_s_1_2_2(nor_428_nl, mux_tmp_279, or_775_cse);
  assign and_tmp_197 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & mux_282_nl;
  assign nor_429_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_197));
  assign mux_283_nl = MUX_s_1_2_2(nor_429_nl, and_tmp_197, or_748_cse);
  assign and_dcpl_597 = mux_283_nl & and_dcpl_58 & and_dcpl_72 & (~ (rem_12cyc_st_8_1_0[0]));
  assign or_795_cse = (rem_12cyc_st_8_1_0!=2'b00) | (rem_12cyc_st_8_3_2!=2'b10);
  assign nor_423_nl = ~(and_dcpl_57 | (~ or_tmp_733));
  assign mux_tmp_282 = MUX_s_1_2_2(nor_423_nl, or_tmp_733, or_795_cse);
  assign nor_424_nl = ~(and_dcpl_84 | (~ mux_tmp_282));
  assign mux_tmp_283 = MUX_s_1_2_2(nor_424_nl, mux_tmp_282, or_784_cse);
  assign nor_425_nl = ~(and_dcpl_111 | (~ mux_tmp_283));
  assign mux_286_nl = MUX_s_1_2_2(nor_425_nl, mux_tmp_283, or_775_cse);
  assign and_tmp_201 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & mux_286_nl;
  assign nor_426_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_201));
  assign mux_287_nl = MUX_s_1_2_2(nor_426_nl, and_tmp_201, or_748_cse);
  assign and_dcpl_601 = mux_287_nl & and_dcpl_31 & and_dcpl_45 & (~ (rem_12cyc_st_9_1_0[0]));
  assign nor_418_nl = ~(and_dcpl_30 | (~ or_tmp_733));
  assign or_808_nl = (rem_12cyc_st_9_1_0!=2'b00) | (rem_12cyc_st_9_3_2!=2'b10);
  assign mux_tmp_286 = MUX_s_1_2_2(nor_418_nl, or_tmp_733, or_808_nl);
  assign nor_419_nl = ~(and_dcpl_57 | (~ mux_tmp_286));
  assign mux_tmp_287 = MUX_s_1_2_2(nor_419_nl, mux_tmp_286, or_795_cse);
  assign nor_420_nl = ~(and_dcpl_84 | (~ mux_tmp_287));
  assign mux_tmp_288 = MUX_s_1_2_2(nor_420_nl, mux_tmp_287, or_784_cse);
  assign nor_421_nl = ~(and_dcpl_111 | (~ mux_tmp_288));
  assign mux_291_nl = MUX_s_1_2_2(nor_421_nl, mux_tmp_288, or_775_cse);
  assign and_tmp_205 = or_753_cse & or_757_cse & or_762_cse & or_768_cse & mux_291_nl;
  assign nor_422_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_205));
  assign mux_292_nl = MUX_s_1_2_2(nor_422_nl, and_tmp_205, or_748_cse);
  assign and_dcpl_605 = mux_292_nl & and_dcpl_4 & and_dcpl_18 & (~ (rem_12cyc_st_10_1_0[0]));
  assign or_tmp_808 = (acc_tmp!=2'b10) | (acc_1_tmp[1:0]!=2'b00) | (~ ccs_ccore_start_rsci_idat);
  assign nor_409_nl = ~((rem_12cyc_st_10_3_2[1]) | (~ or_tmp_808));
  assign or_823_nl = (~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b00)
      | (rem_12cyc_st_10_3_2[0]);
  assign mux_tmp_291 = MUX_s_1_2_2(nor_409_nl, or_tmp_808, or_823_nl);
  assign nor_410_nl = ~((rem_12cyc_st_6_3_2[1]) | (~ mux_tmp_291));
  assign or_822_nl = (~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b00)
      | (rem_12cyc_st_6_3_2[0]);
  assign mux_tmp_292 = MUX_s_1_2_2(nor_410_nl, mux_tmp_291, or_822_nl);
  assign nor_411_nl = ~((rem_12cyc_st_5_3_2[1]) | (~ mux_tmp_292));
  assign or_821_nl = (~ main_stage_0_6) | (~ asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b00)
      | (rem_12cyc_st_5_3_2[0]);
  assign mux_tmp_293 = MUX_s_1_2_2(nor_411_nl, mux_tmp_292, or_821_nl);
  assign nor_412_nl = ~((rem_12cyc_st_4_3_2[1]) | (~ mux_tmp_293));
  assign or_820_nl = (~ main_stage_0_5) | (~ asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b00)
      | (rem_12cyc_st_4_3_2[0]);
  assign mux_tmp_294 = MUX_s_1_2_2(nor_412_nl, mux_tmp_293, or_820_nl);
  assign nor_413_nl = ~((rem_12cyc_st_3_3_2[1]) | (~ mux_tmp_294));
  assign or_819_nl = (~ main_stage_0_4) | (~ asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b00)
      | (rem_12cyc_st_3_3_2[0]);
  assign mux_tmp_295 = MUX_s_1_2_2(nor_413_nl, mux_tmp_294, or_819_nl);
  assign nor_414_nl = ~((rem_12cyc_st_2_3_2[1]) | (~ mux_tmp_295));
  assign or_818_nl = (~ main_stage_0_3) | (~ asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b00)
      | (rem_12cyc_st_2_3_2[0]);
  assign mux_tmp_296 = MUX_s_1_2_2(nor_414_nl, mux_tmp_295, or_818_nl);
  assign nor_415_nl = ~((rem_12cyc_st_9_3_2[1]) | (~ mux_tmp_296));
  assign or_817_nl = (~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b00)
      | (rem_12cyc_st_9_3_2[0]);
  assign mux_tmp_297 = MUX_s_1_2_2(nor_415_nl, mux_tmp_296, or_817_nl);
  assign nor_416_nl = ~((rem_12cyc_st_8_3_2[1]) | (~ mux_tmp_297));
  assign or_816_nl = (~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b00)
      | (rem_12cyc_st_8_3_2[0]);
  assign mux_tmp_298 = MUX_s_1_2_2(nor_416_nl, mux_tmp_297, or_816_nl);
  assign nor_417_nl = ~((rem_12cyc_st_7_3_2[1]) | (~ mux_tmp_298));
  assign or_815_nl = (~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b00)
      | (rem_12cyc_st_7_3_2[0]);
  assign mux_301_nl = MUX_s_1_2_2(nor_417_nl, mux_tmp_298, or_815_nl);
  assign and_tmp_206 = ((~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b10)
      | (rem_12cyc_1_0!=2'b00)) & mux_301_nl;
  assign and_dcpl_610 = and_dcpl_568 & and_dcpl_355;
  assign or_tmp_820 = (rem_12cyc_1_0!=2'b01) | (rem_12cyc_3_2!=2'b10) | not_tmp_54;
  assign or_837_cse = (acc_1_tmp[1:0]!=2'b01) | (acc_tmp!=2'b10);
  assign nor_408_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_820));
  assign mux_302_nl = MUX_s_1_2_2(nor_408_nl, or_tmp_820, or_837_cse);
  assign and_dcpl_612 = mux_302_nl & and_dcpl_358 & and_dcpl_571;
  assign nand_84_cse = ~((rem_12cyc_st_2_3_2[1]) & asn_itm_2 & main_stage_0_3 & (rem_12cyc_st_2_1_0[0]));
  assign or_842_cse = (rem_12cyc_st_2_1_0[1]) | (rem_12cyc_st_2_3_2[0]);
  assign and_986_nl = nand_84_cse & or_tmp_820;
  assign mux_tmp_301 = MUX_s_1_2_2(and_986_nl, or_tmp_820, or_842_cse);
  assign nor_407_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_301));
  assign mux_304_nl = MUX_s_1_2_2(nor_407_nl, mux_tmp_301, or_837_cse);
  assign and_dcpl_614 = mux_304_nl & and_dcpl_362 & and_dcpl_575;
  assign or_847_cse = (rem_12cyc_st_3_1_0[1]) | (rem_12cyc_st_3_3_2!=2'b10);
  assign and_984_nl = nand_274_cse & or_tmp_820;
  assign mux_tmp_303 = MUX_s_1_2_2(and_984_nl, or_tmp_820, or_847_cse);
  assign and_985_nl = nand_84_cse & mux_tmp_303;
  assign mux_tmp_304 = MUX_s_1_2_2(and_985_nl, mux_tmp_303, or_842_cse);
  assign nor_406_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_304));
  assign mux_307_nl = MUX_s_1_2_2(nor_406_nl, mux_tmp_304, or_837_cse);
  assign and_dcpl_616 = mux_307_nl & and_dcpl_366 & and_dcpl_579;
  assign nand_79_cse = ~((rem_12cyc_st_4_3_2[1]) & asn_itm_4 & main_stage_0_5 & (rem_12cyc_st_4_1_0[0]));
  assign or_854_cse = (rem_12cyc_st_4_1_0[1]) | (rem_12cyc_st_4_3_2[0]);
  assign and_981_nl = nand_79_cse & or_tmp_820;
  assign mux_tmp_306 = MUX_s_1_2_2(and_981_nl, or_tmp_820, or_854_cse);
  assign and_982_nl = nand_274_cse & mux_tmp_306;
  assign mux_tmp_307 = MUX_s_1_2_2(and_982_nl, mux_tmp_306, or_847_cse);
  assign and_983_nl = nand_84_cse & mux_tmp_307;
  assign mux_tmp_308 = MUX_s_1_2_2(and_983_nl, mux_tmp_307, or_842_cse);
  assign nor_405_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_308));
  assign mux_311_nl = MUX_s_1_2_2(nor_405_nl, mux_tmp_308, or_837_cse);
  assign and_dcpl_618 = mux_311_nl & and_dcpl_370 & and_dcpl_583;
  assign or_863_cse = (rem_12cyc_st_5_1_0[1]) | (rem_12cyc_st_5_3_2!=2'b10);
  assign and_977_nl = nand_267_cse & or_tmp_820;
  assign mux_tmp_310 = MUX_s_1_2_2(and_977_nl, or_tmp_820, or_863_cse);
  assign and_978_nl = nand_79_cse & mux_tmp_310;
  assign mux_tmp_311 = MUX_s_1_2_2(and_978_nl, mux_tmp_310, or_854_cse);
  assign and_979_nl = nand_274_cse & mux_tmp_311;
  assign mux_tmp_312 = MUX_s_1_2_2(and_979_nl, mux_tmp_311, or_847_cse);
  assign and_980_nl = nand_84_cse & mux_tmp_312;
  assign mux_tmp_313 = MUX_s_1_2_2(and_980_nl, mux_tmp_312, or_842_cse);
  assign nor_404_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_313));
  assign mux_316_nl = MUX_s_1_2_2(nor_404_nl, mux_tmp_313, or_837_cse);
  assign and_dcpl_622 = mux_316_nl & and_dcpl_112 & and_dcpl_129 & (~ (rem_12cyc_st_6_1_0[1]));
  assign or_874_cse = (rem_12cyc_st_6_1_0!=2'b01) | (rem_12cyc_st_6_3_2!=2'b10);
  assign nor_402_nl = ~(and_dcpl_111 | (~ or_tmp_820));
  assign mux_tmp_315 = MUX_s_1_2_2(nor_402_nl, or_tmp_820, or_874_cse);
  assign and_973_nl = nand_267_cse & mux_tmp_315;
  assign mux_tmp_316 = MUX_s_1_2_2(and_973_nl, mux_tmp_315, or_863_cse);
  assign and_974_nl = nand_79_cse & mux_tmp_316;
  assign mux_tmp_317 = MUX_s_1_2_2(and_974_nl, mux_tmp_316, or_854_cse);
  assign and_975_nl = nand_274_cse & mux_tmp_317;
  assign mux_tmp_318 = MUX_s_1_2_2(and_975_nl, mux_tmp_317, or_847_cse);
  assign and_976_nl = nand_84_cse & mux_tmp_318;
  assign mux_tmp_319 = MUX_s_1_2_2(and_976_nl, mux_tmp_318, or_842_cse);
  assign nor_403_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_319));
  assign mux_322_nl = MUX_s_1_2_2(nor_403_nl, mux_tmp_319, or_837_cse);
  assign and_dcpl_625 = mux_322_nl & and_dcpl_85 & and_dcpl_99 & (rem_12cyc_st_7_1_0[0]);
  assign or_887_cse = (rem_12cyc_st_7_1_0!=2'b01) | (rem_12cyc_st_7_3_2!=2'b10);
  assign nor_399_nl = ~(and_dcpl_84 | (~ or_tmp_820));
  assign mux_tmp_321 = MUX_s_1_2_2(nor_399_nl, or_tmp_820, or_887_cse);
  assign nor_400_nl = ~(and_dcpl_111 | (~ mux_tmp_321));
  assign mux_tmp_322 = MUX_s_1_2_2(nor_400_nl, mux_tmp_321, or_874_cse);
  assign and_969_nl = nand_267_cse & mux_tmp_322;
  assign mux_tmp_323 = MUX_s_1_2_2(and_969_nl, mux_tmp_322, or_863_cse);
  assign and_970_nl = nand_79_cse & mux_tmp_323;
  assign mux_tmp_324 = MUX_s_1_2_2(and_970_nl, mux_tmp_323, or_854_cse);
  assign and_971_nl = nand_274_cse & mux_tmp_324;
  assign mux_tmp_325 = MUX_s_1_2_2(and_971_nl, mux_tmp_324, or_847_cse);
  assign and_972_nl = nand_84_cse & mux_tmp_325;
  assign mux_tmp_326 = MUX_s_1_2_2(and_972_nl, mux_tmp_325, or_842_cse);
  assign nor_401_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_326));
  assign mux_329_nl = MUX_s_1_2_2(nor_401_nl, mux_tmp_326, or_837_cse);
  assign and_dcpl_628 = mux_329_nl & and_dcpl_58 & and_dcpl_72 & (rem_12cyc_st_8_1_0[0]);
  assign or_902_cse = (rem_12cyc_st_8_1_0!=2'b01) | (rem_12cyc_st_8_3_2!=2'b10);
  assign nor_395_nl = ~(and_dcpl_57 | (~ or_tmp_820));
  assign mux_tmp_328 = MUX_s_1_2_2(nor_395_nl, or_tmp_820, or_902_cse);
  assign nor_396_nl = ~(and_dcpl_84 | (~ mux_tmp_328));
  assign mux_tmp_329 = MUX_s_1_2_2(nor_396_nl, mux_tmp_328, or_887_cse);
  assign nor_397_nl = ~(and_dcpl_111 | (~ mux_tmp_329));
  assign mux_tmp_330 = MUX_s_1_2_2(nor_397_nl, mux_tmp_329, or_874_cse);
  assign and_965_nl = nand_267_cse & mux_tmp_330;
  assign mux_tmp_331 = MUX_s_1_2_2(and_965_nl, mux_tmp_330, or_863_cse);
  assign and_966_nl = nand_79_cse & mux_tmp_331;
  assign mux_tmp_332 = MUX_s_1_2_2(and_966_nl, mux_tmp_331, or_854_cse);
  assign and_967_nl = nand_274_cse & mux_tmp_332;
  assign mux_tmp_333 = MUX_s_1_2_2(and_967_nl, mux_tmp_332, or_847_cse);
  assign and_968_nl = nand_84_cse & mux_tmp_333;
  assign mux_tmp_334 = MUX_s_1_2_2(and_968_nl, mux_tmp_333, or_842_cse);
  assign nor_398_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_334));
  assign mux_337_nl = MUX_s_1_2_2(nor_398_nl, mux_tmp_334, or_837_cse);
  assign and_dcpl_631 = mux_337_nl & and_dcpl_31 & and_dcpl_45 & (rem_12cyc_st_9_1_0[0]);
  assign nor_390_nl = ~(and_dcpl_30 | (~ or_tmp_820));
  assign or_919_nl = (rem_12cyc_st_9_1_0!=2'b01) | (rem_12cyc_st_9_3_2!=2'b10);
  assign mux_tmp_336 = MUX_s_1_2_2(nor_390_nl, or_tmp_820, or_919_nl);
  assign nor_391_nl = ~(and_dcpl_57 | (~ mux_tmp_336));
  assign mux_tmp_337 = MUX_s_1_2_2(nor_391_nl, mux_tmp_336, or_902_cse);
  assign nor_392_nl = ~(and_dcpl_84 | (~ mux_tmp_337));
  assign mux_tmp_338 = MUX_s_1_2_2(nor_392_nl, mux_tmp_337, or_887_cse);
  assign nor_393_nl = ~(and_dcpl_111 | (~ mux_tmp_338));
  assign mux_tmp_339 = MUX_s_1_2_2(nor_393_nl, mux_tmp_338, or_874_cse);
  assign and_961_nl = nand_267_cse & mux_tmp_339;
  assign mux_tmp_340 = MUX_s_1_2_2(and_961_nl, mux_tmp_339, or_863_cse);
  assign and_962_nl = nand_79_cse & mux_tmp_340;
  assign mux_tmp_341 = MUX_s_1_2_2(and_962_nl, mux_tmp_340, or_854_cse);
  assign and_963_nl = nand_274_cse & mux_tmp_341;
  assign mux_tmp_342 = MUX_s_1_2_2(and_963_nl, mux_tmp_341, or_847_cse);
  assign and_964_nl = nand_84_cse & mux_tmp_342;
  assign mux_tmp_343 = MUX_s_1_2_2(and_964_nl, mux_tmp_342, or_842_cse);
  assign nor_394_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_343));
  assign mux_346_nl = MUX_s_1_2_2(nor_394_nl, mux_tmp_343, or_837_cse);
  assign and_dcpl_634 = mux_346_nl & and_dcpl_4 & and_dcpl_18 & (rem_12cyc_st_10_1_0[0]);
  assign or_tmp_921 = (acc_tmp!=2'b10) | (acc_1_tmp[1]) | nand_250_cse;
  assign nor_380_nl = ~((rem_12cyc_st_10_3_2[1]) | (~ or_tmp_921));
  assign or_938_nl = (~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b01)
      | (rem_12cyc_st_10_3_2[0]);
  assign mux_tmp_345 = MUX_s_1_2_2(nor_380_nl, or_tmp_921, or_938_nl);
  assign nor_381_nl = ~((rem_12cyc_st_6_3_2[1]) | (~ mux_tmp_345));
  assign or_937_nl = (~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b01)
      | (rem_12cyc_st_6_3_2[0]);
  assign mux_tmp_346 = MUX_s_1_2_2(nor_381_nl, mux_tmp_345, or_937_nl);
  assign nor_382_nl = ~((rem_12cyc_st_5_3_2[1]) | (~ mux_tmp_346));
  assign or_936_nl = (~ main_stage_0_6) | (~ asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b01)
      | (rem_12cyc_st_5_3_2[0]);
  assign mux_tmp_347 = MUX_s_1_2_2(nor_382_nl, mux_tmp_346, or_936_nl);
  assign nor_383_nl = ~((rem_12cyc_st_4_3_2[1]) | (~ mux_tmp_347));
  assign or_935_nl = (~ main_stage_0_5) | (~ asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b01)
      | (rem_12cyc_st_4_3_2[0]);
  assign mux_tmp_348 = MUX_s_1_2_2(nor_383_nl, mux_tmp_347, or_935_nl);
  assign nor_384_nl = ~((rem_12cyc_st_3_3_2[1]) | (~ mux_tmp_348));
  assign or_934_nl = (~ main_stage_0_4) | (~ asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b01)
      | (rem_12cyc_st_3_3_2[0]);
  assign mux_tmp_349 = MUX_s_1_2_2(nor_384_nl, mux_tmp_348, or_934_nl);
  assign nor_385_nl = ~((rem_12cyc_st_2_3_2[1]) | (~ mux_tmp_349));
  assign or_933_nl = (~ main_stage_0_3) | (~ asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b01)
      | (rem_12cyc_st_2_3_2[0]);
  assign mux_tmp_350 = MUX_s_1_2_2(nor_385_nl, mux_tmp_349, or_933_nl);
  assign nor_386_nl = ~((rem_12cyc_st_9_3_2[1]) | (~ mux_tmp_350));
  assign or_932_nl = (~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b01)
      | (rem_12cyc_st_9_3_2[0]);
  assign mux_tmp_351 = MUX_s_1_2_2(nor_386_nl, mux_tmp_350, or_932_nl);
  assign nor_387_nl = ~((rem_12cyc_st_8_3_2[1]) | (~ mux_tmp_351));
  assign or_931_nl = (~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b01)
      | (rem_12cyc_st_8_3_2[0]);
  assign mux_tmp_352 = MUX_s_1_2_2(nor_387_nl, mux_tmp_351, or_931_nl);
  assign nor_388_nl = ~((rem_12cyc_st_7_3_2[1]) | (~ mux_tmp_352));
  assign or_930_nl = (~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b01)
      | (rem_12cyc_st_7_3_2[0]);
  assign mux_tmp_353 = MUX_s_1_2_2(nor_388_nl, mux_tmp_352, or_930_nl);
  assign nor_389_nl = ~((rem_12cyc_1_0[0]) | (~ mux_tmp_353));
  assign or_929_nl = (~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b10)
      | (rem_12cyc_1_0[1]);
  assign mux_tmp_354 = MUX_s_1_2_2(nor_389_nl, mux_tmp_353, or_929_nl);
  assign and_dcpl_638 = and_dcpl_568 & and_dcpl_393;
  assign and_dcpl_639 = and_dcpl_570 & (rem_12cyc_st_2_1_0[1]);
  assign or_tmp_934 = (rem_12cyc_1_0!=2'b10) | (rem_12cyc_3_2!=2'b10) | not_tmp_54;
  assign or_952_cse = (acc_1_tmp[1:0]!=2'b10) | (acc_tmp!=2'b10);
  assign nor_379_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_934));
  assign mux_357_nl = MUX_s_1_2_2(nor_379_nl, or_tmp_934, or_952_cse);
  assign and_dcpl_641 = mux_357_nl & and_dcpl_298 & and_dcpl_639;
  assign and_dcpl_642 = and_dcpl_574 & (rem_12cyc_st_3_1_0[1]);
  assign or_957_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2!=2'b10) |
      (~ asn_itm_2) | (~ main_stage_0_3) | (rem_12cyc_st_2_1_0[0]);
  assign and_tmp_207 = or_957_cse & or_tmp_934;
  assign nor_378_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_207));
  assign mux_358_nl = MUX_s_1_2_2(nor_378_nl, and_tmp_207, or_952_cse);
  assign and_dcpl_644 = mux_358_nl & and_dcpl_304 & and_dcpl_642;
  assign and_dcpl_645 = and_dcpl_578 & (rem_12cyc_st_4_1_0[1]);
  assign or_961_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b10) |
      (~ asn_itm_3) | (~ main_stage_0_4) | (rem_12cyc_st_3_1_0[0]);
  assign and_tmp_209 = or_957_cse & or_961_cse & or_tmp_934;
  assign nor_377_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_209));
  assign mux_359_nl = MUX_s_1_2_2(nor_377_nl, and_tmp_209, or_952_cse);
  assign and_dcpl_647 = mux_359_nl & and_dcpl_310 & and_dcpl_645;
  assign and_dcpl_648 = and_dcpl_582 & (rem_12cyc_st_5_1_0[1]);
  assign or_966_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2!=2'b10) |
      (~ asn_itm_4) | (~ main_stage_0_5) | (rem_12cyc_st_4_1_0[0]);
  assign and_tmp_212 = or_957_cse & or_961_cse & or_966_cse & or_tmp_934;
  assign nor_376_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_212));
  assign mux_360_nl = MUX_s_1_2_2(nor_376_nl, and_tmp_212, or_952_cse);
  assign and_dcpl_650 = mux_360_nl & and_dcpl_316 & and_dcpl_648;
  assign or_972_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b10) |
      (~ asn_itm_5) | (~ main_stage_0_6) | (rem_12cyc_st_5_1_0[0]);
  assign and_tmp_216 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & or_tmp_934;
  assign nor_375_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_216));
  assign mux_361_nl = MUX_s_1_2_2(nor_375_nl, and_tmp_216, or_952_cse);
  assign and_dcpl_653 = mux_361_nl & and_dcpl_112 & and_dcpl_126 & (rem_12cyc_st_6_1_0[1]);
  assign or_979_cse = (rem_12cyc_st_6_1_0!=2'b10) | (rem_12cyc_st_6_3_2!=2'b10);
  assign nor_373_nl = ~(and_dcpl_111 | (~ or_tmp_934));
  assign mux_362_nl = MUX_s_1_2_2(nor_373_nl, or_tmp_934, or_979_cse);
  assign and_tmp_220 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & mux_362_nl;
  assign nor_374_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_220));
  assign mux_363_nl = MUX_s_1_2_2(nor_374_nl, and_tmp_220, or_952_cse);
  assign and_dcpl_657 = mux_363_nl & and_dcpl_85 & and_dcpl_104 & (~ (rem_12cyc_st_7_1_0[0]));
  assign or_988_cse = (rem_12cyc_st_7_1_0!=2'b10) | (rem_12cyc_st_7_3_2!=2'b10);
  assign nor_370_nl = ~(and_dcpl_84 | (~ or_tmp_934));
  assign mux_tmp_362 = MUX_s_1_2_2(nor_370_nl, or_tmp_934, or_988_cse);
  assign nor_371_nl = ~(and_dcpl_111 | (~ mux_tmp_362));
  assign mux_365_nl = MUX_s_1_2_2(nor_371_nl, mux_tmp_362, or_979_cse);
  assign and_tmp_224 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & mux_365_nl;
  assign nor_372_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_224));
  assign mux_366_nl = MUX_s_1_2_2(nor_372_nl, and_tmp_224, or_952_cse);
  assign and_dcpl_661 = mux_366_nl & and_dcpl_58 & and_dcpl_77 & (~ (rem_12cyc_st_8_1_0[0]));
  assign or_999_cse = (rem_12cyc_st_8_1_0!=2'b10) | (rem_12cyc_st_8_3_2!=2'b10);
  assign nor_366_nl = ~(and_dcpl_57 | (~ or_tmp_934));
  assign mux_tmp_365 = MUX_s_1_2_2(nor_366_nl, or_tmp_934, or_999_cse);
  assign nor_367_nl = ~(and_dcpl_84 | (~ mux_tmp_365));
  assign mux_tmp_366 = MUX_s_1_2_2(nor_367_nl, mux_tmp_365, or_988_cse);
  assign nor_368_nl = ~(and_dcpl_111 | (~ mux_tmp_366));
  assign mux_369_nl = MUX_s_1_2_2(nor_368_nl, mux_tmp_366, or_979_cse);
  assign and_tmp_228 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & mux_369_nl;
  assign nor_369_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_228));
  assign mux_370_nl = MUX_s_1_2_2(nor_369_nl, and_tmp_228, or_952_cse);
  assign and_dcpl_665 = mux_370_nl & and_dcpl_31 & and_dcpl_50 & (~ (rem_12cyc_st_9_1_0[0]));
  assign nor_361_nl = ~(and_dcpl_30 | (~ or_tmp_934));
  assign or_1012_nl = (rem_12cyc_st_9_1_0!=2'b10) | (rem_12cyc_st_9_3_2!=2'b10);
  assign mux_tmp_369 = MUX_s_1_2_2(nor_361_nl, or_tmp_934, or_1012_nl);
  assign nor_362_nl = ~(and_dcpl_57 | (~ mux_tmp_369));
  assign mux_tmp_370 = MUX_s_1_2_2(nor_362_nl, mux_tmp_369, or_999_cse);
  assign nor_363_nl = ~(and_dcpl_84 | (~ mux_tmp_370));
  assign mux_tmp_371 = MUX_s_1_2_2(nor_363_nl, mux_tmp_370, or_988_cse);
  assign nor_364_nl = ~(and_dcpl_111 | (~ mux_tmp_371));
  assign mux_374_nl = MUX_s_1_2_2(nor_364_nl, mux_tmp_371, or_979_cse);
  assign and_tmp_232 = or_957_cse & or_961_cse & or_966_cse & or_972_cse & mux_374_nl;
  assign nor_365_nl = ~(ccs_ccore_start_rsci_idat | (~ and_tmp_232));
  assign mux_375_nl = MUX_s_1_2_2(nor_365_nl, and_tmp_232, or_952_cse);
  assign and_dcpl_669 = mux_375_nl & and_dcpl_4 & and_dcpl_23 & (~ (rem_12cyc_st_10_1_0[0]));
  assign or_tmp_1009 = (acc_tmp!=2'b10) | (acc_1_tmp[1:0]!=2'b10) | (~ ccs_ccore_start_rsci_idat);
  assign nor_352_nl = ~((rem_12cyc_st_10_3_2[1]) | (~ or_tmp_1009));
  assign or_1027_nl = (~ main_stage_0_11) | (~ asn_itm_10) | (rem_12cyc_st_10_1_0!=2'b10)
      | (rem_12cyc_st_10_3_2[0]);
  assign mux_tmp_374 = MUX_s_1_2_2(nor_352_nl, or_tmp_1009, or_1027_nl);
  assign nor_353_nl = ~((rem_12cyc_st_6_3_2[1]) | (~ mux_tmp_374));
  assign or_1026_nl = (~ main_stage_0_7) | (~ asn_itm_6) | (rem_12cyc_st_6_1_0!=2'b10)
      | (rem_12cyc_st_6_3_2[0]);
  assign mux_tmp_375 = MUX_s_1_2_2(nor_353_nl, mux_tmp_374, or_1026_nl);
  assign nor_354_nl = ~((rem_12cyc_st_5_3_2[1]) | (~ mux_tmp_375));
  assign or_1025_nl = (~ main_stage_0_6) | (~ asn_itm_5) | (rem_12cyc_st_5_1_0!=2'b10)
      | (rem_12cyc_st_5_3_2[0]);
  assign mux_tmp_376 = MUX_s_1_2_2(nor_354_nl, mux_tmp_375, or_1025_nl);
  assign nor_355_nl = ~((rem_12cyc_st_4_3_2[1]) | (~ mux_tmp_376));
  assign or_1024_nl = (~ main_stage_0_5) | (~ asn_itm_4) | (rem_12cyc_st_4_1_0!=2'b10)
      | (rem_12cyc_st_4_3_2[0]);
  assign mux_tmp_377 = MUX_s_1_2_2(nor_355_nl, mux_tmp_376, or_1024_nl);
  assign nor_356_nl = ~((rem_12cyc_st_3_3_2[1]) | (~ mux_tmp_377));
  assign or_1023_nl = (~ main_stage_0_4) | (~ asn_itm_3) | (rem_12cyc_st_3_1_0!=2'b10)
      | (rem_12cyc_st_3_3_2[0]);
  assign mux_tmp_378 = MUX_s_1_2_2(nor_356_nl, mux_tmp_377, or_1023_nl);
  assign nor_357_nl = ~((rem_12cyc_st_2_3_2[1]) | (~ mux_tmp_378));
  assign or_1022_nl = (~ main_stage_0_3) | (~ asn_itm_2) | (rem_12cyc_st_2_1_0!=2'b10)
      | (rem_12cyc_st_2_3_2[0]);
  assign mux_tmp_379 = MUX_s_1_2_2(nor_357_nl, mux_tmp_378, or_1022_nl);
  assign nor_358_nl = ~((rem_12cyc_st_9_3_2[1]) | (~ mux_tmp_379));
  assign or_1021_nl = (~ main_stage_0_10) | (~ asn_itm_9) | (rem_12cyc_st_9_1_0!=2'b10)
      | (rem_12cyc_st_9_3_2[0]);
  assign mux_tmp_380 = MUX_s_1_2_2(nor_358_nl, mux_tmp_379, or_1021_nl);
  assign nor_359_nl = ~((rem_12cyc_st_8_3_2[1]) | (~ mux_tmp_380));
  assign or_1020_nl = (~ main_stage_0_9) | (~ asn_itm_8) | (rem_12cyc_st_8_1_0!=2'b10)
      | (rem_12cyc_st_8_3_2[0]);
  assign mux_tmp_381 = MUX_s_1_2_2(nor_359_nl, mux_tmp_380, or_1020_nl);
  assign nor_360_nl = ~((rem_12cyc_st_7_3_2[1]) | (~ mux_tmp_381));
  assign or_1019_nl = (~ main_stage_0_8) | (~ asn_itm_7) | (rem_12cyc_st_7_1_0!=2'b10)
      | (rem_12cyc_st_7_3_2[0]);
  assign mux_384_nl = MUX_s_1_2_2(nor_360_nl, mux_tmp_381, or_1019_nl);
  assign and_tmp_233 = ((~ main_stage_0_2) | (~ asn_itm_1) | (rem_12cyc_3_2!=2'b10)
      | (rem_12cyc_1_0!=2'b10)) & mux_384_nl;
  assign and_dcpl_673 = and_dcpl_568 & and_dcpl_430;
  assign or_tmp_1021 = (~((rem_12cyc_1_0==2'b11) & (rem_12cyc_3_2==2'b10))) | not_tmp_54;
  assign nand_57_cse = ~((acc_1_tmp[1:0]==2'b11) & (acc_tmp==2'b10));
  assign nor_351_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_1021));
  assign mux_385_nl = MUX_s_1_2_2(nor_351_nl, or_tmp_1021, nand_57_cse);
  assign and_dcpl_675 = mux_385_nl & and_dcpl_358 & and_dcpl_639;
  assign or_1045_cse = (~ (rem_12cyc_st_2_1_0[1])) | (rem_12cyc_st_2_3_2[0]);
  assign and_960_nl = nand_84_cse & or_tmp_1021;
  assign mux_tmp_384 = MUX_s_1_2_2(and_960_nl, or_tmp_1021, or_1045_cse);
  assign nor_350_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_384));
  assign mux_387_nl = MUX_s_1_2_2(nor_350_nl, mux_tmp_384, nand_57_cse);
  assign and_dcpl_677 = mux_387_nl & and_dcpl_362 & and_dcpl_642;
  assign or_1050_cse = (~ (rem_12cyc_st_3_1_0[1])) | (rem_12cyc_st_3_3_2!=2'b10);
  assign and_958_nl = nand_274_cse & or_tmp_1021;
  assign mux_tmp_386 = MUX_s_1_2_2(and_958_nl, or_tmp_1021, or_1050_cse);
  assign and_959_nl = nand_84_cse & mux_tmp_386;
  assign mux_tmp_387 = MUX_s_1_2_2(and_959_nl, mux_tmp_386, or_1045_cse);
  assign nor_349_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_387));
  assign mux_390_nl = MUX_s_1_2_2(nor_349_nl, mux_tmp_387, nand_57_cse);
  assign and_dcpl_679 = mux_390_nl & and_dcpl_366 & and_dcpl_645;
  assign or_1057_cse = (~ (rem_12cyc_st_4_1_0[1])) | (rem_12cyc_st_4_3_2[0]);
  assign and_955_nl = nand_79_cse & or_tmp_1021;
  assign mux_tmp_389 = MUX_s_1_2_2(and_955_nl, or_tmp_1021, or_1057_cse);
  assign and_956_nl = nand_274_cse & mux_tmp_389;
  assign mux_tmp_390 = MUX_s_1_2_2(and_956_nl, mux_tmp_389, or_1050_cse);
  assign and_957_nl = nand_84_cse & mux_tmp_390;
  assign mux_tmp_391 = MUX_s_1_2_2(and_957_nl, mux_tmp_390, or_1045_cse);
  assign nor_348_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_391));
  assign mux_394_nl = MUX_s_1_2_2(nor_348_nl, mux_tmp_391, nand_57_cse);
  assign and_dcpl_681 = mux_394_nl & and_dcpl_370 & and_dcpl_648;
  assign or_1066_cse = (~ (rem_12cyc_st_5_1_0[1])) | (rem_12cyc_st_5_3_2!=2'b10);
  assign and_951_nl = nand_267_cse & or_tmp_1021;
  assign mux_tmp_393 = MUX_s_1_2_2(and_951_nl, or_tmp_1021, or_1066_cse);
  assign and_952_nl = nand_79_cse & mux_tmp_393;
  assign mux_tmp_394 = MUX_s_1_2_2(and_952_nl, mux_tmp_393, or_1057_cse);
  assign and_953_nl = nand_274_cse & mux_tmp_394;
  assign mux_tmp_395 = MUX_s_1_2_2(and_953_nl, mux_tmp_394, or_1050_cse);
  assign and_954_nl = nand_84_cse & mux_tmp_395;
  assign mux_tmp_396 = MUX_s_1_2_2(and_954_nl, mux_tmp_395, or_1045_cse);
  assign nor_347_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_396));
  assign mux_399_nl = MUX_s_1_2_2(nor_347_nl, mux_tmp_396, nand_57_cse);
  assign and_dcpl_684 = mux_399_nl & and_dcpl_112 & and_dcpl_129 & (rem_12cyc_st_6_1_0[1]);
  assign nand_36_cse = ~((rem_12cyc_st_6_1_0==2'b11) & (rem_12cyc_st_6_3_2==2'b10));
  assign nor_345_nl = ~(and_dcpl_111 | (~ or_tmp_1021));
  assign mux_tmp_398 = MUX_s_1_2_2(nor_345_nl, or_tmp_1021, nand_36_cse);
  assign and_947_nl = nand_267_cse & mux_tmp_398;
  assign mux_tmp_399 = MUX_s_1_2_2(and_947_nl, mux_tmp_398, or_1066_cse);
  assign and_948_nl = nand_79_cse & mux_tmp_399;
  assign mux_tmp_400 = MUX_s_1_2_2(and_948_nl, mux_tmp_399, or_1057_cse);
  assign and_949_nl = nand_274_cse & mux_tmp_400;
  assign mux_tmp_401 = MUX_s_1_2_2(and_949_nl, mux_tmp_400, or_1050_cse);
  assign and_950_nl = nand_84_cse & mux_tmp_401;
  assign mux_tmp_402 = MUX_s_1_2_2(and_950_nl, mux_tmp_401, or_1045_cse);
  assign nor_346_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_402));
  assign mux_405_nl = MUX_s_1_2_2(nor_346_nl, mux_tmp_402, nand_57_cse);
  assign and_dcpl_687 = mux_405_nl & and_dcpl_85 & and_dcpl_104 & (rem_12cyc_st_7_1_0[0]);
  assign nand_29_cse = ~((rem_12cyc_st_7_1_0==2'b11) & (rem_12cyc_st_7_3_2==2'b10));
  assign nor_342_nl = ~(and_dcpl_84 | (~ or_tmp_1021));
  assign mux_tmp_404 = MUX_s_1_2_2(nor_342_nl, or_tmp_1021, nand_29_cse);
  assign nor_343_nl = ~(and_dcpl_111 | (~ mux_tmp_404));
  assign mux_tmp_405 = MUX_s_1_2_2(nor_343_nl, mux_tmp_404, nand_36_cse);
  assign and_943_nl = nand_267_cse & mux_tmp_405;
  assign mux_tmp_406 = MUX_s_1_2_2(and_943_nl, mux_tmp_405, or_1066_cse);
  assign and_944_nl = nand_79_cse & mux_tmp_406;
  assign mux_tmp_407 = MUX_s_1_2_2(and_944_nl, mux_tmp_406, or_1057_cse);
  assign and_945_nl = nand_274_cse & mux_tmp_407;
  assign mux_tmp_408 = MUX_s_1_2_2(and_945_nl, mux_tmp_407, or_1050_cse);
  assign and_946_nl = nand_84_cse & mux_tmp_408;
  assign mux_tmp_409 = MUX_s_1_2_2(and_946_nl, mux_tmp_408, or_1045_cse);
  assign nor_344_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_409));
  assign mux_412_nl = MUX_s_1_2_2(nor_344_nl, mux_tmp_409, nand_57_cse);
  assign and_dcpl_690 = mux_412_nl & and_dcpl_58 & and_dcpl_77 & (rem_12cyc_st_8_1_0[0]);
  assign nand_21_cse = ~((rem_12cyc_st_8_1_0==2'b11) & (rem_12cyc_st_8_3_2==2'b10));
  assign nor_338_nl = ~(and_dcpl_57 | (~ or_tmp_1021));
  assign mux_tmp_411 = MUX_s_1_2_2(nor_338_nl, or_tmp_1021, nand_21_cse);
  assign nor_339_nl = ~(and_dcpl_84 | (~ mux_tmp_411));
  assign mux_tmp_412 = MUX_s_1_2_2(nor_339_nl, mux_tmp_411, nand_29_cse);
  assign nor_340_nl = ~(and_dcpl_111 | (~ mux_tmp_412));
  assign mux_tmp_413 = MUX_s_1_2_2(nor_340_nl, mux_tmp_412, nand_36_cse);
  assign and_939_nl = nand_267_cse & mux_tmp_413;
  assign mux_tmp_414 = MUX_s_1_2_2(and_939_nl, mux_tmp_413, or_1066_cse);
  assign and_940_nl = nand_79_cse & mux_tmp_414;
  assign mux_tmp_415 = MUX_s_1_2_2(and_940_nl, mux_tmp_414, or_1057_cse);
  assign and_941_nl = nand_274_cse & mux_tmp_415;
  assign mux_tmp_416 = MUX_s_1_2_2(and_941_nl, mux_tmp_415, or_1050_cse);
  assign and_942_nl = nand_84_cse & mux_tmp_416;
  assign mux_tmp_417 = MUX_s_1_2_2(and_942_nl, mux_tmp_416, or_1045_cse);
  assign nor_341_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_417));
  assign mux_420_nl = MUX_s_1_2_2(nor_341_nl, mux_tmp_417, nand_57_cse);
  assign and_dcpl_693 = mux_420_nl & and_dcpl_31 & and_dcpl_50 & (rem_12cyc_st_9_1_0[0]);
  assign nor_333_nl = ~(and_dcpl_30 | (~ or_tmp_1021));
  assign nand_12_nl = ~((rem_12cyc_st_9_1_0==2'b11) & (rem_12cyc_st_9_3_2==2'b10));
  assign mux_tmp_419 = MUX_s_1_2_2(nor_333_nl, or_tmp_1021, nand_12_nl);
  assign nor_334_nl = ~(and_dcpl_57 | (~ mux_tmp_419));
  assign mux_tmp_420 = MUX_s_1_2_2(nor_334_nl, mux_tmp_419, nand_21_cse);
  assign nor_335_nl = ~(and_dcpl_84 | (~ mux_tmp_420));
  assign mux_tmp_421 = MUX_s_1_2_2(nor_335_nl, mux_tmp_420, nand_29_cse);
  assign nor_336_nl = ~(and_dcpl_111 | (~ mux_tmp_421));
  assign mux_tmp_422 = MUX_s_1_2_2(nor_336_nl, mux_tmp_421, nand_36_cse);
  assign and_935_nl = nand_267_cse & mux_tmp_422;
  assign mux_tmp_423 = MUX_s_1_2_2(and_935_nl, mux_tmp_422, or_1066_cse);
  assign and_936_nl = nand_79_cse & mux_tmp_423;
  assign mux_tmp_424 = MUX_s_1_2_2(and_936_nl, mux_tmp_423, or_1057_cse);
  assign and_937_nl = nand_274_cse & mux_tmp_424;
  assign mux_tmp_425 = MUX_s_1_2_2(and_937_nl, mux_tmp_424, or_1050_cse);
  assign and_938_nl = nand_84_cse & mux_tmp_425;
  assign mux_tmp_426 = MUX_s_1_2_2(and_938_nl, mux_tmp_425, or_1045_cse);
  assign nor_337_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_426));
  assign mux_429_nl = MUX_s_1_2_2(nor_337_nl, mux_tmp_426, nand_57_cse);
  assign and_dcpl_696 = mux_429_nl & and_dcpl_4 & and_dcpl_23 & (rem_12cyc_st_10_1_0[0]);
  assign or_tmp_1122 = (acc_tmp!=2'b10) | nand_222_cse;
  assign nor_324_nl = ~((rem_12cyc_st_10_3_2[1]) | (~ or_tmp_1122));
  assign nand_1_nl = ~(main_stage_0_11 & asn_itm_10 & (rem_12cyc_st_10_1_0==2'b11)
      & (~ (rem_12cyc_st_10_3_2[0])));
  assign mux_tmp_428 = MUX_s_1_2_2(nor_324_nl, or_tmp_1122, nand_1_nl);
  assign nor_325_nl = ~((rem_12cyc_st_6_3_2[1]) | (~ mux_tmp_428));
  assign nand_2_nl = ~(main_stage_0_7 & asn_itm_6 & (rem_12cyc_st_6_1_0==2'b11) &
      (~ (rem_12cyc_st_6_3_2[0])));
  assign mux_tmp_429 = MUX_s_1_2_2(nor_325_nl, mux_tmp_428, nand_2_nl);
  assign nor_326_nl = ~((rem_12cyc_st_5_3_2[1]) | (~ mux_tmp_429));
  assign nand_3_nl = ~(main_stage_0_6 & asn_itm_5 & (rem_12cyc_st_5_1_0==2'b11) &
      (~ (rem_12cyc_st_5_3_2[0])));
  assign mux_tmp_430 = MUX_s_1_2_2(nor_326_nl, mux_tmp_429, nand_3_nl);
  assign nor_327_nl = ~((rem_12cyc_st_4_3_2[1]) | (~ mux_tmp_430));
  assign nand_4_nl = ~(main_stage_0_5 & asn_itm_4 & (rem_12cyc_st_4_1_0==2'b11) &
      (~ (rem_12cyc_st_4_3_2[0])));
  assign mux_tmp_431 = MUX_s_1_2_2(nor_327_nl, mux_tmp_430, nand_4_nl);
  assign nor_328_nl = ~((rem_12cyc_st_3_3_2[1]) | (~ mux_tmp_431));
  assign nand_5_nl = ~(main_stage_0_4 & asn_itm_3 & (rem_12cyc_st_3_1_0==2'b11) &
      (~ (rem_12cyc_st_3_3_2[0])));
  assign mux_tmp_432 = MUX_s_1_2_2(nor_328_nl, mux_tmp_431, nand_5_nl);
  assign nor_329_nl = ~((rem_12cyc_st_2_3_2[1]) | (~ mux_tmp_432));
  assign nand_6_nl = ~(main_stage_0_3 & asn_itm_2 & (rem_12cyc_st_2_1_0==2'b11) &
      (~ (rem_12cyc_st_2_3_2[0])));
  assign mux_tmp_433 = MUX_s_1_2_2(nor_329_nl, mux_tmp_432, nand_6_nl);
  assign nor_330_nl = ~((rem_12cyc_st_9_3_2[1]) | (~ mux_tmp_433));
  assign nand_7_nl = ~(main_stage_0_10 & asn_itm_9 & (rem_12cyc_st_9_1_0==2'b11)
      & (~ (rem_12cyc_st_9_3_2[0])));
  assign mux_tmp_434 = MUX_s_1_2_2(nor_330_nl, mux_tmp_433, nand_7_nl);
  assign nor_331_nl = ~((rem_12cyc_st_8_3_2[1]) | (~ mux_tmp_434));
  assign nand_8_nl = ~(main_stage_0_9 & asn_itm_8 & (rem_12cyc_st_8_1_0==2'b11) &
      (~ (rem_12cyc_st_8_3_2[0])));
  assign mux_tmp_435 = MUX_s_1_2_2(nor_331_nl, mux_tmp_434, nand_8_nl);
  assign nor_332_nl = ~((rem_12cyc_st_7_3_2[1]) | (~ mux_tmp_435));
  assign nand_9_nl = ~(main_stage_0_8 & asn_itm_7 & (rem_12cyc_st_7_1_0==2'b11) &
      (~ (rem_12cyc_st_7_3_2[0])));
  assign mux_tmp_436 = MUX_s_1_2_2(nor_332_nl, mux_tmp_435, nand_9_nl);
  assign and_934_nl = nand_223_cse & mux_tmp_436;
  assign nand_11_nl = ~(main_stage_0_2 & asn_itm_1 & (rem_12cyc_3_2==2'b10));
  assign mux_tmp_437 = MUX_s_1_2_2(and_934_nl, mux_tmp_436, nand_11_nl);
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_64_2_2(result_sva_duc_mx0, qelse_acc_nl, mux_13_nl);
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
      asn_itm_12 <= 1'b0;
      asn_itm_11 <= 1'b0;
      asn_itm_10 <= 1'b0;
      asn_itm_9 <= 1'b0;
      asn_itm_8 <= 1'b0;
      asn_itm_7 <= 1'b0;
      asn_itm_6 <= 1'b0;
      asn_itm_5 <= 1'b0;
      asn_itm_4 <= 1'b0;
      asn_itm_3 <= 1'b0;
      asn_itm_2 <= 1'b0;
      asn_itm_1 <= 1'b0;
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
      asn_itm_12 <= asn_itm_11;
      asn_itm_11 <= asn_itm_10;
      asn_itm_10 <= asn_itm_9;
      asn_itm_9 <= asn_itm_8;
      asn_itm_8 <= asn_itm_7;
      asn_itm_7 <= asn_itm_6;
      asn_itm_6 <= asn_itm_5;
      asn_itm_5 <= asn_itm_4;
      asn_itm_4 <= asn_itm_3;
      asn_itm_3 <= asn_itm_2;
      asn_itm_2 <= asn_itm_1;
      asn_itm_1 <= ccs_ccore_start_rsci_idat;
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
    else if ( asn_itm_12 & main_stage_0_13 & ccs_ccore_en & (~((rem_12cyc_st_12_3_2==2'b11)))
        ) begin
      result_sva_duc <= result_sva_duc_mx0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_12_3_2 <= 2'b00;
      rem_12cyc_st_12_1_0 <= 2'b00;
    end
    else if ( and_1203_cse ) begin
      rem_12cyc_st_12_3_2 <= rem_12cyc_st_11_3_2;
      rem_12cyc_st_12_1_0 <= rem_12cyc_st_11_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1173_cse ) begin
      rem_13_cmp_1_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_3_2_63_0, mut_3_3_63_0,
          mut_3_4_63_0, mut_3_5_63_0, mut_3_6_63_0, mut_3_7_63_0, mut_3_8_63_0, mut_3_9_63_0,
          mut_3_10_63_0, mut_3_11_63_0, {and_dcpl_294 , and_dcpl_300 , and_dcpl_306
          , and_dcpl_312 , and_dcpl_318 , and_dcpl_324 , and_dcpl_330 , and_dcpl_336
          , and_dcpl_342 , and_dcpl_348 , and_tmp_35});
      rem_13_cmp_1_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_2_2_63_0, mut_2_3_63_0,
          mut_2_4_63_0, mut_2_5_63_0, mut_2_6_63_0, mut_2_7_63_0, mut_2_8_63_0, mut_2_9_63_0,
          mut_2_10_63_0, mut_2_11_63_0, {and_dcpl_294 , and_dcpl_300 , and_dcpl_306
          , and_dcpl_312 , and_dcpl_318 , and_dcpl_324 , and_dcpl_330 , and_dcpl_336
          , and_dcpl_342 , and_dcpl_348 , and_tmp_35});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1175_cse ) begin
      rem_13_cmp_2_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_5_2_63_0, mut_5_3_63_0,
          mut_5_4_63_0, mut_5_5_63_0, mut_5_6_63_0, mut_5_7_63_0, mut_5_8_63_0, mut_5_9_63_0,
          mut_5_10_63_0, mut_5_11_63_0, {and_dcpl_356 , and_dcpl_360 , and_dcpl_364
          , and_dcpl_368 , and_dcpl_372 , and_dcpl_376 , and_dcpl_379 , and_dcpl_382
          , and_dcpl_385 , and_dcpl_388 , mux_tmp_76});
      rem_13_cmp_2_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_4_2_63_0, mut_4_3_63_0,
          mut_4_4_63_0, mut_4_5_63_0, mut_4_6_63_0, mut_4_7_63_0, mut_4_8_63_0, mut_4_9_63_0,
          mut_4_10_63_0, mut_4_11_63_0, {and_dcpl_356 , and_dcpl_360 , and_dcpl_364
          , and_dcpl_368 , and_dcpl_372 , and_dcpl_376 , and_dcpl_379 , and_dcpl_382
          , and_dcpl_385 , and_dcpl_388 , mux_tmp_76});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1177_cse ) begin
      rem_13_cmp_3_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_7_2_63_0, mut_7_3_63_0,
          mut_7_4_63_0, mut_7_5_63_0, mut_7_6_63_0, mut_7_7_63_0, mut_7_8_63_0, mut_7_9_63_0,
          mut_7_10_63_0, mut_7_11_63_0, {and_dcpl_394 , and_dcpl_397 , and_dcpl_400
          , and_dcpl_403 , and_dcpl_406 , and_dcpl_409 , and_dcpl_413 , and_dcpl_417
          , and_dcpl_421 , and_dcpl_425 , and_tmp_80});
      rem_13_cmp_3_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_6_2_63_0, mut_6_3_63_0,
          mut_6_4_63_0, mut_6_5_63_0, mut_6_6_63_0, mut_6_7_63_0, mut_6_8_63_0, mut_6_9_63_0,
          mut_6_10_63_0, mut_6_11_63_0, {and_dcpl_394 , and_dcpl_397 , and_dcpl_400
          , and_dcpl_403 , and_dcpl_406 , and_dcpl_409 , and_dcpl_413 , and_dcpl_417
          , and_dcpl_421 , and_dcpl_425 , and_tmp_80});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1179_cse ) begin
      rem_13_cmp_4_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_9_2_63_0, mut_9_3_63_0,
          mut_9_4_63_0, mut_9_5_63_0, mut_9_6_63_0, mut_9_7_63_0, mut_9_8_63_0, mut_9_9_63_0,
          mut_9_10_63_0, mut_9_11_63_0, {and_dcpl_431 , and_dcpl_433 , and_dcpl_435
          , and_dcpl_437 , and_dcpl_439 , and_dcpl_442 , and_dcpl_445 , and_dcpl_448
          , and_dcpl_451 , and_dcpl_454 , mux_tmp_141});
      rem_13_cmp_4_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_8_2_63_0, mut_8_3_63_0,
          mut_8_4_63_0, mut_8_5_63_0, mut_8_6_63_0, mut_8_7_63_0, mut_8_8_63_0, mut_8_9_63_0,
          mut_8_10_63_0, mut_8_11_63_0, {and_dcpl_431 , and_dcpl_433 , and_dcpl_435
          , and_dcpl_437 , and_dcpl_439 , and_dcpl_442 , and_dcpl_445 , and_dcpl_448
          , and_dcpl_451 , and_dcpl_454 , mux_tmp_141});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1181_cse ) begin
      rem_13_cmp_5_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_11_2_63_0, mut_11_3_63_0,
          mut_11_4_63_0, mut_11_5_63_0, mut_11_6_63_0, mut_11_7_63_0, mut_11_8_63_0,
          mut_11_9_63_0, mut_11_10_63_0, mut_11_11_63_0, {and_dcpl_461 , and_dcpl_465
          , and_dcpl_469 , and_dcpl_473 , and_dcpl_477 , and_dcpl_480 , and_dcpl_483
          , and_dcpl_486 , and_dcpl_489 , and_dcpl_492 , and_tmp_125});
      rem_13_cmp_5_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_10_2_63_0, mut_10_3_63_0,
          mut_10_4_63_0, mut_10_5_63_0, mut_10_6_63_0, mut_10_7_63_0, mut_10_8_63_0,
          mut_10_9_63_0, mut_10_10_63_0, mut_10_11_63_0, {and_dcpl_461 , and_dcpl_465
          , and_dcpl_469 , and_dcpl_473 , and_dcpl_477 , and_dcpl_480 , and_dcpl_483
          , and_dcpl_486 , and_dcpl_489 , and_dcpl_492 , and_tmp_125});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1183_cse ) begin
      rem_13_cmp_6_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_13_2_63_0, mut_13_3_63_0,
          mut_13_4_63_0, mut_13_5_63_0, mut_13_6_63_0, mut_13_7_63_0, mut_13_8_63_0,
          mut_13_9_63_0, mut_13_10_63_0, mut_13_11_63_0, {and_dcpl_498 , and_dcpl_500
          , and_dcpl_502 , and_dcpl_504 , and_dcpl_506 , and_dcpl_508 , and_dcpl_510
          , and_dcpl_512 , and_dcpl_514 , and_dcpl_516 , mux_tmp_206});
      rem_13_cmp_6_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_12_2_63_0, mut_12_3_63_0,
          mut_12_4_63_0, mut_12_5_63_0, mut_12_6_63_0, mut_12_7_63_0, mut_12_8_63_0,
          mut_12_9_63_0, mut_12_10_63_0, mut_12_11_63_0, {and_dcpl_498 , and_dcpl_500
          , and_dcpl_502 , and_dcpl_504 , and_dcpl_506 , and_dcpl_508 , and_dcpl_510
          , and_dcpl_512 , and_dcpl_514 , and_dcpl_516 , mux_tmp_206});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1185_cse ) begin
      rem_13_cmp_7_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_15_2_63_0, mut_15_3_63_0,
          mut_15_4_63_0, mut_15_5_63_0, mut_15_6_63_0, mut_15_7_63_0, mut_15_8_63_0,
          mut_15_9_63_0, mut_15_10_63_0, mut_15_11_63_0, {and_dcpl_520 , and_dcpl_523
          , and_dcpl_526 , and_dcpl_529 , and_dcpl_532 , and_dcpl_534 , and_dcpl_536
          , and_dcpl_538 , and_dcpl_540 , and_dcpl_542 , and_tmp_170});
      rem_13_cmp_7_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_14_2_63_0, mut_14_3_63_0,
          mut_14_4_63_0, mut_14_5_63_0, mut_14_6_63_0, mut_14_7_63_0, mut_14_8_63_0,
          mut_14_9_63_0, mut_14_10_63_0, mut_14_11_63_0, {and_dcpl_520 , and_dcpl_523
          , and_dcpl_526 , and_dcpl_529 , and_dcpl_532 , and_dcpl_534 , and_dcpl_536
          , and_dcpl_538 , and_dcpl_540 , and_dcpl_542 , and_tmp_170});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1187_cse ) begin
      rem_13_cmp_8_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_17_2_63_0, mut_17_3_63_0,
          mut_17_4_63_0, mut_17_5_63_0, mut_17_6_63_0, mut_17_7_63_0, mut_17_8_63_0,
          mut_17_9_63_0, mut_17_10_63_0, mut_17_11_63_0, {and_dcpl_546 , and_dcpl_548
          , and_dcpl_550 , and_dcpl_552 , and_dcpl_554 , and_dcpl_556 , and_dcpl_558
          , and_dcpl_560 , and_dcpl_562 , and_dcpl_564 , mux_tmp_271});
      rem_13_cmp_8_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_16_2_63_0, mut_16_3_63_0,
          mut_16_4_63_0, mut_16_5_63_0, mut_16_6_63_0, mut_16_7_63_0, mut_16_8_63_0,
          mut_16_9_63_0, mut_16_10_63_0, mut_16_11_63_0, {and_dcpl_546 , and_dcpl_548
          , and_dcpl_550 , and_dcpl_552 , and_dcpl_554 , and_dcpl_556 , and_dcpl_558
          , and_dcpl_560 , and_dcpl_562 , and_dcpl_564 , mux_tmp_271});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1189_cse ) begin
      rem_13_cmp_9_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_19_2_63_0, mut_19_3_63_0,
          mut_19_4_63_0, mut_19_5_63_0, mut_19_6_63_0, mut_19_7_63_0, mut_19_8_63_0,
          mut_19_9_63_0, mut_19_10_63_0, mut_19_11_63_0, {and_dcpl_569 , and_dcpl_573
          , and_dcpl_577 , and_dcpl_581 , and_dcpl_585 , and_dcpl_589 , and_dcpl_593
          , and_dcpl_597 , and_dcpl_601 , and_dcpl_605 , and_tmp_206});
      rem_13_cmp_9_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_18_2_63_0, mut_18_3_63_0,
          mut_18_4_63_0, mut_18_5_63_0, mut_18_6_63_0, mut_18_7_63_0, mut_18_8_63_0,
          mut_18_9_63_0, mut_18_10_63_0, mut_18_11_63_0, {and_dcpl_569 , and_dcpl_573
          , and_dcpl_577 , and_dcpl_581 , and_dcpl_585 , and_dcpl_589 , and_dcpl_593
          , and_dcpl_597 , and_dcpl_601 , and_dcpl_605 , and_tmp_206});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1191_cse ) begin
      rem_13_cmp_10_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_21_2_63_0, mut_21_3_63_0,
          mut_21_4_63_0, mut_21_5_63_0, mut_21_6_63_0, mut_21_7_63_0, mut_21_8_63_0,
          mut_21_9_63_0, mut_21_10_63_0, mut_21_11_63_0, {and_dcpl_610 , and_dcpl_612
          , and_dcpl_614 , and_dcpl_616 , and_dcpl_618 , and_dcpl_622 , and_dcpl_625
          , and_dcpl_628 , and_dcpl_631 , and_dcpl_634 , mux_tmp_354});
      rem_13_cmp_10_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_20_2_63_0, mut_20_3_63_0,
          mut_20_4_63_0, mut_20_5_63_0, mut_20_6_63_0, mut_20_7_63_0, mut_20_8_63_0,
          mut_20_9_63_0, mut_20_10_63_0, mut_20_11_63_0, {and_dcpl_610 , and_dcpl_612
          , and_dcpl_614 , and_dcpl_616 , and_dcpl_618 , and_dcpl_622 , and_dcpl_625
          , and_dcpl_628 , and_dcpl_631 , and_dcpl_634 , mux_tmp_354});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1193_cse ) begin
      rem_13_cmp_11_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_23_2_63_0, mut_23_3_63_0,
          mut_23_4_63_0, mut_23_5_63_0, mut_23_6_63_0, mut_23_7_63_0, mut_23_8_63_0,
          mut_23_9_63_0, mut_23_10_63_0, mut_23_11_63_0, {and_dcpl_638 , and_dcpl_641
          , and_dcpl_644 , and_dcpl_647 , and_dcpl_650 , and_dcpl_653 , and_dcpl_657
          , and_dcpl_661 , and_dcpl_665 , and_dcpl_669 , and_tmp_233});
      rem_13_cmp_11_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_22_2_63_0, mut_22_3_63_0,
          mut_22_4_63_0, mut_22_5_63_0, mut_22_6_63_0, mut_22_7_63_0, mut_22_8_63_0,
          mut_22_9_63_0, mut_22_10_63_0, mut_22_11_63_0, {and_dcpl_638 , and_dcpl_641
          , and_dcpl_644 , and_dcpl_647 , and_dcpl_650 , and_dcpl_653 , and_dcpl_657
          , and_dcpl_661 , and_dcpl_665 , and_dcpl_669 , and_tmp_233});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1195_cse ) begin
      rem_13_cmp_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_1_2_63_0, mut_1_3_63_0,
          mut_1_4_63_0, mut_1_5_63_0, mut_1_6_63_0, mut_1_7_63_0, mut_1_8_63_0, mut_1_9_63_0,
          mut_1_10_63_0, mut_1_11_63_0, {and_dcpl_673 , and_dcpl_675 , and_dcpl_677
          , and_dcpl_679 , and_dcpl_681 , and_dcpl_684 , and_dcpl_687 , and_dcpl_690
          , and_dcpl_693 , and_dcpl_696 , mux_tmp_437});
      rem_13_cmp_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_2_63_0, mut_3_63_0,
          mut_4_63_0, mut_5_63_0, mut_6_63_0, mut_7_63_0, mut_8_63_0, mut_9_63_0,
          mut_10_63_0, mut_11_63_0, {and_dcpl_673 , and_dcpl_675 , and_dcpl_677 ,
          and_dcpl_679 , and_dcpl_681 , and_dcpl_684 , and_dcpl_687 , and_dcpl_690
          , and_dcpl_693 , and_dcpl_696 , mux_tmp_437});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1205_cse ) begin
      mut_3_11_63_0 <= mut_3_10_63_0;
      mut_2_11_63_0 <= mut_2_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1207_cse ) begin
      mut_5_11_63_0 <= mut_5_10_63_0;
      mut_4_11_63_0 <= mut_4_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1209_cse ) begin
      mut_7_11_63_0 <= mut_7_10_63_0;
      mut_6_11_63_0 <= mut_6_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1211_cse ) begin
      mut_9_11_63_0 <= mut_9_10_63_0;
      mut_8_11_63_0 <= mut_8_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1213_cse ) begin
      mut_11_11_63_0 <= mut_11_10_63_0;
      mut_10_11_63_0 <= mut_10_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1215_cse ) begin
      mut_13_11_63_0 <= mut_13_10_63_0;
      mut_12_11_63_0 <= mut_12_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1217_cse ) begin
      mut_15_11_63_0 <= mut_15_10_63_0;
      mut_14_11_63_0 <= mut_14_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1219_cse ) begin
      mut_17_11_63_0 <= mut_17_10_63_0;
      mut_16_11_63_0 <= mut_16_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1221_cse ) begin
      mut_19_11_63_0 <= mut_19_10_63_0;
      mut_18_11_63_0 <= mut_18_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1223_cse ) begin
      mut_21_11_63_0 <= mut_21_10_63_0;
      mut_20_11_63_0 <= mut_20_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1225_cse ) begin
      mut_23_11_63_0 <= mut_23_10_63_0;
      mut_22_11_63_0 <= mut_22_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1227_cse ) begin
      mut_1_11_63_0 <= mut_1_10_63_0;
      mut_11_63_0 <= mut_10_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_11_3_2 <= 2'b00;
      rem_12cyc_st_11_1_0 <= 2'b00;
    end
    else if ( and_1229_cse ) begin
      rem_12cyc_st_11_3_2 <= rem_12cyc_st_10_3_2;
      rem_12cyc_st_11_1_0 <= rem_12cyc_st_10_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1231_cse ) begin
      mut_3_10_63_0 <= mut_3_9_63_0;
      mut_2_10_63_0 <= mut_2_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1233_cse ) begin
      mut_5_10_63_0 <= mut_5_9_63_0;
      mut_4_10_63_0 <= mut_4_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1235_cse ) begin
      mut_7_10_63_0 <= mut_7_9_63_0;
      mut_6_10_63_0 <= mut_6_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1237_cse ) begin
      mut_9_10_63_0 <= mut_9_9_63_0;
      mut_8_10_63_0 <= mut_8_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1239_cse ) begin
      mut_11_10_63_0 <= mut_11_9_63_0;
      mut_10_10_63_0 <= mut_10_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1241_cse ) begin
      mut_13_10_63_0 <= mut_13_9_63_0;
      mut_12_10_63_0 <= mut_12_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1243_cse ) begin
      mut_15_10_63_0 <= mut_15_9_63_0;
      mut_14_10_63_0 <= mut_14_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1245_cse ) begin
      mut_17_10_63_0 <= mut_17_9_63_0;
      mut_16_10_63_0 <= mut_16_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1247_cse ) begin
      mut_19_10_63_0 <= mut_19_9_63_0;
      mut_18_10_63_0 <= mut_18_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1249_cse ) begin
      mut_21_10_63_0 <= mut_21_9_63_0;
      mut_20_10_63_0 <= mut_20_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1251_cse ) begin
      mut_23_10_63_0 <= mut_23_9_63_0;
      mut_22_10_63_0 <= mut_22_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1253_cse ) begin
      mut_1_10_63_0 <= mut_1_9_63_0;
      mut_10_63_0 <= mut_9_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_10_3_2 <= 2'b00;
      rem_12cyc_st_10_1_0 <= 2'b00;
    end
    else if ( and_1255_cse ) begin
      rem_12cyc_st_10_3_2 <= rem_12cyc_st_9_3_2;
      rem_12cyc_st_10_1_0 <= rem_12cyc_st_9_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1257_cse ) begin
      mut_3_9_63_0 <= mut_3_8_63_0;
      mut_2_9_63_0 <= mut_2_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1259_cse ) begin
      mut_5_9_63_0 <= mut_5_8_63_0;
      mut_4_9_63_0 <= mut_4_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1261_cse ) begin
      mut_7_9_63_0 <= mut_7_8_63_0;
      mut_6_9_63_0 <= mut_6_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1263_cse ) begin
      mut_9_9_63_0 <= mut_9_8_63_0;
      mut_8_9_63_0 <= mut_8_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1265_cse ) begin
      mut_11_9_63_0 <= mut_11_8_63_0;
      mut_10_9_63_0 <= mut_10_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1267_cse ) begin
      mut_13_9_63_0 <= mut_13_8_63_0;
      mut_12_9_63_0 <= mut_12_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1269_cse ) begin
      mut_15_9_63_0 <= mut_15_8_63_0;
      mut_14_9_63_0 <= mut_14_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1271_cse ) begin
      mut_17_9_63_0 <= mut_17_8_63_0;
      mut_16_9_63_0 <= mut_16_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1273_cse ) begin
      mut_19_9_63_0 <= mut_19_8_63_0;
      mut_18_9_63_0 <= mut_18_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1275_cse ) begin
      mut_21_9_63_0 <= mut_21_8_63_0;
      mut_20_9_63_0 <= mut_20_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1277_cse ) begin
      mut_23_9_63_0 <= mut_23_8_63_0;
      mut_22_9_63_0 <= mut_22_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1279_cse ) begin
      mut_1_9_63_0 <= mut_1_8_63_0;
      mut_9_63_0 <= mut_8_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_9_3_2 <= 2'b00;
      rem_12cyc_st_9_1_0 <= 2'b00;
    end
    else if ( and_1281_cse ) begin
      rem_12cyc_st_9_3_2 <= rem_12cyc_st_8_3_2;
      rem_12cyc_st_9_1_0 <= rem_12cyc_st_8_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1283_cse ) begin
      mut_3_8_63_0 <= mut_3_7_63_0;
      mut_2_8_63_0 <= mut_2_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1285_cse ) begin
      mut_5_8_63_0 <= mut_5_7_63_0;
      mut_4_8_63_0 <= mut_4_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1287_cse ) begin
      mut_7_8_63_0 <= mut_7_7_63_0;
      mut_6_8_63_0 <= mut_6_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1289_cse ) begin
      mut_9_8_63_0 <= mut_9_7_63_0;
      mut_8_8_63_0 <= mut_8_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1291_cse ) begin
      mut_11_8_63_0 <= mut_11_7_63_0;
      mut_10_8_63_0 <= mut_10_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1293_cse ) begin
      mut_13_8_63_0 <= mut_13_7_63_0;
      mut_12_8_63_0 <= mut_12_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1295_cse ) begin
      mut_15_8_63_0 <= mut_15_7_63_0;
      mut_14_8_63_0 <= mut_14_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1297_cse ) begin
      mut_17_8_63_0 <= mut_17_7_63_0;
      mut_16_8_63_0 <= mut_16_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1299_cse ) begin
      mut_19_8_63_0 <= mut_19_7_63_0;
      mut_18_8_63_0 <= mut_18_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1301_cse ) begin
      mut_21_8_63_0 <= mut_21_7_63_0;
      mut_20_8_63_0 <= mut_20_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1303_cse ) begin
      mut_23_8_63_0 <= mut_23_7_63_0;
      mut_22_8_63_0 <= mut_22_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1305_cse ) begin
      mut_1_8_63_0 <= mut_1_7_63_0;
      mut_8_63_0 <= mut_7_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_8_3_2 <= 2'b00;
      rem_12cyc_st_8_1_0 <= 2'b00;
    end
    else if ( and_1307_cse ) begin
      rem_12cyc_st_8_3_2 <= rem_12cyc_st_7_3_2;
      rem_12cyc_st_8_1_0 <= rem_12cyc_st_7_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1309_cse ) begin
      mut_3_7_63_0 <= mut_3_6_63_0;
      mut_2_7_63_0 <= mut_2_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1311_cse ) begin
      mut_5_7_63_0 <= mut_5_6_63_0;
      mut_4_7_63_0 <= mut_4_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1313_cse ) begin
      mut_7_7_63_0 <= mut_7_6_63_0;
      mut_6_7_63_0 <= mut_6_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1315_cse ) begin
      mut_9_7_63_0 <= mut_9_6_63_0;
      mut_8_7_63_0 <= mut_8_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1317_cse ) begin
      mut_11_7_63_0 <= mut_11_6_63_0;
      mut_10_7_63_0 <= mut_10_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1319_cse ) begin
      mut_13_7_63_0 <= mut_13_6_63_0;
      mut_12_7_63_0 <= mut_12_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1321_cse ) begin
      mut_15_7_63_0 <= mut_15_6_63_0;
      mut_14_7_63_0 <= mut_14_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1323_cse ) begin
      mut_17_7_63_0 <= mut_17_6_63_0;
      mut_16_7_63_0 <= mut_16_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1325_cse ) begin
      mut_19_7_63_0 <= mut_19_6_63_0;
      mut_18_7_63_0 <= mut_18_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1327_cse ) begin
      mut_21_7_63_0 <= mut_21_6_63_0;
      mut_20_7_63_0 <= mut_20_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1329_cse ) begin
      mut_23_7_63_0 <= mut_23_6_63_0;
      mut_22_7_63_0 <= mut_22_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1331_cse ) begin
      mut_1_7_63_0 <= mut_1_6_63_0;
      mut_7_63_0 <= mut_6_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_7_3_2 <= 2'b00;
      rem_12cyc_st_7_1_0 <= 2'b00;
    end
    else if ( and_1333_cse ) begin
      rem_12cyc_st_7_3_2 <= rem_12cyc_st_6_3_2;
      rem_12cyc_st_7_1_0 <= rem_12cyc_st_6_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1335_cse ) begin
      mut_3_6_63_0 <= mut_3_5_63_0;
      mut_2_6_63_0 <= mut_2_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1337_cse ) begin
      mut_5_6_63_0 <= mut_5_5_63_0;
      mut_4_6_63_0 <= mut_4_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1339_cse ) begin
      mut_7_6_63_0 <= mut_7_5_63_0;
      mut_6_6_63_0 <= mut_6_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1341_cse ) begin
      mut_9_6_63_0 <= mut_9_5_63_0;
      mut_8_6_63_0 <= mut_8_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1343_cse ) begin
      mut_11_6_63_0 <= mut_11_5_63_0;
      mut_10_6_63_0 <= mut_10_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1345_cse ) begin
      mut_13_6_63_0 <= mut_13_5_63_0;
      mut_12_6_63_0 <= mut_12_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1347_cse ) begin
      mut_15_6_63_0 <= mut_15_5_63_0;
      mut_14_6_63_0 <= mut_14_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1349_cse ) begin
      mut_17_6_63_0 <= mut_17_5_63_0;
      mut_16_6_63_0 <= mut_16_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1351_cse ) begin
      mut_19_6_63_0 <= mut_19_5_63_0;
      mut_18_6_63_0 <= mut_18_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1353_cse ) begin
      mut_21_6_63_0 <= mut_21_5_63_0;
      mut_20_6_63_0 <= mut_20_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1355_cse ) begin
      mut_23_6_63_0 <= mut_23_5_63_0;
      mut_22_6_63_0 <= mut_22_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1357_cse ) begin
      mut_1_6_63_0 <= mut_1_5_63_0;
      mut_6_63_0 <= mut_5_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1359_cse ) begin
      m_buf_sva_6 <= m_buf_sva_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_6_3_2 <= 2'b00;
      rem_12cyc_st_6_1_0 <= 2'b00;
    end
    else if ( and_1359_cse ) begin
      rem_12cyc_st_6_3_2 <= rem_12cyc_st_5_3_2;
      rem_12cyc_st_6_1_0 <= rem_12cyc_st_5_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1361_cse ) begin
      mut_3_5_63_0 <= mut_3_4_63_0;
      mut_2_5_63_0 <= mut_2_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1363_cse ) begin
      mut_5_5_63_0 <= mut_5_4_63_0;
      mut_4_5_63_0 <= mut_4_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1365_cse ) begin
      mut_7_5_63_0 <= mut_7_4_63_0;
      mut_6_5_63_0 <= mut_6_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1367_cse ) begin
      mut_9_5_63_0 <= mut_9_4_63_0;
      mut_8_5_63_0 <= mut_8_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1369_cse ) begin
      mut_11_5_63_0 <= mut_11_4_63_0;
      mut_10_5_63_0 <= mut_10_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1371_cse ) begin
      mut_13_5_63_0 <= mut_13_4_63_0;
      mut_12_5_63_0 <= mut_12_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1373_cse ) begin
      mut_15_5_63_0 <= mut_15_4_63_0;
      mut_14_5_63_0 <= mut_14_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1375_cse ) begin
      mut_17_5_63_0 <= mut_17_4_63_0;
      mut_16_5_63_0 <= mut_16_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1377_cse ) begin
      mut_19_5_63_0 <= mut_19_4_63_0;
      mut_18_5_63_0 <= mut_18_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1379_cse ) begin
      mut_21_5_63_0 <= mut_21_4_63_0;
      mut_20_5_63_0 <= mut_20_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1381_cse ) begin
      mut_23_5_63_0 <= mut_23_4_63_0;
      mut_22_5_63_0 <= mut_22_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1383_cse ) begin
      mut_1_5_63_0 <= mut_1_4_63_0;
      mut_5_63_0 <= mut_4_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1385_cse ) begin
      m_buf_sva_5 <= m_buf_sva_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_5_3_2 <= 2'b00;
      rem_12cyc_st_5_1_0 <= 2'b00;
    end
    else if ( and_1385_cse ) begin
      rem_12cyc_st_5_3_2 <= rem_12cyc_st_4_3_2;
      rem_12cyc_st_5_1_0 <= rem_12cyc_st_4_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1387_cse ) begin
      mut_3_4_63_0 <= mut_3_3_63_0;
      mut_2_4_63_0 <= mut_2_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1389_cse ) begin
      mut_5_4_63_0 <= mut_5_3_63_0;
      mut_4_4_63_0 <= mut_4_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1391_cse ) begin
      mut_7_4_63_0 <= mut_7_3_63_0;
      mut_6_4_63_0 <= mut_6_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1393_cse ) begin
      mut_9_4_63_0 <= mut_9_3_63_0;
      mut_8_4_63_0 <= mut_8_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1395_cse ) begin
      mut_11_4_63_0 <= mut_11_3_63_0;
      mut_10_4_63_0 <= mut_10_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1397_cse ) begin
      mut_13_4_63_0 <= mut_13_3_63_0;
      mut_12_4_63_0 <= mut_12_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1399_cse ) begin
      mut_15_4_63_0 <= mut_15_3_63_0;
      mut_14_4_63_0 <= mut_14_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1401_cse ) begin
      mut_17_4_63_0 <= mut_17_3_63_0;
      mut_16_4_63_0 <= mut_16_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1403_cse ) begin
      mut_19_4_63_0 <= mut_19_3_63_0;
      mut_18_4_63_0 <= mut_18_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1405_cse ) begin
      mut_21_4_63_0 <= mut_21_3_63_0;
      mut_20_4_63_0 <= mut_20_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1407_cse ) begin
      mut_23_4_63_0 <= mut_23_3_63_0;
      mut_22_4_63_0 <= mut_22_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1409_cse ) begin
      mut_1_4_63_0 <= mut_1_3_63_0;
      mut_4_63_0 <= mut_3_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1411_cse ) begin
      m_buf_sva_4 <= m_buf_sva_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_4_3_2 <= 2'b00;
      rem_12cyc_st_4_1_0 <= 2'b00;
    end
    else if ( and_1411_cse ) begin
      rem_12cyc_st_4_3_2 <= rem_12cyc_st_3_3_2;
      rem_12cyc_st_4_1_0 <= rem_12cyc_st_3_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1413_cse ) begin
      mut_3_3_63_0 <= mut_3_2_63_0;
      mut_2_3_63_0 <= mut_2_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1415_cse ) begin
      mut_5_3_63_0 <= mut_5_2_63_0;
      mut_4_3_63_0 <= mut_4_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1417_cse ) begin
      mut_7_3_63_0 <= mut_7_2_63_0;
      mut_6_3_63_0 <= mut_6_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1419_cse ) begin
      mut_9_3_63_0 <= mut_9_2_63_0;
      mut_8_3_63_0 <= mut_8_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1421_cse ) begin
      mut_11_3_63_0 <= mut_11_2_63_0;
      mut_10_3_63_0 <= mut_10_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1423_cse ) begin
      mut_13_3_63_0 <= mut_13_2_63_0;
      mut_12_3_63_0 <= mut_12_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1425_cse ) begin
      mut_15_3_63_0 <= mut_15_2_63_0;
      mut_14_3_63_0 <= mut_14_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1427_cse ) begin
      mut_17_3_63_0 <= mut_17_2_63_0;
      mut_16_3_63_0 <= mut_16_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1429_cse ) begin
      mut_19_3_63_0 <= mut_19_2_63_0;
      mut_18_3_63_0 <= mut_18_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1431_cse ) begin
      mut_21_3_63_0 <= mut_21_2_63_0;
      mut_20_3_63_0 <= mut_20_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1433_cse ) begin
      mut_23_3_63_0 <= mut_23_2_63_0;
      mut_22_3_63_0 <= mut_22_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1435_cse ) begin
      mut_1_3_63_0 <= mut_1_2_63_0;
      mut_3_63_0 <= mut_2_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1437_cse ) begin
      m_buf_sva_3 <= m_buf_sva_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_3_3_2 <= 2'b00;
      rem_12cyc_st_3_1_0 <= 2'b00;
    end
    else if ( and_1437_cse ) begin
      rem_12cyc_st_3_3_2 <= rem_12cyc_st_2_3_2;
      rem_12cyc_st_3_1_0 <= rem_12cyc_st_2_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1439_cse ) begin
      mut_3_2_63_0 <= rem_13_cmp_1_b_63_0;
      mut_2_2_63_0 <= rem_13_cmp_1_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1441_cse ) begin
      mut_5_2_63_0 <= rem_13_cmp_2_b_63_0;
      mut_4_2_63_0 <= rem_13_cmp_2_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1443_cse ) begin
      mut_7_2_63_0 <= rem_13_cmp_3_b_63_0;
      mut_6_2_63_0 <= rem_13_cmp_3_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1445_cse ) begin
      mut_9_2_63_0 <= rem_13_cmp_4_b_63_0;
      mut_8_2_63_0 <= rem_13_cmp_4_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1447_cse ) begin
      mut_11_2_63_0 <= rem_13_cmp_5_b_63_0;
      mut_10_2_63_0 <= rem_13_cmp_5_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1449_cse ) begin
      mut_13_2_63_0 <= rem_13_cmp_6_b_63_0;
      mut_12_2_63_0 <= rem_13_cmp_6_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1451_cse ) begin
      mut_15_2_63_0 <= rem_13_cmp_7_b_63_0;
      mut_14_2_63_0 <= rem_13_cmp_7_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1453_cse ) begin
      mut_17_2_63_0 <= rem_13_cmp_8_b_63_0;
      mut_16_2_63_0 <= rem_13_cmp_8_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1455_cse ) begin
      mut_19_2_63_0 <= rem_13_cmp_9_b_63_0;
      mut_18_2_63_0 <= rem_13_cmp_9_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1457_cse ) begin
      mut_21_2_63_0 <= rem_13_cmp_10_b_63_0;
      mut_20_2_63_0 <= rem_13_cmp_10_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1459_cse ) begin
      mut_23_2_63_0 <= rem_13_cmp_11_b_63_0;
      mut_22_2_63_0 <= rem_13_cmp_11_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1461_cse ) begin
      mut_1_2_63_0 <= rem_13_cmp_b_63_0;
      mut_2_63_0 <= rem_13_cmp_a_63_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1463_cse ) begin
      m_buf_sva_2 <= m_buf_sva_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_st_2_3_2 <= 2'b00;
      rem_12cyc_st_2_1_0 <= 2'b00;
    end
    else if ( and_1463_cse ) begin
      rem_12cyc_st_2_3_2 <= rem_12cyc_3_2;
      rem_12cyc_st_2_1_0 <= rem_12cyc_1_0;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( and_1197_cse ) begin
      m_buf_sva_1 <= m_rsci_idat;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_12cyc_3_2 <= 2'b00;
      rem_12cyc_1_0 <= 2'b00;
    end
    else if ( and_1197_cse ) begin
      rem_12cyc_3_2 <= acc_tmp;
      rem_12cyc_1_0 <= acc_1_tmp[1:0];
    end
  end
  assign nl_qelse_acc_nl = result_sva_duc_mx0 + m_buf_sva_12;
  assign qelse_acc_nl = nl_qelse_acc_nl[63:0];
  assign mux_10_nl = MUX_s_1_2_2((rem_13_cmp_1_z[63]), (rem_13_cmp_3_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_9_nl = MUX_s_1_2_2((rem_13_cmp_2_z[63]), (rem_13_cmp_4_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_11_nl = MUX_s_1_2_2(mux_10_nl, mux_9_nl, rem_12cyc_st_12_1_0[0]);
  assign mux_7_nl = MUX_s_1_2_2((rem_13_cmp_9_z[63]), (rem_13_cmp_11_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_6_nl = MUX_s_1_2_2((rem_13_cmp_10_z[63]), (rem_13_cmp_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_8_nl = MUX_s_1_2_2(mux_7_nl, mux_6_nl, rem_12cyc_st_12_1_0[0]);
  assign mux_12_nl = MUX_s_1_2_2(mux_11_nl, mux_8_nl, rem_12cyc_st_12_3_2[1]);
  assign mux_3_nl = MUX_s_1_2_2((rem_13_cmp_5_z[63]), (rem_13_cmp_7_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_2_nl = MUX_s_1_2_2((rem_13_cmp_6_z[63]), (rem_13_cmp_8_z[63]), rem_12cyc_st_12_1_0[1]);
  assign mux_4_nl = MUX_s_1_2_2(mux_3_nl, mux_2_nl, rem_12cyc_st_12_1_0[0]);
  assign mux_5_nl = MUX_s_1_2_2(mux_4_nl, (result_sva_duc[63]), rem_12cyc_st_12_3_2[1]);
  assign mux_13_nl = MUX_s_1_2_2(mux_12_nl, mux_5_nl, rem_12cyc_st_12_3_2[0]);

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
//  Design Unit:    modulo_dev
// ------------------------------------------------------------------


module modulo_dev (
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
  modulo_dev_core modulo_dev_core_inst (
      .base_rsc_dat(base_rsc_dat),
      .m_rsc_dat(m_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_start_rsc_dat(ccs_ccore_start_rsc_dat),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_srst(ccs_ccore_srst),
      .ccs_ccore_en(ccs_ccore_en)
    );
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
//  Generated date: Thu Aug  5 00:25:09 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_7_64_128_128_64_1_gen
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_7_64_128_128_64_1_gen
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_7_64_128_128_64_1_gen
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_7_64_128_128_64_1_gen
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_7_64_128_128_64_1_gen
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_7_64_128_128_64_1_gen
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_7_64_128_128_64_1_gen (
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
//  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_7_64_128_128_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_7_64_128_128_64_1_gen (
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
//  Design Unit:    inPlaceNTT_DIT_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIT_core_core_fsm (
  clk, rst, fsm_output, STAGE_LOOP_C_3_tr0, modExp_dev_while_C_14_tr0, COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_dev_1_while_C_14_tr0, COMP_LOOP_C_32_tr0, COMP_LOOP_2_modExp_dev_1_while_C_14_tr0,
      COMP_LOOP_C_64_tr0, COMP_LOOP_3_modExp_dev_1_while_C_14_tr0, COMP_LOOP_C_96_tr0,
      COMP_LOOP_4_modExp_dev_1_while_C_14_tr0, COMP_LOOP_C_128_tr0, COMP_LOOP_5_modExp_dev_1_while_C_14_tr0,
      COMP_LOOP_C_160_tr0, COMP_LOOP_6_modExp_dev_1_while_C_14_tr0, COMP_LOOP_C_192_tr0,
      COMP_LOOP_7_modExp_dev_1_while_C_14_tr0, COMP_LOOP_C_224_tr0, COMP_LOOP_8_modExp_dev_1_while_C_14_tr0,
      COMP_LOOP_C_256_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_4_tr0
);
  input clk;
  input rst;
  output [8:0] fsm_output;
  reg [8:0] fsm_output;
  input STAGE_LOOP_C_3_tr0;
  input modExp_dev_while_C_14_tr0;
  input COMP_LOOP_C_1_tr0;
  input COMP_LOOP_1_modExp_dev_1_while_C_14_tr0;
  input COMP_LOOP_C_32_tr0;
  input COMP_LOOP_2_modExp_dev_1_while_C_14_tr0;
  input COMP_LOOP_C_64_tr0;
  input COMP_LOOP_3_modExp_dev_1_while_C_14_tr0;
  input COMP_LOOP_C_96_tr0;
  input COMP_LOOP_4_modExp_dev_1_while_C_14_tr0;
  input COMP_LOOP_C_128_tr0;
  input COMP_LOOP_5_modExp_dev_1_while_C_14_tr0;
  input COMP_LOOP_C_160_tr0;
  input COMP_LOOP_6_modExp_dev_1_while_C_14_tr0;
  input COMP_LOOP_C_192_tr0;
  input COMP_LOOP_7_modExp_dev_1_while_C_14_tr0;
  input COMP_LOOP_C_224_tr0;
  input COMP_LOOP_8_modExp_dev_1_while_C_14_tr0;
  input COMP_LOOP_C_256_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_4_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  parameter
    main_C_0 = 9'd0,
    STAGE_LOOP_C_0 = 9'd1,
    STAGE_LOOP_C_1 = 9'd2,
    STAGE_LOOP_C_2 = 9'd3,
    STAGE_LOOP_C_3 = 9'd4,
    modExp_dev_while_C_0 = 9'd5,
    modExp_dev_while_C_1 = 9'd6,
    modExp_dev_while_C_2 = 9'd7,
    modExp_dev_while_C_3 = 9'd8,
    modExp_dev_while_C_4 = 9'd9,
    modExp_dev_while_C_5 = 9'd10,
    modExp_dev_while_C_6 = 9'd11,
    modExp_dev_while_C_7 = 9'd12,
    modExp_dev_while_C_8 = 9'd13,
    modExp_dev_while_C_9 = 9'd14,
    modExp_dev_while_C_10 = 9'd15,
    modExp_dev_while_C_11 = 9'd16,
    modExp_dev_while_C_12 = 9'd17,
    modExp_dev_while_C_13 = 9'd18,
    modExp_dev_while_C_14 = 9'd19,
    COMP_LOOP_C_0 = 9'd20,
    COMP_LOOP_C_1 = 9'd21,
    COMP_LOOP_1_modExp_dev_1_while_C_0 = 9'd22,
    COMP_LOOP_1_modExp_dev_1_while_C_1 = 9'd23,
    COMP_LOOP_1_modExp_dev_1_while_C_2 = 9'd24,
    COMP_LOOP_1_modExp_dev_1_while_C_3 = 9'd25,
    COMP_LOOP_1_modExp_dev_1_while_C_4 = 9'd26,
    COMP_LOOP_1_modExp_dev_1_while_C_5 = 9'd27,
    COMP_LOOP_1_modExp_dev_1_while_C_6 = 9'd28,
    COMP_LOOP_1_modExp_dev_1_while_C_7 = 9'd29,
    COMP_LOOP_1_modExp_dev_1_while_C_8 = 9'd30,
    COMP_LOOP_1_modExp_dev_1_while_C_9 = 9'd31,
    COMP_LOOP_1_modExp_dev_1_while_C_10 = 9'd32,
    COMP_LOOP_1_modExp_dev_1_while_C_11 = 9'd33,
    COMP_LOOP_1_modExp_dev_1_while_C_12 = 9'd34,
    COMP_LOOP_1_modExp_dev_1_while_C_13 = 9'd35,
    COMP_LOOP_1_modExp_dev_1_while_C_14 = 9'd36,
    COMP_LOOP_C_2 = 9'd37,
    COMP_LOOP_C_3 = 9'd38,
    COMP_LOOP_C_4 = 9'd39,
    COMP_LOOP_C_5 = 9'd40,
    COMP_LOOP_C_6 = 9'd41,
    COMP_LOOP_C_7 = 9'd42,
    COMP_LOOP_C_8 = 9'd43,
    COMP_LOOP_C_9 = 9'd44,
    COMP_LOOP_C_10 = 9'd45,
    COMP_LOOP_C_11 = 9'd46,
    COMP_LOOP_C_12 = 9'd47,
    COMP_LOOP_C_13 = 9'd48,
    COMP_LOOP_C_14 = 9'd49,
    COMP_LOOP_C_15 = 9'd50,
    COMP_LOOP_C_16 = 9'd51,
    COMP_LOOP_C_17 = 9'd52,
    COMP_LOOP_C_18 = 9'd53,
    COMP_LOOP_C_19 = 9'd54,
    COMP_LOOP_C_20 = 9'd55,
    COMP_LOOP_C_21 = 9'd56,
    COMP_LOOP_C_22 = 9'd57,
    COMP_LOOP_C_23 = 9'd58,
    COMP_LOOP_C_24 = 9'd59,
    COMP_LOOP_C_25 = 9'd60,
    COMP_LOOP_C_26 = 9'd61,
    COMP_LOOP_C_27 = 9'd62,
    COMP_LOOP_C_28 = 9'd63,
    COMP_LOOP_C_29 = 9'd64,
    COMP_LOOP_C_30 = 9'd65,
    COMP_LOOP_C_31 = 9'd66,
    COMP_LOOP_C_32 = 9'd67,
    COMP_LOOP_C_33 = 9'd68,
    COMP_LOOP_2_modExp_dev_1_while_C_0 = 9'd69,
    COMP_LOOP_2_modExp_dev_1_while_C_1 = 9'd70,
    COMP_LOOP_2_modExp_dev_1_while_C_2 = 9'd71,
    COMP_LOOP_2_modExp_dev_1_while_C_3 = 9'd72,
    COMP_LOOP_2_modExp_dev_1_while_C_4 = 9'd73,
    COMP_LOOP_2_modExp_dev_1_while_C_5 = 9'd74,
    COMP_LOOP_2_modExp_dev_1_while_C_6 = 9'd75,
    COMP_LOOP_2_modExp_dev_1_while_C_7 = 9'd76,
    COMP_LOOP_2_modExp_dev_1_while_C_8 = 9'd77,
    COMP_LOOP_2_modExp_dev_1_while_C_9 = 9'd78,
    COMP_LOOP_2_modExp_dev_1_while_C_10 = 9'd79,
    COMP_LOOP_2_modExp_dev_1_while_C_11 = 9'd80,
    COMP_LOOP_2_modExp_dev_1_while_C_12 = 9'd81,
    COMP_LOOP_2_modExp_dev_1_while_C_13 = 9'd82,
    COMP_LOOP_2_modExp_dev_1_while_C_14 = 9'd83,
    COMP_LOOP_C_34 = 9'd84,
    COMP_LOOP_C_35 = 9'd85,
    COMP_LOOP_C_36 = 9'd86,
    COMP_LOOP_C_37 = 9'd87,
    COMP_LOOP_C_38 = 9'd88,
    COMP_LOOP_C_39 = 9'd89,
    COMP_LOOP_C_40 = 9'd90,
    COMP_LOOP_C_41 = 9'd91,
    COMP_LOOP_C_42 = 9'd92,
    COMP_LOOP_C_43 = 9'd93,
    COMP_LOOP_C_44 = 9'd94,
    COMP_LOOP_C_45 = 9'd95,
    COMP_LOOP_C_46 = 9'd96,
    COMP_LOOP_C_47 = 9'd97,
    COMP_LOOP_C_48 = 9'd98,
    COMP_LOOP_C_49 = 9'd99,
    COMP_LOOP_C_50 = 9'd100,
    COMP_LOOP_C_51 = 9'd101,
    COMP_LOOP_C_52 = 9'd102,
    COMP_LOOP_C_53 = 9'd103,
    COMP_LOOP_C_54 = 9'd104,
    COMP_LOOP_C_55 = 9'd105,
    COMP_LOOP_C_56 = 9'd106,
    COMP_LOOP_C_57 = 9'd107,
    COMP_LOOP_C_58 = 9'd108,
    COMP_LOOP_C_59 = 9'd109,
    COMP_LOOP_C_60 = 9'd110,
    COMP_LOOP_C_61 = 9'd111,
    COMP_LOOP_C_62 = 9'd112,
    COMP_LOOP_C_63 = 9'd113,
    COMP_LOOP_C_64 = 9'd114,
    COMP_LOOP_C_65 = 9'd115,
    COMP_LOOP_3_modExp_dev_1_while_C_0 = 9'd116,
    COMP_LOOP_3_modExp_dev_1_while_C_1 = 9'd117,
    COMP_LOOP_3_modExp_dev_1_while_C_2 = 9'd118,
    COMP_LOOP_3_modExp_dev_1_while_C_3 = 9'd119,
    COMP_LOOP_3_modExp_dev_1_while_C_4 = 9'd120,
    COMP_LOOP_3_modExp_dev_1_while_C_5 = 9'd121,
    COMP_LOOP_3_modExp_dev_1_while_C_6 = 9'd122,
    COMP_LOOP_3_modExp_dev_1_while_C_7 = 9'd123,
    COMP_LOOP_3_modExp_dev_1_while_C_8 = 9'd124,
    COMP_LOOP_3_modExp_dev_1_while_C_9 = 9'd125,
    COMP_LOOP_3_modExp_dev_1_while_C_10 = 9'd126,
    COMP_LOOP_3_modExp_dev_1_while_C_11 = 9'd127,
    COMP_LOOP_3_modExp_dev_1_while_C_12 = 9'd128,
    COMP_LOOP_3_modExp_dev_1_while_C_13 = 9'd129,
    COMP_LOOP_3_modExp_dev_1_while_C_14 = 9'd130,
    COMP_LOOP_C_66 = 9'd131,
    COMP_LOOP_C_67 = 9'd132,
    COMP_LOOP_C_68 = 9'd133,
    COMP_LOOP_C_69 = 9'd134,
    COMP_LOOP_C_70 = 9'd135,
    COMP_LOOP_C_71 = 9'd136,
    COMP_LOOP_C_72 = 9'd137,
    COMP_LOOP_C_73 = 9'd138,
    COMP_LOOP_C_74 = 9'd139,
    COMP_LOOP_C_75 = 9'd140,
    COMP_LOOP_C_76 = 9'd141,
    COMP_LOOP_C_77 = 9'd142,
    COMP_LOOP_C_78 = 9'd143,
    COMP_LOOP_C_79 = 9'd144,
    COMP_LOOP_C_80 = 9'd145,
    COMP_LOOP_C_81 = 9'd146,
    COMP_LOOP_C_82 = 9'd147,
    COMP_LOOP_C_83 = 9'd148,
    COMP_LOOP_C_84 = 9'd149,
    COMP_LOOP_C_85 = 9'd150,
    COMP_LOOP_C_86 = 9'd151,
    COMP_LOOP_C_87 = 9'd152,
    COMP_LOOP_C_88 = 9'd153,
    COMP_LOOP_C_89 = 9'd154,
    COMP_LOOP_C_90 = 9'd155,
    COMP_LOOP_C_91 = 9'd156,
    COMP_LOOP_C_92 = 9'd157,
    COMP_LOOP_C_93 = 9'd158,
    COMP_LOOP_C_94 = 9'd159,
    COMP_LOOP_C_95 = 9'd160,
    COMP_LOOP_C_96 = 9'd161,
    COMP_LOOP_C_97 = 9'd162,
    COMP_LOOP_4_modExp_dev_1_while_C_0 = 9'd163,
    COMP_LOOP_4_modExp_dev_1_while_C_1 = 9'd164,
    COMP_LOOP_4_modExp_dev_1_while_C_2 = 9'd165,
    COMP_LOOP_4_modExp_dev_1_while_C_3 = 9'd166,
    COMP_LOOP_4_modExp_dev_1_while_C_4 = 9'd167,
    COMP_LOOP_4_modExp_dev_1_while_C_5 = 9'd168,
    COMP_LOOP_4_modExp_dev_1_while_C_6 = 9'd169,
    COMP_LOOP_4_modExp_dev_1_while_C_7 = 9'd170,
    COMP_LOOP_4_modExp_dev_1_while_C_8 = 9'd171,
    COMP_LOOP_4_modExp_dev_1_while_C_9 = 9'd172,
    COMP_LOOP_4_modExp_dev_1_while_C_10 = 9'd173,
    COMP_LOOP_4_modExp_dev_1_while_C_11 = 9'd174,
    COMP_LOOP_4_modExp_dev_1_while_C_12 = 9'd175,
    COMP_LOOP_4_modExp_dev_1_while_C_13 = 9'd176,
    COMP_LOOP_4_modExp_dev_1_while_C_14 = 9'd177,
    COMP_LOOP_C_98 = 9'd178,
    COMP_LOOP_C_99 = 9'd179,
    COMP_LOOP_C_100 = 9'd180,
    COMP_LOOP_C_101 = 9'd181,
    COMP_LOOP_C_102 = 9'd182,
    COMP_LOOP_C_103 = 9'd183,
    COMP_LOOP_C_104 = 9'd184,
    COMP_LOOP_C_105 = 9'd185,
    COMP_LOOP_C_106 = 9'd186,
    COMP_LOOP_C_107 = 9'd187,
    COMP_LOOP_C_108 = 9'd188,
    COMP_LOOP_C_109 = 9'd189,
    COMP_LOOP_C_110 = 9'd190,
    COMP_LOOP_C_111 = 9'd191,
    COMP_LOOP_C_112 = 9'd192,
    COMP_LOOP_C_113 = 9'd193,
    COMP_LOOP_C_114 = 9'd194,
    COMP_LOOP_C_115 = 9'd195,
    COMP_LOOP_C_116 = 9'd196,
    COMP_LOOP_C_117 = 9'd197,
    COMP_LOOP_C_118 = 9'd198,
    COMP_LOOP_C_119 = 9'd199,
    COMP_LOOP_C_120 = 9'd200,
    COMP_LOOP_C_121 = 9'd201,
    COMP_LOOP_C_122 = 9'd202,
    COMP_LOOP_C_123 = 9'd203,
    COMP_LOOP_C_124 = 9'd204,
    COMP_LOOP_C_125 = 9'd205,
    COMP_LOOP_C_126 = 9'd206,
    COMP_LOOP_C_127 = 9'd207,
    COMP_LOOP_C_128 = 9'd208,
    COMP_LOOP_C_129 = 9'd209,
    COMP_LOOP_5_modExp_dev_1_while_C_0 = 9'd210,
    COMP_LOOP_5_modExp_dev_1_while_C_1 = 9'd211,
    COMP_LOOP_5_modExp_dev_1_while_C_2 = 9'd212,
    COMP_LOOP_5_modExp_dev_1_while_C_3 = 9'd213,
    COMP_LOOP_5_modExp_dev_1_while_C_4 = 9'd214,
    COMP_LOOP_5_modExp_dev_1_while_C_5 = 9'd215,
    COMP_LOOP_5_modExp_dev_1_while_C_6 = 9'd216,
    COMP_LOOP_5_modExp_dev_1_while_C_7 = 9'd217,
    COMP_LOOP_5_modExp_dev_1_while_C_8 = 9'd218,
    COMP_LOOP_5_modExp_dev_1_while_C_9 = 9'd219,
    COMP_LOOP_5_modExp_dev_1_while_C_10 = 9'd220,
    COMP_LOOP_5_modExp_dev_1_while_C_11 = 9'd221,
    COMP_LOOP_5_modExp_dev_1_while_C_12 = 9'd222,
    COMP_LOOP_5_modExp_dev_1_while_C_13 = 9'd223,
    COMP_LOOP_5_modExp_dev_1_while_C_14 = 9'd224,
    COMP_LOOP_C_130 = 9'd225,
    COMP_LOOP_C_131 = 9'd226,
    COMP_LOOP_C_132 = 9'd227,
    COMP_LOOP_C_133 = 9'd228,
    COMP_LOOP_C_134 = 9'd229,
    COMP_LOOP_C_135 = 9'd230,
    COMP_LOOP_C_136 = 9'd231,
    COMP_LOOP_C_137 = 9'd232,
    COMP_LOOP_C_138 = 9'd233,
    COMP_LOOP_C_139 = 9'd234,
    COMP_LOOP_C_140 = 9'd235,
    COMP_LOOP_C_141 = 9'd236,
    COMP_LOOP_C_142 = 9'd237,
    COMP_LOOP_C_143 = 9'd238,
    COMP_LOOP_C_144 = 9'd239,
    COMP_LOOP_C_145 = 9'd240,
    COMP_LOOP_C_146 = 9'd241,
    COMP_LOOP_C_147 = 9'd242,
    COMP_LOOP_C_148 = 9'd243,
    COMP_LOOP_C_149 = 9'd244,
    COMP_LOOP_C_150 = 9'd245,
    COMP_LOOP_C_151 = 9'd246,
    COMP_LOOP_C_152 = 9'd247,
    COMP_LOOP_C_153 = 9'd248,
    COMP_LOOP_C_154 = 9'd249,
    COMP_LOOP_C_155 = 9'd250,
    COMP_LOOP_C_156 = 9'd251,
    COMP_LOOP_C_157 = 9'd252,
    COMP_LOOP_C_158 = 9'd253,
    COMP_LOOP_C_159 = 9'd254,
    COMP_LOOP_C_160 = 9'd255,
    COMP_LOOP_C_161 = 9'd256,
    COMP_LOOP_6_modExp_dev_1_while_C_0 = 9'd257,
    COMP_LOOP_6_modExp_dev_1_while_C_1 = 9'd258,
    COMP_LOOP_6_modExp_dev_1_while_C_2 = 9'd259,
    COMP_LOOP_6_modExp_dev_1_while_C_3 = 9'd260,
    COMP_LOOP_6_modExp_dev_1_while_C_4 = 9'd261,
    COMP_LOOP_6_modExp_dev_1_while_C_5 = 9'd262,
    COMP_LOOP_6_modExp_dev_1_while_C_6 = 9'd263,
    COMP_LOOP_6_modExp_dev_1_while_C_7 = 9'd264,
    COMP_LOOP_6_modExp_dev_1_while_C_8 = 9'd265,
    COMP_LOOP_6_modExp_dev_1_while_C_9 = 9'd266,
    COMP_LOOP_6_modExp_dev_1_while_C_10 = 9'd267,
    COMP_LOOP_6_modExp_dev_1_while_C_11 = 9'd268,
    COMP_LOOP_6_modExp_dev_1_while_C_12 = 9'd269,
    COMP_LOOP_6_modExp_dev_1_while_C_13 = 9'd270,
    COMP_LOOP_6_modExp_dev_1_while_C_14 = 9'd271,
    COMP_LOOP_C_162 = 9'd272,
    COMP_LOOP_C_163 = 9'd273,
    COMP_LOOP_C_164 = 9'd274,
    COMP_LOOP_C_165 = 9'd275,
    COMP_LOOP_C_166 = 9'd276,
    COMP_LOOP_C_167 = 9'd277,
    COMP_LOOP_C_168 = 9'd278,
    COMP_LOOP_C_169 = 9'd279,
    COMP_LOOP_C_170 = 9'd280,
    COMP_LOOP_C_171 = 9'd281,
    COMP_LOOP_C_172 = 9'd282,
    COMP_LOOP_C_173 = 9'd283,
    COMP_LOOP_C_174 = 9'd284,
    COMP_LOOP_C_175 = 9'd285,
    COMP_LOOP_C_176 = 9'd286,
    COMP_LOOP_C_177 = 9'd287,
    COMP_LOOP_C_178 = 9'd288,
    COMP_LOOP_C_179 = 9'd289,
    COMP_LOOP_C_180 = 9'd290,
    COMP_LOOP_C_181 = 9'd291,
    COMP_LOOP_C_182 = 9'd292,
    COMP_LOOP_C_183 = 9'd293,
    COMP_LOOP_C_184 = 9'd294,
    COMP_LOOP_C_185 = 9'd295,
    COMP_LOOP_C_186 = 9'd296,
    COMP_LOOP_C_187 = 9'd297,
    COMP_LOOP_C_188 = 9'd298,
    COMP_LOOP_C_189 = 9'd299,
    COMP_LOOP_C_190 = 9'd300,
    COMP_LOOP_C_191 = 9'd301,
    COMP_LOOP_C_192 = 9'd302,
    COMP_LOOP_C_193 = 9'd303,
    COMP_LOOP_7_modExp_dev_1_while_C_0 = 9'd304,
    COMP_LOOP_7_modExp_dev_1_while_C_1 = 9'd305,
    COMP_LOOP_7_modExp_dev_1_while_C_2 = 9'd306,
    COMP_LOOP_7_modExp_dev_1_while_C_3 = 9'd307,
    COMP_LOOP_7_modExp_dev_1_while_C_4 = 9'd308,
    COMP_LOOP_7_modExp_dev_1_while_C_5 = 9'd309,
    COMP_LOOP_7_modExp_dev_1_while_C_6 = 9'd310,
    COMP_LOOP_7_modExp_dev_1_while_C_7 = 9'd311,
    COMP_LOOP_7_modExp_dev_1_while_C_8 = 9'd312,
    COMP_LOOP_7_modExp_dev_1_while_C_9 = 9'd313,
    COMP_LOOP_7_modExp_dev_1_while_C_10 = 9'd314,
    COMP_LOOP_7_modExp_dev_1_while_C_11 = 9'd315,
    COMP_LOOP_7_modExp_dev_1_while_C_12 = 9'd316,
    COMP_LOOP_7_modExp_dev_1_while_C_13 = 9'd317,
    COMP_LOOP_7_modExp_dev_1_while_C_14 = 9'd318,
    COMP_LOOP_C_194 = 9'd319,
    COMP_LOOP_C_195 = 9'd320,
    COMP_LOOP_C_196 = 9'd321,
    COMP_LOOP_C_197 = 9'd322,
    COMP_LOOP_C_198 = 9'd323,
    COMP_LOOP_C_199 = 9'd324,
    COMP_LOOP_C_200 = 9'd325,
    COMP_LOOP_C_201 = 9'd326,
    COMP_LOOP_C_202 = 9'd327,
    COMP_LOOP_C_203 = 9'd328,
    COMP_LOOP_C_204 = 9'd329,
    COMP_LOOP_C_205 = 9'd330,
    COMP_LOOP_C_206 = 9'd331,
    COMP_LOOP_C_207 = 9'd332,
    COMP_LOOP_C_208 = 9'd333,
    COMP_LOOP_C_209 = 9'd334,
    COMP_LOOP_C_210 = 9'd335,
    COMP_LOOP_C_211 = 9'd336,
    COMP_LOOP_C_212 = 9'd337,
    COMP_LOOP_C_213 = 9'd338,
    COMP_LOOP_C_214 = 9'd339,
    COMP_LOOP_C_215 = 9'd340,
    COMP_LOOP_C_216 = 9'd341,
    COMP_LOOP_C_217 = 9'd342,
    COMP_LOOP_C_218 = 9'd343,
    COMP_LOOP_C_219 = 9'd344,
    COMP_LOOP_C_220 = 9'd345,
    COMP_LOOP_C_221 = 9'd346,
    COMP_LOOP_C_222 = 9'd347,
    COMP_LOOP_C_223 = 9'd348,
    COMP_LOOP_C_224 = 9'd349,
    COMP_LOOP_C_225 = 9'd350,
    COMP_LOOP_8_modExp_dev_1_while_C_0 = 9'd351,
    COMP_LOOP_8_modExp_dev_1_while_C_1 = 9'd352,
    COMP_LOOP_8_modExp_dev_1_while_C_2 = 9'd353,
    COMP_LOOP_8_modExp_dev_1_while_C_3 = 9'd354,
    COMP_LOOP_8_modExp_dev_1_while_C_4 = 9'd355,
    COMP_LOOP_8_modExp_dev_1_while_C_5 = 9'd356,
    COMP_LOOP_8_modExp_dev_1_while_C_6 = 9'd357,
    COMP_LOOP_8_modExp_dev_1_while_C_7 = 9'd358,
    COMP_LOOP_8_modExp_dev_1_while_C_8 = 9'd359,
    COMP_LOOP_8_modExp_dev_1_while_C_9 = 9'd360,
    COMP_LOOP_8_modExp_dev_1_while_C_10 = 9'd361,
    COMP_LOOP_8_modExp_dev_1_while_C_11 = 9'd362,
    COMP_LOOP_8_modExp_dev_1_while_C_12 = 9'd363,
    COMP_LOOP_8_modExp_dev_1_while_C_13 = 9'd364,
    COMP_LOOP_8_modExp_dev_1_while_C_14 = 9'd365,
    COMP_LOOP_C_226 = 9'd366,
    COMP_LOOP_C_227 = 9'd367,
    COMP_LOOP_C_228 = 9'd368,
    COMP_LOOP_C_229 = 9'd369,
    COMP_LOOP_C_230 = 9'd370,
    COMP_LOOP_C_231 = 9'd371,
    COMP_LOOP_C_232 = 9'd372,
    COMP_LOOP_C_233 = 9'd373,
    COMP_LOOP_C_234 = 9'd374,
    COMP_LOOP_C_235 = 9'd375,
    COMP_LOOP_C_236 = 9'd376,
    COMP_LOOP_C_237 = 9'd377,
    COMP_LOOP_C_238 = 9'd378,
    COMP_LOOP_C_239 = 9'd379,
    COMP_LOOP_C_240 = 9'd380,
    COMP_LOOP_C_241 = 9'd381,
    COMP_LOOP_C_242 = 9'd382,
    COMP_LOOP_C_243 = 9'd383,
    COMP_LOOP_C_244 = 9'd384,
    COMP_LOOP_C_245 = 9'd385,
    COMP_LOOP_C_246 = 9'd386,
    COMP_LOOP_C_247 = 9'd387,
    COMP_LOOP_C_248 = 9'd388,
    COMP_LOOP_C_249 = 9'd389,
    COMP_LOOP_C_250 = 9'd390,
    COMP_LOOP_C_251 = 9'd391,
    COMP_LOOP_C_252 = 9'd392,
    COMP_LOOP_C_253 = 9'd393,
    COMP_LOOP_C_254 = 9'd394,
    COMP_LOOP_C_255 = 9'd395,
    COMP_LOOP_C_256 = 9'd396,
    VEC_LOOP_C_0 = 9'd397,
    STAGE_LOOP_C_4 = 9'd398,
    main_C_1 = 9'd399;

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
        if ( STAGE_LOOP_C_3_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_dev_while_C_0;
        end
      end
      modExp_dev_while_C_0 : begin
        fsm_output = 9'b000000101;
        state_var_NS = modExp_dev_while_C_1;
      end
      modExp_dev_while_C_1 : begin
        fsm_output = 9'b000000110;
        state_var_NS = modExp_dev_while_C_2;
      end
      modExp_dev_while_C_2 : begin
        fsm_output = 9'b000000111;
        state_var_NS = modExp_dev_while_C_3;
      end
      modExp_dev_while_C_3 : begin
        fsm_output = 9'b000001000;
        state_var_NS = modExp_dev_while_C_4;
      end
      modExp_dev_while_C_4 : begin
        fsm_output = 9'b000001001;
        state_var_NS = modExp_dev_while_C_5;
      end
      modExp_dev_while_C_5 : begin
        fsm_output = 9'b000001010;
        state_var_NS = modExp_dev_while_C_6;
      end
      modExp_dev_while_C_6 : begin
        fsm_output = 9'b000001011;
        state_var_NS = modExp_dev_while_C_7;
      end
      modExp_dev_while_C_7 : begin
        fsm_output = 9'b000001100;
        state_var_NS = modExp_dev_while_C_8;
      end
      modExp_dev_while_C_8 : begin
        fsm_output = 9'b000001101;
        state_var_NS = modExp_dev_while_C_9;
      end
      modExp_dev_while_C_9 : begin
        fsm_output = 9'b000001110;
        state_var_NS = modExp_dev_while_C_10;
      end
      modExp_dev_while_C_10 : begin
        fsm_output = 9'b000001111;
        state_var_NS = modExp_dev_while_C_11;
      end
      modExp_dev_while_C_11 : begin
        fsm_output = 9'b000010000;
        state_var_NS = modExp_dev_while_C_12;
      end
      modExp_dev_while_C_12 : begin
        fsm_output = 9'b000010001;
        state_var_NS = modExp_dev_while_C_13;
      end
      modExp_dev_while_C_13 : begin
        fsm_output = 9'b000010010;
        state_var_NS = modExp_dev_while_C_14;
      end
      modExp_dev_while_C_14 : begin
        fsm_output = 9'b000010011;
        if ( modExp_dev_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_0;
        end
        else begin
          state_var_NS = modExp_dev_while_C_0;
        end
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 9'b000010100;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 9'b000010101;
        if ( COMP_LOOP_C_1_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_1_modExp_dev_1_while_C_0 : begin
        fsm_output = 9'b000010110;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_1;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_1 : begin
        fsm_output = 9'b000010111;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_2;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_2 : begin
        fsm_output = 9'b000011000;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_3;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_3 : begin
        fsm_output = 9'b000011001;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_4;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_4 : begin
        fsm_output = 9'b000011010;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_5;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_5 : begin
        fsm_output = 9'b000011011;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_6;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_6 : begin
        fsm_output = 9'b000011100;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_7;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_7 : begin
        fsm_output = 9'b000011101;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_8;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_8 : begin
        fsm_output = 9'b000011110;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_9;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_9 : begin
        fsm_output = 9'b000011111;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_10;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_10 : begin
        fsm_output = 9'b000100000;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_11;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_11 : begin
        fsm_output = 9'b000100001;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_12;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_12 : begin
        fsm_output = 9'b000100010;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_13;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_13 : begin
        fsm_output = 9'b000100011;
        state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_14;
      end
      COMP_LOOP_1_modExp_dev_1_while_C_14 : begin
        fsm_output = 9'b000100100;
        if ( COMP_LOOP_1_modExp_dev_1_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 9'b000100101;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 9'b000100110;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 9'b000100111;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 9'b000101000;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 9'b000101001;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 9'b000101010;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 9'b000101011;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 9'b000101100;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 9'b000101101;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 9'b000101110;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 9'b000101111;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 9'b000110000;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 9'b000110001;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 9'b000110010;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 9'b000110011;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 9'b000110100;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 9'b000110101;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 9'b000110110;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 9'b000110111;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 9'b000111000;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 9'b000111001;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 9'b000111010;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 9'b000111011;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 9'b000111100;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 9'b000111101;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 9'b000111110;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 9'b000111111;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 9'b001000000;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 9'b001000001;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 9'b001000010;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 9'b001000011;
        if ( COMP_LOOP_C_32_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_33;
        end
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 9'b001000100;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_0;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_0 : begin
        fsm_output = 9'b001000101;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_1;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_1 : begin
        fsm_output = 9'b001000110;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_2;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_2 : begin
        fsm_output = 9'b001000111;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_3;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_3 : begin
        fsm_output = 9'b001001000;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_4;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_4 : begin
        fsm_output = 9'b001001001;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_5;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_5 : begin
        fsm_output = 9'b001001010;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_6;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_6 : begin
        fsm_output = 9'b001001011;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_7;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_7 : begin
        fsm_output = 9'b001001100;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_8;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_8 : begin
        fsm_output = 9'b001001101;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_9;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_9 : begin
        fsm_output = 9'b001001110;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_10;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_10 : begin
        fsm_output = 9'b001001111;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_11;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_11 : begin
        fsm_output = 9'b001010000;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_12;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_12 : begin
        fsm_output = 9'b001010001;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_13;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_13 : begin
        fsm_output = 9'b001010010;
        state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_14;
      end
      COMP_LOOP_2_modExp_dev_1_while_C_14 : begin
        fsm_output = 9'b001010011;
        if ( COMP_LOOP_2_modExp_dev_1_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_34;
        end
        else begin
          state_var_NS = COMP_LOOP_2_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 9'b001010100;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 9'b001010101;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 9'b001010110;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 9'b001010111;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 9'b001011000;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 9'b001011001;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 9'b001011010;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 9'b001011011;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 9'b001011100;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 9'b001011101;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 9'b001011110;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 9'b001011111;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 9'b001100000;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 9'b001100001;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 9'b001100010;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 9'b001100011;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 9'b001100100;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 9'b001100101;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 9'b001100110;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 9'b001100111;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 9'b001101000;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 9'b001101001;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 9'b001101010;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 9'b001101011;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 9'b001101100;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 9'b001101101;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 9'b001101110;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 9'b001101111;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 9'b001110000;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 9'b001110001;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 9'b001110010;
        if ( COMP_LOOP_C_64_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_65;
        end
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 9'b001110011;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_0;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_0 : begin
        fsm_output = 9'b001110100;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_1;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_1 : begin
        fsm_output = 9'b001110101;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_2;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_2 : begin
        fsm_output = 9'b001110110;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_3;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_3 : begin
        fsm_output = 9'b001110111;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_4;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_4 : begin
        fsm_output = 9'b001111000;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_5;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_5 : begin
        fsm_output = 9'b001111001;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_6;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_6 : begin
        fsm_output = 9'b001111010;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_7;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_7 : begin
        fsm_output = 9'b001111011;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_8;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_8 : begin
        fsm_output = 9'b001111100;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_9;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_9 : begin
        fsm_output = 9'b001111101;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_10;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_10 : begin
        fsm_output = 9'b001111110;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_11;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_11 : begin
        fsm_output = 9'b001111111;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_12;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_12 : begin
        fsm_output = 9'b010000000;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_13;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_13 : begin
        fsm_output = 9'b010000001;
        state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_14;
      end
      COMP_LOOP_3_modExp_dev_1_while_C_14 : begin
        fsm_output = 9'b010000010;
        if ( COMP_LOOP_3_modExp_dev_1_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_66;
        end
        else begin
          state_var_NS = COMP_LOOP_3_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 9'b010000011;
        state_var_NS = COMP_LOOP_C_67;
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 9'b010000100;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 9'b010000101;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 9'b010000110;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 9'b010000111;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 9'b010001000;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 9'b010001001;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 9'b010001010;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 9'b010001011;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 9'b010001100;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 9'b010001101;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 9'b010001110;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 9'b010001111;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 9'b010010000;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 9'b010010001;
        state_var_NS = COMP_LOOP_C_81;
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 9'b010010010;
        state_var_NS = COMP_LOOP_C_82;
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 9'b010010011;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 9'b010010100;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 9'b010010101;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 9'b010010110;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 9'b010010111;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 9'b010011000;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 9'b010011001;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 9'b010011010;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 9'b010011011;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 9'b010011100;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 9'b010011101;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 9'b010011110;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 9'b010011111;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 9'b010100000;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 9'b010100001;
        if ( COMP_LOOP_C_96_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_97;
        end
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 9'b010100010;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_0;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_0 : begin
        fsm_output = 9'b010100011;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_1;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_1 : begin
        fsm_output = 9'b010100100;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_2;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_2 : begin
        fsm_output = 9'b010100101;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_3;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_3 : begin
        fsm_output = 9'b010100110;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_4;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_4 : begin
        fsm_output = 9'b010100111;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_5;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_5 : begin
        fsm_output = 9'b010101000;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_6;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_6 : begin
        fsm_output = 9'b010101001;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_7;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_7 : begin
        fsm_output = 9'b010101010;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_8;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_8 : begin
        fsm_output = 9'b010101011;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_9;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_9 : begin
        fsm_output = 9'b010101100;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_10;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_10 : begin
        fsm_output = 9'b010101101;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_11;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_11 : begin
        fsm_output = 9'b010101110;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_12;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_12 : begin
        fsm_output = 9'b010101111;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_13;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_13 : begin
        fsm_output = 9'b010110000;
        state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_14;
      end
      COMP_LOOP_4_modExp_dev_1_while_C_14 : begin
        fsm_output = 9'b010110001;
        if ( COMP_LOOP_4_modExp_dev_1_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_98;
        end
        else begin
          state_var_NS = COMP_LOOP_4_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 9'b010110010;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 9'b010110011;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 9'b010110100;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 9'b010110101;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 9'b010110110;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 9'b010110111;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 9'b010111000;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 9'b010111001;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 9'b010111010;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 9'b010111011;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 9'b010111100;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 9'b010111101;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 9'b010111110;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 9'b010111111;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 9'b011000000;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 9'b011000001;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 9'b011000010;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 9'b011000011;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 9'b011000100;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 9'b011000101;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 9'b011000110;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 9'b011000111;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 9'b011001000;
        state_var_NS = COMP_LOOP_C_121;
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 9'b011001001;
        state_var_NS = COMP_LOOP_C_122;
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 9'b011001010;
        state_var_NS = COMP_LOOP_C_123;
      end
      COMP_LOOP_C_123 : begin
        fsm_output = 9'b011001011;
        state_var_NS = COMP_LOOP_C_124;
      end
      COMP_LOOP_C_124 : begin
        fsm_output = 9'b011001100;
        state_var_NS = COMP_LOOP_C_125;
      end
      COMP_LOOP_C_125 : begin
        fsm_output = 9'b011001101;
        state_var_NS = COMP_LOOP_C_126;
      end
      COMP_LOOP_C_126 : begin
        fsm_output = 9'b011001110;
        state_var_NS = COMP_LOOP_C_127;
      end
      COMP_LOOP_C_127 : begin
        fsm_output = 9'b011001111;
        state_var_NS = COMP_LOOP_C_128;
      end
      COMP_LOOP_C_128 : begin
        fsm_output = 9'b011010000;
        if ( COMP_LOOP_C_128_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_129;
        end
      end
      COMP_LOOP_C_129 : begin
        fsm_output = 9'b011010001;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_0;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_0 : begin
        fsm_output = 9'b011010010;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_1;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_1 : begin
        fsm_output = 9'b011010011;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_2;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_2 : begin
        fsm_output = 9'b011010100;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_3;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_3 : begin
        fsm_output = 9'b011010101;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_4;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_4 : begin
        fsm_output = 9'b011010110;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_5;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_5 : begin
        fsm_output = 9'b011010111;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_6;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_6 : begin
        fsm_output = 9'b011011000;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_7;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_7 : begin
        fsm_output = 9'b011011001;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_8;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_8 : begin
        fsm_output = 9'b011011010;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_9;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_9 : begin
        fsm_output = 9'b011011011;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_10;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_10 : begin
        fsm_output = 9'b011011100;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_11;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_11 : begin
        fsm_output = 9'b011011101;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_12;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_12 : begin
        fsm_output = 9'b011011110;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_13;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_13 : begin
        fsm_output = 9'b011011111;
        state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_14;
      end
      COMP_LOOP_5_modExp_dev_1_while_C_14 : begin
        fsm_output = 9'b011100000;
        if ( COMP_LOOP_5_modExp_dev_1_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_130;
        end
        else begin
          state_var_NS = COMP_LOOP_5_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_C_130 : begin
        fsm_output = 9'b011100001;
        state_var_NS = COMP_LOOP_C_131;
      end
      COMP_LOOP_C_131 : begin
        fsm_output = 9'b011100010;
        state_var_NS = COMP_LOOP_C_132;
      end
      COMP_LOOP_C_132 : begin
        fsm_output = 9'b011100011;
        state_var_NS = COMP_LOOP_C_133;
      end
      COMP_LOOP_C_133 : begin
        fsm_output = 9'b011100100;
        state_var_NS = COMP_LOOP_C_134;
      end
      COMP_LOOP_C_134 : begin
        fsm_output = 9'b011100101;
        state_var_NS = COMP_LOOP_C_135;
      end
      COMP_LOOP_C_135 : begin
        fsm_output = 9'b011100110;
        state_var_NS = COMP_LOOP_C_136;
      end
      COMP_LOOP_C_136 : begin
        fsm_output = 9'b011100111;
        state_var_NS = COMP_LOOP_C_137;
      end
      COMP_LOOP_C_137 : begin
        fsm_output = 9'b011101000;
        state_var_NS = COMP_LOOP_C_138;
      end
      COMP_LOOP_C_138 : begin
        fsm_output = 9'b011101001;
        state_var_NS = COMP_LOOP_C_139;
      end
      COMP_LOOP_C_139 : begin
        fsm_output = 9'b011101010;
        state_var_NS = COMP_LOOP_C_140;
      end
      COMP_LOOP_C_140 : begin
        fsm_output = 9'b011101011;
        state_var_NS = COMP_LOOP_C_141;
      end
      COMP_LOOP_C_141 : begin
        fsm_output = 9'b011101100;
        state_var_NS = COMP_LOOP_C_142;
      end
      COMP_LOOP_C_142 : begin
        fsm_output = 9'b011101101;
        state_var_NS = COMP_LOOP_C_143;
      end
      COMP_LOOP_C_143 : begin
        fsm_output = 9'b011101110;
        state_var_NS = COMP_LOOP_C_144;
      end
      COMP_LOOP_C_144 : begin
        fsm_output = 9'b011101111;
        state_var_NS = COMP_LOOP_C_145;
      end
      COMP_LOOP_C_145 : begin
        fsm_output = 9'b011110000;
        state_var_NS = COMP_LOOP_C_146;
      end
      COMP_LOOP_C_146 : begin
        fsm_output = 9'b011110001;
        state_var_NS = COMP_LOOP_C_147;
      end
      COMP_LOOP_C_147 : begin
        fsm_output = 9'b011110010;
        state_var_NS = COMP_LOOP_C_148;
      end
      COMP_LOOP_C_148 : begin
        fsm_output = 9'b011110011;
        state_var_NS = COMP_LOOP_C_149;
      end
      COMP_LOOP_C_149 : begin
        fsm_output = 9'b011110100;
        state_var_NS = COMP_LOOP_C_150;
      end
      COMP_LOOP_C_150 : begin
        fsm_output = 9'b011110101;
        state_var_NS = COMP_LOOP_C_151;
      end
      COMP_LOOP_C_151 : begin
        fsm_output = 9'b011110110;
        state_var_NS = COMP_LOOP_C_152;
      end
      COMP_LOOP_C_152 : begin
        fsm_output = 9'b011110111;
        state_var_NS = COMP_LOOP_C_153;
      end
      COMP_LOOP_C_153 : begin
        fsm_output = 9'b011111000;
        state_var_NS = COMP_LOOP_C_154;
      end
      COMP_LOOP_C_154 : begin
        fsm_output = 9'b011111001;
        state_var_NS = COMP_LOOP_C_155;
      end
      COMP_LOOP_C_155 : begin
        fsm_output = 9'b011111010;
        state_var_NS = COMP_LOOP_C_156;
      end
      COMP_LOOP_C_156 : begin
        fsm_output = 9'b011111011;
        state_var_NS = COMP_LOOP_C_157;
      end
      COMP_LOOP_C_157 : begin
        fsm_output = 9'b011111100;
        state_var_NS = COMP_LOOP_C_158;
      end
      COMP_LOOP_C_158 : begin
        fsm_output = 9'b011111101;
        state_var_NS = COMP_LOOP_C_159;
      end
      COMP_LOOP_C_159 : begin
        fsm_output = 9'b011111110;
        state_var_NS = COMP_LOOP_C_160;
      end
      COMP_LOOP_C_160 : begin
        fsm_output = 9'b011111111;
        if ( COMP_LOOP_C_160_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_161;
        end
      end
      COMP_LOOP_C_161 : begin
        fsm_output = 9'b100000000;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_0;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_0 : begin
        fsm_output = 9'b100000001;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_1;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_1 : begin
        fsm_output = 9'b100000010;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_2;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_2 : begin
        fsm_output = 9'b100000011;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_3;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_3 : begin
        fsm_output = 9'b100000100;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_4;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_4 : begin
        fsm_output = 9'b100000101;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_5;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_5 : begin
        fsm_output = 9'b100000110;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_6;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_6 : begin
        fsm_output = 9'b100000111;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_7;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_7 : begin
        fsm_output = 9'b100001000;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_8;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_8 : begin
        fsm_output = 9'b100001001;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_9;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_9 : begin
        fsm_output = 9'b100001010;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_10;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_10 : begin
        fsm_output = 9'b100001011;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_11;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_11 : begin
        fsm_output = 9'b100001100;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_12;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_12 : begin
        fsm_output = 9'b100001101;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_13;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_13 : begin
        fsm_output = 9'b100001110;
        state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_14;
      end
      COMP_LOOP_6_modExp_dev_1_while_C_14 : begin
        fsm_output = 9'b100001111;
        if ( COMP_LOOP_6_modExp_dev_1_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_162;
        end
        else begin
          state_var_NS = COMP_LOOP_6_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_C_162 : begin
        fsm_output = 9'b100010000;
        state_var_NS = COMP_LOOP_C_163;
      end
      COMP_LOOP_C_163 : begin
        fsm_output = 9'b100010001;
        state_var_NS = COMP_LOOP_C_164;
      end
      COMP_LOOP_C_164 : begin
        fsm_output = 9'b100010010;
        state_var_NS = COMP_LOOP_C_165;
      end
      COMP_LOOP_C_165 : begin
        fsm_output = 9'b100010011;
        state_var_NS = COMP_LOOP_C_166;
      end
      COMP_LOOP_C_166 : begin
        fsm_output = 9'b100010100;
        state_var_NS = COMP_LOOP_C_167;
      end
      COMP_LOOP_C_167 : begin
        fsm_output = 9'b100010101;
        state_var_NS = COMP_LOOP_C_168;
      end
      COMP_LOOP_C_168 : begin
        fsm_output = 9'b100010110;
        state_var_NS = COMP_LOOP_C_169;
      end
      COMP_LOOP_C_169 : begin
        fsm_output = 9'b100010111;
        state_var_NS = COMP_LOOP_C_170;
      end
      COMP_LOOP_C_170 : begin
        fsm_output = 9'b100011000;
        state_var_NS = COMP_LOOP_C_171;
      end
      COMP_LOOP_C_171 : begin
        fsm_output = 9'b100011001;
        state_var_NS = COMP_LOOP_C_172;
      end
      COMP_LOOP_C_172 : begin
        fsm_output = 9'b100011010;
        state_var_NS = COMP_LOOP_C_173;
      end
      COMP_LOOP_C_173 : begin
        fsm_output = 9'b100011011;
        state_var_NS = COMP_LOOP_C_174;
      end
      COMP_LOOP_C_174 : begin
        fsm_output = 9'b100011100;
        state_var_NS = COMP_LOOP_C_175;
      end
      COMP_LOOP_C_175 : begin
        fsm_output = 9'b100011101;
        state_var_NS = COMP_LOOP_C_176;
      end
      COMP_LOOP_C_176 : begin
        fsm_output = 9'b100011110;
        state_var_NS = COMP_LOOP_C_177;
      end
      COMP_LOOP_C_177 : begin
        fsm_output = 9'b100011111;
        state_var_NS = COMP_LOOP_C_178;
      end
      COMP_LOOP_C_178 : begin
        fsm_output = 9'b100100000;
        state_var_NS = COMP_LOOP_C_179;
      end
      COMP_LOOP_C_179 : begin
        fsm_output = 9'b100100001;
        state_var_NS = COMP_LOOP_C_180;
      end
      COMP_LOOP_C_180 : begin
        fsm_output = 9'b100100010;
        state_var_NS = COMP_LOOP_C_181;
      end
      COMP_LOOP_C_181 : begin
        fsm_output = 9'b100100011;
        state_var_NS = COMP_LOOP_C_182;
      end
      COMP_LOOP_C_182 : begin
        fsm_output = 9'b100100100;
        state_var_NS = COMP_LOOP_C_183;
      end
      COMP_LOOP_C_183 : begin
        fsm_output = 9'b100100101;
        state_var_NS = COMP_LOOP_C_184;
      end
      COMP_LOOP_C_184 : begin
        fsm_output = 9'b100100110;
        state_var_NS = COMP_LOOP_C_185;
      end
      COMP_LOOP_C_185 : begin
        fsm_output = 9'b100100111;
        state_var_NS = COMP_LOOP_C_186;
      end
      COMP_LOOP_C_186 : begin
        fsm_output = 9'b100101000;
        state_var_NS = COMP_LOOP_C_187;
      end
      COMP_LOOP_C_187 : begin
        fsm_output = 9'b100101001;
        state_var_NS = COMP_LOOP_C_188;
      end
      COMP_LOOP_C_188 : begin
        fsm_output = 9'b100101010;
        state_var_NS = COMP_LOOP_C_189;
      end
      COMP_LOOP_C_189 : begin
        fsm_output = 9'b100101011;
        state_var_NS = COMP_LOOP_C_190;
      end
      COMP_LOOP_C_190 : begin
        fsm_output = 9'b100101100;
        state_var_NS = COMP_LOOP_C_191;
      end
      COMP_LOOP_C_191 : begin
        fsm_output = 9'b100101101;
        state_var_NS = COMP_LOOP_C_192;
      end
      COMP_LOOP_C_192 : begin
        fsm_output = 9'b100101110;
        if ( COMP_LOOP_C_192_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_193;
        end
      end
      COMP_LOOP_C_193 : begin
        fsm_output = 9'b100101111;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_0;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_0 : begin
        fsm_output = 9'b100110000;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_1;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_1 : begin
        fsm_output = 9'b100110001;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_2;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_2 : begin
        fsm_output = 9'b100110010;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_3;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_3 : begin
        fsm_output = 9'b100110011;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_4;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_4 : begin
        fsm_output = 9'b100110100;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_5;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_5 : begin
        fsm_output = 9'b100110101;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_6;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_6 : begin
        fsm_output = 9'b100110110;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_7;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_7 : begin
        fsm_output = 9'b100110111;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_8;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_8 : begin
        fsm_output = 9'b100111000;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_9;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_9 : begin
        fsm_output = 9'b100111001;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_10;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_10 : begin
        fsm_output = 9'b100111010;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_11;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_11 : begin
        fsm_output = 9'b100111011;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_12;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_12 : begin
        fsm_output = 9'b100111100;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_13;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_13 : begin
        fsm_output = 9'b100111101;
        state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_14;
      end
      COMP_LOOP_7_modExp_dev_1_while_C_14 : begin
        fsm_output = 9'b100111110;
        if ( COMP_LOOP_7_modExp_dev_1_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_194;
        end
        else begin
          state_var_NS = COMP_LOOP_7_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_C_194 : begin
        fsm_output = 9'b100111111;
        state_var_NS = COMP_LOOP_C_195;
      end
      COMP_LOOP_C_195 : begin
        fsm_output = 9'b101000000;
        state_var_NS = COMP_LOOP_C_196;
      end
      COMP_LOOP_C_196 : begin
        fsm_output = 9'b101000001;
        state_var_NS = COMP_LOOP_C_197;
      end
      COMP_LOOP_C_197 : begin
        fsm_output = 9'b101000010;
        state_var_NS = COMP_LOOP_C_198;
      end
      COMP_LOOP_C_198 : begin
        fsm_output = 9'b101000011;
        state_var_NS = COMP_LOOP_C_199;
      end
      COMP_LOOP_C_199 : begin
        fsm_output = 9'b101000100;
        state_var_NS = COMP_LOOP_C_200;
      end
      COMP_LOOP_C_200 : begin
        fsm_output = 9'b101000101;
        state_var_NS = COMP_LOOP_C_201;
      end
      COMP_LOOP_C_201 : begin
        fsm_output = 9'b101000110;
        state_var_NS = COMP_LOOP_C_202;
      end
      COMP_LOOP_C_202 : begin
        fsm_output = 9'b101000111;
        state_var_NS = COMP_LOOP_C_203;
      end
      COMP_LOOP_C_203 : begin
        fsm_output = 9'b101001000;
        state_var_NS = COMP_LOOP_C_204;
      end
      COMP_LOOP_C_204 : begin
        fsm_output = 9'b101001001;
        state_var_NS = COMP_LOOP_C_205;
      end
      COMP_LOOP_C_205 : begin
        fsm_output = 9'b101001010;
        state_var_NS = COMP_LOOP_C_206;
      end
      COMP_LOOP_C_206 : begin
        fsm_output = 9'b101001011;
        state_var_NS = COMP_LOOP_C_207;
      end
      COMP_LOOP_C_207 : begin
        fsm_output = 9'b101001100;
        state_var_NS = COMP_LOOP_C_208;
      end
      COMP_LOOP_C_208 : begin
        fsm_output = 9'b101001101;
        state_var_NS = COMP_LOOP_C_209;
      end
      COMP_LOOP_C_209 : begin
        fsm_output = 9'b101001110;
        state_var_NS = COMP_LOOP_C_210;
      end
      COMP_LOOP_C_210 : begin
        fsm_output = 9'b101001111;
        state_var_NS = COMP_LOOP_C_211;
      end
      COMP_LOOP_C_211 : begin
        fsm_output = 9'b101010000;
        state_var_NS = COMP_LOOP_C_212;
      end
      COMP_LOOP_C_212 : begin
        fsm_output = 9'b101010001;
        state_var_NS = COMP_LOOP_C_213;
      end
      COMP_LOOP_C_213 : begin
        fsm_output = 9'b101010010;
        state_var_NS = COMP_LOOP_C_214;
      end
      COMP_LOOP_C_214 : begin
        fsm_output = 9'b101010011;
        state_var_NS = COMP_LOOP_C_215;
      end
      COMP_LOOP_C_215 : begin
        fsm_output = 9'b101010100;
        state_var_NS = COMP_LOOP_C_216;
      end
      COMP_LOOP_C_216 : begin
        fsm_output = 9'b101010101;
        state_var_NS = COMP_LOOP_C_217;
      end
      COMP_LOOP_C_217 : begin
        fsm_output = 9'b101010110;
        state_var_NS = COMP_LOOP_C_218;
      end
      COMP_LOOP_C_218 : begin
        fsm_output = 9'b101010111;
        state_var_NS = COMP_LOOP_C_219;
      end
      COMP_LOOP_C_219 : begin
        fsm_output = 9'b101011000;
        state_var_NS = COMP_LOOP_C_220;
      end
      COMP_LOOP_C_220 : begin
        fsm_output = 9'b101011001;
        state_var_NS = COMP_LOOP_C_221;
      end
      COMP_LOOP_C_221 : begin
        fsm_output = 9'b101011010;
        state_var_NS = COMP_LOOP_C_222;
      end
      COMP_LOOP_C_222 : begin
        fsm_output = 9'b101011011;
        state_var_NS = COMP_LOOP_C_223;
      end
      COMP_LOOP_C_223 : begin
        fsm_output = 9'b101011100;
        state_var_NS = COMP_LOOP_C_224;
      end
      COMP_LOOP_C_224 : begin
        fsm_output = 9'b101011101;
        if ( COMP_LOOP_C_224_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_225;
        end
      end
      COMP_LOOP_C_225 : begin
        fsm_output = 9'b101011110;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_0;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_0 : begin
        fsm_output = 9'b101011111;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_1;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_1 : begin
        fsm_output = 9'b101100000;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_2;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_2 : begin
        fsm_output = 9'b101100001;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_3;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_3 : begin
        fsm_output = 9'b101100010;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_4;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_4 : begin
        fsm_output = 9'b101100011;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_5;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_5 : begin
        fsm_output = 9'b101100100;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_6;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_6 : begin
        fsm_output = 9'b101100101;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_7;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_7 : begin
        fsm_output = 9'b101100110;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_8;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_8 : begin
        fsm_output = 9'b101100111;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_9;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_9 : begin
        fsm_output = 9'b101101000;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_10;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_10 : begin
        fsm_output = 9'b101101001;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_11;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_11 : begin
        fsm_output = 9'b101101010;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_12;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_12 : begin
        fsm_output = 9'b101101011;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_13;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_13 : begin
        fsm_output = 9'b101101100;
        state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_14;
      end
      COMP_LOOP_8_modExp_dev_1_while_C_14 : begin
        fsm_output = 9'b101101101;
        if ( COMP_LOOP_8_modExp_dev_1_while_C_14_tr0 ) begin
          state_var_NS = COMP_LOOP_C_226;
        end
        else begin
          state_var_NS = COMP_LOOP_8_modExp_dev_1_while_C_0;
        end
      end
      COMP_LOOP_C_226 : begin
        fsm_output = 9'b101101110;
        state_var_NS = COMP_LOOP_C_227;
      end
      COMP_LOOP_C_227 : begin
        fsm_output = 9'b101101111;
        state_var_NS = COMP_LOOP_C_228;
      end
      COMP_LOOP_C_228 : begin
        fsm_output = 9'b101110000;
        state_var_NS = COMP_LOOP_C_229;
      end
      COMP_LOOP_C_229 : begin
        fsm_output = 9'b101110001;
        state_var_NS = COMP_LOOP_C_230;
      end
      COMP_LOOP_C_230 : begin
        fsm_output = 9'b101110010;
        state_var_NS = COMP_LOOP_C_231;
      end
      COMP_LOOP_C_231 : begin
        fsm_output = 9'b101110011;
        state_var_NS = COMP_LOOP_C_232;
      end
      COMP_LOOP_C_232 : begin
        fsm_output = 9'b101110100;
        state_var_NS = COMP_LOOP_C_233;
      end
      COMP_LOOP_C_233 : begin
        fsm_output = 9'b101110101;
        state_var_NS = COMP_LOOP_C_234;
      end
      COMP_LOOP_C_234 : begin
        fsm_output = 9'b101110110;
        state_var_NS = COMP_LOOP_C_235;
      end
      COMP_LOOP_C_235 : begin
        fsm_output = 9'b101110111;
        state_var_NS = COMP_LOOP_C_236;
      end
      COMP_LOOP_C_236 : begin
        fsm_output = 9'b101111000;
        state_var_NS = COMP_LOOP_C_237;
      end
      COMP_LOOP_C_237 : begin
        fsm_output = 9'b101111001;
        state_var_NS = COMP_LOOP_C_238;
      end
      COMP_LOOP_C_238 : begin
        fsm_output = 9'b101111010;
        state_var_NS = COMP_LOOP_C_239;
      end
      COMP_LOOP_C_239 : begin
        fsm_output = 9'b101111011;
        state_var_NS = COMP_LOOP_C_240;
      end
      COMP_LOOP_C_240 : begin
        fsm_output = 9'b101111100;
        state_var_NS = COMP_LOOP_C_241;
      end
      COMP_LOOP_C_241 : begin
        fsm_output = 9'b101111101;
        state_var_NS = COMP_LOOP_C_242;
      end
      COMP_LOOP_C_242 : begin
        fsm_output = 9'b101111110;
        state_var_NS = COMP_LOOP_C_243;
      end
      COMP_LOOP_C_243 : begin
        fsm_output = 9'b101111111;
        state_var_NS = COMP_LOOP_C_244;
      end
      COMP_LOOP_C_244 : begin
        fsm_output = 9'b110000000;
        state_var_NS = COMP_LOOP_C_245;
      end
      COMP_LOOP_C_245 : begin
        fsm_output = 9'b110000001;
        state_var_NS = COMP_LOOP_C_246;
      end
      COMP_LOOP_C_246 : begin
        fsm_output = 9'b110000010;
        state_var_NS = COMP_LOOP_C_247;
      end
      COMP_LOOP_C_247 : begin
        fsm_output = 9'b110000011;
        state_var_NS = COMP_LOOP_C_248;
      end
      COMP_LOOP_C_248 : begin
        fsm_output = 9'b110000100;
        state_var_NS = COMP_LOOP_C_249;
      end
      COMP_LOOP_C_249 : begin
        fsm_output = 9'b110000101;
        state_var_NS = COMP_LOOP_C_250;
      end
      COMP_LOOP_C_250 : begin
        fsm_output = 9'b110000110;
        state_var_NS = COMP_LOOP_C_251;
      end
      COMP_LOOP_C_251 : begin
        fsm_output = 9'b110000111;
        state_var_NS = COMP_LOOP_C_252;
      end
      COMP_LOOP_C_252 : begin
        fsm_output = 9'b110001000;
        state_var_NS = COMP_LOOP_C_253;
      end
      COMP_LOOP_C_253 : begin
        fsm_output = 9'b110001001;
        state_var_NS = COMP_LOOP_C_254;
      end
      COMP_LOOP_C_254 : begin
        fsm_output = 9'b110001010;
        state_var_NS = COMP_LOOP_C_255;
      end
      COMP_LOOP_C_255 : begin
        fsm_output = 9'b110001011;
        state_var_NS = COMP_LOOP_C_256;
      end
      COMP_LOOP_C_256 : begin
        fsm_output = 9'b110001100;
        if ( COMP_LOOP_C_256_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 9'b110001101;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_4;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_4 : begin
        fsm_output = 9'b110001110;
        if ( STAGE_LOOP_C_4_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 9'b110001111;
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
//  Design Unit:    inPlaceNTT_DIT_core_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_core_wait_dp (
  ensig_cgo_iro, ensig_cgo, modulo_dev_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo;
  output modulo_dev_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign modulo_dev_cmp_ccs_ccore_en = ensig_cgo | ensig_cgo_iro;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_core
// ------------------------------------------------------------------


module inPlaceNTT_DIT_core (
  clk, rst, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz, vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_3_lz, vec_rsc_triosy_0_4_lz, vec_rsc_triosy_0_5_lz, vec_rsc_triosy_0_6_lz,
      vec_rsc_triosy_0_7_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz,
      vec_rsc_0_0_i_q_d, vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_1_i_q_d,
      vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_2_i_q_d, vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_3_i_q_d, vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_4_i_q_d,
      vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_5_i_q_d, vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_6_i_q_d, vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_7_i_q_d,
      vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_0_i_d_d_pff, vec_rsc_0_0_i_radr_d_pff,
      vec_rsc_0_0_i_wadr_d_pff, vec_rsc_0_0_i_we_d_pff, vec_rsc_0_1_i_we_d_pff, vec_rsc_0_2_i_we_d_pff,
      vec_rsc_0_3_i_we_d_pff, vec_rsc_0_4_i_we_d_pff, vec_rsc_0_5_i_we_d_pff, vec_rsc_0_6_i_we_d_pff,
      vec_rsc_0_7_i_we_d_pff
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
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
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


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  wire [63:0] r_rsci_idat;
  wire [63:0] modulo_dev_cmp_return_rsc_z;
  wire modulo_dev_cmp_ccs_ccore_en;
  reg [64:0] operator_66_true_div_cmp_a;
  wire [64:0] operator_66_true_div_cmp_z;
  reg [9:0] operator_66_true_div_cmp_b_9_0;
  wire [8:0] fsm_output;
  wire not_tmp_5;
  wire nor_tmp_18;
  wire mux_tmp_46;
  wire and_dcpl_6;
  wire and_dcpl_7;
  wire and_dcpl_8;
  wire and_dcpl_9;
  wire and_dcpl_10;
  wire and_dcpl_11;
  wire and_dcpl_14;
  wire and_dcpl_16;
  wire and_dcpl_17;
  wire mux_tmp_130;
  wire not_tmp_73;
  wire and_dcpl_19;
  wire and_dcpl_20;
  wire and_dcpl_21;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_34;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_43;
  wire and_dcpl_45;
  wire and_dcpl_46;
  wire and_dcpl_47;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_54;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_57;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire and_dcpl_62;
  wire and_dcpl_64;
  wire and_dcpl_65;
  wire or_tmp_106;
  wire not_tmp_76;
  wire and_dcpl_74;
  wire mux_tmp_139;
  wire or_tmp_125;
  wire mux_tmp_178;
  wire or_tmp_188;
  wire mux_tmp_217;
  wire or_tmp_251;
  wire mux_tmp_256;
  wire or_tmp_314;
  wire not_tmp_120;
  wire mux_tmp_294;
  wire or_tmp_389;
  wire not_tmp_130;
  wire mux_tmp_332;
  wire or_tmp_451;
  wire mux_tmp_370;
  wire or_tmp_513;
  wire mux_tmp_408;
  wire or_tmp_578;
  wire mux_tmp_448;
  wire mux_tmp_457;
  wire nor_tmp_99;
  wire mux_tmp_459;
  wire mux_tmp_463;
  wire mux_tmp_469;
  wire or_tmp_632;
  wire or_tmp_636;
  wire or_tmp_637;
  wire mux_tmp_484;
  wire and_dcpl_83;
  wire not_tmp_177;
  wire not_tmp_178;
  wire or_tmp_652;
  wire mux_tmp_497;
  wire mux_tmp_498;
  wire or_tmp_655;
  wire and_dcpl_96;
  wire and_tmp_6;
  wire or_tmp_674;
  wire or_tmp_677;
  wire mux_tmp_524;
  wire mux_tmp_525;
  wire or_tmp_678;
  wire and_tmp_8;
  wire mux_tmp_578;
  wire and_dcpl_103;
  wire and_dcpl_107;
  wire or_tmp_715;
  wire not_tmp_204;
  wire or_tmp_721;
  wire or_tmp_722;
  wire or_tmp_723;
  wire or_tmp_743;
  wire not_tmp_207;
  wire mux_tmp_606;
  wire and_tmp_9;
  wire mux_tmp_630;
  wire nor_tmp_118;
  wire not_tmp_220;
  wire not_tmp_226;
  wire and_dcpl_114;
  wire and_dcpl_117;
  wire and_dcpl_118;
  wire and_dcpl_120;
  wire and_dcpl_122;
  wire and_dcpl_124;
  wire and_dcpl_127;
  wire and_dcpl_130;
  wire and_dcpl_134;
  wire and_dcpl_139;
  wire and_dcpl_140;
  wire and_dcpl_142;
  wire and_dcpl_144;
  wire and_dcpl_145;
  wire and_dcpl_147;
  wire and_dcpl_149;
  wire or_tmp_840;
  wire or_tmp_842;
  wire or_tmp_843;
  reg COMP_LOOP_COMP_LOOP_and_11_itm;
  reg COMP_LOOP_COMP_LOOP_and_30_itm;
  wire [10:0] VEC_LOOP_acc_1_psp_1;
  wire [11:0] nl_VEC_LOOP_acc_1_psp_1;
  reg COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [9:0] COMP_LOOP_acc_1_cse_4_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_4_sva_1;
  reg [9:0] VEC_LOOP_j_sva_9_0;
  reg [5:0] COMP_LOOP_k_9_3_sva_5_0;
  reg COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm;
  reg [8:0] COMP_LOOP_acc_11_psp_sva;
  reg [8:0] COMP_LOOP_acc_14_psp_sva;
  wire [9:0] nl_COMP_LOOP_acc_14_psp_sva;
  reg [7:0] COMP_LOOP_acc_13_psp_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_4_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_sva;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_2_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_6_sva;
  wire [8:0] COMP_LOOP_acc_11_psp_sva_1;
  wire [9:0] nl_COMP_LOOP_acc_11_psp_sva_1;
  wire [9:0] COMP_LOOP_acc_1_cse_2_sva_mx0w0;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_2_sva_mx0w0;
  wire nand_90_cse;
  reg reg_vec_rsc_triosy_0_7_obj_ld_cse;
  reg reg_ensig_cgo_cse;
  wire nor_158_cse;
  wire and_250_cse;
  wire nand_38_cse;
  wire or_915_cse;
  wire and_223_cse;
  wire or_785_cse;
  wire and_230_cse;
  wire and_182_cse;
  wire nor_256_cse;
  wire or_109_cse;
  wire or_172_cse;
  wire or_165_cse;
  wire or_164_cse;
  wire nand_129_cse;
  wire or_157_cse;
  wire or_899_cse;
  wire or_745_cse;
  wire or_791_cse;
  wire and_229_cse;
  wire and_222_cse;
  wire or_168_cse;
  wire or_166_cse;
  wire or_159_cse;
  wire mux_173_cse;
  wire mux_591_cse;
  wire mux_557_cse;
  wire and_1_cse;
  wire mux_553_cse;
  reg [63:0] COMP_LOOP_1_mul_itm;
  wire signed [128:0] nl_COMP_LOOP_1_mul_itm;
  reg [63:0] tmp_10_lpi_4_dfm;
  reg [63:0] p_sva;
  reg [6:0] COMP_LOOP_acc_psp_sva;
  wire mux_507_itm;
  wire mux_659_itm;
  wire mux_tmp;
  wire and_dcpl_174;
  wire [7:0] z_out_1;
  wire and_dcpl_175;
  wire and_dcpl_189;
  wire [64:0] z_out_2;
  wire [65:0] nl_z_out_2;
  wire and_dcpl_192;
  wire [64:0] z_out_3;
  wire [65:0] nl_z_out_3;
  wire and_dcpl_201;
  wire and_dcpl_202;
  wire and_dcpl_203;
  wire and_dcpl_207;
  wire and_dcpl_208;
  wire and_dcpl_209;
  wire and_dcpl_212;
  wire and_dcpl_215;
  wire and_dcpl_220;
  wire and_dcpl_222;
  wire and_dcpl_225;
  wire and_dcpl_231;
  wire [9:0] z_out_4;
  wire and_dcpl_247;
  wire [6:0] z_out_5;
  wire [6:0] z_out_6;
  wire [7:0] nl_z_out_6;
  wire and_dcpl_265;
  wire and_dcpl_273;
  wire and_dcpl_281;
  wire and_dcpl_283;
  wire and_dcpl_300;
  reg [63:0] r_sva;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] STAGE_LOOP_lshift_psp_sva;
  reg [63:0] modExp_dev_exp_sva;
  reg [63:0] modExp_dev_result_sva;
  reg COMP_LOOP_COMP_LOOP_nor_1_itm;
  reg COMP_LOOP_COMP_LOOP_and_12_itm;
  reg COMP_LOOP_COMP_LOOP_nor_4_itm;
  reg COMP_LOOP_COMP_LOOP_and_32_itm;
  reg COMP_LOOP_COMP_LOOP_and_33_itm;
  reg COMP_LOOP_COMP_LOOP_and_34_itm;
  reg COMP_LOOP_COMP_LOOP_and_58_itm;
  reg COMP_LOOP_COMP_LOOP_and_60_itm;
  reg COMP_LOOP_COMP_LOOP_and_86_itm;
  reg COMP_LOOP_COMP_LOOP_and_121_itm;
  reg COMP_LOOP_COMP_LOOP_and_125_itm;
  reg [54:0] modExp_dev_exp_1_sva_63_9;
  reg [2:0] modExp_dev_exp_1_sva_2_0;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [9:0] STAGE_LOOP_lshift_psp_sva_mx0w0;
  wire VEC_LOOP_j_sva_9_0_mx0c1;
  wire tmp_10_lpi_4_dfm_mx0c0;
  wire tmp_10_lpi_4_dfm_mx0c1;
  wire tmp_10_lpi_4_dfm_mx0c2;
  wire tmp_10_lpi_4_dfm_mx0c3;
  wire tmp_10_lpi_4_dfm_mx0c4;
  wire tmp_10_lpi_4_dfm_mx0c5;
  wire tmp_10_lpi_4_dfm_mx0c6;
  wire tmp_10_lpi_4_dfm_mx0c7;
  wire and_113_rgt;
  wire and_367_ssc;
  wire modExp_dev_while_or_2_cse;
  wire nor_294_cse;
  wire mux_754_cse;
  wire and_331_cse;
  wire or_tmp_905;
  wire or_tmp_908;
  wire or_tmp_909;
  wire or_tmp_913;
  wire mux_tmp_747;
  wire mux_tmp_762;
  wire mux_tmp_763;
  wire nor_tmp_136;
  wire mux_tmp_770;
  wire [64:0] operator_64_false_operator_64_false_mux_rgt;
  wire or_tmp_939;
  wire or_tmp_940;
  wire or_tmp_942;
  wire or_tmp_943;
  wire or_tmp_945;
  wire mux_tmp_783;
  wire mux_tmp_785;
  wire mux_tmp_788;
  wire mux_tmp_790;
  wire mux_tmp_806;
  wire mux_tmp_807;
  wire mux_tmp_831;
  wire mux_tmp_833;
  wire [9:0] COMP_LOOP_mux1h_52_rgt;
  reg [3:0] COMP_LOOP_acc_10_cse_10_1_1_sva_9_6;
  reg [5:0] COMP_LOOP_acc_10_cse_10_1_1_sva_5_0;
  reg operator_64_false_acc_mut_64;
  reg [63:0] operator_64_false_acc_mut_63_0;
  wire nor_cse;
  wire or_1011_cse;
  wire nand_146_cse;
  wire nand_147_cse;
  wire or_1008_cse;
  wire or_897_cse;
  wire and_197_cse;
  wire or_987_cse;
  wire or_981_cse;
  wire STAGE_LOOP_acc_itm_2_1;
  wire [9:0] z_out_7_10_1;

  wire[0:0] mux_179_nl;
  wire[0:0] or_154_nl;
  wire[0:0] or_152_nl;
  wire[0:0] mux_506_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] mux_504_nl;
  wire[0:0] mux_503_nl;
  wire[0:0] mux_502_nl;
  wire[0:0] mux_501_nl;
  wire[0:0] mux_500_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] mux_499_nl;
  wire[0:0] nor_181_nl;
  wire[0:0] mux_498_nl;
  wire[0:0] mux_497_nl;
  wire[0:0] mux_495_nl;
  wire[0:0] mux_494_nl;
  wire[0:0] mux_493_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] mux_491_nl;
  wire[0:0] and_193_nl;
  wire[0:0] mux_489_nl;
  wire[0:0] mux_488_nl;
  wire[0:0] mux_487_nl;
  wire[0:0] mux_485_nl;
  wire[0:0] mux_482_nl;
  wire[0:0] mux_481_nl;
  wire[0:0] mux_480_nl;
  wire[0:0] and_195_nl;
  wire[0:0] mux_479_nl;
  wire[0:0] mux_478_nl;
  wire[0:0] mux_477_nl;
  wire[0:0] and_198_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] nor_165_nl;
  wire[0:0] or_713_nl;
  wire[63:0] modExp_dev_while_mux1h_nl;
  wire[63:0] mul_nl;
  wire[127:0] nl_mul_nl;
  wire[63:0] modExp_dev_while_mux_2_nl;
  wire[63:0] modExp_dev_while_mux_3_nl;
  wire[63:0] COMP_LOOP_1_acc_8_nl;
  wire[64:0] nl_COMP_LOOP_1_acc_8_nl;
  wire[0:0] modExp_dev_while_or_1_nl;
  wire[0:0] mux_626_nl;
  wire[0:0] mux_625_nl;
  wire[0:0] mux_624_nl;
  wire[0:0] mux_623_nl;
  wire[0:0] or_757_nl;
  wire[0:0] or_756_nl;
  wire[0:0] mux_622_nl;
  wire[0:0] or_755_nl;
  wire[0:0] mux_621_nl;
  wire[0:0] mux_620_nl;
  wire[0:0] or_754_nl;
  wire[0:0] or_752_nl;
  wire[0:0] mux_619_nl;
  wire[0:0] mux_618_nl;
  wire[0:0] nand_130_nl;
  wire[0:0] or_749_nl;
  wire[0:0] mux_617_nl;
  wire[0:0] mux_616_nl;
  wire[0:0] mux_615_nl;
  wire[0:0] mux_614_nl;
  wire[0:0] or_747_nl;
  wire[0:0] or_746_nl;
  wire[0:0] mux_613_nl;
  wire[0:0] mux_612_nl;
  wire[0:0] mux_611_nl;
  wire[0:0] mux_610_nl;
  wire[0:0] mux_609_nl;
  wire[0:0] or_740_nl;
  wire[0:0] or_737_nl;
  wire[0:0] mux_638_nl;
  wire[0:0] mux_637_nl;
  wire[0:0] and_180_nl;
  wire[0:0] mux_636_nl;
  wire[0:0] nor_150_nl;
  wire[0:0] nor_151_nl;
  wire[0:0] nor_152_nl;
  wire[0:0] mux_635_nl;
  wire[0:0] mux_634_nl;
  wire[0:0] nor_153_nl;
  wire[0:0] nor_154_nl;
  wire[0:0] nor_155_nl;
  wire[0:0] mux_572_nl;
  wire[0:0] mux_597_nl;
  wire[0:0] mux_596_nl;
  wire[0:0] mux_595_nl;
  wire[0:0] mux_594_nl;
  wire[0:0] mux_593_nl;
  wire[0:0] mux_592_nl;
  wire[0:0] mux_590_nl;
  wire[0:0] mux_589_nl;
  wire[0:0] mux_588_nl;
  wire[0:0] or_712_nl;
  wire[0:0] mux_562_nl;
  wire[0:0] mux_561_nl;
  wire[0:0] mux_560_nl;
  wire[0:0] mux_559_nl;
  wire[0:0] mux_581_nl;
  wire[0:0] mux_580_nl;
  wire[0:0] or_708_nl;
  wire[0:0] mux_576_nl;
  wire[0:0] mux_575_nl;
  wire[0:0] mux_574_nl;
  wire[0:0] mux_573_nl;
  wire[0:0] or_701_nl;
  wire[0:0] mux_788_nl;
  wire[0:0] mux_787_nl;
  wire[0:0] or_979_nl;
  wire[0:0] mux_786_nl;
  wire[0:0] mux_785_nl;
  wire[0:0] mux_784_nl;
  wire[0:0] mux_783_nl;
  wire[0:0] mux_782_nl;
  wire[0:0] or_978_nl;
  wire[0:0] mux_781_nl;
  wire[0:0] nand_150_nl;
  wire[0:0] mux_780_nl;
  wire[0:0] mux_779_nl;
  wire[0:0] mux_778_nl;
  wire[0:0] or_976_nl;
  wire[0:0] mux_777_nl;
  wire[0:0] or_975_nl;
  wire[0:0] mux_776_nl;
  wire[0:0] nand_151_nl;
  wire[0:0] mux_775_nl;
  wire[0:0] mux_773_nl;
  wire[0:0] nand_152_nl;
  wire[0:0] or_972_nl;
  wire[0:0] mux_772_nl;
  wire[0:0] mux_771_nl;
  wire[0:0] or_971_nl;
  wire[0:0] mux_770_nl;
  wire[0:0] mux_769_nl;
  wire[0:0] mux_768_nl;
  wire[0:0] mux_767_nl;
  wire[0:0] or_966_nl;
  wire[0:0] mux_803_nl;
  wire[0:0] nor_340_nl;
  wire[0:0] mux_802_nl;
  wire[0:0] mux_801_nl;
  wire[0:0] or_1026_nl;
  wire[0:0] nand_148_nl;
  wire[0:0] mux_800_nl;
  wire[0:0] mux_799_nl;
  wire[0:0] or_989_nl;
  wire[0:0] mux_798_nl;
  wire[0:0] nor_341_nl;
  wire[0:0] and_nl;
  wire[0:0] mux_796_nl;
  wire[0:0] and_423_nl;
  wire[0:0] mux_795_nl;
  wire[0:0] mux_794_nl;
  wire[0:0] nor_342_nl;
  wire[0:0] nor_343_nl;
  wire[0:0] mux_793_nl;
  wire[0:0] mux_792_nl;
  wire[0:0] nand_149_nl;
  wire[0:0] mux_791_nl;
  wire[0:0] nor_344_nl;
  wire[0:0] or_982_nl;
  wire[0:0] mux_599_nl;
  wire[0:0] nor_163_nl;
  wire[0:0] nor_164_nl;
  wire[0:0] nand_133_nl;
  wire[0:0] mux_601_nl;
  wire[0:0] nor_288_nl;
  wire[0:0] mux_600_nl;
  wire[0:0] or_721_nl;
  wire[0:0] or_720_nl;
  wire[0:0] nor_289_nl;
  wire[0:0] and_422_nl;
  wire[0:0] mux_806_nl;
  wire[0:0] mux_805_nl;
  wire[0:0] nor_336_nl;
  wire[0:0] nor_337_nl;
  wire[0:0] nor_338_nl;
  wire[0:0] nor_339_nl;
  wire[0:0] mux_606_nl;
  wire[0:0] nor_160_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_11_nl;
  wire[0:0] mux_658_nl;
  wire[0:0] or_894_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_30_nl;
  wire[9:0] COMP_LOOP_1_acc_nl;
  wire[10:0] nl_COMP_LOOP_1_acc_nl;
  wire[0:0] mux_661_nl;
  wire[0:0] and_176_nl;
  wire[0:0] mux_660_nl;
  wire[0:0] or_816_nl;
  wire[0:0] mux_663_nl;
  wire[0:0] and_121_nl;
  wire[0:0] mux_664_nl;
  wire[0:0] or_822_nl;
  wire[0:0] mux_666_nl;
  wire[0:0] and_124_nl;
  wire[0:0] mux_665_nl;
  wire[0:0] or_81_nl;
  wire[0:0] or_827_nl;
  wire[0:0] mux_668_nl;
  wire[0:0] and_127_nl;
  wire[0:0] and_129_nl;
  wire[0:0] COMP_LOOP_or_6_nl;
  wire[0:0] COMP_LOOP_or_7_nl;
  wire[0:0] COMP_LOOP_or_8_nl;
  wire[0:0] COMP_LOOP_or_9_nl;
  wire[0:0] COMP_LOOP_or_10_nl;
  wire[0:0] COMP_LOOP_or_11_nl;
  wire[0:0] COMP_LOOP_or_12_nl;
  wire[0:0] COMP_LOOP_or_13_nl;
  wire[2:0] COMP_LOOP_and_56_nl;
  wire[2:0] COMP_LOOP_mux1h_46_nl;
  wire[0:0] mux_701_nl;
  wire[0:0] mux_700_nl;
  wire[0:0] mux_699_nl;
  wire[0:0] mux_698_nl;
  wire[0:0] mux_697_nl;
  wire[0:0] and_251_nl;
  wire[0:0] mux_696_nl;
  wire[0:0] or_869_nl;
  wire[0:0] mux_695_nl;
  wire[0:0] mux_694_nl;
  wire[0:0] mux_693_nl;
  wire[0:0] mux_692_nl;
  wire[0:0] or_867_nl;
  wire[0:0] mux_691_nl;
  wire[0:0] mux_690_nl;
  wire[0:0] nor_134_nl;
  wire[0:0] nor_135_nl;
  wire[0:0] mux_689_nl;
  wire[0:0] mux_688_nl;
  wire[0:0] or_864_nl;
  wire[0:0] mux_687_nl;
  wire[0:0] nand_27_nl;
  wire[0:0] or_863_nl;
  wire[0:0] nand_132_nl;
  wire[0:0] mux_679_nl;
  wire[0:0] mux_678_nl;
  wire[0:0] or_1027_nl;
  wire[0:0] mux_677_nl;
  wire[0:0] or_846_nl;
  wire[0:0] or_845_nl;
  wire[0:0] or_1028_nl;
  wire[0:0] mux_676_nl;
  wire[0:0] or_843_nl;
  wire[0:0] or_842_nl;
  wire[0:0] mux_675_nl;
  wire[0:0] or_1029_nl;
  wire[0:0] mux_674_nl;
  wire[0:0] or_839_nl;
  wire[0:0] mux_673_nl;
  wire[0:0] or_1030_nl;
  wire[0:0] or_1031_nl;
  wire[0:0] mux_831_nl;
  wire[0:0] mux_830_nl;
  wire[0:0] mux_829_nl;
  wire[0:0] mux_828_nl;
  wire[0:0] mux_827_nl;
  wire[0:0] mux_826_nl;
  wire[0:0] mux_825_nl;
  wire[0:0] mux_824_nl;
  wire[0:0] mux_823_nl;
  wire[0:0] mux_822_nl;
  wire[0:0] mux_821_nl;
  wire[0:0] mux_820_nl;
  wire[0:0] mux_819_nl;
  wire[0:0] or_1007_nl;
  wire[0:0] mux_818_nl;
  wire[0:0] mux_816_nl;
  wire[0:0] mux_814_nl;
  wire[0:0] mux_813_nl;
  wire[0:0] mux_808_nl;
  wire[5:0] COMP_LOOP_k_COMP_LOOP_k_mux_nl;
  wire[0:0] mux_855_nl;
  wire[0:0] mux_854_nl;
  wire[0:0] mux_853_nl;
  wire[0:0] mux_852_nl;
  wire[0:0] mux_851_nl;
  wire[0:0] mux_850_nl;
  wire[0:0] mux_849_nl;
  wire[0:0] mux_848_nl;
  wire[0:0] mux_847_nl;
  wire[0:0] mux_846_nl;
  wire[0:0] mux_845_nl;
  wire[0:0] mux_844_nl;
  wire[0:0] mux_843_nl;
  wire[0:0] or_1013_nl;
  wire[0:0] mux_842_nl;
  wire[0:0] and_419_nl;
  wire[0:0] mux_841_nl;
  wire[0:0] mux_840_nl;
  wire[0:0] or_1012_nl;
  wire[0:0] mux_839_nl;
  wire[0:0] mux_838_nl;
  wire[0:0] mux_837_nl;
  wire[0:0] mux_716_nl;
  wire[0:0] mux_835_nl;
  wire[0:0] mux_866_nl;
  wire[0:0] mux_865_nl;
  wire[0:0] mux_864_nl;
  wire[0:0] and_414_nl;
  wire[0:0] nor_331_nl;
  wire[0:0] nor_332_nl;
  wire[0:0] mux_863_nl;
  wire[0:0] nand_143_nl;
  wire[0:0] mux_862_nl;
  wire[0:0] nor_334_nl;
  wire[0:0] mux_861_nl;
  wire[0:0] or_1017_nl;
  wire[0:0] and_415_nl;
  wire[0:0] mux_857_nl;
  wire[0:0] and_416_nl;
  wire[0:0] and_417_nl;
  wire[0:0] mux_856_nl;
  wire[63:0] COMP_LOOP_mux1h_58_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_210_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_212_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_214_nl;
  wire[0:0] or_120_nl;
  wire[0:0] or_901_nl;
  wire[0:0] nand_97_nl;
  wire[0:0] or_139_nl;
  wire[0:0] or_137_nl;
  wire[0:0] or_202_nl;
  wire[0:0] or_200_nl;
  wire[0:0] or_265_nl;
  wire[0:0] or_263_nl;
  wire[0:0] or_328_nl;
  wire[0:0] or_326_nl;
  wire[0:0] or_394_nl;
  wire[0:0] or_392_nl;
  wire[0:0] or_456_nl;
  wire[0:0] or_454_nl;
  wire[0:0] or_518_nl;
  wire[0:0] or_516_nl;
  wire[0:0] or_583_nl;
  wire[0:0] or_581_nl;
  wire[0:0] mux_474_nl;
  wire[0:0] and_201_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] nor_174_nl;
  wire[0:0] nor_175_nl;
  wire[0:0] mux_522_nl;
  wire[0:0] nor_170_nl;
  wire[0:0] mux_521_nl;
  wire[0:0] nor_171_nl;
  wire[0:0] and_187_nl;
  wire[0:0] mux_520_nl;
  wire[0:0] and_188_nl;
  wire[0:0] mux_518_nl;
  wire[0:0] nor_172_nl;
  wire[0:0] nor_173_nl;
  wire[0:0] mux_556_nl;
  wire[0:0] mux_653_nl;
  wire[0:0] or_802_nl;
  wire[0:0] or_761_nl;
  wire[0:0] nor_156_nl;
  wire[0:0] mux_631_nl;
  wire[0:0] or_769_nl;
  wire[0:0] mux_630_nl;
  wire[0:0] or_768_nl;
  wire[0:0] or_767_nl;
  wire[0:0] mux_629_nl;
  wire[0:0] nor_157_nl;
  wire[0:0] mux_628_nl;
  wire[0:0] or_760_nl;
  wire[0:0] and_181_nl;
  wire[0:0] or_774_nl;
  wire[0:0] or_812_nl;
  wire[2:0] STAGE_LOOP_acc_nl;
  wire[3:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] and_39_nl;
  wire[0:0] and_44_nl;
  wire[0:0] and_50_nl;
  wire[0:0] and_54_nl;
  wire[0:0] and_59_nl;
  wire[0:0] and_64_nl;
  wire[0:0] and_69_nl;
  wire[0:0] and_72_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] mux_164_nl;
  wire[0:0] nand_94_nl;
  wire[0:0] or_132_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] or_131_nl;
  wire[0:0] or_130_nl;
  wire[0:0] mux_162_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] or_128_nl;
  wire[0:0] or_127_nl;
  wire[0:0] nand_1_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] or_123_nl;
  wire[0:0] and_73_nl;
  wire[0:0] and_74_nl;
  wire[0:0] and_75_nl;
  wire[0:0] and_76_nl;
  wire[0:0] and_78_nl;
  wire[0:0] and_82_nl;
  wire[0:0] and_84_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] or_171_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] or_169_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] or_163_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] or_160_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] or_156_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] mux_171_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] or_150_nl;
  wire[0:0] or_148_nl;
  wire[0:0] or_147_nl;
  wire[0:0] mux_169_nl;
  wire[0:0] or_146_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] or_142_nl;
  wire[0:0] or_141_nl;
  wire[0:0] nand_2_nl;
  wire[0:0] or_135_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] nor_243_nl;
  wire[0:0] nor_244_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] nor_245_nl;
  wire[0:0] nor_246_nl;
  wire[0:0] nor_247_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] nor_248_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] nor_249_nl;
  wire[0:0] nor_250_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] nor_251_nl;
  wire[0:0] nor_252_nl;
  wire[0:0] nor_253_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] or_181_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] or_179_nl;
  wire[0:0] or_177_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] or_176_nl;
  wire[0:0] nand_3_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] nor_254_nl;
  wire[0:0] nor_255_nl;
  wire[0:0] or_173_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] or_234_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] or_232_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] mux_219_nl;
  wire[0:0] or_226_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] or_223_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] or_219_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] or_213_nl;
  wire[0:0] or_211_nl;
  wire[0:0] or_210_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] or_209_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] or_205_nl;
  wire[0:0] or_204_nl;
  wire[0:0] nand_4_nl;
  wire[0:0] or_198_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] nor_230_nl;
  wire[0:0] nor_231_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] nor_232_nl;
  wire[0:0] nor_233_nl;
  wire[0:0] nor_234_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] nor_235_nl;
  wire[0:0] mux_235_nl;
  wire[0:0] nor_236_nl;
  wire[0:0] nor_237_nl;
  wire[0:0] mux_234_nl;
  wire[0:0] nor_238_nl;
  wire[0:0] nor_239_nl;
  wire[0:0] nor_240_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] mux_232_nl;
  wire[0:0] or_244_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] or_242_nl;
  wire[0:0] or_240_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] or_239_nl;
  wire[0:0] nand_5_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] nor_241_nl;
  wire[0:0] nor_242_nl;
  wire[0:0] or_236_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] mux_265_nl;
  wire[0:0] mux_264_nl;
  wire[0:0] mux_263_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] or_297_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] or_295_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] mux_259_nl;
  wire[0:0] mux_258_nl;
  wire[0:0] or_289_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] or_286_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] or_282_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] mux_249_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] or_276_nl;
  wire[0:0] or_274_nl;
  wire[0:0] or_273_nl;
  wire[0:0] mux_247_nl;
  wire[0:0] or_272_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] or_268_nl;
  wire[0:0] or_267_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] or_261_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] nor_217_nl;
  wire[0:0] nor_218_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] nor_219_nl;
  wire[0:0] nor_220_nl;
  wire[0:0] nor_221_nl;
  wire[0:0] mux_276_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] nor_222_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] nor_223_nl;
  wire[0:0] nor_224_nl;
  wire[0:0] mux_273_nl;
  wire[0:0] nor_225_nl;
  wire[0:0] nor_226_nl;
  wire[0:0] nor_227_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] or_307_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] or_305_nl;
  wire[0:0] or_303_nl;
  wire[0:0] mux_269_nl;
  wire[0:0] or_302_nl;
  wire[0:0] nand_7_nl;
  wire[0:0] mux_268_nl;
  wire[0:0] mux_267_nl;
  wire[0:0] nor_228_nl;
  wire[0:0] nor_229_nl;
  wire[0:0] or_299_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] or_360_nl;
  wire[0:0] mux_300_nl;
  wire[0:0] or_358_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] mux_298_nl;
  wire[0:0] mux_297_nl;
  wire[0:0] or_352_nl;
  wire[0:0] mux_295_nl;
  wire[0:0] mux_294_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] or_349_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] nand_126_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] mux_288_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] or_339_nl;
  wire[0:0] or_337_nl;
  wire[0:0] or_336_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] or_335_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] or_331_nl;
  wire[0:0] nand_112_nl;
  wire[0:0] nand_8_nl;
  wire[0:0] or_324_nl;
  wire[0:0] mux_319_nl;
  wire[0:0] nor_211_nl;
  wire[0:0] mux_318_nl;
  wire[0:0] mux_317_nl;
  wire[0:0] nand_117_nl;
  wire[0:0] or_387_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] or_386_nl;
  wire[0:0] or_385_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] or_384_nl;
  wire[0:0] or_382_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] nor_212_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] and_214_nl;
  wire[0:0] and_215_nl;
  wire[0:0] mux_312_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] nor_213_nl;
  wire[0:0] nor_214_nl;
  wire[0:0] nor_215_nl;
  wire[0:0] nor_216_nl;
  wire[0:0] mux_310_nl;
  wire[0:0] mux_309_nl;
  wire[0:0] or_372_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] nand_74_nl;
  wire[0:0] or_370_nl;
  wire[0:0] or_368_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] or_367_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] or_365_nl;
  wire[0:0] or_364_nl;
  wire[0:0] or_363_nl;
  wire[0:0] mux_343_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] mux_340_nl;
  wire[0:0] or_426_nl;
  wire[0:0] or_424_nl;
  wire[0:0] or_423_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] or_422_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] or_420_nl;
  wire[0:0] or_419_nl;
  wire[0:0] nand_10_nl;
  wire[0:0] mux_336_nl;
  wire[0:0] mux_335_nl;
  wire[0:0] mux_334_nl;
  wire[0:0] mux_333_nl;
  wire[0:0] or_416_nl;
  wire[0:0] mux_332_nl;
  wire[0:0] or_414_nl;
  wire[0:0] mux_331_nl;
  wire[0:0] mux_330_nl;
  wire[0:0] mux_329_nl;
  wire[0:0] nor_73_nl;
  wire[0:0] mux_327_nl;
  wire[0:0] mux_326_nl;
  wire[0:0] mux_325_nl;
  wire[0:0] or_404_nl;
  wire[0:0] mux_324_nl;
  wire[0:0] or_400_nl;
  wire[0:0] mux_323_nl;
  wire[0:0] nor_70_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] nor_204_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] or_451_nl;
  wire[0:0] or_450_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] mux_353_nl;
  wire[0:0] or_449_nl;
  wire[0:0] or_448_nl;
  wire[0:0] or_446_nl;
  wire[0:0] mux_352_nl;
  wire[0:0] nor_205_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] and_213_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] nor_206_nl;
  wire[0:0] nor_207_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] nor_208_nl;
  wire[0:0] nor_209_nl;
  wire[0:0] nor_210_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] or_435_nl;
  wire[0:0] mux_345_nl;
  wire[0:0] or_433_nl;
  wire[0:0] or_431_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] or_430_nl;
  wire[0:0] or_429_nl;
  wire[0:0] or_428_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] mux_379_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] or_488_nl;
  wire[0:0] or_486_nl;
  wire[0:0] or_485_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] or_484_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] mux_375_nl;
  wire[0:0] or_482_nl;
  wire[0:0] nand_122_nl;
  wire[0:0] nand_12_nl;
  wire[0:0] mux_374_nl;
  wire[0:0] mux_373_nl;
  wire[0:0] mux_372_nl;
  wire[0:0] mux_371_nl;
  wire[0:0] or_478_nl;
  wire[0:0] mux_370_nl;
  wire[0:0] or_476_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] mux_368_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] nor_79_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] or_466_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] nand_116_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] nor_76_nl;
  wire[0:0] mux_395_nl;
  wire[0:0] nor_198_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] mux_393_nl;
  wire[0:0] or_513_nl;
  wire[0:0] or_512_nl;
  wire[0:0] mux_392_nl;
  wire[0:0] mux_391_nl;
  wire[0:0] or_511_nl;
  wire[0:0] or_510_nl;
  wire[0:0] or_508_nl;
  wire[0:0] mux_390_nl;
  wire[0:0] nor_199_nl;
  wire[0:0] mux_389_nl;
  wire[0:0] and_211_nl;
  wire[0:0] mux_388_nl;
  wire[0:0] and_252_nl;
  wire[0:0] nor_201_nl;
  wire[0:0] mux_387_nl;
  wire[0:0] and_212_nl;
  wire[0:0] nor_202_nl;
  wire[0:0] nor_203_nl;
  wire[0:0] mux_386_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] or_497_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] or_495_nl;
  wire[0:0] or_493_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] or_492_nl;
  wire[0:0] or_491_nl;
  wire[0:0] or_490_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] or_550_nl;
  wire[0:0] or_548_nl;
  wire[0:0] or_547_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] or_546_nl;
  wire[0:0] mux_414_nl;
  wire[0:0] mux_413_nl;
  wire[0:0] or_544_nl;
  wire[0:0] nand_120_nl;
  wire[0:0] nand_14_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] mux_411_nl;
  wire[0:0] mux_410_nl;
  wire[0:0] mux_409_nl;
  wire[0:0] or_540_nl;
  wire[0:0] mux_408_nl;
  wire[0:0] or_538_nl;
  wire[0:0] mux_407_nl;
  wire[0:0] mux_406_nl;
  wire[0:0] mux_405_nl;
  wire[0:0] nor_85_nl;
  wire[0:0] mux_403_nl;
  wire[0:0] mux_402_nl;
  wire[0:0] mux_401_nl;
  wire[0:0] or_528_nl;
  wire[0:0] mux_400_nl;
  wire[0:0] nand_115_nl;
  wire[0:0] mux_399_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] mux_433_nl;
  wire[0:0] nor_192_nl;
  wire[0:0] mux_432_nl;
  wire[0:0] mux_431_nl;
  wire[0:0] nand_114_nl;
  wire[0:0] or_576_nl;
  wire[0:0] mux_430_nl;
  wire[0:0] or_575_nl;
  wire[0:0] or_574_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] or_573_nl;
  wire[0:0] or_571_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] nor_193_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] and_209_nl;
  wire[0:0] and_210_nl;
  wire[0:0] mux_426_nl;
  wire[0:0] mux_425_nl;
  wire[0:0] nor_194_nl;
  wire[0:0] nor_195_nl;
  wire[0:0] nor_196_nl;
  wire[0:0] nor_197_nl;
  wire[0:0] mux_424_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] or_561_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] nand_50_nl;
  wire[0:0] or_559_nl;
  wire[0:0] or_557_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] or_556_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] or_554_nl;
  wire[0:0] or_553_nl;
  wire[0:0] or_552_nl;
  wire[0:0] mux_457_nl;
  wire[0:0] mux_456_nl;
  wire[0:0] mux_455_nl;
  wire[0:0] mux_454_nl;
  wire[0:0] or_615_nl;
  wire[0:0] or_613_nl;
  wire[0:0] or_612_nl;
  wire[0:0] mux_453_nl;
  wire[0:0] or_611_nl;
  wire[0:0] mux_452_nl;
  wire[0:0] mux_451_nl;
  wire[0:0] or_609_nl;
  wire[0:0] nand_118_nl;
  wire[0:0] nand_16_nl;
  wire[0:0] mux_450_nl;
  wire[0:0] mux_449_nl;
  wire[0:0] mux_448_nl;
  wire[0:0] mux_447_nl;
  wire[0:0] or_605_nl;
  wire[0:0] mux_446_nl;
  wire[0:0] or_603_nl;
  wire[0:0] mux_445_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] mux_443_nl;
  wire[0:0] and_207_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] mux_440_nl;
  wire[0:0] mux_439_nl;
  wire[0:0] or_593_nl;
  wire[0:0] mux_438_nl;
  wire[0:0] nand_113_nl;
  wire[0:0] mux_437_nl;
  wire[0:0] and_208_nl;
  wire[0:0] mux_472_nl;
  wire[0:0] mux_471_nl;
  wire[0:0] mux_470_nl;
  wire[0:0] nor_183_nl;
  wire[0:0] nor_184_nl;
  wire[0:0] mux_469_nl;
  wire[0:0] mux_468_nl;
  wire[0:0] and_202_nl;
  wire[0:0] nor_185_nl;
  wire[0:0] nor_186_nl;
  wire[0:0] mux_467_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] nor_187_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] and_203_nl;
  wire[0:0] and_204_nl;
  wire[0:0] mux_464_nl;
  wire[0:0] and_205_nl;
  wire[0:0] nor_188_nl;
  wire[0:0] nor_189_nl;
  wire[0:0] mux_463_nl;
  wire[0:0] mux_462_nl;
  wire[0:0] or_624_nl;
  wire[0:0] mux_461_nl;
  wire[0:0] nand_110_nl;
  wire[0:0] or_620_nl;
  wire[0:0] mux_460_nl;
  wire[0:0] or_619_nl;
  wire[0:0] nand_17_nl;
  wire[0:0] mux_459_nl;
  wire[0:0] mux_458_nl;
  wire[0:0] nor_190_nl;
  wire[0:0] nor_191_nl;
  wire[0:0] nand_41_nl;
  wire[0:0] or_926_nl;
  wire[0:0] or_925_nl;
  wire[0:0] nor_299_nl;
  wire[0:0] mux_753_nl;
  wire[0:0] mux_752_nl;
  wire[0:0] or_934_nl;
  wire[0:0] or_932_nl;
  wire[0:0] mux_751_nl;
  wire[0:0] or_930_nl;
  wire[0:0] or_928_nl;
  wire[0:0] mux_750_nl;
  wire[0:0] nor_300_nl;
  wire[0:0] and_412_nl;
  wire[0:0] mux_811_nl;
  wire[0:0] mux_809_nl;
  wire[0:0] nand_145_nl;
  wire[0:0] mux_859_nl;
  wire[0:0] nand_144_nl;
  wire[0:0] or_1019_nl;
  wire[8:0] acc_nl;
  wire[9:0] nl_acc_nl;
  wire[7:0] COMP_LOOP_mux_19_nl;
  wire[0:0] COMP_LOOP_or_30_nl;
  wire[0:0] STAGE_LOOP_STAGE_LOOP_or_1_nl;
  wire[63:0] STAGE_LOOP_STAGE_LOOP_mux_2_nl;
  wire[0:0] STAGE_LOOP_or_2_nl;
  wire[63:0] operator_64_false_mux1h_1_nl;
  wire[0:0] and_426_nl;
  wire[0:0] and_427_nl;
  wire[10:0] acc_3_nl;
  wire[11:0] nl_acc_3_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_1_nl;
  wire[8:0] COMP_LOOP_COMP_LOOP_mux_5_nl;
  wire[0:0] COMP_LOOP_or_31_nl;
  wire[0:0] COMP_LOOP_or_32_nl;
  wire[2:0] COMP_LOOP_mux1h_93_nl;
  wire[0:0] COMP_LOOP_or_33_nl;
  wire[7:0] acc_4_nl;
  wire[8:0] nl_acc_4_nl;
  wire[6:0] COMP_LOOP_mux_20_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nand_1_nl;
  wire[5:0] operator_64_false_1_mux_1_nl;
  wire[10:0] acc_6_nl;
  wire[12:0] nl_acc_6_nl;
  wire[2:0] COMP_LOOP_or_34_nl;
  wire[2:0] COMP_LOOP_COMP_LOOP_nor_30_nl;
  wire[2:0] COMP_LOOP_mux1h_94_nl;
  wire[0:0] and_429_nl;
  wire[0:0] and_430_nl;
  wire[0:0] and_431_nl;
  wire[0:0] and_432_nl;
  wire[0:0] and_433_nl;
  wire[0:0] and_434_nl;
  wire[0:0] and_435_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[63:0] COMP_LOOP_1_acc_5_nl;
  wire[64:0] nl_COMP_LOOP_1_acc_5_nl;
  wire[0:0] mux_517_nl;
  wire[0:0] and_189_nl;
  wire[0:0] mux_516_nl;
  wire[0:0] nor_176_nl;
  wire[0:0] mux_515_nl;
  wire[0:0] mux_514_nl;
  wire[0:0] nor_177_nl;
  wire[0:0] mux_513_nl;
  wire[0:0] mux_512_nl;
  wire[0:0] nor_178_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] and_190_nl;
  wire[0:0] nor_179_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] or_650_nl;
  wire[0:0] and_191_nl;
  wire[0:0] COMP_LOOP_or_14_nl;
  wire [63:0] nl_modulo_dev_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_acc_5_nl = tmp_10_lpi_4_dfm + modulo_dev_cmp_return_rsc_z;
  assign COMP_LOOP_1_acc_5_nl = nl_COMP_LOOP_1_acc_5_nl[63:0];
  assign mux_514_nl = MUX_s_1_2_2(or_tmp_632, or_tmp_636, fsm_output[6]);
  assign mux_515_nl = MUX_s_1_2_2(or_tmp_637, mux_514_nl, fsm_output[2]);
  assign nor_176_nl = ~((fsm_output[4:3]!=2'b00) | mux_515_nl);
  assign nor_177_nl = ~((fsm_output[4:3]!=2'b10) | mux_tmp_484);
  assign mux_516_nl = MUX_s_1_2_2(nor_176_nl, nor_177_nl, fsm_output[0]);
  assign and_189_nl = (fsm_output[5]) & mux_516_nl;
  assign nor_178_nl = ~((fsm_output[4:3]!=2'b00) | mux_tmp_484);
  assign and_190_nl = (fsm_output[3]) & (fsm_output[2]) & (fsm_output[6]) & (fsm_output[8])
      & (~ (fsm_output[7]));
  assign or_650_nl = (fsm_output[8:6]!=3'b000);
  assign mux_508_nl = MUX_s_1_2_2(or_tmp_632, or_650_nl, fsm_output[2]);
  assign nor_179_nl = ~((fsm_output[3]) | mux_508_nl);
  assign mux_509_nl = MUX_s_1_2_2(and_190_nl, nor_179_nl, fsm_output[4]);
  assign mux_512_nl = MUX_s_1_2_2(nor_178_nl, mux_509_nl, fsm_output[0]);
  assign and_191_nl = (~ (fsm_output[0])) & (fsm_output[4]) & (fsm_output[3]) & (fsm_output[2])
      & (fsm_output[6]) & (fsm_output[8]) & (~ (fsm_output[7]));
  assign mux_513_nl = MUX_s_1_2_2(mux_512_nl, and_191_nl, fsm_output[5]);
  assign mux_517_nl = MUX_s_1_2_2(and_189_nl, mux_513_nl, fsm_output[1]);
  assign COMP_LOOP_or_14_nl = (and_dcpl_83 & and_dcpl_26 & and_dcpl_25) | (and_dcpl_83
      & and_dcpl_19 & and_dcpl_30) | (and_dcpl_27 & and_dcpl_40) | (and_dcpl_22 &
      and_dcpl_42) | (and_dcpl_32 & and_dcpl_49) | (and_dcpl_37 & and_dcpl_55) |
      (and_dcpl_43 & and_dcpl_60) | (and_dcpl_47 & and_dcpl_64);
  assign nl_modulo_dev_cmp_base_rsc_dat = MUX1HOT_v_64_3_2(operator_64_false_acc_mut_63_0,
      COMP_LOOP_1_mul_itm, COMP_LOOP_1_acc_5_nl, {mux_517_nl , COMP_LOOP_or_14_nl
      , not_tmp_178});
  wire [63:0] nl_modulo_dev_cmp_m_rsc_dat;
  assign nl_modulo_dev_cmp_m_rsc_dat = p_sva;
  wire[0:0] nor_166_nl;
  wire[0:0] mux_544_nl;
  wire[0:0] mux_543_nl;
  wire[0:0] nand_36_nl;
  wire[0:0] mux_542_nl;
  wire[0:0] mux_541_nl;
  wire[0:0] and_185_nl;
  wire[0:0] mux_540_nl;
  wire[0:0] mux_539_nl;
  wire[0:0] or_681_nl;
  wire[0:0] mux_538_nl;
  wire[0:0] mux_537_nl;
  wire[0:0] nand_37_nl;
  wire[0:0] mux_536_nl;
  wire[0:0] or_679_nl;
  wire[0:0] mux_535_nl;
  wire[0:0] nor_167_nl;
  wire[0:0] mux_534_nl;
  wire[0:0] mux_533_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] or_677_nl;
  wire[0:0] mux_529_nl;
  wire[0:0] or_675_nl;
  wire[0:0] mux_528_nl;
  wire[0:0] or_673_nl;
  wire[0:0] nor_169_nl;
  wire[0:0] mux_527_nl;
  wire[0:0] nand_39_nl;
  wire[0:0] mux_526_nl;
  wire [0:0] nl_modulo_dev_cmp_ccs_ccore_start_rsc_dat;
  assign nand_36_nl = ~((fsm_output[1]) & (fsm_output[0]) & (~ (fsm_output[4])) &
      and_182_cse);
  assign and_185_nl = (fsm_output[6:4]==3'b111);
  assign mux_541_nl = MUX_s_1_2_2(and_185_nl, mux_tmp_498, fsm_output[0]);
  assign mux_539_nl = MUX_s_1_2_2((~ and_182_cse), (fsm_output[5]), fsm_output[4]);
  assign mux_540_nl = MUX_s_1_2_2(mux_tmp_497, mux_539_nl, fsm_output[0]);
  assign mux_542_nl = MUX_s_1_2_2((~ mux_541_nl), mux_540_nl, fsm_output[1]);
  assign mux_543_nl = MUX_s_1_2_2(nand_36_nl, mux_542_nl, fsm_output[7]);
  assign nand_37_nl = ~(((~ (fsm_output[4])) | (fsm_output[6])) & (fsm_output[5]));
  assign mux_536_nl = MUX_s_1_2_2(or_tmp_652, or_tmp_655, fsm_output[4]);
  assign mux_537_nl = MUX_s_1_2_2(nand_37_nl, mux_536_nl, fsm_output[0]);
  assign or_679_nl = (fsm_output[0]) | (fsm_output[6]) | (fsm_output[5]);
  assign mux_538_nl = MUX_s_1_2_2(mux_537_nl, or_679_nl, fsm_output[1]);
  assign or_681_nl = (fsm_output[7]) | mux_538_nl;
  assign mux_544_nl = MUX_s_1_2_2(mux_543_nl, or_681_nl, fsm_output[8]);
  assign nor_166_nl = ~((fsm_output[3]) | mux_544_nl);
  assign mux_531_nl = MUX_s_1_2_2((~ and_182_cse), or_tmp_655, fsm_output[4]);
  assign mux_532_nl = MUX_s_1_2_2(mux_531_nl, nand_38_cse, fsm_output[0]);
  assign or_677_nl = (~((~ (fsm_output[4])) | (fsm_output[6]))) | (fsm_output[5]);
  assign mux_529_nl = MUX_s_1_2_2(or_tmp_655, or_109_cse, fsm_output[4]);
  assign mux_530_nl = MUX_s_1_2_2(or_677_nl, mux_529_nl, fsm_output[0]);
  assign mux_533_nl = MUX_s_1_2_2(mux_532_nl, mux_530_nl, fsm_output[1]);
  assign or_673_nl = (fsm_output[6:4]!=3'b000);
  assign mux_528_nl = MUX_s_1_2_2(or_tmp_655, or_673_nl, fsm_output[0]);
  assign or_675_nl = (fsm_output[1]) | mux_528_nl;
  assign mux_534_nl = MUX_s_1_2_2(mux_533_nl, or_675_nl, fsm_output[7]);
  assign nor_167_nl = ~((fsm_output[8]) | mux_534_nl);
  assign nand_39_nl = ~((fsm_output[0]) & (fsm_output[4]) & (fsm_output[6]) & (fsm_output[5]));
  assign mux_526_nl = MUX_s_1_2_2((~ mux_tmp_498), mux_tmp_497, fsm_output[0]);
  assign mux_527_nl = MUX_s_1_2_2(nand_39_nl, mux_526_nl, fsm_output[1]);
  assign nor_169_nl = ~((fsm_output[8:7]!=2'b10) | mux_527_nl);
  assign mux_535_nl = MUX_s_1_2_2(nor_167_nl, nor_169_nl, fsm_output[3]);
  assign nl_modulo_dev_cmp_ccs_ccore_start_rsc_dat = MUX_s_1_2_2(nor_166_nl, mux_535_nl,
      fsm_output[2]);
  wire [10:0] nl_operator_66_true_div_cmp_b;
  assign nl_operator_66_true_div_cmp_b = {1'b0, operator_66_true_div_cmp_b_9_0};
  wire [0:0] nl_inPlaceNTT_DIT_core_wait_dp_inst_ensig_cgo_iro;
  assign nl_inPlaceNTT_DIT_core_wait_dp_inst_ensig_cgo_iro = ~ mux_507_itm;
  wire[64:0] operator_64_false_acc_1_nl;
  wire[65:0] nl_operator_64_false_acc_1_nl;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_3_tr0;
  assign nl_operator_64_false_acc_1_nl = ({1'b1 , (~ (operator_66_true_div_cmp_z[63:0]))})
      + 65'b00000000000000000000000000000000000000000000000000000000000000001;
  assign operator_64_false_acc_1_nl = nl_operator_64_false_acc_1_nl[64:0];
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_3_tr0 = ~ (readslicef_65_1_64(operator_64_false_acc_1_nl));
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 = ~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_32_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_32_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_64_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_64_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_96_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_96_tr0 = ~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_128_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_128_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_160_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_160_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_192_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_192_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_224_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_224_tr0 = ~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm;
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = VEC_LOOP_acc_1_psp_1[10];
  wire [0:0] nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_4_tr0;
  assign nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_4_tr0 = ~ STAGE_LOOP_acc_itm_2_1;
  ccs_in_v1 #(.rscid(32'sd5),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd6),
  .width(32'sd64)) r_rsci (
      .dat(r_rsc_dat),
      .idat(r_rsci_idat)
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
  modulo_dev  modulo_dev_cmp (
      .base_rsc_dat(nl_modulo_dev_cmp_base_rsc_dat[63:0]),
      .m_rsc_dat(nl_modulo_dev_cmp_m_rsc_dat[63:0]),
      .return_rsc_z(modulo_dev_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_modulo_dev_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(modulo_dev_cmp_ccs_ccore_en)
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
  inPlaceNTT_DIT_core_wait_dp inPlaceNTT_DIT_core_wait_dp_inst (
      .ensig_cgo_iro(nl_inPlaceNTT_DIT_core_wait_dp_inst_ensig_cgo_iro[0:0]),
      .ensig_cgo(reg_ensig_cgo_cse),
      .modulo_dev_cmp_ccs_ccore_en(modulo_dev_cmp_ccs_ccore_en)
    );
  inPlaceNTT_DIT_core_core_fsm inPlaceNTT_DIT_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .STAGE_LOOP_C_3_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_3_tr0[0:0]),
      .modExp_dev_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0[0:0]),
      .COMP_LOOP_1_modExp_dev_1_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_32_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_32_tr0[0:0]),
      .COMP_LOOP_2_modExp_dev_1_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_64_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_64_tr0[0:0]),
      .COMP_LOOP_3_modExp_dev_1_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_96_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_96_tr0[0:0]),
      .COMP_LOOP_4_modExp_dev_1_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_128_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_128_tr0[0:0]),
      .COMP_LOOP_5_modExp_dev_1_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_160_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_160_tr0[0:0]),
      .COMP_LOOP_6_modExp_dev_1_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_192_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_192_tr0[0:0]),
      .COMP_LOOP_7_modExp_dev_1_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_224_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_224_tr0[0:0]),
      .COMP_LOOP_8_modExp_dev_1_while_C_14_tr0(COMP_LOOP_COMP_LOOP_and_11_itm),
      .COMP_LOOP_C_256_tr0(COMP_LOOP_COMP_LOOP_and_30_itm),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_4_tr0(nl_inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_4_tr0[0:0])
    );
  assign or_168_cse = (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign mux_179_nl = MUX_s_1_2_2(nand_147_cse, or_165_cse, fsm_output[6]);
  assign or_166_cse = (fsm_output[5]) | mux_179_nl;
  assign or_159_cse = (fsm_output[7:5]!=3'b001) | nand_146_cse;
  assign or_154_nl = (fsm_output[6:5]!=2'b00) | nand_147_cse;
  assign or_152_nl = (fsm_output[5]) | (~ (fsm_output[6])) | (~ (fsm_output[7]))
      | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_173_cse = MUX_s_1_2_2(or_154_nl, or_152_nl, fsm_output[2]);
  assign nand_90_cse = ~((fsm_output[4:1]==4'b1111));
  assign or_897_cse = (fsm_output[6]) | (fsm_output[2]);
  assign and_197_cse = (fsm_output[6]) & (fsm_output[2]);
  assign mux_501_nl = MUX_s_1_2_2((fsm_output[7]), (fsm_output[8]), fsm_output[2]);
  assign mux_502_nl = MUX_s_1_2_2((~ mux_501_nl), mux_tmp_469, fsm_output[6]);
  assign nor_180_nl = ~(((fsm_output[2]) & (fsm_output[8])) | (fsm_output[7]));
  assign mux_500_nl = MUX_s_1_2_2(nor_180_nl, mux_tmp_459, fsm_output[6]);
  assign mux_503_nl = MUX_s_1_2_2(mux_502_nl, mux_500_nl, fsm_output[0]);
  assign nor_181_nl = ~((fsm_output[2]) | (fsm_output[8]));
  assign mux_499_nl = MUX_s_1_2_2(nor_181_nl, mux_tmp_457, fsm_output[6]);
  assign mux_504_nl = MUX_s_1_2_2(mux_503_nl, mux_499_nl, fsm_output[1]);
  assign mux_497_nl = MUX_s_1_2_2(mux_tmp_469, mux_tmp_463, fsm_output[6]);
  assign mux_494_nl = MUX_s_1_2_2(mux_tmp_459, nor_tmp_99, fsm_output[6]);
  assign mux_495_nl = MUX_s_1_2_2(mux_494_nl, mux_tmp_457, fsm_output[0]);
  assign mux_498_nl = MUX_s_1_2_2(mux_497_nl, mux_495_nl, fsm_output[1]);
  assign mux_505_nl = MUX_s_1_2_2(mux_504_nl, mux_498_nl, fsm_output[4]);
  assign mux_491_nl = MUX_s_1_2_2(mux_tmp_463, nor_tmp_99, fsm_output[6]);
  assign and_193_nl = ((~((fsm_output[6]) | (fsm_output[2]))) | (fsm_output[8]))
      & (fsm_output[7]);
  assign mux_492_nl = MUX_s_1_2_2(mux_491_nl, and_193_nl, and_230_cse);
  assign mux_487_nl = MUX_s_1_2_2((fsm_output[8]), nor_tmp_18, fsm_output[2]);
  assign mux_488_nl = MUX_s_1_2_2(mux_487_nl, mux_tmp_459, fsm_output[6]);
  assign mux_485_nl = MUX_s_1_2_2(nor_tmp_99, mux_tmp_457, fsm_output[6]);
  assign mux_489_nl = MUX_s_1_2_2(mux_488_nl, mux_485_nl, or_915_cse);
  assign mux_493_nl = MUX_s_1_2_2(mux_492_nl, mux_489_nl, fsm_output[4]);
  assign mux_506_nl = MUX_s_1_2_2(mux_505_nl, mux_493_nl, fsm_output[5]);
  assign and_195_nl = or_897_cse & (fsm_output[8:7]==2'b11);
  assign mux_480_nl = MUX_s_1_2_2(and_195_nl, mux_tmp_448, and_230_cse);
  assign mux_479_nl = MUX_s_1_2_2(nor_tmp_18, (fsm_output[8]), and_197_cse);
  assign mux_481_nl = MUX_s_1_2_2(mux_480_nl, mux_479_nl, fsm_output[4]);
  assign and_198_nl = or_915_cse & (fsm_output[2]);
  assign mux_477_nl = MUX_s_1_2_2(nor_tmp_18, (fsm_output[8]), and_198_nl);
  assign mux_476_nl = MUX_s_1_2_2(nor_tmp_18, mux_tmp_448, fsm_output[1]);
  assign mux_478_nl = MUX_s_1_2_2(mux_477_nl, mux_476_nl, fsm_output[4]);
  assign mux_482_nl = MUX_s_1_2_2(mux_481_nl, mux_478_nl, fsm_output[5]);
  assign mux_507_itm = MUX_s_1_2_2(mux_506_nl, mux_482_nl, fsm_output[3]);
  assign nand_38_cse = ~((fsm_output[5:4]==2'b11));
  assign nor_158_cse = ~((fsm_output[5:4]!=2'b10));
  assign or_785_cse = (fsm_output[8]) | (~ (fsm_output[7])) | (fsm_output[2]) | (fsm_output[3]);
  assign and_182_cse = (fsm_output[6:5]==2'b11);
  assign or_745_cse = (~ (fsm_output[8])) | (fsm_output[7]) | (~ (fsm_output[3]));
  assign or_791_cse = (~ (fsm_output[8])) | (fsm_output[7]) | (fsm_output[2]) | (fsm_output[3]);
  assign or_713_nl = (~ (fsm_output[8])) | (fsm_output[7]) | (fsm_output[3]);
  assign mux_591_cse = MUX_s_1_2_2(or_713_nl, or_165_cse, fsm_output[2]);
  assign modExp_dev_while_mux_2_nl = MUX_v_64_2_2(modExp_dev_result_sva, operator_64_false_acc_mut_63_0,
      mux_754_cse);
  assign modExp_dev_while_mux_3_nl = MUX_v_64_2_2(r_sva, modExp_dev_result_sva, mux_754_cse);
  assign nl_mul_nl = modExp_dev_while_mux_2_nl * modExp_dev_while_mux_3_nl;
  assign mul_nl = nl_mul_nl[63:0];
  assign nl_COMP_LOOP_1_acc_8_nl = tmp_10_lpi_4_dfm - modulo_dev_cmp_return_rsc_z;
  assign COMP_LOOP_1_acc_8_nl = nl_COMP_LOOP_1_acc_8_nl[63:0];
  assign modExp_dev_while_or_1_nl = and_dcpl_107 | not_tmp_207;
  assign or_757_nl = (~ (fsm_output[4])) | (~ (fsm_output[8])) | (fsm_output[7])
      | (fsm_output[3]);
  assign or_756_nl = (~ (fsm_output[5])) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (fsm_output[3]);
  assign mux_623_nl = MUX_s_1_2_2(or_757_nl, or_756_nl, fsm_output[6]);
  assign or_755_nl = (~ (fsm_output[5])) | (fsm_output[8]) | (fsm_output[7]) | (fsm_output[3]);
  assign mux_622_nl = MUX_s_1_2_2(or_755_nl, or_tmp_722, fsm_output[6]);
  assign mux_624_nl = MUX_s_1_2_2(mux_623_nl, mux_622_nl, fsm_output[2]);
  assign or_754_nl = nor_158_cse | (fsm_output[8]) | (~ (fsm_output[7])) | (fsm_output[3]);
  assign or_752_nl = (fsm_output[5]) | (~ (fsm_output[4])) | (fsm_output[8]) | (~
      (fsm_output[7])) | (fsm_output[3]);
  assign mux_620_nl = MUX_s_1_2_2(or_754_nl, or_752_nl, fsm_output[6]);
  assign nand_130_nl = ~((fsm_output[4]) & (fsm_output[8]) & (~ (fsm_output[7]))
      & (fsm_output[3]));
  assign mux_618_nl = MUX_s_1_2_2(or_tmp_722, nand_130_nl, fsm_output[5]);
  assign or_749_nl = (fsm_output[4]) | (~ (fsm_output[8])) | (fsm_output[7]) | (~
      (fsm_output[3]));
  assign mux_619_nl = MUX_s_1_2_2(mux_618_nl, or_749_nl, fsm_output[6]);
  assign mux_621_nl = MUX_s_1_2_2(mux_620_nl, mux_619_nl, fsm_output[2]);
  assign mux_625_nl = MUX_s_1_2_2(mux_624_nl, mux_621_nl, fsm_output[1]);
  assign or_747_nl = (fsm_output[4]) | (~ (fsm_output[8])) | (fsm_output[7]) | (fsm_output[3]);
  assign or_746_nl = (~ (fsm_output[4])) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (fsm_output[3]);
  assign mux_614_nl = MUX_s_1_2_2(or_747_nl, or_746_nl, fsm_output[5]);
  assign mux_615_nl = MUX_s_1_2_2(mux_614_nl, or_tmp_723, fsm_output[6]);
  assign mux_613_nl = MUX_s_1_2_2(or_tmp_721, or_745_cse, and_182_cse);
  assign mux_616_nl = MUX_s_1_2_2(mux_615_nl, mux_613_nl, fsm_output[2]);
  assign mux_610_nl = MUX_s_1_2_2(or_tmp_722, or_tmp_721, fsm_output[5]);
  assign mux_611_nl = MUX_s_1_2_2(or_tmp_723, mux_610_nl, fsm_output[6]);
  assign or_740_nl = nor_158_cse | (~ (fsm_output[8])) | (fsm_output[7]) | (~ (fsm_output[3]));
  assign or_737_nl = (fsm_output[5]) | (~ (fsm_output[4])) | (~ (fsm_output[8]))
      | (fsm_output[7]) | (~ (fsm_output[3]));
  assign mux_609_nl = MUX_s_1_2_2(or_740_nl, or_737_nl, fsm_output[6]);
  assign mux_612_nl = MUX_s_1_2_2(mux_611_nl, mux_609_nl, fsm_output[2]);
  assign mux_617_nl = MUX_s_1_2_2(mux_616_nl, mux_612_nl, fsm_output[1]);
  assign mux_626_nl = MUX_s_1_2_2(mux_625_nl, mux_617_nl, fsm_output[0]);
  assign nor_150_nl = ~((fsm_output[0]) | (fsm_output[7]) | (~ (fsm_output[2])) |
      (fsm_output[3]) | (fsm_output[8]));
  assign nor_151_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[7])) | (fsm_output[2])
      | (fsm_output[3]) | (fsm_output[8]));
  assign mux_636_nl = MUX_s_1_2_2(nor_150_nl, nor_151_nl, fsm_output[4]);
  assign and_180_nl = (fsm_output[5]) & mux_636_nl;
  assign nor_152_nl = ~((fsm_output[5:4]!=2'b10) | mux_tmp_606);
  assign mux_637_nl = MUX_s_1_2_2(and_180_nl, nor_152_nl, fsm_output[6]);
  assign nor_153_nl = ~((fsm_output[4]) | mux_tmp_606);
  assign nor_154_nl = ~((~ (fsm_output[4])) | (fsm_output[0]) | (fsm_output[7]) |
      not_tmp_76);
  assign mux_634_nl = MUX_s_1_2_2(nor_153_nl, nor_154_nl, fsm_output[5]);
  assign nor_155_nl = ~((fsm_output[5]) | (~ (fsm_output[4])) | (~ (fsm_output[0]))
      | (fsm_output[7]) | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[8]));
  assign mux_635_nl = MUX_s_1_2_2(mux_634_nl, nor_155_nl, fsm_output[6]);
  assign mux_638_nl = MUX_s_1_2_2(mux_637_nl, mux_635_nl, fsm_output[1]);
  assign modExp_dev_while_mux1h_nl = MUX1HOT_v_64_4_2(mul_nl, 64'b0000000000000000000000000000000000000000000000000000000000000001,
      modulo_dev_cmp_return_rsc_z, COMP_LOOP_1_acc_8_nl, {modExp_dev_while_or_1_nl
      , mux_626_nl , mux_638_nl , not_tmp_178});
  assign mux_594_nl = MUX_s_1_2_2(or_791_cse, or_tmp_678, fsm_output[5]);
  assign mux_595_nl = MUX_s_1_2_2(mux_594_nl, or_785_cse, fsm_output[1]);
  assign mux_592_nl = MUX_s_1_2_2(or_791_cse, mux_591_cse, fsm_output[5]);
  assign mux_593_nl = MUX_s_1_2_2(mux_592_nl, mux_553_cse, fsm_output[1]);
  assign mux_596_nl = MUX_s_1_2_2(mux_595_nl, mux_593_nl, fsm_output[4]);
  assign mux_588_nl = MUX_s_1_2_2(or_tmp_678, mux_tmp_525, fsm_output[5]);
  assign or_712_nl = (fsm_output[5]) | mux_tmp_524;
  assign mux_589_nl = MUX_s_1_2_2(mux_588_nl, or_712_nl, fsm_output[1]);
  assign mux_590_nl = MUX_s_1_2_2(mux_557_cse, mux_589_nl, fsm_output[4]);
  assign mux_597_nl = MUX_s_1_2_2(mux_596_nl, mux_590_nl, fsm_output[6]);
  assign mux_559_nl = MUX_s_1_2_2(mux_591_cse, or_tmp_678, fsm_output[5]);
  assign mux_560_nl = MUX_s_1_2_2(mux_559_nl, mux_tmp_524, fsm_output[1]);
  assign mux_561_nl = MUX_s_1_2_2(mux_560_nl, mux_557_cse, fsm_output[4]);
  assign or_708_nl = (~ (fsm_output[5])) | (fsm_output[2]) | (fsm_output[8]) | (fsm_output[7])
      | (fsm_output[3]);
  assign mux_580_nl = MUX_s_1_2_2(mux_553_cse, or_708_nl, fsm_output[1]);
  assign mux_575_nl = MUX_s_1_2_2(or_785_cse, or_tmp_674, fsm_output[5]);
  assign mux_573_nl = MUX_s_1_2_2(or_165_cse, or_745_cse, fsm_output[2]);
  assign or_701_nl = (fsm_output[2]) | (fsm_output[8]) | (fsm_output[7]) | (fsm_output[3]);
  assign mux_574_nl = MUX_s_1_2_2(mux_573_nl, or_701_nl, fsm_output[5]);
  assign mux_576_nl = MUX_s_1_2_2(mux_575_nl, mux_574_nl, fsm_output[1]);
  assign mux_581_nl = MUX_s_1_2_2(mux_580_nl, mux_576_nl, fsm_output[4]);
  assign mux_562_nl = MUX_s_1_2_2(mux_561_nl, mux_581_nl, fsm_output[6]);
  assign mux_572_nl = MUX_s_1_2_2(mux_597_nl, mux_562_nl, fsm_output[0]);
  assign operator_64_false_operator_64_false_mux_rgt = MUX_v_65_2_2(({1'b0 , modExp_dev_while_mux1h_nl}),
      z_out_3, mux_572_nl);
  assign nor_cse = ~((fsm_output[5]) | (fsm_output[0]));
  assign and_250_cse = (fsm_output[3:2]==2'b11);
  assign nand_146_cse = ~((fsm_output[8]) & (fsm_output[3]));
  assign nand_147_cse = ~((fsm_output[7]) & (fsm_output[8]) & (fsm_output[3]));
  assign or_109_cse = (fsm_output[6:5]!=2'b00);
  assign and_113_rgt = and_dcpl_103 & and_dcpl_7;
  assign modExp_dev_while_or_2_cse = and_dcpl_28 | and_dcpl_34 | and_dcpl_41 | and_dcpl_45
      | and_dcpl_50 | and_dcpl_56 | and_dcpl_59 | and_dcpl_65;
  assign or_915_cse = (fsm_output[1:0]!=2'b00);
  assign and_230_cse = (fsm_output[1:0]==2'b11);
  assign and_229_cse = (fsm_output[4:2]==3'b111);
  assign and_223_cse = (fsm_output[3:1]==3'b111);
  assign nor_256_cse = ~((fsm_output[8:7]!=2'b00));
  assign and_222_cse = ((fsm_output[2:1]!=2'b00)) & (fsm_output[3]);
  assign COMP_LOOP_k_COMP_LOOP_k_mux_nl = MUX_v_6_2_2(COMP_LOOP_k_9_3_sva_5_0, (z_out_3[8:3]),
      not_tmp_207);
  assign COMP_LOOP_mux1h_52_rgt = MUX_v_10_2_2(({4'b0000 , COMP_LOOP_k_COMP_LOOP_k_mux_nl}),
      z_out_7_10_1, modExp_dev_while_or_2_cse);
  assign or_1011_cse = (fsm_output[3:2]!=2'b00);
  assign or_1008_cse = (fsm_output[3:1]!=3'b000);
  assign nl_COMP_LOOP_acc_1_cse_2_sva_mx0w0 = VEC_LOOP_j_sva_9_0 + conv_u2u_9_10({COMP_LOOP_k_9_3_sva_5_0
      , 3'b001});
  assign COMP_LOOP_acc_1_cse_2_sva_mx0w0 = nl_COMP_LOOP_acc_1_cse_2_sva_mx0w0[9:0];
  assign nl_COMP_LOOP_acc_1_cse_4_sva_1 = VEC_LOOP_j_sva_9_0 + conv_u2u_9_10({COMP_LOOP_k_9_3_sva_5_0
      , 3'b011});
  assign COMP_LOOP_acc_1_cse_4_sva_1 = nl_COMP_LOOP_acc_1_cse_4_sva_1[9:0];
  assign nl_COMP_LOOP_acc_11_psp_sva_1 = (VEC_LOOP_j_sva_9_0[9:1]) + conv_u2u_8_9({COMP_LOOP_k_9_3_sva_5_0
      , 2'b01});
  assign COMP_LOOP_acc_11_psp_sva_1 = nl_COMP_LOOP_acc_11_psp_sva_1[8:0];
  assign nl_VEC_LOOP_acc_1_psp_1 = conv_u2u_10_11(VEC_LOOP_j_sva_9_0) + conv_u2u_10_11(STAGE_LOOP_lshift_psp_sva);
  assign VEC_LOOP_acc_1_psp_1 = nl_VEC_LOOP_acc_1_psp_1[10:0];
  assign not_tmp_5 = ~((fsm_output[3:2]==2'b11));
  assign and_1_cse = (fsm_output[4]) & or_1011_cse;
  assign nor_tmp_18 = (fsm_output[8:7]==2'b11);
  assign mux_tmp_46 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[8]);
  assign and_dcpl_6 = ~((fsm_output[6:5]!=2'b00));
  assign and_dcpl_7 = and_dcpl_6 & nor_256_cse;
  assign and_dcpl_8 = ~((fsm_output[4]) | (fsm_output[0]));
  assign and_dcpl_9 = ~((fsm_output[3:2]!=2'b00));
  assign and_dcpl_10 = and_dcpl_9 & (~ (fsm_output[1]));
  assign and_dcpl_11 = and_dcpl_10 & and_dcpl_8;
  assign and_dcpl_14 = and_dcpl_6 & (fsm_output[8:7]==2'b11);
  assign and_dcpl_16 = and_250_cse & (fsm_output[1]);
  assign and_dcpl_17 = and_dcpl_16 & and_dcpl_8;
  assign or_120_nl = (fsm_output[4]) | and_dcpl_16;
  assign mux_tmp_130 = MUX_s_1_2_2((fsm_output[4]), or_120_nl, fsm_output[0]);
  assign or_901_nl = (fsm_output[7:0]!=8'b00000000);
  assign nand_97_nl = ~((fsm_output[7]) & ((fsm_output[6:5]!=2'b00) | mux_tmp_130));
  assign not_tmp_73 = MUX_s_1_2_2(or_901_nl, nand_97_nl, fsm_output[8]);
  assign and_dcpl_19 = (fsm_output[4]) & (~ (fsm_output[0]));
  assign and_dcpl_20 = (fsm_output[3:2]==2'b01);
  assign and_dcpl_21 = and_dcpl_20 & (~ (fsm_output[1]));
  assign and_dcpl_22 = and_dcpl_21 & and_dcpl_19;
  assign and_dcpl_23 = and_dcpl_22 & and_dcpl_7;
  assign and_dcpl_24 = (fsm_output[6:5]==2'b01);
  assign and_dcpl_25 = and_dcpl_24 & nor_256_cse;
  assign and_dcpl_26 = (~ (fsm_output[4])) & (fsm_output[0]);
  assign and_dcpl_27 = and_dcpl_21 & and_dcpl_26;
  assign and_dcpl_28 = and_dcpl_27 & and_dcpl_25;
  assign and_dcpl_29 = (fsm_output[6:5]==2'b10);
  assign and_dcpl_30 = and_dcpl_29 & nor_256_cse;
  assign and_dcpl_31 = and_dcpl_9 & (fsm_output[1]);
  assign and_dcpl_32 = and_dcpl_31 & and_dcpl_26;
  assign and_dcpl_34 = and_dcpl_22 & and_dcpl_30;
  assign and_dcpl_36 = and_182_cse & nor_256_cse;
  assign and_dcpl_37 = and_dcpl_31 & and_dcpl_19;
  assign and_dcpl_39 = (fsm_output[8:7]==2'b01);
  assign and_dcpl_40 = and_dcpl_6 & and_dcpl_39;
  assign and_dcpl_41 = and_dcpl_32 & and_dcpl_40;
  assign and_dcpl_42 = and_dcpl_24 & and_dcpl_39;
  assign and_dcpl_43 = and_dcpl_10 & and_dcpl_26;
  assign and_dcpl_45 = and_dcpl_37 & and_dcpl_42;
  assign and_dcpl_46 = and_dcpl_29 & and_dcpl_39;
  assign and_dcpl_47 = and_dcpl_10 & and_dcpl_19;
  assign and_dcpl_49 = and_182_cse & and_dcpl_39;
  assign and_dcpl_50 = and_dcpl_43 & and_dcpl_49;
  assign and_dcpl_51 = (fsm_output[4]) & (fsm_output[0]);
  assign and_dcpl_52 = and_dcpl_16 & and_dcpl_51;
  assign and_dcpl_54 = (fsm_output[8:7]==2'b10);
  assign and_dcpl_55 = and_dcpl_6 & and_dcpl_54;
  assign and_dcpl_56 = and_dcpl_47 & and_dcpl_55;
  assign and_dcpl_57 = and_dcpl_24 & and_dcpl_54;
  assign and_dcpl_59 = and_dcpl_52 & and_dcpl_57;
  assign and_dcpl_60 = and_dcpl_29 & and_dcpl_54;
  assign and_dcpl_61 = and_250_cse & (~ (fsm_output[1]));
  assign and_dcpl_62 = and_dcpl_61 & and_dcpl_51;
  assign and_dcpl_64 = and_182_cse & and_dcpl_54;
  assign and_dcpl_65 = and_dcpl_17 & and_dcpl_64;
  assign or_tmp_106 = (~ (fsm_output[1])) | (~ (fsm_output[7])) | (fsm_output[8])
      | not_tmp_5;
  assign not_tmp_76 = ~((fsm_output[8]) & (fsm_output[2]) & (fsm_output[3]));
  assign and_dcpl_74 = (fsm_output[3:1]==3'b101);
  assign or_139_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b00) | (VEC_LOOP_j_sva_9_0[0])
      | (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign or_137_nl = (VEC_LOOP_j_sva_9_0[0]) | (fsm_output[6:5]!=2'b00) | (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b00)
      | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_139 = MUX_s_1_2_2(or_139_nl, or_137_nl, fsm_output[2]);
  assign or_tmp_125 = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b000) | (fsm_output[5])
      | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign or_172_cse = (~ (fsm_output[5])) | (fsm_output[6]) | (~ (fsm_output[7]))
      | (fsm_output[8]) | (fsm_output[3]);
  assign or_165_cse = (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign or_164_cse = (fsm_output[5]) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign nand_129_cse = ~((fsm_output[2]) & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7])
      & (~ (fsm_output[8])) & (fsm_output[3]));
  assign or_157_cse = (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7])
      | (fsm_output[8]) | (fsm_output[3]);
  assign or_202_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b00) | (~ (VEC_LOOP_j_sva_9_0[0]))
      | (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign or_200_nl = (~ (VEC_LOOP_j_sva_9_0[0])) | (fsm_output[6:5]!=2'b00) | (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b00)
      | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_178 = MUX_s_1_2_2(or_202_nl, or_200_nl, fsm_output[2]);
  assign or_tmp_188 = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b001) | (fsm_output[5])
      | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign or_265_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b01) | (VEC_LOOP_j_sva_9_0[0])
      | (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign or_263_nl = (VEC_LOOP_j_sva_9_0[0]) | (fsm_output[6:5]!=2'b00) | (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b01)
      | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_217 = MUX_s_1_2_2(or_265_nl, or_263_nl, fsm_output[2]);
  assign or_tmp_251 = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b010) | (fsm_output[5])
      | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign or_328_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b01) | (~ (VEC_LOOP_j_sva_9_0[0]))
      | (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign or_326_nl = (~ (VEC_LOOP_j_sva_9_0[0])) | (fsm_output[6:5]!=2'b00) | (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b01)
      | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_256 = MUX_s_1_2_2(or_328_nl, or_326_nl, fsm_output[2]);
  assign or_tmp_314 = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b011) | (fsm_output[5])
      | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign not_tmp_120 = ~((fsm_output[4]) & (fsm_output[1]));
  assign or_394_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b10) | (VEC_LOOP_j_sva_9_0[0])
      | (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign or_392_nl = (VEC_LOOP_j_sva_9_0[0]) | (fsm_output[6:5]!=2'b00) | (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b10)
      | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_294 = MUX_s_1_2_2(or_394_nl, or_392_nl, fsm_output[2]);
  assign or_tmp_389 = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b100) | (fsm_output[5])
      | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign not_tmp_130 = ~((fsm_output[2]) & (fsm_output[4]) & (fsm_output[1]));
  assign or_456_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b10) | (~ (VEC_LOOP_j_sva_9_0[0]))
      | (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign or_454_nl = (~ (VEC_LOOP_j_sva_9_0[0])) | (fsm_output[6:5]!=2'b00) | (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b10)
      | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_332 = MUX_s_1_2_2(or_456_nl, or_454_nl, fsm_output[2]);
  assign or_tmp_451 = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b101) | (fsm_output[5])
      | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign or_518_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b11) | (VEC_LOOP_j_sva_9_0[0])
      | (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign or_516_nl = (VEC_LOOP_j_sva_9_0[0]) | (fsm_output[6:5]!=2'b00) | (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b11)
      | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_370 = MUX_s_1_2_2(or_518_nl, or_516_nl, fsm_output[2]);
  assign or_tmp_513 = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b110) | (fsm_output[5])
      | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign or_583_nl = (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b11) | (~ (VEC_LOOP_j_sva_9_0[0]))
      | (fsm_output[7:5]!=3'b010) | nand_146_cse;
  assign or_581_nl = (~ (VEC_LOOP_j_sva_9_0[0])) | (fsm_output[6:5]!=2'b00) | (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b11)
      | (~ (fsm_output[7])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_408 = MUX_s_1_2_2(or_583_nl, or_581_nl, fsm_output[2]);
  assign or_tmp_578 = ~((COMP_LOOP_acc_1_cse_4_sva[2:0]==3'b111) & (~ (fsm_output[5]))
      & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8])) & (fsm_output[3]));
  assign mux_474_nl = MUX_s_1_2_2(nor_tmp_18, (fsm_output[8]), fsm_output[2]);
  assign and_201_nl = ((fsm_output[2]) | (fsm_output[8])) & (fsm_output[7]);
  assign mux_tmp_448 = MUX_s_1_2_2(mux_474_nl, and_201_nl, fsm_output[6]);
  assign mux_tmp_457 = MUX_s_1_2_2(mux_tmp_46, nor_tmp_18, fsm_output[2]);
  assign or_899_cse = (~ (fsm_output[2])) | (fsm_output[8]);
  assign nor_tmp_99 = or_899_cse & (fsm_output[7]);
  assign mux_tmp_459 = MUX_s_1_2_2(nor_tmp_18, mux_tmp_46, fsm_output[2]);
  assign mux_tmp_463 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), or_899_cse);
  assign mux_tmp_469 = MUX_s_1_2_2((fsm_output[8]), mux_tmp_46, fsm_output[2]);
  assign or_tmp_632 = (fsm_output[8:7]!=2'b01);
  assign or_tmp_636 = (fsm_output[8:7]!=2'b00);
  assign or_tmp_637 = (fsm_output[8:7]!=2'b10);
  assign mux_510_nl = MUX_s_1_2_2(or_tmp_637, or_tmp_632, fsm_output[6]);
  assign mux_tmp_484 = MUX_s_1_2_2(mux_510_nl, or_tmp_636, fsm_output[2]);
  assign and_dcpl_83 = and_dcpl_20 & (fsm_output[1]);
  assign nor_174_nl = ~((~ (fsm_output[7])) | (fsm_output[2]) | (fsm_output[3]) |
      (fsm_output[8]));
  assign nor_175_nl = ~((fsm_output[7]) | not_tmp_76);
  assign not_tmp_177 = MUX_s_1_2_2(nor_174_nl, nor_175_nl, fsm_output[0]);
  assign nor_170_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[4])) | (fsm_output[0])
      | (fsm_output[7]) | (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[8]));
  assign nor_171_nl = ~((fsm_output[4]) | (~ (fsm_output[0])) | (~ (fsm_output[7]))
      | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[8]));
  assign and_187_nl = (fsm_output[4]) & not_tmp_177;
  assign mux_521_nl = MUX_s_1_2_2(nor_171_nl, and_187_nl, fsm_output[5]);
  assign mux_522_nl = MUX_s_1_2_2(nor_170_nl, mux_521_nl, fsm_output[6]);
  assign and_188_nl = (~((fsm_output[5:4]!=2'b01))) & not_tmp_177;
  assign nor_172_nl = ~((fsm_output[4]) | (fsm_output[0]) | (fsm_output[7]) | not_tmp_76);
  assign nor_173_nl = ~((fsm_output[4]) | (~ (fsm_output[0])) | (fsm_output[7]) |
      (fsm_output[2]) | (fsm_output[3]) | (fsm_output[8]));
  assign mux_518_nl = MUX_s_1_2_2(nor_172_nl, nor_173_nl, fsm_output[5]);
  assign mux_520_nl = MUX_s_1_2_2(and_188_nl, mux_518_nl, fsm_output[6]);
  assign not_tmp_178 = MUX_s_1_2_2(mux_522_nl, mux_520_nl, fsm_output[1]);
  assign or_tmp_652 = (fsm_output[6:5]!=2'b10);
  assign mux_tmp_497 = MUX_s_1_2_2(or_tmp_652, or_109_cse, fsm_output[4]);
  assign mux_tmp_498 = MUX_s_1_2_2((~ or_tmp_652), and_182_cse, fsm_output[4]);
  assign or_tmp_655 = (fsm_output[6:5]!=2'b01);
  assign and_dcpl_96 = and_dcpl_9 & (fsm_output[1]) & (~ (fsm_output[4])) & and_dcpl_7;
  assign and_tmp_6 = (fsm_output[7]) & ((fsm_output[6:4]!=3'b000) | and_dcpl_16);
  assign or_tmp_674 = ~((fsm_output[2]) & (fsm_output[8]) & (~ (fsm_output[7])) &
      (fsm_output[3]));
  assign or_tmp_677 = (fsm_output[8]) | (~ (fsm_output[7])) | (fsm_output[3]);
  assign mux_tmp_524 = MUX_s_1_2_2(or_tmp_677, or_745_cse, fsm_output[2]);
  assign mux_tmp_525 = MUX_s_1_2_2(or_tmp_677, or_165_cse, fsm_output[2]);
  assign mux_553_cse = MUX_s_1_2_2(mux_tmp_525, mux_tmp_524, fsm_output[5]);
  assign or_tmp_678 = (~ (fsm_output[2])) | (fsm_output[8]) | (fsm_output[7]) | (fsm_output[3]);
  assign mux_556_nl = MUX_s_1_2_2(or_tmp_678, or_785_cse, fsm_output[5]);
  assign mux_557_cse = MUX_s_1_2_2(mux_556_nl, or_tmp_674, fsm_output[1]);
  assign and_tmp_8 = (fsm_output[4]) & or_1008_cse;
  assign mux_tmp_578 = MUX_s_1_2_2(and_1_cse, and_tmp_8, fsm_output[0]);
  assign and_dcpl_103 = and_dcpl_31 & and_dcpl_51;
  assign and_dcpl_107 = and_dcpl_27 & and_dcpl_7;
  assign or_tmp_715 = ((fsm_output[2:1]==2'b11)) | (fsm_output[3]);
  assign not_tmp_204 = MUX_s_1_2_2(or_tmp_715, (~ or_1011_cse), fsm_output[4]);
  assign or_tmp_721 = (fsm_output[4]) | (fsm_output[8]) | (fsm_output[7]) | (fsm_output[3]);
  assign or_tmp_722 = (~ (fsm_output[4])) | (fsm_output[8]) | (fsm_output[7]) | (fsm_output[3]);
  assign or_tmp_723 = (fsm_output[4]) | (fsm_output[8]) | (~ (fsm_output[7])) | (fsm_output[3]);
  assign or_802_nl = (~ (fsm_output[6])) | (~ (fsm_output[2])) | (fsm_output[7]);
  assign or_761_nl = (fsm_output[6]) | (fsm_output[2]) | (fsm_output[7]);
  assign mux_653_nl = MUX_s_1_2_2(or_802_nl, or_761_nl, fsm_output[8]);
  assign or_tmp_743 = (fsm_output[1]) | mux_653_nl;
  assign or_768_nl = (~ (fsm_output[2])) | (fsm_output[7]);
  assign or_767_nl = (fsm_output[2]) | (~ (fsm_output[7]));
  assign mux_630_nl = MUX_s_1_2_2(or_768_nl, or_767_nl, fsm_output[6]);
  assign or_769_nl = (~ (fsm_output[1])) | (fsm_output[8]) | mux_630_nl;
  assign mux_631_nl = MUX_s_1_2_2(or_769_nl, or_tmp_743, fsm_output[5]);
  assign nor_156_nl = ~((fsm_output[4:3]!=2'b10) | mux_631_nl);
  assign or_760_nl = (~ (fsm_output[1])) | (fsm_output[8]) | (fsm_output[6]) | (fsm_output[2])
      | (~ (fsm_output[7]));
  assign mux_628_nl = MUX_s_1_2_2(or_tmp_743, or_760_nl, fsm_output[5]);
  assign nor_157_nl = ~((fsm_output[3]) | mux_628_nl);
  assign and_181_nl = (fsm_output[3]) & (~ (fsm_output[5])) & (fsm_output[1]) & (fsm_output[8])
      & (fsm_output[6]) & (fsm_output[2]) & (~ (fsm_output[7]));
  assign mux_629_nl = MUX_s_1_2_2(nor_157_nl, and_181_nl, fsm_output[4]);
  assign not_tmp_207 = MUX_s_1_2_2(nor_156_nl, mux_629_nl, fsm_output[0]);
  assign or_774_nl = (fsm_output[7]) | not_tmp_76;
  assign mux_tmp_606 = MUX_s_1_2_2(or_785_cse, or_774_nl, fsm_output[0]);
  assign and_tmp_9 = (fsm_output[4]) & or_tmp_715;
  assign mux_tmp_630 = MUX_s_1_2_2(and_tmp_9, and_1_cse, fsm_output[0]);
  assign nor_tmp_118 = (fsm_output[4:1]==4'b1111);
  assign not_tmp_220 = ~((fsm_output[7:5]!=3'b000) | mux_tmp_630);
  assign or_812_nl = (fsm_output[7]) | ((fsm_output[6]) & ((fsm_output[5]) | nor_tmp_118));
  assign mux_659_itm = MUX_s_1_2_2(not_tmp_220, or_812_nl, fsm_output[8]);
  assign not_tmp_226 = ~((fsm_output[6:5]!=2'b00) | mux_tmp_630);
  assign and_dcpl_114 = ~((fsm_output[8:6]!=3'b000));
  assign and_dcpl_117 = (~ (VEC_LOOP_j_sva_9_0[2])) & (fsm_output[0]) & (~ (fsm_output[5]))
      & and_dcpl_114;
  assign and_dcpl_118 = (fsm_output[4]) & (~ (VEC_LOOP_j_sva_9_0[0]));
  assign and_dcpl_120 = and_dcpl_21 & and_dcpl_118 & (~ (VEC_LOOP_j_sva_9_0[1]));
  assign and_dcpl_122 = (fsm_output[4]) & (VEC_LOOP_j_sva_9_0[0]);
  assign and_dcpl_124 = and_dcpl_21 & and_dcpl_122 & (~ (VEC_LOOP_j_sva_9_0[1]));
  assign and_dcpl_127 = and_dcpl_21 & and_dcpl_118 & (VEC_LOOP_j_sva_9_0[1]);
  assign and_dcpl_130 = and_dcpl_21 & and_dcpl_122 & (VEC_LOOP_j_sva_9_0[1]);
  assign and_dcpl_134 = (VEC_LOOP_j_sva_9_0[2]) & (fsm_output[0]) & (~ (fsm_output[5]))
      & and_dcpl_114;
  assign and_dcpl_139 = and_dcpl_21 & and_dcpl_8 & and_dcpl_30;
  assign and_dcpl_140 = and_dcpl_103 & and_dcpl_36;
  assign and_dcpl_142 = and_dcpl_31 & and_dcpl_8 & and_dcpl_42;
  assign and_dcpl_144 = and_dcpl_10 & and_dcpl_51 & and_dcpl_46;
  assign and_dcpl_145 = and_dcpl_11 & and_dcpl_55;
  assign and_dcpl_147 = and_dcpl_16 & and_dcpl_26 & and_dcpl_57;
  assign and_dcpl_149 = and_dcpl_16 & and_dcpl_19 & and_dcpl_60;
  assign or_tmp_840 = (fsm_output[4:2]!=3'b000);
  assign or_tmp_842 = (fsm_output[5:4]!=2'b01);
  assign or_tmp_843 = (fsm_output[5:4]!=2'b10);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_17 & and_dcpl_14;
  assign VEC_LOOP_j_sva_9_0_mx0c1 = and_dcpl_61 & and_dcpl_26 & and_dcpl_14;
  assign tmp_10_lpi_4_dfm_mx0c0 = and_dcpl_120 & and_dcpl_117;
  assign tmp_10_lpi_4_dfm_mx0c1 = and_dcpl_124 & and_dcpl_117;
  assign tmp_10_lpi_4_dfm_mx0c2 = and_dcpl_127 & and_dcpl_117;
  assign tmp_10_lpi_4_dfm_mx0c3 = and_dcpl_130 & and_dcpl_117;
  assign tmp_10_lpi_4_dfm_mx0c4 = and_dcpl_120 & and_dcpl_134;
  assign tmp_10_lpi_4_dfm_mx0c5 = and_dcpl_124 & and_dcpl_134;
  assign tmp_10_lpi_4_dfm_mx0c6 = and_dcpl_127 & and_dcpl_134;
  assign tmp_10_lpi_4_dfm_mx0c7 = and_dcpl_130 & and_dcpl_134;
  assign nl_STAGE_LOOP_acc_nl = (z_out_2[3:1]) + 3'b011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[2:0];
  assign STAGE_LOOP_acc_itm_2_1 = readslicef_3_1_2(STAGE_LOOP_acc_nl);
  assign vec_rsc_0_0_i_d_d_pff = modulo_dev_cmp_return_rsc_z;
  assign and_39_nl = and_dcpl_32 & and_dcpl_30;
  assign and_44_nl = and_dcpl_37 & and_dcpl_36;
  assign and_50_nl = and_dcpl_43 & and_dcpl_42;
  assign and_54_nl = and_dcpl_47 & and_dcpl_46;
  assign and_59_nl = and_dcpl_52 & and_dcpl_49;
  assign and_64_nl = and_dcpl_17 & and_dcpl_57;
  assign and_69_nl = and_dcpl_62 & and_dcpl_60;
  assign vec_rsc_0_0_i_radr_d_pff = MUX1HOT_v_7_9_2(z_out_5, (z_out_7_10_1[9:3]),
      (COMP_LOOP_acc_1_cse_2_sva[9:3]), (COMP_LOOP_acc_11_psp_sva[8:2]), (COMP_LOOP_acc_1_cse_4_sva[9:3]),
      (COMP_LOOP_acc_13_psp_sva[7:1]), (COMP_LOOP_acc_1_cse_6_sva[9:3]), (COMP_LOOP_acc_14_psp_sva[8:2]),
      (COMP_LOOP_acc_1_cse_sva[9:3]), {and_dcpl_23 , modExp_dev_while_or_2_cse ,
      and_39_nl , and_44_nl , and_50_nl , and_54_nl , and_59_nl , and_64_nl , and_69_nl});
  assign and_72_nl = and_dcpl_43 & and_dcpl_30;
  assign nand_94_nl = ~((~ (fsm_output[4])) & (fsm_output[0]) & (fsm_output[1]) &
      (fsm_output[7]) & (fsm_output[8]) & (~ (fsm_output[2])) & (fsm_output[3]));
  assign or_131_nl = (fsm_output[1]) | (~ (fsm_output[7])) | (fsm_output[8]) | (fsm_output[2])
      | (fsm_output[3]);
  assign or_130_nl = (fsm_output[1]) | (fsm_output[7]) | not_tmp_76;
  assign mux_163_nl = MUX_s_1_2_2(or_131_nl, or_130_nl, fsm_output[0]);
  assign or_132_nl = (fsm_output[4]) | mux_163_nl;
  assign mux_164_nl = MUX_s_1_2_2(nand_94_nl, or_132_nl, fsm_output[5]);
  assign or_128_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[2])
      | (fsm_output[3]);
  assign mux_160_nl = MUX_s_1_2_2(or_128_nl, or_tmp_106, fsm_output[0]);
  assign or_127_nl = (fsm_output[0]) | (fsm_output[1]) | (fsm_output[7]) | not_tmp_76;
  assign mux_161_nl = MUX_s_1_2_2(mux_160_nl, or_127_nl, fsm_output[4]);
  assign or_123_nl = (fsm_output[1]) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[2])
      | (fsm_output[3]);
  assign mux_159_nl = MUX_s_1_2_2(or_tmp_106, or_123_nl, fsm_output[0]);
  assign nand_1_nl = ~((fsm_output[4]) & (~ mux_159_nl));
  assign mux_162_nl = MUX_s_1_2_2(mux_161_nl, nand_1_nl, fsm_output[5]);
  assign mux_165_nl = MUX_s_1_2_2(mux_164_nl, mux_162_nl, fsm_output[6]);
  assign and_73_nl = and_dcpl_47 & and_dcpl_36;
  assign and_74_nl = and_dcpl_52 & and_dcpl_40;
  assign and_75_nl = and_dcpl_17 & and_dcpl_46;
  assign and_76_nl = and_dcpl_62 & and_dcpl_49;
  assign and_78_nl = and_dcpl_61 & and_dcpl_8 & and_dcpl_57;
  assign and_82_nl = and_dcpl_74 & and_dcpl_51 & and_dcpl_60;
  assign and_84_nl = and_dcpl_74 & and_dcpl_8 & and_dcpl_14;
  assign vec_rsc_0_0_i_wadr_d_pff = MUX1HOT_v_7_9_2(COMP_LOOP_acc_psp_sva, ({COMP_LOOP_acc_10_cse_10_1_1_sva_9_6
      , (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[5:3])}), (COMP_LOOP_acc_1_cse_2_sva[9:3]),
      (COMP_LOOP_acc_11_psp_sva[8:2]), (COMP_LOOP_acc_1_cse_4_sva[9:3]), (COMP_LOOP_acc_13_psp_sva[7:1]),
      (COMP_LOOP_acc_1_cse_6_sva[9:3]), (COMP_LOOP_acc_14_psp_sva[8:2]), (COMP_LOOP_acc_1_cse_sva[9:3]),
      {and_72_nl , (~ mux_165_nl) , and_73_nl , and_74_nl , and_75_nl , and_76_nl
      , and_78_nl , and_82_nl , and_84_nl});
  assign or_171_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b000) | (fsm_output[7:5]!=3'b001)
      | nand_146_cse;
  assign mux_184_nl = MUX_s_1_2_2(or_172_cse, or_171_nl, fsm_output[2]);
  assign or_169_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b000) | (~ (fsm_output[5]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_183_nl = MUX_s_1_2_2(or_169_nl, or_168_cse, fsm_output[2]);
  assign mux_185_nl = MUX_s_1_2_2(mux_184_nl, mux_183_nl, fsm_output[4]);
  assign or_163_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b000);
  assign mux_180_nl = MUX_s_1_2_2(or_166_cse, or_164_cse, or_163_nl);
  assign mux_181_nl = MUX_s_1_2_2(mux_180_nl, or_tmp_125, fsm_output[2]);
  assign mux_182_nl = MUX_s_1_2_2(mux_181_nl, nand_129_cse, fsm_output[4]);
  assign mux_186_nl = MUX_s_1_2_2(mux_185_nl, mux_182_nl, fsm_output[1]);
  assign or_160_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b000) | (fsm_output[5]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_176_nl = MUX_s_1_2_2(or_160_nl, or_159_cse, fsm_output[2]);
  assign or_156_nl = (COMP_LOOP_acc_13_psp_sva[0]) | (VEC_LOOP_j_sva_9_0[1:0]!=2'b00)
      | (~ (fsm_output[5])) | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (~ (fsm_output[3]));
  assign mux_175_nl = MUX_s_1_2_2(or_157_cse, or_156_nl, fsm_output[2]);
  assign mux_177_nl = MUX_s_1_2_2(mux_176_nl, mux_175_nl, fsm_output[4]);
  assign mux_174_nl = MUX_s_1_2_2(mux_173_cse, mux_tmp_139, fsm_output[4]);
  assign mux_178_nl = MUX_s_1_2_2(mux_177_nl, mux_174_nl, fsm_output[1]);
  assign mux_187_nl = MUX_s_1_2_2(mux_186_nl, mux_178_nl, fsm_output[0]);
  assign or_150_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b000)
      | (fsm_output[7:5]!=3'b001) | nand_146_cse;
  assign or_148_nl = (fsm_output[2]) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b000) |
      (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign mux_170_nl = MUX_s_1_2_2(or_150_nl, or_148_nl, fsm_output[4]);
  assign or_146_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b000) | (fsm_output[6:5]!=2'b00)
      | nand_147_cse;
  assign mux_169_nl = MUX_s_1_2_2(or_146_nl, or_tmp_125, fsm_output[2]);
  assign or_147_nl = (fsm_output[4]) | mux_169_nl;
  assign mux_171_nl = MUX_s_1_2_2(mux_170_nl, or_147_nl, fsm_output[1]);
  assign or_142_nl = (fsm_output[2]) | (VEC_LOOP_j_sva_9_0[2:0]!=3'b000) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign or_141_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_13_psp_sva[0]) | (VEC_LOOP_j_sva_9_0[1:0]!=2'b00)
      | (~ (fsm_output[5])) | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (~ (fsm_output[3]));
  assign mux_167_nl = MUX_s_1_2_2(or_142_nl, or_141_nl, fsm_output[4]);
  assign nand_2_nl = ~((fsm_output[4]) & (~ mux_tmp_139));
  assign mux_168_nl = MUX_s_1_2_2(mux_167_nl, nand_2_nl, fsm_output[1]);
  assign mux_172_nl = MUX_s_1_2_2(mux_171_nl, mux_168_nl, fsm_output[0]);
  assign or_135_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]!=3'b000);
  assign mux_188_nl = MUX_s_1_2_2(mux_187_nl, mux_172_nl, or_135_nl);
  assign vec_rsc_0_0_i_we_d_pff = ~ mux_188_nl;
  assign nor_243_nl = ~((VEC_LOOP_j_sva_9_0[2:1]!=2'b00) | (fsm_output[0]) | (VEC_LOOP_j_sva_9_0[0])
      | (fsm_output[4:1]!=4'b1010));
  assign nor_244_nl = ~((z_out_7_10_1[2:0]!=3'b000) | (fsm_output[4:0]!=5'b00101));
  assign mux_201_nl = MUX_s_1_2_2(nor_243_nl, nor_244_nl, fsm_output[5]);
  assign nor_245_nl = ~((z_out_7_10_1[2:0]!=3'b000) | (fsm_output[4:1]!=4'b1010));
  assign nor_246_nl = ~((COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b000) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[4:1]!=4'b0001));
  assign mux_199_nl = MUX_s_1_2_2(nor_245_nl, nor_246_nl, fsm_output[0]);
  assign nor_247_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b00) | (fsm_output[0])
      | (VEC_LOOP_j_sva_9_0[0]) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4:1]!=4'b1001));
  assign mux_200_nl = MUX_s_1_2_2(mux_199_nl, nor_247_nl, fsm_output[5]);
  assign mux_202_nl = MUX_s_1_2_2(mux_201_nl, mux_200_nl, fsm_output[6]);
  assign nor_248_nl = ~((z_out_7_10_1[2:0]!=3'b000) | (fsm_output[4:0]!=5'b10000));
  assign nor_249_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b00) | (VEC_LOOP_j_sva_9_0[0])
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4]) | (~ and_223_cse));
  assign nor_250_nl = ~((z_out_7_10_1[2:0]!=3'b000) | nand_90_cse);
  assign mux_196_nl = MUX_s_1_2_2(nor_249_nl, nor_250_nl, fsm_output[0]);
  assign mux_197_nl = MUX_s_1_2_2(nor_248_nl, mux_196_nl, fsm_output[5]);
  assign nor_251_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b000) | (~ (fsm_output[0]))
      | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm) | (fsm_output[4:1]!=4'b1110));
  assign nor_252_nl = ~((z_out_7_10_1[2:0]!=3'b000) | (fsm_output[0]) | (fsm_output[4])
      | (~ and_223_cse));
  assign mux_195_nl = MUX_s_1_2_2(nor_251_nl, nor_252_nl, fsm_output[5]);
  assign mux_198_nl = MUX_s_1_2_2(mux_197_nl, mux_195_nl, fsm_output[6]);
  assign mux_203_nl = MUX_s_1_2_2(mux_202_nl, mux_198_nl, fsm_output[8]);
  assign or_181_nl = (z_out_7_10_1[2:0]!=3'b000) | (fsm_output[4:0]!=5'b00011);
  assign or_179_nl = (z_out_7_10_1[2:0]!=3'b000) | (fsm_output[4:1]!=4'b1001);
  assign or_177_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b000) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm)
      | (fsm_output[4:1]!=4'b0000);
  assign mux_192_nl = MUX_s_1_2_2(or_179_nl, or_177_nl, fsm_output[0]);
  assign mux_193_nl = MUX_s_1_2_2(or_181_nl, mux_192_nl, fsm_output[5]);
  assign or_176_nl = (COMP_LOOP_acc_13_psp_sva[0]) | (VEC_LOOP_j_sva_9_0[1]) | (fsm_output[0])
      | (VEC_LOOP_j_sva_9_0[0]) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4:1]!=4'b1000);
  assign nor_254_nl = ~((z_out_7_10_1[2:0]!=3'b000) | (fsm_output[3:1]!=3'b000));
  assign mux_189_nl = MUX_s_1_2_2(nor_254_nl, and_223_cse, fsm_output[4]);
  assign nor_255_nl = ~((fsm_output[4]) | (z_out_7_10_1[2:0]!=3'b000) | (fsm_output[3:1]!=3'b000));
  assign or_173_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b000) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm);
  assign mux_190_nl = MUX_s_1_2_2(mux_189_nl, nor_255_nl, or_173_nl);
  assign nand_3_nl = ~((fsm_output[0]) & mux_190_nl);
  assign mux_191_nl = MUX_s_1_2_2(or_176_nl, nand_3_nl, fsm_output[5]);
  assign mux_194_nl = MUX_s_1_2_2(mux_193_nl, mux_191_nl, fsm_output[6]);
  assign nor_253_nl = ~((fsm_output[8]) | mux_194_nl);
  assign vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_203_nl,
      nor_253_nl, fsm_output[7]);
  assign or_234_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b001) | (fsm_output[7:5]!=3'b001)
      | nand_146_cse;
  assign mux_223_nl = MUX_s_1_2_2(or_172_cse, or_234_nl, fsm_output[2]);
  assign or_232_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b001) | (~ (fsm_output[5]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_222_nl = MUX_s_1_2_2(or_232_nl, or_168_cse, fsm_output[2]);
  assign mux_224_nl = MUX_s_1_2_2(mux_223_nl, mux_222_nl, fsm_output[4]);
  assign or_226_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b001);
  assign mux_219_nl = MUX_s_1_2_2(or_166_cse, or_164_cse, or_226_nl);
  assign mux_220_nl = MUX_s_1_2_2(mux_219_nl, or_tmp_188, fsm_output[2]);
  assign mux_221_nl = MUX_s_1_2_2(mux_220_nl, nand_129_cse, fsm_output[4]);
  assign mux_225_nl = MUX_s_1_2_2(mux_224_nl, mux_221_nl, fsm_output[1]);
  assign or_223_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b001) | (fsm_output[5]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_215_nl = MUX_s_1_2_2(or_223_nl, or_159_cse, fsm_output[2]);
  assign or_219_nl = (COMP_LOOP_acc_13_psp_sva[0]) | (VEC_LOOP_j_sva_9_0[1:0]!=2'b01)
      | (~ (fsm_output[5])) | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (~ (fsm_output[3]));
  assign mux_214_nl = MUX_s_1_2_2(or_157_cse, or_219_nl, fsm_output[2]);
  assign mux_216_nl = MUX_s_1_2_2(mux_215_nl, mux_214_nl, fsm_output[4]);
  assign mux_213_nl = MUX_s_1_2_2(mux_173_cse, mux_tmp_178, fsm_output[4]);
  assign mux_217_nl = MUX_s_1_2_2(mux_216_nl, mux_213_nl, fsm_output[1]);
  assign mux_226_nl = MUX_s_1_2_2(mux_225_nl, mux_217_nl, fsm_output[0]);
  assign or_213_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b001)
      | (fsm_output[7:5]!=3'b001) | nand_146_cse;
  assign or_211_nl = (fsm_output[2]) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b001) |
      (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign mux_209_nl = MUX_s_1_2_2(or_213_nl, or_211_nl, fsm_output[4]);
  assign or_209_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b001) | (fsm_output[6:5]!=2'b00)
      | nand_147_cse;
  assign mux_208_nl = MUX_s_1_2_2(or_209_nl, or_tmp_188, fsm_output[2]);
  assign or_210_nl = (fsm_output[4]) | mux_208_nl;
  assign mux_210_nl = MUX_s_1_2_2(mux_209_nl, or_210_nl, fsm_output[1]);
  assign or_205_nl = (fsm_output[2]) | (VEC_LOOP_j_sva_9_0[2:0]!=3'b001) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign or_204_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_13_psp_sva[0]) | (VEC_LOOP_j_sva_9_0[1:0]!=2'b01)
      | (~ (fsm_output[5])) | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (~ (fsm_output[3]));
  assign mux_206_nl = MUX_s_1_2_2(or_205_nl, or_204_nl, fsm_output[4]);
  assign nand_4_nl = ~((fsm_output[4]) & (~ mux_tmp_178));
  assign mux_207_nl = MUX_s_1_2_2(mux_206_nl, nand_4_nl, fsm_output[1]);
  assign mux_211_nl = MUX_s_1_2_2(mux_210_nl, mux_207_nl, fsm_output[0]);
  assign or_198_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]!=3'b001);
  assign mux_227_nl = MUX_s_1_2_2(mux_226_nl, mux_211_nl, or_198_nl);
  assign vec_rsc_0_1_i_we_d_pff = ~ mux_227_nl;
  assign nor_230_nl = ~((VEC_LOOP_j_sva_9_0[2:1]!=2'b00) | (fsm_output[0]) | (~ (VEC_LOOP_j_sva_9_0[0]))
      | (fsm_output[4:1]!=4'b1010));
  assign nor_231_nl = ~((z_out_7_10_1[2:0]!=3'b001) | (fsm_output[4:0]!=5'b00101));
  assign mux_240_nl = MUX_s_1_2_2(nor_230_nl, nor_231_nl, fsm_output[5]);
  assign nor_232_nl = ~((z_out_7_10_1[2:0]!=3'b001) | (fsm_output[4:1]!=4'b1010));
  assign nor_233_nl = ~((COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b001) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[4:1]!=4'b0001));
  assign mux_238_nl = MUX_s_1_2_2(nor_232_nl, nor_233_nl, fsm_output[0]);
  assign nor_234_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b00) | (fsm_output[0])
      | (~ (VEC_LOOP_j_sva_9_0[0])) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4:1]!=4'b1001));
  assign mux_239_nl = MUX_s_1_2_2(mux_238_nl, nor_234_nl, fsm_output[5]);
  assign mux_241_nl = MUX_s_1_2_2(mux_240_nl, mux_239_nl, fsm_output[6]);
  assign nor_235_nl = ~((z_out_7_10_1[2:0]!=3'b001) | (fsm_output[4:0]!=5'b10000));
  assign nor_236_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b00) | (~ (VEC_LOOP_j_sva_9_0[0]))
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4]) | (~ and_223_cse));
  assign nor_237_nl = ~((z_out_7_10_1[2:0]!=3'b001) | nand_90_cse);
  assign mux_235_nl = MUX_s_1_2_2(nor_236_nl, nor_237_nl, fsm_output[0]);
  assign mux_236_nl = MUX_s_1_2_2(nor_235_nl, mux_235_nl, fsm_output[5]);
  assign nor_238_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b001) | (~ (fsm_output[0]))
      | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm) | (fsm_output[4:1]!=4'b1110));
  assign nor_239_nl = ~((z_out_7_10_1[2:0]!=3'b001) | (fsm_output[0]) | (fsm_output[4])
      | (~ and_223_cse));
  assign mux_234_nl = MUX_s_1_2_2(nor_238_nl, nor_239_nl, fsm_output[5]);
  assign mux_237_nl = MUX_s_1_2_2(mux_236_nl, mux_234_nl, fsm_output[6]);
  assign mux_242_nl = MUX_s_1_2_2(mux_241_nl, mux_237_nl, fsm_output[8]);
  assign or_244_nl = (z_out_7_10_1[2:0]!=3'b001) | (fsm_output[4:0]!=5'b00011);
  assign or_242_nl = (z_out_7_10_1[2:0]!=3'b001) | (fsm_output[4:1]!=4'b1001);
  assign or_240_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b001) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm)
      | (fsm_output[4:1]!=4'b0000);
  assign mux_231_nl = MUX_s_1_2_2(or_242_nl, or_240_nl, fsm_output[0]);
  assign mux_232_nl = MUX_s_1_2_2(or_244_nl, mux_231_nl, fsm_output[5]);
  assign or_239_nl = (COMP_LOOP_acc_13_psp_sva[0]) | (VEC_LOOP_j_sva_9_0[1]) | (fsm_output[0])
      | (~ (VEC_LOOP_j_sva_9_0[0])) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4:1]!=4'b1000);
  assign nor_241_nl = ~((z_out_7_10_1[2:0]!=3'b001) | (fsm_output[3:1]!=3'b000));
  assign mux_228_nl = MUX_s_1_2_2(nor_241_nl, and_223_cse, fsm_output[4]);
  assign nor_242_nl = ~((fsm_output[4]) | (z_out_7_10_1[2:0]!=3'b001) | (fsm_output[3:1]!=3'b000));
  assign or_236_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b001) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm);
  assign mux_229_nl = MUX_s_1_2_2(mux_228_nl, nor_242_nl, or_236_nl);
  assign nand_5_nl = ~((fsm_output[0]) & mux_229_nl);
  assign mux_230_nl = MUX_s_1_2_2(or_239_nl, nand_5_nl, fsm_output[5]);
  assign mux_233_nl = MUX_s_1_2_2(mux_232_nl, mux_230_nl, fsm_output[6]);
  assign nor_240_nl = ~((fsm_output[8]) | mux_233_nl);
  assign vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_242_nl,
      nor_240_nl, fsm_output[7]);
  assign or_297_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b010) | (fsm_output[7:5]!=3'b001)
      | nand_146_cse;
  assign mux_262_nl = MUX_s_1_2_2(or_172_cse, or_297_nl, fsm_output[2]);
  assign or_295_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b010) | (~ (fsm_output[5]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_261_nl = MUX_s_1_2_2(or_295_nl, or_168_cse, fsm_output[2]);
  assign mux_263_nl = MUX_s_1_2_2(mux_262_nl, mux_261_nl, fsm_output[4]);
  assign or_289_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b010);
  assign mux_258_nl = MUX_s_1_2_2(or_166_cse, or_164_cse, or_289_nl);
  assign mux_259_nl = MUX_s_1_2_2(mux_258_nl, or_tmp_251, fsm_output[2]);
  assign mux_260_nl = MUX_s_1_2_2(mux_259_nl, nand_129_cse, fsm_output[4]);
  assign mux_264_nl = MUX_s_1_2_2(mux_263_nl, mux_260_nl, fsm_output[1]);
  assign or_286_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b010) | (fsm_output[5]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_254_nl = MUX_s_1_2_2(or_286_nl, or_159_cse, fsm_output[2]);
  assign or_282_nl = (COMP_LOOP_acc_13_psp_sva[0]) | (VEC_LOOP_j_sva_9_0[1:0]!=2'b10)
      | (~ (fsm_output[5])) | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (~ (fsm_output[3]));
  assign mux_253_nl = MUX_s_1_2_2(or_157_cse, or_282_nl, fsm_output[2]);
  assign mux_255_nl = MUX_s_1_2_2(mux_254_nl, mux_253_nl, fsm_output[4]);
  assign mux_252_nl = MUX_s_1_2_2(mux_173_cse, mux_tmp_217, fsm_output[4]);
  assign mux_256_nl = MUX_s_1_2_2(mux_255_nl, mux_252_nl, fsm_output[1]);
  assign mux_265_nl = MUX_s_1_2_2(mux_264_nl, mux_256_nl, fsm_output[0]);
  assign or_276_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b010)
      | (fsm_output[7:5]!=3'b001) | nand_146_cse;
  assign or_274_nl = (fsm_output[2]) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b010) |
      (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign mux_248_nl = MUX_s_1_2_2(or_276_nl, or_274_nl, fsm_output[4]);
  assign or_272_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b010) | (fsm_output[6:5]!=2'b00)
      | nand_147_cse;
  assign mux_247_nl = MUX_s_1_2_2(or_272_nl, or_tmp_251, fsm_output[2]);
  assign or_273_nl = (fsm_output[4]) | mux_247_nl;
  assign mux_249_nl = MUX_s_1_2_2(mux_248_nl, or_273_nl, fsm_output[1]);
  assign or_268_nl = (fsm_output[2]) | (VEC_LOOP_j_sva_9_0[2:0]!=3'b010) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign or_267_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_13_psp_sva[0]) | (VEC_LOOP_j_sva_9_0[1:0]!=2'b10)
      | (~ (fsm_output[5])) | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (~ (fsm_output[3]));
  assign mux_245_nl = MUX_s_1_2_2(or_268_nl, or_267_nl, fsm_output[4]);
  assign nand_6_nl = ~((fsm_output[4]) & (~ mux_tmp_217));
  assign mux_246_nl = MUX_s_1_2_2(mux_245_nl, nand_6_nl, fsm_output[1]);
  assign mux_250_nl = MUX_s_1_2_2(mux_249_nl, mux_246_nl, fsm_output[0]);
  assign or_261_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]!=3'b010);
  assign mux_266_nl = MUX_s_1_2_2(mux_265_nl, mux_250_nl, or_261_nl);
  assign vec_rsc_0_2_i_we_d_pff = ~ mux_266_nl;
  assign nor_217_nl = ~((VEC_LOOP_j_sva_9_0[2:1]!=2'b01) | (fsm_output[0]) | (VEC_LOOP_j_sva_9_0[0])
      | (fsm_output[4:1]!=4'b1010));
  assign nor_218_nl = ~((z_out_7_10_1[2:0]!=3'b010) | (fsm_output[4:0]!=5'b00101));
  assign mux_279_nl = MUX_s_1_2_2(nor_217_nl, nor_218_nl, fsm_output[5]);
  assign nor_219_nl = ~((z_out_7_10_1[2:0]!=3'b010) | (fsm_output[4:1]!=4'b1010));
  assign nor_220_nl = ~((COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b010) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[4:1]!=4'b0001));
  assign mux_277_nl = MUX_s_1_2_2(nor_219_nl, nor_220_nl, fsm_output[0]);
  assign nor_221_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b01) | (fsm_output[0])
      | (VEC_LOOP_j_sva_9_0[0]) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4:1]!=4'b1001));
  assign mux_278_nl = MUX_s_1_2_2(mux_277_nl, nor_221_nl, fsm_output[5]);
  assign mux_280_nl = MUX_s_1_2_2(mux_279_nl, mux_278_nl, fsm_output[6]);
  assign nor_222_nl = ~((z_out_7_10_1[2:0]!=3'b010) | (fsm_output[4:0]!=5'b10000));
  assign nor_223_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b01) | (VEC_LOOP_j_sva_9_0[0])
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4]) | (~ and_223_cse));
  assign nor_224_nl = ~((z_out_7_10_1[0]) | (z_out_7_10_1[2]) | (~((z_out_7_10_1[1])
      & (fsm_output[4:1]==4'b1111))));
  assign mux_274_nl = MUX_s_1_2_2(nor_223_nl, nor_224_nl, fsm_output[0]);
  assign mux_275_nl = MUX_s_1_2_2(nor_222_nl, mux_274_nl, fsm_output[5]);
  assign nor_225_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b010) | (~ (fsm_output[0]))
      | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm) | (fsm_output[4:1]!=4'b1110));
  assign nor_226_nl = ~((z_out_7_10_1[2:0]!=3'b010) | (fsm_output[0]) | (fsm_output[4])
      | (~ and_223_cse));
  assign mux_273_nl = MUX_s_1_2_2(nor_225_nl, nor_226_nl, fsm_output[5]);
  assign mux_276_nl = MUX_s_1_2_2(mux_275_nl, mux_273_nl, fsm_output[6]);
  assign mux_281_nl = MUX_s_1_2_2(mux_280_nl, mux_276_nl, fsm_output[8]);
  assign or_307_nl = (z_out_7_10_1[2:0]!=3'b010) | (fsm_output[4:0]!=5'b00011);
  assign or_305_nl = (z_out_7_10_1[2:0]!=3'b010) | (fsm_output[4:1]!=4'b1001);
  assign or_303_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b010) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm)
      | (fsm_output[4:1]!=4'b0000);
  assign mux_270_nl = MUX_s_1_2_2(or_305_nl, or_303_nl, fsm_output[0]);
  assign mux_271_nl = MUX_s_1_2_2(or_307_nl, mux_270_nl, fsm_output[5]);
  assign or_302_nl = (COMP_LOOP_acc_13_psp_sva[0]) | (~ (VEC_LOOP_j_sva_9_0[1]))
      | (fsm_output[0]) | (VEC_LOOP_j_sva_9_0[0]) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[4:1]!=4'b1000);
  assign nor_228_nl = ~((z_out_7_10_1[2:0]!=3'b010) | (fsm_output[3:1]!=3'b000));
  assign mux_267_nl = MUX_s_1_2_2(nor_228_nl, and_223_cse, fsm_output[4]);
  assign nor_229_nl = ~((fsm_output[4]) | (z_out_7_10_1[2:0]!=3'b010) | (fsm_output[3:1]!=3'b000));
  assign or_299_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b010) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm);
  assign mux_268_nl = MUX_s_1_2_2(mux_267_nl, nor_229_nl, or_299_nl);
  assign nand_7_nl = ~((fsm_output[0]) & mux_268_nl);
  assign mux_269_nl = MUX_s_1_2_2(or_302_nl, nand_7_nl, fsm_output[5]);
  assign mux_272_nl = MUX_s_1_2_2(mux_271_nl, mux_269_nl, fsm_output[6]);
  assign nor_227_nl = ~((fsm_output[8]) | mux_272_nl);
  assign vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_281_nl,
      nor_227_nl, fsm_output[7]);
  assign or_360_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b011) | (fsm_output[7:5]!=3'b001)
      | nand_146_cse;
  assign mux_301_nl = MUX_s_1_2_2(or_172_cse, or_360_nl, fsm_output[2]);
  assign or_358_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b011) | (~ (fsm_output[5]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_300_nl = MUX_s_1_2_2(or_358_nl, or_168_cse, fsm_output[2]);
  assign mux_302_nl = MUX_s_1_2_2(mux_301_nl, mux_300_nl, fsm_output[4]);
  assign or_352_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b011);
  assign mux_297_nl = MUX_s_1_2_2(or_166_cse, or_164_cse, or_352_nl);
  assign mux_298_nl = MUX_s_1_2_2(mux_297_nl, or_tmp_314, fsm_output[2]);
  assign mux_299_nl = MUX_s_1_2_2(mux_298_nl, nand_129_cse, fsm_output[4]);
  assign mux_303_nl = MUX_s_1_2_2(mux_302_nl, mux_299_nl, fsm_output[1]);
  assign or_349_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b011) | (fsm_output[5]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_293_nl = MUX_s_1_2_2(or_349_nl, or_159_cse, fsm_output[2]);
  assign nand_126_nl = ~((~ (COMP_LOOP_acc_13_psp_sva[0])) & (VEC_LOOP_j_sva_9_0[1:0]==2'b11)
      & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[3]));
  assign mux_292_nl = MUX_s_1_2_2(or_157_cse, nand_126_nl, fsm_output[2]);
  assign mux_294_nl = MUX_s_1_2_2(mux_293_nl, mux_292_nl, fsm_output[4]);
  assign mux_291_nl = MUX_s_1_2_2(mux_173_cse, mux_tmp_256, fsm_output[4]);
  assign mux_295_nl = MUX_s_1_2_2(mux_294_nl, mux_291_nl, fsm_output[1]);
  assign mux_304_nl = MUX_s_1_2_2(mux_303_nl, mux_295_nl, fsm_output[0]);
  assign or_339_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b011)
      | (fsm_output[7:5]!=3'b001) | nand_146_cse;
  assign or_337_nl = (fsm_output[2]) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b011) |
      (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign mux_287_nl = MUX_s_1_2_2(or_339_nl, or_337_nl, fsm_output[4]);
  assign or_335_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b011) | (fsm_output[6:5]!=2'b00)
      | nand_147_cse;
  assign mux_286_nl = MUX_s_1_2_2(or_335_nl, or_tmp_314, fsm_output[2]);
  assign or_336_nl = (fsm_output[4]) | mux_286_nl;
  assign mux_288_nl = MUX_s_1_2_2(mux_287_nl, or_336_nl, fsm_output[1]);
  assign or_331_nl = (fsm_output[2]) | (VEC_LOOP_j_sva_9_0[2:0]!=3'b011) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign nand_112_nl = ~((fsm_output[2]) & (~ (COMP_LOOP_acc_13_psp_sva[0])) & (VEC_LOOP_j_sva_9_0[1:0]==2'b11)
      & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[3]));
  assign mux_284_nl = MUX_s_1_2_2(or_331_nl, nand_112_nl, fsm_output[4]);
  assign nand_8_nl = ~((fsm_output[4]) & (~ mux_tmp_256));
  assign mux_285_nl = MUX_s_1_2_2(mux_284_nl, nand_8_nl, fsm_output[1]);
  assign mux_289_nl = MUX_s_1_2_2(mux_288_nl, mux_285_nl, fsm_output[0]);
  assign or_324_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]!=3'b011);
  assign mux_305_nl = MUX_s_1_2_2(mux_304_nl, mux_289_nl, or_324_nl);
  assign vec_rsc_0_3_i_we_d_pff = ~ mux_305_nl;
  assign nand_117_nl = ~((COMP_LOOP_acc_1_cse_2_sva[2:0]==3'b011) & (fsm_output[0])
      & (fsm_output[6]) & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm & (~ (fsm_output[4]))
      & (fsm_output[1]));
  assign or_386_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b011) | (~ (fsm_output[4])) | (fsm_output[1]);
  assign or_385_nl = (z_out_7_10_1[2:0]!=3'b011) | (~ (fsm_output[4])) | (fsm_output[1]);
  assign mux_316_nl = MUX_s_1_2_2(or_386_nl, or_385_nl, fsm_output[6]);
  assign or_387_nl = (fsm_output[0]) | mux_316_nl;
  assign mux_317_nl = MUX_s_1_2_2(nand_117_nl, or_387_nl, fsm_output[2]);
  assign or_384_nl = (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b01) | (fsm_output[0]) | (~
      (fsm_output[6])) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (~((VEC_LOOP_j_sva_9_0[0])
      & (fsm_output[4]) & (fsm_output[1])));
  assign or_382_nl = (z_out_7_10_1[2:0]!=3'b011) | (~ (fsm_output[0])) | (fsm_output[6])
      | (fsm_output[4]) | (fsm_output[1]);
  assign mux_315_nl = MUX_s_1_2_2(or_384_nl, or_382_nl, fsm_output[2]);
  assign mux_318_nl = MUX_s_1_2_2(mux_317_nl, mux_315_nl, fsm_output[5]);
  assign nor_211_nl = ~((fsm_output[3]) | mux_318_nl);
  assign nor_212_nl = ~((fsm_output[5]) | (fsm_output[2]) | (z_out_7_10_1[2:0]!=3'b011)
      | (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[4])) | (fsm_output[1]));
  assign and_214_nl = (fsm_output[2]) & (COMP_LOOP_acc_1_cse_sva[2:0]==3'b011) &
      (fsm_output[0]) & (fsm_output[6]) & COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm &
      (fsm_output[4]) & (~ (fsm_output[1]));
  assign nor_213_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b01) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (~ (VEC_LOOP_j_sva_9_0[0])) | (fsm_output[4]) | (~ (fsm_output[1])));
  assign nor_214_nl = ~((z_out_7_10_1[2:0]!=3'b011) | (fsm_output[4]) | (~ (fsm_output[1])));
  assign mux_311_nl = MUX_s_1_2_2(nor_213_nl, nor_214_nl, fsm_output[6]);
  assign nor_215_nl = ~((z_out_7_10_1[2:0]!=3'b011) | (fsm_output[6]) | not_tmp_120);
  assign mux_312_nl = MUX_s_1_2_2(mux_311_nl, nor_215_nl, fsm_output[0]);
  assign and_215_nl = (fsm_output[2]) & mux_312_nl;
  assign mux_313_nl = MUX_s_1_2_2(and_214_nl, and_215_nl, fsm_output[5]);
  assign mux_314_nl = MUX_s_1_2_2(nor_212_nl, mux_313_nl, fsm_output[3]);
  assign mux_319_nl = MUX_s_1_2_2(nor_211_nl, mux_314_nl, fsm_output[8]);
  assign nand_74_nl = ~((~ (COMP_LOOP_acc_13_psp_sva[0])) & (fsm_output[6]) & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm
      & (VEC_LOOP_j_sva_9_0[1:0]==2'b11) & (fsm_output[4]) & (~ (fsm_output[1])));
  assign or_370_nl = (z_out_7_10_1[2:0]!=3'b011) | (fsm_output[6]) | (fsm_output[4])
      | (~ (fsm_output[1]));
  assign mux_308_nl = MUX_s_1_2_2(nand_74_nl, or_370_nl, fsm_output[0]);
  assign or_372_nl = (fsm_output[2]) | mux_308_nl;
  assign or_367_nl = (z_out_7_10_1[2:0]!=3'b011) | (fsm_output[6]) | not_tmp_120;
  assign or_365_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b011) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm)
      | (fsm_output[4]) | (fsm_output[1]);
  assign or_364_nl = (z_out_7_10_1[2:0]!=3'b011) | (fsm_output[4]) | (fsm_output[1]);
  assign mux_306_nl = MUX_s_1_2_2(or_365_nl, or_364_nl, fsm_output[6]);
  assign mux_307_nl = MUX_s_1_2_2(or_367_nl, mux_306_nl, fsm_output[0]);
  assign or_368_nl = (fsm_output[2]) | mux_307_nl;
  assign mux_309_nl = MUX_s_1_2_2(or_372_nl, or_368_nl, fsm_output[5]);
  assign or_363_nl = (~((fsm_output[5]) & (fsm_output[2]) & (COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b011)
      & (fsm_output[0]) & (fsm_output[6]) & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm))
      | not_tmp_120;
  assign mux_310_nl = MUX_s_1_2_2(mux_309_nl, or_363_nl, fsm_output[3]);
  assign nor_216_nl = ~((fsm_output[8]) | mux_310_nl);
  assign vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_319_nl,
      nor_216_nl, fsm_output[7]);
  assign or_426_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b100)
      | (fsm_output[7:5]!=3'b001) | nand_146_cse;
  assign or_424_nl = (fsm_output[2]) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b100) |
      (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign mux_340_nl = MUX_s_1_2_2(or_426_nl, or_424_nl, fsm_output[4]);
  assign or_422_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b100) | (fsm_output[6:5]!=2'b00)
      | nand_147_cse;
  assign mux_339_nl = MUX_s_1_2_2(or_422_nl, or_tmp_389, fsm_output[2]);
  assign or_423_nl = (fsm_output[4]) | mux_339_nl;
  assign mux_341_nl = MUX_s_1_2_2(mux_340_nl, or_423_nl, fsm_output[1]);
  assign or_420_nl = (fsm_output[2]) | (VEC_LOOP_j_sva_9_0[2:0]!=3'b100) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign or_419_nl = (~ (fsm_output[2])) | (~ (COMP_LOOP_acc_13_psp_sva[0])) | (VEC_LOOP_j_sva_9_0[1:0]!=2'b00)
      | (~ (fsm_output[5])) | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (~ (fsm_output[3]));
  assign mux_337_nl = MUX_s_1_2_2(or_420_nl, or_419_nl, fsm_output[4]);
  assign nand_10_nl = ~((fsm_output[4]) & (~ mux_tmp_294));
  assign mux_338_nl = MUX_s_1_2_2(mux_337_nl, nand_10_nl, fsm_output[1]);
  assign mux_342_nl = MUX_s_1_2_2(mux_341_nl, mux_338_nl, fsm_output[0]);
  assign or_416_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b100) | (fsm_output[7:5]!=3'b001)
      | nand_146_cse;
  assign mux_333_nl = MUX_s_1_2_2(or_172_cse, or_416_nl, fsm_output[2]);
  assign or_414_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b100) | (~ (fsm_output[5]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_332_nl = MUX_s_1_2_2(or_414_nl, or_168_cse, fsm_output[2]);
  assign mux_334_nl = MUX_s_1_2_2(mux_333_nl, mux_332_nl, fsm_output[4]);
  assign nor_73_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b100));
  assign mux_329_nl = MUX_s_1_2_2(or_164_cse, or_166_cse, nor_73_nl);
  assign mux_330_nl = MUX_s_1_2_2(mux_329_nl, or_tmp_389, fsm_output[2]);
  assign mux_331_nl = MUX_s_1_2_2(mux_330_nl, nand_129_cse, fsm_output[4]);
  assign mux_335_nl = MUX_s_1_2_2(mux_334_nl, mux_331_nl, fsm_output[1]);
  assign or_404_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b100) | (fsm_output[5]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_325_nl = MUX_s_1_2_2(or_404_nl, or_159_cse, fsm_output[2]);
  assign or_400_nl = (~ (COMP_LOOP_acc_13_psp_sva[0])) | (VEC_LOOP_j_sva_9_0[1:0]!=2'b00)
      | (~ (fsm_output[5])) | (~ (fsm_output[6])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (~ (fsm_output[3]));
  assign mux_324_nl = MUX_s_1_2_2(or_157_cse, or_400_nl, fsm_output[2]);
  assign mux_326_nl = MUX_s_1_2_2(mux_325_nl, mux_324_nl, fsm_output[4]);
  assign mux_323_nl = MUX_s_1_2_2(mux_173_cse, mux_tmp_294, fsm_output[4]);
  assign mux_327_nl = MUX_s_1_2_2(mux_326_nl, mux_323_nl, fsm_output[1]);
  assign mux_336_nl = MUX_s_1_2_2(mux_335_nl, mux_327_nl, fsm_output[0]);
  assign nor_70_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]!=3'b100));
  assign mux_343_nl = MUX_s_1_2_2(mux_342_nl, mux_336_nl, nor_70_nl);
  assign vec_rsc_0_4_i_we_d_pff = ~ mux_343_nl;
  assign or_451_nl = (VEC_LOOP_j_sva_9_0[2:1]!=2'b10) | (fsm_output[0]) | (VEC_LOOP_j_sva_9_0[0])
      | (~ (fsm_output[2])) | (~ (fsm_output[4])) | (fsm_output[1]);
  assign or_450_nl = (z_out_7_10_1[2:0]!=3'b100) | (~ (fsm_output[0])) | (~ (fsm_output[2]))
      | (fsm_output[4]) | (fsm_output[1]);
  assign mux_355_nl = MUX_s_1_2_2(or_451_nl, or_450_nl, fsm_output[5]);
  assign or_449_nl = (z_out_7_10_1[2:0]!=3'b100) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (fsm_output[1]);
  assign or_448_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b100) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[1]));
  assign mux_353_nl = MUX_s_1_2_2(or_449_nl, or_448_nl, fsm_output[0]);
  assign or_446_nl = (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b10) | (fsm_output[0]) | (VEC_LOOP_j_sva_9_0[0])
      | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[2]) | not_tmp_120;
  assign mux_354_nl = MUX_s_1_2_2(mux_353_nl, or_446_nl, fsm_output[5]);
  assign mux_356_nl = MUX_s_1_2_2(mux_355_nl, mux_354_nl, fsm_output[6]);
  assign nor_204_nl = ~((fsm_output[3]) | mux_356_nl);
  assign nor_205_nl = ~((fsm_output[6:5]!=2'b00) | (z_out_7_10_1[2:0]!=3'b100) |
      (fsm_output[0]) | (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[1]));
  assign nor_206_nl = ~((VEC_LOOP_j_sva_9_0[0]) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (COMP_LOOP_acc_14_psp_sva[1:0]!=2'b10) | (~ (fsm_output[2])) | (fsm_output[4])
      | (~ (fsm_output[1])));
  assign nor_207_nl = ~((z_out_7_10_1[2:0]!=3'b100) | not_tmp_130);
  assign mux_350_nl = MUX_s_1_2_2(nor_206_nl, nor_207_nl, fsm_output[0]);
  assign and_213_nl = (fsm_output[5]) & mux_350_nl;
  assign nor_208_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b100) | (~ (fsm_output[0]))
      | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (fsm_output[1]));
  assign nor_209_nl = ~((z_out_7_10_1[2:0]!=3'b100) | (fsm_output[0]) | (~ (fsm_output[2]))
      | (fsm_output[4]) | (~ (fsm_output[1])));
  assign mux_349_nl = MUX_s_1_2_2(nor_208_nl, nor_209_nl, fsm_output[5]);
  assign mux_351_nl = MUX_s_1_2_2(and_213_nl, mux_349_nl, fsm_output[6]);
  assign mux_352_nl = MUX_s_1_2_2(nor_205_nl, mux_351_nl, fsm_output[3]);
  assign mux_357_nl = MUX_s_1_2_2(nor_204_nl, mux_352_nl, fsm_output[8]);
  assign or_435_nl = (z_out_7_10_1[2:0]!=3'b100) | (~ (fsm_output[0])) | (fsm_output[2])
      | (fsm_output[4]) | (~ (fsm_output[1]));
  assign or_433_nl = (z_out_7_10_1[2:0]!=3'b100) | (fsm_output[2]) | not_tmp_120;
  assign or_431_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b100) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm)
      | (fsm_output[2]) | (fsm_output[4]) | (fsm_output[1]);
  assign mux_345_nl = MUX_s_1_2_2(or_433_nl, or_431_nl, fsm_output[0]);
  assign mux_346_nl = MUX_s_1_2_2(or_435_nl, mux_345_nl, fsm_output[5]);
  assign or_430_nl = (~ (COMP_LOOP_acc_13_psp_sva[0])) | (VEC_LOOP_j_sva_9_0[1])
      | (fsm_output[0]) | (VEC_LOOP_j_sva_9_0[0]) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[1]);
  assign or_429_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (z_out_7_10_1[2:0]!=3'b100)
      | (fsm_output[4]) | (fsm_output[1]);
  assign mux_344_nl = MUX_s_1_2_2(or_430_nl, or_429_nl, fsm_output[5]);
  assign mux_347_nl = MUX_s_1_2_2(mux_346_nl, mux_344_nl, fsm_output[6]);
  assign or_428_nl = (~((fsm_output[6]) & (fsm_output[5]) & (fsm_output[0]) & (COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b100)
      & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)) | not_tmp_130;
  assign mux_348_nl = MUX_s_1_2_2(mux_347_nl, or_428_nl, fsm_output[3]);
  assign nor_210_nl = ~((fsm_output[8]) | mux_348_nl);
  assign vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_357_nl,
      nor_210_nl, fsm_output[7]);
  assign or_488_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b101)
      | (fsm_output[7:5]!=3'b001) | nand_146_cse;
  assign or_486_nl = (fsm_output[2]) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b101) |
      (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign mux_378_nl = MUX_s_1_2_2(or_488_nl, or_486_nl, fsm_output[4]);
  assign or_484_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b101) | (fsm_output[6:5]!=2'b00)
      | nand_147_cse;
  assign mux_377_nl = MUX_s_1_2_2(or_484_nl, or_tmp_451, fsm_output[2]);
  assign or_485_nl = (fsm_output[4]) | mux_377_nl;
  assign mux_379_nl = MUX_s_1_2_2(mux_378_nl, or_485_nl, fsm_output[1]);
  assign or_482_nl = (fsm_output[2]) | (VEC_LOOP_j_sva_9_0[2:0]!=3'b101) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign nand_122_nl = ~((fsm_output[2]) & (COMP_LOOP_acc_13_psp_sva[0]) & (VEC_LOOP_j_sva_9_0[1:0]==2'b01)
      & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[3]));
  assign mux_375_nl = MUX_s_1_2_2(or_482_nl, nand_122_nl, fsm_output[4]);
  assign nand_12_nl = ~((fsm_output[4]) & (~ mux_tmp_332));
  assign mux_376_nl = MUX_s_1_2_2(mux_375_nl, nand_12_nl, fsm_output[1]);
  assign mux_380_nl = MUX_s_1_2_2(mux_379_nl, mux_376_nl, fsm_output[0]);
  assign or_478_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b101) | (fsm_output[7:5]!=3'b001)
      | nand_146_cse;
  assign mux_371_nl = MUX_s_1_2_2(or_172_cse, or_478_nl, fsm_output[2]);
  assign or_476_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b101) | (~ (fsm_output[5]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_370_nl = MUX_s_1_2_2(or_476_nl, or_168_cse, fsm_output[2]);
  assign mux_372_nl = MUX_s_1_2_2(mux_371_nl, mux_370_nl, fsm_output[4]);
  assign nor_79_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b101));
  assign mux_367_nl = MUX_s_1_2_2(or_164_cse, or_166_cse, nor_79_nl);
  assign mux_368_nl = MUX_s_1_2_2(mux_367_nl, or_tmp_451, fsm_output[2]);
  assign mux_369_nl = MUX_s_1_2_2(mux_368_nl, nand_129_cse, fsm_output[4]);
  assign mux_373_nl = MUX_s_1_2_2(mux_372_nl, mux_369_nl, fsm_output[1]);
  assign or_466_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b101) | (fsm_output[5]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_363_nl = MUX_s_1_2_2(or_466_nl, or_159_cse, fsm_output[2]);
  assign nand_116_nl = ~((COMP_LOOP_acc_13_psp_sva[0]) & (VEC_LOOP_j_sva_9_0[1:0]==2'b01)
      & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[3]));
  assign mux_362_nl = MUX_s_1_2_2(or_157_cse, nand_116_nl, fsm_output[2]);
  assign mux_364_nl = MUX_s_1_2_2(mux_363_nl, mux_362_nl, fsm_output[4]);
  assign mux_361_nl = MUX_s_1_2_2(mux_173_cse, mux_tmp_332, fsm_output[4]);
  assign mux_365_nl = MUX_s_1_2_2(mux_364_nl, mux_361_nl, fsm_output[1]);
  assign mux_374_nl = MUX_s_1_2_2(mux_373_nl, mux_365_nl, fsm_output[0]);
  assign nor_76_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]!=3'b101));
  assign mux_381_nl = MUX_s_1_2_2(mux_380_nl, mux_374_nl, nor_76_nl);
  assign vec_rsc_0_5_i_we_d_pff = ~ mux_381_nl;
  assign or_513_nl = (VEC_LOOP_j_sva_9_0[2:1]!=2'b10) | (fsm_output[0]) | (~ (VEC_LOOP_j_sva_9_0[0]))
      | (~ (fsm_output[2])) | (~ (fsm_output[4])) | (fsm_output[1]);
  assign or_512_nl = (z_out_7_10_1[2:0]!=3'b101) | (~ (fsm_output[0])) | (~ (fsm_output[2]))
      | (fsm_output[4]) | (fsm_output[1]);
  assign mux_393_nl = MUX_s_1_2_2(or_513_nl, or_512_nl, fsm_output[5]);
  assign or_511_nl = (z_out_7_10_1[2:0]!=3'b101) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (fsm_output[1]);
  assign or_510_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b101) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[1]));
  assign mux_391_nl = MUX_s_1_2_2(or_511_nl, or_510_nl, fsm_output[0]);
  assign or_508_nl = (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b10) | (fsm_output[0]) | (~
      (VEC_LOOP_j_sva_9_0[0])) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[2])
      | not_tmp_120;
  assign mux_392_nl = MUX_s_1_2_2(mux_391_nl, or_508_nl, fsm_output[5]);
  assign mux_394_nl = MUX_s_1_2_2(mux_393_nl, mux_392_nl, fsm_output[6]);
  assign nor_198_nl = ~((fsm_output[3]) | mux_394_nl);
  assign nor_199_nl = ~((fsm_output[6:5]!=2'b00) | (z_out_7_10_1[2:0]!=3'b101) |
      (fsm_output[0]) | (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[1]));
  assign and_252_nl = (VEC_LOOP_j_sva_9_0[0]) & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm
      & (COMP_LOOP_acc_14_psp_sva[1:0]==2'b10) & (fsm_output[2]) & (~ (fsm_output[4]))
      & (fsm_output[1]);
  assign nor_201_nl = ~((z_out_7_10_1[2:0]!=3'b101) | not_tmp_130);
  assign mux_388_nl = MUX_s_1_2_2(and_252_nl, nor_201_nl, fsm_output[0]);
  assign and_211_nl = (fsm_output[5]) & mux_388_nl;
  assign and_212_nl = (COMP_LOOP_acc_1_cse_sva[2:0]==3'b101) & (fsm_output[0]) &
      COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm & (fsm_output[2]) & (fsm_output[4]) &
      (~ (fsm_output[1]));
  assign nor_202_nl = ~((z_out_7_10_1[2:0]!=3'b101) | (fsm_output[0]) | (~ (fsm_output[2]))
      | (fsm_output[4]) | (~ (fsm_output[1])));
  assign mux_387_nl = MUX_s_1_2_2(and_212_nl, nor_202_nl, fsm_output[5]);
  assign mux_389_nl = MUX_s_1_2_2(and_211_nl, mux_387_nl, fsm_output[6]);
  assign mux_390_nl = MUX_s_1_2_2(nor_199_nl, mux_389_nl, fsm_output[3]);
  assign mux_395_nl = MUX_s_1_2_2(nor_198_nl, mux_390_nl, fsm_output[8]);
  assign or_497_nl = (z_out_7_10_1[2:0]!=3'b101) | (~ (fsm_output[0])) | (fsm_output[2])
      | (fsm_output[4]) | (~ (fsm_output[1]));
  assign or_495_nl = (z_out_7_10_1[2:0]!=3'b101) | (fsm_output[2]) | not_tmp_120;
  assign or_493_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b101) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm)
      | (fsm_output[2]) | (fsm_output[4]) | (fsm_output[1]);
  assign mux_383_nl = MUX_s_1_2_2(or_495_nl, or_493_nl, fsm_output[0]);
  assign mux_384_nl = MUX_s_1_2_2(or_497_nl, mux_383_nl, fsm_output[5]);
  assign or_492_nl = (~ (COMP_LOOP_acc_13_psp_sva[0])) | (VEC_LOOP_j_sva_9_0[1])
      | (fsm_output[0]) | (~ (VEC_LOOP_j_sva_9_0[0])) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[1]);
  assign or_491_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (z_out_7_10_1[2:0]!=3'b101)
      | (fsm_output[4]) | (fsm_output[1]);
  assign mux_382_nl = MUX_s_1_2_2(or_492_nl, or_491_nl, fsm_output[5]);
  assign mux_385_nl = MUX_s_1_2_2(mux_384_nl, mux_382_nl, fsm_output[6]);
  assign or_490_nl = (~((fsm_output[6]) & (fsm_output[5]) & (fsm_output[0]) & (COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b101)
      & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)) | not_tmp_130;
  assign mux_386_nl = MUX_s_1_2_2(mux_385_nl, or_490_nl, fsm_output[3]);
  assign nor_203_nl = ~((fsm_output[8]) | mux_386_nl);
  assign vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_395_nl,
      nor_203_nl, fsm_output[7]);
  assign or_550_nl = (~ (fsm_output[2])) | (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b110)
      | (fsm_output[7:5]!=3'b001) | nand_146_cse;
  assign or_548_nl = (fsm_output[2]) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b110) |
      (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign mux_416_nl = MUX_s_1_2_2(or_550_nl, or_548_nl, fsm_output[4]);
  assign or_546_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b110) | (fsm_output[6:5]!=2'b00)
      | nand_147_cse;
  assign mux_415_nl = MUX_s_1_2_2(or_546_nl, or_tmp_513, fsm_output[2]);
  assign or_547_nl = (fsm_output[4]) | mux_415_nl;
  assign mux_417_nl = MUX_s_1_2_2(mux_416_nl, or_547_nl, fsm_output[1]);
  assign or_544_nl = (fsm_output[2]) | (VEC_LOOP_j_sva_9_0[2:0]!=3'b110) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign nand_120_nl = ~((fsm_output[2]) & (COMP_LOOP_acc_13_psp_sva[0]) & (VEC_LOOP_j_sva_9_0[1:0]==2'b10)
      & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[3]));
  assign mux_413_nl = MUX_s_1_2_2(or_544_nl, nand_120_nl, fsm_output[4]);
  assign nand_14_nl = ~((fsm_output[4]) & (~ mux_tmp_370));
  assign mux_414_nl = MUX_s_1_2_2(mux_413_nl, nand_14_nl, fsm_output[1]);
  assign mux_418_nl = MUX_s_1_2_2(mux_417_nl, mux_414_nl, fsm_output[0]);
  assign or_540_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b110) | (fsm_output[7:5]!=3'b001)
      | nand_146_cse;
  assign mux_409_nl = MUX_s_1_2_2(or_172_cse, or_540_nl, fsm_output[2]);
  assign or_538_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b110) | (~ (fsm_output[5]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_408_nl = MUX_s_1_2_2(or_538_nl, or_168_cse, fsm_output[2]);
  assign mux_410_nl = MUX_s_1_2_2(mux_409_nl, mux_408_nl, fsm_output[4]);
  assign nor_85_nl = ~((COMP_LOOP_acc_1_cse_sva[2:0]!=3'b110));
  assign mux_405_nl = MUX_s_1_2_2(or_164_cse, or_166_cse, nor_85_nl);
  assign mux_406_nl = MUX_s_1_2_2(mux_405_nl, or_tmp_513, fsm_output[2]);
  assign mux_407_nl = MUX_s_1_2_2(mux_406_nl, nand_129_cse, fsm_output[4]);
  assign mux_411_nl = MUX_s_1_2_2(mux_410_nl, mux_407_nl, fsm_output[1]);
  assign or_528_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b110) | (fsm_output[5]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_401_nl = MUX_s_1_2_2(or_528_nl, or_159_cse, fsm_output[2]);
  assign nand_115_nl = ~((COMP_LOOP_acc_13_psp_sva[0]) & (VEC_LOOP_j_sva_9_0[1:0]==2'b10)
      & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[3]));
  assign mux_400_nl = MUX_s_1_2_2(or_157_cse, nand_115_nl, fsm_output[2]);
  assign mux_402_nl = MUX_s_1_2_2(mux_401_nl, mux_400_nl, fsm_output[4]);
  assign mux_399_nl = MUX_s_1_2_2(mux_173_cse, mux_tmp_370, fsm_output[4]);
  assign mux_403_nl = MUX_s_1_2_2(mux_402_nl, mux_399_nl, fsm_output[1]);
  assign mux_412_nl = MUX_s_1_2_2(mux_411_nl, mux_403_nl, fsm_output[0]);
  assign nor_82_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]!=3'b110));
  assign mux_419_nl = MUX_s_1_2_2(mux_418_nl, mux_412_nl, nor_82_nl);
  assign vec_rsc_0_6_i_we_d_pff = ~ mux_419_nl;
  assign nand_114_nl = ~((COMP_LOOP_acc_1_cse_2_sva[2:0]==3'b110) & (fsm_output[0])
      & (fsm_output[6]) & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm & (~ (fsm_output[4]))
      & (fsm_output[1]));
  assign or_575_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b110) | (~ (fsm_output[4])) | (fsm_output[1]);
  assign or_574_nl = (z_out_7_10_1[2:0]!=3'b110) | (~ (fsm_output[4])) | (fsm_output[1]);
  assign mux_430_nl = MUX_s_1_2_2(or_575_nl, or_574_nl, fsm_output[6]);
  assign or_576_nl = (fsm_output[0]) | mux_430_nl;
  assign mux_431_nl = MUX_s_1_2_2(nand_114_nl, or_576_nl, fsm_output[2]);
  assign or_573_nl = (COMP_LOOP_acc_11_psp_sva[1:0]!=2'b11) | (fsm_output[0]) | (~
      (fsm_output[6])) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (VEC_LOOP_j_sva_9_0[0])
      | not_tmp_120;
  assign or_571_nl = (z_out_7_10_1[2:0]!=3'b110) | (~ (fsm_output[0])) | (fsm_output[6])
      | (fsm_output[4]) | (fsm_output[1]);
  assign mux_429_nl = MUX_s_1_2_2(or_573_nl, or_571_nl, fsm_output[2]);
  assign mux_432_nl = MUX_s_1_2_2(mux_431_nl, mux_429_nl, fsm_output[5]);
  assign nor_192_nl = ~((fsm_output[3]) | mux_432_nl);
  assign nor_193_nl = ~((fsm_output[5]) | (fsm_output[2]) | (z_out_7_10_1[2:0]!=3'b110)
      | (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[4])) | (fsm_output[1]));
  assign and_209_nl = (fsm_output[2]) & (COMP_LOOP_acc_1_cse_sva[2:0]==3'b110) &
      (fsm_output[0]) & (fsm_output[6]) & COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm &
      (fsm_output[4]) & (~ (fsm_output[1]));
  assign nor_194_nl = ~((COMP_LOOP_acc_14_psp_sva[1:0]!=2'b11) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (VEC_LOOP_j_sva_9_0[0]) | (fsm_output[4]) | (~ (fsm_output[1])));
  assign nor_195_nl = ~((z_out_7_10_1[2:0]!=3'b110) | (fsm_output[4]) | (~ (fsm_output[1])));
  assign mux_425_nl = MUX_s_1_2_2(nor_194_nl, nor_195_nl, fsm_output[6]);
  assign nor_196_nl = ~((z_out_7_10_1[2:0]!=3'b110) | (fsm_output[6]) | not_tmp_120);
  assign mux_426_nl = MUX_s_1_2_2(mux_425_nl, nor_196_nl, fsm_output[0]);
  assign and_210_nl = (fsm_output[2]) & mux_426_nl;
  assign mux_427_nl = MUX_s_1_2_2(and_209_nl, and_210_nl, fsm_output[5]);
  assign mux_428_nl = MUX_s_1_2_2(nor_193_nl, mux_427_nl, fsm_output[3]);
  assign mux_433_nl = MUX_s_1_2_2(nor_192_nl, mux_428_nl, fsm_output[8]);
  assign nand_50_nl = ~((COMP_LOOP_acc_13_psp_sva[0]) & (fsm_output[6]) & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm
      & (VEC_LOOP_j_sva_9_0[1:0]==2'b10) & (fsm_output[4]) & (~ (fsm_output[1])));
  assign or_559_nl = (z_out_7_10_1[2:0]!=3'b110) | (fsm_output[6]) | (fsm_output[4])
      | (~ (fsm_output[1]));
  assign mux_422_nl = MUX_s_1_2_2(nand_50_nl, or_559_nl, fsm_output[0]);
  assign or_561_nl = (fsm_output[2]) | mux_422_nl;
  assign or_556_nl = (z_out_7_10_1[2:0]!=3'b110) | (fsm_output[6]) | not_tmp_120;
  assign or_554_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b110) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm)
      | (fsm_output[4]) | (fsm_output[1]);
  assign or_553_nl = (z_out_7_10_1[2:0]!=3'b110) | (fsm_output[4]) | (fsm_output[1]);
  assign mux_420_nl = MUX_s_1_2_2(or_554_nl, or_553_nl, fsm_output[6]);
  assign mux_421_nl = MUX_s_1_2_2(or_556_nl, mux_420_nl, fsm_output[0]);
  assign or_557_nl = (fsm_output[2]) | mux_421_nl;
  assign mux_423_nl = MUX_s_1_2_2(or_561_nl, or_557_nl, fsm_output[5]);
  assign or_552_nl = (~((fsm_output[5]) & (fsm_output[2]) & (COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b110)
      & (fsm_output[0]) & (fsm_output[6]) & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm))
      | not_tmp_120;
  assign mux_424_nl = MUX_s_1_2_2(mux_423_nl, or_552_nl, fsm_output[3]);
  assign nor_197_nl = ~((fsm_output[8]) | mux_424_nl);
  assign vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_433_nl,
      nor_197_nl, fsm_output[7]);
  assign or_615_nl = (~((fsm_output[2]) & (COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b111)
      & (fsm_output[7:5]==3'b001))) | nand_146_cse;
  assign or_613_nl = (fsm_output[2]) | (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b111) |
      (~ (fsm_output[5])) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]);
  assign mux_454_nl = MUX_s_1_2_2(or_615_nl, or_613_nl, fsm_output[4]);
  assign or_611_nl = (COMP_LOOP_acc_1_cse_sva[2:0]!=3'b111) | (fsm_output[6:5]!=2'b00)
      | nand_147_cse;
  assign mux_453_nl = MUX_s_1_2_2(or_611_nl, or_tmp_578, fsm_output[2]);
  assign or_612_nl = (fsm_output[4]) | mux_453_nl;
  assign mux_455_nl = MUX_s_1_2_2(mux_454_nl, or_612_nl, fsm_output[1]);
  assign or_609_nl = (fsm_output[2]) | (VEC_LOOP_j_sva_9_0[2:0]!=3'b111) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign nand_118_nl = ~((fsm_output[2]) & (COMP_LOOP_acc_13_psp_sva[0]) & (VEC_LOOP_j_sva_9_0[1:0]==2'b11)
      & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[3]));
  assign mux_451_nl = MUX_s_1_2_2(or_609_nl, nand_118_nl, fsm_output[4]);
  assign nand_16_nl = ~((fsm_output[4]) & (~ mux_tmp_408));
  assign mux_452_nl = MUX_s_1_2_2(mux_451_nl, nand_16_nl, fsm_output[1]);
  assign mux_456_nl = MUX_s_1_2_2(mux_455_nl, mux_452_nl, fsm_output[0]);
  assign or_605_nl = (COMP_LOOP_acc_1_cse_6_sva[2:0]!=3'b111) | (fsm_output[7:5]!=3'b001)
      | nand_146_cse;
  assign mux_447_nl = MUX_s_1_2_2(or_172_cse, or_605_nl, fsm_output[2]);
  assign or_603_nl = (COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b111) | (~ (fsm_output[5]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_446_nl = MUX_s_1_2_2(or_603_nl, or_168_cse, fsm_output[2]);
  assign mux_448_nl = MUX_s_1_2_2(mux_447_nl, mux_446_nl, fsm_output[4]);
  assign and_207_nl = (COMP_LOOP_acc_1_cse_sva[2:0]==3'b111);
  assign mux_443_nl = MUX_s_1_2_2(or_164_cse, or_166_cse, and_207_nl);
  assign mux_444_nl = MUX_s_1_2_2(mux_443_nl, or_tmp_578, fsm_output[2]);
  assign mux_445_nl = MUX_s_1_2_2(mux_444_nl, nand_129_cse, fsm_output[4]);
  assign mux_449_nl = MUX_s_1_2_2(mux_448_nl, mux_445_nl, fsm_output[1]);
  assign or_593_nl = (VEC_LOOP_j_sva_9_0[2:0]!=3'b111) | (fsm_output[5]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_439_nl = MUX_s_1_2_2(or_593_nl, or_159_cse, fsm_output[2]);
  assign nand_113_nl = ~((COMP_LOOP_acc_13_psp_sva[0]) & (VEC_LOOP_j_sva_9_0[1:0]==2'b11)
      & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[3]));
  assign mux_438_nl = MUX_s_1_2_2(or_157_cse, nand_113_nl, fsm_output[2]);
  assign mux_440_nl = MUX_s_1_2_2(mux_439_nl, mux_438_nl, fsm_output[4]);
  assign mux_437_nl = MUX_s_1_2_2(mux_173_cse, mux_tmp_408, fsm_output[4]);
  assign mux_441_nl = MUX_s_1_2_2(mux_440_nl, mux_437_nl, fsm_output[1]);
  assign mux_450_nl = MUX_s_1_2_2(mux_449_nl, mux_441_nl, fsm_output[0]);
  assign and_208_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]==3'b111);
  assign mux_457_nl = MUX_s_1_2_2(mux_456_nl, mux_450_nl, and_208_nl);
  assign vec_rsc_0_7_i_we_d_pff = ~ mux_457_nl;
  assign nor_183_nl = ~((VEC_LOOP_j_sva_9_0[2:1]!=2'b11) | (fsm_output[0]) | (~ (VEC_LOOP_j_sva_9_0[0]))
      | (fsm_output[4:1]!=4'b1010));
  assign nor_184_nl = ~((z_out_7_10_1[2:0]!=3'b111) | (fsm_output[4:0]!=5'b00101));
  assign mux_470_nl = MUX_s_1_2_2(nor_183_nl, nor_184_nl, fsm_output[5]);
  assign and_202_nl = (z_out_7_10_1[2:0]==3'b111) & (fsm_output[4:1]==4'b1010);
  assign nor_185_nl = ~((COMP_LOOP_acc_1_cse_2_sva[2:0]!=3'b111) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[4:1]!=4'b0001));
  assign mux_468_nl = MUX_s_1_2_2(and_202_nl, nor_185_nl, fsm_output[0]);
  assign nor_186_nl = ~((COMP_LOOP_acc_11_psp_sva[1:0]!=2'b11) | (fsm_output[0])
      | (~ (VEC_LOOP_j_sva_9_0[0])) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) | (fsm_output[4:1]!=4'b1001));
  assign mux_469_nl = MUX_s_1_2_2(mux_468_nl, nor_186_nl, fsm_output[5]);
  assign mux_471_nl = MUX_s_1_2_2(mux_470_nl, mux_469_nl, fsm_output[6]);
  assign nor_187_nl = ~((z_out_7_10_1[2:0]!=3'b111) | (fsm_output[4:0]!=5'b10000));
  assign and_203_nl = (COMP_LOOP_acc_14_psp_sva[1:0]==2'b11) & (VEC_LOOP_j_sva_9_0[0])
      & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm & (~ (fsm_output[4])) & and_223_cse;
  assign and_204_nl = (z_out_7_10_1[2:0]==3'b111) & (fsm_output[4:1]==4'b1111);
  assign mux_465_nl = MUX_s_1_2_2(and_203_nl, and_204_nl, fsm_output[0]);
  assign mux_466_nl = MUX_s_1_2_2(nor_187_nl, mux_465_nl, fsm_output[5]);
  assign and_205_nl = (COMP_LOOP_acc_1_cse_sva[2:0]==3'b111) & (fsm_output[0]) &
      COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm & (fsm_output[4:1]==4'b1110);
  assign nor_188_nl = ~((z_out_7_10_1[2:0]!=3'b111) | (fsm_output[0]) | (fsm_output[4])
      | (~ and_223_cse));
  assign mux_464_nl = MUX_s_1_2_2(and_205_nl, nor_188_nl, fsm_output[5]);
  assign mux_467_nl = MUX_s_1_2_2(mux_466_nl, mux_464_nl, fsm_output[6]);
  assign mux_472_nl = MUX_s_1_2_2(mux_471_nl, mux_467_nl, fsm_output[8]);
  assign or_624_nl = (z_out_7_10_1[2:0]!=3'b111) | (fsm_output[4:0]!=5'b00011);
  assign nand_110_nl = ~((z_out_7_10_1[2:0]==3'b111) & (fsm_output[4:1]==4'b1001));
  assign or_620_nl = (COMP_LOOP_acc_1_cse_4_sva[2:0]!=3'b111) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm)
      | (fsm_output[4:1]!=4'b0000);
  assign mux_461_nl = MUX_s_1_2_2(nand_110_nl, or_620_nl, fsm_output[0]);
  assign mux_462_nl = MUX_s_1_2_2(or_624_nl, mux_461_nl, fsm_output[5]);
  assign or_619_nl = (~ (COMP_LOOP_acc_13_psp_sva[0])) | (~ (VEC_LOOP_j_sva_9_0[1]))
      | (fsm_output[0]) | (~ (VEC_LOOP_j_sva_9_0[0])) | (~ COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm)
      | (fsm_output[4:1]!=4'b1000);
  assign nor_190_nl = ~((z_out_7_10_1[2:0]!=3'b111) | (fsm_output[3:1]!=3'b000));
  assign mux_458_nl = MUX_s_1_2_2(nor_190_nl, and_223_cse, fsm_output[4]);
  assign nor_191_nl = ~((fsm_output[4]) | (z_out_7_10_1[2:0]!=3'b111) | (fsm_output[3:1]!=3'b000));
  assign nand_41_nl = ~((COMP_LOOP_acc_1_cse_6_sva[2:0]==3'b111) & COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm);
  assign mux_459_nl = MUX_s_1_2_2(mux_458_nl, nor_191_nl, nand_41_nl);
  assign nand_17_nl = ~((fsm_output[0]) & mux_459_nl);
  assign mux_460_nl = MUX_s_1_2_2(or_619_nl, nand_17_nl, fsm_output[5]);
  assign mux_463_nl = MUX_s_1_2_2(mux_462_nl, mux_460_nl, fsm_output[6]);
  assign nor_189_nl = ~((fsm_output[8]) | mux_463_nl);
  assign vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_472_nl,
      nor_189_nl, fsm_output[7]);
  assign or_926_nl = (~ (fsm_output[0])) | (fsm_output[5]) | (fsm_output[1]);
  assign or_925_nl = (fsm_output[0]) | (~ (fsm_output[5])) | (fsm_output[1]);
  assign mux_tmp = MUX_s_1_2_2(or_926_nl, or_925_nl, fsm_output[4]);
  assign or_934_nl = (~ (fsm_output[7])) | (fsm_output[4]) | (~((fsm_output[0]) &
      (fsm_output[5]) & (fsm_output[1])));
  assign or_932_nl = (fsm_output[7]) | (~ (fsm_output[4])) | (fsm_output[0]) | (fsm_output[5])
      | (~ (fsm_output[1]));
  assign mux_752_nl = MUX_s_1_2_2(or_934_nl, or_932_nl, fsm_output[2]);
  assign or_930_nl = (~ (fsm_output[7])) | (~ (fsm_output[4])) | (fsm_output[0])
      | (fsm_output[5]) | (~ (fsm_output[1]));
  assign or_928_nl = (fsm_output[7]) | mux_tmp;
  assign mux_751_nl = MUX_s_1_2_2(or_930_nl, or_928_nl, fsm_output[2]);
  assign mux_753_nl = MUX_s_1_2_2(mux_752_nl, mux_751_nl, fsm_output[6]);
  assign nor_299_nl = ~((fsm_output[3]) | mux_753_nl);
  assign nor_300_nl = ~((fsm_output[6]) | (fsm_output[2]) | (fsm_output[7]) | mux_tmp);
  assign and_412_nl = (fsm_output[6]) & (fsm_output[2]) & (~ (fsm_output[7])) & (fsm_output[4])
      & (fsm_output[0]) & (~ (fsm_output[5])) & (fsm_output[1]);
  assign mux_750_nl = MUX_s_1_2_2(nor_300_nl, and_412_nl, fsm_output[3]);
  assign mux_754_cse = MUX_s_1_2_2(nor_299_nl, mux_750_nl, fsm_output[8]);
  assign and_dcpl_174 = (fsm_output==9'b010000011);
  assign and_dcpl_175 = ~((fsm_output[5:4]!=2'b00));
  assign nor_294_cse = ~((fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]));
  assign and_dcpl_189 = nor_294_cse & (fsm_output[2]) & (~ (fsm_output[1])) & (fsm_output[0])
      & (~ (fsm_output[6])) & and_dcpl_175;
  assign and_dcpl_192 = (fsm_output[0]) & (~ (fsm_output[6])) & and_dcpl_175;
  assign and_dcpl_201 = (fsm_output[5:4]==2'b01);
  assign and_dcpl_202 = ~((fsm_output[0]) | (fsm_output[6]));
  assign and_dcpl_203 = and_dcpl_202 & and_dcpl_201;
  assign and_dcpl_207 = ~((fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]) | (~
      (fsm_output[2])) | (fsm_output[1]));
  assign and_dcpl_208 = and_dcpl_207 & and_dcpl_203;
  assign and_dcpl_209 = (fsm_output[5:4]==2'b10);
  assign and_dcpl_212 = and_dcpl_207 & (fsm_output[0]) & (~ (fsm_output[6])) & and_dcpl_209;
  assign and_dcpl_215 = and_dcpl_207 & (~ (fsm_output[0])) & (fsm_output[6]) & and_dcpl_201;
  assign and_dcpl_220 = (fsm_output[7]) & (~ (fsm_output[8])) & (~ (fsm_output[3]));
  assign and_dcpl_222 = and_dcpl_220 & (fsm_output[2:1]==2'b01) & and_dcpl_202 &
      (fsm_output[5:4]==2'b11);
  assign and_dcpl_225 = ~((fsm_output[2:1]!=2'b00));
  assign and_331_cse = and_dcpl_220 & and_dcpl_225 & (fsm_output[0]) & (fsm_output[6])
      & and_dcpl_209;
  assign and_dcpl_231 = (~ (fsm_output[7])) & (fsm_output[8]) & (~ (fsm_output[3]))
      & and_dcpl_225 & and_dcpl_203;
  assign and_dcpl_247 = ~((fsm_output!=9'b000010100));
  assign and_dcpl_265 = (fsm_output[0]) & (~ (fsm_output[6]));
  assign and_dcpl_273 = (~ (fsm_output[0])) & (fsm_output[6]);
  assign and_dcpl_281 = and_dcpl_220 & (fsm_output[2:1]==2'b01);
  assign and_dcpl_283 = (fsm_output[5:4]==2'b11);
  assign and_dcpl_300 = and_dcpl_54 & (fsm_output[3:1]==3'b111);
  assign and_367_ssc = (fsm_output==9'b101101110);
  assign or_tmp_905 = (fsm_output[0]) | (fsm_output[6]) | (fsm_output[2]);
  assign or_tmp_908 = (~ (fsm_output[6])) | (fsm_output[2]);
  assign or_tmp_909 = (~ (fsm_output[0])) | (~ (fsm_output[6])) | (fsm_output[2]);
  assign or_tmp_913 = (fsm_output[6]) | (~ (fsm_output[2]));
  assign mux_tmp_747 = MUX_s_1_2_2((~ and_197_cse), or_tmp_913, fsm_output[0]);
  assign mux_tmp_762 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[0]);
  assign or_981_cse = (~ (fsm_output[4])) | (fsm_output[0]) | (fsm_output[5]);
  assign mux_tmp_763 = MUX_s_1_2_2(mux_tmp_762, or_981_cse, fsm_output[1]);
  assign nor_tmp_136 = (fsm_output[0]) & (fsm_output[5]);
  assign or_987_cse = (fsm_output[0]) | (~ (fsm_output[5]));
  assign mux_tmp_770 = MUX_s_1_2_2((fsm_output[5]), or_987_cse, fsm_output[4]);
  assign or_tmp_939 = and_dcpl_9 | (fsm_output[8]);
  assign or_tmp_940 = (fsm_output[7]) | or_tmp_939;
  assign or_tmp_942 = (fsm_output[7]) | and_250_cse | (~ (fsm_output[8]));
  assign or_tmp_943 = (fsm_output[7]) | (~ (fsm_output[3])) | (fsm_output[8]);
  assign or_tmp_945 = (fsm_output[2]) | (fsm_output[3]) | (fsm_output[8]);
  assign mux_tmp_783 = MUX_s_1_2_2((~ (fsm_output[8])), or_tmp_945, fsm_output[7]);
  assign mux_811_nl = MUX_s_1_2_2(mux_tmp_783, or_tmp_637, fsm_output[0]);
  assign mux_809_nl = MUX_s_1_2_2(or_tmp_943, or_tmp_940, fsm_output[0]);
  assign mux_tmp_785 = MUX_s_1_2_2(mux_811_nl, mux_809_nl, fsm_output[4]);
  assign mux_tmp_788 = MUX_s_1_2_2(or_tmp_945, or_tmp_939, fsm_output[7]);
  assign nand_145_nl = ~(or_1011_cse & (fsm_output[8]));
  assign mux_tmp_790 = MUX_s_1_2_2(nand_145_nl, or_tmp_945, fsm_output[7]);
  assign mux_tmp_806 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[4]);
  assign mux_tmp_807 = MUX_s_1_2_2(or_tmp_843, mux_tmp_806, fsm_output[0]);
  assign mux_tmp_831 = MUX_s_1_2_2((fsm_output[5]), (fsm_output[0]), fsm_output[4]);
  assign nand_144_nl = ~((fsm_output[0]) & (fsm_output[5]));
  assign or_1019_nl = (~ (fsm_output[0])) | (fsm_output[5]);
  assign mux_859_nl = MUX_s_1_2_2(nand_144_nl, or_1019_nl, fsm_output[4]);
  assign mux_tmp_833 = MUX_s_1_2_2(mux_859_nl, or_981_cse, fsm_output[1]);
  always @(posedge clk) begin
    if ( (and_dcpl_11 & and_dcpl_7) | STAGE_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, (z_out_2[3:0]), STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( ~ not_tmp_73 ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( ~ not_tmp_73 ) begin
      r_sva <= r_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_0_7_obj_ld_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      COMP_LOOP_COMP_LOOP_nor_1_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_12_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_121_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_125_itm <= 1'b0;
    end
    else begin
      reg_vec_rsc_triosy_0_7_obj_ld_cse <= and_dcpl_17 & and_dcpl_6 & (fsm_output[8:7]==2'b11)
          & (~ STAGE_LOOP_acc_itm_2_1);
      reg_ensig_cgo_cse <= ~ mux_507_itm;
      COMP_LOOP_COMP_LOOP_nor_1_itm <= ~((z_out_7_10_1[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_12_itm <= (z_out_7_10_1[2:0]==3'b110);
      COMP_LOOP_COMP_LOOP_and_121_itm <= (z_out_7_10_1[2:0]==3'b011);
      COMP_LOOP_COMP_LOOP_and_125_itm <= (z_out_7_10_1[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out_3, ({operator_64_false_acc_mut_64
        , operator_64_false_acc_mut_63_0}), and_dcpl_96);
    operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
        STAGE_LOOP_lshift_psp_sva, and_dcpl_96);
    modExp_dev_exp_1_sva_2_0 <= MUX_v_3_2_2(COMP_LOOP_and_56_nl, 3'b111, and_dcpl_149);
    COMP_LOOP_1_mul_itm <= nl_COMP_LOOP_1_mul_itm[63:0];
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_165_nl, and_tmp_6, fsm_output[8]) ) begin
      STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( ~ mux_788_nl ) begin
      operator_64_false_acc_mut_64 <= operator_64_false_operator_64_false_mux_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_803_nl, nor_343_nl, fsm_output[7]) ) begin
      operator_64_false_acc_mut_63_0 <= operator_64_false_operator_64_false_mux_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_sva_9_0 <= 10'b0000000000;
    end
    else if ( (mux_599_nl & (~ (fsm_output[3])) & and_dcpl_7) | VEC_LOOP_j_sva_9_0_mx0c1
        ) begin
      VEC_LOOP_j_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (VEC_LOOP_acc_1_psp_1[9:0]),
          VEC_LOOP_j_sva_9_0_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(and_422_nl, nor_339_nl, fsm_output[4]) ) begin
      COMP_LOOP_k_9_3_sva_5_0 <= MUX_v_6_2_2(6'b000000, (z_out_6[5:0]), nand_133_nl);
    end
  end
  always @(posedge clk) begin
    if ( mux_606_nl | and_113_rgt ) begin
      modExp_dev_result_sva <= MUX_v_64_2_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
          modulo_dev_cmp_return_rsc_z, and_113_rgt);
    end
  end
  always @(posedge clk) begin
    if ( ~(not_tmp_204 & and_dcpl_7) ) begin
      modExp_dev_exp_sva <= MUX_v_64_2_2((operator_66_true_div_cmp_z[63:0]), (z_out_3[63:0]),
          and_dcpl_107);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_11_itm <= 1'b0;
    end
    else if ( and_dcpl_107 | not_tmp_207 | and_dcpl_28 | and_dcpl_34 | and_dcpl_41
        | and_dcpl_45 | and_dcpl_50 | and_dcpl_56 | and_dcpl_59 | and_dcpl_65 ) begin
      COMP_LOOP_COMP_LOOP_and_11_itm <= MUX_s_1_2_2((~ (z_out_2[64])), COMP_LOOP_COMP_LOOP_and_11_nl,
          modExp_dev_while_or_2_cse);
    end
  end
  always @(posedge clk) begin
    if ( ~((fsm_output[4:0]!=5'b10100) | or_109_cse | (fsm_output[8:7]!=2'b00)) )
        begin
      COMP_LOOP_acc_psp_sva <= z_out_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_2_sva <= 10'b0000000000;
    end
    else if ( ~(mux_658_nl & nor_256_cse) ) begin
      COMP_LOOP_acc_1_cse_2_sva <= COMP_LOOP_acc_1_cse_2_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_4_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_86_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_58_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_60_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_32_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_33_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_34_itm <= 1'b0;
    end
    else if ( mux_659_itm ) begin
      COMP_LOOP_COMP_LOOP_nor_4_itm <= ~((COMP_LOOP_acc_1_cse_2_sva_mx0w0[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_86_itm <= (COMP_LOOP_acc_1_cse_4_sva_1[2:0]==3'b011);
      COMP_LOOP_COMP_LOOP_and_58_itm <= (COMP_LOOP_acc_11_psp_sva_1[0]) & (VEC_LOOP_j_sva_9_0[0])
          & (~ (COMP_LOOP_acc_11_psp_sva_1[1]));
      COMP_LOOP_COMP_LOOP_and_60_itm <= (COMP_LOOP_acc_11_psp_sva_1[1]) & (VEC_LOOP_j_sva_9_0[0])
          & (~ (COMP_LOOP_acc_11_psp_sva_1[0]));
      COMP_LOOP_COMP_LOOP_and_32_itm <= (COMP_LOOP_acc_1_cse_2_sva_mx0w0[2:0]==3'b101);
      COMP_LOOP_COMP_LOOP_and_33_itm <= (COMP_LOOP_acc_1_cse_2_sva_mx0w0[2:0]==3'b110);
      COMP_LOOP_COMP_LOOP_and_34_itm <= (COMP_LOOP_acc_1_cse_2_sva_mx0w0[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_30_itm <= 1'b0;
    end
    else if ( MUX_s_1_2_2(not_tmp_220, mux_661_nl, fsm_output[8]) ) begin
      COMP_LOOP_COMP_LOOP_and_30_itm <= MUX_s_1_2_2(COMP_LOOP_COMP_LOOP_and_30_nl,
          (~ (readslicef_10_1_9(COMP_LOOP_1_acc_nl))), and_dcpl_65);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_4_sva <= 10'b0000000000;
    end
    else if ( mux_663_nl | (fsm_output[8]) ) begin
      COMP_LOOP_acc_1_cse_4_sva <= COMP_LOOP_acc_1_cse_4_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_11_psp_sva <= 9'b000000000;
    end
    else if ( mux_664_nl | (fsm_output[8]) ) begin
      COMP_LOOP_acc_11_psp_sva <= COMP_LOOP_acc_11_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_13_psp_sva <= 8'b00000000;
    end
    else if ( mux_666_nl | (fsm_output[8]) ) begin
      COMP_LOOP_acc_13_psp_sva <= z_out_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_6_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_220, or_81_nl, fsm_output[8]) ) begin
      COMP_LOOP_acc_1_cse_6_sva <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_14_psp_sva <= 9'b000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_220, or_827_nl, fsm_output[8]) ) begin
      COMP_LOOP_acc_14_psp_sva <= nl_COMP_LOOP_acc_14_psp_sva[8:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(not_tmp_220, and_129_nl, fsm_output[8]) ) begin
      COMP_LOOP_acc_1_cse_sva <= nl_COMP_LOOP_acc_1_cse_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_23 | and_dcpl_41 | and_dcpl_59 ) begin
      COMP_LOOP_slc_COMP_LOOP_acc_12_7_itm <= MUX1HOT_s_1_3_2((z_out_6[6]), (z_out_1[7]),
          (z_out_5[6]), {and_dcpl_23 , and_dcpl_41 , and_dcpl_59});
    end
  end
  always @(posedge clk) begin
    if ( tmp_10_lpi_4_dfm_mx0c0 | tmp_10_lpi_4_dfm_mx0c1 | tmp_10_lpi_4_dfm_mx0c2
        | tmp_10_lpi_4_dfm_mx0c3 | tmp_10_lpi_4_dfm_mx0c4 | tmp_10_lpi_4_dfm_mx0c5
        | tmp_10_lpi_4_dfm_mx0c6 | tmp_10_lpi_4_dfm_mx0c7 | and_dcpl_139 | and_dcpl_140
        | and_dcpl_142 | and_dcpl_144 | and_dcpl_145 | and_dcpl_147 | and_dcpl_149
        ) begin
      tmp_10_lpi_4_dfm <= MUX1HOT_v_64_8_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
          vec_rsc_0_2_i_q_d, vec_rsc_0_3_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_5_i_q_d,
          vec_rsc_0_6_i_q_d, vec_rsc_0_7_i_q_d, {COMP_LOOP_or_6_nl , COMP_LOOP_or_7_nl
          , COMP_LOOP_or_8_nl , COMP_LOOP_or_9_nl , COMP_LOOP_or_10_nl , COMP_LOOP_or_11_nl
          , COMP_LOOP_or_12_nl , COMP_LOOP_or_13_nl});
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_831_nl, mux_823_nl, fsm_output[5]) ) begin
      modExp_dev_exp_1_sva_63_9 <= MUX_v_55_2_2(55'b0000000000000000000000000000000000000000000000000000000,
          (z_out_3[63:9]), mux_679_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva_9_6 <= 4'b0000;
    end
    else if ( ~ mux_855_nl ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva_9_6 <= COMP_LOOP_mux1h_52_rgt[9:6];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva_5_0 <= 6'b000000;
    end
    else if ( MUX_s_1_2_2(mux_866_nl, and_415_nl, fsm_output[3]) ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva_5_0 <= COMP_LOOP_mux1h_52_rgt[5:0];
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_28 | and_dcpl_34 | and_dcpl_45 | and_dcpl_50 | and_dcpl_56 ) begin
      COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm <= z_out_4[9];
    end
  end
  assign and_251_nl = (fsm_output[4:3]==2'b11);
  assign mux_697_nl = MUX_s_1_2_2(and_251_nl, and_tmp_9, fsm_output[0]);
  assign or_869_nl = (fsm_output[4]) | or_tmp_715;
  assign mux_696_nl = MUX_s_1_2_2(or_869_nl, or_tmp_840, fsm_output[0]);
  assign mux_698_nl = MUX_s_1_2_2(mux_697_nl, (~ mux_696_nl), fsm_output[5]);
  assign mux_695_nl = MUX_s_1_2_2(not_tmp_204, mux_tmp_630, fsm_output[5]);
  assign mux_699_nl = MUX_s_1_2_2(mux_698_nl, mux_695_nl, fsm_output[6]);
  assign or_867_nl = (fsm_output[4:1]!=4'b0000);
  assign mux_692_nl = MUX_s_1_2_2(or_tmp_840, or_867_nl, fsm_output[0]);
  assign mux_691_nl = MUX_s_1_2_2(and_dcpl_9, or_1008_cse, fsm_output[4]);
  assign mux_693_nl = MUX_s_1_2_2(mux_692_nl, mux_691_nl, fsm_output[5]);
  assign nor_134_nl = ~((fsm_output[4:0]!=5'b00000));
  assign mux_690_nl = MUX_s_1_2_2(mux_tmp_578, nor_134_nl, fsm_output[5]);
  assign mux_694_nl = MUX_s_1_2_2((~ mux_693_nl), mux_690_nl, fsm_output[6]);
  assign mux_700_nl = MUX_s_1_2_2(mux_699_nl, mux_694_nl, fsm_output[7]);
  assign or_864_nl = (fsm_output[4]) | and_dcpl_10;
  assign nand_27_nl = ~((fsm_output[4]) & (~ and_dcpl_16));
  assign mux_687_nl = MUX_s_1_2_2((~ and_tmp_8), nand_27_nl, fsm_output[0]);
  assign mux_688_nl = MUX_s_1_2_2(or_864_nl, mux_687_nl, fsm_output[5]);
  assign or_863_nl = (fsm_output[5:4]!=2'b10) | and_dcpl_16;
  assign mux_689_nl = MUX_s_1_2_2(mux_688_nl, or_863_nl, fsm_output[6]);
  assign nor_135_nl = ~((fsm_output[7]) | mux_689_nl);
  assign mux_701_nl = MUX_s_1_2_2(mux_700_nl, nor_135_nl, fsm_output[8]);
  assign COMP_LOOP_mux1h_46_nl = MUX1HOT_v_3_8_2((z_out_3[2:0]), modExp_dev_exp_1_sva_2_0,
      3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110, {not_tmp_207 , mux_701_nl ,
      and_dcpl_139 , and_dcpl_140 , and_dcpl_142 , and_dcpl_144 , and_dcpl_145 ,
      and_dcpl_147});
  assign nand_132_nl = ~(and_dcpl_21 & and_dcpl_51 & and_dcpl_7);
  assign COMP_LOOP_and_56_nl = MUX_v_3_2_2(3'b000, COMP_LOOP_mux1h_46_nl, nand_132_nl);
  assign COMP_LOOP_COMP_LOOP_and_210_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]==3'b001);
  assign COMP_LOOP_COMP_LOOP_and_212_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]==3'b010);
  assign COMP_LOOP_COMP_LOOP_and_214_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva_5_0[2:0]==3'b100);
  assign COMP_LOOP_mux1h_58_nl = MUX1HOT_v_64_8_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
      vec_rsc_0_2_i_q_d, vec_rsc_0_3_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_5_i_q_d,
      vec_rsc_0_6_i_q_d, vec_rsc_0_7_i_q_d, {COMP_LOOP_COMP_LOOP_nor_1_itm , COMP_LOOP_COMP_LOOP_and_210_nl
      , COMP_LOOP_COMP_LOOP_and_212_nl , COMP_LOOP_COMP_LOOP_and_121_itm , COMP_LOOP_COMP_LOOP_and_214_nl
      , COMP_LOOP_COMP_LOOP_and_11_itm , COMP_LOOP_COMP_LOOP_and_12_itm , COMP_LOOP_COMP_LOOP_and_125_itm});
  assign nl_COMP_LOOP_1_mul_itm  = $signed(operator_64_false_acc_mut_63_0) * $signed(conv_u2s_64_65(COMP_LOOP_mux1h_58_nl));
  assign nor_165_nl = ~((fsm_output[7:1]!=7'b0000000));
  assign mux_783_nl = MUX_s_1_2_2(and_197_cse, or_tmp_908, fsm_output[0]);
  assign mux_784_nl = MUX_s_1_2_2((~ mux_783_nl), or_tmp_913, fsm_output[5]);
  assign or_978_nl = (fsm_output[0]) | (~ (fsm_output[2]));
  assign mux_782_nl = MUX_s_1_2_2(mux_tmp_747, or_978_nl, fsm_output[5]);
  assign mux_785_nl = MUX_s_1_2_2(mux_784_nl, mux_782_nl, fsm_output[4]);
  assign nand_150_nl = ~((fsm_output[5]) & (fsm_output[0]) & (fsm_output[6]) & (~
      (fsm_output[2])));
  assign mux_779_nl = MUX_s_1_2_2(or_tmp_913, or_tmp_908, fsm_output[0]);
  assign mux_780_nl = MUX_s_1_2_2(mux_779_nl, or_tmp_909, fsm_output[5]);
  assign mux_781_nl = MUX_s_1_2_2(nand_150_nl, mux_780_nl, fsm_output[4]);
  assign mux_786_nl = MUX_s_1_2_2(mux_785_nl, mux_781_nl, fsm_output[1]);
  assign or_979_nl = (fsm_output[3]) | mux_786_nl;
  assign or_975_nl = (fsm_output[5]) | (fsm_output[6]) | (fsm_output[2]);
  assign mux_777_nl = MUX_s_1_2_2(or_975_nl, or_tmp_905, fsm_output[4]);
  assign or_976_nl = (fsm_output[1]) | mux_777_nl;
  assign nand_151_nl = ~((fsm_output[5]) & (fsm_output[0]) & (fsm_output[6]) & (fsm_output[2]));
  assign nand_152_nl = ~(((fsm_output[0]) | (fsm_output[6])) & (fsm_output[2]));
  assign mux_773_nl = MUX_s_1_2_2(nand_152_nl, or_tmp_913, fsm_output[5]);
  assign mux_775_nl = MUX_s_1_2_2(mux_tmp_747, mux_773_nl, fsm_output[4]);
  assign mux_776_nl = MUX_s_1_2_2(nand_151_nl, mux_775_nl, fsm_output[1]);
  assign mux_778_nl = MUX_s_1_2_2(or_976_nl, mux_776_nl, fsm_output[3]);
  assign mux_787_nl = MUX_s_1_2_2(or_979_nl, mux_778_nl, fsm_output[8]);
  assign or_971_nl = nor_cse | (~ (fsm_output[6])) | (fsm_output[2]);
  assign mux_769_nl = MUX_s_1_2_2(or_tmp_908, or_897_cse, fsm_output[0]);
  assign mux_770_nl = MUX_s_1_2_2(or_tmp_909, mux_769_nl, fsm_output[5]);
  assign mux_771_nl = MUX_s_1_2_2(or_971_nl, mux_770_nl, fsm_output[4]);
  assign or_966_nl = (fsm_output[0]) | (fsm_output[2]);
  assign mux_767_nl = MUX_s_1_2_2(or_966_nl, or_tmp_905, fsm_output[5]);
  assign mux_768_nl = MUX_s_1_2_2(or_897_cse, mux_767_nl, fsm_output[4]);
  assign mux_772_nl = MUX_s_1_2_2(mux_771_nl, mux_768_nl, fsm_output[1]);
  assign or_972_nl = (fsm_output[8]) | (fsm_output[3]) | mux_772_nl;
  assign mux_788_nl = MUX_s_1_2_2(mux_787_nl, or_972_nl, fsm_output[7]);
  assign or_1026_nl = (fsm_output[1]) | (fsm_output[4]) | (~ (fsm_output[0])) | (fsm_output[5]);
  assign mux_800_nl = MUX_s_1_2_2(nor_tmp_136, (fsm_output[0]), fsm_output[4]);
  assign nand_148_nl = ~((fsm_output[1]) & mux_800_nl);
  assign mux_801_nl = MUX_s_1_2_2(or_1026_nl, nand_148_nl, fsm_output[6]);
  assign or_989_nl = (fsm_output[1]) | mux_tmp_770;
  assign mux_799_nl = MUX_s_1_2_2(mux_tmp_763, or_989_nl, fsm_output[6]);
  assign mux_802_nl = MUX_s_1_2_2(mux_801_nl, mux_799_nl, fsm_output[2]);
  assign nor_340_nl = ~((fsm_output[3]) | mux_802_nl);
  assign nor_341_nl = ~((fsm_output[2]) | (fsm_output[6]) | (fsm_output[1]) | mux_tmp_770);
  assign mux_795_nl = MUX_s_1_2_2((fsm_output[0]), (~ mux_tmp_762), fsm_output[4]);
  assign and_423_nl = (fsm_output[1]) & mux_795_nl;
  assign nor_342_nl = ~((~((fsm_output[4]) | (~ (fsm_output[0])))) | (fsm_output[5]));
  assign mux_794_nl = MUX_s_1_2_2(nor_tmp_136, nor_342_nl, fsm_output[1]);
  assign mux_796_nl = MUX_s_1_2_2(and_423_nl, mux_794_nl, fsm_output[6]);
  assign and_nl = (fsm_output[2]) & mux_796_nl;
  assign mux_798_nl = MUX_s_1_2_2(nor_341_nl, and_nl, fsm_output[3]);
  assign mux_803_nl = MUX_s_1_2_2(nor_340_nl, mux_798_nl, fsm_output[8]);
  assign nand_149_nl = ~((fsm_output[4]) & (fsm_output[0]) & (fsm_output[5]));
  assign nor_344_nl = ~((~ (fsm_output[0])) | (fsm_output[5]));
  assign or_982_nl = (fsm_output[0]) | (fsm_output[5]);
  assign mux_791_nl = MUX_s_1_2_2(nor_344_nl, or_982_nl, fsm_output[4]);
  assign mux_792_nl = MUX_s_1_2_2(nand_149_nl, mux_791_nl, fsm_output[1]);
  assign mux_793_nl = MUX_s_1_2_2(mux_792_nl, mux_tmp_763, fsm_output[6]);
  assign nor_343_nl = ~((fsm_output[8]) | (fsm_output[3]) | (fsm_output[2]) | mux_793_nl);
  assign nor_163_nl = ~((fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[2])));
  assign nor_164_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[1])) | (fsm_output[2]));
  assign mux_599_nl = MUX_s_1_2_2(nor_163_nl, nor_164_nl, fsm_output[0]);
  assign or_721_nl = (fsm_output[4:1]!=4'b0010);
  assign or_720_nl = (fsm_output[4:1]!=4'b1001);
  assign mux_600_nl = MUX_s_1_2_2(or_721_nl, or_720_nl, fsm_output[0]);
  assign nor_288_nl = ~((fsm_output[7]) | mux_600_nl);
  assign nor_289_nl = ~((~ (fsm_output[7])) | (~ (fsm_output[0])) | (fsm_output[4])
      | (fsm_output[1]) | (~ and_250_cse));
  assign mux_601_nl = MUX_s_1_2_2(nor_288_nl, nor_289_nl, fsm_output[8]);
  assign nand_133_nl = ~(mux_601_nl & and_dcpl_6);
  assign nor_336_nl = ~((fsm_output[5]) | (fsm_output[6]) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[3]));
  assign nor_337_nl = ~((fsm_output[7:5]!=3'b011) | nand_146_cse);
  assign mux_805_nl = MUX_s_1_2_2(nor_336_nl, nor_337_nl, fsm_output[1]);
  assign nor_338_nl = ~((fsm_output[1]) | (fsm_output[5]) | (fsm_output[6]) | nand_147_cse);
  assign mux_806_nl = MUX_s_1_2_2(mux_805_nl, nor_338_nl, fsm_output[0]);
  assign and_422_nl = (fsm_output[2]) & mux_806_nl;
  assign nor_339_nl = ~((fsm_output[2]) | (~ (fsm_output[0])) | (~ (fsm_output[1]))
      | (fsm_output[5]) | (fsm_output[6]) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[3]));
  assign nor_160_nl = ~((fsm_output[7:5]!=3'b000) | mux_tmp_578);
  assign mux_606_nl = MUX_s_1_2_2(nor_160_nl, and_tmp_6, fsm_output[8]);
  assign COMP_LOOP_COMP_LOOP_and_11_nl = (z_out_7_10_1[2:0]==3'b101);
  assign or_894_nl = (fsm_output[5]) | mux_tmp_630;
  assign mux_658_nl = MUX_s_1_2_2(or_894_nl, nand_38_cse, fsm_output[6]);
  assign COMP_LOOP_COMP_LOOP_and_30_nl = (COMP_LOOP_acc_1_cse_2_sva_mx0w0[2:0]==3'b011);
  assign nl_COMP_LOOP_1_acc_nl = ({z_out_6 , 3'b000}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))})
      + 10'b0000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[9:0];
  assign mux_660_nl = MUX_s_1_2_2(nor_tmp_118, (~ mux_tmp_130), fsm_output[5]);
  assign and_176_nl = (fsm_output[6]) & mux_660_nl;
  assign or_816_nl = (fsm_output[6:4]!=3'b000) | and_250_cse;
  assign mux_661_nl = MUX_s_1_2_2(and_176_nl, or_816_nl, fsm_output[7]);
  assign and_121_nl = (fsm_output[6]) & ((fsm_output[5:4]!=2'b00) | and_dcpl_16);
  assign mux_663_nl = MUX_s_1_2_2(not_tmp_226, and_121_nl, fsm_output[7]);
  assign or_822_nl = (fsm_output[6:5]!=2'b00) | and_dcpl_52;
  assign mux_664_nl = MUX_s_1_2_2(not_tmp_226, or_822_nl, fsm_output[7]);
  assign mux_665_nl = MUX_s_1_2_2(nor_tmp_118, and_229_cse, fsm_output[0]);
  assign and_124_nl = (fsm_output[6:5]==2'b11) & mux_665_nl;
  assign mux_666_nl = MUX_s_1_2_2(not_tmp_226, and_124_nl, fsm_output[7]);
  assign or_81_nl = (fsm_output[7:6]!=2'b00) | ((fsm_output[5]) & ((fsm_output[4])
      | and_250_cse));
  assign nl_COMP_LOOP_acc_14_psp_sva  = (VEC_LOOP_j_sva_9_0[9:1]) + conv_u2u_8_9({COMP_LOOP_k_9_3_sva_5_0
      , 2'b11});
  assign and_127_nl = (fsm_output[4]) & and_222_cse;
  assign mux_668_nl = MUX_s_1_2_2(and_229_cse, and_127_nl, fsm_output[0]);
  assign or_827_nl = (fsm_output[7]) | ((fsm_output[6]) & ((fsm_output[5]) | mux_668_nl));
  assign nl_COMP_LOOP_acc_1_cse_sva  = VEC_LOOP_j_sva_9_0 + conv_u2u_9_10({COMP_LOOP_k_9_3_sva_5_0
      , 3'b111});
  assign and_129_nl = (fsm_output[7]) & ((fsm_output[6:4]!=3'b000) | and_222_cse);
  assign COMP_LOOP_or_6_nl = tmp_10_lpi_4_dfm_mx0c0 | (COMP_LOOP_COMP_LOOP_nor_4_itm
      & and_dcpl_139) | (COMP_LOOP_COMP_LOOP_and_34_itm & and_dcpl_140) | (COMP_LOOP_COMP_LOOP_and_33_itm
      & and_dcpl_142) | (COMP_LOOP_COMP_LOOP_and_32_itm & and_dcpl_144) | (COMP_LOOP_COMP_LOOP_and_60_itm
      & and_dcpl_145) | (COMP_LOOP_COMP_LOOP_and_30_itm & and_dcpl_147) | (COMP_LOOP_COMP_LOOP_and_58_itm
      & and_dcpl_149);
  assign COMP_LOOP_or_7_nl = tmp_10_lpi_4_dfm_mx0c1 | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_139) | (COMP_LOOP_COMP_LOOP_nor_4_itm & and_dcpl_140) | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_142) | (COMP_LOOP_COMP_LOOP_and_33_itm & and_dcpl_144) | (COMP_LOOP_COMP_LOOP_and_32_itm
      & and_dcpl_145) | (COMP_LOOP_COMP_LOOP_and_60_itm & and_dcpl_147) | (COMP_LOOP_COMP_LOOP_and_30_itm
      & and_dcpl_149);
  assign COMP_LOOP_or_8_nl = tmp_10_lpi_4_dfm_mx0c2 | (COMP_LOOP_COMP_LOOP_and_58_itm
      & and_dcpl_139) | (COMP_LOOP_COMP_LOOP_and_86_itm & and_dcpl_140) | (COMP_LOOP_COMP_LOOP_nor_4_itm
      & and_dcpl_142) | (COMP_LOOP_COMP_LOOP_and_34_itm & and_dcpl_144) | (COMP_LOOP_COMP_LOOP_and_33_itm
      & and_dcpl_145) | (COMP_LOOP_COMP_LOOP_and_32_itm & and_dcpl_147) | (COMP_LOOP_COMP_LOOP_and_60_itm
      & and_dcpl_149);
  assign COMP_LOOP_or_9_nl = tmp_10_lpi_4_dfm_mx0c3 | (COMP_LOOP_COMP_LOOP_and_30_itm
      & and_dcpl_139) | (COMP_LOOP_COMP_LOOP_and_58_itm & and_dcpl_140) | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_142) | (COMP_LOOP_COMP_LOOP_nor_4_itm & and_dcpl_144) | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_145) | (COMP_LOOP_COMP_LOOP_and_33_itm & and_dcpl_147) | (COMP_LOOP_COMP_LOOP_and_32_itm
      & and_dcpl_149);
  assign COMP_LOOP_or_10_nl = tmp_10_lpi_4_dfm_mx0c4 | (COMP_LOOP_COMP_LOOP_and_60_itm
      & and_dcpl_139) | (COMP_LOOP_COMP_LOOP_and_30_itm & and_dcpl_140) | (COMP_LOOP_COMP_LOOP_and_58_itm
      & and_dcpl_142) | (COMP_LOOP_COMP_LOOP_and_86_itm & and_dcpl_144) | (COMP_LOOP_COMP_LOOP_nor_4_itm
      & and_dcpl_145) | (COMP_LOOP_COMP_LOOP_and_34_itm & and_dcpl_147) | (COMP_LOOP_COMP_LOOP_and_33_itm
      & and_dcpl_149);
  assign COMP_LOOP_or_11_nl = tmp_10_lpi_4_dfm_mx0c5 | (COMP_LOOP_COMP_LOOP_and_32_itm
      & and_dcpl_139) | (COMP_LOOP_COMP_LOOP_and_60_itm & and_dcpl_140) | (COMP_LOOP_COMP_LOOP_and_30_itm
      & and_dcpl_142) | (COMP_LOOP_COMP_LOOP_and_58_itm & and_dcpl_144) | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_145) | (COMP_LOOP_COMP_LOOP_nor_4_itm & and_dcpl_147) | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_149);
  assign COMP_LOOP_or_12_nl = tmp_10_lpi_4_dfm_mx0c6 | (COMP_LOOP_COMP_LOOP_and_33_itm
      & and_dcpl_139) | (COMP_LOOP_COMP_LOOP_and_32_itm & and_dcpl_140) | (COMP_LOOP_COMP_LOOP_and_60_itm
      & and_dcpl_142) | (COMP_LOOP_COMP_LOOP_and_30_itm & and_dcpl_144) | (COMP_LOOP_COMP_LOOP_and_58_itm
      & and_dcpl_145) | (COMP_LOOP_COMP_LOOP_and_86_itm & and_dcpl_147) | (COMP_LOOP_COMP_LOOP_nor_4_itm
      & and_dcpl_149);
  assign COMP_LOOP_or_13_nl = tmp_10_lpi_4_dfm_mx0c7 | (COMP_LOOP_COMP_LOOP_and_34_itm
      & and_dcpl_139) | (COMP_LOOP_COMP_LOOP_and_33_itm & and_dcpl_140) | (COMP_LOOP_COMP_LOOP_and_32_itm
      & and_dcpl_142) | (COMP_LOOP_COMP_LOOP_and_60_itm & and_dcpl_144) | (COMP_LOOP_COMP_LOOP_and_30_itm
      & and_dcpl_145) | (COMP_LOOP_COMP_LOOP_and_58_itm & and_dcpl_147) | (COMP_LOOP_COMP_LOOP_and_86_itm
      & and_dcpl_149);
  assign or_846_nl = (fsm_output[0]) | (~ (fsm_output[8])) | (fsm_output[7]) | (fsm_output[2])
      | (fsm_output[3]);
  assign or_845_nl = (~ (fsm_output[0])) | (fsm_output[8]) | (fsm_output[7]) | (~
      (fsm_output[2])) | (fsm_output[3]);
  assign mux_677_nl = MUX_s_1_2_2(or_846_nl, or_845_nl, fsm_output[4]);
  assign or_1027_nl = (fsm_output[5]) | mux_677_nl;
  assign or_843_nl = (fsm_output[0]) | (fsm_output[8]) | (fsm_output[7]) | (~ (fsm_output[2]))
      | (fsm_output[3]);
  assign or_842_nl = (~ (fsm_output[0])) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (fsm_output[2]) | (fsm_output[3]);
  assign mux_676_nl = MUX_s_1_2_2(or_843_nl, or_842_nl, fsm_output[4]);
  assign or_1028_nl = (fsm_output[5]) | mux_676_nl;
  assign mux_678_nl = MUX_s_1_2_2(or_1027_nl, or_1028_nl, fsm_output[6]);
  assign or_839_nl = (fsm_output[8:7]!=2'b10) | not_tmp_5;
  assign mux_674_nl = MUX_s_1_2_2(or_785_cse, or_839_nl, fsm_output[0]);
  assign or_1029_nl = (fsm_output[5:4]!=2'b10) | mux_674_nl;
  assign or_1030_nl = (~ (fsm_output[4])) | (fsm_output[0]) | (~ (fsm_output[8]))
      | (fsm_output[7]) | not_tmp_5;
  assign or_1031_nl = (~ (fsm_output[4])) | (~ (fsm_output[0])) | (fsm_output[8])
      | (fsm_output[7]) | (fsm_output[2]) | (fsm_output[3]);
  assign mux_673_nl = MUX_s_1_2_2(or_1030_nl, or_1031_nl, fsm_output[5]);
  assign mux_675_nl = MUX_s_1_2_2(or_1029_nl, mux_673_nl, fsm_output[6]);
  assign mux_679_nl = MUX_s_1_2_2(mux_678_nl, mux_675_nl, fsm_output[1]);
  assign mux_829_nl = MUX_s_1_2_2(mux_tmp_790, or_tmp_943, fsm_output[4]);
  assign mux_830_nl = MUX_s_1_2_2(mux_829_nl, mux_tmp_785, fsm_output[1]);
  assign mux_827_nl = MUX_s_1_2_2(or_tmp_943, mux_tmp_788, fsm_output[4]);
  assign mux_824_nl = MUX_s_1_2_2(or_tmp_945, (fsm_output[8]), fsm_output[7]);
  assign mux_825_nl = MUX_s_1_2_2(mux_tmp_788, mux_824_nl, fsm_output[0]);
  assign mux_826_nl = MUX_s_1_2_2(or_tmp_940, mux_825_nl, fsm_output[4]);
  assign mux_828_nl = MUX_s_1_2_2(mux_827_nl, mux_826_nl, fsm_output[1]);
  assign mux_831_nl = MUX_s_1_2_2(mux_830_nl, mux_828_nl, fsm_output[6]);
  assign or_1007_nl = (fsm_output[3]) | (fsm_output[8]);
  assign mux_819_nl = MUX_s_1_2_2(or_1007_nl, or_tmp_939, fsm_output[7]);
  assign mux_820_nl = MUX_s_1_2_2(mux_819_nl, mux_tmp_788, fsm_output[0]);
  assign mux_818_nl = MUX_s_1_2_2(mux_tmp_790, mux_tmp_783, fsm_output[0]);
  assign mux_821_nl = MUX_s_1_2_2(mux_820_nl, mux_818_nl, fsm_output[4]);
  assign mux_814_nl = MUX_s_1_2_2(or_tmp_637, or_tmp_942, fsm_output[0]);
  assign mux_816_nl = MUX_s_1_2_2(mux_tmp_788, mux_814_nl, fsm_output[4]);
  assign mux_822_nl = MUX_s_1_2_2(mux_821_nl, mux_816_nl, fsm_output[1]);
  assign mux_808_nl = MUX_s_1_2_2(or_tmp_942, or_tmp_940, fsm_output[4]);
  assign mux_813_nl = MUX_s_1_2_2(mux_tmp_785, mux_808_nl, fsm_output[1]);
  assign mux_823_nl = MUX_s_1_2_2(mux_822_nl, mux_813_nl, fsm_output[6]);
  assign mux_850_nl = MUX_s_1_2_2(mux_tmp_807, or_tmp_842, fsm_output[1]);
  assign mux_851_nl = MUX_s_1_2_2(or_tmp_843, mux_850_nl, fsm_output[2]);
  assign mux_852_nl = MUX_s_1_2_2(mux_851_nl, or_tmp_842, fsm_output[3]);
  assign mux_847_nl = MUX_s_1_2_2((~ or_tmp_842), (fsm_output[4]), and_230_cse);
  assign mux_846_nl = MUX_s_1_2_2(or_tmp_843, mux_tmp_806, or_915_cse);
  assign mux_848_nl = MUX_s_1_2_2(mux_847_nl, mux_846_nl, fsm_output[2]);
  assign mux_849_nl = MUX_s_1_2_2(mux_848_nl, mux_tmp_806, fsm_output[3]);
  assign mux_853_nl = MUX_s_1_2_2(mux_852_nl, (~ mux_849_nl), fsm_output[6]);
  assign or_1013_nl = (fsm_output[2:0]!=3'b000);
  assign mux_843_nl = MUX_s_1_2_2(or_tmp_843, mux_tmp_806, or_1013_nl);
  assign and_419_nl = (fsm_output[2:0]==3'b111);
  assign mux_842_nl = MUX_s_1_2_2(mux_tmp_806, or_tmp_842, and_419_nl);
  assign mux_844_nl = MUX_s_1_2_2(mux_843_nl, mux_842_nl, fsm_output[3]);
  assign mux_840_nl = MUX_s_1_2_2(mux_tmp_806, or_tmp_842, fsm_output[0]);
  assign mux_841_nl = MUX_s_1_2_2(or_tmp_843, mux_840_nl, and_223_cse);
  assign mux_845_nl = MUX_s_1_2_2((~ mux_844_nl), mux_841_nl, fsm_output[6]);
  assign mux_854_nl = MUX_s_1_2_2(mux_853_nl, mux_845_nl, fsm_output[8]);
  assign mux_716_nl = MUX_s_1_2_2((~ or_tmp_842), (fsm_output[4]), fsm_output[0]);
  assign mux_837_nl = MUX_s_1_2_2((~ mux_tmp_806), mux_716_nl, fsm_output[1]);
  assign mux_838_nl = MUX_s_1_2_2(mux_837_nl, or_tmp_843, or_1011_cse);
  assign mux_835_nl = MUX_s_1_2_2(mux_tmp_807, or_tmp_842, or_1008_cse);
  assign mux_839_nl = MUX_s_1_2_2(mux_838_nl, mux_835_nl, fsm_output[6]);
  assign or_1012_nl = (fsm_output[8]) | mux_839_nl;
  assign mux_855_nl = MUX_s_1_2_2(mux_854_nl, or_1012_nl, fsm_output[7]);
  assign and_414_nl = (fsm_output[6]) & (fsm_output[1]) & (fsm_output[4]) & (fsm_output[0])
      & (fsm_output[5]);
  assign nor_331_nl = ~((fsm_output[6]) | (fsm_output[1]) | mux_tmp_831);
  assign mux_864_nl = MUX_s_1_2_2(and_414_nl, nor_331_nl, fsm_output[8]);
  assign mux_862_nl = MUX_s_1_2_2(nor_cse, or_987_cse, fsm_output[4]);
  assign nand_143_nl = ~((fsm_output[1]) & (~ mux_862_nl));
  assign mux_863_nl = MUX_s_1_2_2(nand_143_nl, mux_tmp_833, fsm_output[6]);
  assign nor_332_nl = ~((fsm_output[8]) | mux_863_nl);
  assign mux_865_nl = MUX_s_1_2_2(mux_864_nl, nor_332_nl, fsm_output[7]);
  assign or_1017_nl = (fsm_output[1]) | mux_tmp_831;
  assign mux_861_nl = MUX_s_1_2_2(mux_tmp_833, or_1017_nl, fsm_output[6]);
  assign nor_334_nl = ~((fsm_output[8:7]!=2'b00) | mux_861_nl);
  assign mux_866_nl = MUX_s_1_2_2(mux_865_nl, nor_334_nl, fsm_output[2]);
  assign and_416_nl = (fsm_output[1]) & (fsm_output[0]) & (fsm_output[5]);
  assign mux_856_nl = MUX_s_1_2_2(or_987_cse, (fsm_output[5]), fsm_output[4]);
  assign and_417_nl = (fsm_output[1]) & (~ mux_856_nl);
  assign mux_857_nl = MUX_s_1_2_2(and_416_nl, and_417_nl, fsm_output[6]);
  assign and_415_nl = (~((~ (fsm_output[2])) | (fsm_output[7]) | (~ (fsm_output[8]))))
      & mux_857_nl;
  assign COMP_LOOP_mux_19_nl = MUX_v_8_2_2((VEC_LOOP_j_sva_9_0[9:2]), ({1'b1 , (~
      (STAGE_LOOP_lshift_psp_sva[9:3]))}), and_dcpl_174);
  assign COMP_LOOP_or_30_nl = (~(nor_294_cse & (fsm_output[2:1]==2'b10) & and_dcpl_202
      & (fsm_output[5:4]==2'b01))) | and_dcpl_174;
  assign nl_acc_nl = ({COMP_LOOP_mux_19_nl , COMP_LOOP_or_30_nl}) + conv_u2u_8_9({COMP_LOOP_k_9_3_sva_5_0
      , (~ and_dcpl_174) , 1'b1});
  assign acc_nl = nl_acc_nl[8:0];
  assign z_out_1 = readslicef_9_8_1(acc_nl);
  assign STAGE_LOOP_STAGE_LOOP_or_1_nl = (~((fsm_output[7]) & (fsm_output[8]) & (fsm_output[3])
      & (fsm_output[2]) & (fsm_output[1]) & (~ (fsm_output[0])) & (~ (fsm_output[6]))
      & and_dcpl_175)) | mux_754_cse | and_dcpl_189;
  assign STAGE_LOOP_or_2_nl = mux_754_cse | and_dcpl_189;
  assign STAGE_LOOP_STAGE_LOOP_mux_2_nl = MUX_v_64_2_2(({60'b000000000000000000000000000000000000000000000000000000000000
      , STAGE_LOOP_i_3_0_sva}), (~ (z_out_3[63:0])), STAGE_LOOP_or_2_nl);
  assign nl_z_out_2 = ({STAGE_LOOP_STAGE_LOOP_or_1_nl , STAGE_LOOP_STAGE_LOOP_mux_2_nl})
      + 65'b00000000000000000000000000000000000000000000000000000000000000001;
  assign z_out_2 = nl_z_out_2[64:0];
  assign and_426_nl = nor_294_cse & and_dcpl_225 & and_dcpl_192;
  assign and_427_nl = nor_294_cse & (fsm_output[2:1]==2'b10) & and_dcpl_192;
  assign operator_64_false_mux1h_1_nl = MUX1HOT_v_64_3_2(p_sva, modExp_dev_exp_sva,
      ({modExp_dev_exp_1_sva_63_9 , COMP_LOOP_acc_10_cse_10_1_1_sva_5_0 , modExp_dev_exp_1_sva_2_0}),
      {and_426_nl , and_427_nl , mux_754_cse});
  assign nl_z_out_3 = conv_u2u_64_65(operator_64_false_mux1h_1_nl) + 65'b11111111111111111111111111111111111111111111111111111111111111111;
  assign z_out_3 = nl_z_out_3[64:0];
  assign COMP_LOOP_COMP_LOOP_or_1_nl = (VEC_LOOP_j_sva_9_0[9]) | and_dcpl_212 | and_dcpl_215
      | and_dcpl_222 | and_331_cse | and_dcpl_231;
  assign COMP_LOOP_or_31_nl = and_dcpl_212 | and_dcpl_215 | and_dcpl_222 | and_331_cse
      | and_dcpl_231;
  assign COMP_LOOP_COMP_LOOP_mux_5_nl = MUX_v_9_2_2((VEC_LOOP_j_sva_9_0[8:0]), (~
      (STAGE_LOOP_lshift_psp_sva[9:1])), COMP_LOOP_or_31_nl);
  assign COMP_LOOP_or_32_nl = (~ and_dcpl_208) | and_dcpl_212 | and_dcpl_215 | and_dcpl_222
      | and_331_cse | and_dcpl_231;
  assign COMP_LOOP_or_33_nl = and_dcpl_208 | and_331_cse;
  assign COMP_LOOP_mux1h_93_nl = MUX1HOT_v_3_5_2(3'b101, 3'b001, 3'b010, 3'b100,
      3'b110, {COMP_LOOP_or_33_nl , and_dcpl_212 , and_dcpl_215 , and_dcpl_222 ,
      and_dcpl_231});
  assign nl_acc_3_nl = ({COMP_LOOP_COMP_LOOP_or_1_nl , COMP_LOOP_COMP_LOOP_mux_5_nl
      , COMP_LOOP_or_32_nl}) + conv_u2u_10_11({COMP_LOOP_k_9_3_sva_5_0 , COMP_LOOP_mux1h_93_nl
      , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[10:0];
  assign z_out_4 = readslicef_11_10_1(acc_3_nl);
  assign COMP_LOOP_mux_20_nl = MUX_v_7_2_2(({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:4]))}),
      (VEC_LOOP_j_sva_9_0[9:3]), and_dcpl_247);
  assign COMP_LOOP_COMP_LOOP_nand_1_nl = ~(and_dcpl_247 & (~((fsm_output==9'b100111111))));
  assign nl_acc_4_nl = ({COMP_LOOP_mux_20_nl , COMP_LOOP_COMP_LOOP_nand_1_nl}) +
      conv_u2u_7_8({COMP_LOOP_k_9_3_sva_5_0 , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[7:0];
  assign z_out_5 = readslicef_8_7_1(acc_4_nl);
  assign operator_64_false_1_mux_1_nl = MUX_v_6_2_2((~ COMP_LOOP_k_9_3_sva_5_0),
      COMP_LOOP_k_9_3_sva_5_0, and_367_ssc);
  assign nl_z_out_6 = ({(~ and_367_ssc) , operator_64_false_1_mux_1_nl}) + 7'b0000001;
  assign z_out_6 = nl_z_out_6[6:0];
  assign and_429_nl = and_dcpl_207 & and_dcpl_273 & and_dcpl_201;
  assign and_430_nl = and_dcpl_281 & and_dcpl_265 & (fsm_output[5:4]==2'b00);
  assign and_431_nl = and_dcpl_281 & and_dcpl_202 & and_dcpl_283;
  assign and_432_nl = and_dcpl_54 & (~ (fsm_output[3])) & and_dcpl_225 & and_dcpl_202
      & and_dcpl_201;
  assign and_433_nl = and_dcpl_300 & and_dcpl_265 & and_dcpl_283;
  assign COMP_LOOP_mux1h_94_nl = MUX1HOT_v_3_6_2(3'b110, 3'b101, 3'b100, 3'b011,
      3'b010, 3'b001, {and_429_nl , and_430_nl , and_431_nl , and_331_cse , and_432_nl
      , and_433_nl});
  assign and_434_nl = and_dcpl_207 & and_dcpl_265 & and_dcpl_209;
  assign COMP_LOOP_COMP_LOOP_nor_30_nl = ~(MUX_v_3_2_2(COMP_LOOP_mux1h_94_nl, 3'b111,
      and_434_nl));
  assign and_435_nl = and_dcpl_300 & and_dcpl_273 & and_dcpl_209;
  assign COMP_LOOP_or_34_nl = MUX_v_3_2_2(COMP_LOOP_COMP_LOOP_nor_30_nl, 3'b111,
      and_435_nl);
  assign nl_acc_6_nl = conv_u2u_9_11({COMP_LOOP_k_9_3_sva_5_0 , COMP_LOOP_or_34_nl})
      + conv_u2u_10_11(VEC_LOOP_j_sva_9_0) + conv_u2u_10_11(STAGE_LOOP_lshift_psp_sva);
  assign acc_6_nl = nl_acc_6_nl[10:0];
  assign z_out_7_10_1 = readslicef_11_10_1(acc_6_nl);

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


  function automatic [2:0] MUX1HOT_v_3_5_2;
    input [2:0] input_4;
    input [2:0] input_3;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [4:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    result = result | ( input_3 & {3{sel[3]}});
    result = result | ( input_4 & {3{sel[4]}});
    MUX1HOT_v_3_5_2 = result;
  end
  endfunction


  function automatic [2:0] MUX1HOT_v_3_6_2;
    input [2:0] input_5;
    input [2:0] input_4;
    input [2:0] input_3;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [5:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    result = result | ( input_3 & {3{sel[3]}});
    result = result | ( input_4 & {3{sel[4]}});
    result = result | ( input_5 & {3{sel[5]}});
    MUX1HOT_v_3_6_2 = result;
  end
  endfunction


  function automatic [2:0] MUX1HOT_v_3_8_2;
    input [2:0] input_7;
    input [2:0] input_6;
    input [2:0] input_5;
    input [2:0] input_4;
    input [2:0] input_3;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [7:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    result = result | ( input_3 & {3{sel[3]}});
    result = result | ( input_4 & {3{sel[4]}});
    result = result | ( input_5 & {3{sel[5]}});
    result = result | ( input_6 & {3{sel[6]}});
    result = result | ( input_7 & {3{sel[7]}});
    MUX1HOT_v_3_8_2 = result;
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


  function automatic [6:0] MUX1HOT_v_7_9_2;
    input [6:0] input_8;
    input [6:0] input_7;
    input [6:0] input_6;
    input [6:0] input_5;
    input [6:0] input_4;
    input [6:0] input_3;
    input [6:0] input_2;
    input [6:0] input_1;
    input [6:0] input_0;
    input [8:0] sel;
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
    MUX1HOT_v_7_9_2 = result;
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


  function automatic [5:0] MUX_v_6_2_2;
    input [5:0] input_0;
    input [5:0] input_1;
    input [0:0] sel;
    reg [5:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_6_2_2 = result;
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


  function automatic [9:0] readslicef_11_10_1;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_11_10_1 = tmp[9:0];
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


  function automatic [0:0] readslicef_65_1_64;
    input [64:0] vector;
    reg [64:0] tmp;
  begin
    tmp = vector >> 64;
    readslicef_65_1_64 = tmp[0:0];
  end
  endfunction


  function automatic [6:0] readslicef_8_7_1;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_8_7_1 = tmp[6:0];
  end
  endfunction


  function automatic [7:0] readslicef_9_8_1;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_9_8_1 = tmp[7:0];
  end
  endfunction


  function automatic [64:0] conv_u2s_64_65 ;
    input [63:0]  vector ;
  begin
    conv_u2s_64_65 =  {1'b0, vector};
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


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
  end
  endfunction


  function automatic [10:0] conv_u2u_9_11 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_11 = {{2{1'b0}}, vector};
  end
  endfunction


  function automatic [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
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
      r_rsc_dat, r_rsc_triosy_lz
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


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_7_64_128_128_64_1_gen vec_rsc_0_0_i
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_7_64_128_128_64_1_gen vec_rsc_0_1_i
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_7_64_128_128_64_1_gen vec_rsc_0_2_i
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_7_64_128_128_64_1_gen vec_rsc_0_3_i
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_7_64_128_128_64_1_gen vec_rsc_0_4_i
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_7_64_128_128_64_1_gen vec_rsc_0_5_i
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_7_64_128_128_64_1_gen vec_rsc_0_6_i
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
  inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_7_64_128_128_64_1_gen vec_rsc_0_7_i
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
  inPlaceNTT_DIT_core inPlaceNTT_DIT_core_inst (
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
      .r_rsc_dat(r_rsc_dat),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
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
      .vec_rsc_0_7_i_we_d_pff(vec_rsc_0_7_i_we_d_iff)
    );
endmodule



