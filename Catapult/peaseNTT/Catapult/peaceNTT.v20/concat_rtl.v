
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
//  Generated date: Wed Jun 16 23:23:07 2021
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
  clk, rst, fsm_output, COPY_LOOP_C_2_tr0, COMP_LOOP_C_467_tr0, COPY_LOOP_1_C_2_tr0,
      STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [8:0] fsm_output;
  reg [8:0] fsm_output;
  input COPY_LOOP_C_2_tr0;
  input COMP_LOOP_C_467_tr0;
  input COPY_LOOP_1_C_2_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for peaceNTT_core_core_fsm_1
  parameter
    main_C_0 = 9'd0,
    COPY_LOOP_C_0 = 9'd1,
    COPY_LOOP_C_1 = 9'd2,
    COPY_LOOP_C_2 = 9'd3,
    STAGE_LOOP_C_0 = 9'd4,
    COMP_LOOP_C_0 = 9'd5,
    COMP_LOOP_C_1 = 9'd6,
    COMP_LOOP_C_2 = 9'd7,
    COMP_LOOP_C_3 = 9'd8,
    COMP_LOOP_C_4 = 9'd9,
    COMP_LOOP_C_5 = 9'd10,
    COMP_LOOP_C_6 = 9'd11,
    COMP_LOOP_C_7 = 9'd12,
    COMP_LOOP_C_8 = 9'd13,
    COMP_LOOP_C_9 = 9'd14,
    COMP_LOOP_C_10 = 9'd15,
    COMP_LOOP_C_11 = 9'd16,
    COMP_LOOP_C_12 = 9'd17,
    COMP_LOOP_C_13 = 9'd18,
    COMP_LOOP_C_14 = 9'd19,
    COMP_LOOP_C_15 = 9'd20,
    COMP_LOOP_C_16 = 9'd21,
    COMP_LOOP_C_17 = 9'd22,
    COMP_LOOP_C_18 = 9'd23,
    COMP_LOOP_C_19 = 9'd24,
    COMP_LOOP_C_20 = 9'd25,
    COMP_LOOP_C_21 = 9'd26,
    COMP_LOOP_C_22 = 9'd27,
    COMP_LOOP_C_23 = 9'd28,
    COMP_LOOP_C_24 = 9'd29,
    COMP_LOOP_C_25 = 9'd30,
    COMP_LOOP_C_26 = 9'd31,
    COMP_LOOP_C_27 = 9'd32,
    COMP_LOOP_C_28 = 9'd33,
    COMP_LOOP_C_29 = 9'd34,
    COMP_LOOP_C_30 = 9'd35,
    COMP_LOOP_C_31 = 9'd36,
    COMP_LOOP_C_32 = 9'd37,
    COMP_LOOP_C_33 = 9'd38,
    COMP_LOOP_C_34 = 9'd39,
    COMP_LOOP_C_35 = 9'd40,
    COMP_LOOP_C_36 = 9'd41,
    COMP_LOOP_C_37 = 9'd42,
    COMP_LOOP_C_38 = 9'd43,
    COMP_LOOP_C_39 = 9'd44,
    COMP_LOOP_C_40 = 9'd45,
    COMP_LOOP_C_41 = 9'd46,
    COMP_LOOP_C_42 = 9'd47,
    COMP_LOOP_C_43 = 9'd48,
    COMP_LOOP_C_44 = 9'd49,
    COMP_LOOP_C_45 = 9'd50,
    COMP_LOOP_C_46 = 9'd51,
    COMP_LOOP_C_47 = 9'd52,
    COMP_LOOP_C_48 = 9'd53,
    COMP_LOOP_C_49 = 9'd54,
    COMP_LOOP_C_50 = 9'd55,
    COMP_LOOP_C_51 = 9'd56,
    COMP_LOOP_C_52 = 9'd57,
    COMP_LOOP_C_53 = 9'd58,
    COMP_LOOP_C_54 = 9'd59,
    COMP_LOOP_C_55 = 9'd60,
    COMP_LOOP_C_56 = 9'd61,
    COMP_LOOP_C_57 = 9'd62,
    COMP_LOOP_C_58 = 9'd63,
    COMP_LOOP_C_59 = 9'd64,
    COMP_LOOP_C_60 = 9'd65,
    COMP_LOOP_C_61 = 9'd66,
    COMP_LOOP_C_62 = 9'd67,
    COMP_LOOP_C_63 = 9'd68,
    COMP_LOOP_C_64 = 9'd69,
    COMP_LOOP_C_65 = 9'd70,
    COMP_LOOP_C_66 = 9'd71,
    COMP_LOOP_C_67 = 9'd72,
    COMP_LOOP_C_68 = 9'd73,
    COMP_LOOP_C_69 = 9'd74,
    COMP_LOOP_C_70 = 9'd75,
    COMP_LOOP_C_71 = 9'd76,
    COMP_LOOP_C_72 = 9'd77,
    COMP_LOOP_C_73 = 9'd78,
    COMP_LOOP_C_74 = 9'd79,
    COMP_LOOP_C_75 = 9'd80,
    COMP_LOOP_C_76 = 9'd81,
    COMP_LOOP_C_77 = 9'd82,
    COMP_LOOP_C_78 = 9'd83,
    COMP_LOOP_C_79 = 9'd84,
    COMP_LOOP_C_80 = 9'd85,
    COMP_LOOP_C_81 = 9'd86,
    COMP_LOOP_C_82 = 9'd87,
    COMP_LOOP_C_83 = 9'd88,
    COMP_LOOP_C_84 = 9'd89,
    COMP_LOOP_C_85 = 9'd90,
    COMP_LOOP_C_86 = 9'd91,
    COMP_LOOP_C_87 = 9'd92,
    COMP_LOOP_C_88 = 9'd93,
    COMP_LOOP_C_89 = 9'd94,
    COMP_LOOP_C_90 = 9'd95,
    COMP_LOOP_C_91 = 9'd96,
    COMP_LOOP_C_92 = 9'd97,
    COMP_LOOP_C_93 = 9'd98,
    COMP_LOOP_C_94 = 9'd99,
    COMP_LOOP_C_95 = 9'd100,
    COMP_LOOP_C_96 = 9'd101,
    COMP_LOOP_C_97 = 9'd102,
    COMP_LOOP_C_98 = 9'd103,
    COMP_LOOP_C_99 = 9'd104,
    COMP_LOOP_C_100 = 9'd105,
    COMP_LOOP_C_101 = 9'd106,
    COMP_LOOP_C_102 = 9'd107,
    COMP_LOOP_C_103 = 9'd108,
    COMP_LOOP_C_104 = 9'd109,
    COMP_LOOP_C_105 = 9'd110,
    COMP_LOOP_C_106 = 9'd111,
    COMP_LOOP_C_107 = 9'd112,
    COMP_LOOP_C_108 = 9'd113,
    COMP_LOOP_C_109 = 9'd114,
    COMP_LOOP_C_110 = 9'd115,
    COMP_LOOP_C_111 = 9'd116,
    COMP_LOOP_C_112 = 9'd117,
    COMP_LOOP_C_113 = 9'd118,
    COMP_LOOP_C_114 = 9'd119,
    COMP_LOOP_C_115 = 9'd120,
    COMP_LOOP_C_116 = 9'd121,
    COMP_LOOP_C_117 = 9'd122,
    COMP_LOOP_C_118 = 9'd123,
    COMP_LOOP_C_119 = 9'd124,
    COMP_LOOP_C_120 = 9'd125,
    COMP_LOOP_C_121 = 9'd126,
    COMP_LOOP_C_122 = 9'd127,
    COMP_LOOP_C_123 = 9'd128,
    COMP_LOOP_C_124 = 9'd129,
    COMP_LOOP_C_125 = 9'd130,
    COMP_LOOP_C_126 = 9'd131,
    COMP_LOOP_C_127 = 9'd132,
    COMP_LOOP_C_128 = 9'd133,
    COMP_LOOP_C_129 = 9'd134,
    COMP_LOOP_C_130 = 9'd135,
    COMP_LOOP_C_131 = 9'd136,
    COMP_LOOP_C_132 = 9'd137,
    COMP_LOOP_C_133 = 9'd138,
    COMP_LOOP_C_134 = 9'd139,
    COMP_LOOP_C_135 = 9'd140,
    COMP_LOOP_C_136 = 9'd141,
    COMP_LOOP_C_137 = 9'd142,
    COMP_LOOP_C_138 = 9'd143,
    COMP_LOOP_C_139 = 9'd144,
    COMP_LOOP_C_140 = 9'd145,
    COMP_LOOP_C_141 = 9'd146,
    COMP_LOOP_C_142 = 9'd147,
    COMP_LOOP_C_143 = 9'd148,
    COMP_LOOP_C_144 = 9'd149,
    COMP_LOOP_C_145 = 9'd150,
    COMP_LOOP_C_146 = 9'd151,
    COMP_LOOP_C_147 = 9'd152,
    COMP_LOOP_C_148 = 9'd153,
    COMP_LOOP_C_149 = 9'd154,
    COMP_LOOP_C_150 = 9'd155,
    COMP_LOOP_C_151 = 9'd156,
    COMP_LOOP_C_152 = 9'd157,
    COMP_LOOP_C_153 = 9'd158,
    COMP_LOOP_C_154 = 9'd159,
    COMP_LOOP_C_155 = 9'd160,
    COMP_LOOP_C_156 = 9'd161,
    COMP_LOOP_C_157 = 9'd162,
    COMP_LOOP_C_158 = 9'd163,
    COMP_LOOP_C_159 = 9'd164,
    COMP_LOOP_C_160 = 9'd165,
    COMP_LOOP_C_161 = 9'd166,
    COMP_LOOP_C_162 = 9'd167,
    COMP_LOOP_C_163 = 9'd168,
    COMP_LOOP_C_164 = 9'd169,
    COMP_LOOP_C_165 = 9'd170,
    COMP_LOOP_C_166 = 9'd171,
    COMP_LOOP_C_167 = 9'd172,
    COMP_LOOP_C_168 = 9'd173,
    COMP_LOOP_C_169 = 9'd174,
    COMP_LOOP_C_170 = 9'd175,
    COMP_LOOP_C_171 = 9'd176,
    COMP_LOOP_C_172 = 9'd177,
    COMP_LOOP_C_173 = 9'd178,
    COMP_LOOP_C_174 = 9'd179,
    COMP_LOOP_C_175 = 9'd180,
    COMP_LOOP_C_176 = 9'd181,
    COMP_LOOP_C_177 = 9'd182,
    COMP_LOOP_C_178 = 9'd183,
    COMP_LOOP_C_179 = 9'd184,
    COMP_LOOP_C_180 = 9'd185,
    COMP_LOOP_C_181 = 9'd186,
    COMP_LOOP_C_182 = 9'd187,
    COMP_LOOP_C_183 = 9'd188,
    COMP_LOOP_C_184 = 9'd189,
    COMP_LOOP_C_185 = 9'd190,
    COMP_LOOP_C_186 = 9'd191,
    COMP_LOOP_C_187 = 9'd192,
    COMP_LOOP_C_188 = 9'd193,
    COMP_LOOP_C_189 = 9'd194,
    COMP_LOOP_C_190 = 9'd195,
    COMP_LOOP_C_191 = 9'd196,
    COMP_LOOP_C_192 = 9'd197,
    COMP_LOOP_C_193 = 9'd198,
    COMP_LOOP_C_194 = 9'd199,
    COMP_LOOP_C_195 = 9'd200,
    COMP_LOOP_C_196 = 9'd201,
    COMP_LOOP_C_197 = 9'd202,
    COMP_LOOP_C_198 = 9'd203,
    COMP_LOOP_C_199 = 9'd204,
    COMP_LOOP_C_200 = 9'd205,
    COMP_LOOP_C_201 = 9'd206,
    COMP_LOOP_C_202 = 9'd207,
    COMP_LOOP_C_203 = 9'd208,
    COMP_LOOP_C_204 = 9'd209,
    COMP_LOOP_C_205 = 9'd210,
    COMP_LOOP_C_206 = 9'd211,
    COMP_LOOP_C_207 = 9'd212,
    COMP_LOOP_C_208 = 9'd213,
    COMP_LOOP_C_209 = 9'd214,
    COMP_LOOP_C_210 = 9'd215,
    COMP_LOOP_C_211 = 9'd216,
    COMP_LOOP_C_212 = 9'd217,
    COMP_LOOP_C_213 = 9'd218,
    COMP_LOOP_C_214 = 9'd219,
    COMP_LOOP_C_215 = 9'd220,
    COMP_LOOP_C_216 = 9'd221,
    COMP_LOOP_C_217 = 9'd222,
    COMP_LOOP_C_218 = 9'd223,
    COMP_LOOP_C_219 = 9'd224,
    COMP_LOOP_C_220 = 9'd225,
    COMP_LOOP_C_221 = 9'd226,
    COMP_LOOP_C_222 = 9'd227,
    COMP_LOOP_C_223 = 9'd228,
    COMP_LOOP_C_224 = 9'd229,
    COMP_LOOP_C_225 = 9'd230,
    COMP_LOOP_C_226 = 9'd231,
    COMP_LOOP_C_227 = 9'd232,
    COMP_LOOP_C_228 = 9'd233,
    COMP_LOOP_C_229 = 9'd234,
    COMP_LOOP_C_230 = 9'd235,
    COMP_LOOP_C_231 = 9'd236,
    COMP_LOOP_C_232 = 9'd237,
    COMP_LOOP_C_233 = 9'd238,
    COMP_LOOP_C_234 = 9'd239,
    COMP_LOOP_C_235 = 9'd240,
    COMP_LOOP_C_236 = 9'd241,
    COMP_LOOP_C_237 = 9'd242,
    COMP_LOOP_C_238 = 9'd243,
    COMP_LOOP_C_239 = 9'd244,
    COMP_LOOP_C_240 = 9'd245,
    COMP_LOOP_C_241 = 9'd246,
    COMP_LOOP_C_242 = 9'd247,
    COMP_LOOP_C_243 = 9'd248,
    COMP_LOOP_C_244 = 9'd249,
    COMP_LOOP_C_245 = 9'd250,
    COMP_LOOP_C_246 = 9'd251,
    COMP_LOOP_C_247 = 9'd252,
    COMP_LOOP_C_248 = 9'd253,
    COMP_LOOP_C_249 = 9'd254,
    COMP_LOOP_C_250 = 9'd255,
    COMP_LOOP_C_251 = 9'd256,
    COMP_LOOP_C_252 = 9'd257,
    COMP_LOOP_C_253 = 9'd258,
    COMP_LOOP_C_254 = 9'd259,
    COMP_LOOP_C_255 = 9'd260,
    COMP_LOOP_C_256 = 9'd261,
    COMP_LOOP_C_257 = 9'd262,
    COMP_LOOP_C_258 = 9'd263,
    COMP_LOOP_C_259 = 9'd264,
    COMP_LOOP_C_260 = 9'd265,
    COMP_LOOP_C_261 = 9'd266,
    COMP_LOOP_C_262 = 9'd267,
    COMP_LOOP_C_263 = 9'd268,
    COMP_LOOP_C_264 = 9'd269,
    COMP_LOOP_C_265 = 9'd270,
    COMP_LOOP_C_266 = 9'd271,
    COMP_LOOP_C_267 = 9'd272,
    COMP_LOOP_C_268 = 9'd273,
    COMP_LOOP_C_269 = 9'd274,
    COMP_LOOP_C_270 = 9'd275,
    COMP_LOOP_C_271 = 9'd276,
    COMP_LOOP_C_272 = 9'd277,
    COMP_LOOP_C_273 = 9'd278,
    COMP_LOOP_C_274 = 9'd279,
    COMP_LOOP_C_275 = 9'd280,
    COMP_LOOP_C_276 = 9'd281,
    COMP_LOOP_C_277 = 9'd282,
    COMP_LOOP_C_278 = 9'd283,
    COMP_LOOP_C_279 = 9'd284,
    COMP_LOOP_C_280 = 9'd285,
    COMP_LOOP_C_281 = 9'd286,
    COMP_LOOP_C_282 = 9'd287,
    COMP_LOOP_C_283 = 9'd288,
    COMP_LOOP_C_284 = 9'd289,
    COMP_LOOP_C_285 = 9'd290,
    COMP_LOOP_C_286 = 9'd291,
    COMP_LOOP_C_287 = 9'd292,
    COMP_LOOP_C_288 = 9'd293,
    COMP_LOOP_C_289 = 9'd294,
    COMP_LOOP_C_290 = 9'd295,
    COMP_LOOP_C_291 = 9'd296,
    COMP_LOOP_C_292 = 9'd297,
    COMP_LOOP_C_293 = 9'd298,
    COMP_LOOP_C_294 = 9'd299,
    COMP_LOOP_C_295 = 9'd300,
    COMP_LOOP_C_296 = 9'd301,
    COMP_LOOP_C_297 = 9'd302,
    COMP_LOOP_C_298 = 9'd303,
    COMP_LOOP_C_299 = 9'd304,
    COMP_LOOP_C_300 = 9'd305,
    COMP_LOOP_C_301 = 9'd306,
    COMP_LOOP_C_302 = 9'd307,
    COMP_LOOP_C_303 = 9'd308,
    COMP_LOOP_C_304 = 9'd309,
    COMP_LOOP_C_305 = 9'd310,
    COMP_LOOP_C_306 = 9'd311,
    COMP_LOOP_C_307 = 9'd312,
    COMP_LOOP_C_308 = 9'd313,
    COMP_LOOP_C_309 = 9'd314,
    COMP_LOOP_C_310 = 9'd315,
    COMP_LOOP_C_311 = 9'd316,
    COMP_LOOP_C_312 = 9'd317,
    COMP_LOOP_C_313 = 9'd318,
    COMP_LOOP_C_314 = 9'd319,
    COMP_LOOP_C_315 = 9'd320,
    COMP_LOOP_C_316 = 9'd321,
    COMP_LOOP_C_317 = 9'd322,
    COMP_LOOP_C_318 = 9'd323,
    COMP_LOOP_C_319 = 9'd324,
    COMP_LOOP_C_320 = 9'd325,
    COMP_LOOP_C_321 = 9'd326,
    COMP_LOOP_C_322 = 9'd327,
    COMP_LOOP_C_323 = 9'd328,
    COMP_LOOP_C_324 = 9'd329,
    COMP_LOOP_C_325 = 9'd330,
    COMP_LOOP_C_326 = 9'd331,
    COMP_LOOP_C_327 = 9'd332,
    COMP_LOOP_C_328 = 9'd333,
    COMP_LOOP_C_329 = 9'd334,
    COMP_LOOP_C_330 = 9'd335,
    COMP_LOOP_C_331 = 9'd336,
    COMP_LOOP_C_332 = 9'd337,
    COMP_LOOP_C_333 = 9'd338,
    COMP_LOOP_C_334 = 9'd339,
    COMP_LOOP_C_335 = 9'd340,
    COMP_LOOP_C_336 = 9'd341,
    COMP_LOOP_C_337 = 9'd342,
    COMP_LOOP_C_338 = 9'd343,
    COMP_LOOP_C_339 = 9'd344,
    COMP_LOOP_C_340 = 9'd345,
    COMP_LOOP_C_341 = 9'd346,
    COMP_LOOP_C_342 = 9'd347,
    COMP_LOOP_C_343 = 9'd348,
    COMP_LOOP_C_344 = 9'd349,
    COMP_LOOP_C_345 = 9'd350,
    COMP_LOOP_C_346 = 9'd351,
    COMP_LOOP_C_347 = 9'd352,
    COMP_LOOP_C_348 = 9'd353,
    COMP_LOOP_C_349 = 9'd354,
    COMP_LOOP_C_350 = 9'd355,
    COMP_LOOP_C_351 = 9'd356,
    COMP_LOOP_C_352 = 9'd357,
    COMP_LOOP_C_353 = 9'd358,
    COMP_LOOP_C_354 = 9'd359,
    COMP_LOOP_C_355 = 9'd360,
    COMP_LOOP_C_356 = 9'd361,
    COMP_LOOP_C_357 = 9'd362,
    COMP_LOOP_C_358 = 9'd363,
    COMP_LOOP_C_359 = 9'd364,
    COMP_LOOP_C_360 = 9'd365,
    COMP_LOOP_C_361 = 9'd366,
    COMP_LOOP_C_362 = 9'd367,
    COMP_LOOP_C_363 = 9'd368,
    COMP_LOOP_C_364 = 9'd369,
    COMP_LOOP_C_365 = 9'd370,
    COMP_LOOP_C_366 = 9'd371,
    COMP_LOOP_C_367 = 9'd372,
    COMP_LOOP_C_368 = 9'd373,
    COMP_LOOP_C_369 = 9'd374,
    COMP_LOOP_C_370 = 9'd375,
    COMP_LOOP_C_371 = 9'd376,
    COMP_LOOP_C_372 = 9'd377,
    COMP_LOOP_C_373 = 9'd378,
    COMP_LOOP_C_374 = 9'd379,
    COMP_LOOP_C_375 = 9'd380,
    COMP_LOOP_C_376 = 9'd381,
    COMP_LOOP_C_377 = 9'd382,
    COMP_LOOP_C_378 = 9'd383,
    COMP_LOOP_C_379 = 9'd384,
    COMP_LOOP_C_380 = 9'd385,
    COMP_LOOP_C_381 = 9'd386,
    COMP_LOOP_C_382 = 9'd387,
    COMP_LOOP_C_383 = 9'd388,
    COMP_LOOP_C_384 = 9'd389,
    COMP_LOOP_C_385 = 9'd390,
    COMP_LOOP_C_386 = 9'd391,
    COMP_LOOP_C_387 = 9'd392,
    COMP_LOOP_C_388 = 9'd393,
    COMP_LOOP_C_389 = 9'd394,
    COMP_LOOP_C_390 = 9'd395,
    COMP_LOOP_C_391 = 9'd396,
    COMP_LOOP_C_392 = 9'd397,
    COMP_LOOP_C_393 = 9'd398,
    COMP_LOOP_C_394 = 9'd399,
    COMP_LOOP_C_395 = 9'd400,
    COMP_LOOP_C_396 = 9'd401,
    COMP_LOOP_C_397 = 9'd402,
    COMP_LOOP_C_398 = 9'd403,
    COMP_LOOP_C_399 = 9'd404,
    COMP_LOOP_C_400 = 9'd405,
    COMP_LOOP_C_401 = 9'd406,
    COMP_LOOP_C_402 = 9'd407,
    COMP_LOOP_C_403 = 9'd408,
    COMP_LOOP_C_404 = 9'd409,
    COMP_LOOP_C_405 = 9'd410,
    COMP_LOOP_C_406 = 9'd411,
    COMP_LOOP_C_407 = 9'd412,
    COMP_LOOP_C_408 = 9'd413,
    COMP_LOOP_C_409 = 9'd414,
    COMP_LOOP_C_410 = 9'd415,
    COMP_LOOP_C_411 = 9'd416,
    COMP_LOOP_C_412 = 9'd417,
    COMP_LOOP_C_413 = 9'd418,
    COMP_LOOP_C_414 = 9'd419,
    COMP_LOOP_C_415 = 9'd420,
    COMP_LOOP_C_416 = 9'd421,
    COMP_LOOP_C_417 = 9'd422,
    COMP_LOOP_C_418 = 9'd423,
    COMP_LOOP_C_419 = 9'd424,
    COMP_LOOP_C_420 = 9'd425,
    COMP_LOOP_C_421 = 9'd426,
    COMP_LOOP_C_422 = 9'd427,
    COMP_LOOP_C_423 = 9'd428,
    COMP_LOOP_C_424 = 9'd429,
    COMP_LOOP_C_425 = 9'd430,
    COMP_LOOP_C_426 = 9'd431,
    COMP_LOOP_C_427 = 9'd432,
    COMP_LOOP_C_428 = 9'd433,
    COMP_LOOP_C_429 = 9'd434,
    COMP_LOOP_C_430 = 9'd435,
    COMP_LOOP_C_431 = 9'd436,
    COMP_LOOP_C_432 = 9'd437,
    COMP_LOOP_C_433 = 9'd438,
    COMP_LOOP_C_434 = 9'd439,
    COMP_LOOP_C_435 = 9'd440,
    COMP_LOOP_C_436 = 9'd441,
    COMP_LOOP_C_437 = 9'd442,
    COMP_LOOP_C_438 = 9'd443,
    COMP_LOOP_C_439 = 9'd444,
    COMP_LOOP_C_440 = 9'd445,
    COMP_LOOP_C_441 = 9'd446,
    COMP_LOOP_C_442 = 9'd447,
    COMP_LOOP_C_443 = 9'd448,
    COMP_LOOP_C_444 = 9'd449,
    COMP_LOOP_C_445 = 9'd450,
    COMP_LOOP_C_446 = 9'd451,
    COMP_LOOP_C_447 = 9'd452,
    COMP_LOOP_C_448 = 9'd453,
    COMP_LOOP_C_449 = 9'd454,
    COMP_LOOP_C_450 = 9'd455,
    COMP_LOOP_C_451 = 9'd456,
    COMP_LOOP_C_452 = 9'd457,
    COMP_LOOP_C_453 = 9'd458,
    COMP_LOOP_C_454 = 9'd459,
    COMP_LOOP_C_455 = 9'd460,
    COMP_LOOP_C_456 = 9'd461,
    COMP_LOOP_C_457 = 9'd462,
    COMP_LOOP_C_458 = 9'd463,
    COMP_LOOP_C_459 = 9'd464,
    COMP_LOOP_C_460 = 9'd465,
    COMP_LOOP_C_461 = 9'd466,
    COMP_LOOP_C_462 = 9'd467,
    COMP_LOOP_C_463 = 9'd468,
    COMP_LOOP_C_464 = 9'd469,
    COMP_LOOP_C_465 = 9'd470,
    COMP_LOOP_C_466 = 9'd471,
    COMP_LOOP_C_467 = 9'd472,
    COPY_LOOP_1_C_0 = 9'd473,
    COPY_LOOP_1_C_1 = 9'd474,
    COPY_LOOP_1_C_2 = 9'd475,
    STAGE_LOOP_C_1 = 9'd476,
    main_C_1 = 9'd477;

  reg [8:0] state_var;
  reg [8:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : peaceNTT_core_core_fsm_1
    case (state_var)
      COPY_LOOP_C_0 : begin
        fsm_output = 9'b000000001;
        state_var_NS = COPY_LOOP_C_1;
      end
      COPY_LOOP_C_1 : begin
        fsm_output = 9'b000000010;
        state_var_NS = COPY_LOOP_C_2;
      end
      COPY_LOOP_C_2 : begin
        fsm_output = 9'b000000011;
        if ( COPY_LOOP_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_0;
        end
        else begin
          state_var_NS = COPY_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_0 : begin
        fsm_output = 9'b000000100;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 9'b000000101;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 9'b000000110;
        state_var_NS = COMP_LOOP_C_2;
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 9'b000000111;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 9'b000001000;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 9'b000001001;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 9'b000001010;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 9'b000001011;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 9'b000001100;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 9'b000001101;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 9'b000001110;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 9'b000001111;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 9'b000010000;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 9'b000010001;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 9'b000010010;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 9'b000010011;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 9'b000010100;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 9'b000010101;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 9'b000010110;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 9'b000010111;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 9'b000011000;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 9'b000011001;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 9'b000011010;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 9'b000011011;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 9'b000011100;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 9'b000011101;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 9'b000011110;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 9'b000011111;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 9'b000100000;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 9'b000100001;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 9'b000100010;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 9'b000100011;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 9'b000100100;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 9'b000100101;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 9'b000100110;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 9'b000100111;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 9'b000101000;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 9'b000101001;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 9'b000101010;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 9'b000101011;
        state_var_NS = COMP_LOOP_C_39;
      end
      COMP_LOOP_C_39 : begin
        fsm_output = 9'b000101100;
        state_var_NS = COMP_LOOP_C_40;
      end
      COMP_LOOP_C_40 : begin
        fsm_output = 9'b000101101;
        state_var_NS = COMP_LOOP_C_41;
      end
      COMP_LOOP_C_41 : begin
        fsm_output = 9'b000101110;
        state_var_NS = COMP_LOOP_C_42;
      end
      COMP_LOOP_C_42 : begin
        fsm_output = 9'b000101111;
        state_var_NS = COMP_LOOP_C_43;
      end
      COMP_LOOP_C_43 : begin
        fsm_output = 9'b000110000;
        state_var_NS = COMP_LOOP_C_44;
      end
      COMP_LOOP_C_44 : begin
        fsm_output = 9'b000110001;
        state_var_NS = COMP_LOOP_C_45;
      end
      COMP_LOOP_C_45 : begin
        fsm_output = 9'b000110010;
        state_var_NS = COMP_LOOP_C_46;
      end
      COMP_LOOP_C_46 : begin
        fsm_output = 9'b000110011;
        state_var_NS = COMP_LOOP_C_47;
      end
      COMP_LOOP_C_47 : begin
        fsm_output = 9'b000110100;
        state_var_NS = COMP_LOOP_C_48;
      end
      COMP_LOOP_C_48 : begin
        fsm_output = 9'b000110101;
        state_var_NS = COMP_LOOP_C_49;
      end
      COMP_LOOP_C_49 : begin
        fsm_output = 9'b000110110;
        state_var_NS = COMP_LOOP_C_50;
      end
      COMP_LOOP_C_50 : begin
        fsm_output = 9'b000110111;
        state_var_NS = COMP_LOOP_C_51;
      end
      COMP_LOOP_C_51 : begin
        fsm_output = 9'b000111000;
        state_var_NS = COMP_LOOP_C_52;
      end
      COMP_LOOP_C_52 : begin
        fsm_output = 9'b000111001;
        state_var_NS = COMP_LOOP_C_53;
      end
      COMP_LOOP_C_53 : begin
        fsm_output = 9'b000111010;
        state_var_NS = COMP_LOOP_C_54;
      end
      COMP_LOOP_C_54 : begin
        fsm_output = 9'b000111011;
        state_var_NS = COMP_LOOP_C_55;
      end
      COMP_LOOP_C_55 : begin
        fsm_output = 9'b000111100;
        state_var_NS = COMP_LOOP_C_56;
      end
      COMP_LOOP_C_56 : begin
        fsm_output = 9'b000111101;
        state_var_NS = COMP_LOOP_C_57;
      end
      COMP_LOOP_C_57 : begin
        fsm_output = 9'b000111110;
        state_var_NS = COMP_LOOP_C_58;
      end
      COMP_LOOP_C_58 : begin
        fsm_output = 9'b000111111;
        state_var_NS = COMP_LOOP_C_59;
      end
      COMP_LOOP_C_59 : begin
        fsm_output = 9'b001000000;
        state_var_NS = COMP_LOOP_C_60;
      end
      COMP_LOOP_C_60 : begin
        fsm_output = 9'b001000001;
        state_var_NS = COMP_LOOP_C_61;
      end
      COMP_LOOP_C_61 : begin
        fsm_output = 9'b001000010;
        state_var_NS = COMP_LOOP_C_62;
      end
      COMP_LOOP_C_62 : begin
        fsm_output = 9'b001000011;
        state_var_NS = COMP_LOOP_C_63;
      end
      COMP_LOOP_C_63 : begin
        fsm_output = 9'b001000100;
        state_var_NS = COMP_LOOP_C_64;
      end
      COMP_LOOP_C_64 : begin
        fsm_output = 9'b001000101;
        state_var_NS = COMP_LOOP_C_65;
      end
      COMP_LOOP_C_65 : begin
        fsm_output = 9'b001000110;
        state_var_NS = COMP_LOOP_C_66;
      end
      COMP_LOOP_C_66 : begin
        fsm_output = 9'b001000111;
        state_var_NS = COMP_LOOP_C_67;
      end
      COMP_LOOP_C_67 : begin
        fsm_output = 9'b001001000;
        state_var_NS = COMP_LOOP_C_68;
      end
      COMP_LOOP_C_68 : begin
        fsm_output = 9'b001001001;
        state_var_NS = COMP_LOOP_C_69;
      end
      COMP_LOOP_C_69 : begin
        fsm_output = 9'b001001010;
        state_var_NS = COMP_LOOP_C_70;
      end
      COMP_LOOP_C_70 : begin
        fsm_output = 9'b001001011;
        state_var_NS = COMP_LOOP_C_71;
      end
      COMP_LOOP_C_71 : begin
        fsm_output = 9'b001001100;
        state_var_NS = COMP_LOOP_C_72;
      end
      COMP_LOOP_C_72 : begin
        fsm_output = 9'b001001101;
        state_var_NS = COMP_LOOP_C_73;
      end
      COMP_LOOP_C_73 : begin
        fsm_output = 9'b001001110;
        state_var_NS = COMP_LOOP_C_74;
      end
      COMP_LOOP_C_74 : begin
        fsm_output = 9'b001001111;
        state_var_NS = COMP_LOOP_C_75;
      end
      COMP_LOOP_C_75 : begin
        fsm_output = 9'b001010000;
        state_var_NS = COMP_LOOP_C_76;
      end
      COMP_LOOP_C_76 : begin
        fsm_output = 9'b001010001;
        state_var_NS = COMP_LOOP_C_77;
      end
      COMP_LOOP_C_77 : begin
        fsm_output = 9'b001010010;
        state_var_NS = COMP_LOOP_C_78;
      end
      COMP_LOOP_C_78 : begin
        fsm_output = 9'b001010011;
        state_var_NS = COMP_LOOP_C_79;
      end
      COMP_LOOP_C_79 : begin
        fsm_output = 9'b001010100;
        state_var_NS = COMP_LOOP_C_80;
      end
      COMP_LOOP_C_80 : begin
        fsm_output = 9'b001010101;
        state_var_NS = COMP_LOOP_C_81;
      end
      COMP_LOOP_C_81 : begin
        fsm_output = 9'b001010110;
        state_var_NS = COMP_LOOP_C_82;
      end
      COMP_LOOP_C_82 : begin
        fsm_output = 9'b001010111;
        state_var_NS = COMP_LOOP_C_83;
      end
      COMP_LOOP_C_83 : begin
        fsm_output = 9'b001011000;
        state_var_NS = COMP_LOOP_C_84;
      end
      COMP_LOOP_C_84 : begin
        fsm_output = 9'b001011001;
        state_var_NS = COMP_LOOP_C_85;
      end
      COMP_LOOP_C_85 : begin
        fsm_output = 9'b001011010;
        state_var_NS = COMP_LOOP_C_86;
      end
      COMP_LOOP_C_86 : begin
        fsm_output = 9'b001011011;
        state_var_NS = COMP_LOOP_C_87;
      end
      COMP_LOOP_C_87 : begin
        fsm_output = 9'b001011100;
        state_var_NS = COMP_LOOP_C_88;
      end
      COMP_LOOP_C_88 : begin
        fsm_output = 9'b001011101;
        state_var_NS = COMP_LOOP_C_89;
      end
      COMP_LOOP_C_89 : begin
        fsm_output = 9'b001011110;
        state_var_NS = COMP_LOOP_C_90;
      end
      COMP_LOOP_C_90 : begin
        fsm_output = 9'b001011111;
        state_var_NS = COMP_LOOP_C_91;
      end
      COMP_LOOP_C_91 : begin
        fsm_output = 9'b001100000;
        state_var_NS = COMP_LOOP_C_92;
      end
      COMP_LOOP_C_92 : begin
        fsm_output = 9'b001100001;
        state_var_NS = COMP_LOOP_C_93;
      end
      COMP_LOOP_C_93 : begin
        fsm_output = 9'b001100010;
        state_var_NS = COMP_LOOP_C_94;
      end
      COMP_LOOP_C_94 : begin
        fsm_output = 9'b001100011;
        state_var_NS = COMP_LOOP_C_95;
      end
      COMP_LOOP_C_95 : begin
        fsm_output = 9'b001100100;
        state_var_NS = COMP_LOOP_C_96;
      end
      COMP_LOOP_C_96 : begin
        fsm_output = 9'b001100101;
        state_var_NS = COMP_LOOP_C_97;
      end
      COMP_LOOP_C_97 : begin
        fsm_output = 9'b001100110;
        state_var_NS = COMP_LOOP_C_98;
      end
      COMP_LOOP_C_98 : begin
        fsm_output = 9'b001100111;
        state_var_NS = COMP_LOOP_C_99;
      end
      COMP_LOOP_C_99 : begin
        fsm_output = 9'b001101000;
        state_var_NS = COMP_LOOP_C_100;
      end
      COMP_LOOP_C_100 : begin
        fsm_output = 9'b001101001;
        state_var_NS = COMP_LOOP_C_101;
      end
      COMP_LOOP_C_101 : begin
        fsm_output = 9'b001101010;
        state_var_NS = COMP_LOOP_C_102;
      end
      COMP_LOOP_C_102 : begin
        fsm_output = 9'b001101011;
        state_var_NS = COMP_LOOP_C_103;
      end
      COMP_LOOP_C_103 : begin
        fsm_output = 9'b001101100;
        state_var_NS = COMP_LOOP_C_104;
      end
      COMP_LOOP_C_104 : begin
        fsm_output = 9'b001101101;
        state_var_NS = COMP_LOOP_C_105;
      end
      COMP_LOOP_C_105 : begin
        fsm_output = 9'b001101110;
        state_var_NS = COMP_LOOP_C_106;
      end
      COMP_LOOP_C_106 : begin
        fsm_output = 9'b001101111;
        state_var_NS = COMP_LOOP_C_107;
      end
      COMP_LOOP_C_107 : begin
        fsm_output = 9'b001110000;
        state_var_NS = COMP_LOOP_C_108;
      end
      COMP_LOOP_C_108 : begin
        fsm_output = 9'b001110001;
        state_var_NS = COMP_LOOP_C_109;
      end
      COMP_LOOP_C_109 : begin
        fsm_output = 9'b001110010;
        state_var_NS = COMP_LOOP_C_110;
      end
      COMP_LOOP_C_110 : begin
        fsm_output = 9'b001110011;
        state_var_NS = COMP_LOOP_C_111;
      end
      COMP_LOOP_C_111 : begin
        fsm_output = 9'b001110100;
        state_var_NS = COMP_LOOP_C_112;
      end
      COMP_LOOP_C_112 : begin
        fsm_output = 9'b001110101;
        state_var_NS = COMP_LOOP_C_113;
      end
      COMP_LOOP_C_113 : begin
        fsm_output = 9'b001110110;
        state_var_NS = COMP_LOOP_C_114;
      end
      COMP_LOOP_C_114 : begin
        fsm_output = 9'b001110111;
        state_var_NS = COMP_LOOP_C_115;
      end
      COMP_LOOP_C_115 : begin
        fsm_output = 9'b001111000;
        state_var_NS = COMP_LOOP_C_116;
      end
      COMP_LOOP_C_116 : begin
        fsm_output = 9'b001111001;
        state_var_NS = COMP_LOOP_C_117;
      end
      COMP_LOOP_C_117 : begin
        fsm_output = 9'b001111010;
        state_var_NS = COMP_LOOP_C_118;
      end
      COMP_LOOP_C_118 : begin
        fsm_output = 9'b001111011;
        state_var_NS = COMP_LOOP_C_119;
      end
      COMP_LOOP_C_119 : begin
        fsm_output = 9'b001111100;
        state_var_NS = COMP_LOOP_C_120;
      end
      COMP_LOOP_C_120 : begin
        fsm_output = 9'b001111101;
        state_var_NS = COMP_LOOP_C_121;
      end
      COMP_LOOP_C_121 : begin
        fsm_output = 9'b001111110;
        state_var_NS = COMP_LOOP_C_122;
      end
      COMP_LOOP_C_122 : begin
        fsm_output = 9'b001111111;
        state_var_NS = COMP_LOOP_C_123;
      end
      COMP_LOOP_C_123 : begin
        fsm_output = 9'b010000000;
        state_var_NS = COMP_LOOP_C_124;
      end
      COMP_LOOP_C_124 : begin
        fsm_output = 9'b010000001;
        state_var_NS = COMP_LOOP_C_125;
      end
      COMP_LOOP_C_125 : begin
        fsm_output = 9'b010000010;
        state_var_NS = COMP_LOOP_C_126;
      end
      COMP_LOOP_C_126 : begin
        fsm_output = 9'b010000011;
        state_var_NS = COMP_LOOP_C_127;
      end
      COMP_LOOP_C_127 : begin
        fsm_output = 9'b010000100;
        state_var_NS = COMP_LOOP_C_128;
      end
      COMP_LOOP_C_128 : begin
        fsm_output = 9'b010000101;
        state_var_NS = COMP_LOOP_C_129;
      end
      COMP_LOOP_C_129 : begin
        fsm_output = 9'b010000110;
        state_var_NS = COMP_LOOP_C_130;
      end
      COMP_LOOP_C_130 : begin
        fsm_output = 9'b010000111;
        state_var_NS = COMP_LOOP_C_131;
      end
      COMP_LOOP_C_131 : begin
        fsm_output = 9'b010001000;
        state_var_NS = COMP_LOOP_C_132;
      end
      COMP_LOOP_C_132 : begin
        fsm_output = 9'b010001001;
        state_var_NS = COMP_LOOP_C_133;
      end
      COMP_LOOP_C_133 : begin
        fsm_output = 9'b010001010;
        state_var_NS = COMP_LOOP_C_134;
      end
      COMP_LOOP_C_134 : begin
        fsm_output = 9'b010001011;
        state_var_NS = COMP_LOOP_C_135;
      end
      COMP_LOOP_C_135 : begin
        fsm_output = 9'b010001100;
        state_var_NS = COMP_LOOP_C_136;
      end
      COMP_LOOP_C_136 : begin
        fsm_output = 9'b010001101;
        state_var_NS = COMP_LOOP_C_137;
      end
      COMP_LOOP_C_137 : begin
        fsm_output = 9'b010001110;
        state_var_NS = COMP_LOOP_C_138;
      end
      COMP_LOOP_C_138 : begin
        fsm_output = 9'b010001111;
        state_var_NS = COMP_LOOP_C_139;
      end
      COMP_LOOP_C_139 : begin
        fsm_output = 9'b010010000;
        state_var_NS = COMP_LOOP_C_140;
      end
      COMP_LOOP_C_140 : begin
        fsm_output = 9'b010010001;
        state_var_NS = COMP_LOOP_C_141;
      end
      COMP_LOOP_C_141 : begin
        fsm_output = 9'b010010010;
        state_var_NS = COMP_LOOP_C_142;
      end
      COMP_LOOP_C_142 : begin
        fsm_output = 9'b010010011;
        state_var_NS = COMP_LOOP_C_143;
      end
      COMP_LOOP_C_143 : begin
        fsm_output = 9'b010010100;
        state_var_NS = COMP_LOOP_C_144;
      end
      COMP_LOOP_C_144 : begin
        fsm_output = 9'b010010101;
        state_var_NS = COMP_LOOP_C_145;
      end
      COMP_LOOP_C_145 : begin
        fsm_output = 9'b010010110;
        state_var_NS = COMP_LOOP_C_146;
      end
      COMP_LOOP_C_146 : begin
        fsm_output = 9'b010010111;
        state_var_NS = COMP_LOOP_C_147;
      end
      COMP_LOOP_C_147 : begin
        fsm_output = 9'b010011000;
        state_var_NS = COMP_LOOP_C_148;
      end
      COMP_LOOP_C_148 : begin
        fsm_output = 9'b010011001;
        state_var_NS = COMP_LOOP_C_149;
      end
      COMP_LOOP_C_149 : begin
        fsm_output = 9'b010011010;
        state_var_NS = COMP_LOOP_C_150;
      end
      COMP_LOOP_C_150 : begin
        fsm_output = 9'b010011011;
        state_var_NS = COMP_LOOP_C_151;
      end
      COMP_LOOP_C_151 : begin
        fsm_output = 9'b010011100;
        state_var_NS = COMP_LOOP_C_152;
      end
      COMP_LOOP_C_152 : begin
        fsm_output = 9'b010011101;
        state_var_NS = COMP_LOOP_C_153;
      end
      COMP_LOOP_C_153 : begin
        fsm_output = 9'b010011110;
        state_var_NS = COMP_LOOP_C_154;
      end
      COMP_LOOP_C_154 : begin
        fsm_output = 9'b010011111;
        state_var_NS = COMP_LOOP_C_155;
      end
      COMP_LOOP_C_155 : begin
        fsm_output = 9'b010100000;
        state_var_NS = COMP_LOOP_C_156;
      end
      COMP_LOOP_C_156 : begin
        fsm_output = 9'b010100001;
        state_var_NS = COMP_LOOP_C_157;
      end
      COMP_LOOP_C_157 : begin
        fsm_output = 9'b010100010;
        state_var_NS = COMP_LOOP_C_158;
      end
      COMP_LOOP_C_158 : begin
        fsm_output = 9'b010100011;
        state_var_NS = COMP_LOOP_C_159;
      end
      COMP_LOOP_C_159 : begin
        fsm_output = 9'b010100100;
        state_var_NS = COMP_LOOP_C_160;
      end
      COMP_LOOP_C_160 : begin
        fsm_output = 9'b010100101;
        state_var_NS = COMP_LOOP_C_161;
      end
      COMP_LOOP_C_161 : begin
        fsm_output = 9'b010100110;
        state_var_NS = COMP_LOOP_C_162;
      end
      COMP_LOOP_C_162 : begin
        fsm_output = 9'b010100111;
        state_var_NS = COMP_LOOP_C_163;
      end
      COMP_LOOP_C_163 : begin
        fsm_output = 9'b010101000;
        state_var_NS = COMP_LOOP_C_164;
      end
      COMP_LOOP_C_164 : begin
        fsm_output = 9'b010101001;
        state_var_NS = COMP_LOOP_C_165;
      end
      COMP_LOOP_C_165 : begin
        fsm_output = 9'b010101010;
        state_var_NS = COMP_LOOP_C_166;
      end
      COMP_LOOP_C_166 : begin
        fsm_output = 9'b010101011;
        state_var_NS = COMP_LOOP_C_167;
      end
      COMP_LOOP_C_167 : begin
        fsm_output = 9'b010101100;
        state_var_NS = COMP_LOOP_C_168;
      end
      COMP_LOOP_C_168 : begin
        fsm_output = 9'b010101101;
        state_var_NS = COMP_LOOP_C_169;
      end
      COMP_LOOP_C_169 : begin
        fsm_output = 9'b010101110;
        state_var_NS = COMP_LOOP_C_170;
      end
      COMP_LOOP_C_170 : begin
        fsm_output = 9'b010101111;
        state_var_NS = COMP_LOOP_C_171;
      end
      COMP_LOOP_C_171 : begin
        fsm_output = 9'b010110000;
        state_var_NS = COMP_LOOP_C_172;
      end
      COMP_LOOP_C_172 : begin
        fsm_output = 9'b010110001;
        state_var_NS = COMP_LOOP_C_173;
      end
      COMP_LOOP_C_173 : begin
        fsm_output = 9'b010110010;
        state_var_NS = COMP_LOOP_C_174;
      end
      COMP_LOOP_C_174 : begin
        fsm_output = 9'b010110011;
        state_var_NS = COMP_LOOP_C_175;
      end
      COMP_LOOP_C_175 : begin
        fsm_output = 9'b010110100;
        state_var_NS = COMP_LOOP_C_176;
      end
      COMP_LOOP_C_176 : begin
        fsm_output = 9'b010110101;
        state_var_NS = COMP_LOOP_C_177;
      end
      COMP_LOOP_C_177 : begin
        fsm_output = 9'b010110110;
        state_var_NS = COMP_LOOP_C_178;
      end
      COMP_LOOP_C_178 : begin
        fsm_output = 9'b010110111;
        state_var_NS = COMP_LOOP_C_179;
      end
      COMP_LOOP_C_179 : begin
        fsm_output = 9'b010111000;
        state_var_NS = COMP_LOOP_C_180;
      end
      COMP_LOOP_C_180 : begin
        fsm_output = 9'b010111001;
        state_var_NS = COMP_LOOP_C_181;
      end
      COMP_LOOP_C_181 : begin
        fsm_output = 9'b010111010;
        state_var_NS = COMP_LOOP_C_182;
      end
      COMP_LOOP_C_182 : begin
        fsm_output = 9'b010111011;
        state_var_NS = COMP_LOOP_C_183;
      end
      COMP_LOOP_C_183 : begin
        fsm_output = 9'b010111100;
        state_var_NS = COMP_LOOP_C_184;
      end
      COMP_LOOP_C_184 : begin
        fsm_output = 9'b010111101;
        state_var_NS = COMP_LOOP_C_185;
      end
      COMP_LOOP_C_185 : begin
        fsm_output = 9'b010111110;
        state_var_NS = COMP_LOOP_C_186;
      end
      COMP_LOOP_C_186 : begin
        fsm_output = 9'b010111111;
        state_var_NS = COMP_LOOP_C_187;
      end
      COMP_LOOP_C_187 : begin
        fsm_output = 9'b011000000;
        state_var_NS = COMP_LOOP_C_188;
      end
      COMP_LOOP_C_188 : begin
        fsm_output = 9'b011000001;
        state_var_NS = COMP_LOOP_C_189;
      end
      COMP_LOOP_C_189 : begin
        fsm_output = 9'b011000010;
        state_var_NS = COMP_LOOP_C_190;
      end
      COMP_LOOP_C_190 : begin
        fsm_output = 9'b011000011;
        state_var_NS = COMP_LOOP_C_191;
      end
      COMP_LOOP_C_191 : begin
        fsm_output = 9'b011000100;
        state_var_NS = COMP_LOOP_C_192;
      end
      COMP_LOOP_C_192 : begin
        fsm_output = 9'b011000101;
        state_var_NS = COMP_LOOP_C_193;
      end
      COMP_LOOP_C_193 : begin
        fsm_output = 9'b011000110;
        state_var_NS = COMP_LOOP_C_194;
      end
      COMP_LOOP_C_194 : begin
        fsm_output = 9'b011000111;
        state_var_NS = COMP_LOOP_C_195;
      end
      COMP_LOOP_C_195 : begin
        fsm_output = 9'b011001000;
        state_var_NS = COMP_LOOP_C_196;
      end
      COMP_LOOP_C_196 : begin
        fsm_output = 9'b011001001;
        state_var_NS = COMP_LOOP_C_197;
      end
      COMP_LOOP_C_197 : begin
        fsm_output = 9'b011001010;
        state_var_NS = COMP_LOOP_C_198;
      end
      COMP_LOOP_C_198 : begin
        fsm_output = 9'b011001011;
        state_var_NS = COMP_LOOP_C_199;
      end
      COMP_LOOP_C_199 : begin
        fsm_output = 9'b011001100;
        state_var_NS = COMP_LOOP_C_200;
      end
      COMP_LOOP_C_200 : begin
        fsm_output = 9'b011001101;
        state_var_NS = COMP_LOOP_C_201;
      end
      COMP_LOOP_C_201 : begin
        fsm_output = 9'b011001110;
        state_var_NS = COMP_LOOP_C_202;
      end
      COMP_LOOP_C_202 : begin
        fsm_output = 9'b011001111;
        state_var_NS = COMP_LOOP_C_203;
      end
      COMP_LOOP_C_203 : begin
        fsm_output = 9'b011010000;
        state_var_NS = COMP_LOOP_C_204;
      end
      COMP_LOOP_C_204 : begin
        fsm_output = 9'b011010001;
        state_var_NS = COMP_LOOP_C_205;
      end
      COMP_LOOP_C_205 : begin
        fsm_output = 9'b011010010;
        state_var_NS = COMP_LOOP_C_206;
      end
      COMP_LOOP_C_206 : begin
        fsm_output = 9'b011010011;
        state_var_NS = COMP_LOOP_C_207;
      end
      COMP_LOOP_C_207 : begin
        fsm_output = 9'b011010100;
        state_var_NS = COMP_LOOP_C_208;
      end
      COMP_LOOP_C_208 : begin
        fsm_output = 9'b011010101;
        state_var_NS = COMP_LOOP_C_209;
      end
      COMP_LOOP_C_209 : begin
        fsm_output = 9'b011010110;
        state_var_NS = COMP_LOOP_C_210;
      end
      COMP_LOOP_C_210 : begin
        fsm_output = 9'b011010111;
        state_var_NS = COMP_LOOP_C_211;
      end
      COMP_LOOP_C_211 : begin
        fsm_output = 9'b011011000;
        state_var_NS = COMP_LOOP_C_212;
      end
      COMP_LOOP_C_212 : begin
        fsm_output = 9'b011011001;
        state_var_NS = COMP_LOOP_C_213;
      end
      COMP_LOOP_C_213 : begin
        fsm_output = 9'b011011010;
        state_var_NS = COMP_LOOP_C_214;
      end
      COMP_LOOP_C_214 : begin
        fsm_output = 9'b011011011;
        state_var_NS = COMP_LOOP_C_215;
      end
      COMP_LOOP_C_215 : begin
        fsm_output = 9'b011011100;
        state_var_NS = COMP_LOOP_C_216;
      end
      COMP_LOOP_C_216 : begin
        fsm_output = 9'b011011101;
        state_var_NS = COMP_LOOP_C_217;
      end
      COMP_LOOP_C_217 : begin
        fsm_output = 9'b011011110;
        state_var_NS = COMP_LOOP_C_218;
      end
      COMP_LOOP_C_218 : begin
        fsm_output = 9'b011011111;
        state_var_NS = COMP_LOOP_C_219;
      end
      COMP_LOOP_C_219 : begin
        fsm_output = 9'b011100000;
        state_var_NS = COMP_LOOP_C_220;
      end
      COMP_LOOP_C_220 : begin
        fsm_output = 9'b011100001;
        state_var_NS = COMP_LOOP_C_221;
      end
      COMP_LOOP_C_221 : begin
        fsm_output = 9'b011100010;
        state_var_NS = COMP_LOOP_C_222;
      end
      COMP_LOOP_C_222 : begin
        fsm_output = 9'b011100011;
        state_var_NS = COMP_LOOP_C_223;
      end
      COMP_LOOP_C_223 : begin
        fsm_output = 9'b011100100;
        state_var_NS = COMP_LOOP_C_224;
      end
      COMP_LOOP_C_224 : begin
        fsm_output = 9'b011100101;
        state_var_NS = COMP_LOOP_C_225;
      end
      COMP_LOOP_C_225 : begin
        fsm_output = 9'b011100110;
        state_var_NS = COMP_LOOP_C_226;
      end
      COMP_LOOP_C_226 : begin
        fsm_output = 9'b011100111;
        state_var_NS = COMP_LOOP_C_227;
      end
      COMP_LOOP_C_227 : begin
        fsm_output = 9'b011101000;
        state_var_NS = COMP_LOOP_C_228;
      end
      COMP_LOOP_C_228 : begin
        fsm_output = 9'b011101001;
        state_var_NS = COMP_LOOP_C_229;
      end
      COMP_LOOP_C_229 : begin
        fsm_output = 9'b011101010;
        state_var_NS = COMP_LOOP_C_230;
      end
      COMP_LOOP_C_230 : begin
        fsm_output = 9'b011101011;
        state_var_NS = COMP_LOOP_C_231;
      end
      COMP_LOOP_C_231 : begin
        fsm_output = 9'b011101100;
        state_var_NS = COMP_LOOP_C_232;
      end
      COMP_LOOP_C_232 : begin
        fsm_output = 9'b011101101;
        state_var_NS = COMP_LOOP_C_233;
      end
      COMP_LOOP_C_233 : begin
        fsm_output = 9'b011101110;
        state_var_NS = COMP_LOOP_C_234;
      end
      COMP_LOOP_C_234 : begin
        fsm_output = 9'b011101111;
        state_var_NS = COMP_LOOP_C_235;
      end
      COMP_LOOP_C_235 : begin
        fsm_output = 9'b011110000;
        state_var_NS = COMP_LOOP_C_236;
      end
      COMP_LOOP_C_236 : begin
        fsm_output = 9'b011110001;
        state_var_NS = COMP_LOOP_C_237;
      end
      COMP_LOOP_C_237 : begin
        fsm_output = 9'b011110010;
        state_var_NS = COMP_LOOP_C_238;
      end
      COMP_LOOP_C_238 : begin
        fsm_output = 9'b011110011;
        state_var_NS = COMP_LOOP_C_239;
      end
      COMP_LOOP_C_239 : begin
        fsm_output = 9'b011110100;
        state_var_NS = COMP_LOOP_C_240;
      end
      COMP_LOOP_C_240 : begin
        fsm_output = 9'b011110101;
        state_var_NS = COMP_LOOP_C_241;
      end
      COMP_LOOP_C_241 : begin
        fsm_output = 9'b011110110;
        state_var_NS = COMP_LOOP_C_242;
      end
      COMP_LOOP_C_242 : begin
        fsm_output = 9'b011110111;
        state_var_NS = COMP_LOOP_C_243;
      end
      COMP_LOOP_C_243 : begin
        fsm_output = 9'b011111000;
        state_var_NS = COMP_LOOP_C_244;
      end
      COMP_LOOP_C_244 : begin
        fsm_output = 9'b011111001;
        state_var_NS = COMP_LOOP_C_245;
      end
      COMP_LOOP_C_245 : begin
        fsm_output = 9'b011111010;
        state_var_NS = COMP_LOOP_C_246;
      end
      COMP_LOOP_C_246 : begin
        fsm_output = 9'b011111011;
        state_var_NS = COMP_LOOP_C_247;
      end
      COMP_LOOP_C_247 : begin
        fsm_output = 9'b011111100;
        state_var_NS = COMP_LOOP_C_248;
      end
      COMP_LOOP_C_248 : begin
        fsm_output = 9'b011111101;
        state_var_NS = COMP_LOOP_C_249;
      end
      COMP_LOOP_C_249 : begin
        fsm_output = 9'b011111110;
        state_var_NS = COMP_LOOP_C_250;
      end
      COMP_LOOP_C_250 : begin
        fsm_output = 9'b011111111;
        state_var_NS = COMP_LOOP_C_251;
      end
      COMP_LOOP_C_251 : begin
        fsm_output = 9'b100000000;
        state_var_NS = COMP_LOOP_C_252;
      end
      COMP_LOOP_C_252 : begin
        fsm_output = 9'b100000001;
        state_var_NS = COMP_LOOP_C_253;
      end
      COMP_LOOP_C_253 : begin
        fsm_output = 9'b100000010;
        state_var_NS = COMP_LOOP_C_254;
      end
      COMP_LOOP_C_254 : begin
        fsm_output = 9'b100000011;
        state_var_NS = COMP_LOOP_C_255;
      end
      COMP_LOOP_C_255 : begin
        fsm_output = 9'b100000100;
        state_var_NS = COMP_LOOP_C_256;
      end
      COMP_LOOP_C_256 : begin
        fsm_output = 9'b100000101;
        state_var_NS = COMP_LOOP_C_257;
      end
      COMP_LOOP_C_257 : begin
        fsm_output = 9'b100000110;
        state_var_NS = COMP_LOOP_C_258;
      end
      COMP_LOOP_C_258 : begin
        fsm_output = 9'b100000111;
        state_var_NS = COMP_LOOP_C_259;
      end
      COMP_LOOP_C_259 : begin
        fsm_output = 9'b100001000;
        state_var_NS = COMP_LOOP_C_260;
      end
      COMP_LOOP_C_260 : begin
        fsm_output = 9'b100001001;
        state_var_NS = COMP_LOOP_C_261;
      end
      COMP_LOOP_C_261 : begin
        fsm_output = 9'b100001010;
        state_var_NS = COMP_LOOP_C_262;
      end
      COMP_LOOP_C_262 : begin
        fsm_output = 9'b100001011;
        state_var_NS = COMP_LOOP_C_263;
      end
      COMP_LOOP_C_263 : begin
        fsm_output = 9'b100001100;
        state_var_NS = COMP_LOOP_C_264;
      end
      COMP_LOOP_C_264 : begin
        fsm_output = 9'b100001101;
        state_var_NS = COMP_LOOP_C_265;
      end
      COMP_LOOP_C_265 : begin
        fsm_output = 9'b100001110;
        state_var_NS = COMP_LOOP_C_266;
      end
      COMP_LOOP_C_266 : begin
        fsm_output = 9'b100001111;
        state_var_NS = COMP_LOOP_C_267;
      end
      COMP_LOOP_C_267 : begin
        fsm_output = 9'b100010000;
        state_var_NS = COMP_LOOP_C_268;
      end
      COMP_LOOP_C_268 : begin
        fsm_output = 9'b100010001;
        state_var_NS = COMP_LOOP_C_269;
      end
      COMP_LOOP_C_269 : begin
        fsm_output = 9'b100010010;
        state_var_NS = COMP_LOOP_C_270;
      end
      COMP_LOOP_C_270 : begin
        fsm_output = 9'b100010011;
        state_var_NS = COMP_LOOP_C_271;
      end
      COMP_LOOP_C_271 : begin
        fsm_output = 9'b100010100;
        state_var_NS = COMP_LOOP_C_272;
      end
      COMP_LOOP_C_272 : begin
        fsm_output = 9'b100010101;
        state_var_NS = COMP_LOOP_C_273;
      end
      COMP_LOOP_C_273 : begin
        fsm_output = 9'b100010110;
        state_var_NS = COMP_LOOP_C_274;
      end
      COMP_LOOP_C_274 : begin
        fsm_output = 9'b100010111;
        state_var_NS = COMP_LOOP_C_275;
      end
      COMP_LOOP_C_275 : begin
        fsm_output = 9'b100011000;
        state_var_NS = COMP_LOOP_C_276;
      end
      COMP_LOOP_C_276 : begin
        fsm_output = 9'b100011001;
        state_var_NS = COMP_LOOP_C_277;
      end
      COMP_LOOP_C_277 : begin
        fsm_output = 9'b100011010;
        state_var_NS = COMP_LOOP_C_278;
      end
      COMP_LOOP_C_278 : begin
        fsm_output = 9'b100011011;
        state_var_NS = COMP_LOOP_C_279;
      end
      COMP_LOOP_C_279 : begin
        fsm_output = 9'b100011100;
        state_var_NS = COMP_LOOP_C_280;
      end
      COMP_LOOP_C_280 : begin
        fsm_output = 9'b100011101;
        state_var_NS = COMP_LOOP_C_281;
      end
      COMP_LOOP_C_281 : begin
        fsm_output = 9'b100011110;
        state_var_NS = COMP_LOOP_C_282;
      end
      COMP_LOOP_C_282 : begin
        fsm_output = 9'b100011111;
        state_var_NS = COMP_LOOP_C_283;
      end
      COMP_LOOP_C_283 : begin
        fsm_output = 9'b100100000;
        state_var_NS = COMP_LOOP_C_284;
      end
      COMP_LOOP_C_284 : begin
        fsm_output = 9'b100100001;
        state_var_NS = COMP_LOOP_C_285;
      end
      COMP_LOOP_C_285 : begin
        fsm_output = 9'b100100010;
        state_var_NS = COMP_LOOP_C_286;
      end
      COMP_LOOP_C_286 : begin
        fsm_output = 9'b100100011;
        state_var_NS = COMP_LOOP_C_287;
      end
      COMP_LOOP_C_287 : begin
        fsm_output = 9'b100100100;
        state_var_NS = COMP_LOOP_C_288;
      end
      COMP_LOOP_C_288 : begin
        fsm_output = 9'b100100101;
        state_var_NS = COMP_LOOP_C_289;
      end
      COMP_LOOP_C_289 : begin
        fsm_output = 9'b100100110;
        state_var_NS = COMP_LOOP_C_290;
      end
      COMP_LOOP_C_290 : begin
        fsm_output = 9'b100100111;
        state_var_NS = COMP_LOOP_C_291;
      end
      COMP_LOOP_C_291 : begin
        fsm_output = 9'b100101000;
        state_var_NS = COMP_LOOP_C_292;
      end
      COMP_LOOP_C_292 : begin
        fsm_output = 9'b100101001;
        state_var_NS = COMP_LOOP_C_293;
      end
      COMP_LOOP_C_293 : begin
        fsm_output = 9'b100101010;
        state_var_NS = COMP_LOOP_C_294;
      end
      COMP_LOOP_C_294 : begin
        fsm_output = 9'b100101011;
        state_var_NS = COMP_LOOP_C_295;
      end
      COMP_LOOP_C_295 : begin
        fsm_output = 9'b100101100;
        state_var_NS = COMP_LOOP_C_296;
      end
      COMP_LOOP_C_296 : begin
        fsm_output = 9'b100101101;
        state_var_NS = COMP_LOOP_C_297;
      end
      COMP_LOOP_C_297 : begin
        fsm_output = 9'b100101110;
        state_var_NS = COMP_LOOP_C_298;
      end
      COMP_LOOP_C_298 : begin
        fsm_output = 9'b100101111;
        state_var_NS = COMP_LOOP_C_299;
      end
      COMP_LOOP_C_299 : begin
        fsm_output = 9'b100110000;
        state_var_NS = COMP_LOOP_C_300;
      end
      COMP_LOOP_C_300 : begin
        fsm_output = 9'b100110001;
        state_var_NS = COMP_LOOP_C_301;
      end
      COMP_LOOP_C_301 : begin
        fsm_output = 9'b100110010;
        state_var_NS = COMP_LOOP_C_302;
      end
      COMP_LOOP_C_302 : begin
        fsm_output = 9'b100110011;
        state_var_NS = COMP_LOOP_C_303;
      end
      COMP_LOOP_C_303 : begin
        fsm_output = 9'b100110100;
        state_var_NS = COMP_LOOP_C_304;
      end
      COMP_LOOP_C_304 : begin
        fsm_output = 9'b100110101;
        state_var_NS = COMP_LOOP_C_305;
      end
      COMP_LOOP_C_305 : begin
        fsm_output = 9'b100110110;
        state_var_NS = COMP_LOOP_C_306;
      end
      COMP_LOOP_C_306 : begin
        fsm_output = 9'b100110111;
        state_var_NS = COMP_LOOP_C_307;
      end
      COMP_LOOP_C_307 : begin
        fsm_output = 9'b100111000;
        state_var_NS = COMP_LOOP_C_308;
      end
      COMP_LOOP_C_308 : begin
        fsm_output = 9'b100111001;
        state_var_NS = COMP_LOOP_C_309;
      end
      COMP_LOOP_C_309 : begin
        fsm_output = 9'b100111010;
        state_var_NS = COMP_LOOP_C_310;
      end
      COMP_LOOP_C_310 : begin
        fsm_output = 9'b100111011;
        state_var_NS = COMP_LOOP_C_311;
      end
      COMP_LOOP_C_311 : begin
        fsm_output = 9'b100111100;
        state_var_NS = COMP_LOOP_C_312;
      end
      COMP_LOOP_C_312 : begin
        fsm_output = 9'b100111101;
        state_var_NS = COMP_LOOP_C_313;
      end
      COMP_LOOP_C_313 : begin
        fsm_output = 9'b100111110;
        state_var_NS = COMP_LOOP_C_314;
      end
      COMP_LOOP_C_314 : begin
        fsm_output = 9'b100111111;
        state_var_NS = COMP_LOOP_C_315;
      end
      COMP_LOOP_C_315 : begin
        fsm_output = 9'b101000000;
        state_var_NS = COMP_LOOP_C_316;
      end
      COMP_LOOP_C_316 : begin
        fsm_output = 9'b101000001;
        state_var_NS = COMP_LOOP_C_317;
      end
      COMP_LOOP_C_317 : begin
        fsm_output = 9'b101000010;
        state_var_NS = COMP_LOOP_C_318;
      end
      COMP_LOOP_C_318 : begin
        fsm_output = 9'b101000011;
        state_var_NS = COMP_LOOP_C_319;
      end
      COMP_LOOP_C_319 : begin
        fsm_output = 9'b101000100;
        state_var_NS = COMP_LOOP_C_320;
      end
      COMP_LOOP_C_320 : begin
        fsm_output = 9'b101000101;
        state_var_NS = COMP_LOOP_C_321;
      end
      COMP_LOOP_C_321 : begin
        fsm_output = 9'b101000110;
        state_var_NS = COMP_LOOP_C_322;
      end
      COMP_LOOP_C_322 : begin
        fsm_output = 9'b101000111;
        state_var_NS = COMP_LOOP_C_323;
      end
      COMP_LOOP_C_323 : begin
        fsm_output = 9'b101001000;
        state_var_NS = COMP_LOOP_C_324;
      end
      COMP_LOOP_C_324 : begin
        fsm_output = 9'b101001001;
        state_var_NS = COMP_LOOP_C_325;
      end
      COMP_LOOP_C_325 : begin
        fsm_output = 9'b101001010;
        state_var_NS = COMP_LOOP_C_326;
      end
      COMP_LOOP_C_326 : begin
        fsm_output = 9'b101001011;
        state_var_NS = COMP_LOOP_C_327;
      end
      COMP_LOOP_C_327 : begin
        fsm_output = 9'b101001100;
        state_var_NS = COMP_LOOP_C_328;
      end
      COMP_LOOP_C_328 : begin
        fsm_output = 9'b101001101;
        state_var_NS = COMP_LOOP_C_329;
      end
      COMP_LOOP_C_329 : begin
        fsm_output = 9'b101001110;
        state_var_NS = COMP_LOOP_C_330;
      end
      COMP_LOOP_C_330 : begin
        fsm_output = 9'b101001111;
        state_var_NS = COMP_LOOP_C_331;
      end
      COMP_LOOP_C_331 : begin
        fsm_output = 9'b101010000;
        state_var_NS = COMP_LOOP_C_332;
      end
      COMP_LOOP_C_332 : begin
        fsm_output = 9'b101010001;
        state_var_NS = COMP_LOOP_C_333;
      end
      COMP_LOOP_C_333 : begin
        fsm_output = 9'b101010010;
        state_var_NS = COMP_LOOP_C_334;
      end
      COMP_LOOP_C_334 : begin
        fsm_output = 9'b101010011;
        state_var_NS = COMP_LOOP_C_335;
      end
      COMP_LOOP_C_335 : begin
        fsm_output = 9'b101010100;
        state_var_NS = COMP_LOOP_C_336;
      end
      COMP_LOOP_C_336 : begin
        fsm_output = 9'b101010101;
        state_var_NS = COMP_LOOP_C_337;
      end
      COMP_LOOP_C_337 : begin
        fsm_output = 9'b101010110;
        state_var_NS = COMP_LOOP_C_338;
      end
      COMP_LOOP_C_338 : begin
        fsm_output = 9'b101010111;
        state_var_NS = COMP_LOOP_C_339;
      end
      COMP_LOOP_C_339 : begin
        fsm_output = 9'b101011000;
        state_var_NS = COMP_LOOP_C_340;
      end
      COMP_LOOP_C_340 : begin
        fsm_output = 9'b101011001;
        state_var_NS = COMP_LOOP_C_341;
      end
      COMP_LOOP_C_341 : begin
        fsm_output = 9'b101011010;
        state_var_NS = COMP_LOOP_C_342;
      end
      COMP_LOOP_C_342 : begin
        fsm_output = 9'b101011011;
        state_var_NS = COMP_LOOP_C_343;
      end
      COMP_LOOP_C_343 : begin
        fsm_output = 9'b101011100;
        state_var_NS = COMP_LOOP_C_344;
      end
      COMP_LOOP_C_344 : begin
        fsm_output = 9'b101011101;
        state_var_NS = COMP_LOOP_C_345;
      end
      COMP_LOOP_C_345 : begin
        fsm_output = 9'b101011110;
        state_var_NS = COMP_LOOP_C_346;
      end
      COMP_LOOP_C_346 : begin
        fsm_output = 9'b101011111;
        state_var_NS = COMP_LOOP_C_347;
      end
      COMP_LOOP_C_347 : begin
        fsm_output = 9'b101100000;
        state_var_NS = COMP_LOOP_C_348;
      end
      COMP_LOOP_C_348 : begin
        fsm_output = 9'b101100001;
        state_var_NS = COMP_LOOP_C_349;
      end
      COMP_LOOP_C_349 : begin
        fsm_output = 9'b101100010;
        state_var_NS = COMP_LOOP_C_350;
      end
      COMP_LOOP_C_350 : begin
        fsm_output = 9'b101100011;
        state_var_NS = COMP_LOOP_C_351;
      end
      COMP_LOOP_C_351 : begin
        fsm_output = 9'b101100100;
        state_var_NS = COMP_LOOP_C_352;
      end
      COMP_LOOP_C_352 : begin
        fsm_output = 9'b101100101;
        state_var_NS = COMP_LOOP_C_353;
      end
      COMP_LOOP_C_353 : begin
        fsm_output = 9'b101100110;
        state_var_NS = COMP_LOOP_C_354;
      end
      COMP_LOOP_C_354 : begin
        fsm_output = 9'b101100111;
        state_var_NS = COMP_LOOP_C_355;
      end
      COMP_LOOP_C_355 : begin
        fsm_output = 9'b101101000;
        state_var_NS = COMP_LOOP_C_356;
      end
      COMP_LOOP_C_356 : begin
        fsm_output = 9'b101101001;
        state_var_NS = COMP_LOOP_C_357;
      end
      COMP_LOOP_C_357 : begin
        fsm_output = 9'b101101010;
        state_var_NS = COMP_LOOP_C_358;
      end
      COMP_LOOP_C_358 : begin
        fsm_output = 9'b101101011;
        state_var_NS = COMP_LOOP_C_359;
      end
      COMP_LOOP_C_359 : begin
        fsm_output = 9'b101101100;
        state_var_NS = COMP_LOOP_C_360;
      end
      COMP_LOOP_C_360 : begin
        fsm_output = 9'b101101101;
        state_var_NS = COMP_LOOP_C_361;
      end
      COMP_LOOP_C_361 : begin
        fsm_output = 9'b101101110;
        state_var_NS = COMP_LOOP_C_362;
      end
      COMP_LOOP_C_362 : begin
        fsm_output = 9'b101101111;
        state_var_NS = COMP_LOOP_C_363;
      end
      COMP_LOOP_C_363 : begin
        fsm_output = 9'b101110000;
        state_var_NS = COMP_LOOP_C_364;
      end
      COMP_LOOP_C_364 : begin
        fsm_output = 9'b101110001;
        state_var_NS = COMP_LOOP_C_365;
      end
      COMP_LOOP_C_365 : begin
        fsm_output = 9'b101110010;
        state_var_NS = COMP_LOOP_C_366;
      end
      COMP_LOOP_C_366 : begin
        fsm_output = 9'b101110011;
        state_var_NS = COMP_LOOP_C_367;
      end
      COMP_LOOP_C_367 : begin
        fsm_output = 9'b101110100;
        state_var_NS = COMP_LOOP_C_368;
      end
      COMP_LOOP_C_368 : begin
        fsm_output = 9'b101110101;
        state_var_NS = COMP_LOOP_C_369;
      end
      COMP_LOOP_C_369 : begin
        fsm_output = 9'b101110110;
        state_var_NS = COMP_LOOP_C_370;
      end
      COMP_LOOP_C_370 : begin
        fsm_output = 9'b101110111;
        state_var_NS = COMP_LOOP_C_371;
      end
      COMP_LOOP_C_371 : begin
        fsm_output = 9'b101111000;
        state_var_NS = COMP_LOOP_C_372;
      end
      COMP_LOOP_C_372 : begin
        fsm_output = 9'b101111001;
        state_var_NS = COMP_LOOP_C_373;
      end
      COMP_LOOP_C_373 : begin
        fsm_output = 9'b101111010;
        state_var_NS = COMP_LOOP_C_374;
      end
      COMP_LOOP_C_374 : begin
        fsm_output = 9'b101111011;
        state_var_NS = COMP_LOOP_C_375;
      end
      COMP_LOOP_C_375 : begin
        fsm_output = 9'b101111100;
        state_var_NS = COMP_LOOP_C_376;
      end
      COMP_LOOP_C_376 : begin
        fsm_output = 9'b101111101;
        state_var_NS = COMP_LOOP_C_377;
      end
      COMP_LOOP_C_377 : begin
        fsm_output = 9'b101111110;
        state_var_NS = COMP_LOOP_C_378;
      end
      COMP_LOOP_C_378 : begin
        fsm_output = 9'b101111111;
        state_var_NS = COMP_LOOP_C_379;
      end
      COMP_LOOP_C_379 : begin
        fsm_output = 9'b110000000;
        state_var_NS = COMP_LOOP_C_380;
      end
      COMP_LOOP_C_380 : begin
        fsm_output = 9'b110000001;
        state_var_NS = COMP_LOOP_C_381;
      end
      COMP_LOOP_C_381 : begin
        fsm_output = 9'b110000010;
        state_var_NS = COMP_LOOP_C_382;
      end
      COMP_LOOP_C_382 : begin
        fsm_output = 9'b110000011;
        state_var_NS = COMP_LOOP_C_383;
      end
      COMP_LOOP_C_383 : begin
        fsm_output = 9'b110000100;
        state_var_NS = COMP_LOOP_C_384;
      end
      COMP_LOOP_C_384 : begin
        fsm_output = 9'b110000101;
        state_var_NS = COMP_LOOP_C_385;
      end
      COMP_LOOP_C_385 : begin
        fsm_output = 9'b110000110;
        state_var_NS = COMP_LOOP_C_386;
      end
      COMP_LOOP_C_386 : begin
        fsm_output = 9'b110000111;
        state_var_NS = COMP_LOOP_C_387;
      end
      COMP_LOOP_C_387 : begin
        fsm_output = 9'b110001000;
        state_var_NS = COMP_LOOP_C_388;
      end
      COMP_LOOP_C_388 : begin
        fsm_output = 9'b110001001;
        state_var_NS = COMP_LOOP_C_389;
      end
      COMP_LOOP_C_389 : begin
        fsm_output = 9'b110001010;
        state_var_NS = COMP_LOOP_C_390;
      end
      COMP_LOOP_C_390 : begin
        fsm_output = 9'b110001011;
        state_var_NS = COMP_LOOP_C_391;
      end
      COMP_LOOP_C_391 : begin
        fsm_output = 9'b110001100;
        state_var_NS = COMP_LOOP_C_392;
      end
      COMP_LOOP_C_392 : begin
        fsm_output = 9'b110001101;
        state_var_NS = COMP_LOOP_C_393;
      end
      COMP_LOOP_C_393 : begin
        fsm_output = 9'b110001110;
        state_var_NS = COMP_LOOP_C_394;
      end
      COMP_LOOP_C_394 : begin
        fsm_output = 9'b110001111;
        state_var_NS = COMP_LOOP_C_395;
      end
      COMP_LOOP_C_395 : begin
        fsm_output = 9'b110010000;
        state_var_NS = COMP_LOOP_C_396;
      end
      COMP_LOOP_C_396 : begin
        fsm_output = 9'b110010001;
        state_var_NS = COMP_LOOP_C_397;
      end
      COMP_LOOP_C_397 : begin
        fsm_output = 9'b110010010;
        state_var_NS = COMP_LOOP_C_398;
      end
      COMP_LOOP_C_398 : begin
        fsm_output = 9'b110010011;
        state_var_NS = COMP_LOOP_C_399;
      end
      COMP_LOOP_C_399 : begin
        fsm_output = 9'b110010100;
        state_var_NS = COMP_LOOP_C_400;
      end
      COMP_LOOP_C_400 : begin
        fsm_output = 9'b110010101;
        state_var_NS = COMP_LOOP_C_401;
      end
      COMP_LOOP_C_401 : begin
        fsm_output = 9'b110010110;
        state_var_NS = COMP_LOOP_C_402;
      end
      COMP_LOOP_C_402 : begin
        fsm_output = 9'b110010111;
        state_var_NS = COMP_LOOP_C_403;
      end
      COMP_LOOP_C_403 : begin
        fsm_output = 9'b110011000;
        state_var_NS = COMP_LOOP_C_404;
      end
      COMP_LOOP_C_404 : begin
        fsm_output = 9'b110011001;
        state_var_NS = COMP_LOOP_C_405;
      end
      COMP_LOOP_C_405 : begin
        fsm_output = 9'b110011010;
        state_var_NS = COMP_LOOP_C_406;
      end
      COMP_LOOP_C_406 : begin
        fsm_output = 9'b110011011;
        state_var_NS = COMP_LOOP_C_407;
      end
      COMP_LOOP_C_407 : begin
        fsm_output = 9'b110011100;
        state_var_NS = COMP_LOOP_C_408;
      end
      COMP_LOOP_C_408 : begin
        fsm_output = 9'b110011101;
        state_var_NS = COMP_LOOP_C_409;
      end
      COMP_LOOP_C_409 : begin
        fsm_output = 9'b110011110;
        state_var_NS = COMP_LOOP_C_410;
      end
      COMP_LOOP_C_410 : begin
        fsm_output = 9'b110011111;
        state_var_NS = COMP_LOOP_C_411;
      end
      COMP_LOOP_C_411 : begin
        fsm_output = 9'b110100000;
        state_var_NS = COMP_LOOP_C_412;
      end
      COMP_LOOP_C_412 : begin
        fsm_output = 9'b110100001;
        state_var_NS = COMP_LOOP_C_413;
      end
      COMP_LOOP_C_413 : begin
        fsm_output = 9'b110100010;
        state_var_NS = COMP_LOOP_C_414;
      end
      COMP_LOOP_C_414 : begin
        fsm_output = 9'b110100011;
        state_var_NS = COMP_LOOP_C_415;
      end
      COMP_LOOP_C_415 : begin
        fsm_output = 9'b110100100;
        state_var_NS = COMP_LOOP_C_416;
      end
      COMP_LOOP_C_416 : begin
        fsm_output = 9'b110100101;
        state_var_NS = COMP_LOOP_C_417;
      end
      COMP_LOOP_C_417 : begin
        fsm_output = 9'b110100110;
        state_var_NS = COMP_LOOP_C_418;
      end
      COMP_LOOP_C_418 : begin
        fsm_output = 9'b110100111;
        state_var_NS = COMP_LOOP_C_419;
      end
      COMP_LOOP_C_419 : begin
        fsm_output = 9'b110101000;
        state_var_NS = COMP_LOOP_C_420;
      end
      COMP_LOOP_C_420 : begin
        fsm_output = 9'b110101001;
        state_var_NS = COMP_LOOP_C_421;
      end
      COMP_LOOP_C_421 : begin
        fsm_output = 9'b110101010;
        state_var_NS = COMP_LOOP_C_422;
      end
      COMP_LOOP_C_422 : begin
        fsm_output = 9'b110101011;
        state_var_NS = COMP_LOOP_C_423;
      end
      COMP_LOOP_C_423 : begin
        fsm_output = 9'b110101100;
        state_var_NS = COMP_LOOP_C_424;
      end
      COMP_LOOP_C_424 : begin
        fsm_output = 9'b110101101;
        state_var_NS = COMP_LOOP_C_425;
      end
      COMP_LOOP_C_425 : begin
        fsm_output = 9'b110101110;
        state_var_NS = COMP_LOOP_C_426;
      end
      COMP_LOOP_C_426 : begin
        fsm_output = 9'b110101111;
        state_var_NS = COMP_LOOP_C_427;
      end
      COMP_LOOP_C_427 : begin
        fsm_output = 9'b110110000;
        state_var_NS = COMP_LOOP_C_428;
      end
      COMP_LOOP_C_428 : begin
        fsm_output = 9'b110110001;
        state_var_NS = COMP_LOOP_C_429;
      end
      COMP_LOOP_C_429 : begin
        fsm_output = 9'b110110010;
        state_var_NS = COMP_LOOP_C_430;
      end
      COMP_LOOP_C_430 : begin
        fsm_output = 9'b110110011;
        state_var_NS = COMP_LOOP_C_431;
      end
      COMP_LOOP_C_431 : begin
        fsm_output = 9'b110110100;
        state_var_NS = COMP_LOOP_C_432;
      end
      COMP_LOOP_C_432 : begin
        fsm_output = 9'b110110101;
        state_var_NS = COMP_LOOP_C_433;
      end
      COMP_LOOP_C_433 : begin
        fsm_output = 9'b110110110;
        state_var_NS = COMP_LOOP_C_434;
      end
      COMP_LOOP_C_434 : begin
        fsm_output = 9'b110110111;
        state_var_NS = COMP_LOOP_C_435;
      end
      COMP_LOOP_C_435 : begin
        fsm_output = 9'b110111000;
        state_var_NS = COMP_LOOP_C_436;
      end
      COMP_LOOP_C_436 : begin
        fsm_output = 9'b110111001;
        state_var_NS = COMP_LOOP_C_437;
      end
      COMP_LOOP_C_437 : begin
        fsm_output = 9'b110111010;
        state_var_NS = COMP_LOOP_C_438;
      end
      COMP_LOOP_C_438 : begin
        fsm_output = 9'b110111011;
        state_var_NS = COMP_LOOP_C_439;
      end
      COMP_LOOP_C_439 : begin
        fsm_output = 9'b110111100;
        state_var_NS = COMP_LOOP_C_440;
      end
      COMP_LOOP_C_440 : begin
        fsm_output = 9'b110111101;
        state_var_NS = COMP_LOOP_C_441;
      end
      COMP_LOOP_C_441 : begin
        fsm_output = 9'b110111110;
        state_var_NS = COMP_LOOP_C_442;
      end
      COMP_LOOP_C_442 : begin
        fsm_output = 9'b110111111;
        state_var_NS = COMP_LOOP_C_443;
      end
      COMP_LOOP_C_443 : begin
        fsm_output = 9'b111000000;
        state_var_NS = COMP_LOOP_C_444;
      end
      COMP_LOOP_C_444 : begin
        fsm_output = 9'b111000001;
        state_var_NS = COMP_LOOP_C_445;
      end
      COMP_LOOP_C_445 : begin
        fsm_output = 9'b111000010;
        state_var_NS = COMP_LOOP_C_446;
      end
      COMP_LOOP_C_446 : begin
        fsm_output = 9'b111000011;
        state_var_NS = COMP_LOOP_C_447;
      end
      COMP_LOOP_C_447 : begin
        fsm_output = 9'b111000100;
        state_var_NS = COMP_LOOP_C_448;
      end
      COMP_LOOP_C_448 : begin
        fsm_output = 9'b111000101;
        state_var_NS = COMP_LOOP_C_449;
      end
      COMP_LOOP_C_449 : begin
        fsm_output = 9'b111000110;
        state_var_NS = COMP_LOOP_C_450;
      end
      COMP_LOOP_C_450 : begin
        fsm_output = 9'b111000111;
        state_var_NS = COMP_LOOP_C_451;
      end
      COMP_LOOP_C_451 : begin
        fsm_output = 9'b111001000;
        state_var_NS = COMP_LOOP_C_452;
      end
      COMP_LOOP_C_452 : begin
        fsm_output = 9'b111001001;
        state_var_NS = COMP_LOOP_C_453;
      end
      COMP_LOOP_C_453 : begin
        fsm_output = 9'b111001010;
        state_var_NS = COMP_LOOP_C_454;
      end
      COMP_LOOP_C_454 : begin
        fsm_output = 9'b111001011;
        state_var_NS = COMP_LOOP_C_455;
      end
      COMP_LOOP_C_455 : begin
        fsm_output = 9'b111001100;
        state_var_NS = COMP_LOOP_C_456;
      end
      COMP_LOOP_C_456 : begin
        fsm_output = 9'b111001101;
        state_var_NS = COMP_LOOP_C_457;
      end
      COMP_LOOP_C_457 : begin
        fsm_output = 9'b111001110;
        state_var_NS = COMP_LOOP_C_458;
      end
      COMP_LOOP_C_458 : begin
        fsm_output = 9'b111001111;
        state_var_NS = COMP_LOOP_C_459;
      end
      COMP_LOOP_C_459 : begin
        fsm_output = 9'b111010000;
        state_var_NS = COMP_LOOP_C_460;
      end
      COMP_LOOP_C_460 : begin
        fsm_output = 9'b111010001;
        state_var_NS = COMP_LOOP_C_461;
      end
      COMP_LOOP_C_461 : begin
        fsm_output = 9'b111010010;
        state_var_NS = COMP_LOOP_C_462;
      end
      COMP_LOOP_C_462 : begin
        fsm_output = 9'b111010011;
        state_var_NS = COMP_LOOP_C_463;
      end
      COMP_LOOP_C_463 : begin
        fsm_output = 9'b111010100;
        state_var_NS = COMP_LOOP_C_464;
      end
      COMP_LOOP_C_464 : begin
        fsm_output = 9'b111010101;
        state_var_NS = COMP_LOOP_C_465;
      end
      COMP_LOOP_C_465 : begin
        fsm_output = 9'b111010110;
        state_var_NS = COMP_LOOP_C_466;
      end
      COMP_LOOP_C_466 : begin
        fsm_output = 9'b111010111;
        state_var_NS = COMP_LOOP_C_467;
      end
      COMP_LOOP_C_467 : begin
        fsm_output = 9'b111011000;
        if ( COMP_LOOP_C_467_tr0 ) begin
          state_var_NS = COPY_LOOP_1_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      COPY_LOOP_1_C_0 : begin
        fsm_output = 9'b111011001;
        state_var_NS = COPY_LOOP_1_C_1;
      end
      COPY_LOOP_1_C_1 : begin
        fsm_output = 9'b111011010;
        state_var_NS = COPY_LOOP_1_C_2;
      end
      COPY_LOOP_1_C_2 : begin
        fsm_output = 9'b111011011;
        if ( COPY_LOOP_1_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COPY_LOOP_1_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 9'b111011100;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 9'b111011101;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 9'b000000000;
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
  xt_rsc_0_0_cgo_iro, xt_rsc_0_0_i_clken_d, xt_rsc_0_2_cgo_iro, xt_rsc_0_2_i_clken_d,
      xt_rsc_0_4_cgo_iro, xt_rsc_0_4_i_clken_d, xt_rsc_0_6_cgo_iro, xt_rsc_0_6_i_clken_d,
      xt_rsc_0_0_cgo, xt_rsc_0_2_cgo, xt_rsc_0_4_cgo, xt_rsc_0_6_cgo
);
  input xt_rsc_0_0_cgo_iro;
  output xt_rsc_0_0_i_clken_d;
  input xt_rsc_0_2_cgo_iro;
  output xt_rsc_0_2_i_clken_d;
  input xt_rsc_0_4_cgo_iro;
  output xt_rsc_0_4_i_clken_d;
  input xt_rsc_0_6_cgo_iro;
  output xt_rsc_0_6_i_clken_d;
  input xt_rsc_0_0_cgo;
  input xt_rsc_0_2_cgo;
  input xt_rsc_0_4_cgo;
  input xt_rsc_0_6_cgo;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_0_i_clken_d = xt_rsc_0_0_cgo | xt_rsc_0_0_cgo_iro;
  assign xt_rsc_0_2_i_clken_d = xt_rsc_0_2_cgo | xt_rsc_0_2_cgo_iro;
  assign xt_rsc_0_4_i_clken_d = xt_rsc_0_4_cgo | xt_rsc_0_4_cgo_iro;
  assign xt_rsc_0_6_i_clken_d = xt_rsc_0_6_cgo | xt_rsc_0_6_cgo_iro;
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
      xt_rsc_0_0_i_clken_d, xt_rsc_0_0_i_q_d, xt_rsc_0_1_i_q_d, xt_rsc_0_2_i_clken_d,
      xt_rsc_0_2_i_q_d, xt_rsc_0_3_i_q_d, xt_rsc_0_4_i_clken_d, xt_rsc_0_4_i_q_d,
      xt_rsc_0_5_i_q_d, xt_rsc_0_6_i_clken_d, xt_rsc_0_6_i_q_d, xt_rsc_0_7_i_q_d,
      vec_rsc_0_0_i_q_d, vec_rsc_0_2_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_6_i_q_d,
      result_rsc_0_0_i_d_d, result_rsc_0_0_i_q_d, result_rsc_0_0_i_wadr_d, result_rsc_0_1_i_d_d,
      result_rsc_0_1_i_wadr_d, result_rsc_0_2_i_d_d, result_rsc_0_2_i_q_d, result_rsc_0_2_i_wadr_d,
      result_rsc_0_3_i_d_d, result_rsc_0_3_i_wadr_d, result_rsc_0_4_i_d_d, result_rsc_0_4_i_q_d,
      result_rsc_0_4_i_wadr_d, result_rsc_0_5_i_d_d, result_rsc_0_5_i_wadr_d, result_rsc_0_6_i_d_d,
      result_rsc_0_6_i_q_d, result_rsc_0_6_i_wadr_d, result_rsc_0_7_i_d_d, result_rsc_0_7_i_wadr_d,
      twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_0_i_radr_d, twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_1_i_radr_d, twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_2_i_radr_d, twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_3_i_radr_d, twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_4_i_radr_d, twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_5_i_q_d, twiddle_rsc_0_5_i_radr_d, twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_6_i_radr_d, twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_7_i_q_d, twiddle_rsc_0_7_i_radr_d, twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_0_i_d_d_pff, xt_rsc_0_0_i_radr_d_pff, xt_rsc_0_0_i_wadr_d_pff, xt_rsc_0_0_i_we_d_pff,
      xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff, xt_rsc_0_1_i_d_d_pff, xt_rsc_0_2_i_we_d_pff,
      xt_rsc_0_4_i_we_d_pff, xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      xt_rsc_0_6_i_we_d_pff, vec_rsc_0_0_i_radr_d_pff, vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      result_rsc_0_0_i_radr_d_pff, result_rsc_0_0_i_we_d_pff, result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      result_rsc_0_1_i_we_d_pff, result_rsc_0_2_i_we_d_pff, result_rsc_0_3_i_we_d_pff,
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
  input [127:0] xt_rsc_0_1_i_q_d;
  output xt_rsc_0_2_i_clken_d;
  input [127:0] xt_rsc_0_2_i_q_d;
  input [127:0] xt_rsc_0_3_i_q_d;
  output xt_rsc_0_4_i_clken_d;
  input [127:0] xt_rsc_0_4_i_q_d;
  input [127:0] xt_rsc_0_5_i_q_d;
  output xt_rsc_0_6_i_clken_d;
  input [127:0] xt_rsc_0_6_i_q_d;
  input [127:0] xt_rsc_0_7_i_q_d;
  input [63:0] vec_rsc_0_0_i_q_d;
  input [63:0] vec_rsc_0_2_i_q_d;
  input [63:0] vec_rsc_0_4_i_q_d;
  input [63:0] vec_rsc_0_6_i_q_d;
  output [63:0] result_rsc_0_0_i_d_d;
  input [63:0] result_rsc_0_0_i_q_d;
  output [8:0] result_rsc_0_0_i_wadr_d;
  output [63:0] result_rsc_0_1_i_d_d;
  output [8:0] result_rsc_0_1_i_wadr_d;
  output [63:0] result_rsc_0_2_i_d_d;
  input [63:0] result_rsc_0_2_i_q_d;
  output [8:0] result_rsc_0_2_i_wadr_d;
  output [63:0] result_rsc_0_3_i_d_d;
  output [8:0] result_rsc_0_3_i_wadr_d;
  output [63:0] result_rsc_0_4_i_d_d;
  input [63:0] result_rsc_0_4_i_q_d;
  output [8:0] result_rsc_0_4_i_wadr_d;
  output [63:0] result_rsc_0_5_i_d_d;
  output [8:0] result_rsc_0_5_i_wadr_d;
  output [63:0] result_rsc_0_6_i_d_d;
  input [63:0] result_rsc_0_6_i_q_d;
  output [8:0] result_rsc_0_6_i_wadr_d;
  output [63:0] result_rsc_0_7_i_d_d;
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
  output [127:0] xt_rsc_0_0_i_d_d_pff;
  output [6:0] xt_rsc_0_0_i_radr_d_pff;
  output [6:0] xt_rsc_0_0_i_wadr_d_pff;
  output xt_rsc_0_0_i_we_d_pff;
  output xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output [127:0] xt_rsc_0_1_i_d_d_pff;
  output xt_rsc_0_2_i_we_d_pff;
  output xt_rsc_0_4_i_we_d_pff;
  output xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output xt_rsc_0_6_i_we_d_pff;
  output [8:0] vec_rsc_0_0_i_radr_d_pff;
  output vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output [8:0] result_rsc_0_0_i_radr_d_pff;
  output result_rsc_0_0_i_we_d_pff;
  output result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output result_rsc_0_1_i_we_d_pff;
  output result_rsc_0_2_i_we_d_pff;
  output result_rsc_0_3_i_we_d_pff;
  output result_rsc_0_4_i_we_d_pff;
  output result_rsc_0_5_i_we_d_pff;
  output result_rsc_0_6_i_we_d_pff;
  output result_rsc_0_7_i_we_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  wire [64:0] COMP_LOOP_1_f2_rem_1_cmp_z;
  wire [63:0] COMP_LOOP_1_f2_rem_cmp_z;
  wire [8:0] fsm_output;
  wire and_dcpl_9;
  wire and_dcpl_11;
  wire and_dcpl_12;
  wire and_dcpl_14;
  wire and_dcpl_15;
  wire and_dcpl_16;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire mux_tmp_11;
  wire and_dcpl_20;
  wire and_dcpl_21;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_27;
  wire and_dcpl_29;
  wire and_dcpl_31;
  wire nor_tmp_12;
  wire and_dcpl_35;
  wire or_tmp_25;
  wire mux_tmp_18;
  wire and_dcpl_46;
  wire and_dcpl_47;
  wire and_dcpl_48;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_53;
  wire and_dcpl_54;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire and_dcpl_63;
  wire and_dcpl_64;
  wire and_dcpl_69;
  wire and_dcpl_70;
  wire and_dcpl_74;
  wire and_dcpl_79;
  wire and_dcpl_80;
  wire and_dcpl_81;
  wire and_dcpl_89;
  wire and_dcpl_96;
  wire and_dcpl_101;
  wire and_dcpl_102;
  wire and_dcpl_107;
  wire and_dcpl_108;
  wire and_dcpl_109;
  wire and_dcpl_112;
  wire and_dcpl_115;
  wire and_dcpl_116;
  wire and_dcpl_119;
  wire and_dcpl_121;
  wire and_dcpl_136;
  wire and_dcpl_138;
  wire or_tmp_69;
  wire or_tmp_70;
  wire or_tmp_73;
  wire and_dcpl_139;
  wire and_dcpl_140;
  wire or_tmp_82;
  wire mux_tmp_56;
  wire or_tmp_86;
  wire or_tmp_87;
  wire nor_tmp_26;
  wire and_dcpl_143;
  wire and_dcpl_144;
  wire and_dcpl_146;
  wire and_dcpl_147;
  wire mux_tmp_63;
  wire mux_tmp_67;
  wire mux_tmp_68;
  wire or_tmp_107;
  wire mux_tmp_80;
  wire and_dcpl_176;
  wire and_dcpl_179;
  wire and_dcpl_186;
  wire not_tmp_87;
  wire or_tmp_127;
  wire or_dcpl_14;
  wire or_dcpl_15;
  wire or_dcpl_19;
  wire or_dcpl_20;
  wire or_dcpl_21;
  wire and_dcpl_210;
  wire and_dcpl_212;
  wire and_dcpl_215;
  wire and_dcpl_224;
  wire and_dcpl_228;
  wire and_dcpl_232;
  wire and_dcpl_236;
  wire and_dcpl_237;
  wire and_dcpl_242;
  wire and_dcpl_244;
  wire or_dcpl_41;
  wire or_dcpl_44;
  wire or_dcpl_46;
  wire or_dcpl_48;
  wire or_dcpl_50;
  wire or_dcpl_52;
  reg [8:0] COPY_LOOP_1_i_12_3_sva_8_0;
  reg [7:0] COMP_LOOP_r_10_3_sva;
  reg [8:0] COPY_LOOP_i_12_3_sva_8_0;
  reg [9:0] COPY_LOOP_1_i_12_3_sva_1;
  wire and_208_tmp;
  wire and_210_tmp;
  wire and_150_ssc;
  wire and_151_ssc;
  wire and_154_ssc;
  wire and_156_ssc;
  wire nor_131_ssc;
  wire and_158_ssc;
  wire and_159_ssc;
  wire and_161_ssc;
  wire mux_107_ssc;
  wire and_163_ssc;
  wire and_164_ssc;
  wire and_166_ssc;
  wire and_169_ssc;
  wire and_172_ssc;
  wire and_174_ssc;
  wire and_176_ssc;
  reg [62:0] reg_COMP_LOOP_1_f2_rem_cmp_a_ftd;
  reg [64:0] reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1;
  reg reg_xt_rsc_0_0_cgo_cse;
  reg reg_xt_rsc_0_2_cgo_cse;
  reg reg_xt_rsc_0_4_cgo_cse;
  reg reg_xt_rsc_0_6_cgo_cse;
  reg reg_vec_rsc_triosy_0_6_obj_ld_cse;
  wire and_280_cse;
  reg [63:0] reg_COMP_LOOP_1_f2_rem_1_cmp_b_63_0_cse;
  wire or_78_cse;
  wire COMP_LOOP_f2_or_9_cse;
  wire nor_112_cse;
  wire mux_41_cse;
  wire or_259_cse;
  wire nor_118_cse;
  wire nor_122_cse;
  wire nor_121_cse;
  wire or_234_cse;
  wire or_82_cse;
  wire or_245_cse;
  wire mux_53_cse;
  wire nor_128_rmff;
  wire nor_127_rmff;
  wire nor_126_rmff;
  wire nor_125_rmff;
  wire [7:0] COMP_LOOP_1_f2_and_rmff;
  wire [8:0] STAGE_LOOP_base_lshift_itm;
  wire and_dcpl_254;
  wire and_dcpl_255;
  wire and_dcpl_260;
  wire and_dcpl_262;
  wire and_dcpl_270;
  wire and_dcpl_272;
  wire and_dcpl_275;
  wire and_dcpl_282;
  wire and_dcpl_285;
  wire and_dcpl_287;
  wire and_dcpl_295;
  wire and_dcpl_299;
  wire [64:0] z_out;
  wire [64:0] z_out_1;
  wire [65:0] nl_z_out_1;
  wire and_dcpl_342;
  wire and_dcpl_346;
  wire and_dcpl_347;
  wire and_dcpl_349;
  wire and_dcpl_350;
  wire and_dcpl_353;
  wire and_dcpl_355;
  wire and_dcpl_356;
  wire and_dcpl_357;
  wire and_dcpl_360;
  wire [127:0] z_out_2;
  wire and_dcpl_374;
  wire [127:0] z_out_3;
  reg [63:0] p_sva;
  reg [3:0] STAGE_LOOP_base_acc_cse_sva;
  reg [63:0] tmp_63_0_lpi_3_dfm;
  reg [63:0] tmp_2_127_64_lpi_3_dfm;
  reg [63:0] tmp_4_63_0_lpi_3_dfm;
  reg [63:0] tmp_6_127_64_lpi_3_dfm;
  reg [63:0] tmp_8_63_0_lpi_3_dfm;
  reg [63:0] tmp_14_127_64_lpi_3_dfm;
  reg [127:0] COMP_LOOP_8_f2_mul_mut;
  reg [127:0] COMP_LOOP_1_f2_mul_itm;
  reg [63:0] COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_1_3_63_0_itm;
  reg [127:0] COMP_LOOP_2_f2_mul_itm;
  reg [63:0] COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_2_5_63_0_itm;
  reg [127:0] COMP_LOOP_3_f2_mul_itm;
  reg [63:0] COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_3_7_63_0_itm;
  reg [127:0] COMP_LOOP_4_f2_mul_itm;
  reg [63:0] COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_4_9_63_0_itm;
  reg [127:0] COMP_LOOP_5_f2_mul_itm;
  reg [63:0] COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_5_11_63_0_itm;
  reg [127:0] COMP_LOOP_6_f2_mul_itm;
  reg [63:0] COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_6_13_63_0_itm;
  reg [127:0] COMP_LOOP_7_f2_mul_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_nor_5_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_and_17_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_and_19_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_and_20_itm;
  reg COMP_LOOP_f2_COMP_LOOP_f2_and_21_itm;
  reg [63:0] COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_15_63_0_itm;
  wire COPY_LOOP_1_i_12_3_sva_8_0_mx0c2;
  wire [64:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_2_rgt;
  wire [64:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_3_rgt;
  wire [64:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_4_rgt;
  wire [64:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_5_rgt;
  wire or_tmp_209;
  wire [64:0] COMP_LOOP_f2_mux1h_21_rgt;
  wire [64:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_6_rgt;
  wire [64:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_7_rgt;
  wire nor_tmp_73;
  wire [64:0] COPY_LOOP_1_i_COPY_LOOP_1_i_mux_rgt;
  wire or_tmp_253;
  wire [64:0] COPY_LOOP_1_i_mux1h_4_rgt;
  reg COMP_LOOP_1_f2_acc_itm_64;
  reg [63:0] COMP_LOOP_1_f2_acc_itm_63_0;
  reg COMP_LOOP_2_f2_acc_itm_64;
  reg [63:0] COMP_LOOP_2_f2_acc_itm_63_0;
  reg COMP_LOOP_3_f2_acc_itm_64;
  reg [63:0] COMP_LOOP_3_f2_acc_itm_63_0;
  reg COPY_LOOP_1_i_acc_10_itm_64;
  reg [63:0] COPY_LOOP_1_i_acc_10_itm_63_0;
  reg COMP_LOOP_4_f2_acc_itm_64;
  reg [63:0] COMP_LOOP_4_f2_acc_itm_63_0;
  reg COMP_LOOP_5_f2_acc_itm_64;
  reg [63:0] COMP_LOOP_5_f2_acc_itm_63_0;
  reg COPY_LOOP_1_i_acc_12_itm_64;
  reg [63:0] COPY_LOOP_1_i_acc_12_itm_63_0;
  reg COMP_LOOP_6_f2_acc_itm_64;
  reg [63:0] COMP_LOOP_6_f2_acc_itm_63_0;
  reg COMP_LOOP_8_f2_acc_itm_64;
  reg [63:0] COMP_LOOP_8_f2_acc_itm_63_0;
  wire COPY_LOOP_1_i_or_6_ssc;
  wire and_142_ssc;
  wire and_143_ssc;
  reg reg_COMP_LOOP_1_f2_rem_1_cmp_a_ftd;
  reg [63:0] reg_COMP_LOOP_1_f2_rem_1_cmp_a_ftd_1;
  wire nor_120_cse_1;
  wire nand_44_cse;
  wire and_254_cse_1;
  wire COMP_LOOP_f2_nor_2_cse;
  wire nor_200_cse;
  wire nor_220_cse;
  wire nor_221_cse;
  wire and_507_cse;
  wire or_364_cse;
  wire and_505_cse;
  wire nor_226_cse;
  wire nor_218_cse;
  wire mux_35_cse;
  wire mux_83_itm;
  wire COMP_LOOP_f2_nor_14_itm;
  wire COMP_LOOP_f2_or_18_itm;

  wire[0:0] and_303_nl;
  wire[8:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_14_nl;
  wire[0:0] not_528_nl;
  wire[0:0] mux_36_nl;
  wire[0:0] nor_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] or_269_nl;
  wire[0:0] or_268_nl;
  wire[0:0] mux_44_nl;
  wire[0:0] nand_27_nl;
  wire[0:0] mux_43_nl;
  wire[0:0] mux_42_nl;
  wire[0:0] nor_113_nl;
  wire[0:0] and_297_nl;
  wire[0:0] or_19_nl;
  wire[0:0] mux_51_nl;
  wire[0:0] nand_26_nl;
  wire[0:0] mux_50_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] and_292_nl;
  wire[0:0] and_293_nl;
  wire[0:0] or_29_nl;
  wire[0:0] or_256_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] nand_25_nl;
  wire[0:0] mux_55_nl;
  wire[0:0] and_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] and_311_nl;
  wire[0:0] nor_15_nl;
  wire[0:0] mux_62_nl;
  wire[0:0] nand_24_nl;
  wire[0:0] mux_61_nl;
  wire[0:0] and_287_nl;
  wire[0:0] mux_60_nl;
  wire[0:0] and_288_nl;
  wire[0:0] and_289_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] or_81_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] mux_80_nl;
  wire[0:0] or_80_nl;
  wire[0:0] or_77_nl;
  wire[0:0] mux_79_nl;
  wire[0:0] or_76_nl;
  wire[0:0] nand_17_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] mux_76_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] or_73_nl;
  wire[0:0] mux_74_nl;
  wire[0:0] mux_73_nl;
  wire[0:0] mux_72_nl;
  wire[0:0] or_69_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] mux_90_nl;
  wire[0:0] mux_89_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] or_86_nl;
  wire[0:0] nor_66_nl;
  wire[0:0] COMP_LOOP_f2_not_48_nl;
  wire[8:0] COPY_LOOP_1_i_mux_nl;
  wire[0:0] not_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_15_nl;
  wire[0:0] and_204_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] nor_222_nl;
  wire[0:0] nor_223_nl;
  wire[0:0] nor_224_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] or_362_nl;
  wire[0:0] or_363_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_16_nl;
  wire[0:0] and_185_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] mux_169_nl;
  wire[0:0] nor_215_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] nor_216_nl;
  wire[0:0] nor_217_nl;
  wire[0:0] and_506_nl;
  wire[0:0] mux_171_nl;
  wire[0:0] nor_212_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux_17_nl;
  wire[0:0] and_197_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] nor_208_nl;
  wire[0:0] nor_209_nl;
  wire[0:0] nor_210_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] nor_206_nl;
  wire[0:0] nor_207_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux1h_2_nl;
  wire[0:0] COMP_LOOP_f2_COMP_LOOP_f2_nor_8_nl;
  wire[0:0] COMP_LOOP_f2_and_14_nl;
  wire[0:0] COMP_LOOP_f2_and_15_nl;
  wire[0:0] COMP_LOOP_f2_and_16_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] nor_202_nl;
  wire[0:0] nor_203_nl;
  wire[0:0] nor_204_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] nor_198_nl;
  wire[0:0] nor_199_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux1h_1_nl;
  wire[0:0] COMP_LOOP_f2_COMP_LOOP_f2_nor_nl;
  wire[0:0] COMP_LOOP_f2_and_10_nl;
  wire[0:0] COMP_LOOP_f2_and_11_nl;
  wire[0:0] COMP_LOOP_f2_and_12_nl;
  wire[0:0] and_242_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] or_305_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] or_301_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] nor_195_nl;
  wire[0:0] nor_196_nl;
  wire[0:0] nor_197_nl;
  wire[63:0] COMP_LOOP_f2_mux1h_15_nl;
  wire[0:0] COMP_LOOP_f2_and_4_nl;
  wire[0:0] COMP_LOOP_f2_COMP_LOOP_f2_and_15_nl;
  wire[0:0] COMP_LOOP_f2_COMP_LOOP_f2_and_16_nl;
  wire[0:0] COMP_LOOP_f2_and_5_nl;
  wire[0:0] COMP_LOOP_f2_COMP_LOOP_f2_and_18_nl;
  wire[0:0] COMP_LOOP_f2_and_6_nl;
  wire[0:0] COMP_LOOP_f2_and_7_nl;
  wire[0:0] COMP_LOOP_f2_and_8_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] nor_194_nl;
  wire[0:0] and_501_nl;
  wire[0:0] and_502_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] and_503_nl;
  wire[0:0] or_311_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] and_499_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] nor_184_nl;
  wire[0:0] nor_186_nl;
  wire[0:0] nor_188_nl;
  wire[0:0] nor_191_nl;
  wire[63:0] COMP_LOOP_f2_COMP_LOOP_f2_mux1h_nl;
  wire[0:0] COMP_LOOP_f2_COMP_LOOP_f2_nor_9_nl;
  wire[0:0] COMP_LOOP_f2_and_1_nl;
  wire[0:0] COMP_LOOP_f2_and_2_nl;
  wire[0:0] COMP_LOOP_f2_and_3_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] nor_179_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] nor_181_nl;
  wire[0:0] COPY_LOOP_1_i_or_5_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] nor_172_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] nor_173_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] nor_174_nl;
  wire[0:0] nor_175_nl;
  wire[0:0] nor_176_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] or_330_nl;
  wire[0:0] or_328_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] or_358_nl;
  wire[0:0] or_359_nl;
  wire[0:0] or_360_nl;
  wire[0:0] nand_42_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] nor_169_nl;
  wire[0:0] and_496_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] nor_170_nl;
  wire[0:0] nor_171_nl;
  wire[0:0] and_250_nl;
  wire[0:0] COPY_LOOP_1_i_or_4_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] or_350_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] nand_40_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] nand_41_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] or_357_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] or_355_nl;
  wire[0:0] or_354_nl;
  wire[0:0] nand_39_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] and_494_nl;
  wire[0:0] nor_166_nl;
  wire[0:0] or_260_nl;
  wire[0:0] and_299_nl;
  wire[0:0] or_109_nl;
  wire[0:0] mux_92_nl;
  wire[0:0] mux_93_nl;
  wire[0:0] and_276_nl;
  wire[0:0] nor_77_nl;
  wire[0:0] mux_94_nl;
  wire[0:0] nand_16_nl;
  wire[0:0] mux_99_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] mux_97_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] or_261_nl;
  wire[0:0] nand_32_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] nand_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] mux_102_nl;
  wire[0:0] and_270_nl;
  wire[0:0] nor_73_nl;
  wire[0:0] mux_106_nl;
  wire[0:0] mux_105_nl;
  wire[0:0] mux_104_nl;
  wire[0:0] and_269_nl;
  wire[0:0] nor_70_nl;
  wire[0:0] nor_71_nl;
  wire[0:0] mux_110_nl;
  wire[0:0] mux_109_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] mux_111_nl;
  wire[0:0] and_265_nl;
  wire[0:0] nor_68_nl;
  wire[0:0] mux_115_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] mux_117_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] nand_15_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] or_119_nl;
  wire[62:0] COMP_LOOP_f2_mux1h_4_nl;
  wire[0:0] COMP_LOOP_f2_nor_12_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] or_233_nl;
  wire[63:0] COMP_LOOP_f2_mux_2_nl;
  wire[63:0] COMP_LOOP_f2_mux_60_nl;
  wire[0:0] mux_45_nl;
  wire[0:0] nor_110_nl;
  wire[0:0] nor_111_nl;
  wire[0:0] mux_47_nl;
  wire[63:0] COMP_LOOP_f2_mux_6_nl;
  wire[63:0] COMP_LOOP_f2_mux_61_nl;
  wire[0:0] mux_52_nl;
  wire[0:0] nor_105_nl;
  wire[0:0] nor_106_nl;
  wire[0:0] mux_57_nl;
  wire[0:0] nor_97_nl;
  wire[0:0] nor_98_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] nor_92_nl;
  wire[0:0] and_285_nl;
  wire[0:0] mux_64_nl;
  wire[0:0] nor_90_nl;
  wire[0:0] nor_91_nl;
  wire[0:0] mux_65_nl;
  wire[0:0] or_265_nl;
  wire[0:0] or_266_nl;
  wire[0:0] mux_66_nl;
  wire[0:0] or_262_nl;
  wire[0:0] or_263_nl;
  wire[0:0] mux_67_nl;
  wire[0:0] nor_84_nl;
  wire[0:0] nor_85_nl;
  wire[0:0] mux_68_nl;
  wire[0:0] and_284_nl;
  wire[0:0] nor_83_nl;
  wire[0:0] mux_69_nl;
  wire[0:0] and_283_nl;
  wire[0:0] mux_70_nl;
  wire[0:0] nor_81_nl;
  wire[0:0] and_282_nl;
  wire[0:0] mux_71_nl;
  wire[0:0] nand_34_nl;
  wire[0:0] or_264_nl;
  wire[65:0] acc_nl;
  wire[66:0] nl_acc_nl;
  wire[0:0] COMP_LOOP_f2_COMP_LOOP_f2_or_1_nl;
  wire[54:0] COMP_LOOP_f2_or_24_nl;
  wire[54:0] COMP_LOOP_f2_and_18_nl;
  wire[54:0] COMP_LOOP_f2_mux1h_42_nl;
  wire[8:0] COMP_LOOP_f2_or_25_nl;
  wire[8:0] COMP_LOOP_f2_mux1h_43_nl;
  wire[0:0] COMP_LOOP_f2_or_26_nl;
  wire[63:0] COMP_LOOP_f2_mux1h_44_nl;
  wire[0:0] COMP_LOOP_f2_or_27_nl;
  wire[0:0] COMP_LOOP_f2_or_28_nl;
  wire[63:0] COMP_LOOP_f2_mux1h_45_nl;
  wire[0:0] and_510_nl;
  wire[0:0] and_512_nl;
  wire[0:0] and_513_nl;
  wire[63:0] COMP_LOOP_f2_mux1h_46_nl;
  wire[63:0] COMP_LOOP_f2_mux1h_47_nl;
  wire[63:0] COMP_LOOP_f2_mux_64_nl;
  wire[63:0] COMP_LOOP_f2_mux_65_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [64:0] nl_COMP_LOOP_1_f2_rem_1_cmp_a;
  assign nl_COMP_LOOP_1_f2_rem_1_cmp_a = {reg_COMP_LOOP_1_f2_rem_1_cmp_a_ftd , reg_COMP_LOOP_1_f2_rem_1_cmp_a_ftd_1};
  wire [64:0] nl_COMP_LOOP_1_f2_rem_1_cmp_b;
  assign nl_COMP_LOOP_1_f2_rem_1_cmp_b = {1'b0, reg_COMP_LOOP_1_f2_rem_1_cmp_b_63_0_cse};
  wire [127:0] nl_COMP_LOOP_1_f2_rem_cmp_a;
  assign nl_COMP_LOOP_1_f2_rem_cmp_a = {reg_COMP_LOOP_1_f2_rem_cmp_a_ftd , reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1};
  wire [63:0] nl_COMP_LOOP_1_f2_rem_cmp_b;
  assign nl_COMP_LOOP_1_f2_rem_cmp_b = reg_COMP_LOOP_1_f2_rem_1_cmp_b_63_0_cse;
  wire [3:0] nl_STAGE_LOOP_base_lshift_rg_s;
  assign nl_STAGE_LOOP_base_lshift_rg_s = z_out[3:0];
  wire [0:0] nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0;
  assign nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0 = COPY_LOOP_1_i_12_3_sva_1[9];
  wire [0:0] nl_peaceNTT_core_core_fsm_inst_COMP_LOOP_C_467_tr0;
  assign nl_peaceNTT_core_core_fsm_inst_COMP_LOOP_C_467_tr0 = COPY_LOOP_1_i_12_3_sva_8_0[8];
  wire [0:0] nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0;
  assign nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0 = COPY_LOOP_1_i_12_3_sva_1[9];
  wire [0:0] nl_peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = z_out[4];
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
  .signd(32'sd1)) COMP_LOOP_1_f2_rem_1_cmp (
      .a(nl_COMP_LOOP_1_f2_rem_1_cmp_a[64:0]),
      .b(nl_COMP_LOOP_1_f2_rem_1_cmp_b[64:0]),
      .z(COMP_LOOP_1_f2_rem_1_cmp_z)
    );
  mgc_rem #(.width_a(32'sd128),
  .width_b(32'sd64),
  .signd(32'sd0)) COMP_LOOP_1_f2_rem_cmp (
      .a(nl_COMP_LOOP_1_f2_rem_cmp_a[127:0]),
      .b(nl_COMP_LOOP_1_f2_rem_cmp_b[63:0]),
      .z(COMP_LOOP_1_f2_rem_cmp_z)
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
      .xt_rsc_0_0_cgo_iro(nor_128_rmff),
      .xt_rsc_0_0_i_clken_d(xt_rsc_0_0_i_clken_d),
      .xt_rsc_0_2_cgo_iro(nor_127_rmff),
      .xt_rsc_0_2_i_clken_d(xt_rsc_0_2_i_clken_d),
      .xt_rsc_0_4_cgo_iro(nor_126_rmff),
      .xt_rsc_0_4_i_clken_d(xt_rsc_0_4_i_clken_d),
      .xt_rsc_0_6_cgo_iro(nor_125_rmff),
      .xt_rsc_0_6_i_clken_d(xt_rsc_0_6_i_clken_d),
      .xt_rsc_0_0_cgo(reg_xt_rsc_0_0_cgo_cse),
      .xt_rsc_0_2_cgo(reg_xt_rsc_0_2_cgo_cse),
      .xt_rsc_0_4_cgo(reg_xt_rsc_0_4_cgo_cse),
      .xt_rsc_0_6_cgo(reg_xt_rsc_0_6_cgo_cse)
    );
  peaceNTT_core_core_fsm peaceNTT_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .COPY_LOOP_C_2_tr0(nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0[0:0]),
      .COMP_LOOP_C_467_tr0(nl_peaceNTT_core_core_fsm_inst_COMP_LOOP_C_467_tr0[0:0]),
      .COPY_LOOP_1_C_2_tr0(nl_peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign nor_122_cse = ~((fsm_output[3]) | (fsm_output[6]));
  assign nor_120_cse_1 = ~((fsm_output[8:7]!=2'b00));
  assign nor_121_cse = ~((fsm_output[5:4]!=2'b00));
  assign and_507_cse = (fsm_output[5]) & (fsm_output[7]) & (fsm_output[8]);
  assign or_364_cse = (fsm_output[2:0]!=3'b000);
  assign and_303_nl = ((or_364_cse & (fsm_output[4])) | (fsm_output[5])) & (fsm_output[8:7]==2'b11);
  assign mux_35_cse = MUX_s_1_2_2(and_507_cse, and_303_nl, fsm_output[3]);
  assign nor_118_cse = ~((fsm_output[3]) | (fsm_output[2]) | (fsm_output[0]) | (fsm_output[1])
      | (fsm_output[4]) | (fsm_output[5]) | (fsm_output[8]) | (fsm_output[7]));
  assign nor_113_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[6])) | (~ (fsm_output[7]))
      | (~ (fsm_output[8])) | (COPY_LOOP_1_i_12_3_sva_8_0[1:0]!=2'b00));
  assign mux_42_nl = MUX_s_1_2_2(nor_112_cse, nor_113_nl, fsm_output[3]);
  assign and_297_nl = (fsm_output[3]) & (fsm_output[4]) & (fsm_output[6]) & (fsm_output[7])
      & (fsm_output[8]) & (COPY_LOOP_1_i_12_3_sva_8_0[1:0]==2'b00);
  assign or_19_nl = (COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b00);
  assign mux_43_nl = MUX_s_1_2_2(mux_42_nl, and_297_nl, or_19_nl);
  assign nand_27_nl = ~((fsm_output[1]) & mux_43_nl);
  assign mux_44_nl = MUX_s_1_2_2(nand_27_nl, mux_41_cse, fsm_output[2]);
  assign nor_128_rmff = ~(mux_44_nl | (fsm_output[5]));
  assign and_292_nl = (fsm_output[4]) & (fsm_output[6]) & (fsm_output[7]) & (fsm_output[8])
      & (COPY_LOOP_1_i_12_3_sva_8_0[1:0]==2'b01);
  assign mux_49_nl = MUX_s_1_2_2(nor_112_cse, and_292_nl, fsm_output[3]);
  assign and_293_nl = (fsm_output[3]) & (fsm_output[4]) & (fsm_output[6]) & (fsm_output[7])
      & (fsm_output[8]) & (COPY_LOOP_1_i_12_3_sva_8_0[1:0]==2'b01);
  assign or_29_nl = (COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b01);
  assign mux_50_nl = MUX_s_1_2_2(mux_49_nl, and_293_nl, or_29_nl);
  assign nand_26_nl = ~((fsm_output[1]) & mux_50_nl);
  assign mux_51_nl = MUX_s_1_2_2(nand_26_nl, mux_41_cse, fsm_output[2]);
  assign nor_127_rmff = ~(mux_51_nl | (fsm_output[5]));
  assign or_256_nl = (~((~ (fsm_output[0])) | (COMP_LOOP_r_10_3_sva[0]))) | (fsm_output[3])
      | (fsm_output[4]) | (fsm_output[6]) | (fsm_output[7]) | (fsm_output[8]);
  assign mux_53_cse = MUX_s_1_2_2(or_259_cse, or_256_nl, fsm_output[1]);
  assign and_nl = (fsm_output[3]) & (fsm_output[4]) & (fsm_output[6]) & (fsm_output[7])
      & (fsm_output[8]) & (COPY_LOOP_1_i_12_3_sva_8_0[1:0]==2'b10);
  assign and_311_nl = (fsm_output[4]) & (fsm_output[6]) & (fsm_output[7]) & (fsm_output[8])
      & (COPY_LOOP_1_i_12_3_sva_8_0[1:0]==2'b10);
  assign mux_54_nl = MUX_s_1_2_2(nor_112_cse, and_311_nl, fsm_output[3]);
  assign nor_15_nl = ~((COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b10));
  assign mux_55_nl = MUX_s_1_2_2(and_nl, mux_54_nl, nor_15_nl);
  assign nand_25_nl = ~((fsm_output[1]) & mux_55_nl);
  assign mux_56_nl = MUX_s_1_2_2(nand_25_nl, mux_53_cse, fsm_output[2]);
  assign nor_126_rmff = ~(mux_56_nl | (fsm_output[5]));
  assign and_287_nl = (fsm_output[3]) & (fsm_output[4]) & (fsm_output[6]) & (fsm_output[7])
      & (fsm_output[8]) & (COPY_LOOP_1_i_12_3_sva_8_0[1:0]==2'b11);
  assign and_288_nl = (fsm_output[4]) & (fsm_output[6]) & (fsm_output[7]) & (fsm_output[8])
      & (COPY_LOOP_1_i_12_3_sva_8_0[1:0]==2'b11);
  assign mux_60_nl = MUX_s_1_2_2(nor_112_cse, and_288_nl, fsm_output[3]);
  assign and_289_nl = (COPY_LOOP_i_12_3_sva_8_0[1:0]==2'b11);
  assign mux_61_nl = MUX_s_1_2_2(and_287_nl, mux_60_nl, and_289_nl);
  assign nand_24_nl = ~((fsm_output[1]) & mux_61_nl);
  assign mux_62_nl = MUX_s_1_2_2(nand_24_nl, mux_53_cse, fsm_output[2]);
  assign nor_125_rmff = ~(mux_62_nl | (fsm_output[5]));
  assign COMP_LOOP_1_f2_and_rmff = COMP_LOOP_r_10_3_sva & ({2'b11 , (COPY_LOOP_i_12_3_sva_8_0[8:3])});
  assign and_280_cse = (fsm_output[2:1]==2'b11);
  assign or_78_cse = (fsm_output[1:0]!=2'b00);
  assign or_82_cse = (fsm_output[3:1]!=3'b000);
  assign COPY_LOOP_1_i_or_6_ssc = and_dcpl_138 | and_dcpl_146;
  assign or_80_nl = (fsm_output[2]) | (fsm_output[5]) | (~ (fsm_output[8]));
  assign mux_80_nl = MUX_s_1_2_2(or_80_nl, or_tmp_73, or_78_cse);
  assign or_77_nl = and_280_cse | (~ (fsm_output[5])) | (fsm_output[8]);
  assign mux_81_nl = MUX_s_1_2_2(mux_80_nl, or_77_nl, fsm_output[4]);
  assign or_81_nl = (fsm_output[6]) | mux_81_nl;
  assign or_76_nl = (fsm_output[4]) | (~ (fsm_output[5])) | (fsm_output[8]);
  assign nand_17_nl = ~((fsm_output[4]) & (fsm_output[1]) & (fsm_output[2]) & (fsm_output[5])
      & (~ (fsm_output[8])));
  assign mux_79_nl = MUX_s_1_2_2(or_76_nl, nand_17_nl, fsm_output[6]);
  assign mux_82_nl = MUX_s_1_2_2(or_81_nl, mux_79_nl, fsm_output[3]);
  assign mux_76_nl = MUX_s_1_2_2(or_tmp_70, or_tmp_73, fsm_output[4]);
  assign or_73_nl = (~((~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[5])))
      | (fsm_output[8]);
  assign mux_75_nl = MUX_s_1_2_2(or_73_nl, or_tmp_69, fsm_output[4]);
  assign mux_77_nl = MUX_s_1_2_2(mux_76_nl, mux_75_nl, fsm_output[6]);
  assign mux_73_nl = MUX_s_1_2_2(or_tmp_70, or_tmp_69, fsm_output[4]);
  assign or_69_nl = (fsm_output[1]) | (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[8]);
  assign mux_72_nl = MUX_s_1_2_2(or_69_nl, (fsm_output[8]), fsm_output[4]);
  assign mux_74_nl = MUX_s_1_2_2(mux_73_nl, mux_72_nl, fsm_output[6]);
  assign mux_78_nl = MUX_s_1_2_2(mux_77_nl, mux_74_nl, fsm_output[3]);
  assign mux_83_itm = MUX_s_1_2_2(mux_82_nl, mux_78_nl, fsm_output[7]);
  assign mux_85_nl = MUX_s_1_2_2(mux_tmp_56, or_tmp_82, or_82_cse);
  assign and_142_ssc = (~ mux_85_nl) & and_dcpl_140;
  assign mux_87_nl = MUX_s_1_2_2((~ nor_tmp_26), or_tmp_86, fsm_output[2]);
  assign mux_88_nl = MUX_s_1_2_2(mux_87_nl, or_tmp_87, fsm_output[1]);
  assign mux_89_nl = MUX_s_1_2_2(mux_88_nl, or_tmp_86, fsm_output[3]);
  assign or_86_nl = (~(and_280_cse | (fsm_output[4]))) | (fsm_output[5]);
  assign mux_86_nl = MUX_s_1_2_2(or_86_nl, or_234_cse, fsm_output[3]);
  assign mux_90_nl = MUX_s_1_2_2(mux_89_nl, mux_86_nl, fsm_output[6]);
  assign and_143_ssc = (~ mux_90_nl) & and_dcpl_139;
  assign and_204_nl = and_dcpl_17 & and_dcpl_179 & and_dcpl_121;
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_15_nl = MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_4_i_q_d, and_204_nl);
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_2_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux_15_nl}),
      z_out_1, and_dcpl_224);
  assign nor_226_cse = ~((fsm_output[4]) | (fsm_output[8]));
  assign nor_220_cse = ~((fsm_output[7]) | (fsm_output[4]));
  assign nor_221_cse = ~((fsm_output[8]) | (fsm_output[3]));
  assign and_185_nl = and_dcpl_17 & and_dcpl_179 & and_dcpl_108;
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_16_nl = MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_q_d, and_185_nl);
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_3_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux_16_nl}),
      z_out_1, and_dcpl_228);
  assign nor_218_cse = ~((fsm_output[7]) | (fsm_output[8]) | (fsm_output[5]));
  assign and_505_cse = (fsm_output[4:3]==2'b11);
  assign and_197_nl = and_dcpl_17 & and_dcpl_179 & and_dcpl_112;
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_17_nl = MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_2_i_q_d, and_197_nl);
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_4_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux_17_nl}),
      z_out_1, and_dcpl_232);
  assign COMP_LOOP_f2_COMP_LOOP_f2_nor_8_nl = ~((COPY_LOOP_i_12_3_sva_8_0[2]) | (COPY_LOOP_i_12_3_sva_8_0[0])
      | and_210_tmp);
  assign COMP_LOOP_f2_and_14_nl = (COPY_LOOP_i_12_3_sva_8_0[0]) & (~ (COPY_LOOP_i_12_3_sva_8_0[2]))
      & (~ and_210_tmp);
  assign COMP_LOOP_f2_and_15_nl = (COPY_LOOP_i_12_3_sva_8_0[2]) & (~ (COPY_LOOP_i_12_3_sva_8_0[0]))
      & (~ and_210_tmp);
  assign COMP_LOOP_f2_and_16_nl = (COPY_LOOP_i_12_3_sva_8_0[2]) & (COPY_LOOP_i_12_3_sva_8_0[0])
      & (~ and_210_tmp);
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux1h_2_nl = MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_5_i_q_d, {COMP_LOOP_f2_COMP_LOOP_f2_nor_8_nl
      , COMP_LOOP_f2_and_14_nl , COMP_LOOP_f2_and_15_nl , COMP_LOOP_f2_and_16_nl});
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_5_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux1h_2_nl}),
      z_out_1, and_dcpl_237);
  assign nor_200_cse = ~((fsm_output[5]) | (fsm_output[8]));
  assign COMP_LOOP_f2_COMP_LOOP_f2_nor_nl = ~((COPY_LOOP_i_12_3_sva_8_0[2:1]!=2'b00)
      | and_dcpl_147);
  assign COMP_LOOP_f2_and_10_nl = (COPY_LOOP_i_12_3_sva_8_0[2:1]==2'b01) & (~ and_dcpl_147);
  assign COMP_LOOP_f2_and_11_nl = (COPY_LOOP_i_12_3_sva_8_0[2:1]==2'b10) & (~ and_dcpl_147);
  assign COMP_LOOP_f2_and_12_nl = (COPY_LOOP_i_12_3_sva_8_0[2:1]==2'b11) & (~ and_dcpl_147);
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux1h_1_nl = MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_6_i_q_d, {COMP_LOOP_f2_COMP_LOOP_f2_nor_nl
      , COMP_LOOP_f2_and_10_nl , COMP_LOOP_f2_and_11_nl , COMP_LOOP_f2_and_12_nl});
  assign and_242_nl = nor_120_cse_1 & nor_121_cse & and_280_cse & nor_122_cse;
  assign COMP_LOOP_f2_mux1h_21_rgt = MUX1HOT_v_65_3_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux1h_1_nl}),
      z_out, z_out_1, {and_242_nl , and_dcpl_228 , and_dcpl_242});
  assign nand_44_cse = ~((fsm_output[3]) & (fsm_output[6]) & (fsm_output[1]));
  assign and_254_cse_1 = (fsm_output[1:0]==2'b11);
  assign or_234_cse = (fsm_output[5:4]!=2'b00);
  assign COMP_LOOP_f2_nor_2_cse = ~((COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b00));
  assign COMP_LOOP_f2_and_4_nl = COMP_LOOP_f2_COMP_LOOP_f2_nor_5_itm & and_dcpl_29;
  assign COMP_LOOP_f2_COMP_LOOP_f2_and_15_nl = (COPY_LOOP_i_12_3_sva_8_0[2:0]==3'b001)
      & and_dcpl_29;
  assign COMP_LOOP_f2_COMP_LOOP_f2_and_16_nl = (COPY_LOOP_i_12_3_sva_8_0[2:0]==3'b010)
      & and_dcpl_29;
  assign COMP_LOOP_f2_and_5_nl = COMP_LOOP_f2_COMP_LOOP_f2_and_17_itm & and_dcpl_29;
  assign COMP_LOOP_f2_COMP_LOOP_f2_and_18_nl = (COPY_LOOP_i_12_3_sva_8_0[2]) & COMP_LOOP_f2_nor_2_cse
      & and_dcpl_29;
  assign COMP_LOOP_f2_and_6_nl = COMP_LOOP_f2_COMP_LOOP_f2_and_19_itm & and_dcpl_29;
  assign COMP_LOOP_f2_and_7_nl = COMP_LOOP_f2_COMP_LOOP_f2_and_20_itm & and_dcpl_29;
  assign COMP_LOOP_f2_and_8_nl = COMP_LOOP_f2_COMP_LOOP_f2_and_21_itm & and_dcpl_29;
  assign COMP_LOOP_f2_mux1h_15_nl = MUX1HOT_v_64_10_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
      twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_5_i_q_d,
      twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_7_i_q_d, (xt_rsc_0_2_i_q_d[127:64]), (xt_rsc_0_6_i_q_d[127:64]),
      {COMP_LOOP_f2_and_4_nl , COMP_LOOP_f2_COMP_LOOP_f2_and_15_nl , COMP_LOOP_f2_COMP_LOOP_f2_and_16_nl
      , COMP_LOOP_f2_and_5_nl , COMP_LOOP_f2_COMP_LOOP_f2_and_18_nl , COMP_LOOP_f2_and_6_nl
      , COMP_LOOP_f2_and_7_nl , COMP_LOOP_f2_and_8_nl , and_dcpl_212 , and_dcpl_215});
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_6_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_mux1h_15_nl}),
      z_out_1, and_dcpl_244);
  assign COMP_LOOP_f2_COMP_LOOP_f2_nor_9_nl = ~((COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b00)
      | and_208_tmp);
  assign COMP_LOOP_f2_and_1_nl = (COPY_LOOP_i_12_3_sva_8_0[1:0]==2'b01) & (~ and_208_tmp);
  assign COMP_LOOP_f2_and_2_nl = (COPY_LOOP_i_12_3_sva_8_0[1:0]==2'b10) & (~ and_208_tmp);
  assign COMP_LOOP_f2_and_3_nl = (COPY_LOOP_i_12_3_sva_8_0[1:0]==2'b11) & (~ and_208_tmp);
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux1h_nl = MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, {COMP_LOOP_f2_COMP_LOOP_f2_nor_9_nl
      , COMP_LOOP_f2_and_1_nl , COMP_LOOP_f2_and_2_nl , COMP_LOOP_f2_and_3_nl});
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_7_rgt = MUX_v_65_2_2(({1'b0 , COMP_LOOP_f2_COMP_LOOP_f2_mux1h_nl}),
      z_out_1, and_dcpl_138);
  assign COPY_LOOP_1_i_or_5_nl = and_dcpl_138 | and_dcpl_232 | and_dcpl_237 | and_dcpl_244
      | and_dcpl_146;
  assign COPY_LOOP_1_i_COPY_LOOP_1_i_mux_rgt = MUX_v_65_2_2(({1'b0 , twiddle_rsc_0_0_i_q_d}),
      z_out, COPY_LOOP_1_i_or_5_nl);
  assign and_250_nl = (and_280_cse ^ (fsm_output[3])) & (~ (fsm_output[8])) & and_dcpl_186;
  assign COPY_LOOP_1_i_or_4_nl = and_dcpl_224 | and_dcpl_242;
  assign COPY_LOOP_1_i_mux1h_4_rgt = MUX1HOT_v_65_3_2(({1'b0 , (xt_rsc_0_0_i_q_d[63:0])}),
      z_out, z_out_1, {and_250_nl , COPY_LOOP_1_i_or_4_nl , and_dcpl_146});
  assign COMP_LOOP_f2_or_9_cse = and_dcpl_212 | and_dcpl_215;
  assign nor_112_cse = ~((fsm_output[4]) | (fsm_output[6]) | (fsm_output[7]) | (fsm_output[8]));
  assign or_259_cse = (~ (fsm_output[0])) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[6])
      | (fsm_output[7]) | (fsm_output[8]);
  assign or_260_nl = ((fsm_output[0]) & (COMP_LOOP_r_10_3_sva[0])) | (fsm_output[3])
      | (fsm_output[4]) | (fsm_output[6]) | (fsm_output[7]) | (fsm_output[8]);
  assign mux_41_cse = MUX_s_1_2_2(or_259_cse, or_260_nl, fsm_output[1]);
  assign and_dcpl_9 = ~((fsm_output[4]) | (fsm_output[2]));
  assign and_dcpl_11 = nor_120_cse_1 & (~ (fsm_output[5]));
  assign and_dcpl_12 = and_dcpl_11 & and_dcpl_9;
  assign and_dcpl_14 = ~((fsm_output[1:0]!=2'b00));
  assign and_dcpl_15 = and_dcpl_14 & nor_122_cse;
  assign and_dcpl_16 = (~ (fsm_output[4])) & (fsm_output[2]);
  assign and_dcpl_17 = and_dcpl_11 & and_dcpl_16;
  assign and_dcpl_18 = and_dcpl_17 & and_dcpl_15;
  assign and_299_nl = ((or_78_cse & (fsm_output[2]) & (fsm_output[4])) | (fsm_output[5]))
      & (fsm_output[8:7]==2'b11);
  assign mux_tmp_11 = MUX_s_1_2_2(and_507_cse, and_299_nl, fsm_output[3]);
  assign and_dcpl_20 = (fsm_output[3]) & (fsm_output[6]);
  assign and_dcpl_21 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_22 = and_dcpl_21 & and_dcpl_20;
  assign and_dcpl_23 = (fsm_output[4]) & (~ (fsm_output[2]));
  assign and_dcpl_24 = (fsm_output[8:7]==2'b11);
  assign and_dcpl_25 = and_dcpl_24 & (~ (fsm_output[5]));
  assign and_dcpl_26 = and_dcpl_25 & and_dcpl_23;
  assign and_dcpl_27 = and_dcpl_26 & and_dcpl_22;
  assign and_dcpl_29 = and_dcpl_17 & and_dcpl_21 & nor_122_cse;
  assign and_dcpl_31 = (~ (fsm_output[5])) & (~ (fsm_output[2])) & and_dcpl_21;
  assign nor_tmp_12 = (fsm_output[3]) & (fsm_output[4]) & (fsm_output[7]) & (fsm_output[8]);
  assign and_dcpl_35 = nor_121_cse & (fsm_output[2]) & nor_122_cse;
  assign or_tmp_25 = (fsm_output[1:0]!=2'b01);
  assign mux_tmp_18 = MUX_s_1_2_2((~ (fsm_output[0])), (fsm_output[0]), fsm_output[1]);
  assign and_dcpl_46 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_47 = and_dcpl_46 & nor_122_cse;
  assign and_dcpl_48 = and_dcpl_12 & and_dcpl_47;
  assign and_dcpl_49 = (fsm_output[3]) & (~ (fsm_output[6]));
  assign and_dcpl_50 = and_dcpl_46 & and_dcpl_49;
  assign and_dcpl_51 = (fsm_output[8:7]==2'b10);
  assign and_dcpl_53 = and_dcpl_51 & (fsm_output[5]) & and_dcpl_9;
  assign and_dcpl_54 = and_dcpl_53 & and_dcpl_50;
  assign and_dcpl_59 = and_dcpl_26 & and_dcpl_46 & and_dcpl_20;
  assign and_dcpl_60 = (~ (fsm_output[3])) & (fsm_output[6]);
  assign and_dcpl_61 = and_dcpl_21 & and_dcpl_60;
  assign and_dcpl_63 = and_dcpl_51 & (~ (fsm_output[5])) & and_dcpl_16;
  assign and_dcpl_64 = and_dcpl_63 & and_dcpl_61;
  assign and_dcpl_69 = and_254_cse_1 & and_dcpl_60;
  assign and_dcpl_70 = and_dcpl_53 & and_dcpl_69;
  assign and_dcpl_74 = and_dcpl_25 & and_dcpl_9 & and_dcpl_15;
  assign and_dcpl_79 = (fsm_output[4]) & (fsm_output[2]);
  assign and_dcpl_80 = and_dcpl_25 & and_dcpl_79;
  assign and_dcpl_81 = and_dcpl_80 & and_dcpl_50;
  assign and_dcpl_89 = and_507_cse & and_dcpl_23 & and_dcpl_21 & and_dcpl_49;
  assign and_dcpl_96 = and_dcpl_80 & and_dcpl_69;
  assign and_dcpl_101 = and_dcpl_14 & and_dcpl_49;
  assign and_dcpl_102 = and_dcpl_63 & and_dcpl_101;
  assign and_dcpl_107 = and_dcpl_17 & and_dcpl_47;
  assign and_dcpl_108 = (COPY_LOOP_i_12_3_sva_8_0[0]) & (~ (fsm_output[6]));
  assign and_dcpl_109 = and_dcpl_46 & (~ (fsm_output[3]));
  assign and_dcpl_112 = (COPY_LOOP_i_12_3_sva_8_0[1]) & (~ (fsm_output[6]));
  assign and_dcpl_115 = ~((fsm_output[1]) | (fsm_output[3]));
  assign and_dcpl_116 = and_dcpl_115 & (COPY_LOOP_i_12_3_sva_8_0[1]);
  assign and_dcpl_119 = and_dcpl_11 & and_dcpl_16 & (fsm_output[0]);
  assign and_dcpl_121 = (~ (fsm_output[6])) & (COPY_LOOP_i_12_3_sva_8_0[2]);
  assign and_dcpl_136 = nor_120_cse_1 & (fsm_output[5]);
  assign and_dcpl_138 = and_dcpl_136 & and_dcpl_16 & and_dcpl_15;
  assign or_tmp_69 = (~ (fsm_output[5])) | (fsm_output[8]);
  assign or_tmp_70 = (fsm_output[5]) | (fsm_output[8]);
  assign or_tmp_73 = (~ (fsm_output[2])) | (~ (fsm_output[5])) | (fsm_output[8]);
  assign and_dcpl_139 = (fsm_output[8:7]==2'b01);
  assign and_dcpl_140 = and_dcpl_139 & (~ (fsm_output[6]));
  assign or_tmp_82 = (fsm_output[5:4]!=2'b01);
  assign mux_tmp_56 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[4]);
  assign or_tmp_86 = (fsm_output[5:4]!=2'b10);
  assign or_tmp_87 = ~((~((fsm_output[2]) & (fsm_output[4]))) & (fsm_output[5]));
  assign nor_tmp_26 = (fsm_output[5:4]==2'b11);
  assign and_dcpl_143 = and_254_cse_1 & and_dcpl_20;
  assign and_dcpl_144 = and_dcpl_139 & (fsm_output[5]);
  assign and_dcpl_146 = and_dcpl_144 & and_dcpl_16 & and_dcpl_143;
  assign and_dcpl_147 = and_dcpl_17 & and_254_cse_1 & nor_122_cse;
  assign mux_tmp_63 = MUX_s_1_2_2(mux_tmp_56, or_tmp_82, fsm_output[2]);
  assign mux_tmp_67 = MUX_s_1_2_2(or_tmp_86, mux_tmp_56, fsm_output[2]);
  assign mux_tmp_68 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), and_dcpl_79);
  assign or_tmp_107 = and_dcpl_9 | (fsm_output[5]);
  assign or_109_nl = (fsm_output[2]) | (fsm_output[4]);
  assign mux_tmp_80 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), or_109_nl);
  assign and_dcpl_176 = and_dcpl_26 & and_dcpl_14 & and_dcpl_20;
  assign and_dcpl_179 = and_dcpl_21 & (~ (fsm_output[3]));
  assign and_dcpl_186 = ~((fsm_output[7:4]!=4'b0000));
  assign not_tmp_87 = ~((fsm_output[2:0]==3'b111));
  assign or_tmp_127 = (fsm_output[2:1]!=2'b00);
  assign or_dcpl_14 = (fsm_output[3]) | (fsm_output[6]);
  assign or_dcpl_15 = (fsm_output[1:0]!=2'b10);
  assign or_dcpl_19 = (fsm_output[8]) | (fsm_output[7]) | (fsm_output[5]);
  assign or_dcpl_20 = or_dcpl_19 | (fsm_output[4]) | (~ (fsm_output[2]));
  assign or_dcpl_21 = or_dcpl_20 | or_dcpl_15 | or_dcpl_14;
  assign and_dcpl_210 = and_254_cse_1 & (~ (fsm_output[3]));
  assign and_dcpl_212 = and_dcpl_17 & and_dcpl_210 & (~ (COMP_LOOP_r_10_3_sva[0]))
      & (~ (fsm_output[6]));
  assign and_dcpl_215 = and_dcpl_17 & and_dcpl_210 & (COMP_LOOP_r_10_3_sva[0]) &
      (~ (fsm_output[6]));
  assign and_dcpl_224 = and_dcpl_12 & and_dcpl_46 & and_dcpl_60;
  assign and_dcpl_228 = and_dcpl_11 & and_dcpl_79 & and_dcpl_22;
  assign and_dcpl_232 = and_dcpl_136 & and_dcpl_23 & and_dcpl_143;
  assign and_dcpl_236 = and_dcpl_139 & (~ (fsm_output[5])) & and_dcpl_23;
  assign and_dcpl_237 = and_dcpl_236 & and_dcpl_101;
  assign and_dcpl_242 = and_dcpl_144 & and_dcpl_79 & and_dcpl_47;
  assign and_dcpl_244 = and_dcpl_236 & and_dcpl_61;
  assign or_dcpl_41 = ~((fsm_output[1:0]==2'b11));
  assign or_dcpl_44 = (~ (fsm_output[3])) | (fsm_output[6]);
  assign or_dcpl_46 = (fsm_output[1:0]!=2'b00) | or_dcpl_44;
  assign or_dcpl_48 = or_dcpl_19 | (fsm_output[4]) | (fsm_output[2]);
  assign or_dcpl_50 = or_tmp_25 | or_dcpl_44;
  assign or_dcpl_52 = or_dcpl_15 | or_dcpl_44;
  assign COPY_LOOP_1_i_12_3_sva_8_0_mx0c2 = and_dcpl_26 & and_dcpl_143;
  assign mux_92_nl = MUX_s_1_2_2(mux_tmp_63, (fsm_output[5]), fsm_output[3]);
  assign and_150_ssc = (~ mux_92_nl) & nor_120_cse_1 & (~ (fsm_output[6]));
  assign and_276_nl = ((fsm_output[4:2]!=3'b000)) & (fsm_output[5]);
  assign nor_77_nl = ~((fsm_output[5:0]!=6'b000000));
  assign mux_93_nl = MUX_s_1_2_2(and_276_nl, nor_77_nl, fsm_output[6]);
  assign and_151_ssc = mux_93_nl & nor_120_cse_1;
  assign or_245_cse = (fsm_output[1]) | (fsm_output[0]) | (fsm_output[2]) | (fsm_output[4]);
  assign nand_16_nl = ~((fsm_output[1]) & (fsm_output[2]) & (fsm_output[4]));
  assign mux_94_nl = MUX_s_1_2_2(or_245_cse, nand_16_nl, fsm_output[3]);
  assign and_154_ssc = mux_94_nl & nor_120_cse_1 & (fsm_output[6:5]==2'b10);
  assign mux_97_nl = MUX_s_1_2_2(mux_tmp_68, mux_tmp_67, fsm_output[0]);
  assign mux_98_nl = MUX_s_1_2_2(or_tmp_87, mux_97_nl, fsm_output[1]);
  assign mux_99_nl = MUX_s_1_2_2((fsm_output[5]), (~ mux_98_nl), fsm_output[3]);
  assign and_156_ssc = mux_99_nl & nor_120_cse_1 & (fsm_output[6]);
  assign or_261_nl = and_505_cse | (fsm_output[5]) | (~ (fsm_output[7]));
  assign nand_32_nl = ~((fsm_output[3]) & (~((~(and_254_cse_1 | (fsm_output[2])))
      | (~ (fsm_output[4])) | (~ (fsm_output[5])) | (fsm_output[7]))));
  assign mux_100_nl = MUX_s_1_2_2(or_261_nl, nand_32_nl, fsm_output[6]);
  assign nor_131_ssc = ~(mux_100_nl | (fsm_output[8]));
  assign nand_nl = ~((~(or_78_cse & (fsm_output[2]) & (fsm_output[4]))) & (fsm_output[5]));
  assign mux_101_nl = MUX_s_1_2_2(nand_nl, mux_tmp_56, fsm_output[3]);
  assign and_158_ssc = (~ mux_101_nl) & and_dcpl_140;
  assign and_270_nl = or_78_cse & (fsm_output[2]) & (fsm_output[4]) & (fsm_output[5]);
  assign mux_102_nl = MUX_s_1_2_2(and_270_nl, nor_tmp_26, fsm_output[3]);
  assign nor_73_nl = ~((or_82_cse & (fsm_output[4])) | (fsm_output[5]));
  assign mux_103_nl = MUX_s_1_2_2(mux_102_nl, nor_73_nl, fsm_output[6]);
  assign and_159_ssc = mux_103_nl & and_dcpl_139;
  assign mux_105_nl = MUX_s_1_2_2(or_tmp_86, mux_tmp_56, or_tmp_127);
  assign and_269_nl = (fsm_output[2:0]==3'b111);
  assign mux_104_nl = MUX_s_1_2_2(mux_tmp_56, or_tmp_82, and_269_nl);
  assign mux_106_nl = MUX_s_1_2_2(mux_105_nl, mux_104_nl, fsm_output[3]);
  assign and_161_ssc = (~ mux_106_nl) & and_dcpl_139 & (fsm_output[6]);
  assign nor_70_nl = ~(((fsm_output[3:2]==2'b11)) | (fsm_output[4]) | (fsm_output[5])
      | (fsm_output[7]) | (~ (fsm_output[8])));
  assign nor_71_nl = ~((~(((fsm_output[3:0]==4'b1111)) | (fsm_output[4]))) | (~ (fsm_output[5]))
      | (~ (fsm_output[7])) | (fsm_output[8]));
  assign mux_107_ssc = MUX_s_1_2_2(nor_70_nl, nor_71_nl, fsm_output[6]);
  assign mux_109_nl = MUX_s_1_2_2(mux_tmp_80, or_tmp_107, or_78_cse);
  assign mux_110_nl = MUX_s_1_2_2(mux_tmp_56, mux_109_nl, fsm_output[3]);
  assign and_163_ssc = (~ mux_110_nl) & and_dcpl_51 & (~ (fsm_output[6]));
  assign and_265_nl = or_245_cse & (fsm_output[5]);
  assign mux_111_nl = MUX_s_1_2_2(nor_tmp_26, and_265_nl, fsm_output[3]);
  assign nor_68_nl = ~((fsm_output[3]) | and_280_cse | (fsm_output[5:4]!=2'b00));
  assign mux_112_nl = MUX_s_1_2_2(mux_111_nl, nor_68_nl, fsm_output[6]);
  assign and_164_ssc = mux_112_nl & and_dcpl_51;
  assign mux_113_nl = MUX_s_1_2_2(mux_tmp_80, or_tmp_107, fsm_output[0]);
  assign mux_114_nl = MUX_s_1_2_2(mux_tmp_63, mux_113_nl, fsm_output[1]);
  assign mux_115_nl = MUX_s_1_2_2(mux_114_nl, (fsm_output[5]), fsm_output[3]);
  assign and_166_ssc = (~ mux_115_nl) & and_dcpl_51 & (fsm_output[6]);
  assign and_169_ssc = (and_254_cse_1 | (fsm_output[4:2]!=3'b000)) & and_dcpl_51
      & (fsm_output[6:5]==2'b11);
  assign and_172_ssc = (~((~ and_dcpl_14) & (fsm_output[4:2]==3'b111))) & and_dcpl_24
      & (fsm_output[6:5]==2'b00);
  assign mux_116_nl = MUX_s_1_2_2(or_tmp_87, mux_tmp_68, fsm_output[0]);
  assign mux_117_nl = MUX_s_1_2_2(mux_116_nl, mux_tmp_67, fsm_output[1]);
  assign mux_118_nl = MUX_s_1_2_2((fsm_output[5]), (~ mux_117_nl), fsm_output[3]);
  assign and_174_ssc = mux_118_nl & and_dcpl_24 & (~ (fsm_output[6]));
  assign nand_15_nl = ~((fsm_output[3]) & or_tmp_127 & (fsm_output[5:4]==2'b11));
  assign or_119_nl = ((fsm_output[1]) & (fsm_output[0]) & (fsm_output[2]) & (fsm_output[4]))
      | (fsm_output[5]);
  assign mux_119_nl = MUX_s_1_2_2(or_119_nl, or_234_cse, fsm_output[3]);
  assign mux_120_nl = MUX_s_1_2_2(nand_15_nl, mux_119_nl, fsm_output[6]);
  assign and_176_ssc = (~ mux_120_nl) & and_dcpl_24;
  assign mux_131_nl = MUX_s_1_2_2(not_tmp_87, or_364_cse, fsm_output[3]);
  assign and_210_tmp = (~ mux_131_nl) & (~ (fsm_output[8])) & and_dcpl_186;
  assign or_233_nl = and_254_cse_1 | (fsm_output[2]);
  assign mux_130_nl = MUX_s_1_2_2(not_tmp_87, or_233_nl, fsm_output[3]);
  assign and_208_tmp = (~ mux_130_nl) & (~ (fsm_output[8])) & and_dcpl_186;
  assign COMP_LOOP_f2_mux_2_nl = MUX_v_64_2_2(vec_rsc_0_2_i_q_d, result_rsc_0_2_i_q_d,
      and_dcpl_27);
  assign COMP_LOOP_f2_mux_60_nl = MUX_v_64_2_2(vec_rsc_0_0_i_q_d, result_rsc_0_0_i_q_d,
      and_dcpl_27);
  assign xt_rsc_0_0_i_d_d_pff = {COMP_LOOP_f2_mux_2_nl , COMP_LOOP_f2_mux_60_nl};
  assign xt_rsc_0_0_i_radr_d_pff = MUX_v_7_2_2((COMP_LOOP_r_10_3_sva[6:0]), (COMP_LOOP_r_10_3_sva[7:1]),
      and_dcpl_29);
  assign xt_rsc_0_0_i_wadr_d_pff = MUX_v_7_2_2((COPY_LOOP_i_12_3_sva_8_0[8:2]), (COPY_LOOP_1_i_12_3_sva_8_0[8:2]),
      and_dcpl_27);
  assign nor_110_nl = ~((COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b00) | (fsm_output[3])
      | (fsm_output[4]) | (fsm_output[7]) | (fsm_output[8]));
  assign nor_111_nl = ~((COPY_LOOP_1_i_12_3_sva_8_0[1:0]!=2'b00) | (~ nor_tmp_12));
  assign mux_45_nl = MUX_s_1_2_2(nor_110_nl, nor_111_nl, fsm_output[6]);
  assign xt_rsc_0_0_i_we_d_pff = mux_45_nl & and_dcpl_31;
  assign mux_47_nl = MUX_s_1_2_2(mux_tmp_18, or_tmp_25, COMP_LOOP_r_10_3_sva[0]);
  assign xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff = (~ mux_47_nl) & nor_120_cse_1
      & and_dcpl_35;
  assign COMP_LOOP_f2_mux_6_nl = MUX_v_64_2_2(vec_rsc_0_6_i_q_d, result_rsc_0_6_i_q_d,
      and_dcpl_27);
  assign COMP_LOOP_f2_mux_61_nl = MUX_v_64_2_2(vec_rsc_0_4_i_q_d, result_rsc_0_4_i_q_d,
      and_dcpl_27);
  assign xt_rsc_0_1_i_d_d_pff = {COMP_LOOP_f2_mux_6_nl , COMP_LOOP_f2_mux_61_nl};
  assign nor_105_nl = ~((COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b01) | (fsm_output[3])
      | (fsm_output[4]) | (fsm_output[7]) | (fsm_output[8]));
  assign nor_106_nl = ~((COPY_LOOP_1_i_12_3_sva_8_0[1]) | (~((COPY_LOOP_1_i_12_3_sva_8_0[0])
      & (fsm_output[3]) & (fsm_output[4]) & (fsm_output[7]) & (fsm_output[8]))));
  assign mux_52_nl = MUX_s_1_2_2(nor_105_nl, nor_106_nl, fsm_output[6]);
  assign xt_rsc_0_2_i_we_d_pff = mux_52_nl & and_dcpl_31;
  assign nor_97_nl = ~((COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b10) | (fsm_output[3]) |
      (fsm_output[4]) | (fsm_output[7]) | (fsm_output[8]));
  assign nor_98_nl = ~((COPY_LOOP_1_i_12_3_sva_8_0[1:0]!=2'b10) | (~ nor_tmp_12));
  assign mux_57_nl = MUX_s_1_2_2(nor_97_nl, nor_98_nl, fsm_output[6]);
  assign xt_rsc_0_4_i_we_d_pff = mux_57_nl & and_dcpl_31;
  assign mux_58_nl = MUX_s_1_2_2(or_tmp_25, mux_tmp_18, COMP_LOOP_r_10_3_sva[0]);
  assign xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff = (~ mux_58_nl) & nor_120_cse_1
      & and_dcpl_35;
  assign nor_92_nl = ~((COPY_LOOP_i_12_3_sva_8_0[1:0]!=2'b11) | (fsm_output[3]) |
      (fsm_output[4]) | (fsm_output[7]) | (fsm_output[8]));
  assign and_285_nl = (COPY_LOOP_1_i_12_3_sva_8_0[1:0]==2'b11) & (fsm_output[3])
      & (fsm_output[4]) & (fsm_output[7]) & (fsm_output[8]);
  assign mux_63_nl = MUX_s_1_2_2(nor_92_nl, and_285_nl, fsm_output[6]);
  assign xt_rsc_0_6_i_we_d_pff = mux_63_nl & and_dcpl_31;
  assign vec_rsc_0_0_i_radr_d_pff = COPY_LOOP_i_12_3_sva_8_0;
  assign vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff = and_dcpl_48;
  assign result_rsc_0_0_i_d_d = MUX_v_64_2_2((COMP_LOOP_1_f2_rem_1_cmp_z[63:0]),
      COMP_LOOP_1_f2_rem_cmp_z, and_dcpl_54);
  assign result_rsc_0_0_i_radr_d_pff = COPY_LOOP_1_i_12_3_sva_8_0;
  assign result_rsc_0_0_i_wadr_d = {(~ and_dcpl_54) , COMP_LOOP_r_10_3_sva};
  assign nor_90_nl = ~((fsm_output[0]) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (~ (fsm_output[7])) | (fsm_output[8]));
  assign nor_91_nl = ~((~ (fsm_output[0])) | (fsm_output[2]) | (fsm_output[4]) |
      (fsm_output[7]) | (~ (fsm_output[8])));
  assign mux_64_nl = MUX_s_1_2_2(nor_90_nl, nor_91_nl, fsm_output[3]);
  assign result_rsc_0_0_i_we_d_pff = mux_64_nl & (fsm_output[5]) & (~ (fsm_output[1]))
      & (~ (fsm_output[6]));
  assign result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff = and_dcpl_59;
  assign result_rsc_0_1_i_d_d = MUX_v_64_2_2((COMP_LOOP_1_f2_rem_1_cmp_z[63:0]),
      COMP_LOOP_1_f2_rem_cmp_z, and_dcpl_64);
  assign result_rsc_0_1_i_wadr_d = {(~ and_dcpl_64) , COMP_LOOP_r_10_3_sva};
  assign or_265_nl = (fsm_output[2]) | (~ (fsm_output[5])) | (~ (fsm_output[7]))
      | (fsm_output[8]);
  assign or_266_nl = (~ (fsm_output[2])) | (fsm_output[5]) | (fsm_output[7]) | (~
      (fsm_output[8]));
  assign mux_65_nl = MUX_s_1_2_2(or_265_nl, or_266_nl, fsm_output[6]);
  assign result_rsc_0_1_i_we_d_pff = ~(mux_65_nl | (fsm_output[4]) | (fsm_output[0])
      | (~ (fsm_output[1])) | (fsm_output[3]));
  assign result_rsc_0_2_i_d_d = MUX_v_64_2_2((COMP_LOOP_1_f2_rem_1_cmp_z[63:0]),
      COMP_LOOP_1_f2_rem_cmp_z, and_dcpl_70);
  assign result_rsc_0_2_i_wadr_d = {(~ and_dcpl_70) , COMP_LOOP_r_10_3_sva};
  assign or_262_nl = (fsm_output[1]) | (fsm_output[0]) | (~ (fsm_output[4])) | (fsm_output[5])
      | (~ (fsm_output[7])) | (fsm_output[8]);
  assign or_263_nl = (~ (fsm_output[1])) | (~ (fsm_output[0])) | (fsm_output[4])
      | (~ (fsm_output[5])) | (fsm_output[7]) | (~ (fsm_output[8]));
  assign mux_66_nl = MUX_s_1_2_2(or_262_nl, or_263_nl, fsm_output[6]);
  assign result_rsc_0_2_i_we_d_pff = ~(mux_66_nl | (fsm_output[3:2]!=2'b00));
  assign result_rsc_0_3_i_d_d = MUX_v_64_2_2((COMP_LOOP_1_f2_rem_1_cmp_z[63:0]),
      COMP_LOOP_1_f2_rem_cmp_z, and_dcpl_74);
  assign result_rsc_0_3_i_wadr_d = {(~ and_dcpl_74) , COMP_LOOP_r_10_3_sva};
  assign nor_84_nl = ~((fsm_output[1]) | (fsm_output[2]) | (~ (fsm_output[8])));
  assign nor_85_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[8]));
  assign mux_67_nl = MUX_s_1_2_2(nor_84_nl, nor_85_nl, fsm_output[6]);
  assign result_rsc_0_3_i_we_d_pff = mux_67_nl & (fsm_output[7]) & nor_121_cse &
      (~ (fsm_output[0])) & (~ (fsm_output[3]));
  assign result_rsc_0_4_i_d_d = MUX_v_64_2_2((COMP_LOOP_1_f2_rem_1_cmp_z[63:0]),
      COMP_LOOP_1_f2_rem_cmp_z, and_dcpl_81);
  assign result_rsc_0_4_i_wadr_d = {(~ and_dcpl_81) , COMP_LOOP_r_10_3_sva};
  assign and_284_nl = (fsm_output[0]) & (fsm_output[2]) & (fsm_output[8]);
  assign nor_83_nl = ~((fsm_output[0]) | (fsm_output[2]) | (fsm_output[8]));
  assign mux_68_nl = MUX_s_1_2_2(and_284_nl, nor_83_nl, fsm_output[6]);
  assign result_rsc_0_4_i_we_d_pff = mux_68_nl & (fsm_output[7]) & (~ (fsm_output[5]))
      & (fsm_output[4]) & (~ (fsm_output[1])) & (fsm_output[3]);
  assign result_rsc_0_5_i_d_d = MUX_v_64_2_2((COMP_LOOP_1_f2_rem_1_cmp_z[63:0]),
      COMP_LOOP_1_f2_rem_cmp_z, and_dcpl_89);
  assign result_rsc_0_5_i_wadr_d = {(~ and_dcpl_89) , COMP_LOOP_r_10_3_sva};
  assign and_283_nl = (fsm_output[4]) & (fsm_output[8]);
  assign mux_69_nl = MUX_s_1_2_2(and_283_nl, nor_226_cse, fsm_output[6]);
  assign result_rsc_0_5_i_we_d_pff = mux_69_nl & (fsm_output[7]) & (fsm_output[5])
      & (~ (fsm_output[2])) & (~ (fsm_output[0])) & (fsm_output[1]) & (fsm_output[3]);
  assign result_rsc_0_6_i_d_d = MUX_v_64_2_2((COMP_LOOP_1_f2_rem_1_cmp_z[63:0]),
      COMP_LOOP_1_f2_rem_cmp_z, and_dcpl_96);
  assign result_rsc_0_6_i_wadr_d = {(~ and_dcpl_96) , COMP_LOOP_r_10_3_sva};
  assign nor_81_nl = ~((fsm_output[1]) | (fsm_output[2]) | (fsm_output[4]) | (fsm_output[7]));
  assign and_282_nl = (fsm_output[1]) & (fsm_output[2]) & (fsm_output[4]) & (fsm_output[7]);
  assign mux_70_nl = MUX_s_1_2_2(nor_81_nl, and_282_nl, fsm_output[6]);
  assign result_rsc_0_6_i_we_d_pff = mux_70_nl & (fsm_output[8]) & (~ (fsm_output[5]))
      & (fsm_output[0]) & (~ (fsm_output[3]));
  assign result_rsc_0_7_i_d_d = MUX_v_64_2_2((COMP_LOOP_1_f2_rem_1_cmp_z[63:0]),
      COMP_LOOP_1_f2_rem_cmp_z, and_dcpl_102);
  assign result_rsc_0_7_i_wadr_d = {(~ and_dcpl_102) , COMP_LOOP_r_10_3_sva};
  assign nand_34_nl = ~((fsm_output[1]) & (fsm_output[4]) & (fsm_output[5]) & (~
      (fsm_output[8])));
  assign or_264_nl = (fsm_output[1]) | (fsm_output[4]) | (fsm_output[5]) | (~ (fsm_output[8]));
  assign mux_71_nl = MUX_s_1_2_2(nand_34_nl, or_264_nl, fsm_output[3]);
  assign result_rsc_0_7_i_we_d_pff = ~(mux_71_nl | (fsm_output[7]) | (~ (fsm_output[2]))
      | (fsm_output[0]) | (fsm_output[6]));
  assign twiddle_rsc_0_0_i_radr_d = {1'b0 , COMP_LOOP_1_f2_and_rmff};
  assign twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_107;
  assign twiddle_rsc_0_1_i_radr_d = {1'b0 , COMP_LOOP_1_f2_and_rmff};
  assign twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_17 & and_dcpl_109
      & and_dcpl_108;
  assign twiddle_rsc_0_2_i_radr_d = {1'b0 , COMP_LOOP_1_f2_and_rmff};
  assign twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_17 & and_dcpl_109
      & and_dcpl_112;
  assign twiddle_rsc_0_3_i_radr_d = {1'b0 , COMP_LOOP_1_f2_and_rmff};
  assign twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_119 & and_dcpl_116
      & and_dcpl_108;
  assign twiddle_rsc_0_4_i_radr_d = {1'b0 , COMP_LOOP_1_f2_and_rmff};
  assign twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_17 & and_dcpl_109
      & and_dcpl_121;
  assign twiddle_rsc_0_5_i_radr_d = {1'b0 , COMP_LOOP_1_f2_and_rmff};
  assign twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_119 & and_dcpl_115
      & (COPY_LOOP_i_12_3_sva_8_0[0]) & and_dcpl_121;
  assign twiddle_rsc_0_6_i_radr_d = {1'b0 , COMP_LOOP_1_f2_and_rmff};
  assign twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_119 & and_dcpl_116
      & and_dcpl_121;
  assign twiddle_rsc_0_7_i_radr_d = {1'b0 , COMP_LOOP_1_f2_and_rmff};
  assign twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d = and_dcpl_119 & and_dcpl_116
      & and_dcpl_108 & (COPY_LOOP_i_12_3_sva_8_0[2]);
  assign and_dcpl_254 = and_dcpl_11 & (~ (fsm_output[4])) & (~ (fsm_output[2]));
  assign and_dcpl_255 = and_dcpl_254 & and_dcpl_47;
  assign and_dcpl_260 = (fsm_output[8]) & (fsm_output[7]) & (~ (fsm_output[5]));
  assign and_dcpl_262 = and_dcpl_260 & and_dcpl_23 & and_dcpl_46 & and_dcpl_20;
  assign and_dcpl_270 = and_dcpl_11 & and_dcpl_79 & and_dcpl_21 & and_dcpl_20;
  assign and_dcpl_272 = (fsm_output[1:0]==2'b11) & and_dcpl_20;
  assign and_dcpl_275 = and_dcpl_136 & and_dcpl_23 & and_dcpl_272;
  assign and_dcpl_282 = and_dcpl_236 & and_dcpl_14 & (fsm_output[3]) & (~ (fsm_output[6]));
  assign and_dcpl_285 = and_dcpl_236 & and_dcpl_21 & and_dcpl_60;
  assign and_dcpl_287 = and_dcpl_254 & and_dcpl_46 & and_dcpl_60;
  assign and_dcpl_295 = and_dcpl_144 & and_dcpl_16 & and_dcpl_272;
  assign and_dcpl_299 = and_dcpl_260 & and_dcpl_79 & and_dcpl_14 & and_dcpl_20;
  assign and_dcpl_342 = (fsm_output[1:0]==2'b00) & and_dcpl_49;
  assign and_dcpl_346 = nor_218_cse & (~ (fsm_output[4])) & (~ (fsm_output[2]));
  assign and_dcpl_347 = and_dcpl_346 & and_dcpl_342;
  assign and_dcpl_349 = (fsm_output[1:0]==2'b01) & and_dcpl_49;
  assign and_dcpl_350 = and_dcpl_346 & and_dcpl_349;
  assign and_dcpl_353 = and_dcpl_346 & (fsm_output[1:0]==2'b11) & and_dcpl_49;
  assign and_dcpl_355 = nor_218_cse & (~ (fsm_output[4])) & (fsm_output[2]);
  assign and_dcpl_356 = and_dcpl_355 & and_dcpl_342;
  assign and_dcpl_357 = and_dcpl_355 & and_dcpl_349;
  assign and_dcpl_360 = and_dcpl_355 & (fsm_output[1:0]==2'b10) & and_dcpl_49;
  assign and_dcpl_374 = nor_218_cse & (~ (fsm_output[4])) & (fsm_output[2]) & (fsm_output[0])
      & (fsm_output[1]) & (~ (fsm_output[3])) & (~ (fsm_output[6]));
  assign or_tmp_209 = (fsm_output[5]) | (fsm_output[7]) | (fsm_output[3]) | (fsm_output[6])
      | (~ (fsm_output[1]));
  assign nor_tmp_73 = (fsm_output[1]) & (fsm_output[0]) & (fsm_output[6]) & (fsm_output[5])
      & (fsm_output[3]);
  assign or_tmp_253 = (fsm_output[7:4]!=4'b0000);
  assign COMP_LOOP_f2_nor_14_itm = ~(and_dcpl_255 | and_dcpl_262 | and_dcpl_107);
  assign COMP_LOOP_f2_or_18_itm = and_dcpl_18 | and_dcpl_299;
  always @(posedge clk) begin
    if ( rst ) begin
      COPY_LOOP_i_12_3_sva_8_0 <= 9'b000000000;
    end
    else if ( MUX_s_1_2_2(nor_nl, mux_35_cse, fsm_output[6]) ) begin
      COPY_LOOP_i_12_3_sva_8_0 <= MUX_v_9_2_2(9'b000000000, COMP_LOOP_f2_COMP_LOOP_f2_mux_14_nl,
          not_528_nl);
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_118_cse, mux_tmp_11, fsm_output[6]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_xt_rsc_0_0_cgo_cse <= 1'b0;
      reg_xt_rsc_0_2_cgo_cse <= 1'b0;
      reg_xt_rsc_0_4_cgo_cse <= 1'b0;
      reg_xt_rsc_0_6_cgo_cse <= 1'b0;
      reg_vec_rsc_triosy_0_6_obj_ld_cse <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_nor_5_itm <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_and_17_itm <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_and_19_itm <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_and_20_itm <= 1'b0;
      COMP_LOOP_f2_COMP_LOOP_f2_and_21_itm <= 1'b0;
    end
    else begin
      reg_xt_rsc_0_0_cgo_cse <= nor_128_rmff;
      reg_xt_rsc_0_2_cgo_cse <= nor_127_rmff;
      reg_xt_rsc_0_4_cgo_cse <= nor_126_rmff;
      reg_xt_rsc_0_6_cgo_cse <= nor_125_rmff;
      reg_vec_rsc_triosy_0_6_obj_ld_cse <= and_dcpl_80 & and_dcpl_14 & (fsm_output[3])
          & (fsm_output[6]) & (z_out[4]);
      COMP_LOOP_f2_COMP_LOOP_f2_nor_5_itm <= ~((COPY_LOOP_i_12_3_sva_8_0[2:0]!=3'b000));
      COMP_LOOP_f2_COMP_LOOP_f2_and_17_itm <= (COPY_LOOP_i_12_3_sva_8_0[2:0]==3'b011);
      COMP_LOOP_f2_COMP_LOOP_f2_and_19_itm <= (COPY_LOOP_i_12_3_sva_8_0[2:0]==3'b101);
      COMP_LOOP_f2_COMP_LOOP_f2_and_20_itm <= (COPY_LOOP_i_12_3_sva_8_0[2:0]==3'b110);
      COMP_LOOP_f2_COMP_LOOP_f2_and_21_itm <= (COPY_LOOP_i_12_3_sva_8_0[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    reg_COMP_LOOP_1_f2_rem_1_cmp_a_ftd <= MUX1HOT_s_1_4_2((z_out[64]), COPY_LOOP_1_i_acc_10_itm_64,
        COMP_LOOP_5_f2_acc_itm_64, COPY_LOOP_1_i_acc_12_itm_64, {COPY_LOOP_1_i_or_6_ssc
        , (~ mux_83_itm) , and_142_ssc , and_143_ssc});
    reg_COMP_LOOP_1_f2_rem_1_cmp_a_ftd_1 <= MUX1HOT_v_64_4_2((z_out[63:0]), COPY_LOOP_1_i_acc_10_itm_63_0,
        COMP_LOOP_5_f2_acc_itm_63_0, COPY_LOOP_1_i_acc_12_itm_63_0, {COPY_LOOP_1_i_or_6_ssc
        , (~ mux_83_itm) , and_142_ssc , and_143_ssc});
    reg_COMP_LOOP_1_f2_rem_1_cmp_b_63_0_cse <= p_sva;
    reg_COMP_LOOP_1_f2_rem_cmp_a_ftd <= MUX_v_63_2_2(63'b000000000000000000000000000000000000000000000000000000000000000,
        COMP_LOOP_f2_mux1h_4_nl, COMP_LOOP_f2_nor_12_nl);
    reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1 <= MUX1HOT_v_65_17_2((z_out_3[64:0]), (COMP_LOOP_8_f2_mul_mut[64:0]),
        (COMP_LOOP_1_f2_mul_itm[64:0]), (COMP_LOOP_2_f2_mul_itm[64:0]), (COMP_LOOP_3_f2_mul_itm[64:0]),
        (COMP_LOOP_4_f2_mul_itm[64:0]), (COMP_LOOP_5_f2_mul_itm[64:0]), (COMP_LOOP_6_f2_mul_itm[64:0]),
        (COMP_LOOP_7_f2_mul_itm[64:0]), ({COMP_LOOP_8_f2_acc_itm_64 , COMP_LOOP_8_f2_acc_itm_63_0}),
        ({COMP_LOOP_1_f2_acc_itm_64 , COMP_LOOP_1_f2_acc_itm_63_0}), ({COMP_LOOP_2_f2_acc_itm_64
        , COMP_LOOP_2_f2_acc_itm_63_0}), ({COMP_LOOP_3_f2_acc_itm_64 , COMP_LOOP_3_f2_acc_itm_63_0}),
        ({COMP_LOOP_4_f2_acc_itm_64 , COMP_LOOP_4_f2_acc_itm_63_0}), ({COMP_LOOP_5_f2_acc_itm_64
        , COMP_LOOP_5_f2_acc_itm_63_0}), ({COMP_LOOP_6_f2_acc_itm_64 , COMP_LOOP_6_f2_acc_itm_63_0}),
        ({COPY_LOOP_1_i_acc_12_itm_64 , COPY_LOOP_1_i_acc_12_itm_63_0}), {and_dcpl_147
        , and_150_ssc , and_151_ssc , and_154_ssc , and_156_ssc , nor_131_ssc , and_158_ssc
        , and_159_ssc , and_161_ssc , mux_107_ssc , and_163_ssc , and_164_ssc , and_166_ssc
        , and_169_ssc , and_172_ssc , and_174_ssc , and_176_ssc});
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COPY_LOOP_1_i_12_3_sva_1 <= 10'b0000000000;
    end
    else if ( and_dcpl_48 | and_dcpl_59 ) begin
      COPY_LOOP_1_i_12_3_sva_1 <= z_out[9:0];
    end
  end
  always @(posedge clk) begin
    if ( MUX_s_1_2_2(nor_66_nl, mux_tmp_11, fsm_output[6]) ) begin
      STAGE_LOOP_base_acc_cse_sva <= MUX_v_4_2_2(4'b1010, (z_out[3:0]), and_dcpl_18);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_r_10_3_sva <= 8'b00000000;
    end
    else if ( and_dcpl_18 | and_dcpl_176 ) begin
      COMP_LOOP_r_10_3_sva <= MUX_v_8_2_2(8'b00000000, (COPY_LOOP_1_i_12_3_sva_8_0[7:0]),
          COMP_LOOP_f2_not_48_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COPY_LOOP_1_i_12_3_sva_8_0 <= 9'b000000000;
    end
    else if ( and_dcpl_107 | and_dcpl_176 | COPY_LOOP_1_i_12_3_sva_8_0_mx0c2 ) begin
      COPY_LOOP_1_i_12_3_sva_8_0 <= MUX_v_9_2_2(9'b000000000, COPY_LOOP_1_i_mux_nl,
          not_nl);
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_21 ) begin
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_1_3_63_0_itm <= xt_rsc_0_1_i_q_d[63:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_21 ) begin
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_2_5_63_0_itm <= xt_rsc_0_2_i_q_d[63:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_21 ) begin
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_3_7_63_0_itm <= xt_rsc_0_3_i_q_d[63:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_21 ) begin
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_4_9_63_0_itm <= xt_rsc_0_4_i_q_d[63:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_21 ) begin
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_5_11_63_0_itm <= xt_rsc_0_5_i_q_d[63:0];
    end
  end
  always @(posedge clk) begin
    if ( ~ or_dcpl_21 ) begin
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_6_13_63_0_itm <= xt_rsc_0_6_i_q_d[63:0];
    end
  end
  always @(posedge clk) begin
    if ( (and_dcpl_11 & ((~ (fsm_output[0])) | (COMP_LOOP_r_10_3_sva[0])) & and_dcpl_16
        & (fsm_output[1]) & nor_122_cse) | and_dcpl_212 ) begin
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_15_63_0_itm <= MUX_v_64_2_2((xt_rsc_0_7_i_q_d[63:0]),
          (xt_rsc_0_3_i_q_d[63:0]), and_dcpl_212);
    end
  end
  always @(posedge clk) begin
    if ( mux_166_nl & (~((fsm_output[5]) | (fsm_output[7]))) & nor_226_cse ) begin
      COMP_LOOP_1_f2_acc_itm_64 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_2_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( (~(mux_167_nl | (fsm_output[5]))) & nor_220_cse & nor_221_cse ) begin
      COMP_LOOP_1_f2_acc_itm_63_0 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_2_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_170_nl & nor_218_cse ) begin
      COMP_LOOP_2_f2_acc_itm_64 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_3_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( mux_171_nl & nor_120_cse_1 & (~((fsm_output[5]) | (fsm_output[0]))) & (fsm_output[1])
        & (fsm_output[2]) ) begin
      COMP_LOOP_2_f2_acc_itm_63_0 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_3_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_173_nl & nor_120_cse_1 ) begin
      COMP_LOOP_3_f2_acc_itm_64 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_4_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( mux_174_nl & (fsm_output[1]) & (~ (fsm_output[7])) & (~ (fsm_output[8]))
        ) begin
      COMP_LOOP_3_f2_acc_itm_63_0 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_4_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_176_nl & (~((fsm_output[5]) | (fsm_output[8]) | (fsm_output[6]))) )
        begin
      COMP_LOOP_4_f2_acc_itm_64 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_5_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( mux_177_nl & nor_200_cse & (~((fsm_output[6]) | (fsm_output[0]))) ) begin
      COMP_LOOP_4_f2_acc_itm_63_0 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_5_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_180_nl) & (~ (fsm_output[8])) & (fsm_output[2]) ) begin
      COMP_LOOP_5_f2_acc_itm_64 <= COMP_LOOP_f2_mux1h_21_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( mux_182_nl & (~ (fsm_output[8])) & (fsm_output[2]) ) begin
      COMP_LOOP_5_f2_acc_itm_63_0 <= COMP_LOOP_f2_mux1h_21_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_185_nl | (fsm_output[8])) ) begin
      COMP_LOOP_6_f2_acc_itm_64 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_6_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( mux_188_nl & nor_200_cse & (fsm_output[1]) & (~ (fsm_output[3])) ) begin
      COMP_LOOP_6_f2_acc_itm_63_0 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_6_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_190_nl & nor_220_cse & (~((fsm_output[6]) | (fsm_output[8]))) ) begin
      COMP_LOOP_8_f2_acc_itm_64 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_7_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( (~((fsm_output[7]) | (fsm_output[4]) | (fsm_output[6]))) & ((fsm_output[5])
        ^ (fsm_output[1])) & nor_221_cse & (~ (fsm_output[0])) & (fsm_output[2])
        ) begin
      COMP_LOOP_8_f2_acc_itm_63_0 <= COMP_LOOP_f2_COMP_LOOP_f2_mux_7_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_198_nl & (~ (fsm_output[8])) ) begin
      COPY_LOOP_1_i_acc_10_itm_64 <= COPY_LOOP_1_i_COPY_LOOP_1_i_mux_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_203_nl | (fsm_output[8])) ) begin
      COPY_LOOP_1_i_acc_10_itm_63_0 <= COPY_LOOP_1_i_COPY_LOOP_1_i_mux_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_207_nl | (fsm_output[8])) ) begin
      COPY_LOOP_1_i_acc_12_itm_64 <= COPY_LOOP_1_i_mux1h_4_rgt[64];
    end
  end
  always @(posedge clk) begin
    if ( ~(mux_210_nl | (fsm_output[8])) ) begin
      COPY_LOOP_1_i_acc_12_itm_63_0 <= COPY_LOOP_1_i_mux1h_4_rgt[63:0];
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_f2_or_9_cse ) begin
      tmp_14_127_64_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_3_i_q_d[127:64]), (xt_rsc_0_7_i_q_d[127:64]),
          and_dcpl_215);
      tmp_8_63_0_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_2_i_q_d[63:0]), (xt_rsc_0_6_i_q_d[63:0]),
          and_dcpl_215);
      tmp_6_127_64_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_1_i_q_d[127:64]), (xt_rsc_0_5_i_q_d[127:64]),
          and_dcpl_215);
      tmp_4_63_0_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_1_i_q_d[63:0]), (xt_rsc_0_5_i_q_d[63:0]),
          and_dcpl_215);
      tmp_2_127_64_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_0_i_q_d[127:64]), (xt_rsc_0_4_i_q_d[127:64]),
          and_dcpl_215);
      tmp_63_0_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_0_i_q_d[63:0]), (xt_rsc_0_4_i_q_d[63:0]),
          and_dcpl_215);
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_20 | or_dcpl_41 | or_dcpl_14) ) begin
      COMP_LOOP_8_f2_mul_mut <= z_out_3;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_48 | or_dcpl_46) ) begin
      COMP_LOOP_7_f2_mul_itm <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_48 | or_dcpl_50) ) begin
      COMP_LOOP_6_f2_mul_itm <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_48 | or_dcpl_52) ) begin
      COMP_LOOP_5_f2_mul_itm <= z_out_3;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_48 | or_dcpl_41 | or_dcpl_44) ) begin
      COMP_LOOP_4_f2_mul_itm <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_20 | or_dcpl_46) ) begin
      COMP_LOOP_3_f2_mul_itm <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_20 | or_dcpl_50) ) begin
      COMP_LOOP_2_f2_mul_itm <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( ~(or_dcpl_20 | or_dcpl_52) ) begin
      COMP_LOOP_1_f2_mul_itm <= z_out_2;
    end
  end
  assign COMP_LOOP_f2_COMP_LOOP_f2_mux_14_nl = MUX_v_9_2_2((COPY_LOOP_1_i_12_3_sva_1[8:0]),
      STAGE_LOOP_base_lshift_itm, and_dcpl_18);
  assign mux_36_nl = MUX_s_1_2_2(nor_118_cse, mux_35_cse, fsm_output[6]);
  assign not_528_nl = ~ mux_36_nl;
  assign or_269_nl = (fsm_output[1]) | (fsm_output[4]) | (fsm_output[5]) | (fsm_output[7])
      | (fsm_output[8]);
  assign or_268_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[4]) | (fsm_output[5])
      | (fsm_output[7]) | (fsm_output[8]);
  assign mux_163_nl = MUX_s_1_2_2(or_269_nl, or_268_nl, fsm_output[0]);
  assign nor_nl = ~((fsm_output[3]) | mux_163_nl);
  assign COMP_LOOP_f2_mux1h_4_nl = MUX1HOT_v_63_9_2((z_out_3[127:65]), (COMP_LOOP_8_f2_mul_mut[127:65]),
      (COMP_LOOP_1_f2_mul_itm[127:65]), (COMP_LOOP_2_f2_mul_itm[127:65]), (COMP_LOOP_3_f2_mul_itm[127:65]),
      (COMP_LOOP_4_f2_mul_itm[127:65]), (COMP_LOOP_5_f2_mul_itm[127:65]), (COMP_LOOP_6_f2_mul_itm[127:65]),
      (COMP_LOOP_7_f2_mul_itm[127:65]), {and_dcpl_147 , and_150_ssc , and_151_ssc
      , and_154_ssc , and_156_ssc , nor_131_ssc , and_158_ssc , and_159_ssc , and_161_ssc});
  assign COMP_LOOP_f2_nor_12_nl = ~(mux_107_ssc | and_163_ssc | and_164_ssc | and_166_ssc
      | and_169_ssc | and_172_ssc | and_174_ssc | and_176_ssc);
  assign nor_66_nl = ~((fsm_output[3]) | (or_78_cse & (fsm_output[2])) | (fsm_output[4])
      | (fsm_output[5]) | (fsm_output[7]) | (fsm_output[8]));
  assign COMP_LOOP_f2_not_48_nl = ~ and_dcpl_18;
  assign COPY_LOOP_1_i_mux_nl = MUX_v_9_2_2((z_out[8:0]), (COPY_LOOP_1_i_12_3_sva_1[8:0]),
      COPY_LOOP_1_i_12_3_sva_8_0_mx0c2);
  assign not_nl = ~ and_dcpl_176;
  assign nor_222_nl = ~((~ (fsm_output[0])) | (fsm_output[1]) | (~ (fsm_output[6])));
  assign nor_223_nl = ~((fsm_output[1]) | (fsm_output[6]));
  assign mux_165_nl = MUX_s_1_2_2(nor_222_nl, nor_223_nl, fsm_output[3]);
  assign nor_224_nl = ~((fsm_output[3]) | (~ (fsm_output[1])) | (fsm_output[6]));
  assign mux_166_nl = MUX_s_1_2_2(mux_165_nl, nor_224_nl, fsm_output[2]);
  assign or_362_nl = (~ (fsm_output[0])) | (fsm_output[1]) | (~ (fsm_output[6]));
  assign or_363_nl = (fsm_output[0]) | (~ (fsm_output[1])) | (fsm_output[6]);
  assign mux_167_nl = MUX_s_1_2_2(or_362_nl, or_363_nl, fsm_output[2]);
  assign nor_215_nl = ~((fsm_output[4:3]!=2'b01));
  assign nor_216_nl = ~((~ (fsm_output[1])) | (fsm_output[4]));
  assign nor_217_nl = ~((fsm_output[1]) | (fsm_output[0]) | (fsm_output[4]));
  assign mux_168_nl = MUX_s_1_2_2(nor_216_nl, nor_217_nl, fsm_output[3]);
  assign mux_169_nl = MUX_s_1_2_2(nor_215_nl, mux_168_nl, fsm_output[2]);
  assign and_506_nl = (fsm_output[4:0]==5'b11110);
  assign mux_170_nl = MUX_s_1_2_2(mux_169_nl, and_506_nl, fsm_output[6]);
  assign nor_212_nl = ~((fsm_output[4:3]!=2'b00));
  assign mux_171_nl = MUX_s_1_2_2(nor_212_nl, and_505_cse, fsm_output[6]);
  assign nor_208_nl = ~((fsm_output[5:3]!=3'b001));
  assign nor_209_nl = ~((fsm_output[4]) | (fsm_output[5]) | (fsm_output[3]) | (~
      (fsm_output[1])));
  assign mux_172_nl = MUX_s_1_2_2(nor_208_nl, nor_209_nl, fsm_output[2]);
  assign nor_210_nl = ~((fsm_output[5:0]!=6'b111011));
  assign mux_173_nl = MUX_s_1_2_2(mux_172_nl, nor_210_nl, fsm_output[6]);
  assign nor_206_nl = ~((fsm_output[0]) | (~ (fsm_output[2])) | (fsm_output[4]) |
      (fsm_output[5]) | (fsm_output[3]));
  assign nor_207_nl = ~((~ (fsm_output[0])) | (fsm_output[2]) | (~((fsm_output[5:3]==3'b111))));
  assign mux_174_nl = MUX_s_1_2_2(nor_206_nl, nor_207_nl, fsm_output[6]);
  assign nor_202_nl = ~((fsm_output[0]) | (fsm_output[7]) | (fsm_output[1]) | (~
      (fsm_output[3])));
  assign nor_203_nl = ~((fsm_output[7]) | (~ (fsm_output[1])) | (fsm_output[3]));
  assign mux_175_nl = MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output[2]);
  assign nor_204_nl = ~((fsm_output[2]) | (fsm_output[0]) | (~ (fsm_output[7])) |
      (fsm_output[1]) | (~ (fsm_output[3])));
  assign mux_176_nl = MUX_s_1_2_2(mux_175_nl, nor_204_nl, fsm_output[4]);
  assign nor_198_nl = ~((~ (fsm_output[2])) | (fsm_output[7]) | (~ (fsm_output[1]))
      | (fsm_output[3]));
  assign nor_199_nl = ~((fsm_output[2]) | (~ (fsm_output[7])) | (fsm_output[1]) |
      (~ (fsm_output[3])));
  assign mux_177_nl = MUX_s_1_2_2(nor_198_nl, nor_199_nl, fsm_output[4]);
  assign or_305_nl = (fsm_output[5]) | (fsm_output[7]) | nand_44_cse;
  assign mux_179_nl = MUX_s_1_2_2(or_tmp_209, or_305_nl, fsm_output[4]);
  assign or_301_nl = (~ (fsm_output[5])) | (~ (fsm_output[7])) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[1]);
  assign mux_178_nl = MUX_s_1_2_2(or_tmp_209, or_301_nl, fsm_output[4]);
  assign mux_180_nl = MUX_s_1_2_2(mux_179_nl, mux_178_nl, fsm_output[0]);
  assign nor_195_nl = ~((fsm_output[5]) | (fsm_output[7]) | (fsm_output[3]) | (fsm_output[6])
      | (~ (fsm_output[1])));
  assign nor_196_nl = ~((fsm_output[5]) | (fsm_output[7]) | nand_44_cse);
  assign mux_181_nl = MUX_s_1_2_2(nor_195_nl, nor_196_nl, fsm_output[4]);
  assign nor_197_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[5])) | (~ (fsm_output[7]))
      | (fsm_output[3]) | (fsm_output[6]) | (fsm_output[1]));
  assign mux_182_nl = MUX_s_1_2_2(mux_181_nl, nor_197_nl, fsm_output[0]);
  assign nor_194_nl = ~((fsm_output[3]) | and_280_cse | (fsm_output[5]) | (fsm_output[7]));
  assign and_501_nl = (fsm_output[5]) & (fsm_output[7]);
  assign mux_184_nl = MUX_s_1_2_2(nor_194_nl, and_501_nl, fsm_output[6]);
  assign and_503_nl = (and_254_cse_1 | (fsm_output[5])) & (fsm_output[7]);
  assign or_311_nl = (fsm_output[3:2]!=2'b00);
  assign mux_183_nl = MUX_s_1_2_2(and_503_nl, (fsm_output[7]), or_311_nl);
  assign and_502_nl = (fsm_output[6]) & mux_183_nl;
  assign mux_185_nl = MUX_s_1_2_2(mux_184_nl, and_502_nl, fsm_output[4]);
  assign nor_184_nl = ~((~((COPY_LOOP_i_12_3_sva_8_0[0]) | COMP_LOOP_f2_COMP_LOOP_f2_nor_5_itm
      | COMP_LOOP_f2_COMP_LOOP_f2_and_17_itm | COMP_LOOP_f2_COMP_LOOP_f2_and_19_itm
      | COMP_LOOP_f2_COMP_LOOP_f2_and_20_itm | COMP_LOOP_f2_COMP_LOOP_f2_and_21_itm
      | (fsm_output[0]))) | (fsm_output[7]));
  assign nor_186_nl = ~((~((~ (COPY_LOOP_i_12_3_sva_8_0[0])) | COMP_LOOP_f2_COMP_LOOP_f2_nor_5_itm
      | COMP_LOOP_f2_COMP_LOOP_f2_and_17_itm | COMP_LOOP_f2_COMP_LOOP_f2_and_19_itm
      | COMP_LOOP_f2_COMP_LOOP_f2_and_20_itm | COMP_LOOP_f2_COMP_LOOP_f2_and_21_itm
      | (fsm_output[0]))) | (fsm_output[7]));
  assign mux_186_nl = MUX_s_1_2_2(nor_184_nl, nor_186_nl, COPY_LOOP_i_12_3_sva_8_0[1]);
  assign nor_188_nl = ~((~(COMP_LOOP_f2_nor_2_cse | COMP_LOOP_f2_COMP_LOOP_f2_nor_5_itm
      | COMP_LOOP_f2_COMP_LOOP_f2_and_17_itm | COMP_LOOP_f2_COMP_LOOP_f2_and_19_itm
      | COMP_LOOP_f2_COMP_LOOP_f2_and_20_itm | COMP_LOOP_f2_COMP_LOOP_f2_and_21_itm
      | (fsm_output[0]))) | (fsm_output[7]));
  assign mux_187_nl = MUX_s_1_2_2(mux_186_nl, nor_188_nl, COPY_LOOP_i_12_3_sva_8_0[2]);
  assign and_499_nl = (~((fsm_output[6]) | (~ (fsm_output[2])))) & mux_187_nl;
  assign nor_191_nl = ~((~ (fsm_output[6])) | (fsm_output[2]) | (fsm_output[0]) |
      (~ (fsm_output[7])));
  assign mux_188_nl = MUX_s_1_2_2(and_499_nl, nor_191_nl, fsm_output[4]);
  assign nor_179_nl = ~(and_254_cse_1 | (~ (fsm_output[3])) | (fsm_output[5]));
  assign nor_180_nl = ~((fsm_output[0]) | (fsm_output[3]) | (~ (fsm_output[5])));
  assign nor_181_nl = ~((fsm_output[3]) | (fsm_output[5]));
  assign mux_189_nl = MUX_s_1_2_2(nor_180_nl, nor_181_nl, fsm_output[1]);
  assign mux_190_nl = MUX_s_1_2_2(nor_179_nl, mux_189_nl, fsm_output[2]);
  assign nor_172_nl = ~((fsm_output[7]) | (fsm_output[6]) | (fsm_output[5]) | (~
      (fsm_output[3])));
  assign mux_193_nl = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[5]);
  assign nor_173_nl = ~((fsm_output[6]) | mux_193_nl);
  assign nor_174_nl = ~((fsm_output[6]) | (fsm_output[5]) | (~ (fsm_output[3])));
  assign mux_194_nl = MUX_s_1_2_2(nor_173_nl, nor_174_nl, fsm_output[0]);
  assign nor_175_nl = ~((fsm_output[6]) | (fsm_output[5]) | (fsm_output[3]));
  assign mux_195_nl = MUX_s_1_2_2(mux_194_nl, nor_175_nl, fsm_output[1]);
  assign mux_196_nl = MUX_s_1_2_2(mux_195_nl, nor_tmp_73, fsm_output[7]);
  assign mux_197_nl = MUX_s_1_2_2(nor_172_nl, mux_196_nl, fsm_output[2]);
  assign or_330_nl = (fsm_output[0]) | (fsm_output[6]) | (fsm_output[5]) | (~ (fsm_output[3]));
  assign or_328_nl = (fsm_output[0]) | (~ (fsm_output[6])) | (fsm_output[5]) | (fsm_output[3]);
  assign mux_191_nl = MUX_s_1_2_2(or_330_nl, or_328_nl, fsm_output[1]);
  assign mux_192_nl = MUX_s_1_2_2((~ nor_tmp_73), mux_191_nl, fsm_output[7]);
  assign nor_176_nl = ~((fsm_output[2]) | mux_192_nl);
  assign mux_198_nl = MUX_s_1_2_2(mux_197_nl, nor_176_nl, fsm_output[4]);
  assign or_358_nl = (~ (fsm_output[3])) | (fsm_output[0]) | (~ (fsm_output[7]))
      | (fsm_output[2]) | (~ (fsm_output[4]));
  assign or_359_nl = (fsm_output[3]) | (fsm_output[0]) | (fsm_output[7]) | (~ (fsm_output[2]))
      | (fsm_output[4]);
  assign mux_201_nl = MUX_s_1_2_2(or_358_nl, or_359_nl, fsm_output[5]);
  assign or_360_nl = (fsm_output[5]) | (fsm_output[3]) | (fsm_output[0]) | (fsm_output[7])
      | (~ (fsm_output[2])) | (fsm_output[4]);
  assign mux_202_nl = MUX_s_1_2_2(mux_201_nl, or_360_nl, fsm_output[1]);
  assign nor_169_nl = ~((fsm_output[3]) | (fsm_output[0]) | (~ (fsm_output[7])) |
      (fsm_output[2]) | (~ (fsm_output[4])));
  assign nor_170_nl = ~((fsm_output[2]) | (~ (fsm_output[4])));
  assign nor_171_nl = ~((~ (fsm_output[2])) | (fsm_output[4]));
  assign mux_199_nl = MUX_s_1_2_2(nor_170_nl, nor_171_nl, fsm_output[7]);
  assign and_496_nl = (fsm_output[3]) & (fsm_output[0]) & mux_199_nl;
  assign mux_200_nl = MUX_s_1_2_2(nor_169_nl, and_496_nl, fsm_output[5]);
  assign nand_42_nl = ~((fsm_output[1]) & mux_200_nl);
  assign mux_203_nl = MUX_s_1_2_2(mux_202_nl, nand_42_nl, fsm_output[6]);
  assign or_350_nl = (fsm_output[1]) | (fsm_output[7]) | (fsm_output[5]) | (~ (fsm_output[0]))
      | (~ (fsm_output[6])) | (fsm_output[4]);
  assign nand_40_nl = ~((fsm_output[7]) & (fsm_output[5]) & (fsm_output[0]) & (~
      (fsm_output[6])) & (fsm_output[4]));
  assign mux_205_nl = MUX_s_1_2_2(nand_40_nl, or_tmp_253, fsm_output[1]);
  assign mux_206_nl = MUX_s_1_2_2(or_350_nl, mux_205_nl, fsm_output[2]);
  assign nand_41_nl = ~((fsm_output[7]) & (fsm_output[5]) & (fsm_output[0]) & (fsm_output[6])
      & (~ (fsm_output[4])));
  assign mux_204_nl = MUX_s_1_2_2(or_tmp_253, nand_41_nl, and_280_cse);
  assign mux_207_nl = MUX_s_1_2_2(mux_206_nl, mux_204_nl, fsm_output[3]);
  assign or_355_nl = (~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[6]);
  assign or_354_nl = (fsm_output[1]) | (fsm_output[2]) | (~ (fsm_output[6]));
  assign mux_209_nl = MUX_s_1_2_2(or_355_nl, or_354_nl, fsm_output[0]);
  assign or_357_nl = (fsm_output[5:3]!=3'b000) | mux_209_nl;
  assign and_494_nl = (fsm_output[3]) & (fsm_output[0]) & (fsm_output[1]) & (fsm_output[2])
      & (fsm_output[6]);
  assign nor_166_nl = ~((fsm_output[3]) | (~ (fsm_output[0])) | (fsm_output[1]) |
      (~ (fsm_output[2])) | (fsm_output[6]));
  assign mux_208_nl = MUX_s_1_2_2(and_494_nl, nor_166_nl, fsm_output[4]);
  assign nand_39_nl = ~((fsm_output[5]) & mux_208_nl);
  assign mux_210_nl = MUX_s_1_2_2(or_357_nl, nand_39_nl, fsm_output[7]);
  assign COMP_LOOP_f2_COMP_LOOP_f2_or_1_nl = COMP_LOOP_f2_nor_14_itm | and_dcpl_270
      | and_dcpl_275 | and_dcpl_282 | and_dcpl_285 | and_dcpl_287 | and_dcpl_242
      | and_dcpl_138 | and_dcpl_295 | and_dcpl_18 | and_dcpl_299;
  assign COMP_LOOP_f2_mux1h_42_nl = MUX1HOT_v_55_8_2((tmp_2_127_64_lpi_3_dfm[63:9]),
      (tmp_4_63_0_lpi_3_dfm[63:9]), (tmp_6_127_64_lpi_3_dfm[63:9]), (COMP_LOOP_6_f2_acc_itm_63_0[63:9]),
      (tmp_63_0_lpi_3_dfm[63:9]), (tmp_8_63_0_lpi_3_dfm[63:9]), (tmp_14_127_64_lpi_3_dfm[63:9]),
      (COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_15_63_0_itm[63:9]), {and_dcpl_270
      , and_dcpl_275 , and_dcpl_282 , and_dcpl_285 , and_dcpl_287 , and_dcpl_242
      , and_dcpl_138 , and_dcpl_295});
  assign COMP_LOOP_f2_and_18_nl = MUX_v_55_2_2(55'b0000000000000000000000000000000000000000000000000000000,
      COMP_LOOP_f2_mux1h_42_nl, COMP_LOOP_f2_nor_14_itm);
  assign COMP_LOOP_f2_or_24_nl = MUX_v_55_2_2(COMP_LOOP_f2_and_18_nl, 55'b1111111111111111111111111111111111111111111111111111111,
      COMP_LOOP_f2_or_18_itm);
  assign COMP_LOOP_f2_mux1h_43_nl = MUX1HOT_v_9_11_2(COPY_LOOP_i_12_3_sva_8_0, COPY_LOOP_1_i_12_3_sva_8_0,
      ({1'b0 , COMP_LOOP_r_10_3_sva}), (tmp_2_127_64_lpi_3_dfm[8:0]), (tmp_4_63_0_lpi_3_dfm[8:0]),
      (tmp_6_127_64_lpi_3_dfm[8:0]), (COMP_LOOP_6_f2_acc_itm_63_0[8:0]), (tmp_63_0_lpi_3_dfm[8:0]),
      (tmp_8_63_0_lpi_3_dfm[8:0]), (tmp_14_127_64_lpi_3_dfm[8:0]), (COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_15_63_0_itm[8:0]),
      {and_dcpl_255 , and_dcpl_262 , and_dcpl_107 , and_dcpl_270 , and_dcpl_275 ,
      and_dcpl_282 , and_dcpl_285 , and_dcpl_287 , and_dcpl_242 , and_dcpl_138 ,
      and_dcpl_295});
  assign COMP_LOOP_f2_or_25_nl = MUX_v_9_2_2(COMP_LOOP_f2_mux1h_43_nl, 9'b111111111,
      COMP_LOOP_f2_or_18_itm);
  assign COMP_LOOP_f2_or_26_nl = (~(and_dcpl_255 | and_dcpl_262 | and_dcpl_107 |
      and_dcpl_18 | and_dcpl_299)) | and_dcpl_270 | and_dcpl_275 | and_dcpl_282 |
      and_dcpl_285 | and_dcpl_287 | and_dcpl_242 | and_dcpl_138 | and_dcpl_295;
  assign COMP_LOOP_f2_or_27_nl = and_dcpl_255 | and_dcpl_262 | and_dcpl_107;
  assign COMP_LOOP_f2_or_28_nl = and_dcpl_270 | and_dcpl_275 | and_dcpl_282 | and_dcpl_285
      | and_dcpl_287 | and_dcpl_242 | and_dcpl_138 | and_dcpl_295;
  assign COMP_LOOP_f2_mux1h_44_nl = MUX1HOT_v_64_3_2(64'b0000000000000000000000000000000000000000000000000000000000000001,
      (~ COMP_LOOP_1_f2_rem_cmp_z), ({60'b000000000000000000000000000000000000000000000000000000000000
      , STAGE_LOOP_base_acc_cse_sva}), {COMP_LOOP_f2_or_27_nl , COMP_LOOP_f2_or_28_nl
      , COMP_LOOP_f2_or_18_itm});
  assign nl_acc_nl = ({COMP_LOOP_f2_COMP_LOOP_f2_or_1_nl , COMP_LOOP_f2_or_24_nl
      , COMP_LOOP_f2_or_25_nl , COMP_LOOP_f2_or_26_nl}) + conv_u2u_65_66({COMP_LOOP_f2_mux1h_44_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[65:0];
  assign z_out = readslicef_66_65_1(acc_nl);
  assign and_510_nl = and_dcpl_11 & and_dcpl_9 & and_dcpl_46 & and_dcpl_60;
  assign and_512_nl = and_dcpl_144 & and_dcpl_79 & and_dcpl_46 & nor_122_cse;
  assign and_513_nl = and_dcpl_136 & and_dcpl_16 & and_dcpl_14 & nor_122_cse;
  assign COMP_LOOP_f2_mux1h_45_nl = MUX1HOT_v_64_8_2(tmp_63_0_lpi_3_dfm, tmp_2_127_64_lpi_3_dfm,
      tmp_4_63_0_lpi_3_dfm, tmp_6_127_64_lpi_3_dfm, tmp_8_63_0_lpi_3_dfm, COMP_LOOP_6_f2_acc_itm_63_0,
      tmp_14_127_64_lpi_3_dfm, COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_15_63_0_itm,
      {and_510_nl , and_dcpl_270 , and_dcpl_275 , and_dcpl_282 , and_512_nl , and_dcpl_285
      , and_513_nl , and_dcpl_295});
  assign nl_z_out_1 = conv_u2u_64_65(COMP_LOOP_f2_mux1h_45_nl) + conv_u2u_64_65(COMP_LOOP_1_f2_rem_cmp_z);
  assign z_out_1 = nl_z_out_1[64:0];
  assign COMP_LOOP_f2_mux1h_46_nl = MUX1HOT_v_64_6_2(COMP_LOOP_5_f2_acc_itm_63_0,
      COMP_LOOP_4_f2_acc_itm_63_0, COMP_LOOP_8_f2_acc_itm_63_0, COMP_LOOP_3_f2_acc_itm_63_0,
      COMP_LOOP_2_f2_acc_itm_63_0, COPY_LOOP_1_i_acc_10_itm_63_0, {and_dcpl_347 ,
      and_dcpl_350 , and_dcpl_353 , and_dcpl_356 , and_dcpl_357 , and_dcpl_360});
  assign COMP_LOOP_f2_mux1h_47_nl = MUX1HOT_v_64_6_2(COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_6_13_63_0_itm,
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_5_11_63_0_itm, COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_3_7_63_0_itm,
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_2_5_63_0_itm, COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_1_3_63_0_itm,
      COPY_LOOP_1_i_acc_12_itm_63_0, {and_dcpl_347 , and_dcpl_350 , and_dcpl_353
      , and_dcpl_356 , and_dcpl_357 , and_dcpl_360});
  assign z_out_2 = conv_u2u_128_128(COMP_LOOP_f2_mux1h_46_nl * COMP_LOOP_f2_mux1h_47_nl);
  assign COMP_LOOP_f2_mux_64_nl = MUX_v_64_2_2(COMP_LOOP_1_f2_acc_itm_63_0, COMP_LOOP_6_f2_acc_itm_63_0,
      and_dcpl_374);
  assign COMP_LOOP_f2_mux_65_nl = MUX_v_64_2_2(COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_4_9_63_0_itm,
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_15_63_0_itm, and_dcpl_374);
  assign z_out_3 = conv_u2u_128_128(COMP_LOOP_f2_mux_64_nl * COMP_LOOP_f2_mux_65_nl);

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


  function automatic [54:0] MUX1HOT_v_55_8_2;
    input [54:0] input_7;
    input [54:0] input_6;
    input [54:0] input_5;
    input [54:0] input_4;
    input [54:0] input_3;
    input [54:0] input_2;
    input [54:0] input_1;
    input [54:0] input_0;
    input [7:0] sel;
    reg [54:0] result;
  begin
    result = input_0 & {55{sel[0]}};
    result = result | ( input_1 & {55{sel[1]}});
    result = result | ( input_2 & {55{sel[2]}});
    result = result | ( input_3 & {55{sel[3]}});
    result = result | ( input_4 & {55{sel[4]}});
    result = result | ( input_5 & {55{sel[5]}});
    result = result | ( input_6 & {55{sel[6]}});
    result = result | ( input_7 & {55{sel[7]}});
    MUX1HOT_v_55_8_2 = result;
  end
  endfunction


  function automatic [62:0] MUX1HOT_v_63_9_2;
    input [62:0] input_8;
    input [62:0] input_7;
    input [62:0] input_6;
    input [62:0] input_5;
    input [62:0] input_4;
    input [62:0] input_3;
    input [62:0] input_2;
    input [62:0] input_1;
    input [62:0] input_0;
    input [8:0] sel;
    reg [62:0] result;
  begin
    result = input_0 & {63{sel[0]}};
    result = result | ( input_1 & {63{sel[1]}});
    result = result | ( input_2 & {63{sel[2]}});
    result = result | ( input_3 & {63{sel[3]}});
    result = result | ( input_4 & {63{sel[4]}});
    result = result | ( input_5 & {63{sel[5]}});
    result = result | ( input_6 & {63{sel[6]}});
    result = result | ( input_7 & {63{sel[7]}});
    result = result | ( input_8 & {63{sel[8]}});
    MUX1HOT_v_63_9_2 = result;
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


  function automatic [63:0] MUX1HOT_v_64_6_2;
    input [63:0] input_5;
    input [63:0] input_4;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [5:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    result = result | ( input_3 & {64{sel[3]}});
    result = result | ( input_4 & {64{sel[4]}});
    result = result | ( input_5 & {64{sel[5]}});
    MUX1HOT_v_64_6_2 = result;
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


  function automatic [64:0] MUX1HOT_v_65_17_2;
    input [64:0] input_16;
    input [64:0] input_15;
    input [64:0] input_14;
    input [64:0] input_13;
    input [64:0] input_12;
    input [64:0] input_11;
    input [64:0] input_10;
    input [64:0] input_9;
    input [64:0] input_8;
    input [64:0] input_7;
    input [64:0] input_6;
    input [64:0] input_5;
    input [64:0] input_4;
    input [64:0] input_3;
    input [64:0] input_2;
    input [64:0] input_1;
    input [64:0] input_0;
    input [16:0] sel;
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
    result = result | ( input_9 & {65{sel[9]}});
    result = result | ( input_10 & {65{sel[10]}});
    result = result | ( input_11 & {65{sel[11]}});
    result = result | ( input_12 & {65{sel[12]}});
    result = result | ( input_13 & {65{sel[13]}});
    result = result | ( input_14 & {65{sel[14]}});
    result = result | ( input_15 & {65{sel[15]}});
    result = result | ( input_16 & {65{sel[16]}});
    MUX1HOT_v_65_17_2 = result;
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


  function automatic [8:0] MUX1HOT_v_9_11_2;
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
    input [10:0] sel;
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
    MUX1HOT_v_9_11_2 = result;
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


  function automatic [64:0] readslicef_66_65_1;
    input [65:0] vector;
    reg [65:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_66_65_1 = tmp[64:0];
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
  wire [127:0] xt_rsc_0_1_i_q_d;
  wire xt_rsc_0_2_i_clken_d;
  wire [127:0] xt_rsc_0_2_i_q_d;
  wire [127:0] xt_rsc_0_3_i_q_d;
  wire xt_rsc_0_4_i_clken_d;
  wire [127:0] xt_rsc_0_4_i_q_d;
  wire [127:0] xt_rsc_0_5_i_q_d;
  wire xt_rsc_0_6_i_clken_d;
  wire [127:0] xt_rsc_0_6_i_q_d;
  wire [127:0] xt_rsc_0_7_i_q_d;
  wire [63:0] vec_rsc_0_0_i_q_d;
  wire [63:0] vec_rsc_0_2_i_q_d;
  wire [63:0] vec_rsc_0_4_i_q_d;
  wire [63:0] vec_rsc_0_6_i_q_d;
  wire [63:0] result_rsc_0_0_i_d_d;
  wire [63:0] result_rsc_0_0_i_q_d;
  wire [8:0] result_rsc_0_0_i_wadr_d;
  wire [63:0] result_rsc_0_1_i_d_d;
  wire [8:0] result_rsc_0_1_i_wadr_d;
  wire [63:0] result_rsc_0_2_i_d_d;
  wire [63:0] result_rsc_0_2_i_q_d;
  wire [8:0] result_rsc_0_2_i_wadr_d;
  wire [63:0] result_rsc_0_3_i_d_d;
  wire [8:0] result_rsc_0_3_i_wadr_d;
  wire [63:0] result_rsc_0_4_i_d_d;
  wire [63:0] result_rsc_0_4_i_q_d;
  wire [8:0] result_rsc_0_4_i_wadr_d;
  wire [63:0] result_rsc_0_5_i_d_d;
  wire [8:0] result_rsc_0_5_i_wadr_d;
  wire [63:0] result_rsc_0_6_i_d_d;
  wire [63:0] result_rsc_0_6_i_q_d;
  wire [8:0] result_rsc_0_6_i_wadr_d;
  wire [63:0] result_rsc_0_7_i_d_d;
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
  wire xt_rsc_0_2_i_we_d_iff;
  wire xt_rsc_0_4_i_we_d_iff;
  wire xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire xt_rsc_0_6_i_we_d_iff;
  wire [8:0] vec_rsc_0_0_i_radr_d_iff;
  wire vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire [8:0] result_rsc_0_0_i_radr_d_iff;
  wire result_rsc_0_0_i_we_d_iff;
  wire result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire result_rsc_0_1_i_we_d_iff;
  wire result_rsc_0_2_i_we_d_iff;
  wire result_rsc_0_3_i_we_d_iff;
  wire result_rsc_0_4_i_we_d_iff;
  wire result_rsc_0_5_i_we_d_iff;
  wire result_rsc_0_6_i_we_d_iff;
  wire result_rsc_0_7_i_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
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
      .clken_d(xt_rsc_0_0_i_clken_d),
      .d_d(xt_rsc_0_1_i_d_d_iff),
      .q_d(xt_rsc_0_1_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_0_i_we_d_iff),
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
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen xt_rsc_0_3_i
      (
      .clken(xt_rsc_0_3_clken),
      .q(xt_rsc_0_3_q),
      .radr(xt_rsc_0_3_radr),
      .we(xt_rsc_0_3_we),
      .d(xt_rsc_0_3_d),
      .wadr(xt_rsc_0_3_wadr),
      .clken_d(xt_rsc_0_2_i_clken_d),
      .d_d(xt_rsc_0_1_i_d_d_iff),
      .q_d(xt_rsc_0_3_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_2_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_2_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
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
      .clken_d(xt_rsc_0_4_i_clken_d),
      .d_d(xt_rsc_0_1_i_d_d_iff),
      .q_d(xt_rsc_0_5_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_4_i_we_d_iff),
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
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen xt_rsc_0_7_i
      (
      .clken(xt_rsc_0_7_clken),
      .q(xt_rsc_0_7_q),
      .radr(xt_rsc_0_7_radr),
      .we(xt_rsc_0_7_we),
      .d(xt_rsc_0_7_d),
      .wadr(xt_rsc_0_7_wadr),
      .clken_d(xt_rsc_0_6_i_clken_d),
      .d_d(xt_rsc_0_1_i_d_d_iff),
      .q_d(xt_rsc_0_7_i_q_d),
      .radr_d(xt_rsc_0_0_i_radr_d_iff),
      .wadr_d(xt_rsc_0_0_i_wadr_d_iff),
      .we_d(xt_rsc_0_6_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xt_rsc_0_6_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
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
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen vec_rsc_0_6_i
      (
      .q(vec_rsc_0_6_q),
      .radr(vec_rsc_0_6_radr),
      .q_d(vec_rsc_0_6_i_q_d),
      .radr_d(vec_rsc_0_0_i_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen result_rsc_0_0_i
      (
      .q(result_rsc_0_0_q),
      .radr(result_rsc_0_0_radr),
      .we(result_rsc_0_0_we),
      .d(result_rsc_0_0_d),
      .wadr(result_rsc_0_0_wadr),
      .d_d(result_rsc_0_0_i_d_d),
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
      .d_d(result_rsc_0_1_i_d_d),
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
      .d_d(result_rsc_0_2_i_d_d),
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
      .d_d(result_rsc_0_3_i_d_d),
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
      .d_d(result_rsc_0_4_i_d_d),
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
      .d_d(result_rsc_0_5_i_d_d),
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
      .d_d(result_rsc_0_6_i_d_d),
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
      .d_d(result_rsc_0_7_i_d_d),
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
      .xt_rsc_0_1_i_q_d(xt_rsc_0_1_i_q_d),
      .xt_rsc_0_2_i_clken_d(xt_rsc_0_2_i_clken_d),
      .xt_rsc_0_2_i_q_d(xt_rsc_0_2_i_q_d),
      .xt_rsc_0_3_i_q_d(xt_rsc_0_3_i_q_d),
      .xt_rsc_0_4_i_clken_d(xt_rsc_0_4_i_clken_d),
      .xt_rsc_0_4_i_q_d(xt_rsc_0_4_i_q_d),
      .xt_rsc_0_5_i_q_d(xt_rsc_0_5_i_q_d),
      .xt_rsc_0_6_i_clken_d(xt_rsc_0_6_i_clken_d),
      .xt_rsc_0_6_i_q_d(xt_rsc_0_6_i_q_d),
      .xt_rsc_0_7_i_q_d(xt_rsc_0_7_i_q_d),
      .vec_rsc_0_0_i_q_d(vec_rsc_0_0_i_q_d),
      .vec_rsc_0_2_i_q_d(vec_rsc_0_2_i_q_d),
      .vec_rsc_0_4_i_q_d(vec_rsc_0_4_i_q_d),
      .vec_rsc_0_6_i_q_d(vec_rsc_0_6_i_q_d),
      .result_rsc_0_0_i_d_d(result_rsc_0_0_i_d_d),
      .result_rsc_0_0_i_q_d(result_rsc_0_0_i_q_d),
      .result_rsc_0_0_i_wadr_d(result_rsc_0_0_i_wadr_d),
      .result_rsc_0_1_i_d_d(result_rsc_0_1_i_d_d),
      .result_rsc_0_1_i_wadr_d(result_rsc_0_1_i_wadr_d),
      .result_rsc_0_2_i_d_d(result_rsc_0_2_i_d_d),
      .result_rsc_0_2_i_q_d(result_rsc_0_2_i_q_d),
      .result_rsc_0_2_i_wadr_d(result_rsc_0_2_i_wadr_d),
      .result_rsc_0_3_i_d_d(result_rsc_0_3_i_d_d),
      .result_rsc_0_3_i_wadr_d(result_rsc_0_3_i_wadr_d),
      .result_rsc_0_4_i_d_d(result_rsc_0_4_i_d_d),
      .result_rsc_0_4_i_q_d(result_rsc_0_4_i_q_d),
      .result_rsc_0_4_i_wadr_d(result_rsc_0_4_i_wadr_d),
      .result_rsc_0_5_i_d_d(result_rsc_0_5_i_d_d),
      .result_rsc_0_5_i_wadr_d(result_rsc_0_5_i_wadr_d),
      .result_rsc_0_6_i_d_d(result_rsc_0_6_i_d_d),
      .result_rsc_0_6_i_q_d(result_rsc_0_6_i_q_d),
      .result_rsc_0_6_i_wadr_d(result_rsc_0_6_i_wadr_d),
      .result_rsc_0_7_i_d_d(result_rsc_0_7_i_d_d),
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
      .xt_rsc_0_0_i_d_d_pff(xt_rsc_0_0_i_d_d_iff),
      .xt_rsc_0_0_i_radr_d_pff(xt_rsc_0_0_i_radr_d_iff),
      .xt_rsc_0_0_i_wadr_d_pff(xt_rsc_0_0_i_wadr_d_iff),
      .xt_rsc_0_0_i_we_d_pff(xt_rsc_0_0_i_we_d_iff),
      .xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff(xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .xt_rsc_0_1_i_d_d_pff(xt_rsc_0_1_i_d_d_iff),
      .xt_rsc_0_2_i_we_d_pff(xt_rsc_0_2_i_we_d_iff),
      .xt_rsc_0_4_i_we_d_pff(xt_rsc_0_4_i_we_d_iff),
      .xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff(xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .xt_rsc_0_6_i_we_d_pff(xt_rsc_0_6_i_we_d_iff),
      .vec_rsc_0_0_i_radr_d_pff(vec_rsc_0_0_i_radr_d_iff),
      .vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff(vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .result_rsc_0_0_i_radr_d_pff(result_rsc_0_0_i_radr_d_iff),
      .result_rsc_0_0_i_we_d_pff(result_rsc_0_0_i_we_d_iff),
      .result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff(result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .result_rsc_0_1_i_we_d_pff(result_rsc_0_1_i_we_d_iff),
      .result_rsc_0_2_i_we_d_pff(result_rsc_0_2_i_we_d_iff),
      .result_rsc_0_3_i_we_d_pff(result_rsc_0_3_i_we_d_iff),
      .result_rsc_0_4_i_we_d_pff(result_rsc_0_4_i_we_d_iff),
      .result_rsc_0_5_i_we_d_pff(result_rsc_0_5_i_we_d_iff),
      .result_rsc_0_6_i_we_d_pff(result_rsc_0_6_i_we_d_iff),
      .result_rsc_0_7_i_we_d_pff(result_rsc_0_7_i_we_d_iff)
    );
endmodule



