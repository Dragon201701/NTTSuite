
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


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_out_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
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

module ccs_out_v1 (dat, idat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output   [width-1:0] dat;
  input    [width-1:0] idat;

  wire     [width-1:0] dat;

  assign dat = idat;

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
//  Generated date: Tue Jun 22 23:22:40 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    fir_filter_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_4_7_3_127_127_3_1_gen
// ------------------------------------------------------------------


module fir_filter_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_4_7_3_127_127_3_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [2:0] q;
  output [6:0] radr;
  output we;
  output [2:0] d;
  output [6:0] wadr;
  input clken_d;
  input [2:0] d_d;
  output [2:0] q_d;
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
//  Design Unit:    fir_filter_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module fir_filter_core_core_fsm (
  clk, rst, b_rsci_wen_comp, fsm_output, x_vinit_C_1_tr0, SHIFT_LOOP_C_2_tr0, MAC_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input b_rsci_wen_comp;
  output [12:0] fsm_output;
  reg [12:0] fsm_output;
  input x_vinit_C_1_tr0;
  input SHIFT_LOOP_C_2_tr0;
  input MAC_LOOP_C_1_tr0;


  // FSM State Type Declaration for fir_filter_core_core_fsm_1
  parameter
    core_rlp_C_0 = 4'd0,
    x_vinit_C_0 = 4'd1,
    x_vinit_C_1 = 4'd2,
    main_C_0 = 4'd3,
    SHIFT_LOOP_C_0 = 4'd4,
    SHIFT_LOOP_C_1 = 4'd5,
    SHIFT_LOOP_C_2 = 4'd6,
    main_C_1 = 4'd7,
    main_C_2 = 4'd8,
    MAC_LOOP_C_0 = 4'd9,
    MAC_LOOP_C_1 = 4'd10,
    main_C_3 = 4'd11,
    main_C_4 = 4'd12;

  reg [3:0] state_var;
  reg [3:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : fir_filter_core_core_fsm_1
    case (state_var)
      x_vinit_C_0 : begin
        fsm_output = 13'b0000000000010;
        state_var_NS = x_vinit_C_1;
      end
      x_vinit_C_1 : begin
        fsm_output = 13'b0000000000100;
        if ( x_vinit_C_1_tr0 ) begin
          state_var_NS = x_vinit_C_0;
        end
        else begin
          state_var_NS = main_C_0;
        end
      end
      main_C_0 : begin
        fsm_output = 13'b0000000001000;
        state_var_NS = SHIFT_LOOP_C_0;
      end
      SHIFT_LOOP_C_0 : begin
        fsm_output = 13'b0000000010000;
        state_var_NS = SHIFT_LOOP_C_1;
      end
      SHIFT_LOOP_C_1 : begin
        fsm_output = 13'b0000000100000;
        state_var_NS = SHIFT_LOOP_C_2;
      end
      SHIFT_LOOP_C_2 : begin
        fsm_output = 13'b0000001000000;
        if ( SHIFT_LOOP_C_2_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = SHIFT_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 13'b0000010000000;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 13'b0000100000000;
        state_var_NS = MAC_LOOP_C_0;
      end
      MAC_LOOP_C_0 : begin
        fsm_output = 13'b0001000000000;
        state_var_NS = MAC_LOOP_C_1;
      end
      MAC_LOOP_C_1 : begin
        fsm_output = 13'b0010000000000;
        if ( MAC_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_3;
        end
        else begin
          state_var_NS = MAC_LOOP_C_0;
        end
      end
      main_C_3 : begin
        fsm_output = 13'b0100000000000;
        state_var_NS = main_C_4;
      end
      main_C_4 : begin
        fsm_output = 13'b1000000000000;
        state_var_NS = main_C_0;
      end
      // core_rlp_C_0
      default : begin
        fsm_output = 13'b0000000000001;
        state_var_NS = x_vinit_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= core_rlp_C_0;
    end
    else if ( b_rsci_wen_comp ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_staller
// ------------------------------------------------------------------


module fir_filter_core_staller (
  clk, rst, core_wten, b_rsci_wen_comp
);
  input clk;
  input rst;
  output core_wten;
  reg core_wten;
  input b_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  always @(posedge clk) begin
    if ( rst ) begin
      core_wten <= 1'b0;
    end
    else begin
      core_wten <= ~ b_rsci_wen_comp;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_y_rsc_triosy_obj_y_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module fir_filter_core_y_rsc_triosy_obj_y_rsc_triosy_wait_ctrl (
  core_wten, y_rsc_triosy_obj_iswt0, y_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input y_rsc_triosy_obj_iswt0;
  output y_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign y_rsc_triosy_obj_ld_core_sct = y_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module fir_filter_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl (
  core_wten, b_rsc_triosy_obj_iswt0, b_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input b_rsc_triosy_obj_iswt0;
  output b_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign b_rsc_triosy_obj_ld_core_sct = b_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_i_sample_rsc_triosy_obj_i_sample_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module fir_filter_core_i_sample_rsc_triosy_obj_i_sample_rsc_triosy_wait_ctrl (
  core_wten, i_sample_rsc_triosy_obj_iswt0, i_sample_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input i_sample_rsc_triosy_obj_iswt0;
  output i_sample_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign i_sample_rsc_triosy_obj_ld_core_sct = i_sample_rsc_triosy_obj_iswt0 & (~
      core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_b_rsci_b_rsc_wait_dp
// ------------------------------------------------------------------


module fir_filter_core_b_rsci_b_rsc_wait_dp (
  clk, rst, b_rsci_oswt, b_rsci_wen_comp, b_rsci_s_raddr_core, b_rsci_biwt, b_rsci_bdwt,
      b_rsci_bcwt, b_rsci_s_raddr, b_rsci_s_raddr_core_sct
);
  input clk;
  input rst;
  input b_rsci_oswt;
  output b_rsci_wen_comp;
  input [6:0] b_rsci_s_raddr_core;
  input b_rsci_biwt;
  input b_rsci_bdwt;
  output b_rsci_bcwt;
  reg b_rsci_bcwt;
  output [6:0] b_rsci_s_raddr;
  input b_rsci_s_raddr_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign b_rsci_wen_comp = (~ b_rsci_oswt) | b_rsci_biwt | b_rsci_bcwt;
  assign b_rsci_s_raddr = MUX_v_7_2_2(7'b0000000, b_rsci_s_raddr_core, b_rsci_s_raddr_core_sct);
  always @(posedge clk) begin
    if ( rst ) begin
      b_rsci_bcwt <= 1'b0;
    end
    else begin
      b_rsci_bcwt <= ~((~(b_rsci_bcwt | b_rsci_biwt)) | b_rsci_bdwt);
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_b_rsci_b_rsc_wait_ctrl
// ------------------------------------------------------------------


module fir_filter_core_b_rsci_b_rsc_wait_ctrl (
  core_wen, b_rsci_oswt, b_rsci_biwt, b_rsci_bdwt, b_rsci_bcwt, b_rsci_s_re_core_sct,
      b_rsci_s_rrdy
);
  input core_wen;
  input b_rsci_oswt;
  output b_rsci_biwt;
  output b_rsci_bdwt;
  input b_rsci_bcwt;
  output b_rsci_s_re_core_sct;
  input b_rsci_s_rrdy;


  // Interconnect Declarations
  wire b_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign b_rsci_bdwt = b_rsci_oswt & core_wen;
  assign b_rsci_biwt = b_rsci_ogwt & b_rsci_s_rrdy;
  assign b_rsci_ogwt = b_rsci_oswt & (~ b_rsci_bcwt);
  assign b_rsci_s_re_core_sct = b_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_wait_dp
// ------------------------------------------------------------------


module fir_filter_core_wait_dp (
  x_rsc_cgo_iro, x_rsci_clken_d, core_wen, x_rsc_cgo
);
  input x_rsc_cgo_iro;
  output x_rsci_clken_d;
  input core_wen;
  input x_rsc_cgo;



  // Interconnect Declarations for Component Instantiations 
  assign x_rsci_clken_d = core_wen & (x_rsc_cgo | x_rsc_cgo_iro);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_y_rsc_triosy_obj
// ------------------------------------------------------------------


module fir_filter_core_y_rsc_triosy_obj (
  y_rsc_triosy_lz, core_wten, y_rsc_triosy_obj_iswt0
);
  output y_rsc_triosy_lz;
  input core_wten;
  input y_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire y_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) y_rsc_triosy_obj (
      .ld(y_rsc_triosy_obj_ld_core_sct),
      .lz(y_rsc_triosy_lz)
    );
  fir_filter_core_y_rsc_triosy_obj_y_rsc_triosy_wait_ctrl fir_filter_core_y_rsc_triosy_obj_y_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .y_rsc_triosy_obj_iswt0(y_rsc_triosy_obj_iswt0),
      .y_rsc_triosy_obj_ld_core_sct(y_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_b_rsc_triosy_obj
// ------------------------------------------------------------------


module fir_filter_core_b_rsc_triosy_obj (
  b_rsc_triosy_lz, core_wten, b_rsc_triosy_obj_iswt0
);
  output b_rsc_triosy_lz;
  input core_wten;
  input b_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire b_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) b_rsc_triosy_obj (
      .ld(b_rsc_triosy_obj_ld_core_sct),
      .lz(b_rsc_triosy_lz)
    );
  fir_filter_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl fir_filter_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .b_rsc_triosy_obj_iswt0(b_rsc_triosy_obj_iswt0),
      .b_rsc_triosy_obj_ld_core_sct(b_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_i_sample_rsc_triosy_obj
// ------------------------------------------------------------------


module fir_filter_core_i_sample_rsc_triosy_obj (
  i_sample_rsc_triosy_lz, core_wten, i_sample_rsc_triosy_obj_iswt0
);
  output i_sample_rsc_triosy_lz;
  input core_wten;
  input i_sample_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire i_sample_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) i_sample_rsc_triosy_obj (
      .ld(i_sample_rsc_triosy_obj_ld_core_sct),
      .lz(i_sample_rsc_triosy_lz)
    );
  fir_filter_core_i_sample_rsc_triosy_obj_i_sample_rsc_triosy_wait_ctrl fir_filter_core_i_sample_rsc_triosy_obj_i_sample_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .i_sample_rsc_triosy_obj_iswt0(i_sample_rsc_triosy_obj_iswt0),
      .i_sample_rsc_triosy_obj_ld_core_sct(i_sample_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core_b_rsci
// ------------------------------------------------------------------


module fir_filter_core_b_rsci (
  clk, rst, b_rsc_s_tdone, b_rsc_tr_write_done, b_rsc_RREADY, b_rsc_RVALID, b_rsc_RUSER,
      b_rsc_RLAST, b_rsc_RRESP, b_rsc_RDATA, b_rsc_RID, b_rsc_ARREADY, b_rsc_ARVALID,
      b_rsc_ARUSER, b_rsc_ARREGION, b_rsc_ARQOS, b_rsc_ARPROT, b_rsc_ARCACHE, b_rsc_ARLOCK,
      b_rsc_ARBURST, b_rsc_ARSIZE, b_rsc_ARLEN, b_rsc_ARADDR, b_rsc_ARID, b_rsc_BREADY,
      b_rsc_BVALID, b_rsc_BUSER, b_rsc_BRESP, b_rsc_BID, b_rsc_WREADY, b_rsc_WVALID,
      b_rsc_WUSER, b_rsc_WLAST, b_rsc_WSTRB, b_rsc_WDATA, b_rsc_AWREADY, b_rsc_AWVALID,
      b_rsc_AWUSER, b_rsc_AWREGION, b_rsc_AWQOS, b_rsc_AWPROT, b_rsc_AWCACHE, b_rsc_AWLOCK,
      b_rsc_AWBURST, b_rsc_AWSIZE, b_rsc_AWLEN, b_rsc_AWADDR, b_rsc_AWID, core_wen,
      b_rsci_oswt, b_rsci_wen_comp, b_rsci_s_raddr_core, b_rsci_s_din
);
  input clk;
  input rst;
  input b_rsc_s_tdone;
  input b_rsc_tr_write_done;
  input b_rsc_RREADY;
  output b_rsc_RVALID;
  output b_rsc_RUSER;
  output b_rsc_RLAST;
  output [1:0] b_rsc_RRESP;
  output [15:0] b_rsc_RDATA;
  output b_rsc_RID;
  output b_rsc_ARREADY;
  input b_rsc_ARVALID;
  input b_rsc_ARUSER;
  input [3:0] b_rsc_ARREGION;
  input [3:0] b_rsc_ARQOS;
  input [2:0] b_rsc_ARPROT;
  input [3:0] b_rsc_ARCACHE;
  input b_rsc_ARLOCK;
  input [1:0] b_rsc_ARBURST;
  input [2:0] b_rsc_ARSIZE;
  input [7:0] b_rsc_ARLEN;
  input [11:0] b_rsc_ARADDR;
  input b_rsc_ARID;
  input b_rsc_BREADY;
  output b_rsc_BVALID;
  output b_rsc_BUSER;
  output [1:0] b_rsc_BRESP;
  output b_rsc_BID;
  output b_rsc_WREADY;
  input b_rsc_WVALID;
  input b_rsc_WUSER;
  input b_rsc_WLAST;
  input [1:0] b_rsc_WSTRB;
  input [15:0] b_rsc_WDATA;
  output b_rsc_AWREADY;
  input b_rsc_AWVALID;
  input b_rsc_AWUSER;
  input [3:0] b_rsc_AWREGION;
  input [3:0] b_rsc_AWQOS;
  input [2:0] b_rsc_AWPROT;
  input [3:0] b_rsc_AWCACHE;
  input b_rsc_AWLOCK;
  input [1:0] b_rsc_AWBURST;
  input [2:0] b_rsc_AWSIZE;
  input [7:0] b_rsc_AWLEN;
  input [11:0] b_rsc_AWADDR;
  input b_rsc_AWID;
  input core_wen;
  input b_rsci_oswt;
  output b_rsci_wen_comp;
  input [6:0] b_rsci_s_raddr_core;
  output [9:0] b_rsci_s_din;


  // Interconnect Declarations
  wire b_rsci_biwt;
  wire b_rsci_bdwt;
  wire b_rsci_bcwt;
  wire b_rsci_s_re_core_sct;
  wire [6:0] b_rsci_s_raddr;
  wire b_rsci_s_rrdy;
  wire b_rsci_s_wrdy;
  wire b_rsc_is_idle;
  wire [15:0] b_rsci_s_din_pconst;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd127),
  .op_width(32'sd10),
  .cwidth(32'sd16),
  .addr_w(32'sd7),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd16),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) b_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(b_rsc_AWID),
      .AWADDR(b_rsc_AWADDR),
      .AWLEN(b_rsc_AWLEN),
      .AWSIZE(b_rsc_AWSIZE),
      .AWBURST(b_rsc_AWBURST),
      .AWLOCK(b_rsc_AWLOCK),
      .AWCACHE(b_rsc_AWCACHE),
      .AWPROT(b_rsc_AWPROT),
      .AWQOS(b_rsc_AWQOS),
      .AWREGION(b_rsc_AWREGION),
      .AWUSER(b_rsc_AWUSER),
      .AWVALID(b_rsc_AWVALID),
      .AWREADY(b_rsc_AWREADY),
      .WDATA(b_rsc_WDATA),
      .WSTRB(b_rsc_WSTRB),
      .WLAST(b_rsc_WLAST),
      .WUSER(b_rsc_WUSER),
      .WVALID(b_rsc_WVALID),
      .WREADY(b_rsc_WREADY),
      .BID(b_rsc_BID),
      .BRESP(b_rsc_BRESP),
      .BUSER(b_rsc_BUSER),
      .BVALID(b_rsc_BVALID),
      .BREADY(b_rsc_BREADY),
      .ARID(b_rsc_ARID),
      .ARADDR(b_rsc_ARADDR),
      .ARLEN(b_rsc_ARLEN),
      .ARSIZE(b_rsc_ARSIZE),
      .ARBURST(b_rsc_ARBURST),
      .ARLOCK(b_rsc_ARLOCK),
      .ARCACHE(b_rsc_ARCACHE),
      .ARPROT(b_rsc_ARPROT),
      .ARQOS(b_rsc_ARQOS),
      .ARREGION(b_rsc_ARREGION),
      .ARUSER(b_rsc_ARUSER),
      .ARVALID(b_rsc_ARVALID),
      .ARREADY(b_rsc_ARREADY),
      .RID(b_rsc_RID),
      .RDATA(b_rsc_RDATA),
      .RRESP(b_rsc_RRESP),
      .RLAST(b_rsc_RLAST),
      .RUSER(b_rsc_RUSER),
      .RVALID(b_rsc_RVALID),
      .RREADY(b_rsc_RREADY),
      .s_re(b_rsci_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(b_rsci_s_raddr),
      .s_waddr(7'b0000000),
      .s_din(b_rsci_s_din_pconst),
      .s_dout(16'b0000000000000000),
      .s_rrdy(b_rsci_s_rrdy),
      .s_wrdy(b_rsci_s_wrdy),
      .is_idle(b_rsc_is_idle),
      .tr_write_done(b_rsc_tr_write_done),
      .s_tdone(b_rsc_s_tdone)
    );
  fir_filter_core_b_rsci_b_rsc_wait_ctrl fir_filter_core_b_rsci_b_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .b_rsci_oswt(b_rsci_oswt),
      .b_rsci_biwt(b_rsci_biwt),
      .b_rsci_bdwt(b_rsci_bdwt),
      .b_rsci_bcwt(b_rsci_bcwt),
      .b_rsci_s_re_core_sct(b_rsci_s_re_core_sct),
      .b_rsci_s_rrdy(b_rsci_s_rrdy)
    );
  fir_filter_core_b_rsci_b_rsc_wait_dp fir_filter_core_b_rsci_b_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .b_rsci_oswt(b_rsci_oswt),
      .b_rsci_wen_comp(b_rsci_wen_comp),
      .b_rsci_s_raddr_core(b_rsci_s_raddr_core),
      .b_rsci_biwt(b_rsci_biwt),
      .b_rsci_bdwt(b_rsci_bdwt),
      .b_rsci_bcwt(b_rsci_bcwt),
      .b_rsci_s_raddr(b_rsci_s_raddr),
      .b_rsci_s_raddr_core_sct(b_rsci_s_re_core_sct)
    );
  assign b_rsci_s_din = b_rsci_s_din_pconst[9:0];
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter_core
// ------------------------------------------------------------------


module fir_filter_core (
  clk, rst, i_sample_rsc_dat, i_sample_rsc_triosy_lz, b_rsc_s_tdone, b_rsc_tr_write_done,
      b_rsc_RREADY, b_rsc_RVALID, b_rsc_RUSER, b_rsc_RLAST, b_rsc_RRESP, b_rsc_RDATA,
      b_rsc_RID, b_rsc_ARREADY, b_rsc_ARVALID, b_rsc_ARUSER, b_rsc_ARREGION, b_rsc_ARQOS,
      b_rsc_ARPROT, b_rsc_ARCACHE, b_rsc_ARLOCK, b_rsc_ARBURST, b_rsc_ARSIZE, b_rsc_ARLEN,
      b_rsc_ARADDR, b_rsc_ARID, b_rsc_BREADY, b_rsc_BVALID, b_rsc_BUSER, b_rsc_BRESP,
      b_rsc_BID, b_rsc_WREADY, b_rsc_WVALID, b_rsc_WUSER, b_rsc_WLAST, b_rsc_WSTRB,
      b_rsc_WDATA, b_rsc_AWREADY, b_rsc_AWVALID, b_rsc_AWUSER, b_rsc_AWREGION, b_rsc_AWQOS,
      b_rsc_AWPROT, b_rsc_AWCACHE, b_rsc_AWLOCK, b_rsc_AWBURST, b_rsc_AWSIZE, b_rsc_AWLEN,
      b_rsc_AWADDR, b_rsc_AWID, b_rsc_triosy_lz, y_rsc_dat, y_rsc_triosy_lz, x_rsci_clken_d,
      x_rsci_d_d, x_rsci_q_d, x_rsci_radr_d, x_rsci_wadr_d, x_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      x_rsci_we_d_pff
);
  input clk;
  input rst;
  input [2:0] i_sample_rsc_dat;
  output i_sample_rsc_triosy_lz;
  input b_rsc_s_tdone;
  input b_rsc_tr_write_done;
  input b_rsc_RREADY;
  output b_rsc_RVALID;
  output b_rsc_RUSER;
  output b_rsc_RLAST;
  output [1:0] b_rsc_RRESP;
  output [15:0] b_rsc_RDATA;
  output b_rsc_RID;
  output b_rsc_ARREADY;
  input b_rsc_ARVALID;
  input b_rsc_ARUSER;
  input [3:0] b_rsc_ARREGION;
  input [3:0] b_rsc_ARQOS;
  input [2:0] b_rsc_ARPROT;
  input [3:0] b_rsc_ARCACHE;
  input b_rsc_ARLOCK;
  input [1:0] b_rsc_ARBURST;
  input [2:0] b_rsc_ARSIZE;
  input [7:0] b_rsc_ARLEN;
  input [11:0] b_rsc_ARADDR;
  input b_rsc_ARID;
  input b_rsc_BREADY;
  output b_rsc_BVALID;
  output b_rsc_BUSER;
  output [1:0] b_rsc_BRESP;
  output b_rsc_BID;
  output b_rsc_WREADY;
  input b_rsc_WVALID;
  input b_rsc_WUSER;
  input b_rsc_WLAST;
  input [1:0] b_rsc_WSTRB;
  input [15:0] b_rsc_WDATA;
  output b_rsc_AWREADY;
  input b_rsc_AWVALID;
  input b_rsc_AWUSER;
  input [3:0] b_rsc_AWREGION;
  input [3:0] b_rsc_AWQOS;
  input [2:0] b_rsc_AWPROT;
  input [3:0] b_rsc_AWCACHE;
  input b_rsc_AWLOCK;
  input [1:0] b_rsc_AWBURST;
  input [2:0] b_rsc_AWSIZE;
  input [7:0] b_rsc_AWLEN;
  input [11:0] b_rsc_AWADDR;
  input b_rsc_AWID;
  output b_rsc_triosy_lz;
  output [8:0] y_rsc_dat;
  output y_rsc_triosy_lz;
  output x_rsci_clken_d;
  output [2:0] x_rsci_d_d;
  input [2:0] x_rsci_q_d;
  output [6:0] x_rsci_radr_d;
  output [6:0] x_rsci_wadr_d;
  output x_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output x_rsci_we_d_pff;


  // Interconnect Declarations
  wire [2:0] i_sample_rsci_idat;
  wire core_wten;
  wire b_rsci_wen_comp;
  reg [6:0] b_rsci_s_raddr_core;
  wire [9:0] b_rsci_s_din;
  reg y_rsci_idat_8;
  reg [6:0] y_rsci_idat_7_1;
  reg y_rsci_idat_0;
  wire [12:0] fsm_output;
  reg [19:0] sum_sva;
  reg MAC_LOOP_slc_MAC_LOOP_acc_7_itm;
  reg x_static_init_else_x_static_init_else_nor_itm;
  wire [14:0] slc_20_6_sats_sva_1;
  wire [15:0] nl_slc_20_6_sats_sva_1;
  reg reg_b_rsci_oswt_cse;
  reg reg_x_rsc_cgo_cse;
  reg reg_i_sample_rsc_triosy_obj_iswt0_cse;
  reg reg_y_rsc_triosy_obj_iswt0_cse;
  wire and_77_cse;
  wire MAC_LOOP_n_and_cse;
  wire or_24_cse;
  wire nor_10_rmff;
  reg [2:0] i_sample_sva;
  wire [6:0] z_out;
  wire [7:0] nl_z_out;
  reg [6:0] MAC_LOOP_n_6_0_sva_1;
  wire nor_ovfl_sva_1;
  wire and_unfl_sva_1;
  wire [9:0] MAC_LOOP_mux_rgt;
  reg [2:0] MAC_LOOP_slc_b_rsci_s_din_9_0_itm_9_7;
  reg [6:0] MAC_LOOP_slc_b_rsci_s_din_9_0_itm_6_0;

  wire[6:0] nor_5_nl;
  wire[6:0] x_static_init_else_mux1h_1_nl;
  wire[0:0] nor_8_nl;
  wire[7:0] SHIFT_LOOP_acc_nl;
  wire[8:0] nl_SHIFT_LOOP_acc_nl;
  wire[6:0] SHIFT_LOOP_mux_5_nl;
  wire[19:0] MAC_LOOP_acc_1_nl;
  wire[20:0] nl_MAC_LOOP_acc_1_nl;
  wire[12:0] MAC_LOOP_mul_nl;
  wire[0:0] sum_not_1_nl;
  wire[2:0] x_static_init_else_mux_1_nl;
  wire[0:0] x_static_init_else_or_nl;
  wire[0:0] x_static_init_else_or_1_nl;
  wire[6:0] x_static_init_else_x_static_init_else_mux_1_nl;
  wire[0:0] x_static_init_else_x_static_init_else_or_1_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [8:0] nl_y_rsci_idat;
  assign nl_y_rsci_idat = {y_rsci_idat_8 , y_rsci_idat_7_1 , y_rsci_idat_0};
  wire [0:0] nl_fir_filter_core_core_fsm_inst_x_vinit_C_1_tr0;
  assign nl_fir_filter_core_core_fsm_inst_x_vinit_C_1_tr0 = ~ x_static_init_else_x_static_init_else_nor_itm;
  wire [0:0] nl_fir_filter_core_core_fsm_inst_SHIFT_LOOP_C_2_tr0;
  assign nl_fir_filter_core_core_fsm_inst_SHIFT_LOOP_C_2_tr0 = ~ MAC_LOOP_slc_MAC_LOOP_acc_7_itm;
  wire [0:0] nl_fir_filter_core_core_fsm_inst_MAC_LOOP_C_1_tr0;
  assign nl_fir_filter_core_core_fsm_inst_MAC_LOOP_C_1_tr0 = ~ MAC_LOOP_slc_MAC_LOOP_acc_7_itm;
  ccs_in_v1 #(.rscid(32'sd1),
  .width(32'sd3)) i_sample_rsci (
      .dat(i_sample_rsc_dat),
      .idat(i_sample_rsci_idat)
    );
  ccs_out_v1 #(.rscid(32'sd3),
  .width(32'sd9)) y_rsci (
      .idat(nl_y_rsci_idat[8:0]),
      .dat(y_rsc_dat)
    );
  fir_filter_core_wait_dp fir_filter_core_wait_dp_inst (
      .x_rsc_cgo_iro(nor_10_rmff),
      .x_rsci_clken_d(x_rsci_clken_d),
      .core_wen(b_rsci_wen_comp),
      .x_rsc_cgo(reg_x_rsc_cgo_cse)
    );
  fir_filter_core_b_rsci fir_filter_core_b_rsci_inst (
      .clk(clk),
      .rst(rst),
      .b_rsc_s_tdone(b_rsc_s_tdone),
      .b_rsc_tr_write_done(b_rsc_tr_write_done),
      .b_rsc_RREADY(b_rsc_RREADY),
      .b_rsc_RVALID(b_rsc_RVALID),
      .b_rsc_RUSER(b_rsc_RUSER),
      .b_rsc_RLAST(b_rsc_RLAST),
      .b_rsc_RRESP(b_rsc_RRESP),
      .b_rsc_RDATA(b_rsc_RDATA),
      .b_rsc_RID(b_rsc_RID),
      .b_rsc_ARREADY(b_rsc_ARREADY),
      .b_rsc_ARVALID(b_rsc_ARVALID),
      .b_rsc_ARUSER(b_rsc_ARUSER),
      .b_rsc_ARREGION(b_rsc_ARREGION),
      .b_rsc_ARQOS(b_rsc_ARQOS),
      .b_rsc_ARPROT(b_rsc_ARPROT),
      .b_rsc_ARCACHE(b_rsc_ARCACHE),
      .b_rsc_ARLOCK(b_rsc_ARLOCK),
      .b_rsc_ARBURST(b_rsc_ARBURST),
      .b_rsc_ARSIZE(b_rsc_ARSIZE),
      .b_rsc_ARLEN(b_rsc_ARLEN),
      .b_rsc_ARADDR(b_rsc_ARADDR),
      .b_rsc_ARID(b_rsc_ARID),
      .b_rsc_BREADY(b_rsc_BREADY),
      .b_rsc_BVALID(b_rsc_BVALID),
      .b_rsc_BUSER(b_rsc_BUSER),
      .b_rsc_BRESP(b_rsc_BRESP),
      .b_rsc_BID(b_rsc_BID),
      .b_rsc_WREADY(b_rsc_WREADY),
      .b_rsc_WVALID(b_rsc_WVALID),
      .b_rsc_WUSER(b_rsc_WUSER),
      .b_rsc_WLAST(b_rsc_WLAST),
      .b_rsc_WSTRB(b_rsc_WSTRB),
      .b_rsc_WDATA(b_rsc_WDATA),
      .b_rsc_AWREADY(b_rsc_AWREADY),
      .b_rsc_AWVALID(b_rsc_AWVALID),
      .b_rsc_AWUSER(b_rsc_AWUSER),
      .b_rsc_AWREGION(b_rsc_AWREGION),
      .b_rsc_AWQOS(b_rsc_AWQOS),
      .b_rsc_AWPROT(b_rsc_AWPROT),
      .b_rsc_AWCACHE(b_rsc_AWCACHE),
      .b_rsc_AWLOCK(b_rsc_AWLOCK),
      .b_rsc_AWBURST(b_rsc_AWBURST),
      .b_rsc_AWSIZE(b_rsc_AWSIZE),
      .b_rsc_AWLEN(b_rsc_AWLEN),
      .b_rsc_AWADDR(b_rsc_AWADDR),
      .b_rsc_AWID(b_rsc_AWID),
      .core_wen(b_rsci_wen_comp),
      .b_rsci_oswt(reg_b_rsci_oswt_cse),
      .b_rsci_wen_comp(b_rsci_wen_comp),
      .b_rsci_s_raddr_core(b_rsci_s_raddr_core),
      .b_rsci_s_din(b_rsci_s_din)
    );
  fir_filter_core_i_sample_rsc_triosy_obj fir_filter_core_i_sample_rsc_triosy_obj_inst
      (
      .i_sample_rsc_triosy_lz(i_sample_rsc_triosy_lz),
      .core_wten(core_wten),
      .i_sample_rsc_triosy_obj_iswt0(reg_i_sample_rsc_triosy_obj_iswt0_cse)
    );
  fir_filter_core_b_rsc_triosy_obj fir_filter_core_b_rsc_triosy_obj_inst (
      .b_rsc_triosy_lz(b_rsc_triosy_lz),
      .core_wten(core_wten),
      .b_rsc_triosy_obj_iswt0(reg_i_sample_rsc_triosy_obj_iswt0_cse)
    );
  fir_filter_core_y_rsc_triosy_obj fir_filter_core_y_rsc_triosy_obj_inst (
      .y_rsc_triosy_lz(y_rsc_triosy_lz),
      .core_wten(core_wten),
      .y_rsc_triosy_obj_iswt0(reg_y_rsc_triosy_obj_iswt0_cse)
    );
  fir_filter_core_staller fir_filter_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wten(core_wten),
      .b_rsci_wen_comp(b_rsci_wen_comp)
    );
  fir_filter_core_core_fsm fir_filter_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .b_rsci_wen_comp(b_rsci_wen_comp),
      .fsm_output(fsm_output),
      .x_vinit_C_1_tr0(nl_fir_filter_core_core_fsm_inst_x_vinit_C_1_tr0[0:0]),
      .SHIFT_LOOP_C_2_tr0(nl_fir_filter_core_core_fsm_inst_SHIFT_LOOP_C_2_tr0[0:0]),
      .MAC_LOOP_C_1_tr0(nl_fir_filter_core_core_fsm_inst_MAC_LOOP_C_1_tr0[0:0])
    );
  assign nor_10_rmff = ~((fsm_output[3]) | (fsm_output[0]) | (fsm_output[12]) | (fsm_output[11]));
  assign or_24_cse = (fsm_output[4]) | (fsm_output[9]);
  assign and_77_cse = b_rsci_wen_comp & (fsm_output[11]);
  assign nor_8_nl = ~((fsm_output[4]) | (fsm_output[2]) | (fsm_output[6]) | (fsm_output[1]));
  assign x_static_init_else_mux1h_1_nl = MUX1HOT_v_7_3_2(7'b1111110, z_out, MAC_LOOP_n_6_0_sva_1,
      {nor_8_nl , (fsm_output[1]) , (fsm_output[6])});
  assign MAC_LOOP_mux_rgt = MUX_v_10_2_2(({3'b000 , x_static_init_else_mux1h_1_nl}),
      b_rsci_s_din, fsm_output[9]);
  assign MAC_LOOP_n_and_cse = b_rsci_wen_comp & or_24_cse;
  assign nl_slc_20_6_sats_sva_1 = conv_s2u_14_15(sum_sva[19:6]) + conv_u2u_1_15(sum_sva[5]);
  assign slc_20_6_sats_sva_1 = nl_slc_20_6_sats_sva_1[14:0];
  assign nor_ovfl_sva_1 = ~((slc_20_6_sats_sva_1[14]) | (~((slc_20_6_sats_sva_1[13:8]!=6'b000000))));
  assign and_unfl_sva_1 = (slc_20_6_sats_sva_1[14]) & (~((slc_20_6_sats_sva_1[13:8]==6'b111111)
      & ((slc_20_6_sats_sva_1[7:0]!=8'b00000000))));
  assign x_static_init_else_mux_1_nl = MUX_v_3_2_2(x_rsci_q_d, i_sample_sva, fsm_output[7]);
  assign x_static_init_else_or_nl = (fsm_output[5]) | (fsm_output[7]);
  assign x_rsci_d_d = MUX_v_3_2_2(3'b000, x_static_init_else_mux_1_nl, x_static_init_else_or_nl);
  assign x_rsci_radr_d = MUX_v_7_2_2(z_out, b_rsci_s_raddr_core, fsm_output[9]);
  assign x_static_init_else_or_1_nl = (fsm_output[5]) | (fsm_output[1]);
  assign x_rsci_wadr_d = MUX_v_7_2_2(7'b0000000, MAC_LOOP_slc_b_rsci_s_din_9_0_itm_6_0,
      x_static_init_else_or_1_nl);
  assign x_rsci_we_d_pff = (fsm_output[5]) | (fsm_output[1]) | (fsm_output[7]);
  assign x_rsci_readA_r_ram_ir_internal_RMASK_B_d = or_24_cse;
  always @(posedge clk) begin
    if ( b_rsci_wen_comp ) begin
      b_rsci_s_raddr_core <= MUX_v_7_2_2(7'b0000000, MAC_LOOP_n_6_0_sva_1, (fsm_output[10]));
      MAC_LOOP_slc_b_rsci_s_din_9_0_itm_9_7 <= MAC_LOOP_mux_rgt[9:7];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_b_rsci_oswt_cse <= 1'b0;
      reg_x_rsc_cgo_cse <= 1'b0;
      reg_i_sample_rsc_triosy_obj_iswt0_cse <= 1'b0;
      reg_y_rsc_triosy_obj_iswt0_cse <= 1'b0;
      x_static_init_else_x_static_init_else_nor_itm <= 1'b0;
    end
    else if ( b_rsci_wen_comp ) begin
      reg_b_rsci_oswt_cse <= (MAC_LOOP_slc_MAC_LOOP_acc_7_itm & (fsm_output[10]))
          | (fsm_output[8]);
      reg_x_rsc_cgo_cse <= nor_10_rmff;
      reg_i_sample_rsc_triosy_obj_iswt0_cse <= (~ MAC_LOOP_slc_MAC_LOOP_acc_7_itm)
          & (fsm_output[10]);
      reg_y_rsc_triosy_obj_iswt0_cse <= fsm_output[11];
      x_static_init_else_x_static_init_else_nor_itm <= ~((MAC_LOOP_slc_b_rsci_s_din_9_0_itm_6_0!=7'b0000000));
    end
  end
  always @(posedge clk) begin
    if ( and_77_cse ) begin
      y_rsci_idat_7_1 <= ~(MUX_v_7_2_2(nor_5_nl, 7'b1111111, and_unfl_sva_1));
      y_rsci_idat_0 <= (slc_20_6_sats_sva_1[0]) | nor_ovfl_sva_1 | and_unfl_sva_1;
      y_rsci_idat_8 <= slc_20_6_sats_sva_1[14];
    end
  end
  always @(posedge clk) begin
    if ( (~((fsm_output[2]) | (fsm_output[4]))) & b_rsci_wen_comp ) begin
      MAC_LOOP_slc_b_rsci_s_din_9_0_itm_6_0 <= MAC_LOOP_mux_rgt[6:0];
    end
  end
  always @(posedge clk) begin
    if ( b_rsci_wen_comp & (fsm_output[3]) ) begin
      i_sample_sva <= i_sample_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( MAC_LOOP_n_and_cse ) begin
      MAC_LOOP_n_6_0_sva_1 <= z_out;
      MAC_LOOP_slc_MAC_LOOP_acc_7_itm <= readslicef_8_1_7(SHIFT_LOOP_acc_nl);
    end
  end
  always @(posedge clk) begin
    if ( b_rsci_wen_comp & ((fsm_output[10]) | (fsm_output[8])) ) begin
      sum_sva <= MUX_v_20_2_2(20'b00000000000000000000, MAC_LOOP_acc_1_nl, sum_not_1_nl);
    end
  end
  assign nor_5_nl = ~(MUX_v_7_2_2((slc_20_6_sats_sva_1[7:1]), 7'b1111111, nor_ovfl_sva_1));
  assign SHIFT_LOOP_mux_5_nl = MUX_v_7_2_2((~ z_out), z_out, fsm_output[9]);
  assign nl_SHIFT_LOOP_acc_nl = ({1'b1 , SHIFT_LOOP_mux_5_nl}) + 8'b00000001;
  assign SHIFT_LOOP_acc_nl = nl_SHIFT_LOOP_acc_nl[7:0];
  assign MAC_LOOP_mul_nl = conv_s2u_13_13($signed((x_rsci_q_d)) * $signed(({MAC_LOOP_slc_b_rsci_s_din_9_0_itm_9_7
      , MAC_LOOP_slc_b_rsci_s_din_9_0_itm_6_0})));
  assign nl_MAC_LOOP_acc_1_nl = sum_sva + conv_s2s_13_20(MAC_LOOP_mul_nl);
  assign MAC_LOOP_acc_1_nl = nl_MAC_LOOP_acc_1_nl[19:0];
  assign sum_not_1_nl = ~ (fsm_output[8]);
  assign x_static_init_else_x_static_init_else_mux_1_nl = MUX_v_7_2_2(MAC_LOOP_slc_b_rsci_s_din_9_0_itm_6_0,
      b_rsci_s_raddr_core, fsm_output[9]);
  assign x_static_init_else_x_static_init_else_or_1_nl = (fsm_output[1]) | (fsm_output[4]);
  assign nl_z_out = x_static_init_else_x_static_init_else_mux_1_nl + conv_s2u_2_7({x_static_init_else_x_static_init_else_or_1_nl
      , 1'b1});
  assign z_out = nl_z_out[6:0];

  function automatic [6:0] MUX1HOT_v_7_3_2;
    input [6:0] input_2;
    input [6:0] input_1;
    input [6:0] input_0;
    input [2:0] sel;
    reg [6:0] result;
  begin
    result = input_0 & {7{sel[0]}};
    result = result | ( input_1 & {7{sel[1]}});
    result = result | ( input_2 & {7{sel[2]}});
    MUX1HOT_v_7_3_2 = result;
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


  function automatic [0:0] readslicef_8_1_7;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_8_1_7 = tmp[0:0];
  end
  endfunction


  function automatic [19:0] conv_s2s_13_20 ;
    input [12:0]  vector ;
  begin
    conv_s2s_13_20 = {{7{vector[12]}}, vector};
  end
  endfunction


  function automatic [6:0] conv_s2u_2_7 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_7 = {{5{vector[1]}}, vector};
  end
  endfunction


  function automatic [12:0] conv_s2u_13_13 ;
    input [12:0]  vector ;
  begin
    conv_s2u_13_13 = vector;
  end
  endfunction


  function automatic [14:0] conv_s2u_14_15 ;
    input [13:0]  vector ;
  begin
    conv_s2u_14_15 = {vector[13], vector};
  end
  endfunction


  function automatic [14:0] conv_u2u_1_15 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_15 = {{14{1'b0}}, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_filter
// ------------------------------------------------------------------


module fir_filter (
  clk, rst, i_sample_rsc_dat, i_sample_rsc_triosy_lz, b_rsc_s_tdone, b_rsc_tr_write_done,
      b_rsc_RREADY, b_rsc_RVALID, b_rsc_RUSER, b_rsc_RLAST, b_rsc_RRESP, b_rsc_RDATA,
      b_rsc_RID, b_rsc_ARREADY, b_rsc_ARVALID, b_rsc_ARUSER, b_rsc_ARREGION, b_rsc_ARQOS,
      b_rsc_ARPROT, b_rsc_ARCACHE, b_rsc_ARLOCK, b_rsc_ARBURST, b_rsc_ARSIZE, b_rsc_ARLEN,
      b_rsc_ARADDR, b_rsc_ARID, b_rsc_BREADY, b_rsc_BVALID, b_rsc_BUSER, b_rsc_BRESP,
      b_rsc_BID, b_rsc_WREADY, b_rsc_WVALID, b_rsc_WUSER, b_rsc_WLAST, b_rsc_WSTRB,
      b_rsc_WDATA, b_rsc_AWREADY, b_rsc_AWVALID, b_rsc_AWUSER, b_rsc_AWREGION, b_rsc_AWQOS,
      b_rsc_AWPROT, b_rsc_AWCACHE, b_rsc_AWLOCK, b_rsc_AWBURST, b_rsc_AWSIZE, b_rsc_AWLEN,
      b_rsc_AWADDR, b_rsc_AWID, b_rsc_triosy_lz, y_rsc_dat, y_rsc_triosy_lz
);
  input clk;
  input rst;
  input [2:0] i_sample_rsc_dat;
  output i_sample_rsc_triosy_lz;
  input b_rsc_s_tdone;
  input b_rsc_tr_write_done;
  input b_rsc_RREADY;
  output b_rsc_RVALID;
  output b_rsc_RUSER;
  output b_rsc_RLAST;
  output [1:0] b_rsc_RRESP;
  output [15:0] b_rsc_RDATA;
  output b_rsc_RID;
  output b_rsc_ARREADY;
  input b_rsc_ARVALID;
  input b_rsc_ARUSER;
  input [3:0] b_rsc_ARREGION;
  input [3:0] b_rsc_ARQOS;
  input [2:0] b_rsc_ARPROT;
  input [3:0] b_rsc_ARCACHE;
  input b_rsc_ARLOCK;
  input [1:0] b_rsc_ARBURST;
  input [2:0] b_rsc_ARSIZE;
  input [7:0] b_rsc_ARLEN;
  input [11:0] b_rsc_ARADDR;
  input b_rsc_ARID;
  input b_rsc_BREADY;
  output b_rsc_BVALID;
  output b_rsc_BUSER;
  output [1:0] b_rsc_BRESP;
  output b_rsc_BID;
  output b_rsc_WREADY;
  input b_rsc_WVALID;
  input b_rsc_WUSER;
  input b_rsc_WLAST;
  input [1:0] b_rsc_WSTRB;
  input [15:0] b_rsc_WDATA;
  output b_rsc_AWREADY;
  input b_rsc_AWVALID;
  input b_rsc_AWUSER;
  input [3:0] b_rsc_AWREGION;
  input [3:0] b_rsc_AWQOS;
  input [2:0] b_rsc_AWPROT;
  input [3:0] b_rsc_AWCACHE;
  input b_rsc_AWLOCK;
  input [1:0] b_rsc_AWBURST;
  input [2:0] b_rsc_AWSIZE;
  input [7:0] b_rsc_AWLEN;
  input [11:0] b_rsc_AWADDR;
  input b_rsc_AWID;
  output b_rsc_triosy_lz;
  output [8:0] y_rsc_dat;
  output y_rsc_triosy_lz;


  // Interconnect Declarations
  wire x_rsci_clken_d;
  wire [2:0] x_rsci_d_d;
  wire [2:0] x_rsci_q_d;
  wire [6:0] x_rsci_radr_d;
  wire [6:0] x_rsci_wadr_d;
  wire x_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire x_rsc_clken;
  wire [2:0] x_rsc_q;
  wire [6:0] x_rsc_radr;
  wire x_rsc_we;
  wire [2:0] x_rsc_d;
  wire [6:0] x_rsc_wadr;
  wire x_rsci_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  BLOCK_1R1W_RBW #(.addr_width(32'sd7),
  .data_width(32'sd3),
  .depth(32'sd127),
  .latency(32'sd1)) x_rsc_comp (
      .clk(clk),
      .clken(x_rsc_clken),
      .d(x_rsc_d),
      .q(x_rsc_q),
      .radr(x_rsc_radr),
      .wadr(x_rsc_wadr),
      .we(x_rsc_we)
    );
  fir_filter_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_4_7_3_127_127_3_1_gen x_rsci (
      .clken(x_rsc_clken),
      .q(x_rsc_q),
      .radr(x_rsc_radr),
      .we(x_rsc_we),
      .d(x_rsc_d),
      .wadr(x_rsc_wadr),
      .clken_d(x_rsci_clken_d),
      .d_d(x_rsci_d_d),
      .q_d(x_rsci_q_d),
      .radr_d(x_rsci_radr_d),
      .wadr_d(x_rsci_wadr_d),
      .we_d(x_rsci_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(x_rsci_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(x_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  fir_filter_core fir_filter_core_inst (
      .clk(clk),
      .rst(rst),
      .i_sample_rsc_dat(i_sample_rsc_dat),
      .i_sample_rsc_triosy_lz(i_sample_rsc_triosy_lz),
      .b_rsc_s_tdone(b_rsc_s_tdone),
      .b_rsc_tr_write_done(b_rsc_tr_write_done),
      .b_rsc_RREADY(b_rsc_RREADY),
      .b_rsc_RVALID(b_rsc_RVALID),
      .b_rsc_RUSER(b_rsc_RUSER),
      .b_rsc_RLAST(b_rsc_RLAST),
      .b_rsc_RRESP(b_rsc_RRESP),
      .b_rsc_RDATA(b_rsc_RDATA),
      .b_rsc_RID(b_rsc_RID),
      .b_rsc_ARREADY(b_rsc_ARREADY),
      .b_rsc_ARVALID(b_rsc_ARVALID),
      .b_rsc_ARUSER(b_rsc_ARUSER),
      .b_rsc_ARREGION(b_rsc_ARREGION),
      .b_rsc_ARQOS(b_rsc_ARQOS),
      .b_rsc_ARPROT(b_rsc_ARPROT),
      .b_rsc_ARCACHE(b_rsc_ARCACHE),
      .b_rsc_ARLOCK(b_rsc_ARLOCK),
      .b_rsc_ARBURST(b_rsc_ARBURST),
      .b_rsc_ARSIZE(b_rsc_ARSIZE),
      .b_rsc_ARLEN(b_rsc_ARLEN),
      .b_rsc_ARADDR(b_rsc_ARADDR),
      .b_rsc_ARID(b_rsc_ARID),
      .b_rsc_BREADY(b_rsc_BREADY),
      .b_rsc_BVALID(b_rsc_BVALID),
      .b_rsc_BUSER(b_rsc_BUSER),
      .b_rsc_BRESP(b_rsc_BRESP),
      .b_rsc_BID(b_rsc_BID),
      .b_rsc_WREADY(b_rsc_WREADY),
      .b_rsc_WVALID(b_rsc_WVALID),
      .b_rsc_WUSER(b_rsc_WUSER),
      .b_rsc_WLAST(b_rsc_WLAST),
      .b_rsc_WSTRB(b_rsc_WSTRB),
      .b_rsc_WDATA(b_rsc_WDATA),
      .b_rsc_AWREADY(b_rsc_AWREADY),
      .b_rsc_AWVALID(b_rsc_AWVALID),
      .b_rsc_AWUSER(b_rsc_AWUSER),
      .b_rsc_AWREGION(b_rsc_AWREGION),
      .b_rsc_AWQOS(b_rsc_AWQOS),
      .b_rsc_AWPROT(b_rsc_AWPROT),
      .b_rsc_AWCACHE(b_rsc_AWCACHE),
      .b_rsc_AWLOCK(b_rsc_AWLOCK),
      .b_rsc_AWBURST(b_rsc_AWBURST),
      .b_rsc_AWSIZE(b_rsc_AWSIZE),
      .b_rsc_AWLEN(b_rsc_AWLEN),
      .b_rsc_AWADDR(b_rsc_AWADDR),
      .b_rsc_AWID(b_rsc_AWID),
      .b_rsc_triosy_lz(b_rsc_triosy_lz),
      .y_rsc_dat(y_rsc_dat),
      .y_rsc_triosy_lz(y_rsc_triosy_lz),
      .x_rsci_clken_d(x_rsci_clken_d),
      .x_rsci_d_d(x_rsci_d_d),
      .x_rsci_q_d(x_rsci_q_d),
      .x_rsci_radr_d(x_rsci_radr_d),
      .x_rsci_wadr_d(x_rsci_wadr_d),
      .x_rsci_readA_r_ram_ir_internal_RMASK_B_d(x_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .x_rsci_we_d_pff(x_rsci_we_d_iff)
    );
endmodule



