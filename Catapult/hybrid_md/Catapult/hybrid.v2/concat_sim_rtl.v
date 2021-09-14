
//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_slave_mem.v 
////////////////////////////////////////////////////////////////////////////////
// Catapult Synthesis - Custom Interfaces
//
// Copyright (c) 2018 Mentor Graphics Corp.
//       All Rights Reserved
// 
// This document contains information that is proprietary to Mentor Graphics
// Corp. The original recipient of this document may duplicate this  
// document in whole or in part for internal business purposes only, provided  
// that this entire notice appears in all copies. In duplicating any part of  
// this document, the recipient agrees to make every reasonable effort to  
// prevent the unauthorized use and distribution of the proprietary information.
// 
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in prepartion for creating
// their own custom interfaces. This design does not present a complete
// implementation of the named protocol or standard.
//
// NO WARRANTY.
// MENTOR GRAPHICS CORP. EXPRESSLY DISCLAIMS ALL WARRANTY
// FOR THE SOFTWARE. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE
// LAW, THE SOFTWARE AND ANY RELATED DOCUMENTATION IS PROVIDED "AS IS"
// AND WITH ALL FAULTS AND WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
// PURPOSE, OR NONINFRINGEMENT. THE ENTIRE RISK ARISING OUT OF USE OR
// DISTRIBUTION OF THE SOFTWARE REMAINS WITH YOU.
// 
////////////////////////////////////////////////////////////////////////////////

// --------------------------------------------------------------------------
// DESIGN UNIT:        ccs_axi4_slave_mem
//
// DESCRIPTION:
//   This model implements an AXI4 Slave memory interface for use in 
//   Interface Synthesis in Catapult. The component details are described in the datasheet
//
//   AXI/Catapult read/write to the same address in the same cycle is non-determinant
//
// Notes:
//  1. This model implements a local memory of size {cwidth x depth}.
//     If the Catapult operation requires a memory width cwidth <= AXI bus width
//     this model will zero-pad the high end bits as necessary.
// CHANGE LOG:
//
//  01/29/19 - Add reset phase and separate base address for read/write channels
//  11/26/18 - Add burst and other tweaks
//  02/28/18 - Initial implementation
//
// --------------------------------------------------------------------------

// -------------------------------------------------------------------------------
//  Memory Organization
//   This model is designed to provide storage for only the bits/elements that
//   the Catapult core actually interacts with.
//   The user supplies a base address for the AXI memory store via BASE_ADDRESS
//   parameter.  
// Example:
//   C++ array declared as "ac_int<7,false>  coeffs[4];"
//   results in a Catapult operator width (op_width) of 7,
//   and cwidth=7 and addr_w=2 (addressing 4 element locations).
//   The library forces DATA_WIDTH to be big enough to hold
//   cwidth bits, rounded up to power-of-2 as needed.
// 
//   The AXI address scheme addresses bytes and so increments
//   by number-of-bytes per data transaction, plus the BASE_ADDRESS. 
//   The top and left describe the AXI view of the memory. 
//   The bottom and right describe the Catapult view of the memory.
//
//      AXI-4 SIGNALS
//      ADDR_WIDTH=4        DATA_WIDTH=32
//        AxADDR               xDATA
//                    31                       0
//                    +------------+-----------+
//      BA+0000       |            |           |
//                    +------------+-----------+
//      BA+0000       |            |           |
//                    +------------+===========+
//      BA+1100       |            |  elem3    |    11
//                    +------------+===========+
//      BA+1000       |            |  elem2    |    10
//                    +------------+===========+
//      BA+0100       |            |  elem1    |    01
//                    +------------+===========+
//      BA+0000       |            |  elem0    |    00
//                    +------------+===========+
//                                 6           0
//                                   s_din/out     s_addr
//                                   cwidth=7      addr_w=2
//                                         CATAPULT SIGNALS
//
// -------------------------------------------------------------------------------

// Uncomment this for lots of messages
//`define SLAVE_DBG_READ 1
//`define SLAVE_DBG_WRITE 1

`define AXI4_AxBURST_FIXED      2'b00
`define AXI4_AxBURST_INCR       2'b01
`define AXI4_AxBURST_WRAP       2'b10
`define AXI4_AxBURST_RESERVED   2'b11
`define AXI4_AxSIZE_001_BYTE    3'b000
`define AXI4_AxSIZE_002_BYTE    3'b001
`define AXI4_AxSIZE_004_BYTE    3'b010
`define AXI4_AxSIZE_008_BYTE    3'b011
`define AXI4_AxSIZE_016_BYTE    3'b100
`define AXI4_AxSIZE_032_BYTE    3'b101
`define AXI4_AxSIZE_064_BYTE    3'b110
`define AXI4_AxSIZE_128_BYTE    3'b111
`define AXI4_AxLOCK_NORMAL      1'b0
`define AXI4_AxLOCK_EXCLUSIVE   1'b1

`define AXI3_AxLOCK_NORMAL      2'b00
`define AXI3_AxLOCK_EXCLUSIVE   2'b01
`define AXI3_AxLOCK_LOCKED      2'b10
`define AXI3_AxLOCK_RESERVED    2'b11

`define AXI4_AxCACHE_NORM_NN    4'b0010

// W and R cache consts are almost the same
`define AXI4_AWCACHE_NB        4'b0000
`define AXI4_AWCACHE_B         4'b0001
`define AXI4_AWCACHE_NORM_NCNB 4'b0010
`define AXI4_AWCACHE_NORM_NCB  4'b0011
`define AXI4_AWCACHE_WTNA      4'b0110
`define AXI4_AWCACHE_WTRA      4'b0110
`define AXI4_AWCACHE_WTWA      4'b1110
`define AXI4_AWCACHE_WTRWA     4'b1110
`define AXI4_AWCACHE_WBNA      4'b0111
`define AXI4_AWCACHE_WBRA      4'b0111
`define AXI4_WACACHE_WBWA      4'b1111
`define AXI4_AWCACHE_WBRWA     4'b1111
`define AXI4_ARCACHE_NB        4'b0000
`define AXI4_ARCACHE_B         4'b0001
`define AXI4_ARCACHE_NORM_NCNB 4'b0010
`define AXI4_ARCACHE_NORM_NCB  4'b0011
`define AXI4_ARCACHE_WTNA      4'b1010
`define AXI4_ARCACHE_WTRA      4'b1110
`define AXI4_ARCACHE_WTWA      4'b1010
`define AXI4_ARCACHE_WTRWA     4'b1110
`define AXI4_ARCACHE_WBNA      4'b1011
`define AXI4_ARCACHE_WBRA      4'b1111
`define AXI4_ARCACHE_WBWA      4'b1011
`define AXI4_ARCACHE_WBRWA     4'b1111

`define AXI4_AxPROT_b0_UNPRIV     1'b0
`define AXI4_AxPROT_b0_PRIV       1'b1
`define AXI4_AxPROT_b1_SECURE     1'b0
`define AXI4_AxPROT_b1_UNSECURE   1'b1
`define AXI4_AxPROT_b2_DATA       1'b0
`define AXI4_AxPROT_b2_INSTR      1'b1
`define AXI4_AxQOS_NONE           4'b0000
`define AXI4_xRESP_OKAY           2'b00
`define AXI4_xRESP_EXOKAY         2'b01
`define AXI4_xRESP_SLVERR         2'b10
`define AXI4_xRESP_DECERR         2'b11

`define CLOG2(x) \
      (x <= 1) ?   0 : \
      (x <= 2) ?   1 : \
      (x <= 4) ?   2 : \
      (x <= 8) ?   3 : \
      (x <= 16) ?  4 : \
      (x <= 32) ?  5 : \
      (x <= 64) ?  6 : \
      (x <= 128) ? 7 : \
      -1

module ccs_axi4_slave_mem ( ACLK, ARESETn, 
  AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWQOS, AWREGION, AWUSER, AWVALID, AWREADY,
  WDATA, WSTRB, WLAST, WUSER, WVALID, WREADY,
  BID, BRESP, BUSER, BVALID, BREADY,
  ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARQOS, ARREGION, ARUSER, ARVALID, ARREADY,
  RID, RDATA, RRESP, RLAST, RUSER, RVALID, RREADY,
  s_re, s_we, s_raddr, s_waddr, s_din, s_dout, s_rrdy, s_wrdy, is_idle, tr_write_done, s_tdone);

   parameter rscid = 1;           // Required resource ID parameter
   parameter depth  = 16;         // Number of addressable elements
   parameter op_width = 1;        // dummy parameter for cwidth calculation
   parameter cwidth = 8;          // Internal memory data width
   parameter addr_w = 4;          // Internal memory address width
   parameter nopreload = 0;       // 1= no preload before Catapult can read
   parameter rst_ph = 0;          // Reset phase.  1= Positive edge. Default is AXI negative edge
   parameter ADDR_WIDTH = 32;     // AXI4 address width (must be >= addr_w)
   parameter DATA_WIDTH = 32;     // AXI4 data width (must be between 8 and 1024, and power of 2
   parameter ID_WIDTH    = 1;     // AXI4 ID field width (ignored in this model)
   parameter USER_WIDTH  = 1;     // AXI4 User field width (ignored in this model)
   parameter REGION_MAP_SIZE = 1; // AXI4 Region Map (ignored in this model)
   parameter wBASE_ADDRESS = 0;    // AXI4 write channel base address
   parameter rBASE_ADDRESS = 0;    // AXI4 read channel base address
   
   // AXI Clocking
   input                               ACLK;                           // Rising edge clock
   input                               ARESETn;                        // Active LOW asynchronous reset
   wire                                int_ARESETn;
   assign int_ARESETn = rst_ph ? ~ARESETn : ARESETn;

   // ============== AXI4 Slave Write Address Channel Signals
   input [ID_WIDTH-1:0]                AWID;                           // Write Transaction ID
   input [ADDR_WIDTH-1:0]              AWADDR;                         // Write address
   input [7:0]                         AWLEN;                          // Write burst length in beats
   input [2:0]                         AWSIZE;                         // Write burst size - encoding(above)
   input [1:0]                         AWBURST;                        // Write burst mode
   input                               AWLOCK;                         // Lock type
   input [3:0]                         AWCACHE;                        // Memory type
   input [2:0]                         AWPROT;                         // Protection Type
   input [3:0]                         AWQOS;                          // Quality of Service
   input [3:0]                         AWREGION;                       // Region identifier
   input [USER_WIDTH-1:0]              AWUSER;                         // User signal
   input                               AWVALID;                        // Write address valid
   output                              AWREADY;                        // Write address ready
   
   // ============== AXI4 Slave Write Data Channel
   input [DATA_WIDTH-1:0]              WDATA;                          // Write data
   input [DATA_WIDTH/8 - 1:0]          WSTRB;                          // Write strobe (bytewise)
   input                               WLAST;                          // Write last
   input [USER_WIDTH-1:0]              WUSER;                          // User signal
   input                               WVALID;                         // Write data is valid
   output                              WREADY;                         // Write ready

   // ============== AXI4 Slave Write Response Channel Signals
   output [ID_WIDTH-1:0]               BID;                            // Response Transaction ID tag
   output [1:0]                        BRESP;                          // Write response (of slave)
   output [USER_WIDTH-1:0]             BUSER;                          // User signal
   output                              BVALID;                         // Write response valid
   input                               BREADY;                         // Response ready

   // ============== AXI4 Slave Read Address Channel Signals
   input [ID_WIDTH-1:0]                ARID;                           // Read Transaction ID
   input [ADDR_WIDTH-1:0]              ARADDR;                         // Read address
   input [7:0]                         ARLEN;                          // Read burst length in beats
   input [2:0]                         ARSIZE;                         // Read burst size - encoding(above)
   input [1:0]                         ARBURST;                        // Read burst mode
   input                               ARLOCK;                         // Lock type
   input [3:0]                         ARCACHE;                        // Memory type
   input [2:0]                         ARPROT;                         // Protection Type
   input [3:0]                         ARQOS;                          // Quality of Service
   input [3:0]                         ARREGION;                       // Region identifier
   input [USER_WIDTH-1:0]              ARUSER;                         // User signal
   input                               ARVALID;                        // Read address valid
   output                              ARREADY;                        // Read address ready
   
   // ============== AXI4 Slave Read Data Channel Signals
   output [ID_WIDTH-1:0]               RID;                            // Read Transaction ID tag
   output [DATA_WIDTH-1:0]             RDATA;                          // Read data
   output [1:0]                        RRESP;                          // Read response
   output                              RLAST;                          // Read last
   output [USER_WIDTH-1:0]             RUSER;                          // User signal
   output                              RVALID;                         // Read valid
   input                               RREADY;                         // Read ready

   reg                                 AWREADY_reg;
   assign AWREADY = AWREADY_reg;
   reg                                 WREADY_reg;
   assign WREADY = WREADY_reg;
   reg [ID_WIDTH-1:0]                  AWID_reg;
   assign BID = AWID_reg;
   reg [1:0]                           BRESP_reg;
   assign BRESP = BRESP_reg;
   assign BUSER = 0;
   reg                                 BVALID_reg;
   assign BVALID = BVALID_reg;
   
   reg                                 ARREADY_reg;
   assign ARREADY = ARREADY_reg;

   reg [ID_WIDTH-1:0]                  ARID_reg;
   assign RID = ARID_reg;   
   reg [DATA_WIDTH-1:0]                RDATA_reg;
   assign RDATA = RDATA_reg;
   reg [1:0]                           RRESP_reg;
   assign RRESP = RRESP_reg;
   reg                                 RLAST_reg;
   assign RLAST = RLAST_reg;
   assign RUSER = 0;
   reg                                 RVALID_reg;
   assign RVALID = RVALID_reg;
   
   // Catapult interface
   input                               s_re;     // Catapult attempting read of slave memory
   input                               s_we;     // Catapult attempting write to slave memory
   input [addr_w-1:0]                  s_raddr;  // Catapult addressing into memory
   input [addr_w-1:0]                  s_waddr;  // Catapult addressing into memory
   output [cwidth-1:0]                 s_din;    // Data into catapult block through this interface
   input [cwidth-1:0]                  s_dout;   // Data out to slave from catapult
   output                              s_rrdy;   // Slave memory ready for access by Catapult (1=ready)
   output                              s_wrdy;   // Slave memory ready for access by Catapult (1=ready)
   output                              is_idle;  // The component is idle - clock can be suppressed
   input                               tr_write_done;  // transactor resource preload write done
   input                               s_tdone;        // Transaction_done in scverify
   
   reg [cwidth-1:0]                    s_din_reg;
   assign s_din = s_din_reg;
   reg                                 s_rrdy_reg;

   wire                                rCatOutOfOrder;
   reg                                 catIsReading;
   integer                             next_raddr;
   
   assign s_rrdy = s_rrdy_reg && !rCatOutOfOrder;
   
   reg                                 s_wrdy_reg;
   assign s_wrdy = s_wrdy_reg && !s_tdone;
   assign is_idle = 0;
   
   // Statemachine for read and write operations are separate
   localparam [2:0] axi4r_idle=0, axi4r_read=1;   
   localparam [2:0] axi4w_idle=0, axi4w_write=1, axi4w_write_done=2,  axi4w_catwrite=3, axi4w_catwrite_done=4;
   localparam addrShift = `CLOG2(DATA_WIDTH/8);

   reg [2:0]     read_state;
   reg [2:0]     write_state;
   
   reg [7:0]     readBurstCnt;  // how many are left

  // Memory embedded in this slave
   reg [cwidth-1:0] mem[depth-1:0];

   wire [ADDR_WIDTH-1:0] wbase_address;
   wire [ADDR_WIDTH-1:0] rbase_address;
   assign wbase_address = wBASE_ADDRESS;
   assign rbase_address = rBASE_ADDRESS;
   
   reg [ADDR_WIDTH-1:0] address;
      
   // AXI4 Bus Read processing
   reg [ADDR_WIDTH-1:0] useAddr ;

   // The "last" catapult address processed in a burst
   integer readAddr;

   always @(posedge ACLK or negedge int_ARESETn) begin
      if (~int_ARESETn) begin
         read_state <= axi4r_idle;
         ARREADY_reg <= 1;
         ARID_reg <= 0;
         RDATA_reg <= 0;
         RRESP_reg <= `AXI4_xRESP_OKAY;
         RLAST_reg <= 0;
         RVALID_reg <= 0;
         readAddr <= 0;
         readBurstCnt <= 0;
      end else begin
         if ((read_state == axi4r_idle) && (ARVALID == 1)) begin
            useAddr = (ARADDR - rbase_address) >> addrShift;
            // Protect from out of range addressing

`ifdef SLAVE_DBG_WRITE
            $display("ARADDR=%d rbase_address=%d addrShift=%d useAddr=%d at T=%t",
                     ARADDR, rbase_address, addrShift, useAddr, $time);
`endif
            if (useAddr < depth) begin
               if (cwidth < DATA_WIDTH) begin
                  //RDATA_reg[DATA_WIDTH-1:cwidth] <= 0;   // vcs doesnt like this
                  //RDATA_reg[cwidth-1:0] <= mem[useAddr];
                  RDATA_reg <= {{DATA_WIDTH - cwidth{1'b0}}, mem[useAddr]};
               end else begin
                  RDATA_reg <= mem[useAddr];
               end
`ifdef SLAVE_DBG_READ
               $display("Slave AXI1 read:mem[%d]=%h at T=%t", useAddr, mem[useAddr], $time);
`endif
            end else begin
               // synopsys translate_off               
               $display("Error:  Out-of-range AXI memory read access:%h at T=%t", ARADDR, $time);
               // synopsys translate_on
            end
            RRESP_reg <= `AXI4_xRESP_OKAY;
            readAddr <= useAddr;            
            readBurstCnt <= ARLEN;
            if (ARLEN== 0) begin
               ARREADY_reg <= 0;        
               RLAST_reg <= 1;
            end
            RVALID_reg <= 1;
            ARID_reg <= ARID;
            read_state <= axi4r_read;
         end else if (read_state == axi4r_read) begin
            if (RREADY == 1) begin
               if (readBurstCnt == 0) begin
                  // we already sent the last data
                  ARREADY_reg <= 1;
                  RRESP_reg <= `AXI4_xRESP_OKAY;
                  RLAST_reg <= 0;
                  RVALID_reg <= 0;
                  read_state <= axi4r_idle;               
               end else begin 
                  useAddr = readAddr + 1;
                  readAddr <= readAddr + 1;
                  // Protect from out of range addressing
                  if (useAddr < depth) begin
                     if (cwidth < DATA_WIDTH) begin
                        //RDATA_reg[DATA_WIDTH-1:cwidth] <= 0;  // vcs errors on this
                        //RDATA_reg[cwidth-1:0] <= mem[useAddr];
                        RDATA_reg <= {{DATA_WIDTH - cwidth{1'b0}}, mem[useAddr]};
                     end else begin
                        RDATA_reg <= mem[useAddr];
                     end
`ifdef SLAVE_DBG_READ
                     $display("Slave AXI2 read:mem[%d]=%h at T=%t", useAddr, mem[useAddr], $time);
`endif
                  end else begin
                     // We bursted right off the end of the array
                     // synopsys translate_off               
                     $display("Error:  Out-of-range AXI memory read access:%h at T=%t", ARADDR, $time);
                     // synopsys translate_on
                  end
                  readBurstCnt <= readBurstCnt - 1;
                  if ((readBurstCnt - 1) == 0) begin
                     ARREADY_reg <= 0;        
                     RRESP_reg <= `AXI4_xRESP_OKAY;
                     RLAST_reg <= 1;
                  end
                  RVALID_reg <= 1;
               end // else: !if(readBurstCnt == 0)
            end // if (RREADY == 1)
         end // if (read_state == axi4r_read)
      end // else: !if(~int_ARESETn)
   end // always@ (posedge ACLK or negedge int_ARESETn)
   

   // AXI and catapult write processing.
   // Catapult write is one-cycle long so basically a write can happen
   // in any axi state.  AXI has precedence in that catapult write is processed
   // first at each cycle
   integer writeAddr;  // last cat addr written
   integer i;
   
   always @(posedge ACLK or negedge int_ARESETn) begin
      if (~int_ARESETn) begin
         AWREADY_reg <= 1;
         AWID_reg <= 0;
         WREADY_reg <= 1;
         BRESP_reg <= `AXI4_xRESP_OKAY;
         BVALID_reg <= 0;
         write_state <= axi4w_idle;
         writeAddr <= 0;
         s_wrdy_reg <= 0;
         // synopsys translate_off
         for (i=0; i<depth; i=i+1) begin
            mem[i] <= 0;
         end
         // synopsys translate_on
      end else begin
         // When in idle state, catapult and AXI can both initiate writes.
         // If to the same address, then AXI wins...
         if ((s_we == 1) && (write_state == axi4w_idle) && !s_tdone) begin
            mem[s_waddr] <= s_dout;
`ifdef SLAVE_DBG_WRITE
            $display("Slave CAT write:mem[%d]=%h at T=%t", s_waddr, s_dout, $time);
`endif
         end
         if ((write_state == axi4w_idle) && (AWVALID == 1)) begin
            s_wrdy_reg <= 0;
            AWREADY_reg <= 0;
            AWID_reg <= AWID;
            useAddr = (AWADDR - wbase_address) >> addrShift;
`ifdef SLAVE_DBG_WRITE
            $display("AWADDR=%d wbase_address=%d addrShift=%d useAddr=%d at T=%t",
                     AWADDR, wbase_address, addrShift, useAddr, $time);
`endif
            if (WVALID == 1) begin
               // allow for address and data to be presented in one cycle
               // Check for the write to be masked
               if (WSTRB != 0) begin // a byte at a time.  Watch for cwidth much less than DATA_WIDTH
                  if (useAddr < depth) begin
                     for (i=0; i<(DATA_WIDTH/8);i=i+1) begin
                        if (WSTRB[i] == 1) begin
                           if ((8*i) < cwidth) begin
                              mem[useAddr][8*i +: 8] <= WDATA[8*i +: 8];
                           end
                        end
                     end
`ifdef SLAVE_DBG_WRITE
                     $display("Slave AXI1 write:mem[%d]=%h at T=%t", useAddr, WDATA, $time);
`endif
                  end else begin
                     // synopsys translate_off               
                     $display("Error:  Out-of-range AXI memory write access:%h at T=%t", AWADDR, $time);
                     // synopsys translate_on
                  end
               end
            end
            writeAddr <= useAddr;
            if ((WLAST == 1) && (WVALID == 1)) begin
               write_state <= axi4w_write_done;
               WREADY_reg <= 0;
               BRESP_reg <= `AXI4_xRESP_OKAY;
               BVALID_reg <= 1;
            end else begin
               write_state <= axi4w_write;
            end
         end else if (write_state == axi4w_write) begin
            if (WVALID == 1) begin
               useAddr = writeAddr+1;
               if (WSTRB != 0) begin // a byte at a time.  Watch for cwidth much less than DATA_WIDTH
                  if (useAddr < depth) begin
                     for (i=0; i<(DATA_WIDTH/8);i=i+1) begin
                        if (WSTRB[i] == 1) begin
                           if ((8*i) < cwidth) begin
                              mem[useAddr][8*i +: 8] <= WDATA[8*i +: 8];
                           end
                        end
                     end
`ifdef SLAVE_DBG_WRITE
                     $display("SLAVE AXI2 write:mem[%d]=%h at T=%t", useAddr, WDATA, $time);
`endif
                  end else begin
                     // synopsys translate_off
                     $display("Error:  Out-of-range AXI memory write access:%h at T=%t", AWADDR, $time);
                     // synopsys translate_on
                  end
               end
               writeAddr <= useAddr;
               if (WLAST == 1) begin
                  write_state <= axi4w_write_done;
                  WREADY_reg <= 0;
                  BRESP_reg <= `AXI4_xRESP_OKAY;
                  BVALID_reg <= 1;
               end 
            end // if (WVALID == 1)
         end else if (write_state == axi4w_write_done) begin // if (write_state == axi4w_write)
            if (BREADY == 1) begin
               AWREADY_reg <= 1;
               WREADY_reg <= 1;
               BRESP_reg <= `AXI4_xRESP_OKAY;
               BVALID_reg <= 0;
               write_state <= axi4w_idle;
               s_wrdy_reg <= 1;
            end
         end else begin
            s_wrdy_reg <= 1;
         end
      end // else: !if(~int_ARESETn)
   end // always@ (posedge ACLK or negedge int_ARESETn)

   assign rCatOutOfOrder = s_re && s_rrdy_reg && catIsReading && (next_raddr != s_raddr+1);
   
   // Catapult read processing
   always @(posedge ACLK or negedge int_ARESETn) begin
      if (~int_ARESETn) begin
         s_din_reg <= 0;
         s_rrdy_reg <= 0;
         catIsReading <= 0;
         next_raddr <= 0;
      end else begin
         // Catapult has read access to memory
         if (tr_write_done == 1'b1) begin
            if (s_re == 1'b1) begin
`ifdef SLAVE_DBG_READ
               $display("Slave CAT read.  Addr=%d nextAddr=%d Data=%d OOO=%d isReading=%d T=%t", s_raddr, next_raddr, 
                        mem[s_raddr], rCatOutOfOrder, catIsReading, $time);
`endif
               if (catIsReading && !rCatOutOfOrder) begin 
                  if (next_raddr < depth) begin
                     s_din_reg <= mem[next_raddr];
                     next_raddr <= next_raddr+1;                  
`ifdef SLAVE_DBG_READ
                     $display("  Burst continues");                  
`endif
                  end else begin
                     s_rrdy_reg <= 0;
                     catIsReading <= 0;
                     next_raddr <= 0;                  
                  end
               end else begin
                  s_din_reg <= mem[s_raddr];
                  s_rrdy_reg <= 1;
                  next_raddr <= s_raddr+1;                  
                  if (catIsReading && rCatOutOfOrder) begin
`ifdef SLAVE_DBG_READ
                     $display("  OutOfOrder");                  
`endif                  
                     catIsReading <= 0;  // a hiccup
                  end else begin
                     catIsReading <= 1;
                  end
               end
            end else begin
               s_rrdy_reg <= 0;
               catIsReading <= 0;
               next_raddr <= 0;
            end
         end else begin 
            s_rrdy_reg <= 0;
            catIsReading <= 0;
            next_raddr <= 0;
         end
      end
   end
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


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_mul_pipe_beh.v 
//
// File:      $Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_mul_pipe_beh.v
//
// BASELINE:  Catapult-C version 2006b.63
// MODIFIED:  2007-04-03, tnagler
//
// Note: this file uses Verilog2001 features; 
//       please enable Verilog2001 in the flow!

module mgc_mul_pipe (a, b, clk, en, a_rst, s_rst, z);

    // Parameters:
    parameter integer width_a = 32'd4;  // input a bit width
    parameter         signd_a =  1'b1;  // input a type (1=signed, 0=unsigned)
    parameter integer width_b = 32'd4;  // input b bit width
    parameter         signd_b =  1'b1;  // input b type (1=signed, 0=unsigned)
    parameter integer width_z = 32'd8;  // result bit width (= width_a + width_b)
    parameter      clock_edge =  1'b0;  // clock polarity (1=posedge, 0=negedge)
    parameter   enable_active =  1'b0;  // enable polarity (1=posedge, 0=negedge)
    parameter    a_rst_active =  1'b1;  // unused
    parameter    s_rst_active =  1'b1;  // unused
    parameter integer  stages = 32'd2;  // number of output registers + 1 (careful!)
    parameter integer n_inreg = 32'd0;  // number of input registers
   
    localparam integer width_ab = width_a + width_b;  // multiplier result width
    localparam integer n_inreg_min = (n_inreg > 1) ? (n_inreg-1) : 0; // for Synopsys DC
   
    // I/O ports:
    input  [width_a-1:0] a;      // input A
    input  [width_b-1:0] b;      // input B
    input                clk;    // clock
    input                en;     // enable
    input                a_rst;  // async reset (unused)
    input                s_rst;  // sync reset (unused)
    output [width_z-1:0] z;      // output


    // Input registers:

    wire [width_a-1:0] a_f;
    wire [width_b-1:0] b_f;

    integer i;

    generate
    if (clock_edge == 1'b0)
    begin: NEG_EDGE1
        case (n_inreg)
        32'd0: begin: B1
            assign a_f = a, 
                   b_f = b;
        end
        default: begin: B2
            reg [width_a-1:0] a_reg [n_inreg_min:0];
            reg [width_b-1:0] b_reg [n_inreg_min:0];
            always @(negedge clk)
            if (en == enable_active)
            begin: B21
                a_reg[0] <= a;
                b_reg[0] <= b;
                for (i = 0; i < n_inreg_min; i = i + 1)
                begin: B3
                    a_reg[i+1] <= a_reg[i];
                    b_reg[i+1] <= b_reg[i];
                end
            end
            assign a_f = a_reg[n_inreg_min],
                   b_f = b_reg[n_inreg_min];
        end
        endcase
    end
    else
    begin: POS_EDGE1
        case (n_inreg)
        32'd0: begin: B1
            assign a_f = a, 
                   b_f = b;
        end
        default: begin: B2
            reg [width_a-1:0] a_reg [n_inreg_min:0];
            reg [width_b-1:0] b_reg [n_inreg_min:0];
            always @(posedge clk)
            if (en == enable_active)
            begin: B21
                a_reg[0] <= a;
                b_reg[0] <= b;
                for (i = 0; i < n_inreg_min; i = i + 1)
                begin: B3
                    a_reg[i+1] <= a_reg[i];
                    b_reg[i+1] <= b_reg[i];
                end
            end
            assign a_f = a_reg[n_inreg_min],
                   b_f = b_reg[n_inreg_min];
        end
        endcase
    end
    endgenerate


    // Output:
    wire [width_z-1:0]  xz;

    function signed [width_z-1:0] conv_signed;
      input signed [width_ab-1:0] res;
      conv_signed = res[width_z-1:0];
    endfunction

    generate
      wire signed [width_ab-1:0] res;
      if ( (signd_a == 1'b1) && (signd_b == 1'b1) )
      begin: SIGNED_AB
              assign res = $signed(a_f) * $signed(b_f);
              assign xz = conv_signed(res);
      end
      else if ( (signd_a == 1'b1) && (signd_b == 1'b0) )
      begin: SIGNED_A
              assign res = $signed(a_f) * $signed({1'b0, b_f});
              assign xz = conv_signed(res);
      end
      else if ( (signd_a == 1'b0) && (signd_b == 1'b1) )
      begin: SIGNED_B
              assign res = $signed({1'b0,a_f}) * $signed(b_f);
              assign xz = conv_signed(res);
      end
      else
      begin: UNSIGNED_AB
              assign res = a_f * b_f;
	      assign xz = res[width_z-1:0];
      end
    endgenerate


    // Output registers:

    reg  [width_z-1:0] reg_array[stages-2:0];
    wire [width_z-1:0] z;

    generate
    if (clock_edge == 1'b0)
    begin: NEG_EDGE2
        always @(negedge clk)
        if (en == enable_active)
            for (i = stages-2; i >= 0; i = i-1)
                if (i == 0)
                    reg_array[i] <= xz;
                else
                    reg_array[i] <= reg_array[i-1];
    end
    else
    begin: POS_EDGE2
        always @(posedge clk)
        if (en == enable_active)
            for (i = stages-2; i >= 0; i = i-1)
                if (i == 0)
                    reg_array[i] <= xz;
                else
                    reg_array[i] <= reg_array[i-1];
    end
    endgenerate

    assign z = reg_array[stages-2];
endmodule

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_bl_beh_v5.v 
module mgc_shift_bl_v5(a,s,z);
   parameter    width_a = 4;
   parameter    signd_a = 1;
   parameter    width_s = 2;
   parameter    width_z = 8;

   input [width_a-1:0] a;
   input [width_s-1:0] s;
   output [width_z -1:0] z;

   generate if ( signd_a )
   begin: SGNED
     assign z = fshl_s(a,s,a[width_a-1]);
   end
   else
   begin: UNSGNED
     assign z = fshl_s(a,s,1'b0);
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

   //Shift left - signed shift argument
   function [width_z-1:0] fshl_s;
      input [width_a-1:0] arg1;
      input [width_s-1:0] arg2;
      input sbit;
      reg [width_a:0] sbit_arg1;
      begin
        // Ignoring the possibility that arg2[width_s-1] could be X
        // because of customer complaints regarding X'es in simulation results
        if ( arg2[width_s-1] == 1'b0 )
        begin
          sbit_arg1[width_a:0] = {(width_a+1){1'b0}};
          fshl_s = fshl_u(arg1, arg2, sbit);
        end
        else
        begin
          sbit_arg1[width_a] = sbit;
          sbit_arg1[width_a-1:0] = arg1;
          fshl_s = fshr_u(sbit_arg1[width_a:1], ~arg2, sbit);
        end
      end
   endfunction

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
//  Generated date: Mon Sep 13 22:55:37 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [9:0] radr;
  output we;
  output [31:0] d;
  output [9:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
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
//  Design Unit:    hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [9:0] radr;
  output we;
  output [31:0] d;
  output [9:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
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
//  Design Unit:    hybrid_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module hybrid_core_core_fsm (
  clk, rst, core_wen, fsm_output, S1_OUTER_LOOP_for_C_4_tr0, S1_OUTER_LOOP_C_0_tr0,
      S2_COPY_LOOP_for_C_3_tr0, S2_COPY_LOOP_C_0_tr0, S2_INNER_LOOP1_for_C_24_tr0,
      S2_INNER_LOOP1_C_0_tr0, S2_INNER_LOOP2_for_C_23_tr0, S2_INNER_LOOP2_C_0_tr0,
      S2_INNER_LOOP2_C_0_tr1, S2_INNER_LOOP3_for_C_23_tr0, S2_INNER_LOOP3_C_0_tr0,
      S34_OUTER_LOOP_for_C_12_tr0, S34_OUTER_LOOP_C_0_tr0, S5_COPY_LOOP_for_C_3_tr0,
      S5_COPY_LOOP_C_0_tr0, S5_INNER_LOOP1_for_C_24_tr0, S5_INNER_LOOP1_C_0_tr0,
      S5_INNER_LOOP2_for_C_23_tr0, S5_INNER_LOOP2_C_0_tr0, S5_INNER_LOOP2_C_0_tr1,
      S5_INNER_LOOP3_for_C_23_tr0, S5_INNER_LOOP3_C_0_tr0, S6_OUTER_LOOP_for_C_3_tr0,
      S6_OUTER_LOOP_C_0_tr0
);
  input clk;
  input rst;
  input core_wen;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input S1_OUTER_LOOP_for_C_4_tr0;
  input S1_OUTER_LOOP_C_0_tr0;
  input S2_COPY_LOOP_for_C_3_tr0;
  input S2_COPY_LOOP_C_0_tr0;
  input S2_INNER_LOOP1_for_C_24_tr0;
  input S2_INNER_LOOP1_C_0_tr0;
  input S2_INNER_LOOP2_for_C_23_tr0;
  input S2_INNER_LOOP2_C_0_tr0;
  input S2_INNER_LOOP2_C_0_tr1;
  input S2_INNER_LOOP3_for_C_23_tr0;
  input S2_INNER_LOOP3_C_0_tr0;
  input S34_OUTER_LOOP_for_C_12_tr0;
  input S34_OUTER_LOOP_C_0_tr0;
  input S5_COPY_LOOP_for_C_3_tr0;
  input S5_COPY_LOOP_C_0_tr0;
  input S5_INNER_LOOP1_for_C_24_tr0;
  input S5_INNER_LOOP1_C_0_tr0;
  input S5_INNER_LOOP2_for_C_23_tr0;
  input S5_INNER_LOOP2_C_0_tr0;
  input S5_INNER_LOOP2_C_0_tr1;
  input S5_INNER_LOOP3_for_C_23_tr0;
  input S5_INNER_LOOP3_C_0_tr0;
  input S6_OUTER_LOOP_for_C_3_tr0;
  input S6_OUTER_LOOP_C_0_tr0;


  // FSM State Type Declaration for hybrid_core_core_fsm_1
  parameter
    main_C_0 = 8'd0,
    S1_OUTER_LOOP_for_C_0 = 8'd1,
    S1_OUTER_LOOP_for_C_1 = 8'd2,
    S1_OUTER_LOOP_for_C_2 = 8'd3,
    S1_OUTER_LOOP_for_C_3 = 8'd4,
    S1_OUTER_LOOP_for_C_4 = 8'd5,
    S1_OUTER_LOOP_C_0 = 8'd6,
    S2_COPY_LOOP_for_C_0 = 8'd7,
    S2_COPY_LOOP_for_C_1 = 8'd8,
    S2_COPY_LOOP_for_C_2 = 8'd9,
    S2_COPY_LOOP_for_C_3 = 8'd10,
    S2_COPY_LOOP_C_0 = 8'd11,
    S2_OUTER_LOOP_C_0 = 8'd12,
    S2_INNER_LOOP1_for_C_0 = 8'd13,
    S2_INNER_LOOP1_for_C_1 = 8'd14,
    S2_INNER_LOOP1_for_C_2 = 8'd15,
    S2_INNER_LOOP1_for_C_3 = 8'd16,
    S2_INNER_LOOP1_for_C_4 = 8'd17,
    S2_INNER_LOOP1_for_C_5 = 8'd18,
    S2_INNER_LOOP1_for_C_6 = 8'd19,
    S2_INNER_LOOP1_for_C_7 = 8'd20,
    S2_INNER_LOOP1_for_C_8 = 8'd21,
    S2_INNER_LOOP1_for_C_9 = 8'd22,
    S2_INNER_LOOP1_for_C_10 = 8'd23,
    S2_INNER_LOOP1_for_C_11 = 8'd24,
    S2_INNER_LOOP1_for_C_12 = 8'd25,
    S2_INNER_LOOP1_for_C_13 = 8'd26,
    S2_INNER_LOOP1_for_C_14 = 8'd27,
    S2_INNER_LOOP1_for_C_15 = 8'd28,
    S2_INNER_LOOP1_for_C_16 = 8'd29,
    S2_INNER_LOOP1_for_C_17 = 8'd30,
    S2_INNER_LOOP1_for_C_18 = 8'd31,
    S2_INNER_LOOP1_for_C_19 = 8'd32,
    S2_INNER_LOOP1_for_C_20 = 8'd33,
    S2_INNER_LOOP1_for_C_21 = 8'd34,
    S2_INNER_LOOP1_for_C_22 = 8'd35,
    S2_INNER_LOOP1_for_C_23 = 8'd36,
    S2_INNER_LOOP1_for_C_24 = 8'd37,
    S2_INNER_LOOP1_C_0 = 8'd38,
    S2_OUTER_LOOP_C_1 = 8'd39,
    S2_INNER_LOOP2_for_C_0 = 8'd40,
    S2_INNER_LOOP2_for_C_1 = 8'd41,
    S2_INNER_LOOP2_for_C_2 = 8'd42,
    S2_INNER_LOOP2_for_C_3 = 8'd43,
    S2_INNER_LOOP2_for_C_4 = 8'd44,
    S2_INNER_LOOP2_for_C_5 = 8'd45,
    S2_INNER_LOOP2_for_C_6 = 8'd46,
    S2_INNER_LOOP2_for_C_7 = 8'd47,
    S2_INNER_LOOP2_for_C_8 = 8'd48,
    S2_INNER_LOOP2_for_C_9 = 8'd49,
    S2_INNER_LOOP2_for_C_10 = 8'd50,
    S2_INNER_LOOP2_for_C_11 = 8'd51,
    S2_INNER_LOOP2_for_C_12 = 8'd52,
    S2_INNER_LOOP2_for_C_13 = 8'd53,
    S2_INNER_LOOP2_for_C_14 = 8'd54,
    S2_INNER_LOOP2_for_C_15 = 8'd55,
    S2_INNER_LOOP2_for_C_16 = 8'd56,
    S2_INNER_LOOP2_for_C_17 = 8'd57,
    S2_INNER_LOOP2_for_C_18 = 8'd58,
    S2_INNER_LOOP2_for_C_19 = 8'd59,
    S2_INNER_LOOP2_for_C_20 = 8'd60,
    S2_INNER_LOOP2_for_C_21 = 8'd61,
    S2_INNER_LOOP2_for_C_22 = 8'd62,
    S2_INNER_LOOP2_for_C_23 = 8'd63,
    S2_INNER_LOOP2_C_0 = 8'd64,
    S2_INNER_LOOP3_for_C_0 = 8'd65,
    S2_INNER_LOOP3_for_C_1 = 8'd66,
    S2_INNER_LOOP3_for_C_2 = 8'd67,
    S2_INNER_LOOP3_for_C_3 = 8'd68,
    S2_INNER_LOOP3_for_C_4 = 8'd69,
    S2_INNER_LOOP3_for_C_5 = 8'd70,
    S2_INNER_LOOP3_for_C_6 = 8'd71,
    S2_INNER_LOOP3_for_C_7 = 8'd72,
    S2_INNER_LOOP3_for_C_8 = 8'd73,
    S2_INNER_LOOP3_for_C_9 = 8'd74,
    S2_INNER_LOOP3_for_C_10 = 8'd75,
    S2_INNER_LOOP3_for_C_11 = 8'd76,
    S2_INNER_LOOP3_for_C_12 = 8'd77,
    S2_INNER_LOOP3_for_C_13 = 8'd78,
    S2_INNER_LOOP3_for_C_14 = 8'd79,
    S2_INNER_LOOP3_for_C_15 = 8'd80,
    S2_INNER_LOOP3_for_C_16 = 8'd81,
    S2_INNER_LOOP3_for_C_17 = 8'd82,
    S2_INNER_LOOP3_for_C_18 = 8'd83,
    S2_INNER_LOOP3_for_C_19 = 8'd84,
    S2_INNER_LOOP3_for_C_20 = 8'd85,
    S2_INNER_LOOP3_for_C_21 = 8'd86,
    S2_INNER_LOOP3_for_C_22 = 8'd87,
    S2_INNER_LOOP3_for_C_23 = 8'd88,
    S2_INNER_LOOP3_C_0 = 8'd89,
    S34_OUTER_LOOP_for_C_0 = 8'd90,
    S34_OUTER_LOOP_for_C_1 = 8'd91,
    S34_OUTER_LOOP_for_C_2 = 8'd92,
    S34_OUTER_LOOP_for_C_3 = 8'd93,
    S34_OUTER_LOOP_for_C_4 = 8'd94,
    S34_OUTER_LOOP_for_C_5 = 8'd95,
    S34_OUTER_LOOP_for_C_6 = 8'd96,
    S34_OUTER_LOOP_for_C_7 = 8'd97,
    S34_OUTER_LOOP_for_C_8 = 8'd98,
    S34_OUTER_LOOP_for_C_9 = 8'd99,
    S34_OUTER_LOOP_for_C_10 = 8'd100,
    S34_OUTER_LOOP_for_C_11 = 8'd101,
    S34_OUTER_LOOP_for_C_12 = 8'd102,
    S34_OUTER_LOOP_C_0 = 8'd103,
    S5_COPY_LOOP_for_C_0 = 8'd104,
    S5_COPY_LOOP_for_C_1 = 8'd105,
    S5_COPY_LOOP_for_C_2 = 8'd106,
    S5_COPY_LOOP_for_C_3 = 8'd107,
    S5_COPY_LOOP_C_0 = 8'd108,
    S5_OUTER_LOOP_C_0 = 8'd109,
    S5_INNER_LOOP1_for_C_0 = 8'd110,
    S5_INNER_LOOP1_for_C_1 = 8'd111,
    S5_INNER_LOOP1_for_C_2 = 8'd112,
    S5_INNER_LOOP1_for_C_3 = 8'd113,
    S5_INNER_LOOP1_for_C_4 = 8'd114,
    S5_INNER_LOOP1_for_C_5 = 8'd115,
    S5_INNER_LOOP1_for_C_6 = 8'd116,
    S5_INNER_LOOP1_for_C_7 = 8'd117,
    S5_INNER_LOOP1_for_C_8 = 8'd118,
    S5_INNER_LOOP1_for_C_9 = 8'd119,
    S5_INNER_LOOP1_for_C_10 = 8'd120,
    S5_INNER_LOOP1_for_C_11 = 8'd121,
    S5_INNER_LOOP1_for_C_12 = 8'd122,
    S5_INNER_LOOP1_for_C_13 = 8'd123,
    S5_INNER_LOOP1_for_C_14 = 8'd124,
    S5_INNER_LOOP1_for_C_15 = 8'd125,
    S5_INNER_LOOP1_for_C_16 = 8'd126,
    S5_INNER_LOOP1_for_C_17 = 8'd127,
    S5_INNER_LOOP1_for_C_18 = 8'd128,
    S5_INNER_LOOP1_for_C_19 = 8'd129,
    S5_INNER_LOOP1_for_C_20 = 8'd130,
    S5_INNER_LOOP1_for_C_21 = 8'd131,
    S5_INNER_LOOP1_for_C_22 = 8'd132,
    S5_INNER_LOOP1_for_C_23 = 8'd133,
    S5_INNER_LOOP1_for_C_24 = 8'd134,
    S5_INNER_LOOP1_C_0 = 8'd135,
    S5_OUTER_LOOP_C_1 = 8'd136,
    S5_INNER_LOOP2_for_C_0 = 8'd137,
    S5_INNER_LOOP2_for_C_1 = 8'd138,
    S5_INNER_LOOP2_for_C_2 = 8'd139,
    S5_INNER_LOOP2_for_C_3 = 8'd140,
    S5_INNER_LOOP2_for_C_4 = 8'd141,
    S5_INNER_LOOP2_for_C_5 = 8'd142,
    S5_INNER_LOOP2_for_C_6 = 8'd143,
    S5_INNER_LOOP2_for_C_7 = 8'd144,
    S5_INNER_LOOP2_for_C_8 = 8'd145,
    S5_INNER_LOOP2_for_C_9 = 8'd146,
    S5_INNER_LOOP2_for_C_10 = 8'd147,
    S5_INNER_LOOP2_for_C_11 = 8'd148,
    S5_INNER_LOOP2_for_C_12 = 8'd149,
    S5_INNER_LOOP2_for_C_13 = 8'd150,
    S5_INNER_LOOP2_for_C_14 = 8'd151,
    S5_INNER_LOOP2_for_C_15 = 8'd152,
    S5_INNER_LOOP2_for_C_16 = 8'd153,
    S5_INNER_LOOP2_for_C_17 = 8'd154,
    S5_INNER_LOOP2_for_C_18 = 8'd155,
    S5_INNER_LOOP2_for_C_19 = 8'd156,
    S5_INNER_LOOP2_for_C_20 = 8'd157,
    S5_INNER_LOOP2_for_C_21 = 8'd158,
    S5_INNER_LOOP2_for_C_22 = 8'd159,
    S5_INNER_LOOP2_for_C_23 = 8'd160,
    S5_INNER_LOOP2_C_0 = 8'd161,
    S5_INNER_LOOP3_for_C_0 = 8'd162,
    S5_INNER_LOOP3_for_C_1 = 8'd163,
    S5_INNER_LOOP3_for_C_2 = 8'd164,
    S5_INNER_LOOP3_for_C_3 = 8'd165,
    S5_INNER_LOOP3_for_C_4 = 8'd166,
    S5_INNER_LOOP3_for_C_5 = 8'd167,
    S5_INNER_LOOP3_for_C_6 = 8'd168,
    S5_INNER_LOOP3_for_C_7 = 8'd169,
    S5_INNER_LOOP3_for_C_8 = 8'd170,
    S5_INNER_LOOP3_for_C_9 = 8'd171,
    S5_INNER_LOOP3_for_C_10 = 8'd172,
    S5_INNER_LOOP3_for_C_11 = 8'd173,
    S5_INNER_LOOP3_for_C_12 = 8'd174,
    S5_INNER_LOOP3_for_C_13 = 8'd175,
    S5_INNER_LOOP3_for_C_14 = 8'd176,
    S5_INNER_LOOP3_for_C_15 = 8'd177,
    S5_INNER_LOOP3_for_C_16 = 8'd178,
    S5_INNER_LOOP3_for_C_17 = 8'd179,
    S5_INNER_LOOP3_for_C_18 = 8'd180,
    S5_INNER_LOOP3_for_C_19 = 8'd181,
    S5_INNER_LOOP3_for_C_20 = 8'd182,
    S5_INNER_LOOP3_for_C_21 = 8'd183,
    S5_INNER_LOOP3_for_C_22 = 8'd184,
    S5_INNER_LOOP3_for_C_23 = 8'd185,
    S5_INNER_LOOP3_C_0 = 8'd186,
    S6_OUTER_LOOP_for_C_0 = 8'd187,
    S6_OUTER_LOOP_for_C_1 = 8'd188,
    S6_OUTER_LOOP_for_C_2 = 8'd189,
    S6_OUTER_LOOP_for_C_3 = 8'd190,
    S6_OUTER_LOOP_C_0 = 8'd191,
    main_C_1 = 8'd192;

  reg [7:0] state_var;
  reg [7:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : hybrid_core_core_fsm_1
    case (state_var)
      S1_OUTER_LOOP_for_C_0 : begin
        fsm_output = 8'b00000001;
        state_var_NS = S1_OUTER_LOOP_for_C_1;
      end
      S1_OUTER_LOOP_for_C_1 : begin
        fsm_output = 8'b00000010;
        state_var_NS = S1_OUTER_LOOP_for_C_2;
      end
      S1_OUTER_LOOP_for_C_2 : begin
        fsm_output = 8'b00000011;
        state_var_NS = S1_OUTER_LOOP_for_C_3;
      end
      S1_OUTER_LOOP_for_C_3 : begin
        fsm_output = 8'b00000100;
        state_var_NS = S1_OUTER_LOOP_for_C_4;
      end
      S1_OUTER_LOOP_for_C_4 : begin
        fsm_output = 8'b00000101;
        if ( S1_OUTER_LOOP_for_C_4_tr0 ) begin
          state_var_NS = S1_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S1_OUTER_LOOP_for_C_0;
        end
      end
      S1_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b00000110;
        if ( S1_OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = S2_COPY_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S1_OUTER_LOOP_for_C_0;
        end
      end
      S2_COPY_LOOP_for_C_0 : begin
        fsm_output = 8'b00000111;
        state_var_NS = S2_COPY_LOOP_for_C_1;
      end
      S2_COPY_LOOP_for_C_1 : begin
        fsm_output = 8'b00001000;
        state_var_NS = S2_COPY_LOOP_for_C_2;
      end
      S2_COPY_LOOP_for_C_2 : begin
        fsm_output = 8'b00001001;
        state_var_NS = S2_COPY_LOOP_for_C_3;
      end
      S2_COPY_LOOP_for_C_3 : begin
        fsm_output = 8'b00001010;
        if ( S2_COPY_LOOP_for_C_3_tr0 ) begin
          state_var_NS = S2_COPY_LOOP_C_0;
        end
        else begin
          state_var_NS = S2_COPY_LOOP_for_C_0;
        end
      end
      S2_COPY_LOOP_C_0 : begin
        fsm_output = 8'b00001011;
        if ( S2_COPY_LOOP_C_0_tr0 ) begin
          state_var_NS = S2_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S2_COPY_LOOP_for_C_0;
        end
      end
      S2_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b00001100;
        state_var_NS = S2_INNER_LOOP1_for_C_0;
      end
      S2_INNER_LOOP1_for_C_0 : begin
        fsm_output = 8'b00001101;
        state_var_NS = S2_INNER_LOOP1_for_C_1;
      end
      S2_INNER_LOOP1_for_C_1 : begin
        fsm_output = 8'b00001110;
        state_var_NS = S2_INNER_LOOP1_for_C_2;
      end
      S2_INNER_LOOP1_for_C_2 : begin
        fsm_output = 8'b00001111;
        state_var_NS = S2_INNER_LOOP1_for_C_3;
      end
      S2_INNER_LOOP1_for_C_3 : begin
        fsm_output = 8'b00010000;
        state_var_NS = S2_INNER_LOOP1_for_C_4;
      end
      S2_INNER_LOOP1_for_C_4 : begin
        fsm_output = 8'b00010001;
        state_var_NS = S2_INNER_LOOP1_for_C_5;
      end
      S2_INNER_LOOP1_for_C_5 : begin
        fsm_output = 8'b00010010;
        state_var_NS = S2_INNER_LOOP1_for_C_6;
      end
      S2_INNER_LOOP1_for_C_6 : begin
        fsm_output = 8'b00010011;
        state_var_NS = S2_INNER_LOOP1_for_C_7;
      end
      S2_INNER_LOOP1_for_C_7 : begin
        fsm_output = 8'b00010100;
        state_var_NS = S2_INNER_LOOP1_for_C_8;
      end
      S2_INNER_LOOP1_for_C_8 : begin
        fsm_output = 8'b00010101;
        state_var_NS = S2_INNER_LOOP1_for_C_9;
      end
      S2_INNER_LOOP1_for_C_9 : begin
        fsm_output = 8'b00010110;
        state_var_NS = S2_INNER_LOOP1_for_C_10;
      end
      S2_INNER_LOOP1_for_C_10 : begin
        fsm_output = 8'b00010111;
        state_var_NS = S2_INNER_LOOP1_for_C_11;
      end
      S2_INNER_LOOP1_for_C_11 : begin
        fsm_output = 8'b00011000;
        state_var_NS = S2_INNER_LOOP1_for_C_12;
      end
      S2_INNER_LOOP1_for_C_12 : begin
        fsm_output = 8'b00011001;
        state_var_NS = S2_INNER_LOOP1_for_C_13;
      end
      S2_INNER_LOOP1_for_C_13 : begin
        fsm_output = 8'b00011010;
        state_var_NS = S2_INNER_LOOP1_for_C_14;
      end
      S2_INNER_LOOP1_for_C_14 : begin
        fsm_output = 8'b00011011;
        state_var_NS = S2_INNER_LOOP1_for_C_15;
      end
      S2_INNER_LOOP1_for_C_15 : begin
        fsm_output = 8'b00011100;
        state_var_NS = S2_INNER_LOOP1_for_C_16;
      end
      S2_INNER_LOOP1_for_C_16 : begin
        fsm_output = 8'b00011101;
        state_var_NS = S2_INNER_LOOP1_for_C_17;
      end
      S2_INNER_LOOP1_for_C_17 : begin
        fsm_output = 8'b00011110;
        state_var_NS = S2_INNER_LOOP1_for_C_18;
      end
      S2_INNER_LOOP1_for_C_18 : begin
        fsm_output = 8'b00011111;
        state_var_NS = S2_INNER_LOOP1_for_C_19;
      end
      S2_INNER_LOOP1_for_C_19 : begin
        fsm_output = 8'b00100000;
        state_var_NS = S2_INNER_LOOP1_for_C_20;
      end
      S2_INNER_LOOP1_for_C_20 : begin
        fsm_output = 8'b00100001;
        state_var_NS = S2_INNER_LOOP1_for_C_21;
      end
      S2_INNER_LOOP1_for_C_21 : begin
        fsm_output = 8'b00100010;
        state_var_NS = S2_INNER_LOOP1_for_C_22;
      end
      S2_INNER_LOOP1_for_C_22 : begin
        fsm_output = 8'b00100011;
        state_var_NS = S2_INNER_LOOP1_for_C_23;
      end
      S2_INNER_LOOP1_for_C_23 : begin
        fsm_output = 8'b00100100;
        state_var_NS = S2_INNER_LOOP1_for_C_24;
      end
      S2_INNER_LOOP1_for_C_24 : begin
        fsm_output = 8'b00100101;
        if ( S2_INNER_LOOP1_for_C_24_tr0 ) begin
          state_var_NS = S2_INNER_LOOP1_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP1_for_C_0;
        end
      end
      S2_INNER_LOOP1_C_0 : begin
        fsm_output = 8'b00100110;
        if ( S2_INNER_LOOP1_C_0_tr0 ) begin
          state_var_NS = S2_OUTER_LOOP_C_1;
        end
        else begin
          state_var_NS = S2_INNER_LOOP1_for_C_0;
        end
      end
      S2_OUTER_LOOP_C_1 : begin
        fsm_output = 8'b00100111;
        state_var_NS = S2_INNER_LOOP2_for_C_0;
      end
      S2_INNER_LOOP2_for_C_0 : begin
        fsm_output = 8'b00101000;
        state_var_NS = S2_INNER_LOOP2_for_C_1;
      end
      S2_INNER_LOOP2_for_C_1 : begin
        fsm_output = 8'b00101001;
        state_var_NS = S2_INNER_LOOP2_for_C_2;
      end
      S2_INNER_LOOP2_for_C_2 : begin
        fsm_output = 8'b00101010;
        state_var_NS = S2_INNER_LOOP2_for_C_3;
      end
      S2_INNER_LOOP2_for_C_3 : begin
        fsm_output = 8'b00101011;
        state_var_NS = S2_INNER_LOOP2_for_C_4;
      end
      S2_INNER_LOOP2_for_C_4 : begin
        fsm_output = 8'b00101100;
        state_var_NS = S2_INNER_LOOP2_for_C_5;
      end
      S2_INNER_LOOP2_for_C_5 : begin
        fsm_output = 8'b00101101;
        state_var_NS = S2_INNER_LOOP2_for_C_6;
      end
      S2_INNER_LOOP2_for_C_6 : begin
        fsm_output = 8'b00101110;
        state_var_NS = S2_INNER_LOOP2_for_C_7;
      end
      S2_INNER_LOOP2_for_C_7 : begin
        fsm_output = 8'b00101111;
        state_var_NS = S2_INNER_LOOP2_for_C_8;
      end
      S2_INNER_LOOP2_for_C_8 : begin
        fsm_output = 8'b00110000;
        state_var_NS = S2_INNER_LOOP2_for_C_9;
      end
      S2_INNER_LOOP2_for_C_9 : begin
        fsm_output = 8'b00110001;
        state_var_NS = S2_INNER_LOOP2_for_C_10;
      end
      S2_INNER_LOOP2_for_C_10 : begin
        fsm_output = 8'b00110010;
        state_var_NS = S2_INNER_LOOP2_for_C_11;
      end
      S2_INNER_LOOP2_for_C_11 : begin
        fsm_output = 8'b00110011;
        state_var_NS = S2_INNER_LOOP2_for_C_12;
      end
      S2_INNER_LOOP2_for_C_12 : begin
        fsm_output = 8'b00110100;
        state_var_NS = S2_INNER_LOOP2_for_C_13;
      end
      S2_INNER_LOOP2_for_C_13 : begin
        fsm_output = 8'b00110101;
        state_var_NS = S2_INNER_LOOP2_for_C_14;
      end
      S2_INNER_LOOP2_for_C_14 : begin
        fsm_output = 8'b00110110;
        state_var_NS = S2_INNER_LOOP2_for_C_15;
      end
      S2_INNER_LOOP2_for_C_15 : begin
        fsm_output = 8'b00110111;
        state_var_NS = S2_INNER_LOOP2_for_C_16;
      end
      S2_INNER_LOOP2_for_C_16 : begin
        fsm_output = 8'b00111000;
        state_var_NS = S2_INNER_LOOP2_for_C_17;
      end
      S2_INNER_LOOP2_for_C_17 : begin
        fsm_output = 8'b00111001;
        state_var_NS = S2_INNER_LOOP2_for_C_18;
      end
      S2_INNER_LOOP2_for_C_18 : begin
        fsm_output = 8'b00111010;
        state_var_NS = S2_INNER_LOOP2_for_C_19;
      end
      S2_INNER_LOOP2_for_C_19 : begin
        fsm_output = 8'b00111011;
        state_var_NS = S2_INNER_LOOP2_for_C_20;
      end
      S2_INNER_LOOP2_for_C_20 : begin
        fsm_output = 8'b00111100;
        state_var_NS = S2_INNER_LOOP2_for_C_21;
      end
      S2_INNER_LOOP2_for_C_21 : begin
        fsm_output = 8'b00111101;
        state_var_NS = S2_INNER_LOOP2_for_C_22;
      end
      S2_INNER_LOOP2_for_C_22 : begin
        fsm_output = 8'b00111110;
        state_var_NS = S2_INNER_LOOP2_for_C_23;
      end
      S2_INNER_LOOP2_for_C_23 : begin
        fsm_output = 8'b00111111;
        if ( S2_INNER_LOOP2_for_C_23_tr0 ) begin
          state_var_NS = S2_INNER_LOOP2_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP2_for_C_0;
        end
      end
      S2_INNER_LOOP2_C_0 : begin
        fsm_output = 8'b01000000;
        if ( S2_INNER_LOOP2_C_0_tr0 ) begin
          state_var_NS = S2_INNER_LOOP3_for_C_0;
        end
        else if ( S2_INNER_LOOP2_C_0_tr1 ) begin
          state_var_NS = S2_INNER_LOOP2_for_C_0;
        end
        else begin
          state_var_NS = S2_OUTER_LOOP_C_0;
        end
      end
      S2_INNER_LOOP3_for_C_0 : begin
        fsm_output = 8'b01000001;
        state_var_NS = S2_INNER_LOOP3_for_C_1;
      end
      S2_INNER_LOOP3_for_C_1 : begin
        fsm_output = 8'b01000010;
        state_var_NS = S2_INNER_LOOP3_for_C_2;
      end
      S2_INNER_LOOP3_for_C_2 : begin
        fsm_output = 8'b01000011;
        state_var_NS = S2_INNER_LOOP3_for_C_3;
      end
      S2_INNER_LOOP3_for_C_3 : begin
        fsm_output = 8'b01000100;
        state_var_NS = S2_INNER_LOOP3_for_C_4;
      end
      S2_INNER_LOOP3_for_C_4 : begin
        fsm_output = 8'b01000101;
        state_var_NS = S2_INNER_LOOP3_for_C_5;
      end
      S2_INNER_LOOP3_for_C_5 : begin
        fsm_output = 8'b01000110;
        state_var_NS = S2_INNER_LOOP3_for_C_6;
      end
      S2_INNER_LOOP3_for_C_6 : begin
        fsm_output = 8'b01000111;
        state_var_NS = S2_INNER_LOOP3_for_C_7;
      end
      S2_INNER_LOOP3_for_C_7 : begin
        fsm_output = 8'b01001000;
        state_var_NS = S2_INNER_LOOP3_for_C_8;
      end
      S2_INNER_LOOP3_for_C_8 : begin
        fsm_output = 8'b01001001;
        state_var_NS = S2_INNER_LOOP3_for_C_9;
      end
      S2_INNER_LOOP3_for_C_9 : begin
        fsm_output = 8'b01001010;
        state_var_NS = S2_INNER_LOOP3_for_C_10;
      end
      S2_INNER_LOOP3_for_C_10 : begin
        fsm_output = 8'b01001011;
        state_var_NS = S2_INNER_LOOP3_for_C_11;
      end
      S2_INNER_LOOP3_for_C_11 : begin
        fsm_output = 8'b01001100;
        state_var_NS = S2_INNER_LOOP3_for_C_12;
      end
      S2_INNER_LOOP3_for_C_12 : begin
        fsm_output = 8'b01001101;
        state_var_NS = S2_INNER_LOOP3_for_C_13;
      end
      S2_INNER_LOOP3_for_C_13 : begin
        fsm_output = 8'b01001110;
        state_var_NS = S2_INNER_LOOP3_for_C_14;
      end
      S2_INNER_LOOP3_for_C_14 : begin
        fsm_output = 8'b01001111;
        state_var_NS = S2_INNER_LOOP3_for_C_15;
      end
      S2_INNER_LOOP3_for_C_15 : begin
        fsm_output = 8'b01010000;
        state_var_NS = S2_INNER_LOOP3_for_C_16;
      end
      S2_INNER_LOOP3_for_C_16 : begin
        fsm_output = 8'b01010001;
        state_var_NS = S2_INNER_LOOP3_for_C_17;
      end
      S2_INNER_LOOP3_for_C_17 : begin
        fsm_output = 8'b01010010;
        state_var_NS = S2_INNER_LOOP3_for_C_18;
      end
      S2_INNER_LOOP3_for_C_18 : begin
        fsm_output = 8'b01010011;
        state_var_NS = S2_INNER_LOOP3_for_C_19;
      end
      S2_INNER_LOOP3_for_C_19 : begin
        fsm_output = 8'b01010100;
        state_var_NS = S2_INNER_LOOP3_for_C_20;
      end
      S2_INNER_LOOP3_for_C_20 : begin
        fsm_output = 8'b01010101;
        state_var_NS = S2_INNER_LOOP3_for_C_21;
      end
      S2_INNER_LOOP3_for_C_21 : begin
        fsm_output = 8'b01010110;
        state_var_NS = S2_INNER_LOOP3_for_C_22;
      end
      S2_INNER_LOOP3_for_C_22 : begin
        fsm_output = 8'b01010111;
        state_var_NS = S2_INNER_LOOP3_for_C_23;
      end
      S2_INNER_LOOP3_for_C_23 : begin
        fsm_output = 8'b01011000;
        if ( S2_INNER_LOOP3_for_C_23_tr0 ) begin
          state_var_NS = S2_INNER_LOOP3_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP3_for_C_0;
        end
      end
      S2_INNER_LOOP3_C_0 : begin
        fsm_output = 8'b01011001;
        if ( S2_INNER_LOOP3_C_0_tr0 ) begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP3_for_C_0;
        end
      end
      S34_OUTER_LOOP_for_C_0 : begin
        fsm_output = 8'b01011010;
        state_var_NS = S34_OUTER_LOOP_for_C_1;
      end
      S34_OUTER_LOOP_for_C_1 : begin
        fsm_output = 8'b01011011;
        state_var_NS = S34_OUTER_LOOP_for_C_2;
      end
      S34_OUTER_LOOP_for_C_2 : begin
        fsm_output = 8'b01011100;
        state_var_NS = S34_OUTER_LOOP_for_C_3;
      end
      S34_OUTER_LOOP_for_C_3 : begin
        fsm_output = 8'b01011101;
        state_var_NS = S34_OUTER_LOOP_for_C_4;
      end
      S34_OUTER_LOOP_for_C_4 : begin
        fsm_output = 8'b01011110;
        state_var_NS = S34_OUTER_LOOP_for_C_5;
      end
      S34_OUTER_LOOP_for_C_5 : begin
        fsm_output = 8'b01011111;
        state_var_NS = S34_OUTER_LOOP_for_C_6;
      end
      S34_OUTER_LOOP_for_C_6 : begin
        fsm_output = 8'b01100000;
        state_var_NS = S34_OUTER_LOOP_for_C_7;
      end
      S34_OUTER_LOOP_for_C_7 : begin
        fsm_output = 8'b01100001;
        state_var_NS = S34_OUTER_LOOP_for_C_8;
      end
      S34_OUTER_LOOP_for_C_8 : begin
        fsm_output = 8'b01100010;
        state_var_NS = S34_OUTER_LOOP_for_C_9;
      end
      S34_OUTER_LOOP_for_C_9 : begin
        fsm_output = 8'b01100011;
        state_var_NS = S34_OUTER_LOOP_for_C_10;
      end
      S34_OUTER_LOOP_for_C_10 : begin
        fsm_output = 8'b01100100;
        state_var_NS = S34_OUTER_LOOP_for_C_11;
      end
      S34_OUTER_LOOP_for_C_11 : begin
        fsm_output = 8'b01100101;
        state_var_NS = S34_OUTER_LOOP_for_C_12;
      end
      S34_OUTER_LOOP_for_C_12 : begin
        fsm_output = 8'b01100110;
        if ( S34_OUTER_LOOP_for_C_12_tr0 ) begin
          state_var_NS = S34_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
      end
      S34_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b01100111;
        if ( S34_OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
      end
      S5_COPY_LOOP_for_C_0 : begin
        fsm_output = 8'b01101000;
        state_var_NS = S5_COPY_LOOP_for_C_1;
      end
      S5_COPY_LOOP_for_C_1 : begin
        fsm_output = 8'b01101001;
        state_var_NS = S5_COPY_LOOP_for_C_2;
      end
      S5_COPY_LOOP_for_C_2 : begin
        fsm_output = 8'b01101010;
        state_var_NS = S5_COPY_LOOP_for_C_3;
      end
      S5_COPY_LOOP_for_C_3 : begin
        fsm_output = 8'b01101011;
        if ( S5_COPY_LOOP_for_C_3_tr0 ) begin
          state_var_NS = S5_COPY_LOOP_C_0;
        end
        else begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
      end
      S5_COPY_LOOP_C_0 : begin
        fsm_output = 8'b01101100;
        if ( S5_COPY_LOOP_C_0_tr0 ) begin
          state_var_NS = S5_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
      end
      S5_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b01101101;
        state_var_NS = S5_INNER_LOOP1_for_C_0;
      end
      S5_INNER_LOOP1_for_C_0 : begin
        fsm_output = 8'b01101110;
        state_var_NS = S5_INNER_LOOP1_for_C_1;
      end
      S5_INNER_LOOP1_for_C_1 : begin
        fsm_output = 8'b01101111;
        state_var_NS = S5_INNER_LOOP1_for_C_2;
      end
      S5_INNER_LOOP1_for_C_2 : begin
        fsm_output = 8'b01110000;
        state_var_NS = S5_INNER_LOOP1_for_C_3;
      end
      S5_INNER_LOOP1_for_C_3 : begin
        fsm_output = 8'b01110001;
        state_var_NS = S5_INNER_LOOP1_for_C_4;
      end
      S5_INNER_LOOP1_for_C_4 : begin
        fsm_output = 8'b01110010;
        state_var_NS = S5_INNER_LOOP1_for_C_5;
      end
      S5_INNER_LOOP1_for_C_5 : begin
        fsm_output = 8'b01110011;
        state_var_NS = S5_INNER_LOOP1_for_C_6;
      end
      S5_INNER_LOOP1_for_C_6 : begin
        fsm_output = 8'b01110100;
        state_var_NS = S5_INNER_LOOP1_for_C_7;
      end
      S5_INNER_LOOP1_for_C_7 : begin
        fsm_output = 8'b01110101;
        state_var_NS = S5_INNER_LOOP1_for_C_8;
      end
      S5_INNER_LOOP1_for_C_8 : begin
        fsm_output = 8'b01110110;
        state_var_NS = S5_INNER_LOOP1_for_C_9;
      end
      S5_INNER_LOOP1_for_C_9 : begin
        fsm_output = 8'b01110111;
        state_var_NS = S5_INNER_LOOP1_for_C_10;
      end
      S5_INNER_LOOP1_for_C_10 : begin
        fsm_output = 8'b01111000;
        state_var_NS = S5_INNER_LOOP1_for_C_11;
      end
      S5_INNER_LOOP1_for_C_11 : begin
        fsm_output = 8'b01111001;
        state_var_NS = S5_INNER_LOOP1_for_C_12;
      end
      S5_INNER_LOOP1_for_C_12 : begin
        fsm_output = 8'b01111010;
        state_var_NS = S5_INNER_LOOP1_for_C_13;
      end
      S5_INNER_LOOP1_for_C_13 : begin
        fsm_output = 8'b01111011;
        state_var_NS = S5_INNER_LOOP1_for_C_14;
      end
      S5_INNER_LOOP1_for_C_14 : begin
        fsm_output = 8'b01111100;
        state_var_NS = S5_INNER_LOOP1_for_C_15;
      end
      S5_INNER_LOOP1_for_C_15 : begin
        fsm_output = 8'b01111101;
        state_var_NS = S5_INNER_LOOP1_for_C_16;
      end
      S5_INNER_LOOP1_for_C_16 : begin
        fsm_output = 8'b01111110;
        state_var_NS = S5_INNER_LOOP1_for_C_17;
      end
      S5_INNER_LOOP1_for_C_17 : begin
        fsm_output = 8'b01111111;
        state_var_NS = S5_INNER_LOOP1_for_C_18;
      end
      S5_INNER_LOOP1_for_C_18 : begin
        fsm_output = 8'b10000000;
        state_var_NS = S5_INNER_LOOP1_for_C_19;
      end
      S5_INNER_LOOP1_for_C_19 : begin
        fsm_output = 8'b10000001;
        state_var_NS = S5_INNER_LOOP1_for_C_20;
      end
      S5_INNER_LOOP1_for_C_20 : begin
        fsm_output = 8'b10000010;
        state_var_NS = S5_INNER_LOOP1_for_C_21;
      end
      S5_INNER_LOOP1_for_C_21 : begin
        fsm_output = 8'b10000011;
        state_var_NS = S5_INNER_LOOP1_for_C_22;
      end
      S5_INNER_LOOP1_for_C_22 : begin
        fsm_output = 8'b10000100;
        state_var_NS = S5_INNER_LOOP1_for_C_23;
      end
      S5_INNER_LOOP1_for_C_23 : begin
        fsm_output = 8'b10000101;
        state_var_NS = S5_INNER_LOOP1_for_C_24;
      end
      S5_INNER_LOOP1_for_C_24 : begin
        fsm_output = 8'b10000110;
        if ( S5_INNER_LOOP1_for_C_24_tr0 ) begin
          state_var_NS = S5_INNER_LOOP1_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP1_for_C_0;
        end
      end
      S5_INNER_LOOP1_C_0 : begin
        fsm_output = 8'b10000111;
        if ( S5_INNER_LOOP1_C_0_tr0 ) begin
          state_var_NS = S5_OUTER_LOOP_C_1;
        end
        else begin
          state_var_NS = S5_INNER_LOOP1_for_C_0;
        end
      end
      S5_OUTER_LOOP_C_1 : begin
        fsm_output = 8'b10001000;
        state_var_NS = S5_INNER_LOOP2_for_C_0;
      end
      S5_INNER_LOOP2_for_C_0 : begin
        fsm_output = 8'b10001001;
        state_var_NS = S5_INNER_LOOP2_for_C_1;
      end
      S5_INNER_LOOP2_for_C_1 : begin
        fsm_output = 8'b10001010;
        state_var_NS = S5_INNER_LOOP2_for_C_2;
      end
      S5_INNER_LOOP2_for_C_2 : begin
        fsm_output = 8'b10001011;
        state_var_NS = S5_INNER_LOOP2_for_C_3;
      end
      S5_INNER_LOOP2_for_C_3 : begin
        fsm_output = 8'b10001100;
        state_var_NS = S5_INNER_LOOP2_for_C_4;
      end
      S5_INNER_LOOP2_for_C_4 : begin
        fsm_output = 8'b10001101;
        state_var_NS = S5_INNER_LOOP2_for_C_5;
      end
      S5_INNER_LOOP2_for_C_5 : begin
        fsm_output = 8'b10001110;
        state_var_NS = S5_INNER_LOOP2_for_C_6;
      end
      S5_INNER_LOOP2_for_C_6 : begin
        fsm_output = 8'b10001111;
        state_var_NS = S5_INNER_LOOP2_for_C_7;
      end
      S5_INNER_LOOP2_for_C_7 : begin
        fsm_output = 8'b10010000;
        state_var_NS = S5_INNER_LOOP2_for_C_8;
      end
      S5_INNER_LOOP2_for_C_8 : begin
        fsm_output = 8'b10010001;
        state_var_NS = S5_INNER_LOOP2_for_C_9;
      end
      S5_INNER_LOOP2_for_C_9 : begin
        fsm_output = 8'b10010010;
        state_var_NS = S5_INNER_LOOP2_for_C_10;
      end
      S5_INNER_LOOP2_for_C_10 : begin
        fsm_output = 8'b10010011;
        state_var_NS = S5_INNER_LOOP2_for_C_11;
      end
      S5_INNER_LOOP2_for_C_11 : begin
        fsm_output = 8'b10010100;
        state_var_NS = S5_INNER_LOOP2_for_C_12;
      end
      S5_INNER_LOOP2_for_C_12 : begin
        fsm_output = 8'b10010101;
        state_var_NS = S5_INNER_LOOP2_for_C_13;
      end
      S5_INNER_LOOP2_for_C_13 : begin
        fsm_output = 8'b10010110;
        state_var_NS = S5_INNER_LOOP2_for_C_14;
      end
      S5_INNER_LOOP2_for_C_14 : begin
        fsm_output = 8'b10010111;
        state_var_NS = S5_INNER_LOOP2_for_C_15;
      end
      S5_INNER_LOOP2_for_C_15 : begin
        fsm_output = 8'b10011000;
        state_var_NS = S5_INNER_LOOP2_for_C_16;
      end
      S5_INNER_LOOP2_for_C_16 : begin
        fsm_output = 8'b10011001;
        state_var_NS = S5_INNER_LOOP2_for_C_17;
      end
      S5_INNER_LOOP2_for_C_17 : begin
        fsm_output = 8'b10011010;
        state_var_NS = S5_INNER_LOOP2_for_C_18;
      end
      S5_INNER_LOOP2_for_C_18 : begin
        fsm_output = 8'b10011011;
        state_var_NS = S5_INNER_LOOP2_for_C_19;
      end
      S5_INNER_LOOP2_for_C_19 : begin
        fsm_output = 8'b10011100;
        state_var_NS = S5_INNER_LOOP2_for_C_20;
      end
      S5_INNER_LOOP2_for_C_20 : begin
        fsm_output = 8'b10011101;
        state_var_NS = S5_INNER_LOOP2_for_C_21;
      end
      S5_INNER_LOOP2_for_C_21 : begin
        fsm_output = 8'b10011110;
        state_var_NS = S5_INNER_LOOP2_for_C_22;
      end
      S5_INNER_LOOP2_for_C_22 : begin
        fsm_output = 8'b10011111;
        state_var_NS = S5_INNER_LOOP2_for_C_23;
      end
      S5_INNER_LOOP2_for_C_23 : begin
        fsm_output = 8'b10100000;
        if ( S5_INNER_LOOP2_for_C_23_tr0 ) begin
          state_var_NS = S5_INNER_LOOP2_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP2_for_C_0;
        end
      end
      S5_INNER_LOOP2_C_0 : begin
        fsm_output = 8'b10100001;
        if ( S5_INNER_LOOP2_C_0_tr0 ) begin
          state_var_NS = S5_INNER_LOOP3_for_C_0;
        end
        else if ( S5_INNER_LOOP2_C_0_tr1 ) begin
          state_var_NS = S5_INNER_LOOP2_for_C_0;
        end
        else begin
          state_var_NS = S5_OUTER_LOOP_C_0;
        end
      end
      S5_INNER_LOOP3_for_C_0 : begin
        fsm_output = 8'b10100010;
        state_var_NS = S5_INNER_LOOP3_for_C_1;
      end
      S5_INNER_LOOP3_for_C_1 : begin
        fsm_output = 8'b10100011;
        state_var_NS = S5_INNER_LOOP3_for_C_2;
      end
      S5_INNER_LOOP3_for_C_2 : begin
        fsm_output = 8'b10100100;
        state_var_NS = S5_INNER_LOOP3_for_C_3;
      end
      S5_INNER_LOOP3_for_C_3 : begin
        fsm_output = 8'b10100101;
        state_var_NS = S5_INNER_LOOP3_for_C_4;
      end
      S5_INNER_LOOP3_for_C_4 : begin
        fsm_output = 8'b10100110;
        state_var_NS = S5_INNER_LOOP3_for_C_5;
      end
      S5_INNER_LOOP3_for_C_5 : begin
        fsm_output = 8'b10100111;
        state_var_NS = S5_INNER_LOOP3_for_C_6;
      end
      S5_INNER_LOOP3_for_C_6 : begin
        fsm_output = 8'b10101000;
        state_var_NS = S5_INNER_LOOP3_for_C_7;
      end
      S5_INNER_LOOP3_for_C_7 : begin
        fsm_output = 8'b10101001;
        state_var_NS = S5_INNER_LOOP3_for_C_8;
      end
      S5_INNER_LOOP3_for_C_8 : begin
        fsm_output = 8'b10101010;
        state_var_NS = S5_INNER_LOOP3_for_C_9;
      end
      S5_INNER_LOOP3_for_C_9 : begin
        fsm_output = 8'b10101011;
        state_var_NS = S5_INNER_LOOP3_for_C_10;
      end
      S5_INNER_LOOP3_for_C_10 : begin
        fsm_output = 8'b10101100;
        state_var_NS = S5_INNER_LOOP3_for_C_11;
      end
      S5_INNER_LOOP3_for_C_11 : begin
        fsm_output = 8'b10101101;
        state_var_NS = S5_INNER_LOOP3_for_C_12;
      end
      S5_INNER_LOOP3_for_C_12 : begin
        fsm_output = 8'b10101110;
        state_var_NS = S5_INNER_LOOP3_for_C_13;
      end
      S5_INNER_LOOP3_for_C_13 : begin
        fsm_output = 8'b10101111;
        state_var_NS = S5_INNER_LOOP3_for_C_14;
      end
      S5_INNER_LOOP3_for_C_14 : begin
        fsm_output = 8'b10110000;
        state_var_NS = S5_INNER_LOOP3_for_C_15;
      end
      S5_INNER_LOOP3_for_C_15 : begin
        fsm_output = 8'b10110001;
        state_var_NS = S5_INNER_LOOP3_for_C_16;
      end
      S5_INNER_LOOP3_for_C_16 : begin
        fsm_output = 8'b10110010;
        state_var_NS = S5_INNER_LOOP3_for_C_17;
      end
      S5_INNER_LOOP3_for_C_17 : begin
        fsm_output = 8'b10110011;
        state_var_NS = S5_INNER_LOOP3_for_C_18;
      end
      S5_INNER_LOOP3_for_C_18 : begin
        fsm_output = 8'b10110100;
        state_var_NS = S5_INNER_LOOP3_for_C_19;
      end
      S5_INNER_LOOP3_for_C_19 : begin
        fsm_output = 8'b10110101;
        state_var_NS = S5_INNER_LOOP3_for_C_20;
      end
      S5_INNER_LOOP3_for_C_20 : begin
        fsm_output = 8'b10110110;
        state_var_NS = S5_INNER_LOOP3_for_C_21;
      end
      S5_INNER_LOOP3_for_C_21 : begin
        fsm_output = 8'b10110111;
        state_var_NS = S5_INNER_LOOP3_for_C_22;
      end
      S5_INNER_LOOP3_for_C_22 : begin
        fsm_output = 8'b10111000;
        state_var_NS = S5_INNER_LOOP3_for_C_23;
      end
      S5_INNER_LOOP3_for_C_23 : begin
        fsm_output = 8'b10111001;
        if ( S5_INNER_LOOP3_for_C_23_tr0 ) begin
          state_var_NS = S5_INNER_LOOP3_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP3_for_C_0;
        end
      end
      S5_INNER_LOOP3_C_0 : begin
        fsm_output = 8'b10111010;
        if ( S5_INNER_LOOP3_C_0_tr0 ) begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP3_for_C_0;
        end
      end
      S6_OUTER_LOOP_for_C_0 : begin
        fsm_output = 8'b10111011;
        state_var_NS = S6_OUTER_LOOP_for_C_1;
      end
      S6_OUTER_LOOP_for_C_1 : begin
        fsm_output = 8'b10111100;
        state_var_NS = S6_OUTER_LOOP_for_C_2;
      end
      S6_OUTER_LOOP_for_C_2 : begin
        fsm_output = 8'b10111101;
        state_var_NS = S6_OUTER_LOOP_for_C_3;
      end
      S6_OUTER_LOOP_for_C_3 : begin
        fsm_output = 8'b10111110;
        if ( S6_OUTER_LOOP_for_C_3_tr0 ) begin
          state_var_NS = S6_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
      end
      S6_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b10111111;
        if ( S6_OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b11000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 8'b00000000;
        state_var_NS = S1_OUTER_LOOP_for_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( core_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_staller
// ------------------------------------------------------------------


module hybrid_core_staller (
  clk, rst, core_wen, core_wten, x_rsci_wen_comp, x_rsci_wen_comp_1, twiddle_rsci_wen_comp,
      twiddle_h_rsci_wen_comp, revArr_rsci_wen_comp, tw_rsci_wen_comp, tw_h_rsci_wen_comp
);
  input clk;
  input rst;
  output core_wen;
  output core_wten;
  reg core_wten;
  input x_rsci_wen_comp;
  input x_rsci_wen_comp_1;
  input twiddle_rsci_wen_comp;
  input twiddle_h_rsci_wen_comp;
  input revArr_rsci_wen_comp;
  input tw_rsci_wen_comp;
  input tw_h_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign core_wen = x_rsci_wen_comp & x_rsci_wen_comp_1 & twiddle_rsci_wen_comp &
      twiddle_h_rsci_wen_comp & revArr_rsci_wen_comp & tw_rsci_wen_comp & tw_h_rsci_wen_comp;
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
//  Design Unit:    hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl (
  core_wten, tw_h_rsc_triosy_obj_iswt0, tw_h_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input tw_h_rsc_triosy_obj_iswt0;
  output tw_h_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign tw_h_rsc_triosy_obj_ld_core_sct = tw_h_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl (
  core_wten, tw_rsc_triosy_obj_iswt0, tw_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input tw_rsc_triosy_obj_iswt0;
  output tw_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign tw_rsc_triosy_obj_ld_core_sct = tw_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl (
  core_wten, revArr_rsc_triosy_obj_iswt0, revArr_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input revArr_rsc_triosy_obj_iswt0;
  output revArr_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign revArr_rsc_triosy_obj_ld_core_sct = revArr_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl (
  core_wten, twiddle_h_rsc_triosy_obj_iswt0, twiddle_h_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_obj_iswt0;
  output twiddle_h_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_obj_ld_core_sct = twiddle_h_rsc_triosy_obj_iswt0 &
      (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl (
  core_wten, twiddle_rsc_triosy_obj_iswt0, twiddle_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_obj_iswt0;
  output twiddle_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_obj_ld_core_sct = twiddle_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl (
  core_wten, m_rsc_triosy_obj_iswt0, m_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input m_rsc_triosy_obj_iswt0;
  output m_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign m_rsc_triosy_obj_ld_core_sct = m_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl (
  core_wten, x_rsc_triosy_obj_iswt0, x_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input x_rsc_triosy_obj_iswt0;
  output x_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign x_rsc_triosy_obj_ld_core_sct = x_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp
// ------------------------------------------------------------------


module hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp (
  clk, rst, tw_h_rsci_oswt, tw_h_rsci_wen_comp, tw_h_rsci_s_raddr_core, tw_h_rsci_s_din_mxwt,
      tw_h_rsci_biwt, tw_h_rsci_bdwt, tw_h_rsci_bcwt, tw_h_rsci_s_raddr, tw_h_rsci_s_raddr_core_sct,
      tw_h_rsci_s_din
);
  input clk;
  input rst;
  input tw_h_rsci_oswt;
  output tw_h_rsci_wen_comp;
  input [9:0] tw_h_rsci_s_raddr_core;
  output [19:0] tw_h_rsci_s_din_mxwt;
  input tw_h_rsci_biwt;
  input tw_h_rsci_bdwt;
  output tw_h_rsci_bcwt;
  reg tw_h_rsci_bcwt;
  output [9:0] tw_h_rsci_s_raddr;
  input tw_h_rsci_s_raddr_core_sct;
  input [31:0] tw_h_rsci_s_din;


  // Interconnect Declarations
  reg [19:0] tw_h_rsci_s_din_bfwt_19_0;


  // Interconnect Declarations for Component Instantiations 
  assign tw_h_rsci_wen_comp = (~ tw_h_rsci_oswt) | tw_h_rsci_biwt | tw_h_rsci_bcwt;
  assign tw_h_rsci_s_raddr = MUX_v_10_2_2(10'b0000000000, tw_h_rsci_s_raddr_core,
      tw_h_rsci_s_raddr_core_sct);
  assign tw_h_rsci_s_din_mxwt = MUX_v_20_2_2((tw_h_rsci_s_din[19:0]), tw_h_rsci_s_din_bfwt_19_0,
      tw_h_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      tw_h_rsci_bcwt <= 1'b0;
    end
    else begin
      tw_h_rsci_bcwt <= ~((~(tw_h_rsci_bcwt | tw_h_rsci_biwt)) | tw_h_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( tw_h_rsci_biwt ) begin
      tw_h_rsci_s_din_bfwt_19_0 <= tw_h_rsci_s_din[19:0];
    end
  end

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


  function automatic [19:0] MUX_v_20_2_2;
    input [19:0] input_0;
    input [19:0] input_1;
    input [0:0] sel;
    reg [19:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_20_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl (
  core_wen, tw_h_rsci_oswt, tw_h_rsci_biwt, tw_h_rsci_bdwt, tw_h_rsci_bcwt, tw_h_rsci_s_re_core_sct,
      tw_h_rsci_s_rrdy
);
  input core_wen;
  input tw_h_rsci_oswt;
  output tw_h_rsci_biwt;
  output tw_h_rsci_bdwt;
  input tw_h_rsci_bcwt;
  output tw_h_rsci_s_re_core_sct;
  input tw_h_rsci_s_rrdy;


  // Interconnect Declarations
  wire tw_h_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign tw_h_rsci_bdwt = tw_h_rsci_oswt & core_wen;
  assign tw_h_rsci_biwt = tw_h_rsci_ogwt & tw_h_rsci_s_rrdy;
  assign tw_h_rsci_ogwt = tw_h_rsci_oswt & (~ tw_h_rsci_bcwt);
  assign tw_h_rsci_s_re_core_sct = tw_h_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_rsci_tw_rsc_wait_dp
// ------------------------------------------------------------------


module hybrid_core_tw_rsci_tw_rsc_wait_dp (
  clk, rst, tw_rsci_oswt, tw_rsci_wen_comp, tw_rsci_s_raddr_core, tw_rsci_s_din_mxwt,
      tw_rsci_biwt, tw_rsci_bdwt, tw_rsci_bcwt, tw_rsci_s_raddr, tw_rsci_s_raddr_core_sct,
      tw_rsci_s_din
);
  input clk;
  input rst;
  input tw_rsci_oswt;
  output tw_rsci_wen_comp;
  input [9:0] tw_rsci_s_raddr_core;
  output [19:0] tw_rsci_s_din_mxwt;
  input tw_rsci_biwt;
  input tw_rsci_bdwt;
  output tw_rsci_bcwt;
  reg tw_rsci_bcwt;
  output [9:0] tw_rsci_s_raddr;
  input tw_rsci_s_raddr_core_sct;
  input [31:0] tw_rsci_s_din;


  // Interconnect Declarations
  reg [19:0] tw_rsci_s_din_bfwt_19_0;


  // Interconnect Declarations for Component Instantiations 
  assign tw_rsci_wen_comp = (~ tw_rsci_oswt) | tw_rsci_biwt | tw_rsci_bcwt;
  assign tw_rsci_s_raddr = MUX_v_10_2_2(10'b0000000000, tw_rsci_s_raddr_core, tw_rsci_s_raddr_core_sct);
  assign tw_rsci_s_din_mxwt = MUX_v_20_2_2((tw_rsci_s_din[19:0]), tw_rsci_s_din_bfwt_19_0,
      tw_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      tw_rsci_bcwt <= 1'b0;
    end
    else begin
      tw_rsci_bcwt <= ~((~(tw_rsci_bcwt | tw_rsci_biwt)) | tw_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( tw_rsci_biwt ) begin
      tw_rsci_s_din_bfwt_19_0 <= tw_rsci_s_din[19:0];
    end
  end

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


  function automatic [19:0] MUX_v_20_2_2;
    input [19:0] input_0;
    input [19:0] input_1;
    input [0:0] sel;
    reg [19:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_20_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_rsci_tw_rsc_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_tw_rsci_tw_rsc_wait_ctrl (
  core_wen, tw_rsci_oswt, tw_rsci_biwt, tw_rsci_bdwt, tw_rsci_bcwt, tw_rsci_s_re_core_sct,
      tw_rsci_s_rrdy
);
  input core_wen;
  input tw_rsci_oswt;
  output tw_rsci_biwt;
  output tw_rsci_bdwt;
  input tw_rsci_bcwt;
  output tw_rsci_s_re_core_sct;
  input tw_rsci_s_rrdy;


  // Interconnect Declarations
  wire tw_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign tw_rsci_bdwt = tw_rsci_oswt & core_wen;
  assign tw_rsci_biwt = tw_rsci_ogwt & tw_rsci_s_rrdy;
  assign tw_rsci_ogwt = tw_rsci_oswt & (~ tw_rsci_bcwt);
  assign tw_rsci_s_re_core_sct = tw_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_revArr_rsci_revArr_rsc_wait_dp
// ------------------------------------------------------------------


module hybrid_core_revArr_rsci_revArr_rsc_wait_dp (
  clk, rst, revArr_rsci_oswt, revArr_rsci_wen_comp, revArr_rsci_s_raddr_core, revArr_rsci_s_din_mxwt,
      revArr_rsci_biwt, revArr_rsci_bdwt, revArr_rsci_bcwt, revArr_rsci_s_raddr,
      revArr_rsci_s_raddr_core_sct, revArr_rsci_s_din
);
  input clk;
  input rst;
  input revArr_rsci_oswt;
  output revArr_rsci_wen_comp;
  input [4:0] revArr_rsci_s_raddr_core;
  output [9:0] revArr_rsci_s_din_mxwt;
  input revArr_rsci_biwt;
  input revArr_rsci_bdwt;
  output revArr_rsci_bcwt;
  reg revArr_rsci_bcwt;
  output [4:0] revArr_rsci_s_raddr;
  input revArr_rsci_s_raddr_core_sct;
  input [31:0] revArr_rsci_s_din;


  // Interconnect Declarations
  reg [9:0] revArr_rsci_s_din_bfwt_9_0;


  // Interconnect Declarations for Component Instantiations 
  assign revArr_rsci_wen_comp = (~ revArr_rsci_oswt) | revArr_rsci_biwt | revArr_rsci_bcwt;
  assign revArr_rsci_s_raddr = MUX_v_5_2_2(5'b00000, revArr_rsci_s_raddr_core, revArr_rsci_s_raddr_core_sct);
  assign revArr_rsci_s_din_mxwt = MUX_v_10_2_2((revArr_rsci_s_din[9:0]), revArr_rsci_s_din_bfwt_9_0,
      revArr_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      revArr_rsci_bcwt <= 1'b0;
    end
    else begin
      revArr_rsci_bcwt <= ~((~(revArr_rsci_bcwt | revArr_rsci_biwt)) | revArr_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( revArr_rsci_biwt ) begin
      revArr_rsci_s_din_bfwt_9_0 <= revArr_rsci_s_din[9:0];
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl (
  core_wen, revArr_rsci_oswt, revArr_rsci_biwt, revArr_rsci_bdwt, revArr_rsci_bcwt,
      revArr_rsci_s_re_core_sct, revArr_rsci_s_rrdy
);
  input core_wen;
  input revArr_rsci_oswt;
  output revArr_rsci_biwt;
  output revArr_rsci_bdwt;
  input revArr_rsci_bcwt;
  output revArr_rsci_s_re_core_sct;
  input revArr_rsci_s_rrdy;


  // Interconnect Declarations
  wire revArr_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign revArr_rsci_bdwt = revArr_rsci_oswt & core_wen;
  assign revArr_rsci_biwt = revArr_rsci_ogwt & revArr_rsci_s_rrdy;
  assign revArr_rsci_ogwt = revArr_rsci_oswt & (~ revArr_rsci_bcwt);
  assign revArr_rsci_s_re_core_sct = revArr_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp
// ------------------------------------------------------------------


module hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp (
  clk, rst, twiddle_h_rsci_oswt, twiddle_h_rsci_wen_comp, twiddle_h_rsci_s_raddr_core,
      twiddle_h_rsci_s_din_mxwt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt, twiddle_h_rsci_bcwt,
      twiddle_h_rsci_s_raddr, twiddle_h_rsci_s_raddr_core_sct, twiddle_h_rsci_s_din
);
  input clk;
  input rst;
  input twiddle_h_rsci_oswt;
  output twiddle_h_rsci_wen_comp;
  input [4:0] twiddle_h_rsci_s_raddr_core;
  output [31:0] twiddle_h_rsci_s_din_mxwt;
  input twiddle_h_rsci_biwt;
  input twiddle_h_rsci_bdwt;
  output twiddle_h_rsci_bcwt;
  reg twiddle_h_rsci_bcwt;
  output [4:0] twiddle_h_rsci_s_raddr;
  input twiddle_h_rsci_s_raddr_core_sct;
  input [31:0] twiddle_h_rsci_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_h_rsci_s_din_bfwt;

  wire[3:0] butterFly_tw_h_butterFly_tw_h_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_wen_comp = (~ twiddle_h_rsci_oswt) | twiddle_h_rsci_biwt
      | twiddle_h_rsci_bcwt;
  assign butterFly_tw_h_butterFly_tw_h_and_nl = MUX_v_4_2_2(4'b0000, (twiddle_h_rsci_s_raddr_core[3:0]),
      twiddle_h_rsci_s_raddr_core_sct);
  assign twiddle_h_rsci_s_raddr = {1'b0, butterFly_tw_h_butterFly_tw_h_and_nl};
  assign twiddle_h_rsci_s_din_mxwt = MUX_v_32_2_2(twiddle_h_rsci_s_din, twiddle_h_rsci_s_din_bfwt,
      twiddle_h_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsci_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsci_bcwt <= ~((~(twiddle_h_rsci_bcwt | twiddle_h_rsci_biwt)) | twiddle_h_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsci_biwt ) begin
      twiddle_h_rsci_s_din_bfwt <= twiddle_h_rsci_s_din;
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
//  Design Unit:    hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl (
  core_wen, twiddle_h_rsci_oswt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt, twiddle_h_rsci_bcwt,
      twiddle_h_rsci_s_re_core_sct, twiddle_h_rsci_s_rrdy
);
  input core_wen;
  input twiddle_h_rsci_oswt;
  output twiddle_h_rsci_biwt;
  output twiddle_h_rsci_bdwt;
  input twiddle_h_rsci_bcwt;
  output twiddle_h_rsci_s_re_core_sct;
  input twiddle_h_rsci_s_rrdy;


  // Interconnect Declarations
  wire twiddle_h_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_bdwt = twiddle_h_rsci_oswt & core_wen;
  assign twiddle_h_rsci_biwt = twiddle_h_rsci_ogwt & twiddle_h_rsci_s_rrdy;
  assign twiddle_h_rsci_ogwt = twiddle_h_rsci_oswt & (~ twiddle_h_rsci_bcwt);
  assign twiddle_h_rsci_s_re_core_sct = twiddle_h_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_oswt, twiddle_rsci_wen_comp, twiddle_rsci_s_raddr_core,
      twiddle_rsci_s_din_mxwt, twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_bcwt,
      twiddle_rsci_s_raddr, twiddle_rsci_s_raddr_core_sct, twiddle_rsci_s_din
);
  input clk;
  input rst;
  input twiddle_rsci_oswt;
  output twiddle_rsci_wen_comp;
  input [4:0] twiddle_rsci_s_raddr_core;
  output [31:0] twiddle_rsci_s_din_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;
  output twiddle_rsci_bcwt;
  reg twiddle_rsci_bcwt;
  output [4:0] twiddle_rsci_s_raddr;
  input twiddle_rsci_s_raddr_core_sct;
  input [31:0] twiddle_rsci_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_rsci_s_din_bfwt;

  wire[3:0] butterFly_tw_butterFly_tw_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_wen_comp = (~ twiddle_rsci_oswt) | twiddle_rsci_biwt | twiddle_rsci_bcwt;
  assign butterFly_tw_butterFly_tw_and_nl = MUX_v_4_2_2(4'b0000, (twiddle_rsci_s_raddr_core[3:0]),
      twiddle_rsci_s_raddr_core_sct);
  assign twiddle_rsci_s_raddr = {1'b0, butterFly_tw_butterFly_tw_and_nl};
  assign twiddle_rsci_s_din_mxwt = MUX_v_32_2_2(twiddle_rsci_s_din, twiddle_rsci_s_din_bfwt,
      twiddle_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsci_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsci_bcwt <= ~((~(twiddle_rsci_bcwt | twiddle_rsci_biwt)) | twiddle_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsci_biwt ) begin
      twiddle_rsci_s_din_bfwt <= twiddle_rsci_s_din;
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
//  Design Unit:    hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl (
  core_wen, twiddle_rsci_oswt, twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_bcwt,
      twiddle_rsci_s_re_core_sct, twiddle_rsci_s_rrdy
);
  input core_wen;
  input twiddle_rsci_oswt;
  output twiddle_rsci_biwt;
  output twiddle_rsci_bdwt;
  input twiddle_rsci_bcwt;
  output twiddle_rsci_s_re_core_sct;
  input twiddle_rsci_s_rrdy;


  // Interconnect Declarations
  wire twiddle_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_bdwt = twiddle_rsci_oswt & core_wen;
  assign twiddle_rsci_biwt = twiddle_rsci_ogwt & twiddle_rsci_s_rrdy;
  assign twiddle_rsci_ogwt = twiddle_rsci_oswt & (~ twiddle_rsci_bcwt);
  assign twiddle_rsci_s_re_core_sct = twiddle_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_x_rsci_x_rsc_wait_dp
// ------------------------------------------------------------------


module hybrid_core_x_rsci_x_rsc_wait_dp (
  clk, rst, x_rsci_oswt, x_rsci_wen_comp, x_rsci_oswt_1, x_rsci_wen_comp_1, x_rsci_s_raddr_core,
      x_rsci_s_waddr_core, x_rsci_s_din_mxwt, x_rsci_s_dout_core, x_rsci_biwt, x_rsci_bdwt,
      x_rsci_bcwt, x_rsci_biwt_1, x_rsci_bdwt_2, x_rsci_bcwt_1, x_rsci_s_raddr, x_rsci_s_raddr_core_sct,
      x_rsci_s_waddr, x_rsci_s_waddr_core_sct, x_rsci_s_din, x_rsci_s_dout
);
  input clk;
  input rst;
  input x_rsci_oswt;
  output x_rsci_wen_comp;
  input x_rsci_oswt_1;
  output x_rsci_wen_comp_1;
  input [9:0] x_rsci_s_raddr_core;
  input [9:0] x_rsci_s_waddr_core;
  output [31:0] x_rsci_s_din_mxwt;
  input [31:0] x_rsci_s_dout_core;
  input x_rsci_biwt;
  input x_rsci_bdwt;
  output x_rsci_bcwt;
  reg x_rsci_bcwt;
  input x_rsci_biwt_1;
  input x_rsci_bdwt_2;
  output x_rsci_bcwt_1;
  reg x_rsci_bcwt_1;
  output [9:0] x_rsci_s_raddr;
  input x_rsci_s_raddr_core_sct;
  output [9:0] x_rsci_s_waddr;
  input x_rsci_s_waddr_core_sct;
  input [31:0] x_rsci_s_din;
  output [31:0] x_rsci_s_dout;


  // Interconnect Declarations
  reg [31:0] x_rsci_s_din_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign x_rsci_wen_comp = (~ x_rsci_oswt) | x_rsci_biwt | x_rsci_bcwt;
  assign x_rsci_wen_comp_1 = (~ x_rsci_oswt_1) | x_rsci_biwt_1 | x_rsci_bcwt_1;
  assign x_rsci_s_raddr = MUX_v_10_2_2(10'b0000000000, x_rsci_s_raddr_core, x_rsci_s_raddr_core_sct);
  assign x_rsci_s_waddr = MUX_v_10_2_2(10'b0000000000, x_rsci_s_waddr_core, x_rsci_s_waddr_core_sct);
  assign x_rsci_s_din_mxwt = MUX_v_32_2_2(x_rsci_s_din, x_rsci_s_din_bfwt, x_rsci_bcwt);
  assign x_rsci_s_dout = MUX_v_32_2_2(32'b00000000000000000000000000000000, x_rsci_s_dout_core,
      x_rsci_s_waddr_core_sct);
  always @(posedge clk) begin
    if ( rst ) begin
      x_rsci_bcwt <= 1'b0;
      x_rsci_bcwt_1 <= 1'b0;
    end
    else begin
      x_rsci_bcwt <= ~((~(x_rsci_bcwt | x_rsci_biwt)) | x_rsci_bdwt);
      x_rsci_bcwt_1 <= ~((~(x_rsci_bcwt_1 | x_rsci_biwt_1)) | x_rsci_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( x_rsci_biwt ) begin
      x_rsci_s_din_bfwt <= x_rsci_s_din;
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_x_rsci_x_rsc_wait_ctrl
// ------------------------------------------------------------------


module hybrid_core_x_rsci_x_rsc_wait_ctrl (
  core_wen, x_rsci_oswt, x_rsci_oswt_1, x_rsci_biwt, x_rsci_bdwt, x_rsci_bcwt, x_rsci_s_re_core_sct,
      x_rsci_biwt_1, x_rsci_bdwt_2, x_rsci_bcwt_1, x_rsci_s_we_core_sct, x_rsci_s_rrdy,
      x_rsci_s_wrdy
);
  input core_wen;
  input x_rsci_oswt;
  input x_rsci_oswt_1;
  output x_rsci_biwt;
  output x_rsci_bdwt;
  input x_rsci_bcwt;
  output x_rsci_s_re_core_sct;
  output x_rsci_biwt_1;
  output x_rsci_bdwt_2;
  input x_rsci_bcwt_1;
  output x_rsci_s_we_core_sct;
  input x_rsci_s_rrdy;
  input x_rsci_s_wrdy;


  // Interconnect Declarations
  wire x_rsci_ogwt;
  wire x_rsci_ogwt_1;


  // Interconnect Declarations for Component Instantiations 
  assign x_rsci_bdwt = x_rsci_oswt & core_wen;
  assign x_rsci_biwt = x_rsci_ogwt & x_rsci_s_rrdy;
  assign x_rsci_ogwt = x_rsci_oswt & (~ x_rsci_bcwt);
  assign x_rsci_s_re_core_sct = x_rsci_ogwt;
  assign x_rsci_bdwt_2 = x_rsci_oswt_1 & core_wen;
  assign x_rsci_biwt_1 = x_rsci_ogwt_1 & x_rsci_s_wrdy;
  assign x_rsci_ogwt_1 = x_rsci_oswt_1 & (~ x_rsci_bcwt_1);
  assign x_rsci_s_we_core_sct = x_rsci_ogwt_1;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_wait_dp
// ------------------------------------------------------------------


module hybrid_core_wait_dp (
  clk, xx_rsc_cgo_iro, xx_rsci_clken_d, yy_rsc_cgo_iro, yy_rsci_clken_d, ensig_cgo_iro,
      S34_OUTER_LOOP_for_tf_mul_cmp_z, ensig_cgo_iro_1, core_wen, xx_rsc_cgo, yy_rsc_cgo,
      ensig_cgo, mult_12_z_mul_cmp_en, S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg, ensig_cgo_1,
      mult_z_mul_cmp_en
);
  input clk;
  input xx_rsc_cgo_iro;
  output xx_rsci_clken_d;
  input yy_rsc_cgo_iro;
  output yy_rsci_clken_d;
  input ensig_cgo_iro;
  input [9:0] S34_OUTER_LOOP_for_tf_mul_cmp_z;
  input ensig_cgo_iro_1;
  input core_wen;
  input xx_rsc_cgo;
  input yy_rsc_cgo;
  input ensig_cgo;
  output mult_12_z_mul_cmp_en;
  output [9:0] S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg;
  reg [9:0] S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg;
  input ensig_cgo_1;
  output mult_z_mul_cmp_en;



  // Interconnect Declarations for Component Instantiations 
  assign xx_rsci_clken_d = core_wen & (xx_rsc_cgo | xx_rsc_cgo_iro);
  assign yy_rsci_clken_d = core_wen & (yy_rsc_cgo | yy_rsc_cgo_iro);
  assign mult_12_z_mul_cmp_en = core_wen & (ensig_cgo | ensig_cgo_iro);
  assign mult_z_mul_cmp_en = core_wen & (ensig_cgo_1 | ensig_cgo_iro_1);
  always @(posedge clk) begin
    if ( core_wen ) begin
      S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg <= S34_OUTER_LOOP_for_tf_mul_cmp_z;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_h_rsc_triosy_obj
// ------------------------------------------------------------------


module hybrid_core_tw_h_rsc_triosy_obj (
  tw_h_rsc_triosy_lz, core_wten, tw_h_rsc_triosy_obj_iswt0
);
  output tw_h_rsc_triosy_lz;
  input core_wten;
  input tw_h_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire tw_h_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) tw_h_rsc_triosy_obj (
      .ld(tw_h_rsc_triosy_obj_ld_core_sct),
      .lz(tw_h_rsc_triosy_lz)
    );
  hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .tw_h_rsc_triosy_obj_iswt0(tw_h_rsc_triosy_obj_iswt0),
      .tw_h_rsc_triosy_obj_ld_core_sct(tw_h_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_rsc_triosy_obj
// ------------------------------------------------------------------


module hybrid_core_tw_rsc_triosy_obj (
  tw_rsc_triosy_lz, core_wten, tw_rsc_triosy_obj_iswt0
);
  output tw_rsc_triosy_lz;
  input core_wten;
  input tw_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire tw_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) tw_rsc_triosy_obj (
      .ld(tw_rsc_triosy_obj_ld_core_sct),
      .lz(tw_rsc_triosy_lz)
    );
  hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .tw_rsc_triosy_obj_iswt0(tw_rsc_triosy_obj_iswt0),
      .tw_rsc_triosy_obj_ld_core_sct(tw_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_revArr_rsc_triosy_obj
// ------------------------------------------------------------------


module hybrid_core_revArr_rsc_triosy_obj (
  revArr_rsc_triosy_lz, core_wten, revArr_rsc_triosy_obj_iswt0
);
  output revArr_rsc_triosy_lz;
  input core_wten;
  input revArr_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire revArr_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) revArr_rsc_triosy_obj (
      .ld(revArr_rsc_triosy_obj_ld_core_sct),
      .lz(revArr_rsc_triosy_lz)
    );
  hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .revArr_rsc_triosy_obj_iswt0(revArr_rsc_triosy_obj_iswt0),
      .revArr_rsc_triosy_obj_ld_core_sct(revArr_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_twiddle_h_rsc_triosy_obj
// ------------------------------------------------------------------


module hybrid_core_twiddle_h_rsc_triosy_obj (
  twiddle_h_rsc_triosy_lz, core_wten, twiddle_h_rsc_triosy_obj_iswt0
);
  output twiddle_h_rsc_triosy_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_obj (
      .ld(twiddle_h_rsc_triosy_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_lz)
    );
  hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(twiddle_h_rsc_triosy_obj_iswt0),
      .twiddle_h_rsc_triosy_obj_ld_core_sct(twiddle_h_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_twiddle_rsc_triosy_obj
// ------------------------------------------------------------------


module hybrid_core_twiddle_rsc_triosy_obj (
  twiddle_rsc_triosy_lz, core_wten, twiddle_rsc_triosy_obj_iswt0
);
  output twiddle_rsc_triosy_lz;
  input core_wten;
  input twiddle_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_obj (
      .ld(twiddle_rsc_triosy_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_lz)
    );
  hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(twiddle_rsc_triosy_obj_iswt0),
      .twiddle_rsc_triosy_obj_ld_core_sct(twiddle_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_m_rsc_triosy_obj
// ------------------------------------------------------------------


module hybrid_core_m_rsc_triosy_obj (
  m_rsc_triosy_lz, core_wten, m_rsc_triosy_obj_iswt0
);
  output m_rsc_triosy_lz;
  input core_wten;
  input m_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire m_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) m_rsc_triosy_obj (
      .ld(m_rsc_triosy_obj_ld_core_sct),
      .lz(m_rsc_triosy_lz)
    );
  hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .m_rsc_triosy_obj_iswt0(m_rsc_triosy_obj_iswt0),
      .m_rsc_triosy_obj_ld_core_sct(m_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_x_rsc_triosy_obj
// ------------------------------------------------------------------


module hybrid_core_x_rsc_triosy_obj (
  x_rsc_triosy_lz, core_wten, x_rsc_triosy_obj_iswt0
);
  output x_rsc_triosy_lz;
  input core_wten;
  input x_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire x_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) x_rsc_triosy_obj (
      .ld(x_rsc_triosy_obj_ld_core_sct),
      .lz(x_rsc_triosy_lz)
    );
  hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .x_rsc_triosy_obj_iswt0(x_rsc_triosy_obj_iswt0),
      .x_rsc_triosy_obj_ld_core_sct(x_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_h_rsci
// ------------------------------------------------------------------


module hybrid_core_tw_h_rsci (
  clk, rst, tw_h_rsc_s_tdone, tw_h_rsc_tr_write_done, tw_h_rsc_RREADY, tw_h_rsc_RVALID,
      tw_h_rsc_RUSER, tw_h_rsc_RLAST, tw_h_rsc_RRESP, tw_h_rsc_RDATA, tw_h_rsc_RID,
      tw_h_rsc_ARREADY, tw_h_rsc_ARVALID, tw_h_rsc_ARUSER, tw_h_rsc_ARREGION, tw_h_rsc_ARQOS,
      tw_h_rsc_ARPROT, tw_h_rsc_ARCACHE, tw_h_rsc_ARLOCK, tw_h_rsc_ARBURST, tw_h_rsc_ARSIZE,
      tw_h_rsc_ARLEN, tw_h_rsc_ARADDR, tw_h_rsc_ARID, tw_h_rsc_BREADY, tw_h_rsc_BVALID,
      tw_h_rsc_BUSER, tw_h_rsc_BRESP, tw_h_rsc_BID, tw_h_rsc_WREADY, tw_h_rsc_WVALID,
      tw_h_rsc_WUSER, tw_h_rsc_WLAST, tw_h_rsc_WSTRB, tw_h_rsc_WDATA, tw_h_rsc_AWREADY,
      tw_h_rsc_AWVALID, tw_h_rsc_AWUSER, tw_h_rsc_AWREGION, tw_h_rsc_AWQOS, tw_h_rsc_AWPROT,
      tw_h_rsc_AWCACHE, tw_h_rsc_AWLOCK, tw_h_rsc_AWBURST, tw_h_rsc_AWSIZE, tw_h_rsc_AWLEN,
      tw_h_rsc_AWADDR, tw_h_rsc_AWID, core_wen, tw_h_rsci_oswt, tw_h_rsci_wen_comp,
      tw_h_rsci_s_raddr_core, tw_h_rsci_s_din_mxwt
);
  input clk;
  input rst;
  input tw_h_rsc_s_tdone;
  input tw_h_rsc_tr_write_done;
  input tw_h_rsc_RREADY;
  output tw_h_rsc_RVALID;
  output tw_h_rsc_RUSER;
  output tw_h_rsc_RLAST;
  output [1:0] tw_h_rsc_RRESP;
  output [31:0] tw_h_rsc_RDATA;
  output tw_h_rsc_RID;
  output tw_h_rsc_ARREADY;
  input tw_h_rsc_ARVALID;
  input tw_h_rsc_ARUSER;
  input [3:0] tw_h_rsc_ARREGION;
  input [3:0] tw_h_rsc_ARQOS;
  input [2:0] tw_h_rsc_ARPROT;
  input [3:0] tw_h_rsc_ARCACHE;
  input tw_h_rsc_ARLOCK;
  input [1:0] tw_h_rsc_ARBURST;
  input [2:0] tw_h_rsc_ARSIZE;
  input [7:0] tw_h_rsc_ARLEN;
  input [11:0] tw_h_rsc_ARADDR;
  input tw_h_rsc_ARID;
  input tw_h_rsc_BREADY;
  output tw_h_rsc_BVALID;
  output tw_h_rsc_BUSER;
  output [1:0] tw_h_rsc_BRESP;
  output tw_h_rsc_BID;
  output tw_h_rsc_WREADY;
  input tw_h_rsc_WVALID;
  input tw_h_rsc_WUSER;
  input tw_h_rsc_WLAST;
  input [3:0] tw_h_rsc_WSTRB;
  input [31:0] tw_h_rsc_WDATA;
  output tw_h_rsc_AWREADY;
  input tw_h_rsc_AWVALID;
  input tw_h_rsc_AWUSER;
  input [3:0] tw_h_rsc_AWREGION;
  input [3:0] tw_h_rsc_AWQOS;
  input [2:0] tw_h_rsc_AWPROT;
  input [3:0] tw_h_rsc_AWCACHE;
  input tw_h_rsc_AWLOCK;
  input [1:0] tw_h_rsc_AWBURST;
  input [2:0] tw_h_rsc_AWSIZE;
  input [7:0] tw_h_rsc_AWLEN;
  input [11:0] tw_h_rsc_AWADDR;
  input tw_h_rsc_AWID;
  input core_wen;
  input tw_h_rsci_oswt;
  output tw_h_rsci_wen_comp;
  input [9:0] tw_h_rsci_s_raddr_core;
  output [19:0] tw_h_rsci_s_din_mxwt;


  // Interconnect Declarations
  wire tw_h_rsci_biwt;
  wire tw_h_rsci_bdwt;
  wire tw_h_rsci_bcwt;
  wire tw_h_rsci_s_re_core_sct;
  wire [9:0] tw_h_rsci_s_raddr;
  wire [31:0] tw_h_rsci_s_din;
  wire tw_h_rsci_s_rrdy;
  wire tw_h_rsci_s_wrdy;
  wire tw_h_rsc_is_idle;
  wire [19:0] tw_h_rsci_s_din_mxwt_pconst;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd1024),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd10),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) tw_h_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(tw_h_rsc_AWID),
      .AWADDR(tw_h_rsc_AWADDR),
      .AWLEN(tw_h_rsc_AWLEN),
      .AWSIZE(tw_h_rsc_AWSIZE),
      .AWBURST(tw_h_rsc_AWBURST),
      .AWLOCK(tw_h_rsc_AWLOCK),
      .AWCACHE(tw_h_rsc_AWCACHE),
      .AWPROT(tw_h_rsc_AWPROT),
      .AWQOS(tw_h_rsc_AWQOS),
      .AWREGION(tw_h_rsc_AWREGION),
      .AWUSER(tw_h_rsc_AWUSER),
      .AWVALID(tw_h_rsc_AWVALID),
      .AWREADY(tw_h_rsc_AWREADY),
      .WDATA(tw_h_rsc_WDATA),
      .WSTRB(tw_h_rsc_WSTRB),
      .WLAST(tw_h_rsc_WLAST),
      .WUSER(tw_h_rsc_WUSER),
      .WVALID(tw_h_rsc_WVALID),
      .WREADY(tw_h_rsc_WREADY),
      .BID(tw_h_rsc_BID),
      .BRESP(tw_h_rsc_BRESP),
      .BUSER(tw_h_rsc_BUSER),
      .BVALID(tw_h_rsc_BVALID),
      .BREADY(tw_h_rsc_BREADY),
      .ARID(tw_h_rsc_ARID),
      .ARADDR(tw_h_rsc_ARADDR),
      .ARLEN(tw_h_rsc_ARLEN),
      .ARSIZE(tw_h_rsc_ARSIZE),
      .ARBURST(tw_h_rsc_ARBURST),
      .ARLOCK(tw_h_rsc_ARLOCK),
      .ARCACHE(tw_h_rsc_ARCACHE),
      .ARPROT(tw_h_rsc_ARPROT),
      .ARQOS(tw_h_rsc_ARQOS),
      .ARREGION(tw_h_rsc_ARREGION),
      .ARUSER(tw_h_rsc_ARUSER),
      .ARVALID(tw_h_rsc_ARVALID),
      .ARREADY(tw_h_rsc_ARREADY),
      .RID(tw_h_rsc_RID),
      .RDATA(tw_h_rsc_RDATA),
      .RRESP(tw_h_rsc_RRESP),
      .RLAST(tw_h_rsc_RLAST),
      .RUSER(tw_h_rsc_RUSER),
      .RVALID(tw_h_rsc_RVALID),
      .RREADY(tw_h_rsc_RREADY),
      .s_re(tw_h_rsci_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(tw_h_rsci_s_raddr),
      .s_waddr(10'b0000000000),
      .s_din(tw_h_rsci_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(tw_h_rsci_s_rrdy),
      .s_wrdy(tw_h_rsci_s_wrdy),
      .is_idle(tw_h_rsc_is_idle),
      .tr_write_done(tw_h_rsc_tr_write_done),
      .s_tdone(tw_h_rsc_s_tdone)
    );
  hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .tw_h_rsci_oswt(tw_h_rsci_oswt),
      .tw_h_rsci_biwt(tw_h_rsci_biwt),
      .tw_h_rsci_bdwt(tw_h_rsci_bdwt),
      .tw_h_rsci_bcwt(tw_h_rsci_bcwt),
      .tw_h_rsci_s_re_core_sct(tw_h_rsci_s_re_core_sct),
      .tw_h_rsci_s_rrdy(tw_h_rsci_s_rrdy)
    );
  hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .tw_h_rsci_oswt(tw_h_rsci_oswt),
      .tw_h_rsci_wen_comp(tw_h_rsci_wen_comp),
      .tw_h_rsci_s_raddr_core(tw_h_rsci_s_raddr_core),
      .tw_h_rsci_s_din_mxwt(tw_h_rsci_s_din_mxwt_pconst),
      .tw_h_rsci_biwt(tw_h_rsci_biwt),
      .tw_h_rsci_bdwt(tw_h_rsci_bdwt),
      .tw_h_rsci_bcwt(tw_h_rsci_bcwt),
      .tw_h_rsci_s_raddr(tw_h_rsci_s_raddr),
      .tw_h_rsci_s_raddr_core_sct(tw_h_rsci_s_re_core_sct),
      .tw_h_rsci_s_din(tw_h_rsci_s_din)
    );
  assign tw_h_rsci_s_din_mxwt = tw_h_rsci_s_din_mxwt_pconst;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_tw_rsci
// ------------------------------------------------------------------


module hybrid_core_tw_rsci (
  clk, rst, tw_rsc_s_tdone, tw_rsc_tr_write_done, tw_rsc_RREADY, tw_rsc_RVALID, tw_rsc_RUSER,
      tw_rsc_RLAST, tw_rsc_RRESP, tw_rsc_RDATA, tw_rsc_RID, tw_rsc_ARREADY, tw_rsc_ARVALID,
      tw_rsc_ARUSER, tw_rsc_ARREGION, tw_rsc_ARQOS, tw_rsc_ARPROT, tw_rsc_ARCACHE,
      tw_rsc_ARLOCK, tw_rsc_ARBURST, tw_rsc_ARSIZE, tw_rsc_ARLEN, tw_rsc_ARADDR,
      tw_rsc_ARID, tw_rsc_BREADY, tw_rsc_BVALID, tw_rsc_BUSER, tw_rsc_BRESP, tw_rsc_BID,
      tw_rsc_WREADY, tw_rsc_WVALID, tw_rsc_WUSER, tw_rsc_WLAST, tw_rsc_WSTRB, tw_rsc_WDATA,
      tw_rsc_AWREADY, tw_rsc_AWVALID, tw_rsc_AWUSER, tw_rsc_AWREGION, tw_rsc_AWQOS,
      tw_rsc_AWPROT, tw_rsc_AWCACHE, tw_rsc_AWLOCK, tw_rsc_AWBURST, tw_rsc_AWSIZE,
      tw_rsc_AWLEN, tw_rsc_AWADDR, tw_rsc_AWID, core_wen, tw_rsci_oswt, tw_rsci_wen_comp,
      tw_rsci_s_raddr_core, tw_rsci_s_din_mxwt
);
  input clk;
  input rst;
  input tw_rsc_s_tdone;
  input tw_rsc_tr_write_done;
  input tw_rsc_RREADY;
  output tw_rsc_RVALID;
  output tw_rsc_RUSER;
  output tw_rsc_RLAST;
  output [1:0] tw_rsc_RRESP;
  output [31:0] tw_rsc_RDATA;
  output tw_rsc_RID;
  output tw_rsc_ARREADY;
  input tw_rsc_ARVALID;
  input tw_rsc_ARUSER;
  input [3:0] tw_rsc_ARREGION;
  input [3:0] tw_rsc_ARQOS;
  input [2:0] tw_rsc_ARPROT;
  input [3:0] tw_rsc_ARCACHE;
  input tw_rsc_ARLOCK;
  input [1:0] tw_rsc_ARBURST;
  input [2:0] tw_rsc_ARSIZE;
  input [7:0] tw_rsc_ARLEN;
  input [11:0] tw_rsc_ARADDR;
  input tw_rsc_ARID;
  input tw_rsc_BREADY;
  output tw_rsc_BVALID;
  output tw_rsc_BUSER;
  output [1:0] tw_rsc_BRESP;
  output tw_rsc_BID;
  output tw_rsc_WREADY;
  input tw_rsc_WVALID;
  input tw_rsc_WUSER;
  input tw_rsc_WLAST;
  input [3:0] tw_rsc_WSTRB;
  input [31:0] tw_rsc_WDATA;
  output tw_rsc_AWREADY;
  input tw_rsc_AWVALID;
  input tw_rsc_AWUSER;
  input [3:0] tw_rsc_AWREGION;
  input [3:0] tw_rsc_AWQOS;
  input [2:0] tw_rsc_AWPROT;
  input [3:0] tw_rsc_AWCACHE;
  input tw_rsc_AWLOCK;
  input [1:0] tw_rsc_AWBURST;
  input [2:0] tw_rsc_AWSIZE;
  input [7:0] tw_rsc_AWLEN;
  input [11:0] tw_rsc_AWADDR;
  input tw_rsc_AWID;
  input core_wen;
  input tw_rsci_oswt;
  output tw_rsci_wen_comp;
  input [9:0] tw_rsci_s_raddr_core;
  output [19:0] tw_rsci_s_din_mxwt;


  // Interconnect Declarations
  wire tw_rsci_biwt;
  wire tw_rsci_bdwt;
  wire tw_rsci_bcwt;
  wire tw_rsci_s_re_core_sct;
  wire [9:0] tw_rsci_s_raddr;
  wire [31:0] tw_rsci_s_din;
  wire tw_rsci_s_rrdy;
  wire tw_rsci_s_wrdy;
  wire tw_rsc_is_idle;
  wire [19:0] tw_rsci_s_din_mxwt_pconst;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd1024),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd10),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) tw_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(tw_rsc_AWID),
      .AWADDR(tw_rsc_AWADDR),
      .AWLEN(tw_rsc_AWLEN),
      .AWSIZE(tw_rsc_AWSIZE),
      .AWBURST(tw_rsc_AWBURST),
      .AWLOCK(tw_rsc_AWLOCK),
      .AWCACHE(tw_rsc_AWCACHE),
      .AWPROT(tw_rsc_AWPROT),
      .AWQOS(tw_rsc_AWQOS),
      .AWREGION(tw_rsc_AWREGION),
      .AWUSER(tw_rsc_AWUSER),
      .AWVALID(tw_rsc_AWVALID),
      .AWREADY(tw_rsc_AWREADY),
      .WDATA(tw_rsc_WDATA),
      .WSTRB(tw_rsc_WSTRB),
      .WLAST(tw_rsc_WLAST),
      .WUSER(tw_rsc_WUSER),
      .WVALID(tw_rsc_WVALID),
      .WREADY(tw_rsc_WREADY),
      .BID(tw_rsc_BID),
      .BRESP(tw_rsc_BRESP),
      .BUSER(tw_rsc_BUSER),
      .BVALID(tw_rsc_BVALID),
      .BREADY(tw_rsc_BREADY),
      .ARID(tw_rsc_ARID),
      .ARADDR(tw_rsc_ARADDR),
      .ARLEN(tw_rsc_ARLEN),
      .ARSIZE(tw_rsc_ARSIZE),
      .ARBURST(tw_rsc_ARBURST),
      .ARLOCK(tw_rsc_ARLOCK),
      .ARCACHE(tw_rsc_ARCACHE),
      .ARPROT(tw_rsc_ARPROT),
      .ARQOS(tw_rsc_ARQOS),
      .ARREGION(tw_rsc_ARREGION),
      .ARUSER(tw_rsc_ARUSER),
      .ARVALID(tw_rsc_ARVALID),
      .ARREADY(tw_rsc_ARREADY),
      .RID(tw_rsc_RID),
      .RDATA(tw_rsc_RDATA),
      .RRESP(tw_rsc_RRESP),
      .RLAST(tw_rsc_RLAST),
      .RUSER(tw_rsc_RUSER),
      .RVALID(tw_rsc_RVALID),
      .RREADY(tw_rsc_RREADY),
      .s_re(tw_rsci_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(tw_rsci_s_raddr),
      .s_waddr(10'b0000000000),
      .s_din(tw_rsci_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(tw_rsci_s_rrdy),
      .s_wrdy(tw_rsci_s_wrdy),
      .is_idle(tw_rsc_is_idle),
      .tr_write_done(tw_rsc_tr_write_done),
      .s_tdone(tw_rsc_s_tdone)
    );
  hybrid_core_tw_rsci_tw_rsc_wait_ctrl hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .tw_rsci_oswt(tw_rsci_oswt),
      .tw_rsci_biwt(tw_rsci_biwt),
      .tw_rsci_bdwt(tw_rsci_bdwt),
      .tw_rsci_bcwt(tw_rsci_bcwt),
      .tw_rsci_s_re_core_sct(tw_rsci_s_re_core_sct),
      .tw_rsci_s_rrdy(tw_rsci_s_rrdy)
    );
  hybrid_core_tw_rsci_tw_rsc_wait_dp hybrid_core_tw_rsci_tw_rsc_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .tw_rsci_oswt(tw_rsci_oswt),
      .tw_rsci_wen_comp(tw_rsci_wen_comp),
      .tw_rsci_s_raddr_core(tw_rsci_s_raddr_core),
      .tw_rsci_s_din_mxwt(tw_rsci_s_din_mxwt_pconst),
      .tw_rsci_biwt(tw_rsci_biwt),
      .tw_rsci_bdwt(tw_rsci_bdwt),
      .tw_rsci_bcwt(tw_rsci_bcwt),
      .tw_rsci_s_raddr(tw_rsci_s_raddr),
      .tw_rsci_s_raddr_core_sct(tw_rsci_s_re_core_sct),
      .tw_rsci_s_din(tw_rsci_s_din)
    );
  assign tw_rsci_s_din_mxwt = tw_rsci_s_din_mxwt_pconst;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_revArr_rsci
// ------------------------------------------------------------------


module hybrid_core_revArr_rsci (
  clk, rst, revArr_rsc_s_tdone, revArr_rsc_tr_write_done, revArr_rsc_RREADY, revArr_rsc_RVALID,
      revArr_rsc_RUSER, revArr_rsc_RLAST, revArr_rsc_RRESP, revArr_rsc_RDATA, revArr_rsc_RID,
      revArr_rsc_ARREADY, revArr_rsc_ARVALID, revArr_rsc_ARUSER, revArr_rsc_ARREGION,
      revArr_rsc_ARQOS, revArr_rsc_ARPROT, revArr_rsc_ARCACHE, revArr_rsc_ARLOCK,
      revArr_rsc_ARBURST, revArr_rsc_ARSIZE, revArr_rsc_ARLEN, revArr_rsc_ARADDR,
      revArr_rsc_ARID, revArr_rsc_BREADY, revArr_rsc_BVALID, revArr_rsc_BUSER, revArr_rsc_BRESP,
      revArr_rsc_BID, revArr_rsc_WREADY, revArr_rsc_WVALID, revArr_rsc_WUSER, revArr_rsc_WLAST,
      revArr_rsc_WSTRB, revArr_rsc_WDATA, revArr_rsc_AWREADY, revArr_rsc_AWVALID,
      revArr_rsc_AWUSER, revArr_rsc_AWREGION, revArr_rsc_AWQOS, revArr_rsc_AWPROT,
      revArr_rsc_AWCACHE, revArr_rsc_AWLOCK, revArr_rsc_AWBURST, revArr_rsc_AWSIZE,
      revArr_rsc_AWLEN, revArr_rsc_AWADDR, revArr_rsc_AWID, core_wen, revArr_rsci_oswt,
      revArr_rsci_wen_comp, revArr_rsci_s_raddr_core, revArr_rsci_s_din_mxwt
);
  input clk;
  input rst;
  input revArr_rsc_s_tdone;
  input revArr_rsc_tr_write_done;
  input revArr_rsc_RREADY;
  output revArr_rsc_RVALID;
  output revArr_rsc_RUSER;
  output revArr_rsc_RLAST;
  output [1:0] revArr_rsc_RRESP;
  output [31:0] revArr_rsc_RDATA;
  output revArr_rsc_RID;
  output revArr_rsc_ARREADY;
  input revArr_rsc_ARVALID;
  input revArr_rsc_ARUSER;
  input [3:0] revArr_rsc_ARREGION;
  input [3:0] revArr_rsc_ARQOS;
  input [2:0] revArr_rsc_ARPROT;
  input [3:0] revArr_rsc_ARCACHE;
  input revArr_rsc_ARLOCK;
  input [1:0] revArr_rsc_ARBURST;
  input [2:0] revArr_rsc_ARSIZE;
  input [7:0] revArr_rsc_ARLEN;
  input [11:0] revArr_rsc_ARADDR;
  input revArr_rsc_ARID;
  input revArr_rsc_BREADY;
  output revArr_rsc_BVALID;
  output revArr_rsc_BUSER;
  output [1:0] revArr_rsc_BRESP;
  output revArr_rsc_BID;
  output revArr_rsc_WREADY;
  input revArr_rsc_WVALID;
  input revArr_rsc_WUSER;
  input revArr_rsc_WLAST;
  input [3:0] revArr_rsc_WSTRB;
  input [31:0] revArr_rsc_WDATA;
  output revArr_rsc_AWREADY;
  input revArr_rsc_AWVALID;
  input revArr_rsc_AWUSER;
  input [3:0] revArr_rsc_AWREGION;
  input [3:0] revArr_rsc_AWQOS;
  input [2:0] revArr_rsc_AWPROT;
  input [3:0] revArr_rsc_AWCACHE;
  input revArr_rsc_AWLOCK;
  input [1:0] revArr_rsc_AWBURST;
  input [2:0] revArr_rsc_AWSIZE;
  input [7:0] revArr_rsc_AWLEN;
  input [11:0] revArr_rsc_AWADDR;
  input revArr_rsc_AWID;
  input core_wen;
  input revArr_rsci_oswt;
  output revArr_rsci_wen_comp;
  input [4:0] revArr_rsci_s_raddr_core;
  output [9:0] revArr_rsci_s_din_mxwt;


  // Interconnect Declarations
  wire revArr_rsci_biwt;
  wire revArr_rsci_bdwt;
  wire revArr_rsci_bcwt;
  wire revArr_rsci_s_re_core_sct;
  wire [4:0] revArr_rsci_s_raddr;
  wire [31:0] revArr_rsci_s_din;
  wire revArr_rsci_s_rrdy;
  wire revArr_rsci_s_wrdy;
  wire revArr_rsc_is_idle;
  wire [9:0] revArr_rsci_s_din_mxwt_pconst;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd32),
  .op_width(32'sd20),
  .cwidth(32'sd32),
  .addr_w(32'sd5),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) revArr_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(revArr_rsc_AWID),
      .AWADDR(revArr_rsc_AWADDR),
      .AWLEN(revArr_rsc_AWLEN),
      .AWSIZE(revArr_rsc_AWSIZE),
      .AWBURST(revArr_rsc_AWBURST),
      .AWLOCK(revArr_rsc_AWLOCK),
      .AWCACHE(revArr_rsc_AWCACHE),
      .AWPROT(revArr_rsc_AWPROT),
      .AWQOS(revArr_rsc_AWQOS),
      .AWREGION(revArr_rsc_AWREGION),
      .AWUSER(revArr_rsc_AWUSER),
      .AWVALID(revArr_rsc_AWVALID),
      .AWREADY(revArr_rsc_AWREADY),
      .WDATA(revArr_rsc_WDATA),
      .WSTRB(revArr_rsc_WSTRB),
      .WLAST(revArr_rsc_WLAST),
      .WUSER(revArr_rsc_WUSER),
      .WVALID(revArr_rsc_WVALID),
      .WREADY(revArr_rsc_WREADY),
      .BID(revArr_rsc_BID),
      .BRESP(revArr_rsc_BRESP),
      .BUSER(revArr_rsc_BUSER),
      .BVALID(revArr_rsc_BVALID),
      .BREADY(revArr_rsc_BREADY),
      .ARID(revArr_rsc_ARID),
      .ARADDR(revArr_rsc_ARADDR),
      .ARLEN(revArr_rsc_ARLEN),
      .ARSIZE(revArr_rsc_ARSIZE),
      .ARBURST(revArr_rsc_ARBURST),
      .ARLOCK(revArr_rsc_ARLOCK),
      .ARCACHE(revArr_rsc_ARCACHE),
      .ARPROT(revArr_rsc_ARPROT),
      .ARQOS(revArr_rsc_ARQOS),
      .ARREGION(revArr_rsc_ARREGION),
      .ARUSER(revArr_rsc_ARUSER),
      .ARVALID(revArr_rsc_ARVALID),
      .ARREADY(revArr_rsc_ARREADY),
      .RID(revArr_rsc_RID),
      .RDATA(revArr_rsc_RDATA),
      .RRESP(revArr_rsc_RRESP),
      .RLAST(revArr_rsc_RLAST),
      .RUSER(revArr_rsc_RUSER),
      .RVALID(revArr_rsc_RVALID),
      .RREADY(revArr_rsc_RREADY),
      .s_re(revArr_rsci_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(revArr_rsci_s_raddr),
      .s_waddr(5'b00000),
      .s_din(revArr_rsci_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(revArr_rsci_s_rrdy),
      .s_wrdy(revArr_rsci_s_wrdy),
      .is_idle(revArr_rsc_is_idle),
      .tr_write_done(revArr_rsc_tr_write_done),
      .s_tdone(revArr_rsc_s_tdone)
    );
  hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .revArr_rsci_oswt(revArr_rsci_oswt),
      .revArr_rsci_biwt(revArr_rsci_biwt),
      .revArr_rsci_bdwt(revArr_rsci_bdwt),
      .revArr_rsci_bcwt(revArr_rsci_bcwt),
      .revArr_rsci_s_re_core_sct(revArr_rsci_s_re_core_sct),
      .revArr_rsci_s_rrdy(revArr_rsci_s_rrdy)
    );
  hybrid_core_revArr_rsci_revArr_rsc_wait_dp hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .revArr_rsci_oswt(revArr_rsci_oswt),
      .revArr_rsci_wen_comp(revArr_rsci_wen_comp),
      .revArr_rsci_s_raddr_core(revArr_rsci_s_raddr_core),
      .revArr_rsci_s_din_mxwt(revArr_rsci_s_din_mxwt_pconst),
      .revArr_rsci_biwt(revArr_rsci_biwt),
      .revArr_rsci_bdwt(revArr_rsci_bdwt),
      .revArr_rsci_bcwt(revArr_rsci_bcwt),
      .revArr_rsci_s_raddr(revArr_rsci_s_raddr),
      .revArr_rsci_s_raddr_core_sct(revArr_rsci_s_re_core_sct),
      .revArr_rsci_s_din(revArr_rsci_s_din)
    );
  assign revArr_rsci_s_din_mxwt = revArr_rsci_s_din_mxwt_pconst;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_twiddle_h_rsci
// ------------------------------------------------------------------


module hybrid_core_twiddle_h_rsci (
  clk, rst, twiddle_h_rsc_s_tdone, twiddle_h_rsc_tr_write_done, twiddle_h_rsc_RREADY,
      twiddle_h_rsc_RVALID, twiddle_h_rsc_RUSER, twiddle_h_rsc_RLAST, twiddle_h_rsc_RRESP,
      twiddle_h_rsc_RDATA, twiddle_h_rsc_RID, twiddle_h_rsc_ARREADY, twiddle_h_rsc_ARVALID,
      twiddle_h_rsc_ARUSER, twiddle_h_rsc_ARREGION, twiddle_h_rsc_ARQOS, twiddle_h_rsc_ARPROT,
      twiddle_h_rsc_ARCACHE, twiddle_h_rsc_ARLOCK, twiddle_h_rsc_ARBURST, twiddle_h_rsc_ARSIZE,
      twiddle_h_rsc_ARLEN, twiddle_h_rsc_ARADDR, twiddle_h_rsc_ARID, twiddle_h_rsc_BREADY,
      twiddle_h_rsc_BVALID, twiddle_h_rsc_BUSER, twiddle_h_rsc_BRESP, twiddle_h_rsc_BID,
      twiddle_h_rsc_WREADY, twiddle_h_rsc_WVALID, twiddle_h_rsc_WUSER, twiddle_h_rsc_WLAST,
      twiddle_h_rsc_WSTRB, twiddle_h_rsc_WDATA, twiddle_h_rsc_AWREADY, twiddle_h_rsc_AWVALID,
      twiddle_h_rsc_AWUSER, twiddle_h_rsc_AWREGION, twiddle_h_rsc_AWQOS, twiddle_h_rsc_AWPROT,
      twiddle_h_rsc_AWCACHE, twiddle_h_rsc_AWLOCK, twiddle_h_rsc_AWBURST, twiddle_h_rsc_AWSIZE,
      twiddle_h_rsc_AWLEN, twiddle_h_rsc_AWADDR, twiddle_h_rsc_AWID, core_wen, twiddle_h_rsci_oswt,
      twiddle_h_rsci_wen_comp, twiddle_h_rsci_s_raddr_core, twiddle_h_rsci_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_h_rsc_s_tdone;
  input twiddle_h_rsc_tr_write_done;
  input twiddle_h_rsc_RREADY;
  output twiddle_h_rsc_RVALID;
  output twiddle_h_rsc_RUSER;
  output twiddle_h_rsc_RLAST;
  output [1:0] twiddle_h_rsc_RRESP;
  output [31:0] twiddle_h_rsc_RDATA;
  output twiddle_h_rsc_RID;
  output twiddle_h_rsc_ARREADY;
  input twiddle_h_rsc_ARVALID;
  input twiddle_h_rsc_ARUSER;
  input [3:0] twiddle_h_rsc_ARREGION;
  input [3:0] twiddle_h_rsc_ARQOS;
  input [2:0] twiddle_h_rsc_ARPROT;
  input [3:0] twiddle_h_rsc_ARCACHE;
  input twiddle_h_rsc_ARLOCK;
  input [1:0] twiddle_h_rsc_ARBURST;
  input [2:0] twiddle_h_rsc_ARSIZE;
  input [7:0] twiddle_h_rsc_ARLEN;
  input [11:0] twiddle_h_rsc_ARADDR;
  input twiddle_h_rsc_ARID;
  input twiddle_h_rsc_BREADY;
  output twiddle_h_rsc_BVALID;
  output twiddle_h_rsc_BUSER;
  output [1:0] twiddle_h_rsc_BRESP;
  output twiddle_h_rsc_BID;
  output twiddle_h_rsc_WREADY;
  input twiddle_h_rsc_WVALID;
  input twiddle_h_rsc_WUSER;
  input twiddle_h_rsc_WLAST;
  input [3:0] twiddle_h_rsc_WSTRB;
  input [31:0] twiddle_h_rsc_WDATA;
  output twiddle_h_rsc_AWREADY;
  input twiddle_h_rsc_AWVALID;
  input twiddle_h_rsc_AWUSER;
  input [3:0] twiddle_h_rsc_AWREGION;
  input [3:0] twiddle_h_rsc_AWQOS;
  input [2:0] twiddle_h_rsc_AWPROT;
  input [3:0] twiddle_h_rsc_AWCACHE;
  input twiddle_h_rsc_AWLOCK;
  input [1:0] twiddle_h_rsc_AWBURST;
  input [2:0] twiddle_h_rsc_AWSIZE;
  input [7:0] twiddle_h_rsc_AWLEN;
  input [11:0] twiddle_h_rsc_AWADDR;
  input twiddle_h_rsc_AWID;
  input core_wen;
  input twiddle_h_rsci_oswt;
  output twiddle_h_rsci_wen_comp;
  input [4:0] twiddle_h_rsci_s_raddr_core;
  output [31:0] twiddle_h_rsci_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_h_rsci_biwt;
  wire twiddle_h_rsci_bdwt;
  wire twiddle_h_rsci_bcwt;
  wire twiddle_h_rsci_s_re_core_sct;
  wire [4:0] twiddle_h_rsci_s_raddr;
  wire [31:0] twiddle_h_rsci_s_din;
  wire twiddle_h_rsci_s_rrdy;
  wire twiddle_h_rsci_s_wrdy;
  wire twiddle_h_rsc_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [4:0] nl_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core;
  assign nl_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core
      = {1'b0 , (twiddle_h_rsci_s_raddr_core[3:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd32),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd5),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_h_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_h_rsc_AWID),
      .AWADDR(twiddle_h_rsc_AWADDR),
      .AWLEN(twiddle_h_rsc_AWLEN),
      .AWSIZE(twiddle_h_rsc_AWSIZE),
      .AWBURST(twiddle_h_rsc_AWBURST),
      .AWLOCK(twiddle_h_rsc_AWLOCK),
      .AWCACHE(twiddle_h_rsc_AWCACHE),
      .AWPROT(twiddle_h_rsc_AWPROT),
      .AWQOS(twiddle_h_rsc_AWQOS),
      .AWREGION(twiddle_h_rsc_AWREGION),
      .AWUSER(twiddle_h_rsc_AWUSER),
      .AWVALID(twiddle_h_rsc_AWVALID),
      .AWREADY(twiddle_h_rsc_AWREADY),
      .WDATA(twiddle_h_rsc_WDATA),
      .WSTRB(twiddle_h_rsc_WSTRB),
      .WLAST(twiddle_h_rsc_WLAST),
      .WUSER(twiddle_h_rsc_WUSER),
      .WVALID(twiddle_h_rsc_WVALID),
      .WREADY(twiddle_h_rsc_WREADY),
      .BID(twiddle_h_rsc_BID),
      .BRESP(twiddle_h_rsc_BRESP),
      .BUSER(twiddle_h_rsc_BUSER),
      .BVALID(twiddle_h_rsc_BVALID),
      .BREADY(twiddle_h_rsc_BREADY),
      .ARID(twiddle_h_rsc_ARID),
      .ARADDR(twiddle_h_rsc_ARADDR),
      .ARLEN(twiddle_h_rsc_ARLEN),
      .ARSIZE(twiddle_h_rsc_ARSIZE),
      .ARBURST(twiddle_h_rsc_ARBURST),
      .ARLOCK(twiddle_h_rsc_ARLOCK),
      .ARCACHE(twiddle_h_rsc_ARCACHE),
      .ARPROT(twiddle_h_rsc_ARPROT),
      .ARQOS(twiddle_h_rsc_ARQOS),
      .ARREGION(twiddle_h_rsc_ARREGION),
      .ARUSER(twiddle_h_rsc_ARUSER),
      .ARVALID(twiddle_h_rsc_ARVALID),
      .ARREADY(twiddle_h_rsc_ARREADY),
      .RID(twiddle_h_rsc_RID),
      .RDATA(twiddle_h_rsc_RDATA),
      .RRESP(twiddle_h_rsc_RRESP),
      .RLAST(twiddle_h_rsc_RLAST),
      .RUSER(twiddle_h_rsc_RUSER),
      .RVALID(twiddle_h_rsc_RVALID),
      .RREADY(twiddle_h_rsc_RREADY),
      .s_re(twiddle_h_rsci_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_h_rsci_s_raddr),
      .s_waddr(5'b00000),
      .s_din(twiddle_h_rsci_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_h_rsci_s_rrdy),
      .s_wrdy(twiddle_h_rsci_s_wrdy),
      .is_idle(twiddle_h_rsc_is_idle),
      .tr_write_done(twiddle_h_rsc_tr_write_done),
      .s_tdone(twiddle_h_rsc_s_tdone)
    );
  hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_bcwt(twiddle_h_rsci_bcwt),
      .twiddle_h_rsci_s_re_core_sct(twiddle_h_rsci_s_re_core_sct),
      .twiddle_h_rsci_s_rrdy(twiddle_h_rsci_s_rrdy)
    );
  hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_wen_comp(twiddle_h_rsci_wen_comp),
      .twiddle_h_rsci_s_raddr_core(nl_hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core[4:0]),
      .twiddle_h_rsci_s_din_mxwt(twiddle_h_rsci_s_din_mxwt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_bcwt(twiddle_h_rsci_bcwt),
      .twiddle_h_rsci_s_raddr(twiddle_h_rsci_s_raddr),
      .twiddle_h_rsci_s_raddr_core_sct(twiddle_h_rsci_s_re_core_sct),
      .twiddle_h_rsci_s_din(twiddle_h_rsci_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_twiddle_rsci
// ------------------------------------------------------------------


module hybrid_core_twiddle_rsci (
  clk, rst, twiddle_rsc_s_tdone, twiddle_rsc_tr_write_done, twiddle_rsc_RREADY, twiddle_rsc_RVALID,
      twiddle_rsc_RUSER, twiddle_rsc_RLAST, twiddle_rsc_RRESP, twiddle_rsc_RDATA,
      twiddle_rsc_RID, twiddle_rsc_ARREADY, twiddle_rsc_ARVALID, twiddle_rsc_ARUSER,
      twiddle_rsc_ARREGION, twiddle_rsc_ARQOS, twiddle_rsc_ARPROT, twiddle_rsc_ARCACHE,
      twiddle_rsc_ARLOCK, twiddle_rsc_ARBURST, twiddle_rsc_ARSIZE, twiddle_rsc_ARLEN,
      twiddle_rsc_ARADDR, twiddle_rsc_ARID, twiddle_rsc_BREADY, twiddle_rsc_BVALID,
      twiddle_rsc_BUSER, twiddle_rsc_BRESP, twiddle_rsc_BID, twiddle_rsc_WREADY,
      twiddle_rsc_WVALID, twiddle_rsc_WUSER, twiddle_rsc_WLAST, twiddle_rsc_WSTRB,
      twiddle_rsc_WDATA, twiddle_rsc_AWREADY, twiddle_rsc_AWVALID, twiddle_rsc_AWUSER,
      twiddle_rsc_AWREGION, twiddle_rsc_AWQOS, twiddle_rsc_AWPROT, twiddle_rsc_AWCACHE,
      twiddle_rsc_AWLOCK, twiddle_rsc_AWBURST, twiddle_rsc_AWSIZE, twiddle_rsc_AWLEN,
      twiddle_rsc_AWADDR, twiddle_rsc_AWID, core_wen, twiddle_rsci_oswt, twiddle_rsci_wen_comp,
      twiddle_rsci_s_raddr_core, twiddle_rsci_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_rsc_s_tdone;
  input twiddle_rsc_tr_write_done;
  input twiddle_rsc_RREADY;
  output twiddle_rsc_RVALID;
  output twiddle_rsc_RUSER;
  output twiddle_rsc_RLAST;
  output [1:0] twiddle_rsc_RRESP;
  output [31:0] twiddle_rsc_RDATA;
  output twiddle_rsc_RID;
  output twiddle_rsc_ARREADY;
  input twiddle_rsc_ARVALID;
  input twiddle_rsc_ARUSER;
  input [3:0] twiddle_rsc_ARREGION;
  input [3:0] twiddle_rsc_ARQOS;
  input [2:0] twiddle_rsc_ARPROT;
  input [3:0] twiddle_rsc_ARCACHE;
  input twiddle_rsc_ARLOCK;
  input [1:0] twiddle_rsc_ARBURST;
  input [2:0] twiddle_rsc_ARSIZE;
  input [7:0] twiddle_rsc_ARLEN;
  input [11:0] twiddle_rsc_ARADDR;
  input twiddle_rsc_ARID;
  input twiddle_rsc_BREADY;
  output twiddle_rsc_BVALID;
  output twiddle_rsc_BUSER;
  output [1:0] twiddle_rsc_BRESP;
  output twiddle_rsc_BID;
  output twiddle_rsc_WREADY;
  input twiddle_rsc_WVALID;
  input twiddle_rsc_WUSER;
  input twiddle_rsc_WLAST;
  input [3:0] twiddle_rsc_WSTRB;
  input [31:0] twiddle_rsc_WDATA;
  output twiddle_rsc_AWREADY;
  input twiddle_rsc_AWVALID;
  input twiddle_rsc_AWUSER;
  input [3:0] twiddle_rsc_AWREGION;
  input [3:0] twiddle_rsc_AWQOS;
  input [2:0] twiddle_rsc_AWPROT;
  input [3:0] twiddle_rsc_AWCACHE;
  input twiddle_rsc_AWLOCK;
  input [1:0] twiddle_rsc_AWBURST;
  input [2:0] twiddle_rsc_AWSIZE;
  input [7:0] twiddle_rsc_AWLEN;
  input [11:0] twiddle_rsc_AWADDR;
  input twiddle_rsc_AWID;
  input core_wen;
  input twiddle_rsci_oswt;
  output twiddle_rsci_wen_comp;
  input [4:0] twiddle_rsci_s_raddr_core;
  output [31:0] twiddle_rsci_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire twiddle_rsci_bcwt;
  wire twiddle_rsci_s_re_core_sct;
  wire [4:0] twiddle_rsci_s_raddr;
  wire [31:0] twiddle_rsci_s_din;
  wire twiddle_rsci_s_rrdy;
  wire twiddle_rsci_s_wrdy;
  wire twiddle_rsc_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [4:0] nl_hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core;
  assign nl_hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core
      = {1'b0 , (twiddle_rsci_s_raddr_core[3:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd32),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd5),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_rsc_AWID),
      .AWADDR(twiddle_rsc_AWADDR),
      .AWLEN(twiddle_rsc_AWLEN),
      .AWSIZE(twiddle_rsc_AWSIZE),
      .AWBURST(twiddle_rsc_AWBURST),
      .AWLOCK(twiddle_rsc_AWLOCK),
      .AWCACHE(twiddle_rsc_AWCACHE),
      .AWPROT(twiddle_rsc_AWPROT),
      .AWQOS(twiddle_rsc_AWQOS),
      .AWREGION(twiddle_rsc_AWREGION),
      .AWUSER(twiddle_rsc_AWUSER),
      .AWVALID(twiddle_rsc_AWVALID),
      .AWREADY(twiddle_rsc_AWREADY),
      .WDATA(twiddle_rsc_WDATA),
      .WSTRB(twiddle_rsc_WSTRB),
      .WLAST(twiddle_rsc_WLAST),
      .WUSER(twiddle_rsc_WUSER),
      .WVALID(twiddle_rsc_WVALID),
      .WREADY(twiddle_rsc_WREADY),
      .BID(twiddle_rsc_BID),
      .BRESP(twiddle_rsc_BRESP),
      .BUSER(twiddle_rsc_BUSER),
      .BVALID(twiddle_rsc_BVALID),
      .BREADY(twiddle_rsc_BREADY),
      .ARID(twiddle_rsc_ARID),
      .ARADDR(twiddle_rsc_ARADDR),
      .ARLEN(twiddle_rsc_ARLEN),
      .ARSIZE(twiddle_rsc_ARSIZE),
      .ARBURST(twiddle_rsc_ARBURST),
      .ARLOCK(twiddle_rsc_ARLOCK),
      .ARCACHE(twiddle_rsc_ARCACHE),
      .ARPROT(twiddle_rsc_ARPROT),
      .ARQOS(twiddle_rsc_ARQOS),
      .ARREGION(twiddle_rsc_ARREGION),
      .ARUSER(twiddle_rsc_ARUSER),
      .ARVALID(twiddle_rsc_ARVALID),
      .ARREADY(twiddle_rsc_ARREADY),
      .RID(twiddle_rsc_RID),
      .RDATA(twiddle_rsc_RDATA),
      .RRESP(twiddle_rsc_RRESP),
      .RLAST(twiddle_rsc_RLAST),
      .RUSER(twiddle_rsc_RUSER),
      .RVALID(twiddle_rsc_RVALID),
      .RREADY(twiddle_rsc_RREADY),
      .s_re(twiddle_rsci_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_rsci_s_raddr),
      .s_waddr(5'b00000),
      .s_din(twiddle_rsci_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_rsci_s_rrdy),
      .s_wrdy(twiddle_rsci_s_wrdy),
      .is_idle(twiddle_rsc_is_idle),
      .tr_write_done(twiddle_rsc_tr_write_done),
      .s_tdone(twiddle_rsc_s_tdone)
    );
  hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_bcwt(twiddle_rsci_bcwt),
      .twiddle_rsci_s_re_core_sct(twiddle_rsci_s_re_core_sct),
      .twiddle_rsci_s_rrdy(twiddle_rsci_s_rrdy)
    );
  hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_wen_comp(twiddle_rsci_wen_comp),
      .twiddle_rsci_s_raddr_core(nl_hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core[4:0]),
      .twiddle_rsci_s_din_mxwt(twiddle_rsci_s_din_mxwt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_bcwt(twiddle_rsci_bcwt),
      .twiddle_rsci_s_raddr(twiddle_rsci_s_raddr),
      .twiddle_rsci_s_raddr_core_sct(twiddle_rsci_s_re_core_sct),
      .twiddle_rsci_s_din(twiddle_rsci_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core_x_rsci
// ------------------------------------------------------------------


module hybrid_core_x_rsci (
  clk, rst, x_rsc_s_tdone, x_rsc_tr_write_done, x_rsc_RREADY, x_rsc_RVALID, x_rsc_RUSER,
      x_rsc_RLAST, x_rsc_RRESP, x_rsc_RDATA, x_rsc_RID, x_rsc_ARREADY, x_rsc_ARVALID,
      x_rsc_ARUSER, x_rsc_ARREGION, x_rsc_ARQOS, x_rsc_ARPROT, x_rsc_ARCACHE, x_rsc_ARLOCK,
      x_rsc_ARBURST, x_rsc_ARSIZE, x_rsc_ARLEN, x_rsc_ARADDR, x_rsc_ARID, x_rsc_BREADY,
      x_rsc_BVALID, x_rsc_BUSER, x_rsc_BRESP, x_rsc_BID, x_rsc_WREADY, x_rsc_WVALID,
      x_rsc_WUSER, x_rsc_WLAST, x_rsc_WSTRB, x_rsc_WDATA, x_rsc_AWREADY, x_rsc_AWVALID,
      x_rsc_AWUSER, x_rsc_AWREGION, x_rsc_AWQOS, x_rsc_AWPROT, x_rsc_AWCACHE, x_rsc_AWLOCK,
      x_rsc_AWBURST, x_rsc_AWSIZE, x_rsc_AWLEN, x_rsc_AWADDR, x_rsc_AWID, core_wen,
      x_rsci_oswt, x_rsci_wen_comp, x_rsci_oswt_1, x_rsci_wen_comp_1, x_rsci_s_raddr_core,
      x_rsci_s_waddr_core, x_rsci_s_din_mxwt, x_rsci_s_dout_core
);
  input clk;
  input rst;
  input x_rsc_s_tdone;
  input x_rsc_tr_write_done;
  input x_rsc_RREADY;
  output x_rsc_RVALID;
  output x_rsc_RUSER;
  output x_rsc_RLAST;
  output [1:0] x_rsc_RRESP;
  output [31:0] x_rsc_RDATA;
  output x_rsc_RID;
  output x_rsc_ARREADY;
  input x_rsc_ARVALID;
  input x_rsc_ARUSER;
  input [3:0] x_rsc_ARREGION;
  input [3:0] x_rsc_ARQOS;
  input [2:0] x_rsc_ARPROT;
  input [3:0] x_rsc_ARCACHE;
  input x_rsc_ARLOCK;
  input [1:0] x_rsc_ARBURST;
  input [2:0] x_rsc_ARSIZE;
  input [7:0] x_rsc_ARLEN;
  input [11:0] x_rsc_ARADDR;
  input x_rsc_ARID;
  input x_rsc_BREADY;
  output x_rsc_BVALID;
  output x_rsc_BUSER;
  output [1:0] x_rsc_BRESP;
  output x_rsc_BID;
  output x_rsc_WREADY;
  input x_rsc_WVALID;
  input x_rsc_WUSER;
  input x_rsc_WLAST;
  input [3:0] x_rsc_WSTRB;
  input [31:0] x_rsc_WDATA;
  output x_rsc_AWREADY;
  input x_rsc_AWVALID;
  input x_rsc_AWUSER;
  input [3:0] x_rsc_AWREGION;
  input [3:0] x_rsc_AWQOS;
  input [2:0] x_rsc_AWPROT;
  input [3:0] x_rsc_AWCACHE;
  input x_rsc_AWLOCK;
  input [1:0] x_rsc_AWBURST;
  input [2:0] x_rsc_AWSIZE;
  input [7:0] x_rsc_AWLEN;
  input [11:0] x_rsc_AWADDR;
  input x_rsc_AWID;
  input core_wen;
  input x_rsci_oswt;
  output x_rsci_wen_comp;
  input x_rsci_oswt_1;
  output x_rsci_wen_comp_1;
  input [9:0] x_rsci_s_raddr_core;
  input [9:0] x_rsci_s_waddr_core;
  output [31:0] x_rsci_s_din_mxwt;
  input [31:0] x_rsci_s_dout_core;


  // Interconnect Declarations
  wire x_rsci_biwt;
  wire x_rsci_bdwt;
  wire x_rsci_bcwt;
  wire x_rsci_s_re_core_sct;
  wire x_rsci_biwt_1;
  wire x_rsci_bdwt_2;
  wire x_rsci_bcwt_1;
  wire x_rsci_s_we_core_sct;
  wire [9:0] x_rsci_s_raddr;
  wire [9:0] x_rsci_s_waddr;
  wire [31:0] x_rsci_s_din;
  wire [31:0] x_rsci_s_dout;
  wire x_rsci_s_rrdy;
  wire x_rsci_s_wrdy;
  wire x_rsc_is_idle_1;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd1024),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd10),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) x_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(x_rsc_AWID),
      .AWADDR(x_rsc_AWADDR),
      .AWLEN(x_rsc_AWLEN),
      .AWSIZE(x_rsc_AWSIZE),
      .AWBURST(x_rsc_AWBURST),
      .AWLOCK(x_rsc_AWLOCK),
      .AWCACHE(x_rsc_AWCACHE),
      .AWPROT(x_rsc_AWPROT),
      .AWQOS(x_rsc_AWQOS),
      .AWREGION(x_rsc_AWREGION),
      .AWUSER(x_rsc_AWUSER),
      .AWVALID(x_rsc_AWVALID),
      .AWREADY(x_rsc_AWREADY),
      .WDATA(x_rsc_WDATA),
      .WSTRB(x_rsc_WSTRB),
      .WLAST(x_rsc_WLAST),
      .WUSER(x_rsc_WUSER),
      .WVALID(x_rsc_WVALID),
      .WREADY(x_rsc_WREADY),
      .BID(x_rsc_BID),
      .BRESP(x_rsc_BRESP),
      .BUSER(x_rsc_BUSER),
      .BVALID(x_rsc_BVALID),
      .BREADY(x_rsc_BREADY),
      .ARID(x_rsc_ARID),
      .ARADDR(x_rsc_ARADDR),
      .ARLEN(x_rsc_ARLEN),
      .ARSIZE(x_rsc_ARSIZE),
      .ARBURST(x_rsc_ARBURST),
      .ARLOCK(x_rsc_ARLOCK),
      .ARCACHE(x_rsc_ARCACHE),
      .ARPROT(x_rsc_ARPROT),
      .ARQOS(x_rsc_ARQOS),
      .ARREGION(x_rsc_ARREGION),
      .ARUSER(x_rsc_ARUSER),
      .ARVALID(x_rsc_ARVALID),
      .ARREADY(x_rsc_ARREADY),
      .RID(x_rsc_RID),
      .RDATA(x_rsc_RDATA),
      .RRESP(x_rsc_RRESP),
      .RLAST(x_rsc_RLAST),
      .RUSER(x_rsc_RUSER),
      .RVALID(x_rsc_RVALID),
      .RREADY(x_rsc_RREADY),
      .s_re(x_rsci_s_re_core_sct),
      .s_we(x_rsci_s_we_core_sct),
      .s_raddr(x_rsci_s_raddr),
      .s_waddr(x_rsci_s_waddr),
      .s_din(x_rsci_s_din),
      .s_dout(x_rsci_s_dout),
      .s_rrdy(x_rsci_s_rrdy),
      .s_wrdy(x_rsci_s_wrdy),
      .is_idle(x_rsc_is_idle_1),
      .tr_write_done(x_rsc_tr_write_done),
      .s_tdone(x_rsc_s_tdone)
    );
  hybrid_core_x_rsci_x_rsc_wait_ctrl hybrid_core_x_rsci_x_rsc_wait_ctrl_inst (
      .core_wen(core_wen),
      .x_rsci_oswt(x_rsci_oswt),
      .x_rsci_oswt_1(x_rsci_oswt_1),
      .x_rsci_biwt(x_rsci_biwt),
      .x_rsci_bdwt(x_rsci_bdwt),
      .x_rsci_bcwt(x_rsci_bcwt),
      .x_rsci_s_re_core_sct(x_rsci_s_re_core_sct),
      .x_rsci_biwt_1(x_rsci_biwt_1),
      .x_rsci_bdwt_2(x_rsci_bdwt_2),
      .x_rsci_bcwt_1(x_rsci_bcwt_1),
      .x_rsci_s_we_core_sct(x_rsci_s_we_core_sct),
      .x_rsci_s_rrdy(x_rsci_s_rrdy),
      .x_rsci_s_wrdy(x_rsci_s_wrdy)
    );
  hybrid_core_x_rsci_x_rsc_wait_dp hybrid_core_x_rsci_x_rsc_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .x_rsci_oswt(x_rsci_oswt),
      .x_rsci_wen_comp(x_rsci_wen_comp),
      .x_rsci_oswt_1(x_rsci_oswt_1),
      .x_rsci_wen_comp_1(x_rsci_wen_comp_1),
      .x_rsci_s_raddr_core(x_rsci_s_raddr_core),
      .x_rsci_s_waddr_core(x_rsci_s_waddr_core),
      .x_rsci_s_din_mxwt(x_rsci_s_din_mxwt),
      .x_rsci_s_dout_core(x_rsci_s_dout_core),
      .x_rsci_biwt(x_rsci_biwt),
      .x_rsci_bdwt(x_rsci_bdwt),
      .x_rsci_bcwt(x_rsci_bcwt),
      .x_rsci_biwt_1(x_rsci_biwt_1),
      .x_rsci_bdwt_2(x_rsci_bdwt_2),
      .x_rsci_bcwt_1(x_rsci_bcwt_1),
      .x_rsci_s_raddr(x_rsci_s_raddr),
      .x_rsci_s_raddr_core_sct(x_rsci_s_re_core_sct),
      .x_rsci_s_waddr(x_rsci_s_waddr),
      .x_rsci_s_waddr_core_sct(x_rsci_s_we_core_sct),
      .x_rsci_s_din(x_rsci_s_din),
      .x_rsci_s_dout(x_rsci_s_dout)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid_core
// ------------------------------------------------------------------


module hybrid_core (
  clk, rst, x_rsc_s_tdone, x_rsc_tr_write_done, x_rsc_RREADY, x_rsc_RVALID, x_rsc_RUSER,
      x_rsc_RLAST, x_rsc_RRESP, x_rsc_RDATA, x_rsc_RID, x_rsc_ARREADY, x_rsc_ARVALID,
      x_rsc_ARUSER, x_rsc_ARREGION, x_rsc_ARQOS, x_rsc_ARPROT, x_rsc_ARCACHE, x_rsc_ARLOCK,
      x_rsc_ARBURST, x_rsc_ARSIZE, x_rsc_ARLEN, x_rsc_ARADDR, x_rsc_ARID, x_rsc_BREADY,
      x_rsc_BVALID, x_rsc_BUSER, x_rsc_BRESP, x_rsc_BID, x_rsc_WREADY, x_rsc_WVALID,
      x_rsc_WUSER, x_rsc_WLAST, x_rsc_WSTRB, x_rsc_WDATA, x_rsc_AWREADY, x_rsc_AWVALID,
      x_rsc_AWUSER, x_rsc_AWREGION, x_rsc_AWQOS, x_rsc_AWPROT, x_rsc_AWCACHE, x_rsc_AWLOCK,
      x_rsc_AWBURST, x_rsc_AWSIZE, x_rsc_AWLEN, x_rsc_AWADDR, x_rsc_AWID, x_rsc_triosy_lz,
      m_rsc_dat, m_rsc_triosy_lz, twiddle_rsc_s_tdone, twiddle_rsc_tr_write_done,
      twiddle_rsc_RREADY, twiddle_rsc_RVALID, twiddle_rsc_RUSER, twiddle_rsc_RLAST,
      twiddle_rsc_RRESP, twiddle_rsc_RDATA, twiddle_rsc_RID, twiddle_rsc_ARREADY,
      twiddle_rsc_ARVALID, twiddle_rsc_ARUSER, twiddle_rsc_ARREGION, twiddle_rsc_ARQOS,
      twiddle_rsc_ARPROT, twiddle_rsc_ARCACHE, twiddle_rsc_ARLOCK, twiddle_rsc_ARBURST,
      twiddle_rsc_ARSIZE, twiddle_rsc_ARLEN, twiddle_rsc_ARADDR, twiddle_rsc_ARID,
      twiddle_rsc_BREADY, twiddle_rsc_BVALID, twiddle_rsc_BUSER, twiddle_rsc_BRESP,
      twiddle_rsc_BID, twiddle_rsc_WREADY, twiddle_rsc_WVALID, twiddle_rsc_WUSER,
      twiddle_rsc_WLAST, twiddle_rsc_WSTRB, twiddle_rsc_WDATA, twiddle_rsc_AWREADY,
      twiddle_rsc_AWVALID, twiddle_rsc_AWUSER, twiddle_rsc_AWREGION, twiddle_rsc_AWQOS,
      twiddle_rsc_AWPROT, twiddle_rsc_AWCACHE, twiddle_rsc_AWLOCK, twiddle_rsc_AWBURST,
      twiddle_rsc_AWSIZE, twiddle_rsc_AWLEN, twiddle_rsc_AWADDR, twiddle_rsc_AWID,
      twiddle_rsc_triosy_lz, twiddle_h_rsc_s_tdone, twiddle_h_rsc_tr_write_done,
      twiddle_h_rsc_RREADY, twiddle_h_rsc_RVALID, twiddle_h_rsc_RUSER, twiddle_h_rsc_RLAST,
      twiddle_h_rsc_RRESP, twiddle_h_rsc_RDATA, twiddle_h_rsc_RID, twiddle_h_rsc_ARREADY,
      twiddle_h_rsc_ARVALID, twiddle_h_rsc_ARUSER, twiddle_h_rsc_ARREGION, twiddle_h_rsc_ARQOS,
      twiddle_h_rsc_ARPROT, twiddle_h_rsc_ARCACHE, twiddle_h_rsc_ARLOCK, twiddle_h_rsc_ARBURST,
      twiddle_h_rsc_ARSIZE, twiddle_h_rsc_ARLEN, twiddle_h_rsc_ARADDR, twiddle_h_rsc_ARID,
      twiddle_h_rsc_BREADY, twiddle_h_rsc_BVALID, twiddle_h_rsc_BUSER, twiddle_h_rsc_BRESP,
      twiddle_h_rsc_BID, twiddle_h_rsc_WREADY, twiddle_h_rsc_WVALID, twiddle_h_rsc_WUSER,
      twiddle_h_rsc_WLAST, twiddle_h_rsc_WSTRB, twiddle_h_rsc_WDATA, twiddle_h_rsc_AWREADY,
      twiddle_h_rsc_AWVALID, twiddle_h_rsc_AWUSER, twiddle_h_rsc_AWREGION, twiddle_h_rsc_AWQOS,
      twiddle_h_rsc_AWPROT, twiddle_h_rsc_AWCACHE, twiddle_h_rsc_AWLOCK, twiddle_h_rsc_AWBURST,
      twiddle_h_rsc_AWSIZE, twiddle_h_rsc_AWLEN, twiddle_h_rsc_AWADDR, twiddle_h_rsc_AWID,
      twiddle_h_rsc_triosy_lz, revArr_rsc_s_tdone, revArr_rsc_tr_write_done, revArr_rsc_RREADY,
      revArr_rsc_RVALID, revArr_rsc_RUSER, revArr_rsc_RLAST, revArr_rsc_RRESP, revArr_rsc_RDATA,
      revArr_rsc_RID, revArr_rsc_ARREADY, revArr_rsc_ARVALID, revArr_rsc_ARUSER,
      revArr_rsc_ARREGION, revArr_rsc_ARQOS, revArr_rsc_ARPROT, revArr_rsc_ARCACHE,
      revArr_rsc_ARLOCK, revArr_rsc_ARBURST, revArr_rsc_ARSIZE, revArr_rsc_ARLEN,
      revArr_rsc_ARADDR, revArr_rsc_ARID, revArr_rsc_BREADY, revArr_rsc_BVALID, revArr_rsc_BUSER,
      revArr_rsc_BRESP, revArr_rsc_BID, revArr_rsc_WREADY, revArr_rsc_WVALID, revArr_rsc_WUSER,
      revArr_rsc_WLAST, revArr_rsc_WSTRB, revArr_rsc_WDATA, revArr_rsc_AWREADY, revArr_rsc_AWVALID,
      revArr_rsc_AWUSER, revArr_rsc_AWREGION, revArr_rsc_AWQOS, revArr_rsc_AWPROT,
      revArr_rsc_AWCACHE, revArr_rsc_AWLOCK, revArr_rsc_AWBURST, revArr_rsc_AWSIZE,
      revArr_rsc_AWLEN, revArr_rsc_AWADDR, revArr_rsc_AWID, revArr_rsc_triosy_lz,
      tw_rsc_s_tdone, tw_rsc_tr_write_done, tw_rsc_RREADY, tw_rsc_RVALID, tw_rsc_RUSER,
      tw_rsc_RLAST, tw_rsc_RRESP, tw_rsc_RDATA, tw_rsc_RID, tw_rsc_ARREADY, tw_rsc_ARVALID,
      tw_rsc_ARUSER, tw_rsc_ARREGION, tw_rsc_ARQOS, tw_rsc_ARPROT, tw_rsc_ARCACHE,
      tw_rsc_ARLOCK, tw_rsc_ARBURST, tw_rsc_ARSIZE, tw_rsc_ARLEN, tw_rsc_ARADDR,
      tw_rsc_ARID, tw_rsc_BREADY, tw_rsc_BVALID, tw_rsc_BUSER, tw_rsc_BRESP, tw_rsc_BID,
      tw_rsc_WREADY, tw_rsc_WVALID, tw_rsc_WUSER, tw_rsc_WLAST, tw_rsc_WSTRB, tw_rsc_WDATA,
      tw_rsc_AWREADY, tw_rsc_AWVALID, tw_rsc_AWUSER, tw_rsc_AWREGION, tw_rsc_AWQOS,
      tw_rsc_AWPROT, tw_rsc_AWCACHE, tw_rsc_AWLOCK, tw_rsc_AWBURST, tw_rsc_AWSIZE,
      tw_rsc_AWLEN, tw_rsc_AWADDR, tw_rsc_AWID, tw_rsc_triosy_lz, tw_h_rsc_s_tdone,
      tw_h_rsc_tr_write_done, tw_h_rsc_RREADY, tw_h_rsc_RVALID, tw_h_rsc_RUSER, tw_h_rsc_RLAST,
      tw_h_rsc_RRESP, tw_h_rsc_RDATA, tw_h_rsc_RID, tw_h_rsc_ARREADY, tw_h_rsc_ARVALID,
      tw_h_rsc_ARUSER, tw_h_rsc_ARREGION, tw_h_rsc_ARQOS, tw_h_rsc_ARPROT, tw_h_rsc_ARCACHE,
      tw_h_rsc_ARLOCK, tw_h_rsc_ARBURST, tw_h_rsc_ARSIZE, tw_h_rsc_ARLEN, tw_h_rsc_ARADDR,
      tw_h_rsc_ARID, tw_h_rsc_BREADY, tw_h_rsc_BVALID, tw_h_rsc_BUSER, tw_h_rsc_BRESP,
      tw_h_rsc_BID, tw_h_rsc_WREADY, tw_h_rsc_WVALID, tw_h_rsc_WUSER, tw_h_rsc_WLAST,
      tw_h_rsc_WSTRB, tw_h_rsc_WDATA, tw_h_rsc_AWREADY, tw_h_rsc_AWVALID, tw_h_rsc_AWUSER,
      tw_h_rsc_AWREGION, tw_h_rsc_AWQOS, tw_h_rsc_AWPROT, tw_h_rsc_AWCACHE, tw_h_rsc_AWLOCK,
      tw_h_rsc_AWBURST, tw_h_rsc_AWSIZE, tw_h_rsc_AWLEN, tw_h_rsc_AWADDR, tw_h_rsc_AWID,
      tw_h_rsc_triosy_lz, xx_rsci_clken_d, xx_rsci_d_d, xx_rsci_q_d, xx_rsci_radr_d,
      xx_rsci_wadr_d, xx_rsci_readA_r_ram_ir_internal_RMASK_B_d, yy_rsci_clken_d,
      yy_rsci_d_d, yy_rsci_q_d, yy_rsci_radr_d, yy_rsci_wadr_d, yy_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      S34_OUTER_LOOP_for_tf_mul_cmp_a, S34_OUTER_LOOP_for_tf_mul_cmp_b, S34_OUTER_LOOP_for_tf_mul_cmp_z,
      xx_rsci_we_d_pff, yy_rsci_we_d_pff
);
  input clk;
  input rst;
  input x_rsc_s_tdone;
  input x_rsc_tr_write_done;
  input x_rsc_RREADY;
  output x_rsc_RVALID;
  output x_rsc_RUSER;
  output x_rsc_RLAST;
  output [1:0] x_rsc_RRESP;
  output [31:0] x_rsc_RDATA;
  output x_rsc_RID;
  output x_rsc_ARREADY;
  input x_rsc_ARVALID;
  input x_rsc_ARUSER;
  input [3:0] x_rsc_ARREGION;
  input [3:0] x_rsc_ARQOS;
  input [2:0] x_rsc_ARPROT;
  input [3:0] x_rsc_ARCACHE;
  input x_rsc_ARLOCK;
  input [1:0] x_rsc_ARBURST;
  input [2:0] x_rsc_ARSIZE;
  input [7:0] x_rsc_ARLEN;
  input [11:0] x_rsc_ARADDR;
  input x_rsc_ARID;
  input x_rsc_BREADY;
  output x_rsc_BVALID;
  output x_rsc_BUSER;
  output [1:0] x_rsc_BRESP;
  output x_rsc_BID;
  output x_rsc_WREADY;
  input x_rsc_WVALID;
  input x_rsc_WUSER;
  input x_rsc_WLAST;
  input [3:0] x_rsc_WSTRB;
  input [31:0] x_rsc_WDATA;
  output x_rsc_AWREADY;
  input x_rsc_AWVALID;
  input x_rsc_AWUSER;
  input [3:0] x_rsc_AWREGION;
  input [3:0] x_rsc_AWQOS;
  input [2:0] x_rsc_AWPROT;
  input [3:0] x_rsc_AWCACHE;
  input x_rsc_AWLOCK;
  input [1:0] x_rsc_AWBURST;
  input [2:0] x_rsc_AWSIZE;
  input [7:0] x_rsc_AWLEN;
  input [11:0] x_rsc_AWADDR;
  input x_rsc_AWID;
  output x_rsc_triosy_lz;
  input [31:0] m_rsc_dat;
  output m_rsc_triosy_lz;
  input twiddle_rsc_s_tdone;
  input twiddle_rsc_tr_write_done;
  input twiddle_rsc_RREADY;
  output twiddle_rsc_RVALID;
  output twiddle_rsc_RUSER;
  output twiddle_rsc_RLAST;
  output [1:0] twiddle_rsc_RRESP;
  output [31:0] twiddle_rsc_RDATA;
  output twiddle_rsc_RID;
  output twiddle_rsc_ARREADY;
  input twiddle_rsc_ARVALID;
  input twiddle_rsc_ARUSER;
  input [3:0] twiddle_rsc_ARREGION;
  input [3:0] twiddle_rsc_ARQOS;
  input [2:0] twiddle_rsc_ARPROT;
  input [3:0] twiddle_rsc_ARCACHE;
  input twiddle_rsc_ARLOCK;
  input [1:0] twiddle_rsc_ARBURST;
  input [2:0] twiddle_rsc_ARSIZE;
  input [7:0] twiddle_rsc_ARLEN;
  input [11:0] twiddle_rsc_ARADDR;
  input twiddle_rsc_ARID;
  input twiddle_rsc_BREADY;
  output twiddle_rsc_BVALID;
  output twiddle_rsc_BUSER;
  output [1:0] twiddle_rsc_BRESP;
  output twiddle_rsc_BID;
  output twiddle_rsc_WREADY;
  input twiddle_rsc_WVALID;
  input twiddle_rsc_WUSER;
  input twiddle_rsc_WLAST;
  input [3:0] twiddle_rsc_WSTRB;
  input [31:0] twiddle_rsc_WDATA;
  output twiddle_rsc_AWREADY;
  input twiddle_rsc_AWVALID;
  input twiddle_rsc_AWUSER;
  input [3:0] twiddle_rsc_AWREGION;
  input [3:0] twiddle_rsc_AWQOS;
  input [2:0] twiddle_rsc_AWPROT;
  input [3:0] twiddle_rsc_AWCACHE;
  input twiddle_rsc_AWLOCK;
  input [1:0] twiddle_rsc_AWBURST;
  input [2:0] twiddle_rsc_AWSIZE;
  input [7:0] twiddle_rsc_AWLEN;
  input [11:0] twiddle_rsc_AWADDR;
  input twiddle_rsc_AWID;
  output twiddle_rsc_triosy_lz;
  input twiddle_h_rsc_s_tdone;
  input twiddle_h_rsc_tr_write_done;
  input twiddle_h_rsc_RREADY;
  output twiddle_h_rsc_RVALID;
  output twiddle_h_rsc_RUSER;
  output twiddle_h_rsc_RLAST;
  output [1:0] twiddle_h_rsc_RRESP;
  output [31:0] twiddle_h_rsc_RDATA;
  output twiddle_h_rsc_RID;
  output twiddle_h_rsc_ARREADY;
  input twiddle_h_rsc_ARVALID;
  input twiddle_h_rsc_ARUSER;
  input [3:0] twiddle_h_rsc_ARREGION;
  input [3:0] twiddle_h_rsc_ARQOS;
  input [2:0] twiddle_h_rsc_ARPROT;
  input [3:0] twiddle_h_rsc_ARCACHE;
  input twiddle_h_rsc_ARLOCK;
  input [1:0] twiddle_h_rsc_ARBURST;
  input [2:0] twiddle_h_rsc_ARSIZE;
  input [7:0] twiddle_h_rsc_ARLEN;
  input [11:0] twiddle_h_rsc_ARADDR;
  input twiddle_h_rsc_ARID;
  input twiddle_h_rsc_BREADY;
  output twiddle_h_rsc_BVALID;
  output twiddle_h_rsc_BUSER;
  output [1:0] twiddle_h_rsc_BRESP;
  output twiddle_h_rsc_BID;
  output twiddle_h_rsc_WREADY;
  input twiddle_h_rsc_WVALID;
  input twiddle_h_rsc_WUSER;
  input twiddle_h_rsc_WLAST;
  input [3:0] twiddle_h_rsc_WSTRB;
  input [31:0] twiddle_h_rsc_WDATA;
  output twiddle_h_rsc_AWREADY;
  input twiddle_h_rsc_AWVALID;
  input twiddle_h_rsc_AWUSER;
  input [3:0] twiddle_h_rsc_AWREGION;
  input [3:0] twiddle_h_rsc_AWQOS;
  input [2:0] twiddle_h_rsc_AWPROT;
  input [3:0] twiddle_h_rsc_AWCACHE;
  input twiddle_h_rsc_AWLOCK;
  input [1:0] twiddle_h_rsc_AWBURST;
  input [2:0] twiddle_h_rsc_AWSIZE;
  input [7:0] twiddle_h_rsc_AWLEN;
  input [11:0] twiddle_h_rsc_AWADDR;
  input twiddle_h_rsc_AWID;
  output twiddle_h_rsc_triosy_lz;
  input revArr_rsc_s_tdone;
  input revArr_rsc_tr_write_done;
  input revArr_rsc_RREADY;
  output revArr_rsc_RVALID;
  output revArr_rsc_RUSER;
  output revArr_rsc_RLAST;
  output [1:0] revArr_rsc_RRESP;
  output [31:0] revArr_rsc_RDATA;
  output revArr_rsc_RID;
  output revArr_rsc_ARREADY;
  input revArr_rsc_ARVALID;
  input revArr_rsc_ARUSER;
  input [3:0] revArr_rsc_ARREGION;
  input [3:0] revArr_rsc_ARQOS;
  input [2:0] revArr_rsc_ARPROT;
  input [3:0] revArr_rsc_ARCACHE;
  input revArr_rsc_ARLOCK;
  input [1:0] revArr_rsc_ARBURST;
  input [2:0] revArr_rsc_ARSIZE;
  input [7:0] revArr_rsc_ARLEN;
  input [11:0] revArr_rsc_ARADDR;
  input revArr_rsc_ARID;
  input revArr_rsc_BREADY;
  output revArr_rsc_BVALID;
  output revArr_rsc_BUSER;
  output [1:0] revArr_rsc_BRESP;
  output revArr_rsc_BID;
  output revArr_rsc_WREADY;
  input revArr_rsc_WVALID;
  input revArr_rsc_WUSER;
  input revArr_rsc_WLAST;
  input [3:0] revArr_rsc_WSTRB;
  input [31:0] revArr_rsc_WDATA;
  output revArr_rsc_AWREADY;
  input revArr_rsc_AWVALID;
  input revArr_rsc_AWUSER;
  input [3:0] revArr_rsc_AWREGION;
  input [3:0] revArr_rsc_AWQOS;
  input [2:0] revArr_rsc_AWPROT;
  input [3:0] revArr_rsc_AWCACHE;
  input revArr_rsc_AWLOCK;
  input [1:0] revArr_rsc_AWBURST;
  input [2:0] revArr_rsc_AWSIZE;
  input [7:0] revArr_rsc_AWLEN;
  input [11:0] revArr_rsc_AWADDR;
  input revArr_rsc_AWID;
  output revArr_rsc_triosy_lz;
  input tw_rsc_s_tdone;
  input tw_rsc_tr_write_done;
  input tw_rsc_RREADY;
  output tw_rsc_RVALID;
  output tw_rsc_RUSER;
  output tw_rsc_RLAST;
  output [1:0] tw_rsc_RRESP;
  output [31:0] tw_rsc_RDATA;
  output tw_rsc_RID;
  output tw_rsc_ARREADY;
  input tw_rsc_ARVALID;
  input tw_rsc_ARUSER;
  input [3:0] tw_rsc_ARREGION;
  input [3:0] tw_rsc_ARQOS;
  input [2:0] tw_rsc_ARPROT;
  input [3:0] tw_rsc_ARCACHE;
  input tw_rsc_ARLOCK;
  input [1:0] tw_rsc_ARBURST;
  input [2:0] tw_rsc_ARSIZE;
  input [7:0] tw_rsc_ARLEN;
  input [11:0] tw_rsc_ARADDR;
  input tw_rsc_ARID;
  input tw_rsc_BREADY;
  output tw_rsc_BVALID;
  output tw_rsc_BUSER;
  output [1:0] tw_rsc_BRESP;
  output tw_rsc_BID;
  output tw_rsc_WREADY;
  input tw_rsc_WVALID;
  input tw_rsc_WUSER;
  input tw_rsc_WLAST;
  input [3:0] tw_rsc_WSTRB;
  input [31:0] tw_rsc_WDATA;
  output tw_rsc_AWREADY;
  input tw_rsc_AWVALID;
  input tw_rsc_AWUSER;
  input [3:0] tw_rsc_AWREGION;
  input [3:0] tw_rsc_AWQOS;
  input [2:0] tw_rsc_AWPROT;
  input [3:0] tw_rsc_AWCACHE;
  input tw_rsc_AWLOCK;
  input [1:0] tw_rsc_AWBURST;
  input [2:0] tw_rsc_AWSIZE;
  input [7:0] tw_rsc_AWLEN;
  input [11:0] tw_rsc_AWADDR;
  input tw_rsc_AWID;
  output tw_rsc_triosy_lz;
  input tw_h_rsc_s_tdone;
  input tw_h_rsc_tr_write_done;
  input tw_h_rsc_RREADY;
  output tw_h_rsc_RVALID;
  output tw_h_rsc_RUSER;
  output tw_h_rsc_RLAST;
  output [1:0] tw_h_rsc_RRESP;
  output [31:0] tw_h_rsc_RDATA;
  output tw_h_rsc_RID;
  output tw_h_rsc_ARREADY;
  input tw_h_rsc_ARVALID;
  input tw_h_rsc_ARUSER;
  input [3:0] tw_h_rsc_ARREGION;
  input [3:0] tw_h_rsc_ARQOS;
  input [2:0] tw_h_rsc_ARPROT;
  input [3:0] tw_h_rsc_ARCACHE;
  input tw_h_rsc_ARLOCK;
  input [1:0] tw_h_rsc_ARBURST;
  input [2:0] tw_h_rsc_ARSIZE;
  input [7:0] tw_h_rsc_ARLEN;
  input [11:0] tw_h_rsc_ARADDR;
  input tw_h_rsc_ARID;
  input tw_h_rsc_BREADY;
  output tw_h_rsc_BVALID;
  output tw_h_rsc_BUSER;
  output [1:0] tw_h_rsc_BRESP;
  output tw_h_rsc_BID;
  output tw_h_rsc_WREADY;
  input tw_h_rsc_WVALID;
  input tw_h_rsc_WUSER;
  input tw_h_rsc_WLAST;
  input [3:0] tw_h_rsc_WSTRB;
  input [31:0] tw_h_rsc_WDATA;
  output tw_h_rsc_AWREADY;
  input tw_h_rsc_AWVALID;
  input tw_h_rsc_AWUSER;
  input [3:0] tw_h_rsc_AWREGION;
  input [3:0] tw_h_rsc_AWQOS;
  input [2:0] tw_h_rsc_AWPROT;
  input [3:0] tw_h_rsc_AWCACHE;
  input tw_h_rsc_AWLOCK;
  input [1:0] tw_h_rsc_AWBURST;
  input [2:0] tw_h_rsc_AWSIZE;
  input [7:0] tw_h_rsc_AWLEN;
  input [11:0] tw_h_rsc_AWADDR;
  input tw_h_rsc_AWID;
  output tw_h_rsc_triosy_lz;
  output xx_rsci_clken_d;
  output [31:0] xx_rsci_d_d;
  input [31:0] xx_rsci_q_d;
  output [9:0] xx_rsci_radr_d;
  output [9:0] xx_rsci_wadr_d;
  output xx_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output yy_rsci_clken_d;
  output [31:0] yy_rsci_d_d;
  input [31:0] yy_rsci_q_d;
  output [9:0] yy_rsci_radr_d;
  output [9:0] yy_rsci_wadr_d;
  output yy_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output [4:0] S34_OUTER_LOOP_for_tf_mul_cmp_a;
  reg [4:0] S34_OUTER_LOOP_for_tf_mul_cmp_a;
  output [9:0] S34_OUTER_LOOP_for_tf_mul_cmp_b;
  input [9:0] S34_OUTER_LOOP_for_tf_mul_cmp_z;
  output xx_rsci_we_d_pff;
  output yy_rsci_we_d_pff;


  // Interconnect Declarations
  wire core_wen;
  wire core_wten;
  wire x_rsci_wen_comp;
  wire x_rsci_wen_comp_1;
  wire [31:0] x_rsci_s_din_mxwt;
  reg [31:0] x_rsci_s_dout_core;
  wire [31:0] m_rsci_idat;
  wire twiddle_rsci_wen_comp;
  wire [31:0] twiddle_rsci_s_din_mxwt;
  wire twiddle_h_rsci_wen_comp;
  wire [31:0] twiddle_h_rsci_s_din_mxwt;
  wire revArr_rsci_wen_comp;
  reg [4:0] revArr_rsci_s_raddr_core;
  wire [9:0] revArr_rsci_s_din_mxwt;
  wire tw_rsci_wen_comp;
  wire [19:0] tw_rsci_s_din_mxwt;
  wire tw_h_rsci_wen_comp;
  wire [19:0] tw_h_rsci_s_din_mxwt;
  wire mult_12_z_mul_cmp_en;
  wire [31:0] mult_12_z_mul_cmp_z;
  wire [9:0] S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg;
  wire mult_z_mul_cmp_en;
  wire [51:0] mult_z_mul_cmp_z;
  reg [4:0] x_rsci_s_raddr_core_9_5;
  reg [4:0] x_rsci_s_raddr_core_4_0;
  reg [4:0] x_rsci_s_waddr_core_9_5;
  reg [4:0] x_rsci_s_waddr_core_4_0;
  reg [4:0] S34_OUTER_LOOP_for_k_slc_S34_OUTER_LOOP_for_k_sva_19_5_4_0_1;
  reg [4:0] S34_OUTER_LOOP_for_k_sva_4_0;
  wire [7:0] fsm_output;
  wire mux_tmp_19;
  wire and_dcpl_14;
  wire nor_tmp_9;
  wire mux_tmp_37;
  wire or_tmp_29;
  wire or_tmp_52;
  wire nor_tmp_14;
  wire and_dcpl_20;
  wire and_dcpl_21;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_27;
  wire and_dcpl_31;
  wire and_dcpl_33;
  wire and_dcpl_34;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_43;
  wire and_dcpl_44;
  wire mux_tmp_57;
  wire mux_tmp_66;
  wire mux_tmp_70;
  wire and_dcpl_48;
  wire or_tmp_77;
  wire or_tmp_82;
  wire mux_tmp_79;
  wire mux_tmp_80;
  wire or_tmp_83;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire or_tmp_87;
  wire mux_tmp_84;
  wire and_dcpl_60;
  wire and_dcpl_66;
  wire and_dcpl_68;
  wire and_dcpl_69;
  wire and_dcpl_70;
  wire and_dcpl_71;
  wire or_tmp_112;
  wire mux_tmp_106;
  wire nor_tmp_27;
  wire not_tmp_90;
  wire and_dcpl_72;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire and_dcpl_75;
  wire and_dcpl_76;
  wire and_dcpl_77;
  wire and_dcpl_78;
  wire not_tmp_95;
  wire or_tmp_122;
  wire or_tmp_124;
  wire or_tmp_127;
  wire or_tmp_130;
  wire mux_tmp_135;
  wire and_dcpl_82;
  wire and_dcpl_83;
  wire and_dcpl_84;
  wire and_dcpl_85;
  wire and_dcpl_86;
  wire and_dcpl_87;
  wire and_dcpl_88;
  wire and_dcpl_89;
  wire and_dcpl_90;
  wire and_dcpl_91;
  wire and_dcpl_92;
  wire and_dcpl_95;
  wire and_dcpl_96;
  wire and_dcpl_97;
  wire and_dcpl_101;
  wire mux_tmp_137;
  wire and_dcpl_110;
  wire and_dcpl_111;
  wire or_tmp_140;
  wire and_dcpl_113;
  wire and_dcpl_122;
  wire and_dcpl_123;
  wire mux_tmp_147;
  wire mux_tmp_164;
  wire mux_tmp_165;
  wire or_tmp_173;
  wire or_tmp_188;
  wire or_tmp_197;
  wire and_dcpl_136;
  wire and_dcpl_137;
  wire and_dcpl_138;
  wire mux_tmp_188;
  wire and_dcpl_139;
  wire and_dcpl_141;
  wire mux_tmp_192;
  wire and_dcpl_143;
  wire and_dcpl_144;
  wire and_dcpl_145;
  wire and_dcpl_146;
  wire and_dcpl_148;
  wire and_dcpl_150;
  wire and_dcpl_151;
  wire and_dcpl_152;
  wire and_dcpl_156;
  wire and_dcpl_161;
  wire mux_tmp_196;
  wire and_dcpl_162;
  wire and_dcpl_164;
  wire and_dcpl_166;
  wire and_dcpl_167;
  wire and_dcpl_168;
  wire and_dcpl_169;
  wire and_dcpl_173;
  wire or_tmp_220;
  wire or_tmp_222;
  wire mux_tmp_201;
  wire not_tmp_135;
  wire or_tmp_236;
  wire mux_tmp_208;
  wire and_tmp_6;
  wire and_dcpl_184;
  wire and_dcpl_186;
  wire and_dcpl_187;
  wire and_dcpl_188;
  wire and_dcpl_192;
  wire and_dcpl_194;
  wire and_dcpl_195;
  wire or_tmp_253;
  wire nand_tmp_20;
  wire not_tmp_150;
  wire or_tmp_264;
  wire or_tmp_275;
  wire or_tmp_295;
  wire mux_tmp_263;
  wire or_tmp_301;
  wire mux_tmp_273;
  wire not_tmp_173;
  wire or_tmp_334;
  wire or_tmp_349;
  wire or_tmp_352;
  wire not_tmp_188;
  wire or_tmp_369;
  wire mux_tmp_327;
  wire mux_tmp_328;
  wire mux_tmp_330;
  wire nor_tmp_58;
  wire or_tmp_465;
  wire or_tmp_466;
  wire nor_tmp_65;
  wire mux_tmp_403;
  wire or_dcpl_15;
  wire or_tmp_503;
  wire and_dcpl_210;
  wire mux_tmp_462;
  wire and_dcpl_216;
  wire or_tmp_619;
  wire or_tmp_622;
  wire or_tmp_624;
  wire or_tmp_627;
  wire or_tmp_728;
  wire or_tmp_765;
  wire or_tmp_773;
  wire or_tmp_811;
  wire or_tmp_847;
  wire or_tmp_868;
  wire or_tmp_871;
  wire or_tmp_872;
  wire or_tmp_873;
  wire and_dcpl_253;
  wire and_dcpl_254;
  wire and_dcpl_255;
  wire and_dcpl_262;
  wire and_dcpl_270;
  wire and_dcpl_271;
  wire and_dcpl_278;
  wire and_dcpl_284;
  wire and_dcpl_286;
  wire and_dcpl_293;
  wire and_dcpl_301;
  wire and_dcpl_309;
  wire and_dcpl_310;
  wire and_dcpl_317;
  wire and_dcpl_324;
  wire and_dcpl_331;
  reg operator_20_true_15_slc_operator_20_true_15_acc_14_itm;
  reg operator_20_true_8_slc_operator_20_true_8_acc_14_itm;
  wire [5:0] S1_OUTER_LOOP_k_5_0_sva_2;
  wire [6:0] nl_S1_OUTER_LOOP_k_5_0_sva_2;
  reg operator_20_true_1_slc_operator_20_true_1_acc_14_itm;
  reg S2_OUTER_LOOP_c_1_sva;
  reg modulo_add_19_slc_32_svs_st;
  wire [31:0] modulo_add_base_22_sva_mx0w24;
  wire [32:0] nl_modulo_add_base_22_sva_mx0w24;
  wire [31:0] modulo_add_base_21_sva_mx0w23;
  wire [32:0] nl_modulo_add_base_21_sva_mx0w23;
  wire [31:0] modulo_add_base_20_sva_mx0w22;
  wire [32:0] nl_modulo_add_base_20_sva_mx0w22;
  wire [31:0] modulo_add_base_23_sva_mx0w21;
  wire [32:0] nl_modulo_add_base_23_sva_mx0w21;
  wire [31:0] modulo_add_base_18_sva_mx0w20;
  wire [32:0] nl_modulo_add_base_18_sva_mx0w20;
  wire [31:0] modulo_add_base_17_sva_mx0w19;
  wire [32:0] nl_modulo_add_base_17_sva_mx0w19;
  wire [31:0] modulo_add_base_16_sva_mx0w18;
  wire [32:0] nl_modulo_add_base_16_sva_mx0w18;
  wire [31:0] modulo_add_base_19_sva_mx0w17;
  wire [32:0] nl_modulo_add_base_19_sva_mx0w17;
  wire [31:0] modulo_add_base_14_sva_mx0w16;
  wire [32:0] nl_modulo_add_base_14_sva_mx0w16;
  wire [31:0] modulo_add_base_13_sva_mx0w15;
  wire [32:0] nl_modulo_add_base_13_sva_mx0w15;
  wire [31:0] modulo_add_base_12_sva_mx0w14;
  wire [32:0] nl_modulo_add_base_12_sva_mx0w14;
  wire [31:0] modulo_add_base_15_sva_mx0w13;
  wire [32:0] nl_modulo_add_base_15_sva_mx0w13;
  wire [31:0] modulo_add_base_10_sva_mx0w12;
  wire [32:0] nl_modulo_add_base_10_sva_mx0w12;
  wire [31:0] modulo_add_base_9_sva_mx0w11;
  wire [32:0] nl_modulo_add_base_9_sva_mx0w11;
  wire [31:0] modulo_add_base_8_sva_mx0w10;
  wire [32:0] nl_modulo_add_base_8_sva_mx0w10;
  wire [31:0] modulo_add_base_11_sva_mx0w9;
  wire [32:0] nl_modulo_add_base_11_sva_mx0w9;
  wire [31:0] modulo_add_base_6_sva_mx0w8;
  wire [32:0] nl_modulo_add_base_6_sva_mx0w8;
  wire [31:0] modulo_add_base_5_sva_mx0w7;
  wire [32:0] nl_modulo_add_base_5_sva_mx0w7;
  wire [31:0] modulo_add_base_4_sva_mx0w6;
  wire [32:0] nl_modulo_add_base_4_sva_mx0w6;
  wire [31:0] modulo_add_base_7_sva_mx0w5;
  wire [32:0] nl_modulo_add_base_7_sva_mx0w5;
  wire [31:0] modulo_add_base_2_sva_mx0w4;
  wire [32:0] nl_modulo_add_base_2_sva_mx0w4;
  reg [31:0] mult_2_res_sva;
  wire [32:0] nl_mult_2_res_sva;
  wire [31:0] modulo_add_base_1_sva_mx0w3;
  wire [32:0] nl_modulo_add_base_1_sva_mx0w3;
  wire [31:0] modulo_add_base_sva_mx0w2;
  wire [32:0] nl_modulo_add_base_sva_mx0w2;
  wire [31:0] modulo_add_base_3_sva_mx0w1;
  wire [32:0] nl_modulo_add_base_3_sva_mx0w1;
  reg [31:0] mult_3_res_sva;
  reg [31:0] m_sva;
  reg [4:0] S1_OUTER_LOOP_for_acc_cse_sva;
  reg reg_x_rsci_oswt_cse;
  reg reg_x_rsci_oswt_1_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_twiddle_rsci_s_raddr_core_1_cse;
  reg reg_twiddle_rsci_s_raddr_core_2_cse;
  reg reg_twiddle_rsci_s_raddr_core_0_cse;
  reg reg_twiddle_rsci_s_raddr_core_3_cse;
  reg reg_revArr_rsci_oswt_cse;
  reg reg_tw_rsci_oswt_cse;
  reg [9:0] reg_tw_rsci_s_raddr_core_cse;
  reg reg_xx_rsc_cgo_cse;
  reg reg_yy_rsc_cgo_cse;
  reg reg_x_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_1_cse;
  wire nand_95_cse;
  wire or_335_cse;
  wire nor_242_cse;
  wire or_35_cse;
  wire and_357_cse;
  wire or_442_cse;
  wire or_392_cse;
  wire or_467_cse;
  wire or_22_cse;
  wire or_533_cse;
  wire or_889_cse;
  reg [4:0] reg_drf_revArr_ptr_smx_9_0_cse;
  wire nand_96_cse;
  wire or_845_cse;
  wire or_325_cse;
  wire nor_131_cse;
  wire nor_248_cse;
  wire or_401_cse;
  wire and_422_cse;
  wire or_829_cse;
  wire or_900_cse;
  wire or_403_cse;
  wire nor_304_cse;
  wire or_28_cse;
  wire and_425_cse;
  wire or_1041_cse;
  wire or_210_cse;
  wire or_587_cse;
  wire or_125_cse;
  wire and_403_cse;
  wire mux_320_cse;
  wire and_385_cse;
  wire or_81_cse;
  wire nand_124_cse;
  wire or_888_cse;
  wire or_964_cse;
  wire or_179_cse;
  wire nand_111_cse;
  wire or_585_cse;
  wire nand_83_cse;
  wire nand_72_cse;
  wire or_351_cse;
  wire or_348_cse;
  wire nor_109_cse;
  wire mux_325_cse;
  wire mux_127_rmff;
  wire mux_185_rmff;
  wire and_200_rmff;
  reg [19:0] S34_OUTER_LOOP_for_tf_sva;
  reg [31:0] mult_x_1_sva;
  reg [31:0] mult_x_16_sva;
  reg [31:0] mult_x_15_sva;
  reg [31:0] operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm;
  reg [31:0] operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm;
  reg [31:0] butterFly_10_tw_asn_itm;
  reg [31:0] butterFly_14_tw_h_asn_itm;
  reg [31:0] butterFly_10_tw_h_asn_itm;
  reg [31:0] butterFly_13_tw_h_asn_itm;
  reg [19:0] S34_OUTER_LOOP_for_tf_h_sva;
  wire yy_rsci_wadr_d_mx0c1;
  wire yy_rsci_wadr_d_mx0c0;
  wire yy_rsci_wadr_d_mx0c10;
  wire yy_rsci_wadr_d_mx0c4;
  wire yy_rsci_wadr_d_mx0c5;
  wire yy_rsci_wadr_d_mx0c7;
  wire yy_rsci_wadr_d_mx0c2;
  wire yy_rsci_wadr_d_mx0c3;
  wire yy_rsci_wadr_d_mx0c6;
  wire yy_rsci_wadr_d_mx0c8;
  reg [1:0] S2_INNER_LOOP1_r_4_2_sva_1_0;
  wire yy_rsci_radr_d_mx0c0;
  wire yy_rsci_radr_d_mx0c1;
  wire yy_rsci_radr_d_mx0c2;
  wire yy_rsci_radr_d_mx0c5;
  wire yy_rsci_radr_d_mx0c9;
  wire xx_rsci_wadr_d_mx0c3;
  wire xx_rsci_wadr_d_mx0c4;
  wire xx_rsci_wadr_d_mx0c6;
  wire xx_rsci_wadr_d_mx0c1;
  wire xx_rsci_wadr_d_mx0c2;
  wire xx_rsci_wadr_d_mx0c5;
  wire xx_rsci_wadr_d_mx0c7;
  wire xx_rsci_radr_d_mx0c0;
  wire xx_rsci_radr_d_mx0c10;
  wire xx_rsci_radr_d_mx0c1;
  wire xx_rsci_radr_d_mx0c2;
  wire xx_rsci_radr_d_mx0c3;
  wire xx_rsci_radr_d_mx0c4;
  wire xx_rsci_radr_d_mx0c5;
  wire xx_rsci_radr_d_mx0c6;
  wire xx_rsci_radr_d_mx0c7;
  wire xx_rsci_radr_d_mx0c8;
  reg [31:0] butterFly_10_f1_sva;
  reg [31:0] modulo_sub_7_mux_itm;
  reg [31:0] modulo_sub_4_mux_itm;
  reg [31:0] modulo_sub_5_mux_itm;
  reg [31:0] modulo_sub_6_mux_itm;
  reg [31:0] modulo_sub_15_mux_itm;
  reg [31:0] modulo_sub_12_mux_itm;
  reg [31:0] modulo_sub_13_mux_itm;
  reg [31:0] modulo_sub_14_mux_itm;
  reg [31:0] modulo_sub_23_mux_itm;
  reg [31:0] modulo_sub_20_mux_itm;
  reg [31:0] modulo_sub_21_mux_itm;
  reg [31:0] modulo_sub_22_mux_itm;
  reg [31:0] modulo_sub_3_mux_itm;
  reg [31:0] modulo_sub_mux_itm;
  reg [31:0] modulo_sub_1_mux_itm;
  reg [31:0] modulo_sub_2_mux_itm;
  reg [31:0] modulo_sub_11_mux_itm;
  reg [31:0] modulo_sub_8_mux_itm;
  reg [31:0] modulo_sub_9_mux_itm;
  reg [31:0] modulo_sub_10_mux_itm;
  reg [31:0] modulo_sub_19_mux_itm;
  reg [31:0] modulo_sub_16_mux_itm;
  reg [31:0] modulo_sub_17_mux_itm;
  reg [31:0] modulo_sub_18_mux_itm;
  wire mux_235_itm;
  wire mux_138_itm;
  wire mux_140_itm;
  wire mux_148_itm;
  wire mux_193_itm;
  wire mux_195_itm;
  wire mux_197_itm;
  wire mux_199_itm;
  wire mux_200_itm;
  wire mux_202_itm;
  wire [3:0] z_out;
  wire not_tmp_396;
  wire [19:0] z_out_2;
  wire [20:0] nl_z_out_2;
  wire or_tmp_975;
  wire or_tmp_983;
  wire and_dcpl_358;
  wire and_dcpl_360;
  wire and_dcpl_370;
  wire and_dcpl_382;
  wire [31:0] z_out_4;
  wire and_dcpl_406;
  wire and_dcpl_425;
  wire and_dcpl_441;
  wire [31:0] z_out_5;
  wire and_dcpl_628;
  wire and_dcpl_731;
  wire and_dcpl_737;
  reg [19:0] S1_OUTER_LOOP_for_p_sva_1;
  reg [31:0] modulo_add_base_1_sva;
  reg [31:0] butterFly_11_f1_sva;
  reg [31:0] butterFly_14_f1_sva;
  reg [31:0] butterFly_15_f1_sva;
  wire S1_OUTER_LOOP_for_p_sva_1_mx0c1;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c0;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c1;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c2;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c3;
  wire butterFly_10_f1_sva_mx0c0;
  wire butterFly_10_f1_sva_mx0c1;
  wire butterFly_10_f1_sva_mx0c2;
  wire S2_OUTER_LOOP_c_1_sva_mx0c1;
  wire S2_OUTER_LOOP_c_1_sva_mx0c2;
  wire S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1;
  wire S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2;
  wire [31:0] modulo_add_3_mux_itm_mx0w1;
  wire [32:0] nl_modulo_add_3_mux_itm_mx0w1;
  wire butterFly_10_tw_asn_itm_mx0c0;
  wire butterFly_10_tw_asn_itm_mx0c2;
  wire butterFly_13_tw_h_asn_itm_mx0c0;
  wire butterFly_13_tw_h_asn_itm_mx0c1;
  wire butterFly_13_tw_h_asn_itm_mx0c2;
  wire butterFly_10_tw_h_asn_itm_mx0c1;
  wire butterFly_10_tw_h_asn_itm_mx0c2;
  wire butterFly_10_tw_h_asn_itm_mx0c3;
  wire butterFly_10_tw_h_asn_itm_mx0c4;
  wire modulo_add_base_1_sva_mx0c0;
  wire modulo_add_base_1_sva_mx0c1;
  wire modulo_add_base_1_sva_mx0c4;
  wire modulo_add_base_1_sva_mx0c5;
  wire modulo_add_base_1_sva_mx0c8;
  wire modulo_add_base_1_sva_mx0c9;
  wire modulo_add_base_1_sva_mx0c12;
  wire modulo_add_base_1_sva_mx0c13;
  wire modulo_add_base_1_sva_mx0c16;
  wire modulo_add_base_1_sva_mx0c17;
  wire modulo_add_base_1_sva_mx0c20;
  wire modulo_add_base_1_sva_mx0c21;
  wire modulo_add_base_1_sva_mx0c24;
  wire modulo_sub_1_mux_itm_mx0c1;
  wire modulo_sub_2_mux_itm_mx0c1;
  wire modulo_sub_5_mux_itm_mx0c1;
  wire modulo_sub_6_mux_itm_mx0c1;
  wire modulo_sub_9_mux_itm_mx0c1;
  wire modulo_sub_10_mux_itm_mx0c1;
  wire modulo_sub_13_mux_itm_mx0c1;
  wire modulo_sub_14_mux_itm_mx0c1;
  wire modulo_sub_17_mux_itm_mx0c1;
  wire modulo_sub_18_mux_itm_mx0c1;
  wire modulo_sub_21_mux_itm_mx0c1;
  wire modulo_sub_22_mux_itm_mx0c1;
  wire and_441_ssc;
  reg reg_modulo_add_3_slc_32_svs_st_cse;
  reg [31:0] reg_mult_res_lpi_4_dfm_cse;
  reg [31:0] reg_mult_1_res_lpi_4_dfm_cse;
  reg [31:0] reg_mult_2_res_lpi_4_dfm_cse;
  reg [31:0] reg_mult_3_res_lpi_4_dfm_cse;
  reg reg_modulo_add_4_slc_32_svs_st_cse;
  reg reg_modulo_add_6_slc_32_svs_st_cse;
  reg reg_modulo_add_7_slc_32_svs_st_cse;
  reg reg_modulo_add_slc_32_svs_st_cse;
  reg reg_modulo_add_1_slc_32_svs_st_cse;
  reg reg_modulo_add_11_slc_32_svs_st_cse;
  wire or_107_cse;
  wire nand_116_cse;
  wire or_1031_cse;
  wire nor_425_cse;
  wire or_697_cse;
  wire or_702_cse;
  wire or_715_cse;
  wire or_727_cse;
  wire mux_467_cse;
  wire nor_159_cse;
  wire and_715_cse_1;
  wire or_tmp_1011;
  wire mux_tmp_788;
  wire or_tmp_1036;
  wire nor_tmp_102;
  wire or_tmp_1052;
  wire or_tmp_1056;
  wire [5:0] S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt;
  reg S2_COPY_LOOP_for_i_5_0_sva_1_5;
  reg [4:0] S2_COPY_LOOP_for_i_5_0_sva_1_4_0;
  reg butterFly_12_tw_and_cse_3_2_sva_1;
  reg butterFly_12_tw_and_cse_3_2_sva_0;
  reg reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg;
  reg reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg;
  reg [2:0] reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg;
  wire mux_351_ssc;
  wire mux_359_seb;
  wire and_953_cse;
  wire or_46_cse;
  wire nor_217_cse;
  wire mux_829_cse;
  wire nor_488_cse;
  wire nor_494_cse;
  wire nor_487_cse;
  wire and_950_cse;
  wire butterFly_tw_and_1_cse;
  wire or_1016_cse;
  wire mux_513_itm;
  wire mux_554_itm;
  wire mux_623_itm;
  wire mux_676_itm;
  wire operator_20_true_1_acc_1_itm_14;
  wire z_out_14_32;
  wire z_out_16_32;
  wire [31:0] acc_6_cse_32_1;
  wire [31:0] acc_7_cse_32_1;
  wire [31:0] acc_8_cse_32_1;
  wire [31:0] acc_5_cse_32_1;

  wire[0:0] mux_43_nl;
  wire[0:0] mux_42_nl;
  wire[0:0] mux_41_nl;
  wire[0:0] mux_40_nl;
  wire[0:0] or_39_nl;
  wire[0:0] mux_39_nl;
  wire[0:0] and_416_nl;
  wire[0:0] mux_38_nl;
  wire[0:0] and_417_nl;
  wire[0:0] mux_64_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] mux_62_nl;
  wire[0:0] and_409_nl;
  wire[0:0] nor_294_nl;
  wire[0:0] and_410_nl;
  wire[0:0] mux_61_nl;
  wire[0:0] nor_296_nl;
  wire[0:0] nor_297_nl;
  wire[0:0] mux_60_nl;
  wire[0:0] mux_59_nl;
  wire[0:0] nor_298_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] nor_299_nl;
  wire[0:0] mux_76_nl;
  wire[0:0] or_87_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] nand_10_nl;
  wire[0:0] mux_74_nl;
  wire[0:0] mux_73_nl;
  wire[0:0] or_86_nl;
  wire[0:0] or_85_nl;
  wire[0:0] mux_72_nl;
  wire[0:0] mux_71_nl;
  wire[0:0] or_84_nl;
  wire[0:0] mux_69_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] butterFly_tw_h_or_2_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] or_92_nl;
  wire[0:0] and_53_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] mux_99_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] mux_97_nl;
  wire[0:0] and_428_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] and_405_nl;
  wire[0:0] nor_291_nl;
  wire[0:0] nor_353_nl;
  wire[0:0] mux_95_nl;
  wire[0:0] nor_354_nl;
  wire[0:0] nor_355_nl;
  wire[0:0] nor_356_nl;
  wire[0:0] mux_94_nl;
  wire[0:0] or_110_nl;
  wire[0:0] mux_93_nl;
  wire[0:0] or_109_nl;
  wire[0:0] mux_92_nl;
  wire[0:0] or_106_nl;
  wire[0:0] mux_102_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] or_117_nl;
  wire[0:0] and_69_nl;
  wire[0:0] mux_104_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] mux_105_nl;
  wire[0:0] nor_289_nl;
  wire[0:0] nor_290_nl;
  wire[0:0] mux_126_nl;
  wire[0:0] mux_125_nl;
  wire[0:0] mux_124_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] mux_122_nl;
  wire[0:0] mux_121_nl;
  wire[0:0] or_131_nl;
  wire[0:0] or_130_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] and_400_nl;
  wire[0:0] mux_117_nl;
  wire[0:0] nor_30_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] mux_115_nl;
  wire[0:0] or_488_nl;
  wire[0:0] and_401_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] nor_286_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] nand_114_nl;
  wire[0:0] mux_111_nl;
  wire[0:0] nor_287_nl;
  wire[0:0] mux_110_nl;
  wire[0:0] mux_109_nl;
  wire[0:0] mux_108_nl;
  wire[0:0] mux_107_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] nor_270_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] nor_272_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] or_201_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] nor_274_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] nor_275_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] or_1014_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] nor_276_nl;
  wire[0:0] nor_277_nl;
  wire[0:0] nor_278_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] and_391_nl;
  wire[0:0] or_189_nl;
  wire[4:0] S34_OUTER_LOOP_for_tf_mux_1_nl;
  wire[0:0] not_1496_nl;
  wire[4:0] S34_OUTER_LOOP_for_k_mux_nl;
  wire[0:0] not_1732_nl;
  wire[0:0] and_203_nl;
  wire[0:0] mux_234_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] mux_232_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] or_267_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] nor_251_nl;
  wire[0:0] or_265_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] mux_219_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] nor_132_nl;
  wire[0:0] nor_213_nl;
  wire[0:0] nor_214_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] nor_215_nl;
  wire[0:0] nor_216_nl;
  wire[0:0] or_1171_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] or_1011_nl;
  wire[0:0] nand_87_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] nor_209_nl;
  wire[0:0] nand_151_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] nor_210_nl;
  wire[0:0] nor_211_nl;
  wire[0:0] mux_785_nl;
  wire[0:0] mux_784_nl;
  wire[0:0] mux_783_nl;
  wire[0:0] or_1104_nl;
  wire[0:0] mux_782_nl;
  wire[0:0] nor_476_nl;
  wire[0:0] mux_781_nl;
  wire[0:0] mux_780_nl;
  wire[0:0] nor_477_nl;
  wire[0:0] mux_779_nl;
  wire[0:0] or_1100_nl;
  wire[0:0] mux_778_nl;
  wire[0:0] nor_479_nl;
  wire[0:0] nor_480_nl;
  wire[0:0] mux_nl;
  wire[0:0] nor_481_nl;
  wire[0:0] S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl;
  wire[0:0] mux_798_nl;
  wire[0:0] mux_797_nl;
  wire[0:0] mux_796_nl;
  wire[0:0] mux_795_nl;
  wire[0:0] mux_794_nl;
  wire[0:0] mux_793_nl;
  wire[0:0] or_1114_nl;
  wire[0:0] mux_792_nl;
  wire[0:0] or_1170_nl;
  wire[0:0] nor_482_nl;
  wire[0:0] mux_791_nl;
  wire[0:0] nor_483_nl;
  wire[0:0] nor_484_nl;
  wire[0:0] mux_790_nl;
  wire[0:0] or_1109_nl;
  wire[0:0] nand_143_nl;
  wire[0:0] mux_788_nl;
  wire[0:0] mux_787_nl;
  wire[0:0] nand_142_nl;
  wire[0:0] mux_786_nl;
  wire[0:0] nand_150_nl;
  wire[0:0] nor_485_nl;
  wire[2:0] S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl;
  wire[0:0] S2_COPY_LOOP_p_or_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] or_426_nl;
  wire[0:0] mux_353_nl;
  wire[0:0] or_423_nl;
  wire[0:0] mux_13_nl;
  wire[0:0] or_420_nl;
  wire[0:0] mux_807_nl;
  wire[0:0] mux_806_nl;
  wire[0:0] nor_486_nl;
  wire[0:0] mux_805_nl;
  wire[0:0] mux_804_nl;
  wire[0:0] mux_803_nl;
  wire[0:0] nor_489_nl;
  wire[0:0] nor_490_nl;
  wire[0:0] mux_802_nl;
  wire[0:0] mux_801_nl;
  wire[0:0] nor_491_nl;
  wire[0:0] nor_492_nl;
  wire[0:0] mux_800_nl;
  wire[0:0] nor_493_nl;
  wire[0:0] mux_799_nl;
  wire[0:0] and_955_nl;
  wire[4:0] S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl;
  wire[4:0] S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl;
  wire[0:0] S1_OUTER_LOOP_k_or_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] nor_301_nl;
  wire[0:0] mux_48_nl;
  wire[0:0] nor_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] or_1018_nl;
  wire[0:0] mux_46_nl;
  wire[0:0] nand_109_nl;
  wire[0:0] and_435_nl;
  wire[0:0] mux_45_nl;
  wire[0:0] nor_303_nl;
  wire[0:0] nor_309_nl;
  wire[0:0] mux_44_nl;
  wire[5:0] S2_INNER_LOOP1_for_acc_nl;
  wire[6:0] nl_S2_INNER_LOOP1_for_acc_nl;
  wire[0:0] nor_325_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] mux_379_nl;
  wire[0:0] or_1032_nl;
  wire[0:0] or_1033_nl;
  wire[0:0] nand_119_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] nor_197_nl;
  wire[0:0] nor_198_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] or_1034_nl;
  wire[0:0] or_1035_nl;
  wire[0:0] mux_817_nl;
  wire[0:0] mux_816_nl;
  wire[0:0] mux_815_nl;
  wire[0:0] nor_466_nl;
  wire[0:0] mux_814_nl;
  wire[0:0] nor_467_nl;
  wire[0:0] or_1142_nl;
  wire[0:0] mux_813_nl;
  wire[0:0] and_948_nl;
  wire[0:0] nor_468_nl;
  wire[0:0] mux_812_nl;
  wire[0:0] mux_811_nl;
  wire[0:0] nor_469_nl;
  wire[0:0] nor_470_nl;
  wire[0:0] nor_471_nl;
  wire[0:0] mux_810_nl;
  wire[0:0] mux_809_nl;
  wire[0:0] or_1134_nl;
  wire[0:0] and_949_nl;
  wire[0:0] mux_808_nl;
  wire[0:0] nor_472_nl;
  wire[0:0] nor_473_nl;
  wire[0:0] mux_828_nl;
  wire[0:0] mux_827_nl;
  wire[0:0] mux_826_nl;
  wire[0:0] mux_825_nl;
  wire[0:0] mux_824_nl;
  wire[0:0] or_1159_nl;
  wire[0:0] or_1158_nl;
  wire[0:0] mux_823_nl;
  wire[0:0] nor_464_nl;
  wire[0:0] mux_822_nl;
  wire[0:0] mux_821_nl;
  wire[0:0] or_1155_nl;
  wire[0:0] or_1154_nl;
  wire[0:0] or_1153_nl;
  wire[0:0] mux_820_nl;
  wire[0:0] or_1151_nl;
  wire[0:0] nand_145_nl;
  wire[0:0] mux_819_nl;
  wire[0:0] mux_818_nl;
  wire[0:0] or_1149_nl;
  wire[0:0] or_1146_nl;
  wire[14:0] S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl;
  wire[0:0] and_18_nl;
  wire[0:0] mux_55_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] or_62_nl;
  wire[0:0] or_60_nl;
  wire[0:0] mux_401_nl;
  wire[0:0] nand_40_nl;
  wire[0:0] mux_400_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux1h_3_nl;
  wire[4:0] S1_OUTER_LOOP_for_acc_nl;
  wire[5:0] nl_S1_OUTER_LOOP_for_acc_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux_15_nl;
  wire[0:0] and_956_nl;
  wire[0:0] mux_837_nl;
  wire[0:0] or_1172_nl;
  wire[0:0] nand_152_nl;
  wire[4:0] S6_OUTER_LOOP_for_acc_nl;
  wire[5:0] nl_S6_OUTER_LOOP_for_acc_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_nl;
  wire[0:0] S1_OUTER_LOOP_for_not_4_nl;
  wire[1:0] S2_INNER_LOOP1_r_mux_nl;
  wire[0:0] S2_OUTER_LOOP_c_nor_nl;
  wire[0:0] S2_INNER_LOOP1_r_not_nl;
  wire[0:0] mux_468_nl;
  wire[0:0] or_1028_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] or_1029_nl;
  wire[0:0] or_1030_nl;
  wire[0:0] nor_462_nl;
  wire[0:0] nor_463_nl;
  wire[0:0] mux_833_nl;
  wire[0:0] nor_461_nl;
  wire[0:0] mux_832_nl;
  wire[0:0] mux_831_nl;
  wire[0:0] nand_146_nl;
  wire[0:0] mux_830_nl;
  wire[0:0] or_1162_nl;
  wire[0:0] mux_836_nl;
  wire[0:0] nor_458_nl;
  wire[0:0] mux_835_nl;
  wire[0:0] or_1168_nl;
  wire[0:0] or_1167_nl;
  wire[0:0] mux_506_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] mux_504_nl;
  wire[0:0] or_644_nl;
  wire[0:0] mux_503_nl;
  wire[0:0] or_640_nl;
  wire[0:0] mux_592_nl;
  wire[0:0] mux_591_nl;
  wire[0:0] mux_655_nl;
  wire[0:0] mux_654_nl;
  wire[0:0] or_833_nl;
  wire[0:0] mux_662_nl;
  wire[0:0] mux_661_nl;
  wire[0:0] or_844_nl;
  wire[0:0] mux_672_nl;
  wire[0:0] mux_671_nl;
  wire[0:0] nor_110_nl;
  wire[0:0] mux_579_nl;
  wire[0:0] nor_111_nl;
  wire[0:0] mux_669_nl;
  wire[0:0] or_861_nl;
  wire[0:0] or_860_nl;
  wire[0:0] mux_668_nl;
  wire[0:0] or_743_nl;
  wire[0:0] mux_697_nl;
  wire[0:0] mux_696_nl;
  wire[0:0] mux_695_nl;
  wire[0:0] mux_694_nl;
  wire[0:0] or_901_nl;
  wire[0:0] mux_693_nl;
  wire[0:0] mux_692_nl;
  wire[0:0] mux_690_nl;
  wire[0:0] mux_689_nl;
  wire[0:0] mux_688_nl;
  wire[0:0] mux_687_nl;
  wire[0:0] or_892_nl;
  wire[0:0] mux_686_nl;
  wire[0:0] or_890_nl;
  wire[0:0] mux_685_nl;
  wire[0:0] mux_699_nl;
  wire[0:0] mux_698_nl;
  wire[0:0] or_1037_nl;
  wire[0:0] or_1038_nl;
  wire[0:0] or_1039_nl;
  wire[0:0] mux_706_nl;
  wire[0:0] or_918_nl;
  wire[0:0] mux_705_nl;
  wire[0:0] or_917_nl;
  wire[0:0] mux_743_nl;
  wire[0:0] mux_742_nl;
  wire[0:0] and_429_nl;
  wire[0:0] mux_741_nl;
  wire[0:0] nor_90_nl;
  wire[0:0] mux_740_nl;
  wire[0:0] nor_357_nl;
  wire[0:0] mux_739_nl;
  wire[0:0] nor_358_nl;
  wire[0:0] mux_738_nl;
  wire[0:0] mux_737_nl;
  wire[0:0] and_430_nl;
  wire[0:0] mux_736_nl;
  wire[0:0] nor_359_nl;
  wire[0:0] and_431_nl;
  wire[0:0] mux_735_nl;
  wire[0:0] nor_93_nl;
  wire[0:0] nor_94_nl;
  wire[32:0] acc_2_nl;
  wire[33:0] nl_acc_2_nl;
  wire[31:0] mult_3_res_mux1h_2_nl;
  wire[0:0] mux_838_nl;
  wire[0:0] and_957_nl;
  wire[0:0] mux_839_nl;
  wire[0:0] nor_498_nl;
  wire[0:0] mux_840_nl;
  wire[0:0] or_1173_nl;
  wire[0:0] mux_841_nl;
  wire[0:0] or_1174_nl;
  wire[0:0] mux_842_nl;
  wire[0:0] mux_843_nl;
  wire[0:0] nor_499_nl;
  wire[0:0] mux_844_nl;
  wire[0:0] and_958_nl;
  wire[0:0] mux_845_nl;
  wire[0:0] and_959_nl;
  wire[0:0] mux_846_nl;
  wire[0:0] nor_500_nl;
  wire[0:0] mux_847_nl;
  wire[0:0] mux_848_nl;
  wire[0:0] and_960_nl;
  wire[0:0] mux_849_nl;
  wire[0:0] nor_501_nl;
  wire[0:0] and_961_nl;
  wire[0:0] mux_850_nl;
  wire[0:0] mux_851_nl;
  wire[0:0] mux_852_nl;
  wire[0:0] mux_853_nl;
  wire[0:0] nor_502_nl;
  wire[0:0] nor_503_nl;
  wire[0:0] nor_504_nl;
  wire[0:0] nor_505_nl;
  wire[0:0] nor_506_nl;
  wire[31:0] modulo_sub_3_qif_acc_nl;
  wire[32:0] nl_modulo_sub_3_qif_acc_nl;
  wire[33:0] acc_14_nl;
  wire[34:0] nl_acc_14_nl;
  wire[31:0] modulo_add_3_mux1h_3_nl;
  wire[0:0] and_969_nl;
  wire[31:0] modulo_sub_qif_acc_nl;
  wire[32:0] nl_modulo_sub_qif_acc_nl;
  wire[33:0] acc_16_nl;
  wire[34:0] nl_acc_16_nl;
  wire[31:0] modulo_add_mux1h_3_nl;
  wire[31:0] modulo_sub_1_qif_acc_nl;
  wire[32:0] nl_modulo_sub_1_qif_acc_nl;
  wire[33:0] acc_18_nl;
  wire[34:0] nl_acc_18_nl;
  wire[31:0] modulo_add_1_mux1h_3_nl;
  wire[0:0] and_981_nl;
  wire[0:0] and_982_nl;
  wire[0:0] and_983_nl;
  wire[31:0] modulo_sub_2_qif_acc_nl;
  wire[32:0] nl_modulo_sub_2_qif_acc_nl;
  wire[31:0] modulo_sub_7_qif_acc_nl;
  wire[32:0] nl_modulo_sub_7_qif_acc_nl;
  wire[33:0] acc_19_nl;
  wire[34:0] nl_acc_19_nl;
  wire[31:0] modulo_add_7_mux1h_3_nl;
  wire[0:0] and_984_nl;
  wire[0:0] and_985_nl;
  wire[0:0] and_986_nl;
  wire[0:0] and_987_nl;
  wire[31:0] modulo_sub_4_qif_acc_nl;
  wire[32:0] nl_modulo_sub_4_qif_acc_nl;
  wire[33:0] acc_17_nl;
  wire[34:0] nl_acc_17_nl;
  wire[31:0] modulo_add_4_mux1h_3_nl;
  wire[0:0] and_977_nl;
  wire[0:0] and_978_nl;
  wire[0:0] and_979_nl;
  wire[0:0] and_980_nl;
  wire[31:0] modulo_sub_5_qif_acc_nl;
  wire[32:0] nl_modulo_sub_5_qif_acc_nl;
  wire[31:0] modulo_sub_6_qif_acc_nl;
  wire[32:0] nl_modulo_sub_6_qif_acc_nl;
  wire[33:0] acc_21_nl;
  wire[34:0] nl_acc_21_nl;
  wire[31:0] modulo_add_6_mux1h_3_nl;
  wire[0:0] and_988_nl;
  wire[0:0] and_989_nl;
  wire[0:0] and_990_nl;
  wire[31:0] modulo_sub_11_qif_acc_nl;
  wire[32:0] nl_modulo_sub_11_qif_acc_nl;
  wire[33:0] acc_20_nl;
  wire[34:0] nl_acc_20_nl;
  wire[31:0] modulo_add_11_mux1h_3_nl;
  wire[31:0] modulo_sub_8_qif_acc_nl;
  wire[32:0] nl_modulo_sub_8_qif_acc_nl;
  wire[31:0] modulo_sub_9_qif_acc_nl;
  wire[32:0] nl_modulo_sub_9_qif_acc_nl;
  wire[31:0] modulo_sub_10_qif_acc_nl;
  wire[32:0] nl_modulo_sub_10_qif_acc_nl;
  wire[31:0] modulo_sub_15_qif_acc_nl;
  wire[32:0] nl_modulo_sub_15_qif_acc_nl;
  wire[31:0] modulo_sub_12_qif_acc_nl;
  wire[32:0] nl_modulo_sub_12_qif_acc_nl;
  wire[31:0] modulo_sub_13_qif_acc_nl;
  wire[32:0] nl_modulo_sub_13_qif_acc_nl;
  wire[31:0] modulo_sub_14_qif_acc_nl;
  wire[32:0] nl_modulo_sub_14_qif_acc_nl;
  wire[31:0] modulo_sub_19_qif_acc_nl;
  wire[32:0] nl_modulo_sub_19_qif_acc_nl;
  wire[32:0] modulo_add_19_acc_1_nl;
  wire[33:0] nl_modulo_add_19_acc_1_nl;
  wire[31:0] modulo_sub_16_qif_acc_nl;
  wire[32:0] nl_modulo_sub_16_qif_acc_nl;
  wire[31:0] modulo_sub_17_qif_acc_nl;
  wire[32:0] nl_modulo_sub_17_qif_acc_nl;
  wire[31:0] modulo_sub_18_qif_acc_nl;
  wire[32:0] nl_modulo_sub_18_qif_acc_nl;
  wire[31:0] modulo_sub_23_qif_acc_nl;
  wire[32:0] nl_modulo_sub_23_qif_acc_nl;
  wire[31:0] modulo_sub_20_qif_acc_nl;
  wire[32:0] nl_modulo_sub_20_qif_acc_nl;
  wire[31:0] modulo_sub_21_qif_acc_nl;
  wire[32:0] nl_modulo_sub_21_qif_acc_nl;
  wire[31:0] modulo_sub_22_qif_acc_nl;
  wire[32:0] nl_modulo_sub_22_qif_acc_nl;
  wire[14:0] operator_20_true_1_acc_1_nl;
  wire[15:0] nl_operator_20_true_1_acc_1_nl;
  wire[0:0] mux_83_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] or_97_nl;
  wire[0:0] or_96_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] mux_67_nl;
  wire[0:0] nor_379_nl;
  wire[0:0] nor_380_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] or_99_nl;
  wire[0:0] or_142_nl;
  wire[0:0] mux_136_nl;
  wire[0:0] or_144_nl;
  wire[0:0] or_163_nl;
  wire[0:0] or_162_nl;
  wire[0:0] or_183_nl;
  wire[0:0] mux_162_nl;
  wire[0:0] or_832_nl;
  wire[0:0] or_211_nl;
  wire[0:0] or_216_nl;
  wire[0:0] or_215_nl;
  wire[0:0] or_218_nl;
  wire[0:0] mux_719_nl;
  wire[0:0] or_773_nl;
  wire[0:0] nand_123_nl;
  wire[0:0] or_784_nl;
  wire[0:0] or_223_nl;
  wire[0:0] or_669_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] or_657_nl;
  wire[0:0] nor_262_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] nor_263_nl;
  wire[0:0] nor_264_nl;
  wire[0:0] or_307_nl;
  wire[0:0] or_318_nl;
  wire[0:0] or_316_nl;
  wire[0:0] or_395_nl;
  wire[0:0] nor_192_nl;
  wire[0:0] or_572_nl;
  wire[0:0] or_571_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] nor_285_nl;
  wire[0:0] and_399_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] or_155_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] nor_283_nl;
  wire[0:0] nor_284_nl;
  wire[0:0] and_398_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] or_165_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] nand_120_nl;
  wire[0:0] or_1036_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] or_168_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] nor_265_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] nor_266_nl;
  wire[0:0] nor_260_nl;
  wire[0:0] nor_261_nl;
  wire[0:0] mux_406_nl;
  wire[0:0] nor_188_nl;
  wire[0:0] mux_405_nl;
  wire[0:0] mux_404_nl;
  wire[0:0] nor_189_nl;
  wire[0:0] mux_402_nl;
  wire[0:0] nor_190_nl;
  wire[0:0] nor_191_nl;
  wire[0:0] mux_413_nl;
  wire[0:0] or_nl;
  wire[0:0] or_1023_nl;
  wire[0:0] nor_179_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] or_513_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] nand_42_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] mux_8_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] and_365_nl;
  wire[0:0] nor_181_nl;
  wire[0:0] mux_414_nl;
  wire[0:0] nor_182_nl;
  wire[0:0] nor_183_nl;
  wire[0:0] mux_29_nl;
  wire[0:0] nor_311_nl;
  wire[0:0] mux_431_nl;
  wire[0:0] nor_174_nl;
  wire[0:0] mux_430_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] or_525_nl;
  wire[0:0] or_523_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] nor_175_nl;
  wire[0:0] and_363_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] or_519_nl;
  wire[0:0] and_364_nl;
  wire[0:0] mux_426_nl;
  wire[0:0] nor_176_nl;
  wire[0:0] nor_177_nl;
  wire[0:0] mux_450_nl;
  wire[0:0] mux_449_nl;
  wire[0:0] mux_448_nl;
  wire[0:0] or_552_nl;
  wire[0:0] or_550_nl;
  wire[0:0] or_548_nl;
  wire[0:0] and_361_nl;
  wire[0:0] mux_452_nl;
  wire[0:0] nor_169_nl;
  wire[0:0] nor_170_nl;
  wire[0:0] nor_171_nl;
  wire[0:0] mux_451_nl;
  wire[0:0] or_554_nl;
  wire[0:0] or_553_nl;
  wire[0:0] mux_473_nl;
  wire[0:0] mux_472_nl;
  wire[0:0] mux_471_nl;
  wire[0:0] nand_118_nl;
  wire[0:0] mux_470_nl;
  wire[0:0] nor_160_nl;
  wire[0:0] nor_161_nl;
  wire[0:0] or_1025_nl;
  wire[0:0] or_1026_nl;
  wire[0:0] mux_469_nl;
  wire[0:0] or_1027_nl;
  wire[0:0] mux_474_nl;
  wire[0:0] or_598_nl;
  wire[0:0] nor_156_nl;
  wire[0:0] mux_477_nl;
  wire[0:0] or_608_nl;
  wire[0:0] mux_7_nl;
  wire[0:0] or_1042_nl;
  wire[0:0] nand_47_nl;
  wire[0:0] mux_475_nl;
  wire[0:0] nor_157_nl;
  wire[0:0] nor_158_nl;
  wire[0:0] mux_512_nl;
  wire[0:0] or_654_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] or_652_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] mux_507_nl;
  wire[0:0] or_649_nl;
  wire[0:0] or_646_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] nor_145_nl;
  wire[0:0] nor_146_nl;
  wire[0:0] mux_529_nl;
  wire[0:0] nor_147_nl;
  wire[0:0] mux_528_nl;
  wire[0:0] nor_148_nl;
  wire[0:0] nor_149_nl;
  wire[0:0] mux_527_nl;
  wire[0:0] nor_150_nl;
  wire[0:0] nor_151_nl;
  wire[0:0] nor_152_nl;
  wire[0:0] mux_526_nl;
  wire[0:0] or_675_nl;
  wire[0:0] or_674_nl;
  wire[0:0] mux_553_nl;
  wire[0:0] or_704_nl;
  wire[0:0] mux_552_nl;
  wire[0:0] mux_551_nl;
  wire[0:0] or_703_nl;
  wire[0:0] mux_550_nl;
  wire[0:0] mux_549_nl;
  wire[0:0] mux_548_nl;
  wire[0:0] nand_75_nl;
  wire[0:0] mux_547_nl;
  wire[0:0] and_354_nl;
  wire[0:0] and_355_nl;
  wire[0:0] or_699_nl;
  wire[0:0] mux_546_nl;
  wire[0:0] mux_545_nl;
  wire[0:0] mux_544_nl;
  wire[0:0] mux_543_nl;
  wire[0:0] mux_542_nl;
  wire[0:0] mux_541_nl;
  wire[0:0] mux_540_nl;
  wire[0:0] or_695_nl;
  wire[0:0] mux_539_nl;
  wire[0:0] nand_50_nl;
  wire[0:0] mux_537_nl;
  wire[0:0] nor_142_nl;
  wire[0:0] nor_143_nl;
  wire[0:0] nand_49_nl;
  wire[0:0] mux_536_nl;
  wire[0:0] nor_144_nl;
  wire[0:0] mux_535_nl;
  wire[0:0] or_688_nl;
  wire[0:0] mux_534_nl;
  wire[0:0] or_687_nl;
  wire[0:0] or_686_nl;
  wire[0:0] and_356_nl;
  wire[0:0] mux_574_nl;
  wire[0:0] nor_133_nl;
  wire[0:0] mux_573_nl;
  wire[0:0] mux_572_nl;
  wire[0:0] mux_571_nl;
  wire[0:0] or_728_nl;
  wire[0:0] mux_570_nl;
  wire[0:0] mux_569_nl;
  wire[0:0] nor_134_nl;
  wire[0:0] nor_135_nl;
  wire[0:0] nor_136_nl;
  wire[0:0] mux_568_nl;
  wire[0:0] mux_567_nl;
  wire[0:0] or_720_nl;
  wire[0:0] or_719_nl;
  wire[0:0] mux_566_nl;
  wire[0:0] or_718_nl;
  wire[0:0] or_717_nl;
  wire[0:0] and_353_nl;
  wire[0:0] mux_565_nl;
  wire[0:0] nor_137_nl;
  wire[0:0] mux_564_nl;
  wire[0:0] mux_563_nl;
  wire[0:0] mux_562_nl;
  wire[0:0] mux_561_nl;
  wire[0:0] nor_138_nl;
  wire[0:0] mux_560_nl;
  wire[0:0] mux_559_nl;
  wire[0:0] mux_558_nl;
  wire[0:0] or_710_nl;
  wire[0:0] mux_556_nl;
  wire[0:0] mux_555_nl;
  wire[0:0] nor_139_nl;
  wire[0:0] nor_140_nl;
  wire[0:0] nor_141_nl;
  wire[0:0] mux_601_nl;
  wire[0:0] nor_128_nl;
  wire[0:0] nor_129_nl;
  wire[0:0] mux_600_nl;
  wire[0:0] or_757_nl;
  wire[0:0] nor_130_nl;
  wire[0:0] mux_599_nl;
  wire[0:0] or_754_nl;
  wire[0:0] or_753_nl;
  wire[0:0] mux_598_nl;
  wire[0:0] or_752_nl;
  wire[0:0] mux_606_nl;
  wire[0:0] mux_605_nl;
  wire[0:0] nor_124_nl;
  wire[0:0] nor_125_nl;
  wire[0:0] nor_127_nl;
  wire[0:0] mux_604_nl;
  wire[0:0] mux_603_nl;
  wire[0:0] or_772_nl;
  wire[0:0] or_777_nl;
  wire[0:0] or_762_nl;
  wire[0:0] nand_54_nl;
  wire[0:0] mux_622_nl;
  wire[0:0] or_792_nl;
  wire[0:0] mux_621_nl;
  wire[0:0] mux_620_nl;
  wire[0:0] or_791_nl;
  wire[0:0] mux_619_nl;
  wire[0:0] or_790_nl;
  wire[0:0] or_789_nl;
  wire[0:0] or_787_nl;
  wire[0:0] nor_122_nl;
  wire[0:0] mux_627_nl;
  wire[0:0] or_799_nl;
  wire[0:0] mux_626_nl;
  wire[0:0] or_545_nl;
  wire[0:0] nor_123_nl;
  wire[0:0] mux_625_nl;
  wire[0:0] mux_624_nl;
  wire[0:0] or_541_nl;
  wire[0:0] or_794_nl;
  wire[0:0] mux_633_nl;
  wire[0:0] nor_118_nl;
  wire[0:0] mux_632_nl;
  wire[0:0] mux_631_nl;
  wire[0:0] or_807_nl;
  wire[0:0] or_805_nl;
  wire[0:0] or_804_nl;
  wire[0:0] mux_630_nl;
  wire[0:0] nor_119_nl;
  wire[0:0] and_352_nl;
  wire[0:0] mux_629_nl;
  wire[0:0] nor_120_nl;
  wire[0:0] nor_121_nl;
  wire[0:0] mux_638_nl;
  wire[0:0] nor_114_nl;
  wire[0:0] mux_637_nl;
  wire[0:0] mux_636_nl;
  wire[0:0] or_816_nl;
  wire[0:0] or_814_nl;
  wire[0:0] or_813_nl;
  wire[0:0] mux_635_nl;
  wire[0:0] nor_115_nl;
  wire[0:0] and_351_nl;
  wire[0:0] mux_634_nl;
  wire[0:0] nor_116_nl;
  wire[0:0] nor_117_nl;
  wire[0:0] mux_675_nl;
  wire[0:0] mux_674_nl;
  wire[0:0] or_874_nl;
  wire[0:0] or_872_nl;
  wire[0:0] nand_61_nl;
  wire[0:0] mux_673_nl;
  wire[0:0] or_871_nl;
  wire[0:0] mux_716_nl;
  wire[0:0] mux_715_nl;
  wire[0:0] nor_95_nl;
  wire[0:0] nor_96_nl;
  wire[0:0] mux_714_nl;
  wire[0:0] mux_713_nl;
  wire[0:0] mux_712_nl;
  wire[0:0] nor_97_nl;
  wire[0:0] nor_98_nl;
  wire[0:0] nor_99_nl;
  wire[0:0] nor_100_nl;
  wire[0:0] nor_332_nl;
  wire[0:0] mux_134_nl;
  wire[0:0] mux_133_nl;
  wire[0:0] mux_132_nl;
  wire[0:0] or_139_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] nand_103_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] mux_129_nl;
  wire[0:0] mux_128_nl;
  wire[0:0] or_136_nl;
  wire[0:0] and_85_nl;
  wire[0:0] and_86_nl;
  wire[0:0] and_98_nl;
  wire[0:0] and_99_nl;
  wire[0:0] and_103_nl;
  wire[0:0] and_104_nl;
  wire[4:0] S2_COPY_LOOP_for_mux1h_nl;
  wire[0:0] S2_COPY_LOOP_for_or_7_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_8_nl;
  wire[0:0] S2_COPY_LOOP_for_or_8_nl;
  wire[2:0] S2_COPY_LOOP_for_or_5_nl;
  wire[2:0] S2_COPY_LOOP_for_and_2_nl;
  wire[2:0] S2_COPY_LOOP_for_mux1h_9_nl;
  wire[0:0] S2_COPY_LOOP_for_not_nl;
  wire[4:0] S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_6_nl;
  wire[0:0] S2_COPY_LOOP_for_or_nl;
  wire[0:0] S2_COPY_LOOP_for_mux1h_10_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_11_nl;
  wire[0:0] S2_COPY_LOOP_for_or_9_nl;
  wire[1:0] S2_COPY_LOOP_for_or_1_nl;
  wire[1:0] S2_COPY_LOOP_for_and_1_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_12_nl;
  wire[0:0] S2_COPY_LOOP_for_or_2_nl;
  wire[0:0] S2_COPY_LOOP_for_or_3_nl;
  wire[0:0] S2_COPY_LOOP_for_nor_1_nl;
  wire[0:0] S2_COPY_LOOP_for_or_4_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] nor_279_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] mux_158_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] or_176_nl;
  wire[0:0] or_175_nl;
  wire[0:0] or_174_nl;
  wire[0:0] and_393_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] mux_155_nl;
  wire[0:0] and_394_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] or_172_nl;
  wire[0:0] and_396_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] nor_280_nl;
  wire[0:0] and_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] mux_171_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] mux_169_nl;
  wire[0:0] or_188_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] or_187_nl;
  wire[0:0] nand_102_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] or_178_nl;
  wire[0:0] and_140_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] and_388_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] or_207_nl;
  wire[0:0] nor_269_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] nor_267_nl;
  wire[0:0] nor_268_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] nand_19_nl;
  wire[0:0] nand_18_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] and_145_nl;
  wire[0:0] and_147_nl;
  wire[0:0] and_152_nl;
  wire[0:0] and_154_nl;
  wire[0:0] and_158_nl;
  wire[0:0] and_159_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux1h_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_8_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_5_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_10_nl;
  wire[2:0] S1_OUTER_LOOP_for_or_6_nl;
  wire[2:0] S1_OUTER_LOOP_for_and_3_nl;
  wire[2:0] S1_OUTER_LOOP_for_mux1h_6_nl;
  wire[0:0] S1_OUTER_LOOP_for_not_5_nl;
  wire[4:0] S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_1_nl;
  wire[0:0] S1_OUTER_LOOP_for_mux1h_7_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_8_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_9_nl;
  wire[1:0] S1_OUTER_LOOP_for_or_2_nl;
  wire[1:0] S1_OUTER_LOOP_for_and_2_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_9_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_3_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_4_nl;
  wire[0:0] S1_OUTER_LOOP_for_nor_1_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_5_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] nor_257_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] or_252_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] and_387_nl;
  wire[0:0] nor_258_nl;
  wire[0:0] nor_259_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] or_248_nl;
  wire[0:0] or_246_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] nor_252_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] nor_253_nl;
  wire[0:0] nor_254_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] nor_255_nl;
  wire[0:0] nor_256_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] or_254_nl;
  wire[0:0] nor_406_nl;
  wire[0:0] mux_759_nl;
  wire[0:0] or_1063_nl;
  wire[0:0] nand_136_nl;
  wire[0:0] mux_757_nl;
  wire[0:0] or_1059_nl;
  wire[0:0] mux_751_nl;
  wire[0:0] nor_430_nl;
  wire[0:0] nor_431_nl;
  wire[14:0] S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl;
  wire[0:0] not_1929_nl;
  wire[2:0] S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl;
  wire[0:0] not_1930_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux_16_nl;
  wire[32:0] acc_3_nl;
  wire[33:0] nl_acc_3_nl;
  wire[32:0] acc_4_nl;
  wire[33:0] nl_acc_4_nl;
  wire[31:0] mult_if_mux_1_nl;
  wire[0:0] mult_if_or_2_nl;
  wire[32:0] acc_5_nl;
  wire[33:0] nl_acc_5_nl;
  wire[32:0] acc_6_nl;
  wire[33:0] nl_acc_6_nl;
  wire[32:0] acc_7_nl;
  wire[33:0] nl_acc_7_nl;
  wire[32:0] acc_8_nl;
  wire[33:0] nl_acc_8_nl;
  wire[33:0] acc_13_nl;
  wire[34:0] nl_acc_13_nl;
  wire[33:0] acc_15_nl;
  wire[34:0] nl_acc_15_nl;
  wire[31:0] mult_1_if_mult_1_if_mux_1_nl;
  wire[0:0] mult_1_if_or_2_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [19:0] nl_mult_12_z_mul_cmp_a;
  assign nl_mult_12_z_mul_cmp_a = MUX_v_20_2_2(tw_rsci_s_din_mxwt, S34_OUTER_LOOP_for_tf_sva,
      and_dcpl_194);
  wire [31:0] nl_mult_12_z_mul_cmp_b;
  assign nl_mult_12_z_mul_cmp_b = mult_x_1_sva;
  wire[0:0] mux_248_nl;
  wire[0:0] mux_247_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] nand_21_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] or_283_nl;
  wire[0:0] or_282_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] or_281_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] or_279_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] or_278_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] or_277_nl;
  wire[0:0] or_276_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] or_274_nl;
  wire[0:0] or_273_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] or_272_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] or_1013_nl;
  wire[0:0] nand_98_nl;
  wire[0:0] or_270_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] or_269_nl;
  wire[0:0] or_268_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] nor_246_nl;
  wire[0:0] nor_247_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] and_384_nl;
  wire[0:0] mux_251_nl;
  wire[0:0] nor_249_nl;
  wire[0:0] nor_250_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] mux_249_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] and_381_nl;
  wire[0:0] nor_240_nl;
  wire[0:0] and_382_nl;
  wire[0:0] mux_259_nl;
  wire[0:0] mux_258_nl;
  wire[0:0] nor_241_nl;
  wire[0:0] nor_243_nl;
  wire[0:0] and_383_nl;
  wire[0:0] mux_257_nl;
  wire[0:0] nor_244_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] or_296_nl;
  wire[0:0] or_295_nl;
  wire[0:0] nor_245_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] nand_26_nl;
  wire[0:0] or_314_nl;
  wire[0:0] mux_269_nl;
  wire[0:0] nand_25_nl;
  wire[0:0] mux_268_nl;
  wire[0:0] mux_267_nl;
  wire[0:0] or_313_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] mux_265_nl;
  wire[0:0] or_310_nl;
  wire[0:0] mux_264_nl;
  wire[0:0] or_309_nl;
  wire[0:0] or_308_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] and_379_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] mux_276_nl;
  wire[0:0] or_321_nl;
  wire[0:0] or_320_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] nor_238_nl;
  wire[0:0] and_380_nl;
  wire[0:0] nor_239_nl;
  wire[0:0] nor_345_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] or_326_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] or_324_nl;
  wire[0:0] or_323_nl;
  wire[0:0] and_207_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] and_378_nl;
  wire[0:0] nor_237_nl;
  wire[0:0] and_209_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] nor_236_nl;
  wire[0:0] and_377_nl;
  wire [31:0] nl_mult_z_mul_cmp_a;
  assign or_283_nl = (fsm_output[1]) | (fsm_output[5]);
  assign mux_245_nl = MUX_s_1_2_2(or_283_nl, or_tmp_264, fsm_output[0]);
  assign nand_21_nl = ~((fsm_output[4]) & (~ mux_245_nl));
  assign or_281_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (~ (fsm_output[5]));
  assign or_279_nl = (~ (fsm_output[2])) | (fsm_output[5]);
  assign mux_243_nl = MUX_s_1_2_2(not_tmp_150, or_279_nl, fsm_output[1]);
  assign mux_244_nl = MUX_s_1_2_2(or_281_nl, mux_243_nl, fsm_output[0]);
  assign or_282_nl = (fsm_output[4]) | mux_244_nl;
  assign mux_246_nl = MUX_s_1_2_2(nand_21_nl, or_282_nl, fsm_output[3]);
  assign or_278_nl = (~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[2])
      | (fsm_output[5]);
  assign or_277_nl = (fsm_output[1]) | (~ (fsm_output[5]));
  assign or_276_nl = (fsm_output[2]) | (~ (fsm_output[5]));
  assign mux_240_nl = MUX_s_1_2_2(or_277_nl, or_276_nl, fsm_output[0]);
  assign mux_241_nl = MUX_s_1_2_2(or_278_nl, mux_240_nl, fsm_output[4]);
  assign or_274_nl = (fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[5]);
  assign mux_239_nl = MUX_s_1_2_2(or_tmp_264, or_274_nl, fsm_output[4]);
  assign mux_242_nl = MUX_s_1_2_2(mux_241_nl, mux_239_nl, fsm_output[3]);
  assign mux_247_nl = MUX_s_1_2_2(mux_246_nl, mux_242_nl, fsm_output[6]);
  assign or_1013_nl = (fsm_output[1]) | not_tmp_150;
  assign nand_98_nl = ~((fsm_output[1]) & (fsm_output[2]) & (fsm_output[5]));
  assign mux_237_nl = MUX_s_1_2_2(or_1013_nl, nand_98_nl, fsm_output[0]);
  assign or_272_nl = (fsm_output[4]) | mux_237_nl;
  assign or_269_nl = (~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[5]);
  assign or_268_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[5]);
  assign mux_236_nl = MUX_s_1_2_2(or_269_nl, or_268_nl, fsm_output[0]);
  assign or_270_nl = (fsm_output[4]) | mux_236_nl;
  assign mux_238_nl = MUX_s_1_2_2(or_272_nl, or_270_nl, fsm_output[3]);
  assign or_273_nl = (fsm_output[6]) | mux_238_nl;
  assign mux_248_nl = MUX_s_1_2_2(mux_247_nl, or_273_nl, fsm_output[7]);
  assign nor_246_nl = ~((fsm_output[7:6]!=2'b01) | nand_124_cse);
  assign mux_252_nl = MUX_s_1_2_2(or_tmp_275, or_35_cse, fsm_output[7]);
  assign nor_247_nl = ~((fsm_output[6]) | mux_252_nl);
  assign mux_253_nl = MUX_s_1_2_2(nor_246_nl, nor_247_nl, fsm_output[4]);
  assign nor_249_nl = ~((fsm_output[7]) | nand_96_cse);
  assign mux_251_nl = MUX_s_1_2_2(nor_248_cse, nor_249_nl, fsm_output[6]);
  assign and_384_nl = (fsm_output[4]) & mux_251_nl;
  assign mux_254_nl = MUX_s_1_2_2(mux_253_nl, and_384_nl, fsm_output[5]);
  assign mux_249_nl = MUX_s_1_2_2(or_tmp_275, or_35_cse, fsm_output[0]);
  assign mux_250_nl = MUX_s_1_2_2(nand_124_cse, mux_249_nl, fsm_output[7]);
  assign nor_250_nl = ~((fsm_output[6:4]!=3'b010) | mux_250_nl);
  assign mux_255_nl = MUX_s_1_2_2(mux_254_nl, nor_250_nl, fsm_output[3]);
  assign and_381_nl = (fsm_output[1]) & (fsm_output[5]) & (fsm_output[6]) & (fsm_output[4])
      & (~ (fsm_output[3]));
  assign nor_240_nl = ~((fsm_output[1]) | (~ (fsm_output[5])) | (fsm_output[6]) |
      (fsm_output[4]) | (~ (fsm_output[3])));
  assign mux_260_nl = MUX_s_1_2_2(and_381_nl, nor_240_nl, fsm_output[7]);
  assign nor_241_nl = ~((fsm_output[4:3]!=2'b10));
  assign mux_258_nl = MUX_s_1_2_2(nor_241_nl, nor_242_cse, fsm_output[6]);
  assign nor_243_nl = ~((fsm_output[6]) | (fsm_output[4]) | (~ (fsm_output[3])));
  assign mux_259_nl = MUX_s_1_2_2(mux_258_nl, nor_243_nl, fsm_output[5]);
  assign and_382_nl = (~((fsm_output[7]) | (~ (fsm_output[1])))) & mux_259_nl;
  assign mux_261_nl = MUX_s_1_2_2(mux_260_nl, and_382_nl, fsm_output[2]);
  assign or_296_nl = (fsm_output[6]) | (~ (fsm_output[4])) | (fsm_output[3]);
  assign or_295_nl = (~ (fsm_output[6])) | (~ (fsm_output[4])) | (fsm_output[3]);
  assign mux_256_nl = MUX_s_1_2_2(or_296_nl, or_295_nl, fsm_output[5]);
  assign nor_244_nl = ~((fsm_output[1]) | mux_256_nl);
  assign nor_245_nl = ~((~ (fsm_output[1])) | (fsm_output[5]) | (fsm_output[6]) |
      (fsm_output[4]) | (~ (fsm_output[3])));
  assign mux_257_nl = MUX_s_1_2_2(nor_244_nl, nor_245_nl, fsm_output[7]);
  assign and_383_nl = (fsm_output[2]) & mux_257_nl;
  assign mux_262_nl = MUX_s_1_2_2(mux_261_nl, and_383_nl, fsm_output[0]);
  assign nand_26_nl = ~((fsm_output[5]) & (~ mux_tmp_263));
  assign mux_268_nl = MUX_s_1_2_2((fsm_output[6]), (~ (fsm_output[6])), fsm_output[4]);
  assign nand_25_nl = ~((fsm_output[1]) & mux_268_nl);
  assign mux_269_nl = MUX_s_1_2_2(nand_25_nl, or_tmp_301, fsm_output[2]);
  assign or_314_nl = (fsm_output[5]) | mux_269_nl;
  assign mux_270_nl = MUX_s_1_2_2(nand_26_nl, or_314_nl, fsm_output[3]);
  assign or_313_nl = (fsm_output[5]) | (~ (fsm_output[2])) | (~ (fsm_output[1]))
      | (~ (fsm_output[4])) | (fsm_output[6]);
  assign mux_265_nl = MUX_s_1_2_2(or_tmp_295, or_tmp_301, fsm_output[2]);
  assign or_310_nl = (fsm_output[2]) | nand_95_cse;
  assign mux_266_nl = MUX_s_1_2_2(mux_265_nl, or_310_nl, fsm_output[5]);
  assign mux_267_nl = MUX_s_1_2_2(or_313_nl, mux_266_nl, fsm_output[3]);
  assign mux_271_nl = MUX_s_1_2_2(mux_270_nl, mux_267_nl, fsm_output[0]);
  assign or_309_nl = (fsm_output[6:2]!=5'b01011);
  assign or_308_nl = (fsm_output[3]) | (fsm_output[5]) | mux_tmp_263;
  assign mux_264_nl = MUX_s_1_2_2(or_309_nl, or_308_nl, fsm_output[0]);
  assign mux_272_nl = MUX_s_1_2_2(mux_271_nl, mux_264_nl, fsm_output[7]);
  assign or_321_nl = (fsm_output[1]) | (fsm_output[7]) | (fsm_output[6]) | (fsm_output[2]);
  assign mux_276_nl = MUX_s_1_2_2(mux_tmp_273, or_321_nl, fsm_output[3]);
  assign or_320_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (~ (fsm_output[6]))
      | (fsm_output[2]);
  assign mux_277_nl = MUX_s_1_2_2(mux_276_nl, or_320_nl, fsm_output[5]);
  assign and_379_nl = (fsm_output[4]) & (~ mux_277_nl);
  assign nor_238_nl = ~((~ (fsm_output[3])) | (~ (fsm_output[1])) | (fsm_output[7])
      | (~ (fsm_output[6])) | (fsm_output[2]));
  assign and_380_nl = (fsm_output[3]) & (~ mux_tmp_273);
  assign mux_274_nl = MUX_s_1_2_2(nor_238_nl, and_380_nl, fsm_output[5]);
  assign nor_239_nl = ~((~ (fsm_output[5])) | (fsm_output[3]) | (fsm_output[7]) |
      (fsm_output[6]) | (fsm_output[2]));
  assign mux_275_nl = MUX_s_1_2_2(mux_274_nl, nor_239_nl, fsm_output[4]);
  assign mux_278_nl = MUX_s_1_2_2(and_379_nl, mux_275_nl, fsm_output[0]);
  assign or_326_nl = (~ (fsm_output[3])) | (~ (fsm_output[0])) | (fsm_output[7]);
  assign mux_281_nl = MUX_s_1_2_2(not_tmp_173, or_325_cse, fsm_output[3]);
  assign mux_282_nl = MUX_s_1_2_2(or_326_nl, mux_281_nl, fsm_output[1]);
  assign or_324_nl = (fsm_output[0]) | (fsm_output[7]);
  assign mux_279_nl = MUX_s_1_2_2(not_tmp_173, or_324_nl, fsm_output[3]);
  assign or_323_nl = (fsm_output[3]) | (fsm_output[0]) | (~ (fsm_output[7]));
  assign mux_280_nl = MUX_s_1_2_2(mux_279_nl, or_323_nl, fsm_output[1]);
  assign mux_283_nl = MUX_s_1_2_2(mux_282_nl, mux_280_nl, fsm_output[2]);
  assign nor_345_nl = ~(mux_283_nl | (fsm_output[6:4]!=3'b010));
  assign and_378_nl = (fsm_output[1]) & (~ mux_tmp_201);
  assign nor_237_nl = ~((fsm_output[1]) | mux_tmp_137);
  assign mux_284_nl = MUX_s_1_2_2(and_378_nl, nor_237_nl, fsm_output[2]);
  assign and_207_nl = mux_284_nl & and_dcpl_101;
  assign nor_236_nl = ~((fsm_output[1]) | (fsm_output[3]) | (fsm_output[0]) | (fsm_output[4])
      | (~ (fsm_output[5])));
  assign and_377_nl = (fsm_output[1]) & (fsm_output[3]) & (fsm_output[0]) & (fsm_output[4])
      & (~ (fsm_output[5]));
  assign mux_285_nl = MUX_s_1_2_2(nor_236_nl, and_377_nl, fsm_output[2]);
  assign and_209_nl = mux_285_nl & (fsm_output[7:6]==2'b01);
  assign nl_mult_z_mul_cmp_a = MUX1HOT_v_32_8_2(mult_x_1_sva, mult_x_16_sva, mult_x_15_sva,
      operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm, operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm,
      yy_rsci_q_d, xx_rsci_q_d, (mult_z_mul_cmp_z[51:20]), {(~ mux_248_nl) , mux_255_nl
      , mux_262_nl , (~ mux_272_nl) , mux_278_nl , nor_345_nl , and_207_nl , and_209_nl});
  wire[0:0] mux_290_nl;
  wire[0:0] and_376_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] nor_231_nl;
  wire[0:0] nor_232_nl;
  wire[0:0] mux_288_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] nor_233_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] or_336_nl;
  wire[0:0] nor_234_nl;
  wire[0:0] nor_235_nl;
  wire[0:0] mux_300_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] mux_298_nl;
  wire[0:0] or_354_nl;
  wire[0:0] or_353_nl;
  wire[0:0] mux_297_nl;
  wire[0:0] mux_296_nl;
  wire[0:0] or_349_nl;
  wire[0:0] mux_295_nl;
  wire[0:0] mux_294_nl;
  wire[0:0] or_347_nl;
  wire[0:0] or_346_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] or_344_nl;
  wire[0:0] or_343_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] nand_93_nl;
  wire[0:0] or_342_nl;
  wire[0:0] mux_309_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] nand_31_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] or_364_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] or_362_nl;
  wire[0:0] or_361_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] or_358_nl;
  wire[0:0] or_357_nl;
  wire[0:0] or_356_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] nor_228_nl;
  wire[0:0] nor_229_nl;
  wire[0:0] nor_230_nl;
  wire[0:0] mux_312_nl;
  wire[0:0] or_368_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] mux_310_nl;
  wire[0:0] or_367_nl;
  wire[0:0] or_366_nl;
  wire[0:0] or_365_nl;
  wire[0:0] mux_319_nl;
  wire[0:0] nor_226_nl;
  wire[0:0] mux_318_nl;
  wire[0:0] nand_32_nl;
  wire[0:0] mux_317_nl;
  wire[0:0] or_382_nl;
  wire[0:0] or_381_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] nand_90_nl;
  wire[0:0] nor_227_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] or_377_nl;
  wire[0:0] or_375_nl;
  wire[0:0] mux_324_nl;
  wire[0:0] mux_323_nl;
  wire[0:0] nor_222_nl;
  wire[0:0] nor_223_nl;
  wire[0:0] and_375_nl;
  wire[0:0] mux_322_nl;
  wire[0:0] nor_224_nl;
  wire[0:0] mux_321_nl;
  wire[0:0] or_386_nl;
  wire[0:0] nor_225_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] mux_340_nl;
  wire[0:0] or_404_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] mux_336_nl;
  wire[0:0] mux_335_nl;
  wire[0:0] mux_334_nl;
  wire[0:0] or_402_nl;
  wire[0:0] mux_333_nl;
  wire[0:0] mux_332_nl;
  wire[0:0] mux_331_nl;
  wire[0:0] mux_329_nl;
  wire[0:0] or_394_nl;
  wire[0:0] mux_326_nl;
  wire[0:0] and_210_nl;
  wire [31:0] nl_mult_z_mul_cmp_b;
  assign nor_231_nl = ~((fsm_output[7]) | (~ (fsm_output[4])) | (~ (fsm_output[6]))
      | (fsm_output[3]));
  assign nor_232_nl = ~((fsm_output[7]) | (fsm_output[4]) | (fsm_output[6]) | (~
      (fsm_output[3])));
  assign mux_289_nl = MUX_s_1_2_2(nor_231_nl, nor_232_nl, fsm_output[0]);
  assign and_376_nl = (~((fsm_output[2]) | (~ (fsm_output[5])))) & mux_289_nl;
  assign or_336_nl = (fsm_output[4]) | (~ (fsm_output[6])) | (fsm_output[3]);
  assign mux_286_nl = MUX_s_1_2_2(or_336_nl, or_335_cse, fsm_output[7]);
  assign nor_233_nl = ~((fsm_output[0]) | mux_286_nl);
  assign nor_234_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[7])) | (fsm_output[4])
      | (fsm_output[6]) | (fsm_output[3]));
  assign mux_287_nl = MUX_s_1_2_2(nor_233_nl, nor_234_nl, fsm_output[5]);
  assign nor_235_nl = ~((fsm_output[5]) | (~ (fsm_output[0])) | (fsm_output[7]) |
      (fsm_output[4]) | (fsm_output[6]) | (~ (fsm_output[3])));
  assign mux_288_nl = MUX_s_1_2_2(mux_287_nl, nor_235_nl, fsm_output[2]);
  assign mux_290_nl = MUX_s_1_2_2(and_376_nl, mux_288_nl, fsm_output[1]);
  assign or_354_nl = (fsm_output[1]) | (~ (fsm_output[7])) | (~ (fsm_output[2]))
      | (~ (fsm_output[5])) | (fsm_output[6]);
  assign or_353_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (fsm_output[2]) | (fsm_output[5])
      | (~ (fsm_output[6]));
  assign mux_298_nl = MUX_s_1_2_2(or_354_nl, or_353_nl, fsm_output[0]);
  assign or_349_nl = (fsm_output[7]) | (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[6]);
  assign mux_296_nl = MUX_s_1_2_2(or_351_cse, or_349_nl, fsm_output[1]);
  assign or_347_nl = (~ (fsm_output[2])) | (~ (fsm_output[5])) | (fsm_output[6]);
  assign mux_294_nl = MUX_s_1_2_2(or_347_nl, or_tmp_334, fsm_output[7]);
  assign mux_295_nl = MUX_s_1_2_2(or_348_cse, mux_294_nl, fsm_output[1]);
  assign mux_297_nl = MUX_s_1_2_2(mux_296_nl, mux_295_nl, fsm_output[0]);
  assign mux_299_nl = MUX_s_1_2_2(mux_298_nl, mux_297_nl, fsm_output[3]);
  assign or_344_nl = (fsm_output[7]) | (~((fsm_output[2]) & (fsm_output[5]) & (fsm_output[6])));
  assign mux_292_nl = MUX_s_1_2_2(or_tmp_334, or_344_nl, fsm_output[1]);
  assign nand_93_nl = ~((fsm_output[6:5]==2'b11));
  assign or_342_nl = (fsm_output[6:5]!=2'b00);
  assign mux_291_nl = MUX_s_1_2_2(nand_93_nl, or_342_nl, fsm_output[2]);
  assign or_343_nl = (fsm_output[1]) | (fsm_output[7]) | mux_291_nl;
  assign mux_293_nl = MUX_s_1_2_2(mux_292_nl, or_343_nl, fsm_output[0]);
  assign or_346_nl = (fsm_output[3]) | mux_293_nl;
  assign mux_300_nl = MUX_s_1_2_2(mux_299_nl, or_346_nl, fsm_output[4]);
  assign or_364_nl = (fsm_output[7]) | (~ (fsm_output[3])) | (fsm_output[4]);
  assign mux_306_nl = MUX_s_1_2_2(or_tmp_352, or_364_nl, fsm_output[5]);
  assign nand_31_nl = ~((fsm_output[2]) & (~ mux_306_nl));
  assign or_362_nl = (~ (fsm_output[7])) | (fsm_output[3]) | (fsm_output[4]);
  assign mux_304_nl = MUX_s_1_2_2(or_tmp_352, or_362_nl, fsm_output[5]);
  assign mux_305_nl = MUX_s_1_2_2(or_tmp_349, mux_304_nl, fsm_output[2]);
  assign mux_307_nl = MUX_s_1_2_2(nand_31_nl, mux_305_nl, fsm_output[0]);
  assign or_361_nl = (~ (fsm_output[2])) | (fsm_output[5]) | (fsm_output[7]) | (fsm_output[3])
      | (fsm_output[4]);
  assign mux_308_nl = MUX_s_1_2_2(mux_307_nl, or_361_nl, fsm_output[6]);
  assign or_358_nl = (~ (fsm_output[5])) | (~ (fsm_output[7])) | (fsm_output[3])
      | (fsm_output[4]);
  assign mux_301_nl = MUX_s_1_2_2(or_tmp_349, or_358_nl, fsm_output[2]);
  assign or_357_nl = (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[7]) | (~
      (fsm_output[3])) | (fsm_output[4]);
  assign mux_302_nl = MUX_s_1_2_2(mux_301_nl, or_357_nl, fsm_output[0]);
  assign or_356_nl = (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[3])
      | (~ (fsm_output[4]));
  assign mux_303_nl = MUX_s_1_2_2(mux_302_nl, or_356_nl, fsm_output[6]);
  assign mux_309_nl = MUX_s_1_2_2(mux_308_nl, mux_303_nl, fsm_output[1]);
  assign nor_228_nl = ~((~ (fsm_output[0])) | (fsm_output[5]) | (fsm_output[7]) |
      not_tmp_188);
  assign nor_229_nl = ~((fsm_output[0]) | (~ (fsm_output[5])) | (~ (fsm_output[7]))
      | (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[6]));
  assign mux_313_nl = MUX_s_1_2_2(nor_228_nl, nor_229_nl, fsm_output[3]);
  assign or_368_nl = (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[1]) | (fsm_output[2])
      | (fsm_output[6]);
  assign or_367_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[6]);
  assign or_366_nl = (fsm_output[1]) | (fsm_output[2]) | (fsm_output[6]);
  assign mux_310_nl = MUX_s_1_2_2(or_367_nl, or_366_nl, fsm_output[7]);
  assign or_365_nl = (fsm_output[7]) | not_tmp_188;
  assign mux_311_nl = MUX_s_1_2_2(mux_310_nl, or_365_nl, fsm_output[5]);
  assign mux_312_nl = MUX_s_1_2_2(or_368_nl, mux_311_nl, fsm_output[0]);
  assign nor_230_nl = ~((fsm_output[3]) | mux_312_nl);
  assign mux_314_nl = MUX_s_1_2_2(mux_313_nl, nor_230_nl, fsm_output[4]);
  assign or_382_nl = (~ (fsm_output[6])) | (fsm_output[2]);
  assign mux_317_nl = MUX_s_1_2_2(or_382_nl, or_tmp_369, fsm_output[5]);
  assign nand_32_nl = ~((fsm_output[0]) & (fsm_output[3]) & (~ mux_317_nl));
  assign nand_90_nl = ~((fsm_output[6]) & (fsm_output[2]));
  assign mux_316_nl = MUX_s_1_2_2(or_tmp_369, nand_90_nl, fsm_output[5]);
  assign or_381_nl = (fsm_output[0]) | (fsm_output[3]) | mux_316_nl;
  assign mux_318_nl = MUX_s_1_2_2(nand_32_nl, or_381_nl, fsm_output[4]);
  assign nor_226_nl = ~((fsm_output[7]) | mux_318_nl);
  assign or_377_nl = (~ (fsm_output[3])) | (fsm_output[5]) | (fsm_output[6]) | (~
      (fsm_output[2]));
  assign or_375_nl = (fsm_output[3]) | (~ (fsm_output[5])) | (fsm_output[6]) | (~
      (fsm_output[2]));
  assign mux_315_nl = MUX_s_1_2_2(or_377_nl, or_375_nl, fsm_output[0]);
  assign nor_227_nl = ~((~ (fsm_output[7])) | (fsm_output[4]) | mux_315_nl);
  assign mux_319_nl = MUX_s_1_2_2(nor_226_nl, nor_227_nl, fsm_output[1]);
  assign nor_222_nl = ~((~ (fsm_output[7])) | (fsm_output[0]) | (~ (fsm_output[5]))
      | (~ (fsm_output[3])) | (fsm_output[4]) | (fsm_output[6]));
  assign nor_223_nl = ~((fsm_output[7]) | (~ (fsm_output[0])) | (~ (fsm_output[5]))
      | (fsm_output[3]) | nand_95_cse);
  assign mux_323_nl = MUX_s_1_2_2(nor_222_nl, nor_223_nl, fsm_output[2]);
  assign or_386_nl = (fsm_output[3]) | mux_320_cse;
  assign mux_321_nl = MUX_s_1_2_2(or_386_nl, or_335_cse, fsm_output[5]);
  assign nor_224_nl = ~((fsm_output[0]) | mux_321_nl);
  assign nor_225_nl = ~((~ (fsm_output[0])) | (fsm_output[5]) | (~ (fsm_output[3]))
      | (fsm_output[4]) | (fsm_output[6]));
  assign mux_322_nl = MUX_s_1_2_2(nor_224_nl, nor_225_nl, fsm_output[7]);
  assign and_375_nl = (fsm_output[2]) & mux_322_nl;
  assign mux_324_nl = MUX_s_1_2_2(mux_323_nl, and_375_nl, fsm_output[1]);
  assign or_404_nl = (~ (fsm_output[3])) | (~ (fsm_output[4])) | (fsm_output[7])
      | (fsm_output[6]);
  assign mux_340_nl = MUX_s_1_2_2(or_404_nl, mux_tmp_330, fsm_output[2]);
  assign mux_337_nl = MUX_s_1_2_2(or_900_cse, or_888_cse, fsm_output[3]);
  assign mux_336_nl = MUX_s_1_2_2(or_889_cse, or_403_cse, fsm_output[3]);
  assign mux_338_nl = MUX_s_1_2_2(mux_337_nl, mux_336_nl, fsm_output[2]);
  assign mux_339_nl = MUX_s_1_2_2(mux_338_nl, mux_tmp_328, fsm_output[0]);
  assign mux_341_nl = MUX_s_1_2_2(mux_340_nl, mux_339_nl, fsm_output[5]);
  assign mux_332_nl = MUX_s_1_2_2(or_467_cse, or_401_cse, fsm_output[4]);
  assign mux_333_nl = MUX_s_1_2_2(or_964_cse, mux_332_nl, fsm_output[3]);
  assign or_402_nl = (fsm_output[2]) | mux_333_nl;
  assign mux_331_nl = MUX_s_1_2_2(mux_tmp_330, mux_tmp_327, fsm_output[2]);
  assign mux_334_nl = MUX_s_1_2_2(or_402_nl, mux_331_nl, fsm_output[0]);
  assign mux_326_nl = MUX_s_1_2_2(or_889_cse, mux_325_cse, fsm_output[3]);
  assign or_394_nl = (fsm_output[2]) | mux_326_nl;
  assign mux_329_nl = MUX_s_1_2_2(mux_tmp_328, or_394_nl, fsm_output[0]);
  assign mux_335_nl = MUX_s_1_2_2(mux_334_nl, mux_329_nl, fsm_output[5]);
  assign mux_342_nl = MUX_s_1_2_2(mux_341_nl, mux_335_nl, fsm_output[1]);
  assign and_210_nl = and_dcpl_70 & and_dcpl_123;
  assign nl_mult_z_mul_cmp_b = MUX1HOT_v_32_9_2(twiddle_h_rsci_s_din_mxwt, butterFly_10_tw_asn_itm,
      twiddle_rsci_s_din_mxwt, butterFly_14_tw_h_asn_itm, butterFly_10_tw_h_asn_itm,
      butterFly_13_tw_h_asn_itm, m_sva, ({{12{tw_h_rsci_s_din_mxwt[19]}}, tw_h_rsci_s_din_mxwt}),
      ({{12{S34_OUTER_LOOP_for_tf_h_sva[19]}}, S34_OUTER_LOOP_for_tf_h_sva}), {mux_290_nl
      , (~ mux_300_nl) , (~ mux_309_nl) , mux_314_nl , mux_319_nl , mux_324_nl ,
      (~ mux_342_nl) , and_210_nl , and_dcpl_194});
  wire[0:0] operator_33_true_operator_33_true_and_nl;
  wire[0:0] operator_33_true_mux_nl;
  wire [3:0] nl_operator_33_true_1_lshift_rg_s;
  assign operator_33_true_operator_33_true_and_nl = (S2_INNER_LOOP1_r_4_2_sva_1_0[0])
      & (~ and_441_ssc);
  assign operator_33_true_mux_nl = MUX_s_1_2_2(S2_OUTER_LOOP_c_1_sva, (~ S2_OUTER_LOOP_c_1_sva),
      and_441_ssc);
  assign nl_operator_33_true_1_lshift_rg_s = {1'b0 , operator_33_true_operator_33_true_and_nl
      , operator_33_true_mux_nl , and_441_ssc};
  wire [0:0] nl_hybrid_core_wait_dp_inst_ensig_cgo_iro_1;
  assign nl_hybrid_core_wait_dp_inst_ensig_cgo_iro_1 = ~ mux_235_itm;
  wire [9:0] nl_hybrid_core_x_rsci_inst_x_rsci_s_raddr_core;
  assign nl_hybrid_core_x_rsci_inst_x_rsci_s_raddr_core = {x_rsci_s_raddr_core_9_5
      , x_rsci_s_raddr_core_4_0};
  wire [9:0] nl_hybrid_core_x_rsci_inst_x_rsci_s_waddr_core;
  assign nl_hybrid_core_x_rsci_inst_x_rsci_s_waddr_core = {x_rsci_s_waddr_core_9_5
      , x_rsci_s_waddr_core_4_0};
  wire [4:0] nl_hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core;
  assign nl_hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core = {1'b0 , reg_twiddle_rsci_s_raddr_core_3_cse
      , reg_twiddle_rsci_s_raddr_core_2_cse , reg_twiddle_rsci_s_raddr_core_1_cse
      , reg_twiddle_rsci_s_raddr_core_0_cse};
  wire [4:0] nl_hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core;
  assign nl_hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core = {1'b0 ,
      reg_twiddle_rsci_s_raddr_core_3_cse , reg_twiddle_rsci_s_raddr_core_2_cse ,
      reg_twiddle_rsci_s_raddr_core_1_cse , reg_twiddle_rsci_s_raddr_core_0_cse};
  wire [0:0] nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_4_tr0;
  assign nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_4_tr0 = ~ operator_20_true_1_slc_operator_20_true_1_acc_14_itm;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0 = S1_OUTER_LOOP_k_5_0_sva_2[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0 = S1_OUTER_LOOP_k_5_0_sva_2[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_24_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_24_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0 = z_out_2[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_23_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_23_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0 = and_dcpl_14;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1 = ~ (z_out_2[2]);
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_23_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_23_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0 = z_out_2[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_12_tr0;
  assign nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_12_tr0 = ~ operator_20_true_8_slc_operator_20_true_8_acc_14_itm;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0 = S1_OUTER_LOOP_k_5_0_sva_2[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0 = S1_OUTER_LOOP_k_5_0_sva_2[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_24_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_24_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0 = z_out_2[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_23_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_23_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0 = and_dcpl_14;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1 = ~ (z_out_2[2]);
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_23_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_23_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0 = z_out_2[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0;
  assign nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0 = ~ operator_20_true_15_slc_operator_20_true_15_acc_14_itm;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0 = S1_OUTER_LOOP_k_5_0_sva_2[5];
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_mul_pipe #(.width_a(32'sd20),
  .signd_a(32'sd1),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_12_z_mul_cmp (
      .a(nl_mult_12_z_mul_cmp_a[19:0]),
      .b(nl_mult_12_z_mul_cmp_b[31:0]),
      .clk(clk),
      .en(mult_12_z_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_12_z_mul_cmp_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd52),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp (
      .a(nl_mult_z_mul_cmp_a[31:0]),
      .b(nl_mult_z_mul_cmp_b[31:0]),
      .clk(clk),
      .en(mult_z_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_z)
    );
  mgc_shift_bl_v5 #(.width_a(32'sd1),
  .signd_a(32'sd1),
  .width_s(32'sd4),
  .width_z(32'sd4)) operator_33_true_1_lshift_rg (
      .a(1'b1),
      .s(nl_operator_33_true_1_lshift_rg_s[3:0]),
      .z(z_out)
    );
  hybrid_core_wait_dp hybrid_core_wait_dp_inst (
      .clk(clk),
      .xx_rsc_cgo_iro(mux_127_rmff),
      .xx_rsci_clken_d(xx_rsci_clken_d),
      .yy_rsc_cgo_iro(mux_185_rmff),
      .yy_rsci_clken_d(yy_rsci_clken_d),
      .ensig_cgo_iro(and_200_rmff),
      .S34_OUTER_LOOP_for_tf_mul_cmp_z(S34_OUTER_LOOP_for_tf_mul_cmp_z),
      .ensig_cgo_iro_1(nl_hybrid_core_wait_dp_inst_ensig_cgo_iro_1[0:0]),
      .core_wen(core_wen),
      .xx_rsc_cgo(reg_xx_rsc_cgo_cse),
      .yy_rsc_cgo(reg_yy_rsc_cgo_cse),
      .ensig_cgo(reg_ensig_cgo_cse),
      .mult_12_z_mul_cmp_en(mult_12_z_mul_cmp_en),
      .S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg(S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg),
      .ensig_cgo_1(reg_ensig_cgo_1_cse),
      .mult_z_mul_cmp_en(mult_z_mul_cmp_en)
    );
  hybrid_core_x_rsci hybrid_core_x_rsci_inst (
      .clk(clk),
      .rst(rst),
      .x_rsc_s_tdone(x_rsc_s_tdone),
      .x_rsc_tr_write_done(x_rsc_tr_write_done),
      .x_rsc_RREADY(x_rsc_RREADY),
      .x_rsc_RVALID(x_rsc_RVALID),
      .x_rsc_RUSER(x_rsc_RUSER),
      .x_rsc_RLAST(x_rsc_RLAST),
      .x_rsc_RRESP(x_rsc_RRESP),
      .x_rsc_RDATA(x_rsc_RDATA),
      .x_rsc_RID(x_rsc_RID),
      .x_rsc_ARREADY(x_rsc_ARREADY),
      .x_rsc_ARVALID(x_rsc_ARVALID),
      .x_rsc_ARUSER(x_rsc_ARUSER),
      .x_rsc_ARREGION(x_rsc_ARREGION),
      .x_rsc_ARQOS(x_rsc_ARQOS),
      .x_rsc_ARPROT(x_rsc_ARPROT),
      .x_rsc_ARCACHE(x_rsc_ARCACHE),
      .x_rsc_ARLOCK(x_rsc_ARLOCK),
      .x_rsc_ARBURST(x_rsc_ARBURST),
      .x_rsc_ARSIZE(x_rsc_ARSIZE),
      .x_rsc_ARLEN(x_rsc_ARLEN),
      .x_rsc_ARADDR(x_rsc_ARADDR),
      .x_rsc_ARID(x_rsc_ARID),
      .x_rsc_BREADY(x_rsc_BREADY),
      .x_rsc_BVALID(x_rsc_BVALID),
      .x_rsc_BUSER(x_rsc_BUSER),
      .x_rsc_BRESP(x_rsc_BRESP),
      .x_rsc_BID(x_rsc_BID),
      .x_rsc_WREADY(x_rsc_WREADY),
      .x_rsc_WVALID(x_rsc_WVALID),
      .x_rsc_WUSER(x_rsc_WUSER),
      .x_rsc_WLAST(x_rsc_WLAST),
      .x_rsc_WSTRB(x_rsc_WSTRB),
      .x_rsc_WDATA(x_rsc_WDATA),
      .x_rsc_AWREADY(x_rsc_AWREADY),
      .x_rsc_AWVALID(x_rsc_AWVALID),
      .x_rsc_AWUSER(x_rsc_AWUSER),
      .x_rsc_AWREGION(x_rsc_AWREGION),
      .x_rsc_AWQOS(x_rsc_AWQOS),
      .x_rsc_AWPROT(x_rsc_AWPROT),
      .x_rsc_AWCACHE(x_rsc_AWCACHE),
      .x_rsc_AWLOCK(x_rsc_AWLOCK),
      .x_rsc_AWBURST(x_rsc_AWBURST),
      .x_rsc_AWSIZE(x_rsc_AWSIZE),
      .x_rsc_AWLEN(x_rsc_AWLEN),
      .x_rsc_AWADDR(x_rsc_AWADDR),
      .x_rsc_AWID(x_rsc_AWID),
      .core_wen(core_wen),
      .x_rsci_oswt(reg_x_rsci_oswt_cse),
      .x_rsci_wen_comp(x_rsci_wen_comp),
      .x_rsci_oswt_1(reg_x_rsci_oswt_1_cse),
      .x_rsci_wen_comp_1(x_rsci_wen_comp_1),
      .x_rsci_s_raddr_core(nl_hybrid_core_x_rsci_inst_x_rsci_s_raddr_core[9:0]),
      .x_rsci_s_waddr_core(nl_hybrid_core_x_rsci_inst_x_rsci_s_waddr_core[9:0]),
      .x_rsci_s_din_mxwt(x_rsci_s_din_mxwt),
      .x_rsci_s_dout_core(x_rsci_s_dout_core)
    );
  hybrid_core_twiddle_rsci hybrid_core_twiddle_rsci_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_s_tdone(twiddle_rsc_s_tdone),
      .twiddle_rsc_tr_write_done(twiddle_rsc_tr_write_done),
      .twiddle_rsc_RREADY(twiddle_rsc_RREADY),
      .twiddle_rsc_RVALID(twiddle_rsc_RVALID),
      .twiddle_rsc_RUSER(twiddle_rsc_RUSER),
      .twiddle_rsc_RLAST(twiddle_rsc_RLAST),
      .twiddle_rsc_RRESP(twiddle_rsc_RRESP),
      .twiddle_rsc_RDATA(twiddle_rsc_RDATA),
      .twiddle_rsc_RID(twiddle_rsc_RID),
      .twiddle_rsc_ARREADY(twiddle_rsc_ARREADY),
      .twiddle_rsc_ARVALID(twiddle_rsc_ARVALID),
      .twiddle_rsc_ARUSER(twiddle_rsc_ARUSER),
      .twiddle_rsc_ARREGION(twiddle_rsc_ARREGION),
      .twiddle_rsc_ARQOS(twiddle_rsc_ARQOS),
      .twiddle_rsc_ARPROT(twiddle_rsc_ARPROT),
      .twiddle_rsc_ARCACHE(twiddle_rsc_ARCACHE),
      .twiddle_rsc_ARLOCK(twiddle_rsc_ARLOCK),
      .twiddle_rsc_ARBURST(twiddle_rsc_ARBURST),
      .twiddle_rsc_ARSIZE(twiddle_rsc_ARSIZE),
      .twiddle_rsc_ARLEN(twiddle_rsc_ARLEN),
      .twiddle_rsc_ARADDR(twiddle_rsc_ARADDR),
      .twiddle_rsc_ARID(twiddle_rsc_ARID),
      .twiddle_rsc_BREADY(twiddle_rsc_BREADY),
      .twiddle_rsc_BVALID(twiddle_rsc_BVALID),
      .twiddle_rsc_BUSER(twiddle_rsc_BUSER),
      .twiddle_rsc_BRESP(twiddle_rsc_BRESP),
      .twiddle_rsc_BID(twiddle_rsc_BID),
      .twiddle_rsc_WREADY(twiddle_rsc_WREADY),
      .twiddle_rsc_WVALID(twiddle_rsc_WVALID),
      .twiddle_rsc_WUSER(twiddle_rsc_WUSER),
      .twiddle_rsc_WLAST(twiddle_rsc_WLAST),
      .twiddle_rsc_WSTRB(twiddle_rsc_WSTRB),
      .twiddle_rsc_WDATA(twiddle_rsc_WDATA),
      .twiddle_rsc_AWREADY(twiddle_rsc_AWREADY),
      .twiddle_rsc_AWVALID(twiddle_rsc_AWVALID),
      .twiddle_rsc_AWUSER(twiddle_rsc_AWUSER),
      .twiddle_rsc_AWREGION(twiddle_rsc_AWREGION),
      .twiddle_rsc_AWQOS(twiddle_rsc_AWQOS),
      .twiddle_rsc_AWPROT(twiddle_rsc_AWPROT),
      .twiddle_rsc_AWCACHE(twiddle_rsc_AWCACHE),
      .twiddle_rsc_AWLOCK(twiddle_rsc_AWLOCK),
      .twiddle_rsc_AWBURST(twiddle_rsc_AWBURST),
      .twiddle_rsc_AWSIZE(twiddle_rsc_AWSIZE),
      .twiddle_rsc_AWLEN(twiddle_rsc_AWLEN),
      .twiddle_rsc_AWADDR(twiddle_rsc_AWADDR),
      .twiddle_rsc_AWID(twiddle_rsc_AWID),
      .core_wen(core_wen),
      .twiddle_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_rsci_wen_comp(twiddle_rsci_wen_comp),
      .twiddle_rsci_s_raddr_core(nl_hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core[4:0]),
      .twiddle_rsci_s_din_mxwt(twiddle_rsci_s_din_mxwt)
    );
  hybrid_core_twiddle_h_rsci hybrid_core_twiddle_h_rsci_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_s_tdone(twiddle_h_rsc_s_tdone),
      .twiddle_h_rsc_tr_write_done(twiddle_h_rsc_tr_write_done),
      .twiddle_h_rsc_RREADY(twiddle_h_rsc_RREADY),
      .twiddle_h_rsc_RVALID(twiddle_h_rsc_RVALID),
      .twiddle_h_rsc_RUSER(twiddle_h_rsc_RUSER),
      .twiddle_h_rsc_RLAST(twiddle_h_rsc_RLAST),
      .twiddle_h_rsc_RRESP(twiddle_h_rsc_RRESP),
      .twiddle_h_rsc_RDATA(twiddle_h_rsc_RDATA),
      .twiddle_h_rsc_RID(twiddle_h_rsc_RID),
      .twiddle_h_rsc_ARREADY(twiddle_h_rsc_ARREADY),
      .twiddle_h_rsc_ARVALID(twiddle_h_rsc_ARVALID),
      .twiddle_h_rsc_ARUSER(twiddle_h_rsc_ARUSER),
      .twiddle_h_rsc_ARREGION(twiddle_h_rsc_ARREGION),
      .twiddle_h_rsc_ARQOS(twiddle_h_rsc_ARQOS),
      .twiddle_h_rsc_ARPROT(twiddle_h_rsc_ARPROT),
      .twiddle_h_rsc_ARCACHE(twiddle_h_rsc_ARCACHE),
      .twiddle_h_rsc_ARLOCK(twiddle_h_rsc_ARLOCK),
      .twiddle_h_rsc_ARBURST(twiddle_h_rsc_ARBURST),
      .twiddle_h_rsc_ARSIZE(twiddle_h_rsc_ARSIZE),
      .twiddle_h_rsc_ARLEN(twiddle_h_rsc_ARLEN),
      .twiddle_h_rsc_ARADDR(twiddle_h_rsc_ARADDR),
      .twiddle_h_rsc_ARID(twiddle_h_rsc_ARID),
      .twiddle_h_rsc_BREADY(twiddle_h_rsc_BREADY),
      .twiddle_h_rsc_BVALID(twiddle_h_rsc_BVALID),
      .twiddle_h_rsc_BUSER(twiddle_h_rsc_BUSER),
      .twiddle_h_rsc_BRESP(twiddle_h_rsc_BRESP),
      .twiddle_h_rsc_BID(twiddle_h_rsc_BID),
      .twiddle_h_rsc_WREADY(twiddle_h_rsc_WREADY),
      .twiddle_h_rsc_WVALID(twiddle_h_rsc_WVALID),
      .twiddle_h_rsc_WUSER(twiddle_h_rsc_WUSER),
      .twiddle_h_rsc_WLAST(twiddle_h_rsc_WLAST),
      .twiddle_h_rsc_WSTRB(twiddle_h_rsc_WSTRB),
      .twiddle_h_rsc_WDATA(twiddle_h_rsc_WDATA),
      .twiddle_h_rsc_AWREADY(twiddle_h_rsc_AWREADY),
      .twiddle_h_rsc_AWVALID(twiddle_h_rsc_AWVALID),
      .twiddle_h_rsc_AWUSER(twiddle_h_rsc_AWUSER),
      .twiddle_h_rsc_AWREGION(twiddle_h_rsc_AWREGION),
      .twiddle_h_rsc_AWQOS(twiddle_h_rsc_AWQOS),
      .twiddle_h_rsc_AWPROT(twiddle_h_rsc_AWPROT),
      .twiddle_h_rsc_AWCACHE(twiddle_h_rsc_AWCACHE),
      .twiddle_h_rsc_AWLOCK(twiddle_h_rsc_AWLOCK),
      .twiddle_h_rsc_AWBURST(twiddle_h_rsc_AWBURST),
      .twiddle_h_rsc_AWSIZE(twiddle_h_rsc_AWSIZE),
      .twiddle_h_rsc_AWLEN(twiddle_h_rsc_AWLEN),
      .twiddle_h_rsc_AWADDR(twiddle_h_rsc_AWADDR),
      .twiddle_h_rsc_AWID(twiddle_h_rsc_AWID),
      .core_wen(core_wen),
      .twiddle_h_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_h_rsci_wen_comp(twiddle_h_rsci_wen_comp),
      .twiddle_h_rsci_s_raddr_core(nl_hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core[4:0]),
      .twiddle_h_rsci_s_din_mxwt(twiddle_h_rsci_s_din_mxwt)
    );
  hybrid_core_revArr_rsci hybrid_core_revArr_rsci_inst (
      .clk(clk),
      .rst(rst),
      .revArr_rsc_s_tdone(revArr_rsc_s_tdone),
      .revArr_rsc_tr_write_done(revArr_rsc_tr_write_done),
      .revArr_rsc_RREADY(revArr_rsc_RREADY),
      .revArr_rsc_RVALID(revArr_rsc_RVALID),
      .revArr_rsc_RUSER(revArr_rsc_RUSER),
      .revArr_rsc_RLAST(revArr_rsc_RLAST),
      .revArr_rsc_RRESP(revArr_rsc_RRESP),
      .revArr_rsc_RDATA(revArr_rsc_RDATA),
      .revArr_rsc_RID(revArr_rsc_RID),
      .revArr_rsc_ARREADY(revArr_rsc_ARREADY),
      .revArr_rsc_ARVALID(revArr_rsc_ARVALID),
      .revArr_rsc_ARUSER(revArr_rsc_ARUSER),
      .revArr_rsc_ARREGION(revArr_rsc_ARREGION),
      .revArr_rsc_ARQOS(revArr_rsc_ARQOS),
      .revArr_rsc_ARPROT(revArr_rsc_ARPROT),
      .revArr_rsc_ARCACHE(revArr_rsc_ARCACHE),
      .revArr_rsc_ARLOCK(revArr_rsc_ARLOCK),
      .revArr_rsc_ARBURST(revArr_rsc_ARBURST),
      .revArr_rsc_ARSIZE(revArr_rsc_ARSIZE),
      .revArr_rsc_ARLEN(revArr_rsc_ARLEN),
      .revArr_rsc_ARADDR(revArr_rsc_ARADDR),
      .revArr_rsc_ARID(revArr_rsc_ARID),
      .revArr_rsc_BREADY(revArr_rsc_BREADY),
      .revArr_rsc_BVALID(revArr_rsc_BVALID),
      .revArr_rsc_BUSER(revArr_rsc_BUSER),
      .revArr_rsc_BRESP(revArr_rsc_BRESP),
      .revArr_rsc_BID(revArr_rsc_BID),
      .revArr_rsc_WREADY(revArr_rsc_WREADY),
      .revArr_rsc_WVALID(revArr_rsc_WVALID),
      .revArr_rsc_WUSER(revArr_rsc_WUSER),
      .revArr_rsc_WLAST(revArr_rsc_WLAST),
      .revArr_rsc_WSTRB(revArr_rsc_WSTRB),
      .revArr_rsc_WDATA(revArr_rsc_WDATA),
      .revArr_rsc_AWREADY(revArr_rsc_AWREADY),
      .revArr_rsc_AWVALID(revArr_rsc_AWVALID),
      .revArr_rsc_AWUSER(revArr_rsc_AWUSER),
      .revArr_rsc_AWREGION(revArr_rsc_AWREGION),
      .revArr_rsc_AWQOS(revArr_rsc_AWQOS),
      .revArr_rsc_AWPROT(revArr_rsc_AWPROT),
      .revArr_rsc_AWCACHE(revArr_rsc_AWCACHE),
      .revArr_rsc_AWLOCK(revArr_rsc_AWLOCK),
      .revArr_rsc_AWBURST(revArr_rsc_AWBURST),
      .revArr_rsc_AWSIZE(revArr_rsc_AWSIZE),
      .revArr_rsc_AWLEN(revArr_rsc_AWLEN),
      .revArr_rsc_AWADDR(revArr_rsc_AWADDR),
      .revArr_rsc_AWID(revArr_rsc_AWID),
      .core_wen(core_wen),
      .revArr_rsci_oswt(reg_revArr_rsci_oswt_cse),
      .revArr_rsci_wen_comp(revArr_rsci_wen_comp),
      .revArr_rsci_s_raddr_core(revArr_rsci_s_raddr_core),
      .revArr_rsci_s_din_mxwt(revArr_rsci_s_din_mxwt)
    );
  hybrid_core_tw_rsci hybrid_core_tw_rsci_inst (
      .clk(clk),
      .rst(rst),
      .tw_rsc_s_tdone(tw_rsc_s_tdone),
      .tw_rsc_tr_write_done(tw_rsc_tr_write_done),
      .tw_rsc_RREADY(tw_rsc_RREADY),
      .tw_rsc_RVALID(tw_rsc_RVALID),
      .tw_rsc_RUSER(tw_rsc_RUSER),
      .tw_rsc_RLAST(tw_rsc_RLAST),
      .tw_rsc_RRESP(tw_rsc_RRESP),
      .tw_rsc_RDATA(tw_rsc_RDATA),
      .tw_rsc_RID(tw_rsc_RID),
      .tw_rsc_ARREADY(tw_rsc_ARREADY),
      .tw_rsc_ARVALID(tw_rsc_ARVALID),
      .tw_rsc_ARUSER(tw_rsc_ARUSER),
      .tw_rsc_ARREGION(tw_rsc_ARREGION),
      .tw_rsc_ARQOS(tw_rsc_ARQOS),
      .tw_rsc_ARPROT(tw_rsc_ARPROT),
      .tw_rsc_ARCACHE(tw_rsc_ARCACHE),
      .tw_rsc_ARLOCK(tw_rsc_ARLOCK),
      .tw_rsc_ARBURST(tw_rsc_ARBURST),
      .tw_rsc_ARSIZE(tw_rsc_ARSIZE),
      .tw_rsc_ARLEN(tw_rsc_ARLEN),
      .tw_rsc_ARADDR(tw_rsc_ARADDR),
      .tw_rsc_ARID(tw_rsc_ARID),
      .tw_rsc_BREADY(tw_rsc_BREADY),
      .tw_rsc_BVALID(tw_rsc_BVALID),
      .tw_rsc_BUSER(tw_rsc_BUSER),
      .tw_rsc_BRESP(tw_rsc_BRESP),
      .tw_rsc_BID(tw_rsc_BID),
      .tw_rsc_WREADY(tw_rsc_WREADY),
      .tw_rsc_WVALID(tw_rsc_WVALID),
      .tw_rsc_WUSER(tw_rsc_WUSER),
      .tw_rsc_WLAST(tw_rsc_WLAST),
      .tw_rsc_WSTRB(tw_rsc_WSTRB),
      .tw_rsc_WDATA(tw_rsc_WDATA),
      .tw_rsc_AWREADY(tw_rsc_AWREADY),
      .tw_rsc_AWVALID(tw_rsc_AWVALID),
      .tw_rsc_AWUSER(tw_rsc_AWUSER),
      .tw_rsc_AWREGION(tw_rsc_AWREGION),
      .tw_rsc_AWQOS(tw_rsc_AWQOS),
      .tw_rsc_AWPROT(tw_rsc_AWPROT),
      .tw_rsc_AWCACHE(tw_rsc_AWCACHE),
      .tw_rsc_AWLOCK(tw_rsc_AWLOCK),
      .tw_rsc_AWBURST(tw_rsc_AWBURST),
      .tw_rsc_AWSIZE(tw_rsc_AWSIZE),
      .tw_rsc_AWLEN(tw_rsc_AWLEN),
      .tw_rsc_AWADDR(tw_rsc_AWADDR),
      .tw_rsc_AWID(tw_rsc_AWID),
      .core_wen(core_wen),
      .tw_rsci_oswt(reg_tw_rsci_oswt_cse),
      .tw_rsci_wen_comp(tw_rsci_wen_comp),
      .tw_rsci_s_raddr_core(reg_tw_rsci_s_raddr_core_cse),
      .tw_rsci_s_din_mxwt(tw_rsci_s_din_mxwt)
    );
  hybrid_core_tw_h_rsci hybrid_core_tw_h_rsci_inst (
      .clk(clk),
      .rst(rst),
      .tw_h_rsc_s_tdone(tw_h_rsc_s_tdone),
      .tw_h_rsc_tr_write_done(tw_h_rsc_tr_write_done),
      .tw_h_rsc_RREADY(tw_h_rsc_RREADY),
      .tw_h_rsc_RVALID(tw_h_rsc_RVALID),
      .tw_h_rsc_RUSER(tw_h_rsc_RUSER),
      .tw_h_rsc_RLAST(tw_h_rsc_RLAST),
      .tw_h_rsc_RRESP(tw_h_rsc_RRESP),
      .tw_h_rsc_RDATA(tw_h_rsc_RDATA),
      .tw_h_rsc_RID(tw_h_rsc_RID),
      .tw_h_rsc_ARREADY(tw_h_rsc_ARREADY),
      .tw_h_rsc_ARVALID(tw_h_rsc_ARVALID),
      .tw_h_rsc_ARUSER(tw_h_rsc_ARUSER),
      .tw_h_rsc_ARREGION(tw_h_rsc_ARREGION),
      .tw_h_rsc_ARQOS(tw_h_rsc_ARQOS),
      .tw_h_rsc_ARPROT(tw_h_rsc_ARPROT),
      .tw_h_rsc_ARCACHE(tw_h_rsc_ARCACHE),
      .tw_h_rsc_ARLOCK(tw_h_rsc_ARLOCK),
      .tw_h_rsc_ARBURST(tw_h_rsc_ARBURST),
      .tw_h_rsc_ARSIZE(tw_h_rsc_ARSIZE),
      .tw_h_rsc_ARLEN(tw_h_rsc_ARLEN),
      .tw_h_rsc_ARADDR(tw_h_rsc_ARADDR),
      .tw_h_rsc_ARID(tw_h_rsc_ARID),
      .tw_h_rsc_BREADY(tw_h_rsc_BREADY),
      .tw_h_rsc_BVALID(tw_h_rsc_BVALID),
      .tw_h_rsc_BUSER(tw_h_rsc_BUSER),
      .tw_h_rsc_BRESP(tw_h_rsc_BRESP),
      .tw_h_rsc_BID(tw_h_rsc_BID),
      .tw_h_rsc_WREADY(tw_h_rsc_WREADY),
      .tw_h_rsc_WVALID(tw_h_rsc_WVALID),
      .tw_h_rsc_WUSER(tw_h_rsc_WUSER),
      .tw_h_rsc_WLAST(tw_h_rsc_WLAST),
      .tw_h_rsc_WSTRB(tw_h_rsc_WSTRB),
      .tw_h_rsc_WDATA(tw_h_rsc_WDATA),
      .tw_h_rsc_AWREADY(tw_h_rsc_AWREADY),
      .tw_h_rsc_AWVALID(tw_h_rsc_AWVALID),
      .tw_h_rsc_AWUSER(tw_h_rsc_AWUSER),
      .tw_h_rsc_AWREGION(tw_h_rsc_AWREGION),
      .tw_h_rsc_AWQOS(tw_h_rsc_AWQOS),
      .tw_h_rsc_AWPROT(tw_h_rsc_AWPROT),
      .tw_h_rsc_AWCACHE(tw_h_rsc_AWCACHE),
      .tw_h_rsc_AWLOCK(tw_h_rsc_AWLOCK),
      .tw_h_rsc_AWBURST(tw_h_rsc_AWBURST),
      .tw_h_rsc_AWSIZE(tw_h_rsc_AWSIZE),
      .tw_h_rsc_AWLEN(tw_h_rsc_AWLEN),
      .tw_h_rsc_AWADDR(tw_h_rsc_AWADDR),
      .tw_h_rsc_AWID(tw_h_rsc_AWID),
      .core_wen(core_wen),
      .tw_h_rsci_oswt(reg_tw_rsci_oswt_cse),
      .tw_h_rsci_wen_comp(tw_h_rsci_wen_comp),
      .tw_h_rsci_s_raddr_core(reg_tw_rsci_s_raddr_core_cse),
      .tw_h_rsci_s_din_mxwt(tw_h_rsci_s_din_mxwt)
    );
  hybrid_core_x_rsc_triosy_obj hybrid_core_x_rsc_triosy_obj_inst (
      .x_rsc_triosy_lz(x_rsc_triosy_lz),
      .core_wten(core_wten),
      .x_rsc_triosy_obj_iswt0(reg_x_rsc_triosy_obj_iswt0_cse)
    );
  hybrid_core_m_rsc_triosy_obj hybrid_core_m_rsc_triosy_obj_inst (
      .m_rsc_triosy_lz(m_rsc_triosy_lz),
      .core_wten(core_wten),
      .m_rsc_triosy_obj_iswt0(reg_x_rsc_triosy_obj_iswt0_cse)
    );
  hybrid_core_twiddle_rsc_triosy_obj hybrid_core_twiddle_rsc_triosy_obj_inst (
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(reg_x_rsc_triosy_obj_iswt0_cse)
    );
  hybrid_core_twiddle_h_rsc_triosy_obj hybrid_core_twiddle_h_rsc_triosy_obj_inst
      (
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(reg_x_rsc_triosy_obj_iswt0_cse)
    );
  hybrid_core_revArr_rsc_triosy_obj hybrid_core_revArr_rsc_triosy_obj_inst (
      .revArr_rsc_triosy_lz(revArr_rsc_triosy_lz),
      .core_wten(core_wten),
      .revArr_rsc_triosy_obj_iswt0(reg_x_rsc_triosy_obj_iswt0_cse)
    );
  hybrid_core_tw_rsc_triosy_obj hybrid_core_tw_rsc_triosy_obj_inst (
      .tw_rsc_triosy_lz(tw_rsc_triosy_lz),
      .core_wten(core_wten),
      .tw_rsc_triosy_obj_iswt0(reg_x_rsc_triosy_obj_iswt0_cse)
    );
  hybrid_core_tw_h_rsc_triosy_obj hybrid_core_tw_h_rsc_triosy_obj_inst (
      .tw_h_rsc_triosy_lz(tw_h_rsc_triosy_lz),
      .core_wten(core_wten),
      .tw_h_rsc_triosy_obj_iswt0(reg_x_rsc_triosy_obj_iswt0_cse)
    );
  hybrid_core_staller hybrid_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .x_rsci_wen_comp(x_rsci_wen_comp),
      .x_rsci_wen_comp_1(x_rsci_wen_comp_1),
      .twiddle_rsci_wen_comp(twiddle_rsci_wen_comp),
      .twiddle_h_rsci_wen_comp(twiddle_h_rsci_wen_comp),
      .revArr_rsci_wen_comp(revArr_rsci_wen_comp),
      .tw_rsci_wen_comp(tw_rsci_wen_comp),
      .tw_h_rsci_wen_comp(tw_h_rsci_wen_comp)
    );
  hybrid_core_core_fsm hybrid_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output),
      .S1_OUTER_LOOP_for_C_4_tr0(nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_4_tr0[0:0]),
      .S1_OUTER_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0[0:0]),
      .S2_COPY_LOOP_for_C_3_tr0(nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0[0:0]),
      .S2_COPY_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0[0:0]),
      .S2_INNER_LOOP1_for_C_24_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_24_tr0[0:0]),
      .S2_INNER_LOOP1_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0[0:0]),
      .S2_INNER_LOOP2_for_C_23_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_23_tr0[0:0]),
      .S2_INNER_LOOP2_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0[0:0]),
      .S2_INNER_LOOP2_C_0_tr1(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1[0:0]),
      .S2_INNER_LOOP3_for_C_23_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_23_tr0[0:0]),
      .S2_INNER_LOOP3_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0[0:0]),
      .S34_OUTER_LOOP_for_C_12_tr0(nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_12_tr0[0:0]),
      .S34_OUTER_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0[0:0]),
      .S5_COPY_LOOP_for_C_3_tr0(nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0[0:0]),
      .S5_COPY_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0[0:0]),
      .S5_INNER_LOOP1_for_C_24_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_24_tr0[0:0]),
      .S5_INNER_LOOP1_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0[0:0]),
      .S5_INNER_LOOP2_for_C_23_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_23_tr0[0:0]),
      .S5_INNER_LOOP2_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0[0:0]),
      .S5_INNER_LOOP2_C_0_tr1(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1[0:0]),
      .S5_INNER_LOOP3_for_C_23_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_23_tr0[0:0]),
      .S5_INNER_LOOP3_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0[0:0]),
      .S6_OUTER_LOOP_for_C_3_tr0(nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0[0:0]),
      .S6_OUTER_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0[0:0])
    );
  assign S34_OUTER_LOOP_for_tf_mul_cmp_b = {S34_OUTER_LOOP_for_k_slc_S34_OUTER_LOOP_for_k_sva_19_5_4_0_1
      , S34_OUTER_LOOP_for_k_sva_4_0};
  assign or_35_cse = (fsm_output[2:1]!=2'b00);
  assign or_107_cse = (fsm_output[7]) | (fsm_output[2]);
  assign nand_116_cse = ~((fsm_output[5]) & (fsm_output[1]) & (~ (fsm_output[7]))
      & (fsm_output[2]));
  assign mux_123_nl = MUX_s_1_2_2(nor_tmp_27, mux_tmp_106, fsm_output[0]);
  assign mux_124_nl = MUX_s_1_2_2(not_tmp_90, mux_123_nl, fsm_output[3]);
  assign or_131_nl = (~ (fsm_output[0])) | (fsm_output[4]) | (fsm_output[5]);
  assign mux_121_nl = MUX_s_1_2_2(or_131_nl, (fsm_output[4]), fsm_output[2]);
  assign or_130_nl = (fsm_output[2]) | (fsm_output[4]);
  assign mux_122_nl = MUX_s_1_2_2(mux_121_nl, or_130_nl, fsm_output[3]);
  assign mux_125_nl = MUX_s_1_2_2(mux_124_nl, (~ mux_122_nl), fsm_output[6]);
  assign and_400_nl = (fsm_output[0]) & (fsm_output[4]) & (fsm_output[5]);
  assign mux_118_nl = MUX_s_1_2_2(not_tmp_90, and_400_nl, fsm_output[2]);
  assign nor_30_nl = ~((fsm_output[2]) | (~ (fsm_output[0])));
  assign mux_117_nl = MUX_s_1_2_2(mux_tmp_106, nor_tmp_27, nor_30_nl);
  assign mux_119_nl = MUX_s_1_2_2(mux_118_nl, mux_117_nl, fsm_output[3]);
  assign or_488_nl = (~ (fsm_output[2])) | (fsm_output[0]);
  assign mux_115_nl = MUX_s_1_2_2((fsm_output[4]), or_tmp_112, or_488_nl);
  assign and_401_nl = (fsm_output[2]) & (fsm_output[4]) & (fsm_output[5]);
  assign mux_116_nl = MUX_s_1_2_2((~ mux_115_nl), and_401_nl, fsm_output[3]);
  assign mux_120_nl = MUX_s_1_2_2(mux_119_nl, mux_116_nl, fsm_output[6]);
  assign mux_126_nl = MUX_s_1_2_2(mux_125_nl, mux_120_nl, fsm_output[1]);
  assign nand_114_nl = ~((~((fsm_output[0]) & (fsm_output[4]))) & (fsm_output[5]));
  assign mux_112_nl = MUX_s_1_2_2(nand_114_nl, mux_tmp_106, fsm_output[2]);
  assign mux_111_nl = MUX_s_1_2_2(nor_tmp_27, mux_tmp_106, or_125_cse);
  assign mux_113_nl = MUX_s_1_2_2(mux_112_nl, mux_111_nl, fsm_output[3]);
  assign nor_286_nl = ~((fsm_output[6]) | (~ mux_113_nl));
  assign mux_109_nl = MUX_s_1_2_2(mux_tmp_106, nor_tmp_27, and_403_cse);
  assign mux_107_nl = MUX_s_1_2_2(or_tmp_112, (~ mux_tmp_106), fsm_output[0]);
  assign mux_108_nl = MUX_s_1_2_2(mux_107_nl, or_tmp_112, fsm_output[2]);
  assign mux_110_nl = MUX_s_1_2_2((~ mux_109_nl), mux_108_nl, fsm_output[3]);
  assign nor_287_nl = ~((fsm_output[6]) | mux_110_nl);
  assign mux_114_nl = MUX_s_1_2_2(nor_286_nl, nor_287_nl, fsm_output[1]);
  assign mux_127_rmff = MUX_s_1_2_2(mux_126_nl, mux_114_nl, fsm_output[7]);
  assign or_1016_cse = and_950_cse | (fsm_output[2]);
  assign mux_182_nl = MUX_s_1_2_2(or_tmp_188, or_325_cse, fsm_output[1]);
  assign nor_270_nl = ~((fsm_output[6]) | mux_182_nl);
  assign mux_183_nl = MUX_s_1_2_2(nor_270_nl, nor_131_cse, fsm_output[4]);
  assign or_201_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (~ (fsm_output[7]));
  assign mux_180_nl = MUX_s_1_2_2(or_201_nl, or_tmp_188, fsm_output[1]);
  assign nor_272_nl = ~((fsm_output[6]) | (~ mux_180_nl));
  assign nor_274_nl = ~(and_357_cse | (fsm_output[7]));
  assign mux_179_nl = MUX_s_1_2_2(nor_248_cse, nor_274_nl, fsm_output[6]);
  assign mux_181_nl = MUX_s_1_2_2(nor_272_nl, mux_179_nl, fsm_output[4]);
  assign mux_184_nl = MUX_s_1_2_2(mux_183_nl, mux_181_nl, fsm_output[5]);
  assign nor_275_nl = ~((fsm_output[6]) | (fsm_output[1]) | (fsm_output[0]) | (fsm_output[2])
      | (fsm_output[7]));
  assign or_1014_nl = (or_442_cse & (fsm_output[2])) | (fsm_output[7]);
  assign nor_276_nl = ~((fsm_output[0]) | (fsm_output[7]));
  assign nor_277_nl = ~((fsm_output[2]) | (fsm_output[7]));
  assign mux_175_nl = MUX_s_1_2_2(nor_276_nl, nor_277_nl, fsm_output[1]);
  assign mux_176_nl = MUX_s_1_2_2(or_1014_nl, mux_175_nl, fsm_output[6]);
  assign mux_177_nl = MUX_s_1_2_2(nor_275_nl, mux_176_nl, fsm_output[4]);
  assign and_391_nl = or_1016_cse & (fsm_output[7]);
  assign or_189_nl = (~ (fsm_output[1])) | (fsm_output[7]);
  assign mux_174_nl = MUX_s_1_2_2(and_391_nl, or_189_nl, fsm_output[6]);
  assign nor_278_nl = ~((fsm_output[4]) | mux_174_nl);
  assign mux_178_nl = MUX_s_1_2_2(mux_177_nl, nor_278_nl, fsm_output[5]);
  assign mux_185_rmff = MUX_s_1_2_2(mux_184_nl, mux_178_nl, fsm_output[3]);
  assign or_210_cse = (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[3]));
  assign and_200_rmff = and_dcpl_192 & (fsm_output[4:2]==3'b111);
  assign mux_232_nl = MUX_s_1_2_2((~ (fsm_output[4])), nand_tmp_20, and_385_cse);
  assign mux_229_nl = MUX_s_1_2_2(nand_96_cse, (fsm_output[2]), fsm_output[4]);
  assign mux_230_nl = MUX_s_1_2_2(nand_tmp_20, mux_229_nl, fsm_output[0]);
  assign mux_228_nl = MUX_s_1_2_2(or_tmp_253, (fsm_output[4]), fsm_output[0]);
  assign mux_231_nl = MUX_s_1_2_2(mux_230_nl, mux_228_nl, fsm_output[5]);
  assign mux_233_nl = MUX_s_1_2_2(mux_232_nl, mux_231_nl, fsm_output[3]);
  assign or_267_nl = (fsm_output[4]) | (~ (fsm_output[2]));
  assign mux_225_nl = MUX_s_1_2_2(or_267_nl, or_tmp_253, fsm_output[0]);
  assign mux_226_nl = MUX_s_1_2_2(or_tmp_253, (~ mux_225_nl), fsm_output[5]);
  assign nor_251_nl = ~((~ (fsm_output[4])) | (fsm_output[2]));
  assign mux_224_nl = MUX_s_1_2_2(nor_251_nl, nand_tmp_20, fsm_output[5]);
  assign mux_227_nl = MUX_s_1_2_2(mux_226_nl, mux_224_nl, fsm_output[3]);
  assign mux_234_nl = MUX_s_1_2_2(mux_233_nl, mux_227_nl, fsm_output[6]);
  assign mux_220_nl = MUX_s_1_2_2((~ (fsm_output[2])), or_35_cse, fsm_output[4]);
  assign mux_221_nl = MUX_s_1_2_2(mux_220_nl, or_tmp_253, fsm_output[0]);
  assign mux_222_nl = MUX_s_1_2_2((~ (fsm_output[4])), mux_221_nl, fsm_output[5]);
  assign mux_219_nl = MUX_s_1_2_2(or_tmp_253, (fsm_output[4]), fsm_output[5]);
  assign mux_223_nl = MUX_s_1_2_2(mux_222_nl, mux_219_nl, fsm_output[3]);
  assign or_265_nl = (fsm_output[6]) | mux_223_nl;
  assign mux_235_itm = MUX_s_1_2_2(mux_234_nl, or_265_nl, fsm_output[7]);
  assign nand_95_cse = ~((fsm_output[4]) & (fsm_output[6]));
  assign nor_242_cse = ~((fsm_output[4:3]!=2'b00));
  assign nand_96_cse = ~((fsm_output[2:1]==2'b11));
  assign or_325_cse = (~ (fsm_output[0])) | (fsm_output[7]);
  assign nor_248_cse = ~((fsm_output[7]) | (fsm_output[0]) | (fsm_output[1]) | (fsm_output[2]));
  assign or_335_cse = (fsm_output[4]) | (fsm_output[6]) | (~ (fsm_output[3]));
  assign or_392_cse = (fsm_output[7:6]!=2'b10);
  assign or_401_cse = (fsm_output[7:6]!=2'b00);
  assign or_403_cse = (fsm_output[4]) | (~ (fsm_output[7])) | (fsm_output[6]);
  assign mux_320_cse = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[4]);
  assign or_351_cse = (fsm_output[7]) | (fsm_output[2]) | (fsm_output[5]) | (~ (fsm_output[6]));
  assign or_348_cse = (~ (fsm_output[7])) | (fsm_output[2]) | (~ (fsm_output[5]))
      | (fsm_output[6]);
  assign mux_325_cse = MUX_s_1_2_2(or_392_cse, or_467_cse, fsm_output[4]);
  assign and_357_cse = (fsm_output[2:0]==3'b111);
  assign or_442_cse = (fsm_output[1:0]!=2'b00);
  assign or_22_cse = (fsm_output[7:5]!=3'b100);
  assign or_28_cse = (~ (fsm_output[5])) | (fsm_output[7]);
  assign nand_111_cse = ~((fsm_output[5]) & (fsm_output[7]));
  assign nor_217_cse = ~((fsm_output[1:0]!=2'b00));
  assign nor_132_nl = ~((fsm_output[7:6]!=2'b10));
  assign nor_213_nl = ~((~ (fsm_output[2])) | (fsm_output[7]) | (fsm_output[6]));
  assign mux_349_nl = MUX_s_1_2_2(nor_132_nl, nor_213_nl, fsm_output[3]);
  assign nor_214_nl = ~((fsm_output[7:6]!=2'b00));
  assign mux_350_nl = MUX_s_1_2_2(mux_349_nl, nor_214_nl, fsm_output[4]);
  assign nor_215_nl = ~(and_357_cse | (fsm_output[7:6]!=2'b00));
  assign nor_216_nl = ~(nor_217_cse | (~ (fsm_output[2])) | (fsm_output[7]) | (~
      (fsm_output[6])));
  assign mux_347_nl = MUX_s_1_2_2(nor_215_nl, nor_216_nl, fsm_output[3]);
  assign mux_348_nl = MUX_s_1_2_2(mux_347_nl, nor_131_cse, fsm_output[4]);
  assign mux_351_ssc = MUX_s_1_2_2(mux_350_nl, mux_348_nl, fsm_output[5]);
  assign or_1011_nl = (fsm_output[2]) | (fsm_output[5]) | (fsm_output[0]) | (fsm_output[6]);
  assign nor_209_nl = ~((fsm_output[0]) | (fsm_output[6]));
  assign mux_357_nl = MUX_s_1_2_2(nor_209_nl, nor_tmp_58, fsm_output[5]);
  assign nand_87_nl = ~((S1_OUTER_LOOP_k_5_0_sva_2[5]) & (fsm_output[2]) & mux_357_nl);
  assign mux_358_nl = MUX_s_1_2_2(or_1011_nl, nand_87_nl, fsm_output[1]);
  assign or_1171_nl = (fsm_output[4]) | (fsm_output[7]) | mux_358_nl;
  assign nor_210_nl = ~((fsm_output[1]) | (fsm_output[2]) | (fsm_output[5]) | (~
      nor_tmp_58));
  assign nor_211_nl = ~((~ (fsm_output[1])) | (fsm_output[2]) | (~ (fsm_output[5]))
      | (fsm_output[0]) | (fsm_output[6]));
  assign mux_356_nl = MUX_s_1_2_2(nor_210_nl, nor_211_nl, fsm_output[7]);
  assign nand_151_nl = ~((fsm_output[4]) & mux_356_nl);
  assign mux_359_seb = MUX_s_1_2_2(or_1171_nl, nand_151_nl, fsm_output[3]);
  assign and_953_cse = (fsm_output[2:1]==2'b11);
  assign and_950_cse = (fsm_output[1:0]==2'b11);
  assign nor_488_cse = ~((~ (fsm_output[4])) | (~ (fsm_output[6])) | (fsm_output[7]));
  assign nor_494_cse = ~((fsm_output[4]) | (~ (fsm_output[6])) | (fsm_output[7]));
  assign nor_487_cse = ~((fsm_output[4]) | (fsm_output[6]) | (~ (fsm_output[7])));
  assign nor_304_cse = ~((fsm_output[2:1]!=2'b00));
  assign or_467_cse = (fsm_output[7:6]!=2'b01);
  assign or_46_cse = (fsm_output[2:0]!=3'b101);
  assign nor_301_nl = ~((fsm_output[0]) | (fsm_output[4]) | (fsm_output[7]) | (fsm_output[5]));
  assign mux_56_nl = MUX_s_1_2_2(nor_301_nl, nor_tmp_14, fsm_output[3]);
  assign S1_OUTER_LOOP_k_or_nl = (mux_56_nl & (~ (fsm_output[6])) & (fsm_output[1])
      & (fsm_output[2])) | and_dcpl_25;
  assign S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl = MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1[4:0]),
      (S1_OUTER_LOOP_k_5_0_sva_2[4:0]), S1_OUTER_LOOP_k_or_nl);
  assign mux_46_nl = MUX_s_1_2_2((~ (fsm_output[1])), and_953_cse, fsm_output[0]);
  assign or_1018_nl = (fsm_output[5]) | mux_46_nl;
  assign nand_109_nl = ~((fsm_output[5]) & or_46_cse);
  assign mux_47_nl = MUX_s_1_2_2(or_1018_nl, nand_109_nl, fsm_output[6]);
  assign nor_nl = ~((fsm_output[4]) | (fsm_output[7]) | mux_47_nl);
  assign nor_303_nl = ~(nor_304_cse | (fsm_output[6:5]!=2'b10));
  assign mux_44_nl = MUX_s_1_2_2((fsm_output[2]), (fsm_output[1]), fsm_output[0]);
  assign nor_309_nl = ~((fsm_output[6]) | (~((fsm_output[5]) & mux_44_nl)));
  assign mux_45_nl = MUX_s_1_2_2(nor_303_nl, nor_309_nl, fsm_output[7]);
  assign and_435_nl = (fsm_output[4]) & mux_45_nl;
  assign mux_48_nl = MUX_s_1_2_2(nor_nl, and_435_nl, fsm_output[3]);
  assign S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl
      = MUX_v_5_2_2(5'b00000, S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl, mux_48_nl);
  assign nl_S2_INNER_LOOP1_for_acc_nl = conv_u2s_5_6(S1_OUTER_LOOP_for_acc_cse_sva)
      + 6'b000001;
  assign S2_INNER_LOOP1_for_acc_nl = nl_S2_INNER_LOOP1_for_acc_nl[5:0];
  assign or_1032_nl = (fsm_output[0]) | (~ (fsm_output[5]));
  assign mux_379_nl = MUX_s_1_2_2(or_1031_cse, or_1032_nl, fsm_output[3]);
  assign or_1033_nl = (~ (fsm_output[3])) | (fsm_output[6]) | (~ (fsm_output[0]))
      | (fsm_output[5]);
  assign mux_380_nl = MUX_s_1_2_2(mux_379_nl, or_1033_nl, fsm_output[2]);
  assign nor_197_nl = ~((fsm_output[6]) | (~ (fsm_output[0])) | (fsm_output[5]));
  assign nor_198_nl = ~((~ (fsm_output[6])) | (fsm_output[0]) | (~ (fsm_output[5])));
  assign mux_378_nl = MUX_s_1_2_2(nor_197_nl, nor_198_nl, fsm_output[3]);
  assign nand_119_nl = ~((fsm_output[2]) & mux_378_nl);
  assign mux_381_nl = MUX_s_1_2_2(mux_380_nl, nand_119_nl, fsm_output[1]);
  assign or_1034_nl = (fsm_output[2]) | (~ (fsm_output[3])) | (fsm_output[6]) | (~
      (fsm_output[0])) | (fsm_output[5]);
  assign or_1035_nl = (fsm_output[2]) | (fsm_output[3]) | (fsm_output[6]) | (fsm_output[0])
      | (~ (fsm_output[5]));
  assign mux_377_nl = MUX_s_1_2_2(or_1034_nl, or_1035_nl, fsm_output[1]);
  assign mux_382_nl = MUX_s_1_2_2(mux_381_nl, mux_377_nl, fsm_output[7]);
  assign nor_325_nl = ~(mux_382_nl | (fsm_output[4]));
  assign S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt = MUX_v_6_2_2(({1'b0 , S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl}),
      S2_INNER_LOOP1_for_acc_nl, nor_325_nl);
  assign nand_83_cse = ~((fsm_output[5]) & (fsm_output[1]));
  assign or_533_cse = (~ (fsm_output[0])) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign or_1041_cse = (fsm_output[7:5]!=3'b010);
  assign or_587_cse = (fsm_output[7]) | (fsm_output[0]) | (~ (fsm_output[6]));
  assign or_585_cse = (~ (fsm_output[7])) | (~ (fsm_output[0])) | (fsm_output[6]);
  assign mux_467_cse = MUX_s_1_2_2(or_587_cse, or_585_cse, fsm_output[5]);
  assign butterFly_tw_and_1_cse = (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2]) & (S2_INNER_LOOP1_r_4_2_sva_1_0[0]);
  assign nor_462_nl = ~((~ (fsm_output[0])) | (fsm_output[5]) | (fsm_output[1]) |
      (fsm_output[7]));
  assign nor_463_nl = ~((fsm_output[0]) | (~ (fsm_output[5])) | (~ (fsm_output[1]))
      | (fsm_output[7]));
  assign mux_829_cse = MUX_s_1_2_2(nor_462_nl, nor_463_nl, fsm_output[6]);
  assign nor_131_cse = ~((fsm_output[7:6]!=2'b01));
  assign or_829_cse = (fsm_output[4]) | (fsm_output[7]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign or_845_cse = (~ (fsm_output[3])) | (~ (fsm_output[0])) | (fsm_output[4])
      | (~ (fsm_output[6])) | (fsm_output[7]);
  assign nor_109_cse = ~((fsm_output[3]) | (~ (fsm_output[4])) | (~ (fsm_output[0]))
      | (~ (fsm_output[5])) | (fsm_output[7]) | (~ (fsm_output[6])));
  assign or_889_cse = (~ (fsm_output[4])) | (fsm_output[7]) | (fsm_output[6]);
  assign or_900_cse = (fsm_output[4]) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign or_888_cse = (~ (fsm_output[4])) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign or_964_cse = (~ (fsm_output[4])) | (~ (fsm_output[7])) | (fsm_output[6]);
  assign nand_124_cse = ~((fsm_output[2:0]==3'b111));
  assign or_81_cse = (fsm_output[3]) | (~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[4]);
  assign or_125_cse = (fsm_output[2]) | (fsm_output[0]);
  assign and_403_cse = (fsm_output[2]) & (fsm_output[0]);
  assign and_425_cse = (fsm_output[6:5]==2'b11);
  assign and_385_cse = (fsm_output[5]) & (fsm_output[0]);
  assign nl_S1_OUTER_LOOP_k_5_0_sva_2 = conv_u2s_5_6({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg})
      + 6'b000001;
  assign S1_OUTER_LOOP_k_5_0_sva_2 = nl_S1_OUTER_LOOP_k_5_0_sva_2[5:0];
  assign nl_modulo_add_3_mux_itm_mx0w1 = modulo_add_base_1_sva - m_sva;
  assign modulo_add_3_mux_itm_mx0w1 = nl_modulo_add_3_mux_itm_mx0w1[31:0];
  assign nl_modulo_add_base_3_sva_mx0w1 = butterFly_14_f1_sva + reg_mult_3_res_lpi_4_dfm_cse;
  assign modulo_add_base_3_sva_mx0w1 = nl_modulo_add_base_3_sva_mx0w1[31:0];
  assign nl_modulo_add_base_sva_mx0w2 = butterFly_15_f1_sva + reg_mult_res_lpi_4_dfm_cse;
  assign modulo_add_base_sva_mx0w2 = nl_modulo_add_base_sva_mx0w2[31:0];
  assign nl_modulo_add_base_1_sva_mx0w3 = butterFly_10_f1_sva + reg_mult_1_res_lpi_4_dfm_cse;
  assign modulo_add_base_1_sva_mx0w3 = nl_modulo_add_base_1_sva_mx0w3[31:0];
  assign nl_modulo_add_base_2_sva_mx0w4 = butterFly_11_f1_sva + reg_mult_2_res_lpi_4_dfm_cse;
  assign modulo_add_base_2_sva_mx0w4 = nl_modulo_add_base_2_sva_mx0w4[31:0];
  assign nl_modulo_add_base_7_sva_mx0w5 = butterFly_15_f1_sva + reg_mult_res_lpi_4_dfm_cse;
  assign modulo_add_base_7_sva_mx0w5 = nl_modulo_add_base_7_sva_mx0w5[31:0];
  assign nl_modulo_add_base_4_sva_mx0w6 = butterFly_10_f1_sva + reg_mult_1_res_lpi_4_dfm_cse;
  assign modulo_add_base_4_sva_mx0w6 = nl_modulo_add_base_4_sva_mx0w6[31:0];
  assign nl_modulo_add_base_5_sva_mx0w7 = butterFly_11_f1_sva + reg_mult_2_res_lpi_4_dfm_cse;
  assign modulo_add_base_5_sva_mx0w7 = nl_modulo_add_base_5_sva_mx0w7[31:0];
  assign nl_modulo_add_base_6_sva_mx0w8 = butterFly_14_f1_sva + reg_mult_3_res_lpi_4_dfm_cse;
  assign modulo_add_base_6_sva_mx0w8 = nl_modulo_add_base_6_sva_mx0w8[31:0];
  assign nl_modulo_add_base_11_sva_mx0w9 = butterFly_11_f1_sva + reg_mult_2_res_lpi_4_dfm_cse;
  assign modulo_add_base_11_sva_mx0w9 = nl_modulo_add_base_11_sva_mx0w9[31:0];
  assign nl_modulo_add_base_8_sva_mx0w10 = butterFly_14_f1_sva + reg_mult_3_res_lpi_4_dfm_cse;
  assign modulo_add_base_8_sva_mx0w10 = nl_modulo_add_base_8_sva_mx0w10[31:0];
  assign nl_modulo_add_base_9_sva_mx0w11 = butterFly_15_f1_sva + reg_mult_res_lpi_4_dfm_cse;
  assign modulo_add_base_9_sva_mx0w11 = nl_modulo_add_base_9_sva_mx0w11[31:0];
  assign nl_modulo_add_base_10_sva_mx0w12 = butterFly_10_f1_sva + reg_mult_1_res_lpi_4_dfm_cse;
  assign modulo_add_base_10_sva_mx0w12 = nl_modulo_add_base_10_sva_mx0w12[31:0];
  assign nl_modulo_add_base_15_sva_mx0w13 = butterFly_15_f1_sva + reg_mult_res_lpi_4_dfm_cse;
  assign modulo_add_base_15_sva_mx0w13 = nl_modulo_add_base_15_sva_mx0w13[31:0];
  assign nl_modulo_add_base_12_sva_mx0w14 = butterFly_10_f1_sva + reg_mult_1_res_lpi_4_dfm_cse;
  assign modulo_add_base_12_sva_mx0w14 = nl_modulo_add_base_12_sva_mx0w14[31:0];
  assign nl_modulo_add_base_13_sva_mx0w15 = butterFly_11_f1_sva + reg_mult_2_res_lpi_4_dfm_cse;
  assign modulo_add_base_13_sva_mx0w15 = nl_modulo_add_base_13_sva_mx0w15[31:0];
  assign nl_modulo_add_base_14_sva_mx0w16 = butterFly_14_f1_sva + reg_mult_3_res_lpi_4_dfm_cse;
  assign modulo_add_base_14_sva_mx0w16 = nl_modulo_add_base_14_sva_mx0w16[31:0];
  assign nl_modulo_add_base_19_sva_mx0w17 = butterFly_15_f1_sva + reg_mult_res_lpi_4_dfm_cse;
  assign modulo_add_base_19_sva_mx0w17 = nl_modulo_add_base_19_sva_mx0w17[31:0];
  assign nl_modulo_add_base_16_sva_mx0w18 = butterFly_10_f1_sva + reg_mult_1_res_lpi_4_dfm_cse;
  assign modulo_add_base_16_sva_mx0w18 = nl_modulo_add_base_16_sva_mx0w18[31:0];
  assign nl_modulo_add_base_17_sva_mx0w19 = butterFly_11_f1_sva + reg_mult_2_res_lpi_4_dfm_cse;
  assign modulo_add_base_17_sva_mx0w19 = nl_modulo_add_base_17_sva_mx0w19[31:0];
  assign nl_modulo_add_base_18_sva_mx0w20 = butterFly_14_f1_sva + reg_mult_3_res_lpi_4_dfm_cse;
  assign modulo_add_base_18_sva_mx0w20 = nl_modulo_add_base_18_sva_mx0w20[31:0];
  assign nl_modulo_add_base_23_sva_mx0w21 = butterFly_15_f1_sva + reg_mult_res_lpi_4_dfm_cse;
  assign modulo_add_base_23_sva_mx0w21 = nl_modulo_add_base_23_sva_mx0w21[31:0];
  assign nl_modulo_add_base_20_sva_mx0w22 = butterFly_10_f1_sva + reg_mult_1_res_lpi_4_dfm_cse;
  assign modulo_add_base_20_sva_mx0w22 = nl_modulo_add_base_20_sva_mx0w22[31:0];
  assign nl_modulo_add_base_21_sva_mx0w23 = butterFly_11_f1_sva + reg_mult_2_res_lpi_4_dfm_cse;
  assign modulo_add_base_21_sva_mx0w23 = nl_modulo_add_base_21_sva_mx0w23[31:0];
  assign nl_modulo_add_base_22_sva_mx0w24 = butterFly_14_f1_sva + reg_mult_3_res_lpi_4_dfm_cse;
  assign modulo_add_base_22_sva_mx0w24 = nl_modulo_add_base_22_sva_mx0w24[31:0];
  assign nl_operator_20_true_1_acc_1_nl = (z_out_2[19:5]) + 15'b111111111111111;
  assign operator_20_true_1_acc_1_nl = nl_operator_20_true_1_acc_1_nl[14:0];
  assign operator_20_true_1_acc_1_itm_14 = readslicef_15_1_14(operator_20_true_1_acc_1_nl);
  assign mux_tmp_19 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[5]);
  assign and_422_cse = (fsm_output[7:6]==2'b11);
  assign and_dcpl_14 = (z_out_2[2]) & S2_OUTER_LOOP_c_1_sva;
  assign nor_tmp_9 = (fsm_output[7]) & (fsm_output[5]);
  assign mux_tmp_37 = MUX_s_1_2_2(nor_tmp_9, (fsm_output[7]), fsm_output[6]);
  assign or_tmp_29 = (fsm_output[7]) | (fsm_output[5]);
  assign or_tmp_52 = (fsm_output[3]) | (~ (fsm_output[0])) | (fsm_output[4]) | (fsm_output[6])
      | (fsm_output[7]) | (fsm_output[5]);
  assign nor_tmp_14 = (fsm_output[0]) & (fsm_output[4]) & (fsm_output[7]) & (fsm_output[5]);
  assign and_dcpl_20 = (fsm_output[0]) & (~ (fsm_output[3]));
  assign and_dcpl_21 = and_dcpl_20 & and_953_cse;
  assign and_dcpl_22 = (fsm_output[6]) & (~ (fsm_output[4]));
  assign and_dcpl_23 = (fsm_output[5]) & (~ (fsm_output[7]));
  assign and_dcpl_24 = and_dcpl_23 & and_dcpl_22;
  assign and_dcpl_25 = and_dcpl_24 & and_dcpl_21;
  assign and_dcpl_27 = ~((fsm_output[6]) | (fsm_output[4]));
  assign and_dcpl_31 = (fsm_output[3]) & (~ (fsm_output[1]));
  assign and_dcpl_33 = (~ (fsm_output[6])) & (fsm_output[4]);
  assign and_dcpl_34 = nor_tmp_9 & and_dcpl_33;
  assign and_dcpl_36 = (fsm_output[2:1]==2'b01);
  assign and_dcpl_37 = ~((fsm_output[0]) | (fsm_output[3]));
  assign and_dcpl_38 = and_dcpl_37 & and_dcpl_36;
  assign and_dcpl_39 = (~ or_tmp_29) & and_dcpl_27;
  assign and_dcpl_40 = and_dcpl_39 & and_dcpl_38;
  assign and_dcpl_41 = (fsm_output[2:1]==2'b10);
  assign and_dcpl_42 = (fsm_output[0]) & (fsm_output[3]);
  assign and_dcpl_43 = and_dcpl_42 & and_dcpl_41;
  assign and_dcpl_44 = and_dcpl_34 & and_dcpl_43;
  assign mux_tmp_57 = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), or_442_cse);
  assign mux_tmp_66 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[6]);
  assign mux_tmp_70 = MUX_s_1_2_2(or_900_cse, or_403_cse, fsm_output[3]);
  assign and_dcpl_48 = (fsm_output[4:3]==2'b01) & nor_304_cse;
  assign or_tmp_77 = (~ (fsm_output[7])) | (fsm_output[5]);
  assign or_tmp_82 = (fsm_output[6]) | (~ nor_tmp_9);
  assign mux_tmp_79 = MUX_s_1_2_2((~ nor_tmp_9), or_tmp_29, fsm_output[6]);
  assign mux_tmp_80 = MUX_s_1_2_2(mux_tmp_79, or_tmp_82, fsm_output[0]);
  assign or_tmp_83 = (~ (fsm_output[0])) | (~ (fsm_output[6])) | (fsm_output[7])
      | (fsm_output[5]);
  assign or_97_nl = (fsm_output[3]) | (~((fsm_output[4]) & mux_tmp_66));
  assign or_96_nl = (fsm_output[3]) | (fsm_output[0]) | (~((fsm_output[6:4]==3'b111)));
  assign mux_82_nl = MUX_s_1_2_2(or_97_nl, or_96_nl, fsm_output[1]);
  assign nor_379_nl = ~((fsm_output[6:4]!=3'b000));
  assign nor_380_nl = ~((fsm_output[4]) | (~ mux_tmp_66));
  assign mux_67_nl = MUX_s_1_2_2(nor_379_nl, nor_380_nl, fsm_output[0]);
  assign nand_9_nl = ~((fsm_output[1]) & (fsm_output[3]) & mux_67_nl);
  assign mux_83_nl = MUX_s_1_2_2(mux_82_nl, nand_9_nl, fsm_output[2]);
  assign and_dcpl_57 = ~(mux_83_nl | (fsm_output[7]));
  assign and_dcpl_58 = and_dcpl_27 & (fsm_output[3]);
  assign or_tmp_87 = (fsm_output[1]) | (fsm_output[0]) | (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_tmp_84 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[7]);
  assign mux_87_nl = MUX_s_1_2_2(or_tmp_83, mux_tmp_79, fsm_output[1]);
  assign or_99_nl = (fsm_output[1]) | mux_tmp_80;
  assign mux_88_nl = MUX_s_1_2_2(mux_87_nl, or_99_nl, fsm_output[2]);
  assign and_dcpl_60 = (~ mux_88_nl) & nor_242_cse;
  assign and_dcpl_66 = ~((fsm_output[7]) | (fsm_output[4]));
  assign and_dcpl_68 = and_dcpl_42 & and_dcpl_36;
  assign and_dcpl_69 = (fsm_output[6]) & (fsm_output[4]);
  assign and_dcpl_70 = (~ or_tmp_29) & and_dcpl_69;
  assign and_dcpl_71 = and_dcpl_70 & and_dcpl_68;
  assign or_tmp_112 = (fsm_output[5:4]!=2'b00);
  assign mux_tmp_106 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[4]);
  assign nor_tmp_27 = (fsm_output[5:4]==2'b11);
  assign not_tmp_90 = ~((fsm_output[5:4]!=2'b01));
  assign and_dcpl_72 = and_dcpl_42 & nor_304_cse;
  assign and_dcpl_73 = and_dcpl_39 & and_dcpl_72;
  assign and_dcpl_74 = and_dcpl_23 & and_dcpl_33;
  assign and_dcpl_75 = and_dcpl_74 & and_dcpl_21;
  assign and_dcpl_76 = (~ (fsm_output[0])) & (fsm_output[3]);
  assign and_dcpl_77 = and_dcpl_76 & nor_304_cse;
  assign and_dcpl_78 = and_dcpl_74 & and_dcpl_77;
  assign not_tmp_95 = ~((fsm_output[4]) & (fsm_output[7]) & (fsm_output[5]));
  assign or_tmp_122 = (fsm_output[3]) | (fsm_output[0]) | not_tmp_95;
  assign or_tmp_124 = (fsm_output[0]) | (~ (fsm_output[4])) | (fsm_output[7]) | (~
      (fsm_output[5]));
  assign or_tmp_127 = ~((fsm_output[0]) & (fsm_output[4]) & (~ (fsm_output[7])) &
      (fsm_output[5]));
  assign or_tmp_130 = (~ (fsm_output[3])) | (fsm_output[0]) | (~ (fsm_output[4]))
      | (fsm_output[7]) | (~ (fsm_output[5]));
  assign or_142_nl = (fsm_output[3]) | (~ (fsm_output[0])) | (fsm_output[4]) | (~
      (fsm_output[7])) | (fsm_output[5]);
  assign mux_tmp_135 = MUX_s_1_2_2(or_142_nl, or_tmp_130, fsm_output[1]);
  assign or_144_nl = (fsm_output[1]) | (~ (fsm_output[3])) | (fsm_output[0]) | not_tmp_95;
  assign mux_136_nl = MUX_s_1_2_2(or_144_nl, mux_tmp_135, fsm_output[2]);
  assign and_dcpl_82 = ~(mux_136_nl | (fsm_output[6]));
  assign and_dcpl_83 = and_dcpl_37 & and_dcpl_41;
  assign and_dcpl_84 = and_dcpl_24 & and_dcpl_83;
  assign and_dcpl_85 = and_dcpl_20 & and_dcpl_41;
  assign and_dcpl_86 = and_dcpl_24 & and_dcpl_85;
  assign and_dcpl_87 = and_dcpl_76 & and_953_cse;
  assign and_dcpl_88 = and_dcpl_23 & and_dcpl_69;
  assign and_dcpl_89 = and_dcpl_88 & and_dcpl_87;
  assign and_dcpl_90 = and_dcpl_42 & and_953_cse;
  assign and_dcpl_91 = and_dcpl_88 & and_dcpl_90;
  assign and_dcpl_92 = (~ or_tmp_77) & and_dcpl_27;
  assign and_dcpl_95 = and_dcpl_20 & nor_304_cse;
  assign and_dcpl_96 = and_dcpl_34 & and_dcpl_95;
  assign and_dcpl_97 = and_dcpl_34 & and_dcpl_38;
  assign and_dcpl_101 = ~((fsm_output[5:4]!=2'b00));
  assign mux_tmp_137 = MUX_s_1_2_2(or_467_cse, or_392_cse, fsm_output[3]);
  assign mux_138_itm = MUX_s_1_2_2(mux_tmp_137, or_210_cse, fsm_output[2]);
  assign and_dcpl_110 = ~((fsm_output[5]) | (fsm_output[0]));
  assign and_dcpl_111 = and_dcpl_110 & (~ (fsm_output[1]));
  assign or_tmp_140 = (fsm_output[3]) | (~ (fsm_output[4])) | (fsm_output[6]) | (fsm_output[7]);
  assign mux_140_itm = MUX_s_1_2_2(or_tmp_140, mux_tmp_70, fsm_output[2]);
  assign and_dcpl_113 = (~ (fsm_output[5])) & (fsm_output[0]);
  assign and_dcpl_122 = and_dcpl_34 & and_dcpl_68;
  assign and_dcpl_123 = and_dcpl_76 & and_dcpl_41;
  assign or_163_nl = (fsm_output[0]) | (fsm_output[4]) | (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_tmp_147 = MUX_s_1_2_2(or_163_nl, or_tmp_127, fsm_output[3]);
  assign or_162_nl = (fsm_output[3]) | (~ nor_tmp_14);
  assign mux_148_itm = MUX_s_1_2_2(mux_tmp_147, or_162_nl, fsm_output[1]);
  assign or_183_nl = (fsm_output[7]) | mux_320_cse;
  assign mux_tmp_164 = MUX_s_1_2_2(or_183_nl, or_403_cse, fsm_output[3]);
  assign or_179_cse = (fsm_output[4]) | (fsm_output[6]);
  assign mux_162_nl = MUX_s_1_2_2(or_900_cse, or_179_cse, fsm_output[3]);
  assign mux_tmp_165 = MUX_s_1_2_2(mux_tmp_164, mux_162_nl, fsm_output[2]);
  assign or_tmp_173 = (fsm_output[5]) | mux_tmp_165;
  assign or_tmp_188 = (~ (fsm_output[2])) | (fsm_output[7]);
  assign or_tmp_197 = (~ (fsm_output[0])) | (fsm_output[6]) | (fsm_output[5]);
  assign and_dcpl_136 = (~ or_tmp_29) & and_dcpl_33;
  assign and_dcpl_137 = and_dcpl_136 & and_dcpl_43;
  assign and_dcpl_138 = and_dcpl_136 & and_dcpl_87;
  assign or_832_nl = (fsm_output[3]) | (~ (fsm_output[6]));
  assign or_211_nl = (fsm_output[6]) | (~ (fsm_output[3]));
  assign mux_tmp_188 = MUX_s_1_2_2(or_832_nl, or_211_nl, fsm_output[7]);
  assign and_dcpl_139 = and_dcpl_23 & and_dcpl_27;
  assign and_dcpl_141 = and_dcpl_20 & and_dcpl_36;
  assign or_216_nl = (~ (fsm_output[0])) | (~ (fsm_output[4])) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[5]);
  assign or_215_nl = (~ (fsm_output[0])) | (~ (fsm_output[4])) | (fsm_output[6])
      | (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_tmp_192 = MUX_s_1_2_2(or_216_nl, or_215_nl, fsm_output[3]);
  assign or_218_nl = (fsm_output[3]) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[6])
      | (fsm_output[7]) | (~ (fsm_output[5]));
  assign mux_193_itm = MUX_s_1_2_2(or_218_nl, mux_tmp_192, fsm_output[1]);
  assign and_dcpl_143 = (~ mux_193_itm) & (fsm_output[2]);
  assign and_dcpl_144 = and_dcpl_37 & nor_304_cse;
  assign and_dcpl_145 = and_dcpl_70 & and_dcpl_144;
  assign and_dcpl_146 = and_dcpl_70 & and_dcpl_95;
  assign and_dcpl_148 = and_dcpl_37 & and_953_cse;
  assign and_dcpl_150 = (~ or_tmp_77) & and_dcpl_33;
  assign and_dcpl_151 = and_dcpl_150 & and_dcpl_77;
  assign and_dcpl_152 = and_dcpl_150 & and_dcpl_72;
  assign and_dcpl_156 = (fsm_output[5:4]==2'b10);
  assign or_773_nl = (fsm_output[3]) | (~ (fsm_output[7])) | (fsm_output[6]);
  assign mux_719_nl = MUX_s_1_2_2(or_210_cse, or_773_nl, fsm_output[1]);
  assign nand_123_nl = ~((fsm_output[3]) & (fsm_output[1]) & (~ (fsm_output[7]))
      & (fsm_output[6]));
  assign mux_195_itm = MUX_s_1_2_2(mux_719_nl, nand_123_nl, fsm_output[2]);
  assign and_dcpl_161 = (fsm_output[5]) & (~ (fsm_output[0]));
  assign or_784_nl = (~ (fsm_output[4])) | (fsm_output[3]) | (fsm_output[7]) | (~
      (fsm_output[6]));
  assign mux_tmp_196 = MUX_s_1_2_2(or_784_nl, or_829_cse, fsm_output[1]);
  assign or_223_nl = (fsm_output[1]) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[6])
      | (~ (fsm_output[7]));
  assign mux_197_itm = MUX_s_1_2_2(mux_tmp_196, or_223_nl, fsm_output[2]);
  assign and_dcpl_162 = (~ mux_197_itm) & and_dcpl_161;
  assign and_dcpl_164 = (~ mux_197_itm) & and_385_cse;
  assign or_669_nl = (~ (fsm_output[4])) | (fsm_output[3]) | (~ (fsm_output[1]))
      | (fsm_output[7]) | (~ (fsm_output[6]));
  assign mux_198_nl = MUX_s_1_2_2(or_829_cse, or_81_cse, fsm_output[1]);
  assign mux_199_itm = MUX_s_1_2_2(or_669_nl, mux_198_nl, fsm_output[2]);
  assign and_dcpl_166 = (~ mux_199_itm) & and_385_cse;
  assign or_657_nl = (fsm_output[4]) | (~ (fsm_output[3])) | (fsm_output[1]) | (~
      (fsm_output[7])) | (fsm_output[6]);
  assign mux_200_itm = MUX_s_1_2_2(or_657_nl, mux_tmp_196, fsm_output[2]);
  assign and_dcpl_167 = (~ mux_200_itm) & and_dcpl_161;
  assign and_dcpl_168 = (~ mux_200_itm) & and_385_cse;
  assign and_dcpl_169 = and_dcpl_76 & and_dcpl_36;
  assign and_dcpl_173 = (fsm_output[5:4]==2'b01);
  assign or_tmp_220 = (~ (fsm_output[3])) | (~ (fsm_output[0])) | (fsm_output[6])
      | (fsm_output[7]);
  assign or_tmp_222 = (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[7]));
  assign mux_tmp_201 = MUX_s_1_2_2(or_587_cse, or_tmp_222, fsm_output[3]);
  assign mux_202_itm = MUX_s_1_2_2(mux_tmp_201, or_tmp_220, fsm_output[2]);
  assign nor_262_nl = ~((fsm_output[3]) | (~ (fsm_output[0])) | (fsm_output[4]) |
      (fsm_output[6]) | (fsm_output[7]) | (~ (fsm_output[5])));
  assign nor_263_nl = ~((fsm_output[0]) | (~ (fsm_output[4])) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[5]));
  assign nor_264_nl = ~((fsm_output[0]) | (~ (fsm_output[4])) | (fsm_output[6]) |
      (~ (fsm_output[7])) | (fsm_output[5]));
  assign mux_205_nl = MUX_s_1_2_2(nor_263_nl, nor_264_nl, fsm_output[3]);
  assign not_tmp_135 = MUX_s_1_2_2(nor_262_nl, mux_205_nl, fsm_output[2]);
  assign or_tmp_236 = (fsm_output[0]) | (fsm_output[1]) | (fsm_output[7]);
  assign mux_tmp_208 = MUX_s_1_2_2((fsm_output[7]), or_tmp_236, fsm_output[2]);
  assign and_tmp_6 = (fsm_output[7]) & or_35_cse;
  assign and_dcpl_184 = (fsm_output[3]) & (fsm_output[1]);
  assign and_dcpl_186 = (fsm_output[4]) & (fsm_output[0]);
  assign and_dcpl_187 = nor_tmp_9 & (~ (fsm_output[6]));
  assign and_dcpl_188 = and_dcpl_187 & and_dcpl_186;
  assign and_dcpl_192 = (~ or_tmp_29) & (fsm_output[6]);
  assign and_dcpl_194 = and_dcpl_70 & and_dcpl_43;
  assign and_dcpl_195 = and_dcpl_70 & and_dcpl_72;
  assign or_tmp_253 = (fsm_output[4]) | (~ or_35_cse);
  assign nand_tmp_20 = ~((fsm_output[4]) & nand_96_cse);
  assign not_tmp_150 = ~((fsm_output[2]) & (fsm_output[5]));
  assign or_tmp_264 = (fsm_output[1]) | (fsm_output[2]) | (fsm_output[5]);
  assign or_tmp_275 = (fsm_output[2:1]!=2'b01);
  assign or_tmp_295 = (fsm_output[1]) | (~ (fsm_output[4])) | (fsm_output[6]);
  assign or_307_nl = (~ (fsm_output[1])) | (~ (fsm_output[4])) | (fsm_output[6]);
  assign mux_tmp_263 = MUX_s_1_2_2(or_307_nl, or_tmp_295, fsm_output[2]);
  assign or_tmp_301 = (fsm_output[1]) | (fsm_output[4]) | (~ (fsm_output[6]));
  assign or_318_nl = (~ (fsm_output[7])) | (fsm_output[6]) | (~ (fsm_output[2]));
  assign or_316_nl = (~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[2]);
  assign mux_tmp_273 = MUX_s_1_2_2(or_318_nl, or_316_nl, fsm_output[1]);
  assign not_tmp_173 = ~((fsm_output[0]) & (fsm_output[7]));
  assign or_tmp_334 = (fsm_output[2]) | (fsm_output[5]) | (fsm_output[6]);
  assign or_tmp_349 = (fsm_output[5]) | (fsm_output[7]) | (fsm_output[3]) | (~ (fsm_output[4]));
  assign or_tmp_352 = (~ (fsm_output[7])) | (~ (fsm_output[3])) | (fsm_output[4]);
  assign not_tmp_188 = ~((fsm_output[1]) & (fsm_output[2]) & (fsm_output[6]));
  assign or_tmp_369 = (fsm_output[6]) | (~ (fsm_output[2]));
  assign mux_tmp_327 = MUX_s_1_2_2(or_889_cse, or_888_cse, fsm_output[3]);
  assign or_395_nl = (~ (fsm_output[3])) | (fsm_output[4]) | (~ (fsm_output[7]))
      | (fsm_output[6]);
  assign mux_tmp_328 = MUX_s_1_2_2(mux_tmp_327, or_395_nl, fsm_output[2]);
  assign mux_tmp_330 = MUX_s_1_2_2(or_964_cse, or_900_cse, fsm_output[3]);
  assign nor_tmp_58 = (fsm_output[0]) & (fsm_output[6]);
  assign or_tmp_465 = (~ (fsm_output[4])) | (fsm_output[6]) | (~ nor_tmp_9);
  assign or_tmp_466 = (fsm_output[7:4]!=4'b0101);
  assign nor_tmp_65 = (fsm_output[1]) & (fsm_output[7]) & (fsm_output[3]) & (fsm_output[4]);
  assign nor_192_nl = ~((fsm_output[1]) | (fsm_output[7]) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_tmp_403 = MUX_s_1_2_2(nor_192_nl, nor_tmp_65, fsm_output[5]);
  assign or_dcpl_15 = or_tmp_29 | or_179_cse;
  assign or_tmp_503 = (~ (fsm_output[7])) | (~ (fsm_output[5])) | (fsm_output[2]);
  assign and_dcpl_210 = (~ (fsm_output[3])) & (fsm_output[1]);
  assign or_572_nl = (~ (fsm_output[1])) | (~ (fsm_output[0])) | (fsm_output[6])
      | (fsm_output[5]);
  assign or_571_nl = (fsm_output[1:0]!=2'b00) | (~ and_425_cse);
  assign mux_tmp_462 = MUX_s_1_2_2(or_572_nl, or_571_nl, fsm_output[2]);
  assign and_dcpl_216 = (~ or_tmp_29) & and_dcpl_22;
  assign or_tmp_619 = (~ (fsm_output[3])) | (~ (fsm_output[0])) | (fsm_output[4])
      | (fsm_output[6]) | (~ (fsm_output[7]));
  assign or_tmp_622 = (fsm_output[3]) | (fsm_output[0]) | (~ (fsm_output[4])) | (fsm_output[6])
      | (fsm_output[7]);
  assign or_tmp_624 = (fsm_output[1]) | (fsm_output[7]) | (fsm_output[6]) | (fsm_output[4]);
  assign or_tmp_627 = (~ (fsm_output[5])) | (~ (fsm_output[1])) | (~ (fsm_output[7]))
      | (fsm_output[6]) | (fsm_output[4]);
  assign or_tmp_728 = (fsm_output[7]) | (fsm_output[5]) | (fsm_output[1]);
  assign nand_72_cse = ~((fsm_output[1]) & (fsm_output[6]));
  assign or_tmp_765 = (~ (fsm_output[2])) | (fsm_output[4]) | (~ (fsm_output[3]))
      | (fsm_output[1]) | (fsm_output[6]);
  assign or_tmp_773 = (fsm_output[7]) | nand_72_cse;
  assign or_tmp_811 = (fsm_output[3]) | (~ (fsm_output[0])) | (~ (fsm_output[4]))
      | (fsm_output[6]) | (fsm_output[7]);
  assign or_tmp_847 = (fsm_output[7]) | (~ (fsm_output[6])) | (fsm_output[2]) | (fsm_output[1])
      | (~ (fsm_output[3]));
  assign or_tmp_868 = (fsm_output[7:3]!=5'b00110);
  assign or_tmp_871 = (fsm_output[7:4]!=4'b0100);
  assign or_tmp_872 = (fsm_output[7:4]!=4'b0001);
  assign or_tmp_873 = (fsm_output[7:4]!=4'b1001);
  assign and_dcpl_253 = (fsm_output[4]) & (~ (fsm_output[0]));
  assign and_dcpl_254 = ~(or_tmp_29 | (fsm_output[6]));
  assign and_dcpl_255 = and_dcpl_254 & and_dcpl_253;
  assign and_dcpl_262 = and_dcpl_254 & and_dcpl_186;
  assign and_dcpl_270 = and_dcpl_23 & (~ (fsm_output[6]));
  assign and_dcpl_271 = and_dcpl_270 & and_dcpl_253;
  assign and_dcpl_278 = and_dcpl_270 & and_dcpl_186;
  assign and_dcpl_284 = ~((fsm_output[3]) | (fsm_output[1]));
  assign and_dcpl_286 = and_dcpl_192 & and_dcpl_186;
  assign and_dcpl_293 = and_dcpl_192 & and_dcpl_253;
  assign and_dcpl_301 = and_dcpl_23 & (fsm_output[6]) & and_dcpl_186;
  assign and_dcpl_309 = ~(or_tmp_77 | (fsm_output[6]));
  assign and_dcpl_310 = and_dcpl_309 & (~ (fsm_output[4])) & (~ (fsm_output[0]));
  assign and_dcpl_317 = and_dcpl_309 & and_dcpl_186;
  assign and_dcpl_324 = and_dcpl_309 & and_dcpl_253;
  assign and_dcpl_331 = and_dcpl_187 & and_dcpl_253;
  assign xx_rsci_radr_d_mx0c0 = (~ mux_138_itm) & and_dcpl_101 & (fsm_output[1:0]==2'b01);
  assign xx_rsci_radr_d_mx0c1 = (~ mux_138_itm) & and_dcpl_101 & (fsm_output[1:0]==2'b10);
  assign xx_rsci_radr_d_mx0c2 = (~ mux_138_itm) & and_dcpl_101 & (fsm_output[1:0]==2'b11);
  assign xx_rsci_radr_d_mx0c3 = (~ mux_140_itm) & and_dcpl_111;
  assign xx_rsci_radr_d_mx0c4 = (~ mux_140_itm) & and_dcpl_113 & (~ (fsm_output[1]));
  assign xx_rsci_radr_d_mx0c5 = (~ mux_140_itm) & and_dcpl_110 & (fsm_output[1]);
  assign xx_rsci_radr_d_mx0c6 = (~ mux_140_itm) & and_dcpl_113 & (fsm_output[1]);
  assign mux_142_nl = MUX_s_1_2_2(mux_tmp_330, or_tmp_140, fsm_output[2]);
  assign xx_rsci_radr_d_mx0c7 = (~ mux_142_nl) & and_dcpl_111;
  assign xx_rsci_radr_d_mx0c8 = and_dcpl_24 & and_dcpl_77;
  assign xx_rsci_radr_d_mx0c10 = and_dcpl_34 & and_dcpl_123;
  assign nor_285_nl = ~((fsm_output[1]) | (fsm_output[3]) | (~ (fsm_output[0])) |
      (fsm_output[6]) | (~ (fsm_output[7])));
  assign or_155_nl = (~ (fsm_output[0])) | (fsm_output[6]) | (fsm_output[7]);
  assign mux_143_nl = MUX_s_1_2_2(or_155_nl, or_587_cse, fsm_output[3]);
  assign and_399_nl = (fsm_output[1]) & (~ mux_143_nl);
  assign mux_144_nl = MUX_s_1_2_2(nor_285_nl, and_399_nl, fsm_output[2]);
  assign xx_rsci_wadr_d_mx0c1 = mux_144_nl & nor_tmp_27;
  assign nor_283_nl = ~((~ (fsm_output[3])) | (fsm_output[0]) | (fsm_output[6]) |
      (fsm_output[7]));
  assign nor_284_nl = ~((fsm_output[3]) | (fsm_output[0]) | (fsm_output[6]) | (~
      (fsm_output[7])));
  assign mux_145_nl = MUX_s_1_2_2(nor_283_nl, nor_284_nl, fsm_output[1]);
  assign and_398_nl = (fsm_output[1]) & (fsm_output[3]) & (fsm_output[0]) & (fsm_output[6])
      & (~ (fsm_output[7]));
  assign mux_146_nl = MUX_s_1_2_2(mux_145_nl, and_398_nl, fsm_output[2]);
  assign xx_rsci_wadr_d_mx0c2 = mux_146_nl & nor_tmp_27;
  assign xx_rsci_wadr_d_mx0c3 = ~(mux_148_itm | (fsm_output[6]) | (fsm_output[2]));
  assign or_165_nl = (fsm_output[1]) | (fsm_output[3]) | (fsm_output[0]) | not_tmp_95;
  assign mux_149_nl = MUX_s_1_2_2(mux_tmp_135, or_165_nl, fsm_output[2]);
  assign xx_rsci_wadr_d_mx0c4 = ~(mux_149_nl | (fsm_output[6]));
  assign nand_120_nl = ~((fsm_output[1]) & (~ mux_tmp_147));
  assign or_1036_nl = (fsm_output[1]) | (fsm_output[3]) | (~ nor_tmp_14);
  assign mux_150_nl = MUX_s_1_2_2(nand_120_nl, or_1036_nl, fsm_output[2]);
  assign xx_rsci_wadr_d_mx0c5 = ~(mux_150_nl | (fsm_output[6]));
  assign or_168_nl = (~ (fsm_output[1])) | (fsm_output[3]) | (~ (fsm_output[0]))
      | (fsm_output[4]) | (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_151_nl = MUX_s_1_2_2(or_tmp_130, or_tmp_122, fsm_output[1]);
  assign mux_152_nl = MUX_s_1_2_2(or_168_nl, mux_151_nl, fsm_output[2]);
  assign xx_rsci_wadr_d_mx0c6 = ~(mux_152_nl | (fsm_output[6]));
  assign xx_rsci_wadr_d_mx0c7 = (~ mux_148_itm) & (~ (fsm_output[6])) & (fsm_output[2]);
  assign yy_rsci_radr_d_mx0c0 = and_dcpl_39 & and_dcpl_21;
  assign yy_rsci_radr_d_mx0c1 = (~ mux_195_itm) & and_dcpl_156 & (~ (fsm_output[0]));
  assign yy_rsci_radr_d_mx0c2 = (~ mux_195_itm) & and_dcpl_156 & (fsm_output[0]);
  assign yy_rsci_radr_d_mx0c5 = (~ mux_199_itm) & and_dcpl_161;
  assign yy_rsci_radr_d_mx0c9 = and_dcpl_70 & and_dcpl_169;
  assign yy_rsci_wadr_d_mx0c0 = and_dcpl_39 & and_dcpl_141;
  assign yy_rsci_wadr_d_mx0c1 = and_dcpl_39 & and_dcpl_83;
  assign yy_rsci_wadr_d_mx0c2 = (~ mux_202_itm) & and_dcpl_173 & (~ (fsm_output[1]));
  assign mux_203_nl = MUX_s_1_2_2(or_533_cse, or_585_cse, fsm_output[3]);
  assign nor_265_nl = ~((fsm_output[1]) | mux_203_nl);
  assign nor_266_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[3])) | (fsm_output[0])
      | (fsm_output[6]) | (fsm_output[7]));
  assign mux_204_nl = MUX_s_1_2_2(nor_265_nl, nor_266_nl, fsm_output[2]);
  assign yy_rsci_wadr_d_mx0c3 = mux_204_nl & and_dcpl_173;
  assign yy_rsci_wadr_d_mx0c4 = (~ mux_202_itm) & and_dcpl_173 & (fsm_output[1]);
  assign yy_rsci_wadr_d_mx0c5 = ~(mux_193_itm | (fsm_output[2]));
  assign yy_rsci_wadr_d_mx0c6 = not_tmp_135 & (~ (fsm_output[1]));
  assign nor_260_nl = ~((~ (fsm_output[1])) | (fsm_output[3]) | (fsm_output[0]) |
      (fsm_output[4]) | (fsm_output[6]) | (fsm_output[7]) | (~ (fsm_output[5])));
  assign nor_261_nl = ~((fsm_output[1]) | mux_tmp_192);
  assign yy_rsci_wadr_d_mx0c7 = MUX_s_1_2_2(nor_260_nl, nor_261_nl, fsm_output[2]);
  assign yy_rsci_wadr_d_mx0c8 = not_tmp_135 & (fsm_output[1]);
  assign yy_rsci_wadr_d_mx0c10 = and_dcpl_24 & and_dcpl_169;
  assign or_1031_cse = (~ (fsm_output[6])) | (~ (fsm_output[0])) | (fsm_output[5]);
  assign nor_188_nl = ~((fsm_output[0]) | (~ mux_tmp_403));
  assign nor_189_nl = ~((~ (fsm_output[1])) | (fsm_output[7]) | (fsm_output[3]) |
      (fsm_output[4]));
  assign mux_404_nl = MUX_s_1_2_2(nor_189_nl, nor_tmp_65, fsm_output[5]);
  assign mux_405_nl = MUX_s_1_2_2(mux_404_nl, mux_tmp_403, fsm_output[0]);
  assign mux_406_nl = MUX_s_1_2_2(nor_188_nl, mux_405_nl, fsm_output[2]);
  assign nor_190_nl = ~((~ (fsm_output[0])) | (fsm_output[5]) | (fsm_output[1]) |
      (fsm_output[7]) | (~((fsm_output[4:3]==2'b11))));
  assign nor_191_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[1])) | (fsm_output[7])
      | (fsm_output[3]) | (fsm_output[4]));
  assign mux_402_nl = MUX_s_1_2_2(nor_190_nl, nor_191_nl, fsm_output[2]);
  assign S1_OUTER_LOOP_for_p_sva_1_mx0c1 = MUX_s_1_2_2(mux_406_nl, mux_402_nl, fsm_output[6]);
  assign or_nl = (fsm_output[3]) | (~ (fsm_output[0])) | (fsm_output[4]) | (fsm_output[6]);
  assign or_1023_nl = (~ (fsm_output[3])) | (fsm_output[0]) | (~ and_dcpl_69);
  assign mux_413_nl = MUX_s_1_2_2(or_nl, or_1023_nl, fsm_output[1]);
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 = ~(mux_413_nl | or_tmp_29 | (fsm_output[2]));
  assign or_513_nl = (~ (fsm_output[2])) | (fsm_output[6]) | (fsm_output[7]);
  assign mux_422_nl = MUX_s_1_2_2(or_351_cse, or_513_nl, fsm_output[1]);
  assign mux_420_nl = MUX_s_1_2_2(or_392_cse, (fsm_output[7]), fsm_output[5]);
  assign nand_42_nl = ~((fsm_output[2]) & (~ mux_420_nl));
  assign mux_421_nl = MUX_s_1_2_2(or_348_cse, nand_42_nl, fsm_output[1]);
  assign mux_423_nl = MUX_s_1_2_2(mux_422_nl, mux_421_nl, fsm_output[0]);
  assign nor_179_nl = ~((fsm_output[4]) | mux_423_nl);
  assign mux_8_nl = MUX_s_1_2_2(or_401_cse, or_467_cse, fsm_output[5]);
  assign mux_417_nl = MUX_s_1_2_2(or_22_cse, mux_8_nl, fsm_output[2]);
  assign nor_180_nl = ~((fsm_output[1]) | mux_417_nl);
  assign and_365_nl = (fsm_output[2]) & (fsm_output[5]) & (fsm_output[6]) & (~ (fsm_output[7]));
  assign nor_181_nl = ~((fsm_output[2]) | (fsm_output[5]) | (fsm_output[6]) | (fsm_output[7]));
  assign mux_415_nl = MUX_s_1_2_2(and_365_nl, nor_181_nl, fsm_output[1]);
  assign mux_418_nl = MUX_s_1_2_2(nor_180_nl, mux_415_nl, fsm_output[0]);
  assign nor_182_nl = ~((~ (fsm_output[1])) | (fsm_output[2]) | (~ (fsm_output[5]))
      | (fsm_output[6]) | (~ (fsm_output[7])));
  assign nor_183_nl = ~((fsm_output[1]) | (fsm_output[2]) | (fsm_output[5]) | (~
      (fsm_output[6])) | (fsm_output[7]));
  assign mux_414_nl = MUX_s_1_2_2(nor_182_nl, nor_183_nl, fsm_output[0]);
  assign mux_419_nl = MUX_s_1_2_2(mux_418_nl, mux_414_nl, fsm_output[4]);
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c1 = MUX_s_1_2_2(nor_179_nl, mux_419_nl,
      fsm_output[3]);
  assign nor_311_nl = ~((fsm_output[6:5]!=2'b00));
  assign mux_29_nl = MUX_s_1_2_2(nor_311_nl, and_425_cse, fsm_output[0]);
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 = mux_29_nl & (~ (fsm_output[7])) &
      and_dcpl_48;
  assign or_525_nl = (~ (fsm_output[7])) | (fsm_output[5]) | (~ (fsm_output[2]));
  assign mux_429_nl = MUX_s_1_2_2(or_tmp_503, or_525_nl, fsm_output[1]);
  assign or_523_nl = (fsm_output[1]) | (fsm_output[7]) | not_tmp_150;
  assign mux_430_nl = MUX_s_1_2_2(mux_429_nl, or_523_nl, fsm_output[0]);
  assign nor_174_nl = ~((fsm_output[4]) | mux_430_nl);
  assign nor_175_nl = ~((fsm_output[0]) | (~ (fsm_output[1])) | (fsm_output[7]) |
      (fsm_output[5]) | (fsm_output[2]));
  assign or_519_nl = (fsm_output[7]) | not_tmp_150;
  assign mux_427_nl = MUX_s_1_2_2(or_tmp_503, or_519_nl, fsm_output[1]);
  assign and_363_nl = (fsm_output[0]) & (~ mux_427_nl);
  assign mux_428_nl = MUX_s_1_2_2(nor_175_nl, and_363_nl, fsm_output[4]);
  assign mux_431_nl = MUX_s_1_2_2(nor_174_nl, mux_428_nl, fsm_output[3]);
  assign nor_176_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[7])
      | (~ (fsm_output[5])) | (fsm_output[2]));
  assign nor_177_nl = ~((fsm_output[0]) | (fsm_output[1]) | (fsm_output[7]) | (fsm_output[5])
      | (fsm_output[2]));
  assign mux_426_nl = MUX_s_1_2_2(nor_176_nl, nor_177_nl, fsm_output[4]);
  assign and_364_nl = (fsm_output[3]) & mux_426_nl;
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 = MUX_s_1_2_2(mux_431_nl, and_364_nl,
      fsm_output[6]);
  assign butterFly_10_f1_sva_mx0c0 = and_dcpl_39 & and_dcpl_210 & (~ (fsm_output[2]));
  assign or_552_nl = (fsm_output[7:4]!=4'b0011);
  assign mux_448_nl = MUX_s_1_2_2(or_552_nl, or_dcpl_15, fsm_output[3]);
  assign or_550_nl = (~ (fsm_output[3])) | (fsm_output[4]) | (fsm_output[6]) | (~
      nor_tmp_9);
  assign mux_449_nl = MUX_s_1_2_2(mux_448_nl, or_550_nl, fsm_output[1]);
  assign or_548_nl = (~ (fsm_output[1])) | (fsm_output[3]) | (~ (fsm_output[4]))
      | (~ (fsm_output[6])) | (fsm_output[7]) | (~ (fsm_output[5]));
  assign mux_450_nl = MUX_s_1_2_2(mux_449_nl, or_548_nl, fsm_output[2]);
  assign butterFly_10_f1_sva_mx0c1 = ~(mux_450_nl | (fsm_output[0]));
  assign nor_169_nl = ~((fsm_output[2]) | (~((fsm_output[3]) & (fsm_output[5]))));
  assign nor_170_nl = ~((~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[5]));
  assign mux_452_nl = MUX_s_1_2_2(nor_169_nl, nor_170_nl, fsm_output[1]);
  assign and_361_nl = (~((~ (fsm_output[6])) | (fsm_output[7]) | (~ (fsm_output[0]))))
      & mux_452_nl;
  assign or_554_nl = (fsm_output[0]) | (fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[3])
      | (fsm_output[5]);
  assign or_553_nl = (~ (fsm_output[0])) | (fsm_output[1]) | (fsm_output[2]) | (fsm_output[3])
      | (fsm_output[5]);
  assign mux_451_nl = MUX_s_1_2_2(or_554_nl, or_553_nl, fsm_output[7]);
  assign nor_171_nl = ~((fsm_output[6]) | mux_451_nl);
  assign butterFly_10_f1_sva_mx0c2 = MUX_s_1_2_2(and_361_nl, nor_171_nl, fsm_output[4]);
  assign S2_OUTER_LOOP_c_1_sva_mx0c1 = and_dcpl_216 & and_dcpl_144;
  assign S2_OUTER_LOOP_c_1_sva_mx0c2 = nor_tmp_9 & and_dcpl_27 & and_dcpl_95;
  assign nor_160_nl = ~((~ (fsm_output[6])) | (fsm_output[0]) | (fsm_output[5]));
  assign nor_161_nl = ~((fsm_output[6]) | (~ and_385_cse));
  assign mux_470_nl = MUX_s_1_2_2(nor_160_nl, nor_161_nl, fsm_output[7]);
  assign nand_118_nl = ~(S2_OUTER_LOOP_c_1_sva & (z_out_2[2]) & mux_470_nl);
  assign or_1025_nl = (~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[0]) | (fsm_output[5]);
  assign mux_471_nl = MUX_s_1_2_2(nand_118_nl, or_1025_nl, fsm_output[3]);
  assign mux_469_nl = MUX_s_1_2_2(and_dcpl_110, and_385_cse, fsm_output[6]);
  assign or_1026_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (~ mux_469_nl);
  assign mux_472_nl = MUX_s_1_2_2(mux_471_nl, or_1026_nl, fsm_output[2]);
  assign or_1027_nl = (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[7]) | (fsm_output[6])
      | (~ and_385_cse);
  assign mux_473_nl = MUX_s_1_2_2(mux_472_nl, or_1027_nl, fsm_output[1]);
  assign S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 = ~(mux_473_nl | (fsm_output[4]));
  assign or_598_nl = (fsm_output[0]) | (~ (fsm_output[7])) | (~ (fsm_output[5]))
      | (fsm_output[6]);
  assign mux_474_nl = MUX_s_1_2_2(or_tmp_83, or_598_nl, fsm_output[1]);
  assign nor_159_cse = ~((~ (fsm_output[4])) | (fsm_output[2]) | mux_474_nl);
  assign or_1042_nl = (fsm_output[7:5]!=3'b101);
  assign mux_7_nl = MUX_s_1_2_2(or_1041_cse, or_1042_nl, fsm_output[0]);
  assign or_608_nl = (z_out_2[2]) | (fsm_output[1]) | mux_7_nl;
  assign nor_157_nl = ~((fsm_output[7:5]!=3'b001));
  assign nor_158_nl = ~((fsm_output[7:5]!=3'b100));
  assign mux_475_nl = MUX_s_1_2_2(nor_157_nl, nor_158_nl, fsm_output[0]);
  assign nand_47_nl = ~((fsm_output[1]) & mux_475_nl);
  assign mux_477_nl = MUX_s_1_2_2(or_608_nl, nand_47_nl, fsm_output[2]);
  assign nor_156_nl = ~((fsm_output[4]) | mux_477_nl);
  assign S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2 = MUX_s_1_2_2(nor_156_nl, nor_159_cse,
      fsm_output[3]);
  assign or_654_nl = (fsm_output[3]) | (~ (fsm_output[5])) | (~ (fsm_output[1]))
      | (fsm_output[7]) | nand_95_cse;
  assign or_652_nl = (fsm_output[1]) | (fsm_output[7]) | nand_95_cse;
  assign mux_510_nl = MUX_s_1_2_2(or_652_nl, or_tmp_624, fsm_output[5]);
  assign mux_511_nl = MUX_s_1_2_2(or_tmp_627, mux_510_nl, fsm_output[3]);
  assign mux_512_nl = MUX_s_1_2_2(or_654_nl, mux_511_nl, fsm_output[2]);
  assign or_649_nl = (~ (fsm_output[1])) | (fsm_output[7]) | nand_95_cse;
  assign mux_507_nl = MUX_s_1_2_2(or_649_nl, or_tmp_624, fsm_output[5]);
  assign mux_508_nl = MUX_s_1_2_2(or_tmp_627, mux_507_nl, fsm_output[3]);
  assign or_646_nl = (~ (fsm_output[3])) | (~ (fsm_output[5])) | (~ (fsm_output[1]))
      | (fsm_output[7]) | (~ (fsm_output[6])) | (fsm_output[4]);
  assign mux_509_nl = MUX_s_1_2_2(mux_508_nl, or_646_nl, fsm_output[2]);
  assign mux_513_itm = MUX_s_1_2_2(mux_512_nl, mux_509_nl, fsm_output[0]);
  assign nor_145_nl = ~((fsm_output[0]) | (fsm_output[7]) | (fsm_output[3]) | (~
      (fsm_output[4])));
  assign nor_146_nl = ~((~ (fsm_output[7])) | (~ (fsm_output[3])) | (fsm_output[4]));
  assign mux_530_nl = MUX_s_1_2_2(nor_145_nl, nor_146_nl, fsm_output[1]);
  assign nor_147_nl = ~((~ (fsm_output[0])) | (fsm_output[7]) | (~ (fsm_output[3]))
      | (fsm_output[4]));
  assign nor_148_nl = ~((fsm_output[7]) | (~ (fsm_output[3])) | (fsm_output[4]));
  assign nor_149_nl = ~((~ (fsm_output[7])) | (fsm_output[3]) | (fsm_output[4]));
  assign mux_528_nl = MUX_s_1_2_2(nor_148_nl, nor_149_nl, fsm_output[0]);
  assign mux_529_nl = MUX_s_1_2_2(nor_147_nl, mux_528_nl, fsm_output[1]);
  assign mux_531_nl = MUX_s_1_2_2(mux_530_nl, mux_529_nl, fsm_output[5]);
  assign nor_150_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[0])) | (fsm_output[7])
      | (~ (fsm_output[3])) | (fsm_output[4]));
  assign nor_151_nl = ~((fsm_output[1]) | (fsm_output[0]) | (~ (fsm_output[7])) |
      (fsm_output[3]) | (fsm_output[4]));
  assign mux_527_nl = MUX_s_1_2_2(nor_150_nl, nor_151_nl, fsm_output[5]);
  assign mux_532_nl = MUX_s_1_2_2(mux_531_nl, mux_527_nl, fsm_output[2]);
  assign or_675_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (fsm_output[3]) | (fsm_output[4]);
  assign or_674_nl = (fsm_output[1]) | (fsm_output[7]) | (fsm_output[3]) | (~ (fsm_output[4]));
  assign mux_526_nl = MUX_s_1_2_2(or_675_nl, or_674_nl, fsm_output[5]);
  assign nor_152_nl = ~((fsm_output[2]) | mux_526_nl);
  assign butterFly_10_tw_asn_itm_mx0c0 = MUX_s_1_2_2(mux_532_nl, nor_152_nl, fsm_output[6]);
  assign or_697_cse = (~ reg_modulo_add_4_slc_32_svs_st_cse) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign or_702_cse = (~ reg_modulo_add_1_slc_32_svs_st_cse) | (fsm_output[5]) |
      (~ (fsm_output[7]));
  assign or_703_nl = (~ reg_modulo_add_3_slc_32_svs_st_cse) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign mux_550_nl = MUX_s_1_2_2(or_tmp_77, mux_tmp_19, reg_modulo_add_3_slc_32_svs_st_cse);
  assign mux_551_nl = MUX_s_1_2_2(or_703_nl, mux_550_nl, reg_modulo_add_4_slc_32_svs_st_cse);
  assign mux_552_nl = MUX_s_1_2_2(mux_551_nl, or_702_cse, fsm_output[0]);
  assign or_704_nl = (fsm_output[3:1]!=3'b000) | mux_552_nl;
  assign and_354_nl = reg_modulo_add_7_slc_32_svs_st_cse & (fsm_output[5]) & (fsm_output[7]);
  assign and_355_nl = reg_modulo_add_11_slc_32_svs_st_cse & (fsm_output[5]) & (fsm_output[7]);
  assign mux_547_nl = MUX_s_1_2_2(and_354_nl, and_355_nl, fsm_output[0]);
  assign nand_75_nl = ~((fsm_output[1]) & mux_547_nl);
  assign or_699_nl = (~ reg_modulo_add_3_slc_32_svs_st_cse) | (fsm_output[1:0]!=2'b00)
      | nand_111_cse;
  assign mux_548_nl = MUX_s_1_2_2(nand_75_nl, or_699_nl, fsm_output[2]);
  assign mux_542_nl = MUX_s_1_2_2(or_tmp_77, mux_tmp_19, reg_modulo_add_4_slc_32_svs_st_cse);
  assign mux_543_nl = MUX_s_1_2_2(or_697_cse, mux_542_nl, reg_modulo_add_7_slc_32_svs_st_cse);
  assign mux_544_nl = MUX_s_1_2_2(or_697_cse, mux_543_nl, fsm_output[0]);
  assign or_695_nl = (~ reg_modulo_add_6_slc_32_svs_st_cse) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign mux_539_nl = MUX_s_1_2_2(or_tmp_77, mux_tmp_19, reg_modulo_add_6_slc_32_svs_st_cse);
  assign mux_540_nl = MUX_s_1_2_2(or_695_nl, mux_539_nl, reg_modulo_add_11_slc_32_svs_st_cse);
  assign mux_541_nl = MUX_s_1_2_2(mux_540_nl, or_702_cse, fsm_output[0]);
  assign mux_545_nl = MUX_s_1_2_2(mux_544_nl, mux_541_nl, fsm_output[1]);
  assign nor_142_nl = ~((~ reg_modulo_add_slc_32_svs_st_cse) | (fsm_output[5]) |
      (fsm_output[7]));
  assign nor_143_nl = ~((~ reg_modulo_add_1_slc_32_svs_st_cse) | (fsm_output[5])
      | (fsm_output[7]));
  assign mux_537_nl = MUX_s_1_2_2(nor_142_nl, nor_143_nl, fsm_output[0]);
  assign nand_50_nl = ~((fsm_output[1]) & mux_537_nl);
  assign mux_546_nl = MUX_s_1_2_2(mux_545_nl, nand_50_nl, fsm_output[2]);
  assign mux_549_nl = MUX_s_1_2_2(mux_548_nl, mux_546_nl, fsm_output[3]);
  assign mux_553_nl = MUX_s_1_2_2(or_704_nl, mux_549_nl, fsm_output[4]);
  assign or_688_nl = (~ reg_modulo_add_6_slc_32_svs_st_cse) | (~ (fsm_output[0]))
      | (fsm_output[5]) | (fsm_output[7]);
  assign or_687_nl = (~ reg_modulo_add_7_slc_32_svs_st_cse) | (fsm_output[5]) | (fsm_output[7]);
  assign or_686_nl = (~ reg_modulo_add_6_slc_32_svs_st_cse) | (fsm_output[5]) | (fsm_output[7]);
  assign mux_534_nl = MUX_s_1_2_2(or_687_nl, or_686_nl, fsm_output[0]);
  assign mux_535_nl = MUX_s_1_2_2(or_688_nl, mux_534_nl, fsm_output[1]);
  assign nor_144_nl = ~((fsm_output[2]) | mux_535_nl);
  assign and_356_nl = reg_modulo_add_4_slc_32_svs_st_cse & (fsm_output[2]) & (fsm_output[1])
      & (fsm_output[0]) & (fsm_output[5]) & (~ (fsm_output[7]));
  assign mux_536_nl = MUX_s_1_2_2(nor_144_nl, and_356_nl, fsm_output[3]);
  assign nand_49_nl = ~((fsm_output[4]) & mux_536_nl);
  assign mux_554_itm = MUX_s_1_2_2(mux_553_nl, nand_49_nl, fsm_output[6]);
  assign or_715_cse = reg_modulo_add_4_slc_32_svs_st_cse | (~ (fsm_output[5])) |
      (fsm_output[7]);
  assign or_727_cse = reg_modulo_add_1_slc_32_svs_st_cse | (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_571_nl = MUX_s_1_2_2(mux_tmp_19, or_tmp_77, reg_modulo_add_3_slc_32_svs_st_cse);
  assign or_728_nl = reg_modulo_add_3_slc_32_svs_st_cse | (~ (fsm_output[5])) | (fsm_output[7]);
  assign mux_572_nl = MUX_s_1_2_2(mux_571_nl, or_728_nl, reg_modulo_add_4_slc_32_svs_st_cse);
  assign mux_573_nl = MUX_s_1_2_2(mux_572_nl, or_727_cse, fsm_output[0]);
  assign nor_133_nl = ~((fsm_output[1]) | (fsm_output[2]) | (fsm_output[6]) | mux_573_nl);
  assign nor_134_nl = ~(reg_modulo_add_6_slc_32_svs_st_cse | (~ (fsm_output[6]))
      | (~ (fsm_output[0])) | (fsm_output[5]) | (fsm_output[7]));
  assign nor_135_nl = ~(reg_modulo_add_3_slc_32_svs_st_cse | (fsm_output[6]) | (fsm_output[0])
      | nand_111_cse);
  assign mux_569_nl = MUX_s_1_2_2(nor_134_nl, nor_135_nl, fsm_output[2]);
  assign or_720_nl = reg_modulo_add_7_slc_32_svs_st_cse | nand_111_cse;
  assign or_719_nl = reg_modulo_add_11_slc_32_svs_st_cse | nand_111_cse;
  assign mux_567_nl = MUX_s_1_2_2(or_720_nl, or_719_nl, fsm_output[0]);
  assign or_718_nl = reg_modulo_add_7_slc_32_svs_st_cse | (fsm_output[5]) | (fsm_output[7]);
  assign or_717_nl = reg_modulo_add_6_slc_32_svs_st_cse | (fsm_output[5]) | (fsm_output[7]);
  assign mux_566_nl = MUX_s_1_2_2(or_718_nl, or_717_nl, fsm_output[0]);
  assign mux_568_nl = MUX_s_1_2_2(mux_567_nl, mux_566_nl, fsm_output[6]);
  assign nor_136_nl = ~((fsm_output[2]) | mux_568_nl);
  assign mux_570_nl = MUX_s_1_2_2(mux_569_nl, nor_136_nl, fsm_output[1]);
  assign mux_574_nl = MUX_s_1_2_2(nor_133_nl, mux_570_nl, fsm_output[4]);
  assign mux_562_nl = MUX_s_1_2_2(mux_tmp_19, or_tmp_77, reg_modulo_add_4_slc_32_svs_st_cse);
  assign mux_563_nl = MUX_s_1_2_2(mux_562_nl, or_715_cse, reg_modulo_add_7_slc_32_svs_st_cse);
  assign mux_564_nl = MUX_s_1_2_2(or_715_cse, mux_563_nl, fsm_output[0]);
  assign nor_137_nl = ~((fsm_output[2]) | (fsm_output[6]) | mux_564_nl);
  assign mux_558_nl = MUX_s_1_2_2(mux_tmp_19, or_tmp_77, reg_modulo_add_6_slc_32_svs_st_cse);
  assign or_710_nl = reg_modulo_add_6_slc_32_svs_st_cse | (~ (fsm_output[5])) | (fsm_output[7]);
  assign mux_559_nl = MUX_s_1_2_2(mux_558_nl, or_710_nl, reg_modulo_add_11_slc_32_svs_st_cse);
  assign mux_560_nl = MUX_s_1_2_2(mux_559_nl, or_727_cse, fsm_output[0]);
  assign nor_138_nl = ~((fsm_output[6]) | mux_560_nl);
  assign nor_139_nl = ~(reg_modulo_add_slc_32_svs_st_cse | (fsm_output[5]) | (fsm_output[7]));
  assign nor_140_nl = ~(reg_modulo_add_1_slc_32_svs_st_cse | (fsm_output[5]) | (fsm_output[7]));
  assign mux_555_nl = MUX_s_1_2_2(nor_139_nl, nor_140_nl, fsm_output[0]);
  assign nor_141_nl = ~(reg_modulo_add_4_slc_32_svs_st_cse | (~ (fsm_output[0]))
      | (~ (fsm_output[5])) | (fsm_output[7]));
  assign mux_556_nl = MUX_s_1_2_2(mux_555_nl, nor_141_nl, fsm_output[6]);
  assign mux_561_nl = MUX_s_1_2_2(nor_138_nl, mux_556_nl, fsm_output[2]);
  assign mux_565_nl = MUX_s_1_2_2(nor_137_nl, mux_561_nl, fsm_output[1]);
  assign and_353_nl = (fsm_output[4]) & mux_565_nl;
  assign butterFly_10_tw_asn_itm_mx0c2 = MUX_s_1_2_2(mux_574_nl, and_353_nl, fsm_output[3]);
  assign nor_128_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[3])) | (fsm_output[6])
      | (fsm_output[7]) | nand_83_cse);
  assign or_757_nl = (fsm_output[7]) | nand_83_cse;
  assign mux_600_nl = MUX_s_1_2_2(or_tmp_728, or_757_nl, fsm_output[6]);
  assign nor_129_nl = ~((fsm_output[0]) | (fsm_output[3]) | mux_600_nl);
  assign mux_601_nl = MUX_s_1_2_2(nor_128_nl, nor_129_nl, fsm_output[4]);
  assign or_754_nl = (~ (fsm_output[3])) | (fsm_output[6]) | (~ (fsm_output[7]))
      | (fsm_output[5]) | (fsm_output[1]);
  assign or_752_nl = (~ (fsm_output[7])) | (~ (fsm_output[5])) | (fsm_output[1]);
  assign mux_598_nl = MUX_s_1_2_2(or_752_nl, or_tmp_728, fsm_output[6]);
  assign or_753_nl = (fsm_output[3]) | mux_598_nl;
  assign mux_599_nl = MUX_s_1_2_2(or_754_nl, or_753_nl, fsm_output[0]);
  assign nor_130_nl = ~((fsm_output[4]) | mux_599_nl);
  assign butterFly_13_tw_h_asn_itm_mx0c0 = MUX_s_1_2_2(mux_601_nl, nor_130_nl, fsm_output[2]);
  assign nor_124_nl = ~((~ (fsm_output[5])) | (fsm_output[0]) | (~ (fsm_output[7]))
      | (~ (fsm_output[3])) | (fsm_output[6]));
  assign nor_125_nl = ~((fsm_output[5]) | (fsm_output[0]) | (fsm_output[7]) | (~
      (fsm_output[3])) | (fsm_output[6]));
  assign mux_605_nl = MUX_s_1_2_2(nor_124_nl, nor_125_nl, fsm_output[4]);
  assign mux_606_nl = MUX_s_1_2_2(mux_605_nl, nor_109_cse, fsm_output[2]);
  assign or_772_nl = (fsm_output[3]) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign or_777_nl = (~ (fsm_output[3])) | (~ (fsm_output[7])) | (fsm_output[6]);
  assign mux_603_nl = MUX_s_1_2_2(or_772_nl, or_777_nl, fsm_output[0]);
  assign or_762_nl = (fsm_output[0]) | (fsm_output[7]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_604_nl = MUX_s_1_2_2(mux_603_nl, or_762_nl, fsm_output[5]);
  assign nor_127_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | mux_604_nl);
  assign butterFly_13_tw_h_asn_itm_mx0c1 = MUX_s_1_2_2(mux_606_nl, nor_127_nl, fsm_output[1]);
  assign butterFly_13_tw_h_asn_itm_mx0c2 = and_dcpl_70 & and_dcpl_90;
  assign or_792_nl = (~ (fsm_output[2])) | (fsm_output[4]) | (fsm_output[3]) | (~
      (fsm_output[1])) | (fsm_output[6]);
  assign mux_622_nl = MUX_s_1_2_2(or_tmp_765, or_792_nl, fsm_output[7]);
  assign nand_54_nl = ~((fsm_output[5]) & (~ mux_622_nl));
  assign or_790_nl = (fsm_output[3]) | nand_72_cse;
  assign or_789_nl = (fsm_output[3]) | (fsm_output[1]) | (fsm_output[6]);
  assign mux_619_nl = MUX_s_1_2_2(or_790_nl, or_789_nl, fsm_output[4]);
  assign or_791_nl = (fsm_output[2]) | mux_619_nl;
  assign mux_620_nl = MUX_s_1_2_2(or_791_nl, or_tmp_765, fsm_output[7]);
  assign or_787_nl = (fsm_output[7]) | (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[3])
      | nand_72_cse;
  assign mux_621_nl = MUX_s_1_2_2(mux_620_nl, or_787_nl, fsm_output[5]);
  assign mux_623_itm = MUX_s_1_2_2(nand_54_nl, mux_621_nl, fsm_output[0]);
  assign or_799_nl = (fsm_output[5]) | (~ (fsm_output[7])) | (fsm_output[1]) | (fsm_output[6]);
  assign or_545_nl = (fsm_output[7]) | (fsm_output[1]) | (fsm_output[6]);
  assign mux_626_nl = MUX_s_1_2_2(or_545_nl, or_tmp_773, fsm_output[5]);
  assign mux_627_nl = MUX_s_1_2_2(or_799_nl, mux_626_nl, fsm_output[2]);
  assign nor_122_nl = ~((fsm_output[4:3]!=2'b10) | mux_627_nl);
  assign or_541_nl = (~ (fsm_output[7])) | (fsm_output[1]) | (fsm_output[6]);
  assign mux_624_nl = MUX_s_1_2_2(or_tmp_773, or_541_nl, fsm_output[5]);
  assign or_794_nl = (~ (fsm_output[5])) | (fsm_output[7]) | (~ (fsm_output[1]))
      | (fsm_output[6]);
  assign mux_625_nl = MUX_s_1_2_2(mux_624_nl, or_794_nl, fsm_output[2]);
  assign nor_123_nl = ~((fsm_output[4:3]!=2'b01) | mux_625_nl);
  assign butterFly_10_tw_h_asn_itm_mx0c1 = MUX_s_1_2_2(nor_122_nl, nor_123_nl, fsm_output[0]);
  assign or_807_nl = (fsm_output[0]) | (~ reg_modulo_add_11_slc_32_svs_st_cse) |
      (fsm_output[7:6]!=2'b01);
  assign or_805_nl = (fsm_output[0]) | (~ modulo_add_19_slc_32_svs_st) | (fsm_output[7:6]!=2'b10);
  assign mux_631_nl = MUX_s_1_2_2(or_807_nl, or_805_nl, fsm_output[3]);
  assign or_804_nl = (fsm_output[3]) | (~ (fsm_output[0])) | (~ reg_modulo_add_slc_32_svs_st_cse)
      | (fsm_output[7:6]!=2'b10);
  assign mux_632_nl = MUX_s_1_2_2(mux_631_nl, or_804_nl, fsm_output[5]);
  assign nor_118_nl = ~((fsm_output[1]) | mux_632_nl);
  assign nor_119_nl = ~((fsm_output[5]) | (~ (fsm_output[3])) | (~ (fsm_output[0]))
      | (~ reg_modulo_add_3_slc_32_svs_st_cse) | (fsm_output[7:6]!=2'b00));
  assign nor_120_nl = ~((~ (fsm_output[0])) | (~ reg_modulo_add_7_slc_32_svs_st_cse)
      | (fsm_output[7:6]!=2'b00));
  assign nor_121_nl = ~((fsm_output[0]) | (~ reg_modulo_add_slc_32_svs_st_cse) |
      (fsm_output[7:6]!=2'b01));
  assign mux_629_nl = MUX_s_1_2_2(nor_120_nl, nor_121_nl, fsm_output[3]);
  assign and_352_nl = (fsm_output[5]) & mux_629_nl;
  assign mux_630_nl = MUX_s_1_2_2(nor_119_nl, and_352_nl, fsm_output[1]);
  assign mux_633_nl = MUX_s_1_2_2(nor_118_nl, mux_630_nl, fsm_output[2]);
  assign butterFly_10_tw_h_asn_itm_mx0c2 = mux_633_nl & (fsm_output[4]);
  assign or_816_nl = (fsm_output[0]) | reg_modulo_add_11_slc_32_svs_st_cse | (fsm_output[7:6]!=2'b01);
  assign or_814_nl = (fsm_output[0]) | modulo_add_19_slc_32_svs_st | (fsm_output[7:6]!=2'b10);
  assign mux_636_nl = MUX_s_1_2_2(or_816_nl, or_814_nl, fsm_output[3]);
  assign or_813_nl = (fsm_output[3]) | (~ (fsm_output[0])) | reg_modulo_add_slc_32_svs_st_cse
      | (fsm_output[7:6]!=2'b10);
  assign mux_637_nl = MUX_s_1_2_2(mux_636_nl, or_813_nl, fsm_output[5]);
  assign nor_114_nl = ~((fsm_output[1]) | mux_637_nl);
  assign nor_115_nl = ~((fsm_output[5]) | (~ (fsm_output[3])) | (~ (fsm_output[0]))
      | reg_modulo_add_3_slc_32_svs_st_cse | (fsm_output[7:6]!=2'b00));
  assign nor_116_nl = ~((~ (fsm_output[0])) | reg_modulo_add_7_slc_32_svs_st_cse
      | (fsm_output[7:6]!=2'b00));
  assign nor_117_nl = ~((fsm_output[0]) | reg_modulo_add_slc_32_svs_st_cse | (fsm_output[7:6]!=2'b01));
  assign mux_634_nl = MUX_s_1_2_2(nor_116_nl, nor_117_nl, fsm_output[3]);
  assign and_351_nl = (fsm_output[5]) & mux_634_nl;
  assign mux_635_nl = MUX_s_1_2_2(nor_115_nl, and_351_nl, fsm_output[1]);
  assign mux_638_nl = MUX_s_1_2_2(nor_114_nl, mux_635_nl, fsm_output[2]);
  assign butterFly_10_tw_h_asn_itm_mx0c3 = mux_638_nl & (fsm_output[4]);
  assign butterFly_10_tw_h_asn_itm_mx0c4 = and_dcpl_24 & and_dcpl_144;
  assign or_874_nl = (~ (fsm_output[7])) | (fsm_output[6]) | (~ (fsm_output[2]))
      | (fsm_output[1]) | (~ (fsm_output[3]));
  assign mux_674_nl = MUX_s_1_2_2(or_tmp_847, or_874_nl, fsm_output[5]);
  assign or_872_nl = (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[6]) | (fsm_output[2])
      | (~ (fsm_output[1])) | (fsm_output[3]);
  assign mux_675_nl = MUX_s_1_2_2(mux_674_nl, or_872_nl, fsm_output[4]);
  assign or_871_nl = (fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[1])) | (fsm_output[3]);
  assign mux_673_nl = MUX_s_1_2_2(or_871_nl, or_tmp_847, fsm_output[5]);
  assign nand_61_nl = ~((fsm_output[4]) & (~ mux_673_nl));
  assign mux_676_itm = MUX_s_1_2_2(mux_675_nl, nand_61_nl, fsm_output[0]);
  assign nor_95_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[4])) | (fsm_output[1])
      | (fsm_output[7]) | (~ (fsm_output[6])));
  assign nor_96_nl = ~((fsm_output[5]) | (fsm_output[4]) | (~ (fsm_output[1])) |
      (~ (fsm_output[7])) | (fsm_output[6]));
  assign mux_715_nl = MUX_s_1_2_2(nor_95_nl, nor_96_nl, fsm_output[3]);
  assign nor_97_nl = ~((~ (fsm_output[1])) | (fsm_output[7]) | (~ (fsm_output[6])));
  assign nor_98_nl = ~((fsm_output[1]) | (fsm_output[7]) | (fsm_output[6]));
  assign mux_712_nl = MUX_s_1_2_2(nor_97_nl, nor_98_nl, fsm_output[4]);
  assign nor_99_nl = ~((fsm_output[4]) | (~ (fsm_output[1])) | (~ (fsm_output[7]))
      | (fsm_output[6]));
  assign mux_713_nl = MUX_s_1_2_2(mux_712_nl, nor_99_nl, fsm_output[5]);
  assign nor_100_nl = ~((~ (fsm_output[5])) | (fsm_output[4]) | (fsm_output[1]) |
      (fsm_output[7]) | (fsm_output[6]));
  assign mux_714_nl = MUX_s_1_2_2(mux_713_nl, nor_100_nl, fsm_output[3]);
  assign mux_716_nl = MUX_s_1_2_2(mux_715_nl, mux_714_nl, fsm_output[0]);
  assign modulo_add_base_1_sva_mx0c0 = mux_716_nl & (fsm_output[2]);
  assign modulo_add_base_1_sva_mx0c1 = and_dcpl_136 & and_dcpl_123;
  assign modulo_add_base_1_sva_mx0c4 = and_dcpl_136 & and_dcpl_90;
  assign modulo_add_base_1_sva_mx0c5 = and_dcpl_74 & and_dcpl_148;
  assign modulo_add_base_1_sva_mx0c8 = and_dcpl_74 & and_dcpl_72;
  assign modulo_add_base_1_sva_mx0c9 = and_dcpl_216 & and_dcpl_90;
  assign modulo_add_base_1_sva_mx0c12 = and_dcpl_70 & and_dcpl_38;
  assign modulo_add_base_1_sva_mx0c13 = and_dcpl_88 & and_dcpl_43;
  assign modulo_add_base_1_sva_mx0c16 = and_dcpl_92 & and_dcpl_144;
  assign modulo_add_base_1_sva_mx0c17 = and_dcpl_150 & and_dcpl_21;
  assign modulo_add_base_1_sva_mx0c20 = and_dcpl_150 & and_dcpl_169;
  assign modulo_add_base_1_sva_mx0c21 = and_dcpl_34 & and_dcpl_144;
  assign modulo_add_base_1_sva_mx0c24 = and_dcpl_34 & and_dcpl_141;
  assign modulo_sub_1_mux_itm_mx0c1 = and_dcpl_255 & and_dcpl_184 & (fsm_output[2])
      & (~ (acc_7_cse_32_1[31]));
  assign modulo_sub_2_mux_itm_mx0c1 = and_dcpl_262 & and_dcpl_184 & (fsm_output[2])
      & (~ (acc_5_cse_32_1[31]));
  assign modulo_sub_5_mux_itm_mx0c1 = and_dcpl_271 & and_dcpl_31 & (~ (fsm_output[2]))
      & (~ (acc_5_cse_32_1[31]));
  assign modulo_sub_6_mux_itm_mx0c1 = and_dcpl_278 & and_dcpl_31 & (~ (fsm_output[2]))
      & (~ (acc_8_cse_32_1[31]));
  assign modulo_sub_9_mux_itm_mx0c1 = and_dcpl_286 & and_dcpl_284 & (~ (fsm_output[2]))
      & (~ (acc_6_cse_32_1[31]));
  assign modulo_sub_10_mux_itm_mx0c1 = and_dcpl_293 & and_dcpl_210 & (~ (fsm_output[2]))
      & (~ (acc_7_cse_32_1[31]));
  assign modulo_sub_13_mux_itm_mx0c1 = and_dcpl_301 & and_dcpl_184 & (fsm_output[2])
      & (~ (acc_5_cse_32_1[31]));
  assign modulo_sub_14_mux_itm_mx0c1 = and_dcpl_310 & and_dcpl_284 & (~ (fsm_output[2]))
      & (~ (acc_8_cse_32_1[31]));
  assign modulo_sub_17_mux_itm_mx0c1 = and_dcpl_317 & and_dcpl_31 & (~ (fsm_output[2]))
      & (~ (acc_5_cse_32_1[31]));
  assign modulo_sub_18_mux_itm_mx0c1 = and_dcpl_324 & and_dcpl_184 & (~ (fsm_output[2]))
      & (~ (acc_8_cse_32_1[31]));
  assign modulo_sub_21_mux_itm_mx0c1 = and_dcpl_331 & and_dcpl_210 & (~ (fsm_output[2]))
      & (~ (acc_5_cse_32_1[31]));
  assign modulo_sub_22_mux_itm_mx0c1 = and_dcpl_188 & and_dcpl_210 & (~ (fsm_output[2]))
      & (~ (acc_8_cse_32_1[31]));
  assign or_139_nl = (fsm_output[4]) | (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_132_nl = MUX_s_1_2_2(or_139_nl, or_tmp_127, fsm_output[3]);
  assign mux_130_nl = MUX_s_1_2_2((~ or_tmp_77), nor_tmp_9, fsm_output[4]);
  assign nand_103_nl = ~((fsm_output[0]) & mux_130_nl);
  assign mux_131_nl = MUX_s_1_2_2(nand_103_nl, or_tmp_124, fsm_output[3]);
  assign mux_133_nl = MUX_s_1_2_2(mux_132_nl, mux_131_nl, fsm_output[1]);
  assign or_136_nl = (fsm_output[0]) | not_tmp_95;
  assign mux_128_nl = MUX_s_1_2_2(or_136_nl, or_tmp_124, fsm_output[3]);
  assign mux_129_nl = MUX_s_1_2_2(mux_128_nl, or_tmp_122, fsm_output[1]);
  assign mux_134_nl = MUX_s_1_2_2(mux_133_nl, mux_129_nl, fsm_output[2]);
  assign nor_332_nl = ~(mux_134_nl | (fsm_output[6]));
  assign and_85_nl = and_dcpl_74 & and_dcpl_68;
  assign and_86_nl = and_dcpl_74 & and_dcpl_43;
  assign and_98_nl = and_dcpl_92 & and_dcpl_38;
  assign and_99_nl = and_dcpl_92 & and_dcpl_83;
  assign and_103_nl = and_dcpl_34 & and_dcpl_85;
  assign and_104_nl = and_dcpl_34 & and_dcpl_21;
  assign xx_rsci_d_d = MUX1HOT_v_32_17_2(butterFly_10_f1_sva, modulo_sub_7_mux_itm,
      modulo_sub_4_mux_itm, butterFly_10_tw_asn_itm, modulo_sub_5_mux_itm, modulo_sub_6_mux_itm,
      butterFly_10_tw_h_asn_itm, reg_mult_2_res_lpi_4_dfm_cse, reg_mult_1_res_lpi_4_dfm_cse,
      modulo_sub_15_mux_itm, modulo_sub_12_mux_itm, modulo_sub_13_mux_itm, modulo_sub_14_mux_itm,
      modulo_sub_23_mux_itm, modulo_sub_20_mux_itm, modulo_sub_21_mux_itm, modulo_sub_22_mux_itm,
      {and_dcpl_73 , and_dcpl_75 , and_dcpl_78 , nor_332_nl , and_85_nl , and_86_nl
      , and_dcpl_82 , and_dcpl_84 , and_dcpl_86 , and_dcpl_89 , and_dcpl_91 , and_98_nl
      , and_99_nl , and_dcpl_96 , and_dcpl_97 , and_103_nl , and_104_nl});
  assign S2_COPY_LOOP_for_or_7_nl = xx_rsci_radr_d_mx0c0 | xx_rsci_radr_d_mx0c10
      | xx_rsci_radr_d_mx0c1 | xx_rsci_radr_d_mx0c2 | xx_rsci_radr_d_mx0c3 | xx_rsci_radr_d_mx0c4
      | xx_rsci_radr_d_mx0c5 | xx_rsci_radr_d_mx0c6 | xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_mux1h_nl = MUX1HOT_v_5_3_2(S1_OUTER_LOOP_for_acc_cse_sva,
      ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}), S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
      {S2_COPY_LOOP_for_or_7_nl , xx_rsci_radr_d_mx0c8 , and_dcpl_122});
  assign S2_COPY_LOOP_for_or_8_nl = xx_rsci_radr_d_mx0c0 | xx_rsci_radr_d_mx0c1 |
      xx_rsci_radr_d_mx0c2 | xx_rsci_radr_d_mx0c3 | xx_rsci_radr_d_mx0c4 | xx_rsci_radr_d_mx0c5
      | xx_rsci_radr_d_mx0c6 | xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_mux1h_8_nl = MUX1HOT_v_2_4_2(S2_INNER_LOOP1_r_4_2_sva_1_0,
      (S1_OUTER_LOOP_for_acc_cse_sva[4:3]), ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg}), (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:3]),
      {S2_COPY_LOOP_for_or_8_nl , xx_rsci_radr_d_mx0c8 , and_dcpl_122 , xx_rsci_radr_d_mx0c10});
  assign S2_COPY_LOOP_for_mux1h_9_nl = MUX1HOT_v_3_9_2(3'b101, 3'b011, 3'b001, 3'b110,
      3'b100, 3'b010, (S1_OUTER_LOOP_for_acc_cse_sva[2:0]), reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg,
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[2:0]), {xx_rsci_radr_d_mx0c1 , xx_rsci_radr_d_mx0c2
      , xx_rsci_radr_d_mx0c3 , xx_rsci_radr_d_mx0c4 , xx_rsci_radr_d_mx0c5 , xx_rsci_radr_d_mx0c6
      , xx_rsci_radr_d_mx0c8 , and_dcpl_122 , xx_rsci_radr_d_mx0c10});
  assign S2_COPY_LOOP_for_not_nl = ~ xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_and_2_nl = MUX_v_3_2_2(3'b000, S2_COPY_LOOP_for_mux1h_9_nl,
      S2_COPY_LOOP_for_not_nl);
  assign S2_COPY_LOOP_for_or_5_nl = MUX_v_3_2_2(S2_COPY_LOOP_for_and_2_nl, 3'b111,
      xx_rsci_radr_d_mx0c0);
  assign xx_rsci_radr_d = {S2_COPY_LOOP_for_mux1h_nl , S2_COPY_LOOP_for_mux1h_8_nl
      , S2_COPY_LOOP_for_or_5_nl};
  assign S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_6_nl = MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, and_dcpl_86);
  assign S2_COPY_LOOP_for_mux1h_10_nl = MUX1HOT_s_1_3_2((reg_drf_revArr_ptr_smx_9_0_cse[4]),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4]), reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg,
      {and_dcpl_73 , and_dcpl_84 , and_dcpl_86});
  assign S2_COPY_LOOP_for_or_nl = (S2_COPY_LOOP_for_mux1h_10_nl & (~(xx_rsci_wadr_d_mx0c3
      | xx_rsci_wadr_d_mx0c4 | xx_rsci_wadr_d_mx0c6 | and_dcpl_82))) | xx_rsci_wadr_d_mx0c1
      | xx_rsci_wadr_d_mx0c2 | xx_rsci_wadr_d_mx0c5 | xx_rsci_wadr_d_mx0c7;
  assign S2_COPY_LOOP_for_or_9_nl = xx_rsci_wadr_d_mx0c1 | xx_rsci_wadr_d_mx0c2 |
      xx_rsci_wadr_d_mx0c3 | xx_rsci_wadr_d_mx0c4 | xx_rsci_wadr_d_mx0c5 | xx_rsci_wadr_d_mx0c6
      | xx_rsci_wadr_d_mx0c7 | and_dcpl_82;
  assign S2_COPY_LOOP_for_mux1h_11_nl = MUX1HOT_v_2_4_2((reg_drf_revArr_ptr_smx_9_0_cse[3:2]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[3:2]), ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])}), {and_dcpl_73 , S2_COPY_LOOP_for_or_9_nl
      , and_dcpl_84 , and_dcpl_86});
  assign S2_COPY_LOOP_for_or_2_nl = xx_rsci_wadr_d_mx0c4 | xx_rsci_wadr_d_mx0c5;
  assign S2_COPY_LOOP_for_or_3_nl = xx_rsci_wadr_d_mx0c6 | xx_rsci_wadr_d_mx0c7;
  assign S2_COPY_LOOP_for_mux1h_12_nl = MUX1HOT_v_2_5_2((reg_drf_revArr_ptr_smx_9_0_cse[1:0]),
      2'b01, 2'b10, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]), (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1:0]),
      {and_dcpl_73 , S2_COPY_LOOP_for_or_2_nl , S2_COPY_LOOP_for_or_3_nl , and_dcpl_84
      , and_dcpl_86});
  assign S2_COPY_LOOP_for_nor_1_nl = ~(xx_rsci_wadr_d_mx0c2 | xx_rsci_wadr_d_mx0c3);
  assign S2_COPY_LOOP_for_and_1_nl = MUX_v_2_2_2(2'b00, S2_COPY_LOOP_for_mux1h_12_nl,
      S2_COPY_LOOP_for_nor_1_nl);
  assign S2_COPY_LOOP_for_or_4_nl = xx_rsci_wadr_d_mx0c1 | and_dcpl_82;
  assign S2_COPY_LOOP_for_or_1_nl = MUX_v_2_2_2(S2_COPY_LOOP_for_and_1_nl, 2'b11,
      S2_COPY_LOOP_for_or_4_nl);
  assign xx_rsci_wadr_d = {S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_6_nl , S2_COPY_LOOP_for_or_nl
      , S2_COPY_LOOP_for_mux1h_11_nl , S2_COPY_LOOP_for_or_1_nl};
  assign mux_157_nl = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[7]);
  assign or_176_nl = (~ (fsm_output[7])) | (fsm_output[3]);
  assign or_175_nl = (~ (fsm_output[0])) | (fsm_output[2]);
  assign mux_158_nl = MUX_s_1_2_2(mux_157_nl, or_176_nl, or_175_nl);
  assign or_174_nl = (fsm_output[2]) | (~ (fsm_output[7])) | (fsm_output[3]);
  assign mux_159_nl = MUX_s_1_2_2(mux_158_nl, or_174_nl, fsm_output[1]);
  assign nor_279_nl = ~((fsm_output[4]) | mux_159_nl);
  assign and_394_nl = or_125_cse & (fsm_output[7]);
  assign mux_155_nl = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), and_394_nl);
  assign or_172_nl = and_403_cse | (fsm_output[7]);
  assign mux_154_nl = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), or_172_nl);
  assign mux_156_nl = MUX_s_1_2_2(mux_155_nl, mux_154_nl, fsm_output[1]);
  assign and_393_nl = (fsm_output[4]) & (~ mux_156_nl);
  assign mux_160_nl = MUX_s_1_2_2(nor_279_nl, and_393_nl, fsm_output[5]);
  assign nor_280_nl = ~((fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[7]) |
      (fsm_output[3]));
  assign and_nl = (fsm_output[1]) & (fsm_output[2]) & (~ (fsm_output[7])) & (fsm_output[3]);
  assign mux_153_nl = MUX_s_1_2_2(nor_280_nl, and_nl, fsm_output[4]);
  assign and_396_nl = (fsm_output[5]) & mux_153_nl;
  assign xx_rsci_we_d_pff = MUX_s_1_2_2(mux_160_nl, and_396_nl, fsm_output[6]);
  assign or_188_nl = (~ (fsm_output[4])) | (fsm_output[6]);
  assign mux_169_nl = MUX_s_1_2_2(or_188_nl, or_900_cse, fsm_output[3]);
  assign mux_170_nl = MUX_s_1_2_2(mux_169_nl, mux_tmp_164, fsm_output[2]);
  assign or_187_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (fsm_output[4]) | (~
      (fsm_output[6]));
  assign nand_102_nl = ~((fsm_output[3]) & (fsm_output[7]) & (fsm_output[4]) & (~
      (fsm_output[6])));
  assign mux_168_nl = MUX_s_1_2_2(or_187_nl, nand_102_nl, fsm_output[2]);
  assign mux_171_nl = MUX_s_1_2_2(mux_170_nl, mux_168_nl, fsm_output[5]);
  assign mux_172_nl = MUX_s_1_2_2(mux_171_nl, or_tmp_173, fsm_output[1]);
  assign or_178_nl = (fsm_output[2]) | (~ (fsm_output[3])) | (~ (fsm_output[7]))
      | (~ (fsm_output[4])) | (fsm_output[6]);
  assign mux_166_nl = MUX_s_1_2_2(mux_tmp_165, or_178_nl, fsm_output[5]);
  assign mux_167_nl = MUX_s_1_2_2(or_tmp_173, mux_166_nl, fsm_output[1]);
  assign mux_173_nl = MUX_s_1_2_2(mux_172_nl, mux_167_nl, fsm_output[0]);
  assign xx_rsci_readA_r_ram_ir_internal_RMASK_B_d = ~ mux_173_nl;
  assign or_207_nl = (fsm_output[0]) | (~ and_425_cse);
  assign mux_186_nl = MUX_s_1_2_2(or_tmp_197, or_207_nl, fsm_output[3]);
  assign and_388_nl = (fsm_output[1]) & (~ mux_186_nl);
  assign nor_269_nl = ~((fsm_output[1]) | (fsm_output[3]) | (fsm_output[0]) | (fsm_output[6])
      | (fsm_output[5]));
  assign mux_187_nl = MUX_s_1_2_2(and_388_nl, nor_269_nl, fsm_output[2]);
  assign and_140_nl = mux_187_nl & and_dcpl_66;
  assign nor_267_nl = ~((~ (fsm_output[5])) | (fsm_output[2]) | (fsm_output[0]) |
      (fsm_output[7]) | (fsm_output[6]) | (fsm_output[3]));
  assign nand_19_nl = ~((fsm_output[1]) & (~ mux_tmp_188));
  assign mux_189_nl = MUX_s_1_2_2(mux_tmp_188, or_210_cse, fsm_output[1]);
  assign nand_18_nl = ~((fsm_output[0]) & (~ mux_189_nl));
  assign mux_190_nl = MUX_s_1_2_2(nand_19_nl, nand_18_nl, fsm_output[2]);
  assign nor_268_nl = ~((fsm_output[5]) | mux_190_nl);
  assign mux_191_nl = MUX_s_1_2_2(nor_267_nl, nor_268_nl, fsm_output[4]);
  assign and_145_nl = and_dcpl_139 & and_dcpl_95;
  assign and_147_nl = and_dcpl_139 & and_dcpl_141;
  assign and_152_nl = and_dcpl_70 & and_dcpl_83;
  assign and_154_nl = and_dcpl_70 & and_dcpl_148;
  assign and_158_nl = and_dcpl_150 & and_dcpl_123;
  assign and_159_nl = and_dcpl_150 & and_dcpl_87;
  assign yy_rsci_d_d = MUX1HOT_v_32_15_2(butterFly_10_f1_sva, modulo_sub_3_mux_itm,
      modulo_sub_mux_itm, butterFly_10_tw_asn_itm, modulo_sub_1_mux_itm, modulo_sub_2_mux_itm,
      butterFly_10_tw_h_asn_itm, modulo_sub_11_mux_itm, modulo_sub_8_mux_itm, modulo_sub_9_mux_itm,
      modulo_sub_10_mux_itm, modulo_sub_19_mux_itm, modulo_sub_16_mux_itm, modulo_sub_17_mux_itm,
      modulo_sub_18_mux_itm, {and_140_nl , and_dcpl_137 , and_dcpl_138 , mux_191_nl
      , and_145_nl , and_147_nl , and_dcpl_143 , and_dcpl_145 , and_dcpl_146 , and_152_nl
      , and_154_nl , and_dcpl_151 , and_dcpl_152 , and_158_nl , and_159_nl});
  assign S1_OUTER_LOOP_for_or_8_nl = yy_rsci_radr_d_mx0c1 | and_dcpl_71 | yy_rsci_radr_d_mx0c2
      | and_dcpl_162 | and_dcpl_164 | yy_rsci_radr_d_mx0c5 | and_dcpl_166 | and_dcpl_167
      | and_dcpl_168;
  assign S1_OUTER_LOOP_for_mux1h_nl = MUX1HOT_v_5_3_2(({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}),
      S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0, {yy_rsci_radr_d_mx0c0
      , S1_OUTER_LOOP_for_or_8_nl , yy_rsci_radr_d_mx0c9});
  assign S1_OUTER_LOOP_for_or_10_nl = yy_rsci_radr_d_mx0c1 | yy_rsci_radr_d_mx0c2
      | and_dcpl_162 | and_dcpl_164 | yy_rsci_radr_d_mx0c5 | and_dcpl_166 | and_dcpl_167
      | and_dcpl_168;
  assign S1_OUTER_LOOP_for_mux1h_5_nl = MUX1HOT_v_2_4_2((S1_OUTER_LOOP_for_acc_cse_sva[4:3]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg}),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:3]), {yy_rsci_radr_d_mx0c0 , S1_OUTER_LOOP_for_or_10_nl
      , yy_rsci_radr_d_mx0c9 , and_dcpl_71});
  assign S1_OUTER_LOOP_for_mux1h_6_nl = MUX1HOT_v_3_9_2((S1_OUTER_LOOP_for_acc_cse_sva[2:0]),
      3'b101, 3'b011, 3'b001, 3'b110, 3'b100, 3'b010, reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg,
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[2:0]), {yy_rsci_radr_d_mx0c0 , yy_rsci_radr_d_mx0c2
      , and_dcpl_162 , and_dcpl_164 , yy_rsci_radr_d_mx0c5 , and_dcpl_166 , and_dcpl_167
      , yy_rsci_radr_d_mx0c9 , and_dcpl_71});
  assign S1_OUTER_LOOP_for_not_5_nl = ~ and_dcpl_168;
  assign S1_OUTER_LOOP_for_and_3_nl = MUX_v_3_2_2(3'b000, S1_OUTER_LOOP_for_mux1h_6_nl,
      S1_OUTER_LOOP_for_not_5_nl);
  assign S1_OUTER_LOOP_for_or_6_nl = MUX_v_3_2_2(S1_OUTER_LOOP_for_and_3_nl, 3'b111,
      yy_rsci_radr_d_mx0c1);
  assign yy_rsci_radr_d = {S1_OUTER_LOOP_for_mux1h_nl , S1_OUTER_LOOP_for_mux1h_5_nl
      , S1_OUTER_LOOP_for_or_6_nl};
  assign S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl = MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, yy_rsci_wadr_d_mx0c1);
  assign S1_OUTER_LOOP_for_mux1h_7_nl = MUX1HOT_s_1_3_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4]),
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg, (reg_drf_revArr_ptr_smx_9_0_cse[4]), {yy_rsci_wadr_d_mx0c0
      , yy_rsci_wadr_d_mx0c1 , yy_rsci_wadr_d_mx0c10});
  assign S1_OUTER_LOOP_for_or_1_nl = (S1_OUTER_LOOP_for_mux1h_7_nl & (~(yy_rsci_wadr_d_mx0c4
      | yy_rsci_wadr_d_mx0c5 | yy_rsci_wadr_d_mx0c7 | and_dcpl_143))) | yy_rsci_wadr_d_mx0c2
      | yy_rsci_wadr_d_mx0c3 | yy_rsci_wadr_d_mx0c6 | yy_rsci_wadr_d_mx0c8;
  assign S1_OUTER_LOOP_for_or_9_nl = yy_rsci_wadr_d_mx0c2 | yy_rsci_wadr_d_mx0c3
      | yy_rsci_wadr_d_mx0c4 | yy_rsci_wadr_d_mx0c5 | yy_rsci_wadr_d_mx0c6 | yy_rsci_wadr_d_mx0c7
      | yy_rsci_wadr_d_mx0c8 | and_dcpl_143;
  assign S1_OUTER_LOOP_for_mux1h_8_nl = MUX1HOT_v_2_4_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[3:2]),
      ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])}),
      S2_INNER_LOOP1_r_4_2_sva_1_0, (reg_drf_revArr_ptr_smx_9_0_cse[3:2]), {yy_rsci_wadr_d_mx0c0
      , yy_rsci_wadr_d_mx0c1 , S1_OUTER_LOOP_for_or_9_nl , yy_rsci_wadr_d_mx0c10});
  assign S1_OUTER_LOOP_for_or_3_nl = yy_rsci_wadr_d_mx0c5 | yy_rsci_wadr_d_mx0c6;
  assign S1_OUTER_LOOP_for_or_4_nl = yy_rsci_wadr_d_mx0c7 | yy_rsci_wadr_d_mx0c8;
  assign S1_OUTER_LOOP_for_mux1h_9_nl = MUX1HOT_v_2_5_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]),
      (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1:0]), 2'b01, 2'b10, (reg_drf_revArr_ptr_smx_9_0_cse[1:0]),
      {yy_rsci_wadr_d_mx0c0 , yy_rsci_wadr_d_mx0c1 , S1_OUTER_LOOP_for_or_3_nl ,
      S1_OUTER_LOOP_for_or_4_nl , yy_rsci_wadr_d_mx0c10});
  assign S1_OUTER_LOOP_for_nor_1_nl = ~(yy_rsci_wadr_d_mx0c3 | yy_rsci_wadr_d_mx0c4);
  assign S1_OUTER_LOOP_for_and_2_nl = MUX_v_2_2_2(2'b00, S1_OUTER_LOOP_for_mux1h_9_nl,
      S1_OUTER_LOOP_for_nor_1_nl);
  assign S1_OUTER_LOOP_for_or_5_nl = yy_rsci_wadr_d_mx0c2 | and_dcpl_143;
  assign S1_OUTER_LOOP_for_or_2_nl = MUX_v_2_2_2(S1_OUTER_LOOP_for_and_2_nl, 2'b11,
      S1_OUTER_LOOP_for_or_5_nl);
  assign yy_rsci_wadr_d = {S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl , S1_OUTER_LOOP_for_or_1_nl
      , S1_OUTER_LOOP_for_mux1h_8_nl , S1_OUTER_LOOP_for_or_2_nl};
  assign or_252_nl = (~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[7]);
  assign mux_211_nl = MUX_s_1_2_2(or_252_nl, or_tmp_236, fsm_output[2]);
  assign nor_257_nl = ~((fsm_output[6]) | (fsm_output[3]) | mux_211_nl);
  assign and_387_nl = (fsm_output[3]) & mux_tmp_208;
  assign nor_258_nl = ~((fsm_output[3]) | (fsm_output[7]));
  assign mux_210_nl = MUX_s_1_2_2(and_387_nl, nor_258_nl, fsm_output[6]);
  assign mux_212_nl = MUX_s_1_2_2(nor_257_nl, mux_210_nl, fsm_output[4]);
  assign or_248_nl = (fsm_output[3]) | mux_tmp_208;
  assign or_246_nl = (~ (fsm_output[3])) | (fsm_output[2]) | (fsm_output[0]) | (~
      (fsm_output[1])) | (fsm_output[7]);
  assign mux_209_nl = MUX_s_1_2_2(or_248_nl, or_246_nl, fsm_output[6]);
  assign nor_259_nl = ~((fsm_output[4]) | mux_209_nl);
  assign yy_rsci_we_d_pff = MUX_s_1_2_2(mux_212_nl, nor_259_nl, fsm_output[5]);
  assign nor_252_nl = ~((~ (fsm_output[0])) | (fsm_output[4]) | (fsm_output[6]) |
      (fsm_output[7]) | (~ and_953_cse));
  assign nor_253_nl = ~((fsm_output[6]) | (~ and_tmp_6));
  assign nor_254_nl = ~((fsm_output[7:6]!=2'b01) | and_953_cse);
  assign mux_216_nl = MUX_s_1_2_2(nor_253_nl, nor_254_nl, fsm_output[4]);
  assign mux_217_nl = MUX_s_1_2_2(nor_252_nl, mux_216_nl, fsm_output[5]);
  assign nor_255_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[6])) | (fsm_output[7])
      | (~ (fsm_output[1])) | (fsm_output[2]));
  assign or_254_nl = (fsm_output[7]) | (~ and_953_cse);
  assign mux_214_nl = MUX_s_1_2_2(and_tmp_6, or_254_nl, fsm_output[6]);
  assign nor_256_nl = ~((fsm_output[4]) | mux_214_nl);
  assign mux_215_nl = MUX_s_1_2_2(nor_255_nl, nor_256_nl, fsm_output[5]);
  assign yy_rsci_readA_r_ram_ir_internal_RMASK_B_d = MUX_s_1_2_2(mux_217_nl, mux_215_nl,
      fsm_output[3]);
  assign or_1063_nl = (fsm_output[1]) | mux_467_cse;
  assign or_1059_nl = (fsm_output[0]) | (fsm_output[7]) | (fsm_output[6]);
  assign mux_757_nl = MUX_s_1_2_2(or_585_cse, or_1059_nl, fsm_output[5]);
  assign nand_136_nl = ~((fsm_output[1]) & (~ mux_757_nl));
  assign mux_759_nl = MUX_s_1_2_2(or_1063_nl, nand_136_nl, fsm_output[2]);
  assign nor_406_nl = ~((fsm_output[4]) | mux_759_nl);
  assign not_tmp_396 = MUX_s_1_2_2(nor_406_nl, nor_159_cse, fsm_output[3]);
  assign or_tmp_975 = (~ (fsm_output[7])) | (fsm_output[2]);
  assign or_tmp_983 = (fsm_output[0]) | (~ (fsm_output[5])) | (fsm_output[6]);
  assign and_dcpl_358 = ~((fsm_output[7]) | (fsm_output[5]));
  assign and_dcpl_360 = (fsm_output[3]) & (~ (fsm_output[6]));
  assign and_dcpl_370 = ~((fsm_output[3]) | (fsm_output[6]));
  assign and_dcpl_382 = (~ (fsm_output[3])) & (fsm_output[6]);
  assign and_dcpl_406 = (fsm_output[2]) & (~ (fsm_output[6]));
  assign and_dcpl_425 = and_dcpl_184 & (fsm_output[2]) & (fsm_output[6]);
  assign and_dcpl_441 = ~((fsm_output[2]) | (fsm_output[6]));
  assign nor_425_cse = ~((fsm_output[7]) | (fsm_output[5]) | (~ (fsm_output[4]))
      | (fsm_output[0]));
  assign and_715_cse_1 = and_953_cse & (fsm_output[3]) & (fsm_output[6]);
  assign and_dcpl_628 = (fsm_output[7]) & (~ (fsm_output[5]));
  assign and_dcpl_731 = and_dcpl_23 & (fsm_output[4]) & (fsm_output[0]);
  assign and_dcpl_737 = and_dcpl_23 & (fsm_output[4]) & (~ (fsm_output[0]));
  assign nor_430_nl = ~((fsm_output[5]) | (~ (fsm_output[7])) | (~ (fsm_output[3]))
      | (fsm_output[2]) | (fsm_output[1]));
  assign nor_431_nl = ~((~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[3]) |
      nand_96_cse);
  assign mux_751_nl = MUX_s_1_2_2(nor_430_nl, nor_431_nl, fsm_output[0]);
  assign and_441_ssc = mux_751_nl & and_dcpl_27;
  assign or_tmp_1011 = (fsm_output[3:1]!=3'b101);
  assign mux_tmp_788 = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[1]);
  assign or_tmp_1036 = (fsm_output[2:0]!=3'b000);
  assign nor_tmp_102 = (fsm_output[5]) & (fsm_output[1]);
  assign or_tmp_1052 = (fsm_output[6]) | (~ (fsm_output[5])) | (fsm_output[0]) |
      (~ (fsm_output[1]));
  assign or_tmp_1056 = (fsm_output[5]) | (~ (fsm_output[0])) | (fsm_output[1]);
  always @(posedge clk) begin
    if ( core_wen & mux_43_nl ) begin
      m_sva <= m_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( core_wen ) begin
      x_rsci_s_raddr_core_4_0 <= MUX_v_5_2_2(({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
          , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}),
          S2_COPY_LOOP_for_i_5_0_sva_1_4_0, and_dcpl_40);
      x_rsci_s_raddr_core_9_5 <= MUX_v_5_2_2(S2_COPY_LOOP_for_i_5_0_sva_1_4_0, S1_OUTER_LOOP_for_acc_cse_sva,
          and_dcpl_40);
      x_rsci_s_waddr_core_4_0 <= MUX_v_5_2_2(S2_COPY_LOOP_for_i_5_0_sva_1_4_0, ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
          , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}),
          and_dcpl_44);
      x_rsci_s_waddr_core_9_5 <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
          and_dcpl_44);
      x_rsci_s_dout_core <= xx_rsci_q_d;
      reg_twiddle_rsci_s_raddr_core_1_cse <= ((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1])
          & (~ mux_76_nl)) | ((~ mux_81_nl) & nor_242_cse & (~ (fsm_output[2])));
      reg_twiddle_rsci_s_raddr_core_2_cse <= MUX1HOT_s_1_3_2(butterFly_12_tw_and_cse_3_2_sva_0,
          butterFly_tw_and_1_cse, (S2_INNER_LOOP1_r_4_2_sva_1_0[0]), {butterFly_tw_h_or_2_nl
          , and_53_nl , and_dcpl_60});
      reg_twiddle_rsci_s_raddr_core_0_cse <= ((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[0])
          & mux_99_nl) | ((~ mux_102_nl) & nor_242_cse);
      reg_twiddle_rsci_s_raddr_core_3_cse <= MUX1HOT_s_1_3_2(butterFly_12_tw_and_cse_3_2_sva_1,
          (S2_INNER_LOOP1_r_4_2_sva_1_0[1]), (S2_INNER_LOOP1_r_4_2_sva_1_0[1]), {and_dcpl_57
          , and_69_nl , and_dcpl_60});
      revArr_rsci_s_raddr_core <= S1_OUTER_LOOP_for_acc_cse_sva;
      reg_tw_rsci_s_raddr_core_cse <= S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg;
      S34_OUTER_LOOP_for_tf_mul_cmp_a <= MUX_v_5_2_2(5'b00000, S34_OUTER_LOOP_for_tf_mux_1_nl,
          not_1496_nl);
      S34_OUTER_LOOP_for_k_sva_4_0 <= MUX_v_5_2_2(5'b00000, S34_OUTER_LOOP_for_k_mux_nl,
          not_1732_nl);
      reg_drf_revArr_ptr_smx_9_0_cse <= revArr_rsci_s_din_mxwt[4:0];
      mult_3_res_sva <= readslicef_33_32_1(acc_2_nl);
      reg_mult_3_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_4, mult_3_res_sva, z_out_14_32);
      reg_mult_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_5, mult_3_res_sva, z_out_14_32);
      modulo_sub_3_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_8_cse_32_1[30:0])}), modulo_sub_3_qif_acc_nl,
          acc_8_cse_32_1[31]);
      modulo_sub_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_6_cse_32_1[30:0])}), modulo_sub_qif_acc_nl,
          acc_6_cse_32_1[31]);
      reg_mult_1_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_4, mult_3_res_sva, z_out_16_32);
      mult_2_res_sva <= nl_mult_2_res_sva[31:0];
      reg_mult_2_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_5, mult_2_res_sva, z_out_16_32);
      modulo_sub_7_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_6_cse_32_1[30:0])}), modulo_sub_7_qif_acc_nl,
          acc_6_cse_32_1[31]);
      modulo_sub_4_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_7_cse_32_1[30:0])}), modulo_sub_4_qif_acc_nl,
          acc_7_cse_32_1[31]);
      modulo_sub_11_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_5_cse_32_1[30:0])}), modulo_sub_11_qif_acc_nl,
          acc_5_cse_32_1[31]);
      modulo_sub_8_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_8_cse_32_1[30:0])}), modulo_sub_8_qif_acc_nl,
          acc_8_cse_32_1[31]);
      S34_OUTER_LOOP_for_tf_h_sva <= tw_h_rsci_s_din_mxwt;
      S34_OUTER_LOOP_for_tf_sva <= tw_rsci_s_din_mxwt;
      modulo_sub_15_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_6_cse_32_1[30:0])}), modulo_sub_15_qif_acc_nl,
          acc_6_cse_32_1[31]);
      modulo_sub_12_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_7_cse_32_1[30:0])}), modulo_sub_12_qif_acc_nl,
          acc_7_cse_32_1[31]);
      modulo_sub_19_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_6_cse_32_1[30:0])}), modulo_sub_19_qif_acc_nl,
          acc_6_cse_32_1[31]);
      modulo_sub_16_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_7_cse_32_1[30:0])}), modulo_sub_16_qif_acc_nl,
          acc_7_cse_32_1[31]);
      modulo_sub_23_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_6_cse_32_1[30:0])}), modulo_sub_23_qif_acc_nl,
          acc_6_cse_32_1[31]);
      modulo_sub_20_mux_itm <= MUX_v_32_2_2(({1'b0 , (acc_7_cse_32_1[30:0])}), modulo_sub_20_qif_acc_nl,
          acc_7_cse_32_1[31]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_x_rsci_oswt_cse <= 1'b0;
      reg_x_rsci_oswt_1_cse <= 1'b0;
      reg_twiddle_rsci_oswt_cse <= 1'b0;
      reg_revArr_rsci_oswt_cse <= 1'b0;
      reg_tw_rsci_oswt_cse <= 1'b0;
      reg_xx_rsc_cgo_cse <= 1'b0;
      reg_yy_rsc_cgo_cse <= 1'b0;
      reg_x_rsc_triosy_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_ensig_cgo_1_cse <= 1'b0;
      reg_modulo_add_3_slc_32_svs_st_cse <= 1'b0;
      reg_modulo_add_slc_32_svs_st_cse <= 1'b0;
      reg_modulo_add_1_slc_32_svs_st_cse <= 1'b0;
      reg_modulo_add_7_slc_32_svs_st_cse <= 1'b0;
      reg_modulo_add_4_slc_32_svs_st_cse <= 1'b0;
      reg_modulo_add_6_slc_32_svs_st_cse <= 1'b0;
      reg_modulo_add_11_slc_32_svs_st_cse <= 1'b0;
      modulo_add_19_slc_32_svs_st <= 1'b0;
    end
    else if ( core_wen ) begin
      reg_x_rsci_oswt_cse <= (~(or_tmp_29 | (~((fsm_output[0]) ^ (fsm_output[1])))))
          & and_dcpl_27 & (fsm_output[3:2]==2'b00);
      reg_x_rsci_oswt_1_cse <= and_dcpl_34 & and_dcpl_31 & (fsm_output[2]);
      reg_twiddle_rsci_oswt_cse <= MUX_s_1_2_2(mux_64_nl, mux_59_nl, fsm_output[7]);
      reg_revArr_rsci_oswt_cse <= mux_105_nl & and_dcpl_66;
      reg_tw_rsci_oswt_cse <= and_dcpl_71;
      reg_xx_rsc_cgo_cse <= mux_127_rmff;
      reg_yy_rsc_cgo_cse <= mux_185_rmff;
      reg_x_rsc_triosy_obj_iswt0_cse <= and_dcpl_188 & and_dcpl_184 & (fsm_output[2])
          & (S1_OUTER_LOOP_k_5_0_sva_2[5]);
      reg_ensig_cgo_cse <= and_200_rmff;
      reg_ensig_cgo_1_cse <= ~ mux_235_itm;
      reg_modulo_add_3_slc_32_svs_st_cse <= readslicef_34_1_33(acc_14_nl);
      reg_modulo_add_slc_32_svs_st_cse <= readslicef_34_1_33(acc_16_nl);
      reg_modulo_add_1_slc_32_svs_st_cse <= readslicef_34_1_33(acc_18_nl);
      reg_modulo_add_7_slc_32_svs_st_cse <= readslicef_34_1_33(acc_19_nl);
      reg_modulo_add_4_slc_32_svs_st_cse <= readslicef_34_1_33(acc_17_nl);
      reg_modulo_add_6_slc_32_svs_st_cse <= readslicef_34_1_33(acc_21_nl);
      reg_modulo_add_11_slc_32_svs_st_cse <= readslicef_34_1_33(acc_20_nl);
      modulo_add_19_slc_32_svs_st <= readslicef_33_1_32(modulo_add_19_acc_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((z_out_2[2]) | (~ (S1_OUTER_LOOP_k_5_0_sva_2[5])) | operator_20_true_8_slc_operator_20_true_8_acc_14_itm)
        ) begin
      S34_OUTER_LOOP_for_k_slc_S34_OUTER_LOOP_for_k_sva_19_5_4_0_1 <= MUX_v_5_2_2(5'b00000,
          (S1_OUTER_LOOP_for_p_sva_1[9:5]), and_203_nl);
    end
  end
  always @(posedge clk) begin
    if ( mux_785_nl & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg <= (S1_OUTER_LOOP_k_5_0_sva_2[4]) & mux_359_seb;
    end
  end
  always @(posedge clk) begin
    if ( mux_798_nl & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg <= S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl
          & mux_359_seb;
    end
  end
  always @(posedge clk) begin
    if ( mux_807_nl & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg <= MUX_v_3_2_2(3'b000, S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl,
          mux_359_seb);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_5 <= 1'b0;
    end
    else if ( mux_817_nl & core_wen ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_5 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt[5];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= 5'b00000;
    end
    else if ( (~ mux_828_nl) & core_wen ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt[4:0];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_401_nl | (fsm_output[2]))) | S1_OUTER_LOOP_for_p_sva_1_mx0c1)
        ) begin
      S1_OUTER_LOOP_for_p_sva_1 <= MUX_v_20_2_2(z_out_2, ({5'b00000 , S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl}),
          S1_OUTER_LOOP_for_p_sva_1_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~(or_dcpl_15 | (~ (fsm_output[0])) | (fsm_output[3]) | or_35_cse))
        ) begin
      operator_20_true_1_slc_operator_20_true_1_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 | S1_OUTER_LOOP_for_acc_cse_sva_mx0c1
        | S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 | S1_OUTER_LOOP_for_acc_cse_sva_mx0c3
        | and_dcpl_122) ) begin
      S1_OUTER_LOOP_for_acc_cse_sva <= MUX_v_5_2_2(5'b00000, S1_OUTER_LOOP_for_mux1h_3_nl,
          S1_OUTER_LOOP_for_not_4_nl);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (butterFly_10_f1_sva_mx0c0 | butterFly_10_f1_sva_mx0c1 | butterFly_10_f1_sva_mx0c2)
        ) begin
      butterFly_10_f1_sva <= MUX1HOT_v_32_3_2(x_rsci_s_din_mxwt, yy_rsci_q_d, xx_rsci_q_d,
          {butterFly_10_f1_sva_mx0c0 , butterFly_10_f1_sva_mx0c1 , butterFly_10_f1_sva_mx0c2});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_OUTER_LOOP_c_1_sva <= 1'b0;
    end
    else if ( core_wen & (((~ mux_tmp_462) & and_dcpl_66 & (fsm_output[3])) | S2_OUTER_LOOP_c_1_sva_mx0c1
        | S2_OUTER_LOOP_c_1_sva_mx0c2) ) begin
      S2_OUTER_LOOP_c_1_sva <= (S2_OUTER_LOOP_c_1_sva | (z_out_2[2])) & (S2_OUTER_LOOP_c_1_sva_mx0c1
          | S2_OUTER_LOOP_c_1_sva_mx0c2);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_468_nl | (fsm_output[4]))) | S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1
        | S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2) ) begin
      S2_INNER_LOOP1_r_4_2_sva_1_0 <= MUX_v_2_2_2(2'b00, S2_INNER_LOOP1_r_mux_nl,
          S2_INNER_LOOP1_r_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( mux_833_nl & (fsm_output[4:3]==2'b01) & core_wen ) begin
      butterFly_12_tw_and_cse_3_2_sva_1 <= reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg &
          (S2_INNER_LOOP1_r_4_2_sva_1_0[1]);
    end
  end
  always @(posedge clk) begin
    if ( mux_836_nl & (fsm_output[4:3]==2'b01) & core_wen ) begin
      butterFly_12_tw_and_cse_3_2_sva_0 <= butterFly_tw_and_1_cse;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~((mux_506_nl | (fsm_output[5])) & mux_513_itm)) ) begin
      mult_x_1_sva <= MUX_v_32_2_2(yy_rsci_q_d, xx_rsci_q_d, mux_513_itm);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (butterFly_10_tw_asn_itm_mx0c0 | (~ mux_554_itm) | butterFly_10_tw_asn_itm_mx0c2)
        ) begin
      butterFly_10_tw_asn_itm <= MUX1HOT_v_32_3_2(twiddle_rsci_s_din_mxwt, modulo_add_3_mux_itm_mx0w1,
          modulo_add_base_1_sva, {butterFly_10_tw_asn_itm_mx0c0 , (~ mux_554_itm)
          , butterFly_10_tw_asn_itm_mx0c2});
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (((~ mux_592_nl) & and_dcpl_101 & (fsm_output[2])) | and_dcpl_164)
        ) begin
      mult_x_15_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_164);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (butterFly_13_tw_h_asn_itm_mx0c0 | butterFly_13_tw_h_asn_itm_mx0c1
        | butterFly_13_tw_h_asn_itm_mx0c2) ) begin
      butterFly_13_tw_h_asn_itm <= MUX1HOT_v_32_3_2(twiddle_h_rsci_s_din_mxwt, (mult_z_mul_cmp_z[31:0]),
          mult_12_z_mul_cmp_z, {butterFly_13_tw_h_asn_itm_mx0c0 , butterFly_13_tw_h_asn_itm_mx0c1
          , butterFly_13_tw_h_asn_itm_mx0c2});
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~ mux_623_itm) | butterFly_10_tw_h_asn_itm_mx0c1 | butterFly_10_tw_h_asn_itm_mx0c2
        | butterFly_10_tw_h_asn_itm_mx0c3 | butterFly_10_tw_h_asn_itm_mx0c4) ) begin
      butterFly_10_tw_h_asn_itm <= MUX1HOT_v_32_5_2(twiddle_h_rsci_s_din_mxwt, (mult_z_mul_cmp_z[31:0]),
          modulo_add_3_mux_itm_mx0w1, modulo_add_base_1_sva, mult_12_z_mul_cmp_z,
          {(~ mux_623_itm) , butterFly_10_tw_h_asn_itm_mx0c1 , butterFly_10_tw_h_asn_itm_mx0c2
          , butterFly_10_tw_h_asn_itm_mx0c3 , butterFly_10_tw_h_asn_itm_mx0c4});
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_655_nl | (fsm_output[5]))) | and_dcpl_162) ) begin
      mult_x_16_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_162);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_662_nl | (fsm_output[5]))) | and_dcpl_167) ) begin
      butterFly_14_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_167);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (mux_672_nl | (~ mux_676_itm)) ) begin
      butterFly_14_tw_h_asn_itm <= MUX_v_32_2_2((mult_z_mul_cmp_z[31:0]), twiddle_h_rsci_s_din_mxwt,
          mux_676_itm);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~ mux_697_nl) ) begin
      operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm <= mult_z_mul_cmp_z[51:20];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_699_nl | (fsm_output[5]) | (fsm_output[3]))) | and_dcpl_168)
        ) begin
      butterFly_11_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_168);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_706_nl | (fsm_output[5]))) | and_dcpl_166) ) begin
      butterFly_15_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_166);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (modulo_add_base_1_sva_mx0c0 | modulo_add_base_1_sva_mx0c1 |
        and_dcpl_137 | and_dcpl_138 | modulo_add_base_1_sva_mx0c4 | modulo_add_base_1_sva_mx0c5
        | and_dcpl_75 | and_dcpl_78 | modulo_add_base_1_sva_mx0c8 | modulo_add_base_1_sva_mx0c9
        | and_dcpl_145 | and_dcpl_146 | modulo_add_base_1_sva_mx0c12 | modulo_add_base_1_sva_mx0c13
        | and_dcpl_89 | and_dcpl_91 | modulo_add_base_1_sva_mx0c16 | modulo_add_base_1_sva_mx0c17
        | and_dcpl_151 | and_dcpl_152 | modulo_add_base_1_sva_mx0c20 | modulo_add_base_1_sva_mx0c21
        | and_dcpl_96 | and_dcpl_97 | modulo_add_base_1_sva_mx0c24) ) begin
      modulo_add_base_1_sva <= MUX1HOT_v_32_25_2((mult_z_mul_cmp_z[31:0]), modulo_add_base_3_sva_mx0w1,
          modulo_add_base_sva_mx0w2, modulo_add_base_1_sva_mx0w3, modulo_add_base_2_sva_mx0w4,
          modulo_add_base_7_sva_mx0w5, modulo_add_base_4_sva_mx0w6, modulo_add_base_5_sva_mx0w7,
          modulo_add_base_6_sva_mx0w8, modulo_add_base_11_sva_mx0w9, modulo_add_base_8_sva_mx0w10,
          modulo_add_base_9_sva_mx0w11, modulo_add_base_10_sva_mx0w12, modulo_add_base_15_sva_mx0w13,
          modulo_add_base_12_sva_mx0w14, modulo_add_base_13_sva_mx0w15, modulo_add_base_14_sva_mx0w16,
          modulo_add_base_19_sva_mx0w17, modulo_add_base_16_sva_mx0w18, modulo_add_base_17_sva_mx0w19,
          modulo_add_base_18_sva_mx0w20, modulo_add_base_23_sva_mx0w21, modulo_add_base_20_sva_mx0w22,
          modulo_add_base_21_sva_mx0w23, modulo_add_base_22_sva_mx0w24, {modulo_add_base_1_sva_mx0c0
          , modulo_add_base_1_sva_mx0c1 , and_dcpl_137 , and_dcpl_138 , modulo_add_base_1_sva_mx0c4
          , modulo_add_base_1_sva_mx0c5 , and_dcpl_75 , and_dcpl_78 , modulo_add_base_1_sva_mx0c8
          , modulo_add_base_1_sva_mx0c9 , and_dcpl_145 , and_dcpl_146 , modulo_add_base_1_sva_mx0c12
          , modulo_add_base_1_sva_mx0c13 , and_dcpl_89 , and_dcpl_91 , modulo_add_base_1_sva_mx0c16
          , modulo_add_base_1_sva_mx0c17 , and_dcpl_151 , and_dcpl_152 , modulo_add_base_1_sva_mx0c20
          , modulo_add_base_1_sva_mx0c21 , and_dcpl_96 , and_dcpl_97 , modulo_add_base_1_sva_mx0c24});
    end
  end
  always @(posedge clk) begin
    if ( core_wen & mux_743_nl ) begin
      operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm <= mult_z_mul_cmp_z[51:20];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_255 & and_dcpl_184 & (fsm_output[2]) & (acc_7_cse_32_1[31]))
        | modulo_sub_1_mux_itm_mx0c1) ) begin
      modulo_sub_1_mux_itm <= MUX_v_32_2_2(modulo_sub_1_qif_acc_nl, ({1'b0 , (acc_7_cse_32_1[30:0])}),
          modulo_sub_1_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_262 & and_dcpl_184 & (fsm_output[2]) & (acc_5_cse_32_1[31]))
        | modulo_sub_2_mux_itm_mx0c1) ) begin
      modulo_sub_2_mux_itm <= MUX_v_32_2_2(modulo_sub_2_qif_acc_nl, ({1'b0 , (acc_5_cse_32_1[30:0])}),
          modulo_sub_2_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_271 & and_dcpl_31 & (~ (fsm_output[2])) & (acc_5_cse_32_1[31]))
        | modulo_sub_5_mux_itm_mx0c1) ) begin
      modulo_sub_5_mux_itm <= MUX_v_32_2_2(modulo_sub_5_qif_acc_nl, ({1'b0 , (acc_5_cse_32_1[30:0])}),
          modulo_sub_5_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_278 & and_dcpl_31 & (~ (fsm_output[2])) & (acc_8_cse_32_1[31]))
        | modulo_sub_6_mux_itm_mx0c1) ) begin
      modulo_sub_6_mux_itm <= MUX_v_32_2_2(modulo_sub_6_qif_acc_nl, ({1'b0 , (acc_8_cse_32_1[30:0])}),
          modulo_sub_6_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_286 & and_dcpl_284 & (~ (fsm_output[2])) & (acc_6_cse_32_1[31]))
        | modulo_sub_9_mux_itm_mx0c1) ) begin
      modulo_sub_9_mux_itm <= MUX_v_32_2_2(modulo_sub_9_qif_acc_nl, ({1'b0 , (acc_6_cse_32_1[30:0])}),
          modulo_sub_9_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_293 & and_dcpl_210 & (~ (fsm_output[2])) & (acc_7_cse_32_1[31]))
        | modulo_sub_10_mux_itm_mx0c1) ) begin
      modulo_sub_10_mux_itm <= MUX_v_32_2_2(modulo_sub_10_qif_acc_nl, ({1'b0 , (acc_7_cse_32_1[30:0])}),
          modulo_sub_10_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~(or_tmp_466 | (fsm_output[0]) | (~ (fsm_output[3])) | or_tmp_275))
        ) begin
      operator_20_true_8_slc_operator_20_true_8_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_301 & and_dcpl_184 & (fsm_output[2]) & (acc_5_cse_32_1[31]))
        | modulo_sub_13_mux_itm_mx0c1) ) begin
      modulo_sub_13_mux_itm <= MUX_v_32_2_2(modulo_sub_13_qif_acc_nl, ({1'b0 , (acc_5_cse_32_1[30:0])}),
          modulo_sub_13_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_310 & and_dcpl_284 & (~ (fsm_output[2])) & (acc_8_cse_32_1[31]))
        | modulo_sub_14_mux_itm_mx0c1) ) begin
      modulo_sub_14_mux_itm <= MUX_v_32_2_2(modulo_sub_14_qif_acc_nl, ({1'b0 , (acc_8_cse_32_1[30:0])}),
          modulo_sub_14_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_317 & and_dcpl_31 & (~ (fsm_output[2])) & (acc_5_cse_32_1[31]))
        | modulo_sub_17_mux_itm_mx0c1) ) begin
      modulo_sub_17_mux_itm <= MUX_v_32_2_2(modulo_sub_17_qif_acc_nl, ({1'b0 , (acc_5_cse_32_1[30:0])}),
          modulo_sub_17_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_324 & and_dcpl_184 & (~ (fsm_output[2])) & (acc_8_cse_32_1[31]))
        | modulo_sub_18_mux_itm_mx0c1) ) begin
      modulo_sub_18_mux_itm <= MUX_v_32_2_2(modulo_sub_18_qif_acc_nl, ({1'b0 , (acc_8_cse_32_1[30:0])}),
          modulo_sub_18_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_331 & and_dcpl_210 & (~ (fsm_output[2])) & (acc_5_cse_32_1[31]))
        | modulo_sub_21_mux_itm_mx0c1) ) begin
      modulo_sub_21_mux_itm <= MUX_v_32_2_2(modulo_sub_21_qif_acc_nl, ({1'b0 , (acc_5_cse_32_1[30:0])}),
          modulo_sub_21_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_188 & and_dcpl_210 & (~ (fsm_output[2])) & (acc_8_cse_32_1[31]))
        | modulo_sub_22_mux_itm_mx0c1) ) begin
      modulo_sub_22_mux_itm <= MUX_v_32_2_2(modulo_sub_22_qif_acc_nl, ({1'b0 , (acc_8_cse_32_1[30:0])}),
          modulo_sub_22_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~(or_tmp_465 | (~((fsm_output[0]) & (fsm_output[3]))) | or_tmp_275))
        ) begin
      operator_20_true_15_slc_operator_20_true_15_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
    end
  end
  assign mux_40_nl = MUX_s_1_2_2((~ or_tmp_29), (fsm_output[7]), fsm_output[6]);
  assign or_39_nl = (fsm_output[3]) | (fsm_output[0]) | (fsm_output[4]);
  assign mux_41_nl = MUX_s_1_2_2(mux_40_nl, and_422_cse, or_39_nl);
  assign and_416_nl = (fsm_output[3]) & (fsm_output[0]) & (fsm_output[4]);
  assign mux_39_nl = MUX_s_1_2_2(and_422_cse, mux_tmp_37, and_416_nl);
  assign mux_42_nl = MUX_s_1_2_2(mux_41_nl, mux_39_nl, fsm_output[1]);
  assign and_417_nl = (fsm_output[4:3]==2'b11);
  assign mux_38_nl = MUX_s_1_2_2(and_422_cse, mux_tmp_37, and_417_nl);
  assign mux_43_nl = MUX_s_1_2_2(mux_42_nl, mux_38_nl, fsm_output[2]);
  assign and_409_nl = (fsm_output[6]) & (~ mux_tmp_57);
  assign nor_294_nl = ~((fsm_output[6]) | (fsm_output[1]) | (fsm_output[2]));
  assign mux_62_nl = MUX_s_1_2_2(and_409_nl, nor_294_nl, fsm_output[4]);
  assign and_410_nl = (fsm_output[4]) & (fsm_output[6]) & (~(and_950_cse | (fsm_output[2])));
  assign mux_63_nl = MUX_s_1_2_2(mux_62_nl, and_410_nl, fsm_output[5]);
  assign nor_296_nl = ~((fsm_output[4]) | (fsm_output[6]) | nand_96_cse);
  assign mux_60_nl = MUX_s_1_2_2((fsm_output[2]), nand_124_cse, fsm_output[6]);
  assign nor_297_nl = ~((fsm_output[4]) | mux_60_nl);
  assign mux_61_nl = MUX_s_1_2_2(nor_296_nl, nor_297_nl, fsm_output[5]);
  assign mux_64_nl = MUX_s_1_2_2(mux_63_nl, mux_61_nl, fsm_output[3]);
  assign mux_58_nl = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), fsm_output[1]);
  assign nor_298_nl = ~((fsm_output[6:4]!=3'b010) | mux_58_nl);
  assign nor_299_nl = ~((fsm_output[6:4]!=3'b000) | mux_tmp_57);
  assign mux_59_nl = MUX_s_1_2_2(nor_298_nl, nor_299_nl, fsm_output[3]);
  assign nand_10_nl = ~((fsm_output[0]) & (~ mux_tmp_70));
  assign or_86_nl = (fsm_output[7]) | nand_95_cse;
  assign or_85_nl = (fsm_output[7]) | (fsm_output[6]) | (fsm_output[4]);
  assign mux_73_nl = MUX_s_1_2_2(or_86_nl, or_85_nl, fsm_output[3]);
  assign mux_74_nl = MUX_s_1_2_2(mux_73_nl, or_829_cse, fsm_output[0]);
  assign mux_75_nl = MUX_s_1_2_2(nand_10_nl, mux_74_nl, fsm_output[5]);
  assign or_87_nl = (fsm_output[2]) | mux_75_nl;
  assign or_84_nl = (fsm_output[0]) | mux_tmp_70;
  assign mux_71_nl = MUX_s_1_2_2(or_84_nl, or_81_cse, fsm_output[5]);
  assign mux_69_nl = MUX_s_1_2_2(or_829_cse, or_845_cse, fsm_output[5]);
  assign mux_72_nl = MUX_s_1_2_2(mux_71_nl, mux_69_nl, fsm_output[2]);
  assign mux_76_nl = MUX_s_1_2_2(or_87_nl, mux_72_nl, fsm_output[1]);
  assign mux_81_nl = MUX_s_1_2_2(or_tmp_83, mux_tmp_80, fsm_output[1]);
  assign or_92_nl = (~ (fsm_output[0])) | (fsm_output[7]) | (~ (fsm_output[5]));
  assign mux_85_nl = MUX_s_1_2_2(or_92_nl, mux_tmp_84, fsm_output[1]);
  assign mux_86_nl = MUX_s_1_2_2(mux_85_nl, or_tmp_87, fsm_output[2]);
  assign butterFly_tw_h_or_2_nl = and_dcpl_57 | ((~ mux_86_nl) & and_dcpl_58);
  assign mux_77_nl = MUX_s_1_2_2(or_28_cse, or_tmp_77, fsm_output[0]);
  assign and_53_nl = (~(mux_77_nl | (fsm_output[6]))) & and_dcpl_48;
  assign and_405_nl = (fsm_output[7]) & (fsm_output[2]);
  assign nor_291_nl = ~((~ (fsm_output[7])) | (fsm_output[2]));
  assign mux_96_nl = MUX_s_1_2_2(and_405_nl, nor_291_nl, fsm_output[1]);
  assign and_428_nl = (~((fsm_output[6:5]!=2'b01))) & mux_96_nl;
  assign nor_353_nl = ~((~ (fsm_output[6])) | (fsm_output[5]) | (fsm_output[7]) |
      (fsm_output[2]));
  assign mux_97_nl = MUX_s_1_2_2(and_428_nl, nor_353_nl, fsm_output[0]);
  assign nor_354_nl = ~((fsm_output[6]) | (fsm_output[5]) | (fsm_output[1]) | (fsm_output[7])
      | (fsm_output[2]));
  assign nor_355_nl = ~((~ (fsm_output[6])) | (~ (fsm_output[5])) | (fsm_output[1])
      | (fsm_output[7]) | (fsm_output[2]));
  assign mux_95_nl = MUX_s_1_2_2(nor_354_nl, nor_355_nl, fsm_output[0]);
  assign mux_98_nl = MUX_s_1_2_2(mux_97_nl, mux_95_nl, fsm_output[4]);
  assign or_109_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (~ (fsm_output[2]));
  assign mux_93_nl = MUX_s_1_2_2(or_109_nl, or_107_cse, fsm_output[5]);
  assign or_110_nl = (fsm_output[6]) | mux_93_nl;
  assign or_106_nl = (fsm_output[5]) | (~ (fsm_output[7])) | (fsm_output[2]);
  assign mux_92_nl = MUX_s_1_2_2(or_106_nl, nand_116_cse, fsm_output[6]);
  assign mux_94_nl = MUX_s_1_2_2(or_110_nl, mux_92_nl, fsm_output[0]);
  assign nor_356_nl = ~((fsm_output[4]) | mux_94_nl);
  assign mux_99_nl = MUX_s_1_2_2(mux_98_nl, nor_356_nl, fsm_output[3]);
  assign mux_100_nl = MUX_s_1_2_2(or_tmp_82, or_1041_cse, fsm_output[0]);
  assign mux_101_nl = MUX_s_1_2_2(or_tmp_83, mux_100_nl, fsm_output[1]);
  assign or_117_nl = (fsm_output[1]) | (fsm_output[0]) | (fsm_output[6]) | (~ nor_tmp_9);
  assign mux_102_nl = MUX_s_1_2_2(mux_101_nl, or_117_nl, fsm_output[2]);
  assign mux_103_nl = MUX_s_1_2_2(or_28_cse, mux_tmp_84, or_442_cse);
  assign mux_104_nl = MUX_s_1_2_2(mux_103_nl, or_tmp_87, fsm_output[2]);
  assign and_69_nl = (~ mux_104_nl) & and_dcpl_58;
  assign nor_289_nl = ~((fsm_output[1]) | (~ (fsm_output[3])) | (fsm_output[0]) |
      (~ and_425_cse));
  assign nor_290_nl = ~((~ (fsm_output[1])) | (fsm_output[3]) | (~ (fsm_output[0]))
      | (fsm_output[6]) | (fsm_output[5]));
  assign mux_105_nl = MUX_s_1_2_2(nor_289_nl, nor_290_nl, fsm_output[2]);
  assign S34_OUTER_LOOP_for_tf_mux_1_nl = MUX_v_5_2_2(({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}),
      (S1_OUTER_LOOP_k_5_0_sva_2[4:0]), and_dcpl_25);
  assign not_1496_nl = ~ and_dcpl_195;
  assign S34_OUTER_LOOP_for_k_mux_nl = MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1[4:0]),
      (S1_OUTER_LOOP_k_5_0_sva_2[4:0]), and_dcpl_25);
  assign not_1732_nl = ~ and_dcpl_195;
  assign mux_839_nl = MUX_s_1_2_2(or_tmp_975, or_tmp_188, fsm_output[1]);
  assign and_957_nl = (fsm_output[0]) & (fsm_output[4]) & (~ (fsm_output[6])) & (fsm_output[5])
      & (~ mux_839_nl);
  assign or_1173_nl = (~ (fsm_output[6])) | (fsm_output[5]) | (~ (fsm_output[1]))
      | (fsm_output[7]) | (~ (fsm_output[2]));
  assign mux_842_nl = MUX_s_1_2_2(or_tmp_975, or_107_cse, fsm_output[1]);
  assign or_1174_nl = (fsm_output[5]) | mux_842_nl;
  assign mux_841_nl = MUX_s_1_2_2(or_1174_nl, nand_116_cse, fsm_output[6]);
  assign mux_840_nl = MUX_s_1_2_2(or_1173_nl, mux_841_nl, fsm_output[4]);
  assign nor_498_nl = ~((fsm_output[0]) | mux_840_nl);
  assign mux_838_nl = MUX_s_1_2_2(and_957_nl, nor_498_nl, fsm_output[3]);
  assign mux_844_nl = MUX_s_1_2_2(or_tmp_983, or_tmp_197, fsm_output[7]);
  assign nor_499_nl = ~((fsm_output[4:2]!=3'b101) | mux_844_nl);
  assign mux_846_nl = MUX_s_1_2_2(or_1031_cse, or_tmp_983, fsm_output[7]);
  assign and_959_nl = (fsm_output[2]) & (~ mux_846_nl);
  assign mux_847_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[5]);
  assign nor_500_nl = ~((fsm_output[2]) | (fsm_output[7]) | (~((fsm_output[0]) &
      mux_847_nl)));
  assign mux_845_nl = MUX_s_1_2_2(and_959_nl, nor_500_nl, fsm_output[4]);
  assign and_958_nl = (fsm_output[3]) & mux_845_nl;
  assign mux_843_nl = MUX_s_1_2_2(nor_499_nl, and_958_nl, fsm_output[1]);
  assign nor_501_nl = ~((~ (fsm_output[1])) | (fsm_output[7]) | (~ (fsm_output[6]))
      | (fsm_output[2]));
  assign and_961_nl = (fsm_output[1]) & (fsm_output[7]) & (~ (fsm_output[6])) & (fsm_output[2]);
  assign mux_849_nl = MUX_s_1_2_2(nor_501_nl, and_961_nl, fsm_output[3]);
  assign and_960_nl = (fsm_output[0]) & (fsm_output[5]) & mux_849_nl;
  assign nor_502_nl = ~((fsm_output[7]) | (~ (fsm_output[6])) | (fsm_output[2]));
  assign nor_503_nl = ~((~ (fsm_output[7])) | (fsm_output[6]) | (~ (fsm_output[2])));
  assign mux_853_nl = MUX_s_1_2_2(nor_502_nl, nor_503_nl, fsm_output[1]);
  assign nor_504_nl = ~((fsm_output[1]) | (fsm_output[7]) | (fsm_output[6]) | (~
      (fsm_output[2])));
  assign mux_852_nl = MUX_s_1_2_2(mux_853_nl, nor_504_nl, fsm_output[3]);
  assign nor_505_nl = ~((~ (fsm_output[3])) | (fsm_output[1]) | (fsm_output[7]) |
      (~((fsm_output[6]) & (fsm_output[2]))));
  assign mux_851_nl = MUX_s_1_2_2(mux_852_nl, nor_505_nl, fsm_output[5]);
  assign nor_506_nl = ~((~ (fsm_output[5])) | (fsm_output[3]) | (fsm_output[1]) |
      (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[2])));
  assign mux_850_nl = MUX_s_1_2_2(mux_851_nl, nor_506_nl, fsm_output[0]);
  assign mux_848_nl = MUX_s_1_2_2(and_960_nl, mux_850_nl, fsm_output[4]);
  assign mult_3_res_mux1h_2_nl = MUX1HOT_v_32_3_2(butterFly_14_tw_h_asn_itm, modulo_add_base_1_sva,
      butterFly_10_tw_h_asn_itm, {mux_838_nl , mux_843_nl , mux_848_nl});
  assign nl_acc_2_nl = ({mult_3_res_mux1h_2_nl , 1'b1}) + ({(~ (mult_z_mul_cmp_z[31:0]))
      , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[32:0];
  assign nl_modulo_sub_3_qif_acc_nl = ({1'b1 , (acc_8_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_3_qif_acc_nl = nl_modulo_sub_3_qif_acc_nl[31:0];
  assign and_969_nl = (fsm_output[1]) & (fsm_output[3]) & and_dcpl_406 & and_dcpl_358
      & and_dcpl_186;
  assign modulo_add_3_mux1h_3_nl = MUX1HOT_v_32_3_2((~ modulo_add_base_3_sva_mx0w1),
      (~ modulo_add_base_2_sva_mx0w4), (~ modulo_add_base_22_sva_mx0w24), {(~ (fsm_output[1]))
      , and_969_nl , (~ (fsm_output[3]))});
  assign nl_acc_14_nl = ({1'b1 , m_sva , 1'b1}) + conv_u2u_33_34({modulo_add_3_mux1h_3_nl
      , 1'b1});
  assign acc_14_nl = nl_acc_14_nl[33:0];
  assign nl_modulo_sub_qif_acc_nl = ({1'b1 , (acc_6_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_qif_acc_nl = nl_modulo_sub_qif_acc_nl[31:0];
  assign nl_mult_2_res_sva  = butterFly_13_tw_h_asn_itm - (mult_z_mul_cmp_z[31:0]);
  assign modulo_add_mux1h_3_nl = MUX1HOT_v_32_3_2((~ modulo_add_base_sva_mx0w2),
      (~ modulo_add_base_15_sva_mx0w13), (~ modulo_add_base_23_sva_mx0w21), {(~ (fsm_output[5]))
      , (fsm_output[6]) , (fsm_output[7])});
  assign nl_acc_16_nl = ({1'b1 , m_sva , 1'b1}) + conv_u2u_33_34({modulo_add_mux1h_3_nl
      , 1'b1});
  assign acc_16_nl = nl_acc_16_nl[33:0];
  assign and_981_nl = and_dcpl_184 & (fsm_output[2]) & (~ (fsm_output[6])) & (~ (fsm_output[7]))
      & (~ (fsm_output[5])) & and_dcpl_253;
  assign and_982_nl = and_dcpl_284 & and_dcpl_441 & and_dcpl_628 & (~ (fsm_output[4]))
      & (~ (fsm_output[0]));
  assign and_983_nl = and_dcpl_184 & and_dcpl_441 & and_dcpl_628 & and_dcpl_253;
  assign modulo_add_1_mux1h_3_nl = MUX1HOT_v_32_3_2((~ modulo_add_base_1_sva_mx0w3),
      (~ modulo_add_base_14_sva_mx0w16), (~ modulo_add_base_18_sva_mx0w20), {and_981_nl
      , and_982_nl , and_983_nl});
  assign nl_acc_18_nl = ({1'b1 , m_sva , 1'b1}) + conv_u2u_33_34({modulo_add_1_mux1h_3_nl
      , 1'b1});
  assign acc_18_nl = nl_acc_18_nl[33:0];
  assign nl_modulo_sub_7_qif_acc_nl = ({1'b1 , (acc_6_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_7_qif_acc_nl = nl_modulo_sub_7_qif_acc_nl[31:0];
  assign and_984_nl = (fsm_output[2:1]==2'b11) & and_dcpl_370 & (~ (fsm_output[7]))
      & (fsm_output[5]) & and_dcpl_253;
  assign and_985_nl = nor_304_cse & (~ (fsm_output[3])) & (fsm_output[6]) & (~ (fsm_output[7]))
      & (~ (fsm_output[5])) & and_dcpl_186;
  assign and_986_nl = nor_304_cse & (fsm_output[3]) & (~ (fsm_output[6])) & (fsm_output[7])
      & (~ (fsm_output[5])) & and_dcpl_253;
  assign and_987_nl = nor_304_cse & and_dcpl_370 & (fsm_output[7]) & (fsm_output[5])
      & and_dcpl_186;
  assign modulo_add_7_mux1h_3_nl = MUX1HOT_v_32_4_2((~ modulo_add_base_7_sva_mx0w5),
      (~ modulo_add_base_9_sva_mx0w11), (~ modulo_add_base_16_sva_mx0w18), (~ modulo_add_base_20_sva_mx0w22),
      {and_984_nl , and_985_nl , and_986_nl , and_987_nl});
  assign nl_acc_19_nl = ({1'b1 , m_sva , 1'b1}) + conv_u2u_33_34({modulo_add_7_mux1h_3_nl
      , 1'b1});
  assign acc_19_nl = nl_acc_19_nl[33:0];
  assign nl_modulo_sub_4_qif_acc_nl = ({1'b1 , (acc_7_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_4_qif_acc_nl = nl_modulo_sub_4_qif_acc_nl[31:0];
  assign and_977_nl = and_953_cse & (~ (fsm_output[3])) & (~ (fsm_output[6])) & and_dcpl_731;
  assign and_978_nl = nor_304_cse & (fsm_output[3]) & (~ (fsm_output[6])) & and_dcpl_737;
  assign and_979_nl = and_715_cse_1 & and_dcpl_737;
  assign and_980_nl = and_715_cse_1 & and_dcpl_731;
  assign modulo_add_4_mux1h_3_nl = MUX1HOT_v_32_4_2((~ modulo_add_base_4_sva_mx0w6),
      (~ modulo_add_base_5_sva_mx0w7), (~ modulo_add_base_12_sva_mx0w14), (~ modulo_add_base_13_sva_mx0w15),
      {and_977_nl , and_978_nl , and_979_nl , and_980_nl});
  assign nl_acc_17_nl = ({1'b1 , m_sva , 1'b1}) + conv_u2u_33_34({modulo_add_4_mux1h_3_nl
      , 1'b1});
  assign acc_17_nl = nl_acc_17_nl[33:0];
  assign and_988_nl = nor_304_cse & (fsm_output[3]) & (~ (fsm_output[6])) & (~ (fsm_output[7]))
      & (fsm_output[5]) & (fsm_output[4]) & (fsm_output[0]);
  assign and_989_nl = nor_304_cse & and_dcpl_382 & nor_425_cse;
  assign and_990_nl = (fsm_output[2:1]==2'b01) & and_dcpl_382 & nor_425_cse;
  assign modulo_add_6_mux1h_3_nl = MUX1HOT_v_32_3_2((~ modulo_add_base_6_sva_mx0w8),
      (~ modulo_add_base_8_sva_mx0w10), (~ modulo_add_base_10_sva_mx0w12), {and_988_nl
      , and_989_nl , and_990_nl});
  assign nl_acc_21_nl = ({1'b1 , m_sva , 1'b1}) + conv_u2u_33_34({modulo_add_6_mux1h_3_nl
      , 1'b1});
  assign acc_21_nl = nl_acc_21_nl[33:0];
  assign nl_modulo_sub_11_qif_acc_nl = ({1'b1 , (acc_5_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_11_qif_acc_nl = nl_modulo_sub_11_qif_acc_nl[31:0];
  assign modulo_add_11_mux1h_3_nl = MUX1HOT_v_32_3_2((~ modulo_add_base_11_sva_mx0w9),
      (~ modulo_add_base_17_sva_mx0w19), (~ modulo_add_base_21_sva_mx0w23), {(~ (fsm_output[7]))
      , (~ (fsm_output[1])) , (fsm_output[5])});
  assign nl_acc_20_nl = ({1'b1 , m_sva , 1'b1}) + conv_u2u_33_34({modulo_add_11_mux1h_3_nl
      , 1'b1});
  assign acc_20_nl = nl_acc_20_nl[33:0];
  assign nl_modulo_sub_8_qif_acc_nl = ({1'b1 , (acc_8_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_8_qif_acc_nl = nl_modulo_sub_8_qif_acc_nl[31:0];
  assign nl_modulo_sub_15_qif_acc_nl = ({1'b1 , (acc_6_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_15_qif_acc_nl = nl_modulo_sub_15_qif_acc_nl[31:0];
  assign nl_modulo_sub_12_qif_acc_nl = ({1'b1 , (acc_7_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_12_qif_acc_nl = nl_modulo_sub_12_qif_acc_nl[31:0];
  assign nl_modulo_sub_19_qif_acc_nl = ({1'b1 , (acc_6_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_19_qif_acc_nl = nl_modulo_sub_19_qif_acc_nl[31:0];
  assign nl_modulo_add_19_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ modulo_add_base_19_sva_mx0w17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_19_acc_1_nl = nl_modulo_add_19_acc_1_nl[32:0];
  assign nl_modulo_sub_16_qif_acc_nl = ({1'b1 , (acc_7_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_16_qif_acc_nl = nl_modulo_sub_16_qif_acc_nl[31:0];
  assign nl_modulo_sub_23_qif_acc_nl = ({1'b1 , (acc_6_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_23_qif_acc_nl = nl_modulo_sub_23_qif_acc_nl[31:0];
  assign nl_modulo_sub_20_qif_acc_nl = ({1'b1 , (acc_7_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_20_qif_acc_nl = nl_modulo_sub_20_qif_acc_nl[31:0];
  assign and_203_nl = and_dcpl_24 & and_dcpl_148;
  assign mux_781_nl = MUX_s_1_2_2((fsm_output[2]), (~ (fsm_output[2])), fsm_output[1]);
  assign nor_476_nl = ~((fsm_output[0]) | mux_781_nl);
  assign mux_782_nl = MUX_s_1_2_2(nor_476_nl, or_1016_cse, fsm_output[3]);
  assign or_1104_nl = (fsm_output[5]) | mux_782_nl;
  assign nor_477_nl = ~((fsm_output[3:0]!=4'b0000));
  assign mux_779_nl = MUX_s_1_2_2(and_357_cse, (fsm_output[2]), fsm_output[3]);
  assign mux_780_nl = MUX_s_1_2_2(nor_477_nl, mux_779_nl, fsm_output[5]);
  assign mux_783_nl = MUX_s_1_2_2(or_1104_nl, mux_780_nl, fsm_output[6]);
  assign or_1100_nl = (fsm_output[6:5]!=2'b10) | (~((fsm_output[3:0]!=4'b1001)));
  assign mux_784_nl = MUX_s_1_2_2(mux_783_nl, or_1100_nl, fsm_output[4]);
  assign nor_479_nl = ~((fsm_output[6]) | ((fsm_output[5]) & ((fsm_output[3:1]!=3'b000))));
  assign nor_481_nl = ~((fsm_output[2:1]!=2'b01));
  assign mux_nl = MUX_s_1_2_2(nor_481_nl, and_953_cse, fsm_output[0]);
  assign nor_480_nl = ~((fsm_output[6]) | ((fsm_output[5]) & (~((fsm_output[3]) &
      mux_nl))));
  assign mux_778_nl = MUX_s_1_2_2(nor_479_nl, nor_480_nl, fsm_output[4]);
  assign mux_785_nl = MUX_s_1_2_2(mux_784_nl, mux_778_nl, fsm_output[7]);
  assign S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl = MUX_s_1_2_2((S1_OUTER_LOOP_k_5_0_sva_2[3]),
      (z_out[3]), mux_351_ssc);
  assign or_1114_nl = (fsm_output[1]) | (fsm_output[3]);
  assign mux_793_nl = MUX_s_1_2_2(or_1114_nl, mux_tmp_788, fsm_output[2]);
  assign mux_794_nl = MUX_s_1_2_2(mux_793_nl, or_tmp_1011, fsm_output[0]);
  assign mux_795_nl = MUX_s_1_2_2((~ mux_794_nl), (fsm_output[3]), fsm_output[7]);
  assign or_1170_nl = and_357_cse | (fsm_output[3]);
  assign nor_482_nl = ~((fsm_output[3:1]!=3'b000));
  assign mux_792_nl = MUX_s_1_2_2(or_1170_nl, nor_482_nl, fsm_output[7]);
  assign mux_796_nl = MUX_s_1_2_2(mux_795_nl, mux_792_nl, fsm_output[5]);
  assign nor_483_nl = ~((fsm_output[7]) | (fsm_output[0]) | (fsm_output[2]) | (fsm_output[1])
      | (fsm_output[3]));
  assign or_1109_nl = (fsm_output[3:1]!=3'b110);
  assign nand_143_nl = ~((fsm_output[2]) & (~ mux_tmp_788));
  assign mux_790_nl = MUX_s_1_2_2(or_1109_nl, nand_143_nl, fsm_output[0]);
  assign nor_484_nl = ~((fsm_output[7]) | mux_790_nl);
  assign mux_791_nl = MUX_s_1_2_2(nor_483_nl, nor_484_nl, fsm_output[5]);
  assign mux_797_nl = MUX_s_1_2_2(mux_796_nl, mux_791_nl, fsm_output[6]);
  assign nand_150_nl = ~((fsm_output[3:1]==3'b111));
  assign mux_786_nl = MUX_s_1_2_2(or_tmp_1011, nand_150_nl, fsm_output[0]);
  assign nand_142_nl = ~((fsm_output[7]) & mux_786_nl);
  assign mux_787_nl = MUX_s_1_2_2((fsm_output[7]), nand_142_nl, fsm_output[5]);
  assign nor_485_nl = ~((fsm_output[5]) | (fsm_output[7]) | (~ (fsm_output[0])) |
      (fsm_output[2]) | (fsm_output[1]) | (~ (fsm_output[3])));
  assign mux_788_nl = MUX_s_1_2_2(mux_787_nl, nor_485_nl, fsm_output[6]);
  assign mux_798_nl = MUX_s_1_2_2(mux_797_nl, mux_788_nl, fsm_output[4]);
  assign mux_353_nl = MUX_s_1_2_2(or_587_cse, or_392_cse, fsm_output[5]);
  assign or_426_nl = (fsm_output[2]) | mux_353_nl;
  assign or_423_nl = (~ (fsm_output[2])) | (~ (fsm_output[5])) | (~ (fsm_output[0]))
      | (fsm_output[7]) | (fsm_output[6]);
  assign mux_354_nl = MUX_s_1_2_2(or_426_nl, or_423_nl, fsm_output[1]);
  assign mux_13_nl = MUX_s_1_2_2(or_392_cse, or_401_cse, fsm_output[5]);
  assign or_420_nl = (fsm_output[4:3]!=2'b00);
  assign mux_355_nl = MUX_s_1_2_2(mux_354_nl, mux_13_nl, or_420_nl);
  assign S2_COPY_LOOP_p_or_nl = mux_351_ssc | (~ mux_355_nl);
  assign S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl = MUX_v_3_2_2((S1_OUTER_LOOP_k_5_0_sva_2[2:0]),
      (z_out[2:0]), S2_COPY_LOOP_p_or_nl);
  assign nor_486_nl = ~((fsm_output[5]) | (fsm_output[1]) | (fsm_output[0]) | (fsm_output[4])
      | (fsm_output[6]) | (fsm_output[7]));
  assign mux_803_nl = MUX_s_1_2_2(nor_487_cse, nor_488_cse, fsm_output[0]);
  assign nor_489_nl = ~((~ (fsm_output[0])) | (fsm_output[4]) | (fsm_output[6]) |
      (fsm_output[7]));
  assign mux_804_nl = MUX_s_1_2_2(mux_803_nl, nor_489_nl, fsm_output[1]);
  assign nor_490_nl = ~((~ (fsm_output[1])) | (fsm_output[0]) | (~ (fsm_output[4]))
      | (fsm_output[6]) | (~ (fsm_output[7])));
  assign mux_805_nl = MUX_s_1_2_2(mux_804_nl, nor_490_nl, fsm_output[5]);
  assign mux_806_nl = MUX_s_1_2_2(nor_486_nl, mux_805_nl, fsm_output[3]);
  assign nor_491_nl = ~((~ (fsm_output[1])) | (fsm_output[0]) | (fsm_output[4]) |
      (fsm_output[6]) | (fsm_output[7]));
  assign nor_492_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[0])) | (fsm_output[4])
      | (fsm_output[7]));
  assign mux_801_nl = MUX_s_1_2_2(nor_491_nl, nor_492_nl, fsm_output[5]);
  assign nor_493_nl = ~((fsm_output[1]) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[6])
      | (fsm_output[7]));
  assign and_955_nl = (fsm_output[0]) & (fsm_output[4]) & (~ (fsm_output[6])) & (fsm_output[7]);
  assign mux_799_nl = MUX_s_1_2_2(nor_494_cse, and_955_nl, fsm_output[1]);
  assign mux_800_nl = MUX_s_1_2_2(nor_493_nl, mux_799_nl, fsm_output[5]);
  assign mux_802_nl = MUX_s_1_2_2(mux_801_nl, mux_800_nl, fsm_output[3]);
  assign mux_807_nl = MUX_s_1_2_2(mux_806_nl, mux_802_nl, fsm_output[2]);
  assign nor_467_nl = ~((fsm_output[2:0]!=3'b100));
  assign or_1142_nl = (fsm_output[2:0]!=3'b001);
  assign mux_814_nl = MUX_s_1_2_2(nor_467_nl, or_1142_nl, fsm_output[6]);
  assign nor_466_nl = ~((fsm_output[7]) | mux_814_nl);
  assign and_948_nl = (fsm_output[6]) & or_46_cse;
  assign nor_468_nl = ~((fsm_output[6]) | (fsm_output[2]) | (fsm_output[0]) | (~
      (fsm_output[1])));
  assign mux_813_nl = MUX_s_1_2_2(and_948_nl, nor_468_nl, fsm_output[7]);
  assign mux_815_nl = MUX_s_1_2_2(nor_466_nl, mux_813_nl, fsm_output[5]);
  assign nor_469_nl = ~((fsm_output[6]) | (~ (fsm_output[2])) | (~ (fsm_output[0]))
      | (fsm_output[1]));
  assign nor_470_nl = ~((fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[0])) |
      (fsm_output[1]));
  assign mux_811_nl = MUX_s_1_2_2(nor_469_nl, nor_470_nl, fsm_output[7]);
  assign or_1134_nl = (fsm_output[1:0]!=2'b10);
  assign mux_809_nl = MUX_s_1_2_2(or_442_cse, or_1134_nl, fsm_output[2]);
  assign mux_810_nl = MUX_s_1_2_2(or_tmp_1036, mux_809_nl, fsm_output[6]);
  assign nor_471_nl = ~((fsm_output[7]) | mux_810_nl);
  assign mux_812_nl = MUX_s_1_2_2(mux_811_nl, nor_471_nl, fsm_output[5]);
  assign mux_816_nl = MUX_s_1_2_2(mux_815_nl, mux_812_nl, fsm_output[3]);
  assign nor_472_nl = ~((fsm_output[7]) | (~((fsm_output[6]) & or_tmp_1036)));
  assign nor_473_nl = ~((fsm_output[7:6]!=2'b10) | (~((~((~ (fsm_output[2])) | (fsm_output[0])))
      | (fsm_output[1]))));
  assign mux_808_nl = MUX_s_1_2_2(nor_472_nl, nor_473_nl, fsm_output[5]);
  assign and_949_nl = (fsm_output[3]) & mux_808_nl;
  assign mux_817_nl = MUX_s_1_2_2(mux_816_nl, and_949_nl, fsm_output[4]);
  assign or_1159_nl = (fsm_output[5]) | (fsm_output[0]) | (fsm_output[1]);
  assign mux_824_nl = MUX_s_1_2_2(or_1159_nl, or_tmp_1056, fsm_output[6]);
  assign mux_825_nl = MUX_s_1_2_2(mux_824_nl, or_tmp_1052, fsm_output[7]);
  assign nor_464_nl = ~((fsm_output[5]) | nor_217_cse);
  assign mux_823_nl = MUX_s_1_2_2(nor_464_nl, nor_tmp_102, fsm_output[6]);
  assign or_1158_nl = (fsm_output[7]) | (~ mux_823_nl);
  assign mux_826_nl = MUX_s_1_2_2(mux_825_nl, or_1158_nl, fsm_output[2]);
  assign or_1155_nl = (~ (fsm_output[5])) | (fsm_output[0]) | (fsm_output[1]);
  assign or_1154_nl = (fsm_output[6]) | (fsm_output[5]) | (~ (fsm_output[0])) | (fsm_output[1]);
  assign mux_821_nl = MUX_s_1_2_2(or_1155_nl, or_1154_nl, fsm_output[7]);
  assign or_1151_nl = (~ (fsm_output[5])) | (fsm_output[0]) | (~ (fsm_output[1]));
  assign mux_820_nl = MUX_s_1_2_2(or_tmp_1056, or_1151_nl, fsm_output[6]);
  assign or_1153_nl = (fsm_output[7]) | mux_820_nl;
  assign mux_822_nl = MUX_s_1_2_2(mux_821_nl, or_1153_nl, fsm_output[2]);
  assign mux_827_nl = MUX_s_1_2_2(mux_826_nl, mux_822_nl, fsm_output[3]);
  assign or_1149_nl = (~ (fsm_output[6])) | (fsm_output[5]) | (~ (fsm_output[0]))
      | (fsm_output[1]);
  assign mux_818_nl = MUX_s_1_2_2(or_1149_nl, or_tmp_1052, fsm_output[7]);
  assign or_1146_nl = (fsm_output[7:6]!=2'b10) | (~ nor_tmp_102);
  assign mux_819_nl = MUX_s_1_2_2(mux_818_nl, or_1146_nl, fsm_output[2]);
  assign nand_145_nl = ~((fsm_output[3]) & (~ mux_819_nl));
  assign mux_828_nl = MUX_s_1_2_2(mux_827_nl, nand_145_nl, fsm_output[4]);
  assign or_62_nl = (fsm_output[0]) | (fsm_output[4]) | (~ (fsm_output[6])) | (fsm_output[7])
      | (~ (fsm_output[5]));
  assign or_60_nl = (fsm_output[0]) | (~ (fsm_output[4])) | (fsm_output[6]) | (~
      nor_tmp_9);
  assign mux_54_nl = MUX_s_1_2_2(or_62_nl, or_60_nl, fsm_output[3]);
  assign mux_55_nl = MUX_s_1_2_2(or_tmp_52, mux_54_nl, fsm_output[1]);
  assign and_18_nl = (~ mux_55_nl) & (fsm_output[2]);
  assign S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl = MUX_v_15_2_2(15'b000000000000000,
      (S1_OUTER_LOOP_for_p_sva_1[19:5]), and_18_nl);
  assign mux_400_nl = MUX_s_1_2_2(or_tmp_466, or_tmp_465, fsm_output[0]);
  assign nand_40_nl = ~((fsm_output[3]) & (~ mux_400_nl));
  assign mux_401_nl = MUX_s_1_2_2(or_tmp_52, nand_40_nl, fsm_output[1]);
  assign or_1172_nl = (fsm_output[6:5]!=2'b00);
  assign nand_152_nl = ~((fsm_output[6:5]==2'b11));
  assign mux_837_nl = MUX_s_1_2_2(or_1172_nl, nand_152_nl, fsm_output[0]);
  assign and_956_nl = (~(mux_837_nl | (fsm_output[1]))) & (fsm_output[3:2]==2'b10)
      & and_dcpl_66;
  assign S1_OUTER_LOOP_for_mux_15_nl = MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1[4:0]),
      (revArr_rsci_s_din_mxwt[9:5]), and_956_nl);
  assign nl_S1_OUTER_LOOP_for_acc_nl = ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}) + S1_OUTER_LOOP_for_mux_15_nl;
  assign S1_OUTER_LOOP_for_acc_nl = nl_S1_OUTER_LOOP_for_acc_nl[4:0];
  assign nl_S6_OUTER_LOOP_for_acc_nl = (S1_OUTER_LOOP_for_p_sva_1[4:0]) + ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg});
  assign S6_OUTER_LOOP_for_acc_nl = nl_S6_OUTER_LOOP_for_acc_nl[4:0];
  assign S1_OUTER_LOOP_for_or_nl = S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 | S1_OUTER_LOOP_for_acc_cse_sva_mx0c2;
  assign S1_OUTER_LOOP_for_mux1h_3_nl = MUX1HOT_v_5_3_2(S1_OUTER_LOOP_for_acc_nl,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, S6_OUTER_LOOP_for_acc_nl, {S1_OUTER_LOOP_for_or_nl
      , S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 , and_dcpl_122});
  assign S1_OUTER_LOOP_for_not_4_nl = ~ S1_OUTER_LOOP_for_acc_cse_sva_mx0c1;
  assign S2_OUTER_LOOP_c_nor_nl = ~(mux_tmp_462 | (fsm_output[7]) | (fsm_output[4])
      | (~ (fsm_output[3])));
  assign S2_INNER_LOOP1_r_mux_nl = MUX_v_2_2_2(({1'b0 , S2_OUTER_LOOP_c_nor_nl}),
      (z_out_2[1:0]), S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2);
  assign S2_INNER_LOOP1_r_not_nl = ~ S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1;
  assign or_1028_nl = S2_OUTER_LOOP_c_1_sva | (~ (z_out_2[2])) | (fsm_output[2:1]!=2'b00)
      | mux_467_cse;
  assign or_1029_nl = (~ (fsm_output[1])) | (fsm_output[5]) | (fsm_output[7]) | (~
      (fsm_output[0])) | (fsm_output[6]);
  assign or_1030_nl = (fsm_output[1]) | (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[0])
      | (~ (fsm_output[6]));
  assign mux_466_nl = MUX_s_1_2_2(or_1029_nl, or_1030_nl, fsm_output[2]);
  assign mux_468_nl = MUX_s_1_2_2(or_1028_nl, mux_466_nl, fsm_output[3]);
  assign nand_146_nl = ~((fsm_output[1]) & (fsm_output[7]));
  assign mux_831_nl = MUX_s_1_2_2(nand_146_nl, (fsm_output[7]), fsm_output[5]);
  assign or_1162_nl = (fsm_output[1]) | (fsm_output[7]);
  assign mux_830_nl = MUX_s_1_2_2((~ (fsm_output[7])), or_1162_nl, fsm_output[5]);
  assign mux_832_nl = MUX_s_1_2_2(mux_831_nl, mux_830_nl, fsm_output[0]);
  assign nor_461_nl = ~((fsm_output[6]) | mux_832_nl);
  assign mux_833_nl = MUX_s_1_2_2(nor_461_nl, mux_829_cse, fsm_output[2]);
  assign or_1168_nl = (~ (fsm_output[5])) | (fsm_output[1]) | (fsm_output[7]);
  assign or_1167_nl = (fsm_output[5]) | (fsm_output[1]) | (~ (fsm_output[7]));
  assign mux_835_nl = MUX_s_1_2_2(or_1168_nl, or_1167_nl, fsm_output[0]);
  assign nor_458_nl = ~((fsm_output[6]) | mux_835_nl);
  assign mux_836_nl = MUX_s_1_2_2(nor_458_nl, mux_829_cse, fsm_output[2]);
  assign or_644_nl = (fsm_output[0]) | (fsm_output[4]) | (fsm_output[6]) | (~ (fsm_output[7]));
  assign mux_504_nl = MUX_s_1_2_2(or_900_cse, or_644_nl, fsm_output[3]);
  assign mux_505_nl = MUX_s_1_2_2(or_tmp_622, mux_504_nl, fsm_output[1]);
  assign or_640_nl = (~ (fsm_output[3])) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[6])
      | (fsm_output[7]);
  assign mux_503_nl = MUX_s_1_2_2(or_tmp_619, or_640_nl, fsm_output[1]);
  assign mux_506_nl = MUX_s_1_2_2(mux_505_nl, mux_503_nl, fsm_output[2]);
  assign mux_591_nl = MUX_s_1_2_2(or_533_cse, or_tmp_222, fsm_output[3]);
  assign mux_592_nl = MUX_s_1_2_2(mux_591_nl, or_tmp_220, fsm_output[1]);
  assign mux_654_nl = MUX_s_1_2_2(or_tmp_811, or_tmp_619, fsm_output[1]);
  assign or_833_nl = (fsm_output[1]) | (fsm_output[3]) | (fsm_output[0]) | (fsm_output[4])
      | (~ (fsm_output[6])) | (fsm_output[7]);
  assign mux_655_nl = MUX_s_1_2_2(mux_654_nl, or_833_nl, fsm_output[2]);
  assign mux_661_nl = MUX_s_1_2_2(or_845_cse, or_tmp_622, fsm_output[1]);
  assign or_844_nl = (~ (fsm_output[1])) | (~ (fsm_output[3])) | (~ (fsm_output[0]))
      | (fsm_output[4]) | (fsm_output[6]) | (~ (fsm_output[7]));
  assign mux_662_nl = MUX_s_1_2_2(mux_661_nl, or_844_nl, fsm_output[2]);
  assign mux_579_nl = MUX_s_1_2_2(or_467_cse, or_392_cse, fsm_output[5]);
  assign nor_110_nl = ~((fsm_output[3]) | (fsm_output[4]) | (fsm_output[0]) | mux_579_nl);
  assign mux_671_nl = MUX_s_1_2_2(nor_109_cse, nor_110_nl, fsm_output[2]);
  assign or_861_nl = (~ (fsm_output[4])) | (fsm_output[0]) | (fsm_output[5]) | (fsm_output[7])
      | (fsm_output[6]);
  assign or_743_nl = (fsm_output[7:5]!=3'b001);
  assign mux_668_nl = MUX_s_1_2_2(or_743_nl, or_22_cse, fsm_output[0]);
  assign or_860_nl = (fsm_output[4]) | mux_668_nl;
  assign mux_669_nl = MUX_s_1_2_2(or_861_nl, or_860_nl, fsm_output[3]);
  assign nor_111_nl = ~((fsm_output[2]) | mux_669_nl);
  assign mux_672_nl = MUX_s_1_2_2(mux_671_nl, nor_111_nl, fsm_output[1]);
  assign mux_694_nl = MUX_s_1_2_2(or_tmp_873, or_tmp_871, fsm_output[3]);
  assign mux_695_nl = MUX_s_1_2_2(or_tmp_868, mux_694_nl, fsm_output[2]);
  assign mux_692_nl = MUX_s_1_2_2(or_900_cse, mux_325_cse, fsm_output[5]);
  assign mux_693_nl = MUX_s_1_2_2(or_tmp_872, mux_692_nl, fsm_output[3]);
  assign or_901_nl = (fsm_output[2]) | mux_693_nl;
  assign mux_696_nl = MUX_s_1_2_2(mux_695_nl, or_901_nl, fsm_output[1]);
  assign mux_688_nl = MUX_s_1_2_2(or_tmp_873, or_tmp_872, fsm_output[3]);
  assign or_892_nl = (fsm_output[7:4]!=4'b1010);
  assign mux_687_nl = MUX_s_1_2_2(or_tmp_871, or_892_nl, fsm_output[3]);
  assign mux_689_nl = MUX_s_1_2_2(mux_688_nl, mux_687_nl, fsm_output[2]);
  assign mux_685_nl = MUX_s_1_2_2(or_889_cse, or_888_cse, fsm_output[5]);
  assign or_890_nl = (fsm_output[3]) | mux_685_nl;
  assign mux_686_nl = MUX_s_1_2_2(or_tmp_868, or_890_nl, fsm_output[2]);
  assign mux_690_nl = MUX_s_1_2_2(mux_689_nl, mux_686_nl, fsm_output[1]);
  assign mux_697_nl = MUX_s_1_2_2(mux_696_nl, mux_690_nl, fsm_output[0]);
  assign or_1037_nl = (fsm_output[0]) | (~ (fsm_output[4])) | (fsm_output[6]) | (~
      (fsm_output[7]));
  assign or_1038_nl = (~ (fsm_output[0])) | (~ (fsm_output[4])) | (fsm_output[6])
      | (fsm_output[7]);
  assign mux_698_nl = MUX_s_1_2_2(or_1037_nl, or_1038_nl, fsm_output[1]);
  assign or_1039_nl = (~ (fsm_output[1])) | (fsm_output[0]) | (fsm_output[4]) | (~
      (fsm_output[6])) | (fsm_output[7]);
  assign mux_699_nl = MUX_s_1_2_2(mux_698_nl, or_1039_nl, fsm_output[2]);
  assign or_918_nl = (fsm_output[1]) | (~ (fsm_output[3])) | (fsm_output[0]) | (fsm_output[4])
      | (~ (fsm_output[6])) | (fsm_output[7]);
  assign or_917_nl = (~ (fsm_output[3])) | (fsm_output[0]) | (fsm_output[4]) | (fsm_output[6])
      | (~ (fsm_output[7]));
  assign mux_705_nl = MUX_s_1_2_2(or_tmp_811, or_917_nl, fsm_output[1]);
  assign mux_706_nl = MUX_s_1_2_2(or_918_nl, mux_705_nl, fsm_output[2]);
  assign nor_90_nl = ~((fsm_output[4]) | (fsm_output[7]) | (fsm_output[6]));
  assign mux_741_nl = MUX_s_1_2_2(nor_488_cse, nor_90_nl, fsm_output[2]);
  assign and_429_nl = (fsm_output[5]) & (fsm_output[3]) & mux_741_nl;
  assign mux_739_nl = MUX_s_1_2_2(or_964_cse, or_889_cse, fsm_output[2]);
  assign nor_357_nl = ~((fsm_output[3]) | mux_739_nl);
  assign nor_358_nl = ~((fsm_output[3]) | (~ (fsm_output[2])) | (fsm_output[4]) |
      (~ (fsm_output[7])) | (fsm_output[6]));
  assign mux_740_nl = MUX_s_1_2_2(nor_357_nl, nor_358_nl, fsm_output[5]);
  assign mux_742_nl = MUX_s_1_2_2(and_429_nl, mux_740_nl, fsm_output[1]);
  assign mux_736_nl = MUX_s_1_2_2(nor_494_cse, nor_487_cse, fsm_output[2]);
  assign and_430_nl = (fsm_output[3]) & mux_736_nl;
  assign nor_359_nl = ~((fsm_output[3]) | (fsm_output[2]) | (~ (fsm_output[4])) |
      (fsm_output[7]) | (fsm_output[6]));
  assign mux_737_nl = MUX_s_1_2_2(and_430_nl, nor_359_nl, fsm_output[5]);
  assign nor_93_nl = ~((fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[7]) |
      (~ (fsm_output[6])));
  assign nor_94_nl = ~((fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[7])) |
      (fsm_output[6]));
  assign mux_735_nl = MUX_s_1_2_2(nor_93_nl, nor_94_nl, fsm_output[3]);
  assign and_431_nl = (fsm_output[5]) & mux_735_nl;
  assign mux_738_nl = MUX_s_1_2_2(mux_737_nl, and_431_nl, fsm_output[1]);
  assign mux_743_nl = MUX_s_1_2_2(mux_742_nl, mux_738_nl, fsm_output[0]);
  assign nl_modulo_sub_1_qif_acc_nl = ({1'b1 , (acc_7_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_1_qif_acc_nl = nl_modulo_sub_1_qif_acc_nl[31:0];
  assign nl_modulo_sub_2_qif_acc_nl = ({1'b1 , (acc_5_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_2_qif_acc_nl = nl_modulo_sub_2_qif_acc_nl[31:0];
  assign nl_modulo_sub_5_qif_acc_nl = ({1'b1 , (acc_5_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_5_qif_acc_nl = nl_modulo_sub_5_qif_acc_nl[31:0];
  assign nl_modulo_sub_6_qif_acc_nl = ({1'b1 , (acc_8_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_6_qif_acc_nl = nl_modulo_sub_6_qif_acc_nl[31:0];
  assign nl_modulo_sub_9_qif_acc_nl = ({1'b1 , (acc_6_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_9_qif_acc_nl = nl_modulo_sub_9_qif_acc_nl[31:0];
  assign nl_modulo_sub_10_qif_acc_nl = ({1'b1 , (acc_7_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_10_qif_acc_nl = nl_modulo_sub_10_qif_acc_nl[31:0];
  assign nl_modulo_sub_13_qif_acc_nl = ({1'b1 , (acc_5_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_13_qif_acc_nl = nl_modulo_sub_13_qif_acc_nl[31:0];
  assign nl_modulo_sub_14_qif_acc_nl = ({1'b1 , (acc_8_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_14_qif_acc_nl = nl_modulo_sub_14_qif_acc_nl[31:0];
  assign nl_modulo_sub_17_qif_acc_nl = ({1'b1 , (acc_5_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_17_qif_acc_nl = nl_modulo_sub_17_qif_acc_nl[31:0];
  assign nl_modulo_sub_18_qif_acc_nl = ({1'b1 , (acc_8_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_18_qif_acc_nl = nl_modulo_sub_18_qif_acc_nl[31:0];
  assign nl_modulo_sub_21_qif_acc_nl = ({1'b1 , (acc_5_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_21_qif_acc_nl = nl_modulo_sub_21_qif_acc_nl[31:0];
  assign nl_modulo_sub_22_qif_acc_nl = ({1'b1 , (acc_8_cse_32_1[30:0])}) + m_sva;
  assign modulo_sub_22_qif_acc_nl = nl_modulo_sub_22_qif_acc_nl[31:0];
  assign not_1929_nl = ~ not_tmp_396;
  assign S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl = MUX_v_15_2_2(15'b000000000000000,
      (S1_OUTER_LOOP_for_p_sva_1[14:0]), not_1929_nl);
  assign not_1930_nl = ~ not_tmp_396;
  assign S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl = MUX_v_3_2_2(3'b000, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:2]),
      not_1930_nl);
  assign S1_OUTER_LOOP_for_mux_16_nl = MUX_v_2_2_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, not_tmp_396);
  assign nl_z_out_2 = ({S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl , S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl
      , S1_OUTER_LOOP_for_mux_16_nl}) + 20'b00000000000000000001;
  assign z_out_2 = nl_z_out_2[19:0];
  assign nl_acc_3_nl = ({mult_3_res_sva , 1'b1}) + ({(~ m_sva) , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[32:0];
  assign z_out_4 = readslicef_33_32_1(acc_3_nl);
  assign mult_if_or_2_nl = (and_dcpl_184 & and_dcpl_406 & and_dcpl_358 & and_dcpl_253)
      | (and_dcpl_210 & and_dcpl_406 & and_dcpl_23 & and_dcpl_186) | (and_dcpl_425
      & and_dcpl_358 & (~ (fsm_output[4])) & (~ (fsm_output[0]))) | (and_dcpl_210
      & (~ (fsm_output[2])) & (fsm_output[6]) & and_dcpl_23 & (~ (fsm_output[4]))
      & (fsm_output[0])) | (and_dcpl_425 & and_dcpl_23 & and_dcpl_253) | (and_dcpl_31
      & and_dcpl_441 & (fsm_output[7]) & (~ (fsm_output[5])) & and_dcpl_253) | (and_dcpl_284
      & and_dcpl_441 & nor_tmp_9 & and_dcpl_186);
  assign mult_if_mux_1_nl = MUX_v_32_2_2(mult_3_res_sva, mult_2_res_sva, mult_if_or_2_nl);
  assign nl_acc_4_nl = ({mult_if_mux_1_nl , 1'b1}) + ({(~ m_sva) , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[32:0];
  assign z_out_5 = readslicef_33_32_1(acc_4_nl);
  assign nl_acc_5_nl = ({butterFly_11_f1_sva , 1'b1}) + ({(~ reg_mult_2_res_lpi_4_dfm_cse)
      , 1'b1});
  assign acc_5_nl = nl_acc_5_nl[32:0];
  assign acc_5_cse_32_1 = readslicef_33_32_1(acc_5_nl);
  assign nl_acc_6_nl = ({butterFly_15_f1_sva , 1'b1}) + ({(~ reg_mult_res_lpi_4_dfm_cse)
      , 1'b1});
  assign acc_6_nl = nl_acc_6_nl[32:0];
  assign acc_6_cse_32_1 = readslicef_33_32_1(acc_6_nl);
  assign nl_acc_7_nl = ({butterFly_10_f1_sva , 1'b1}) + ({(~ reg_mult_1_res_lpi_4_dfm_cse)
      , 1'b1});
  assign acc_7_nl = nl_acc_7_nl[32:0];
  assign acc_7_cse_32_1 = readslicef_33_32_1(acc_7_nl);
  assign nl_acc_8_nl = ({butterFly_14_f1_sva , 1'b1}) + ({(~ reg_mult_3_res_lpi_4_dfm_cse)
      , 1'b1});
  assign acc_8_nl = nl_acc_8_nl[32:0];
  assign acc_8_cse_32_1 = readslicef_33_32_1(acc_8_nl);
  assign nl_acc_13_nl = ({1'b1 , mult_3_res_sva , 1'b1}) + conv_u2u_33_34({(~ m_sva)
      , 1'b1});
  assign acc_13_nl = nl_acc_13_nl[33:0];
  assign z_out_14_32 = readslicef_34_1_33(acc_13_nl);
  assign mult_1_if_or_2_nl = (and_953_cse & and_dcpl_360 & and_dcpl_358 & and_dcpl_253)
      | (and_953_cse & and_dcpl_370 & and_dcpl_23 & and_dcpl_186) | (and_715_cse_1
      & and_dcpl_358 & (~((fsm_output[4]) | (fsm_output[0])))) | ((fsm_output[2:1]==2'b01)
      & and_dcpl_382 & and_dcpl_23 & (~ (fsm_output[4])) & (fsm_output[0])) | (and_715_cse_1
      & and_dcpl_23 & and_dcpl_253) | (nor_304_cse & and_dcpl_360 & and_dcpl_628
      & and_dcpl_253) | (nor_304_cse & and_dcpl_370 & nor_tmp_9 & and_dcpl_186);
  assign mult_1_if_mult_1_if_mux_1_nl = MUX_v_32_2_2(mult_3_res_sva, mult_2_res_sva,
      mult_1_if_or_2_nl);
  assign nl_acc_15_nl = ({1'b1 , mult_1_if_mult_1_if_mux_1_nl , 1'b1}) + conv_u2u_33_34({(~
      m_sva) , 1'b1});
  assign acc_15_nl = nl_acc_15_nl[33:0];
  assign z_out_16_32 = readslicef_34_1_33(acc_15_nl);

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


  function automatic [1:0] MUX1HOT_v_2_4_2;
    input [1:0] input_3;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [3:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    result = result | ( input_3 & {2{sel[3]}});
    MUX1HOT_v_2_4_2 = result;
  end
  endfunction


  function automatic [1:0] MUX1HOT_v_2_5_2;
    input [1:0] input_4;
    input [1:0] input_3;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [4:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    result = result | ( input_3 & {2{sel[3]}});
    result = result | ( input_4 & {2{sel[4]}});
    MUX1HOT_v_2_5_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_15_2;
    input [31:0] input_14;
    input [31:0] input_13;
    input [31:0] input_12;
    input [31:0] input_11;
    input [31:0] input_10;
    input [31:0] input_9;
    input [31:0] input_8;
    input [31:0] input_7;
    input [31:0] input_6;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [14:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    result = result | ( input_5 & {32{sel[5]}});
    result = result | ( input_6 & {32{sel[6]}});
    result = result | ( input_7 & {32{sel[7]}});
    result = result | ( input_8 & {32{sel[8]}});
    result = result | ( input_9 & {32{sel[9]}});
    result = result | ( input_10 & {32{sel[10]}});
    result = result | ( input_11 & {32{sel[11]}});
    result = result | ( input_12 & {32{sel[12]}});
    result = result | ( input_13 & {32{sel[13]}});
    result = result | ( input_14 & {32{sel[14]}});
    MUX1HOT_v_32_15_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_17_2;
    input [31:0] input_16;
    input [31:0] input_15;
    input [31:0] input_14;
    input [31:0] input_13;
    input [31:0] input_12;
    input [31:0] input_11;
    input [31:0] input_10;
    input [31:0] input_9;
    input [31:0] input_8;
    input [31:0] input_7;
    input [31:0] input_6;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [16:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    result = result | ( input_5 & {32{sel[5]}});
    result = result | ( input_6 & {32{sel[6]}});
    result = result | ( input_7 & {32{sel[7]}});
    result = result | ( input_8 & {32{sel[8]}});
    result = result | ( input_9 & {32{sel[9]}});
    result = result | ( input_10 & {32{sel[10]}});
    result = result | ( input_11 & {32{sel[11]}});
    result = result | ( input_12 & {32{sel[12]}});
    result = result | ( input_13 & {32{sel[13]}});
    result = result | ( input_14 & {32{sel[14]}});
    result = result | ( input_15 & {32{sel[15]}});
    result = result | ( input_16 & {32{sel[16]}});
    MUX1HOT_v_32_17_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_25_2;
    input [31:0] input_24;
    input [31:0] input_23;
    input [31:0] input_22;
    input [31:0] input_21;
    input [31:0] input_20;
    input [31:0] input_19;
    input [31:0] input_18;
    input [31:0] input_17;
    input [31:0] input_16;
    input [31:0] input_15;
    input [31:0] input_14;
    input [31:0] input_13;
    input [31:0] input_12;
    input [31:0] input_11;
    input [31:0] input_10;
    input [31:0] input_9;
    input [31:0] input_8;
    input [31:0] input_7;
    input [31:0] input_6;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [24:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    result = result | ( input_5 & {32{sel[5]}});
    result = result | ( input_6 & {32{sel[6]}});
    result = result | ( input_7 & {32{sel[7]}});
    result = result | ( input_8 & {32{sel[8]}});
    result = result | ( input_9 & {32{sel[9]}});
    result = result | ( input_10 & {32{sel[10]}});
    result = result | ( input_11 & {32{sel[11]}});
    result = result | ( input_12 & {32{sel[12]}});
    result = result | ( input_13 & {32{sel[13]}});
    result = result | ( input_14 & {32{sel[14]}});
    result = result | ( input_15 & {32{sel[15]}});
    result = result | ( input_16 & {32{sel[16]}});
    result = result | ( input_17 & {32{sel[17]}});
    result = result | ( input_18 & {32{sel[18]}});
    result = result | ( input_19 & {32{sel[19]}});
    result = result | ( input_20 & {32{sel[20]}});
    result = result | ( input_21 & {32{sel[21]}});
    result = result | ( input_22 & {32{sel[22]}});
    result = result | ( input_23 & {32{sel[23]}});
    result = result | ( input_24 & {32{sel[24]}});
    MUX1HOT_v_32_25_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_3_2;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [2:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    MUX1HOT_v_32_3_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_4_2;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [3:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    MUX1HOT_v_32_4_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_5_2;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [4:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    MUX1HOT_v_32_5_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_8_2;
    input [31:0] input_7;
    input [31:0] input_6;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [7:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    result = result | ( input_5 & {32{sel[5]}});
    result = result | ( input_6 & {32{sel[6]}});
    result = result | ( input_7 & {32{sel[7]}});
    MUX1HOT_v_32_8_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_9_2;
    input [31:0] input_8;
    input [31:0] input_7;
    input [31:0] input_6;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [8:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    result = result | ( input_5 & {32{sel[5]}});
    result = result | ( input_6 & {32{sel[6]}});
    result = result | ( input_7 & {32{sel[7]}});
    result = result | ( input_8 & {32{sel[8]}});
    MUX1HOT_v_32_9_2 = result;
  end
  endfunction


  function automatic [2:0] MUX1HOT_v_3_9_2;
    input [2:0] input_8;
    input [2:0] input_7;
    input [2:0] input_6;
    input [2:0] input_5;
    input [2:0] input_4;
    input [2:0] input_3;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [8:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    result = result | ( input_3 & {3{sel[3]}});
    result = result | ( input_4 & {3{sel[4]}});
    result = result | ( input_5 & {3{sel[5]}});
    result = result | ( input_6 & {3{sel[6]}});
    result = result | ( input_7 & {3{sel[7]}});
    result = result | ( input_8 & {3{sel[8]}});
    MUX1HOT_v_3_9_2 = result;
  end
  endfunction


  function automatic [4:0] MUX1HOT_v_5_3_2;
    input [4:0] input_2;
    input [4:0] input_1;
    input [4:0] input_0;
    input [2:0] sel;
    reg [4:0] result;
  begin
    result = input_0 & {5{sel[0]}};
    result = result | ( input_1 & {5{sel[1]}});
    result = result | ( input_2 & {5{sel[2]}});
    MUX1HOT_v_5_3_2 = result;
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


  function automatic [14:0] MUX_v_15_2_2;
    input [14:0] input_0;
    input [14:0] input_1;
    input [0:0] sel;
    reg [14:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_15_2_2 = result;
  end
  endfunction


  function automatic [19:0] MUX_v_20_2_2;
    input [19:0] input_0;
    input [19:0] input_1;
    input [0:0] sel;
    reg [19:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_20_2_2 = result;
  end
  endfunction


  function automatic [1:0] MUX_v_2_2_2;
    input [1:0] input_0;
    input [1:0] input_1;
    input [0:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


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


  function automatic [2:0] MUX_v_3_2_2;
    input [2:0] input_0;
    input [2:0] input_1;
    input [0:0] sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_3_2_2 = result;
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


  function automatic [0:0] readslicef_15_1_14;
    input [14:0] vector;
    reg [14:0] tmp;
  begin
    tmp = vector >> 14;
    readslicef_15_1_14 = tmp[0:0];
  end
  endfunction


  function automatic [0:0] readslicef_33_1_32;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_33_1_32 = tmp[0:0];
  end
  endfunction


  function automatic [31:0] readslicef_33_32_1;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_33_32_1 = tmp[31:0];
  end
  endfunction


  function automatic [0:0] readslicef_34_1_33;
    input [33:0] vector;
    reg [33:0] tmp;
  begin
    tmp = vector >> 33;
    readslicef_34_1_33 = tmp[0:0];
  end
  endfunction


  function automatic [5:0] conv_u2s_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2s_5_6 =  {1'b0, vector};
  end
  endfunction


  function automatic [32:0] conv_u2u_32_33 ;
    input [31:0]  vector ;
  begin
    conv_u2u_32_33 = {1'b0, vector};
  end
  endfunction


  function automatic [33:0] conv_u2u_33_34 ;
    input [32:0]  vector ;
  begin
    conv_u2u_33_34 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    hybrid
// ------------------------------------------------------------------


module hybrid (
  clk, rst, x_rsc_s_tdone, x_rsc_tr_write_done, x_rsc_RREADY, x_rsc_RVALID, x_rsc_RUSER,
      x_rsc_RLAST, x_rsc_RRESP, x_rsc_RDATA, x_rsc_RID, x_rsc_ARREADY, x_rsc_ARVALID,
      x_rsc_ARUSER, x_rsc_ARREGION, x_rsc_ARQOS, x_rsc_ARPROT, x_rsc_ARCACHE, x_rsc_ARLOCK,
      x_rsc_ARBURST, x_rsc_ARSIZE, x_rsc_ARLEN, x_rsc_ARADDR, x_rsc_ARID, x_rsc_BREADY,
      x_rsc_BVALID, x_rsc_BUSER, x_rsc_BRESP, x_rsc_BID, x_rsc_WREADY, x_rsc_WVALID,
      x_rsc_WUSER, x_rsc_WLAST, x_rsc_WSTRB, x_rsc_WDATA, x_rsc_AWREADY, x_rsc_AWVALID,
      x_rsc_AWUSER, x_rsc_AWREGION, x_rsc_AWQOS, x_rsc_AWPROT, x_rsc_AWCACHE, x_rsc_AWLOCK,
      x_rsc_AWBURST, x_rsc_AWSIZE, x_rsc_AWLEN, x_rsc_AWADDR, x_rsc_AWID, x_rsc_triosy_lz,
      m_rsc_dat, m_rsc_triosy_lz, twiddle_rsc_s_tdone, twiddle_rsc_tr_write_done,
      twiddle_rsc_RREADY, twiddle_rsc_RVALID, twiddle_rsc_RUSER, twiddle_rsc_RLAST,
      twiddle_rsc_RRESP, twiddle_rsc_RDATA, twiddle_rsc_RID, twiddle_rsc_ARREADY,
      twiddle_rsc_ARVALID, twiddle_rsc_ARUSER, twiddle_rsc_ARREGION, twiddle_rsc_ARQOS,
      twiddle_rsc_ARPROT, twiddle_rsc_ARCACHE, twiddle_rsc_ARLOCK, twiddle_rsc_ARBURST,
      twiddle_rsc_ARSIZE, twiddle_rsc_ARLEN, twiddle_rsc_ARADDR, twiddle_rsc_ARID,
      twiddle_rsc_BREADY, twiddle_rsc_BVALID, twiddle_rsc_BUSER, twiddle_rsc_BRESP,
      twiddle_rsc_BID, twiddle_rsc_WREADY, twiddle_rsc_WVALID, twiddle_rsc_WUSER,
      twiddle_rsc_WLAST, twiddle_rsc_WSTRB, twiddle_rsc_WDATA, twiddle_rsc_AWREADY,
      twiddle_rsc_AWVALID, twiddle_rsc_AWUSER, twiddle_rsc_AWREGION, twiddle_rsc_AWQOS,
      twiddle_rsc_AWPROT, twiddle_rsc_AWCACHE, twiddle_rsc_AWLOCK, twiddle_rsc_AWBURST,
      twiddle_rsc_AWSIZE, twiddle_rsc_AWLEN, twiddle_rsc_AWADDR, twiddle_rsc_AWID,
      twiddle_rsc_triosy_lz, twiddle_h_rsc_s_tdone, twiddle_h_rsc_tr_write_done,
      twiddle_h_rsc_RREADY, twiddle_h_rsc_RVALID, twiddle_h_rsc_RUSER, twiddle_h_rsc_RLAST,
      twiddle_h_rsc_RRESP, twiddle_h_rsc_RDATA, twiddle_h_rsc_RID, twiddle_h_rsc_ARREADY,
      twiddle_h_rsc_ARVALID, twiddle_h_rsc_ARUSER, twiddle_h_rsc_ARREGION, twiddle_h_rsc_ARQOS,
      twiddle_h_rsc_ARPROT, twiddle_h_rsc_ARCACHE, twiddle_h_rsc_ARLOCK, twiddle_h_rsc_ARBURST,
      twiddle_h_rsc_ARSIZE, twiddle_h_rsc_ARLEN, twiddle_h_rsc_ARADDR, twiddle_h_rsc_ARID,
      twiddle_h_rsc_BREADY, twiddle_h_rsc_BVALID, twiddle_h_rsc_BUSER, twiddle_h_rsc_BRESP,
      twiddle_h_rsc_BID, twiddle_h_rsc_WREADY, twiddle_h_rsc_WVALID, twiddle_h_rsc_WUSER,
      twiddle_h_rsc_WLAST, twiddle_h_rsc_WSTRB, twiddle_h_rsc_WDATA, twiddle_h_rsc_AWREADY,
      twiddle_h_rsc_AWVALID, twiddle_h_rsc_AWUSER, twiddle_h_rsc_AWREGION, twiddle_h_rsc_AWQOS,
      twiddle_h_rsc_AWPROT, twiddle_h_rsc_AWCACHE, twiddle_h_rsc_AWLOCK, twiddle_h_rsc_AWBURST,
      twiddle_h_rsc_AWSIZE, twiddle_h_rsc_AWLEN, twiddle_h_rsc_AWADDR, twiddle_h_rsc_AWID,
      twiddle_h_rsc_triosy_lz, revArr_rsc_s_tdone, revArr_rsc_tr_write_done, revArr_rsc_RREADY,
      revArr_rsc_RVALID, revArr_rsc_RUSER, revArr_rsc_RLAST, revArr_rsc_RRESP, revArr_rsc_RDATA,
      revArr_rsc_RID, revArr_rsc_ARREADY, revArr_rsc_ARVALID, revArr_rsc_ARUSER,
      revArr_rsc_ARREGION, revArr_rsc_ARQOS, revArr_rsc_ARPROT, revArr_rsc_ARCACHE,
      revArr_rsc_ARLOCK, revArr_rsc_ARBURST, revArr_rsc_ARSIZE, revArr_rsc_ARLEN,
      revArr_rsc_ARADDR, revArr_rsc_ARID, revArr_rsc_BREADY, revArr_rsc_BVALID, revArr_rsc_BUSER,
      revArr_rsc_BRESP, revArr_rsc_BID, revArr_rsc_WREADY, revArr_rsc_WVALID, revArr_rsc_WUSER,
      revArr_rsc_WLAST, revArr_rsc_WSTRB, revArr_rsc_WDATA, revArr_rsc_AWREADY, revArr_rsc_AWVALID,
      revArr_rsc_AWUSER, revArr_rsc_AWREGION, revArr_rsc_AWQOS, revArr_rsc_AWPROT,
      revArr_rsc_AWCACHE, revArr_rsc_AWLOCK, revArr_rsc_AWBURST, revArr_rsc_AWSIZE,
      revArr_rsc_AWLEN, revArr_rsc_AWADDR, revArr_rsc_AWID, revArr_rsc_triosy_lz,
      tw_rsc_s_tdone, tw_rsc_tr_write_done, tw_rsc_RREADY, tw_rsc_RVALID, tw_rsc_RUSER,
      tw_rsc_RLAST, tw_rsc_RRESP, tw_rsc_RDATA, tw_rsc_RID, tw_rsc_ARREADY, tw_rsc_ARVALID,
      tw_rsc_ARUSER, tw_rsc_ARREGION, tw_rsc_ARQOS, tw_rsc_ARPROT, tw_rsc_ARCACHE,
      tw_rsc_ARLOCK, tw_rsc_ARBURST, tw_rsc_ARSIZE, tw_rsc_ARLEN, tw_rsc_ARADDR,
      tw_rsc_ARID, tw_rsc_BREADY, tw_rsc_BVALID, tw_rsc_BUSER, tw_rsc_BRESP, tw_rsc_BID,
      tw_rsc_WREADY, tw_rsc_WVALID, tw_rsc_WUSER, tw_rsc_WLAST, tw_rsc_WSTRB, tw_rsc_WDATA,
      tw_rsc_AWREADY, tw_rsc_AWVALID, tw_rsc_AWUSER, tw_rsc_AWREGION, tw_rsc_AWQOS,
      tw_rsc_AWPROT, tw_rsc_AWCACHE, tw_rsc_AWLOCK, tw_rsc_AWBURST, tw_rsc_AWSIZE,
      tw_rsc_AWLEN, tw_rsc_AWADDR, tw_rsc_AWID, tw_rsc_triosy_lz, tw_h_rsc_s_tdone,
      tw_h_rsc_tr_write_done, tw_h_rsc_RREADY, tw_h_rsc_RVALID, tw_h_rsc_RUSER, tw_h_rsc_RLAST,
      tw_h_rsc_RRESP, tw_h_rsc_RDATA, tw_h_rsc_RID, tw_h_rsc_ARREADY, tw_h_rsc_ARVALID,
      tw_h_rsc_ARUSER, tw_h_rsc_ARREGION, tw_h_rsc_ARQOS, tw_h_rsc_ARPROT, tw_h_rsc_ARCACHE,
      tw_h_rsc_ARLOCK, tw_h_rsc_ARBURST, tw_h_rsc_ARSIZE, tw_h_rsc_ARLEN, tw_h_rsc_ARADDR,
      tw_h_rsc_ARID, tw_h_rsc_BREADY, tw_h_rsc_BVALID, tw_h_rsc_BUSER, tw_h_rsc_BRESP,
      tw_h_rsc_BID, tw_h_rsc_WREADY, tw_h_rsc_WVALID, tw_h_rsc_WUSER, tw_h_rsc_WLAST,
      tw_h_rsc_WSTRB, tw_h_rsc_WDATA, tw_h_rsc_AWREADY, tw_h_rsc_AWVALID, tw_h_rsc_AWUSER,
      tw_h_rsc_AWREGION, tw_h_rsc_AWQOS, tw_h_rsc_AWPROT, tw_h_rsc_AWCACHE, tw_h_rsc_AWLOCK,
      tw_h_rsc_AWBURST, tw_h_rsc_AWSIZE, tw_h_rsc_AWLEN, tw_h_rsc_AWADDR, tw_h_rsc_AWID,
      tw_h_rsc_triosy_lz
);
  input clk;
  input rst;
  input x_rsc_s_tdone;
  input x_rsc_tr_write_done;
  input x_rsc_RREADY;
  output x_rsc_RVALID;
  output x_rsc_RUSER;
  output x_rsc_RLAST;
  output [1:0] x_rsc_RRESP;
  output [31:0] x_rsc_RDATA;
  output x_rsc_RID;
  output x_rsc_ARREADY;
  input x_rsc_ARVALID;
  input x_rsc_ARUSER;
  input [3:0] x_rsc_ARREGION;
  input [3:0] x_rsc_ARQOS;
  input [2:0] x_rsc_ARPROT;
  input [3:0] x_rsc_ARCACHE;
  input x_rsc_ARLOCK;
  input [1:0] x_rsc_ARBURST;
  input [2:0] x_rsc_ARSIZE;
  input [7:0] x_rsc_ARLEN;
  input [11:0] x_rsc_ARADDR;
  input x_rsc_ARID;
  input x_rsc_BREADY;
  output x_rsc_BVALID;
  output x_rsc_BUSER;
  output [1:0] x_rsc_BRESP;
  output x_rsc_BID;
  output x_rsc_WREADY;
  input x_rsc_WVALID;
  input x_rsc_WUSER;
  input x_rsc_WLAST;
  input [3:0] x_rsc_WSTRB;
  input [31:0] x_rsc_WDATA;
  output x_rsc_AWREADY;
  input x_rsc_AWVALID;
  input x_rsc_AWUSER;
  input [3:0] x_rsc_AWREGION;
  input [3:0] x_rsc_AWQOS;
  input [2:0] x_rsc_AWPROT;
  input [3:0] x_rsc_AWCACHE;
  input x_rsc_AWLOCK;
  input [1:0] x_rsc_AWBURST;
  input [2:0] x_rsc_AWSIZE;
  input [7:0] x_rsc_AWLEN;
  input [11:0] x_rsc_AWADDR;
  input x_rsc_AWID;
  output x_rsc_triosy_lz;
  input [31:0] m_rsc_dat;
  output m_rsc_triosy_lz;
  input twiddle_rsc_s_tdone;
  input twiddle_rsc_tr_write_done;
  input twiddle_rsc_RREADY;
  output twiddle_rsc_RVALID;
  output twiddle_rsc_RUSER;
  output twiddle_rsc_RLAST;
  output [1:0] twiddle_rsc_RRESP;
  output [31:0] twiddle_rsc_RDATA;
  output twiddle_rsc_RID;
  output twiddle_rsc_ARREADY;
  input twiddle_rsc_ARVALID;
  input twiddle_rsc_ARUSER;
  input [3:0] twiddle_rsc_ARREGION;
  input [3:0] twiddle_rsc_ARQOS;
  input [2:0] twiddle_rsc_ARPROT;
  input [3:0] twiddle_rsc_ARCACHE;
  input twiddle_rsc_ARLOCK;
  input [1:0] twiddle_rsc_ARBURST;
  input [2:0] twiddle_rsc_ARSIZE;
  input [7:0] twiddle_rsc_ARLEN;
  input [11:0] twiddle_rsc_ARADDR;
  input twiddle_rsc_ARID;
  input twiddle_rsc_BREADY;
  output twiddle_rsc_BVALID;
  output twiddle_rsc_BUSER;
  output [1:0] twiddle_rsc_BRESP;
  output twiddle_rsc_BID;
  output twiddle_rsc_WREADY;
  input twiddle_rsc_WVALID;
  input twiddle_rsc_WUSER;
  input twiddle_rsc_WLAST;
  input [3:0] twiddle_rsc_WSTRB;
  input [31:0] twiddle_rsc_WDATA;
  output twiddle_rsc_AWREADY;
  input twiddle_rsc_AWVALID;
  input twiddle_rsc_AWUSER;
  input [3:0] twiddle_rsc_AWREGION;
  input [3:0] twiddle_rsc_AWQOS;
  input [2:0] twiddle_rsc_AWPROT;
  input [3:0] twiddle_rsc_AWCACHE;
  input twiddle_rsc_AWLOCK;
  input [1:0] twiddle_rsc_AWBURST;
  input [2:0] twiddle_rsc_AWSIZE;
  input [7:0] twiddle_rsc_AWLEN;
  input [11:0] twiddle_rsc_AWADDR;
  input twiddle_rsc_AWID;
  output twiddle_rsc_triosy_lz;
  input twiddle_h_rsc_s_tdone;
  input twiddle_h_rsc_tr_write_done;
  input twiddle_h_rsc_RREADY;
  output twiddle_h_rsc_RVALID;
  output twiddle_h_rsc_RUSER;
  output twiddle_h_rsc_RLAST;
  output [1:0] twiddle_h_rsc_RRESP;
  output [31:0] twiddle_h_rsc_RDATA;
  output twiddle_h_rsc_RID;
  output twiddle_h_rsc_ARREADY;
  input twiddle_h_rsc_ARVALID;
  input twiddle_h_rsc_ARUSER;
  input [3:0] twiddle_h_rsc_ARREGION;
  input [3:0] twiddle_h_rsc_ARQOS;
  input [2:0] twiddle_h_rsc_ARPROT;
  input [3:0] twiddle_h_rsc_ARCACHE;
  input twiddle_h_rsc_ARLOCK;
  input [1:0] twiddle_h_rsc_ARBURST;
  input [2:0] twiddle_h_rsc_ARSIZE;
  input [7:0] twiddle_h_rsc_ARLEN;
  input [11:0] twiddle_h_rsc_ARADDR;
  input twiddle_h_rsc_ARID;
  input twiddle_h_rsc_BREADY;
  output twiddle_h_rsc_BVALID;
  output twiddle_h_rsc_BUSER;
  output [1:0] twiddle_h_rsc_BRESP;
  output twiddle_h_rsc_BID;
  output twiddle_h_rsc_WREADY;
  input twiddle_h_rsc_WVALID;
  input twiddle_h_rsc_WUSER;
  input twiddle_h_rsc_WLAST;
  input [3:0] twiddle_h_rsc_WSTRB;
  input [31:0] twiddle_h_rsc_WDATA;
  output twiddle_h_rsc_AWREADY;
  input twiddle_h_rsc_AWVALID;
  input twiddle_h_rsc_AWUSER;
  input [3:0] twiddle_h_rsc_AWREGION;
  input [3:0] twiddle_h_rsc_AWQOS;
  input [2:0] twiddle_h_rsc_AWPROT;
  input [3:0] twiddle_h_rsc_AWCACHE;
  input twiddle_h_rsc_AWLOCK;
  input [1:0] twiddle_h_rsc_AWBURST;
  input [2:0] twiddle_h_rsc_AWSIZE;
  input [7:0] twiddle_h_rsc_AWLEN;
  input [11:0] twiddle_h_rsc_AWADDR;
  input twiddle_h_rsc_AWID;
  output twiddle_h_rsc_triosy_lz;
  input revArr_rsc_s_tdone;
  input revArr_rsc_tr_write_done;
  input revArr_rsc_RREADY;
  output revArr_rsc_RVALID;
  output revArr_rsc_RUSER;
  output revArr_rsc_RLAST;
  output [1:0] revArr_rsc_RRESP;
  output [31:0] revArr_rsc_RDATA;
  output revArr_rsc_RID;
  output revArr_rsc_ARREADY;
  input revArr_rsc_ARVALID;
  input revArr_rsc_ARUSER;
  input [3:0] revArr_rsc_ARREGION;
  input [3:0] revArr_rsc_ARQOS;
  input [2:0] revArr_rsc_ARPROT;
  input [3:0] revArr_rsc_ARCACHE;
  input revArr_rsc_ARLOCK;
  input [1:0] revArr_rsc_ARBURST;
  input [2:0] revArr_rsc_ARSIZE;
  input [7:0] revArr_rsc_ARLEN;
  input [11:0] revArr_rsc_ARADDR;
  input revArr_rsc_ARID;
  input revArr_rsc_BREADY;
  output revArr_rsc_BVALID;
  output revArr_rsc_BUSER;
  output [1:0] revArr_rsc_BRESP;
  output revArr_rsc_BID;
  output revArr_rsc_WREADY;
  input revArr_rsc_WVALID;
  input revArr_rsc_WUSER;
  input revArr_rsc_WLAST;
  input [3:0] revArr_rsc_WSTRB;
  input [31:0] revArr_rsc_WDATA;
  output revArr_rsc_AWREADY;
  input revArr_rsc_AWVALID;
  input revArr_rsc_AWUSER;
  input [3:0] revArr_rsc_AWREGION;
  input [3:0] revArr_rsc_AWQOS;
  input [2:0] revArr_rsc_AWPROT;
  input [3:0] revArr_rsc_AWCACHE;
  input revArr_rsc_AWLOCK;
  input [1:0] revArr_rsc_AWBURST;
  input [2:0] revArr_rsc_AWSIZE;
  input [7:0] revArr_rsc_AWLEN;
  input [11:0] revArr_rsc_AWADDR;
  input revArr_rsc_AWID;
  output revArr_rsc_triosy_lz;
  input tw_rsc_s_tdone;
  input tw_rsc_tr_write_done;
  input tw_rsc_RREADY;
  output tw_rsc_RVALID;
  output tw_rsc_RUSER;
  output tw_rsc_RLAST;
  output [1:0] tw_rsc_RRESP;
  output [31:0] tw_rsc_RDATA;
  output tw_rsc_RID;
  output tw_rsc_ARREADY;
  input tw_rsc_ARVALID;
  input tw_rsc_ARUSER;
  input [3:0] tw_rsc_ARREGION;
  input [3:0] tw_rsc_ARQOS;
  input [2:0] tw_rsc_ARPROT;
  input [3:0] tw_rsc_ARCACHE;
  input tw_rsc_ARLOCK;
  input [1:0] tw_rsc_ARBURST;
  input [2:0] tw_rsc_ARSIZE;
  input [7:0] tw_rsc_ARLEN;
  input [11:0] tw_rsc_ARADDR;
  input tw_rsc_ARID;
  input tw_rsc_BREADY;
  output tw_rsc_BVALID;
  output tw_rsc_BUSER;
  output [1:0] tw_rsc_BRESP;
  output tw_rsc_BID;
  output tw_rsc_WREADY;
  input tw_rsc_WVALID;
  input tw_rsc_WUSER;
  input tw_rsc_WLAST;
  input [3:0] tw_rsc_WSTRB;
  input [31:0] tw_rsc_WDATA;
  output tw_rsc_AWREADY;
  input tw_rsc_AWVALID;
  input tw_rsc_AWUSER;
  input [3:0] tw_rsc_AWREGION;
  input [3:0] tw_rsc_AWQOS;
  input [2:0] tw_rsc_AWPROT;
  input [3:0] tw_rsc_AWCACHE;
  input tw_rsc_AWLOCK;
  input [1:0] tw_rsc_AWBURST;
  input [2:0] tw_rsc_AWSIZE;
  input [7:0] tw_rsc_AWLEN;
  input [11:0] tw_rsc_AWADDR;
  input tw_rsc_AWID;
  output tw_rsc_triosy_lz;
  input tw_h_rsc_s_tdone;
  input tw_h_rsc_tr_write_done;
  input tw_h_rsc_RREADY;
  output tw_h_rsc_RVALID;
  output tw_h_rsc_RUSER;
  output tw_h_rsc_RLAST;
  output [1:0] tw_h_rsc_RRESP;
  output [31:0] tw_h_rsc_RDATA;
  output tw_h_rsc_RID;
  output tw_h_rsc_ARREADY;
  input tw_h_rsc_ARVALID;
  input tw_h_rsc_ARUSER;
  input [3:0] tw_h_rsc_ARREGION;
  input [3:0] tw_h_rsc_ARQOS;
  input [2:0] tw_h_rsc_ARPROT;
  input [3:0] tw_h_rsc_ARCACHE;
  input tw_h_rsc_ARLOCK;
  input [1:0] tw_h_rsc_ARBURST;
  input [2:0] tw_h_rsc_ARSIZE;
  input [7:0] tw_h_rsc_ARLEN;
  input [11:0] tw_h_rsc_ARADDR;
  input tw_h_rsc_ARID;
  input tw_h_rsc_BREADY;
  output tw_h_rsc_BVALID;
  output tw_h_rsc_BUSER;
  output [1:0] tw_h_rsc_BRESP;
  output tw_h_rsc_BID;
  output tw_h_rsc_WREADY;
  input tw_h_rsc_WVALID;
  input tw_h_rsc_WUSER;
  input tw_h_rsc_WLAST;
  input [3:0] tw_h_rsc_WSTRB;
  input [31:0] tw_h_rsc_WDATA;
  output tw_h_rsc_AWREADY;
  input tw_h_rsc_AWVALID;
  input tw_h_rsc_AWUSER;
  input [3:0] tw_h_rsc_AWREGION;
  input [3:0] tw_h_rsc_AWQOS;
  input [2:0] tw_h_rsc_AWPROT;
  input [3:0] tw_h_rsc_AWCACHE;
  input tw_h_rsc_AWLOCK;
  input [1:0] tw_h_rsc_AWBURST;
  input [2:0] tw_h_rsc_AWSIZE;
  input [7:0] tw_h_rsc_AWLEN;
  input [11:0] tw_h_rsc_AWADDR;
  input tw_h_rsc_AWID;
  output tw_h_rsc_triosy_lz;


  // Interconnect Declarations
  wire xx_rsci_clken_d;
  wire [31:0] xx_rsci_d_d;
  wire [31:0] xx_rsci_q_d;
  wire [9:0] xx_rsci_radr_d;
  wire [9:0] xx_rsci_wadr_d;
  wire xx_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire yy_rsci_clken_d;
  wire [31:0] yy_rsci_d_d;
  wire [31:0] yy_rsci_q_d;
  wire [9:0] yy_rsci_radr_d;
  wire [9:0] yy_rsci_wadr_d;
  wire yy_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire [4:0] S34_OUTER_LOOP_for_tf_mul_cmp_a;
  wire [9:0] S34_OUTER_LOOP_for_tf_mul_cmp_b;
  wire xx_rsc_clken;
  wire [31:0] xx_rsc_q;
  wire [9:0] xx_rsc_radr;
  wire xx_rsc_we;
  wire [31:0] xx_rsc_d;
  wire [9:0] xx_rsc_wadr;
  wire yy_rsc_clken;
  wire [31:0] yy_rsc_q;
  wire [9:0] yy_rsc_radr;
  wire yy_rsc_we;
  wire [31:0] yy_rsc_d;
  wire [9:0] yy_rsc_wadr;
  wire xx_rsci_we_d_iff;
  wire yy_rsci_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [9:0] nl_hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z;
  assign nl_hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z = conv_u2u_15_10(S34_OUTER_LOOP_for_tf_mul_cmp_a
      * S34_OUTER_LOOP_for_tf_mul_cmp_b);
  BLOCK_1R1W_RBW #(.addr_width(32'sd10),
  .data_width(32'sd32),
  .depth(32'sd1024),
  .latency(32'sd1)) xx_rsc_comp (
      .clk(clk),
      .clken(xx_rsc_clken),
      .d(xx_rsc_d),
      .q(xx_rsc_q),
      .radr(xx_rsc_radr),
      .wadr(xx_rsc_wadr),
      .we(xx_rsc_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd10),
  .data_width(32'sd32),
  .depth(32'sd1024),
  .latency(32'sd1)) yy_rsc_comp (
      .clk(clk),
      .clken(yy_rsc_clken),
      .d(yy_rsc_d),
      .q(yy_rsc_q),
      .radr(yy_rsc_radr),
      .wadr(yy_rsc_wadr),
      .we(yy_rsc_we)
    );
  hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen xx_rsci
      (
      .clken(xx_rsc_clken),
      .q(xx_rsc_q),
      .radr(xx_rsc_radr),
      .we(xx_rsc_we),
      .d(xx_rsc_d),
      .wadr(xx_rsc_wadr),
      .clken_d(xx_rsci_clken_d),
      .d_d(xx_rsci_d_d),
      .q_d(xx_rsci_q_d),
      .radr_d(xx_rsci_radr_d),
      .wadr_d(xx_rsci_wadr_d),
      .we_d(xx_rsci_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(xx_rsci_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(xx_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen yy_rsci
      (
      .clken(yy_rsc_clken),
      .q(yy_rsc_q),
      .radr(yy_rsc_radr),
      .we(yy_rsc_we),
      .d(yy_rsc_d),
      .wadr(yy_rsc_wadr),
      .clken_d(yy_rsci_clken_d),
      .d_d(yy_rsci_d_d),
      .q_d(yy_rsci_q_d),
      .radr_d(yy_rsci_radr_d),
      .wadr_d(yy_rsci_wadr_d),
      .we_d(yy_rsci_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yy_rsci_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yy_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  hybrid_core hybrid_core_inst (
      .clk(clk),
      .rst(rst),
      .x_rsc_s_tdone(x_rsc_s_tdone),
      .x_rsc_tr_write_done(x_rsc_tr_write_done),
      .x_rsc_RREADY(x_rsc_RREADY),
      .x_rsc_RVALID(x_rsc_RVALID),
      .x_rsc_RUSER(x_rsc_RUSER),
      .x_rsc_RLAST(x_rsc_RLAST),
      .x_rsc_RRESP(x_rsc_RRESP),
      .x_rsc_RDATA(x_rsc_RDATA),
      .x_rsc_RID(x_rsc_RID),
      .x_rsc_ARREADY(x_rsc_ARREADY),
      .x_rsc_ARVALID(x_rsc_ARVALID),
      .x_rsc_ARUSER(x_rsc_ARUSER),
      .x_rsc_ARREGION(x_rsc_ARREGION),
      .x_rsc_ARQOS(x_rsc_ARQOS),
      .x_rsc_ARPROT(x_rsc_ARPROT),
      .x_rsc_ARCACHE(x_rsc_ARCACHE),
      .x_rsc_ARLOCK(x_rsc_ARLOCK),
      .x_rsc_ARBURST(x_rsc_ARBURST),
      .x_rsc_ARSIZE(x_rsc_ARSIZE),
      .x_rsc_ARLEN(x_rsc_ARLEN),
      .x_rsc_ARADDR(x_rsc_ARADDR),
      .x_rsc_ARID(x_rsc_ARID),
      .x_rsc_BREADY(x_rsc_BREADY),
      .x_rsc_BVALID(x_rsc_BVALID),
      .x_rsc_BUSER(x_rsc_BUSER),
      .x_rsc_BRESP(x_rsc_BRESP),
      .x_rsc_BID(x_rsc_BID),
      .x_rsc_WREADY(x_rsc_WREADY),
      .x_rsc_WVALID(x_rsc_WVALID),
      .x_rsc_WUSER(x_rsc_WUSER),
      .x_rsc_WLAST(x_rsc_WLAST),
      .x_rsc_WSTRB(x_rsc_WSTRB),
      .x_rsc_WDATA(x_rsc_WDATA),
      .x_rsc_AWREADY(x_rsc_AWREADY),
      .x_rsc_AWVALID(x_rsc_AWVALID),
      .x_rsc_AWUSER(x_rsc_AWUSER),
      .x_rsc_AWREGION(x_rsc_AWREGION),
      .x_rsc_AWQOS(x_rsc_AWQOS),
      .x_rsc_AWPROT(x_rsc_AWPROT),
      .x_rsc_AWCACHE(x_rsc_AWCACHE),
      .x_rsc_AWLOCK(x_rsc_AWLOCK),
      .x_rsc_AWBURST(x_rsc_AWBURST),
      .x_rsc_AWSIZE(x_rsc_AWSIZE),
      .x_rsc_AWLEN(x_rsc_AWLEN),
      .x_rsc_AWADDR(x_rsc_AWADDR),
      .x_rsc_AWID(x_rsc_AWID),
      .x_rsc_triosy_lz(x_rsc_triosy_lz),
      .m_rsc_dat(m_rsc_dat),
      .m_rsc_triosy_lz(m_rsc_triosy_lz),
      .twiddle_rsc_s_tdone(twiddle_rsc_s_tdone),
      .twiddle_rsc_tr_write_done(twiddle_rsc_tr_write_done),
      .twiddle_rsc_RREADY(twiddle_rsc_RREADY),
      .twiddle_rsc_RVALID(twiddle_rsc_RVALID),
      .twiddle_rsc_RUSER(twiddle_rsc_RUSER),
      .twiddle_rsc_RLAST(twiddle_rsc_RLAST),
      .twiddle_rsc_RRESP(twiddle_rsc_RRESP),
      .twiddle_rsc_RDATA(twiddle_rsc_RDATA),
      .twiddle_rsc_RID(twiddle_rsc_RID),
      .twiddle_rsc_ARREADY(twiddle_rsc_ARREADY),
      .twiddle_rsc_ARVALID(twiddle_rsc_ARVALID),
      .twiddle_rsc_ARUSER(twiddle_rsc_ARUSER),
      .twiddle_rsc_ARREGION(twiddle_rsc_ARREGION),
      .twiddle_rsc_ARQOS(twiddle_rsc_ARQOS),
      .twiddle_rsc_ARPROT(twiddle_rsc_ARPROT),
      .twiddle_rsc_ARCACHE(twiddle_rsc_ARCACHE),
      .twiddle_rsc_ARLOCK(twiddle_rsc_ARLOCK),
      .twiddle_rsc_ARBURST(twiddle_rsc_ARBURST),
      .twiddle_rsc_ARSIZE(twiddle_rsc_ARSIZE),
      .twiddle_rsc_ARLEN(twiddle_rsc_ARLEN),
      .twiddle_rsc_ARADDR(twiddle_rsc_ARADDR),
      .twiddle_rsc_ARID(twiddle_rsc_ARID),
      .twiddle_rsc_BREADY(twiddle_rsc_BREADY),
      .twiddle_rsc_BVALID(twiddle_rsc_BVALID),
      .twiddle_rsc_BUSER(twiddle_rsc_BUSER),
      .twiddle_rsc_BRESP(twiddle_rsc_BRESP),
      .twiddle_rsc_BID(twiddle_rsc_BID),
      .twiddle_rsc_WREADY(twiddle_rsc_WREADY),
      .twiddle_rsc_WVALID(twiddle_rsc_WVALID),
      .twiddle_rsc_WUSER(twiddle_rsc_WUSER),
      .twiddle_rsc_WLAST(twiddle_rsc_WLAST),
      .twiddle_rsc_WSTRB(twiddle_rsc_WSTRB),
      .twiddle_rsc_WDATA(twiddle_rsc_WDATA),
      .twiddle_rsc_AWREADY(twiddle_rsc_AWREADY),
      .twiddle_rsc_AWVALID(twiddle_rsc_AWVALID),
      .twiddle_rsc_AWUSER(twiddle_rsc_AWUSER),
      .twiddle_rsc_AWREGION(twiddle_rsc_AWREGION),
      .twiddle_rsc_AWQOS(twiddle_rsc_AWQOS),
      .twiddle_rsc_AWPROT(twiddle_rsc_AWPROT),
      .twiddle_rsc_AWCACHE(twiddle_rsc_AWCACHE),
      .twiddle_rsc_AWLOCK(twiddle_rsc_AWLOCK),
      .twiddle_rsc_AWBURST(twiddle_rsc_AWBURST),
      .twiddle_rsc_AWSIZE(twiddle_rsc_AWSIZE),
      .twiddle_rsc_AWLEN(twiddle_rsc_AWLEN),
      .twiddle_rsc_AWADDR(twiddle_rsc_AWADDR),
      .twiddle_rsc_AWID(twiddle_rsc_AWID),
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .twiddle_h_rsc_s_tdone(twiddle_h_rsc_s_tdone),
      .twiddle_h_rsc_tr_write_done(twiddle_h_rsc_tr_write_done),
      .twiddle_h_rsc_RREADY(twiddle_h_rsc_RREADY),
      .twiddle_h_rsc_RVALID(twiddle_h_rsc_RVALID),
      .twiddle_h_rsc_RUSER(twiddle_h_rsc_RUSER),
      .twiddle_h_rsc_RLAST(twiddle_h_rsc_RLAST),
      .twiddle_h_rsc_RRESP(twiddle_h_rsc_RRESP),
      .twiddle_h_rsc_RDATA(twiddle_h_rsc_RDATA),
      .twiddle_h_rsc_RID(twiddle_h_rsc_RID),
      .twiddle_h_rsc_ARREADY(twiddle_h_rsc_ARREADY),
      .twiddle_h_rsc_ARVALID(twiddle_h_rsc_ARVALID),
      .twiddle_h_rsc_ARUSER(twiddle_h_rsc_ARUSER),
      .twiddle_h_rsc_ARREGION(twiddle_h_rsc_ARREGION),
      .twiddle_h_rsc_ARQOS(twiddle_h_rsc_ARQOS),
      .twiddle_h_rsc_ARPROT(twiddle_h_rsc_ARPROT),
      .twiddle_h_rsc_ARCACHE(twiddle_h_rsc_ARCACHE),
      .twiddle_h_rsc_ARLOCK(twiddle_h_rsc_ARLOCK),
      .twiddle_h_rsc_ARBURST(twiddle_h_rsc_ARBURST),
      .twiddle_h_rsc_ARSIZE(twiddle_h_rsc_ARSIZE),
      .twiddle_h_rsc_ARLEN(twiddle_h_rsc_ARLEN),
      .twiddle_h_rsc_ARADDR(twiddle_h_rsc_ARADDR),
      .twiddle_h_rsc_ARID(twiddle_h_rsc_ARID),
      .twiddle_h_rsc_BREADY(twiddle_h_rsc_BREADY),
      .twiddle_h_rsc_BVALID(twiddle_h_rsc_BVALID),
      .twiddle_h_rsc_BUSER(twiddle_h_rsc_BUSER),
      .twiddle_h_rsc_BRESP(twiddle_h_rsc_BRESP),
      .twiddle_h_rsc_BID(twiddle_h_rsc_BID),
      .twiddle_h_rsc_WREADY(twiddle_h_rsc_WREADY),
      .twiddle_h_rsc_WVALID(twiddle_h_rsc_WVALID),
      .twiddle_h_rsc_WUSER(twiddle_h_rsc_WUSER),
      .twiddle_h_rsc_WLAST(twiddle_h_rsc_WLAST),
      .twiddle_h_rsc_WSTRB(twiddle_h_rsc_WSTRB),
      .twiddle_h_rsc_WDATA(twiddle_h_rsc_WDATA),
      .twiddle_h_rsc_AWREADY(twiddle_h_rsc_AWREADY),
      .twiddle_h_rsc_AWVALID(twiddle_h_rsc_AWVALID),
      .twiddle_h_rsc_AWUSER(twiddle_h_rsc_AWUSER),
      .twiddle_h_rsc_AWREGION(twiddle_h_rsc_AWREGION),
      .twiddle_h_rsc_AWQOS(twiddle_h_rsc_AWQOS),
      .twiddle_h_rsc_AWPROT(twiddle_h_rsc_AWPROT),
      .twiddle_h_rsc_AWCACHE(twiddle_h_rsc_AWCACHE),
      .twiddle_h_rsc_AWLOCK(twiddle_h_rsc_AWLOCK),
      .twiddle_h_rsc_AWBURST(twiddle_h_rsc_AWBURST),
      .twiddle_h_rsc_AWSIZE(twiddle_h_rsc_AWSIZE),
      .twiddle_h_rsc_AWLEN(twiddle_h_rsc_AWLEN),
      .twiddle_h_rsc_AWADDR(twiddle_h_rsc_AWADDR),
      .twiddle_h_rsc_AWID(twiddle_h_rsc_AWID),
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .revArr_rsc_s_tdone(revArr_rsc_s_tdone),
      .revArr_rsc_tr_write_done(revArr_rsc_tr_write_done),
      .revArr_rsc_RREADY(revArr_rsc_RREADY),
      .revArr_rsc_RVALID(revArr_rsc_RVALID),
      .revArr_rsc_RUSER(revArr_rsc_RUSER),
      .revArr_rsc_RLAST(revArr_rsc_RLAST),
      .revArr_rsc_RRESP(revArr_rsc_RRESP),
      .revArr_rsc_RDATA(revArr_rsc_RDATA),
      .revArr_rsc_RID(revArr_rsc_RID),
      .revArr_rsc_ARREADY(revArr_rsc_ARREADY),
      .revArr_rsc_ARVALID(revArr_rsc_ARVALID),
      .revArr_rsc_ARUSER(revArr_rsc_ARUSER),
      .revArr_rsc_ARREGION(revArr_rsc_ARREGION),
      .revArr_rsc_ARQOS(revArr_rsc_ARQOS),
      .revArr_rsc_ARPROT(revArr_rsc_ARPROT),
      .revArr_rsc_ARCACHE(revArr_rsc_ARCACHE),
      .revArr_rsc_ARLOCK(revArr_rsc_ARLOCK),
      .revArr_rsc_ARBURST(revArr_rsc_ARBURST),
      .revArr_rsc_ARSIZE(revArr_rsc_ARSIZE),
      .revArr_rsc_ARLEN(revArr_rsc_ARLEN),
      .revArr_rsc_ARADDR(revArr_rsc_ARADDR),
      .revArr_rsc_ARID(revArr_rsc_ARID),
      .revArr_rsc_BREADY(revArr_rsc_BREADY),
      .revArr_rsc_BVALID(revArr_rsc_BVALID),
      .revArr_rsc_BUSER(revArr_rsc_BUSER),
      .revArr_rsc_BRESP(revArr_rsc_BRESP),
      .revArr_rsc_BID(revArr_rsc_BID),
      .revArr_rsc_WREADY(revArr_rsc_WREADY),
      .revArr_rsc_WVALID(revArr_rsc_WVALID),
      .revArr_rsc_WUSER(revArr_rsc_WUSER),
      .revArr_rsc_WLAST(revArr_rsc_WLAST),
      .revArr_rsc_WSTRB(revArr_rsc_WSTRB),
      .revArr_rsc_WDATA(revArr_rsc_WDATA),
      .revArr_rsc_AWREADY(revArr_rsc_AWREADY),
      .revArr_rsc_AWVALID(revArr_rsc_AWVALID),
      .revArr_rsc_AWUSER(revArr_rsc_AWUSER),
      .revArr_rsc_AWREGION(revArr_rsc_AWREGION),
      .revArr_rsc_AWQOS(revArr_rsc_AWQOS),
      .revArr_rsc_AWPROT(revArr_rsc_AWPROT),
      .revArr_rsc_AWCACHE(revArr_rsc_AWCACHE),
      .revArr_rsc_AWLOCK(revArr_rsc_AWLOCK),
      .revArr_rsc_AWBURST(revArr_rsc_AWBURST),
      .revArr_rsc_AWSIZE(revArr_rsc_AWSIZE),
      .revArr_rsc_AWLEN(revArr_rsc_AWLEN),
      .revArr_rsc_AWADDR(revArr_rsc_AWADDR),
      .revArr_rsc_AWID(revArr_rsc_AWID),
      .revArr_rsc_triosy_lz(revArr_rsc_triosy_lz),
      .tw_rsc_s_tdone(tw_rsc_s_tdone),
      .tw_rsc_tr_write_done(tw_rsc_tr_write_done),
      .tw_rsc_RREADY(tw_rsc_RREADY),
      .tw_rsc_RVALID(tw_rsc_RVALID),
      .tw_rsc_RUSER(tw_rsc_RUSER),
      .tw_rsc_RLAST(tw_rsc_RLAST),
      .tw_rsc_RRESP(tw_rsc_RRESP),
      .tw_rsc_RDATA(tw_rsc_RDATA),
      .tw_rsc_RID(tw_rsc_RID),
      .tw_rsc_ARREADY(tw_rsc_ARREADY),
      .tw_rsc_ARVALID(tw_rsc_ARVALID),
      .tw_rsc_ARUSER(tw_rsc_ARUSER),
      .tw_rsc_ARREGION(tw_rsc_ARREGION),
      .tw_rsc_ARQOS(tw_rsc_ARQOS),
      .tw_rsc_ARPROT(tw_rsc_ARPROT),
      .tw_rsc_ARCACHE(tw_rsc_ARCACHE),
      .tw_rsc_ARLOCK(tw_rsc_ARLOCK),
      .tw_rsc_ARBURST(tw_rsc_ARBURST),
      .tw_rsc_ARSIZE(tw_rsc_ARSIZE),
      .tw_rsc_ARLEN(tw_rsc_ARLEN),
      .tw_rsc_ARADDR(tw_rsc_ARADDR),
      .tw_rsc_ARID(tw_rsc_ARID),
      .tw_rsc_BREADY(tw_rsc_BREADY),
      .tw_rsc_BVALID(tw_rsc_BVALID),
      .tw_rsc_BUSER(tw_rsc_BUSER),
      .tw_rsc_BRESP(tw_rsc_BRESP),
      .tw_rsc_BID(tw_rsc_BID),
      .tw_rsc_WREADY(tw_rsc_WREADY),
      .tw_rsc_WVALID(tw_rsc_WVALID),
      .tw_rsc_WUSER(tw_rsc_WUSER),
      .tw_rsc_WLAST(tw_rsc_WLAST),
      .tw_rsc_WSTRB(tw_rsc_WSTRB),
      .tw_rsc_WDATA(tw_rsc_WDATA),
      .tw_rsc_AWREADY(tw_rsc_AWREADY),
      .tw_rsc_AWVALID(tw_rsc_AWVALID),
      .tw_rsc_AWUSER(tw_rsc_AWUSER),
      .tw_rsc_AWREGION(tw_rsc_AWREGION),
      .tw_rsc_AWQOS(tw_rsc_AWQOS),
      .tw_rsc_AWPROT(tw_rsc_AWPROT),
      .tw_rsc_AWCACHE(tw_rsc_AWCACHE),
      .tw_rsc_AWLOCK(tw_rsc_AWLOCK),
      .tw_rsc_AWBURST(tw_rsc_AWBURST),
      .tw_rsc_AWSIZE(tw_rsc_AWSIZE),
      .tw_rsc_AWLEN(tw_rsc_AWLEN),
      .tw_rsc_AWADDR(tw_rsc_AWADDR),
      .tw_rsc_AWID(tw_rsc_AWID),
      .tw_rsc_triosy_lz(tw_rsc_triosy_lz),
      .tw_h_rsc_s_tdone(tw_h_rsc_s_tdone),
      .tw_h_rsc_tr_write_done(tw_h_rsc_tr_write_done),
      .tw_h_rsc_RREADY(tw_h_rsc_RREADY),
      .tw_h_rsc_RVALID(tw_h_rsc_RVALID),
      .tw_h_rsc_RUSER(tw_h_rsc_RUSER),
      .tw_h_rsc_RLAST(tw_h_rsc_RLAST),
      .tw_h_rsc_RRESP(tw_h_rsc_RRESP),
      .tw_h_rsc_RDATA(tw_h_rsc_RDATA),
      .tw_h_rsc_RID(tw_h_rsc_RID),
      .tw_h_rsc_ARREADY(tw_h_rsc_ARREADY),
      .tw_h_rsc_ARVALID(tw_h_rsc_ARVALID),
      .tw_h_rsc_ARUSER(tw_h_rsc_ARUSER),
      .tw_h_rsc_ARREGION(tw_h_rsc_ARREGION),
      .tw_h_rsc_ARQOS(tw_h_rsc_ARQOS),
      .tw_h_rsc_ARPROT(tw_h_rsc_ARPROT),
      .tw_h_rsc_ARCACHE(tw_h_rsc_ARCACHE),
      .tw_h_rsc_ARLOCK(tw_h_rsc_ARLOCK),
      .tw_h_rsc_ARBURST(tw_h_rsc_ARBURST),
      .tw_h_rsc_ARSIZE(tw_h_rsc_ARSIZE),
      .tw_h_rsc_ARLEN(tw_h_rsc_ARLEN),
      .tw_h_rsc_ARADDR(tw_h_rsc_ARADDR),
      .tw_h_rsc_ARID(tw_h_rsc_ARID),
      .tw_h_rsc_BREADY(tw_h_rsc_BREADY),
      .tw_h_rsc_BVALID(tw_h_rsc_BVALID),
      .tw_h_rsc_BUSER(tw_h_rsc_BUSER),
      .tw_h_rsc_BRESP(tw_h_rsc_BRESP),
      .tw_h_rsc_BID(tw_h_rsc_BID),
      .tw_h_rsc_WREADY(tw_h_rsc_WREADY),
      .tw_h_rsc_WVALID(tw_h_rsc_WVALID),
      .tw_h_rsc_WUSER(tw_h_rsc_WUSER),
      .tw_h_rsc_WLAST(tw_h_rsc_WLAST),
      .tw_h_rsc_WSTRB(tw_h_rsc_WSTRB),
      .tw_h_rsc_WDATA(tw_h_rsc_WDATA),
      .tw_h_rsc_AWREADY(tw_h_rsc_AWREADY),
      .tw_h_rsc_AWVALID(tw_h_rsc_AWVALID),
      .tw_h_rsc_AWUSER(tw_h_rsc_AWUSER),
      .tw_h_rsc_AWREGION(tw_h_rsc_AWREGION),
      .tw_h_rsc_AWQOS(tw_h_rsc_AWQOS),
      .tw_h_rsc_AWPROT(tw_h_rsc_AWPROT),
      .tw_h_rsc_AWCACHE(tw_h_rsc_AWCACHE),
      .tw_h_rsc_AWLOCK(tw_h_rsc_AWLOCK),
      .tw_h_rsc_AWBURST(tw_h_rsc_AWBURST),
      .tw_h_rsc_AWSIZE(tw_h_rsc_AWSIZE),
      .tw_h_rsc_AWLEN(tw_h_rsc_AWLEN),
      .tw_h_rsc_AWADDR(tw_h_rsc_AWADDR),
      .tw_h_rsc_AWID(tw_h_rsc_AWID),
      .tw_h_rsc_triosy_lz(tw_h_rsc_triosy_lz),
      .xx_rsci_clken_d(xx_rsci_clken_d),
      .xx_rsci_d_d(xx_rsci_d_d),
      .xx_rsci_q_d(xx_rsci_q_d),
      .xx_rsci_radr_d(xx_rsci_radr_d),
      .xx_rsci_wadr_d(xx_rsci_wadr_d),
      .xx_rsci_readA_r_ram_ir_internal_RMASK_B_d(xx_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .yy_rsci_clken_d(yy_rsci_clken_d),
      .yy_rsci_d_d(yy_rsci_d_d),
      .yy_rsci_q_d(yy_rsci_q_d),
      .yy_rsci_radr_d(yy_rsci_radr_d),
      .yy_rsci_wadr_d(yy_rsci_wadr_d),
      .yy_rsci_readA_r_ram_ir_internal_RMASK_B_d(yy_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .S34_OUTER_LOOP_for_tf_mul_cmp_a(S34_OUTER_LOOP_for_tf_mul_cmp_a),
      .S34_OUTER_LOOP_for_tf_mul_cmp_b(S34_OUTER_LOOP_for_tf_mul_cmp_b),
      .S34_OUTER_LOOP_for_tf_mul_cmp_z(nl_hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z[9:0]),
      .xx_rsci_we_d_pff(xx_rsci_we_d_iff),
      .yy_rsci_we_d_pff(yy_rsci_we_d_iff)
    );

  function automatic [9:0] conv_u2u_15_10 ;
    input [14:0]  vector ;
  begin
    conv_u2u_15_10 = vector[9:0];
  end
  endfunction

endmodule



