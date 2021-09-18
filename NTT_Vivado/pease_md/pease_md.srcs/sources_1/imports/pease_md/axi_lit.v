// ==============================================================
// Copyright (C) 1986-2016 deasy, Inc. All Rights Reserved.
// ==============================================================

`timescale 1ns/1ps
module axi_lit
#(parameter
    C_ADDR_WIDTH   = 8,
    C_DATA_WIDTH   = 32
)(
    // axi4 lite slave signals
    input  wire                      ACLK,
    input  wire                      ARESETN,
    input  wire [C_ADDR_WIDTH-1:0]   AWADDR,
    input  wire                      AWVALID,
    output wire                      AWREADY,
    input  wire [C_DATA_WIDTH-1:0]   WDATA,
    input  wire [C_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                      WVALID,
    output wire                      WREADY,
    output wire [1:0]                BRESP,
    output wire                      BVALID,
    input  wire                      BREADY,
    input  wire [C_ADDR_WIDTH-1:0]   ARADDR,
    input  wire                      ARVALID,
    output wire                      ARREADY,
    output wire [C_DATA_WIDTH-1:0]   RDATA,
    output wire [1:0]                RRESP,
    output wire                      RVALID,
    input  wire                      RREADY,

    // user signals

    output [31:0]                    arg_o_0,
    output [31:0]                    arg_o_1,
    output [31:0]                    arg_o_2,
    output [31:0]                    arg_o_3,        

    output [35:0]                    axi_base_addr_o,        

    output wire                      ap_start_o,    
    output wire                      interrupt_o,
    output wire                      rst_n_o,

    input   ap_done,
    input   ap_idle,
    input   ap_ready

);
//------------------------Address Info-------------------
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 
// 0x10 above : reserved
//------------------------Parameter----------------------
// address bits
localparam
    ADDR_BITS = 6; 

// address
localparam
    ADDR_CTRL               = 6'h00,
    ADDR_GIE                = 6'h04,
    ADDR_IER                = 6'h08,
    ADDR_ISR                = 6'h0c,

    ADDR_arg_0              = 6'h10,
    ADDR_arg_1              = 6'h14,
    ADDR_arg_2              = 6'h18,
    ADDR_arg_3              = 6'h1c,

    // ADDR_ROWS               = 6'h10,
    // ADDR_COLS               = 6'h14,
    // ADDR_IMAGE_SIZE         = 6'h18,
    // ADDR_INPUT_FIFO_FULL    = 6'h1c,

    ADDR_hls_o0              = 6'h10,
    ADDR_hls_o1              = 6'h14,
    ADDR_hls_o2              = 6'h18,
    ADDR_hls_o3              = 6'h1c,    

    ADDR_bar_l               = 6'h38, 
    ADDR_bar_u               = 6'h3c;                    

// axi write fsm
localparam
    WRIDLE = 2'd0,
    WRDATA = 2'd1,
    WRRESP = 2'd2;

// axi read fsm
localparam
    RDIDLE = 2'd0,
    RDDATA = 2'd1;

//------------------------Local signal-------------------
// axi write
reg  [1:0]           wstate;
reg  [1:0]           wnext;
reg  [ADDR_BITS-1:0] waddr;
wire [31:0]          wmask;
wire                 aw_hs;
wire                 w_hs;
// axi read
reg  [1:0]           rstate;
reg  [1:0]           rnext;
reg  [31:0]          rdata;
wire                 ar_hs;
wire [ADDR_BITS-1:0] raddr;

// internal registers

reg  [31:0]          contrl_r;
reg  [7:0]           gie_r;
reg  [7:0]           ier_r;
reg  [7:0]           isr_r;
reg  [31:0]          hls_arg_0;
reg  [31:0]          hls_arg_1;
reg  [31:0]          hls_arg_2;
reg  [31:0]          hls_arg_3;     
reg [35:0]           axi_base_addr;      

//------------------------Body---------------------------
//++++++++++++++++++++++++axi write++++++++++++++++++++++
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK or negedge ARESETN) begin
    if (~ARESETN)
        wstate <= WRIDLE;
    else
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (aw_hs)
        waddr <= AWADDR[ADDR_BITS-1:0];
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++axi read+++++++++++++++++++++++
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK or negedge ARESETN) begin
    if (~ARESETN)
        rstate <= RDIDLE;
    else
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK ) begin
    if (ar_hs) begin
        rdata = 0;
        case (raddr)
            ADDR_CTRL: 
                rdata  = contrl_r;

            ADDR_GIE: 
                rdata = gie_r;
            
            ADDR_IER: 
                rdata = ier_r;
            
            ADDR_ISR: 
                rdata = 0;    // isr_r
            
            ADDR_arg_0: 
                rdata = {16'b0,14'b0,ap_idle,ap_done};
            
            ADDR_arg_1: 
                rdata = 0;

            ADDR_arg_2:
                rdata = 0;

            ADDR_arg_3:
                rdata = 0;

            default:
                rdata = 0;

        endcase
    end
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++internal registers+++++++++++++
assign rst_n_o     = contrl_r[0];
assign ap_start_o  = contrl_r[1];

assign interrupt_o = gie_r & (|isr_r);

assign arg_o_0     = hls_arg_0;
assign arg_o_1     = hls_arg_1;
assign arg_o_2     = hls_arg_2;
assign arg_o_3     = hls_arg_3;

assign axi_base_addr_o = axi_base_addr[35:0] ;

//assign rst_n_o    = rstn_r[7];

// contrl_r
always @(posedge ACLK or negedge ARESETN) 
    if (~ARESETN)
        contrl_r <= 0;
    else 
        if (w_hs && waddr == ADDR_CTRL) 
            contrl_r <= (WDATA[31:0] & wmask) | (contrl_r[31:0] & ~wmask);

// gie_r
always @(posedge ACLK or negedge ARESETN) 
    if (~ARESETN)
        gie_r <= 0;
    else if (w_hs && waddr == ADDR_GIE )
        gie_r <= (WDATA[7:0] & wmask[7:0]) | (gie_r[7:0] & ~wmask[7:0]);


// ier_r
always @(posedge ACLK or negedge ARESETN) 
    if (~ARESETN)
        ier_r <= 0;
    else if (w_hs && waddr == ADDR_IER )
        ier_r <= (WDATA[7:0] & wmask[7:0]) | (ier_r[7:0] & ~wmask[7:0]);


//////////////// ADDR_arg_0-3 ////////////////////////
always @(posedge ACLK or negedge ARESETN) 
    if (~ARESETN)
        hls_arg_0 <= 0;
    else 
        if (w_hs && waddr == ADDR_arg_0 )
           hls_arg_0 <= (WDATA[31:0] & wmask) | (hls_arg_0[31:0] & ~wmask);
  
always @(posedge ACLK) 
    if (~ARESETN)
        hls_arg_1 <= 0;
    else 
    if (w_hs && waddr == ADDR_arg_1)
        hls_arg_1[31:0] <= (WDATA[31:0] & wmask) | (hls_arg_1[31:0] & ~wmask);

always @(posedge ACLK) 
    if (~ARESETN)
        hls_arg_2 <= 0;
    else 
    if (w_hs && waddr == ADDR_arg_2)
        hls_arg_2[31:0] <= (WDATA[31:0] & wmask) | (hls_arg_2[31:0] & ~wmask);

always @(posedge ACLK) 
    if (~ARESETN)
        hls_arg_3 <= 0;
    else 
    if (w_hs && waddr == ADDR_arg_3)
        hls_arg_3[31:0] <= (WDATA[31:0] & wmask) | (hls_arg_3[31:0] & ~wmask);


always @(posedge ACLK) 
    if (~ARESETN)
        axi_base_addr <= 0;
    else 
    if (w_hs && waddr == ADDR_bar_l)
        axi_base_addr[31:0] <= (WDATA[31:0] & wmask) | (axi_base_addr[31:0] & ~wmask);

always @(posedge ACLK) 
    if (~ARESETN)
        axi_base_addr <= 0;
    else 
    if (w_hs && waddr == ADDR_bar_u)
        axi_base_addr[63:32] <= (WDATA[31:0] & wmask) | (axi_base_addr[63:32] & ~wmask);

// rstn_r[7:0]
// always @(posedge ACLK or negedge ARESETN) 
//     if (~ARESETN)
//         rstn_r <= 0;
//     else
//         if (w_hs && waddr == ADDR_RST_N)
//             rstn_r <= 0;
//         else
//             if (rstn_r[7]==1'b0)
//                 rstn_r[7:3] <= rstn_r[7:3] + 1;

endmodule
