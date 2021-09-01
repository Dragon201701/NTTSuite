
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

//------> ../td_ccore_solutions/modulo_dev_d3e65941ee7586d7daaa2e36d0d005555a5b_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Thu Aug 26 01:37:26 2021
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
  reg [63:0] result_rem_12_cmp_a;
  reg [63:0] result_rem_12_cmp_b;
  wire [63:0] result_rem_12_cmp_z;
  reg [63:0] result_rem_12_cmp_1_a;
  reg [63:0] result_rem_12_cmp_1_b;
  wire [63:0] result_rem_12_cmp_1_z;
  reg [63:0] result_rem_12_cmp_2_a;
  reg [63:0] result_rem_12_cmp_2_b;
  wire [63:0] result_rem_12_cmp_2_z;
  reg [63:0] result_rem_12_cmp_3_a;
  reg [63:0] result_rem_12_cmp_3_b;
  wire [63:0] result_rem_12_cmp_3_z;
  reg [63:0] result_rem_12_cmp_4_a;
  reg [63:0] result_rem_12_cmp_4_b;
  wire [63:0] result_rem_12_cmp_4_z;
  reg [63:0] result_rem_12_cmp_5_a;
  reg [63:0] result_rem_12_cmp_5_b;
  wire [63:0] result_rem_12_cmp_5_z;
  reg [63:0] result_rem_12_cmp_6_a;
  reg [63:0] result_rem_12_cmp_6_b;
  wire [63:0] result_rem_12_cmp_6_z;
  reg [63:0] result_rem_12_cmp_7_a;
  reg [63:0] result_rem_12_cmp_7_b;
  wire [63:0] result_rem_12_cmp_7_z;
  reg [63:0] result_rem_12_cmp_8_a;
  reg [63:0] result_rem_12_cmp_8_b;
  wire [63:0] result_rem_12_cmp_8_z;
  reg [63:0] result_rem_12_cmp_9_a;
  reg [63:0] result_rem_12_cmp_9_b;
  wire [63:0] result_rem_12_cmp_9_z;
  reg [63:0] result_rem_12_cmp_10_a;
  reg [63:0] result_rem_12_cmp_10_b;
  wire [63:0] result_rem_12_cmp_10_z;
  wire [3:0] result_result_acc_tmp;
  wire [4:0] nl_result_result_acc_tmp;
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
  wire and_dcpl_26;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_30;
  wire and_dcpl_31;
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
  wire and_dcpl_42;
  wire and_dcpl_43;
  wire and_dcpl_45;
  wire and_dcpl_47;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire and_dcpl_54;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire and_dcpl_65;
  wire and_dcpl_66;
  wire and_dcpl_68;
  wire and_dcpl_70;
  wire and_dcpl_72;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire and_dcpl_75;
  wire and_dcpl_76;
  wire and_dcpl_77;
  wire and_dcpl_78;
  wire and_dcpl_79;
  wire and_dcpl_80;
  wire and_dcpl_81;
  wire and_dcpl_82;
  wire and_dcpl_83;
  wire and_dcpl_84;
  wire and_dcpl_85;
  wire and_dcpl_86;
  wire and_dcpl_88;
  wire and_dcpl_89;
  wire and_dcpl_91;
  wire and_dcpl_92;
  wire and_dcpl_94;
  wire and_dcpl_96;
  wire and_dcpl_98;
  wire and_dcpl_99;
  wire and_dcpl_100;
  wire and_dcpl_101;
  wire and_dcpl_102;
  wire and_dcpl_103;
  wire and_dcpl_104;
  wire and_dcpl_105;
  wire and_dcpl_106;
  wire and_dcpl_107;
  wire and_dcpl_108;
  wire and_dcpl_109;
  wire and_dcpl_110;
  wire and_dcpl_111;
  wire and_dcpl_112;
  wire and_dcpl_113;
  wire and_dcpl_114;
  wire and_dcpl_115;
  wire and_dcpl_116;
  wire and_dcpl_117;
  wire and_dcpl_118;
  wire and_dcpl_119;
  wire and_dcpl_120;
  wire and_dcpl_122;
  wire and_dcpl_125;
  wire and_dcpl_127;
  wire and_dcpl_128;
  wire and_dcpl_129;
  wire and_dcpl_130;
  wire and_dcpl_131;
  wire and_dcpl_132;
  wire and_dcpl_133;
  wire and_dcpl_134;
  wire and_dcpl_135;
  wire and_dcpl_136;
  wire and_dcpl_137;
  wire and_dcpl_139;
  wire and_dcpl_140;
  wire and_dcpl_142;
  wire and_dcpl_143;
  wire and_dcpl_145;
  wire and_dcpl_147;
  wire and_dcpl_149;
  wire and_dcpl_150;
  wire and_dcpl_151;
  wire and_dcpl_152;
  wire and_dcpl_153;
  wire and_dcpl_154;
  wire and_dcpl_155;
  wire and_dcpl_156;
  wire and_dcpl_157;
  wire and_dcpl_158;
  wire and_dcpl_159;
  wire and_dcpl_160;
  wire and_dcpl_161;
  wire and_dcpl_162;
  wire and_dcpl_163;
  wire and_dcpl_165;
  wire and_dcpl_166;
  wire and_dcpl_168;
  wire and_dcpl_170;
  wire and_dcpl_171;
  wire and_dcpl_173;
  wire and_dcpl_175;
  wire and_dcpl_176;
  wire and_dcpl_177;
  wire and_dcpl_178;
  wire and_dcpl_179;
  wire and_dcpl_180;
  wire and_dcpl_181;
  wire and_dcpl_182;
  wire and_dcpl_183;
  wire and_dcpl_184;
  wire and_dcpl_185;
  wire and_dcpl_186;
  wire and_dcpl_187;
  wire and_dcpl_188;
  wire and_dcpl_189;
  wire and_dcpl_191;
  wire and_dcpl_192;
  wire and_dcpl_194;
  wire and_dcpl_196;
  wire and_dcpl_197;
  wire and_dcpl_199;
  wire and_dcpl_201;
  wire and_dcpl_202;
  wire and_dcpl_203;
  wire and_dcpl_204;
  wire and_dcpl_205;
  wire and_dcpl_206;
  wire and_dcpl_207;
  wire and_dcpl_208;
  wire and_dcpl_209;
  wire and_dcpl_211;
  wire and_dcpl_212;
  wire and_dcpl_214;
  wire and_dcpl_218;
  wire and_dcpl_221;
  wire and_dcpl_228;
  wire and_dcpl_232;
  wire and_dcpl_233;
  wire and_dcpl_234;
  wire and_dcpl_235;
  wire and_dcpl_237;
  wire and_dcpl_239;
  wire and_dcpl_240;
  wire and_dcpl_244;
  wire and_dcpl_249;
  wire and_dcpl_254;
  wire and_dcpl_260;
  wire and_dcpl_261;
  wire and_dcpl_262;
  wire and_dcpl_263;
  wire or_tmp_2;
  wire and_dcpl_269;
  wire mux_tmp_1;
  wire and_dcpl_275;
  wire mux_tmp_3;
  wire mux_tmp_4;
  wire and_dcpl_281;
  wire mux_tmp_6;
  wire mux_tmp_7;
  wire mux_tmp_8;
  wire and_dcpl_287;
  wire mux_tmp_10;
  wire mux_tmp_11;
  wire mux_tmp_12;
  wire mux_tmp_13;
  wire and_dcpl_293;
  wire mux_tmp_15;
  wire mux_tmp_16;
  wire mux_tmp_17;
  wire mux_tmp_18;
  wire mux_tmp_19;
  wire and_dcpl_299;
  wire mux_tmp_21;
  wire mux_tmp_22;
  wire mux_tmp_23;
  wire mux_tmp_24;
  wire mux_tmp_25;
  wire mux_tmp_26;
  wire and_dcpl_305;
  wire mux_tmp_28;
  wire mux_tmp_29;
  wire mux_tmp_30;
  wire mux_tmp_31;
  wire mux_tmp_32;
  wire mux_tmp_33;
  wire mux_tmp_34;
  wire and_dcpl_311;
  wire and_tmp_6;
  wire mux_tmp_36;
  wire mux_tmp_37;
  wire and_dcpl_318;
  wire and_dcpl_319;
  wire or_tmp_102;
  wire and_dcpl_322;
  wire mux_tmp_39;
  wire and_dcpl_325;
  wire mux_tmp_41;
  wire mux_tmp_42;
  wire and_dcpl_329;
  wire mux_tmp_44;
  wire mux_tmp_45;
  wire mux_tmp_46;
  wire and_dcpl_333;
  wire mux_tmp_48;
  wire mux_tmp_49;
  wire mux_tmp_50;
  wire mux_tmp_51;
  wire and_dcpl_337;
  wire mux_tmp_53;
  wire mux_tmp_54;
  wire mux_tmp_55;
  wire mux_tmp_56;
  wire mux_tmp_57;
  wire and_dcpl_341;
  wire mux_tmp_59;
  wire mux_tmp_60;
  wire mux_tmp_61;
  wire mux_tmp_62;
  wire mux_tmp_63;
  wire mux_tmp_64;
  wire and_dcpl_344;
  wire mux_tmp_66;
  wire mux_tmp_67;
  wire mux_tmp_68;
  wire mux_tmp_69;
  wire mux_tmp_70;
  wire mux_tmp_71;
  wire mux_tmp_72;
  wire and_dcpl_347;
  wire and_tmp_13;
  wire mux_tmp_74;
  wire mux_tmp_75;
  wire and_dcpl_352;
  wire and_dcpl_353;
  wire or_tmp_202;
  wire and_dcpl_357;
  wire mux_tmp_77;
  wire and_dcpl_361;
  wire mux_tmp_79;
  wire mux_tmp_80;
  wire and_dcpl_364;
  wire mux_tmp_82;
  wire mux_tmp_83;
  wire mux_tmp_84;
  wire and_dcpl_367;
  wire mux_tmp_86;
  wire mux_tmp_87;
  wire mux_tmp_88;
  wire mux_tmp_89;
  wire and_dcpl_370;
  wire mux_tmp_91;
  wire mux_tmp_92;
  wire mux_tmp_93;
  wire mux_tmp_94;
  wire mux_tmp_95;
  wire and_dcpl_373;
  wire mux_tmp_97;
  wire mux_tmp_98;
  wire mux_tmp_99;
  wire mux_tmp_100;
  wire mux_tmp_101;
  wire mux_tmp_102;
  wire and_dcpl_377;
  wire mux_tmp_104;
  wire mux_tmp_105;
  wire mux_tmp_106;
  wire mux_tmp_107;
  wire mux_tmp_108;
  wire mux_tmp_109;
  wire mux_tmp_110;
  wire and_dcpl_381;
  wire and_tmp_20;
  wire mux_tmp_112;
  wire mux_tmp_113;
  wire and_dcpl_386;
  wire and_dcpl_387;
  wire or_tmp_302;
  wire and_dcpl_390;
  wire mux_tmp_115;
  wire and_dcpl_393;
  wire mux_tmp_117;
  wire mux_tmp_118;
  wire and_dcpl_396;
  wire mux_tmp_120;
  wire mux_tmp_121;
  wire mux_tmp_122;
  wire and_dcpl_399;
  wire mux_tmp_124;
  wire mux_tmp_125;
  wire mux_tmp_126;
  wire mux_tmp_127;
  wire and_dcpl_402;
  wire mux_tmp_129;
  wire mux_tmp_130;
  wire mux_tmp_131;
  wire mux_tmp_132;
  wire mux_tmp_133;
  wire and_dcpl_405;
  wire mux_tmp_135;
  wire mux_tmp_136;
  wire mux_tmp_137;
  wire mux_tmp_138;
  wire mux_tmp_139;
  wire mux_tmp_140;
  wire and_dcpl_408;
  wire mux_tmp_142;
  wire mux_tmp_143;
  wire mux_tmp_144;
  wire mux_tmp_145;
  wire mux_tmp_146;
  wire mux_tmp_147;
  wire mux_tmp_148;
  wire and_dcpl_411;
  wire and_tmp_27;
  wire mux_tmp_150;
  wire mux_tmp_151;
  wire and_dcpl_417;
  wire and_dcpl_418;
  wire or_tmp_402;
  wire and_dcpl_422;
  wire mux_tmp_153;
  wire and_dcpl_426;
  wire mux_tmp_155;
  wire mux_tmp_156;
  wire and_dcpl_430;
  wire mux_tmp_158;
  wire mux_tmp_159;
  wire mux_tmp_160;
  wire and_dcpl_433;
  wire mux_tmp_162;
  wire mux_tmp_163;
  wire mux_tmp_164;
  wire mux_tmp_165;
  wire and_dcpl_437;
  wire mux_tmp_167;
  wire mux_tmp_168;
  wire mux_tmp_169;
  wire mux_tmp_170;
  wire mux_tmp_171;
  wire and_dcpl_441;
  wire mux_tmp_173;
  wire mux_tmp_174;
  wire mux_tmp_175;
  wire mux_tmp_176;
  wire mux_tmp_177;
  wire mux_tmp_178;
  wire and_dcpl_444;
  wire mux_tmp_180;
  wire mux_tmp_181;
  wire mux_tmp_182;
  wire mux_tmp_183;
  wire mux_tmp_184;
  wire mux_tmp_185;
  wire mux_tmp_186;
  wire and_dcpl_447;
  wire and_tmp_34;
  wire mux_tmp_188;
  wire mux_tmp_189;
  wire and_dcpl_452;
  wire or_tmp_502;
  wire and_dcpl_455;
  wire mux_tmp_191;
  wire and_dcpl_458;
  wire mux_tmp_193;
  wire mux_tmp_194;
  wire and_dcpl_462;
  wire mux_tmp_196;
  wire mux_tmp_197;
  wire mux_tmp_198;
  wire and_dcpl_464;
  wire mux_tmp_200;
  wire mux_tmp_201;
  wire mux_tmp_202;
  wire mux_tmp_203;
  wire and_dcpl_468;
  wire mux_tmp_205;
  wire mux_tmp_206;
  wire mux_tmp_207;
  wire mux_tmp_208;
  wire mux_tmp_209;
  wire and_dcpl_472;
  wire mux_tmp_211;
  wire mux_tmp_212;
  wire mux_tmp_213;
  wire mux_tmp_214;
  wire mux_tmp_215;
  wire mux_tmp_216;
  wire and_dcpl_474;
  wire mux_tmp_218;
  wire mux_tmp_219;
  wire mux_tmp_220;
  wire mux_tmp_221;
  wire mux_tmp_222;
  wire mux_tmp_223;
  wire mux_tmp_224;
  wire and_dcpl_476;
  wire and_tmp_41;
  wire mux_tmp_226;
  wire mux_tmp_227;
  wire and_dcpl_480;
  wire or_tmp_602;
  wire and_dcpl_484;
  wire mux_tmp_229;
  wire and_dcpl_488;
  wire mux_tmp_231;
  wire mux_tmp_232;
  wire and_dcpl_491;
  wire mux_tmp_234;
  wire mux_tmp_235;
  wire mux_tmp_236;
  wire and_dcpl_493;
  wire mux_tmp_238;
  wire mux_tmp_239;
  wire mux_tmp_240;
  wire mux_tmp_241;
  wire and_dcpl_496;
  wire mux_tmp_243;
  wire mux_tmp_244;
  wire mux_tmp_245;
  wire mux_tmp_246;
  wire mux_tmp_247;
  wire and_dcpl_499;
  wire mux_tmp_249;
  wire mux_tmp_250;
  wire mux_tmp_251;
  wire mux_tmp_252;
  wire mux_tmp_253;
  wire mux_tmp_254;
  wire and_dcpl_501;
  wire mux_tmp_256;
  wire mux_tmp_257;
  wire mux_tmp_258;
  wire mux_tmp_259;
  wire mux_tmp_260;
  wire mux_tmp_261;
  wire mux_tmp_262;
  wire and_dcpl_503;
  wire and_tmp_48;
  wire mux_tmp_264;
  wire mux_tmp_265;
  wire and_dcpl_507;
  wire or_tmp_702;
  wire and_dcpl_510;
  wire mux_tmp_267;
  wire and_dcpl_513;
  wire mux_tmp_269;
  wire mux_tmp_270;
  wire and_dcpl_516;
  wire mux_tmp_272;
  wire mux_tmp_273;
  wire mux_tmp_274;
  wire and_dcpl_518;
  wire mux_tmp_276;
  wire mux_tmp_277;
  wire mux_tmp_278;
  wire mux_tmp_279;
  wire and_dcpl_521;
  wire mux_tmp_281;
  wire mux_tmp_282;
  wire mux_tmp_283;
  wire mux_tmp_284;
  wire mux_tmp_285;
  wire and_dcpl_524;
  wire mux_tmp_287;
  wire mux_tmp_288;
  wire mux_tmp_289;
  wire mux_tmp_290;
  wire mux_tmp_291;
  wire mux_tmp_292;
  wire and_dcpl_526;
  wire mux_tmp_294;
  wire mux_tmp_295;
  wire mux_tmp_296;
  wire mux_tmp_297;
  wire mux_tmp_298;
  wire mux_tmp_299;
  wire mux_tmp_300;
  wire and_dcpl_528;
  wire and_tmp_55;
  wire mux_tmp_302;
  wire mux_tmp_303;
  wire and_dcpl_532;
  wire and_dcpl_533;
  wire not_tmp_645;
  wire or_tmp_801;
  wire and_dcpl_536;
  wire mux_tmp_305;
  wire and_dcpl_539;
  wire mux_tmp_307;
  wire mux_tmp_308;
  wire and_dcpl_542;
  wire mux_tmp_310;
  wire mux_tmp_311;
  wire mux_tmp_312;
  wire and_dcpl_546;
  wire mux_tmp_314;
  wire mux_tmp_315;
  wire mux_tmp_316;
  wire mux_tmp_317;
  wire and_dcpl_549;
  wire mux_tmp_319;
  wire mux_tmp_320;
  wire mux_tmp_321;
  wire mux_tmp_322;
  wire mux_tmp_323;
  wire and_dcpl_552;
  wire mux_tmp_325;
  wire mux_tmp_326;
  wire mux_tmp_327;
  wire mux_tmp_328;
  wire mux_tmp_329;
  wire mux_tmp_330;
  wire and_dcpl_556;
  wire mux_tmp_332;
  wire mux_tmp_333;
  wire mux_tmp_334;
  wire mux_tmp_335;
  wire mux_tmp_336;
  wire mux_tmp_337;
  wire mux_tmp_338;
  wire and_dcpl_560;
  wire or_tmp_897;
  wire mux_tmp_340;
  wire mux_tmp_341;
  wire mux_tmp_342;
  wire mux_tmp_343;
  wire mux_tmp_344;
  wire mux_tmp_345;
  wire mux_tmp_346;
  wire mux_tmp_347;
  wire mux_tmp_348;
  wire and_dcpl_566;
  wire or_tmp_909;
  wire and_dcpl_568;
  wire mux_tmp_350;
  wire and_dcpl_570;
  wire mux_tmp_352;
  wire mux_tmp_353;
  wire and_dcpl_572;
  wire mux_tmp_355;
  wire mux_tmp_356;
  wire mux_tmp_357;
  wire and_dcpl_576;
  wire mux_tmp_359;
  wire mux_tmp_360;
  wire mux_tmp_361;
  wire mux_tmp_362;
  wire and_dcpl_578;
  wire mux_tmp_364;
  wire mux_tmp_365;
  wire mux_tmp_366;
  wire mux_tmp_367;
  wire mux_tmp_368;
  wire and_dcpl_580;
  wire mux_tmp_370;
  wire mux_tmp_371;
  wire mux_tmp_372;
  wire mux_tmp_373;
  wire mux_tmp_374;
  wire mux_tmp_375;
  wire and_dcpl_583;
  wire mux_tmp_377;
  wire mux_tmp_378;
  wire mux_tmp_379;
  wire mux_tmp_380;
  wire mux_tmp_381;
  wire mux_tmp_382;
  wire mux_tmp_383;
  wire and_dcpl_586;
  wire or_tmp_1005;
  wire mux_tmp_385;
  wire mux_tmp_386;
  wire mux_tmp_387;
  wire mux_tmp_388;
  wire mux_tmp_389;
  wire mux_tmp_390;
  wire mux_tmp_391;
  wire mux_tmp_392;
  wire mux_tmp_393;
  wire and_dcpl_590;
  wire or_tmp_1017;
  wire and_dcpl_592;
  wire mux_tmp_395;
  wire and_dcpl_594;
  wire mux_tmp_397;
  wire mux_tmp_398;
  wire and_dcpl_596;
  wire mux_tmp_400;
  wire mux_tmp_401;
  wire mux_tmp_402;
  wire and_dcpl_599;
  wire mux_tmp_404;
  wire mux_tmp_405;
  wire mux_tmp_406;
  wire mux_tmp_407;
  wire and_dcpl_601;
  wire mux_tmp_409;
  wire mux_tmp_410;
  wire mux_tmp_411;
  wire mux_tmp_412;
  wire mux_tmp_413;
  wire and_dcpl_603;
  wire mux_tmp_415;
  wire mux_tmp_416;
  wire mux_tmp_417;
  wire mux_tmp_418;
  wire mux_tmp_419;
  wire mux_tmp_420;
  wire and_dcpl_607;
  wire mux_tmp_422;
  wire mux_tmp_423;
  wire mux_tmp_424;
  wire mux_tmp_425;
  wire mux_tmp_426;
  wire mux_tmp_427;
  wire mux_tmp_428;
  wire and_dcpl_611;
  wire or_tmp_1113;
  wire mux_tmp_430;
  wire mux_tmp_431;
  wire mux_tmp_432;
  wire mux_tmp_433;
  wire mux_tmp_434;
  wire mux_tmp_435;
  wire mux_tmp_436;
  wire mux_tmp_437;
  wire mux_tmp_438;
  reg main_stage_0_11;
  reg asn_itm_10;
  reg [3:0] result_rem_11cyc_st_9;
  reg [3:0] result_rem_11cyc_st_8;
  reg [3:0] result_rem_11cyc_st_7;
  reg [3:0] result_rem_11cyc_st_6;
  reg [3:0] result_rem_11cyc_st_5;
  reg [3:0] result_rem_11cyc_st_4;
  reg [3:0] result_rem_11cyc_st_3;
  reg [3:0] result_rem_11cyc_st_2;
  reg [3:0] result_rem_11cyc;
  reg [3:0] result_rem_11cyc_st_11;
  reg asn_itm_11;
  reg main_stage_0_12;
  reg main_stage_0_3;
  reg asn_itm_2;
  reg main_stage_0_4;
  reg asn_itm_3;
  reg main_stage_0_5;
  reg asn_itm_4;
  reg main_stage_0_6;
  reg asn_itm_5;
  reg main_stage_0_7;
  reg asn_itm_6;
  reg main_stage_0_8;
  reg asn_itm_7;
  reg main_stage_0_9;
  reg asn_itm_8;
  reg main_stage_0_10;
  reg asn_itm_9;
  reg main_stage_0_2;
  reg asn_itm_1;
  wire result_and_1_cse;
  wire result_and_3_cse;
  wire result_and_5_cse;
  wire result_and_7_cse;
  wire result_and_9_cse;
  wire result_and_11_cse;
  wire result_and_13_cse;
  wire result_and_15_cse;
  wire result_and_17_cse;
  wire result_and_19_cse;
  wire result_and_21_cse;
  wire or_3_cse;
  wire or_8_cse;
  wire or_15_cse;
  wire or_24_cse;
  wire or_35_cse;
  wire or_48_cse;
  wire or_63_cse;
  wire or_107_cse;
  wire or_112_cse;
  wire or_119_cse;
  wire or_128_cse;
  wire or_139_cse;
  wire or_152_cse;
  wire or_167_cse;
  wire or_209_cse;
  wire or_214_cse;
  wire or_221_cse;
  wire or_230_cse;
  wire or_241_cse;
  wire or_254_cse;
  wire or_269_cse;
  wire or_311_cse;
  wire or_316_cse;
  wire or_323_cse;
  wire or_332_cse;
  wire or_343_cse;
  wire or_356_cse;
  wire or_371_cse;
  wire nand_144_cse;
  wire or_413_cse;
  wire or_418_cse;
  wire or_425_cse;
  wire or_434_cse;
  wire or_445_cse;
  wire or_458_cse;
  wire or_473_cse;
  wire nand_138_cse;
  wire or_516_cse;
  wire or_521_cse;
  wire or_528_cse;
  wire or_537_cse;
  wire and_790_cse;
  wire or_548_cse;
  wire or_561_cse;
  wire or_576_cse;
  wire nand_146_cse;
  wire or_617_cse;
  wire or_622_cse;
  wire or_629_cse;
  wire or_638_cse;
  wire or_649_cse;
  wire or_662_cse;
  wire or_677_cse;
  wire or_718_cse;
  wire nand_112_cse;
  wire nand_108_cse;
  wire nand_103_cse;
  wire nand_97_cse;
  wire or_763_cse;
  wire nand_83_cse;
  wire or_818_cse;
  wire or_823_cse;
  wire or_830_cse;
  wire or_839_cse;
  wire nand_58_cse;
  wire or_850_cse;
  wire nand_55_cse;
  wire or_863_cse;
  wire nand_51_cse;
  wire or_878_cse;
  wire and_749_cse;
  wire or_928_cse;
  wire and_747_cse;
  wire or_933_cse;
  wire and_744_cse;
  wire or_940_cse;
  wire and_740_cse;
  wire or_949_cse;
  wire or_960_cse;
  wire and_731_cse;
  wire or_973_cse;
  wire and_725_cse;
  wire nand_42_cse;
  wire or_988_cse;
  wire or_1037_cse;
  wire or_1042_cse;
  wire or_1049_cse;
  wire or_1058_cse;
  wire or_1069_cse;
  wire or_1082_cse;
  wire or_1097_cse;
  reg [63:0] base_buf_sva_mut_2;
  reg [63:0] base_buf_sva_mut_3;
  reg [63:0] base_buf_sva_mut_4;
  reg [63:0] base_buf_sva_mut_5;
  reg [63:0] base_buf_sva_mut_6;
  reg [63:0] base_buf_sva_mut_7;
  reg [63:0] base_buf_sva_mut_8;
  reg [63:0] base_buf_sva_mut_9;
  reg [63:0] base_buf_sva_mut_10;
  reg [63:0] m_buf_sva_mut_2;
  reg [63:0] m_buf_sva_mut_3;
  reg [63:0] m_buf_sva_mut_4;
  reg [63:0] m_buf_sva_mut_5;
  reg [63:0] m_buf_sva_mut_6;
  reg [63:0] m_buf_sva_mut_7;
  reg [63:0] m_buf_sva_mut_8;
  reg [63:0] m_buf_sva_mut_9;
  reg [63:0] m_buf_sva_mut_10;
  reg [63:0] base_buf_sva_mut_1_2;
  reg [63:0] base_buf_sva_mut_1_3;
  reg [63:0] base_buf_sva_mut_1_4;
  reg [63:0] base_buf_sva_mut_1_5;
  reg [63:0] base_buf_sva_mut_1_6;
  reg [63:0] base_buf_sva_mut_1_7;
  reg [63:0] base_buf_sva_mut_1_8;
  reg [63:0] base_buf_sva_mut_1_9;
  reg [63:0] base_buf_sva_mut_1_10;
  reg [63:0] m_buf_sva_mut_1_2;
  reg [63:0] m_buf_sva_mut_1_3;
  reg [63:0] m_buf_sva_mut_1_4;
  reg [63:0] m_buf_sva_mut_1_5;
  reg [63:0] m_buf_sva_mut_1_6;
  reg [63:0] m_buf_sva_mut_1_7;
  reg [63:0] m_buf_sva_mut_1_8;
  reg [63:0] m_buf_sva_mut_1_9;
  reg [63:0] m_buf_sva_mut_1_10;
  reg [63:0] base_buf_sva_mut_2_2;
  reg [63:0] base_buf_sva_mut_2_3;
  reg [63:0] base_buf_sva_mut_2_4;
  reg [63:0] base_buf_sva_mut_2_5;
  reg [63:0] base_buf_sva_mut_2_6;
  reg [63:0] base_buf_sva_mut_2_7;
  reg [63:0] base_buf_sva_mut_2_8;
  reg [63:0] base_buf_sva_mut_2_9;
  reg [63:0] base_buf_sva_mut_2_10;
  reg [63:0] m_buf_sva_mut_2_2;
  reg [63:0] m_buf_sva_mut_2_3;
  reg [63:0] m_buf_sva_mut_2_4;
  reg [63:0] m_buf_sva_mut_2_5;
  reg [63:0] m_buf_sva_mut_2_6;
  reg [63:0] m_buf_sva_mut_2_7;
  reg [63:0] m_buf_sva_mut_2_8;
  reg [63:0] m_buf_sva_mut_2_9;
  reg [63:0] m_buf_sva_mut_2_10;
  reg [63:0] base_buf_sva_mut_3_2;
  reg [63:0] base_buf_sva_mut_3_3;
  reg [63:0] base_buf_sva_mut_3_4;
  reg [63:0] base_buf_sva_mut_3_5;
  reg [63:0] base_buf_sva_mut_3_6;
  reg [63:0] base_buf_sva_mut_3_7;
  reg [63:0] base_buf_sva_mut_3_8;
  reg [63:0] base_buf_sva_mut_3_9;
  reg [63:0] base_buf_sva_mut_3_10;
  reg [63:0] m_buf_sva_mut_3_2;
  reg [63:0] m_buf_sva_mut_3_3;
  reg [63:0] m_buf_sva_mut_3_4;
  reg [63:0] m_buf_sva_mut_3_5;
  reg [63:0] m_buf_sva_mut_3_6;
  reg [63:0] m_buf_sva_mut_3_7;
  reg [63:0] m_buf_sva_mut_3_8;
  reg [63:0] m_buf_sva_mut_3_9;
  reg [63:0] m_buf_sva_mut_3_10;
  reg [63:0] base_buf_sva_mut_4_2;
  reg [63:0] base_buf_sva_mut_4_3;
  reg [63:0] base_buf_sva_mut_4_4;
  reg [63:0] base_buf_sva_mut_4_5;
  reg [63:0] base_buf_sva_mut_4_6;
  reg [63:0] base_buf_sva_mut_4_7;
  reg [63:0] base_buf_sva_mut_4_8;
  reg [63:0] base_buf_sva_mut_4_9;
  reg [63:0] base_buf_sva_mut_4_10;
  reg [63:0] m_buf_sva_mut_4_2;
  reg [63:0] m_buf_sva_mut_4_3;
  reg [63:0] m_buf_sva_mut_4_4;
  reg [63:0] m_buf_sva_mut_4_5;
  reg [63:0] m_buf_sva_mut_4_6;
  reg [63:0] m_buf_sva_mut_4_7;
  reg [63:0] m_buf_sva_mut_4_8;
  reg [63:0] m_buf_sva_mut_4_9;
  reg [63:0] m_buf_sva_mut_4_10;
  reg [63:0] base_buf_sva_mut_5_2;
  reg [63:0] base_buf_sva_mut_5_3;
  reg [63:0] base_buf_sva_mut_5_4;
  reg [63:0] base_buf_sva_mut_5_5;
  reg [63:0] base_buf_sva_mut_5_6;
  reg [63:0] base_buf_sva_mut_5_7;
  reg [63:0] base_buf_sva_mut_5_8;
  reg [63:0] base_buf_sva_mut_5_9;
  reg [63:0] base_buf_sva_mut_5_10;
  reg [63:0] m_buf_sva_mut_5_2;
  reg [63:0] m_buf_sva_mut_5_3;
  reg [63:0] m_buf_sva_mut_5_4;
  reg [63:0] m_buf_sva_mut_5_5;
  reg [63:0] m_buf_sva_mut_5_6;
  reg [63:0] m_buf_sva_mut_5_7;
  reg [63:0] m_buf_sva_mut_5_8;
  reg [63:0] m_buf_sva_mut_5_9;
  reg [63:0] m_buf_sva_mut_5_10;
  reg [63:0] base_buf_sva_mut_6_2;
  reg [63:0] base_buf_sva_mut_6_3;
  reg [63:0] base_buf_sva_mut_6_4;
  reg [63:0] base_buf_sva_mut_6_5;
  reg [63:0] base_buf_sva_mut_6_6;
  reg [63:0] base_buf_sva_mut_6_7;
  reg [63:0] base_buf_sva_mut_6_8;
  reg [63:0] base_buf_sva_mut_6_9;
  reg [63:0] base_buf_sva_mut_6_10;
  reg [63:0] m_buf_sva_mut_6_2;
  reg [63:0] m_buf_sva_mut_6_3;
  reg [63:0] m_buf_sva_mut_6_4;
  reg [63:0] m_buf_sva_mut_6_5;
  reg [63:0] m_buf_sva_mut_6_6;
  reg [63:0] m_buf_sva_mut_6_7;
  reg [63:0] m_buf_sva_mut_6_8;
  reg [63:0] m_buf_sva_mut_6_9;
  reg [63:0] m_buf_sva_mut_6_10;
  reg [63:0] base_buf_sva_mut_7_2;
  reg [63:0] base_buf_sva_mut_7_3;
  reg [63:0] base_buf_sva_mut_7_4;
  reg [63:0] base_buf_sva_mut_7_5;
  reg [63:0] base_buf_sva_mut_7_6;
  reg [63:0] base_buf_sva_mut_7_7;
  reg [63:0] base_buf_sva_mut_7_8;
  reg [63:0] base_buf_sva_mut_7_9;
  reg [63:0] base_buf_sva_mut_7_10;
  reg [63:0] m_buf_sva_mut_7_2;
  reg [63:0] m_buf_sva_mut_7_3;
  reg [63:0] m_buf_sva_mut_7_4;
  reg [63:0] m_buf_sva_mut_7_5;
  reg [63:0] m_buf_sva_mut_7_6;
  reg [63:0] m_buf_sva_mut_7_7;
  reg [63:0] m_buf_sva_mut_7_8;
  reg [63:0] m_buf_sva_mut_7_9;
  reg [63:0] m_buf_sva_mut_7_10;
  reg [63:0] base_buf_sva_mut_8_2;
  reg [63:0] base_buf_sva_mut_8_3;
  reg [63:0] base_buf_sva_mut_8_4;
  reg [63:0] base_buf_sva_mut_8_5;
  reg [63:0] base_buf_sva_mut_8_6;
  reg [63:0] base_buf_sva_mut_8_7;
  reg [63:0] base_buf_sva_mut_8_8;
  reg [63:0] base_buf_sva_mut_8_9;
  reg [63:0] base_buf_sva_mut_8_10;
  reg [63:0] m_buf_sva_mut_8_2;
  reg [63:0] m_buf_sva_mut_8_3;
  reg [63:0] m_buf_sva_mut_8_4;
  reg [63:0] m_buf_sva_mut_8_5;
  reg [63:0] m_buf_sva_mut_8_6;
  reg [63:0] m_buf_sva_mut_8_7;
  reg [63:0] m_buf_sva_mut_8_8;
  reg [63:0] m_buf_sva_mut_8_9;
  reg [63:0] m_buf_sva_mut_8_10;
  reg [63:0] base_buf_sva_mut_9_2;
  reg [63:0] base_buf_sva_mut_9_3;
  reg [63:0] base_buf_sva_mut_9_4;
  reg [63:0] base_buf_sva_mut_9_5;
  reg [63:0] base_buf_sva_mut_9_6;
  reg [63:0] base_buf_sva_mut_9_7;
  reg [63:0] base_buf_sva_mut_9_8;
  reg [63:0] base_buf_sva_mut_9_9;
  reg [63:0] base_buf_sva_mut_9_10;
  reg [63:0] m_buf_sva_mut_9_2;
  reg [63:0] m_buf_sva_mut_9_3;
  reg [63:0] m_buf_sva_mut_9_4;
  reg [63:0] m_buf_sva_mut_9_5;
  reg [63:0] m_buf_sva_mut_9_6;
  reg [63:0] m_buf_sva_mut_9_7;
  reg [63:0] m_buf_sva_mut_9_8;
  reg [63:0] m_buf_sva_mut_9_9;
  reg [63:0] m_buf_sva_mut_9_10;
  reg [63:0] base_buf_sva_mut_10_2;
  reg [63:0] base_buf_sva_mut_10_3;
  reg [63:0] base_buf_sva_mut_10_4;
  reg [63:0] base_buf_sva_mut_10_5;
  reg [63:0] base_buf_sva_mut_10_6;
  reg [63:0] base_buf_sva_mut_10_7;
  reg [63:0] base_buf_sva_mut_10_8;
  reg [63:0] base_buf_sva_mut_10_9;
  reg [63:0] base_buf_sva_mut_10_10;
  reg [63:0] m_buf_sva_mut_10_2;
  reg [63:0] m_buf_sva_mut_10_3;
  reg [63:0] m_buf_sva_mut_10_4;
  reg [63:0] m_buf_sva_mut_10_5;
  reg [63:0] m_buf_sva_mut_10_6;
  reg [63:0] m_buf_sva_mut_10_7;
  reg [63:0] m_buf_sva_mut_10_8;
  reg [63:0] m_buf_sva_mut_10_9;
  reg [63:0] m_buf_sva_mut_10_10;
  reg [3:0] result_rem_11cyc_st_10;
  wire return_rsci_d_mx0c0;
  wire return_rsci_d_mx0c1;
  wire return_rsci_d_mx0c2;
  wire return_rsci_d_mx0c3;
  wire return_rsci_d_mx0c4;
  wire return_rsci_d_mx0c5;
  wire return_rsci_d_mx0c6;
  wire return_rsci_d_mx0c7;
  wire return_rsci_d_mx0c8;
  wire return_rsci_d_mx0c9;
  wire return_rsci_d_mx0c10;
  wire [3:0] result_acc_imod_1;
  wire [5:0] nl_result_acc_imod_1;
  wire [3:0] result_acc_idiv_1;
  wire [4:0] nl_result_acc_idiv_1;
  wire m_and_cse;
  wire m_and_1_cse;
  wire m_and_2_cse;
  wire m_and_3_cse;
  wire m_and_4_cse;
  wire m_and_5_cse;
  wire m_and_6_cse;
  wire m_and_7_cse;
  wire m_and_8_cse;
  wire m_and_9_cse;
  wire m_and_10_cse;
  wire m_and_11_cse;
  wire m_and_12_cse;
  wire m_and_13_cse;
  wire m_and_14_cse;
  wire m_and_15_cse;
  wire m_and_16_cse;
  wire m_and_17_cse;
  wire m_and_18_cse;
  wire m_and_19_cse;
  wire m_and_20_cse;
  wire m_and_21_cse;
  wire m_and_22_cse;
  wire m_and_23_cse;
  wire m_and_24_cse;
  wire m_and_25_cse;
  wire m_and_26_cse;
  wire m_and_27_cse;
  wire m_and_28_cse;
  wire m_and_29_cse;
  wire m_and_30_cse;
  wire m_and_31_cse;
  wire m_and_32_cse;
  wire m_and_33_cse;
  wire m_and_34_cse;
  wire m_and_35_cse;
  wire m_and_36_cse;
  wire m_and_37_cse;
  wire m_and_38_cse;
  wire m_and_39_cse;
  wire m_and_40_cse;
  wire m_and_41_cse;
  wire m_and_42_cse;
  wire m_and_43_cse;
  wire m_and_44_cse;
  wire m_and_45_cse;
  wire m_and_46_cse;
  wire m_and_47_cse;
  wire m_and_48_cse;
  wire m_and_49_cse;
  wire m_and_50_cse;
  wire m_and_51_cse;
  wire m_and_52_cse;
  wire m_and_53_cse;
  wire m_and_54_cse;
  wire m_and_55_cse;
  wire m_and_56_cse;
  wire m_and_57_cse;
  wire m_and_58_cse;
  wire m_and_59_cse;
  wire m_and_60_cse;
  wire m_and_61_cse;
  wire m_and_62_cse;
  wire m_and_63_cse;
  wire m_and_64_cse;
  wire m_and_65_cse;
  wire m_and_66_cse;
  wire m_and_67_cse;
  wire m_and_68_cse;
  wire m_and_69_cse;
  wire m_and_70_cse;
  wire m_and_71_cse;
  wire m_and_72_cse;
  wire m_and_73_cse;
  wire m_and_74_cse;
  wire m_and_75_cse;
  wire m_and_76_cse;
  wire m_and_77_cse;
  wire m_and_78_cse;
  wire m_and_79_cse;
  wire m_and_80_cse;
  wire m_and_81_cse;
  wire m_and_82_cse;
  wire m_and_83_cse;
  wire m_and_84_cse;
  wire m_and_85_cse;
  wire m_and_86_cse;
  wire m_and_87_cse;
  wire m_and_88_cse;
  wire m_and_89_cse;
  wire m_and_90_cse;
  wire m_and_91_cse;
  wire m_and_92_cse;
  wire m_and_93_cse;
  wire m_and_94_cse;
  wire m_and_95_cse;
  wire m_and_96_cse;
  wire m_and_97_cse;
  wire m_and_98_cse;

  wire[0:0] mux_nl;
  wire[0:0] nor_691_nl;
  wire[0:0] nor_690_nl;
  wire[0:0] or_10_nl;
  wire[0:0] mux_2_nl;
  wire[0:0] nor_689_nl;
  wire[0:0] nor_687_nl;
  wire[0:0] or_17_nl;
  wire[0:0] nor_688_nl;
  wire[0:0] mux_5_nl;
  wire[0:0] nor_686_nl;
  wire[0:0] nor_683_nl;
  wire[0:0] or_26_nl;
  wire[0:0] nor_684_nl;
  wire[0:0] nor_685_nl;
  wire[0:0] mux_9_nl;
  wire[0:0] nor_682_nl;
  wire[0:0] nor_678_nl;
  wire[0:0] or_37_nl;
  wire[0:0] nor_679_nl;
  wire[0:0] nor_680_nl;
  wire[0:0] nor_681_nl;
  wire[0:0] mux_14_nl;
  wire[0:0] nor_677_nl;
  wire[0:0] nor_672_nl;
  wire[0:0] or_50_nl;
  wire[0:0] nor_673_nl;
  wire[0:0] nor_674_nl;
  wire[0:0] nor_675_nl;
  wire[0:0] nor_676_nl;
  wire[0:0] mux_20_nl;
  wire[0:0] nor_671_nl;
  wire[0:0] nor_665_nl;
  wire[0:0] or_65_nl;
  wire[0:0] nor_666_nl;
  wire[0:0] nor_667_nl;
  wire[0:0] nor_668_nl;
  wire[0:0] nor_669_nl;
  wire[0:0] nor_670_nl;
  wire[0:0] mux_27_nl;
  wire[0:0] nor_664_nl;
  wire[0:0] nor_656_nl;
  wire[0:0] or_82_nl;
  wire[0:0] or_80_nl;
  wire[0:0] nor_657_nl;
  wire[0:0] nor_658_nl;
  wire[0:0] nor_659_nl;
  wire[0:0] nor_660_nl;
  wire[0:0] nor_661_nl;
  wire[0:0] nor_662_nl;
  wire[0:0] mux_35_nl;
  wire[0:0] nor_663_nl;
  wire[0:0] nor_654_nl;
  wire[0:0] nor_655_nl;
  wire[0:0] mux_38_nl;
  wire[0:0] nor_653_nl;
  wire[0:0] nor_652_nl;
  wire[0:0] or_114_nl;
  wire[0:0] mux_40_nl;
  wire[0:0] nor_651_nl;
  wire[0:0] nor_649_nl;
  wire[0:0] or_121_nl;
  wire[0:0] nor_650_nl;
  wire[0:0] mux_43_nl;
  wire[0:0] nor_648_nl;
  wire[0:0] nor_645_nl;
  wire[0:0] or_130_nl;
  wire[0:0] nor_646_nl;
  wire[0:0] nor_647_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] nor_644_nl;
  wire[0:0] nor_640_nl;
  wire[0:0] or_141_nl;
  wire[0:0] nor_641_nl;
  wire[0:0] nor_642_nl;
  wire[0:0] nor_643_nl;
  wire[0:0] mux_52_nl;
  wire[0:0] nor_639_nl;
  wire[0:0] nor_634_nl;
  wire[0:0] or_154_nl;
  wire[0:0] nor_635_nl;
  wire[0:0] nor_636_nl;
  wire[0:0] nor_637_nl;
  wire[0:0] nor_638_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] nor_633_nl;
  wire[0:0] nor_627_nl;
  wire[0:0] or_169_nl;
  wire[0:0] nor_628_nl;
  wire[0:0] nor_629_nl;
  wire[0:0] nor_630_nl;
  wire[0:0] nor_631_nl;
  wire[0:0] nor_632_nl;
  wire[0:0] mux_65_nl;
  wire[0:0] nor_626_nl;
  wire[0:0] nor_618_nl;
  wire[0:0] or_186_nl;
  wire[0:0] or_184_nl;
  wire[0:0] nor_619_nl;
  wire[0:0] nor_620_nl;
  wire[0:0] nor_621_nl;
  wire[0:0] nor_622_nl;
  wire[0:0] nor_623_nl;
  wire[0:0] nor_624_nl;
  wire[0:0] mux_73_nl;
  wire[0:0] nor_625_nl;
  wire[0:0] nor_617_nl;
  wire[0:0] and_797_nl;
  wire[0:0] or_195_nl;
  wire[0:0] mux_76_nl;
  wire[0:0] nor_616_nl;
  wire[0:0] nor_615_nl;
  wire[0:0] or_216_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] nor_614_nl;
  wire[0:0] nor_612_nl;
  wire[0:0] or_223_nl;
  wire[0:0] nor_613_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] nor_611_nl;
  wire[0:0] nor_608_nl;
  wire[0:0] or_232_nl;
  wire[0:0] nor_609_nl;
  wire[0:0] nor_610_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] nor_607_nl;
  wire[0:0] nor_603_nl;
  wire[0:0] or_243_nl;
  wire[0:0] nor_604_nl;
  wire[0:0] nor_605_nl;
  wire[0:0] nor_606_nl;
  wire[0:0] mux_90_nl;
  wire[0:0] nor_602_nl;
  wire[0:0] nor_597_nl;
  wire[0:0] or_256_nl;
  wire[0:0] nor_598_nl;
  wire[0:0] nor_599_nl;
  wire[0:0] nor_600_nl;
  wire[0:0] nor_601_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] nor_596_nl;
  wire[0:0] nor_590_nl;
  wire[0:0] or_271_nl;
  wire[0:0] nor_591_nl;
  wire[0:0] nor_592_nl;
  wire[0:0] nor_593_nl;
  wire[0:0] nor_594_nl;
  wire[0:0] nor_595_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] nor_589_nl;
  wire[0:0] nor_581_nl;
  wire[0:0] or_288_nl;
  wire[0:0] or_286_nl;
  wire[0:0] nor_582_nl;
  wire[0:0] nor_583_nl;
  wire[0:0] nor_584_nl;
  wire[0:0] nor_585_nl;
  wire[0:0] nor_586_nl;
  wire[0:0] nor_587_nl;
  wire[0:0] mux_111_nl;
  wire[0:0] nor_588_nl;
  wire[0:0] nor_579_nl;
  wire[0:0] nor_580_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] nor_578_nl;
  wire[0:0] nor_577_nl;
  wire[0:0] or_318_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] nor_576_nl;
  wire[0:0] nor_574_nl;
  wire[0:0] or_325_nl;
  wire[0:0] nor_575_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] nor_573_nl;
  wire[0:0] nor_570_nl;
  wire[0:0] or_334_nl;
  wire[0:0] nor_571_nl;
  wire[0:0] nor_572_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] nor_569_nl;
  wire[0:0] nor_565_nl;
  wire[0:0] or_345_nl;
  wire[0:0] nor_566_nl;
  wire[0:0] nor_567_nl;
  wire[0:0] nor_568_nl;
  wire[0:0] mux_128_nl;
  wire[0:0] nor_564_nl;
  wire[0:0] nor_559_nl;
  wire[0:0] or_358_nl;
  wire[0:0] nor_560_nl;
  wire[0:0] nor_561_nl;
  wire[0:0] nor_562_nl;
  wire[0:0] nor_563_nl;
  wire[0:0] mux_134_nl;
  wire[0:0] nor_558_nl;
  wire[0:0] nor_552_nl;
  wire[0:0] or_373_nl;
  wire[0:0] nor_553_nl;
  wire[0:0] nor_554_nl;
  wire[0:0] nor_555_nl;
  wire[0:0] nor_556_nl;
  wire[0:0] nor_557_nl;
  wire[0:0] mux_141_nl;
  wire[0:0] nor_551_nl;
  wire[0:0] nor_543_nl;
  wire[0:0] or_390_nl;
  wire[0:0] or_388_nl;
  wire[0:0] nor_544_nl;
  wire[0:0] nor_545_nl;
  wire[0:0] nor_546_nl;
  wire[0:0] nor_547_nl;
  wire[0:0] nor_548_nl;
  wire[0:0] nor_549_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] nor_550_nl;
  wire[0:0] nor_542_nl;
  wire[0:0] and_796_nl;
  wire[0:0] or_399_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] and_795_nl;
  wire[0:0] nor_541_nl;
  wire[0:0] or_420_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] and_794_nl;
  wire[0:0] nor_539_nl;
  wire[0:0] or_427_nl;
  wire[0:0] nor_540_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] and_793_nl;
  wire[0:0] nor_536_nl;
  wire[0:0] or_436_nl;
  wire[0:0] nor_537_nl;
  wire[0:0] nor_538_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] and_792_nl;
  wire[0:0] nor_532_nl;
  wire[0:0] or_447_nl;
  wire[0:0] nor_533_nl;
  wire[0:0] nor_534_nl;
  wire[0:0] nor_535_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] and_791_nl;
  wire[0:0] nor_527_nl;
  wire[0:0] or_460_nl;
  wire[0:0] nor_528_nl;
  wire[0:0] nor_529_nl;
  wire[0:0] nor_530_nl;
  wire[0:0] nor_531_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] and_789_nl;
  wire[0:0] nor_522_nl;
  wire[0:0] or_475_nl;
  wire[0:0] and_788_nl;
  wire[0:0] nor_523_nl;
  wire[0:0] nor_524_nl;
  wire[0:0] nor_525_nl;
  wire[0:0] nor_526_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] and_787_nl;
  wire[0:0] nor_516_nl;
  wire[0:0] or_492_nl;
  wire[0:0] or_490_nl;
  wire[0:0] nor_517_nl;
  wire[0:0] and_785_nl;
  wire[0:0] nor_518_nl;
  wire[0:0] nor_519_nl;
  wire[0:0] nor_520_nl;
  wire[0:0] nor_521_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] and_786_nl;
  wire[0:0] nor_514_nl;
  wire[0:0] nor_515_nl;
  wire[0:0] or_501_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] and_784_nl;
  wire[0:0] nor_513_nl;
  wire[0:0] or_523_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] and_783_nl;
  wire[0:0] nor_511_nl;
  wire[0:0] or_530_nl;
  wire[0:0] nor_512_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] and_782_nl;
  wire[0:0] nor_508_nl;
  wire[0:0] or_539_nl;
  wire[0:0] nor_509_nl;
  wire[0:0] nor_510_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] and_781_nl;
  wire[0:0] nor_504_nl;
  wire[0:0] or_550_nl;
  wire[0:0] nor_505_nl;
  wire[0:0] nor_506_nl;
  wire[0:0] nor_507_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] and_780_nl;
  wire[0:0] nor_499_nl;
  wire[0:0] or_563_nl;
  wire[0:0] nor_500_nl;
  wire[0:0] nor_501_nl;
  wire[0:0] nor_502_nl;
  wire[0:0] nor_503_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] and_778_nl;
  wire[0:0] nor_494_nl;
  wire[0:0] or_578_nl;
  wire[0:0] and_777_nl;
  wire[0:0] nor_495_nl;
  wire[0:0] nor_496_nl;
  wire[0:0] nor_497_nl;
  wire[0:0] nor_498_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] and_776_nl;
  wire[0:0] nor_488_nl;
  wire[0:0] or_595_nl;
  wire[0:0] or_593_nl;
  wire[0:0] nor_489_nl;
  wire[0:0] and_774_nl;
  wire[0:0] nor_490_nl;
  wire[0:0] nor_491_nl;
  wire[0:0] nor_492_nl;
  wire[0:0] nor_493_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] and_775_nl;
  wire[0:0] nor_487_nl;
  wire[0:0] and_773_nl;
  wire[0:0] or_604_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] and_772_nl;
  wire[0:0] nor_486_nl;
  wire[0:0] or_624_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] and_771_nl;
  wire[0:0] nor_484_nl;
  wire[0:0] or_631_nl;
  wire[0:0] nor_485_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] and_770_nl;
  wire[0:0] nor_481_nl;
  wire[0:0] or_640_nl;
  wire[0:0] nor_482_nl;
  wire[0:0] nor_483_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] and_769_nl;
  wire[0:0] nor_477_nl;
  wire[0:0] or_651_nl;
  wire[0:0] nor_478_nl;
  wire[0:0] nor_479_nl;
  wire[0:0] nor_480_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] and_768_nl;
  wire[0:0] nor_472_nl;
  wire[0:0] or_664_nl;
  wire[0:0] nor_473_nl;
  wire[0:0] nor_474_nl;
  wire[0:0] nor_475_nl;
  wire[0:0] nor_476_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] and_766_nl;
  wire[0:0] nor_467_nl;
  wire[0:0] or_679_nl;
  wire[0:0] and_765_nl;
  wire[0:0] nor_468_nl;
  wire[0:0] nor_469_nl;
  wire[0:0] nor_470_nl;
  wire[0:0] nor_471_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] and_764_nl;
  wire[0:0] nor_461_nl;
  wire[0:0] or_696_nl;
  wire[0:0] or_694_nl;
  wire[0:0] nor_462_nl;
  wire[0:0] and_762_nl;
  wire[0:0] nor_463_nl;
  wire[0:0] nor_464_nl;
  wire[0:0] nor_465_nl;
  wire[0:0] nor_466_nl;
  wire[0:0] mux_263_nl;
  wire[0:0] and_763_nl;
  wire[0:0] nor_459_nl;
  wire[0:0] nor_460_nl;
  wire[0:0] or_705_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] and_761_nl;
  wire[0:0] nor_458_nl;
  wire[0:0] nand_153_nl;
  wire[0:0] mux_268_nl;
  wire[0:0] and_760_nl;
  wire[0:0] nor_456_nl;
  wire[0:0] nand_152_nl;
  wire[0:0] nor_457_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] and_759_nl;
  wire[0:0] nor_453_nl;
  wire[0:0] nand_151_nl;
  wire[0:0] nor_454_nl;
  wire[0:0] nor_455_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] and_758_nl;
  wire[0:0] nor_449_nl;
  wire[0:0] nand_96_nl;
  wire[0:0] nor_450_nl;
  wire[0:0] nor_451_nl;
  wire[0:0] nor_452_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] and_757_nl;
  wire[0:0] nor_444_nl;
  wire[0:0] nand_150_nl;
  wire[0:0] nor_445_nl;
  wire[0:0] nor_446_nl;
  wire[0:0] nor_447_nl;
  wire[0:0] nor_448_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] and_755_nl;
  wire[0:0] nor_439_nl;
  wire[0:0] nand_149_nl;
  wire[0:0] and_754_nl;
  wire[0:0] nor_440_nl;
  wire[0:0] nor_441_nl;
  wire[0:0] nor_442_nl;
  wire[0:0] nor_443_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] and_753_nl;
  wire[0:0] nor_433_nl;
  wire[0:0] nand_72_nl;
  wire[0:0] nand_73_nl;
  wire[0:0] nor_434_nl;
  wire[0:0] and_751_nl;
  wire[0:0] nor_435_nl;
  wire[0:0] nor_436_nl;
  wire[0:0] nor_437_nl;
  wire[0:0] nor_438_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] and_752_nl;
  wire[0:0] nor_432_nl;
  wire[0:0] and_750_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] nor_431_nl;
  wire[0:0] nor_430_nl;
  wire[0:0] or_825_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] nor_429_nl;
  wire[0:0] nor_428_nl;
  wire[0:0] or_832_nl;
  wire[0:0] and_748_nl;
  wire[0:0] mux_309_nl;
  wire[0:0] nor_427_nl;
  wire[0:0] nor_426_nl;
  wire[0:0] or_841_nl;
  wire[0:0] and_745_nl;
  wire[0:0] and_746_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] nor_425_nl;
  wire[0:0] nor_424_nl;
  wire[0:0] or_852_nl;
  wire[0:0] and_741_nl;
  wire[0:0] and_742_nl;
  wire[0:0] and_743_nl;
  wire[0:0] mux_318_nl;
  wire[0:0] nor_423_nl;
  wire[0:0] nor_422_nl;
  wire[0:0] or_865_nl;
  wire[0:0] and_736_nl;
  wire[0:0] and_737_nl;
  wire[0:0] and_738_nl;
  wire[0:0] and_739_nl;
  wire[0:0] mux_324_nl;
  wire[0:0] nor_421_nl;
  wire[0:0] nor_419_nl;
  wire[0:0] or_880_nl;
  wire[0:0] nor_420_nl;
  wire[0:0] and_732_nl;
  wire[0:0] and_733_nl;
  wire[0:0] and_734_nl;
  wire[0:0] and_735_nl;
  wire[0:0] mux_331_nl;
  wire[0:0] nor_418_nl;
  wire[0:0] nor_415_nl;
  wire[0:0] or_897_nl;
  wire[0:0] or_895_nl;
  wire[0:0] and_726_nl;
  wire[0:0] nor_416_nl;
  wire[0:0] and_727_nl;
  wire[0:0] and_728_nl;
  wire[0:0] and_729_nl;
  wire[0:0] and_730_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] nor_417_nl;
  wire[0:0] nor_407_nl;
  wire[0:0] or_914_nl;
  wire[0:0] nor_408_nl;
  wire[0:0] or_913_nl;
  wire[0:0] nor_409_nl;
  wire[0:0] or_912_nl;
  wire[0:0] nor_410_nl;
  wire[0:0] or_911_nl;
  wire[0:0] nor_411_nl;
  wire[0:0] or_910_nl;
  wire[0:0] nor_412_nl;
  wire[0:0] or_909_nl;
  wire[0:0] nor_413_nl;
  wire[0:0] or_908_nl;
  wire[0:0] and_724_nl;
  wire[0:0] nor_414_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] nor_406_nl;
  wire[0:0] nor_405_nl;
  wire[0:0] or_935_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] nor_404_nl;
  wire[0:0] nor_403_nl;
  wire[0:0] or_942_nl;
  wire[0:0] and_722_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] nor_402_nl;
  wire[0:0] nor_401_nl;
  wire[0:0] or_951_nl;
  wire[0:0] and_719_nl;
  wire[0:0] and_720_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] nor_400_nl;
  wire[0:0] nor_399_nl;
  wire[0:0] or_962_nl;
  wire[0:0] and_715_nl;
  wire[0:0] and_716_nl;
  wire[0:0] and_717_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] nor_398_nl;
  wire[0:0] nor_397_nl;
  wire[0:0] or_975_nl;
  wire[0:0] and_710_nl;
  wire[0:0] and_711_nl;
  wire[0:0] and_712_nl;
  wire[0:0] and_713_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] nor_396_nl;
  wire[0:0] nor_394_nl;
  wire[0:0] or_990_nl;
  wire[0:0] nor_395_nl;
  wire[0:0] and_706_nl;
  wire[0:0] and_707_nl;
  wire[0:0] and_708_nl;
  wire[0:0] and_709_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] nor_393_nl;
  wire[0:0] nor_390_nl;
  wire[0:0] or_1007_nl;
  wire[0:0] or_1005_nl;
  wire[0:0] and_700_nl;
  wire[0:0] nor_391_nl;
  wire[0:0] and_701_nl;
  wire[0:0] and_702_nl;
  wire[0:0] and_703_nl;
  wire[0:0] and_704_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] nor_392_nl;
  wire[0:0] nor_383_nl;
  wire[0:0] or_1024_nl;
  wire[0:0] nor_384_nl;
  wire[0:0] or_1023_nl;
  wire[0:0] nor_385_nl;
  wire[0:0] or_1022_nl;
  wire[0:0] nor_386_nl;
  wire[0:0] or_1021_nl;
  wire[0:0] nor_387_nl;
  wire[0:0] or_1020_nl;
  wire[0:0] nor_388_nl;
  wire[0:0] or_1019_nl;
  wire[0:0] nor_389_nl;
  wire[0:0] or_1018_nl;
  wire[0:0] and_697_nl;
  wire[0:0] and_698_nl;
  wire[0:0] or_1016_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] nor_382_nl;
  wire[0:0] nor_381_nl;
  wire[0:0] or_1044_nl;
  wire[0:0] mux_396_nl;
  wire[0:0] nor_380_nl;
  wire[0:0] nor_379_nl;
  wire[0:0] or_1051_nl;
  wire[0:0] and_695_nl;
  wire[0:0] mux_399_nl;
  wire[0:0] nor_378_nl;
  wire[0:0] nor_377_nl;
  wire[0:0] or_1060_nl;
  wire[0:0] and_692_nl;
  wire[0:0] and_693_nl;
  wire[0:0] mux_403_nl;
  wire[0:0] nor_376_nl;
  wire[0:0] nor_375_nl;
  wire[0:0] or_1071_nl;
  wire[0:0] and_688_nl;
  wire[0:0] and_689_nl;
  wire[0:0] and_690_nl;
  wire[0:0] mux_408_nl;
  wire[0:0] nor_374_nl;
  wire[0:0] nor_373_nl;
  wire[0:0] or_1084_nl;
  wire[0:0] and_683_nl;
  wire[0:0] and_684_nl;
  wire[0:0] and_685_nl;
  wire[0:0] and_686_nl;
  wire[0:0] mux_414_nl;
  wire[0:0] nor_372_nl;
  wire[0:0] nor_370_nl;
  wire[0:0] or_1099_nl;
  wire[0:0] nor_371_nl;
  wire[0:0] and_679_nl;
  wire[0:0] and_680_nl;
  wire[0:0] and_681_nl;
  wire[0:0] and_682_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] nor_369_nl;
  wire[0:0] nor_366_nl;
  wire[0:0] or_1116_nl;
  wire[0:0] or_1114_nl;
  wire[0:0] and_673_nl;
  wire[0:0] nor_367_nl;
  wire[0:0] and_674_nl;
  wire[0:0] and_675_nl;
  wire[0:0] and_676_nl;
  wire[0:0] and_677_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] nor_368_nl;
  wire[0:0] nor_358_nl;
  wire[0:0] or_1133_nl;
  wire[0:0] nor_359_nl;
  wire[0:0] or_1132_nl;
  wire[0:0] nor_360_nl;
  wire[0:0] or_1131_nl;
  wire[0:0] nor_361_nl;
  wire[0:0] or_1130_nl;
  wire[0:0] nor_362_nl;
  wire[0:0] or_1129_nl;
  wire[0:0] nor_363_nl;
  wire[0:0] or_1128_nl;
  wire[0:0] nor_364_nl;
  wire[0:0] or_1127_nl;
  wire[0:0] and_671_nl;
  wire[0:0] nor_365_nl;

  // Interconnect Declarations for Component Instantiations 
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
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp (
      .a(result_rem_12_cmp_a),
      .b(result_rem_12_cmp_b),
      .z(result_rem_12_cmp_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_1 (
      .a(result_rem_12_cmp_1_a),
      .b(result_rem_12_cmp_1_b),
      .z(result_rem_12_cmp_1_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_2 (
      .a(result_rem_12_cmp_2_a),
      .b(result_rem_12_cmp_2_b),
      .z(result_rem_12_cmp_2_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_3 (
      .a(result_rem_12_cmp_3_a),
      .b(result_rem_12_cmp_3_b),
      .z(result_rem_12_cmp_3_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_4 (
      .a(result_rem_12_cmp_4_a),
      .b(result_rem_12_cmp_4_b),
      .z(result_rem_12_cmp_4_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_5 (
      .a(result_rem_12_cmp_5_a),
      .b(result_rem_12_cmp_5_b),
      .z(result_rem_12_cmp_5_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_6 (
      .a(result_rem_12_cmp_6_a),
      .b(result_rem_12_cmp_6_b),
      .z(result_rem_12_cmp_6_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_7 (
      .a(result_rem_12_cmp_7_a),
      .b(result_rem_12_cmp_7_b),
      .z(result_rem_12_cmp_7_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_8 (
      .a(result_rem_12_cmp_8_a),
      .b(result_rem_12_cmp_8_b),
      .z(result_rem_12_cmp_8_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_9 (
      .a(result_rem_12_cmp_9_a),
      .b(result_rem_12_cmp_9_b),
      .z(result_rem_12_cmp_9_z)
    );
  mgc_rem #(.width_a(32'sd64),
  .width_b(32'sd64),
  .signd(32'sd0)) result_rem_12_cmp_10 (
      .a(result_rem_12_cmp_10_a),
      .b(result_rem_12_cmp_10_b),
      .z(result_rem_12_cmp_10_z)
    );
  assign result_and_1_cse = ccs_ccore_en & (and_dcpl_263 | and_dcpl_269 | and_dcpl_275
      | and_dcpl_281 | and_dcpl_287 | and_dcpl_293 | and_dcpl_299 | and_dcpl_305
      | and_dcpl_311 | mux_tmp_37);
  assign result_and_3_cse = ccs_ccore_en & (and_dcpl_319 | and_dcpl_322 | and_dcpl_325
      | and_dcpl_329 | and_dcpl_333 | and_dcpl_337 | and_dcpl_341 | and_dcpl_344
      | and_dcpl_347 | mux_tmp_75);
  assign result_and_5_cse = ccs_ccore_en & (and_dcpl_353 | and_dcpl_357 | and_dcpl_361
      | and_dcpl_364 | and_dcpl_367 | and_dcpl_370 | and_dcpl_373 | and_dcpl_377
      | and_dcpl_381 | mux_tmp_113);
  assign result_and_7_cse = ccs_ccore_en & (and_dcpl_387 | and_dcpl_390 | and_dcpl_393
      | and_dcpl_396 | and_dcpl_399 | and_dcpl_402 | and_dcpl_405 | and_dcpl_408
      | and_dcpl_411 | mux_tmp_151);
  assign result_and_9_cse = ccs_ccore_en & (and_dcpl_418 | and_dcpl_422 | and_dcpl_426
      | and_dcpl_430 | and_dcpl_433 | and_dcpl_437 | and_dcpl_441 | and_dcpl_444
      | and_dcpl_447 | mux_tmp_189);
  assign result_and_11_cse = ccs_ccore_en & (and_dcpl_452 | and_dcpl_455 | and_dcpl_458
      | and_dcpl_462 | and_dcpl_464 | and_dcpl_468 | and_dcpl_472 | and_dcpl_474
      | and_dcpl_476 | mux_tmp_227);
  assign result_and_13_cse = ccs_ccore_en & (and_dcpl_480 | and_dcpl_484 | and_dcpl_488
      | and_dcpl_491 | and_dcpl_493 | and_dcpl_496 | and_dcpl_499 | and_dcpl_501
      | and_dcpl_503 | mux_tmp_265);
  assign result_and_15_cse = ccs_ccore_en & (and_dcpl_507 | and_dcpl_510 | and_dcpl_513
      | and_dcpl_516 | and_dcpl_518 | and_dcpl_521 | and_dcpl_524 | and_dcpl_526
      | and_dcpl_528 | mux_tmp_303);
  assign result_and_17_cse = ccs_ccore_en & (and_dcpl_533 | and_dcpl_536 | and_dcpl_539
      | and_dcpl_542 | and_dcpl_546 | and_dcpl_549 | and_dcpl_552 | and_dcpl_556
      | and_dcpl_560 | mux_tmp_348);
  assign result_and_19_cse = ccs_ccore_en & (and_dcpl_566 | and_dcpl_568 | and_dcpl_570
      | and_dcpl_572 | and_dcpl_576 | and_dcpl_578 | and_dcpl_580 | and_dcpl_583
      | and_dcpl_586 | mux_tmp_393);
  assign result_and_21_cse = ccs_ccore_en & (and_dcpl_590 | and_dcpl_592 | and_dcpl_594
      | and_dcpl_596 | and_dcpl_599 | and_dcpl_601 | and_dcpl_603 | and_dcpl_607
      | and_dcpl_611 | mux_tmp_438);
  assign m_and_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_2;
  assign m_and_1_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_6;
  assign m_and_2_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_9;
  assign m_and_3_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_11;
  assign m_and_4_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_2;
  assign m_and_5_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_6;
  assign m_and_6_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_9;
  assign m_and_7_cse = ccs_ccore_en & and_dcpl_13 & and_dcpl_11;
  assign m_and_8_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_18 & (~ (result_rem_11cyc_st_9[0]));
  assign m_and_9_cse = ccs_ccore_en & and_dcpl_4 & and_dcpl_18 & (result_rem_11cyc_st_9[0]);
  assign m_and_10_cse = ccs_ccore_en & and_dcpl_4 & (result_rem_11cyc_st_9[3]) &
      (result_rem_11cyc_st_9[1]) & (~ (result_rem_11cyc_st_9[0]));
  assign m_and_11_cse = ccs_ccore_en & and_dcpl_30;
  assign m_and_12_cse = ccs_ccore_en & and_dcpl_32;
  assign m_and_13_cse = ccs_ccore_en & and_dcpl_35;
  assign m_and_14_cse = ccs_ccore_en & and_dcpl_37;
  assign m_and_15_cse = ccs_ccore_en & and_dcpl_39;
  assign m_and_16_cse = ccs_ccore_en & and_dcpl_40;
  assign m_and_17_cse = ccs_ccore_en & and_dcpl_41;
  assign m_and_18_cse = ccs_ccore_en & and_dcpl_42;
  assign m_and_19_cse = ccs_ccore_en & and_dcpl_45;
  assign m_and_20_cse = ccs_ccore_en & and_dcpl_47;
  assign m_and_21_cse = ccs_ccore_en & and_dcpl_50;
  assign m_and_22_cse = ccs_ccore_en & and_dcpl_55;
  assign m_and_23_cse = ccs_ccore_en & and_dcpl_58;
  assign m_and_24_cse = ccs_ccore_en & and_dcpl_60;
  assign m_and_25_cse = ccs_ccore_en & and_dcpl_62;
  assign m_and_26_cse = ccs_ccore_en & and_dcpl_65;
  assign m_and_27_cse = ccs_ccore_en & and_dcpl_68;
  assign m_and_28_cse = ccs_ccore_en & and_dcpl_70;
  assign m_and_29_cse = ccs_ccore_en & and_dcpl_72;
  assign m_and_30_cse = ccs_ccore_en & and_dcpl_74;
  assign m_and_31_cse = ccs_ccore_en & and_dcpl_75;
  assign m_and_32_cse = ccs_ccore_en & and_dcpl_76;
  assign m_and_33_cse = ccs_ccore_en & and_dcpl_81;
  assign m_and_34_cse = ccs_ccore_en & and_dcpl_84;
  assign m_and_35_cse = ccs_ccore_en & and_dcpl_86;
  assign m_and_36_cse = ccs_ccore_en & and_dcpl_88;
  assign m_and_37_cse = ccs_ccore_en & and_dcpl_91;
  assign m_and_38_cse = ccs_ccore_en & and_dcpl_94;
  assign m_and_39_cse = ccs_ccore_en & and_dcpl_96;
  assign m_and_40_cse = ccs_ccore_en & and_dcpl_98;
  assign m_and_41_cse = ccs_ccore_en & and_dcpl_100;
  assign m_and_42_cse = ccs_ccore_en & and_dcpl_101;
  assign m_and_43_cse = ccs_ccore_en & and_dcpl_102;
  assign m_and_44_cse = ccs_ccore_en & and_dcpl_107;
  assign m_and_45_cse = ccs_ccore_en & and_dcpl_110;
  assign m_and_46_cse = ccs_ccore_en & and_dcpl_112;
  assign m_and_47_cse = ccs_ccore_en & and_dcpl_114;
  assign m_and_48_cse = ccs_ccore_en & and_dcpl_116;
  assign m_and_49_cse = ccs_ccore_en & and_dcpl_117;
  assign m_and_50_cse = ccs_ccore_en & and_dcpl_118;
  assign m_and_51_cse = ccs_ccore_en & and_dcpl_119;
  assign m_and_52_cse = ccs_ccore_en & and_dcpl_122;
  assign m_and_53_cse = ccs_ccore_en & and_dcpl_125;
  assign m_and_54_cse = ccs_ccore_en & and_dcpl_127;
  assign m_and_55_cse = ccs_ccore_en & and_dcpl_132;
  assign m_and_56_cse = ccs_ccore_en & and_dcpl_135;
  assign m_and_57_cse = ccs_ccore_en & and_dcpl_137;
  assign m_and_58_cse = ccs_ccore_en & and_dcpl_139;
  assign m_and_59_cse = ccs_ccore_en & and_dcpl_142;
  assign m_and_60_cse = ccs_ccore_en & and_dcpl_145;
  assign m_and_61_cse = ccs_ccore_en & and_dcpl_147;
  assign m_and_62_cse = ccs_ccore_en & and_dcpl_149;
  assign m_and_63_cse = ccs_ccore_en & and_dcpl_151;
  assign m_and_64_cse = ccs_ccore_en & and_dcpl_152;
  assign m_and_65_cse = ccs_ccore_en & and_dcpl_153;
  assign m_and_66_cse = ccs_ccore_en & and_dcpl_158;
  assign m_and_67_cse = ccs_ccore_en & and_dcpl_160;
  assign m_and_68_cse = ccs_ccore_en & and_dcpl_163;
  assign m_and_69_cse = ccs_ccore_en & and_dcpl_165;
  assign m_and_70_cse = ccs_ccore_en & and_dcpl_168;
  assign m_and_71_cse = ccs_ccore_en & and_dcpl_170;
  assign m_and_72_cse = ccs_ccore_en & and_dcpl_173;
  assign m_and_73_cse = ccs_ccore_en & and_dcpl_175;
  assign m_and_74_cse = ccs_ccore_en & and_dcpl_177;
  assign m_and_75_cse = ccs_ccore_en & and_dcpl_178;
  assign m_and_76_cse = ccs_ccore_en & and_dcpl_179;
  assign m_and_77_cse = ccs_ccore_en & and_dcpl_184;
  assign m_and_78_cse = ccs_ccore_en & and_dcpl_186;
  assign m_and_79_cse = ccs_ccore_en & and_dcpl_189;
  assign m_and_80_cse = ccs_ccore_en & and_dcpl_191;
  assign m_and_81_cse = ccs_ccore_en & and_dcpl_194;
  assign m_and_82_cse = ccs_ccore_en & and_dcpl_196;
  assign m_and_83_cse = ccs_ccore_en & and_dcpl_199;
  assign m_and_84_cse = ccs_ccore_en & and_dcpl_201;
  assign m_and_85_cse = ccs_ccore_en & and_dcpl_203;
  assign m_and_86_cse = ccs_ccore_en & and_dcpl_204;
  assign m_and_87_cse = ccs_ccore_en & and_dcpl_205;
  assign m_and_88_cse = ccs_ccore_en & and_dcpl_209 & and_dcpl_207;
  assign m_and_89_cse = ccs_ccore_en & and_dcpl_209 & and_dcpl_212;
  assign m_and_90_cse = ccs_ccore_en & and_dcpl_209 & and_dcpl_214;
  assign m_and_91_cse = ccs_ccore_en & and_dcpl_209 & and_dcpl_211 & (result_rem_11cyc[1]);
  assign m_and_92_cse = ccs_ccore_en & and_dcpl_209 & and_dcpl_218 & (~ (result_rem_11cyc[1]));
  assign m_and_93_cse = ccs_ccore_en & and_dcpl_209 & and_dcpl_221 & (~ (result_rem_11cyc[1]));
  assign m_and_94_cse = ccs_ccore_en & and_dcpl_209 & and_dcpl_218 & (result_rem_11cyc[1]);
  assign m_and_95_cse = ccs_ccore_en & and_dcpl_209 & and_dcpl_221 & (result_rem_11cyc[1]);
  assign m_and_96_cse = ccs_ccore_en & and_dcpl_228 & and_dcpl_207;
  assign m_and_97_cse = ccs_ccore_en & and_dcpl_228 & and_dcpl_212;
  assign m_and_98_cse = ccs_ccore_en & and_dcpl_228 & and_dcpl_214;
  assign nl_result_result_acc_tmp = conv_u2u_2_4(signext_2_1(result_acc_imod_1[3]))
      + conv_u2u_3_4(result_acc_imod_1[2:0]);
  assign result_result_acc_tmp = nl_result_result_acc_tmp[3:0];
  assign nl_result_acc_imod_1 = conv_u2s_3_4(result_acc_idiv_1[2:0]) + conv_u2s_3_4({(~
      (result_acc_idiv_1[3])) , 2'b00}) + conv_s2s_3_4({2'b10 , (result_acc_idiv_1[3])});
  assign result_acc_imod_1 = nl_result_acc_imod_1[3:0];
  assign nl_result_acc_idiv_1 = result_rem_11cyc + 4'b0001;
  assign result_acc_idiv_1 = nl_result_acc_idiv_1[3:0];
  assign and_dcpl_1 = ~((result_rem_11cyc_st_9[3]) | (result_rem_11cyc_st_9[1]));
  assign and_dcpl_2 = and_dcpl_1 & (~ (result_rem_11cyc_st_9[0]));
  assign and_dcpl_3 = main_stage_0_10 & asn_itm_9;
  assign and_dcpl_4 = and_dcpl_3 & (~ (result_rem_11cyc_st_9[2]));
  assign and_dcpl_6 = and_dcpl_1 & (result_rem_11cyc_st_9[0]);
  assign and_dcpl_8 = (~ (result_rem_11cyc_st_9[3])) & (result_rem_11cyc_st_9[1]);
  assign and_dcpl_9 = and_dcpl_8 & (~ (result_rem_11cyc_st_9[0]));
  assign and_dcpl_11 = and_dcpl_8 & (result_rem_11cyc_st_9[0]);
  assign and_dcpl_13 = and_dcpl_3 & (result_rem_11cyc_st_9[2]);
  assign and_dcpl_18 = (result_rem_11cyc_st_9[3]) & (~ (result_rem_11cyc_st_9[1]));
  assign and_dcpl_26 = ~((result_rem_11cyc_st_8[3]) | (result_rem_11cyc_st_8[1]));
  assign and_dcpl_27 = and_dcpl_26 & (~ (result_rem_11cyc_st_8[0]));
  assign and_dcpl_28 = main_stage_0_9 & asn_itm_8;
  assign and_dcpl_29 = and_dcpl_28 & (~ (result_rem_11cyc_st_8[2]));
  assign and_dcpl_30 = and_dcpl_29 & and_dcpl_27;
  assign and_dcpl_31 = and_dcpl_26 & (result_rem_11cyc_st_8[0]);
  assign and_dcpl_32 = and_dcpl_29 & and_dcpl_31;
  assign and_dcpl_33 = (~ (result_rem_11cyc_st_8[3])) & (result_rem_11cyc_st_8[1]);
  assign and_dcpl_34 = and_dcpl_33 & (~ (result_rem_11cyc_st_8[0]));
  assign and_dcpl_35 = and_dcpl_29 & and_dcpl_34;
  assign and_dcpl_36 = and_dcpl_33 & (result_rem_11cyc_st_8[0]);
  assign and_dcpl_37 = and_dcpl_29 & and_dcpl_36;
  assign and_dcpl_38 = and_dcpl_28 & (result_rem_11cyc_st_8[2]);
  assign and_dcpl_39 = and_dcpl_38 & and_dcpl_27;
  assign and_dcpl_40 = and_dcpl_38 & and_dcpl_31;
  assign and_dcpl_41 = and_dcpl_38 & and_dcpl_34;
  assign and_dcpl_42 = and_dcpl_38 & and_dcpl_36;
  assign and_dcpl_43 = (result_rem_11cyc_st_8[3]) & (~ (result_rem_11cyc_st_8[1]));
  assign and_dcpl_45 = and_dcpl_29 & and_dcpl_43 & (~ (result_rem_11cyc_st_8[0]));
  assign and_dcpl_47 = and_dcpl_29 & and_dcpl_43 & (result_rem_11cyc_st_8[0]);
  assign and_dcpl_50 = and_dcpl_29 & (result_rem_11cyc_st_8[3]) & (result_rem_11cyc_st_8[1])
      & (~ (result_rem_11cyc_st_8[0]));
  assign and_dcpl_51 = ~((result_rem_11cyc_st_7[2]) | (result_rem_11cyc_st_7[0]));
  assign and_dcpl_52 = and_dcpl_51 & (~ (result_rem_11cyc_st_7[1]));
  assign and_dcpl_53 = main_stage_0_8 & asn_itm_7;
  assign and_dcpl_54 = and_dcpl_53 & (~ (result_rem_11cyc_st_7[3]));
  assign and_dcpl_55 = and_dcpl_54 & and_dcpl_52;
  assign and_dcpl_56 = (~ (result_rem_11cyc_st_7[2])) & (result_rem_11cyc_st_7[0]);
  assign and_dcpl_57 = and_dcpl_56 & (~ (result_rem_11cyc_st_7[1]));
  assign and_dcpl_58 = and_dcpl_54 & and_dcpl_57;
  assign and_dcpl_59 = and_dcpl_51 & (result_rem_11cyc_st_7[1]);
  assign and_dcpl_60 = and_dcpl_54 & and_dcpl_59;
  assign and_dcpl_62 = and_dcpl_54 & and_dcpl_56 & (result_rem_11cyc_st_7[1]);
  assign and_dcpl_63 = (result_rem_11cyc_st_7[2]) & (~ (result_rem_11cyc_st_7[0]));
  assign and_dcpl_65 = and_dcpl_54 & and_dcpl_63 & (~ (result_rem_11cyc_st_7[1]));
  assign and_dcpl_66 = (result_rem_11cyc_st_7[2]) & (result_rem_11cyc_st_7[0]);
  assign and_dcpl_68 = and_dcpl_54 & and_dcpl_66 & (~ (result_rem_11cyc_st_7[1]));
  assign and_dcpl_70 = and_dcpl_54 & and_dcpl_63 & (result_rem_11cyc_st_7[1]);
  assign and_dcpl_72 = and_dcpl_54 & and_dcpl_66 & (result_rem_11cyc_st_7[1]);
  assign and_dcpl_73 = and_dcpl_53 & (result_rem_11cyc_st_7[3]);
  assign and_dcpl_74 = and_dcpl_73 & and_dcpl_52;
  assign and_dcpl_75 = and_dcpl_73 & and_dcpl_57;
  assign and_dcpl_76 = and_dcpl_73 & and_dcpl_59;
  assign and_dcpl_77 = ~((result_rem_11cyc_st_6[2]) | (result_rem_11cyc_st_6[0]));
  assign and_dcpl_78 = and_dcpl_77 & (~ (result_rem_11cyc_st_6[1]));
  assign and_dcpl_79 = main_stage_0_7 & asn_itm_6;
  assign and_dcpl_80 = and_dcpl_79 & (~ (result_rem_11cyc_st_6[3]));
  assign and_dcpl_81 = and_dcpl_80 & and_dcpl_78;
  assign and_dcpl_82 = (~ (result_rem_11cyc_st_6[2])) & (result_rem_11cyc_st_6[0]);
  assign and_dcpl_83 = and_dcpl_82 & (~ (result_rem_11cyc_st_6[1]));
  assign and_dcpl_84 = and_dcpl_80 & and_dcpl_83;
  assign and_dcpl_85 = and_dcpl_77 & (result_rem_11cyc_st_6[1]);
  assign and_dcpl_86 = and_dcpl_80 & and_dcpl_85;
  assign and_dcpl_88 = and_dcpl_80 & and_dcpl_82 & (result_rem_11cyc_st_6[1]);
  assign and_dcpl_89 = (result_rem_11cyc_st_6[2]) & (~ (result_rem_11cyc_st_6[0]));
  assign and_dcpl_91 = and_dcpl_80 & and_dcpl_89 & (~ (result_rem_11cyc_st_6[1]));
  assign and_dcpl_92 = (result_rem_11cyc_st_6[2]) & (result_rem_11cyc_st_6[0]);
  assign and_dcpl_94 = and_dcpl_80 & and_dcpl_92 & (~ (result_rem_11cyc_st_6[1]));
  assign and_dcpl_96 = and_dcpl_80 & and_dcpl_89 & (result_rem_11cyc_st_6[1]);
  assign and_dcpl_98 = and_dcpl_80 & and_dcpl_92 & (result_rem_11cyc_st_6[1]);
  assign and_dcpl_99 = and_dcpl_79 & (result_rem_11cyc_st_6[3]);
  assign and_dcpl_100 = and_dcpl_99 & and_dcpl_78;
  assign and_dcpl_101 = and_dcpl_99 & and_dcpl_83;
  assign and_dcpl_102 = and_dcpl_99 & and_dcpl_85;
  assign and_dcpl_103 = ~((result_rem_11cyc_st_5[3]) | (result_rem_11cyc_st_5[0]));
  assign and_dcpl_104 = and_dcpl_103 & (~ (result_rem_11cyc_st_5[1]));
  assign and_dcpl_105 = main_stage_0_6 & asn_itm_5;
  assign and_dcpl_106 = and_dcpl_105 & (~ (result_rem_11cyc_st_5[2]));
  assign and_dcpl_107 = and_dcpl_106 & and_dcpl_104;
  assign and_dcpl_108 = (~ (result_rem_11cyc_st_5[3])) & (result_rem_11cyc_st_5[0]);
  assign and_dcpl_109 = and_dcpl_108 & (~ (result_rem_11cyc_st_5[1]));
  assign and_dcpl_110 = and_dcpl_106 & and_dcpl_109;
  assign and_dcpl_111 = and_dcpl_103 & (result_rem_11cyc_st_5[1]);
  assign and_dcpl_112 = and_dcpl_106 & and_dcpl_111;
  assign and_dcpl_113 = and_dcpl_108 & (result_rem_11cyc_st_5[1]);
  assign and_dcpl_114 = and_dcpl_106 & and_dcpl_113;
  assign and_dcpl_115 = and_dcpl_105 & (result_rem_11cyc_st_5[2]);
  assign and_dcpl_116 = and_dcpl_115 & and_dcpl_104;
  assign and_dcpl_117 = and_dcpl_115 & and_dcpl_109;
  assign and_dcpl_118 = and_dcpl_115 & and_dcpl_111;
  assign and_dcpl_119 = and_dcpl_115 & and_dcpl_113;
  assign and_dcpl_120 = (result_rem_11cyc_st_5[3]) & (~ (result_rem_11cyc_st_5[0]));
  assign and_dcpl_122 = and_dcpl_106 & and_dcpl_120 & (~ (result_rem_11cyc_st_5[1]));
  assign and_dcpl_125 = and_dcpl_106 & (result_rem_11cyc_st_5[3]) & (result_rem_11cyc_st_5[0])
      & (~ (result_rem_11cyc_st_5[1]));
  assign and_dcpl_127 = and_dcpl_106 & and_dcpl_120 & (result_rem_11cyc_st_5[1]);
  assign and_dcpl_128 = ~((result_rem_11cyc_st_4[2]) | (result_rem_11cyc_st_4[0]));
  assign and_dcpl_129 = and_dcpl_128 & (~ (result_rem_11cyc_st_4[1]));
  assign and_dcpl_130 = main_stage_0_5 & asn_itm_4;
  assign and_dcpl_131 = and_dcpl_130 & (~ (result_rem_11cyc_st_4[3]));
  assign and_dcpl_132 = and_dcpl_131 & and_dcpl_129;
  assign and_dcpl_133 = (~ (result_rem_11cyc_st_4[2])) & (result_rem_11cyc_st_4[0]);
  assign and_dcpl_134 = and_dcpl_133 & (~ (result_rem_11cyc_st_4[1]));
  assign and_dcpl_135 = and_dcpl_131 & and_dcpl_134;
  assign and_dcpl_136 = and_dcpl_128 & (result_rem_11cyc_st_4[1]);
  assign and_dcpl_137 = and_dcpl_131 & and_dcpl_136;
  assign and_dcpl_139 = and_dcpl_131 & and_dcpl_133 & (result_rem_11cyc_st_4[1]);
  assign and_dcpl_140 = (result_rem_11cyc_st_4[2]) & (~ (result_rem_11cyc_st_4[0]));
  assign and_dcpl_142 = and_dcpl_131 & and_dcpl_140 & (~ (result_rem_11cyc_st_4[1]));
  assign and_dcpl_143 = (result_rem_11cyc_st_4[2]) & (result_rem_11cyc_st_4[0]);
  assign and_dcpl_145 = and_dcpl_131 & and_dcpl_143 & (~ (result_rem_11cyc_st_4[1]));
  assign and_dcpl_147 = and_dcpl_131 & and_dcpl_140 & (result_rem_11cyc_st_4[1]);
  assign and_dcpl_149 = and_dcpl_131 & and_dcpl_143 & (result_rem_11cyc_st_4[1]);
  assign and_dcpl_150 = and_dcpl_130 & (result_rem_11cyc_st_4[3]);
  assign and_dcpl_151 = and_dcpl_150 & and_dcpl_129;
  assign and_dcpl_152 = and_dcpl_150 & and_dcpl_134;
  assign and_dcpl_153 = and_dcpl_150 & and_dcpl_136;
  assign and_dcpl_154 = ~((result_rem_11cyc_st_3[2:1]!=2'b00));
  assign and_dcpl_155 = and_dcpl_154 & (~ (result_rem_11cyc_st_3[0]));
  assign and_dcpl_156 = main_stage_0_4 & asn_itm_3;
  assign and_dcpl_157 = and_dcpl_156 & (~ (result_rem_11cyc_st_3[3]));
  assign and_dcpl_158 = and_dcpl_157 & and_dcpl_155;
  assign and_dcpl_159 = and_dcpl_154 & (result_rem_11cyc_st_3[0]);
  assign and_dcpl_160 = and_dcpl_157 & and_dcpl_159;
  assign and_dcpl_161 = (result_rem_11cyc_st_3[2:1]==2'b01);
  assign and_dcpl_162 = and_dcpl_161 & (~ (result_rem_11cyc_st_3[0]));
  assign and_dcpl_163 = and_dcpl_157 & and_dcpl_162;
  assign and_dcpl_165 = and_dcpl_157 & and_dcpl_161 & (result_rem_11cyc_st_3[0]);
  assign and_dcpl_166 = (result_rem_11cyc_st_3[2:1]==2'b10);
  assign and_dcpl_168 = and_dcpl_157 & and_dcpl_166 & (~ (result_rem_11cyc_st_3[0]));
  assign and_dcpl_170 = and_dcpl_157 & and_dcpl_166 & (result_rem_11cyc_st_3[0]);
  assign and_dcpl_171 = (result_rem_11cyc_st_3[2:1]==2'b11);
  assign and_dcpl_173 = and_dcpl_157 & and_dcpl_171 & (~ (result_rem_11cyc_st_3[0]));
  assign and_dcpl_175 = and_dcpl_157 & and_dcpl_171 & (result_rem_11cyc_st_3[0]);
  assign and_dcpl_176 = and_dcpl_156 & (result_rem_11cyc_st_3[3]);
  assign and_dcpl_177 = and_dcpl_176 & and_dcpl_155;
  assign and_dcpl_178 = and_dcpl_176 & and_dcpl_159;
  assign and_dcpl_179 = and_dcpl_176 & and_dcpl_162;
  assign and_dcpl_180 = ~((result_rem_11cyc_st_2[2:1]!=2'b00));
  assign and_dcpl_181 = and_dcpl_180 & (~ (result_rem_11cyc_st_2[0]));
  assign and_dcpl_182 = main_stage_0_3 & asn_itm_2;
  assign and_dcpl_183 = and_dcpl_182 & (~ (result_rem_11cyc_st_2[3]));
  assign and_dcpl_184 = and_dcpl_183 & and_dcpl_181;
  assign and_dcpl_185 = and_dcpl_180 & (result_rem_11cyc_st_2[0]);
  assign and_dcpl_186 = and_dcpl_183 & and_dcpl_185;
  assign and_dcpl_187 = (result_rem_11cyc_st_2[2:1]==2'b01);
  assign and_dcpl_188 = and_dcpl_187 & (~ (result_rem_11cyc_st_2[0]));
  assign and_dcpl_189 = and_dcpl_183 & and_dcpl_188;
  assign and_dcpl_191 = and_dcpl_183 & and_dcpl_187 & (result_rem_11cyc_st_2[0]);
  assign and_dcpl_192 = (result_rem_11cyc_st_2[2:1]==2'b10);
  assign and_dcpl_194 = and_dcpl_183 & and_dcpl_192 & (~ (result_rem_11cyc_st_2[0]));
  assign and_dcpl_196 = and_dcpl_183 & and_dcpl_192 & (result_rem_11cyc_st_2[0]);
  assign and_dcpl_197 = (result_rem_11cyc_st_2[2:1]==2'b11);
  assign and_dcpl_199 = and_dcpl_183 & and_dcpl_197 & (~ (result_rem_11cyc_st_2[0]));
  assign and_dcpl_201 = and_dcpl_183 & and_dcpl_197 & (result_rem_11cyc_st_2[0]);
  assign and_dcpl_202 = and_dcpl_182 & (result_rem_11cyc_st_2[3]);
  assign and_dcpl_203 = and_dcpl_202 & and_dcpl_181;
  assign and_dcpl_204 = and_dcpl_202 & and_dcpl_185;
  assign and_dcpl_205 = and_dcpl_202 & and_dcpl_188;
  assign and_dcpl_206 = ~((result_rem_11cyc[2]) | (result_rem_11cyc[0]));
  assign and_dcpl_207 = and_dcpl_206 & (~ (result_rem_11cyc[1]));
  assign and_dcpl_208 = main_stage_0_2 & asn_itm_1;
  assign and_dcpl_209 = and_dcpl_208 & (~ (result_rem_11cyc[3]));
  assign and_dcpl_211 = (~ (result_rem_11cyc[2])) & (result_rem_11cyc[0]);
  assign and_dcpl_212 = and_dcpl_211 & (~ (result_rem_11cyc[1]));
  assign and_dcpl_214 = and_dcpl_206 & (result_rem_11cyc[1]);
  assign and_dcpl_218 = (result_rem_11cyc[2]) & (~ (result_rem_11cyc[0]));
  assign and_dcpl_221 = (result_rem_11cyc[2]) & (result_rem_11cyc[0]);
  assign and_dcpl_228 = and_dcpl_208 & (result_rem_11cyc[3]);
  assign and_dcpl_232 = ~((result_rem_11cyc_st_11[2:1]!=2'b00));
  assign and_dcpl_233 = and_dcpl_232 & (~ (result_rem_11cyc_st_11[0]));
  assign and_dcpl_234 = main_stage_0_12 & asn_itm_11;
  assign and_dcpl_235 = and_dcpl_234 & (~ (result_rem_11cyc_st_11[3]));
  assign and_dcpl_237 = and_dcpl_232 & (result_rem_11cyc_st_11[0]);
  assign and_dcpl_239 = (result_rem_11cyc_st_11[2:1]==2'b01);
  assign and_dcpl_240 = and_dcpl_239 & (~ (result_rem_11cyc_st_11[0]));
  assign and_dcpl_244 = (result_rem_11cyc_st_11[2:1]==2'b10);
  assign and_dcpl_249 = (result_rem_11cyc_st_11[2:1]==2'b11);
  assign and_dcpl_254 = and_dcpl_234 & (result_rem_11cyc_st_11[3]);
  assign and_dcpl_260 = ~((result_result_acc_tmp[1:0]!=2'b00));
  assign and_dcpl_261 = ccs_ccore_start_rsci_idat & (~ (result_result_acc_tmp[2]));
  assign and_dcpl_262 = and_dcpl_261 & (~ (result_result_acc_tmp[3]));
  assign and_dcpl_263 = and_dcpl_262 & and_dcpl_260;
  assign or_tmp_2 = (result_rem_11cyc!=4'b0000) | (~ and_dcpl_208);
  assign or_3_cse = (result_result_acc_tmp!=4'b0000);
  assign nor_691_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_2));
  assign mux_nl = MUX_s_1_2_2(nor_691_nl, or_tmp_2, or_3_cse);
  assign and_dcpl_269 = mux_nl & and_dcpl_184;
  assign or_8_cse = (result_rem_11cyc!=4'b0000);
  assign nor_690_nl = ~(and_dcpl_208 | and_dcpl_184);
  assign or_10_nl = (result_rem_11cyc_st_2!=4'b0000) | (~ and_dcpl_182);
  assign mux_tmp_1 = MUX_s_1_2_2(nor_690_nl, or_10_nl, or_8_cse);
  assign nor_689_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_1));
  assign mux_2_nl = MUX_s_1_2_2(nor_689_nl, mux_tmp_1, or_3_cse);
  assign and_dcpl_275 = mux_2_nl & and_dcpl_158;
  assign or_15_cse = (result_rem_11cyc_st_2!=4'b0000);
  assign nor_687_nl = ~(and_dcpl_182 | and_dcpl_158);
  assign or_17_nl = (result_rem_11cyc_st_3!=4'b0000) | (~ and_dcpl_156);
  assign mux_tmp_3 = MUX_s_1_2_2(nor_687_nl, or_17_nl, or_15_cse);
  assign nor_688_nl = ~(and_dcpl_208 | (~ mux_tmp_3));
  assign mux_tmp_4 = MUX_s_1_2_2(nor_688_nl, mux_tmp_3, or_8_cse);
  assign nor_686_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_4));
  assign mux_5_nl = MUX_s_1_2_2(nor_686_nl, mux_tmp_4, or_3_cse);
  assign and_dcpl_281 = mux_5_nl & and_dcpl_132;
  assign or_24_cse = (result_rem_11cyc_st_3!=4'b0000);
  assign nor_683_nl = ~(and_dcpl_156 | and_dcpl_132);
  assign or_26_nl = (result_rem_11cyc_st_4!=4'b0000) | (~ and_dcpl_130);
  assign mux_tmp_6 = MUX_s_1_2_2(nor_683_nl, or_26_nl, or_24_cse);
  assign nor_684_nl = ~(and_dcpl_182 | (~ mux_tmp_6));
  assign mux_tmp_7 = MUX_s_1_2_2(nor_684_nl, mux_tmp_6, or_15_cse);
  assign nor_685_nl = ~(and_dcpl_208 | (~ mux_tmp_7));
  assign mux_tmp_8 = MUX_s_1_2_2(nor_685_nl, mux_tmp_7, or_8_cse);
  assign nor_682_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_8));
  assign mux_9_nl = MUX_s_1_2_2(nor_682_nl, mux_tmp_8, or_3_cse);
  assign and_dcpl_287 = mux_9_nl & and_dcpl_107;
  assign or_35_cse = (result_rem_11cyc_st_4!=4'b0000);
  assign nor_678_nl = ~(and_dcpl_130 | and_dcpl_107);
  assign or_37_nl = (result_rem_11cyc_st_5!=4'b0000) | (~ and_dcpl_105);
  assign mux_tmp_10 = MUX_s_1_2_2(nor_678_nl, or_37_nl, or_35_cse);
  assign nor_679_nl = ~(and_dcpl_156 | (~ mux_tmp_10));
  assign mux_tmp_11 = MUX_s_1_2_2(nor_679_nl, mux_tmp_10, or_24_cse);
  assign nor_680_nl = ~(and_dcpl_182 | (~ mux_tmp_11));
  assign mux_tmp_12 = MUX_s_1_2_2(nor_680_nl, mux_tmp_11, or_15_cse);
  assign nor_681_nl = ~(and_dcpl_208 | (~ mux_tmp_12));
  assign mux_tmp_13 = MUX_s_1_2_2(nor_681_nl, mux_tmp_12, or_8_cse);
  assign nor_677_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_13));
  assign mux_14_nl = MUX_s_1_2_2(nor_677_nl, mux_tmp_13, or_3_cse);
  assign and_dcpl_293 = mux_14_nl & and_dcpl_81;
  assign or_48_cse = (result_rem_11cyc_st_5!=4'b0000);
  assign nor_672_nl = ~(and_dcpl_105 | and_dcpl_81);
  assign or_50_nl = (result_rem_11cyc_st_6!=4'b0000) | (~ and_dcpl_79);
  assign mux_tmp_15 = MUX_s_1_2_2(nor_672_nl, or_50_nl, or_48_cse);
  assign nor_673_nl = ~(and_dcpl_130 | (~ mux_tmp_15));
  assign mux_tmp_16 = MUX_s_1_2_2(nor_673_nl, mux_tmp_15, or_35_cse);
  assign nor_674_nl = ~(and_dcpl_156 | (~ mux_tmp_16));
  assign mux_tmp_17 = MUX_s_1_2_2(nor_674_nl, mux_tmp_16, or_24_cse);
  assign nor_675_nl = ~(and_dcpl_182 | (~ mux_tmp_17));
  assign mux_tmp_18 = MUX_s_1_2_2(nor_675_nl, mux_tmp_17, or_15_cse);
  assign nor_676_nl = ~(and_dcpl_208 | (~ mux_tmp_18));
  assign mux_tmp_19 = MUX_s_1_2_2(nor_676_nl, mux_tmp_18, or_8_cse);
  assign nor_671_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_19));
  assign mux_20_nl = MUX_s_1_2_2(nor_671_nl, mux_tmp_19, or_3_cse);
  assign and_dcpl_299 = mux_20_nl & and_dcpl_55;
  assign or_63_cse = (result_rem_11cyc_st_6!=4'b0000);
  assign nor_665_nl = ~(and_dcpl_79 | and_dcpl_55);
  assign or_65_nl = (result_rem_11cyc_st_7!=4'b0000) | (~ and_dcpl_53);
  assign mux_tmp_21 = MUX_s_1_2_2(nor_665_nl, or_65_nl, or_63_cse);
  assign nor_666_nl = ~(and_dcpl_105 | (~ mux_tmp_21));
  assign mux_tmp_22 = MUX_s_1_2_2(nor_666_nl, mux_tmp_21, or_48_cse);
  assign nor_667_nl = ~(and_dcpl_130 | (~ mux_tmp_22));
  assign mux_tmp_23 = MUX_s_1_2_2(nor_667_nl, mux_tmp_22, or_35_cse);
  assign nor_668_nl = ~(and_dcpl_156 | (~ mux_tmp_23));
  assign mux_tmp_24 = MUX_s_1_2_2(nor_668_nl, mux_tmp_23, or_24_cse);
  assign nor_669_nl = ~(and_dcpl_182 | (~ mux_tmp_24));
  assign mux_tmp_25 = MUX_s_1_2_2(nor_669_nl, mux_tmp_24, or_15_cse);
  assign nor_670_nl = ~(and_dcpl_208 | (~ mux_tmp_25));
  assign mux_tmp_26 = MUX_s_1_2_2(nor_670_nl, mux_tmp_25, or_8_cse);
  assign nor_664_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_26));
  assign mux_27_nl = MUX_s_1_2_2(nor_664_nl, mux_tmp_26, or_3_cse);
  assign and_dcpl_305 = mux_27_nl & and_dcpl_30;
  assign nor_656_nl = ~(and_dcpl_53 | and_dcpl_30);
  assign or_82_nl = (result_rem_11cyc_st_8!=4'b0000) | (~ and_dcpl_28);
  assign or_80_nl = (result_rem_11cyc_st_7!=4'b0000);
  assign mux_tmp_28 = MUX_s_1_2_2(nor_656_nl, or_82_nl, or_80_nl);
  assign nor_657_nl = ~(and_dcpl_79 | (~ mux_tmp_28));
  assign mux_tmp_29 = MUX_s_1_2_2(nor_657_nl, mux_tmp_28, or_63_cse);
  assign nor_658_nl = ~(and_dcpl_105 | (~ mux_tmp_29));
  assign mux_tmp_30 = MUX_s_1_2_2(nor_658_nl, mux_tmp_29, or_48_cse);
  assign nor_659_nl = ~(and_dcpl_130 | (~ mux_tmp_30));
  assign mux_tmp_31 = MUX_s_1_2_2(nor_659_nl, mux_tmp_30, or_35_cse);
  assign nor_660_nl = ~(and_dcpl_156 | (~ mux_tmp_31));
  assign mux_tmp_32 = MUX_s_1_2_2(nor_660_nl, mux_tmp_31, or_24_cse);
  assign nor_661_nl = ~(and_dcpl_182 | (~ mux_tmp_32));
  assign mux_tmp_33 = MUX_s_1_2_2(nor_661_nl, mux_tmp_32, or_15_cse);
  assign nor_662_nl = ~(and_dcpl_208 | (~ mux_tmp_33));
  assign mux_tmp_34 = MUX_s_1_2_2(nor_662_nl, mux_tmp_33, or_8_cse);
  assign nor_663_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_34));
  assign mux_35_nl = MUX_s_1_2_2(nor_663_nl, mux_tmp_34, or_3_cse);
  assign and_dcpl_311 = mux_35_nl & and_dcpl_4 & and_dcpl_2;
  assign and_tmp_6 = ((~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2!=4'b0000))
      & ((~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3!=4'b0000)) &
      ((~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4!=4'b0000)) & ((~
      main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5!=4'b0000)) & ((~ main_stage_0_7)
      | (~ asn_itm_6) | (result_rem_11cyc_st_6!=4'b0000)) & ((~ main_stage_0_8) |
      (~ asn_itm_7) | (result_rem_11cyc_st_7!=4'b0000)) & ((~ main_stage_0_9) | (~
      asn_itm_8) | (result_rem_11cyc_st_8!=4'b0000)) & ((~ main_stage_0_10) | (~
      asn_itm_9) | (result_rem_11cyc_st_9!=4'b0000));
  assign nor_654_nl = ~(and_dcpl_208 | (~ and_tmp_6));
  assign mux_tmp_36 = MUX_s_1_2_2(nor_654_nl, and_tmp_6, or_8_cse);
  assign nor_655_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_36));
  assign mux_tmp_37 = MUX_s_1_2_2(nor_655_nl, mux_tmp_36, or_3_cse);
  assign and_dcpl_318 = (result_result_acc_tmp[1:0]==2'b01);
  assign and_dcpl_319 = and_dcpl_262 & and_dcpl_318;
  assign or_tmp_102 = (result_rem_11cyc!=4'b0001) | (~ and_dcpl_208);
  assign or_107_cse = (result_result_acc_tmp!=4'b0001);
  assign nor_653_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_102));
  assign mux_38_nl = MUX_s_1_2_2(nor_653_nl, or_tmp_102, or_107_cse);
  assign and_dcpl_322 = mux_38_nl & and_dcpl_186;
  assign or_112_cse = (result_rem_11cyc!=4'b0001);
  assign nor_652_nl = ~(and_dcpl_208 | and_dcpl_186);
  assign or_114_nl = (result_rem_11cyc_st_2!=4'b0001) | (~ and_dcpl_182);
  assign mux_tmp_39 = MUX_s_1_2_2(nor_652_nl, or_114_nl, or_112_cse);
  assign nor_651_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_39));
  assign mux_40_nl = MUX_s_1_2_2(nor_651_nl, mux_tmp_39, or_107_cse);
  assign and_dcpl_325 = mux_40_nl & and_dcpl_160;
  assign or_119_cse = (result_rem_11cyc_st_2!=4'b0001);
  assign nor_649_nl = ~(and_dcpl_182 | and_dcpl_160);
  assign or_121_nl = (result_rem_11cyc_st_3!=4'b0001) | (~ and_dcpl_156);
  assign mux_tmp_41 = MUX_s_1_2_2(nor_649_nl, or_121_nl, or_119_cse);
  assign nor_650_nl = ~(and_dcpl_208 | (~ mux_tmp_41));
  assign mux_tmp_42 = MUX_s_1_2_2(nor_650_nl, mux_tmp_41, or_112_cse);
  assign nor_648_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_42));
  assign mux_43_nl = MUX_s_1_2_2(nor_648_nl, mux_tmp_42, or_107_cse);
  assign and_dcpl_329 = mux_43_nl & and_dcpl_135;
  assign or_128_cse = (result_rem_11cyc_st_3!=4'b0001);
  assign nor_645_nl = ~(and_dcpl_156 | and_dcpl_135);
  assign or_130_nl = (result_rem_11cyc_st_4!=4'b0001) | (~ and_dcpl_130);
  assign mux_tmp_44 = MUX_s_1_2_2(nor_645_nl, or_130_nl, or_128_cse);
  assign nor_646_nl = ~(and_dcpl_182 | (~ mux_tmp_44));
  assign mux_tmp_45 = MUX_s_1_2_2(nor_646_nl, mux_tmp_44, or_119_cse);
  assign nor_647_nl = ~(and_dcpl_208 | (~ mux_tmp_45));
  assign mux_tmp_46 = MUX_s_1_2_2(nor_647_nl, mux_tmp_45, or_112_cse);
  assign nor_644_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_46));
  assign mux_47_nl = MUX_s_1_2_2(nor_644_nl, mux_tmp_46, or_107_cse);
  assign and_dcpl_333 = mux_47_nl & and_dcpl_110;
  assign or_139_cse = (result_rem_11cyc_st_4!=4'b0001);
  assign nor_640_nl = ~(and_dcpl_130 | and_dcpl_110);
  assign or_141_nl = (result_rem_11cyc_st_5!=4'b0001) | (~ and_dcpl_105);
  assign mux_tmp_48 = MUX_s_1_2_2(nor_640_nl, or_141_nl, or_139_cse);
  assign nor_641_nl = ~(and_dcpl_156 | (~ mux_tmp_48));
  assign mux_tmp_49 = MUX_s_1_2_2(nor_641_nl, mux_tmp_48, or_128_cse);
  assign nor_642_nl = ~(and_dcpl_182 | (~ mux_tmp_49));
  assign mux_tmp_50 = MUX_s_1_2_2(nor_642_nl, mux_tmp_49, or_119_cse);
  assign nor_643_nl = ~(and_dcpl_208 | (~ mux_tmp_50));
  assign mux_tmp_51 = MUX_s_1_2_2(nor_643_nl, mux_tmp_50, or_112_cse);
  assign nor_639_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_51));
  assign mux_52_nl = MUX_s_1_2_2(nor_639_nl, mux_tmp_51, or_107_cse);
  assign and_dcpl_337 = mux_52_nl & and_dcpl_84;
  assign or_152_cse = (result_rem_11cyc_st_5!=4'b0001);
  assign nor_634_nl = ~(and_dcpl_105 | and_dcpl_84);
  assign or_154_nl = (result_rem_11cyc_st_6!=4'b0001) | (~ and_dcpl_79);
  assign mux_tmp_53 = MUX_s_1_2_2(nor_634_nl, or_154_nl, or_152_cse);
  assign nor_635_nl = ~(and_dcpl_130 | (~ mux_tmp_53));
  assign mux_tmp_54 = MUX_s_1_2_2(nor_635_nl, mux_tmp_53, or_139_cse);
  assign nor_636_nl = ~(and_dcpl_156 | (~ mux_tmp_54));
  assign mux_tmp_55 = MUX_s_1_2_2(nor_636_nl, mux_tmp_54, or_128_cse);
  assign nor_637_nl = ~(and_dcpl_182 | (~ mux_tmp_55));
  assign mux_tmp_56 = MUX_s_1_2_2(nor_637_nl, mux_tmp_55, or_119_cse);
  assign nor_638_nl = ~(and_dcpl_208 | (~ mux_tmp_56));
  assign mux_tmp_57 = MUX_s_1_2_2(nor_638_nl, mux_tmp_56, or_112_cse);
  assign nor_633_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_57));
  assign mux_58_nl = MUX_s_1_2_2(nor_633_nl, mux_tmp_57, or_107_cse);
  assign and_dcpl_341 = mux_58_nl & and_dcpl_58;
  assign or_167_cse = (result_rem_11cyc_st_6!=4'b0001);
  assign nor_627_nl = ~(and_dcpl_79 | and_dcpl_58);
  assign or_169_nl = (result_rem_11cyc_st_7!=4'b0001) | (~ and_dcpl_53);
  assign mux_tmp_59 = MUX_s_1_2_2(nor_627_nl, or_169_nl, or_167_cse);
  assign nor_628_nl = ~(and_dcpl_105 | (~ mux_tmp_59));
  assign mux_tmp_60 = MUX_s_1_2_2(nor_628_nl, mux_tmp_59, or_152_cse);
  assign nor_629_nl = ~(and_dcpl_130 | (~ mux_tmp_60));
  assign mux_tmp_61 = MUX_s_1_2_2(nor_629_nl, mux_tmp_60, or_139_cse);
  assign nor_630_nl = ~(and_dcpl_156 | (~ mux_tmp_61));
  assign mux_tmp_62 = MUX_s_1_2_2(nor_630_nl, mux_tmp_61, or_128_cse);
  assign nor_631_nl = ~(and_dcpl_182 | (~ mux_tmp_62));
  assign mux_tmp_63 = MUX_s_1_2_2(nor_631_nl, mux_tmp_62, or_119_cse);
  assign nor_632_nl = ~(and_dcpl_208 | (~ mux_tmp_63));
  assign mux_tmp_64 = MUX_s_1_2_2(nor_632_nl, mux_tmp_63, or_112_cse);
  assign nor_626_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_64));
  assign mux_65_nl = MUX_s_1_2_2(nor_626_nl, mux_tmp_64, or_107_cse);
  assign and_dcpl_344 = mux_65_nl & and_dcpl_32;
  assign nor_618_nl = ~(and_dcpl_53 | and_dcpl_32);
  assign or_186_nl = (result_rem_11cyc_st_8!=4'b0001) | (~ and_dcpl_28);
  assign or_184_nl = (result_rem_11cyc_st_7!=4'b0001);
  assign mux_tmp_66 = MUX_s_1_2_2(nor_618_nl, or_186_nl, or_184_nl);
  assign nor_619_nl = ~(and_dcpl_79 | (~ mux_tmp_66));
  assign mux_tmp_67 = MUX_s_1_2_2(nor_619_nl, mux_tmp_66, or_167_cse);
  assign nor_620_nl = ~(and_dcpl_105 | (~ mux_tmp_67));
  assign mux_tmp_68 = MUX_s_1_2_2(nor_620_nl, mux_tmp_67, or_152_cse);
  assign nor_621_nl = ~(and_dcpl_130 | (~ mux_tmp_68));
  assign mux_tmp_69 = MUX_s_1_2_2(nor_621_nl, mux_tmp_68, or_139_cse);
  assign nor_622_nl = ~(and_dcpl_156 | (~ mux_tmp_69));
  assign mux_tmp_70 = MUX_s_1_2_2(nor_622_nl, mux_tmp_69, or_128_cse);
  assign nor_623_nl = ~(and_dcpl_182 | (~ mux_tmp_70));
  assign mux_tmp_71 = MUX_s_1_2_2(nor_623_nl, mux_tmp_70, or_119_cse);
  assign nor_624_nl = ~(and_dcpl_208 | (~ mux_tmp_71));
  assign mux_tmp_72 = MUX_s_1_2_2(nor_624_nl, mux_tmp_71, or_112_cse);
  assign nor_625_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_72));
  assign mux_73_nl = MUX_s_1_2_2(nor_625_nl, mux_tmp_72, or_107_cse);
  assign and_dcpl_347 = mux_73_nl & and_dcpl_4 & and_dcpl_6;
  assign and_tmp_13 = ((~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2!=4'b0001))
      & ((~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3!=4'b0001)) &
      ((~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4!=4'b0001)) & ((~
      main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5!=4'b0001)) & ((~ main_stage_0_7)
      | (~ asn_itm_6) | (result_rem_11cyc_st_6!=4'b0001)) & ((~ main_stage_0_8) |
      (~ asn_itm_7) | (result_rem_11cyc_st_7!=4'b0001)) & ((~ main_stage_0_9) | (~
      asn_itm_8) | (result_rem_11cyc_st_8!=4'b0001)) & ((~ main_stage_0_10) | (~
      asn_itm_9) | (result_rem_11cyc_st_9!=4'b0001));
  assign nor_617_nl = ~(and_dcpl_208 | (~ and_tmp_13));
  assign mux_tmp_74 = MUX_s_1_2_2(nor_617_nl, and_tmp_13, or_112_cse);
  assign nand_146_cse = ~((result_result_acc_tmp[0]) & ccs_ccore_start_rsci_idat);
  assign and_797_nl = nand_146_cse & mux_tmp_74;
  assign or_195_nl = (result_result_acc_tmp[3:1]!=3'b000);
  assign mux_tmp_75 = MUX_s_1_2_2(and_797_nl, mux_tmp_74, or_195_nl);
  assign and_dcpl_352 = (result_result_acc_tmp[1:0]==2'b10);
  assign and_dcpl_353 = and_dcpl_262 & and_dcpl_352;
  assign or_tmp_202 = (result_rem_11cyc!=4'b0010) | (~ and_dcpl_208);
  assign or_209_cse = (result_result_acc_tmp!=4'b0010);
  assign nor_616_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_202));
  assign mux_76_nl = MUX_s_1_2_2(nor_616_nl, or_tmp_202, or_209_cse);
  assign and_dcpl_357 = mux_76_nl & and_dcpl_189;
  assign or_214_cse = (result_rem_11cyc!=4'b0010);
  assign nor_615_nl = ~(and_dcpl_208 | and_dcpl_189);
  assign or_216_nl = (result_rem_11cyc_st_2!=4'b0010) | (~ and_dcpl_182);
  assign mux_tmp_77 = MUX_s_1_2_2(nor_615_nl, or_216_nl, or_214_cse);
  assign nor_614_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_77));
  assign mux_78_nl = MUX_s_1_2_2(nor_614_nl, mux_tmp_77, or_209_cse);
  assign and_dcpl_361 = mux_78_nl & and_dcpl_163;
  assign or_221_cse = (result_rem_11cyc_st_2!=4'b0010);
  assign nor_612_nl = ~(and_dcpl_182 | and_dcpl_163);
  assign or_223_nl = (result_rem_11cyc_st_3!=4'b0010) | (~ and_dcpl_156);
  assign mux_tmp_79 = MUX_s_1_2_2(nor_612_nl, or_223_nl, or_221_cse);
  assign nor_613_nl = ~(and_dcpl_208 | (~ mux_tmp_79));
  assign mux_tmp_80 = MUX_s_1_2_2(nor_613_nl, mux_tmp_79, or_214_cse);
  assign nor_611_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_80));
  assign mux_81_nl = MUX_s_1_2_2(nor_611_nl, mux_tmp_80, or_209_cse);
  assign and_dcpl_364 = mux_81_nl & and_dcpl_137;
  assign or_230_cse = (result_rem_11cyc_st_3!=4'b0010);
  assign nor_608_nl = ~(and_dcpl_156 | and_dcpl_137);
  assign or_232_nl = (result_rem_11cyc_st_4!=4'b0010) | (~ and_dcpl_130);
  assign mux_tmp_82 = MUX_s_1_2_2(nor_608_nl, or_232_nl, or_230_cse);
  assign nor_609_nl = ~(and_dcpl_182 | (~ mux_tmp_82));
  assign mux_tmp_83 = MUX_s_1_2_2(nor_609_nl, mux_tmp_82, or_221_cse);
  assign nor_610_nl = ~(and_dcpl_208 | (~ mux_tmp_83));
  assign mux_tmp_84 = MUX_s_1_2_2(nor_610_nl, mux_tmp_83, or_214_cse);
  assign nor_607_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_84));
  assign mux_85_nl = MUX_s_1_2_2(nor_607_nl, mux_tmp_84, or_209_cse);
  assign and_dcpl_367 = mux_85_nl & and_dcpl_112;
  assign or_241_cse = (result_rem_11cyc_st_4!=4'b0010);
  assign nor_603_nl = ~(and_dcpl_130 | and_dcpl_112);
  assign or_243_nl = (result_rem_11cyc_st_5!=4'b0010) | (~ and_dcpl_105);
  assign mux_tmp_86 = MUX_s_1_2_2(nor_603_nl, or_243_nl, or_241_cse);
  assign nor_604_nl = ~(and_dcpl_156 | (~ mux_tmp_86));
  assign mux_tmp_87 = MUX_s_1_2_2(nor_604_nl, mux_tmp_86, or_230_cse);
  assign nor_605_nl = ~(and_dcpl_182 | (~ mux_tmp_87));
  assign mux_tmp_88 = MUX_s_1_2_2(nor_605_nl, mux_tmp_87, or_221_cse);
  assign nor_606_nl = ~(and_dcpl_208 | (~ mux_tmp_88));
  assign mux_tmp_89 = MUX_s_1_2_2(nor_606_nl, mux_tmp_88, or_214_cse);
  assign nor_602_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_89));
  assign mux_90_nl = MUX_s_1_2_2(nor_602_nl, mux_tmp_89, or_209_cse);
  assign and_dcpl_370 = mux_90_nl & and_dcpl_86;
  assign or_254_cse = (result_rem_11cyc_st_5!=4'b0010);
  assign nor_597_nl = ~(and_dcpl_105 | and_dcpl_86);
  assign or_256_nl = (result_rem_11cyc_st_6!=4'b0010) | (~ and_dcpl_79);
  assign mux_tmp_91 = MUX_s_1_2_2(nor_597_nl, or_256_nl, or_254_cse);
  assign nor_598_nl = ~(and_dcpl_130 | (~ mux_tmp_91));
  assign mux_tmp_92 = MUX_s_1_2_2(nor_598_nl, mux_tmp_91, or_241_cse);
  assign nor_599_nl = ~(and_dcpl_156 | (~ mux_tmp_92));
  assign mux_tmp_93 = MUX_s_1_2_2(nor_599_nl, mux_tmp_92, or_230_cse);
  assign nor_600_nl = ~(and_dcpl_182 | (~ mux_tmp_93));
  assign mux_tmp_94 = MUX_s_1_2_2(nor_600_nl, mux_tmp_93, or_221_cse);
  assign nor_601_nl = ~(and_dcpl_208 | (~ mux_tmp_94));
  assign mux_tmp_95 = MUX_s_1_2_2(nor_601_nl, mux_tmp_94, or_214_cse);
  assign nor_596_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_95));
  assign mux_96_nl = MUX_s_1_2_2(nor_596_nl, mux_tmp_95, or_209_cse);
  assign and_dcpl_373 = mux_96_nl & and_dcpl_60;
  assign or_269_cse = (result_rem_11cyc_st_6!=4'b0010);
  assign nor_590_nl = ~(and_dcpl_79 | and_dcpl_60);
  assign or_271_nl = (result_rem_11cyc_st_7!=4'b0010) | (~ and_dcpl_53);
  assign mux_tmp_97 = MUX_s_1_2_2(nor_590_nl, or_271_nl, or_269_cse);
  assign nor_591_nl = ~(and_dcpl_105 | (~ mux_tmp_97));
  assign mux_tmp_98 = MUX_s_1_2_2(nor_591_nl, mux_tmp_97, or_254_cse);
  assign nor_592_nl = ~(and_dcpl_130 | (~ mux_tmp_98));
  assign mux_tmp_99 = MUX_s_1_2_2(nor_592_nl, mux_tmp_98, or_241_cse);
  assign nor_593_nl = ~(and_dcpl_156 | (~ mux_tmp_99));
  assign mux_tmp_100 = MUX_s_1_2_2(nor_593_nl, mux_tmp_99, or_230_cse);
  assign nor_594_nl = ~(and_dcpl_182 | (~ mux_tmp_100));
  assign mux_tmp_101 = MUX_s_1_2_2(nor_594_nl, mux_tmp_100, or_221_cse);
  assign nor_595_nl = ~(and_dcpl_208 | (~ mux_tmp_101));
  assign mux_tmp_102 = MUX_s_1_2_2(nor_595_nl, mux_tmp_101, or_214_cse);
  assign nor_589_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_102));
  assign mux_103_nl = MUX_s_1_2_2(nor_589_nl, mux_tmp_102, or_209_cse);
  assign and_dcpl_377 = mux_103_nl & and_dcpl_35;
  assign nor_581_nl = ~(and_dcpl_53 | and_dcpl_35);
  assign or_288_nl = (result_rem_11cyc_st_8!=4'b0010) | (~ and_dcpl_28);
  assign or_286_nl = (result_rem_11cyc_st_7!=4'b0010);
  assign mux_tmp_104 = MUX_s_1_2_2(nor_581_nl, or_288_nl, or_286_nl);
  assign nor_582_nl = ~(and_dcpl_79 | (~ mux_tmp_104));
  assign mux_tmp_105 = MUX_s_1_2_2(nor_582_nl, mux_tmp_104, or_269_cse);
  assign nor_583_nl = ~(and_dcpl_105 | (~ mux_tmp_105));
  assign mux_tmp_106 = MUX_s_1_2_2(nor_583_nl, mux_tmp_105, or_254_cse);
  assign nor_584_nl = ~(and_dcpl_130 | (~ mux_tmp_106));
  assign mux_tmp_107 = MUX_s_1_2_2(nor_584_nl, mux_tmp_106, or_241_cse);
  assign nor_585_nl = ~(and_dcpl_156 | (~ mux_tmp_107));
  assign mux_tmp_108 = MUX_s_1_2_2(nor_585_nl, mux_tmp_107, or_230_cse);
  assign nor_586_nl = ~(and_dcpl_182 | (~ mux_tmp_108));
  assign mux_tmp_109 = MUX_s_1_2_2(nor_586_nl, mux_tmp_108, or_221_cse);
  assign nor_587_nl = ~(and_dcpl_208 | (~ mux_tmp_109));
  assign mux_tmp_110 = MUX_s_1_2_2(nor_587_nl, mux_tmp_109, or_214_cse);
  assign nor_588_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_110));
  assign mux_111_nl = MUX_s_1_2_2(nor_588_nl, mux_tmp_110, or_209_cse);
  assign and_dcpl_381 = mux_111_nl & and_dcpl_4 & and_dcpl_9;
  assign and_tmp_20 = ((~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2!=4'b0010))
      & ((~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3!=4'b0010)) &
      ((~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4!=4'b0010)) & ((~
      main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5!=4'b0010)) & ((~ main_stage_0_7)
      | (~ asn_itm_6) | (result_rem_11cyc_st_6!=4'b0010)) & ((~ main_stage_0_8) |
      (~ asn_itm_7) | (result_rem_11cyc_st_7!=4'b0010)) & ((~ main_stage_0_9) | (~
      asn_itm_8) | (result_rem_11cyc_st_8!=4'b0010)) & ((~ main_stage_0_10) | (~
      asn_itm_9) | (result_rem_11cyc_st_9!=4'b0010));
  assign nor_579_nl = ~(and_dcpl_208 | (~ and_tmp_20));
  assign mux_tmp_112 = MUX_s_1_2_2(nor_579_nl, and_tmp_20, or_214_cse);
  assign nor_580_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_112));
  assign mux_tmp_113 = MUX_s_1_2_2(nor_580_nl, mux_tmp_112, or_209_cse);
  assign and_dcpl_386 = (result_result_acc_tmp[1:0]==2'b11);
  assign and_dcpl_387 = and_dcpl_262 & and_dcpl_386;
  assign or_tmp_302 = (result_rem_11cyc!=4'b0011) | (~ and_dcpl_208);
  assign or_311_cse = (result_result_acc_tmp!=4'b0011);
  assign nor_578_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_302));
  assign mux_114_nl = MUX_s_1_2_2(nor_578_nl, or_tmp_302, or_311_cse);
  assign and_dcpl_390 = mux_114_nl & and_dcpl_191;
  assign or_316_cse = (result_rem_11cyc!=4'b0011);
  assign nor_577_nl = ~(and_dcpl_208 | and_dcpl_191);
  assign or_318_nl = (result_rem_11cyc_st_2!=4'b0011) | (~ and_dcpl_182);
  assign mux_tmp_115 = MUX_s_1_2_2(nor_577_nl, or_318_nl, or_316_cse);
  assign nor_576_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_115));
  assign mux_116_nl = MUX_s_1_2_2(nor_576_nl, mux_tmp_115, or_311_cse);
  assign and_dcpl_393 = mux_116_nl & and_dcpl_165;
  assign or_323_cse = (result_rem_11cyc_st_2!=4'b0011);
  assign nor_574_nl = ~(and_dcpl_182 | and_dcpl_165);
  assign or_325_nl = (result_rem_11cyc_st_3!=4'b0011) | (~ and_dcpl_156);
  assign mux_tmp_117 = MUX_s_1_2_2(nor_574_nl, or_325_nl, or_323_cse);
  assign nor_575_nl = ~(and_dcpl_208 | (~ mux_tmp_117));
  assign mux_tmp_118 = MUX_s_1_2_2(nor_575_nl, mux_tmp_117, or_316_cse);
  assign nor_573_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_118));
  assign mux_119_nl = MUX_s_1_2_2(nor_573_nl, mux_tmp_118, or_311_cse);
  assign and_dcpl_396 = mux_119_nl & and_dcpl_139;
  assign or_332_cse = (result_rem_11cyc_st_3!=4'b0011);
  assign nor_570_nl = ~(and_dcpl_156 | and_dcpl_139);
  assign or_334_nl = (result_rem_11cyc_st_4!=4'b0011) | (~ and_dcpl_130);
  assign mux_tmp_120 = MUX_s_1_2_2(nor_570_nl, or_334_nl, or_332_cse);
  assign nor_571_nl = ~(and_dcpl_182 | (~ mux_tmp_120));
  assign mux_tmp_121 = MUX_s_1_2_2(nor_571_nl, mux_tmp_120, or_323_cse);
  assign nor_572_nl = ~(and_dcpl_208 | (~ mux_tmp_121));
  assign mux_tmp_122 = MUX_s_1_2_2(nor_572_nl, mux_tmp_121, or_316_cse);
  assign nor_569_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_122));
  assign mux_123_nl = MUX_s_1_2_2(nor_569_nl, mux_tmp_122, or_311_cse);
  assign and_dcpl_399 = mux_123_nl & and_dcpl_114;
  assign or_343_cse = (result_rem_11cyc_st_4!=4'b0011);
  assign nor_565_nl = ~(and_dcpl_130 | and_dcpl_114);
  assign or_345_nl = (result_rem_11cyc_st_5!=4'b0011) | (~ and_dcpl_105);
  assign mux_tmp_124 = MUX_s_1_2_2(nor_565_nl, or_345_nl, or_343_cse);
  assign nor_566_nl = ~(and_dcpl_156 | (~ mux_tmp_124));
  assign mux_tmp_125 = MUX_s_1_2_2(nor_566_nl, mux_tmp_124, or_332_cse);
  assign nor_567_nl = ~(and_dcpl_182 | (~ mux_tmp_125));
  assign mux_tmp_126 = MUX_s_1_2_2(nor_567_nl, mux_tmp_125, or_323_cse);
  assign nor_568_nl = ~(and_dcpl_208 | (~ mux_tmp_126));
  assign mux_tmp_127 = MUX_s_1_2_2(nor_568_nl, mux_tmp_126, or_316_cse);
  assign nor_564_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_127));
  assign mux_128_nl = MUX_s_1_2_2(nor_564_nl, mux_tmp_127, or_311_cse);
  assign and_dcpl_402 = mux_128_nl & and_dcpl_88;
  assign or_356_cse = (result_rem_11cyc_st_5!=4'b0011);
  assign nor_559_nl = ~(and_dcpl_105 | and_dcpl_88);
  assign or_358_nl = (result_rem_11cyc_st_6!=4'b0011) | (~ and_dcpl_79);
  assign mux_tmp_129 = MUX_s_1_2_2(nor_559_nl, or_358_nl, or_356_cse);
  assign nor_560_nl = ~(and_dcpl_130 | (~ mux_tmp_129));
  assign mux_tmp_130 = MUX_s_1_2_2(nor_560_nl, mux_tmp_129, or_343_cse);
  assign nor_561_nl = ~(and_dcpl_156 | (~ mux_tmp_130));
  assign mux_tmp_131 = MUX_s_1_2_2(nor_561_nl, mux_tmp_130, or_332_cse);
  assign nor_562_nl = ~(and_dcpl_182 | (~ mux_tmp_131));
  assign mux_tmp_132 = MUX_s_1_2_2(nor_562_nl, mux_tmp_131, or_323_cse);
  assign nor_563_nl = ~(and_dcpl_208 | (~ mux_tmp_132));
  assign mux_tmp_133 = MUX_s_1_2_2(nor_563_nl, mux_tmp_132, or_316_cse);
  assign nor_558_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_133));
  assign mux_134_nl = MUX_s_1_2_2(nor_558_nl, mux_tmp_133, or_311_cse);
  assign and_dcpl_405 = mux_134_nl & and_dcpl_62;
  assign or_371_cse = (result_rem_11cyc_st_6!=4'b0011);
  assign nor_552_nl = ~(and_dcpl_79 | and_dcpl_62);
  assign or_373_nl = (result_rem_11cyc_st_7!=4'b0011) | (~ and_dcpl_53);
  assign mux_tmp_135 = MUX_s_1_2_2(nor_552_nl, or_373_nl, or_371_cse);
  assign nor_553_nl = ~(and_dcpl_105 | (~ mux_tmp_135));
  assign mux_tmp_136 = MUX_s_1_2_2(nor_553_nl, mux_tmp_135, or_356_cse);
  assign nor_554_nl = ~(and_dcpl_130 | (~ mux_tmp_136));
  assign mux_tmp_137 = MUX_s_1_2_2(nor_554_nl, mux_tmp_136, or_343_cse);
  assign nor_555_nl = ~(and_dcpl_156 | (~ mux_tmp_137));
  assign mux_tmp_138 = MUX_s_1_2_2(nor_555_nl, mux_tmp_137, or_332_cse);
  assign nor_556_nl = ~(and_dcpl_182 | (~ mux_tmp_138));
  assign mux_tmp_139 = MUX_s_1_2_2(nor_556_nl, mux_tmp_138, or_323_cse);
  assign nor_557_nl = ~(and_dcpl_208 | (~ mux_tmp_139));
  assign mux_tmp_140 = MUX_s_1_2_2(nor_557_nl, mux_tmp_139, or_316_cse);
  assign nor_551_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_140));
  assign mux_141_nl = MUX_s_1_2_2(nor_551_nl, mux_tmp_140, or_311_cse);
  assign and_dcpl_408 = mux_141_nl & and_dcpl_37;
  assign nor_543_nl = ~(and_dcpl_53 | and_dcpl_37);
  assign or_390_nl = (result_rem_11cyc_st_8!=4'b0011) | (~ and_dcpl_28);
  assign or_388_nl = (result_rem_11cyc_st_7!=4'b0011);
  assign mux_tmp_142 = MUX_s_1_2_2(nor_543_nl, or_390_nl, or_388_nl);
  assign nor_544_nl = ~(and_dcpl_79 | (~ mux_tmp_142));
  assign mux_tmp_143 = MUX_s_1_2_2(nor_544_nl, mux_tmp_142, or_371_cse);
  assign nor_545_nl = ~(and_dcpl_105 | (~ mux_tmp_143));
  assign mux_tmp_144 = MUX_s_1_2_2(nor_545_nl, mux_tmp_143, or_356_cse);
  assign nor_546_nl = ~(and_dcpl_130 | (~ mux_tmp_144));
  assign mux_tmp_145 = MUX_s_1_2_2(nor_546_nl, mux_tmp_144, or_343_cse);
  assign nor_547_nl = ~(and_dcpl_156 | (~ mux_tmp_145));
  assign mux_tmp_146 = MUX_s_1_2_2(nor_547_nl, mux_tmp_145, or_332_cse);
  assign nor_548_nl = ~(and_dcpl_182 | (~ mux_tmp_146));
  assign mux_tmp_147 = MUX_s_1_2_2(nor_548_nl, mux_tmp_146, or_323_cse);
  assign nor_549_nl = ~(and_dcpl_208 | (~ mux_tmp_147));
  assign mux_tmp_148 = MUX_s_1_2_2(nor_549_nl, mux_tmp_147, or_316_cse);
  assign nor_550_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_148));
  assign mux_149_nl = MUX_s_1_2_2(nor_550_nl, mux_tmp_148, or_311_cse);
  assign and_dcpl_411 = mux_149_nl & and_dcpl_4 & and_dcpl_11;
  assign and_tmp_27 = ((~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2!=4'b0011))
      & ((~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3!=4'b0011)) &
      ((~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4!=4'b0011)) & ((~
      main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5!=4'b0011)) & ((~ main_stage_0_7)
      | (~ asn_itm_6) | (result_rem_11cyc_st_6!=4'b0011)) & ((~ main_stage_0_8) |
      (~ asn_itm_7) | (result_rem_11cyc_st_7!=4'b0011)) & ((~ main_stage_0_9) | (~
      asn_itm_8) | (result_rem_11cyc_st_8!=4'b0011)) & ((~ main_stage_0_10) | (~
      asn_itm_9) | (result_rem_11cyc_st_9!=4'b0011));
  assign nor_542_nl = ~(and_dcpl_208 | (~ and_tmp_27));
  assign mux_tmp_150 = MUX_s_1_2_2(nor_542_nl, and_tmp_27, or_316_cse);
  assign and_796_nl = (~((result_result_acc_tmp[1:0]==2'b11) & ccs_ccore_start_rsci_idat))
      & mux_tmp_150;
  assign or_399_nl = (result_result_acc_tmp[3:2]!=2'b00);
  assign mux_tmp_151 = MUX_s_1_2_2(and_796_nl, mux_tmp_150, or_399_nl);
  assign and_dcpl_417 = ccs_ccore_start_rsci_idat & (result_result_acc_tmp[3:2]==2'b01);
  assign and_dcpl_418 = and_dcpl_417 & and_dcpl_260;
  assign or_tmp_402 = (result_rem_11cyc!=4'b0100) | (~ and_dcpl_208);
  assign nand_144_cse = ~((result_result_acc_tmp[2]) & ccs_ccore_start_rsci_idat);
  assign or_413_cse = (result_result_acc_tmp[1]) | (result_result_acc_tmp[0]) | (result_result_acc_tmp[3]);
  assign and_795_nl = nand_144_cse & or_tmp_402;
  assign mux_152_nl = MUX_s_1_2_2(and_795_nl, or_tmp_402, or_413_cse);
  assign and_dcpl_422 = mux_152_nl & and_dcpl_194;
  assign or_418_cse = (result_rem_11cyc!=4'b0100);
  assign nor_541_nl = ~(and_dcpl_208 | and_dcpl_194);
  assign or_420_nl = (result_rem_11cyc_st_2!=4'b0100) | (~ and_dcpl_182);
  assign mux_tmp_153 = MUX_s_1_2_2(nor_541_nl, or_420_nl, or_418_cse);
  assign and_794_nl = nand_144_cse & mux_tmp_153;
  assign mux_154_nl = MUX_s_1_2_2(and_794_nl, mux_tmp_153, or_413_cse);
  assign and_dcpl_426 = mux_154_nl & and_dcpl_168;
  assign or_425_cse = (result_rem_11cyc_st_2!=4'b0100);
  assign nor_539_nl = ~(and_dcpl_182 | and_dcpl_168);
  assign or_427_nl = (result_rem_11cyc_st_3!=4'b0100) | (~ and_dcpl_156);
  assign mux_tmp_155 = MUX_s_1_2_2(nor_539_nl, or_427_nl, or_425_cse);
  assign nor_540_nl = ~(and_dcpl_208 | (~ mux_tmp_155));
  assign mux_tmp_156 = MUX_s_1_2_2(nor_540_nl, mux_tmp_155, or_418_cse);
  assign and_793_nl = nand_144_cse & mux_tmp_156;
  assign mux_157_nl = MUX_s_1_2_2(and_793_nl, mux_tmp_156, or_413_cse);
  assign and_dcpl_430 = mux_157_nl & and_dcpl_142;
  assign or_434_cse = (result_rem_11cyc_st_3!=4'b0100);
  assign nor_536_nl = ~(and_dcpl_156 | and_dcpl_142);
  assign or_436_nl = (result_rem_11cyc_st_4!=4'b0100) | (~ and_dcpl_130);
  assign mux_tmp_158 = MUX_s_1_2_2(nor_536_nl, or_436_nl, or_434_cse);
  assign nor_537_nl = ~(and_dcpl_182 | (~ mux_tmp_158));
  assign mux_tmp_159 = MUX_s_1_2_2(nor_537_nl, mux_tmp_158, or_425_cse);
  assign nor_538_nl = ~(and_dcpl_208 | (~ mux_tmp_159));
  assign mux_tmp_160 = MUX_s_1_2_2(nor_538_nl, mux_tmp_159, or_418_cse);
  assign and_792_nl = nand_144_cse & mux_tmp_160;
  assign mux_161_nl = MUX_s_1_2_2(and_792_nl, mux_tmp_160, or_413_cse);
  assign and_dcpl_433 = mux_161_nl & and_dcpl_116;
  assign or_445_cse = (result_rem_11cyc_st_4!=4'b0100);
  assign nor_532_nl = ~(and_dcpl_130 | and_dcpl_116);
  assign or_447_nl = (result_rem_11cyc_st_5[1]) | (result_rem_11cyc_st_5[0]) | (result_rem_11cyc_st_5[3])
      | (~ and_dcpl_115);
  assign mux_tmp_162 = MUX_s_1_2_2(nor_532_nl, or_447_nl, or_445_cse);
  assign nor_533_nl = ~(and_dcpl_156 | (~ mux_tmp_162));
  assign mux_tmp_163 = MUX_s_1_2_2(nor_533_nl, mux_tmp_162, or_434_cse);
  assign nor_534_nl = ~(and_dcpl_182 | (~ mux_tmp_163));
  assign mux_tmp_164 = MUX_s_1_2_2(nor_534_nl, mux_tmp_163, or_425_cse);
  assign nor_535_nl = ~(and_dcpl_208 | (~ mux_tmp_164));
  assign mux_tmp_165 = MUX_s_1_2_2(nor_535_nl, mux_tmp_164, or_418_cse);
  assign and_791_nl = nand_144_cse & mux_tmp_165;
  assign mux_166_nl = MUX_s_1_2_2(and_791_nl, mux_tmp_165, or_413_cse);
  assign and_dcpl_437 = mux_166_nl & and_dcpl_91;
  assign or_458_cse = (result_rem_11cyc_st_5[1]) | (result_rem_11cyc_st_5[0]) | (result_rem_11cyc_st_5[3]);
  assign and_790_cse = (result_rem_11cyc_st_5[2]) & asn_itm_5 & main_stage_0_6;
  assign nor_527_nl = ~(and_790_cse | and_dcpl_91);
  assign or_460_nl = (result_rem_11cyc_st_6!=4'b0100) | (~ and_dcpl_79);
  assign mux_tmp_167 = MUX_s_1_2_2(nor_527_nl, or_460_nl, or_458_cse);
  assign nor_528_nl = ~(and_dcpl_130 | (~ mux_tmp_167));
  assign mux_tmp_168 = MUX_s_1_2_2(nor_528_nl, mux_tmp_167, or_445_cse);
  assign nor_529_nl = ~(and_dcpl_156 | (~ mux_tmp_168));
  assign mux_tmp_169 = MUX_s_1_2_2(nor_529_nl, mux_tmp_168, or_434_cse);
  assign nor_530_nl = ~(and_dcpl_182 | (~ mux_tmp_169));
  assign mux_tmp_170 = MUX_s_1_2_2(nor_530_nl, mux_tmp_169, or_425_cse);
  assign nor_531_nl = ~(and_dcpl_208 | (~ mux_tmp_170));
  assign mux_tmp_171 = MUX_s_1_2_2(nor_531_nl, mux_tmp_170, or_418_cse);
  assign and_789_nl = nand_144_cse & mux_tmp_171;
  assign mux_172_nl = MUX_s_1_2_2(and_789_nl, mux_tmp_171, or_413_cse);
  assign and_dcpl_441 = mux_172_nl & and_dcpl_65;
  assign or_473_cse = (result_rem_11cyc_st_6!=4'b0100);
  assign nor_522_nl = ~(and_dcpl_79 | and_dcpl_65);
  assign or_475_nl = (result_rem_11cyc_st_7!=4'b0100) | (~ and_dcpl_53);
  assign mux_tmp_173 = MUX_s_1_2_2(nor_522_nl, or_475_nl, or_473_cse);
  assign nand_138_cse = ~((result_rem_11cyc_st_5[2]) & asn_itm_5 & main_stage_0_6);
  assign and_788_nl = nand_138_cse & mux_tmp_173;
  assign mux_tmp_174 = MUX_s_1_2_2(and_788_nl, mux_tmp_173, or_458_cse);
  assign nor_523_nl = ~(and_dcpl_130 | (~ mux_tmp_174));
  assign mux_tmp_175 = MUX_s_1_2_2(nor_523_nl, mux_tmp_174, or_445_cse);
  assign nor_524_nl = ~(and_dcpl_156 | (~ mux_tmp_175));
  assign mux_tmp_176 = MUX_s_1_2_2(nor_524_nl, mux_tmp_175, or_434_cse);
  assign nor_525_nl = ~(and_dcpl_182 | (~ mux_tmp_176));
  assign mux_tmp_177 = MUX_s_1_2_2(nor_525_nl, mux_tmp_176, or_425_cse);
  assign nor_526_nl = ~(and_dcpl_208 | (~ mux_tmp_177));
  assign mux_tmp_178 = MUX_s_1_2_2(nor_526_nl, mux_tmp_177, or_418_cse);
  assign and_787_nl = nand_144_cse & mux_tmp_178;
  assign mux_179_nl = MUX_s_1_2_2(and_787_nl, mux_tmp_178, or_413_cse);
  assign and_dcpl_444 = mux_179_nl & and_dcpl_39;
  assign nor_516_nl = ~(and_dcpl_53 | and_dcpl_39);
  assign or_492_nl = (result_rem_11cyc_st_8[0]) | (result_rem_11cyc_st_8[1]) | (result_rem_11cyc_st_8[3])
      | (~ and_dcpl_38);
  assign or_490_nl = (result_rem_11cyc_st_7!=4'b0100);
  assign mux_tmp_180 = MUX_s_1_2_2(nor_516_nl, or_492_nl, or_490_nl);
  assign nor_517_nl = ~(and_dcpl_79 | (~ mux_tmp_180));
  assign mux_tmp_181 = MUX_s_1_2_2(nor_517_nl, mux_tmp_180, or_473_cse);
  assign and_785_nl = nand_138_cse & mux_tmp_181;
  assign mux_tmp_182 = MUX_s_1_2_2(and_785_nl, mux_tmp_181, or_458_cse);
  assign nor_518_nl = ~(and_dcpl_130 | (~ mux_tmp_182));
  assign mux_tmp_183 = MUX_s_1_2_2(nor_518_nl, mux_tmp_182, or_445_cse);
  assign nor_519_nl = ~(and_dcpl_156 | (~ mux_tmp_183));
  assign mux_tmp_184 = MUX_s_1_2_2(nor_519_nl, mux_tmp_183, or_434_cse);
  assign nor_520_nl = ~(and_dcpl_182 | (~ mux_tmp_184));
  assign mux_tmp_185 = MUX_s_1_2_2(nor_520_nl, mux_tmp_184, or_425_cse);
  assign nor_521_nl = ~(and_dcpl_208 | (~ mux_tmp_185));
  assign mux_tmp_186 = MUX_s_1_2_2(nor_521_nl, mux_tmp_185, or_418_cse);
  assign and_786_nl = nand_144_cse & mux_tmp_186;
  assign mux_187_nl = MUX_s_1_2_2(and_786_nl, mux_tmp_186, or_413_cse);
  assign and_dcpl_447 = mux_187_nl & and_dcpl_13 & and_dcpl_2;
  assign and_tmp_34 = ((~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2!=4'b0100))
      & ((~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3!=4'b0100)) &
      ((~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4!=4'b0100)) & ((~
      main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5!=4'b0100)) & ((~ main_stage_0_7)
      | (~ asn_itm_6) | (result_rem_11cyc_st_6!=4'b0100)) & ((~ main_stage_0_8) |
      (~ asn_itm_7) | (result_rem_11cyc_st_7!=4'b0100)) & ((~ main_stage_0_9) | (~
      asn_itm_8) | (result_rem_11cyc_st_8!=4'b0100)) & ((~ main_stage_0_10) | (~
      asn_itm_9) | (result_rem_11cyc_st_9!=4'b0100));
  assign nor_514_nl = ~(and_dcpl_208 | (~ and_tmp_34));
  assign mux_tmp_188 = MUX_s_1_2_2(nor_514_nl, and_tmp_34, or_418_cse);
  assign nor_515_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_188));
  assign or_501_nl = (result_result_acc_tmp!=4'b0100);
  assign mux_tmp_189 = MUX_s_1_2_2(nor_515_nl, mux_tmp_188, or_501_nl);
  assign and_dcpl_452 = and_dcpl_417 & and_dcpl_318;
  assign or_tmp_502 = (result_rem_11cyc!=4'b0101) | (~ and_dcpl_208);
  assign or_516_cse = (result_result_acc_tmp[1]) | (~ (result_result_acc_tmp[0]))
      | (result_result_acc_tmp[3]);
  assign and_784_nl = nand_144_cse & or_tmp_502;
  assign mux_190_nl = MUX_s_1_2_2(and_784_nl, or_tmp_502, or_516_cse);
  assign and_dcpl_455 = mux_190_nl & and_dcpl_196;
  assign or_521_cse = (result_rem_11cyc!=4'b0101);
  assign nor_513_nl = ~(and_dcpl_208 | and_dcpl_196);
  assign or_523_nl = (result_rem_11cyc_st_2!=4'b0101) | (~ and_dcpl_182);
  assign mux_tmp_191 = MUX_s_1_2_2(nor_513_nl, or_523_nl, or_521_cse);
  assign and_783_nl = nand_144_cse & mux_tmp_191;
  assign mux_192_nl = MUX_s_1_2_2(and_783_nl, mux_tmp_191, or_516_cse);
  assign and_dcpl_458 = mux_192_nl & and_dcpl_170;
  assign or_528_cse = (result_rem_11cyc_st_2!=4'b0101);
  assign nor_511_nl = ~(and_dcpl_182 | and_dcpl_170);
  assign or_530_nl = (result_rem_11cyc_st_3!=4'b0101) | (~ and_dcpl_156);
  assign mux_tmp_193 = MUX_s_1_2_2(nor_511_nl, or_530_nl, or_528_cse);
  assign nor_512_nl = ~(and_dcpl_208 | (~ mux_tmp_193));
  assign mux_tmp_194 = MUX_s_1_2_2(nor_512_nl, mux_tmp_193, or_521_cse);
  assign and_782_nl = nand_144_cse & mux_tmp_194;
  assign mux_195_nl = MUX_s_1_2_2(and_782_nl, mux_tmp_194, or_516_cse);
  assign and_dcpl_462 = mux_195_nl & and_dcpl_145;
  assign or_537_cse = (result_rem_11cyc_st_3!=4'b0101);
  assign nor_508_nl = ~(and_dcpl_156 | and_dcpl_145);
  assign or_539_nl = (result_rem_11cyc_st_4!=4'b0101) | (~ and_dcpl_130);
  assign mux_tmp_196 = MUX_s_1_2_2(nor_508_nl, or_539_nl, or_537_cse);
  assign nor_509_nl = ~(and_dcpl_182 | (~ mux_tmp_196));
  assign mux_tmp_197 = MUX_s_1_2_2(nor_509_nl, mux_tmp_196, or_528_cse);
  assign nor_510_nl = ~(and_dcpl_208 | (~ mux_tmp_197));
  assign mux_tmp_198 = MUX_s_1_2_2(nor_510_nl, mux_tmp_197, or_521_cse);
  assign and_781_nl = nand_144_cse & mux_tmp_198;
  assign mux_199_nl = MUX_s_1_2_2(and_781_nl, mux_tmp_198, or_516_cse);
  assign and_dcpl_464 = mux_199_nl & and_dcpl_117;
  assign or_548_cse = (result_rem_11cyc_st_4!=4'b0101);
  assign nor_504_nl = ~(and_dcpl_130 | and_dcpl_117);
  assign or_550_nl = (result_rem_11cyc_st_5[1]) | (~ (result_rem_11cyc_st_5[0]))
      | (result_rem_11cyc_st_5[3]) | (~ and_dcpl_115);
  assign mux_tmp_200 = MUX_s_1_2_2(nor_504_nl, or_550_nl, or_548_cse);
  assign nor_505_nl = ~(and_dcpl_156 | (~ mux_tmp_200));
  assign mux_tmp_201 = MUX_s_1_2_2(nor_505_nl, mux_tmp_200, or_537_cse);
  assign nor_506_nl = ~(and_dcpl_182 | (~ mux_tmp_201));
  assign mux_tmp_202 = MUX_s_1_2_2(nor_506_nl, mux_tmp_201, or_528_cse);
  assign nor_507_nl = ~(and_dcpl_208 | (~ mux_tmp_202));
  assign mux_tmp_203 = MUX_s_1_2_2(nor_507_nl, mux_tmp_202, or_521_cse);
  assign and_780_nl = nand_144_cse & mux_tmp_203;
  assign mux_204_nl = MUX_s_1_2_2(and_780_nl, mux_tmp_203, or_516_cse);
  assign and_dcpl_468 = mux_204_nl & and_dcpl_94;
  assign or_561_cse = (result_rem_11cyc_st_5[1]) | (~ (result_rem_11cyc_st_5[0]))
      | (result_rem_11cyc_st_5[3]);
  assign nor_499_nl = ~(and_790_cse | and_dcpl_94);
  assign or_563_nl = (result_rem_11cyc_st_6!=4'b0101) | (~ and_dcpl_79);
  assign mux_tmp_205 = MUX_s_1_2_2(nor_499_nl, or_563_nl, or_561_cse);
  assign nor_500_nl = ~(and_dcpl_130 | (~ mux_tmp_205));
  assign mux_tmp_206 = MUX_s_1_2_2(nor_500_nl, mux_tmp_205, or_548_cse);
  assign nor_501_nl = ~(and_dcpl_156 | (~ mux_tmp_206));
  assign mux_tmp_207 = MUX_s_1_2_2(nor_501_nl, mux_tmp_206, or_537_cse);
  assign nor_502_nl = ~(and_dcpl_182 | (~ mux_tmp_207));
  assign mux_tmp_208 = MUX_s_1_2_2(nor_502_nl, mux_tmp_207, or_528_cse);
  assign nor_503_nl = ~(and_dcpl_208 | (~ mux_tmp_208));
  assign mux_tmp_209 = MUX_s_1_2_2(nor_503_nl, mux_tmp_208, or_521_cse);
  assign and_778_nl = nand_144_cse & mux_tmp_209;
  assign mux_210_nl = MUX_s_1_2_2(and_778_nl, mux_tmp_209, or_516_cse);
  assign and_dcpl_472 = mux_210_nl & and_dcpl_68;
  assign or_576_cse = (result_rem_11cyc_st_6!=4'b0101);
  assign nor_494_nl = ~(and_dcpl_79 | and_dcpl_68);
  assign or_578_nl = (result_rem_11cyc_st_7!=4'b0101) | (~ and_dcpl_53);
  assign mux_tmp_211 = MUX_s_1_2_2(nor_494_nl, or_578_nl, or_576_cse);
  assign and_777_nl = nand_138_cse & mux_tmp_211;
  assign mux_tmp_212 = MUX_s_1_2_2(and_777_nl, mux_tmp_211, or_561_cse);
  assign nor_495_nl = ~(and_dcpl_130 | (~ mux_tmp_212));
  assign mux_tmp_213 = MUX_s_1_2_2(nor_495_nl, mux_tmp_212, or_548_cse);
  assign nor_496_nl = ~(and_dcpl_156 | (~ mux_tmp_213));
  assign mux_tmp_214 = MUX_s_1_2_2(nor_496_nl, mux_tmp_213, or_537_cse);
  assign nor_497_nl = ~(and_dcpl_182 | (~ mux_tmp_214));
  assign mux_tmp_215 = MUX_s_1_2_2(nor_497_nl, mux_tmp_214, or_528_cse);
  assign nor_498_nl = ~(and_dcpl_208 | (~ mux_tmp_215));
  assign mux_tmp_216 = MUX_s_1_2_2(nor_498_nl, mux_tmp_215, or_521_cse);
  assign and_776_nl = nand_144_cse & mux_tmp_216;
  assign mux_217_nl = MUX_s_1_2_2(and_776_nl, mux_tmp_216, or_516_cse);
  assign and_dcpl_474 = mux_217_nl & and_dcpl_40;
  assign nor_488_nl = ~(and_dcpl_53 | and_dcpl_40);
  assign or_595_nl = (~ (result_rem_11cyc_st_8[0])) | (result_rem_11cyc_st_8[1])
      | (result_rem_11cyc_st_8[3]) | (~ and_dcpl_38);
  assign or_593_nl = (result_rem_11cyc_st_7!=4'b0101);
  assign mux_tmp_218 = MUX_s_1_2_2(nor_488_nl, or_595_nl, or_593_nl);
  assign nor_489_nl = ~(and_dcpl_79 | (~ mux_tmp_218));
  assign mux_tmp_219 = MUX_s_1_2_2(nor_489_nl, mux_tmp_218, or_576_cse);
  assign and_774_nl = nand_138_cse & mux_tmp_219;
  assign mux_tmp_220 = MUX_s_1_2_2(and_774_nl, mux_tmp_219, or_561_cse);
  assign nor_490_nl = ~(and_dcpl_130 | (~ mux_tmp_220));
  assign mux_tmp_221 = MUX_s_1_2_2(nor_490_nl, mux_tmp_220, or_548_cse);
  assign nor_491_nl = ~(and_dcpl_156 | (~ mux_tmp_221));
  assign mux_tmp_222 = MUX_s_1_2_2(nor_491_nl, mux_tmp_221, or_537_cse);
  assign nor_492_nl = ~(and_dcpl_182 | (~ mux_tmp_222));
  assign mux_tmp_223 = MUX_s_1_2_2(nor_492_nl, mux_tmp_222, or_528_cse);
  assign nor_493_nl = ~(and_dcpl_208 | (~ mux_tmp_223));
  assign mux_tmp_224 = MUX_s_1_2_2(nor_493_nl, mux_tmp_223, or_521_cse);
  assign and_775_nl = nand_144_cse & mux_tmp_224;
  assign mux_225_nl = MUX_s_1_2_2(and_775_nl, mux_tmp_224, or_516_cse);
  assign and_dcpl_476 = mux_225_nl & and_dcpl_13 & and_dcpl_6;
  assign and_tmp_41 = ((~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2!=4'b0101))
      & ((~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3!=4'b0101)) &
      ((~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4!=4'b0101)) & ((~
      main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5!=4'b0101)) & ((~ main_stage_0_7)
      | (~ asn_itm_6) | (result_rem_11cyc_st_6!=4'b0101)) & ((~ main_stage_0_8) |
      (~ asn_itm_7) | (result_rem_11cyc_st_7!=4'b0101)) & ((~ main_stage_0_9) | (~
      asn_itm_8) | (result_rem_11cyc_st_8!=4'b0101)) & ((~ main_stage_0_10) | (~
      asn_itm_9) | (result_rem_11cyc_st_9!=4'b0101));
  assign nor_487_nl = ~(and_dcpl_208 | (~ and_tmp_41));
  assign mux_tmp_226 = MUX_s_1_2_2(nor_487_nl, and_tmp_41, or_521_cse);
  assign and_773_nl = nand_146_cse & mux_tmp_226;
  assign or_604_nl = (result_result_acc_tmp[3:1]!=3'b010);
  assign mux_tmp_227 = MUX_s_1_2_2(and_773_nl, mux_tmp_226, or_604_nl);
  assign and_dcpl_480 = and_dcpl_417 & and_dcpl_352;
  assign or_tmp_602 = (result_rem_11cyc!=4'b0110) | (~ and_dcpl_208);
  assign or_617_cse = (~ (result_result_acc_tmp[1])) | (result_result_acc_tmp[0])
      | (result_result_acc_tmp[3]);
  assign and_772_nl = nand_144_cse & or_tmp_602;
  assign mux_228_nl = MUX_s_1_2_2(and_772_nl, or_tmp_602, or_617_cse);
  assign and_dcpl_484 = mux_228_nl & and_dcpl_199;
  assign or_622_cse = (result_rem_11cyc!=4'b0110);
  assign nor_486_nl = ~(and_dcpl_208 | and_dcpl_199);
  assign or_624_nl = (result_rem_11cyc_st_2!=4'b0110) | (~ and_dcpl_182);
  assign mux_tmp_229 = MUX_s_1_2_2(nor_486_nl, or_624_nl, or_622_cse);
  assign and_771_nl = nand_144_cse & mux_tmp_229;
  assign mux_230_nl = MUX_s_1_2_2(and_771_nl, mux_tmp_229, or_617_cse);
  assign and_dcpl_488 = mux_230_nl & and_dcpl_173;
  assign or_629_cse = (result_rem_11cyc_st_2!=4'b0110);
  assign nor_484_nl = ~(and_dcpl_182 | and_dcpl_173);
  assign or_631_nl = (result_rem_11cyc_st_3!=4'b0110) | (~ and_dcpl_156);
  assign mux_tmp_231 = MUX_s_1_2_2(nor_484_nl, or_631_nl, or_629_cse);
  assign nor_485_nl = ~(and_dcpl_208 | (~ mux_tmp_231));
  assign mux_tmp_232 = MUX_s_1_2_2(nor_485_nl, mux_tmp_231, or_622_cse);
  assign and_770_nl = nand_144_cse & mux_tmp_232;
  assign mux_233_nl = MUX_s_1_2_2(and_770_nl, mux_tmp_232, or_617_cse);
  assign and_dcpl_491 = mux_233_nl & and_dcpl_147;
  assign or_638_cse = (result_rem_11cyc_st_3!=4'b0110);
  assign nor_481_nl = ~(and_dcpl_156 | and_dcpl_147);
  assign or_640_nl = (result_rem_11cyc_st_4!=4'b0110) | (~ and_dcpl_130);
  assign mux_tmp_234 = MUX_s_1_2_2(nor_481_nl, or_640_nl, or_638_cse);
  assign nor_482_nl = ~(and_dcpl_182 | (~ mux_tmp_234));
  assign mux_tmp_235 = MUX_s_1_2_2(nor_482_nl, mux_tmp_234, or_629_cse);
  assign nor_483_nl = ~(and_dcpl_208 | (~ mux_tmp_235));
  assign mux_tmp_236 = MUX_s_1_2_2(nor_483_nl, mux_tmp_235, or_622_cse);
  assign and_769_nl = nand_144_cse & mux_tmp_236;
  assign mux_237_nl = MUX_s_1_2_2(and_769_nl, mux_tmp_236, or_617_cse);
  assign and_dcpl_493 = mux_237_nl & and_dcpl_118;
  assign or_649_cse = (result_rem_11cyc_st_4!=4'b0110);
  assign nor_477_nl = ~(and_dcpl_130 | and_dcpl_118);
  assign or_651_nl = (~ (result_rem_11cyc_st_5[1])) | (result_rem_11cyc_st_5[0])
      | (result_rem_11cyc_st_5[3]) | (~ and_dcpl_115);
  assign mux_tmp_238 = MUX_s_1_2_2(nor_477_nl, or_651_nl, or_649_cse);
  assign nor_478_nl = ~(and_dcpl_156 | (~ mux_tmp_238));
  assign mux_tmp_239 = MUX_s_1_2_2(nor_478_nl, mux_tmp_238, or_638_cse);
  assign nor_479_nl = ~(and_dcpl_182 | (~ mux_tmp_239));
  assign mux_tmp_240 = MUX_s_1_2_2(nor_479_nl, mux_tmp_239, or_629_cse);
  assign nor_480_nl = ~(and_dcpl_208 | (~ mux_tmp_240));
  assign mux_tmp_241 = MUX_s_1_2_2(nor_480_nl, mux_tmp_240, or_622_cse);
  assign and_768_nl = nand_144_cse & mux_tmp_241;
  assign mux_242_nl = MUX_s_1_2_2(and_768_nl, mux_tmp_241, or_617_cse);
  assign and_dcpl_496 = mux_242_nl & and_dcpl_96;
  assign or_662_cse = (~ (result_rem_11cyc_st_5[1])) | (result_rem_11cyc_st_5[0])
      | (result_rem_11cyc_st_5[3]);
  assign nor_472_nl = ~(and_790_cse | and_dcpl_96);
  assign or_664_nl = (result_rem_11cyc_st_6!=4'b0110) | (~ and_dcpl_79);
  assign mux_tmp_243 = MUX_s_1_2_2(nor_472_nl, or_664_nl, or_662_cse);
  assign nor_473_nl = ~(and_dcpl_130 | (~ mux_tmp_243));
  assign mux_tmp_244 = MUX_s_1_2_2(nor_473_nl, mux_tmp_243, or_649_cse);
  assign nor_474_nl = ~(and_dcpl_156 | (~ mux_tmp_244));
  assign mux_tmp_245 = MUX_s_1_2_2(nor_474_nl, mux_tmp_244, or_638_cse);
  assign nor_475_nl = ~(and_dcpl_182 | (~ mux_tmp_245));
  assign mux_tmp_246 = MUX_s_1_2_2(nor_475_nl, mux_tmp_245, or_629_cse);
  assign nor_476_nl = ~(and_dcpl_208 | (~ mux_tmp_246));
  assign mux_tmp_247 = MUX_s_1_2_2(nor_476_nl, mux_tmp_246, or_622_cse);
  assign and_766_nl = nand_144_cse & mux_tmp_247;
  assign mux_248_nl = MUX_s_1_2_2(and_766_nl, mux_tmp_247, or_617_cse);
  assign and_dcpl_499 = mux_248_nl & and_dcpl_70;
  assign or_677_cse = (result_rem_11cyc_st_6!=4'b0110);
  assign nor_467_nl = ~(and_dcpl_79 | and_dcpl_70);
  assign or_679_nl = (result_rem_11cyc_st_7!=4'b0110) | (~ and_dcpl_53);
  assign mux_tmp_249 = MUX_s_1_2_2(nor_467_nl, or_679_nl, or_677_cse);
  assign and_765_nl = nand_138_cse & mux_tmp_249;
  assign mux_tmp_250 = MUX_s_1_2_2(and_765_nl, mux_tmp_249, or_662_cse);
  assign nor_468_nl = ~(and_dcpl_130 | (~ mux_tmp_250));
  assign mux_tmp_251 = MUX_s_1_2_2(nor_468_nl, mux_tmp_250, or_649_cse);
  assign nor_469_nl = ~(and_dcpl_156 | (~ mux_tmp_251));
  assign mux_tmp_252 = MUX_s_1_2_2(nor_469_nl, mux_tmp_251, or_638_cse);
  assign nor_470_nl = ~(and_dcpl_182 | (~ mux_tmp_252));
  assign mux_tmp_253 = MUX_s_1_2_2(nor_470_nl, mux_tmp_252, or_629_cse);
  assign nor_471_nl = ~(and_dcpl_208 | (~ mux_tmp_253));
  assign mux_tmp_254 = MUX_s_1_2_2(nor_471_nl, mux_tmp_253, or_622_cse);
  assign and_764_nl = nand_144_cse & mux_tmp_254;
  assign mux_255_nl = MUX_s_1_2_2(and_764_nl, mux_tmp_254, or_617_cse);
  assign and_dcpl_501 = mux_255_nl & and_dcpl_41;
  assign nor_461_nl = ~(and_dcpl_53 | and_dcpl_41);
  assign or_696_nl = (result_rem_11cyc_st_8[0]) | (~ (result_rem_11cyc_st_8[1]))
      | (result_rem_11cyc_st_8[3]) | (~ and_dcpl_38);
  assign or_694_nl = (result_rem_11cyc_st_7!=4'b0110);
  assign mux_tmp_256 = MUX_s_1_2_2(nor_461_nl, or_696_nl, or_694_nl);
  assign nor_462_nl = ~(and_dcpl_79 | (~ mux_tmp_256));
  assign mux_tmp_257 = MUX_s_1_2_2(nor_462_nl, mux_tmp_256, or_677_cse);
  assign and_762_nl = nand_138_cse & mux_tmp_257;
  assign mux_tmp_258 = MUX_s_1_2_2(and_762_nl, mux_tmp_257, or_662_cse);
  assign nor_463_nl = ~(and_dcpl_130 | (~ mux_tmp_258));
  assign mux_tmp_259 = MUX_s_1_2_2(nor_463_nl, mux_tmp_258, or_649_cse);
  assign nor_464_nl = ~(and_dcpl_156 | (~ mux_tmp_259));
  assign mux_tmp_260 = MUX_s_1_2_2(nor_464_nl, mux_tmp_259, or_638_cse);
  assign nor_465_nl = ~(and_dcpl_182 | (~ mux_tmp_260));
  assign mux_tmp_261 = MUX_s_1_2_2(nor_465_nl, mux_tmp_260, or_629_cse);
  assign nor_466_nl = ~(and_dcpl_208 | (~ mux_tmp_261));
  assign mux_tmp_262 = MUX_s_1_2_2(nor_466_nl, mux_tmp_261, or_622_cse);
  assign and_763_nl = nand_144_cse & mux_tmp_262;
  assign mux_263_nl = MUX_s_1_2_2(and_763_nl, mux_tmp_262, or_617_cse);
  assign and_dcpl_503 = mux_263_nl & and_dcpl_13 & and_dcpl_9;
  assign and_tmp_48 = ((~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2!=4'b0110))
      & ((~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3!=4'b0110)) &
      ((~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4!=4'b0110)) & ((~
      main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5!=4'b0110)) & ((~ main_stage_0_7)
      | (~ asn_itm_6) | (result_rem_11cyc_st_6!=4'b0110)) & ((~ main_stage_0_8) |
      (~ asn_itm_7) | (result_rem_11cyc_st_7!=4'b0110)) & ((~ main_stage_0_9) | (~
      asn_itm_8) | (result_rem_11cyc_st_8!=4'b0110)) & ((~ main_stage_0_10) | (~
      asn_itm_9) | (result_rem_11cyc_st_9!=4'b0110));
  assign nor_459_nl = ~(and_dcpl_208 | (~ and_tmp_48));
  assign mux_tmp_264 = MUX_s_1_2_2(nor_459_nl, and_tmp_48, or_622_cse);
  assign nor_460_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_264));
  assign or_705_nl = (result_result_acc_tmp!=4'b0110);
  assign mux_tmp_265 = MUX_s_1_2_2(nor_460_nl, mux_tmp_264, or_705_nl);
  assign and_dcpl_507 = and_dcpl_417 & and_dcpl_386;
  assign or_tmp_702 = ~((result_rem_11cyc==4'b0111) & and_dcpl_208);
  assign or_718_cse = (~ (result_result_acc_tmp[1])) | (~ (result_result_acc_tmp[0]))
      | (result_result_acc_tmp[3]);
  assign and_761_nl = nand_144_cse & or_tmp_702;
  assign mux_266_nl = MUX_s_1_2_2(and_761_nl, or_tmp_702, or_718_cse);
  assign and_dcpl_510 = mux_266_nl & and_dcpl_201;
  assign nand_112_cse = ~((result_rem_11cyc==4'b0111));
  assign nor_458_nl = ~(and_dcpl_208 | and_dcpl_201);
  assign nand_153_nl = ~((result_rem_11cyc_st_2==4'b0111) & and_dcpl_182);
  assign mux_tmp_267 = MUX_s_1_2_2(nor_458_nl, nand_153_nl, nand_112_cse);
  assign and_760_nl = nand_144_cse & mux_tmp_267;
  assign mux_268_nl = MUX_s_1_2_2(and_760_nl, mux_tmp_267, or_718_cse);
  assign and_dcpl_513 = mux_268_nl & and_dcpl_175;
  assign nand_108_cse = ~((result_rem_11cyc_st_2==4'b0111));
  assign nor_456_nl = ~(and_dcpl_182 | and_dcpl_175);
  assign nand_152_nl = ~((result_rem_11cyc_st_3==4'b0111) & and_dcpl_156);
  assign mux_tmp_269 = MUX_s_1_2_2(nor_456_nl, nand_152_nl, nand_108_cse);
  assign nor_457_nl = ~(and_dcpl_208 | (~ mux_tmp_269));
  assign mux_tmp_270 = MUX_s_1_2_2(nor_457_nl, mux_tmp_269, nand_112_cse);
  assign and_759_nl = nand_144_cse & mux_tmp_270;
  assign mux_271_nl = MUX_s_1_2_2(and_759_nl, mux_tmp_270, or_718_cse);
  assign and_dcpl_516 = mux_271_nl & and_dcpl_149;
  assign nand_103_cse = ~((result_rem_11cyc_st_3==4'b0111));
  assign nor_453_nl = ~(and_dcpl_156 | and_dcpl_149);
  assign nand_151_nl = ~((result_rem_11cyc_st_4==4'b0111) & and_dcpl_130);
  assign mux_tmp_272 = MUX_s_1_2_2(nor_453_nl, nand_151_nl, nand_103_cse);
  assign nor_454_nl = ~(and_dcpl_182 | (~ mux_tmp_272));
  assign mux_tmp_273 = MUX_s_1_2_2(nor_454_nl, mux_tmp_272, nand_108_cse);
  assign nor_455_nl = ~(and_dcpl_208 | (~ mux_tmp_273));
  assign mux_tmp_274 = MUX_s_1_2_2(nor_455_nl, mux_tmp_273, nand_112_cse);
  assign and_758_nl = nand_144_cse & mux_tmp_274;
  assign mux_275_nl = MUX_s_1_2_2(and_758_nl, mux_tmp_274, or_718_cse);
  assign and_dcpl_518 = mux_275_nl & and_dcpl_119;
  assign nand_97_cse = ~((result_rem_11cyc_st_4==4'b0111));
  assign nor_449_nl = ~(and_dcpl_130 | and_dcpl_119);
  assign nand_96_nl = ~((result_rem_11cyc_st_5[1]) & (result_rem_11cyc_st_5[0]) &
      (~ (result_rem_11cyc_st_5[3])) & and_dcpl_115);
  assign mux_tmp_276 = MUX_s_1_2_2(nor_449_nl, nand_96_nl, nand_97_cse);
  assign nor_450_nl = ~(and_dcpl_156 | (~ mux_tmp_276));
  assign mux_tmp_277 = MUX_s_1_2_2(nor_450_nl, mux_tmp_276, nand_103_cse);
  assign nor_451_nl = ~(and_dcpl_182 | (~ mux_tmp_277));
  assign mux_tmp_278 = MUX_s_1_2_2(nor_451_nl, mux_tmp_277, nand_108_cse);
  assign nor_452_nl = ~(and_dcpl_208 | (~ mux_tmp_278));
  assign mux_tmp_279 = MUX_s_1_2_2(nor_452_nl, mux_tmp_278, nand_112_cse);
  assign and_757_nl = nand_144_cse & mux_tmp_279;
  assign mux_280_nl = MUX_s_1_2_2(and_757_nl, mux_tmp_279, or_718_cse);
  assign and_dcpl_521 = mux_280_nl & and_dcpl_98;
  assign or_763_cse = (~ (result_rem_11cyc_st_5[1])) | (~ (result_rem_11cyc_st_5[0]))
      | (result_rem_11cyc_st_5[3]);
  assign nor_444_nl = ~(and_790_cse | and_dcpl_98);
  assign nand_150_nl = ~((result_rem_11cyc_st_6==4'b0111) & and_dcpl_79);
  assign mux_tmp_281 = MUX_s_1_2_2(nor_444_nl, nand_150_nl, or_763_cse);
  assign nor_445_nl = ~(and_dcpl_130 | (~ mux_tmp_281));
  assign mux_tmp_282 = MUX_s_1_2_2(nor_445_nl, mux_tmp_281, nand_97_cse);
  assign nor_446_nl = ~(and_dcpl_156 | (~ mux_tmp_282));
  assign mux_tmp_283 = MUX_s_1_2_2(nor_446_nl, mux_tmp_282, nand_103_cse);
  assign nor_447_nl = ~(and_dcpl_182 | (~ mux_tmp_283));
  assign mux_tmp_284 = MUX_s_1_2_2(nor_447_nl, mux_tmp_283, nand_108_cse);
  assign nor_448_nl = ~(and_dcpl_208 | (~ mux_tmp_284));
  assign mux_tmp_285 = MUX_s_1_2_2(nor_448_nl, mux_tmp_284, nand_112_cse);
  assign and_755_nl = nand_144_cse & mux_tmp_285;
  assign mux_286_nl = MUX_s_1_2_2(and_755_nl, mux_tmp_285, or_718_cse);
  assign and_dcpl_524 = mux_286_nl & and_dcpl_72;
  assign nand_83_cse = ~((result_rem_11cyc_st_6==4'b0111));
  assign nor_439_nl = ~(and_dcpl_79 | and_dcpl_72);
  assign nand_149_nl = ~((result_rem_11cyc_st_7==4'b0111) & and_dcpl_53);
  assign mux_tmp_287 = MUX_s_1_2_2(nor_439_nl, nand_149_nl, nand_83_cse);
  assign and_754_nl = nand_138_cse & mux_tmp_287;
  assign mux_tmp_288 = MUX_s_1_2_2(and_754_nl, mux_tmp_287, or_763_cse);
  assign nor_440_nl = ~(and_dcpl_130 | (~ mux_tmp_288));
  assign mux_tmp_289 = MUX_s_1_2_2(nor_440_nl, mux_tmp_288, nand_97_cse);
  assign nor_441_nl = ~(and_dcpl_156 | (~ mux_tmp_289));
  assign mux_tmp_290 = MUX_s_1_2_2(nor_441_nl, mux_tmp_289, nand_103_cse);
  assign nor_442_nl = ~(and_dcpl_182 | (~ mux_tmp_290));
  assign mux_tmp_291 = MUX_s_1_2_2(nor_442_nl, mux_tmp_290, nand_108_cse);
  assign nor_443_nl = ~(and_dcpl_208 | (~ mux_tmp_291));
  assign mux_tmp_292 = MUX_s_1_2_2(nor_443_nl, mux_tmp_291, nand_112_cse);
  assign and_753_nl = nand_144_cse & mux_tmp_292;
  assign mux_293_nl = MUX_s_1_2_2(and_753_nl, mux_tmp_292, or_718_cse);
  assign and_dcpl_526 = mux_293_nl & and_dcpl_42;
  assign nor_433_nl = ~(and_dcpl_53 | and_dcpl_42);
  assign nand_72_nl = ~((result_rem_11cyc_st_8[0]) & (result_rem_11cyc_st_8[1]) &
      (~ (result_rem_11cyc_st_8[3])) & and_dcpl_38);
  assign nand_73_nl = ~((result_rem_11cyc_st_7==4'b0111));
  assign mux_tmp_294 = MUX_s_1_2_2(nor_433_nl, nand_72_nl, nand_73_nl);
  assign nor_434_nl = ~(and_dcpl_79 | (~ mux_tmp_294));
  assign mux_tmp_295 = MUX_s_1_2_2(nor_434_nl, mux_tmp_294, nand_83_cse);
  assign and_751_nl = nand_138_cse & mux_tmp_295;
  assign mux_tmp_296 = MUX_s_1_2_2(and_751_nl, mux_tmp_295, or_763_cse);
  assign nor_435_nl = ~(and_dcpl_130 | (~ mux_tmp_296));
  assign mux_tmp_297 = MUX_s_1_2_2(nor_435_nl, mux_tmp_296, nand_97_cse);
  assign nor_436_nl = ~(and_dcpl_156 | (~ mux_tmp_297));
  assign mux_tmp_298 = MUX_s_1_2_2(nor_436_nl, mux_tmp_297, nand_103_cse);
  assign nor_437_nl = ~(and_dcpl_182 | (~ mux_tmp_298));
  assign mux_tmp_299 = MUX_s_1_2_2(nor_437_nl, mux_tmp_298, nand_108_cse);
  assign nor_438_nl = ~(and_dcpl_208 | (~ mux_tmp_299));
  assign mux_tmp_300 = MUX_s_1_2_2(nor_438_nl, mux_tmp_299, nand_112_cse);
  assign and_752_nl = nand_144_cse & mux_tmp_300;
  assign mux_301_nl = MUX_s_1_2_2(and_752_nl, mux_tmp_300, or_718_cse);
  assign and_dcpl_528 = mux_301_nl & and_dcpl_13 & and_dcpl_11;
  assign and_tmp_55 = (~(main_stage_0_3 & asn_itm_2 & (result_rem_11cyc_st_2==4'b0111)))
      & (~(main_stage_0_4 & asn_itm_3 & (result_rem_11cyc_st_3==4'b0111))) & (~(main_stage_0_5
      & asn_itm_4 & (result_rem_11cyc_st_4==4'b0111))) & (~(main_stage_0_6 & asn_itm_5
      & (result_rem_11cyc_st_5==4'b0111))) & (~(main_stage_0_7 & asn_itm_6 & (result_rem_11cyc_st_6==4'b0111)))
      & (~(main_stage_0_8 & asn_itm_7 & (result_rem_11cyc_st_7==4'b0111))) & (~(main_stage_0_9
      & asn_itm_8 & (result_rem_11cyc_st_8==4'b0111))) & (~(main_stage_0_10 & asn_itm_9
      & (result_rem_11cyc_st_9==4'b0111)));
  assign nor_432_nl = ~(and_dcpl_208 | (~ and_tmp_55));
  assign mux_tmp_302 = MUX_s_1_2_2(nor_432_nl, and_tmp_55, nand_112_cse);
  assign and_750_nl = (~((result_result_acc_tmp[2:0]==3'b111) & ccs_ccore_start_rsci_idat))
      & mux_tmp_302;
  assign mux_tmp_303 = MUX_s_1_2_2(and_750_nl, mux_tmp_302, result_result_acc_tmp[3]);
  assign and_dcpl_532 = and_dcpl_261 & (result_result_acc_tmp[3]);
  assign and_dcpl_533 = and_dcpl_532 & and_dcpl_260;
  assign not_tmp_645 = ~((result_rem_11cyc[3]) & asn_itm_1 & main_stage_0_2);
  assign or_tmp_801 = (result_rem_11cyc[2:0]!=3'b000) | not_tmp_645;
  assign or_818_cse = (result_result_acc_tmp!=4'b1000);
  assign nor_431_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_801));
  assign mux_304_nl = MUX_s_1_2_2(nor_431_nl, or_tmp_801, or_818_cse);
  assign and_dcpl_536 = mux_304_nl & and_dcpl_203;
  assign or_823_cse = (result_rem_11cyc[2:0]!=3'b000);
  assign and_749_cse = (result_rem_11cyc[3]) & asn_itm_1 & main_stage_0_2;
  assign nor_430_nl = ~(and_749_cse | and_dcpl_203);
  assign or_825_nl = (result_rem_11cyc_st_2[2:0]!=3'b000) | (~ and_dcpl_202);
  assign mux_tmp_305 = MUX_s_1_2_2(nor_430_nl, or_825_nl, or_823_cse);
  assign nor_429_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_305));
  assign mux_306_nl = MUX_s_1_2_2(nor_429_nl, mux_tmp_305, or_818_cse);
  assign and_dcpl_539 = mux_306_nl & and_dcpl_177;
  assign or_830_cse = (result_rem_11cyc_st_2[2:0]!=3'b000);
  assign and_747_cse = (result_rem_11cyc_st_2[3]) & asn_itm_2 & main_stage_0_3;
  assign nor_428_nl = ~(and_747_cse | and_dcpl_177);
  assign or_832_nl = (result_rem_11cyc_st_3[2:0]!=3'b000) | (~ and_dcpl_176);
  assign mux_tmp_307 = MUX_s_1_2_2(nor_428_nl, or_832_nl, or_830_cse);
  assign and_748_nl = not_tmp_645 & mux_tmp_307;
  assign mux_tmp_308 = MUX_s_1_2_2(and_748_nl, mux_tmp_307, or_823_cse);
  assign nor_427_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_308));
  assign mux_309_nl = MUX_s_1_2_2(nor_427_nl, mux_tmp_308, or_818_cse);
  assign and_dcpl_542 = mux_309_nl & and_dcpl_151;
  assign or_839_cse = (result_rem_11cyc_st_3[2:0]!=3'b000);
  assign and_744_cse = (result_rem_11cyc_st_3[3]) & asn_itm_3 & main_stage_0_4;
  assign nor_426_nl = ~(and_744_cse | and_dcpl_151);
  assign or_841_nl = (result_rem_11cyc_st_4[2:0]!=3'b000) | (~ and_dcpl_150);
  assign mux_tmp_310 = MUX_s_1_2_2(nor_426_nl, or_841_nl, or_839_cse);
  assign nand_58_cse = ~((result_rem_11cyc_st_2[3]) & asn_itm_2 & main_stage_0_3);
  assign and_745_nl = nand_58_cse & mux_tmp_310;
  assign mux_tmp_311 = MUX_s_1_2_2(and_745_nl, mux_tmp_310, or_830_cse);
  assign and_746_nl = not_tmp_645 & mux_tmp_311;
  assign mux_tmp_312 = MUX_s_1_2_2(and_746_nl, mux_tmp_311, or_823_cse);
  assign nor_425_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_312));
  assign mux_313_nl = MUX_s_1_2_2(nor_425_nl, mux_tmp_312, or_818_cse);
  assign and_dcpl_546 = mux_313_nl & and_dcpl_122;
  assign or_850_cse = (result_rem_11cyc_st_4[2:0]!=3'b000);
  assign and_740_cse = (result_rem_11cyc_st_4[3]) & asn_itm_4 & main_stage_0_5;
  assign nor_424_nl = ~(and_740_cse | and_dcpl_122);
  assign or_852_nl = (result_rem_11cyc_st_5!=4'b1000) | (~ and_dcpl_105);
  assign mux_tmp_314 = MUX_s_1_2_2(nor_424_nl, or_852_nl, or_850_cse);
  assign nand_55_cse = ~((result_rem_11cyc_st_3[3]) & asn_itm_3 & main_stage_0_4);
  assign and_741_nl = nand_55_cse & mux_tmp_314;
  assign mux_tmp_315 = MUX_s_1_2_2(and_741_nl, mux_tmp_314, or_839_cse);
  assign and_742_nl = nand_58_cse & mux_tmp_315;
  assign mux_tmp_316 = MUX_s_1_2_2(and_742_nl, mux_tmp_315, or_830_cse);
  assign and_743_nl = not_tmp_645 & mux_tmp_316;
  assign mux_tmp_317 = MUX_s_1_2_2(and_743_nl, mux_tmp_316, or_823_cse);
  assign nor_423_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_317));
  assign mux_318_nl = MUX_s_1_2_2(nor_423_nl, mux_tmp_317, or_818_cse);
  assign and_dcpl_549 = mux_318_nl & and_dcpl_100;
  assign or_863_cse = (result_rem_11cyc_st_5!=4'b1000);
  assign nor_422_nl = ~(and_dcpl_105 | and_dcpl_100);
  assign or_865_nl = (result_rem_11cyc_st_6[2:0]!=3'b000) | (~ and_dcpl_99);
  assign mux_tmp_319 = MUX_s_1_2_2(nor_422_nl, or_865_nl, or_863_cse);
  assign nand_51_cse = ~((result_rem_11cyc_st_4[3]) & asn_itm_4 & main_stage_0_5);
  assign and_736_nl = nand_51_cse & mux_tmp_319;
  assign mux_tmp_320 = MUX_s_1_2_2(and_736_nl, mux_tmp_319, or_850_cse);
  assign and_737_nl = nand_55_cse & mux_tmp_320;
  assign mux_tmp_321 = MUX_s_1_2_2(and_737_nl, mux_tmp_320, or_839_cse);
  assign and_738_nl = nand_58_cse & mux_tmp_321;
  assign mux_tmp_322 = MUX_s_1_2_2(and_738_nl, mux_tmp_321, or_830_cse);
  assign and_739_nl = not_tmp_645 & mux_tmp_322;
  assign mux_tmp_323 = MUX_s_1_2_2(and_739_nl, mux_tmp_322, or_823_cse);
  assign nor_421_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_323));
  assign mux_324_nl = MUX_s_1_2_2(nor_421_nl, mux_tmp_323, or_818_cse);
  assign and_dcpl_552 = mux_324_nl & and_dcpl_74;
  assign or_878_cse = (result_rem_11cyc_st_6[2:0]!=3'b000);
  assign and_731_cse = (result_rem_11cyc_st_6[3]) & asn_itm_6 & main_stage_0_7;
  assign nor_419_nl = ~(and_731_cse | and_dcpl_74);
  assign or_880_nl = (result_rem_11cyc_st_7[2:0]!=3'b000) | (~ and_dcpl_73);
  assign mux_tmp_325 = MUX_s_1_2_2(nor_419_nl, or_880_nl, or_878_cse);
  assign nor_420_nl = ~(and_dcpl_105 | (~ mux_tmp_325));
  assign mux_tmp_326 = MUX_s_1_2_2(nor_420_nl, mux_tmp_325, or_863_cse);
  assign and_732_nl = nand_51_cse & mux_tmp_326;
  assign mux_tmp_327 = MUX_s_1_2_2(and_732_nl, mux_tmp_326, or_850_cse);
  assign and_733_nl = nand_55_cse & mux_tmp_327;
  assign mux_tmp_328 = MUX_s_1_2_2(and_733_nl, mux_tmp_327, or_839_cse);
  assign and_734_nl = nand_58_cse & mux_tmp_328;
  assign mux_tmp_329 = MUX_s_1_2_2(and_734_nl, mux_tmp_328, or_830_cse);
  assign and_735_nl = not_tmp_645 & mux_tmp_329;
  assign mux_tmp_330 = MUX_s_1_2_2(and_735_nl, mux_tmp_329, or_823_cse);
  assign nor_418_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_330));
  assign mux_331_nl = MUX_s_1_2_2(nor_418_nl, mux_tmp_330, or_818_cse);
  assign and_dcpl_556 = mux_331_nl & and_dcpl_45;
  assign and_725_cse = (result_rem_11cyc_st_7[3]) & asn_itm_7 & main_stage_0_8;
  assign nor_415_nl = ~(and_725_cse | and_dcpl_45);
  assign or_897_nl = (result_rem_11cyc_st_8!=4'b1000) | (~ and_dcpl_28);
  assign or_895_nl = (result_rem_11cyc_st_7[2:0]!=3'b000);
  assign mux_tmp_332 = MUX_s_1_2_2(nor_415_nl, or_897_nl, or_895_nl);
  assign nand_42_cse = ~((result_rem_11cyc_st_6[3]) & asn_itm_6 & main_stage_0_7);
  assign and_726_nl = nand_42_cse & mux_tmp_332;
  assign mux_tmp_333 = MUX_s_1_2_2(and_726_nl, mux_tmp_332, or_878_cse);
  assign nor_416_nl = ~(and_dcpl_105 | (~ mux_tmp_333));
  assign mux_tmp_334 = MUX_s_1_2_2(nor_416_nl, mux_tmp_333, or_863_cse);
  assign and_727_nl = nand_51_cse & mux_tmp_334;
  assign mux_tmp_335 = MUX_s_1_2_2(and_727_nl, mux_tmp_334, or_850_cse);
  assign and_728_nl = nand_55_cse & mux_tmp_335;
  assign mux_tmp_336 = MUX_s_1_2_2(and_728_nl, mux_tmp_335, or_839_cse);
  assign and_729_nl = nand_58_cse & mux_tmp_336;
  assign mux_tmp_337 = MUX_s_1_2_2(and_729_nl, mux_tmp_336, or_830_cse);
  assign and_730_nl = not_tmp_645 & mux_tmp_337;
  assign mux_tmp_338 = MUX_s_1_2_2(and_730_nl, mux_tmp_337, or_823_cse);
  assign nor_417_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_338));
  assign mux_339_nl = MUX_s_1_2_2(nor_417_nl, mux_tmp_338, or_818_cse);
  assign and_dcpl_560 = mux_339_nl & and_dcpl_4 & and_dcpl_18 & (~ (result_rem_11cyc_st_9[0]));
  assign or_tmp_897 = (~ main_stage_0_10) | (~ asn_itm_9) | (result_rem_11cyc_st_9!=4'b1000);
  assign nor_407_nl = ~((result_rem_11cyc_st_8[3]) | (~ or_tmp_897));
  assign or_914_nl = (~ main_stage_0_9) | (~ asn_itm_8) | (result_rem_11cyc_st_8[2:0]!=3'b000);
  assign mux_tmp_340 = MUX_s_1_2_2(nor_407_nl, or_tmp_897, or_914_nl);
  assign nor_408_nl = ~((result_rem_11cyc_st_7[3]) | (~ mux_tmp_340));
  assign or_913_nl = (~ main_stage_0_8) | (~ asn_itm_7) | (result_rem_11cyc_st_7[2:0]!=3'b000);
  assign mux_tmp_341 = MUX_s_1_2_2(nor_408_nl, mux_tmp_340, or_913_nl);
  assign nor_409_nl = ~((result_rem_11cyc_st_6[3]) | (~ mux_tmp_341));
  assign or_912_nl = (~ main_stage_0_7) | (~ asn_itm_6) | (result_rem_11cyc_st_6[2:0]!=3'b000);
  assign mux_tmp_342 = MUX_s_1_2_2(nor_409_nl, mux_tmp_341, or_912_nl);
  assign nor_410_nl = ~((result_rem_11cyc_st_5[3]) | (~ mux_tmp_342));
  assign or_911_nl = (~ main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5[2:0]!=3'b000);
  assign mux_tmp_343 = MUX_s_1_2_2(nor_410_nl, mux_tmp_342, or_911_nl);
  assign nor_411_nl = ~((result_rem_11cyc_st_4[3]) | (~ mux_tmp_343));
  assign or_910_nl = (~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4[2:0]!=3'b000);
  assign mux_tmp_344 = MUX_s_1_2_2(nor_411_nl, mux_tmp_343, or_910_nl);
  assign nor_412_nl = ~((result_rem_11cyc_st_3[3]) | (~ mux_tmp_344));
  assign or_909_nl = (~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3[2:0]!=3'b000);
  assign mux_tmp_345 = MUX_s_1_2_2(nor_412_nl, mux_tmp_344, or_909_nl);
  assign nor_413_nl = ~((result_rem_11cyc_st_2[3]) | (~ mux_tmp_345));
  assign or_908_nl = (~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2[2:0]!=3'b000);
  assign mux_tmp_346 = MUX_s_1_2_2(nor_413_nl, mux_tmp_345, or_908_nl);
  assign and_724_nl = not_tmp_645 & mux_tmp_346;
  assign mux_tmp_347 = MUX_s_1_2_2(and_724_nl, mux_tmp_346, or_823_cse);
  assign nor_414_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_347));
  assign mux_tmp_348 = MUX_s_1_2_2(nor_414_nl, mux_tmp_347, or_818_cse);
  assign and_dcpl_566 = and_dcpl_532 & and_dcpl_318;
  assign or_tmp_909 = (result_rem_11cyc[2:0]!=3'b001) | not_tmp_645;
  assign or_928_cse = (result_result_acc_tmp!=4'b1001);
  assign nor_406_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_909));
  assign mux_349_nl = MUX_s_1_2_2(nor_406_nl, or_tmp_909, or_928_cse);
  assign and_dcpl_568 = mux_349_nl & and_dcpl_204;
  assign or_933_cse = (result_rem_11cyc[2:0]!=3'b001);
  assign nor_405_nl = ~(and_749_cse | and_dcpl_204);
  assign or_935_nl = (result_rem_11cyc_st_2[2:0]!=3'b001) | (~ and_dcpl_202);
  assign mux_tmp_350 = MUX_s_1_2_2(nor_405_nl, or_935_nl, or_933_cse);
  assign nor_404_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_350));
  assign mux_351_nl = MUX_s_1_2_2(nor_404_nl, mux_tmp_350, or_928_cse);
  assign and_dcpl_570 = mux_351_nl & and_dcpl_178;
  assign or_940_cse = (result_rem_11cyc_st_2[2:0]!=3'b001);
  assign nor_403_nl = ~(and_747_cse | and_dcpl_178);
  assign or_942_nl = (result_rem_11cyc_st_3[2:0]!=3'b001) | (~ and_dcpl_176);
  assign mux_tmp_352 = MUX_s_1_2_2(nor_403_nl, or_942_nl, or_940_cse);
  assign and_722_nl = not_tmp_645 & mux_tmp_352;
  assign mux_tmp_353 = MUX_s_1_2_2(and_722_nl, mux_tmp_352, or_933_cse);
  assign nor_402_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_353));
  assign mux_354_nl = MUX_s_1_2_2(nor_402_nl, mux_tmp_353, or_928_cse);
  assign and_dcpl_572 = mux_354_nl & and_dcpl_152;
  assign or_949_cse = (result_rem_11cyc_st_3[2:0]!=3'b001);
  assign nor_401_nl = ~(and_744_cse | and_dcpl_152);
  assign or_951_nl = (result_rem_11cyc_st_4[2:0]!=3'b001) | (~ and_dcpl_150);
  assign mux_tmp_355 = MUX_s_1_2_2(nor_401_nl, or_951_nl, or_949_cse);
  assign and_719_nl = nand_58_cse & mux_tmp_355;
  assign mux_tmp_356 = MUX_s_1_2_2(and_719_nl, mux_tmp_355, or_940_cse);
  assign and_720_nl = not_tmp_645 & mux_tmp_356;
  assign mux_tmp_357 = MUX_s_1_2_2(and_720_nl, mux_tmp_356, or_933_cse);
  assign nor_400_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_357));
  assign mux_358_nl = MUX_s_1_2_2(nor_400_nl, mux_tmp_357, or_928_cse);
  assign and_dcpl_576 = mux_358_nl & and_dcpl_125;
  assign or_960_cse = (result_rem_11cyc_st_4[2:0]!=3'b001);
  assign nor_399_nl = ~(and_740_cse | and_dcpl_125);
  assign or_962_nl = (result_rem_11cyc_st_5!=4'b1001) | (~ and_dcpl_105);
  assign mux_tmp_359 = MUX_s_1_2_2(nor_399_nl, or_962_nl, or_960_cse);
  assign and_715_nl = nand_55_cse & mux_tmp_359;
  assign mux_tmp_360 = MUX_s_1_2_2(and_715_nl, mux_tmp_359, or_949_cse);
  assign and_716_nl = nand_58_cse & mux_tmp_360;
  assign mux_tmp_361 = MUX_s_1_2_2(and_716_nl, mux_tmp_360, or_940_cse);
  assign and_717_nl = not_tmp_645 & mux_tmp_361;
  assign mux_tmp_362 = MUX_s_1_2_2(and_717_nl, mux_tmp_361, or_933_cse);
  assign nor_398_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_362));
  assign mux_363_nl = MUX_s_1_2_2(nor_398_nl, mux_tmp_362, or_928_cse);
  assign and_dcpl_578 = mux_363_nl & and_dcpl_101;
  assign or_973_cse = (result_rem_11cyc_st_5!=4'b1001);
  assign nor_397_nl = ~(and_dcpl_105 | and_dcpl_101);
  assign or_975_nl = (result_rem_11cyc_st_6[2:0]!=3'b001) | (~ and_dcpl_99);
  assign mux_tmp_364 = MUX_s_1_2_2(nor_397_nl, or_975_nl, or_973_cse);
  assign and_710_nl = nand_51_cse & mux_tmp_364;
  assign mux_tmp_365 = MUX_s_1_2_2(and_710_nl, mux_tmp_364, or_960_cse);
  assign and_711_nl = nand_55_cse & mux_tmp_365;
  assign mux_tmp_366 = MUX_s_1_2_2(and_711_nl, mux_tmp_365, or_949_cse);
  assign and_712_nl = nand_58_cse & mux_tmp_366;
  assign mux_tmp_367 = MUX_s_1_2_2(and_712_nl, mux_tmp_366, or_940_cse);
  assign and_713_nl = not_tmp_645 & mux_tmp_367;
  assign mux_tmp_368 = MUX_s_1_2_2(and_713_nl, mux_tmp_367, or_933_cse);
  assign nor_396_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_368));
  assign mux_369_nl = MUX_s_1_2_2(nor_396_nl, mux_tmp_368, or_928_cse);
  assign and_dcpl_580 = mux_369_nl & and_dcpl_75;
  assign or_988_cse = (result_rem_11cyc_st_6[2:0]!=3'b001);
  assign nor_394_nl = ~(and_731_cse | and_dcpl_75);
  assign or_990_nl = (result_rem_11cyc_st_7[2:0]!=3'b001) | (~ and_dcpl_73);
  assign mux_tmp_370 = MUX_s_1_2_2(nor_394_nl, or_990_nl, or_988_cse);
  assign nor_395_nl = ~(and_dcpl_105 | (~ mux_tmp_370));
  assign mux_tmp_371 = MUX_s_1_2_2(nor_395_nl, mux_tmp_370, or_973_cse);
  assign and_706_nl = nand_51_cse & mux_tmp_371;
  assign mux_tmp_372 = MUX_s_1_2_2(and_706_nl, mux_tmp_371, or_960_cse);
  assign and_707_nl = nand_55_cse & mux_tmp_372;
  assign mux_tmp_373 = MUX_s_1_2_2(and_707_nl, mux_tmp_372, or_949_cse);
  assign and_708_nl = nand_58_cse & mux_tmp_373;
  assign mux_tmp_374 = MUX_s_1_2_2(and_708_nl, mux_tmp_373, or_940_cse);
  assign and_709_nl = not_tmp_645 & mux_tmp_374;
  assign mux_tmp_375 = MUX_s_1_2_2(and_709_nl, mux_tmp_374, or_933_cse);
  assign nor_393_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_375));
  assign mux_376_nl = MUX_s_1_2_2(nor_393_nl, mux_tmp_375, or_928_cse);
  assign and_dcpl_583 = mux_376_nl & and_dcpl_47;
  assign nor_390_nl = ~(and_725_cse | and_dcpl_47);
  assign or_1007_nl = (result_rem_11cyc_st_8!=4'b1001) | (~ and_dcpl_28);
  assign or_1005_nl = (result_rem_11cyc_st_7[2:0]!=3'b001);
  assign mux_tmp_377 = MUX_s_1_2_2(nor_390_nl, or_1007_nl, or_1005_nl);
  assign and_700_nl = nand_42_cse & mux_tmp_377;
  assign mux_tmp_378 = MUX_s_1_2_2(and_700_nl, mux_tmp_377, or_988_cse);
  assign nor_391_nl = ~(and_dcpl_105 | (~ mux_tmp_378));
  assign mux_tmp_379 = MUX_s_1_2_2(nor_391_nl, mux_tmp_378, or_973_cse);
  assign and_701_nl = nand_51_cse & mux_tmp_379;
  assign mux_tmp_380 = MUX_s_1_2_2(and_701_nl, mux_tmp_379, or_960_cse);
  assign and_702_nl = nand_55_cse & mux_tmp_380;
  assign mux_tmp_381 = MUX_s_1_2_2(and_702_nl, mux_tmp_380, or_949_cse);
  assign and_703_nl = nand_58_cse & mux_tmp_381;
  assign mux_tmp_382 = MUX_s_1_2_2(and_703_nl, mux_tmp_381, or_940_cse);
  assign and_704_nl = not_tmp_645 & mux_tmp_382;
  assign mux_tmp_383 = MUX_s_1_2_2(and_704_nl, mux_tmp_382, or_933_cse);
  assign nor_392_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_383));
  assign mux_384_nl = MUX_s_1_2_2(nor_392_nl, mux_tmp_383, or_928_cse);
  assign and_dcpl_586 = mux_384_nl & and_dcpl_4 & and_dcpl_18 & (result_rem_11cyc_st_9[0]);
  assign or_tmp_1005 = (~ main_stage_0_10) | (~ asn_itm_9) | (result_rem_11cyc_st_9!=4'b1001);
  assign nor_383_nl = ~((result_rem_11cyc_st_8[3]) | (~ or_tmp_1005));
  assign or_1024_nl = (~ main_stage_0_9) | (~ asn_itm_8) | (result_rem_11cyc_st_8[2:0]!=3'b001);
  assign mux_tmp_385 = MUX_s_1_2_2(nor_383_nl, or_tmp_1005, or_1024_nl);
  assign nor_384_nl = ~((result_rem_11cyc_st_7[3]) | (~ mux_tmp_385));
  assign or_1023_nl = (~ main_stage_0_8) | (~ asn_itm_7) | (result_rem_11cyc_st_7[2:0]!=3'b001);
  assign mux_tmp_386 = MUX_s_1_2_2(nor_384_nl, mux_tmp_385, or_1023_nl);
  assign nor_385_nl = ~((result_rem_11cyc_st_6[3]) | (~ mux_tmp_386));
  assign or_1022_nl = (~ main_stage_0_7) | (~ asn_itm_6) | (result_rem_11cyc_st_6[2:0]!=3'b001);
  assign mux_tmp_387 = MUX_s_1_2_2(nor_385_nl, mux_tmp_386, or_1022_nl);
  assign nor_386_nl = ~((result_rem_11cyc_st_5[3]) | (~ mux_tmp_387));
  assign or_1021_nl = (~ main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5[2:0]!=3'b001);
  assign mux_tmp_388 = MUX_s_1_2_2(nor_386_nl, mux_tmp_387, or_1021_nl);
  assign nor_387_nl = ~((result_rem_11cyc_st_4[3]) | (~ mux_tmp_388));
  assign or_1020_nl = (~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4[2:0]!=3'b001);
  assign mux_tmp_389 = MUX_s_1_2_2(nor_387_nl, mux_tmp_388, or_1020_nl);
  assign nor_388_nl = ~((result_rem_11cyc_st_3[3]) | (~ mux_tmp_389));
  assign or_1019_nl = (~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3[2:0]!=3'b001);
  assign mux_tmp_390 = MUX_s_1_2_2(nor_388_nl, mux_tmp_389, or_1019_nl);
  assign nor_389_nl = ~((result_rem_11cyc_st_2[3]) | (~ mux_tmp_390));
  assign or_1018_nl = (~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2[2:0]!=3'b001);
  assign mux_tmp_391 = MUX_s_1_2_2(nor_389_nl, mux_tmp_390, or_1018_nl);
  assign and_697_nl = not_tmp_645 & mux_tmp_391;
  assign mux_tmp_392 = MUX_s_1_2_2(and_697_nl, mux_tmp_391, or_933_cse);
  assign and_698_nl = nand_146_cse & mux_tmp_392;
  assign or_1016_nl = (result_result_acc_tmp[3:1]!=3'b100);
  assign mux_tmp_393 = MUX_s_1_2_2(and_698_nl, mux_tmp_392, or_1016_nl);
  assign and_dcpl_590 = and_dcpl_532 & and_dcpl_352;
  assign or_tmp_1017 = (result_rem_11cyc[2:0]!=3'b010) | not_tmp_645;
  assign or_1037_cse = (result_result_acc_tmp!=4'b1010);
  assign nor_382_nl = ~(ccs_ccore_start_rsci_idat | (~ or_tmp_1017));
  assign mux_394_nl = MUX_s_1_2_2(nor_382_nl, or_tmp_1017, or_1037_cse);
  assign and_dcpl_592 = mux_394_nl & and_dcpl_205;
  assign or_1042_cse = (result_rem_11cyc[2:0]!=3'b010);
  assign nor_381_nl = ~(and_749_cse | and_dcpl_205);
  assign or_1044_nl = (result_rem_11cyc_st_2[2:0]!=3'b010) | (~ and_dcpl_202);
  assign mux_tmp_395 = MUX_s_1_2_2(nor_381_nl, or_1044_nl, or_1042_cse);
  assign nor_380_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_395));
  assign mux_396_nl = MUX_s_1_2_2(nor_380_nl, mux_tmp_395, or_1037_cse);
  assign and_dcpl_594 = mux_396_nl & and_dcpl_179;
  assign or_1049_cse = (result_rem_11cyc_st_2[2:0]!=3'b010);
  assign nor_379_nl = ~(and_747_cse | and_dcpl_179);
  assign or_1051_nl = (result_rem_11cyc_st_3[2:0]!=3'b010) | (~ and_dcpl_176);
  assign mux_tmp_397 = MUX_s_1_2_2(nor_379_nl, or_1051_nl, or_1049_cse);
  assign and_695_nl = not_tmp_645 & mux_tmp_397;
  assign mux_tmp_398 = MUX_s_1_2_2(and_695_nl, mux_tmp_397, or_1042_cse);
  assign nor_378_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_398));
  assign mux_399_nl = MUX_s_1_2_2(nor_378_nl, mux_tmp_398, or_1037_cse);
  assign and_dcpl_596 = mux_399_nl & and_dcpl_153;
  assign or_1058_cse = (result_rem_11cyc_st_3[2:0]!=3'b010);
  assign nor_377_nl = ~(and_744_cse | and_dcpl_153);
  assign or_1060_nl = (result_rem_11cyc_st_4[2:0]!=3'b010) | (~ and_dcpl_150);
  assign mux_tmp_400 = MUX_s_1_2_2(nor_377_nl, or_1060_nl, or_1058_cse);
  assign and_692_nl = nand_58_cse & mux_tmp_400;
  assign mux_tmp_401 = MUX_s_1_2_2(and_692_nl, mux_tmp_400, or_1049_cse);
  assign and_693_nl = not_tmp_645 & mux_tmp_401;
  assign mux_tmp_402 = MUX_s_1_2_2(and_693_nl, mux_tmp_401, or_1042_cse);
  assign nor_376_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_402));
  assign mux_403_nl = MUX_s_1_2_2(nor_376_nl, mux_tmp_402, or_1037_cse);
  assign and_dcpl_599 = mux_403_nl & and_dcpl_127;
  assign or_1069_cse = (result_rem_11cyc_st_4[2:0]!=3'b010);
  assign nor_375_nl = ~(and_740_cse | and_dcpl_127);
  assign or_1071_nl = (result_rem_11cyc_st_5!=4'b1010) | (~ and_dcpl_105);
  assign mux_tmp_404 = MUX_s_1_2_2(nor_375_nl, or_1071_nl, or_1069_cse);
  assign and_688_nl = nand_55_cse & mux_tmp_404;
  assign mux_tmp_405 = MUX_s_1_2_2(and_688_nl, mux_tmp_404, or_1058_cse);
  assign and_689_nl = nand_58_cse & mux_tmp_405;
  assign mux_tmp_406 = MUX_s_1_2_2(and_689_nl, mux_tmp_405, or_1049_cse);
  assign and_690_nl = not_tmp_645 & mux_tmp_406;
  assign mux_tmp_407 = MUX_s_1_2_2(and_690_nl, mux_tmp_406, or_1042_cse);
  assign nor_374_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_407));
  assign mux_408_nl = MUX_s_1_2_2(nor_374_nl, mux_tmp_407, or_1037_cse);
  assign and_dcpl_601 = mux_408_nl & and_dcpl_102;
  assign or_1082_cse = (result_rem_11cyc_st_5!=4'b1010);
  assign nor_373_nl = ~(and_dcpl_105 | and_dcpl_102);
  assign or_1084_nl = (result_rem_11cyc_st_6[2:0]!=3'b010) | (~ and_dcpl_99);
  assign mux_tmp_409 = MUX_s_1_2_2(nor_373_nl, or_1084_nl, or_1082_cse);
  assign and_683_nl = nand_51_cse & mux_tmp_409;
  assign mux_tmp_410 = MUX_s_1_2_2(and_683_nl, mux_tmp_409, or_1069_cse);
  assign and_684_nl = nand_55_cse & mux_tmp_410;
  assign mux_tmp_411 = MUX_s_1_2_2(and_684_nl, mux_tmp_410, or_1058_cse);
  assign and_685_nl = nand_58_cse & mux_tmp_411;
  assign mux_tmp_412 = MUX_s_1_2_2(and_685_nl, mux_tmp_411, or_1049_cse);
  assign and_686_nl = not_tmp_645 & mux_tmp_412;
  assign mux_tmp_413 = MUX_s_1_2_2(and_686_nl, mux_tmp_412, or_1042_cse);
  assign nor_372_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_413));
  assign mux_414_nl = MUX_s_1_2_2(nor_372_nl, mux_tmp_413, or_1037_cse);
  assign and_dcpl_603 = mux_414_nl & and_dcpl_76;
  assign or_1097_cse = (result_rem_11cyc_st_6[2:0]!=3'b010);
  assign nor_370_nl = ~(and_731_cse | and_dcpl_76);
  assign or_1099_nl = (result_rem_11cyc_st_7[2:0]!=3'b010) | (~ and_dcpl_73);
  assign mux_tmp_415 = MUX_s_1_2_2(nor_370_nl, or_1099_nl, or_1097_cse);
  assign nor_371_nl = ~(and_dcpl_105 | (~ mux_tmp_415));
  assign mux_tmp_416 = MUX_s_1_2_2(nor_371_nl, mux_tmp_415, or_1082_cse);
  assign and_679_nl = nand_51_cse & mux_tmp_416;
  assign mux_tmp_417 = MUX_s_1_2_2(and_679_nl, mux_tmp_416, or_1069_cse);
  assign and_680_nl = nand_55_cse & mux_tmp_417;
  assign mux_tmp_418 = MUX_s_1_2_2(and_680_nl, mux_tmp_417, or_1058_cse);
  assign and_681_nl = nand_58_cse & mux_tmp_418;
  assign mux_tmp_419 = MUX_s_1_2_2(and_681_nl, mux_tmp_418, or_1049_cse);
  assign and_682_nl = not_tmp_645 & mux_tmp_419;
  assign mux_tmp_420 = MUX_s_1_2_2(and_682_nl, mux_tmp_419, or_1042_cse);
  assign nor_369_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_420));
  assign mux_421_nl = MUX_s_1_2_2(nor_369_nl, mux_tmp_420, or_1037_cse);
  assign and_dcpl_607 = mux_421_nl & and_dcpl_50;
  assign nor_366_nl = ~(and_725_cse | and_dcpl_50);
  assign or_1116_nl = (result_rem_11cyc_st_8!=4'b1010) | (~ and_dcpl_28);
  assign or_1114_nl = (result_rem_11cyc_st_7[2:0]!=3'b010);
  assign mux_tmp_422 = MUX_s_1_2_2(nor_366_nl, or_1116_nl, or_1114_nl);
  assign and_673_nl = nand_42_cse & mux_tmp_422;
  assign mux_tmp_423 = MUX_s_1_2_2(and_673_nl, mux_tmp_422, or_1097_cse);
  assign nor_367_nl = ~(and_dcpl_105 | (~ mux_tmp_423));
  assign mux_tmp_424 = MUX_s_1_2_2(nor_367_nl, mux_tmp_423, or_1082_cse);
  assign and_674_nl = nand_51_cse & mux_tmp_424;
  assign mux_tmp_425 = MUX_s_1_2_2(and_674_nl, mux_tmp_424, or_1069_cse);
  assign and_675_nl = nand_55_cse & mux_tmp_425;
  assign mux_tmp_426 = MUX_s_1_2_2(and_675_nl, mux_tmp_425, or_1058_cse);
  assign and_676_nl = nand_58_cse & mux_tmp_426;
  assign mux_tmp_427 = MUX_s_1_2_2(and_676_nl, mux_tmp_426, or_1049_cse);
  assign and_677_nl = not_tmp_645 & mux_tmp_427;
  assign mux_tmp_428 = MUX_s_1_2_2(and_677_nl, mux_tmp_427, or_1042_cse);
  assign nor_368_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_428));
  assign mux_429_nl = MUX_s_1_2_2(nor_368_nl, mux_tmp_428, or_1037_cse);
  assign and_dcpl_611 = mux_429_nl & and_dcpl_4 & (result_rem_11cyc_st_9[3]) & (result_rem_11cyc_st_9[1])
      & (~ (result_rem_11cyc_st_9[0]));
  assign or_tmp_1113 = (~ main_stage_0_10) | (~ asn_itm_9) | (result_rem_11cyc_st_9!=4'b1010);
  assign nor_358_nl = ~((result_rem_11cyc_st_8[3]) | (~ or_tmp_1113));
  assign or_1133_nl = (~ main_stage_0_9) | (~ asn_itm_8) | (result_rem_11cyc_st_8[2:0]!=3'b010);
  assign mux_tmp_430 = MUX_s_1_2_2(nor_358_nl, or_tmp_1113, or_1133_nl);
  assign nor_359_nl = ~((result_rem_11cyc_st_7[3]) | (~ mux_tmp_430));
  assign or_1132_nl = (~ main_stage_0_8) | (~ asn_itm_7) | (result_rem_11cyc_st_7[2:0]!=3'b010);
  assign mux_tmp_431 = MUX_s_1_2_2(nor_359_nl, mux_tmp_430, or_1132_nl);
  assign nor_360_nl = ~((result_rem_11cyc_st_6[3]) | (~ mux_tmp_431));
  assign or_1131_nl = (~ main_stage_0_7) | (~ asn_itm_6) | (result_rem_11cyc_st_6[2:0]!=3'b010);
  assign mux_tmp_432 = MUX_s_1_2_2(nor_360_nl, mux_tmp_431, or_1131_nl);
  assign nor_361_nl = ~((result_rem_11cyc_st_5[3]) | (~ mux_tmp_432));
  assign or_1130_nl = (~ main_stage_0_6) | (~ asn_itm_5) | (result_rem_11cyc_st_5[2:0]!=3'b010);
  assign mux_tmp_433 = MUX_s_1_2_2(nor_361_nl, mux_tmp_432, or_1130_nl);
  assign nor_362_nl = ~((result_rem_11cyc_st_4[3]) | (~ mux_tmp_433));
  assign or_1129_nl = (~ main_stage_0_5) | (~ asn_itm_4) | (result_rem_11cyc_st_4[2:0]!=3'b010);
  assign mux_tmp_434 = MUX_s_1_2_2(nor_362_nl, mux_tmp_433, or_1129_nl);
  assign nor_363_nl = ~((result_rem_11cyc_st_3[3]) | (~ mux_tmp_434));
  assign or_1128_nl = (~ main_stage_0_4) | (~ asn_itm_3) | (result_rem_11cyc_st_3[2:0]!=3'b010);
  assign mux_tmp_435 = MUX_s_1_2_2(nor_363_nl, mux_tmp_434, or_1128_nl);
  assign nor_364_nl = ~((result_rem_11cyc_st_2[3]) | (~ mux_tmp_435));
  assign or_1127_nl = (~ main_stage_0_3) | (~ asn_itm_2) | (result_rem_11cyc_st_2[2:0]!=3'b010);
  assign mux_tmp_436 = MUX_s_1_2_2(nor_364_nl, mux_tmp_435, or_1127_nl);
  assign and_671_nl = not_tmp_645 & mux_tmp_436;
  assign mux_tmp_437 = MUX_s_1_2_2(and_671_nl, mux_tmp_436, or_1042_cse);
  assign nor_365_nl = ~(ccs_ccore_start_rsci_idat | (~ mux_tmp_437));
  assign mux_tmp_438 = MUX_s_1_2_2(nor_365_nl, mux_tmp_437, or_1037_cse);
  assign return_rsci_d_mx0c0 = and_dcpl_235 & and_dcpl_233;
  assign return_rsci_d_mx0c1 = and_dcpl_235 & and_dcpl_237;
  assign return_rsci_d_mx0c2 = and_dcpl_235 & and_dcpl_240;
  assign return_rsci_d_mx0c3 = and_dcpl_235 & and_dcpl_239 & (result_rem_11cyc_st_11[0]);
  assign return_rsci_d_mx0c4 = and_dcpl_235 & and_dcpl_244 & (~ (result_rem_11cyc_st_11[0]));
  assign return_rsci_d_mx0c5 = and_dcpl_235 & and_dcpl_244 & (result_rem_11cyc_st_11[0]);
  assign return_rsci_d_mx0c6 = and_dcpl_235 & and_dcpl_249 & (~ (result_rem_11cyc_st_11[0]));
  assign return_rsci_d_mx0c7 = and_dcpl_235 & and_dcpl_249 & (result_rem_11cyc_st_11[0]);
  assign return_rsci_d_mx0c8 = and_dcpl_254 & and_dcpl_233;
  assign return_rsci_d_mx0c9 = and_dcpl_254 & and_dcpl_237;
  assign return_rsci_d_mx0c10 = and_dcpl_254 & and_dcpl_240;
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & (return_rsci_d_mx0c0 | return_rsci_d_mx0c1 | return_rsci_d_mx0c2
        | return_rsci_d_mx0c3 | return_rsci_d_mx0c4 | return_rsci_d_mx0c5 | return_rsci_d_mx0c6
        | return_rsci_d_mx0c7 | return_rsci_d_mx0c8 | return_rsci_d_mx0c9 | return_rsci_d_mx0c10)
        ) begin
      return_rsci_d <= MUX1HOT_v_64_11_2(result_rem_12_cmp_1_z, result_rem_12_cmp_2_z,
          result_rem_12_cmp_3_z, result_rem_12_cmp_4_z, result_rem_12_cmp_5_z, result_rem_12_cmp_6_z,
          result_rem_12_cmp_7_z, result_rem_12_cmp_8_z, result_rem_12_cmp_9_z, result_rem_12_cmp_10_z,
          result_rem_12_cmp_z, {return_rsci_d_mx0c0 , return_rsci_d_mx0c1 , return_rsci_d_mx0c2
          , return_rsci_d_mx0c3 , return_rsci_d_mx0c4 , return_rsci_d_mx0c5 , return_rsci_d_mx0c6
          , return_rsci_d_mx0c7 , return_rsci_d_mx0c8 , return_rsci_d_mx0c9 , return_rsci_d_mx0c10});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_11 <= 4'b0000;
    end
    else if ( ccs_ccore_en & main_stage_0_11 & asn_itm_10 ) begin
      result_rem_11cyc_st_11 <= result_rem_11cyc_st_10;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
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
    end
    else if ( ccs_ccore_en ) begin
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
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_1_cse ) begin
      result_rem_12_cmp_1_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_1_2,
          m_buf_sva_mut_1_3, m_buf_sva_mut_1_4, m_buf_sva_mut_1_5, m_buf_sva_mut_1_6,
          m_buf_sva_mut_1_7, m_buf_sva_mut_1_8, m_buf_sva_mut_1_9, m_buf_sva_mut_1_10,
          {and_dcpl_263 , and_dcpl_269 , and_dcpl_275 , and_dcpl_281 , and_dcpl_287
          , and_dcpl_293 , and_dcpl_299 , and_dcpl_305 , and_dcpl_311 , mux_tmp_37});
      result_rem_12_cmp_1_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_1_2,
          base_buf_sva_mut_1_3, base_buf_sva_mut_1_4, base_buf_sva_mut_1_5, base_buf_sva_mut_1_6,
          base_buf_sva_mut_1_7, base_buf_sva_mut_1_8, base_buf_sva_mut_1_9, base_buf_sva_mut_1_10,
          {and_dcpl_263 , and_dcpl_269 , and_dcpl_275 , and_dcpl_281 , and_dcpl_287
          , and_dcpl_293 , and_dcpl_299 , and_dcpl_305 , and_dcpl_311 , mux_tmp_37});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_3_cse ) begin
      result_rem_12_cmp_2_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_2_2,
          m_buf_sva_mut_2_3, m_buf_sva_mut_2_4, m_buf_sva_mut_2_5, m_buf_sva_mut_2_6,
          m_buf_sva_mut_2_7, m_buf_sva_mut_2_8, m_buf_sva_mut_2_9, m_buf_sva_mut_2_10,
          {and_dcpl_319 , and_dcpl_322 , and_dcpl_325 , and_dcpl_329 , and_dcpl_333
          , and_dcpl_337 , and_dcpl_341 , and_dcpl_344 , and_dcpl_347 , mux_tmp_75});
      result_rem_12_cmp_2_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_2_2,
          base_buf_sva_mut_2_3, base_buf_sva_mut_2_4, base_buf_sva_mut_2_5, base_buf_sva_mut_2_6,
          base_buf_sva_mut_2_7, base_buf_sva_mut_2_8, base_buf_sva_mut_2_9, base_buf_sva_mut_2_10,
          {and_dcpl_319 , and_dcpl_322 , and_dcpl_325 , and_dcpl_329 , and_dcpl_333
          , and_dcpl_337 , and_dcpl_341 , and_dcpl_344 , and_dcpl_347 , mux_tmp_75});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_5_cse ) begin
      result_rem_12_cmp_3_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_3_2,
          m_buf_sva_mut_3_3, m_buf_sva_mut_3_4, m_buf_sva_mut_3_5, m_buf_sva_mut_3_6,
          m_buf_sva_mut_3_7, m_buf_sva_mut_3_8, m_buf_sva_mut_3_9, m_buf_sva_mut_3_10,
          {and_dcpl_353 , and_dcpl_357 , and_dcpl_361 , and_dcpl_364 , and_dcpl_367
          , and_dcpl_370 , and_dcpl_373 , and_dcpl_377 , and_dcpl_381 , mux_tmp_113});
      result_rem_12_cmp_3_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_3_2,
          base_buf_sva_mut_3_3, base_buf_sva_mut_3_4, base_buf_sva_mut_3_5, base_buf_sva_mut_3_6,
          base_buf_sva_mut_3_7, base_buf_sva_mut_3_8, base_buf_sva_mut_3_9, base_buf_sva_mut_3_10,
          {and_dcpl_353 , and_dcpl_357 , and_dcpl_361 , and_dcpl_364 , and_dcpl_367
          , and_dcpl_370 , and_dcpl_373 , and_dcpl_377 , and_dcpl_381 , mux_tmp_113});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_7_cse ) begin
      result_rem_12_cmp_4_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_4_2,
          m_buf_sva_mut_4_3, m_buf_sva_mut_4_4, m_buf_sva_mut_4_5, m_buf_sva_mut_4_6,
          m_buf_sva_mut_4_7, m_buf_sva_mut_4_8, m_buf_sva_mut_4_9, m_buf_sva_mut_4_10,
          {and_dcpl_387 , and_dcpl_390 , and_dcpl_393 , and_dcpl_396 , and_dcpl_399
          , and_dcpl_402 , and_dcpl_405 , and_dcpl_408 , and_dcpl_411 , mux_tmp_151});
      result_rem_12_cmp_4_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_4_2,
          base_buf_sva_mut_4_3, base_buf_sva_mut_4_4, base_buf_sva_mut_4_5, base_buf_sva_mut_4_6,
          base_buf_sva_mut_4_7, base_buf_sva_mut_4_8, base_buf_sva_mut_4_9, base_buf_sva_mut_4_10,
          {and_dcpl_387 , and_dcpl_390 , and_dcpl_393 , and_dcpl_396 , and_dcpl_399
          , and_dcpl_402 , and_dcpl_405 , and_dcpl_408 , and_dcpl_411 , mux_tmp_151});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_9_cse ) begin
      result_rem_12_cmp_5_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_5_2,
          m_buf_sva_mut_5_3, m_buf_sva_mut_5_4, m_buf_sva_mut_5_5, m_buf_sva_mut_5_6,
          m_buf_sva_mut_5_7, m_buf_sva_mut_5_8, m_buf_sva_mut_5_9, m_buf_sva_mut_5_10,
          {and_dcpl_418 , and_dcpl_422 , and_dcpl_426 , and_dcpl_430 , and_dcpl_433
          , and_dcpl_437 , and_dcpl_441 , and_dcpl_444 , and_dcpl_447 , mux_tmp_189});
      result_rem_12_cmp_5_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_5_2,
          base_buf_sva_mut_5_3, base_buf_sva_mut_5_4, base_buf_sva_mut_5_5, base_buf_sva_mut_5_6,
          base_buf_sva_mut_5_7, base_buf_sva_mut_5_8, base_buf_sva_mut_5_9, base_buf_sva_mut_5_10,
          {and_dcpl_418 , and_dcpl_422 , and_dcpl_426 , and_dcpl_430 , and_dcpl_433
          , and_dcpl_437 , and_dcpl_441 , and_dcpl_444 , and_dcpl_447 , mux_tmp_189});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_11_cse ) begin
      result_rem_12_cmp_6_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_6_2,
          m_buf_sva_mut_6_3, m_buf_sva_mut_6_4, m_buf_sva_mut_6_5, m_buf_sva_mut_6_6,
          m_buf_sva_mut_6_7, m_buf_sva_mut_6_8, m_buf_sva_mut_6_9, m_buf_sva_mut_6_10,
          {and_dcpl_452 , and_dcpl_455 , and_dcpl_458 , and_dcpl_462 , and_dcpl_464
          , and_dcpl_468 , and_dcpl_472 , and_dcpl_474 , and_dcpl_476 , mux_tmp_227});
      result_rem_12_cmp_6_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_6_2,
          base_buf_sva_mut_6_3, base_buf_sva_mut_6_4, base_buf_sva_mut_6_5, base_buf_sva_mut_6_6,
          base_buf_sva_mut_6_7, base_buf_sva_mut_6_8, base_buf_sva_mut_6_9, base_buf_sva_mut_6_10,
          {and_dcpl_452 , and_dcpl_455 , and_dcpl_458 , and_dcpl_462 , and_dcpl_464
          , and_dcpl_468 , and_dcpl_472 , and_dcpl_474 , and_dcpl_476 , mux_tmp_227});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_13_cse ) begin
      result_rem_12_cmp_7_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_7_2,
          m_buf_sva_mut_7_3, m_buf_sva_mut_7_4, m_buf_sva_mut_7_5, m_buf_sva_mut_7_6,
          m_buf_sva_mut_7_7, m_buf_sva_mut_7_8, m_buf_sva_mut_7_9, m_buf_sva_mut_7_10,
          {and_dcpl_480 , and_dcpl_484 , and_dcpl_488 , and_dcpl_491 , and_dcpl_493
          , and_dcpl_496 , and_dcpl_499 , and_dcpl_501 , and_dcpl_503 , mux_tmp_265});
      result_rem_12_cmp_7_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_7_2,
          base_buf_sva_mut_7_3, base_buf_sva_mut_7_4, base_buf_sva_mut_7_5, base_buf_sva_mut_7_6,
          base_buf_sva_mut_7_7, base_buf_sva_mut_7_8, base_buf_sva_mut_7_9, base_buf_sva_mut_7_10,
          {and_dcpl_480 , and_dcpl_484 , and_dcpl_488 , and_dcpl_491 , and_dcpl_493
          , and_dcpl_496 , and_dcpl_499 , and_dcpl_501 , and_dcpl_503 , mux_tmp_265});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_15_cse ) begin
      result_rem_12_cmp_8_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_8_2,
          m_buf_sva_mut_8_3, m_buf_sva_mut_8_4, m_buf_sva_mut_8_5, m_buf_sva_mut_8_6,
          m_buf_sva_mut_8_7, m_buf_sva_mut_8_8, m_buf_sva_mut_8_9, m_buf_sva_mut_8_10,
          {and_dcpl_507 , and_dcpl_510 , and_dcpl_513 , and_dcpl_516 , and_dcpl_518
          , and_dcpl_521 , and_dcpl_524 , and_dcpl_526 , and_dcpl_528 , mux_tmp_303});
      result_rem_12_cmp_8_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_8_2,
          base_buf_sva_mut_8_3, base_buf_sva_mut_8_4, base_buf_sva_mut_8_5, base_buf_sva_mut_8_6,
          base_buf_sva_mut_8_7, base_buf_sva_mut_8_8, base_buf_sva_mut_8_9, base_buf_sva_mut_8_10,
          {and_dcpl_507 , and_dcpl_510 , and_dcpl_513 , and_dcpl_516 , and_dcpl_518
          , and_dcpl_521 , and_dcpl_524 , and_dcpl_526 , and_dcpl_528 , mux_tmp_303});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_17_cse ) begin
      result_rem_12_cmp_9_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_9_2,
          m_buf_sva_mut_9_3, m_buf_sva_mut_9_4, m_buf_sva_mut_9_5, m_buf_sva_mut_9_6,
          m_buf_sva_mut_9_7, m_buf_sva_mut_9_8, m_buf_sva_mut_9_9, m_buf_sva_mut_9_10,
          {and_dcpl_533 , and_dcpl_536 , and_dcpl_539 , and_dcpl_542 , and_dcpl_546
          , and_dcpl_549 , and_dcpl_552 , and_dcpl_556 , and_dcpl_560 , mux_tmp_348});
      result_rem_12_cmp_9_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_9_2,
          base_buf_sva_mut_9_3, base_buf_sva_mut_9_4, base_buf_sva_mut_9_5, base_buf_sva_mut_9_6,
          base_buf_sva_mut_9_7, base_buf_sva_mut_9_8, base_buf_sva_mut_9_9, base_buf_sva_mut_9_10,
          {and_dcpl_533 , and_dcpl_536 , and_dcpl_539 , and_dcpl_542 , and_dcpl_546
          , and_dcpl_549 , and_dcpl_552 , and_dcpl_556 , and_dcpl_560 , mux_tmp_348});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_19_cse ) begin
      result_rem_12_cmp_10_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_10_2,
          m_buf_sva_mut_10_3, m_buf_sva_mut_10_4, m_buf_sva_mut_10_5, m_buf_sva_mut_10_6,
          m_buf_sva_mut_10_7, m_buf_sva_mut_10_8, m_buf_sva_mut_10_9, m_buf_sva_mut_10_10,
          {and_dcpl_566 , and_dcpl_568 , and_dcpl_570 , and_dcpl_572 , and_dcpl_576
          , and_dcpl_578 , and_dcpl_580 , and_dcpl_583 , and_dcpl_586 , mux_tmp_393});
      result_rem_12_cmp_10_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_10_2,
          base_buf_sva_mut_10_3, base_buf_sva_mut_10_4, base_buf_sva_mut_10_5, base_buf_sva_mut_10_6,
          base_buf_sva_mut_10_7, base_buf_sva_mut_10_8, base_buf_sva_mut_10_9, base_buf_sva_mut_10_10,
          {and_dcpl_566 , and_dcpl_568 , and_dcpl_570 , and_dcpl_572 , and_dcpl_576
          , and_dcpl_578 , and_dcpl_580 , and_dcpl_583 , and_dcpl_586 , mux_tmp_393});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( result_and_21_cse ) begin
      result_rem_12_cmp_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_2, m_buf_sva_mut_3,
          m_buf_sva_mut_4, m_buf_sva_mut_5, m_buf_sva_mut_6, m_buf_sva_mut_7, m_buf_sva_mut_8,
          m_buf_sva_mut_9, m_buf_sva_mut_10, {and_dcpl_590 , and_dcpl_592 , and_dcpl_594
          , and_dcpl_596 , and_dcpl_599 , and_dcpl_601 , and_dcpl_603 , and_dcpl_607
          , and_dcpl_611 , mux_tmp_438});
      result_rem_12_cmp_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_2,
          base_buf_sva_mut_3, base_buf_sva_mut_4, base_buf_sva_mut_5, base_buf_sva_mut_6,
          base_buf_sva_mut_7, base_buf_sva_mut_8, base_buf_sva_mut_9, base_buf_sva_mut_10,
          {and_dcpl_590 , and_dcpl_592 , and_dcpl_594 , and_dcpl_596 , and_dcpl_599
          , and_dcpl_601 , and_dcpl_603 , and_dcpl_607 , and_dcpl_611 , mux_tmp_438});
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_cse ) begin
      m_buf_sva_mut_1_10 <= m_buf_sva_mut_1_9;
      base_buf_sva_mut_1_10 <= base_buf_sva_mut_1_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_1_cse ) begin
      m_buf_sva_mut_2_10 <= m_buf_sva_mut_2_9;
      base_buf_sva_mut_2_10 <= base_buf_sva_mut_2_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_2_cse ) begin
      m_buf_sva_mut_3_10 <= m_buf_sva_mut_3_9;
      base_buf_sva_mut_3_10 <= base_buf_sva_mut_3_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_3_cse ) begin
      m_buf_sva_mut_4_10 <= m_buf_sva_mut_4_9;
      base_buf_sva_mut_4_10 <= base_buf_sva_mut_4_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_4_cse ) begin
      m_buf_sva_mut_5_10 <= m_buf_sva_mut_5_9;
      base_buf_sva_mut_5_10 <= base_buf_sva_mut_5_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_5_cse ) begin
      m_buf_sva_mut_6_10 <= m_buf_sva_mut_6_9;
      base_buf_sva_mut_6_10 <= base_buf_sva_mut_6_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_6_cse ) begin
      m_buf_sva_mut_7_10 <= m_buf_sva_mut_7_9;
      base_buf_sva_mut_7_10 <= base_buf_sva_mut_7_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_7_cse ) begin
      m_buf_sva_mut_8_10 <= m_buf_sva_mut_8_9;
      base_buf_sva_mut_8_10 <= base_buf_sva_mut_8_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_8_cse ) begin
      m_buf_sva_mut_9_10 <= m_buf_sva_mut_9_9;
      base_buf_sva_mut_9_10 <= base_buf_sva_mut_9_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_9_cse ) begin
      m_buf_sva_mut_10_10 <= m_buf_sva_mut_10_9;
      base_buf_sva_mut_10_10 <= base_buf_sva_mut_10_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_10_cse ) begin
      m_buf_sva_mut_10 <= m_buf_sva_mut_9;
      base_buf_sva_mut_10 <= base_buf_sva_mut_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_10 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_3 ) begin
      result_rem_11cyc_st_10 <= result_rem_11cyc_st_9;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_11_cse ) begin
      m_buf_sva_mut_1_9 <= m_buf_sva_mut_1_8;
      base_buf_sva_mut_1_9 <= base_buf_sva_mut_1_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_12_cse ) begin
      m_buf_sva_mut_2_9 <= m_buf_sva_mut_2_8;
      base_buf_sva_mut_2_9 <= base_buf_sva_mut_2_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_13_cse ) begin
      m_buf_sva_mut_3_9 <= m_buf_sva_mut_3_8;
      base_buf_sva_mut_3_9 <= base_buf_sva_mut_3_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_14_cse ) begin
      m_buf_sva_mut_4_9 <= m_buf_sva_mut_4_8;
      base_buf_sva_mut_4_9 <= base_buf_sva_mut_4_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_15_cse ) begin
      m_buf_sva_mut_5_9 <= m_buf_sva_mut_5_8;
      base_buf_sva_mut_5_9 <= base_buf_sva_mut_5_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_16_cse ) begin
      m_buf_sva_mut_6_9 <= m_buf_sva_mut_6_8;
      base_buf_sva_mut_6_9 <= base_buf_sva_mut_6_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_17_cse ) begin
      m_buf_sva_mut_7_9 <= m_buf_sva_mut_7_8;
      base_buf_sva_mut_7_9 <= base_buf_sva_mut_7_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_18_cse ) begin
      m_buf_sva_mut_8_9 <= m_buf_sva_mut_8_8;
      base_buf_sva_mut_8_9 <= base_buf_sva_mut_8_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_19_cse ) begin
      m_buf_sva_mut_9_9 <= m_buf_sva_mut_9_8;
      base_buf_sva_mut_9_9 <= base_buf_sva_mut_9_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_20_cse ) begin
      m_buf_sva_mut_10_9 <= m_buf_sva_mut_10_8;
      base_buf_sva_mut_10_9 <= base_buf_sva_mut_10_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_21_cse ) begin
      m_buf_sva_mut_9 <= m_buf_sva_mut_8;
      base_buf_sva_mut_9 <= base_buf_sva_mut_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_9 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_28 ) begin
      result_rem_11cyc_st_9 <= result_rem_11cyc_st_8;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_22_cse ) begin
      m_buf_sva_mut_1_8 <= m_buf_sva_mut_1_7;
      base_buf_sva_mut_1_8 <= base_buf_sva_mut_1_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_23_cse ) begin
      m_buf_sva_mut_2_8 <= m_buf_sva_mut_2_7;
      base_buf_sva_mut_2_8 <= base_buf_sva_mut_2_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_24_cse ) begin
      m_buf_sva_mut_3_8 <= m_buf_sva_mut_3_7;
      base_buf_sva_mut_3_8 <= base_buf_sva_mut_3_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_25_cse ) begin
      m_buf_sva_mut_4_8 <= m_buf_sva_mut_4_7;
      base_buf_sva_mut_4_8 <= base_buf_sva_mut_4_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_26_cse ) begin
      m_buf_sva_mut_5_8 <= m_buf_sva_mut_5_7;
      base_buf_sva_mut_5_8 <= base_buf_sva_mut_5_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_27_cse ) begin
      m_buf_sva_mut_6_8 <= m_buf_sva_mut_6_7;
      base_buf_sva_mut_6_8 <= base_buf_sva_mut_6_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_28_cse ) begin
      m_buf_sva_mut_7_8 <= m_buf_sva_mut_7_7;
      base_buf_sva_mut_7_8 <= base_buf_sva_mut_7_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_29_cse ) begin
      m_buf_sva_mut_8_8 <= m_buf_sva_mut_8_7;
      base_buf_sva_mut_8_8 <= base_buf_sva_mut_8_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_30_cse ) begin
      m_buf_sva_mut_9_8 <= m_buf_sva_mut_9_7;
      base_buf_sva_mut_9_8 <= base_buf_sva_mut_9_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_31_cse ) begin
      m_buf_sva_mut_10_8 <= m_buf_sva_mut_10_7;
      base_buf_sva_mut_10_8 <= base_buf_sva_mut_10_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_32_cse ) begin
      m_buf_sva_mut_8 <= m_buf_sva_mut_7;
      base_buf_sva_mut_8 <= base_buf_sva_mut_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_8 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_53 ) begin
      result_rem_11cyc_st_8 <= result_rem_11cyc_st_7;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_33_cse ) begin
      m_buf_sva_mut_1_7 <= m_buf_sva_mut_1_6;
      base_buf_sva_mut_1_7 <= base_buf_sva_mut_1_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_34_cse ) begin
      m_buf_sva_mut_2_7 <= m_buf_sva_mut_2_6;
      base_buf_sva_mut_2_7 <= base_buf_sva_mut_2_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_35_cse ) begin
      m_buf_sva_mut_3_7 <= m_buf_sva_mut_3_6;
      base_buf_sva_mut_3_7 <= base_buf_sva_mut_3_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_36_cse ) begin
      m_buf_sva_mut_4_7 <= m_buf_sva_mut_4_6;
      base_buf_sva_mut_4_7 <= base_buf_sva_mut_4_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_37_cse ) begin
      m_buf_sva_mut_5_7 <= m_buf_sva_mut_5_6;
      base_buf_sva_mut_5_7 <= base_buf_sva_mut_5_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_38_cse ) begin
      m_buf_sva_mut_6_7 <= m_buf_sva_mut_6_6;
      base_buf_sva_mut_6_7 <= base_buf_sva_mut_6_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_39_cse ) begin
      m_buf_sva_mut_7_7 <= m_buf_sva_mut_7_6;
      base_buf_sva_mut_7_7 <= base_buf_sva_mut_7_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_40_cse ) begin
      m_buf_sva_mut_8_7 <= m_buf_sva_mut_8_6;
      base_buf_sva_mut_8_7 <= base_buf_sva_mut_8_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_41_cse ) begin
      m_buf_sva_mut_9_7 <= m_buf_sva_mut_9_6;
      base_buf_sva_mut_9_7 <= base_buf_sva_mut_9_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_42_cse ) begin
      m_buf_sva_mut_10_7 <= m_buf_sva_mut_10_6;
      base_buf_sva_mut_10_7 <= base_buf_sva_mut_10_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_43_cse ) begin
      m_buf_sva_mut_7 <= m_buf_sva_mut_6;
      base_buf_sva_mut_7 <= base_buf_sva_mut_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_7 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_79 ) begin
      result_rem_11cyc_st_7 <= result_rem_11cyc_st_6;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_44_cse ) begin
      m_buf_sva_mut_1_6 <= m_buf_sva_mut_1_5;
      base_buf_sva_mut_1_6 <= base_buf_sva_mut_1_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_45_cse ) begin
      m_buf_sva_mut_2_6 <= m_buf_sva_mut_2_5;
      base_buf_sva_mut_2_6 <= base_buf_sva_mut_2_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_46_cse ) begin
      m_buf_sva_mut_3_6 <= m_buf_sva_mut_3_5;
      base_buf_sva_mut_3_6 <= base_buf_sva_mut_3_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_47_cse ) begin
      m_buf_sva_mut_4_6 <= m_buf_sva_mut_4_5;
      base_buf_sva_mut_4_6 <= base_buf_sva_mut_4_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_48_cse ) begin
      m_buf_sva_mut_5_6 <= m_buf_sva_mut_5_5;
      base_buf_sva_mut_5_6 <= base_buf_sva_mut_5_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_49_cse ) begin
      m_buf_sva_mut_6_6 <= m_buf_sva_mut_6_5;
      base_buf_sva_mut_6_6 <= base_buf_sva_mut_6_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_50_cse ) begin
      m_buf_sva_mut_7_6 <= m_buf_sva_mut_7_5;
      base_buf_sva_mut_7_6 <= base_buf_sva_mut_7_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_51_cse ) begin
      m_buf_sva_mut_8_6 <= m_buf_sva_mut_8_5;
      base_buf_sva_mut_8_6 <= base_buf_sva_mut_8_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_52_cse ) begin
      m_buf_sva_mut_9_6 <= m_buf_sva_mut_9_5;
      base_buf_sva_mut_9_6 <= base_buf_sva_mut_9_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_53_cse ) begin
      m_buf_sva_mut_10_6 <= m_buf_sva_mut_10_5;
      base_buf_sva_mut_10_6 <= base_buf_sva_mut_10_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_54_cse ) begin
      m_buf_sva_mut_6 <= m_buf_sva_mut_5;
      base_buf_sva_mut_6 <= base_buf_sva_mut_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_6 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_105 ) begin
      result_rem_11cyc_st_6 <= result_rem_11cyc_st_5;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_55_cse ) begin
      m_buf_sva_mut_1_5 <= m_buf_sva_mut_1_4;
      base_buf_sva_mut_1_5 <= base_buf_sva_mut_1_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_56_cse ) begin
      m_buf_sva_mut_2_5 <= m_buf_sva_mut_2_4;
      base_buf_sva_mut_2_5 <= base_buf_sva_mut_2_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_57_cse ) begin
      m_buf_sva_mut_3_5 <= m_buf_sva_mut_3_4;
      base_buf_sva_mut_3_5 <= base_buf_sva_mut_3_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_58_cse ) begin
      m_buf_sva_mut_4_5 <= m_buf_sva_mut_4_4;
      base_buf_sva_mut_4_5 <= base_buf_sva_mut_4_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_59_cse ) begin
      m_buf_sva_mut_5_5 <= m_buf_sva_mut_5_4;
      base_buf_sva_mut_5_5 <= base_buf_sva_mut_5_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_60_cse ) begin
      m_buf_sva_mut_6_5 <= m_buf_sva_mut_6_4;
      base_buf_sva_mut_6_5 <= base_buf_sva_mut_6_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_61_cse ) begin
      m_buf_sva_mut_7_5 <= m_buf_sva_mut_7_4;
      base_buf_sva_mut_7_5 <= base_buf_sva_mut_7_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_62_cse ) begin
      m_buf_sva_mut_8_5 <= m_buf_sva_mut_8_4;
      base_buf_sva_mut_8_5 <= base_buf_sva_mut_8_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_63_cse ) begin
      m_buf_sva_mut_9_5 <= m_buf_sva_mut_9_4;
      base_buf_sva_mut_9_5 <= base_buf_sva_mut_9_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_64_cse ) begin
      m_buf_sva_mut_10_5 <= m_buf_sva_mut_10_4;
      base_buf_sva_mut_10_5 <= base_buf_sva_mut_10_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_65_cse ) begin
      m_buf_sva_mut_5 <= m_buf_sva_mut_4;
      base_buf_sva_mut_5 <= base_buf_sva_mut_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_5 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_130 ) begin
      result_rem_11cyc_st_5 <= result_rem_11cyc_st_4;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_66_cse ) begin
      m_buf_sva_mut_1_4 <= m_buf_sva_mut_1_3;
      base_buf_sva_mut_1_4 <= base_buf_sva_mut_1_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_67_cse ) begin
      m_buf_sva_mut_2_4 <= m_buf_sva_mut_2_3;
      base_buf_sva_mut_2_4 <= base_buf_sva_mut_2_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_68_cse ) begin
      m_buf_sva_mut_3_4 <= m_buf_sva_mut_3_3;
      base_buf_sva_mut_3_4 <= base_buf_sva_mut_3_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_69_cse ) begin
      m_buf_sva_mut_4_4 <= m_buf_sva_mut_4_3;
      base_buf_sva_mut_4_4 <= base_buf_sva_mut_4_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_70_cse ) begin
      m_buf_sva_mut_5_4 <= m_buf_sva_mut_5_3;
      base_buf_sva_mut_5_4 <= base_buf_sva_mut_5_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_71_cse ) begin
      m_buf_sva_mut_6_4 <= m_buf_sva_mut_6_3;
      base_buf_sva_mut_6_4 <= base_buf_sva_mut_6_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_72_cse ) begin
      m_buf_sva_mut_7_4 <= m_buf_sva_mut_7_3;
      base_buf_sva_mut_7_4 <= base_buf_sva_mut_7_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_73_cse ) begin
      m_buf_sva_mut_8_4 <= m_buf_sva_mut_8_3;
      base_buf_sva_mut_8_4 <= base_buf_sva_mut_8_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_74_cse ) begin
      m_buf_sva_mut_9_4 <= m_buf_sva_mut_9_3;
      base_buf_sva_mut_9_4 <= base_buf_sva_mut_9_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_75_cse ) begin
      m_buf_sva_mut_10_4 <= m_buf_sva_mut_10_3;
      base_buf_sva_mut_10_4 <= base_buf_sva_mut_10_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_76_cse ) begin
      m_buf_sva_mut_4 <= m_buf_sva_mut_3;
      base_buf_sva_mut_4 <= base_buf_sva_mut_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_4 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_156 ) begin
      result_rem_11cyc_st_4 <= result_rem_11cyc_st_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_77_cse ) begin
      m_buf_sva_mut_1_3 <= m_buf_sva_mut_1_2;
      base_buf_sva_mut_1_3 <= base_buf_sva_mut_1_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_78_cse ) begin
      m_buf_sva_mut_2_3 <= m_buf_sva_mut_2_2;
      base_buf_sva_mut_2_3 <= base_buf_sva_mut_2_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_79_cse ) begin
      m_buf_sva_mut_3_3 <= m_buf_sva_mut_3_2;
      base_buf_sva_mut_3_3 <= base_buf_sva_mut_3_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_80_cse ) begin
      m_buf_sva_mut_4_3 <= m_buf_sva_mut_4_2;
      base_buf_sva_mut_4_3 <= base_buf_sva_mut_4_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_81_cse ) begin
      m_buf_sva_mut_5_3 <= m_buf_sva_mut_5_2;
      base_buf_sva_mut_5_3 <= base_buf_sva_mut_5_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_82_cse ) begin
      m_buf_sva_mut_6_3 <= m_buf_sva_mut_6_2;
      base_buf_sva_mut_6_3 <= base_buf_sva_mut_6_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_83_cse ) begin
      m_buf_sva_mut_7_3 <= m_buf_sva_mut_7_2;
      base_buf_sva_mut_7_3 <= base_buf_sva_mut_7_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_84_cse ) begin
      m_buf_sva_mut_8_3 <= m_buf_sva_mut_8_2;
      base_buf_sva_mut_8_3 <= base_buf_sva_mut_8_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_85_cse ) begin
      m_buf_sva_mut_9_3 <= m_buf_sva_mut_9_2;
      base_buf_sva_mut_9_3 <= base_buf_sva_mut_9_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_86_cse ) begin
      m_buf_sva_mut_10_3 <= m_buf_sva_mut_10_2;
      base_buf_sva_mut_10_3 <= base_buf_sva_mut_10_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_87_cse ) begin
      m_buf_sva_mut_3 <= m_buf_sva_mut_2;
      base_buf_sva_mut_3 <= base_buf_sva_mut_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_3 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_182 ) begin
      result_rem_11cyc_st_3 <= result_rem_11cyc_st_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_88_cse ) begin
      m_buf_sva_mut_1_2 <= result_rem_12_cmp_1_b;
      base_buf_sva_mut_1_2 <= result_rem_12_cmp_1_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_89_cse ) begin
      m_buf_sva_mut_2_2 <= result_rem_12_cmp_2_b;
      base_buf_sva_mut_2_2 <= result_rem_12_cmp_2_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_90_cse ) begin
      m_buf_sva_mut_3_2 <= result_rem_12_cmp_3_b;
      base_buf_sva_mut_3_2 <= result_rem_12_cmp_3_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_91_cse ) begin
      m_buf_sva_mut_4_2 <= result_rem_12_cmp_4_b;
      base_buf_sva_mut_4_2 <= result_rem_12_cmp_4_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_92_cse ) begin
      m_buf_sva_mut_5_2 <= result_rem_12_cmp_5_b;
      base_buf_sva_mut_5_2 <= result_rem_12_cmp_5_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_93_cse ) begin
      m_buf_sva_mut_6_2 <= result_rem_12_cmp_6_b;
      base_buf_sva_mut_6_2 <= result_rem_12_cmp_6_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_94_cse ) begin
      m_buf_sva_mut_7_2 <= result_rem_12_cmp_7_b;
      base_buf_sva_mut_7_2 <= result_rem_12_cmp_7_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_95_cse ) begin
      m_buf_sva_mut_8_2 <= result_rem_12_cmp_8_b;
      base_buf_sva_mut_8_2 <= result_rem_12_cmp_8_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_96_cse ) begin
      m_buf_sva_mut_9_2 <= result_rem_12_cmp_9_b;
      base_buf_sva_mut_9_2 <= result_rem_12_cmp_9_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_97_cse ) begin
      m_buf_sva_mut_10_2 <= result_rem_12_cmp_10_b;
      base_buf_sva_mut_10_2 <= result_rem_12_cmp_10_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( m_and_98_cse ) begin
      m_buf_sva_mut_2 <= result_rem_12_cmp_b;
      base_buf_sva_mut_2 <= result_rem_12_cmp_a;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc_st_2 <= 4'b0000;
    end
    else if ( ccs_ccore_en & and_dcpl_208 ) begin
      result_rem_11cyc_st_2 <= result_rem_11cyc;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_rem_11cyc <= 4'b0000;
    end
    else if ( ccs_ccore_en & ccs_ccore_start_rsci_idat ) begin
      result_rem_11cyc <= result_result_acc_tmp;
    end
  end

  function automatic [63:0] MUX1HOT_v_64_10_2;
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
    input [9:0] sel;
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
    MUX1HOT_v_64_10_2 = result;
  end
  endfunction


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


  function automatic [1:0] signext_2_1;
    input [0:0] vector;
  begin
    signext_2_1= {{1{vector[0]}}, vector};
  end
  endfunction


  function automatic [3:0] conv_s2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_s2s_3_4 = {vector[2], vector};
  end
  endfunction


  function automatic [3:0] conv_u2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_4 =  {1'b0, vector};
  end
  endfunction


  function automatic [3:0] conv_u2u_2_4 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_4 = {{2{1'b0}}, vector};
  end
  endfunction


  function automatic [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
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
//  Generated date: Thu Aug 26 02:02:10 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output [63:0] q_d;
  input [5:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [5:0] radr;
  output we;
  output [63:0] d;
  output [5:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
  clk, rst, fsm_output, COMP_LOOP_C_28_tr0, COMP_LOOP_C_56_tr0, COMP_LOOP_C_84_tr0,
      COMP_LOOP_C_112_tr0, COMP_LOOP_C_140_tr0, COMP_LOOP_C_168_tr0, COMP_LOOP_C_196_tr0,
      COMP_LOOP_C_224_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input COMP_LOOP_C_28_tr0;
  input COMP_LOOP_C_56_tr0;
  input COMP_LOOP_C_84_tr0;
  input COMP_LOOP_C_112_tr0;
  input COMP_LOOP_C_140_tr0;
  input COMP_LOOP_C_168_tr0;
  input COMP_LOOP_C_196_tr0;
  input COMP_LOOP_C_224_tr0;
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
    VEC_LOOP_C_0 = 8'd227,
    STAGE_LOOP_C_1 = 8'd228,
    main_C_1 = 8'd229;

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
        if ( COMP_LOOP_C_28_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_29;
        end
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
        if ( COMP_LOOP_C_56_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_57;
        end
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
        if ( COMP_LOOP_C_84_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_85;
        end
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
        if ( COMP_LOOP_C_112_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_113;
        end
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
        if ( COMP_LOOP_C_140_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_141;
        end
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
        if ( COMP_LOOP_C_168_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_169;
        end
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
        state_var_NS = COMP_LOOP_C_187;
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
        if ( COMP_LOOP_C_196_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_197;
        end
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
        state_var_NS = COMP_LOOP_C_218;
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
        if ( COMP_LOOP_C_224_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 8'b11100011;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 8'b11100100;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b11100101;
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
  ensig_cgo_iro, ensig_cgo, COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo;
  output COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en = ensig_cgo | ensig_cgo_iro;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_core
// ------------------------------------------------------------------


module inPlaceNTT_DIF_core (
  clk, rst, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz, vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_3_lz, vec_rsc_triosy_0_4_lz, vec_rsc_triosy_0_5_lz, vec_rsc_triosy_0_6_lz,
      vec_rsc_triosy_0_7_lz, vec_rsc_triosy_0_8_lz, vec_rsc_triosy_0_9_lz, vec_rsc_triosy_0_10_lz,
      vec_rsc_triosy_0_11_lz, vec_rsc_triosy_0_12_lz, vec_rsc_triosy_0_13_lz, vec_rsc_triosy_0_14_lz,
      vec_rsc_triosy_0_15_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz, twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz, twiddle_rsc_triosy_0_2_lz, twiddle_rsc_triosy_0_3_lz,
      twiddle_rsc_triosy_0_4_lz, twiddle_rsc_triosy_0_5_lz, twiddle_rsc_triosy_0_6_lz,
      twiddle_rsc_triosy_0_7_lz, twiddle_rsc_triosy_0_8_lz, twiddle_rsc_triosy_0_9_lz,
      twiddle_rsc_triosy_0_10_lz, twiddle_rsc_triosy_0_11_lz, twiddle_rsc_triosy_0_12_lz,
      twiddle_rsc_triosy_0_13_lz, twiddle_rsc_triosy_0_14_lz, twiddle_rsc_triosy_0_15_lz,
      vec_rsc_0_0_i_q_d, vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_1_i_q_d,
      vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_2_i_q_d, vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_3_i_q_d, vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_4_i_q_d,
      vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_5_i_q_d, vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_6_i_q_d, vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_7_i_q_d,
      vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_8_i_q_d, vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_9_i_q_d, vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_10_i_q_d,
      vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_11_i_q_d, vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_12_i_q_d, vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_13_i_q_d,
      vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_14_i_q_d, vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_15_i_q_d, vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_1_i_q_d,
      twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_2_i_q_d,
      twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_3_i_q_d,
      twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_4_i_q_d,
      twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_5_i_q_d,
      twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_6_i_q_d,
      twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_7_i_q_d,
      twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_8_i_q_d,
      twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_9_i_q_d,
      twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_10_i_q_d,
      twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_11_i_q_d,
      twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_12_i_q_d,
      twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_13_i_q_d,
      twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_14_i_q_d,
      twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_15_i_q_d,
      twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d, vec_rsc_0_0_i_d_d_pff,
      vec_rsc_0_0_i_radr_d_pff, vec_rsc_0_0_i_wadr_d_pff, vec_rsc_0_0_i_we_d_pff,
      vec_rsc_0_1_i_we_d_pff, vec_rsc_0_2_i_we_d_pff, vec_rsc_0_3_i_we_d_pff, vec_rsc_0_4_i_we_d_pff,
      vec_rsc_0_5_i_we_d_pff, vec_rsc_0_6_i_we_d_pff, vec_rsc_0_7_i_we_d_pff, vec_rsc_0_8_i_we_d_pff,
      vec_rsc_0_9_i_we_d_pff, vec_rsc_0_10_i_we_d_pff, vec_rsc_0_11_i_we_d_pff, vec_rsc_0_12_i_we_d_pff,
      vec_rsc_0_13_i_we_d_pff, vec_rsc_0_14_i_we_d_pff, vec_rsc_0_15_i_we_d_pff,
      twiddle_rsc_0_0_i_radr_d_pff, twiddle_rsc_0_1_i_radr_d_pff, twiddle_rsc_0_2_i_radr_d_pff,
      twiddle_rsc_0_4_i_radr_d_pff
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
  output vec_rsc_triosy_0_8_lz;
  output vec_rsc_triosy_0_9_lz;
  output vec_rsc_triosy_0_10_lz;
  output vec_rsc_triosy_0_11_lz;
  output vec_rsc_triosy_0_12_lz;
  output vec_rsc_triosy_0_13_lz;
  output vec_rsc_triosy_0_14_lz;
  output vec_rsc_triosy_0_15_lz;
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
  output twiddle_rsc_triosy_0_8_lz;
  output twiddle_rsc_triosy_0_9_lz;
  output twiddle_rsc_triosy_0_10_lz;
  output twiddle_rsc_triosy_0_11_lz;
  output twiddle_rsc_triosy_0_12_lz;
  output twiddle_rsc_triosy_0_13_lz;
  output twiddle_rsc_triosy_0_14_lz;
  output twiddle_rsc_triosy_0_15_lz;
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
  input [63:0] vec_rsc_0_8_i_q_d;
  output vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_9_i_q_d;
  output vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_10_i_q_d;
  output vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_11_i_q_d;
  output vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_12_i_q_d;
  output vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_13_i_q_d;
  output vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_14_i_q_d;
  output vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] vec_rsc_0_15_i_q_d;
  output vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_0_i_q_d;
  output twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_1_i_q_d;
  output twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_2_i_q_d;
  output twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_3_i_q_d;
  output twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_4_i_q_d;
  output twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_5_i_q_d;
  output twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_6_i_q_d;
  output twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_7_i_q_d;
  output twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_8_i_q_d;
  output twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_9_i_q_d;
  output twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_10_i_q_d;
  output twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_11_i_q_d;
  output twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_12_i_q_d;
  output twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_13_i_q_d;
  output twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_14_i_q_d;
  output twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_15_i_q_d;
  output twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d;
  output [63:0] vec_rsc_0_0_i_d_d_pff;
  output [5:0] vec_rsc_0_0_i_radr_d_pff;
  output [5:0] vec_rsc_0_0_i_wadr_d_pff;
  output vec_rsc_0_0_i_we_d_pff;
  output vec_rsc_0_1_i_we_d_pff;
  output vec_rsc_0_2_i_we_d_pff;
  output vec_rsc_0_3_i_we_d_pff;
  output vec_rsc_0_4_i_we_d_pff;
  output vec_rsc_0_5_i_we_d_pff;
  output vec_rsc_0_6_i_we_d_pff;
  output vec_rsc_0_7_i_we_d_pff;
  output vec_rsc_0_8_i_we_d_pff;
  output vec_rsc_0_9_i_we_d_pff;
  output vec_rsc_0_10_i_we_d_pff;
  output vec_rsc_0_11_i_we_d_pff;
  output vec_rsc_0_12_i_we_d_pff;
  output vec_rsc_0_13_i_we_d_pff;
  output vec_rsc_0_14_i_we_d_pff;
  output vec_rsc_0_15_i_we_d_pff;
  output [5:0] twiddle_rsc_0_0_i_radr_d_pff;
  output [5:0] twiddle_rsc_0_1_i_radr_d_pff;
  output [5:0] twiddle_rsc_0_2_i_radr_d_pff;
  output [5:0] twiddle_rsc_0_4_i_radr_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  wire [63:0] COMP_LOOP_1_modulo_dev_cmp_return_rsc_z;
  wire COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en;
  wire [7:0] fsm_output;
  wire and_dcpl_4;
  wire nor_tmp;
  wire mux_tmp_6;
  wire mux_tmp_8;
  wire nor_tmp_13;
  wire nor_tmp_15;
  wire nor_tmp_16;
  wire nor_tmp_17;
  wire not_tmp_39;
  wire nor_tmp_42;
  wire not_tmp_64;
  wire not_tmp_68;
  wire nor_tmp_57;
  wire not_tmp_120;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_34;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_39;
  wire and_tmp_12;
  wire mux_tmp_264;
  wire and_tmp_13;
  wire and_dcpl_41;
  wire xor_dcpl_2;
  wire and_dcpl_45;
  wire and_dcpl_46;
  wire and_dcpl_47;
  wire and_dcpl_48;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire and_dcpl_54;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire and_dcpl_64;
  wire and_dcpl_66;
  wire and_dcpl_68;
  wire and_dcpl_69;
  wire and_dcpl_71;
  wire and_dcpl_73;
  wire and_dcpl_75;
  wire and_dcpl_76;
  wire and_dcpl_78;
  wire and_dcpl_80;
  wire and_dcpl_82;
  wire or_tmp_160;
  wire mux_tmp_278;
  wire or_tmp_170;
  wire not_tmp_143;
  wire not_tmp_144;
  wire not_tmp_146;
  wire or_tmp_220;
  wire not_tmp_160;
  wire mux_tmp_338;
  wire or_tmp_278;
  wire not_tmp_168;
  wire not_tmp_170;
  wire not_tmp_173;
  wire not_tmp_184;
  wire mux_tmp_398;
  wire mux_tmp_458;
  wire not_tmp_226;
  wire mux_tmp_518;
  wire not_tmp_229;
  wire not_tmp_237;
  wire mux_tmp_578;
  wire not_tmp_273;
  wire mux_tmp_638;
  wire not_tmp_277;
  wire mux_tmp_698;
  wire and_dcpl_128;
  wire and_dcpl_129;
  wire and_dcpl_130;
  wire and_dcpl_131;
  wire and_dcpl_132;
  wire and_dcpl_133;
  wire and_dcpl_134;
  wire and_dcpl_135;
  wire and_dcpl_137;
  wire and_dcpl_138;
  wire nand_tmp_99;
  wire or_tmp_1059;
  wire mux_tmp_826;
  wire and_dcpl_165;
  wire and_dcpl_167;
  wire and_dcpl_171;
  wire and_dcpl_174;
  wire and_dcpl_179;
  wire and_dcpl_180;
  wire and_dcpl_182;
  wire and_dcpl_185;
  wire or_tmp_1063;
  wire nand_tmp_100;
  wire mux_tmp_832;
  wire not_tmp_371;
  wire mux_tmp_840;
  wire or_tmp_1076;
  wire or_dcpl_55;
  wire mux_tmp_847;
  wire mux_tmp_848;
  wire mux_tmp_849;
  wire mux_tmp_853;
  wire mux_tmp_855;
  wire mux_tmp_856;
  wire mux_tmp_857;
  wire mux_tmp_859;
  wire not_tmp_382;
  wire mux_tmp_862;
  wire not_tmp_385;
  wire mux_tmp_866;
  wire and_dcpl_200;
  wire mux_tmp_873;
  wire mux_tmp_876;
  wire mux_tmp_885;
  wire and_dcpl_204;
  wire and_dcpl_207;
  wire mux_tmp_897;
  wire mux_tmp_900;
  wire mux_tmp_909;
  wire and_dcpl_208;
  wire mux_tmp_916;
  wire mux_tmp_921;
  wire mux_tmp_930;
  wire and_dcpl_211;
  wire and_dcpl_214;
  wire or_tmp_1101;
  wire nor_tmp_177;
  wire mux_tmp_982;
  wire mux_tmp_984;
  wire mux_tmp_991;
  wire mux_tmp_994;
  reg COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm;
  wire [9:0] COMP_LOOP_acc_1_cse_6_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_6_sva_1;
  reg [9:0] VEC_LOOP_j_10_0_sva_9_0;
  wire [9:0] COMP_LOOP_acc_1_cse_4_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_4_sva_1;
  reg [6:0] COMP_LOOP_k_10_3_sva_6_0;
  reg COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm;
  reg COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm;
  reg COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm;
  reg COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm;
  reg [9:0] COMP_LOOP_2_tmp_lshift_ncse_sva;
  reg [9:0] COMP_LOOP_2_tmp_mul_idiv_sva;
  reg COMP_LOOP_tmp_nor_1_itm;
  reg [8:0] COMP_LOOP_3_tmp_lshift_ncse_sva;
  reg COMP_LOOP_tmp_nor_14_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm;
  reg [9:0] COMP_LOOP_acc_1_cse_6_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_sva;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_2_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_4_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_6_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_2_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_4_sva;
  reg [8:0] COMP_LOOP_acc_14_psp_sva;
  wire [9:0] nl_COMP_LOOP_acc_14_psp_sva;
  reg [7:0] COMP_LOOP_acc_13_psp_sva;
  wire [8:0] nl_COMP_LOOP_acc_13_psp_sva;
  reg [6:0] COMP_LOOP_acc_psp_sva;
  reg [8:0] COMP_LOOP_acc_11_psp_sva;
  wire [9:0] nl_COMP_LOOP_acc_11_psp_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_7_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_5_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_1_sva;
  reg [9:0] COMP_LOOP_acc_10_cse_10_1_3_sva;
  reg [7:0] COMP_LOOP_5_tmp_mul_idiv_sva;
  reg COMP_LOOP_1_tmp_mul_idiv_sva_0;
  reg [10:0] STAGE_LOOP_lshift_psp_sva;
  wire [9:0] COMP_LOOP_acc_1_cse_2_sva_1;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_2_sva_1;
  wire [6:0] COMP_LOOP_acc_psp_sva_mx0w0;
  wire [7:0] nl_COMP_LOOP_acc_psp_sva_mx0w0;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_63_rgt;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_65_rgt;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_69_rgt;
  wire mux_1017_tmp;
  wire and_245_m1c;
  wire and_240_tmp;
  wire nor_tmp_180;
  wire nor_568_tmp;
  wire and_237_tmp;
  reg [6:0] reg_COMP_LOOP_k_10_3_ftd;
  wire and_334_cse;
  wire nand_199_cse;
  wire nand_186_cse;
  wire nand_172_cse;
  wire nand_165_cse;
  wire nand_153_cse;
  wire nand_168_cse;
  wire nand_154_cse;
  wire nand_132_cse;
  wire nand_114_cse;
  wire nand_113_cse;
  reg reg_vec_rsc_triosy_0_15_obj_ld_cse;
  reg reg_ensig_cgo_cse;
  wire or_93_cse;
  wire or_60_cse;
  wire or_41_cse;
  wire COMP_LOOP_tmp_or_cse;
  wire COMP_LOOP_tmp_or_3_cse;
  wire COMP_LOOP_tmp_or_5_cse;
  wire or_1233_cse;
  wire and_344_cse;
  wire or_139_cse;
  wire or_1226_cse;
  wire nor_543_cse;
  wire or_215_cse;
  wire or_206_cse;
  wire nor_101_cse;
  wire nor_99_cse;
  wire or_632_cse;
  wire or_624_cse;
  wire and_292_cse;
  wire and_293_cse;
  wire mux_120_cse;
  wire and_363_cse;
  wire and_393_cse;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm;
  wire and_364_cse;
  wire mux_84_cse;
  wire or_1220_cse;
  wire mux_85_cse;
  wire mux_205_cse;
  wire mux_842_rmff;
  reg [63:0] COMP_LOOP_1_acc_8_itm;
  reg [63:0] COMP_LOOP_tmp_mux_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_1_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_2_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_3_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_4_itm;
  reg [63:0] COMP_LOOP_tmp_mux1h_5_itm;
  reg [63:0] tmp_21_sva_1;
  reg [63:0] p_sva;
  wire mux_873_itm;
  wire mux_939_itm;
  wire mux_946_itm;
  wire mux_948_itm;
  wire mux_958_itm;
  wire [10:0] z_out;
  wire [9:0] z_out_1;
  wire and_dcpl_254;
  wire and_dcpl_255;
  wire and_dcpl_257;
  wire and_dcpl_258;
  wire and_dcpl_260;
  wire and_dcpl_261;
  wire and_dcpl_263;
  wire and_dcpl_264;
  wire and_dcpl_266;
  wire and_dcpl_267;
  wire and_dcpl_272;
  wire and_dcpl_273;
  wire and_dcpl_274;
  wire [9:0] z_out_2;
  wire [19:0] nl_z_out_2;
  wire and_dcpl_283;
  wire and_dcpl_284;
  wire and_dcpl_286;
  wire and_dcpl_288;
  wire and_dcpl_289;
  wire and_dcpl_292;
  wire and_dcpl_295;
  wire and_dcpl_298;
  wire and_dcpl_299;
  wire and_dcpl_301;
  wire and_dcpl_302;
  wire and_dcpl_303;
  wire and_dcpl_304;
  wire and_dcpl_307;
  wire and_dcpl_309;
  wire [63:0] z_out_3;
  wire [127:0] nl_z_out_3;
  wire [7:0] z_out_4;
  wire [8:0] nl_z_out_4;
  wire and_dcpl_324;
  wire and_dcpl_335;
  wire [10:0] z_out_5;
  wire and_dcpl_348;
  wire [3:0] z_out_6;
  wire [4:0] nl_z_out_6;
  wire and_dcpl_356;
  wire and_dcpl_360;
  wire and_dcpl_373;
  wire and_dcpl_421;
  wire and_dcpl_425;
  wire [63:0] z_out_9;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [3:0] COMP_LOOP_1_tmp_acc_cse_sva;
  reg [63:0] tmp_21_sva_2;
  reg [63:0] tmp_21_sva_3;
  reg [63:0] tmp_21_sva_5;
  reg [63:0] tmp_21_sva_6;
  reg [63:0] tmp_21_sva_7;
  reg [63:0] tmp_21_sva_9;
  reg [63:0] tmp_21_sva_11;
  reg [63:0] tmp_21_sva_13;
  reg [63:0] tmp_21_sva_14;
  reg [63:0] tmp_21_sva_15;
  reg COMP_LOOP_COMP_LOOP_nor_itm;
  reg COMP_LOOP_COMP_LOOP_and_6_itm;
  reg COMP_LOOP_COMP_LOOP_and_10_itm;
  reg COMP_LOOP_COMP_LOOP_and_12_itm;
  reg COMP_LOOP_COMP_LOOP_and_13_itm;
  reg COMP_LOOP_COMP_LOOP_and_14_itm;
  reg COMP_LOOP_COMP_LOOP_and_62_itm;
  reg COMP_LOOP_COMP_LOOP_and_64_itm;
  reg COMP_LOOP_COMP_LOOP_and_65_itm;
  reg COMP_LOOP_COMP_LOOP_and_66_itm;
  reg COMP_LOOP_COMP_LOOP_and_68_itm;
  reg COMP_LOOP_COMP_LOOP_and_69_itm;
  reg COMP_LOOP_COMP_LOOP_and_70_itm;
  reg COMP_LOOP_COMP_LOOP_and_72_itm;
  reg COMP_LOOP_COMP_LOOP_nor_5_itm;
  reg COMP_LOOP_nor_51_itm;
  reg COMP_LOOP_nor_52_itm;
  reg COMP_LOOP_COMP_LOOP_and_77_itm;
  reg COMP_LOOP_nor_54_itm;
  reg COMP_LOOP_COMP_LOOP_and_79_itm;
  reg COMP_LOOP_COMP_LOOP_and_80_itm;
  reg COMP_LOOP_COMP_LOOP_and_81_itm;
  reg COMP_LOOP_nor_57_itm;
  reg COMP_LOOP_COMP_LOOP_and_83_itm;
  reg COMP_LOOP_COMP_LOOP_and_84_itm;
  reg COMP_LOOP_COMP_LOOP_and_85_itm;
  reg COMP_LOOP_COMP_LOOP_and_86_itm;
  reg COMP_LOOP_COMP_LOOP_and_87_itm;
  reg COMP_LOOP_COMP_LOOP_and_88_itm;
  reg COMP_LOOP_COMP_LOOP_and_89_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm;
  reg COMP_LOOP_COMP_LOOP_nor_9_itm;
  reg COMP_LOOP_nor_91_itm;
  reg COMP_LOOP_nor_92_itm;
  reg COMP_LOOP_COMP_LOOP_and_137_itm;
  reg COMP_LOOP_nor_94_itm;
  reg COMP_LOOP_COMP_LOOP_and_139_itm;
  reg COMP_LOOP_COMP_LOOP_and_140_itm;
  reg COMP_LOOP_COMP_LOOP_and_141_itm;
  reg COMP_LOOP_nor_97_itm;
  reg COMP_LOOP_COMP_LOOP_and_143_itm;
  reg COMP_LOOP_COMP_LOOP_and_144_itm;
  reg COMP_LOOP_COMP_LOOP_and_145_itm;
  reg COMP_LOOP_COMP_LOOP_and_146_itm;
  reg COMP_LOOP_COMP_LOOP_and_147_itm;
  reg COMP_LOOP_COMP_LOOP_and_148_itm;
  reg COMP_LOOP_COMP_LOOP_and_149_itm;
  reg COMP_LOOP_COMP_LOOP_and_185_itm;
  reg COMP_LOOP_COMP_LOOP_nor_13_itm;
  reg COMP_LOOP_nor_131_itm;
  reg COMP_LOOP_nor_132_itm;
  reg COMP_LOOP_COMP_LOOP_and_197_itm;
  reg COMP_LOOP_nor_134_itm;
  reg COMP_LOOP_COMP_LOOP_and_199_itm;
  reg COMP_LOOP_COMP_LOOP_and_200_itm;
  reg COMP_LOOP_COMP_LOOP_and_201_itm;
  reg COMP_LOOP_nor_137_itm;
  reg COMP_LOOP_COMP_LOOP_and_203_itm;
  reg COMP_LOOP_COMP_LOOP_and_204_itm;
  reg COMP_LOOP_COMP_LOOP_and_205_itm;
  reg COMP_LOOP_COMP_LOOP_and_206_itm;
  reg COMP_LOOP_COMP_LOOP_and_207_itm;
  reg COMP_LOOP_COMP_LOOP_and_208_itm;
  reg COMP_LOOP_COMP_LOOP_and_209_itm;
  reg COMP_LOOP_tmp_nor_16_itm;
  reg COMP_LOOP_tmp_nor_19_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm;
  reg COMP_LOOP_COMP_LOOP_nor_17_itm;
  reg COMP_LOOP_nor_171_itm;
  reg COMP_LOOP_nor_172_itm;
  reg COMP_LOOP_COMP_LOOP_and_257_itm;
  reg COMP_LOOP_nor_174_itm;
  reg COMP_LOOP_COMP_LOOP_and_259_itm;
  reg COMP_LOOP_COMP_LOOP_and_260_itm;
  reg COMP_LOOP_COMP_LOOP_and_261_itm;
  reg COMP_LOOP_nor_177_itm;
  reg COMP_LOOP_COMP_LOOP_and_263_itm;
  reg COMP_LOOP_COMP_LOOP_and_264_itm;
  reg COMP_LOOP_COMP_LOOP_and_265_itm;
  reg COMP_LOOP_COMP_LOOP_and_266_itm;
  reg COMP_LOOP_COMP_LOOP_and_267_itm;
  reg COMP_LOOP_COMP_LOOP_and_268_itm;
  reg COMP_LOOP_COMP_LOOP_and_269_itm;
  reg COMP_LOOP_COMP_LOOP_and_305_itm;
  reg COMP_LOOP_COMP_LOOP_nor_21_itm;
  reg COMP_LOOP_nor_211_itm;
  reg COMP_LOOP_nor_212_itm;
  reg COMP_LOOP_COMP_LOOP_and_317_itm;
  reg COMP_LOOP_nor_214_itm;
  reg COMP_LOOP_COMP_LOOP_and_319_itm;
  reg COMP_LOOP_COMP_LOOP_and_320_itm;
  reg COMP_LOOP_COMP_LOOP_and_321_itm;
  reg COMP_LOOP_nor_217_itm;
  reg COMP_LOOP_COMP_LOOP_and_323_itm;
  reg COMP_LOOP_COMP_LOOP_and_324_itm;
  reg COMP_LOOP_COMP_LOOP_and_325_itm;
  reg COMP_LOOP_COMP_LOOP_and_326_itm;
  reg COMP_LOOP_COMP_LOOP_and_327_itm;
  reg COMP_LOOP_COMP_LOOP_and_328_itm;
  reg COMP_LOOP_COMP_LOOP_and_329_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm;
  reg COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm;
  reg COMP_LOOP_COMP_LOOP_nor_25_itm;
  reg COMP_LOOP_nor_251_itm;
  reg COMP_LOOP_nor_252_itm;
  reg COMP_LOOP_COMP_LOOP_and_377_itm;
  reg COMP_LOOP_nor_254_itm;
  reg COMP_LOOP_COMP_LOOP_and_379_itm;
  reg COMP_LOOP_COMP_LOOP_and_380_itm;
  reg COMP_LOOP_COMP_LOOP_and_381_itm;
  reg COMP_LOOP_nor_257_itm;
  reg COMP_LOOP_COMP_LOOP_and_383_itm;
  reg COMP_LOOP_COMP_LOOP_and_384_itm;
  reg COMP_LOOP_COMP_LOOP_and_385_itm;
  reg COMP_LOOP_COMP_LOOP_and_386_itm;
  reg COMP_LOOP_COMP_LOOP_and_387_itm;
  reg COMP_LOOP_COMP_LOOP_and_388_itm;
  reg COMP_LOOP_COMP_LOOP_and_389_itm;
  reg COMP_LOOP_COMP_LOOP_nor_29_itm;
  reg COMP_LOOP_nor_291_itm;
  reg COMP_LOOP_nor_292_itm;
  reg COMP_LOOP_COMP_LOOP_and_437_itm;
  reg COMP_LOOP_nor_294_itm;
  reg COMP_LOOP_COMP_LOOP_and_439_itm;
  reg COMP_LOOP_COMP_LOOP_and_440_itm;
  reg COMP_LOOP_COMP_LOOP_and_441_itm;
  reg COMP_LOOP_nor_297_itm;
  reg COMP_LOOP_COMP_LOOP_and_443_itm;
  reg COMP_LOOP_COMP_LOOP_and_444_itm;
  reg COMP_LOOP_COMP_LOOP_and_445_itm;
  reg COMP_LOOP_COMP_LOOP_and_446_itm;
  reg COMP_LOOP_COMP_LOOP_and_447_itm;
  reg COMP_LOOP_COMP_LOOP_and_448_itm;
  reg COMP_LOOP_COMP_LOOP_and_449_itm;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire VEC_LOOP_j_10_0_sva_9_0_mx0c0;
  wire COMP_LOOP_tmp_mux_itm_mx0c1;
  wire COMP_LOOP_1_acc_8_itm_mx0c2;
  wire COMP_LOOP_1_acc_8_itm_mx0c3;
  wire tmp_21_sva_1_mx0c0;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_78;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_80;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_82;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_84;
  reg [2:0] COMP_LOOP_3_tmp_mul_idiv_sva_2_0;
  wire COMP_LOOP_or_35_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse;
  wire COMP_LOOP_or_34_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse;
  wire COMP_LOOP_tmp_nor_1_cse;
  wire COMP_LOOP_or_24_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse;
  wire COMP_LOOP_tmp_nor_3_cse;
  wire COMP_LOOP_tmp_nor_13_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_nor_cse;
  wire COMP_LOOP_tmp_COMP_LOOP_tmp_and_21_cse;
  wire COMP_LOOP_or_25_cse;
  wire nor_267_cse;
  wire nor_261_cse;
  wire nor_257_cse;
  wire nor_256_cse;
  wire nor_251_cse;
  wire nor_240_cse;
  wire nor_236_cse;
  wire nor_235_cse;
  wire nor_230_cse;
  wire nor_224_cse;
  wire nor_218_cse;
  wire nor_214_cse;
  wire nor_213_cse;
  wire nor_208_cse;
  wire nor_197_cse;
  wire nor_194_cse;
  wire and_263_cse;
  wire and_261_cse;
  wire nor_625_cse;
  wire and_545_cse;
  wire and_556_cse;
  wire and_541_cse;
  wire and_548_cse;
  wire and_552_cse;
  wire and_558_cse;
  wire or_170_cse_1;
  wire nor_652_cse;
  wire COMP_LOOP_or_20_itm;
  wire COMP_LOOP_tmp_or_45_itm;
  wire COMP_LOOP_or_17_itm;
  wire [9:0] COMP_LOOP_1_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_2_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_3_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_4_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_5_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_6_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_7_acc_10_itm_10_1_1;
  wire [9:0] COMP_LOOP_8_acc_10_itm_10_1_1;
  wire COMP_LOOP_tmp_or_28_ssc;
  wire COMP_LOOP_tmp_nor_59_cse;
  wire [63:0] COMP_LOOP_mux_209_cse;

  wire[0:0] mux_285_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] mux_841_nl;
  wire[0:0] mux_840_nl;
  wire[0:0] or_1107_nl;
  wire[0:0] mux_838_nl;
  wire[0:0] mux_837_nl;
  wire[0:0] nor_189_nl;
  wire[0:0] VEC_LOOP_j_not_1_nl;
  wire[0:0] nand_240_nl;
  wire[0:0] mux_858_nl;
  wire[0:0] and_335_nl;
  wire[0:0] or_1265_nl;
  wire[0:0] nand_241_nl;
  wire[0:0] mux_1023_nl;
  wire[0:0] mux_1022_nl;
  wire[0:0] nor_653_nl;
  wire[0:0] mux_nl;
  wire[0:0] or_1266_nl;
  wire[0:0] nor_654_nl;
  wire[0:0] mux_879_nl;
  wire[0:0] mux_135_nl;
  wire[0:0] mux_884_nl;
  wire[0:0] mux_883_nl;
  wire[0:0] mux_882_nl;
  wire[0:0] mux_887_nl;
  wire[0:0] mux_21_nl;
  wire[0:0] nand_232_nl;
  wire[0:0] mux_889_nl;
  wire[0:0] mux_23_nl;
  wire[10:0] COMP_LOOP_3_acc_nl;
  wire[11:0] nl_COMP_LOOP_3_acc_nl;
  wire[0:0] mux_891_nl;
  wire[0:0] mux_899_nl;
  wire[0:0] mux_898_nl;
  wire[0:0] mux_897_nl;
  wire[0:0] mux_896_nl;
  wire[0:0] mux_902_nl;
  wire[0:0] mux_901_nl;
  wire[0:0] mux_900_nl;
  wire[8:0] COMP_LOOP_acc_12_nl;
  wire[9:0] nl_COMP_LOOP_acc_12_nl;
  wire[0:0] mux_905_nl;
  wire[0:0] mux_909_nl;
  wire[0:0] mux_82_nl;
  wire[10:0] COMP_LOOP_5_acc_nl;
  wire[11:0] nl_COMP_LOOP_5_acc_nl;
  wire[0:0] mux_912_nl;
  wire[0:0] mux_922_nl;
  wire[0:0] mux_921_nl;
  wire[0:0] mux_920_nl;
  wire[0:0] mux_925_nl;
  wire[0:0] mux_924_nl;
  wire[10:0] COMP_LOOP_6_acc_nl;
  wire[11:0] nl_COMP_LOOP_6_acc_nl;
  wire[0:0] mux_932_nl;
  wire[10:0] COMP_LOOP_7_acc_nl;
  wire[11:0] nl_COMP_LOOP_7_acc_nl;
  wire[0:0] mux_942_nl;
  wire[0:0] mux_941_nl;
  wire[0:0] mux_944_nl;
  wire[7:0] COMP_LOOP_acc_15_nl;
  wire[8:0] nl_COMP_LOOP_acc_15_nl;
  wire[0:0] mux_951_nl;
  wire[0:0] mux_950_nl;
  wire[0:0] mux_225_nl;
  wire[10:0] COMP_LOOP_1_acc_nl;
  wire[11:0] nl_COMP_LOOP_1_acc_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_17_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_17_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_37_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_19_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_19_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_38_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_20_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_20_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_39_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_21_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_23_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_24_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_25_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_26_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_27_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_28_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_29_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nor_1_nl;
  wire[0:0] COMP_LOOP_nor_11_nl;
  wire[0:0] COMP_LOOP_nor_12_nl;
  wire[0:0] COMP_LOOP_nor_14_nl;
  wire[0:0] COMP_LOOP_nor_17_nl;
  wire[63:0] COMP_LOOP_acc_17_nl;
  wire[64:0] nl_COMP_LOOP_acc_17_nl;
  wire[63:0] COMP_LOOP_COMP_LOOP_mux_2_nl;
  wire[0:0] COMP_LOOP_or_nl;
  wire[0:0] COMP_LOOP_or_1_nl;
  wire[0:0] COMP_LOOP_or_2_nl;
  wire[0:0] COMP_LOOP_or_3_nl;
  wire[0:0] COMP_LOOP_or_4_nl;
  wire[0:0] COMP_LOOP_or_5_nl;
  wire[0:0] COMP_LOOP_or_6_nl;
  wire[0:0] COMP_LOOP_or_7_nl;
  wire[0:0] COMP_LOOP_or_8_nl;
  wire[0:0] COMP_LOOP_or_9_nl;
  wire[0:0] COMP_LOOP_or_10_nl;
  wire[0:0] COMP_LOOP_or_11_nl;
  wire[0:0] COMP_LOOP_or_12_nl;
  wire[0:0] COMP_LOOP_or_13_nl;
  wire[0:0] COMP_LOOP_or_14_nl;
  wire[0:0] COMP_LOOP_or_15_nl;
  wire[0:0] COMP_LOOP_tmp_and_63_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_1_nl;
  wire[0:0] COMP_LOOP_tmp_and_64_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_3_nl;
  wire[0:0] COMP_LOOP_tmp_and_65_nl;
  wire[0:0] COMP_LOOP_tmp_and_66_nl;
  wire[0:0] COMP_LOOP_tmp_and_67_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_7_nl;
  wire[0:0] COMP_LOOP_tmp_and_68_nl;
  wire[0:0] COMP_LOOP_tmp_and_69_nl;
  wire[0:0] COMP_LOOP_tmp_and_70_nl;
  wire[0:0] COMP_LOOP_tmp_and_71_nl;
  wire[0:0] COMP_LOOP_tmp_and_72_nl;
  wire[0:0] COMP_LOOP_tmp_and_73_nl;
  wire[0:0] COMP_LOOP_tmp_and_74_nl;
  wire[0:0] COMP_LOOP_tmp_and_58_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_nl;
  wire[0:0] COMP_LOOP_tmp_and_59_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_18_nl;
  wire[0:0] COMP_LOOP_tmp_and_60_nl;
  wire[0:0] COMP_LOOP_tmp_and_61_nl;
  wire[0:0] COMP_LOOP_tmp_and_62_nl;
  wire[0:0] COMP_LOOP_tmp_and_42_nl;
  wire[0:0] COMP_LOOP_tmp_and_43_nl;
  wire[0:0] COMP_LOOP_tmp_and_44_nl;
  wire[0:0] COMP_LOOP_tmp_and_45_nl;
  wire[0:0] COMP_LOOP_tmp_and_46_nl;
  wire[0:0] COMP_LOOP_tmp_and_47_nl;
  wire[0:0] COMP_LOOP_tmp_and_48_nl;
  wire[0:0] COMP_LOOP_tmp_and_49_nl;
  wire[0:0] COMP_LOOP_tmp_and_50_nl;
  wire[0:0] COMP_LOOP_tmp_and_51_nl;
  wire[0:0] COMP_LOOP_tmp_and_52_nl;
  wire[0:0] COMP_LOOP_tmp_and_53_nl;
  wire[0:0] COMP_LOOP_tmp_and_54_nl;
  wire[0:0] COMP_LOOP_tmp_and_55_nl;
  wire[0:0] COMP_LOOP_tmp_and_56_nl;
  wire[0:0] COMP_LOOP_tmp_and_57_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_nor_3_nl;
  wire[0:0] COMP_LOOP_tmp_and_38_nl;
  wire[0:0] COMP_LOOP_tmp_and_39_nl;
  wire[0:0] COMP_LOOP_tmp_and_40_nl;
  wire[0:0] COMP_LOOP_tmp_and_41_nl;
  wire[0:0] COMP_LOOP_tmp_and_23_nl;
  wire[0:0] COMP_LOOP_tmp_and_24_nl;
  wire[0:0] COMP_LOOP_tmp_and_25_nl;
  wire[0:0] COMP_LOOP_tmp_and_26_nl;
  wire[0:0] COMP_LOOP_tmp_and_27_nl;
  wire[0:0] COMP_LOOP_tmp_and_28_nl;
  wire[0:0] COMP_LOOP_tmp_and_29_nl;
  wire[0:0] COMP_LOOP_tmp_and_30_nl;
  wire[0:0] COMP_LOOP_tmp_and_31_nl;
  wire[0:0] COMP_LOOP_tmp_and_32_nl;
  wire[0:0] COMP_LOOP_tmp_and_33_nl;
  wire[0:0] COMP_LOOP_tmp_and_34_nl;
  wire[0:0] COMP_LOOP_tmp_and_35_nl;
  wire[0:0] COMP_LOOP_tmp_and_36_nl;
  wire[0:0] COMP_LOOP_tmp_and_37_nl;
  wire[0:0] mux_1009_nl;
  wire[0:0] mux_1008_nl;
  wire[0:0] mux_1007_nl;
  wire[0:0] mux_1006_nl;
  wire[0:0] mux_1005_nl;
  wire[0:0] mux_1004_nl;
  wire[0:0] mux_1002_nl;
  wire[0:0] mux_1016_nl;
  wire[0:0] mux_1015_nl;
  wire[0:0] mux_1014_nl;
  wire[0:0] mux_1012_nl;
  wire[0:0] mux_1011_nl;
  wire[0:0] COMP_LOOP_tmp_and_7_nl;
  wire[0:0] COMP_LOOP_tmp_and_8_nl;
  wire[0:0] COMP_LOOP_tmp_and_9_nl;
  wire[0:0] COMP_LOOP_tmp_and_10_nl;
  wire[0:0] COMP_LOOP_tmp_and_11_nl;
  wire[0:0] COMP_LOOP_tmp_and_12_nl;
  wire[0:0] COMP_LOOP_tmp_and_13_nl;
  wire[0:0] COMP_LOOP_tmp_and_14_nl;
  wire[0:0] COMP_LOOP_tmp_and_15_nl;
  wire[0:0] COMP_LOOP_tmp_and_16_nl;
  wire[0:0] COMP_LOOP_tmp_and_17_nl;
  wire[0:0] COMP_LOOP_tmp_and_18_nl;
  wire[0:0] COMP_LOOP_tmp_and_19_nl;
  wire[0:0] COMP_LOOP_tmp_and_20_nl;
  wire[0:0] COMP_LOOP_tmp_and_21_nl;
  wire[0:0] COMP_LOOP_tmp_and_22_nl;
  wire[0:0] COMP_LOOP_tmp_and_nl;
  wire[0:0] COMP_LOOP_tmp_and_1_nl;
  wire[0:0] COMP_LOOP_tmp_and_2_nl;
  wire[0:0] COMP_LOOP_tmp_and_3_nl;
  wire[0:0] COMP_LOOP_tmp_and_4_nl;
  wire[0:0] COMP_LOOP_tmp_and_5_nl;
  wire[0:0] COMP_LOOP_tmp_and_6_nl;
  wire[0:0] mux_1021_nl;
  wire[0:0] mux_1020_nl;
  wire[0:0] mux_1019_nl;
  wire[0:0] mux_1018_nl;
  wire[10:0] COMP_LOOP_1_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_1_acc_10_nl;
  wire[10:0] COMP_LOOP_2_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_2_acc_10_nl;
  wire[10:0] COMP_LOOP_3_acc_10_nl;
  wire[12:0] nl_COMP_LOOP_3_acc_10_nl;
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
  wire[0:0] nand_13_nl;
  wire[0:0] mux_296_nl;
  wire[0:0] nor_531_nl;
  wire[0:0] nor_532_nl;
  wire[0:0] or_210_nl;
  wire[0:0] mux_295_nl;
  wire[0:0] mux_294_nl;
  wire[0:0] or_208_nl;
  wire[0:0] or_207_nl;
  wire[0:0] nand_24_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] nor_497_nl;
  wire[0:0] nor_498_nl;
  wire[0:0] or_318_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] or_317_nl;
  wire[0:0] or_316_nl;
  wire[0:0] nand_35_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] nor_463_nl;
  wire[0:0] nor_464_nl;
  wire[0:0] or_424_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] or_423_nl;
  wire[0:0] mux_414_nl;
  wire[0:0] or_422_nl;
  wire[0:0] nand_46_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] nor_429_nl;
  wire[0:0] nor_430_nl;
  wire[0:0] or_526_nl;
  wire[0:0] mux_475_nl;
  wire[0:0] or_525_nl;
  wire[0:0] mux_474_nl;
  wire[0:0] or_524_nl;
  wire[0:0] nand_57_nl;
  wire[0:0] mux_536_nl;
  wire[0:0] nor_395_nl;
  wire[0:0] nor_396_nl;
  wire[0:0] or_627_nl;
  wire[0:0] mux_535_nl;
  wire[0:0] mux_534_nl;
  wire[0:0] or_626_nl;
  wire[0:0] or_625_nl;
  wire[0:0] nand_68_nl;
  wire[0:0] mux_596_nl;
  wire[0:0] and_395_nl;
  wire[0:0] nor_362_nl;
  wire[0:0] or_732_nl;
  wire[0:0] mux_595_nl;
  wire[0:0] mux_594_nl;
  wire[0:0] or_731_nl;
  wire[0:0] or_730_nl;
  wire[0:0] nand_79_nl;
  wire[0:0] mux_656_nl;
  wire[0:0] nor_327_nl;
  wire[0:0] nor_328_nl;
  wire[0:0] or_835_nl;
  wire[0:0] mux_655_nl;
  wire[0:0] or_834_nl;
  wire[0:0] mux_654_nl;
  wire[0:0] or_833_nl;
  wire[0:0] nand_90_nl;
  wire[0:0] mux_716_nl;
  wire[0:0] and_282_nl;
  wire[0:0] and_283_nl;
  wire[0:0] or_934_nl;
  wire[0:0] mux_715_nl;
  wire[0:0] nand_144_nl;
  wire[0:0] mux_714_nl;
  wire[0:0] nand_145_nl;
  wire[0:0] mux_849_nl;
  wire[0:0] or_1221_nl;
  wire[0:0] or_1117_nl;
  wire[0:0] mux_871_nl;
  wire[0:0] mux_870_nl;
  wire[0:0] mux_869_nl;
  wire[0:0] mux_894_nl;
  wire[0:0] mux_893_nl;
  wire[0:0] mux_903_nl;
  wire[0:0] mux_907_nl;
  wire[0:0] mux_906_nl;
  wire[0:0] mux_915_nl;
  wire[0:0] mux_914_nl;
  wire[0:0] mux_913_nl;
  wire[0:0] mux_918_nl;
  wire[0:0] mux_917_nl;
  wire[0:0] mux_927_nl;
  wire[0:0] mux_931_nl;
  wire[0:0] mux_930_nl;
  wire[0:0] mux_938_nl;
  wire[0:0] mux_937_nl;
  wire[0:0] mux_947_nl;
  wire[0:0] mux_957_nl;
  wire[0:0] mux_956_nl;
  wire[0:0] mux_966_nl;
  wire[0:0] or_1174_nl;
  wire[0:0] mux_970_nl;
  wire[0:0] mux_969_nl;
  wire[0:0] mux_968_nl;
  wire[0:0] nand_102_nl;
  wire[0:0] mux_967_nl;
  wire[0:0] nand_104_nl;
  wire[0:0] or_1177_nl;
  wire[0:0] mux_1000_nl;
  wire[0:0] or_1197_nl;
  wire[0:0] mux_991_nl;
  wire[0:0] mux_30_nl;
  wire[0:0] nor_567_nl;
  wire[0:0] mux_989_nl;
  wire[0:0] mux_996_nl;
  wire[0:0] mux_67_nl;
  wire[0:0] or_36_nl;
  wire[0:0] mux_994_nl;
  wire[0:0] mux_993_nl;
  wire[0:0] mux_64_nl;
  wire[0:0] mux_999_nl;
  wire[0:0] mux_998_nl;
  wire[0:0] mux_997_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] and_58_nl;
  wire[0:0] and_69_nl;
  wire[0:0] and_75_nl;
  wire[0:0] and_79_nl;
  wire[0:0] and_81_nl;
  wire[0:0] and_84_nl;
  wire[0:0] and_86_nl;
  wire[0:0] and_88_nl;
  wire[0:0] and_91_nl;
  wire[0:0] and_93_nl;
  wire[0:0] and_95_nl;
  wire[0:0] and_97_nl;
  wire[0:0] and_98_nl;
  wire[0:0] and_99_nl;
  wire[0:0] and_100_nl;
  wire[0:0] and_101_nl;
  wire[0:0] and_102_nl;
  wire[0:0] and_103_nl;
  wire[0:0] and_104_nl;
  wire[0:0] and_105_nl;
  wire[0:0] and_106_nl;
  wire[0:0] and_107_nl;
  wire[0:0] and_108_nl;
  wire[0:0] and_109_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] nand_231_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] and_329_nl;
  wire[0:0] mux_300_nl;
  wire[0:0] nor_522_nl;
  wire[0:0] nor_523_nl;
  wire[0:0] nor_524_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] mux_298_nl;
  wire[0:0] or_217_nl;
  wire[0:0] or_216_nl;
  wire[0:0] nor_525_nl;
  wire[0:0] or_1256_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] nand_12_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] nor_527_nl;
  wire[0:0] nor_528_nl;
  wire[0:0] or_201_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] or_200_nl;
  wire[0:0] or_198_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] nand_11_nl;
  wire[0:0] mux_288_nl;
  wire[0:0] nor_529_nl;
  wire[0:0] nor_530_nl;
  wire[0:0] or_194_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] or_193_nl;
  wire[0:0] or_191_nl;
  wire[0:0] mux_318_nl;
  wire[0:0] mux_317_nl;
  wire[0:0] nor_515_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] or_249_nl;
  wire[0:0] or_248_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] nor_516_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] or_246_nl;
  wire[0:0] or_244_nl;
  wire[0:0] mux_312_nl;
  wire[0:0] nor_517_nl;
  wire[0:0] nor_518_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] nor_519_nl;
  wire[0:0] nor_520_nl;
  wire[0:0] nor_521_nl;
  wire[0:0] mux_310_nl;
  wire[0:0] mux_309_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] or_235_nl;
  wire[0:0] or_233_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] or_231_nl;
  wire[0:0] or_229_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] or_227_nl;
  wire[0:0] or_226_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] or_225_nl;
  wire[0:0] or_224_nl;
  wire[0:0] mux_331_nl;
  wire[0:0] nand_230_nl;
  wire[0:0] mux_330_nl;
  wire[0:0] mux_329_nl;
  wire[0:0] and_326_nl;
  wire[0:0] mux_328_nl;
  wire[0:0] nor_507_nl;
  wire[0:0] nor_508_nl;
  wire[0:0] nor_509_nl;
  wire[0:0] mux_327_nl;
  wire[0:0] mux_326_nl;
  wire[0:0] or_268_nl;
  wire[0:0] or_267_nl;
  wire[0:0] and_327_nl;
  wire[0:0] or_1255_nl;
  wire[0:0] mux_325_nl;
  wire[0:0] mux_324_nl;
  wire[0:0] nand_17_nl;
  wire[0:0] mux_323_nl;
  wire[0:0] nor_511_nl;
  wire[0:0] nor_512_nl;
  wire[0:0] or_261_nl;
  wire[0:0] mux_322_nl;
  wire[0:0] or_260_nl;
  wire[0:0] or_258_nl;
  wire[0:0] mux_321_nl;
  wire[0:0] nand_16_nl;
  wire[0:0] mux_320_nl;
  wire[0:0] nor_513_nl;
  wire[0:0] nor_514_nl;
  wire[0:0] or_254_nl;
  wire[0:0] mux_319_nl;
  wire[0:0] or_253_nl;
  wire[0:0] or_251_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] mux_345_nl;
  wire[0:0] nor_499_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] or_298_nl;
  wire[0:0] or_297_nl;
  wire[0:0] mux_343_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] and_324_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] nor_500_nl;
  wire[0:0] nor_501_nl;
  wire[0:0] mux_340_nl;
  wire[0:0] nor_502_nl;
  wire[0:0] nor_503_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] nor_504_nl;
  wire[0:0] nor_505_nl;
  wire[0:0] nor_506_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] mux_336_nl;
  wire[0:0] or_285_nl;
  wire[0:0] or_283_nl;
  wire[0:0] mux_335_nl;
  wire[0:0] or_281_nl;
  wire[0:0] or_279_nl;
  wire[0:0] mux_334_nl;
  wire[0:0] mux_333_nl;
  wire[0:0] or_277_nl;
  wire[0:0] or_276_nl;
  wire[0:0] mux_332_nl;
  wire[0:0] or_275_nl;
  wire[0:0] or_274_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] nand_229_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] and_323_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] nor_488_nl;
  wire[0:0] nor_489_nl;
  wire[0:0] nor_490_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] or_325_nl;
  wire[0:0] or_324_nl;
  wire[0:0] nor_491_nl;
  wire[0:0] or_1254_nl;
  wire[0:0] mux_353_nl;
  wire[0:0] mux_352_nl;
  wire[0:0] nand_23_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] nor_493_nl;
  wire[0:0] nor_494_nl;
  wire[0:0] or_310_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] or_309_nl;
  wire[0:0] or_307_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] nand_22_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] nor_495_nl;
  wire[0:0] nor_496_nl;
  wire[0:0] or_303_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] or_302_nl;
  wire[0:0] or_300_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] nor_481_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] or_357_nl;
  wire[0:0] or_356_nl;
  wire[0:0] mux_375_nl;
  wire[0:0] mux_374_nl;
  wire[0:0] nor_482_nl;
  wire[0:0] mux_373_nl;
  wire[0:0] or_354_nl;
  wire[0:0] or_352_nl;
  wire[0:0] mux_372_nl;
  wire[0:0] nor_483_nl;
  wire[0:0] nor_484_nl;
  wire[0:0] mux_371_nl;
  wire[0:0] nor_485_nl;
  wire[0:0] nor_486_nl;
  wire[0:0] nor_487_nl;
  wire[0:0] mux_370_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] mux_368_nl;
  wire[0:0] or_343_nl;
  wire[0:0] or_341_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] or_339_nl;
  wire[0:0] or_337_nl;
  wire[0:0] mux_366_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] or_335_nl;
  wire[0:0] or_334_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] or_333_nl;
  wire[0:0] or_332_nl;
  wire[0:0] mux_391_nl;
  wire[0:0] nand_228_nl;
  wire[0:0] mux_390_nl;
  wire[0:0] mux_389_nl;
  wire[0:0] and_320_nl;
  wire[0:0] mux_388_nl;
  wire[0:0] nor_473_nl;
  wire[0:0] nor_474_nl;
  wire[0:0] nor_475_nl;
  wire[0:0] mux_387_nl;
  wire[0:0] mux_386_nl;
  wire[0:0] or_376_nl;
  wire[0:0] or_375_nl;
  wire[0:0] and_321_nl;
  wire[0:0] or_1253_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] nand_28_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] nor_477_nl;
  wire[0:0] nor_478_nl;
  wire[0:0] or_369_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] or_368_nl;
  wire[0:0] or_366_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] nand_27_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] nor_479_nl;
  wire[0:0] nor_480_nl;
  wire[0:0] or_362_nl;
  wire[0:0] mux_379_nl;
  wire[0:0] or_361_nl;
  wire[0:0] or_359_nl;
  wire[0:0] mux_406_nl;
  wire[0:0] mux_405_nl;
  wire[0:0] nor_465_nl;
  wire[0:0] mux_404_nl;
  wire[0:0] or_405_nl;
  wire[0:0] or_404_nl;
  wire[0:0] mux_403_nl;
  wire[0:0] mux_402_nl;
  wire[0:0] and_318_nl;
  wire[0:0] mux_401_nl;
  wire[0:0] nor_466_nl;
  wire[0:0] nor_467_nl;
  wire[0:0] mux_400_nl;
  wire[0:0] nor_468_nl;
  wire[0:0] nor_469_nl;
  wire[0:0] mux_399_nl;
  wire[0:0] nor_470_nl;
  wire[0:0] nor_471_nl;
  wire[0:0] nor_472_nl;
  wire[0:0] mux_398_nl;
  wire[0:0] mux_397_nl;
  wire[0:0] mux_396_nl;
  wire[0:0] or_392_nl;
  wire[0:0] or_390_nl;
  wire[0:0] mux_395_nl;
  wire[0:0] or_388_nl;
  wire[0:0] or_386_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] mux_393_nl;
  wire[0:0] or_384_nl;
  wire[0:0] or_383_nl;
  wire[0:0] mux_392_nl;
  wire[0:0] or_382_nl;
  wire[0:0] or_381_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] nand_227_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] and_317_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] nor_454_nl;
  wire[0:0] nor_455_nl;
  wire[0:0] nor_456_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] or_430_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] or_429_nl;
  wire[0:0] nor_457_nl;
  wire[0:0] or_1252_nl;
  wire[0:0] mux_413_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] nand_34_nl;
  wire[0:0] mux_411_nl;
  wire[0:0] nor_459_nl;
  wire[0:0] nor_460_nl;
  wire[0:0] or_417_nl;
  wire[0:0] mux_410_nl;
  wire[0:0] or_416_nl;
  wire[0:0] or_414_nl;
  wire[0:0] mux_409_nl;
  wire[0:0] nand_33_nl;
  wire[0:0] mux_408_nl;
  wire[0:0] nor_461_nl;
  wire[0:0] nor_462_nl;
  wire[0:0] or_410_nl;
  wire[0:0] mux_407_nl;
  wire[0:0] or_409_nl;
  wire[0:0] or_407_nl;
  wire[0:0] mux_438_nl;
  wire[0:0] mux_437_nl;
  wire[0:0] nor_447_nl;
  wire[0:0] mux_436_nl;
  wire[0:0] or_460_nl;
  wire[0:0] or_459_nl;
  wire[0:0] mux_435_nl;
  wire[0:0] mux_434_nl;
  wire[0:0] nor_448_nl;
  wire[0:0] mux_433_nl;
  wire[0:0] or_457_nl;
  wire[0:0] or_455_nl;
  wire[0:0] mux_432_nl;
  wire[0:0] nor_449_nl;
  wire[0:0] nor_450_nl;
  wire[0:0] mux_431_nl;
  wire[0:0] nor_451_nl;
  wire[0:0] nor_452_nl;
  wire[0:0] nor_453_nl;
  wire[0:0] mux_430_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] or_446_nl;
  wire[0:0] or_444_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] or_442_nl;
  wire[0:0] or_440_nl;
  wire[0:0] mux_426_nl;
  wire[0:0] mux_425_nl;
  wire[0:0] or_438_nl;
  wire[0:0] or_437_nl;
  wire[0:0] mux_424_nl;
  wire[0:0] or_436_nl;
  wire[0:0] or_435_nl;
  wire[0:0] mux_451_nl;
  wire[0:0] nand_226_nl;
  wire[0:0] mux_450_nl;
  wire[0:0] mux_449_nl;
  wire[0:0] and_314_nl;
  wire[0:0] mux_448_nl;
  wire[0:0] nor_439_nl;
  wire[0:0] nor_440_nl;
  wire[0:0] nor_441_nl;
  wire[0:0] mux_447_nl;
  wire[0:0] or_478_nl;
  wire[0:0] mux_446_nl;
  wire[0:0] or_477_nl;
  wire[0:0] and_315_nl;
  wire[0:0] or_1251_nl;
  wire[0:0] mux_445_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] nand_39_nl;
  wire[0:0] mux_443_nl;
  wire[0:0] nor_443_nl;
  wire[0:0] nor_444_nl;
  wire[0:0] or_472_nl;
  wire[0:0] mux_442_nl;
  wire[0:0] or_471_nl;
  wire[0:0] or_469_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] nand_38_nl;
  wire[0:0] mux_440_nl;
  wire[0:0] nor_445_nl;
  wire[0:0] nor_446_nl;
  wire[0:0] or_465_nl;
  wire[0:0] mux_439_nl;
  wire[0:0] or_464_nl;
  wire[0:0] or_462_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] nor_431_nl;
  wire[0:0] mux_464_nl;
  wire[0:0] or_507_nl;
  wire[0:0] or_506_nl;
  wire[0:0] mux_463_nl;
  wire[0:0] mux_462_nl;
  wire[0:0] and_312_nl;
  wire[0:0] mux_461_nl;
  wire[0:0] nor_432_nl;
  wire[0:0] nor_433_nl;
  wire[0:0] mux_460_nl;
  wire[0:0] nor_434_nl;
  wire[0:0] nor_435_nl;
  wire[0:0] mux_459_nl;
  wire[0:0] nor_436_nl;
  wire[0:0] nor_437_nl;
  wire[0:0] nor_438_nl;
  wire[0:0] mux_458_nl;
  wire[0:0] mux_457_nl;
  wire[0:0] mux_456_nl;
  wire[0:0] or_494_nl;
  wire[0:0] or_492_nl;
  wire[0:0] mux_455_nl;
  wire[0:0] or_490_nl;
  wire[0:0] or_488_nl;
  wire[0:0] mux_454_nl;
  wire[0:0] mux_453_nl;
  wire[0:0] or_486_nl;
  wire[0:0] or_485_nl;
  wire[0:0] mux_452_nl;
  wire[0:0] or_484_nl;
  wire[0:0] or_483_nl;
  wire[0:0] mux_483_nl;
  wire[0:0] nand_225_nl;
  wire[0:0] mux_482_nl;
  wire[0:0] mux_481_nl;
  wire[0:0] and_311_nl;
  wire[0:0] mux_480_nl;
  wire[0:0] nor_420_nl;
  wire[0:0] nor_421_nl;
  wire[0:0] nor_422_nl;
  wire[0:0] mux_479_nl;
  wire[0:0] or_532_nl;
  wire[0:0] mux_478_nl;
  wire[0:0] or_531_nl;
  wire[0:0] nor_423_nl;
  wire[0:0] or_1250_nl;
  wire[0:0] mux_473_nl;
  wire[0:0] mux_472_nl;
  wire[0:0] nand_45_nl;
  wire[0:0] mux_471_nl;
  wire[0:0] nor_425_nl;
  wire[0:0] nor_426_nl;
  wire[0:0] or_519_nl;
  wire[0:0] mux_470_nl;
  wire[0:0] or_518_nl;
  wire[0:0] or_516_nl;
  wire[0:0] mux_469_nl;
  wire[0:0] nand_44_nl;
  wire[0:0] mux_468_nl;
  wire[0:0] nor_427_nl;
  wire[0:0] nor_428_nl;
  wire[0:0] or_512_nl;
  wire[0:0] mux_467_nl;
  wire[0:0] or_511_nl;
  wire[0:0] or_509_nl;
  wire[0:0] mux_498_nl;
  wire[0:0] mux_497_nl;
  wire[0:0] nor_413_nl;
  wire[0:0] mux_496_nl;
  wire[0:0] or_562_nl;
  wire[0:0] or_561_nl;
  wire[0:0] mux_495_nl;
  wire[0:0] mux_494_nl;
  wire[0:0] nor_414_nl;
  wire[0:0] mux_493_nl;
  wire[0:0] or_559_nl;
  wire[0:0] or_557_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] nor_415_nl;
  wire[0:0] nor_416_nl;
  wire[0:0] mux_491_nl;
  wire[0:0] nor_417_nl;
  wire[0:0] nor_418_nl;
  wire[0:0] nor_419_nl;
  wire[0:0] mux_490_nl;
  wire[0:0] mux_489_nl;
  wire[0:0] mux_488_nl;
  wire[0:0] or_548_nl;
  wire[0:0] or_546_nl;
  wire[0:0] mux_487_nl;
  wire[0:0] or_544_nl;
  wire[0:0] or_542_nl;
  wire[0:0] mux_486_nl;
  wire[0:0] mux_485_nl;
  wire[0:0] or_540_nl;
  wire[0:0] or_539_nl;
  wire[0:0] mux_484_nl;
  wire[0:0] or_538_nl;
  wire[0:0] or_537_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] nand_224_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] and_308_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] and_402_nl;
  wire[0:0] nor_406_nl;
  wire[0:0] nor_407_nl;
  wire[0:0] mux_507_nl;
  wire[0:0] or_578_nl;
  wire[0:0] mux_506_nl;
  wire[0:0] or_577_nl;
  wire[0:0] and_309_nl;
  wire[0:0] or_1249_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] mux_504_nl;
  wire[0:0] nand_50_nl;
  wire[0:0] mux_503_nl;
  wire[0:0] and_405_nl;
  wire[0:0] nor_410_nl;
  wire[0:0] or_572_nl;
  wire[0:0] mux_502_nl;
  wire[0:0] or_571_nl;
  wire[0:0] or_570_nl;
  wire[0:0] mux_501_nl;
  wire[0:0] nand_49_nl;
  wire[0:0] mux_500_nl;
  wire[0:0] nor_411_nl;
  wire[0:0] nor_412_nl;
  wire[0:0] or_566_nl;
  wire[0:0] mux_499_nl;
  wire[0:0] or_565_nl;
  wire[0:0] or_564_nl;
  wire[0:0] mux_526_nl;
  wire[0:0] mux_525_nl;
  wire[0:0] nor_397_nl;
  wire[0:0] mux_524_nl;
  wire[0:0] or_607_nl;
  wire[0:0] or_606_nl;
  wire[0:0] mux_523_nl;
  wire[0:0] mux_522_nl;
  wire[0:0] and_306_nl;
  wire[0:0] mux_521_nl;
  wire[0:0] nor_398_nl;
  wire[0:0] nor_399_nl;
  wire[0:0] mux_520_nl;
  wire[0:0] nor_400_nl;
  wire[0:0] nor_401_nl;
  wire[0:0] mux_519_nl;
  wire[0:0] nor_402_nl;
  wire[0:0] nor_403_nl;
  wire[0:0] nor_404_nl;
  wire[0:0] mux_518_nl;
  wire[0:0] mux_517_nl;
  wire[0:0] mux_516_nl;
  wire[0:0] or_594_nl;
  wire[0:0] nand_236_nl;
  wire[0:0] mux_515_nl;
  wire[0:0] or_590_nl;
  wire[0:0] or_588_nl;
  wire[0:0] mux_514_nl;
  wire[0:0] mux_513_nl;
  wire[0:0] nand_180_nl;
  wire[0:0] or_585_nl;
  wire[0:0] mux_512_nl;
  wire[0:0] or_584_nl;
  wire[0:0] or_583_nl;
  wire[0:0] mux_543_nl;
  wire[0:0] nand_223_nl;
  wire[0:0] mux_542_nl;
  wire[0:0] mux_541_nl;
  wire[0:0] and_305_nl;
  wire[0:0] mux_540_nl;
  wire[0:0] nor_386_nl;
  wire[0:0] nor_387_nl;
  wire[0:0] nor_388_nl;
  wire[0:0] mux_539_nl;
  wire[0:0] mux_538_nl;
  wire[0:0] or_634_nl;
  wire[0:0] or_633_nl;
  wire[0:0] nor_389_nl;
  wire[0:0] or_1248_nl;
  wire[0:0] mux_533_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] nand_56_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] nor_391_nl;
  wire[0:0] nor_392_nl;
  wire[0:0] or_619_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] or_618_nl;
  wire[0:0] or_616_nl;
  wire[0:0] mux_529_nl;
  wire[0:0] nand_55_nl;
  wire[0:0] mux_528_nl;
  wire[0:0] nor_393_nl;
  wire[0:0] nor_394_nl;
  wire[0:0] or_612_nl;
  wire[0:0] mux_527_nl;
  wire[0:0] or_611_nl;
  wire[0:0] or_609_nl;
  wire[0:0] mux_558_nl;
  wire[0:0] mux_557_nl;
  wire[0:0] nor_379_nl;
  wire[0:0] mux_556_nl;
  wire[0:0] or_664_nl;
  wire[0:0] or_663_nl;
  wire[0:0] mux_555_nl;
  wire[0:0] mux_554_nl;
  wire[0:0] nor_380_nl;
  wire[0:0] mux_553_nl;
  wire[0:0] or_661_nl;
  wire[0:0] or_659_nl;
  wire[0:0] mux_552_nl;
  wire[0:0] nor_381_nl;
  wire[0:0] nor_382_nl;
  wire[0:0] mux_551_nl;
  wire[0:0] nor_383_nl;
  wire[0:0] nor_384_nl;
  wire[0:0] nor_385_nl;
  wire[0:0] mux_550_nl;
  wire[0:0] mux_549_nl;
  wire[0:0] mux_548_nl;
  wire[0:0] or_650_nl;
  wire[0:0] or_648_nl;
  wire[0:0] mux_547_nl;
  wire[0:0] or_646_nl;
  wire[0:0] or_644_nl;
  wire[0:0] mux_546_nl;
  wire[0:0] mux_545_nl;
  wire[0:0] or_642_nl;
  wire[0:0] or_641_nl;
  wire[0:0] mux_544_nl;
  wire[0:0] or_640_nl;
  wire[0:0] or_639_nl;
  wire[0:0] mux_571_nl;
  wire[0:0] nand_222_nl;
  wire[0:0] mux_570_nl;
  wire[0:0] mux_569_nl;
  wire[0:0] and_302_nl;
  wire[0:0] mux_568_nl;
  wire[0:0] nor_371_nl;
  wire[0:0] nor_372_nl;
  wire[0:0] nor_373_nl;
  wire[0:0] mux_567_nl;
  wire[0:0] mux_566_nl;
  wire[0:0] or_683_nl;
  wire[0:0] or_682_nl;
  wire[0:0] and_303_nl;
  wire[0:0] or_1247_nl;
  wire[0:0] mux_565_nl;
  wire[0:0] mux_564_nl;
  wire[0:0] nand_61_nl;
  wire[0:0] mux_563_nl;
  wire[0:0] nor_375_nl;
  wire[0:0] nor_376_nl;
  wire[0:0] or_676_nl;
  wire[0:0] mux_562_nl;
  wire[0:0] or_675_nl;
  wire[0:0] or_673_nl;
  wire[0:0] mux_561_nl;
  wire[0:0] nand_60_nl;
  wire[0:0] mux_560_nl;
  wire[0:0] nor_377_nl;
  wire[0:0] nor_378_nl;
  wire[0:0] or_669_nl;
  wire[0:0] mux_559_nl;
  wire[0:0] or_668_nl;
  wire[0:0] or_666_nl;
  wire[0:0] mux_586_nl;
  wire[0:0] mux_585_nl;
  wire[0:0] nor_363_nl;
  wire[0:0] mux_584_nl;
  wire[0:0] or_712_nl;
  wire[0:0] or_711_nl;
  wire[0:0] mux_583_nl;
  wire[0:0] mux_582_nl;
  wire[0:0] and_300_nl;
  wire[0:0] mux_581_nl;
  wire[0:0] nor_364_nl;
  wire[0:0] nor_365_nl;
  wire[0:0] mux_580_nl;
  wire[0:0] nor_366_nl;
  wire[0:0] nor_367_nl;
  wire[0:0] mux_579_nl;
  wire[0:0] nor_368_nl;
  wire[0:0] nor_369_nl;
  wire[0:0] nor_370_nl;
  wire[0:0] mux_578_nl;
  wire[0:0] mux_577_nl;
  wire[0:0] mux_576_nl;
  wire[0:0] or_699_nl;
  wire[0:0] or_697_nl;
  wire[0:0] mux_575_nl;
  wire[0:0] or_695_nl;
  wire[0:0] or_693_nl;
  wire[0:0] mux_574_nl;
  wire[0:0] mux_573_nl;
  wire[0:0] or_691_nl;
  wire[0:0] or_690_nl;
  wire[0:0] mux_572_nl;
  wire[0:0] or_689_nl;
  wire[0:0] or_688_nl;
  wire[0:0] mux_603_nl;
  wire[0:0] nand_221_nl;
  wire[0:0] mux_602_nl;
  wire[0:0] mux_601_nl;
  wire[0:0] and_299_nl;
  wire[0:0] mux_600_nl;
  wire[0:0] nor_352_nl;
  wire[0:0] nor_353_nl;
  wire[0:0] nor_354_nl;
  wire[0:0] mux_599_nl;
  wire[0:0] mux_598_nl;
  wire[0:0] or_739_nl;
  wire[0:0] or_738_nl;
  wire[0:0] nor_355_nl;
  wire[0:0] or_1246_nl;
  wire[0:0] mux_593_nl;
  wire[0:0] mux_592_nl;
  wire[0:0] nand_67_nl;
  wire[0:0] mux_591_nl;
  wire[0:0] nor_357_nl;
  wire[0:0] nor_358_nl;
  wire[0:0] or_724_nl;
  wire[0:0] mux_590_nl;
  wire[0:0] or_723_nl;
  wire[0:0] or_721_nl;
  wire[0:0] mux_589_nl;
  wire[0:0] nand_66_nl;
  wire[0:0] mux_588_nl;
  wire[0:0] nor_359_nl;
  wire[0:0] nor_360_nl;
  wire[0:0] or_717_nl;
  wire[0:0] mux_587_nl;
  wire[0:0] or_716_nl;
  wire[0:0] or_714_nl;
  wire[0:0] mux_618_nl;
  wire[0:0] mux_617_nl;
  wire[0:0] nor_345_nl;
  wire[0:0] mux_616_nl;
  wire[0:0] or_769_nl;
  wire[0:0] or_768_nl;
  wire[0:0] mux_615_nl;
  wire[0:0] mux_614_nl;
  wire[0:0] nor_346_nl;
  wire[0:0] mux_613_nl;
  wire[0:0] or_766_nl;
  wire[0:0] or_764_nl;
  wire[0:0] mux_612_nl;
  wire[0:0] nor_347_nl;
  wire[0:0] nor_348_nl;
  wire[0:0] mux_611_nl;
  wire[0:0] nor_349_nl;
  wire[0:0] nor_350_nl;
  wire[0:0] nor_351_nl;
  wire[0:0] mux_610_nl;
  wire[0:0] mux_609_nl;
  wire[0:0] mux_608_nl;
  wire[0:0] or_755_nl;
  wire[0:0] or_753_nl;
  wire[0:0] mux_607_nl;
  wire[0:0] or_751_nl;
  wire[0:0] or_749_nl;
  wire[0:0] mux_606_nl;
  wire[0:0] mux_605_nl;
  wire[0:0] or_747_nl;
  wire[0:0] or_746_nl;
  wire[0:0] mux_604_nl;
  wire[0:0] or_745_nl;
  wire[0:0] or_744_nl;
  wire[0:0] mux_631_nl;
  wire[0:0] nand_220_nl;
  wire[0:0] mux_630_nl;
  wire[0:0] mux_629_nl;
  wire[0:0] and_296_nl;
  wire[0:0] mux_628_nl;
  wire[0:0] nor_337_nl;
  wire[0:0] nor_338_nl;
  wire[0:0] nor_339_nl;
  wire[0:0] mux_627_nl;
  wire[0:0] mux_626_nl;
  wire[0:0] or_788_nl;
  wire[0:0] or_787_nl;
  wire[0:0] and_297_nl;
  wire[0:0] or_1245_nl;
  wire[0:0] mux_625_nl;
  wire[0:0] mux_624_nl;
  wire[0:0] nand_72_nl;
  wire[0:0] mux_623_nl;
  wire[0:0] nor_341_nl;
  wire[0:0] nor_342_nl;
  wire[0:0] or_781_nl;
  wire[0:0] mux_622_nl;
  wire[0:0] or_780_nl;
  wire[0:0] or_778_nl;
  wire[0:0] mux_621_nl;
  wire[0:0] nand_71_nl;
  wire[0:0] mux_620_nl;
  wire[0:0] nor_343_nl;
  wire[0:0] nor_344_nl;
  wire[0:0] or_774_nl;
  wire[0:0] mux_619_nl;
  wire[0:0] or_773_nl;
  wire[0:0] or_771_nl;
  wire[0:0] mux_646_nl;
  wire[0:0] mux_645_nl;
  wire[0:0] nor_329_nl;
  wire[0:0] mux_644_nl;
  wire[0:0] or_816_nl;
  wire[0:0] or_815_nl;
  wire[0:0] mux_643_nl;
  wire[0:0] mux_642_nl;
  wire[0:0] and_294_nl;
  wire[0:0] mux_641_nl;
  wire[0:0] nor_330_nl;
  wire[0:0] nor_331_nl;
  wire[0:0] mux_640_nl;
  wire[0:0] nor_332_nl;
  wire[0:0] nor_333_nl;
  wire[0:0] mux_639_nl;
  wire[0:0] nor_334_nl;
  wire[0:0] nor_335_nl;
  wire[0:0] nor_336_nl;
  wire[0:0] mux_638_nl;
  wire[0:0] mux_637_nl;
  wire[0:0] mux_636_nl;
  wire[0:0] or_804_nl;
  wire[0:0] nand_235_nl;
  wire[0:0] mux_635_nl;
  wire[0:0] or_800_nl;
  wire[0:0] or_798_nl;
  wire[0:0] mux_634_nl;
  wire[0:0] mux_633_nl;
  wire[0:0] nand_163_nl;
  wire[0:0] or_795_nl;
  wire[0:0] mux_632_nl;
  wire[0:0] or_794_nl;
  wire[0:0] or_793_nl;
  wire[0:0] mux_663_nl;
  wire[0:0] nand_219_nl;
  wire[0:0] mux_662_nl;
  wire[0:0] mux_661_nl;
  wire[0:0] and_291_nl;
  wire[0:0] mux_660_nl;
  wire[0:0] nor_318_nl;
  wire[0:0] nor_319_nl;
  wire[0:0] nor_320_nl;
  wire[0:0] mux_659_nl;
  wire[0:0] or_840_nl;
  wire[0:0] mux_658_nl;
  wire[0:0] or_839_nl;
  wire[0:0] nor_321_nl;
  wire[0:0] or_1244_nl;
  wire[0:0] mux_653_nl;
  wire[0:0] mux_652_nl;
  wire[0:0] nand_78_nl;
  wire[0:0] mux_651_nl;
  wire[0:0] nor_323_nl;
  wire[0:0] nor_324_nl;
  wire[0:0] or_828_nl;
  wire[0:0] mux_650_nl;
  wire[0:0] or_827_nl;
  wire[0:0] or_825_nl;
  wire[0:0] mux_649_nl;
  wire[0:0] nand_77_nl;
  wire[0:0] mux_648_nl;
  wire[0:0] nor_325_nl;
  wire[0:0] nor_326_nl;
  wire[0:0] or_821_nl;
  wire[0:0] mux_647_nl;
  wire[0:0] or_820_nl;
  wire[0:0] or_818_nl;
  wire[0:0] mux_678_nl;
  wire[0:0] mux_677_nl;
  wire[0:0] nor_311_nl;
  wire[0:0] mux_676_nl;
  wire[0:0] or_870_nl;
  wire[0:0] or_869_nl;
  wire[0:0] mux_675_nl;
  wire[0:0] mux_674_nl;
  wire[0:0] nor_312_nl;
  wire[0:0] mux_673_nl;
  wire[0:0] or_867_nl;
  wire[0:0] or_865_nl;
  wire[0:0] mux_672_nl;
  wire[0:0] nor_313_nl;
  wire[0:0] nor_314_nl;
  wire[0:0] mux_671_nl;
  wire[0:0] nor_315_nl;
  wire[0:0] nor_316_nl;
  wire[0:0] nor_317_nl;
  wire[0:0] mux_670_nl;
  wire[0:0] mux_669_nl;
  wire[0:0] mux_668_nl;
  wire[0:0] or_856_nl;
  wire[0:0] or_854_nl;
  wire[0:0] mux_667_nl;
  wire[0:0] or_852_nl;
  wire[0:0] or_850_nl;
  wire[0:0] mux_666_nl;
  wire[0:0] mux_665_nl;
  wire[0:0] or_848_nl;
  wire[0:0] or_847_nl;
  wire[0:0] mux_664_nl;
  wire[0:0] or_846_nl;
  wire[0:0] or_845_nl;
  wire[0:0] mux_691_nl;
  wire[0:0] nand_218_nl;
  wire[0:0] mux_690_nl;
  wire[0:0] mux_689_nl;
  wire[0:0] and_287_nl;
  wire[0:0] mux_688_nl;
  wire[0:0] nor_303_nl;
  wire[0:0] nor_304_nl;
  wire[0:0] nor_305_nl;
  wire[0:0] mux_687_nl;
  wire[0:0] or_887_nl;
  wire[0:0] mux_686_nl;
  wire[0:0] or_886_nl;
  wire[0:0] and_289_nl;
  wire[0:0] or_1243_nl;
  wire[0:0] mux_685_nl;
  wire[0:0] mux_684_nl;
  wire[0:0] nand_83_nl;
  wire[0:0] mux_683_nl;
  wire[0:0] nor_307_nl;
  wire[0:0] nor_308_nl;
  wire[0:0] or_881_nl;
  wire[0:0] mux_682_nl;
  wire[0:0] or_880_nl;
  wire[0:0] or_878_nl;
  wire[0:0] mux_681_nl;
  wire[0:0] nand_82_nl;
  wire[0:0] mux_680_nl;
  wire[0:0] nor_309_nl;
  wire[0:0] nor_310_nl;
  wire[0:0] or_875_nl;
  wire[0:0] mux_679_nl;
  wire[0:0] or_874_nl;
  wire[0:0] or_872_nl;
  wire[0:0] mux_706_nl;
  wire[0:0] mux_705_nl;
  wire[0:0] nor_295_nl;
  wire[0:0] mux_704_nl;
  wire[0:0] or_916_nl;
  wire[0:0] or_915_nl;
  wire[0:0] mux_703_nl;
  wire[0:0] mux_702_nl;
  wire[0:0] and_285_nl;
  wire[0:0] mux_701_nl;
  wire[0:0] nor_296_nl;
  wire[0:0] nor_297_nl;
  wire[0:0] mux_700_nl;
  wire[0:0] nor_298_nl;
  wire[0:0] nor_299_nl;
  wire[0:0] mux_699_nl;
  wire[0:0] nor_300_nl;
  wire[0:0] nor_301_nl;
  wire[0:0] nor_302_nl;
  wire[0:0] mux_698_nl;
  wire[0:0] mux_697_nl;
  wire[0:0] mux_696_nl;
  wire[0:0] or_903_nl;
  wire[0:0] nand_234_nl;
  wire[0:0] mux_695_nl;
  wire[0:0] or_899_nl;
  wire[0:0] or_897_nl;
  wire[0:0] mux_694_nl;
  wire[0:0] mux_693_nl;
  wire[0:0] nand_150_nl;
  wire[0:0] or_894_nl;
  wire[0:0] mux_692_nl;
  wire[0:0] or_893_nl;
  wire[0:0] or_892_nl;
  wire[0:0] mux_723_nl;
  wire[0:0] nand_217_nl;
  wire[0:0] mux_722_nl;
  wire[0:0] mux_721_nl;
  wire[0:0] and_280_nl;
  wire[0:0] mux_720_nl;
  wire[0:0] nor_286_nl;
  wire[0:0] nor_287_nl;
  wire[0:0] nor_288_nl;
  wire[0:0] mux_719_nl;
  wire[0:0] or_938_nl;
  wire[0:0] mux_718_nl;
  wire[0:0] or_937_nl;
  wire[0:0] nor_289_nl;
  wire[0:0] or_1242_nl;
  wire[0:0] mux_713_nl;
  wire[0:0] mux_712_nl;
  wire[0:0] nand_89_nl;
  wire[0:0] mux_711_nl;
  wire[0:0] nor_291_nl;
  wire[0:0] nor_292_nl;
  wire[0:0] or_928_nl;
  wire[0:0] mux_710_nl;
  wire[0:0] nand_239_nl;
  wire[0:0] or_925_nl;
  wire[0:0] mux_709_nl;
  wire[0:0] nand_88_nl;
  wire[0:0] mux_708_nl;
  wire[0:0] and_406_nl;
  wire[0:0] nor_294_nl;
  wire[0:0] or_921_nl;
  wire[0:0] mux_707_nl;
  wire[0:0] nand_237_nl;
  wire[0:0] or_918_nl;
  wire[0:0] mux_738_nl;
  wire[0:0] mux_737_nl;
  wire[0:0] nor_279_nl;
  wire[0:0] mux_736_nl;
  wire[0:0] or_966_nl;
  wire[0:0] or_965_nl;
  wire[0:0] mux_735_nl;
  wire[0:0] mux_734_nl;
  wire[0:0] nor_280_nl;
  wire[0:0] mux_733_nl;
  wire[0:0] or_963_nl;
  wire[0:0] nand_238_nl;
  wire[0:0] mux_732_nl;
  wire[0:0] nor_281_nl;
  wire[0:0] nor_282_nl;
  wire[0:0] mux_731_nl;
  wire[0:0] nor_283_nl;
  wire[0:0] nor_284_nl;
  wire[0:0] nor_285_nl;
  wire[0:0] mux_730_nl;
  wire[0:0] mux_729_nl;
  wire[0:0] mux_728_nl;
  wire[0:0] or_952_nl;
  wire[0:0] nand_233_nl;
  wire[0:0] mux_727_nl;
  wire[0:0] or_948_nl;
  wire[0:0] or_947_nl;
  wire[0:0] mux_726_nl;
  wire[0:0] mux_725_nl;
  wire[0:0] nand_137_nl;
  wire[0:0] or_944_nl;
  wire[0:0] mux_724_nl;
  wire[0:0] or_943_nl;
  wire[0:0] or_942_nl;
  wire[0:0] mux_751_nl;
  wire[0:0] nand_216_nl;
  wire[0:0] mux_750_nl;
  wire[0:0] mux_749_nl;
  wire[0:0] and_270_nl;
  wire[0:0] mux_748_nl;
  wire[0:0] and_271_nl;
  wire[0:0] and_272_nl;
  wire[0:0] nor_277_nl;
  wire[0:0] mux_747_nl;
  wire[0:0] nand_126_nl;
  wire[0:0] mux_746_nl;
  wire[0:0] nand_127_nl;
  wire[0:0] and_274_nl;
  wire[0:0] or_1241_nl;
  wire[0:0] mux_745_nl;
  wire[0:0] mux_744_nl;
  wire[0:0] nand_94_nl;
  wire[0:0] mux_743_nl;
  wire[0:0] and_275_nl;
  wire[0:0] and_276_nl;
  wire[0:0] or_972_nl;
  wire[0:0] mux_742_nl;
  wire[0:0] nand_128_nl;
  wire[0:0] nand_129_nl;
  wire[0:0] mux_741_nl;
  wire[0:0] nand_93_nl;
  wire[0:0] mux_740_nl;
  wire[0:0] and_277_nl;
  wire[0:0] and_278_nl;
  wire[0:0] or_969_nl;
  wire[0:0] mux_739_nl;
  wire[0:0] nand_130_nl;
  wire[0:0] nand_131_nl;
  wire[0:0] mux_766_nl;
  wire[0:0] mux_765_nl;
  wire[0:0] nor_272_nl;
  wire[0:0] mux_764_nl;
  wire[0:0] or_999_nl;
  wire[0:0] or_998_nl;
  wire[0:0] mux_763_nl;
  wire[0:0] mux_762_nl;
  wire[0:0] and_265_nl;
  wire[0:0] mux_761_nl;
  wire[0:0] nor_273_nl;
  wire[0:0] and_403_nl;
  wire[0:0] mux_760_nl;
  wire[0:0] and_266_nl;
  wire[0:0] and_404_nl;
  wire[0:0] mux_759_nl;
  wire[0:0] and_267_nl;
  wire[0:0] and_268_nl;
  wire[0:0] nor_276_nl;
  wire[0:0] mux_758_nl;
  wire[0:0] mux_757_nl;
  wire[0:0] mux_756_nl;
  wire[0:0] or_988_nl;
  wire[0:0] nand_nl;
  wire[0:0] mux_755_nl;
  wire[0:0] nand_120_nl;
  wire[0:0] nand_215_nl;
  wire[0:0] mux_754_nl;
  wire[0:0] mux_753_nl;
  wire[0:0] nand_122_nl;
  wire[0:0] nand_123_nl;
  wire[0:0] mux_752_nl;
  wire[0:0] nand_124_nl;
  wire[0:0] or_979_nl;
  wire[0:0] mux_773_nl;
  wire[0:0] mux_772_nl;
  wire[0:0] mux_771_nl;
  wire[0:0] nor_264_nl;
  wire[0:0] nor_265_nl;
  wire[0:0] mux_770_nl;
  wire[0:0] nor_266_nl;
  wire[0:0] mux_769_nl;
  wire[0:0] mux_768_nl;
  wire[0:0] nor_268_nl;
  wire[0:0] mux_767_nl;
  wire[0:0] nor_270_nl;
  wire[0:0] nor_271_nl;
  wire[0:0] mux_776_nl;
  wire[0:0] mux_775_nl;
  wire[0:0] nor_260_nl;
  wire[0:0] mux_774_nl;
  wire[0:0] nor_263_nl;
  wire[0:0] mux_781_nl;
  wire[0:0] mux_780_nl;
  wire[0:0] nor_254_nl;
  wire[0:0] nor_255_nl;
  wire[0:0] mux_779_nl;
  wire[0:0] mux_778_nl;
  wire[0:0] mux_777_nl;
  wire[0:0] mux_784_nl;
  wire[0:0] mux_783_nl;
  wire[0:0] nor_250_nl;
  wire[0:0] mux_782_nl;
  wire[0:0] nor_253_nl;
  wire[0:0] mux_790_nl;
  wire[0:0] mux_789_nl;
  wire[0:0] mux_788_nl;
  wire[0:0] nor_243_nl;
  wire[0:0] nor_244_nl;
  wire[0:0] mux_787_nl;
  wire[0:0] nor_245_nl;
  wire[0:0] nor_246_nl;
  wire[0:0] mux_786_nl;
  wire[0:0] nor_247_nl;
  wire[0:0] mux_785_nl;
  wire[0:0] nor_248_nl;
  wire[0:0] nor_249_nl;
  wire[0:0] mux_793_nl;
  wire[0:0] mux_792_nl;
  wire[0:0] nor_239_nl;
  wire[0:0] mux_791_nl;
  wire[0:0] nor_242_nl;
  wire[0:0] mux_798_nl;
  wire[0:0] mux_797_nl;
  wire[0:0] nor_233_nl;
  wire[0:0] nor_234_nl;
  wire[0:0] mux_796_nl;
  wire[0:0] mux_795_nl;
  wire[0:0] mux_794_nl;
  wire[0:0] mux_801_nl;
  wire[0:0] mux_800_nl;
  wire[0:0] nor_229_nl;
  wire[0:0] mux_799_nl;
  wire[0:0] nor_232_nl;
  wire[0:0] mux_808_nl;
  wire[0:0] mux_807_nl;
  wire[0:0] mux_806_nl;
  wire[0:0] nor_221_nl;
  wire[0:0] nor_222_nl;
  wire[0:0] mux_805_nl;
  wire[0:0] nor_223_nl;
  wire[0:0] mux_804_nl;
  wire[0:0] mux_803_nl;
  wire[0:0] nor_225_nl;
  wire[0:0] mux_802_nl;
  wire[0:0] nor_227_nl;
  wire[0:0] nor_228_nl;
  wire[0:0] mux_811_nl;
  wire[0:0] mux_810_nl;
  wire[0:0] nor_217_nl;
  wire[0:0] mux_809_nl;
  wire[0:0] nor_220_nl;
  wire[0:0] mux_816_nl;
  wire[0:0] mux_815_nl;
  wire[0:0] nor_211_nl;
  wire[0:0] nor_212_nl;
  wire[0:0] mux_814_nl;
  wire[0:0] mux_813_nl;
  wire[0:0] mux_812_nl;
  wire[0:0] mux_819_nl;
  wire[0:0] mux_818_nl;
  wire[0:0] nor_207_nl;
  wire[0:0] mux_817_nl;
  wire[0:0] nor_210_nl;
  wire[0:0] mux_825_nl;
  wire[0:0] mux_824_nl;
  wire[0:0] mux_823_nl;
  wire[0:0] and_396_nl;
  wire[0:0] nor_201_nl;
  wire[0:0] mux_822_nl;
  wire[0:0] nor_202_nl;
  wire[0:0] nor_203_nl;
  wire[0:0] mux_821_nl;
  wire[0:0] nor_204_nl;
  wire[0:0] mux_820_nl;
  wire[0:0] nor_205_nl;
  wire[0:0] nor_206_nl;
  wire[0:0] mux_828_nl;
  wire[0:0] mux_827_nl;
  wire[0:0] nor_196_nl;
  wire[0:0] mux_826_nl;
  wire[0:0] nor_199_nl;
  wire[0:0] mux_833_nl;
  wire[0:0] mux_832_nl;
  wire[0:0] nor_192_nl;
  wire[0:0] nor_193_nl;
  wire[0:0] mux_831_nl;
  wire[0:0] mux_830_nl;
  wire[0:0] mux_829_nl;
  wire[0:0] mux_836_nl;
  wire[0:0] mux_835_nl;
  wire[0:0] nor_190_nl;
  wire[0:0] mux_834_nl;
  wire[0:0] nor_191_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_and_86_nl;
  wire[0:0] COMP_LOOP_tmp_mux_11_nl;
  wire[8:0] COMP_LOOP_tmp_mux1h_62_nl;
  wire[0:0] COMP_LOOP_tmp_or_50_nl;
  wire[0:0] COMP_LOOP_tmp_and_80_nl;
  wire[5:0] COMP_LOOP_tmp_mux1h_63_nl;
  wire[0:0] COMP_LOOP_tmp_or_51_nl;
  wire[0:0] COMP_LOOP_tmp_or_52_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_mux_9_nl;
  wire[0:0] COMP_LOOP_tmp_COMP_LOOP_tmp_or_1_nl;
  wire[63:0] COMP_LOOP_tmp_mux1h_64_nl;
  wire[0:0] and_626_nl;
  wire[63:0] COMP_LOOP_tmp_mux_12_nl;
  wire[0:0] COMP_LOOP_tmp_or_53_nl;
  wire[6:0] COMP_LOOP_mux_206_nl;
  wire[0:0] and_627_nl;
  wire[11:0] acc_1_nl;
  wire[12:0] nl_acc_1_nl;
  wire[10:0] COMP_LOOP_mux_207_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_nand_1_nl;
  wire[9:0] COMP_LOOP_mux_208_nl;
  wire[3:0] STAGE_LOOP_mux_4_nl;
  wire[0:0] COMP_LOOP_mux1h_367_nl;
  wire[0:0] COMP_LOOP_mux1h_368_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_450_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_451_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_452_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_453_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_454_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_455_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_456_nl;
  wire[0:0] COMP_LOOP_mux1h_369_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_457_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_458_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_459_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_460_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_461_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_462_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_463_nl;
  wire[0:0] COMP_LOOP_mux1h_370_nl;
  wire[0:0] COMP_LOOP_mux1h_371_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_464_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_465_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_466_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_467_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_468_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_469_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_470_nl;
  wire[0:0] COMP_LOOP_mux1h_372_nl;
  wire[0:0] COMP_LOOP_mux1h_373_nl;
  wire[0:0] COMP_LOOP_mux1h_374_nl;
  wire[0:0] COMP_LOOP_mux1h_375_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_471_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_472_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_473_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_474_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_475_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_476_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_and_477_nl;
  wire[0:0] COMP_LOOP_mux1h_376_nl;
  wire[0:0] COMP_LOOP_mux1h_377_nl;
  wire[0:0] COMP_LOOP_mux1h_378_nl;
  wire[0:0] COMP_LOOP_mux1h_379_nl;
  wire[0:0] COMP_LOOP_mux1h_380_nl;
  wire[0:0] COMP_LOOP_mux1h_381_nl;
  wire[0:0] COMP_LOOP_mux1h_382_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[64:0] acc_4_nl;
  wire[65:0] nl_acc_4_nl;
  wire[63:0] COMP_LOOP_COMP_LOOP_mux_3_nl;
  wire[0:0] and_176_nl;
  wire[0:0] mux_848_nl;
  wire[0:0] mux_847_nl;
  wire[0:0] mux_846_nl;
  wire[0:0] mux_844_nl;
  wire[0:0] mux_843_nl;
  wire[0:0] or_1109_nl;
  wire[0:0] COMP_LOOP_or_39_nl;
  wire [63:0] nl_COMP_LOOP_1_modulo_dev_cmp_base_rsc_dat;
  assign COMP_LOOP_COMP_LOOP_mux_3_nl = MUX_v_64_2_2((~ COMP_LOOP_1_acc_8_itm), (~
      z_out_9), COMP_LOOP_or_17_itm);
  assign nl_acc_4_nl = ({COMP_LOOP_mux_209_cse , 1'b1}) + ({COMP_LOOP_COMP_LOOP_mux_3_nl
      , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[64:0];
  assign mux_846_nl = MUX_s_1_2_2((~ nor_tmp_15), mux_tmp_826, fsm_output[7]);
  assign mux_847_nl = MUX_s_1_2_2(mux_846_nl, or_tmp_1059, fsm_output[2]);
  assign or_1109_nl = (fsm_output[4]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_843_nl = MUX_s_1_2_2(nand_tmp_99, or_1109_nl, fsm_output[7]);
  assign mux_844_nl = MUX_s_1_2_2(or_tmp_1059, mux_843_nl, fsm_output[2]);
  assign mux_848_nl = MUX_s_1_2_2(mux_847_nl, mux_844_nl, fsm_output[5]);
  assign and_176_nl = (~ mux_848_nl) & and_dcpl_41;
  assign COMP_LOOP_or_39_nl = (and_dcpl_31 & and_dcpl_52 & and_dcpl_29) | (and_dcpl_132
      & and_dcpl_36) | (nor_tmp_16 & not_tmp_64 & and_dcpl_29) | (and_dcpl_38 & not_tmp_64
      & and_dcpl_36) | (and_dcpl_31 & and_dcpl_37 & and_dcpl_29) | (and_dcpl_180
      & and_dcpl_76) | (and_dcpl_180 & and_dcpl_80) | (and_dcpl_38 & and_363_cse
      & and_dcpl_76);
  assign nl_COMP_LOOP_1_modulo_dev_cmp_base_rsc_dat = MUX1HOT_v_64_3_2((readslicef_65_64_1(acc_4_nl)),
      COMP_LOOP_1_acc_8_itm, z_out_3, {COMP_LOOP_or_20_itm , and_176_nl , COMP_LOOP_or_39_nl});
  wire [63:0] nl_COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat = p_sva;
  wire[0:0] mux_857_nl;
  wire[0:0] mux_856_nl;
  wire[0:0] mux_855_nl;
  wire[0:0] or_1121_nl;
  wire[0:0] mux_854_nl;
  wire[0:0] nor_188_nl;
  wire[0:0] or_1119_nl;
  wire[0:0] mux_853_nl;
  wire[0:0] mux_852_nl;
  wire[0:0] or_1115_nl;
  wire[0:0] mux_850_nl;
  wire[0:0] or_1113_nl;
  wire [0:0] nl_COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat;
  assign nor_188_nl = ~((fsm_output[0]) | (~ (fsm_output[4])));
  assign mux_854_nl = MUX_s_1_2_2(nor_188_nl, or_tmp_1063, fsm_output[7]);
  assign or_1121_nl = (fsm_output[3]) | (~ mux_854_nl);
  assign mux_855_nl = MUX_s_1_2_2(or_1121_nl, nand_tmp_100, fsm_output[6]);
  assign or_1119_nl = (fsm_output[6]) | mux_tmp_832;
  assign mux_856_nl = MUX_s_1_2_2(mux_855_nl, or_1119_nl, fsm_output[5]);
  assign or_1115_nl = (fsm_output[3]) | (~ (fsm_output[7])) | (fsm_output[0]) | (~
      (fsm_output[4]));
  assign mux_852_nl = MUX_s_1_2_2(mux_tmp_832, or_1115_nl, fsm_output[6]);
  assign or_1113_nl = (fsm_output[3]) | (fsm_output[7]) | (~ or_tmp_1063);
  assign mux_850_nl = MUX_s_1_2_2(nand_tmp_100, or_1113_nl, fsm_output[6]);
  assign mux_853_nl = MUX_s_1_2_2(mux_852_nl, mux_850_nl, fsm_output[5]);
  assign mux_857_nl = MUX_s_1_2_2(mux_856_nl, mux_853_nl, fsm_output[2]);
  assign nl_COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat = ~(mux_857_nl | (fsm_output[1]));
  wire[0:0] and_415_nl;
  wire [3:0] nl_COMP_LOOP_5_tmp_lshift_rg_s;
  assign and_415_nl = (fsm_output==8'b00000010);
  assign nl_COMP_LOOP_5_tmp_lshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, z_out_6,
      and_415_nl);
  wire[0:0] COMP_LOOP_tmp_or_30_nl;
  wire [3:0] nl_COMP_LOOP_1_tmp_lshift_rg_s;
  assign COMP_LOOP_tmp_or_30_nl = (and_dcpl_31 & (~ (fsm_output[4])) & (fsm_output[0])
      & (fsm_output[1]) & (~ (fsm_output[2])) & nor_625_cse) | (and_dcpl_31 & (~
      (fsm_output[4])) & (~ (fsm_output[0])) & (~ (fsm_output[1])) & (fsm_output[2])
      & nor_625_cse);
  assign nl_COMP_LOOP_1_tmp_lshift_rg_s = MUX_v_4_2_2(z_out_6, COMP_LOOP_1_tmp_acc_cse_sva,
      COMP_LOOP_tmp_or_30_nl);
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_28_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_28_tr0 = ~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_56_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_56_tr0 = ~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_84_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_84_tr0 = ~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_112_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_112_tr0 = ~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_140_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_140_tr0 = ~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_168_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_168_tr0 = ~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_196_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_196_tr0 = ~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_224_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_224_tr0 = ~ COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm;
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = z_out_5[10];
  wire [0:0] nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = ~ (z_out_4[4]);
  ccs_in_v1 #(.rscid(32'sd5),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_15_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_15_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_14_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_14_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_13_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_13_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_12_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_12_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_11_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_11_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_10_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_10_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_9_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_9_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_8_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_8_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_7_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_7_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_6_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_6_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_5_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_5_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_4_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_4_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_3_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_3_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_2_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_1_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(vec_rsc_triosy_0_0_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(r_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_15_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_15_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_14_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_14_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_13_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_13_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_12_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_12_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_11_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_11_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_10_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_10_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_9_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_9_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_8_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_8_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_7_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_7_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_6_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_6_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_5_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_5_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_4_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_4_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_3_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_3_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_2_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_1_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_15_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_0_lz)
    );
  modulo_dev  COMP_LOOP_1_modulo_dev_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_dev_cmp_base_rsc_dat[63:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat[63:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_dev_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en)
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
      .ensig_cgo_iro(mux_842_rmff),
      .ensig_cgo(reg_ensig_cgo_cse),
      .COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en)
    );
  inPlaceNTT_DIF_core_core_fsm inPlaceNTT_DIF_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .COMP_LOOP_C_28_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_28_tr0[0:0]),
      .COMP_LOOP_C_56_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_56_tr0[0:0]),
      .COMP_LOOP_C_84_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_84_tr0[0:0]),
      .COMP_LOOP_C_112_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_112_tr0[0:0]),
      .COMP_LOOP_C_140_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_140_tr0[0:0]),
      .COMP_LOOP_C_168_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_168_tr0[0:0]),
      .COMP_LOOP_C_196_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_196_tr0[0:0]),
      .COMP_LOOP_C_224_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_224_tr0[0:0]),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign and_334_cse = (fsm_output[2]) & (fsm_output[0]);
  assign nand_199_cse = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[0]) & (fsm_output[6])
      & (fsm_output[4]));
  assign nand_186_cse = ~((VEC_LOOP_j_10_0_sva_9_0[1]) & (COMP_LOOP_acc_13_psp_sva[1:0]==2'b01)
      & COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm);
  assign nand_172_cse = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3]) & (fsm_output[6])
      & (fsm_output[4]));
  assign nand_168_cse = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3]) & (COMP_LOOP_acc_10_cse_10_1_5_sva[0])
      & (fsm_output[6]) & (fsm_output[4]));
  assign nand_165_cse = ~((VEC_LOOP_j_10_0_sva_9_0[1]) & (COMP_LOOP_acc_13_psp_sva[1:0]==2'b10)
      & COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm);
  assign nand_153_cse = ~((~ (VEC_LOOP_j_10_0_sva_9_0[1])) & (COMP_LOOP_acc_13_psp_sva[1:0]==2'b11)
      & COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm);
  assign nand_154_cse = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:2]==2'b11) & (fsm_output[6])
      & (fsm_output[4]));
  assign nand_132_cse = ~((VEC_LOOP_j_10_0_sva_9_0[1]) & (COMP_LOOP_acc_13_psp_sva[1:0]==2'b11)
      & COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm);
  assign nand_114_cse = ~((z_out_2[0]) & (fsm_output[3]));
  assign nand_113_cse = ~((z_out_2[1:0]==2'b11) & (fsm_output[3]));
  assign or_1107_nl = (fsm_output[4]) | mux_120_cse;
  assign mux_840_nl = MUX_s_1_2_2(nand_tmp_99, or_1107_nl, fsm_output[7]);
  assign mux_841_nl = MUX_s_1_2_2(or_tmp_1059, mux_840_nl, fsm_output[2]);
  assign nor_189_nl = ~((~((fsm_output[4:3]!=2'b01))) | (fsm_output[6]));
  assign mux_837_nl = MUX_s_1_2_2(nand_tmp_99, nor_189_nl, fsm_output[7]);
  assign mux_838_nl = MUX_s_1_2_2(mux_837_nl, (~ and_344_cse), fsm_output[2]);
  assign mux_842_rmff = MUX_s_1_2_2(mux_841_nl, mux_838_nl, fsm_output[5]);
  assign or_170_cse_1 = (fsm_output[4:3]!=2'b00);
  assign nor_652_cse = ~((fsm_output[2:1]!=2'b00));
  assign or_93_cse = (fsm_output[2]) | (fsm_output[0]);
  assign or_41_cse = (fsm_output[2]) | (fsm_output[5]);
  assign mux_84_cse = MUX_s_1_2_2(nor_tmp_15, nor_tmp_13, fsm_output[2]);
  assign mux_85_cse = MUX_s_1_2_2(not_tmp_39, mux_84_cse, fsm_output[5]);
  assign or_60_cse = (fsm_output[6]) | (fsm_output[4]);
  assign or_1226_cse = (fsm_output[4]) | (fsm_output[6]) | (fsm_output[3]);
  assign and_364_cse = or_1226_cse & (fsm_output[7]);
  assign nor_543_cse = ~((fsm_output[2]) | (fsm_output[6]) | (fsm_output[3]) | (fsm_output[4])
      | (fsm_output[7]));
  assign and_344_cse = (fsm_output[7:6]==2'b11);
  assign COMP_LOOP_tmp_or_cse = and_dcpl_47 | and_dcpl_50 | and_dcpl_128 | and_dcpl_129
      | and_dcpl_130 | and_dcpl_131;
  assign COMP_LOOP_or_35_cse = and_dcpl_128 | and_dcpl_131;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse = (z_out_2[3:0]==4'b0011);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse = (z_out_2[3:0]==4'b1011);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse = (z_out_2[3:0]==4'b0101);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse = (z_out_2[3:0]==4'b1100);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse = (z_out_2[3:0]==4'b0110);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse = (z_out_2[3:0]==4'b1101);
  assign COMP_LOOP_tmp_or_3_cse = and_dcpl_47 | and_dcpl_50 | and_dcpl_128 | and_dcpl_129
      | and_dcpl_130 | and_dcpl_133;
  assign COMP_LOOP_or_34_cse = and_dcpl_130 | and_dcpl_133;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse = (z_out_2[3:0]==4'b0111);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse = (z_out_2[3:0]==4'b1110);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_21_cse = (z_out_2[2:0]==3'b111);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse = (z_out_2[3:0]==4'b1001);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse = (z_out_2[3:0]==4'b1111);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse = ~((z_out_2[2:0]!=3'b000));
  assign COMP_LOOP_tmp_or_5_cse = and_dcpl_47 | and_dcpl_50 | and_dcpl_129 | and_dcpl_130
      | and_dcpl_133;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse = (z_out_2[3:0]==4'b1010);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_nor_cse = ~((z_out_2[3:0]!=4'b0000));
  assign COMP_LOOP_or_25_cse = and_dcpl_50 | and_dcpl_129;
  assign COMP_LOOP_tmp_nor_1_cse = ~((z_out_2[3]) | (z_out_2[2]) | (z_out_2[0]));
  assign COMP_LOOP_or_24_cse = and_dcpl_129 | and_dcpl_130 | and_dcpl_133;
  assign COMP_LOOP_tmp_nor_13_cse = ~((z_out_2[3:1]!=3'b000));
  assign COMP_LOOP_tmp_nor_3_cse = ~((z_out_2[3]) | (z_out_2[1]) | (z_out_2[0]));
  assign COMP_LOOP_or_20_itm = and_dcpl_128 | and_dcpl_165 | and_dcpl_167 | and_dcpl_171
      | and_dcpl_174 | and_dcpl_179 | and_dcpl_182 | and_dcpl_185;
  assign or_1233_cse = (fsm_output[4:2]!=3'b000);
  assign mux_120_cse = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[3]);
  assign and_245_m1c = and_dcpl_132 & and_dcpl_46;
  assign mux_1014_nl = MUX_s_1_2_2(mux_tmp_994, mux_tmp_855, fsm_output[0]);
  assign mux_1015_nl = MUX_s_1_2_2(mux_1014_nl, mux_tmp_991, fsm_output[2]);
  assign mux_1016_nl = MUX_s_1_2_2(mux_1015_nl, (fsm_output[7]), fsm_output[5]);
  assign mux_1011_nl = MUX_s_1_2_2(mux_tmp_855, mux_tmp_991, fsm_output[2]);
  assign mux_1012_nl = MUX_s_1_2_2(mux_1011_nl, (fsm_output[7]), fsm_output[5]);
  assign mux_1017_tmp = MUX_s_1_2_2(mux_1016_nl, mux_1012_nl, fsm_output[1]);
  assign and_363_cse = (fsm_output[4]) & (fsm_output[7]);
  assign or_139_cse = (fsm_output[3]) | (fsm_output[6]);
  assign nl_COMP_LOOP_1_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b000}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_1_acc_10_nl = nl_COMP_LOOP_1_acc_10_nl[10:0];
  assign COMP_LOOP_1_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_1_acc_10_nl);
  assign nl_COMP_LOOP_acc_psp_sva_mx0w0 = (VEC_LOOP_j_10_0_sva_9_0[9:3]) + COMP_LOOP_k_10_3_sva_6_0;
  assign COMP_LOOP_acc_psp_sva_mx0w0 = nl_COMP_LOOP_acc_psp_sva_mx0w0[6:0];
  assign nl_COMP_LOOP_acc_1_cse_6_sva_1 = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_3_sva_6_0
      , 3'b101});
  assign COMP_LOOP_acc_1_cse_6_sva_1 = nl_COMP_LOOP_acc_1_cse_6_sva_1[9:0];
  assign nl_COMP_LOOP_acc_1_cse_4_sva_1 = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_3_sva_6_0
      , 3'b011});
  assign COMP_LOOP_acc_1_cse_4_sva_1 = nl_COMP_LOOP_acc_1_cse_4_sva_1[9:0];
  assign nl_COMP_LOOP_acc_1_cse_2_sva_1 = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_3_sva_6_0
      , 3'b001});
  assign COMP_LOOP_acc_1_cse_2_sva_1 = nl_COMP_LOOP_acc_1_cse_2_sva_1[9:0];
  assign nl_COMP_LOOP_2_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b001}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_2_acc_10_nl = nl_COMP_LOOP_2_acc_10_nl[10:0];
  assign COMP_LOOP_2_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_2_acc_10_nl);
  assign nl_COMP_LOOP_3_acc_10_nl = conv_u2u_10_11(VEC_LOOP_j_10_0_sva_9_0) + conv_u2u_10_11({COMP_LOOP_k_10_3_sva_6_0
      , 3'b010}) + STAGE_LOOP_lshift_psp_sva;
  assign COMP_LOOP_3_acc_10_nl = nl_COMP_LOOP_3_acc_10_nl[10:0];
  assign COMP_LOOP_3_acc_10_itm_10_1_1 = readslicef_11_10_1(COMP_LOOP_3_acc_10_nl);
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
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_63_rgt = (COMP_LOOP_2_tmp_lshift_ncse_sva[1])
      & COMP_LOOP_tmp_nor_14_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_65_rgt = (COMP_LOOP_2_tmp_lshift_ncse_sva[2])
      & COMP_LOOP_tmp_nor_16_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_69_rgt = (COMP_LOOP_2_tmp_lshift_ncse_sva[3])
      & COMP_LOOP_tmp_nor_19_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_78 = (COMP_LOOP_2_tmp_mul_idiv_sva[0]) &
      COMP_LOOP_tmp_nor_1_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_80 = (COMP_LOOP_2_tmp_mul_idiv_sva[1]) &
      COMP_LOOP_tmp_nor_14_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_82 = (COMP_LOOP_2_tmp_mul_idiv_sva[2]) &
      COMP_LOOP_tmp_nor_16_itm;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_84 = (COMP_LOOP_2_tmp_mul_idiv_sva[3]) &
      COMP_LOOP_tmp_nor_19_itm;
  assign and_dcpl_4 = ~((fsm_output[7:6]!=2'b00));
  assign nor_tmp = (fsm_output[4:3]==2'b11);
  assign and_393_cse = (fsm_output[4:2]==3'b111);
  assign mux_tmp_6 = MUX_s_1_2_2((~ or_1233_cse), and_393_cse, fsm_output[5]);
  assign mux_tmp_8 = MUX_s_1_2_2((fsm_output[4]), or_170_cse_1, fsm_output[2]);
  assign nor_tmp_13 = (fsm_output[4]) & (fsm_output[6]);
  assign nor_tmp_15 = (fsm_output[4]) & (fsm_output[3]) & (fsm_output[6]);
  assign nor_tmp_16 = (fsm_output[3]) & (fsm_output[6]);
  assign nor_tmp_17 = or_170_cse_1 & (fsm_output[6]);
  assign not_tmp_39 = ~((fsm_output[2]) | (fsm_output[4]) | (fsm_output[3]) | (fsm_output[6]));
  assign nor_tmp_42 = or_60_cse & (fsm_output[7]);
  assign not_tmp_64 = ~((fsm_output[4]) | (fsm_output[7]));
  assign not_tmp_68 = ~((fsm_output[6]) & (fsm_output[4]));
  assign or_1220_cse = nor_tmp | (fsm_output[6]);
  assign nor_tmp_57 = or_1220_cse & (fsm_output[7]);
  assign mux_205_cse = MUX_s_1_2_2(nor_tmp_42, and_364_cse, fsm_output[2]);
  assign not_tmp_120 = ~((fsm_output[2]) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[7]));
  assign and_dcpl_27 = ~((fsm_output[5]) | (fsm_output[1]));
  assign and_dcpl_28 = ~((fsm_output[0]) | (fsm_output[2]));
  assign and_dcpl_29 = and_dcpl_28 & and_dcpl_27;
  assign and_dcpl_31 = ~((fsm_output[6]) | (fsm_output[3]));
  assign and_dcpl_32 = and_dcpl_31 & not_tmp_64;
  assign and_dcpl_34 = (fsm_output[5]) & (~ (fsm_output[1]));
  assign and_dcpl_35 = (~ (fsm_output[0])) & (fsm_output[2]);
  assign and_dcpl_36 = and_dcpl_35 & and_dcpl_34;
  assign and_dcpl_37 = (~ (fsm_output[4])) & (fsm_output[7]);
  assign and_dcpl_38 = (fsm_output[6]) & (~ (fsm_output[3]));
  assign and_dcpl_39 = and_dcpl_38 & and_dcpl_37;
  assign and_tmp_12 = (fsm_output[7]) & nor_tmp_17;
  assign mux_tmp_264 = MUX_s_1_2_2(and_tmp_12, and_344_cse, fsm_output[2]);
  assign and_tmp_13 = (fsm_output[5]) & mux_tmp_264;
  assign and_dcpl_41 = (fsm_output[1:0]==2'b01);
  assign xor_dcpl_2 = (fsm_output[6]) ^ (fsm_output[3]);
  assign and_dcpl_45 = (~ (fsm_output[5])) & (fsm_output[1]);
  assign and_dcpl_46 = and_dcpl_28 & and_dcpl_45;
  assign and_dcpl_47 = and_dcpl_32 & and_dcpl_46;
  assign and_dcpl_48 = (fsm_output[0]) & (~ (fsm_output[2]));
  assign and_dcpl_50 = and_dcpl_32 & and_dcpl_48 & and_dcpl_45;
  assign and_dcpl_51 = and_dcpl_35 & and_dcpl_45;
  assign and_dcpl_52 = (fsm_output[4]) & (~ (fsm_output[7]));
  assign and_dcpl_53 = (~ (fsm_output[6])) & (fsm_output[3]);
  assign and_dcpl_54 = and_dcpl_53 & and_dcpl_52;
  assign and_dcpl_57 = and_334_cse & and_dcpl_45;
  assign and_dcpl_58 = and_dcpl_54 & and_dcpl_57;
  assign and_dcpl_59 = (fsm_output[5]) & (fsm_output[1]);
  assign and_dcpl_60 = and_dcpl_28 & and_dcpl_59;
  assign and_dcpl_62 = and_dcpl_48 & and_dcpl_59;
  assign and_dcpl_63 = and_dcpl_54 & and_dcpl_62;
  assign and_dcpl_64 = and_dcpl_38 & and_dcpl_52;
  assign and_dcpl_66 = and_dcpl_64 & and_dcpl_57;
  assign and_dcpl_68 = and_dcpl_64 & and_dcpl_62;
  assign and_dcpl_69 = and_dcpl_53 & and_dcpl_37;
  assign and_dcpl_71 = and_dcpl_69 & and_dcpl_57;
  assign and_dcpl_73 = and_dcpl_69 & and_dcpl_62;
  assign and_dcpl_75 = and_dcpl_39 & and_dcpl_57;
  assign and_dcpl_76 = and_dcpl_35 & and_dcpl_27;
  assign and_dcpl_78 = and_334_cse & and_dcpl_27;
  assign and_dcpl_80 = and_dcpl_28 & and_dcpl_34;
  assign and_dcpl_82 = and_dcpl_48 & and_dcpl_34;
  assign or_tmp_160 = (COMP_LOOP_acc_14_psp_sva[0]) | (~ (fsm_output[6]));
  assign or_206_cse = (COMP_LOOP_acc_14_psp_sva[2:1]!=2'b00);
  assign nor_531_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b000) | (~ (fsm_output[6])));
  assign nor_532_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2]) | (COMP_LOOP_acc_psp_sva[0])
      | (VEC_LOOP_j_10_0_sva_9_0[1]) | (fsm_output[6]));
  assign mux_296_nl = MUX_s_1_2_2(nor_531_nl, nor_532_nl, fsm_output[3]);
  assign nand_13_nl = ~((fsm_output[4]) & mux_296_nl);
  assign or_208_nl = (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b00) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]);
  assign mux_294_nl = MUX_s_1_2_2(or_tmp_160, or_208_nl, fsm_output[3]);
  assign or_207_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b00)
      | (VEC_LOOP_j_10_0_sva_9_0[1]) | (fsm_output[6]);
  assign mux_295_nl = MUX_s_1_2_2(mux_294_nl, or_207_nl, or_206_cse);
  assign or_210_nl = (fsm_output[4]) | mux_295_nl;
  assign mux_tmp_278 = MUX_s_1_2_2(nand_13_nl, or_210_nl, fsm_output[7]);
  assign or_tmp_170 = (COMP_LOOP_acc_10_cse_10_1_7_sva[1:0]!=2'b00) | (~ (fsm_output[6]));
  assign or_215_cse = (COMP_LOOP_acc_10_cse_10_1_7_sva[3:2]!=2'b00);
  assign not_tmp_143 = ~((COMP_LOOP_acc_1_cse_sva[0]) & (fsm_output[6]));
  assign not_tmp_144 = ~((COMP_LOOP_acc_1_cse_4_sva[0]) & (fsm_output[6]));
  assign not_tmp_146 = ~((COMP_LOOP_acc_10_cse_10_1_sva[0]) & (fsm_output[6]));
  assign or_tmp_220 = (COMP_LOOP_acc_10_cse_10_1_7_sva[1]) | (~((COMP_LOOP_acc_10_cse_10_1_7_sva[0])
      & (fsm_output[6])));
  assign not_tmp_160 = ~((COMP_LOOP_acc_14_psp_sva[0]) & (fsm_output[6]));
  assign nor_497_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b001) | (~ (fsm_output[6])));
  assign nor_498_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2]) | (COMP_LOOP_acc_psp_sva[0])
      | (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (fsm_output[6]));
  assign mux_356_nl = MUX_s_1_2_2(nor_497_nl, nor_498_nl, fsm_output[3]);
  assign nand_24_nl = ~((fsm_output[4]) & mux_356_nl);
  assign or_317_nl = (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b00) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]);
  assign mux_354_nl = MUX_s_1_2_2(not_tmp_160, or_317_nl, fsm_output[3]);
  assign or_316_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b00)
      | (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (fsm_output[6]);
  assign mux_355_nl = MUX_s_1_2_2(mux_354_nl, or_316_nl, or_206_cse);
  assign or_318_nl = (fsm_output[4]) | mux_355_nl;
  assign mux_tmp_338 = MUX_s_1_2_2(nand_24_nl, or_318_nl, fsm_output[7]);
  assign or_tmp_278 = (COMP_LOOP_acc_10_cse_10_1_7_sva[1:0]!=2'b10) | (~ (fsm_output[6]));
  assign not_tmp_168 = ~((COMP_LOOP_acc_1_cse_sva[1:0]==2'b11) & (fsm_output[6]));
  assign not_tmp_170 = ~((COMP_LOOP_acc_10_cse_10_1_sva[1:0]==2'b11) & (fsm_output[6]));
  assign not_tmp_173 = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[1:0]==2'b11) & (fsm_output[6]));
  assign not_tmp_184 = ~((COMP_LOOP_acc_11_psp_sva[1]) & (fsm_output[6]));
  assign nor_99_cse = ~((COMP_LOOP_acc_14_psp_sva[2:1]!=2'b01));
  assign nor_463_nl = ~((COMP_LOOP_acc_11_psp_sva[0]) | (COMP_LOOP_acc_11_psp_sva[2])
      | not_tmp_184);
  assign nor_464_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (COMP_LOOP_acc_psp_sva[0])
      | (VEC_LOOP_j_10_0_sva_9_0[1]) | (fsm_output[6]));
  assign mux_416_nl = MUX_s_1_2_2(nor_463_nl, nor_464_nl, fsm_output[3]);
  assign nand_35_nl = ~((fsm_output[4]) & mux_416_nl);
  assign or_423_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b01)
      | (VEC_LOOP_j_10_0_sva_9_0[1]) | (fsm_output[6]);
  assign or_422_nl = (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b01) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]);
  assign mux_414_nl = MUX_s_1_2_2(or_tmp_160, or_422_nl, fsm_output[3]);
  assign mux_415_nl = MUX_s_1_2_2(or_423_nl, mux_414_nl, nor_99_cse);
  assign or_424_nl = (fsm_output[4]) | mux_415_nl;
  assign mux_tmp_398 = MUX_s_1_2_2(nand_35_nl, or_424_nl, fsm_output[7]);
  assign nor_101_cse = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:2]!=2'b01));
  assign nor_429_nl = ~((~ (COMP_LOOP_acc_11_psp_sva[0])) | (COMP_LOOP_acc_11_psp_sva[2])
      | not_tmp_184);
  assign nor_430_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (COMP_LOOP_acc_psp_sva[0])
      | (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (fsm_output[6]));
  assign mux_476_nl = MUX_s_1_2_2(nor_429_nl, nor_430_nl, fsm_output[3]);
  assign nand_46_nl = ~((fsm_output[4]) & mux_476_nl);
  assign or_525_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b01)
      | (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (fsm_output[6]);
  assign or_524_nl = (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b01) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]);
  assign mux_474_nl = MUX_s_1_2_2(not_tmp_160, or_524_nl, fsm_output[3]);
  assign mux_475_nl = MUX_s_1_2_2(or_525_nl, mux_474_nl, nor_99_cse);
  assign or_526_nl = (fsm_output[4]) | mux_475_nl;
  assign mux_tmp_458 = MUX_s_1_2_2(nand_46_nl, or_526_nl, fsm_output[7]);
  assign not_tmp_226 = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3]) & (fsm_output[6]));
  assign or_624_cse = (COMP_LOOP_acc_14_psp_sva[2:1]!=2'b10);
  assign nor_395_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b100) | (~ (fsm_output[6])));
  assign nor_396_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2]) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (VEC_LOOP_j_10_0_sva_9_0[1]) | (fsm_output[6]));
  assign mux_536_nl = MUX_s_1_2_2(nor_395_nl, nor_396_nl, fsm_output[3]);
  assign nand_57_nl = ~((fsm_output[4]) & mux_536_nl);
  assign or_626_nl = (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b10) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]);
  assign mux_534_nl = MUX_s_1_2_2(or_tmp_160, or_626_nl, fsm_output[3]);
  assign or_625_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b10)
      | (VEC_LOOP_j_10_0_sva_9_0[1]) | (fsm_output[6]);
  assign mux_535_nl = MUX_s_1_2_2(mux_534_nl, or_625_nl, or_624_cse);
  assign or_627_nl = (fsm_output[4]) | mux_535_nl;
  assign mux_tmp_518 = MUX_s_1_2_2(nand_57_nl, or_627_nl, fsm_output[7]);
  assign not_tmp_229 = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3]) & (fsm_output[6]));
  assign or_632_cse = (COMP_LOOP_acc_10_cse_10_1_7_sva[3:2]!=2'b10);
  assign not_tmp_237 = ~((COMP_LOOP_acc_1_cse_4_sva[3]) & (COMP_LOOP_acc_1_cse_4_sva[0])
      & (fsm_output[6]));
  assign and_395_nl = (COMP_LOOP_acc_11_psp_sva[2:0]==3'b101) & (fsm_output[6]);
  assign nor_362_nl = ~((VEC_LOOP_j_10_0_sva_9_0[2]) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (fsm_output[6]));
  assign mux_596_nl = MUX_s_1_2_2(and_395_nl, nor_362_nl, fsm_output[3]);
  assign nand_68_nl = ~((fsm_output[4]) & mux_596_nl);
  assign or_731_nl = (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b10) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]);
  assign mux_594_nl = MUX_s_1_2_2(not_tmp_160, or_731_nl, fsm_output[3]);
  assign or_730_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b10)
      | (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (fsm_output[6]);
  assign mux_595_nl = MUX_s_1_2_2(mux_594_nl, or_730_nl, or_624_cse);
  assign or_732_nl = (fsm_output[4]) | mux_595_nl;
  assign mux_tmp_578 = MUX_s_1_2_2(nand_68_nl, or_732_nl, fsm_output[7]);
  assign not_tmp_273 = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:2]==2'b11) & (fsm_output[6]));
  assign and_293_cse = (COMP_LOOP_acc_14_psp_sva[2:1]==2'b11);
  assign nor_327_nl = ~((COMP_LOOP_acc_11_psp_sva[0]) | (~((COMP_LOOP_acc_11_psp_sva[2:1]==2'b11)
      & (fsm_output[6]))));
  assign nor_328_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (VEC_LOOP_j_10_0_sva_9_0[1]) | (fsm_output[6]));
  assign mux_656_nl = MUX_s_1_2_2(nor_327_nl, nor_328_nl, fsm_output[3]);
  assign nand_79_nl = ~((fsm_output[4]) & mux_656_nl);
  assign or_834_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b11)
      | (VEC_LOOP_j_10_0_sva_9_0[1]) | (fsm_output[6]);
  assign or_833_nl = (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b11) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]);
  assign mux_654_nl = MUX_s_1_2_2(or_tmp_160, or_833_nl, fsm_output[3]);
  assign mux_655_nl = MUX_s_1_2_2(or_834_nl, mux_654_nl, and_293_cse);
  assign or_835_nl = (fsm_output[4]) | mux_655_nl;
  assign mux_tmp_638 = MUX_s_1_2_2(nand_79_nl, or_835_nl, fsm_output[7]);
  assign not_tmp_277 = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:2]==2'b11) & (fsm_output[6]));
  assign and_292_cse = (COMP_LOOP_acc_10_cse_10_1_7_sva[3:2]==2'b11);
  assign and_282_nl = (COMP_LOOP_acc_11_psp_sva[2:0]==3'b111) & (fsm_output[6]);
  assign and_283_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) & (COMP_LOOP_acc_psp_sva[0]) &
      (VEC_LOOP_j_10_0_sva_9_0[1]) & (~ (fsm_output[6]));
  assign mux_716_nl = MUX_s_1_2_2(and_282_nl, and_283_nl, fsm_output[3]);
  assign nand_90_nl = ~((fsm_output[4]) & mux_716_nl);
  assign nand_144_nl = ~((fsm_output[3]) & (COMP_LOOP_acc_13_psp_sva[1:0]==2'b11)
      & (VEC_LOOP_j_10_0_sva_9_0[1]) & (~ (fsm_output[6])));
  assign nand_145_nl = ~((COMP_LOOP_acc_13_psp_sva[1:0]==2'b11) & (VEC_LOOP_j_10_0_sva_9_0[1])
      & (~ (fsm_output[6])));
  assign mux_714_nl = MUX_s_1_2_2(not_tmp_160, nand_145_nl, fsm_output[3]);
  assign mux_715_nl = MUX_s_1_2_2(nand_144_nl, mux_714_nl, and_293_cse);
  assign or_934_nl = (fsm_output[4]) | mux_715_nl;
  assign mux_tmp_698 = MUX_s_1_2_2(nand_90_nl, or_934_nl, fsm_output[7]);
  assign and_dcpl_128 = and_dcpl_32 & and_dcpl_76;
  assign and_dcpl_129 = and_dcpl_32 & and_dcpl_78;
  assign and_dcpl_130 = and_dcpl_32 & and_dcpl_51;
  assign and_dcpl_131 = and_dcpl_32 & and_dcpl_57;
  assign and_dcpl_132 = and_dcpl_53 & not_tmp_64;
  assign and_dcpl_133 = and_dcpl_132 & and_dcpl_29;
  assign and_dcpl_134 = and_dcpl_48 & and_dcpl_27;
  assign and_dcpl_135 = and_dcpl_132 & and_dcpl_134;
  assign and_dcpl_137 = ~((fsm_output[6]) | (fsm_output[4]));
  assign and_dcpl_138 = and_dcpl_137 & (~ (fsm_output[7])) & (~ (fsm_output[5]));
  assign nand_tmp_99 = ~((fsm_output[4]) & xor_dcpl_2);
  assign or_tmp_1059 = (fsm_output[7]) | (fsm_output[4]) | (fsm_output[3]) | (fsm_output[6]);
  assign mux_tmp_826 = MUX_s_1_2_2((~ nor_tmp_16), or_139_cse, fsm_output[4]);
  assign and_dcpl_165 = and_dcpl_32 & and_dcpl_80;
  assign and_dcpl_167 = and_dcpl_54 & and_dcpl_36;
  assign and_dcpl_171 = nor_tmp_16 & and_dcpl_52 & and_dcpl_29;
  assign and_dcpl_174 = and_dcpl_64 & and_dcpl_36;
  assign and_dcpl_179 = and_dcpl_31 & and_363_cse & and_dcpl_29;
  assign and_dcpl_180 = and_dcpl_53 & and_363_cse;
  assign and_dcpl_182 = and_dcpl_69 & and_dcpl_36;
  assign and_dcpl_185 = nor_tmp_16 & and_dcpl_37 & and_dcpl_29;
  assign or_tmp_1063 = (~ (fsm_output[0])) | (fsm_output[4]);
  assign mux_849_nl = MUX_s_1_2_2(or_tmp_1063, (~ (fsm_output[4])), fsm_output[7]);
  assign nand_tmp_100 = ~((fsm_output[3]) & mux_849_nl);
  assign or_1221_nl = (fsm_output[4]) | (fsm_output[7]);
  assign or_1117_nl = (~ (fsm_output[7])) | (fsm_output[0]) | (~ (fsm_output[4]));
  assign mux_tmp_832 = MUX_s_1_2_2(or_1221_nl, or_1117_nl, fsm_output[3]);
  assign not_tmp_371 = ~((fsm_output[7:5]!=3'b000));
  assign mux_tmp_840 = MUX_s_1_2_2(nor_543_cse, mux_tmp_264, fsm_output[5]);
  assign or_tmp_1076 = (fsm_output[5]) | (~ (fsm_output[1]));
  assign or_dcpl_55 = or_tmp_1059 | (fsm_output[0]) | (fsm_output[2]) | or_tmp_1076;
  assign mux_tmp_847 = MUX_s_1_2_2(and_tmp_12, and_344_cse, fsm_output[0]);
  assign mux_tmp_848 = MUX_s_1_2_2((~ or_1226_cse), nor_tmp_17, fsm_output[7]);
  assign mux_tmp_849 = MUX_s_1_2_2(mux_tmp_848, and_tmp_12, fsm_output[0]);
  assign mux_871_nl = MUX_s_1_2_2(mux_tmp_848, and_tmp_12, fsm_output[2]);
  assign mux_tmp_853 = MUX_s_1_2_2(mux_871_nl, and_344_cse, fsm_output[5]);
  assign mux_869_nl = MUX_s_1_2_2(mux_tmp_849, mux_tmp_847, fsm_output[2]);
  assign mux_870_nl = MUX_s_1_2_2(mux_869_nl, and_344_cse, fsm_output[5]);
  assign mux_873_itm = MUX_s_1_2_2(mux_tmp_853, mux_870_nl, fsm_output[1]);
  assign mux_tmp_855 = MUX_s_1_2_2((~ or_1226_cse), (fsm_output[6]), fsm_output[7]);
  assign mux_tmp_856 = MUX_s_1_2_2(mux_tmp_855, and_344_cse, or_93_cse);
  assign mux_tmp_857 = MUX_s_1_2_2(mux_tmp_856, and_364_cse, fsm_output[5]);
  assign mux_tmp_859 = MUX_s_1_2_2(mux_tmp_855, and_344_cse, fsm_output[2]);
  assign not_tmp_382 = ~((fsm_output[2]) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[3])
      | (fsm_output[6]));
  assign mux_tmp_862 = MUX_s_1_2_2(not_tmp_382, nor_tmp_13, fsm_output[5]);
  assign not_tmp_385 = ~((fsm_output[2]) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[3]));
  assign mux_tmp_866 = MUX_s_1_2_2(not_tmp_385, nor_tmp, fsm_output[5]);
  assign and_dcpl_200 = (or_1233_cse | ((fsm_output[1:0]==2'b11))) & not_tmp_371;
  assign mux_tmp_873 = MUX_s_1_2_2(and_dcpl_31, nor_tmp_16, fsm_output[4]);
  assign mux_893_nl = MUX_s_1_2_2(mux_tmp_873, nor_tmp_15, fsm_output[0]);
  assign mux_894_nl = MUX_s_1_2_2(mux_893_nl, nor_tmp_13, fsm_output[2]);
  assign mux_tmp_876 = MUX_s_1_2_2(mux_894_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_903_nl = MUX_s_1_2_2(mux_tmp_873, nor_tmp_15, fsm_output[2]);
  assign mux_tmp_885 = MUX_s_1_2_2(mux_903_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_906_nl = MUX_s_1_2_2(not_tmp_385, and_393_cse, fsm_output[5]);
  assign mux_907_nl = MUX_s_1_2_2(mux_tmp_6, mux_906_nl, fsm_output[1]);
  assign and_dcpl_204 = (~ mux_907_nl) & and_dcpl_4;
  assign mux_913_nl = MUX_s_1_2_2(mux_tmp_873, nor_tmp_15, or_93_cse);
  assign mux_914_nl = MUX_s_1_2_2(mux_913_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_915_nl = MUX_s_1_2_2(mux_tmp_885, mux_914_nl, fsm_output[1]);
  assign and_dcpl_207 = ~(mux_915_nl | (fsm_output[7]));
  assign mux_tmp_897 = MUX_s_1_2_2((~ or_1226_cse), or_60_cse, fsm_output[7]);
  assign mux_917_nl = MUX_s_1_2_2(mux_tmp_897, nor_tmp_42, fsm_output[0]);
  assign mux_918_nl = MUX_s_1_2_2(mux_917_nl, and_364_cse, fsm_output[2]);
  assign mux_tmp_900 = MUX_s_1_2_2(mux_918_nl, (fsm_output[7]), fsm_output[5]);
  assign mux_927_nl = MUX_s_1_2_2(mux_tmp_897, nor_tmp_42, fsm_output[2]);
  assign mux_tmp_909 = MUX_s_1_2_2(mux_927_nl, (fsm_output[7]), fsm_output[5]);
  assign mux_930_nl = MUX_s_1_2_2(not_tmp_382, mux_84_cse, fsm_output[5]);
  assign mux_931_nl = MUX_s_1_2_2(mux_85_cse, mux_930_nl, fsm_output[1]);
  assign and_dcpl_208 = ~(mux_931_nl | (fsm_output[7]));
  assign mux_tmp_916 = MUX_s_1_2_2(mux_tmp_859, mux_205_cse, fsm_output[5]);
  assign mux_937_nl = MUX_s_1_2_2(mux_tmp_897, nor_tmp_42, or_93_cse);
  assign mux_938_nl = MUX_s_1_2_2(mux_937_nl, (fsm_output[7]), fsm_output[5]);
  assign mux_939_itm = MUX_s_1_2_2(mux_tmp_909, mux_938_nl, fsm_output[1]);
  assign mux_tmp_921 = MUX_s_1_2_2(mux_tmp_849, and_344_cse, or_41_cse);
  assign mux_946_itm = MUX_s_1_2_2(mux_tmp_853, mux_tmp_921, fsm_output[1]);
  assign mux_947_nl = MUX_s_1_2_2(mux_tmp_856, mux_205_cse, fsm_output[5]);
  assign mux_948_itm = MUX_s_1_2_2(mux_tmp_916, mux_947_nl, fsm_output[1]);
  assign mux_tmp_930 = MUX_s_1_2_2(not_tmp_120, and_344_cse, fsm_output[5]);
  assign mux_956_nl = MUX_s_1_2_2(mux_tmp_848, and_tmp_12, or_93_cse);
  assign mux_957_nl = MUX_s_1_2_2(mux_956_nl, and_344_cse, fsm_output[5]);
  assign mux_958_itm = MUX_s_1_2_2(mux_tmp_853, mux_957_nl, fsm_output[1]);
  assign and_dcpl_211 = ~((fsm_output[2]) | (fsm_output[5]));
  assign and_dcpl_214 = (~ or_1226_cse) & (~ (fsm_output[7])) & (fsm_output[0]);
  assign or_tmp_1101 = (fsm_output[3:2]!=2'b10);
  assign nor_tmp_177 = or_1233_cse & (fsm_output[6]);
  assign mux_tmp_982 = MUX_s_1_2_2((~ or_1226_cse), nor_tmp_13, fsm_output[7]);
  assign mux_tmp_984 = MUX_s_1_2_2(and_dcpl_137, nor_tmp_15, fsm_output[7]);
  assign mux_tmp_991 = MUX_s_1_2_2((~ or_1226_cse), or_1220_cse, fsm_output[7]);
  assign mux_tmp_994 = MUX_s_1_2_2(and_dcpl_137, (fsm_output[6]), fsm_output[7]);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_39 & and_dcpl_36;
  assign VEC_LOOP_j_10_0_sva_9_0_mx0c0 = and_dcpl_32 & and_dcpl_134;
  assign COMP_LOOP_tmp_mux_itm_mx0c1 = and_dcpl_214 & and_dcpl_211 & (fsm_output[1])
      & COMP_LOOP_1_tmp_mul_idiv_sva_0;
  assign or_1174_nl = (~ (fsm_output[2])) | (~ (fsm_output[0])) | (fsm_output[3]);
  assign mux_966_nl = MUX_s_1_2_2(or_tmp_1101, or_1174_nl, fsm_output[1]);
  assign COMP_LOOP_1_acc_8_itm_mx0c2 = (~ mux_966_nl) & and_dcpl_138;
  assign mux_968_nl = MUX_s_1_2_2(mux_tmp_826, or_1226_cse, fsm_output[7]);
  assign nand_102_nl = ~((fsm_output[7]) & (fsm_output[4]) & xor_dcpl_2);
  assign mux_969_nl = MUX_s_1_2_2(mux_968_nl, nand_102_nl, fsm_output[2]);
  assign nand_104_nl = ~((fsm_output[7]) & (fsm_output[4]) & (fsm_output[3]) & (~
      (fsm_output[6])));
  assign or_1177_nl = (fsm_output[7]) | (fsm_output[4]) | mux_120_cse;
  assign mux_967_nl = MUX_s_1_2_2(nand_104_nl, or_1177_nl, fsm_output[2]);
  assign mux_970_nl = MUX_s_1_2_2(mux_969_nl, mux_967_nl, fsm_output[5]);
  assign COMP_LOOP_1_acc_8_itm_mx0c3 = (~ mux_970_nl) & and_dcpl_41;
  assign or_1197_nl = (fsm_output[3:2]!=2'b01);
  assign mux_1000_nl = MUX_s_1_2_2(or_tmp_1101, or_1197_nl, fsm_output[1]);
  assign tmp_21_sva_1_mx0c0 = (~ mux_1000_nl) & (~ (fsm_output[6])) & not_tmp_64
      & (fsm_output[0]) & (~ (fsm_output[5]));
  assign nor_567_nl = ~(and_334_cse | (fsm_output[4:3]!=2'b00));
  assign mux_30_nl = MUX_s_1_2_2(nor_567_nl, mux_tmp_8, fsm_output[5]);
  assign mux_989_nl = MUX_s_1_2_2((~ or_1233_cse), mux_tmp_8, fsm_output[5]);
  assign mux_991_nl = MUX_s_1_2_2(mux_30_nl, mux_989_nl, fsm_output[1]);
  assign and_237_tmp = (~ mux_991_nl) & and_dcpl_4;
  assign or_36_nl = (fsm_output[5:3]!=3'b000);
  assign mux_67_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), or_36_nl);
  assign mux_64_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), or_170_cse_1);
  assign mux_993_nl = MUX_s_1_2_2(mux_64_nl, nor_tmp_17, fsm_output[2]);
  assign mux_994_nl = MUX_s_1_2_2(mux_993_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_996_nl = MUX_s_1_2_2(mux_67_nl, mux_994_nl, fsm_output[1]);
  assign nor_568_tmp = ~(mux_996_nl | (fsm_output[7]));
  assign mux_998_nl = MUX_s_1_2_2((~ or_1226_cse), nor_tmp_177, fsm_output[5]);
  assign nor_180_nl = ~(and_334_cse | (fsm_output[4]) | (fsm_output[3]) | (fsm_output[6]));
  assign mux_997_nl = MUX_s_1_2_2(nor_180_nl, nor_tmp_177, fsm_output[5]);
  assign mux_999_nl = MUX_s_1_2_2(mux_998_nl, mux_997_nl, fsm_output[1]);
  assign nor_tmp_180 = ~(mux_999_nl | (fsm_output[7]));
  assign and_240_tmp = ~((~(or_139_cse | (fsm_output[5:4]!=2'b00))) | (fsm_output[7]));
  assign and_58_nl = xor_dcpl_2 & ((fsm_output[4]) ^ (fsm_output[7])) & ((fsm_output[2])
      ^ (fsm_output[5])) & and_dcpl_41;
  assign vec_rsc_0_0_i_d_d_pff = MUX_v_64_2_2(COMP_LOOP_1_modulo_dev_cmp_return_rsc_z,
      COMP_LOOP_1_acc_8_itm, and_58_nl);
  assign and_69_nl = and_dcpl_54 & and_dcpl_51;
  assign and_75_nl = and_dcpl_54 & and_dcpl_60;
  assign and_79_nl = and_dcpl_64 & and_dcpl_51;
  assign and_81_nl = and_dcpl_64 & and_dcpl_60;
  assign and_84_nl = and_dcpl_69 & and_dcpl_51;
  assign and_86_nl = and_dcpl_69 & and_dcpl_60;
  assign and_88_nl = and_dcpl_39 & and_dcpl_51;
  assign vec_rsc_0_0_i_radr_d_pff = MUX1HOT_v_6_16_2((COMP_LOOP_1_acc_10_itm_10_1_1[9:4]),
      (COMP_LOOP_acc_psp_sva[6:1]), (COMP_LOOP_acc_1_cse_2_sva[9:4]), (COMP_LOOP_acc_10_cse_10_1_2_sva[9:4]),
      (COMP_LOOP_acc_11_psp_sva[8:3]), (COMP_LOOP_acc_10_cse_10_1_3_sva[9:4]), (COMP_LOOP_acc_1_cse_4_sva[9:4]),
      (COMP_LOOP_acc_10_cse_10_1_4_sva[9:4]), (COMP_LOOP_acc_13_psp_sva[7:2]), (COMP_LOOP_acc_10_cse_10_1_5_sva[9:4]),
      (COMP_LOOP_acc_1_cse_6_sva[9:4]), (COMP_LOOP_acc_10_cse_10_1_6_sva[9:4]), (COMP_LOOP_acc_14_psp_sva[8:3]),
      (COMP_LOOP_acc_10_cse_10_1_7_sva[9:4]), (COMP_LOOP_acc_1_cse_sva[9:4]), (COMP_LOOP_acc_10_cse_10_1_sva[9:4]),
      {and_dcpl_47 , and_dcpl_50 , and_69_nl , and_dcpl_58 , and_75_nl , and_dcpl_63
      , and_79_nl , and_dcpl_66 , and_81_nl , and_dcpl_68 , and_84_nl , and_dcpl_71
      , and_86_nl , and_dcpl_73 , and_88_nl , and_dcpl_75});
  assign and_91_nl = and_dcpl_54 & and_dcpl_76;
  assign and_93_nl = and_dcpl_54 & and_dcpl_78;
  assign and_95_nl = and_dcpl_54 & and_dcpl_80;
  assign and_97_nl = and_dcpl_54 & and_dcpl_82;
  assign and_98_nl = and_dcpl_64 & and_dcpl_76;
  assign and_99_nl = and_dcpl_64 & and_dcpl_78;
  assign and_100_nl = and_dcpl_64 & and_dcpl_80;
  assign and_101_nl = and_dcpl_64 & and_dcpl_82;
  assign and_102_nl = and_dcpl_69 & and_dcpl_76;
  assign and_103_nl = and_dcpl_69 & and_dcpl_78;
  assign and_104_nl = and_dcpl_69 & and_dcpl_80;
  assign and_105_nl = and_dcpl_69 & and_dcpl_82;
  assign and_106_nl = and_dcpl_39 & and_dcpl_76;
  assign and_107_nl = and_dcpl_39 & and_dcpl_78;
  assign and_108_nl = and_dcpl_39 & and_dcpl_80;
  assign and_109_nl = and_dcpl_39 & and_dcpl_82;
  assign vec_rsc_0_0_i_wadr_d_pff = MUX1HOT_v_6_16_2((COMP_LOOP_acc_10_cse_10_1_1_sva[9:4]),
      (COMP_LOOP_acc_psp_sva[6:1]), (COMP_LOOP_acc_10_cse_10_1_2_sva[9:4]), (COMP_LOOP_acc_1_cse_2_sva[9:4]),
      (COMP_LOOP_acc_10_cse_10_1_3_sva[9:4]), (COMP_LOOP_acc_11_psp_sva[8:3]), (COMP_LOOP_acc_10_cse_10_1_4_sva[9:4]),
      (COMP_LOOP_acc_1_cse_4_sva[9:4]), (COMP_LOOP_acc_10_cse_10_1_5_sva[9:4]), (COMP_LOOP_acc_13_psp_sva[7:2]),
      (COMP_LOOP_acc_10_cse_10_1_6_sva[9:4]), (COMP_LOOP_acc_1_cse_6_sva[9:4]), (COMP_LOOP_acc_10_cse_10_1_7_sva[9:4]),
      (COMP_LOOP_acc_14_psp_sva[8:3]), (COMP_LOOP_acc_10_cse_10_1_sva[9:4]), (COMP_LOOP_acc_1_cse_sva[9:4]),
      {and_91_nl , and_93_nl , and_95_nl , and_97_nl , and_98_nl , and_99_nl , and_100_nl
      , and_101_nl , and_102_nl , and_103_nl , and_104_nl , and_105_nl , and_106_nl
      , and_107_nl , and_108_nl , and_109_nl});
  assign nor_522_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0000) | (~ (fsm_output[6])));
  assign nor_523_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b0000) | (fsm_output[6]));
  assign mux_300_nl = MUX_s_1_2_2(nor_522_nl, nor_523_nl, fsm_output[3]);
  assign and_329_nl = (fsm_output[4]) & mux_300_nl;
  assign or_217_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0000) | (fsm_output[6]);
  assign mux_298_nl = MUX_s_1_2_2(or_tmp_170, or_217_nl, fsm_output[3]);
  assign or_216_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0000)
      | (fsm_output[6]);
  assign mux_299_nl = MUX_s_1_2_2(mux_298_nl, or_216_nl, or_215_cse);
  assign nor_524_nl = ~((fsm_output[4]) | mux_299_nl);
  assign mux_301_nl = MUX_s_1_2_2(and_329_nl, nor_524_nl, fsm_output[7]);
  assign nor_525_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_tmp_278);
  assign mux_302_nl = MUX_s_1_2_2(mux_301_nl, nor_525_nl, fsm_output[0]);
  assign nand_231_nl = ~((fsm_output[2]) & mux_302_nl);
  assign nor_527_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0000) | (~ (fsm_output[6])));
  assign nor_528_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0000) | (fsm_output[6]));
  assign mux_291_nl = MUX_s_1_2_2(nor_527_nl, nor_528_nl, fsm_output[3]);
  assign nand_12_nl = ~((fsm_output[4]) & mux_291_nl);
  assign or_200_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0000) | (~ (fsm_output[6]));
  assign or_198_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0000) | (fsm_output[6]);
  assign mux_290_nl = MUX_s_1_2_2(or_200_nl, or_198_nl, fsm_output[3]);
  assign or_201_nl = (fsm_output[4]) | mux_290_nl;
  assign mux_292_nl = MUX_s_1_2_2(nand_12_nl, or_201_nl, fsm_output[7]);
  assign nor_529_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0000) | (~ (fsm_output[6])));
  assign nor_530_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0000) | (fsm_output[6]));
  assign mux_288_nl = MUX_s_1_2_2(nor_529_nl, nor_530_nl, fsm_output[3]);
  assign nand_11_nl = ~((fsm_output[4]) & mux_288_nl);
  assign or_193_nl = (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0000) | (~ (fsm_output[6]));
  assign or_191_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0000) | (fsm_output[6]);
  assign mux_287_nl = MUX_s_1_2_2(or_193_nl, or_191_nl, fsm_output[3]);
  assign or_194_nl = (fsm_output[4]) | mux_287_nl;
  assign mux_289_nl = MUX_s_1_2_2(nand_11_nl, or_194_nl, fsm_output[7]);
  assign mux_293_nl = MUX_s_1_2_2(mux_292_nl, mux_289_nl, fsm_output[0]);
  assign or_1256_nl = (fsm_output[2]) | mux_293_nl;
  assign mux_303_nl = MUX_s_1_2_2(nand_231_nl, or_1256_nl, fsm_output[5]);
  assign vec_rsc_0_0_i_we_d_pff = ~(mux_303_nl | (fsm_output[1]));
  assign or_249_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0000) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_248_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) | (COMP_LOOP_acc_psp_sva[0]) |
      (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[3]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_316_nl = MUX_s_1_2_2(or_249_nl, or_248_nl, fsm_output[0]);
  assign nor_515_nl = ~((fsm_output[7]) | mux_316_nl);
  assign or_246_nl = (VEC_LOOP_j_10_0_sva_9_0[1]) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b00)
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_68;
  assign or_244_nl = (COMP_LOOP_acc_11_psp_sva[2:0]!=3'b000) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_313_nl = MUX_s_1_2_2(or_246_nl, or_244_nl, fsm_output[3]);
  assign nor_516_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_313_nl);
  assign nor_517_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0000) | not_tmp_68);
  assign nor_518_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0000) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_312_nl = MUX_s_1_2_2(nor_517_nl, nor_518_nl, fsm_output[3]);
  assign mux_314_nl = MUX_s_1_2_2(nor_516_nl, mux_312_nl, fsm_output[0]);
  assign nor_519_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | (~ (fsm_output[3])) | (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b000)
      | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) | (fsm_output[6]) | (fsm_output[4]));
  assign nor_520_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b0000) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_311_nl = MUX_s_1_2_2(nor_519_nl, nor_520_nl, fsm_output[0]);
  assign mux_315_nl = MUX_s_1_2_2(mux_314_nl, mux_311_nl, fsm_output[7]);
  assign mux_317_nl = MUX_s_1_2_2(nor_515_nl, mux_315_nl, fsm_output[5]);
  assign or_235_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0000) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_233_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0000)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_308_nl = MUX_s_1_2_2(or_235_nl, or_233_nl, fsm_output[3]);
  assign or_231_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0000) | not_tmp_68;
  assign or_229_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0000) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_307_nl = MUX_s_1_2_2(or_231_nl, or_229_nl, fsm_output[3]);
  assign mux_309_nl = MUX_s_1_2_2(mux_308_nl, mux_307_nl, fsm_output[0]);
  assign or_227_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0000)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_226_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0000)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_305_nl = MUX_s_1_2_2(or_227_nl, or_226_nl, fsm_output[3]);
  assign or_225_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0000) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_224_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0000) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_304_nl = MUX_s_1_2_2(or_225_nl, or_224_nl, fsm_output[3]);
  assign mux_306_nl = MUX_s_1_2_2(mux_305_nl, mux_304_nl, fsm_output[0]);
  assign mux_310_nl = MUX_s_1_2_2(mux_309_nl, mux_306_nl, fsm_output[7]);
  assign nor_521_nl = ~((fsm_output[5]) | mux_310_nl);
  assign mux_318_nl = MUX_s_1_2_2(mux_317_nl, nor_521_nl, fsm_output[2]);
  assign vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d = mux_318_nl & (fsm_output[1]);
  assign nor_507_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0001) | (~ (fsm_output[6])));
  assign nor_508_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b0001) | (fsm_output[6]));
  assign mux_328_nl = MUX_s_1_2_2(nor_507_nl, nor_508_nl, fsm_output[3]);
  assign and_326_nl = (fsm_output[4]) & mux_328_nl;
  assign or_268_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0001) | (fsm_output[6]);
  assign mux_326_nl = MUX_s_1_2_2(or_tmp_220, or_268_nl, fsm_output[3]);
  assign or_267_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0001)
      | (fsm_output[6]);
  assign mux_327_nl = MUX_s_1_2_2(mux_326_nl, or_267_nl, or_215_cse);
  assign nor_509_nl = ~((fsm_output[4]) | mux_327_nl);
  assign mux_329_nl = MUX_s_1_2_2(and_326_nl, nor_509_nl, fsm_output[7]);
  assign and_327_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (~ mux_tmp_278);
  assign mux_330_nl = MUX_s_1_2_2(mux_329_nl, and_327_nl, fsm_output[0]);
  assign nand_230_nl = ~((fsm_output[2]) & mux_330_nl);
  assign nor_511_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0001) | (~ (fsm_output[6])));
  assign nor_512_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0001) | (fsm_output[6]));
  assign mux_323_nl = MUX_s_1_2_2(nor_511_nl, nor_512_nl, fsm_output[3]);
  assign nand_17_nl = ~((fsm_output[4]) & mux_323_nl);
  assign or_260_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:1]!=3'b000) | not_tmp_146;
  assign or_258_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0001) | (fsm_output[6]);
  assign mux_322_nl = MUX_s_1_2_2(or_260_nl, or_258_nl, fsm_output[3]);
  assign or_261_nl = (fsm_output[4]) | mux_322_nl;
  assign mux_324_nl = MUX_s_1_2_2(nand_17_nl, or_261_nl, fsm_output[7]);
  assign nor_513_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:1]!=3'b000) | not_tmp_144);
  assign nor_514_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0001) | (fsm_output[6]));
  assign mux_320_nl = MUX_s_1_2_2(nor_513_nl, nor_514_nl, fsm_output[3]);
  assign nand_16_nl = ~((fsm_output[4]) & mux_320_nl);
  assign or_253_nl = (COMP_LOOP_acc_1_cse_sva[3:1]!=3'b000) | not_tmp_143;
  assign or_251_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0001) | (fsm_output[6]);
  assign mux_319_nl = MUX_s_1_2_2(or_253_nl, or_251_nl, fsm_output[3]);
  assign or_254_nl = (fsm_output[4]) | mux_319_nl;
  assign mux_321_nl = MUX_s_1_2_2(nand_16_nl, or_254_nl, fsm_output[7]);
  assign mux_325_nl = MUX_s_1_2_2(mux_324_nl, mux_321_nl, fsm_output[0]);
  assign or_1255_nl = (fsm_output[2]) | mux_325_nl;
  assign mux_331_nl = MUX_s_1_2_2(nand_230_nl, or_1255_nl, fsm_output[5]);
  assign vec_rsc_0_1_i_we_d_pff = ~(mux_331_nl | (fsm_output[1]));
  assign or_298_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0001) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_297_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) | (COMP_LOOP_acc_psp_sva[0]) |
      (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[3]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_344_nl = MUX_s_1_2_2(or_298_nl, or_297_nl, fsm_output[0]);
  assign nor_499_nl = ~((fsm_output[7]) | mux_344_nl);
  assign nor_500_nl = ~((VEC_LOOP_j_10_0_sva_9_0[1]) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b00)
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_68);
  assign nor_501_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b000) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_341_nl = MUX_s_1_2_2(nor_500_nl, nor_501_nl, fsm_output[3]);
  assign and_324_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & mux_341_nl;
  assign nor_502_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:1]!=3'b000) | nand_199_cse);
  assign nor_503_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0001) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_340_nl = MUX_s_1_2_2(nor_502_nl, nor_503_nl, fsm_output[3]);
  assign mux_342_nl = MUX_s_1_2_2(and_324_nl, mux_340_nl, fsm_output[0]);
  assign nor_504_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (~ (fsm_output[3])) |
      (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b000) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (fsm_output[4]));
  assign nor_505_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b0001) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_339_nl = MUX_s_1_2_2(nor_504_nl, nor_505_nl, fsm_output[0]);
  assign mux_343_nl = MUX_s_1_2_2(mux_342_nl, mux_339_nl, fsm_output[7]);
  assign mux_345_nl = MUX_s_1_2_2(nor_499_nl, mux_343_nl, fsm_output[5]);
  assign or_285_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0001) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_283_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0001)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_336_nl = MUX_s_1_2_2(or_285_nl, or_283_nl, fsm_output[3]);
  assign or_281_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0001) | not_tmp_68;
  assign or_279_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0001) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_335_nl = MUX_s_1_2_2(or_281_nl, or_279_nl, fsm_output[3]);
  assign mux_337_nl = MUX_s_1_2_2(mux_336_nl, mux_335_nl, fsm_output[0]);
  assign or_277_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0001)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_276_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0001)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_333_nl = MUX_s_1_2_2(or_277_nl, or_276_nl, fsm_output[3]);
  assign or_275_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0001) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_274_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0001) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_332_nl = MUX_s_1_2_2(or_275_nl, or_274_nl, fsm_output[3]);
  assign mux_334_nl = MUX_s_1_2_2(mux_333_nl, mux_332_nl, fsm_output[0]);
  assign mux_338_nl = MUX_s_1_2_2(mux_337_nl, mux_334_nl, fsm_output[7]);
  assign nor_506_nl = ~((fsm_output[5]) | mux_338_nl);
  assign mux_346_nl = MUX_s_1_2_2(mux_345_nl, nor_506_nl, fsm_output[2]);
  assign vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d = mux_346_nl & (fsm_output[1]);
  assign nor_488_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0010) | (~ (fsm_output[6])));
  assign nor_489_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b0010) | (fsm_output[6]));
  assign mux_360_nl = MUX_s_1_2_2(nor_488_nl, nor_489_nl, fsm_output[3]);
  assign and_323_nl = (fsm_output[4]) & mux_360_nl;
  assign or_325_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0010) | (fsm_output[6]);
  assign mux_358_nl = MUX_s_1_2_2(or_tmp_278, or_325_nl, fsm_output[3]);
  assign or_324_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0010)
      | (fsm_output[6]);
  assign mux_359_nl = MUX_s_1_2_2(mux_358_nl, or_324_nl, or_215_cse);
  assign nor_490_nl = ~((fsm_output[4]) | mux_359_nl);
  assign mux_361_nl = MUX_s_1_2_2(and_323_nl, nor_490_nl, fsm_output[7]);
  assign nor_491_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_tmp_338);
  assign mux_362_nl = MUX_s_1_2_2(mux_361_nl, nor_491_nl, fsm_output[0]);
  assign nand_229_nl = ~((fsm_output[2]) & mux_362_nl);
  assign nor_493_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0010) | (~ (fsm_output[6])));
  assign nor_494_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0010) | (fsm_output[6]));
  assign mux_351_nl = MUX_s_1_2_2(nor_493_nl, nor_494_nl, fsm_output[3]);
  assign nand_23_nl = ~((fsm_output[4]) & mux_351_nl);
  assign or_309_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0010) | (~ (fsm_output[6]));
  assign or_307_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0010) | (fsm_output[6]);
  assign mux_350_nl = MUX_s_1_2_2(or_309_nl, or_307_nl, fsm_output[3]);
  assign or_310_nl = (fsm_output[4]) | mux_350_nl;
  assign mux_352_nl = MUX_s_1_2_2(nand_23_nl, or_310_nl, fsm_output[7]);
  assign nor_495_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0010) | (~ (fsm_output[6])));
  assign nor_496_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0010) | (fsm_output[6]));
  assign mux_348_nl = MUX_s_1_2_2(nor_495_nl, nor_496_nl, fsm_output[3]);
  assign nand_22_nl = ~((fsm_output[4]) & mux_348_nl);
  assign or_302_nl = (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0010) | (~ (fsm_output[6]));
  assign or_300_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0010) | (fsm_output[6]);
  assign mux_347_nl = MUX_s_1_2_2(or_302_nl, or_300_nl, fsm_output[3]);
  assign or_303_nl = (fsm_output[4]) | mux_347_nl;
  assign mux_349_nl = MUX_s_1_2_2(nand_22_nl, or_303_nl, fsm_output[7]);
  assign mux_353_nl = MUX_s_1_2_2(mux_352_nl, mux_349_nl, fsm_output[0]);
  assign or_1254_nl = (fsm_output[2]) | mux_353_nl;
  assign mux_363_nl = MUX_s_1_2_2(nand_229_nl, or_1254_nl, fsm_output[5]);
  assign vec_rsc_0_2_i_we_d_pff = ~(mux_363_nl | (fsm_output[1]));
  assign or_357_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0010) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_356_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) | (COMP_LOOP_acc_psp_sva[0]) |
      (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[3]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_376_nl = MUX_s_1_2_2(or_357_nl, or_356_nl, fsm_output[0]);
  assign nor_481_nl = ~((fsm_output[7]) | mux_376_nl);
  assign or_354_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b00)
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_68;
  assign or_352_nl = (COMP_LOOP_acc_11_psp_sva[2:0]!=3'b001) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_373_nl = MUX_s_1_2_2(or_354_nl, or_352_nl, fsm_output[3]);
  assign nor_482_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_373_nl);
  assign nor_483_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0010) | not_tmp_68);
  assign nor_484_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0010) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_372_nl = MUX_s_1_2_2(nor_483_nl, nor_484_nl, fsm_output[3]);
  assign mux_374_nl = MUX_s_1_2_2(nor_482_nl, mux_372_nl, fsm_output[0]);
  assign nor_485_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | (~ (fsm_output[3])) | (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b001)
      | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) | (fsm_output[6]) | (fsm_output[4]));
  assign nor_486_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b0010) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_371_nl = MUX_s_1_2_2(nor_485_nl, nor_486_nl, fsm_output[0]);
  assign mux_375_nl = MUX_s_1_2_2(mux_374_nl, mux_371_nl, fsm_output[7]);
  assign mux_377_nl = MUX_s_1_2_2(nor_481_nl, mux_375_nl, fsm_output[5]);
  assign or_343_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0010) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_341_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0010)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_368_nl = MUX_s_1_2_2(or_343_nl, or_341_nl, fsm_output[3]);
  assign or_339_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0010) | not_tmp_68;
  assign or_337_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0010) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_367_nl = MUX_s_1_2_2(or_339_nl, or_337_nl, fsm_output[3]);
  assign mux_369_nl = MUX_s_1_2_2(mux_368_nl, mux_367_nl, fsm_output[0]);
  assign or_335_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0010)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_334_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0010)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_365_nl = MUX_s_1_2_2(or_335_nl, or_334_nl, fsm_output[3]);
  assign or_333_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0010) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_332_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0010) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_364_nl = MUX_s_1_2_2(or_333_nl, or_332_nl, fsm_output[3]);
  assign mux_366_nl = MUX_s_1_2_2(mux_365_nl, mux_364_nl, fsm_output[0]);
  assign mux_370_nl = MUX_s_1_2_2(mux_369_nl, mux_366_nl, fsm_output[7]);
  assign nor_487_nl = ~((fsm_output[5]) | mux_370_nl);
  assign mux_378_nl = MUX_s_1_2_2(mux_377_nl, nor_487_nl, fsm_output[2]);
  assign vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d = mux_378_nl & (fsm_output[1]);
  assign nor_473_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0011) | (~ (fsm_output[6])));
  assign nor_474_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b0011) | (fsm_output[6]));
  assign mux_388_nl = MUX_s_1_2_2(nor_473_nl, nor_474_nl, fsm_output[3]);
  assign and_320_nl = (fsm_output[4]) & mux_388_nl;
  assign or_376_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0011) | (fsm_output[6]);
  assign mux_386_nl = MUX_s_1_2_2(not_tmp_173, or_376_nl, fsm_output[3]);
  assign or_375_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0011)
      | (fsm_output[6]);
  assign mux_387_nl = MUX_s_1_2_2(mux_386_nl, or_375_nl, or_215_cse);
  assign nor_475_nl = ~((fsm_output[4]) | mux_387_nl);
  assign mux_389_nl = MUX_s_1_2_2(and_320_nl, nor_475_nl, fsm_output[7]);
  assign and_321_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (~ mux_tmp_338);
  assign mux_390_nl = MUX_s_1_2_2(mux_389_nl, and_321_nl, fsm_output[0]);
  assign nand_228_nl = ~((fsm_output[2]) & mux_390_nl);
  assign nor_477_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0011) | (~ (fsm_output[6])));
  assign nor_478_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0011) | (fsm_output[6]));
  assign mux_383_nl = MUX_s_1_2_2(nor_477_nl, nor_478_nl, fsm_output[3]);
  assign nand_28_nl = ~((fsm_output[4]) & mux_383_nl);
  assign or_368_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:2]!=2'b00) | not_tmp_170;
  assign or_366_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0011) | (fsm_output[6]);
  assign mux_382_nl = MUX_s_1_2_2(or_368_nl, or_366_nl, fsm_output[3]);
  assign or_369_nl = (fsm_output[4]) | mux_382_nl;
  assign mux_384_nl = MUX_s_1_2_2(nand_28_nl, or_369_nl, fsm_output[7]);
  assign nor_479_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:1]!=3'b001) | not_tmp_144);
  assign nor_480_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0011) | (fsm_output[6]));
  assign mux_380_nl = MUX_s_1_2_2(nor_479_nl, nor_480_nl, fsm_output[3]);
  assign nand_27_nl = ~((fsm_output[4]) & mux_380_nl);
  assign or_361_nl = (COMP_LOOP_acc_1_cse_sva[3:2]!=2'b00) | not_tmp_168;
  assign or_359_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0011) | (fsm_output[6]);
  assign mux_379_nl = MUX_s_1_2_2(or_361_nl, or_359_nl, fsm_output[3]);
  assign or_362_nl = (fsm_output[4]) | mux_379_nl;
  assign mux_381_nl = MUX_s_1_2_2(nand_27_nl, or_362_nl, fsm_output[7]);
  assign mux_385_nl = MUX_s_1_2_2(mux_384_nl, mux_381_nl, fsm_output[0]);
  assign or_1253_nl = (fsm_output[2]) | mux_385_nl;
  assign mux_391_nl = MUX_s_1_2_2(nand_228_nl, or_1253_nl, fsm_output[5]);
  assign vec_rsc_0_3_i_we_d_pff = ~(mux_391_nl | (fsm_output[1]));
  assign or_405_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0011) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_404_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) | (COMP_LOOP_acc_psp_sva[0]) |
      (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[3]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_404_nl = MUX_s_1_2_2(or_405_nl, or_404_nl, fsm_output[0]);
  assign nor_465_nl = ~((fsm_output[7]) | mux_404_nl);
  assign nor_466_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[1])) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b00)
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_68);
  assign nor_467_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b001) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_401_nl = MUX_s_1_2_2(nor_466_nl, nor_467_nl, fsm_output[3]);
  assign and_318_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & mux_401_nl;
  assign nor_468_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:1]!=3'b001) | nand_199_cse);
  assign nor_469_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0011) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_400_nl = MUX_s_1_2_2(nor_468_nl, nor_469_nl, fsm_output[3]);
  assign mux_402_nl = MUX_s_1_2_2(and_318_nl, mux_400_nl, fsm_output[0]);
  assign nor_470_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (~ (fsm_output[3])) |
      (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b001) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (fsm_output[4]));
  assign nor_471_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b0011) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_399_nl = MUX_s_1_2_2(nor_470_nl, nor_471_nl, fsm_output[0]);
  assign mux_403_nl = MUX_s_1_2_2(mux_402_nl, mux_399_nl, fsm_output[7]);
  assign mux_405_nl = MUX_s_1_2_2(nor_465_nl, mux_403_nl, fsm_output[5]);
  assign or_392_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0011) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_390_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0011)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_396_nl = MUX_s_1_2_2(or_392_nl, or_390_nl, fsm_output[3]);
  assign or_388_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0011) | not_tmp_68;
  assign or_386_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0011) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_395_nl = MUX_s_1_2_2(or_388_nl, or_386_nl, fsm_output[3]);
  assign mux_397_nl = MUX_s_1_2_2(mux_396_nl, mux_395_nl, fsm_output[0]);
  assign or_384_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0011)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_383_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0011)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_393_nl = MUX_s_1_2_2(or_384_nl, or_383_nl, fsm_output[3]);
  assign or_382_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0011) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_381_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0011) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_392_nl = MUX_s_1_2_2(or_382_nl, or_381_nl, fsm_output[3]);
  assign mux_394_nl = MUX_s_1_2_2(mux_393_nl, mux_392_nl, fsm_output[0]);
  assign mux_398_nl = MUX_s_1_2_2(mux_397_nl, mux_394_nl, fsm_output[7]);
  assign nor_472_nl = ~((fsm_output[5]) | mux_398_nl);
  assign mux_406_nl = MUX_s_1_2_2(mux_405_nl, nor_472_nl, fsm_output[2]);
  assign vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d = mux_406_nl & (fsm_output[1]);
  assign nor_454_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0100) | (~ (fsm_output[6])));
  assign nor_455_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b0100) | (fsm_output[6]));
  assign mux_420_nl = MUX_s_1_2_2(nor_454_nl, nor_455_nl, fsm_output[3]);
  assign and_317_nl = (fsm_output[4]) & mux_420_nl;
  assign or_430_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0100)
      | (fsm_output[6]);
  assign or_429_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0100) | (fsm_output[6]);
  assign mux_418_nl = MUX_s_1_2_2(or_tmp_170, or_429_nl, fsm_output[3]);
  assign mux_419_nl = MUX_s_1_2_2(or_430_nl, mux_418_nl, nor_101_cse);
  assign nor_456_nl = ~((fsm_output[4]) | mux_419_nl);
  assign mux_421_nl = MUX_s_1_2_2(and_317_nl, nor_456_nl, fsm_output[7]);
  assign nor_457_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_tmp_398);
  assign mux_422_nl = MUX_s_1_2_2(mux_421_nl, nor_457_nl, fsm_output[0]);
  assign nand_227_nl = ~((fsm_output[2]) & mux_422_nl);
  assign nor_459_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0100) | (~ (fsm_output[6])));
  assign nor_460_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0100) | (fsm_output[6]));
  assign mux_411_nl = MUX_s_1_2_2(nor_459_nl, nor_460_nl, fsm_output[3]);
  assign nand_34_nl = ~((fsm_output[4]) & mux_411_nl);
  assign or_416_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0100) | (~ (fsm_output[6]));
  assign or_414_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0100) | (fsm_output[6]);
  assign mux_410_nl = MUX_s_1_2_2(or_416_nl, or_414_nl, fsm_output[3]);
  assign or_417_nl = (fsm_output[4]) | mux_410_nl;
  assign mux_412_nl = MUX_s_1_2_2(nand_34_nl, or_417_nl, fsm_output[7]);
  assign nor_461_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0100) | (~ (fsm_output[6])));
  assign nor_462_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0100) | (fsm_output[6]));
  assign mux_408_nl = MUX_s_1_2_2(nor_461_nl, nor_462_nl, fsm_output[3]);
  assign nand_33_nl = ~((fsm_output[4]) & mux_408_nl);
  assign or_409_nl = (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0100) | (~ (fsm_output[6]));
  assign or_407_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0100) | (fsm_output[6]);
  assign mux_407_nl = MUX_s_1_2_2(or_409_nl, or_407_nl, fsm_output[3]);
  assign or_410_nl = (fsm_output[4]) | mux_407_nl;
  assign mux_409_nl = MUX_s_1_2_2(nand_33_nl, or_410_nl, fsm_output[7]);
  assign mux_413_nl = MUX_s_1_2_2(mux_412_nl, mux_409_nl, fsm_output[0]);
  assign or_1252_nl = (fsm_output[2]) | mux_413_nl;
  assign mux_423_nl = MUX_s_1_2_2(nand_227_nl, or_1252_nl, fsm_output[5]);
  assign vec_rsc_0_4_i_we_d_pff = ~(mux_423_nl | (fsm_output[1]));
  assign or_460_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0100) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_459_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (COMP_LOOP_acc_psp_sva[0])
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[3]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_436_nl = MUX_s_1_2_2(or_460_nl, or_459_nl, fsm_output[0]);
  assign nor_447_nl = ~((fsm_output[7]) | mux_436_nl);
  assign or_457_nl = (VEC_LOOP_j_10_0_sva_9_0[1]) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b01)
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_68;
  assign or_455_nl = (COMP_LOOP_acc_11_psp_sva[2:0]!=3'b010) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_433_nl = MUX_s_1_2_2(or_457_nl, or_455_nl, fsm_output[3]);
  assign nor_448_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_433_nl);
  assign nor_449_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0100) | not_tmp_68);
  assign nor_450_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0100) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_432_nl = MUX_s_1_2_2(nor_449_nl, nor_450_nl, fsm_output[3]);
  assign mux_434_nl = MUX_s_1_2_2(nor_448_nl, mux_432_nl, fsm_output[0]);
  assign nor_451_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | (~ (fsm_output[3])) | (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b010)
      | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) | (fsm_output[6]) | (fsm_output[4]));
  assign nor_452_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b0100) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_431_nl = MUX_s_1_2_2(nor_451_nl, nor_452_nl, fsm_output[0]);
  assign mux_435_nl = MUX_s_1_2_2(mux_434_nl, mux_431_nl, fsm_output[7]);
  assign mux_437_nl = MUX_s_1_2_2(nor_447_nl, mux_435_nl, fsm_output[5]);
  assign or_446_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0100) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_444_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0100)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_428_nl = MUX_s_1_2_2(or_446_nl, or_444_nl, fsm_output[3]);
  assign or_442_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0100) | not_tmp_68;
  assign or_440_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0100) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_427_nl = MUX_s_1_2_2(or_442_nl, or_440_nl, fsm_output[3]);
  assign mux_429_nl = MUX_s_1_2_2(mux_428_nl, mux_427_nl, fsm_output[0]);
  assign or_438_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0100)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_437_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0100)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_425_nl = MUX_s_1_2_2(or_438_nl, or_437_nl, fsm_output[3]);
  assign or_436_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0100) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_435_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0100) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_424_nl = MUX_s_1_2_2(or_436_nl, or_435_nl, fsm_output[3]);
  assign mux_426_nl = MUX_s_1_2_2(mux_425_nl, mux_424_nl, fsm_output[0]);
  assign mux_430_nl = MUX_s_1_2_2(mux_429_nl, mux_426_nl, fsm_output[7]);
  assign nor_453_nl = ~((fsm_output[5]) | mux_430_nl);
  assign mux_438_nl = MUX_s_1_2_2(mux_437_nl, nor_453_nl, fsm_output[2]);
  assign vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d = mux_438_nl & (fsm_output[1]);
  assign nor_439_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0101) | (~ (fsm_output[6])));
  assign nor_440_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b0101) | (fsm_output[6]));
  assign mux_448_nl = MUX_s_1_2_2(nor_439_nl, nor_440_nl, fsm_output[3]);
  assign and_314_nl = (fsm_output[4]) & mux_448_nl;
  assign or_478_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0101)
      | (fsm_output[6]);
  assign or_477_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0101) | (fsm_output[6]);
  assign mux_446_nl = MUX_s_1_2_2(or_tmp_220, or_477_nl, fsm_output[3]);
  assign mux_447_nl = MUX_s_1_2_2(or_478_nl, mux_446_nl, nor_101_cse);
  assign nor_441_nl = ~((fsm_output[4]) | mux_447_nl);
  assign mux_449_nl = MUX_s_1_2_2(and_314_nl, nor_441_nl, fsm_output[7]);
  assign and_315_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (~ mux_tmp_398);
  assign mux_450_nl = MUX_s_1_2_2(mux_449_nl, and_315_nl, fsm_output[0]);
  assign nand_226_nl = ~((fsm_output[2]) & mux_450_nl);
  assign nor_443_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0101) | (~ (fsm_output[6])));
  assign nor_444_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0101) | (fsm_output[6]));
  assign mux_443_nl = MUX_s_1_2_2(nor_443_nl, nor_444_nl, fsm_output[3]);
  assign nand_39_nl = ~((fsm_output[4]) & mux_443_nl);
  assign or_471_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:1]!=3'b010) | not_tmp_146;
  assign or_469_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0101) | (fsm_output[6]);
  assign mux_442_nl = MUX_s_1_2_2(or_471_nl, or_469_nl, fsm_output[3]);
  assign or_472_nl = (fsm_output[4]) | mux_442_nl;
  assign mux_444_nl = MUX_s_1_2_2(nand_39_nl, or_472_nl, fsm_output[7]);
  assign nor_445_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:1]!=3'b010) | not_tmp_144);
  assign nor_446_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0101) | (fsm_output[6]));
  assign mux_440_nl = MUX_s_1_2_2(nor_445_nl, nor_446_nl, fsm_output[3]);
  assign nand_38_nl = ~((fsm_output[4]) & mux_440_nl);
  assign or_464_nl = (COMP_LOOP_acc_1_cse_sva[3:1]!=3'b010) | not_tmp_143;
  assign or_462_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0101) | (fsm_output[6]);
  assign mux_439_nl = MUX_s_1_2_2(or_464_nl, or_462_nl, fsm_output[3]);
  assign or_465_nl = (fsm_output[4]) | mux_439_nl;
  assign mux_441_nl = MUX_s_1_2_2(nand_38_nl, or_465_nl, fsm_output[7]);
  assign mux_445_nl = MUX_s_1_2_2(mux_444_nl, mux_441_nl, fsm_output[0]);
  assign or_1251_nl = (fsm_output[2]) | mux_445_nl;
  assign mux_451_nl = MUX_s_1_2_2(nand_226_nl, or_1251_nl, fsm_output[5]);
  assign vec_rsc_0_5_i_we_d_pff = ~(mux_451_nl | (fsm_output[1]));
  assign or_507_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0101) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_506_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (COMP_LOOP_acc_psp_sva[0])
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[3]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_464_nl = MUX_s_1_2_2(or_507_nl, or_506_nl, fsm_output[0]);
  assign nor_431_nl = ~((fsm_output[7]) | mux_464_nl);
  assign nor_432_nl = ~((VEC_LOOP_j_10_0_sva_9_0[1]) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b01)
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_68);
  assign nor_433_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b010) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_461_nl = MUX_s_1_2_2(nor_432_nl, nor_433_nl, fsm_output[3]);
  assign and_312_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & mux_461_nl;
  assign nor_434_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:1]!=3'b010) | nand_199_cse);
  assign nor_435_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0101) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_460_nl = MUX_s_1_2_2(nor_434_nl, nor_435_nl, fsm_output[3]);
  assign mux_462_nl = MUX_s_1_2_2(and_312_nl, mux_460_nl, fsm_output[0]);
  assign nor_436_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (~ (fsm_output[3])) |
      (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b010) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (fsm_output[4]));
  assign nor_437_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b0101) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_459_nl = MUX_s_1_2_2(nor_436_nl, nor_437_nl, fsm_output[0]);
  assign mux_463_nl = MUX_s_1_2_2(mux_462_nl, mux_459_nl, fsm_output[7]);
  assign mux_465_nl = MUX_s_1_2_2(nor_431_nl, mux_463_nl, fsm_output[5]);
  assign or_494_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0101) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_492_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0101)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_456_nl = MUX_s_1_2_2(or_494_nl, or_492_nl, fsm_output[3]);
  assign or_490_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0101) | not_tmp_68;
  assign or_488_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0101) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_455_nl = MUX_s_1_2_2(or_490_nl, or_488_nl, fsm_output[3]);
  assign mux_457_nl = MUX_s_1_2_2(mux_456_nl, mux_455_nl, fsm_output[0]);
  assign or_486_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0101)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_485_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0101)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_453_nl = MUX_s_1_2_2(or_486_nl, or_485_nl, fsm_output[3]);
  assign or_484_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0101) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_483_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0101) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_452_nl = MUX_s_1_2_2(or_484_nl, or_483_nl, fsm_output[3]);
  assign mux_454_nl = MUX_s_1_2_2(mux_453_nl, mux_452_nl, fsm_output[0]);
  assign mux_458_nl = MUX_s_1_2_2(mux_457_nl, mux_454_nl, fsm_output[7]);
  assign nor_438_nl = ~((fsm_output[5]) | mux_458_nl);
  assign mux_466_nl = MUX_s_1_2_2(mux_465_nl, nor_438_nl, fsm_output[2]);
  assign vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d = mux_466_nl & (fsm_output[1]);
  assign nor_420_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0110) | (~ (fsm_output[6])));
  assign nor_421_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b0110) | (fsm_output[6]));
  assign mux_480_nl = MUX_s_1_2_2(nor_420_nl, nor_421_nl, fsm_output[3]);
  assign and_311_nl = (fsm_output[4]) & mux_480_nl;
  assign or_532_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0110)
      | (fsm_output[6]);
  assign or_531_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0110) | (fsm_output[6]);
  assign mux_478_nl = MUX_s_1_2_2(or_tmp_278, or_531_nl, fsm_output[3]);
  assign mux_479_nl = MUX_s_1_2_2(or_532_nl, mux_478_nl, nor_101_cse);
  assign nor_422_nl = ~((fsm_output[4]) | mux_479_nl);
  assign mux_481_nl = MUX_s_1_2_2(and_311_nl, nor_422_nl, fsm_output[7]);
  assign nor_423_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_tmp_458);
  assign mux_482_nl = MUX_s_1_2_2(mux_481_nl, nor_423_nl, fsm_output[0]);
  assign nand_225_nl = ~((fsm_output[2]) & mux_482_nl);
  assign nor_425_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0110) | (~ (fsm_output[6])));
  assign nor_426_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0110) | (fsm_output[6]));
  assign mux_471_nl = MUX_s_1_2_2(nor_425_nl, nor_426_nl, fsm_output[3]);
  assign nand_45_nl = ~((fsm_output[4]) & mux_471_nl);
  assign or_518_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0110) | (~ (fsm_output[6]));
  assign or_516_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0110) | (fsm_output[6]);
  assign mux_470_nl = MUX_s_1_2_2(or_518_nl, or_516_nl, fsm_output[3]);
  assign or_519_nl = (fsm_output[4]) | mux_470_nl;
  assign mux_472_nl = MUX_s_1_2_2(nand_45_nl, or_519_nl, fsm_output[7]);
  assign nor_427_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0110) | (~ (fsm_output[6])));
  assign nor_428_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0110) | (fsm_output[6]));
  assign mux_468_nl = MUX_s_1_2_2(nor_427_nl, nor_428_nl, fsm_output[3]);
  assign nand_44_nl = ~((fsm_output[4]) & mux_468_nl);
  assign or_511_nl = (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0110) | (~ (fsm_output[6]));
  assign or_509_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0110) | (fsm_output[6]);
  assign mux_467_nl = MUX_s_1_2_2(or_511_nl, or_509_nl, fsm_output[3]);
  assign or_512_nl = (fsm_output[4]) | mux_467_nl;
  assign mux_469_nl = MUX_s_1_2_2(nand_44_nl, or_512_nl, fsm_output[7]);
  assign mux_473_nl = MUX_s_1_2_2(mux_472_nl, mux_469_nl, fsm_output[0]);
  assign or_1250_nl = (fsm_output[2]) | mux_473_nl;
  assign mux_483_nl = MUX_s_1_2_2(nand_225_nl, or_1250_nl, fsm_output[5]);
  assign vec_rsc_0_6_i_we_d_pff = ~(mux_483_nl | (fsm_output[1]));
  assign or_562_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0110) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_561_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (COMP_LOOP_acc_psp_sva[0])
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[3]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_496_nl = MUX_s_1_2_2(or_562_nl, or_561_nl, fsm_output[0]);
  assign nor_413_nl = ~((fsm_output[7]) | mux_496_nl);
  assign or_559_nl = nand_186_cse | not_tmp_68;
  assign or_557_nl = (COMP_LOOP_acc_11_psp_sva[2:0]!=3'b011) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_493_nl = MUX_s_1_2_2(or_559_nl, or_557_nl, fsm_output[3]);
  assign nor_414_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_493_nl);
  assign nor_415_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0110) | not_tmp_68);
  assign nor_416_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0110) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_492_nl = MUX_s_1_2_2(nor_415_nl, nor_416_nl, fsm_output[3]);
  assign mux_494_nl = MUX_s_1_2_2(nor_414_nl, mux_492_nl, fsm_output[0]);
  assign nor_417_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | (~ (fsm_output[3])) | (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b011)
      | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) | (fsm_output[6]) | (fsm_output[4]));
  assign nor_418_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b0110) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_491_nl = MUX_s_1_2_2(nor_417_nl, nor_418_nl, fsm_output[0]);
  assign mux_495_nl = MUX_s_1_2_2(mux_494_nl, mux_491_nl, fsm_output[7]);
  assign mux_497_nl = MUX_s_1_2_2(nor_413_nl, mux_495_nl, fsm_output[5]);
  assign or_548_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b0110) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_546_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0110)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_488_nl = MUX_s_1_2_2(or_548_nl, or_546_nl, fsm_output[3]);
  assign or_544_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]!=4'b0110) | not_tmp_68;
  assign or_542_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0110) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_487_nl = MUX_s_1_2_2(or_544_nl, or_542_nl, fsm_output[3]);
  assign mux_489_nl = MUX_s_1_2_2(mux_488_nl, mux_487_nl, fsm_output[0]);
  assign or_540_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b0110)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_539_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0110)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_485_nl = MUX_s_1_2_2(or_540_nl, or_539_nl, fsm_output[3]);
  assign or_538_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0110) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_537_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0110) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_484_nl = MUX_s_1_2_2(or_538_nl, or_537_nl, fsm_output[3]);
  assign mux_486_nl = MUX_s_1_2_2(mux_485_nl, mux_484_nl, fsm_output[0]);
  assign mux_490_nl = MUX_s_1_2_2(mux_489_nl, mux_486_nl, fsm_output[7]);
  assign nor_419_nl = ~((fsm_output[5]) | mux_490_nl);
  assign mux_498_nl = MUX_s_1_2_2(mux_497_nl, nor_419_nl, fsm_output[2]);
  assign vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d = mux_498_nl & (fsm_output[1]);
  assign and_402_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]==4'b0111) & (fsm_output[6]);
  assign nor_406_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b0111) | (fsm_output[6]));
  assign mux_508_nl = MUX_s_1_2_2(and_402_nl, nor_406_nl, fsm_output[3]);
  assign and_308_nl = (fsm_output[4]) & mux_508_nl;
  assign or_578_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0111)
      | (fsm_output[6]);
  assign or_577_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b0111) | (fsm_output[6]);
  assign mux_506_nl = MUX_s_1_2_2(not_tmp_173, or_577_nl, fsm_output[3]);
  assign mux_507_nl = MUX_s_1_2_2(or_578_nl, mux_506_nl, nor_101_cse);
  assign nor_407_nl = ~((fsm_output[4]) | mux_507_nl);
  assign mux_509_nl = MUX_s_1_2_2(and_308_nl, nor_407_nl, fsm_output[7]);
  assign and_309_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (~ mux_tmp_458);
  assign mux_510_nl = MUX_s_1_2_2(mux_509_nl, and_309_nl, fsm_output[0]);
  assign nand_224_nl = ~((fsm_output[2]) & mux_510_nl);
  assign and_405_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]==4'b0111) & (fsm_output[6]);
  assign nor_410_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0111) | (fsm_output[6]));
  assign mux_503_nl = MUX_s_1_2_2(and_405_nl, nor_410_nl, fsm_output[3]);
  assign nand_50_nl = ~((fsm_output[4]) & mux_503_nl);
  assign or_571_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3]) | (~((COMP_LOOP_acc_10_cse_10_1_sva[2:0]==3'b111)
      & (fsm_output[6])));
  assign or_570_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0111) | (fsm_output[6]);
  assign mux_502_nl = MUX_s_1_2_2(or_571_nl, or_570_nl, fsm_output[3]);
  assign or_572_nl = (fsm_output[4]) | mux_502_nl;
  assign mux_504_nl = MUX_s_1_2_2(nand_50_nl, or_572_nl, fsm_output[7]);
  assign nor_411_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:1]!=3'b011) | not_tmp_144);
  assign nor_412_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b0111) | (fsm_output[6]));
  assign mux_500_nl = MUX_s_1_2_2(nor_411_nl, nor_412_nl, fsm_output[3]);
  assign nand_49_nl = ~((fsm_output[4]) & mux_500_nl);
  assign or_565_nl = (COMP_LOOP_acc_1_cse_sva[3]) | (~((COMP_LOOP_acc_1_cse_sva[2:0]==3'b111)
      & (fsm_output[6])));
  assign or_564_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0111) | (fsm_output[6]);
  assign mux_499_nl = MUX_s_1_2_2(or_565_nl, or_564_nl, fsm_output[3]);
  assign or_566_nl = (fsm_output[4]) | mux_499_nl;
  assign mux_501_nl = MUX_s_1_2_2(nand_49_nl, or_566_nl, fsm_output[7]);
  assign mux_505_nl = MUX_s_1_2_2(mux_504_nl, mux_501_nl, fsm_output[0]);
  assign or_1249_nl = (fsm_output[2]) | mux_505_nl;
  assign mux_511_nl = MUX_s_1_2_2(nand_224_nl, or_1249_nl, fsm_output[5]);
  assign vec_rsc_0_7_i_we_d_pff = ~(mux_511_nl | (fsm_output[1]));
  assign or_607_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0111) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_606_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (COMP_LOOP_acc_psp_sva[0])
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[3]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_524_nl = MUX_s_1_2_2(or_607_nl, or_606_nl, fsm_output[0]);
  assign nor_397_nl = ~((fsm_output[7]) | mux_524_nl);
  assign nor_398_nl = ~(nand_186_cse | not_tmp_68);
  assign nor_399_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b011) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_521_nl = MUX_s_1_2_2(nor_398_nl, nor_399_nl, fsm_output[3]);
  assign and_306_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & mux_521_nl;
  assign nor_400_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:1]!=3'b011) | nand_199_cse);
  assign nor_401_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b0111) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_520_nl = MUX_s_1_2_2(nor_400_nl, nor_401_nl, fsm_output[3]);
  assign mux_522_nl = MUX_s_1_2_2(and_306_nl, mux_520_nl, fsm_output[0]);
  assign nor_402_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (~ (fsm_output[3])) |
      (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b011) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (fsm_output[4]));
  assign nor_403_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b0111) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_519_nl = MUX_s_1_2_2(nor_402_nl, nor_403_nl, fsm_output[0]);
  assign mux_523_nl = MUX_s_1_2_2(mux_522_nl, mux_519_nl, fsm_output[7]);
  assign mux_525_nl = MUX_s_1_2_2(nor_397_nl, mux_523_nl, fsm_output[5]);
  assign or_594_nl = (~((COMP_LOOP_acc_1_cse_4_sva[3:0]==4'b0111) & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm))
      | not_tmp_68;
  assign nand_236_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm & (COMP_LOOP_acc_1_cse_2_sva[3:0]==4'b0111)
      & (~ (fsm_output[6])) & (fsm_output[4]));
  assign mux_516_nl = MUX_s_1_2_2(or_594_nl, nand_236_nl, fsm_output[3]);
  assign or_590_nl = (~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]==4'b0111))) | not_tmp_68;
  assign or_588_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b0111) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_515_nl = MUX_s_1_2_2(or_590_nl, or_588_nl, fsm_output[3]);
  assign mux_517_nl = MUX_s_1_2_2(mux_516_nl, mux_515_nl, fsm_output[0]);
  assign nand_180_nl = ~(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm & (COMP_LOOP_acc_1_cse_sva[3:0]==4'b0111)
      & (fsm_output[6]) & (~ (fsm_output[4])));
  assign or_585_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b0111)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_513_nl = MUX_s_1_2_2(nand_180_nl, or_585_nl, fsm_output[3]);
  assign or_584_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b0111) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_583_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b0111) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_512_nl = MUX_s_1_2_2(or_584_nl, or_583_nl, fsm_output[3]);
  assign mux_514_nl = MUX_s_1_2_2(mux_513_nl, mux_512_nl, fsm_output[0]);
  assign mux_518_nl = MUX_s_1_2_2(mux_517_nl, mux_514_nl, fsm_output[7]);
  assign nor_404_nl = ~((fsm_output[5]) | mux_518_nl);
  assign mux_526_nl = MUX_s_1_2_2(mux_525_nl, nor_404_nl, fsm_output[2]);
  assign vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d = mux_526_nl & (fsm_output[1]);
  assign nor_386_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b000) | not_tmp_229);
  assign nor_387_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b1000) | (fsm_output[6]));
  assign mux_540_nl = MUX_s_1_2_2(nor_386_nl, nor_387_nl, fsm_output[3]);
  assign and_305_nl = (fsm_output[4]) & mux_540_nl;
  assign or_634_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1000) | (fsm_output[6]);
  assign mux_538_nl = MUX_s_1_2_2(or_tmp_170, or_634_nl, fsm_output[3]);
  assign or_633_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1000)
      | (fsm_output[6]);
  assign mux_539_nl = MUX_s_1_2_2(mux_538_nl, or_633_nl, or_632_cse);
  assign nor_388_nl = ~((fsm_output[4]) | mux_539_nl);
  assign mux_541_nl = MUX_s_1_2_2(and_305_nl, nor_388_nl, fsm_output[7]);
  assign nor_389_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_tmp_518);
  assign mux_542_nl = MUX_s_1_2_2(mux_541_nl, nor_389_nl, fsm_output[0]);
  assign nand_223_nl = ~((fsm_output[2]) & mux_542_nl);
  assign nor_391_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b000) | not_tmp_226);
  assign nor_392_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1000) | (fsm_output[6]));
  assign mux_531_nl = MUX_s_1_2_2(nor_391_nl, nor_392_nl, fsm_output[3]);
  assign nand_56_nl = ~((fsm_output[4]) & mux_531_nl);
  assign or_618_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1000) | (~ (fsm_output[6]));
  assign or_616_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1000) | (fsm_output[6]);
  assign mux_530_nl = MUX_s_1_2_2(or_618_nl, or_616_nl, fsm_output[3]);
  assign or_619_nl = (fsm_output[4]) | mux_530_nl;
  assign mux_532_nl = MUX_s_1_2_2(nand_56_nl, or_619_nl, fsm_output[7]);
  assign nor_393_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b1000) | (~ (fsm_output[6])));
  assign nor_394_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1000) | (fsm_output[6]));
  assign mux_528_nl = MUX_s_1_2_2(nor_393_nl, nor_394_nl, fsm_output[3]);
  assign nand_55_nl = ~((fsm_output[4]) & mux_528_nl);
  assign or_611_nl = (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b1000) | (~ (fsm_output[6]));
  assign or_609_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1000) | (fsm_output[6]);
  assign mux_527_nl = MUX_s_1_2_2(or_611_nl, or_609_nl, fsm_output[3]);
  assign or_612_nl = (fsm_output[4]) | mux_527_nl;
  assign mux_529_nl = MUX_s_1_2_2(nand_55_nl, or_612_nl, fsm_output[7]);
  assign mux_533_nl = MUX_s_1_2_2(mux_532_nl, mux_529_nl, fsm_output[0]);
  assign or_1248_nl = (fsm_output[2]) | mux_533_nl;
  assign mux_543_nl = MUX_s_1_2_2(nand_223_nl, or_1248_nl, fsm_output[5]);
  assign vec_rsc_0_8_i_we_d_pff = ~(mux_543_nl | (fsm_output[1]));
  assign or_664_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b1000) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_663_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[3]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_556_nl = MUX_s_1_2_2(or_664_nl, or_663_nl, fsm_output[0]);
  assign nor_379_nl = ~((fsm_output[7]) | mux_556_nl);
  assign or_661_nl = (VEC_LOOP_j_10_0_sva_9_0[1]) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b10)
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_68;
  assign or_659_nl = (COMP_LOOP_acc_11_psp_sva[2:0]!=3'b100) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_553_nl = MUX_s_1_2_2(or_661_nl, or_659_nl, fsm_output[3]);
  assign nor_380_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_553_nl);
  assign nor_381_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1000) | not_tmp_68);
  assign nor_382_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b1000) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_552_nl = MUX_s_1_2_2(nor_381_nl, nor_382_nl, fsm_output[3]);
  assign mux_554_nl = MUX_s_1_2_2(nor_380_nl, mux_552_nl, fsm_output[0]);
  assign nor_383_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | (~ (fsm_output[3])) | (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b100)
      | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) | (fsm_output[6]) | (fsm_output[4]));
  assign nor_384_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b1000) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_551_nl = MUX_s_1_2_2(nor_383_nl, nor_384_nl, fsm_output[0]);
  assign mux_555_nl = MUX_s_1_2_2(mux_554_nl, mux_551_nl, fsm_output[7]);
  assign mux_557_nl = MUX_s_1_2_2(nor_379_nl, mux_555_nl, fsm_output[5]);
  assign or_650_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b1000) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_648_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1000)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_548_nl = MUX_s_1_2_2(or_650_nl, or_648_nl, fsm_output[3]);
  assign or_646_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b000) | nand_172_cse;
  assign or_644_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1000) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_547_nl = MUX_s_1_2_2(or_646_nl, or_644_nl, fsm_output[3]);
  assign mux_549_nl = MUX_s_1_2_2(mux_548_nl, mux_547_nl, fsm_output[0]);
  assign or_642_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b1000)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_641_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1000)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_545_nl = MUX_s_1_2_2(or_642_nl, or_641_nl, fsm_output[3]);
  assign or_640_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1000) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_639_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1000) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_544_nl = MUX_s_1_2_2(or_640_nl, or_639_nl, fsm_output[3]);
  assign mux_546_nl = MUX_s_1_2_2(mux_545_nl, mux_544_nl, fsm_output[0]);
  assign mux_550_nl = MUX_s_1_2_2(mux_549_nl, mux_546_nl, fsm_output[7]);
  assign nor_385_nl = ~((fsm_output[5]) | mux_550_nl);
  assign mux_558_nl = MUX_s_1_2_2(mux_557_nl, nor_385_nl, fsm_output[2]);
  assign vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d = mux_558_nl & (fsm_output[1]);
  assign nor_371_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b001) | not_tmp_229);
  assign nor_372_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b1001) | (fsm_output[6]));
  assign mux_568_nl = MUX_s_1_2_2(nor_371_nl, nor_372_nl, fsm_output[3]);
  assign and_302_nl = (fsm_output[4]) & mux_568_nl;
  assign or_683_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1001) | (fsm_output[6]);
  assign mux_566_nl = MUX_s_1_2_2(or_tmp_220, or_683_nl, fsm_output[3]);
  assign or_682_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1001)
      | (fsm_output[6]);
  assign mux_567_nl = MUX_s_1_2_2(mux_566_nl, or_682_nl, or_632_cse);
  assign nor_373_nl = ~((fsm_output[4]) | mux_567_nl);
  assign mux_569_nl = MUX_s_1_2_2(and_302_nl, nor_373_nl, fsm_output[7]);
  assign and_303_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (~ mux_tmp_518);
  assign mux_570_nl = MUX_s_1_2_2(mux_569_nl, and_303_nl, fsm_output[0]);
  assign nand_222_nl = ~((fsm_output[2]) & mux_570_nl);
  assign nor_375_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b001) | not_tmp_226);
  assign nor_376_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1001) | (fsm_output[6]));
  assign mux_563_nl = MUX_s_1_2_2(nor_375_nl, nor_376_nl, fsm_output[3]);
  assign nand_61_nl = ~((fsm_output[4]) & mux_563_nl);
  assign or_675_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:1]!=3'b100) | not_tmp_146;
  assign or_673_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1001) | (fsm_output[6]);
  assign mux_562_nl = MUX_s_1_2_2(or_675_nl, or_673_nl, fsm_output[3]);
  assign or_676_nl = (fsm_output[4]) | mux_562_nl;
  assign mux_564_nl = MUX_s_1_2_2(nand_61_nl, or_676_nl, fsm_output[7]);
  assign nor_377_nl = ~((COMP_LOOP_acc_1_cse_4_sva[2:1]!=2'b00) | not_tmp_237);
  assign nor_378_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1001) | (fsm_output[6]));
  assign mux_560_nl = MUX_s_1_2_2(nor_377_nl, nor_378_nl, fsm_output[3]);
  assign nand_60_nl = ~((fsm_output[4]) & mux_560_nl);
  assign or_668_nl = (COMP_LOOP_acc_1_cse_sva[3:1]!=3'b100) | not_tmp_143;
  assign or_666_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1001) | (fsm_output[6]);
  assign mux_559_nl = MUX_s_1_2_2(or_668_nl, or_666_nl, fsm_output[3]);
  assign or_669_nl = (fsm_output[4]) | mux_559_nl;
  assign mux_561_nl = MUX_s_1_2_2(nand_60_nl, or_669_nl, fsm_output[7]);
  assign mux_565_nl = MUX_s_1_2_2(mux_564_nl, mux_561_nl, fsm_output[0]);
  assign or_1247_nl = (fsm_output[2]) | mux_565_nl;
  assign mux_571_nl = MUX_s_1_2_2(nand_222_nl, or_1247_nl, fsm_output[5]);
  assign vec_rsc_0_9_i_we_d_pff = ~(mux_571_nl | (fsm_output[1]));
  assign or_712_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b1001) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_711_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[3]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_584_nl = MUX_s_1_2_2(or_712_nl, or_711_nl, fsm_output[0]);
  assign nor_363_nl = ~((fsm_output[7]) | mux_584_nl);
  assign nor_364_nl = ~((VEC_LOOP_j_10_0_sva_9_0[1]) | (COMP_LOOP_acc_13_psp_sva[1:0]!=2'b10)
      | (~ COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm) | not_tmp_68);
  assign nor_365_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b100) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_581_nl = MUX_s_1_2_2(nor_364_nl, nor_365_nl, fsm_output[3]);
  assign and_300_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & mux_581_nl;
  assign nor_366_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:1]!=2'b00) | nand_168_cse);
  assign nor_367_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b1001) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_580_nl = MUX_s_1_2_2(nor_366_nl, nor_367_nl, fsm_output[3]);
  assign mux_582_nl = MUX_s_1_2_2(and_300_nl, mux_580_nl, fsm_output[0]);
  assign nor_368_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (~ (fsm_output[3])) |
      (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b100) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (fsm_output[4]));
  assign nor_369_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b1001) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_579_nl = MUX_s_1_2_2(nor_368_nl, nor_369_nl, fsm_output[0]);
  assign mux_583_nl = MUX_s_1_2_2(mux_582_nl, mux_579_nl, fsm_output[7]);
  assign mux_585_nl = MUX_s_1_2_2(nor_363_nl, mux_583_nl, fsm_output[5]);
  assign or_699_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b1001) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_697_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1001)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_576_nl = MUX_s_1_2_2(or_699_nl, or_697_nl, fsm_output[3]);
  assign or_695_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b001) | nand_172_cse;
  assign or_693_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1001) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_575_nl = MUX_s_1_2_2(or_695_nl, or_693_nl, fsm_output[3]);
  assign mux_577_nl = MUX_s_1_2_2(mux_576_nl, mux_575_nl, fsm_output[0]);
  assign or_691_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b1001)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_690_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1001)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_573_nl = MUX_s_1_2_2(or_691_nl, or_690_nl, fsm_output[3]);
  assign or_689_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1001) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_688_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1001) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_572_nl = MUX_s_1_2_2(or_689_nl, or_688_nl, fsm_output[3]);
  assign mux_574_nl = MUX_s_1_2_2(mux_573_nl, mux_572_nl, fsm_output[0]);
  assign mux_578_nl = MUX_s_1_2_2(mux_577_nl, mux_574_nl, fsm_output[7]);
  assign nor_370_nl = ~((fsm_output[5]) | mux_578_nl);
  assign mux_586_nl = MUX_s_1_2_2(mux_585_nl, nor_370_nl, fsm_output[2]);
  assign vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d = mux_586_nl & (fsm_output[1]);
  assign nor_352_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b010) | not_tmp_229);
  assign nor_353_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b1010) | (fsm_output[6]));
  assign mux_600_nl = MUX_s_1_2_2(nor_352_nl, nor_353_nl, fsm_output[3]);
  assign and_299_nl = (fsm_output[4]) & mux_600_nl;
  assign or_739_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1010) | (fsm_output[6]);
  assign mux_598_nl = MUX_s_1_2_2(or_tmp_278, or_739_nl, fsm_output[3]);
  assign or_738_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1010)
      | (fsm_output[6]);
  assign mux_599_nl = MUX_s_1_2_2(mux_598_nl, or_738_nl, or_632_cse);
  assign nor_354_nl = ~((fsm_output[4]) | mux_599_nl);
  assign mux_601_nl = MUX_s_1_2_2(and_299_nl, nor_354_nl, fsm_output[7]);
  assign nor_355_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_tmp_578);
  assign mux_602_nl = MUX_s_1_2_2(mux_601_nl, nor_355_nl, fsm_output[0]);
  assign nand_221_nl = ~((fsm_output[2]) & mux_602_nl);
  assign nor_357_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b010) | not_tmp_226);
  assign nor_358_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1010) | (fsm_output[6]));
  assign mux_591_nl = MUX_s_1_2_2(nor_357_nl, nor_358_nl, fsm_output[3]);
  assign nand_67_nl = ~((fsm_output[4]) & mux_591_nl);
  assign or_723_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1010) | (~ (fsm_output[6]));
  assign or_721_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1010) | (fsm_output[6]);
  assign mux_590_nl = MUX_s_1_2_2(or_723_nl, or_721_nl, fsm_output[3]);
  assign or_724_nl = (fsm_output[4]) | mux_590_nl;
  assign mux_592_nl = MUX_s_1_2_2(nand_67_nl, or_724_nl, fsm_output[7]);
  assign nor_359_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b1010) | (~ (fsm_output[6])));
  assign nor_360_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1010) | (fsm_output[6]));
  assign mux_588_nl = MUX_s_1_2_2(nor_359_nl, nor_360_nl, fsm_output[3]);
  assign nand_66_nl = ~((fsm_output[4]) & mux_588_nl);
  assign or_716_nl = (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b1010) | (~ (fsm_output[6]));
  assign or_714_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1010) | (fsm_output[6]);
  assign mux_587_nl = MUX_s_1_2_2(or_716_nl, or_714_nl, fsm_output[3]);
  assign or_717_nl = (fsm_output[4]) | mux_587_nl;
  assign mux_589_nl = MUX_s_1_2_2(nand_66_nl, or_717_nl, fsm_output[7]);
  assign mux_593_nl = MUX_s_1_2_2(mux_592_nl, mux_589_nl, fsm_output[0]);
  assign or_1246_nl = (fsm_output[2]) | mux_593_nl;
  assign mux_603_nl = MUX_s_1_2_2(nand_221_nl, or_1246_nl, fsm_output[5]);
  assign vec_rsc_0_10_i_we_d_pff = ~(mux_603_nl | (fsm_output[1]));
  assign or_769_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b1010) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_768_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[3]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_616_nl = MUX_s_1_2_2(or_769_nl, or_768_nl, fsm_output[0]);
  assign nor_345_nl = ~((fsm_output[7]) | mux_616_nl);
  assign or_766_nl = nand_165_cse | not_tmp_68;
  assign or_764_nl = (COMP_LOOP_acc_11_psp_sva[2:0]!=3'b101) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_613_nl = MUX_s_1_2_2(or_766_nl, or_764_nl, fsm_output[3]);
  assign nor_346_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_613_nl);
  assign nor_347_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1010) | not_tmp_68);
  assign nor_348_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b1010) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_612_nl = MUX_s_1_2_2(nor_347_nl, nor_348_nl, fsm_output[3]);
  assign mux_614_nl = MUX_s_1_2_2(nor_346_nl, mux_612_nl, fsm_output[0]);
  assign nor_349_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | (~ (fsm_output[3])) | (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b101)
      | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) | (fsm_output[6]) | (fsm_output[4]));
  assign nor_350_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b1010) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_611_nl = MUX_s_1_2_2(nor_349_nl, nor_350_nl, fsm_output[0]);
  assign mux_615_nl = MUX_s_1_2_2(mux_614_nl, mux_611_nl, fsm_output[7]);
  assign mux_617_nl = MUX_s_1_2_2(nor_345_nl, mux_615_nl, fsm_output[5]);
  assign or_755_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b1010) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_753_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1010)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_608_nl = MUX_s_1_2_2(or_755_nl, or_753_nl, fsm_output[3]);
  assign or_751_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b010) | nand_172_cse;
  assign or_749_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1010) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_607_nl = MUX_s_1_2_2(or_751_nl, or_749_nl, fsm_output[3]);
  assign mux_609_nl = MUX_s_1_2_2(mux_608_nl, mux_607_nl, fsm_output[0]);
  assign or_747_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b1010)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_746_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1010)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_605_nl = MUX_s_1_2_2(or_747_nl, or_746_nl, fsm_output[3]);
  assign or_745_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1010) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_744_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1010) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_604_nl = MUX_s_1_2_2(or_745_nl, or_744_nl, fsm_output[3]);
  assign mux_606_nl = MUX_s_1_2_2(mux_605_nl, mux_604_nl, fsm_output[0]);
  assign mux_610_nl = MUX_s_1_2_2(mux_609_nl, mux_606_nl, fsm_output[7]);
  assign nor_351_nl = ~((fsm_output[5]) | mux_610_nl);
  assign mux_618_nl = MUX_s_1_2_2(mux_617_nl, nor_351_nl, fsm_output[2]);
  assign vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d = mux_618_nl & (fsm_output[1]);
  assign nor_337_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[2:0]!=3'b011) | not_tmp_229);
  assign nor_338_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b1011) | (fsm_output[6]));
  assign mux_628_nl = MUX_s_1_2_2(nor_337_nl, nor_338_nl, fsm_output[3]);
  assign and_296_nl = (fsm_output[4]) & mux_628_nl;
  assign or_788_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1011) | (fsm_output[6]);
  assign mux_626_nl = MUX_s_1_2_2(not_tmp_173, or_788_nl, fsm_output[3]);
  assign or_787_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1011)
      | (fsm_output[6]);
  assign mux_627_nl = MUX_s_1_2_2(mux_626_nl, or_787_nl, or_632_cse);
  assign nor_339_nl = ~((fsm_output[4]) | mux_627_nl);
  assign mux_629_nl = MUX_s_1_2_2(and_296_nl, nor_339_nl, fsm_output[7]);
  assign and_297_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (~ mux_tmp_578);
  assign mux_630_nl = MUX_s_1_2_2(mux_629_nl, and_297_nl, fsm_output[0]);
  assign nand_220_nl = ~((fsm_output[2]) & mux_630_nl);
  assign nor_341_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b011) | not_tmp_226);
  assign nor_342_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1011) | (fsm_output[6]));
  assign mux_623_nl = MUX_s_1_2_2(nor_341_nl, nor_342_nl, fsm_output[3]);
  assign nand_72_nl = ~((fsm_output[4]) & mux_623_nl);
  assign or_780_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:2]!=2'b10) | not_tmp_170;
  assign or_778_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1011) | (fsm_output[6]);
  assign mux_622_nl = MUX_s_1_2_2(or_780_nl, or_778_nl, fsm_output[3]);
  assign or_781_nl = (fsm_output[4]) | mux_622_nl;
  assign mux_624_nl = MUX_s_1_2_2(nand_72_nl, or_781_nl, fsm_output[7]);
  assign nor_343_nl = ~((COMP_LOOP_acc_1_cse_4_sva[2:1]!=2'b01) | not_tmp_237);
  assign nor_344_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1011) | (fsm_output[6]));
  assign mux_620_nl = MUX_s_1_2_2(nor_343_nl, nor_344_nl, fsm_output[3]);
  assign nand_71_nl = ~((fsm_output[4]) & mux_620_nl);
  assign or_773_nl = (COMP_LOOP_acc_1_cse_sva[3:2]!=2'b10) | not_tmp_168;
  assign or_771_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1011) | (fsm_output[6]);
  assign mux_619_nl = MUX_s_1_2_2(or_773_nl, or_771_nl, fsm_output[3]);
  assign or_774_nl = (fsm_output[4]) | mux_619_nl;
  assign mux_621_nl = MUX_s_1_2_2(nand_71_nl, or_774_nl, fsm_output[7]);
  assign mux_625_nl = MUX_s_1_2_2(mux_624_nl, mux_621_nl, fsm_output[0]);
  assign or_1245_nl = (fsm_output[2]) | mux_625_nl;
  assign mux_631_nl = MUX_s_1_2_2(nand_220_nl, or_1245_nl, fsm_output[5]);
  assign vec_rsc_0_11_i_we_d_pff = ~(mux_631_nl | (fsm_output[1]));
  assign or_816_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b1011) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_815_nl = (VEC_LOOP_j_10_0_sva_9_0[2]) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[3]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_644_nl = MUX_s_1_2_2(or_816_nl, or_815_nl, fsm_output[0]);
  assign nor_329_nl = ~((fsm_output[7]) | mux_644_nl);
  assign nor_330_nl = ~(nand_165_cse | not_tmp_68);
  assign nor_331_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b101) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_641_nl = MUX_s_1_2_2(nor_330_nl, nor_331_nl, fsm_output[3]);
  assign and_294_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & mux_641_nl;
  assign nor_332_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2]) | (~((COMP_LOOP_acc_10_cse_10_1_5_sva[1])
      & (COMP_LOOP_acc_10_cse_10_1_5_sva[3]) & (COMP_LOOP_acc_10_cse_10_1_5_sva[0])
      & (fsm_output[6]) & (fsm_output[4]))));
  assign nor_333_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b1011) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_640_nl = MUX_s_1_2_2(nor_332_nl, nor_333_nl, fsm_output[3]);
  assign mux_642_nl = MUX_s_1_2_2(and_294_nl, mux_640_nl, fsm_output[0]);
  assign nor_334_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (~ (fsm_output[3])) |
      (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b101) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (fsm_output[4]));
  assign nor_335_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b1011) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_639_nl = MUX_s_1_2_2(nor_334_nl, nor_335_nl, fsm_output[0]);
  assign mux_643_nl = MUX_s_1_2_2(mux_642_nl, mux_639_nl, fsm_output[7]);
  assign mux_645_nl = MUX_s_1_2_2(nor_329_nl, mux_643_nl, fsm_output[5]);
  assign or_804_nl = (~((COMP_LOOP_acc_1_cse_4_sva[3:0]==4'b1011) & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm))
      | not_tmp_68;
  assign nand_235_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm & (COMP_LOOP_acc_1_cse_2_sva[3:0]==4'b1011)
      & (~ (fsm_output[6])) & (fsm_output[4]));
  assign mux_636_nl = MUX_s_1_2_2(or_804_nl, nand_235_nl, fsm_output[3]);
  assign or_800_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2:0]!=3'b011) | nand_172_cse;
  assign or_798_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1011) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_635_nl = MUX_s_1_2_2(or_800_nl, or_798_nl, fsm_output[3]);
  assign mux_637_nl = MUX_s_1_2_2(mux_636_nl, mux_635_nl, fsm_output[0]);
  assign nand_163_nl = ~(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm & (COMP_LOOP_acc_1_cse_sva[3:0]==4'b1011)
      & (fsm_output[6]) & (~ (fsm_output[4])));
  assign or_795_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1011)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_633_nl = MUX_s_1_2_2(nand_163_nl, or_795_nl, fsm_output[3]);
  assign or_794_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1011) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_793_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1011) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_632_nl = MUX_s_1_2_2(or_794_nl, or_793_nl, fsm_output[3]);
  assign mux_634_nl = MUX_s_1_2_2(mux_633_nl, mux_632_nl, fsm_output[0]);
  assign mux_638_nl = MUX_s_1_2_2(mux_637_nl, mux_634_nl, fsm_output[7]);
  assign nor_336_nl = ~((fsm_output[5]) | mux_638_nl);
  assign mux_646_nl = MUX_s_1_2_2(mux_645_nl, nor_336_nl, fsm_output[2]);
  assign vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d = mux_646_nl & (fsm_output[1]);
  assign nor_318_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[1:0]!=2'b00) | not_tmp_277);
  assign nor_319_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b1100) | (fsm_output[6]));
  assign mux_660_nl = MUX_s_1_2_2(nor_318_nl, nor_319_nl, fsm_output[3]);
  assign and_291_nl = (fsm_output[4]) & mux_660_nl;
  assign or_840_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1100)
      | (fsm_output[6]);
  assign or_839_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1100) | (fsm_output[6]);
  assign mux_658_nl = MUX_s_1_2_2(or_tmp_170, or_839_nl, fsm_output[3]);
  assign mux_659_nl = MUX_s_1_2_2(or_840_nl, mux_658_nl, and_292_cse);
  assign nor_320_nl = ~((fsm_output[4]) | mux_659_nl);
  assign mux_661_nl = MUX_s_1_2_2(and_291_nl, nor_320_nl, fsm_output[7]);
  assign nor_321_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_tmp_638);
  assign mux_662_nl = MUX_s_1_2_2(mux_661_nl, nor_321_nl, fsm_output[0]);
  assign nand_219_nl = ~((fsm_output[2]) & mux_662_nl);
  assign nor_323_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[1:0]!=2'b00) | not_tmp_273);
  assign nor_324_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1100) | (fsm_output[6]));
  assign mux_651_nl = MUX_s_1_2_2(nor_323_nl, nor_324_nl, fsm_output[3]);
  assign nand_78_nl = ~((fsm_output[4]) & mux_651_nl);
  assign or_827_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1100) | (~ (fsm_output[6]));
  assign or_825_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1100) | (fsm_output[6]);
  assign mux_650_nl = MUX_s_1_2_2(or_827_nl, or_825_nl, fsm_output[3]);
  assign or_828_nl = (fsm_output[4]) | mux_650_nl;
  assign mux_652_nl = MUX_s_1_2_2(nand_78_nl, or_828_nl, fsm_output[7]);
  assign nor_325_nl = ~((COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b1100) | (~ (fsm_output[6])));
  assign nor_326_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1100) | (fsm_output[6]));
  assign mux_648_nl = MUX_s_1_2_2(nor_325_nl, nor_326_nl, fsm_output[3]);
  assign nand_77_nl = ~((fsm_output[4]) & mux_648_nl);
  assign or_820_nl = (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b1100) | (~ (fsm_output[6]));
  assign or_818_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1100) | (fsm_output[6]);
  assign mux_647_nl = MUX_s_1_2_2(or_820_nl, or_818_nl, fsm_output[3]);
  assign or_821_nl = (fsm_output[4]) | mux_647_nl;
  assign mux_649_nl = MUX_s_1_2_2(nand_77_nl, or_821_nl, fsm_output[7]);
  assign mux_653_nl = MUX_s_1_2_2(mux_652_nl, mux_649_nl, fsm_output[0]);
  assign or_1244_nl = (fsm_output[2]) | mux_653_nl;
  assign mux_663_nl = MUX_s_1_2_2(nand_219_nl, or_1244_nl, fsm_output[5]);
  assign vec_rsc_0_12_i_we_d_pff = ~(mux_663_nl | (fsm_output[1]));
  assign or_870_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b1100) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_869_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[3]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_676_nl = MUX_s_1_2_2(or_870_nl, or_869_nl, fsm_output[0]);
  assign nor_311_nl = ~((fsm_output[7]) | mux_676_nl);
  assign or_867_nl = nand_153_cse | not_tmp_68;
  assign or_865_nl = (COMP_LOOP_acc_11_psp_sva[2:0]!=3'b110) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_673_nl = MUX_s_1_2_2(or_867_nl, or_865_nl, fsm_output[3]);
  assign nor_312_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_673_nl);
  assign nor_313_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1100) | not_tmp_68);
  assign nor_314_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b1100) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_672_nl = MUX_s_1_2_2(nor_313_nl, nor_314_nl, fsm_output[3]);
  assign mux_674_nl = MUX_s_1_2_2(nor_312_nl, mux_672_nl, fsm_output[0]);
  assign nor_315_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | (~ (fsm_output[3])) | (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b110)
      | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) | (fsm_output[6]) | (fsm_output[4]));
  assign nor_316_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b1100) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_671_nl = MUX_s_1_2_2(nor_315_nl, nor_316_nl, fsm_output[0]);
  assign mux_675_nl = MUX_s_1_2_2(mux_674_nl, mux_671_nl, fsm_output[7]);
  assign mux_677_nl = MUX_s_1_2_2(nor_311_nl, mux_675_nl, fsm_output[5]);
  assign or_856_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]!=4'b1100) | (~ COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)
      | not_tmp_68;
  assign or_854_nl = (~ COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1100)
      | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_668_nl = MUX_s_1_2_2(or_856_nl, or_854_nl, fsm_output[3]);
  assign or_852_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[1:0]!=2'b00) | nand_154_cse;
  assign or_850_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1100) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_667_nl = MUX_s_1_2_2(or_852_nl, or_850_nl, fsm_output[3]);
  assign mux_669_nl = MUX_s_1_2_2(mux_668_nl, mux_667_nl, fsm_output[0]);
  assign or_848_nl = (~ COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) | (COMP_LOOP_acc_1_cse_sva[3:0]!=4'b1100)
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign or_847_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1100)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_665_nl = MUX_s_1_2_2(or_848_nl, or_847_nl, fsm_output[3]);
  assign or_846_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1100) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_845_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1100) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_664_nl = MUX_s_1_2_2(or_846_nl, or_845_nl, fsm_output[3]);
  assign mux_666_nl = MUX_s_1_2_2(mux_665_nl, mux_664_nl, fsm_output[0]);
  assign mux_670_nl = MUX_s_1_2_2(mux_669_nl, mux_666_nl, fsm_output[7]);
  assign nor_317_nl = ~((fsm_output[5]) | mux_670_nl);
  assign mux_678_nl = MUX_s_1_2_2(mux_677_nl, nor_317_nl, fsm_output[2]);
  assign vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d = mux_678_nl & (fsm_output[1]);
  assign nor_303_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[1:0]!=2'b01) | not_tmp_277);
  assign nor_304_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b1101) | (fsm_output[6]));
  assign mux_688_nl = MUX_s_1_2_2(nor_303_nl, nor_304_nl, fsm_output[3]);
  assign and_287_nl = (fsm_output[4]) & mux_688_nl;
  assign or_887_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1101)
      | (fsm_output[6]);
  assign or_886_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1101) | (fsm_output[6]);
  assign mux_686_nl = MUX_s_1_2_2(or_tmp_220, or_886_nl, fsm_output[3]);
  assign mux_687_nl = MUX_s_1_2_2(or_887_nl, mux_686_nl, and_292_cse);
  assign nor_305_nl = ~((fsm_output[4]) | mux_687_nl);
  assign mux_689_nl = MUX_s_1_2_2(and_287_nl, nor_305_nl, fsm_output[7]);
  assign and_289_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (~ mux_tmp_638);
  assign mux_690_nl = MUX_s_1_2_2(mux_689_nl, and_289_nl, fsm_output[0]);
  assign nand_218_nl = ~((fsm_output[2]) & mux_690_nl);
  assign nor_307_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[1:0]!=2'b01) | not_tmp_273);
  assign nor_308_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1101) | (fsm_output[6]));
  assign mux_683_nl = MUX_s_1_2_2(nor_307_nl, nor_308_nl, fsm_output[3]);
  assign nand_83_nl = ~((fsm_output[4]) & mux_683_nl);
  assign or_880_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:1]!=3'b110) | not_tmp_146;
  assign or_878_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1101) | (fsm_output[6]);
  assign mux_682_nl = MUX_s_1_2_2(or_880_nl, or_878_nl, fsm_output[3]);
  assign or_881_nl = (fsm_output[4]) | mux_682_nl;
  assign mux_684_nl = MUX_s_1_2_2(nand_83_nl, or_881_nl, fsm_output[7]);
  assign nor_309_nl = ~((COMP_LOOP_acc_1_cse_4_sva[1]) | (~((COMP_LOOP_acc_1_cse_4_sva[2])
      & (COMP_LOOP_acc_1_cse_4_sva[3]) & (COMP_LOOP_acc_1_cse_4_sva[0]) & (fsm_output[6]))));
  assign nor_310_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1101) | (fsm_output[6]));
  assign mux_680_nl = MUX_s_1_2_2(nor_309_nl, nor_310_nl, fsm_output[3]);
  assign nand_82_nl = ~((fsm_output[4]) & mux_680_nl);
  assign or_874_nl = (COMP_LOOP_acc_1_cse_sva[3:1]!=3'b110) | not_tmp_143;
  assign or_872_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1101) | (fsm_output[6]);
  assign mux_679_nl = MUX_s_1_2_2(or_874_nl, or_872_nl, fsm_output[3]);
  assign or_875_nl = (fsm_output[4]) | mux_679_nl;
  assign mux_681_nl = MUX_s_1_2_2(nand_82_nl, or_875_nl, fsm_output[7]);
  assign mux_685_nl = MUX_s_1_2_2(mux_684_nl, mux_681_nl, fsm_output[0]);
  assign or_1243_nl = (fsm_output[2]) | mux_685_nl;
  assign mux_691_nl = MUX_s_1_2_2(nand_218_nl, or_1243_nl, fsm_output[5]);
  assign vec_rsc_0_13_i_we_d_pff = ~(mux_691_nl | (fsm_output[1]));
  assign or_916_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b1101) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_915_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[3]) | (VEC_LOOP_j_10_0_sva_9_0[1])
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_704_nl = MUX_s_1_2_2(or_916_nl, or_915_nl, fsm_output[0]);
  assign nor_295_nl = ~((fsm_output[7]) | mux_704_nl);
  assign nor_296_nl = ~(nand_153_cse | not_tmp_68);
  assign nor_297_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]!=3'b110) | (~ COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_701_nl = MUX_s_1_2_2(nor_296_nl, nor_297_nl, fsm_output[3]);
  assign and_285_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & mux_701_nl;
  assign nor_298_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[2:1]!=2'b10) | nand_168_cse);
  assign nor_299_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b1101) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_700_nl = MUX_s_1_2_2(nor_298_nl, nor_299_nl, fsm_output[3]);
  assign mux_702_nl = MUX_s_1_2_2(and_285_nl, mux_700_nl, fsm_output[0]);
  assign nor_300_nl = ~((~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (~ (fsm_output[3])) |
      (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b110) | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      | (fsm_output[6]) | (fsm_output[4]));
  assign nor_301_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b1101) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_699_nl = MUX_s_1_2_2(nor_300_nl, nor_301_nl, fsm_output[0]);
  assign mux_703_nl = MUX_s_1_2_2(mux_702_nl, mux_699_nl, fsm_output[7]);
  assign mux_705_nl = MUX_s_1_2_2(nor_295_nl, mux_703_nl, fsm_output[5]);
  assign or_903_nl = (~((COMP_LOOP_acc_1_cse_4_sva[3:0]==4'b1101) & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm))
      | not_tmp_68;
  assign nand_234_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm & (COMP_LOOP_acc_1_cse_2_sva[3:0]==4'b1101)
      & (~ (fsm_output[6])) & (fsm_output[4]));
  assign mux_696_nl = MUX_s_1_2_2(or_903_nl, nand_234_nl, fsm_output[3]);
  assign or_899_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[1:0]!=2'b01) | nand_154_cse;
  assign or_897_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1101) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_695_nl = MUX_s_1_2_2(or_899_nl, or_897_nl, fsm_output[3]);
  assign mux_697_nl = MUX_s_1_2_2(mux_696_nl, mux_695_nl, fsm_output[0]);
  assign nand_150_nl = ~(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm & (COMP_LOOP_acc_1_cse_sva[3:0]==4'b1101)
      & (fsm_output[6]) & (~ (fsm_output[4])));
  assign or_894_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1101)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_693_nl = MUX_s_1_2_2(nand_150_nl, or_894_nl, fsm_output[3]);
  assign or_893_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1101) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_892_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1101) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_692_nl = MUX_s_1_2_2(or_893_nl, or_892_nl, fsm_output[3]);
  assign mux_694_nl = MUX_s_1_2_2(mux_693_nl, mux_692_nl, fsm_output[0]);
  assign mux_698_nl = MUX_s_1_2_2(mux_697_nl, mux_694_nl, fsm_output[7]);
  assign nor_302_nl = ~((fsm_output[5]) | mux_698_nl);
  assign mux_706_nl = MUX_s_1_2_2(mux_705_nl, nor_302_nl, fsm_output[2]);
  assign vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d = mux_706_nl & (fsm_output[1]);
  assign nor_286_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[0]) | (~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:1]==3'b111)
      & (fsm_output[6]))));
  assign nor_287_nl = ~((COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]!=4'b1110) | (fsm_output[6]));
  assign mux_720_nl = MUX_s_1_2_2(nor_286_nl, nor_287_nl, fsm_output[3]);
  assign and_280_nl = (fsm_output[4]) & mux_720_nl;
  assign or_938_nl = (~ (fsm_output[3])) | (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1110)
      | (fsm_output[6]);
  assign or_937_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]!=4'b1110) | (fsm_output[6]);
  assign mux_718_nl = MUX_s_1_2_2(or_tmp_278, or_937_nl, fsm_output[3]);
  assign mux_719_nl = MUX_s_1_2_2(or_938_nl, mux_718_nl, and_292_cse);
  assign nor_288_nl = ~((fsm_output[4]) | mux_719_nl);
  assign mux_721_nl = MUX_s_1_2_2(and_280_nl, nor_288_nl, fsm_output[7]);
  assign nor_289_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_tmp_698);
  assign mux_722_nl = MUX_s_1_2_2(mux_721_nl, nor_289_nl, fsm_output[0]);
  assign nand_217_nl = ~((fsm_output[2]) & mux_722_nl);
  assign nor_291_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[0]) | (~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:1]==3'b111)
      & (fsm_output[6]))));
  assign nor_292_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1110) | (fsm_output[6]));
  assign mux_711_nl = MUX_s_1_2_2(nor_291_nl, nor_292_nl, fsm_output[3]);
  assign nand_89_nl = ~((fsm_output[4]) & mux_711_nl);
  assign nand_239_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[3:0]==4'b1110) & (fsm_output[6]));
  assign or_925_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1110) | (fsm_output[6]);
  assign mux_710_nl = MUX_s_1_2_2(nand_239_nl, or_925_nl, fsm_output[3]);
  assign or_928_nl = (fsm_output[4]) | mux_710_nl;
  assign mux_712_nl = MUX_s_1_2_2(nand_89_nl, or_928_nl, fsm_output[7]);
  assign and_406_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]==4'b1110) & (fsm_output[6]);
  assign nor_294_nl = ~((COMP_LOOP_acc_1_cse_2_sva[3:0]!=4'b1110) | (fsm_output[6]));
  assign mux_708_nl = MUX_s_1_2_2(and_406_nl, nor_294_nl, fsm_output[3]);
  assign nand_88_nl = ~((fsm_output[4]) & mux_708_nl);
  assign nand_237_nl = ~((COMP_LOOP_acc_1_cse_sva[3:0]==4'b1110) & (fsm_output[6]));
  assign or_918_nl = (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1110) | (fsm_output[6]);
  assign mux_707_nl = MUX_s_1_2_2(nand_237_nl, or_918_nl, fsm_output[3]);
  assign or_921_nl = (fsm_output[4]) | mux_707_nl;
  assign mux_709_nl = MUX_s_1_2_2(nand_88_nl, or_921_nl, fsm_output[7]);
  assign mux_713_nl = MUX_s_1_2_2(mux_712_nl, mux_709_nl, fsm_output[0]);
  assign or_1242_nl = (fsm_output[2]) | mux_713_nl;
  assign mux_723_nl = MUX_s_1_2_2(nand_217_nl, or_1242_nl, fsm_output[5]);
  assign vec_rsc_0_14_i_we_d_pff = ~(mux_723_nl | (fsm_output[1]));
  assign or_966_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b1110) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_965_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (VEC_LOOP_j_10_0_sva_9_0[0]) | (fsm_output[3]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_736_nl = MUX_s_1_2_2(or_966_nl, or_965_nl, fsm_output[0]);
  assign nor_279_nl = ~((fsm_output[7]) | mux_736_nl);
  assign or_963_nl = nand_132_cse | not_tmp_68;
  assign nand_238_nl = ~((COMP_LOOP_acc_11_psp_sva[2:0]==3'b111) & COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm
      & (~ (fsm_output[6])) & (fsm_output[4]));
  assign mux_733_nl = MUX_s_1_2_2(or_963_nl, nand_238_nl, fsm_output[3]);
  assign nor_280_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | mux_733_nl);
  assign nor_281_nl = ~((~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]==4'b1110))) | not_tmp_68);
  assign nor_282_nl = ~((COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]!=4'b1110) | (fsm_output[6])
      | (~ (fsm_output[4])));
  assign mux_732_nl = MUX_s_1_2_2(nor_281_nl, nor_282_nl, fsm_output[3]);
  assign mux_734_nl = MUX_s_1_2_2(nor_280_nl, mux_732_nl, fsm_output[0]);
  assign nor_283_nl = ~((VEC_LOOP_j_10_0_sva_9_0[0]) | (~ (fsm_output[3])) | (COMP_LOOP_acc_14_psp_sva[2:0]!=3'b111)
      | (~ COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) | (fsm_output[6]) | (fsm_output[4]));
  assign nor_284_nl = ~((COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]!=4'b1110) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[4]));
  assign mux_731_nl = MUX_s_1_2_2(nor_283_nl, nor_284_nl, fsm_output[0]);
  assign mux_735_nl = MUX_s_1_2_2(mux_734_nl, mux_731_nl, fsm_output[7]);
  assign mux_737_nl = MUX_s_1_2_2(nor_279_nl, mux_735_nl, fsm_output[5]);
  assign or_952_nl = (~((COMP_LOOP_acc_1_cse_4_sva[3:0]==4'b1110) & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm))
      | not_tmp_68;
  assign nand_233_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm & (COMP_LOOP_acc_1_cse_2_sva[3:0]==4'b1110)
      & (~ (fsm_output[6])) & (fsm_output[4]));
  assign mux_728_nl = MUX_s_1_2_2(or_952_nl, nand_233_nl, fsm_output[3]);
  assign or_948_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[0]) | (~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:1]==3'b111)
      & (fsm_output[6]) & (fsm_output[4])));
  assign or_947_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]!=4'b1110) | (fsm_output[6])
      | (~ (fsm_output[4]));
  assign mux_727_nl = MUX_s_1_2_2(or_948_nl, or_947_nl, fsm_output[3]);
  assign mux_729_nl = MUX_s_1_2_2(mux_728_nl, mux_727_nl, fsm_output[0]);
  assign nand_137_nl = ~(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm & (COMP_LOOP_acc_1_cse_sva[3:0]==4'b1110)
      & (fsm_output[6]) & (~ (fsm_output[4])));
  assign or_944_nl = (~ COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) | (COMP_LOOP_acc_1_cse_6_sva[3:0]!=4'b1110)
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_725_nl = MUX_s_1_2_2(nand_137_nl, or_944_nl, fsm_output[3]);
  assign or_943_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3:0]!=4'b1110) | (~ (fsm_output[6]))
      | (fsm_output[4]);
  assign or_942_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1110) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_724_nl = MUX_s_1_2_2(or_943_nl, or_942_nl, fsm_output[3]);
  assign mux_726_nl = MUX_s_1_2_2(mux_725_nl, mux_724_nl, fsm_output[0]);
  assign mux_730_nl = MUX_s_1_2_2(mux_729_nl, mux_726_nl, fsm_output[7]);
  assign nor_285_nl = ~((fsm_output[5]) | mux_730_nl);
  assign mux_738_nl = MUX_s_1_2_2(mux_737_nl, nor_285_nl, fsm_output[2]);
  assign vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d = mux_738_nl & (fsm_output[1]);
  assign and_271_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]==4'b1111) & (fsm_output[6]);
  assign and_272_nl = (COMP_LOOP_acc_10_cse_10_1_1_sva[3:0]==4'b1111) & (~ (fsm_output[6]));
  assign mux_748_nl = MUX_s_1_2_2(and_271_nl, and_272_nl, fsm_output[3]);
  assign and_270_nl = (fsm_output[4]) & mux_748_nl;
  assign nand_126_nl = ~((fsm_output[3]) & (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]==4'b1111)
      & (~ (fsm_output[6])));
  assign nand_127_nl = ~((COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]==4'b1111) & (~ (fsm_output[6])));
  assign mux_746_nl = MUX_s_1_2_2(not_tmp_173, nand_127_nl, fsm_output[3]);
  assign mux_747_nl = MUX_s_1_2_2(nand_126_nl, mux_746_nl, and_292_cse);
  assign nor_277_nl = ~((fsm_output[4]) | mux_747_nl);
  assign mux_749_nl = MUX_s_1_2_2(and_270_nl, nor_277_nl, fsm_output[7]);
  assign and_274_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (~ mux_tmp_698);
  assign mux_750_nl = MUX_s_1_2_2(mux_749_nl, and_274_nl, fsm_output[0]);
  assign nand_216_nl = ~((fsm_output[2]) & mux_750_nl);
  assign and_275_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]==4'b1111) & (fsm_output[6]);
  assign and_276_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]==4'b1111) & (~ (fsm_output[6]));
  assign mux_743_nl = MUX_s_1_2_2(and_275_nl, and_276_nl, fsm_output[3]);
  assign nand_94_nl = ~((fsm_output[4]) & mux_743_nl);
  assign nand_128_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[3:0]==4'b1111) & (fsm_output[6]));
  assign nand_129_nl = ~((COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]==4'b1111) & (~ (fsm_output[6])));
  assign mux_742_nl = MUX_s_1_2_2(nand_128_nl, nand_129_nl, fsm_output[3]);
  assign or_972_nl = (fsm_output[4]) | mux_742_nl;
  assign mux_744_nl = MUX_s_1_2_2(nand_94_nl, or_972_nl, fsm_output[7]);
  assign and_277_nl = (COMP_LOOP_acc_1_cse_4_sva[3:0]==4'b1111) & (fsm_output[6]);
  assign and_278_nl = (COMP_LOOP_acc_1_cse_2_sva[3:0]==4'b1111) & (~ (fsm_output[6]));
  assign mux_740_nl = MUX_s_1_2_2(and_277_nl, and_278_nl, fsm_output[3]);
  assign nand_93_nl = ~((fsm_output[4]) & mux_740_nl);
  assign nand_130_nl = ~((COMP_LOOP_acc_1_cse_sva[3:0]==4'b1111) & (fsm_output[6]));
  assign nand_131_nl = ~((COMP_LOOP_acc_1_cse_6_sva[3:0]==4'b1111) & (~ (fsm_output[6])));
  assign mux_739_nl = MUX_s_1_2_2(nand_130_nl, nand_131_nl, fsm_output[3]);
  assign or_969_nl = (fsm_output[4]) | mux_739_nl;
  assign mux_741_nl = MUX_s_1_2_2(nand_93_nl, or_969_nl, fsm_output[7]);
  assign mux_745_nl = MUX_s_1_2_2(mux_744_nl, mux_741_nl, fsm_output[0]);
  assign or_1241_nl = (fsm_output[2]) | mux_745_nl;
  assign mux_751_nl = MUX_s_1_2_2(nand_216_nl, or_1241_nl, fsm_output[5]);
  assign vec_rsc_0_15_i_we_d_pff = ~(mux_751_nl | (fsm_output[1]));
  assign or_999_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b1111) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_998_nl = (~ (VEC_LOOP_j_10_0_sva_9_0[2])) | (~ (COMP_LOOP_acc_psp_sva[0]))
      | (~ (VEC_LOOP_j_10_0_sva_9_0[0])) | (fsm_output[3]) | (~ (VEC_LOOP_j_10_0_sva_9_0[1]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign mux_764_nl = MUX_s_1_2_2(or_999_nl, or_998_nl, fsm_output[0]);
  assign nor_272_nl = ~((fsm_output[7]) | mux_764_nl);
  assign nor_273_nl = ~(nand_132_cse | not_tmp_68);
  assign and_403_nl = (COMP_LOOP_acc_11_psp_sva[2:0]==3'b111) & COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm
      & (~ (fsm_output[6])) & (fsm_output[4]);
  assign mux_761_nl = MUX_s_1_2_2(nor_273_nl, and_403_nl, fsm_output[3]);
  assign and_265_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & mux_761_nl;
  assign and_266_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3:0]==4'b1111) & (fsm_output[6])
      & (fsm_output[4]);
  assign and_404_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[3:0]==4'b1111) & (~ (fsm_output[6]))
      & (fsm_output[4]);
  assign mux_760_nl = MUX_s_1_2_2(and_266_nl, and_404_nl, fsm_output[3]);
  assign mux_762_nl = MUX_s_1_2_2(and_265_nl, mux_760_nl, fsm_output[0]);
  assign and_267_nl = (VEC_LOOP_j_10_0_sva_9_0[0]) & (fsm_output[3]) & (COMP_LOOP_acc_14_psp_sva[2:0]==3'b111)
      & COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm & (~ (fsm_output[6])) & (~ (fsm_output[4]));
  assign and_268_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[3:0]==4'b1111) & (fsm_output[3])
      & (~ (fsm_output[6])) & (~ (fsm_output[4]));
  assign mux_759_nl = MUX_s_1_2_2(and_267_nl, and_268_nl, fsm_output[0]);
  assign mux_763_nl = MUX_s_1_2_2(mux_762_nl, mux_759_nl, fsm_output[7]);
  assign mux_765_nl = MUX_s_1_2_2(nor_272_nl, mux_763_nl, fsm_output[5]);
  assign or_988_nl = (~((COMP_LOOP_acc_1_cse_4_sva[3:0]==4'b1111) & COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm))
      | not_tmp_68;
  assign nand_nl = ~(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm & (COMP_LOOP_acc_1_cse_2_sva[3:0]==4'b1111)
      & (~ (fsm_output[6])) & (fsm_output[4]));
  assign mux_756_nl = MUX_s_1_2_2(or_988_nl, nand_nl, fsm_output[3]);
  assign nand_120_nl = ~((COMP_LOOP_acc_10_cse_10_1_4_sva[3:0]==4'b1111) & (fsm_output[6])
      & (fsm_output[4]));
  assign nand_215_nl = ~((COMP_LOOP_acc_10_cse_10_1_2_sva[3:0]==4'b1111) & (~ (fsm_output[6]))
      & (fsm_output[4]));
  assign mux_755_nl = MUX_s_1_2_2(nand_120_nl, nand_215_nl, fsm_output[3]);
  assign mux_757_nl = MUX_s_1_2_2(mux_756_nl, mux_755_nl, fsm_output[0]);
  assign nand_122_nl = ~(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm & (COMP_LOOP_acc_1_cse_sva[3:0]==4'b1111)
      & (fsm_output[6]) & (~ (fsm_output[4])));
  assign nand_123_nl = ~(COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm & (COMP_LOOP_acc_1_cse_6_sva[3:0]==4'b1111)
      & (~ (fsm_output[6])) & (~ (fsm_output[4])));
  assign mux_753_nl = MUX_s_1_2_2(nand_122_nl, nand_123_nl, fsm_output[3]);
  assign nand_124_nl = ~((COMP_LOOP_acc_10_cse_10_1_sva[3:0]==4'b1111) & (fsm_output[6])
      & (~ (fsm_output[4])));
  assign or_979_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3:0]!=4'b1111) | (fsm_output[6])
      | (fsm_output[4]);
  assign mux_752_nl = MUX_s_1_2_2(nand_124_nl, or_979_nl, fsm_output[3]);
  assign mux_754_nl = MUX_s_1_2_2(mux_753_nl, mux_752_nl, fsm_output[0]);
  assign mux_758_nl = MUX_s_1_2_2(mux_757_nl, mux_754_nl, fsm_output[7]);
  assign nor_276_nl = ~((fsm_output[5]) | mux_758_nl);
  assign mux_766_nl = MUX_s_1_2_2(mux_765_nl, nor_276_nl, fsm_output[2]);
  assign vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d = mux_766_nl & (fsm_output[1]);
  assign twiddle_rsc_0_0_i_radr_d_pff = MUX1HOT_v_6_7_2((z_out_3[6:1]), (z_out_2[9:4]),
      (z_out_2[8:3]), (COMP_LOOP_5_tmp_mul_idiv_sva[7:2]), (COMP_LOOP_2_tmp_mul_idiv_sva[9:4]),
      (COMP_LOOP_3_tmp_lshift_ncse_sva[8:3]), (COMP_LOOP_2_tmp_lshift_ncse_sva[9:4]),
      {and_dcpl_47 , COMP_LOOP_or_25_cse , and_dcpl_128 , and_dcpl_130 , and_dcpl_131
      , and_dcpl_133 , and_dcpl_135});
  assign nor_267_cse = ~((z_out_2[3:0]!=4'b0000) | (fsm_output[3]));
  assign nor_264_nl = ~((COMP_LOOP_3_tmp_lshift_ncse_sva[2:0]!=3'b000) | (~ (fsm_output[3])));
  assign nor_265_nl = ~((COMP_LOOP_2_tmp_lshift_ncse_sva[3:0]!=4'b0000) | (~ (fsm_output[3])));
  assign mux_771_nl = MUX_s_1_2_2(nor_264_nl, nor_265_nl, fsm_output[0]);
  assign nor_266_nl = ~((z_out_3[0]) | (fsm_output[3]));
  assign mux_770_nl = MUX_s_1_2_2(nor_266_nl, nor_267_cse, fsm_output[0]);
  assign mux_772_nl = MUX_s_1_2_2(mux_771_nl, mux_770_nl, fsm_output[1]);
  assign nor_268_nl = ~((z_out_2[2:0]!=3'b000) | (fsm_output[3]));
  assign mux_768_nl = MUX_s_1_2_2(nor_268_nl, nor_267_cse, fsm_output[0]);
  assign nor_270_nl = ~((COMP_LOOP_5_tmp_mul_idiv_sva[1:0]!=2'b00) | (fsm_output[3]));
  assign nor_271_nl = ~((COMP_LOOP_2_tmp_mul_idiv_sva[3:0]!=4'b0000) | (fsm_output[3]));
  assign mux_767_nl = MUX_s_1_2_2(nor_270_nl, nor_271_nl, fsm_output[0]);
  assign mux_769_nl = MUX_s_1_2_2(mux_768_nl, mux_767_nl, fsm_output[1]);
  assign mux_773_nl = MUX_s_1_2_2(mux_772_nl, mux_769_nl, fsm_output[2]);
  assign twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d = mux_773_nl & and_dcpl_138;
  assign twiddle_rsc_0_1_i_radr_d_pff = z_out_2[9:4];
  assign nor_261_cse = ~((z_out_2[3:0]!=4'b0001) | (fsm_output[3:2]!=2'b01));
  assign nor_260_nl = ~((fsm_output[2]) | (z_out_2[3:1]!=3'b000) | nand_114_cse);
  assign mux_775_nl = MUX_s_1_2_2(nor_260_nl, nor_261_cse, fsm_output[0]);
  assign nor_263_nl = ~((fsm_output[2]) | (z_out_2[3:0]!=4'b0001) | (fsm_output[3]));
  assign mux_774_nl = MUX_s_1_2_2(nor_261_cse, nor_263_nl, fsm_output[0]);
  assign mux_776_nl = MUX_s_1_2_2(mux_775_nl, mux_774_nl, fsm_output[1]);
  assign twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d = mux_776_nl & and_dcpl_138;
  assign twiddle_rsc_0_2_i_radr_d_pff = MUX_v_6_2_2((z_out_2[9:4]), (z_out_2[8:3]),
      COMP_LOOP_or_35_cse);
  assign nor_257_cse = ~((z_out_2[3:0]!=4'b0010) | (fsm_output[3]));
  assign nor_256_cse = ~((z_out_2[2:0]!=3'b001) | (fsm_output[3]));
  assign nor_254_nl = ~((fsm_output[0]) | (z_out_2[3:0]!=4'b0010) | (~ (fsm_output[3])));
  assign nor_255_nl = ~((~ (fsm_output[0])) | (z_out_2[3:0]!=4'b0010) | (fsm_output[3]));
  assign mux_780_nl = MUX_s_1_2_2(nor_254_nl, nor_255_nl, fsm_output[1]);
  assign mux_778_nl = MUX_s_1_2_2(nor_256_cse, nor_257_cse, fsm_output[0]);
  assign mux_777_nl = MUX_s_1_2_2(nor_257_cse, nor_256_cse, fsm_output[0]);
  assign mux_779_nl = MUX_s_1_2_2(mux_778_nl, mux_777_nl, fsm_output[1]);
  assign mux_781_nl = MUX_s_1_2_2(mux_780_nl, mux_779_nl, fsm_output[2]);
  assign twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d = mux_781_nl & and_dcpl_138;
  assign nor_251_cse = ~((z_out_2[3:0]!=4'b0011) | (fsm_output[3:2]!=2'b01));
  assign nor_250_nl = ~((fsm_output[2]) | (z_out_2[3:2]!=2'b00) | nand_113_cse);
  assign mux_783_nl = MUX_s_1_2_2(nor_250_nl, nor_251_cse, fsm_output[0]);
  assign nor_253_nl = ~((fsm_output[2]) | (z_out_2[3:0]!=4'b0011) | (fsm_output[3]));
  assign mux_782_nl = MUX_s_1_2_2(nor_251_cse, nor_253_nl, fsm_output[0]);
  assign mux_784_nl = MUX_s_1_2_2(mux_783_nl, mux_782_nl, fsm_output[1]);
  assign twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d = mux_784_nl & and_dcpl_138;
  assign twiddle_rsc_0_4_i_radr_d_pff = MUX1HOT_v_6_6_2((z_out_2[9:4]), (z_out_2[8:3]),
      (COMP_LOOP_5_tmp_mul_idiv_sva[7:2]), (COMP_LOOP_2_tmp_mul_idiv_sva[9:4]), (COMP_LOOP_3_tmp_lshift_ncse_sva[8:3]),
      (COMP_LOOP_2_tmp_lshift_ncse_sva[9:4]), {COMP_LOOP_or_25_cse , and_dcpl_128
      , and_dcpl_130 , and_dcpl_131 , and_dcpl_133 , and_dcpl_135});
  assign nor_243_nl = ~((COMP_LOOP_3_tmp_lshift_ncse_sva[2:0]!=3'b010) | (~ (fsm_output[3])));
  assign nor_244_nl = ~((COMP_LOOP_2_tmp_lshift_ncse_sva[3:0]!=4'b0100) | (~ (fsm_output[3])));
  assign mux_788_nl = MUX_s_1_2_2(nor_243_nl, nor_244_nl, fsm_output[0]);
  assign nor_245_nl = ~((z_out_2[2:0]!=3'b010) | (fsm_output[3]));
  assign nor_246_nl = ~((z_out_2[3:0]!=4'b0100) | (fsm_output[3]));
  assign mux_787_nl = MUX_s_1_2_2(nor_245_nl, nor_246_nl, fsm_output[0]);
  assign mux_789_nl = MUX_s_1_2_2(mux_788_nl, mux_787_nl, fsm_output[2]);
  assign nor_247_nl = ~((z_out_2[3:0]!=4'b0100) | (~ (fsm_output[0])) | (fsm_output[3]));
  assign nor_248_nl = ~((COMP_LOOP_5_tmp_mul_idiv_sva[1:0]!=2'b01) | (fsm_output[3]));
  assign nor_249_nl = ~((COMP_LOOP_2_tmp_mul_idiv_sva[3:0]!=4'b0100) | (fsm_output[3]));
  assign mux_785_nl = MUX_s_1_2_2(nor_248_nl, nor_249_nl, fsm_output[0]);
  assign mux_786_nl = MUX_s_1_2_2(nor_247_nl, mux_785_nl, fsm_output[2]);
  assign mux_790_nl = MUX_s_1_2_2(mux_789_nl, mux_786_nl, fsm_output[1]);
  assign twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d = mux_790_nl & and_dcpl_138;
  assign nor_240_cse = ~((z_out_2[3:0]!=4'b0101) | (fsm_output[3:2]!=2'b01));
  assign nor_239_nl = ~((fsm_output[2]) | (z_out_2[3:1]!=3'b010) | nand_114_cse);
  assign mux_792_nl = MUX_s_1_2_2(nor_239_nl, nor_240_cse, fsm_output[0]);
  assign nor_242_nl = ~((fsm_output[2]) | (z_out_2[3:0]!=4'b0101) | (fsm_output[3]));
  assign mux_791_nl = MUX_s_1_2_2(nor_240_cse, nor_242_nl, fsm_output[0]);
  assign mux_793_nl = MUX_s_1_2_2(mux_792_nl, mux_791_nl, fsm_output[1]);
  assign twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d = mux_793_nl & and_dcpl_138;
  assign nor_236_cse = ~((z_out_2[3:0]!=4'b0110) | (fsm_output[3]));
  assign nor_235_cse = ~((z_out_2[2:0]!=3'b011) | (fsm_output[3]));
  assign nor_233_nl = ~((fsm_output[0]) | (z_out_2[3:0]!=4'b0110) | (~ (fsm_output[3])));
  assign nor_234_nl = ~((~ (fsm_output[0])) | (z_out_2[3:0]!=4'b0110) | (fsm_output[3]));
  assign mux_797_nl = MUX_s_1_2_2(nor_233_nl, nor_234_nl, fsm_output[1]);
  assign mux_795_nl = MUX_s_1_2_2(nor_235_cse, nor_236_cse, fsm_output[0]);
  assign mux_794_nl = MUX_s_1_2_2(nor_236_cse, nor_235_cse, fsm_output[0]);
  assign mux_796_nl = MUX_s_1_2_2(mux_795_nl, mux_794_nl, fsm_output[1]);
  assign mux_798_nl = MUX_s_1_2_2(mux_797_nl, mux_796_nl, fsm_output[2]);
  assign twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d = mux_798_nl & and_dcpl_138;
  assign nor_230_cse = ~((z_out_2[3:0]!=4'b0111) | (fsm_output[3:2]!=2'b01));
  assign nor_229_nl = ~((fsm_output[2]) | (z_out_2[3]) | (~((z_out_2[2:0]==3'b111)
      & (fsm_output[3]))));
  assign mux_800_nl = MUX_s_1_2_2(nor_229_nl, nor_230_cse, fsm_output[0]);
  assign nor_232_nl = ~((fsm_output[2]) | (z_out_2[3:0]!=4'b0111) | (fsm_output[3]));
  assign mux_799_nl = MUX_s_1_2_2(nor_230_cse, nor_232_nl, fsm_output[0]);
  assign mux_801_nl = MUX_s_1_2_2(mux_800_nl, mux_799_nl, fsm_output[1]);
  assign twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d = mux_801_nl & and_dcpl_138;
  assign nor_224_cse = ~((z_out_2[3:0]!=4'b1000) | (fsm_output[3]));
  assign nor_221_nl = ~((COMP_LOOP_3_tmp_lshift_ncse_sva[1:0]!=2'b00) | (~((COMP_LOOP_3_tmp_lshift_ncse_sva[2])
      & (fsm_output[3]))));
  assign nor_222_nl = ~((COMP_LOOP_2_tmp_lshift_ncse_sva[2:0]!=3'b000) | (~((COMP_LOOP_2_tmp_lshift_ncse_sva[3])
      & (fsm_output[3]))));
  assign mux_806_nl = MUX_s_1_2_2(nor_221_nl, nor_222_nl, fsm_output[0]);
  assign nor_223_nl = ~((~ (z_out_3[0])) | (fsm_output[3]));
  assign mux_805_nl = MUX_s_1_2_2(nor_223_nl, nor_224_cse, fsm_output[0]);
  assign mux_807_nl = MUX_s_1_2_2(mux_806_nl, mux_805_nl, fsm_output[1]);
  assign nor_225_nl = ~((z_out_2[2:0]!=3'b100) | (fsm_output[3]));
  assign mux_803_nl = MUX_s_1_2_2(nor_225_nl, nor_224_cse, fsm_output[0]);
  assign nor_227_nl = ~((COMP_LOOP_5_tmp_mul_idiv_sva[1:0]!=2'b10) | (fsm_output[3]));
  assign nor_228_nl = ~((COMP_LOOP_2_tmp_mul_idiv_sva[3:0]!=4'b1000) | (fsm_output[3]));
  assign mux_802_nl = MUX_s_1_2_2(nor_227_nl, nor_228_nl, fsm_output[0]);
  assign mux_804_nl = MUX_s_1_2_2(mux_803_nl, mux_802_nl, fsm_output[1]);
  assign mux_808_nl = MUX_s_1_2_2(mux_807_nl, mux_804_nl, fsm_output[2]);
  assign twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d = mux_808_nl & and_dcpl_138;
  assign nor_218_cse = ~((z_out_2[3:0]!=4'b1001) | (fsm_output[3:2]!=2'b01));
  assign nor_217_nl = ~((fsm_output[2]) | (z_out_2[3:1]!=3'b100) | nand_114_cse);
  assign mux_810_nl = MUX_s_1_2_2(nor_217_nl, nor_218_cse, fsm_output[0]);
  assign nor_220_nl = ~((fsm_output[2]) | (z_out_2[3:0]!=4'b1001) | (fsm_output[3]));
  assign mux_809_nl = MUX_s_1_2_2(nor_218_cse, nor_220_nl, fsm_output[0]);
  assign mux_811_nl = MUX_s_1_2_2(mux_810_nl, mux_809_nl, fsm_output[1]);
  assign twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d = mux_811_nl & and_dcpl_138;
  assign nor_214_cse = ~((z_out_2[3:0]!=4'b1010) | (fsm_output[3]));
  assign nor_213_cse = ~((z_out_2[2:0]!=3'b101) | (fsm_output[3]));
  assign nor_211_nl = ~((fsm_output[0]) | (z_out_2[3:0]!=4'b1010) | (~ (fsm_output[3])));
  assign nor_212_nl = ~((~ (fsm_output[0])) | (z_out_2[3:0]!=4'b1010) | (fsm_output[3]));
  assign mux_815_nl = MUX_s_1_2_2(nor_211_nl, nor_212_nl, fsm_output[1]);
  assign mux_813_nl = MUX_s_1_2_2(nor_213_cse, nor_214_cse, fsm_output[0]);
  assign mux_812_nl = MUX_s_1_2_2(nor_214_cse, nor_213_cse, fsm_output[0]);
  assign mux_814_nl = MUX_s_1_2_2(mux_813_nl, mux_812_nl, fsm_output[1]);
  assign mux_816_nl = MUX_s_1_2_2(mux_815_nl, mux_814_nl, fsm_output[2]);
  assign twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d = mux_816_nl & and_dcpl_138;
  assign nor_208_cse = ~((z_out_2[3:0]!=4'b1011) | (fsm_output[3:2]!=2'b01));
  assign nor_207_nl = ~((fsm_output[2]) | (z_out_2[3:2]!=2'b10) | nand_113_cse);
  assign mux_818_nl = MUX_s_1_2_2(nor_207_nl, nor_208_cse, fsm_output[0]);
  assign nor_210_nl = ~((fsm_output[2]) | (z_out_2[3:0]!=4'b1011) | (fsm_output[3]));
  assign mux_817_nl = MUX_s_1_2_2(nor_208_cse, nor_210_nl, fsm_output[0]);
  assign mux_819_nl = MUX_s_1_2_2(mux_818_nl, mux_817_nl, fsm_output[1]);
  assign twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d = mux_819_nl & and_dcpl_138;
  assign and_396_nl = (COMP_LOOP_3_tmp_lshift_ncse_sva[2:0]==3'b110) & (fsm_output[3]);
  assign nor_201_nl = ~((COMP_LOOP_2_tmp_lshift_ncse_sva[3:0]!=4'b1100) | (~ (fsm_output[3])));
  assign mux_823_nl = MUX_s_1_2_2(and_396_nl, nor_201_nl, fsm_output[0]);
  assign nor_202_nl = ~((z_out_2[2:0]!=3'b110) | (fsm_output[3]));
  assign nor_203_nl = ~((z_out_2[3:0]!=4'b1100) | (fsm_output[3]));
  assign mux_822_nl = MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output[0]);
  assign mux_824_nl = MUX_s_1_2_2(mux_823_nl, mux_822_nl, fsm_output[2]);
  assign nor_204_nl = ~((z_out_2[3:0]!=4'b1100) | (~ (fsm_output[0])) | (fsm_output[3]));
  assign nor_205_nl = ~((COMP_LOOP_5_tmp_mul_idiv_sva[1:0]!=2'b11) | (fsm_output[3]));
  assign nor_206_nl = ~((COMP_LOOP_2_tmp_mul_idiv_sva[3:0]!=4'b1100) | (fsm_output[3]));
  assign mux_820_nl = MUX_s_1_2_2(nor_205_nl, nor_206_nl, fsm_output[0]);
  assign mux_821_nl = MUX_s_1_2_2(nor_204_nl, mux_820_nl, fsm_output[2]);
  assign mux_825_nl = MUX_s_1_2_2(mux_824_nl, mux_821_nl, fsm_output[1]);
  assign twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d = mux_825_nl & and_dcpl_138;
  assign nor_197_cse = ~((z_out_2[3:0]!=4'b1101) | (fsm_output[3:2]!=2'b01));
  assign nor_196_nl = ~((fsm_output[2]) | (z_out_2[3:1]!=3'b110) | nand_114_cse);
  assign mux_827_nl = MUX_s_1_2_2(nor_196_nl, nor_197_cse, fsm_output[0]);
  assign nor_199_nl = ~((fsm_output[2]) | (z_out_2[3:0]!=4'b1101) | (fsm_output[3]));
  assign mux_826_nl = MUX_s_1_2_2(nor_197_cse, nor_199_nl, fsm_output[0]);
  assign mux_828_nl = MUX_s_1_2_2(mux_827_nl, mux_826_nl, fsm_output[1]);
  assign twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d = mux_828_nl & and_dcpl_138;
  assign nor_194_cse = ~((z_out_2[3:0]!=4'b1110) | (fsm_output[3]));
  assign and_263_cse = (z_out_2[2:0]==3'b111) & (~ (fsm_output[3]));
  assign nor_192_nl = ~((fsm_output[0]) | (z_out_2[3:0]!=4'b1110) | (~ (fsm_output[3])));
  assign nor_193_nl = ~((~ (fsm_output[0])) | (z_out_2[3:0]!=4'b1110) | (fsm_output[3]));
  assign mux_832_nl = MUX_s_1_2_2(nor_192_nl, nor_193_nl, fsm_output[1]);
  assign mux_830_nl = MUX_s_1_2_2(and_263_cse, nor_194_cse, fsm_output[0]);
  assign mux_829_nl = MUX_s_1_2_2(nor_194_cse, and_263_cse, fsm_output[0]);
  assign mux_831_nl = MUX_s_1_2_2(mux_830_nl, mux_829_nl, fsm_output[1]);
  assign mux_833_nl = MUX_s_1_2_2(mux_832_nl, mux_831_nl, fsm_output[2]);
  assign twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d = mux_833_nl & and_dcpl_138;
  assign and_261_cse = (z_out_2[3:0]==4'b1111) & (fsm_output[3:2]==2'b01);
  assign nor_190_nl = ~((fsm_output[2]) | (~((z_out_2[3:0]==4'b1111) & (fsm_output[3]))));
  assign mux_835_nl = MUX_s_1_2_2(nor_190_nl, and_261_cse, fsm_output[0]);
  assign nor_191_nl = ~((fsm_output[2]) | (z_out_2[3:0]!=4'b1111) | (fsm_output[3]));
  assign mux_834_nl = MUX_s_1_2_2(and_261_cse, nor_191_nl, fsm_output[0]);
  assign mux_836_nl = MUX_s_1_2_2(mux_835_nl, mux_834_nl, fsm_output[1]);
  assign twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d = mux_836_nl & and_dcpl_138;
  assign nor_625_cse = ~((fsm_output[7]) | (fsm_output[5]));
  assign and_dcpl_254 = (fsm_output[2:1]==2'b01) & nor_625_cse;
  assign and_dcpl_255 = ~((fsm_output[4]) | (fsm_output[0]));
  assign and_dcpl_257 = and_dcpl_31 & and_dcpl_255;
  assign and_dcpl_258 = and_dcpl_257 & and_dcpl_254;
  assign and_dcpl_260 = and_dcpl_31 & (~ (fsm_output[4])) & (fsm_output[0]);
  assign and_dcpl_261 = and_dcpl_260 & and_dcpl_254;
  assign and_dcpl_263 = (fsm_output[2:1]==2'b10) & nor_625_cse;
  assign and_dcpl_264 = and_dcpl_260 & and_dcpl_263;
  assign and_dcpl_266 = (fsm_output[2:1]==2'b11) & nor_625_cse;
  assign and_dcpl_267 = and_dcpl_257 & and_dcpl_266;
  assign and_dcpl_272 = (fsm_output[3]) & (~ (fsm_output[6])) & and_dcpl_255 & (fsm_output[2:1]==2'b00)
      & nor_625_cse;
  assign and_dcpl_273 = and_dcpl_257 & and_dcpl_263;
  assign and_dcpl_274 = and_dcpl_260 & and_dcpl_266;
  assign and_dcpl_283 = nor_652_cse & nor_625_cse;
  assign and_dcpl_284 = (fsm_output[4]) & (~ (fsm_output[0]));
  assign and_dcpl_286 = and_dcpl_31 & and_dcpl_284 & and_dcpl_283;
  assign and_dcpl_288 = (fsm_output[2:1]==2'b10);
  assign and_dcpl_289 = and_dcpl_288 & (~ (fsm_output[7])) & (fsm_output[5]);
  assign and_dcpl_292 = and_dcpl_53 & and_dcpl_255 & and_dcpl_289;
  assign and_dcpl_295 = (fsm_output[6]) & (fsm_output[3]) & and_dcpl_255 & and_dcpl_283;
  assign and_dcpl_298 = and_dcpl_38 & and_dcpl_255 & and_dcpl_289;
  assign and_dcpl_299 = (fsm_output[7]) & (~ (fsm_output[5]));
  assign and_dcpl_301 = and_dcpl_257 & nor_652_cse & and_dcpl_299;
  assign and_dcpl_302 = and_dcpl_288 & and_dcpl_299;
  assign and_dcpl_303 = and_dcpl_53 & and_dcpl_284;
  assign and_dcpl_304 = and_dcpl_303 & and_dcpl_302;
  assign and_dcpl_307 = and_dcpl_303 & nor_652_cse & (fsm_output[7]) & (fsm_output[5]);
  assign and_dcpl_309 = and_dcpl_38 & and_dcpl_284 & and_dcpl_302;
  assign and_dcpl_324 = (fsm_output[2:1]==2'b01);
  assign and_dcpl_335 = (fsm_output[6]) & (~ (fsm_output[3])) & (~ (fsm_output[4]))
      & (fsm_output[0]) & and_dcpl_324 & (fsm_output[7]) & (fsm_output[5]);
  assign and_dcpl_348 = ~((fsm_output!=8'b00000010));
  assign and_dcpl_356 = (~ (fsm_output[7])) & (fsm_output[5]);
  assign and_dcpl_360 = and_dcpl_288 & and_dcpl_356;
  assign and_541_cse = and_dcpl_53 & and_dcpl_284 & and_dcpl_360;
  assign and_545_cse = nor_tmp_16 & and_dcpl_284 & nor_652_cse & nor_625_cse;
  assign and_548_cse = (fsm_output[6]) & (~ (fsm_output[3])) & and_dcpl_284 & and_dcpl_360;
  assign and_dcpl_373 = nor_652_cse & (fsm_output[7]) & (~ (fsm_output[5]));
  assign and_552_cse = and_dcpl_31 & and_dcpl_284 & and_dcpl_373;
  assign and_556_cse = and_dcpl_53 & and_dcpl_255 & and_dcpl_288 & (fsm_output[7])
      & (fsm_output[5]);
  assign and_558_cse = nor_tmp_16 & and_dcpl_255 & and_dcpl_373;
  assign and_dcpl_421 = and_dcpl_257 & and_dcpl_288 & nor_625_cse;
  assign and_dcpl_425 = and_dcpl_257 & nor_652_cse & and_dcpl_356;
  assign COMP_LOOP_tmp_or_45_itm = and_dcpl_273 | and_dcpl_274;
  assign COMP_LOOP_or_17_itm = (and_dcpl_31 & and_dcpl_255 & nor_652_cse & and_dcpl_356)
      | and_541_cse | and_545_cse | and_548_cse | and_552_cse | and_556_cse | and_558_cse;
  assign COMP_LOOP_tmp_or_28_ssc = and_dcpl_264 | and_dcpl_267 | and_dcpl_272;
  always @(posedge clk) begin
    if ( (and_dcpl_32 & and_dcpl_29) | STAGE_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1010, z_out_6, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_285_nl, and_tmp_13, fsm_output[1]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsc_triosy_0_15_obj_ld_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      COMP_LOOP_1_tmp_mul_idiv_sva_0 <= 1'b0;
      COMP_LOOP_3_tmp_mul_idiv_sva_2_0 <= 3'b000;
    end
    else begin
      reg_vec_rsc_triosy_0_15_obj_ld_cse <= and_dcpl_38 & (~ (fsm_output[4])) & (fsm_output[7])
          & (~ (fsm_output[0])) & (fsm_output[2]) & (fsm_output[5]) & (~ (fsm_output[1]))
          & (~ (z_out_4[4]));
      reg_ensig_cgo_cse <= mux_842_rmff;
      COMP_LOOP_1_tmp_mul_idiv_sva_0 <= z_out_3[0];
      COMP_LOOP_3_tmp_mul_idiv_sva_2_0 <= z_out_2[2:0];
    end
  end
  always @(posedge clk) begin
    tmp_21_sva_2 <= twiddle_rsc_0_2_i_q_d;
    tmp_21_sva_6 <= twiddle_rsc_0_6_i_q_d;
    tmp_21_sva_11 <= MUX_v_64_2_2(twiddle_rsc_0_11_i_q_d, twiddle_rsc_0_14_i_q_d,
        and_dcpl_133);
    tmp_21_sva_14 <= twiddle_rsc_0_14_i_q_d;
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_0_sva_9_0 <= 10'b0000000000;
    end
    else if ( VEC_LOOP_j_10_0_sva_9_0_mx0c0 | (and_dcpl_39 & and_dcpl_62) ) begin
      VEC_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (z_out_5[9:0]), VEC_LOOP_j_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_tmp_840, and_tmp_13, fsm_output[1]) ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(or_1265_nl, nand_241_nl, fsm_output[6]) ) begin
      COMP_LOOP_k_10_3_sva_6_0 <= MUX_v_7_2_2(7'b0000000, reg_COMP_LOOP_k_10_3_ftd,
          nand_240_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva <= 10'b0000000000;
    end
    else if ( ~ or_dcpl_55 ) begin
      COMP_LOOP_acc_10_cse_10_1_1_sva <= COMP_LOOP_1_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_psp_sva <= 7'b0000000;
    end
    else if ( ~ or_dcpl_55 ) begin
      COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_5_tmp_mul_idiv_sva <= 8'b00000000;
    end
    else if ( ~ or_dcpl_55 ) begin
      COMP_LOOP_5_tmp_mul_idiv_sva <= z_out_2[7:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_55 ) begin
      COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm <= z_out_5[10];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_55 ) begin
      COMP_LOOP_1_tmp_acc_cse_sva <= z_out_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_305_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_62_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_185_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_64_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_65_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_66_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_6_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_68_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_69_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_70_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_10_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_72_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_12_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_13_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_14_itm <= 1'b0;
    end
    else if ( mux_873_itm ) begin
      COMP_LOOP_COMP_LOOP_nor_itm <= ~((COMP_LOOP_acc_psp_sva_mx0w0[0]) | (VEC_LOOP_j_10_0_sva_9_0[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_305_itm <= (COMP_LOOP_acc_1_cse_6_sva_1[3:0]==4'b0110);
      COMP_LOOP_COMP_LOOP_and_62_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[3:0]==4'b0011);
      COMP_LOOP_COMP_LOOP_and_185_itm <= (COMP_LOOP_acc_1_cse_4_sva_1[3:0]==4'b0110);
      COMP_LOOP_COMP_LOOP_and_64_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[3:0]==4'b0101);
      COMP_LOOP_COMP_LOOP_and_65_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[3:0]==4'b0110);
      COMP_LOOP_COMP_LOOP_and_66_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[3:0]==4'b0111);
      COMP_LOOP_COMP_LOOP_and_6_itm <= (VEC_LOOP_j_10_0_sva_9_0[2:0]==3'b111) & (~
          (COMP_LOOP_acc_psp_sva_mx0w0[0]));
      COMP_LOOP_COMP_LOOP_and_68_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[3:0]==4'b1001);
      COMP_LOOP_COMP_LOOP_and_69_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[3:0]==4'b1010);
      COMP_LOOP_COMP_LOOP_and_70_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[3:0]==4'b1011);
      COMP_LOOP_COMP_LOOP_and_10_itm <= (COMP_LOOP_acc_psp_sva_mx0w0[0]) & (VEC_LOOP_j_10_0_sva_9_0[2:0]==3'b011);
      COMP_LOOP_COMP_LOOP_and_72_itm <= (COMP_LOOP_acc_1_cse_2_sva_1[3:0]==4'b1101);
      COMP_LOOP_COMP_LOOP_and_12_itm <= (COMP_LOOP_acc_psp_sva_mx0w0[0]) & (VEC_LOOP_j_10_0_sva_9_0[2:0]==3'b101);
      COMP_LOOP_COMP_LOOP_and_13_itm <= (COMP_LOOP_acc_psp_sva_mx0w0[0]) & (VEC_LOOP_j_10_0_sva_9_0[2:0]==3'b110);
      COMP_LOOP_COMP_LOOP_and_14_itm <= (COMP_LOOP_acc_psp_sva_mx0w0[0]) & (VEC_LOOP_j_10_0_sva_9_0[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_6_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_879_nl, mux_tmp_857, fsm_output[1]) ) begin
      COMP_LOOP_acc_1_cse_6_sva <= COMP_LOOP_acc_1_cse_6_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_4_sva <= 10'b0000000000;
    end
    else if ( mux_884_nl | (fsm_output[7]) ) begin
      COMP_LOOP_acc_1_cse_4_sva <= COMP_LOOP_acc_1_cse_4_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_2_sva <= 10'b0000000000;
    end
    else if ( ~(mux_887_nl & and_dcpl_4) ) begin
      COMP_LOOP_acc_1_cse_2_sva <= COMP_LOOP_acc_1_cse_2_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_2_sva <= 10'b0000000000;
    end
    else if ( ~((~ mux_889_nl) & and_dcpl_4) ) begin
      COMP_LOOP_acc_10_cse_10_1_2_sva <= COMP_LOOP_2_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( ~((~ mux_891_nl) & and_dcpl_4) ) begin
      COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_3_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_5_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_nor_5_itm <= ~((COMP_LOOP_2_acc_10_itm_10_1_1[3:0]!=4'b0000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_51_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_nor_51_itm <= ~((COMP_LOOP_2_acc_10_itm_10_1_1[3:1]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_52_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_nor_52_itm <= ~((COMP_LOOP_2_acc_10_itm_10_1_1[3]) | (COMP_LOOP_2_acc_10_itm_10_1_1[2])
          | (COMP_LOOP_2_acc_10_itm_10_1_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_77_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_77_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b0011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_54_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_nor_54_itm <= ~((COMP_LOOP_2_acc_10_itm_10_1_1[3]) | (COMP_LOOP_2_acc_10_itm_10_1_1[1])
          | (COMP_LOOP_2_acc_10_itm_10_1_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_79_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_79_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b0101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_80_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_80_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b0110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_81_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_81_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b0111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_57_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_nor_57_itm <= ~((COMP_LOOP_2_acc_10_itm_10_1_1[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_83_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_83_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b1001);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_84_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_84_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b1010);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_85_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_85_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b1011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_86_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_86_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b1100);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_87_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_87_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b1101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_88_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_88_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b1110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_89_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_200 ) begin
      COMP_LOOP_COMP_LOOP_and_89_itm <= (COMP_LOOP_2_acc_10_itm_10_1_1[3:0]==4'b1111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_11_psp_sva <= 9'b000000000;
    end
    else if ( mux_899_nl | (fsm_output[7]) ) begin
      COMP_LOOP_acc_11_psp_sva <= nl_COMP_LOOP_acc_11_psp_sva[8:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_3_sva <= 10'b0000000000;
    end
    else if ( mux_902_nl | (fsm_output[7]) ) begin
      COMP_LOOP_acc_10_cse_10_1_3_sva <= COMP_LOOP_3_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( mux_905_nl | (fsm_output[7]) ) begin
      COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm <= readslicef_9_1_8(COMP_LOOP_acc_12_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_9_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_nor_9_itm <= ~((COMP_LOOP_3_acc_10_itm_10_1_1[3:0]!=4'b0000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_91_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_nor_91_itm <= ~((COMP_LOOP_3_acc_10_itm_10_1_1[3:1]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_92_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_nor_92_itm <= ~((COMP_LOOP_3_acc_10_itm_10_1_1[3]) | (COMP_LOOP_3_acc_10_itm_10_1_1[2])
          | (COMP_LOOP_3_acc_10_itm_10_1_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_137_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_137_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b0011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_94_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_nor_94_itm <= ~((COMP_LOOP_3_acc_10_itm_10_1_1[3]) | (COMP_LOOP_3_acc_10_itm_10_1_1[1])
          | (COMP_LOOP_3_acc_10_itm_10_1_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_139_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_139_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b0101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_140_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_140_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b0110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_141_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_141_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b0111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_97_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_nor_97_itm <= ~((COMP_LOOP_3_acc_10_itm_10_1_1[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_143_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_143_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b1001);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_144_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_144_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b1010);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_145_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_145_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b1011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_146_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_146_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b1100);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_147_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_147_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b1101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_148_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_148_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b1110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_149_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_204 ) begin
      COMP_LOOP_COMP_LOOP_and_149_itm <= (COMP_LOOP_3_acc_10_itm_10_1_1[3:0]==4'b1111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_4_sva <= 10'b0000000000;
    end
    else if ( mux_909_nl | (fsm_output[7]) ) begin
      COMP_LOOP_acc_10_cse_10_1_4_sva <= COMP_LOOP_4_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( mux_912_nl | (fsm_output[7]) ) begin
      COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_5_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_13_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_nor_13_itm <= ~((COMP_LOOP_4_acc_10_itm_10_1_1[3:0]!=4'b0000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_131_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_nor_131_itm <= ~((COMP_LOOP_4_acc_10_itm_10_1_1[3:1]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_132_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_nor_132_itm <= ~((COMP_LOOP_4_acc_10_itm_10_1_1[3]) | (COMP_LOOP_4_acc_10_itm_10_1_1[2])
          | (COMP_LOOP_4_acc_10_itm_10_1_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_197_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_197_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b0011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_134_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_nor_134_itm <= ~((COMP_LOOP_4_acc_10_itm_10_1_1[3]) | (COMP_LOOP_4_acc_10_itm_10_1_1[1])
          | (COMP_LOOP_4_acc_10_itm_10_1_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_199_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_199_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b0101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_200_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_200_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b0110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_201_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_201_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b0111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_137_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_nor_137_itm <= ~((COMP_LOOP_4_acc_10_itm_10_1_1[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_203_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_203_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b1001);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_204_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_204_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b1010);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_205_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_205_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b1011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_206_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_206_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b1100);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_207_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_207_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b1101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_208_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_208_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b1110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_209_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_207 ) begin
      COMP_LOOP_COMP_LOOP_and_209_itm <= (COMP_LOOP_4_acc_10_itm_10_1_1[3:0]==4'b1111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_13_psp_sva <= 8'b00000000;
    end
    else if ( MUX_s_1_2_2(mux_922_nl, mux_tmp_900, fsm_output[1]) ) begin
      COMP_LOOP_acc_13_psp_sva <= nl_COMP_LOOP_acc_13_psp_sva[7:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_5_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_925_nl, mux_tmp_900, fsm_output[1]) ) begin
      COMP_LOOP_acc_10_cse_10_1_5_sva <= COMP_LOOP_5_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_tmp_909, mux_tmp_900, fsm_output[1]) ) begin
      COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_6_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_17_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_nor_17_itm <= ~((COMP_LOOP_5_acc_10_itm_10_1_1[3:0]!=4'b0000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_171_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_nor_171_itm <= ~((COMP_LOOP_5_acc_10_itm_10_1_1[3:1]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_172_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_nor_172_itm <= ~((COMP_LOOP_5_acc_10_itm_10_1_1[3]) | (COMP_LOOP_5_acc_10_itm_10_1_1[2])
          | (COMP_LOOP_5_acc_10_itm_10_1_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_257_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_257_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b0011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_174_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_nor_174_itm <= ~((COMP_LOOP_5_acc_10_itm_10_1_1[3]) | (COMP_LOOP_5_acc_10_itm_10_1_1[1])
          | (COMP_LOOP_5_acc_10_itm_10_1_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_259_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_259_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b0101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_260_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_260_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b0110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_261_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_261_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b0111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_nor_177_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_nor_177_itm <= ~((COMP_LOOP_5_acc_10_itm_10_1_1[2:0]!=3'b000));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_263_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_263_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b1001);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_264_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_264_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b1010);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_265_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_265_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b1011);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_266_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_266_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b1100);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_267_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_267_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b1101);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_268_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_268_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b1110);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_and_269_itm <= 1'b0;
    end
    else if ( ~ and_dcpl_208 ) begin
      COMP_LOOP_COMP_LOOP_and_269_itm <= (COMP_LOOP_5_acc_10_itm_10_1_1[3:0]==4'b1111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_6_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_932_nl, mux_tmp_857, fsm_output[1]) ) begin
      COMP_LOOP_acc_10_cse_10_1_6_sva <= COMP_LOOP_6_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_tmp_916, mux_tmp_857, fsm_output[1]) ) begin
      COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_7_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_21_itm <= 1'b0;
      COMP_LOOP_nor_211_itm <= 1'b0;
      COMP_LOOP_nor_212_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_317_itm <= 1'b0;
      COMP_LOOP_nor_214_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_319_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_320_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_321_itm <= 1'b0;
      COMP_LOOP_nor_217_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_323_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_324_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_325_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_326_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_327_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_328_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_329_itm <= 1'b0;
    end
    else if ( mux_939_itm ) begin
      COMP_LOOP_COMP_LOOP_nor_21_itm <= ~((COMP_LOOP_6_acc_10_itm_10_1_1[3:0]!=4'b0000));
      COMP_LOOP_nor_211_itm <= ~((COMP_LOOP_6_acc_10_itm_10_1_1[3:1]!=3'b000));
      COMP_LOOP_nor_212_itm <= ~((COMP_LOOP_6_acc_10_itm_10_1_1[3]) | (COMP_LOOP_6_acc_10_itm_10_1_1[2])
          | (COMP_LOOP_6_acc_10_itm_10_1_1[0]));
      COMP_LOOP_COMP_LOOP_and_317_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b0011);
      COMP_LOOP_nor_214_itm <= ~((COMP_LOOP_6_acc_10_itm_10_1_1[3]) | (COMP_LOOP_6_acc_10_itm_10_1_1[1])
          | (COMP_LOOP_6_acc_10_itm_10_1_1[0]));
      COMP_LOOP_COMP_LOOP_and_319_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b0101);
      COMP_LOOP_COMP_LOOP_and_320_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b0110);
      COMP_LOOP_COMP_LOOP_and_321_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b0111);
      COMP_LOOP_nor_217_itm <= ~((COMP_LOOP_6_acc_10_itm_10_1_1[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_323_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b1001);
      COMP_LOOP_COMP_LOOP_and_324_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b1010);
      COMP_LOOP_COMP_LOOP_and_325_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b1011);
      COMP_LOOP_COMP_LOOP_and_326_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b1100);
      COMP_LOOP_COMP_LOOP_and_327_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b1101);
      COMP_LOOP_COMP_LOOP_and_328_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b1110);
      COMP_LOOP_COMP_LOOP_and_329_itm <= (COMP_LOOP_6_acc_10_itm_10_1_1[3:0]==4'b1111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_14_psp_sva <= 9'b000000000;
    end
    else if ( MUX_s_1_2_2(mux_942_nl, mux_tmp_921, fsm_output[1]) ) begin
      COMP_LOOP_acc_14_psp_sva <= nl_COMP_LOOP_acc_14_psp_sva[8:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_7_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_944_nl, mux_tmp_921, fsm_output[1]) ) begin
      COMP_LOOP_acc_10_cse_10_1_7_sva <= COMP_LOOP_7_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( mux_946_itm ) begin
      COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm <= readslicef_8_1_7(COMP_LOOP_acc_15_nl);
      reg_COMP_LOOP_k_10_3_ftd <= z_out_4[6:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_25_itm <= 1'b0;
      COMP_LOOP_nor_251_itm <= 1'b0;
      COMP_LOOP_nor_252_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_377_itm <= 1'b0;
      COMP_LOOP_nor_254_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_379_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_380_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_381_itm <= 1'b0;
      COMP_LOOP_nor_257_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_383_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_384_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_385_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_386_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_387_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_388_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_389_itm <= 1'b0;
    end
    else if ( mux_948_itm ) begin
      COMP_LOOP_COMP_LOOP_nor_25_itm <= ~((COMP_LOOP_7_acc_10_itm_10_1_1[3:0]!=4'b0000));
      COMP_LOOP_nor_251_itm <= ~((COMP_LOOP_7_acc_10_itm_10_1_1[3:1]!=3'b000));
      COMP_LOOP_nor_252_itm <= ~((COMP_LOOP_7_acc_10_itm_10_1_1[3]) | (COMP_LOOP_7_acc_10_itm_10_1_1[2])
          | (COMP_LOOP_7_acc_10_itm_10_1_1[0]));
      COMP_LOOP_COMP_LOOP_and_377_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b0011);
      COMP_LOOP_nor_254_itm <= ~((COMP_LOOP_7_acc_10_itm_10_1_1[3]) | (COMP_LOOP_7_acc_10_itm_10_1_1[1])
          | (COMP_LOOP_7_acc_10_itm_10_1_1[0]));
      COMP_LOOP_COMP_LOOP_and_379_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b0101);
      COMP_LOOP_COMP_LOOP_and_380_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b0110);
      COMP_LOOP_COMP_LOOP_and_381_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b0111);
      COMP_LOOP_nor_257_itm <= ~((COMP_LOOP_7_acc_10_itm_10_1_1[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_383_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b1001);
      COMP_LOOP_COMP_LOOP_and_384_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b1010);
      COMP_LOOP_COMP_LOOP_and_385_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b1011);
      COMP_LOOP_COMP_LOOP_and_386_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b1100);
      COMP_LOOP_COMP_LOOP_and_387_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b1101);
      COMP_LOOP_COMP_LOOP_and_388_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b1110);
      COMP_LOOP_COMP_LOOP_and_389_itm <= (COMP_LOOP_7_acc_10_itm_10_1_1[3:0]==4'b1111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_1_cse_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_951_nl, mux_tmp_930, fsm_output[1]) ) begin
      COMP_LOOP_acc_1_cse_sva <= nl_COMP_LOOP_acc_1_cse_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_acc_10_cse_10_1_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2(mux_225_nl, mux_tmp_930, fsm_output[1]) ) begin
      COMP_LOOP_acc_10_cse_10_1_sva <= COMP_LOOP_8_acc_10_itm_10_1_1;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(mux_tmp_840, mux_tmp_930, fsm_output[1]) ) begin
      COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm <= readslicef_11_1_10(COMP_LOOP_1_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_COMP_LOOP_nor_29_itm <= 1'b0;
      COMP_LOOP_nor_291_itm <= 1'b0;
      COMP_LOOP_nor_292_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_437_itm <= 1'b0;
      COMP_LOOP_nor_294_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_439_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_440_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_441_itm <= 1'b0;
      COMP_LOOP_nor_297_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_443_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_444_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_445_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_446_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_447_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_448_itm <= 1'b0;
      COMP_LOOP_COMP_LOOP_and_449_itm <= 1'b0;
    end
    else if ( mux_958_itm ) begin
      COMP_LOOP_COMP_LOOP_nor_29_itm <= ~((COMP_LOOP_8_acc_10_itm_10_1_1[3:0]!=4'b0000));
      COMP_LOOP_nor_291_itm <= ~((COMP_LOOP_8_acc_10_itm_10_1_1[3:1]!=3'b000));
      COMP_LOOP_nor_292_itm <= ~((COMP_LOOP_8_acc_10_itm_10_1_1[3]) | (COMP_LOOP_8_acc_10_itm_10_1_1[2])
          | (COMP_LOOP_8_acc_10_itm_10_1_1[0]));
      COMP_LOOP_COMP_LOOP_and_437_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b0011);
      COMP_LOOP_nor_294_itm <= ~((COMP_LOOP_8_acc_10_itm_10_1_1[3]) | (COMP_LOOP_8_acc_10_itm_10_1_1[1])
          | (COMP_LOOP_8_acc_10_itm_10_1_1[0]));
      COMP_LOOP_COMP_LOOP_and_439_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b0101);
      COMP_LOOP_COMP_LOOP_and_440_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b0110);
      COMP_LOOP_COMP_LOOP_and_441_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b0111);
      COMP_LOOP_nor_297_itm <= ~((COMP_LOOP_8_acc_10_itm_10_1_1[2:0]!=3'b000));
      COMP_LOOP_COMP_LOOP_and_443_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b1001);
      COMP_LOOP_COMP_LOOP_and_444_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b1010);
      COMP_LOOP_COMP_LOOP_and_445_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b1011);
      COMP_LOOP_COMP_LOOP_and_446_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b1100);
      COMP_LOOP_COMP_LOOP_and_447_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b1101);
      COMP_LOOP_COMP_LOOP_and_448_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b1110);
      COMP_LOOP_COMP_LOOP_and_449_itm <= (COMP_LOOP_8_acc_10_itm_10_1_1[3:0]==4'b1111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm <= 1'b0;
    end
    else if ( COMP_LOOP_tmp_or_cse ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_17_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_17_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_37_nl,
          {and_dcpl_47 , and_dcpl_50 , COMP_LOOP_or_35_cse , and_dcpl_129 , and_dcpl_130});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_19_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_19_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_38_nl,
          {and_dcpl_47 , and_dcpl_50 , COMP_LOOP_or_35_cse , and_dcpl_129 , and_dcpl_130});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_20_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_20_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_39_nl,
          {and_dcpl_47 , and_dcpl_50 , COMP_LOOP_or_35_cse , and_dcpl_129 , and_dcpl_130});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm <= 1'b0;
    end
    else if ( COMP_LOOP_tmp_or_3_cse ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_21_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_21_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse,
          {and_dcpl_47 , and_dcpl_50 , and_dcpl_128 , and_dcpl_129 , COMP_LOOP_or_34_cse});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_23_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse,
          {and_dcpl_47 , and_dcpl_50 , and_dcpl_128 , and_dcpl_129 , COMP_LOOP_or_34_cse});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm <= 1'b0;
      COMP_LOOP_tmp_nor_1_itm <= 1'b0;
      COMP_LOOP_tmp_nor_14_itm <= 1'b0;
      COMP_LOOP_tmp_nor_16_itm <= 1'b0;
      COMP_LOOP_tmp_nor_19_itm <= 1'b0;
    end
    else if ( COMP_LOOP_tmp_or_5_cse ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_24_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse, {and_dcpl_47 , and_dcpl_50 , and_dcpl_129
          , COMP_LOOP_or_34_cse});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_25_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse, {and_dcpl_47 , and_dcpl_50 , and_dcpl_129
          , COMP_LOOP_or_34_cse});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_26_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse, {and_dcpl_47 , and_dcpl_50 , and_dcpl_129
          , COMP_LOOP_or_34_cse});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_27_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse, {and_dcpl_47 , and_dcpl_50 , and_dcpl_129
          , COMP_LOOP_or_34_cse});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_28_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse, {and_dcpl_47 , and_dcpl_50 , and_dcpl_129
          , COMP_LOOP_or_34_cse});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_29_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse, {and_dcpl_47 , and_dcpl_50 , and_dcpl_129
          , COMP_LOOP_or_34_cse});
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_COMP_LOOP_nor_1_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_nor_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse,
          {and_dcpl_47 , COMP_LOOP_or_25_cse , COMP_LOOP_or_34_cse});
      COMP_LOOP_tmp_nor_1_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_nor_11_nl, COMP_LOOP_tmp_nor_1_cse,
          COMP_LOOP_tmp_nor_13_cse, {and_dcpl_47 , and_dcpl_50 , COMP_LOOP_or_24_cse});
      COMP_LOOP_tmp_nor_14_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_nor_12_nl, COMP_LOOP_tmp_nor_3_cse,
          COMP_LOOP_tmp_nor_1_cse, {and_dcpl_47 , and_dcpl_50 , COMP_LOOP_or_24_cse});
      COMP_LOOP_tmp_nor_16_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_nor_14_nl, COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse,
          COMP_LOOP_tmp_nor_3_cse, {and_dcpl_47 , and_dcpl_50 , COMP_LOOP_or_24_cse});
      COMP_LOOP_tmp_nor_19_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_nor_17_nl, COMP_LOOP_tmp_nor_13_cse,
          COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse, {and_dcpl_47 , and_dcpl_50 , COMP_LOOP_or_24_cse});
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_214 & and_dcpl_211 & (fsm_output[1]) & (~ COMP_LOOP_1_tmp_mul_idiv_sva_0))
        | COMP_LOOP_tmp_mux_itm_mx0c1 ) begin
      COMP_LOOP_tmp_mux_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_8_i_q_d,
          COMP_LOOP_tmp_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_2_tmp_mul_idiv_sva <= 10'b0000000000;
    end
    else if ( and_dcpl_50 | and_dcpl_129 | and_dcpl_130 ) begin
      COMP_LOOP_2_tmp_mul_idiv_sva <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_2_tmp_lshift_ncse_sva <= 10'b0000000000;
    end
    else if ( and_dcpl_50 | and_dcpl_133 ) begin
      COMP_LOOP_2_tmp_lshift_ncse_sva <= MUX_v_10_2_2(z_out_1, z_out_2, and_dcpl_133);
    end
  end
  always @(posedge clk) begin
    if ( and_dcpl_50 | and_dcpl_128 | COMP_LOOP_1_acc_8_itm_mx0c2 | COMP_LOOP_1_acc_8_itm_mx0c3
        | and_dcpl_58 | and_dcpl_165 | and_dcpl_63 | and_dcpl_167 | and_dcpl_66 |
        and_dcpl_171 | and_dcpl_68 | and_dcpl_174 | and_dcpl_71 | and_dcpl_179 |
        and_dcpl_73 | and_dcpl_182 | and_dcpl_75 | and_dcpl_185 ) begin
      COMP_LOOP_1_acc_8_itm <= MUX1HOT_v_64_19_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
          vec_rsc_0_2_i_q_d, vec_rsc_0_3_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_5_i_q_d,
          vec_rsc_0_6_i_q_d, vec_rsc_0_7_i_q_d, vec_rsc_0_8_i_q_d, vec_rsc_0_9_i_q_d,
          vec_rsc_0_10_i_q_d, vec_rsc_0_11_i_q_d, vec_rsc_0_12_i_q_d, vec_rsc_0_13_i_q_d,
          vec_rsc_0_14_i_q_d, vec_rsc_0_15_i_q_d, COMP_LOOP_acc_17_nl, twiddle_rsc_0_10_i_q_d,
          COMP_LOOP_1_modulo_dev_cmp_return_rsc_z, {COMP_LOOP_or_nl , COMP_LOOP_or_1_nl
          , COMP_LOOP_or_2_nl , COMP_LOOP_or_3_nl , COMP_LOOP_or_4_nl , COMP_LOOP_or_5_nl
          , COMP_LOOP_or_6_nl , COMP_LOOP_or_7_nl , COMP_LOOP_or_8_nl , COMP_LOOP_or_9_nl
          , COMP_LOOP_or_10_nl , COMP_LOOP_or_11_nl , COMP_LOOP_or_12_nl , COMP_LOOP_or_13_nl
          , COMP_LOOP_or_14_nl , COMP_LOOP_or_15_nl , COMP_LOOP_or_20_itm , COMP_LOOP_1_acc_8_itm_mx0c2
          , COMP_LOOP_1_acc_8_itm_mx0c3});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_3_tmp_lshift_ncse_sva <= 9'b000000000;
    end
    else if ( COMP_LOOP_or_35_cse ) begin
      COMP_LOOP_3_tmp_lshift_ncse_sva <= MUX_v_9_2_2((z_out_1[8:0]), (z_out_2[8:0]),
          and_dcpl_131);
    end
  end
  always @(posedge clk) begin
    if ( ~ and_237_tmp ) begin
      COMP_LOOP_tmp_mux1h_itm <= MUX1HOT_v_64_16_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
          twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_5_i_q_d,
          twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_7_i_q_d, twiddle_rsc_0_8_i_q_d, twiddle_rsc_0_9_i_q_d,
          twiddle_rsc_0_10_i_q_d, twiddle_rsc_0_11_i_q_d, twiddle_rsc_0_12_i_q_d,
          twiddle_rsc_0_13_i_q_d, twiddle_rsc_0_14_i_q_d, twiddle_rsc_0_15_i_q_d,
          {COMP_LOOP_tmp_and_63_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_1_nl
          , COMP_LOOP_tmp_and_64_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_3_nl , COMP_LOOP_tmp_and_65_nl
          , COMP_LOOP_tmp_and_66_nl , COMP_LOOP_tmp_and_67_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_7_nl
          , COMP_LOOP_tmp_and_68_nl , COMP_LOOP_tmp_and_69_nl , COMP_LOOP_tmp_and_70_nl
          , COMP_LOOP_tmp_and_71_nl , COMP_LOOP_tmp_and_72_nl , COMP_LOOP_tmp_and_73_nl
          , COMP_LOOP_tmp_and_74_nl});
    end
  end
  always @(posedge clk) begin
    if ( ~ nor_568_tmp ) begin
      COMP_LOOP_tmp_mux1h_1_itm <= MUX1HOT_v_64_8_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_2_i_q_d,
          twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_8_i_q_d, twiddle_rsc_0_10_i_q_d,
          twiddle_rsc_0_12_i_q_d, twiddle_rsc_0_14_i_q_d, {COMP_LOOP_tmp_and_58_nl
          , COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_nl
          , COMP_LOOP_tmp_and_59_nl , COMP_LOOP_tmp_COMP_LOOP_tmp_and_18_nl , COMP_LOOP_tmp_and_60_nl
          , COMP_LOOP_tmp_and_61_nl , COMP_LOOP_tmp_and_62_nl});
    end
  end
  always @(posedge clk) begin
    if ( ~ nor_tmp_180 ) begin
      COMP_LOOP_tmp_mux1h_2_itm <= MUX1HOT_v_64_16_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
          twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_5_i_q_d,
          twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_7_i_q_d, twiddle_rsc_0_8_i_q_d, twiddle_rsc_0_9_i_q_d,
          twiddle_rsc_0_10_i_q_d, twiddle_rsc_0_11_i_q_d, twiddle_rsc_0_12_i_q_d,
          twiddle_rsc_0_13_i_q_d, twiddle_rsc_0_14_i_q_d, twiddle_rsc_0_15_i_q_d,
          {COMP_LOOP_tmp_and_42_nl , COMP_LOOP_tmp_and_43_nl , COMP_LOOP_tmp_and_44_nl
          , COMP_LOOP_tmp_and_45_nl , COMP_LOOP_tmp_and_46_nl , COMP_LOOP_tmp_and_47_nl
          , COMP_LOOP_tmp_and_48_nl , COMP_LOOP_tmp_and_49_nl , COMP_LOOP_tmp_and_50_nl
          , COMP_LOOP_tmp_and_51_nl , COMP_LOOP_tmp_and_52_nl , COMP_LOOP_tmp_and_53_nl
          , COMP_LOOP_tmp_and_54_nl , COMP_LOOP_tmp_and_55_nl , COMP_LOOP_tmp_and_56_nl
          , COMP_LOOP_tmp_and_57_nl});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm <= 1'b0;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm <= 1'b0;
    end
    else if ( COMP_LOOP_or_34_cse ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm <= COMP_LOOP_tmp_COMP_LOOP_tmp_nor_cse;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse;
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm <= 1'b0;
    end
    else if ( and_dcpl_130 | and_dcpl_131 ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm <= MUX_s_1_2_2(COMP_LOOP_tmp_COMP_LOOP_tmp_nor_3_nl,
          COMP_LOOP_tmp_COMP_LOOP_tmp_and_21_cse, and_dcpl_131);
    end
  end
  always @(posedge clk) begin
    if ( ~ and_240_tmp ) begin
      COMP_LOOP_tmp_mux1h_3_itm <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_4_i_q_d,
          twiddle_rsc_0_8_i_q_d, twiddle_rsc_0_12_i_q_d, {COMP_LOOP_tmp_and_38_nl
          , COMP_LOOP_tmp_and_39_nl , COMP_LOOP_tmp_and_40_nl , COMP_LOOP_tmp_and_41_nl});
    end
  end
  always @(posedge clk) begin
    if ( ((~((COMP_LOOP_2_tmp_lshift_ncse_sva[0]) & COMP_LOOP_tmp_nor_1_itm)) | COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_63_rgt | COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_65_rgt | COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_69_rgt | COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm
        | tmp_21_sva_1_mx0c0 | and_dcpl_133) & mux_1009_nl ) begin
      tmp_21_sva_1 <= MUX1HOT_v_64_17_2(twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_6_i_q_d,
          twiddle_rsc_0_0_i_q_d, tmp_21_sva_2, tmp_21_sva_3, twiddle_rsc_0_4_i_q_d,
          tmp_21_sva_5, tmp_21_sva_6, tmp_21_sva_7, twiddle_rsc_0_8_i_q_d, tmp_21_sva_9,
          COMP_LOOP_1_acc_8_itm, tmp_21_sva_11, twiddle_rsc_0_12_i_q_d, tmp_21_sva_13,
          tmp_21_sva_14, tmp_21_sva_15, {tmp_21_sva_1_mx0c0 , and_dcpl_133 , COMP_LOOP_tmp_and_23_nl
          , COMP_LOOP_tmp_and_24_nl , COMP_LOOP_tmp_and_25_nl , COMP_LOOP_tmp_and_26_nl
          , COMP_LOOP_tmp_and_27_nl , COMP_LOOP_tmp_and_28_nl , COMP_LOOP_tmp_and_29_nl
          , COMP_LOOP_tmp_and_30_nl , COMP_LOOP_tmp_and_31_nl , COMP_LOOP_tmp_and_32_nl
          , COMP_LOOP_tmp_and_33_nl , COMP_LOOP_tmp_and_34_nl , COMP_LOOP_tmp_and_35_nl
          , COMP_LOOP_tmp_and_36_nl , COMP_LOOP_tmp_and_37_nl});
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm ) begin
      tmp_21_sva_3 <= twiddle_rsc_0_3_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm ) begin
      tmp_21_sva_5 <= twiddle_rsc_0_5_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm ) begin
      tmp_21_sva_7 <= twiddle_rsc_0_7_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm ) begin
      tmp_21_sva_9 <= twiddle_rsc_0_9_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm ) begin
      tmp_21_sva_13 <= twiddle_rsc_0_13_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm ) begin
      tmp_21_sva_15 <= twiddle_rsc_0_15_i_q_d;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm <= 1'b0;
    end
    else if ( ~(or_tmp_1059 | (~ and_334_cse) | or_tmp_1076) ) begin
      COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm <= COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse;
    end
  end
  always @(posedge clk) begin
    if ( mux_1017_tmp ) begin
      COMP_LOOP_tmp_mux1h_4_itm <= MUX1HOT_v_64_16_2(twiddle_rsc_0_0_i_q_d, tmp_21_sva_1,
          tmp_21_sva_2, tmp_21_sva_3, twiddle_rsc_0_4_i_q_d, tmp_21_sva_5, tmp_21_sva_6,
          tmp_21_sva_7, twiddle_rsc_0_8_i_q_d, tmp_21_sva_9, COMP_LOOP_1_acc_8_itm,
          tmp_21_sva_11, twiddle_rsc_0_12_i_q_d, tmp_21_sva_13, tmp_21_sva_14, tmp_21_sva_15,
          {COMP_LOOP_tmp_and_7_nl , COMP_LOOP_tmp_and_8_nl , COMP_LOOP_tmp_and_9_nl
          , COMP_LOOP_tmp_and_10_nl , COMP_LOOP_tmp_and_11_nl , COMP_LOOP_tmp_and_12_nl
          , COMP_LOOP_tmp_and_13_nl , COMP_LOOP_tmp_and_14_nl , COMP_LOOP_tmp_and_15_nl
          , COMP_LOOP_tmp_and_16_nl , COMP_LOOP_tmp_and_17_nl , COMP_LOOP_tmp_and_18_nl
          , COMP_LOOP_tmp_and_19_nl , COMP_LOOP_tmp_and_20_nl , COMP_LOOP_tmp_and_21_nl
          , COMP_LOOP_tmp_and_22_nl});
    end
  end
  always @(posedge clk) begin
    if ( ((~((COMP_LOOP_3_tmp_lshift_ncse_sva[2:0]==3'b001))) | COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm
        | COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm | COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm
        | and_dcpl_133) & mux_1021_nl ) begin
      COMP_LOOP_tmp_mux1h_5_itm <= MUX1HOT_v_64_8_2(twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_0_i_q_d,
          twiddle_rsc_0_4_i_q_d, tmp_21_sva_1, twiddle_rsc_0_8_i_q_d, COMP_LOOP_1_acc_8_itm,
          twiddle_rsc_0_12_i_q_d, tmp_21_sva_11, {and_dcpl_133 , COMP_LOOP_tmp_and_nl
          , COMP_LOOP_tmp_and_1_nl , COMP_LOOP_tmp_and_2_nl , COMP_LOOP_tmp_and_3_nl
          , COMP_LOOP_tmp_and_4_nl , COMP_LOOP_tmp_and_5_nl , COMP_LOOP_tmp_and_6_nl});
    end
  end
  assign mux_284_nl = MUX_s_1_2_2(and_tmp_12, and_344_cse, and_334_cse);
  assign mux_285_nl = MUX_s_1_2_2(not_tmp_120, mux_284_nl, fsm_output[5]);
  assign VEC_LOOP_j_not_1_nl = ~ VEC_LOOP_j_10_0_sva_9_0_mx0c0;
  assign and_335_nl = (fsm_output[7:5]==3'b111);
  assign mux_858_nl = MUX_s_1_2_2(not_tmp_371, and_335_nl, fsm_output[1]);
  assign nand_240_nl = ~(mux_858_nl & (fsm_output[4:3]==2'b00) & and_dcpl_48);
  assign or_1265_nl = (fsm_output[7]) | (fsm_output[5]) | nor_652_cse | (fsm_output[4:3]!=2'b00);
  assign nor_653_nl = ~((fsm_output[4:2]!=3'b000));
  assign mux_1022_nl = MUX_s_1_2_2(or_170_cse_1, nor_653_nl, fsm_output[5]);
  assign or_1266_nl = ((fsm_output[2:1]==2'b11)) | (fsm_output[4:3]!=2'b00);
  assign nor_654_nl = ~((fsm_output[4:1]!=4'b0000));
  assign mux_nl = MUX_s_1_2_2(or_1266_nl, nor_654_nl, fsm_output[5]);
  assign mux_1023_nl = MUX_s_1_2_2(mux_1022_nl, mux_nl, fsm_output[0]);
  assign nand_241_nl = ~((fsm_output[7]) & mux_1023_nl);
  assign mux_135_nl = MUX_s_1_2_2(nor_tmp_42, and_364_cse, or_93_cse);
  assign mux_879_nl = MUX_s_1_2_2(mux_tmp_859, mux_135_nl, fsm_output[5]);
  assign mux_882_nl = MUX_s_1_2_2(nor_tmp_15, nor_tmp_13, or_93_cse);
  assign mux_883_nl = MUX_s_1_2_2(not_tmp_39, mux_882_nl, fsm_output[5]);
  assign mux_884_nl = MUX_s_1_2_2(mux_883_nl, mux_tmp_862, fsm_output[1]);
  assign nand_232_nl = ~(or_93_cse & (fsm_output[4:3]==2'b11));
  assign mux_21_nl = MUX_s_1_2_2(or_1233_cse, nand_232_nl, fsm_output[5]);
  assign mux_887_nl = MUX_s_1_2_2(mux_21_nl, (~ mux_tmp_866), fsm_output[1]);
  assign mux_23_nl = MUX_s_1_2_2((~ or_1233_cse), nor_tmp, fsm_output[5]);
  assign mux_889_nl = MUX_s_1_2_2(mux_23_nl, mux_tmp_866, fsm_output[1]);
  assign nl_COMP_LOOP_3_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + conv_u2s_10_11({COMP_LOOP_k_10_3_sva_6_0 , 3'b010}) + 11'b00000000001;
  assign COMP_LOOP_3_acc_nl = nl_COMP_LOOP_3_acc_nl[10:0];
  assign mux_891_nl = MUX_s_1_2_2(mux_tmp_6, mux_tmp_866, fsm_output[1]);
  assign nl_COMP_LOOP_acc_11_psp_sva  = (VEC_LOOP_j_10_0_sva_9_0[9:1]) + ({COMP_LOOP_k_10_3_sva_6_0
      , 2'b01});
  assign mux_896_nl = MUX_s_1_2_2(nor_tmp_15, nor_tmp_13, fsm_output[0]);
  assign mux_897_nl = MUX_s_1_2_2(mux_tmp_873, mux_896_nl, fsm_output[2]);
  assign mux_898_nl = MUX_s_1_2_2(mux_897_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_899_nl = MUX_s_1_2_2(mux_898_nl, mux_tmp_876, fsm_output[1]);
  assign mux_900_nl = MUX_s_1_2_2(mux_tmp_873, nor_tmp_13, fsm_output[2]);
  assign mux_901_nl = MUX_s_1_2_2(mux_900_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_902_nl = MUX_s_1_2_2(mux_901_nl, mux_tmp_876, fsm_output[1]);
  assign nl_COMP_LOOP_acc_12_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:3]))})
      + conv_u2u_8_9({COMP_LOOP_k_10_3_sva_6_0 , 1'b0}) + 9'b000000001;
  assign COMP_LOOP_acc_12_nl = nl_COMP_LOOP_acc_12_nl[8:0];
  assign mux_905_nl = MUX_s_1_2_2(mux_tmp_885, mux_tmp_876, fsm_output[1]);
  assign mux_82_nl = MUX_s_1_2_2(not_tmp_39, nor_tmp_13, fsm_output[5]);
  assign mux_909_nl = MUX_s_1_2_2(mux_82_nl, mux_tmp_862, fsm_output[1]);
  assign nl_COMP_LOOP_5_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + conv_u2s_10_11({COMP_LOOP_k_10_3_sva_6_0 , 3'b100}) + 11'b00000000001;
  assign COMP_LOOP_5_acc_nl = nl_COMP_LOOP_5_acc_nl[10:0];
  assign mux_912_nl = MUX_s_1_2_2(mux_85_cse, mux_tmp_862, fsm_output[1]);
  assign nl_COMP_LOOP_acc_13_psp_sva  = (VEC_LOOP_j_10_0_sva_9_0[9:2]) + ({COMP_LOOP_k_10_3_sva_6_0
      , 1'b1});
  assign mux_920_nl = MUX_s_1_2_2(nor_tmp_42, and_364_cse, fsm_output[0]);
  assign mux_921_nl = MUX_s_1_2_2(mux_tmp_897, mux_920_nl, fsm_output[2]);
  assign mux_922_nl = MUX_s_1_2_2(mux_921_nl, (fsm_output[7]), fsm_output[5]);
  assign mux_924_nl = MUX_s_1_2_2(mux_tmp_897, and_364_cse, fsm_output[2]);
  assign mux_925_nl = MUX_s_1_2_2(mux_924_nl, (fsm_output[7]), fsm_output[5]);
  assign nl_COMP_LOOP_6_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + conv_u2s_10_11({COMP_LOOP_k_10_3_sva_6_0 , 3'b101}) + 11'b00000000001;
  assign COMP_LOOP_6_acc_nl = nl_COMP_LOOP_6_acc_nl[10:0];
  assign mux_932_nl = MUX_s_1_2_2(mux_tmp_859, and_364_cse, fsm_output[5]);
  assign nl_COMP_LOOP_7_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + conv_u2s_10_11({COMP_LOOP_k_10_3_sva_6_0 , 3'b110}) + 11'b00000000001;
  assign COMP_LOOP_7_acc_nl = nl_COMP_LOOP_7_acc_nl[10:0];
  assign nl_COMP_LOOP_acc_14_psp_sva  = (VEC_LOOP_j_10_0_sva_9_0[9:1]) + ({COMP_LOOP_k_10_3_sva_6_0
      , 2'b11});
  assign mux_941_nl = MUX_s_1_2_2(mux_tmp_848, mux_tmp_847, fsm_output[2]);
  assign mux_942_nl = MUX_s_1_2_2(mux_941_nl, and_344_cse, fsm_output[5]);
  assign mux_944_nl = MUX_s_1_2_2(mux_tmp_848, and_344_cse, or_41_cse);
  assign nl_COMP_LOOP_acc_15_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:4]))})
      + conv_u2u_7_8(COMP_LOOP_k_10_3_sva_6_0) + 8'b00000001;
  assign COMP_LOOP_acc_15_nl = nl_COMP_LOOP_acc_15_nl[7:0];
  assign nl_COMP_LOOP_acc_1_cse_sva  = VEC_LOOP_j_10_0_sva_9_0 + ({COMP_LOOP_k_10_3_sva_6_0
      , 3'b111});
  assign mux_950_nl = MUX_s_1_2_2(and_tmp_12, and_344_cse, or_93_cse);
  assign mux_951_nl = MUX_s_1_2_2(nor_543_cse, mux_950_nl, fsm_output[5]);
  assign mux_225_nl = MUX_s_1_2_2(nor_543_cse, and_344_cse, fsm_output[5]);
  assign nl_COMP_LOOP_1_acc_nl = ({z_out_4 , 3'b000}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))})
      + 11'b00000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[10:0];
  assign COMP_LOOP_COMP_LOOP_and_17_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b0011);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_17_nl = (z_out_2[2:0]==3'b011);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_37_nl = (COMP_LOOP_5_tmp_mul_idiv_sva[1:0]==2'b01);
  assign COMP_LOOP_COMP_LOOP_and_19_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b0101);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_19_nl = (z_out_2[2:0]==3'b101);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_38_nl = (COMP_LOOP_5_tmp_mul_idiv_sva[1:0]==2'b10);
  assign COMP_LOOP_COMP_LOOP_and_20_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b0110);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_20_nl = (z_out_2[2:0]==3'b110);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_39_nl = (COMP_LOOP_5_tmp_mul_idiv_sva[1:0]==2'b11);
  assign COMP_LOOP_COMP_LOOP_and_21_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b0111);
  assign COMP_LOOP_COMP_LOOP_and_23_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b1001);
  assign COMP_LOOP_COMP_LOOP_and_24_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b1010);
  assign COMP_LOOP_COMP_LOOP_and_25_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b1011);
  assign COMP_LOOP_COMP_LOOP_and_26_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b1100);
  assign COMP_LOOP_COMP_LOOP_and_27_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b1101);
  assign COMP_LOOP_COMP_LOOP_and_28_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b1110);
  assign COMP_LOOP_COMP_LOOP_and_29_nl = (COMP_LOOP_1_acc_10_itm_10_1_1[3:0]==4'b1111);
  assign COMP_LOOP_COMP_LOOP_nor_1_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[3:0]!=4'b0000));
  assign COMP_LOOP_nor_11_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[3:1]!=3'b000));
  assign COMP_LOOP_nor_12_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[3]) | (COMP_LOOP_1_acc_10_itm_10_1_1[2])
      | (COMP_LOOP_1_acc_10_itm_10_1_1[0]));
  assign COMP_LOOP_nor_14_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[3]) | (COMP_LOOP_1_acc_10_itm_10_1_1[1])
      | (COMP_LOOP_1_acc_10_itm_10_1_1[0]));
  assign COMP_LOOP_nor_17_nl = ~((COMP_LOOP_1_acc_10_itm_10_1_1[2:0]!=3'b000));
  assign COMP_LOOP_COMP_LOOP_mux_2_nl = MUX_v_64_2_2(COMP_LOOP_1_acc_8_itm, z_out_9,
      COMP_LOOP_or_17_itm);
  assign nl_COMP_LOOP_acc_17_nl = COMP_LOOP_mux_209_cse + COMP_LOOP_COMP_LOOP_mux_2_nl;
  assign COMP_LOOP_acc_17_nl = nl_COMP_LOOP_acc_17_nl[63:0];
  assign COMP_LOOP_or_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_14_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_13_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_12_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_72_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_10_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_70_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_69_itm & and_dcpl_75);
  assign COMP_LOOP_or_1_nl = ((COMP_LOOP_acc_10_cse_10_1_1_sva[0]) & COMP_LOOP_tmp_nor_1_itm
      & and_dcpl_50) | (COMP_LOOP_COMP_LOOP_nor_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_14_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_13_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_12_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_72_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_10_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_70_itm & and_dcpl_75);
  assign COMP_LOOP_or_2_nl = ((COMP_LOOP_acc_10_cse_10_1_1_sva[1]) & COMP_LOOP_tmp_nor_14_itm
      & and_dcpl_50) | (COMP_LOOP_COMP_LOOP_and_305_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_nor_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_14_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_13_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_12_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_72_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_10_itm & and_dcpl_75);
  assign COMP_LOOP_or_3_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_62_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_305_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_nor_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_14_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_13_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_12_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_72_itm & and_dcpl_75);
  assign COMP_LOOP_or_4_nl = ((COMP_LOOP_acc_10_cse_10_1_1_sva[2]) & COMP_LOOP_tmp_nor_16_itm
      & and_dcpl_50) | (COMP_LOOP_COMP_LOOP_and_185_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_62_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_305_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_nor_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_14_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_13_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_12_itm & and_dcpl_75);
  assign COMP_LOOP_or_5_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_64_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_185_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_62_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_305_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_nor_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_14_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_13_itm & and_dcpl_75);
  assign COMP_LOOP_or_6_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_65_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_64_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_185_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_62_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_305_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_nor_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_14_itm & and_dcpl_75);
  assign COMP_LOOP_or_7_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_66_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_65_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_64_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_185_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_62_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_305_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_nor_itm & and_dcpl_75);
  assign COMP_LOOP_or_8_nl = ((COMP_LOOP_acc_10_cse_10_1_1_sva[3]) & COMP_LOOP_tmp_nor_19_itm
      & and_dcpl_50) | (COMP_LOOP_COMP_LOOP_and_6_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_66_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_65_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_64_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_185_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_62_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_305_itm & and_dcpl_75);
  assign COMP_LOOP_or_9_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_68_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_6_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_66_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_65_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_64_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_185_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_62_itm & and_dcpl_75);
  assign COMP_LOOP_or_10_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_69_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_68_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_6_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_66_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_65_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_64_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_185_itm & and_dcpl_75);
  assign COMP_LOOP_or_11_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_70_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_69_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_68_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_6_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_66_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_65_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_64_itm & and_dcpl_75);
  assign COMP_LOOP_or_12_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_10_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_70_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_69_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_68_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_6_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_66_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_65_itm & and_dcpl_75);
  assign COMP_LOOP_or_13_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_72_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_10_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_70_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_69_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_68_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_6_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_66_itm & and_dcpl_75);
  assign COMP_LOOP_or_14_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_12_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_72_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_10_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_70_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_69_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_68_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_6_itm & and_dcpl_75);
  assign COMP_LOOP_or_15_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm & and_dcpl_50)
      | (COMP_LOOP_COMP_LOOP_and_13_itm & and_dcpl_58) | (COMP_LOOP_COMP_LOOP_and_12_itm
      & and_dcpl_63) | (COMP_LOOP_COMP_LOOP_and_72_itm & and_dcpl_66) | (COMP_LOOP_COMP_LOOP_and_10_itm
      & and_dcpl_68) | (COMP_LOOP_COMP_LOOP_and_70_itm & and_dcpl_71) | (COMP_LOOP_COMP_LOOP_and_69_itm
      & and_dcpl_73) | (COMP_LOOP_COMP_LOOP_and_68_itm & and_dcpl_75);
  assign COMP_LOOP_tmp_and_63_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_nl = (COMP_LOOP_2_tmp_mul_idiv_sva[0]) &
      COMP_LOOP_tmp_nor_19_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_1_nl = (COMP_LOOP_2_tmp_mul_idiv_sva[1])
      & COMP_LOOP_tmp_nor_1_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_64_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_3_nl = (COMP_LOOP_2_tmp_mul_idiv_sva[2])
      & COMP_LOOP_tmp_nor_14_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_65_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_66_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_67_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_7_nl = (COMP_LOOP_2_tmp_mul_idiv_sva[3])
      & COMP_LOOP_tmp_nor_16_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_68_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_69_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_70_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_71_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_72_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_73_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_74_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm & (~ and_237_tmp);
  assign COMP_LOOP_tmp_and_58_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm & (~ nor_568_tmp);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_nl = (COMP_LOOP_3_tmp_mul_idiv_sva_2_0==3'b001)
      & (~ nor_568_tmp);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_nl = (COMP_LOOP_3_tmp_mul_idiv_sva_2_0==3'b010)
      & (~ nor_568_tmp);
  assign COMP_LOOP_tmp_and_59_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm & (~ nor_568_tmp);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_18_nl = (COMP_LOOP_3_tmp_mul_idiv_sva_2_0==3'b100)
      & (~ nor_568_tmp);
  assign COMP_LOOP_tmp_and_60_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm & (~ nor_568_tmp);
  assign COMP_LOOP_tmp_and_61_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm & (~ nor_568_tmp);
  assign COMP_LOOP_tmp_and_62_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm & (~ nor_568_tmp);
  assign COMP_LOOP_tmp_and_42_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_43_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_78 & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_44_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_80 & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_45_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_46_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_82 & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_47_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_48_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_49_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_50_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_84 & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_51_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_52_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_53_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_54_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_55_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_56_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_and_57_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm & (~ nor_tmp_180);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_nor_3_nl = ~((COMP_LOOP_5_tmp_mul_idiv_sva[1:0]!=2'b00));
  assign COMP_LOOP_tmp_and_38_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm & (~ and_240_tmp);
  assign COMP_LOOP_tmp_and_39_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm & (~ and_240_tmp);
  assign COMP_LOOP_tmp_and_40_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm & (~ and_240_tmp);
  assign COMP_LOOP_tmp_and_41_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm & (~ and_240_tmp);
  assign COMP_LOOP_tmp_and_23_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_24_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_63_rgt & and_245_m1c;
  assign COMP_LOOP_tmp_and_25_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_26_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_65_rgt & and_245_m1c;
  assign COMP_LOOP_tmp_and_27_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_28_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_29_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_30_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_69_rgt & and_245_m1c;
  assign COMP_LOOP_tmp_and_31_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_32_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_33_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_34_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_35_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_36_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm & and_245_m1c;
  assign COMP_LOOP_tmp_and_37_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm & and_245_m1c;
  assign mux_1007_nl = MUX_s_1_2_2(mux_tmp_984, mux_tmp_982, fsm_output[2]);
  assign mux_1008_nl = MUX_s_1_2_2(mux_1007_nl, and_344_cse, fsm_output[5]);
  assign mux_1002_nl = MUX_s_1_2_2((~ or_1226_cse), nor_tmp_15, fsm_output[7]);
  assign mux_1004_nl = MUX_s_1_2_2(mux_tmp_984, mux_1002_nl, fsm_output[0]);
  assign mux_1005_nl = MUX_s_1_2_2(mux_1004_nl, mux_tmp_982, fsm_output[2]);
  assign mux_1006_nl = MUX_s_1_2_2(mux_1005_nl, and_344_cse, fsm_output[5]);
  assign mux_1009_nl = MUX_s_1_2_2(mux_1008_nl, mux_1006_nl, fsm_output[1]);
  assign COMP_LOOP_tmp_and_7_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_8_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_78 & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_9_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_80 & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_10_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_11_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_82 & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_12_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_13_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_14_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_15_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_84 & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_16_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_17_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_18_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_19_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_20_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_21_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_22_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm & mux_1017_tmp;
  assign COMP_LOOP_tmp_and_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm & and_dcpl_135;
  assign COMP_LOOP_tmp_and_1_nl = (COMP_LOOP_3_tmp_lshift_ncse_sva[2:0]==3'b010)
      & and_dcpl_135;
  assign COMP_LOOP_tmp_and_2_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm & and_dcpl_135;
  assign COMP_LOOP_tmp_and_3_nl = (COMP_LOOP_3_tmp_lshift_ncse_sva[2:0]==3'b100)
      & and_dcpl_135;
  assign COMP_LOOP_tmp_and_4_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm & and_dcpl_135;
  assign COMP_LOOP_tmp_and_5_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm & and_dcpl_135;
  assign COMP_LOOP_tmp_and_6_nl = COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm & and_dcpl_135;
  assign mux_1019_nl = MUX_s_1_2_2(mux_tmp_994, mux_tmp_855, fsm_output[2]);
  assign mux_1020_nl = MUX_s_1_2_2(mux_1019_nl, nor_tmp_57, fsm_output[5]);
  assign mux_1018_nl = MUX_s_1_2_2(mux_tmp_855, nor_tmp_57, fsm_output[5]);
  assign mux_1021_nl = MUX_s_1_2_2(mux_1020_nl, mux_1018_nl, fsm_output[1]);
  assign COMP_LOOP_tmp_nor_59_cse = ~(and_dcpl_258 | and_dcpl_273 | and_dcpl_274);
  assign COMP_LOOP_tmp_mux_11_nl = MUX_s_1_2_2((z_out_1[9]), (COMP_LOOP_2_tmp_lshift_ncse_sva[9]),
      COMP_LOOP_tmp_or_28_ssc);
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_and_86_nl = COMP_LOOP_tmp_mux_11_nl & COMP_LOOP_tmp_nor_59_cse;
  assign COMP_LOOP_tmp_or_50_nl = and_dcpl_261 | and_dcpl_273;
  assign COMP_LOOP_tmp_mux1h_62_nl = MUX1HOT_v_9_4_2(({1'b0 , (z_out[7:0])}), (z_out_1[8:0]),
      (COMP_LOOP_2_tmp_lshift_ncse_sva[8:0]), COMP_LOOP_3_tmp_lshift_ncse_sva, {and_dcpl_258
      , COMP_LOOP_tmp_or_50_nl , COMP_LOOP_tmp_or_28_ssc , and_dcpl_274});
  assign COMP_LOOP_tmp_and_80_nl = (COMP_LOOP_k_10_3_sva_6_0[6]) & COMP_LOOP_tmp_nor_59_cse;
  assign COMP_LOOP_tmp_or_51_nl = and_dcpl_261 | and_dcpl_264 | and_dcpl_267 | and_dcpl_272;
  assign COMP_LOOP_tmp_mux1h_63_nl = MUX1HOT_v_6_3_2(({1'b0 , (COMP_LOOP_k_10_3_sva_6_0[6:2])}),
      (COMP_LOOP_k_10_3_sva_6_0[5:0]), (COMP_LOOP_k_10_3_sva_6_0[6:1]), {and_dcpl_258
      , COMP_LOOP_tmp_or_51_nl , COMP_LOOP_tmp_or_45_itm});
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_mux_9_nl = MUX_s_1_2_2((COMP_LOOP_k_10_3_sva_6_0[1]),
      (COMP_LOOP_k_10_3_sva_6_0[0]), COMP_LOOP_tmp_or_45_itm);
  assign COMP_LOOP_tmp_or_52_nl = (COMP_LOOP_tmp_COMP_LOOP_tmp_mux_9_nl & (~(and_dcpl_261
      | and_dcpl_264))) | and_dcpl_267 | and_dcpl_272;
  assign COMP_LOOP_tmp_COMP_LOOP_tmp_or_1_nl = ((COMP_LOOP_k_10_3_sva_6_0[0]) & (~(and_dcpl_261
      | and_dcpl_267 | and_dcpl_273))) | and_dcpl_264 | and_dcpl_272 | and_dcpl_274;
  assign nl_z_out_2 = ({COMP_LOOP_tmp_COMP_LOOP_tmp_and_86_nl , COMP_LOOP_tmp_mux1h_62_nl})
      * ({COMP_LOOP_tmp_and_80_nl , COMP_LOOP_tmp_mux1h_63_nl , COMP_LOOP_tmp_or_52_nl
      , COMP_LOOP_tmp_COMP_LOOP_tmp_or_1_nl , 1'b1});
  assign z_out_2 = nl_z_out_2[9:0];
  assign and_626_nl = and_dcpl_257 & (fsm_output[2:1]==2'b01) & nor_625_cse;
  assign COMP_LOOP_tmp_mux1h_64_nl = MUX1HOT_v_64_9_2(({57'b000000000000000000000000000000000000000000000000000000000
      , (z_out_1[6:0])}), COMP_LOOP_tmp_mux_itm, COMP_LOOP_tmp_mux1h_itm, COMP_LOOP_tmp_mux1h_1_itm,
      COMP_LOOP_tmp_mux1h_2_itm, COMP_LOOP_tmp_mux1h_3_itm, COMP_LOOP_tmp_mux1h_4_itm,
      COMP_LOOP_tmp_mux1h_5_itm, tmp_21_sva_1, {and_626_nl , and_dcpl_286 , and_dcpl_292
      , and_dcpl_295 , and_dcpl_298 , and_dcpl_301 , and_dcpl_304 , and_dcpl_307
      , and_dcpl_309});
  assign COMP_LOOP_tmp_or_53_nl = and_dcpl_286 | and_dcpl_292 | and_dcpl_295 | and_dcpl_298
      | and_dcpl_301 | and_dcpl_304 | and_dcpl_307 | and_dcpl_309;
  assign COMP_LOOP_tmp_mux_12_nl = MUX_v_64_2_2(({57'b000000000000000000000000000000000000000000000000000000000
      , COMP_LOOP_k_10_3_sva_6_0}), COMP_LOOP_1_modulo_dev_cmp_return_rsc_z, COMP_LOOP_tmp_or_53_nl);
  assign nl_z_out_3 = COMP_LOOP_tmp_mux1h_64_nl * COMP_LOOP_tmp_mux_12_nl;
  assign z_out_3 = nl_z_out_3[63:0];
  assign and_627_nl = (~ (fsm_output[3])) & (fsm_output[6]) & and_dcpl_255 & (~ (fsm_output[1]))
      & (fsm_output[2]) & (fsm_output[7]) & (fsm_output[5]);
  assign COMP_LOOP_mux_206_nl = MUX_v_7_2_2(COMP_LOOP_k_10_3_sva_6_0, ({3'b001 ,
      (~ z_out_6)}), and_627_nl);
  assign nl_z_out_4 = conv_u2u_7_8(COMP_LOOP_mux_206_nl) + 8'b00000001;
  assign z_out_4 = nl_z_out_4[7:0];
  assign COMP_LOOP_mux_207_nl = MUX_v_11_2_2(({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1]))}),
      STAGE_LOOP_lshift_psp_sva, and_dcpl_335);
  assign COMP_LOOP_COMP_LOOP_nand_1_nl = ~(and_dcpl_335 & (~(and_dcpl_31 & and_dcpl_255
      & and_dcpl_324 & nor_625_cse)));
  assign COMP_LOOP_mux_208_nl = MUX_v_10_2_2(({COMP_LOOP_k_10_3_sva_6_0 , 3'b001}),
      VEC_LOOP_j_10_0_sva_9_0, and_dcpl_335);
  assign nl_acc_1_nl = ({COMP_LOOP_mux_207_nl , COMP_LOOP_COMP_LOOP_nand_1_nl}) +
      conv_u2u_11_12({COMP_LOOP_mux_208_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[11:0];
  assign z_out_5 = readslicef_12_11_1(acc_1_nl);
  assign STAGE_LOOP_mux_4_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (~ STAGE_LOOP_i_3_0_sva),
      and_dcpl_348);
  assign nl_z_out_6 = STAGE_LOOP_mux_4_nl + ({1'b1 , (~ and_dcpl_348) , 2'b11});
  assign z_out_6 = nl_z_out_6[3:0];
  assign COMP_LOOP_mux_209_cse = MUX_v_64_2_2(z_out_9, COMP_LOOP_1_acc_8_itm, COMP_LOOP_or_17_itm);
  assign COMP_LOOP_mux1h_367_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_nor_itm, COMP_LOOP_COMP_LOOP_nor_5_itm,
      COMP_LOOP_COMP_LOOP_nor_9_itm, COMP_LOOP_COMP_LOOP_nor_13_itm, COMP_LOOP_COMP_LOOP_nor_17_itm,
      COMP_LOOP_COMP_LOOP_nor_21_itm, COMP_LOOP_COMP_LOOP_nor_25_itm, COMP_LOOP_COMP_LOOP_nor_29_itm,
      {and_dcpl_421 , and_dcpl_425 , and_541_cse , and_545_cse , and_548_cse , and_552_cse
      , and_556_cse , and_558_cse});
  assign COMP_LOOP_COMP_LOOP_and_450_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[0]) &
      COMP_LOOP_nor_51_itm;
  assign COMP_LOOP_COMP_LOOP_and_451_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[0]) &
      COMP_LOOP_nor_91_itm;
  assign COMP_LOOP_COMP_LOOP_and_452_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[0]) &
      COMP_LOOP_nor_131_itm;
  assign COMP_LOOP_COMP_LOOP_and_453_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[0]) &
      COMP_LOOP_nor_171_itm;
  assign COMP_LOOP_COMP_LOOP_and_454_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[0]) &
      COMP_LOOP_nor_211_itm;
  assign COMP_LOOP_COMP_LOOP_and_455_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[0]) &
      COMP_LOOP_nor_251_itm;
  assign COMP_LOOP_COMP_LOOP_and_456_nl = (COMP_LOOP_acc_10_cse_10_1_sva[0]) & COMP_LOOP_nor_291_itm;
  assign COMP_LOOP_mux1h_368_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_305_itm,
      COMP_LOOP_COMP_LOOP_and_450_nl, COMP_LOOP_COMP_LOOP_and_451_nl, COMP_LOOP_COMP_LOOP_and_452_nl,
      COMP_LOOP_COMP_LOOP_and_453_nl, COMP_LOOP_COMP_LOOP_and_454_nl, COMP_LOOP_COMP_LOOP_and_455_nl,
      COMP_LOOP_COMP_LOOP_and_456_nl, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_COMP_LOOP_and_457_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[1]) &
      COMP_LOOP_nor_52_itm;
  assign COMP_LOOP_COMP_LOOP_and_458_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[1]) &
      COMP_LOOP_nor_92_itm;
  assign COMP_LOOP_COMP_LOOP_and_459_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[1]) &
      COMP_LOOP_nor_132_itm;
  assign COMP_LOOP_COMP_LOOP_and_460_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[1]) &
      COMP_LOOP_nor_172_itm;
  assign COMP_LOOP_COMP_LOOP_and_461_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[1]) &
      COMP_LOOP_nor_212_itm;
  assign COMP_LOOP_COMP_LOOP_and_462_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[1]) &
      COMP_LOOP_nor_252_itm;
  assign COMP_LOOP_COMP_LOOP_and_463_nl = (COMP_LOOP_acc_10_cse_10_1_sva[1]) & COMP_LOOP_nor_292_itm;
  assign COMP_LOOP_mux1h_369_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_62_itm,
      COMP_LOOP_COMP_LOOP_and_457_nl, COMP_LOOP_COMP_LOOP_and_458_nl, COMP_LOOP_COMP_LOOP_and_459_nl,
      COMP_LOOP_COMP_LOOP_and_460_nl, COMP_LOOP_COMP_LOOP_and_461_nl, COMP_LOOP_COMP_LOOP_and_462_nl,
      COMP_LOOP_COMP_LOOP_and_463_nl, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_370_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_185_itm,
      COMP_LOOP_COMP_LOOP_and_77_itm, COMP_LOOP_COMP_LOOP_and_137_itm, COMP_LOOP_COMP_LOOP_and_197_itm,
      COMP_LOOP_COMP_LOOP_and_257_itm, COMP_LOOP_COMP_LOOP_and_317_itm, COMP_LOOP_COMP_LOOP_and_377_itm,
      COMP_LOOP_COMP_LOOP_and_437_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_COMP_LOOP_and_464_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[2]) &
      COMP_LOOP_nor_54_itm;
  assign COMP_LOOP_COMP_LOOP_and_465_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[2]) &
      COMP_LOOP_nor_94_itm;
  assign COMP_LOOP_COMP_LOOP_and_466_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[2]) &
      COMP_LOOP_nor_134_itm;
  assign COMP_LOOP_COMP_LOOP_and_467_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[2]) &
      COMP_LOOP_nor_174_itm;
  assign COMP_LOOP_COMP_LOOP_and_468_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[2]) &
      COMP_LOOP_nor_214_itm;
  assign COMP_LOOP_COMP_LOOP_and_469_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[2]) &
      COMP_LOOP_nor_254_itm;
  assign COMP_LOOP_COMP_LOOP_and_470_nl = (COMP_LOOP_acc_10_cse_10_1_sva[2]) & COMP_LOOP_nor_294_itm;
  assign COMP_LOOP_mux1h_371_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_64_itm,
      COMP_LOOP_COMP_LOOP_and_464_nl, COMP_LOOP_COMP_LOOP_and_465_nl, COMP_LOOP_COMP_LOOP_and_466_nl,
      COMP_LOOP_COMP_LOOP_and_467_nl, COMP_LOOP_COMP_LOOP_and_468_nl, COMP_LOOP_COMP_LOOP_and_469_nl,
      COMP_LOOP_COMP_LOOP_and_470_nl, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_372_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_65_itm,
      COMP_LOOP_COMP_LOOP_and_79_itm, COMP_LOOP_COMP_LOOP_and_139_itm, COMP_LOOP_COMP_LOOP_and_199_itm,
      COMP_LOOP_COMP_LOOP_and_259_itm, COMP_LOOP_COMP_LOOP_and_319_itm, COMP_LOOP_COMP_LOOP_and_379_itm,
      COMP_LOOP_COMP_LOOP_and_439_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_373_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_66_itm,
      COMP_LOOP_COMP_LOOP_and_80_itm, COMP_LOOP_COMP_LOOP_and_140_itm, COMP_LOOP_COMP_LOOP_and_200_itm,
      COMP_LOOP_COMP_LOOP_and_260_itm, COMP_LOOP_COMP_LOOP_and_320_itm, COMP_LOOP_COMP_LOOP_and_380_itm,
      COMP_LOOP_COMP_LOOP_and_440_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_374_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_6_itm,
      COMP_LOOP_COMP_LOOP_and_81_itm, COMP_LOOP_COMP_LOOP_and_141_itm, COMP_LOOP_COMP_LOOP_and_201_itm,
      COMP_LOOP_COMP_LOOP_and_261_itm, COMP_LOOP_COMP_LOOP_and_321_itm, COMP_LOOP_COMP_LOOP_and_381_itm,
      COMP_LOOP_COMP_LOOP_and_441_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_COMP_LOOP_and_471_nl = (COMP_LOOP_acc_10_cse_10_1_2_sva[3]) &
      COMP_LOOP_nor_57_itm;
  assign COMP_LOOP_COMP_LOOP_and_472_nl = (COMP_LOOP_acc_10_cse_10_1_3_sva[3]) &
      COMP_LOOP_nor_97_itm;
  assign COMP_LOOP_COMP_LOOP_and_473_nl = (COMP_LOOP_acc_10_cse_10_1_4_sva[3]) &
      COMP_LOOP_nor_137_itm;
  assign COMP_LOOP_COMP_LOOP_and_474_nl = (COMP_LOOP_acc_10_cse_10_1_5_sva[3]) &
      COMP_LOOP_nor_177_itm;
  assign COMP_LOOP_COMP_LOOP_and_475_nl = (COMP_LOOP_acc_10_cse_10_1_6_sva[3]) &
      COMP_LOOP_nor_217_itm;
  assign COMP_LOOP_COMP_LOOP_and_476_nl = (COMP_LOOP_acc_10_cse_10_1_7_sva[3]) &
      COMP_LOOP_nor_257_itm;
  assign COMP_LOOP_COMP_LOOP_and_477_nl = (COMP_LOOP_acc_10_cse_10_1_sva[3]) & COMP_LOOP_nor_297_itm;
  assign COMP_LOOP_mux1h_375_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_68_itm,
      COMP_LOOP_COMP_LOOP_and_471_nl, COMP_LOOP_COMP_LOOP_and_472_nl, COMP_LOOP_COMP_LOOP_and_473_nl,
      COMP_LOOP_COMP_LOOP_and_474_nl, COMP_LOOP_COMP_LOOP_and_475_nl, COMP_LOOP_COMP_LOOP_and_476_nl,
      COMP_LOOP_COMP_LOOP_and_477_nl, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_376_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_69_itm,
      COMP_LOOP_COMP_LOOP_and_83_itm, COMP_LOOP_COMP_LOOP_and_143_itm, COMP_LOOP_COMP_LOOP_and_203_itm,
      COMP_LOOP_COMP_LOOP_and_263_itm, COMP_LOOP_COMP_LOOP_and_323_itm, COMP_LOOP_COMP_LOOP_and_383_itm,
      COMP_LOOP_COMP_LOOP_and_443_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_377_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_70_itm,
      COMP_LOOP_COMP_LOOP_and_84_itm, COMP_LOOP_COMP_LOOP_and_144_itm, COMP_LOOP_COMP_LOOP_and_204_itm,
      COMP_LOOP_COMP_LOOP_and_264_itm, COMP_LOOP_COMP_LOOP_and_324_itm, COMP_LOOP_COMP_LOOP_and_384_itm,
      COMP_LOOP_COMP_LOOP_and_444_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_378_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_10_itm,
      COMP_LOOP_COMP_LOOP_and_85_itm, COMP_LOOP_COMP_LOOP_and_145_itm, COMP_LOOP_COMP_LOOP_and_205_itm,
      COMP_LOOP_COMP_LOOP_and_265_itm, COMP_LOOP_COMP_LOOP_and_325_itm, COMP_LOOP_COMP_LOOP_and_385_itm,
      COMP_LOOP_COMP_LOOP_and_445_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_379_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_72_itm,
      COMP_LOOP_COMP_LOOP_and_86_itm, COMP_LOOP_COMP_LOOP_and_146_itm, COMP_LOOP_COMP_LOOP_and_206_itm,
      COMP_LOOP_COMP_LOOP_and_266_itm, COMP_LOOP_COMP_LOOP_and_326_itm, COMP_LOOP_COMP_LOOP_and_386_itm,
      COMP_LOOP_COMP_LOOP_and_446_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_380_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_12_itm,
      COMP_LOOP_COMP_LOOP_and_87_itm, COMP_LOOP_COMP_LOOP_and_147_itm, COMP_LOOP_COMP_LOOP_and_207_itm,
      COMP_LOOP_COMP_LOOP_and_267_itm, COMP_LOOP_COMP_LOOP_and_327_itm, COMP_LOOP_COMP_LOOP_and_387_itm,
      COMP_LOOP_COMP_LOOP_and_447_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_381_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_13_itm,
      COMP_LOOP_COMP_LOOP_and_88_itm, COMP_LOOP_COMP_LOOP_and_148_itm, COMP_LOOP_COMP_LOOP_and_208_itm,
      COMP_LOOP_COMP_LOOP_and_268_itm, COMP_LOOP_COMP_LOOP_and_328_itm, COMP_LOOP_COMP_LOOP_and_388_itm,
      COMP_LOOP_COMP_LOOP_and_448_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign COMP_LOOP_mux1h_382_nl = MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_14_itm,
      COMP_LOOP_COMP_LOOP_and_89_itm, COMP_LOOP_COMP_LOOP_and_149_itm, COMP_LOOP_COMP_LOOP_and_209_itm,
      COMP_LOOP_COMP_LOOP_and_269_itm, COMP_LOOP_COMP_LOOP_and_329_itm, COMP_LOOP_COMP_LOOP_and_389_itm,
      COMP_LOOP_COMP_LOOP_and_449_itm, {and_dcpl_421 , and_dcpl_425 , and_541_cse
      , and_545_cse , and_548_cse , and_552_cse , and_556_cse , and_558_cse});
  assign z_out_9 = MUX1HOT_v_64_16_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, vec_rsc_0_2_i_q_d,
      vec_rsc_0_3_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_5_i_q_d, vec_rsc_0_6_i_q_d,
      vec_rsc_0_7_i_q_d, vec_rsc_0_8_i_q_d, vec_rsc_0_9_i_q_d, vec_rsc_0_10_i_q_d,
      vec_rsc_0_11_i_q_d, vec_rsc_0_12_i_q_d, vec_rsc_0_13_i_q_d, vec_rsc_0_14_i_q_d,
      vec_rsc_0_15_i_q_d, {COMP_LOOP_mux1h_367_nl , COMP_LOOP_mux1h_368_nl , COMP_LOOP_mux1h_369_nl
      , COMP_LOOP_mux1h_370_nl , COMP_LOOP_mux1h_371_nl , COMP_LOOP_mux1h_372_nl
      , COMP_LOOP_mux1h_373_nl , COMP_LOOP_mux1h_374_nl , COMP_LOOP_mux1h_375_nl
      , COMP_LOOP_mux1h_376_nl , COMP_LOOP_mux1h_377_nl , COMP_LOOP_mux1h_378_nl
      , COMP_LOOP_mux1h_379_nl , COMP_LOOP_mux1h_380_nl , COMP_LOOP_mux1h_381_nl
      , COMP_LOOP_mux1h_382_nl});

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


  function automatic [0:0] MUX1HOT_s_1_5_2;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [4:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    MUX1HOT_s_1_5_2 = result;
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


  function automatic [63:0] MUX1HOT_v_64_16_2;
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
    input [15:0] sel;
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
    MUX1HOT_v_64_16_2 = result;
  end
  endfunction


  function automatic [63:0] MUX1HOT_v_64_17_2;
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
    input [16:0] sel;
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
    MUX1HOT_v_64_17_2 = result;
  end
  endfunction


  function automatic [63:0] MUX1HOT_v_64_19_2;
    input [63:0] input_18;
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
    input [18:0] sel;
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
    result = result | ( input_18 & {64{sel[18]}});
    MUX1HOT_v_64_19_2 = result;
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


  function automatic [5:0] MUX1HOT_v_6_16_2;
    input [5:0] input_15;
    input [5:0] input_14;
    input [5:0] input_13;
    input [5:0] input_12;
    input [5:0] input_11;
    input [5:0] input_10;
    input [5:0] input_9;
    input [5:0] input_8;
    input [5:0] input_7;
    input [5:0] input_6;
    input [5:0] input_5;
    input [5:0] input_4;
    input [5:0] input_3;
    input [5:0] input_2;
    input [5:0] input_1;
    input [5:0] input_0;
    input [15:0] sel;
    reg [5:0] result;
  begin
    result = input_0 & {6{sel[0]}};
    result = result | ( input_1 & {6{sel[1]}});
    result = result | ( input_2 & {6{sel[2]}});
    result = result | ( input_3 & {6{sel[3]}});
    result = result | ( input_4 & {6{sel[4]}});
    result = result | ( input_5 & {6{sel[5]}});
    result = result | ( input_6 & {6{sel[6]}});
    result = result | ( input_7 & {6{sel[7]}});
    result = result | ( input_8 & {6{sel[8]}});
    result = result | ( input_9 & {6{sel[9]}});
    result = result | ( input_10 & {6{sel[10]}});
    result = result | ( input_11 & {6{sel[11]}});
    result = result | ( input_12 & {6{sel[12]}});
    result = result | ( input_13 & {6{sel[13]}});
    result = result | ( input_14 & {6{sel[14]}});
    result = result | ( input_15 & {6{sel[15]}});
    MUX1HOT_v_6_16_2 = result;
  end
  endfunction


  function automatic [5:0] MUX1HOT_v_6_3_2;
    input [5:0] input_2;
    input [5:0] input_1;
    input [5:0] input_0;
    input [2:0] sel;
    reg [5:0] result;
  begin
    result = input_0 & {6{sel[0]}};
    result = result | ( input_1 & {6{sel[1]}});
    result = result | ( input_2 & {6{sel[2]}});
    MUX1HOT_v_6_3_2 = result;
  end
  endfunction


  function automatic [5:0] MUX1HOT_v_6_6_2;
    input [5:0] input_5;
    input [5:0] input_4;
    input [5:0] input_3;
    input [5:0] input_2;
    input [5:0] input_1;
    input [5:0] input_0;
    input [5:0] sel;
    reg [5:0] result;
  begin
    result = input_0 & {6{sel[0]}};
    result = result | ( input_1 & {6{sel[1]}});
    result = result | ( input_2 & {6{sel[2]}});
    result = result | ( input_3 & {6{sel[3]}});
    result = result | ( input_4 & {6{sel[4]}});
    result = result | ( input_5 & {6{sel[5]}});
    MUX1HOT_v_6_6_2 = result;
  end
  endfunction


  function automatic [5:0] MUX1HOT_v_6_7_2;
    input [5:0] input_6;
    input [5:0] input_5;
    input [5:0] input_4;
    input [5:0] input_3;
    input [5:0] input_2;
    input [5:0] input_1;
    input [5:0] input_0;
    input [6:0] sel;
    reg [5:0] result;
  begin
    result = input_0 & {6{sel[0]}};
    result = result | ( input_1 & {6{sel[1]}});
    result = result | ( input_2 & {6{sel[2]}});
    result = result | ( input_3 & {6{sel[3]}});
    result = result | ( input_4 & {6{sel[4]}});
    result = result | ( input_5 & {6{sel[5]}});
    result = result | ( input_6 & {6{sel[6]}});
    MUX1HOT_v_6_7_2 = result;
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
      vec_rsc_0_7_radr, vec_rsc_0_7_q, vec_rsc_triosy_0_7_lz, vec_rsc_0_8_wadr, vec_rsc_0_8_d,
      vec_rsc_0_8_we, vec_rsc_0_8_radr, vec_rsc_0_8_q, vec_rsc_triosy_0_8_lz, vec_rsc_0_9_wadr,
      vec_rsc_0_9_d, vec_rsc_0_9_we, vec_rsc_0_9_radr, vec_rsc_0_9_q, vec_rsc_triosy_0_9_lz,
      vec_rsc_0_10_wadr, vec_rsc_0_10_d, vec_rsc_0_10_we, vec_rsc_0_10_radr, vec_rsc_0_10_q,
      vec_rsc_triosy_0_10_lz, vec_rsc_0_11_wadr, vec_rsc_0_11_d, vec_rsc_0_11_we,
      vec_rsc_0_11_radr, vec_rsc_0_11_q, vec_rsc_triosy_0_11_lz, vec_rsc_0_12_wadr,
      vec_rsc_0_12_d, vec_rsc_0_12_we, vec_rsc_0_12_radr, vec_rsc_0_12_q, vec_rsc_triosy_0_12_lz,
      vec_rsc_0_13_wadr, vec_rsc_0_13_d, vec_rsc_0_13_we, vec_rsc_0_13_radr, vec_rsc_0_13_q,
      vec_rsc_triosy_0_13_lz, vec_rsc_0_14_wadr, vec_rsc_0_14_d, vec_rsc_0_14_we,
      vec_rsc_0_14_radr, vec_rsc_0_14_q, vec_rsc_triosy_0_14_lz, vec_rsc_0_15_wadr,
      vec_rsc_0_15_d, vec_rsc_0_15_we, vec_rsc_0_15_radr, vec_rsc_0_15_q, vec_rsc_triosy_0_15_lz,
      p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_0_0_radr,
      twiddle_rsc_0_0_q, twiddle_rsc_triosy_0_0_lz, twiddle_rsc_0_1_radr, twiddle_rsc_0_1_q,
      twiddle_rsc_triosy_0_1_lz, twiddle_rsc_0_2_radr, twiddle_rsc_0_2_q, twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_0_3_radr, twiddle_rsc_0_3_q, twiddle_rsc_triosy_0_3_lz, twiddle_rsc_0_4_radr,
      twiddle_rsc_0_4_q, twiddle_rsc_triosy_0_4_lz, twiddle_rsc_0_5_radr, twiddle_rsc_0_5_q,
      twiddle_rsc_triosy_0_5_lz, twiddle_rsc_0_6_radr, twiddle_rsc_0_6_q, twiddle_rsc_triosy_0_6_lz,
      twiddle_rsc_0_7_radr, twiddle_rsc_0_7_q, twiddle_rsc_triosy_0_7_lz, twiddle_rsc_0_8_radr,
      twiddle_rsc_0_8_q, twiddle_rsc_triosy_0_8_lz, twiddle_rsc_0_9_radr, twiddle_rsc_0_9_q,
      twiddle_rsc_triosy_0_9_lz, twiddle_rsc_0_10_radr, twiddle_rsc_0_10_q, twiddle_rsc_triosy_0_10_lz,
      twiddle_rsc_0_11_radr, twiddle_rsc_0_11_q, twiddle_rsc_triosy_0_11_lz, twiddle_rsc_0_12_radr,
      twiddle_rsc_0_12_q, twiddle_rsc_triosy_0_12_lz, twiddle_rsc_0_13_radr, twiddle_rsc_0_13_q,
      twiddle_rsc_triosy_0_13_lz, twiddle_rsc_0_14_radr, twiddle_rsc_0_14_q, twiddle_rsc_triosy_0_14_lz,
      twiddle_rsc_0_15_radr, twiddle_rsc_0_15_q, twiddle_rsc_triosy_0_15_lz
);
  input clk;
  input rst;
  output [5:0] vec_rsc_0_0_wadr;
  output [63:0] vec_rsc_0_0_d;
  output vec_rsc_0_0_we;
  output [5:0] vec_rsc_0_0_radr;
  input [63:0] vec_rsc_0_0_q;
  output vec_rsc_triosy_0_0_lz;
  output [5:0] vec_rsc_0_1_wadr;
  output [63:0] vec_rsc_0_1_d;
  output vec_rsc_0_1_we;
  output [5:0] vec_rsc_0_1_radr;
  input [63:0] vec_rsc_0_1_q;
  output vec_rsc_triosy_0_1_lz;
  output [5:0] vec_rsc_0_2_wadr;
  output [63:0] vec_rsc_0_2_d;
  output vec_rsc_0_2_we;
  output [5:0] vec_rsc_0_2_radr;
  input [63:0] vec_rsc_0_2_q;
  output vec_rsc_triosy_0_2_lz;
  output [5:0] vec_rsc_0_3_wadr;
  output [63:0] vec_rsc_0_3_d;
  output vec_rsc_0_3_we;
  output [5:0] vec_rsc_0_3_radr;
  input [63:0] vec_rsc_0_3_q;
  output vec_rsc_triosy_0_3_lz;
  output [5:0] vec_rsc_0_4_wadr;
  output [63:0] vec_rsc_0_4_d;
  output vec_rsc_0_4_we;
  output [5:0] vec_rsc_0_4_radr;
  input [63:0] vec_rsc_0_4_q;
  output vec_rsc_triosy_0_4_lz;
  output [5:0] vec_rsc_0_5_wadr;
  output [63:0] vec_rsc_0_5_d;
  output vec_rsc_0_5_we;
  output [5:0] vec_rsc_0_5_radr;
  input [63:0] vec_rsc_0_5_q;
  output vec_rsc_triosy_0_5_lz;
  output [5:0] vec_rsc_0_6_wadr;
  output [63:0] vec_rsc_0_6_d;
  output vec_rsc_0_6_we;
  output [5:0] vec_rsc_0_6_radr;
  input [63:0] vec_rsc_0_6_q;
  output vec_rsc_triosy_0_6_lz;
  output [5:0] vec_rsc_0_7_wadr;
  output [63:0] vec_rsc_0_7_d;
  output vec_rsc_0_7_we;
  output [5:0] vec_rsc_0_7_radr;
  input [63:0] vec_rsc_0_7_q;
  output vec_rsc_triosy_0_7_lz;
  output [5:0] vec_rsc_0_8_wadr;
  output [63:0] vec_rsc_0_8_d;
  output vec_rsc_0_8_we;
  output [5:0] vec_rsc_0_8_radr;
  input [63:0] vec_rsc_0_8_q;
  output vec_rsc_triosy_0_8_lz;
  output [5:0] vec_rsc_0_9_wadr;
  output [63:0] vec_rsc_0_9_d;
  output vec_rsc_0_9_we;
  output [5:0] vec_rsc_0_9_radr;
  input [63:0] vec_rsc_0_9_q;
  output vec_rsc_triosy_0_9_lz;
  output [5:0] vec_rsc_0_10_wadr;
  output [63:0] vec_rsc_0_10_d;
  output vec_rsc_0_10_we;
  output [5:0] vec_rsc_0_10_radr;
  input [63:0] vec_rsc_0_10_q;
  output vec_rsc_triosy_0_10_lz;
  output [5:0] vec_rsc_0_11_wadr;
  output [63:0] vec_rsc_0_11_d;
  output vec_rsc_0_11_we;
  output [5:0] vec_rsc_0_11_radr;
  input [63:0] vec_rsc_0_11_q;
  output vec_rsc_triosy_0_11_lz;
  output [5:0] vec_rsc_0_12_wadr;
  output [63:0] vec_rsc_0_12_d;
  output vec_rsc_0_12_we;
  output [5:0] vec_rsc_0_12_radr;
  input [63:0] vec_rsc_0_12_q;
  output vec_rsc_triosy_0_12_lz;
  output [5:0] vec_rsc_0_13_wadr;
  output [63:0] vec_rsc_0_13_d;
  output vec_rsc_0_13_we;
  output [5:0] vec_rsc_0_13_radr;
  input [63:0] vec_rsc_0_13_q;
  output vec_rsc_triosy_0_13_lz;
  output [5:0] vec_rsc_0_14_wadr;
  output [63:0] vec_rsc_0_14_d;
  output vec_rsc_0_14_we;
  output [5:0] vec_rsc_0_14_radr;
  input [63:0] vec_rsc_0_14_q;
  output vec_rsc_triosy_0_14_lz;
  output [5:0] vec_rsc_0_15_wadr;
  output [63:0] vec_rsc_0_15_d;
  output vec_rsc_0_15_we;
  output [5:0] vec_rsc_0_15_radr;
  input [63:0] vec_rsc_0_15_q;
  output vec_rsc_triosy_0_15_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [5:0] twiddle_rsc_0_0_radr;
  input [63:0] twiddle_rsc_0_0_q;
  output twiddle_rsc_triosy_0_0_lz;
  output [5:0] twiddle_rsc_0_1_radr;
  input [63:0] twiddle_rsc_0_1_q;
  output twiddle_rsc_triosy_0_1_lz;
  output [5:0] twiddle_rsc_0_2_radr;
  input [63:0] twiddle_rsc_0_2_q;
  output twiddle_rsc_triosy_0_2_lz;
  output [5:0] twiddle_rsc_0_3_radr;
  input [63:0] twiddle_rsc_0_3_q;
  output twiddle_rsc_triosy_0_3_lz;
  output [5:0] twiddle_rsc_0_4_radr;
  input [63:0] twiddle_rsc_0_4_q;
  output twiddle_rsc_triosy_0_4_lz;
  output [5:0] twiddle_rsc_0_5_radr;
  input [63:0] twiddle_rsc_0_5_q;
  output twiddle_rsc_triosy_0_5_lz;
  output [5:0] twiddle_rsc_0_6_radr;
  input [63:0] twiddle_rsc_0_6_q;
  output twiddle_rsc_triosy_0_6_lz;
  output [5:0] twiddle_rsc_0_7_radr;
  input [63:0] twiddle_rsc_0_7_q;
  output twiddle_rsc_triosy_0_7_lz;
  output [5:0] twiddle_rsc_0_8_radr;
  input [63:0] twiddle_rsc_0_8_q;
  output twiddle_rsc_triosy_0_8_lz;
  output [5:0] twiddle_rsc_0_9_radr;
  input [63:0] twiddle_rsc_0_9_q;
  output twiddle_rsc_triosy_0_9_lz;
  output [5:0] twiddle_rsc_0_10_radr;
  input [63:0] twiddle_rsc_0_10_q;
  output twiddle_rsc_triosy_0_10_lz;
  output [5:0] twiddle_rsc_0_11_radr;
  input [63:0] twiddle_rsc_0_11_q;
  output twiddle_rsc_triosy_0_11_lz;
  output [5:0] twiddle_rsc_0_12_radr;
  input [63:0] twiddle_rsc_0_12_q;
  output twiddle_rsc_triosy_0_12_lz;
  output [5:0] twiddle_rsc_0_13_radr;
  input [63:0] twiddle_rsc_0_13_q;
  output twiddle_rsc_triosy_0_13_lz;
  output [5:0] twiddle_rsc_0_14_radr;
  input [63:0] twiddle_rsc_0_14_q;
  output twiddle_rsc_triosy_0_14_lz;
  output [5:0] twiddle_rsc_0_15_radr;
  input [63:0] twiddle_rsc_0_15_q;
  output twiddle_rsc_triosy_0_15_lz;


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
  wire [63:0] vec_rsc_0_8_i_q_d;
  wire vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_9_i_q_d;
  wire vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_10_i_q_d;
  wire vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_11_i_q_d;
  wire vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_12_i_q_d;
  wire vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_13_i_q_d;
  wire vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_14_i_q_d;
  wire vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_15_i_q_d;
  wire vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_0_i_q_d;
  wire twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_1_i_q_d;
  wire twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_2_i_q_d;
  wire twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_3_i_q_d;
  wire twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_4_i_q_d;
  wire twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_5_i_q_d;
  wire twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_6_i_q_d;
  wire twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_7_i_q_d;
  wire twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_8_i_q_d;
  wire twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_9_i_q_d;
  wire twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_10_i_q_d;
  wire twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_11_i_q_d;
  wire twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_12_i_q_d;
  wire twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_13_i_q_d;
  wire twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_14_i_q_d;
  wire twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_15_i_q_d;
  wire twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] vec_rsc_0_0_i_d_d_iff;
  wire [5:0] vec_rsc_0_0_i_radr_d_iff;
  wire [5:0] vec_rsc_0_0_i_wadr_d_iff;
  wire vec_rsc_0_0_i_we_d_iff;
  wire vec_rsc_0_1_i_we_d_iff;
  wire vec_rsc_0_2_i_we_d_iff;
  wire vec_rsc_0_3_i_we_d_iff;
  wire vec_rsc_0_4_i_we_d_iff;
  wire vec_rsc_0_5_i_we_d_iff;
  wire vec_rsc_0_6_i_we_d_iff;
  wire vec_rsc_0_7_i_we_d_iff;
  wire vec_rsc_0_8_i_we_d_iff;
  wire vec_rsc_0_9_i_we_d_iff;
  wire vec_rsc_0_10_i_we_d_iff;
  wire vec_rsc_0_11_i_we_d_iff;
  wire vec_rsc_0_12_i_we_d_iff;
  wire vec_rsc_0_13_i_we_d_iff;
  wire vec_rsc_0_14_i_we_d_iff;
  wire vec_rsc_0_15_i_we_d_iff;
  wire [5:0] twiddle_rsc_0_0_i_radr_d_iff;
  wire [5:0] twiddle_rsc_0_1_i_radr_d_iff;
  wire [5:0] twiddle_rsc_0_2_i_radr_d_iff;
  wire [5:0] twiddle_rsc_0_4_i_radr_d_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen vec_rsc_0_0_i
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
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen vec_rsc_0_1_i
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
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen vec_rsc_0_2_i
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
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen vec_rsc_0_3_i
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
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen vec_rsc_0_4_i
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
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen vec_rsc_0_5_i
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
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen vec_rsc_0_6_i
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
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen vec_rsc_0_7_i
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
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen vec_rsc_0_8_i
      (
      .q(vec_rsc_0_8_q),
      .radr(vec_rsc_0_8_radr),
      .we(vec_rsc_0_8_we),
      .d(vec_rsc_0_8_d),
      .wadr(vec_rsc_0_8_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_8_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_8_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_8_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen vec_rsc_0_9_i
      (
      .q(vec_rsc_0_9_q),
      .radr(vec_rsc_0_9_radr),
      .we(vec_rsc_0_9_we),
      .d(vec_rsc_0_9_d),
      .wadr(vec_rsc_0_9_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_9_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_9_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_9_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen vec_rsc_0_10_i
      (
      .q(vec_rsc_0_10_q),
      .radr(vec_rsc_0_10_radr),
      .we(vec_rsc_0_10_we),
      .d(vec_rsc_0_10_d),
      .wadr(vec_rsc_0_10_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_10_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_10_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_10_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen vec_rsc_0_11_i
      (
      .q(vec_rsc_0_11_q),
      .radr(vec_rsc_0_11_radr),
      .we(vec_rsc_0_11_we),
      .d(vec_rsc_0_11_d),
      .wadr(vec_rsc_0_11_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_11_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_11_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_11_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen vec_rsc_0_12_i
      (
      .q(vec_rsc_0_12_q),
      .radr(vec_rsc_0_12_radr),
      .we(vec_rsc_0_12_we),
      .d(vec_rsc_0_12_d),
      .wadr(vec_rsc_0_12_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_12_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_12_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_12_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen vec_rsc_0_13_i
      (
      .q(vec_rsc_0_13_q),
      .radr(vec_rsc_0_13_radr),
      .we(vec_rsc_0_13_we),
      .d(vec_rsc_0_13_d),
      .wadr(vec_rsc_0_13_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_13_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_13_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_13_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen vec_rsc_0_14_i
      (
      .q(vec_rsc_0_14_q),
      .radr(vec_rsc_0_14_radr),
      .we(vec_rsc_0_14_we),
      .d(vec_rsc_0_14_d),
      .wadr(vec_rsc_0_14_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_14_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_14_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_14_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen vec_rsc_0_15_i
      (
      .q(vec_rsc_0_15_q),
      .radr(vec_rsc_0_15_radr),
      .we(vec_rsc_0_15_we),
      .d(vec_rsc_0_15_d),
      .wadr(vec_rsc_0_15_wadr),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_15_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .wadr_d(vec_rsc_0_0_i_wadr_d_iff),
      .we_d(vec_rsc_0_15_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_15_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen twiddle_rsc_0_0_i
      (
      .q(twiddle_rsc_0_0_q),
      .radr(twiddle_rsc_0_0_radr),
      .q_d(twiddle_rsc_0_0_i_q_d),
      .radr_d(twiddle_rsc_0_0_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen twiddle_rsc_0_1_i
      (
      .q(twiddle_rsc_0_1_q),
      .radr(twiddle_rsc_0_1_radr),
      .q_d(twiddle_rsc_0_1_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen twiddle_rsc_0_2_i
      (
      .q(twiddle_rsc_0_2_q),
      .radr(twiddle_rsc_0_2_radr),
      .q_d(twiddle_rsc_0_2_i_q_d),
      .radr_d(twiddle_rsc_0_2_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen twiddle_rsc_0_3_i
      (
      .q(twiddle_rsc_0_3_q),
      .radr(twiddle_rsc_0_3_radr),
      .q_d(twiddle_rsc_0_3_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen twiddle_rsc_0_4_i
      (
      .q(twiddle_rsc_0_4_q),
      .radr(twiddle_rsc_0_4_radr),
      .q_d(twiddle_rsc_0_4_i_q_d),
      .radr_d(twiddle_rsc_0_4_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen twiddle_rsc_0_5_i
      (
      .q(twiddle_rsc_0_5_q),
      .radr(twiddle_rsc_0_5_radr),
      .q_d(twiddle_rsc_0_5_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen twiddle_rsc_0_6_i
      (
      .q(twiddle_rsc_0_6_q),
      .radr(twiddle_rsc_0_6_radr),
      .q_d(twiddle_rsc_0_6_i_q_d),
      .radr_d(twiddle_rsc_0_2_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen twiddle_rsc_0_7_i
      (
      .q(twiddle_rsc_0_7_q),
      .radr(twiddle_rsc_0_7_radr),
      .q_d(twiddle_rsc_0_7_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen twiddle_rsc_0_8_i
      (
      .q(twiddle_rsc_0_8_q),
      .radr(twiddle_rsc_0_8_radr),
      .q_d(twiddle_rsc_0_8_i_q_d),
      .radr_d(twiddle_rsc_0_0_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen twiddle_rsc_0_9_i
      (
      .q(twiddle_rsc_0_9_q),
      .radr(twiddle_rsc_0_9_radr),
      .q_d(twiddle_rsc_0_9_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen twiddle_rsc_0_10_i
      (
      .q(twiddle_rsc_0_10_q),
      .radr(twiddle_rsc_0_10_radr),
      .q_d(twiddle_rsc_0_10_i_q_d),
      .radr_d(twiddle_rsc_0_2_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen twiddle_rsc_0_11_i
      (
      .q(twiddle_rsc_0_11_q),
      .radr(twiddle_rsc_0_11_radr),
      .q_d(twiddle_rsc_0_11_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen twiddle_rsc_0_12_i
      (
      .q(twiddle_rsc_0_12_q),
      .radr(twiddle_rsc_0_12_radr),
      .q_d(twiddle_rsc_0_12_i_q_d),
      .radr_d(twiddle_rsc_0_4_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen twiddle_rsc_0_13_i
      (
      .q(twiddle_rsc_0_13_q),
      .radr(twiddle_rsc_0_13_radr),
      .q_d(twiddle_rsc_0_13_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen twiddle_rsc_0_14_i
      (
      .q(twiddle_rsc_0_14_q),
      .radr(twiddle_rsc_0_14_radr),
      .q_d(twiddle_rsc_0_14_i_q_d),
      .radr_d(twiddle_rsc_0_2_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen twiddle_rsc_0_15_i
      (
      .q(twiddle_rsc_0_15_q),
      .radr(twiddle_rsc_0_15_radr),
      .q_d(twiddle_rsc_0_15_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d)
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
      .vec_rsc_triosy_0_8_lz(vec_rsc_triosy_0_8_lz),
      .vec_rsc_triosy_0_9_lz(vec_rsc_triosy_0_9_lz),
      .vec_rsc_triosy_0_10_lz(vec_rsc_triosy_0_10_lz),
      .vec_rsc_triosy_0_11_lz(vec_rsc_triosy_0_11_lz),
      .vec_rsc_triosy_0_12_lz(vec_rsc_triosy_0_12_lz),
      .vec_rsc_triosy_0_13_lz(vec_rsc_triosy_0_13_lz),
      .vec_rsc_triosy_0_14_lz(vec_rsc_triosy_0_14_lz),
      .vec_rsc_triosy_0_15_lz(vec_rsc_triosy_0_15_lz),
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
      .twiddle_rsc_triosy_0_8_lz(twiddle_rsc_triosy_0_8_lz),
      .twiddle_rsc_triosy_0_9_lz(twiddle_rsc_triosy_0_9_lz),
      .twiddle_rsc_triosy_0_10_lz(twiddle_rsc_triosy_0_10_lz),
      .twiddle_rsc_triosy_0_11_lz(twiddle_rsc_triosy_0_11_lz),
      .twiddle_rsc_triosy_0_12_lz(twiddle_rsc_triosy_0_12_lz),
      .twiddle_rsc_triosy_0_13_lz(twiddle_rsc_triosy_0_13_lz),
      .twiddle_rsc_triosy_0_14_lz(twiddle_rsc_triosy_0_14_lz),
      .twiddle_rsc_triosy_0_15_lz(twiddle_rsc_triosy_0_15_lz),
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
      .vec_rsc_0_8_i_q_d(vec_rsc_0_8_i_q_d),
      .vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_9_i_q_d(vec_rsc_0_9_i_q_d),
      .vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_10_i_q_d(vec_rsc_0_10_i_q_d),
      .vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_11_i_q_d(vec_rsc_0_11_i_q_d),
      .vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_12_i_q_d(vec_rsc_0_12_i_q_d),
      .vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_13_i_q_d(vec_rsc_0_13_i_q_d),
      .vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_14_i_q_d(vec_rsc_0_14_i_q_d),
      .vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_15_i_q_d(vec_rsc_0_15_i_q_d),
      .vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_0_i_q_d(twiddle_rsc_0_0_i_q_d),
      .twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_1_i_q_d(twiddle_rsc_0_1_i_q_d),
      .twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_2_i_q_d(twiddle_rsc_0_2_i_q_d),
      .twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_3_i_q_d(twiddle_rsc_0_3_i_q_d),
      .twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_4_i_q_d(twiddle_rsc_0_4_i_q_d),
      .twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_5_i_q_d(twiddle_rsc_0_5_i_q_d),
      .twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_6_i_q_d(twiddle_rsc_0_6_i_q_d),
      .twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_7_i_q_d(twiddle_rsc_0_7_i_q_d),
      .twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_8_i_q_d(twiddle_rsc_0_8_i_q_d),
      .twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_9_i_q_d(twiddle_rsc_0_9_i_q_d),
      .twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_10_i_q_d(twiddle_rsc_0_10_i_q_d),
      .twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_11_i_q_d(twiddle_rsc_0_11_i_q_d),
      .twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_12_i_q_d(twiddle_rsc_0_12_i_q_d),
      .twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_13_i_q_d(twiddle_rsc_0_13_i_q_d),
      .twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_14_i_q_d(twiddle_rsc_0_14_i_q_d),
      .twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_15_i_q_d(twiddle_rsc_0_15_i_q_d),
      .twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d),
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
      .vec_rsc_0_8_i_we_d_pff(vec_rsc_0_8_i_we_d_iff),
      .vec_rsc_0_9_i_we_d_pff(vec_rsc_0_9_i_we_d_iff),
      .vec_rsc_0_10_i_we_d_pff(vec_rsc_0_10_i_we_d_iff),
      .vec_rsc_0_11_i_we_d_pff(vec_rsc_0_11_i_we_d_iff),
      .vec_rsc_0_12_i_we_d_pff(vec_rsc_0_12_i_we_d_iff),
      .vec_rsc_0_13_i_we_d_pff(vec_rsc_0_13_i_we_d_iff),
      .vec_rsc_0_14_i_we_d_pff(vec_rsc_0_14_i_we_d_iff),
      .vec_rsc_0_15_i_we_d_pff(vec_rsc_0_15_i_we_d_iff),
      .twiddle_rsc_0_0_i_radr_d_pff(twiddle_rsc_0_0_i_radr_d_iff),
      .twiddle_rsc_0_1_i_radr_d_pff(twiddle_rsc_0_1_i_radr_d_iff),
      .twiddle_rsc_0_2_i_radr_d_pff(twiddle_rsc_0_2_i_radr_d_iff),
      .twiddle_rsc_0_4_i_radr_d_pff(twiddle_rsc_0_4_i_radr_d_iff)
    );
endmodule



