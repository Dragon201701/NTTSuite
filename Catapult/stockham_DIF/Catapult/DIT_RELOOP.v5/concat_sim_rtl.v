
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

//------> ../td_ccore_solutions/modulo_dev_0dc217f8ce5f309b848fa994f59fa3f66234_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Wed Aug 18 22:11:42 2021
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
  wire [64:0] rem_2_cmp_z;
  wire [64:0] rem_2_cmp_1_z;
  reg [63:0] rem_2_cmp_b_63_0;
  reg [63:0] rem_2_cmp_1_b_63_0;
  reg [63:0] rem_2_cmp_a_63_0;
  reg [63:0] rem_2_cmp_1_a_63_0;
  wire and_dcpl;
  reg rem_2cyc;
  reg rem_2cyc_st_2;
  reg [63:0] result_sva_1;
  wire and_3_cse;
  wire and_5_cse;
  reg main_stage_0_2;
  reg main_stage_0_3;
  reg [63:0] m_buf_sva_1;
  reg [63:0] m_buf_sva_2;
  reg [63:0] m_buf_sva_3;
  reg asn_itm_1;
  reg asn_itm_2;
  wire and_8_cse;
  wire and_7_cse;

  wire[63:0] qelse_acc_nl;
  wire[64:0] nl_qelse_acc_nl;
  wire[0:0] mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [64:0] nl_rem_2_cmp_a;
  assign nl_rem_2_cmp_a = {{1{rem_2_cmp_a_63_0[63]}}, rem_2_cmp_a_63_0};
  wire [64:0] nl_rem_2_cmp_b;
  assign nl_rem_2_cmp_b = {1'b0 , rem_2_cmp_b_63_0};
  wire [64:0] nl_rem_2_cmp_1_a;
  assign nl_rem_2_cmp_1_a = {{1{rem_2_cmp_1_a_63_0[63]}}, rem_2_cmp_1_a_63_0};
  wire [64:0] nl_rem_2_cmp_1_b;
  assign nl_rem_2_cmp_1_b = {1'b0 , rem_2_cmp_1_b_63_0};
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
  .signd(32'sd1)) rem_2_cmp (
      .a(nl_rem_2_cmp_a[64:0]),
      .b(nl_rem_2_cmp_b[64:0]),
      .z(rem_2_cmp_z)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) rem_2_cmp_1 (
      .a(nl_rem_2_cmp_1_a[64:0]),
      .b(nl_rem_2_cmp_1_b[64:0]),
      .z(rem_2_cmp_1_z)
    );
  assign and_8_cse = ccs_ccore_en & main_stage_0_2 & asn_itm_1;
  assign and_3_cse = ccs_ccore_en & rem_2cyc;
  assign and_5_cse = ccs_ccore_en & (~ rem_2cyc);
  assign and_7_cse = ccs_ccore_en & ccs_ccore_start_rsci_idat;
  assign and_dcpl = main_stage_0_3 & asn_itm_2;
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      return_rsci_d <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      asn_itm_2 <= 1'b0;
      asn_itm_1 <= 1'b0;
      main_stage_0_2 <= 1'b0;
      main_stage_0_3 <= 1'b0;
    end
    else if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_64_2_2(result_sva_1, qelse_acc_nl, result_sva_1[63]);
      asn_itm_2 <= asn_itm_1;
      asn_itm_1 <= ccs_ccore_start_rsci_idat;
      main_stage_0_2 <= 1'b1;
      main_stage_0_3 <= main_stage_0_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      result_sva_1 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ccs_ccore_en & and_dcpl ) begin
      result_sva_1 <= MUX_v_64_2_2((rem_2_cmp_1_z[63:0]), (rem_2_cmp_z[63:0]), rem_2cyc_st_2);
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      m_buf_sva_3 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ccs_ccore_en & mux_2_nl & and_dcpl ) begin
      m_buf_sva_3 <= m_buf_sva_2;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_2cyc_st_2 <= 1'b0;
      m_buf_sva_2 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( and_8_cse ) begin
      rem_2cyc_st_2 <= rem_2cyc;
      m_buf_sva_2 <= m_buf_sva_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_2_cmp_1_b_63_0 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      rem_2_cmp_1_a_63_0 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( and_3_cse ) begin
      rem_2_cmp_1_b_63_0 <= m_rsci_idat;
      rem_2_cmp_1_a_63_0 <= base_rsci_idat;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_2_cmp_b_63_0 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      rem_2_cmp_a_63_0 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( and_5_cse ) begin
      rem_2_cmp_b_63_0 <= m_rsci_idat;
      rem_2_cmp_a_63_0 <= base_rsci_idat;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      rem_2cyc <= 1'b0;
      m_buf_sva_1 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( and_7_cse ) begin
      rem_2cyc <= ~ rem_2cyc;
      m_buf_sva_1 <= m_rsci_idat;
    end
  end
  assign nl_qelse_acc_nl = result_sva_1 + m_buf_sva_3;
  assign qelse_acc_nl = nl_qelse_acc_nl[63:0];
  assign mux_2_nl = MUX_s_1_2_2((rem_2_cmp_1_z[63]), (rem_2_cmp_z[63]), rem_2cyc_st_2);

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

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Wed Aug 18 22:11:53 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_10_1024_1024_64_5_gen
// ------------------------------------------------------------------


module DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_10_1024_1024_64_5_gen
    (
  q, re, radr, radr_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d
);
  input [63:0] q;
  output re;
  output [9:0] radr;
  input [9:0] radr_d;
  input re_d;
  output [63:0] q_d;
  input port_0_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign re = (port_0_r_ram_ir_internal_RMASK_B_d);
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_4_64_10_1024_1024_64_5_gen
// ------------------------------------------------------------------


module DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_4_64_10_1024_1024_64_5_gen
    (
  we, d, wadr, q, re, radr, radr_d, wadr_d, d_d, we_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d,
      port_1_w_ram_ir_internal_WMASK_B_d
);
  output we;
  output [63:0] d;
  output [9:0] wadr;
  input [63:0] q;
  output re;
  output [9:0] radr;
  input [9:0] radr_d;
  input [9:0] wadr_d;
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
//  Design Unit:    DIT_RELOOP_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module DIT_RELOOP_core_core_fsm (
  clk, rst, fsm_output, IDX_LOOP_C_33_tr0, GROUP_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [38:0] fsm_output;
  reg [38:0] fsm_output;
  input IDX_LOOP_C_33_tr0;
  input GROUP_LOOP_C_0_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for DIT_RELOOP_core_core_fsm_1
  parameter
    main_C_0 = 6'd0,
    STAGE_LOOP_C_0 = 6'd1,
    IDX_LOOP_C_0 = 6'd2,
    IDX_LOOP_C_1 = 6'd3,
    IDX_LOOP_C_2 = 6'd4,
    IDX_LOOP_C_3 = 6'd5,
    IDX_LOOP_C_4 = 6'd6,
    IDX_LOOP_C_5 = 6'd7,
    IDX_LOOP_C_6 = 6'd8,
    IDX_LOOP_C_7 = 6'd9,
    IDX_LOOP_C_8 = 6'd10,
    IDX_LOOP_C_9 = 6'd11,
    IDX_LOOP_C_10 = 6'd12,
    IDX_LOOP_C_11 = 6'd13,
    IDX_LOOP_C_12 = 6'd14,
    IDX_LOOP_C_13 = 6'd15,
    IDX_LOOP_C_14 = 6'd16,
    IDX_LOOP_C_15 = 6'd17,
    IDX_LOOP_C_16 = 6'd18,
    IDX_LOOP_C_17 = 6'd19,
    IDX_LOOP_C_18 = 6'd20,
    IDX_LOOP_C_19 = 6'd21,
    IDX_LOOP_C_20 = 6'd22,
    IDX_LOOP_C_21 = 6'd23,
    IDX_LOOP_C_22 = 6'd24,
    IDX_LOOP_C_23 = 6'd25,
    IDX_LOOP_C_24 = 6'd26,
    IDX_LOOP_C_25 = 6'd27,
    IDX_LOOP_C_26 = 6'd28,
    IDX_LOOP_C_27 = 6'd29,
    IDX_LOOP_C_28 = 6'd30,
    IDX_LOOP_C_29 = 6'd31,
    IDX_LOOP_C_30 = 6'd32,
    IDX_LOOP_C_31 = 6'd33,
    IDX_LOOP_C_32 = 6'd34,
    IDX_LOOP_C_33 = 6'd35,
    GROUP_LOOP_C_0 = 6'd36,
    STAGE_LOOP_C_1 = 6'd37,
    main_C_1 = 6'd38;

  reg [5:0] state_var;
  reg [5:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : DIT_RELOOP_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 39'b000000000000000000000000000000000000010;
        state_var_NS = IDX_LOOP_C_0;
      end
      IDX_LOOP_C_0 : begin
        fsm_output = 39'b000000000000000000000000000000000000100;
        state_var_NS = IDX_LOOP_C_1;
      end
      IDX_LOOP_C_1 : begin
        fsm_output = 39'b000000000000000000000000000000000001000;
        state_var_NS = IDX_LOOP_C_2;
      end
      IDX_LOOP_C_2 : begin
        fsm_output = 39'b000000000000000000000000000000000010000;
        state_var_NS = IDX_LOOP_C_3;
      end
      IDX_LOOP_C_3 : begin
        fsm_output = 39'b000000000000000000000000000000000100000;
        state_var_NS = IDX_LOOP_C_4;
      end
      IDX_LOOP_C_4 : begin
        fsm_output = 39'b000000000000000000000000000000001000000;
        state_var_NS = IDX_LOOP_C_5;
      end
      IDX_LOOP_C_5 : begin
        fsm_output = 39'b000000000000000000000000000000010000000;
        state_var_NS = IDX_LOOP_C_6;
      end
      IDX_LOOP_C_6 : begin
        fsm_output = 39'b000000000000000000000000000000100000000;
        state_var_NS = IDX_LOOP_C_7;
      end
      IDX_LOOP_C_7 : begin
        fsm_output = 39'b000000000000000000000000000001000000000;
        state_var_NS = IDX_LOOP_C_8;
      end
      IDX_LOOP_C_8 : begin
        fsm_output = 39'b000000000000000000000000000010000000000;
        state_var_NS = IDX_LOOP_C_9;
      end
      IDX_LOOP_C_9 : begin
        fsm_output = 39'b000000000000000000000000000100000000000;
        state_var_NS = IDX_LOOP_C_10;
      end
      IDX_LOOP_C_10 : begin
        fsm_output = 39'b000000000000000000000000001000000000000;
        state_var_NS = IDX_LOOP_C_11;
      end
      IDX_LOOP_C_11 : begin
        fsm_output = 39'b000000000000000000000000010000000000000;
        state_var_NS = IDX_LOOP_C_12;
      end
      IDX_LOOP_C_12 : begin
        fsm_output = 39'b000000000000000000000000100000000000000;
        state_var_NS = IDX_LOOP_C_13;
      end
      IDX_LOOP_C_13 : begin
        fsm_output = 39'b000000000000000000000001000000000000000;
        state_var_NS = IDX_LOOP_C_14;
      end
      IDX_LOOP_C_14 : begin
        fsm_output = 39'b000000000000000000000010000000000000000;
        state_var_NS = IDX_LOOP_C_15;
      end
      IDX_LOOP_C_15 : begin
        fsm_output = 39'b000000000000000000000100000000000000000;
        state_var_NS = IDX_LOOP_C_16;
      end
      IDX_LOOP_C_16 : begin
        fsm_output = 39'b000000000000000000001000000000000000000;
        state_var_NS = IDX_LOOP_C_17;
      end
      IDX_LOOP_C_17 : begin
        fsm_output = 39'b000000000000000000010000000000000000000;
        state_var_NS = IDX_LOOP_C_18;
      end
      IDX_LOOP_C_18 : begin
        fsm_output = 39'b000000000000000000100000000000000000000;
        state_var_NS = IDX_LOOP_C_19;
      end
      IDX_LOOP_C_19 : begin
        fsm_output = 39'b000000000000000001000000000000000000000;
        state_var_NS = IDX_LOOP_C_20;
      end
      IDX_LOOP_C_20 : begin
        fsm_output = 39'b000000000000000010000000000000000000000;
        state_var_NS = IDX_LOOP_C_21;
      end
      IDX_LOOP_C_21 : begin
        fsm_output = 39'b000000000000000100000000000000000000000;
        state_var_NS = IDX_LOOP_C_22;
      end
      IDX_LOOP_C_22 : begin
        fsm_output = 39'b000000000000001000000000000000000000000;
        state_var_NS = IDX_LOOP_C_23;
      end
      IDX_LOOP_C_23 : begin
        fsm_output = 39'b000000000000010000000000000000000000000;
        state_var_NS = IDX_LOOP_C_24;
      end
      IDX_LOOP_C_24 : begin
        fsm_output = 39'b000000000000100000000000000000000000000;
        state_var_NS = IDX_LOOP_C_25;
      end
      IDX_LOOP_C_25 : begin
        fsm_output = 39'b000000000001000000000000000000000000000;
        state_var_NS = IDX_LOOP_C_26;
      end
      IDX_LOOP_C_26 : begin
        fsm_output = 39'b000000000010000000000000000000000000000;
        state_var_NS = IDX_LOOP_C_27;
      end
      IDX_LOOP_C_27 : begin
        fsm_output = 39'b000000000100000000000000000000000000000;
        state_var_NS = IDX_LOOP_C_28;
      end
      IDX_LOOP_C_28 : begin
        fsm_output = 39'b000000001000000000000000000000000000000;
        state_var_NS = IDX_LOOP_C_29;
      end
      IDX_LOOP_C_29 : begin
        fsm_output = 39'b000000010000000000000000000000000000000;
        state_var_NS = IDX_LOOP_C_30;
      end
      IDX_LOOP_C_30 : begin
        fsm_output = 39'b000000100000000000000000000000000000000;
        state_var_NS = IDX_LOOP_C_31;
      end
      IDX_LOOP_C_31 : begin
        fsm_output = 39'b000001000000000000000000000000000000000;
        state_var_NS = IDX_LOOP_C_32;
      end
      IDX_LOOP_C_32 : begin
        fsm_output = 39'b000010000000000000000000000000000000000;
        state_var_NS = IDX_LOOP_C_33;
      end
      IDX_LOOP_C_33 : begin
        fsm_output = 39'b000100000000000000000000000000000000000;
        if ( IDX_LOOP_C_33_tr0 ) begin
          state_var_NS = GROUP_LOOP_C_0;
        end
        else begin
          state_var_NS = IDX_LOOP_C_0;
        end
      end
      GROUP_LOOP_C_0 : begin
        fsm_output = 39'b001000000000000000000000000000000000000;
        if ( GROUP_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = IDX_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 39'b010000000000000000000000000000000000000;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 39'b100000000000000000000000000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 39'b000000000000000000000000000000000000001;
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
//  Design Unit:    DIT_RELOOP_core_wait_dp
// ------------------------------------------------------------------


module DIT_RELOOP_core_wait_dp (
  ensig_cgo_iro, ensig_cgo, modulo_dev_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo;
  output modulo_dev_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign modulo_dev_cmp_ccs_ccore_en = ensig_cgo | ensig_cgo_iro;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    DIT_RELOOP_core
// ------------------------------------------------------------------


module DIT_RELOOP_core (
  clk, rst, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz, twiddle_rsc_triosy_lz,
      vec_rsci_radr_d, vec_rsci_wadr_d, vec_rsci_d_d, vec_rsci_q_d, twiddle_rsci_radr_d,
      twiddle_rsci_q_d, vec_rsci_we_d_pff, vec_rsci_re_d_pff, twiddle_rsci_re_d_pff
);
  input clk;
  input rst;
  output vec_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output [9:0] vec_rsci_radr_d;
  output [9:0] vec_rsci_wadr_d;
  output [63:0] vec_rsci_d_d;
  input [63:0] vec_rsci_q_d;
  output [9:0] twiddle_rsci_radr_d;
  input [63:0] twiddle_rsci_q_d;
  output vec_rsci_we_d_pff;
  output vec_rsci_re_d_pff;
  output twiddle_rsci_re_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  reg [127:0] IDX_LOOP_IDX_LOOP_rem_1_cmp_a;
  wire [63:0] IDX_LOOP_IDX_LOOP_rem_1_cmp_z;
  wire [63:0] modulo_dev_cmp_return_rsc_z;
  wire modulo_dev_cmp_ccs_ccore_en;
  wire [38:0] fsm_output;
  wire and_dcpl_5;
  wire or_dcpl;
  wire or_tmp_23;
  reg exit_IDX_LOOP_sva;
  reg [63:0] reg_modulo_dev_cmp_m_rsc_dat_cse;
  reg reg_twiddle_rsc_triosy_obj_ld_cse;
  reg reg_ensig_cgo_cse;
  wire GROUP_LOOP_j_or_cse;
  wire or_18_rmff;
  reg [63:0] IDX_LOOP_acc_3_itm;
  wire [9:0] IDX_LOOP_idx2_9_0_sva_mx0w0;
  wire [10:0] nl_IDX_LOOP_idx2_9_0_sva_mx0w0;
  reg [8:0] IDX_LOOP_idx1_acc_psp_sva;
  reg IDX_LOOP_t_slc_IDX_LOOP_t_10_0_0_itm;
  reg [9:0] IDX_LOOP_idx2_9_0_sva;
  reg [9:0] IDX_LOOP_t_10_0_sva_9_0;
  reg [3:0] STAGE_LOOP_gp_acc_psp_sva;
  reg [63:0] p_sva;
  wire [9:0] STAGE_LOOP_op_rshift_itm;
  wire [9:0] z_out;
  wire [127:0] z_out_1;
  wire [10:0] z_out_3;
  wire [11:0] nl_z_out_3;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] STAGE_LOOP_gp_lshift_psp_sva;
  reg [9:0] STAGE_LOOP_op_rshift_psp_1_sva;
  reg [127:0] IDX_LOOP_mul_mut;
  reg [63:0] IDX_LOOP_asn_itm_1;
  reg [9:0] GROUP_LOOP_j_10_0_sva_9_0;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [8:0] IDX_LOOP_idx1_acc_psp_sva_mx0w0;
  wire [9:0] nl_IDX_LOOP_idx1_acc_psp_sva_mx0w0;
  wire STAGE_LOOP_acc_itm_4_1;
  wire z_out_2_10;

  wire[0:0] nor_nl;
  wire[0:0] GROUP_LOOP_j_not_1_nl;
  wire[0:0] GROUP_LOOP_j_not_nl;
  wire[63:0] IDX_LOOP_acc_3_nl;
  wire[64:0] nl_IDX_LOOP_acc_3_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[63:0] IDX_LOOP_mux_11_nl;
  wire[63:0] IDX_LOOP_mux_12_nl;
  wire[11:0] acc_nl;
  wire[12:0] nl_acc_nl;
  wire[9:0] IDX_LOOP_mux_13_nl;
  wire[9:0] STAGE_LOOP_gp_mux1h_5_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[63:0] IDX_LOOP_acc_2_nl;
  wire[64:0] nl_IDX_LOOP_acc_2_nl;
  wire [63:0] nl_modulo_dev_cmp_base_rsc_dat;
  assign nl_IDX_LOOP_acc_2_nl = vec_rsci_q_d - IDX_LOOP_acc_3_itm;
  assign IDX_LOOP_acc_2_nl = nl_IDX_LOOP_acc_2_nl[63:0];
  assign nl_modulo_dev_cmp_base_rsc_dat = MUX_v_64_2_2(IDX_LOOP_acc_2_nl, IDX_LOOP_acc_3_itm,
      fsm_output[5]);
  wire [63:0] nl_modulo_dev_cmp_m_rsc_dat;
  assign nl_modulo_dev_cmp_m_rsc_dat = p_sva;
  wire [9:0] nl_IDX_LOOP_lshift_rg_a;
  assign nl_IDX_LOOP_lshift_rg_a = MUX_v_10_2_2(10'b0000000001, IDX_LOOP_t_10_0_sva_9_0,
      fsm_output[2]);
  wire [3:0] nl_IDX_LOOP_lshift_rg_s;
  assign nl_IDX_LOOP_lshift_rg_s = MUX_v_4_2_2((z_out_3[3:0]), STAGE_LOOP_gp_acc_psp_sva,
      fsm_output[2]);
  wire [0:0] nl_DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0;
  assign nl_DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0 = ~ z_out_2_10;
  wire [0:0] nl_DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = STAGE_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd5),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_obj_ld_cse),
      .lz(vec_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_obj_ld_cse),
      .lz(r_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_obj (
      .ld(reg_twiddle_rsc_triosy_obj_ld_cse),
      .lz(twiddle_rsc_triosy_lz)
    );
  mgc_rem #(.width_a(32'sd128),
  .width_b(32'sd64),
  .signd(32'sd0)) IDX_LOOP_IDX_LOOP_rem_1_cmp (
      .a(IDX_LOOP_IDX_LOOP_rem_1_cmp_a),
      .b(reg_modulo_dev_cmp_m_rsc_dat_cse),
      .z(IDX_LOOP_IDX_LOOP_rem_1_cmp_z)
    );
  modulo_dev  modulo_dev_cmp (
      .base_rsc_dat(nl_modulo_dev_cmp_base_rsc_dat[63:0]),
      .m_rsc_dat(nl_modulo_dev_cmp_m_rsc_dat[63:0]),
      .return_rsc_z(modulo_dev_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(or_dcpl),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(modulo_dev_cmp_ccs_ccore_en)
    );
  mgc_shift_r_v5 #(.width_a(32'sd11),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd10)) STAGE_LOOP_op_rshift_rg (
      .a(11'b10000000000),
      .s(STAGE_LOOP_i_3_0_sva),
      .z(STAGE_LOOP_op_rshift_itm)
    );
  mgc_shift_l_v5 #(.width_a(32'sd10),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd10)) IDX_LOOP_lshift_rg (
      .a(nl_IDX_LOOP_lshift_rg_a[9:0]),
      .s(nl_IDX_LOOP_lshift_rg_s[3:0]),
      .z(z_out)
    );
  DIT_RELOOP_core_wait_dp DIT_RELOOP_core_wait_dp_inst (
      .ensig_cgo_iro(or_18_rmff),
      .ensig_cgo(reg_ensig_cgo_cse),
      .modulo_dev_cmp_ccs_ccore_en(modulo_dev_cmp_ccs_ccore_en)
    );
  DIT_RELOOP_core_core_fsm DIT_RELOOP_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .IDX_LOOP_C_33_tr0(exit_IDX_LOOP_sva),
      .GROUP_LOOP_C_0_tr0(nl_DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_18_rmff = (fsm_output[8:6]!=3'b000) | or_dcpl;
  assign GROUP_LOOP_j_or_cse = (fsm_output[1]) | (fsm_output[36]);
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_IDX_LOOP_idx2_9_0_sva_mx0w0 = ({IDX_LOOP_idx1_acc_psp_sva_mx0w0 , (IDX_LOOP_t_10_0_sva_9_0[0])})
      + STAGE_LOOP_op_rshift_psp_1_sva;
  assign IDX_LOOP_idx2_9_0_sva_mx0w0 = nl_IDX_LOOP_idx2_9_0_sva_mx0w0[9:0];
  assign nl_IDX_LOOP_idx1_acc_psp_sva_mx0w0 = (z_out_1[8:0]) + (IDX_LOOP_t_10_0_sva_9_0[9:1]);
  assign IDX_LOOP_idx1_acc_psp_sva_mx0w0 = nl_IDX_LOOP_idx1_acc_psp_sva_mx0w0[8:0];
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ STAGE_LOOP_i_3_0_sva_2)}) + 5'b01011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign and_dcpl_5 = ~((fsm_output[38]) | (fsm_output[0]));
  assign or_dcpl = (fsm_output[5:4]!=2'b00);
  assign or_tmp_23 = and_dcpl_5 & (~ (fsm_output[37])) & (~ (fsm_output[1]));
  assign vec_rsci_radr_d = MUX_v_10_2_2(IDX_LOOP_idx2_9_0_sva_mx0w0, ({IDX_LOOP_idx1_acc_psp_sva
      , IDX_LOOP_t_slc_IDX_LOOP_t_10_0_0_itm}), fsm_output[3]);
  assign vec_rsci_wadr_d = MUX_v_10_2_2(IDX_LOOP_idx2_9_0_sva, ({IDX_LOOP_idx1_acc_psp_sva
      , IDX_LOOP_t_slc_IDX_LOOP_t_10_0_0_itm}), fsm_output[34]);
  assign vec_rsci_d_d = MUX_v_64_2_2(IDX_LOOP_IDX_LOOP_rem_1_cmp_z, IDX_LOOP_acc_3_itm,
      fsm_output[34]);
  assign vec_rsci_we_d_pff = (fsm_output[34:33]!=2'b00);
  assign vec_rsci_re_d_pff = (fsm_output[3:2]!=2'b00);
  assign twiddle_rsci_re_d_pff = fsm_output[2];
  assign twiddle_rsci_radr_d = z_out;
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_i_3_0_sva <= 4'b0000;
    end
    else if ( (fsm_output[37]) | (fsm_output[0]) ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, fsm_output[37]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      p_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~ and_dcpl_5 ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_modulo_dev_cmp_m_rsc_dat_cse <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      reg_ensig_cgo_cse <= 1'b0;
      IDX_LOOP_IDX_LOOP_rem_1_cmp_a <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      reg_twiddle_rsc_triosy_obj_ld_cse <= 1'b0;
    end
    else begin
      reg_modulo_dev_cmp_m_rsc_dat_cse <= p_sva;
      reg_ensig_cgo_cse <= or_18_rmff;
      IDX_LOOP_IDX_LOOP_rem_1_cmp_a <= MUX_v_128_2_2(z_out_1, IDX_LOOP_mul_mut, nor_nl);
      reg_twiddle_rsc_triosy_obj_ld_cse <= STAGE_LOOP_acc_itm_4_1 & (fsm_output[37]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_gp_lshift_psp_sva <= 10'b0000000000;
    end
    else if ( ~ or_tmp_23 ) begin
      STAGE_LOOP_gp_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      GROUP_LOOP_j_10_0_sva_9_0 <= 10'b0000000000;
    end
    else if ( GROUP_LOOP_j_or_cse ) begin
      GROUP_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (z_out_3[9:0]), GROUP_LOOP_j_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_op_rshift_psp_1_sva <= 10'b0000000000;
    end
    else if ( ~ or_tmp_23 ) begin
      STAGE_LOOP_op_rshift_psp_1_sva <= STAGE_LOOP_op_rshift_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_t_10_0_sva_9_0 <= 10'b0000000000;
    end
    else if ( (fsm_output[37]) | (fsm_output[2]) | (fsm_output[0]) | (fsm_output[36])
        | (fsm_output[38]) | (fsm_output[1]) ) begin
      IDX_LOOP_t_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (z_out_3[9:0]), GROUP_LOOP_j_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_gp_acc_psp_sva <= 4'b0000;
    end
    else if ( ~ or_tmp_23 ) begin
      STAGE_LOOP_gp_acc_psp_sva <= z_out_3[3:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_IDX_LOOP_sva <= 1'b0;
    end
    else if ( fsm_output[2] ) begin
      exit_IDX_LOOP_sva <= ~ z_out_2_10;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_idx1_acc_psp_sva <= 9'b000000000;
    end
    else if ( fsm_output[2] ) begin
      IDX_LOOP_idx1_acc_psp_sva <= IDX_LOOP_idx1_acc_psp_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_t_slc_IDX_LOOP_t_10_0_0_itm <= 1'b0;
    end
    else if ( fsm_output[2] ) begin
      IDX_LOOP_t_slc_IDX_LOOP_t_10_0_0_itm <= IDX_LOOP_t_10_0_sva_9_0[0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_idx2_9_0_sva <= 10'b0000000000;
    end
    else if ( fsm_output[2] ) begin
      IDX_LOOP_idx2_9_0_sva <= IDX_LOOP_idx2_9_0_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_asn_itm_1 <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( fsm_output[3] ) begin
      IDX_LOOP_asn_itm_1 <= twiddle_rsci_q_d;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_acc_3_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( (fsm_output[9]) | (fsm_output[4]) | (fsm_output[3]) ) begin
      IDX_LOOP_acc_3_itm <= MUX1HOT_v_64_3_2(vec_rsci_q_d, IDX_LOOP_acc_3_nl, modulo_dev_cmp_return_rsc_z,
          {(fsm_output[3]) , (fsm_output[4]) , (fsm_output[9])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_mul_mut <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( fsm_output[8] ) begin
      IDX_LOOP_mul_mut <= z_out_1;
    end
  end
  assign nor_nl = ~((fsm_output[35]) | (fsm_output[7]) | (fsm_output[6]) | (fsm_output[38])
      | (fsm_output[0]) | (fsm_output[34]) | (fsm_output[33]) | (fsm_output[8]) |
      (fsm_output[5]) | (fsm_output[2]) | (fsm_output[36]) | (fsm_output[4]) | (fsm_output[3])
      | (fsm_output[37]) | (fsm_output[1]));
  assign GROUP_LOOP_j_not_1_nl = ~ (fsm_output[1]);
  assign GROUP_LOOP_j_not_nl = ~ GROUP_LOOP_j_or_cse;
  assign nl_IDX_LOOP_acc_3_nl = vec_rsci_q_d + IDX_LOOP_acc_3_itm;
  assign IDX_LOOP_acc_3_nl = nl_IDX_LOOP_acc_3_nl[63:0];
  assign IDX_LOOP_mux_11_nl = MUX_v_64_2_2(IDX_LOOP_asn_itm_1, ({55'b0000000000000000000000000000000000000000000000000000000
      , (GROUP_LOOP_j_10_0_sva_9_0[8:0])}), fsm_output[2]);
  assign IDX_LOOP_mux_12_nl = MUX_v_64_2_2(modulo_dev_cmp_return_rsc_z, ({55'b0000000000000000000000000000000000000000000000000000000
      , (STAGE_LOOP_op_rshift_psp_1_sva[8:0])}), fsm_output[2]);
  assign z_out_1 = conv_u2u_128_128(IDX_LOOP_mux_11_nl * IDX_LOOP_mux_12_nl);
  assign IDX_LOOP_mux_13_nl = MUX_v_10_2_2((~ STAGE_LOOP_op_rshift_psp_1_sva), (~
      STAGE_LOOP_gp_lshift_psp_sva), fsm_output[36]);
  assign nl_acc_nl = ({z_out_3 , 1'b1}) + ({1'b1 , IDX_LOOP_mux_13_nl , 1'b1});
  assign acc_nl = nl_acc_nl[11:0];
  assign z_out_2_10 = readslicef_12_1_11(acc_nl);
  assign STAGE_LOOP_gp_mux1h_5_nl = MUX1HOT_v_10_3_2(({6'b000000 , STAGE_LOOP_i_3_0_sva}),
      IDX_LOOP_t_10_0_sva_9_0, GROUP_LOOP_j_10_0_sva_9_0, {(fsm_output[1]) , (fsm_output[2])
      , (fsm_output[36])});
  assign nl_z_out_3 = conv_u2u_10_11(STAGE_LOOP_gp_mux1h_5_nl) + conv_s2u_2_11({(fsm_output[1])
      , 1'b1});
  assign z_out_3 = nl_z_out_3[10:0];

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


  function automatic [127:0] MUX_v_128_2_2;
    input [127:0] input_0;
    input [127:0] input_1;
    input [0:0] sel;
    reg [127:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_128_2_2 = result;
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


  function automatic [0:0] readslicef_12_1_11;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_12_1_11 = tmp[0:0];
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


  function automatic [10:0] conv_s2u_2_11 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_11 = {{9{vector[1]}}, vector};
  end
  endfunction


  function automatic [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
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
//  Design Unit:    DIT_RELOOP
// ------------------------------------------------------------------


module DIT_RELOOP (
  clk, rst, vec_rsc_radr, vec_rsc_re, vec_rsc_q, vec_rsc_wadr, vec_rsc_d, vec_rsc_we,
      vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz,
      twiddle_rsc_radr, twiddle_rsc_re, twiddle_rsc_q, twiddle_rsc_triosy_lz
);
  input clk;
  input rst;
  output [9:0] vec_rsc_radr;
  output vec_rsc_re;
  input [63:0] vec_rsc_q;
  output [9:0] vec_rsc_wadr;
  output [63:0] vec_rsc_d;
  output vec_rsc_we;
  output vec_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [9:0] twiddle_rsc_radr;
  output twiddle_rsc_re;
  input [63:0] twiddle_rsc_q;
  output twiddle_rsc_triosy_lz;


  // Interconnect Declarations
  wire [9:0] vec_rsci_radr_d;
  wire [9:0] vec_rsci_wadr_d;
  wire [63:0] vec_rsci_d_d;
  wire [63:0] vec_rsci_q_d;
  wire [9:0] twiddle_rsci_radr_d;
  wire [63:0] twiddle_rsci_q_d;
  wire vec_rsci_we_d_iff;
  wire vec_rsci_re_d_iff;
  wire twiddle_rsci_re_d_iff;


  // Interconnect Declarations for Component Instantiations 
  DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_4_64_10_1024_1024_64_5_gen vec_rsci
      (
      .we(vec_rsc_we),
      .d(vec_rsc_d),
      .wadr(vec_rsc_wadr),
      .q(vec_rsc_q),
      .re(vec_rsc_re),
      .radr(vec_rsc_radr),
      .radr_d(vec_rsci_radr_d),
      .wadr_d(vec_rsci_wadr_d),
      .d_d(vec_rsci_d_d),
      .we_d(vec_rsci_we_d_iff),
      .re_d(vec_rsci_re_d_iff),
      .q_d(vec_rsci_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(vec_rsci_re_d_iff),
      .port_1_w_ram_ir_internal_WMASK_B_d(vec_rsci_we_d_iff)
    );
  DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_10_1024_1024_64_5_gen twiddle_rsci
      (
      .q(twiddle_rsc_q),
      .re(twiddle_rsc_re),
      .radr(twiddle_rsc_radr),
      .radr_d(twiddle_rsci_radr_d),
      .re_d(twiddle_rsci_re_d_iff),
      .q_d(twiddle_rsci_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_re_d_iff)
    );
  DIT_RELOOP_core DIT_RELOOP_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .vec_rsci_radr_d(vec_rsci_radr_d),
      .vec_rsci_wadr_d(vec_rsci_wadr_d),
      .vec_rsci_d_d(vec_rsci_d_d),
      .vec_rsci_q_d(vec_rsci_q_d),
      .twiddle_rsci_radr_d(twiddle_rsci_radr_d),
      .twiddle_rsci_q_d(twiddle_rsci_q_d),
      .vec_rsci_we_d_pff(vec_rsci_we_d_iff),
      .vec_rsci_re_d_pff(vec_rsci_re_d_iff),
      .twiddle_rsci_re_d_pff(twiddle_rsci_re_d_iff)
    );
endmodule



