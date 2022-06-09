// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Sun Jan 23 22:51:27 2022
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module axi_test_core_core_fsm (
  clk, rst, core_wen, fsm_output, main_C_0_tr0, ADD_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input core_wen;
  output [5:0] fsm_output;
  reg [5:0] fsm_output;
  input main_C_0_tr0;
  input ADD_LOOP_C_1_tr0;


  // FSM State Type Declaration for axi_test_core_core_fsm_1
  parameter
    core_rlp_C_0 = 3'd0,
    main_C_0 = 3'd1,
    ADD_LOOP_C_0 = 3'd2,
    ADD_LOOP_C_1 = 3'd3,
    main_C_1 = 3'd4,
    main_C_2 = 3'd5;

  reg [2:0] state_var;
  reg [2:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : axi_test_core_core_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 6'b000010;
        if ( main_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = ADD_LOOP_C_0;
        end
      end
      ADD_LOOP_C_0 : begin
        fsm_output = 6'b000100;
        state_var_NS = ADD_LOOP_C_1;
      end
      ADD_LOOP_C_1 : begin
        fsm_output = 6'b001000;
        if ( ADD_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = ADD_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 6'b010000;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 6'b100000;
        state_var_NS = main_C_0;
      end
      // core_rlp_C_0
      default : begin
        fsm_output = 6'b000001;
        state_var_NS = main_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= core_rlp_C_0;
    end
    else if ( core_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_staller
// ------------------------------------------------------------------


module axi_test_core_staller (
  clk, rst, core_wen, core_wten, a_rsci_wen_comp, a_rsci_wen_comp_1, complete_rsci_wen_comp
);
  input clk;
  input rst;
  output core_wen;
  output core_wten;
  reg core_wten;
  input a_rsci_wen_comp;
  input a_rsci_wen_comp_1;
  input complete_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign core_wen = a_rsci_wen_comp & a_rsci_wen_comp_1 & complete_rsci_wen_comp;
  always @(posedge clk) begin
    if ( rst ) begin
      core_wten <= 1'b0;
    end
    else begin
      core_wten <= ~ core_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl (
  core_wten, a_rsc_triosy_obj_iswt0, a_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input a_rsc_triosy_obj_iswt0;
  output a_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign a_rsc_triosy_obj_ld_core_sct = a_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_complete_rsci_complete_wait_dp
// ------------------------------------------------------------------


module axi_test_core_complete_rsci_complete_wait_dp (
  clk, rst, complete_rsci_oswt, complete_rsci_wen_comp, complete_rsci_biwt, complete_rsci_bdwt,
      complete_rsci_bcwt
);
  input clk;
  input rst;
  input complete_rsci_oswt;
  output complete_rsci_wen_comp;
  input complete_rsci_biwt;
  input complete_rsci_bdwt;
  output complete_rsci_bcwt;
  reg complete_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign complete_rsci_wen_comp = (~ complete_rsci_oswt) | complete_rsci_biwt | complete_rsci_bcwt;
  always @(posedge clk) begin
    if ( rst ) begin
      complete_rsci_bcwt <= 1'b0;
    end
    else begin
      complete_rsci_bcwt <= ~((~(complete_rsci_bcwt | complete_rsci_biwt)) | complete_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_complete_rsci_complete_wait_ctrl
// ------------------------------------------------------------------


module axi_test_core_complete_rsci_complete_wait_ctrl (
  core_wen, complete_rsci_oswt, complete_rsci_biwt, complete_rsci_bdwt, complete_rsci_bcwt,
      complete_rsci_ivld_core_sct, complete_rsci_irdy
);
  input core_wen;
  input complete_rsci_oswt;
  output complete_rsci_biwt;
  output complete_rsci_bdwt;
  input complete_rsci_bcwt;
  output complete_rsci_ivld_core_sct;
  input complete_rsci_irdy;


  // Interconnect Declarations
  wire complete_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign complete_rsci_bdwt = complete_rsci_oswt & core_wen;
  assign complete_rsci_biwt = complete_rsci_ogwt & complete_rsci_irdy;
  assign complete_rsci_ogwt = complete_rsci_oswt & (~ complete_rsci_bcwt);
  assign complete_rsci_ivld_core_sct = complete_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_a_rsci_a_rsc_wait_dp
// ------------------------------------------------------------------


module axi_test_core_a_rsci_a_rsc_wait_dp (
  clk, rst, a_rsci_oswt, a_rsci_wen_comp, a_rsci_oswt_1, a_rsci_wen_comp_1, a_rsci_m_waddr_core,
      a_rsci_m_raddr_core, a_rsci_m_din_mxwt, a_rsci_m_dout_core, a_rsci_biwt, a_rsci_bdwt,
      a_rsci_bcwt, a_rsci_biwt_1, a_rsci_bdwt_2, a_rsci_bcwt_1, a_rsci_m_waddr, a_rsci_m_waddr_core_sct,
      a_rsci_m_raddr, a_rsci_m_raddr_core_sct, a_rsci_m_din, a_rsci_m_dout
);
  input clk;
  input rst;
  input a_rsci_oswt;
  output a_rsci_wen_comp;
  input a_rsci_oswt_1;
  output a_rsci_wen_comp_1;
  input [3:0] a_rsci_m_waddr_core;
  input [3:0] a_rsci_m_raddr_core;
  output [31:0] a_rsci_m_din_mxwt;
  input [31:0] a_rsci_m_dout_core;
  input a_rsci_biwt;
  input a_rsci_bdwt;
  output a_rsci_bcwt;
  reg a_rsci_bcwt;
  input a_rsci_biwt_1;
  input a_rsci_bdwt_2;
  output a_rsci_bcwt_1;
  reg a_rsci_bcwt_1;
  output [3:0] a_rsci_m_waddr;
  input a_rsci_m_waddr_core_sct;
  output [3:0] a_rsci_m_raddr;
  input a_rsci_m_raddr_core_sct;
  input [31:0] a_rsci_m_din;
  output [31:0] a_rsci_m_dout;


  // Interconnect Declarations
  reg [31:0] a_rsci_m_din_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign a_rsci_wen_comp = (~ a_rsci_oswt) | a_rsci_biwt | a_rsci_bcwt;
  assign a_rsci_wen_comp_1 = (~ a_rsci_oswt_1) | a_rsci_biwt_1 | a_rsci_bcwt_1;
  assign a_rsci_m_waddr = MUX_v_4_2_2(4'b0000, a_rsci_m_waddr_core, a_rsci_m_waddr_core_sct);
  assign a_rsci_m_raddr = MUX_v_4_2_2(4'b0000, a_rsci_m_raddr_core, a_rsci_m_raddr_core_sct);
  assign a_rsci_m_din_mxwt = MUX_v_32_2_2(a_rsci_m_din, a_rsci_m_din_bfwt, a_rsci_bcwt);
  assign a_rsci_m_dout = MUX_v_32_2_2(32'b00000000000000000000000000000000, a_rsci_m_dout_core,
      a_rsci_m_waddr_core_sct);
  always @(posedge clk) begin
    if ( rst ) begin
      a_rsci_bcwt <= 1'b0;
      a_rsci_bcwt_1 <= 1'b0;
    end
    else begin
      a_rsci_bcwt <= ~((~(a_rsci_bcwt | a_rsci_biwt)) | a_rsci_bdwt);
      a_rsci_bcwt_1 <= ~((~(a_rsci_bcwt_1 | a_rsci_biwt_1)) | a_rsci_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( a_rsci_biwt ) begin
      a_rsci_m_din_bfwt <= a_rsci_m_din;
    end
  end

  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input [0:0] sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_a_rsci_a_rsc_wait_ctrl
// ------------------------------------------------------------------


module axi_test_core_a_rsci_a_rsc_wait_ctrl (
  core_wen, a_rsci_oswt, a_rsci_oswt_1, a_rsci_biwt, a_rsci_bdwt, a_rsci_bcwt, a_rsci_m_re_core_sct,
      a_rsci_biwt_1, a_rsci_bdwt_2, a_rsci_bcwt_1, a_rsci_m_we_core_sct, a_rsci_m_wrdy,
      a_rsci_m_rrdy
);
  input core_wen;
  input a_rsci_oswt;
  input a_rsci_oswt_1;
  output a_rsci_biwt;
  output a_rsci_bdwt;
  input a_rsci_bcwt;
  output a_rsci_m_re_core_sct;
  output a_rsci_biwt_1;
  output a_rsci_bdwt_2;
  input a_rsci_bcwt_1;
  output a_rsci_m_we_core_sct;
  input a_rsci_m_wrdy;
  input a_rsci_m_rrdy;


  // Interconnect Declarations
  wire a_rsci_ogwt;
  wire a_rsci_ogwt_1;


  // Interconnect Declarations for Component Instantiations 
  assign a_rsci_bdwt = a_rsci_oswt & core_wen;
  assign a_rsci_biwt = a_rsci_ogwt & a_rsci_m_rrdy;
  assign a_rsci_ogwt = a_rsci_oswt & (~ a_rsci_bcwt);
  assign a_rsci_m_re_core_sct = a_rsci_ogwt;
  assign a_rsci_bdwt_2 = a_rsci_oswt_1 & core_wen;
  assign a_rsci_biwt_1 = a_rsci_ogwt_1 & a_rsci_m_wrdy;
  assign a_rsci_ogwt_1 = a_rsci_oswt_1 & (~ a_rsci_bcwt_1);
  assign a_rsci_m_we_core_sct = a_rsci_ogwt_1;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_run_rsci_run_wait_dp
// ------------------------------------------------------------------


module axi_test_core_run_rsci_run_wait_dp (
  clk, rst, run_rsci_ivld_mxwt, run_rsci_ivld, run_rsci_biwt, run_rsci_bdwt
);
  input clk;
  input rst;
  output run_rsci_ivld_mxwt;
  input run_rsci_ivld;
  input run_rsci_biwt;
  input run_rsci_bdwt;


  // Interconnect Declarations
  reg run_rsci_bcwt;
  reg run_rsci_ivld_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign run_rsci_ivld_mxwt = MUX_s_1_2_2(run_rsci_ivld, run_rsci_ivld_bfwt, run_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      run_rsci_bcwt <= 1'b0;
    end
    else begin
      run_rsci_bcwt <= ~((~(run_rsci_bcwt | run_rsci_biwt)) | run_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( run_rsci_biwt ) begin
      run_rsci_ivld_bfwt <= run_rsci_ivld;
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_run_rsci_run_wait_ctrl
// ------------------------------------------------------------------


module axi_test_core_run_rsci_run_wait_ctrl (
  core_wen, run_rsci_oswt, core_wten, run_rsci_biwt, run_rsci_bdwt
);
  input core_wen;
  input run_rsci_oswt;
  input core_wten;
  output run_rsci_biwt;
  output run_rsci_bdwt;



  // Interconnect Declarations for Component Instantiations 
  assign run_rsci_bdwt = run_rsci_oswt & core_wen;
  assign run_rsci_biwt = (~ core_wten) & run_rsci_oswt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_a_rsc_triosy_obj
// ------------------------------------------------------------------


module axi_test_core_a_rsc_triosy_obj (
  a_rsc_triosy_lz, core_wten, a_rsc_triosy_obj_iswt0
);
  output a_rsc_triosy_lz;
  input core_wten;
  input a_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire a_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) a_rsc_triosy_obj (
      .ld(a_rsc_triosy_obj_ld_core_sct),
      .lz(a_rsc_triosy_lz)
    );
  axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl axi_test_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .a_rsc_triosy_obj_iswt0(a_rsc_triosy_obj_iswt0),
      .a_rsc_triosy_obj_ld_core_sct(a_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_complete_rsci
// ------------------------------------------------------------------


module axi_test_core_complete_rsci (
  clk, rst, complete_rsc_rdy, complete_rsc_vld, core_wen, complete_rsci_oswt, complete_rsci_wen_comp
);
  input clk;
  input rst;
  input complete_rsc_rdy;
  output complete_rsc_vld;
  input core_wen;
  input complete_rsci_oswt;
  output complete_rsci_wen_comp;


  // Interconnect Declarations
  wire complete_rsci_biwt;
  wire complete_rsci_bdwt;
  wire complete_rsci_bcwt;
  wire complete_rsci_ivld_core_sct;
  wire complete_rsci_irdy;


  // Interconnect Declarations for Component Instantiations 
  ccs_sync_out_wait_v1 #(.rscid(32'sd3)) complete_rsci (
      .vld(complete_rsc_vld),
      .rdy(complete_rsc_rdy),
      .ivld(complete_rsci_ivld_core_sct),
      .irdy(complete_rsci_irdy)
    );
  axi_test_core_complete_rsci_complete_wait_ctrl axi_test_core_complete_rsci_complete_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .complete_rsci_oswt(complete_rsci_oswt),
      .complete_rsci_biwt(complete_rsci_biwt),
      .complete_rsci_bdwt(complete_rsci_bdwt),
      .complete_rsci_bcwt(complete_rsci_bcwt),
      .complete_rsci_ivld_core_sct(complete_rsci_ivld_core_sct),
      .complete_rsci_irdy(complete_rsci_irdy)
    );
  axi_test_core_complete_rsci_complete_wait_dp axi_test_core_complete_rsci_complete_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .complete_rsci_oswt(complete_rsci_oswt),
      .complete_rsci_wen_comp(complete_rsci_wen_comp),
      .complete_rsci_biwt(complete_rsci_biwt),
      .complete_rsci_bdwt(complete_rsci_bdwt),
      .complete_rsci_bcwt(complete_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_a_rsci
// ------------------------------------------------------------------


module axi_test_core_a_rsci (
  clk, rst, a_rsc_m_wstate, a_rsc_m_wCaughtUp, a_rsc_RREADY, a_rsc_RVALID, a_rsc_RUSER,
      a_rsc_RLAST, a_rsc_RRESP, a_rsc_RDATA, a_rsc_RID, a_rsc_ARREADY, a_rsc_ARVALID,
      a_rsc_ARUSER, a_rsc_ARREGION, a_rsc_ARQOS, a_rsc_ARPROT, a_rsc_ARCACHE, a_rsc_ARLOCK,
      a_rsc_ARBURST, a_rsc_ARSIZE, a_rsc_ARLEN, a_rsc_ARADDR, a_rsc_ARID, a_rsc_BREADY,
      a_rsc_BVALID, a_rsc_BUSER, a_rsc_BRESP, a_rsc_BID, a_rsc_WREADY, a_rsc_WVALID,
      a_rsc_WUSER, a_rsc_WLAST, a_rsc_WSTRB, a_rsc_WDATA, a_rsc_AWREADY, a_rsc_AWVALID,
      a_rsc_AWUSER, a_rsc_AWREGION, a_rsc_AWQOS, a_rsc_AWPROT, a_rsc_AWCACHE, a_rsc_AWLOCK,
      a_rsc_AWBURST, a_rsc_AWSIZE, a_rsc_AWLEN, a_rsc_AWADDR, a_rsc_AWID, core_wen,
      a_rsci_oswt, a_rsci_wen_comp, a_rsci_oswt_1, a_rsci_wen_comp_1, a_rsci_m_waddr_core,
      a_rsci_m_raddr_core, a_rsci_m_din_mxwt, a_rsci_m_dout_core
);
  input clk;
  input rst;
  output [2:0] a_rsc_m_wstate;
  output a_rsc_m_wCaughtUp;
  output a_rsc_RREADY;
  input a_rsc_RVALID;
  input a_rsc_RUSER;
  input a_rsc_RLAST;
  input [1:0] a_rsc_RRESP;
  input [31:0] a_rsc_RDATA;
  input a_rsc_RID;
  input a_rsc_ARREADY;
  output a_rsc_ARVALID;
  output a_rsc_ARUSER;
  output [3:0] a_rsc_ARREGION;
  output [3:0] a_rsc_ARQOS;
  output [2:0] a_rsc_ARPROT;
  output [3:0] a_rsc_ARCACHE;
  output a_rsc_ARLOCK;
  output [1:0] a_rsc_ARBURST;
  output [2:0] a_rsc_ARSIZE;
  output [7:0] a_rsc_ARLEN;
  output [31:0] a_rsc_ARADDR;
  output a_rsc_ARID;
  output a_rsc_BREADY;
  input a_rsc_BVALID;
  input a_rsc_BUSER;
  input [1:0] a_rsc_BRESP;
  input a_rsc_BID;
  input a_rsc_WREADY;
  output a_rsc_WVALID;
  output a_rsc_WUSER;
  output a_rsc_WLAST;
  output [3:0] a_rsc_WSTRB;
  output [31:0] a_rsc_WDATA;
  input a_rsc_AWREADY;
  output a_rsc_AWVALID;
  output a_rsc_AWUSER;
  output [3:0] a_rsc_AWREGION;
  output [3:0] a_rsc_AWQOS;
  output [2:0] a_rsc_AWPROT;
  output [3:0] a_rsc_AWCACHE;
  output a_rsc_AWLOCK;
  output [1:0] a_rsc_AWBURST;
  output [2:0] a_rsc_AWSIZE;
  output [7:0] a_rsc_AWLEN;
  output [31:0] a_rsc_AWADDR;
  output a_rsc_AWID;
  input core_wen;
  input a_rsci_oswt;
  output a_rsci_wen_comp;
  input a_rsci_oswt_1;
  output a_rsci_wen_comp_1;
  input [3:0] a_rsci_m_waddr_core;
  input [3:0] a_rsci_m_raddr_core;
  output [31:0] a_rsci_m_din_mxwt;
  input [31:0] a_rsci_m_dout_core;


  // Interconnect Declarations
  wire a_rsci_biwt;
  wire a_rsci_bdwt;
  wire a_rsci_bcwt;
  wire a_rsci_m_re_core_sct;
  wire a_rsci_biwt_1;
  wire a_rsci_bdwt_2;
  wire a_rsci_bcwt_1;
  wire a_rsci_m_we_core_sct;
  wire [3:0] a_rsci_m_waddr;
  wire [3:0] a_rsci_m_raddr;
  wire [31:0] a_rsci_m_din;
  wire [31:0] a_rsci_m_dout;
  wire a_rsci_m_wrdy;
  wire a_rsci_m_rrdy;
  wire a_rsc_is_idle_1;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_master #(.rscid(32'sd0),
  .depth(32'sd16),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd4),
  .wburstsize(32'sd0),
  .rburstsize(32'sd0),
  .rst_ph(32'sd0),
  .timeout(32'sd0),
  .ADDR_WIDTH(32'sd32),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0),
  .wBASE_ADDRESSU(32'sd0),
  .rBASE_ADDRESSU(32'sd0)) a_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(a_rsc_AWID),
      .AWADDR(a_rsc_AWADDR),
      .AWLEN(a_rsc_AWLEN),
      .AWSIZE(a_rsc_AWSIZE),
      .AWBURST(a_rsc_AWBURST),
      .AWLOCK(a_rsc_AWLOCK),
      .AWCACHE(a_rsc_AWCACHE),
      .AWPROT(a_rsc_AWPROT),
      .AWQOS(a_rsc_AWQOS),
      .AWREGION(a_rsc_AWREGION),
      .AWUSER(a_rsc_AWUSER),
      .AWVALID(a_rsc_AWVALID),
      .AWREADY(a_rsc_AWREADY),
      .WDATA(a_rsc_WDATA),
      .WSTRB(a_rsc_WSTRB),
      .WLAST(a_rsc_WLAST),
      .WUSER(a_rsc_WUSER),
      .WVALID(a_rsc_WVALID),
      .WREADY(a_rsc_WREADY),
      .BID(a_rsc_BID),
      .BRESP(a_rsc_BRESP),
      .BUSER(a_rsc_BUSER),
      .BVALID(a_rsc_BVALID),
      .BREADY(a_rsc_BREADY),
      .ARID(a_rsc_ARID),
      .ARADDR(a_rsc_ARADDR),
      .ARLEN(a_rsc_ARLEN),
      .ARSIZE(a_rsc_ARSIZE),
      .ARBURST(a_rsc_ARBURST),
      .ARLOCK(a_rsc_ARLOCK),
      .ARCACHE(a_rsc_ARCACHE),
      .ARPROT(a_rsc_ARPROT),
      .ARQOS(a_rsc_ARQOS),
      .ARREGION(a_rsc_ARREGION),
      .ARUSER(a_rsc_ARUSER),
      .ARVALID(a_rsc_ARVALID),
      .ARREADY(a_rsc_ARREADY),
      .RID(a_rsc_RID),
      .RDATA(a_rsc_RDATA),
      .RRESP(a_rsc_RRESP),
      .RLAST(a_rsc_RLAST),
      .RUSER(a_rsc_RUSER),
      .RVALID(a_rsc_RVALID),
      .RREADY(a_rsc_RREADY),
      .m_re(a_rsci_m_re_core_sct),
      .m_we(a_rsci_m_we_core_sct),
      .m_waddr(a_rsci_m_waddr),
      .m_raddr(a_rsci_m_raddr),
      .m_wburst(32'b00000000000000000000000000000000),
      .m_rburst(32'b00000000000000000000000000000000),
      .m_din(a_rsci_m_din),
      .m_dout(a_rsci_m_dout),
      .m_wrdy(a_rsci_m_wrdy),
      .m_rrdy(a_rsci_m_rrdy),
      .is_idle(a_rsc_is_idle_1),
      .m_wCaughtUp(a_rsc_m_wCaughtUp),
      .m_wstate(a_rsc_m_wstate)
    );
  axi_test_core_a_rsci_a_rsc_wait_ctrl axi_test_core_a_rsci_a_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .a_rsci_oswt(a_rsci_oswt),
      .a_rsci_oswt_1(a_rsci_oswt_1),
      .a_rsci_biwt(a_rsci_biwt),
      .a_rsci_bdwt(a_rsci_bdwt),
      .a_rsci_bcwt(a_rsci_bcwt),
      .a_rsci_m_re_core_sct(a_rsci_m_re_core_sct),
      .a_rsci_biwt_1(a_rsci_biwt_1),
      .a_rsci_bdwt_2(a_rsci_bdwt_2),
      .a_rsci_bcwt_1(a_rsci_bcwt_1),
      .a_rsci_m_we_core_sct(a_rsci_m_we_core_sct),
      .a_rsci_m_wrdy(a_rsci_m_wrdy),
      .a_rsci_m_rrdy(a_rsci_m_rrdy)
    );
  axi_test_core_a_rsci_a_rsc_wait_dp axi_test_core_a_rsci_a_rsc_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .a_rsci_oswt(a_rsci_oswt),
      .a_rsci_wen_comp(a_rsci_wen_comp),
      .a_rsci_oswt_1(a_rsci_oswt_1),
      .a_rsci_wen_comp_1(a_rsci_wen_comp_1),
      .a_rsci_m_waddr_core(a_rsci_m_waddr_core),
      .a_rsci_m_raddr_core(a_rsci_m_raddr_core),
      .a_rsci_m_din_mxwt(a_rsci_m_din_mxwt),
      .a_rsci_m_dout_core(a_rsci_m_dout_core),
      .a_rsci_biwt(a_rsci_biwt),
      .a_rsci_bdwt(a_rsci_bdwt),
      .a_rsci_bcwt(a_rsci_bcwt),
      .a_rsci_biwt_1(a_rsci_biwt_1),
      .a_rsci_bdwt_2(a_rsci_bdwt_2),
      .a_rsci_bcwt_1(a_rsci_bcwt_1),
      .a_rsci_m_waddr(a_rsci_m_waddr),
      .a_rsci_m_waddr_core_sct(a_rsci_m_we_core_sct),
      .a_rsci_m_raddr(a_rsci_m_raddr),
      .a_rsci_m_raddr_core_sct(a_rsci_m_re_core_sct),
      .a_rsci_m_din(a_rsci_m_din),
      .a_rsci_m_dout(a_rsci_m_dout)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core_run_rsci
// ------------------------------------------------------------------


module axi_test_core_run_rsci (
  clk, rst, run_rsc_rdy, run_rsc_vld, core_wen, run_rsci_oswt, core_wten, run_rsci_ivld_mxwt
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  input core_wen;
  input run_rsci_oswt;
  input core_wten;
  output run_rsci_ivld_mxwt;


  // Interconnect Declarations
  wire run_rsci_ivld;
  wire run_rsci_biwt;
  wire run_rsci_bdwt;


  // Interconnect Declarations for Component Instantiations 
  ccs_sync_in_wait_v1 #(.rscid(32'sd1)) run_rsci (
      .vld(run_rsc_vld),
      .rdy(run_rsc_rdy),
      .ivld(run_rsci_ivld),
      .irdy(run_rsci_biwt)
    );
  axi_test_core_run_rsci_run_wait_ctrl axi_test_core_run_rsci_run_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .run_rsci_oswt(run_rsci_oswt),
      .core_wten(core_wten),
      .run_rsci_biwt(run_rsci_biwt),
      .run_rsci_bdwt(run_rsci_bdwt)
    );
  axi_test_core_run_rsci_run_wait_dp axi_test_core_run_rsci_run_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .run_rsci_ivld_mxwt(run_rsci_ivld_mxwt),
      .run_rsci_ivld(run_rsci_ivld),
      .run_rsci_biwt(run_rsci_biwt),
      .run_rsci_bdwt(run_rsci_bdwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test_core
// ------------------------------------------------------------------


module axi_test_core (
  clk, rst, run_rsc_rdy, run_rsc_vld, a_rsc_m_wstate, a_rsc_m_wCaughtUp, a_rsc_RREADY,
      a_rsc_RVALID, a_rsc_RUSER, a_rsc_RLAST, a_rsc_RRESP, a_rsc_RDATA, a_rsc_RID,
      a_rsc_ARREADY, a_rsc_ARVALID, a_rsc_ARUSER, a_rsc_ARREGION, a_rsc_ARQOS, a_rsc_ARPROT,
      a_rsc_ARCACHE, a_rsc_ARLOCK, a_rsc_ARBURST, a_rsc_ARSIZE, a_rsc_ARLEN, a_rsc_ARADDR,
      a_rsc_ARID, a_rsc_BREADY, a_rsc_BVALID, a_rsc_BUSER, a_rsc_BRESP, a_rsc_BID,
      a_rsc_WREADY, a_rsc_WVALID, a_rsc_WUSER, a_rsc_WLAST, a_rsc_WSTRB, a_rsc_WDATA,
      a_rsc_AWREADY, a_rsc_AWVALID, a_rsc_AWUSER, a_rsc_AWREGION, a_rsc_AWQOS, a_rsc_AWPROT,
      a_rsc_AWCACHE, a_rsc_AWLOCK, a_rsc_AWBURST, a_rsc_AWSIZE, a_rsc_AWLEN, a_rsc_AWADDR,
      a_rsc_AWID, a_rsc_triosy_lz, complete_rsc_rdy, complete_rsc_vld
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [2:0] a_rsc_m_wstate;
  output a_rsc_m_wCaughtUp;
  output a_rsc_RREADY;
  input a_rsc_RVALID;
  input a_rsc_RUSER;
  input a_rsc_RLAST;
  input [1:0] a_rsc_RRESP;
  input [31:0] a_rsc_RDATA;
  input a_rsc_RID;
  input a_rsc_ARREADY;
  output a_rsc_ARVALID;
  output a_rsc_ARUSER;
  output [3:0] a_rsc_ARREGION;
  output [3:0] a_rsc_ARQOS;
  output [2:0] a_rsc_ARPROT;
  output [3:0] a_rsc_ARCACHE;
  output a_rsc_ARLOCK;
  output [1:0] a_rsc_ARBURST;
  output [2:0] a_rsc_ARSIZE;
  output [7:0] a_rsc_ARLEN;
  output [31:0] a_rsc_ARADDR;
  output a_rsc_ARID;
  output a_rsc_BREADY;
  input a_rsc_BVALID;
  input a_rsc_BUSER;
  input [1:0] a_rsc_BRESP;
  input a_rsc_BID;
  input a_rsc_WREADY;
  output a_rsc_WVALID;
  output a_rsc_WUSER;
  output a_rsc_WLAST;
  output [3:0] a_rsc_WSTRB;
  output [31:0] a_rsc_WDATA;
  input a_rsc_AWREADY;
  output a_rsc_AWVALID;
  output a_rsc_AWUSER;
  output [3:0] a_rsc_AWREGION;
  output [3:0] a_rsc_AWQOS;
  output [2:0] a_rsc_AWPROT;
  output [3:0] a_rsc_AWCACHE;
  output a_rsc_AWLOCK;
  output [1:0] a_rsc_AWBURST;
  output [2:0] a_rsc_AWSIZE;
  output [7:0] a_rsc_AWLEN;
  output [31:0] a_rsc_AWADDR;
  output a_rsc_AWID;
  output a_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;


  // Interconnect Declarations
  wire core_wen;
  wire core_wten;
  wire run_rsci_ivld_mxwt;
  wire a_rsci_wen_comp;
  wire a_rsci_wen_comp_1;
  reg [3:0] a_rsci_m_waddr_core;
  reg [3:0] a_rsci_m_raddr_core;
  wire [31:0] a_rsci_m_din_mxwt;
  wire complete_rsci_wen_comp;
  reg [29:0] a_rsci_m_dout_core_31_2;
  wire [30:0] nl_a_rsci_m_dout_core_31_2;
  reg [1:0] a_rsci_m_dout_core_1_0;
  wire [5:0] fsm_output;
  reg [4:0] ADD_LOOP_i_4_0_sva_1;
  wire [5:0] nl_ADD_LOOP_i_4_0_sva_1;
  reg run_ac_sync_tmp_dobj_sva;
  reg reg_run_rsci_oswt_cse;
  reg reg_a_rsci_oswt_cse;
  reg reg_a_rsci_oswt_1_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_a_rsc_triosy_obj_iswt0_cse;


  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_axi_test_core_a_rsci_inst_a_rsci_m_dout_core;
  assign nl_axi_test_core_a_rsci_inst_a_rsci_m_dout_core = {a_rsci_m_dout_core_31_2
      , a_rsci_m_dout_core_1_0};
  wire [0:0] nl_axi_test_core_core_fsm_inst_main_C_0_tr0;
  assign nl_axi_test_core_core_fsm_inst_main_C_0_tr0 = ~ run_ac_sync_tmp_dobj_sva;
  wire [0:0] nl_axi_test_core_core_fsm_inst_ADD_LOOP_C_1_tr0;
  assign nl_axi_test_core_core_fsm_inst_ADD_LOOP_C_1_tr0 = ADD_LOOP_i_4_0_sva_1[4];
  axi_test_core_run_rsci axi_test_core_run_rsci_inst (
      .clk(clk),
      .rst(rst),
      .run_rsc_rdy(run_rsc_rdy),
      .run_rsc_vld(run_rsc_vld),
      .core_wen(core_wen),
      .run_rsci_oswt(reg_run_rsci_oswt_cse),
      .core_wten(core_wten),
      .run_rsci_ivld_mxwt(run_rsci_ivld_mxwt)
    );
  axi_test_core_a_rsci axi_test_core_a_rsci_inst (
      .clk(clk),
      .rst(rst),
      .a_rsc_m_wstate(a_rsc_m_wstate),
      .a_rsc_m_wCaughtUp(a_rsc_m_wCaughtUp),
      .a_rsc_RREADY(a_rsc_RREADY),
      .a_rsc_RVALID(a_rsc_RVALID),
      .a_rsc_RUSER(a_rsc_RUSER),
      .a_rsc_RLAST(a_rsc_RLAST),
      .a_rsc_RRESP(a_rsc_RRESP),
      .a_rsc_RDATA(a_rsc_RDATA),
      .a_rsc_RID(a_rsc_RID),
      .a_rsc_ARREADY(a_rsc_ARREADY),
      .a_rsc_ARVALID(a_rsc_ARVALID),
      .a_rsc_ARUSER(a_rsc_ARUSER),
      .a_rsc_ARREGION(a_rsc_ARREGION),
      .a_rsc_ARQOS(a_rsc_ARQOS),
      .a_rsc_ARPROT(a_rsc_ARPROT),
      .a_rsc_ARCACHE(a_rsc_ARCACHE),
      .a_rsc_ARLOCK(a_rsc_ARLOCK),
      .a_rsc_ARBURST(a_rsc_ARBURST),
      .a_rsc_ARSIZE(a_rsc_ARSIZE),
      .a_rsc_ARLEN(a_rsc_ARLEN),
      .a_rsc_ARADDR(a_rsc_ARADDR),
      .a_rsc_ARID(a_rsc_ARID),
      .a_rsc_BREADY(a_rsc_BREADY),
      .a_rsc_BVALID(a_rsc_BVALID),
      .a_rsc_BUSER(a_rsc_BUSER),
      .a_rsc_BRESP(a_rsc_BRESP),
      .a_rsc_BID(a_rsc_BID),
      .a_rsc_WREADY(a_rsc_WREADY),
      .a_rsc_WVALID(a_rsc_WVALID),
      .a_rsc_WUSER(a_rsc_WUSER),
      .a_rsc_WLAST(a_rsc_WLAST),
      .a_rsc_WSTRB(a_rsc_WSTRB),
      .a_rsc_WDATA(a_rsc_WDATA),
      .a_rsc_AWREADY(a_rsc_AWREADY),
      .a_rsc_AWVALID(a_rsc_AWVALID),
      .a_rsc_AWUSER(a_rsc_AWUSER),
      .a_rsc_AWREGION(a_rsc_AWREGION),
      .a_rsc_AWQOS(a_rsc_AWQOS),
      .a_rsc_AWPROT(a_rsc_AWPROT),
      .a_rsc_AWCACHE(a_rsc_AWCACHE),
      .a_rsc_AWLOCK(a_rsc_AWLOCK),
      .a_rsc_AWBURST(a_rsc_AWBURST),
      .a_rsc_AWSIZE(a_rsc_AWSIZE),
      .a_rsc_AWLEN(a_rsc_AWLEN),
      .a_rsc_AWADDR(a_rsc_AWADDR),
      .a_rsc_AWID(a_rsc_AWID),
      .core_wen(core_wen),
      .a_rsci_oswt(reg_a_rsci_oswt_cse),
      .a_rsci_wen_comp(a_rsci_wen_comp),
      .a_rsci_oswt_1(reg_a_rsci_oswt_1_cse),
      .a_rsci_wen_comp_1(a_rsci_wen_comp_1),
      .a_rsci_m_waddr_core(a_rsci_m_waddr_core),
      .a_rsci_m_raddr_core(a_rsci_m_raddr_core),
      .a_rsci_m_din_mxwt(a_rsci_m_din_mxwt),
      .a_rsci_m_dout_core(nl_axi_test_core_a_rsci_inst_a_rsci_m_dout_core[31:0])
    );
  axi_test_core_complete_rsci axi_test_core_complete_rsci_inst (
      .clk(clk),
      .rst(rst),
      .complete_rsc_rdy(complete_rsc_rdy),
      .complete_rsc_vld(complete_rsc_vld),
      .core_wen(core_wen),
      .complete_rsci_oswt(reg_complete_rsci_oswt_cse),
      .complete_rsci_wen_comp(complete_rsci_wen_comp)
    );
  axi_test_core_a_rsc_triosy_obj axi_test_core_a_rsc_triosy_obj_inst (
      .a_rsc_triosy_lz(a_rsc_triosy_lz),
      .core_wten(core_wten),
      .a_rsc_triosy_obj_iswt0(reg_a_rsc_triosy_obj_iswt0_cse)
    );
  axi_test_core_staller axi_test_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .a_rsci_wen_comp(a_rsci_wen_comp),
      .a_rsci_wen_comp_1(a_rsci_wen_comp_1),
      .complete_rsci_wen_comp(complete_rsci_wen_comp)
    );
  axi_test_core_core_fsm axi_test_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output),
      .main_C_0_tr0(nl_axi_test_core_core_fsm_inst_main_C_0_tr0[0:0]),
      .ADD_LOOP_C_1_tr0(nl_axi_test_core_core_fsm_inst_ADD_LOOP_C_1_tr0[0:0])
    );
  always @(posedge clk) begin
    if ( core_wen ) begin
      a_rsci_m_waddr_core <= a_rsci_m_raddr_core;
      a_rsci_m_raddr_core <= MUX_v_4_2_2(4'b0000, (ADD_LOOP_i_4_0_sva_1[3:0]), (fsm_output[3]));
      a_rsci_m_dout_core_1_0 <= a_rsci_m_din_mxwt[1:0];
      a_rsci_m_dout_core_31_2 <= nl_a_rsci_m_dout_core_31_2[29:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_run_rsci_oswt_cse <= 1'b0;
      reg_a_rsci_oswt_cse <= 1'b0;
      reg_a_rsci_oswt_1_cse <= 1'b0;
      reg_complete_rsci_oswt_cse <= 1'b0;
      reg_a_rsc_triosy_obj_iswt0_cse <= 1'b0;
      ADD_LOOP_i_4_0_sva_1 <= 5'b00000;
    end
    else if ( core_wen ) begin
      reg_run_rsci_oswt_cse <= (fsm_output[0]) | (fsm_output[5]);
      reg_a_rsci_oswt_cse <= ((~ (ADD_LOOP_i_4_0_sva_1[4])) & (fsm_output[3])) |
          (run_ac_sync_tmp_dobj_sva & (fsm_output[1]));
      reg_a_rsci_oswt_1_cse <= fsm_output[2];
      reg_complete_rsci_oswt_cse <= (ADD_LOOP_i_4_0_sva_1[4]) & (fsm_output[3]);
      reg_a_rsc_triosy_obj_iswt0_cse <= fsm_output[4];
      ADD_LOOP_i_4_0_sva_1 <= nl_ADD_LOOP_i_4_0_sva_1[4:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      run_ac_sync_tmp_dobj_sva <= 1'b0;
    end
    else if ( core_wen & (fsm_output[1]) ) begin
      run_ac_sync_tmp_dobj_sva <= run_rsci_ivld_mxwt;
    end
  end
  assign nl_a_rsci_m_dout_core_31_2  = (a_rsci_m_din_mxwt[31:2]) + 30'b000000000000000000000000011001;
  assign nl_ADD_LOOP_i_4_0_sva_1  = conv_u2u_4_5(a_rsci_m_raddr_core) + 5'b00001;

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


  function automatic [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    axi_test
// ------------------------------------------------------------------


module axi_test (
  clk, rst, run_rsc_rdy, run_rsc_vld, a_rsc_m_wstate, a_rsc_m_wCaughtUp, a_rsc_RREADY,
      a_rsc_RVALID, a_rsc_RUSER, a_rsc_RLAST, a_rsc_RRESP, a_rsc_RDATA, a_rsc_RID,
      a_rsc_ARREADY, a_rsc_ARVALID, a_rsc_ARUSER, a_rsc_ARREGION, a_rsc_ARQOS, a_rsc_ARPROT,
      a_rsc_ARCACHE, a_rsc_ARLOCK, a_rsc_ARBURST, a_rsc_ARSIZE, a_rsc_ARLEN, a_rsc_ARADDR,
      a_rsc_ARID, a_rsc_BREADY, a_rsc_BVALID, a_rsc_BUSER, a_rsc_BRESP, a_rsc_BID,
      a_rsc_WREADY, a_rsc_WVALID, a_rsc_WUSER, a_rsc_WLAST, a_rsc_WSTRB, a_rsc_WDATA,
      a_rsc_AWREADY, a_rsc_AWVALID, a_rsc_AWUSER, a_rsc_AWREGION, a_rsc_AWQOS, a_rsc_AWPROT,
      a_rsc_AWCACHE, a_rsc_AWLOCK, a_rsc_AWBURST, a_rsc_AWSIZE, a_rsc_AWLEN, a_rsc_AWADDR,
      a_rsc_AWID, a_rsc_triosy_lz, complete_rsc_rdy, complete_rsc_vld
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [2:0] a_rsc_m_wstate;
  output a_rsc_m_wCaughtUp;
  output a_rsc_RREADY;
  input a_rsc_RVALID;
  input a_rsc_RUSER;
  input a_rsc_RLAST;
  input [1:0] a_rsc_RRESP;
  input [31:0] a_rsc_RDATA;
  input a_rsc_RID;
  input a_rsc_ARREADY;
  output a_rsc_ARVALID;
  output a_rsc_ARUSER;
  output [3:0] a_rsc_ARREGION;
  output [3:0] a_rsc_ARQOS;
  output [2:0] a_rsc_ARPROT;
  output [3:0] a_rsc_ARCACHE;
  output a_rsc_ARLOCK;
  output [1:0] a_rsc_ARBURST;
  output [2:0] a_rsc_ARSIZE;
  output [7:0] a_rsc_ARLEN;
  output [31:0] a_rsc_ARADDR;
  output a_rsc_ARID;
  output a_rsc_BREADY;
  input a_rsc_BVALID;
  input a_rsc_BUSER;
  input [1:0] a_rsc_BRESP;
  input a_rsc_BID;
  input a_rsc_WREADY;
  output a_rsc_WVALID;
  output a_rsc_WUSER;
  output a_rsc_WLAST;
  output [3:0] a_rsc_WSTRB;
  output [31:0] a_rsc_WDATA;
  input a_rsc_AWREADY;
  output a_rsc_AWVALID;
  output a_rsc_AWUSER;
  output [3:0] a_rsc_AWREGION;
  output [3:0] a_rsc_AWQOS;
  output [2:0] a_rsc_AWPROT;
  output [3:0] a_rsc_AWCACHE;
  output a_rsc_AWLOCK;
  output [1:0] a_rsc_AWBURST;
  output [2:0] a_rsc_AWSIZE;
  output [7:0] a_rsc_AWLEN;
  output [31:0] a_rsc_AWADDR;
  output a_rsc_AWID;
  output a_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;



  // Interconnect Declarations for Component Instantiations 
  axi_test_core axi_test_core_inst (
      .clk(clk),
      .rst(rst),
      .run_rsc_rdy(run_rsc_rdy),
      .run_rsc_vld(run_rsc_vld),
      .a_rsc_m_wstate(a_rsc_m_wstate),
      .a_rsc_m_wCaughtUp(a_rsc_m_wCaughtUp),
      .a_rsc_RREADY(a_rsc_RREADY),
      .a_rsc_RVALID(a_rsc_RVALID),
      .a_rsc_RUSER(a_rsc_RUSER),
      .a_rsc_RLAST(a_rsc_RLAST),
      .a_rsc_RRESP(a_rsc_RRESP),
      .a_rsc_RDATA(a_rsc_RDATA),
      .a_rsc_RID(a_rsc_RID),
      .a_rsc_ARREADY(a_rsc_ARREADY),
      .a_rsc_ARVALID(a_rsc_ARVALID),
      .a_rsc_ARUSER(a_rsc_ARUSER),
      .a_rsc_ARREGION(a_rsc_ARREGION),
      .a_rsc_ARQOS(a_rsc_ARQOS),
      .a_rsc_ARPROT(a_rsc_ARPROT),
      .a_rsc_ARCACHE(a_rsc_ARCACHE),
      .a_rsc_ARLOCK(a_rsc_ARLOCK),
      .a_rsc_ARBURST(a_rsc_ARBURST),
      .a_rsc_ARSIZE(a_rsc_ARSIZE),
      .a_rsc_ARLEN(a_rsc_ARLEN),
      .a_rsc_ARADDR(a_rsc_ARADDR),
      .a_rsc_ARID(a_rsc_ARID),
      .a_rsc_BREADY(a_rsc_BREADY),
      .a_rsc_BVALID(a_rsc_BVALID),
      .a_rsc_BUSER(a_rsc_BUSER),
      .a_rsc_BRESP(a_rsc_BRESP),
      .a_rsc_BID(a_rsc_BID),
      .a_rsc_WREADY(a_rsc_WREADY),
      .a_rsc_WVALID(a_rsc_WVALID),
      .a_rsc_WUSER(a_rsc_WUSER),
      .a_rsc_WLAST(a_rsc_WLAST),
      .a_rsc_WSTRB(a_rsc_WSTRB),
      .a_rsc_WDATA(a_rsc_WDATA),
      .a_rsc_AWREADY(a_rsc_AWREADY),
      .a_rsc_AWVALID(a_rsc_AWVALID),
      .a_rsc_AWUSER(a_rsc_AWUSER),
      .a_rsc_AWREGION(a_rsc_AWREGION),
      .a_rsc_AWQOS(a_rsc_AWQOS),
      .a_rsc_AWPROT(a_rsc_AWPROT),
      .a_rsc_AWCACHE(a_rsc_AWCACHE),
      .a_rsc_AWLOCK(a_rsc_AWLOCK),
      .a_rsc_AWBURST(a_rsc_AWBURST),
      .a_rsc_AWSIZE(a_rsc_AWSIZE),
      .a_rsc_AWLEN(a_rsc_AWLEN),
      .a_rsc_AWADDR(a_rsc_AWADDR),
      .a_rsc_AWID(a_rsc_AWID),
      .a_rsc_triosy_lz(a_rsc_triosy_lz),
      .complete_rsc_rdy(complete_rsc_rdy),
      .complete_rsc_vld(complete_rsc_vld)
    );
endmodule


