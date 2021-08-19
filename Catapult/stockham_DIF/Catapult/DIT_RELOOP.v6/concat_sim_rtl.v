
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
//  Generated date: Wed Aug 18 22:19:21 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen
// ------------------------------------------------------------------


module DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen
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
//  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen
// ------------------------------------------------------------------


module DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen
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
//  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen
// ------------------------------------------------------------------


module DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen
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
//  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen
// ------------------------------------------------------------------


module DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen
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
//  Design Unit:    DIT_RELOOP_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module DIT_RELOOP_core_core_fsm (
  clk, rst, fsm_output, IDX_LOOP_C_33_tr0, IDX_LOOP_C_65_tr0, GROUP_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  output [6:0] fsm_output;
  reg [6:0] fsm_output;
  input IDX_LOOP_C_33_tr0;
  input IDX_LOOP_C_65_tr0;
  input GROUP_LOOP_C_0_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for DIT_RELOOP_core_core_fsm_1
  parameter
    main_C_0 = 7'd0,
    STAGE_LOOP_C_0 = 7'd1,
    IDX_LOOP_C_0 = 7'd2,
    IDX_LOOP_C_1 = 7'd3,
    IDX_LOOP_C_2 = 7'd4,
    IDX_LOOP_C_3 = 7'd5,
    IDX_LOOP_C_4 = 7'd6,
    IDX_LOOP_C_5 = 7'd7,
    IDX_LOOP_C_6 = 7'd8,
    IDX_LOOP_C_7 = 7'd9,
    IDX_LOOP_C_8 = 7'd10,
    IDX_LOOP_C_9 = 7'd11,
    IDX_LOOP_C_10 = 7'd12,
    IDX_LOOP_C_11 = 7'd13,
    IDX_LOOP_C_12 = 7'd14,
    IDX_LOOP_C_13 = 7'd15,
    IDX_LOOP_C_14 = 7'd16,
    IDX_LOOP_C_15 = 7'd17,
    IDX_LOOP_C_16 = 7'd18,
    IDX_LOOP_C_17 = 7'd19,
    IDX_LOOP_C_18 = 7'd20,
    IDX_LOOP_C_19 = 7'd21,
    IDX_LOOP_C_20 = 7'd22,
    IDX_LOOP_C_21 = 7'd23,
    IDX_LOOP_C_22 = 7'd24,
    IDX_LOOP_C_23 = 7'd25,
    IDX_LOOP_C_24 = 7'd26,
    IDX_LOOP_C_25 = 7'd27,
    IDX_LOOP_C_26 = 7'd28,
    IDX_LOOP_C_27 = 7'd29,
    IDX_LOOP_C_28 = 7'd30,
    IDX_LOOP_C_29 = 7'd31,
    IDX_LOOP_C_30 = 7'd32,
    IDX_LOOP_C_31 = 7'd33,
    IDX_LOOP_C_32 = 7'd34,
    IDX_LOOP_C_33 = 7'd35,
    IDX_LOOP_C_34 = 7'd36,
    IDX_LOOP_C_35 = 7'd37,
    IDX_LOOP_C_36 = 7'd38,
    IDX_LOOP_C_37 = 7'd39,
    IDX_LOOP_C_38 = 7'd40,
    IDX_LOOP_C_39 = 7'd41,
    IDX_LOOP_C_40 = 7'd42,
    IDX_LOOP_C_41 = 7'd43,
    IDX_LOOP_C_42 = 7'd44,
    IDX_LOOP_C_43 = 7'd45,
    IDX_LOOP_C_44 = 7'd46,
    IDX_LOOP_C_45 = 7'd47,
    IDX_LOOP_C_46 = 7'd48,
    IDX_LOOP_C_47 = 7'd49,
    IDX_LOOP_C_48 = 7'd50,
    IDX_LOOP_C_49 = 7'd51,
    IDX_LOOP_C_50 = 7'd52,
    IDX_LOOP_C_51 = 7'd53,
    IDX_LOOP_C_52 = 7'd54,
    IDX_LOOP_C_53 = 7'd55,
    IDX_LOOP_C_54 = 7'd56,
    IDX_LOOP_C_55 = 7'd57,
    IDX_LOOP_C_56 = 7'd58,
    IDX_LOOP_C_57 = 7'd59,
    IDX_LOOP_C_58 = 7'd60,
    IDX_LOOP_C_59 = 7'd61,
    IDX_LOOP_C_60 = 7'd62,
    IDX_LOOP_C_61 = 7'd63,
    IDX_LOOP_C_62 = 7'd64,
    IDX_LOOP_C_63 = 7'd65,
    IDX_LOOP_C_64 = 7'd66,
    IDX_LOOP_C_65 = 7'd67,
    GROUP_LOOP_C_0 = 7'd68,
    STAGE_LOOP_C_1 = 7'd69,
    main_C_1 = 7'd70;

  reg [6:0] state_var;
  reg [6:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : DIT_RELOOP_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 7'b0000001;
        state_var_NS = IDX_LOOP_C_0;
      end
      IDX_LOOP_C_0 : begin
        fsm_output = 7'b0000010;
        state_var_NS = IDX_LOOP_C_1;
      end
      IDX_LOOP_C_1 : begin
        fsm_output = 7'b0000011;
        state_var_NS = IDX_LOOP_C_2;
      end
      IDX_LOOP_C_2 : begin
        fsm_output = 7'b0000100;
        state_var_NS = IDX_LOOP_C_3;
      end
      IDX_LOOP_C_3 : begin
        fsm_output = 7'b0000101;
        state_var_NS = IDX_LOOP_C_4;
      end
      IDX_LOOP_C_4 : begin
        fsm_output = 7'b0000110;
        state_var_NS = IDX_LOOP_C_5;
      end
      IDX_LOOP_C_5 : begin
        fsm_output = 7'b0000111;
        state_var_NS = IDX_LOOP_C_6;
      end
      IDX_LOOP_C_6 : begin
        fsm_output = 7'b0001000;
        state_var_NS = IDX_LOOP_C_7;
      end
      IDX_LOOP_C_7 : begin
        fsm_output = 7'b0001001;
        state_var_NS = IDX_LOOP_C_8;
      end
      IDX_LOOP_C_8 : begin
        fsm_output = 7'b0001010;
        state_var_NS = IDX_LOOP_C_9;
      end
      IDX_LOOP_C_9 : begin
        fsm_output = 7'b0001011;
        state_var_NS = IDX_LOOP_C_10;
      end
      IDX_LOOP_C_10 : begin
        fsm_output = 7'b0001100;
        state_var_NS = IDX_LOOP_C_11;
      end
      IDX_LOOP_C_11 : begin
        fsm_output = 7'b0001101;
        state_var_NS = IDX_LOOP_C_12;
      end
      IDX_LOOP_C_12 : begin
        fsm_output = 7'b0001110;
        state_var_NS = IDX_LOOP_C_13;
      end
      IDX_LOOP_C_13 : begin
        fsm_output = 7'b0001111;
        state_var_NS = IDX_LOOP_C_14;
      end
      IDX_LOOP_C_14 : begin
        fsm_output = 7'b0010000;
        state_var_NS = IDX_LOOP_C_15;
      end
      IDX_LOOP_C_15 : begin
        fsm_output = 7'b0010001;
        state_var_NS = IDX_LOOP_C_16;
      end
      IDX_LOOP_C_16 : begin
        fsm_output = 7'b0010010;
        state_var_NS = IDX_LOOP_C_17;
      end
      IDX_LOOP_C_17 : begin
        fsm_output = 7'b0010011;
        state_var_NS = IDX_LOOP_C_18;
      end
      IDX_LOOP_C_18 : begin
        fsm_output = 7'b0010100;
        state_var_NS = IDX_LOOP_C_19;
      end
      IDX_LOOP_C_19 : begin
        fsm_output = 7'b0010101;
        state_var_NS = IDX_LOOP_C_20;
      end
      IDX_LOOP_C_20 : begin
        fsm_output = 7'b0010110;
        state_var_NS = IDX_LOOP_C_21;
      end
      IDX_LOOP_C_21 : begin
        fsm_output = 7'b0010111;
        state_var_NS = IDX_LOOP_C_22;
      end
      IDX_LOOP_C_22 : begin
        fsm_output = 7'b0011000;
        state_var_NS = IDX_LOOP_C_23;
      end
      IDX_LOOP_C_23 : begin
        fsm_output = 7'b0011001;
        state_var_NS = IDX_LOOP_C_24;
      end
      IDX_LOOP_C_24 : begin
        fsm_output = 7'b0011010;
        state_var_NS = IDX_LOOP_C_25;
      end
      IDX_LOOP_C_25 : begin
        fsm_output = 7'b0011011;
        state_var_NS = IDX_LOOP_C_26;
      end
      IDX_LOOP_C_26 : begin
        fsm_output = 7'b0011100;
        state_var_NS = IDX_LOOP_C_27;
      end
      IDX_LOOP_C_27 : begin
        fsm_output = 7'b0011101;
        state_var_NS = IDX_LOOP_C_28;
      end
      IDX_LOOP_C_28 : begin
        fsm_output = 7'b0011110;
        state_var_NS = IDX_LOOP_C_29;
      end
      IDX_LOOP_C_29 : begin
        fsm_output = 7'b0011111;
        state_var_NS = IDX_LOOP_C_30;
      end
      IDX_LOOP_C_30 : begin
        fsm_output = 7'b0100000;
        state_var_NS = IDX_LOOP_C_31;
      end
      IDX_LOOP_C_31 : begin
        fsm_output = 7'b0100001;
        state_var_NS = IDX_LOOP_C_32;
      end
      IDX_LOOP_C_32 : begin
        fsm_output = 7'b0100010;
        state_var_NS = IDX_LOOP_C_33;
      end
      IDX_LOOP_C_33 : begin
        fsm_output = 7'b0100011;
        if ( IDX_LOOP_C_33_tr0 ) begin
          state_var_NS = GROUP_LOOP_C_0;
        end
        else begin
          state_var_NS = IDX_LOOP_C_34;
        end
      end
      IDX_LOOP_C_34 : begin
        fsm_output = 7'b0100100;
        state_var_NS = IDX_LOOP_C_35;
      end
      IDX_LOOP_C_35 : begin
        fsm_output = 7'b0100101;
        state_var_NS = IDX_LOOP_C_36;
      end
      IDX_LOOP_C_36 : begin
        fsm_output = 7'b0100110;
        state_var_NS = IDX_LOOP_C_37;
      end
      IDX_LOOP_C_37 : begin
        fsm_output = 7'b0100111;
        state_var_NS = IDX_LOOP_C_38;
      end
      IDX_LOOP_C_38 : begin
        fsm_output = 7'b0101000;
        state_var_NS = IDX_LOOP_C_39;
      end
      IDX_LOOP_C_39 : begin
        fsm_output = 7'b0101001;
        state_var_NS = IDX_LOOP_C_40;
      end
      IDX_LOOP_C_40 : begin
        fsm_output = 7'b0101010;
        state_var_NS = IDX_LOOP_C_41;
      end
      IDX_LOOP_C_41 : begin
        fsm_output = 7'b0101011;
        state_var_NS = IDX_LOOP_C_42;
      end
      IDX_LOOP_C_42 : begin
        fsm_output = 7'b0101100;
        state_var_NS = IDX_LOOP_C_43;
      end
      IDX_LOOP_C_43 : begin
        fsm_output = 7'b0101101;
        state_var_NS = IDX_LOOP_C_44;
      end
      IDX_LOOP_C_44 : begin
        fsm_output = 7'b0101110;
        state_var_NS = IDX_LOOP_C_45;
      end
      IDX_LOOP_C_45 : begin
        fsm_output = 7'b0101111;
        state_var_NS = IDX_LOOP_C_46;
      end
      IDX_LOOP_C_46 : begin
        fsm_output = 7'b0110000;
        state_var_NS = IDX_LOOP_C_47;
      end
      IDX_LOOP_C_47 : begin
        fsm_output = 7'b0110001;
        state_var_NS = IDX_LOOP_C_48;
      end
      IDX_LOOP_C_48 : begin
        fsm_output = 7'b0110010;
        state_var_NS = IDX_LOOP_C_49;
      end
      IDX_LOOP_C_49 : begin
        fsm_output = 7'b0110011;
        state_var_NS = IDX_LOOP_C_50;
      end
      IDX_LOOP_C_50 : begin
        fsm_output = 7'b0110100;
        state_var_NS = IDX_LOOP_C_51;
      end
      IDX_LOOP_C_51 : begin
        fsm_output = 7'b0110101;
        state_var_NS = IDX_LOOP_C_52;
      end
      IDX_LOOP_C_52 : begin
        fsm_output = 7'b0110110;
        state_var_NS = IDX_LOOP_C_53;
      end
      IDX_LOOP_C_53 : begin
        fsm_output = 7'b0110111;
        state_var_NS = IDX_LOOP_C_54;
      end
      IDX_LOOP_C_54 : begin
        fsm_output = 7'b0111000;
        state_var_NS = IDX_LOOP_C_55;
      end
      IDX_LOOP_C_55 : begin
        fsm_output = 7'b0111001;
        state_var_NS = IDX_LOOP_C_56;
      end
      IDX_LOOP_C_56 : begin
        fsm_output = 7'b0111010;
        state_var_NS = IDX_LOOP_C_57;
      end
      IDX_LOOP_C_57 : begin
        fsm_output = 7'b0111011;
        state_var_NS = IDX_LOOP_C_58;
      end
      IDX_LOOP_C_58 : begin
        fsm_output = 7'b0111100;
        state_var_NS = IDX_LOOP_C_59;
      end
      IDX_LOOP_C_59 : begin
        fsm_output = 7'b0111101;
        state_var_NS = IDX_LOOP_C_60;
      end
      IDX_LOOP_C_60 : begin
        fsm_output = 7'b0111110;
        state_var_NS = IDX_LOOP_C_61;
      end
      IDX_LOOP_C_61 : begin
        fsm_output = 7'b0111111;
        state_var_NS = IDX_LOOP_C_62;
      end
      IDX_LOOP_C_62 : begin
        fsm_output = 7'b1000000;
        state_var_NS = IDX_LOOP_C_63;
      end
      IDX_LOOP_C_63 : begin
        fsm_output = 7'b1000001;
        state_var_NS = IDX_LOOP_C_64;
      end
      IDX_LOOP_C_64 : begin
        fsm_output = 7'b1000010;
        state_var_NS = IDX_LOOP_C_65;
      end
      IDX_LOOP_C_65 : begin
        fsm_output = 7'b1000011;
        if ( IDX_LOOP_C_65_tr0 ) begin
          state_var_NS = GROUP_LOOP_C_0;
        end
        else begin
          state_var_NS = IDX_LOOP_C_0;
        end
      end
      GROUP_LOOP_C_0 : begin
        fsm_output = 7'b1000100;
        if ( GROUP_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = IDX_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 7'b1000101;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 7'b1000110;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 7'b0000000;
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
  ensig_cgo_iro, ensig_cgo, IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo;
  output IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en = ensig_cgo | ensig_cgo_iro;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    DIT_RELOOP_core
// ------------------------------------------------------------------


module DIT_RELOOP_core (
  clk, rst, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_triosy_lz, twiddle_rsc_triosy_0_0_lz, twiddle_rsc_triosy_0_1_lz, vec_rsc_0_0_i_radr_d,
      vec_rsc_0_0_i_wadr_d, vec_rsc_0_0_i_d_d, vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_radr_d,
      vec_rsc_0_1_i_wadr_d, vec_rsc_0_1_i_d_d, vec_rsc_0_1_i_q_d, twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_q_d, vec_rsc_0_0_i_we_d_pff, vec_rsc_0_0_i_re_d_pff, vec_rsc_0_1_i_we_d_pff,
      vec_rsc_0_1_i_re_d_pff, twiddle_rsc_0_0_i_radr_d_pff, twiddle_rsc_0_0_i_re_d_pff,
      twiddle_rsc_0_1_i_re_d_pff
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
  output [8:0] vec_rsc_0_0_i_radr_d;
  output [8:0] vec_rsc_0_0_i_wadr_d;
  output [63:0] vec_rsc_0_0_i_d_d;
  input [63:0] vec_rsc_0_0_i_q_d;
  output [8:0] vec_rsc_0_1_i_radr_d;
  output [8:0] vec_rsc_0_1_i_wadr_d;
  output [63:0] vec_rsc_0_1_i_d_d;
  input [63:0] vec_rsc_0_1_i_q_d;
  input [63:0] twiddle_rsc_0_0_i_q_d;
  input [63:0] twiddle_rsc_0_1_i_q_d;
  output vec_rsc_0_0_i_we_d_pff;
  output vec_rsc_0_0_i_re_d_pff;
  output vec_rsc_0_1_i_we_d_pff;
  output vec_rsc_0_1_i_re_d_pff;
  output [8:0] twiddle_rsc_0_0_i_radr_d_pff;
  output twiddle_rsc_0_0_i_re_d_pff;
  output twiddle_rsc_0_1_i_re_d_pff;


  // Interconnect Declarations
  wire [63:0] p_rsci_idat;
  reg [127:0] IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a;
  wire [63:0] IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z;
  wire [63:0] IDX_LOOP_1_modulo_dev_cmp_return_rsc_z;
  wire IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en;
  wire [6:0] fsm_output;
  wire or_tmp;
  wire or_tmp_4;
  wire or_tmp_9;
  wire or_tmp_13;
  wire and_dcpl_5;
  wire and_dcpl_6;
  wire and_dcpl_7;
  wire and_dcpl_9;
  wire and_dcpl_11;
  wire and_dcpl_12;
  wire and_dcpl_14;
  wire or_dcpl_1;
  wire and_dcpl_19;
  wire and_dcpl_23;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_44;
  wire and_dcpl_48;
  wire or_tmp_31;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_53;
  wire and_dcpl_54;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire not_tmp_46;
  wire or_dcpl_9;
  wire and_dcpl_67;
  wire and_dcpl_73;
  reg IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm;
  reg IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm;
  wire [8:0] IDX_LOOP_idx1_acc_psp_1_sva_mx0w0;
  wire [9:0] nl_IDX_LOOP_idx1_acc_psp_1_sva_mx0w0;
  reg [9:0] STAGE_LOOP_op_rshift_psp_1_sva;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] IDX_LOOP_idx2_9_0_sva;
  wire [10:0] nl_IDX_LOOP_idx2_9_0_sva;
  reg [8:0] reg_IDX_LOOP_t_10_1_ftd_1;
  reg reg_IDX_LOOP_1_lshift_idiv_ftd_9;
  reg [63:0] reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse;
  wire or_72_cse;
  reg reg_twiddle_rsc_triosy_0_0_obj_ld_cse;
  reg reg_ensig_cgo_cse;
  wire nor_17_cse;
  wire mux_12_cse;
  wire nor_27_rmff;
  reg [63:0] tmp_1_lpi_4_dfm;
  reg [63:0] IDX_LOOP_f1_1_sva;
  wire [8:0] IDX_LOOP_idx2_acc_psp_sva_1;
  wire [9:0] nl_IDX_LOOP_idx2_acc_psp_sva_1;
  reg [8:0] IDX_LOOP_idx1_acc_psp_1_sva;
  reg [8:0] IDX_LOOP_idx2_acc_psp_sva;
  reg [63:0] p_sva;
  wire [9:0] STAGE_LOOP_op_rshift_itm;
  wire [10:0] z_out;
  wire and_dcpl_116;
  wire [9:0] z_out_2;
  wire [10:0] nl_z_out_2;
  wire and_dcpl_117;
  wire and_dcpl_118;
  wire and_dcpl_121;
  wire and_dcpl_128;
  wire [127:0] z_out_3;
  wire and_dcpl_130;
  wire and_dcpl_138;
  wire and_dcpl_139;
  wire and_dcpl_140;
  wire [9:0] z_out_4;
  wire and_dcpl_146;
  wire and_dcpl_150;
  wire and_dcpl_152;
  reg [3:0] STAGE_LOOP_gp_acc_psp_sva;
  reg [9:0] STAGE_LOOP_gp_lshift_psp_sva;
  reg [127:0] IDX_LOOP_1_mul_mut;
  reg [63:0] IDX_LOOP_mux_10_itm;
  reg [63:0] IDX_LOOP_mux_1_itm;
  reg [9:0] GROUP_LOOP_j_10_0_sva_9_0;
  reg [8:0] IDX_LOOP_t_10_1_sva_8_0;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire GROUP_LOOP_j_10_0_sva_9_0_mx0c0;
  wire tmp_1_lpi_4_dfm_mx0c1;
  wire IDX_LOOP_mux_10_itm_mx0c1;
  wire IDX_LOOP_f1_1_sva_mx0c1;
  wire and_144_ssc;
  wire and_104_cse;
  wire or_74_cse;
  wire STAGE_LOOP_acc_itm_4_1;
  wire z_out_1_10;

  wire[0:0] mux_34_nl;
  wire[0:0] mux_33_nl;
  wire[0:0] or_26_nl;
  wire[0:0] or_25_nl;
  wire[0:0] mux_38_nl;
  wire[0:0] mux_37_nl;
  wire[0:0] mux_36_nl;
  wire[0:0] or_30_nl;
  wire[0:0] mux_35_nl;
  wire[0:0] or_28_nl;
  wire[0:0] GROUP_LOOP_j_not_1_nl;
  wire[0:0] or_73_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] or_41_nl;
  wire[0:0] or_40_nl;
  wire[0:0] mux_nl;
  wire[0:0] or_77_nl;
  wire[0:0] nor_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] nor_8_nl;
  wire[0:0] nor_9_nl;
  wire[0:0] and_85_nl;
  wire[0:0] mux_64_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] mux_62_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] mux_23_nl;
  wire[0:0] mux_57_nl;
  wire[0:0] and_87_nl;
  wire[0:0] nor_7_nl;
  wire[0:0] and_42_nl;
  wire[0:0] mux_44_nl;
  wire[0:0] mux_43_nl;
  wire[0:0] and_88_nl;
  wire[0:0] nor_10_nl;
  wire[0:0] nor_11_nl;
  wire[0:0] mux_46_nl;
  wire[0:0] mux_45_nl;
  wire[0:0] nor_6_nl;
  wire[0:0] mux_41_nl;
  wire[0:0] and_90_nl;
  wire[0:0] mux_40_nl;
  wire[0:0] nor_12_nl;
  wire[0:0] nor_13_nl;
  wire[0:0] mux_42_nl;
  wire[0:0] and_89_nl;
  wire[11:0] acc_nl;
  wire[12:0] nl_acc_nl;
  wire[9:0] IDX_LOOP_mux_13_nl;
  wire[0:0] IDX_LOOP_IDX_LOOP_nand_1_nl;
  wire[8:0] IDX_LOOP_IDX_LOOP_and_1_nl;
  wire[0:0] not_218_nl;
  wire[11:0] acc_1_nl;
  wire[12:0] nl_acc_1_nl;
  wire[10:0] IDX_LOOP_mux_14_nl;
  wire[9:0] IDX_LOOP_mux_15_nl;
  wire[8:0] STAGE_LOOP_gp_mux_5_nl;
  wire[63:0] IDX_LOOP_mux1h_11_nl;
  wire[0:0] and_164_nl;
  wire[0:0] and_165_nl;
  wire[63:0] IDX_LOOP_mux_16_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[64:0] acc_3_nl;
  wire[65:0] nl_acc_3_nl;
  wire[63:0] IDX_LOOP_mux_17_nl;
  wire[0:0] IDX_LOOP_or_7_nl;
  wire[0:0] IDX_LOOP_or_8_nl;
  wire[63:0] IDX_LOOP_mux1h_12_nl;
  wire[63:0] IDX_LOOP_f1_mux_1_nl;
  wire [63:0] nl_IDX_LOOP_1_modulo_dev_cmp_base_rsc_dat;
  assign IDX_LOOP_or_7_nl = and_dcpl_150 | and_dcpl_152;
  assign IDX_LOOP_mux_17_nl = MUX_v_64_2_2(vec_rsc_0_0_i_q_d, IDX_LOOP_f1_1_sva,
      IDX_LOOP_or_7_nl);
  assign IDX_LOOP_or_8_nl = (~ and_dcpl_150) | and_dcpl_146 | and_dcpl_152;
  assign IDX_LOOP_f1_mux_1_nl = MUX_v_64_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
      IDX_LOOP_idx2_9_0_sva[0]);
  assign IDX_LOOP_mux1h_12_nl = MUX1HOT_v_64_3_2((~ tmp_1_lpi_4_dfm), tmp_1_lpi_4_dfm,
      (~ IDX_LOOP_f1_mux_1_nl), {and_dcpl_146 , and_dcpl_150 , and_dcpl_152});
  assign nl_acc_3_nl = ({IDX_LOOP_mux_17_nl , IDX_LOOP_or_8_nl}) + ({IDX_LOOP_mux1h_12_nl
      , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[64:0];
  assign nl_IDX_LOOP_1_modulo_dev_cmp_base_rsc_dat = readslicef_65_64_1(acc_3_nl);
  wire [63:0] nl_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat;
  assign nl_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat = p_sva;
  wire [0:0] nl_IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat;
  assign nl_IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat = nor_17_cse & (~ (fsm_output[1]))
      & (fsm_output[2]) & (~ (fsm_output[6]));
  wire[8:0] STAGE_LOOP_gp_STAGE_LOOP_gp_and_nl;
  wire[0:0] STAGE_LOOP_gp_not_1_nl;
  wire[0:0] STAGE_LOOP_gp_STAGE_LOOP_gp_or_nl;
  wire [9:0] nl_IDX_LOOP_1_lshift_rg_a;
  assign STAGE_LOOP_gp_not_1_nl = ~ and_144_ssc;
  assign STAGE_LOOP_gp_STAGE_LOOP_gp_and_nl = MUX_v_9_2_2(9'b000000000, IDX_LOOP_t_10_1_sva_8_0,
      STAGE_LOOP_gp_not_1_nl);
  assign STAGE_LOOP_gp_STAGE_LOOP_gp_or_nl = (~ and_dcpl_139) | and_144_ssc | and_dcpl_140;
  assign nl_IDX_LOOP_1_lshift_rg_a = {STAGE_LOOP_gp_STAGE_LOOP_gp_and_nl , STAGE_LOOP_gp_STAGE_LOOP_gp_or_nl};
  wire[0:0] STAGE_LOOP_gp_or_nl;
  wire [3:0] nl_IDX_LOOP_1_lshift_rg_s;
  assign STAGE_LOOP_gp_or_nl = and_dcpl_139 | and_dcpl_140;
  assign nl_IDX_LOOP_1_lshift_rg_s = MUX_v_4_2_2((z_out_2[3:0]), STAGE_LOOP_gp_acc_psp_sva,
      STAGE_LOOP_gp_or_nl);
  wire [0:0] nl_DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_33_tr0;
  assign nl_DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_33_tr0 = ~ IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm;
  wire [0:0] nl_DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_65_tr0;
  assign nl_DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_65_tr0 = ~ IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm;
  wire [0:0] nl_DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0;
  assign nl_DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0 = ~ z_out_1_10;
  wire [0:0] nl_DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = STAGE_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd5),
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
  mgc_rem #(.width_a(32'sd128),
  .width_b(32'sd64),
  .signd(32'sd0)) IDX_LOOP_1_IDX_LOOP_rem_1_cmp (
      .a(IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a),
      .b(reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse),
      .z(IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z)
    );
  modulo_dev  IDX_LOOP_1_modulo_dev_cmp (
      .base_rsc_dat(nl_IDX_LOOP_1_modulo_dev_cmp_base_rsc_dat[63:0]),
      .m_rsc_dat(nl_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat[63:0]),
      .return_rsc_z(IDX_LOOP_1_modulo_dev_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en)
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
  .width_z(32'sd10)) IDX_LOOP_1_lshift_rg (
      .a(nl_IDX_LOOP_1_lshift_rg_a[9:0]),
      .s(nl_IDX_LOOP_1_lshift_rg_s[3:0]),
      .z(z_out_4)
    );
  DIT_RELOOP_core_wait_dp DIT_RELOOP_core_wait_dp_inst (
      .ensig_cgo_iro(nor_27_rmff),
      .ensig_cgo(reg_ensig_cgo_cse),
      .IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en(IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en)
    );
  DIT_RELOOP_core_core_fsm DIT_RELOOP_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .IDX_LOOP_C_33_tr0(nl_DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_33_tr0[0:0]),
      .IDX_LOOP_C_65_tr0(nl_DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_65_tr0[0:0]),
      .GROUP_LOOP_C_0_tr0(nl_DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_26_nl = (fsm_output[1]) | (~ (fsm_output[3]));
  assign mux_33_nl = MUX_s_1_2_2(or_26_nl, (fsm_output[3]), fsm_output[2]);
  assign or_25_nl = (fsm_output[3:2]!=2'b01);
  assign mux_34_nl = MUX_s_1_2_2(mux_33_nl, or_25_nl, fsm_output[0]);
  assign nor_27_rmff = ~(mux_34_nl | (fsm_output[4]) | (fsm_output[6]));
  assign or_72_cse = (fsm_output[2:1]!=2'b00);
  assign nor_17_cse = ~((fsm_output[4:3]!=2'b00));
  assign or_74_cse = (fsm_output[5:2]!=4'b0000);
  assign mux_12_cse = MUX_s_1_2_2(or_74_cse, or_tmp_4, fsm_output[0]);
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_IDX_LOOP_idx2_acc_psp_sva_1 = IDX_LOOP_idx1_acc_psp_1_sva_mx0w0 + (STAGE_LOOP_op_rshift_psp_1_sva[9:1]);
  assign IDX_LOOP_idx2_acc_psp_sva_1 = nl_IDX_LOOP_idx2_acc_psp_sva_1[8:0];
  assign nl_IDX_LOOP_idx1_acc_psp_1_sva_mx0w0 = (z_out_3[8:0]) + IDX_LOOP_t_10_1_sva_8_0;
  assign IDX_LOOP_idx1_acc_psp_1_sva_mx0w0 = nl_IDX_LOOP_idx1_acc_psp_1_sva_mx0w0[8:0];
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ STAGE_LOOP_i_3_0_sva_2)}) + 5'b01011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign or_tmp = (fsm_output[5:0]!=6'b000000);
  assign or_tmp_4 = (fsm_output[5:1]!=5'b00000);
  assign or_tmp_9 = ((fsm_output[2:1]==2'b11)) | (fsm_output[4:3]!=2'b00);
  assign or_tmp_13 = (fsm_output[5]) | or_tmp_9;
  assign and_dcpl_5 = ~((fsm_output[5]) | (fsm_output[0]));
  assign and_dcpl_6 = and_dcpl_5 & (~ (fsm_output[6]));
  assign and_dcpl_7 = ~((fsm_output[2:1]!=2'b00));
  assign and_dcpl_9 = nor_17_cse & and_dcpl_7;
  assign and_dcpl_11 = (~ (fsm_output[5])) & (fsm_output[0]);
  assign and_dcpl_12 = and_dcpl_11 & (fsm_output[6]);
  assign and_dcpl_14 = nor_17_cse & (fsm_output[2:1]==2'b10);
  assign or_dcpl_1 = (fsm_output[4:3]!=2'b00);
  assign and_dcpl_19 = and_dcpl_14 & and_dcpl_6;
  assign and_dcpl_23 = (fsm_output[5]) & (~ (fsm_output[0])) & (~ (fsm_output[6]));
  assign and_dcpl_27 = (fsm_output[4:3]==2'b01);
  assign and_dcpl_28 = and_dcpl_27 & and_dcpl_7;
  assign and_dcpl_35 = (fsm_output[2:1]==2'b01);
  assign and_dcpl_36 = and_dcpl_35 & (fsm_output[6:5]==2'b00);
  assign and_dcpl_39 = and_dcpl_11 & (~ (fsm_output[6]));
  assign and_dcpl_40 = nor_17_cse & and_dcpl_35;
  assign and_dcpl_44 = nor_17_cse & (~ (fsm_output[2]));
  assign and_dcpl_48 = nor_17_cse & (fsm_output[1]) & (~ (fsm_output[2])) & (~ (fsm_output[6]));
  assign or_tmp_31 = (STAGE_LOOP_op_rshift_psp_1_sva[0]) | (fsm_output[5]);
  assign and_dcpl_50 = and_dcpl_5 & (fsm_output[6]);
  assign and_dcpl_51 = and_dcpl_40 & and_dcpl_50;
  assign and_dcpl_53 = (fsm_output[5]) & (fsm_output[0]) & (~ (fsm_output[6]));
  assign and_dcpl_54 = and_dcpl_9 & and_dcpl_53;
  assign and_dcpl_55 = and_dcpl_9 & and_dcpl_12;
  assign and_dcpl_56 = and_dcpl_40 & and_dcpl_6;
  assign and_dcpl_57 = and_dcpl_40 & and_dcpl_23;
  assign and_dcpl_58 = and_dcpl_40 & and_dcpl_53;
  assign mux_23_nl = MUX_s_1_2_2(or_tmp_13, or_74_cse, fsm_output[0]);
  assign not_tmp_46 = MUX_s_1_2_2(or_tmp_4, (~ mux_23_nl), fsm_output[6]);
  assign or_dcpl_9 = or_dcpl_1 | (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[5])
      | (fsm_output[0]) | (fsm_output[6]);
  assign and_dcpl_67 = nor_17_cse & (~ (fsm_output[6]));
  assign and_dcpl_73 = (~ (fsm_output[6])) & reg_IDX_LOOP_1_lshift_idiv_ftd_9;
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_14 & and_dcpl_12;
  assign GROUP_LOOP_j_10_0_sva_9_0_mx0c0 = and_dcpl_9 & and_dcpl_39;
  assign and_87_nl = (IDX_LOOP_idx2_9_0_sva[0]) & (fsm_output[5]) & (fsm_output[2])
      & (~ (fsm_output[1]));
  assign nor_7_nl = ~((~ (STAGE_LOOP_op_rshift_psp_1_sva[0])) | (fsm_output[5]) |
      (fsm_output[2]) | (~ (fsm_output[1])));
  assign mux_57_nl = MUX_s_1_2_2(and_87_nl, nor_7_nl, fsm_output[0]);
  assign tmp_1_lpi_4_dfm_mx0c1 = mux_57_nl & and_dcpl_67;
  assign IDX_LOOP_mux_10_itm_mx0c1 = and_dcpl_40 & and_dcpl_11 & and_dcpl_73;
  assign IDX_LOOP_f1_1_sva_mx0c1 = and_dcpl_27 & (~ (fsm_output[1])) & (~ (fsm_output[2]))
      & (fsm_output[0]) & (~ (fsm_output[6]));
  assign and_42_nl = and_dcpl_40 & and_dcpl_39;
  assign vec_rsc_0_0_i_radr_d = MUX1HOT_v_9_3_2(IDX_LOOP_idx2_acc_psp_sva_1, IDX_LOOP_idx1_acc_psp_1_sva,
      (IDX_LOOP_idx2_9_0_sva[9:1]), {and_dcpl_56 , and_42_nl , and_dcpl_58});
  assign vec_rsc_0_0_i_wadr_d = MUX1HOT_v_9_3_2(IDX_LOOP_idx2_acc_psp_sva, IDX_LOOP_idx1_acc_psp_1_sva,
      (IDX_LOOP_idx2_9_0_sva[9:1]), {and_dcpl_54 , and_dcpl_57 , and_dcpl_55});
  assign vec_rsc_0_0_i_d_d = MUX_v_64_2_2(IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z, IDX_LOOP_f1_1_sva,
      and_dcpl_57);
  assign and_88_nl = (fsm_output[5]) & (fsm_output[1]);
  assign nor_10_nl = ~((STAGE_LOOP_op_rshift_psp_1_sva[0]) | (~ (fsm_output[5]))
      | (fsm_output[1]));
  assign mux_43_nl = MUX_s_1_2_2(and_88_nl, nor_10_nl, fsm_output[0]);
  assign nor_11_nl = ~((~ (fsm_output[0])) | (IDX_LOOP_idx2_9_0_sva[0]) | (fsm_output[5])
      | (fsm_output[1]));
  assign mux_44_nl = MUX_s_1_2_2(mux_43_nl, nor_11_nl, fsm_output[6]);
  assign vec_rsc_0_0_i_we_d_pff = mux_44_nl & and_dcpl_44;
  assign nor_6_nl = ~((~ (fsm_output[5])) | IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm);
  assign mux_45_nl = MUX_s_1_2_2(nor_6_nl, (fsm_output[5]), IDX_LOOP_idx2_9_0_sva[0]);
  assign mux_46_nl = MUX_s_1_2_2(or_tmp_31, mux_45_nl, fsm_output[0]);
  assign vec_rsc_0_0_i_re_d_pff = (~ mux_46_nl) & and_dcpl_48;
  assign vec_rsc_0_1_i_radr_d = MUX1HOT_v_9_3_2(IDX_LOOP_idx2_acc_psp_sva_1, IDX_LOOP_idx1_acc_psp_1_sva,
      (IDX_LOOP_idx2_9_0_sva[9:1]), {and_dcpl_56 , and_dcpl_57 , and_dcpl_58});
  assign vec_rsc_0_1_i_wadr_d = MUX1HOT_v_9_3_2(IDX_LOOP_idx2_acc_psp_sva, (IDX_LOOP_idx2_9_0_sva[9:1]),
      IDX_LOOP_idx1_acc_psp_1_sva, {and_dcpl_54 , and_dcpl_55 , and_dcpl_51});
  assign vec_rsc_0_1_i_d_d = MUX_v_64_2_2(IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z, IDX_LOOP_f1_1_sva,
      and_dcpl_51);
  assign and_90_nl = (fsm_output[0]) & (STAGE_LOOP_op_rshift_psp_1_sva[0]) & (fsm_output[5])
      & (~ (fsm_output[1]));
  assign nor_12_nl = ~((fsm_output[5]) | (~ (fsm_output[1])));
  assign nor_13_nl = ~((~ (IDX_LOOP_idx2_9_0_sva[0])) | (fsm_output[5]) | (fsm_output[1]));
  assign mux_40_nl = MUX_s_1_2_2(nor_12_nl, nor_13_nl, fsm_output[0]);
  assign mux_41_nl = MUX_s_1_2_2(and_90_nl, mux_40_nl, fsm_output[6]);
  assign vec_rsc_0_1_i_we_d_pff = mux_41_nl & and_dcpl_44;
  assign and_89_nl = (IDX_LOOP_idx2_9_0_sva[0]) & (fsm_output[5]) & IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm;
  assign mux_42_nl = MUX_s_1_2_2(or_tmp_31, and_89_nl, fsm_output[0]);
  assign vec_rsc_0_1_i_re_d_pff = mux_42_nl & and_dcpl_48;
  assign twiddle_rsc_0_0_i_radr_d_pff = z_out_4[9:1];
  assign twiddle_rsc_0_0_i_re_d_pff = (~ (z_out_4[0])) & nor_17_cse & and_dcpl_36;
  assign twiddle_rsc_0_1_i_re_d_pff = (z_out_4[0]) & nor_17_cse & and_dcpl_36;
  assign and_104_cse = nor_17_cse & (fsm_output[2]) & (~ (fsm_output[1])) & (~ (fsm_output[0]))
      & (fsm_output[6]) & (~ (fsm_output[5]));
  assign and_dcpl_116 = ~((fsm_output!=7'b0000010));
  assign and_dcpl_117 = ~((fsm_output[0]) | (fsm_output[6]));
  assign and_dcpl_118 = and_dcpl_117 & (~ (fsm_output[5]));
  assign and_dcpl_121 = ~((fsm_output[4:1]!=4'b0100));
  assign and_dcpl_128 = (fsm_output[4:1]==4'b0001) & and_dcpl_118;
  assign and_dcpl_130 = (fsm_output[0]) & (~ (fsm_output[6])) & (~ (fsm_output[5]));
  assign and_dcpl_138 = nor_17_cse & (fsm_output[2:1]==2'b01);
  assign and_dcpl_139 = ~((~ and_dcpl_138) | (fsm_output[0]) | (fsm_output[6]) |
      (fsm_output[5]));
  assign and_dcpl_140 = and_dcpl_138 & and_dcpl_130;
  assign and_dcpl_146 = and_dcpl_14 & and_dcpl_117 & (~ (fsm_output[5]));
  assign and_dcpl_150 = nor_17_cse & (fsm_output[2]) & (~ (fsm_output[1])) & (fsm_output[0])
      & (~ (fsm_output[6]));
  assign and_dcpl_152 = and_dcpl_14 & and_dcpl_117 & (fsm_output[5]);
  assign and_144_ssc = nor_17_cse & and_dcpl_7 & and_dcpl_130;
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_i_3_0_sva <= 4'b0000;
    end
    else if ( (and_dcpl_9 & and_dcpl_6) | STAGE_LOOP_i_3_0_sva_mx0c1 ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      p_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( MUX_s_1_2_2((~ or_tmp), or_tmp_13, fsm_output[6]) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      reg_ensig_cgo_cse <= 1'b0;
      IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= 1'b0;
      reg_IDX_LOOP_1_lshift_idiv_ftd_9 <= 1'b0;
    end
    else begin
      reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse <= p_sva;
      reg_ensig_cgo_cse <= nor_27_rmff;
      IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a <= MUX_v_128_2_2(z_out_3, IDX_LOOP_1_mul_mut,
          mux_38_nl);
      reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= and_dcpl_14 & and_dcpl_11 & (fsm_output[6])
          & STAGE_LOOP_acc_itm_4_1;
      reg_IDX_LOOP_1_lshift_idiv_ftd_9 <= z_out_4[0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_gp_lshift_psp_sva <= 10'b0000000000;
    end
    else if ( ~ not_tmp_46 ) begin
      STAGE_LOOP_gp_lshift_psp_sva <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      GROUP_LOOP_j_10_0_sva_9_0 <= 10'b0000000000;
    end
    else if ( GROUP_LOOP_j_10_0_sva_9_0_mx0c0 | (and_dcpl_14 & and_dcpl_50) ) begin
      GROUP_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (z_out[9:0]), GROUP_LOOP_j_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_op_rshift_psp_1_sva <= 10'b0000000000;
    end
    else if ( ~ not_tmp_46 ) begin
      STAGE_LOOP_op_rshift_psp_1_sva <= STAGE_LOOP_op_rshift_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_t_10_1_sva_8_0 <= 9'b000000000;
    end
    else if ( MUX_s_1_2_2(mux_nl, or_74_cse, fsm_output[6]) ) begin
      IDX_LOOP_t_10_1_sva_8_0 <= MUX_v_9_2_2(9'b000000000, reg_IDX_LOOP_t_10_1_ftd_1,
          or_73_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      STAGE_LOOP_gp_acc_psp_sva <= 4'b0000;
    end
    else if ( ~ not_tmp_46 ) begin
      STAGE_LOOP_gp_acc_psp_sva <= z_out_2[3:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_idx2_acc_psp_sva <= 9'b000000000;
    end
    else if ( ~ or_dcpl_9 ) begin
      IDX_LOOP_idx2_acc_psp_sva <= IDX_LOOP_idx2_acc_psp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm <= 1'b0;
    end
    else if ( ~ or_dcpl_9 ) begin
      IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm <= z_out[10];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_idx1_acc_psp_1_sva <= 9'b000000000;
    end
    else if ( MUX_s_1_2_2((~ mux_12_cse), or_tmp_4, fsm_output[6]) ) begin
      IDX_LOOP_idx1_acc_psp_1_sva <= IDX_LOOP_idx1_acc_psp_1_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_idx2_9_0_sva <= 10'b0000000000;
    end
    else if ( MUX_s_1_2_2((~ mux_12_cse), or_tmp, fsm_output[6]) ) begin
      IDX_LOOP_idx2_9_0_sva <= nl_IDX_LOOP_idx2_9_0_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm <= 1'b0;
    end
    else if ( ~(mux_12_cse ^ (fsm_output[6])) ) begin
      IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm <= z_out_1_10;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      tmp_1_lpi_4_dfm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( (mux_56_nl & and_dcpl_67) | tmp_1_lpi_4_dfm_mx0c1 ) begin
      tmp_1_lpi_4_dfm <= MUX_v_64_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, tmp_1_lpi_4_dfm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_mux_10_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( (and_dcpl_40 & and_dcpl_11 & (~((fsm_output[6]) | reg_IDX_LOOP_1_lshift_idiv_ftd_9)))
        | IDX_LOOP_mux_10_itm_mx0c1 ) begin
      IDX_LOOP_mux_10_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
          IDX_LOOP_mux_10_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_f1_1_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( and_dcpl_19 | IDX_LOOP_f1_1_sva_mx0c1 | and_dcpl_58 ) begin
      IDX_LOOP_f1_1_sva <= MUX1HOT_v_64_3_2(vec_rsc_0_0_i_q_d, IDX_LOOP_1_modulo_dev_cmp_return_rsc_z,
          vec_rsc_0_1_i_q_d, {and_dcpl_19 , IDX_LOOP_f1_1_sva_mx0c1 , and_dcpl_58});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_mux_1_itm <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( mux_64_nl | (fsm_output[6]) ) begin
      IDX_LOOP_mux_1_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
          and_85_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      IDX_LOOP_1_mul_mut <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( (and_dcpl_28 & and_dcpl_6) | (and_dcpl_28 & and_dcpl_23) ) begin
      IDX_LOOP_1_mul_mut <= z_out_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_IDX_LOOP_t_10_1_ftd_1 <= 9'b000000000;
    end
    else if ( ~ or_dcpl_9 ) begin
      reg_IDX_LOOP_t_10_1_ftd_1 <= z_out_2[8:0];
    end
  end
  assign or_30_nl = (or_72_cse & (fsm_output[3])) | (fsm_output[4]);
  assign or_28_nl = (fsm_output[4:3]!=2'b01);
  assign mux_35_nl = MUX_s_1_2_2(or_28_nl, or_dcpl_1, or_72_cse);
  assign mux_36_nl = MUX_s_1_2_2(or_30_nl, mux_35_nl, fsm_output[5]);
  assign mux_37_nl = MUX_s_1_2_2(mux_36_nl, or_dcpl_1, fsm_output[0]);
  assign mux_38_nl = MUX_s_1_2_2(mux_37_nl, (~ or_tmp), fsm_output[6]);
  assign GROUP_LOOP_j_not_1_nl = ~ GROUP_LOOP_j_10_0_sva_9_0_mx0c0;
  assign or_41_nl = (~ (fsm_output[0])) | (fsm_output[2]);
  assign or_40_nl = (fsm_output[0]) | (~ (fsm_output[2]));
  assign mux_49_nl = MUX_s_1_2_2(or_41_nl, or_40_nl, fsm_output[6]);
  assign or_73_nl = mux_49_nl | (fsm_output[4]) | (fsm_output[3]) | (fsm_output[1])
      | (fsm_output[5]);
  assign or_77_nl = (fsm_output[4:0]!=5'b00010);
  assign nor_nl = ~((fsm_output[4:2]!=3'b000));
  assign mux_nl = MUX_s_1_2_2(or_77_nl, nor_nl, fsm_output[5]);
  assign nl_IDX_LOOP_idx2_9_0_sva  = ({IDX_LOOP_idx1_acc_psp_1_sva_mx0w0 , 1'b1})
      + STAGE_LOOP_op_rshift_psp_1_sva;
  assign nor_8_nl = ~((IDX_LOOP_idx2_9_0_sva[0]) | (~ (fsm_output[5])) | (~ (fsm_output[2]))
      | (fsm_output[1]));
  assign nor_9_nl = ~((STAGE_LOOP_op_rshift_psp_1_sva[0]) | (fsm_output[5]) | (fsm_output[2])
      | (~ (fsm_output[1])));
  assign mux_56_nl = MUX_s_1_2_2(nor_8_nl, nor_9_nl, fsm_output[0]);
  assign and_85_nl = and_dcpl_14 & and_dcpl_5 & and_dcpl_73;
  assign mux_63_nl = MUX_s_1_2_2((~ or_tmp_9), or_dcpl_1, fsm_output[5]);
  assign mux_62_nl = MUX_s_1_2_2(and_dcpl_44, or_dcpl_1, fsm_output[5]);
  assign mux_64_nl = MUX_s_1_2_2(mux_63_nl, mux_62_nl, fsm_output[0]);
  assign IDX_LOOP_mux_13_nl = MUX_v_10_2_2((~ STAGE_LOOP_op_rshift_psp_1_sva), GROUP_LOOP_j_10_0_sva_9_0,
      and_104_cse);
  assign IDX_LOOP_IDX_LOOP_nand_1_nl = ~(and_104_cse & (~(nor_17_cse & (~ (fsm_output[2]))
      & (fsm_output[1]) & (~((fsm_output[0]) | (fsm_output[6]) | (fsm_output[5]))))));
  assign not_218_nl = ~ and_104_cse;
  assign IDX_LOOP_IDX_LOOP_and_1_nl = MUX_v_9_2_2(9'b000000000, IDX_LOOP_t_10_1_sva_8_0,
      not_218_nl);
  assign nl_acc_nl = ({(~ and_104_cse) , IDX_LOOP_mux_13_nl , IDX_LOOP_IDX_LOOP_nand_1_nl})
      + conv_u2u_11_12({IDX_LOOP_IDX_LOOP_and_1_nl , 2'b11});
  assign acc_nl = nl_acc_nl[11:0];
  assign z_out = readslicef_12_11_1(acc_nl);
  assign IDX_LOOP_mux_14_nl = MUX_v_11_2_2(({z_out_2 , 1'b0}), z_out, and_104_cse);
  assign IDX_LOOP_mux_15_nl = MUX_v_10_2_2((~ STAGE_LOOP_op_rshift_psp_1_sva), (~
      STAGE_LOOP_gp_lshift_psp_sva), and_104_cse);
  assign nl_acc_1_nl = ({IDX_LOOP_mux_14_nl , 1'b1}) + ({1'b1 , IDX_LOOP_mux_15_nl
      , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[11:0];
  assign z_out_1_10 = readslicef_12_1_11(acc_1_nl);
  assign STAGE_LOOP_gp_mux_5_nl = MUX_v_9_2_2(({5'b00000 , STAGE_LOOP_i_3_0_sva}),
      IDX_LOOP_t_10_1_sva_8_0, and_dcpl_116);
  assign nl_z_out_2 = conv_u2u_9_10(STAGE_LOOP_gp_mux_5_nl) + conv_s2u_2_10({(~ and_dcpl_116)
      , 1'b1});
  assign z_out_2 = nl_z_out_2[9:0];
  assign and_164_nl = and_dcpl_121 & and_dcpl_118;
  assign and_165_nl = and_dcpl_121 & and_dcpl_117 & (fsm_output[5]);
  assign IDX_LOOP_mux1h_11_nl = MUX1HOT_v_64_3_2(IDX_LOOP_mux_10_itm, IDX_LOOP_mux_1_itm,
      ({55'b0000000000000000000000000000000000000000000000000000000 , (GROUP_LOOP_j_10_0_sva_9_0[8:0])}),
      {and_164_nl , and_165_nl , and_dcpl_128});
  assign IDX_LOOP_mux_16_nl = MUX_v_64_2_2(IDX_LOOP_1_modulo_dev_cmp_return_rsc_z,
      ({55'b0000000000000000000000000000000000000000000000000000000 , (STAGE_LOOP_op_rshift_psp_1_sva[8:0])}),
      and_dcpl_128);
  assign z_out_3 = conv_u2u_128_128(IDX_LOOP_mux1h_11_nl * IDX_LOOP_mux_16_nl);

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


  function automatic [10:0] readslicef_12_11_1;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_12_11_1 = tmp[10:0];
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


  function automatic [63:0] readslicef_65_64_1;
    input [64:0] vector;
    reg [64:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_65_64_1 = tmp[63:0];
  end
  endfunction


  function automatic [9:0] conv_s2u_2_10 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_10 = {{8{vector[1]}}, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
  end
  endfunction


  function automatic [11:0] conv_u2u_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2u_11_12 = {1'b0, vector};
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
  wire [8:0] vec_rsc_0_0_i_radr_d;
  wire [8:0] vec_rsc_0_0_i_wadr_d;
  wire [63:0] vec_rsc_0_0_i_d_d;
  wire [63:0] vec_rsc_0_0_i_q_d;
  wire [8:0] vec_rsc_0_1_i_radr_d;
  wire [8:0] vec_rsc_0_1_i_wadr_d;
  wire [63:0] vec_rsc_0_1_i_d_d;
  wire [63:0] vec_rsc_0_1_i_q_d;
  wire [63:0] twiddle_rsc_0_0_i_q_d;
  wire [63:0] twiddle_rsc_0_1_i_q_d;
  wire vec_rsc_0_0_i_we_d_iff;
  wire vec_rsc_0_0_i_re_d_iff;
  wire vec_rsc_0_1_i_we_d_iff;
  wire vec_rsc_0_1_i_re_d_iff;
  wire [8:0] twiddle_rsc_0_0_i_radr_d_iff;
  wire twiddle_rsc_0_0_i_re_d_iff;
  wire twiddle_rsc_0_1_i_re_d_iff;


  // Interconnect Declarations for Component Instantiations 
  DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen vec_rsc_0_0_i
      (
      .we(vec_rsc_0_0_we),
      .d(vec_rsc_0_0_d),
      .wadr(vec_rsc_0_0_wadr),
      .q(vec_rsc_0_0_q),
      .re(vec_rsc_0_0_re),
      .radr(vec_rsc_0_0_radr),
      .radr_d(vec_rsc_0_0_i_radr_d),
      .wadr_d(vec_rsc_0_0_i_wadr_d),
      .d_d(vec_rsc_0_0_i_d_d),
      .we_d(vec_rsc_0_0_i_we_d_iff),
      .re_d(vec_rsc_0_0_i_re_d_iff),
      .q_d(vec_rsc_0_0_i_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_re_d_iff),
      .port_1_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_0_i_we_d_iff)
    );
  DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen vec_rsc_0_1_i
      (
      .we(vec_rsc_0_1_we),
      .d(vec_rsc_0_1_d),
      .wadr(vec_rsc_0_1_wadr),
      .q(vec_rsc_0_1_q),
      .re(vec_rsc_0_1_re),
      .radr(vec_rsc_0_1_radr),
      .radr_d(vec_rsc_0_1_i_radr_d),
      .wadr_d(vec_rsc_0_1_i_wadr_d),
      .d_d(vec_rsc_0_1_i_d_d),
      .we_d(vec_rsc_0_1_i_we_d_iff),
      .re_d(vec_rsc_0_1_i_re_d_iff),
      .q_d(vec_rsc_0_1_i_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_re_d_iff),
      .port_1_w_ram_ir_internal_WMASK_B_d(vec_rsc_0_1_i_we_d_iff)
    );
  DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen twiddle_rsc_0_0_i
      (
      .q(twiddle_rsc_0_0_q),
      .re(twiddle_rsc_0_0_re),
      .radr(twiddle_rsc_0_0_radr),
      .radr_d(twiddle_rsc_0_0_i_radr_d_iff),
      .re_d(twiddle_rsc_0_0_i_re_d_iff),
      .q_d(twiddle_rsc_0_0_i_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_re_d_iff)
    );
  DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen twiddle_rsc_0_1_i
      (
      .q(twiddle_rsc_0_1_q),
      .re(twiddle_rsc_0_1_re),
      .radr(twiddle_rsc_0_1_radr),
      .radr_d(twiddle_rsc_0_0_i_radr_d_iff),
      .re_d(twiddle_rsc_0_1_i_re_d_iff),
      .q_d(twiddle_rsc_0_1_i_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_re_d_iff)
    );
  DIT_RELOOP_core DIT_RELOOP_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
      .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
      .vec_rsc_0_0_i_radr_d(vec_rsc_0_0_i_radr_d),
      .vec_rsc_0_0_i_wadr_d(vec_rsc_0_0_i_wadr_d),
      .vec_rsc_0_0_i_d_d(vec_rsc_0_0_i_d_d),
      .vec_rsc_0_0_i_q_d(vec_rsc_0_0_i_q_d),
      .vec_rsc_0_1_i_radr_d(vec_rsc_0_1_i_radr_d),
      .vec_rsc_0_1_i_wadr_d(vec_rsc_0_1_i_wadr_d),
      .vec_rsc_0_1_i_d_d(vec_rsc_0_1_i_d_d),
      .vec_rsc_0_1_i_q_d(vec_rsc_0_1_i_q_d),
      .twiddle_rsc_0_0_i_q_d(twiddle_rsc_0_0_i_q_d),
      .twiddle_rsc_0_1_i_q_d(twiddle_rsc_0_1_i_q_d),
      .vec_rsc_0_0_i_we_d_pff(vec_rsc_0_0_i_we_d_iff),
      .vec_rsc_0_0_i_re_d_pff(vec_rsc_0_0_i_re_d_iff),
      .vec_rsc_0_1_i_we_d_pff(vec_rsc_0_1_i_we_d_iff),
      .vec_rsc_0_1_i_re_d_pff(vec_rsc_0_1_i_re_d_iff),
      .twiddle_rsc_0_0_i_radr_d_pff(twiddle_rsc_0_0_i_radr_d_iff),
      .twiddle_rsc_0_0_i_re_d_pff(twiddle_rsc_0_0_i_re_d_iff),
      .twiddle_rsc_0_1_i_re_d_pff(twiddle_rsc_0_1_i_re_d_iff)
    );
endmodule



