
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

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_r_beh_v5.v 
module mgc_shift_r_v5(a,s,z);
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
       assign z = fshr_u(a,s,a[width_a-1]);
     end
     else
     begin: UNSGNED
       assign z = fshr_u(a,s,1'b0);
     end
   endgenerate

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

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW.v 
// Memory Type:            BLOCK
// Operating Mode:         Simple Dual Port (2-Port)
// Clock Mode:             Single Clock
// 
// RTL Code RW Resolution: RBW
// Catapult RW Resolution: RBW
// 
// HDL Work Library:       Xilinx_RAMS_lib
// Component Name:         BLOCK_1R1W_RBW
// Latency = 1:            RAM with no registers on inputs or outputs
//         = 2:            adds embedded register on RAM output
//         = 3:            adds fabric registers to non-clock input RAM pins
//         = 4:            adds fabric register to output (driven by embedded register from latency=2)

module BLOCK_1R1W_RBW #(
  parameter addr_width = 8 ,
  parameter data_width = 7 ,
  parameter depth = 256 ,
  parameter latency = 1 
  
)( clk,clken,d,q,radr,wadr,we);

  input  clk;
  input  clken;
  input [data_width-1:0] d;
  output [data_width-1:0] q;
  input [addr_width-1:0] radr;
  input [addr_width-1:0] wadr;
  input  we;
  
  (* ram_style = "block" *)
  reg [data_width-1:0] mem [depth-1:0];// synthesis syn_ramstyle="block"
  
  reg [data_width-1:0] ramq;
  
  // Port Map
  // readA :: CLOCK clk ENABLE clken DATA_OUT q ADDRESS radr
  // writeA :: CLOCK clk ENABLE clken DATA_IN d ADDRESS wadr WRITE_ENABLE we

  generate
    // Register all non-clock inputs (latency < 3)
    if (latency > 2 ) begin
      reg [addr_width-1:0] radr_reg;
      reg [data_width-1:0] d_reg;
      reg [addr_width-1:0] wadr_reg;
      reg we_reg;
      
      always @(posedge clk) begin
        if (clken) begin
          radr_reg <= radr;
        end
      end
      always @(posedge clk) begin
        if (clken) begin
          d_reg <= d;
          wadr_reg <= wadr;
          we_reg <= we;
        end
      end
      
    // Access memory with registered inputs
      always @(posedge clk) begin
        if (clken) begin
            ramq <= mem[radr_reg];
            if (we_reg) begin
              mem[wadr_reg] <= d_reg;
            end
        end
      end
      
    end // END register inputs

    else begin
    // latency = 1||2: Access memory with non-registered inputs
      always @(posedge clk) begin
        if (clken) begin
            ramq <= mem[radr];
            if (we) begin
              mem[wadr] <= d;
            end
        end
      end
      
    end
  endgenerate //END input port generate 

  generate
    // latency=1: sequential RAM outputs drive module outputs
    if (latency == 1) begin
      assign q = ramq;
      
    end

    else if (latency == 2 || latency == 3) begin
    // latency=2: sequential (RAM output => tmp register => module output)
      reg [data_width-1:0] tmpq;
      
      always @(posedge clk) begin
        if (clken) begin
          tmpq <= ramq;
        end
      end
      
      assign q = tmpq;
      
    end
    else if (latency == 4) begin
    // latency=4: (RAM => tmp1 register => tmp2 fabric register => module output)
      reg [data_width-1:0] tmp1q;
      
      reg [data_width-1:0] tmp2q;
      
      always @(posedge clk) begin
        if (clken) begin
          tmp1q <= ramq;
        end
      end
      
      always @(posedge clk) begin
        if (clken) begin
          tmp2q <= tmp1q;
        end
      end
      
      assign q = tmp2q;
      
    end
    else begin
      //Add error check if latency > 4 or add N-pipeline regs
    end
  endgenerate //END output port generate

endmodule

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   jd4691@newnano.poly.edu
//  Generated date: Wed Jul 28 06:09:28 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
    (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [63:0] q;
  output [9:0] radr;
  output we;
  output [63:0] d;
  output [9:0] wadr;
  input clken_d;
  input [63:0] d_d;
  output [63:0] q_d;
  input [9:0] radr_d;
  input [9:0] wadr_d;
  input we_d;
  input writeA_w_ram_ir_internal_WMASK_B_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clken = (clken_d);
  assign q_d = q;
  assign radr = (radr_d);
  assign we = (writeA_w_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign wadr = (wadr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen
    (
  qb, adrb, adrb_d, qb_d, readB_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] qb;
  output [9:0] adrb;
  input [9:0] adrb_d;
  output [63:0] qb_d;
  input readB_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qb_d = qb;
  assign adrb = (adrb_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen
// ------------------------------------------------------------------


module stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen
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
//  Design Unit:    stockham_DIT_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module stockham_DIT_core_core_fsm (
  clk, rst, fsm_output, INNER_LOOP_C_123_tr0, OUTER_LOOP_C_0_tr0
);
  input clk;
  input rst;
  output [6:0] fsm_output;
  reg [6:0] fsm_output;
  input INNER_LOOP_C_123_tr0;
  input OUTER_LOOP_C_0_tr0;


  // FSM State Type Declaration for stockham_DIT_core_core_fsm_1
  parameter
    main_C_0 = 7'd0,
    INNER_LOOP_C_0 = 7'd1,
    INNER_LOOP_C_1 = 7'd2,
    INNER_LOOP_C_2 = 7'd3,
    INNER_LOOP_C_3 = 7'd4,
    INNER_LOOP_C_4 = 7'd5,
    INNER_LOOP_C_5 = 7'd6,
    INNER_LOOP_C_6 = 7'd7,
    INNER_LOOP_C_7 = 7'd8,
    INNER_LOOP_C_8 = 7'd9,
    INNER_LOOP_C_9 = 7'd10,
    INNER_LOOP_C_10 = 7'd11,
    INNER_LOOP_C_11 = 7'd12,
    INNER_LOOP_C_12 = 7'd13,
    INNER_LOOP_C_13 = 7'd14,
    INNER_LOOP_C_14 = 7'd15,
    INNER_LOOP_C_15 = 7'd16,
    INNER_LOOP_C_16 = 7'd17,
    INNER_LOOP_C_17 = 7'd18,
    INNER_LOOP_C_18 = 7'd19,
    INNER_LOOP_C_19 = 7'd20,
    INNER_LOOP_C_20 = 7'd21,
    INNER_LOOP_C_21 = 7'd22,
    INNER_LOOP_C_22 = 7'd23,
    INNER_LOOP_C_23 = 7'd24,
    INNER_LOOP_C_24 = 7'd25,
    INNER_LOOP_C_25 = 7'd26,
    INNER_LOOP_C_26 = 7'd27,
    INNER_LOOP_C_27 = 7'd28,
    INNER_LOOP_C_28 = 7'd29,
    INNER_LOOP_C_29 = 7'd30,
    INNER_LOOP_C_30 = 7'd31,
    INNER_LOOP_C_31 = 7'd32,
    INNER_LOOP_C_32 = 7'd33,
    INNER_LOOP_C_33 = 7'd34,
    INNER_LOOP_C_34 = 7'd35,
    INNER_LOOP_C_35 = 7'd36,
    INNER_LOOP_C_36 = 7'd37,
    INNER_LOOP_C_37 = 7'd38,
    INNER_LOOP_C_38 = 7'd39,
    INNER_LOOP_C_39 = 7'd40,
    INNER_LOOP_C_40 = 7'd41,
    INNER_LOOP_C_41 = 7'd42,
    INNER_LOOP_C_42 = 7'd43,
    INNER_LOOP_C_43 = 7'd44,
    INNER_LOOP_C_44 = 7'd45,
    INNER_LOOP_C_45 = 7'd46,
    INNER_LOOP_C_46 = 7'd47,
    INNER_LOOP_C_47 = 7'd48,
    INNER_LOOP_C_48 = 7'd49,
    INNER_LOOP_C_49 = 7'd50,
    INNER_LOOP_C_50 = 7'd51,
    INNER_LOOP_C_51 = 7'd52,
    INNER_LOOP_C_52 = 7'd53,
    INNER_LOOP_C_53 = 7'd54,
    INNER_LOOP_C_54 = 7'd55,
    INNER_LOOP_C_55 = 7'd56,
    INNER_LOOP_C_56 = 7'd57,
    INNER_LOOP_C_57 = 7'd58,
    INNER_LOOP_C_58 = 7'd59,
    INNER_LOOP_C_59 = 7'd60,
    INNER_LOOP_C_60 = 7'd61,
    INNER_LOOP_C_61 = 7'd62,
    INNER_LOOP_C_62 = 7'd63,
    INNER_LOOP_C_63 = 7'd64,
    INNER_LOOP_C_64 = 7'd65,
    INNER_LOOP_C_65 = 7'd66,
    INNER_LOOP_C_66 = 7'd67,
    INNER_LOOP_C_67 = 7'd68,
    INNER_LOOP_C_68 = 7'd69,
    INNER_LOOP_C_69 = 7'd70,
    INNER_LOOP_C_70 = 7'd71,
    INNER_LOOP_C_71 = 7'd72,
    INNER_LOOP_C_72 = 7'd73,
    INNER_LOOP_C_73 = 7'd74,
    INNER_LOOP_C_74 = 7'd75,
    INNER_LOOP_C_75 = 7'd76,
    INNER_LOOP_C_76 = 7'd77,
    INNER_LOOP_C_77 = 7'd78,
    INNER_LOOP_C_78 = 7'd79,
    INNER_LOOP_C_79 = 7'd80,
    INNER_LOOP_C_80 = 7'd81,
    INNER_LOOP_C_81 = 7'd82,
    INNER_LOOP_C_82 = 7'd83,
    INNER_LOOP_C_83 = 7'd84,
    INNER_LOOP_C_84 = 7'd85,
    INNER_LOOP_C_85 = 7'd86,
    INNER_LOOP_C_86 = 7'd87,
    INNER_LOOP_C_87 = 7'd88,
    INNER_LOOP_C_88 = 7'd89,
    INNER_LOOP_C_89 = 7'd90,
    INNER_LOOP_C_90 = 7'd91,
    INNER_LOOP_C_91 = 7'd92,
    INNER_LOOP_C_92 = 7'd93,
    INNER_LOOP_C_93 = 7'd94,
    INNER_LOOP_C_94 = 7'd95,
    INNER_LOOP_C_95 = 7'd96,
    INNER_LOOP_C_96 = 7'd97,
    INNER_LOOP_C_97 = 7'd98,
    INNER_LOOP_C_98 = 7'd99,
    INNER_LOOP_C_99 = 7'd100,
    INNER_LOOP_C_100 = 7'd101,
    INNER_LOOP_C_101 = 7'd102,
    INNER_LOOP_C_102 = 7'd103,
    INNER_LOOP_C_103 = 7'd104,
    INNER_LOOP_C_104 = 7'd105,
    INNER_LOOP_C_105 = 7'd106,
    INNER_LOOP_C_106 = 7'd107,
    INNER_LOOP_C_107 = 7'd108,
    INNER_LOOP_C_108 = 7'd109,
    INNER_LOOP_C_109 = 7'd110,
    INNER_LOOP_C_110 = 7'd111,
    INNER_LOOP_C_111 = 7'd112,
    INNER_LOOP_C_112 = 7'd113,
    INNER_LOOP_C_113 = 7'd114,
    INNER_LOOP_C_114 = 7'd115,
    INNER_LOOP_C_115 = 7'd116,
    INNER_LOOP_C_116 = 7'd117,
    INNER_LOOP_C_117 = 7'd118,
    INNER_LOOP_C_118 = 7'd119,
    INNER_LOOP_C_119 = 7'd120,
    INNER_LOOP_C_120 = 7'd121,
    INNER_LOOP_C_121 = 7'd122,
    INNER_LOOP_C_122 = 7'd123,
    INNER_LOOP_C_123 = 7'd124,
    OUTER_LOOP_C_0 = 7'd125,
    main_C_1 = 7'd126;

  reg [6:0] state_var;
  reg [6:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : stockham_DIT_core_core_fsm_1
    case (state_var)
      INNER_LOOP_C_0 : begin
        fsm_output = 7'b0000001;
        state_var_NS = INNER_LOOP_C_1;
      end
      INNER_LOOP_C_1 : begin
        fsm_output = 7'b0000010;
        state_var_NS = INNER_LOOP_C_2;
      end
      INNER_LOOP_C_2 : begin
        fsm_output = 7'b0000011;
        state_var_NS = INNER_LOOP_C_3;
      end
      INNER_LOOP_C_3 : begin
        fsm_output = 7'b0000100;
        state_var_NS = INNER_LOOP_C_4;
      end
      INNER_LOOP_C_4 : begin
        fsm_output = 7'b0000101;
        state_var_NS = INNER_LOOP_C_5;
      end
      INNER_LOOP_C_5 : begin
        fsm_output = 7'b0000110;
        state_var_NS = INNER_LOOP_C_6;
      end
      INNER_LOOP_C_6 : begin
        fsm_output = 7'b0000111;
        state_var_NS = INNER_LOOP_C_7;
      end
      INNER_LOOP_C_7 : begin
        fsm_output = 7'b0001000;
        state_var_NS = INNER_LOOP_C_8;
      end
      INNER_LOOP_C_8 : begin
        fsm_output = 7'b0001001;
        state_var_NS = INNER_LOOP_C_9;
      end
      INNER_LOOP_C_9 : begin
        fsm_output = 7'b0001010;
        state_var_NS = INNER_LOOP_C_10;
      end
      INNER_LOOP_C_10 : begin
        fsm_output = 7'b0001011;
        state_var_NS = INNER_LOOP_C_11;
      end
      INNER_LOOP_C_11 : begin
        fsm_output = 7'b0001100;
        state_var_NS = INNER_LOOP_C_12;
      end
      INNER_LOOP_C_12 : begin
        fsm_output = 7'b0001101;
        state_var_NS = INNER_LOOP_C_13;
      end
      INNER_LOOP_C_13 : begin
        fsm_output = 7'b0001110;
        state_var_NS = INNER_LOOP_C_14;
      end
      INNER_LOOP_C_14 : begin
        fsm_output = 7'b0001111;
        state_var_NS = INNER_LOOP_C_15;
      end
      INNER_LOOP_C_15 : begin
        fsm_output = 7'b0010000;
        state_var_NS = INNER_LOOP_C_16;
      end
      INNER_LOOP_C_16 : begin
        fsm_output = 7'b0010001;
        state_var_NS = INNER_LOOP_C_17;
      end
      INNER_LOOP_C_17 : begin
        fsm_output = 7'b0010010;
        state_var_NS = INNER_LOOP_C_18;
      end
      INNER_LOOP_C_18 : begin
        fsm_output = 7'b0010011;
        state_var_NS = INNER_LOOP_C_19;
      end
      INNER_LOOP_C_19 : begin
        fsm_output = 7'b0010100;
        state_var_NS = INNER_LOOP_C_20;
      end
      INNER_LOOP_C_20 : begin
        fsm_output = 7'b0010101;
        state_var_NS = INNER_LOOP_C_21;
      end
      INNER_LOOP_C_21 : begin
        fsm_output = 7'b0010110;
        state_var_NS = INNER_LOOP_C_22;
      end
      INNER_LOOP_C_22 : begin
        fsm_output = 7'b0010111;
        state_var_NS = INNER_LOOP_C_23;
      end
      INNER_LOOP_C_23 : begin
        fsm_output = 7'b0011000;
        state_var_NS = INNER_LOOP_C_24;
      end
      INNER_LOOP_C_24 : begin
        fsm_output = 7'b0011001;
        state_var_NS = INNER_LOOP_C_25;
      end
      INNER_LOOP_C_25 : begin
        fsm_output = 7'b0011010;
        state_var_NS = INNER_LOOP_C_26;
      end
      INNER_LOOP_C_26 : begin
        fsm_output = 7'b0011011;
        state_var_NS = INNER_LOOP_C_27;
      end
      INNER_LOOP_C_27 : begin
        fsm_output = 7'b0011100;
        state_var_NS = INNER_LOOP_C_28;
      end
      INNER_LOOP_C_28 : begin
        fsm_output = 7'b0011101;
        state_var_NS = INNER_LOOP_C_29;
      end
      INNER_LOOP_C_29 : begin
        fsm_output = 7'b0011110;
        state_var_NS = INNER_LOOP_C_30;
      end
      INNER_LOOP_C_30 : begin
        fsm_output = 7'b0011111;
        state_var_NS = INNER_LOOP_C_31;
      end
      INNER_LOOP_C_31 : begin
        fsm_output = 7'b0100000;
        state_var_NS = INNER_LOOP_C_32;
      end
      INNER_LOOP_C_32 : begin
        fsm_output = 7'b0100001;
        state_var_NS = INNER_LOOP_C_33;
      end
      INNER_LOOP_C_33 : begin
        fsm_output = 7'b0100010;
        state_var_NS = INNER_LOOP_C_34;
      end
      INNER_LOOP_C_34 : begin
        fsm_output = 7'b0100011;
        state_var_NS = INNER_LOOP_C_35;
      end
      INNER_LOOP_C_35 : begin
        fsm_output = 7'b0100100;
        state_var_NS = INNER_LOOP_C_36;
      end
      INNER_LOOP_C_36 : begin
        fsm_output = 7'b0100101;
        state_var_NS = INNER_LOOP_C_37;
      end
      INNER_LOOP_C_37 : begin
        fsm_output = 7'b0100110;
        state_var_NS = INNER_LOOP_C_38;
      end
      INNER_LOOP_C_38 : begin
        fsm_output = 7'b0100111;
        state_var_NS = INNER_LOOP_C_39;
      end
      INNER_LOOP_C_39 : begin
        fsm_output = 7'b0101000;
        state_var_NS = INNER_LOOP_C_40;
      end
      INNER_LOOP_C_40 : begin
        fsm_output = 7'b0101001;
        state_var_NS = INNER_LOOP_C_41;
      end
      INNER_LOOP_C_41 : begin
        fsm_output = 7'b0101010;
        state_var_NS = INNER_LOOP_C_42;
      end
      INNER_LOOP_C_42 : begin
        fsm_output = 7'b0101011;
        state_var_NS = INNER_LOOP_C_43;
      end
      INNER_LOOP_C_43 : begin
        fsm_output = 7'b0101100;
        state_var_NS = INNER_LOOP_C_44;
      end
      INNER_LOOP_C_44 : begin
        fsm_output = 7'b0101101;
        state_var_NS = INNER_LOOP_C_45;
      end
      INNER_LOOP_C_45 : begin
        fsm_output = 7'b0101110;
        state_var_NS = INNER_LOOP_C_46;
      end
      INNER_LOOP_C_46 : begin
        fsm_output = 7'b0101111;
        state_var_NS = INNER_LOOP_C_47;
      end
      INNER_LOOP_C_47 : begin
        fsm_output = 7'b0110000;
        state_var_NS = INNER_LOOP_C_48;
      end
      INNER_LOOP_C_48 : begin
        fsm_output = 7'b0110001;
        state_var_NS = INNER_LOOP_C_49;
      end
      INNER_LOOP_C_49 : begin
        fsm_output = 7'b0110010;
        state_var_NS = INNER_LOOP_C_50;
      end
      INNER_LOOP_C_50 : begin
        fsm_output = 7'b0110011;
        state_var_NS = INNER_LOOP_C_51;
      end
      INNER_LOOP_C_51 : begin
        fsm_output = 7'b0110100;
        state_var_NS = INNER_LOOP_C_52;
      end
      INNER_LOOP_C_52 : begin
        fsm_output = 7'b0110101;
        state_var_NS = INNER_LOOP_C_53;
      end
      INNER_LOOP_C_53 : begin
        fsm_output = 7'b0110110;
        state_var_NS = INNER_LOOP_C_54;
      end
      INNER_LOOP_C_54 : begin
        fsm_output = 7'b0110111;
        state_var_NS = INNER_LOOP_C_55;
      end
      INNER_LOOP_C_55 : begin
        fsm_output = 7'b0111000;
        state_var_NS = INNER_LOOP_C_56;
      end
      INNER_LOOP_C_56 : begin
        fsm_output = 7'b0111001;
        state_var_NS = INNER_LOOP_C_57;
      end
      INNER_LOOP_C_57 : begin
        fsm_output = 7'b0111010;
        state_var_NS = INNER_LOOP_C_58;
      end
      INNER_LOOP_C_58 : begin
        fsm_output = 7'b0111011;
        state_var_NS = INNER_LOOP_C_59;
      end
      INNER_LOOP_C_59 : begin
        fsm_output = 7'b0111100;
        state_var_NS = INNER_LOOP_C_60;
      end
      INNER_LOOP_C_60 : begin
        fsm_output = 7'b0111101;
        state_var_NS = INNER_LOOP_C_61;
      end
      INNER_LOOP_C_61 : begin
        fsm_output = 7'b0111110;
        state_var_NS = INNER_LOOP_C_62;
      end
      INNER_LOOP_C_62 : begin
        fsm_output = 7'b0111111;
        state_var_NS = INNER_LOOP_C_63;
      end
      INNER_LOOP_C_63 : begin
        fsm_output = 7'b1000000;
        state_var_NS = INNER_LOOP_C_64;
      end
      INNER_LOOP_C_64 : begin
        fsm_output = 7'b1000001;
        state_var_NS = INNER_LOOP_C_65;
      end
      INNER_LOOP_C_65 : begin
        fsm_output = 7'b1000010;
        state_var_NS = INNER_LOOP_C_66;
      end
      INNER_LOOP_C_66 : begin
        fsm_output = 7'b1000011;
        state_var_NS = INNER_LOOP_C_67;
      end
      INNER_LOOP_C_67 : begin
        fsm_output = 7'b1000100;
        state_var_NS = INNER_LOOP_C_68;
      end
      INNER_LOOP_C_68 : begin
        fsm_output = 7'b1000101;
        state_var_NS = INNER_LOOP_C_69;
      end
      INNER_LOOP_C_69 : begin
        fsm_output = 7'b1000110;
        state_var_NS = INNER_LOOP_C_70;
      end
      INNER_LOOP_C_70 : begin
        fsm_output = 7'b1000111;
        state_var_NS = INNER_LOOP_C_71;
      end
      INNER_LOOP_C_71 : begin
        fsm_output = 7'b1001000;
        state_var_NS = INNER_LOOP_C_72;
      end
      INNER_LOOP_C_72 : begin
        fsm_output = 7'b1001001;
        state_var_NS = INNER_LOOP_C_73;
      end
      INNER_LOOP_C_73 : begin
        fsm_output = 7'b1001010;
        state_var_NS = INNER_LOOP_C_74;
      end
      INNER_LOOP_C_74 : begin
        fsm_output = 7'b1001011;
        state_var_NS = INNER_LOOP_C_75;
      end
      INNER_LOOP_C_75 : begin
        fsm_output = 7'b1001100;
        state_var_NS = INNER_LOOP_C_76;
      end
      INNER_LOOP_C_76 : begin
        fsm_output = 7'b1001101;
        state_var_NS = INNER_LOOP_C_77;
      end
      INNER_LOOP_C_77 : begin
        fsm_output = 7'b1001110;
        state_var_NS = INNER_LOOP_C_78;
      end
      INNER_LOOP_C_78 : begin
        fsm_output = 7'b1001111;
        state_var_NS = INNER_LOOP_C_79;
      end
      INNER_LOOP_C_79 : begin
        fsm_output = 7'b1010000;
        state_var_NS = INNER_LOOP_C_80;
      end
      INNER_LOOP_C_80 : begin
        fsm_output = 7'b1010001;
        state_var_NS = INNER_LOOP_C_81;
      end
      INNER_LOOP_C_81 : begin
        fsm_output = 7'b1010010;
        state_var_NS = INNER_LOOP_C_82;
      end
      INNER_LOOP_C_82 : begin
        fsm_output = 7'b1010011;
        state_var_NS = INNER_LOOP_C_83;
      end
      INNER_LOOP_C_83 : begin
        fsm_output = 7'b1010100;
        state_var_NS = INNER_LOOP_C_84;
      end
      INNER_LOOP_C_84 : begin
        fsm_output = 7'b1010101;
        state_var_NS = INNER_LOOP_C_85;
      end
      INNER_LOOP_C_85 : begin
        fsm_output = 7'b1010110;
        state_var_NS = INNER_LOOP_C_86;
      end
      INNER_LOOP_C_86 : begin
        fsm_output = 7'b1010111;
        state_var_NS = INNER_LOOP_C_87;
      end
      INNER_LOOP_C_87 : begin
        fsm_output = 7'b1011000;
        state_var_NS = INNER_LOOP_C_88;
      end
      INNER_LOOP_C_88 : begin
        fsm_output = 7'b1011001;
        state_var_NS = INNER_LOOP_C_89;
      end
      INNER_LOOP_C_89 : begin
        fsm_output = 7'b1011010;
        state_var_NS = INNER_LOOP_C_90;
      end
      INNER_LOOP_C_90 : begin
        fsm_output = 7'b1011011;
        state_var_NS = INNER_LOOP_C_91;
      end
      INNER_LOOP_C_91 : begin
        fsm_output = 7'b1011100;
        state_var_NS = INNER_LOOP_C_92;
      end
      INNER_LOOP_C_92 : begin
        fsm_output = 7'b1011101;
        state_var_NS = INNER_LOOP_C_93;
      end
      INNER_LOOP_C_93 : begin
        fsm_output = 7'b1011110;
        state_var_NS = INNER_LOOP_C_94;
      end
      INNER_LOOP_C_94 : begin
        fsm_output = 7'b1011111;
        state_var_NS = INNER_LOOP_C_95;
      end
      INNER_LOOP_C_95 : begin
        fsm_output = 7'b1100000;
        state_var_NS = INNER_LOOP_C_96;
      end
      INNER_LOOP_C_96 : begin
        fsm_output = 7'b1100001;
        state_var_NS = INNER_LOOP_C_97;
      end
      INNER_LOOP_C_97 : begin
        fsm_output = 7'b1100010;
        state_var_NS = INNER_LOOP_C_98;
      end
      INNER_LOOP_C_98 : begin
        fsm_output = 7'b1100011;
        state_var_NS = INNER_LOOP_C_99;
      end
      INNER_LOOP_C_99 : begin
        fsm_output = 7'b1100100;
        state_var_NS = INNER_LOOP_C_100;
      end
      INNER_LOOP_C_100 : begin
        fsm_output = 7'b1100101;
        state_var_NS = INNER_LOOP_C_101;
      end
      INNER_LOOP_C_101 : begin
        fsm_output = 7'b1100110;
        state_var_NS = INNER_LOOP_C_102;
      end
      INNER_LOOP_C_102 : begin
        fsm_output = 7'b1100111;
        state_var_NS = INNER_LOOP_C_103;
      end
      INNER_LOOP_C_103 : begin
        fsm_output = 7'b1101000;
        state_var_NS = INNER_LOOP_C_104;
      end
      INNER_LOOP_C_104 : begin
        fsm_output = 7'b1101001;
        state_var_NS = INNER_LOOP_C_105;
      end
      INNER_LOOP_C_105 : begin
        fsm_output = 7'b1101010;
        state_var_NS = INNER_LOOP_C_106;
      end
      INNER_LOOP_C_106 : begin
        fsm_output = 7'b1101011;
        state_var_NS = INNER_LOOP_C_107;
      end
      INNER_LOOP_C_107 : begin
        fsm_output = 7'b1101100;
        state_var_NS = INNER_LOOP_C_108;
      end
      INNER_LOOP_C_108 : begin
        fsm_output = 7'b1101101;
        state_var_NS = INNER_LOOP_C_109;
      end
      INNER_LOOP_C_109 : begin
        fsm_output = 7'b1101110;
        state_var_NS = INNER_LOOP_C_110;
      end
      INNER_LOOP_C_110 : begin
        fsm_output = 7'b1101111;
        state_var_NS = INNER_LOOP_C_111;
      end
      INNER_LOOP_C_111 : begin
        fsm_output = 7'b1110000;
        state_var_NS = INNER_LOOP_C_112;
      end
      INNER_LOOP_C_112 : begin
        fsm_output = 7'b1110001;
        state_var_NS = INNER_LOOP_C_113;
      end
      INNER_LOOP_C_113 : begin
        fsm_output = 7'b1110010;
        state_var_NS = INNER_LOOP_C_114;
      end
      INNER_LOOP_C_114 : begin
        fsm_output = 7'b1110011;
        state_var_NS = INNER_LOOP_C_115;
      end
      INNER_LOOP_C_115 : begin
        fsm_output = 7'b1110100;
        state_var_NS = INNER_LOOP_C_116;
      end
      INNER_LOOP_C_116 : begin
        fsm_output = 7'b1110101;
        state_var_NS = INNER_LOOP_C_117;
      end
      INNER_LOOP_C_117 : begin
        fsm_output = 7'b1110110;
        state_var_NS = INNER_LOOP_C_118;
      end
      INNER_LOOP_C_118 : begin
        fsm_output = 7'b1110111;
        state_var_NS = INNER_LOOP_C_119;
      end
      INNER_LOOP_C_119 : begin
        fsm_output = 7'b1111000;
        state_var_NS = INNER_LOOP_C_120;
      end
      INNER_LOOP_C_120 : begin
        fsm_output = 7'b1111001;
        state_var_NS = INNER_LOOP_C_121;
      end
      INNER_LOOP_C_121 : begin
        fsm_output = 7'b1111010;
        state_var_NS = INNER_LOOP_C_122;
      end
      INNER_LOOP_C_122 : begin
        fsm_output = 7'b1111011;
        state_var_NS = INNER_LOOP_C_123;
      end
      INNER_LOOP_C_123 : begin
        fsm_output = 7'b1111100;
        if ( INNER_LOOP_C_123_tr0 ) begin
          state_var_NS = OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = INNER_LOOP_C_0;
        end
      end
      OUTER_LOOP_C_0 : begin
        fsm_output = 7'b1111101;
        if ( OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = INNER_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 7'b1111110;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 7'b0000000;
        state_var_NS = INNER_LOOP_C_0;
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
//  Design Unit:    stockham_DIT_core_wait_dp
// ------------------------------------------------------------------


module stockham_DIT_core_wait_dp (
  clk, yt_rsc_cgo_iro, yt_rsci_clken_d, INNER_LOOP_1_b_rem_cmp_z, yt_rsc_cgo, INNER_LOOP_1_b_rem_cmp_z_oreg
);
  input clk;
  input yt_rsc_cgo_iro;
  output yt_rsci_clken_d;
  input [63:0] INNER_LOOP_1_b_rem_cmp_z;
  input yt_rsc_cgo;
  output [63:0] INNER_LOOP_1_b_rem_cmp_z_oreg;
  reg [63:0] INNER_LOOP_1_b_rem_cmp_z_oreg;



  // Interconnect Declarations for Component Instantiations 
  assign yt_rsci_clken_d = yt_rsc_cgo | yt_rsc_cgo_iro;
  always @(posedge clk) begin
    INNER_LOOP_1_b_rem_cmp_z_oreg <= INNER_LOOP_1_b_rem_cmp_z;
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_DIT_core
// ------------------------------------------------------------------


module stockham_DIT_core (
  clk, rst, xt_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, g_rsc_triosy_lz, twiddle_rsc_triosy_lz,
      xt_rsci_adra_d, xt_rsci_da_d, xt_rsci_qa_d, xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_rsci_adrb_d, twiddle_rsci_qb_d, twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d,
      yt_rsci_clken_d, yt_rsci_d_d, yt_rsci_q_d, yt_rsci_radr_d, yt_rsci_wadr_d,
      yt_rsci_readA_r_ram_ir_internal_RMASK_B_d, INNER_LOOP_1_b_rem_cmp_a, INNER_LOOP_1_b_rem_cmp_b,
      INNER_LOOP_1_b_rem_cmp_z, xt_rsci_wea_d_pff, yt_rsci_we_d_pff
);
  input clk;
  input rst;
  output xt_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output g_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output [9:0] xt_rsci_adra_d;
  output [63:0] xt_rsci_da_d;
  input [63:0] xt_rsci_qa_d;
  output xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [9:0] twiddle_rsci_adrb_d;
  input [63:0] twiddle_rsci_qb_d;
  output twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  output yt_rsci_clken_d;
  output [63:0] yt_rsci_d_d;
  input [63:0] yt_rsci_q_d;
  output [9:0] yt_rsci_radr_d;
  output [9:0] yt_rsci_wadr_d;
  output yt_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output [127:0] INNER_LOOP_1_b_rem_cmp_a;
  reg [127:0] INNER_LOOP_1_b_rem_cmp_a;
  output [63:0] INNER_LOOP_1_b_rem_cmp_b;
  input [63:0] INNER_LOOP_1_b_rem_cmp_z;
  output xt_rsci_wea_d_pff;
  output yt_rsci_we_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  wire [64:0] INNER_LOOP_1_modulo_dev_result_rem_cmp_z;
  wire [63:0] INNER_LOOP_1_b_rem_cmp_z_oreg;
  reg [63:0] INNER_LOOP_1_modulo_dev_result_rem_cmp_a_63_0;
  wire [6:0] fsm_output;
  wire xor_dcpl;
  wire and_dcpl_3;
  wire and_dcpl_4;
  wire and_dcpl_5;
  wire and_dcpl_6;
  wire and_dcpl_7;
  wire and_dcpl_8;
  wire and_dcpl_9;
  wire and_dcpl_10;
  wire and_dcpl_13;
  wire and_dcpl_14;
  wire and_dcpl_15;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire and_dcpl_20;
  wire and_dcpl_21;
  wire and_dcpl_22;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire and_dcpl_33;
  wire and_dcpl_35;
  wire or_tmp_5;
  wire or_tmp_7;
  wire or_tmp_10;
  wire or_tmp_11;
  wire mux_tmp_12;
  wire or_tmp_13;
  wire not_tmp_28;
  wire nand_tmp;
  wire and_dcpl_51;
  wire mux_tmp_24;
  wire and_dcpl_54;
  wire and_dcpl_64;
  wire nor_tmp_10;
  wire or_tmp_27;
  wire mux_tmp_25;
  wire nor_tmp_11;
  wire and_dcpl_67;
  wire and_dcpl_68;
  wire and_dcpl_80;
  wire not_tmp_43;
  wire or_dcpl_4;
  wire or_dcpl_5;
  wire or_dcpl_6;
  wire and_dcpl_84;
  wire and_dcpl_86;
  reg [7:0] INNER_LOOP_1_upper_and_psp_sva;
  wire INNER_LOOP_b_INNER_LOOP_b_and_7;
  wire INNER_LOOP_b_INNER_LOOP_b_and_9;
  reg y_3_sva;
  reg y_1_sva;
  reg INNER_LOOP_b_nor_itm;
  reg [8:0] INNER_LOOP_t_9_1_sva_1;
  wire [9:0] nl_INNER_LOOP_t_9_1_sva_1;
  reg x_3_sva;
  reg x_1_sva;
  wire s_or_cse;
  reg reg_yt_rsc_cgo_cse;
  reg reg_xt_rsc_triosy_obj_ld_cse;
  reg [63:0] reg_INNER_LOOP_1_modulo_dev_result_rem_cmp_b_63_0_cse;
  wire [63:0] modulo_dev_qelse_mux_1_cse;
  wire and_103_cse;
  wire mux_23_rmff;
  wire [8:0] xt_rsci_adra_d_mx0w0_9_1;
  wire [9:0] nl_xt_rsci_adra_d_mx0w0_9_1;
  reg [7:0] INNER_LOOP_a_acc_psp_2_sva;
  wire [8:0] nl_INNER_LOOP_a_acc_psp_2_sva;
  reg INNER_LOOP_a_slc_INNER_LOOP_1_q_and_psp_0_1_itm;
  reg [8:0] INNER_LOOP_a_acc_psp_sva;
  wire [9:0] nl_INNER_LOOP_a_acc_psp_sva;
  reg [9:0] pref_y_idx_pref_9_0_sva;
  wire [10:0] nl_pref_y_idx_pref_9_0_sva;
  reg [10:0] s_10_0_sva;
  reg INNER_LOOP_upper_slc_INNER_LOOP_upper_acc_psp_10_8_0_1_0_2_itm;
  reg [8:0] INNER_LOOP_acc_psp_sva;
  reg [9:0] INNER_LOOP_acc_tdx_1_9_0_1_sva;
  wire [10:0] nl_INNER_LOOP_acc_tdx_1_9_0_1_sva;
  reg [9:0] INNER_LOOP_acc_tdx_1_9_0_sva;
  wire [10:0] nl_INNER_LOOP_acc_tdx_1_9_0_sva;
  wire xt_rsci_adra_d_mx0c2;
  reg [63:0] INNER_LOOP_1_acc_2_psp;
  wire [7:0] INNER_LOOP_1_upper_and_psp_sva_mx0w0;
  reg [4:0] shift_4_0_sva;
  reg INNER_LOOP_upper_acc_psp_10_8_0_1_sva_0;
  wire and_dcpl_100;
  wire [22:0] z_out;
  wire not_tmp_59;
  wire and_dcpl_107;
  wire [63:0] z_out_1;
  wire and_dcpl_115;
  wire [127:0] z_out_2;
  wire and_dcpl_124;
  wire [8:0] z_out_3;
  wire [9:0] z_out_4;
  reg [63:0] p_sva;
  reg OUTER_LOOP_nn_15_sva;
  reg OUTER_LOOP_nn_16_sva;
  reg OUTER_LOOP_nn_14_sva;
  reg OUTER_LOOP_nn_17_sva;
  reg OUTER_LOOP_nn_13_sva;
  reg OUTER_LOOP_nn_18_sva;
  reg OUTER_LOOP_nn_12_sva;
  reg OUTER_LOOP_nn_19_sva;
  reg OUTER_LOOP_nn_11_sva;
  reg OUTER_LOOP_nn_20_sva;
  reg OUTER_LOOP_nn_10_sva;
  reg OUTER_LOOP_nn_21_sva;
  reg OUTER_LOOP_nn_9_sva;
  reg OUTER_LOOP_nn_22_sva;
  reg OUTER_LOOP_nn_8_sva;
  reg OUTER_LOOP_nn_23_sva;
  reg OUTER_LOOP_nn_7_sva;
  reg OUTER_LOOP_nn_24_sva;
  reg OUTER_LOOP_nn_6_sva;
  reg OUTER_LOOP_nn_25_sva;
  reg OUTER_LOOP_nn_5_sva;
  reg OUTER_LOOP_nn_26_sva;
  reg OUTER_LOOP_nn_4_sva;
  reg OUTER_LOOP_nn_27_sva;
  reg OUTER_LOOP_nn_3_sva;
  reg OUTER_LOOP_nn_28_sva;
  reg OUTER_LOOP_nn_2_sva;
  reg OUTER_LOOP_nn_29_sva;
  reg OUTER_LOOP_nn_1_sva;
  reg OUTER_LOOP_nn_30_sva;
  reg OUTER_LOOP_nn_0_sva;
  reg [63:0] drf_y_smx_lpi_3_dfm;
  reg [127:0] INNER_LOOP_1_b_mul_mut;
  reg [127:0] INNER_LOOP_2_b_mul_mut;
  reg [63:0] INNER_LOOP_1_acc_5_itm;
  reg [63:0] INNER_LOOP_w_asn_2_itm;
  wire [63:0] INNER_LOOP_1_acc_2_psp_mx0w0;
  wire [64:0] nl_INNER_LOOP_1_acc_2_psp_mx0w0;
  wire drf_y_smx_lpi_3_dfm_mx0c;
  wire [7:0] INNER_LOOP_1_q_and_psp_sva_1;
  wire [8:0] INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1;
  wire [9:0] nl_INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1;
  wire [8:0] INNER_LOOP_acc_psp_sva_1;
  wire [9:0] nl_INNER_LOOP_acc_psp_sva_1;
  wire INNER_LOOP_1_acc_2_psp_mx0c0;
  wire INNER_LOOP_1_acc_2_psp_mx0c1;
  wire nor_36_cse;

  wire[0:0] nor_nl;
  wire[0:0] and_nl;
  wire[4:0] OUTER_LOOP_acc_1_nl;
  wire[5:0] nl_OUTER_LOOP_acc_1_nl;
  wire[0:0] nor_18_nl;
  wire[0:0] mux_22_nl;
  wire[0:0] or_26_nl;
  wire[0:0] mux_21_nl;
  wire[0:0] or_25_nl;
  wire[0:0] or_23_nl;
  wire[0:0] and_100_nl;
  wire[0:0] mux_20_nl;
  wire[0:0] or_20_nl;
  wire[0:0] mux_19_nl;
  wire[0:0] mux_18_nl;
  wire[0:0] mux_17_nl;
  wire[0:0] or_18_nl;
  wire[0:0] mux_16_nl;
  wire[0:0] mux_14_nl;
  wire[0:0] mux_13_nl;
  wire[0:0] nor_8_nl;
  wire[0:0] mux_29_nl;
  wire[0:0] mux_28_nl;
  wire[0:0] mux_27_nl;
  wire[0:0] or_32_nl;
  wire[0:0] mux_26_nl;
  wire[0:0] and_67_nl;
  wire[0:0] mux_30_nl;
  wire[0:0] and_95_nl;
  wire[0:0] or_33_nl;
  wire[0:0] and_71_nl;
  wire[0:0] nor_29_nl;
  wire[0:0] mux_31_nl;
  wire[0:0] and_75_nl;
  wire[0:0] mux_32_nl;
  wire[0:0] nor_17_nl;
  wire[0:0] INNER_LOOP_b_and_1_nl;
  wire[7:0] INNER_LOOP_upper_mux_1_nl;
  wire[0:0] and_79_nl;
  wire[0:0] or_nl;
  wire[0:0] mux_6_nl;
  wire[0:0] or_64_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] and_82_nl;
  wire[0:0] mux_36_nl;
  wire[0:0] mux_35_nl;
  wire[0:0] mux_37_nl;
  wire[0:0] and_94_nl;
  wire[0:0] and_86_nl;
  wire[0:0] mux_38_nl;
  wire[0:0] and_85_nl;
  wire[8:0] INNER_LOOP_b_acc_1_nl;
  wire[9:0] nl_INNER_LOOP_b_acc_1_nl;
  wire[0:0] mux_11_nl;
  wire[0:0] mux_15_nl;
  wire[0:0] or_28_nl;
  wire[0:0] or_30_nl;
  wire[0:0] mux_33_nl;
  wire[0:0] mux_40_nl;
  wire[0:0] nor_20_nl;
  wire[8:0] INNER_LOOP_a_mux1h_nl;
  wire[0:0] INNER_LOOP_a_or_2_nl;
  wire[0:0] INNER_LOOP_a_or_nl;
  wire[0:0] INNER_LOOP_a_mux1h_9_nl;
  wire[0:0] and_39_nl;
  wire[0:0] mux_8_nl;
  wire[0:0] mux_10_nl;
  wire[0:0] mux_9_nl;
  wire[0:0] or_13_nl;
  wire[0:0] or_12_nl;
  wire[8:0] INNER_LOOP_a_mux1h_2_nl;
  wire[0:0] INNER_LOOP_a_and_nl;
  wire[0:0] INNER_LOOP_a_mux1h_10_nl;
  wire[8:0] INNER_LOOP_a_mux1h_3_nl;
  wire[0:0] INNER_LOOP_a_or_1_nl;
  wire[0:0] INNER_LOOP_a_INNER_LOOP_a_or_nl;
  wire[0:0] INNER_LOOP_a_mux_1_nl;
  wire[0:0] nor_37_nl;
  wire[0:0] nor_38_nl;
  wire[23:0] acc_nl;
  wire[24:0] nl_acc_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_23_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_24_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_25_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_26_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_27_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_28_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_29_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_30_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_31_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_32_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_33_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_34_nl;
  wire[0:0] INNER_LOOP_b_mux_14_nl;
  wire[0:0] INNER_LOOP_b_mux_15_nl;
  wire[0:0] INNER_LOOP_b_mux_16_nl;
  wire[0:0] INNER_LOOP_b_mux_17_nl;
  wire[0:0] INNER_LOOP_b_mux_18_nl;
  wire[0:0] INNER_LOOP_b_mux_19_nl;
  wire[0:0] INNER_LOOP_b_mux_20_nl;
  wire[0:0] INNER_LOOP_b_mux_21_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_35_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_and_36_nl;
  wire[0:0] INNER_LOOP_b_INNER_LOOP_b_nor_1_nl;
  wire[7:0] INNER_LOOP_b_INNER_LOOP_b_or_1_nl;
  wire[64:0] acc_1_nl;
  wire[65:0] nl_acc_1_nl;
  wire[63:0] modulo_dev_qelse_mux_3_nl;
  wire[0:0] modulo_dev_qelse_or_1_nl;
  wire[63:0] modulo_dev_qelse_mux_4_nl;
  wire[63:0] INNER_LOOP_b_mux_22_nl;
  wire[63:0] INNER_LOOP_b_mux_23_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [64:0] nl_INNER_LOOP_1_modulo_dev_result_rem_cmp_a;
  assign nl_INNER_LOOP_1_modulo_dev_result_rem_cmp_a = {{1{INNER_LOOP_1_modulo_dev_result_rem_cmp_a_63_0[63]}},
      INNER_LOOP_1_modulo_dev_result_rem_cmp_a_63_0};
  wire [64:0] nl_INNER_LOOP_1_modulo_dev_result_rem_cmp_b;
  assign nl_INNER_LOOP_1_modulo_dev_result_rem_cmp_b = {1'b0, reg_INNER_LOOP_1_modulo_dev_result_rem_cmp_b_63_0_cse};
  wire[7:0] INNER_LOOP_w_mux_5_nl;
  wire[0:0] INNER_LOOP_w_INNER_LOOP_w_and_nl;
  wire [8:0] nl_INNER_LOOP_1_w_rshift_rg_a;
  assign INNER_LOOP_w_mux_5_nl = MUX_v_8_2_2(INNER_LOOP_1_upper_and_psp_sva_mx0w0,
      INNER_LOOP_1_upper_and_psp_sva, and_dcpl_124);
  assign INNER_LOOP_w_INNER_LOOP_w_and_nl = (~ INNER_LOOP_upper_acc_psp_10_8_0_1_sva_0)
      & and_dcpl_124;
  assign nl_INNER_LOOP_1_w_rshift_rg_a = {INNER_LOOP_w_mux_5_nl , INNER_LOOP_w_INNER_LOOP_w_and_nl};
  wire [4:0] nl_INNER_LOOP_1_w_rshift_rg_s;
  assign nl_INNER_LOOP_1_w_rshift_rg_s = shift_4_0_sva;
  wire [4:0] nl_INNER_LOOP_1_w_lshift_rg_s;
  assign nl_INNER_LOOP_1_w_lshift_rg_s = shift_4_0_sva;
  wire [0:0] nl_stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_123_tr0;
  assign nl_stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_123_tr0 = INNER_LOOP_t_9_1_sva_1[8];
  wire [0:0] nl_stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_0_tr0;
  assign nl_stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_0_tr0 = ~ (z_out[22]);
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_obj (
      .ld(reg_xt_rsc_triosy_obj_ld_cse),
      .lz(xt_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_xt_rsc_triosy_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) g_rsc_triosy_obj (
      .ld(reg_xt_rsc_triosy_obj_ld_cse),
      .lz(g_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_obj (
      .ld(reg_xt_rsc_triosy_obj_ld_cse),
      .lz(twiddle_rsc_triosy_lz)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) INNER_LOOP_1_modulo_dev_result_rem_cmp (
      .a(nl_INNER_LOOP_1_modulo_dev_result_rem_cmp_a[64:0]),
      .b(nl_INNER_LOOP_1_modulo_dev_result_rem_cmp_b[64:0]),
      .z(INNER_LOOP_1_modulo_dev_result_rem_cmp_z)
    );
  mgc_shift_r_v5 #(.width_a(32'sd9),
  .signd_a(32'sd0),
  .width_s(32'sd5),
  .width_z(32'sd9)) INNER_LOOP_1_w_rshift_rg (
      .a(nl_INNER_LOOP_1_w_rshift_rg_a[8:0]),
      .s(nl_INNER_LOOP_1_w_rshift_rg_s[4:0]),
      .z(z_out_3)
    );
  mgc_shift_l_v5 #(.width_a(32'sd9),
  .signd_a(32'sd0),
  .width_s(32'sd5),
  .width_z(32'sd10)) INNER_LOOP_1_w_lshift_rg (
      .a(z_out_3),
      .s(nl_INNER_LOOP_1_w_lshift_rg_s[4:0]),
      .z(z_out_4)
    );
  stockham_DIT_core_wait_dp stockham_DIT_core_wait_dp_inst (
      .clk(clk),
      .yt_rsc_cgo_iro(mux_23_rmff),
      .yt_rsci_clken_d(yt_rsci_clken_d),
      .INNER_LOOP_1_b_rem_cmp_z(INNER_LOOP_1_b_rem_cmp_z),
      .yt_rsc_cgo(reg_yt_rsc_cgo_cse),
      .INNER_LOOP_1_b_rem_cmp_z_oreg(INNER_LOOP_1_b_rem_cmp_z_oreg)
    );
  stockham_DIT_core_core_fsm stockham_DIT_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .INNER_LOOP_C_123_tr0(nl_stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_123_tr0[0:0]),
      .OUTER_LOOP_C_0_tr0(nl_stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_0_tr0[0:0])
    );
  assign s_or_cse = and_dcpl_8 | and_dcpl_14;
  assign and_103_cse = (fsm_output[3:2]==2'b11);
  assign or_25_nl = (~ (fsm_output[6])) | y_1_sva | (~ y_3_sva);
  assign mux_21_nl = MUX_s_1_2_2(or_25_nl, or_tmp_13, fsm_output[0]);
  assign or_26_nl = (fsm_output[2]) | mux_21_nl;
  assign or_23_nl = (fsm_output[2]) | (fsm_output[6]) | y_1_sva | (~ y_3_sva);
  assign mux_22_nl = MUX_s_1_2_2(or_26_nl, or_23_nl, fsm_output[1]);
  assign nor_18_nl = ~((fsm_output[5:4]!=2'b00) | mux_22_nl);
  assign or_20_nl = (~ (fsm_output[4])) | (~ (fsm_output[1])) | (~ (fsm_output[2]))
      | (fsm_output[6]) | y_1_sva | (~ y_3_sva);
  assign or_18_nl = (fsm_output[0]) | (fsm_output[6]);
  assign mux_17_nl = MUX_s_1_2_2(not_tmp_28, or_18_nl, fsm_output[2]);
  assign mux_18_nl = MUX_s_1_2_2(nand_tmp, mux_17_nl, fsm_output[1]);
  assign mux_13_nl = MUX_s_1_2_2((fsm_output[6]), or_tmp_13, fsm_output[0]);
  assign mux_14_nl = MUX_s_1_2_2(not_tmp_28, mux_13_nl, fsm_output[2]);
  assign mux_16_nl = MUX_s_1_2_2(nand_tmp, mux_14_nl, fsm_output[1]);
  assign mux_19_nl = MUX_s_1_2_2(mux_18_nl, mux_16_nl, fsm_output[4]);
  assign nor_8_nl = ~(x_1_sva | (~ x_3_sva));
  assign mux_20_nl = MUX_s_1_2_2(or_20_nl, mux_19_nl, nor_8_nl);
  assign and_100_nl = (fsm_output[5]) & (~ mux_20_nl);
  assign mux_23_rmff = MUX_s_1_2_2(nor_18_nl, and_100_nl, fsm_output[3]);
  assign INNER_LOOP_1_b_rem_cmp_b = reg_INNER_LOOP_1_modulo_dev_result_rem_cmp_b_63_0_cse;
  assign modulo_dev_qelse_mux_1_cse = MUX_v_64_2_2((INNER_LOOP_1_modulo_dev_result_rem_cmp_z[63:0]),
      z_out_1, INNER_LOOP_1_modulo_dev_result_rem_cmp_z[63]);
  assign nl_INNER_LOOP_b_acc_1_nl = ({INNER_LOOP_1_upper_and_psp_sva_mx0w0 , 1'b0})
      + conv_u2s_8_9(INNER_LOOP_1_q_and_psp_sva_1);
  assign INNER_LOOP_b_acc_1_nl = nl_INNER_LOOP_b_acc_1_nl[8:0];
  assign nl_xt_rsci_adra_d_mx0w0_9_1 = INNER_LOOP_b_acc_1_nl + (s_10_0_sva[9:1]);
  assign xt_rsci_adra_d_mx0w0_9_1 = nl_xt_rsci_adra_d_mx0w0_9_1[8:0];
  assign nl_INNER_LOOP_1_acc_2_psp_mx0w0 = INNER_LOOP_1_acc_2_psp + INNER_LOOP_1_b_rem_cmp_z_oreg;
  assign INNER_LOOP_1_acc_2_psp_mx0w0 = nl_INNER_LOOP_1_acc_2_psp_mx0w0[63:0];
  assign INNER_LOOP_1_upper_and_psp_sva_mx0w0 = (~ (INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1[8:1]))
      & INNER_LOOP_1_upper_and_psp_sva;
  assign INNER_LOOP_1_q_and_psp_sva_1 = (INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1[8:1])
      & INNER_LOOP_1_upper_and_psp_sva;
  assign nl_INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1 = (s_10_0_sva[8:0]) + 9'b111111111;
  assign INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1 = nl_INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1[8:0];
  assign nl_INNER_LOOP_acc_psp_sva_1 = conv_u2u_8_9(INNER_LOOP_1_q_and_psp_sva_1)
      + conv_u2u_8_9(INNER_LOOP_1_upper_and_psp_sva_mx0w0);
  assign INNER_LOOP_acc_psp_sva_1 = nl_INNER_LOOP_acc_psp_sva_1[8:0];
  assign INNER_LOOP_b_INNER_LOOP_b_and_7 = y_1_sva & (~ y_3_sva);
  assign INNER_LOOP_b_INNER_LOOP_b_and_9 = y_3_sva & (~ y_1_sva);
  assign xor_dcpl = y_3_sva ^ y_1_sva;
  assign and_dcpl_3 = ~((fsm_output[0]) | (fsm_output[5]));
  assign and_dcpl_4 = and_dcpl_3 & (~ (fsm_output[6]));
  assign and_dcpl_5 = ~((fsm_output[1]) | (fsm_output[4]));
  assign and_dcpl_6 = ~((fsm_output[3:2]!=2'b00));
  assign and_dcpl_7 = and_dcpl_6 & and_dcpl_5;
  assign and_dcpl_8 = and_dcpl_7 & and_dcpl_4;
  assign and_dcpl_9 = (fsm_output[0]) & (fsm_output[5]);
  assign and_dcpl_10 = and_dcpl_9 & (fsm_output[6]);
  assign and_dcpl_13 = and_103_cse & (~ (fsm_output[1])) & (fsm_output[4]);
  assign and_dcpl_14 = and_dcpl_13 & and_dcpl_10;
  assign and_dcpl_15 = (fsm_output[0]) & (~ (fsm_output[5]));
  assign and_dcpl_17 = and_dcpl_7 & and_dcpl_15 & (~ (fsm_output[6]));
  assign and_dcpl_18 = (fsm_output[1]) & (~ (fsm_output[4]));
  assign and_dcpl_20 = and_dcpl_6 & and_dcpl_18 & and_dcpl_4;
  assign and_dcpl_21 = (~ (fsm_output[0])) & (fsm_output[5]);
  assign and_dcpl_22 = and_dcpl_21 & (~ (fsm_output[6]));
  assign and_dcpl_25 = and_dcpl_9 & (~ (fsm_output[6]));
  assign and_dcpl_26 = and_dcpl_13 & and_dcpl_25;
  assign and_dcpl_27 = (fsm_output[1]) & (fsm_output[4]);
  assign and_dcpl_28 = and_103_cse & and_dcpl_27;
  assign and_dcpl_29 = and_dcpl_28 & and_dcpl_22;
  assign and_dcpl_30 = and_dcpl_28 & and_dcpl_25;
  assign and_dcpl_31 = (fsm_output[3:2]==2'b10);
  assign and_dcpl_33 = and_dcpl_31 & and_dcpl_18 & and_dcpl_10;
  assign and_dcpl_35 = and_dcpl_31 & and_dcpl_27 & and_dcpl_10;
  assign or_tmp_5 = (fsm_output[2:1]!=2'b01);
  assign or_tmp_7 = (~ (fsm_output[4])) | (fsm_output[1]) | (~ (fsm_output[2]));
  assign or_tmp_10 = (fsm_output[4:1]!=4'b0000);
  assign or_tmp_11 = (fsm_output[4:1]!=4'b0001);
  assign mux_11_nl = MUX_s_1_2_2(or_tmp_11, or_tmp_10, fsm_output[0]);
  assign mux_tmp_12 = MUX_s_1_2_2((~ mux_11_nl), and_dcpl_28, fsm_output[5]);
  assign or_tmp_13 = (fsm_output[6]) | y_1_sva | (~ y_3_sva);
  assign not_tmp_28 = ~((fsm_output[0]) & (fsm_output[6]));
  assign mux_15_nl = MUX_s_1_2_2((fsm_output[6]), (~ (fsm_output[6])), fsm_output[0]);
  assign nand_tmp = ~((fsm_output[2]) & mux_15_nl);
  assign and_dcpl_51 = and_103_cse & and_dcpl_5 & and_dcpl_25;
  assign or_28_nl = (fsm_output[2:1]!=2'b10);
  assign mux_tmp_24 = MUX_s_1_2_2(or_28_nl, or_tmp_5, fsm_output[6]);
  assign and_dcpl_54 = (~ mux_tmp_24) & (fsm_output[3]);
  assign and_dcpl_64 = and_dcpl_54 & (fsm_output[4]) & (fsm_output[0]) & (~ (fsm_output[5]));
  assign nor_tmp_10 = ((fsm_output[2:1]!=2'b00)) & (fsm_output[3]);
  assign or_tmp_27 = (fsm_output[4]) | and_103_cse;
  assign or_30_nl = (fsm_output[4]) | nor_tmp_10;
  assign mux_tmp_25 = MUX_s_1_2_2(or_tmp_27, or_30_nl, fsm_output[0]);
  assign nor_tmp_11 = (fsm_output[4:2]==3'b111);
  assign and_dcpl_67 = ~((~((fsm_output[1]) ^ (fsm_output[6]))) | (fsm_output[2]));
  assign and_dcpl_68 = ~((fsm_output[4:3]!=2'b00));
  assign mux_33_nl = MUX_s_1_2_2(and_dcpl_7, and_dcpl_28, fsm_output[5]);
  assign and_dcpl_80 = ~(mux_33_nl | (fsm_output[6]));
  assign not_tmp_43 = ~((fsm_output[5:1]!=5'b00000));
  assign or_dcpl_4 = (~ (fsm_output[0])) | (fsm_output[5]);
  assign or_dcpl_5 = or_dcpl_4 | (fsm_output[6]);
  assign or_dcpl_6 = or_tmp_10 | or_dcpl_5;
  assign and_dcpl_84 = (fsm_output[0]) & (~ (fsm_output[6]));
  assign nor_20_nl = ~((fsm_output[4:2]!=3'b000));
  assign mux_40_nl = MUX_s_1_2_2(nor_20_nl, nor_tmp_11, fsm_output[5]);
  assign and_dcpl_86 = mux_40_nl & (fsm_output[1]);
  assign xt_rsci_adra_d_mx0c2 = and_103_cse & and_dcpl_18 & and_dcpl_22;
  assign drf_y_smx_lpi_3_dfm_mx0c = and_dcpl_68 & and_dcpl_3 & and_dcpl_67;
  assign INNER_LOOP_1_acc_2_psp_mx0c0 = and_dcpl_86 & and_dcpl_84 & y_3_sva & (~
      y_1_sva);
  assign INNER_LOOP_1_acc_2_psp_mx0c1 = and_dcpl_86 & and_dcpl_84 & ((~ y_3_sva)
      | y_1_sva);
  assign INNER_LOOP_a_or_2_nl = xt_rsci_adra_d_mx0c2 | and_dcpl_33;
  assign INNER_LOOP_a_mux1h_nl = MUX1HOT_v_9_7_2(xt_rsci_adra_d_mx0w0_9_1, ({INNER_LOOP_a_acc_psp_2_sva
      , INNER_LOOP_a_slc_INNER_LOOP_1_q_and_psp_0_1_itm}), INNER_LOOP_acc_psp_sva,
      (INNER_LOOP_acc_tdx_1_9_0_1_sva[9:1]), INNER_LOOP_a_acc_psp_sva, (pref_y_idx_pref_9_0_sva[9:1]),
      (INNER_LOOP_acc_tdx_1_9_0_sva[9:1]), {and_dcpl_17 , and_dcpl_20 , INNER_LOOP_a_or_2_nl
      , and_dcpl_26 , and_dcpl_29 , and_dcpl_30 , and_dcpl_35});
  assign INNER_LOOP_a_mux1h_9_nl = MUX1HOT_s_1_5_2((s_10_0_sva[0]), (INNER_LOOP_acc_tdx_1_9_0_1_sva[0]),
      INNER_LOOP_upper_slc_INNER_LOOP_upper_acc_psp_10_8_0_1_0_2_itm, (pref_y_idx_pref_9_0_sva[0]),
      (INNER_LOOP_acc_tdx_1_9_0_sva[0]), {and_dcpl_17 , and_dcpl_26 , and_dcpl_29
      , and_dcpl_30 , and_dcpl_35});
  assign INNER_LOOP_a_or_nl = (INNER_LOOP_a_mux1h_9_nl & (~(and_dcpl_20 | xt_rsci_adra_d_mx0c2)))
      | and_dcpl_33;
  assign xt_rsci_adra_d = {INNER_LOOP_a_mux1h_nl , INNER_LOOP_a_or_nl};
  assign mux_8_nl = MUX_s_1_2_2(or_tmp_7, or_tmp_5, fsm_output[6]);
  assign and_39_nl = (~ mux_8_nl) & (fsm_output[3]) & (fsm_output[0]) & (fsm_output[5]);
  assign xt_rsci_da_d = MUX_v_64_2_2(INNER_LOOP_1_acc_2_psp, modulo_dev_qelse_mux_1_cse,
      and_39_nl);
  assign or_13_nl = (fsm_output[4]) | (~((fsm_output[2:1]==2'b11)));
  assign mux_9_nl = MUX_s_1_2_2(or_13_nl, or_tmp_7, fsm_output[0]);
  assign or_12_nl = (fsm_output[2:0]!=3'b011);
  assign mux_10_nl = MUX_s_1_2_2(mux_9_nl, or_12_nl, fsm_output[6]);
  assign xt_rsci_wea_d_pff = (~ mux_10_nl) & (fsm_output[3]) & (fsm_output[5]) &
      (~ x_3_sva) & x_1_sva;
  assign xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = mux_tmp_12 & (~ (fsm_output[6]))
      & (~ y_3_sva) & y_1_sva;
  assign twiddle_rsci_adrb_d = z_out_4;
  assign twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d = ~((~ and_dcpl_6) | (~((fsm_output[1])
      ^ (fsm_output[0]))) | (fsm_output[6:4]!=3'b000));
  assign yt_rsci_d_d = modulo_dev_qelse_mux_1_cse;
  assign INNER_LOOP_a_mux1h_2_nl = MUX1HOT_v_9_4_2(xt_rsci_adra_d_mx0w0_9_1, ({INNER_LOOP_a_acc_psp_2_sva
      , INNER_LOOP_a_slc_INNER_LOOP_1_q_and_psp_0_1_itm}), INNER_LOOP_a_acc_psp_sva,
      (pref_y_idx_pref_9_0_sva[9:1]), {and_dcpl_17 , and_dcpl_20 , and_dcpl_29 ,
      and_dcpl_30});
  assign INNER_LOOP_a_mux1h_10_nl = MUX1HOT_s_1_3_2((s_10_0_sva[0]), INNER_LOOP_upper_slc_INNER_LOOP_upper_acc_psp_10_8_0_1_0_2_itm,
      (pref_y_idx_pref_9_0_sva[0]), {and_dcpl_17 , and_dcpl_29 , and_dcpl_30});
  assign INNER_LOOP_a_and_nl = INNER_LOOP_a_mux1h_10_nl & (~ and_dcpl_20);
  assign yt_rsci_radr_d = {INNER_LOOP_a_mux1h_2_nl , INNER_LOOP_a_and_nl};
  assign INNER_LOOP_a_or_1_nl = and_dcpl_51 | and_dcpl_33;
  assign INNER_LOOP_a_mux1h_3_nl = MUX1HOT_v_9_3_2(INNER_LOOP_acc_psp_sva, (INNER_LOOP_acc_tdx_1_9_0_1_sva[9:1]),
      (INNER_LOOP_acc_tdx_1_9_0_sva[9:1]), {INNER_LOOP_a_or_1_nl , and_dcpl_26 ,
      and_dcpl_35});
  assign INNER_LOOP_a_mux_1_nl = MUX_s_1_2_2((INNER_LOOP_acc_tdx_1_9_0_1_sva[0]),
      (INNER_LOOP_acc_tdx_1_9_0_sva[0]), and_dcpl_35);
  assign INNER_LOOP_a_INNER_LOOP_a_or_nl = (INNER_LOOP_a_mux_1_nl & (~ and_dcpl_51))
      | and_dcpl_33;
  assign yt_rsci_wadr_d = {INNER_LOOP_a_mux1h_3_nl , INNER_LOOP_a_INNER_LOOP_a_or_nl};
  assign yt_rsci_we_d_pff = and_dcpl_54 & and_dcpl_9 & x_3_sva & (~ x_1_sva);
  assign yt_rsci_readA_r_ram_ir_internal_RMASK_B_d = mux_tmp_12 & (~ (fsm_output[6]))
      & y_3_sva & (~ y_1_sva);
  assign and_dcpl_100 = (fsm_output==7'b1111101);
  assign nor_37_nl = ~((fsm_output[6]) | (~ (fsm_output[2])));
  assign nor_38_nl = ~((~ (fsm_output[6])) | (fsm_output[2]));
  assign not_tmp_59 = MUX_s_1_2_2(nor_37_nl, nor_38_nl, fsm_output[1]);
  assign and_dcpl_107 = not_tmp_59 & (~ (fsm_output[5])) & (fsm_output[3]) & (fsm_output[4])
      & (fsm_output[0]);
  assign nor_36_cse = ~((fsm_output[5:4]!=2'b00));
  assign and_dcpl_115 = and_dcpl_6 & nor_36_cse & (fsm_output[0]) & (~ (fsm_output[6]))
      & (~ (fsm_output[1]));
  assign and_dcpl_124 = and_dcpl_6 & nor_36_cse & (~ (fsm_output[0])) & (~ (fsm_output[6]))
      & (fsm_output[1]);
  always @(posedge clk) begin
    if ( s_or_cse ) begin
      s_10_0_sva <= MUX_v_11_2_2(11'b01000000000, (signext_11_10(s_10_0_sva[10:1])),
          and_dcpl_14);
      OUTER_LOOP_nn_30_sva <= OUTER_LOOP_nn_29_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_29_sva <= OUTER_LOOP_nn_28_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_28_sva <= OUTER_LOOP_nn_27_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_27_sva <= OUTER_LOOP_nn_26_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_26_sva <= OUTER_LOOP_nn_25_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_25_sva <= OUTER_LOOP_nn_24_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_24_sva <= OUTER_LOOP_nn_23_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_23_sva <= OUTER_LOOP_nn_22_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_22_sva <= OUTER_LOOP_nn_21_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_21_sva <= OUTER_LOOP_nn_20_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_20_sva <= OUTER_LOOP_nn_19_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_19_sva <= OUTER_LOOP_nn_18_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_18_sva <= OUTER_LOOP_nn_17_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_17_sva <= OUTER_LOOP_nn_16_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_16_sva <= OUTER_LOOP_nn_15_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_15_sva <= OUTER_LOOP_nn_14_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_14_sva <= OUTER_LOOP_nn_13_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_13_sva <= OUTER_LOOP_nn_12_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_12_sva <= OUTER_LOOP_nn_11_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_11_sva <= OUTER_LOOP_nn_10_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_10_sva <= OUTER_LOOP_nn_9_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_9_sva <= OUTER_LOOP_nn_8_sva & (~ and_dcpl_8);
      shift_4_0_sva <= MUX_v_5_2_2(5'b01001, OUTER_LOOP_acc_1_nl, and_dcpl_14);
      OUTER_LOOP_nn_8_sva <= OUTER_LOOP_nn_7_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_7_sva <= OUTER_LOOP_nn_6_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_6_sva <= OUTER_LOOP_nn_5_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_5_sva <= OUTER_LOOP_nn_4_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_4_sva <= OUTER_LOOP_nn_3_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_3_sva <= OUTER_LOOP_nn_2_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_2_sva <= OUTER_LOOP_nn_1_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_1_sva <= OUTER_LOOP_nn_0_sva & (~ and_dcpl_8);
      OUTER_LOOP_nn_0_sva <= and_dcpl_8;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      x_3_sva <= 1'b0;
      x_1_sva <= 1'b0;
      y_1_sva <= 1'b0;
      y_3_sva <= 1'b0;
    end
    else if ( s_or_cse ) begin
      x_3_sva <= y_3_sva | and_dcpl_8;
      x_1_sva <= y_1_sva & (~ and_dcpl_8);
      y_1_sva <= x_1_sva | and_dcpl_8;
      y_3_sva <= x_3_sva & (~ and_dcpl_8);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_nl, and_nl, fsm_output[6]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_yt_rsc_cgo_cse <= 1'b0;
      reg_xt_rsc_triosy_obj_ld_cse <= 1'b0;
    end
    else begin
      reg_yt_rsc_cgo_cse <= mux_23_rmff;
      reg_xt_rsc_triosy_obj_ld_cse <= and_dcpl_13 & and_dcpl_9 & (fsm_output[6])
          & (~ (z_out[22]));
    end
  end
  always @(posedge clk) begin
    INNER_LOOP_1_modulo_dev_result_rem_cmp_a_63_0 <= MUX1HOT_v_64_3_2(INNER_LOOP_1_acc_2_psp_mx0w0,
        INNER_LOOP_1_acc_2_psp, INNER_LOOP_1_acc_5_itm, {and_dcpl_64 , (~ mux_29_nl)
        , and_67_nl});
    reg_INNER_LOOP_1_modulo_dev_result_rem_cmp_b_63_0_cse <= p_sva;
    INNER_LOOP_1_b_rem_cmp_a <= MUX1HOT_v_128_3_2(z_out_2, INNER_LOOP_1_b_mul_mut,
        INNER_LOOP_2_b_mul_mut, {and_71_nl , nor_29_nl , and_75_nl});
    INNER_LOOP_1_upper_and_psp_sva <= MUX_v_8_2_2(8'b00000000, INNER_LOOP_upper_mux_1_nl,
        or_nl);
    INNER_LOOP_upper_acc_psp_10_8_0_1_sva_0 <= INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1[0];
  end
  always @(posedge clk) begin
    if ( ((~ INNER_LOOP_b_nor_itm) | INNER_LOOP_b_INNER_LOOP_b_and_7 | INNER_LOOP_b_INNER_LOOP_b_and_9)
        & drf_y_smx_lpi_3_dfm_mx0c ) begin
      drf_y_smx_lpi_3_dfm <= MUX_v_64_2_2(xt_rsci_qa_d, yt_rsci_q_d, INNER_LOOP_b_and_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( xor_dcpl ) begin
      INNER_LOOP_a_slc_INNER_LOOP_1_q_and_psp_0_1_itm <= INNER_LOOP_1_q_and_psp_sva_1[0];
      INNER_LOOP_a_acc_psp_2_sva <= nl_INNER_LOOP_a_acc_psp_2_sva[7:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ and_dcpl_80 ) begin
      INNER_LOOP_upper_slc_INNER_LOOP_upper_acc_psp_10_8_0_1_0_2_itm <= INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1[0];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(not_tmp_43, and_82_nl, fsm_output[6]) ) begin
      INNER_LOOP_acc_psp_sva <= INNER_LOOP_acc_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( mux_36_nl | (fsm_output[6]) ) begin
      INNER_LOOP_acc_tdx_1_9_0_1_sva <= nl_INNER_LOOP_acc_tdx_1_9_0_1_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ and_dcpl_80 ) begin
      INNER_LOOP_a_acc_psp_sva <= nl_INNER_LOOP_a_acc_psp_sva[8:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_37_nl | (fsm_output[6]) ) begin
      pref_y_idx_pref_9_0_sva <= nl_pref_y_idx_pref_9_0_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(not_tmp_43, and_86_nl, fsm_output[6]) ) begin
      INNER_LOOP_acc_tdx_1_9_0_sva <= nl_INNER_LOOP_acc_tdx_1_9_0_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_t_9_1_sva_1 <= 9'b000000000;
    end
    else if ( ~ or_dcpl_6 ) begin
      INNER_LOOP_t_9_1_sva_1 <= nl_INNER_LOOP_t_9_1_sva_1[8:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_b_nor_itm <= 1'b0;
    end
    else if ( ~ or_dcpl_6 ) begin
      INNER_LOOP_b_nor_itm <= ~(INNER_LOOP_b_INNER_LOOP_b_and_7 | INNER_LOOP_b_INNER_LOOP_b_and_9);
    end
  end
  always @(posedge clk) begin
    if ( ~((fsm_output[6:1]!=6'b000001)) ) begin
      INNER_LOOP_w_asn_2_itm <= twiddle_rsci_qb_d;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_tmp_11 | or_dcpl_5) ) begin
      INNER_LOOP_1_b_mul_mut <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( INNER_LOOP_1_acc_2_psp_mx0c0 | INNER_LOOP_1_acc_2_psp_mx0c1 | and_dcpl_64
        | and_dcpl_51 ) begin
      INNER_LOOP_1_acc_2_psp <= MUX1HOT_v_64_4_2(yt_rsci_q_d, xt_rsci_qa_d, INNER_LOOP_1_acc_2_psp_mx0w0,
          modulo_dev_qelse_mux_1_cse, {INNER_LOOP_1_acc_2_psp_mx0c0 , INNER_LOOP_1_acc_2_psp_mx0c1
          , and_dcpl_64 , and_dcpl_51});
    end
  end
  always @(posedge clk) begin
    if ( ~((fsm_output[4:3]!=2'b11) | or_dcpl_4 | mux_tmp_24) ) begin
      INNER_LOOP_1_acc_5_itm <= z_out_1;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_tmp_10 | or_dcpl_4 | (~ (fsm_output[6]))) ) begin
      INNER_LOOP_2_b_mul_mut <= z_out_2;
    end
  end
  assign nl_OUTER_LOOP_acc_1_nl = shift_4_0_sva + 5'b11111;
  assign OUTER_LOOP_acc_1_nl = nl_OUTER_LOOP_acc_1_nl[4:0];
  assign nor_nl = ~((fsm_output[5:0]!=6'b000000));
  assign and_nl = (fsm_output[5:1]==5'b11111);
  assign or_32_nl = (fsm_output[4]) | ((fsm_output[3:1]==3'b111));
  assign mux_27_nl = MUX_s_1_2_2(or_32_nl, or_tmp_27, fsm_output[0]);
  assign mux_28_nl = MUX_s_1_2_2((~ and_dcpl_28), mux_27_nl, fsm_output[5]);
  assign mux_26_nl = MUX_s_1_2_2((~ nor_tmp_11), mux_tmp_25, fsm_output[5]);
  assign mux_29_nl = MUX_s_1_2_2(mux_28_nl, mux_26_nl, fsm_output[6]);
  assign and_95_nl = ((fsm_output[1:0]!=2'b00)) & (fsm_output[2]);
  assign or_33_nl = ((fsm_output[1:0]==2'b11)) | (fsm_output[2]);
  assign mux_30_nl = MUX_s_1_2_2(and_95_nl, or_33_nl, fsm_output[6]);
  assign and_67_nl = ((mux_30_nl & (fsm_output[3])) ^ (fsm_output[4])) & (fsm_output[5]);
  assign and_71_nl = and_dcpl_68 & and_dcpl_15 & and_dcpl_67;
  assign mux_31_nl = MUX_s_1_2_2(and_dcpl_6, and_103_cse, fsm_output[4]);
  assign nor_29_nl = ~(mux_31_nl | (fsm_output[6:5]!=2'b00));
  assign nor_17_nl = ~((fsm_output[3:1]!=3'b000));
  assign mux_32_nl = MUX_s_1_2_2(nor_17_nl, nor_tmp_10, fsm_output[4]);
  assign and_75_nl = (~ mux_32_nl) & (fsm_output[6:5]==2'b10);
  assign and_79_nl = and_dcpl_13 & and_dcpl_21 & (fsm_output[6]);
  assign INNER_LOOP_upper_mux_1_nl = MUX_v_8_2_2(INNER_LOOP_1_upper_and_psp_sva_mx0w0,
      (INNER_LOOP_t_9_1_sva_1[7:0]), and_79_nl);
  assign or_64_nl = (fsm_output[5]) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[2])
      | (fsm_output[3]);
  assign nand_6_nl = ~((fsm_output[5]) & (fsm_output[0]) & (fsm_output[4]) & (fsm_output[2])
      & (fsm_output[3]));
  assign mux_6_nl = MUX_s_1_2_2(or_64_nl, nand_6_nl, fsm_output[6]);
  assign or_nl = mux_6_nl | (fsm_output[1]);
  assign INNER_LOOP_b_and_1_nl = INNER_LOOP_b_INNER_LOOP_b_and_9 & drf_y_smx_lpi_3_dfm_mx0c;
  assign nl_INNER_LOOP_a_acc_psp_2_sva  = conv_u2u_7_8(INNER_LOOP_1_q_and_psp_sva_1[7:1])
      + INNER_LOOP_1_upper_and_psp_sva_mx0w0;
  assign and_82_nl = (fsm_output[5]) & mux_tmp_25;
  assign nl_INNER_LOOP_acc_tdx_1_9_0_1_sva  = ({INNER_LOOP_acc_psp_sva_1 , 1'b0})
      + (z_out_2[9:0]);
  assign mux_35_nl = MUX_s_1_2_2(and_dcpl_28, nor_tmp_11, fsm_output[0]);
  assign mux_36_nl = MUX_s_1_2_2(and_dcpl_7, mux_35_nl, fsm_output[5]);
  assign nl_INNER_LOOP_a_acc_psp_sva  = conv_u2u_8_9(INNER_LOOP_1_q_and_psp_sva_1)
      + ({INNER_LOOP_1_upper_and_psp_sva_mx0w0 , (~ (INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1[0]))});
  assign nl_pref_y_idx_pref_9_0_sva  = (z_out[9:0]) + (s_10_0_sva[9:0]);
  assign and_94_nl = (fsm_output[4:0]==5'b11111);
  assign mux_37_nl = MUX_s_1_2_2(and_dcpl_7, and_94_nl, fsm_output[5]);
  assign nl_INNER_LOOP_acc_tdx_1_9_0_sva  = ({INNER_LOOP_acc_psp_sva_1 , 1'b1}) +
      (z_out_2[9:0]);
  assign and_85_nl = (fsm_output[4]) & nor_tmp_10;
  assign mux_38_nl = MUX_s_1_2_2(nor_tmp_11, and_85_nl, fsm_output[0]);
  assign and_86_nl = (fsm_output[5]) & mux_38_nl;
  assign nl_INNER_LOOP_t_9_1_sva_1  = conv_u2s_8_9(INNER_LOOP_1_upper_and_psp_sva)
      + 9'b000000001;
  assign INNER_LOOP_b_INNER_LOOP_b_and_23_nl = OUTER_LOOP_nn_30_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_24_nl = OUTER_LOOP_nn_29_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_25_nl = OUTER_LOOP_nn_28_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_26_nl = OUTER_LOOP_nn_27_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_27_nl = OUTER_LOOP_nn_26_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_28_nl = OUTER_LOOP_nn_25_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_29_nl = OUTER_LOOP_nn_24_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_30_nl = OUTER_LOOP_nn_23_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_31_nl = OUTER_LOOP_nn_22_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_32_nl = OUTER_LOOP_nn_21_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_33_nl = OUTER_LOOP_nn_20_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_34_nl = OUTER_LOOP_nn_19_sva & and_dcpl_100;
  assign INNER_LOOP_b_mux_14_nl = MUX_s_1_2_2((INNER_LOOP_1_upper_and_psp_sva_mx0w0[7]),
      OUTER_LOOP_nn_18_sva, and_dcpl_100);
  assign INNER_LOOP_b_mux_15_nl = MUX_s_1_2_2((INNER_LOOP_1_upper_and_psp_sva_mx0w0[6]),
      OUTER_LOOP_nn_17_sva, and_dcpl_100);
  assign INNER_LOOP_b_mux_16_nl = MUX_s_1_2_2((INNER_LOOP_1_upper_and_psp_sva_mx0w0[5]),
      OUTER_LOOP_nn_16_sva, and_dcpl_100);
  assign INNER_LOOP_b_mux_17_nl = MUX_s_1_2_2((INNER_LOOP_1_upper_and_psp_sva_mx0w0[4]),
      OUTER_LOOP_nn_15_sva, and_dcpl_100);
  assign INNER_LOOP_b_mux_18_nl = MUX_s_1_2_2((INNER_LOOP_1_upper_and_psp_sva_mx0w0[3]),
      OUTER_LOOP_nn_14_sva, and_dcpl_100);
  assign INNER_LOOP_b_mux_19_nl = MUX_s_1_2_2((INNER_LOOP_1_upper_and_psp_sva_mx0w0[2]),
      OUTER_LOOP_nn_13_sva, and_dcpl_100);
  assign INNER_LOOP_b_mux_20_nl = MUX_s_1_2_2((INNER_LOOP_1_upper_and_psp_sva_mx0w0[1]),
      OUTER_LOOP_nn_12_sva, and_dcpl_100);
  assign INNER_LOOP_b_mux_21_nl = MUX_s_1_2_2((INNER_LOOP_1_upper_and_psp_sva_mx0w0[0]),
      OUTER_LOOP_nn_11_sva, and_dcpl_100);
  assign INNER_LOOP_b_INNER_LOOP_b_and_35_nl = OUTER_LOOP_nn_10_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_and_36_nl = OUTER_LOOP_nn_9_sva & and_dcpl_100;
  assign INNER_LOOP_b_INNER_LOOP_b_nor_1_nl = ~((INNER_LOOP_upper_acc_psp_10_8_0_1_sva_1[0])
      | and_dcpl_100);
  assign INNER_LOOP_b_INNER_LOOP_b_or_1_nl = MUX_v_8_2_2(INNER_LOOP_1_q_and_psp_sva_1,
      8'b11111111, and_dcpl_100);
  assign nl_acc_nl = conv_u2u_23_24({INNER_LOOP_b_INNER_LOOP_b_and_23_nl , INNER_LOOP_b_INNER_LOOP_b_and_24_nl
      , INNER_LOOP_b_INNER_LOOP_b_and_25_nl , INNER_LOOP_b_INNER_LOOP_b_and_26_nl
      , INNER_LOOP_b_INNER_LOOP_b_and_27_nl , INNER_LOOP_b_INNER_LOOP_b_and_28_nl
      , INNER_LOOP_b_INNER_LOOP_b_and_29_nl , INNER_LOOP_b_INNER_LOOP_b_and_30_nl
      , INNER_LOOP_b_INNER_LOOP_b_and_31_nl , INNER_LOOP_b_INNER_LOOP_b_and_32_nl
      , INNER_LOOP_b_INNER_LOOP_b_and_33_nl , INNER_LOOP_b_INNER_LOOP_b_and_34_nl
      , INNER_LOOP_b_mux_14_nl , INNER_LOOP_b_mux_15_nl , INNER_LOOP_b_mux_16_nl
      , INNER_LOOP_b_mux_17_nl , INNER_LOOP_b_mux_18_nl , INNER_LOOP_b_mux_19_nl
      , INNER_LOOP_b_mux_20_nl , INNER_LOOP_b_mux_21_nl , INNER_LOOP_b_INNER_LOOP_b_and_35_nl
      , INNER_LOOP_b_INNER_LOOP_b_and_36_nl , INNER_LOOP_b_INNER_LOOP_b_nor_1_nl})
      + conv_s2u_11_24({and_dcpl_100 , INNER_LOOP_b_INNER_LOOP_b_or_1_nl , 2'b11});
  assign acc_nl = nl_acc_nl[23:0];
  assign z_out = readslicef_24_23_1(acc_nl);
  assign modulo_dev_qelse_mux_3_nl = MUX_v_64_2_2((INNER_LOOP_1_modulo_dev_result_rem_cmp_z[63:0]),
      INNER_LOOP_1_acc_2_psp, and_dcpl_107);
  assign modulo_dev_qelse_or_1_nl = (~(not_tmp_59 & (fsm_output[5]) & (fsm_output[3])
      & (fsm_output[0]))) | and_dcpl_107;
  assign modulo_dev_qelse_mux_4_nl = MUX_v_64_2_2(p_sva, (~ INNER_LOOP_1_b_rem_cmp_z_oreg),
      and_dcpl_107);
  assign nl_acc_1_nl = ({modulo_dev_qelse_mux_3_nl , modulo_dev_qelse_or_1_nl}) +
      ({modulo_dev_qelse_mux_4_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[64:0];
  assign z_out_1 = readslicef_65_64_1(acc_1_nl);
  assign INNER_LOOP_b_mux_22_nl = MUX_v_64_2_2(drf_y_smx_lpi_3_dfm, (signext_64_10(s_10_0_sva[9:0])),
      and_dcpl_115);
  assign INNER_LOOP_b_mux_23_nl = MUX_v_64_2_2(INNER_LOOP_w_asn_2_itm, (signext_64_10({OUTER_LOOP_nn_9_sva
      , OUTER_LOOP_nn_8_sva , OUTER_LOOP_nn_7_sva , OUTER_LOOP_nn_6_sva , OUTER_LOOP_nn_5_sva
      , OUTER_LOOP_nn_4_sva , OUTER_LOOP_nn_3_sva , OUTER_LOOP_nn_2_sva , OUTER_LOOP_nn_1_sva
      , OUTER_LOOP_nn_0_sva})), and_dcpl_115);
  assign z_out_2 = conv_u2u_128_128(INNER_LOOP_b_mux_22_nl * INNER_LOOP_b_mux_23_nl);

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


  function automatic [127:0] MUX1HOT_v_128_3_2;
    input [127:0] input_2;
    input [127:0] input_1;
    input [127:0] input_0;
    input [2:0] sel;
    reg [127:0] result;
  begin
    result = input_0 & {128{sel[0]}};
    result = result | ( input_1 & {128{sel[1]}});
    result = result | ( input_2 & {128{sel[2]}});
    MUX1HOT_v_128_3_2 = result;
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


  function automatic [8:0] MUX1HOT_v_9_7_2;
    input [8:0] input_6;
    input [8:0] input_5;
    input [8:0] input_4;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [6:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    result = result | ( input_3 & {9{sel[3]}});
    result = result | ( input_4 & {9{sel[4]}});
    result = result | ( input_5 & {9{sel[5]}});
    result = result | ( input_6 & {9{sel[6]}});
    MUX1HOT_v_9_7_2 = result;
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


  function automatic [4:0] MUX_v_5_2_2;
    input [4:0] input_0;
    input [4:0] input_1;
    input [0:0] sel;
    reg [4:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_5_2_2 = result;
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


  function automatic [22:0] readslicef_24_23_1;
    input [23:0] vector;
    reg [23:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_24_23_1 = tmp[22:0];
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


  function automatic [10:0] signext_11_10;
    input [9:0] vector;
  begin
    signext_11_10= {{1{vector[9]}}, vector};
  end
  endfunction


  function automatic [63:0] signext_64_10;
    input [9:0] vector;
  begin
    signext_64_10= {{54{vector[9]}}, vector};
  end
  endfunction


  function automatic [23:0] conv_s2u_11_24 ;
    input [10:0]  vector ;
  begin
    conv_s2u_11_24 = {{13{vector[10]}}, vector};
  end
  endfunction


  function automatic [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
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


  function automatic [23:0] conv_u2u_23_24 ;
    input [22:0]  vector ;
  begin
    conv_u2u_23_24 = {1'b0, vector};
  end
  endfunction


  function automatic [127:0] conv_u2u_128_128 ;
    input [127:0]  vector ;
  begin
    conv_u2u_128_128 = vector;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_DIT
// ------------------------------------------------------------------


module stockham_DIT (
  clk, rst, xt_rsc_adra, xt_rsc_da, xt_rsc_wea, xt_rsc_qa, xt_rsc_triosy_lz, p_rsc_dat,
      p_rsc_triosy_lz, g_rsc_dat, g_rsc_triosy_lz, twiddle_rsc_adrb, twiddle_rsc_qb,
      twiddle_rsc_triosy_lz
);
  input clk;
  input rst;
  output [9:0] xt_rsc_adra;
  output [63:0] xt_rsc_da;
  output xt_rsc_wea;
  input [63:0] xt_rsc_qa;
  output xt_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] g_rsc_dat;
  output g_rsc_triosy_lz;
  output [9:0] twiddle_rsc_adrb;
  input [63:0] twiddle_rsc_qb;
  output twiddle_rsc_triosy_lz;


  // Interconnect Declarations
  wire [9:0] xt_rsci_adra_d;
  wire [63:0] xt_rsci_da_d;
  wire [63:0] xt_rsci_qa_d;
  wire xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [9:0] twiddle_rsci_adrb_d;
  wire [63:0] twiddle_rsci_qb_d;
  wire twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  wire yt_rsci_clken_d;
  wire [63:0] yt_rsci_d_d;
  wire [63:0] yt_rsci_q_d;
  wire [9:0] yt_rsci_radr_d;
  wire [9:0] yt_rsci_wadr_d;
  wire yt_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire [127:0] INNER_LOOP_1_b_rem_cmp_a;
  wire [63:0] INNER_LOOP_1_b_rem_cmp_b;
  wire [63:0] INNER_LOOP_1_b_rem_cmp_z;
  wire yt_rsc_clken;
  wire [63:0] yt_rsc_q;
  wire [9:0] yt_rsc_radr;
  wire yt_rsc_we;
  wire [63:0] yt_rsc_d;
  wire [9:0] yt_rsc_wadr;
  wire xt_rsci_wea_d_iff;
  wire yt_rsci_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  mgc_rem #(.width_a(32'sd128),
  .width_b(32'sd64),
  .signd(32'sd0)) INNER_LOOP_1_b_rem_cmp (
      .a(INNER_LOOP_1_b_rem_cmp_a),
      .b(INNER_LOOP_1_b_rem_cmp_b),
      .z(INNER_LOOP_1_b_rem_cmp_z)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd10),
  .data_width(32'sd64),
  .depth(32'sd1024),
  .latency(32'sd1)) yt_rsc_comp (
      .clk(clk),
      .clken(yt_rsc_clken),
      .d(yt_rsc_d),
      .q(yt_rsc_q),
      .radr(yt_rsc_radr),
      .wadr(yt_rsc_wadr),
      .we(yt_rsc_we)
    );
  stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen
      xt_rsci (
      .qa(xt_rsc_qa),
      .wea(xt_rsc_wea),
      .da(xt_rsc_da),
      .adra(xt_rsc_adra),
      .adra_d(xt_rsci_adra_d),
      .da_d(xt_rsci_da_d),
      .qa_d(xt_rsci_qa_d),
      .wea_d(xt_rsci_wea_d_iff),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsci_wea_d_iff)
    );
  stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen twiddle_rsci
      (
      .qb(twiddle_rsc_qb),
      .adrb(twiddle_rsc_adrb),
      .adrb_d(twiddle_rsci_adrb_d),
      .qb_d(twiddle_rsci_qb_d),
      .readB_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d)
    );
  stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen yt_rsci
      (
      .clken(yt_rsc_clken),
      .q(yt_rsc_q),
      .radr(yt_rsc_radr),
      .we(yt_rsc_we),
      .d(yt_rsc_d),
      .wadr(yt_rsc_wadr),
      .clken_d(yt_rsci_clken_d),
      .d_d(yt_rsci_d_d),
      .q_d(yt_rsci_q_d),
      .radr_d(yt_rsci_radr_d),
      .wadr_d(yt_rsci_wadr_d),
      .we_d(yt_rsci_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsci_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  stockham_DIT_core stockham_DIT_core_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_triosy_lz(xt_rsc_triosy_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .g_rsc_triosy_lz(g_rsc_triosy_lz),
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .xt_rsci_adra_d(xt_rsci_adra_d),
      .xt_rsci_da_d(xt_rsci_da_d),
      .xt_rsci_qa_d(xt_rsci_qa_d),
      .xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_rsci_adrb_d(twiddle_rsci_adrb_d),
      .twiddle_rsci_qb_d(twiddle_rsci_qb_d),
      .twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d),
      .yt_rsci_clken_d(yt_rsci_clken_d),
      .yt_rsci_d_d(yt_rsci_d_d),
      .yt_rsci_q_d(yt_rsci_q_d),
      .yt_rsci_radr_d(yt_rsci_radr_d),
      .yt_rsci_wadr_d(yt_rsci_wadr_d),
      .yt_rsci_readA_r_ram_ir_internal_RMASK_B_d(yt_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .INNER_LOOP_1_b_rem_cmp_a(INNER_LOOP_1_b_rem_cmp_a),
      .INNER_LOOP_1_b_rem_cmp_b(INNER_LOOP_1_b_rem_cmp_b),
      .INNER_LOOP_1_b_rem_cmp_z(INNER_LOOP_1_b_rem_cmp_z),
      .xt_rsci_wea_d_pff(xt_rsci_wea_d_iff),
      .yt_rsci_we_d_pff(yt_rsci_we_d_iff)
    );
endmodule



