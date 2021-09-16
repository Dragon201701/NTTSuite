module top();

module inPlaceNTT_DIF_precomp (
    .clk(clk), 
    .rst(rst), 
    .run_rsc_rdy(run_rsc_rdy), 
    .run_rsc_vld(run_rsc_vld), 
    .vec_rsc_adra           (vec_rsc_adra), 
    .vec_rsc_da             (vec_rsc_da  ), 
    .vec_rsc_wea            (vec_rsc_wea ), 
    .vec_rsc_qa             (vec_rsc_qa  ),
    .vec_rsc_adrb           (vec_rsc_adrb), 
    .vec_rsc_db             (vec_rsc_db  ), 
    .vec_rsc_web            (), 
    .vec_rsc_qb             (), 
    .vec_rsc_triosy_lz      (), 
    .p_rsc_dat              (),
    .p_rsc_triosy_lz        (), 
    .r_rsc_dat(), 
    .r_rsc_triosy_lz(), 
    .twiddle_rsc_adra(), 
    .twiddle_rsc_da(),
    .twiddle_rsc_wea(), 
    .twiddle_rsc_qa(), 
    .twiddle_rsc_adrb(), 
    .twiddle_rsc_db(), 
    .twiddle_rsc_web(),
    .twiddle_rsc_qb(), 
    .twiddle_rsc_triosy_lz(), 
    .twiddle_h_rsc_adra(), 
    .twiddle_h_rsc_da(),
    .twiddle_h_rsc_wea(), 
    .twiddle_h_rsc_qa(), 
    .twiddle_h_rsc_adrb(), 
    .twiddle_h_rsc_db(),
    .twiddle_h_rsc_web(), 
    .twiddle_h_rsc_qb(), 
    .twiddle_h_rsc_triosy_lz(), 
    .complete_rsc_rdy(),
    .complete_rsc_vld
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [11:0] vec_rsc_adra;
  output [31:0] vec_rsc_da;
  output vec_rsc_wea;
  input [31:0] vec_rsc_qa;
  output [11:0] vec_rsc_adrb;
  output [31:0] vec_rsc_db;
  output vec_rsc_web;
  input [31:0] vec_rsc_qb;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [11:0] twiddle_rsc_adra;
  output [31:0] twiddle_rsc_da;
  output twiddle_rsc_wea;
  input [31:0] twiddle_rsc_qa;
  output [11:0] twiddle_rsc_adrb;
  output [31:0] twiddle_rsc_db;
  output twiddle_rsc_web;
  input [31:0] twiddle_rsc_qb;
  output twiddle_rsc_triosy_lz;
  output [11:0] twiddle_h_rsc_adra;
  output [31:0] twiddle_h_rsc_da;
  output twiddle_h_rsc_wea;
  input [31:0] twiddle_h_rsc_qa;
  output [11:0] twiddle_h_rsc_adrb;
  output [31:0] twiddle_h_rsc_db;
  output twiddle_h_rsc_web;
  input [31:0] twiddle_h_rsc_qb;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;

module blk_mem_gen_0(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[3:0],dina[31:0],clkb,addrb[3:0],doutb[31:0]" */;
  input clka;
  input [0:0]wea;
  input [3:0]addra;
  input [31:0]dina;
  input clkb;
  input [3:0]addrb;
  output [31:0]doutb;
endmodule

endmodule