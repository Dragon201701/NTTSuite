
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
//  Generated date: Mon Sep 13 23:15:06 2021
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
      S2_COPY_LOOP_for_C_3_tr0, S2_COPY_LOOP_C_0_tr0, S2_INNER_LOOP1_for_C_17_tr0,
      S2_INNER_LOOP1_C_0_tr0, S2_INNER_LOOP2_for_C_17_tr0, S2_INNER_LOOP2_C_0_tr0,
      S2_INNER_LOOP2_C_0_tr1, S2_INNER_LOOP3_for_C_17_tr0, S2_INNER_LOOP3_C_0_tr0,
      S34_OUTER_LOOP_for_C_9_tr0, S34_OUTER_LOOP_C_0_tr0, S5_COPY_LOOP_for_C_3_tr0,
      S5_COPY_LOOP_C_0_tr0, S5_INNER_LOOP1_for_C_17_tr0, S5_INNER_LOOP1_C_0_tr0,
      S5_INNER_LOOP2_for_C_17_tr0, S5_INNER_LOOP2_C_0_tr0, S5_INNER_LOOP2_C_0_tr1,
      S5_INNER_LOOP3_for_C_17_tr0, S5_INNER_LOOP3_C_0_tr0, S6_OUTER_LOOP_for_C_3_tr0,
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
  input S2_INNER_LOOP1_for_C_17_tr0;
  input S2_INNER_LOOP1_C_0_tr0;
  input S2_INNER_LOOP2_for_C_17_tr0;
  input S2_INNER_LOOP2_C_0_tr0;
  input S2_INNER_LOOP2_C_0_tr1;
  input S2_INNER_LOOP3_for_C_17_tr0;
  input S2_INNER_LOOP3_C_0_tr0;
  input S34_OUTER_LOOP_for_C_9_tr0;
  input S34_OUTER_LOOP_C_0_tr0;
  input S5_COPY_LOOP_for_C_3_tr0;
  input S5_COPY_LOOP_C_0_tr0;
  input S5_INNER_LOOP1_for_C_17_tr0;
  input S5_INNER_LOOP1_C_0_tr0;
  input S5_INNER_LOOP2_for_C_17_tr0;
  input S5_INNER_LOOP2_C_0_tr0;
  input S5_INNER_LOOP2_C_0_tr1;
  input S5_INNER_LOOP3_for_C_17_tr0;
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
    S2_INNER_LOOP1_C_0 = 8'd31,
    S2_OUTER_LOOP_C_1 = 8'd32,
    S2_INNER_LOOP2_for_C_0 = 8'd33,
    S2_INNER_LOOP2_for_C_1 = 8'd34,
    S2_INNER_LOOP2_for_C_2 = 8'd35,
    S2_INNER_LOOP2_for_C_3 = 8'd36,
    S2_INNER_LOOP2_for_C_4 = 8'd37,
    S2_INNER_LOOP2_for_C_5 = 8'd38,
    S2_INNER_LOOP2_for_C_6 = 8'd39,
    S2_INNER_LOOP2_for_C_7 = 8'd40,
    S2_INNER_LOOP2_for_C_8 = 8'd41,
    S2_INNER_LOOP2_for_C_9 = 8'd42,
    S2_INNER_LOOP2_for_C_10 = 8'd43,
    S2_INNER_LOOP2_for_C_11 = 8'd44,
    S2_INNER_LOOP2_for_C_12 = 8'd45,
    S2_INNER_LOOP2_for_C_13 = 8'd46,
    S2_INNER_LOOP2_for_C_14 = 8'd47,
    S2_INNER_LOOP2_for_C_15 = 8'd48,
    S2_INNER_LOOP2_for_C_16 = 8'd49,
    S2_INNER_LOOP2_for_C_17 = 8'd50,
    S2_INNER_LOOP2_C_0 = 8'd51,
    S2_INNER_LOOP3_for_C_0 = 8'd52,
    S2_INNER_LOOP3_for_C_1 = 8'd53,
    S2_INNER_LOOP3_for_C_2 = 8'd54,
    S2_INNER_LOOP3_for_C_3 = 8'd55,
    S2_INNER_LOOP3_for_C_4 = 8'd56,
    S2_INNER_LOOP3_for_C_5 = 8'd57,
    S2_INNER_LOOP3_for_C_6 = 8'd58,
    S2_INNER_LOOP3_for_C_7 = 8'd59,
    S2_INNER_LOOP3_for_C_8 = 8'd60,
    S2_INNER_LOOP3_for_C_9 = 8'd61,
    S2_INNER_LOOP3_for_C_10 = 8'd62,
    S2_INNER_LOOP3_for_C_11 = 8'd63,
    S2_INNER_LOOP3_for_C_12 = 8'd64,
    S2_INNER_LOOP3_for_C_13 = 8'd65,
    S2_INNER_LOOP3_for_C_14 = 8'd66,
    S2_INNER_LOOP3_for_C_15 = 8'd67,
    S2_INNER_LOOP3_for_C_16 = 8'd68,
    S2_INNER_LOOP3_for_C_17 = 8'd69,
    S2_INNER_LOOP3_C_0 = 8'd70,
    S34_OUTER_LOOP_for_C_0 = 8'd71,
    S34_OUTER_LOOP_for_C_1 = 8'd72,
    S34_OUTER_LOOP_for_C_2 = 8'd73,
    S34_OUTER_LOOP_for_C_3 = 8'd74,
    S34_OUTER_LOOP_for_C_4 = 8'd75,
    S34_OUTER_LOOP_for_C_5 = 8'd76,
    S34_OUTER_LOOP_for_C_6 = 8'd77,
    S34_OUTER_LOOP_for_C_7 = 8'd78,
    S34_OUTER_LOOP_for_C_8 = 8'd79,
    S34_OUTER_LOOP_for_C_9 = 8'd80,
    S34_OUTER_LOOP_C_0 = 8'd81,
    S5_COPY_LOOP_for_C_0 = 8'd82,
    S5_COPY_LOOP_for_C_1 = 8'd83,
    S5_COPY_LOOP_for_C_2 = 8'd84,
    S5_COPY_LOOP_for_C_3 = 8'd85,
    S5_COPY_LOOP_C_0 = 8'd86,
    S5_OUTER_LOOP_C_0 = 8'd87,
    S5_INNER_LOOP1_for_C_0 = 8'd88,
    S5_INNER_LOOP1_for_C_1 = 8'd89,
    S5_INNER_LOOP1_for_C_2 = 8'd90,
    S5_INNER_LOOP1_for_C_3 = 8'd91,
    S5_INNER_LOOP1_for_C_4 = 8'd92,
    S5_INNER_LOOP1_for_C_5 = 8'd93,
    S5_INNER_LOOP1_for_C_6 = 8'd94,
    S5_INNER_LOOP1_for_C_7 = 8'd95,
    S5_INNER_LOOP1_for_C_8 = 8'd96,
    S5_INNER_LOOP1_for_C_9 = 8'd97,
    S5_INNER_LOOP1_for_C_10 = 8'd98,
    S5_INNER_LOOP1_for_C_11 = 8'd99,
    S5_INNER_LOOP1_for_C_12 = 8'd100,
    S5_INNER_LOOP1_for_C_13 = 8'd101,
    S5_INNER_LOOP1_for_C_14 = 8'd102,
    S5_INNER_LOOP1_for_C_15 = 8'd103,
    S5_INNER_LOOP1_for_C_16 = 8'd104,
    S5_INNER_LOOP1_for_C_17 = 8'd105,
    S5_INNER_LOOP1_C_0 = 8'd106,
    S5_OUTER_LOOP_C_1 = 8'd107,
    S5_INNER_LOOP2_for_C_0 = 8'd108,
    S5_INNER_LOOP2_for_C_1 = 8'd109,
    S5_INNER_LOOP2_for_C_2 = 8'd110,
    S5_INNER_LOOP2_for_C_3 = 8'd111,
    S5_INNER_LOOP2_for_C_4 = 8'd112,
    S5_INNER_LOOP2_for_C_5 = 8'd113,
    S5_INNER_LOOP2_for_C_6 = 8'd114,
    S5_INNER_LOOP2_for_C_7 = 8'd115,
    S5_INNER_LOOP2_for_C_8 = 8'd116,
    S5_INNER_LOOP2_for_C_9 = 8'd117,
    S5_INNER_LOOP2_for_C_10 = 8'd118,
    S5_INNER_LOOP2_for_C_11 = 8'd119,
    S5_INNER_LOOP2_for_C_12 = 8'd120,
    S5_INNER_LOOP2_for_C_13 = 8'd121,
    S5_INNER_LOOP2_for_C_14 = 8'd122,
    S5_INNER_LOOP2_for_C_15 = 8'd123,
    S5_INNER_LOOP2_for_C_16 = 8'd124,
    S5_INNER_LOOP2_for_C_17 = 8'd125,
    S5_INNER_LOOP2_C_0 = 8'd126,
    S5_INNER_LOOP3_for_C_0 = 8'd127,
    S5_INNER_LOOP3_for_C_1 = 8'd128,
    S5_INNER_LOOP3_for_C_2 = 8'd129,
    S5_INNER_LOOP3_for_C_3 = 8'd130,
    S5_INNER_LOOP3_for_C_4 = 8'd131,
    S5_INNER_LOOP3_for_C_5 = 8'd132,
    S5_INNER_LOOP3_for_C_6 = 8'd133,
    S5_INNER_LOOP3_for_C_7 = 8'd134,
    S5_INNER_LOOP3_for_C_8 = 8'd135,
    S5_INNER_LOOP3_for_C_9 = 8'd136,
    S5_INNER_LOOP3_for_C_10 = 8'd137,
    S5_INNER_LOOP3_for_C_11 = 8'd138,
    S5_INNER_LOOP3_for_C_12 = 8'd139,
    S5_INNER_LOOP3_for_C_13 = 8'd140,
    S5_INNER_LOOP3_for_C_14 = 8'd141,
    S5_INNER_LOOP3_for_C_15 = 8'd142,
    S5_INNER_LOOP3_for_C_16 = 8'd143,
    S5_INNER_LOOP3_for_C_17 = 8'd144,
    S5_INNER_LOOP3_C_0 = 8'd145,
    S6_OUTER_LOOP_for_C_0 = 8'd146,
    S6_OUTER_LOOP_for_C_1 = 8'd147,
    S6_OUTER_LOOP_for_C_2 = 8'd148,
    S6_OUTER_LOOP_for_C_3 = 8'd149,
    S6_OUTER_LOOP_C_0 = 8'd150,
    main_C_1 = 8'd151;

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
        if ( S2_INNER_LOOP1_for_C_17_tr0 ) begin
          state_var_NS = S2_INNER_LOOP1_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP1_for_C_0;
        end
      end
      S2_INNER_LOOP1_C_0 : begin
        fsm_output = 8'b00011111;
        if ( S2_INNER_LOOP1_C_0_tr0 ) begin
          state_var_NS = S2_OUTER_LOOP_C_1;
        end
        else begin
          state_var_NS = S2_INNER_LOOP1_for_C_0;
        end
      end
      S2_OUTER_LOOP_C_1 : begin
        fsm_output = 8'b00100000;
        state_var_NS = S2_INNER_LOOP2_for_C_0;
      end
      S2_INNER_LOOP2_for_C_0 : begin
        fsm_output = 8'b00100001;
        state_var_NS = S2_INNER_LOOP2_for_C_1;
      end
      S2_INNER_LOOP2_for_C_1 : begin
        fsm_output = 8'b00100010;
        state_var_NS = S2_INNER_LOOP2_for_C_2;
      end
      S2_INNER_LOOP2_for_C_2 : begin
        fsm_output = 8'b00100011;
        state_var_NS = S2_INNER_LOOP2_for_C_3;
      end
      S2_INNER_LOOP2_for_C_3 : begin
        fsm_output = 8'b00100100;
        state_var_NS = S2_INNER_LOOP2_for_C_4;
      end
      S2_INNER_LOOP2_for_C_4 : begin
        fsm_output = 8'b00100101;
        state_var_NS = S2_INNER_LOOP2_for_C_5;
      end
      S2_INNER_LOOP2_for_C_5 : begin
        fsm_output = 8'b00100110;
        state_var_NS = S2_INNER_LOOP2_for_C_6;
      end
      S2_INNER_LOOP2_for_C_6 : begin
        fsm_output = 8'b00100111;
        state_var_NS = S2_INNER_LOOP2_for_C_7;
      end
      S2_INNER_LOOP2_for_C_7 : begin
        fsm_output = 8'b00101000;
        state_var_NS = S2_INNER_LOOP2_for_C_8;
      end
      S2_INNER_LOOP2_for_C_8 : begin
        fsm_output = 8'b00101001;
        state_var_NS = S2_INNER_LOOP2_for_C_9;
      end
      S2_INNER_LOOP2_for_C_9 : begin
        fsm_output = 8'b00101010;
        state_var_NS = S2_INNER_LOOP2_for_C_10;
      end
      S2_INNER_LOOP2_for_C_10 : begin
        fsm_output = 8'b00101011;
        state_var_NS = S2_INNER_LOOP2_for_C_11;
      end
      S2_INNER_LOOP2_for_C_11 : begin
        fsm_output = 8'b00101100;
        state_var_NS = S2_INNER_LOOP2_for_C_12;
      end
      S2_INNER_LOOP2_for_C_12 : begin
        fsm_output = 8'b00101101;
        state_var_NS = S2_INNER_LOOP2_for_C_13;
      end
      S2_INNER_LOOP2_for_C_13 : begin
        fsm_output = 8'b00101110;
        state_var_NS = S2_INNER_LOOP2_for_C_14;
      end
      S2_INNER_LOOP2_for_C_14 : begin
        fsm_output = 8'b00101111;
        state_var_NS = S2_INNER_LOOP2_for_C_15;
      end
      S2_INNER_LOOP2_for_C_15 : begin
        fsm_output = 8'b00110000;
        state_var_NS = S2_INNER_LOOP2_for_C_16;
      end
      S2_INNER_LOOP2_for_C_16 : begin
        fsm_output = 8'b00110001;
        state_var_NS = S2_INNER_LOOP2_for_C_17;
      end
      S2_INNER_LOOP2_for_C_17 : begin
        fsm_output = 8'b00110010;
        if ( S2_INNER_LOOP2_for_C_17_tr0 ) begin
          state_var_NS = S2_INNER_LOOP2_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP2_for_C_0;
        end
      end
      S2_INNER_LOOP2_C_0 : begin
        fsm_output = 8'b00110011;
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
        fsm_output = 8'b00110100;
        state_var_NS = S2_INNER_LOOP3_for_C_1;
      end
      S2_INNER_LOOP3_for_C_1 : begin
        fsm_output = 8'b00110101;
        state_var_NS = S2_INNER_LOOP3_for_C_2;
      end
      S2_INNER_LOOP3_for_C_2 : begin
        fsm_output = 8'b00110110;
        state_var_NS = S2_INNER_LOOP3_for_C_3;
      end
      S2_INNER_LOOP3_for_C_3 : begin
        fsm_output = 8'b00110111;
        state_var_NS = S2_INNER_LOOP3_for_C_4;
      end
      S2_INNER_LOOP3_for_C_4 : begin
        fsm_output = 8'b00111000;
        state_var_NS = S2_INNER_LOOP3_for_C_5;
      end
      S2_INNER_LOOP3_for_C_5 : begin
        fsm_output = 8'b00111001;
        state_var_NS = S2_INNER_LOOP3_for_C_6;
      end
      S2_INNER_LOOP3_for_C_6 : begin
        fsm_output = 8'b00111010;
        state_var_NS = S2_INNER_LOOP3_for_C_7;
      end
      S2_INNER_LOOP3_for_C_7 : begin
        fsm_output = 8'b00111011;
        state_var_NS = S2_INNER_LOOP3_for_C_8;
      end
      S2_INNER_LOOP3_for_C_8 : begin
        fsm_output = 8'b00111100;
        state_var_NS = S2_INNER_LOOP3_for_C_9;
      end
      S2_INNER_LOOP3_for_C_9 : begin
        fsm_output = 8'b00111101;
        state_var_NS = S2_INNER_LOOP3_for_C_10;
      end
      S2_INNER_LOOP3_for_C_10 : begin
        fsm_output = 8'b00111110;
        state_var_NS = S2_INNER_LOOP3_for_C_11;
      end
      S2_INNER_LOOP3_for_C_11 : begin
        fsm_output = 8'b00111111;
        state_var_NS = S2_INNER_LOOP3_for_C_12;
      end
      S2_INNER_LOOP3_for_C_12 : begin
        fsm_output = 8'b01000000;
        state_var_NS = S2_INNER_LOOP3_for_C_13;
      end
      S2_INNER_LOOP3_for_C_13 : begin
        fsm_output = 8'b01000001;
        state_var_NS = S2_INNER_LOOP3_for_C_14;
      end
      S2_INNER_LOOP3_for_C_14 : begin
        fsm_output = 8'b01000010;
        state_var_NS = S2_INNER_LOOP3_for_C_15;
      end
      S2_INNER_LOOP3_for_C_15 : begin
        fsm_output = 8'b01000011;
        state_var_NS = S2_INNER_LOOP3_for_C_16;
      end
      S2_INNER_LOOP3_for_C_16 : begin
        fsm_output = 8'b01000100;
        state_var_NS = S2_INNER_LOOP3_for_C_17;
      end
      S2_INNER_LOOP3_for_C_17 : begin
        fsm_output = 8'b01000101;
        if ( S2_INNER_LOOP3_for_C_17_tr0 ) begin
          state_var_NS = S2_INNER_LOOP3_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP3_for_C_0;
        end
      end
      S2_INNER_LOOP3_C_0 : begin
        fsm_output = 8'b01000110;
        if ( S2_INNER_LOOP3_C_0_tr0 ) begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S2_INNER_LOOP3_for_C_0;
        end
      end
      S34_OUTER_LOOP_for_C_0 : begin
        fsm_output = 8'b01000111;
        state_var_NS = S34_OUTER_LOOP_for_C_1;
      end
      S34_OUTER_LOOP_for_C_1 : begin
        fsm_output = 8'b01001000;
        state_var_NS = S34_OUTER_LOOP_for_C_2;
      end
      S34_OUTER_LOOP_for_C_2 : begin
        fsm_output = 8'b01001001;
        state_var_NS = S34_OUTER_LOOP_for_C_3;
      end
      S34_OUTER_LOOP_for_C_3 : begin
        fsm_output = 8'b01001010;
        state_var_NS = S34_OUTER_LOOP_for_C_4;
      end
      S34_OUTER_LOOP_for_C_4 : begin
        fsm_output = 8'b01001011;
        state_var_NS = S34_OUTER_LOOP_for_C_5;
      end
      S34_OUTER_LOOP_for_C_5 : begin
        fsm_output = 8'b01001100;
        state_var_NS = S34_OUTER_LOOP_for_C_6;
      end
      S34_OUTER_LOOP_for_C_6 : begin
        fsm_output = 8'b01001101;
        state_var_NS = S34_OUTER_LOOP_for_C_7;
      end
      S34_OUTER_LOOP_for_C_7 : begin
        fsm_output = 8'b01001110;
        state_var_NS = S34_OUTER_LOOP_for_C_8;
      end
      S34_OUTER_LOOP_for_C_8 : begin
        fsm_output = 8'b01001111;
        state_var_NS = S34_OUTER_LOOP_for_C_9;
      end
      S34_OUTER_LOOP_for_C_9 : begin
        fsm_output = 8'b01010000;
        if ( S34_OUTER_LOOP_for_C_9_tr0 ) begin
          state_var_NS = S34_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
      end
      S34_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b01010001;
        if ( S34_OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S34_OUTER_LOOP_for_C_0;
        end
      end
      S5_COPY_LOOP_for_C_0 : begin
        fsm_output = 8'b01010010;
        state_var_NS = S5_COPY_LOOP_for_C_1;
      end
      S5_COPY_LOOP_for_C_1 : begin
        fsm_output = 8'b01010011;
        state_var_NS = S5_COPY_LOOP_for_C_2;
      end
      S5_COPY_LOOP_for_C_2 : begin
        fsm_output = 8'b01010100;
        state_var_NS = S5_COPY_LOOP_for_C_3;
      end
      S5_COPY_LOOP_for_C_3 : begin
        fsm_output = 8'b01010101;
        if ( S5_COPY_LOOP_for_C_3_tr0 ) begin
          state_var_NS = S5_COPY_LOOP_C_0;
        end
        else begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
      end
      S5_COPY_LOOP_C_0 : begin
        fsm_output = 8'b01010110;
        if ( S5_COPY_LOOP_C_0_tr0 ) begin
          state_var_NS = S5_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S5_COPY_LOOP_for_C_0;
        end
      end
      S5_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b01010111;
        state_var_NS = S5_INNER_LOOP1_for_C_0;
      end
      S5_INNER_LOOP1_for_C_0 : begin
        fsm_output = 8'b01011000;
        state_var_NS = S5_INNER_LOOP1_for_C_1;
      end
      S5_INNER_LOOP1_for_C_1 : begin
        fsm_output = 8'b01011001;
        state_var_NS = S5_INNER_LOOP1_for_C_2;
      end
      S5_INNER_LOOP1_for_C_2 : begin
        fsm_output = 8'b01011010;
        state_var_NS = S5_INNER_LOOP1_for_C_3;
      end
      S5_INNER_LOOP1_for_C_3 : begin
        fsm_output = 8'b01011011;
        state_var_NS = S5_INNER_LOOP1_for_C_4;
      end
      S5_INNER_LOOP1_for_C_4 : begin
        fsm_output = 8'b01011100;
        state_var_NS = S5_INNER_LOOP1_for_C_5;
      end
      S5_INNER_LOOP1_for_C_5 : begin
        fsm_output = 8'b01011101;
        state_var_NS = S5_INNER_LOOP1_for_C_6;
      end
      S5_INNER_LOOP1_for_C_6 : begin
        fsm_output = 8'b01011110;
        state_var_NS = S5_INNER_LOOP1_for_C_7;
      end
      S5_INNER_LOOP1_for_C_7 : begin
        fsm_output = 8'b01011111;
        state_var_NS = S5_INNER_LOOP1_for_C_8;
      end
      S5_INNER_LOOP1_for_C_8 : begin
        fsm_output = 8'b01100000;
        state_var_NS = S5_INNER_LOOP1_for_C_9;
      end
      S5_INNER_LOOP1_for_C_9 : begin
        fsm_output = 8'b01100001;
        state_var_NS = S5_INNER_LOOP1_for_C_10;
      end
      S5_INNER_LOOP1_for_C_10 : begin
        fsm_output = 8'b01100010;
        state_var_NS = S5_INNER_LOOP1_for_C_11;
      end
      S5_INNER_LOOP1_for_C_11 : begin
        fsm_output = 8'b01100011;
        state_var_NS = S5_INNER_LOOP1_for_C_12;
      end
      S5_INNER_LOOP1_for_C_12 : begin
        fsm_output = 8'b01100100;
        state_var_NS = S5_INNER_LOOP1_for_C_13;
      end
      S5_INNER_LOOP1_for_C_13 : begin
        fsm_output = 8'b01100101;
        state_var_NS = S5_INNER_LOOP1_for_C_14;
      end
      S5_INNER_LOOP1_for_C_14 : begin
        fsm_output = 8'b01100110;
        state_var_NS = S5_INNER_LOOP1_for_C_15;
      end
      S5_INNER_LOOP1_for_C_15 : begin
        fsm_output = 8'b01100111;
        state_var_NS = S5_INNER_LOOP1_for_C_16;
      end
      S5_INNER_LOOP1_for_C_16 : begin
        fsm_output = 8'b01101000;
        state_var_NS = S5_INNER_LOOP1_for_C_17;
      end
      S5_INNER_LOOP1_for_C_17 : begin
        fsm_output = 8'b01101001;
        if ( S5_INNER_LOOP1_for_C_17_tr0 ) begin
          state_var_NS = S5_INNER_LOOP1_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP1_for_C_0;
        end
      end
      S5_INNER_LOOP1_C_0 : begin
        fsm_output = 8'b01101010;
        if ( S5_INNER_LOOP1_C_0_tr0 ) begin
          state_var_NS = S5_OUTER_LOOP_C_1;
        end
        else begin
          state_var_NS = S5_INNER_LOOP1_for_C_0;
        end
      end
      S5_OUTER_LOOP_C_1 : begin
        fsm_output = 8'b01101011;
        state_var_NS = S5_INNER_LOOP2_for_C_0;
      end
      S5_INNER_LOOP2_for_C_0 : begin
        fsm_output = 8'b01101100;
        state_var_NS = S5_INNER_LOOP2_for_C_1;
      end
      S5_INNER_LOOP2_for_C_1 : begin
        fsm_output = 8'b01101101;
        state_var_NS = S5_INNER_LOOP2_for_C_2;
      end
      S5_INNER_LOOP2_for_C_2 : begin
        fsm_output = 8'b01101110;
        state_var_NS = S5_INNER_LOOP2_for_C_3;
      end
      S5_INNER_LOOP2_for_C_3 : begin
        fsm_output = 8'b01101111;
        state_var_NS = S5_INNER_LOOP2_for_C_4;
      end
      S5_INNER_LOOP2_for_C_4 : begin
        fsm_output = 8'b01110000;
        state_var_NS = S5_INNER_LOOP2_for_C_5;
      end
      S5_INNER_LOOP2_for_C_5 : begin
        fsm_output = 8'b01110001;
        state_var_NS = S5_INNER_LOOP2_for_C_6;
      end
      S5_INNER_LOOP2_for_C_6 : begin
        fsm_output = 8'b01110010;
        state_var_NS = S5_INNER_LOOP2_for_C_7;
      end
      S5_INNER_LOOP2_for_C_7 : begin
        fsm_output = 8'b01110011;
        state_var_NS = S5_INNER_LOOP2_for_C_8;
      end
      S5_INNER_LOOP2_for_C_8 : begin
        fsm_output = 8'b01110100;
        state_var_NS = S5_INNER_LOOP2_for_C_9;
      end
      S5_INNER_LOOP2_for_C_9 : begin
        fsm_output = 8'b01110101;
        state_var_NS = S5_INNER_LOOP2_for_C_10;
      end
      S5_INNER_LOOP2_for_C_10 : begin
        fsm_output = 8'b01110110;
        state_var_NS = S5_INNER_LOOP2_for_C_11;
      end
      S5_INNER_LOOP2_for_C_11 : begin
        fsm_output = 8'b01110111;
        state_var_NS = S5_INNER_LOOP2_for_C_12;
      end
      S5_INNER_LOOP2_for_C_12 : begin
        fsm_output = 8'b01111000;
        state_var_NS = S5_INNER_LOOP2_for_C_13;
      end
      S5_INNER_LOOP2_for_C_13 : begin
        fsm_output = 8'b01111001;
        state_var_NS = S5_INNER_LOOP2_for_C_14;
      end
      S5_INNER_LOOP2_for_C_14 : begin
        fsm_output = 8'b01111010;
        state_var_NS = S5_INNER_LOOP2_for_C_15;
      end
      S5_INNER_LOOP2_for_C_15 : begin
        fsm_output = 8'b01111011;
        state_var_NS = S5_INNER_LOOP2_for_C_16;
      end
      S5_INNER_LOOP2_for_C_16 : begin
        fsm_output = 8'b01111100;
        state_var_NS = S5_INNER_LOOP2_for_C_17;
      end
      S5_INNER_LOOP2_for_C_17 : begin
        fsm_output = 8'b01111101;
        if ( S5_INNER_LOOP2_for_C_17_tr0 ) begin
          state_var_NS = S5_INNER_LOOP2_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP2_for_C_0;
        end
      end
      S5_INNER_LOOP2_C_0 : begin
        fsm_output = 8'b01111110;
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
        fsm_output = 8'b01111111;
        state_var_NS = S5_INNER_LOOP3_for_C_1;
      end
      S5_INNER_LOOP3_for_C_1 : begin
        fsm_output = 8'b10000000;
        state_var_NS = S5_INNER_LOOP3_for_C_2;
      end
      S5_INNER_LOOP3_for_C_2 : begin
        fsm_output = 8'b10000001;
        state_var_NS = S5_INNER_LOOP3_for_C_3;
      end
      S5_INNER_LOOP3_for_C_3 : begin
        fsm_output = 8'b10000010;
        state_var_NS = S5_INNER_LOOP3_for_C_4;
      end
      S5_INNER_LOOP3_for_C_4 : begin
        fsm_output = 8'b10000011;
        state_var_NS = S5_INNER_LOOP3_for_C_5;
      end
      S5_INNER_LOOP3_for_C_5 : begin
        fsm_output = 8'b10000100;
        state_var_NS = S5_INNER_LOOP3_for_C_6;
      end
      S5_INNER_LOOP3_for_C_6 : begin
        fsm_output = 8'b10000101;
        state_var_NS = S5_INNER_LOOP3_for_C_7;
      end
      S5_INNER_LOOP3_for_C_7 : begin
        fsm_output = 8'b10000110;
        state_var_NS = S5_INNER_LOOP3_for_C_8;
      end
      S5_INNER_LOOP3_for_C_8 : begin
        fsm_output = 8'b10000111;
        state_var_NS = S5_INNER_LOOP3_for_C_9;
      end
      S5_INNER_LOOP3_for_C_9 : begin
        fsm_output = 8'b10001000;
        state_var_NS = S5_INNER_LOOP3_for_C_10;
      end
      S5_INNER_LOOP3_for_C_10 : begin
        fsm_output = 8'b10001001;
        state_var_NS = S5_INNER_LOOP3_for_C_11;
      end
      S5_INNER_LOOP3_for_C_11 : begin
        fsm_output = 8'b10001010;
        state_var_NS = S5_INNER_LOOP3_for_C_12;
      end
      S5_INNER_LOOP3_for_C_12 : begin
        fsm_output = 8'b10001011;
        state_var_NS = S5_INNER_LOOP3_for_C_13;
      end
      S5_INNER_LOOP3_for_C_13 : begin
        fsm_output = 8'b10001100;
        state_var_NS = S5_INNER_LOOP3_for_C_14;
      end
      S5_INNER_LOOP3_for_C_14 : begin
        fsm_output = 8'b10001101;
        state_var_NS = S5_INNER_LOOP3_for_C_15;
      end
      S5_INNER_LOOP3_for_C_15 : begin
        fsm_output = 8'b10001110;
        state_var_NS = S5_INNER_LOOP3_for_C_16;
      end
      S5_INNER_LOOP3_for_C_16 : begin
        fsm_output = 8'b10001111;
        state_var_NS = S5_INNER_LOOP3_for_C_17;
      end
      S5_INNER_LOOP3_for_C_17 : begin
        fsm_output = 8'b10010000;
        if ( S5_INNER_LOOP3_for_C_17_tr0 ) begin
          state_var_NS = S5_INNER_LOOP3_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP3_for_C_0;
        end
      end
      S5_INNER_LOOP3_C_0 : begin
        fsm_output = 8'b10010001;
        if ( S5_INNER_LOOP3_C_0_tr0 ) begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
        else begin
          state_var_NS = S5_INNER_LOOP3_for_C_0;
        end
      end
      S6_OUTER_LOOP_for_C_0 : begin
        fsm_output = 8'b10010010;
        state_var_NS = S6_OUTER_LOOP_for_C_1;
      end
      S6_OUTER_LOOP_for_C_1 : begin
        fsm_output = 8'b10010011;
        state_var_NS = S6_OUTER_LOOP_for_C_2;
      end
      S6_OUTER_LOOP_for_C_2 : begin
        fsm_output = 8'b10010100;
        state_var_NS = S6_OUTER_LOOP_for_C_3;
      end
      S6_OUTER_LOOP_for_C_3 : begin
        fsm_output = 8'b10010101;
        if ( S6_OUTER_LOOP_for_C_3_tr0 ) begin
          state_var_NS = S6_OUTER_LOOP_C_0;
        end
        else begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
      end
      S6_OUTER_LOOP_C_0 : begin
        fsm_output = 8'b10010110;
        if ( S6_OUTER_LOOP_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = S6_OUTER_LOOP_for_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b10010111;
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
  clk, xx_rsc_cgo_iro, xx_rsci_clken_d, yy_rsc_cgo_iro, yy_rsci_clken_d, mult_12_z_mul_cmp_z,
      ensig_cgo_iro, mult_z_mul_cmp_z, core_wen, xx_rsc_cgo, yy_rsc_cgo, mult_12_z_mul_cmp_z_oreg,
      ensig_cgo, mult_t_mul_cmp_en, mult_z_mul_cmp_z_oreg
);
  input clk;
  input xx_rsc_cgo_iro;
  output xx_rsci_clken_d;
  input yy_rsc_cgo_iro;
  output yy_rsci_clken_d;
  input [31:0] mult_12_z_mul_cmp_z;
  input ensig_cgo_iro;
  input [31:0] mult_z_mul_cmp_z;
  input core_wen;
  input xx_rsc_cgo;
  input yy_rsc_cgo;
  output [31:0] mult_12_z_mul_cmp_z_oreg;
  reg [31:0] mult_12_z_mul_cmp_z_oreg;
  input ensig_cgo;
  output mult_t_mul_cmp_en;
  output [31:0] mult_z_mul_cmp_z_oreg;
  reg [31:0] mult_z_mul_cmp_z_oreg;



  // Interconnect Declarations for Component Instantiations 
  assign xx_rsci_clken_d = core_wen & (xx_rsc_cgo | xx_rsc_cgo_iro);
  assign yy_rsci_clken_d = core_wen & (yy_rsc_cgo | yy_rsc_cgo_iro);
  assign mult_t_mul_cmp_en = core_wen & (ensig_cgo | ensig_cgo_iro);
  always @(posedge clk) begin
    if ( core_wen ) begin
      mult_12_z_mul_cmp_z_oreg <= mult_12_z_mul_cmp_z;
      mult_z_mul_cmp_z_oreg <= mult_z_mul_cmp_z;
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
      mult_12_z_mul_cmp_a, mult_12_z_mul_cmp_b, mult_12_z_mul_cmp_z, mult_z_mul_cmp_a,
      mult_z_mul_cmp_b, mult_z_mul_cmp_z, xx_rsci_we_d_pff, yy_rsci_we_d_pff
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
  output [19:0] mult_12_z_mul_cmp_a;
  reg [19:0] mult_12_z_mul_cmp_a;
  output [31:0] mult_12_z_mul_cmp_b;
  reg [31:0] mult_12_z_mul_cmp_b;
  input [31:0] mult_12_z_mul_cmp_z;
  output [31:0] mult_z_mul_cmp_a;
  reg [31:0] mult_z_mul_cmp_a;
  output [31:0] mult_z_mul_cmp_b;
  reg [31:0] mult_z_mul_cmp_b;
  input [31:0] mult_z_mul_cmp_z;
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
  wire [31:0] mult_12_z_mul_cmp_z_oreg;
  wire mult_t_mul_cmp_en;
  wire [51:0] mult_t_mul_cmp_z;
  wire [31:0] mult_z_mul_cmp_z_oreg;
  reg [4:0] x_rsci_s_raddr_core_9_5;
  reg [4:0] x_rsci_s_raddr_core_4_0;
  reg [4:0] x_rsci_s_waddr_core_9_5;
  reg [4:0] x_rsci_s_waddr_core_4_0;
  wire [7:0] fsm_output;
  wire mux_tmp;
  wire mux_tmp_1;
  wire and_dcpl_9;
  wire or_tmp_12;
  wire and_dcpl_17;
  wire and_tmp;
  wire mux_tmp_44;
  wire or_tmp_28;
  wire and_dcpl_19;
  wire or_tmp_35;
  wire mux_tmp_68;
  wire and_dcpl_23;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_28;
  wire and_dcpl_33;
  wire and_dcpl_34;
  wire and_dcpl_35;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire nor_tmp_10;
  wire and_dcpl_42;
  wire or_tmp_64;
  wire and_dcpl_49;
  wire or_tmp_77;
  wire or_tmp_80;
  wire mux_tmp_92;
  wire not_tmp_58;
  wire and_dcpl_53;
  wire not_tmp_59;
  wire and_dcpl_54;
  wire mux_tmp_99;
  wire or_tmp_94;
  wire or_tmp_105;
  wire and_dcpl_65;
  wire and_dcpl_66;
  wire and_dcpl_67;
  wire and_dcpl_68;
  wire and_dcpl_69;
  wire or_tmp_119;
  wire and_dcpl_70;
  wire and_dcpl_71;
  wire and_dcpl_72;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire and_dcpl_75;
  wire and_dcpl_76;
  wire and_dcpl_78;
  wire and_dcpl_80;
  wire and_dcpl_82;
  wire and_dcpl_84;
  wire and_dcpl_87;
  wire and_dcpl_88;
  wire and_dcpl_89;
  wire and_dcpl_91;
  wire and_dcpl_93;
  wire and_dcpl_94;
  wire and_dcpl_95;
  wire and_dcpl_96;
  wire and_dcpl_104;
  wire and_dcpl_105;
  wire and_dcpl_108;
  wire and_dcpl_117;
  wire and_dcpl_118;
  wire nor_tmp_21;
  wire mux_tmp_138;
  wire and_dcpl_125;
  wire or_tmp_127;
  wire mux_tmp_142;
  wire not_tmp_78;
  wire and_dcpl_134;
  wire and_dcpl_136;
  wire and_dcpl_137;
  wire or_tmp_135;
  wire or_tmp_173;
  wire mux_tmp_171;
  wire and_dcpl_147;
  wire and_dcpl_149;
  wire and_dcpl_156;
  wire or_tmp_202;
  wire and_dcpl_179;
  wire and_dcpl_180;
  wire and_dcpl_189;
  wire mux_tmp_202;
  wire not_tmp_110;
  wire nor_tmp_34;
  wire or_tmp_222;
  wire mux_tmp_219;
  wire and_dcpl_200;
  wire and_dcpl_202;
  wire or_tmp_232;
  wire not_tmp_125;
  wire mux_tmp_226;
  wire or_tmp_249;
  wire mux_tmp_239;
  wire nand_tmp_12;
  wire or_tmp_254;
  wire mux_tmp_251;
  wire or_tmp_258;
  wire or_tmp_259;
  wire or_tmp_263;
  wire or_tmp_265;
  wire mux_tmp_268;
  wire or_tmp_287;
  wire nor_tmp_42;
  wire mux_tmp_280;
  wire or_tmp_291;
  wire or_tmp_293;
  wire mux_tmp_298;
  wire or_tmp_300;
  wire nor_tmp_51;
  wire and_dcpl_213;
  wire or_tmp_356;
  wire or_tmp_358;
  wire and_tmp_8;
  wire mux_tmp_408;
  wire not_tmp_220;
  wire or_tmp_419;
  wire not_tmp_231;
  wire mux_tmp_489;
  wire or_tmp_521;
  wire or_tmp_538;
  wire and_dcpl_240;
  wire and_dcpl_241;
  wire and_dcpl_259;
  wire and_dcpl_262;
  wire and_dcpl_276;
  wire and_dcpl_278;
  wire and_dcpl_279;
  wire and_dcpl_280;
  wire and_dcpl_311;
  wire and_dcpl_342;
  wire and_dcpl_343;
  wire and_dcpl_344;
  wire and_dcpl_375;
  wire and_dcpl_406;
  wire and_dcpl_413;
  reg S2_OUTER_LOOP_c_1_sva;
  reg [31:0] m_sva;
  reg [4:0] S1_OUTER_LOOP_for_acc_cse_sva;
  wire and_492_cse;
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
  wire signed [15:0] nl_reg_tw_rsci_s_raddr_core_cse;
  reg reg_xx_rsc_cgo_cse;
  reg reg_yy_rsc_cgo_cse;
  reg reg_x_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  wire or_235_cse;
  wire or_648_cse;
  wire nor_107_cse;
  wire or_cse;
  reg [31:0] reg_mult_res_lpi_4_dfm_cse;
  reg [4:0] reg_drf_revArr_ptr_smx_9_0_cse;
  wire and_455_cse;
  wire or_283_cse;
  wire or_188_cse;
  wire or_333_cse;
  wire or_6_cse;
  wire nand_cse;
  wire and_494_cse;
  wire and_465_cse;
  wire or_495_cse;
  wire and_483_cse;
  wire or_533_cse;
  wire or_118_cse;
  wire or_124_cse;
  wire or_112_cse;
  wire or_490_cse;
  wire mux_240_cse;
  wire and_490_cse;
  wire nand_59_cse;
  wire nand_94_cse;
  wire or_103_cse;
  wire [31:0] mult_res_sva_1;
  wire [32:0] nl_mult_res_sva_1;
  wire mux_234_cse;
  wire mux_186_rmff;
  reg [19:0] S34_OUTER_LOOP_for_tf_h_sva;
  wire yy_rsci_wadr_d_mx0c1;
  wire yy_rsci_wadr_d_mx0c0;
  wire yy_rsci_wadr_d_mx0c10;
  wire yy_rsci_wadr_d_mx0c2;
  wire yy_rsci_wadr_d_mx0c3;
  wire yy_rsci_wadr_d_mx0c4;
  wire yy_rsci_wadr_d_mx0c7;
  wire yy_rsci_wadr_d_mx0c5;
  wire yy_rsci_wadr_d_mx0c6;
  wire yy_rsci_wadr_d_mx0c8;
  wire yy_rsci_wadr_d_mx0c9;
  reg [1:0] S2_INNER_LOOP1_r_4_2_sva_1_0;
  wire yy_rsci_radr_d_mx0c0;
  wire yy_rsci_radr_d_mx0c1;
  wire yy_rsci_radr_d_mx0c2;
  wire yy_rsci_radr_d_mx0c3;
  wire yy_rsci_radr_d_mx0c6;
  wire xx_rsci_wadr_d_mx0c1;
  wire xx_rsci_wadr_d_mx0c2;
  wire xx_rsci_wadr_d_mx0c3;
  wire xx_rsci_wadr_d_mx0c6;
  wire xx_rsci_wadr_d_mx0c4;
  wire xx_rsci_wadr_d_mx0c5;
  wire xx_rsci_wadr_d_mx0c7;
  wire xx_rsci_wadr_d_mx0c8;
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
  reg [31:0] modulo_add_7_mux_itm;
  reg [31:0] modulo_add_5_mux_itm;
  reg [31:0] modulo_add_4_mux_itm;
  reg [31:0] modulo_sub_4_mux_itm;
  reg [31:0] modulo_sub_5_mux_itm;
  reg [31:0] modulo_add_6_mux_itm;
  reg [31:0] modulo_sub_6_mux_itm;
  reg [31:0] modulo_sub_7_mux_itm;
  reg [31:0] modulo_add_15_mux_itm;
  reg [31:0] modulo_add_13_mux_itm;
  reg [31:0] modulo_add_12_mux_itm;
  reg [31:0] modulo_sub_12_mux_itm;
  reg [31:0] modulo_sub_13_mux_itm;
  reg [31:0] modulo_add_14_mux_itm;
  reg [31:0] modulo_sub_14_mux_itm;
  reg [31:0] modulo_sub_15_mux_itm;
  reg [31:0] modulo_add_23_mux_itm;
  reg [31:0] modulo_add_21_mux_itm;
  reg [31:0] modulo_add_20_mux_itm;
  reg [31:0] modulo_sub_20_mux_itm;
  reg [31:0] modulo_sub_21_mux_itm;
  reg [31:0] modulo_add_22_mux_itm;
  reg [31:0] modulo_sub_22_mux_itm;
  reg [31:0] modulo_sub_23_mux_itm;
  reg [31:0] modulo_add_3_mux_itm;
  reg [31:0] modulo_add_1_mux_itm;
  reg [31:0] modulo_add_mux_itm;
  reg [31:0] modulo_sub_mux_itm;
  reg [31:0] modulo_sub_1_mux_itm;
  reg [31:0] modulo_add_2_mux_itm;
  reg [31:0] modulo_sub_2_mux_itm;
  reg [31:0] modulo_sub_3_mux_itm;
  reg [31:0] modulo_add_11_mux_itm;
  reg [31:0] modulo_add_9_mux_itm;
  reg [31:0] modulo_add_8_mux_itm;
  reg [31:0] modulo_sub_8_mux_itm;
  reg [31:0] modulo_sub_9_mux_itm;
  reg [31:0] modulo_add_10_mux_itm;
  reg [31:0] modulo_sub_10_mux_itm;
  reg [31:0] modulo_sub_11_mux_itm;
  reg [31:0] modulo_add_19_mux_itm;
  reg [31:0] modulo_add_17_mux_itm;
  reg [31:0] modulo_add_16_mux_itm;
  reg [31:0] modulo_sub_16_mux_itm;
  reg [31:0] modulo_sub_17_mux_itm;
  reg [31:0] modulo_add_18_mux_itm;
  reg [31:0] modulo_sub_18_mux_itm;
  reg [31:0] modulo_sub_19_mux_itm;
  wire mux_137_itm;
  wire mux_233_itm;
  wire mux_103_itm;
  wire mux_139_itm;
  wire mux_143_itm;
  wire mux_147_itm;
  wire mux_149_itm;
  wire mux_192_itm;
  wire mux_194_itm;
  wire mux_200_itm;
  wire mux_196_itm;
  wire [3:0] z_out;
  wire [5:0] z_out_1;
  wire [6:0] nl_z_out_1;
  wire not_tmp_353;
  wire [19:0] z_out_2;
  wire [20:0] nl_z_out_2;
  wire or_tmp_606;
  wire not_tmp_362;
  wire mux_tmp_562;
  wire not_tmp_369;
  wire or_tmp_634;
  wire [31:0] z_out_4;
  wire [31:0] z_out_5;
  wire [31:0] z_out_6;
  wire [32:0] nl_z_out_6;
  wire [31:0] z_out_8;
  wire [31:0] z_out_9;
  wire [32:0] nl_z_out_9;
  wire [31:0] z_out_10;
  wire [31:0] z_out_11;
  wire [32:0] nl_z_out_11;
  wire and_dcpl_583;
  wire [31:0] z_out_12;
  wire [32:0] nl_z_out_12;
  wire [31:0] z_out_14;
  wire and_dcpl_703;
  wire [31:0] z_out_17;
  wire [32:0] nl_z_out_17;
  reg [19:0] S1_OUTER_LOOP_for_p_sva_1;
  reg [31:0] butterFly_11_f1_sva;
  reg [31:0] butterFly_14_f1_sva;
  reg [31:0] mult_10_z_asn_itm;
  reg [31:0] operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm;
  reg [31:0] mult_11_z_asn_itm;
  reg [31:0] mult_16_z_asn_itm;
  reg [31:0] mult_17_z_asn_itm;
  wire butterFly_4_tw_and_cse_2_sva_mx0w2;
  wire S1_OUTER_LOOP_for_p_sva_1_mx0c1;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c0;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c2;
  wire S1_OUTER_LOOP_for_acc_cse_sva_mx0c3;
  wire S2_OUTER_LOOP_c_1_sva_mx0c1;
  wire S2_OUTER_LOOP_c_1_sva_mx0c2;
  wire S2_OUTER_LOOP_c_1_sva_mx0c3;
  wire butterFly_10_f1_sva_mx0c0;
  wire butterFly_10_f1_sva_mx0c1;
  wire butterFly_10_f1_sva_mx0c2;
  wire S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1;
  wire S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2;
  wire [1:0] butterFly_tw_and_cse_3_2_sva_1;
  wire mult_11_z_asn_itm_mx0c1;
  wire mult_10_z_asn_itm_mx0c1;
  wire modulo_sub_3_mux_itm_mx0c1;
  wire modulo_sub_1_mux_itm_mx0c1;
  wire modulo_sub_mux_itm_mx0c1;
  wire modulo_add_2_mux_itm_mx0c1;
  wire modulo_sub_2_mux_itm_mx0c1;
  wire modulo_sub_7_mux_itm_mx0c1;
  wire modulo_sub_5_mux_itm_mx0c1;
  wire modulo_sub_4_mux_itm_mx0c1;
  wire modulo_add_6_mux_itm_mx0c1;
  wire modulo_sub_6_mux_itm_mx0c1;
  wire modulo_sub_11_mux_itm_mx0c1;
  wire modulo_sub_9_mux_itm_mx0c1;
  wire modulo_sub_8_mux_itm_mx0c1;
  wire modulo_add_10_mux_itm_mx0c1;
  wire modulo_sub_10_mux_itm_mx0c1;
  wire modulo_sub_15_mux_itm_mx0c1;
  wire modulo_sub_13_mux_itm_mx0c1;
  wire modulo_sub_12_mux_itm_mx0c1;
  wire modulo_add_14_mux_itm_mx0c1;
  wire modulo_sub_14_mux_itm_mx0c1;
  wire modulo_sub_19_mux_itm_mx0c1;
  wire modulo_sub_17_mux_itm_mx0c1;
  wire modulo_sub_16_mux_itm_mx0c1;
  wire modulo_add_18_mux_itm_mx0c1;
  wire modulo_sub_18_mux_itm_mx0c1;
  wire modulo_sub_23_mux_itm_mx0c1;
  wire modulo_sub_21_mux_itm_mx0c1;
  wire modulo_sub_20_mux_itm_mx0c1;
  wire modulo_add_22_mux_itm_mx0c1;
  wire modulo_sub_22_mux_itm_mx0c1;
  wire and_509_ssc;
  reg [31:0] reg_mult_3_res_lpi_4_dfm_cse_1;
  wire nor_37_cse;
  wire nor_77_cse;
  wire nor_192_cse;
  wire nor_291_cse;
  wire and_570_cse;
  wire and_594_cse;
  wire or_tmp_696;
  wire or_tmp_697;
  wire or_tmp_699;
  wire mux_tmp_627;
  wire or_tmp_725;
  wire or_tmp_726;
  wire not_tmp_509;
  wire or_tmp_732;
  wire or_tmp_735;
  wire [5:0] S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt;
  wire [1:0] butterFly_tw_butterFly_tw_mux_rgt;
  reg S2_COPY_LOOP_for_i_5_0_sva_1_5;
  reg [4:0] S2_COPY_LOOP_for_i_5_0_sva_1_4_0;
  reg butterFly_12_tw_and_cse_3_2_sva_1;
  reg butterFly_12_tw_and_cse_3_2_sva_0;
  reg reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg;
  reg reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg;
  reg [2:0] reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg;
  wire nor_211_ssc;
  wire S2_COPY_LOOP_p_nand_seb;
  wire or_336_cse_1;
  wire or_79_cse;
  wire or_823_cse;
  wire and_480_cse;
  wire or_857_cse;
  wire or_842_cse;
  wire or_858_cse;
  wire or_826_cse;
  wire or_785_cse;
  wire mux_680_cse;
  wire mux_378_cse;
  wire mux_198_itm;
  wire mux_388_itm;
  wire modulo_add_22_acc_1_itm_32_1;
  wire modulo_add_18_acc_1_itm_32_1;
  wire modulo_add_14_acc_1_itm_32_1;
  wire modulo_add_10_acc_1_itm_32_1;
  wire modulo_add_6_acc_1_itm_32_1;
  wire modulo_add_2_acc_1_itm_32_1;
  wire z_out_18_32;
  wire nor_188_cse;
  wire [31:0] mult_3_if_mult_3_if_mux_1_cse;
  wire [31:0] acc_6_cse_32_1;
  wire [32:0] nl_acc_6_cse_32_1;
  wire [31:0] acc_12_cse_32_1;
  wire [32:0] nl_acc_12_cse_32_1;

  wire[0:0] mux_53_nl;
  wire[0:0] mux_52_nl;
  wire[0:0] mux_51_nl;
  wire[0:0] mux_50_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] mux_48_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] mux_46_nl;
  wire[0:0] mux_45_nl;
  wire[0:0] mux_71_nl;
  wire[0:0] nor_197_nl;
  wire[0:0] nor_198_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] mux_76_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] nor_189_nl;
  wire[0:0] nor_190_nl;
  wire[0:0] mux_74_nl;
  wire[0:0] nor_191_nl;
  wire[0:0] or_59_nl;
  wire[0:0] mux_73_nl;
  wire[0:0] nor_194_nl;
  wire[0:0] mux_72_nl;
  wire[0:0] nor_195_nl;
  wire[0:0] nor_196_nl;
  wire[0:0] mux_89_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] or_81_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] mux_85_nl;
  wire[0:0] mux_84_nl;
  wire[0:0] or_78_nl;
  wire[0:0] or_76_nl;
  wire[0:0] mux_83_nl;
  wire[0:0] or_73_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] or_71_nl;
  wire[0:0] nand_78_nl;
  wire[0:0] mux_94_nl;
  wire[0:0] mux_93_nl;
  wire[0:0] nand_77_nl;
  wire[0:0] butterFly_tw_h_or_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] mux_100_nl;
  wire[0:0] nor_187_nl;
  wire[0:0] and_49_nl;
  wire[0:0] mux_90_nl;
  wire[0:0] mux_110_nl;
  wire[0:0] mux_109_nl;
  wire[0:0] mux_108_nl;
  wire[0:0] mux_107_nl;
  wire[0:0] or_108_nl;
  wire[0:0] mux_106_nl;
  wire[0:0] or_107_nl;
  wire[0:0] mux_105_nl;
  wire[0:0] or_106_nl;
  wire[0:0] or_105_nl;
  wire[0:0] mux_104_nl;
  wire[0:0] nand_76_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] mux_111_nl;
  wire[0:0] nand_66_nl;
  wire[0:0] and_62_nl;
  wire[0:0] mux_115_nl;
  wire[0:0] and_61_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] mux_136_nl;
  wire[0:0] mux_135_nl;
  wire[0:0] mux_134_nl;
  wire[0:0] mux_133_nl;
  wire[0:0] or_130_nl;
  wire[0:0] mux_132_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] mux_129_nl;
  wire[0:0] mux_128_nl;
  wire[0:0] mux_127_nl;
  wire[0:0] mux_126_nl;
  wire[0:0] mux_125_nl;
  wire[0:0] mux_124_nl;
  wire[0:0] or_127_nl;
  wire[0:0] mux_123_nl;
  wire[0:0] mux_122_nl;
  wire[0:0] or_125_nl;
  wire[0:0] mux_121_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] or_123_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] or_122_nl;
  wire[0:0] mux_117_nl;
  wire[0:0] or_121_nl;
  wire[0:0] mux_116_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] and_472_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] or_194_nl;
  wire[0:0] mux_179_nl;
  wire[0:0] nand_64_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] nor_157_nl;
  wire[0:0] nor_158_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] mux_175_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] nor_159_nl;
  wire[0:0] or_189_nl;
  wire[0:0] mux_172_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] nor_160_nl;
  wire[0:0] mux_232_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] or_255_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] nand_11_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] nand_10_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] or_254_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] or_250_nl;
  wire[0:0] or_247_nl;
  wire[0:0] nor_212_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] or_647_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] or_272_nl;
  wire[0:0] nand_13_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] nand_58_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] mux_265_nl;
  wire[0:0] mux_264_nl;
  wire[0:0] nand_15_nl;
  wire[0:0] mux_263_nl;
  wire[0:0] mux_262_nl;
  wire[0:0] mux_261_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] mux_259_nl;
  wire[0:0] or_278_nl;
  wire[0:0] or_277_nl;
  wire[0:0] mux_258_nl;
  wire[0:0] mux_257_nl;
  wire[0:0] or_273_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] mux_273_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] and_462_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] nor_134_nl;
  wire[0:0] nor_135_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] mux_269_nl;
  wire[0:0] nor_136_nl;
  wire[0:0] nor_137_nl;
  wire[0:0] nor_138_nl;
  wire[0:0] nor_139_nl;
  wire[0:0] mux_267_nl;
  wire[0:0] or_286_nl;
  wire[0:0] or_285_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] nor_132_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] nand_16_nl;
  wire[0:0] mux_277_nl;
  wire[0:0] or_300_nl;
  wire[0:0] nor_133_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] or_311_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] mux_288_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] or_309_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] or_305_nl;
  wire[0:0] or_303_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] mux_300_nl;
  wire[0:0] or_318_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] nor_125_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] or_326_nl;
  wire[0:0] nand_18_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] nor_126_nl;
  wire[0:0] nor_127_nl;
  wire[0:0] mux_626_nl;
  wire[0:0] mux_625_nl;
  wire[0:0] mux_624_nl;
  wire[0:0] mux_623_nl;
  wire[0:0] mux_622_nl;
  wire[0:0] nand_135_nl;
  wire[0:0] mux_621_nl;
  wire[0:0] mux_620_nl;
  wire[0:0] and_836_nl;
  wire[0:0] mux_619_nl;
  wire[0:0] mux_618_nl;
  wire[0:0] mux_617_nl;
  wire[0:0] or_790_nl;
  wire[0:0] mux_616_nl;
  wire[0:0] or_789_nl;
  wire[0:0] mux_615_nl;
  wire[0:0] or_787_nl;
  wire[0:0] and_837_nl;
  wire[0:0] S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl;
  wire[0:0] mux_638_nl;
  wire[0:0] mux_637_nl;
  wire[0:0] mux_636_nl;
  wire[0:0] mux_635_nl;
  wire[0:0] mux_634_nl;
  wire[0:0] nor_358_nl;
  wire[0:0] nor_359_nl;
  wire[0:0] nor_360_nl;
  wire[0:0] mux_633_nl;
  wire[0:0] mux_632_nl;
  wire[0:0] nor_361_nl;
  wire[0:0] nor_362_nl;
  wire[0:0] nor_363_nl;
  wire[0:0] mux_631_nl;
  wire[0:0] nor_364_nl;
  wire[0:0] nor_365_nl;
  wire[0:0] nor_366_nl;
  wire[0:0] mux_630_nl;
  wire[0:0] mux_629_nl;
  wire[0:0] mux_628_nl;
  wire[2:0] S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl;
  wire[0:0] S2_COPY_LOOP_p_or_nl;
  wire[0:0] mux_312_nl;
  wire[0:0] mux_26_nl;
  wire[0:0] mux_23_nl;
  wire[0:0] mux_21_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] mux_20_nl;
  wire[0:0] mux_646_nl;
  wire[0:0] mux_645_nl;
  wire[0:0] mux_644_nl;
  wire[0:0] nor_367_nl;
  wire[0:0] nor_368_nl;
  wire[0:0] nor_369_nl;
  wire[0:0] mux_643_nl;
  wire[0:0] mux_642_nl;
  wire[0:0] and_838_nl;
  wire[0:0] mux_641_nl;
  wire[0:0] nor_370_nl;
  wire[0:0] nor_371_nl;
  wire[0:0] nor_372_nl;
  wire[0:0] and_839_nl;
  wire[0:0] mux_640_nl;
  wire[0:0] or_809_nl;
  wire[4:0] S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl;
  wire[4:0] S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl;
  wire[0:0] and_23_nl;
  wire[0:0] mux_70_nl;
  wire[0:0] nor_199_nl;
  wire[0:0] nor_200_nl;
  wire[0:0] nor_247_nl;
  wire[0:0] mux_62_nl;
  wire[0:0] mux_61_nl;
  wire[0:0] mux_60_nl;
  wire[0:0] mux_59_nl;
  wire[0:0] or_41_nl;
  wire[0:0] or_9_nl;
  wire[0:0] mux_58_nl;
  wire[0:0] mux_57_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] or_4_nl;
  wire[0:0] and_220_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] mux_343_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] nor_119_nl;
  wire[0:0] nor_120_nl;
  wire[0:0] nor_121_nl;
  wire[0:0] mux_340_nl;
  wire[0:0] nor_122_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] or_350_nl;
  wire[0:0] or_349_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] nor_123_nl;
  wire[0:0] mux_663_nl;
  wire[0:0] mux_662_nl;
  wire[0:0] mux_661_nl;
  wire[0:0] mux_660_nl;
  wire[0:0] mux_659_nl;
  wire[0:0] mux_658_nl;
  wire[0:0] mux_657_nl;
  wire[0:0] or_828_nl;
  wire[0:0] mux_656_nl;
  wire[0:0] mux_655_nl;
  wire[0:0] mux_653_nl;
  wire[0:0] mux_652_nl;
  wire[0:0] or_825_nl;
  wire[0:0] mux_651_nl;
  wire[0:0] mux_650_nl;
  wire[0:0] or_824_nl;
  wire[0:0] mux_649_nl;
  wire[0:0] mux_648_nl;
  wire[0:0] nand_139_nl;
  wire[0:0] mux_647_nl;
  wire[0:0] mux_674_nl;
  wire[0:0] mux_673_nl;
  wire[0:0] mux_672_nl;
  wire[0:0] mux_671_nl;
  wire[0:0] nand_141_nl;
  wire[0:0] or_840_nl;
  wire[0:0] mux_670_nl;
  wire[0:0] mux_669_nl;
  wire[0:0] mux_668_nl;
  wire[0:0] or_837_nl;
  wire[0:0] or_836_nl;
  wire[0:0] mux_667_nl;
  wire[0:0] mux_666_nl;
  wire[0:0] or_833_nl;
  wire[0:0] mux_665_nl;
  wire[0:0] mux_664_nl;
  wire[0:0] or_832_nl;
  wire[0:0] nand_142_nl;
  wire[14:0] S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl;
  wire[0:0] and_22_nl;
  wire[0:0] mux_69_nl;
  wire[0:0] nor_201_nl;
  wire[0:0] and_489_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux1h_4_nl;
  wire[4:0] S1_OUTER_LOOP_for_acc_nl;
  wire[5:0] nl_S1_OUTER_LOOP_for_acc_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux_15_nl;
  wire[0:0] and_841_nl;
  wire[0:0] mux_687_nl;
  wire[0:0] nor_376_nl;
  wire[0:0] and_842_nl;
  wire[4:0] S6_OUTER_LOOP_for_acc_nl;
  wire[5:0] nl_S6_OUTER_LOOP_for_acc_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_nl;
  wire[0:0] operator_20_true_1_mux_nl;
  wire[14:0] operator_20_true_1_acc_1_nl;
  wire[15:0] nl_operator_20_true_1_acc_1_nl;
  wire[0:0] S2_OUTER_LOOP_c_S2_OUTER_LOOP_c_or_nl;
  wire[0:0] operator_20_true_1_or_nl;
  wire[1:0] S2_INNER_LOOP1_r_mux_nl;
  wire[0:0] S2_OUTER_LOOP_c_nor_nl;
  wire[0:0] S2_INNER_LOOP1_r_not_nl;
  wire[0:0] mux_439_nl;
  wire[0:0] mux_438_nl;
  wire[0:0] nor_91_nl;
  wire[0:0] nor_92_nl;
  wire[0:0] and_452_nl;
  wire[0:0] mux_437_nl;
  wire[0:0] nor_93_nl;
  wire[0:0] nor_94_nl;
  wire[0:0] and_242_nl;
  wire[0:0] mux_467_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] mux_679_nl;
  wire[0:0] mux_678_nl;
  wire[0:0] nor_354_nl;
  wire[0:0] nor_355_nl;
  wire[0:0] nor_356_nl;
  wire[0:0] mux_677_nl;
  wire[0:0] mux_676_nl;
  wire[0:0] nand_140_nl;
  wire[0:0] mux_675_nl;
  wire[0:0] mux_682_nl;
  wire[0:0] mux_681_nl;
  wire[0:0] and_840_nl;
  wire[0:0] nor_351_nl;
  wire[0:0] nor_352_nl;
  wire[0:0] mux_477_nl;
  wire[0:0] and_498_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] mux_475_nl;
  wire[0:0] nor_81_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] mux_474_nl;
  wire[0:0] nor_83_nl;
  wire[0:0] nor_84_nl;
  wire[0:0] nor_242_nl;
  wire[0:0] mux_473_nl;
  wire[0:0] or_507_nl;
  wire[0:0] or_506_nl;
  wire[0:0] mux_482_nl;
  wire[0:0] nor_79_nl;
  wire[0:0] mux_481_nl;
  wire[0:0] or_523_nl;
  wire[0:0] or_532_nl;
  wire[0:0] nor_80_nl;
  wire[0:0] mux_480_nl;
  wire[0:0] mux_479_nl;
  wire[0:0] or_519_nl;
  wire[0:0] mux_478_nl;
  wire[0:0] or_518_nl;
  wire[0:0] or_526_nl;
  wire[0:0] mux_495_nl;
  wire[0:0] mux_494_nl;
  wire[0:0] mux_493_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] or_545_nl;
  wire[0:0] mux_491_nl;
  wire[0:0] or_542_nl;
  wire[0:0] or_540_nl;
  wire[0:0] mux_490_nl;
  wire[0:0] or_536_nl;
  wire[0:0] mux_497_nl;
  wire[0:0] or_548_nl;
  wire[0:0] mux_496_nl;
  wire[0:0] or_547_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] and_446_nl;
  wire[0:0] mux_507_nl;
  wire[0:0] nor_75_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] or_577_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] nor_76_nl;
  wire[0:0] nor_78_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] or_570_nl;
  wire[0:0] mux_516_nl;
  wire[0:0] mux_515_nl;
  wire[0:0] nand_83_nl;
  wire[0:0] or_579_nl;
  wire[0:0] mux_527_nl;
  wire[0:0] mux_526_nl;
  wire[0:0] and_495_nl;
  wire[0:0] mux_525_nl;
  wire[0:0] mux_524_nl;
  wire[0:0] nor_72_nl;
  wire[0:0] nor_73_nl;
  wire[0:0] nor_74_nl;
  wire[0:0] nor_234_nl;
  wire[0:0] mux_523_nl;
  wire[0:0] or_643_nl;
  wire[0:0] nand_40_nl;
  wire[0:0] nor_235_nl;
  wire[31:0] modulo_add_3_qif_acc_nl;
  wire[32:0] nl_modulo_add_3_qif_acc_nl;
  wire[32:0] modulo_add_3_acc_1_nl;
  wire[33:0] nl_modulo_add_3_acc_1_nl;
  wire[31:0] modulo_add_1_qif_acc_nl;
  wire[32:0] nl_modulo_add_1_qif_acc_nl;
  wire[32:0] modulo_add_1_acc_1_nl;
  wire[33:0] nl_modulo_add_1_acc_1_nl;
  wire[31:0] modulo_sub_1_qif_acc_nl;
  wire[32:0] nl_modulo_sub_1_qif_acc_nl;
  wire[31:0] modulo_add_qif_acc_nl;
  wire[32:0] nl_modulo_add_qif_acc_nl;
  wire[32:0] modulo_add_acc_1_nl;
  wire[33:0] nl_modulo_add_acc_1_nl;
  wire[31:0] modulo_add_2_qif_acc_nl;
  wire[32:0] nl_modulo_add_2_qif_acc_nl;
  wire[31:0] modulo_add_7_qif_acc_nl;
  wire[32:0] nl_modulo_add_7_qif_acc_nl;
  wire[32:0] modulo_add_7_acc_1_nl;
  wire[33:0] nl_modulo_add_7_acc_1_nl;
  wire[31:0] modulo_sub_7_qif_acc_nl;
  wire[32:0] nl_modulo_sub_7_qif_acc_nl;
  wire[31:0] modulo_add_5_qif_acc_nl;
  wire[32:0] nl_modulo_add_5_qif_acc_nl;
  wire[32:0] modulo_add_5_acc_1_nl;
  wire[33:0] nl_modulo_add_5_acc_1_nl;
  wire[31:0] modulo_add_4_qif_acc_nl;
  wire[32:0] nl_modulo_add_4_qif_acc_nl;
  wire[32:0] modulo_add_4_acc_1_nl;
  wire[33:0] nl_modulo_add_4_acc_1_nl;
  wire[31:0] modulo_sub_4_qif_acc_nl;
  wire[32:0] nl_modulo_sub_4_qif_acc_nl;
  wire[31:0] modulo_add_6_qif_acc_nl;
  wire[32:0] nl_modulo_add_6_qif_acc_nl;
  wire[31:0] modulo_add_11_qif_acc_nl;
  wire[32:0] nl_modulo_add_11_qif_acc_nl;
  wire[32:0] modulo_add_11_acc_1_nl;
  wire[33:0] nl_modulo_add_11_acc_1_nl;
  wire[31:0] modulo_add_9_qif_acc_nl;
  wire[32:0] nl_modulo_add_9_qif_acc_nl;
  wire[32:0] modulo_add_9_acc_1_nl;
  wire[33:0] nl_modulo_add_9_acc_1_nl;
  wire[31:0] modulo_add_8_qif_acc_nl;
  wire[32:0] nl_modulo_add_8_qif_acc_nl;
  wire[32:0] modulo_add_8_acc_1_nl;
  wire[33:0] nl_modulo_add_8_acc_1_nl;
  wire[31:0] modulo_add_10_qif_acc_nl;
  wire[32:0] nl_modulo_add_10_qif_acc_nl;
  wire[31:0] modulo_sub_10_qif_acc_nl;
  wire[32:0] nl_modulo_sub_10_qif_acc_nl;
  wire[31:0] modulo_add_15_qif_acc_nl;
  wire[32:0] nl_modulo_add_15_qif_acc_nl;
  wire[32:0] modulo_add_15_acc_1_nl;
  wire[33:0] nl_modulo_add_15_acc_1_nl;
  wire[31:0] modulo_sub_15_qif_acc_nl;
  wire[32:0] nl_modulo_sub_15_qif_acc_nl;
  wire[31:0] modulo_add_13_qif_acc_nl;
  wire[32:0] nl_modulo_add_13_qif_acc_nl;
  wire[32:0] modulo_add_13_acc_1_nl;
  wire[33:0] nl_modulo_add_13_acc_1_nl;
  wire[31:0] modulo_add_12_qif_acc_nl;
  wire[32:0] nl_modulo_add_12_qif_acc_nl;
  wire[32:0] modulo_add_12_acc_1_nl;
  wire[33:0] nl_modulo_add_12_acc_1_nl;
  wire[31:0] modulo_sub_12_qif_acc_nl;
  wire[32:0] nl_modulo_sub_12_qif_acc_nl;
  wire[31:0] modulo_add_14_qif_acc_nl;
  wire[32:0] nl_modulo_add_14_qif_acc_nl;
  wire[31:0] modulo_add_19_qif_acc_nl;
  wire[32:0] nl_modulo_add_19_qif_acc_nl;
  wire[32:0] modulo_add_19_acc_1_nl;
  wire[33:0] nl_modulo_add_19_acc_1_nl;
  wire[31:0] modulo_sub_19_qif_acc_nl;
  wire[32:0] nl_modulo_sub_19_qif_acc_nl;
  wire[31:0] modulo_add_17_qif_acc_nl;
  wire[32:0] nl_modulo_add_17_qif_acc_nl;
  wire[32:0] modulo_add_17_acc_1_nl;
  wire[33:0] nl_modulo_add_17_acc_1_nl;
  wire[31:0] modulo_add_16_qif_acc_nl;
  wire[32:0] nl_modulo_add_16_qif_acc_nl;
  wire[32:0] modulo_add_16_acc_1_nl;
  wire[33:0] nl_modulo_add_16_acc_1_nl;
  wire[31:0] modulo_sub_16_qif_acc_nl;
  wire[32:0] nl_modulo_sub_16_qif_acc_nl;
  wire[31:0] modulo_add_18_qif_acc_nl;
  wire[32:0] nl_modulo_add_18_qif_acc_nl;
  wire[31:0] modulo_add_23_qif_acc_nl;
  wire[32:0] nl_modulo_add_23_qif_acc_nl;
  wire[32:0] modulo_add_23_acc_1_nl;
  wire[33:0] nl_modulo_add_23_acc_1_nl;
  wire[31:0] modulo_sub_23_qif_acc_nl;
  wire[32:0] nl_modulo_sub_23_qif_acc_nl;
  wire[31:0] modulo_add_21_qif_acc_nl;
  wire[32:0] nl_modulo_add_21_qif_acc_nl;
  wire[32:0] modulo_add_21_acc_1_nl;
  wire[33:0] nl_modulo_add_21_acc_1_nl;
  wire[31:0] modulo_add_20_qif_acc_nl;
  wire[32:0] nl_modulo_add_20_qif_acc_nl;
  wire[32:0] modulo_add_20_acc_1_nl;
  wire[33:0] nl_modulo_add_20_acc_1_nl;
  wire[31:0] modulo_sub_20_qif_acc_nl;
  wire[32:0] nl_modulo_sub_20_qif_acc_nl;
  wire[31:0] modulo_add_22_qif_acc_nl;
  wire[32:0] nl_modulo_add_22_qif_acc_nl;
  wire[32:0] modulo_add_22_acc_1_nl;
  wire[33:0] nl_modulo_add_22_acc_1_nl;
  wire[32:0] modulo_add_18_acc_1_nl;
  wire[33:0] nl_modulo_add_18_acc_1_nl;
  wire[32:0] modulo_add_14_acc_1_nl;
  wire[33:0] nl_modulo_add_14_acc_1_nl;
  wire[32:0] modulo_add_10_acc_1_nl;
  wire[33:0] nl_modulo_add_10_acc_1_nl;
  wire[32:0] modulo_add_6_acc_1_nl;
  wire[33:0] nl_modulo_add_6_acc_1_nl;
  wire[32:0] modulo_add_2_acc_1_nl;
  wire[33:0] nl_modulo_add_2_acc_1_nl;
  wire[0:0] or_5_nl;
  wire[0:0] or_89_nl;
  wire[0:0] nor_248_nl;
  wire[0:0] nor_249_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] mux_97_nl;
  wire[0:0] or_94_nl;
  wire[0:0] or_93_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] or_92_nl;
  wire[0:0] nand_2_nl;
  wire[0:0] mux_102_nl;
  wire[0:0] nor_185_nl;
  wire[0:0] nor_186_nl;
  wire[0:0] or_136_nl;
  wire[0:0] and_476_nl;
  wire[0:0] nor_182_nl;
  wire[0:0] mux_146_nl;
  wire[0:0] or_146_nl;
  wire[0:0] or_143_nl;
  wire[0:0] or_149_nl;
  wire[0:0] mux_148_nl;
  wire[0:0] or_148_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] or_201_nl;
  wire[0:0] or_205_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] or_204_nl;
  wire[0:0] or_215_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] or_213_nl;
  wire[0:0] nor_151_nl;
  wire[0:0] nor_207_nl;
  wire[0:0] mux_218_nl;
  wire[0:0] or_234_nl;
  wire[0:0] or_233_nl;
  wire[0:0] or_338_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] or_265_nl;
  wire[0:0] nor_140_nl;
  wire[0:0] and_463_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] nor_250_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] nor_251_nl;
  wire[0:0] nor_252_nl;
  wire[0:0] nand_85_nl;
  wire[0:0] or_414_nl;
  wire[0:0] or_537_nl;
  wire[0:0] mux_140_nl;
  wire[0:0] and_478_nl;
  wire[0:0] nor_184_nl;
  wire[0:0] mux_141_nl;
  wire[0:0] or_652_nl;
  wire[0:0] nand_82_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] nor_181_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] or_659_nl;
  wire[0:0] mux_150_nl;
  wire[0:0] or_660_nl;
  wire[0:0] or_661_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] or_656_nl;
  wire[0:0] or_657_nl;
  wire[0:0] or_658_nl;
  wire[0:0] nor_171_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] nor_172_nl;
  wire[0:0] nor_173_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] nor_168_nl;
  wire[0:0] nor_169_nl;
  wire[0:0] nor_170_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] or_654_nl;
  wire[0:0] or_655_nl;
  wire[0:0] nand_90_nl;
  wire[0:0] or_208_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] or_206_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] or_211_nl;
  wire[0:0] or_209_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] nor_152_nl;
  wire[0:0] and_470_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] and_469_nl;
  wire[0:0] nor_150_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] or_650_nl;
  wire[0:0] or_651_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] mux_368_nl;
  wire[0:0] or_370_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] mux_366_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] mux_33_nl;
  wire[0:0] or_645_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] nor_117_nl;
  wire[0:0] and_453_nl;
  wire[0:0] mux_387_nl;
  wire[0:0] or_388_nl;
  wire[0:0] mux_386_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] nand_23_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] nor_116_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] nand_22_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] mux_379_nl;
  wire[0:0] nand_21_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] mux_389_nl;
  wire[0:0] nor_113_nl;
  wire[0:0] and_nl;
  wire[0:0] nor_109_nl;
  wire[0:0] mux_393_nl;
  wire[0:0] nand_24_nl;
  wire[0:0] mux_392_nl;
  wire[0:0] nor_110_nl;
  wire[0:0] or_395_nl;
  wire[0:0] nor_111_nl;
  wire[0:0] mux_391_nl;
  wire[0:0] nor_112_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] nor_95_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] nor_96_nl;
  wire[0:0] nor_97_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] nor_98_nl;
  wire[0:0] nor_99_nl;
  wire[0:0] nor_100_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] or_428_nl;
  wire[0:0] or_427_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] or_442_nl;
  wire[0:0] or_440_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] or_445_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] or_649_nl;
  wire[0:0] mux_443_nl;
  wire[0:0] or_470_nl;
  wire[0:0] or_468_nl;
  wire[0:0] mux_442_nl;
  wire[0:0] nand_79_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] nand_80_nl;
  wire[0:0] nand_81_nl;
  wire[0:0] mux_440_nl;
  wire[0:0] nor_89_nl;
  wire[0:0] nor_90_nl;
  wire[0:0] nor_86_nl;
  wire[0:0] nor_87_nl;
  wire[0:0] mux_448_nl;
  wire[0:0] mux_447_nl;
  wire[0:0] or_480_nl;
  wire[0:0] nand_42_nl;
  wire[0:0] mux_446_nl;
  wire[0:0] or_477_nl;
  wire[0:0] or_475_nl;
  wire[0:0] and_79_nl;
  wire[0:0] and_81_nl;
  wire[0:0] and_83_nl;
  wire[0:0] and_85_nl;
  wire[0:0] and_87_nl;
  wire[0:0] and_88_nl;
  wire[0:0] and_92_nl;
  wire[0:0] and_94_nl;
  wire[0:0] butterFly_10_f1_or_1_nl;
  wire[0:0] and_99_nl;
  wire[0:0] and_100_nl;
  wire[0:0] and_101_nl;
  wire[0:0] and_102_nl;
  wire[0:0] and_103_nl;
  wire[0:0] and_104_nl;
  wire[0:0] and_105_nl;
  wire[0:0] and_108_nl;
  wire[0:0] and_111_nl;
  wire[0:0] and_112_nl;
  wire[0:0] and_113_nl;
  wire[0:0] and_114_nl;
  wire[0:0] and_115_nl;
  wire[0:0] and_116_nl;
  wire[0:0] and_117_nl;
  wire[0:0] and_118_nl;
  wire[4:0] S2_COPY_LOOP_for_mux1h_nl;
  wire[0:0] S2_COPY_LOOP_for_or_7_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_5_nl;
  wire[0:0] S2_COPY_LOOP_for_or_8_nl;
  wire[2:0] S2_COPY_LOOP_for_or_5_nl;
  wire[2:0] S2_COPY_LOOP_for_and_2_nl;
  wire[2:0] S2_COPY_LOOP_for_mux1h_6_nl;
  wire[0:0] S2_COPY_LOOP_for_not_nl;
  wire[4:0] S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_2_nl;
  wire[0:0] S2_COPY_LOOP_for_or_nl;
  wire[0:0] S2_COPY_LOOP_for_mux1h_7_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_8_nl;
  wire[0:0] S2_COPY_LOOP_for_or_9_nl;
  wire[1:0] S2_COPY_LOOP_for_or_1_nl;
  wire[1:0] S2_COPY_LOOP_for_and_1_nl;
  wire[1:0] S2_COPY_LOOP_for_mux1h_9_nl;
  wire[0:0] S2_COPY_LOOP_for_or_2_nl;
  wire[0:0] S2_COPY_LOOP_for_or_3_nl;
  wire[0:0] S2_COPY_LOOP_for_nor_1_nl;
  wire[0:0] S2_COPY_LOOP_for_or_4_nl;
  wire[0:0] mux_161_nl;
  wire[0:0] and_475_nl;
  wire[0:0] nor_163_nl;
  wire[0:0] nor_164_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] nor_165_nl;
  wire[0:0] or_173_nl;
  wire[0:0] mux_158_nl;
  wire[0:0] or_171_nl;
  wire[0:0] or_170_nl;
  wire[0:0] mux_169_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] mux_167_nl;
  wire[0:0] mux_166_nl;
  wire[0:0] and_474_nl;
  wire[0:0] mux_165_nl;
  wire[0:0] nand_65_nl;
  wire[0:0] mux_164_nl;
  wire[0:0] or_185_nl;
  wire[0:0] mux_163_nl;
  wire[0:0] or_181_nl;
  wire[0:0] and_150_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] nor_155_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] nor_156_nl;
  wire[0:0] and_152_nl;
  wire[0:0] and_154_nl;
  wire[0:0] and_155_nl;
  wire[0:0] and_156_nl;
  wire[0:0] and_157_nl;
  wire[0:0] and_158_nl;
  wire[0:0] and_159_nl;
  wire[0:0] and_161_nl;
  wire[0:0] and_162_nl;
  wire[0:0] and_163_nl;
  wire[0:0] and_164_nl;
  wire[0:0] and_165_nl;
  wire[0:0] and_166_nl;
  wire[0:0] and_167_nl;
  wire[0:0] and_168_nl;
  wire[0:0] and_169_nl;
  wire[0:0] and_170_nl;
  wire[0:0] and_171_nl;
  wire[0:0] and_172_nl;
  wire[0:0] and_173_nl;
  wire[0:0] and_174_nl;
  wire[0:0] and_175_nl;
  wire[0:0] and_176_nl;
  wire[0:0] and_177_nl;
  wire[4:0] S1_OUTER_LOOP_for_mux1h_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_9_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_6_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_10_nl;
  wire[2:0] S1_OUTER_LOOP_for_or_6_nl;
  wire[2:0] S1_OUTER_LOOP_for_and_3_nl;
  wire[2:0] S1_OUTER_LOOP_for_mux1h_7_nl;
  wire[4:0] S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_1_nl;
  wire[0:0] S1_OUTER_LOOP_for_mux1h_8_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_9_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_8_nl;
  wire[1:0] S1_OUTER_LOOP_for_or_2_nl;
  wire[1:0] S1_OUTER_LOOP_for_and_2_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux1h_10_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_3_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_4_nl;
  wire[0:0] S1_OUTER_LOOP_for_nor_1_nl;
  wire[0:0] S1_OUTER_LOOP_for_or_5_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] or_229_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] or_228_nl;
  wire[0:0] or_226_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] mux_224_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] mux_222_nl;
  wire[0:0] nand_8_nl;
  wire[0:0] mux_221_nl;
  wire[0:0] nor_146_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] or_231_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] nor_147_nl;
  wire[0:0] and_466_nl;
  wire[0:0] and_817_nl;
  wire[0:0] mux_552_nl;
  wire[0:0] mux_551_nl;
  wire[0:0] and_818_nl;
  wire[0:0] nor_310_nl;
  wire[0:0] and_819_nl;
  wire[0:0] and_820_nl;
  wire[0:0] mux_550_nl;
  wire[0:0] mux_549_nl;
  wire[0:0] nor_311_nl;
  wire[0:0] nor_312_nl;
  wire[0:0] or_707_nl;
  wire[0:0] or_705_nl;
  wire[0:0] mux_535_nl;
  wire[0:0] nor_334_nl;
  wire[0:0] and_785_nl;
  wire[4:0] S2_INNER_LOOP1_for_mux_6_nl;
  wire[0:0] nor_373_nl;
  wire[0:0] mux_683_nl;
  wire[0:0] nand_144_nl;
  wire[0:0] mux_684_nl;
  wire[0:0] nor_374_nl;
  wire[0:0] nor_375_nl;
  wire[0:0] mux_685_nl;
  wire[0:0] mux_686_nl;
  wire[0:0] or_859_nl;
  wire[0:0] or_860_nl;
  wire[14:0] S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl;
  wire[0:0] not_1562_nl;
  wire[2:0] S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl;
  wire[0:0] not_1563_nl;
  wire[1:0] S1_OUTER_LOOP_for_mux_14_nl;
  wire[0:0] mux_688_nl;
  wire[0:0] and_843_nl;
  wire[0:0] mux_689_nl;
  wire[0:0] and_814_nl;
  wire[0:0] mux_568_nl;
  wire[0:0] nor_303_nl;
  wire[0:0] nor_304_nl;
  wire[0:0] nor_378_nl;
  wire[0:0] mux_690_nl;
  wire[0:0] and_815_nl;
  wire[0:0] mux_566_nl;
  wire[0:0] nor_306_nl;
  wire[0:0] nor_307_nl;
  wire[0:0] nor_379_nl;
  wire[32:0] acc_3_nl;
  wire[33:0] nl_acc_3_nl;
  wire[32:0] acc_4_nl;
  wire[33:0] nl_acc_4_nl;
  wire[31:0] mult_3_res_mux1h_2_nl;
  wire[0:0] mux_691_nl;
  wire[0:0] nor_380_nl;
  wire[0:0] mux_692_nl;
  wire[0:0] mux_693_nl;
  wire[0:0] or_861_nl;
  wire[0:0] or_862_nl;
  wire[0:0] and_844_nl;
  wire[0:0] mux_694_nl;
  wire[0:0] or_863_nl;
  wire[0:0] mux_695_nl;
  wire[0:0] or_864_nl;
  wire[0:0] or_865_nl;
  wire[0:0] mux_696_nl;
  wire[0:0] mux_697_nl;
  wire[0:0] mux_698_nl;
  wire[0:0] or_866_nl;
  wire[0:0] or_867_nl;
  wire[0:0] nand_146_nl;
  wire[0:0] mux_699_nl;
  wire[0:0] or_868_nl;
  wire[0:0] mux_700_nl;
  wire[0:0] and_845_nl;
  wire[0:0] mux_701_nl;
  wire[0:0] nor_381_nl;
  wire[0:0] mux_702_nl;
  wire[0:0] nand_147_nl;
  wire[0:0] nor_382_nl;
  wire[0:0] mux_703_nl;
  wire[0:0] or_869_nl;
  wire[0:0] mux_704_nl;
  wire[0:0] and_846_nl;
  wire[0:0] mux_705_nl;
  wire[0:0] nor_383_nl;
  wire[0:0] nor_384_nl;
  wire[0:0] nor_385_nl;
  wire[30:0] modulo_sub_3_qif_mux_2_nl;
  wire[0:0] and_847_nl;
  wire[32:0] acc_7_nl;
  wire[33:0] nl_acc_7_nl;
  wire[31:0] butterFly_3_butterFly_3_mux_2_nl;
  wire[0:0] butterFly_3_or_6_nl;
  wire[30:0] modulo_sub_2_qif_mux_2_nl;
  wire[0:0] and_850_nl;
  wire[32:0] acc_9_nl;
  wire[33:0] nl_acc_9_nl;
  wire[30:0] modulo_sub_11_qif_mux_2_nl;
  wire[0:0] and_851_nl;
  wire[31:0] butterFly_3_mux_1_nl;
  wire[0:0] butterFly_3_or_7_nl;
  wire[31:0] butterFly_3_butterFly_3_mux_3_nl;
  wire[0:0] butterFly_3_or_8_nl;
  wire[32:0] acc_13_nl;
  wire[33:0] nl_acc_13_nl;
  wire[31:0] butterFly_1_butterFly_1_mux_1_nl;
  wire[0:0] butterFly_1_or_3_nl;
  wire[31:0] butterFly_1_mux_1_nl;
  wire[0:0] butterFly_1_or_4_nl;
  wire[33:0] acc_17_nl;
  wire[34:0] nl_acc_17_nl;

  // Interconnect Declarations for Component Instantiations 
  wire[0:0] mux_238_nl;
  wire[0:0] nor_141_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] or_262_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] or_260_nl;
  wire[0:0] nor_142_nl;
  wire[0:0] mux_235_nl;
  wire [31:0] nl_mult_t_mul_cmp_a;
  assign mux_236_nl = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), fsm_output[1]);
  assign or_262_nl = (fsm_output[5:4]!=2'b10) | mux_236_nl;
  assign or_260_nl = (fsm_output[5]) | (fsm_output[4]) | (fsm_output[2]);
  assign mux_237_nl = MUX_s_1_2_2(or_262_nl, or_260_nl, fsm_output[7]);
  assign nor_141_nl = ~((fsm_output[6]) | mux_237_nl);
  assign mux_235_nl = MUX_s_1_2_2(or_235_cse, mux_234_cse, fsm_output[4]);
  assign nor_142_nl = ~((fsm_output[7:5]!=3'b010) | mux_235_nl);
  assign mux_238_nl = MUX_s_1_2_2(nor_141_nl, nor_142_nl, fsm_output[3]);
  assign nl_mult_t_mul_cmp_a = MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, mux_238_nl);
  wire[0:0] mux_250_nl;
  wire[0:0] mux_249_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] mux_247_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] or_270_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] or_269_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] nand_60_nl;
  wire[0:0] or_268_nl;
  wire[0:0] or_264_nl;
  wire[0:0] and_211_nl;
  wire [31:0] nl_mult_t_mul_cmp_b;
  assign mux_246_nl = MUX_s_1_2_2(mux_tmp_239, or_tmp_254, fsm_output[3]);
  assign or_270_nl = (fsm_output[5]) | nand_59_cse;
  assign mux_245_nl = MUX_s_1_2_2(or_tmp_254, or_270_nl, fsm_output[3]);
  assign mux_247_nl = MUX_s_1_2_2(mux_246_nl, mux_245_nl, fsm_output[6]);
  assign mux_243_nl = MUX_s_1_2_2(or_tmp_249, (~ (fsm_output[2])), fsm_output[5]);
  assign or_269_nl = (fsm_output[3]) | mux_243_nl;
  assign mux_244_nl = MUX_s_1_2_2(or_269_nl, nand_tmp_12, fsm_output[6]);
  assign mux_248_nl = MUX_s_1_2_2(mux_247_nl, mux_244_nl, fsm_output[0]);
  assign nand_60_nl = ~((fsm_output[5]) & mux_240_cse);
  assign or_268_nl = (fsm_output[5]) | (fsm_output[4]) | (~ (fsm_output[2]));
  assign mux_241_nl = MUX_s_1_2_2(nand_60_nl, or_268_nl, fsm_output[3]);
  assign mux_242_nl = MUX_s_1_2_2(mux_241_nl, nand_tmp_12, fsm_output[6]);
  assign mux_249_nl = MUX_s_1_2_2(mux_248_nl, mux_242_nl, fsm_output[1]);
  assign or_264_nl = (fsm_output[6:2]!=5'b00000);
  assign mux_250_nl = MUX_s_1_2_2(mux_249_nl, or_264_nl, fsm_output[7]);
  assign and_211_nl = and_dcpl_93 & and_dcpl_71;
  assign nl_mult_t_mul_cmp_b = MUX1HOT_v_32_3_2(twiddle_h_rsci_s_din_mxwt, ({{12{tw_h_rsci_s_din_mxwt[19]}},
      tw_h_rsci_s_din_mxwt}), ({{12{S34_OUTER_LOOP_for_tf_h_sva[19]}}, S34_OUTER_LOOP_for_tf_h_sva}),
      {(~ mux_250_nl) , and_dcpl_180 , and_211_nl});
  wire[0:0] operator_33_true_operator_33_true_and_nl;
  wire[0:0] operator_33_true_mux_nl;
  wire [3:0] nl_operator_33_true_1_lshift_rg_s;
  assign operator_33_true_operator_33_true_and_nl = (S2_INNER_LOOP1_r_4_2_sva_1_0[0])
      & (~ and_509_ssc);
  assign operator_33_true_mux_nl = MUX_s_1_2_2(S2_OUTER_LOOP_c_1_sva, (~ S2_OUTER_LOOP_c_1_sva),
      and_509_ssc);
  assign nl_operator_33_true_1_lshift_rg_s = {1'b0 , operator_33_true_operator_33_true_and_nl
      , operator_33_true_mux_nl , and_509_ssc};
  wire [0:0] nl_hybrid_core_wait_dp_inst_xx_rsc_cgo_iro;
  assign nl_hybrid_core_wait_dp_inst_xx_rsc_cgo_iro = ~ mux_137_itm;
  wire [0:0] nl_hybrid_core_wait_dp_inst_ensig_cgo_iro;
  assign nl_hybrid_core_wait_dp_inst_ensig_cgo_iro = ~ mux_233_itm;
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
  assign nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_4_tr0 = ~ S2_OUTER_LOOP_c_1_sva;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0 = z_out_1[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0 = z_out_1[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_17_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_17_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0 = z_out_2[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_17_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_17_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0 = and_dcpl_17;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1 = ~ (z_out_2[2]);
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_17_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_17_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0 = z_out_2[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_9_tr0;
  assign nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_9_tr0 = ~ S2_OUTER_LOOP_c_1_sva;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0 = z_out_1[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0 = z_out_1[5];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_17_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_17_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0 = z_out_2[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_17_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_17_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0 = and_dcpl_17;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1 = ~ (z_out_2[2]);
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_17_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_17_tr0 = S2_COPY_LOOP_for_i_5_0_sva_1_5;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0 = z_out_2[2];
  wire [0:0] nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0;
  assign nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0 = ~ S2_OUTER_LOOP_c_1_sva;
  wire [0:0] nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0;
  assign nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0 = z_out_1[5];
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
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
  .n_inreg(32'sd2)) mult_t_mul_cmp (
      .a(nl_mult_t_mul_cmp_a[31:0]),
      .b(nl_mult_t_mul_cmp_b[31:0]),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_t_mul_cmp_z)
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
      .xx_rsc_cgo_iro(nl_hybrid_core_wait_dp_inst_xx_rsc_cgo_iro[0:0]),
      .xx_rsci_clken_d(xx_rsci_clken_d),
      .yy_rsc_cgo_iro(mux_186_rmff),
      .yy_rsci_clken_d(yy_rsci_clken_d),
      .mult_12_z_mul_cmp_z(mult_12_z_mul_cmp_z),
      .ensig_cgo_iro(nl_hybrid_core_wait_dp_inst_ensig_cgo_iro[0:0]),
      .mult_z_mul_cmp_z(mult_z_mul_cmp_z),
      .core_wen(core_wen),
      .xx_rsc_cgo(reg_xx_rsc_cgo_cse),
      .yy_rsc_cgo(reg_yy_rsc_cgo_cse),
      .mult_12_z_mul_cmp_z_oreg(mult_12_z_mul_cmp_z_oreg),
      .ensig_cgo(reg_ensig_cgo_cse),
      .mult_t_mul_cmp_en(mult_t_mul_cmp_en),
      .mult_z_mul_cmp_z_oreg(mult_z_mul_cmp_z_oreg)
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
      .S2_INNER_LOOP1_for_C_17_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_17_tr0[0:0]),
      .S2_INNER_LOOP1_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0[0:0]),
      .S2_INNER_LOOP2_for_C_17_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_17_tr0[0:0]),
      .S2_INNER_LOOP2_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0[0:0]),
      .S2_INNER_LOOP2_C_0_tr1(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1[0:0]),
      .S2_INNER_LOOP3_for_C_17_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_17_tr0[0:0]),
      .S2_INNER_LOOP3_C_0_tr0(nl_hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0[0:0]),
      .S34_OUTER_LOOP_for_C_9_tr0(nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_9_tr0[0:0]),
      .S34_OUTER_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0[0:0]),
      .S5_COPY_LOOP_for_C_3_tr0(nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0[0:0]),
      .S5_COPY_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0[0:0]),
      .S5_INNER_LOOP1_for_C_17_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_17_tr0[0:0]),
      .S5_INNER_LOOP1_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0[0:0]),
      .S5_INNER_LOOP2_for_C_17_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_17_tr0[0:0]),
      .S5_INNER_LOOP2_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0[0:0]),
      .S5_INNER_LOOP2_C_0_tr1(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1[0:0]),
      .S5_INNER_LOOP3_for_C_17_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_17_tr0[0:0]),
      .S5_INNER_LOOP3_C_0_tr0(nl_hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0[0:0]),
      .S6_OUTER_LOOP_for_C_3_tr0(nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0[0:0]),
      .S6_OUTER_LOOP_C_0_tr0(nl_hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0[0:0])
    );
  assign and_492_cse = (fsm_output[4:3]==2'b11);
  assign nor_192_cse = ~((~ (fsm_output[5])) | (fsm_output[3]));
  assign or_79_cse = (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[3]);
  assign and_480_cse = (fsm_output[0]) & (fsm_output[6]);
  assign or_130_nl = and_480_cse | (fsm_output[3]);
  assign mux_133_nl = MUX_s_1_2_2(or_tmp_119, or_130_nl, fsm_output[4]);
  assign mux_131_nl = MUX_s_1_2_2(and_483_cse, (fsm_output[6]), fsm_output[0]);
  assign mux_132_nl = MUX_s_1_2_2((~ mux_131_nl), and_483_cse, fsm_output[4]);
  assign mux_134_nl = MUX_s_1_2_2(mux_133_nl, mux_132_nl, fsm_output[5]);
  assign mux_129_nl = MUX_s_1_2_2(or_tmp_119, or_495_cse, fsm_output[4]);
  assign mux_127_nl = MUX_s_1_2_2(and_483_cse, or_495_cse, fsm_output[0]);
  assign mux_128_nl = MUX_s_1_2_2((~ or_495_cse), mux_127_nl, fsm_output[4]);
  assign mux_130_nl = MUX_s_1_2_2(mux_129_nl, mux_128_nl, fsm_output[5]);
  assign mux_135_nl = MUX_s_1_2_2(mux_134_nl, mux_130_nl, fsm_output[2]);
  assign or_127_nl = (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[3]));
  assign mux_124_nl = MUX_s_1_2_2(or_127_nl, (fsm_output[3]), fsm_output[4]);
  assign mux_122_nl = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[6]);
  assign or_125_nl = (~ (fsm_output[4])) | (fsm_output[0]);
  assign mux_123_nl = MUX_s_1_2_2(and_483_cse, mux_122_nl, or_125_nl);
  assign mux_125_nl = MUX_s_1_2_2(mux_124_nl, mux_123_nl, fsm_output[5]);
  assign mux_120_nl = MUX_s_1_2_2((~ or_495_cse), or_495_cse, fsm_output[4]);
  assign mux_121_nl = MUX_s_1_2_2(or_124_cse, mux_120_nl, fsm_output[5]);
  assign mux_126_nl = MUX_s_1_2_2(mux_125_nl, mux_121_nl, fsm_output[2]);
  assign mux_136_nl = MUX_s_1_2_2(mux_135_nl, mux_126_nl, fsm_output[1]);
  assign or_122_nl = (fsm_output[0]) | (fsm_output[6]) | (fsm_output[3]);
  assign mux_118_nl = MUX_s_1_2_2(or_333_cse, or_122_nl, fsm_output[4]);
  assign or_123_nl = (fsm_output[5]) | mux_118_nl;
  assign mux_116_nl = MUX_s_1_2_2(or_333_cse, or_495_cse, fsm_output[4]);
  assign or_121_nl = (fsm_output[5]) | mux_116_nl;
  assign mux_117_nl = MUX_s_1_2_2(or_121_nl, or_118_cse, fsm_output[2]);
  assign mux_119_nl = MUX_s_1_2_2(or_123_nl, mux_117_nl, fsm_output[1]);
  assign mux_137_itm = MUX_s_1_2_2(mux_136_nl, mux_119_nl, fsm_output[7]);
  assign or_648_cse = (fsm_output[1:0]!=2'b00);
  assign and_472_nl = (fsm_output[0]) & (fsm_output[5]);
  assign mux_181_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), and_472_nl);
  assign mux_180_nl = MUX_s_1_2_2(and_465_cse, mux_tmp_171, fsm_output[0]);
  assign mux_182_nl = MUX_s_1_2_2(mux_181_nl, mux_180_nl, fsm_output[3]);
  assign mux_179_nl = MUX_s_1_2_2(mux_tmp_171, and_465_cse, fsm_output[0]);
  assign or_194_nl = (fsm_output[3]) | mux_179_nl;
  assign mux_183_nl = MUX_s_1_2_2(mux_182_nl, or_194_nl, fsm_output[1]);
  assign nand_64_nl = ~((fsm_output[3]) & or_tmp_127);
  assign mux_184_nl = MUX_s_1_2_2(mux_183_nl, nand_64_nl, fsm_output[4]);
  assign nor_157_nl = ~((fsm_output[3]) | and_465_cse);
  assign mux_176_nl = MUX_s_1_2_2(or_tmp_127, and_465_cse, fsm_output[0]);
  assign nor_158_nl = ~((fsm_output[3]) | mux_176_nl);
  assign mux_177_nl = MUX_s_1_2_2(nor_157_nl, nor_158_nl, fsm_output[1]);
  assign nor_159_nl = ~((fsm_output[6:5]!=2'b10));
  assign mux_173_nl = MUX_s_1_2_2(nor_159_nl, (fsm_output[6]), fsm_output[0]);
  assign or_189_nl = (fsm_output[0]) | (~ (fsm_output[5])) | (fsm_output[6]);
  assign mux_174_nl = MUX_s_1_2_2(mux_173_nl, or_189_nl, fsm_output[3]);
  assign mux_170_nl = MUX_s_1_2_2((~ and_465_cse), or_188_cse, fsm_output[0]);
  assign mux_172_nl = MUX_s_1_2_2(mux_tmp_171, mux_170_nl, fsm_output[3]);
  assign mux_175_nl = MUX_s_1_2_2(mux_174_nl, mux_172_nl, fsm_output[1]);
  assign mux_178_nl = MUX_s_1_2_2(mux_177_nl, mux_175_nl, fsm_output[4]);
  assign mux_185_nl = MUX_s_1_2_2((~ mux_184_nl), mux_178_nl, fsm_output[2]);
  assign nor_160_nl = ~((fsm_output[6:3]!=4'b0000));
  assign mux_186_rmff = MUX_s_1_2_2(mux_185_nl, nor_160_nl, fsm_output[7]);
  assign or_235_cse = (fsm_output[2:1]!=2'b00);
  assign and_465_cse = (fsm_output[6:5]==2'b11);
  assign nor_37_cse = ~((fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_230_nl = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[4]);
  assign or_255_nl = (fsm_output[6]) | mux_230_nl;
  assign nand_11_nl = ~((fsm_output[6]) & (~ or_tmp_232));
  assign mux_231_nl = MUX_s_1_2_2(or_255_nl, nand_11_nl, fsm_output[3]);
  assign nand_10_nl = ~(nor_37_cse & not_tmp_125);
  assign mux_229_nl = MUX_s_1_2_2(mux_tmp_226, nand_10_nl, fsm_output[3]);
  assign mux_232_nl = MUX_s_1_2_2(mux_231_nl, mux_229_nl, fsm_output[5]);
  assign or_254_nl = (fsm_output[6]) | (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[7]));
  assign mux_227_nl = MUX_s_1_2_2(or_254_nl, mux_tmp_226, fsm_output[3]);
  assign or_250_nl = (fsm_output[6]) | or_tmp_232;
  assign or_247_nl = (~ (fsm_output[6])) | (fsm_output[4]) | nor_107_cse | (fsm_output[7]);
  assign mux_225_nl = MUX_s_1_2_2(or_250_nl, or_247_nl, fsm_output[3]);
  assign mux_228_nl = MUX_s_1_2_2(mux_227_nl, mux_225_nl, fsm_output[5]);
  assign mux_233_itm = MUX_s_1_2_2(mux_232_nl, mux_228_nl, fsm_output[2]);
  assign mux_234_cse = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), or_648_cse);
  assign mux_240_cse = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), fsm_output[4]);
  assign nand_59_cse = ~((fsm_output[4]) & (fsm_output[2]));
  assign or_283_cse = (fsm_output[3]) | (~ (fsm_output[7])) | (fsm_output[5]);
  assign or_336_cse_1 = (fsm_output[7:6]!=2'b00);
  assign or_333_cse = (~ (fsm_output[3])) | (fsm_output[6]);
  assign nand_cse = ~((fsm_output[4]) & (fsm_output[6]));
  assign mux_303_nl = MUX_s_1_2_2((~ and_465_cse), or_tmp_300, fsm_output[4]);
  assign mux_302_nl = MUX_s_1_2_2(mux_tmp_298, or_tmp_300, fsm_output[4]);
  assign mux_304_nl = MUX_s_1_2_2(mux_303_nl, mux_302_nl, fsm_output[2]);
  assign or_318_nl = (fsm_output[3]) | (~ and_465_cse);
  assign mux_300_nl = MUX_s_1_2_2(or_318_nl, or_tmp_300, fsm_output[4]);
  assign mux_299_nl = MUX_s_1_2_2(mux_tmp_298, (fsm_output[5]), fsm_output[4]);
  assign mux_301_nl = MUX_s_1_2_2(mux_300_nl, mux_299_nl, fsm_output[2]);
  assign mux_305_nl = MUX_s_1_2_2(mux_304_nl, mux_301_nl, and_455_cse);
  assign nor_211_ssc = ~(mux_305_nl | (fsm_output[7]));
  assign or_326_nl = (fsm_output[4]) | (fsm_output[6]) | (fsm_output[7]);
  assign nor_126_nl = ~((~ (z_out_1[5])) | (fsm_output[7]));
  assign mux_313_nl = MUX_s_1_2_2((fsm_output[7]), nor_126_nl, fsm_output[6]);
  assign nand_18_nl = ~((fsm_output[4]) & mux_313_nl);
  assign mux_314_nl = MUX_s_1_2_2(or_326_nl, nand_18_nl, fsm_output[0]);
  assign nor_125_nl = ~((fsm_output[2]) | mux_314_nl);
  assign nor_127_nl = ~((~ (fsm_output[2])) | (fsm_output[0]) | (fsm_output[4]) |
      (~((fsm_output[6]) | (z_out_1[5]))) | (fsm_output[7]));
  assign mux_315_nl = MUX_s_1_2_2(nor_125_nl, nor_127_nl, fsm_output[1]);
  assign S2_COPY_LOOP_p_nand_seb = ~(mux_315_nl & and_dcpl_19);
  assign or_858_cse = (~ (fsm_output[4])) | (fsm_output[6]);
  assign or_785_cse = (fsm_output[4]) | (fsm_output[7]);
  assign or_cse = (fsm_output[3]) | (fsm_output[2]) | (fsm_output[6]);
  assign and_455_cse = (fsm_output[1:0]==2'b11);
  assign and_490_cse = (fsm_output[0]) & (fsm_output[2]);
  assign nor_199_nl = ~((~ (fsm_output[0])) | (fsm_output[2]) | (~ (fsm_output[4]))
      | (fsm_output[7]) | (~ (fsm_output[6])));
  assign nor_200_nl = ~((fsm_output[0]) | (~ (fsm_output[2])) | mux_tmp_68);
  assign mux_70_nl = MUX_s_1_2_2(nor_199_nl, nor_200_nl, fsm_output[1]);
  assign and_23_nl = mux_70_nl & and_dcpl_19;
  assign S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl = MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1[4:0]),
      (z_out_1[4:0]), and_23_nl);
  assign or_41_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign mux_59_nl = MUX_s_1_2_2(or_41_nl, or_tmp_28, fsm_output[4]);
  assign or_9_nl = (fsm_output[4]) | (~ (fsm_output[3])) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign mux_60_nl = MUX_s_1_2_2(mux_59_nl, or_9_nl, fsm_output[2]);
  assign mux_57_nl = MUX_s_1_2_2(mux_tmp, or_tmp_28, fsm_output[4]);
  assign mux_58_nl = MUX_s_1_2_2(mux_57_nl, mux_tmp_1, fsm_output[2]);
  assign mux_61_nl = MUX_s_1_2_2(mux_60_nl, mux_58_nl, fsm_output[0]);
  assign or_4_nl = (fsm_output[4]) | (fsm_output[3]) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign mux_56_nl = MUX_s_1_2_2(mux_tmp_1, or_4_nl, and_490_cse);
  assign mux_62_nl = MUX_s_1_2_2(mux_61_nl, mux_56_nl, fsm_output[1]);
  assign nor_247_nl = ~(mux_62_nl | (fsm_output[5]));
  assign S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl
      = MUX_v_5_2_2(5'b00000, S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl, nor_247_nl);
  assign nor_119_nl = ~((fsm_output[6]) | (~((fsm_output[5]) & (fsm_output[2]))));
  assign nor_120_nl = ~((~ (fsm_output[6])) | (fsm_output[5]) | (fsm_output[2]));
  assign mux_341_nl = MUX_s_1_2_2(nor_119_nl, nor_120_nl, fsm_output[3]);
  assign mux_342_nl = MUX_s_1_2_2(nor_tmp_51, mux_341_nl, fsm_output[4]);
  assign nor_121_nl = ~((fsm_output[6:2]!=5'b10100));
  assign mux_343_nl = MUX_s_1_2_2(mux_342_nl, nor_121_nl, fsm_output[1]);
  assign or_350_nl = (fsm_output[6]) | (~ (fsm_output[5])) | (fsm_output[2]);
  assign or_349_nl = (fsm_output[6]) | (fsm_output[5]) | (~ (fsm_output[2]));
  assign mux_339_nl = MUX_s_1_2_2(or_350_nl, or_349_nl, fsm_output[3]);
  assign nor_122_nl = ~((fsm_output[4]) | mux_339_nl);
  assign nor_123_nl = ~((fsm_output[3]) | (fsm_output[6]) | (fsm_output[5]) | (~
      (fsm_output[2])));
  assign mux_338_nl = MUX_s_1_2_2(nor_123_nl, nor_tmp_51, fsm_output[4]);
  assign mux_340_nl = MUX_s_1_2_2(nor_122_nl, mux_338_nl, fsm_output[1]);
  assign mux_344_nl = MUX_s_1_2_2(mux_343_nl, mux_340_nl, fsm_output[0]);
  assign and_220_nl = mux_344_nl & (~ (fsm_output[7]));
  assign S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt = MUX_v_6_2_2(({1'b0 , S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl}),
      z_out_1, and_220_nl);
  assign or_823_cse = (fsm_output[5]) | (fsm_output[7]);
  assign or_826_cse = (fsm_output[5]) | (~ (fsm_output[4])) | (fsm_output[7]);
  assign nor_107_cse = ~((fsm_output[1:0]!=2'b00));
  assign and_494_cse = (fsm_output[2]) & (fsm_output[3]) & (fsm_output[6]);
  assign or_490_cse = (fsm_output[3:2]!=2'b10);
  assign or_495_cse = (fsm_output[6]) | (fsm_output[3]);
  assign mux_466_nl = MUX_s_1_2_2(and_494_cse, mux_tmp_99, fsm_output[0]);
  assign mux_465_nl = MUX_s_1_2_2(mux_tmp_99, (~ or_cse), fsm_output[0]);
  assign mux_467_nl = MUX_s_1_2_2(mux_466_nl, mux_465_nl, fsm_output[1]);
  assign and_242_nl = mux_467_nl & and_dcpl_49;
  assign butterFly_tw_butterFly_tw_mux_rgt = MUX_v_2_2_2(butterFly_tw_and_cse_3_2_sva_1,
      ({1'b0 , butterFly_4_tw_and_cse_2_sva_mx0w2}), and_242_nl);
  assign or_857_cse = (fsm_output[3]) | (fsm_output[6]) | (~ (fsm_output[0]));
  assign or_842_cse = (~ (fsm_output[3])) | (~ (fsm_output[6])) | (fsm_output[0]);
  assign mux_680_cse = MUX_s_1_2_2(or_857_cse, or_842_cse, fsm_output[2]);
  assign or_533_cse = (fsm_output[6]) | (~ (fsm_output[5])) | (fsm_output[3]);
  assign nor_77_cse = ~((fsm_output[5]) | (~ (fsm_output[1])) | (fsm_output[7]) |
      (~ (fsm_output[3])));
  assign butterFly_4_tw_and_cse_2_sva_mx0w2 = (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])
      & (S2_INNER_LOOP1_r_4_2_sva_1_0[0]);
  assign or_112_cse = (fsm_output[7:3]!=5'b01011);
  assign nand_94_cse = ~((fsm_output[6]) & (fsm_output[5]) & (~ (fsm_output[7]))
      & (fsm_output[3]));
  assign or_103_cse = (fsm_output[6]) | (fsm_output[5]) | (fsm_output[7]) | (~ (fsm_output[3]));
  assign or_118_cse = (fsm_output[6:3]!=4'b0001);
  assign or_124_cse = (fsm_output[4:3]!=2'b01);
  assign or_188_cse = (fsm_output[6:5]!=2'b00);
  assign butterFly_tw_and_cse_3_2_sva_1 = ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])}) & S2_INNER_LOOP1_r_4_2_sva_1_0;
  assign nl_mult_res_sva_1 = mult_17_z_asn_itm - mult_z_mul_cmp_z_oreg;
  assign mult_res_sva_1 = nl_mult_res_sva_1[31:0];
  assign nl_modulo_add_22_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_22_acc_1_nl = nl_modulo_add_22_acc_1_nl[32:0];
  assign modulo_add_22_acc_1_itm_32_1 = readslicef_33_1_32(modulo_add_22_acc_1_nl);
  assign nl_modulo_add_18_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_18_acc_1_nl = nl_modulo_add_18_acc_1_nl[32:0];
  assign modulo_add_18_acc_1_itm_32_1 = readslicef_33_1_32(modulo_add_18_acc_1_nl);
  assign nl_modulo_add_14_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_14_acc_1_nl = nl_modulo_add_14_acc_1_nl[32:0];
  assign modulo_add_14_acc_1_itm_32_1 = readslicef_33_1_32(modulo_add_14_acc_1_nl);
  assign nl_modulo_add_10_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_10_acc_1_nl = nl_modulo_add_10_acc_1_nl[32:0];
  assign modulo_add_10_acc_1_itm_32_1 = readslicef_33_1_32(modulo_add_10_acc_1_nl);
  assign nl_modulo_add_6_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_6_acc_1_nl = nl_modulo_add_6_acc_1_nl[32:0];
  assign modulo_add_6_acc_1_itm_32_1 = readslicef_33_1_32(modulo_add_6_acc_1_nl);
  assign nl_modulo_add_2_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_2_acc_1_nl = nl_modulo_add_2_acc_1_nl[32:0];
  assign modulo_add_2_acc_1_itm_32_1 = readslicef_33_1_32(modulo_add_2_acc_1_nl);
  assign or_6_cse = (fsm_output[7:6]!=2'b01);
  assign mux_tmp = MUX_s_1_2_2(or_336_cse_1, or_6_cse, fsm_output[3]);
  assign or_5_nl = (fsm_output[3]) | (~ (fsm_output[7])) | (fsm_output[6]);
  assign mux_tmp_1 = MUX_s_1_2_2(mux_tmp, or_5_nl, fsm_output[4]);
  assign and_dcpl_9 = (~ (fsm_output[7])) & (fsm_output[5]);
  assign or_tmp_12 = (fsm_output[3]) | (~ (fsm_output[6]));
  assign and_dcpl_17 = (z_out_2[2]) & S2_OUTER_LOOP_c_1_sva;
  assign and_tmp = (fsm_output[7]) & or_188_cse;
  assign mux_tmp_44 = MUX_s_1_2_2(and_tmp, (fsm_output[7]), fsm_output[4]);
  assign or_tmp_28 = (fsm_output[3]) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign and_dcpl_19 = ~((fsm_output[5]) | (fsm_output[3]));
  assign or_tmp_35 = (fsm_output[7:6]!=2'b10);
  assign mux_tmp_68 = MUX_s_1_2_2(or_336_cse_1, or_tmp_35, fsm_output[4]);
  assign and_dcpl_23 = ~((fsm_output[4]) | (fsm_output[2]));
  assign and_dcpl_25 = ~((fsm_output[7]) | (fsm_output[3]));
  assign and_dcpl_26 = (~ or_188_cse) & and_dcpl_25;
  assign and_dcpl_28 = (fsm_output[4:3]==2'b10);
  assign and_dcpl_33 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_34 = and_dcpl_23 & and_dcpl_33;
  assign and_dcpl_35 = and_dcpl_26 & and_dcpl_34;
  assign and_dcpl_37 = (fsm_output[4]) & (fsm_output[2]);
  assign and_dcpl_38 = and_dcpl_37 & nor_107_cse;
  assign and_dcpl_40 = (~ or_188_cse) & (fsm_output[7]) & (~ (fsm_output[3]));
  assign and_dcpl_41 = and_dcpl_40 & and_dcpl_38;
  assign nor_tmp_10 = (fsm_output[5]) & (fsm_output[3]);
  assign and_dcpl_42 = ~((fsm_output[5]) | (fsm_output[7]));
  assign or_tmp_64 = (fsm_output[1]) | (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[3]);
  assign and_dcpl_49 = and_dcpl_9 & (~ (fsm_output[4]));
  assign or_tmp_77 = (fsm_output[7:2]!=6'b001101);
  assign or_tmp_80 = (fsm_output[7:3]!=5'b10000);
  assign or_89_nl = (fsm_output[7:3]!=5'b00110);
  assign mux_tmp_92 = MUX_s_1_2_2(or_tmp_80, or_89_nl, fsm_output[2]);
  assign nor_248_nl = ~((fsm_output[2]) | nand_cse);
  assign nor_249_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (fsm_output[6]));
  assign not_tmp_58 = MUX_s_1_2_2(nor_248_nl, nor_249_nl, fsm_output[0]);
  assign and_dcpl_53 = not_tmp_58 & and_dcpl_42 & (fsm_output[3]) & (~ (fsm_output[1]));
  assign not_tmp_59 = ~((fsm_output[4]) & (fsm_output[3]) & (fsm_output[6]));
  assign or_94_nl = (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[3]) | (fsm_output[6]);
  assign or_93_nl = (fsm_output[2]) | not_tmp_59;
  assign mux_97_nl = MUX_s_1_2_2(or_94_nl, or_93_nl, fsm_output[0]);
  assign or_92_nl = (fsm_output[4]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_96_nl = MUX_s_1_2_2(not_tmp_59, or_92_nl, fsm_output[2]);
  assign mux_98_nl = MUX_s_1_2_2(mux_97_nl, mux_96_nl, fsm_output[1]);
  assign and_dcpl_54 = (~ mux_98_nl) & and_dcpl_42;
  assign and_483_cse = (fsm_output[3]) & (fsm_output[6]);
  assign nor_188_cse = ~((fsm_output[3]) | (fsm_output[6]));
  assign mux_tmp_99 = MUX_s_1_2_2(nor_188_cse, and_483_cse, fsm_output[2]);
  assign nor_185_nl = ~((fsm_output[7:5]!=3'b001));
  assign nor_186_nl = ~((fsm_output[7]) | (~ and_465_cse));
  assign mux_102_nl = MUX_s_1_2_2(nor_185_nl, nor_186_nl, fsm_output[3]);
  assign nand_2_nl = ~((fsm_output[2]) & (fsm_output[4]) & mux_102_nl);
  assign mux_103_itm = MUX_s_1_2_2(mux_tmp_92, nand_2_nl, and_455_cse);
  assign or_tmp_94 = (fsm_output[6]) | (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[3]);
  assign or_tmp_105 = (fsm_output[7:2]!=6'b100000);
  assign and_dcpl_65 = (~ (fsm_output[4])) & (fsm_output[2]);
  assign and_dcpl_66 = and_dcpl_65 & and_455_cse;
  assign and_dcpl_67 = (fsm_output[6:5]==2'b10);
  assign and_dcpl_68 = and_dcpl_67 & and_dcpl_25;
  assign and_dcpl_69 = and_dcpl_68 & and_dcpl_66;
  assign or_tmp_119 = (~ (fsm_output[0])) | (fsm_output[6]) | (~ (fsm_output[3]));
  assign and_dcpl_70 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_71 = and_dcpl_23 & and_dcpl_70;
  assign and_dcpl_72 = (~ (fsm_output[7])) & (fsm_output[3]);
  assign and_dcpl_73 = (~ or_188_cse) & and_dcpl_72;
  assign and_dcpl_74 = and_dcpl_73 & and_dcpl_71;
  assign and_dcpl_75 = (fsm_output[6:5]==2'b01);
  assign and_dcpl_76 = and_dcpl_75 & and_dcpl_72;
  assign and_dcpl_78 = and_dcpl_23 & and_455_cse;
  assign and_dcpl_80 = and_dcpl_65 & nor_107_cse;
  assign and_dcpl_82 = and_dcpl_65 & and_dcpl_70;
  assign and_dcpl_84 = and_dcpl_65 & and_dcpl_33;
  assign and_dcpl_87 = (fsm_output[4]) & (~ (fsm_output[2]));
  assign and_dcpl_88 = and_dcpl_87 & nor_107_cse;
  assign and_dcpl_89 = and_dcpl_75 & and_dcpl_25;
  assign and_dcpl_91 = and_dcpl_87 & and_dcpl_70;
  assign and_dcpl_93 = and_dcpl_67 & and_dcpl_72;
  assign and_dcpl_94 = and_dcpl_93 & and_dcpl_84;
  assign and_dcpl_95 = and_dcpl_93 & and_dcpl_66;
  assign and_dcpl_96 = and_465_cse & and_dcpl_25;
  assign and_dcpl_104 = and_dcpl_23 & nor_107_cse;
  assign and_dcpl_105 = and_465_cse & and_dcpl_72;
  assign and_dcpl_108 = (~ or_188_cse) & (fsm_output[7]) & (fsm_output[3]);
  assign and_dcpl_117 = (~ (fsm_output[7])) & (fsm_output[2]);
  assign and_dcpl_118 = and_dcpl_117 & (~ (fsm_output[1]));
  assign nor_tmp_21 = (fsm_output[3]) & (fsm_output[6]) & (fsm_output[5]);
  assign mux_tmp_138 = MUX_s_1_2_2((~ nor_tmp_21), or_533_cse, fsm_output[4]);
  assign mux_139_itm = MUX_s_1_2_2(mux_tmp_138, or_118_cse, fsm_output[0]);
  assign and_dcpl_125 = (~ (fsm_output[7])) & (fsm_output[4]);
  assign or_tmp_127 = (fsm_output[6:5]!=2'b01);
  assign mux_tmp_142 = MUX_s_1_2_2((~ and_465_cse), or_tmp_127, fsm_output[3]);
  assign or_136_nl = (fsm_output[3]) | (fsm_output[6]) | (fsm_output[5]);
  assign mux_143_itm = MUX_s_1_2_2(mux_tmp_142, or_136_nl, fsm_output[0]);
  assign and_476_nl = (fsm_output[0]) & (~ mux_tmp_142);
  assign nor_182_nl = ~((fsm_output[0]) | (fsm_output[3]) | (fsm_output[6]) | (fsm_output[5]));
  assign not_tmp_78 = MUX_s_1_2_2(and_476_nl, nor_182_nl, fsm_output[1]);
  assign and_dcpl_134 = and_dcpl_87 & and_dcpl_33;
  assign and_dcpl_136 = and_dcpl_40 & and_dcpl_134;
  assign and_dcpl_137 = and_dcpl_87 & and_455_cse;
  assign or_tmp_135 = (fsm_output[3]) | (fsm_output[7]) | (~ and_465_cse);
  assign or_146_nl = (~ (fsm_output[3])) | (~ (fsm_output[7])) | (fsm_output[6])
      | (fsm_output[5]);
  assign mux_146_nl = MUX_s_1_2_2(or_146_nl, or_tmp_135, fsm_output[0]);
  assign or_143_nl = (fsm_output[0]) | (~ (fsm_output[3])) | (fsm_output[7]) | (fsm_output[6])
      | (~ (fsm_output[5]));
  assign mux_147_itm = MUX_s_1_2_2(mux_146_nl, or_143_nl, fsm_output[1]);
  assign or_149_nl = (~ (fsm_output[0])) | (~ (fsm_output[3])) | (~ (fsm_output[7]))
      | (fsm_output[6]) | (fsm_output[5]);
  assign or_148_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (fsm_output[6]) | (~
      (fsm_output[5]));
  assign mux_148_nl = MUX_s_1_2_2(or_tmp_135, or_148_nl, fsm_output[0]);
  assign mux_149_itm = MUX_s_1_2_2(or_149_nl, mux_148_nl, fsm_output[1]);
  assign or_tmp_173 = (fsm_output[4:3]!=2'b10);
  assign mux_tmp_171 = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[5]);
  assign and_dcpl_147 = and_dcpl_37 & and_dcpl_33;
  assign and_dcpl_149 = and_dcpl_37 & and_455_cse;
  assign and_dcpl_156 = and_dcpl_37 & and_dcpl_70;
  assign mux_191_nl = MUX_s_1_2_2(or_tmp_80, or_112_cse, fsm_output[0]);
  assign or_201_nl = (fsm_output[0]) | (fsm_output[4]) | (fsm_output[3]) | (fsm_output[7])
      | (fsm_output[6]) | (~ (fsm_output[5]));
  assign mux_192_itm = MUX_s_1_2_2(mux_191_nl, or_201_nl, fsm_output[1]);
  assign or_205_nl = (~ (fsm_output[0])) | (fsm_output[4]) | (fsm_output[3]) | (~
      (fsm_output[7])) | (fsm_output[6]) | (fsm_output[5]);
  assign or_204_nl = (fsm_output[7:3]!=5'b00100);
  assign mux_193_nl = MUX_s_1_2_2(or_112_cse, or_204_nl, fsm_output[0]);
  assign mux_194_itm = MUX_s_1_2_2(or_205_nl, mux_193_nl, fsm_output[1]);
  assign or_tmp_202 = (fsm_output[7:2]!=6'b010111);
  assign and_dcpl_179 = (~ mux_194_itm) & (fsm_output[2]);
  assign or_215_nl = (fsm_output[0]) | (fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[3]))
      | (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[5]));
  assign or_213_nl = (fsm_output[7:2]!=6'b100001);
  assign mux_199_nl = MUX_s_1_2_2(or_213_nl, or_tmp_202, fsm_output[0]);
  assign mux_200_itm = MUX_s_1_2_2(or_215_nl, mux_199_nl, fsm_output[1]);
  assign and_dcpl_180 = and_dcpl_93 & and_dcpl_104;
  assign and_dcpl_189 = ~((fsm_output[7]) | (fsm_output[2]));
  assign nor_151_nl = ~((fsm_output[3]) | (~ (fsm_output[6])) | (fsm_output[5]));
  assign mux_tmp_202 = MUX_s_1_2_2(nor_151_nl, nor_tmp_21, fsm_output[4]);
  assign nor_207_nl = ~((fsm_output[6:3]!=4'b0011));
  assign not_tmp_110 = MUX_s_1_2_2(mux_tmp_202, nor_207_nl, fsm_output[0]);
  assign nor_tmp_34 = (fsm_output[6]) & (fsm_output[4]);
  assign or_tmp_222 = (fsm_output[6:3]!=4'b0000);
  assign or_234_nl = (fsm_output[6:4]!=3'b010);
  assign or_233_nl = (fsm_output[5]) | (~ nor_tmp_34);
  assign mux_218_nl = MUX_s_1_2_2(or_234_nl, or_233_nl, fsm_output[3]);
  assign mux_tmp_219 = MUX_s_1_2_2(mux_218_nl, or_tmp_222, fsm_output[7]);
  assign and_dcpl_200 = (fsm_output[2]) & (~ (fsm_output[0]));
  assign and_dcpl_202 = (~ or_188_cse) & (fsm_output[7]);
  assign or_tmp_232 = (~((~ (fsm_output[4])) | (fsm_output[0]) | (fsm_output[1])))
      | (fsm_output[7]);
  assign not_tmp_125 = ~(and_455_cse | (fsm_output[7]));
  assign or_338_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (fsm_output[4]);
  assign nand_9_nl = ~((fsm_output[4]) & not_tmp_125);
  assign mux_tmp_226 = MUX_s_1_2_2(or_338_nl, nand_9_nl, fsm_output[6]);
  assign or_tmp_249 = (~ (fsm_output[4])) | (fsm_output[2]);
  assign or_265_nl = (fsm_output[4]) | (~ (fsm_output[2]));
  assign mux_tmp_239 = MUX_s_1_2_2(or_tmp_249, or_265_nl, fsm_output[5]);
  assign nand_tmp_12 = ~((fsm_output[3]) & (~ mux_tmp_239));
  assign or_tmp_254 = (~ (fsm_output[5])) | (~ (fsm_output[4])) | (fsm_output[2]);
  assign mux_tmp_251 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[6]);
  assign or_tmp_258 = (fsm_output[4]) | (fsm_output[3]) | (fsm_output[7]) | (~ (fsm_output[5]));
  assign or_tmp_259 = (~ (fsm_output[4])) | (fsm_output[3]) | (fsm_output[7]) | (fsm_output[5]);
  assign or_tmp_263 = (~ (fsm_output[4])) | (fsm_output[3]) | (fsm_output[7]) | (~
      (fsm_output[5]));
  assign or_tmp_265 = (~ (fsm_output[3])) | (fsm_output[7]) | (~ (fsm_output[5]));
  assign nor_140_nl = ~((fsm_output[0]) | (fsm_output[1]) | (~ (fsm_output[3])));
  assign and_463_nl = (fsm_output[1]) & (fsm_output[3]);
  assign mux_tmp_268 = MUX_s_1_2_2(nor_140_nl, and_463_nl, fsm_output[4]);
  assign or_tmp_287 = (fsm_output[3:2]!=2'b00);
  assign nor_tmp_42 = (fsm_output[3:2]==2'b11);
  assign mux_tmp_280 = MUX_s_1_2_2((~ nor_tmp_42), or_tmp_287, fsm_output[5]);
  assign or_tmp_291 = (~ (fsm_output[5])) | (fsm_output[3]) | (~ (fsm_output[2]));
  assign or_tmp_293 = (fsm_output[3:2]!=2'b01);
  assign mux_tmp_298 = MUX_s_1_2_2((~ and_465_cse), or_188_cse, fsm_output[3]);
  assign or_tmp_300 = (~((fsm_output[3]) | (~ (fsm_output[6])))) | (fsm_output[5]);
  assign nor_tmp_51 = (fsm_output[3]) & (fsm_output[6]) & (fsm_output[5]) & (fsm_output[2]);
  assign nor_250_nl = ~((~ (fsm_output[0])) | (fsm_output[2]) | (fsm_output[4]) |
      (fsm_output[7]) | (fsm_output[6]));
  assign nor_251_nl = ~((fsm_output[2]) | (~ (fsm_output[4])) | (~ (fsm_output[7]))
      | (fsm_output[6]));
  assign nor_252_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (fsm_output[7]) |
      (~ (fsm_output[6])));
  assign mux_362_nl = MUX_s_1_2_2(nor_251_nl, nor_252_nl, fsm_output[0]);
  assign mux_363_nl = MUX_s_1_2_2(nor_250_nl, mux_362_nl, fsm_output[1]);
  assign and_dcpl_213 = mux_363_nl & and_dcpl_19;
  assign or_tmp_356 = (fsm_output[5]) | (fsm_output[7]) | (fsm_output[3]);
  assign or_tmp_358 = (fsm_output[5]) | (fsm_output[7]) | (~ (fsm_output[3]));
  assign and_tmp_8 = (fsm_output[3]) & mux_240_cse;
  assign nand_85_nl = ~((fsm_output[2]) & (fsm_output[4]) & (~ (fsm_output[3])) &
      (fsm_output[6]));
  assign or_414_nl = (fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_tmp_408 = MUX_s_1_2_2(nand_85_nl, or_414_nl, fsm_output[0]);
  assign not_tmp_220 = ~((fsm_output[2]) & (fsm_output[6]));
  assign or_tmp_419 = (fsm_output[2]) | (~ (fsm_output[3])) | (fsm_output[6]) | (~
      (fsm_output[5]));
  assign not_tmp_231 = ~((fsm_output[3:2]==2'b11));
  assign or_537_nl = (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[4]);
  assign mux_tmp_489 = MUX_s_1_2_2(or_826_cse, or_537_nl, fsm_output[2]);
  assign or_tmp_521 = (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[7]) | (~
      (fsm_output[4]));
  assign or_tmp_538 = (~ (fsm_output[1])) | (fsm_output[7]) | (fsm_output[3]);
  assign and_dcpl_240 = ~(or_188_cse | (fsm_output[7]));
  assign and_dcpl_241 = and_dcpl_240 & and_dcpl_28;
  assign and_dcpl_259 = ~((fsm_output[2]) | (fsm_output[0]));
  assign and_dcpl_262 = and_dcpl_240 & and_492_cse;
  assign and_dcpl_276 = (~ (fsm_output[2])) & (fsm_output[0]);
  assign and_dcpl_278 = (fsm_output[4:3]==2'b01);
  assign and_dcpl_279 = and_dcpl_75 & (~ (fsm_output[7]));
  assign and_dcpl_280 = and_dcpl_279 & and_dcpl_278;
  assign and_dcpl_311 = and_dcpl_279 & and_492_cse;
  assign and_dcpl_342 = ~((fsm_output[4:3]!=2'b00));
  assign and_dcpl_343 = and_465_cse & (~ (fsm_output[7]));
  assign and_dcpl_344 = and_dcpl_343 & and_dcpl_342;
  assign and_dcpl_375 = and_dcpl_343 & and_dcpl_28;
  assign and_dcpl_406 = and_dcpl_202 & and_dcpl_342;
  assign and_dcpl_413 = and_dcpl_202 & and_dcpl_278;
  assign xx_rsci_radr_d_mx0c0 = (~ mux_139_itm) & and_dcpl_118;
  assign and_478_nl = (fsm_output[0]) & (~ mux_tmp_138);
  assign nor_184_nl = ~((fsm_output[0]) | (fsm_output[4]) | (~ (fsm_output[3])) |
      (fsm_output[6]) | (fsm_output[5]));
  assign mux_140_nl = MUX_s_1_2_2(and_478_nl, nor_184_nl, fsm_output[1]);
  assign xx_rsci_radr_d_mx0c1 = mux_140_nl & and_dcpl_117;
  assign xx_rsci_radr_d_mx0c2 = (~ mux_139_itm) & and_dcpl_117 & (fsm_output[1]);
  assign or_652_nl = (fsm_output[0]) | (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[5]);
  assign nand_82_nl = ~((fsm_output[0]) & (fsm_output[2]) & (~ mux_tmp_138));
  assign mux_141_nl = MUX_s_1_2_2(or_652_nl, nand_82_nl, fsm_output[1]);
  assign xx_rsci_radr_d_mx0c3 = ~(mux_141_nl | (fsm_output[7]));
  assign xx_rsci_radr_d_mx0c4 = ~(mux_143_itm | (~ and_dcpl_125) | (fsm_output[2:1]!=2'b00));
  assign xx_rsci_radr_d_mx0c5 = not_tmp_78 & and_dcpl_125 & (~ (fsm_output[2]));
  assign xx_rsci_radr_d_mx0c6 = (~ mux_143_itm) & and_dcpl_125 & (fsm_output[2:1]==2'b01);
  assign nor_180_nl = ~((fsm_output[0]) | (~ (fsm_output[2])) | (fsm_output[3]) |
      (fsm_output[6]) | (fsm_output[5]));
  assign nor_181_nl = ~((~ (fsm_output[0])) | (fsm_output[2]) | mux_tmp_142);
  assign mux_145_nl = MUX_s_1_2_2(nor_180_nl, nor_181_nl, fsm_output[1]);
  assign xx_rsci_radr_d_mx0c7 = mux_145_nl & and_dcpl_125;
  assign xx_rsci_radr_d_mx0c8 = and_dcpl_68 & and_dcpl_134;
  assign xx_rsci_radr_d_mx0c10 = and_dcpl_40 & and_dcpl_137;
  assign xx_rsci_wadr_d_mx0c1 = (~ mux_147_itm) & and_dcpl_23;
  assign xx_rsci_wadr_d_mx0c2 = (~ mux_149_itm) & and_dcpl_23;
  assign or_659_nl = (fsm_output[0]) | (~ (fsm_output[2])) | (~ (fsm_output[3]))
      | (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[5]));
  assign or_660_nl = (fsm_output[2]) | (~ (fsm_output[3])) | (~ (fsm_output[7]))
      | (fsm_output[6]) | (fsm_output[5]);
  assign or_661_nl = (fsm_output[2]) | (fsm_output[3]) | (fsm_output[7]) | (~ and_465_cse);
  assign mux_150_nl = MUX_s_1_2_2(or_660_nl, or_661_nl, fsm_output[0]);
  assign mux_151_nl = MUX_s_1_2_2(or_659_nl, mux_150_nl, fsm_output[1]);
  assign xx_rsci_wadr_d_mx0c3 = ~(mux_151_nl | (fsm_output[4]));
  assign or_656_nl = (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[7]) | (~
      and_465_cse);
  assign or_657_nl = (~ (fsm_output[2])) | (~ (fsm_output[3])) | (fsm_output[7])
      | (fsm_output[6]) | (~ (fsm_output[5]));
  assign mux_152_nl = MUX_s_1_2_2(or_656_nl, or_657_nl, fsm_output[0]);
  assign or_658_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (~ (fsm_output[3]))
      | (~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[5]);
  assign mux_153_nl = MUX_s_1_2_2(mux_152_nl, or_658_nl, fsm_output[1]);
  assign xx_rsci_wadr_d_mx0c4 = ~(mux_153_nl | (fsm_output[4]));
  assign xx_rsci_wadr_d_mx0c5 = (~ mux_147_itm) & and_dcpl_65;
  assign xx_rsci_wadr_d_mx0c6 = (~ mux_149_itm) & and_dcpl_65;
  assign nor_171_nl = ~((fsm_output[0]) | (fsm_output[2]) | (~ (fsm_output[4])) |
      (fsm_output[3]) | (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[5])));
  assign nor_172_nl = ~((fsm_output[7:2]!=6'b100011));
  assign nor_173_nl = ~((~ (fsm_output[2])) | (fsm_output[4]) | (fsm_output[3]) |
      (fsm_output[7]) | (~ and_465_cse));
  assign mux_154_nl = MUX_s_1_2_2(nor_172_nl, nor_173_nl, fsm_output[0]);
  assign xx_rsci_wadr_d_mx0c7 = MUX_s_1_2_2(nor_171_nl, mux_154_nl, fsm_output[1]);
  assign nor_168_nl = ~((fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[3])) |
      (fsm_output[7]) | (~ and_465_cse));
  assign nor_169_nl = ~((fsm_output[7:2]!=6'b001100));
  assign mux_156_nl = MUX_s_1_2_2(nor_168_nl, nor_169_nl, fsm_output[0]);
  assign nor_170_nl = ~((~ (fsm_output[0])) | (~ (fsm_output[2])) | (fsm_output[4])
      | (~ (fsm_output[3])) | (~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[5]));
  assign xx_rsci_wadr_d_mx0c8 = MUX_s_1_2_2(mux_156_nl, nor_170_nl, fsm_output[1]);
  assign yy_rsci_radr_d_mx0c0 = and_dcpl_26 & and_dcpl_66;
  assign or_654_nl = (fsm_output[6:2]!=5'b10110);
  assign or_655_nl = (fsm_output[6:2]!=5'b01000);
  assign mux_189_nl = MUX_s_1_2_2(or_654_nl, or_655_nl, fsm_output[0]);
  assign nand_90_nl = ~((fsm_output[0]) & (fsm_output[2]) & (fsm_output[4]) & (fsm_output[3])
      & (fsm_output[6]) & (fsm_output[5]));
  assign mux_190_nl = MUX_s_1_2_2(mux_189_nl, nand_90_nl, fsm_output[1]);
  assign yy_rsci_radr_d_mx0c1 = ~(mux_190_nl | (fsm_output[7]));
  assign yy_rsci_radr_d_mx0c2 = ~(mux_192_itm | (fsm_output[2]));
  assign yy_rsci_radr_d_mx0c3 = ~(mux_194_itm | (fsm_output[2]));
  assign or_208_nl = (fsm_output[0]) | (~ (fsm_output[2])) | (fsm_output[4]) | (fsm_output[3])
      | (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[5]));
  assign or_206_nl = (fsm_output[7:2]!=6'b010110);
  assign mux_195_nl = MUX_s_1_2_2(or_tmp_105, or_206_nl, fsm_output[0]);
  assign mux_196_itm = MUX_s_1_2_2(or_208_nl, mux_195_nl, fsm_output[1]);
  assign or_211_nl = (fsm_output[7:2]!=6'b001001);
  assign mux_197_nl = MUX_s_1_2_2(or_tmp_202, or_211_nl, fsm_output[0]);
  assign or_209_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (fsm_output[4]) | (fsm_output[3])
      | (~ (fsm_output[7])) | (fsm_output[6]) | (fsm_output[5]);
  assign mux_198_itm = MUX_s_1_2_2(mux_197_nl, or_209_nl, fsm_output[1]);
  assign yy_rsci_radr_d_mx0c6 = (~ mux_192_itm) & (fsm_output[2]);
  assign yy_rsci_wadr_d_mx0c0 = and_dcpl_26 & and_dcpl_78;
  assign yy_rsci_wadr_d_mx0c1 = and_dcpl_26 & and_dcpl_80;
  assign yy_rsci_wadr_d_mx0c2 = not_tmp_78 & and_dcpl_125 & (fsm_output[2]);
  assign yy_rsci_wadr_d_mx0c3 = (~ mux_143_itm) & and_dcpl_125 & (fsm_output[2:1]==2'b11);
  assign nor_152_nl = ~((fsm_output[0]) | (fsm_output[2]) | (~ (fsm_output[3])) |
      (fsm_output[6]) | (fsm_output[5]));
  assign and_470_nl = (fsm_output[0]) & (fsm_output[2]) & (~ mux_tmp_142);
  assign mux_201_nl = MUX_s_1_2_2(nor_152_nl, and_470_nl, fsm_output[1]);
  assign yy_rsci_wadr_d_mx0c4 = mux_201_nl & and_dcpl_125;
  assign yy_rsci_wadr_d_mx0c5 = not_tmp_110 & and_dcpl_189 & (~ (fsm_output[1]));
  assign and_469_nl = (fsm_output[0]) & mux_tmp_202;
  assign nor_150_nl = ~((fsm_output[0]) | (~ (fsm_output[4])) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (fsm_output[5]));
  assign mux_204_nl = MUX_s_1_2_2(and_469_nl, nor_150_nl, fsm_output[1]);
  assign yy_rsci_wadr_d_mx0c6 = mux_204_nl & and_dcpl_189;
  assign yy_rsci_wadr_d_mx0c7 = not_tmp_110 & and_dcpl_189 & (fsm_output[1]);
  assign or_650_nl = (fsm_output[0]) | (~ (fsm_output[2])) | (~ (fsm_output[4]))
      | (~ (fsm_output[3])) | (fsm_output[6]) | (fsm_output[5]);
  assign or_651_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (~ mux_tmp_202);
  assign mux_205_nl = MUX_s_1_2_2(or_650_nl, or_651_nl, fsm_output[1]);
  assign yy_rsci_wadr_d_mx0c8 = ~(mux_205_nl | (fsm_output[7]));
  assign yy_rsci_wadr_d_mx0c9 = not_tmp_110 & and_dcpl_118;
  assign yy_rsci_wadr_d_mx0c10 = and_dcpl_68 & and_dcpl_38;
  assign mux_367_nl = MUX_s_1_2_2(or_336_cse_1, or_6_cse, fsm_output[4]);
  assign or_370_nl = (fsm_output[2]) | mux_367_nl;
  assign mux_33_nl = MUX_s_1_2_2((fsm_output[6]), (~ (fsm_output[6])), fsm_output[7]);
  assign nand_20_nl = ~((fsm_output[4]) & mux_33_nl);
  assign mux_366_nl = MUX_s_1_2_2(nand_20_nl, mux_tmp_68, fsm_output[2]);
  assign mux_368_nl = MUX_s_1_2_2(or_370_nl, mux_366_nl, fsm_output[0]);
  assign mux_364_nl = MUX_s_1_2_2((fsm_output[7]), or_tmp_35, fsm_output[4]);
  assign or_645_nl = (fsm_output[0]) | (~ (fsm_output[2])) | mux_364_nl;
  assign mux_369_nl = MUX_s_1_2_2(mux_368_nl, or_645_nl, fsm_output[1]);
  assign S1_OUTER_LOOP_for_p_sva_1_mx0c1 = (~ mux_369_nl) & and_dcpl_19;
  assign nor_117_nl = ~((fsm_output[2]) | (fsm_output[6]));
  assign and_453_nl = (fsm_output[2]) & (fsm_output[6]);
  assign mux_376_nl = MUX_s_1_2_2(nor_117_nl, and_453_nl, fsm_output[1]);
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 = mux_376_nl & (~ (fsm_output[5])) &
      and_dcpl_25 & (~ (fsm_output[4])) & (fsm_output[0]);
  assign mux_378_cse = MUX_s_1_2_2(or_283_cse, or_tmp_356, fsm_output[6]);
  assign mux_386_nl = MUX_s_1_2_2(or_tmp_94, nand_94_cse, fsm_output[1]);
  assign or_388_nl = (fsm_output[4]) | mux_386_nl;
  assign mux_384_nl = MUX_s_1_2_2(or_103_cse, or_tmp_356, fsm_output[1]);
  assign nor_116_nl = ~((fsm_output[7]) | (~ (fsm_output[3])));
  assign mux_383_nl = MUX_s_1_2_2(and_dcpl_25, nor_116_nl, fsm_output[5]);
  assign nand_23_nl = ~((fsm_output[1]) & (fsm_output[6]) & mux_383_nl);
  assign mux_385_nl = MUX_s_1_2_2(mux_384_nl, nand_23_nl, fsm_output[4]);
  assign mux_387_nl = MUX_s_1_2_2(or_388_nl, mux_385_nl, fsm_output[2]);
  assign mux_380_nl = MUX_s_1_2_2(or_tmp_358, or_tmp_265, fsm_output[6]);
  assign nand_22_nl = ~((fsm_output[1]) & (~ mux_380_nl));
  assign mux_379_nl = MUX_s_1_2_2(mux_378_cse, or_tmp_94, fsm_output[1]);
  assign mux_381_nl = MUX_s_1_2_2(nand_22_nl, mux_379_nl, fsm_output[4]);
  assign mux_377_nl = MUX_s_1_2_2(or_tmp_358, or_tmp_356, fsm_output[6]);
  assign nand_21_nl = ~((fsm_output[4]) & (fsm_output[1]) & (~ mux_377_nl));
  assign mux_382_nl = MUX_s_1_2_2(mux_381_nl, nand_21_nl, fsm_output[2]);
  assign mux_388_itm = MUX_s_1_2_2(mux_387_nl, mux_382_nl, fsm_output[0]);
  assign nor_113_nl = ~((fsm_output[0]) | (fsm_output[4]) | (~ (fsm_output[3])) |
      (fsm_output[6]));
  assign and_nl = (fsm_output[0]) & (fsm_output[4]) & (~ (fsm_output[3])) & (fsm_output[6]);
  assign mux_389_nl = MUX_s_1_2_2(nor_113_nl, and_nl, fsm_output[1]);
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 = mux_389_nl & and_dcpl_42 & (~ (fsm_output[2]));
  assign nor_110_nl = ~((fsm_output[4:2]!=3'b100));
  assign mux_392_nl = MUX_s_1_2_2(and_tmp_8, nor_110_nl, fsm_output[5]);
  assign nand_24_nl = ~((fsm_output[1]) & mux_392_nl);
  assign or_395_nl = (fsm_output[5:1]!=5'b01000);
  assign mux_393_nl = MUX_s_1_2_2(nand_24_nl, or_395_nl, fsm_output[7]);
  assign nor_109_nl = ~((fsm_output[6]) | mux_393_nl);
  assign nor_112_nl = ~((fsm_output[3:2]!=2'b01));
  assign mux_391_nl = MUX_s_1_2_2(nor_112_nl, and_tmp_8, fsm_output[5]);
  assign nor_111_nl = ~((~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[1]) |
      (~ mux_391_nl));
  assign S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 = MUX_s_1_2_2(nor_109_nl, nor_111_nl,
      fsm_output[0]);
  assign S2_OUTER_LOOP_c_1_sva_mx0c1 = (~ mux_tmp_408) & and_dcpl_42 & (fsm_output[1]);
  assign S2_OUTER_LOOP_c_1_sva_mx0c2 = and_dcpl_89 & and_dcpl_137;
  assign S2_OUTER_LOOP_c_1_sva_mx0c3 = and_dcpl_105 & and_dcpl_147;
  assign butterFly_10_f1_sva_mx0c0 = and_dcpl_26 & and_dcpl_23 & (fsm_output[1]);
  assign nor_95_nl = ~((fsm_output[4:0]!=5'b01000));
  assign nor_96_nl = ~((fsm_output[0]) | (~ (fsm_output[1])) | (~ (fsm_output[2]))
      | (fsm_output[4]));
  assign nor_97_nl = ~((~ (fsm_output[0])) | (fsm_output[1]) | (fsm_output[2]) |
      (fsm_output[4]));
  assign mux_417_nl = MUX_s_1_2_2(nor_96_nl, nor_97_nl, fsm_output[3]);
  assign mux_418_nl = MUX_s_1_2_2(nor_95_nl, mux_417_nl, fsm_output[5]);
  assign nor_98_nl = ~((~ (fsm_output[3])) | (~ (fsm_output[0])) | (fsm_output[1])
      | nand_59_cse);
  assign nor_99_nl = ~((fsm_output[4:0]!=5'b00000));
  assign mux_416_nl = MUX_s_1_2_2(nor_98_nl, nor_99_nl, fsm_output[5]);
  assign mux_419_nl = MUX_s_1_2_2(mux_418_nl, mux_416_nl, fsm_output[6]);
  assign or_428_nl = (fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[4]);
  assign or_427_nl = (~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[4]);
  assign mux_415_nl = MUX_s_1_2_2(or_428_nl, or_427_nl, fsm_output[0]);
  assign nor_100_nl = ~((fsm_output[6]) | (fsm_output[5]) | (fsm_output[3]) | mux_415_nl);
  assign butterFly_10_f1_sva_mx0c1 = MUX_s_1_2_2(mux_419_nl, nor_100_nl, fsm_output[7]);
  assign or_442_nl = (fsm_output[3:2]!=2'b01) | (~ mux_tmp_251);
  assign or_440_nl = (fsm_output[3:2]!=2'b00) | (~ and_465_cse);
  assign mux_422_nl = MUX_s_1_2_2(or_442_nl, or_440_nl, fsm_output[0]);
  assign or_445_nl = (fsm_output[5]) | (fsm_output[2]) | (~ (fsm_output[6])) | (fsm_output[3]);
  assign mux_421_nl = MUX_s_1_2_2(or_tmp_419, or_445_nl, fsm_output[0]);
  assign mux_423_nl = MUX_s_1_2_2(mux_422_nl, mux_421_nl, fsm_output[1]);
  assign butterFly_10_f1_sva_mx0c2 = (~ mux_423_nl) & and_dcpl_125;
  assign or_470_nl = (fsm_output[6]) | (fsm_output[0]) | not_tmp_231;
  assign or_468_nl = (fsm_output[6]) | (fsm_output[0]) | (fsm_output[2]) | (fsm_output[3]);
  assign mux_443_nl = MUX_s_1_2_2(or_470_nl, or_468_nl, fsm_output[5]);
  assign or_649_nl = (fsm_output[4]) | mux_443_nl;
  assign nand_79_nl = ~((fsm_output[5]) & (fsm_output[6]) & (fsm_output[0]) & (~
      (fsm_output[2])) & (fsm_output[3]));
  assign nand_80_nl = ~((fsm_output[6]) & (fsm_output[0]) & (fsm_output[2]) & (~
      (fsm_output[3])));
  assign nor_89_nl = ~((~ (fsm_output[0])) | (fsm_output[2]) | (fsm_output[3]));
  assign nor_90_nl = ~((fsm_output[0]) | not_tmp_231);
  assign mux_440_nl = MUX_s_1_2_2(nor_89_nl, nor_90_nl, fsm_output[6]);
  assign nand_81_nl = ~(S2_OUTER_LOOP_c_1_sva & (z_out_2[2]) & mux_440_nl);
  assign mux_441_nl = MUX_s_1_2_2(nand_80_nl, nand_81_nl, fsm_output[5]);
  assign mux_442_nl = MUX_s_1_2_2(nand_79_nl, mux_441_nl, fsm_output[4]);
  assign mux_444_nl = MUX_s_1_2_2(or_649_nl, mux_442_nl, fsm_output[1]);
  assign S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 = ~(mux_444_nl | (fsm_output[7]));
  assign nor_86_nl = ~((~ (fsm_output[7])) | (fsm_output[5]) | (~ (fsm_output[4]))
      | (fsm_output[2]) | (fsm_output[3]) | (~ (fsm_output[0])) | (fsm_output[6]));
  assign or_480_nl = (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[0]) | (~
      (fsm_output[6]));
  assign nand_42_nl = ~((fsm_output[2]) & (fsm_output[0]) & (~ (fsm_output[6])) &
      (fsm_output[3]));
  assign mux_447_nl = MUX_s_1_2_2(or_480_nl, nand_42_nl, fsm_output[4]);
  assign or_477_nl = (fsm_output[2]) | (~ (fsm_output[3])) | (fsm_output[0]) | (~
      (fsm_output[6]));
  assign or_475_nl = (z_out_2[2]) | mux_680_cse;
  assign mux_446_nl = MUX_s_1_2_2(or_477_nl, or_475_nl, fsm_output[4]);
  assign mux_448_nl = MUX_s_1_2_2(mux_447_nl, mux_446_nl, fsm_output[5]);
  assign nor_87_nl = ~((fsm_output[7]) | mux_448_nl);
  assign S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2 = MUX_s_1_2_2(nor_86_nl, nor_87_nl, fsm_output[1]);
  assign mult_11_z_asn_itm_mx0c1 = and_dcpl_93 & and_dcpl_34;
  assign mult_10_z_asn_itm_mx0c1 = and_dcpl_93 & and_dcpl_78;
  assign modulo_sub_3_mux_itm_mx0c1 = and_dcpl_241 & and_490_cse & (~ (fsm_output[1]))
      & (~ (z_out_8[31]));
  assign modulo_sub_1_mux_itm_mx0c1 = and_dcpl_241 & and_dcpl_200 & (fsm_output[1])
      & (~ (z_out_14[31]));
  assign modulo_sub_mux_itm_mx0c1 = and_dcpl_241 & and_490_cse & (fsm_output[1])
      & (~ (z_out_8[31]));
  assign modulo_add_2_mux_itm_mx0c1 = and_dcpl_262 & and_dcpl_259 & (~ (fsm_output[1]))
      & (~ modulo_add_2_acc_1_itm_32_1);
  assign modulo_sub_2_mux_itm_mx0c1 = and_dcpl_262 & and_dcpl_259 & (~ (fsm_output[1]))
      & (~ (z_out_10[31]));
  assign modulo_sub_7_mux_itm_mx0c1 = and_dcpl_280 & and_dcpl_276 & (~ (fsm_output[1]))
      & (~ (z_out_14[31]));
  assign modulo_sub_5_mux_itm_mx0c1 = and_dcpl_280 & and_dcpl_259 & (fsm_output[1])
      & (~ (z_out_10[31]));
  assign modulo_sub_4_mux_itm_mx0c1 = and_dcpl_280 & and_dcpl_276 & (fsm_output[1])
      & (~ (z_out_14[31]));
  assign modulo_add_6_mux_itm_mx0c1 = and_dcpl_280 & and_dcpl_200 & (~ (fsm_output[1]))
      & (~ modulo_add_6_acc_1_itm_32_1);
  assign modulo_sub_6_mux_itm_mx0c1 = and_dcpl_280 & and_dcpl_200 & (~ (fsm_output[1]))
      & (~ (z_out_8[31]));
  assign modulo_sub_11_mux_itm_mx0c1 = and_dcpl_311 & and_dcpl_200 & (~ (fsm_output[1]))
      & (~ (z_out_10[31]));
  assign modulo_sub_9_mux_itm_mx0c1 = and_dcpl_311 & and_490_cse & (~ (fsm_output[1]))
      & (~ (z_out_8[31]));
  assign modulo_sub_8_mux_itm_mx0c1 = and_dcpl_311 & and_dcpl_200 & (fsm_output[1])
      & (~ (z_out_10[31]));
  assign modulo_add_10_mux_itm_mx0c1 = and_dcpl_311 & and_490_cse & (fsm_output[1])
      & (~ modulo_add_10_acc_1_itm_32_1);
  assign modulo_sub_10_mux_itm_mx0c1 = and_dcpl_311 & and_490_cse & (fsm_output[1])
      & (~ (z_out_14[31]));
  assign modulo_sub_15_mux_itm_mx0c1 = and_dcpl_344 & and_dcpl_259 & (~ (fsm_output[1]))
      & (~ (z_out_14[31]));
  assign modulo_sub_13_mux_itm_mx0c1 = and_dcpl_344 & and_dcpl_276 & (~ (fsm_output[1]))
      & (~ (z_out_10[31]));
  assign modulo_sub_12_mux_itm_mx0c1 = and_dcpl_344 & and_dcpl_259 & (fsm_output[1])
      & (~ (z_out_14[31]));
  assign modulo_add_14_mux_itm_mx0c1 = and_dcpl_344 & and_dcpl_276 & (fsm_output[1])
      & (~ modulo_add_14_acc_1_itm_32_1);
  assign modulo_sub_14_mux_itm_mx0c1 = and_dcpl_344 & and_dcpl_276 & (fsm_output[1])
      & (~ (z_out_8[31]));
  assign modulo_sub_19_mux_itm_mx0c1 = and_dcpl_375 & and_dcpl_200 & (~ (fsm_output[1]))
      & (~ (z_out_14[31]));
  assign modulo_sub_17_mux_itm_mx0c1 = and_dcpl_375 & and_490_cse & (~ (fsm_output[1]))
      & (~ (z_out_10[31]));
  assign modulo_sub_16_mux_itm_mx0c1 = and_dcpl_375 & and_dcpl_200 & (fsm_output[1])
      & (~ (z_out_14[31]));
  assign modulo_add_18_mux_itm_mx0c1 = and_dcpl_375 & and_490_cse & (fsm_output[1])
      & (~ modulo_add_18_acc_1_itm_32_1);
  assign modulo_sub_18_mux_itm_mx0c1 = and_dcpl_375 & and_490_cse & (fsm_output[1])
      & (~ (z_out_8[31]));
  assign modulo_sub_23_mux_itm_mx0c1 = and_dcpl_406 & and_490_cse & (fsm_output[1])
      & (~ (z_out_14[31]));
  assign modulo_sub_21_mux_itm_mx0c1 = and_dcpl_413 & and_dcpl_259 & (~ (fsm_output[1]))
      & (~ (z_out_10[31]));
  assign modulo_sub_20_mux_itm_mx0c1 = and_dcpl_413 & and_dcpl_276 & (~ (fsm_output[1]))
      & (~ (z_out_14[31]));
  assign modulo_add_22_mux_itm_mx0c1 = and_dcpl_413 & and_dcpl_259 & (fsm_output[1])
      & (~ modulo_add_22_acc_1_itm_32_1);
  assign modulo_sub_22_mux_itm_mx0c1 = and_dcpl_413 & and_dcpl_259 & (fsm_output[1])
      & (~ (z_out_8[31]));
  assign and_79_nl = and_dcpl_76 & and_dcpl_34;
  assign and_81_nl = and_dcpl_76 & and_dcpl_78;
  assign and_83_nl = and_dcpl_76 & and_dcpl_80;
  assign and_85_nl = and_dcpl_76 & and_dcpl_82;
  assign and_87_nl = and_dcpl_76 & and_dcpl_84;
  assign and_88_nl = and_dcpl_76 & and_dcpl_66;
  assign and_92_nl = and_dcpl_89 & and_dcpl_88;
  assign and_94_nl = and_dcpl_89 & and_dcpl_91;
  assign butterFly_10_f1_or_1_nl = and_dcpl_94 | and_dcpl_95;
  assign and_99_nl = and_dcpl_96 & and_dcpl_71;
  assign and_100_nl = and_dcpl_96 & and_dcpl_34;
  assign and_101_nl = and_dcpl_96 & and_dcpl_78;
  assign and_102_nl = and_dcpl_96 & and_dcpl_80;
  assign and_103_nl = and_dcpl_96 & and_dcpl_82;
  assign and_104_nl = and_dcpl_96 & and_dcpl_84;
  assign and_105_nl = and_dcpl_96 & and_dcpl_66;
  assign and_108_nl = and_dcpl_105 & and_dcpl_104;
  assign and_111_nl = and_dcpl_108 & and_dcpl_104;
  assign and_112_nl = and_dcpl_108 & and_dcpl_71;
  assign and_113_nl = and_dcpl_108 & and_dcpl_34;
  assign and_114_nl = and_dcpl_108 & and_dcpl_78;
  assign and_115_nl = and_dcpl_108 & and_dcpl_80;
  assign and_116_nl = and_dcpl_108 & and_dcpl_82;
  assign and_117_nl = and_dcpl_108 & and_dcpl_84;
  assign and_118_nl = and_dcpl_108 & and_dcpl_66;
  assign xx_rsci_d_d = MUX1HOT_v_32_26_2(butterFly_10_f1_sva, modulo_add_7_mux_itm,
      modulo_add_5_mux_itm, modulo_add_4_mux_itm, modulo_sub_4_mux_itm, modulo_sub_5_mux_itm,
      modulo_add_6_mux_itm, modulo_sub_6_mux_itm, modulo_sub_7_mux_itm, reg_mult_3_res_lpi_4_dfm_cse_1,
      modulo_add_15_mux_itm, modulo_add_13_mux_itm, modulo_add_12_mux_itm, modulo_sub_12_mux_itm,
      modulo_sub_13_mux_itm, modulo_add_14_mux_itm, modulo_sub_14_mux_itm, modulo_sub_15_mux_itm,
      modulo_add_23_mux_itm, modulo_add_21_mux_itm, modulo_add_20_mux_itm, modulo_sub_20_mux_itm,
      modulo_sub_21_mux_itm, modulo_add_22_mux_itm, modulo_sub_22_mux_itm, modulo_sub_23_mux_itm,
      {and_dcpl_74 , and_79_nl , and_81_nl , and_83_nl , and_85_nl , and_87_nl ,
      and_88_nl , and_92_nl , and_94_nl , butterFly_10_f1_or_1_nl , and_99_nl , and_100_nl
      , and_101_nl , and_102_nl , and_103_nl , and_104_nl , and_105_nl , and_108_nl
      , and_111_nl , and_112_nl , and_113_nl , and_114_nl , and_115_nl , and_116_nl
      , and_117_nl , and_118_nl});
  assign S2_COPY_LOOP_for_or_7_nl = xx_rsci_radr_d_mx0c0 | xx_rsci_radr_d_mx0c10
      | xx_rsci_radr_d_mx0c1 | xx_rsci_radr_d_mx0c2 | xx_rsci_radr_d_mx0c3 | xx_rsci_radr_d_mx0c4
      | xx_rsci_radr_d_mx0c5 | xx_rsci_radr_d_mx0c6 | xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_mux1h_nl = MUX1HOT_v_5_3_2(S1_OUTER_LOOP_for_acc_cse_sva,
      ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}), S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
      {S2_COPY_LOOP_for_or_7_nl , xx_rsci_radr_d_mx0c8 , and_dcpl_136});
  assign S2_COPY_LOOP_for_or_8_nl = xx_rsci_radr_d_mx0c0 | xx_rsci_radr_d_mx0c1 |
      xx_rsci_radr_d_mx0c2 | xx_rsci_radr_d_mx0c3 | xx_rsci_radr_d_mx0c4 | xx_rsci_radr_d_mx0c5
      | xx_rsci_radr_d_mx0c6 | xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_mux1h_5_nl = MUX1HOT_v_2_4_2(S2_INNER_LOOP1_r_4_2_sva_1_0,
      (S1_OUTER_LOOP_for_acc_cse_sva[4:3]), ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg}), (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:3]),
      {S2_COPY_LOOP_for_or_8_nl , xx_rsci_radr_d_mx0c8 , and_dcpl_136 , xx_rsci_radr_d_mx0c10});
  assign S2_COPY_LOOP_for_mux1h_6_nl = MUX1HOT_v_3_9_2(3'b101, 3'b011, 3'b001, 3'b110,
      3'b100, 3'b010, (S1_OUTER_LOOP_for_acc_cse_sva[2:0]), reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg,
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[2:0]), {xx_rsci_radr_d_mx0c1 , xx_rsci_radr_d_mx0c2
      , xx_rsci_radr_d_mx0c3 , xx_rsci_radr_d_mx0c4 , xx_rsci_radr_d_mx0c5 , xx_rsci_radr_d_mx0c6
      , xx_rsci_radr_d_mx0c8 , and_dcpl_136 , xx_rsci_radr_d_mx0c10});
  assign S2_COPY_LOOP_for_not_nl = ~ xx_rsci_radr_d_mx0c7;
  assign S2_COPY_LOOP_for_and_2_nl = MUX_v_3_2_2(3'b000, S2_COPY_LOOP_for_mux1h_6_nl,
      S2_COPY_LOOP_for_not_nl);
  assign S2_COPY_LOOP_for_or_5_nl = MUX_v_3_2_2(S2_COPY_LOOP_for_and_2_nl, 3'b111,
      xx_rsci_radr_d_mx0c0);
  assign xx_rsci_radr_d = {S2_COPY_LOOP_for_mux1h_nl , S2_COPY_LOOP_for_mux1h_5_nl
      , S2_COPY_LOOP_for_or_5_nl};
  assign S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_2_nl = MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, and_dcpl_95);
  assign S2_COPY_LOOP_for_mux1h_7_nl = MUX1HOT_s_1_3_2((reg_drf_revArr_ptr_smx_9_0_cse[4]),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4]), reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg,
      {and_dcpl_74 , and_dcpl_94 , and_dcpl_95});
  assign S2_COPY_LOOP_for_or_nl = (S2_COPY_LOOP_for_mux1h_7_nl & (~(xx_rsci_wadr_d_mx0c1
      | xx_rsci_wadr_d_mx0c2 | xx_rsci_wadr_d_mx0c3 | xx_rsci_wadr_d_mx0c6))) | xx_rsci_wadr_d_mx0c4
      | xx_rsci_wadr_d_mx0c5 | xx_rsci_wadr_d_mx0c7 | xx_rsci_wadr_d_mx0c8;
  assign S2_COPY_LOOP_for_or_9_nl = xx_rsci_wadr_d_mx0c1 | xx_rsci_wadr_d_mx0c2 |
      xx_rsci_wadr_d_mx0c3 | xx_rsci_wadr_d_mx0c4 | xx_rsci_wadr_d_mx0c5 | xx_rsci_wadr_d_mx0c6
      | xx_rsci_wadr_d_mx0c7 | xx_rsci_wadr_d_mx0c8;
  assign S2_COPY_LOOP_for_mux1h_8_nl = MUX1HOT_v_2_4_2((reg_drf_revArr_ptr_smx_9_0_cse[3:2]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[3:2]), ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])}), {and_dcpl_74 , S2_COPY_LOOP_for_or_9_nl
      , and_dcpl_94 , and_dcpl_95});
  assign S2_COPY_LOOP_for_or_2_nl = xx_rsci_wadr_d_mx0c2 | xx_rsci_wadr_d_mx0c5;
  assign S2_COPY_LOOP_for_or_3_nl = xx_rsci_wadr_d_mx0c6 | xx_rsci_wadr_d_mx0c7;
  assign S2_COPY_LOOP_for_mux1h_9_nl = MUX1HOT_v_2_5_2((reg_drf_revArr_ptr_smx_9_0_cse[1:0]),
      2'b01, 2'b10, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]), (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1:0]),
      {and_dcpl_74 , S2_COPY_LOOP_for_or_2_nl , S2_COPY_LOOP_for_or_3_nl , and_dcpl_94
      , and_dcpl_95});
  assign S2_COPY_LOOP_for_nor_1_nl = ~(xx_rsci_wadr_d_mx0c3 | xx_rsci_wadr_d_mx0c4);
  assign S2_COPY_LOOP_for_and_1_nl = MUX_v_2_2_2(2'b00, S2_COPY_LOOP_for_mux1h_9_nl,
      S2_COPY_LOOP_for_nor_1_nl);
  assign S2_COPY_LOOP_for_or_4_nl = xx_rsci_wadr_d_mx0c1 | xx_rsci_wadr_d_mx0c8;
  assign S2_COPY_LOOP_for_or_1_nl = MUX_v_2_2_2(S2_COPY_LOOP_for_and_1_nl, 2'b11,
      S2_COPY_LOOP_for_or_4_nl);
  assign xx_rsci_wadr_d = {S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_2_nl , S2_COPY_LOOP_for_or_nl
      , S2_COPY_LOOP_for_mux1h_8_nl , S2_COPY_LOOP_for_or_1_nl};
  assign and_475_nl = (fsm_output[6:5]==2'b11) & (~((~((fsm_output[2:0]!=3'b000)))
      | (fsm_output[7])));
  assign nor_163_nl = ~((fsm_output[6]) | (~ (fsm_output[5])) | (fsm_output[1]) |
      (fsm_output[2]) | (fsm_output[7]));
  assign mux_161_nl = MUX_s_1_2_2(and_475_nl, nor_163_nl, fsm_output[4]);
  assign nor_165_nl = ~((~((fsm_output[2:0]!=3'b001))) | (fsm_output[7]));
  assign or_173_nl = (~((fsm_output[2:1]!=2'b00))) | (fsm_output[7]);
  assign mux_159_nl = MUX_s_1_2_2(nor_165_nl, or_173_nl, fsm_output[5]);
  assign or_171_nl = (~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[7]);
  assign or_170_nl = (fsm_output[0]) | (fsm_output[1]) | (fsm_output[2]) | (fsm_output[7]);
  assign mux_158_nl = MUX_s_1_2_2(or_171_nl, or_170_nl, fsm_output[5]);
  assign mux_160_nl = MUX_s_1_2_2(mux_159_nl, mux_158_nl, fsm_output[6]);
  assign nor_164_nl = ~((fsm_output[4]) | mux_160_nl);
  assign xx_rsci_we_d_pff = MUX_s_1_2_2(mux_161_nl, nor_164_nl, fsm_output[3]);
  assign and_474_nl = or_648_cse & (fsm_output[2]);
  assign mux_166_nl = MUX_s_1_2_2(or_tmp_173, or_124_cse, and_474_nl);
  assign nand_65_nl = ~((fsm_output[4:3]==2'b11));
  assign mux_165_nl = MUX_s_1_2_2(nand_65_nl, or_tmp_173, fsm_output[2]);
  assign mux_167_nl = MUX_s_1_2_2(mux_166_nl, mux_165_nl, fsm_output[5]);
  assign or_185_nl = (fsm_output[4:0]!=5'b10010);
  assign mux_163_nl = MUX_s_1_2_2(or_tmp_173, or_124_cse, fsm_output[2]);
  assign mux_164_nl = MUX_s_1_2_2(or_185_nl, mux_163_nl, fsm_output[5]);
  assign mux_168_nl = MUX_s_1_2_2(mux_167_nl, mux_164_nl, fsm_output[6]);
  assign or_181_nl = (fsm_output[6:1]!=6'b001001);
  assign mux_169_nl = MUX_s_1_2_2(mux_168_nl, or_181_nl, fsm_output[7]);
  assign xx_rsci_readA_r_ram_ir_internal_RMASK_B_d = ~ mux_169_nl;
  assign mux_187_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[4]);
  assign nor_155_nl = ~((fsm_output[0]) | (~((fsm_output[2]) & mux_187_nl)));
  assign nor_156_nl = ~((~ (fsm_output[0])) | (fsm_output[2]) | (fsm_output[4]) |
      (fsm_output[6]));
  assign mux_188_nl = MUX_s_1_2_2(nor_155_nl, nor_156_nl, fsm_output[1]);
  assign and_150_nl = mux_188_nl & and_dcpl_42 & (~ (fsm_output[3]));
  assign and_152_nl = and_dcpl_26 & and_dcpl_147;
  assign and_154_nl = and_dcpl_26 & and_dcpl_149;
  assign and_155_nl = and_dcpl_73 & and_dcpl_88;
  assign and_156_nl = and_dcpl_73 & and_dcpl_91;
  assign and_157_nl = and_dcpl_73 & and_dcpl_134;
  assign and_158_nl = and_dcpl_73 & and_dcpl_137;
  assign and_159_nl = and_dcpl_73 & and_dcpl_38;
  assign and_161_nl = and_dcpl_73 & and_dcpl_156;
  assign and_162_nl = and_dcpl_76 & and_dcpl_156;
  assign and_163_nl = and_dcpl_76 & and_dcpl_147;
  assign and_164_nl = and_dcpl_76 & and_dcpl_149;
  assign and_165_nl = and_dcpl_68 & and_dcpl_104;
  assign and_166_nl = and_dcpl_68 & and_dcpl_71;
  assign and_167_nl = and_dcpl_68 & and_dcpl_34;
  assign and_168_nl = and_dcpl_68 & and_dcpl_78;
  assign and_169_nl = and_dcpl_68 & and_dcpl_80;
  assign and_170_nl = and_dcpl_96 & and_dcpl_156;
  assign and_171_nl = and_dcpl_96 & and_dcpl_147;
  assign and_172_nl = and_dcpl_96 & and_dcpl_149;
  assign and_173_nl = and_dcpl_105 & and_dcpl_88;
  assign and_174_nl = and_dcpl_105 & and_dcpl_91;
  assign and_175_nl = and_dcpl_105 & and_dcpl_134;
  assign and_176_nl = and_dcpl_105 & and_dcpl_137;
  assign and_177_nl = and_dcpl_105 & and_dcpl_38;
  assign yy_rsci_d_d = MUX1HOT_v_32_25_2(butterFly_10_f1_sva, modulo_add_3_mux_itm,
      modulo_add_1_mux_itm, modulo_add_mux_itm, modulo_sub_mux_itm, modulo_sub_1_mux_itm,
      modulo_add_2_mux_itm, modulo_sub_2_mux_itm, modulo_sub_3_mux_itm, modulo_add_11_mux_itm,
      modulo_add_9_mux_itm, modulo_add_8_mux_itm, modulo_sub_8_mux_itm, modulo_sub_9_mux_itm,
      modulo_add_10_mux_itm, modulo_sub_10_mux_itm, modulo_sub_11_mux_itm, modulo_add_19_mux_itm,
      modulo_add_17_mux_itm, modulo_add_16_mux_itm, modulo_sub_16_mux_itm, modulo_sub_17_mux_itm,
      modulo_add_18_mux_itm, modulo_sub_18_mux_itm, modulo_sub_19_mux_itm, {and_150_nl
      , and_152_nl , and_154_nl , and_155_nl , and_156_nl , and_157_nl , and_158_nl
      , and_159_nl , and_161_nl , and_162_nl , and_163_nl , and_164_nl , and_165_nl
      , and_166_nl , and_167_nl , and_168_nl , and_169_nl , and_170_nl , and_171_nl
      , and_172_nl , and_173_nl , and_174_nl , and_175_nl , and_176_nl , and_177_nl});
  assign S1_OUTER_LOOP_for_or_9_nl = yy_rsci_radr_d_mx0c1 | and_dcpl_180 | yy_rsci_radr_d_mx0c2
      | yy_rsci_radr_d_mx0c3 | (~ mux_196_itm) | (~ mux_198_itm) | yy_rsci_radr_d_mx0c6
      | and_dcpl_179 | (~ mux_200_itm);
  assign S1_OUTER_LOOP_for_mux1h_nl = MUX1HOT_v_5_3_2(({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}),
      S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0, {yy_rsci_radr_d_mx0c0
      , S1_OUTER_LOOP_for_or_9_nl , and_dcpl_69});
  assign S1_OUTER_LOOP_for_or_10_nl = yy_rsci_radr_d_mx0c1 | yy_rsci_radr_d_mx0c2
      | yy_rsci_radr_d_mx0c3 | (~ mux_196_itm) | (~ mux_198_itm) | yy_rsci_radr_d_mx0c6
      | and_dcpl_179 | (~ mux_200_itm);
  assign S1_OUTER_LOOP_for_mux1h_6_nl = MUX1HOT_v_2_4_2((S1_OUTER_LOOP_for_acc_cse_sva[4:3]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg}),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:3]), {yy_rsci_radr_d_mx0c0 , S1_OUTER_LOOP_for_or_10_nl
      , and_dcpl_69 , and_dcpl_180});
  assign S1_OUTER_LOOP_for_mux1h_7_nl = MUX1HOT_v_3_9_2((S1_OUTER_LOOP_for_acc_cse_sva[2:0]),
      3'b101, 3'b011, 3'b001, 3'b110, 3'b100, 3'b010, reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg,
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[2:0]), {yy_rsci_radr_d_mx0c0 , yy_rsci_radr_d_mx0c2
      , yy_rsci_radr_d_mx0c3 , (~ mux_196_itm) , (~ mux_198_itm) , yy_rsci_radr_d_mx0c6
      , and_dcpl_179 , and_dcpl_69 , and_dcpl_180});
  assign S1_OUTER_LOOP_for_and_3_nl = MUX_v_3_2_2(3'b000, S1_OUTER_LOOP_for_mux1h_7_nl,
      mux_200_itm);
  assign S1_OUTER_LOOP_for_or_6_nl = MUX_v_3_2_2(S1_OUTER_LOOP_for_and_3_nl, 3'b111,
      yy_rsci_radr_d_mx0c1);
  assign yy_rsci_radr_d = {S1_OUTER_LOOP_for_mux1h_nl , S1_OUTER_LOOP_for_mux1h_6_nl
      , S1_OUTER_LOOP_for_or_6_nl};
  assign S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl = MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, yy_rsci_wadr_d_mx0c1);
  assign S1_OUTER_LOOP_for_mux1h_8_nl = MUX1HOT_s_1_3_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4]),
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg, (reg_drf_revArr_ptr_smx_9_0_cse[4]), {yy_rsci_wadr_d_mx0c0
      , yy_rsci_wadr_d_mx0c1 , yy_rsci_wadr_d_mx0c10});
  assign S1_OUTER_LOOP_for_or_1_nl = (S1_OUTER_LOOP_for_mux1h_8_nl & (~(yy_rsci_wadr_d_mx0c2
      | yy_rsci_wadr_d_mx0c3 | yy_rsci_wadr_d_mx0c4 | yy_rsci_wadr_d_mx0c7))) | yy_rsci_wadr_d_mx0c5
      | yy_rsci_wadr_d_mx0c6 | yy_rsci_wadr_d_mx0c8 | yy_rsci_wadr_d_mx0c9;
  assign S1_OUTER_LOOP_for_or_8_nl = yy_rsci_wadr_d_mx0c2 | yy_rsci_wadr_d_mx0c3
      | yy_rsci_wadr_d_mx0c4 | yy_rsci_wadr_d_mx0c5 | yy_rsci_wadr_d_mx0c6 | yy_rsci_wadr_d_mx0c7
      | yy_rsci_wadr_d_mx0c8 | yy_rsci_wadr_d_mx0c9;
  assign S1_OUTER_LOOP_for_mux1h_9_nl = MUX1HOT_v_2_4_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[3:2]),
      ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[2])}),
      S2_INNER_LOOP1_r_4_2_sva_1_0, (reg_drf_revArr_ptr_smx_9_0_cse[3:2]), {yy_rsci_wadr_d_mx0c0
      , yy_rsci_wadr_d_mx0c1 , S1_OUTER_LOOP_for_or_8_nl , yy_rsci_wadr_d_mx0c10});
  assign S1_OUTER_LOOP_for_or_3_nl = yy_rsci_wadr_d_mx0c3 | yy_rsci_wadr_d_mx0c6;
  assign S1_OUTER_LOOP_for_or_4_nl = yy_rsci_wadr_d_mx0c7 | yy_rsci_wadr_d_mx0c8;
  assign S1_OUTER_LOOP_for_mux1h_10_nl = MUX1HOT_v_2_5_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]),
      (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1:0]), 2'b01, 2'b10, (reg_drf_revArr_ptr_smx_9_0_cse[1:0]),
      {yy_rsci_wadr_d_mx0c0 , yy_rsci_wadr_d_mx0c1 , S1_OUTER_LOOP_for_or_3_nl ,
      S1_OUTER_LOOP_for_or_4_nl , yy_rsci_wadr_d_mx0c10});
  assign S1_OUTER_LOOP_for_nor_1_nl = ~(yy_rsci_wadr_d_mx0c4 | yy_rsci_wadr_d_mx0c5);
  assign S1_OUTER_LOOP_for_and_2_nl = MUX_v_2_2_2(2'b00, S1_OUTER_LOOP_for_mux1h_10_nl,
      S1_OUTER_LOOP_for_nor_1_nl);
  assign S1_OUTER_LOOP_for_or_5_nl = yy_rsci_wadr_d_mx0c2 | yy_rsci_wadr_d_mx0c9;
  assign S1_OUTER_LOOP_for_or_2_nl = MUX_v_2_2_2(S1_OUTER_LOOP_for_and_2_nl, 2'b11,
      S1_OUTER_LOOP_for_or_5_nl);
  assign yy_rsci_wadr_d = {S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl , S1_OUTER_LOOP_for_or_1_nl
      , S1_OUTER_LOOP_for_mux1h_9_nl , S1_OUTER_LOOP_for_or_2_nl};
  assign or_229_nl = (~ (fsm_output[6])) | (fsm_output[4]);
  assign mux_213_nl = MUX_s_1_2_2(or_229_nl, or_858_cse, fsm_output[3]);
  assign mux_212_nl = MUX_s_1_2_2((fsm_output[4]), or_858_cse, fsm_output[3]);
  assign mux_214_nl = MUX_s_1_2_2(mux_213_nl, mux_212_nl, and_455_cse);
  assign mux_209_nl = MUX_s_1_2_2((~ or_858_cse), or_858_cse, fsm_output[3]);
  assign or_228_nl = (~ (fsm_output[3])) | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_210_nl = MUX_s_1_2_2(mux_209_nl, or_228_nl, fsm_output[0]);
  assign or_226_nl = (fsm_output[3]) | (fsm_output[6]) | (~ (fsm_output[4]));
  assign mux_211_nl = MUX_s_1_2_2(mux_210_nl, or_226_nl, fsm_output[1]);
  assign mux_215_nl = MUX_s_1_2_2(mux_214_nl, mux_211_nl, fsm_output[2]);
  assign mux_206_nl = MUX_s_1_2_2(nand_cse, or_858_cse, fsm_output[3]);
  assign mux_207_nl = MUX_s_1_2_2(not_tmp_59, mux_206_nl, or_648_cse);
  assign mux_208_nl = MUX_s_1_2_2(not_tmp_59, mux_207_nl, fsm_output[2]);
  assign mux_216_nl = MUX_s_1_2_2(mux_215_nl, mux_208_nl, fsm_output[5]);
  assign yy_rsci_we_d_pff = ~(mux_216_nl | (fsm_output[7]));
  assign nor_146_nl = ~((fsm_output[6]) | (fsm_output[4]));
  assign mux_221_nl = MUX_s_1_2_2((fsm_output[6]), nor_146_nl, fsm_output[5]);
  assign nand_8_nl = ~((fsm_output[3]) & mux_221_nl);
  assign mux_222_nl = MUX_s_1_2_2(nand_8_nl, or_tmp_222, fsm_output[7]);
  assign mux_223_nl = MUX_s_1_2_2(mux_222_nl, mux_tmp_219, or_235_cse);
  assign nor_147_nl = ~(and_465_cse | (fsm_output[4]));
  assign mux_217_nl = MUX_s_1_2_2(nor_147_nl, nor_tmp_34, fsm_output[3]);
  assign or_231_nl = (fsm_output[7]) | (~ mux_217_nl);
  assign and_466_nl = (fsm_output[2:1]==2'b11);
  assign mux_220_nl = MUX_s_1_2_2(mux_tmp_219, or_231_nl, and_466_nl);
  assign mux_224_nl = MUX_s_1_2_2(mux_223_nl, mux_220_nl, fsm_output[0]);
  assign yy_rsci_readA_r_ram_ir_internal_RMASK_B_d = ~ mux_224_nl;
  assign and_818_nl = (fsm_output[5]) & (fsm_output[3]) & (fsm_output[1]) & (~ (fsm_output[7]));
  assign nor_310_nl = ~((fsm_output[5]) | (fsm_output[3]) | (~ (fsm_output[1])) |
      (fsm_output[7]));
  assign mux_551_nl = MUX_s_1_2_2(and_818_nl, nor_310_nl, fsm_output[2]);
  assign and_819_nl = (fsm_output[2]) & (fsm_output[5]) & (fsm_output[3]) & (fsm_output[1])
      & (~ (fsm_output[7]));
  assign mux_552_nl = MUX_s_1_2_2(mux_551_nl, and_819_nl, fsm_output[4]);
  assign and_817_nl = (fsm_output[6]) & mux_552_nl;
  assign nor_311_nl = ~((fsm_output[3]) | (fsm_output[1]) | (~ (fsm_output[7])));
  assign nor_312_nl = ~((fsm_output[3]) | (~ (fsm_output[1])) | (fsm_output[7]));
  assign mux_549_nl = MUX_s_1_2_2(nor_311_nl, nor_312_nl, fsm_output[5]);
  assign mux_550_nl = MUX_s_1_2_2(mux_549_nl, nor_77_cse, fsm_output[2]);
  assign and_820_nl = nor_37_cse & mux_550_nl;
  assign not_tmp_353 = MUX_s_1_2_2(and_817_nl, and_820_nl, fsm_output[0]);
  assign or_tmp_606 = (~ (fsm_output[1])) | (~ (fsm_output[5])) | (fsm_output[7])
      | (fsm_output[0]) | (fsm_output[3]);
  assign not_tmp_362 = ~((fsm_output[0]) & (fsm_output[3]));
  assign or_707_nl = (fsm_output[7]) | (~ (fsm_output[1])) | (fsm_output[0]) | (~
      (fsm_output[3]));
  assign or_705_nl = (fsm_output[7]) | (fsm_output[1]) | (~ (fsm_output[0])) | (fsm_output[3]);
  assign mux_tmp_562 = MUX_s_1_2_2(or_707_nl, or_705_nl, fsm_output[6]);
  assign not_tmp_369 = ~((fsm_output[4]) & (fsm_output[0]) & (fsm_output[6]));
  assign or_tmp_634 = (fsm_output[7]) | (~ (fsm_output[1]));
  assign nor_291_cse = ~((fsm_output[7:6]!=2'b00));
  assign and_570_cse = (fsm_output[6]) & (~ (fsm_output[7])) & (fsm_output[5]) &
      (~ (fsm_output[3]));
  assign and_594_cse = (~ (fsm_output[5])) & (fsm_output[3]);
  assign and_dcpl_583 = nor_291_cse & (fsm_output[5]) & (fsm_output[3]);
  assign and_dcpl_703 = and_dcpl_9 & (fsm_output[6]) & (~ (fsm_output[3]));
  assign nor_334_nl = ~((fsm_output[1]) | (fsm_output[3]) | (fsm_output[6]));
  assign and_785_nl = (fsm_output[1]) & (fsm_output[3]) & (fsm_output[6]);
  assign mux_535_nl = MUX_s_1_2_2(nor_334_nl, and_785_nl, fsm_output[0]);
  assign and_509_ssc = mux_535_nl & (~ (fsm_output[7])) & (fsm_output[5]) & and_dcpl_23;
  assign or_tmp_696 = (~((fsm_output[4]) | (~ (fsm_output[6])))) | (fsm_output[7]);
  assign or_tmp_697 = (~ (fsm_output[4])) | (fsm_output[7]);
  assign or_tmp_699 = (~ (fsm_output[4])) | (fsm_output[6]) | (fsm_output[7]);
  assign mux_tmp_627 = MUX_s_1_2_2((~ (fsm_output[6])), or_tmp_12, and_455_cse);
  assign or_tmp_725 = (~ (fsm_output[5])) | (~ (fsm_output[4])) | (fsm_output[7]);
  assign or_tmp_726 = (fsm_output[5]) | (fsm_output[4]) | (fsm_output[7]);
  assign not_tmp_509 = MUX_s_1_2_2((fsm_output[7]), (~ (fsm_output[7])), fsm_output[4]);
  assign or_tmp_732 = (fsm_output[5]) | not_tmp_509;
  assign or_tmp_735 = (fsm_output[2]) | (fsm_output[3]) | (fsm_output[5]) | (fsm_output[7]);
  always @(posedge clk) begin
    if ( core_wen & mux_53_nl ) begin
      m_sva <= m_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( core_wen ) begin
      x_rsci_s_raddr_core_4_0 <= MUX_v_5_2_2(({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
          , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}),
          S2_COPY_LOOP_for_i_5_0_sva_1_4_0, and_dcpl_35);
      x_rsci_s_raddr_core_9_5 <= MUX_v_5_2_2(S2_COPY_LOOP_for_i_5_0_sva_1_4_0, S1_OUTER_LOOP_for_acc_cse_sva,
          and_dcpl_35);
      x_rsci_s_waddr_core_4_0 <= MUX_v_5_2_2(S2_COPY_LOOP_for_i_5_0_sva_1_4_0, ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
          , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}),
          and_dcpl_41);
      x_rsci_s_waddr_core_9_5 <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
          and_dcpl_41);
      x_rsci_s_dout_core <= xx_rsci_q_d;
      reg_twiddle_rsci_s_raddr_core_1_cse <= ~((~((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[1])
          & (~ mux_89_nl))) & mux_94_nl);
      reg_twiddle_rsci_s_raddr_core_2_cse <= MUX1HOT_s_1_4_2((butterFly_tw_and_cse_3_2_sva_1[0]),
          butterFly_12_tw_and_cse_3_2_sva_0, butterFly_4_tw_and_cse_2_sva_mx0w2,
          (S2_INNER_LOOP1_r_4_2_sva_1_0[0]), {and_dcpl_53 , butterFly_tw_h_or_nl
          , and_49_nl , (~ mux_103_itm)});
      reg_twiddle_rsci_s_raddr_core_0_cse <= ~((~((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg[0])
          & (~ mux_110_nl))) & mux_113_nl);
      reg_twiddle_rsci_s_raddr_core_3_cse <= MUX1HOT_s_1_4_2((butterFly_tw_and_cse_3_2_sva_1[1]),
          butterFly_12_tw_and_cse_3_2_sva_1, (S2_INNER_LOOP1_r_4_2_sva_1_0[1]), (S2_INNER_LOOP1_r_4_2_sva_1_0[1]),
          {and_dcpl_53 , and_dcpl_54 , and_62_nl , (~ mux_103_itm)});
      revArr_rsci_s_raddr_core <= S1_OUTER_LOOP_for_acc_cse_sva;
      reg_tw_rsci_s_raddr_core_cse <= nl_reg_tw_rsci_s_raddr_core_cse[9:0];
      mult_12_z_mul_cmp_b <= yy_rsci_q_d;
      mult_z_mul_cmp_a <= MUX1HOT_v_32_4_2(xx_rsci_q_d, operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm,
          (mult_t_mul_cmp_z[51:20]), yy_rsci_q_d, {nor_212_nl , (~ mux_266_nl) ,
          mux_275_nl , mux_279_nl});
      mult_z_mul_cmp_b <= MUX_v_32_2_2(m_sva, twiddle_rsci_s_din_mxwt, mux_293_nl);
      reg_drf_revArr_ptr_smx_9_0_cse <= revArr_rsci_s_din_mxwt[4:0];
      reg_mult_3_res_lpi_4_dfm_cse_1 <= MUX_v_32_2_2(z_out_4, z_out_5, z_out_18_32);
      modulo_add_3_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_3_qif_acc_nl, readslicef_33_1_32(modulo_add_3_acc_1_nl));
      reg_mult_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_4, mult_res_sva_1, z_out_18_32);
      modulo_add_1_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_1_qif_acc_nl, readslicef_33_1_32(modulo_add_1_acc_1_nl));
      modulo_add_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_qif_acc_nl, readslicef_33_1_32(modulo_add_acc_1_nl));
      modulo_add_7_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_7_qif_acc_nl, readslicef_33_1_32(modulo_add_7_acc_1_nl));
      modulo_add_5_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_5_qif_acc_nl, readslicef_33_1_32(modulo_add_5_acc_1_nl));
      modulo_add_4_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_4_qif_acc_nl, readslicef_33_1_32(modulo_add_4_acc_1_nl));
      modulo_add_11_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_11_qif_acc_nl, readslicef_33_1_32(modulo_add_11_acc_1_nl));
      modulo_add_9_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_9_qif_acc_nl, readslicef_33_1_32(modulo_add_9_acc_1_nl));
      modulo_add_8_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_8_qif_acc_nl, readslicef_33_1_32(modulo_add_8_acc_1_nl));
      S34_OUTER_LOOP_for_tf_h_sva <= tw_h_rsci_s_din_mxwt;
      modulo_add_15_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_15_qif_acc_nl, readslicef_33_1_32(modulo_add_15_acc_1_nl));
      modulo_add_13_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_13_qif_acc_nl, readslicef_33_1_32(modulo_add_13_acc_1_nl));
      modulo_add_12_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_12_qif_acc_nl, readslicef_33_1_32(modulo_add_12_acc_1_nl));
      modulo_add_19_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_19_qif_acc_nl, readslicef_33_1_32(modulo_add_19_acc_1_nl));
      modulo_add_17_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_17_qif_acc_nl, readslicef_33_1_32(modulo_add_17_acc_1_nl));
      modulo_add_16_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_16_qif_acc_nl, readslicef_33_1_32(modulo_add_16_acc_1_nl));
      modulo_add_23_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_23_qif_acc_nl, readslicef_33_1_32(modulo_add_23_acc_1_nl));
      modulo_add_21_mux_itm <= MUX_v_32_2_2(z_out_12, modulo_add_21_qif_acc_nl, readslicef_33_1_32(modulo_add_21_acc_1_nl));
      modulo_add_20_mux_itm <= MUX_v_32_2_2(z_out_17, modulo_add_20_qif_acc_nl, readslicef_33_1_32(modulo_add_20_acc_1_nl));
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
    end
    else if ( core_wen ) begin
      reg_x_rsci_oswt_cse <= and_dcpl_26 & and_dcpl_23 & ((fsm_output[0]) ^ (fsm_output[1]));
      reg_x_rsci_oswt_1_cse <= mux_71_nl & (fsm_output[7:5]==3'b100) & and_dcpl_28;
      reg_twiddle_rsci_oswt_cse <= MUX_s_1_2_2(mux_77_nl, nor_196_nl, fsm_output[7]);
      reg_revArr_rsci_oswt_cse <= not_tmp_58 & and_dcpl_42 & (~ (fsm_output[3]))
          & (fsm_output[1]);
      reg_tw_rsci_oswt_cse <= and_dcpl_69;
      reg_xx_rsc_cgo_cse <= ~ mux_137_itm;
      reg_yy_rsc_cgo_cse <= mux_186_rmff;
      reg_x_rsc_triosy_obj_iswt0_cse <= and_dcpl_202 & and_dcpl_28 & and_dcpl_200
          & (fsm_output[1]) & (z_out_1[5]);
      reg_ensig_cgo_cse <= ~ mux_233_itm;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~((fsm_output[7:2]!=6'b010010) | or_648_cse)) ) begin
      mult_12_z_mul_cmp_a <= tw_rsci_s_din_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_626_nl) & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg <= (z_out_1[4]) & S2_COPY_LOOP_p_nand_seb;
    end
  end
  always @(posedge clk) begin
    if ( mux_638_nl & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg <= S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl
          & S2_COPY_LOOP_p_nand_seb;
    end
  end
  always @(posedge clk) begin
    if ( mux_646_nl & core_wen ) begin
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg <= MUX_v_3_2_2(3'b000, S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl,
          S2_COPY_LOOP_p_nand_seb);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_5 <= 1'b0;
    end
    else if ( (~ mux_663_nl) & core_wen ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_5 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt[5];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= 5'b00000;
    end
    else if ( (~ mux_674_nl) & core_wen ) begin
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt[4:0];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (and_dcpl_213 | S1_OUTER_LOOP_for_p_sva_1_mx0c1) ) begin
      S1_OUTER_LOOP_for_p_sva_1 <= MUX_v_20_2_2(z_out_2, ({5'b00000 , S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl}),
          S1_OUTER_LOOP_for_p_sva_1_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 | (~ mux_388_itm) | S1_OUTER_LOOP_for_acc_cse_sva_mx0c2
        | S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 | and_dcpl_136) ) begin
      S1_OUTER_LOOP_for_acc_cse_sva <= MUX_v_5_2_2(5'b00000, S1_OUTER_LOOP_for_mux1h_4_nl,
          mux_388_itm);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      S2_OUTER_LOOP_c_1_sva <= 1'b0;
    end
    else if ( core_wen & (and_dcpl_213 | S2_OUTER_LOOP_c_1_sva_mx0c1 | S2_OUTER_LOOP_c_1_sva_mx0c2
        | S2_OUTER_LOOP_c_1_sva_mx0c3) ) begin
      S2_OUTER_LOOP_c_1_sva <= operator_20_true_1_mux_nl & (~ S2_OUTER_LOOP_c_1_sva_mx0c1);
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
    if ( core_wen & ((mux_439_nl & (~ (fsm_output[7])) & (fsm_output[1])) | S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1
        | S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2) ) begin
      S2_INNER_LOOP1_r_4_2_sva_1_0 <= MUX_v_2_2_2(2'b00, S2_INNER_LOOP1_r_mux_nl,
          S2_INNER_LOOP1_r_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( mux_679_nl & (~ (fsm_output[7])) & core_wen ) begin
      butterFly_12_tw_and_cse_3_2_sva_1 <= butterFly_tw_butterFly_tw_mux_rgt[1];
    end
  end
  always @(posedge clk) begin
    if ( mux_682_nl & (~((fsm_output[1]) | (fsm_output[7]))) & core_wen ) begin
      butterFly_12_tw_and_cse_3_2_sva_0 <= butterFly_tw_butterFly_tw_mux_rgt[0];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & mux_477_nl ) begin
      mult_16_z_asn_itm <= mult_z_mul_cmp_z_oreg;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (mux_482_nl | mult_11_z_asn_itm_mx0c1) ) begin
      mult_11_z_asn_itm <= MUX_v_32_2_2(mult_z_mul_cmp_z_oreg, mult_12_z_mul_cmp_z_oreg,
          mult_11_z_asn_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~ mux_495_nl) ) begin
      operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm <= mult_t_mul_cmp_z[51:20];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (((~ mux_497_nl) & and_dcpl_125) | and_dcpl_179) ) begin
      butterFly_14_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_179);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (mux_508_nl | mult_10_z_asn_itm_mx0c1) ) begin
      mult_10_z_asn_itm <= MUX_v_32_2_2(mult_z_mul_cmp_z_oreg, mult_12_z_mul_cmp_z_oreg,
          mult_10_z_asn_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~((~((~ mux_516_nl) & and_dcpl_125)) & mux_200_itm)) ) begin
      butterFly_11_f1_sva <= MUX_v_32_2_2(yy_rsci_q_d, xx_rsci_q_d, mux_200_itm);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & mux_527_nl ) begin
      mult_17_z_asn_itm <= mult_z_mul_cmp_z_oreg;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_241 & and_490_cse & (~ (fsm_output[1])) & (z_out_8[31]))
        | modulo_sub_3_mux_itm_mx0c1) ) begin
      modulo_sub_3_mux_itm <= MUX_v_32_2_2(z_out_6, ({1'b0 , (z_out_8[30:0])}), modulo_sub_3_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_241 & and_dcpl_200 & (fsm_output[1]) & (z_out_14[31]))
        | modulo_sub_1_mux_itm_mx0c1) ) begin
      modulo_sub_1_mux_itm <= MUX_v_32_2_2(modulo_sub_1_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_1_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_241 & and_490_cse & (fsm_output[1]) & (z_out_8[31]))
        | modulo_sub_mux_itm_mx0c1) ) begin
      modulo_sub_mux_itm <= MUX_v_32_2_2(acc_6_cse_32_1, ({1'b0 , (z_out_8[30:0])}),
          modulo_sub_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_262 & and_dcpl_259 & (~ (fsm_output[1])) & modulo_add_2_acc_1_itm_32_1)
        | modulo_add_2_mux_itm_mx0c1) ) begin
      modulo_add_2_mux_itm <= MUX_v_32_2_2(modulo_add_2_qif_acc_nl, z_out_12, modulo_add_2_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_262 & and_dcpl_259 & (~ (fsm_output[1])) & (z_out_10[31]))
        | modulo_sub_2_mux_itm_mx0c1) ) begin
      modulo_sub_2_mux_itm <= MUX_v_32_2_2(z_out_9, ({1'b0 , (z_out_10[30:0])}),
          modulo_sub_2_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_280 & and_dcpl_276 & (~ (fsm_output[1])) & (z_out_14[31]))
        | modulo_sub_7_mux_itm_mx0c1) ) begin
      modulo_sub_7_mux_itm <= MUX_v_32_2_2(modulo_sub_7_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_7_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_280 & and_dcpl_259 & (fsm_output[1]) & (z_out_10[31]))
        | modulo_sub_5_mux_itm_mx0c1) ) begin
      modulo_sub_5_mux_itm <= MUX_v_32_2_2(z_out_6, ({1'b0 , (z_out_10[30:0])}),
          modulo_sub_5_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_280 & and_dcpl_276 & (fsm_output[1]) & (z_out_14[31]))
        | modulo_sub_4_mux_itm_mx0c1) ) begin
      modulo_sub_4_mux_itm <= MUX_v_32_2_2(modulo_sub_4_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_4_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_280 & and_dcpl_200 & (~ (fsm_output[1])) & modulo_add_6_acc_1_itm_32_1)
        | modulo_add_6_mux_itm_mx0c1) ) begin
      modulo_add_6_mux_itm <= MUX_v_32_2_2(modulo_add_6_qif_acc_nl, z_out_12, modulo_add_6_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_280 & and_dcpl_200 & (~ (fsm_output[1])) & (z_out_8[31]))
        | modulo_sub_6_mux_itm_mx0c1) ) begin
      modulo_sub_6_mux_itm <= MUX_v_32_2_2(z_out_9, ({1'b0 , (z_out_8[30:0])}), modulo_sub_6_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_311 & and_dcpl_200 & (~ (fsm_output[1])) & (z_out_10[31]))
        | modulo_sub_11_mux_itm_mx0c1) ) begin
      modulo_sub_11_mux_itm <= MUX_v_32_2_2(z_out_11, ({1'b0 , (z_out_10[30:0])}),
          modulo_sub_11_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_311 & and_490_cse & (~ (fsm_output[1])) & (z_out_8[31]))
        | modulo_sub_9_mux_itm_mx0c1) ) begin
      modulo_sub_9_mux_itm <= MUX_v_32_2_2(z_out_11, ({1'b0 , (z_out_8[30:0])}),
          modulo_sub_9_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_311 & and_dcpl_200 & (fsm_output[1]) & (z_out_10[31]))
        | modulo_sub_8_mux_itm_mx0c1) ) begin
      modulo_sub_8_mux_itm <= MUX_v_32_2_2(acc_12_cse_32_1, ({1'b0 , (z_out_10[30:0])}),
          modulo_sub_8_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_311 & and_490_cse & (fsm_output[1]) & modulo_add_10_acc_1_itm_32_1)
        | modulo_add_10_mux_itm_mx0c1) ) begin
      modulo_add_10_mux_itm <= MUX_v_32_2_2(modulo_add_10_qif_acc_nl, z_out_17, modulo_add_10_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_311 & and_490_cse & (fsm_output[1]) & (z_out_14[31]))
        | modulo_sub_10_mux_itm_mx0c1) ) begin
      modulo_sub_10_mux_itm <= MUX_v_32_2_2(modulo_sub_10_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_10_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_344 & and_dcpl_259 & (~ (fsm_output[1])) & (z_out_14[31]))
        | modulo_sub_15_mux_itm_mx0c1) ) begin
      modulo_sub_15_mux_itm <= MUX_v_32_2_2(modulo_sub_15_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_15_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_344 & and_dcpl_276 & (~ (fsm_output[1])) & (z_out_10[31]))
        | modulo_sub_13_mux_itm_mx0c1) ) begin
      modulo_sub_13_mux_itm <= MUX_v_32_2_2(acc_12_cse_32_1, ({1'b0 , (z_out_10[30:0])}),
          modulo_sub_13_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_344 & and_dcpl_259 & (fsm_output[1]) & (z_out_14[31]))
        | modulo_sub_12_mux_itm_mx0c1) ) begin
      modulo_sub_12_mux_itm <= MUX_v_32_2_2(modulo_sub_12_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_12_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_344 & and_dcpl_276 & (fsm_output[1]) & modulo_add_14_acc_1_itm_32_1)
        | modulo_add_14_mux_itm_mx0c1) ) begin
      modulo_add_14_mux_itm <= MUX_v_32_2_2(modulo_add_14_qif_acc_nl, z_out_12, modulo_add_14_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_344 & and_dcpl_276 & (fsm_output[1]) & (z_out_8[31]))
        | modulo_sub_14_mux_itm_mx0c1) ) begin
      modulo_sub_14_mux_itm <= MUX_v_32_2_2(acc_6_cse_32_1, ({1'b0 , (z_out_8[30:0])}),
          modulo_sub_14_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_375 & and_dcpl_200 & (~ (fsm_output[1])) & (z_out_14[31]))
        | modulo_sub_19_mux_itm_mx0c1) ) begin
      modulo_sub_19_mux_itm <= MUX_v_32_2_2(modulo_sub_19_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_19_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_375 & and_490_cse & (~ (fsm_output[1])) & (z_out_10[31]))
        | modulo_sub_17_mux_itm_mx0c1) ) begin
      modulo_sub_17_mux_itm <= MUX_v_32_2_2(acc_12_cse_32_1, ({1'b0 , (z_out_10[30:0])}),
          modulo_sub_17_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_375 & and_dcpl_200 & (fsm_output[1]) & (z_out_14[31]))
        | modulo_sub_16_mux_itm_mx0c1) ) begin
      modulo_sub_16_mux_itm <= MUX_v_32_2_2(modulo_sub_16_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_16_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_375 & and_490_cse & (fsm_output[1]) & modulo_add_18_acc_1_itm_32_1)
        | modulo_add_18_mux_itm_mx0c1) ) begin
      modulo_add_18_mux_itm <= MUX_v_32_2_2(modulo_add_18_qif_acc_nl, z_out_12, modulo_add_18_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_375 & and_490_cse & (fsm_output[1]) & (z_out_8[31]))
        | modulo_sub_18_mux_itm_mx0c1) ) begin
      modulo_sub_18_mux_itm <= MUX_v_32_2_2(acc_6_cse_32_1, ({1'b0 , (z_out_8[30:0])}),
          modulo_sub_18_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_406 & and_490_cse & (fsm_output[1]) & (z_out_14[31]))
        | modulo_sub_23_mux_itm_mx0c1) ) begin
      modulo_sub_23_mux_itm <= MUX_v_32_2_2(modulo_sub_23_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_23_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_413 & and_dcpl_259 & (~ (fsm_output[1])) & (z_out_10[31]))
        | modulo_sub_21_mux_itm_mx0c1) ) begin
      modulo_sub_21_mux_itm <= MUX_v_32_2_2(acc_12_cse_32_1, ({1'b0 , (z_out_10[30:0])}),
          modulo_sub_21_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_413 & and_dcpl_276 & (~ (fsm_output[1])) & (z_out_14[31]))
        | modulo_sub_20_mux_itm_mx0c1) ) begin
      modulo_sub_20_mux_itm <= MUX_v_32_2_2(modulo_sub_20_qif_acc_nl, ({1'b0 , (z_out_14[30:0])}),
          modulo_sub_20_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_413 & and_dcpl_259 & (fsm_output[1]) & modulo_add_22_acc_1_itm_32_1)
        | modulo_add_22_mux_itm_mx0c1) ) begin
      modulo_add_22_mux_itm <= MUX_v_32_2_2(modulo_add_22_qif_acc_nl, z_out_12, modulo_add_22_mux_itm_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((and_dcpl_413 & and_dcpl_259 & (fsm_output[1]) & (z_out_8[31]))
        | modulo_sub_22_mux_itm_mx0c1) ) begin
      modulo_sub_22_mux_itm <= MUX_v_32_2_2(acc_6_cse_32_1, ({1'b0 , (z_out_8[30:0])}),
          modulo_sub_22_mux_itm_mx0c1);
    end
  end
  assign mux_48_nl = MUX_s_1_2_2((~ or_188_cse), or_188_cse, fsm_output[7]);
  assign mux_49_nl = MUX_s_1_2_2(mux_48_nl, and_tmp, fsm_output[3]);
  assign mux_47_nl = MUX_s_1_2_2(and_tmp, (fsm_output[7]), fsm_output[3]);
  assign mux_50_nl = MUX_s_1_2_2(mux_49_nl, mux_47_nl, fsm_output[4]);
  assign mux_51_nl = MUX_s_1_2_2(mux_50_nl, mux_tmp_44, fsm_output[2]);
  assign mux_45_nl = MUX_s_1_2_2(and_tmp, (fsm_output[7]), and_492_cse);
  assign mux_46_nl = MUX_s_1_2_2(mux_45_nl, mux_tmp_44, fsm_output[2]);
  assign mux_52_nl = MUX_s_1_2_2(mux_51_nl, mux_46_nl, fsm_output[0]);
  assign mux_53_nl = MUX_s_1_2_2(mux_52_nl, mux_tmp_44, fsm_output[1]);
  assign nor_197_nl = ~((fsm_output[0]) | (~ (fsm_output[2])));
  assign nor_198_nl = ~((~ (fsm_output[0])) | (fsm_output[2]));
  assign mux_71_nl = MUX_s_1_2_2(nor_197_nl, nor_198_nl, fsm_output[1]);
  assign nor_189_nl = ~((fsm_output[5:3]!=3'b010));
  assign nor_190_nl = ~((fsm_output[5:3]!=3'b100));
  assign mux_75_nl = MUX_s_1_2_2(nor_189_nl, nor_190_nl, or_648_cse);
  assign nor_191_nl = ~((fsm_output[5]) | (~ (fsm_output[3])));
  assign or_59_nl = nor_107_cse | (fsm_output[4]);
  assign mux_74_nl = MUX_s_1_2_2(nor_191_nl, nor_192_cse, or_59_nl);
  assign mux_76_nl = MUX_s_1_2_2(mux_75_nl, mux_74_nl, fsm_output[2]);
  assign nor_194_nl = ~((fsm_output[5:3]!=3'b011));
  assign nor_195_nl = ~((fsm_output[4]) | (~ nor_tmp_10));
  assign mux_72_nl = MUX_s_1_2_2(nor_195_nl, nor_tmp_10, and_455_cse);
  assign mux_73_nl = MUX_s_1_2_2(nor_194_nl, mux_72_nl, fsm_output[2]);
  assign mux_77_nl = MUX_s_1_2_2(mux_76_nl, mux_73_nl, fsm_output[6]);
  assign nor_196_nl = ~((fsm_output[6]) | (fsm_output[2]) | and_455_cse | (fsm_output[5:3]!=3'b000));
  assign mux_86_nl = MUX_s_1_2_2(or_283_cse, or_79_cse, fsm_output[1]);
  assign mux_87_nl = MUX_s_1_2_2(mux_86_nl, or_tmp_64, fsm_output[0]);
  assign or_81_nl = (fsm_output[4]) | mux_87_nl;
  assign or_78_nl = (~ (fsm_output[1])) | (fsm_output[5]) | (fsm_output[7]) | (~
      (fsm_output[3]));
  assign or_76_nl = (fsm_output[1]) | (fsm_output[5]) | (fsm_output[7]) | (~ (fsm_output[3]));
  assign mux_84_nl = MUX_s_1_2_2(or_78_nl, or_76_nl, fsm_output[0]);
  assign mux_85_nl = MUX_s_1_2_2(mux_84_nl, or_tmp_64, fsm_output[4]);
  assign mux_88_nl = MUX_s_1_2_2(or_81_nl, mux_85_nl, fsm_output[2]);
  assign or_73_nl = (~ (fsm_output[4])) | (fsm_output[1]) | (fsm_output[5]) | (fsm_output[7])
      | (~ (fsm_output[3]));
  assign or_71_nl = (fsm_output[1]) | (~ (fsm_output[5])) | (fsm_output[7]) | (~
      (fsm_output[3]));
  assign nand_78_nl = ~((fsm_output[0]) & (fsm_output[1]) & (fsm_output[5]) & (~
      (fsm_output[7])) & (fsm_output[3]));
  assign mux_82_nl = MUX_s_1_2_2(or_71_nl, nand_78_nl, fsm_output[4]);
  assign mux_83_nl = MUX_s_1_2_2(or_73_nl, mux_82_nl, fsm_output[2]);
  assign mux_89_nl = MUX_s_1_2_2(mux_88_nl, mux_83_nl, fsm_output[6]);
  assign mux_93_nl = MUX_s_1_2_2(mux_tmp_92, or_tmp_77, fsm_output[0]);
  assign nand_77_nl = ~((fsm_output[0]) & (fsm_output[2]) & (fsm_output[4]) & (fsm_output[3])
      & (~ (fsm_output[7])) & and_465_cse);
  assign mux_94_nl = MUX_s_1_2_2(mux_93_nl, nand_77_nl, fsm_output[1]);
  assign nor_187_nl = ~((~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[6]));
  assign mux_100_nl = MUX_s_1_2_2(nor_187_nl, and_494_cse, fsm_output[0]);
  assign mux_101_nl = MUX_s_1_2_2(mux_100_nl, mux_tmp_99, fsm_output[1]);
  assign butterFly_tw_h_or_nl = and_dcpl_54 | (mux_101_nl & and_dcpl_49);
  assign mux_90_nl = MUX_s_1_2_2(and_494_cse, (~ or_cse), fsm_output[0]);
  assign and_49_nl = mux_90_nl & and_dcpl_9 & (~ (fsm_output[4])) & (~ (fsm_output[1]));
  assign mux_108_nl = MUX_s_1_2_2(nand_94_cse, or_tmp_94, fsm_output[4]);
  assign mux_109_nl = MUX_s_1_2_2(or_112_cse, mux_108_nl, fsm_output[2]);
  assign or_106_nl = (~ (fsm_output[7])) | (fsm_output[3]);
  assign or_105_nl = (fsm_output[7]) | (fsm_output[3]);
  assign mux_105_nl = MUX_s_1_2_2(or_106_nl, or_105_nl, fsm_output[5]);
  assign or_107_nl = (fsm_output[6]) | mux_105_nl;
  assign mux_106_nl = MUX_s_1_2_2(or_107_nl, or_tmp_94, fsm_output[1]);
  assign or_108_nl = (fsm_output[4]) | mux_106_nl;
  assign nand_76_nl = ~((fsm_output[1]) & (fsm_output[6]) & (fsm_output[5]) & (~
      (fsm_output[7])) & (fsm_output[3]));
  assign mux_104_nl = MUX_s_1_2_2(or_103_cse, nand_76_nl, fsm_output[4]);
  assign mux_107_nl = MUX_s_1_2_2(or_108_nl, mux_104_nl, fsm_output[2]);
  assign mux_110_nl = MUX_s_1_2_2(mux_109_nl, mux_107_nl, fsm_output[0]);
  assign mux_112_nl = MUX_s_1_2_2(or_tmp_77, or_tmp_105, fsm_output[0]);
  assign nand_66_nl = ~((fsm_output[2]) & (fsm_output[4]) & (fsm_output[3]) & (~
      (fsm_output[7])) & and_465_cse);
  assign mux_111_nl = MUX_s_1_2_2(or_tmp_77, nand_66_nl, fsm_output[0]);
  assign mux_113_nl = MUX_s_1_2_2(mux_112_nl, mux_111_nl, fsm_output[1]);
  assign mux_114_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[3]);
  assign and_61_nl = (fsm_output[2]) & mux_114_nl;
  assign mux_115_nl = MUX_s_1_2_2(and_61_nl, mux_tmp_99, or_648_cse);
  assign and_62_nl = mux_115_nl & and_dcpl_49;
  assign nl_reg_tw_rsci_s_raddr_core_cse  = $signed(conv_u2s_5_6({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}))
      * $signed(({(S1_OUTER_LOOP_for_p_sva_1[4:0]) , S2_COPY_LOOP_for_i_5_0_sva_1_4_0}));
  assign mux_254_nl = MUX_s_1_2_2((~ mux_tmp_251), or_tmp_127, fsm_output[3]);
  assign or_647_nl = (fsm_output[2]) | (~ (fsm_output[4])) | mux_254_nl;
  assign or_272_nl = (fsm_output[6:3]!=4'b0010);
  assign mux_253_nl = MUX_s_1_2_2(or_272_nl, mux_tmp_138, fsm_output[2]);
  assign mux_255_nl = MUX_s_1_2_2(or_647_nl, mux_253_nl, fsm_output[0]);
  assign nand_58_nl = ~((fsm_output[3]) & mux_tmp_251);
  assign mux_252_nl = MUX_s_1_2_2(nand_58_nl, or_533_cse, fsm_output[4]);
  assign nand_13_nl = ~((fsm_output[2]) & (~ mux_252_nl));
  assign mux_256_nl = MUX_s_1_2_2(mux_255_nl, nand_13_nl, fsm_output[1]);
  assign nor_212_nl = ~(mux_256_nl | (fsm_output[7]));
  assign mux_263_nl = MUX_s_1_2_2(or_283_cse, or_tmp_265, fsm_output[4]);
  assign nand_15_nl = ~((fsm_output[2]) & (~ mux_263_nl));
  assign mux_262_nl = MUX_s_1_2_2(or_tmp_265, or_tmp_259, fsm_output[2]);
  assign mux_264_nl = MUX_s_1_2_2(nand_15_nl, mux_262_nl, fsm_output[0]);
  assign mux_260_nl = MUX_s_1_2_2(or_tmp_258, or_tmp_263, fsm_output[2]);
  assign or_278_nl = (~ (fsm_output[4])) | (~ (fsm_output[3])) | (fsm_output[7])
      | (fsm_output[5]);
  assign mux_259_nl = MUX_s_1_2_2(or_tmp_263, or_278_nl, fsm_output[2]);
  assign mux_261_nl = MUX_s_1_2_2(mux_260_nl, mux_259_nl, fsm_output[0]);
  assign mux_265_nl = MUX_s_1_2_2(mux_264_nl, mux_261_nl, fsm_output[6]);
  assign mux_257_nl = MUX_s_1_2_2(or_tmp_259, or_tmp_258, fsm_output[2]);
  assign or_273_nl = (~ (fsm_output[2])) | (fsm_output[4]) | (fsm_output[3]) | (~
      (fsm_output[7])) | (fsm_output[5]);
  assign mux_258_nl = MUX_s_1_2_2(mux_257_nl, or_273_nl, fsm_output[0]);
  assign or_277_nl = (fsm_output[6]) | mux_258_nl;
  assign mux_266_nl = MUX_s_1_2_2(mux_265_nl, or_277_nl, fsm_output[1]);
  assign and_462_nl = (fsm_output[4]) & (fsm_output[0]) & (fsm_output[1]) & (~ (fsm_output[3]));
  assign mux_272_nl = MUX_s_1_2_2(and_462_nl, mux_tmp_268, fsm_output[5]);
  assign nor_134_nl = ~((~ (fsm_output[4])) | (fsm_output[0]) | (fsm_output[1]) |
      (fsm_output[3]));
  assign nor_135_nl = ~((fsm_output[4]) | (~ (fsm_output[0])) | (~ (fsm_output[1]))
      | (fsm_output[3]));
  assign mux_271_nl = MUX_s_1_2_2(nor_134_nl, nor_135_nl, fsm_output[5]);
  assign mux_273_nl = MUX_s_1_2_2(mux_272_nl, mux_271_nl, fsm_output[2]);
  assign nor_136_nl = ~((fsm_output[4]) | (~((fsm_output[0]) & (fsm_output[1]) &
      (fsm_output[3]))));
  assign nor_137_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[1])) | (fsm_output[3]));
  assign mux_269_nl = MUX_s_1_2_2(nor_136_nl, nor_137_nl, fsm_output[5]);
  assign nor_138_nl = ~((fsm_output[5]) | (~ mux_tmp_268));
  assign mux_270_nl = MUX_s_1_2_2(mux_269_nl, nor_138_nl, fsm_output[2]);
  assign mux_274_nl = MUX_s_1_2_2(mux_273_nl, mux_270_nl, fsm_output[6]);
  assign or_286_nl = (~ (fsm_output[1])) | (fsm_output[3]);
  assign or_285_nl = (fsm_output[1]) | (fsm_output[3]);
  assign mux_267_nl = MUX_s_1_2_2(or_286_nl, or_285_nl, fsm_output[0]);
  assign nor_139_nl = ~((fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[5]) |
      (fsm_output[4]) | mux_267_nl);
  assign mux_275_nl = MUX_s_1_2_2(mux_274_nl, nor_139_nl, fsm_output[7]);
  assign mux_277_nl = MUX_s_1_2_2((fsm_output[2]), (~ (fsm_output[2])), fsm_output[1]);
  assign nand_16_nl = ~((fsm_output[5]) & mux_277_nl);
  assign or_300_nl = (fsm_output[5]) | (fsm_output[2]);
  assign mux_278_nl = MUX_s_1_2_2(nand_16_nl, or_300_nl, fsm_output[7]);
  assign nor_132_nl = ~((fsm_output[4]) | (fsm_output[6]) | mux_278_nl);
  assign nor_133_nl = ~((fsm_output[7:4]!=4'b0101) | mux_234_cse);
  assign mux_279_nl = MUX_s_1_2_2(nor_132_nl, nor_133_nl, fsm_output[3]);
  assign or_311_nl = (~ (fsm_output[5])) | (~ (fsm_output[3])) | (fsm_output[2]);
  assign mux_288_nl = MUX_s_1_2_2(or_tmp_293, (~ nor_tmp_42), fsm_output[5]);
  assign mux_287_nl = MUX_s_1_2_2(or_tmp_293, or_490_cse, fsm_output[5]);
  assign mux_289_nl = MUX_s_1_2_2(mux_288_nl, mux_287_nl, fsm_output[0]);
  assign mux_290_nl = MUX_s_1_2_2(or_311_nl, mux_289_nl, fsm_output[4]);
  assign or_309_nl = (fsm_output[0]) | mux_tmp_280;
  assign mux_285_nl = MUX_s_1_2_2(or_tmp_291, mux_tmp_280, fsm_output[0]);
  assign mux_286_nl = MUX_s_1_2_2(or_309_nl, mux_285_nl, fsm_output[4]);
  assign mux_291_nl = MUX_s_1_2_2(mux_290_nl, mux_286_nl, fsm_output[6]);
  assign mux_282_nl = MUX_s_1_2_2(or_tmp_287, or_490_cse, fsm_output[5]);
  assign mux_283_nl = MUX_s_1_2_2(or_tmp_291, mux_282_nl, fsm_output[4]);
  assign or_305_nl = (~ (fsm_output[0])) | (fsm_output[5]) | (~ (fsm_output[3]))
      | (fsm_output[2]);
  assign mux_281_nl = MUX_s_1_2_2(or_305_nl, mux_tmp_280, fsm_output[4]);
  assign mux_284_nl = MUX_s_1_2_2(mux_283_nl, mux_281_nl, fsm_output[6]);
  assign mux_292_nl = MUX_s_1_2_2(mux_291_nl, mux_284_nl, fsm_output[1]);
  assign or_303_nl = (fsm_output[6:2]!=5'b00001);
  assign mux_293_nl = MUX_s_1_2_2(mux_292_nl, or_303_nl, fsm_output[7]);
  assign nl_modulo_add_3_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_3_qif_acc_nl = nl_modulo_add_3_qif_acc_nl[31:0];
  assign nl_modulo_add_3_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_3_acc_1_nl = nl_modulo_add_3_acc_1_nl[32:0];
  assign nl_modulo_add_1_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_1_qif_acc_nl = nl_modulo_add_1_qif_acc_nl[31:0];
  assign nl_modulo_add_1_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_1_acc_1_nl = nl_modulo_add_1_acc_1_nl[32:0];
  assign nl_modulo_add_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_qif_acc_nl = nl_modulo_add_qif_acc_nl[31:0];
  assign nl_modulo_add_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12) +
      33'b000000000000000000000000000000001;
  assign modulo_add_acc_1_nl = nl_modulo_add_acc_1_nl[32:0];
  assign nl_modulo_add_7_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_7_qif_acc_nl = nl_modulo_add_7_qif_acc_nl[31:0];
  assign nl_modulo_add_7_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_7_acc_1_nl = nl_modulo_add_7_acc_1_nl[32:0];
  assign nl_modulo_add_5_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_5_qif_acc_nl = nl_modulo_add_5_qif_acc_nl[31:0];
  assign nl_modulo_add_5_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_5_acc_1_nl = nl_modulo_add_5_acc_1_nl[32:0];
  assign nl_modulo_add_4_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_4_qif_acc_nl = nl_modulo_add_4_qif_acc_nl[31:0];
  assign nl_modulo_add_4_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_4_acc_1_nl = nl_modulo_add_4_acc_1_nl[32:0];
  assign nl_modulo_add_11_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_11_qif_acc_nl = nl_modulo_add_11_qif_acc_nl[31:0];
  assign nl_modulo_add_11_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_11_acc_1_nl = nl_modulo_add_11_acc_1_nl[32:0];
  assign nl_modulo_add_9_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_9_qif_acc_nl = nl_modulo_add_9_qif_acc_nl[31:0];
  assign nl_modulo_add_9_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_9_acc_1_nl = nl_modulo_add_9_acc_1_nl[32:0];
  assign nl_modulo_add_8_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_8_qif_acc_nl = nl_modulo_add_8_qif_acc_nl[31:0];
  assign nl_modulo_add_8_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_8_acc_1_nl = nl_modulo_add_8_acc_1_nl[32:0];
  assign nl_modulo_add_15_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_15_qif_acc_nl = nl_modulo_add_15_qif_acc_nl[31:0];
  assign nl_modulo_add_15_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_15_acc_1_nl = nl_modulo_add_15_acc_1_nl[32:0];
  assign nl_modulo_add_13_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_13_qif_acc_nl = nl_modulo_add_13_qif_acc_nl[31:0];
  assign nl_modulo_add_13_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_13_acc_1_nl = nl_modulo_add_13_acc_1_nl[32:0];
  assign nl_modulo_add_12_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_12_qif_acc_nl = nl_modulo_add_12_qif_acc_nl[31:0];
  assign nl_modulo_add_12_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_12_acc_1_nl = nl_modulo_add_12_acc_1_nl[32:0];
  assign nl_modulo_add_19_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_19_qif_acc_nl = nl_modulo_add_19_qif_acc_nl[31:0];
  assign nl_modulo_add_19_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_19_acc_1_nl = nl_modulo_add_19_acc_1_nl[32:0];
  assign nl_modulo_add_17_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_17_qif_acc_nl = nl_modulo_add_17_qif_acc_nl[31:0];
  assign nl_modulo_add_17_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_17_acc_1_nl = nl_modulo_add_17_acc_1_nl[32:0];
  assign nl_modulo_add_16_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_16_qif_acc_nl = nl_modulo_add_16_qif_acc_nl[31:0];
  assign nl_modulo_add_16_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_16_acc_1_nl = nl_modulo_add_16_acc_1_nl[32:0];
  assign nl_modulo_add_23_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_23_qif_acc_nl = nl_modulo_add_23_qif_acc_nl[31:0];
  assign nl_modulo_add_23_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_23_acc_1_nl = nl_modulo_add_23_acc_1_nl[32:0];
  assign nl_modulo_add_21_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_21_qif_acc_nl = nl_modulo_add_21_qif_acc_nl[31:0];
  assign nl_modulo_add_21_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_12)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_21_acc_1_nl = nl_modulo_add_21_acc_1_nl[32:0];
  assign nl_modulo_add_20_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_20_qif_acc_nl = nl_modulo_add_20_qif_acc_nl[31:0];
  assign nl_modulo_add_20_acc_1_nl = ({1'b1 , m_sva}) + conv_u2u_32_33(~ z_out_17)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_20_acc_1_nl = nl_modulo_add_20_acc_1_nl[32:0];
  assign nand_135_nl = ~((fsm_output[4]) & (~((fsm_output[7:6]==2'b11))));
  assign mux_622_nl = MUX_s_1_2_2(or_336_cse_1, nand_135_nl, fsm_output[0]);
  assign mux_623_nl = MUX_s_1_2_2(mux_622_nl, or_tmp_699, fsm_output[2]);
  assign and_836_nl = or_858_cse & (fsm_output[7]);
  assign mux_620_nl = MUX_s_1_2_2(and_836_nl, or_tmp_697, fsm_output[0]);
  assign mux_621_nl = MUX_s_1_2_2(or_tmp_699, mux_620_nl, fsm_output[2]);
  assign mux_624_nl = MUX_s_1_2_2(mux_623_nl, mux_621_nl, fsm_output[1]);
  assign mux_618_nl = MUX_s_1_2_2(or_tmp_697, or_tmp_696, fsm_output[2]);
  assign or_790_nl = (fsm_output[2]) | (fsm_output[0]);
  assign mux_617_nl = MUX_s_1_2_2(or_tmp_697, or_tmp_696, or_790_nl);
  assign mux_619_nl = MUX_s_1_2_2(mux_618_nl, mux_617_nl, fsm_output[1]);
  assign mux_625_nl = MUX_s_1_2_2(mux_624_nl, mux_619_nl, fsm_output[3]);
  assign or_789_nl = (~((~ (fsm_output[2])) | (~ (fsm_output[4])) | (fsm_output[6])))
      | (fsm_output[7]);
  assign or_787_nl = nor_37_cse | (fsm_output[7]);
  assign and_837_nl = (fsm_output[2:0]==3'b111);
  assign mux_615_nl = MUX_s_1_2_2(or_787_nl, or_785_cse, and_837_nl);
  assign mux_616_nl = MUX_s_1_2_2(or_789_nl, mux_615_nl, fsm_output[3]);
  assign mux_626_nl = MUX_s_1_2_2(mux_625_nl, mux_616_nl, fsm_output[5]);
  assign S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl = MUX_s_1_2_2((z_out_1[3]), (z_out[3]),
      nor_211_ssc);
  assign nor_358_nl = ~((fsm_output[0]) | (fsm_output[6]) | (fsm_output[3]));
  assign nor_359_nl = ~((~ (fsm_output[0])) | (fsm_output[6]) | (~ (fsm_output[3])));
  assign mux_634_nl = MUX_s_1_2_2(nor_358_nl, nor_359_nl, fsm_output[1]);
  assign nor_360_nl = ~((fsm_output[1]) | (~ (fsm_output[0])) | (~ (fsm_output[6]))
      | (fsm_output[3]));
  assign mux_635_nl = MUX_s_1_2_2(mux_634_nl, nor_360_nl, fsm_output[4]);
  assign nor_361_nl = ~((fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[3])));
  assign nor_362_nl = ~((fsm_output[0]) | (fsm_output[3]));
  assign mux_632_nl = MUX_s_1_2_2(nor_361_nl, nor_362_nl, fsm_output[1]);
  assign nor_363_nl = ~((~ (fsm_output[1])) | (~ (fsm_output[6])) | (fsm_output[3]));
  assign mux_633_nl = MUX_s_1_2_2(mux_632_nl, nor_363_nl, fsm_output[4]);
  assign mux_636_nl = MUX_s_1_2_2(mux_635_nl, mux_633_nl, fsm_output[2]);
  assign nor_364_nl = ~((~ (fsm_output[4])) | (fsm_output[1]) | (~ (fsm_output[0]))
      | (fsm_output[6]) | (fsm_output[3]));
  assign nor_365_nl = ~((~ (fsm_output[4])) | (~ (fsm_output[1])) | (fsm_output[0])
      | (fsm_output[6]) | (fsm_output[3]));
  assign mux_631_nl = MUX_s_1_2_2(nor_364_nl, nor_365_nl, fsm_output[2]);
  assign mux_637_nl = MUX_s_1_2_2(mux_636_nl, mux_631_nl, fsm_output[7]);
  assign mux_629_nl = MUX_s_1_2_2(mux_tmp_627, or_333_cse, fsm_output[4]);
  assign mux_628_nl = MUX_s_1_2_2((~ or_tmp_12), mux_tmp_627, fsm_output[4]);
  assign mux_630_nl = MUX_s_1_2_2((~ mux_629_nl), mux_628_nl, fsm_output[2]);
  assign nor_366_nl = ~((fsm_output[7]) | mux_630_nl);
  assign mux_638_nl = MUX_s_1_2_2(mux_637_nl, nor_366_nl, fsm_output[5]);
  assign mux_23_nl = MUX_s_1_2_2((~ (fsm_output[6])), or_333_cse, fsm_output[4]);
  assign mux_21_nl = MUX_s_1_2_2(or_tmp_12, (fsm_output[6]), fsm_output[4]);
  assign mux_26_nl = MUX_s_1_2_2(mux_23_nl, mux_21_nl, fsm_output[2]);
  assign mux_307_nl = MUX_s_1_2_2(or_tmp_12, or_333_cse, fsm_output[4]);
  assign mux_20_nl = MUX_s_1_2_2(or_tmp_12, (~ or_tmp_12), fsm_output[4]);
  assign mux_308_nl = MUX_s_1_2_2(mux_307_nl, mux_20_nl, fsm_output[2]);
  assign mux_312_nl = MUX_s_1_2_2(mux_26_nl, mux_308_nl, and_455_cse);
  assign S2_COPY_LOOP_p_or_nl = nor_211_ssc | (mux_312_nl & and_dcpl_9);
  assign S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl = MUX_v_3_2_2((z_out_1[2:0]), (z_out[2:0]),
      S2_COPY_LOOP_p_or_nl);
  assign nor_367_nl = ~((fsm_output[0]) | (fsm_output[6]) | (fsm_output[7]) | (fsm_output[3]));
  assign nor_368_nl = ~((fsm_output[0]) | (fsm_output[6]) | (fsm_output[5]) | (fsm_output[7])
      | (~ (fsm_output[3])));
  assign mux_644_nl = MUX_s_1_2_2(nor_367_nl, nor_368_nl, fsm_output[2]);
  assign nor_369_nl = ~((fsm_output[2]) | (~ (fsm_output[0])) | mux_378_cse);
  assign mux_645_nl = MUX_s_1_2_2(mux_644_nl, nor_369_nl, fsm_output[4]);
  assign nor_370_nl = ~((fsm_output[5]) | (fsm_output[7]) | (~ (fsm_output[3])));
  assign nor_371_nl = ~((~ (fsm_output[5])) | (fsm_output[7]) | (~ (fsm_output[3])));
  assign mux_641_nl = MUX_s_1_2_2(nor_370_nl, nor_371_nl, fsm_output[6]);
  assign and_838_nl = (fsm_output[0]) & mux_641_nl;
  assign nor_372_nl = ~((fsm_output[0]) | (fsm_output[5]) | (fsm_output[7]) | (fsm_output[3]));
  assign mux_642_nl = MUX_s_1_2_2(and_838_nl, nor_372_nl, fsm_output[2]);
  assign or_809_nl = (~ (fsm_output[6])) | (fsm_output[5]) | (fsm_output[7]) | (fsm_output[3]);
  assign mux_640_nl = MUX_s_1_2_2(mux_378_cse, or_809_nl, fsm_output[0]);
  assign and_839_nl = (fsm_output[2]) & (~ mux_640_nl);
  assign mux_643_nl = MUX_s_1_2_2(mux_642_nl, and_839_nl, fsm_output[4]);
  assign mux_646_nl = MUX_s_1_2_2(mux_645_nl, mux_643_nl, fsm_output[1]);
  assign mux_659_nl = MUX_s_1_2_2(or_tmp_726, or_tmp_725, fsm_output[2]);
  assign mux_657_nl = MUX_s_1_2_2(not_tmp_509, or_785_cse, fsm_output[5]);
  assign mux_658_nl = MUX_s_1_2_2(mux_657_nl, or_tmp_732, fsm_output[2]);
  assign mux_660_nl = MUX_s_1_2_2(mux_659_nl, mux_658_nl, fsm_output[0]);
  assign or_828_nl = (fsm_output[2]) | (fsm_output[5]) | (~ (fsm_output[4])) | (fsm_output[7]);
  assign mux_661_nl = MUX_s_1_2_2(mux_660_nl, or_828_nl, fsm_output[6]);
  assign mux_655_nl = MUX_s_1_2_2(or_tmp_732, or_tmp_726, and_490_cse);
  assign mux_652_nl = MUX_s_1_2_2(or_826_cse, or_tmp_726, fsm_output[2]);
  assign or_825_nl = (~ (fsm_output[2])) | (fsm_output[5]) | (fsm_output[4]) | (fsm_output[7]);
  assign mux_653_nl = MUX_s_1_2_2(mux_652_nl, or_825_nl, fsm_output[0]);
  assign mux_656_nl = MUX_s_1_2_2(mux_655_nl, mux_653_nl, fsm_output[6]);
  assign mux_662_nl = MUX_s_1_2_2(mux_661_nl, mux_656_nl, fsm_output[1]);
  assign or_824_nl = (~ (fsm_output[0])) | (~ (fsm_output[2])) | (fsm_output[5])
      | (fsm_output[4]) | (fsm_output[7]);
  assign mux_648_nl = MUX_s_1_2_2(or_823_cse, or_785_cse, fsm_output[2]);
  assign mux_649_nl = MUX_s_1_2_2(mux_648_nl, or_tmp_726, fsm_output[0]);
  assign mux_650_nl = MUX_s_1_2_2(or_824_nl, mux_649_nl, fsm_output[6]);
  assign mux_647_nl = MUX_s_1_2_2(or_tmp_726, or_tmp_725, and_490_cse);
  assign nand_139_nl = ~((fsm_output[6]) & (~ mux_647_nl));
  assign mux_651_nl = MUX_s_1_2_2(mux_650_nl, nand_139_nl, fsm_output[1]);
  assign mux_663_nl = MUX_s_1_2_2(mux_662_nl, mux_651_nl, fsm_output[3]);
  assign nand_141_nl = ~((fsm_output[2]) & (fsm_output[3]) & (fsm_output[5]) & (~
      (fsm_output[7])));
  assign mux_671_nl = MUX_s_1_2_2(or_tmp_735, nand_141_nl, fsm_output[6]);
  assign mux_670_nl = MUX_s_1_2_2(or_79_cse, or_823_cse, fsm_output[2]);
  assign or_840_nl = (fsm_output[6]) | mux_670_nl;
  assign mux_672_nl = MUX_s_1_2_2(mux_671_nl, or_840_nl, fsm_output[0]);
  assign or_837_nl = (~ (fsm_output[2])) | (fsm_output[3]) | (~ (fsm_output[5]))
      | (fsm_output[7]);
  assign or_836_nl = (fsm_output[2]) | (fsm_output[5]) | (fsm_output[7]);
  assign mux_668_nl = MUX_s_1_2_2(or_837_nl, or_836_nl, fsm_output[6]);
  assign mux_667_nl = MUX_s_1_2_2(or_283_cse, or_tmp_735, fsm_output[6]);
  assign mux_669_nl = MUX_s_1_2_2(mux_668_nl, mux_667_nl, fsm_output[0]);
  assign mux_673_nl = MUX_s_1_2_2(mux_672_nl, mux_669_nl, fsm_output[4]);
  assign or_833_nl = and_480_cse | (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[5])
      | (fsm_output[7]);
  assign or_832_nl = (~ (fsm_output[2])) | (fsm_output[3]) | (fsm_output[5]) | (~
      (fsm_output[7]));
  assign mux_664_nl = MUX_s_1_2_2(or_832_nl, or_tmp_735, fsm_output[6]);
  assign nand_142_nl = ~((fsm_output[6]) & (fsm_output[2]) & (fsm_output[3]) & (fsm_output[5])
      & (~ (fsm_output[7])));
  assign mux_665_nl = MUX_s_1_2_2(mux_664_nl, nand_142_nl, fsm_output[0]);
  assign mux_666_nl = MUX_s_1_2_2(or_833_nl, mux_665_nl, fsm_output[4]);
  assign mux_674_nl = MUX_s_1_2_2(mux_673_nl, mux_666_nl, fsm_output[1]);
  assign nor_201_nl = ~((fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[7]) |
      (~ (fsm_output[6])));
  assign and_489_nl = (fsm_output[2]) & (~ mux_tmp_68);
  assign mux_69_nl = MUX_s_1_2_2(nor_201_nl, and_489_nl, fsm_output[0]);
  assign and_22_nl = mux_69_nl & and_dcpl_19 & (~ (fsm_output[1]));
  assign S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl = MUX_v_15_2_2(15'b000000000000000,
      (S1_OUTER_LOOP_for_p_sva_1[19:5]), and_22_nl);
  assign nor_376_nl = ~((fsm_output[1]) | (fsm_output[4]) | (~ (fsm_output[3])) |
      (fsm_output[6]));
  assign and_842_nl = (fsm_output[1]) & (fsm_output[4]) & (~ (fsm_output[3])) & (fsm_output[6]);
  assign mux_687_nl = MUX_s_1_2_2(nor_376_nl, and_842_nl, fsm_output[0]);
  assign and_841_nl = mux_687_nl & (~((fsm_output[5]) | (fsm_output[7]) | (fsm_output[2])));
  assign S1_OUTER_LOOP_for_mux_15_nl = MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1[4:0]),
      (revArr_rsci_s_din_mxwt[9:5]), and_841_nl);
  assign nl_S1_OUTER_LOOP_for_acc_nl = ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}) + S1_OUTER_LOOP_for_mux_15_nl;
  assign S1_OUTER_LOOP_for_acc_nl = nl_S1_OUTER_LOOP_for_acc_nl[4:0];
  assign nl_S6_OUTER_LOOP_for_acc_nl = (S1_OUTER_LOOP_for_p_sva_1[4:0]) + ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg});
  assign S6_OUTER_LOOP_for_acc_nl = nl_S6_OUTER_LOOP_for_acc_nl[4:0];
  assign S1_OUTER_LOOP_for_or_nl = S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 | S1_OUTER_LOOP_for_acc_cse_sva_mx0c2;
  assign S1_OUTER_LOOP_for_mux1h_4_nl = MUX1HOT_v_5_3_2(S1_OUTER_LOOP_for_acc_nl,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, S6_OUTER_LOOP_for_acc_nl, {S1_OUTER_LOOP_for_or_nl
      , S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 , and_dcpl_136});
  assign nl_operator_20_true_1_acc_1_nl = (z_out_2[19:5]) + 15'b111111111111111;
  assign operator_20_true_1_acc_1_nl = nl_operator_20_true_1_acc_1_nl[14:0];
  assign S2_OUTER_LOOP_c_S2_OUTER_LOOP_c_or_nl = S2_OUTER_LOOP_c_1_sva | (z_out_2[2]);
  assign operator_20_true_1_or_nl = S2_OUTER_LOOP_c_1_sva_mx0c2 | S2_OUTER_LOOP_c_1_sva_mx0c3;
  assign operator_20_true_1_mux_nl = MUX_s_1_2_2((readslicef_15_1_14(operator_20_true_1_acc_1_nl)),
      S2_OUTER_LOOP_c_S2_OUTER_LOOP_c_or_nl, operator_20_true_1_or_nl);
  assign S2_OUTER_LOOP_c_nor_nl = ~(mux_tmp_408 | (fsm_output[5]) | (fsm_output[7])
      | (~ (fsm_output[1])));
  assign S2_INNER_LOOP1_r_mux_nl = MUX_v_2_2_2(({1'b0 , S2_OUTER_LOOP_c_nor_nl}),
      (z_out_2[1:0]), S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2);
  assign S2_INNER_LOOP1_r_not_nl = ~ S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1;
  assign nor_91_nl = ~((~ (fsm_output[3])) | (~ (fsm_output[0])) | (fsm_output[2])
      | (fsm_output[6]));
  assign nor_92_nl = ~((fsm_output[3]) | (fsm_output[0]) | not_tmp_220);
  assign mux_438_nl = MUX_s_1_2_2(nor_91_nl, nor_92_nl, fsm_output[4]);
  assign nor_93_nl = ~((~ (fsm_output[0])) | (fsm_output[2]) | (fsm_output[6]));
  assign nor_94_nl = ~((fsm_output[0]) | not_tmp_220);
  assign mux_437_nl = MUX_s_1_2_2(nor_93_nl, nor_94_nl, fsm_output[3]);
  assign and_452_nl = (~(S2_OUTER_LOOP_c_1_sva | (~ (z_out_2[2])) | (~ (fsm_output[4]))))
      & mux_437_nl;
  assign mux_439_nl = MUX_s_1_2_2(mux_438_nl, and_452_nl, fsm_output[5]);
  assign nor_354_nl = ~((fsm_output[1]) | (~ (fsm_output[2])) | (~ (fsm_output[3]))
      | (fsm_output[6]) | (~ (fsm_output[0])));
  assign nor_355_nl = ~((fsm_output[1]) | (fsm_output[2]) | (~ (fsm_output[3])) |
      (~ (fsm_output[6])) | (fsm_output[0]));
  assign mux_678_nl = MUX_s_1_2_2(nor_354_nl, nor_355_nl, fsm_output[4]);
  assign nand_140_nl = ~((fsm_output[3]) & (fsm_output[6]));
  assign mux_676_nl = MUX_s_1_2_2(or_857_cse, nand_140_nl, fsm_output[2]);
  assign mux_675_nl = MUX_s_1_2_2(or_495_cse, or_842_cse, fsm_output[2]);
  assign mux_677_nl = MUX_s_1_2_2(mux_676_nl, mux_675_nl, fsm_output[1]);
  assign nor_356_nl = ~((fsm_output[4]) | mux_677_nl);
  assign mux_679_nl = MUX_s_1_2_2(mux_678_nl, nor_356_nl, fsm_output[5]);
  assign and_840_nl = (fsm_output[2]) & (fsm_output[3]) & (~ (fsm_output[6])) & (fsm_output[0]);
  assign nor_351_nl = ~((fsm_output[2]) | (~ (fsm_output[3])) | (~ (fsm_output[6]))
      | (fsm_output[0]));
  assign mux_681_nl = MUX_s_1_2_2(and_840_nl, nor_351_nl, fsm_output[4]);
  assign nor_352_nl = ~((fsm_output[4]) | mux_680_cse);
  assign mux_682_nl = MUX_s_1_2_2(mux_681_nl, nor_352_nl, fsm_output[5]);
  assign nor_81_nl = ~((fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]) | (fsm_output[5]));
  assign nor_82_nl = ~((fsm_output[2]) | (~ (fsm_output[1])) | (fsm_output[7]) |
      (~ (fsm_output[5])));
  assign mux_475_nl = MUX_s_1_2_2(nor_81_nl, nor_82_nl, fsm_output[3]);
  assign nor_83_nl = ~((fsm_output[2]) | (fsm_output[1]) | (fsm_output[7]) | (~ (fsm_output[5])));
  assign nor_84_nl = ~((~ (fsm_output[2])) | (fsm_output[1]) | (fsm_output[7]) |
      (fsm_output[5]));
  assign mux_474_nl = MUX_s_1_2_2(nor_83_nl, nor_84_nl, fsm_output[3]);
  assign mux_476_nl = MUX_s_1_2_2(mux_475_nl, mux_474_nl, fsm_output[6]);
  assign and_498_nl = (fsm_output[4]) & mux_476_nl;
  assign or_507_nl = (~ (fsm_output[1])) | (~ (fsm_output[7])) | (fsm_output[5]);
  assign or_506_nl = (fsm_output[1]) | (fsm_output[7]) | (~ (fsm_output[5]));
  assign mux_473_nl = MUX_s_1_2_2(or_507_nl, or_506_nl, fsm_output[2]);
  assign nor_242_nl = ~((fsm_output[4]) | (fsm_output[6]) | (fsm_output[3]) | mux_473_nl);
  assign mux_477_nl = MUX_s_1_2_2(and_498_nl, nor_242_nl, fsm_output[0]);
  assign or_523_nl = (~ (fsm_output[1])) | (~ (fsm_output[2])) | (fsm_output[3])
      | (fsm_output[6]) | (~ (fsm_output[5]));
  assign or_532_nl = (fsm_output[1]) | (~ (fsm_output[2])) | (fsm_output[6]) | (fsm_output[5])
      | (fsm_output[3]);
  assign mux_481_nl = MUX_s_1_2_2(or_523_nl, or_532_nl, fsm_output[7]);
  assign nor_79_nl = ~((fsm_output[4]) | mux_481_nl);
  assign mux_478_nl = MUX_s_1_2_2((fsm_output[5]), (~ (fsm_output[5])), fsm_output[6]);
  assign or_519_nl = (fsm_output[3]) | mux_478_nl;
  assign or_518_nl = (~ (fsm_output[3])) | (~ (fsm_output[6])) | (fsm_output[5]);
  assign mux_479_nl = MUX_s_1_2_2(or_519_nl, or_518_nl, fsm_output[2]);
  assign or_526_nl = (~ (fsm_output[2])) | (fsm_output[6]) | (~ (fsm_output[5]))
      | (fsm_output[3]);
  assign mux_480_nl = MUX_s_1_2_2(mux_479_nl, or_526_nl, fsm_output[1]);
  assign nor_80_nl = ~((~ (fsm_output[4])) | (fsm_output[7]) | mux_480_nl);
  assign mux_482_nl = MUX_s_1_2_2(nor_79_nl, nor_80_nl, fsm_output[0]);
  assign or_545_nl = (~ (fsm_output[2])) | (fsm_output[5]) | (~ (fsm_output[7]))
      | (fsm_output[4]);
  assign mux_492_nl = MUX_s_1_2_2(or_545_nl, mux_tmp_489, fsm_output[0]);
  assign mux_493_nl = MUX_s_1_2_2(mux_492_nl, or_tmp_521, fsm_output[6]);
  assign or_542_nl = (~ (fsm_output[2])) | (fsm_output[5]) | (fsm_output[7]) | (~
      (fsm_output[4]));
  assign mux_491_nl = MUX_s_1_2_2(or_tmp_521, or_542_nl, fsm_output[6]);
  assign mux_494_nl = MUX_s_1_2_2(mux_493_nl, mux_491_nl, fsm_output[3]);
  assign or_536_nl = (fsm_output[2]) | (fsm_output[5]) | (~ (fsm_output[7])) | (fsm_output[4]);
  assign mux_490_nl = MUX_s_1_2_2(mux_tmp_489, or_536_nl, fsm_output[0]);
  assign or_540_nl = (fsm_output[3]) | (fsm_output[6]) | mux_490_nl;
  assign mux_495_nl = MUX_s_1_2_2(mux_494_nl, or_540_nl, fsm_output[1]);
  assign or_548_nl = (~ (fsm_output[0])) | (~ (fsm_output[2])) | (fsm_output[3])
      | (fsm_output[6]) | (fsm_output[5]);
  assign or_547_nl = (fsm_output[3:2]!=2'b00) | (~ mux_tmp_251);
  assign mux_496_nl = MUX_s_1_2_2(or_547_nl, or_tmp_419, fsm_output[0]);
  assign mux_497_nl = MUX_s_1_2_2(or_548_nl, mux_496_nl, fsm_output[1]);
  assign or_577_nl = (fsm_output[1]) | (fsm_output[7]) | (~ (fsm_output[3]));
  assign mux_511_nl = MUX_s_1_2_2(or_tmp_538, or_577_nl, fsm_output[5]);
  assign nor_75_nl = ~((fsm_output[2]) | mux_511_nl);
  assign nor_76_nl = ~((~ (fsm_output[5])) | (~ (fsm_output[1])) | (fsm_output[7])
      | (fsm_output[3]));
  assign mux_505_nl = MUX_s_1_2_2(nor_76_nl, nor_77_cse, fsm_output[2]);
  assign mux_507_nl = MUX_s_1_2_2(nor_75_nl, mux_505_nl, fsm_output[6]);
  assign and_446_nl = (fsm_output[4]) & mux_507_nl;
  assign or_570_nl = (fsm_output[1]) | (~ (fsm_output[7])) | (fsm_output[3]);
  assign mux_509_nl = MUX_s_1_2_2(or_570_nl, or_tmp_538, fsm_output[5]);
  assign nor_78_nl = ~((fsm_output[4]) | (fsm_output[6]) | (~ (fsm_output[2])) |
      mux_509_nl);
  assign mux_508_nl = MUX_s_1_2_2(and_446_nl, nor_78_nl, fsm_output[0]);
  assign nand_83_nl = ~((fsm_output[2]) & (fsm_output[3]) & (~ (fsm_output[6])) &
      (fsm_output[5]));
  assign mux_515_nl = MUX_s_1_2_2(nand_83_nl, or_tmp_419, fsm_output[0]);
  assign or_579_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (fsm_output[3]) | (~
      mux_tmp_251);
  assign mux_516_nl = MUX_s_1_2_2(mux_515_nl, or_579_nl, fsm_output[1]);
  assign nor_72_nl = ~((~ (fsm_output[1])) | (fsm_output[5]));
  assign nor_73_nl = ~((fsm_output[1]) | (~ (fsm_output[5])));
  assign mux_524_nl = MUX_s_1_2_2(nor_72_nl, nor_73_nl, fsm_output[3]);
  assign nor_74_nl = ~((~ (fsm_output[3])) | (~ (fsm_output[1])) | (fsm_output[5]));
  assign mux_525_nl = MUX_s_1_2_2(mux_524_nl, nor_74_nl, fsm_output[6]);
  assign and_495_nl = (fsm_output[4]) & (fsm_output[0]) & mux_525_nl;
  assign or_643_nl = (fsm_output[6]) | (fsm_output[3]) | (fsm_output[1]) | (~ (fsm_output[5]));
  assign nand_40_nl = ~((fsm_output[6]) & (fsm_output[3]) & (fsm_output[1]) & (fsm_output[5]));
  assign mux_523_nl = MUX_s_1_2_2(or_643_nl, nand_40_nl, fsm_output[0]);
  assign nor_234_nl = ~((fsm_output[4]) | mux_523_nl);
  assign mux_526_nl = MUX_s_1_2_2(and_495_nl, nor_234_nl, fsm_output[2]);
  assign nor_235_nl = ~((fsm_output[6:0]!=7'b0000010));
  assign mux_527_nl = MUX_s_1_2_2(mux_526_nl, nor_235_nl, fsm_output[7]);
  assign nl_modulo_sub_1_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_1_qif_acc_nl = nl_modulo_sub_1_qif_acc_nl[31:0];
  assign nl_modulo_add_2_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_2_qif_acc_nl = nl_modulo_add_2_qif_acc_nl[31:0];
  assign nl_modulo_sub_7_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_7_qif_acc_nl = nl_modulo_sub_7_qif_acc_nl[31:0];
  assign nl_modulo_sub_4_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_4_qif_acc_nl = nl_modulo_sub_4_qif_acc_nl[31:0];
  assign nl_modulo_add_6_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_6_qif_acc_nl = nl_modulo_add_6_qif_acc_nl[31:0];
  assign nl_modulo_add_10_qif_acc_nl = z_out_17 - m_sva;
  assign modulo_add_10_qif_acc_nl = nl_modulo_add_10_qif_acc_nl[31:0];
  assign nl_modulo_sub_10_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_10_qif_acc_nl = nl_modulo_sub_10_qif_acc_nl[31:0];
  assign nl_modulo_sub_15_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_15_qif_acc_nl = nl_modulo_sub_15_qif_acc_nl[31:0];
  assign nl_modulo_sub_12_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_12_qif_acc_nl = nl_modulo_sub_12_qif_acc_nl[31:0];
  assign nl_modulo_add_14_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_14_qif_acc_nl = nl_modulo_add_14_qif_acc_nl[31:0];
  assign nl_modulo_sub_19_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_19_qif_acc_nl = nl_modulo_sub_19_qif_acc_nl[31:0];
  assign nl_modulo_sub_16_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_16_qif_acc_nl = nl_modulo_sub_16_qif_acc_nl[31:0];
  assign nl_modulo_add_18_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_18_qif_acc_nl = nl_modulo_add_18_qif_acc_nl[31:0];
  assign nl_modulo_sub_23_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_23_qif_acc_nl = nl_modulo_sub_23_qif_acc_nl[31:0];
  assign nl_modulo_sub_20_qif_acc_nl = ({1'b1 , (z_out_14[30:0])}) + m_sva;
  assign modulo_sub_20_qif_acc_nl = nl_modulo_sub_20_qif_acc_nl[31:0];
  assign nl_modulo_add_22_qif_acc_nl = z_out_12 - m_sva;
  assign modulo_add_22_qif_acc_nl = nl_modulo_add_22_qif_acc_nl[31:0];
  assign nor_374_nl = ~((fsm_output[3]) | (fsm_output[6]) | (fsm_output[7]));
  assign mux_685_nl = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[6]);
  assign nor_375_nl = ~((fsm_output[3]) | mux_685_nl);
  assign mux_684_nl = MUX_s_1_2_2(nor_374_nl, nor_375_nl, fsm_output[4]);
  assign nand_144_nl = ~((fsm_output[2:1]==2'b11) & mux_684_nl);
  assign or_859_nl = (fsm_output[2]) | (~ (fsm_output[4])) | (fsm_output[3]) | (~
      (fsm_output[6])) | (fsm_output[7]);
  assign or_860_nl = (fsm_output[2]) | (fsm_output[4]) | (~ (fsm_output[3])) | (fsm_output[6])
      | (fsm_output[7]);
  assign mux_686_nl = MUX_s_1_2_2(or_859_nl, or_860_nl, fsm_output[1]);
  assign mux_683_nl = MUX_s_1_2_2(nand_144_nl, mux_686_nl, fsm_output[0]);
  assign nor_373_nl = ~(mux_683_nl | (fsm_output[5]));
  assign S2_INNER_LOOP1_for_mux_6_nl = MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      ({reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg , reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      , reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg}), nor_373_nl);
  assign nl_z_out_1 = conv_u2u_5_6(S2_INNER_LOOP1_for_mux_6_nl) + 6'b000001;
  assign z_out_1 = nl_z_out_1[5:0];
  assign not_1562_nl = ~ not_tmp_353;
  assign S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl = MUX_v_15_2_2(15'b000000000000000,
      (S1_OUTER_LOOP_for_p_sva_1[14:0]), not_1562_nl);
  assign not_1563_nl = ~ not_tmp_353;
  assign S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl = MUX_v_3_2_2(3'b000, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0[4:2]),
      not_1563_nl);
  assign S1_OUTER_LOOP_for_mux_14_nl = MUX_v_2_2_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0[1:0]),
      S2_INNER_LOOP1_r_4_2_sva_1_0, not_tmp_353);
  assign nl_z_out_2 = ({S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl , S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl
      , S1_OUTER_LOOP_for_mux_14_nl}) + 20'b00000000000000000001;
  assign z_out_2 = nl_z_out_2[19:0];
  assign nor_303_nl = ~((~ (fsm_output[4])) | (fsm_output[0]) | (fsm_output[6]));
  assign nor_304_nl = ~((fsm_output[4]) | (fsm_output[0]) | (fsm_output[6]));
  assign mux_568_nl = MUX_s_1_2_2(nor_303_nl, nor_304_nl, fsm_output[7]);
  assign and_814_nl = (fsm_output[2]) & mux_568_nl;
  assign nor_378_nl = ~((~ (fsm_output[2])) | (fsm_output[7]) | not_tmp_369);
  assign mux_689_nl = MUX_s_1_2_2(and_814_nl, nor_378_nl, fsm_output[3]);
  assign and_843_nl = (fsm_output[1]) & mux_689_nl;
  assign nor_306_nl = ~((fsm_output[7]) | (fsm_output[4]) | (fsm_output[0]) | (fsm_output[6]));
  assign nor_307_nl = ~((fsm_output[7]) | (~ (fsm_output[4])) | (fsm_output[0]) |
      (fsm_output[6]));
  assign mux_566_nl = MUX_s_1_2_2(nor_306_nl, nor_307_nl, fsm_output[2]);
  assign and_815_nl = (fsm_output[3]) & mux_566_nl;
  assign nor_379_nl = ~((fsm_output[3]) | (fsm_output[2]) | (fsm_output[7]) | not_tmp_369);
  assign mux_690_nl = MUX_s_1_2_2(and_815_nl, nor_379_nl, fsm_output[1]);
  assign mux_688_nl = MUX_s_1_2_2(and_843_nl, mux_690_nl, fsm_output[5]);
  assign mult_3_if_mult_3_if_mux_1_cse = MUX_v_32_2_2(z_out_5, mult_res_sva_1, mux_688_nl);
  assign nl_acc_3_nl = ({mult_3_if_mult_3_if_mux_1_cse , 1'b1}) + ({(~ m_sva) , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[32:0];
  assign z_out_4 = readslicef_33_32_1(acc_3_nl);
  assign or_861_nl = (fsm_output[5]) | (~((fsm_output[7]) & (fsm_output[0]) & (fsm_output[3])));
  assign or_862_nl = (~ (fsm_output[5])) | (fsm_output[7]) | not_tmp_362;
  assign mux_693_nl = MUX_s_1_2_2(or_861_nl, or_862_nl, fsm_output[1]);
  assign mux_692_nl = MUX_s_1_2_2(mux_693_nl, or_tmp_606, fsm_output[6]);
  assign nor_380_nl = ~((fsm_output[4]) | mux_692_nl);
  assign or_864_nl = (fsm_output[7]) | (fsm_output[0]) | (fsm_output[3]);
  assign or_865_nl = (fsm_output[7]) | not_tmp_362;
  assign mux_695_nl = MUX_s_1_2_2(or_864_nl, or_865_nl, fsm_output[5]);
  assign or_863_nl = (fsm_output[1]) | mux_695_nl;
  assign mux_694_nl = MUX_s_1_2_2(or_863_nl, or_tmp_606, fsm_output[6]);
  assign and_844_nl = (fsm_output[4]) & (~ mux_694_nl);
  assign mux_691_nl = MUX_s_1_2_2(nor_380_nl, and_844_nl, fsm_output[2]);
  assign or_866_nl = (fsm_output[6]) | (~ (fsm_output[7])) | (fsm_output[1]) | (fsm_output[0])
      | (~ (fsm_output[3]));
  assign mux_698_nl = MUX_s_1_2_2(or_866_nl, mux_tmp_562, fsm_output[5]);
  assign or_867_nl = (fsm_output[5]) | (~ (fsm_output[6])) | (fsm_output[7]) | (~
      (fsm_output[1])) | (fsm_output[0]) | (~ (fsm_output[3]));
  assign mux_697_nl = MUX_s_1_2_2(mux_698_nl, or_867_nl, fsm_output[2]);
  assign or_868_nl = (fsm_output[6]) | (fsm_output[7]) | (fsm_output[1]) | (~ (fsm_output[0]))
      | (fsm_output[3]);
  assign mux_699_nl = MUX_s_1_2_2(or_868_nl, mux_tmp_562, fsm_output[5]);
  assign nand_146_nl = ~((fsm_output[2]) & (~ mux_699_nl));
  assign mux_696_nl = MUX_s_1_2_2(mux_697_nl, nand_146_nl, fsm_output[4]);
  assign nand_147_nl = ~((fsm_output[7]) & (fsm_output[1]));
  assign mux_702_nl = MUX_s_1_2_2(nand_147_nl, or_tmp_634, fsm_output[4]);
  assign nor_381_nl = ~((fsm_output[5]) | (~ (fsm_output[2])) | mux_702_nl);
  assign or_869_nl = (fsm_output[7]) | (fsm_output[1]);
  assign mux_703_nl = MUX_s_1_2_2(or_869_nl, or_tmp_634, fsm_output[4]);
  assign nor_382_nl = ~((~ (fsm_output[5])) | (fsm_output[2]) | mux_703_nl);
  assign mux_701_nl = MUX_s_1_2_2(nor_381_nl, nor_382_nl, fsm_output[3]);
  assign and_845_nl = (fsm_output[0]) & mux_701_nl;
  assign nor_383_nl = ~((fsm_output[4]) | (fsm_output[7]) | (fsm_output[1]));
  assign nor_384_nl = ~((~ (fsm_output[4])) | (fsm_output[7]) | (fsm_output[1]));
  assign mux_705_nl = MUX_s_1_2_2(nor_383_nl, nor_384_nl, fsm_output[2]);
  assign and_846_nl = nor_192_cse & mux_705_nl;
  assign nor_385_nl = ~((~ (fsm_output[3])) | (fsm_output[5]) | (~ (fsm_output[2]))
      | (fsm_output[4]) | (fsm_output[7]) | (fsm_output[1]));
  assign mux_704_nl = MUX_s_1_2_2(and_846_nl, nor_385_nl, fsm_output[0]);
  assign mux_700_nl = MUX_s_1_2_2(and_845_nl, mux_704_nl, fsm_output[6]);
  assign mult_3_res_mux1h_2_nl = MUX1HOT_v_32_3_2(mult_16_z_asn_itm, mult_10_z_asn_itm,
      mult_11_z_asn_itm, {mux_691_nl , (~ mux_696_nl) , mux_700_nl});
  assign nl_acc_4_nl = ({mult_3_res_mux1h_2_nl , 1'b1}) + ({(~ mult_z_mul_cmp_z_oreg)
      , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[32:0];
  assign z_out_5 = readslicef_33_32_1(acc_4_nl);
  assign and_847_nl = nor_291_cse & (fsm_output[5]) & (fsm_output[3]) & and_dcpl_23
      & (fsm_output[1:0]==2'b10);
  assign modulo_sub_3_qif_mux_2_nl = MUX_v_31_2_2((z_out_8[30:0]), (z_out_10[30:0]),
      and_847_nl);
  assign nl_z_out_6 = ({1'b1 , modulo_sub_3_qif_mux_2_nl}) + m_sva;
  assign z_out_6 = nl_z_out_6[31:0];
  assign nl_acc_6_cse_32_1 = ({1'b1 , (z_out_8[30:0])}) + m_sva;
  assign acc_6_cse_32_1 = nl_acc_6_cse_32_1[31:0];
  assign butterFly_3_or_6_nl = (nor_291_cse & (~ (fsm_output[5])) & (~ (fsm_output[3]))
      & and_dcpl_37 & and_455_cse) | (nor_291_cse & (fsm_output[5]) & (fsm_output[3])
      & and_dcpl_37 & (fsm_output[1:0]==2'b01));
  assign butterFly_3_butterFly_3_mux_2_nl = MUX_v_32_2_2((~ reg_mult_3_res_lpi_4_dfm_cse_1),
      (~ reg_mult_res_lpi_4_dfm_cse), butterFly_3_or_6_nl);
  assign nl_acc_7_nl = ({butterFly_14_f1_sva , 1'b1}) + ({butterFly_3_butterFly_3_mux_2_nl
      , 1'b1});
  assign acc_7_nl = nl_acc_7_nl[32:0];
  assign z_out_8 = readslicef_33_32_1(acc_7_nl);
  assign and_850_nl = (fsm_output[7:2]==6'b001011) & nor_107_cse;
  assign modulo_sub_2_qif_mux_2_nl = MUX_v_31_2_2((z_out_10[30:0]), (z_out_8[30:0]),
      and_850_nl);
  assign nl_z_out_9 = ({1'b1 , modulo_sub_2_qif_mux_2_nl}) + m_sva;
  assign z_out_9 = nl_z_out_9[31:0];
  assign nl_acc_9_nl = ({butterFly_11_f1_sva , 1'b1}) + ({(~ reg_mult_3_res_lpi_4_dfm_cse_1)
      , 1'b1});
  assign acc_9_nl = nl_acc_9_nl[32:0];
  assign z_out_10 = readslicef_33_32_1(acc_9_nl);
  assign and_851_nl = (fsm_output==8'b00111101);
  assign modulo_sub_11_qif_mux_2_nl = MUX_v_31_2_2((z_out_10[30:0]), (z_out_8[30:0]),
      and_851_nl);
  assign nl_z_out_11 = ({1'b1 , modulo_sub_11_qif_mux_2_nl}) + m_sva;
  assign z_out_11 = nl_z_out_11[31:0];
  assign butterFly_3_or_7_nl = (nor_291_cse & and_594_cse & (fsm_output[4]) & (~
      (fsm_output[2])) & nor_107_cse) | (and_dcpl_583 & and_dcpl_34) | (and_dcpl_583
      & and_dcpl_37 & nor_107_cse) | (and_dcpl_583 & and_dcpl_37 & and_dcpl_33) |
      (and_570_cse & and_dcpl_23 & and_dcpl_70) | (and_570_cse & and_dcpl_156) |
      ((fsm_output[7:6]==2'b10) & and_594_cse & and_dcpl_23 & nor_107_cse);
  assign butterFly_3_mux_1_nl = MUX_v_32_2_2(butterFly_14_f1_sva, butterFly_11_f1_sva,
      butterFly_3_or_7_nl);
  assign butterFly_3_or_8_nl = (nor_291_cse & (~ (fsm_output[5])) & (~ (fsm_output[3]))
      & and_dcpl_149) | (and_dcpl_583 & and_dcpl_156);
  assign butterFly_3_butterFly_3_mux_3_nl = MUX_v_32_2_2(reg_mult_3_res_lpi_4_dfm_cse_1,
      reg_mult_res_lpi_4_dfm_cse, butterFly_3_or_8_nl);
  assign nl_z_out_12 = butterFly_3_mux_1_nl + butterFly_3_butterFly_3_mux_3_nl;
  assign z_out_12 = nl_z_out_12[31:0];
  assign nl_acc_12_cse_32_1 = ({1'b1 , (z_out_10[30:0])}) + m_sva;
  assign acc_12_cse_32_1 = nl_acc_12_cse_32_1[31:0];
  assign butterFly_1_or_3_nl = (nor_291_cse & (fsm_output[5]) & (fsm_output[3]) &
      and_dcpl_23 & (fsm_output[1:0]==2'b01)) | (and_570_cse & and_dcpl_23 & nor_107_cse)
      | (and_570_cse & and_dcpl_37 & nor_107_cse) | ((fsm_output[7:6]==2'b10) & and_dcpl_19
      & (~ (fsm_output[4])) & (fsm_output[2]) & and_455_cse);
  assign butterFly_1_butterFly_1_mux_1_nl = MUX_v_32_2_2((~ reg_mult_3_res_lpi_4_dfm_cse_1),
      (~ reg_mult_res_lpi_4_dfm_cse), butterFly_1_or_3_nl);
  assign nl_acc_13_nl = ({butterFly_10_f1_sva , 1'b1}) + ({butterFly_1_butterFly_1_mux_1_nl
      , 1'b1});
  assign acc_13_nl = nl_acc_13_nl[32:0];
  assign z_out_14 = readslicef_33_32_1(acc_13_nl);
  assign butterFly_1_or_4_nl = (and_dcpl_9 & (~ (fsm_output[6])) & (fsm_output[3])
      & and_dcpl_23 & (fsm_output[1:0]==2'b01)) | (and_dcpl_703 & and_dcpl_23 & nor_107_cse)
      | (and_dcpl_703 & (fsm_output[4]) & (fsm_output[2]) & nor_107_cse) | ((~ (fsm_output[5]))
      & (fsm_output[7]) & nor_188_cse & (~ (fsm_output[4])) & (fsm_output[2]) & (fsm_output[1])
      & (fsm_output[0]));
  assign butterFly_1_mux_1_nl = MUX_v_32_2_2(reg_mult_3_res_lpi_4_dfm_cse_1, reg_mult_res_lpi_4_dfm_cse,
      butterFly_1_or_4_nl);
  assign nl_z_out_17 = butterFly_10_f1_sva + butterFly_1_mux_1_nl;
  assign z_out_17 = nl_z_out_17[31:0];
  assign nl_acc_17_nl = ({1'b1 , mult_3_if_mult_3_if_mux_1_cse , 1'b1}) + conv_u2u_33_34({(~
      m_sva) , 1'b1});
  assign acc_17_nl = nl_acc_17_nl[33:0];
  assign z_out_18_32 = readslicef_34_1_33(acc_17_nl);

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


  function automatic [31:0] MUX1HOT_v_32_26_2;
    input [31:0] input_25;
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
    input [25:0] sel;
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
    result = result | ( input_25 & {32{sel[25]}});
    MUX1HOT_v_32_26_2 = result;
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


  function automatic [5:0] conv_u2u_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_6 = {1'b0, vector};
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
  wire [19:0] mult_12_z_mul_cmp_a;
  wire [31:0] mult_12_z_mul_cmp_b;
  wire [31:0] mult_z_mul_cmp_a;
  wire [31:0] mult_z_mul_cmp_b;
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
  wire [31:0] nl_hybrid_core_inst_mult_12_z_mul_cmp_z;
  assign nl_hybrid_core_inst_mult_12_z_mul_cmp_z = conv_u2u_53_32($signed(mult_12_z_mul_cmp_a)
      * $signed(conv_u2s_32_33(mult_12_z_mul_cmp_b)));
  wire [31:0] nl_hybrid_core_inst_mult_z_mul_cmp_z;
  assign nl_hybrid_core_inst_mult_z_mul_cmp_z = conv_u2u_64_32(mult_z_mul_cmp_a *
      mult_z_mul_cmp_b);
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
      .mult_12_z_mul_cmp_a(mult_12_z_mul_cmp_a),
      .mult_12_z_mul_cmp_b(mult_12_z_mul_cmp_b),
      .mult_12_z_mul_cmp_z(nl_hybrid_core_inst_mult_12_z_mul_cmp_z[31:0]),
      .mult_z_mul_cmp_a(mult_z_mul_cmp_a),
      .mult_z_mul_cmp_b(mult_z_mul_cmp_b),
      .mult_z_mul_cmp_z(nl_hybrid_core_inst_mult_z_mul_cmp_z[31:0]),
      .xx_rsci_we_d_pff(xx_rsci_we_d_iff),
      .yy_rsci_we_d_pff(yy_rsci_we_d_iff)
    );

  function automatic [32:0] conv_u2s_32_33 ;
    input [31:0]  vector ;
  begin
    conv_u2s_32_33 =  {1'b0, vector};
  end
  endfunction


  function automatic [31:0] conv_u2u_53_32 ;
    input [52:0]  vector ;
  begin
    conv_u2u_53_32 = vector[31:0];
  end
  endfunction


  function automatic [31:0] conv_u2u_64_32 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_32 = vector[31:0];
  end
  endfunction

endmodule



