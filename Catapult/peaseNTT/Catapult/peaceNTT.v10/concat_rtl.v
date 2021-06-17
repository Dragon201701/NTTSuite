
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
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Wed Jun 16 22:32:32 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen (
  we, d, wadr, d_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d
);
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] d_d;
  input [8:0] wadr_d;
  input we_d;
  input writeA_w_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign we = (writeA_w_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign wadr = (wadr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [8:0] radr_d;
  input [8:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen (
  we, d, wadr, d_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d
);
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] d_d;
  input [8:0] wadr_d;
  input we_d;
  input writeA_w_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign we = (writeA_w_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign wadr = (wadr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [8:0] radr_d;
  input [8:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen (
  we, d, wadr, d_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d
);
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] d_d;
  input [8:0] wadr_d;
  input we_d;
  input writeA_w_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign we = (writeA_w_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign wadr = (wadr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [8:0] radr_d;
  input [8:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen (
  we, d, wadr, d_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d
);
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] d_d;
  input [8:0] wadr_d;
  input we_d;
  input writeA_w_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign we = (writeA_w_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign wadr = (wadr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen (
  q, radr, we, d, wadr, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output we;
  output [63:0] d;
  output [8:0] wadr;
  input [63:0] d_d;
  output [63:0] q_d;
  input [8:0] radr_d;
  input [8:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output [8:0] radr;
  output [63:0] q_d;
  input [8:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [127:0] q;
  output [6:0] radr;
  output we;
  output [127:0] d;
  output [6:0] wadr;
  input clken_d;
  input [127:0] d_d;
  output [127:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [127:0] q;
  output [6:0] radr;
  output we;
  output [127:0] d;
  output [6:0] wadr;
  input clken_d;
  input [127:0] d_d;
  output [127:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [127:0] q;
  output [6:0] radr;
  output we;
  output [127:0] d;
  output [6:0] wadr;
  input clken_d;
  input [127:0] d_d;
  output [127:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [127:0] q;
  output [6:0] radr;
  output we;
  output [127:0] d;
  output [6:0] wadr;
  input clken_d;
  input [127:0] d_d;
  output [127:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [127:0] q;
  output [6:0] radr;
  output we;
  output [127:0] d;
  output [6:0] wadr;
  input clken_d;
  input [127:0] d_d;
  output [127:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [127:0] q;
  output [6:0] radr;
  output we;
  output [127:0] d;
  output [6:0] wadr;
  input clken_d;
  input [127:0] d_d;
  output [127:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [127:0] q;
  output [6:0] radr;
  output we;
  output [127:0] d;
  output [6:0] wadr;
  input clken_d;
  input [127:0] d_d;
  output [127:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen
// ------------------------------------------------------------------


module peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [127:0] q;
  output [6:0] radr;
  output we;
  output [127:0] d;
  output [6:0] wadr;
  input clken_d;
  input [127:0] d_d;
  output [127:0] q_d;
  input [6:0] radr_d;
  input [6:0] wadr_d;
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
//  Design Unit:    peaceNTT_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module peaceNTT_core_core_fsm (
  clk, rst, fsm_output, COPY_LOOP_C_2_tr0, COMP_LOOP_C_244_tr0, COPY_LOOP_1_C_2_tr0,
      STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input COPY_LOOP_C_2_tr0;
  input COMP_LOOP_C_244_tr0;
  input COPY_LOOP_1_C_2_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for peaceNTT_core_core_fsm_1
  parameter
    main_C_0 = 8'd0,
    COPY_LOOP_C_0 = 8'd1,
    COPY_LOOP_C_1 = 8'd2,
    COPY_LOOP_C_2 = 8'd3,
    STAGE_LOOP_C_0 = 8'd4,
    COMP_LOOP_C_0 = 8'd5,
    COMP_LOOP_C_1 = 8'd6,
    COMP_LOOP_C_2 = 8'd7,
    COMP_LOOP_C_3 = 8'd8,
    COMP_LOOP_C_4 = 8'd9,
    COMP_LOOP_C_5 = 8'd10,
    COMP_LOOP_C_6 = 8'd11,
    COMP_LOOP_C_7 = 8'd12,
    COMP_LOOP_C_8 = 8'd13,
    COMP_LOOP_C_9 = 8'd14,
    COMP_LOOP_C_10 = 8'd15,
    COMP_LOOP_C_11 = 8'd16,
    COMP_LOOP_C_12 = 8'd17,
    COMP_LOOP_C_13 = 8'd18,
    COMP_LOOP_C_14 = 8'd19,
    COMP_LOOP_C_15 = 8'd20,
    COMP_LOOP_C_16 = 8'd21,
    COMP_LOOP_C_17 = 8'd22,
    COMP_LOOP_C_18 = 8'd23,
    COMP_LOOP_C_19 = 8'd24,
    COMP_LOOP_C_20 = 8'd25,
    COMP_LOOP_C_21 = 8'd26,
    COMP_LOOP_C_22 = 8'd27,
    COMP_LOOP_C_23 = 8'd28,
    COMP_LOOP_C_24 = 8'd29,
    COMP_LOOP_C_25 = 8'd30,
    COMP_LOOP_C_26 = 8'd31,
    COMP_LOOP_C_27 = 8'd32,
    COMP_LOOP_C_28 = 8'd33,
    COMP_LOOP_C_29 = 8'd34,
    COMP_LOOP_C_30 = 8'd35,
    COMP_LOOP_C_31 = 8'd36,
    COMP_LOOP_C_32 = 8'd37,
    COMP_LOOP_C_33 = 8'd38,
    COMP_LOOP_C_34 = 8'd39,
    COMP_LOOP_C_35 = 8'd40,
    COMP_LOOP_C_36 = 8'd41,
    COMP_LOOP_C_37 = 8'd42,
    COMP_LOOP_C_38 = 8'd43,
    COMP_LOOP_C_39 = 8'd44,
    COMP_LOOP_C_40 = 8'd45,
    COMP_LOOP_C_41 = 8'd46,
    COMP_LOOP_C_42 = 8'd47,
    COMP_LOOP_C_43 = 8'd48,
    COMP_LOOP_C_44 = 8'd49,
    COMP_LOOP_C_45 = 8'd50,
    COMP_LOOP_C_46 = 8'd51,
    COMP_LOOP_C_47 = 8'd52,
    COMP_LOOP_C_48 = 8'd53,
    COMP_LOOP_C_49 = 8'd54,
    COMP_LOOP_C_50 = 8'd55,
    COMP_LOOP_C_51 = 8'd56,
    COMP_LOOP_C_52 = 8'd57,
    COMP_LOOP_C_53 = 8'd58,
    COMP_LOOP_C_54 = 8'd59,
    COMP_LOOP_C_55 = 8'd60,
    COMP_LOOP_C_56 = 8'd61,
    COMP_LOOP_C_57 = 8'd62,
    COMP_LOOP_C_58 = 8'd63,
    COMP_LOOP_C_59 = 8'd64,
    COMP_LOOP_C_60 = 8'd65,
    COMP_LOOP_C_61 = 8'd66,
    COMP_LOOP_C_62 = 8'd67,
    COMP_LOOP_C_63 = 8'd68,
    COMP_LOOP_C_64 = 8'd69,
    COMP_LOOP_C_65 = 8'd70,
    COMP_LOOP_C_66 = 8'd71,
    COMP_LOOP_C_67 = 8'd72,
    COMP_LOOP_C_68 = 8'd73,
    COMP_LOOP_C_69 = 8'd74,
    COMP_LOOP_C_70 = 8'd75,
    COMP_LOOP_C_71 = 8'd76,
    COMP_LOOP_C_72 = 8'd77,
    COMP_LOOP_C_73 = 8'd78,
    COMP_LOOP_C_74 = 8'd79,
    COMP_LOOP_C_75 = 8'd80,
    COMP_LOOP_C_76 = 8'd81,
    COMP_LOOP_C_77 = 8'd82,
    COMP_LOOP_C_78 = 8'd83,
    COMP_LOOP_C_79 = 8'd84,
    COMP_LOOP_C_80 = 8'd85,
    COMP_LOOP_C_81 = 8'd86,
    COMP_LOOP_C_82 = 8'd87,
    COMP_LOOP_C_83 = 8'd88,
    COMP_LOOP_C_84 = 8'd89,
    COMP_LOOP_C_85 = 8'd90,
    COMP_LOOP_C_86 = 8'd91,
    COMP_LOOP_C_87 = 8'd92,
    COMP_LOOP_C_88 = 8'd93,
    COMP_LOOP_C_89 = 8'd94,
    COMP_LOOP_C_90 = 8'd95,
    COMP_LOOP_C_91 = 8'd96,
    COMP_LOOP_C_92 = 8'd97,
    COMP_LOOP_C_93 = 8'd98,
    COMP_LOOP_C_94 = 8'd99,
    COMP_LOOP_C_95 = 8'd100,
    COMP_LOOP_C_96 = 8'd101,
    COMP_LOOP_C_97 = 8'd102,
    COMP_LOOP_C_98 = 8'd103,
    COMP_LOOP_C_99 = 8'd104,
    COMP_LOOP_C_100 = 8'd105,
    COMP_LOOP_C_101 = 8'd106,
    COMP_LOOP_C_102 = 8'd107,
    COMP_LOOP_C_103 = 8'd108,
    COMP_LOOP_C_104 = 8'd109,
    COMP_LOOP_C_105 = 8'd110,
    COMP_LOOP_C_106 = 8'd111,
    COMP_LOOP_C_107 = 8'd112,
    COMP_LOOP_C_108 = 8'd113,
    COMP_LOOP_C_109 = 8'd114,
    COMP_LOOP_C_110 = 8'd115,
    COMP_LOOP_C_111 = 8'd116,
    COMP_LOOP_C_112 = 8'd117,
    COMP_LOOP_C_113 = 8'd118,
    COMP_LOOP_C_114 = 8'd119,
    COMP_LOOP_C_115 = 8'd120,
    COMP_LOOP_C_116 = 8'd121,
    COMP_LOOP_C_117 = 8'd122,
    COMP_LOOP_C_118 = 8'd123,
    COMP_LOOP_C_119 = 8'd124,
    COMP_LOOP_C_120 = 8'd125,
    COMP_LOOP_C_121 = 8'd126,
    COMP_LOOP_C_122 = 8'd127,
    COMP_LOOP_C_123 = 8'd128,
    COMP_LOOP_C_124 = 8'd129,
    COMP_LOOP_C_125 = 8'd130,
    COMP_LOOP_C_126 = 8'd131,
    COMP_LOOP_C_127 = 8'd132,
    COMP_LOOP_C_128 = 8'd133,
    COMP_LOOP_C_129 = 8'd134,
    COMP_LOOP_C_130 = 8'd135,
    COMP_LOOP_C_131 = 8'd136,
    COMP_LOOP_C_132 = 8'd137,
    COMP_LOOP_C_133 = 8'd138,
    COMP_LOOP_C_134 = 8'd139,
    COMP_LOOP_C_135 = 8'd140,
    COMP_LOOP_C_136 = 8'd141,
    COMP_LOOP_C_137 = 8'd142,
    COMP_LOOP_C_138 = 8'd143,
    COMP_LOOP_C_139 = 8'd144,
    COMP_LOOP_C_140 = 8'd145,
    COMP_LOOP_C_141 = 8'd146,
    COMP_LOOP_C_142 = 8'd147,
    COMP_LOOP_C_143 = 8'd148,
    COMP_LOOP_C_144 = 8'd149,
    COMP_LOOP_C_145 = 8'd150,
    COMP_LOOP_C_146 = 8'd151,
    COMP_LOOP_C_147 = 8'd152,
    COMP_LOOP_C_148 = 8'd153,
    COMP_LOOP_C_149 = 8'd154,
    COMP_LOOP_C_150 = 8'd155,
    COMP_LOOP_C_151 = 8'd156,
    COMP_LOOP_C_152 = 8'd157,
    COMP_LOOP_C_153 = 8'd158,
    COMP_LOOP_C_154 = 8'd159,
    COMP_LOOP_C_155 = 8'd160,
    COMP_LOOP_C_156 = 8'd161,
    COMP_LOOP_C_157 = 8'd162,
    COMP_LOOP_C_158 = 8'd163,
    COMP_LOOP_C_159 = 8'd164,
    COMP_LOOP_C_160 = 8'd165,
    COMP_LOOP_C_161 = 8'd166,
    COMP_LOOP_C_162 = 8'd167,
    COMP_LOOP_C_163 = 8'd168,
    COMP_LOOP_C_164 = 8'd169,
    COMP_LOOP_C_165 = 8'd170,
    COMP_LOOP_C_166 = 8'd171,
    COMP_LOOP_C_167 = 8'd172,
    COMP_LOOP_C_168 = 8'd173,
    COMP_LOOP_C_169 = 8'd174,
    COMP_LOOP_C_170 = 8'd175,
    COMP_LOOP_C_171 = 8'd176,
    COMP_LOOP_C_172 = 8'd177,
    COMP_LOOP_C_173 = 8'd178,
    COMP_LOOP_C_174 = 8'd179,
    COMP_LOOP_C_175 = 8'd180,
    COMP_LOOP_C_176 = 8'd181,
    COMP_LOOP_C_177 = 8'd182,
    COMP_LOOP_C_178 = 8'd183,
    COMP_LOOP_C_179 = 8'd184,
    COMP_LOOP_C_180 = 8'd185,
    COMP_LOOP_C_181 = 8'd186,
    COMP_LOOP_C_182 = 8'd187,
    COMP_LOOP_C_183 = 8'd188,
    COMP_LOOP_C_184 = 8'd189,
    COMP_LOOP_C_185 = 8'd190,
    COMP_LOOP_C_186 = 8'd191,
    COMP_LOOP_C_187 = 8'd192,
    COMP_LOOP_C_188 = 8'd193,
    COMP_LOOP_C_189 = 8'd194,
    COMP_LOOP_C_190 = 8'd195,
    COMP_LOOP_C_191 = 8'd196,
    COMP_LOOP_C_192 = 8'd197,
    COMP_LOOP_C_193 = 8'd198,
    COMP_LOOP_C_194 = 8'd199,
    COMP_LOOP_C_195 = 8'd200,
    COMP_LOOP_C_196 = 8'd201,
    COMP_LOOP_C_197 = 8'd202,
    COMP_LOOP_C_198 = 8'd203,
    COMP_LOOP_C_199 = 8'd204,
    COMP_LOOP_C_200 = 8'd205,
    COMP_LOOP_C_201 = 8'd206,
    COMP_LOOP_C_202 = 8'd207,
    COMP_LOOP_C_203 = 8'd208,
    COMP_LOOP_C_204 = 8'd209,
    COMP_LOOP_C_205 = 8'd210,
    COMP_LOOP_C_206 = 8'd211,
    COMP_LOOP_C_207 = 8'd212,
    COMP_LOOP_C_208 = 8'd213,
    COMP_LOOP_C_209 = 8'd214,
    COMP_LOOP_C_210 = 8'd215,
    COMP_LOOP_C_211 = 8'd216,
    COMP_LOOP_C_212 = 8'd217,
    COMP_LOOP_C_213 = 8'd218,
    COMP_LOOP_C_214 = 8'd219,
    COMP_LOOP_C_215 = 8'd220,
    COMP_LOOP_C_216 = 8'd221,
    COMP_LOOP_C_217 = 8'd222,
    COMP_LOOP_C_218 = 8'd223,
    COMP_LOOP_C_219 = 8'd224,
    COMP_LOOP_C_220 = 8'd225,
    COMP_LOOP_C_221 = 8'd226,
    COMP_LOOP_C_222 = 8'd227,
    COMP_LOOP_C_223 = 8'd228,
    COMP_LOOP_C_224 = 8'd229,
    COMP_LOOP_C_225 = 8'd230,
    COMP_LOOP_C_226 = 8'd231,
    COMP_LOOP_C_227 = 8'd232,
    COMP_LOOP_C_228 = 8'd233,
    COMP_LOOP_C_229 = 8'd234,
    COMP_LOOP_C_230 = 8'd235,
    COMP_LOOP_C_231 = 8'd236,
    COMP_LOOP_C_232 = 8'd237,
    COMP_LOOP_C_233 = 8'd238,
    COMP_LOOP_C_234 = 8'd239,
    COMP_LOOP_C_235 = 8'd240,
    COMP_LOOP_C_236 = 8'd241,
    COMP_LOOP_C_237 = 8'd242,
    COMP_LOOP_C_238 = 8'd243,
    COMP_LOOP_C_239 = 8'd244,
    COMP_LOOP_C_240 = 8'd245,
    COMP_LOOP_C_241 = 8'd246,
    COMP_LOOP_C_242 = 8'd247,
    COMP_LOOP_C_243 = 8'd248,
    COMP_LOOP_C_244 = 8'd249,
    COPY_LOOP_1_C_0 = 8'd250,
    COPY_LOOP_1_C_1 = 8'd251,
    COPY_LOOP_1_C_2 = 8'd252,
    STAGE_LOOP_C_1 = 8'd253,
    main_C_1 = 8'd254;

  reg [7:0] state_var;
  reg [7:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : peaceNTT_core_core_fsm_1
    case (state_var)
      COPY_LOOP_C_0 : begin
        fsm_output = 8'b00000001;
        state_var_NS = COPY_LOOP_C_1;
      end
      COPY_LOOP_C_1 : begin
        fsm_output = 8'b00000010;
        state_var_NS = COPY_LOOP_C_2;
      end
      COPY_LOOP_C_2 : begin
        fsm_output = 8'b00000011;
        if ( COPY_LOOP_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_0;
        end
        else begin
          state_var_NS = COPY_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_0 : begin
        fsm_output = 8'b00000100;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 8'b00000101;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 8'b00000110;
        state_var_NS = COMP_LOOP_C_2;
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 8'b00000111;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 8'b00001000;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 8'b00001001;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 8'b00001010;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 8'b00001011;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 8'b00001100;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 8'b00001101;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 8'b00001110;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 8'b00001111;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 8'b00010000;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 8'b00010001;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 8'b00010010;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 8'b00010011;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 8'b00010100;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 8'b00010101;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 8'b00010110;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 8'b00010111;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 8'b00011000;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 8'b00011001;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 8'b00011010;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 8'b00011011;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 8'b00011100;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 8'b00011101;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 8'b00011110;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 8'b00011111;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 8'b00100000;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 8'b00100001;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 8'b00100010;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 8'b00100011;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 8'b00100100;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 8'b00100101;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 8'b00100110;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 8'b00100111;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 8'b00101000;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 8'b00101001;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 8'b00101010;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 8'b00101011;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 8'b00101100;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 8'b00101101;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 8'b00101110;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 8'b00101111;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 8'b00110000;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 8'b00110001;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 8'b00110010;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 8'b00110011;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 8'b00110100;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 8'b00110101;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 8'b00110110;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 8'b00110111;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 8'b00111000;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 8'b00111001;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 8'b00111010;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 8'b00111011;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 8'b00111100;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 8'b00111101;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 8'b00111110;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 8'b00111111;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 8'b01000000;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 8'b01000001;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 8'b01000010;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 8'b01000011;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 8'b01000100;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 8'b01000101;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 8'b01000110;
        state_var_NS = COMP_LOOP_C_66;
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 8'b01000111;
        state_var_NS = COMP_LOOP_C_67;
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 8'b01001000;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 8'b01001001;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 8'b01001010;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 8'b01001011;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 8'b01001100;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 8'b01001101;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 8'b01001110;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 8'b01001111;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 8'b01010000;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 8'b01010001;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 8'b01010010;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 8'b01010011;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 8'b01010100;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 8'b01010101;
        state_var_NS = COMP_LOOP_C_81;
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 8'b01010110;
        state_var_NS = COMP_LOOP_C_82;
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 8'b01010111;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 8'b01011000;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 8'b01011001;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 8'b01011010;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 8'b01011011;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 8'b01011100;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 8'b01011101;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 8'b01011110;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 8'b01011111;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 8'b01100000;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 8'b01100001;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 8'b01100010;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 8'b01100011;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 8'b01100100;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 8'b01100101;
        state_var_NS = COMP_LOOP_C_97;
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 8'b01100110;
        state_var_NS = COMP_LOOP_C_98;
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 8'b01100111;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 8'b01101000;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 8'b01101001;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 8'b01101010;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 8'b01101011;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 8'b01101100;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 8'b01101101;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 8'b01101110;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 8'b01101111;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 8'b01110000;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 8'b01110001;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 8'b01110010;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 8'b01110011;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 8'b01110100;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 8'b01110101;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 8'b01110110;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 8'b01110111;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 8'b01111000;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 8'b01111001;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 8'b01111010;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 8'b01111011;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 8'b01111100;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 8'b01111101;
        state_var_NS = COMP_LOOP_C_121;
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 8'b01111110;
        state_var_NS = COMP_LOOP_C_122;
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 8'b01111111;
        state_var_NS = COMP_LOOP_C_123;
      end
      COMP_LOOP_C_123 : begin
        fsm_output = 8'b10000000;
        state_var_NS = COMP_LOOP_C_124;
      end
      COMP_LOOP_C_124 : begin
        fsm_output = 8'b10000001;
        state_var_NS = COMP_LOOP_C_125;
      end
      COMP_LOOP_C_125 : begin
        fsm_output = 8'b10000010;
        state_var_NS = COMP_LOOP_C_126;
      end
      COMP_LOOP_C_126 : begin
        fsm_output = 8'b10000011;
        state_var_NS = COMP_LOOP_C_127;
      end
      COMP_LOOP_C_127 : begin
        fsm_output = 8'b10000100;
        state_var_NS = COMP_LOOP_C_128;
      end
      COMP_LOOP_C_128 : begin
        fsm_output = 8'b10000101;
        state_var_NS = COMP_LOOP_C_129;
      end
      COMP_LOOP_C_129 : begin
        fsm_output = 8'b10000110;
        state_var_NS = COMP_LOOP_C_130;
      end
      COMP_LOOP_C_130 : begin
        fsm_output = 8'b10000111;
        state_var_NS = COMP_LOOP_C_131;
      end
      COMP_LOOP_C_131 : begin
        fsm_output = 8'b10001000;
        state_var_NS = COMP_LOOP_C_132;
      end
      COMP_LOOP_C_132 : begin
        fsm_output = 8'b10001001;
        state_var_NS = COMP_LOOP_C_133;
      end
      COMP_LOOP_C_133 : begin
        fsm_output = 8'b10001010;
        state_var_NS = COMP_LOOP_C_134;
      end
      COMP_LOOP_C_134 : begin
        fsm_output = 8'b10001011;
        state_var_NS = COMP_LOOP_C_135;
      end
      COMP_LOOP_C_135 : begin
        fsm_output = 8'b10001100;
        state_var_NS = COMP_LOOP_C_136;
      end
      COMP_LOOP_C_136 : begin
        fsm_output = 8'b10001101;
        state_var_NS = COMP_LOOP_C_137;
      end
      COMP_LOOP_C_137 : begin
        fsm_output = 8'b10001110;
        state_var_NS = COMP_LOOP_C_138;
      end
      COMP_LOOP_C_138 : begin
        fsm_output = 8'b10001111;
        state_var_NS = COMP_LOOP_C_139;
      end
      COMP_LOOP_C_139 : begin
        fsm_output = 8'b10010000;
        state_var_NS = COMP_LOOP_C_140;
      end
      COMP_LOOP_C_140 : begin
        fsm_output = 8'b10010001;
        state_var_NS = COMP_LOOP_C_141;
      end
      COMP_LOOP_C_141 : begin
        fsm_output = 8'b10010010;
        state_var_NS = COMP_LOOP_C_142;
      end
      COMP_LOOP_C_142 : begin
        fsm_output = 8'b10010011;
        state_var_NS = COMP_LOOP_C_143;
      end
      COMP_LOOP_C_143 : begin
        fsm_output = 8'b10010100;
        state_var_NS = COMP_LOOP_C_144;
      end
      COMP_LOOP_C_144 : begin
        fsm_output = 8'b10010101;
        state_var_NS = COMP_LOOP_C_145;
      end
      COMP_LOOP_C_145 : begin
        fsm_output = 8'b10010110;
        state_var_NS = COMP_LOOP_C_146;
      end
      COMP_LOOP_C_146 : begin
        fsm_output = 8'b10010111;
        state_var_NS = COMP_LOOP_C_147;
      end
      COMP_LOOP_C_147 : begin
        fsm_output = 8'b10011000;
        state_var_NS = COMP_LOOP_C_148;
      end
      COMP_LOOP_C_148 : begin
        fsm_output = 8'b10011001;
        state_var_NS = COMP_LOOP_C_149;
      end
      COMP_LOOP_C_149 : begin
        fsm_output = 8'b10011010;
        state_var_NS = COMP_LOOP_C_150;
      end
      COMP_LOOP_C_150 : begin
        fsm_output = 8'b10011011;
        state_var_NS = COMP_LOOP_C_151;
      end
      COMP_LOOP_C_151 : begin
        fsm_output = 8'b10011100;
        state_var_NS = COMP_LOOP_C_152;
      end
      COMP_LOOP_C_152 : begin
        fsm_output = 8'b10011101;
        state_var_NS = COMP_LOOP_C_153;
      end
      COMP_LOOP_C_153 : begin
        fsm_output = 8'b10011110;
        state_var_NS = COMP_LOOP_C_154;
      end
      COMP_LOOP_C_154 : begin
        fsm_output = 8'b10011111;
        state_var_NS = COMP_LOOP_C_155;
      end
      COMP_LOOP_C_155 : begin
        fsm_output = 8'b10100000;
        state_var_NS = COMP_LOOP_C_156;
      end
      COMP_LOOP_C_156 : begin
        fsm_output = 8'b10100001;
        state_var_NS = COMP_LOOP_C_157;
      end
      COMP_LOOP_C_157 : begin
        fsm_output = 8'b10100010;
        state_var_NS = COMP_LOOP_C_158;
      end
      COMP_LOOP_C_158 : begin
        fsm_output = 8'b10100011;
        state_var_NS = COMP_LOOP_C_159;
      end
      COMP_LOOP_C_159 : begin
        fsm_output = 8'b10100100;
        state_var_NS = COMP_LOOP_C_160;
      end
      COMP_LOOP_C_160 : begin
        fsm_output = 8'b10100101;
        state_var_NS = COMP_LOOP_C_161;
      end
      COMP_LOOP_C_161 : begin
        fsm_output = 8'b10100110;
        state_var_NS = COMP_LOOP_C_162;
      end
      COMP_LOOP_C_162 : begin
        fsm_output = 8'b10100111;
        state_var_NS = COMP_LOOP_C_163;
      end
      COMP_LOOP_C_163 : begin
        fsm_output = 8'b10101000;
        state_var_NS = COMP_LOOP_C_164;
      end
      COMP_LOOP_C_164 : begin
        fsm_output = 8'b10101001;
        state_var_NS = COMP_LOOP_C_165;
      end
      COMP_LOOP_C_165 : begin
        fsm_output = 8'b10101010;
        state_var_NS = COMP_LOOP_C_166;
      end
      COMP_LOOP_C_166 : begin
        fsm_output = 8'b10101011;
        state_var_NS = COMP_LOOP_C_167;
      end
      COMP_LOOP_C_167 : begin
        fsm_output = 8'b10101100;
        state_var_NS = COMP_LOOP_C_168;
      end
      COMP_LOOP_C_168 : begin
        fsm_output = 8'b10101101;
        state_var_NS = COMP_LOOP_C_169;
      end
      COMP_LOOP_C_169 : begin
        fsm_output = 8'b10101110;
        state_var_NS = COMP_LOOP_C_170;
      end
      COMP_LOOP_C_170 : begin
        fsm_output = 8'b10101111;
        state_var_NS = COMP_LOOP_C_171;
      end
      COMP_LOOP_C_171 : begin
        fsm_output = 8'b10110000;
        state_var_NS = COMP_LOOP_C_172;
      end
      COMP_LOOP_C_172 : begin
        fsm_output = 8'b10110001;
        state_var_NS = COMP_LOOP_C_173;
      end
      COMP_LOOP_C_173 : begin
        fsm_output = 8'b10110010;
        state_var_NS = COMP_LOOP_C_174;
      end
      COMP_LOOP_C_174 : begin
        fsm_output = 8'b10110011;
        state_var_NS = COMP_LOOP_C_175;
      end
      COMP_LOOP_C_175 : begin
        fsm_output = 8'b10110100;
        state_var_NS = COMP_LOOP_C_176;
      end
      COMP_LOOP_C_176 : begin
        fsm_output = 8'b10110101;
        state_var_NS = COMP_LOOP_C_177;
      end
      COMP_LOOP_C_177 : begin
        fsm_output = 8'b10110110;
        state_var_NS = COMP_LOOP_C_178;
      end
      COMP_LOOP_C_178 : begin
        fsm_output = 8'b10110111;
        state_var_NS = COMP_LOOP_C_179;
      end
      COMP_LOOP_C_179 : begin
        fsm_output = 8'b10111000;
        state_var_NS = COMP_LOOP_C_180;
      end
      COMP_LOOP_C_180 : begin
        fsm_output = 8'b10111001;
        state_var_NS = COMP_LOOP_C_181;
      end
      COMP_LOOP_C_181 : begin
        fsm_output = 8'b10111010;
        state_var_NS = COMP_LOOP_C_182;
      end
      COMP_LOOP_C_182 : begin
        fsm_output = 8'b10111011;
        state_var_NS = COMP_LOOP_C_183;
      end
      COMP_LOOP_C_183 : begin
        fsm_output = 8'b10111100;
        state_var_NS = COMP_LOOP_C_184;
      end
      COMP_LOOP_C_184 : begin
        fsm_output = 8'b10111101;
        state_var_NS = COMP_LOOP_C_185;
      end
      COMP_LOOP_C_185 : begin
        fsm_output = 8'b10111110;
        state_var_NS = COMP_LOOP_C_186;
      end
      COMP_LOOP_C_186 : begin
        fsm_output = 8'b10111111;
        state_var_NS = COMP_LOOP_C_187;
      end
      COMP_LOOP_C_187 : begin
        fsm_output = 8'b11000000;
        state_var_NS = COMP_LOOP_C_188;
      end
      COMP_LOOP_C_188 : begin
        fsm_output = 8'b11000001;
        state_var_NS = COMP_LOOP_C_189;
      end
      COMP_LOOP_C_189 : begin
        fsm_output = 8'b11000010;
        state_var_NS = COMP_LOOP_C_190;
      end
      COMP_LOOP_C_190 : begin
        fsm_output = 8'b11000011;
        state_var_NS = COMP_LOOP_C_191;
      end
      COMP_LOOP_C_191 : begin
        fsm_output = 8'b11000100;
        state_var_NS = COMP_LOOP_C_192;
      end
      COMP_LOOP_C_192 : begin
        fsm_output = 8'b11000101;
        state_var_NS = COMP_LOOP_C_193;
      end
      COMP_LOOP_C_193 : begin
        fsm_output = 8'b11000110;
        state_var_NS = COMP_LOOP_C_194;
      end
      COMP_LOOP_C_194 : begin
        fsm_output = 8'b11000111;
        state_var_NS = COMP_LOOP_C_195;
      end
      COMP_LOOP_C_195 : begin
        fsm_output = 8'b11001000;
        state_var_NS = COMP_LOOP_C_196;
      end
      COMP_LOOP_C_196 : begin
        fsm_output = 8'b11001001;
        state_var_NS = COMP_LOOP_C_197;
      end
      COMP_LOOP_C_197 : begin
        fsm_output = 8'b11001010;
        state_var_NS = COMP_LOOP_C_198;
      end
      COMP_LOOP_C_198 : begin
        fsm_output = 8'b11001011;
        state_var_NS = COMP_LOOP_C_199;
      end
      COMP_LOOP_C_199 : begin
        fsm_output = 8'b11001100;
        state_var_NS = COMP_LOOP_C_200;
      end
      COMP_LOOP_C_200 : begin
        fsm_output = 8'b11001101;
        state_var_NS = COMP_LOOP_C_201;
      end
      COMP_LOOP_C_201 : begin
        fsm_output = 8'b11001110;
        state_var_NS = COMP_LOOP_C_202;
      end
      COMP_LOOP_C_202 : begin
        fsm_output = 8'b11001111;
        state_var_NS = COMP_LOOP_C_203;
      end
      COMP_LOOP_C_203 : begin
        fsm_output = 8'b11010000;
        state_var_NS = COMP_LOOP_C_204;
      end
      COMP_LOOP_C_204 : begin
        fsm_output = 8'b11010001;
        state_var_NS = COMP_LOOP_C_205;
      end
      COMP_LOOP_C_205 : begin
        fsm_output = 8'b11010010;
        state_var_NS = COMP_LOOP_C_206;
      end
      COMP_LOOP_C_206 : begin
        fsm_output = 8'b11010011;
        state_var_NS = COMP_LOOP_C_207;
      end
      COMP_LOOP_C_207 : begin
        fsm_output = 8'b11010100;
        state_var_NS = COMP_LOOP_C_208;
      end
      COMP_LOOP_C_208 : begin
        fsm_output = 8'b11010101;
        state_var_NS = COMP_LOOP_C_209;
      end
      COMP_LOOP_C_209 : begin
        fsm_output = 8'b11010110;
        state_var_NS = COMP_LOOP_C_210;
      end
      COMP_LOOP_C_210 : begin
        fsm_output = 8'b11010111;
        state_var_NS = COMP_LOOP_C_211;
      end
      COMP_LOOP_C_211 : begin
        fsm_output = 8'b11011000;
        state_var_NS = COMP_LOOP_C_212;
      end
      COMP_LOOP_C_212 : begin
        fsm_output = 8'b11011001;
        state_var_NS = COMP_LOOP_C_213;
      end
      COMP_LOOP_C_213 : begin
        fsm_output = 8'b11011010;
        state_var_NS = COMP_LOOP_C_214;
      end
      COMP_LOOP_C_214 : begin
        fsm_output = 8'b11011011;
        state_var_NS = COMP_LOOP_C_215;
      end
      COMP_LOOP_C_215 : begin
        fsm_output = 8'b11011100;
        state_var_NS = COMP_LOOP_C_216;
      end
      COMP_LOOP_C_216 : begin
        fsm_output = 8'b11011101;
        state_var_NS = COMP_LOOP_C_217;
      end
      COMP_LOOP_C_217 : begin
        fsm_output = 8'b11011110;
        state_var_NS = COMP_LOOP_C_218;
      end
      COMP_LOOP_C_218 : begin
        fsm_output = 8'b11011111;
        state_var_NS = COMP_LOOP_C_219;
      end
      COMP_LOOP_C_219 : begin
        fsm_output = 8'b11100000;
        state_var_NS = COMP_LOOP_C_220;
      end
      COMP_LOOP_C_220 : begin
        fsm_output = 8'b11100001;
        state_var_NS = COMP_LOOP_C_221;
      end
      COMP_LOOP_C_221 : begin
        fsm_output = 8'b11100010;
        state_var_NS = COMP_LOOP_C_222;
      end
      COMP_LOOP_C_222 : begin
        fsm_output = 8'b11100011;
        state_var_NS = COMP_LOOP_C_223;
      end
      COMP_LOOP_C_223 : begin
        fsm_output = 8'b11100100;
        state_var_NS = COMP_LOOP_C_224;
      end
      COMP_LOOP_C_224 : begin
        fsm_output = 8'b11100101;
        state_var_NS = COMP_LOOP_C_225;
      end
      COMP_LOOP_C_225 : begin
        fsm_output = 8'b11100110;
        state_var_NS = COMP_LOOP_C_226;
      end
      COMP_LOOP_C_226 : begin
        fsm_output = 8'b11100111;
        state_var_NS = COMP_LOOP_C_227;
      end
      COMP_LOOP_C_227 : begin
        fsm_output = 8'b11101000;
        state_var_NS = COMP_LOOP_C_228;
      end
      COMP_LOOP_C_228 : begin
        fsm_output = 8'b11101001;
        state_var_NS = COMP_LOOP_C_229;
      end
      COMP_LOOP_C_229 : begin
        fsm_output = 8'b11101010;
        state_var_NS = COMP_LOOP_C_230;
      end
      COMP_LOOP_C_230 : begin
        fsm_output = 8'b11101011;
        state_var_NS = COMP_LOOP_C_231;
      end
      COMP_LOOP_C_231 : begin
        fsm_output = 8'b11101100;
        state_var_NS = COMP_LOOP_C_232;
      end
      COMP_LOOP_C_232 : begin
        fsm_output = 8'b11101101;
        state_var_NS = COMP_LOOP_C_233;
      end
      COMP_LOOP_C_233 : begin
        fsm_output = 8'b11101110;
        state_var_NS = COMP_LOOP_C_234;
      end
      COMP_LOOP_C_234 : begin
        fsm_output = 8'b11101111;
        state_var_NS = COMP_LOOP_C_235;
      end
      COMP_LOOP_C_235 : begin
        fsm_output = 8'b11110000;
        state_var_NS = COMP_LOOP_C_236;
      end
      COMP_LOOP_C_236 : begin
        fsm_output = 8'b11110001;
        state_var_NS = COMP_LOOP_C_237;
      end
      COMP_LOOP_C_237 : begin
        fsm_output = 8'b11110010;
        state_var_NS = COMP_LOOP_C_238;
      end
      COMP_LOOP_C_238 : begin
        fsm_output = 8'b11110011;
        state_var_NS = COMP_LOOP_C_239;
      end
      COMP_LOOP_C_239 : begin
        fsm_output = 8'b11110100;
        state_var_NS = COMP_LOOP_C_240;
      end
      COMP_LOOP_C_240 : begin
        fsm_output = 8'b11110101;
        state_var_NS = COMP_LOOP_C_241;
      end
      COMP_LOOP_C_241 : begin
        fsm_output = 8'b11110110;
        state_var_NS = COMP_LOOP_C_242;
      end
      COMP_LOOP_C_242 : begin
        fsm_output = 8'b11110111;
        state_var_NS = COMP_LOOP_C_243;
      end
      COMP_LOOP_C_243 : begin
        fsm_output = 8'b11111000;
        state_var_NS = COMP_LOOP_C_244;
      end
      COMP_LOOP_C_244 : begin
        fsm_output = 8'b11111001;
        if ( COMP_LOOP_C_244_tr0 ) begin
          state_var_NS = COPY_LOOP_1_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      COPY_LOOP_1_C_0 : begin
        fsm_output = 8'b11111010;
        state_var_NS = COPY_LOOP_1_C_1;
      end
      COPY_LOOP_1_C_1 : begin
        fsm_output = 8'b11111011;
        state_var_NS = COPY_LOOP_1_C_2;
      end
      COPY_LOOP_1_C_2 : begin
        fsm_output = 8'b11111100;
        if ( COPY_LOOP_1_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COPY_LOOP_1_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 8'b11111101;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b11111110;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 8'b00000000;
        state_var_NS = COPY_LOOP_C_0;
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
//  Design Unit:    peaceNTT_core_wait_dp
// ------------------------------------------------------------------


module peaceNTT_core_wait_dp (
  clk, xt_rsc_0_0_cgo_iro, xt_rsc_0_0_i_clken_d, xt_rsc_0_1_cgo_iro, xt_rsc_0_1_i_clken_d,
      xt_rsc_0_2_cgo_iro, xt_rsc_0_2_i_clken_d, xt_rsc_0_3_cgo_iro, xt_rsc_0_3_i_clken_d,
      xt_rsc_0_4_cgo_iro, xt_rsc_0_4_i_clken_d, xt_rsc_0_5_cgo_iro, xt_rsc_0_5_i_clken_d,
      xt_rsc_0_6_cgo_iro, xt_rsc_0_6_i_clken_d, xt_rsc_0_7_cgo_iro, xt_rsc_0_7_i_clken_d,
      COMP_LOOP_1_f2_rem_cmp_z, xt_rsc_0_0_cgo, xt_rsc_0_1_cgo, xt_rsc_0_2_cgo, xt_rsc_0_3_cgo,
      xt_rsc_0_4_cgo, xt_rsc_0_5_cgo, xt_rsc_0_6_cgo, xt_rsc_0_7_cgo, COMP_LOOP_1_f2_rem_cmp_z_oreg
);
  input clk;
  input xt_rsc_0_0_cgo_iro;
  output xt_rsc_0_0_i_clken_d;
  input xt_rsc_0_1_cgo_iro;
  output xt_rsc_0_1_i_clken_d;
  input xt_rsc_0_2_cgo_iro;
  output xt_rsc_0_2_i_clken_d;
  input xt_rsc_0_3_cgo_iro;
  output xt_rsc_0_3_i_clken_d;
  input xt_rsc_0_4_cgo_iro;
  output xt_rsc_0_4_i_clken_d;
  input xt_rsc_0_5_cgo_iro;
  output xt_rsc_0_5_i_clken_d;
  input xt_rsc_0_6_cgo_iro;
  output xt_rsc_0_6_i_clken_d;
  input xt_rsc_0_7_cgo_iro;
  output xt_rsc_0_7_i_clken_d;
  input [63:0] COMP_LOOP_1_f2_rem_cmp_z;
  input xt_rsc_0_0_cgo;
  input xt_rsc_0_1_cgo;
  input xt_rsc_0_2_cgo;
  input xt_rsc_0_3_cgo;
  input xt_rsc_0_4_cgo;
  input xt_rsc_0_5_cgo;
  input xt_rsc_0_6_cgo;
  input xt_rsc_0_7_cgo;
  output [63:0] COMP_LOOP_1_f2_rem_cmp_z_oreg;
  reg [63:0] COMP_LOOP_1_f2_rem_cmp_z_oreg;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_0_i_clken_d = xt_rsc_0_0_cgo | xt_rsc_0_0_cgo_iro;
  assign xt_rsc_0_1_i_clken_d = xt_rsc_0_1_cgo | xt_rsc_0_1_cgo_iro;
  assign xt_rsc_0_2_i_clken_d = xt_rsc_0_2_cgo | xt_rsc_0_2_cgo_iro;
  assign xt_rsc_0_3_i_clken_d = xt_rsc_0_3_cgo | xt_rsc_0_3_cgo_iro;
  assign xt_rsc_0_4_i_clken_d = xt_rsc_0_4_cgo | xt_rsc_0_4_cgo_iro;
  assign xt_rsc_0_5_i_clken_d = xt_rsc_0_5_cgo | xt_rsc_0_5_cgo_iro;
  assign xt_rsc_0_6_i_clken_d = xt_rsc_0_6_cgo | xt_rsc_0_6_cgo_iro;
  assign xt_rsc_0_7_i_clken_d = xt_rsc_0_7_cgo | xt_rsc_0_7_cgo_iro;
  always @(posedge clk) begin
    COMP_LOOP_1_f2_rem_cmp_z_oreg <= COMP_LOOP_1_f2_rem_cmp_z;
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaceNTT_core
// ------------------------------------------------------------------


module peaceNTT_core (
  clk, rst, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_2_lz, vec_rsc_triosy_0_4_lz,
      vec_rsc_triosy_0_6_lz, p_rsc_dat, p_rsc_triosy_lz, g_rsc_triosy_lz, result_rsc_triosy_0_0_lz,
      result_rsc_triosy_0_1_lz, result_rsc_triosy_0_2_lz, result_rsc_triosy_0_3_lz,
      result_rsc_triosy_0_4_lz, result_rsc_triosy_0_5_lz, result_rsc_triosy_0_6_lz,
      result_rsc_triosy_0_7_lz, twiddle_rsc_triosy_0_0_lz, twiddle_rsc_triosy_0_1_lz,
      twiddle_rsc_triosy_0_2_lz, twiddle_rsc_triosy_0_3_lz, twiddle_rsc_triosy_0_4_lz,
      twiddle_rsc_triosy_0_5_lz, twiddle_rsc_triosy_0_6_lz, twiddle_rsc_triosy_0_7_lz,
      xt_rsc_0_0_i_clken_d, xt_rsc_0_0_i_q_d, xt_rsc_0_1_i_clken_d, xt_rsc_0_1_i_q_d,
      xt_rsc_0_2_i_clken_d, xt_rsc_0_2_i_q_d, xt_rsc_0_3_i_clken_d, xt_rsc_0_3_i_q_d,
      xt_rsc_0_4_i_clken_d, xt_rsc_0_4_i_q_d, xt_rsc_0_5_i_clken_d, xt_rsc_0_5_i_q_d,
      xt_rsc_0_6_i_clken_d, xt_rsc_0_6_i_q_d, xt_rsc_0_7_i_clken_d, xt_rsc_0_7_i_q_d,
      vec_rsc_0_0_i_q_d, vec_rsc_0_2_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_6_i_q_d,
      result_rsc_0_0_i_q_d, result_rsc_0_0_i_wadr_d, result_rsc_0_1_i_wadr_d, result_rsc_0_2_i_q_d,
      result_rsc_0_2_i_wadr_d, result_rsc_0_3_i_wadr_d, result_rsc_0_4_i_q_d, result_rsc_0_4_i_wadr_d,
      result_rsc_0_5_i_wadr_d, result_rsc_0_6_i_q_d, result_rsc_0_6_i_wadr_d, result_rsc_0_7_i_wadr_d,
      twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_0_i_radr_d, twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_1_i_radr_d, twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_2_i_radr_d, twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_3_i_radr_d, twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_4_i_radr_d, twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_5_i_q_d, twiddle_rsc_0_5_i_radr_d, twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_6_i_radr_d, twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_7_i_q_d, twiddle_rsc_0_7_i_radr_d, twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d,
      COMP_LOOP_1_f2_rem_cmp_a, COMP_LOOP_1_f2_rem_cmp_b, COMP_LOOP_1_f2_rem_cmp_z,
      xt_rsc_0_0_i_d_d_pff, xt_rsc_0_0_i_radr_d_pff, xt_rsc_0_0_i_wadr_d_pff, xt_rsc_0_0_i_we_d_pff,
      xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff, xt_rsc_0_1_i_d_d_pff, xt_rsc_0_1_i_we_d_pff,
      xt_rsc_0_2_i_we_d_pff, xt_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      xt_rsc_0_3_i_we_d_pff, xt_rsc_0_4_i_we_d_pff, xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      xt_rsc_0_5_i_we_d_pff, xt_rsc_0_6_i_we_d_pff, xt_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      xt_rsc_0_7_i_we_d_pff, vec_rsc_0_0_i_radr_d_pff, vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff, result_rsc_0_0_i_d_d_pff,
      result_rsc_0_0_i_radr_d_pff, result_rsc_0_0_i_we_d_pff, result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      result_rsc_0_1_i_d_d_pff, result_rsc_0_1_i_we_d_pff, result_rsc_0_2_i_d_d_pff,
      result_rsc_0_2_i_we_d_pff, result_rsc_0_3_i_d_d_pff, result_rsc_0_3_i_we_d_pff,
      result_rsc_0_4_i_we_d_pff, result_rsc_0_5_i_we_d_pff, result_rsc_0_6_i_we_d_pff,
      result_rsc_0_7_i_we_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_0_0_lz;
  output vec_rsc_triosy_0_2_lz;
  output vec_rsc_triosy_0_4_lz;
  output vec_rsc_triosy_0_6_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output g_rsc_triosy_lz;
  output result_rsc_triosy_0_0_lz;
  output result_rsc_triosy_0_1_lz;
  output result_rsc_triosy_0_2_lz;
  output result_rsc_triosy_0_3_lz;
  output result_rsc_triosy_0_4_lz;
  output result_rsc_triosy_0_5_lz;
  output result_rsc_triosy_0_6_lz;
  output result_rsc_triosy_0_7_lz;
  output twiddle_rsc_triosy_0_0_lz;
  output twiddle_rsc_triosy_0_1_lz;
  output twiddle_rsc_triosy_0_2_lz;
  output twiddle_rsc_triosy_0_3_lz;
  output twiddle_rsc_triosy_0_4_lz;
  output twiddle_rsc_triosy_0_5_lz;
  output twiddle_rsc_triosy_0_6_lz;
  output twiddle_rsc_triosy_0_7_lz;
  output xt_rsc_0_0_i_clken_d;
  input [127:0] xt_rsc_0_0_i_q_d;
  output xt_rsc_0_1_i_clken_d;
  input [127:0] xt_rsc_0_1_i_q_d;
  output xt_rsc_0_2_i_clken_d;
  input [127:0] xt_rsc_0_2_i_q_d;
  output xt_rsc_0_3_i_clken_d;
  input [127:0] xt_rsc_0_3_i_q_d;
  output xt_rsc_0_4_i_clken_d;
  input [127:0] xt_rsc_0_4_i_q_d;
  output xt_rsc_0_5_i_clken_d;
  input [127:0] xt_rsc_0_5_i_q_d;
  output xt_rsc_0_6_i_clken_d;
  input [127:0] xt_rsc_0_6_i_q_d;
  output xt_rsc_0_7_i_clken_d;
  input [127:0] xt_rsc_0_7_i_q_d;
  input [63:0] vec_rsc_0_0_i_q_d;
  input [63:0] vec_rsc_0_2_i_q_d;
  input [63:0] vec_rsc_0_4_i_q_d;
  input [63:0] vec_rsc_0_6_i_q_d;
  input [63:0] result_rsc_0_0_i_q_d;
  output [8:0] result_rsc_0_0_i_wadr_d;
  output [8:0] result_rsc_0_1_i_wadr_d;
  input [63:0] result_rsc_0_2_i_q_d;
  output [8:0] result_rsc_0_2_i_wadr_d;
  output [8:0] result_rsc_0_3_i_wadr_d;
  input [63:0] result_rsc_0_4_i_q_d;
  output [8:0] result_rsc_0_4_i_wadr_d;
  output [8:0] result_rsc_0_5_i_wadr_d;
  input [63:0] result_rsc_0_6_i_q_d;
  output [8:0] result_rsc_0_6_i_wadr_d;
  output [8:0] result_rsc_0_7_i_wadr_d;
  input [63:0] twiddle_rsc_0_0_i_q_d;
  output [8:0] twiddle_rsc_0_0_i_radr_d;
  output twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_1_i_q_d;
  output [8:0] twiddle_rsc_0_1_i_radr_d;
  output twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_2_i_q_d;
  output [8:0] twiddle_rsc_0_2_i_radr_d;
  output twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_3_i_q_d;
  output [8:0] twiddle_rsc_0_3_i_radr_d;
  output twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_4_i_q_d;
  output [8:0] twiddle_rsc_0_4_i_radr_d;
  output twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_5_i_q_d;
  output [8:0] twiddle_rsc_0_5_i_radr_d;
  output twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_6_i_q_d;
  output [8:0] twiddle_rsc_0_6_i_radr_d;
  output twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d;
  input [63:0] twiddle_rsc_0_7_i_q_d;
  output [8:0] twiddle_rsc_0_7_i_radr_d;
  output twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d;
  output [127:0] COMP_LOOP_1_f2_rem_cmp_a;
  output [63:0] COMP_LOOP_1_f2_rem_cmp_b;
  input [63:0] COMP_LOOP_1_f2_rem_cmp_z;
  output [127:0] xt_rsc_0_0_i_d_d_pff;
  output [6:0] xt_rsc_0_0_i_radr_d_pff;
  output [6:0] xt_rsc_0_0_i_wadr_d_pff;
  output xt_rsc_0_0_i_we_d_pff;
  output xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output [127:0] xt_rsc_0_1_i_d_d_pff;
  output xt_rsc_0_1_i_we_d_pff;
  output xt_rsc_0_2_i_we_d_pff;
  output xt_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output xt_rsc_0_3_i_we_d_pff;
  output xt_rsc_0_4_i_we_d_pff;
  output xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output xt_rsc_0_5_i_we_d_pff;
  output xt_rsc_0_6_i_we_d_pff;
  output xt_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output xt_rsc_0_7_i_we_d_pff;
  output [8:0] vec_rsc_0_0_i_radr_d_pff;
  output vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output [63:0] result_rsc_0_0_i_d_d_pff;
  output [8:0] result_rsc_0_0_i_radr_d_pff;
  output result_rsc_0_0_i_we_d_pff;
  output result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output [63:0] result_rsc_0_1_i_d_d_pff;
  output result_rsc_0_1_i_we_d_pff;
  output [63:0] result_rsc_0_2_i_d_d_pff;
  output result_rsc_0_2_i_we_d_pff;
  output [63:0] result_rsc_0_3_i_d_d_pff;
  output result_rsc_0_3_i_we_d_pff;
  output result_rsc_0_4_i_we_d_pff;
  output result_rsc_0_5_i_we_d_pff;
  output result_rsc_0_6_i_we_d_pff;
  output result_rsc_0_7_i_we_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  reg [64:0] COMP_LOOP_1_rem_cmp_a;
  wire [64:0] COMP_LOOP_1_rem_cmp_z;
  wire [63:0] COMP_LOOP_1_f2_rem_cmp_z_oreg;
  wire [7:0] fsm_output;
  wire nor_tmp_2;
  wire or_tmp_8;
  wire and_dcpl_6;
  wire and_dcpl_7;
  wire and_dcpl_9;
  wire and_dcpl_10;
  wire and_dcpl_11;
  wire and_dcpl_12;
  wire and_dcpl_13;
  wire and_dcpl_14;
  wire and_dcpl_15;
  wire and_dcpl_18;
  wire and_dcpl_19;
  wire and_dcpl_20;
  wire not_tmp_25;
  wire or_tmp_16;
  wire or_tmp_18;
  wire nor_tmp_7;
  wire mux_tmp_12;
  wire mux_tmp_13;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire or_tmp_20;
  wire mux_tmp_15;
  wire mux_tmp_33;
  wire or_tmp_43;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire nor_tmp_19;
  wire or_tmp_60;
  wire or_tmp_64;
  wire mux_tmp_55;
  wire or_tmp_71;
  wire nor_tmp_26;
  wire mux_tmp_75;
  wire nor_tmp_32;
  wire and_dcpl_40;
  wire and_dcpl_46;
  wire and_dcpl_48;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire not_tmp_85;
  wire and_dcpl_64;
  wire and_dcpl_65;
  wire and_dcpl_66;
  wire and_dcpl_68;
  wire and_dcpl_69;
  wire not_tmp_86;
  wire and_dcpl_72;
  wire and_dcpl_73;
  wire and_dcpl_75;
  wire not_tmp_88;
  wire and_dcpl_80;
  wire and_dcpl_82;
  wire not_tmp_89;
  wire or_tmp_99;
  wire and_dcpl_98;
  wire or_tmp_107;
  wire or_tmp_109;
  wire and_dcpl_102;
  wire and_dcpl_107;
  wire and_dcpl_129;
  wire and_dcpl_131;
  wire and_dcpl_133;
  wire mux_tmp_107;
  wire or_tmp_122;
  wire mux_tmp_108;
  wire or_tmp_126;
  wire or_tmp_127;
  wire mux_tmp_110;
  wire mux_tmp_118;
  wire and_dcpl_134;
  wire and_dcpl_135;
  wire and_dcpl_137;
  wire and_dcpl_138;
  wire and_dcpl_141;
  wire and_dcpl_142;
  wire and_dcpl_144;
  wire and_dcpl_146;
  wire or_tmp_132;
  wire mux_tmp_125;
  wire or_tmp_133;
  wire or_tmp_137;
  wire mux_tmp_129;
  wire or_tmp_150;
  wire or_dcpl_10;
  wire and_dcpl_166;
  wire and_dcpl_169;
  wire and_dcpl_170;
  wire and_dcpl_172;
  wire and_dcpl_189;
  wire and_dcpl_191;
  wire and_dcpl_194;
  wire and_dcpl_197;
  wire and_dcpl_200;
  wire or_dcpl_29;
  wire or_dcpl_30;
  reg [8:0] COMP_LOOP_r_10_2_sva;
  wire [6:0] COMP_LOOP_1_f2_and_cse_6_0_sva_1;
  reg [8:0] STAGE_LOOP_base_8_0_sva;
  reg [9:0] COPY_LOOP_1_i_12_3_sva_1;
  reg [10:0] COPY_LOOP_i_12_2_sva_1;
  reg [6:0] COMP_LOOP_1_f2_and_cse_6_0_sva;
  wire and_178_m1c;
  wire and_150_ssc;
  wire nor_121_ssc;
  wire and_152_ssc;
  wire and_154_ssc;
  wire and_155_ssc;
  wire and_156_ssc;
  wire and_157_ssc;
  reg [62:0] reg_COMP_LOOP_1_f2_rem_cmp_a_ftd;
  reg [64:0] reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1;
  reg reg_xt_rsc_0_0_cgo_cse;
  reg reg_xt_rsc_0_1_cgo_cse;
  reg reg_xt_rsc_0_2_cgo_cse;
  reg reg_xt_rsc_0_3_cgo_cse;
  reg reg_xt_rsc_0_4_cgo_cse;
  reg reg_xt_rsc_0_5_cgo_cse;
  reg reg_xt_rsc_0_6_cgo_cse;
  reg reg_xt_rsc_0_7_cgo_cse;
  wire and_214_cse;
  reg reg_vec_rsc_triosy_0_6_obj_ld_cse;
  reg [63:0] reg_COMP_LOOP_1_rem_cmp_b_63_0_cse;
  wire COMP_LOOP_f1_or_cse;
  wire mux_64_cse;
  wire nor_108_cse;
  wire and_239_cse;
  wire nor_110_cse;
  wire nor_112_cse;
  wire and_225_cse;
  wire or_cse;
  wire or_12_cse;
  wire or_11_cse;
  wire or_27_cse;
  wire nand_21_cse;
  wire nor_27_cse;
  wire and_220_cse;
  wire or_220_cse;
  wire and_208_cse;
  wire nand_11_cse;
  wire mux_62_cse;
  wire mux_85_cse;
  wire nor_109_cse;
  wire mux_83_cse;
  wire mux_84_cse;
  wire mux_103_cse;
  wire mux_125_cse;
  wire mux_105_cse;
  wire mux_127_cse;
  wire COMP_LOOP_f2_nor_cse;
  wire COMP_LOOP_f2_nor_3_cse;
  wire mux_88_rmff;
  wire mux_99_rmff;
  wire mux_109_rmff;
  wire mux_122_rmff;
  wire mux_130_rmff;
  wire mux_140_rmff;
  wire [5:0] COMP_LOOP_f2_mux_12_rmff;
  wire [5:0] COMP_LOOP_f2_mux_11_rmff;
  wire mux_67_itm;
  wire mux_79_itm;
  wire [8:0] STAGE_LOOP_base_lshift_itm;
  wire mux_209_itm;
  wire mux_196_itm;
  wire and_dcpl_215;
  wire and_dcpl_217;
  wire and_dcpl_222;
  wire [64:0] z_out_1;
  wire and_dcpl_246;
  wire [10:0] z_out_2;
  wire [11:0] nl_z_out_2;
  wire [64:0] z_out_3;
  wire [65:0] nl_z_out_3;
  wire and_dcpl_270;
  wire and_dcpl_273;
  wire [127:0] z_out_4;
  reg [63:0] p_sva;
  reg [3:0] STAGE_LOOP_base_acc_cse_sva;
  reg [63:0] tmp_63_0_lpi_3_dfm;
  reg [63:0] tmp_2_127_64_lpi_3_dfm;
  reg [63:0] tmp_15_sva_3;
  reg [63:0] tmp_4_63_0_lpi_3_dfm;
  reg [63:0] tmp_6_127_64_lpi_3_dfm;
  reg [127:0] COMP_LOOP_4_f2_mul_mut;
  reg [127:0] COMP_LOOP_1_f2_mul_itm;
  reg [64:0] COMP_LOOP_1_acc_1_itm;
  reg [127:0] COMP_LOOP_2_f2_mul_itm;
  reg [127:0] COMP_LOOP_3_f2_mul_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_nor_2_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_and_8_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_and_10_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_and_11_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_and_12_itm;
  reg [64:0] COMP_LOOP_4_acc_1_itm;
  wire [127:0] COMP_LOOP_4_f2_mul_mut_mx0w0;
  wire COPY_LOOP_1_i_12_3_sva_1_mx0c0;
  wire COPY_LOOP_1_i_12_3_sva_1_mx0c2;
  wire COMP_LOOP_r_10_2_sva_mx0c0;
  wire or_223_cse;
  wire [64:0] COMP_LOOP_COMP_LOOP_mux_1_rgt;
  wire [64:0] COMP_LOOP_COMP_LOOP_mux_2_rgt;
  wire or_tmp_188;
  wire [64:0] COMP_LOOP_COMP_LOOP_mux_4_rgt;
  reg COMP_LOOP_acc_5_mut_64;
  reg [63:0] COMP_LOOP_acc_5_mut_63_0;
  reg COMP_LOOP_2_acc_1_itm_64;
  reg [63:0] COMP_LOOP_2_acc_1_itm_63_0;
  reg COMP_LOOP_3_acc_1_itm_64;
  reg [63:0] COMP_LOOP_3_acc_1_itm_63_0;
  wire nand_31_cse;
  wire nor_119_cse_1;
  wire nor_cse_1;
  wire and_346_cse;
  wire or_247_cse;
  wire nor_160_cse;
  wire or_239_cse;
  wire or_238_cse;
  wire and_272_itm;
  wire and_276_itm;
  wire STAGE_LOOP_acc_itm_4_1;
  wire and_348_cse;

  wire[0:0] nor_116_nl;
  wire[0:0] mux_61_nl;
  wire[0:0] or_8_nl;
  wire[0:0] or_7_nl;
  wire[0:0] nand_nl;
  wire[0:0] mux_66_nl;
  wire[0:0] or_15_nl;
  wire[0:0] mux_65_nl;
  wire[0:0] nand_1_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] or_31_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] nor_117_nl;
  wire[0:0] and_238_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] nor_111_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] nor_113_nl;
  wire[0:0] and_237_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] nor_106_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] or_38_nl;
  wire[0:0] and_234_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] nor_98_nl;
  wire[0:0] mux_97_nl;
  wire[0:0] or_53_nl;
  wire[0:0] mux_102_nl;
  wire[0:0] nor_94_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] nor_96_nl;
  wire[0:0] and_231_nl;
  wire[0:0] mux_108_nl;
  wire[0:0] mux_107_nl;
  wire[0:0] mux_106_nl;
  wire[0:0] nor_20_nl;
  wire[0:0] and_227_nl;
  wire[0:0] mux_121_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] nor_24_nl;
  wire[0:0] mux_124_nl;
  wire[0:0] nor_83_nl;
  wire[0:0] nor_84_nl;
  wire[0:0] and_223_nl;
  wire[0:0] mux_129_nl;
  wire[0:0] nor_80_nl;
  wire[0:0] mux_128_nl;
  wire[0:0] and_217_nl;
  wire[0:0] mux_139_nl;
  wire[0:0] nor_74_nl;
  wire[0:0] mux_138_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] mux_167_nl;
  wire[9:0] COPY_LOOP_i_COPY_LOOP_i_mux_nl;
  wire[9:0] COMP_LOOP_acc_nl;
  wire[10:0] nl_COMP_LOOP_acc_nl;
  wire[0:0] COPY_LOOP_i_or_nl;
  wire[0:0] COPY_LOOP_1_i_not_nl;
  wire[0:0] and_163_nl;
  wire[0:0] COMP_LOOP_r_not_nl;
  wire[0:0] and_204_nl;
  wire[63:0] COMP_LOOP_f2_mux1h_6_nl;
  wire[0:0] COMP_LOOP_f2_or_nl;
  wire[0:0] COMP_LOOP_f2_COMP_LOOP_f2_and_6_nl;
  wire[0:0] COMP_LOOP_f2_or_1_nl;
  wire[0:0] COMP_LOOP_f2_and_4_nl;
  wire[0:0] COMP_LOOP_f2_or_2_nl;
  wire[0:0] COMP_LOOP_f2_and_7_nl;
  wire[0:0] COMP_LOOP_f2_or_3_nl;
  wire[0:0] COMP_LOOP_f2_and_10_nl;
  wire[0:0] COMP_LOOP_f2_and_11_nl;
  wire[0:0] COMP_LOOP_f2_and_12_nl;
  wire[0:0] mux_218_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_nl;
  wire[0:0] mux_232_nl;
  wire[0:0] mux_nl;
  wire[0:0] nor_163_nl;
  wire[0:0] nor_164_nl;
  wire[0:0] nor_165_nl;
  wire[0:0] mux_233_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_1_nl;
  wire[0:0] mux_234_nl;
  wire[0:0] nor_158_nl;
  wire[0:0] mux_235_nl;
  wire[0:0] nand_29_nl;
  wire[63:0] COMP_LOOP_f2_mux1h_4_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_2_nl;
  wire[0:0] COMP_LOOP_or_5_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] or_236_nl;
  wire[0:0] or_234_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] or_233_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] nor_149_nl;
  wire[0:0] nor_150_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] nor_151_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] or_13_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] nor_114_nl;
  wire[0:0] or_43_nl;
  wire[0:0] mux_110_nl;
  wire[0:0] nor_72_nl;
  wire[0:0] nor_73_nl;
  wire[0:0] nor_70_nl;
  wire[0:0] nor_71_nl;
  wire[0:0] nor_68_nl;
  wire[0:0] nor_69_nl;
  wire[0:0] nor_66_nl;
  wire[0:0] nor_67_nl;
  wire[0:0] or_126_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] or_128_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] mux_171_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] mux_169_nl;
  wire[0:0] or_131_nl;
  wire[0:0] or_172_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] or_175_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] or_174_nl;
  wire[0:0] or_173_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] or_139_nl;
  wire[0:0] or_138_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] or_143_nl;
  wire[0:0] or_141_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] or_221_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] or_151_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] or_149_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] nand_24_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] or_158_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] or_156_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] nand_22_nl;
  wire[0:0] mux_204_nl;
  wire[62:0] COMP_LOOP_f2_mux1h_nl;
  wire[0:0] COMP_LOOP_f2_nor_5_nl;
  wire[0:0] and_98_nl;
  wire[0:0] mux_146_nl;
  wire[63:0] COPY_LOOP_mux_nl;
  wire[63:0] COPY_LOOP_mux_4_nl;
  wire[0:0] mux_70_nl;
  wire[0:0] mux_72_nl;
  wire[63:0] COPY_LOOP_mux_3_nl;
  wire[63:0] COPY_LOOP_mux_5_nl;
  wire[0:0] mux_80_nl;
  wire[0:0] mux_90_nl;
  wire[0:0] nor_14_nl;
  wire[0:0] mux_91_nl;
  wire[0:0] or_47_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] nor_18_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] or_65_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] or_68_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] or_76_nl;
  wire[0:0] mux_132_nl;
  wire[0:0] mux_133_nl;
  wire[0:0] mux_141_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] nor_63_nl;
  wire[0:0] nor_64_nl;
  wire[0:0] nor_65_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] or_104_nl;
  wire[0:0] or_102_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] or_110_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] or_113_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] nor_59_nl;
  wire[0:0] nor_60_nl;
  wire[0:0] mux_155_nl;
  wire[0:0] nor_61_nl;
  wire[0:0] nor_62_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] or_120_nl;
  wire[0:0] mux_158_nl;
  wire[0:0] nor_43_nl;
  wire[0:0] mux_162_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] nand_12_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] or_122_nl;
  wire[65:0] acc_1_nl;
  wire[66:0] nl_acc_1_nl;
  wire[63:0] COMP_LOOP_mux1h_10_nl;
  wire[0:0] and_347_nl;
  wire[9:0] COPY_LOOP_mux_8_nl;
  wire[63:0] COMP_LOOP_mux1h_11_nl;
  wire[0:0] and_350_nl;
  wire[63:0] COMP_LOOP_f2_mux1h_12_nl;
  wire[0:0] and_351_nl;
  wire[0:0] and_352_nl;
  wire[0:0] and_353_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [64:0] nl_COMP_LOOP_1_rem_cmp_b;
  assign nl_COMP_LOOP_1_rem_cmp_b = {1'b0, reg_COMP_LOOP_1_rem_cmp_b_63_0_cse};
  wire [3:0] nl_STAGE_LOOP_base_lshift_rg_s;
  assign nl_STAGE_LOOP_base_lshift_rg_s = z_out_2[3:0];
  wire [0:0] nl_peaceNTT_core_wait_dp_inst_xt_rsc_0_0_cgo_iro;
  assign nl_peaceNTT_core_wait_dp_inst_xt_rsc_0_0_cgo_iro = ~ mux_67_itm;
  wire [0:0] nl_peaceNTT_core_wait_dp_inst_xt_rsc_0_1_cgo_iro;
  assign nl_peaceNTT_core_wait_dp_inst_xt_rsc_0_1_cgo_iro = ~ mux_79_itm;
  wire [0:0] nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0;
  assign nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0 = COPY_LOOP_i_12_2_sva_1[10];
  wire [0:0] nl_peaceNTT_core_core_fsm_inst_COMP_LOOP_C_244_tr0;
  assign nl_peaceNTT_core_core_fsm_inst_COMP_LOOP_C_244_tr0 = COPY_LOOP_1_i_12_3_sva_1[9];
  wire [0:0] nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0;
  assign nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0 = COPY_LOOP_1_i_12_3_sva_1[9];
  wire [0:0] nl_peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = STAGE_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_6_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(vec_rsc_triosy_0_6_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_4_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(vec_rsc_triosy_0_4_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_2_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(vec_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(vec_rsc_triosy_0_0_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) g_rsc_triosy_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(g_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_0_7_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(result_rsc_triosy_0_7_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_0_6_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(result_rsc_triosy_0_6_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_0_5_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(result_rsc_triosy_0_5_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_0_4_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(result_rsc_triosy_0_4_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_0_3_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(result_rsc_triosy_0_3_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_0_2_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(result_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_0_1_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(result_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) result_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(result_rsc_triosy_0_0_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_7_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_7_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_6_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_6_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_5_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_5_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_4_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_4_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_3_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_3_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_2_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_1_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_0_obj (
      .ld(reg_vec_rsc_triosy_0_6_obj_ld_cse),
      .lz(twiddle_rsc_triosy_0_0_lz)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) COMP_LOOP_1_rem_cmp (
      .a(COMP_LOOP_1_rem_cmp_a),
      .b(nl_COMP_LOOP_1_rem_cmp_b[64:0]),
      .z(COMP_LOOP_1_rem_cmp_z)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd1),
  .width_s(32'sd4),
  .width_z(32'sd9)) STAGE_LOOP_base_lshift_rg (
      .a(1'b1),
      .s(nl_STAGE_LOOP_base_lshift_rg_s[3:0]),
      .z(STAGE_LOOP_base_lshift_itm)
    );
  peaceNTT_core_wait_dp peaceNTT_core_wait_dp_inst (
      .clk(clk),
      .xt_rsc_0_0_cgo_iro(nl_peaceNTT_core_wait_dp_inst_xt_rsc_0_0_cgo_iro[0:0]),
      .xt_rsc_0_0_i_clken_d(xt_rsc_0_0_i_clken_d),
      .xt_rsc_0_1_cgo_iro(nl_peaceNTT_core_wait_dp_inst_xt_rsc_0_1_cgo_iro[0:0]),
      .xt_rsc_0_1_i_clken_d(xt_rsc_0_1_i_clken_d),
      .xt_rsc_0_2_cgo_iro(mux_88_rmff),
      .xt_rsc_0_2_i_clken_d(xt_rsc_0_2_i_clken_d),
      .xt_rsc_0_3_cgo_iro(mux_99_rmff),
      .xt_rsc_0_3_i_clken_d(xt_rsc_0_3_i_clken_d),
      .xt_rsc_0_4_cgo_iro(mux_109_rmff),
      .xt_rsc_0_4_i_clken_d(xt_rsc_0_4_i_clken_d),
      .xt_rsc_0_5_cgo_iro(mux_122_rmff),
      .xt_rsc_0_5_i_clken_d(xt_rsc_0_5_i_clken_d),
      .xt_rsc_0_6_cgo_iro(mux_130_rmff),
      .xt_rsc_0_6_i_clken_d(xt_rsc_0_6_i_clken_d),
      .xt_rsc_0_7_cgo_iro(mux_140_rmff),
      .xt_rsc_0_7_i_clken_d(xt_rsc_0_7_i_clken_d),
      .COMP_LOOP_1_f2_rem_cmp_z(COMP_LOOP_1_f2_rem_cmp_z),
      .xt_rsc_0_0_cgo(reg_xt_rsc_0_0_cgo_cse),
      .xt_rsc_0_1_cgo(reg_xt_rsc_0_1_cgo_cse),
      .xt_rsc_0_2_cgo(reg_xt_rsc_0_2_cgo_cse),
      .xt_rsc_0_3_cgo(reg_xt_rsc_0_3_cgo_cse),
      .xt_rsc_0_4_cgo(reg_xt_rsc_0_4_cgo_cse),
      .xt_rsc_0_5_cgo(reg_xt_rsc_0_5_cgo_cse),
      .xt_rsc_0_6_cgo(reg_xt_rsc_0_6_cgo_cse),
      .xt_rsc_0_7_cgo(reg_xt_rsc_0_7_cgo_cse),
      .COMP_LOOP_1_f2_rem_cmp_z_oreg(COMP_LOOP_1_f2_rem_cmp_z_oreg)
    );
  peaceNTT_core_core_fsm peaceNTT_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .COPY_LOOP_C_2_tr0(nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0[0:0]),
      .COMP_LOOP_C_244_tr0(nl_peaceNTT_core_core_fsm_inst_COMP_LOOP_C_244_tr0[0:0]),
      .COPY_LOOP_1_C_2_tr0(nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_8_nl = (COMP_LOOP_r_10_2_sva[0]) | (fsm_output[7:3]!=5'b00000);
  assign mux_61_nl = MUX_s_1_2_2(or_tmp_8, or_8_nl, fsm_output[0]);
  assign or_7_nl = ((fsm_output[0]) & (COMP_LOOP_r_10_2_sva[1])) | (COMP_LOOP_r_10_2_sva[0])
      | (fsm_output[7:3]!=5'b00000);
  assign mux_62_cse = MUX_s_1_2_2(mux_61_nl, or_7_nl, fsm_output[1]);
  assign or_15_nl = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b000) | (fsm_output[7:3]!=5'b00000);
  assign mux_65_nl = MUX_s_1_2_2(mux_64_cse, or_tmp_8, or_11_cse);
  assign mux_66_nl = MUX_s_1_2_2(or_15_nl, mux_65_nl, fsm_output[0]);
  assign nand_nl = ~((fsm_output[1]) & (~ mux_66_nl));
  assign mux_67_itm = MUX_s_1_2_2(nand_nl, mux_62_cse, fsm_output[2]);
  assign or_31_nl = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b001) | (fsm_output[7:3]!=5'b00000);
  assign mux_77_nl = MUX_s_1_2_2(mux_64_cse, or_tmp_8, or_27_cse);
  assign mux_78_nl = MUX_s_1_2_2(or_31_nl, mux_77_nl, fsm_output[0]);
  assign nand_1_nl = ~((fsm_output[1]) & (~ mux_78_nl));
  assign mux_79_itm = MUX_s_1_2_2(nand_1_nl, mux_62_cse, fsm_output[2]);
  assign nor_117_nl = ~((fsm_output[7:4]!=4'b0000));
  assign and_238_nl = (fsm_output[7:4]==4'b1111);
  assign mux_84_cse = MUX_s_1_2_2(nor_117_nl, and_238_nl, fsm_output[3]);
  assign mux_85_cse = MUX_s_1_2_2(mux_84_cse, nor_108_cse, COMP_LOOP_r_10_2_sva[1]);
  assign nor_109_cse = ~((COMP_LOOP_r_10_2_sva[1]) | nand_21_cse);
  assign nor_111_nl = ~((fsm_output[0]) | (COMP_LOOP_r_10_2_sva[1]) | nand_21_cse);
  assign mux_82_nl = MUX_s_1_2_2(nor_110_cse, nor_111_nl, COMP_LOOP_r_10_2_sva[0]);
  assign nor_113_nl = ~((COMP_LOOP_r_10_2_sva[1]) | (fsm_output[7:3]!=5'b00000));
  assign mux_81_nl = MUX_s_1_2_2(nor_112_cse, nor_113_nl, COMP_LOOP_r_10_2_sva[0]);
  assign mux_83_cse = MUX_s_1_2_2(mux_82_nl, mux_81_nl, fsm_output[1]);
  assign nor_106_nl = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b010) | (fsm_output[7:3]!=5'b00000));
  assign or_38_nl = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b010);
  assign mux_86_nl = MUX_s_1_2_2(mux_85_cse, nor_109_cse, or_38_nl);
  assign mux_87_nl = MUX_s_1_2_2(nor_106_nl, mux_86_nl, and_239_cse);
  assign and_237_nl = (fsm_output[1]) & mux_87_nl;
  assign mux_88_rmff = MUX_s_1_2_2(and_237_nl, mux_83_cse, fsm_output[2]);
  assign nor_98_nl = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b011) | (fsm_output[7:3]!=5'b00000));
  assign or_53_nl = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b011);
  assign mux_97_nl = MUX_s_1_2_2(mux_85_cse, nor_109_cse, or_53_nl);
  assign mux_98_nl = MUX_s_1_2_2(nor_98_nl, mux_97_nl, and_239_cse);
  assign and_234_nl = (fsm_output[1]) & mux_98_nl;
  assign mux_99_rmff = MUX_s_1_2_2(and_234_nl, mux_83_cse, fsm_output[2]);
  assign nor_94_nl = ~((fsm_output[0]) | (~ nor_tmp_19));
  assign mux_102_nl = MUX_s_1_2_2(nor_94_nl, nor_110_cse, COMP_LOOP_r_10_2_sva[0]);
  assign nor_96_nl = ~((~ (COMP_LOOP_r_10_2_sva[1])) | (fsm_output[7:3]!=5'b00000));
  assign mux_101_nl = MUX_s_1_2_2(nor_96_nl, nor_112_cse, COMP_LOOP_r_10_2_sva[0]);
  assign mux_103_cse = MUX_s_1_2_2(mux_102_nl, mux_101_nl, fsm_output[1]);
  assign mux_105_cse = MUX_s_1_2_2(nor_108_cse, mux_84_cse, COMP_LOOP_r_10_2_sva[1]);
  assign nor_20_nl = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b100));
  assign mux_106_nl = MUX_s_1_2_2(nor_tmp_19, mux_105_cse, nor_20_nl);
  assign mux_107_nl = MUX_s_1_2_2(or_tmp_60, (~ mux_106_nl), fsm_output[0]);
  assign mux_108_nl = MUX_s_1_2_2(mux_107_nl, or_tmp_60, COMP_LOOP_r_10_2_sva[0]);
  assign and_231_nl = (fsm_output[1]) & (~ mux_108_nl);
  assign mux_109_rmff = MUX_s_1_2_2(and_231_nl, mux_103_cse, fsm_output[2]);
  assign nor_24_nl = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b101));
  assign mux_119_nl = MUX_s_1_2_2(nor_tmp_19, mux_105_cse, nor_24_nl);
  assign mux_120_nl = MUX_s_1_2_2(or_tmp_71, (~ mux_119_nl), fsm_output[0]);
  assign mux_121_nl = MUX_s_1_2_2(mux_120_nl, or_tmp_71, COMP_LOOP_r_10_2_sva[0]);
  assign and_227_nl = (fsm_output[1]) & (~ mux_121_nl);
  assign mux_122_rmff = MUX_s_1_2_2(and_227_nl, mux_103_cse, fsm_output[2]);
  assign nor_83_nl = ~((~ (COMP_LOOP_r_10_2_sva[0])) | (fsm_output[7:3]!=5'b00000));
  assign mux_124_nl = MUX_s_1_2_2(nor_tmp_26, nor_83_nl, fsm_output[0]);
  assign nor_84_nl = ~((~((~ (fsm_output[0])) | (COMP_LOOP_r_10_2_sva[1]))) | (~
      (COMP_LOOP_r_10_2_sva[0])) | (fsm_output[7:3]!=5'b00000));
  assign mux_125_cse = MUX_s_1_2_2(mux_124_nl, nor_84_nl, fsm_output[1]);
  assign mux_127_cse = MUX_s_1_2_2(nor_108_cse, mux_84_cse, and_225_cse);
  assign nor_80_nl = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b110) | (fsm_output[7:3]!=5'b00000));
  assign mux_128_nl = MUX_s_1_2_2(nor_tmp_26, mux_127_cse, nor_27_cse);
  assign mux_129_nl = MUX_s_1_2_2(nor_80_nl, mux_128_nl, fsm_output[0]);
  assign and_223_nl = (fsm_output[1]) & mux_129_nl;
  assign mux_130_rmff = MUX_s_1_2_2(and_223_nl, mux_125_cse, fsm_output[2]);
  assign nor_74_nl = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b111) | (fsm_output[7:3]!=5'b00000));
  assign mux_138_nl = MUX_s_1_2_2(nor_tmp_26, mux_127_cse, and_220_cse);
  assign mux_139_nl = MUX_s_1_2_2(nor_74_nl, mux_138_nl, fsm_output[0]);
  assign and_217_nl = (fsm_output[1]) & mux_139_nl;
  assign mux_140_rmff = MUX_s_1_2_2(and_217_nl, mux_125_cse, fsm_output[2]);
  assign and_214_cse = (COMP_LOOP_r_10_2_sva[0]) & (STAGE_LOOP_base_8_0_sva[2]);
  assign COMP_LOOP_1_f2_rem_cmp_a = {reg_COMP_LOOP_1_f2_rem_cmp_a_ftd , reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1};
  assign COMP_LOOP_1_f2_rem_cmp_b = reg_COMP_LOOP_1_rem_cmp_b_63_0_cse;
  assign or_cse = (fsm_output[1:0]!=2'b00);
  assign nor_119_cse_1 = ~((fsm_output[5:4]!=2'b00));
  assign nor_cse_1 = ~((fsm_output[7:6]!=2'b00));
  assign or_220_cse = (fsm_output[2:1]!=2'b00);
  assign COMP_LOOP_f2_nor_cse = ~((STAGE_LOOP_base_8_0_sva[1]) | (COMP_LOOP_1_f2_and_cse_6_0_sva[0]));
  assign COMP_LOOP_f2_nor_3_cse = ~((STAGE_LOOP_base_8_0_sva[0]) | (COMP_LOOP_1_f2_and_cse_6_0_sva[0]));
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_nl = MUX_v_64_2_2((xt_rsc_0_5_i_q_d[63:0]),
      (xt_rsc_0_1_i_q_d[63:0]), and_dcpl_170);
  assign COMP_LOOP_COMP_LOOP_mux_1_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux_nl}),
      z_out_3, and_dcpl_141);
  assign nand_31_cse = ~((fsm_output[6:5]==2'b11));
  assign or_247_cse = (fsm_output[6:5]!=2'b00);
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_1_nl = MUX_v_64_2_2((xt_rsc_0_6_i_q_d[63:0]),
      (xt_rsc_0_2_i_q_d[63:0]), and_dcpl_170);
  assign COMP_LOOP_COMP_LOOP_mux_2_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux_1_nl}),
      z_out_3, and_dcpl_144);
  assign and_346_cse = (fsm_output[2:1]==2'b11);
  assign nor_160_cse = ~((fsm_output[6:5]!=2'b00));
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_2_nl = MUX_v_64_2_2((xt_rsc_0_0_i_q_d[63:0]),
      (xt_rsc_0_4_i_q_d[63:0]), and_dcpl_172);
  assign COMP_LOOP_or_5_nl = and_dcpl_133 | and_dcpl_137 | and_dcpl_141 | and_dcpl_144;
  assign COMP_LOOP_COMP_LOOP_mux_4_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux_2_nl}),
      z_out_1, COMP_LOOP_or_5_nl);
  assign or_239_cse = (fsm_output[7:5]!=3'b100);
  assign or_238_cse = (fsm_output[7:5]!=3'b011);
  assign COMP_LOOP_f1_or_cse = and_dcpl_191 | and_dcpl_194 | and_dcpl_197 | and_dcpl_200;
  assign or_12_cse = (COMP_LOOP_r_10_2_sva[1:0]!=2'b00);
  assign or_223_cse = (fsm_output[7:4]!=4'b0000);
  assign nand_20_nl = ~((fsm_output[7:4]==4'b1111));
  assign mux_63_nl = MUX_s_1_2_2(or_223_cse, nand_20_nl, fsm_output[3]);
  assign or_13_nl = (fsm_output[7:3]!=5'b00000);
  assign mux_64_cse = MUX_s_1_2_2(mux_63_nl, or_13_nl, or_12_cse);
  assign or_11_cse = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b000);
  assign or_27_cse = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b001);
  assign nor_108_cse = ~((fsm_output[7:3]!=5'b00000));
  assign and_239_cse = (COMP_LOOP_r_10_2_sva[0]) & (fsm_output[0]);
  assign nor_110_cse = ~((~ (fsm_output[0])) | (fsm_output[3]) | (fsm_output[4])
      | (fsm_output[5]) | (fsm_output[6]) | (fsm_output[7]));
  assign nor_112_cse = ~((fsm_output[0]) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[5])
      | (fsm_output[6]) | (fsm_output[7]));
  assign and_225_cse = (COMP_LOOP_r_10_2_sva[1:0]==2'b11);
  assign nor_27_cse = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b110));
  assign and_220_cse = (COPY_LOOP_1_i_12_3_sva_1[2:0]==3'b111);
  assign COMP_LOOP_4_f2_mul_mut_mx0w0 = conv_u2u_128_128((COMP_LOOP_1_acc_1_itm[63:0])
      * (COMP_LOOP_4_acc_1_itm[63:0]));
  assign COMP_LOOP_1_f2_and_cse_6_0_sva_1 = (COMP_LOOP_r_10_2_sva[6:0]) & (STAGE_LOOP_base_8_0_sva[8:2]);
  assign nl_STAGE_LOOP_acc_nl = conv_u2s_4_5(STAGE_LOOP_base_acc_cse_sva) + 5'b11111;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign nor_tmp_2 = (fsm_output[2]) & (fsm_output[1]) & (fsm_output[4]) & (fsm_output[5])
      & (fsm_output[6]) & (fsm_output[7]);
  assign nand_21_cse = ~((fsm_output[7:3]==5'b11111));
  assign or_tmp_8 = (COMP_LOOP_r_10_2_sva[1:0]!=2'b00) | nand_21_cse;
  assign and_dcpl_6 = (fsm_output[3:2]==2'b10);
  assign and_dcpl_7 = (fsm_output[1:0]==2'b11);
  assign and_dcpl_9 = (fsm_output[5:4]==2'b11);
  assign and_dcpl_10 = (fsm_output[7:6]==2'b11);
  assign and_dcpl_11 = and_dcpl_10 & and_dcpl_9;
  assign and_dcpl_12 = and_dcpl_11 & and_dcpl_7 & and_dcpl_6;
  assign and_dcpl_13 = (fsm_output[3:2]==2'b01);
  assign and_dcpl_14 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_15 = and_dcpl_14 & and_dcpl_13;
  assign and_dcpl_18 = nor_cse_1 & nor_119_cse_1;
  assign and_dcpl_19 = and_dcpl_18 & and_dcpl_15;
  assign and_dcpl_20 = (fsm_output[2:1]==2'b01);
  assign not_tmp_25 = ~((fsm_output[3]) & (fsm_output[0]) & (fsm_output[4]) & (fsm_output[5])
      & (fsm_output[6]) & (fsm_output[7]));
  assign or_tmp_16 = (COMP_LOOP_r_10_2_sva[1:0]!=2'b00) | not_tmp_25;
  assign or_tmp_18 = (fsm_output[3]) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[5])
      | (fsm_output[6]) | (fsm_output[7]);
  assign nor_tmp_7 = (fsm_output[0]) & (fsm_output[4]) & (fsm_output[5]) & (fsm_output[6])
      & (fsm_output[7]);
  assign nor_114_nl = ~((fsm_output[0]) | (fsm_output[4]) | (fsm_output[5]) | (fsm_output[6])
      | (fsm_output[7]));
  assign mux_tmp_12 = MUX_s_1_2_2(nor_114_nl, nor_tmp_7, fsm_output[3]);
  assign mux_tmp_13 = MUX_s_1_2_2((~ mux_tmp_12), or_tmp_18, or_12_cse);
  assign and_dcpl_22 = ~((fsm_output[3]) | (COMP_LOOP_r_10_2_sva[0]));
  assign and_dcpl_23 = nor_119_cse_1 & (fsm_output[2]);
  assign or_tmp_20 = (fsm_output[1:0]!=2'b01);
  assign mux_tmp_15 = MUX_s_1_2_2((~ (fsm_output[1])), (fsm_output[1]), fsm_output[0]);
  assign or_43_nl = (COMP_LOOP_r_10_2_sva[1:0]!=2'b01);
  assign mux_tmp_33 = MUX_s_1_2_2((~ mux_tmp_12), or_tmp_18, or_43_nl);
  assign or_tmp_43 = (COMP_LOOP_r_10_2_sva[1:0]!=2'b01) | not_tmp_25;
  assign and_dcpl_30 = ~((fsm_output[6:4]!=3'b000));
  assign and_dcpl_31 = and_dcpl_30 & and_dcpl_13;
  assign nor_tmp_19 = (COMP_LOOP_r_10_2_sva[1]) & (fsm_output[7:3]==5'b11111);
  assign or_tmp_60 = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b100) | (fsm_output[7:3]!=5'b00000);
  assign or_tmp_64 = (COMP_LOOP_r_10_2_sva[0]) | (~((COMP_LOOP_r_10_2_sva[1]) & (fsm_output[3])
      & (fsm_output[0]) & (fsm_output[4]) & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7])));
  assign mux_110_nl = MUX_s_1_2_2(or_tmp_18, (~ mux_tmp_12), COMP_LOOP_r_10_2_sva[1]);
  assign mux_tmp_55 = MUX_s_1_2_2(mux_110_nl, or_tmp_18, COMP_LOOP_r_10_2_sva[0]);
  assign or_tmp_71 = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b101) | (fsm_output[7:3]!=5'b00000);
  assign nor_tmp_26 = (COMP_LOOP_r_10_2_sva[1:0]==2'b11) & (fsm_output[7:3]==5'b11111);
  assign mux_tmp_75 = MUX_s_1_2_2((~ or_tmp_18), mux_tmp_12, and_225_cse);
  assign nor_tmp_32 = (COMP_LOOP_r_10_2_sva[1:0]==2'b11) & (fsm_output[3]) & (fsm_output[0])
      & (fsm_output[4]) & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[7]);
  assign and_dcpl_40 = (~ (fsm_output[3])) & (COMP_LOOP_r_10_2_sva[0]);
  assign and_dcpl_46 = (fsm_output[0]) & (~ (fsm_output[2]));
  assign and_dcpl_48 = ~((fsm_output[4]) | (fsm_output[1]));
  assign and_dcpl_49 = nor_cse_1 & (~ (fsm_output[5]));
  assign and_dcpl_50 = and_dcpl_49 & and_dcpl_48;
  assign and_dcpl_55 = (fsm_output[3:2]==2'b11);
  assign and_dcpl_56 = ~((fsm_output[1:0]!=2'b00));
  assign and_dcpl_57 = and_dcpl_56 & and_dcpl_55;
  assign and_dcpl_58 = (fsm_output[7:6]==2'b10);
  assign and_dcpl_60 = and_dcpl_58 & and_dcpl_9 & and_dcpl_57;
  assign and_dcpl_61 = (fsm_output[4]) & (fsm_output[2]);
  assign nor_72_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[5])
      | (~ (fsm_output[6])) | (fsm_output[7]));
  assign nor_73_nl = ~((fsm_output[0]) | (fsm_output[1]) | (~ (fsm_output[5])) |
      (fsm_output[6]) | (~ (fsm_output[7])));
  assign not_tmp_85 = MUX_s_1_2_2(nor_72_nl, nor_73_nl, fsm_output[3]);
  assign and_dcpl_64 = and_dcpl_14 & and_dcpl_6;
  assign and_dcpl_65 = and_dcpl_11 & and_dcpl_64;
  assign and_dcpl_66 = (fsm_output[5:4]==2'b01);
  assign and_dcpl_68 = and_dcpl_10 & and_dcpl_66 & and_dcpl_64;
  assign and_dcpl_69 = (fsm_output[6]) & (fsm_output[4]);
  assign nor_70_nl = ~((~ (fsm_output[2])) | (~ (fsm_output[0])) | (fsm_output[1])
      | (~ (fsm_output[5])) | (fsm_output[7]));
  assign nor_71_nl = ~((fsm_output[2]) | (fsm_output[0]) | (~ (fsm_output[1])) |
      (fsm_output[5]) | (~ (fsm_output[7])));
  assign not_tmp_86 = MUX_s_1_2_2(nor_70_nl, nor_71_nl, fsm_output[3]);
  assign and_dcpl_72 = and_dcpl_56 & and_dcpl_6;
  assign and_dcpl_73 = and_dcpl_11 & and_dcpl_72;
  assign and_dcpl_75 = (fsm_output[7]) & (fsm_output[4]);
  assign nor_68_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[5])
      | (fsm_output[6]));
  assign nor_69_nl = ~((fsm_output[1:0]!=2'b00) | nand_31_cse);
  assign not_tmp_88 = MUX_s_1_2_2(nor_68_nl, nor_69_nl, fsm_output[3]);
  assign and_dcpl_80 = and_dcpl_58 & and_dcpl_66 & and_dcpl_14 & and_dcpl_55;
  assign and_dcpl_82 = (~ (fsm_output[6])) & (fsm_output[4]);
  assign nor_66_nl = ~((~ (fsm_output[0])) | (fsm_output[1]) | (~ (fsm_output[5]))
      | (fsm_output[7]));
  assign nor_67_nl = ~((fsm_output[0]) | (~ (fsm_output[1])) | (fsm_output[5]) |
      (~ (fsm_output[7])));
  assign not_tmp_89 = MUX_s_1_2_2(nor_66_nl, nor_67_nl, fsm_output[2]);
  assign or_tmp_99 = (fsm_output[2:0]!=3'b000);
  assign and_dcpl_98 = and_dcpl_30 & and_dcpl_13 & (STAGE_LOOP_base_8_0_sva[0]);
  assign or_tmp_107 = and_214_cse | (fsm_output[1:0]!=2'b01);
  assign or_tmp_109 = (fsm_output[1:0]!=2'b10);
  assign and_dcpl_102 = and_dcpl_30 & and_dcpl_13 & (STAGE_LOOP_base_8_0_sva[1]);
  assign and_dcpl_107 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_129 = and_dcpl_10 & (fsm_output[5]) & (fsm_output[4]) & (~ (fsm_output[1]));
  assign and_dcpl_131 = (fsm_output[5:4]==2'b10);
  assign and_dcpl_133 = nor_cse_1 & and_dcpl_131 & and_dcpl_15;
  assign mux_tmp_107 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), or_247_cse);
  assign or_tmp_122 = (fsm_output[4]) | mux_tmp_107;
  assign or_126_nl = (fsm_output[7:5]!=3'b001);
  assign mux_tmp_108 = MUX_s_1_2_2(mux_tmp_107, or_126_nl, fsm_output[4]);
  assign or_tmp_126 = (~ (fsm_output[5])) | (fsm_output[7]);
  assign or_tmp_127 = (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_165_nl = MUX_s_1_2_2(or_tmp_127, or_tmp_126, fsm_output[6]);
  assign or_128_nl = nor_160_cse | (fsm_output[7]);
  assign mux_tmp_110 = MUX_s_1_2_2(mux_165_nl, or_128_nl, fsm_output[4]);
  assign mux_172_nl = MUX_s_1_2_2(or_239_cse, mux_tmp_107, fsm_output[4]);
  assign mux_170_nl = MUX_s_1_2_2(or_tmp_127, (fsm_output[7]), fsm_output[6]);
  assign or_131_nl = (fsm_output[5]) | (fsm_output[7]);
  assign mux_169_nl = MUX_s_1_2_2(or_tmp_126, or_131_nl, fsm_output[6]);
  assign mux_171_nl = MUX_s_1_2_2(mux_170_nl, mux_169_nl, fsm_output[4]);
  assign mux_173_nl = MUX_s_1_2_2(mux_172_nl, mux_171_nl, fsm_output[2]);
  assign mux_tmp_118 = MUX_s_1_2_2(mux_173_nl, or_tmp_122, fsm_output[3]);
  assign and_dcpl_134 = and_dcpl_56 & and_dcpl_13;
  assign and_dcpl_135 = (fsm_output[7:6]==2'b01);
  assign and_dcpl_137 = and_dcpl_135 & nor_119_cse_1 & and_dcpl_134;
  assign and_dcpl_138 = ~((fsm_output[3:2]!=2'b00));
  assign and_dcpl_141 = and_dcpl_135 & and_dcpl_131 & and_dcpl_14 & and_dcpl_138;
  assign and_dcpl_142 = and_dcpl_56 & and_dcpl_138;
  assign and_dcpl_144 = and_dcpl_58 & nor_119_cse_1 & and_dcpl_142;
  assign and_dcpl_146 = and_dcpl_18 & and_dcpl_7 & and_dcpl_13;
  assign or_tmp_132 = (fsm_output[5:4]!=2'b01);
  assign mux_tmp_125 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[4]);
  assign or_tmp_133 = (fsm_output[6:5]!=2'b01);
  assign or_tmp_137 = (fsm_output[6:5]!=2'b10);
  assign mux_tmp_129 = MUX_s_1_2_2(or_tmp_137, or_tmp_133, fsm_output[4]);
  assign or_tmp_150 = (fsm_output[5:4]!=2'b10);
  assign or_172_nl = (fsm_output[0]) | (fsm_output[1]) | (fsm_output[4]) | (fsm_output[5])
      | (fsm_output[6]) | (fsm_output[7]);
  assign mux_209_itm = MUX_s_1_2_2(or_223_cse, or_172_nl, fsm_output[2]);
  assign or_dcpl_10 = (fsm_output[3:2]!=2'b01);
  assign and_dcpl_166 = (~ (fsm_output[0])) & (fsm_output[2]);
  assign and_dcpl_169 = and_dcpl_49 & (~ (fsm_output[4])) & (fsm_output[1]);
  assign and_dcpl_170 = and_dcpl_169 & and_dcpl_166 & and_dcpl_22;
  assign and_dcpl_172 = and_dcpl_169 & and_dcpl_166 & and_dcpl_40;
  assign and_dcpl_189 = (fsm_output[0]) & (fsm_output[2]) & (~ (fsm_output[3]));
  assign and_dcpl_191 = and_dcpl_169 & and_dcpl_189 & (COMP_LOOP_r_10_2_sva[1:0]==2'b00);
  assign and_dcpl_194 = and_dcpl_169 & and_dcpl_189 & (COMP_LOOP_r_10_2_sva[1:0]==2'b01);
  assign and_dcpl_197 = and_dcpl_169 & and_dcpl_189 & (COMP_LOOP_r_10_2_sva[1:0]==2'b10);
  assign and_dcpl_200 = and_dcpl_169 & and_dcpl_189 & (COMP_LOOP_r_10_2_sva[1:0]==2'b11);
  assign or_dcpl_29 = or_223_cse | (fsm_output[1:0]!=2'b11) | or_dcpl_10;
  assign or_dcpl_30 = (fsm_output[3:2]!=2'b10);
  assign COPY_LOOP_1_i_12_3_sva_1_mx0c0 = and_dcpl_18 & and_dcpl_142;
  assign COPY_LOOP_1_i_12_3_sva_1_mx0c2 = and_dcpl_18 & and_dcpl_107 & and_dcpl_13;
  assign or_175_nl = (fsm_output[3]) | (~ (fsm_output[2])) | (fsm_output[0]) | (fsm_output[4])
      | (fsm_output[5]) | (fsm_output[6]) | (fsm_output[7]);
  assign or_174_nl = (~ (fsm_output[2])) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[5])
      | (fsm_output[6]) | (fsm_output[7]);
  assign or_173_nl = (fsm_output[2]) | (~ nor_tmp_7);
  assign mux_211_nl = MUX_s_1_2_2(or_174_nl, or_173_nl, fsm_output[3]);
  assign mux_212_nl = MUX_s_1_2_2(or_175_nl, mux_211_nl, COPY_LOOP_1_i_12_3_sva_1[9]);
  assign COMP_LOOP_r_10_2_sva_mx0c0 = ~(mux_212_nl | (fsm_output[1]));
  assign mux_182_nl = MUX_s_1_2_2(mux_tmp_125, or_tmp_132, or_cse);
  assign mux_183_nl = MUX_s_1_2_2(mux_tmp_125, mux_182_nl, fsm_output[2]);
  assign mux_184_nl = MUX_s_1_2_2(mux_183_nl, (fsm_output[5]), fsm_output[3]);
  assign and_150_ssc = (~ mux_184_nl) & nor_cse_1;
  assign or_139_nl = (fsm_output[6:4]!=3'b011);
  assign mux_186_nl = MUX_s_1_2_2(mux_tmp_129, or_139_nl, and_dcpl_7);
  assign or_138_nl = (~((fsm_output[0]) | (fsm_output[1]) | (fsm_output[4]))) | (fsm_output[6:5]!=2'b01);
  assign mux_187_nl = MUX_s_1_2_2(mux_186_nl, or_138_nl, fsm_output[2]);
  assign mux_188_nl = MUX_s_1_2_2(mux_187_nl, or_tmp_133, fsm_output[3]);
  assign nor_121_ssc = ~(mux_188_nl | (fsm_output[7]));
  assign mux_189_nl = MUX_s_1_2_2(mux_tmp_125, or_tmp_132, fsm_output[1]);
  assign or_143_nl = and_dcpl_48 | (fsm_output[5]);
  assign mux_190_nl = MUX_s_1_2_2(mux_189_nl, or_143_nl, fsm_output[0]);
  assign or_141_nl = (fsm_output[3:2]!=2'b00);
  assign mux_191_nl = MUX_s_1_2_2(mux_190_nl, (fsm_output[5]), or_141_nl);
  assign and_152_ssc = (~ mux_191_nl) & and_dcpl_135;
  assign nand_11_cse = ~((fsm_output[2]) & (fsm_output[0]) & (fsm_output[1]) & (fsm_output[4]));
  assign or_221_nl = (fsm_output[2]) | (fsm_output[0]) | (fsm_output[1]) | (fsm_output[4]);
  assign mux_192_nl = MUX_s_1_2_2(or_221_nl, nand_11_cse, fsm_output[3]);
  assign and_154_ssc = mux_192_nl & and_dcpl_135 & (fsm_output[5]);
  assign and_208_cse = (fsm_output[1]) & (fsm_output[4]);
  assign or_151_nl = and_208_cse | (fsm_output[7:5]!=3'b100);
  assign or_149_nl = (fsm_output[7:4]!=4'b1000);
  assign mux_193_nl = MUX_s_1_2_2(or_239_cse, or_238_cse, fsm_output[4]);
  assign mux_194_nl = MUX_s_1_2_2(or_149_nl, mux_193_nl, fsm_output[1]);
  assign mux_195_nl = MUX_s_1_2_2(or_151_nl, mux_194_nl, fsm_output[0]);
  assign mux_196_itm = MUX_s_1_2_2(or_239_cse, mux_195_nl, and_dcpl_55);
  assign nand_24_nl = ~((~((fsm_output[0]) & (fsm_output[1]) & (fsm_output[4])))
      & (fsm_output[5]));
  assign mux_197_nl = MUX_s_1_2_2(or_tmp_150, mux_tmp_125, or_cse);
  assign mux_198_nl = MUX_s_1_2_2(nand_24_nl, mux_197_nl, fsm_output[2]);
  assign mux_199_nl = MUX_s_1_2_2((fsm_output[5]), (~ mux_198_nl), fsm_output[3]);
  assign and_155_ssc = mux_199_nl & and_dcpl_58;
  assign or_158_nl = and_208_cse | (fsm_output[6:5]!=2'b10);
  assign or_156_nl = (fsm_output[6:4]!=3'b100);
  assign mux_200_nl = MUX_s_1_2_2(or_156_nl, mux_tmp_129, fsm_output[1]);
  assign mux_201_nl = MUX_s_1_2_2(or_158_nl, mux_200_nl, fsm_output[0]);
  assign mux_202_nl = MUX_s_1_2_2(mux_201_nl, mux_tmp_129, fsm_output[2]);
  assign mux_203_nl = MUX_s_1_2_2(or_tmp_137, mux_202_nl, fsm_output[3]);
  assign and_156_ssc = (~ mux_203_nl) & (fsm_output[7]);
  assign nand_22_nl = ~(nand_11_cse & (fsm_output[5]));
  assign mux_204_nl = MUX_s_1_2_2(or_tmp_150, mux_tmp_125, or_tmp_99);
  assign mux_205_nl = MUX_s_1_2_2(nand_22_nl, mux_204_nl, fsm_output[3]);
  assign and_157_ssc = (~ mux_205_nl) & and_dcpl_10;
  assign and_178_m1c = and_dcpl_18 & and_dcpl_72;
  assign mux_146_nl = MUX_s_1_2_2(and_346_cse, (~ or_tmp_99), fsm_output[3]);
  assign and_98_nl = mux_146_nl & and_dcpl_18;
  assign COMP_LOOP_f2_mux_12_rmff = MUX_v_6_2_2((COMP_LOOP_1_f2_and_cse_6_0_sva_1[6:1]),
      (COMP_LOOP_1_f2_and_cse_6_0_sva[6:1]), and_98_nl);
  assign COMP_LOOP_f2_mux_11_rmff = MUX_v_6_2_2((COMP_LOOP_1_f2_and_cse_6_0_sva_1[6:1]),
      (COMP_LOOP_1_f2_and_cse_6_0_sva[6:1]), and_dcpl_19);
  assign COPY_LOOP_mux_nl = MUX_v_64_2_2(vec_rsc_0_2_i_q_d, result_rsc_0_2_i_q_d,
      and_dcpl_12);
  assign COPY_LOOP_mux_4_nl = MUX_v_64_2_2(vec_rsc_0_0_i_q_d, result_rsc_0_0_i_q_d,
      and_dcpl_12);
  assign xt_rsc_0_0_i_d_d_pff = {COPY_LOOP_mux_nl , COPY_LOOP_mux_4_nl};
  assign xt_rsc_0_0_i_radr_d_pff = MUX_v_7_2_2((COMP_LOOP_r_10_2_sva[7:1]), (COMP_LOOP_r_10_2_sva[8:2]),
      and_dcpl_19);
  assign xt_rsc_0_0_i_wadr_d_pff = MUX_v_7_2_2((COPY_LOOP_1_i_12_3_sva_1[9:3]), (COMP_LOOP_r_10_2_sva[8:2]),
      and_dcpl_12);
  assign mux_70_nl = MUX_s_1_2_2(mux_tmp_13, or_tmp_16, or_11_cse);
  assign xt_rsc_0_0_i_we_d_pff = (~ mux_70_nl) & and_dcpl_20;
  assign mux_72_nl = MUX_s_1_2_2(mux_tmp_15, or_tmp_20, COMP_LOOP_r_10_2_sva[1]);
  assign xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff = (~ mux_72_nl) & nor_cse_1
      & and_dcpl_23 & and_dcpl_22;
  assign COPY_LOOP_mux_3_nl = MUX_v_64_2_2(vec_rsc_0_6_i_q_d, result_rsc_0_6_i_q_d,
      and_dcpl_12);
  assign COPY_LOOP_mux_5_nl = MUX_v_64_2_2(vec_rsc_0_4_i_q_d, result_rsc_0_4_i_q_d,
      and_dcpl_12);
  assign xt_rsc_0_1_i_d_d_pff = {COPY_LOOP_mux_3_nl , COPY_LOOP_mux_5_nl};
  assign mux_80_nl = MUX_s_1_2_2(mux_tmp_13, or_tmp_16, or_27_cse);
  assign xt_rsc_0_1_i_we_d_pff = (~ mux_80_nl) & and_dcpl_20;
  assign nor_14_nl = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b010));
  assign mux_90_nl = MUX_s_1_2_2(or_tmp_43, mux_tmp_33, nor_14_nl);
  assign xt_rsc_0_2_i_we_d_pff = (~ mux_90_nl) & and_dcpl_20;
  assign or_47_nl = (COMP_LOOP_r_10_2_sva[1]) | (fsm_output[1:0]!=2'b10);
  assign mux_91_nl = MUX_s_1_2_2(or_tmp_20, or_47_nl, COMP_LOOP_r_10_2_sva[0]);
  assign xt_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_pff = (~ mux_91_nl) & (~
      (fsm_output[7])) & and_dcpl_31;
  assign nor_18_nl = ~((COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b011));
  assign mux_100_nl = MUX_s_1_2_2(or_tmp_43, mux_tmp_33, nor_18_nl);
  assign xt_rsc_0_3_i_we_d_pff = (~ mux_100_nl) & and_dcpl_20;
  assign or_65_nl = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b100);
  assign mux_112_nl = MUX_s_1_2_2(mux_tmp_55, or_tmp_64, or_65_nl);
  assign xt_rsc_0_4_i_we_d_pff = (~ mux_112_nl) & and_dcpl_20;
  assign or_68_nl = (~ (COMP_LOOP_r_10_2_sva[1])) | (fsm_output[1:0]!=2'b10);
  assign mux_113_nl = MUX_s_1_2_2(or_68_nl, or_tmp_20, COMP_LOOP_r_10_2_sva[0]);
  assign xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff = (~ mux_113_nl) & (~
      (fsm_output[7])) & and_dcpl_31;
  assign or_76_nl = (COPY_LOOP_1_i_12_3_sva_1[2:0]!=3'b101);
  assign mux_123_nl = MUX_s_1_2_2(mux_tmp_55, or_tmp_64, or_76_nl);
  assign xt_rsc_0_5_i_we_d_pff = (~ mux_123_nl) & and_dcpl_20;
  assign mux_132_nl = MUX_s_1_2_2(nor_tmp_32, mux_tmp_75, nor_27_cse);
  assign xt_rsc_0_6_i_we_d_pff = mux_132_nl & and_dcpl_20;
  assign mux_133_nl = MUX_s_1_2_2(or_tmp_20, mux_tmp_15, COMP_LOOP_r_10_2_sva[1]);
  assign xt_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d_pff = (~ mux_133_nl) & nor_cse_1
      & and_dcpl_23 & and_dcpl_40;
  assign mux_141_nl = MUX_s_1_2_2(nor_tmp_32, mux_tmp_75, and_220_cse);
  assign xt_rsc_0_7_i_we_d_pff = mux_141_nl & and_dcpl_20;
  assign vec_rsc_0_0_i_radr_d_pff = COPY_LOOP_1_i_12_3_sva_1[9:1];
  assign vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff = and_dcpl_50 & and_dcpl_46
      & (~ (fsm_output[3])) & (~ (COPY_LOOP_1_i_12_3_sva_1[0]));
  assign vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff = and_dcpl_50 & and_dcpl_46
      & (~ (fsm_output[3])) & (COPY_LOOP_1_i_12_3_sva_1[0]);
  assign result_rsc_0_0_i_d_d_pff = MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z[63:0]), COMP_LOOP_1_f2_rem_cmp_z_oreg,
      and_dcpl_60);
  assign result_rsc_0_0_i_radr_d_pff = COMP_LOOP_r_10_2_sva;
  assign result_rsc_0_0_i_wadr_d = {(~ and_dcpl_60) , (COMP_LOOP_r_10_2_sva[8:1])};
  assign result_rsc_0_0_i_we_d_pff = not_tmp_85 & and_dcpl_61 & (~ (COMP_LOOP_r_10_2_sva[0]));
  assign result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff = and_dcpl_65;
  assign result_rsc_0_1_i_d_d_pff = MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z[63:0]), COMP_LOOP_1_f2_rem_cmp_z_oreg,
      and_dcpl_68);
  assign result_rsc_0_1_i_wadr_d = {(~ and_dcpl_68) , (COMP_LOOP_r_10_2_sva[8:1])};
  assign result_rsc_0_1_i_we_d_pff = not_tmp_86 & and_dcpl_69 & (~ (COMP_LOOP_r_10_2_sva[0]));
  assign result_rsc_0_2_i_d_d_pff = MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z[63:0]), COMP_LOOP_1_f2_rem_cmp_z_oreg,
      and_dcpl_73);
  assign result_rsc_0_2_i_wadr_d = {(~ and_dcpl_73) , (COMP_LOOP_r_10_2_sva[8:1])};
  assign result_rsc_0_2_i_we_d_pff = not_tmp_88 & and_dcpl_75 & (~ (fsm_output[2]))
      & (~ (COMP_LOOP_r_10_2_sva[0]));
  assign result_rsc_0_3_i_d_d_pff = MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z[63:0]), COMP_LOOP_1_f2_rem_cmp_z_oreg,
      and_dcpl_80);
  assign result_rsc_0_3_i_wadr_d = {(~ and_dcpl_80) , (COMP_LOOP_r_10_2_sva[8:1])};
  assign result_rsc_0_3_i_we_d_pff = not_tmp_89 & and_dcpl_82 & (fsm_output[3]) &
      (~ (COMP_LOOP_r_10_2_sva[0]));
  assign result_rsc_0_4_i_wadr_d = {(~ and_dcpl_60) , (COMP_LOOP_r_10_2_sva[8:1])};
  assign result_rsc_0_4_i_we_d_pff = not_tmp_85 & and_dcpl_61 & (COMP_LOOP_r_10_2_sva[0]);
  assign result_rsc_0_5_i_wadr_d = {(~ and_dcpl_68) , (COMP_LOOP_r_10_2_sva[8:1])};
  assign result_rsc_0_5_i_we_d_pff = not_tmp_86 & and_dcpl_69 & (COMP_LOOP_r_10_2_sva[0]);
  assign result_rsc_0_6_i_wadr_d = {(~ and_dcpl_73) , (COMP_LOOP_r_10_2_sva[8:1])};
  assign result_rsc_0_6_i_we_d_pff = not_tmp_88 & and_dcpl_75 & (~ (fsm_output[2]))
      & (COMP_LOOP_r_10_2_sva[0]);
  assign result_rsc_0_7_i_wadr_d = {(~ and_dcpl_80) , (COMP_LOOP_r_10_2_sva[8:1])};
  assign result_rsc_0_7_i_we_d_pff = not_tmp_89 & and_dcpl_82 & (fsm_output[3]) &
      (COMP_LOOP_r_10_2_sva[0]);
  assign twiddle_rsc_0_0_i_radr_d = {1'b0 , (COMP_LOOP_r_10_2_sva[8:7]) , COMP_LOOP_f2_mux_12_rmff};
  assign nor_63_nl = ~((COMP_LOOP_1_f2_and_cse_6_0_sva[0]) | (fsm_output[3:2]!=2'b10));
  assign nor_64_nl = ~((STAGE_LOOP_base_8_0_sva[1]) | (COMP_LOOP_1_f2_and_cse_6_0_sva[0])
      | (fsm_output[3:2]!=2'b01));
  assign mux_148_nl = MUX_s_1_2_2(nor_63_nl, nor_64_nl, fsm_output[1]);
  assign or_104_nl = (STAGE_LOOP_base_8_0_sva[1]) | and_214_cse | (fsm_output[3:2]!=2'b01);
  assign or_102_nl = (COMP_LOOP_1_f2_and_cse_6_0_sva[0]) | (fsm_output[3:2]!=2'b01);
  assign mux_147_nl = MUX_s_1_2_2(or_104_nl, or_102_nl, fsm_output[1]);
  assign nor_65_nl = ~((STAGE_LOOP_base_8_0_sva[0]) | mux_147_nl);
  assign mux_149_nl = MUX_s_1_2_2(mux_148_nl, nor_65_nl, fsm_output[0]);
  assign twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d = mux_149_nl & and_dcpl_18;
  assign twiddle_rsc_0_1_i_radr_d = {1'b0 , (COMP_LOOP_r_10_2_sva[8:7]) , COMP_LOOP_f2_mux_11_rmff};
  assign mux_246_nl = MUX_s_1_2_2(mux_tmp_15, or_tmp_109, and_214_cse);
  assign mux_151_nl = MUX_s_1_2_2(mux_246_nl, or_tmp_109, STAGE_LOOP_base_8_0_sva[1]);
  assign or_110_nl = (STAGE_LOOP_base_8_0_sva[1]) | or_tmp_107;
  assign mux_152_nl = MUX_s_1_2_2(mux_151_nl, or_110_nl, COMP_LOOP_1_f2_and_cse_6_0_sva[0]);
  assign twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d = (~ mux_152_nl) & (~
      (fsm_output[7])) & and_dcpl_98;
  assign twiddle_rsc_0_2_i_radr_d = {1'b0 , (COMP_LOOP_r_10_2_sva[8:7]) , COMP_LOOP_f2_mux_11_rmff};
  assign mux_231_nl = MUX_s_1_2_2(mux_tmp_15, or_tmp_109, and_214_cse);
  assign mux_153_nl = MUX_s_1_2_2(mux_231_nl, or_tmp_107, COMP_LOOP_1_f2_and_cse_6_0_sva[0]);
  assign or_113_nl = (COMP_LOOP_1_f2_and_cse_6_0_sva[0]) | (fsm_output[1:0]!=2'b10);
  assign mux_154_nl = MUX_s_1_2_2(mux_153_nl, or_113_nl, STAGE_LOOP_base_8_0_sva[0]);
  assign twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d = (~ mux_154_nl) & (~
      (fsm_output[7])) & and_dcpl_102;
  assign twiddle_rsc_0_3_i_radr_d = {1'b0 , (COMP_LOOP_r_10_2_sva[8:7]) , (COMP_LOOP_1_f2_and_cse_6_0_sva_1[6:1])};
  assign twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_49 & (~((COMP_LOOP_r_10_2_sva[0])
      & (STAGE_LOOP_base_8_0_sva[2]))) & (~ (fsm_output[4])) & and_dcpl_107 & (fsm_output[3:2]==2'b01)
      & (STAGE_LOOP_base_8_0_sva[1:0]==2'b11);
  assign twiddle_rsc_0_4_i_radr_d = {1'b0 , (COMP_LOOP_r_10_2_sva[8:7]) , COMP_LOOP_f2_mux_12_rmff};
  assign nor_59_nl = ~((~ (COMP_LOOP_1_f2_and_cse_6_0_sva[0])) | (fsm_output[3:2]!=2'b10));
  assign nor_60_nl = ~((STAGE_LOOP_base_8_0_sva[1:0]!=2'b00) | (~ (COMP_LOOP_r_10_2_sva[0]))
      | (~ (STAGE_LOOP_base_8_0_sva[2])) | (fsm_output[3:2]!=2'b01));
  assign mux_156_nl = MUX_s_1_2_2(nor_59_nl, nor_60_nl, fsm_output[0]);
  assign nor_61_nl = ~((STAGE_LOOP_base_8_0_sva[1]) | (~ (COMP_LOOP_1_f2_and_cse_6_0_sva[0]))
      | (fsm_output[3:2]!=2'b01));
  assign nor_62_nl = ~((STAGE_LOOP_base_8_0_sva[0]) | (~ (COMP_LOOP_1_f2_and_cse_6_0_sva[0]))
      | (fsm_output[3:2]!=2'b01));
  assign mux_155_nl = MUX_s_1_2_2(nor_61_nl, nor_62_nl, fsm_output[0]);
  assign mux_157_nl = MUX_s_1_2_2(mux_156_nl, mux_155_nl, fsm_output[1]);
  assign twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d = mux_157_nl & and_dcpl_18;
  assign twiddle_rsc_0_5_i_radr_d = {1'b0 , (COMP_LOOP_r_10_2_sva[8:7]) , COMP_LOOP_f2_mux_11_rmff};
  assign or_120_nl = (STAGE_LOOP_base_8_0_sva[2:1]!=2'b10) | (~ (COMP_LOOP_r_10_2_sva[0]))
      | (fsm_output[1:0]!=2'b01);
  assign nor_43_nl = ~((STAGE_LOOP_base_8_0_sva[2:1]!=2'b10) | (~ (COMP_LOOP_r_10_2_sva[0])));
  assign mux_158_nl = MUX_s_1_2_2(or_tmp_109, mux_tmp_15, nor_43_nl);
  assign mux_159_nl = MUX_s_1_2_2(or_120_nl, mux_158_nl, COMP_LOOP_1_f2_and_cse_6_0_sva[0]);
  assign twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d = (~ mux_159_nl) & (~
      (fsm_output[7])) & and_dcpl_98;
  assign twiddle_rsc_0_6_i_radr_d = {1'b0 , (COMP_LOOP_r_10_2_sva[8:7]) , COMP_LOOP_f2_mux_11_rmff};
  assign nand_12_nl = ~((STAGE_LOOP_base_8_0_sva[2]) & (COMP_LOOP_r_10_2_sva[0])
      & (fsm_output[1:0]==2'b01));
  assign mux_160_nl = MUX_s_1_2_2(or_tmp_109, mux_tmp_15, and_214_cse);
  assign mux_161_nl = MUX_s_1_2_2(nand_12_nl, mux_160_nl, COMP_LOOP_1_f2_and_cse_6_0_sva[0]);
  assign or_122_nl = (~ (COMP_LOOP_1_f2_and_cse_6_0_sva[0])) | (fsm_output[1:0]!=2'b10);
  assign mux_162_nl = MUX_s_1_2_2(mux_161_nl, or_122_nl, STAGE_LOOP_base_8_0_sva[0]);
  assign twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d = (~ mux_162_nl) & (~
      (fsm_output[7])) & and_dcpl_102;
  assign twiddle_rsc_0_7_i_radr_d = {1'b0 , (COMP_LOOP_r_10_2_sva[8:7]) , (COMP_LOOP_1_f2_and_cse_6_0_sva_1[6:1])};
  assign twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_49 & and_dcpl_48
      & (fsm_output[0]) & and_dcpl_13 & (COMP_LOOP_r_10_2_sva[0]) & (STAGE_LOOP_base_8_0_sva[2:0]==3'b111);
  assign and_dcpl_215 = (~ (fsm_output[0])) & (fsm_output[5]);
  assign and_dcpl_217 = (~ (fsm_output[4])) & (fsm_output[1]);
  assign and_dcpl_222 = ~((fsm_output[0]) | (fsm_output[5]));
  assign and_dcpl_246 = ~((fsm_output!=8'b00000100));
  assign and_dcpl_270 = (~ (fsm_output[0])) & (~ (fsm_output[5])) & nor_cse_1;
  assign and_dcpl_273 = and_dcpl_6 & (~ (fsm_output[4])) & (~ (fsm_output[1]));
  assign or_tmp_188 = (fsm_output[2]) | (fsm_output[1]) | (fsm_output[5]) | (fsm_output[7])
      | (fsm_output[6]);
  assign and_272_itm = and_dcpl_13 & and_dcpl_48 & and_dcpl_222 & and_dcpl_135;
  assign and_276_itm = and_dcpl_138 & and_dcpl_217 & and_dcpl_215 & and_dcpl_135;
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_116_nl, nor_tmp_2, fsm_output[3]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_xt_rsc_0_0_cgo_cse <= 1'b0;
      reg_xt_rsc_0_1_cgo_cse <= 1'b0;
      reg_xt_rsc_0_2_cgo_cse <= 1'b0;
      reg_xt_rsc_0_3_cgo_cse <= 1'b0;
      reg_xt_rsc_0_4_cgo_cse <= 1'b0;
      reg_xt_rsc_0_5_cgo_cse <= 1'b0;
      reg_xt_rsc_0_6_cgo_cse <= 1'b0;
      reg_xt_rsc_0_7_cgo_cse <= 1'b0;
      reg_vec_rsc_triosy_0_6_obj_ld_cse <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_nor_2_itm <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_and_8_itm <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_and_10_itm <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_and_11_itm <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_and_12_itm <= 1'b0;
    end
    else begin
      reg_xt_rsc_0_0_cgo_cse <= ~ mux_67_itm;
      reg_xt_rsc_0_1_cgo_cse <= ~ mux_79_itm;
      reg_xt_rsc_0_2_cgo_cse <= mux_88_rmff;
      reg_xt_rsc_0_3_cgo_cse <= mux_99_rmff;
      reg_xt_rsc_0_4_cgo_cse <= mux_109_rmff;
      reg_xt_rsc_0_5_cgo_cse <= mux_122_rmff;
      reg_xt_rsc_0_6_cgo_cse <= mux_130_rmff;
      reg_xt_rsc_0_7_cgo_cse <= mux_140_rmff;
      reg_vec_rsc_triosy_0_6_obj_ld_cse <= and_dcpl_129 & (fsm_output[0]) & STAGE_LOOP_acc_itm_4_1
          & and_dcpl_55;
      COMP_LOOP_f2_COMP_LOOP_f2_nor_2_itm <= ~((COMP_LOOP_1_f2_and_cse_6_0_sva_1[0])
          | (STAGE_LOOP_base_8_0_sva[1:0]!=2'b00));
      COMP_LOOP_f2_COMP_LOOP_f2_and_8_itm <= (STAGE_LOOP_base_8_0_sva[1:0]==2'b11)
          & (~ (COMP_LOOP_1_f2_and_cse_6_0_sva_1[0]));
      COMP_LOOP_f2_COMP_LOOP_f2_and_10_itm <= (COMP_LOOP_1_f2_and_cse_6_0_sva_1[0])
          & (STAGE_LOOP_base_8_0_sva[1:0]==2'b01);
      COMP_LOOP_f2_COMP_LOOP_f2_and_11_itm <= (COMP_LOOP_1_f2_and_cse_6_0_sva_1[0])
          & (STAGE_LOOP_base_8_0_sva[1:0]==2'b10);
      COMP_LOOP_f2_COMP_LOOP_f2_and_12_itm <= (COMP_LOOP_1_f2_and_cse_6_0_sva_1[0])
          & (STAGE_LOOP_base_8_0_sva[1:0]==2'b11);
    end
  end
  always @(posedge clk) begin
    COMP_LOOP_1_rem_cmp_a <= MUX_v_65_2_2(({COMP_LOOP_acc_5_mut_64 , COMP_LOOP_acc_5_mut_63_0}),
        z_out_1, mux_180_nl);
    reg_COMP_LOOP_1_rem_cmp_b_63_0_cse <= p_sva;
    tmp_15_sva_3 <= twiddle_rsc_0_5_i_q_d;
    reg_COMP_LOOP_1_f2_rem_cmp_a_ftd <= MUX_v_63_2_2(63'b000000000000000000000000000000000000000000000000000000000000000,
        COMP_LOOP_f2_mux1h_nl, COMP_LOOP_f2_nor_5_nl);
    reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1 <= MUX1HOT_v_65_9_2((COMP_LOOP_4_f2_mul_mut_mx0w0[64:0]),
        (COMP_LOOP_4_f2_mul_mut[64:0]), (COMP_LOOP_1_f2_mul_itm[64:0]), (COMP_LOOP_2_f2_mul_itm[64:0]),
        (COMP_LOOP_3_f2_mul_itm[64:0]), COMP_LOOP_4_acc_1_itm, COMP_LOOP_1_acc_1_itm,
        ({COMP_LOOP_2_acc_1_itm_64 , COMP_LOOP_2_acc_1_itm_63_0}), ({COMP_LOOP_3_acc_1_itm_64
        , COMP_LOOP_3_acc_1_itm_63_0}), {and_dcpl_146 , and_150_ssc , nor_121_ssc
        , and_152_ssc , and_154_ssc , (~ mux_196_itm) , and_155_ssc , and_156_ssc
        , and_157_ssc});
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COPY_LOOP_1_i_12_3_sva_1 <= 10'b0000000000;
    end
    else if ( COPY_LOOP_1_i_12_3_sva_1_mx0c0 | (and_dcpl_18 & and_dcpl_7 & and_dcpl_138)
        | COPY_LOOP_1_i_12_3_sva_1_mx0c2 | and_dcpl_65 ) begin
      COPY_LOOP_1_i_12_3_sva_1 <= MUX_v_10_2_2(10'b0000000000, COPY_LOOP_i_COPY_LOOP_i_mux_nl,
          COPY_LOOP_1_i_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COPY_LOOP_i_12_2_sva_1 <= 11'b00000000000;
    end
    else if ( ~(or_223_cse | or_tmp_20 | (fsm_output[3:2]!=2'b00)) ) begin
      COPY_LOOP_i_12_2_sva_1 <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2((~ mux_209_itm), nor_tmp_2, fsm_output[3]) ) begin
      STAGE_LOOP_base_acc_cse_sva <= MUX_v_4_2_2(4'b1010, (z_out_2[3:0]), and_163_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_r_10_2_sva <= 9'b000000000;
    end
    else if ( COMP_LOOP_r_10_2_sva_mx0c0 | (and_dcpl_129 & and_dcpl_46 & (fsm_output[3])
        & (~ (COPY_LOOP_1_i_12_3_sva_1[9]))) | (and_dcpl_11 & and_dcpl_57) ) begin
      COMP_LOOP_r_10_2_sva <= MUX_v_9_2_2(9'b000000000, (COPY_LOOP_1_i_12_3_sva_1[8:0]),
          COMP_LOOP_r_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_base_8_0_sva <= 9'b000000000;
    end
    else if ( MUX_s_1_2_2((~ mux_209_itm), and_204_nl, fsm_output[3]) ) begin
      STAGE_LOOP_base_8_0_sva <= STAGE_LOOP_base_lshift_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_f2_and_cse_6_0_sva <= 7'b0000000;
    end
    else if ( ~(or_223_cse | or_tmp_20 | or_dcpl_10) ) begin
      COMP_LOOP_1_f2_and_cse_6_0_sva <= COMP_LOOP_1_f2_and_cse_6_0_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( (mux_218_nl & (~ (fsm_output[7])) & and_dcpl_30) | and_dcpl_137 ) begin
      COMP_LOOP_1_acc_1_itm <= MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_mux1h_6_nl}), z_out_3,
          and_dcpl_137);
    end
  end
  always @(posedge clk) begin
    if ( mux_232_nl & (~((fsm_output[7]) | (fsm_output[4]))) ) begin
      COMP_LOOP_2_acc_1_itm_64 <= COMP_LOOP_COMP_LOOP_mux_1_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( (~(mux_233_nl | (fsm_output[7]))) & (~((fsm_output[4]) | (fsm_output[0])))
        & (fsm_output[1]) & (~ (fsm_output[3])) ) begin
      COMP_LOOP_2_acc_1_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_1_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_234_nl & (fsm_output[4:3]==2'b00) & nor_160_cse ) begin
      COMP_LOOP_3_acc_1_itm_64 <= COMP_LOOP_COMP_LOOP_mux_2_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( (~(mux_235_nl | (fsm_output[3]))) & nor_119_cse_1 & (~((fsm_output[6]) |
        (fsm_output[0]))) ) begin
      COMP_LOOP_3_acc_1_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_2_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_18 & and_346_cse & (~ (fsm_output[3]))) | and_dcpl_133 ) begin
      COMP_LOOP_4_acc_1_itm <= MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_mux1h_4_nl}), z_out_3,
          and_dcpl_133);
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_241_nl | (fsm_output[4])) ) begin
      COMP_LOOP_acc_5_mut_64 <= COMP_LOOP_COMP_LOOP_mux_4_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( mux_244_nl & (~((fsm_output[4]) | (fsm_output[3]) | (fsm_output[0]))) )
        begin
      COMP_LOOP_acc_5_mut_63_0 <= COMP_LOOP_COMP_LOOP_mux_4_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_f1_or_cse ) begin
      tmp_2_127_64_lpi_3_dfm <= MUX1HOT_v_64_4_2((xt_rsc_0_0_i_q_d[127:64]), (xt_rsc_0_2_i_q_d[127:64]),
          (xt_rsc_0_4_i_q_d[127:64]), (xt_rsc_0_6_i_q_d[127:64]), {and_dcpl_191 ,
          and_dcpl_194 , and_dcpl_197 , and_dcpl_200});
      tmp_63_0_lpi_3_dfm <= MUX1HOT_v_64_4_2((xt_rsc_0_0_i_q_d[63:0]), (xt_rsc_0_2_i_q_d[63:0]),
          (xt_rsc_0_4_i_q_d[63:0]), (xt_rsc_0_6_i_q_d[63:0]), {and_dcpl_191 , and_dcpl_194
          , and_dcpl_197 , and_dcpl_200});
      tmp_4_63_0_lpi_3_dfm <= MUX1HOT_v_64_4_2((xt_rsc_0_1_i_q_d[63:0]), (xt_rsc_0_3_i_q_d[63:0]),
          (xt_rsc_0_5_i_q_d[63:0]), (xt_rsc_0_7_i_q_d[63:0]), {and_dcpl_191 , and_dcpl_194
          , and_dcpl_197 , and_dcpl_200});
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_29 ) begin
      tmp_6_127_64_lpi_3_dfm <= MUX_v_64_4_2((xt_rsc_0_1_i_q_d[127:64]), (xt_rsc_0_3_i_q_d[127:64]),
          (xt_rsc_0_5_i_q_d[127:64]), (xt_rsc_0_7_i_q_d[127:64]), COMP_LOOP_r_10_2_sva[1:0]);
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_29 ) begin
      COMP_LOOP_4_f2_mul_mut <= COMP_LOOP_4_f2_mul_mut_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_223_cse | (fsm_output[1:0]!=2'b00) | or_dcpl_30) ) begin
      COMP_LOOP_3_f2_mul_itm <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_223_cse | or_tmp_20 | or_dcpl_30) ) begin
      COMP_LOOP_2_f2_mul_itm <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_223_cse | or_tmp_109 | or_dcpl_30) ) begin
      COMP_LOOP_1_f2_mul_itm <= z_out_4;
    end
  end
  assign nor_116_nl = ~((fsm_output[2]) | (fsm_output[1]) | (fsm_output[0]) | (fsm_output[4])
      | (fsm_output[5]) | (fsm_output[6]) | (fsm_output[7]));
  assign nand_6_nl = ~((fsm_output[4]) & (~ mux_tmp_107));
  assign mux_177_nl = MUX_s_1_2_2(nand_6_nl, mux_tmp_110, fsm_output[2]);
  assign mux_176_nl = MUX_s_1_2_2(mux_tmp_108, or_tmp_122, fsm_output[2]);
  assign mux_178_nl = MUX_s_1_2_2(mux_177_nl, mux_176_nl, fsm_output[3]);
  assign mux_179_nl = MUX_s_1_2_2(mux_178_nl, mux_tmp_118, fsm_output[1]);
  assign mux_167_nl = MUX_s_1_2_2(mux_tmp_110, mux_tmp_108, fsm_output[2]);
  assign mux_168_nl = MUX_s_1_2_2(mux_167_nl, or_tmp_122, fsm_output[3]);
  assign mux_175_nl = MUX_s_1_2_2(mux_tmp_118, mux_168_nl, fsm_output[1]);
  assign mux_180_nl = MUX_s_1_2_2(mux_179_nl, mux_175_nl, fsm_output[0]);
  assign COMP_LOOP_f2_mux1h_nl = MUX1HOT_v_63_5_2((COMP_LOOP_4_f2_mul_mut_mx0w0[127:65]),
      (COMP_LOOP_4_f2_mul_mut[127:65]), (COMP_LOOP_1_f2_mul_itm[127:65]), (COMP_LOOP_2_f2_mul_itm[127:65]),
      (COMP_LOOP_3_f2_mul_itm[127:65]), {and_dcpl_146 , and_150_ssc , nor_121_ssc
      , and_152_ssc , and_154_ssc});
  assign COMP_LOOP_f2_nor_5_nl = ~((~ mux_196_itm) | and_155_ssc | and_156_ssc |
      and_157_ssc);
  assign nl_COMP_LOOP_acc_nl = conv_u2u_9_10(COMP_LOOP_r_10_2_sva) + 10'b0000000001;
  assign COMP_LOOP_acc_nl = nl_COMP_LOOP_acc_nl[9:0];
  assign COPY_LOOP_i_or_nl = COPY_LOOP_1_i_12_3_sva_1_mx0c2 | and_dcpl_65;
  assign COPY_LOOP_i_COPY_LOOP_i_mux_nl = MUX_v_10_2_2((COPY_LOOP_i_12_2_sva_1[9:0]),
      COMP_LOOP_acc_nl, COPY_LOOP_i_or_nl);
  assign COPY_LOOP_1_i_not_nl = ~ COPY_LOOP_1_i_12_3_sva_1_mx0c0;
  assign and_163_nl = and_dcpl_18 & and_dcpl_134;
  assign COMP_LOOP_r_not_nl = ~ COMP_LOOP_r_10_2_sva_mx0c0;
  assign and_204_nl = or_220_cse & (fsm_output[7:4]==4'b1111);
  assign COMP_LOOP_f2_or_nl = (COMP_LOOP_f2_COMP_LOOP_f2_nor_2_itm & and_dcpl_19)
      | (COMP_LOOP_f2_nor_cse & and_dcpl_146) | (COMP_LOOP_f2_nor_3_cse & and_178_m1c)
      | (and_dcpl_50 & and_dcpl_46 & (fsm_output[3]) & (~ (COMP_LOOP_1_f2_and_cse_6_0_sva[0])));
  assign COMP_LOOP_f2_COMP_LOOP_f2_and_6_nl = (STAGE_LOOP_base_8_0_sva[0]) & COMP_LOOP_f2_nor_cse
      & and_dcpl_19;
  assign COMP_LOOP_f2_or_1_nl = ((STAGE_LOOP_base_8_0_sva[1]) & COMP_LOOP_f2_nor_3_cse
      & and_dcpl_19) | ((STAGE_LOOP_base_8_0_sva[1]) & (~ (COMP_LOOP_1_f2_and_cse_6_0_sva[0]))
      & and_dcpl_146);
  assign COMP_LOOP_f2_and_4_nl = COMP_LOOP_f2_COMP_LOOP_f2_and_8_itm & and_dcpl_19;
  assign COMP_LOOP_f2_or_2_nl = ((COMP_LOOP_1_f2_and_cse_6_0_sva[0]) & (STAGE_LOOP_base_8_0_sva[1:0]==2'b00)
      & and_dcpl_19) | ((COMP_LOOP_1_f2_and_cse_6_0_sva[0]) & (~ (STAGE_LOOP_base_8_0_sva[1]))
      & and_dcpl_146) | ((COMP_LOOP_1_f2_and_cse_6_0_sva[0]) & (~ (STAGE_LOOP_base_8_0_sva[0]))
      & and_178_m1c) | (and_dcpl_50 & and_dcpl_46 & (fsm_output[3]) & (COMP_LOOP_1_f2_and_cse_6_0_sva[0]));
  assign COMP_LOOP_f2_and_7_nl = COMP_LOOP_f2_COMP_LOOP_f2_and_10_itm & and_dcpl_19;
  assign COMP_LOOP_f2_or_3_nl = (COMP_LOOP_f2_COMP_LOOP_f2_and_11_itm & and_dcpl_19)
      | ((STAGE_LOOP_base_8_0_sva[1]) & (COMP_LOOP_1_f2_and_cse_6_0_sva[0]) & and_dcpl_146);
  assign COMP_LOOP_f2_and_10_nl = COMP_LOOP_f2_COMP_LOOP_f2_and_12_itm & and_dcpl_19;
  assign COMP_LOOP_f2_and_11_nl = (STAGE_LOOP_base_8_0_sva[0]) & (~ (COMP_LOOP_1_f2_and_cse_6_0_sva[0]))
      & and_178_m1c;
  assign COMP_LOOP_f2_and_12_nl = (STAGE_LOOP_base_8_0_sva[0]) & (COMP_LOOP_1_f2_and_cse_6_0_sva[0])
      & and_178_m1c;
  assign COMP_LOOP_f2_mux1h_6_nl = MUX1HOT_v_64_10_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
      twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_5_i_q_d,
      twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_7_i_q_d, (COMP_LOOP_4_acc_1_itm[63:0]),
      tmp_15_sva_3, {COMP_LOOP_f2_or_nl , COMP_LOOP_f2_COMP_LOOP_f2_and_6_nl , COMP_LOOP_f2_or_1_nl
      , COMP_LOOP_f2_and_4_nl , COMP_LOOP_f2_or_2_nl , COMP_LOOP_f2_and_7_nl , COMP_LOOP_f2_or_3_nl
      , COMP_LOOP_f2_and_10_nl , COMP_LOOP_f2_and_11_nl , COMP_LOOP_f2_and_12_nl});
  assign mux_218_nl = MUX_s_1_2_2(and_346_cse, (~ or_220_cse), fsm_output[3]);
  assign nor_163_nl = ~((fsm_output[1:0]!=2'b10) | nand_31_cse);
  assign nor_164_nl = ~((fsm_output[1]) | (fsm_output[0]) | (fsm_output[6]) | (fsm_output[5]));
  assign mux_nl = MUX_s_1_2_2(nor_163_nl, nor_164_nl, fsm_output[3]);
  assign nor_165_nl = ~((fsm_output[3]) | (~ (fsm_output[1])) | (fsm_output[6]) |
      (fsm_output[5]));
  assign mux_232_nl = MUX_s_1_2_2(mux_nl, nor_165_nl, fsm_output[2]);
  assign mux_233_nl = MUX_s_1_2_2(nand_31_cse, or_247_cse, fsm_output[2]);
  assign nor_158_nl = ~((fsm_output[2:0]!=3'b000));
  assign mux_234_nl = MUX_s_1_2_2(and_346_cse, nor_158_nl, fsm_output[7]);
  assign nand_29_nl = ~((fsm_output[2:1]==2'b11));
  assign mux_235_nl = MUX_s_1_2_2(nand_29_nl, or_220_cse, fsm_output[7]);
  assign COMP_LOOP_f2_mux1h_4_nl = MUX1HOT_v_64_3_2((xt_rsc_0_7_i_q_d[63:0]), (xt_rsc_0_3_i_q_d[63:0]),
      twiddle_rsc_0_1_i_q_d, {and_dcpl_172 , and_dcpl_170 , and_dcpl_146});
  assign mux_238_nl = MUX_s_1_2_2(or_239_cse, or_238_cse, fsm_output[1]);
  assign or_236_nl = (fsm_output[7:5]!=3'b010);
  assign or_234_nl = (fsm_output[7:6]!=2'b00);
  assign mux_237_nl = MUX_s_1_2_2(or_236_nl, or_234_nl, fsm_output[1]);
  assign mux_239_nl = MUX_s_1_2_2(mux_238_nl, mux_237_nl, fsm_output[2]);
  assign mux_240_nl = MUX_s_1_2_2(mux_239_nl, or_tmp_188, fsm_output[3]);
  assign or_233_nl = (~ (fsm_output[2])) | (~ (fsm_output[1])) | (fsm_output[5])
      | (fsm_output[7]) | (fsm_output[6]);
  assign mux_236_nl = MUX_s_1_2_2(or_233_nl, or_tmp_188, fsm_output[3]);
  assign mux_241_nl = MUX_s_1_2_2(mux_240_nl, mux_236_nl, fsm_output[0]);
  assign nor_149_nl = ~((fsm_output[7:5]!=3'b100));
  assign nor_150_nl = ~((fsm_output[7:5]!=3'b011));
  assign mux_243_nl = MUX_s_1_2_2(nor_149_nl, nor_150_nl, fsm_output[1]);
  assign nor_151_nl = ~((fsm_output[7:5]!=3'b010));
  assign mux_242_nl = MUX_s_1_2_2(nor_151_nl, nor_cse_1, fsm_output[1]);
  assign mux_244_nl = MUX_s_1_2_2(mux_243_nl, mux_242_nl, fsm_output[2]);
  assign and_348_cse = and_dcpl_138 & and_dcpl_48 & and_dcpl_222 & (fsm_output[7:6]==2'b10);
  assign and_347_nl = and_dcpl_13 & and_dcpl_217 & and_dcpl_215 & (fsm_output[7:6]==2'b00);
  assign COMP_LOOP_mux1h_10_nl = MUX1HOT_v_64_4_2(tmp_6_127_64_lpi_3_dfm, tmp_63_0_lpi_3_dfm,
      tmp_2_127_64_lpi_3_dfm, tmp_4_63_0_lpi_3_dfm, {and_347_nl , and_272_itm , and_276_itm
      , and_348_cse});
  assign nl_acc_1_nl = ({1'b1 , COMP_LOOP_mux1h_10_nl , 1'b1}) + conv_u2u_65_66({(~
      COMP_LOOP_1_f2_rem_cmp_z_oreg) , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[65:0];
  assign z_out_1 = readslicef_66_65_1(acc_1_nl);
  assign COPY_LOOP_mux_8_nl = MUX_v_10_2_2(COPY_LOOP_1_i_12_3_sva_1, ({6'b000000
      , STAGE_LOOP_base_acc_cse_sva}), and_dcpl_246);
  assign nl_z_out_2 = conv_u2u_10_11(COPY_LOOP_mux_8_nl) + conv_s2u_2_11({and_dcpl_246
      , 1'b1});
  assign z_out_2 = nl_z_out_2[10:0];
  assign and_350_nl = and_dcpl_13 & and_dcpl_217 & and_dcpl_215 & nor_cse_1;
  assign COMP_LOOP_mux1h_11_nl = MUX1HOT_v_64_4_2(tmp_63_0_lpi_3_dfm, tmp_2_127_64_lpi_3_dfm,
      tmp_4_63_0_lpi_3_dfm, tmp_6_127_64_lpi_3_dfm, {and_272_itm , and_276_itm ,
      and_348_cse , and_350_nl});
  assign nl_z_out_3 = conv_u2u_64_65(COMP_LOOP_mux1h_11_nl) + conv_u2u_64_65(COMP_LOOP_1_f2_rem_cmp_z_oreg);
  assign z_out_3 = nl_z_out_3[64:0];
  assign and_351_nl = and_dcpl_273 & and_dcpl_270;
  assign and_352_nl = and_dcpl_273 & (fsm_output[0]) & (~ (fsm_output[5])) & nor_cse_1;
  assign and_353_nl = and_dcpl_6 & (~ (fsm_output[4])) & (fsm_output[1]) & and_dcpl_270;
  assign COMP_LOOP_f2_mux1h_12_nl = MUX1HOT_v_64_3_2(COMP_LOOP_3_acc_1_itm_63_0,
      COMP_LOOP_2_acc_1_itm_63_0, COMP_LOOP_acc_5_mut_63_0, {and_351_nl , and_352_nl
      , and_353_nl});
  assign z_out_4 = conv_u2u_128_128((COMP_LOOP_1_acc_1_itm[63:0]) * COMP_LOOP_f2_mux1h_12_nl);

  function automatic [62:0] MUX1HOT_v_63_5_2;
    input [62:0] input_4;
    input [62:0] input_3;
    input [62:0] input_2;
    input [62:0] input_1;
    input [62:0] input_0;
    input [4:0] sel;
    reg [62:0] result;
  begin
    result = input_0 & {63{sel[0]}};
    result = result | ( input_1 & {63{sel[1]}});
    result = result | ( input_2 & {63{sel[2]}});
    result = result | ( input_3 & {63{sel[3]}});
    result = result | ( input_4 & {63{sel[4]}});
    MUX1HOT_v_63_5_2 = result;
  end
  endfunction


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


  function automatic [64:0] MUX1HOT_v_65_9_2;
    input [64:0] input_8;
    input [64:0] input_7;
    input [64:0] input_6;
    input [64:0] input_5;
    input [64:0] input_4;
    input [64:0] input_3;
    input [64:0] input_2;
    input [64:0] input_1;
    input [64:0] input_0;
    input [8:0] sel;
    reg [64:0] result;
  begin
    result = input_0 & {65{sel[0]}};
    result = result | ( input_1 & {65{sel[1]}});
    result = result | ( input_2 & {65{sel[2]}});
    result = result | ( input_3 & {65{sel[3]}});
    result = result | ( input_4 & {65{sel[4]}});
    result = result | ( input_5 & {65{sel[5]}});
    result = result | ( input_6 & {65{sel[6]}});
    result = result | ( input_7 & {65{sel[7]}});
    result = result | ( input_8 & {65{sel[8]}});
    MUX1HOT_v_65_9_2 = result;
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


  function automatic [63:0] MUX_v_64_4_2;
    input [63:0] input_0;
    input [63:0] input_1;
    input [63:0] input_2;
    input [63:0] input_3;
    input [1:0] sel;
    reg [63:0] result;
  begin
    case (sel)
      2'b00 : begin
        result = input_0;
      end
      2'b01 : begin
        result = input_1;
      end
      2'b10 : begin
        result = input_2;
      end
      default : begin
        result = input_3;
      end
    endcase
    MUX_v_64_4_2 = result;
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


  function automatic [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
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


  function automatic [10:0] conv_s2u_2_11 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_11 = {{9{vector[1]}}, vector};
  end
  endfunction


  function automatic [4:0] conv_u2s_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_5 =  {1'b0, vector};
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


  function automatic [64:0] conv_u2u_64_65 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_65 = {1'b0, vector};
  end
  endfunction


  function automatic [65:0] conv_u2u_65_66 ;
    input [64:0]  vector ;
  begin
    conv_u2u_65_66 = {1'b0, vector};
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
//  Design Unit:    peaceNTT
// ------------------------------------------------------------------


module peaceNTT (
  clk, rst, vec_rsc_0_0_radr, vec_rsc_0_0_q, vec_rsc_triosy_0_0_lz, vec_rsc_0_2_radr,
      vec_rsc_0_2_q, vec_rsc_triosy_0_2_lz, vec_rsc_0_4_radr, vec_rsc_0_4_q, vec_rsc_triosy_0_4_lz,
      vec_rsc_0_6_radr, vec_rsc_0_6_q, vec_rsc_triosy_0_6_lz, p_rsc_dat, p_rsc_triosy_lz,
      g_rsc_dat, g_rsc_triosy_lz, result_rsc_0_0_wadr, result_rsc_0_0_d, result_rsc_0_0_we,
      result_rsc_0_0_radr, result_rsc_0_0_q, result_rsc_triosy_0_0_lz, result_rsc_0_1_wadr,
      result_rsc_0_1_d, result_rsc_0_1_we, result_rsc_triosy_0_1_lz, result_rsc_0_2_wadr,
      result_rsc_0_2_d, result_rsc_0_2_we, result_rsc_0_2_radr, result_rsc_0_2_q,
      result_rsc_triosy_0_2_lz, result_rsc_0_3_wadr, result_rsc_0_3_d, result_rsc_0_3_we,
      result_rsc_triosy_0_3_lz, result_rsc_0_4_wadr, result_rsc_0_4_d, result_rsc_0_4_we,
      result_rsc_0_4_radr, result_rsc_0_4_q, result_rsc_triosy_0_4_lz, result_rsc_0_5_wadr,
      result_rsc_0_5_d, result_rsc_0_5_we, result_rsc_triosy_0_5_lz, result_rsc_0_6_wadr,
      result_rsc_0_6_d, result_rsc_0_6_we, result_rsc_0_6_radr, result_rsc_0_6_q,
      result_rsc_triosy_0_6_lz, result_rsc_0_7_wadr, result_rsc_0_7_d, result_rsc_0_7_we,
      result_rsc_triosy_0_7_lz, twiddle_rsc_0_0_radr, twiddle_rsc_0_0_q, twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_0_1_radr, twiddle_rsc_0_1_q, twiddle_rsc_triosy_0_1_lz, twiddle_rsc_0_2_radr,
      twiddle_rsc_0_2_q, twiddle_rsc_triosy_0_2_lz, twiddle_rsc_0_3_radr, twiddle_rsc_0_3_q,
      twiddle_rsc_triosy_0_3_lz, twiddle_rsc_0_4_radr, twiddle_rsc_0_4_q, twiddle_rsc_triosy_0_4_lz,
      twiddle_rsc_0_5_radr, twiddle_rsc_0_5_q, twiddle_rsc_triosy_0_5_lz, twiddle_rsc_0_6_radr,
      twiddle_rsc_0_6_q, twiddle_rsc_triosy_0_6_lz, twiddle_rsc_0_7_radr, twiddle_rsc_0_7_q,
      twiddle_rsc_triosy_0_7_lz
);
  input clk;
  input rst;
  output [8:0] vec_rsc_0_0_radr;
  input [63:0] vec_rsc_0_0_q;
  output vec_rsc_triosy_0_0_lz;
  output [8:0] vec_rsc_0_2_radr;
  input [63:0] vec_rsc_0_2_q;
  output vec_rsc_triosy_0_2_lz;
  output [8:0] vec_rsc_0_4_radr;
  input [63:0] vec_rsc_0_4_q;
  output vec_rsc_triosy_0_4_lz;
  output [8:0] vec_rsc_0_6_radr;
  input [63:0] vec_rsc_0_6_q;
  output vec_rsc_triosy_0_6_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] g_rsc_dat;
  output g_rsc_triosy_lz;
  output [8:0] result_rsc_0_0_wadr;
  output [63:0] result_rsc_0_0_d;
  output result_rsc_0_0_we;
  output [8:0] result_rsc_0_0_radr;
  input [63:0] result_rsc_0_0_q;
  output result_rsc_triosy_0_0_lz;
  output [8:0] result_rsc_0_1_wadr;
  output [63:0] result_rsc_0_1_d;
  output result_rsc_0_1_we;
  output result_rsc_triosy_0_1_lz;
  output [8:0] result_rsc_0_2_wadr;
  output [63:0] result_rsc_0_2_d;
  output result_rsc_0_2_we;
  output [8:0] result_rsc_0_2_radr;
  input [63:0] result_rsc_0_2_q;
  output result_rsc_triosy_0_2_lz;
  output [8:0] result_rsc_0_3_wadr;
  output [63:0] result_rsc_0_3_d;
  output result_rsc_0_3_we;
  output result_rsc_triosy_0_3_lz;
  output [8:0] result_rsc_0_4_wadr;
  output [63:0] result_rsc_0_4_d;
  output result_rsc_0_4_we;
  output [8:0] result_rsc_0_4_radr;
  input [63:0] result_rsc_0_4_q;
  output result_rsc_triosy_0_4_lz;
  output [8:0] result_rsc_0_5_wadr;
  output [63:0] result_rsc_0_5_d;
  output result_rsc_0_5_we;
  output result_rsc_triosy_0_5_lz;
  output [8:0] result_rsc_0_6_wadr;
  output [63:0] result_rsc_0_6_d;
  output result_rsc_0_6_we;
  output [8:0] result_rsc_0_6_radr;
  input [63:0] result_rsc_0_6_q;
  output result_rsc_triosy_0_6_lz;
  output [8:0] result_rsc_0_7_wadr;
  output [63:0] result_rsc_0_7_d;
  output result_rsc_0_7_we;
  output result_rsc_triosy_0_7_lz;
  output [8:0] twiddle_rsc_0_0_radr;
  input [63:0] twiddle_rsc_0_0_q;
  output twiddle_rsc_triosy_0_0_lz;
  output [8:0] twiddle_rsc_0_1_radr;
  input [63:0] twiddle_rsc_0_1_q;
  output twiddle_rsc_triosy_0_1_lz;
  output [8:0] twiddle_rsc_0_2_radr;
  input [63:0] twiddle_rsc_0_2_q;
  output twiddle_rsc_triosy_0_2_lz;
  output [8:0] twiddle_rsc_0_3_radr;
  input [63:0] twiddle_rsc_0_3_q;
  output twiddle_rsc_triosy_0_3_lz;
  output [8:0] twiddle_rsc_0_4_radr;
  input [63:0] twiddle_rsc_0_4_q;
  output twiddle_rsc_triosy_0_4_lz;
  output [8:0] twiddle_rsc_0_5_radr;
  input [63:0] twiddle_rsc_0_5_q;
  output twiddle_rsc_triosy_0_5_lz;
  output [8:0] twiddle_rsc_0_6_radr;
  input [63:0] twiddle_rsc_0_6_q;
  output twiddle_rsc_triosy_0_6_lz;
  output [8:0] twiddle_rsc_0_7_radr;
  input [63:0] twiddle_rsc_0_7_q;
  output twiddle_rsc_triosy_0_7_lz;


  // Interconnect Declarations
  wire xt_rsc_0_0_i_clken_d;
  wire [127:0] xt_rsc_0_0_i_q_d;
  wire xt_rsc_0_1_i_clken_d;
  wire [127:0] xt_rsc_0_1_i_q_d;
  wire xt_rsc_0_2_i_clken_d;
  wire [127:0] xt_rsc_0_2_i_q_d;
  wire xt_rsc_0_3_i_clken_d;
  wire [127:0] xt_rsc_0_3_i_q_d;
  wire xt_rsc_0_4_i_clken_d;
  wire [127:0] xt_rsc_0_4_i_q_d;
  wire xt_rsc_0_5_i_clken_d;
  wire [127:0] xt_rsc_0_5_i_q_d;
  wire xt_rsc_0_6_i_clken_d;
  wire [127:0] xt_rsc_0_6_i_q_d;
  wire xt_rsc_0_7_i_clken_d;
  wire [127:0] xt_rsc_0_7_i_q_d;
  wire [63:0] vec_rsc_0_0_i_q_d;
  wire [63:0] vec_rsc_0_2_i_q_d;
  wire [63:0] vec_rsc_0_4_i_q_d;
  wire [63:0] vec_rsc_0_6_i_q_d;
  wire [63:0] result_rsc_0_0_i_q_d;
  wire [8:0] result_rsc_0_0_i_wadr_d;
  wire [8:0] result_rsc_0_1_i_wadr_d;
  wire [63:0] result_rsc_0_2_i_q_d;
  wire [8:0] result_rsc_0_2_i_wadr_d;
  wire [8:0] result_rsc_0_3_i_wadr_d;
  wire [63:0] result_rsc_0_4_i_q_d;
  wire [8:0] result_rsc_0_4_i_wadr_d;
  wire [8:0] result_rsc_0_5_i_wadr_d;
  wire [63:0] result_rsc_0_6_i_q_d;
  wire [8:0] result_rsc_0_6_i_wadr_d;
  wire [8:0] result_rsc_0_7_i_wadr_d;
  wire [63:0] twiddle_rsc_0_0_i_q_d;
  wire [8:0] twiddle_rsc_0_0_i_radr_d;
  wire twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_1_i_q_d;
  wire [8:0] twiddle_rsc_0_1_i_radr_d;
  wire twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_2_i_q_d;
  wire [8:0] twiddle_rsc_0_2_i_radr_d;
  wire twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_3_i_q_d;
  wire [8:0] twiddle_rsc_0_3_i_radr_d;
  wire twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_4_i_q_d;
  wire [8:0] twiddle_rsc_0_4_i_radr_d;
  wire twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_5_i_q_d;
  wire [8:0] twiddle_rsc_0_5_i_radr_d;
  wire twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_6_i_q_d;
  wire [8:0] twiddle_rsc_0_6_i_radr_d;
  wire twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [63:0] twiddle_rsc_0_7_i_q_d;
  wire [8:0] twiddle_rsc_0_7_i_radr_d;
  wire twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d;
  wire [127:0] COMP_LOOP_1_f2_rem_cmp_a;
  wire [63:0] COMP_LOOP_1_f2_rem_cmp_b;
  wire [63:0] COMP_LOOP_1_f2_rem_cmp_z;
  wire xt_rsc_0_0_clken;
  wire [127:0] xt_rsc_0_0_q;
  wire [6:0] xt_rsc_0_0_radr;
  wire xt_rsc_0_0_we;
  wire [127:0] xt_rsc_0_0_d;
  wire [6:0] xt_rsc_0_0_wadr;
  wire xt_rsc_0_1_clken;
  wire [127:0] xt_rsc_0_1_q;
  wire [6:0] xt_rsc_0_1_radr;
  wire xt_rsc_0_1_we;
  wire [127:0] xt_rsc_0_1_d;
  wire [6:0] xt_rsc_0_1_wadr;
  wire xt_rsc_0_2_clken;
  wire [127:0] xt_rsc_0_2_q;
  wire [6:0] xt_rsc_0_2_radr;
  wire xt_rsc_0_2_we;
  wire [127:0] xt_rsc_0_2_d;
  wire [6:0] xt_rsc_0_2_wadr;
  wire xt_rsc_0_3_clken;
  wire [127:0] xt_rsc_0_3_q;
  wire [6:0] xt_rsc_0_3_radr;
  wire xt_rsc_0_3_we;
  wire [127:0] xt_rsc_0_3_d;
  wire [6:0] xt_rsc_0_3_wadr;
  wire xt_rsc_0_4_clken;
  wire [127:0] xt_rsc_0_4_q;
  wire [6:0] xt_rsc_0_4_radr;
  wire xt_rsc_0_4_we;
  wire [127:0] xt_rsc_0_4_d;
  wire [6:0] xt_rsc_0_4_wadr;
  wire xt_rsc_0_5_clken;
  wire [127:0] xt_rsc_0_5_q;
  wire [6:0] xt_rsc_0_5_radr;
  wire xt_rsc_0_5_we;
  wire [127:0] xt_rsc_0_5_d;
  wire [6:0] xt_rsc_0_5_wadr;
  wire xt_rsc_0_6_clken;
  wire [127:0] xt_rsc_0_6_q;
  wire [6:0] xt_rsc_0_6_radr;
  wire xt_rsc_0_6_we;
  wire [127:0] xt_rsc_0_6_d;
  wire [6:0] xt_rsc_0_6_wadr;
  wire xt_rsc_0_7_clken;
  wire [127:0] xt_rsc_0_7_q;
  wire [6:0] xt_rsc_0_7_radr;
  wire xt_rsc_0_7_we;
  wire [127:0] xt_rsc_0_7_d;
  wire [6:0] xt_rsc_0_7_wadr;
  wire [127:0] xt_rsc_0_0_i_d_d_iff;
  wire [6:0] xt_rsc_0_0_i_radr_d_iff;
  wire [6:0] xt_rsc_0_0_i_wadr_d_iff;
  wire xt_rsc_0_0_i_we_d_iff;
  wire xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire [127:0] xt_rsc_0_1_i_d_d_iff;
  wire xt_rsc_0_1_i_we_d_iff;
  wire xt_rsc_0_2_i_we_d_iff;
  wire xt_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire xt_rsc_0_3_i_we_d_iff;
  wire xt_rsc_0_4_i_we_d_iff;
  wire xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire xt_rsc_0_5_i_we_d_iff;
  wire xt_rsc_0_6_i_we_d_iff;
  wire xt_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire xt_rsc_0_7_i_we_d_iff;
  wire [8:0] vec_rsc_0_0_i_radr_d_iff;
  wire vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire [63:0] result_rsc_0_0_i_d_d_iff;
  wire [8:0] result_rsc_0_0_i_radr_d_iff;
  wire result_rsc_0_0_i_we_d_iff;
  wire result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire [63:0] result_rsc_0_1_i_d_d_iff;
  wire result_rsc_0_1_i_we_d_iff;
  wire [63:0] result_rsc_0_2_i_d_d_iff;
  wire result_rsc_0_2_i_we_d_iff;
  wire [63:0] result_rsc_0_3_i_d_d_iff;
  wire result_rsc_0_3_i_we_d_iff;
  wire result_rsc_0_4_i_we_d_iff;
  wire result_rsc_0_5_i_we_d_iff;
  wire result_rsc_0_6_i_we_d_iff;
  wire result_rsc_0_7_i_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  mgc_rem #(.width_a(32'sd128),
  .width_b(32'sd64),
  .signd(32'sd0)) COMP_LOOP_1_f2_rem_cmp (
      .a(COMP_LOOP_1_f2_rem_cmp_a),
      .b(COMP_LOOP_1_f2_rem_cmp_b),
      .z(COMP_LOOP_1_f2_rem_cmp_z)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd128),
  .depth(32'sd128),
  .latency(32'sd1)) xt_rsc_0_0_comp (
      .clk(clk),
      .clken(xt_rsc_0_0_clken),
      .d(xt_rsc_0_0_d),
      .q(xt_rsc_0_0_q),
      .radr(xt_rsc_0_0_radr),
      .wadr(xt_rsc_0_0_wadr),
      .we(xt_rsc_0_0_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd128),
  .depth(32'sd128),
  .latency(32'sd1)) xt_rsc_0_1_comp (
      .clk(clk),
      .clken(xt_rsc_0_1_clken),
      .d(xt_rsc_0_1_d),
      .q(xt_rsc_0_1_q),
      .radr(xt_rsc_0_1_radr),
      .wadr(xt_rsc_0_1_wadr),
      .we(xt_rsc_0_1_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd128),
  .depth(32'sd128),
  .latency(32'sd1)) xt_rsc_0_2_comp (
      .clk(clk),
      .clken(xt_rsc_0_2_clken),
      .d(xt_rsc_0_2_d),
      .q(xt_rsc_0_2_q),
      .radr(xt_rsc_0_2_radr),
      .wadr(xt_rsc_0_2_wadr),
      .we(xt_rsc_0_2_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd128),
  .depth(32'sd128),
  .latency(32'sd1)) xt_rsc_0_3_comp (
      .clk(clk),
      .clken(xt_rsc_0_3_clken),
      .d(xt_rsc_0_3_d),
      .q(xt_rsc_0_3_q),
      .radr(xt_rsc_0_3_radr),
      .wadr(xt_rsc_0_3_wadr),
      .we(xt_rsc_0_3_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd128),
  .depth(32'sd128),
  .latency(32'sd1)) xt_rsc_0_4_comp (
      .clk(clk),
      .clken(xt_rsc_0_4_clken),
      .d(xt_rsc_0_4_d),
      .q(xt_rsc_0_4_q),
      .radr(xt_rsc_0_4_radr),
      .wadr(xt_rsc_0_4_wadr),
      .we(xt_rsc_0_4_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd128),
  .depth(32'sd128),
  .latency(32'sd1)) xt_rsc_0_5_comp (
      .clk(clk),
      .clken(xt_rsc_0_5_clken),
      .d(xt_rsc_0_5_d),
      .q(xt_rsc_0_5_q),
      .radr(xt_rsc_0_5_radr),
      .wadr(xt_rsc_0_5_wadr),
      .we(xt_rsc_0_5_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd128),
  .depth(32'sd128),
  .latency(32'sd1)) xt_rsc_0_6_comp (
      .clk(clk),
      .clken(xt_rsc_0_6_clken),
      .d(xt_rsc_0_6_d),
      .q(xt_rsc_0_6_q),
      .radr(xt_rsc_0_6_radr),
      .wadr(xt_rsc_0_6_wadr),
      .we(xt_rsc_0_6_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd128),
  .depth(32'sd128),
  .latency(32'sd1)) xt_rsc_0_7_comp (
      .clk(clk),
      .clken(xt_rsc_0_7_clken),
      .d(xt_rsc_0_7_d),
      .q(xt_rsc_0_7_q),
      .radr(xt_rsc_0_7_radr),
      .wadr(xt_rsc_0_7_wadr),
      .we(xt_rsc_0_7_we)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen xt_rsc_0_0_i
      (
      .clken(xt_rsc_0_0_clken),
      .q(xt_rsc_0_0_q),
      .radr(xt_rsc_0_0_radr),
      .we(xt_rsc_0_0_we),
      .d(xt_rsc_0_0_d),
      .wadr(xt_rsc_0_0_wadr),
      .clken_d(xt_rsc_0_0_i_clken_d),
      .d_d(xt_rsc_0_0_i_d_d_iff),
      .q_d(xt_rsc_0_0_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen xt_rsc_0_1_i
      (
      .clken(xt_rsc_0_1_clken),
      .q(xt_rsc_0_1_q),
      .radr(xt_rsc_0_1_radr),
      .we(xt_rsc_0_1_we),
      .d(xt_rsc_0_1_d),
      .wadr(xt_rsc_0_1_wadr),
      .clken_d(xt_rsc_0_1_i_clken_d),
      .d_d(xt_rsc_0_1_i_d_d_iff),
      .q_d(xt_rsc_0_1_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_1_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_1_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen xt_rsc_0_2_i
      (
      .clken(xt_rsc_0_2_clken),
      .q(xt_rsc_0_2_q),
      .radr(xt_rsc_0_2_radr),
      .we(xt_rsc_0_2_we),
      .d(xt_rsc_0_2_d),
      .wadr(xt_rsc_0_2_wadr),
      .clken_d(xt_rsc_0_2_i_clken_d),
      .d_d(xt_rsc_0_0_i_d_d_iff),
      .q_d(xt_rsc_0_2_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_2_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_2_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen xt_rsc_0_3_i
      (
      .clken(xt_rsc_0_3_clken),
      .q(xt_rsc_0_3_q),
      .radr(xt_rsc_0_3_radr),
      .we(xt_rsc_0_3_we),
      .d(xt_rsc_0_3_d),
      .wadr(xt_rsc_0_3_wadr),
      .clken_d(xt_rsc_0_3_i_clken_d),
      .d_d(xt_rsc_0_1_i_d_d_iff),
      .q_d(xt_rsc_0_3_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_3_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_3_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen xt_rsc_0_4_i
      (
      .clken(xt_rsc_0_4_clken),
      .q(xt_rsc_0_4_q),
      .radr(xt_rsc_0_4_radr),
      .we(xt_rsc_0_4_we),
      .d(xt_rsc_0_4_d),
      .wadr(xt_rsc_0_4_wadr),
      .clken_d(xt_rsc_0_4_i_clken_d),
      .d_d(xt_rsc_0_0_i_d_d_iff),
      .q_d(xt_rsc_0_4_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen xt_rsc_0_5_i
      (
      .clken(xt_rsc_0_5_clken),
      .q(xt_rsc_0_5_q),
      .radr(xt_rsc_0_5_radr),
      .we(xt_rsc_0_5_we),
      .d(xt_rsc_0_5_d),
      .wadr(xt_rsc_0_5_wadr),
      .clken_d(xt_rsc_0_5_i_clken_d),
      .d_d(xt_rsc_0_1_i_d_d_iff),
      .q_d(xt_rsc_0_5_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_5_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_5_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen xt_rsc_0_6_i
      (
      .clken(xt_rsc_0_6_clken),
      .q(xt_rsc_0_6_q),
      .radr(xt_rsc_0_6_radr),
      .we(xt_rsc_0_6_we),
      .d(xt_rsc_0_6_d),
      .wadr(xt_rsc_0_6_wadr),
      .clken_d(xt_rsc_0_6_i_clken_d),
      .d_d(xt_rsc_0_0_i_d_d_iff),
      .q_d(xt_rsc_0_6_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_6_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_6_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen xt_rsc_0_7_i
      (
      .clken(xt_rsc_0_7_clken),
      .q(xt_rsc_0_7_q),
      .radr(xt_rsc_0_7_radr),
      .we(xt_rsc_0_7_we),
      .d(xt_rsc_0_7_d),
      .wadr(xt_rsc_0_7_wadr),
      .clken_d(xt_rsc_0_7_i_clken_d),
      .d_d(xt_rsc_0_1_i_d_d_iff),
      .q_d(xt_rsc_0_7_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_7_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_7_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen vec_rsc_0_0_i
      (
      .q(vec_rsc_0_0_q),
      .radr(vec_rsc_0_0_radr),
      .q_d(vec_rsc_0_0_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen vec_rsc_0_2_i
      (
      .q(vec_rsc_0_2_q),
      .radr(vec_rsc_0_2_radr),
      .q_d(vec_rsc_0_2_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen vec_rsc_0_4_i
      (
      .q(vec_rsc_0_4_q),
      .radr(vec_rsc_0_4_radr),
      .q_d(vec_rsc_0_4_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen vec_rsc_0_6_i
      (
      .q(vec_rsc_0_6_q),
      .radr(vec_rsc_0_6_radr),
      .q_d(vec_rsc_0_6_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen result_rsc_0_0_i
      (
      .q(result_rsc_0_0_q),
      .radr(result_rsc_0_0_radr),
      .we(result_rsc_0_0_we),
      .d(result_rsc_0_0_d),
      .wadr(result_rsc_0_0_wadr),
      .d_d(result_rsc_0_0_i_d_d_iff),
      .q_d(result_rsc_0_0_i_q_d),
      .radr_d(result_rsc_0_0_i_radr_d_iff),
      .wadr_d(result_rsc_0_0_i_wadr_d),
      .we_d(result_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen result_rsc_0_1_i
      (
      .we(result_rsc_0_1_we),
      .d(result_rsc_0_1_d),
      .wadr(result_rsc_0_1_wadr),
      .d_d(result_rsc_0_1_i_d_d_iff),
      .wadr_d(result_rsc_0_1_i_wadr_d),
      .we_d(result_rsc_0_1_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsc_0_1_i_we_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen result_rsc_0_2_i
      (
      .q(result_rsc_0_2_q),
      .radr(result_rsc_0_2_radr),
      .we(result_rsc_0_2_we),
      .d(result_rsc_0_2_d),
      .wadr(result_rsc_0_2_wadr),
      .d_d(result_rsc_0_2_i_d_d_iff),
      .q_d(result_rsc_0_2_i_q_d),
      .radr_d(result_rsc_0_0_i_radr_d_iff),
      .wadr_d(result_rsc_0_2_i_wadr_d),
      .we_d(result_rsc_0_2_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsc_0_2_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen result_rsc_0_3_i
      (
      .we(result_rsc_0_3_we),
      .d(result_rsc_0_3_d),
      .wadr(result_rsc_0_3_wadr),
      .d_d(result_rsc_0_3_i_d_d_iff),
      .wadr_d(result_rsc_0_3_i_wadr_d),
      .we_d(result_rsc_0_3_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsc_0_3_i_we_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen result_rsc_0_4_i
      (
      .q(result_rsc_0_4_q),
      .radr(result_rsc_0_4_radr),
      .we(result_rsc_0_4_we),
      .d(result_rsc_0_4_d),
      .wadr(result_rsc_0_4_wadr),
      .d_d(result_rsc_0_0_i_d_d_iff),
      .q_d(result_rsc_0_4_i_q_d),
      .radr_d(result_rsc_0_0_i_radr_d_iff),
      .wadr_d(result_rsc_0_4_i_wadr_d),
      .we_d(result_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen result_rsc_0_5_i
      (
      .we(result_rsc_0_5_we),
      .d(result_rsc_0_5_d),
      .wadr(result_rsc_0_5_wadr),
      .d_d(result_rsc_0_1_i_d_d_iff),
      .wadr_d(result_rsc_0_5_i_wadr_d),
      .we_d(result_rsc_0_5_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsc_0_5_i_we_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen result_rsc_0_6_i
      (
      .q(result_rsc_0_6_q),
      .radr(result_rsc_0_6_radr),
      .we(result_rsc_0_6_we),
      .d(result_rsc_0_6_d),
      .wadr(result_rsc_0_6_wadr),
      .d_d(result_rsc_0_2_i_d_d_iff),
      .q_d(result_rsc_0_6_i_q_d),
      .radr_d(result_rsc_0_0_i_radr_d_iff),
      .wadr_d(result_rsc_0_6_i_wadr_d),
      .we_d(result_rsc_0_6_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsc_0_6_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen result_rsc_0_7_i
      (
      .we(result_rsc_0_7_we),
      .d(result_rsc_0_7_d),
      .wadr(result_rsc_0_7_wadr),
      .d_d(result_rsc_0_3_i_d_d_iff),
      .wadr_d(result_rsc_0_7_i_wadr_d),
      .we_d(result_rsc_0_7_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(result_rsc_0_7_i_we_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen twiddle_rsc_0_0_i
      (
      .q(twiddle_rsc_0_0_q),
      .radr(twiddle_rsc_0_0_radr),
      .q_d(twiddle_rsc_0_0_i_q_d),
      .radr_d(twiddle_rsc_0_0_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen twiddle_rsc_0_1_i
      (
      .q(twiddle_rsc_0_1_q),
      .radr(twiddle_rsc_0_1_radr),
      .q_d(twiddle_rsc_0_1_i_q_d),
      .radr_d(twiddle_rsc_0_1_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen twiddle_rsc_0_2_i
      (
      .q(twiddle_rsc_0_2_q),
      .radr(twiddle_rsc_0_2_radr),
      .q_d(twiddle_rsc_0_2_i_q_d),
      .radr_d(twiddle_rsc_0_2_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen twiddle_rsc_0_3_i
      (
      .q(twiddle_rsc_0_3_q),
      .radr(twiddle_rsc_0_3_radr),
      .q_d(twiddle_rsc_0_3_i_q_d),
      .radr_d(twiddle_rsc_0_3_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen twiddle_rsc_0_4_i
      (
      .q(twiddle_rsc_0_4_q),
      .radr(twiddle_rsc_0_4_radr),
      .q_d(twiddle_rsc_0_4_i_q_d),
      .radr_d(twiddle_rsc_0_4_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen twiddle_rsc_0_5_i
      (
      .q(twiddle_rsc_0_5_q),
      .radr(twiddle_rsc_0_5_radr),
      .q_d(twiddle_rsc_0_5_i_q_d),
      .radr_d(twiddle_rsc_0_5_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen twiddle_rsc_0_6_i
      (
      .q(twiddle_rsc_0_6_q),
      .radr(twiddle_rsc_0_6_radr),
      .q_d(twiddle_rsc_0_6_i_q_d),
      .radr_d(twiddle_rsc_0_6_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen twiddle_rsc_0_7_i
      (
      .q(twiddle_rsc_0_7_q),
      .radr(twiddle_rsc_0_7_radr),
      .q_d(twiddle_rsc_0_7_i_q_d),
      .radr_d(twiddle_rsc_0_7_i_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaceNTT_core peaceNTT_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .vec_rsc_triosy_0_2_lz(vec_rsc_triosy_0_2_lz),
      .vec_rsc_triosy_0_4_lz(vec_rsc_triosy_0_4_lz),
      .vec_rsc_triosy_0_6_lz(vec_rsc_triosy_0_6_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .g_rsc_triosy_lz(g_rsc_triosy_lz),
      .result_rsc_triosy_0_0_lz(result_rsc_triosy_0_0_lz),
      .result_rsc_triosy_0_1_lz(result_rsc_triosy_0_1_lz),
      .result_rsc_triosy_0_2_lz(result_rsc_triosy_0_2_lz),
      .result_rsc_triosy_0_3_lz(result_rsc_triosy_0_3_lz),
      .result_rsc_triosy_0_4_lz(result_rsc_triosy_0_4_lz),
      .result_rsc_triosy_0_5_lz(result_rsc_triosy_0_5_lz),
      .result_rsc_triosy_0_6_lz(result_rsc_triosy_0_6_lz),
      .result_rsc_triosy_0_7_lz(result_rsc_triosy_0_7_lz),
      .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
      .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
      .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
      .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
      .twiddle_rsc_triosy_0_4_lz(twiddle_rsc_triosy_0_4_lz),
      .twiddle_rsc_triosy_0_5_lz(twiddle_rsc_triosy_0_5_lz),
      .twiddle_rsc_triosy_0_6_lz(twiddle_rsc_triosy_0_6_lz),
      .twiddle_rsc_triosy_0_7_lz(twiddle_rsc_triosy_0_7_lz),
      .xt_rsc_0_0_i_clken_d(xt_rsc_0_0_i_clken_d),
      .xt_rsc_0_0_i_q_d(xt_rsc_0_0_i_q_d),
      .xt_rsc_0_1_i_clken_d(xt_rsc_0_1_i_clken_d),
      .xt_rsc_0_1_i_q_d(xt_rsc_0_1_i_q_d),
      .xt_rsc_0_2_i_clken_d(xt_rsc_0_2_i_clken_d),
      .xt_rsc_0_2_i_q_d(xt_rsc_0_2_i_q_d),
      .xt_rsc_0_3_i_clken_d(xt_rsc_0_3_i_clken_d),
      .xt_rsc_0_3_i_q_d(xt_rsc_0_3_i_q_d),
      .xt_rsc_0_4_i_clken_d(xt_rsc_0_4_i_clken_d),
      .xt_rsc_0_4_i_q_d(xt_rsc_0_4_i_q_d),
      .xt_rsc_0_5_i_clken_d(xt_rsc_0_5_i_clken_d),
      .xt_rsc_0_5_i_q_d(xt_rsc_0_5_i_q_d),
      .xt_rsc_0_6_i_clken_d(xt_rsc_0_6_i_clken_d),
      .xt_rsc_0_6_i_q_d(xt_rsc_0_6_i_q_d),
      .xt_rsc_0_7_i_clken_d(xt_rsc_0_7_i_clken_d),
      .xt_rsc_0_7_i_q_d(xt_rsc_0_7_i_q_d),
      .vec_rsc_0_0_i_q_d(vec_rsc_0_0_i_q_d),
      .vec_rsc_0_2_i_q_d(vec_rsc_0_2_i_q_d),
      .vec_rsc_0_4_i_q_d(vec_rsc_0_4_i_q_d),
      .vec_rsc_0_6_i_q_d(vec_rsc_0_6_i_q_d),
      .result_rsc_0_0_i_q_d(result_rsc_0_0_i_q_d),
      .result_rsc_0_0_i_wadr_d(result_rsc_0_0_i_wadr_d),
      .result_rsc_0_1_i_wadr_d(result_rsc_0_1_i_wadr_d),
      .result_rsc_0_2_i_q_d(result_rsc_0_2_i_q_d),
      .result_rsc_0_2_i_wadr_d(result_rsc_0_2_i_wadr_d),
      .result_rsc_0_3_i_wadr_d(result_rsc_0_3_i_wadr_d),
      .result_rsc_0_4_i_q_d(result_rsc_0_4_i_q_d),
      .result_rsc_0_4_i_wadr_d(result_rsc_0_4_i_wadr_d),
      .result_rsc_0_5_i_wadr_d(result_rsc_0_5_i_wadr_d),
      .result_rsc_0_6_i_q_d(result_rsc_0_6_i_q_d),
      .result_rsc_0_6_i_wadr_d(result_rsc_0_6_i_wadr_d),
      .result_rsc_0_7_i_wadr_d(result_rsc_0_7_i_wadr_d),
      .twiddle_rsc_0_0_i_q_d(twiddle_rsc_0_0_i_q_d),
      .twiddle_rsc_0_0_i_radr_d(twiddle_rsc_0_0_i_radr_d),
      .twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_1_i_q_d(twiddle_rsc_0_1_i_q_d),
      .twiddle_rsc_0_1_i_radr_d(twiddle_rsc_0_1_i_radr_d),
      .twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_2_i_q_d(twiddle_rsc_0_2_i_q_d),
      .twiddle_rsc_0_2_i_radr_d(twiddle_rsc_0_2_i_radr_d),
      .twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_3_i_q_d(twiddle_rsc_0_3_i_q_d),
      .twiddle_rsc_0_3_i_radr_d(twiddle_rsc_0_3_i_radr_d),
      .twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_4_i_q_d(twiddle_rsc_0_4_i_q_d),
      .twiddle_rsc_0_4_i_radr_d(twiddle_rsc_0_4_i_radr_d),
      .twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_5_i_q_d(twiddle_rsc_0_5_i_q_d),
      .twiddle_rsc_0_5_i_radr_d(twiddle_rsc_0_5_i_radr_d),
      .twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_6_i_q_d(twiddle_rsc_0_6_i_q_d),
      .twiddle_rsc_0_6_i_radr_d(twiddle_rsc_0_6_i_radr_d),
      .twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_7_i_q_d(twiddle_rsc_0_7_i_q_d),
      .twiddle_rsc_0_7_i_radr_d(twiddle_rsc_0_7_i_radr_d),
      .twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d),
      .COMP_LOOP_1_f2_rem_cmp_a(COMP_LOOP_1_f2_rem_cmp_a),
      .COMP_LOOP_1_f2_rem_cmp_b(COMP_LOOP_1_f2_rem_cmp_b),
      .COMP_LOOP_1_f2_rem_cmp_z(COMP_LOOP_1_f2_rem_cmp_z),
      .xt_rsc_0_0_i_d_d_pff(xt_rsc_0_0_i_d_d_iff),
      .xt_rsc_0_0_i_radr_d_pff(xt_rsc_0_0_i_radr_d_iff),
      .xt_rsc_0_0_i_wadr_d_pff(xt_rsc_0_0_i_wadr_d_iff),
      .xt_rsc_0_0_i_we_d_pff(xt_rsc_0_0_i_we_d_iff),
      .xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff(xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .xt_rsc_0_1_i_d_d_pff(xt_rsc_0_1_i_d_d_iff),
      .xt_rsc_0_1_i_we_d_pff(xt_rsc_0_1_i_we_d_iff),
      .xt_rsc_0_2_i_we_d_pff(xt_rsc_0_2_i_we_d_iff),
      .xt_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_pff(xt_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .xt_rsc_0_3_i_we_d_pff(xt_rsc_0_3_i_we_d_iff),
      .xt_rsc_0_4_i_we_d_pff(xt_rsc_0_4_i_we_d_iff),
      .xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff(xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .xt_rsc_0_5_i_we_d_pff(xt_rsc_0_5_i_we_d_iff),
      .xt_rsc_0_6_i_we_d_pff(xt_rsc_0_6_i_we_d_iff),
      .xt_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d_pff(xt_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .xt_rsc_0_7_i_we_d_pff(xt_rsc_0_7_i_we_d_iff),
      .vec_rsc_0_0_i_radr_d_pff(vec_rsc_0_0_i_radr_d_iff),
      .vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff(vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff(vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .result_rsc_0_0_i_d_d_pff(result_rsc_0_0_i_d_d_iff),
      .result_rsc_0_0_i_radr_d_pff(result_rsc_0_0_i_radr_d_iff),
      .result_rsc_0_0_i_we_d_pff(result_rsc_0_0_i_we_d_iff),
      .result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff(result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .result_rsc_0_1_i_d_d_pff(result_rsc_0_1_i_d_d_iff),
      .result_rsc_0_1_i_we_d_pff(result_rsc_0_1_i_we_d_iff),
      .result_rsc_0_2_i_d_d_pff(result_rsc_0_2_i_d_d_iff),
      .result_rsc_0_2_i_we_d_pff(result_rsc_0_2_i_we_d_iff),
      .result_rsc_0_3_i_d_d_pff(result_rsc_0_3_i_d_d_iff),
      .result_rsc_0_3_i_we_d_pff(result_rsc_0_3_i_we_d_iff),
      .result_rsc_0_4_i_we_d_pff(result_rsc_0_4_i_we_d_iff),
      .result_rsc_0_5_i_we_d_pff(result_rsc_0_5_i_we_d_iff),
      .result_rsc_0_6_i_we_d_pff(result_rsc_0_6_i_we_d_iff),
      .result_rsc_0_7_i_we_d_pff(result_rsc_0_7_i_we_d_iff)
    );
endmodule



