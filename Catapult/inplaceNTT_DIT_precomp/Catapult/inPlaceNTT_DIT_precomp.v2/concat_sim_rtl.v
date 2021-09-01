
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
//  Generated date: Thu Aug 19 16:09:58 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_core_fsm (
  clk, rst, core_wen, fsm_output, COMP_LOOP_C_38_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input core_wen;
  output [43:0] fsm_output;
  reg [43:0] fsm_output;
  input COMP_LOOP_C_38_tr0;
  input VEC_LOOP_C_0_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_precomp_core_core_fsm_1
  parameter
    main_C_0 = 6'd0,
    STAGE_LOOP_C_0 = 6'd1,
    COMP_LOOP_C_0 = 6'd2,
    COMP_LOOP_C_1 = 6'd3,
    COMP_LOOP_C_2 = 6'd4,
    COMP_LOOP_C_3 = 6'd5,
    COMP_LOOP_C_4 = 6'd6,
    COMP_LOOP_C_5 = 6'd7,
    COMP_LOOP_C_6 = 6'd8,
    COMP_LOOP_C_7 = 6'd9,
    COMP_LOOP_C_8 = 6'd10,
    COMP_LOOP_C_9 = 6'd11,
    COMP_LOOP_C_10 = 6'd12,
    COMP_LOOP_C_11 = 6'd13,
    COMP_LOOP_C_12 = 6'd14,
    COMP_LOOP_C_13 = 6'd15,
    COMP_LOOP_C_14 = 6'd16,
    COMP_LOOP_C_15 = 6'd17,
    COMP_LOOP_C_16 = 6'd18,
    COMP_LOOP_C_17 = 6'd19,
    COMP_LOOP_C_18 = 6'd20,
    COMP_LOOP_C_19 = 6'd21,
    COMP_LOOP_C_20 = 6'd22,
    COMP_LOOP_C_21 = 6'd23,
    COMP_LOOP_C_22 = 6'd24,
    COMP_LOOP_C_23 = 6'd25,
    COMP_LOOP_C_24 = 6'd26,
    COMP_LOOP_C_25 = 6'd27,
    COMP_LOOP_C_26 = 6'd28,
    COMP_LOOP_C_27 = 6'd29,
    COMP_LOOP_C_28 = 6'd30,
    COMP_LOOP_C_29 = 6'd31,
    COMP_LOOP_C_30 = 6'd32,
    COMP_LOOP_C_31 = 6'd33,
    COMP_LOOP_C_32 = 6'd34,
    COMP_LOOP_C_33 = 6'd35,
    COMP_LOOP_C_34 = 6'd36,
    COMP_LOOP_C_35 = 6'd37,
    COMP_LOOP_C_36 = 6'd38,
    COMP_LOOP_C_37 = 6'd39,
    COMP_LOOP_C_38 = 6'd40,
    VEC_LOOP_C_0 = 6'd41,
    STAGE_LOOP_C_1 = 6'd42,
    main_C_1 = 6'd43;

  reg [5:0] state_var;
  reg [5:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIT_precomp_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 44'b00000000000000000000000000000000000000000010;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 44'b00000000000000000000000000000000000000000100;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 44'b00000000000000000000000000000000000000001000;
        state_var_NS = COMP_LOOP_C_2;
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 44'b00000000000000000000000000000000000000010000;
        state_var_NS = COMP_LOOP_C_3;
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 44'b00000000000000000000000000000000000000100000;
        state_var_NS = COMP_LOOP_C_4;
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 44'b00000000000000000000000000000000000001000000;
        state_var_NS = COMP_LOOP_C_5;
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 44'b00000000000000000000000000000000000010000000;
        state_var_NS = COMP_LOOP_C_6;
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 44'b00000000000000000000000000000000000100000000;
        state_var_NS = COMP_LOOP_C_7;
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 44'b00000000000000000000000000000000001000000000;
        state_var_NS = COMP_LOOP_C_8;
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 44'b00000000000000000000000000000000010000000000;
        state_var_NS = COMP_LOOP_C_9;
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 44'b00000000000000000000000000000000100000000000;
        state_var_NS = COMP_LOOP_C_10;
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 44'b00000000000000000000000000000001000000000000;
        state_var_NS = COMP_LOOP_C_11;
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 44'b00000000000000000000000000000010000000000000;
        state_var_NS = COMP_LOOP_C_12;
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 44'b00000000000000000000000000000100000000000000;
        state_var_NS = COMP_LOOP_C_13;
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 44'b00000000000000000000000000001000000000000000;
        state_var_NS = COMP_LOOP_C_14;
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 44'b00000000000000000000000000010000000000000000;
        state_var_NS = COMP_LOOP_C_15;
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 44'b00000000000000000000000000100000000000000000;
        state_var_NS = COMP_LOOP_C_16;
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 44'b00000000000000000000000001000000000000000000;
        state_var_NS = COMP_LOOP_C_17;
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 44'b00000000000000000000000010000000000000000000;
        state_var_NS = COMP_LOOP_C_18;
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 44'b00000000000000000000000100000000000000000000;
        state_var_NS = COMP_LOOP_C_19;
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 44'b00000000000000000000001000000000000000000000;
        state_var_NS = COMP_LOOP_C_20;
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 44'b00000000000000000000010000000000000000000000;
        state_var_NS = COMP_LOOP_C_21;
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 44'b00000000000000000000100000000000000000000000;
        state_var_NS = COMP_LOOP_C_22;
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 44'b00000000000000000001000000000000000000000000;
        state_var_NS = COMP_LOOP_C_23;
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 44'b00000000000000000010000000000000000000000000;
        state_var_NS = COMP_LOOP_C_24;
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 44'b00000000000000000100000000000000000000000000;
        state_var_NS = COMP_LOOP_C_25;
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 44'b00000000000000001000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_26;
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 44'b00000000000000010000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_27;
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 44'b00000000000000100000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_28;
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 44'b00000000000001000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_29;
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 44'b00000000000010000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_30;
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 44'b00000000000100000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_31;
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 44'b00000000001000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_32;
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 44'b00000000010000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_33;
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 44'b00000000100000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_34;
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 44'b00000001000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_35;
      end
      COMP_LOOP_C_35 : begin
        fsm_output = 44'b00000010000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_36;
      end
      COMP_LOOP_C_36 : begin
        fsm_output = 44'b00000100000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_37;
      end
      COMP_LOOP_C_37 : begin
        fsm_output = 44'b00001000000000000000000000000000000000000000;
        state_var_NS = COMP_LOOP_C_38;
      end
      COMP_LOOP_C_38 : begin
        fsm_output = 44'b00010000000000000000000000000000000000000000;
        if ( COMP_LOOP_C_38_tr0 ) begin
          state_var_NS = VEC_LOOP_C_0;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 44'b00100000000000000000000000000000000000000000;
        if ( VEC_LOOP_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 44'b01000000000000000000000000000000000000000000;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 44'b10000000000000000000000000000000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 44'b00000000000000000000000000000000000000000001;
        state_var_NS = STAGE_LOOP_C_0;
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
//  Design Unit:    inPlaceNTT_DIT_precomp_core_staller
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_staller (
  clk, rst, core_wen, core_wten, vec_rsci_wen_comp, vec_rsci_wen_comp_1, twiddle_rsci_wen_comp
);
  input clk;
  input rst;
  output core_wen;
  output core_wten;
  reg core_wten;
  input vec_rsci_wen_comp;
  input vec_rsci_wen_comp_1;
  input twiddle_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign core_wen = vec_rsci_wen_comp & vec_rsci_wen_comp_1 & twiddle_rsci_wen_comp;
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
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_obj_iswt0, twiddle_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_obj_iswt0;
  output twiddle_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_obj_ld_core_sct = twiddle_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl (
  core_wten, r_rsc_triosy_obj_iswt0, r_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input r_rsc_triosy_obj_iswt0;
  output r_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign r_rsc_triosy_obj_ld_core_sct = r_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl (
  core_wten, p_rsc_triosy_obj_iswt0, p_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input p_rsc_triosy_obj_iswt0;
  output p_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign p_rsc_triosy_obj_ld_core_sct = p_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl (
  core_wten, vec_rsc_triosy_obj_iswt0, vec_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_obj_iswt0;
  output vec_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_obj_ld_core_sct = vec_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_oswt, twiddle_rsci_wen_comp, twiddle_rsci_s_raddr_core,
      twiddle_rsci_s_din_mxwt, twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_bcwt,
      twiddle_rsci_s_raddr, twiddle_rsci_s_raddr_core_sct, twiddle_rsci_s_din
);
  input clk;
  input rst;
  input twiddle_rsci_oswt;
  output twiddle_rsci_wen_comp;
  input [9:0] twiddle_rsci_s_raddr_core;
  output [63:0] twiddle_rsci_s_din_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;
  output twiddle_rsci_bcwt;
  reg twiddle_rsci_bcwt;
  output [9:0] twiddle_rsci_s_raddr;
  input twiddle_rsci_s_raddr_core_sct;
  input [63:0] twiddle_rsci_s_din;


  // Interconnect Declarations
  reg [63:0] twiddle_rsci_s_din_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_wen_comp = (~ twiddle_rsci_oswt) | twiddle_rsci_biwt | twiddle_rsci_bcwt;
  assign twiddle_rsci_s_raddr = MUX_v_10_2_2(10'b0000000000, twiddle_rsci_s_raddr_core,
      twiddle_rsci_s_raddr_core_sct);
  assign twiddle_rsci_s_din_mxwt = MUX_v_64_2_2(twiddle_rsci_s_din, twiddle_rsci_s_din_bfwt,
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
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl (
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
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp (
  clk, rst, vec_rsci_oswt, vec_rsci_wen_comp, vec_rsci_oswt_1, vec_rsci_wen_comp_1,
      vec_rsci_s_raddr_core, vec_rsci_s_waddr_core, vec_rsci_s_din_mxwt, vec_rsci_s_dout_core,
      vec_rsci_biwt, vec_rsci_bdwt, vec_rsci_bcwt, vec_rsci_biwt_1, vec_rsci_bdwt_2,
      vec_rsci_bcwt_1, vec_rsci_s_raddr, vec_rsci_s_raddr_core_sct, vec_rsci_s_waddr,
      vec_rsci_s_waddr_core_sct, vec_rsci_s_din, vec_rsci_s_dout
);
  input clk;
  input rst;
  input vec_rsci_oswt;
  output vec_rsci_wen_comp;
  input vec_rsci_oswt_1;
  output vec_rsci_wen_comp_1;
  input [9:0] vec_rsci_s_raddr_core;
  input [9:0] vec_rsci_s_waddr_core;
  output [63:0] vec_rsci_s_din_mxwt;
  input [63:0] vec_rsci_s_dout_core;
  input vec_rsci_biwt;
  input vec_rsci_bdwt;
  output vec_rsci_bcwt;
  reg vec_rsci_bcwt;
  input vec_rsci_biwt_1;
  input vec_rsci_bdwt_2;
  output vec_rsci_bcwt_1;
  reg vec_rsci_bcwt_1;
  output [9:0] vec_rsci_s_raddr;
  input vec_rsci_s_raddr_core_sct;
  output [9:0] vec_rsci_s_waddr;
  input vec_rsci_s_waddr_core_sct;
  input [63:0] vec_rsci_s_din;
  output [63:0] vec_rsci_s_dout;


  // Interconnect Declarations
  reg [63:0] vec_rsci_s_din_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsci_wen_comp = (~ vec_rsci_oswt) | vec_rsci_biwt | vec_rsci_bcwt;
  assign vec_rsci_wen_comp_1 = (~ vec_rsci_oswt_1) | vec_rsci_biwt_1 | vec_rsci_bcwt_1;
  assign vec_rsci_s_raddr = MUX_v_10_2_2(10'b0000000000, vec_rsci_s_raddr_core, vec_rsci_s_raddr_core_sct);
  assign vec_rsci_s_waddr = MUX_v_10_2_2(10'b0000000000, vec_rsci_s_waddr_core, vec_rsci_s_waddr_core_sct);
  assign vec_rsci_s_din_mxwt = MUX_v_64_2_2(vec_rsci_s_din, vec_rsci_s_din_bfwt,
      vec_rsci_bcwt);
  assign vec_rsci_s_dout = MUX_v_64_2_2(64'b0000000000000000000000000000000000000000000000000000000000000000,
      vec_rsci_s_dout_core, vec_rsci_s_waddr_core_sct);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsci_bcwt <= 1'b0;
      vec_rsci_bcwt_1 <= 1'b0;
    end
    else begin
      vec_rsci_bcwt <= ~((~(vec_rsci_bcwt | vec_rsci_biwt)) | vec_rsci_bdwt);
      vec_rsci_bcwt_1 <= ~((~(vec_rsci_bcwt_1 | vec_rsci_biwt_1)) | vec_rsci_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsci_biwt ) begin
      vec_rsci_s_din_bfwt <= vec_rsci_s_din;
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
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl (
  core_wen, vec_rsci_oswt, vec_rsci_oswt_1, vec_rsci_biwt, vec_rsci_bdwt, vec_rsci_bcwt,
      vec_rsci_s_re_core_sct, vec_rsci_biwt_1, vec_rsci_bdwt_2, vec_rsci_bcwt_1,
      vec_rsci_s_we_core_sct, vec_rsci_s_rrdy, vec_rsci_s_wrdy
);
  input core_wen;
  input vec_rsci_oswt;
  input vec_rsci_oswt_1;
  output vec_rsci_biwt;
  output vec_rsci_bdwt;
  input vec_rsci_bcwt;
  output vec_rsci_s_re_core_sct;
  output vec_rsci_biwt_1;
  output vec_rsci_bdwt_2;
  input vec_rsci_bcwt_1;
  output vec_rsci_s_we_core_sct;
  input vec_rsci_s_rrdy;
  input vec_rsci_s_wrdy;


  // Interconnect Declarations
  wire vec_rsci_ogwt;
  wire vec_rsci_ogwt_1;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsci_bdwt = vec_rsci_oswt & core_wen;
  assign vec_rsci_biwt = vec_rsci_ogwt & vec_rsci_s_rrdy;
  assign vec_rsci_ogwt = vec_rsci_oswt & (~ vec_rsci_bcwt);
  assign vec_rsci_s_re_core_sct = vec_rsci_ogwt;
  assign vec_rsci_bdwt_2 = vec_rsci_oswt_1 & core_wen;
  assign vec_rsci_biwt_1 = vec_rsci_ogwt_1 & vec_rsci_s_wrdy;
  assign vec_rsci_ogwt_1 = vec_rsci_oswt_1 & (~ vec_rsci_bcwt_1);
  assign vec_rsci_s_we_core_sct = vec_rsci_ogwt_1;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj (
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
  inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
      inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(twiddle_rsc_triosy_obj_iswt0),
      .twiddle_rsc_triosy_obj_ld_core_sct(twiddle_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj (
  r_rsc_triosy_lz, core_wten, r_rsc_triosy_obj_iswt0
);
  output r_rsc_triosy_lz;
  input core_wten;
  input r_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire r_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(r_rsc_triosy_obj_ld_core_sct),
      .lz(r_rsc_triosy_lz)
    );
  inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(r_rsc_triosy_obj_iswt0),
      .r_rsc_triosy_obj_ld_core_sct(r_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj (
  p_rsc_triosy_lz, core_wten, p_rsc_triosy_obj_iswt0
);
  output p_rsc_triosy_lz;
  input core_wten;
  input p_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire p_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(p_rsc_triosy_obj_ld_core_sct),
      .lz(p_rsc_triosy_lz)
    );
  inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(p_rsc_triosy_obj_iswt0),
      .p_rsc_triosy_obj_ld_core_sct(p_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj (
  vec_rsc_triosy_lz, core_wten, vec_rsc_triosy_obj_iswt0
);
  output vec_rsc_triosy_lz;
  input core_wten;
  input vec_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_obj (
      .ld(vec_rsc_triosy_obj_ld_core_sct),
      .lz(vec_rsc_triosy_lz)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_obj_iswt0(vec_rsc_triosy_obj_iswt0),
      .vec_rsc_triosy_obj_ld_core_sct(vec_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci (
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
  output [63:0] twiddle_rsc_RDATA;
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
  input [7:0] twiddle_rsc_WSTRB;
  input [63:0] twiddle_rsc_WDATA;
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
  input [9:0] twiddle_rsci_s_raddr_core;
  output [63:0] twiddle_rsci_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire twiddle_rsci_bcwt;
  wire twiddle_rsci_s_re_core_sct;
  wire [9:0] twiddle_rsci_s_raddr;
  wire [63:0] twiddle_rsci_s_din;
  wire twiddle_rsci_s_rrdy;
  wire twiddle_rsci_s_wrdy;
  wire twiddle_rsc_is_idle;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd1024),
  .op_width(32'sd64),
  .cwidth(32'sd64),
  .addr_w(32'sd10),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd64),
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
      .s_waddr(10'b0000000000),
      .s_din(twiddle_rsci_s_din),
      .s_dout(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .s_rrdy(twiddle_rsci_s_rrdy),
      .s_wrdy(twiddle_rsci_s_wrdy),
      .is_idle(twiddle_rsc_is_idle),
      .tr_write_done(twiddle_rsc_tr_write_done),
      .s_tdone(twiddle_rsc_s_tdone)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_bcwt(twiddle_rsci_bcwt),
      .twiddle_rsci_s_re_core_sct(twiddle_rsci_s_re_core_sct),
      .twiddle_rsci_s_rrdy(twiddle_rsci_s_rrdy)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp inPlaceNTT_DIT_precomp_core_twiddle_rsci_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_wen_comp(twiddle_rsci_wen_comp),
      .twiddle_rsci_s_raddr_core(twiddle_rsci_s_raddr_core),
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
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsci (
  clk, rst, vec_rsc_s_tdone, vec_rsc_tr_write_done, vec_rsc_RREADY, vec_rsc_RVALID,
      vec_rsc_RUSER, vec_rsc_RLAST, vec_rsc_RRESP, vec_rsc_RDATA, vec_rsc_RID, vec_rsc_ARREADY,
      vec_rsc_ARVALID, vec_rsc_ARUSER, vec_rsc_ARREGION, vec_rsc_ARQOS, vec_rsc_ARPROT,
      vec_rsc_ARCACHE, vec_rsc_ARLOCK, vec_rsc_ARBURST, vec_rsc_ARSIZE, vec_rsc_ARLEN,
      vec_rsc_ARADDR, vec_rsc_ARID, vec_rsc_BREADY, vec_rsc_BVALID, vec_rsc_BUSER,
      vec_rsc_BRESP, vec_rsc_BID, vec_rsc_WREADY, vec_rsc_WVALID, vec_rsc_WUSER,
      vec_rsc_WLAST, vec_rsc_WSTRB, vec_rsc_WDATA, vec_rsc_AWREADY, vec_rsc_AWVALID,
      vec_rsc_AWUSER, vec_rsc_AWREGION, vec_rsc_AWQOS, vec_rsc_AWPROT, vec_rsc_AWCACHE,
      vec_rsc_AWLOCK, vec_rsc_AWBURST, vec_rsc_AWSIZE, vec_rsc_AWLEN, vec_rsc_AWADDR,
      vec_rsc_AWID, core_wen, vec_rsci_oswt, vec_rsci_wen_comp, vec_rsci_oswt_1,
      vec_rsci_wen_comp_1, vec_rsci_s_raddr_core, vec_rsci_s_waddr_core, vec_rsci_s_din_mxwt,
      vec_rsci_s_dout_core
);
  input clk;
  input rst;
  input vec_rsc_s_tdone;
  input vec_rsc_tr_write_done;
  input vec_rsc_RREADY;
  output vec_rsc_RVALID;
  output vec_rsc_RUSER;
  output vec_rsc_RLAST;
  output [1:0] vec_rsc_RRESP;
  output [63:0] vec_rsc_RDATA;
  output vec_rsc_RID;
  output vec_rsc_ARREADY;
  input vec_rsc_ARVALID;
  input vec_rsc_ARUSER;
  input [3:0] vec_rsc_ARREGION;
  input [3:0] vec_rsc_ARQOS;
  input [2:0] vec_rsc_ARPROT;
  input [3:0] vec_rsc_ARCACHE;
  input vec_rsc_ARLOCK;
  input [1:0] vec_rsc_ARBURST;
  input [2:0] vec_rsc_ARSIZE;
  input [7:0] vec_rsc_ARLEN;
  input [11:0] vec_rsc_ARADDR;
  input vec_rsc_ARID;
  input vec_rsc_BREADY;
  output vec_rsc_BVALID;
  output vec_rsc_BUSER;
  output [1:0] vec_rsc_BRESP;
  output vec_rsc_BID;
  output vec_rsc_WREADY;
  input vec_rsc_WVALID;
  input vec_rsc_WUSER;
  input vec_rsc_WLAST;
  input [7:0] vec_rsc_WSTRB;
  input [63:0] vec_rsc_WDATA;
  output vec_rsc_AWREADY;
  input vec_rsc_AWVALID;
  input vec_rsc_AWUSER;
  input [3:0] vec_rsc_AWREGION;
  input [3:0] vec_rsc_AWQOS;
  input [2:0] vec_rsc_AWPROT;
  input [3:0] vec_rsc_AWCACHE;
  input vec_rsc_AWLOCK;
  input [1:0] vec_rsc_AWBURST;
  input [2:0] vec_rsc_AWSIZE;
  input [7:0] vec_rsc_AWLEN;
  input [11:0] vec_rsc_AWADDR;
  input vec_rsc_AWID;
  input core_wen;
  input vec_rsci_oswt;
  output vec_rsci_wen_comp;
  input vec_rsci_oswt_1;
  output vec_rsci_wen_comp_1;
  input [9:0] vec_rsci_s_raddr_core;
  input [9:0] vec_rsci_s_waddr_core;
  output [63:0] vec_rsci_s_din_mxwt;
  input [63:0] vec_rsci_s_dout_core;


  // Interconnect Declarations
  wire vec_rsci_biwt;
  wire vec_rsci_bdwt;
  wire vec_rsci_bcwt;
  wire vec_rsci_s_re_core_sct;
  wire vec_rsci_biwt_1;
  wire vec_rsci_bdwt_2;
  wire vec_rsci_bcwt_1;
  wire vec_rsci_s_we_core_sct;
  wire [9:0] vec_rsci_s_raddr;
  wire [9:0] vec_rsci_s_waddr;
  wire [63:0] vec_rsci_s_din;
  wire [63:0] vec_rsci_s_dout;
  wire vec_rsci_s_rrdy;
  wire vec_rsci_s_wrdy;
  wire vec_rsc_is_idle_1;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd1024),
  .op_width(32'sd64),
  .cwidth(32'sd64),
  .addr_w(32'sd10),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd64),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) vec_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(vec_rsc_AWID),
      .AWADDR(vec_rsc_AWADDR),
      .AWLEN(vec_rsc_AWLEN),
      .AWSIZE(vec_rsc_AWSIZE),
      .AWBURST(vec_rsc_AWBURST),
      .AWLOCK(vec_rsc_AWLOCK),
      .AWCACHE(vec_rsc_AWCACHE),
      .AWPROT(vec_rsc_AWPROT),
      .AWQOS(vec_rsc_AWQOS),
      .AWREGION(vec_rsc_AWREGION),
      .AWUSER(vec_rsc_AWUSER),
      .AWVALID(vec_rsc_AWVALID),
      .AWREADY(vec_rsc_AWREADY),
      .WDATA(vec_rsc_WDATA),
      .WSTRB(vec_rsc_WSTRB),
      .WLAST(vec_rsc_WLAST),
      .WUSER(vec_rsc_WUSER),
      .WVALID(vec_rsc_WVALID),
      .WREADY(vec_rsc_WREADY),
      .BID(vec_rsc_BID),
      .BRESP(vec_rsc_BRESP),
      .BUSER(vec_rsc_BUSER),
      .BVALID(vec_rsc_BVALID),
      .BREADY(vec_rsc_BREADY),
      .ARID(vec_rsc_ARID),
      .ARADDR(vec_rsc_ARADDR),
      .ARLEN(vec_rsc_ARLEN),
      .ARSIZE(vec_rsc_ARSIZE),
      .ARBURST(vec_rsc_ARBURST),
      .ARLOCK(vec_rsc_ARLOCK),
      .ARCACHE(vec_rsc_ARCACHE),
      .ARPROT(vec_rsc_ARPROT),
      .ARQOS(vec_rsc_ARQOS),
      .ARREGION(vec_rsc_ARREGION),
      .ARUSER(vec_rsc_ARUSER),
      .ARVALID(vec_rsc_ARVALID),
      .ARREADY(vec_rsc_ARREADY),
      .RID(vec_rsc_RID),
      .RDATA(vec_rsc_RDATA),
      .RRESP(vec_rsc_RRESP),
      .RLAST(vec_rsc_RLAST),
      .RUSER(vec_rsc_RUSER),
      .RVALID(vec_rsc_RVALID),
      .RREADY(vec_rsc_RREADY),
      .s_re(vec_rsci_s_re_core_sct),
      .s_we(vec_rsci_s_we_core_sct),
      .s_raddr(vec_rsci_s_raddr),
      .s_waddr(vec_rsci_s_waddr),
      .s_din(vec_rsci_s_din),
      .s_dout(vec_rsci_s_dout),
      .s_rrdy(vec_rsci_s_rrdy),
      .s_wrdy(vec_rsci_s_wrdy),
      .is_idle(vec_rsc_is_idle_1),
      .tr_write_done(vec_rsc_tr_write_done),
      .s_tdone(vec_rsc_s_tdone)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .vec_rsci_oswt(vec_rsci_oswt),
      .vec_rsci_oswt_1(vec_rsci_oswt_1),
      .vec_rsci_biwt(vec_rsci_biwt),
      .vec_rsci_bdwt(vec_rsci_bdwt),
      .vec_rsci_bcwt(vec_rsci_bcwt),
      .vec_rsci_s_re_core_sct(vec_rsci_s_re_core_sct),
      .vec_rsci_biwt_1(vec_rsci_biwt_1),
      .vec_rsci_bdwt_2(vec_rsci_bdwt_2),
      .vec_rsci_bcwt_1(vec_rsci_bcwt_1),
      .vec_rsci_s_we_core_sct(vec_rsci_s_we_core_sct),
      .vec_rsci_s_rrdy(vec_rsci_s_rrdy),
      .vec_rsci_s_wrdy(vec_rsci_s_wrdy)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp inPlaceNTT_DIT_precomp_core_vec_rsci_vec_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsci_oswt(vec_rsci_oswt),
      .vec_rsci_wen_comp(vec_rsci_wen_comp),
      .vec_rsci_oswt_1(vec_rsci_oswt_1),
      .vec_rsci_wen_comp_1(vec_rsci_wen_comp_1),
      .vec_rsci_s_raddr_core(vec_rsci_s_raddr_core),
      .vec_rsci_s_waddr_core(vec_rsci_s_waddr_core),
      .vec_rsci_s_din_mxwt(vec_rsci_s_din_mxwt),
      .vec_rsci_s_dout_core(vec_rsci_s_dout_core),
      .vec_rsci_biwt(vec_rsci_biwt),
      .vec_rsci_bdwt(vec_rsci_bdwt),
      .vec_rsci_bcwt(vec_rsci_bcwt),
      .vec_rsci_biwt_1(vec_rsci_biwt_1),
      .vec_rsci_bdwt_2(vec_rsci_bdwt_2),
      .vec_rsci_bcwt_1(vec_rsci_bcwt_1),
      .vec_rsci_s_raddr(vec_rsci_s_raddr),
      .vec_rsci_s_raddr_core_sct(vec_rsci_s_re_core_sct),
      .vec_rsci_s_waddr(vec_rsci_s_waddr),
      .vec_rsci_s_waddr_core_sct(vec_rsci_s_we_core_sct),
      .vec_rsci_s_din(vec_rsci_s_din),
      .vec_rsci_s_dout(vec_rsci_s_dout)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core (
  clk, rst, vec_rsc_s_tdone, vec_rsc_tr_write_done, vec_rsc_RREADY, vec_rsc_RVALID,
      vec_rsc_RUSER, vec_rsc_RLAST, vec_rsc_RRESP, vec_rsc_RDATA, vec_rsc_RID, vec_rsc_ARREADY,
      vec_rsc_ARVALID, vec_rsc_ARUSER, vec_rsc_ARREGION, vec_rsc_ARQOS, vec_rsc_ARPROT,
      vec_rsc_ARCACHE, vec_rsc_ARLOCK, vec_rsc_ARBURST, vec_rsc_ARSIZE, vec_rsc_ARLEN,
      vec_rsc_ARADDR, vec_rsc_ARID, vec_rsc_BREADY, vec_rsc_BVALID, vec_rsc_BUSER,
      vec_rsc_BRESP, vec_rsc_BID, vec_rsc_WREADY, vec_rsc_WVALID, vec_rsc_WUSER,
      vec_rsc_WLAST, vec_rsc_WSTRB, vec_rsc_WDATA, vec_rsc_AWREADY, vec_rsc_AWVALID,
      vec_rsc_AWUSER, vec_rsc_AWREGION, vec_rsc_AWQOS, vec_rsc_AWPROT, vec_rsc_AWCACHE,
      vec_rsc_AWLOCK, vec_rsc_AWBURST, vec_rsc_AWSIZE, vec_rsc_AWLEN, vec_rsc_AWADDR,
      vec_rsc_AWID, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz,
      twiddle_rsc_s_tdone, twiddle_rsc_tr_write_done, twiddle_rsc_RREADY, twiddle_rsc_RVALID,
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
      twiddle_rsc_AWADDR, twiddle_rsc_AWID, twiddle_rsc_triosy_lz
);
  input clk;
  input rst;
  input vec_rsc_s_tdone;
  input vec_rsc_tr_write_done;
  input vec_rsc_RREADY;
  output vec_rsc_RVALID;
  output vec_rsc_RUSER;
  output vec_rsc_RLAST;
  output [1:0] vec_rsc_RRESP;
  output [63:0] vec_rsc_RDATA;
  output vec_rsc_RID;
  output vec_rsc_ARREADY;
  input vec_rsc_ARVALID;
  input vec_rsc_ARUSER;
  input [3:0] vec_rsc_ARREGION;
  input [3:0] vec_rsc_ARQOS;
  input [2:0] vec_rsc_ARPROT;
  input [3:0] vec_rsc_ARCACHE;
  input vec_rsc_ARLOCK;
  input [1:0] vec_rsc_ARBURST;
  input [2:0] vec_rsc_ARSIZE;
  input [7:0] vec_rsc_ARLEN;
  input [11:0] vec_rsc_ARADDR;
  input vec_rsc_ARID;
  input vec_rsc_BREADY;
  output vec_rsc_BVALID;
  output vec_rsc_BUSER;
  output [1:0] vec_rsc_BRESP;
  output vec_rsc_BID;
  output vec_rsc_WREADY;
  input vec_rsc_WVALID;
  input vec_rsc_WUSER;
  input vec_rsc_WLAST;
  input [7:0] vec_rsc_WSTRB;
  input [63:0] vec_rsc_WDATA;
  output vec_rsc_AWREADY;
  input vec_rsc_AWVALID;
  input vec_rsc_AWUSER;
  input [3:0] vec_rsc_AWREGION;
  input [3:0] vec_rsc_AWQOS;
  input [2:0] vec_rsc_AWPROT;
  input [3:0] vec_rsc_AWCACHE;
  input vec_rsc_AWLOCK;
  input [1:0] vec_rsc_AWBURST;
  input [2:0] vec_rsc_AWSIZE;
  input [7:0] vec_rsc_AWLEN;
  input [11:0] vec_rsc_AWADDR;
  input vec_rsc_AWID;
  output vec_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  input twiddle_rsc_s_tdone;
  input twiddle_rsc_tr_write_done;
  input twiddle_rsc_RREADY;
  output twiddle_rsc_RVALID;
  output twiddle_rsc_RUSER;
  output twiddle_rsc_RLAST;
  output [1:0] twiddle_rsc_RRESP;
  output [63:0] twiddle_rsc_RDATA;
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
  input [7:0] twiddle_rsc_WSTRB;
  input [63:0] twiddle_rsc_WDATA;
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


  // Interconnect Declarations
  wire core_wen;
  wire core_wten;
  wire vec_rsci_wen_comp;
  wire vec_rsci_wen_comp_1;
  reg [9:0] vec_rsci_s_raddr_core;
  reg [9:0] vec_rsci_s_waddr_core;
  wire [63:0] vec_rsci_s_din_mxwt;
  reg [63:0] vec_rsci_s_dout_core;
  wire [63:0] p_rsci_idat;
  wire twiddle_rsci_wen_comp;
  reg [9:0] twiddle_rsci_s_raddr_core;
  wire [63:0] twiddle_rsci_s_din_mxwt;
  wire [64:0] modulo_result_rem_cmp_z;
  reg [63:0] modulo_result_rem_cmp_a_63_0;
  reg [63:0] modulo_result_rem_cmp_b_63_0;
  wire [43:0] fsm_output;
  wire and_dcpl_4;
  reg exit_COMP_LOOP_sva;
  wire [10:0] VEC_LOOP_acc_1_psp_1;
  wire [11:0] nl_VEC_LOOP_acc_1_psp_1;
  reg reg_vec_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_1_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_vec_rsc_triosy_obj_iswt0_cse;
  wire COMP_LOOP_and_cse;
  wire COMP_LOOP_and_4_cse;
  wire [63:0] modulo_1_mux_cse;
  wire VEC_LOOP_j_or_cse;
  wire [9:0] z_out;
  wire [10:0] nl_z_out;
  wire [9:0] z_out_1;
  wire [63:0] z_out_2;
  wire [127:0] nl_z_out_2;
  reg [63:0] p_sva;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] STAGE_LOOP_lshift_psp_sva;
  reg [9:0] COMP_LOOP_acc_1_cse_sva;
  wire [10:0] nl_COMP_LOOP_acc_1_cse_sva;
  reg [63:0] factor1_sva;
  reg [63:0] COMP_LOOP_acc_8_itm;
  wire [64:0] nl_COMP_LOOP_acc_8_itm;
  reg [9:0] COMP_LOOP_slc_31_1_itm;
  reg [8:0] COMP_LOOP_k_9_0_sva_8_0;
  reg [63:0] COMP_LOOP_mul_psp;
  reg [63:0] COMP_LOOP_acc_5_psp;
  reg [9:0] VEC_LOOP_j_sva_9_0;
  wire [63:0] COMP_LOOP_acc_5_psp_mx0w2;
  wire [64:0] nl_COMP_LOOP_acc_5_psp_mx0w2;
  wire STAGE_LOOP_acc_itm_2_1;

  wire[9:0] COMP_LOOP_acc_10_nl;
  wire[11:0] nl_COMP_LOOP_acc_10_nl;
  wire[63:0] modulo_qelse_acc_nl;
  wire[64:0] nl_modulo_qelse_acc_nl;
  wire[0:0] or_48_nl;
  wire[0:0] or_50_nl;
  wire[0:0] or_51_nl;
  wire[0:0] VEC_LOOP_j_not_1_nl;
  wire[0:0] VEC_LOOP_j_not_nl;
  wire[9:0] COMP_LOOP_acc_nl;
  wire[10:0] nl_COMP_LOOP_acc_nl;
  wire[10:0] COMP_LOOP_acc_11_nl;
  wire[12:0] nl_COMP_LOOP_acc_11_nl;
  wire[2:0] STAGE_LOOP_acc_nl;
  wire[3:0] nl_STAGE_LOOP_acc_nl;
  wire[8:0] STAGE_LOOP_mux_2_nl;
  wire[63:0] COMP_LOOP_tmp_mux_3_nl;
  wire[63:0] COMP_LOOP_tmp_mux_4_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [64:0] nl_modulo_result_rem_cmp_a;
  assign nl_modulo_result_rem_cmp_a = {{1{modulo_result_rem_cmp_a_63_0[63]}}, modulo_result_rem_cmp_a_63_0};
  wire [64:0] nl_modulo_result_rem_cmp_b;
  assign nl_modulo_result_rem_cmp_b = {1'b0, modulo_result_rem_cmp_b_63_0};
  wire[3:0] COMP_LOOP_tmp_acc_nl;
  wire[4:0] nl_COMP_LOOP_tmp_acc_nl;
  wire [3:0] nl_COMP_LOOP_tmp_lshift_rg_s;
  assign nl_COMP_LOOP_tmp_acc_nl = (~ STAGE_LOOP_i_3_0_sva) + 4'b1011;
  assign COMP_LOOP_tmp_acc_nl = nl_COMP_LOOP_tmp_acc_nl[3:0];
  assign nl_COMP_LOOP_tmp_lshift_rg_s = MUX_v_4_2_2(COMP_LOOP_tmp_acc_nl, STAGE_LOOP_i_3_0_sva,
      fsm_output[1]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_VEC_LOOP_C_0_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_VEC_LOOP_C_0_tr0 = VEC_LOOP_acc_1_psp_1[10];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = ~ STAGE_LOOP_acc_itm_2_1;
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_rem #(.width_a(32'sd65),
  .width_b(32'sd65),
  .signd(32'sd1)) modulo_result_rem_cmp (
      .a(nl_modulo_result_rem_cmp_a[64:0]),
      .b(nl_modulo_result_rem_cmp_b[64:0]),
      .z(modulo_result_rem_cmp_z)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd10)) COMP_LOOP_tmp_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_tmp_lshift_rg_s[3:0]),
      .z(z_out_1)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsci inPlaceNTT_DIT_precomp_core_vec_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_s_tdone(vec_rsc_s_tdone),
      .vec_rsc_tr_write_done(vec_rsc_tr_write_done),
      .vec_rsc_RREADY(vec_rsc_RREADY),
      .vec_rsc_RVALID(vec_rsc_RVALID),
      .vec_rsc_RUSER(vec_rsc_RUSER),
      .vec_rsc_RLAST(vec_rsc_RLAST),
      .vec_rsc_RRESP(vec_rsc_RRESP),
      .vec_rsc_RDATA(vec_rsc_RDATA),
      .vec_rsc_RID(vec_rsc_RID),
      .vec_rsc_ARREADY(vec_rsc_ARREADY),
      .vec_rsc_ARVALID(vec_rsc_ARVALID),
      .vec_rsc_ARUSER(vec_rsc_ARUSER),
      .vec_rsc_ARREGION(vec_rsc_ARREGION),
      .vec_rsc_ARQOS(vec_rsc_ARQOS),
      .vec_rsc_ARPROT(vec_rsc_ARPROT),
      .vec_rsc_ARCACHE(vec_rsc_ARCACHE),
      .vec_rsc_ARLOCK(vec_rsc_ARLOCK),
      .vec_rsc_ARBURST(vec_rsc_ARBURST),
      .vec_rsc_ARSIZE(vec_rsc_ARSIZE),
      .vec_rsc_ARLEN(vec_rsc_ARLEN),
      .vec_rsc_ARADDR(vec_rsc_ARADDR),
      .vec_rsc_ARID(vec_rsc_ARID),
      .vec_rsc_BREADY(vec_rsc_BREADY),
      .vec_rsc_BVALID(vec_rsc_BVALID),
      .vec_rsc_BUSER(vec_rsc_BUSER),
      .vec_rsc_BRESP(vec_rsc_BRESP),
      .vec_rsc_BID(vec_rsc_BID),
      .vec_rsc_WREADY(vec_rsc_WREADY),
      .vec_rsc_WVALID(vec_rsc_WVALID),
      .vec_rsc_WUSER(vec_rsc_WUSER),
      .vec_rsc_WLAST(vec_rsc_WLAST),
      .vec_rsc_WSTRB(vec_rsc_WSTRB),
      .vec_rsc_WDATA(vec_rsc_WDATA),
      .vec_rsc_AWREADY(vec_rsc_AWREADY),
      .vec_rsc_AWVALID(vec_rsc_AWVALID),
      .vec_rsc_AWUSER(vec_rsc_AWUSER),
      .vec_rsc_AWREGION(vec_rsc_AWREGION),
      .vec_rsc_AWQOS(vec_rsc_AWQOS),
      .vec_rsc_AWPROT(vec_rsc_AWPROT),
      .vec_rsc_AWCACHE(vec_rsc_AWCACHE),
      .vec_rsc_AWLOCK(vec_rsc_AWLOCK),
      .vec_rsc_AWBURST(vec_rsc_AWBURST),
      .vec_rsc_AWSIZE(vec_rsc_AWSIZE),
      .vec_rsc_AWLEN(vec_rsc_AWLEN),
      .vec_rsc_AWADDR(vec_rsc_AWADDR),
      .vec_rsc_AWID(vec_rsc_AWID),
      .core_wen(core_wen),
      .vec_rsci_oswt(reg_vec_rsci_oswt_cse),
      .vec_rsci_wen_comp(vec_rsci_wen_comp),
      .vec_rsci_oswt_1(reg_vec_rsci_oswt_1_cse),
      .vec_rsci_wen_comp_1(vec_rsci_wen_comp_1),
      .vec_rsci_s_raddr_core(vec_rsci_s_raddr_core),
      .vec_rsci_s_waddr_core(vec_rsci_s_waddr_core),
      .vec_rsci_s_din_mxwt(vec_rsci_s_din_mxwt),
      .vec_rsci_s_dout_core(vec_rsci_s_dout_core)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci inPlaceNTT_DIT_precomp_core_twiddle_rsci_inst
      (
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
      .twiddle_rsci_s_raddr_core(twiddle_rsci_s_raddr_core),
      .twiddle_rsci_s_din_mxwt(twiddle_rsci_s_din_mxwt)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_inst
      (
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_inst
      (
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_inst
      (
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_inst
      (
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_staller inPlaceNTT_DIT_precomp_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsci_wen_comp(vec_rsci_wen_comp),
      .vec_rsci_wen_comp_1(vec_rsci_wen_comp_1),
      .twiddle_rsci_wen_comp(twiddle_rsci_wen_comp)
    );
  inPlaceNTT_DIT_precomp_core_core_fsm inPlaceNTT_DIT_precomp_core_core_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output),
      .COMP_LOOP_C_38_tr0(exit_COMP_LOOP_sva),
      .VEC_LOOP_C_0_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_VEC_LOOP_C_0_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign nl_modulo_qelse_acc_nl = (modulo_result_rem_cmp_z[63:0]) + p_sva;
  assign modulo_qelse_acc_nl = nl_modulo_qelse_acc_nl[63:0];
  assign modulo_1_mux_cse = MUX_v_64_2_2((modulo_result_rem_cmp_z[63:0]), modulo_qelse_acc_nl,
      modulo_result_rem_cmp_z[63]);
  assign VEC_LOOP_j_or_cse = (fsm_output[1]) | (fsm_output[41]);
  assign COMP_LOOP_and_cse = core_wen & (fsm_output[2]);
  assign COMP_LOOP_and_4_cse = core_wen & (fsm_output[15]);
  assign nl_COMP_LOOP_acc_5_psp_mx0w2 = factor1_sva + modulo_1_mux_cse;
  assign COMP_LOOP_acc_5_psp_mx0w2 = nl_COMP_LOOP_acc_5_psp_mx0w2[63:0];
  assign nl_VEC_LOOP_acc_1_psp_1 = conv_u2u_10_11(VEC_LOOP_j_sva_9_0) + conv_u2u_10_11(STAGE_LOOP_lshift_psp_sva);
  assign VEC_LOOP_acc_1_psp_1 = nl_VEC_LOOP_acc_1_psp_1[10:0];
  assign and_dcpl_4 = ~((fsm_output[43]) | (fsm_output[0]));
  assign nl_STAGE_LOOP_acc_nl = (z_out[3:1]) + 3'b011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[2:0];
  assign STAGE_LOOP_acc_itm_2_1 = readslicef_3_1_2(STAGE_LOOP_acc_nl);
  always @(posedge clk) begin
    if ( core_wen & (~ and_dcpl_4) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[42]) | (fsm_output[0])) ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, (z_out[3:0]), fsm_output[42]);
    end
  end
  always @(posedge clk) begin
    if ( core_wen ) begin
      vec_rsci_s_raddr_core <= MUX_v_10_2_2(COMP_LOOP_acc_10_nl, COMP_LOOP_acc_1_cse_sva,
          fsm_output[3]);
      vec_rsci_s_waddr_core <= MUX_v_10_2_2(COMP_LOOP_acc_1_cse_sva, COMP_LOOP_slc_31_1_itm,
          fsm_output[39]);
      vec_rsci_s_dout_core <= modulo_1_mux_cse;
      twiddle_rsci_s_raddr_core <= z_out_2[9:0];
      modulo_result_rem_cmp_a_63_0 <= MUX1HOT_v_64_5_2(z_out_2, COMP_LOOP_mul_psp,
          COMP_LOOP_acc_5_psp_mx0w2, COMP_LOOP_acc_5_psp, COMP_LOOP_acc_8_itm, {(fsm_output[3])
          , or_48_nl , (fsm_output[15]) , or_50_nl , or_51_nl});
      modulo_result_rem_cmp_b_63_0 <= p_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_vec_rsci_oswt_cse <= 1'b0;
      reg_vec_rsci_oswt_1_cse <= 1'b0;
      reg_twiddle_rsci_oswt_cse <= 1'b0;
      reg_vec_rsc_triosy_obj_iswt0_cse <= 1'b0;
    end
    else if ( core_wen ) begin
      reg_vec_rsci_oswt_cse <= (fsm_output[3:2]!=2'b00);
      reg_vec_rsci_oswt_1_cse <= (fsm_output[39]) | (fsm_output[27]);
      reg_twiddle_rsci_oswt_cse <= fsm_output[2];
      reg_vec_rsc_triosy_obj_iswt0_cse <= (~ STAGE_LOOP_acc_itm_2_1) & (fsm_output[42]);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & VEC_LOOP_j_or_cse ) begin
      VEC_LOOP_j_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (VEC_LOOP_acc_1_psp_1[9:0]),
          VEC_LOOP_j_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (~(and_dcpl_4 & (~ (fsm_output[42])) & (~ (fsm_output[1]))))
        ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out_1;
    end
  end
  always @(posedge clk) begin
    if ( ((fsm_output[42]) | (fsm_output[2]) | (fsm_output[0]) | (fsm_output[41])
        | (fsm_output[43]) | (fsm_output[1])) & core_wen ) begin
      COMP_LOOP_k_9_0_sva_8_0 <= MUX_v_9_2_2(9'b000000000, (z_out[8:0]), VEC_LOOP_j_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_and_cse ) begin
      COMP_LOOP_slc_31_1_itm <= readslicef_11_10_1(COMP_LOOP_acc_11_nl);
      COMP_LOOP_acc_1_cse_sva <= nl_COMP_LOOP_acc_1_cse_sva[9:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      exit_COMP_LOOP_sva <= 1'b0;
    end
    else if ( COMP_LOOP_and_cse ) begin
      exit_COMP_LOOP_sva <= ~ (readslicef_10_1_9(COMP_LOOP_acc_nl));
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (fsm_output[3]) ) begin
      COMP_LOOP_mul_psp <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (fsm_output[4]) ) begin
      factor1_sva <= vec_rsci_s_din_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_and_4_cse ) begin
      COMP_LOOP_acc_8_itm <= nl_COMP_LOOP_acc_8_itm[63:0];
      COMP_LOOP_acc_5_psp <= COMP_LOOP_acc_5_psp_mx0w2;
    end
  end
  assign nl_COMP_LOOP_acc_10_nl = VEC_LOOP_j_sva_9_0 + conv_u2u_9_10(COMP_LOOP_k_9_0_sva_8_0)
      + conv_u2u_9_10(STAGE_LOOP_lshift_psp_sva[9:1]);
  assign COMP_LOOP_acc_10_nl = nl_COMP_LOOP_acc_10_nl[9:0];
  assign or_48_nl = (fsm_output[14:4]!=11'b00000000000);
  assign or_50_nl = (fsm_output[26:16]!=11'b00000000000);
  assign or_51_nl = (fsm_output[38:27]!=12'b000000000000);
  assign VEC_LOOP_j_not_1_nl = ~ (fsm_output[1]);
  assign VEC_LOOP_j_not_nl = ~ VEC_LOOP_j_or_cse;
  assign nl_COMP_LOOP_acc_nl = z_out + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[9:1]))})
      + 10'b0000000001;
  assign COMP_LOOP_acc_nl = nl_COMP_LOOP_acc_nl[9:0];
  assign nl_COMP_LOOP_acc_11_nl = conv_u2u_10_11(VEC_LOOP_j_sva_9_0) + conv_u2u_9_11(COMP_LOOP_k_9_0_sva_8_0)
      + conv_u2u_10_11(STAGE_LOOP_lshift_psp_sva);
  assign COMP_LOOP_acc_11_nl = nl_COMP_LOOP_acc_11_nl[10:0];
  assign nl_COMP_LOOP_acc_1_cse_sva  = VEC_LOOP_j_sva_9_0 + conv_u2u_9_10(COMP_LOOP_k_9_0_sva_8_0);
  assign nl_COMP_LOOP_acc_8_itm  = factor1_sva - modulo_1_mux_cse;
  assign STAGE_LOOP_mux_2_nl = MUX_v_9_2_2(({5'b00000 , STAGE_LOOP_i_3_0_sva}), COMP_LOOP_k_9_0_sva_8_0,
      fsm_output[2]);
  assign nl_z_out = conv_u2u_9_10(STAGE_LOOP_mux_2_nl) + 10'b0000000001;
  assign z_out = nl_z_out[9:0];
  assign COMP_LOOP_tmp_mux_3_nl = MUX_v_64_2_2(({54'b000000000000000000000000000000000000000000000000000000
      , z_out_1}), twiddle_rsci_s_din_mxwt, fsm_output[3]);
  assign COMP_LOOP_tmp_mux_4_nl = MUX_v_64_2_2(({55'b0000000000000000000000000000000000000000000000000000000
      , COMP_LOOP_k_9_0_sva_8_0}), vec_rsci_s_din_mxwt, fsm_output[3]);
  assign nl_z_out_2 = COMP_LOOP_tmp_mux_3_nl * COMP_LOOP_tmp_mux_4_nl;
  assign z_out_2 = nl_z_out_2[63:0];

  function automatic [63:0] MUX1HOT_v_64_5_2;
    input [63:0] input_4;
    input [63:0] input_3;
    input [63:0] input_2;
    input [63:0] input_1;
    input [63:0] input_0;
    input [4:0] sel;
    reg [63:0] result;
  begin
    result = input_0 & {64{sel[0]}};
    result = result | ( input_1 & {64{sel[1]}});
    result = result | ( input_2 & {64{sel[2]}});
    result = result | ( input_3 & {64{sel[3]}});
    result = result | ( input_4 & {64{sel[4]}});
    MUX1HOT_v_64_5_2 = result;
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


  function automatic [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
  end
  endfunction


  function automatic [9:0] readslicef_11_10_1;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_11_10_1 = tmp[9:0];
  end
  endfunction


  function automatic [0:0] readslicef_3_1_2;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_3_1_2 = tmp[0:0];
  end
  endfunction


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
  end
  endfunction


  function automatic [10:0] conv_u2u_9_11 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_11 = {{2{1'b0}}, vector};
  end
  endfunction


  function automatic [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp (
  clk, rst, vec_rsc_s_tdone, vec_rsc_tr_write_done, vec_rsc_RREADY, vec_rsc_RVALID,
      vec_rsc_RUSER, vec_rsc_RLAST, vec_rsc_RRESP, vec_rsc_RDATA, vec_rsc_RID, vec_rsc_ARREADY,
      vec_rsc_ARVALID, vec_rsc_ARUSER, vec_rsc_ARREGION, vec_rsc_ARQOS, vec_rsc_ARPROT,
      vec_rsc_ARCACHE, vec_rsc_ARLOCK, vec_rsc_ARBURST, vec_rsc_ARSIZE, vec_rsc_ARLEN,
      vec_rsc_ARADDR, vec_rsc_ARID, vec_rsc_BREADY, vec_rsc_BVALID, vec_rsc_BUSER,
      vec_rsc_BRESP, vec_rsc_BID, vec_rsc_WREADY, vec_rsc_WVALID, vec_rsc_WUSER,
      vec_rsc_WLAST, vec_rsc_WSTRB, vec_rsc_WDATA, vec_rsc_AWREADY, vec_rsc_AWVALID,
      vec_rsc_AWUSER, vec_rsc_AWREGION, vec_rsc_AWQOS, vec_rsc_AWPROT, vec_rsc_AWCACHE,
      vec_rsc_AWLOCK, vec_rsc_AWBURST, vec_rsc_AWSIZE, vec_rsc_AWLEN, vec_rsc_AWADDR,
      vec_rsc_AWID, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz,
      twiddle_rsc_s_tdone, twiddle_rsc_tr_write_done, twiddle_rsc_RREADY, twiddle_rsc_RVALID,
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
      twiddle_rsc_AWADDR, twiddle_rsc_AWID, twiddle_rsc_triosy_lz
);
  input clk;
  input rst;
  input vec_rsc_s_tdone;
  input vec_rsc_tr_write_done;
  input vec_rsc_RREADY;
  output vec_rsc_RVALID;
  output vec_rsc_RUSER;
  output vec_rsc_RLAST;
  output [1:0] vec_rsc_RRESP;
  output [63:0] vec_rsc_RDATA;
  output vec_rsc_RID;
  output vec_rsc_ARREADY;
  input vec_rsc_ARVALID;
  input vec_rsc_ARUSER;
  input [3:0] vec_rsc_ARREGION;
  input [3:0] vec_rsc_ARQOS;
  input [2:0] vec_rsc_ARPROT;
  input [3:0] vec_rsc_ARCACHE;
  input vec_rsc_ARLOCK;
  input [1:0] vec_rsc_ARBURST;
  input [2:0] vec_rsc_ARSIZE;
  input [7:0] vec_rsc_ARLEN;
  input [11:0] vec_rsc_ARADDR;
  input vec_rsc_ARID;
  input vec_rsc_BREADY;
  output vec_rsc_BVALID;
  output vec_rsc_BUSER;
  output [1:0] vec_rsc_BRESP;
  output vec_rsc_BID;
  output vec_rsc_WREADY;
  input vec_rsc_WVALID;
  input vec_rsc_WUSER;
  input vec_rsc_WLAST;
  input [7:0] vec_rsc_WSTRB;
  input [63:0] vec_rsc_WDATA;
  output vec_rsc_AWREADY;
  input vec_rsc_AWVALID;
  input vec_rsc_AWUSER;
  input [3:0] vec_rsc_AWREGION;
  input [3:0] vec_rsc_AWQOS;
  input [2:0] vec_rsc_AWPROT;
  input [3:0] vec_rsc_AWCACHE;
  input vec_rsc_AWLOCK;
  input [1:0] vec_rsc_AWBURST;
  input [2:0] vec_rsc_AWSIZE;
  input [7:0] vec_rsc_AWLEN;
  input [11:0] vec_rsc_AWADDR;
  input vec_rsc_AWID;
  output vec_rsc_triosy_lz;
  input [63:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [63:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  input twiddle_rsc_s_tdone;
  input twiddle_rsc_tr_write_done;
  input twiddle_rsc_RREADY;
  output twiddle_rsc_RVALID;
  output twiddle_rsc_RUSER;
  output twiddle_rsc_RLAST;
  output [1:0] twiddle_rsc_RRESP;
  output [63:0] twiddle_rsc_RDATA;
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
  input [7:0] twiddle_rsc_WSTRB;
  input [63:0] twiddle_rsc_WDATA;
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



  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIT_precomp_core inPlaceNTT_DIT_precomp_core_inst (
      .clk(clk),
      .rst(rst),
      .vec_rsc_s_tdone(vec_rsc_s_tdone),
      .vec_rsc_tr_write_done(vec_rsc_tr_write_done),
      .vec_rsc_RREADY(vec_rsc_RREADY),
      .vec_rsc_RVALID(vec_rsc_RVALID),
      .vec_rsc_RUSER(vec_rsc_RUSER),
      .vec_rsc_RLAST(vec_rsc_RLAST),
      .vec_rsc_RRESP(vec_rsc_RRESP),
      .vec_rsc_RDATA(vec_rsc_RDATA),
      .vec_rsc_RID(vec_rsc_RID),
      .vec_rsc_ARREADY(vec_rsc_ARREADY),
      .vec_rsc_ARVALID(vec_rsc_ARVALID),
      .vec_rsc_ARUSER(vec_rsc_ARUSER),
      .vec_rsc_ARREGION(vec_rsc_ARREGION),
      .vec_rsc_ARQOS(vec_rsc_ARQOS),
      .vec_rsc_ARPROT(vec_rsc_ARPROT),
      .vec_rsc_ARCACHE(vec_rsc_ARCACHE),
      .vec_rsc_ARLOCK(vec_rsc_ARLOCK),
      .vec_rsc_ARBURST(vec_rsc_ARBURST),
      .vec_rsc_ARSIZE(vec_rsc_ARSIZE),
      .vec_rsc_ARLEN(vec_rsc_ARLEN),
      .vec_rsc_ARADDR(vec_rsc_ARADDR),
      .vec_rsc_ARID(vec_rsc_ARID),
      .vec_rsc_BREADY(vec_rsc_BREADY),
      .vec_rsc_BVALID(vec_rsc_BVALID),
      .vec_rsc_BUSER(vec_rsc_BUSER),
      .vec_rsc_BRESP(vec_rsc_BRESP),
      .vec_rsc_BID(vec_rsc_BID),
      .vec_rsc_WREADY(vec_rsc_WREADY),
      .vec_rsc_WVALID(vec_rsc_WVALID),
      .vec_rsc_WUSER(vec_rsc_WUSER),
      .vec_rsc_WLAST(vec_rsc_WLAST),
      .vec_rsc_WSTRB(vec_rsc_WSTRB),
      .vec_rsc_WDATA(vec_rsc_WDATA),
      .vec_rsc_AWREADY(vec_rsc_AWREADY),
      .vec_rsc_AWVALID(vec_rsc_AWVALID),
      .vec_rsc_AWUSER(vec_rsc_AWUSER),
      .vec_rsc_AWREGION(vec_rsc_AWREGION),
      .vec_rsc_AWQOS(vec_rsc_AWQOS),
      .vec_rsc_AWPROT(vec_rsc_AWPROT),
      .vec_rsc_AWCACHE(vec_rsc_AWCACHE),
      .vec_rsc_AWLOCK(vec_rsc_AWLOCK),
      .vec_rsc_AWBURST(vec_rsc_AWBURST),
      .vec_rsc_AWSIZE(vec_rsc_AWSIZE),
      .vec_rsc_AWLEN(vec_rsc_AWLEN),
      .vec_rsc_AWADDR(vec_rsc_AWADDR),
      .vec_rsc_AWID(vec_rsc_AWID),
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
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
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz)
    );
endmodule



