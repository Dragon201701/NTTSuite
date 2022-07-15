module axi_lit
#(parameter
    C_ADDR_WIDTH   = 32,
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

    // output wire [31:0]               out_data_0,
    // output wire [31:0]               out_data_1,
    output wire [31:0]               p_rsc_dat,
    output wire [31:0]               r_rsc_dat,
    output wire                      ac_sync_run,
    output wire                      ac_sync_complete_rsc_vzout,
    input wire                       ac_sync_complete,
    input wire                       ac_sync_run_rsc_lzin,

    input wire                       vec_rsc_triosy_0_0_lz,
    input wire                       vec_rsc_triosy_0_1_lz,
    input wire                       vec_rsc_triosy_0_2_lz,
    input wire                       vec_rsc_triosy_0_3_lz,
    input wire                       vec_rsc_triosy_0_4_lz,
    input wire                       vec_rsc_triosy_0_5_lz,
    input wire                       vec_rsc_triosy_0_6_lz,
    input wire                       vec_rsc_triosy_0_7_lz,
    input wire                       p_rsc_triosy_lz,
    input wire                       r_rsc_triosy_lz,
    input wire                       twiddle_rsc_triosy_0_0_lz,
    input wire                       twiddle_rsc_triosy_0_1_lz,
    input wire                       twiddle_rsc_triosy_0_2_lz,
    input wire                       twiddle_rsc_triosy_0_3_lz,
    input wire                       twiddle_h_rsc_triosy_0_0_lz,
    input wire                       twiddle_h_rsc_triosy_0_1_lz,
    input wire                       twiddle_h_rsc_triosy_0_2_lz,
    input wire                       twiddle_h_rsc_triosy_0_3_lz
);

localparam
    ADDR_BITS = 6; 

// address
localparam
    ADDR_control_r      = 32'h00,
    ADDR_control_w      = 32'h04,
    ADDR_p              = 32'h08,
    ADDR_r              = 32'h0c;

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

wire [31:0]          control_r;
reg  [31:0]          control_w;
reg  [31:0]          p;
reg  [31:0]          r;

//------------------------Body---------------------------
//
//++++++++++++++++++++++++axi write++++++++++++++++++++++
//
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

//++++++++++++++++++++++++internal registers+++++++++++++


// control_w
always @(posedge ACLK or negedge ARESETN) 
    if (~ARESETN)
        control_w <= 0;
    else if (w_hs && waddr == ADDR_control_w )
        control_w <= (WDATA & wmask) | (control_w & ~wmask);

// p
always @(posedge ACLK or negedge ARESETN) 
    if (~ARESETN)
        p <= 0;
    else if (w_hs && waddr == ADDR_p )
        p <= (WDATA & wmask) | (p & ~wmask);

// r
always @(posedge ACLK or negedge ARESETN) 
    if (~ARESETN)
        r <= 0;
    else if (w_hs && waddr == ADDR_r )
        r <= (WDATA & wmask) | (r & ~wmask);


// // data_r1
// always @(posedge ACLK or negedge ARESETN) 
//     if (~ARESETN)
//         data_r1 <= 0;
//     else if (w_hs && waddr == ADDR_1 )
//         data_r1 <= (WDATA & wmask) | (data_r1 & ~wmask);

assign control_r = {
    12'h000, twiddle_h_rsc_triosy_0_3_lz, twiddle_h_rsc_triosy_0_2_lz, twiddle_h_rsc_triosy_0_1_lz, twiddle_h_rsc_triosy_0_0_lz,
    twiddle_rsc_triosy_0_3_lz, twiddle_rsc_triosy_0_2_lz, twiddle_rsc_triosy_0_1_lz, twiddle_rsc_triosy_0_0_lz,
    vec_rsc_triosy_0_7_lz, vec_rsc_triosy_0_6_lz, vec_rsc_triosy_0_5_lz, vec_rsc_triosy_0_4_lz, 
    vec_rsc_triosy_0_3_lz, vec_rsc_triosy_0_2_lz, vec_rsc_triosy_0_1_lz, vec_rsc_triosy_0_0_lz,
    p_rsc_triosy_lz, r_rsc_triosy_lz, ac_sync_run_rsc_lzin, ac_sync_complete
    };

assign p_rsc_dat = p;
assign r_rsc_dat = r;
assign ac_sync_run = control_w[0]; // To run, set control_w reg bit 0 1
assign ac_sync_complete_rsc_vzout = control_w[1]; // This should be 1 when host is waiting for valid complete signal.


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
            ADDR_control_r: 
                rdata = control_r;

            default:
                rdata = 0;

        endcase
    end
end


endmodule
