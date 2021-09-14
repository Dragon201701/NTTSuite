
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
//  Generated date: Mon Sep 13 22:58:42 2021
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
  clk, rst, core_wen, fsm_output, S1_OUTER_LOOP_for_C_3_tr0, S1_OUTER_LOOP_C_0_tr0,
      S2_COPY_LOOP_for_C_2_tr0, S2_COPY_LOOP_C_0_tr0, S2_INNER_LOOP1_for_C_15_tr0,
      S2_INNER_LOOP1_C_0_tr0, S2_INNER_LOOP2_for_C_15_tr0, S2_INNER_LOOP2_C_0_tr0,
      S2_INNER_LOOP2_C_0_tr1, S2_INNER_LOOP3_for_C_15_tr0, S2_INNER_LOOP3_C_0_tr0,
      S34_OUTER_LOOP_for_C_5_tr0, S34_OUTER_LOOP_C_0_tr0, S5_COPY_LOOP_for_C_2_tr0,
      S5_COPY_LOOP_C_0_tr0, S5_INNER_LOOP1_for_C_15_tr0, S5_INNER_LOOP1_C_0_tr0,
      S5_INNER_LOOP2_for_C_15_tr0, S5_INNER_LOOP2_C_0_tr0, S5_INNER_LOOP2_C_0_tr1,
      S5_INNER_LOOP3_for_C_15_tr0, S5_INNER_LOOP3_C_0_tr0, S6_OUTER_LOOP_for_C_3_tr0,
      S6_OUTER_LOOP_C_0_tr0
);
  input clk;
  input rst;
  input core_wen;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input S1_OUTER_LOOP_for_C_3_tr0;
  input S1_OUTER_LOOP_C_0_tr0;
  input S2_COPY_LOOP_for_C_2_tr0;
  input S2_COPY_LOOP_C_0_tr0;
  input S2_INNER_LOOP1_for_C_15_tr0;
  input S2_INNER_LOOP1_C_0_tr0;
  input S2_INNER_LOOP2_for_C_15_tr0;
  input S2_INNER_LOOP2_C_0_tr0;
  input S2_INNER_LOOP2_C_0_tr1;
  input S2_INNER_LOOP3_for_C_15_tr0;
  input S2_INNER_LOOP3_C_0_tr0;
  input S34_OUTER_LOOP_for_C_5_tr0;
  input S34_OUTER_LOOP_C_0_tr0;
  input S5_COPY_LOOP_for_C_2_tr0;
  input S5_COPY_LOOP_C_0_tr0;
  input S5_INNER_LOOP1_for_C_15_tr0;
  input S5_INNER_LOOP1_C_0_tr0;
  input S5_INNER_LOOP2_for_C_15_tr0;
  input S5_INNER_LOOP2_C_0_tr0;
  input S5_INNER_LOOP2_C_0_tr1;
  input S5_INNER_LOOP3_for_C_15_tr0;
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
    S1_OUTER_LOOP_C_0 = 8'd5,
    S2_COPY_LOOP_for_C_0 = 8'd6,
    S2_COPY_LOOP_for_C_1 = 8'd7,
    S2_COPY_LOOP_for_C_2 = 8'd8,
    S2_COPY_LOOP_C_0 = 8'd9,
    S2_OUTER_LOOP_C_0 = 8'd10,
    S2_INNER_LOOP1_for_C_0 = 8'd11,
    S2_INNER_LOOP1_for_C_1 = 8'd12,
    S2_INNER_LOOP1_for_C_2 = 8'd13,
    S2_INNER_LOOP1_for_C_3 = 8'd14,
    S2_INNER_LOOP1_for_C_4 = 8'd15,
    S2_INNER_LOOP1_for_C_5 = 8'd16,
    S2_INNER_LOOP1_for_C_6 = 8'd17,
    S2_INNER_LOOP1_for_C_7 = 8'd18,
    S2_INNER_LOOP1_for_C_8 = 8'd19,
    S2_INNER_LOOP1_for_C_9 = 8'd20,
    S2_INNER_LOOP1_for_C_10 = 8'd21,
    S2_INNER_LOOP1_for_C_11 = 8'd22,
    S2_INNER_LOOP1_for_C_12 = 8'd23,
    S2_INNER_LOOP1_for_C_13 = 8'd24,
    S2_INNER_LOOP1_for_C_14 = 8'd25,
    S2_INNER_LOOP1_for_C_15 = 8'd26,
    S2_INNER_LOOP1_C_0 = 8'd27,
    S2_OUTER_LOOP_C_1 = 8'd28,
    S2_INNER_LOOP2_for_C_0 = 8'd29,
    S2_INNER_LOOP2_for_C_1 = 8'd30,
    S2_INNER_LOOP2_for_C_2 = 8'd31,
    S2_INNER_LOOP2_for_C_3 = 8'd32,
    S2_INNER_LOOP2_for_C_4 = 8'd33,
    S2_INNER_LOOP2_for_C_5 = 8'd34,
    S2_INNER_LOOP2_for_C_6 = 8'd35,
    S2_INNER_LOOP2_for_C_7 = 8'd36,
    S2_INNER_LOOP2_for_C_8 = 8'd37,
    S2_INNER_LOOP2_for_C_9 = 8'd38,
    S2_INNER_LOOP2_for_C_10 = 8'd39,
    S2_INNER_LOOP2_for_C_11 = 8'd40,
    S2_INNER_LOOP2_for_C_12 = 8'd41,
    S2_INNER_LOOP2_for_C_13 = 8'd42,
    S2_INNER_LOOP2_for_C_14 = 8'd43,
    S2_INNER_LOOP2_for_C_15 = 8'd44,
    S2_INNER_LOOP2_C_0 = 8'd45,
    S2_INNER_LOOP3_for_C_0 = 8'd46,
    S2_INNER_LOOP3_for_C_1 = 8'd47,
    S2_INNER_LOOP3_for_C_2 = 8'd48,
    S2_INNER_LOOP3_for_C_3 = 8'd49,
    S2_INNER_LOOP3_for_C_4 = 8'd50,
    S2_INNER_LOOP3_for_C_5 = 8'd51,
    S2_INNER_LOOP3_for_C_6 = 8'd52,
    S2_INNER_LOOP3_for_C_7 = 8'd53,
    S2_INNER_LOOP3_for_C_8 = 8'd54,
    S2_INNER_LOOP3_for_C_9 = 8'd55,
    S2_INNER_LOOP3_for_C_10 = 8'd56,
    S2_INNER_LOOP3_for_C_11 = 8'd57,
    S2_INNER_LOOP3_for_C_12 = 8'd58,
    S2_INNER_LOOP3_for_C_13 = 8'd59,
    S2_INNER_LOOP3_for_C_14 = 8'd60,
    S2_INNER_LOOP3_for_C_15 = 8'd61,
    S2_INNER_LOOP3_C_0 = 8'd62,
    S34_OUTER_LOOP_for_C_0 = 8'd63,
    S34_OUTER_LOOP_for_C_1 = 8'd64,
    S34_OUTER_LOOP_for_C_2 = 8'd65,
    S34_OUTER_LOOP_for_C_3 = 8'd66,
    S34_OUTER_LOOP_for_C_4 = 8'd67,
    S34_OUTER_LOOP_for_C_5 = 8'd68,
    S34_OUTER_LOOP_C_0 = 8'd69,
    S5_COPY_LOOP_for_C_0 = 8'd70,
    S5_COPY_LOOP_for_C_1 = 8'd71,
    S5_COPY_LOOP_for_C_2 = 8'd72,
    S5_COPY_LOOP_C_0 = 8'd73,
    S5_OUTER_LOOP_C_0 = 8'd74,
    S5_INNER_LOOP1_for_C_0 = 8'd75,
    S5_INNER_LOOP1_for_C_1 = 8'd76,
    S5_INNER_LOOP1_for_C_2 = 8'd77,
    S5_INNER_LOOP1_for_C_3 = 8'd78,
    S5_INNER_LOOP1_for_C_4 = 8'd79,
    S5_INNER_LOOP1_for_C_5 = 8'd80,
    S5_INNER_LOOP1_for_C_6 = 8'd81,
    S5_INNER_LOOP1_for_C_7 = 8'd82,
    S5_INNER_LOOP1_for_C_8 = 8'd83,
    S5_INNER_LOOP1_for_C_9 = 8'd84,
    S5_INNER_LOOP1_for_C_10 = 8'd85,
    S5_INNER_LOOP1_for_C_11 = 8'd86,
    S5_INNER_LOOP1_for_C_12 = 8'd87,
    S5_INNER_LOOP1_for_C_13 = 8'd88,
    S5_INNER_LOOP1_for_C_14 = 8'd89,
    S5_INNER_LOOP1_for_C_15 = 8'd90,
    S5_INNER_LOOP1_C_0 = 8'd91,
    S5_OUTER_LOOP_C_1 = 8'd92,
    S5_INNER_LOOP2_for_C_0 = 8'd93,
    S5_INNER_LOOP2_for_C_1 = 8'd94,
    S5_INNER_LOOP2_for_C_2 = 8'd95,
    S5_INNER_LOOP2_for_C_3 = 8'd96,
    S5_INNER_LOOP2_for_C_4 = 8'd97,
    S5_INNER_LOOP2_for_C_5 = 8'd98,
    S5_INNER_LOOP2_for_C_6 = 8'd99,
    S5_INNER_LOOP2_for_C_7 = 8'd100,
    S5_INNER_LOOP2_for_C_8 = 8'd101,
    S5_INNER_LOOP2_for_C_9 = 8'd102,
    S5_INNER_LOOP2_for_C_10 = 8'd103,
    S5_INNER_LOOP2_for_C_11 = 8'd104,
    S5_INNER_LOOP2_for_C_12 = 8'd105,
    S5_INNER_LOOP2_for_C_13 = 8'd106,
    S5_INNER_LOOP2_for_C_14 = 8'd107,
    S5_INNER_LOOP2_for_C_15 = 8'd108,
    S5_INNER_LOOP2_C_0 = 8'd109,
    S5_INNER_LOOP3_for_C_0 = 8'd110,
    S5_INNER_LOOP3_for_C_1 = 8'd111,
    S5_INNER_LOOP3_for_C_2 = 8'd112,
    S5_INNER_LOOP3_for_C_3 = 8'd113,
    S5_INNER_LOOP3_for_C_4 = 8'd114,
    S5_INNER_LOOP3_for_C_5 = 8'd115,
    S5_INNER_LOOP3_for_C_6 = 8'd116,
    S5_INNER_LOOP3_for_C_7 = 8'd117,
    S5_INNER_LOOP3_for_C_8 = 8'd118,
    S5_INNER_LOOP3_for_C_9 = 8'd119,
    S5_INNER_LOOP3_for_C_10 = 8'd120,
    S5_INNER_LOOP3_for_C_11 = 8'd121,
    S5_INNER_LOOP3_for_C_12 = 8'd122,
    S5_INNER_LOOP3_for_C_13 = 8'd123,
    S5_INNER_LOOP3_for_C_14 = 8'd124,
    S5_INNER_LOOP3_for_C_15 = 8'd125,
    S5_INNER_LOOP3_C_0 = 8'd126,
    S6_OUTER_LOOP_for_C_0 = 8'd127,
    S6_OUTER_LOOP_for_C_1 = 8'd128,
    S6_OUTER_LOOP_for_C_2 = 8'd129,
    S6_OUTER_LOOP_for_C_3 = 8'd130,
    S6_OUTER_LOOP_C_0 = 8'd131,
    main_C_1 = 8'd132;

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
        if ( S1_OUTER_LOOP_for_C_3_tr0 ) begin
          state_var_NS = S1_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S1_OUTER_LOOP_for_C_0;
        end
      end
      S1_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b00000101;
        if ( S1_OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = S2_COPY_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S1_OUTER_LOOP_for_C_0;
        end
      end
      S2_COPY_LOOP_for_C_0 : begin
        fsm_output = 8'b00000110;
        state_var_NS = S2_COPY_LOOP_for_C_1;
      end
      S2_COPY_LOOP_for_C_1 : begin
        fsm_output = 8'b00000111;
        state_var_NS = S2_COPY_LOOP_for_C_2;
      end
      S2_COPY_LOOP_for_C_2 : begin
        fsm_output = 8'b00001000;
        if ( S2_COPY_LOOP_for_C_2_tr0 ) begin
          state_var_NS = S2_COPY_LOOP_C_0;
        end
        else begin
          state_var_NS = S2_COPY_LOOP_for_C_0;
        end
      end
      S2_COPY_LOOP_C_0 : begin
        fsm_output = 8'b00001001;
        if ( S2_COPY_LOOP_C_0_tr0 ) begin
          state_var_NS = S2_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S2_COPY_LOOP_for_C_0;
        end
      end
      S2_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b00001010;
        state_var_NS = S2_INNER_LOOP1_for_C_0;
      end
      S2_INNER_LOOP1_for_C_0 : begin
        fsm_output = 8'b00001011;
        state_var_NS = S2_INNER_LOOP1_for_C_1;
      end
      S2_INNER_LOOP1_for_C_1 : begin
        fsm_output = 8'b00001100;
        state_var_NS = S2_INNER_LOOP1_for_C_2;
      end
      S2_INNER_LOOP1_for_C_2 : begin
        fsm_output = 8'b00001101;
        state_var_NS = S2_INNER_LOOP1_for_C_3;
      end
      S2_INNER_LOOP1_for_C_3 : begin
        fsm_output = 8'b00001110;
        state_var_NS = S2_INNER_LOOP1_for_C_4;
      end
      S2_INNER_LOOP1_for_C_4 : begin
        fsm_output = 8'b00001111;
        state_var_NS = S2_INNER_LOOP1_for_C_5;
      end
      S2_INNER_LOOP1_for_C_5 : begin
        fsm_output = 8'b00010000;
        state_var_NS = S2_INNER_LOOP1_for_C_6;
      end
      S2_INNER_LOOP1_for_C_6 : begin
        fsm_output = 8'b00010001;
        state_var_NS = S2_INNER_LOOP1_for_C_7;
      end
      S2_INNER_LOOP1_for_C_7 : begin
        fsm_output = 8'b00010010;
        state_var_NS = S2_INNER_LOOP1_for_C_8;
      end
      S2_INNER_LOOP1_for_C_8 : begin
        fsm_output = 8'b00010011;
        state_var_NS = S2_INNER_LOOP1_for_C_9;
      end
      S2_INNER_LOOP1_for_C_9 : begin
        fsm_output = 8'b00010100;
        state_var_NS = S2_INNER_LOOP1_for_C_10;
      end
      S2_INNER_LOOP1_for_C_10 : begin
        fsm_output = 8'b00010101;
        state_var_NS = S2_INNER_LOOP1_for_C_11;
      end
      S2_INNER_LOOP1_for_C_11 : begin
        fsm_output = 8'b00010110;
        state_var_NS = S2_INNER_LOOP1_for_C_12;
      end
      S2_INNER_LOOP1_for_C_12 : begin
        fsm_output = 8'b00010111;
        state_var_NS = S2_INNER_LOOP1_for_C_13;
      end
      S2_INNER_LOOP1_for_C_13 : begin
        fsm_output = 8'b00011000;
        state_var_NS = S2_INNER_LOOP1_for_C_14;
      end
      S2_INNER_LOOP1_for_C_14 : begin
        fsm_output = 8'b00011001;
        state_var_NS = S2_INNER_LOOP1_for_C_15;
      end
      S2_INNER_LOOP1_for_C_15 : begin
        fsm_output = 8'b00011010;
        if ( S2_INNER_LOOP1_for_C_15_tr0 ) begin
          state_var_NS = S2_INNER_LOOP1_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP1_for_C_0;
        end
      end
      S2_INNER_LOOP1_C_0 : begin
        fsm_output = 8'b00011011;
        if ( S2_INNER_LOOP1_C_0_tr0 ) begin
          state_var_NS = S2_OUTER_LOOP_C_1;
        end
        else begin
          state_var_NS = S2_INNER_LOOP1_for_C_0;
        end
      end
      S2_OUTER_LOOP_C_1 : begin
        fsm_output = 8'b00011100;
        state_var_NS = S2_INNER_LOOP2_for_C_0;
      end
      S2_INNER_LOOP2_for_C_0 : begin
        fsm_output = 8'b00011101;
        state_var_NS = S2_INNER_LOOP2_for_C_1;
      end
      S2_INNER_LOOP2_for_C_1 : begin
        fsm_output = 8'b00011110;
        state_var_NS = S2_INNER_LOOP2_for_C_2;
      end
      S2_INNER_LOOP2_for_C_2 : begin
        fsm_output = 8'b00011111;
        state_var_NS = S2_INNER_LOOP2_for_C_3;
      end
      S2_INNER_LOOP2_for_C_3 : begin
        fsm_output = 8'b00100000;
        state_var_NS = S2_INNER_LOOP2_for_C_4;
      end
      S2_INNER_LOOP2_for_C_4 : begin
        fsm_output = 8'b00100001;
        state_var_NS = S2_INNER_LOOP2_for_C_5;
      end
      S2_INNER_LOOP2_for_C_5 : begin
        fsm_output = 8'b00100010;
        state_var_NS = S2_INNER_LOOP2_for_C_6;
      end
      S2_INNER_LOOP2_for_C_6 : begin
        fsm_output = 8'b00100011;
        state_var_NS = S2_INNER_LOOP2_for_C_7;
      end
      S2_INNER_LOOP2_for_C_7 : begin
        fsm_output = 8'b00100100;
        state_var_NS = S2_INNER_LOOP2_for_C_8;
      end
      S2_INNER_LOOP2_for_C_8 : begin
        fsm_output = 8'b00100101;
        state_var_NS = S2_INNER_LOOP2_for_C_9;
      end
      S2_INNER_LOOP2_for_C_9 : begin
        fsm_output = 8'b00100110;
        state_var_NS = S2_INNER_LOOP2_for_C_10;
      end
      S2_INNER_LOOP2_for_C_10 : begin
        fsm_output = 8'b00100111;
        state_var_NS = S2_INNER_LOOP2_for_C_11;
      end
      S2_INNER_LOOP2_for_C_11 : begin
        fsm_output = 8'b00101000;
        state_var_NS = S2_INNER_LOOP2_for_C_12;
      end
      S2_INNER_LOOP2_for_C_12 : begin
        fsm_output = 8'b00101001;
        state_var_NS = S2_INNER_LOOP2_for_C_13;
      end
      S2_INNER_LOOP2_for_C_13 : begin
        fsm_output = 8'b00101010;
        state_var_NS = S2_INNER_LOOP2_for_C_14;
      end
      S2_INNER_LOOP2_for_C_14 : begin
        fsm_output = 8'b00101011;
        state_var_NS = S2_INNER_LOOP2_for_C_15;
      end
      S2_INNER_LOOP2_for_C_15 : begin
        fsm_output = 8'b00101100;
        if ( S2_INNER_LOOP2_for_C_15_tr0 ) begin
          state_var_NS = S2_INNER_LOOP2_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP2_for_C_0;
        end
      end
      S2_INNER_LOOP2_C_0 : begin
        fsm_output = 8'b00101101;
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
        fsm_output = 8'b00101110;
        state_var_NS = S2_INNER_LOOP3_for_C_1;
      end
      S2_INNER_LOOP3_for_C_1 : begin
        fsm_output = 8'b00101111;
        state_var_NS = S2_INNER_LOOP3_for_C_2;
      end
      S2_INNER_LOOP3_for_C_2 : begin
        fsm_output = 8'b00110000;
        state_var_NS = S2_INNER_LOOP3_for_C_3;
      end
      S2_INNER_LOOP3_for_C_3 : begin
        fsm_output = 8'b00110001;
        state_var_NS = S2_INNER_LOOP3_for_C_4;
      end
      S2_INNER_LOOP3_for_C_4 : begin
        fsm_output = 8'b00110010;
        state_var_NS = S2_INNER_LOOP3_for_C_5;
      end
      S2_INNER_LOOP3_for_C_5 : begin
        fsm_output = 8'b00110011;
        state_var_NS = S2_INNER_LOOP3_for_C_6;
      end
      S2_INNER_LOOP3_for_C_6 : begin
        fsm_output = 8'b00110100;
        state_var_NS = S2_INNER_LOOP3_for_C_7;
      end
      S2_INNER_LOOP3_for_C_7 : begin
        fsm_output = 8'b00110101;
        state_var_NS = S2_INNER_LOOP3_for_C_8;
      end
      S2_INNER_LOOP3_for_C_8 : begin
        fsm_output = 8'b00110110;
        state_var_NS = S2_INNER_LOOP3_for_C_9;
      end
      S2_INNER_LOOP3_for_C_9 : begin
        fsm_output = 8'b00110111;
        state_var_NS = S2_INNER_LOOP3_for_C_10;
      end
      S2_INNER_LOOP3_for_C_10 : begin
        fsm_output = 8'b00111000;
        state_var_NS = S2_INNER_LOOP3_for_C_11;
      end
      S2_INNER_LOOP3_for_C_11 : begin
        fsm_output = 8'b00111001;
        state_var_NS = S2_INNER_LOOP3_for_C_12;
      end
      S2_INNER_LOOP3_for_C_12 : begin
        fsm_output = 8'b00111010;
        state_var_NS = S2_INNER_LOOP3_for_C_13;
      end
      S2_INNER_LOOP3_for_C_13 : begin
        fsm_output = 8'b00111011;
        state_var_NS = S2_INNER_LOOP3_for_C_14;
      end
      S2_INNER_LOOP3_for_C_14 : begin
        fsm_output = 8'b00111100;
        state_var_NS = S2_INNER_LOOP3_for_C_15;
      end
      S2_INNER_LOOP3_for_C_15 : begin
        fsm_output = 8'b00111101;
        if ( S2_INNER_LOOP3_for_C_15_tr0 ) begin
          state_var_NS = S2_INNER_LOOP3_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP3_for_C_0;
        end
      end
      S2_INNER_LOOP3_C_0 : begin
        fsm_output = 8'b00111110;
        if ( S2_INNER_LOOP3_C_0_tr0 ) begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP3_for_C_0;
        end
      end
      S34_OUTER_LOOP_for_C_0 : begin
        fsm_output = 8'b00111111;
        state_var_NS = S34_OUTER_LOOP_for_C_1;
      end
      S34_OUTER_LOOP_for_C_1 : begin
        fsm_output = 8'b01000000;
        state_var_NS = S34_OUTER_LOOP_for_C_2;
      end
      S34_OUTER_LOOP_for_C_2 : begin
        fsm_output = 8'b01000001;
        state_var_NS = S34_OUTER_LOOP_for_C_3;
      end
      S34_OUTER_LOOP_for_C_3 : begin
        fsm_output = 8'b01000010;
        state_var_NS = S34_OUTER_LOOP_for_C_4;
      end
      S34_OUTER_LOOP_for_C_4 : begin
        fsm_output = 8'b01000011;
        state_var_NS = S34_OUTER_LOOP_for_C_5;
      end
      S34_OUTER_LOOP_for_C_5 : begin
        fsm_output = 8'b01000100;
        if ( S34_OUTER_LOOP_for_C_5_tr0 ) begin
          state_var_NS = S34_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
      end
      S34_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b01000101;
        if ( S34_OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
      end
      S5_COPY_LOOP_for_C_0 : begin
        fsm_output = 8'b01000110;
        state_var_NS = S5_COPY_LOOP_for_C_1;
      end
      S5_COPY_LOOP_for_C_1 : begin
        fsm_output = 8'b01000111;
        state_var_NS = S5_COPY_LOOP_for_C_2;
      end
      S5_COPY_LOOP_for_C_2 : begin
        fsm_output = 8'b01001000;
        if ( S5_COPY_LOOP_for_C_2_tr0 ) begin
          state_var_NS = S5_COPY_LOOP_C_0;
        end
        else begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
      end
      S5_COPY_LOOP_C_0 : begin
        fsm_output = 8'b01001001;
        if ( S5_COPY_LOOP_C_0_tr0 ) begin
          state_var_NS = S5_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
      end
      S5_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b01001010;
        state_var_NS = S5_INNER_LOOP1_for_C_0;
      end
      S5_INNER_LOOP1_for_C_0 : begin
        fsm_output = 8'b01001011;
        state_var_NS = S5_INNER_LOOP1_for_C_1;
      end
      S5_INNER_LOOP1_for_C_1 : begin
        fsm_output = 8'b01001100;
        state_var_NS = S5_INNER_LOOP1_for_C_2;
      end
      S5_INNER_LOOP1_for_C_2 : begin
        fsm_output = 8'b01001101;
        state_var_NS = S5_INNER_LOOP1_for_C_3;
      end
      S5_INNER_LOOP1_for_C_3 : begin
        fsm_output = 8'b01001110;
        state_var_NS = S5_INNER_LOOP1_for_C_4;
      end
      S5_INNER_LOOP1_for_C_4 : begin
        fsm_output = 8'b01001111;
        state_var_NS = S5_INNER_LOOP1_for_C_5;
      end
      S5_INNER_LOOP1_for_C_5 : begin
        fsm_output = 8'b01010000;
        state_var_NS = S5_INNER_LOOP1_for_C_6;
      end
      S5_INNER_LOOP1_for_C_6 : begin
        fsm_output = 8'b01010001;
        state_var_NS = S5_INNER_LOOP1_for_C_7;
      end
      S5_INNER_LOOP1_for_C_7 : begin
        fsm_output = 8'b01010010;
        state_var_NS = S5_INNER_LOOP1_for_C_8;
      end
      S5_INNER_LOOP1_for_C_8 : begin
        fsm_output = 8'b01010011;
        state_var_NS = S5_INNER_LOOP1_for_C_9;
      end
      S5_INNER_LOOP1_for_C_9 : begin
        fsm_output = 8'b01010100;
        state_var_NS = S5_INNER_LOOP1_for_C_10;
      end
      S5_INNER_LOOP1_for_C_10 : begin
        fsm_output = 8'b01010101;
        state_var_NS = S5_INNER_LOOP1_for_C_11;
      end
      S5_INNER_LOOP1_for_C_11 : begin
        fsm_output = 8'b01010110;
        state_var_NS = S5_INNER_LOOP1_for_C_12;
      end
      S5_INNER_LOOP1_for_C_12 : begin
        fsm_output = 8'b01010111;
        state_var_NS = S5_INNER_LOOP1_for_C_13;
      end
      S5_INNER_LOOP1_for_C_13 : begin
        fsm_output = 8'b01011000;
        state_var_NS = S5_INNER_LOOP1_for_C_14;
      end
      S5_INNER_LOOP1_for_C_14 : begin
        fsm_output = 8'b01011001;
        state_var_NS = S5_INNER_LOOP1_for_C_15;
      end
      S5_INNER_LOOP1_for_C_15 : begin
        fsm_output = 8'b01011010;
        if ( S5_INNER_LOOP1_for_C_15_tr0 ) begin
          state_var_NS = S5_INNER_LOOP1_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP1_for_C_0;
        end
      end
      S5_INNER_LOOP1_C_0 : begin
        fsm_output = 8'b01011011;
        if ( S5_INNER_LOOP1_C_0_tr0 ) begin
          state_var_NS = S5_OUTER_LOOP_C_1;
        end
        else begin
          state_var_NS = S5_INNER_LOOP1_for_C_0;
        end
      end
      S5_OUTER_LOOP_C_1 : begin
        fsm_output = 8'b01011100;
        state_var_NS = S5_INNER_LOOP2_for_C_0;
      end
      S5_INNER_LOOP2_for_C_0 : begin
        fsm_output = 8'b01011101;
        state_var_NS = S5_INNER_LOOP2_for_C_1;
      end
      S5_INNER_LOOP2_for_C_1 : begin
        fsm_output = 8'b01011110;
        state_var_NS = S5_INNER_LOOP2_for_C_2;
      end
      S5_INNER_LOOP2_for_C_2 : begin
        fsm_output = 8'b01011111;
        state_var_NS = S5_INNER_LOOP2_for_C_3;
      end
      S5_INNER_LOOP2_for_C_3 : begin
        fsm_output = 8'b01100000;
        state_var_NS = S5_INNER_LOOP2_for_C_4;
      end
      S5_INNER_LOOP2_for_C_4 : begin
        fsm_output = 8'b01100001;
        state_var_NS = S5_INNER_LOOP2_for_C_5;
      end
      S5_INNER_LOOP2_for_C_5 : begin
        fsm_output = 8'b01100010;
        state_var_NS = S5_INNER_LOOP2_for_C_6;
      end
      S5_INNER_LOOP2_for_C_6 : begin
        fsm_output = 8'b01100011;
        state_var_NS = S5_INNER_LOOP2_for_C_7;
      end
      S5_INNER_LOOP2_for_C_7 : begin
        fsm_output = 8'b01100100;
        state_var_NS = S5_INNER_LOOP2_for_C_8;
      end
      S5_INNER_LOOP2_for_C_8 : begin
        fsm_output = 8'b01100101;
        state_var_NS = S5_INNER_LOOP2_for_C_9;
      end
      S5_INNER_LOOP2_for_C_9 : begin
        fsm_output = 8'b01100110;
        state_var_NS = S5_INNER_LOOP2_for_C_10;
      end
      S5_INNER_LOOP2_for_C_10 : begin
        fsm_output = 8'b01100111;
        state_var_NS = S5_INNER_LOOP2_for_C_11;
      end
      S5_INNER_LOOP2_for_C_11 : begin
        fsm_output = 8'b01101000;
        state_var_NS = S5_INNER_LOOP2_for_C_12;
      end
      S5_INNER_LOOP2_for_C_12 : begin
        fsm_output = 8'b01101001;
        state_var_NS = S5_INNER_LOOP2_for_C_13;
      end
      S5_INNER_LOOP2_for_C_13 : begin
        fsm_output = 8'b01101010;
        state_var_NS = S5_INNER_LOOP2_for_C_14;
      end
      S5_INNER_LOOP2_for_C_14 : begin
        fsm_output = 8'b01101011;
        state_var_NS = S5_INNER_LOOP2_for_C_15;
      end
      S5_INNER_LOOP2_for_C_15 : begin
        fsm_output = 8'b01101100;
        if ( S5_INNER_LOOP2_for_C_15_tr0 ) begin
          state_var_NS = S5_INNER_LOOP2_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP2_for_C_0;
        end
      end
      S5_INNER_LOOP2_C_0 : begin
        fsm_output = 8'b01101101;
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
        fsm_output = 8'b01101110;
        state_var_NS = S5_INNER_LOOP3_for_C_1;
      end
      S5_INNER_LOOP3_for_C_1 : begin
        fsm_output = 8'b01101111;
        state_var_NS = S5_INNER_LOOP3_for_C_2;
      end
      S5_INNER_LOOP3_for_C_2 : begin
        fsm_output = 8'b01110000;
        state_var_NS = S5_INNER_LOOP3_for_C_3;
      end
      S5_INNER_LOOP3_for_C_3 : begin
        fsm_output = 8'b01110001;
        state_var_NS = S5_INNER_LOOP3_for_C_4;
      end
      S5_INNER_LOOP3_for_C_4 : begin
        fsm_output = 8'b01110010;
        state_var_NS = S5_INNER_LOOP3_for_C_5;
      end
      S5_INNER_LOOP3_for_C_5 : begin
        fsm_output = 8'b01110011;
        state_var_NS = S5_INNER_LOOP3_for_C_6;
      end
      S5_INNER_LOOP3_for_C_6 : begin
        fsm_output = 8'b01110100;
        state_var_NS = S5_INNER_LOOP3_for_C_7;
      end
      S5_INNER_LOOP3_for_C_7 : begin
        fsm_output = 8'b01110101;
        state_var_NS = S5_INNER_LOOP3_for_C_8;
      end
      S5_INNER_LOOP3_for_C_8 : begin
        fsm_output = 8'b01110110;
        state_var_NS = S5_INNER_LOOP3_for_C_9;
      end
      S5_INNER_LOOP3_for_C_9 : begin
        fsm_output = 8'b01110111;
        state_var_NS = S5_INNER_LOOP3_for_C_10;
      end
      S5_INNER_LOOP3_for_C_10 : begin
        fsm_output = 8'b01111000;
        state_var_NS = S5_INNER_LOOP3_for_C_11;
      end
      S5_INNER_LOOP3_for_C_11 : begin
        fsm_output = 8'b01111001;
        state_var_NS = S5_INNER_LOOP3_for_C_12;
      end
      S5_INNER_LOOP3_for_C_12 : begin
        fsm_output = 8'b01111010;
        state_var_NS = S5_INNER_LOOP3_for_C_13;
      end
      S5_INNER_LOOP3_for_C_13 : begin
        fsm_output = 8'b01111011;
        state_var_NS = S5_INNER_LOOP3_for_C_14;
      end
      S5_INNER_LOOP3_for_C_14 : begin
        fsm_output = 8'b01111100;
        state_var_NS = S5_INNER_LOOP3_for_C_15;
      end
      S5_INNER_LOOP3_for_C_15 : begin
        fsm_output = 8'b01111101;
        if ( S5_INNER_LOOP3_for_C_15_tr0 ) begin
          state_var_NS = S5_INNER_LOOP3_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP3_for_C_0;
        end
      end
      S5_INNER_LOOP3_C_0 : begin
        fsm_output = 8'b01111110;
        if ( S5_INNER_LOOP3_C_0_tr0 ) begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP3_for_C_0;
        end
      end
      S6_OUTER_LOOP_for_C_0 : begin
        fsm_output = 8'b01111111;
        state_var_NS = S6_OUTER_LOOP_for_C_1;
      end
      S6_OUTER_LOOP_for_C_1 : begin
        fsm_output = 8'b10000000;
        state_var_NS = S6_OUTER_LOOP_for_C_2;
      end
      S6_OUTER_LOOP_for_C_2 : begin
        fsm_output = 8'b10000001;
        state_var_NS = S6_OUTER_LOOP_for_C_3;
      end
      S6_OUTER_LOOP_for_C_3 : begin
        fsm_output = 8'b10000010;
        if ( S6_OUTER_LOOP_for_C_3_tr0 ) begin
          state_var_NS = S6_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
      end
      S6_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b10000011;
        if ( S6_OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b10000100;
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
  xx_rsc_cgo_iro, xx_rsci_clken_d, yy_rsc_cgo_iro, yy_rsci_clken_d, core_wen, xx_rsc_cgo,
      yy_rsc_cgo
);
  input xx_rsc_cgo_iro;
  output xx_rsci_clken_d;
  input yy_rsc_cgo_iro;
  output yy_rsci_clken_d;
  input core_wen;
  input xx_rsc_cgo;
  input yy_rsc_cgo;



  // Interconnect Declarations for Component Instantiations 
  assign xx_rsci_clken_d = core_wen & (xx_rsc_cgo | xx_rsc_cgo_iro);
  assign yy_rsci_clken_d = core_wen & (yy_rsc_cgo | yy_rsc_cgo_iro);
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
  reg [4:0] x_rsci_s_raddr_core_9_5;
  reg [4:0] x_rsci_s_raddr_core_4_0;
  reg [4:0] x_rsci_s_waddr_core_9_5;
  reg [4:0] x_rsci_s_waddr_core_4_0;
  wire [7:0] fsm_output;
  wire and_dcpl_1;
  wire or_tmp_10;
  wire mux_tmp_20;
  wire and_dcpl_23;
  wire not_tmp_30;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_36;
  wire and_dcpl_38;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_43;
  wire mux_tmp_31;
  wire or_tmp_29;
  wire or_tmp_30;
  wire or_tmp_31;
  wire or_tmp_32;
  wire or_dcpl_9;
  wire or_tmp_36;
  wire mux_tmp_39;
  wire or_tmp_37;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire and_dcpl_56;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire and_dcpl_63;
  wire and_dcpl_64;
  wire and_dcpl_65;
  wire and_dcpl_66;
  wire and_dcpl_68;
  wire or_tmp_40;
  wire or_tmp_42;
  wire and_dcpl_70;
  wire not_tmp_38;
  wire and_dcpl_71;
  wire or_tmp_46;
  wire or_tmp_51;
  wire mux_tmp_48;
  wire and_dcpl_82;
  wire and_dcpl_83;
  wire and_dcpl_84;
  wire and_dcpl_85;
  wire mux_tmp_52;
  wire nor_tmp_10;
  wire and_dcpl_86;
  wire and_dcpl_88;
  wire and_dcpl_90;
  wire and_dcpl_91;
  wire or_tmp_61;
  wire not_tmp_60;
  wire or_tmp_71;
  wire and_dcpl_105;
  wire and_dcpl_113;
  wire and_dcpl_114;
  wire and_dcpl_115;
  wire and_dcpl_122;
  wire and_dcpl_123;
  wire and_dcpl_124;
  wire and_dcpl_131;
  wire and_dcpl_132;
  wire and_dcpl_144;
  wire or_tmp_79;
  wire and_dcpl_145;
  wire or_tmp_81;
  wire or_tmp_82;
  wire or_tmp_84;
  wire or_tmp_86;
  wire mux_tmp_89;
  wire and_dcpl_147;
  wire and_dcpl_148;
  wire and_dcpl_149;
  wire or_tmp_92;
  wire or_tmp_93;
  wire or_tmp_95;
  wire or_tmp_96;
  wire or_tmp_98;
  wire and_dcpl_153;
  wire and_dcpl_154;
  wire and_dcpl_156;
  wire and_dcpl_157;
  wire or_tmp_102;
  wire or_tmp_103;
  wire or_tmp_105;
  wire mux_tmp_98;
  wire and_dcpl_161;
  wire and_dcpl_162;
  wire and_dcpl_163;
  wire mux_tmp_102;
  wire or_tmp_112;
  wire or_tmp_114;
  wire mux_tmp_105;
  wire and_dcpl_168;
  wire or_tmp_121;
  wire or_tmp_122;
  wire and_dcpl_171;
  wire and_dcpl_172;
  wire mux_tmp_110;
  wire mux_tmp_111;
  wire nor_tmp_21;
  wire or_tmp_133;
  wire or_tmp_134;
  wire or_tmp_135;
  wire or_tmp_137;
  wire mux_tmp_132;
  wire or_tmp_139;
  wire mux_tmp_137;
  wire mux_tmp_140;
  wire and_dcpl_177;
  wire and_dcpl_181;
  wire and_dcpl_182;
  wire and_dcpl_190;
  wire nor_tmp_28;
  wire or_tmp_147;
  wire and_dcpl_198;
  wire and_dcpl_209;
  wire and_dcpl_212;
  wire and_dcpl_226;
  wire or_tmp_158;
  wire and_dcpl_228;
  wire and_dcpl_229;
  wire and_dcpl_230;
  wire and_dcpl_232;
  wire and_dcpl_233;
  wire or_tmp_163;
  wire or_tmp_165;
  wire mux_tmp_177;
  wire mux_tmp_181;
  wire or_tmp_175;
  wire nand_tmp_8;
  wire or_tmp_179;
  wire or_tmp_181;
  wire mux_tmp_192;
  wire or_tmp_182;
  wire mux_tmp_195;
  wire nor_tmp_34;
  wire mux_tmp_216;
  wire mux_tmp_232;
  wire and_dcpl_256;
  wire and_dcpl_257;
  wire or_tmp_221;
  wire and_dcpl_262;
  wire and_dcpl_264;
  wire and_dcpl_265;
  wire or_tmp_224;
  wire mux_tmp_263;
  wire not_tmp_174;
  wire or_tmp_247;
  wire or_tmp_250;
  wire and_dcpl_301;
  wire and_dcpl_308;
  wire and_dcpl_339;
  wire and_dcpl_346;
  wire and_dcpl_358;
  wire and_dcpl_363;
  wire and_dcpl_367;
  wire and_dcpl_371;
  wire and_dcpl_374;
  wire mux_tmp_326;
  wire mux_tmp_327;
  wire or_tmp_285;
  wire or_tmp_289;
  wire or_tmp_297;
  wire or_tmp_303;
  reg S2_OUTER_LOOP_c_1_sva;
  reg [31:0] m_sva;
  reg [4:0] S1_OUTER_LOOP_for_acc_cse_sva;
  wire modulo_sub_10_and_ssc;
  reg reg_modulo_sub_10_mux_ftd;
  reg [30:0] reg_modulo_sub_10_mux_ftd_1;
  wire nor_118_cse;
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
  wire and_598_cse;
  wire or_287_cse;
  wire or_15_cse;
  wire and_581_cse;
  wire or_6_cse;
  wire and_558_cse;
  wire mux_151_cse;
  wire or_196_cse;
  wire nor_85_cse;
  wire or_300_cse;
  wire or_68_cse;
  wire and_20_cse;
  wire mux_76_cse;
  wire nand_64_cse;
  wire mux_72_rmff;
  wire nor_143_rmff;
  wire yy_rsci_wadr_d_mx0c4;
  wire yy_rsci_wadr_d_mx0c5;
  wire yy_rsci_wadr_d_mx0c6;
  wire yy_rsci_wadr_d_mx0c7;
  wire yy_rsci_wadr_d_mx0c8;
  wire yy_rsci_wadr_d_mx0c9;
  wire yy_rsci_wadr_d_mx0c1;
  reg [1:0] S2_INNER_LOOP1_r_4_2_sva_1_0;
  wire yy_rsci_radr_d_mx0c0;
  wire yy_rsci_radr_d_mx0c1;
  wire yy_rsci_radr_d_mx0c3;
  wire xx_rsci_wadr_d_mx0c3;
  wire xx_rsci_wadr_d_mx0c4;
  wire xx_rsci_wadr_d_mx0c5;
  wire xx_rsci_wadr_d_mx0c6;
  wire xx_rsci_wadr_d_mx0c7;
  wire xx_rsci_wadr_d_mx0c8;
  wire xx_rsci_wadr_d_mx0c10;
  wire xx_rsci_radr_d_mx0c0;
  wire xx_rsci_radr_d_mx0c10;
  wire xx_rsci_radr_d_mx0c2;
  wire xx_rsci_radr_d_mx0c5;
  wire xx_rsci_radr_d_mx0c6;
  wire xx_rsci_radr_d_mx0c7;
  wire xx_rsci_radr_d_mx0c8;
  reg [31:0] butterFly_12_tw_asn_itm;
  wire mux_93_itm;
  wire mux_95_itm;
  wire mux_109_itm;
  wire and_dcpl_560;
  wire and_dcpl_564;
  wire and_dcpl_565;
  wire and_dcpl_568;
  wire [31:0] z_out;
  wire signed [52:0] nl_z_out;
  wire and_dcpl_570;
  wire and_dcpl_571;
  wire and_dcpl_576;
  wire and_dcpl_581;
  wire and_dcpl_582;
  wire and_dcpl_587;
  wire and_dcpl_588;
  wire and_dcpl_591;
  wire and_dcpl_598;
  wire and_dcpl_603;
  wire and_dcpl_604;
  wire and_dcpl_607;
  wire and_dcpl_610;
  wire and_dcpl_612;
  wire and_dcpl_613;
  wire and_dcpl_615;
  wire and_dcpl_618;
  wire and_dcpl_621;
  wire or_tmp_361;
  wire and_dcpl_622;
  wire and_dcpl_624;
  wire and_dcpl_626;
  wire and_dcpl_628;
  wire and_dcpl_630;
  wire and_dcpl_632;
  wire and_dcpl_634;
  wire and_dcpl_635;
  wire and_dcpl_639;
  wire [51:0] z_out_1;
  wire [63:0] nl_z_out_1;
  wire [3:0] z_out_2;
  wire and_dcpl_654;
  wire and_dcpl_660;
  wire and_dcpl_662;
  wire [5:0] z_out_3;
  wire [6:0] nl_z_out_3;
  wire and_dcpl_666;
  wire [19:0] z_out_4;
  wire [20:0] nl_z_out_4;
  wire [31:0] z_out_5;
  wire [31:0] z_out_6;
  wire and_dcpl_762;
  wire and_dcpl_765;
  wire and_dcpl_780;
  wire and_dcpl_786;
  wire and_dcpl_807;
  wire [31:0] z_out_7;
  wire [32:0] nl_z_out_7;
  wire [31:0] z_out_8;
  wire and_dcpl_887;
  wire and_dcpl_901;
  wire and_dcpl_902;
  wire [31:0] z_out_9;
  wire [31:0] z_out_10;
  wire [32:0] nl_z_out_10;
  reg [19:0] S1_OUTER_LOOP_for_p_sva_1;
  reg [31:0] mult_x_2_sva;
  reg [31:0] butterFly_10_f1_sva;
  reg [31:0] mult_x_10_sva;
  reg [19:0] S34_OUTER_LOOP_for_tf_sva;
  reg [19:0] S34_OUTER_LOOP_for_tf_h_sva;
  reg [31:0] butterFly_13_f1_sva;
  reg [31:0] butterFly_14_f1_sva;
  reg [31:0] mult_x_16_sva;
  reg [31:0] mult_10_z_mul_itm;
  reg [31:0] butterFly_10_tw_h_asn_itm;
  reg [31:0] operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm;
  reg [31:0] butterFly_13_tw_asn_itm;
  reg [31:0] mult_15_z_mul_itm;
  reg [31:0] butterFly_13_tw_h_asn_itm;
  reg [31:0] mult_16_z_mul_itm;
  reg [31:0] butterFly_14_tw_h_asn_itm;
  wire butterFly_4_tw_and_cse_2_sva_mx0w2;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c0;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c1;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c2;
  wire S2_OUTER_LOOP_c_1_sva_mx0c1;
  wire S2_OUTER_LOOP_c_1_sva_mx0c2;
  wire S2_OUTER_LOOP_c_1_sva_mx0c3;
  wire S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1;
  wire S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2;
  wire [1:0] butterFly_tw_and_cse_3_2_sva_1;
  wire mult_x_16_sva_mx0c1;
  wire butterFly_12_tw_asn_itm_mx0c0;
  wire butterFly_12_tw_asn_itm_mx0c1;
  wire butterFly_12_tw_asn_itm_mx0c2;
  wire butterFly_12_tw_asn_itm_mx0c3;
  wire butterFly_12_tw_asn_itm_mx0c4;
  wire butterFly_12_tw_asn_itm_mx0c5;
  wire butterFly_12_tw_asn_itm_mx0c6;
  wire butterFly_12_tw_asn_itm_mx0c7;
  wire butterFly_12_tw_asn_itm_mx0c8;
  wire butterFly_12_tw_asn_itm_mx0c9;
  wire butterFly_12_tw_asn_itm_mx0c10;
  wire butterFly_12_tw_asn_itm_mx0c11;
  wire butterFly_12_tw_asn_itm_mx0c12;
  wire butterFly_12_tw_asn_itm_mx0c13;
  wire butterFly_12_tw_asn_itm_mx0c14;
  wire butterFly_12_tw_asn_itm_mx0c15;
  wire butterFly_12_tw_asn_itm_mx0c16;
  wire butterFly_12_tw_asn_itm_mx0c17;
  wire butterFly_12_tw_asn_itm_mx0c18;
  wire butterFly_12_tw_asn_itm_mx0c19;
  wire butterFly_12_tw_asn_itm_mx0c20;
  wire butterFly_12_tw_asn_itm_mx0c21;
  wire butterFly_12_tw_asn_itm_mx0c22;
  wire butterFly_12_tw_asn_itm_mx0c23;
  wire butterFly_12_tw_asn_itm_mx0c24;
  wire butterFly_13_tw_asn_itm_mx0c1;
  wire butterFly_13_tw_asn_itm_mx0c2;
  wire butterFly_13_tw_asn_itm_mx0c3;
  wire butterFly_13_tw_asn_itm_mx0c4;
  wire butterFly_13_tw_asn_itm_mx0c5;
  wire butterFly_10_f1_sva_mx0c1;
  wire butterFly_13_f1_sva_mx0c0;
  wire butterFly_13_f1_sva_mx0c1;
  wire mult_x_2_sva_mx0c1;
  wire modulo_sub_10_mux_itm_mx0c1;
  wire modulo_sub_10_mux_itm_mx0c3;
  wire modulo_sub_10_mux_itm_mx0c5;
  wire modulo_sub_10_mux_itm_mx0c7;
  wire modulo_sub_10_mux_itm_mx0c9;
  wire modulo_sub_10_mux_itm_mx0c11;
  wire modulo_sub_10_mux_itm_mx0c13;
  wire modulo_sub_10_mux_itm_mx0c15;
  wire modulo_sub_10_mux_itm_mx0c17;
  wire modulo_sub_10_mux_itm_mx0c19;
  wire modulo_sub_10_mux_itm_mx0c21;
  wire modulo_sub_10_mux_itm_mx0c23;
  wire modulo_sub_10_mux_itm_mx0c25;
  wire modulo_sub_10_mux_itm_mx0c27;
  wire modulo_sub_10_mux_itm_mx0c29;
  wire modulo_sub_10_mux_itm_mx0c31;
  wire modulo_sub_10_mux_itm_mx0c33;
  wire modulo_sub_10_mux_itm_mx0c35;
  wire modulo_sub_10_mux_itm_mx0c37;
  wire modulo_sub_10_mux_itm_mx0c39;
  wire modulo_sub_10_mux_itm_mx0c41;
  wire modulo_sub_10_mux_itm_mx0c43;
  wire modulo_sub_10_mux_itm_mx0c45;
  wire modulo_sub_10_mux_itm_mx0c47;
  wire mult_x_10_sva_mx0c1;
  wire and_699_ssc;
  wire [31:0] mult_3_res_mux_cse;
  wire nand_45_cse;
  wire nand_44_cse;
  wire nor_232_cse;
  wire nand_69_cse;
  wire nor_261_cse;
  wire and_793_cse;
  wire mux_86_cse;
  wire and_363_cse;
  wire mux_170_cse;
  wire and_373_cse;
  wire mux_388_cse;
  wire mux_243_cse;
  wire mux_433_cse;
  wire or_131_cse;
  wire [5:0] S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt;
  wire [1:0] butterFly_tw_butterFly_tw_mux_rgt;
  reg S2_COPY_LOOP_for_i_5_0_sva_1_5;
  reg [4:0] S2_COPY_LOOP_for_i_5_0_sva_1_4_0;
  reg butterFly_12_tw_and_cse_3_2_sva_1;
  reg butterFly_12_tw_and_cse_3_2_sva_0;
  reg reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg;
  reg reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg;
  reg [2:0] reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg;
  wire and_252_ssc;
  wire S2_COPY_LOOP_p_nand_seb;
  wire nand_48_cse;
  wire or_29_cse;
  wire nor_110_cse;
  wire and_571_cse_1;
  wire and_1160_cse;
  wire mux_242_itm;
  wire z_out_11_32;
  wire z_out_12_32;
  wire mux_231_cse;
  wire [31:0] butterFly_3_mux1h_4_cse;

  wire[0:0] mux_17_nl;
  wire[0:0] and_600_nl;
  wire[0:0] mux_37_nl;
  wire[0:0] mux_36_nl;
  wire[0:0] mux_35_nl;
  wire[0:0] nand_1_nl;
  wire[0:0] mux_34_nl;
  wire[0:0] mux_33_nl;
  wire[0:0] mux_32_nl;
  wire[0:0] nand_nl;
  wire[0:0] mux_42_nl;
  wire[0:0] mux_41_nl;
  wire[0:0] or_48_nl;
  wire[0:0] nand_2_nl;
  wire[0:0] mux_40_nl;
  wire[0:0] butterFly_tw_h_or_2_nl;
  wire[0:0] mux_44_nl;
  wire[0:0] mux_43_nl;
  wire[0:0] nand_50_nl;
  wire[0:0] and_54_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] or_59_nl;
  wire[0:0] mux_46_nl;
  wire[0:0] nor_154_nl;
  wire[0:0] mux_50_nl;
  wire[0:0] mux_71_nl;
  wire[0:0] mux_70_nl;
  wire[0:0] mux_69_nl;
  wire[0:0] mux_68_nl;
  wire[0:0] mux_67_nl;
  wire[0:0] or_73_nl;
  wire[0:0] mux_66_nl;
  wire[0:0] nor_12_nl;
  wire[0:0] mux_65_nl;
  wire[0:0] mux_64_nl;
  wire[0:0] nand_49_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] mux_62_nl;
  wire[0:0] mux_61_nl;
  wire[0:0] mux_60_nl;
  wire[0:0] mux_59_nl;
  wire[0:0] or_71_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] mux_57_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] mux_55_nl;
  wire[0:0] or_70_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] and_590_nl;
  wire[0:0] mux_53_nl;
  wire[0:0] nand_65_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] nor_107_nl;
  wire[0:0] mux_74_nl;
  wire[0:0] or_395_nl;
  wire[0:0] or_396_nl;
  wire[0:0] mux_73_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] mux_155_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] mux_147_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] mux_142_nl;
  wire[0:0] mux_141_nl;
  wire[0:0] mux_139_nl;
  wire[0:0] mux_138_nl;
  wire[0:0] mux_136_nl;
  wire[0:0] mux_135_nl;
  wire[0:0] mux_134_nl;
  wire[0:0] mux_133_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] mux_8_nl;
  wire[0:0] mux_7_nl;
  wire[0:0] mux_6_nl;
  wire[0:0] nor_317_nl;
  wire[0:0] mux_5_nl;
  wire[0:0] mux_218_nl;
  wire[0:0] nor_132_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] nor_133_nl;
  wire[0:0] mux_485_nl;
  wire[0:0] mux_484_nl;
  wire[0:0] mux_483_nl;
  wire[0:0] mux_482_nl;
  wire[0:0] mux_481_nl;
  wire[0:0] or_549_nl;
  wire[0:0] or_547_nl;
  wire[0:0] mux_480_nl;
  wire[0:0] nor_309_nl;
  wire[0:0] mux_nl;
  wire[0:0] or_545_nl;
  wire[0:0] or_544_nl;
  wire[0:0] S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] mux_491_nl;
  wire[0:0] mux_490_nl;
  wire[0:0] mux_489_nl;
  wire[0:0] mux_488_nl;
  wire[0:0] nor_310_nl;
  wire[0:0] mux_487_nl;
  wire[0:0] nor_311_nl;
  wire[0:0] mux_486_nl;
  wire[0:0] nor_312_nl;
  wire[0:0] nor_313_nl;
  wire[2:0] S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl;
  wire[0:0] S2_COPY_LOOP_p_or_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] mux_10_nl;
  wire[0:0] or_16_nl;
  wire[0:0] mux_498_nl;
  wire[0:0] nor_314_nl;
  wire[0:0] mux_497_nl;
  wire[0:0] mux_496_nl;
  wire[0:0] mux_495_nl;
  wire[0:0] or_563_nl;
  wire[0:0] or_562_nl;
  wire[0:0] or_561_nl;
  wire[0:0] mux_494_nl;
  wire[0:0] or_559_nl;
  wire[0:0] mux_493_nl;
  wire[0:0] nor_315_nl;
  wire[0:0] nor_316_nl;
  wire[0:0] or_217_nl;
  wire[4:0] S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl;
  wire[4:0] S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl;
  wire[0:0] and_28_nl;
  wire[0:0] not_918_nl;
  wire[0:0] mux_25_nl;
  wire[0:0] mux_24_nl;
  wire[0:0] mux_23_nl;
  wire[0:0] or_30_nl;
  wire[0:0] or_28_nl;
  wire[0:0] mux_1_nl;
  wire[0:0] or_7_nl;
  wire[0:0] mux_21_nl;
  wire[0:0] nor_131_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] mux_503_nl;
  wire[0:0] mux_502_nl;
  wire[0:0] nor_304_nl;
  wire[0:0] mux_501_nl;
  wire[0:0] and_1144_nl;
  wire[0:0] mux_500_nl;
  wire[0:0] or_570_nl;
  wire[0:0] mux_499_nl;
  wire[0:0] nor_305_nl;
  wire[0:0] nor_306_nl;
  wire[0:0] and_1158_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] mux_507_nl;
  wire[0:0] nor_299_nl;
  wire[0:0] mux_506_nl;
  wire[0:0] or_579_nl;
  wire[0:0] or_578_nl;
  wire[0:0] nor_300_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] nor_301_nl;
  wire[0:0] mux_504_nl;
  wire[0:0] nor_302_nl;
  wire[0:0] nor_303_nl;
  wire[14:0] S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl;
  wire[0:0] and_25_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux1h_6_nl;
  wire[4:0] S6_OUTER_LOOP_for_acc_nl;
  wire[5:0] nl_S6_OUTER_LOOP_for_acc_nl;
  wire[0:0] S1_OUTER_LOOP_for_not_nl;
  wire[0:0] operator_20_true_1_mux_nl;
  wire[14:0] operator_20_true_1_acc_1_nl;
  wire[15:0] nl_operator_20_true_1_acc_1_nl;
  wire[0:0] S2_OUTER_LOOP_c_S2_OUTER_LOOP_c_or_nl;
  wire[0:0] operator_20_true_1_or_nl;
  wire[1:0] S2_INNER_LOOP1_r_mux_nl;
  wire[0:0] S2_OUTER_LOOP_c_nor_nl;
  wire[0:0] S2_INNER_LOOP1_r_not_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] and_278_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] nor_298_nl;
  wire[0:0] and_1156_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] nor_295_nl;
  wire[0:0] nor_296_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] nand_91_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] or_537_nl;
  wire[0:0] butterFly_tw_or_1_nl;
  wire[0:0] butterFly_tw_or_2_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] nor_73_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] nor_74_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] nor_71_nl;
  wire[0:0] nor_72_nl;
  wire[0:0] butterFly_tw_or_nl;
  wire[0:0] mux_317_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] and_563_nl;
  wire[0:0] nor_68_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] nor_69_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] nor_70_nl;
  wire[0:0] mux_329_nl;
  wire[0:0] mux_328_nl;
  wire[0:0] or_310_nl;
  wire[0:0] mux_333_nl;
  wire[0:0] mux_332_nl;
  wire[0:0] mux_331_nl;
  wire[0:0] mux_330_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] mux_375_nl;
  wire[0:0] mux_374_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] nand_21_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] or_359_nl;
  wire[0:0] mult_1_z_or_1_nl;
  wire[0:0] mux_395_nl;
  wire[0:0] mux_399_nl;
  wire[0:0] mux_398_nl;
  wire[0:0] or_25_nl;
  wire[0:0] or_24_nl;
  wire[0:0] nor_116_nl;
  wire[0:0] nor_117_nl;
  wire[0:0] nor_112_nl;
  wire[0:0] nor_113_nl;
  wire[0:0] nand_60_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] or_93_nl;
  wire[0:0] or_91_nl;
  wire[0:0] mux_90_nl;
  wire[0:0] mux_91_nl;
  wire[0:0] or_101_nl;
  wire[0:0] mux_92_nl;
  wire[0:0] or_103_nl;
  wire[0:0] mux_94_nl;
  wire[0:0] mux_99_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] or_120_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] or_122_nl;
  wire[0:0] and_586_nl;
  wire[0:0] or_129_nl;
  wire[0:0] mux_108_nl;
  wire[0:0] or_133_nl;
  wire[0:0] nor_100_nl;
  wire[0:0] mux_169_nl;
  wire[0:0] or_170_nl;
  wire[0:0] nand_58_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] or_173_nl;
  wire[0:0] or_180_nl;
  wire[0:0] or_185_nl;
  wire[0:0] nor_119_nl;
  wire[0:0] or_247_nl;
  wire[0:0] or_309_nl;
  wire[0:0] or_312_nl;
  wire[0:0] mux_84_nl;
  wire[0:0] nor_101_nl;
  wire[0:0] mux_83_nl;
  wire[0:0] and_587_nl;
  wire[0:0] nor_102_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] mux_97_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] nand_59_nl;
  wire[0:0] mux_104_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] or_124_nl;
  wire[0:0] mux_106_nl;
  wire[0:0] mux_107_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] and_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] nor_89_nl;
  wire[0:0] nor_90_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] mux_171_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] or_175_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] or_182_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] or_230_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] or_229_nl;
  wire[0:0] or_228_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] mux_247_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] or_232_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] mux_249_nl;
  wire[0:0] or_233_nl;
  wire[0:0] mux_265_nl;
  wire[0:0] or_248_nl;
  wire[0:0] mux_264_nl;
  wire[0:0] or_246_nl;
  wire[0:0] mux_269_nl;
  wire[0:0] mux_268_nl;
  wire[0:0] mux_267_nl;
  wire[0:0] or_251_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] or_249_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] nand_61_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] nor_75_nl;
  wire[0:0] nor_76_nl;
  wire[0:0] or_nl;
  wire[0:0] or_388_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] or_383_nl;
  wire[0:0] nand_37_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] nor_79_nl;
  wire[0:0] and_567_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] nand_14_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] mux_336_nl;
  wire[0:0] nand_29_nl;
  wire[0:0] or_320_nl;
  wire[0:0] nand_17_nl;
  wire[0:0] mux_335_nl;
  wire[0:0] mux_334_nl;
  wire[0:0] or_317_nl;
  wire[0:0] or_316_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] or_330_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] or_332_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] nand_26_nl;
  wire[0:0] or_271_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] nor_121_nl;
  wire[0:0] modulo_sub_3_or_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_12_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_14_nl;
  wire[0:0] nor_153_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] nor_152_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] or_391_nl;
  wire[0:0] mux_80_nl;
  wire[0:0] mux_79_nl;
  wire[0:0] or_392_nl;
  wire[0:0] or_393_nl;
  wire[0:0] or_394_nl;
  wire[0:0] and_107_nl;
  wire[0:0] and_110_nl;
  wire[4:0] S2_COPY_LOOP_for_mux1h_nl;
  wire[0:0] S2_COPY_LOOP_for_or_7_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_7_nl;
  wire[0:0] S2_COPY_LOOP_for_or_8_nl;
  wire[2:0] S2_COPY_LOOP_for_or_5_nl;
  wire[2:0] S2_COPY_LOOP_for_and_2_nl;
  wire[2:0] S2_COPY_LOOP_for_mux1h_8_nl;
  wire[0:0] S2_COPY_LOOP_for_not_nl;
  wire[4:0] S2_COPY_LOOP_for_mux1h_1_nl;
  wire[0:0] S2_COPY_LOOP_for_or_6_nl;
  wire[0:0] S2_COPY_LOOP_for_or_nl;
  wire[0:0] S2_COPY_LOOP_for_mux1h_9_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_10_nl;
  wire[0:0] S2_COPY_LOOP_for_or_9_nl;
  wire[1:0] S2_COPY_LOOP_for_or_1_nl;
  wire[1:0] S2_COPY_LOOP_for_and_1_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_11_nl;
  wire[0:0] S2_COPY_LOOP_for_or_2_nl;
  wire[0:0] S2_COPY_LOOP_for_or_3_nl;
  wire[0:0] S2_COPY_LOOP_for_nor_1_nl;
  wire[0:0] S2_COPY_LOOP_for_or_4_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] nor_95_nl;
  wire[0:0] nor_96_nl;
  wire[0:0] mux_117_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] nor_97_nl;
  wire[0:0] mux_115_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] nor_98_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] and_584_nl;
  wire[0:0] nor_99_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] mux_129_nl;
  wire[0:0] mux_128_nl;
  wire[0:0] mux_127_nl;
  wire[0:0] or_149_nl;
  wire[0:0] mux_126_nl;
  wire[0:0] nor_22_nl;
  wire[0:0] mux_125_nl;
  wire[0:0] mux_124_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] or_145_nl;
  wire[0:0] mux_122_nl;
  wire[0:0] mux_121_nl;
  wire[0:0] nor_94_nl;
  wire[0:0] or_143_nl;
  wire[0:0] and_179_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_11_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_13_nl;
  wire[0:0] nor_142_nl;
  wire[0:0] mux_162_nl;
  wire[0:0] nor_141_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] or_163_nl;
  wire[0:0] mux_164_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] nand_71_nl;
  wire[0:0] or_159_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux1h_2_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_8_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_7_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_9_nl;
  wire[2:0] S1_OUTER_LOOP_for_or_6_nl;
  wire[2:0] S1_OUTER_LOOP_for_and_3_nl;
  wire[2:0] S1_OUTER_LOOP_for_mux1h_8_nl;
  wire[0:0] S1_OUTER_LOOP_for_not_1_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux1h_3_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_7_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_1_nl;
  wire[0:0] S1_OUTER_LOOP_for_mux1h_9_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_10_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_10_nl;
  wire[1:0] S1_OUTER_LOOP_for_or_2_nl;
  wire[1:0] S1_OUTER_LOOP_for_and_2_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_11_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_3_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_4_nl;
  wire[0:0] S1_OUTER_LOOP_for_nor_2_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_5_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] or_191_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] or_187_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] nand_7_nl;
  wire[0:0] or_184_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] or_197_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] mux_414_nl;
  wire[0:0] nor_240_nl;
  wire[0:0] nor_241_nl;
  wire[0:0] nor_242_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] nor_238_nl;
  wire[0:0] nor_239_nl;
  wire[0:0] mux_424_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] or_525_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] or_526_nl;
  wire[0:0] nor_236_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] or_420_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] or_419_nl;
  wire[0:0] or_418_nl;
  wire[0:0] mux_425_nl;
  wire[0:0] or_538_nl;
  wire[0:0] or_539_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] or_431_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] nor_231_nl;
  wire[0:0] nor_233_nl;
  wire[0:0] mux_431_nl;
  wire[0:0] mux_430_nl;
  wire[0:0] nor_228_nl;
  wire[0:0] nor_229_nl;
  wire[0:0] nor_230_nl;
  wire[0:0] mux_432_nl;
  wire[0:0] nor_226_nl;
  wire[0:0] nor_227_nl;
  wire[0:0] or_536_nl;
  wire[0:0] mux_435_nl;
  wire[0:0] or_534_nl;
  wire[0:0] mux_434_nl;
  wire[0:0] nand_83_nl;
  wire[0:0] mux_436_nl;
  wire[0:0] mux_442_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] nor_215_nl;
  wire[0:0] nor_217_nl;
  wire[0:0] mux_445_nl;
  wire[0:0] and_1139_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] nor_213_nl;
  wire[0:0] nor_214_nl;
  wire[0:0] mux_451_nl;
  wire[0:0] or_531_nl;
  wire[0:0] mux_450_nl;
  wire[0:0] or_470_nl;
  wire[0:0] or_468_nl;
  wire[0:0] mux_449_nl;
  wire[0:0] nand_88_nl;
  wire[0:0] mux_448_nl;
  wire[0:0] nor_209_nl;
  wire[0:0] mux_447_nl;
  wire[0:0] nor_210_nl;
  wire[0:0] and_1124_nl;
  wire[0:0] or_532_nl;
  wire[0:0] mux_457_nl;
  wire[0:0] or_542_nl;
  wire[0:0] mux_464_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] or_478_nl;
  wire[19:0] S34_OUTER_LOOP_for_tf_mux1h_1_nl;
  wire[0:0] and_1161_nl;
  wire[31:0] S34_OUTER_LOOP_for_tf_mux_1_nl;
  wire[0:0] S34_OUTER_LOOP_for_tf_or_1_nl;
  wire[31:0] mult_3_t_mux1h_2_nl;
  wire[0:0] mult_3_t_or_12_nl;
  wire[0:0] mult_3_t_or_13_nl;
  wire[0:0] mult_3_t_or_14_nl;
  wire[0:0] mult_3_t_or_15_nl;
  wire[0:0] mult_3_t_or_16_nl;
  wire[31:0] mult_3_t_mux1h_3_nl;
  wire[0:0] mult_3_t_or_17_nl;
  wire[0:0] mult_3_t_or_18_nl;
  wire[0:0] mult_3_t_or_19_nl;
  wire[0:0] mult_3_t_or_20_nl;
  wire[0:0] mult_3_t_or_21_nl;
  wire[0:0] mult_3_t_or_22_nl;
  wire[0:0] mult_3_t_or_23_nl;
  wire[4:0] S2_INNER_LOOP1_for_S2_INNER_LOOP1_for_mux_1_nl;
  wire[0:0] S2_INNER_LOOP1_for_or_2_nl;
  wire[4:0] S2_INNER_LOOP1_for_mux1h_2_nl;
  wire[0:0] S2_INNER_LOOP1_for_or_3_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] nand_97_nl;
  wire[0:0] mux_512_nl;
  wire[14:0] S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl;
  wire[0:0] not_1441_nl;
  wire[2:0] S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl;
  wire[0:0] not_1442_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux_12_nl;
  wire[32:0] acc_2_nl;
  wire[33:0] nl_acc_2_nl;
  wire[32:0] acc_3_nl;
  wire[33:0] nl_acc_3_nl;
  wire[0:0] butterFly_3_or_20_nl;
  wire[0:0] butterFly_3_or_21_nl;
  wire[0:0] butterFly_3_or_22_nl;
  wire[32:0] acc_5_nl;
  wire[33:0] nl_acc_5_nl;
  wire[32:0] acc_6_nl;
  wire[33:0] nl_acc_6_nl;
  wire[31:0] mult_3_res_mux1h_2_nl;
  wire[0:0] mult_3_res_or_5_nl;
  wire[0:0] mult_3_res_or_6_nl;
  wire[0:0] mult_3_res_or_7_nl;
  wire[31:0] mult_3_res_mult_3_res_mux_1_nl;
  wire[0:0] mult_3_res_or_8_nl;
  wire[33:0] acc_8_nl;
  wire[34:0] nl_acc_8_nl;
  wire[33:0] acc_9_nl;
  wire[34:0] nl_acc_9_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[0:0] operator_33_true_operator_33_true_and_nl;
  wire[0:0] operator_33_true_mux_nl;
  wire [3:0] nl_operator_33_true_1_lshift_rg_s;
  assign operator_33_true_operator_33_true_and_nl = (S2_INNER_LOOP1_r_4_2_sva_1_0[0])
      & (~ and_699_ssc);
  assign operator_33_true_mux_nl = MUX_s_1_2_2(S2_OUTER_LOOP_c_1_sva, (~ S2_OUTER_LOOP_c_1_sva),
      and_699_ssc);
  assign nl_operator_33_true_1_lshift_rg_s = {1'b0 , operator_33_true_operator_33_true_and_nl
      , operator_33_true_mux_nl , and_699_ssc};
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
  wire [0:0] nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_3_tr0;
  assign nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_3_tr0 = ~ S2_OUTER_LOOP_c_1_sva;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0 = z_out_3[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_2_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_2_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0 = z_out_3[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_15_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_15_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0 = z_out_4[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_15_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_15_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0 = and_20_cse;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1 = ~ (z_out_4[2]);
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_15_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_15_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0 = z_out_4[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_5_tr0;
  assign nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_5_tr0 = ~ S2_OUTER_LOOP_c_1_sva;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0 = z_out_3[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_2_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_2_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0 = z_out_3[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_15_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_15_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0 = z_out_4[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_15_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_15_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0 = and_20_cse;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1 = ~ (z_out_4[2]);
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_15_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_15_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0 = z_out_4[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0;
  assign nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0 = ~ S2_OUTER_LOOP_c_1_sva;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0 = z_out_3[5];
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_shift_bl_v5 #(.width_a(32'sd1),
  .signd_a(32'sd1),
  .width_s(32'sd4),
  .width_z(32'sd4)) operator_33_true_1_lshift_rg (
      .a(1'b1),
      .s(nl_operator_33_true_1_lshift_rg_s[3:0]),
      .z(z_out_2)
    );
  hybrid_core_wait_dp hybrid_core_wait_dp_inst (
      .xx_rsc_cgo_iro(mux_72_rmff),
      .xx_rsci_clken_d(xx_rsci_clken_d),
      .yy_rsc_cgo_iro(nor_143_rmff),
      .yy_rsci_clken_d(yy_rsci_clken_d),
      .core_wen(core_wen),
      .xx_rsc_cgo(reg_xx_rsc_cgo_cse),
      .yy_rsc_cgo(reg_yy_rsc_cgo_cse)
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
      .S1_OUTER_LOOP_for_C_3_tr0(nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_3_tr0[0:0]),
      .S1_OUTER_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0[0:0]),
      .S2_COPY_LOOP_for_C_2_tr0(nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_2_tr0[0:0]),
      .S2_COPY_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0[0:0]),
      .S2_INNER_LOOP1_for_C_15_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_15_tr0[0:0]),
      .S2_INNER_LOOP1_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0[0:0]),
      .S2_INNER_LOOP2_for_C_15_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_15_tr0[0:0]),
      .S2_INNER_LOOP2_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0[0:0]),
      .S2_INNER_LOOP2_C_0_tr1(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1[0:0]),
      .S2_INNER_LOOP3_for_C_15_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_15_tr0[0:0]),
      .S2_INNER_LOOP3_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0[0:0]),
      .S34_OUTER_LOOP_for_C_5_tr0(nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_5_tr0[0:0]),
      .S34_OUTER_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0[0:0]),
      .S5_COPY_LOOP_for_C_2_tr0(nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_2_tr0[0:0]),
      .S5_COPY_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0[0:0]),
      .S5_INNER_LOOP1_for_C_15_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_15_tr0[0:0]),
      .S5_INNER_LOOP1_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0[0:0]),
      .S5_INNER_LOOP2_for_C_15_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_15_tr0[0:0]),
      .S5_INNER_LOOP2_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0[0:0]),
      .S5_INNER_LOOP2_C_0_tr1(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1[0:0]),
      .S5_INNER_LOOP3_for_C_15_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_15_tr0[0:0]),
      .S5_INNER_LOOP3_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0[0:0]),
      .S6_OUTER_LOOP_for_C_3_tr0(nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0[0:0]),
      .S6_OUTER_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0[0:0])
    );
  assign nor_118_cse = ~((fsm_output[6:1]!=6'b000000));
  assign nor_110_cse = ~((~ (fsm_output[0])) | (fsm_output[4]));
  assign mux_67_nl = MUX_s_1_2_2((fsm_output[4]), (~ mux_151_cse), fsm_output[0]);
  assign or_73_nl = (fsm_output[0]) | (~ nor_tmp_10);
  assign mux_68_nl = MUX_s_1_2_2(mux_67_nl, or_73_nl, fsm_output[5]);
  assign nor_12_nl = ~((fsm_output[5]) | (~ (fsm_output[0])));
  assign mux_66_nl = MUX_s_1_2_2(mux_151_cse, nor_tmp_10, nor_12_nl);
  assign mux_69_nl = MUX_s_1_2_2(mux_68_nl, mux_66_nl, fsm_output[3]);
  assign nand_49_nl = ~(((~ (fsm_output[0])) | (fsm_output[4])) & (fsm_output[6]));
  assign mux_64_nl = MUX_s_1_2_2(nand_49_nl, mux_151_cse, fsm_output[5]);
  assign mux_62_nl = MUX_s_1_2_2(mux_151_cse, nor_tmp_10, fsm_output[0]);
  assign mux_63_nl = MUX_s_1_2_2(mux_tmp_52, mux_62_nl, fsm_output[5]);
  assign mux_65_nl = MUX_s_1_2_2((~ mux_64_nl), mux_63_nl, fsm_output[3]);
  assign mux_70_nl = MUX_s_1_2_2(mux_69_nl, mux_65_nl, fsm_output[2]);
  assign or_71_nl = (~ (fsm_output[0])) | (fsm_output[4]) | (fsm_output[6]);
  assign mux_59_nl = MUX_s_1_2_2((~ mux_151_cse), or_71_nl, fsm_output[5]);
  assign mux_57_nl = MUX_s_1_2_2(nor_tmp_10, (~ or_196_cse), fsm_output[0]);
  assign mux_58_nl = MUX_s_1_2_2(mux_57_nl, mux_151_cse, fsm_output[5]);
  assign mux_60_nl = MUX_s_1_2_2(mux_59_nl, mux_58_nl, fsm_output[3]);
  assign or_70_nl = nor_110_cse | (fsm_output[6]);
  assign and_590_nl = (fsm_output[0]) & (fsm_output[4]);
  assign mux_54_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), and_590_nl);
  assign mux_55_nl = MUX_s_1_2_2(or_70_nl, mux_54_nl, fsm_output[5]);
  assign mux_53_nl = MUX_s_1_2_2(or_68_cse, mux_tmp_52, fsm_output[5]);
  assign mux_56_nl = MUX_s_1_2_2(mux_55_nl, mux_53_nl, fsm_output[3]);
  assign mux_61_nl = MUX_s_1_2_2(mux_60_nl, mux_56_nl, fsm_output[2]);
  assign mux_71_nl = MUX_s_1_2_2(mux_70_nl, mux_61_nl, fsm_output[1]);
  assign mux_72_rmff = MUX_s_1_2_2(mux_71_nl, nor_118_cse, fsm_output[7]);
  assign nand_48_cse = ~((fsm_output[3:1]==3'b111));
  assign nor_107_nl = ~((fsm_output[1]) | (fsm_output[3]));
  assign mux_75_nl = MUX_s_1_2_2(nor_107_nl, or_tmp_61, fsm_output[2]);
  assign nand_65_nl = ~((fsm_output[5:4]==2'b11) & (~ mux_75_nl));
  assign or_395_nl = (fsm_output[5]) | nand_48_cse;
  assign mux_73_nl = MUX_s_1_2_2(or_tmp_61, (fsm_output[3]), fsm_output[2]);
  assign or_396_nl = (fsm_output[5]) | mux_73_nl;
  assign mux_74_nl = MUX_s_1_2_2(or_395_nl, or_396_nl, fsm_output[4]);
  assign mux_76_cse = MUX_s_1_2_2(nand_65_nl, mux_74_nl, fsm_output[0]);
  assign mux_77_nl = MUX_s_1_2_2(or_287_cse, (~ or_287_cse), fsm_output[2]);
  assign nand_64_cse = ~((~((~ (fsm_output[0])) | (fsm_output[4]) | (~ (fsm_output[5]))))
      & mux_77_nl);
  assign mux_152_nl = MUX_s_1_2_2(or_300_cse, or_tmp_137, fsm_output[4]);
  assign mux_153_nl = MUX_s_1_2_2((~ mux_152_nl), mux_151_cse, fsm_output[3]);
  assign mux_149_nl = MUX_s_1_2_2((fsm_output[6]), (~ (fsm_output[6])), and_581_cse);
  assign mux_150_nl = MUX_s_1_2_2(mux_149_nl, mux_tmp_132, fsm_output[3]);
  assign mux_154_nl = MUX_s_1_2_2(mux_153_nl, mux_150_nl, fsm_output[2]);
  assign mux_146_nl = MUX_s_1_2_2(or_tmp_139, or_300_cse, fsm_output[4]);
  assign mux_147_nl = MUX_s_1_2_2((~ mux_146_nl), mux_tmp_140, fsm_output[3]);
  assign mux_144_nl = MUX_s_1_2_2((~ or_tmp_137), or_300_cse, fsm_output[4]);
  assign mux_145_nl = MUX_s_1_2_2((~ mux_tmp_137), mux_144_nl, fsm_output[3]);
  assign mux_148_nl = MUX_s_1_2_2(mux_147_nl, mux_145_nl, fsm_output[2]);
  assign mux_155_nl = MUX_s_1_2_2(mux_154_nl, mux_148_nl, fsm_output[1]);
  assign mux_141_nl = MUX_s_1_2_2((~ or_300_cse), mux_tmp_140, fsm_output[3]);
  assign mux_138_nl = MUX_s_1_2_2(or_tmp_137, (~ mux_tmp_137), fsm_output[4]);
  assign mux_136_nl = MUX_s_1_2_2(or_tmp_139, (fsm_output[6]), fsm_output[4]);
  assign mux_139_nl = MUX_s_1_2_2(mux_138_nl, mux_136_nl, fsm_output[3]);
  assign mux_142_nl = MUX_s_1_2_2(mux_141_nl, mux_139_nl, fsm_output[2]);
  assign mux_133_nl = MUX_s_1_2_2((fsm_output[6]), (~ or_300_cse), fsm_output[4]);
  assign mux_134_nl = MUX_s_1_2_2(mux_133_nl, mux_tmp_132, fsm_output[3]);
  assign mux_131_nl = MUX_s_1_2_2((~ or_tmp_137), (fsm_output[6]), fsm_output[4]);
  assign mux_135_nl = MUX_s_1_2_2(mux_134_nl, mux_131_nl, fsm_output[2]);
  assign mux_143_nl = MUX_s_1_2_2(mux_142_nl, mux_135_nl, fsm_output[1]);
  assign mux_156_nl = MUX_s_1_2_2(mux_155_nl, mux_143_nl, fsm_output[0]);
  assign nor_143_rmff = ~(mux_156_nl | (fsm_output[7]));
  assign or_196_cse = (fsm_output[4]) | (fsm_output[6]);
  assign and_598_cse = (fsm_output[3:2]==2'b11);
  assign or_15_cse = (fsm_output[1:0]!=2'b00);
  assign and_558_cse = (fsm_output[3:1]==3'b111);
  assign and_571_cse_1 = (fsm_output[1:0]==2'b11);
  assign nor_85_cse = ~((fsm_output[1:0]!=2'b00));
  assign mux_7_nl = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), and_598_cse);
  assign nor_317_nl = ~((fsm_output[4:3]!=2'b00));
  assign mux_5_nl = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[3]);
  assign mux_6_nl = MUX_s_1_2_2(nor_317_nl, mux_5_nl, fsm_output[2]);
  assign mux_8_nl = MUX_s_1_2_2(mux_7_nl, mux_6_nl, fsm_output[1]);
  assign and_252_ssc = ~(mux_8_nl | (fsm_output[7]) | (fsm_output[5]));
  assign nor_132_nl = ~((fsm_output[0]) | (~ mux_tmp_216));
  assign nor_133_nl = ~((fsm_output[5:1]!=5'b00010));
  assign mux_217_nl = MUX_s_1_2_2(mux_tmp_216, nor_133_nl, fsm_output[0]);
  assign mux_218_nl = MUX_s_1_2_2(nor_132_nl, mux_217_nl, z_out_3[5]);
  assign S2_COPY_LOOP_p_nand_seb = ~(mux_218_nl & (~ (fsm_output[7])));
  assign and_1160_cse = (fsm_output[2:1]==2'b11);
  assign or_6_cse = (fsm_output[3]) | (fsm_output[5]) | (fsm_output[7]) | (fsm_output[4]);
  assign or_29_cse = (fsm_output[2]) | (fsm_output[6]);
  assign or_217_nl = (fsm_output[5:2]!=4'b0010);
  assign mux_231_cse = MUX_s_1_2_2(or_tmp_40, or_217_nl, fsm_output[1]);
  assign and_28_nl = not_tmp_30 & and_dcpl_23 & (~ (fsm_output[3])) & (fsm_output[0]);
  assign S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl = MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1[4:0]),
      (z_out_3[4:0]), and_28_nl);
  assign or_30_nl = (fsm_output[3]) | (~ (fsm_output[7])) | (fsm_output[4]) | (fsm_output[5]);
  assign mux_23_nl = MUX_s_1_2_2(or_30_nl, or_6_cse, or_29_cse);
  assign or_7_nl = (fsm_output[5:3]!=3'b000);
  assign mux_1_nl = MUX_s_1_2_2(or_7_nl, or_6_cse, fsm_output[6]);
  assign or_28_nl = (fsm_output[2]) | mux_1_nl;
  assign mux_24_nl = MUX_s_1_2_2(mux_23_nl, or_28_nl, fsm_output[1]);
  assign mux_21_nl = MUX_s_1_2_2(or_6_cse, mux_tmp_20, fsm_output[1]);
  assign mux_25_nl = MUX_s_1_2_2(mux_24_nl, mux_21_nl, fsm_output[0]);
  assign not_918_nl = ~ mux_25_nl;
  assign S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl
      = MUX_v_5_2_2(5'b00000, S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl, not_918_nl);
  assign nand_9_nl = ~((fsm_output[2:1]==2'b11) & (~ mux_tmp_232));
  assign mux_233_nl = MUX_s_1_2_2(nand_9_nl, mux_231_cse, fsm_output[0]);
  assign nor_131_nl = ~(mux_233_nl | (fsm_output[7]));
  assign S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt = MUX_v_6_2_2(({1'b0 , S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl}),
      z_out_3, nor_131_nl);
  assign and_278_nl = and_dcpl_53 & or_15_cse & (fsm_output[2]);
  assign butterFly_tw_butterFly_tw_mux_rgt = MUX_v_2_2_2(butterFly_tw_and_cse_3_2_sva_1,
      ({1'b0 , butterFly_4_tw_and_cse_2_sva_mx0w2}), and_278_nl);
  assign or_287_cse = (fsm_output[3]) | (~ (fsm_output[1]));
  assign nand_69_cse = ~((fsm_output[5]) & (fsm_output[3]));
  assign mux_302_nl = MUX_s_1_2_2((fsm_output[5]), (~ (fsm_output[5])), fsm_output[3]);
  assign nor_73_nl = ~((fsm_output[6]) | mux_302_nl);
  assign nor_74_nl = ~((~ (fsm_output[6])) | (fsm_output[3]) | (fsm_output[5]));
  assign mux_303_nl = MUX_s_1_2_2(nor_73_nl, nor_74_nl, fsm_output[1]);
  assign and_363_cse = mux_303_nl & and_dcpl_358 & (~ (fsm_output[2])) & (fsm_output[0]);
  assign nor_71_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[3])
      | (fsm_output[5]));
  assign nor_72_nl = ~((fsm_output[2:1]!=2'b00) | nand_69_cse);
  assign mux_304_nl = MUX_s_1_2_2(nor_71_nl, nor_72_nl, fsm_output[0]);
  assign and_373_cse = mux_304_nl & and_dcpl_358 & (fsm_output[6]);
  assign or_300_cse = (fsm_output[6:5]!=2'b00);
  assign mux_388_cse = MUX_s_1_2_2(or_tmp_93, or_tmp_92, fsm_output[2]);
  assign butterFly_4_tw_and_cse_2_sva_mx0w2 = (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])
      & (S2_INNER_LOOP1_r_4_2_sva_1_0[0]);
  assign or_68_cse = (~ (fsm_output[4])) | (fsm_output[6]);
  assign and_581_cse = (fsm_output[5:4]==2'b11);
  assign mux_151_cse = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[4]);
  assign butterFly_tw_and_cse_3_2_sva_1 = ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])}) & S2_INNER_LOOP1_r_4_2_sva_1_0;
  assign mult_3_res_mux_cse = MUX_v_32_2_2(z_out_6, z_out_9, z_out_11_32);
  assign and_dcpl_1 = ~((fsm_output[6]) | (fsm_output[2]));
  assign or_tmp_10 = (fsm_output[5:4]!=2'b10);
  assign and_20_cse = (z_out_4[2]) & S2_OUTER_LOOP_c_1_sva;
  assign or_25_nl = (fsm_output[7:3]!=5'b10000);
  assign or_24_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (~ and_581_cse);
  assign mux_tmp_20 = MUX_s_1_2_2(or_25_nl, or_24_nl, fsm_output[2]);
  assign and_dcpl_23 = ~((fsm_output[5:4]!=2'b00));
  assign nor_116_nl = ~((~ (fsm_output[2])) | (fsm_output[7]));
  assign nor_117_nl = ~((fsm_output[2]) | (fsm_output[6]) | (~ (fsm_output[7])));
  assign not_tmp_30 = MUX_s_1_2_2(nor_116_nl, nor_117_nl, fsm_output[1]);
  assign and_dcpl_31 = ~((fsm_output[7]) | (fsm_output[3]));
  assign and_dcpl_32 = and_dcpl_23 & and_dcpl_31;
  assign and_dcpl_36 = and_dcpl_23 & (fsm_output[7]) & (~ (fsm_output[3]));
  assign and_dcpl_38 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_39 = and_dcpl_1 & and_dcpl_38;
  assign and_dcpl_40 = and_dcpl_32 & and_dcpl_39;
  assign and_dcpl_41 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_43 = and_dcpl_36 & and_dcpl_1 & and_dcpl_41;
  assign mux_tmp_31 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[4]);
  assign or_tmp_29 = (fsm_output[5:3]!=3'b001);
  assign or_tmp_30 = (~ (fsm_output[3])) | (fsm_output[5]);
  assign or_tmp_31 = (fsm_output[3]) | (~ and_581_cse);
  assign or_tmp_32 = (fsm_output[3]) | (~ (fsm_output[5]));
  assign or_dcpl_9 = (fsm_output[7]) | (~ (fsm_output[3]));
  assign or_tmp_36 = (fsm_output[5:4]!=2'b00);
  assign mux_tmp_39 = MUX_s_1_2_2(or_tmp_36, or_tmp_10, fsm_output[2]);
  assign or_tmp_37 = (~ (fsm_output[2])) | (~ (fsm_output[4])) | (fsm_output[5]);
  assign and_dcpl_49 = (fsm_output[2:1]==2'b10);
  assign and_dcpl_50 = and_dcpl_49 & (fsm_output[0]);
  assign and_dcpl_51 = (~ (fsm_output[7])) & (fsm_output[3]);
  assign and_dcpl_52 = (fsm_output[5:4]==2'b01);
  assign and_dcpl_53 = and_dcpl_52 & and_dcpl_51;
  assign and_dcpl_56 = and_1160_cse & (~ (fsm_output[0]));
  assign and_dcpl_60 = (fsm_output[5:4]==2'b10);
  assign and_dcpl_61 = and_dcpl_60 & (~ (fsm_output[7]));
  assign and_dcpl_63 = (fsm_output[2:1]==2'b01);
  assign and_dcpl_64 = and_dcpl_63 & (fsm_output[0]);
  assign and_dcpl_65 = and_dcpl_23 & and_dcpl_51;
  assign and_dcpl_66 = and_dcpl_65 & and_dcpl_64;
  assign and_dcpl_68 = and_dcpl_65 & (~((fsm_output[1:0]==2'b11))) & (fsm_output[2]);
  assign or_tmp_40 = ~((fsm_output[5:2]==4'b0111));
  assign or_tmp_42 = (fsm_output[5:2]!=4'b1000);
  assign and_dcpl_70 = (fsm_output[5]) & (~ (fsm_output[7]));
  assign nor_112_nl = ~((fsm_output[4:2]!=3'b100));
  assign nor_113_nl = ~((fsm_output[4:2]!=3'b011));
  assign not_tmp_38 = MUX_s_1_2_2(nor_112_nl, nor_113_nl, fsm_output[1]);
  assign and_dcpl_71 = not_tmp_38 & and_dcpl_70;
  assign or_tmp_46 = (fsm_output[5:3]!=3'b011);
  assign or_tmp_51 = (fsm_output[3:2]!=2'b00) | (~ and_581_cse);
  assign nand_60_nl = ~((fsm_output[5:2]==4'b1011));
  assign mux_tmp_48 = MUX_s_1_2_2(or_tmp_51, nand_60_nl, fsm_output[1]);
  assign and_dcpl_82 = (~ (fsm_output[6])) & (fsm_output[2]);
  assign and_dcpl_83 = and_dcpl_82 & and_571_cse_1;
  assign and_dcpl_84 = and_581_cse & and_dcpl_51;
  assign and_dcpl_85 = and_dcpl_84 & and_dcpl_83;
  assign mux_tmp_52 = MUX_s_1_2_2((~ or_196_cse), mux_151_cse, fsm_output[0]);
  assign nor_tmp_10 = (fsm_output[4]) & (fsm_output[6]);
  assign and_dcpl_86 = and_dcpl_32 & and_dcpl_83;
  assign and_dcpl_88 = ~((fsm_output[2:1]!=2'b00));
  assign and_dcpl_90 = ~((fsm_output[3]) | (fsm_output[6]));
  assign and_dcpl_91 = and_dcpl_61 & and_dcpl_90;
  assign or_tmp_61 = (fsm_output[1]) | (~ (fsm_output[3]));
  assign not_tmp_60 = ~((fsm_output[6:3]==4'b1111));
  assign or_tmp_71 = (fsm_output[5:3]!=3'b101);
  assign and_dcpl_105 = (fsm_output[6]) & (~ (fsm_output[2]));
  assign and_dcpl_113 = (fsm_output[3]) & (fsm_output[6]);
  assign and_dcpl_114 = and_dcpl_23 & (~ (fsm_output[7]));
  assign and_dcpl_115 = and_dcpl_114 & and_dcpl_113;
  assign and_dcpl_122 = (~ (fsm_output[3])) & (fsm_output[6]);
  assign and_dcpl_123 = and_dcpl_52 & (~ (fsm_output[7]));
  assign and_dcpl_124 = and_dcpl_123 & and_dcpl_122;
  assign and_dcpl_131 = and_581_cse & (~ (fsm_output[7]));
  assign and_dcpl_132 = and_dcpl_131 & and_dcpl_122;
  assign and_dcpl_144 = and_dcpl_51 & (fsm_output[2]);
  assign or_tmp_79 = (fsm_output[6:4]!=3'b101);
  assign or_93_nl = (fsm_output[6:4]!=3'b000);
  assign mux_85_nl = MUX_s_1_2_2(or_93_nl, or_tmp_79, fsm_output[1]);
  assign or_91_nl = (~ (fsm_output[1])) | (fsm_output[6]) | (fsm_output[4]) | (~
      (fsm_output[5]));
  assign mux_86_cse = MUX_s_1_2_2(mux_85_nl, or_91_nl, fsm_output[0]);
  assign and_dcpl_145 = (~ mux_86_cse) & and_dcpl_144;
  assign or_tmp_81 = ~((fsm_output[6:2]==5'b10111));
  assign or_tmp_82 = (fsm_output[6:2]!=5'b00011);
  assign or_tmp_84 = (fsm_output[1]) | (fsm_output[2]) | (fsm_output[6]) | (fsm_output[3])
      | (~ and_581_cse);
  assign or_tmp_86 = (fsm_output[6:2]!=5'b11000);
  assign mux_tmp_89 = MUX_s_1_2_2(or_tmp_86, or_tmp_82, fsm_output[1]);
  assign mux_90_nl = MUX_s_1_2_2(mux_tmp_89, or_tmp_84, fsm_output[0]);
  assign and_dcpl_147 = ~(mux_90_nl | (fsm_output[7]));
  assign or_101_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[6]) | (fsm_output[3])
      | (~ and_581_cse);
  assign mux_91_nl = MUX_s_1_2_2(or_101_nl, mux_tmp_89, fsm_output[0]);
  assign and_dcpl_148 = ~(mux_91_nl | (fsm_output[7]));
  assign and_dcpl_149 = and_dcpl_31 & (~ (fsm_output[2]));
  assign or_tmp_92 = (fsm_output[6:4]!=3'b110);
  assign or_tmp_93 = (fsm_output[6:4]!=3'b001);
  assign mux_92_nl = MUX_s_1_2_2(or_tmp_93, or_tmp_92, fsm_output[1]);
  assign or_103_nl = (~ (fsm_output[1])) | (fsm_output[6]) | (~ and_581_cse);
  assign mux_93_itm = MUX_s_1_2_2(mux_92_nl, or_103_nl, fsm_output[0]);
  assign or_tmp_95 = (fsm_output[2]) | (~ (fsm_output[6])) | (fsm_output[4]) | (~
      (fsm_output[5]));
  assign or_tmp_96 = (fsm_output[2]) | (fsm_output[6]) | (~ (fsm_output[4])) | (fsm_output[5]);
  assign or_tmp_98 = (fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[6]) | (~
      and_581_cse);
  assign mux_94_nl = MUX_s_1_2_2(or_tmp_96, or_tmp_95, fsm_output[1]);
  assign mux_95_itm = MUX_s_1_2_2(or_tmp_98, mux_94_nl, fsm_output[0]);
  assign and_dcpl_153 = (fsm_output[6]) & (fsm_output[2]);
  assign and_dcpl_154 = and_dcpl_153 & and_dcpl_38;
  assign and_dcpl_156 = and_dcpl_153 & and_571_cse_1;
  assign and_dcpl_157 = and_dcpl_84 & and_dcpl_156;
  assign or_tmp_102 = (fsm_output[1]) | (fsm_output[2]) | (~ (fsm_output[6])) | (fsm_output[3])
      | (~ and_581_cse);
  assign or_tmp_103 = (fsm_output[6:2]!=5'b10011);
  assign or_tmp_105 = (fsm_output[6:2]!=5'b01000);
  assign mux_tmp_98 = MUX_s_1_2_2(or_tmp_105, or_tmp_103, fsm_output[1]);
  assign mux_99_nl = MUX_s_1_2_2(mux_tmp_98, or_tmp_102, fsm_output[0]);
  assign and_dcpl_161 = ~(mux_99_nl | (fsm_output[7]));
  assign or_120_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (~ (fsm_output[6]))
      | (fsm_output[3]) | (~ and_581_cse);
  assign mux_100_nl = MUX_s_1_2_2(or_120_nl, mux_tmp_98, fsm_output[0]);
  assign and_dcpl_162 = ~(mux_100_nl | (fsm_output[7]));
  assign and_dcpl_163 = and_dcpl_31 & (fsm_output[2]);
  assign or_122_nl = (fsm_output[6:4]!=3'b010);
  assign mux_101_nl = MUX_s_1_2_2(or_tmp_79, or_122_nl, fsm_output[1]);
  assign and_586_nl = (fsm_output[1]) & (fsm_output[6]) & (fsm_output[4]) & (fsm_output[5]);
  assign mux_tmp_102 = MUX_s_1_2_2((~ mux_101_nl), and_586_nl, fsm_output[0]);
  assign or_tmp_112 = (fsm_output[6:2]!=5'b10101);
  assign or_tmp_114 = (fsm_output[2:1]!=2'b00) | not_tmp_60;
  assign or_129_nl = (fsm_output[6:2]!=5'b01010);
  assign mux_tmp_105 = MUX_s_1_2_2(or_129_nl, or_tmp_112, fsm_output[1]);
  assign and_dcpl_168 = and_dcpl_51 & (~ (fsm_output[2]));
  assign or_tmp_121 = (fsm_output[2]) | (~ (fsm_output[6])) | (~ (fsm_output[4]))
      | (fsm_output[5]);
  assign nand_45_cse = ~((fsm_output[2]) & (fsm_output[6]) & (fsm_output[4]) & (fsm_output[5]));
  assign or_tmp_122 = (fsm_output[1]) | nand_45_cse;
  assign or_133_nl = (fsm_output[2]) | (fsm_output[6]) | (fsm_output[4]) | (~ (fsm_output[5]));
  assign mux_108_nl = MUX_s_1_2_2(or_tmp_121, or_133_nl, fsm_output[1]);
  assign mux_109_itm = MUX_s_1_2_2(or_tmp_122, mux_108_nl, fsm_output[0]);
  assign and_dcpl_171 = and_dcpl_105 & and_dcpl_41;
  assign and_dcpl_172 = and_dcpl_32 & and_dcpl_171;
  assign mux_tmp_110 = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[6]);
  assign nor_100_nl = ~((fsm_output[6]) | (fsm_output[4]));
  assign mux_tmp_111 = MUX_s_1_2_2(nor_100_nl, mux_tmp_110, fsm_output[0]);
  assign nor_tmp_21 = (fsm_output[4:3]==2'b11);
  assign or_tmp_133 = (fsm_output[5:3]!=3'b100);
  assign or_tmp_134 = (fsm_output[4:3]!=2'b10);
  assign or_tmp_135 = (fsm_output[4:3]!=2'b01);
  assign or_tmp_137 = (fsm_output[6:5]!=2'b01);
  assign mux_tmp_132 = MUX_s_1_2_2((~ (fsm_output[6])), or_tmp_137, fsm_output[4]);
  assign or_tmp_139 = (fsm_output[6:5]!=2'b10);
  assign mux_tmp_137 = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[5]);
  assign nand_44_cse = ~((fsm_output[6:5]==2'b11));
  assign mux_tmp_140 = MUX_s_1_2_2(nand_44_cse, (fsm_output[6]), fsm_output[4]);
  assign and_dcpl_177 = and_dcpl_1 & (fsm_output[1]);
  assign and_dcpl_181 = (fsm_output[3]) & (~ (fsm_output[6]));
  assign and_dcpl_182 = and_dcpl_114 & and_dcpl_181;
  assign and_dcpl_190 = and_dcpl_123 & and_dcpl_90;
  assign nor_tmp_28 = (fsm_output[5:3]==3'b111);
  assign or_tmp_147 = (fsm_output[6:3]!=4'b0010);
  assign and_dcpl_198 = and_dcpl_131 & and_dcpl_90;
  assign and_dcpl_209 = and_dcpl_32 & and_dcpl_156;
  assign and_dcpl_212 = and_dcpl_61 & and_dcpl_122;
  assign or_170_nl = (fsm_output[6:4]!=3'b100);
  assign mux_169_nl = MUX_s_1_2_2(or_170_nl, or_tmp_93, fsm_output[1]);
  assign nand_58_nl = ~((fsm_output[1]) & (fsm_output[6]) & (~ (fsm_output[4])) &
      (fsm_output[5]));
  assign mux_170_cse = MUX_s_1_2_2(mux_169_nl, nand_58_nl, fsm_output[0]);
  assign and_dcpl_226 = (~ mux_170_cse) & and_dcpl_144;
  assign or_tmp_158 = (fsm_output[6:2]!=5'b00111);
  assign and_dcpl_228 = mux_tmp_102 & and_dcpl_149;
  assign and_dcpl_229 = (~ mux_109_itm) & and_dcpl_31;
  assign or_173_nl = (~ (fsm_output[2])) | (fsm_output[6]) | (fsm_output[4]) | (~
      (fsm_output[5]));
  assign mux_173_nl = MUX_s_1_2_2(or_173_nl, or_tmp_121, fsm_output[1]);
  assign mux_174_nl = MUX_s_1_2_2(mux_173_nl, or_tmp_122, fsm_output[0]);
  assign and_dcpl_230 = (~ mux_174_nl) & and_dcpl_31;
  assign and_dcpl_232 = and_dcpl_32 & and_dcpl_105 & nor_85_cse;
  assign and_dcpl_233 = and_dcpl_1 & and_571_cse_1;
  assign or_tmp_163 = (fsm_output[6:2]!=5'b00101);
  assign or_tmp_165 = (fsm_output[1]) | (fsm_output[2]) | (fsm_output[6]) | (~ nor_tmp_28);
  assign or_180_nl = (fsm_output[6:2]!=5'b11010);
  assign mux_tmp_177 = MUX_s_1_2_2(or_180_nl, or_tmp_163, fsm_output[1]);
  assign or_185_nl = (~ (fsm_output[6])) | (fsm_output[4]);
  assign mux_tmp_181 = MUX_s_1_2_2(or_185_nl, mux_tmp_110, fsm_output[0]);
  assign or_tmp_175 = (~ (fsm_output[1])) | (fsm_output[6]) | (fsm_output[4]);
  assign nand_tmp_8 = ~((fsm_output[3]) & (~ mux_151_cse));
  assign or_tmp_179 = (fsm_output[3]) | (~ mux_151_cse);
  assign or_tmp_181 = (~ (fsm_output[3])) | (fsm_output[4]) | (~ (fsm_output[6]));
  assign mux_tmp_192 = MUX_s_1_2_2(or_tmp_181, or_tmp_179, fsm_output[5]);
  assign or_tmp_182 = (fsm_output[3]) | (~((fsm_output[4]) & (fsm_output[6])));
  assign mux_tmp_195 = MUX_s_1_2_2(or_tmp_182, or_tmp_179, fsm_output[5]);
  assign nor_tmp_34 = (fsm_output[5:2]==4'b1111);
  assign nor_119_nl = ~((fsm_output[6:2]!=5'b00000));
  assign mux_tmp_216 = MUX_s_1_2_2(nor_119_nl, nor_tmp_34, fsm_output[1]);
  assign mux_tmp_232 = MUX_s_1_2_2(or_tmp_36, or_tmp_10, fsm_output[3]);
  assign and_dcpl_256 = mux_tmp_216 & (~ (fsm_output[7])) & (fsm_output[0]);
  assign and_dcpl_257 = ~((fsm_output[7:6]!=2'b00));
  assign or_tmp_221 = (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[5]);
  assign and_dcpl_262 = and_dcpl_88 & (fsm_output[0]);
  assign and_dcpl_264 = and_dcpl_82 & and_dcpl_41;
  assign and_dcpl_265 = and_dcpl_60 & and_dcpl_51;
  assign or_tmp_224 = (fsm_output[2]) | (fsm_output[5]);
  assign or_247_nl = (fsm_output[2]) | (fsm_output[4]) | (fsm_output[5]);
  assign mux_tmp_263 = MUX_s_1_2_2(or_tmp_37, or_247_nl, fsm_output[1]);
  assign not_tmp_174 = ~((fsm_output[1]) & (fsm_output[2]) & (fsm_output[4]) & (fsm_output[5]));
  assign or_tmp_247 = (fsm_output[6:3]!=4'b1001);
  assign or_tmp_250 = (fsm_output[6:3]!=4'b0001);
  assign and_dcpl_301 = and_dcpl_61 & and_dcpl_181;
  assign and_dcpl_308 = and_dcpl_131 & and_dcpl_181;
  assign and_dcpl_339 = and_dcpl_61 & and_dcpl_113;
  assign and_dcpl_346 = and_dcpl_131 & and_dcpl_113;
  assign and_dcpl_358 = (fsm_output[4]) & (~ (fsm_output[7]));
  assign and_dcpl_363 = and_dcpl_60 & and_dcpl_31;
  assign and_dcpl_367 = and_dcpl_105 & and_dcpl_38;
  assign and_dcpl_371 = and_581_cse & and_dcpl_31;
  assign and_dcpl_374 = and_dcpl_52 & and_dcpl_31;
  assign or_309_nl = (~ (fsm_output[6])) | (fsm_output[3]) | (~ and_581_cse);
  assign mux_tmp_326 = MUX_s_1_2_2(or_309_nl, or_tmp_250, fsm_output[2]);
  assign or_312_nl = (fsm_output[6]) | (fsm_output[3]) | (~ and_581_cse);
  assign mux_tmp_327 = MUX_s_1_2_2(or_312_nl, or_tmp_247, fsm_output[2]);
  assign or_tmp_285 = (fsm_output[2]) | (fsm_output[6]) | (fsm_output[3]) | (~ and_581_cse);
  assign or_tmp_289 = ~((fsm_output[0]) & (fsm_output[2]) & (~ (fsm_output[5])) &
      (fsm_output[3]));
  assign or_tmp_297 = (fsm_output[5:2]!=4'b0011);
  assign or_tmp_303 = (~ (fsm_output[2])) | (fsm_output[6]) | (fsm_output[3]) | (~
      and_581_cse);
  assign nor_101_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[6])
      | (fsm_output[4]) | (~ (fsm_output[5])));
  assign and_587_nl = (fsm_output[2]) & (fsm_output[6]) & (fsm_output[4]) & (~ (fsm_output[5]));
  assign nor_102_nl = ~((fsm_output[2]) | (fsm_output[6]) | (fsm_output[4]) | (fsm_output[5]));
  assign mux_83_nl = MUX_s_1_2_2(and_587_nl, nor_102_nl, fsm_output[1]);
  assign mux_84_nl = MUX_s_1_2_2(nor_101_nl, mux_83_nl, fsm_output[0]);
  assign xx_rsci_radr_d_mx0c0 = mux_84_nl & and_dcpl_51;
  assign mux_87_nl = MUX_s_1_2_2(or_tmp_82, or_tmp_81, fsm_output[1]);
  assign mux_88_nl = MUX_s_1_2_2(or_tmp_84, mux_87_nl, fsm_output[0]);
  assign xx_rsci_radr_d_mx0c2 = ~(mux_88_nl | (fsm_output[7]));
  assign xx_rsci_radr_d_mx0c5 = (~ mux_93_itm) & and_dcpl_149;
  assign xx_rsci_radr_d_mx0c6 = (~ mux_95_itm) & and_dcpl_31;
  assign nand_59_nl = ~((fsm_output[2]) & (fsm_output[6]) & (~ (fsm_output[4])) &
      (fsm_output[5]));
  assign mux_96_nl = MUX_s_1_2_2(nand_59_nl, or_tmp_96, fsm_output[1]);
  assign mux_97_nl = MUX_s_1_2_2(mux_96_nl, or_tmp_98, fsm_output[0]);
  assign xx_rsci_radr_d_mx0c7 = (~ mux_97_nl) & and_dcpl_31;
  assign xx_rsci_radr_d_mx0c8 = and_dcpl_32 & and_dcpl_154;
  assign xx_rsci_radr_d_mx0c10 = and_dcpl_36 & and_dcpl_1 & nor_85_cse;
  assign xx_rsci_wadr_d_mx0c3 = mux_tmp_102 & and_dcpl_163;
  assign or_124_nl = (fsm_output[6:2]!=5'b01001);
  assign mux_103_nl = MUX_s_1_2_2(or_tmp_112, or_124_nl, fsm_output[1]);
  assign mux_104_nl = MUX_s_1_2_2(or_tmp_114, mux_103_nl, fsm_output[0]);
  assign xx_rsci_wadr_d_mx0c4 = ~(mux_104_nl | (fsm_output[7]));
  assign mux_106_nl = MUX_s_1_2_2(mux_tmp_105, or_tmp_114, fsm_output[0]);
  assign xx_rsci_wadr_d_mx0c5 = ~(mux_106_nl | (fsm_output[7]));
  assign or_131_cse = (fsm_output[2:1]!=2'b01) | not_tmp_60;
  assign mux_107_nl = MUX_s_1_2_2(or_131_cse, mux_tmp_105, fsm_output[0]);
  assign xx_rsci_wadr_d_mx0c6 = ~(mux_107_nl | (fsm_output[7]));
  assign xx_rsci_wadr_d_mx0c7 = mux_tmp_102 & and_dcpl_168;
  assign xx_rsci_wadr_d_mx0c8 = (~ mux_109_itm) & and_dcpl_51;
  assign xx_rsci_wadr_d_mx0c10 = and_dcpl_32 & and_dcpl_105 & and_571_cse_1;
  assign yy_rsci_radr_d_mx0c0 = and_dcpl_32 & and_dcpl_82 & and_dcpl_38;
  assign and_nl = (fsm_output[1]) & (fsm_output[2]) & (fsm_output[6]) & (~ (fsm_output[4]))
      & (fsm_output[5]);
  assign nor_89_nl = ~((~ (fsm_output[2])) | (fsm_output[6]) | (~ (fsm_output[4]))
      | (fsm_output[5]));
  assign nor_90_nl = ~((fsm_output[2]) | (~ (fsm_output[6])) | (fsm_output[4]) |
      (fsm_output[5]));
  assign mux_167_nl = MUX_s_1_2_2(nor_89_nl, nor_90_nl, fsm_output[1]);
  assign mux_168_nl = MUX_s_1_2_2(and_nl, mux_167_nl, fsm_output[0]);
  assign yy_rsci_radr_d_mx0c1 = mux_168_nl & and_dcpl_51;
  assign mux_171_nl = MUX_s_1_2_2(or_tmp_103, or_tmp_158, fsm_output[1]);
  assign mux_172_nl = MUX_s_1_2_2(or_tmp_102, mux_171_nl, fsm_output[0]);
  assign yy_rsci_radr_d_mx0c3 = ~(mux_172_nl | (fsm_output[7]));
  assign yy_rsci_wadr_d_mx0c1 = and_dcpl_32 & and_dcpl_233;
  assign yy_rsci_wadr_d_mx0c4 = (~ mux_93_itm) & and_dcpl_163;
  assign or_175_nl = (fsm_output[6:2]!=5'b11001);
  assign mux_175_nl = MUX_s_1_2_2(or_tmp_163, or_175_nl, fsm_output[1]);
  assign mux_176_nl = MUX_s_1_2_2(or_tmp_165, mux_175_nl, fsm_output[0]);
  assign yy_rsci_wadr_d_mx0c5 = ~(mux_176_nl | (fsm_output[7]));
  assign mux_178_nl = MUX_s_1_2_2(mux_tmp_177, or_tmp_165, fsm_output[0]);
  assign yy_rsci_wadr_d_mx0c6 = ~(mux_178_nl | (fsm_output[7]));
  assign or_182_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (fsm_output[6]) | (~
      nor_tmp_28);
  assign mux_179_nl = MUX_s_1_2_2(or_182_nl, mux_tmp_177, fsm_output[0]);
  assign yy_rsci_wadr_d_mx0c7 = ~(mux_179_nl | (fsm_output[7]));
  assign yy_rsci_wadr_d_mx0c8 = (~ mux_93_itm) & and_dcpl_168;
  assign yy_rsci_wadr_d_mx0c9 = (~ mux_95_itm) & and_dcpl_51;
  assign or_230_nl = (~((fsm_output[2]) | (~ (fsm_output[6])))) | (fsm_output[3])
      | (fsm_output[7]) | (fsm_output[4]) | (fsm_output[5]);
  assign mux_241_nl = MUX_s_1_2_2(or_230_nl, mux_tmp_20, fsm_output[1]);
  assign or_229_nl = (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[7]) | (fsm_output[4])
      | (fsm_output[5]);
  assign or_228_nl = (fsm_output[7:2]!=6'b100000);
  assign mux_240_nl = MUX_s_1_2_2(or_229_nl, or_228_nl, fsm_output[1]);
  assign mux_242_itm = MUX_s_1_2_2(mux_241_nl, mux_240_nl, fsm_output[0]);
  assign nor_82_nl = ~((fsm_output[5:2]!=4'b0000));
  assign mux_243_cse = MUX_s_1_2_2(nor_82_nl, nor_tmp_34, fsm_output[1]);
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 = mux_243_cse & and_dcpl_257 & (fsm_output[0]);
  assign mux_246_nl = MUX_s_1_2_2(or_tmp_29, (~ nor_tmp_28), fsm_output[2]);
  assign mux_247_nl = MUX_s_1_2_2(or_tmp_40, mux_246_nl, fsm_output[1]);
  assign mux_244_nl = MUX_s_1_2_2(or_tmp_29, mux_tmp_232, fsm_output[2]);
  assign or_232_nl = (fsm_output[5:2]!=4'b0110);
  assign mux_245_nl = MUX_s_1_2_2(mux_244_nl, or_232_nl, fsm_output[1]);
  assign mux_248_nl = MUX_s_1_2_2(mux_247_nl, mux_245_nl, fsm_output[0]);
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c1 = ~(mux_248_nl | (fsm_output[7]));
  assign mux_249_nl = MUX_s_1_2_2(mux_tmp_39, or_tmp_221, fsm_output[1]);
  assign or_233_nl = (fsm_output[1]) | (~((fsm_output[2]) & (fsm_output[4]) & (fsm_output[5])));
  assign mux_250_nl = MUX_s_1_2_2(mux_249_nl, or_233_nl, fsm_output[0]);
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 = (~ mux_250_nl) & and_dcpl_51;
  assign S2_OUTER_LOOP_c_1_sva_mx0c1 = and_dcpl_65 & and_dcpl_262;
  assign S2_OUTER_LOOP_c_1_sva_mx0c2 = and_dcpl_265 & and_dcpl_264;
  assign S2_OUTER_LOOP_c_1_sva_mx0c3 = and_dcpl_265 & and_dcpl_153 & and_dcpl_41;
  assign or_248_nl = (fsm_output[0]) | mux_tmp_263;
  assign or_246_nl = (fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[4]) | (~
      (fsm_output[5]));
  assign mux_264_nl = MUX_s_1_2_2(mux_tmp_263, or_246_nl, fsm_output[0]);
  assign mux_265_nl = MUX_s_1_2_2(or_248_nl, mux_264_nl, and_20_cse);
  assign S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 = (~ mux_265_nl) & and_dcpl_51;
  assign or_251_nl = (~ (fsm_output[2])) | (fsm_output[4]) | (~ (fsm_output[5]));
  assign mux_267_nl = MUX_s_1_2_2(or_251_nl, or_tmp_221, fsm_output[1]);
  assign mux_268_nl = MUX_s_1_2_2(not_tmp_174, mux_267_nl, fsm_output[0]);
  assign or_249_nl = (~ (fsm_output[1])) | (fsm_output[2]) | (~ (fsm_output[4]))
      | (fsm_output[5]);
  assign mux_266_nl = MUX_s_1_2_2(not_tmp_174, or_249_nl, fsm_output[0]);
  assign mux_269_nl = MUX_s_1_2_2(mux_268_nl, mux_266_nl, z_out_4[2]);
  assign S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2 = (~ mux_269_nl) & and_dcpl_51;
  assign nor_75_nl = ~((fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[5])));
  assign nor_76_nl = ~((fsm_output[0]) | (~ (fsm_output[6])) | (fsm_output[5]));
  assign mux_281_nl = MUX_s_1_2_2(nor_75_nl, nor_76_nl, fsm_output[3]);
  assign nand_61_nl = ~((fsm_output[2]) & mux_281_nl);
  assign or_nl = (fsm_output[2]) | (fsm_output[3]) | (~((fsm_output[0]) & (fsm_output[6])
      & (fsm_output[5])));
  assign mux_282_nl = MUX_s_1_2_2(nand_61_nl, or_nl, fsm_output[4]);
  assign or_383_nl = (fsm_output[3]) | (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[5]));
  assign nor_79_nl = ~((fsm_output[6:5]!=2'b10));
  assign and_567_nl = (fsm_output[6:5]==2'b11);
  assign mux_279_nl = MUX_s_1_2_2(nor_79_nl, and_567_nl, fsm_output[0]);
  assign nand_37_nl = ~((fsm_output[3]) & mux_279_nl);
  assign mux_280_nl = MUX_s_1_2_2(or_383_nl, nand_37_nl, fsm_output[2]);
  assign or_388_nl = (fsm_output[4]) | mux_280_nl;
  assign mux_283_nl = MUX_s_1_2_2(mux_282_nl, or_388_nl, fsm_output[1]);
  assign mult_x_16_sva_mx0c1 = ~(mux_283_nl | (fsm_output[7]));
  assign mux_291_nl = MUX_s_1_2_2(or_tmp_31, or_tmp_250, fsm_output[2]);
  assign mux_285_nl = MUX_s_1_2_2(or_tmp_133, or_tmp_247, fsm_output[2]);
  assign mux_289_nl = MUX_s_1_2_2(or_tmp_46, or_tmp_30, fsm_output[6]);
  assign nand_14_nl = ~((fsm_output[2]) & (~ mux_289_nl));
  assign mux_290_nl = MUX_s_1_2_2(mux_285_nl, nand_14_nl, fsm_output[1]);
  assign mux_292_nl = MUX_s_1_2_2(mux_291_nl, mux_290_nl, fsm_output[0]);
  assign butterFly_12_tw_asn_itm_mx0c0 = ~(mux_292_nl | (fsm_output[7]));
  assign butterFly_12_tw_asn_itm_mx0c1 = and_dcpl_190 & and_dcpl_49 & (fsm_output[0])
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c2 = and_dcpl_190 & and_dcpl_49 & (fsm_output[0])
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c3 = and_dcpl_190 & and_1160_cse & (fsm_output[0])
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c4 = and_dcpl_190 & and_1160_cse & (fsm_output[0])
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c5 = and_dcpl_91 & and_1160_cse & (fsm_output[0])
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c6 = and_dcpl_91 & and_1160_cse & (fsm_output[0])
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c7 = and_dcpl_301 & and_dcpl_88 & (fsm_output[0])
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c8 = and_dcpl_301 & and_dcpl_88 & (fsm_output[0])
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c9 = and_dcpl_308 & and_dcpl_88 & (~ (fsm_output[0]))
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c10 = and_dcpl_308 & and_dcpl_88 & (~ (fsm_output[0]))
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c11 = and_dcpl_308 & and_dcpl_63 & (~ (fsm_output[0]))
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c12 = and_dcpl_308 & and_dcpl_63 & (~ (fsm_output[0]))
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c13 = and_dcpl_124 & and_dcpl_49 & (fsm_output[0])
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c14 = and_dcpl_124 & and_dcpl_49 & (fsm_output[0])
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c15 = and_dcpl_124 & and_1160_cse & (fsm_output[0])
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c16 = and_dcpl_124 & and_1160_cse & (fsm_output[0])
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c17 = and_dcpl_212 & and_1160_cse & (fsm_output[0])
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c18 = and_dcpl_212 & and_1160_cse & (fsm_output[0])
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c19 = and_dcpl_339 & and_dcpl_88 & (fsm_output[0])
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c20 = and_dcpl_339 & and_dcpl_88 & (fsm_output[0])
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c21 = and_dcpl_346 & and_dcpl_88 & (~ (fsm_output[0]))
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c22 = and_dcpl_346 & and_dcpl_88 & (~ (fsm_output[0]))
      & (~ z_out_12_32);
  assign butterFly_12_tw_asn_itm_mx0c23 = and_dcpl_346 & and_dcpl_63 & (~ (fsm_output[0]))
      & z_out_12_32;
  assign butterFly_12_tw_asn_itm_mx0c24 = and_dcpl_346 & and_dcpl_63 & (~ (fsm_output[0]))
      & (~ z_out_12_32);
  assign butterFly_13_tw_asn_itm_mx0c1 = and_dcpl_374 & and_dcpl_233;
  assign butterFly_13_tw_asn_itm_mx0c2 = and_dcpl_363 & and_dcpl_64;
  assign butterFly_13_tw_asn_itm_mx0c3 = and_dcpl_371 & and_dcpl_82 & nor_85_cse;
  assign butterFly_13_tw_asn_itm_mx0c4 = and_dcpl_374 & and_dcpl_171;
  assign butterFly_13_tw_asn_itm_mx0c5 = and_dcpl_371 & and_dcpl_153 & nor_85_cse;
  assign nand_29_nl = ~((fsm_output[0]) & (fsm_output[2]) & (fsm_output[5]) & (~
      (fsm_output[3])));
  assign mux_336_nl = MUX_s_1_2_2(nand_29_nl, or_tmp_289, fsm_output[6]);
  assign or_320_nl = (~ (fsm_output[6])) | (fsm_output[0]) | (fsm_output[2]) | (~
      (fsm_output[5])) | (fsm_output[3]);
  assign mux_337_nl = MUX_s_1_2_2(mux_336_nl, or_320_nl, fsm_output[4]);
  assign or_317_nl = (~ (fsm_output[2])) | (~ (fsm_output[5])) | (fsm_output[3]);
  assign or_316_nl = (fsm_output[2]) | (fsm_output[5]) | (fsm_output[3]);
  assign mux_334_nl = MUX_s_1_2_2(or_317_nl, or_316_nl, fsm_output[0]);
  assign mux_335_nl = MUX_s_1_2_2(or_tmp_289, mux_334_nl, fsm_output[6]);
  assign nand_17_nl = ~((fsm_output[4]) & (~ mux_335_nl));
  assign mux_338_nl = MUX_s_1_2_2(mux_337_nl, nand_17_nl, fsm_output[1]);
  assign butterFly_10_f1_sva_mx0c1 = ~(mux_338_nl | (fsm_output[7]));
  assign or_330_nl = (fsm_output[3:1]!=3'b000) | (~ and_581_cse);
  assign mux_346_nl = MUX_s_1_2_2(or_tmp_297, or_tmp_40, fsm_output[1]);
  assign mux_347_nl = MUX_s_1_2_2(or_330_nl, mux_346_nl, fsm_output[0]);
  assign butterFly_13_f1_sva_mx0c0 = ~(mux_347_nl | (fsm_output[7]));
  assign or_332_nl = (fsm_output[6:3]!=4'b1100);
  assign mux_348_nl = MUX_s_1_2_2(or_332_nl, or_tmp_250, fsm_output[2]);
  assign mux_349_nl = MUX_s_1_2_2(or_tmp_303, mux_348_nl, fsm_output[0]);
  assign butterFly_13_f1_sva_mx0c1 = (~ mux_349_nl) & (~ (fsm_output[7])) & (fsm_output[1]);
  assign mux_360_nl = MUX_s_1_2_2(or_tmp_105, or_tmp_158, fsm_output[1]);
  assign nand_26_nl = ~((fsm_output[2]) & (fsm_output[6]) & (~ (fsm_output[3])) &
      and_581_cse);
  assign or_271_nl = (fsm_output[2]) | (~ (fsm_output[6])) | (fsm_output[3]) | (~
      and_581_cse);
  assign mux_359_nl = MUX_s_1_2_2(nand_26_nl, or_271_nl, fsm_output[1]);
  assign mux_361_nl = MUX_s_1_2_2(mux_360_nl, mux_359_nl, fsm_output[0]);
  assign mult_x_2_sva_mx0c1 = ~(mux_361_nl | (fsm_output[7]));
  assign modulo_sub_10_mux_itm_mx0c1 = and_dcpl_182 & and_1160_cse & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c3 = and_dcpl_190 & and_dcpl_49 & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c5 = and_dcpl_190 & and_dcpl_49 & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c7 = and_dcpl_190 & and_1160_cse & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c9 = and_dcpl_91 & and_dcpl_88 & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c11 = and_dcpl_91 & and_1160_cse & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c13 = and_dcpl_91 & and_1160_cse & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c15 = and_dcpl_301 & and_dcpl_88 & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c17 = and_dcpl_198 & and_dcpl_88 & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c19 = and_dcpl_198 & and_1160_cse & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c21 = and_dcpl_308 & and_dcpl_88 & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c23 = and_dcpl_308 & and_dcpl_63 & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c25 = and_dcpl_115 & and_1160_cse & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c27 = and_dcpl_124 & and_dcpl_49 & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c29 = and_dcpl_124 & and_dcpl_49 & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c31 = and_dcpl_124 & and_1160_cse & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c33 = and_dcpl_212 & and_dcpl_88 & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c35 = and_dcpl_212 & and_1160_cse & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c37 = and_dcpl_212 & and_1160_cse & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c39 = and_dcpl_339 & and_dcpl_88 & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c41 = and_dcpl_132 & and_dcpl_88 & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c43 = and_dcpl_132 & and_1160_cse & (fsm_output[0])
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c45 = and_dcpl_346 & and_dcpl_88 & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign modulo_sub_10_mux_itm_mx0c47 = and_dcpl_346 & and_dcpl_63 & (~ (fsm_output[0]))
      & (~ (z_out_8[31]));
  assign nor_121_nl = ~((fsm_output[1]) | (fsm_output[4]));
  assign mux_384_nl = MUX_s_1_2_2((fsm_output[4]), nor_121_nl, fsm_output[0]);
  assign mult_x_10_sva_mx0c1 = mux_384_nl & (~ (fsm_output[5])) & and_dcpl_31 & and_dcpl_105;
  assign modulo_sub_10_and_ssc = core_wen & ((and_dcpl_182 & and_1160_cse & (~ (fsm_output[0]))
      & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c1 | (and_dcpl_190 & and_dcpl_49
      & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c3 | (and_dcpl_190
      & and_dcpl_49 & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c5
      | (and_dcpl_190 & and_1160_cse & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c7
      | (and_dcpl_91 & and_dcpl_88 & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c9
      | (and_dcpl_91 & and_1160_cse & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c11
      | (and_dcpl_91 & and_1160_cse & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c13
      | (and_dcpl_301 & and_dcpl_88 & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c15
      | (and_dcpl_198 & and_dcpl_88 & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c17
      | (and_dcpl_198 & and_1160_cse & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c19
      | (and_dcpl_308 & and_dcpl_88 & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c21
      | (and_dcpl_308 & and_dcpl_63 & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c23
      | (and_dcpl_115 & and_1160_cse & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c25
      | (and_dcpl_124 & and_dcpl_49 & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c27
      | (and_dcpl_124 & and_dcpl_49 & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c29
      | (and_dcpl_124 & and_1160_cse & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c31
      | (and_dcpl_212 & and_dcpl_88 & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c33
      | (and_dcpl_212 & and_1160_cse & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c35
      | (and_dcpl_212 & and_1160_cse & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c37
      | (and_dcpl_339 & and_dcpl_88 & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c39
      | (and_dcpl_132 & and_dcpl_88 & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c41
      | (and_dcpl_132 & and_1160_cse & (fsm_output[0]) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c43
      | (and_dcpl_346 & and_dcpl_88 & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c45
      | (and_dcpl_346 & and_dcpl_63 & (~ (fsm_output[0])) & (z_out_8[31])) | modulo_sub_10_mux_itm_mx0c47);
  assign S1_OUTER_LOOP_for_or_12_nl = (and_dcpl_91 & and_dcpl_88 & (~ (fsm_output[0]))
      & z_out_12_32) | (and_dcpl_91 & and_1160_cse & (~ (fsm_output[0])) & z_out_12_32)
      | (and_dcpl_115 & and_1160_cse & (~ (fsm_output[0])) & z_out_12_32) | (and_dcpl_124
      & and_dcpl_49 & (~ (fsm_output[0])) & z_out_12_32) | (and_dcpl_132 & and_dcpl_88
      & (fsm_output[0]) & z_out_12_32) | (and_dcpl_132 & and_1160_cse & (fsm_output[0])
      & z_out_12_32);
  assign S1_OUTER_LOOP_for_or_14_nl = (and_dcpl_91 & and_dcpl_88 & (~ (fsm_output[0]))
      & (~ z_out_12_32)) | (and_dcpl_91 & and_1160_cse & (~ (fsm_output[0])) & (~
      z_out_12_32)) | (and_dcpl_115 & and_1160_cse & (~ (fsm_output[0])) & (~ z_out_12_32))
      | (and_dcpl_124 & and_dcpl_49 & (~ (fsm_output[0])) & (~ z_out_12_32)) | (and_dcpl_132
      & and_dcpl_88 & (fsm_output[0]) & (~ z_out_12_32)) | (and_dcpl_132 & and_1160_cse
      & (fsm_output[0]) & (~ z_out_12_32));
  assign mux_78_nl = MUX_s_1_2_2(nand_64_cse, mux_76_cse, fsm_output[6]);
  assign nor_153_nl = ~(mux_78_nl | (fsm_output[7]));
  assign mux_80_nl = MUX_s_1_2_2(or_tmp_71, or_tmp_46, fsm_output[6]);
  assign or_391_nl = (fsm_output[2]) | mux_80_nl;
  assign or_392_nl = (fsm_output[6:3]!=4'b0101);
  assign or_393_nl = (fsm_output[6:3]!=4'b1010);
  assign mux_79_nl = MUX_s_1_2_2(or_392_nl, or_393_nl, fsm_output[2]);
  assign mux_81_nl = MUX_s_1_2_2(or_391_nl, mux_79_nl, fsm_output[1]);
  assign or_394_nl = (fsm_output[2]) | not_tmp_60;
  assign mux_82_nl = MUX_s_1_2_2(mux_81_nl, or_394_nl, fsm_output[0]);
  assign nor_152_nl = ~(mux_82_nl | (fsm_output[7]));
  assign and_107_nl = and_dcpl_32 & and_dcpl_105 & (fsm_output[0]) & z_out_11_32;
  assign and_110_nl = and_dcpl_32 & and_dcpl_105 & (fsm_output[0]) & (~ z_out_11_32);
  assign xx_rsci_d_d = MUX1HOT_v_32_7_2(yy_rsci_q_d, z_out_5, z_out_7, ({reg_modulo_sub_10_mux_ftd
      , reg_modulo_sub_10_mux_ftd_1}), butterFly_12_tw_asn_itm, z_out_9, z_out_6,
      {and_dcpl_86 , S1_OUTER_LOOP_for_or_12_nl , S1_OUTER_LOOP_for_or_14_nl , nor_153_nl
      , nor_152_nl , and_107_nl , and_110_nl});
  assign S2_COPY_LOOP_for_or_7_nl = xx_rsci_radr_d_mx0c0 | xx_rsci_radr_d_mx0c10
      | and_dcpl_145 | xx_rsci_radr_d_mx0c2 | and_dcpl_147 | and_dcpl_148 | xx_rsci_radr_d_mx0c5
      | xx_rsci_radr_d_mx0c6 | xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_mux1h_nl = MUX1HOT_v_5_3_2(S1_OUTER_LOOP_for_acc_cse_sva,
      ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}), S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
      {S2_COPY_LOOP_for_or_7_nl , xx_rsci_radr_d_mx0c8 , and_dcpl_157});
  assign S2_COPY_LOOP_for_or_8_nl = xx_rsci_radr_d_mx0c0 | and_dcpl_145 | xx_rsci_radr_d_mx0c2
      | and_dcpl_147 | and_dcpl_148 | xx_rsci_radr_d_mx0c5 | xx_rsci_radr_d_mx0c6
      | xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_mux1h_7_nl = MUX1HOT_v_2_4_2(S2_INNER_LOOP1_r_4_2_sva_1_0,
      (S1_OUTER_LOOP_for_acc_cse_sva[4:3]), ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg}), (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:3]),
      {S2_COPY_LOOP_for_or_8_nl , xx_rsci_radr_d_mx0c8 , and_dcpl_157 , xx_rsci_radr_d_mx0c10});
  assign S2_COPY_LOOP_for_mux1h_8_nl = MUX1HOT_v_3_9_2(3'b110, 3'b101, 3'b100, 3'b011,
      3'b010, 3'b001, (S1_OUTER_LOOP_for_acc_cse_sva[2:0]), reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg,
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[2:0]), {and_dcpl_145 , xx_rsci_radr_d_mx0c2
      , and_dcpl_147 , and_dcpl_148 , xx_rsci_radr_d_mx0c5 , xx_rsci_radr_d_mx0c6
      , xx_rsci_radr_d_mx0c8 , and_dcpl_157 , xx_rsci_radr_d_mx0c10});
  assign S2_COPY_LOOP_for_not_nl = ~ xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_and_2_nl = MUX_v_3_2_2(3'b000, S2_COPY_LOOP_for_mux1h_8_nl,
      S2_COPY_LOOP_for_not_nl);
  assign S2_COPY_LOOP_for_or_5_nl = MUX_v_3_2_2(S2_COPY_LOOP_for_and_2_nl, 3'b111,
      xx_rsci_radr_d_mx0c0);
  assign xx_rsci_radr_d = {S2_COPY_LOOP_for_mux1h_nl , S2_COPY_LOOP_for_mux1h_7_nl
      , S2_COPY_LOOP_for_or_5_nl};
  assign S2_COPY_LOOP_for_or_6_nl = and_dcpl_161 | and_dcpl_172 | and_dcpl_162 |
      xx_rsci_wadr_d_mx0c3 | xx_rsci_wadr_d_mx0c4 | xx_rsci_wadr_d_mx0c5 | xx_rsci_wadr_d_mx0c6
      | xx_rsci_wadr_d_mx0c7 | xx_rsci_wadr_d_mx0c8;
  assign S2_COPY_LOOP_for_mux1h_1_nl = MUX1HOT_v_5_3_2((z_out_3[4:0]), S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, {and_dcpl_86 , S2_COPY_LOOP_for_or_6_nl ,
      xx_rsci_wadr_d_mx0c10});
  assign S2_COPY_LOOP_for_mux1h_9_nl = MUX1HOT_s_1_3_2((revArr_rsci_s_din_mxwt[4]),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4]), reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg,
      {and_dcpl_86 , and_dcpl_172 , xx_rsci_wadr_d_mx0c10});
  assign S2_COPY_LOOP_for_or_nl = (S2_COPY_LOOP_for_mux1h_9_nl & (~(and_dcpl_161
      | xx_rsci_wadr_d_mx0c3 | xx_rsci_wadr_d_mx0c5 | xx_rsci_wadr_d_mx0c7))) | and_dcpl_162
      | xx_rsci_wadr_d_mx0c4 | xx_rsci_wadr_d_mx0c6 | xx_rsci_wadr_d_mx0c8;
  assign S2_COPY_LOOP_for_or_9_nl = and_dcpl_161 | and_dcpl_162 | xx_rsci_wadr_d_mx0c3
      | xx_rsci_wadr_d_mx0c4 | xx_rsci_wadr_d_mx0c5 | xx_rsci_wadr_d_mx0c6 | xx_rsci_wadr_d_mx0c7
      | xx_rsci_wadr_d_mx0c8;
  assign S2_COPY_LOOP_for_mux1h_10_nl = MUX1HOT_v_2_4_2((revArr_rsci_s_din_mxwt[3:2]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[3:2]), ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])}), {and_dcpl_86 , S2_COPY_LOOP_for_or_9_nl
      , and_dcpl_172 , xx_rsci_wadr_d_mx0c10});
  assign S2_COPY_LOOP_for_or_2_nl = xx_rsci_wadr_d_mx0c5 | xx_rsci_wadr_d_mx0c6;
  assign S2_COPY_LOOP_for_or_3_nl = xx_rsci_wadr_d_mx0c7 | xx_rsci_wadr_d_mx0c8;
  assign S2_COPY_LOOP_for_mux1h_11_nl = MUX1HOT_v_2_5_2((revArr_rsci_s_din_mxwt[1:0]),
      2'b01, 2'b10, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]), (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1:0]),
      {and_dcpl_86 , S2_COPY_LOOP_for_or_2_nl , S2_COPY_LOOP_for_or_3_nl , and_dcpl_172
      , xx_rsci_wadr_d_mx0c10});
  assign S2_COPY_LOOP_for_nor_1_nl = ~(xx_rsci_wadr_d_mx0c3 | xx_rsci_wadr_d_mx0c4);
  assign S2_COPY_LOOP_for_and_1_nl = MUX_v_2_2_2(2'b00, S2_COPY_LOOP_for_mux1h_11_nl,
      S2_COPY_LOOP_for_nor_1_nl);
  assign S2_COPY_LOOP_for_or_4_nl = and_dcpl_161 | and_dcpl_162;
  assign S2_COPY_LOOP_for_or_1_nl = MUX_v_2_2_2(S2_COPY_LOOP_for_and_1_nl, 2'b11,
      S2_COPY_LOOP_for_or_4_nl);
  assign xx_rsci_wadr_d = {S2_COPY_LOOP_for_mux1h_1_nl , S2_COPY_LOOP_for_or_nl ,
      S2_COPY_LOOP_for_mux1h_10_nl , S2_COPY_LOOP_for_or_1_nl};
  assign nor_95_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[6])) | (fsm_output[4]));
  assign nor_96_nl = ~((fsm_output[1]) | (~ nor_tmp_10));
  assign mux_118_nl = MUX_s_1_2_2(nor_95_nl, nor_96_nl, fsm_output[3]);
  assign mux_116_nl = MUX_s_1_2_2(nor_tmp_10, mux_tmp_110, and_571_cse_1);
  assign nor_97_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[6])) | (fsm_output[4]));
  assign mux_117_nl = MUX_s_1_2_2(mux_116_nl, nor_97_nl, fsm_output[3]);
  assign mux_119_nl = MUX_s_1_2_2(mux_118_nl, mux_117_nl, fsm_output[2]);
  assign nor_98_nl = ~((fsm_output[0]) | (~ nor_tmp_10));
  assign mux_113_nl = MUX_s_1_2_2(mux_tmp_111, nor_98_nl, fsm_output[1]);
  assign mux_114_nl = MUX_s_1_2_2(mux_113_nl, mux_tmp_110, fsm_output[3]);
  assign and_584_nl = (fsm_output[1]) & mux_tmp_111;
  assign nor_99_nl = ~((fsm_output[1:0]!=2'b00) | (~ nor_tmp_10));
  assign mux_112_nl = MUX_s_1_2_2(and_584_nl, nor_99_nl, fsm_output[3]);
  assign mux_115_nl = MUX_s_1_2_2(mux_114_nl, mux_112_nl, fsm_output[2]);
  assign mux_120_nl = MUX_s_1_2_2(mux_119_nl, mux_115_nl, fsm_output[5]);
  assign xx_rsci_we_d_pff = mux_120_nl & (~ (fsm_output[7]));
  assign or_149_nl = (~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[5]);
  assign mux_127_nl = MUX_s_1_2_2(or_tmp_135, or_tmp_134, or_149_nl);
  assign nor_22_nl = ~((fsm_output[1]) | (~ (fsm_output[5])));
  assign mux_126_nl = MUX_s_1_2_2(or_tmp_135, or_tmp_134, nor_22_nl);
  assign mux_128_nl = MUX_s_1_2_2(mux_127_nl, mux_126_nl, fsm_output[2]);
  assign mux_122_nl = MUX_s_1_2_2((fsm_output[4]), (~ (fsm_output[4])), fsm_output[3]);
  assign or_145_nl = (fsm_output[5]) | mux_122_nl;
  assign mux_123_nl = MUX_s_1_2_2(or_tmp_133, or_145_nl, fsm_output[1]);
  assign nor_94_nl = ~((fsm_output[5]) | (~ nor_tmp_21));
  assign mux_121_nl = MUX_s_1_2_2(nor_94_nl, nor_tmp_21, fsm_output[1]);
  assign mux_124_nl = MUX_s_1_2_2(mux_123_nl, (~ mux_121_nl), fsm_output[0]);
  assign mux_125_nl = MUX_s_1_2_2(or_tmp_133, mux_124_nl, fsm_output[2]);
  assign mux_129_nl = MUX_s_1_2_2(mux_128_nl, mux_125_nl, fsm_output[6]);
  assign or_143_nl = (fsm_output[6:0]!=7'b0000000);
  assign mux_130_nl = MUX_s_1_2_2(mux_129_nl, or_143_nl, fsm_output[7]);
  assign xx_rsci_readA_r_ram_ir_internal_RMASK_B_d = ~ mux_130_nl;
  assign and_179_nl = and_dcpl_32 & and_dcpl_177;
  assign S1_OUTER_LOOP_for_or_11_nl = (and_dcpl_182 & and_1160_cse & (~ (fsm_output[0]))
      & z_out_12_32) | (and_dcpl_190 & and_dcpl_49 & (~ (fsm_output[0])) & z_out_12_32)
      | (and_dcpl_198 & and_dcpl_88 & (fsm_output[0]) & z_out_12_32) | (and_dcpl_198
      & and_1160_cse & (fsm_output[0]) & z_out_12_32) | (and_dcpl_212 & and_dcpl_88
      & (~ (fsm_output[0])) & z_out_12_32) | (and_dcpl_212 & and_1160_cse & (~ (fsm_output[0]))
      & z_out_12_32);
  assign S1_OUTER_LOOP_for_or_13_nl = (and_dcpl_182 & and_1160_cse & (~ (fsm_output[0]))
      & (~ z_out_12_32)) | (and_dcpl_190 & and_dcpl_49 & (~ (fsm_output[0])) & (~
      z_out_12_32)) | (and_dcpl_198 & and_dcpl_88 & (fsm_output[0]) & (~ z_out_12_32))
      | (and_dcpl_198 & and_1160_cse & (fsm_output[0]) & (~ z_out_12_32)) | (and_dcpl_212
      & and_dcpl_88 & (~ (fsm_output[0])) & (~ z_out_12_32)) | (and_dcpl_212 & and_1160_cse
      & (~ (fsm_output[0])) & (~ z_out_12_32));
  assign mux_162_nl = MUX_s_1_2_2(mux_76_cse, nand_64_cse, fsm_output[6]);
  assign nor_142_nl = ~(mux_162_nl | (fsm_output[7]));
  assign mux_164_nl = MUX_s_1_2_2(or_tmp_46, or_tmp_71, fsm_output[6]);
  assign or_163_nl = (fsm_output[2]) | mux_164_nl;
  assign nand_71_nl = ~((fsm_output[6:3]==4'b1101));
  assign mux_163_nl = MUX_s_1_2_2(nand_71_nl, or_tmp_147, fsm_output[2]);
  assign mux_165_nl = MUX_s_1_2_2(or_163_nl, mux_163_nl, fsm_output[1]);
  assign or_159_nl = (fsm_output[2]) | (fsm_output[6]) | (~ nor_tmp_28);
  assign mux_166_nl = MUX_s_1_2_2(mux_165_nl, or_159_nl, fsm_output[0]);
  assign nor_141_nl = ~(mux_166_nl | (fsm_output[7]));
  assign yy_rsci_d_d = MUX1HOT_v_32_6_2(x_rsci_s_din_mxwt, z_out_5, z_out_7, ({reg_modulo_sub_10_mux_ftd
      , reg_modulo_sub_10_mux_ftd_1}), butterFly_12_tw_asn_itm, xx_rsci_q_d, {and_179_nl
      , S1_OUTER_LOOP_for_or_11_nl , S1_OUTER_LOOP_for_or_13_nl , nor_142_nl , nor_141_nl
      , and_dcpl_209});
  assign S1_OUTER_LOOP_for_or_8_nl = yy_rsci_radr_d_mx0c1 | and_dcpl_232 | and_dcpl_226
      | yy_rsci_radr_d_mx0c3 | and_dcpl_161 | and_dcpl_162 | and_dcpl_228 | and_dcpl_229
      | and_dcpl_230;
  assign S1_OUTER_LOOP_for_mux1h_2_nl = MUX1HOT_v_5_3_2(({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}),
      S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0, {yy_rsci_radr_d_mx0c0
      , S1_OUTER_LOOP_for_or_8_nl , and_dcpl_85});
  assign S1_OUTER_LOOP_for_or_9_nl = yy_rsci_radr_d_mx0c1 | and_dcpl_226 | yy_rsci_radr_d_mx0c3
      | and_dcpl_161 | and_dcpl_162 | and_dcpl_228 | and_dcpl_229 | and_dcpl_230;
  assign S1_OUTER_LOOP_for_mux1h_7_nl = MUX1HOT_v_2_4_2((S1_OUTER_LOOP_for_acc_cse_sva[4:3]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg}),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:3]), {yy_rsci_radr_d_mx0c0 , S1_OUTER_LOOP_for_or_9_nl
      , and_dcpl_85 , and_dcpl_232});
  assign S1_OUTER_LOOP_for_mux1h_8_nl = MUX1HOT_v_3_9_2((S1_OUTER_LOOP_for_acc_cse_sva[2:0]),
      3'b110, 3'b101, 3'b100, 3'b011, 3'b010, 3'b001, reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg,
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[2:0]), {yy_rsci_radr_d_mx0c0 , and_dcpl_226
      , yy_rsci_radr_d_mx0c3 , and_dcpl_161 , and_dcpl_162 , and_dcpl_228 , and_dcpl_229
      , and_dcpl_85 , and_dcpl_232});
  assign S1_OUTER_LOOP_for_not_1_nl = ~ and_dcpl_230;
  assign S1_OUTER_LOOP_for_and_3_nl = MUX_v_3_2_2(3'b000, S1_OUTER_LOOP_for_mux1h_8_nl,
      S1_OUTER_LOOP_for_not_1_nl);
  assign S1_OUTER_LOOP_for_or_6_nl = MUX_v_3_2_2(S1_OUTER_LOOP_for_and_3_nl, 3'b111,
      yy_rsci_radr_d_mx0c1);
  assign yy_rsci_radr_d = {S1_OUTER_LOOP_for_mux1h_2_nl , S1_OUTER_LOOP_for_mux1h_7_nl
      , S1_OUTER_LOOP_for_or_6_nl};
  assign S1_OUTER_LOOP_for_or_7_nl = and_dcpl_40 | and_dcpl_147 | and_dcpl_148 |
      yy_rsci_wadr_d_mx0c4 | yy_rsci_wadr_d_mx0c5 | yy_rsci_wadr_d_mx0c6 | yy_rsci_wadr_d_mx0c7
      | yy_rsci_wadr_d_mx0c8 | yy_rsci_wadr_d_mx0c9;
  assign S1_OUTER_LOOP_for_mux1h_3_nl = MUX1HOT_v_5_3_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, (z_out_3[4:0]), {S1_OUTER_LOOP_for_or_7_nl
      , yy_rsci_wadr_d_mx0c1 , and_dcpl_209});
  assign S1_OUTER_LOOP_for_mux1h_9_nl = MUX1HOT_s_1_3_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4]),
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg, (revArr_rsci_s_din_mxwt[4]), {and_dcpl_40
      , yy_rsci_wadr_d_mx0c1 , and_dcpl_209});
  assign S1_OUTER_LOOP_for_or_1_nl = (S1_OUTER_LOOP_for_mux1h_9_nl & (~(and_dcpl_147
      | yy_rsci_wadr_d_mx0c4 | yy_rsci_wadr_d_mx0c6 | yy_rsci_wadr_d_mx0c8))) | and_dcpl_148
      | yy_rsci_wadr_d_mx0c5 | yy_rsci_wadr_d_mx0c7 | yy_rsci_wadr_d_mx0c9;
  assign S1_OUTER_LOOP_for_or_10_nl = and_dcpl_147 | and_dcpl_148 | yy_rsci_wadr_d_mx0c4
      | yy_rsci_wadr_d_mx0c5 | yy_rsci_wadr_d_mx0c6 | yy_rsci_wadr_d_mx0c7 | yy_rsci_wadr_d_mx0c8
      | yy_rsci_wadr_d_mx0c9;
  assign S1_OUTER_LOOP_for_mux1h_10_nl = MUX1HOT_v_2_4_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[3:2]),
      ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])}),
      S2_INNER_LOOP1_r_4_2_sva_1_0, (revArr_rsci_s_din_mxwt[3:2]), {and_dcpl_40 ,
      yy_rsci_wadr_d_mx0c1 , S1_OUTER_LOOP_for_or_10_nl , and_dcpl_209});
  assign S1_OUTER_LOOP_for_or_3_nl = yy_rsci_wadr_d_mx0c6 | yy_rsci_wadr_d_mx0c7;
  assign S1_OUTER_LOOP_for_or_4_nl = yy_rsci_wadr_d_mx0c8 | yy_rsci_wadr_d_mx0c9;
  assign S1_OUTER_LOOP_for_mux1h_11_nl = MUX1HOT_v_2_5_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]),
      (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1:0]), 2'b01, 2'b10, (revArr_rsci_s_din_mxwt[1:0]),
      {and_dcpl_40 , yy_rsci_wadr_d_mx0c1 , S1_OUTER_LOOP_for_or_3_nl , S1_OUTER_LOOP_for_or_4_nl
      , and_dcpl_209});
  assign S1_OUTER_LOOP_for_nor_2_nl = ~(yy_rsci_wadr_d_mx0c4 | yy_rsci_wadr_d_mx0c5);
  assign S1_OUTER_LOOP_for_and_2_nl = MUX_v_2_2_2(2'b00, S1_OUTER_LOOP_for_mux1h_11_nl,
      S1_OUTER_LOOP_for_nor_2_nl);
  assign S1_OUTER_LOOP_for_or_5_nl = and_dcpl_147 | and_dcpl_148;
  assign S1_OUTER_LOOP_for_or_2_nl = MUX_v_2_2_2(S1_OUTER_LOOP_for_and_2_nl, 2'b11,
      S1_OUTER_LOOP_for_or_5_nl);
  assign yy_rsci_wadr_d = {S1_OUTER_LOOP_for_mux1h_3_nl , S1_OUTER_LOOP_for_or_1_nl
      , S1_OUTER_LOOP_for_mux1h_10_nl , S1_OUTER_LOOP_for_or_2_nl};
  assign or_191_nl = (fsm_output[1]) | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_188_nl = MUX_s_1_2_2(or_tmp_175, or_191_nl, fsm_output[3]);
  assign mux_186_nl = MUX_s_1_2_2(or_68_cse, mux_tmp_110, and_571_cse_1);
  assign mux_187_nl = MUX_s_1_2_2(mux_186_nl, or_tmp_175, fsm_output[3]);
  assign mux_189_nl = MUX_s_1_2_2(mux_188_nl, mux_187_nl, fsm_output[2]);
  assign or_187_nl = (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_183_nl = MUX_s_1_2_2(mux_tmp_181, or_187_nl, fsm_output[1]);
  assign mux_184_nl = MUX_s_1_2_2(mux_183_nl, mux_tmp_110, fsm_output[3]);
  assign nand_7_nl = ~((fsm_output[1]) & (~ mux_tmp_181));
  assign or_184_nl = (fsm_output[1]) | (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_182_nl = MUX_s_1_2_2(nand_7_nl, or_184_nl, fsm_output[3]);
  assign mux_185_nl = MUX_s_1_2_2(mux_184_nl, mux_182_nl, fsm_output[2]);
  assign mux_190_nl = MUX_s_1_2_2(mux_189_nl, mux_185_nl, fsm_output[5]);
  assign yy_rsci_we_d_pff = ~(mux_190_nl | (fsm_output[7]));
  assign or_197_nl = (fsm_output[3]) | (~ (fsm_output[6]));
  assign mux_201_nl = MUX_s_1_2_2(or_197_nl, or_tmp_179, fsm_output[5]);
  assign mux_202_nl = MUX_s_1_2_2(mux_201_nl, mux_tmp_192, fsm_output[2]);
  assign mux_198_nl = MUX_s_1_2_2(or_196_cse, mux_151_cse, fsm_output[3]);
  assign mux_199_nl = MUX_s_1_2_2(mux_198_nl, or_tmp_181, fsm_output[5]);
  assign mux_200_nl = MUX_s_1_2_2(mux_tmp_195, mux_199_nl, fsm_output[2]);
  assign mux_203_nl = MUX_s_1_2_2(mux_202_nl, mux_200_nl, fsm_output[1]);
  assign mux_194_nl = MUX_s_1_2_2(nand_tmp_8, or_tmp_182, fsm_output[5]);
  assign mux_196_nl = MUX_s_1_2_2(mux_tmp_195, mux_194_nl, fsm_output[2]);
  assign mux_193_nl = MUX_s_1_2_2(mux_tmp_192, nand_tmp_8, fsm_output[2]);
  assign mux_197_nl = MUX_s_1_2_2(mux_196_nl, mux_193_nl, fsm_output[1]);
  assign mux_204_nl = MUX_s_1_2_2(mux_203_nl, mux_197_nl, fsm_output[0]);
  assign yy_rsci_readA_r_ram_ir_internal_RMASK_B_d = ~(mux_204_nl | (fsm_output[7]));
  assign and_dcpl_560 = ~((fsm_output[3:2]!=2'b00));
  assign and_dcpl_564 = and_dcpl_23 & (fsm_output[7:6]==2'b01);
  assign and_dcpl_565 = and_dcpl_564 & and_dcpl_560 & (fsm_output[1:0]==2'b00);
  assign and_dcpl_568 = and_dcpl_564 & and_dcpl_560 & (fsm_output[1:0]==2'b01);
  assign and_dcpl_570 = (~ (fsm_output[7])) & (fsm_output[3]) & (fsm_output[2]);
  assign and_dcpl_571 = (~ mux_86_cse) & and_dcpl_570;
  assign and_dcpl_576 = (~ mux_170_cse) & and_dcpl_570;
  assign and_dcpl_581 = (fsm_output[5:4]==2'b10) & and_dcpl_31;
  assign and_dcpl_582 = and_dcpl_581 & (fsm_output[2:0]==3'b101);
  assign and_dcpl_587 = (fsm_output[5:4]==2'b00) & and_dcpl_31;
  assign and_dcpl_588 = and_dcpl_587 & and_dcpl_105 & nor_85_cse;
  assign and_dcpl_591 = and_dcpl_587 & and_dcpl_105 & and_dcpl_38;
  assign and_dcpl_598 = and_dcpl_371 & (fsm_output[6]) & (fsm_output[2]) & and_dcpl_38;
  assign and_dcpl_603 = (fsm_output[5:4]==2'b01) & and_dcpl_31;
  assign and_dcpl_604 = and_dcpl_603 & and_dcpl_1 & (fsm_output[1:0]==2'b11);
  assign and_dcpl_607 = and_dcpl_581 & and_dcpl_63 & (fsm_output[0]);
  assign and_dcpl_610 = and_dcpl_603 & and_dcpl_105 & and_dcpl_41;
  assign and_dcpl_612 = mux_tmp_102 & and_dcpl_31 & (~ (fsm_output[2]));
  assign nor_240_nl = ~((~ (fsm_output[2])) | (fsm_output[6]) | (~ (fsm_output[5]))
      | (fsm_output[4]));
  assign nor_241_nl = ~((fsm_output[2]) | (~ (fsm_output[6])) | (fsm_output[5]) |
      (~ (fsm_output[4])));
  assign mux_414_nl = MUX_s_1_2_2(nor_240_nl, nor_241_nl, fsm_output[1]);
  assign nor_242_nl = ~((fsm_output[1]) | nand_45_cse);
  assign mux_415_nl = MUX_s_1_2_2(mux_414_nl, nor_242_nl, fsm_output[0]);
  assign and_dcpl_613 = mux_415_nl & and_dcpl_31;
  assign and_dcpl_615 = and_dcpl_371 & and_dcpl_1 & and_dcpl_38;
  assign and_dcpl_618 = and_dcpl_581 & (fsm_output[2:0]==3'b001);
  assign nor_238_nl = ~((fsm_output[4:3]!=2'b01));
  assign nor_239_nl = ~((fsm_output[6]) | (fsm_output[3]) | (~ (fsm_output[4])));
  assign mux_416_nl = MUX_s_1_2_2(nor_238_nl, nor_239_nl, fsm_output[2]);
  assign and_dcpl_621 = mux_416_nl & (fsm_output[5]) & (~ (fsm_output[7])) & nor_85_cse;
  assign or_tmp_361 = (~ (fsm_output[0])) | (fsm_output[1]) | (~ (fsm_output[3]));
  assign or_525_nl = (fsm_output[4]) | (~ (fsm_output[0])) | (~ (fsm_output[6]))
      | (fsm_output[3]);
  assign or_526_nl = (fsm_output[1]) | (~ (fsm_output[6])) | (fsm_output[3]);
  assign nor_236_nl = ~((fsm_output[1]) | and_dcpl_90);
  assign mux_421_nl = MUX_s_1_2_2(or_526_nl, nor_236_nl, fsm_output[0]);
  assign mux_422_nl = MUX_s_1_2_2(or_tmp_361, mux_421_nl, fsm_output[4]);
  assign mux_423_nl = MUX_s_1_2_2(or_525_nl, mux_422_nl, fsm_output[2]);
  assign mux_418_nl = MUX_s_1_2_2((fsm_output[3]), (~ (fsm_output[3])), fsm_output[1]);
  assign or_420_nl = (fsm_output[0]) | mux_418_nl;
  assign mux_419_nl = MUX_s_1_2_2(or_tmp_361, or_420_nl, fsm_output[4]);
  assign or_419_nl = (fsm_output[0]) | (~ (fsm_output[1])) | (fsm_output[3]);
  assign or_418_nl = (~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[3]);
  assign mux_417_nl = MUX_s_1_2_2(or_419_nl, or_418_nl, fsm_output[4]);
  assign mux_420_nl = MUX_s_1_2_2(mux_419_nl, mux_417_nl, fsm_output[2]);
  assign mux_424_nl = MUX_s_1_2_2(mux_423_nl, mux_420_nl, fsm_output[5]);
  assign and_dcpl_622 = ~(mux_424_nl | (fsm_output[7]));
  assign or_538_nl = (fsm_output[1]) | (fsm_output[2]) | (fsm_output[3]) | (~ (fsm_output[5]));
  assign or_539_nl = (~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[6])
      | (~ (fsm_output[3])) | (fsm_output[5]);
  assign mux_425_nl = MUX_s_1_2_2(or_538_nl, or_539_nl, fsm_output[0]);
  assign and_dcpl_624 = ~(mux_425_nl | (fsm_output[4]) | (fsm_output[7]));
  assign or_431_nl = (~ (fsm_output[2])) | (fsm_output[6]) | (~ and_581_cse);
  assign mux_427_nl = MUX_s_1_2_2(mux_388_cse, or_431_nl, fsm_output[0]);
  assign and_dcpl_626 = (~ mux_427_nl) & and_dcpl_31 & (~ (fsm_output[1]));
  assign nor_232_cse = ~((fsm_output[5:4]!=2'b10));
  assign nor_231_nl = ~((fsm_output[5:4]!=2'b01));
  assign mux_428_nl = MUX_s_1_2_2(nor_231_nl, nor_232_cse, fsm_output[6]);
  assign nor_233_nl = ~((fsm_output[6]) | (~ and_581_cse));
  assign mux_429_nl = MUX_s_1_2_2(mux_428_nl, nor_233_nl, fsm_output[0]);
  assign and_dcpl_628 = mux_429_nl & and_dcpl_31 & and_dcpl_63;
  assign nor_228_nl = ~((~ (fsm_output[6])) | (fsm_output[3]) | (~ and_581_cse));
  assign nor_229_nl = ~((fsm_output[6:3]!=4'b0001));
  assign mux_430_nl = MUX_s_1_2_2(nor_228_nl, nor_229_nl, fsm_output[2]);
  assign nor_230_nl = ~((fsm_output[6:2]!=5'b10011));
  assign mux_431_nl = MUX_s_1_2_2(mux_430_nl, nor_230_nl, fsm_output[0]);
  assign and_dcpl_630 = mux_431_nl & (~ (fsm_output[7])) & (fsm_output[1]);
  assign and_dcpl_632 = and_dcpl_371 & and_dcpl_1 & and_dcpl_41;
  assign nor_226_nl = ~((fsm_output[5:1]!=5'b00111));
  assign nor_227_nl = ~((fsm_output[3:1]!=3'b000) | (~ and_581_cse));
  assign mux_432_nl = MUX_s_1_2_2(nor_226_nl, nor_227_nl, fsm_output[0]);
  assign and_dcpl_634 = mux_432_nl & (fsm_output[7:6]==2'b01);
  assign or_536_nl = (fsm_output[5:2]!=4'b1001);
  assign mux_433_cse = MUX_s_1_2_2(or_tmp_112, or_536_nl, fsm_output[1]);
  assign nand_83_nl = ~((fsm_output[5:3]==3'b111));
  assign mux_434_nl = MUX_s_1_2_2(nand_83_nl, or_tmp_147, fsm_output[2]);
  assign or_534_nl = (fsm_output[1]) | mux_434_nl;
  assign mux_435_nl = MUX_s_1_2_2(or_534_nl, mux_433_cse, fsm_output[0]);
  assign and_dcpl_635 = ~(mux_435_nl | (fsm_output[7]));
  assign mux_436_nl = MUX_s_1_2_2(nand_44_cse, (fsm_output[6]), fsm_output[1]);
  assign and_dcpl_639 = (~ mux_436_nl) & (fsm_output[4]) & and_dcpl_31 & (fsm_output[2])
      & (~ (fsm_output[0]));
  assign and_dcpl_654 = mux_243_cse & (~ (fsm_output[7])) & (~ (fsm_output[6])) &
      (fsm_output[0]);
  assign and_dcpl_660 = and_dcpl_23 & (~ (fsm_output[7])) & (~ (fsm_output[3])) &
      (fsm_output[2]) & (fsm_output[1]) & (fsm_output[0]);
  assign nor_215_nl = ~((~ (fsm_output[3])) | (fsm_output[7]));
  assign mux_441_nl = MUX_s_1_2_2(nor_215_nl, and_dcpl_31, fsm_output[2]);
  assign nor_217_nl = ~((fsm_output[2]) | (fsm_output[6]) | (fsm_output[3]) | (~
      (fsm_output[7])));
  assign mux_442_nl = MUX_s_1_2_2(mux_441_nl, nor_217_nl, fsm_output[1]);
  assign and_dcpl_662 = mux_442_nl & and_dcpl_23 & (fsm_output[0]);
  assign and_1139_nl = (fsm_output[1]) & (fsm_output[2]) & (fsm_output[4]) & (fsm_output[5]);
  assign nor_213_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (~ (fsm_output[5])));
  assign nor_214_nl = ~((fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[5]));
  assign mux_444_nl = MUX_s_1_2_2(nor_213_nl, nor_214_nl, fsm_output[1]);
  assign mux_445_nl = MUX_s_1_2_2(and_1139_nl, mux_444_nl, fsm_output[0]);
  assign and_dcpl_666 = mux_445_nl & (~ (fsm_output[7])) & (fsm_output[3]);
  assign or_470_nl = (~ (fsm_output[6])) | (fsm_output[5]) | (~ (fsm_output[0]));
  assign or_468_nl = (~ (fsm_output[1])) | (~ (fsm_output[5])) | (fsm_output[0]);
  assign mux_450_nl = MUX_s_1_2_2(or_470_nl, or_468_nl, fsm_output[2]);
  assign or_531_nl = (fsm_output[3]) | mux_450_nl;
  assign nor_209_nl = ~((fsm_output[1]) | (fsm_output[5]) | (~ (fsm_output[0])));
  assign nor_210_nl = ~((fsm_output[5]) | (fsm_output[0]));
  assign and_1124_nl = (fsm_output[5]) & (fsm_output[0]);
  assign mux_447_nl = MUX_s_1_2_2(nor_210_nl, and_1124_nl, fsm_output[1]);
  assign mux_448_nl = MUX_s_1_2_2(nor_209_nl, mux_447_nl, fsm_output[6]);
  assign nand_88_nl = ~((fsm_output[2]) & mux_448_nl);
  assign or_532_nl = (fsm_output[2]) | (fsm_output[6]) | (~ (fsm_output[1])) | (~
      (fsm_output[5])) | (fsm_output[0]);
  assign mux_449_nl = MUX_s_1_2_2(nand_88_nl, or_532_nl, fsm_output[3]);
  assign mux_451_nl = MUX_s_1_2_2(or_531_nl, mux_449_nl, fsm_output[4]);
  assign nor_261_cse = ~(mux_451_nl | (fsm_output[7]));
  assign and_793_cse = (fsm_output[4]) & (~ (fsm_output[7])) & (~ (fsm_output[3]))
      & (~ (fsm_output[6])) & (fsm_output[2]) & (fsm_output[1]) & (fsm_output[0]);
  assign and_dcpl_762 = and_dcpl_82 & and_dcpl_38;
  assign and_dcpl_765 = (fsm_output[5:4]==2'b00) & and_dcpl_51;
  assign and_dcpl_780 = and_dcpl_1 & nor_85_cse;
  assign and_dcpl_786 = and_dcpl_1 & and_dcpl_41;
  assign and_dcpl_807 = and_dcpl_105 & nor_85_cse;
  assign or_542_nl = (fsm_output[3]) | (fsm_output[5]);
  assign mux_457_nl = MUX_s_1_2_2(nand_69_cse, or_542_nl, fsm_output[2]);
  assign and_dcpl_887 = ~(mux_457_nl | (~ (fsm_output[4])) | (fsm_output[7]) | (fsm_output[6])
      | (fsm_output[1]) | (fsm_output[0]));
  assign mux_464_nl = MUX_s_1_2_2(or_tmp_114, mux_433_cse, fsm_output[0]);
  assign and_dcpl_901 = ~(mux_464_nl | (fsm_output[7]));
  assign or_478_nl = (fsm_output[5:2]!=4'b1010);
  assign mux_465_nl = MUX_s_1_2_2(or_478_nl, or_tmp_112, fsm_output[1]);
  assign mux_466_nl = MUX_s_1_2_2(or_131_cse, mux_465_nl, fsm_output[0]);
  assign and_dcpl_902 = ~(mux_466_nl | (fsm_output[7]));
  assign and_699_ssc = (~ (fsm_output[5])) & (fsm_output[4]) & (~ (fsm_output[7]))
      & (fsm_output[3]) & (fsm_output[2]) & (~ (fsm_output[1])) & (~ (fsm_output[0]));
  always @(posedge clk) begin
    if ( core_wen & (mux_17_nl | (fsm_output[7])) ) begin
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
          and_dcpl_43);
      x_rsci_s_waddr_core_9_5 <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
          and_dcpl_43);
      x_rsci_s_dout_core <= xx_rsci_q_d;
      reg_twiddle_rsci_s_raddr_core_1_cse <= ((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1])
          & (~(mux_42_nl | or_dcpl_9))) | (and_dcpl_61 & and_558_cse);
      reg_twiddle_rsci_s_raddr_core_2_cse <= MUX1HOT_s_1_4_2((butterFly_tw_and_cse_3_2_sva_1[0]),
          butterFly_12_tw_and_cse_3_2_sva_0, butterFly_4_tw_and_cse_2_sva_mx0w2,
          (S2_INNER_LOOP1_r_4_2_sva_1_0[0]), {and_dcpl_66 , butterFly_tw_h_or_2_nl
          , and_54_nl , and_dcpl_71});
      reg_twiddle_rsci_s_raddr_core_0_cse <= ((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[0])
          & (~(mux_49_nl | (fsm_output[7])))) | (not_tmp_38 & and_dcpl_70 & (~ (fsm_output[0])));
      reg_twiddle_rsci_s_raddr_core_3_cse <= MUX1HOT_s_1_4_2((butterFly_tw_and_cse_3_2_sva_1[1]),
          butterFly_12_tw_and_cse_3_2_sva_1, (S2_INNER_LOOP1_r_4_2_sva_1_0[1]), (S2_INNER_LOOP1_r_4_2_sva_1_0[1]),
          {and_dcpl_66 , and_dcpl_68 , nor_154_nl , and_dcpl_71});
      revArr_rsci_s_raddr_core <= S1_OUTER_LOOP_for_acc_cse_sva;
      reg_tw_rsci_s_raddr_core_cse <= z_out[9:0];
      S34_OUTER_LOOP_for_tf_sva <= tw_rsci_s_din_mxwt;
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
    end
    else if ( core_wen ) begin
      reg_x_rsci_oswt_cse <= and_dcpl_32 & and_dcpl_1 & ((fsm_output[1]) ^ (fsm_output[0]));
      reg_x_rsci_oswt_1_cse <= and_dcpl_36 & and_dcpl_1 & (~ (fsm_output[1]));
      reg_twiddle_rsci_oswt_cse <= ~(mux_37_nl | (fsm_output[7]));
      reg_revArr_rsci_oswt_cse <= and_dcpl_32 & and_dcpl_56;
      reg_tw_rsci_oswt_cse <= and_dcpl_85;
      reg_xx_rsc_cgo_cse <= mux_72_rmff;
      reg_yy_rsc_cgo_cse <= nor_143_rmff;
      reg_x_rsc_triosy_obj_iswt0_cse <= and_dcpl_23 & (fsm_output[7]) & and_dcpl_90
          & and_dcpl_63 & (fsm_output[0]) & (z_out_3[5]);
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_485_nl) & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg <= (z_out_3[4]) & S2_COPY_LOOP_p_nand_seb;
    end
  end
  always @(posedge clk) begin
    if ( mux_492_nl & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg <= S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl
          & S2_COPY_LOOP_p_nand_seb;
    end
  end
  always @(posedge clk) begin
    if ( mux_498_nl & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg <= MUX_v_3_2_2(3'b000, S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl,
          S2_COPY_LOOP_p_nand_seb);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_5 <= 1'b0;
    end
    else if ( mux_503_nl & core_wen ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_5 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt[5];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= 5'b00000;
    end
    else if ( mux_508_nl & core_wen ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt[4:0];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (and_dcpl_256 | (~ mux_242_itm)) ) begin
      S1_OUTER_LOOP_for_p_sva_1 <= MUX_v_20_2_2(({5'b00000 , S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl}),
          z_out_4, mux_242_itm);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 | S1_OUTER_LOOP_for_acc_cse_sva_mx0c1
        | S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 | and_dcpl_157) ) begin
      S1_OUTER_LOOP_for_acc_cse_sva <= MUX_v_5_2_2(5'b00000, S1_OUTER_LOOP_for_mux1h_6_nl,
          S1_OUTER_LOOP_for_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_OUTER_LOOP_c_1_sva <= 1'b0;
    end
    else if ( core_wen & (and_dcpl_256 | S2_OUTER_LOOP_c_1_sva_mx0c1 | S2_OUTER_LOOP_c_1_sva_mx0c2
        | S2_OUTER_LOOP_c_1_sva_mx0c3) ) begin
      S2_OUTER_LOOP_c_1_sva <= operator_20_true_1_mux_nl & (~ S2_OUTER_LOOP_c_1_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (((~ mux_262_nl) & (~ (fsm_output[4])) & and_dcpl_51 & and_dcpl_41)
        | S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 | S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2)
        ) begin
      S2_INNER_LOOP1_r_4_2_sva_1_0 <= MUX_v_2_2_2(2'b00, S2_INNER_LOOP1_r_mux_nl,
          S2_INNER_LOOP1_r_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( mux_509_nl & (fsm_output[3]) & (~ (fsm_output[7])) & (~ (fsm_output[5]))
        & core_wen ) begin
      butterFly_12_tw_and_cse_3_2_sva_1 <= butterFly_tw_butterFly_tw_mux_rgt[1];
    end
  end
  always @(posedge clk) begin
    if ( mux_510_nl & (fsm_output[3]) & (~((fsm_output[7]) | (fsm_output[5]))) &
        (fsm_output[0]) & core_wen ) begin
      butterFly_12_tw_and_cse_3_2_sva_0 <= butterFly_tw_butterFly_tw_mux_rgt[0];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_278_nl | (fsm_output[4]) | (fsm_output[7]) | (fsm_output[0])))
        | mult_x_16_sva_mx0c1) ) begin
      mult_x_16_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, mult_x_16_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (butterFly_12_tw_asn_itm_mx0c0 | butterFly_12_tw_asn_itm_mx0c1
        | butterFly_12_tw_asn_itm_mx0c2 | butterFly_12_tw_asn_itm_mx0c3 | butterFly_12_tw_asn_itm_mx0c4
        | butterFly_12_tw_asn_itm_mx0c5 | butterFly_12_tw_asn_itm_mx0c6 | butterFly_12_tw_asn_itm_mx0c7
        | butterFly_12_tw_asn_itm_mx0c8 | butterFly_12_tw_asn_itm_mx0c9 | butterFly_12_tw_asn_itm_mx0c10
        | butterFly_12_tw_asn_itm_mx0c11 | butterFly_12_tw_asn_itm_mx0c12 | butterFly_12_tw_asn_itm_mx0c13
        | butterFly_12_tw_asn_itm_mx0c14 | butterFly_12_tw_asn_itm_mx0c15 | butterFly_12_tw_asn_itm_mx0c16
        | butterFly_12_tw_asn_itm_mx0c17 | butterFly_12_tw_asn_itm_mx0c18 | butterFly_12_tw_asn_itm_mx0c19
        | butterFly_12_tw_asn_itm_mx0c20 | butterFly_12_tw_asn_itm_mx0c21 | butterFly_12_tw_asn_itm_mx0c22
        | butterFly_12_tw_asn_itm_mx0c23 | butterFly_12_tw_asn_itm_mx0c24) ) begin
      butterFly_12_tw_asn_itm <= MUX1HOT_v_32_3_2(twiddle_rsci_s_din_mxwt, z_out_5,
          z_out_7, {butterFly_12_tw_asn_itm_mx0c0 , butterFly_tw_or_1_nl , butterFly_tw_or_2_nl});
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (and_dcpl_145 | and_363_cse | (and_dcpl_358 & and_dcpl_90 & and_dcpl_56)
        | and_dcpl_226 | (and_dcpl_363 & and_dcpl_50) | (and_dcpl_265 & and_dcpl_88
        & (~ (fsm_output[0]))) | and_dcpl_232 | (and_dcpl_32 & and_dcpl_367) | and_373_cse
        | (and_dcpl_371 & and_dcpl_154)) ) begin
      operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm <= z_out_1[51:20];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((mux_317_nl & (~ (fsm_output[7]))) | butterFly_13_tw_asn_itm_mx0c1
        | butterFly_13_tw_asn_itm_mx0c2 | butterFly_13_tw_asn_itm_mx0c3 | butterFly_13_tw_asn_itm_mx0c4
        | butterFly_13_tw_asn_itm_mx0c5) ) begin
      butterFly_13_tw_asn_itm <= MUX_v_32_2_2(twiddle_rsci_s_din_mxwt, (z_out_1[51:20]),
          butterFly_tw_or_nl);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~(mux_329_nl | (fsm_output[7]))) ) begin
      butterFly_13_tw_h_asn_itm <= twiddle_h_rsci_s_din_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_333_nl | (fsm_output[7]))) | butterFly_10_f1_sva_mx0c1)
        ) begin
      butterFly_10_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, butterFly_10_f1_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (butterFly_13_f1_sva_mx0c0 | butterFly_13_f1_sva_mx0c1 | and_dcpl_229)
        ) begin
      butterFly_13_f1_sva <= MUX1HOT_v_32_3_2((z_out_1[31:0]), xx_rsci_q_d, yy_rsci_q_d,
          {butterFly_13_f1_sva_mx0c0 , butterFly_13_f1_sva_mx0c1 , and_dcpl_229});
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((~(mux_358_nl | (fsm_output[7]))) | mult_x_2_sva_mx0c1) ) begin
      mult_x_2_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, mult_x_2_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~(mux_376_nl | (fsm_output[7]))) ) begin
      butterFly_10_tw_h_asn_itm <= twiddle_h_rsci_s_din_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~(mux_378_nl | (fsm_output[7]))) ) begin
      butterFly_14_tw_h_asn_itm <= twiddle_h_rsci_s_din_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_65 & and_dcpl_83) | and_dcpl_228 | (and_dcpl_371 &
        and_dcpl_264) | (and_dcpl_363 & and_dcpl_367)) ) begin
      mult_15_z_mul_itm <= z_out_1[31:0];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (((~ mux_383_nl) & and_dcpl_257) | mult_x_10_sva_mx0c1) ) begin
      mult_x_10_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, mult_x_10_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (((~ mux_388_cse) & and_dcpl_31 & nor_85_cse) | and_dcpl_230
        | (and_dcpl_371 & and_dcpl_39) | and_dcpl_232 | and_dcpl_172) ) begin
      mult_10_z_mul_itm <= MUX_v_32_2_2((z_out_1[31:0]), z_out, mult_1_z_or_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_358 & (~ (fsm_output[3])) & and_dcpl_177 & (~((fsm_output[5])
        ^ (fsm_output[0])))) | (and_dcpl_363 & and_dcpl_262) | ((~ mux_395_nl) &
        (~ (fsm_output[7])) & (fsm_output[6]) & (fsm_output[1]))) ) begin
      mult_16_z_mul_itm <= z_out_1[31:0];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (((~ mux_399_nl) & and_dcpl_31) | and_dcpl_162) ) begin
      butterFly_14_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_162);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~(or_6_cse | (~ (fsm_output[6])) | (fsm_output[2]) | or_15_cse))
        ) begin
      S34_OUTER_LOOP_for_tf_h_sva <= tw_h_rsci_s_din_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( modulo_sub_10_and_ssc ) begin
      reg_modulo_sub_10_mux_ftd <= (z_out_10[31]) & (~(modulo_sub_10_mux_itm_mx0c1
          | modulo_sub_10_mux_itm_mx0c3 | modulo_sub_10_mux_itm_mx0c5 | modulo_sub_10_mux_itm_mx0c7
          | modulo_sub_10_mux_itm_mx0c9 | modulo_sub_10_mux_itm_mx0c11 | modulo_sub_10_mux_itm_mx0c13
          | modulo_sub_10_mux_itm_mx0c15 | modulo_sub_10_mux_itm_mx0c17 | modulo_sub_10_mux_itm_mx0c19
          | modulo_sub_10_mux_itm_mx0c21 | modulo_sub_10_mux_itm_mx0c23 | modulo_sub_10_mux_itm_mx0c25
          | modulo_sub_10_mux_itm_mx0c27 | modulo_sub_10_mux_itm_mx0c29 | modulo_sub_10_mux_itm_mx0c31
          | modulo_sub_10_mux_itm_mx0c33 | modulo_sub_10_mux_itm_mx0c35 | modulo_sub_10_mux_itm_mx0c37
          | modulo_sub_10_mux_itm_mx0c39 | modulo_sub_10_mux_itm_mx0c41 | modulo_sub_10_mux_itm_mx0c43
          | modulo_sub_10_mux_itm_mx0c45 | modulo_sub_10_mux_itm_mx0c47));
      reg_modulo_sub_10_mux_ftd_1 <= MUX_v_31_2_2((z_out_10[30:0]), (z_out_8[30:0]),
          modulo_sub_3_or_nl);
    end
  end
  assign and_600_nl = (fsm_output[6:1]==6'b111111);
  assign mux_17_nl = MUX_s_1_2_2(nor_118_cse, and_600_nl, fsm_output[0]);
  assign mux_35_nl = MUX_s_1_2_2(or_tmp_32, or_tmp_29, fsm_output[2]);
  assign nand_1_nl = ~((fsm_output[3:2]==2'b11) & (~ and_581_cse));
  assign mux_36_nl = MUX_s_1_2_2(mux_35_nl, nand_1_nl, fsm_output[1]);
  assign mux_33_nl = MUX_s_1_2_2(or_tmp_31, or_tmp_30, fsm_output[2]);
  assign nand_nl = ~((fsm_output[3]) & (~ mux_tmp_31));
  assign mux_32_nl = MUX_s_1_2_2(or_tmp_29, nand_nl, fsm_output[2]);
  assign mux_34_nl = MUX_s_1_2_2(mux_33_nl, mux_32_nl, fsm_output[1]);
  assign mux_37_nl = MUX_s_1_2_2(mux_36_nl, mux_34_nl, fsm_output[0]);
  assign or_48_nl = (~ (fsm_output[2])) | (fsm_output[4]) | (fsm_output[5]);
  assign nand_2_nl = ~((fsm_output[2]) & (~ mux_tmp_31));
  assign mux_41_nl = MUX_s_1_2_2(or_48_nl, nand_2_nl, fsm_output[1]);
  assign mux_40_nl = MUX_s_1_2_2(or_tmp_37, mux_tmp_39, fsm_output[1]);
  assign mux_42_nl = MUX_s_1_2_2(mux_41_nl, mux_40_nl, fsm_output[0]);
  assign mux_43_nl = MUX_s_1_2_2(or_tmp_42, or_tmp_40, fsm_output[1]);
  assign nand_50_nl = ~((fsm_output[5:1]==5'b01111));
  assign mux_44_nl = MUX_s_1_2_2(mux_43_nl, nand_50_nl, fsm_output[0]);
  assign butterFly_tw_h_or_2_nl = and_dcpl_68 | (~(mux_44_nl | (fsm_output[7])));
  assign and_54_nl = and_dcpl_53 & and_dcpl_50;
  assign or_59_nl = (~ (fsm_output[2])) | (~ (fsm_output[3])) | (fsm_output[5]);
  assign mux_46_nl = MUX_s_1_2_2(or_tmp_29, or_tmp_46, fsm_output[2]);
  assign mux_47_nl = MUX_s_1_2_2(or_59_nl, mux_46_nl, fsm_output[1]);
  assign mux_49_nl = MUX_s_1_2_2(mux_tmp_48, mux_47_nl, fsm_output[0]);
  assign mux_50_nl = MUX_s_1_2_2(or_tmp_42, or_tmp_40, or_15_cse);
  assign nor_154_nl = ~(mux_50_nl | (fsm_output[7]));
  assign or_549_nl = (~((fsm_output[6]) | (fsm_output[0]))) | (fsm_output[4]);
  assign or_547_nl = (fsm_output[0]) | (fsm_output[4]);
  assign mux_481_nl = MUX_s_1_2_2(or_549_nl, or_547_nl, fsm_output[2]);
  assign mux_482_nl = MUX_s_1_2_2(mux_481_nl, (fsm_output[4]), fsm_output[1]);
  assign mux_483_nl = MUX_s_1_2_2((~ mux_482_nl), (fsm_output[4]), fsm_output[5]);
  assign nor_309_nl = ~((fsm_output[1]) | (fsm_output[2]) | (fsm_output[0]) | (fsm_output[4]));
  assign or_545_nl = (fsm_output[0]) | (~ (fsm_output[4]));
  assign mux_nl = MUX_s_1_2_2((fsm_output[4]), or_545_nl, and_1160_cse);
  assign mux_480_nl = MUX_s_1_2_2(nor_309_nl, mux_nl, fsm_output[5]);
  assign mux_484_nl = MUX_s_1_2_2(mux_483_nl, mux_480_nl, fsm_output[3]);
  assign or_544_nl = (fsm_output[6:0]!=7'b0000011);
  assign mux_485_nl = MUX_s_1_2_2(mux_484_nl, or_544_nl, fsm_output[7]);
  assign S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl = MUX_s_1_2_2((z_out_3[3]), (z_out_2[3]),
      and_252_ssc);
  assign nor_310_nl = ~((fsm_output[3]) | (fsm_output[2]) | (fsm_output[6]));
  assign mux_487_nl = MUX_s_1_2_2((fsm_output[2]), (~ (fsm_output[2])), fsm_output[3]);
  assign mux_488_nl = MUX_s_1_2_2(nor_310_nl, mux_487_nl, fsm_output[0]);
  assign nor_311_nl = ~((fsm_output[0]) | (~ (fsm_output[3])) | (fsm_output[2]));
  assign mux_489_nl = MUX_s_1_2_2(mux_488_nl, nor_311_nl, fsm_output[1]);
  assign mux_490_nl = MUX_s_1_2_2(mux_489_nl, and_598_cse, fsm_output[4]);
  assign nor_312_nl = ~((fsm_output[1:0]!=2'b10) | (~ and_598_cse));
  assign mux_486_nl = MUX_s_1_2_2(nand_48_cse, nor_312_nl, fsm_output[4]);
  assign mux_491_nl = MUX_s_1_2_2(mux_490_nl, mux_486_nl, fsm_output[5]);
  assign nor_313_nl = ~((fsm_output[6:0]!=7'b0000011));
  assign mux_492_nl = MUX_s_1_2_2(mux_491_nl, nor_313_nl, fsm_output[7]);
  assign mux_214_nl = MUX_s_1_2_2(or_tmp_10, mux_tmp_31, and_598_cse);
  assign or_16_nl = (fsm_output[5:4]!=2'b01);
  assign mux_10_nl = MUX_s_1_2_2(or_tmp_10, or_16_nl, and_598_cse);
  assign mux_215_nl = MUX_s_1_2_2(mux_214_nl, mux_10_nl, fsm_output[1]);
  assign S2_COPY_LOOP_p_or_nl = and_252_ssc | (~(mux_215_nl | (fsm_output[7])));
  assign S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl = MUX_v_3_2_2((z_out_3[2:0]), (z_out_2[2:0]),
      S2_COPY_LOOP_p_or_nl);
  assign or_563_nl = (fsm_output[7]) | (fsm_output[6]) | (fsm_output[3]);
  assign mux_495_nl = MUX_s_1_2_2(or_563_nl, or_dcpl_9, fsm_output[0]);
  assign or_562_nl = (~ (fsm_output[0])) | (fsm_output[7]) | (fsm_output[3]);
  assign mux_496_nl = MUX_s_1_2_2(mux_495_nl, or_562_nl, fsm_output[2]);
  assign or_559_nl = (~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[3]);
  assign mux_494_nl = MUX_s_1_2_2(or_dcpl_9, or_559_nl, fsm_output[0]);
  assign or_561_nl = (fsm_output[2]) | mux_494_nl;
  assign mux_497_nl = MUX_s_1_2_2(mux_496_nl, or_561_nl, fsm_output[1]);
  assign nor_314_nl = ~((fsm_output[5]) | mux_497_nl);
  assign nor_315_nl = ~((fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[0]) |
      (fsm_output[7]) | (~ (fsm_output[3])));
  assign nor_316_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[0])
      | (fsm_output[7]) | (~ (fsm_output[3])));
  assign mux_493_nl = MUX_s_1_2_2(nor_315_nl, nor_316_nl, fsm_output[5]);
  assign mux_498_nl = MUX_s_1_2_2(nor_314_nl, mux_493_nl, fsm_output[4]);
  assign and_1144_nl = (fsm_output[7]) & or_29_cse;
  assign or_570_nl = (~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[2]);
  assign mux_500_nl = MUX_s_1_2_2((fsm_output[7]), or_570_nl, fsm_output[1]);
  assign mux_501_nl = MUX_s_1_2_2(and_1144_nl, mux_500_nl, fsm_output[0]);
  assign nor_304_nl = ~((fsm_output[4]) | mux_501_nl);
  assign nor_305_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[1])) | (fsm_output[7])
      | (fsm_output[2]));
  assign nor_306_nl = ~((~ (fsm_output[0])) | (fsm_output[1]) | (fsm_output[7]) |
      (~ (fsm_output[2])));
  assign mux_499_nl = MUX_s_1_2_2(nor_305_nl, nor_306_nl, fsm_output[4]);
  assign mux_502_nl = MUX_s_1_2_2(nor_304_nl, mux_499_nl, fsm_output[3]);
  assign and_1158_nl = (fsm_output[3]) & (~(nor_110_cse | (~ (fsm_output[1])) | (fsm_output[7])
      | (~ (fsm_output[2]))));
  assign mux_503_nl = MUX_s_1_2_2(mux_502_nl, and_1158_nl, fsm_output[5]);
  assign or_579_nl = (fsm_output[0]) | (fsm_output[7]) | (fsm_output[4]) | (fsm_output[5]);
  assign or_578_nl = (~ (fsm_output[7])) | (fsm_output[4]) | (fsm_output[5]);
  assign mux_506_nl = MUX_s_1_2_2(or_579_nl, or_578_nl, fsm_output[1]);
  assign nor_299_nl = ~((fsm_output[6]) | mux_506_nl);
  assign nor_300_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[0])) | (fsm_output[7])
      | (fsm_output[4]) | (fsm_output[5]));
  assign mux_507_nl = MUX_s_1_2_2(nor_299_nl, nor_300_nl, fsm_output[3]);
  assign nor_301_nl = ~(and_571_cse_1 | (fsm_output[7]) | (fsm_output[4]) | (fsm_output[5]));
  assign nor_302_nl = ~((~ (fsm_output[0])) | (fsm_output[7]) | (~ (fsm_output[4]))
      | (fsm_output[5]));
  assign nor_303_nl = ~((fsm_output[0]) | (fsm_output[7]) | (~ (fsm_output[5])));
  assign mux_504_nl = MUX_s_1_2_2(nor_302_nl, nor_303_nl, fsm_output[1]);
  assign mux_505_nl = MUX_s_1_2_2(nor_301_nl, mux_504_nl, fsm_output[3]);
  assign mux_508_nl = MUX_s_1_2_2(mux_507_nl, mux_505_nl, fsm_output[2]);
  assign and_25_nl = not_tmp_30 & and_dcpl_23 & (~ (fsm_output[3])) & (~ (fsm_output[0]));
  assign S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl = MUX_v_15_2_2(15'b000000000000000,
      (S1_OUTER_LOOP_for_p_sva_1[19:5]), and_25_nl);
  assign nl_S6_OUTER_LOOP_for_acc_nl = (S1_OUTER_LOOP_for_p_sva_1[4:0]) + ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg});
  assign S6_OUTER_LOOP_for_acc_nl = nl_S6_OUTER_LOOP_for_acc_nl[4:0];
  assign S1_OUTER_LOOP_for_mux1h_6_nl = MUX1HOT_v_5_3_2((z_out_3[4:0]), S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
      S6_OUTER_LOOP_for_acc_nl, {S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 , S1_OUTER_LOOP_for_acc_cse_sva_mx0c2
      , and_dcpl_157});
  assign S1_OUTER_LOOP_for_not_nl = ~ S1_OUTER_LOOP_for_acc_cse_sva_mx0c1;
  assign nl_operator_20_true_1_acc_1_nl = (z_out_4[19:5]) + 15'b111111111111111;
  assign operator_20_true_1_acc_1_nl = nl_operator_20_true_1_acc_1_nl[14:0];
  assign S2_OUTER_LOOP_c_S2_OUTER_LOOP_c_or_nl = S2_OUTER_LOOP_c_1_sva | (z_out_4[2]);
  assign operator_20_true_1_or_nl = S2_OUTER_LOOP_c_1_sva_mx0c2 | S2_OUTER_LOOP_c_1_sva_mx0c3;
  assign operator_20_true_1_mux_nl = MUX_s_1_2_2((readslicef_15_1_14(operator_20_true_1_acc_1_nl)),
      S2_OUTER_LOOP_c_S2_OUTER_LOOP_c_or_nl, operator_20_true_1_or_nl);
  assign S2_OUTER_LOOP_c_nor_nl = ~(or_tmp_36 | or_dcpl_9 | (fsm_output[2:0]!=3'b001));
  assign S2_INNER_LOOP1_r_mux_nl = MUX_v_2_2_2(({1'b0 , S2_OUTER_LOOP_c_nor_nl}),
      (z_out_4[1:0]), S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2);
  assign S2_INNER_LOOP1_r_not_nl = ~ S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1;
  assign mux_260_nl = MUX_s_1_2_2((fsm_output[5]), (~ (fsm_output[5])), fsm_output[2]);
  assign mux_261_nl = MUX_s_1_2_2(or_tmp_224, mux_260_nl, z_out_4[2]);
  assign mux_262_nl = MUX_s_1_2_2(mux_261_nl, or_tmp_224, S2_OUTER_LOOP_c_1_sva);
  assign nor_298_nl = ~((fsm_output[2:0]!=3'b011));
  assign and_1156_nl = or_15_cse & (fsm_output[2]);
  assign mux_509_nl = MUX_s_1_2_2(nor_298_nl, and_1156_nl, fsm_output[4]);
  assign nor_295_nl = ~((fsm_output[2:1]!=2'b01));
  assign nor_296_nl = ~((fsm_output[2:1]!=2'b10));
  assign mux_510_nl = MUX_s_1_2_2(nor_295_nl, nor_296_nl, fsm_output[4]);
  assign mux_277_nl = MUX_s_1_2_2(or_tmp_30, or_tmp_32, fsm_output[6]);
  assign nand_91_nl = ~((fsm_output[2]) & (~ mux_277_nl));
  assign or_537_nl = (fsm_output[2]) | (~ (fsm_output[6])) | (fsm_output[3]) | (~
      (fsm_output[5]));
  assign mux_278_nl = MUX_s_1_2_2(nand_91_nl, or_537_nl, fsm_output[1]);
  assign butterFly_tw_or_1_nl = butterFly_12_tw_asn_itm_mx0c1 | butterFly_12_tw_asn_itm_mx0c3
      | butterFly_12_tw_asn_itm_mx0c5 | butterFly_12_tw_asn_itm_mx0c7 | butterFly_12_tw_asn_itm_mx0c9
      | butterFly_12_tw_asn_itm_mx0c11 | butterFly_12_tw_asn_itm_mx0c13 | butterFly_12_tw_asn_itm_mx0c15
      | butterFly_12_tw_asn_itm_mx0c17 | butterFly_12_tw_asn_itm_mx0c19 | butterFly_12_tw_asn_itm_mx0c21
      | butterFly_12_tw_asn_itm_mx0c23;
  assign butterFly_tw_or_2_nl = butterFly_12_tw_asn_itm_mx0c2 | butterFly_12_tw_asn_itm_mx0c4
      | butterFly_12_tw_asn_itm_mx0c6 | butterFly_12_tw_asn_itm_mx0c8 | butterFly_12_tw_asn_itm_mx0c10
      | butterFly_12_tw_asn_itm_mx0c12 | butterFly_12_tw_asn_itm_mx0c14 | butterFly_12_tw_asn_itm_mx0c16
      | butterFly_12_tw_asn_itm_mx0c18 | butterFly_12_tw_asn_itm_mx0c20 | butterFly_12_tw_asn_itm_mx0c22
      | butterFly_12_tw_asn_itm_mx0c24;
  assign butterFly_tw_or_nl = butterFly_13_tw_asn_itm_mx0c1 | butterFly_13_tw_asn_itm_mx0c2
      | butterFly_13_tw_asn_itm_mx0c4 | butterFly_13_tw_asn_itm_mx0c3 | butterFly_13_tw_asn_itm_mx0c5;
  assign and_563_nl = (fsm_output[6]) & (fsm_output[2]) & (fsm_output[3]);
  assign mux_315_nl = MUX_s_1_2_2(and_563_nl, and_558_cse, fsm_output[4]);
  assign nor_68_nl = ~((fsm_output[4:1]!=4'b0000));
  assign mux_316_nl = MUX_s_1_2_2(mux_315_nl, nor_68_nl, fsm_output[5]);
  assign nor_69_nl = ~((fsm_output[4]) | (fsm_output[6]) | (~((fsm_output[3:2]==2'b11))));
  assign nor_70_nl = ~((fsm_output[3:1]!=3'b000));
  assign mux_313_nl = MUX_s_1_2_2(and_558_cse, nor_70_nl, fsm_output[4]);
  assign mux_314_nl = MUX_s_1_2_2(nor_69_nl, mux_313_nl, fsm_output[5]);
  assign mux_317_nl = MUX_s_1_2_2(mux_316_nl, mux_314_nl, fsm_output[0]);
  assign mux_328_nl = MUX_s_1_2_2(or_tmp_42, mux_tmp_327, fsm_output[1]);
  assign or_310_nl = (fsm_output[1]) | mux_tmp_326;
  assign mux_329_nl = MUX_s_1_2_2(mux_328_nl, or_310_nl, fsm_output[0]);
  assign mux_330_nl = MUX_s_1_2_2(or_tmp_29, or_tmp_133, fsm_output[6]);
  assign mux_331_nl = MUX_s_1_2_2(or_tmp_147, mux_330_nl, fsm_output[2]);
  assign mux_332_nl = MUX_s_1_2_2(mux_331_nl, or_tmp_81, fsm_output[1]);
  assign mux_333_nl = MUX_s_1_2_2(or_tmp_285, mux_332_nl, fsm_output[0]);
  assign mux_356_nl = MUX_s_1_2_2(or_tmp_29, or_tmp_46, fsm_output[6]);
  assign nand_20_nl = ~((fsm_output[2]) & (~ mux_356_nl));
  assign mux_357_nl = MUX_s_1_2_2(or_tmp_86, nand_20_nl, fsm_output[1]);
  assign mux_355_nl = MUX_s_1_2_2(or_tmp_303, or_tmp_285, fsm_output[1]);
  assign mux_358_nl = MUX_s_1_2_2(mux_357_nl, mux_355_nl, fsm_output[0]);
  assign mux_375_nl = MUX_s_1_2_2(or_tmp_285, mux_tmp_326, fsm_output[1]);
  assign mux_374_nl = MUX_s_1_2_2(or_tmp_42, or_tmp_103, fsm_output[1]);
  assign mux_376_nl = MUX_s_1_2_2(mux_375_nl, mux_374_nl, fsm_output[0]);
  assign mux_363_nl = MUX_s_1_2_2(or_tmp_30, or_tmp_46, fsm_output[6]);
  assign nand_21_nl = ~((fsm_output[2]) & (~ mux_363_nl));
  assign mux_377_nl = MUX_s_1_2_2(mux_tmp_327, nand_21_nl, fsm_output[1]);
  assign mux_378_nl = MUX_s_1_2_2(or_tmp_102, mux_377_nl, fsm_output[0]);
  assign or_359_nl = (fsm_output[5:2]!=4'b0100);
  assign mux_383_nl = MUX_s_1_2_2(or_359_nl, mux_tmp_48, fsm_output[0]);
  assign mult_1_z_or_1_nl = and_dcpl_232 | and_dcpl_172;
  assign mux_395_nl = MUX_s_1_2_2(or_tmp_51, or_tmp_297, fsm_output[0]);
  assign mux_398_nl = MUX_s_1_2_2(or_tmp_95, or_tmp_96, fsm_output[1]);
  assign mux_399_nl = MUX_s_1_2_2(or_tmp_98, mux_398_nl, fsm_output[0]);
  assign modulo_sub_3_or_nl = modulo_sub_10_mux_itm_mx0c1 | modulo_sub_10_mux_itm_mx0c3
      | modulo_sub_10_mux_itm_mx0c5 | modulo_sub_10_mux_itm_mx0c7 | modulo_sub_10_mux_itm_mx0c9
      | modulo_sub_10_mux_itm_mx0c11 | modulo_sub_10_mux_itm_mx0c13 | modulo_sub_10_mux_itm_mx0c15
      | modulo_sub_10_mux_itm_mx0c17 | modulo_sub_10_mux_itm_mx0c19 | modulo_sub_10_mux_itm_mx0c21
      | modulo_sub_10_mux_itm_mx0c23 | modulo_sub_10_mux_itm_mx0c25 | modulo_sub_10_mux_itm_mx0c27
      | modulo_sub_10_mux_itm_mx0c29 | modulo_sub_10_mux_itm_mx0c31 | modulo_sub_10_mux_itm_mx0c33
      | modulo_sub_10_mux_itm_mx0c35 | modulo_sub_10_mux_itm_mx0c37 | modulo_sub_10_mux_itm_mx0c39
      | modulo_sub_10_mux_itm_mx0c41 | modulo_sub_10_mux_itm_mx0c43 | modulo_sub_10_mux_itm_mx0c45
      | modulo_sub_10_mux_itm_mx0c47;
  assign and_1161_nl = (fsm_output[5:4]==2'b11) & and_dcpl_257 & (fsm_output[3:0]==4'b1111);
  assign S34_OUTER_LOOP_for_tf_mux1h_1_nl = MUX1HOT_v_20_3_2((signext_20_10({(S1_OUTER_LOOP_for_p_sva_1[4:0])
      , S2_COPY_LOOP_for_i_5_0_sva_1_4_0})), tw_rsci_s_din_mxwt, S34_OUTER_LOOP_for_tf_sva,
      {and_1161_nl , and_dcpl_565 , and_dcpl_568});
  assign S34_OUTER_LOOP_for_tf_or_1_nl = and_dcpl_565 | and_dcpl_568;
  assign S34_OUTER_LOOP_for_tf_mux_1_nl = MUX_v_32_2_2(({27'b000000000000000000000000000
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}), yy_rsci_q_d, S34_OUTER_LOOP_for_tf_or_1_nl);
  assign nl_z_out = $signed(S34_OUTER_LOOP_for_tf_mux1h_1_nl) * $signed(conv_u2s_32_33(S34_OUTER_LOOP_for_tf_mux_1_nl));
  assign z_out = nl_z_out[31:0];
  assign mult_3_t_or_12_nl = and_dcpl_571 | and_dcpl_626 | and_dcpl_628;
  assign mult_3_t_or_13_nl = and_363_cse | and_dcpl_591 | and_dcpl_604 | and_dcpl_610
      | and_dcpl_615 | and_dcpl_632;
  assign mult_3_t_or_14_nl = and_dcpl_576 | and_dcpl_588 | and_dcpl_612 | and_dcpl_613;
  assign mult_3_t_or_15_nl = and_dcpl_582 | and_373_cse | and_dcpl_607 | and_dcpl_630
      | and_dcpl_634;
  assign mult_3_t_or_16_nl = and_dcpl_598 | and_dcpl_618 | and_dcpl_621 | and_dcpl_624
      | and_dcpl_639;
  assign mult_3_t_mux1h_2_nl = MUX1HOT_v_32_7_2(xx_rsci_q_d, mult_x_10_sva, yy_rsci_q_d,
      mult_x_16_sva, mult_x_2_sva, operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm,
      butterFly_13_tw_asn_itm, {mult_3_t_or_12_nl , mult_3_t_or_13_nl , mult_3_t_or_14_nl
      , mult_3_t_or_15_nl , mult_3_t_or_16_nl , and_dcpl_622 , and_dcpl_635});
  assign mult_3_t_or_17_nl = and_dcpl_571 | and_dcpl_576;
  assign mult_3_t_or_18_nl = and_363_cse | and_dcpl_582 | and_dcpl_598;
  assign mult_3_t_or_19_nl = and_373_cse | and_dcpl_604 | and_dcpl_621;
  assign mult_3_t_or_20_nl = and_dcpl_607 | and_dcpl_610 | and_dcpl_639;
  assign mult_3_t_or_21_nl = and_dcpl_612 | and_dcpl_624 | and_dcpl_628 | and_dcpl_632
      | and_dcpl_634;
  assign mult_3_t_or_22_nl = and_dcpl_613 | and_dcpl_615 | and_dcpl_618 | and_dcpl_626
      | and_dcpl_630;
  assign mult_3_t_or_23_nl = and_dcpl_622 | and_dcpl_635;
  assign mult_3_t_mux1h_3_nl = MUX1HOT_v_32_9_2(twiddle_h_rsci_s_din_mxwt, butterFly_10_tw_h_asn_itm,
      ({{12{tw_h_rsci_s_din_mxwt[19]}}, tw_h_rsci_s_din_mxwt}), ({{12{S34_OUTER_LOOP_for_tf_h_sva[19]}},
      S34_OUTER_LOOP_for_tf_h_sva}), butterFly_14_tw_h_asn_itm, butterFly_13_tw_h_asn_itm,
      butterFly_13_tw_asn_itm, butterFly_12_tw_asn_itm, m_sva, {mult_3_t_or_17_nl
      , mult_3_t_or_18_nl , and_dcpl_588 , and_dcpl_591 , mult_3_t_or_19_nl , mult_3_t_or_20_nl
      , mult_3_t_or_21_nl , mult_3_t_or_22_nl , mult_3_t_or_23_nl});
  assign nl_z_out_1 = mult_3_t_mux1h_2_nl * mult_3_t_mux1h_3_nl;
  assign z_out_1 = nl_z_out_1[51:0];
  assign S2_INNER_LOOP1_for_or_2_nl = and_dcpl_654 | and_dcpl_660 | and_dcpl_662;
  assign S2_INNER_LOOP1_for_S2_INNER_LOOP1_for_mux_1_nl = MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}), S2_INNER_LOOP1_for_or_2_nl);
  assign mux_512_nl = MUX_s_1_2_2(and_dcpl_23, nor_232_cse, fsm_output[3]);
  assign nand_97_nl = ~((fsm_output[2:1]==2'b11) & mux_512_nl);
  assign mux_511_nl = MUX_s_1_2_2(nand_97_nl, mux_231_cse, fsm_output[0]);
  assign S2_INNER_LOOP1_for_or_3_nl = (~(mux_511_nl | (fsm_output[7]))) | and_dcpl_662;
  assign S2_INNER_LOOP1_for_mux1h_2_nl = MUX1HOT_v_5_3_2(5'b00001, (S1_OUTER_LOOP_for_p_sva_1[4:0]),
      (revArr_rsci_s_din_mxwt[9:5]), {S2_INNER_LOOP1_for_or_3_nl , and_dcpl_654 ,
      and_dcpl_660});
  assign nl_z_out_3 = conv_u2u_5_6(S2_INNER_LOOP1_for_S2_INNER_LOOP1_for_mux_1_nl)
      + conv_u2u_5_6(S2_INNER_LOOP1_for_mux1h_2_nl);
  assign z_out_3 = nl_z_out_3[5:0];
  assign not_1441_nl = ~ and_dcpl_666;
  assign S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl = MUX_v_15_2_2(15'b000000000000000,
      (S1_OUTER_LOOP_for_p_sva_1[14:0]), not_1441_nl);
  assign not_1442_nl = ~ and_dcpl_666;
  assign S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl = MUX_v_3_2_2(3'b000, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:2]),
      not_1442_nl);
  assign S1_OUTER_LOOP_for_mux_12_nl = MUX_v_2_2_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, and_dcpl_666);
  assign nl_z_out_4 = ({S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl , S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl
      , S1_OUTER_LOOP_for_mux_12_nl}) + 20'b00000000000000000001;
  assign z_out_4 = nl_z_out_4[19:0];
  assign nl_acc_2_nl = ({z_out_7 , 1'b1}) + ({(~ m_sva) , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[32:0];
  assign z_out_5 = readslicef_33_32_1(acc_2_nl);
  assign nl_acc_3_nl = ({z_out_9 , 1'b1}) + ({(~ m_sva) , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[32:0];
  assign z_out_6 = readslicef_33_32_1(acc_3_nl);
  assign butterFly_3_or_20_nl = (and_dcpl_765 & and_dcpl_762) | (and_dcpl_603 & and_dcpl_82
      & and_dcpl_41) | (and_dcpl_363 & and_dcpl_780) | (and_dcpl_363 & and_dcpl_762)
      | (and_dcpl_371 & and_dcpl_786) | (and_dcpl_84 & and_dcpl_1 & and_dcpl_38)
      | (and_dcpl_765 & and_dcpl_154) | (and_dcpl_603 & and_dcpl_153 & nor_85_cse)
      | (and_dcpl_363 & and_dcpl_807) | (and_dcpl_363 & and_dcpl_154) | (and_dcpl_371
      & and_dcpl_171) | (and_dcpl_371 & and_dcpl_156);
  assign butterFly_3_or_21_nl = (and_dcpl_603 & and_dcpl_82 & nor_85_cse) | (and_dcpl_265
      & and_dcpl_786) | (and_dcpl_84 & and_dcpl_780) | (and_dcpl_603 & and_dcpl_156)
      | (and_dcpl_265 & and_dcpl_171) | (and_dcpl_84 & and_dcpl_105 & and_dcpl_38);
  assign butterFly_3_or_22_nl = (and_dcpl_603 & and_dcpl_83) | (and_dcpl_363 & and_dcpl_83)
      | (and_dcpl_371 & and_dcpl_83) | (and_dcpl_603 & and_dcpl_153 & and_dcpl_41)
      | (and_dcpl_363 & and_dcpl_156) | (and_dcpl_84 & and_dcpl_807);
  assign butterFly_3_mux1h_4_cse = MUX1HOT_v_32_3_2(butterFly_10_f1_sva, butterFly_14_f1_sva,
      butterFly_13_f1_sva, {butterFly_3_or_20_nl , butterFly_3_or_21_nl , butterFly_3_or_22_nl});
  assign nl_z_out_7 = butterFly_3_mux1h_4_cse + mult_3_res_mux_cse;
  assign z_out_7 = nl_z_out_7[31:0];
  assign nl_acc_5_nl = ({butterFly_3_mux1h_4_cse , 1'b1}) + ({(~ mult_3_res_mux_cse)
      , 1'b1});
  assign acc_5_nl = nl_acc_5_nl[32:0];
  assign z_out_8 = readslicef_33_32_1(acc_5_nl);
  assign mult_3_res_or_5_nl = ((fsm_output==8'b00001110)) | ((fsm_output[5:4]==2'b10)
      & and_dcpl_31 & (fsm_output[2:0]==3'b000)) | (and_581_cse & and_dcpl_31 & (~
      (fsm_output[6])) & (~ (fsm_output[2])) & (~ (fsm_output[1])) & (fsm_output[0]))
      | and_dcpl_634;
  assign mult_3_res_or_6_nl = and_dcpl_887 | and_dcpl_902;
  assign mult_3_res_or_7_nl = and_793_cse | and_dcpl_901;
  assign mult_3_res_mux1h_2_nl = MUX1HOT_v_32_4_2((z_out_1[31:0]), mult_16_z_mul_itm,
      mult_10_z_mul_itm, mult_15_z_mul_itm, {mult_3_res_or_5_nl , mult_3_res_or_6_nl
      , nor_261_cse , mult_3_res_or_7_nl});
  assign mult_3_res_or_8_nl = and_dcpl_887 | and_dcpl_901 | nor_261_cse | and_793_cse
      | and_dcpl_902;
  assign mult_3_res_mult_3_res_mux_1_nl = MUX_v_32_2_2((~ butterFly_13_f1_sva), (~
      (z_out_1[31:0])), mult_3_res_or_8_nl);
  assign nl_acc_6_nl = ({mult_3_res_mux1h_2_nl , 1'b1}) + ({mult_3_res_mult_3_res_mux_1_nl
      , 1'b1});
  assign acc_6_nl = nl_acc_6_nl[32:0];
  assign z_out_9 = readslicef_33_32_1(acc_6_nl);
  assign nl_z_out_10 = ({1'b1 , (z_out_8[30:0])}) + m_sva;
  assign z_out_10 = nl_z_out_10[31:0];
  assign nl_acc_8_nl = ({1'b1 , z_out_9 , 1'b1}) + conv_u2u_33_34({(~ m_sva) , 1'b1});
  assign acc_8_nl = nl_acc_8_nl[33:0];
  assign z_out_11_32 = readslicef_34_1_33(acc_8_nl);
  assign nl_acc_9_nl = ({1'b1 , m_sva , 1'b1}) + conv_u2u_33_34({(~ z_out_7) , 1'b1});
  assign acc_9_nl = nl_acc_9_nl[33:0];
  assign z_out_12_32 = readslicef_34_1_33(acc_9_nl);

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


  function automatic [19:0] MUX1HOT_v_20_3_2;
    input [19:0] input_2;
    input [19:0] input_1;
    input [19:0] input_0;
    input [2:0] sel;
    reg [19:0] result;
  begin
    result = input_0 & {20{sel[0]}};
    result = result | ( input_1 & {20{sel[1]}});
    result = result | ( input_2 & {20{sel[2]}});
    MUX1HOT_v_20_3_2 = result;
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


  function automatic [31:0] MUX1HOT_v_32_6_2;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [5:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    result = result | ( input_5 & {32{sel[5]}});
    MUX1HOT_v_32_6_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_7_2;
    input [31:0] input_6;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [6:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    result = result | ( input_5 & {32{sel[5]}});
    result = result | ( input_6 & {32{sel[6]}});
    MUX1HOT_v_32_7_2 = result;
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


  function automatic [30:0] MUX_v_31_2_2;
    input [30:0] input_0;
    input [30:0] input_1;
    input [0:0] sel;
    reg [30:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_31_2_2 = result;
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


  function automatic [19:0] signext_20_10;
    input [9:0] vector;
  begin
    signext_20_10= {{10{vector[9]}}, vector};
  end
  endfunction


  function automatic [32:0] conv_u2s_32_33 ;
    input [31:0]  vector ;
  begin
    conv_u2s_32_33 =  {1'b0, vector};
  end
  endfunction


  function automatic [5:0] conv_u2u_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_6 = {1'b0, vector};
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
      .xx_rsci_we_d_pff(xx_rsci_we_d_iff),
      .yy_rsci_we_d_pff(yy_rsci_we_d_iff)
    );
endmodule



