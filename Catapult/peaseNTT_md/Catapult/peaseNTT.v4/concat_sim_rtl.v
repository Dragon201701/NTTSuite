
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
//  Generated date: Thu Sep  9 23:30:51 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_30_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_30_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_29_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_29_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_28_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_28_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_27_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_27_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_26_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_26_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_25_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_25_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_24_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_24_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_23_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_23_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_22_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_22_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_21_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_21_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_20_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_20_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_19_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_19_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_18_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_18_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_17_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_17_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_16_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_16_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_15_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_15_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_6_32_64_64_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_6_32_64_64_32_1_gen (
  clken, q, radr, we, d, wadr, clken_d, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  output clken;
  input [31:0] q;
  output [5:0] radr;
  output we;
  output [31:0] d;
  output [5:0] wadr;
  input clken_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input [5:0] radr_d;
  input [5:0] wadr_d;
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
//  Design Unit:    peaseNTT_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module peaseNTT_core_core_fsm (
  clk, rst, core_wen, fsm_output, STAGE_LOOP_C_0_tr0, INNER_LOOP_C_0_tr0, cpyVec_for_C_0_tr0
);
  input clk;
  input rst;
  input core_wen;
  output [5:0] fsm_output;
  reg [5:0] fsm_output;
  input STAGE_LOOP_C_0_tr0;
  input INNER_LOOP_C_0_tr0;
  input cpyVec_for_C_0_tr0;


  // FSM State Type Declaration for peaseNTT_core_core_fsm_1
  parameter
    main_C_0 = 3'd0,
    STAGE_LOOP_C_0 = 3'd1,
    INNER_LOOP_C_0 = 3'd2,
    cpyVec_for_C_0 = 3'd3,
    STAGE_LOOP_C_1 = 3'd4,
    main_C_1 = 3'd5;

  reg [2:0] state_var;
  reg [2:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : peaseNTT_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 6'b000010;
        if ( STAGE_LOOP_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = INNER_LOOP_C_0;
        end
      end
      INNER_LOOP_C_0 : begin
        fsm_output = 6'b000100;
        if ( INNER_LOOP_C_0_tr0 ) begin
          state_var_NS = cpyVec_for_C_0;
        end
        else begin
          state_var_NS = INNER_LOOP_C_0;
        end
      end
      cpyVec_for_C_0 : begin
        fsm_output = 6'b001000;
        if ( cpyVec_for_C_0_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = cpyVec_for_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 6'b010000;
        state_var_NS = STAGE_LOOP_C_0;
      end
      main_C_1 : begin
        fsm_output = 6'b100000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 6'b000001;
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
//  Design Unit:    peaseNTT_core_staller
// ------------------------------------------------------------------


module peaseNTT_core_staller (
  clk, rst, core_wen, core_wten, twiddle_rsc_0_0_i_wen_comp, twiddle_rsc_0_1_i_wen_comp,
      twiddle_rsc_0_2_i_wen_comp, twiddle_rsc_0_3_i_wen_comp, twiddle_h_rsc_0_0_i_wen_comp,
      twiddle_h_rsc_0_1_i_wen_comp, twiddle_h_rsc_0_2_i_wen_comp, twiddle_h_rsc_0_3_i_wen_comp
);
  input clk;
  input rst;
  output core_wen;
  output core_wten;
  input twiddle_rsc_0_0_i_wen_comp;
  input twiddle_rsc_0_1_i_wen_comp;
  input twiddle_rsc_0_2_i_wen_comp;
  input twiddle_rsc_0_3_i_wen_comp;
  input twiddle_h_rsc_0_0_i_wen_comp;
  input twiddle_h_rsc_0_1_i_wen_comp;
  input twiddle_h_rsc_0_2_i_wen_comp;
  input twiddle_h_rsc_0_3_i_wen_comp;


  // Interconnect Declarations
  reg core_wten_reg;


  // Interconnect Declarations for Component Instantiations 
  assign core_wen = twiddle_rsc_0_0_i_wen_comp & twiddle_rsc_0_1_i_wen_comp & twiddle_rsc_0_2_i_wen_comp
      & twiddle_rsc_0_3_i_wen_comp & twiddle_h_rsc_0_0_i_wen_comp & twiddle_h_rsc_0_1_i_wen_comp
      & twiddle_h_rsc_0_2_i_wen_comp & twiddle_h_rsc_0_3_i_wen_comp;
  assign core_wten = core_wten_reg;
  always @(posedge clk) begin
    if ( rst ) begin
      core_wten_reg <= 1'b0;
    end
    else begin
      core_wten_reg <= ~ core_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_0_0_obj_twiddle_h_rsc_triosy_0_0_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_0_0_obj_twiddle_h_rsc_triosy_0_0_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_0_0_obj_iswt0, twiddle_h_rsc_triosy_0_0_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_0_0_obj_iswt0;
  output twiddle_h_rsc_triosy_0_0_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_0_0_obj_ld_core_sct = twiddle_h_rsc_triosy_0_0_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_0_1_obj_twiddle_h_rsc_triosy_0_1_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_0_1_obj_twiddle_h_rsc_triosy_0_1_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_0_1_obj_iswt0, twiddle_h_rsc_triosy_0_1_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_0_1_obj_iswt0;
  output twiddle_h_rsc_triosy_0_1_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_0_1_obj_ld_core_sct = twiddle_h_rsc_triosy_0_1_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_0_2_obj_twiddle_h_rsc_triosy_0_2_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_0_2_obj_twiddle_h_rsc_triosy_0_2_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_0_2_obj_iswt0, twiddle_h_rsc_triosy_0_2_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_0_2_obj_iswt0;
  output twiddle_h_rsc_triosy_0_2_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_0_2_obj_ld_core_sct = twiddle_h_rsc_triosy_0_2_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_0_3_obj_twiddle_h_rsc_triosy_0_3_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_0_3_obj_twiddle_h_rsc_triosy_0_3_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_0_3_obj_iswt0, twiddle_h_rsc_triosy_0_3_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_0_3_obj_iswt0;
  output twiddle_h_rsc_triosy_0_3_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_0_3_obj_ld_core_sct = twiddle_h_rsc_triosy_0_3_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_0_0_obj_twiddle_rsc_triosy_0_0_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_0_0_obj_twiddle_rsc_triosy_0_0_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_0_0_obj_iswt0, twiddle_rsc_triosy_0_0_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_0_0_obj_iswt0;
  output twiddle_rsc_triosy_0_0_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_0_0_obj_ld_core_sct = twiddle_rsc_triosy_0_0_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_0_1_obj_twiddle_rsc_triosy_0_1_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_0_1_obj_twiddle_rsc_triosy_0_1_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_0_1_obj_iswt0, twiddle_rsc_triosy_0_1_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_0_1_obj_iswt0;
  output twiddle_rsc_triosy_0_1_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_0_1_obj_ld_core_sct = twiddle_rsc_triosy_0_1_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_0_2_obj_twiddle_rsc_triosy_0_2_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_0_2_obj_twiddle_rsc_triosy_0_2_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_0_2_obj_iswt0, twiddle_rsc_triosy_0_2_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_0_2_obj_iswt0;
  output twiddle_rsc_triosy_0_2_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_0_2_obj_ld_core_sct = twiddle_rsc_triosy_0_2_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_0_3_obj_twiddle_rsc_triosy_0_3_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_0_3_obj_twiddle_rsc_triosy_0_3_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_0_3_obj_iswt0, twiddle_rsc_triosy_0_3_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_0_3_obj_iswt0;
  output twiddle_rsc_triosy_0_3_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_0_3_obj_ld_core_sct = twiddle_rsc_triosy_0_3_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl (
  core_wten, r_rsc_triosy_obj_iswt0, r_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input r_rsc_triosy_obj_iswt0;
  output r_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign r_rsc_triosy_obj_ld_core_sct = r_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl (
  core_wten, p_rsc_triosy_obj_iswt0, p_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input p_rsc_triosy_obj_iswt0;
  output p_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign p_rsc_triosy_obj_ld_core_sct = p_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_0_obj_xt_rsc_triosy_0_0_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_0_obj_xt_rsc_triosy_0_0_wait_ctrl (
  core_wten, xt_rsc_triosy_0_0_obj_iswt0, xt_rsc_triosy_0_0_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_0_0_obj_iswt0;
  output xt_rsc_triosy_0_0_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_0_0_obj_ld_core_sct = xt_rsc_triosy_0_0_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_1_obj_xt_rsc_triosy_0_1_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_1_obj_xt_rsc_triosy_0_1_wait_ctrl (
  core_wten, xt_rsc_triosy_0_1_obj_iswt0, xt_rsc_triosy_0_1_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_0_1_obj_iswt0;
  output xt_rsc_triosy_0_1_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_0_1_obj_ld_core_sct = xt_rsc_triosy_0_1_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_2_obj_xt_rsc_triosy_0_2_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_2_obj_xt_rsc_triosy_0_2_wait_ctrl (
  core_wten, xt_rsc_triosy_0_2_obj_iswt0, xt_rsc_triosy_0_2_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_0_2_obj_iswt0;
  output xt_rsc_triosy_0_2_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_0_2_obj_ld_core_sct = xt_rsc_triosy_0_2_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_3_obj_xt_rsc_triosy_0_3_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_3_obj_xt_rsc_triosy_0_3_wait_ctrl (
  core_wten, xt_rsc_triosy_0_3_obj_iswt0, xt_rsc_triosy_0_3_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_0_3_obj_iswt0;
  output xt_rsc_triosy_0_3_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_0_3_obj_ld_core_sct = xt_rsc_triosy_0_3_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_4_obj_xt_rsc_triosy_0_4_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_4_obj_xt_rsc_triosy_0_4_wait_ctrl (
  core_wten, xt_rsc_triosy_0_4_obj_iswt0, xt_rsc_triosy_0_4_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_0_4_obj_iswt0;
  output xt_rsc_triosy_0_4_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_0_4_obj_ld_core_sct = xt_rsc_triosy_0_4_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_5_obj_xt_rsc_triosy_0_5_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_5_obj_xt_rsc_triosy_0_5_wait_ctrl (
  core_wten, xt_rsc_triosy_0_5_obj_iswt0, xt_rsc_triosy_0_5_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_0_5_obj_iswt0;
  output xt_rsc_triosy_0_5_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_0_5_obj_ld_core_sct = xt_rsc_triosy_0_5_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_6_obj_xt_rsc_triosy_0_6_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_6_obj_xt_rsc_triosy_0_6_wait_ctrl (
  core_wten, xt_rsc_triosy_0_6_obj_iswt0, xt_rsc_triosy_0_6_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_0_6_obj_iswt0;
  output xt_rsc_triosy_0_6_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_0_6_obj_ld_core_sct = xt_rsc_triosy_0_6_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_7_obj_xt_rsc_triosy_0_7_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_7_obj_xt_rsc_triosy_0_7_wait_ctrl (
  core_wten, xt_rsc_triosy_0_7_obj_iswt0, xt_rsc_triosy_0_7_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_0_7_obj_iswt0;
  output xt_rsc_triosy_0_7_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_0_7_obj_ld_core_sct = xt_rsc_triosy_0_7_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp (
  clk, rst, twiddle_h_rsc_0_3_i_oswt, twiddle_h_rsc_0_3_i_wen_comp, twiddle_h_rsc_0_3_i_s_raddr_core,
      twiddle_h_rsc_0_3_i_s_din_mxwt, twiddle_h_rsc_0_3_i_biwt, twiddle_h_rsc_0_3_i_bdwt,
      twiddle_h_rsc_0_3_i_bcwt, twiddle_h_rsc_0_3_i_s_raddr, twiddle_h_rsc_0_3_i_s_raddr_core_sct,
      twiddle_h_rsc_0_3_i_s_din
);
  input clk;
  input rst;
  input twiddle_h_rsc_0_3_i_oswt;
  output twiddle_h_rsc_0_3_i_wen_comp;
  input [7:0] twiddle_h_rsc_0_3_i_s_raddr_core;
  output [31:0] twiddle_h_rsc_0_3_i_s_din_mxwt;
  input twiddle_h_rsc_0_3_i_biwt;
  input twiddle_h_rsc_0_3_i_bdwt;
  output twiddle_h_rsc_0_3_i_bcwt;
  reg twiddle_h_rsc_0_3_i_bcwt;
  output [7:0] twiddle_h_rsc_0_3_i_s_raddr;
  input twiddle_h_rsc_0_3_i_s_raddr_core_sct;
  input [31:0] twiddle_h_rsc_0_3_i_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_h_rsc_0_3_i_s_din_bfwt;

  wire[6:0] butterFly_3_tw_h_butterFly_3_tw_h_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_3_i_wen_comp = (~ twiddle_h_rsc_0_3_i_oswt) | twiddle_h_rsc_0_3_i_biwt
      | twiddle_h_rsc_0_3_i_bcwt;
  assign butterFly_3_tw_h_butterFly_3_tw_h_and_nl = MUX_v_7_2_2(7'b0000000, (twiddle_h_rsc_0_3_i_s_raddr_core[6:0]),
      twiddle_h_rsc_0_3_i_s_raddr_core_sct);
  assign twiddle_h_rsc_0_3_i_s_raddr = {1'b0, butterFly_3_tw_h_butterFly_3_tw_h_and_nl};
  assign twiddle_h_rsc_0_3_i_s_din_mxwt = MUX_v_32_2_2(twiddle_h_rsc_0_3_i_s_din,
      twiddle_h_rsc_0_3_i_s_din_bfwt, twiddle_h_rsc_0_3_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsc_0_3_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsc_0_3_i_bcwt <= ~((~(twiddle_h_rsc_0_3_i_bcwt | twiddle_h_rsc_0_3_i_biwt))
          | twiddle_h_rsc_0_3_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsc_0_3_i_biwt ) begin
      twiddle_h_rsc_0_3_i_s_din_bfwt <= twiddle_h_rsc_0_3_i_s_din;
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
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl (
  core_wen, twiddle_h_rsc_0_3_i_oswt, twiddle_h_rsc_0_3_i_biwt, twiddle_h_rsc_0_3_i_bdwt,
      twiddle_h_rsc_0_3_i_bcwt, twiddle_h_rsc_0_3_i_s_re_core_sct, twiddle_h_rsc_0_3_i_s_rrdy
);
  input core_wen;
  input twiddle_h_rsc_0_3_i_oswt;
  output twiddle_h_rsc_0_3_i_biwt;
  output twiddle_h_rsc_0_3_i_bdwt;
  input twiddle_h_rsc_0_3_i_bcwt;
  output twiddle_h_rsc_0_3_i_s_re_core_sct;
  input twiddle_h_rsc_0_3_i_s_rrdy;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_3_i_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_3_i_bdwt = twiddle_h_rsc_0_3_i_oswt & core_wen;
  assign twiddle_h_rsc_0_3_i_biwt = twiddle_h_rsc_0_3_i_ogwt & twiddle_h_rsc_0_3_i_s_rrdy;
  assign twiddle_h_rsc_0_3_i_ogwt = twiddle_h_rsc_0_3_i_oswt & (~ twiddle_h_rsc_0_3_i_bcwt);
  assign twiddle_h_rsc_0_3_i_s_re_core_sct = twiddle_h_rsc_0_3_i_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp (
  clk, rst, twiddle_h_rsc_0_2_i_oswt, twiddle_h_rsc_0_2_i_wen_comp, twiddle_h_rsc_0_2_i_s_raddr_core,
      twiddle_h_rsc_0_2_i_s_din_mxwt, twiddle_h_rsc_0_2_i_biwt, twiddle_h_rsc_0_2_i_bdwt,
      twiddle_h_rsc_0_2_i_bcwt, twiddle_h_rsc_0_2_i_s_raddr, twiddle_h_rsc_0_2_i_s_raddr_core_sct,
      twiddle_h_rsc_0_2_i_s_din
);
  input clk;
  input rst;
  input twiddle_h_rsc_0_2_i_oswt;
  output twiddle_h_rsc_0_2_i_wen_comp;
  input [7:0] twiddle_h_rsc_0_2_i_s_raddr_core;
  output [31:0] twiddle_h_rsc_0_2_i_s_din_mxwt;
  input twiddle_h_rsc_0_2_i_biwt;
  input twiddle_h_rsc_0_2_i_bdwt;
  output twiddle_h_rsc_0_2_i_bcwt;
  reg twiddle_h_rsc_0_2_i_bcwt;
  output [7:0] twiddle_h_rsc_0_2_i_s_raddr;
  input twiddle_h_rsc_0_2_i_s_raddr_core_sct;
  input [31:0] twiddle_h_rsc_0_2_i_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_h_rsc_0_2_i_s_din_bfwt;

  wire[6:0] butterFly_2_tw_h_butterFly_2_tw_h_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_2_i_wen_comp = (~ twiddle_h_rsc_0_2_i_oswt) | twiddle_h_rsc_0_2_i_biwt
      | twiddle_h_rsc_0_2_i_bcwt;
  assign butterFly_2_tw_h_butterFly_2_tw_h_and_nl = MUX_v_7_2_2(7'b0000000, (twiddle_h_rsc_0_2_i_s_raddr_core[6:0]),
      twiddle_h_rsc_0_2_i_s_raddr_core_sct);
  assign twiddle_h_rsc_0_2_i_s_raddr = {1'b0, butterFly_2_tw_h_butterFly_2_tw_h_and_nl};
  assign twiddle_h_rsc_0_2_i_s_din_mxwt = MUX_v_32_2_2(twiddle_h_rsc_0_2_i_s_din,
      twiddle_h_rsc_0_2_i_s_din_bfwt, twiddle_h_rsc_0_2_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsc_0_2_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsc_0_2_i_bcwt <= ~((~(twiddle_h_rsc_0_2_i_bcwt | twiddle_h_rsc_0_2_i_biwt))
          | twiddle_h_rsc_0_2_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsc_0_2_i_biwt ) begin
      twiddle_h_rsc_0_2_i_s_din_bfwt <= twiddle_h_rsc_0_2_i_s_din;
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
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl (
  core_wen, twiddle_h_rsc_0_2_i_oswt, twiddle_h_rsc_0_2_i_biwt, twiddle_h_rsc_0_2_i_bdwt,
      twiddle_h_rsc_0_2_i_bcwt, twiddle_h_rsc_0_2_i_s_re_core_sct, twiddle_h_rsc_0_2_i_s_rrdy
);
  input core_wen;
  input twiddle_h_rsc_0_2_i_oswt;
  output twiddle_h_rsc_0_2_i_biwt;
  output twiddle_h_rsc_0_2_i_bdwt;
  input twiddle_h_rsc_0_2_i_bcwt;
  output twiddle_h_rsc_0_2_i_s_re_core_sct;
  input twiddle_h_rsc_0_2_i_s_rrdy;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_2_i_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_2_i_bdwt = twiddle_h_rsc_0_2_i_oswt & core_wen;
  assign twiddle_h_rsc_0_2_i_biwt = twiddle_h_rsc_0_2_i_ogwt & twiddle_h_rsc_0_2_i_s_rrdy;
  assign twiddle_h_rsc_0_2_i_ogwt = twiddle_h_rsc_0_2_i_oswt & (~ twiddle_h_rsc_0_2_i_bcwt);
  assign twiddle_h_rsc_0_2_i_s_re_core_sct = twiddle_h_rsc_0_2_i_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp (
  clk, rst, twiddle_h_rsc_0_1_i_oswt, twiddle_h_rsc_0_1_i_wen_comp, twiddle_h_rsc_0_1_i_s_raddr_core,
      twiddle_h_rsc_0_1_i_s_din_mxwt, twiddle_h_rsc_0_1_i_biwt, twiddle_h_rsc_0_1_i_bdwt,
      twiddle_h_rsc_0_1_i_bcwt, twiddle_h_rsc_0_1_i_s_raddr, twiddle_h_rsc_0_1_i_s_raddr_core_sct,
      twiddle_h_rsc_0_1_i_s_din
);
  input clk;
  input rst;
  input twiddle_h_rsc_0_1_i_oswt;
  output twiddle_h_rsc_0_1_i_wen_comp;
  input [7:0] twiddle_h_rsc_0_1_i_s_raddr_core;
  output [31:0] twiddle_h_rsc_0_1_i_s_din_mxwt;
  input twiddle_h_rsc_0_1_i_biwt;
  input twiddle_h_rsc_0_1_i_bdwt;
  output twiddle_h_rsc_0_1_i_bcwt;
  reg twiddle_h_rsc_0_1_i_bcwt;
  output [7:0] twiddle_h_rsc_0_1_i_s_raddr;
  input twiddle_h_rsc_0_1_i_s_raddr_core_sct;
  input [31:0] twiddle_h_rsc_0_1_i_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_h_rsc_0_1_i_s_din_bfwt;

  wire[6:0] butterFly_1_tw_h_butterFly_1_tw_h_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_1_i_wen_comp = (~ twiddle_h_rsc_0_1_i_oswt) | twiddle_h_rsc_0_1_i_biwt
      | twiddle_h_rsc_0_1_i_bcwt;
  assign butterFly_1_tw_h_butterFly_1_tw_h_and_nl = MUX_v_7_2_2(7'b0000000, (twiddle_h_rsc_0_1_i_s_raddr_core[6:0]),
      twiddle_h_rsc_0_1_i_s_raddr_core_sct);
  assign twiddle_h_rsc_0_1_i_s_raddr = {1'b0, butterFly_1_tw_h_butterFly_1_tw_h_and_nl};
  assign twiddle_h_rsc_0_1_i_s_din_mxwt = MUX_v_32_2_2(twiddle_h_rsc_0_1_i_s_din,
      twiddle_h_rsc_0_1_i_s_din_bfwt, twiddle_h_rsc_0_1_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsc_0_1_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsc_0_1_i_bcwt <= ~((~(twiddle_h_rsc_0_1_i_bcwt | twiddle_h_rsc_0_1_i_biwt))
          | twiddle_h_rsc_0_1_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsc_0_1_i_biwt ) begin
      twiddle_h_rsc_0_1_i_s_din_bfwt <= twiddle_h_rsc_0_1_i_s_din;
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
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl (
  core_wen, twiddle_h_rsc_0_1_i_oswt, twiddle_h_rsc_0_1_i_biwt, twiddle_h_rsc_0_1_i_bdwt,
      twiddle_h_rsc_0_1_i_bcwt, twiddle_h_rsc_0_1_i_s_re_core_sct, twiddle_h_rsc_0_1_i_s_rrdy
);
  input core_wen;
  input twiddle_h_rsc_0_1_i_oswt;
  output twiddle_h_rsc_0_1_i_biwt;
  output twiddle_h_rsc_0_1_i_bdwt;
  input twiddle_h_rsc_0_1_i_bcwt;
  output twiddle_h_rsc_0_1_i_s_re_core_sct;
  input twiddle_h_rsc_0_1_i_s_rrdy;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_1_i_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_1_i_bdwt = twiddle_h_rsc_0_1_i_oswt & core_wen;
  assign twiddle_h_rsc_0_1_i_biwt = twiddle_h_rsc_0_1_i_ogwt & twiddle_h_rsc_0_1_i_s_rrdy;
  assign twiddle_h_rsc_0_1_i_ogwt = twiddle_h_rsc_0_1_i_oswt & (~ twiddle_h_rsc_0_1_i_bcwt);
  assign twiddle_h_rsc_0_1_i_s_re_core_sct = twiddle_h_rsc_0_1_i_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp (
  clk, rst, twiddle_h_rsc_0_0_i_oswt, twiddle_h_rsc_0_0_i_wen_comp, twiddle_h_rsc_0_0_i_s_raddr_core,
      twiddle_h_rsc_0_0_i_s_din_mxwt, twiddle_h_rsc_0_0_i_biwt, twiddle_h_rsc_0_0_i_bdwt,
      twiddle_h_rsc_0_0_i_bcwt, twiddle_h_rsc_0_0_i_s_raddr, twiddle_h_rsc_0_0_i_s_raddr_core_sct,
      twiddle_h_rsc_0_0_i_s_din
);
  input clk;
  input rst;
  input twiddle_h_rsc_0_0_i_oswt;
  output twiddle_h_rsc_0_0_i_wen_comp;
  input [7:0] twiddle_h_rsc_0_0_i_s_raddr_core;
  output [31:0] twiddle_h_rsc_0_0_i_s_din_mxwt;
  input twiddle_h_rsc_0_0_i_biwt;
  input twiddle_h_rsc_0_0_i_bdwt;
  output twiddle_h_rsc_0_0_i_bcwt;
  reg twiddle_h_rsc_0_0_i_bcwt;
  output [7:0] twiddle_h_rsc_0_0_i_s_raddr;
  input twiddle_h_rsc_0_0_i_s_raddr_core_sct;
  input [31:0] twiddle_h_rsc_0_0_i_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_h_rsc_0_0_i_s_din_bfwt;

  wire[6:0] butterFly_tw_h_butterFly_tw_h_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_0_i_wen_comp = (~ twiddle_h_rsc_0_0_i_oswt) | twiddle_h_rsc_0_0_i_biwt
      | twiddle_h_rsc_0_0_i_bcwt;
  assign butterFly_tw_h_butterFly_tw_h_and_nl = MUX_v_7_2_2(7'b0000000, (twiddle_h_rsc_0_0_i_s_raddr_core[6:0]),
      twiddle_h_rsc_0_0_i_s_raddr_core_sct);
  assign twiddle_h_rsc_0_0_i_s_raddr = {1'b0, butterFly_tw_h_butterFly_tw_h_and_nl};
  assign twiddle_h_rsc_0_0_i_s_din_mxwt = MUX_v_32_2_2(twiddle_h_rsc_0_0_i_s_din,
      twiddle_h_rsc_0_0_i_s_din_bfwt, twiddle_h_rsc_0_0_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsc_0_0_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsc_0_0_i_bcwt <= ~((~(twiddle_h_rsc_0_0_i_bcwt | twiddle_h_rsc_0_0_i_biwt))
          | twiddle_h_rsc_0_0_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsc_0_0_i_biwt ) begin
      twiddle_h_rsc_0_0_i_s_din_bfwt <= twiddle_h_rsc_0_0_i_s_din;
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
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl (
  core_wen, twiddle_h_rsc_0_0_i_oswt, twiddle_h_rsc_0_0_i_biwt, twiddle_h_rsc_0_0_i_bdwt,
      twiddle_h_rsc_0_0_i_bcwt, twiddle_h_rsc_0_0_i_s_re_core_sct, twiddle_h_rsc_0_0_i_s_rrdy
);
  input core_wen;
  input twiddle_h_rsc_0_0_i_oswt;
  output twiddle_h_rsc_0_0_i_biwt;
  output twiddle_h_rsc_0_0_i_bdwt;
  input twiddle_h_rsc_0_0_i_bcwt;
  output twiddle_h_rsc_0_0_i_s_re_core_sct;
  input twiddle_h_rsc_0_0_i_s_rrdy;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_0_i_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_0_i_bdwt = twiddle_h_rsc_0_0_i_oswt & core_wen;
  assign twiddle_h_rsc_0_0_i_biwt = twiddle_h_rsc_0_0_i_ogwt & twiddle_h_rsc_0_0_i_s_rrdy;
  assign twiddle_h_rsc_0_0_i_ogwt = twiddle_h_rsc_0_0_i_oswt & (~ twiddle_h_rsc_0_0_i_bcwt);
  assign twiddle_h_rsc_0_0_i_s_re_core_sct = twiddle_h_rsc_0_0_i_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp (
  clk, rst, twiddle_rsc_0_3_i_oswt, twiddle_rsc_0_3_i_wen_comp, twiddle_rsc_0_3_i_s_raddr_core,
      twiddle_rsc_0_3_i_s_din_mxwt, twiddle_rsc_0_3_i_biwt, twiddle_rsc_0_3_i_bdwt,
      twiddle_rsc_0_3_i_bcwt, twiddle_rsc_0_3_i_s_raddr, twiddle_rsc_0_3_i_s_raddr_core_sct,
      twiddle_rsc_0_3_i_s_din
);
  input clk;
  input rst;
  input twiddle_rsc_0_3_i_oswt;
  output twiddle_rsc_0_3_i_wen_comp;
  input [7:0] twiddle_rsc_0_3_i_s_raddr_core;
  output [31:0] twiddle_rsc_0_3_i_s_din_mxwt;
  input twiddle_rsc_0_3_i_biwt;
  input twiddle_rsc_0_3_i_bdwt;
  output twiddle_rsc_0_3_i_bcwt;
  reg twiddle_rsc_0_3_i_bcwt;
  output [7:0] twiddle_rsc_0_3_i_s_raddr;
  input twiddle_rsc_0_3_i_s_raddr_core_sct;
  input [31:0] twiddle_rsc_0_3_i_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_rsc_0_3_i_s_din_bfwt;

  wire[6:0] butterFly_3_tw_butterFly_3_tw_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_3_i_wen_comp = (~ twiddle_rsc_0_3_i_oswt) | twiddle_rsc_0_3_i_biwt
      | twiddle_rsc_0_3_i_bcwt;
  assign butterFly_3_tw_butterFly_3_tw_and_nl = MUX_v_7_2_2(7'b0000000, (twiddle_rsc_0_3_i_s_raddr_core[6:0]),
      twiddle_rsc_0_3_i_s_raddr_core_sct);
  assign twiddle_rsc_0_3_i_s_raddr = {1'b0, butterFly_3_tw_butterFly_3_tw_and_nl};
  assign twiddle_rsc_0_3_i_s_din_mxwt = MUX_v_32_2_2(twiddle_rsc_0_3_i_s_din, twiddle_rsc_0_3_i_s_din_bfwt,
      twiddle_rsc_0_3_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsc_0_3_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsc_0_3_i_bcwt <= ~((~(twiddle_rsc_0_3_i_bcwt | twiddle_rsc_0_3_i_biwt))
          | twiddle_rsc_0_3_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsc_0_3_i_biwt ) begin
      twiddle_rsc_0_3_i_s_din_bfwt <= twiddle_rsc_0_3_i_s_din;
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
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl (
  core_wen, twiddle_rsc_0_3_i_oswt, twiddle_rsc_0_3_i_biwt, twiddle_rsc_0_3_i_bdwt,
      twiddle_rsc_0_3_i_bcwt, twiddle_rsc_0_3_i_s_re_core_sct, twiddle_rsc_0_3_i_s_rrdy
);
  input core_wen;
  input twiddle_rsc_0_3_i_oswt;
  output twiddle_rsc_0_3_i_biwt;
  output twiddle_rsc_0_3_i_bdwt;
  input twiddle_rsc_0_3_i_bcwt;
  output twiddle_rsc_0_3_i_s_re_core_sct;
  input twiddle_rsc_0_3_i_s_rrdy;


  // Interconnect Declarations
  wire twiddle_rsc_0_3_i_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_3_i_bdwt = twiddle_rsc_0_3_i_oswt & core_wen;
  assign twiddle_rsc_0_3_i_biwt = twiddle_rsc_0_3_i_ogwt & twiddle_rsc_0_3_i_s_rrdy;
  assign twiddle_rsc_0_3_i_ogwt = twiddle_rsc_0_3_i_oswt & (~ twiddle_rsc_0_3_i_bcwt);
  assign twiddle_rsc_0_3_i_s_re_core_sct = twiddle_rsc_0_3_i_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp (
  clk, rst, twiddle_rsc_0_2_i_oswt, twiddle_rsc_0_2_i_wen_comp, twiddle_rsc_0_2_i_s_raddr_core,
      twiddle_rsc_0_2_i_s_din_mxwt, twiddle_rsc_0_2_i_biwt, twiddle_rsc_0_2_i_bdwt,
      twiddle_rsc_0_2_i_bcwt, twiddle_rsc_0_2_i_s_raddr, twiddle_rsc_0_2_i_s_raddr_core_sct,
      twiddle_rsc_0_2_i_s_din
);
  input clk;
  input rst;
  input twiddle_rsc_0_2_i_oswt;
  output twiddle_rsc_0_2_i_wen_comp;
  input [7:0] twiddle_rsc_0_2_i_s_raddr_core;
  output [31:0] twiddle_rsc_0_2_i_s_din_mxwt;
  input twiddle_rsc_0_2_i_biwt;
  input twiddle_rsc_0_2_i_bdwt;
  output twiddle_rsc_0_2_i_bcwt;
  reg twiddle_rsc_0_2_i_bcwt;
  output [7:0] twiddle_rsc_0_2_i_s_raddr;
  input twiddle_rsc_0_2_i_s_raddr_core_sct;
  input [31:0] twiddle_rsc_0_2_i_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_rsc_0_2_i_s_din_bfwt;

  wire[6:0] butterFly_2_tw_butterFly_2_tw_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_2_i_wen_comp = (~ twiddle_rsc_0_2_i_oswt) | twiddle_rsc_0_2_i_biwt
      | twiddle_rsc_0_2_i_bcwt;
  assign butterFly_2_tw_butterFly_2_tw_and_nl = MUX_v_7_2_2(7'b0000000, (twiddle_rsc_0_2_i_s_raddr_core[6:0]),
      twiddle_rsc_0_2_i_s_raddr_core_sct);
  assign twiddle_rsc_0_2_i_s_raddr = {1'b0, butterFly_2_tw_butterFly_2_tw_and_nl};
  assign twiddle_rsc_0_2_i_s_din_mxwt = MUX_v_32_2_2(twiddle_rsc_0_2_i_s_din, twiddle_rsc_0_2_i_s_din_bfwt,
      twiddle_rsc_0_2_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsc_0_2_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsc_0_2_i_bcwt <= ~((~(twiddle_rsc_0_2_i_bcwt | twiddle_rsc_0_2_i_biwt))
          | twiddle_rsc_0_2_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsc_0_2_i_biwt ) begin
      twiddle_rsc_0_2_i_s_din_bfwt <= twiddle_rsc_0_2_i_s_din;
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
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl (
  core_wen, twiddle_rsc_0_2_i_oswt, twiddle_rsc_0_2_i_biwt, twiddle_rsc_0_2_i_bdwt,
      twiddle_rsc_0_2_i_bcwt, twiddle_rsc_0_2_i_s_re_core_sct, twiddle_rsc_0_2_i_s_rrdy
);
  input core_wen;
  input twiddle_rsc_0_2_i_oswt;
  output twiddle_rsc_0_2_i_biwt;
  output twiddle_rsc_0_2_i_bdwt;
  input twiddle_rsc_0_2_i_bcwt;
  output twiddle_rsc_0_2_i_s_re_core_sct;
  input twiddle_rsc_0_2_i_s_rrdy;


  // Interconnect Declarations
  wire twiddle_rsc_0_2_i_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_2_i_bdwt = twiddle_rsc_0_2_i_oswt & core_wen;
  assign twiddle_rsc_0_2_i_biwt = twiddle_rsc_0_2_i_ogwt & twiddle_rsc_0_2_i_s_rrdy;
  assign twiddle_rsc_0_2_i_ogwt = twiddle_rsc_0_2_i_oswt & (~ twiddle_rsc_0_2_i_bcwt);
  assign twiddle_rsc_0_2_i_s_re_core_sct = twiddle_rsc_0_2_i_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp (
  clk, rst, twiddle_rsc_0_1_i_oswt, twiddle_rsc_0_1_i_wen_comp, twiddle_rsc_0_1_i_s_raddr_core,
      twiddle_rsc_0_1_i_s_din_mxwt, twiddle_rsc_0_1_i_biwt, twiddle_rsc_0_1_i_bdwt,
      twiddle_rsc_0_1_i_bcwt, twiddle_rsc_0_1_i_s_raddr, twiddle_rsc_0_1_i_s_raddr_core_sct,
      twiddle_rsc_0_1_i_s_din
);
  input clk;
  input rst;
  input twiddle_rsc_0_1_i_oswt;
  output twiddle_rsc_0_1_i_wen_comp;
  input [7:0] twiddle_rsc_0_1_i_s_raddr_core;
  output [31:0] twiddle_rsc_0_1_i_s_din_mxwt;
  input twiddle_rsc_0_1_i_biwt;
  input twiddle_rsc_0_1_i_bdwt;
  output twiddle_rsc_0_1_i_bcwt;
  reg twiddle_rsc_0_1_i_bcwt;
  output [7:0] twiddle_rsc_0_1_i_s_raddr;
  input twiddle_rsc_0_1_i_s_raddr_core_sct;
  input [31:0] twiddle_rsc_0_1_i_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_rsc_0_1_i_s_din_bfwt;

  wire[6:0] butterFly_1_tw_butterFly_1_tw_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_1_i_wen_comp = (~ twiddle_rsc_0_1_i_oswt) | twiddle_rsc_0_1_i_biwt
      | twiddle_rsc_0_1_i_bcwt;
  assign butterFly_1_tw_butterFly_1_tw_and_nl = MUX_v_7_2_2(7'b0000000, (twiddle_rsc_0_1_i_s_raddr_core[6:0]),
      twiddle_rsc_0_1_i_s_raddr_core_sct);
  assign twiddle_rsc_0_1_i_s_raddr = {1'b0, butterFly_1_tw_butterFly_1_tw_and_nl};
  assign twiddle_rsc_0_1_i_s_din_mxwt = MUX_v_32_2_2(twiddle_rsc_0_1_i_s_din, twiddle_rsc_0_1_i_s_din_bfwt,
      twiddle_rsc_0_1_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsc_0_1_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsc_0_1_i_bcwt <= ~((~(twiddle_rsc_0_1_i_bcwt | twiddle_rsc_0_1_i_biwt))
          | twiddle_rsc_0_1_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsc_0_1_i_biwt ) begin
      twiddle_rsc_0_1_i_s_din_bfwt <= twiddle_rsc_0_1_i_s_din;
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
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl (
  core_wen, twiddle_rsc_0_1_i_oswt, twiddle_rsc_0_1_i_biwt, twiddle_rsc_0_1_i_bdwt,
      twiddle_rsc_0_1_i_bcwt, twiddle_rsc_0_1_i_s_re_core_sct, twiddle_rsc_0_1_i_s_rrdy
);
  input core_wen;
  input twiddle_rsc_0_1_i_oswt;
  output twiddle_rsc_0_1_i_biwt;
  output twiddle_rsc_0_1_i_bdwt;
  input twiddle_rsc_0_1_i_bcwt;
  output twiddle_rsc_0_1_i_s_re_core_sct;
  input twiddle_rsc_0_1_i_s_rrdy;


  // Interconnect Declarations
  wire twiddle_rsc_0_1_i_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_1_i_bdwt = twiddle_rsc_0_1_i_oswt & core_wen;
  assign twiddle_rsc_0_1_i_biwt = twiddle_rsc_0_1_i_ogwt & twiddle_rsc_0_1_i_s_rrdy;
  assign twiddle_rsc_0_1_i_ogwt = twiddle_rsc_0_1_i_oswt & (~ twiddle_rsc_0_1_i_bcwt);
  assign twiddle_rsc_0_1_i_s_re_core_sct = twiddle_rsc_0_1_i_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp (
  clk, rst, twiddle_rsc_0_0_i_oswt, twiddle_rsc_0_0_i_wen_comp, twiddle_rsc_0_0_i_s_raddr_core,
      twiddle_rsc_0_0_i_s_din_mxwt, twiddle_rsc_0_0_i_biwt, twiddle_rsc_0_0_i_bdwt,
      twiddle_rsc_0_0_i_bcwt, twiddle_rsc_0_0_i_s_raddr, twiddle_rsc_0_0_i_s_raddr_core_sct,
      twiddle_rsc_0_0_i_s_din
);
  input clk;
  input rst;
  input twiddle_rsc_0_0_i_oswt;
  output twiddle_rsc_0_0_i_wen_comp;
  input [7:0] twiddle_rsc_0_0_i_s_raddr_core;
  output [31:0] twiddle_rsc_0_0_i_s_din_mxwt;
  input twiddle_rsc_0_0_i_biwt;
  input twiddle_rsc_0_0_i_bdwt;
  output twiddle_rsc_0_0_i_bcwt;
  reg twiddle_rsc_0_0_i_bcwt;
  output [7:0] twiddle_rsc_0_0_i_s_raddr;
  input twiddle_rsc_0_0_i_s_raddr_core_sct;
  input [31:0] twiddle_rsc_0_0_i_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_rsc_0_0_i_s_din_bfwt;

  wire[6:0] butterFly_tw_butterFly_tw_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_0_i_wen_comp = (~ twiddle_rsc_0_0_i_oswt) | twiddle_rsc_0_0_i_biwt
      | twiddle_rsc_0_0_i_bcwt;
  assign butterFly_tw_butterFly_tw_and_nl = MUX_v_7_2_2(7'b0000000, (twiddle_rsc_0_0_i_s_raddr_core[6:0]),
      twiddle_rsc_0_0_i_s_raddr_core_sct);
  assign twiddle_rsc_0_0_i_s_raddr = {1'b0, butterFly_tw_butterFly_tw_and_nl};
  assign twiddle_rsc_0_0_i_s_din_mxwt = MUX_v_32_2_2(twiddle_rsc_0_0_i_s_din, twiddle_rsc_0_0_i_s_din_bfwt,
      twiddle_rsc_0_0_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsc_0_0_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsc_0_0_i_bcwt <= ~((~(twiddle_rsc_0_0_i_bcwt | twiddle_rsc_0_0_i_biwt))
          | twiddle_rsc_0_0_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsc_0_0_i_biwt ) begin
      twiddle_rsc_0_0_i_s_din_bfwt <= twiddle_rsc_0_0_i_s_din;
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
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl (
  core_wen, twiddle_rsc_0_0_i_oswt, twiddle_rsc_0_0_i_biwt, twiddle_rsc_0_0_i_bdwt,
      twiddle_rsc_0_0_i_bcwt, twiddle_rsc_0_0_i_s_re_core_sct, twiddle_rsc_0_0_i_s_rrdy
);
  input core_wen;
  input twiddle_rsc_0_0_i_oswt;
  output twiddle_rsc_0_0_i_biwt;
  output twiddle_rsc_0_0_i_bdwt;
  input twiddle_rsc_0_0_i_bcwt;
  output twiddle_rsc_0_0_i_s_re_core_sct;
  input twiddle_rsc_0_0_i_s_rrdy;


  // Interconnect Declarations
  wire twiddle_rsc_0_0_i_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_0_i_bdwt = twiddle_rsc_0_0_i_oswt & core_wen;
  assign twiddle_rsc_0_0_i_biwt = twiddle_rsc_0_0_i_ogwt & twiddle_rsc_0_0_i_s_rrdy;
  assign twiddle_rsc_0_0_i_ogwt = twiddle_rsc_0_0_i_oswt & (~ twiddle_rsc_0_0_i_bcwt);
  assign twiddle_rsc_0_0_i_s_re_core_sct = twiddle_rsc_0_0_i_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp (
  clk, rst, xt_rsc_0_7_i_adra_d, xt_rsc_0_7_i_da_d, xt_rsc_0_7_i_qa_d, xt_rsc_0_7_i_adra_d_core,
      xt_rsc_0_7_i_da_d_core, xt_rsc_0_7_i_qa_d_mxwt, xt_rsc_0_7_i_biwt, xt_rsc_0_7_i_bdwt
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_7_i_adra_d;
  output [31:0] xt_rsc_0_7_i_da_d;
  input [63:0] xt_rsc_0_7_i_qa_d;
  input [13:0] xt_rsc_0_7_i_adra_d_core;
  input [63:0] xt_rsc_0_7_i_da_d_core;
  output [31:0] xt_rsc_0_7_i_qa_d_mxwt;
  input xt_rsc_0_7_i_biwt;
  input xt_rsc_0_7_i_bdwt;


  // Interconnect Declarations
  reg xt_rsc_0_7_i_bcwt;
  reg [31:0] xt_rsc_0_7_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_7_i_qa_d_mxwt = MUX_v_32_2_2((xt_rsc_0_7_i_qa_d[31:0]), xt_rsc_0_7_i_qa_d_bfwt_31_0,
      xt_rsc_0_7_i_bcwt);
  assign xt_rsc_0_7_i_adra_d = xt_rsc_0_7_i_adra_d_core[6:0];
  assign xt_rsc_0_7_i_da_d = xt_rsc_0_7_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsc_0_7_i_bcwt <= 1'b0;
    end
    else begin
      xt_rsc_0_7_i_bcwt <= ~((~(xt_rsc_0_7_i_bcwt | xt_rsc_0_7_i_biwt)) | xt_rsc_0_7_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsc_0_7_i_biwt ) begin
      xt_rsc_0_7_i_qa_d_bfwt_31_0 <= xt_rsc_0_7_i_qa_d[31:0];
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl (
  core_wen, core_wten, xt_rsc_0_7_i_oswt, xt_rsc_0_7_i_wea_d_core_psct, xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_7_i_biwt,
      xt_rsc_0_7_i_bdwt, xt_rsc_0_7_i_wea_d_core_sct, xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, xt_rsc_0_7_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input xt_rsc_0_7_i_oswt;
  input [1:0] xt_rsc_0_7_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output xt_rsc_0_7_i_biwt;
  output xt_rsc_0_7_i_bdwt;
  output [1:0] xt_rsc_0_7_i_wea_d_core_sct;
  output [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input xt_rsc_0_7_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_7_i_dswt_pff;

  wire[0:0] butterFly_3_f2_and_8_nl;
  wire[0:0] butterFly_3_f2_and_9_nl;
  wire[0:0] butterFly_3_f2_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_7_i_bdwt = xt_rsc_0_7_i_oswt & core_wen;
  assign xt_rsc_0_7_i_biwt = (~ core_wten) & xt_rsc_0_7_i_oswt;
  assign butterFly_3_f2_and_8_nl = (xt_rsc_0_7_i_wea_d_core_psct[0]) & xt_rsc_0_7_i_dswt_pff;
  assign xt_rsc_0_7_i_wea_d_core_sct = {1'b0 , butterFly_3_f2_and_8_nl};
  assign xt_rsc_0_7_i_dswt_pff = core_wen & xt_rsc_0_7_i_oswt_pff;
  assign butterFly_3_f2_and_9_nl = (xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & xt_rsc_0_7_i_dswt_pff;
  assign xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , butterFly_3_f2_and_9_nl};
  assign butterFly_3_f2_and_10_nl = (xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & xt_rsc_0_7_i_dswt_pff;
  assign xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , butterFly_3_f2_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp (
  clk, rst, xt_rsc_0_6_i_adra_d, xt_rsc_0_6_i_da_d, xt_rsc_0_6_i_qa_d, xt_rsc_0_6_i_adra_d_core,
      xt_rsc_0_6_i_da_d_core, xt_rsc_0_6_i_qa_d_mxwt, xt_rsc_0_6_i_biwt, xt_rsc_0_6_i_bdwt
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_6_i_adra_d;
  output [31:0] xt_rsc_0_6_i_da_d;
  input [63:0] xt_rsc_0_6_i_qa_d;
  input [13:0] xt_rsc_0_6_i_adra_d_core;
  input [63:0] xt_rsc_0_6_i_da_d_core;
  output [31:0] xt_rsc_0_6_i_qa_d_mxwt;
  input xt_rsc_0_6_i_biwt;
  input xt_rsc_0_6_i_bdwt;


  // Interconnect Declarations
  reg xt_rsc_0_6_i_bcwt;
  reg [31:0] xt_rsc_0_6_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_6_i_qa_d_mxwt = MUX_v_32_2_2((xt_rsc_0_6_i_qa_d[31:0]), xt_rsc_0_6_i_qa_d_bfwt_31_0,
      xt_rsc_0_6_i_bcwt);
  assign xt_rsc_0_6_i_adra_d = xt_rsc_0_6_i_adra_d_core[6:0];
  assign xt_rsc_0_6_i_da_d = xt_rsc_0_6_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsc_0_6_i_bcwt <= 1'b0;
    end
    else begin
      xt_rsc_0_6_i_bcwt <= ~((~(xt_rsc_0_6_i_bcwt | xt_rsc_0_6_i_biwt)) | xt_rsc_0_6_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsc_0_6_i_biwt ) begin
      xt_rsc_0_6_i_qa_d_bfwt_31_0 <= xt_rsc_0_6_i_qa_d[31:0];
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl (
  core_wen, core_wten, xt_rsc_0_6_i_oswt, xt_rsc_0_6_i_wea_d_core_psct, xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_6_i_biwt,
      xt_rsc_0_6_i_bdwt, xt_rsc_0_6_i_wea_d_core_sct, xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, xt_rsc_0_6_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input xt_rsc_0_6_i_oswt;
  input [1:0] xt_rsc_0_6_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output xt_rsc_0_6_i_biwt;
  output xt_rsc_0_6_i_bdwt;
  output [1:0] xt_rsc_0_6_i_wea_d_core_sct;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input xt_rsc_0_6_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_6_i_dswt_pff;

  wire[0:0] butterFly_3_f1_and_8_nl;
  wire[0:0] butterFly_3_f1_and_9_nl;
  wire[0:0] butterFly_3_f1_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_6_i_bdwt = xt_rsc_0_6_i_oswt & core_wen;
  assign xt_rsc_0_6_i_biwt = (~ core_wten) & xt_rsc_0_6_i_oswt;
  assign butterFly_3_f1_and_8_nl = (xt_rsc_0_6_i_wea_d_core_psct[0]) & xt_rsc_0_6_i_dswt_pff;
  assign xt_rsc_0_6_i_wea_d_core_sct = {1'b0 , butterFly_3_f1_and_8_nl};
  assign xt_rsc_0_6_i_dswt_pff = core_wen & xt_rsc_0_6_i_oswt_pff;
  assign butterFly_3_f1_and_9_nl = (xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & xt_rsc_0_6_i_dswt_pff;
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , butterFly_3_f1_and_9_nl};
  assign butterFly_3_f1_and_10_nl = (xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & xt_rsc_0_6_i_dswt_pff;
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , butterFly_3_f1_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp (
  clk, rst, xt_rsc_0_5_i_adra_d, xt_rsc_0_5_i_da_d, xt_rsc_0_5_i_qa_d, xt_rsc_0_5_i_adra_d_core,
      xt_rsc_0_5_i_da_d_core, xt_rsc_0_5_i_qa_d_mxwt, xt_rsc_0_5_i_biwt, xt_rsc_0_5_i_bdwt
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_5_i_adra_d;
  output [31:0] xt_rsc_0_5_i_da_d;
  input [63:0] xt_rsc_0_5_i_qa_d;
  input [13:0] xt_rsc_0_5_i_adra_d_core;
  input [63:0] xt_rsc_0_5_i_da_d_core;
  output [31:0] xt_rsc_0_5_i_qa_d_mxwt;
  input xt_rsc_0_5_i_biwt;
  input xt_rsc_0_5_i_bdwt;


  // Interconnect Declarations
  reg xt_rsc_0_5_i_bcwt;
  reg [31:0] xt_rsc_0_5_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_5_i_qa_d_mxwt = MUX_v_32_2_2((xt_rsc_0_5_i_qa_d[31:0]), xt_rsc_0_5_i_qa_d_bfwt_31_0,
      xt_rsc_0_5_i_bcwt);
  assign xt_rsc_0_5_i_adra_d = xt_rsc_0_5_i_adra_d_core[6:0];
  assign xt_rsc_0_5_i_da_d = xt_rsc_0_5_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsc_0_5_i_bcwt <= 1'b0;
    end
    else begin
      xt_rsc_0_5_i_bcwt <= ~((~(xt_rsc_0_5_i_bcwt | xt_rsc_0_5_i_biwt)) | xt_rsc_0_5_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsc_0_5_i_biwt ) begin
      xt_rsc_0_5_i_qa_d_bfwt_31_0 <= xt_rsc_0_5_i_qa_d[31:0];
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl (
  core_wen, core_wten, xt_rsc_0_5_i_oswt, xt_rsc_0_5_i_wea_d_core_psct, xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_5_i_biwt,
      xt_rsc_0_5_i_bdwt, xt_rsc_0_5_i_wea_d_core_sct, xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, xt_rsc_0_5_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input xt_rsc_0_5_i_oswt;
  input [1:0] xt_rsc_0_5_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output xt_rsc_0_5_i_biwt;
  output xt_rsc_0_5_i_bdwt;
  output [1:0] xt_rsc_0_5_i_wea_d_core_sct;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input xt_rsc_0_5_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_5_i_dswt_pff;

  wire[0:0] butterFly_2_f2_and_8_nl;
  wire[0:0] butterFly_2_f2_and_9_nl;
  wire[0:0] butterFly_2_f2_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_5_i_bdwt = xt_rsc_0_5_i_oswt & core_wen;
  assign xt_rsc_0_5_i_biwt = (~ core_wten) & xt_rsc_0_5_i_oswt;
  assign butterFly_2_f2_and_8_nl = (xt_rsc_0_5_i_wea_d_core_psct[0]) & xt_rsc_0_5_i_dswt_pff;
  assign xt_rsc_0_5_i_wea_d_core_sct = {1'b0 , butterFly_2_f2_and_8_nl};
  assign xt_rsc_0_5_i_dswt_pff = core_wen & xt_rsc_0_5_i_oswt_pff;
  assign butterFly_2_f2_and_9_nl = (xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & xt_rsc_0_5_i_dswt_pff;
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , butterFly_2_f2_and_9_nl};
  assign butterFly_2_f2_and_10_nl = (xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & xt_rsc_0_5_i_dswt_pff;
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , butterFly_2_f2_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp (
  clk, rst, xt_rsc_0_4_i_adra_d, xt_rsc_0_4_i_da_d, xt_rsc_0_4_i_qa_d, xt_rsc_0_4_i_adra_d_core,
      xt_rsc_0_4_i_da_d_core, xt_rsc_0_4_i_qa_d_mxwt, xt_rsc_0_4_i_biwt, xt_rsc_0_4_i_bdwt
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_4_i_adra_d;
  output [31:0] xt_rsc_0_4_i_da_d;
  input [63:0] xt_rsc_0_4_i_qa_d;
  input [13:0] xt_rsc_0_4_i_adra_d_core;
  input [63:0] xt_rsc_0_4_i_da_d_core;
  output [31:0] xt_rsc_0_4_i_qa_d_mxwt;
  input xt_rsc_0_4_i_biwt;
  input xt_rsc_0_4_i_bdwt;


  // Interconnect Declarations
  reg xt_rsc_0_4_i_bcwt;
  reg [31:0] xt_rsc_0_4_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_4_i_qa_d_mxwt = MUX_v_32_2_2((xt_rsc_0_4_i_qa_d[31:0]), xt_rsc_0_4_i_qa_d_bfwt_31_0,
      xt_rsc_0_4_i_bcwt);
  assign xt_rsc_0_4_i_adra_d = xt_rsc_0_4_i_adra_d_core[6:0];
  assign xt_rsc_0_4_i_da_d = xt_rsc_0_4_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsc_0_4_i_bcwt <= 1'b0;
    end
    else begin
      xt_rsc_0_4_i_bcwt <= ~((~(xt_rsc_0_4_i_bcwt | xt_rsc_0_4_i_biwt)) | xt_rsc_0_4_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsc_0_4_i_biwt ) begin
      xt_rsc_0_4_i_qa_d_bfwt_31_0 <= xt_rsc_0_4_i_qa_d[31:0];
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl (
  core_wen, core_wten, xt_rsc_0_4_i_oswt, xt_rsc_0_4_i_wea_d_core_psct, xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_4_i_biwt,
      xt_rsc_0_4_i_bdwt, xt_rsc_0_4_i_wea_d_core_sct, xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, xt_rsc_0_4_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input xt_rsc_0_4_i_oswt;
  input [1:0] xt_rsc_0_4_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output xt_rsc_0_4_i_biwt;
  output xt_rsc_0_4_i_bdwt;
  output [1:0] xt_rsc_0_4_i_wea_d_core_sct;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input xt_rsc_0_4_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_4_i_dswt_pff;

  wire[0:0] butterFly_2_f1_and_8_nl;
  wire[0:0] butterFly_2_f1_and_9_nl;
  wire[0:0] butterFly_2_f1_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_4_i_bdwt = xt_rsc_0_4_i_oswt & core_wen;
  assign xt_rsc_0_4_i_biwt = (~ core_wten) & xt_rsc_0_4_i_oswt;
  assign butterFly_2_f1_and_8_nl = (xt_rsc_0_4_i_wea_d_core_psct[0]) & xt_rsc_0_4_i_dswt_pff;
  assign xt_rsc_0_4_i_wea_d_core_sct = {1'b0 , butterFly_2_f1_and_8_nl};
  assign xt_rsc_0_4_i_dswt_pff = core_wen & xt_rsc_0_4_i_oswt_pff;
  assign butterFly_2_f1_and_9_nl = (xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & xt_rsc_0_4_i_dswt_pff;
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , butterFly_2_f1_and_9_nl};
  assign butterFly_2_f1_and_10_nl = (xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & xt_rsc_0_4_i_dswt_pff;
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , butterFly_2_f1_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp (
  clk, rst, xt_rsc_0_3_i_adra_d, xt_rsc_0_3_i_da_d, xt_rsc_0_3_i_qa_d, xt_rsc_0_3_i_adra_d_core,
      xt_rsc_0_3_i_da_d_core, xt_rsc_0_3_i_qa_d_mxwt, xt_rsc_0_3_i_biwt, xt_rsc_0_3_i_bdwt
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_3_i_adra_d;
  output [31:0] xt_rsc_0_3_i_da_d;
  input [63:0] xt_rsc_0_3_i_qa_d;
  input [13:0] xt_rsc_0_3_i_adra_d_core;
  input [63:0] xt_rsc_0_3_i_da_d_core;
  output [31:0] xt_rsc_0_3_i_qa_d_mxwt;
  input xt_rsc_0_3_i_biwt;
  input xt_rsc_0_3_i_bdwt;


  // Interconnect Declarations
  reg xt_rsc_0_3_i_bcwt;
  reg [31:0] xt_rsc_0_3_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_3_i_qa_d_mxwt = MUX_v_32_2_2((xt_rsc_0_3_i_qa_d[31:0]), xt_rsc_0_3_i_qa_d_bfwt_31_0,
      xt_rsc_0_3_i_bcwt);
  assign xt_rsc_0_3_i_adra_d = xt_rsc_0_3_i_adra_d_core[6:0];
  assign xt_rsc_0_3_i_da_d = xt_rsc_0_3_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsc_0_3_i_bcwt <= 1'b0;
    end
    else begin
      xt_rsc_0_3_i_bcwt <= ~((~(xt_rsc_0_3_i_bcwt | xt_rsc_0_3_i_biwt)) | xt_rsc_0_3_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsc_0_3_i_biwt ) begin
      xt_rsc_0_3_i_qa_d_bfwt_31_0 <= xt_rsc_0_3_i_qa_d[31:0];
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl (
  core_wen, core_wten, xt_rsc_0_3_i_oswt, xt_rsc_0_3_i_wea_d_core_psct, xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_3_i_biwt,
      xt_rsc_0_3_i_bdwt, xt_rsc_0_3_i_wea_d_core_sct, xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, xt_rsc_0_3_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input xt_rsc_0_3_i_oswt;
  input [1:0] xt_rsc_0_3_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output xt_rsc_0_3_i_biwt;
  output xt_rsc_0_3_i_bdwt;
  output [1:0] xt_rsc_0_3_i_wea_d_core_sct;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input xt_rsc_0_3_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_3_i_dswt_pff;

  wire[0:0] butterFly_1_f2_and_8_nl;
  wire[0:0] butterFly_1_f2_and_9_nl;
  wire[0:0] butterFly_1_f2_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_3_i_bdwt = xt_rsc_0_3_i_oswt & core_wen;
  assign xt_rsc_0_3_i_biwt = (~ core_wten) & xt_rsc_0_3_i_oswt;
  assign butterFly_1_f2_and_8_nl = (xt_rsc_0_3_i_wea_d_core_psct[0]) & xt_rsc_0_3_i_dswt_pff;
  assign xt_rsc_0_3_i_wea_d_core_sct = {1'b0 , butterFly_1_f2_and_8_nl};
  assign xt_rsc_0_3_i_dswt_pff = core_wen & xt_rsc_0_3_i_oswt_pff;
  assign butterFly_1_f2_and_9_nl = (xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & xt_rsc_0_3_i_dswt_pff;
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , butterFly_1_f2_and_9_nl};
  assign butterFly_1_f2_and_10_nl = (xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & xt_rsc_0_3_i_dswt_pff;
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , butterFly_1_f2_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp (
  clk, rst, xt_rsc_0_2_i_adra_d, xt_rsc_0_2_i_da_d, xt_rsc_0_2_i_qa_d, xt_rsc_0_2_i_adra_d_core,
      xt_rsc_0_2_i_da_d_core, xt_rsc_0_2_i_qa_d_mxwt, xt_rsc_0_2_i_biwt, xt_rsc_0_2_i_bdwt
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_2_i_adra_d;
  output [31:0] xt_rsc_0_2_i_da_d;
  input [63:0] xt_rsc_0_2_i_qa_d;
  input [13:0] xt_rsc_0_2_i_adra_d_core;
  input [63:0] xt_rsc_0_2_i_da_d_core;
  output [31:0] xt_rsc_0_2_i_qa_d_mxwt;
  input xt_rsc_0_2_i_biwt;
  input xt_rsc_0_2_i_bdwt;


  // Interconnect Declarations
  reg xt_rsc_0_2_i_bcwt;
  reg [31:0] xt_rsc_0_2_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_2_i_qa_d_mxwt = MUX_v_32_2_2((xt_rsc_0_2_i_qa_d[31:0]), xt_rsc_0_2_i_qa_d_bfwt_31_0,
      xt_rsc_0_2_i_bcwt);
  assign xt_rsc_0_2_i_adra_d = xt_rsc_0_2_i_adra_d_core[6:0];
  assign xt_rsc_0_2_i_da_d = xt_rsc_0_2_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsc_0_2_i_bcwt <= 1'b0;
    end
    else begin
      xt_rsc_0_2_i_bcwt <= ~((~(xt_rsc_0_2_i_bcwt | xt_rsc_0_2_i_biwt)) | xt_rsc_0_2_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsc_0_2_i_biwt ) begin
      xt_rsc_0_2_i_qa_d_bfwt_31_0 <= xt_rsc_0_2_i_qa_d[31:0];
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl (
  core_wen, core_wten, xt_rsc_0_2_i_oswt, xt_rsc_0_2_i_wea_d_core_psct, xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_2_i_biwt,
      xt_rsc_0_2_i_bdwt, xt_rsc_0_2_i_wea_d_core_sct, xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, xt_rsc_0_2_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input xt_rsc_0_2_i_oswt;
  input [1:0] xt_rsc_0_2_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output xt_rsc_0_2_i_biwt;
  output xt_rsc_0_2_i_bdwt;
  output [1:0] xt_rsc_0_2_i_wea_d_core_sct;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input xt_rsc_0_2_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_2_i_dswt_pff;

  wire[0:0] butterFly_1_f1_and_8_nl;
  wire[0:0] butterFly_1_f1_and_9_nl;
  wire[0:0] butterFly_1_f1_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_2_i_bdwt = xt_rsc_0_2_i_oswt & core_wen;
  assign xt_rsc_0_2_i_biwt = (~ core_wten) & xt_rsc_0_2_i_oswt;
  assign butterFly_1_f1_and_8_nl = (xt_rsc_0_2_i_wea_d_core_psct[0]) & xt_rsc_0_2_i_dswt_pff;
  assign xt_rsc_0_2_i_wea_d_core_sct = {1'b0 , butterFly_1_f1_and_8_nl};
  assign xt_rsc_0_2_i_dswt_pff = core_wen & xt_rsc_0_2_i_oswt_pff;
  assign butterFly_1_f1_and_9_nl = (xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & xt_rsc_0_2_i_dswt_pff;
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , butterFly_1_f1_and_9_nl};
  assign butterFly_1_f1_and_10_nl = (xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & xt_rsc_0_2_i_dswt_pff;
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , butterFly_1_f1_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp (
  clk, rst, xt_rsc_0_1_i_adra_d, xt_rsc_0_1_i_da_d, xt_rsc_0_1_i_qa_d, xt_rsc_0_1_i_adra_d_core,
      xt_rsc_0_1_i_da_d_core, xt_rsc_0_1_i_qa_d_mxwt, xt_rsc_0_1_i_biwt, xt_rsc_0_1_i_bdwt
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_1_i_adra_d;
  output [31:0] xt_rsc_0_1_i_da_d;
  input [63:0] xt_rsc_0_1_i_qa_d;
  input [13:0] xt_rsc_0_1_i_adra_d_core;
  input [63:0] xt_rsc_0_1_i_da_d_core;
  output [31:0] xt_rsc_0_1_i_qa_d_mxwt;
  input xt_rsc_0_1_i_biwt;
  input xt_rsc_0_1_i_bdwt;


  // Interconnect Declarations
  reg xt_rsc_0_1_i_bcwt;
  reg [31:0] xt_rsc_0_1_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_1_i_qa_d_mxwt = MUX_v_32_2_2((xt_rsc_0_1_i_qa_d[31:0]), xt_rsc_0_1_i_qa_d_bfwt_31_0,
      xt_rsc_0_1_i_bcwt);
  assign xt_rsc_0_1_i_adra_d = xt_rsc_0_1_i_adra_d_core[6:0];
  assign xt_rsc_0_1_i_da_d = xt_rsc_0_1_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsc_0_1_i_bcwt <= 1'b0;
    end
    else begin
      xt_rsc_0_1_i_bcwt <= ~((~(xt_rsc_0_1_i_bcwt | xt_rsc_0_1_i_biwt)) | xt_rsc_0_1_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsc_0_1_i_biwt ) begin
      xt_rsc_0_1_i_qa_d_bfwt_31_0 <= xt_rsc_0_1_i_qa_d[31:0];
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl (
  core_wen, core_wten, xt_rsc_0_1_i_oswt, xt_rsc_0_1_i_wea_d_core_psct, xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_1_i_biwt,
      xt_rsc_0_1_i_bdwt, xt_rsc_0_1_i_wea_d_core_sct, xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, xt_rsc_0_1_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input xt_rsc_0_1_i_oswt;
  input [1:0] xt_rsc_0_1_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output xt_rsc_0_1_i_biwt;
  output xt_rsc_0_1_i_bdwt;
  output [1:0] xt_rsc_0_1_i_wea_d_core_sct;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input xt_rsc_0_1_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_1_i_dswt_pff;

  wire[0:0] butterFly_f2_and_8_nl;
  wire[0:0] butterFly_f2_and_9_nl;
  wire[0:0] butterFly_f2_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_1_i_bdwt = xt_rsc_0_1_i_oswt & core_wen;
  assign xt_rsc_0_1_i_biwt = (~ core_wten) & xt_rsc_0_1_i_oswt;
  assign butterFly_f2_and_8_nl = (xt_rsc_0_1_i_wea_d_core_psct[0]) & xt_rsc_0_1_i_dswt_pff;
  assign xt_rsc_0_1_i_wea_d_core_sct = {1'b0 , butterFly_f2_and_8_nl};
  assign xt_rsc_0_1_i_dswt_pff = core_wen & xt_rsc_0_1_i_oswt_pff;
  assign butterFly_f2_and_9_nl = (xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & xt_rsc_0_1_i_dswt_pff;
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , butterFly_f2_and_9_nl};
  assign butterFly_f2_and_10_nl = (xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & xt_rsc_0_1_i_dswt_pff;
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , butterFly_f2_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp (
  clk, rst, xt_rsc_0_0_i_adra_d, xt_rsc_0_0_i_da_d, xt_rsc_0_0_i_qa_d, xt_rsc_0_0_i_adra_d_core,
      xt_rsc_0_0_i_da_d_core, xt_rsc_0_0_i_qa_d_mxwt, xt_rsc_0_0_i_biwt, xt_rsc_0_0_i_bdwt
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_0_i_adra_d;
  output [31:0] xt_rsc_0_0_i_da_d;
  input [63:0] xt_rsc_0_0_i_qa_d;
  input [13:0] xt_rsc_0_0_i_adra_d_core;
  input [63:0] xt_rsc_0_0_i_da_d_core;
  output [31:0] xt_rsc_0_0_i_qa_d_mxwt;
  input xt_rsc_0_0_i_biwt;
  input xt_rsc_0_0_i_bdwt;


  // Interconnect Declarations
  reg xt_rsc_0_0_i_bcwt;
  reg [31:0] xt_rsc_0_0_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_0_i_qa_d_mxwt = MUX_v_32_2_2((xt_rsc_0_0_i_qa_d[31:0]), xt_rsc_0_0_i_qa_d_bfwt_31_0,
      xt_rsc_0_0_i_bcwt);
  assign xt_rsc_0_0_i_adra_d = xt_rsc_0_0_i_adra_d_core[6:0];
  assign xt_rsc_0_0_i_da_d = xt_rsc_0_0_i_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsc_0_0_i_bcwt <= 1'b0;
    end
    else begin
      xt_rsc_0_0_i_bcwt <= ~((~(xt_rsc_0_0_i_bcwt | xt_rsc_0_0_i_biwt)) | xt_rsc_0_0_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsc_0_0_i_biwt ) begin
      xt_rsc_0_0_i_qa_d_bfwt_31_0 <= xt_rsc_0_0_i_qa_d[31:0];
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl (
  core_wen, xt_rsc_0_0_i_oswt, core_wten, xt_rsc_0_0_i_wea_d_core_psct, xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_0_i_biwt,
      xt_rsc_0_0_i_bdwt, xt_rsc_0_0_i_wea_d_core_sct, xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct, xt_rsc_0_0_i_oswt_pff
);
  input core_wen;
  input xt_rsc_0_0_i_oswt;
  input core_wten;
  input [1:0] xt_rsc_0_0_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output xt_rsc_0_0_i_biwt;
  output xt_rsc_0_0_i_bdwt;
  output [1:0] xt_rsc_0_0_i_wea_d_core_sct;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input xt_rsc_0_0_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_0_i_dswt_pff;

  wire[0:0] butterFly_f1_and_8_nl;
  wire[0:0] butterFly_f1_and_9_nl;
  wire[0:0] butterFly_f1_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_0_0_i_bdwt = xt_rsc_0_0_i_oswt & core_wen;
  assign xt_rsc_0_0_i_biwt = (~ core_wten) & xt_rsc_0_0_i_oswt;
  assign butterFly_f1_and_8_nl = (xt_rsc_0_0_i_wea_d_core_psct[0]) & xt_rsc_0_0_i_dswt_pff;
  assign xt_rsc_0_0_i_wea_d_core_sct = {1'b0 , butterFly_f1_and_8_nl};
  assign xt_rsc_0_0_i_dswt_pff = core_wen & xt_rsc_0_0_i_oswt_pff;
  assign butterFly_f1_and_9_nl = (xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & xt_rsc_0_0_i_dswt_pff;
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , butterFly_f1_and_9_nl};
  assign butterFly_f1_and_10_nl = (xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & xt_rsc_0_0_i_dswt_pff;
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , butterFly_f1_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_wait_dp (
  yt_rsc_0_0_cgo_iro, yt_rsc_0_0_i_clken_d, yt_rsc_0_4_cgo_iro, yt_rsc_0_4_i_clken_d,
      yt_rsc_1_0_cgo_iro, yt_rsc_1_0_i_clken_d, yt_rsc_1_4_cgo_iro, yt_rsc_1_4_i_clken_d,
      ensig_cgo_iro, ensig_cgo_iro_5, core_wen, yt_rsc_0_0_cgo, yt_rsc_0_4_cgo, yt_rsc_1_0_cgo,
      yt_rsc_1_4_cgo, ensig_cgo, mult_t_mul_cmp_en, ensig_cgo_5, mult_z_mul_cmp_1_en
);
  input yt_rsc_0_0_cgo_iro;
  output yt_rsc_0_0_i_clken_d;
  input yt_rsc_0_4_cgo_iro;
  output yt_rsc_0_4_i_clken_d;
  input yt_rsc_1_0_cgo_iro;
  output yt_rsc_1_0_i_clken_d;
  input yt_rsc_1_4_cgo_iro;
  output yt_rsc_1_4_i_clken_d;
  input ensig_cgo_iro;
  input ensig_cgo_iro_5;
  input core_wen;
  input yt_rsc_0_0_cgo;
  input yt_rsc_0_4_cgo;
  input yt_rsc_1_0_cgo;
  input yt_rsc_1_4_cgo;
  input ensig_cgo;
  output mult_t_mul_cmp_en;
  input ensig_cgo_5;
  output mult_z_mul_cmp_1_en;



  // Interconnect Declarations for Component Instantiations 
  assign yt_rsc_0_0_i_clken_d = core_wen & (yt_rsc_0_0_cgo | yt_rsc_0_0_cgo_iro);
  assign yt_rsc_0_4_i_clken_d = core_wen & (yt_rsc_0_4_cgo | yt_rsc_0_4_cgo_iro);
  assign yt_rsc_1_0_i_clken_d = core_wen & (yt_rsc_1_0_cgo | yt_rsc_1_0_cgo_iro);
  assign yt_rsc_1_4_i_clken_d = core_wen & (yt_rsc_1_4_cgo | yt_rsc_1_4_cgo_iro);
  assign mult_t_mul_cmp_en = core_wen & (ensig_cgo | ensig_cgo_iro);
  assign mult_z_mul_cmp_1_en = core_wen & (ensig_cgo_5 | ensig_cgo_iro_5);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_0_0_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_0_0_obj (
  twiddle_h_rsc_triosy_0_0_lz, core_wten, twiddle_h_rsc_triosy_0_0_obj_iswt0
);
  output twiddle_h_rsc_triosy_0_0_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_0_0_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_0_0_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_0_0_obj (
      .ld(twiddle_h_rsc_triosy_0_0_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_0_0_lz)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_0_0_obj_twiddle_h_rsc_triosy_0_0_wait_ctrl peaseNTT_core_twiddle_h_rsc_triosy_0_0_obj_twiddle_h_rsc_triosy_0_0_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_0_obj_iswt0(twiddle_h_rsc_triosy_0_0_obj_iswt0),
      .twiddle_h_rsc_triosy_0_0_obj_ld_core_sct(twiddle_h_rsc_triosy_0_0_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_0_1_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_0_1_obj (
  twiddle_h_rsc_triosy_0_1_lz, core_wten, twiddle_h_rsc_triosy_0_1_obj_iswt0
);
  output twiddle_h_rsc_triosy_0_1_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_0_1_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_0_1_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_0_1_obj (
      .ld(twiddle_h_rsc_triosy_0_1_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_0_1_lz)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_0_1_obj_twiddle_h_rsc_triosy_0_1_wait_ctrl peaseNTT_core_twiddle_h_rsc_triosy_0_1_obj_twiddle_h_rsc_triosy_0_1_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_1_obj_iswt0(twiddle_h_rsc_triosy_0_1_obj_iswt0),
      .twiddle_h_rsc_triosy_0_1_obj_ld_core_sct(twiddle_h_rsc_triosy_0_1_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_0_2_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_0_2_obj (
  twiddle_h_rsc_triosy_0_2_lz, core_wten, twiddle_h_rsc_triosy_0_2_obj_iswt0
);
  output twiddle_h_rsc_triosy_0_2_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_0_2_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_0_2_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_0_2_obj (
      .ld(twiddle_h_rsc_triosy_0_2_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_0_2_lz)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_0_2_obj_twiddle_h_rsc_triosy_0_2_wait_ctrl peaseNTT_core_twiddle_h_rsc_triosy_0_2_obj_twiddle_h_rsc_triosy_0_2_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_2_obj_iswt0(twiddle_h_rsc_triosy_0_2_obj_iswt0),
      .twiddle_h_rsc_triosy_0_2_obj_ld_core_sct(twiddle_h_rsc_triosy_0_2_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_0_3_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_0_3_obj (
  twiddle_h_rsc_triosy_0_3_lz, core_wten, twiddle_h_rsc_triosy_0_3_obj_iswt0
);
  output twiddle_h_rsc_triosy_0_3_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_0_3_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_0_3_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_0_3_obj (
      .ld(twiddle_h_rsc_triosy_0_3_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_0_3_lz)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_0_3_obj_twiddle_h_rsc_triosy_0_3_wait_ctrl peaseNTT_core_twiddle_h_rsc_triosy_0_3_obj_twiddle_h_rsc_triosy_0_3_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_3_obj_iswt0(twiddle_h_rsc_triosy_0_3_obj_iswt0),
      .twiddle_h_rsc_triosy_0_3_obj_ld_core_sct(twiddle_h_rsc_triosy_0_3_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_0_0_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_0_0_obj (
  twiddle_rsc_triosy_0_0_lz, core_wten, twiddle_rsc_triosy_0_0_obj_iswt0
);
  output twiddle_rsc_triosy_0_0_lz;
  input core_wten;
  input twiddle_rsc_triosy_0_0_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_0_0_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_0_obj (
      .ld(twiddle_rsc_triosy_0_0_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_0_0_lz)
    );
  peaseNTT_core_twiddle_rsc_triosy_0_0_obj_twiddle_rsc_triosy_0_0_wait_ctrl peaseNTT_core_twiddle_rsc_triosy_0_0_obj_twiddle_rsc_triosy_0_0_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_0_obj_iswt0(twiddle_rsc_triosy_0_0_obj_iswt0),
      .twiddle_rsc_triosy_0_0_obj_ld_core_sct(twiddle_rsc_triosy_0_0_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_0_1_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_0_1_obj (
  twiddle_rsc_triosy_0_1_lz, core_wten, twiddle_rsc_triosy_0_1_obj_iswt0
);
  output twiddle_rsc_triosy_0_1_lz;
  input core_wten;
  input twiddle_rsc_triosy_0_1_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_0_1_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_1_obj (
      .ld(twiddle_rsc_triosy_0_1_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_0_1_lz)
    );
  peaseNTT_core_twiddle_rsc_triosy_0_1_obj_twiddle_rsc_triosy_0_1_wait_ctrl peaseNTT_core_twiddle_rsc_triosy_0_1_obj_twiddle_rsc_triosy_0_1_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_1_obj_iswt0(twiddle_rsc_triosy_0_1_obj_iswt0),
      .twiddle_rsc_triosy_0_1_obj_ld_core_sct(twiddle_rsc_triosy_0_1_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_0_2_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_0_2_obj (
  twiddle_rsc_triosy_0_2_lz, core_wten, twiddle_rsc_triosy_0_2_obj_iswt0
);
  output twiddle_rsc_triosy_0_2_lz;
  input core_wten;
  input twiddle_rsc_triosy_0_2_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_0_2_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_2_obj (
      .ld(twiddle_rsc_triosy_0_2_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_0_2_lz)
    );
  peaseNTT_core_twiddle_rsc_triosy_0_2_obj_twiddle_rsc_triosy_0_2_wait_ctrl peaseNTT_core_twiddle_rsc_triosy_0_2_obj_twiddle_rsc_triosy_0_2_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_2_obj_iswt0(twiddle_rsc_triosy_0_2_obj_iswt0),
      .twiddle_rsc_triosy_0_2_obj_ld_core_sct(twiddle_rsc_triosy_0_2_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_0_3_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_0_3_obj (
  twiddle_rsc_triosy_0_3_lz, core_wten, twiddle_rsc_triosy_0_3_obj_iswt0
);
  output twiddle_rsc_triosy_0_3_lz;
  input core_wten;
  input twiddle_rsc_triosy_0_3_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_0_3_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_3_obj (
      .ld(twiddle_rsc_triosy_0_3_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_0_3_lz)
    );
  peaseNTT_core_twiddle_rsc_triosy_0_3_obj_twiddle_rsc_triosy_0_3_wait_ctrl peaseNTT_core_twiddle_rsc_triosy_0_3_obj_twiddle_rsc_triosy_0_3_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_3_obj_iswt0(twiddle_rsc_triosy_0_3_obj_iswt0),
      .twiddle_rsc_triosy_0_3_obj_ld_core_sct(twiddle_rsc_triosy_0_3_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_r_rsc_triosy_obj
// ------------------------------------------------------------------


module peaseNTT_core_r_rsc_triosy_obj (
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
  peaseNTT_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl peaseNTT_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(r_rsc_triosy_obj_iswt0),
      .r_rsc_triosy_obj_ld_core_sct(r_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_p_rsc_triosy_obj
// ------------------------------------------------------------------


module peaseNTT_core_p_rsc_triosy_obj (
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
  peaseNTT_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl peaseNTT_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(p_rsc_triosy_obj_iswt0),
      .p_rsc_triosy_obj_ld_core_sct(p_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_0_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_0_obj (
  xt_rsc_triosy_0_0_lz, core_wten, xt_rsc_triosy_0_0_obj_iswt0
);
  output xt_rsc_triosy_0_0_lz;
  input core_wten;
  input xt_rsc_triosy_0_0_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_0_0_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_0_obj (
      .ld(xt_rsc_triosy_0_0_obj_ld_core_sct),
      .lz(xt_rsc_triosy_0_0_lz)
    );
  peaseNTT_core_xt_rsc_triosy_0_0_obj_xt_rsc_triosy_0_0_wait_ctrl peaseNTT_core_xt_rsc_triosy_0_0_obj_xt_rsc_triosy_0_0_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_0_0_obj_iswt0(xt_rsc_triosy_0_0_obj_iswt0),
      .xt_rsc_triosy_0_0_obj_ld_core_sct(xt_rsc_triosy_0_0_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_1_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_1_obj (
  xt_rsc_triosy_0_1_lz, core_wten, xt_rsc_triosy_0_1_obj_iswt0
);
  output xt_rsc_triosy_0_1_lz;
  input core_wten;
  input xt_rsc_triosy_0_1_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_0_1_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_1_obj (
      .ld(xt_rsc_triosy_0_1_obj_ld_core_sct),
      .lz(xt_rsc_triosy_0_1_lz)
    );
  peaseNTT_core_xt_rsc_triosy_0_1_obj_xt_rsc_triosy_0_1_wait_ctrl peaseNTT_core_xt_rsc_triosy_0_1_obj_xt_rsc_triosy_0_1_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_0_1_obj_iswt0(xt_rsc_triosy_0_1_obj_iswt0),
      .xt_rsc_triosy_0_1_obj_ld_core_sct(xt_rsc_triosy_0_1_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_2_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_2_obj (
  xt_rsc_triosy_0_2_lz, core_wten, xt_rsc_triosy_0_2_obj_iswt0
);
  output xt_rsc_triosy_0_2_lz;
  input core_wten;
  input xt_rsc_triosy_0_2_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_0_2_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_2_obj (
      .ld(xt_rsc_triosy_0_2_obj_ld_core_sct),
      .lz(xt_rsc_triosy_0_2_lz)
    );
  peaseNTT_core_xt_rsc_triosy_0_2_obj_xt_rsc_triosy_0_2_wait_ctrl peaseNTT_core_xt_rsc_triosy_0_2_obj_xt_rsc_triosy_0_2_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_0_2_obj_iswt0(xt_rsc_triosy_0_2_obj_iswt0),
      .xt_rsc_triosy_0_2_obj_ld_core_sct(xt_rsc_triosy_0_2_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_3_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_3_obj (
  xt_rsc_triosy_0_3_lz, core_wten, xt_rsc_triosy_0_3_obj_iswt0
);
  output xt_rsc_triosy_0_3_lz;
  input core_wten;
  input xt_rsc_triosy_0_3_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_0_3_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_3_obj (
      .ld(xt_rsc_triosy_0_3_obj_ld_core_sct),
      .lz(xt_rsc_triosy_0_3_lz)
    );
  peaseNTT_core_xt_rsc_triosy_0_3_obj_xt_rsc_triosy_0_3_wait_ctrl peaseNTT_core_xt_rsc_triosy_0_3_obj_xt_rsc_triosy_0_3_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_0_3_obj_iswt0(xt_rsc_triosy_0_3_obj_iswt0),
      .xt_rsc_triosy_0_3_obj_ld_core_sct(xt_rsc_triosy_0_3_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_4_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_4_obj (
  xt_rsc_triosy_0_4_lz, core_wten, xt_rsc_triosy_0_4_obj_iswt0
);
  output xt_rsc_triosy_0_4_lz;
  input core_wten;
  input xt_rsc_triosy_0_4_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_0_4_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_4_obj (
      .ld(xt_rsc_triosy_0_4_obj_ld_core_sct),
      .lz(xt_rsc_triosy_0_4_lz)
    );
  peaseNTT_core_xt_rsc_triosy_0_4_obj_xt_rsc_triosy_0_4_wait_ctrl peaseNTT_core_xt_rsc_triosy_0_4_obj_xt_rsc_triosy_0_4_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_0_4_obj_iswt0(xt_rsc_triosy_0_4_obj_iswt0),
      .xt_rsc_triosy_0_4_obj_ld_core_sct(xt_rsc_triosy_0_4_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_5_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_5_obj (
  xt_rsc_triosy_0_5_lz, core_wten, xt_rsc_triosy_0_5_obj_iswt0
);
  output xt_rsc_triosy_0_5_lz;
  input core_wten;
  input xt_rsc_triosy_0_5_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_0_5_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_5_obj (
      .ld(xt_rsc_triosy_0_5_obj_ld_core_sct),
      .lz(xt_rsc_triosy_0_5_lz)
    );
  peaseNTT_core_xt_rsc_triosy_0_5_obj_xt_rsc_triosy_0_5_wait_ctrl peaseNTT_core_xt_rsc_triosy_0_5_obj_xt_rsc_triosy_0_5_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_0_5_obj_iswt0(xt_rsc_triosy_0_5_obj_iswt0),
      .xt_rsc_triosy_0_5_obj_ld_core_sct(xt_rsc_triosy_0_5_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_6_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_6_obj (
  xt_rsc_triosy_0_6_lz, core_wten, xt_rsc_triosy_0_6_obj_iswt0
);
  output xt_rsc_triosy_0_6_lz;
  input core_wten;
  input xt_rsc_triosy_0_6_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_0_6_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_6_obj (
      .ld(xt_rsc_triosy_0_6_obj_ld_core_sct),
      .lz(xt_rsc_triosy_0_6_lz)
    );
  peaseNTT_core_xt_rsc_triosy_0_6_obj_xt_rsc_triosy_0_6_wait_ctrl peaseNTT_core_xt_rsc_triosy_0_6_obj_xt_rsc_triosy_0_6_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_0_6_obj_iswt0(xt_rsc_triosy_0_6_obj_iswt0),
      .xt_rsc_triosy_0_6_obj_ld_core_sct(xt_rsc_triosy_0_6_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_0_7_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_0_7_obj (
  xt_rsc_triosy_0_7_lz, core_wten, xt_rsc_triosy_0_7_obj_iswt0
);
  output xt_rsc_triosy_0_7_lz;
  input core_wten;
  input xt_rsc_triosy_0_7_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_0_7_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_7_obj (
      .ld(xt_rsc_triosy_0_7_obj_ld_core_sct),
      .lz(xt_rsc_triosy_0_7_lz)
    );
  peaseNTT_core_xt_rsc_triosy_0_7_obj_xt_rsc_triosy_0_7_wait_ctrl peaseNTT_core_xt_rsc_triosy_0_7_obj_xt_rsc_triosy_0_7_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_0_7_obj_iswt0(xt_rsc_triosy_0_7_obj_iswt0),
      .xt_rsc_triosy_0_7_obj_ld_core_sct(xt_rsc_triosy_0_7_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_3_i
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_3_i (
  clk, rst, twiddle_h_rsc_0_3_s_tdone, twiddle_h_rsc_0_3_tr_write_done, twiddle_h_rsc_0_3_RREADY,
      twiddle_h_rsc_0_3_RVALID, twiddle_h_rsc_0_3_RUSER, twiddle_h_rsc_0_3_RLAST,
      twiddle_h_rsc_0_3_RRESP, twiddle_h_rsc_0_3_RDATA, twiddle_h_rsc_0_3_RID, twiddle_h_rsc_0_3_ARREADY,
      twiddle_h_rsc_0_3_ARVALID, twiddle_h_rsc_0_3_ARUSER, twiddle_h_rsc_0_3_ARREGION,
      twiddle_h_rsc_0_3_ARQOS, twiddle_h_rsc_0_3_ARPROT, twiddle_h_rsc_0_3_ARCACHE,
      twiddle_h_rsc_0_3_ARLOCK, twiddle_h_rsc_0_3_ARBURST, twiddle_h_rsc_0_3_ARSIZE,
      twiddle_h_rsc_0_3_ARLEN, twiddle_h_rsc_0_3_ARADDR, twiddle_h_rsc_0_3_ARID,
      twiddle_h_rsc_0_3_BREADY, twiddle_h_rsc_0_3_BVALID, twiddle_h_rsc_0_3_BUSER,
      twiddle_h_rsc_0_3_BRESP, twiddle_h_rsc_0_3_BID, twiddle_h_rsc_0_3_WREADY, twiddle_h_rsc_0_3_WVALID,
      twiddle_h_rsc_0_3_WUSER, twiddle_h_rsc_0_3_WLAST, twiddle_h_rsc_0_3_WSTRB,
      twiddle_h_rsc_0_3_WDATA, twiddle_h_rsc_0_3_AWREADY, twiddle_h_rsc_0_3_AWVALID,
      twiddle_h_rsc_0_3_AWUSER, twiddle_h_rsc_0_3_AWREGION, twiddle_h_rsc_0_3_AWQOS,
      twiddle_h_rsc_0_3_AWPROT, twiddle_h_rsc_0_3_AWCACHE, twiddle_h_rsc_0_3_AWLOCK,
      twiddle_h_rsc_0_3_AWBURST, twiddle_h_rsc_0_3_AWSIZE, twiddle_h_rsc_0_3_AWLEN,
      twiddle_h_rsc_0_3_AWADDR, twiddle_h_rsc_0_3_AWID, core_wen, twiddle_h_rsc_0_3_i_oswt,
      twiddle_h_rsc_0_3_i_wen_comp, twiddle_h_rsc_0_3_i_s_raddr_core, twiddle_h_rsc_0_3_i_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_h_rsc_0_3_s_tdone;
  input twiddle_h_rsc_0_3_tr_write_done;
  input twiddle_h_rsc_0_3_RREADY;
  output twiddle_h_rsc_0_3_RVALID;
  output twiddle_h_rsc_0_3_RUSER;
  output twiddle_h_rsc_0_3_RLAST;
  output [1:0] twiddle_h_rsc_0_3_RRESP;
  output [31:0] twiddle_h_rsc_0_3_RDATA;
  output twiddle_h_rsc_0_3_RID;
  output twiddle_h_rsc_0_3_ARREADY;
  input twiddle_h_rsc_0_3_ARVALID;
  input twiddle_h_rsc_0_3_ARUSER;
  input [3:0] twiddle_h_rsc_0_3_ARREGION;
  input [3:0] twiddle_h_rsc_0_3_ARQOS;
  input [2:0] twiddle_h_rsc_0_3_ARPROT;
  input [3:0] twiddle_h_rsc_0_3_ARCACHE;
  input twiddle_h_rsc_0_3_ARLOCK;
  input [1:0] twiddle_h_rsc_0_3_ARBURST;
  input [2:0] twiddle_h_rsc_0_3_ARSIZE;
  input [7:0] twiddle_h_rsc_0_3_ARLEN;
  input [11:0] twiddle_h_rsc_0_3_ARADDR;
  input twiddle_h_rsc_0_3_ARID;
  input twiddle_h_rsc_0_3_BREADY;
  output twiddle_h_rsc_0_3_BVALID;
  output twiddle_h_rsc_0_3_BUSER;
  output [1:0] twiddle_h_rsc_0_3_BRESP;
  output twiddle_h_rsc_0_3_BID;
  output twiddle_h_rsc_0_3_WREADY;
  input twiddle_h_rsc_0_3_WVALID;
  input twiddle_h_rsc_0_3_WUSER;
  input twiddle_h_rsc_0_3_WLAST;
  input [3:0] twiddle_h_rsc_0_3_WSTRB;
  input [31:0] twiddle_h_rsc_0_3_WDATA;
  output twiddle_h_rsc_0_3_AWREADY;
  input twiddle_h_rsc_0_3_AWVALID;
  input twiddle_h_rsc_0_3_AWUSER;
  input [3:0] twiddle_h_rsc_0_3_AWREGION;
  input [3:0] twiddle_h_rsc_0_3_AWQOS;
  input [2:0] twiddle_h_rsc_0_3_AWPROT;
  input [3:0] twiddle_h_rsc_0_3_AWCACHE;
  input twiddle_h_rsc_0_3_AWLOCK;
  input [1:0] twiddle_h_rsc_0_3_AWBURST;
  input [2:0] twiddle_h_rsc_0_3_AWSIZE;
  input [7:0] twiddle_h_rsc_0_3_AWLEN;
  input [11:0] twiddle_h_rsc_0_3_AWADDR;
  input twiddle_h_rsc_0_3_AWID;
  input core_wen;
  input twiddle_h_rsc_0_3_i_oswt;
  output twiddle_h_rsc_0_3_i_wen_comp;
  input [7:0] twiddle_h_rsc_0_3_i_s_raddr_core;
  output [31:0] twiddle_h_rsc_0_3_i_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_3_i_biwt;
  wire twiddle_h_rsc_0_3_i_bdwt;
  wire twiddle_h_rsc_0_3_i_bcwt;
  wire twiddle_h_rsc_0_3_i_s_re_core_sct;
  wire [7:0] twiddle_h_rsc_0_3_i_s_raddr;
  wire [31:0] twiddle_h_rsc_0_3_i_s_din;
  wire twiddle_h_rsc_0_3_i_s_rrdy;
  wire twiddle_h_rsc_0_3_i_s_wrdy;
  wire twiddle_h_rsc_0_3_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [7:0] nl_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_s_raddr_core
      = {1'b0 , (twiddle_h_rsc_0_3_i_s_raddr_core[6:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd256),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd8),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_h_rsc_0_3_i (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_h_rsc_0_3_AWID),
      .AWADDR(twiddle_h_rsc_0_3_AWADDR),
      .AWLEN(twiddle_h_rsc_0_3_AWLEN),
      .AWSIZE(twiddle_h_rsc_0_3_AWSIZE),
      .AWBURST(twiddle_h_rsc_0_3_AWBURST),
      .AWLOCK(twiddle_h_rsc_0_3_AWLOCK),
      .AWCACHE(twiddle_h_rsc_0_3_AWCACHE),
      .AWPROT(twiddle_h_rsc_0_3_AWPROT),
      .AWQOS(twiddle_h_rsc_0_3_AWQOS),
      .AWREGION(twiddle_h_rsc_0_3_AWREGION),
      .AWUSER(twiddle_h_rsc_0_3_AWUSER),
      .AWVALID(twiddle_h_rsc_0_3_AWVALID),
      .AWREADY(twiddle_h_rsc_0_3_AWREADY),
      .WDATA(twiddle_h_rsc_0_3_WDATA),
      .WSTRB(twiddle_h_rsc_0_3_WSTRB),
      .WLAST(twiddle_h_rsc_0_3_WLAST),
      .WUSER(twiddle_h_rsc_0_3_WUSER),
      .WVALID(twiddle_h_rsc_0_3_WVALID),
      .WREADY(twiddle_h_rsc_0_3_WREADY),
      .BID(twiddle_h_rsc_0_3_BID),
      .BRESP(twiddle_h_rsc_0_3_BRESP),
      .BUSER(twiddle_h_rsc_0_3_BUSER),
      .BVALID(twiddle_h_rsc_0_3_BVALID),
      .BREADY(twiddle_h_rsc_0_3_BREADY),
      .ARID(twiddle_h_rsc_0_3_ARID),
      .ARADDR(twiddle_h_rsc_0_3_ARADDR),
      .ARLEN(twiddle_h_rsc_0_3_ARLEN),
      .ARSIZE(twiddle_h_rsc_0_3_ARSIZE),
      .ARBURST(twiddle_h_rsc_0_3_ARBURST),
      .ARLOCK(twiddle_h_rsc_0_3_ARLOCK),
      .ARCACHE(twiddle_h_rsc_0_3_ARCACHE),
      .ARPROT(twiddle_h_rsc_0_3_ARPROT),
      .ARQOS(twiddle_h_rsc_0_3_ARQOS),
      .ARREGION(twiddle_h_rsc_0_3_ARREGION),
      .ARUSER(twiddle_h_rsc_0_3_ARUSER),
      .ARVALID(twiddle_h_rsc_0_3_ARVALID),
      .ARREADY(twiddle_h_rsc_0_3_ARREADY),
      .RID(twiddle_h_rsc_0_3_RID),
      .RDATA(twiddle_h_rsc_0_3_RDATA),
      .RRESP(twiddle_h_rsc_0_3_RRESP),
      .RLAST(twiddle_h_rsc_0_3_RLAST),
      .RUSER(twiddle_h_rsc_0_3_RUSER),
      .RVALID(twiddle_h_rsc_0_3_RVALID),
      .RREADY(twiddle_h_rsc_0_3_RREADY),
      .s_re(twiddle_h_rsc_0_3_i_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_h_rsc_0_3_i_s_raddr),
      .s_waddr(8'b00000000),
      .s_din(twiddle_h_rsc_0_3_i_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_h_rsc_0_3_i_s_rrdy),
      .s_wrdy(twiddle_h_rsc_0_3_i_s_wrdy),
      .is_idle(twiddle_h_rsc_0_3_is_idle),
      .tr_write_done(twiddle_h_rsc_0_3_tr_write_done),
      .s_tdone(twiddle_h_rsc_0_3_s_tdone)
    );
  peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_h_rsc_0_3_i_oswt(twiddle_h_rsc_0_3_i_oswt),
      .twiddle_h_rsc_0_3_i_biwt(twiddle_h_rsc_0_3_i_biwt),
      .twiddle_h_rsc_0_3_i_bdwt(twiddle_h_rsc_0_3_i_bdwt),
      .twiddle_h_rsc_0_3_i_bcwt(twiddle_h_rsc_0_3_i_bcwt),
      .twiddle_h_rsc_0_3_i_s_re_core_sct(twiddle_h_rsc_0_3_i_s_re_core_sct),
      .twiddle_h_rsc_0_3_i_s_rrdy(twiddle_h_rsc_0_3_i_s_rrdy)
    );
  peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_3_i_oswt(twiddle_h_rsc_0_3_i_oswt),
      .twiddle_h_rsc_0_3_i_wen_comp(twiddle_h_rsc_0_3_i_wen_comp),
      .twiddle_h_rsc_0_3_i_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsc_0_3_i_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_s_raddr_core[7:0]),
      .twiddle_h_rsc_0_3_i_s_din_mxwt(twiddle_h_rsc_0_3_i_s_din_mxwt),
      .twiddle_h_rsc_0_3_i_biwt(twiddle_h_rsc_0_3_i_biwt),
      .twiddle_h_rsc_0_3_i_bdwt(twiddle_h_rsc_0_3_i_bdwt),
      .twiddle_h_rsc_0_3_i_bcwt(twiddle_h_rsc_0_3_i_bcwt),
      .twiddle_h_rsc_0_3_i_s_raddr(twiddle_h_rsc_0_3_i_s_raddr),
      .twiddle_h_rsc_0_3_i_s_raddr_core_sct(twiddle_h_rsc_0_3_i_s_re_core_sct),
      .twiddle_h_rsc_0_3_i_s_din(twiddle_h_rsc_0_3_i_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_2_i
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_2_i (
  clk, rst, twiddle_h_rsc_0_2_s_tdone, twiddle_h_rsc_0_2_tr_write_done, twiddle_h_rsc_0_2_RREADY,
      twiddle_h_rsc_0_2_RVALID, twiddle_h_rsc_0_2_RUSER, twiddle_h_rsc_0_2_RLAST,
      twiddle_h_rsc_0_2_RRESP, twiddle_h_rsc_0_2_RDATA, twiddle_h_rsc_0_2_RID, twiddle_h_rsc_0_2_ARREADY,
      twiddle_h_rsc_0_2_ARVALID, twiddle_h_rsc_0_2_ARUSER, twiddle_h_rsc_0_2_ARREGION,
      twiddle_h_rsc_0_2_ARQOS, twiddle_h_rsc_0_2_ARPROT, twiddle_h_rsc_0_2_ARCACHE,
      twiddle_h_rsc_0_2_ARLOCK, twiddle_h_rsc_0_2_ARBURST, twiddle_h_rsc_0_2_ARSIZE,
      twiddle_h_rsc_0_2_ARLEN, twiddle_h_rsc_0_2_ARADDR, twiddle_h_rsc_0_2_ARID,
      twiddle_h_rsc_0_2_BREADY, twiddle_h_rsc_0_2_BVALID, twiddle_h_rsc_0_2_BUSER,
      twiddle_h_rsc_0_2_BRESP, twiddle_h_rsc_0_2_BID, twiddle_h_rsc_0_2_WREADY, twiddle_h_rsc_0_2_WVALID,
      twiddle_h_rsc_0_2_WUSER, twiddle_h_rsc_0_2_WLAST, twiddle_h_rsc_0_2_WSTRB,
      twiddle_h_rsc_0_2_WDATA, twiddle_h_rsc_0_2_AWREADY, twiddle_h_rsc_0_2_AWVALID,
      twiddle_h_rsc_0_2_AWUSER, twiddle_h_rsc_0_2_AWREGION, twiddle_h_rsc_0_2_AWQOS,
      twiddle_h_rsc_0_2_AWPROT, twiddle_h_rsc_0_2_AWCACHE, twiddle_h_rsc_0_2_AWLOCK,
      twiddle_h_rsc_0_2_AWBURST, twiddle_h_rsc_0_2_AWSIZE, twiddle_h_rsc_0_2_AWLEN,
      twiddle_h_rsc_0_2_AWADDR, twiddle_h_rsc_0_2_AWID, core_wen, twiddle_h_rsc_0_2_i_oswt,
      twiddle_h_rsc_0_2_i_wen_comp, twiddle_h_rsc_0_2_i_s_raddr_core, twiddle_h_rsc_0_2_i_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_h_rsc_0_2_s_tdone;
  input twiddle_h_rsc_0_2_tr_write_done;
  input twiddle_h_rsc_0_2_RREADY;
  output twiddle_h_rsc_0_2_RVALID;
  output twiddle_h_rsc_0_2_RUSER;
  output twiddle_h_rsc_0_2_RLAST;
  output [1:0] twiddle_h_rsc_0_2_RRESP;
  output [31:0] twiddle_h_rsc_0_2_RDATA;
  output twiddle_h_rsc_0_2_RID;
  output twiddle_h_rsc_0_2_ARREADY;
  input twiddle_h_rsc_0_2_ARVALID;
  input twiddle_h_rsc_0_2_ARUSER;
  input [3:0] twiddle_h_rsc_0_2_ARREGION;
  input [3:0] twiddle_h_rsc_0_2_ARQOS;
  input [2:0] twiddle_h_rsc_0_2_ARPROT;
  input [3:0] twiddle_h_rsc_0_2_ARCACHE;
  input twiddle_h_rsc_0_2_ARLOCK;
  input [1:0] twiddle_h_rsc_0_2_ARBURST;
  input [2:0] twiddle_h_rsc_0_2_ARSIZE;
  input [7:0] twiddle_h_rsc_0_2_ARLEN;
  input [11:0] twiddle_h_rsc_0_2_ARADDR;
  input twiddle_h_rsc_0_2_ARID;
  input twiddle_h_rsc_0_2_BREADY;
  output twiddle_h_rsc_0_2_BVALID;
  output twiddle_h_rsc_0_2_BUSER;
  output [1:0] twiddle_h_rsc_0_2_BRESP;
  output twiddle_h_rsc_0_2_BID;
  output twiddle_h_rsc_0_2_WREADY;
  input twiddle_h_rsc_0_2_WVALID;
  input twiddle_h_rsc_0_2_WUSER;
  input twiddle_h_rsc_0_2_WLAST;
  input [3:0] twiddle_h_rsc_0_2_WSTRB;
  input [31:0] twiddle_h_rsc_0_2_WDATA;
  output twiddle_h_rsc_0_2_AWREADY;
  input twiddle_h_rsc_0_2_AWVALID;
  input twiddle_h_rsc_0_2_AWUSER;
  input [3:0] twiddle_h_rsc_0_2_AWREGION;
  input [3:0] twiddle_h_rsc_0_2_AWQOS;
  input [2:0] twiddle_h_rsc_0_2_AWPROT;
  input [3:0] twiddle_h_rsc_0_2_AWCACHE;
  input twiddle_h_rsc_0_2_AWLOCK;
  input [1:0] twiddle_h_rsc_0_2_AWBURST;
  input [2:0] twiddle_h_rsc_0_2_AWSIZE;
  input [7:0] twiddle_h_rsc_0_2_AWLEN;
  input [11:0] twiddle_h_rsc_0_2_AWADDR;
  input twiddle_h_rsc_0_2_AWID;
  input core_wen;
  input twiddle_h_rsc_0_2_i_oswt;
  output twiddle_h_rsc_0_2_i_wen_comp;
  input [7:0] twiddle_h_rsc_0_2_i_s_raddr_core;
  output [31:0] twiddle_h_rsc_0_2_i_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_2_i_biwt;
  wire twiddle_h_rsc_0_2_i_bdwt;
  wire twiddle_h_rsc_0_2_i_bcwt;
  wire twiddle_h_rsc_0_2_i_s_re_core_sct;
  wire [7:0] twiddle_h_rsc_0_2_i_s_raddr;
  wire [31:0] twiddle_h_rsc_0_2_i_s_din;
  wire twiddle_h_rsc_0_2_i_s_rrdy;
  wire twiddle_h_rsc_0_2_i_s_wrdy;
  wire twiddle_h_rsc_0_2_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [7:0] nl_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_s_raddr_core
      = {1'b0 , (twiddle_h_rsc_0_2_i_s_raddr_core[6:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd256),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd8),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_h_rsc_0_2_i (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_h_rsc_0_2_AWID),
      .AWADDR(twiddle_h_rsc_0_2_AWADDR),
      .AWLEN(twiddle_h_rsc_0_2_AWLEN),
      .AWSIZE(twiddle_h_rsc_0_2_AWSIZE),
      .AWBURST(twiddle_h_rsc_0_2_AWBURST),
      .AWLOCK(twiddle_h_rsc_0_2_AWLOCK),
      .AWCACHE(twiddle_h_rsc_0_2_AWCACHE),
      .AWPROT(twiddle_h_rsc_0_2_AWPROT),
      .AWQOS(twiddle_h_rsc_0_2_AWQOS),
      .AWREGION(twiddle_h_rsc_0_2_AWREGION),
      .AWUSER(twiddle_h_rsc_0_2_AWUSER),
      .AWVALID(twiddle_h_rsc_0_2_AWVALID),
      .AWREADY(twiddle_h_rsc_0_2_AWREADY),
      .WDATA(twiddle_h_rsc_0_2_WDATA),
      .WSTRB(twiddle_h_rsc_0_2_WSTRB),
      .WLAST(twiddle_h_rsc_0_2_WLAST),
      .WUSER(twiddle_h_rsc_0_2_WUSER),
      .WVALID(twiddle_h_rsc_0_2_WVALID),
      .WREADY(twiddle_h_rsc_0_2_WREADY),
      .BID(twiddle_h_rsc_0_2_BID),
      .BRESP(twiddle_h_rsc_0_2_BRESP),
      .BUSER(twiddle_h_rsc_0_2_BUSER),
      .BVALID(twiddle_h_rsc_0_2_BVALID),
      .BREADY(twiddle_h_rsc_0_2_BREADY),
      .ARID(twiddle_h_rsc_0_2_ARID),
      .ARADDR(twiddle_h_rsc_0_2_ARADDR),
      .ARLEN(twiddle_h_rsc_0_2_ARLEN),
      .ARSIZE(twiddle_h_rsc_0_2_ARSIZE),
      .ARBURST(twiddle_h_rsc_0_2_ARBURST),
      .ARLOCK(twiddle_h_rsc_0_2_ARLOCK),
      .ARCACHE(twiddle_h_rsc_0_2_ARCACHE),
      .ARPROT(twiddle_h_rsc_0_2_ARPROT),
      .ARQOS(twiddle_h_rsc_0_2_ARQOS),
      .ARREGION(twiddle_h_rsc_0_2_ARREGION),
      .ARUSER(twiddle_h_rsc_0_2_ARUSER),
      .ARVALID(twiddle_h_rsc_0_2_ARVALID),
      .ARREADY(twiddle_h_rsc_0_2_ARREADY),
      .RID(twiddle_h_rsc_0_2_RID),
      .RDATA(twiddle_h_rsc_0_2_RDATA),
      .RRESP(twiddle_h_rsc_0_2_RRESP),
      .RLAST(twiddle_h_rsc_0_2_RLAST),
      .RUSER(twiddle_h_rsc_0_2_RUSER),
      .RVALID(twiddle_h_rsc_0_2_RVALID),
      .RREADY(twiddle_h_rsc_0_2_RREADY),
      .s_re(twiddle_h_rsc_0_2_i_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_h_rsc_0_2_i_s_raddr),
      .s_waddr(8'b00000000),
      .s_din(twiddle_h_rsc_0_2_i_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_h_rsc_0_2_i_s_rrdy),
      .s_wrdy(twiddle_h_rsc_0_2_i_s_wrdy),
      .is_idle(twiddle_h_rsc_0_2_is_idle),
      .tr_write_done(twiddle_h_rsc_0_2_tr_write_done),
      .s_tdone(twiddle_h_rsc_0_2_s_tdone)
    );
  peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_h_rsc_0_2_i_oswt(twiddle_h_rsc_0_2_i_oswt),
      .twiddle_h_rsc_0_2_i_biwt(twiddle_h_rsc_0_2_i_biwt),
      .twiddle_h_rsc_0_2_i_bdwt(twiddle_h_rsc_0_2_i_bdwt),
      .twiddle_h_rsc_0_2_i_bcwt(twiddle_h_rsc_0_2_i_bcwt),
      .twiddle_h_rsc_0_2_i_s_re_core_sct(twiddle_h_rsc_0_2_i_s_re_core_sct),
      .twiddle_h_rsc_0_2_i_s_rrdy(twiddle_h_rsc_0_2_i_s_rrdy)
    );
  peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_2_i_oswt(twiddle_h_rsc_0_2_i_oswt),
      .twiddle_h_rsc_0_2_i_wen_comp(twiddle_h_rsc_0_2_i_wen_comp),
      .twiddle_h_rsc_0_2_i_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsc_0_2_i_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_s_raddr_core[7:0]),
      .twiddle_h_rsc_0_2_i_s_din_mxwt(twiddle_h_rsc_0_2_i_s_din_mxwt),
      .twiddle_h_rsc_0_2_i_biwt(twiddle_h_rsc_0_2_i_biwt),
      .twiddle_h_rsc_0_2_i_bdwt(twiddle_h_rsc_0_2_i_bdwt),
      .twiddle_h_rsc_0_2_i_bcwt(twiddle_h_rsc_0_2_i_bcwt),
      .twiddle_h_rsc_0_2_i_s_raddr(twiddle_h_rsc_0_2_i_s_raddr),
      .twiddle_h_rsc_0_2_i_s_raddr_core_sct(twiddle_h_rsc_0_2_i_s_re_core_sct),
      .twiddle_h_rsc_0_2_i_s_din(twiddle_h_rsc_0_2_i_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_1_i
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_1_i (
  clk, rst, twiddle_h_rsc_0_1_s_tdone, twiddle_h_rsc_0_1_tr_write_done, twiddle_h_rsc_0_1_RREADY,
      twiddle_h_rsc_0_1_RVALID, twiddle_h_rsc_0_1_RUSER, twiddle_h_rsc_0_1_RLAST,
      twiddle_h_rsc_0_1_RRESP, twiddle_h_rsc_0_1_RDATA, twiddle_h_rsc_0_1_RID, twiddle_h_rsc_0_1_ARREADY,
      twiddle_h_rsc_0_1_ARVALID, twiddle_h_rsc_0_1_ARUSER, twiddle_h_rsc_0_1_ARREGION,
      twiddle_h_rsc_0_1_ARQOS, twiddle_h_rsc_0_1_ARPROT, twiddle_h_rsc_0_1_ARCACHE,
      twiddle_h_rsc_0_1_ARLOCK, twiddle_h_rsc_0_1_ARBURST, twiddle_h_rsc_0_1_ARSIZE,
      twiddle_h_rsc_0_1_ARLEN, twiddle_h_rsc_0_1_ARADDR, twiddle_h_rsc_0_1_ARID,
      twiddle_h_rsc_0_1_BREADY, twiddle_h_rsc_0_1_BVALID, twiddle_h_rsc_0_1_BUSER,
      twiddle_h_rsc_0_1_BRESP, twiddle_h_rsc_0_1_BID, twiddle_h_rsc_0_1_WREADY, twiddle_h_rsc_0_1_WVALID,
      twiddle_h_rsc_0_1_WUSER, twiddle_h_rsc_0_1_WLAST, twiddle_h_rsc_0_1_WSTRB,
      twiddle_h_rsc_0_1_WDATA, twiddle_h_rsc_0_1_AWREADY, twiddle_h_rsc_0_1_AWVALID,
      twiddle_h_rsc_0_1_AWUSER, twiddle_h_rsc_0_1_AWREGION, twiddle_h_rsc_0_1_AWQOS,
      twiddle_h_rsc_0_1_AWPROT, twiddle_h_rsc_0_1_AWCACHE, twiddle_h_rsc_0_1_AWLOCK,
      twiddle_h_rsc_0_1_AWBURST, twiddle_h_rsc_0_1_AWSIZE, twiddle_h_rsc_0_1_AWLEN,
      twiddle_h_rsc_0_1_AWADDR, twiddle_h_rsc_0_1_AWID, core_wen, twiddle_h_rsc_0_1_i_oswt,
      twiddle_h_rsc_0_1_i_wen_comp, twiddle_h_rsc_0_1_i_s_raddr_core, twiddle_h_rsc_0_1_i_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_h_rsc_0_1_s_tdone;
  input twiddle_h_rsc_0_1_tr_write_done;
  input twiddle_h_rsc_0_1_RREADY;
  output twiddle_h_rsc_0_1_RVALID;
  output twiddle_h_rsc_0_1_RUSER;
  output twiddle_h_rsc_0_1_RLAST;
  output [1:0] twiddle_h_rsc_0_1_RRESP;
  output [31:0] twiddle_h_rsc_0_1_RDATA;
  output twiddle_h_rsc_0_1_RID;
  output twiddle_h_rsc_0_1_ARREADY;
  input twiddle_h_rsc_0_1_ARVALID;
  input twiddle_h_rsc_0_1_ARUSER;
  input [3:0] twiddle_h_rsc_0_1_ARREGION;
  input [3:0] twiddle_h_rsc_0_1_ARQOS;
  input [2:0] twiddle_h_rsc_0_1_ARPROT;
  input [3:0] twiddle_h_rsc_0_1_ARCACHE;
  input twiddle_h_rsc_0_1_ARLOCK;
  input [1:0] twiddle_h_rsc_0_1_ARBURST;
  input [2:0] twiddle_h_rsc_0_1_ARSIZE;
  input [7:0] twiddle_h_rsc_0_1_ARLEN;
  input [11:0] twiddle_h_rsc_0_1_ARADDR;
  input twiddle_h_rsc_0_1_ARID;
  input twiddle_h_rsc_0_1_BREADY;
  output twiddle_h_rsc_0_1_BVALID;
  output twiddle_h_rsc_0_1_BUSER;
  output [1:0] twiddle_h_rsc_0_1_BRESP;
  output twiddle_h_rsc_0_1_BID;
  output twiddle_h_rsc_0_1_WREADY;
  input twiddle_h_rsc_0_1_WVALID;
  input twiddle_h_rsc_0_1_WUSER;
  input twiddle_h_rsc_0_1_WLAST;
  input [3:0] twiddle_h_rsc_0_1_WSTRB;
  input [31:0] twiddle_h_rsc_0_1_WDATA;
  output twiddle_h_rsc_0_1_AWREADY;
  input twiddle_h_rsc_0_1_AWVALID;
  input twiddle_h_rsc_0_1_AWUSER;
  input [3:0] twiddle_h_rsc_0_1_AWREGION;
  input [3:0] twiddle_h_rsc_0_1_AWQOS;
  input [2:0] twiddle_h_rsc_0_1_AWPROT;
  input [3:0] twiddle_h_rsc_0_1_AWCACHE;
  input twiddle_h_rsc_0_1_AWLOCK;
  input [1:0] twiddle_h_rsc_0_1_AWBURST;
  input [2:0] twiddle_h_rsc_0_1_AWSIZE;
  input [7:0] twiddle_h_rsc_0_1_AWLEN;
  input [11:0] twiddle_h_rsc_0_1_AWADDR;
  input twiddle_h_rsc_0_1_AWID;
  input core_wen;
  input twiddle_h_rsc_0_1_i_oswt;
  output twiddle_h_rsc_0_1_i_wen_comp;
  input [7:0] twiddle_h_rsc_0_1_i_s_raddr_core;
  output [31:0] twiddle_h_rsc_0_1_i_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_1_i_biwt;
  wire twiddle_h_rsc_0_1_i_bdwt;
  wire twiddle_h_rsc_0_1_i_bcwt;
  wire twiddle_h_rsc_0_1_i_s_re_core_sct;
  wire [7:0] twiddle_h_rsc_0_1_i_s_raddr;
  wire [31:0] twiddle_h_rsc_0_1_i_s_din;
  wire twiddle_h_rsc_0_1_i_s_rrdy;
  wire twiddle_h_rsc_0_1_i_s_wrdy;
  wire twiddle_h_rsc_0_1_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [7:0] nl_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_s_raddr_core
      = {1'b0 , (twiddle_h_rsc_0_1_i_s_raddr_core[6:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd256),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd8),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_h_rsc_0_1_i (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_h_rsc_0_1_AWID),
      .AWADDR(twiddle_h_rsc_0_1_AWADDR),
      .AWLEN(twiddle_h_rsc_0_1_AWLEN),
      .AWSIZE(twiddle_h_rsc_0_1_AWSIZE),
      .AWBURST(twiddle_h_rsc_0_1_AWBURST),
      .AWLOCK(twiddle_h_rsc_0_1_AWLOCK),
      .AWCACHE(twiddle_h_rsc_0_1_AWCACHE),
      .AWPROT(twiddle_h_rsc_0_1_AWPROT),
      .AWQOS(twiddle_h_rsc_0_1_AWQOS),
      .AWREGION(twiddle_h_rsc_0_1_AWREGION),
      .AWUSER(twiddle_h_rsc_0_1_AWUSER),
      .AWVALID(twiddle_h_rsc_0_1_AWVALID),
      .AWREADY(twiddle_h_rsc_0_1_AWREADY),
      .WDATA(twiddle_h_rsc_0_1_WDATA),
      .WSTRB(twiddle_h_rsc_0_1_WSTRB),
      .WLAST(twiddle_h_rsc_0_1_WLAST),
      .WUSER(twiddle_h_rsc_0_1_WUSER),
      .WVALID(twiddle_h_rsc_0_1_WVALID),
      .WREADY(twiddle_h_rsc_0_1_WREADY),
      .BID(twiddle_h_rsc_0_1_BID),
      .BRESP(twiddle_h_rsc_0_1_BRESP),
      .BUSER(twiddle_h_rsc_0_1_BUSER),
      .BVALID(twiddle_h_rsc_0_1_BVALID),
      .BREADY(twiddle_h_rsc_0_1_BREADY),
      .ARID(twiddle_h_rsc_0_1_ARID),
      .ARADDR(twiddle_h_rsc_0_1_ARADDR),
      .ARLEN(twiddle_h_rsc_0_1_ARLEN),
      .ARSIZE(twiddle_h_rsc_0_1_ARSIZE),
      .ARBURST(twiddle_h_rsc_0_1_ARBURST),
      .ARLOCK(twiddle_h_rsc_0_1_ARLOCK),
      .ARCACHE(twiddle_h_rsc_0_1_ARCACHE),
      .ARPROT(twiddle_h_rsc_0_1_ARPROT),
      .ARQOS(twiddle_h_rsc_0_1_ARQOS),
      .ARREGION(twiddle_h_rsc_0_1_ARREGION),
      .ARUSER(twiddle_h_rsc_0_1_ARUSER),
      .ARVALID(twiddle_h_rsc_0_1_ARVALID),
      .ARREADY(twiddle_h_rsc_0_1_ARREADY),
      .RID(twiddle_h_rsc_0_1_RID),
      .RDATA(twiddle_h_rsc_0_1_RDATA),
      .RRESP(twiddle_h_rsc_0_1_RRESP),
      .RLAST(twiddle_h_rsc_0_1_RLAST),
      .RUSER(twiddle_h_rsc_0_1_RUSER),
      .RVALID(twiddle_h_rsc_0_1_RVALID),
      .RREADY(twiddle_h_rsc_0_1_RREADY),
      .s_re(twiddle_h_rsc_0_1_i_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_h_rsc_0_1_i_s_raddr),
      .s_waddr(8'b00000000),
      .s_din(twiddle_h_rsc_0_1_i_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_h_rsc_0_1_i_s_rrdy),
      .s_wrdy(twiddle_h_rsc_0_1_i_s_wrdy),
      .is_idle(twiddle_h_rsc_0_1_is_idle),
      .tr_write_done(twiddle_h_rsc_0_1_tr_write_done),
      .s_tdone(twiddle_h_rsc_0_1_s_tdone)
    );
  peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_h_rsc_0_1_i_oswt(twiddle_h_rsc_0_1_i_oswt),
      .twiddle_h_rsc_0_1_i_biwt(twiddle_h_rsc_0_1_i_biwt),
      .twiddle_h_rsc_0_1_i_bdwt(twiddle_h_rsc_0_1_i_bdwt),
      .twiddle_h_rsc_0_1_i_bcwt(twiddle_h_rsc_0_1_i_bcwt),
      .twiddle_h_rsc_0_1_i_s_re_core_sct(twiddle_h_rsc_0_1_i_s_re_core_sct),
      .twiddle_h_rsc_0_1_i_s_rrdy(twiddle_h_rsc_0_1_i_s_rrdy)
    );
  peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_1_i_oswt(twiddle_h_rsc_0_1_i_oswt),
      .twiddle_h_rsc_0_1_i_wen_comp(twiddle_h_rsc_0_1_i_wen_comp),
      .twiddle_h_rsc_0_1_i_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsc_0_1_i_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_s_raddr_core[7:0]),
      .twiddle_h_rsc_0_1_i_s_din_mxwt(twiddle_h_rsc_0_1_i_s_din_mxwt),
      .twiddle_h_rsc_0_1_i_biwt(twiddle_h_rsc_0_1_i_biwt),
      .twiddle_h_rsc_0_1_i_bdwt(twiddle_h_rsc_0_1_i_bdwt),
      .twiddle_h_rsc_0_1_i_bcwt(twiddle_h_rsc_0_1_i_bcwt),
      .twiddle_h_rsc_0_1_i_s_raddr(twiddle_h_rsc_0_1_i_s_raddr),
      .twiddle_h_rsc_0_1_i_s_raddr_core_sct(twiddle_h_rsc_0_1_i_s_re_core_sct),
      .twiddle_h_rsc_0_1_i_s_din(twiddle_h_rsc_0_1_i_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_0_0_i
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_0_0_i (
  clk, rst, twiddle_h_rsc_0_0_s_tdone, twiddle_h_rsc_0_0_tr_write_done, twiddle_h_rsc_0_0_RREADY,
      twiddle_h_rsc_0_0_RVALID, twiddle_h_rsc_0_0_RUSER, twiddle_h_rsc_0_0_RLAST,
      twiddle_h_rsc_0_0_RRESP, twiddle_h_rsc_0_0_RDATA, twiddle_h_rsc_0_0_RID, twiddle_h_rsc_0_0_ARREADY,
      twiddle_h_rsc_0_0_ARVALID, twiddle_h_rsc_0_0_ARUSER, twiddle_h_rsc_0_0_ARREGION,
      twiddle_h_rsc_0_0_ARQOS, twiddle_h_rsc_0_0_ARPROT, twiddle_h_rsc_0_0_ARCACHE,
      twiddle_h_rsc_0_0_ARLOCK, twiddle_h_rsc_0_0_ARBURST, twiddle_h_rsc_0_0_ARSIZE,
      twiddle_h_rsc_0_0_ARLEN, twiddle_h_rsc_0_0_ARADDR, twiddle_h_rsc_0_0_ARID,
      twiddle_h_rsc_0_0_BREADY, twiddle_h_rsc_0_0_BVALID, twiddle_h_rsc_0_0_BUSER,
      twiddle_h_rsc_0_0_BRESP, twiddle_h_rsc_0_0_BID, twiddle_h_rsc_0_0_WREADY, twiddle_h_rsc_0_0_WVALID,
      twiddle_h_rsc_0_0_WUSER, twiddle_h_rsc_0_0_WLAST, twiddle_h_rsc_0_0_WSTRB,
      twiddle_h_rsc_0_0_WDATA, twiddle_h_rsc_0_0_AWREADY, twiddle_h_rsc_0_0_AWVALID,
      twiddle_h_rsc_0_0_AWUSER, twiddle_h_rsc_0_0_AWREGION, twiddle_h_rsc_0_0_AWQOS,
      twiddle_h_rsc_0_0_AWPROT, twiddle_h_rsc_0_0_AWCACHE, twiddle_h_rsc_0_0_AWLOCK,
      twiddle_h_rsc_0_0_AWBURST, twiddle_h_rsc_0_0_AWSIZE, twiddle_h_rsc_0_0_AWLEN,
      twiddle_h_rsc_0_0_AWADDR, twiddle_h_rsc_0_0_AWID, core_wen, twiddle_h_rsc_0_0_i_oswt,
      twiddle_h_rsc_0_0_i_wen_comp, twiddle_h_rsc_0_0_i_s_raddr_core, twiddle_h_rsc_0_0_i_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_h_rsc_0_0_s_tdone;
  input twiddle_h_rsc_0_0_tr_write_done;
  input twiddle_h_rsc_0_0_RREADY;
  output twiddle_h_rsc_0_0_RVALID;
  output twiddle_h_rsc_0_0_RUSER;
  output twiddle_h_rsc_0_0_RLAST;
  output [1:0] twiddle_h_rsc_0_0_RRESP;
  output [31:0] twiddle_h_rsc_0_0_RDATA;
  output twiddle_h_rsc_0_0_RID;
  output twiddle_h_rsc_0_0_ARREADY;
  input twiddle_h_rsc_0_0_ARVALID;
  input twiddle_h_rsc_0_0_ARUSER;
  input [3:0] twiddle_h_rsc_0_0_ARREGION;
  input [3:0] twiddle_h_rsc_0_0_ARQOS;
  input [2:0] twiddle_h_rsc_0_0_ARPROT;
  input [3:0] twiddle_h_rsc_0_0_ARCACHE;
  input twiddle_h_rsc_0_0_ARLOCK;
  input [1:0] twiddle_h_rsc_0_0_ARBURST;
  input [2:0] twiddle_h_rsc_0_0_ARSIZE;
  input [7:0] twiddle_h_rsc_0_0_ARLEN;
  input [11:0] twiddle_h_rsc_0_0_ARADDR;
  input twiddle_h_rsc_0_0_ARID;
  input twiddle_h_rsc_0_0_BREADY;
  output twiddle_h_rsc_0_0_BVALID;
  output twiddle_h_rsc_0_0_BUSER;
  output [1:0] twiddle_h_rsc_0_0_BRESP;
  output twiddle_h_rsc_0_0_BID;
  output twiddle_h_rsc_0_0_WREADY;
  input twiddle_h_rsc_0_0_WVALID;
  input twiddle_h_rsc_0_0_WUSER;
  input twiddle_h_rsc_0_0_WLAST;
  input [3:0] twiddle_h_rsc_0_0_WSTRB;
  input [31:0] twiddle_h_rsc_0_0_WDATA;
  output twiddle_h_rsc_0_0_AWREADY;
  input twiddle_h_rsc_0_0_AWVALID;
  input twiddle_h_rsc_0_0_AWUSER;
  input [3:0] twiddle_h_rsc_0_0_AWREGION;
  input [3:0] twiddle_h_rsc_0_0_AWQOS;
  input [2:0] twiddle_h_rsc_0_0_AWPROT;
  input [3:0] twiddle_h_rsc_0_0_AWCACHE;
  input twiddle_h_rsc_0_0_AWLOCK;
  input [1:0] twiddle_h_rsc_0_0_AWBURST;
  input [2:0] twiddle_h_rsc_0_0_AWSIZE;
  input [7:0] twiddle_h_rsc_0_0_AWLEN;
  input [11:0] twiddle_h_rsc_0_0_AWADDR;
  input twiddle_h_rsc_0_0_AWID;
  input core_wen;
  input twiddle_h_rsc_0_0_i_oswt;
  output twiddle_h_rsc_0_0_i_wen_comp;
  input [7:0] twiddle_h_rsc_0_0_i_s_raddr_core;
  output [31:0] twiddle_h_rsc_0_0_i_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_0_i_biwt;
  wire twiddle_h_rsc_0_0_i_bdwt;
  wire twiddle_h_rsc_0_0_i_bcwt;
  wire twiddle_h_rsc_0_0_i_s_re_core_sct;
  wire [7:0] twiddle_h_rsc_0_0_i_s_raddr;
  wire [31:0] twiddle_h_rsc_0_0_i_s_din;
  wire twiddle_h_rsc_0_0_i_s_rrdy;
  wire twiddle_h_rsc_0_0_i_s_wrdy;
  wire twiddle_h_rsc_0_0_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [7:0] nl_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_s_raddr_core
      = {1'b0 , (twiddle_h_rsc_0_0_i_s_raddr_core[6:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd256),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd8),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_h_rsc_0_0_i (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_h_rsc_0_0_AWID),
      .AWADDR(twiddle_h_rsc_0_0_AWADDR),
      .AWLEN(twiddle_h_rsc_0_0_AWLEN),
      .AWSIZE(twiddle_h_rsc_0_0_AWSIZE),
      .AWBURST(twiddle_h_rsc_0_0_AWBURST),
      .AWLOCK(twiddle_h_rsc_0_0_AWLOCK),
      .AWCACHE(twiddle_h_rsc_0_0_AWCACHE),
      .AWPROT(twiddle_h_rsc_0_0_AWPROT),
      .AWQOS(twiddle_h_rsc_0_0_AWQOS),
      .AWREGION(twiddle_h_rsc_0_0_AWREGION),
      .AWUSER(twiddle_h_rsc_0_0_AWUSER),
      .AWVALID(twiddle_h_rsc_0_0_AWVALID),
      .AWREADY(twiddle_h_rsc_0_0_AWREADY),
      .WDATA(twiddle_h_rsc_0_0_WDATA),
      .WSTRB(twiddle_h_rsc_0_0_WSTRB),
      .WLAST(twiddle_h_rsc_0_0_WLAST),
      .WUSER(twiddle_h_rsc_0_0_WUSER),
      .WVALID(twiddle_h_rsc_0_0_WVALID),
      .WREADY(twiddle_h_rsc_0_0_WREADY),
      .BID(twiddle_h_rsc_0_0_BID),
      .BRESP(twiddle_h_rsc_0_0_BRESP),
      .BUSER(twiddle_h_rsc_0_0_BUSER),
      .BVALID(twiddle_h_rsc_0_0_BVALID),
      .BREADY(twiddle_h_rsc_0_0_BREADY),
      .ARID(twiddle_h_rsc_0_0_ARID),
      .ARADDR(twiddle_h_rsc_0_0_ARADDR),
      .ARLEN(twiddle_h_rsc_0_0_ARLEN),
      .ARSIZE(twiddle_h_rsc_0_0_ARSIZE),
      .ARBURST(twiddle_h_rsc_0_0_ARBURST),
      .ARLOCK(twiddle_h_rsc_0_0_ARLOCK),
      .ARCACHE(twiddle_h_rsc_0_0_ARCACHE),
      .ARPROT(twiddle_h_rsc_0_0_ARPROT),
      .ARQOS(twiddle_h_rsc_0_0_ARQOS),
      .ARREGION(twiddle_h_rsc_0_0_ARREGION),
      .ARUSER(twiddle_h_rsc_0_0_ARUSER),
      .ARVALID(twiddle_h_rsc_0_0_ARVALID),
      .ARREADY(twiddle_h_rsc_0_0_ARREADY),
      .RID(twiddle_h_rsc_0_0_RID),
      .RDATA(twiddle_h_rsc_0_0_RDATA),
      .RRESP(twiddle_h_rsc_0_0_RRESP),
      .RLAST(twiddle_h_rsc_0_0_RLAST),
      .RUSER(twiddle_h_rsc_0_0_RUSER),
      .RVALID(twiddle_h_rsc_0_0_RVALID),
      .RREADY(twiddle_h_rsc_0_0_RREADY),
      .s_re(twiddle_h_rsc_0_0_i_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_h_rsc_0_0_i_s_raddr),
      .s_waddr(8'b00000000),
      .s_din(twiddle_h_rsc_0_0_i_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_h_rsc_0_0_i_s_rrdy),
      .s_wrdy(twiddle_h_rsc_0_0_i_s_wrdy),
      .is_idle(twiddle_h_rsc_0_0_is_idle),
      .tr_write_done(twiddle_h_rsc_0_0_tr_write_done),
      .s_tdone(twiddle_h_rsc_0_0_s_tdone)
    );
  peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_h_rsc_0_0_i_oswt(twiddle_h_rsc_0_0_i_oswt),
      .twiddle_h_rsc_0_0_i_biwt(twiddle_h_rsc_0_0_i_biwt),
      .twiddle_h_rsc_0_0_i_bdwt(twiddle_h_rsc_0_0_i_bdwt),
      .twiddle_h_rsc_0_0_i_bcwt(twiddle_h_rsc_0_0_i_bcwt),
      .twiddle_h_rsc_0_0_i_s_re_core_sct(twiddle_h_rsc_0_0_i_s_re_core_sct),
      .twiddle_h_rsc_0_0_i_s_rrdy(twiddle_h_rsc_0_0_i_s_rrdy)
    );
  peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_0_i_oswt(twiddle_h_rsc_0_0_i_oswt),
      .twiddle_h_rsc_0_0_i_wen_comp(twiddle_h_rsc_0_0_i_wen_comp),
      .twiddle_h_rsc_0_0_i_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsc_0_0_i_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_s_raddr_core[7:0]),
      .twiddle_h_rsc_0_0_i_s_din_mxwt(twiddle_h_rsc_0_0_i_s_din_mxwt),
      .twiddle_h_rsc_0_0_i_biwt(twiddle_h_rsc_0_0_i_biwt),
      .twiddle_h_rsc_0_0_i_bdwt(twiddle_h_rsc_0_0_i_bdwt),
      .twiddle_h_rsc_0_0_i_bcwt(twiddle_h_rsc_0_0_i_bcwt),
      .twiddle_h_rsc_0_0_i_s_raddr(twiddle_h_rsc_0_0_i_s_raddr),
      .twiddle_h_rsc_0_0_i_s_raddr_core_sct(twiddle_h_rsc_0_0_i_s_re_core_sct),
      .twiddle_h_rsc_0_0_i_s_din(twiddle_h_rsc_0_0_i_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_3_i
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_3_i (
  clk, rst, twiddle_rsc_0_3_s_tdone, twiddle_rsc_0_3_tr_write_done, twiddle_rsc_0_3_RREADY,
      twiddle_rsc_0_3_RVALID, twiddle_rsc_0_3_RUSER, twiddle_rsc_0_3_RLAST, twiddle_rsc_0_3_RRESP,
      twiddle_rsc_0_3_RDATA, twiddle_rsc_0_3_RID, twiddle_rsc_0_3_ARREADY, twiddle_rsc_0_3_ARVALID,
      twiddle_rsc_0_3_ARUSER, twiddle_rsc_0_3_ARREGION, twiddle_rsc_0_3_ARQOS, twiddle_rsc_0_3_ARPROT,
      twiddle_rsc_0_3_ARCACHE, twiddle_rsc_0_3_ARLOCK, twiddle_rsc_0_3_ARBURST, twiddle_rsc_0_3_ARSIZE,
      twiddle_rsc_0_3_ARLEN, twiddle_rsc_0_3_ARADDR, twiddle_rsc_0_3_ARID, twiddle_rsc_0_3_BREADY,
      twiddle_rsc_0_3_BVALID, twiddle_rsc_0_3_BUSER, twiddle_rsc_0_3_BRESP, twiddle_rsc_0_3_BID,
      twiddle_rsc_0_3_WREADY, twiddle_rsc_0_3_WVALID, twiddle_rsc_0_3_WUSER, twiddle_rsc_0_3_WLAST,
      twiddle_rsc_0_3_WSTRB, twiddle_rsc_0_3_WDATA, twiddle_rsc_0_3_AWREADY, twiddle_rsc_0_3_AWVALID,
      twiddle_rsc_0_3_AWUSER, twiddle_rsc_0_3_AWREGION, twiddle_rsc_0_3_AWQOS, twiddle_rsc_0_3_AWPROT,
      twiddle_rsc_0_3_AWCACHE, twiddle_rsc_0_3_AWLOCK, twiddle_rsc_0_3_AWBURST, twiddle_rsc_0_3_AWSIZE,
      twiddle_rsc_0_3_AWLEN, twiddle_rsc_0_3_AWADDR, twiddle_rsc_0_3_AWID, core_wen,
      twiddle_rsc_0_3_i_oswt, twiddle_rsc_0_3_i_wen_comp, twiddle_rsc_0_3_i_s_raddr_core,
      twiddle_rsc_0_3_i_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_rsc_0_3_s_tdone;
  input twiddle_rsc_0_3_tr_write_done;
  input twiddle_rsc_0_3_RREADY;
  output twiddle_rsc_0_3_RVALID;
  output twiddle_rsc_0_3_RUSER;
  output twiddle_rsc_0_3_RLAST;
  output [1:0] twiddle_rsc_0_3_RRESP;
  output [31:0] twiddle_rsc_0_3_RDATA;
  output twiddle_rsc_0_3_RID;
  output twiddle_rsc_0_3_ARREADY;
  input twiddle_rsc_0_3_ARVALID;
  input twiddle_rsc_0_3_ARUSER;
  input [3:0] twiddle_rsc_0_3_ARREGION;
  input [3:0] twiddle_rsc_0_3_ARQOS;
  input [2:0] twiddle_rsc_0_3_ARPROT;
  input [3:0] twiddle_rsc_0_3_ARCACHE;
  input twiddle_rsc_0_3_ARLOCK;
  input [1:0] twiddle_rsc_0_3_ARBURST;
  input [2:0] twiddle_rsc_0_3_ARSIZE;
  input [7:0] twiddle_rsc_0_3_ARLEN;
  input [11:0] twiddle_rsc_0_3_ARADDR;
  input twiddle_rsc_0_3_ARID;
  input twiddle_rsc_0_3_BREADY;
  output twiddle_rsc_0_3_BVALID;
  output twiddle_rsc_0_3_BUSER;
  output [1:0] twiddle_rsc_0_3_BRESP;
  output twiddle_rsc_0_3_BID;
  output twiddle_rsc_0_3_WREADY;
  input twiddle_rsc_0_3_WVALID;
  input twiddle_rsc_0_3_WUSER;
  input twiddle_rsc_0_3_WLAST;
  input [3:0] twiddle_rsc_0_3_WSTRB;
  input [31:0] twiddle_rsc_0_3_WDATA;
  output twiddle_rsc_0_3_AWREADY;
  input twiddle_rsc_0_3_AWVALID;
  input twiddle_rsc_0_3_AWUSER;
  input [3:0] twiddle_rsc_0_3_AWREGION;
  input [3:0] twiddle_rsc_0_3_AWQOS;
  input [2:0] twiddle_rsc_0_3_AWPROT;
  input [3:0] twiddle_rsc_0_3_AWCACHE;
  input twiddle_rsc_0_3_AWLOCK;
  input [1:0] twiddle_rsc_0_3_AWBURST;
  input [2:0] twiddle_rsc_0_3_AWSIZE;
  input [7:0] twiddle_rsc_0_3_AWLEN;
  input [11:0] twiddle_rsc_0_3_AWADDR;
  input twiddle_rsc_0_3_AWID;
  input core_wen;
  input twiddle_rsc_0_3_i_oswt;
  output twiddle_rsc_0_3_i_wen_comp;
  input [7:0] twiddle_rsc_0_3_i_s_raddr_core;
  output [31:0] twiddle_rsc_0_3_i_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_rsc_0_3_i_biwt;
  wire twiddle_rsc_0_3_i_bdwt;
  wire twiddle_rsc_0_3_i_bcwt;
  wire twiddle_rsc_0_3_i_s_re_core_sct;
  wire [7:0] twiddle_rsc_0_3_i_s_raddr;
  wire [31:0] twiddle_rsc_0_3_i_s_din;
  wire twiddle_rsc_0_3_i_s_rrdy;
  wire twiddle_rsc_0_3_i_s_wrdy;
  wire twiddle_rsc_0_3_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [7:0] nl_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_s_raddr_core
      = {1'b0 , (twiddle_rsc_0_3_i_s_raddr_core[6:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd256),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd8),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_rsc_0_3_i (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_rsc_0_3_AWID),
      .AWADDR(twiddle_rsc_0_3_AWADDR),
      .AWLEN(twiddle_rsc_0_3_AWLEN),
      .AWSIZE(twiddle_rsc_0_3_AWSIZE),
      .AWBURST(twiddle_rsc_0_3_AWBURST),
      .AWLOCK(twiddle_rsc_0_3_AWLOCK),
      .AWCACHE(twiddle_rsc_0_3_AWCACHE),
      .AWPROT(twiddle_rsc_0_3_AWPROT),
      .AWQOS(twiddle_rsc_0_3_AWQOS),
      .AWREGION(twiddle_rsc_0_3_AWREGION),
      .AWUSER(twiddle_rsc_0_3_AWUSER),
      .AWVALID(twiddle_rsc_0_3_AWVALID),
      .AWREADY(twiddle_rsc_0_3_AWREADY),
      .WDATA(twiddle_rsc_0_3_WDATA),
      .WSTRB(twiddle_rsc_0_3_WSTRB),
      .WLAST(twiddle_rsc_0_3_WLAST),
      .WUSER(twiddle_rsc_0_3_WUSER),
      .WVALID(twiddle_rsc_0_3_WVALID),
      .WREADY(twiddle_rsc_0_3_WREADY),
      .BID(twiddle_rsc_0_3_BID),
      .BRESP(twiddle_rsc_0_3_BRESP),
      .BUSER(twiddle_rsc_0_3_BUSER),
      .BVALID(twiddle_rsc_0_3_BVALID),
      .BREADY(twiddle_rsc_0_3_BREADY),
      .ARID(twiddle_rsc_0_3_ARID),
      .ARADDR(twiddle_rsc_0_3_ARADDR),
      .ARLEN(twiddle_rsc_0_3_ARLEN),
      .ARSIZE(twiddle_rsc_0_3_ARSIZE),
      .ARBURST(twiddle_rsc_0_3_ARBURST),
      .ARLOCK(twiddle_rsc_0_3_ARLOCK),
      .ARCACHE(twiddle_rsc_0_3_ARCACHE),
      .ARPROT(twiddle_rsc_0_3_ARPROT),
      .ARQOS(twiddle_rsc_0_3_ARQOS),
      .ARREGION(twiddle_rsc_0_3_ARREGION),
      .ARUSER(twiddle_rsc_0_3_ARUSER),
      .ARVALID(twiddle_rsc_0_3_ARVALID),
      .ARREADY(twiddle_rsc_0_3_ARREADY),
      .RID(twiddle_rsc_0_3_RID),
      .RDATA(twiddle_rsc_0_3_RDATA),
      .RRESP(twiddle_rsc_0_3_RRESP),
      .RLAST(twiddle_rsc_0_3_RLAST),
      .RUSER(twiddle_rsc_0_3_RUSER),
      .RVALID(twiddle_rsc_0_3_RVALID),
      .RREADY(twiddle_rsc_0_3_RREADY),
      .s_re(twiddle_rsc_0_3_i_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_rsc_0_3_i_s_raddr),
      .s_waddr(8'b00000000),
      .s_din(twiddle_rsc_0_3_i_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_rsc_0_3_i_s_rrdy),
      .s_wrdy(twiddle_rsc_0_3_i_s_wrdy),
      .is_idle(twiddle_rsc_0_3_is_idle),
      .tr_write_done(twiddle_rsc_0_3_tr_write_done),
      .s_tdone(twiddle_rsc_0_3_s_tdone)
    );
  peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_rsc_0_3_i_oswt(twiddle_rsc_0_3_i_oswt),
      .twiddle_rsc_0_3_i_biwt(twiddle_rsc_0_3_i_biwt),
      .twiddle_rsc_0_3_i_bdwt(twiddle_rsc_0_3_i_bdwt),
      .twiddle_rsc_0_3_i_bcwt(twiddle_rsc_0_3_i_bcwt),
      .twiddle_rsc_0_3_i_s_re_core_sct(twiddle_rsc_0_3_i_s_re_core_sct),
      .twiddle_rsc_0_3_i_s_rrdy(twiddle_rsc_0_3_i_s_rrdy)
    );
  peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_3_i_oswt(twiddle_rsc_0_3_i_oswt),
      .twiddle_rsc_0_3_i_wen_comp(twiddle_rsc_0_3_i_wen_comp),
      .twiddle_rsc_0_3_i_s_raddr_core(nl_peaseNTT_core_twiddle_rsc_0_3_i_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_s_raddr_core[7:0]),
      .twiddle_rsc_0_3_i_s_din_mxwt(twiddle_rsc_0_3_i_s_din_mxwt),
      .twiddle_rsc_0_3_i_biwt(twiddle_rsc_0_3_i_biwt),
      .twiddle_rsc_0_3_i_bdwt(twiddle_rsc_0_3_i_bdwt),
      .twiddle_rsc_0_3_i_bcwt(twiddle_rsc_0_3_i_bcwt),
      .twiddle_rsc_0_3_i_s_raddr(twiddle_rsc_0_3_i_s_raddr),
      .twiddle_rsc_0_3_i_s_raddr_core_sct(twiddle_rsc_0_3_i_s_re_core_sct),
      .twiddle_rsc_0_3_i_s_din(twiddle_rsc_0_3_i_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_2_i
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_2_i (
  clk, rst, twiddle_rsc_0_2_s_tdone, twiddle_rsc_0_2_tr_write_done, twiddle_rsc_0_2_RREADY,
      twiddle_rsc_0_2_RVALID, twiddle_rsc_0_2_RUSER, twiddle_rsc_0_2_RLAST, twiddle_rsc_0_2_RRESP,
      twiddle_rsc_0_2_RDATA, twiddle_rsc_0_2_RID, twiddle_rsc_0_2_ARREADY, twiddle_rsc_0_2_ARVALID,
      twiddle_rsc_0_2_ARUSER, twiddle_rsc_0_2_ARREGION, twiddle_rsc_0_2_ARQOS, twiddle_rsc_0_2_ARPROT,
      twiddle_rsc_0_2_ARCACHE, twiddle_rsc_0_2_ARLOCK, twiddle_rsc_0_2_ARBURST, twiddle_rsc_0_2_ARSIZE,
      twiddle_rsc_0_2_ARLEN, twiddle_rsc_0_2_ARADDR, twiddle_rsc_0_2_ARID, twiddle_rsc_0_2_BREADY,
      twiddle_rsc_0_2_BVALID, twiddle_rsc_0_2_BUSER, twiddle_rsc_0_2_BRESP, twiddle_rsc_0_2_BID,
      twiddle_rsc_0_2_WREADY, twiddle_rsc_0_2_WVALID, twiddle_rsc_0_2_WUSER, twiddle_rsc_0_2_WLAST,
      twiddle_rsc_0_2_WSTRB, twiddle_rsc_0_2_WDATA, twiddle_rsc_0_2_AWREADY, twiddle_rsc_0_2_AWVALID,
      twiddle_rsc_0_2_AWUSER, twiddle_rsc_0_2_AWREGION, twiddle_rsc_0_2_AWQOS, twiddle_rsc_0_2_AWPROT,
      twiddle_rsc_0_2_AWCACHE, twiddle_rsc_0_2_AWLOCK, twiddle_rsc_0_2_AWBURST, twiddle_rsc_0_2_AWSIZE,
      twiddle_rsc_0_2_AWLEN, twiddle_rsc_0_2_AWADDR, twiddle_rsc_0_2_AWID, core_wen,
      twiddle_rsc_0_2_i_oswt, twiddle_rsc_0_2_i_wen_comp, twiddle_rsc_0_2_i_s_raddr_core,
      twiddle_rsc_0_2_i_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_rsc_0_2_s_tdone;
  input twiddle_rsc_0_2_tr_write_done;
  input twiddle_rsc_0_2_RREADY;
  output twiddle_rsc_0_2_RVALID;
  output twiddle_rsc_0_2_RUSER;
  output twiddle_rsc_0_2_RLAST;
  output [1:0] twiddle_rsc_0_2_RRESP;
  output [31:0] twiddle_rsc_0_2_RDATA;
  output twiddle_rsc_0_2_RID;
  output twiddle_rsc_0_2_ARREADY;
  input twiddle_rsc_0_2_ARVALID;
  input twiddle_rsc_0_2_ARUSER;
  input [3:0] twiddle_rsc_0_2_ARREGION;
  input [3:0] twiddle_rsc_0_2_ARQOS;
  input [2:0] twiddle_rsc_0_2_ARPROT;
  input [3:0] twiddle_rsc_0_2_ARCACHE;
  input twiddle_rsc_0_2_ARLOCK;
  input [1:0] twiddle_rsc_0_2_ARBURST;
  input [2:0] twiddle_rsc_0_2_ARSIZE;
  input [7:0] twiddle_rsc_0_2_ARLEN;
  input [11:0] twiddle_rsc_0_2_ARADDR;
  input twiddle_rsc_0_2_ARID;
  input twiddle_rsc_0_2_BREADY;
  output twiddle_rsc_0_2_BVALID;
  output twiddle_rsc_0_2_BUSER;
  output [1:0] twiddle_rsc_0_2_BRESP;
  output twiddle_rsc_0_2_BID;
  output twiddle_rsc_0_2_WREADY;
  input twiddle_rsc_0_2_WVALID;
  input twiddle_rsc_0_2_WUSER;
  input twiddle_rsc_0_2_WLAST;
  input [3:0] twiddle_rsc_0_2_WSTRB;
  input [31:0] twiddle_rsc_0_2_WDATA;
  output twiddle_rsc_0_2_AWREADY;
  input twiddle_rsc_0_2_AWVALID;
  input twiddle_rsc_0_2_AWUSER;
  input [3:0] twiddle_rsc_0_2_AWREGION;
  input [3:0] twiddle_rsc_0_2_AWQOS;
  input [2:0] twiddle_rsc_0_2_AWPROT;
  input [3:0] twiddle_rsc_0_2_AWCACHE;
  input twiddle_rsc_0_2_AWLOCK;
  input [1:0] twiddle_rsc_0_2_AWBURST;
  input [2:0] twiddle_rsc_0_2_AWSIZE;
  input [7:0] twiddle_rsc_0_2_AWLEN;
  input [11:0] twiddle_rsc_0_2_AWADDR;
  input twiddle_rsc_0_2_AWID;
  input core_wen;
  input twiddle_rsc_0_2_i_oswt;
  output twiddle_rsc_0_2_i_wen_comp;
  input [7:0] twiddle_rsc_0_2_i_s_raddr_core;
  output [31:0] twiddle_rsc_0_2_i_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_rsc_0_2_i_biwt;
  wire twiddle_rsc_0_2_i_bdwt;
  wire twiddle_rsc_0_2_i_bcwt;
  wire twiddle_rsc_0_2_i_s_re_core_sct;
  wire [7:0] twiddle_rsc_0_2_i_s_raddr;
  wire [31:0] twiddle_rsc_0_2_i_s_din;
  wire twiddle_rsc_0_2_i_s_rrdy;
  wire twiddle_rsc_0_2_i_s_wrdy;
  wire twiddle_rsc_0_2_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [7:0] nl_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_s_raddr_core
      = {1'b0 , (twiddle_rsc_0_2_i_s_raddr_core[6:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd256),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd8),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_rsc_0_2_i (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_rsc_0_2_AWID),
      .AWADDR(twiddle_rsc_0_2_AWADDR),
      .AWLEN(twiddle_rsc_0_2_AWLEN),
      .AWSIZE(twiddle_rsc_0_2_AWSIZE),
      .AWBURST(twiddle_rsc_0_2_AWBURST),
      .AWLOCK(twiddle_rsc_0_2_AWLOCK),
      .AWCACHE(twiddle_rsc_0_2_AWCACHE),
      .AWPROT(twiddle_rsc_0_2_AWPROT),
      .AWQOS(twiddle_rsc_0_2_AWQOS),
      .AWREGION(twiddle_rsc_0_2_AWREGION),
      .AWUSER(twiddle_rsc_0_2_AWUSER),
      .AWVALID(twiddle_rsc_0_2_AWVALID),
      .AWREADY(twiddle_rsc_0_2_AWREADY),
      .WDATA(twiddle_rsc_0_2_WDATA),
      .WSTRB(twiddle_rsc_0_2_WSTRB),
      .WLAST(twiddle_rsc_0_2_WLAST),
      .WUSER(twiddle_rsc_0_2_WUSER),
      .WVALID(twiddle_rsc_0_2_WVALID),
      .WREADY(twiddle_rsc_0_2_WREADY),
      .BID(twiddle_rsc_0_2_BID),
      .BRESP(twiddle_rsc_0_2_BRESP),
      .BUSER(twiddle_rsc_0_2_BUSER),
      .BVALID(twiddle_rsc_0_2_BVALID),
      .BREADY(twiddle_rsc_0_2_BREADY),
      .ARID(twiddle_rsc_0_2_ARID),
      .ARADDR(twiddle_rsc_0_2_ARADDR),
      .ARLEN(twiddle_rsc_0_2_ARLEN),
      .ARSIZE(twiddle_rsc_0_2_ARSIZE),
      .ARBURST(twiddle_rsc_0_2_ARBURST),
      .ARLOCK(twiddle_rsc_0_2_ARLOCK),
      .ARCACHE(twiddle_rsc_0_2_ARCACHE),
      .ARPROT(twiddle_rsc_0_2_ARPROT),
      .ARQOS(twiddle_rsc_0_2_ARQOS),
      .ARREGION(twiddle_rsc_0_2_ARREGION),
      .ARUSER(twiddle_rsc_0_2_ARUSER),
      .ARVALID(twiddle_rsc_0_2_ARVALID),
      .ARREADY(twiddle_rsc_0_2_ARREADY),
      .RID(twiddle_rsc_0_2_RID),
      .RDATA(twiddle_rsc_0_2_RDATA),
      .RRESP(twiddle_rsc_0_2_RRESP),
      .RLAST(twiddle_rsc_0_2_RLAST),
      .RUSER(twiddle_rsc_0_2_RUSER),
      .RVALID(twiddle_rsc_0_2_RVALID),
      .RREADY(twiddle_rsc_0_2_RREADY),
      .s_re(twiddle_rsc_0_2_i_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_rsc_0_2_i_s_raddr),
      .s_waddr(8'b00000000),
      .s_din(twiddle_rsc_0_2_i_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_rsc_0_2_i_s_rrdy),
      .s_wrdy(twiddle_rsc_0_2_i_s_wrdy),
      .is_idle(twiddle_rsc_0_2_is_idle),
      .tr_write_done(twiddle_rsc_0_2_tr_write_done),
      .s_tdone(twiddle_rsc_0_2_s_tdone)
    );
  peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_rsc_0_2_i_oswt(twiddle_rsc_0_2_i_oswt),
      .twiddle_rsc_0_2_i_biwt(twiddle_rsc_0_2_i_biwt),
      .twiddle_rsc_0_2_i_bdwt(twiddle_rsc_0_2_i_bdwt),
      .twiddle_rsc_0_2_i_bcwt(twiddle_rsc_0_2_i_bcwt),
      .twiddle_rsc_0_2_i_s_re_core_sct(twiddle_rsc_0_2_i_s_re_core_sct),
      .twiddle_rsc_0_2_i_s_rrdy(twiddle_rsc_0_2_i_s_rrdy)
    );
  peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_2_i_oswt(twiddle_rsc_0_2_i_oswt),
      .twiddle_rsc_0_2_i_wen_comp(twiddle_rsc_0_2_i_wen_comp),
      .twiddle_rsc_0_2_i_s_raddr_core(nl_peaseNTT_core_twiddle_rsc_0_2_i_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_s_raddr_core[7:0]),
      .twiddle_rsc_0_2_i_s_din_mxwt(twiddle_rsc_0_2_i_s_din_mxwt),
      .twiddle_rsc_0_2_i_biwt(twiddle_rsc_0_2_i_biwt),
      .twiddle_rsc_0_2_i_bdwt(twiddle_rsc_0_2_i_bdwt),
      .twiddle_rsc_0_2_i_bcwt(twiddle_rsc_0_2_i_bcwt),
      .twiddle_rsc_0_2_i_s_raddr(twiddle_rsc_0_2_i_s_raddr),
      .twiddle_rsc_0_2_i_s_raddr_core_sct(twiddle_rsc_0_2_i_s_re_core_sct),
      .twiddle_rsc_0_2_i_s_din(twiddle_rsc_0_2_i_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_1_i
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_1_i (
  clk, rst, twiddle_rsc_0_1_s_tdone, twiddle_rsc_0_1_tr_write_done, twiddle_rsc_0_1_RREADY,
      twiddle_rsc_0_1_RVALID, twiddle_rsc_0_1_RUSER, twiddle_rsc_0_1_RLAST, twiddle_rsc_0_1_RRESP,
      twiddle_rsc_0_1_RDATA, twiddle_rsc_0_1_RID, twiddle_rsc_0_1_ARREADY, twiddle_rsc_0_1_ARVALID,
      twiddle_rsc_0_1_ARUSER, twiddle_rsc_0_1_ARREGION, twiddle_rsc_0_1_ARQOS, twiddle_rsc_0_1_ARPROT,
      twiddle_rsc_0_1_ARCACHE, twiddle_rsc_0_1_ARLOCK, twiddle_rsc_0_1_ARBURST, twiddle_rsc_0_1_ARSIZE,
      twiddle_rsc_0_1_ARLEN, twiddle_rsc_0_1_ARADDR, twiddle_rsc_0_1_ARID, twiddle_rsc_0_1_BREADY,
      twiddle_rsc_0_1_BVALID, twiddle_rsc_0_1_BUSER, twiddle_rsc_0_1_BRESP, twiddle_rsc_0_1_BID,
      twiddle_rsc_0_1_WREADY, twiddle_rsc_0_1_WVALID, twiddle_rsc_0_1_WUSER, twiddle_rsc_0_1_WLAST,
      twiddle_rsc_0_1_WSTRB, twiddle_rsc_0_1_WDATA, twiddle_rsc_0_1_AWREADY, twiddle_rsc_0_1_AWVALID,
      twiddle_rsc_0_1_AWUSER, twiddle_rsc_0_1_AWREGION, twiddle_rsc_0_1_AWQOS, twiddle_rsc_0_1_AWPROT,
      twiddle_rsc_0_1_AWCACHE, twiddle_rsc_0_1_AWLOCK, twiddle_rsc_0_1_AWBURST, twiddle_rsc_0_1_AWSIZE,
      twiddle_rsc_0_1_AWLEN, twiddle_rsc_0_1_AWADDR, twiddle_rsc_0_1_AWID, core_wen,
      twiddle_rsc_0_1_i_oswt, twiddle_rsc_0_1_i_wen_comp, twiddle_rsc_0_1_i_s_raddr_core,
      twiddle_rsc_0_1_i_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_rsc_0_1_s_tdone;
  input twiddle_rsc_0_1_tr_write_done;
  input twiddle_rsc_0_1_RREADY;
  output twiddle_rsc_0_1_RVALID;
  output twiddle_rsc_0_1_RUSER;
  output twiddle_rsc_0_1_RLAST;
  output [1:0] twiddle_rsc_0_1_RRESP;
  output [31:0] twiddle_rsc_0_1_RDATA;
  output twiddle_rsc_0_1_RID;
  output twiddle_rsc_0_1_ARREADY;
  input twiddle_rsc_0_1_ARVALID;
  input twiddle_rsc_0_1_ARUSER;
  input [3:0] twiddle_rsc_0_1_ARREGION;
  input [3:0] twiddle_rsc_0_1_ARQOS;
  input [2:0] twiddle_rsc_0_1_ARPROT;
  input [3:0] twiddle_rsc_0_1_ARCACHE;
  input twiddle_rsc_0_1_ARLOCK;
  input [1:0] twiddle_rsc_0_1_ARBURST;
  input [2:0] twiddle_rsc_0_1_ARSIZE;
  input [7:0] twiddle_rsc_0_1_ARLEN;
  input [11:0] twiddle_rsc_0_1_ARADDR;
  input twiddle_rsc_0_1_ARID;
  input twiddle_rsc_0_1_BREADY;
  output twiddle_rsc_0_1_BVALID;
  output twiddle_rsc_0_1_BUSER;
  output [1:0] twiddle_rsc_0_1_BRESP;
  output twiddle_rsc_0_1_BID;
  output twiddle_rsc_0_1_WREADY;
  input twiddle_rsc_0_1_WVALID;
  input twiddle_rsc_0_1_WUSER;
  input twiddle_rsc_0_1_WLAST;
  input [3:0] twiddle_rsc_0_1_WSTRB;
  input [31:0] twiddle_rsc_0_1_WDATA;
  output twiddle_rsc_0_1_AWREADY;
  input twiddle_rsc_0_1_AWVALID;
  input twiddle_rsc_0_1_AWUSER;
  input [3:0] twiddle_rsc_0_1_AWREGION;
  input [3:0] twiddle_rsc_0_1_AWQOS;
  input [2:0] twiddle_rsc_0_1_AWPROT;
  input [3:0] twiddle_rsc_0_1_AWCACHE;
  input twiddle_rsc_0_1_AWLOCK;
  input [1:0] twiddle_rsc_0_1_AWBURST;
  input [2:0] twiddle_rsc_0_1_AWSIZE;
  input [7:0] twiddle_rsc_0_1_AWLEN;
  input [11:0] twiddle_rsc_0_1_AWADDR;
  input twiddle_rsc_0_1_AWID;
  input core_wen;
  input twiddle_rsc_0_1_i_oswt;
  output twiddle_rsc_0_1_i_wen_comp;
  input [7:0] twiddle_rsc_0_1_i_s_raddr_core;
  output [31:0] twiddle_rsc_0_1_i_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_rsc_0_1_i_biwt;
  wire twiddle_rsc_0_1_i_bdwt;
  wire twiddle_rsc_0_1_i_bcwt;
  wire twiddle_rsc_0_1_i_s_re_core_sct;
  wire [7:0] twiddle_rsc_0_1_i_s_raddr;
  wire [31:0] twiddle_rsc_0_1_i_s_din;
  wire twiddle_rsc_0_1_i_s_rrdy;
  wire twiddle_rsc_0_1_i_s_wrdy;
  wire twiddle_rsc_0_1_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [7:0] nl_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_s_raddr_core
      = {1'b0 , (twiddle_rsc_0_1_i_s_raddr_core[6:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd256),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd8),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_rsc_0_1_i (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_rsc_0_1_AWID),
      .AWADDR(twiddle_rsc_0_1_AWADDR),
      .AWLEN(twiddle_rsc_0_1_AWLEN),
      .AWSIZE(twiddle_rsc_0_1_AWSIZE),
      .AWBURST(twiddle_rsc_0_1_AWBURST),
      .AWLOCK(twiddle_rsc_0_1_AWLOCK),
      .AWCACHE(twiddle_rsc_0_1_AWCACHE),
      .AWPROT(twiddle_rsc_0_1_AWPROT),
      .AWQOS(twiddle_rsc_0_1_AWQOS),
      .AWREGION(twiddle_rsc_0_1_AWREGION),
      .AWUSER(twiddle_rsc_0_1_AWUSER),
      .AWVALID(twiddle_rsc_0_1_AWVALID),
      .AWREADY(twiddle_rsc_0_1_AWREADY),
      .WDATA(twiddle_rsc_0_1_WDATA),
      .WSTRB(twiddle_rsc_0_1_WSTRB),
      .WLAST(twiddle_rsc_0_1_WLAST),
      .WUSER(twiddle_rsc_0_1_WUSER),
      .WVALID(twiddle_rsc_0_1_WVALID),
      .WREADY(twiddle_rsc_0_1_WREADY),
      .BID(twiddle_rsc_0_1_BID),
      .BRESP(twiddle_rsc_0_1_BRESP),
      .BUSER(twiddle_rsc_0_1_BUSER),
      .BVALID(twiddle_rsc_0_1_BVALID),
      .BREADY(twiddle_rsc_0_1_BREADY),
      .ARID(twiddle_rsc_0_1_ARID),
      .ARADDR(twiddle_rsc_0_1_ARADDR),
      .ARLEN(twiddle_rsc_0_1_ARLEN),
      .ARSIZE(twiddle_rsc_0_1_ARSIZE),
      .ARBURST(twiddle_rsc_0_1_ARBURST),
      .ARLOCK(twiddle_rsc_0_1_ARLOCK),
      .ARCACHE(twiddle_rsc_0_1_ARCACHE),
      .ARPROT(twiddle_rsc_0_1_ARPROT),
      .ARQOS(twiddle_rsc_0_1_ARQOS),
      .ARREGION(twiddle_rsc_0_1_ARREGION),
      .ARUSER(twiddle_rsc_0_1_ARUSER),
      .ARVALID(twiddle_rsc_0_1_ARVALID),
      .ARREADY(twiddle_rsc_0_1_ARREADY),
      .RID(twiddle_rsc_0_1_RID),
      .RDATA(twiddle_rsc_0_1_RDATA),
      .RRESP(twiddle_rsc_0_1_RRESP),
      .RLAST(twiddle_rsc_0_1_RLAST),
      .RUSER(twiddle_rsc_0_1_RUSER),
      .RVALID(twiddle_rsc_0_1_RVALID),
      .RREADY(twiddle_rsc_0_1_RREADY),
      .s_re(twiddle_rsc_0_1_i_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_rsc_0_1_i_s_raddr),
      .s_waddr(8'b00000000),
      .s_din(twiddle_rsc_0_1_i_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_rsc_0_1_i_s_rrdy),
      .s_wrdy(twiddle_rsc_0_1_i_s_wrdy),
      .is_idle(twiddle_rsc_0_1_is_idle),
      .tr_write_done(twiddle_rsc_0_1_tr_write_done),
      .s_tdone(twiddle_rsc_0_1_s_tdone)
    );
  peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_rsc_0_1_i_oswt(twiddle_rsc_0_1_i_oswt),
      .twiddle_rsc_0_1_i_biwt(twiddle_rsc_0_1_i_biwt),
      .twiddle_rsc_0_1_i_bdwt(twiddle_rsc_0_1_i_bdwt),
      .twiddle_rsc_0_1_i_bcwt(twiddle_rsc_0_1_i_bcwt),
      .twiddle_rsc_0_1_i_s_re_core_sct(twiddle_rsc_0_1_i_s_re_core_sct),
      .twiddle_rsc_0_1_i_s_rrdy(twiddle_rsc_0_1_i_s_rrdy)
    );
  peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_1_i_oswt(twiddle_rsc_0_1_i_oswt),
      .twiddle_rsc_0_1_i_wen_comp(twiddle_rsc_0_1_i_wen_comp),
      .twiddle_rsc_0_1_i_s_raddr_core(nl_peaseNTT_core_twiddle_rsc_0_1_i_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_s_raddr_core[7:0]),
      .twiddle_rsc_0_1_i_s_din_mxwt(twiddle_rsc_0_1_i_s_din_mxwt),
      .twiddle_rsc_0_1_i_biwt(twiddle_rsc_0_1_i_biwt),
      .twiddle_rsc_0_1_i_bdwt(twiddle_rsc_0_1_i_bdwt),
      .twiddle_rsc_0_1_i_bcwt(twiddle_rsc_0_1_i_bcwt),
      .twiddle_rsc_0_1_i_s_raddr(twiddle_rsc_0_1_i_s_raddr),
      .twiddle_rsc_0_1_i_s_raddr_core_sct(twiddle_rsc_0_1_i_s_re_core_sct),
      .twiddle_rsc_0_1_i_s_din(twiddle_rsc_0_1_i_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_0_0_i
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_0_0_i (
  clk, rst, twiddle_rsc_0_0_s_tdone, twiddle_rsc_0_0_tr_write_done, twiddle_rsc_0_0_RREADY,
      twiddle_rsc_0_0_RVALID, twiddle_rsc_0_0_RUSER, twiddle_rsc_0_0_RLAST, twiddle_rsc_0_0_RRESP,
      twiddle_rsc_0_0_RDATA, twiddle_rsc_0_0_RID, twiddle_rsc_0_0_ARREADY, twiddle_rsc_0_0_ARVALID,
      twiddle_rsc_0_0_ARUSER, twiddle_rsc_0_0_ARREGION, twiddle_rsc_0_0_ARQOS, twiddle_rsc_0_0_ARPROT,
      twiddle_rsc_0_0_ARCACHE, twiddle_rsc_0_0_ARLOCK, twiddle_rsc_0_0_ARBURST, twiddle_rsc_0_0_ARSIZE,
      twiddle_rsc_0_0_ARLEN, twiddle_rsc_0_0_ARADDR, twiddle_rsc_0_0_ARID, twiddle_rsc_0_0_BREADY,
      twiddle_rsc_0_0_BVALID, twiddle_rsc_0_0_BUSER, twiddle_rsc_0_0_BRESP, twiddle_rsc_0_0_BID,
      twiddle_rsc_0_0_WREADY, twiddle_rsc_0_0_WVALID, twiddle_rsc_0_0_WUSER, twiddle_rsc_0_0_WLAST,
      twiddle_rsc_0_0_WSTRB, twiddle_rsc_0_0_WDATA, twiddle_rsc_0_0_AWREADY, twiddle_rsc_0_0_AWVALID,
      twiddle_rsc_0_0_AWUSER, twiddle_rsc_0_0_AWREGION, twiddle_rsc_0_0_AWQOS, twiddle_rsc_0_0_AWPROT,
      twiddle_rsc_0_0_AWCACHE, twiddle_rsc_0_0_AWLOCK, twiddle_rsc_0_0_AWBURST, twiddle_rsc_0_0_AWSIZE,
      twiddle_rsc_0_0_AWLEN, twiddle_rsc_0_0_AWADDR, twiddle_rsc_0_0_AWID, core_wen,
      twiddle_rsc_0_0_i_oswt, twiddle_rsc_0_0_i_wen_comp, twiddle_rsc_0_0_i_s_raddr_core,
      twiddle_rsc_0_0_i_s_din_mxwt
);
  input clk;
  input rst;
  input twiddle_rsc_0_0_s_tdone;
  input twiddle_rsc_0_0_tr_write_done;
  input twiddle_rsc_0_0_RREADY;
  output twiddle_rsc_0_0_RVALID;
  output twiddle_rsc_0_0_RUSER;
  output twiddle_rsc_0_0_RLAST;
  output [1:0] twiddle_rsc_0_0_RRESP;
  output [31:0] twiddle_rsc_0_0_RDATA;
  output twiddle_rsc_0_0_RID;
  output twiddle_rsc_0_0_ARREADY;
  input twiddle_rsc_0_0_ARVALID;
  input twiddle_rsc_0_0_ARUSER;
  input [3:0] twiddle_rsc_0_0_ARREGION;
  input [3:0] twiddle_rsc_0_0_ARQOS;
  input [2:0] twiddle_rsc_0_0_ARPROT;
  input [3:0] twiddle_rsc_0_0_ARCACHE;
  input twiddle_rsc_0_0_ARLOCK;
  input [1:0] twiddle_rsc_0_0_ARBURST;
  input [2:0] twiddle_rsc_0_0_ARSIZE;
  input [7:0] twiddle_rsc_0_0_ARLEN;
  input [11:0] twiddle_rsc_0_0_ARADDR;
  input twiddle_rsc_0_0_ARID;
  input twiddle_rsc_0_0_BREADY;
  output twiddle_rsc_0_0_BVALID;
  output twiddle_rsc_0_0_BUSER;
  output [1:0] twiddle_rsc_0_0_BRESP;
  output twiddle_rsc_0_0_BID;
  output twiddle_rsc_0_0_WREADY;
  input twiddle_rsc_0_0_WVALID;
  input twiddle_rsc_0_0_WUSER;
  input twiddle_rsc_0_0_WLAST;
  input [3:0] twiddle_rsc_0_0_WSTRB;
  input [31:0] twiddle_rsc_0_0_WDATA;
  output twiddle_rsc_0_0_AWREADY;
  input twiddle_rsc_0_0_AWVALID;
  input twiddle_rsc_0_0_AWUSER;
  input [3:0] twiddle_rsc_0_0_AWREGION;
  input [3:0] twiddle_rsc_0_0_AWQOS;
  input [2:0] twiddle_rsc_0_0_AWPROT;
  input [3:0] twiddle_rsc_0_0_AWCACHE;
  input twiddle_rsc_0_0_AWLOCK;
  input [1:0] twiddle_rsc_0_0_AWBURST;
  input [2:0] twiddle_rsc_0_0_AWSIZE;
  input [7:0] twiddle_rsc_0_0_AWLEN;
  input [11:0] twiddle_rsc_0_0_AWADDR;
  input twiddle_rsc_0_0_AWID;
  input core_wen;
  input twiddle_rsc_0_0_i_oswt;
  output twiddle_rsc_0_0_i_wen_comp;
  input [7:0] twiddle_rsc_0_0_i_s_raddr_core;
  output [31:0] twiddle_rsc_0_0_i_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_rsc_0_0_i_biwt;
  wire twiddle_rsc_0_0_i_bdwt;
  wire twiddle_rsc_0_0_i_bcwt;
  wire twiddle_rsc_0_0_i_s_re_core_sct;
  wire [7:0] twiddle_rsc_0_0_i_s_raddr;
  wire [31:0] twiddle_rsc_0_0_i_s_din;
  wire twiddle_rsc_0_0_i_s_rrdy;
  wire twiddle_rsc_0_0_i_s_wrdy;
  wire twiddle_rsc_0_0_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [7:0] nl_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_s_raddr_core
      = {1'b0 , (twiddle_rsc_0_0_i_s_raddr_core[6:0])};
  ccs_axi4_slave_mem #(.rscid(32'sd0),
  .depth(32'sd256),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd8),
  .nopreload(32'sd0),
  .rst_ph(32'sd0),
  .ADDR_WIDTH(32'sd12),
  .DATA_WIDTH(32'sd32),
  .ID_WIDTH(32'sd1),
  .USER_WIDTH(32'sd1),
  .REGION_MAP_SIZE(32'sd1),
  .wBASE_ADDRESS(32'sd0),
  .rBASE_ADDRESS(32'sd0)) twiddle_rsc_0_0_i (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(twiddle_rsc_0_0_AWID),
      .AWADDR(twiddle_rsc_0_0_AWADDR),
      .AWLEN(twiddle_rsc_0_0_AWLEN),
      .AWSIZE(twiddle_rsc_0_0_AWSIZE),
      .AWBURST(twiddle_rsc_0_0_AWBURST),
      .AWLOCK(twiddle_rsc_0_0_AWLOCK),
      .AWCACHE(twiddle_rsc_0_0_AWCACHE),
      .AWPROT(twiddle_rsc_0_0_AWPROT),
      .AWQOS(twiddle_rsc_0_0_AWQOS),
      .AWREGION(twiddle_rsc_0_0_AWREGION),
      .AWUSER(twiddle_rsc_0_0_AWUSER),
      .AWVALID(twiddle_rsc_0_0_AWVALID),
      .AWREADY(twiddle_rsc_0_0_AWREADY),
      .WDATA(twiddle_rsc_0_0_WDATA),
      .WSTRB(twiddle_rsc_0_0_WSTRB),
      .WLAST(twiddle_rsc_0_0_WLAST),
      .WUSER(twiddle_rsc_0_0_WUSER),
      .WVALID(twiddle_rsc_0_0_WVALID),
      .WREADY(twiddle_rsc_0_0_WREADY),
      .BID(twiddle_rsc_0_0_BID),
      .BRESP(twiddle_rsc_0_0_BRESP),
      .BUSER(twiddle_rsc_0_0_BUSER),
      .BVALID(twiddle_rsc_0_0_BVALID),
      .BREADY(twiddle_rsc_0_0_BREADY),
      .ARID(twiddle_rsc_0_0_ARID),
      .ARADDR(twiddle_rsc_0_0_ARADDR),
      .ARLEN(twiddle_rsc_0_0_ARLEN),
      .ARSIZE(twiddle_rsc_0_0_ARSIZE),
      .ARBURST(twiddle_rsc_0_0_ARBURST),
      .ARLOCK(twiddle_rsc_0_0_ARLOCK),
      .ARCACHE(twiddle_rsc_0_0_ARCACHE),
      .ARPROT(twiddle_rsc_0_0_ARPROT),
      .ARQOS(twiddle_rsc_0_0_ARQOS),
      .ARREGION(twiddle_rsc_0_0_ARREGION),
      .ARUSER(twiddle_rsc_0_0_ARUSER),
      .ARVALID(twiddle_rsc_0_0_ARVALID),
      .ARREADY(twiddle_rsc_0_0_ARREADY),
      .RID(twiddle_rsc_0_0_RID),
      .RDATA(twiddle_rsc_0_0_RDATA),
      .RRESP(twiddle_rsc_0_0_RRESP),
      .RLAST(twiddle_rsc_0_0_RLAST),
      .RUSER(twiddle_rsc_0_0_RUSER),
      .RVALID(twiddle_rsc_0_0_RVALID),
      .RREADY(twiddle_rsc_0_0_RREADY),
      .s_re(twiddle_rsc_0_0_i_s_re_core_sct),
      .s_we(1'b0),
      .s_raddr(twiddle_rsc_0_0_i_s_raddr),
      .s_waddr(8'b00000000),
      .s_din(twiddle_rsc_0_0_i_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_rsc_0_0_i_s_rrdy),
      .s_wrdy(twiddle_rsc_0_0_i_s_wrdy),
      .is_idle(twiddle_rsc_0_0_is_idle),
      .tr_write_done(twiddle_rsc_0_0_tr_write_done),
      .s_tdone(twiddle_rsc_0_0_s_tdone)
    );
  peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_rsc_0_0_i_oswt(twiddle_rsc_0_0_i_oswt),
      .twiddle_rsc_0_0_i_biwt(twiddle_rsc_0_0_i_biwt),
      .twiddle_rsc_0_0_i_bdwt(twiddle_rsc_0_0_i_bdwt),
      .twiddle_rsc_0_0_i_bcwt(twiddle_rsc_0_0_i_bcwt),
      .twiddle_rsc_0_0_i_s_re_core_sct(twiddle_rsc_0_0_i_s_re_core_sct),
      .twiddle_rsc_0_0_i_s_rrdy(twiddle_rsc_0_0_i_s_rrdy)
    );
  peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_0_i_oswt(twiddle_rsc_0_0_i_oswt),
      .twiddle_rsc_0_0_i_wen_comp(twiddle_rsc_0_0_i_wen_comp),
      .twiddle_rsc_0_0_i_s_raddr_core(nl_peaseNTT_core_twiddle_rsc_0_0_i_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_s_raddr_core[7:0]),
      .twiddle_rsc_0_0_i_s_din_mxwt(twiddle_rsc_0_0_i_s_din_mxwt),
      .twiddle_rsc_0_0_i_biwt(twiddle_rsc_0_0_i_biwt),
      .twiddle_rsc_0_0_i_bdwt(twiddle_rsc_0_0_i_bdwt),
      .twiddle_rsc_0_0_i_bcwt(twiddle_rsc_0_0_i_bcwt),
      .twiddle_rsc_0_0_i_s_raddr(twiddle_rsc_0_0_i_s_raddr),
      .twiddle_rsc_0_0_i_s_raddr_core_sct(twiddle_rsc_0_0_i_s_re_core_sct),
      .twiddle_rsc_0_0_i_s_din(twiddle_rsc_0_0_i_s_din)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_7_i_1
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_7_i_1 (
  clk, rst, xt_rsc_0_7_i_adra_d, xt_rsc_0_7_i_da_d, xt_rsc_0_7_i_qa_d, xt_rsc_0_7_i_wea_d,
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d, xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen, core_wten, xt_rsc_0_7_i_oswt, xt_rsc_0_7_i_adra_d_core, xt_rsc_0_7_i_da_d_core,
      xt_rsc_0_7_i_qa_d_mxwt, xt_rsc_0_7_i_wea_d_core_psct, xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_7_i_oswt_pff
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_7_i_adra_d;
  output [31:0] xt_rsc_0_7_i_da_d;
  input [63:0] xt_rsc_0_7_i_qa_d;
  output [1:0] xt_rsc_0_7_i_wea_d;
  output [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input xt_rsc_0_7_i_oswt;
  input [13:0] xt_rsc_0_7_i_adra_d_core;
  input [63:0] xt_rsc_0_7_i_da_d_core;
  output [31:0] xt_rsc_0_7_i_qa_d_mxwt;
  input [1:0] xt_rsc_0_7_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input xt_rsc_0_7_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_7_i_biwt;
  wire xt_rsc_0_7_i_bdwt;
  wire [1:0] xt_rsc_0_7_i_wea_d_core_sct;
  wire [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] xt_rsc_0_7_i_qa_d_mxwt_pconst;
  wire [6:0] xt_rsc_0_7_i_adra_d_reg;
  wire [31:0] xt_rsc_0_7_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_wea_d_core_psct
      = {1'b0 , (xt_rsc_0_7_i_wea_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp_inst_xt_rsc_0_7_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp_inst_xt_rsc_0_7_i_adra_d_core
      = {7'b0000000 , (xt_rsc_0_7_i_adra_d_core[6:0])};
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp_inst_xt_rsc_0_7_i_da_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp_inst_xt_rsc_0_7_i_da_d_core
      = {32'b00000000000000000000000000000000 , (xt_rsc_0_7_i_da_d_core[31:0])};
  peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_7_i_oswt(xt_rsc_0_7_i_oswt),
      .xt_rsc_0_7_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_ctrl_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_7_i_biwt(xt_rsc_0_7_i_biwt),
      .xt_rsc_0_7_i_bdwt(xt_rsc_0_7_i_bdwt),
      .xt_rsc_0_7_i_wea_d_core_sct(xt_rsc_0_7_i_wea_d_core_sct),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .xt_rsc_0_7_i_oswt_pff(xt_rsc_0_7_i_oswt_pff)
    );
  peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_7_i_adra_d(xt_rsc_0_7_i_adra_d_reg),
      .xt_rsc_0_7_i_da_d(xt_rsc_0_7_i_da_d_reg),
      .xt_rsc_0_7_i_qa_d(xt_rsc_0_7_i_qa_d),
      .xt_rsc_0_7_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp_inst_xt_rsc_0_7_i_adra_d_core[13:0]),
      .xt_rsc_0_7_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_7_i_1_xt_rsc_0_7_wait_dp_inst_xt_rsc_0_7_i_da_d_core[63:0]),
      .xt_rsc_0_7_i_qa_d_mxwt(xt_rsc_0_7_i_qa_d_mxwt_pconst),
      .xt_rsc_0_7_i_biwt(xt_rsc_0_7_i_biwt),
      .xt_rsc_0_7_i_bdwt(xt_rsc_0_7_i_bdwt)
    );
  assign xt_rsc_0_7_i_qa_d_mxwt = xt_rsc_0_7_i_qa_d_mxwt_pconst;
  assign xt_rsc_0_7_i_wea_d = xt_rsc_0_7_i_wea_d_core_sct;
  assign xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign xt_rsc_0_7_i_adra_d = xt_rsc_0_7_i_adra_d_reg;
  assign xt_rsc_0_7_i_da_d = xt_rsc_0_7_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_6_i_1
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_6_i_1 (
  clk, rst, xt_rsc_0_6_i_adra_d, xt_rsc_0_6_i_da_d, xt_rsc_0_6_i_qa_d, xt_rsc_0_6_i_wea_d,
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d, xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen, core_wten, xt_rsc_0_6_i_oswt, xt_rsc_0_6_i_adra_d_core, xt_rsc_0_6_i_da_d_core,
      xt_rsc_0_6_i_qa_d_mxwt, xt_rsc_0_6_i_wea_d_core_psct, xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_6_i_oswt_pff
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_6_i_adra_d;
  output [31:0] xt_rsc_0_6_i_da_d;
  input [63:0] xt_rsc_0_6_i_qa_d;
  output [1:0] xt_rsc_0_6_i_wea_d;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input xt_rsc_0_6_i_oswt;
  input [13:0] xt_rsc_0_6_i_adra_d_core;
  input [63:0] xt_rsc_0_6_i_da_d_core;
  output [31:0] xt_rsc_0_6_i_qa_d_mxwt;
  input [1:0] xt_rsc_0_6_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input xt_rsc_0_6_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_6_i_biwt;
  wire xt_rsc_0_6_i_bdwt;
  wire [1:0] xt_rsc_0_6_i_wea_d_core_sct;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] xt_rsc_0_6_i_qa_d_mxwt_pconst;
  wire [6:0] xt_rsc_0_6_i_adra_d_reg;
  wire [31:0] xt_rsc_0_6_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_wea_d_core_psct
      = {1'b0 , (xt_rsc_0_6_i_wea_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp_inst_xt_rsc_0_6_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp_inst_xt_rsc_0_6_i_adra_d_core
      = {7'b0000000 , (xt_rsc_0_6_i_adra_d_core[6:0])};
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp_inst_xt_rsc_0_6_i_da_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp_inst_xt_rsc_0_6_i_da_d_core
      = {32'b00000000000000000000000000000000 , (xt_rsc_0_6_i_da_d_core[31:0])};
  peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_6_i_oswt(xt_rsc_0_6_i_oswt),
      .xt_rsc_0_6_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_ctrl_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_6_i_biwt(xt_rsc_0_6_i_biwt),
      .xt_rsc_0_6_i_bdwt(xt_rsc_0_6_i_bdwt),
      .xt_rsc_0_6_i_wea_d_core_sct(xt_rsc_0_6_i_wea_d_core_sct),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .xt_rsc_0_6_i_oswt_pff(xt_rsc_0_6_i_oswt_pff)
    );
  peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_6_i_adra_d(xt_rsc_0_6_i_adra_d_reg),
      .xt_rsc_0_6_i_da_d(xt_rsc_0_6_i_da_d_reg),
      .xt_rsc_0_6_i_qa_d(xt_rsc_0_6_i_qa_d),
      .xt_rsc_0_6_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp_inst_xt_rsc_0_6_i_adra_d_core[13:0]),
      .xt_rsc_0_6_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_6_i_1_xt_rsc_0_6_wait_dp_inst_xt_rsc_0_6_i_da_d_core[63:0]),
      .xt_rsc_0_6_i_qa_d_mxwt(xt_rsc_0_6_i_qa_d_mxwt_pconst),
      .xt_rsc_0_6_i_biwt(xt_rsc_0_6_i_biwt),
      .xt_rsc_0_6_i_bdwt(xt_rsc_0_6_i_bdwt)
    );
  assign xt_rsc_0_6_i_qa_d_mxwt = xt_rsc_0_6_i_qa_d_mxwt_pconst;
  assign xt_rsc_0_6_i_wea_d = xt_rsc_0_6_i_wea_d_core_sct;
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign xt_rsc_0_6_i_adra_d = xt_rsc_0_6_i_adra_d_reg;
  assign xt_rsc_0_6_i_da_d = xt_rsc_0_6_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_5_i_1
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_5_i_1 (
  clk, rst, xt_rsc_0_5_i_adra_d, xt_rsc_0_5_i_da_d, xt_rsc_0_5_i_qa_d, xt_rsc_0_5_i_wea_d,
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d, xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen, core_wten, xt_rsc_0_5_i_oswt, xt_rsc_0_5_i_adra_d_core, xt_rsc_0_5_i_da_d_core,
      xt_rsc_0_5_i_qa_d_mxwt, xt_rsc_0_5_i_wea_d_core_psct, xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_5_i_oswt_pff
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_5_i_adra_d;
  output [31:0] xt_rsc_0_5_i_da_d;
  input [63:0] xt_rsc_0_5_i_qa_d;
  output [1:0] xt_rsc_0_5_i_wea_d;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input xt_rsc_0_5_i_oswt;
  input [13:0] xt_rsc_0_5_i_adra_d_core;
  input [63:0] xt_rsc_0_5_i_da_d_core;
  output [31:0] xt_rsc_0_5_i_qa_d_mxwt;
  input [1:0] xt_rsc_0_5_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input xt_rsc_0_5_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_5_i_biwt;
  wire xt_rsc_0_5_i_bdwt;
  wire [1:0] xt_rsc_0_5_i_wea_d_core_sct;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] xt_rsc_0_5_i_qa_d_mxwt_pconst;
  wire [6:0] xt_rsc_0_5_i_adra_d_reg;
  wire [31:0] xt_rsc_0_5_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_wea_d_core_psct
      = {1'b0 , (xt_rsc_0_5_i_wea_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp_inst_xt_rsc_0_5_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp_inst_xt_rsc_0_5_i_adra_d_core
      = {7'b0000000 , (xt_rsc_0_5_i_adra_d_core[6:0])};
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp_inst_xt_rsc_0_5_i_da_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp_inst_xt_rsc_0_5_i_da_d_core
      = {32'b00000000000000000000000000000000 , (xt_rsc_0_5_i_da_d_core[31:0])};
  peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_5_i_oswt(xt_rsc_0_5_i_oswt),
      .xt_rsc_0_5_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_ctrl_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_5_i_biwt(xt_rsc_0_5_i_biwt),
      .xt_rsc_0_5_i_bdwt(xt_rsc_0_5_i_bdwt),
      .xt_rsc_0_5_i_wea_d_core_sct(xt_rsc_0_5_i_wea_d_core_sct),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .xt_rsc_0_5_i_oswt_pff(xt_rsc_0_5_i_oswt_pff)
    );
  peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_5_i_adra_d(xt_rsc_0_5_i_adra_d_reg),
      .xt_rsc_0_5_i_da_d(xt_rsc_0_5_i_da_d_reg),
      .xt_rsc_0_5_i_qa_d(xt_rsc_0_5_i_qa_d),
      .xt_rsc_0_5_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp_inst_xt_rsc_0_5_i_adra_d_core[13:0]),
      .xt_rsc_0_5_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_5_i_1_xt_rsc_0_5_wait_dp_inst_xt_rsc_0_5_i_da_d_core[63:0]),
      .xt_rsc_0_5_i_qa_d_mxwt(xt_rsc_0_5_i_qa_d_mxwt_pconst),
      .xt_rsc_0_5_i_biwt(xt_rsc_0_5_i_biwt),
      .xt_rsc_0_5_i_bdwt(xt_rsc_0_5_i_bdwt)
    );
  assign xt_rsc_0_5_i_qa_d_mxwt = xt_rsc_0_5_i_qa_d_mxwt_pconst;
  assign xt_rsc_0_5_i_wea_d = xt_rsc_0_5_i_wea_d_core_sct;
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign xt_rsc_0_5_i_adra_d = xt_rsc_0_5_i_adra_d_reg;
  assign xt_rsc_0_5_i_da_d = xt_rsc_0_5_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_4_i_1
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_4_i_1 (
  clk, rst, xt_rsc_0_4_i_adra_d, xt_rsc_0_4_i_da_d, xt_rsc_0_4_i_qa_d, xt_rsc_0_4_i_wea_d,
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d, xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen, core_wten, xt_rsc_0_4_i_oswt, xt_rsc_0_4_i_adra_d_core, xt_rsc_0_4_i_da_d_core,
      xt_rsc_0_4_i_qa_d_mxwt, xt_rsc_0_4_i_wea_d_core_psct, xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_4_i_oswt_pff
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_4_i_adra_d;
  output [31:0] xt_rsc_0_4_i_da_d;
  input [63:0] xt_rsc_0_4_i_qa_d;
  output [1:0] xt_rsc_0_4_i_wea_d;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input xt_rsc_0_4_i_oswt;
  input [13:0] xt_rsc_0_4_i_adra_d_core;
  input [63:0] xt_rsc_0_4_i_da_d_core;
  output [31:0] xt_rsc_0_4_i_qa_d_mxwt;
  input [1:0] xt_rsc_0_4_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input xt_rsc_0_4_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_4_i_biwt;
  wire xt_rsc_0_4_i_bdwt;
  wire [1:0] xt_rsc_0_4_i_wea_d_core_sct;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] xt_rsc_0_4_i_qa_d_mxwt_pconst;
  wire [6:0] xt_rsc_0_4_i_adra_d_reg;
  wire [31:0] xt_rsc_0_4_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_wea_d_core_psct
      = {1'b0 , (xt_rsc_0_4_i_wea_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp_inst_xt_rsc_0_4_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp_inst_xt_rsc_0_4_i_adra_d_core
      = {7'b0000000 , (xt_rsc_0_4_i_adra_d_core[6:0])};
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp_inst_xt_rsc_0_4_i_da_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp_inst_xt_rsc_0_4_i_da_d_core
      = {32'b00000000000000000000000000000000 , (xt_rsc_0_4_i_da_d_core[31:0])};
  peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_4_i_oswt(xt_rsc_0_4_i_oswt),
      .xt_rsc_0_4_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_ctrl_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_4_i_biwt(xt_rsc_0_4_i_biwt),
      .xt_rsc_0_4_i_bdwt(xt_rsc_0_4_i_bdwt),
      .xt_rsc_0_4_i_wea_d_core_sct(xt_rsc_0_4_i_wea_d_core_sct),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .xt_rsc_0_4_i_oswt_pff(xt_rsc_0_4_i_oswt_pff)
    );
  peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_4_i_adra_d(xt_rsc_0_4_i_adra_d_reg),
      .xt_rsc_0_4_i_da_d(xt_rsc_0_4_i_da_d_reg),
      .xt_rsc_0_4_i_qa_d(xt_rsc_0_4_i_qa_d),
      .xt_rsc_0_4_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp_inst_xt_rsc_0_4_i_adra_d_core[13:0]),
      .xt_rsc_0_4_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_4_i_1_xt_rsc_0_4_wait_dp_inst_xt_rsc_0_4_i_da_d_core[63:0]),
      .xt_rsc_0_4_i_qa_d_mxwt(xt_rsc_0_4_i_qa_d_mxwt_pconst),
      .xt_rsc_0_4_i_biwt(xt_rsc_0_4_i_biwt),
      .xt_rsc_0_4_i_bdwt(xt_rsc_0_4_i_bdwt)
    );
  assign xt_rsc_0_4_i_qa_d_mxwt = xt_rsc_0_4_i_qa_d_mxwt_pconst;
  assign xt_rsc_0_4_i_wea_d = xt_rsc_0_4_i_wea_d_core_sct;
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign xt_rsc_0_4_i_adra_d = xt_rsc_0_4_i_adra_d_reg;
  assign xt_rsc_0_4_i_da_d = xt_rsc_0_4_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_3_i_1
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_3_i_1 (
  clk, rst, xt_rsc_0_3_i_adra_d, xt_rsc_0_3_i_da_d, xt_rsc_0_3_i_qa_d, xt_rsc_0_3_i_wea_d,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d, xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen, core_wten, xt_rsc_0_3_i_oswt, xt_rsc_0_3_i_adra_d_core, xt_rsc_0_3_i_da_d_core,
      xt_rsc_0_3_i_qa_d_mxwt, xt_rsc_0_3_i_wea_d_core_psct, xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_3_i_oswt_pff
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_3_i_adra_d;
  output [31:0] xt_rsc_0_3_i_da_d;
  input [63:0] xt_rsc_0_3_i_qa_d;
  output [1:0] xt_rsc_0_3_i_wea_d;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input xt_rsc_0_3_i_oswt;
  input [13:0] xt_rsc_0_3_i_adra_d_core;
  input [63:0] xt_rsc_0_3_i_da_d_core;
  output [31:0] xt_rsc_0_3_i_qa_d_mxwt;
  input [1:0] xt_rsc_0_3_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input xt_rsc_0_3_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_3_i_biwt;
  wire xt_rsc_0_3_i_bdwt;
  wire [1:0] xt_rsc_0_3_i_wea_d_core_sct;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] xt_rsc_0_3_i_qa_d_mxwt_pconst;
  wire [6:0] xt_rsc_0_3_i_adra_d_reg;
  wire [31:0] xt_rsc_0_3_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_wea_d_core_psct
      = {1'b0 , (xt_rsc_0_3_i_wea_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp_inst_xt_rsc_0_3_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp_inst_xt_rsc_0_3_i_adra_d_core
      = {7'b0000000 , (xt_rsc_0_3_i_adra_d_core[6:0])};
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp_inst_xt_rsc_0_3_i_da_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp_inst_xt_rsc_0_3_i_da_d_core
      = {32'b00000000000000000000000000000000 , (xt_rsc_0_3_i_da_d_core[31:0])};
  peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_3_i_oswt(xt_rsc_0_3_i_oswt),
      .xt_rsc_0_3_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_ctrl_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_3_i_biwt(xt_rsc_0_3_i_biwt),
      .xt_rsc_0_3_i_bdwt(xt_rsc_0_3_i_bdwt),
      .xt_rsc_0_3_i_wea_d_core_sct(xt_rsc_0_3_i_wea_d_core_sct),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .xt_rsc_0_3_i_oswt_pff(xt_rsc_0_3_i_oswt_pff)
    );
  peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_3_i_adra_d(xt_rsc_0_3_i_adra_d_reg),
      .xt_rsc_0_3_i_da_d(xt_rsc_0_3_i_da_d_reg),
      .xt_rsc_0_3_i_qa_d(xt_rsc_0_3_i_qa_d),
      .xt_rsc_0_3_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp_inst_xt_rsc_0_3_i_adra_d_core[13:0]),
      .xt_rsc_0_3_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_3_i_1_xt_rsc_0_3_wait_dp_inst_xt_rsc_0_3_i_da_d_core[63:0]),
      .xt_rsc_0_3_i_qa_d_mxwt(xt_rsc_0_3_i_qa_d_mxwt_pconst),
      .xt_rsc_0_3_i_biwt(xt_rsc_0_3_i_biwt),
      .xt_rsc_0_3_i_bdwt(xt_rsc_0_3_i_bdwt)
    );
  assign xt_rsc_0_3_i_qa_d_mxwt = xt_rsc_0_3_i_qa_d_mxwt_pconst;
  assign xt_rsc_0_3_i_wea_d = xt_rsc_0_3_i_wea_d_core_sct;
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign xt_rsc_0_3_i_adra_d = xt_rsc_0_3_i_adra_d_reg;
  assign xt_rsc_0_3_i_da_d = xt_rsc_0_3_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_2_i_1
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_2_i_1 (
  clk, rst, xt_rsc_0_2_i_adra_d, xt_rsc_0_2_i_da_d, xt_rsc_0_2_i_qa_d, xt_rsc_0_2_i_wea_d,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d, xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen, core_wten, xt_rsc_0_2_i_oswt, xt_rsc_0_2_i_adra_d_core, xt_rsc_0_2_i_da_d_core,
      xt_rsc_0_2_i_qa_d_mxwt, xt_rsc_0_2_i_wea_d_core_psct, xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_2_i_oswt_pff
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_2_i_adra_d;
  output [31:0] xt_rsc_0_2_i_da_d;
  input [63:0] xt_rsc_0_2_i_qa_d;
  output [1:0] xt_rsc_0_2_i_wea_d;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input xt_rsc_0_2_i_oswt;
  input [13:0] xt_rsc_0_2_i_adra_d_core;
  input [63:0] xt_rsc_0_2_i_da_d_core;
  output [31:0] xt_rsc_0_2_i_qa_d_mxwt;
  input [1:0] xt_rsc_0_2_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input xt_rsc_0_2_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_2_i_biwt;
  wire xt_rsc_0_2_i_bdwt;
  wire [1:0] xt_rsc_0_2_i_wea_d_core_sct;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] xt_rsc_0_2_i_qa_d_mxwt_pconst;
  wire [6:0] xt_rsc_0_2_i_adra_d_reg;
  wire [31:0] xt_rsc_0_2_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_wea_d_core_psct
      = {1'b0 , (xt_rsc_0_2_i_wea_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp_inst_xt_rsc_0_2_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp_inst_xt_rsc_0_2_i_adra_d_core
      = {7'b0000000 , (xt_rsc_0_2_i_adra_d_core[6:0])};
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp_inst_xt_rsc_0_2_i_da_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp_inst_xt_rsc_0_2_i_da_d_core
      = {32'b00000000000000000000000000000000 , (xt_rsc_0_2_i_da_d_core[31:0])};
  peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_2_i_oswt(xt_rsc_0_2_i_oswt),
      .xt_rsc_0_2_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_ctrl_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_2_i_biwt(xt_rsc_0_2_i_biwt),
      .xt_rsc_0_2_i_bdwt(xt_rsc_0_2_i_bdwt),
      .xt_rsc_0_2_i_wea_d_core_sct(xt_rsc_0_2_i_wea_d_core_sct),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .xt_rsc_0_2_i_oswt_pff(xt_rsc_0_2_i_oswt_pff)
    );
  peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_2_i_adra_d(xt_rsc_0_2_i_adra_d_reg),
      .xt_rsc_0_2_i_da_d(xt_rsc_0_2_i_da_d_reg),
      .xt_rsc_0_2_i_qa_d(xt_rsc_0_2_i_qa_d),
      .xt_rsc_0_2_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp_inst_xt_rsc_0_2_i_adra_d_core[13:0]),
      .xt_rsc_0_2_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_2_i_1_xt_rsc_0_2_wait_dp_inst_xt_rsc_0_2_i_da_d_core[63:0]),
      .xt_rsc_0_2_i_qa_d_mxwt(xt_rsc_0_2_i_qa_d_mxwt_pconst),
      .xt_rsc_0_2_i_biwt(xt_rsc_0_2_i_biwt),
      .xt_rsc_0_2_i_bdwt(xt_rsc_0_2_i_bdwt)
    );
  assign xt_rsc_0_2_i_qa_d_mxwt = xt_rsc_0_2_i_qa_d_mxwt_pconst;
  assign xt_rsc_0_2_i_wea_d = xt_rsc_0_2_i_wea_d_core_sct;
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign xt_rsc_0_2_i_adra_d = xt_rsc_0_2_i_adra_d_reg;
  assign xt_rsc_0_2_i_da_d = xt_rsc_0_2_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_1_i_1
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_1_i_1 (
  clk, rst, xt_rsc_0_1_i_adra_d, xt_rsc_0_1_i_da_d, xt_rsc_0_1_i_qa_d, xt_rsc_0_1_i_wea_d,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d, xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen, core_wten, xt_rsc_0_1_i_oswt, xt_rsc_0_1_i_adra_d_core, xt_rsc_0_1_i_da_d_core,
      xt_rsc_0_1_i_qa_d_mxwt, xt_rsc_0_1_i_wea_d_core_psct, xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_1_i_oswt_pff
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_1_i_adra_d;
  output [31:0] xt_rsc_0_1_i_da_d;
  input [63:0] xt_rsc_0_1_i_qa_d;
  output [1:0] xt_rsc_0_1_i_wea_d;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input xt_rsc_0_1_i_oswt;
  input [13:0] xt_rsc_0_1_i_adra_d_core;
  input [63:0] xt_rsc_0_1_i_da_d_core;
  output [31:0] xt_rsc_0_1_i_qa_d_mxwt;
  input [1:0] xt_rsc_0_1_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input xt_rsc_0_1_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_1_i_biwt;
  wire xt_rsc_0_1_i_bdwt;
  wire [1:0] xt_rsc_0_1_i_wea_d_core_sct;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] xt_rsc_0_1_i_qa_d_mxwt_pconst;
  wire [6:0] xt_rsc_0_1_i_adra_d_reg;
  wire [31:0] xt_rsc_0_1_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_wea_d_core_psct
      = {1'b0 , (xt_rsc_0_1_i_wea_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp_inst_xt_rsc_0_1_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp_inst_xt_rsc_0_1_i_adra_d_core
      = {7'b0000000 , (xt_rsc_0_1_i_adra_d_core[6:0])};
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp_inst_xt_rsc_0_1_i_da_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp_inst_xt_rsc_0_1_i_da_d_core
      = {32'b00000000000000000000000000000000 , (xt_rsc_0_1_i_da_d_core[31:0])};
  peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_1_i_oswt(xt_rsc_0_1_i_oswt),
      .xt_rsc_0_1_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_ctrl_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_1_i_biwt(xt_rsc_0_1_i_biwt),
      .xt_rsc_0_1_i_bdwt(xt_rsc_0_1_i_bdwt),
      .xt_rsc_0_1_i_wea_d_core_sct(xt_rsc_0_1_i_wea_d_core_sct),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .xt_rsc_0_1_i_oswt_pff(xt_rsc_0_1_i_oswt_pff)
    );
  peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_1_i_adra_d(xt_rsc_0_1_i_adra_d_reg),
      .xt_rsc_0_1_i_da_d(xt_rsc_0_1_i_da_d_reg),
      .xt_rsc_0_1_i_qa_d(xt_rsc_0_1_i_qa_d),
      .xt_rsc_0_1_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp_inst_xt_rsc_0_1_i_adra_d_core[13:0]),
      .xt_rsc_0_1_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_1_i_1_xt_rsc_0_1_wait_dp_inst_xt_rsc_0_1_i_da_d_core[63:0]),
      .xt_rsc_0_1_i_qa_d_mxwt(xt_rsc_0_1_i_qa_d_mxwt_pconst),
      .xt_rsc_0_1_i_biwt(xt_rsc_0_1_i_biwt),
      .xt_rsc_0_1_i_bdwt(xt_rsc_0_1_i_bdwt)
    );
  assign xt_rsc_0_1_i_qa_d_mxwt = xt_rsc_0_1_i_qa_d_mxwt_pconst;
  assign xt_rsc_0_1_i_wea_d = xt_rsc_0_1_i_wea_d_core_sct;
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign xt_rsc_0_1_i_adra_d = xt_rsc_0_1_i_adra_d_reg;
  assign xt_rsc_0_1_i_da_d = xt_rsc_0_1_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_xt_rsc_0_0_i_1
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_0_0_i_1 (
  clk, rst, xt_rsc_0_0_i_adra_d, xt_rsc_0_0_i_da_d, xt_rsc_0_0_i_qa_d, xt_rsc_0_0_i_wea_d,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d, xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      core_wen, xt_rsc_0_0_i_oswt, core_wten, xt_rsc_0_0_i_adra_d_core, xt_rsc_0_0_i_da_d_core,
      xt_rsc_0_0_i_qa_d_mxwt, xt_rsc_0_0_i_wea_d_core_psct, xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct, xt_rsc_0_0_i_oswt_pff
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_0_i_adra_d;
  output [31:0] xt_rsc_0_0_i_da_d;
  input [63:0] xt_rsc_0_0_i_qa_d;
  output [1:0] xt_rsc_0_0_i_wea_d;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input xt_rsc_0_0_i_oswt;
  input core_wten;
  input [13:0] xt_rsc_0_0_i_adra_d_core;
  input [63:0] xt_rsc_0_0_i_da_d_core;
  output [31:0] xt_rsc_0_0_i_qa_d_mxwt;
  input [1:0] xt_rsc_0_0_i_wea_d_core_psct;
  input [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input xt_rsc_0_0_i_oswt_pff;


  // Interconnect Declarations
  wire xt_rsc_0_0_i_biwt;
  wire xt_rsc_0_0_i_bdwt;
  wire [1:0] xt_rsc_0_0_i_wea_d_core_sct;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] xt_rsc_0_0_i_qa_d_mxwt_pconst;
  wire [6:0] xt_rsc_0_0_i_adra_d_reg;
  wire [31:0] xt_rsc_0_0_i_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_wea_d_core_psct
      = {1'b0 , (xt_rsc_0_0_i_wea_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp_inst_xt_rsc_0_0_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp_inst_xt_rsc_0_0_i_adra_d_core
      = {7'b0000000 , (xt_rsc_0_0_i_adra_d_core[6:0])};
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp_inst_xt_rsc_0_0_i_da_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp_inst_xt_rsc_0_0_i_da_d_core
      = {32'b00000000000000000000000000000000 , (xt_rsc_0_0_i_da_d_core[31:0])};
  peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .xt_rsc_0_0_i_oswt(xt_rsc_0_0_i_oswt),
      .core_wten(core_wten),
      .xt_rsc_0_0_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_ctrl_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_0_i_biwt(xt_rsc_0_0_i_biwt),
      .xt_rsc_0_0_i_bdwt(xt_rsc_0_0_i_bdwt),
      .xt_rsc_0_0_i_wea_d_core_sct(xt_rsc_0_0_i_wea_d_core_sct),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .xt_rsc_0_0_i_oswt_pff(xt_rsc_0_0_i_oswt_pff)
    );
  peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_0_i_adra_d(xt_rsc_0_0_i_adra_d_reg),
      .xt_rsc_0_0_i_da_d(xt_rsc_0_0_i_da_d_reg),
      .xt_rsc_0_0_i_qa_d(xt_rsc_0_0_i_qa_d),
      .xt_rsc_0_0_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp_inst_xt_rsc_0_0_i_adra_d_core[13:0]),
      .xt_rsc_0_0_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_0_i_1_xt_rsc_0_0_wait_dp_inst_xt_rsc_0_0_i_da_d_core[63:0]),
      .xt_rsc_0_0_i_qa_d_mxwt(xt_rsc_0_0_i_qa_d_mxwt_pconst),
      .xt_rsc_0_0_i_biwt(xt_rsc_0_0_i_biwt),
      .xt_rsc_0_0_i_bdwt(xt_rsc_0_0_i_bdwt)
    );
  assign xt_rsc_0_0_i_qa_d_mxwt = xt_rsc_0_0_i_qa_d_mxwt_pconst;
  assign xt_rsc_0_0_i_wea_d = xt_rsc_0_0_i_wea_d_core_sct;
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign xt_rsc_0_0_i_adra_d = xt_rsc_0_0_i_adra_d_reg;
  assign xt_rsc_0_0_i_da_d = xt_rsc_0_0_i_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core
// ------------------------------------------------------------------


module peaseNTT_core (
  clk, rst, xt_rsc_triosy_0_0_lz, xt_rsc_triosy_0_1_lz, xt_rsc_triosy_0_2_lz, xt_rsc_triosy_0_3_lz,
      xt_rsc_triosy_0_4_lz, xt_rsc_triosy_0_5_lz, xt_rsc_triosy_0_6_lz, xt_rsc_triosy_0_7_lz,
      p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz, twiddle_rsc_0_0_s_tdone, twiddle_rsc_0_0_tr_write_done,
      twiddle_rsc_0_0_RREADY, twiddle_rsc_0_0_RVALID, twiddle_rsc_0_0_RUSER, twiddle_rsc_0_0_RLAST,
      twiddle_rsc_0_0_RRESP, twiddle_rsc_0_0_RDATA, twiddle_rsc_0_0_RID, twiddle_rsc_0_0_ARREADY,
      twiddle_rsc_0_0_ARVALID, twiddle_rsc_0_0_ARUSER, twiddle_rsc_0_0_ARREGION,
      twiddle_rsc_0_0_ARQOS, twiddle_rsc_0_0_ARPROT, twiddle_rsc_0_0_ARCACHE, twiddle_rsc_0_0_ARLOCK,
      twiddle_rsc_0_0_ARBURST, twiddle_rsc_0_0_ARSIZE, twiddle_rsc_0_0_ARLEN, twiddle_rsc_0_0_ARADDR,
      twiddle_rsc_0_0_ARID, twiddle_rsc_0_0_BREADY, twiddle_rsc_0_0_BVALID, twiddle_rsc_0_0_BUSER,
      twiddle_rsc_0_0_BRESP, twiddle_rsc_0_0_BID, twiddle_rsc_0_0_WREADY, twiddle_rsc_0_0_WVALID,
      twiddle_rsc_0_0_WUSER, twiddle_rsc_0_0_WLAST, twiddle_rsc_0_0_WSTRB, twiddle_rsc_0_0_WDATA,
      twiddle_rsc_0_0_AWREADY, twiddle_rsc_0_0_AWVALID, twiddle_rsc_0_0_AWUSER, twiddle_rsc_0_0_AWREGION,
      twiddle_rsc_0_0_AWQOS, twiddle_rsc_0_0_AWPROT, twiddle_rsc_0_0_AWCACHE, twiddle_rsc_0_0_AWLOCK,
      twiddle_rsc_0_0_AWBURST, twiddle_rsc_0_0_AWSIZE, twiddle_rsc_0_0_AWLEN, twiddle_rsc_0_0_AWADDR,
      twiddle_rsc_0_0_AWID, twiddle_rsc_triosy_0_0_lz, twiddle_rsc_0_1_s_tdone, twiddle_rsc_0_1_tr_write_done,
      twiddle_rsc_0_1_RREADY, twiddle_rsc_0_1_RVALID, twiddle_rsc_0_1_RUSER, twiddle_rsc_0_1_RLAST,
      twiddle_rsc_0_1_RRESP, twiddle_rsc_0_1_RDATA, twiddle_rsc_0_1_RID, twiddle_rsc_0_1_ARREADY,
      twiddle_rsc_0_1_ARVALID, twiddle_rsc_0_1_ARUSER, twiddle_rsc_0_1_ARREGION,
      twiddle_rsc_0_1_ARQOS, twiddle_rsc_0_1_ARPROT, twiddle_rsc_0_1_ARCACHE, twiddle_rsc_0_1_ARLOCK,
      twiddle_rsc_0_1_ARBURST, twiddle_rsc_0_1_ARSIZE, twiddle_rsc_0_1_ARLEN, twiddle_rsc_0_1_ARADDR,
      twiddle_rsc_0_1_ARID, twiddle_rsc_0_1_BREADY, twiddle_rsc_0_1_BVALID, twiddle_rsc_0_1_BUSER,
      twiddle_rsc_0_1_BRESP, twiddle_rsc_0_1_BID, twiddle_rsc_0_1_WREADY, twiddle_rsc_0_1_WVALID,
      twiddle_rsc_0_1_WUSER, twiddle_rsc_0_1_WLAST, twiddle_rsc_0_1_WSTRB, twiddle_rsc_0_1_WDATA,
      twiddle_rsc_0_1_AWREADY, twiddle_rsc_0_1_AWVALID, twiddle_rsc_0_1_AWUSER, twiddle_rsc_0_1_AWREGION,
      twiddle_rsc_0_1_AWQOS, twiddle_rsc_0_1_AWPROT, twiddle_rsc_0_1_AWCACHE, twiddle_rsc_0_1_AWLOCK,
      twiddle_rsc_0_1_AWBURST, twiddle_rsc_0_1_AWSIZE, twiddle_rsc_0_1_AWLEN, twiddle_rsc_0_1_AWADDR,
      twiddle_rsc_0_1_AWID, twiddle_rsc_triosy_0_1_lz, twiddle_rsc_0_2_s_tdone, twiddle_rsc_0_2_tr_write_done,
      twiddle_rsc_0_2_RREADY, twiddle_rsc_0_2_RVALID, twiddle_rsc_0_2_RUSER, twiddle_rsc_0_2_RLAST,
      twiddle_rsc_0_2_RRESP, twiddle_rsc_0_2_RDATA, twiddle_rsc_0_2_RID, twiddle_rsc_0_2_ARREADY,
      twiddle_rsc_0_2_ARVALID, twiddle_rsc_0_2_ARUSER, twiddle_rsc_0_2_ARREGION,
      twiddle_rsc_0_2_ARQOS, twiddle_rsc_0_2_ARPROT, twiddle_rsc_0_2_ARCACHE, twiddle_rsc_0_2_ARLOCK,
      twiddle_rsc_0_2_ARBURST, twiddle_rsc_0_2_ARSIZE, twiddle_rsc_0_2_ARLEN, twiddle_rsc_0_2_ARADDR,
      twiddle_rsc_0_2_ARID, twiddle_rsc_0_2_BREADY, twiddle_rsc_0_2_BVALID, twiddle_rsc_0_2_BUSER,
      twiddle_rsc_0_2_BRESP, twiddle_rsc_0_2_BID, twiddle_rsc_0_2_WREADY, twiddle_rsc_0_2_WVALID,
      twiddle_rsc_0_2_WUSER, twiddle_rsc_0_2_WLAST, twiddle_rsc_0_2_WSTRB, twiddle_rsc_0_2_WDATA,
      twiddle_rsc_0_2_AWREADY, twiddle_rsc_0_2_AWVALID, twiddle_rsc_0_2_AWUSER, twiddle_rsc_0_2_AWREGION,
      twiddle_rsc_0_2_AWQOS, twiddle_rsc_0_2_AWPROT, twiddle_rsc_0_2_AWCACHE, twiddle_rsc_0_2_AWLOCK,
      twiddle_rsc_0_2_AWBURST, twiddle_rsc_0_2_AWSIZE, twiddle_rsc_0_2_AWLEN, twiddle_rsc_0_2_AWADDR,
      twiddle_rsc_0_2_AWID, twiddle_rsc_triosy_0_2_lz, twiddle_rsc_0_3_s_tdone, twiddle_rsc_0_3_tr_write_done,
      twiddle_rsc_0_3_RREADY, twiddle_rsc_0_3_RVALID, twiddle_rsc_0_3_RUSER, twiddle_rsc_0_3_RLAST,
      twiddle_rsc_0_3_RRESP, twiddle_rsc_0_3_RDATA, twiddle_rsc_0_3_RID, twiddle_rsc_0_3_ARREADY,
      twiddle_rsc_0_3_ARVALID, twiddle_rsc_0_3_ARUSER, twiddle_rsc_0_3_ARREGION,
      twiddle_rsc_0_3_ARQOS, twiddle_rsc_0_3_ARPROT, twiddle_rsc_0_3_ARCACHE, twiddle_rsc_0_3_ARLOCK,
      twiddle_rsc_0_3_ARBURST, twiddle_rsc_0_3_ARSIZE, twiddle_rsc_0_3_ARLEN, twiddle_rsc_0_3_ARADDR,
      twiddle_rsc_0_3_ARID, twiddle_rsc_0_3_BREADY, twiddle_rsc_0_3_BVALID, twiddle_rsc_0_3_BUSER,
      twiddle_rsc_0_3_BRESP, twiddle_rsc_0_3_BID, twiddle_rsc_0_3_WREADY, twiddle_rsc_0_3_WVALID,
      twiddle_rsc_0_3_WUSER, twiddle_rsc_0_3_WLAST, twiddle_rsc_0_3_WSTRB, twiddle_rsc_0_3_WDATA,
      twiddle_rsc_0_3_AWREADY, twiddle_rsc_0_3_AWVALID, twiddle_rsc_0_3_AWUSER, twiddle_rsc_0_3_AWREGION,
      twiddle_rsc_0_3_AWQOS, twiddle_rsc_0_3_AWPROT, twiddle_rsc_0_3_AWCACHE, twiddle_rsc_0_3_AWLOCK,
      twiddle_rsc_0_3_AWBURST, twiddle_rsc_0_3_AWSIZE, twiddle_rsc_0_3_AWLEN, twiddle_rsc_0_3_AWADDR,
      twiddle_rsc_0_3_AWID, twiddle_rsc_triosy_0_3_lz, twiddle_h_rsc_0_0_s_tdone,
      twiddle_h_rsc_0_0_tr_write_done, twiddle_h_rsc_0_0_RREADY, twiddle_h_rsc_0_0_RVALID,
      twiddle_h_rsc_0_0_RUSER, twiddle_h_rsc_0_0_RLAST, twiddle_h_rsc_0_0_RRESP,
      twiddle_h_rsc_0_0_RDATA, twiddle_h_rsc_0_0_RID, twiddle_h_rsc_0_0_ARREADY,
      twiddle_h_rsc_0_0_ARVALID, twiddle_h_rsc_0_0_ARUSER, twiddle_h_rsc_0_0_ARREGION,
      twiddle_h_rsc_0_0_ARQOS, twiddle_h_rsc_0_0_ARPROT, twiddle_h_rsc_0_0_ARCACHE,
      twiddle_h_rsc_0_0_ARLOCK, twiddle_h_rsc_0_0_ARBURST, twiddle_h_rsc_0_0_ARSIZE,
      twiddle_h_rsc_0_0_ARLEN, twiddle_h_rsc_0_0_ARADDR, twiddle_h_rsc_0_0_ARID,
      twiddle_h_rsc_0_0_BREADY, twiddle_h_rsc_0_0_BVALID, twiddle_h_rsc_0_0_BUSER,
      twiddle_h_rsc_0_0_BRESP, twiddle_h_rsc_0_0_BID, twiddle_h_rsc_0_0_WREADY, twiddle_h_rsc_0_0_WVALID,
      twiddle_h_rsc_0_0_WUSER, twiddle_h_rsc_0_0_WLAST, twiddle_h_rsc_0_0_WSTRB,
      twiddle_h_rsc_0_0_WDATA, twiddle_h_rsc_0_0_AWREADY, twiddle_h_rsc_0_0_AWVALID,
      twiddle_h_rsc_0_0_AWUSER, twiddle_h_rsc_0_0_AWREGION, twiddle_h_rsc_0_0_AWQOS,
      twiddle_h_rsc_0_0_AWPROT, twiddle_h_rsc_0_0_AWCACHE, twiddle_h_rsc_0_0_AWLOCK,
      twiddle_h_rsc_0_0_AWBURST, twiddle_h_rsc_0_0_AWSIZE, twiddle_h_rsc_0_0_AWLEN,
      twiddle_h_rsc_0_0_AWADDR, twiddle_h_rsc_0_0_AWID, twiddle_h_rsc_triosy_0_0_lz,
      twiddle_h_rsc_0_1_s_tdone, twiddle_h_rsc_0_1_tr_write_done, twiddle_h_rsc_0_1_RREADY,
      twiddle_h_rsc_0_1_RVALID, twiddle_h_rsc_0_1_RUSER, twiddle_h_rsc_0_1_RLAST,
      twiddle_h_rsc_0_1_RRESP, twiddle_h_rsc_0_1_RDATA, twiddle_h_rsc_0_1_RID, twiddle_h_rsc_0_1_ARREADY,
      twiddle_h_rsc_0_1_ARVALID, twiddle_h_rsc_0_1_ARUSER, twiddle_h_rsc_0_1_ARREGION,
      twiddle_h_rsc_0_1_ARQOS, twiddle_h_rsc_0_1_ARPROT, twiddle_h_rsc_0_1_ARCACHE,
      twiddle_h_rsc_0_1_ARLOCK, twiddle_h_rsc_0_1_ARBURST, twiddle_h_rsc_0_1_ARSIZE,
      twiddle_h_rsc_0_1_ARLEN, twiddle_h_rsc_0_1_ARADDR, twiddle_h_rsc_0_1_ARID,
      twiddle_h_rsc_0_1_BREADY, twiddle_h_rsc_0_1_BVALID, twiddle_h_rsc_0_1_BUSER,
      twiddle_h_rsc_0_1_BRESP, twiddle_h_rsc_0_1_BID, twiddle_h_rsc_0_1_WREADY, twiddle_h_rsc_0_1_WVALID,
      twiddle_h_rsc_0_1_WUSER, twiddle_h_rsc_0_1_WLAST, twiddle_h_rsc_0_1_WSTRB,
      twiddle_h_rsc_0_1_WDATA, twiddle_h_rsc_0_1_AWREADY, twiddle_h_rsc_0_1_AWVALID,
      twiddle_h_rsc_0_1_AWUSER, twiddle_h_rsc_0_1_AWREGION, twiddle_h_rsc_0_1_AWQOS,
      twiddle_h_rsc_0_1_AWPROT, twiddle_h_rsc_0_1_AWCACHE, twiddle_h_rsc_0_1_AWLOCK,
      twiddle_h_rsc_0_1_AWBURST, twiddle_h_rsc_0_1_AWSIZE, twiddle_h_rsc_0_1_AWLEN,
      twiddle_h_rsc_0_1_AWADDR, twiddle_h_rsc_0_1_AWID, twiddle_h_rsc_triosy_0_1_lz,
      twiddle_h_rsc_0_2_s_tdone, twiddle_h_rsc_0_2_tr_write_done, twiddle_h_rsc_0_2_RREADY,
      twiddle_h_rsc_0_2_RVALID, twiddle_h_rsc_0_2_RUSER, twiddle_h_rsc_0_2_RLAST,
      twiddle_h_rsc_0_2_RRESP, twiddle_h_rsc_0_2_RDATA, twiddle_h_rsc_0_2_RID, twiddle_h_rsc_0_2_ARREADY,
      twiddle_h_rsc_0_2_ARVALID, twiddle_h_rsc_0_2_ARUSER, twiddle_h_rsc_0_2_ARREGION,
      twiddle_h_rsc_0_2_ARQOS, twiddle_h_rsc_0_2_ARPROT, twiddle_h_rsc_0_2_ARCACHE,
      twiddle_h_rsc_0_2_ARLOCK, twiddle_h_rsc_0_2_ARBURST, twiddle_h_rsc_0_2_ARSIZE,
      twiddle_h_rsc_0_2_ARLEN, twiddle_h_rsc_0_2_ARADDR, twiddle_h_rsc_0_2_ARID,
      twiddle_h_rsc_0_2_BREADY, twiddle_h_rsc_0_2_BVALID, twiddle_h_rsc_0_2_BUSER,
      twiddle_h_rsc_0_2_BRESP, twiddle_h_rsc_0_2_BID, twiddle_h_rsc_0_2_WREADY, twiddle_h_rsc_0_2_WVALID,
      twiddle_h_rsc_0_2_WUSER, twiddle_h_rsc_0_2_WLAST, twiddle_h_rsc_0_2_WSTRB,
      twiddle_h_rsc_0_2_WDATA, twiddle_h_rsc_0_2_AWREADY, twiddle_h_rsc_0_2_AWVALID,
      twiddle_h_rsc_0_2_AWUSER, twiddle_h_rsc_0_2_AWREGION, twiddle_h_rsc_0_2_AWQOS,
      twiddle_h_rsc_0_2_AWPROT, twiddle_h_rsc_0_2_AWCACHE, twiddle_h_rsc_0_2_AWLOCK,
      twiddle_h_rsc_0_2_AWBURST, twiddle_h_rsc_0_2_AWSIZE, twiddle_h_rsc_0_2_AWLEN,
      twiddle_h_rsc_0_2_AWADDR, twiddle_h_rsc_0_2_AWID, twiddle_h_rsc_triosy_0_2_lz,
      twiddle_h_rsc_0_3_s_tdone, twiddle_h_rsc_0_3_tr_write_done, twiddle_h_rsc_0_3_RREADY,
      twiddle_h_rsc_0_3_RVALID, twiddle_h_rsc_0_3_RUSER, twiddle_h_rsc_0_3_RLAST,
      twiddle_h_rsc_0_3_RRESP, twiddle_h_rsc_0_3_RDATA, twiddle_h_rsc_0_3_RID, twiddle_h_rsc_0_3_ARREADY,
      twiddle_h_rsc_0_3_ARVALID, twiddle_h_rsc_0_3_ARUSER, twiddle_h_rsc_0_3_ARREGION,
      twiddle_h_rsc_0_3_ARQOS, twiddle_h_rsc_0_3_ARPROT, twiddle_h_rsc_0_3_ARCACHE,
      twiddle_h_rsc_0_3_ARLOCK, twiddle_h_rsc_0_3_ARBURST, twiddle_h_rsc_0_3_ARSIZE,
      twiddle_h_rsc_0_3_ARLEN, twiddle_h_rsc_0_3_ARADDR, twiddle_h_rsc_0_3_ARID,
      twiddle_h_rsc_0_3_BREADY, twiddle_h_rsc_0_3_BVALID, twiddle_h_rsc_0_3_BUSER,
      twiddle_h_rsc_0_3_BRESP, twiddle_h_rsc_0_3_BID, twiddle_h_rsc_0_3_WREADY, twiddle_h_rsc_0_3_WVALID,
      twiddle_h_rsc_0_3_WUSER, twiddle_h_rsc_0_3_WLAST, twiddle_h_rsc_0_3_WSTRB,
      twiddle_h_rsc_0_3_WDATA, twiddle_h_rsc_0_3_AWREADY, twiddle_h_rsc_0_3_AWVALID,
      twiddle_h_rsc_0_3_AWUSER, twiddle_h_rsc_0_3_AWREGION, twiddle_h_rsc_0_3_AWQOS,
      twiddle_h_rsc_0_3_AWPROT, twiddle_h_rsc_0_3_AWCACHE, twiddle_h_rsc_0_3_AWLOCK,
      twiddle_h_rsc_0_3_AWBURST, twiddle_h_rsc_0_3_AWSIZE, twiddle_h_rsc_0_3_AWLEN,
      twiddle_h_rsc_0_3_AWADDR, twiddle_h_rsc_0_3_AWID, twiddle_h_rsc_triosy_0_3_lz,
      yt_rsc_0_0_i_clken_d, yt_rsc_0_0_i_q_d, yt_rsc_0_1_i_q_d, yt_rsc_0_2_i_q_d,
      yt_rsc_0_3_i_q_d, yt_rsc_0_4_i_clken_d, yt_rsc_0_4_i_q_d, yt_rsc_0_5_i_q_d,
      yt_rsc_0_6_i_q_d, yt_rsc_0_7_i_q_d, yt_rsc_1_0_i_clken_d, yt_rsc_1_0_i_q_d,
      yt_rsc_1_1_i_q_d, yt_rsc_1_2_i_q_d, yt_rsc_1_3_i_q_d, yt_rsc_1_4_i_clken_d,
      yt_rsc_1_4_i_q_d, yt_rsc_1_5_i_q_d, yt_rsc_1_6_i_q_d, yt_rsc_1_7_i_q_d, xt_rsc_0_0_i_adra_d,
      xt_rsc_0_0_i_da_d, xt_rsc_0_0_i_qa_d, xt_rsc_0_0_i_wea_d, xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_1_i_adra_d, xt_rsc_0_1_i_da_d,
      xt_rsc_0_1_i_qa_d, xt_rsc_0_1_i_wea_d, xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_2_i_adra_d, xt_rsc_0_2_i_da_d,
      xt_rsc_0_2_i_qa_d, xt_rsc_0_2_i_wea_d, xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_3_i_adra_d, xt_rsc_0_3_i_da_d,
      xt_rsc_0_3_i_qa_d, xt_rsc_0_3_i_wea_d, xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_4_i_adra_d, xt_rsc_0_4_i_da_d,
      xt_rsc_0_4_i_qa_d, xt_rsc_0_4_i_wea_d, xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_5_i_adra_d, xt_rsc_0_5_i_da_d,
      xt_rsc_0_5_i_qa_d, xt_rsc_0_5_i_wea_d, xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_6_i_adra_d, xt_rsc_0_6_i_da_d,
      xt_rsc_0_6_i_qa_d, xt_rsc_0_6_i_wea_d, xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_7_i_adra_d, xt_rsc_0_7_i_da_d,
      xt_rsc_0_7_i_qa_d, xt_rsc_0_7_i_wea_d, xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d, yt_rsc_0_0_i_d_d_pff, yt_rsc_0_0_i_radr_d_pff,
      yt_rsc_0_0_i_wadr_d_pff, yt_rsc_0_0_i_we_d_pff, yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      yt_rsc_0_1_i_d_d_pff, yt_rsc_0_2_i_d_d_pff, yt_rsc_0_3_i_d_d_pff, yt_rsc_0_4_i_wadr_d_pff,
      yt_rsc_0_4_i_we_d_pff, yt_rsc_1_0_i_d_d_pff, yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff,
      yt_rsc_1_1_i_d_d_pff, yt_rsc_1_2_i_d_d_pff, yt_rsc_1_3_i_d_d_pff
);
  input clk;
  input rst;
  output xt_rsc_triosy_0_0_lz;
  output xt_rsc_triosy_0_1_lz;
  output xt_rsc_triosy_0_2_lz;
  output xt_rsc_triosy_0_3_lz;
  output xt_rsc_triosy_0_4_lz;
  output xt_rsc_triosy_0_5_lz;
  output xt_rsc_triosy_0_6_lz;
  output xt_rsc_triosy_0_7_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  input twiddle_rsc_0_0_s_tdone;
  input twiddle_rsc_0_0_tr_write_done;
  input twiddle_rsc_0_0_RREADY;
  output twiddle_rsc_0_0_RVALID;
  output twiddle_rsc_0_0_RUSER;
  output twiddle_rsc_0_0_RLAST;
  output [1:0] twiddle_rsc_0_0_RRESP;
  output [31:0] twiddle_rsc_0_0_RDATA;
  output twiddle_rsc_0_0_RID;
  output twiddle_rsc_0_0_ARREADY;
  input twiddle_rsc_0_0_ARVALID;
  input twiddle_rsc_0_0_ARUSER;
  input [3:0] twiddle_rsc_0_0_ARREGION;
  input [3:0] twiddle_rsc_0_0_ARQOS;
  input [2:0] twiddle_rsc_0_0_ARPROT;
  input [3:0] twiddle_rsc_0_0_ARCACHE;
  input twiddle_rsc_0_0_ARLOCK;
  input [1:0] twiddle_rsc_0_0_ARBURST;
  input [2:0] twiddle_rsc_0_0_ARSIZE;
  input [7:0] twiddle_rsc_0_0_ARLEN;
  input [11:0] twiddle_rsc_0_0_ARADDR;
  input twiddle_rsc_0_0_ARID;
  input twiddle_rsc_0_0_BREADY;
  output twiddle_rsc_0_0_BVALID;
  output twiddle_rsc_0_0_BUSER;
  output [1:0] twiddle_rsc_0_0_BRESP;
  output twiddle_rsc_0_0_BID;
  output twiddle_rsc_0_0_WREADY;
  input twiddle_rsc_0_0_WVALID;
  input twiddle_rsc_0_0_WUSER;
  input twiddle_rsc_0_0_WLAST;
  input [3:0] twiddle_rsc_0_0_WSTRB;
  input [31:0] twiddle_rsc_0_0_WDATA;
  output twiddle_rsc_0_0_AWREADY;
  input twiddle_rsc_0_0_AWVALID;
  input twiddle_rsc_0_0_AWUSER;
  input [3:0] twiddle_rsc_0_0_AWREGION;
  input [3:0] twiddle_rsc_0_0_AWQOS;
  input [2:0] twiddle_rsc_0_0_AWPROT;
  input [3:0] twiddle_rsc_0_0_AWCACHE;
  input twiddle_rsc_0_0_AWLOCK;
  input [1:0] twiddle_rsc_0_0_AWBURST;
  input [2:0] twiddle_rsc_0_0_AWSIZE;
  input [7:0] twiddle_rsc_0_0_AWLEN;
  input [11:0] twiddle_rsc_0_0_AWADDR;
  input twiddle_rsc_0_0_AWID;
  output twiddle_rsc_triosy_0_0_lz;
  input twiddle_rsc_0_1_s_tdone;
  input twiddle_rsc_0_1_tr_write_done;
  input twiddle_rsc_0_1_RREADY;
  output twiddle_rsc_0_1_RVALID;
  output twiddle_rsc_0_1_RUSER;
  output twiddle_rsc_0_1_RLAST;
  output [1:0] twiddle_rsc_0_1_RRESP;
  output [31:0] twiddle_rsc_0_1_RDATA;
  output twiddle_rsc_0_1_RID;
  output twiddle_rsc_0_1_ARREADY;
  input twiddle_rsc_0_1_ARVALID;
  input twiddle_rsc_0_1_ARUSER;
  input [3:0] twiddle_rsc_0_1_ARREGION;
  input [3:0] twiddle_rsc_0_1_ARQOS;
  input [2:0] twiddle_rsc_0_1_ARPROT;
  input [3:0] twiddle_rsc_0_1_ARCACHE;
  input twiddle_rsc_0_1_ARLOCK;
  input [1:0] twiddle_rsc_0_1_ARBURST;
  input [2:0] twiddle_rsc_0_1_ARSIZE;
  input [7:0] twiddle_rsc_0_1_ARLEN;
  input [11:0] twiddle_rsc_0_1_ARADDR;
  input twiddle_rsc_0_1_ARID;
  input twiddle_rsc_0_1_BREADY;
  output twiddle_rsc_0_1_BVALID;
  output twiddle_rsc_0_1_BUSER;
  output [1:0] twiddle_rsc_0_1_BRESP;
  output twiddle_rsc_0_1_BID;
  output twiddle_rsc_0_1_WREADY;
  input twiddle_rsc_0_1_WVALID;
  input twiddle_rsc_0_1_WUSER;
  input twiddle_rsc_0_1_WLAST;
  input [3:0] twiddle_rsc_0_1_WSTRB;
  input [31:0] twiddle_rsc_0_1_WDATA;
  output twiddle_rsc_0_1_AWREADY;
  input twiddle_rsc_0_1_AWVALID;
  input twiddle_rsc_0_1_AWUSER;
  input [3:0] twiddle_rsc_0_1_AWREGION;
  input [3:0] twiddle_rsc_0_1_AWQOS;
  input [2:0] twiddle_rsc_0_1_AWPROT;
  input [3:0] twiddle_rsc_0_1_AWCACHE;
  input twiddle_rsc_0_1_AWLOCK;
  input [1:0] twiddle_rsc_0_1_AWBURST;
  input [2:0] twiddle_rsc_0_1_AWSIZE;
  input [7:0] twiddle_rsc_0_1_AWLEN;
  input [11:0] twiddle_rsc_0_1_AWADDR;
  input twiddle_rsc_0_1_AWID;
  output twiddle_rsc_triosy_0_1_lz;
  input twiddle_rsc_0_2_s_tdone;
  input twiddle_rsc_0_2_tr_write_done;
  input twiddle_rsc_0_2_RREADY;
  output twiddle_rsc_0_2_RVALID;
  output twiddle_rsc_0_2_RUSER;
  output twiddle_rsc_0_2_RLAST;
  output [1:0] twiddle_rsc_0_2_RRESP;
  output [31:0] twiddle_rsc_0_2_RDATA;
  output twiddle_rsc_0_2_RID;
  output twiddle_rsc_0_2_ARREADY;
  input twiddle_rsc_0_2_ARVALID;
  input twiddle_rsc_0_2_ARUSER;
  input [3:0] twiddle_rsc_0_2_ARREGION;
  input [3:0] twiddle_rsc_0_2_ARQOS;
  input [2:0] twiddle_rsc_0_2_ARPROT;
  input [3:0] twiddle_rsc_0_2_ARCACHE;
  input twiddle_rsc_0_2_ARLOCK;
  input [1:0] twiddle_rsc_0_2_ARBURST;
  input [2:0] twiddle_rsc_0_2_ARSIZE;
  input [7:0] twiddle_rsc_0_2_ARLEN;
  input [11:0] twiddle_rsc_0_2_ARADDR;
  input twiddle_rsc_0_2_ARID;
  input twiddle_rsc_0_2_BREADY;
  output twiddle_rsc_0_2_BVALID;
  output twiddle_rsc_0_2_BUSER;
  output [1:0] twiddle_rsc_0_2_BRESP;
  output twiddle_rsc_0_2_BID;
  output twiddle_rsc_0_2_WREADY;
  input twiddle_rsc_0_2_WVALID;
  input twiddle_rsc_0_2_WUSER;
  input twiddle_rsc_0_2_WLAST;
  input [3:0] twiddle_rsc_0_2_WSTRB;
  input [31:0] twiddle_rsc_0_2_WDATA;
  output twiddle_rsc_0_2_AWREADY;
  input twiddle_rsc_0_2_AWVALID;
  input twiddle_rsc_0_2_AWUSER;
  input [3:0] twiddle_rsc_0_2_AWREGION;
  input [3:0] twiddle_rsc_0_2_AWQOS;
  input [2:0] twiddle_rsc_0_2_AWPROT;
  input [3:0] twiddle_rsc_0_2_AWCACHE;
  input twiddle_rsc_0_2_AWLOCK;
  input [1:0] twiddle_rsc_0_2_AWBURST;
  input [2:0] twiddle_rsc_0_2_AWSIZE;
  input [7:0] twiddle_rsc_0_2_AWLEN;
  input [11:0] twiddle_rsc_0_2_AWADDR;
  input twiddle_rsc_0_2_AWID;
  output twiddle_rsc_triosy_0_2_lz;
  input twiddle_rsc_0_3_s_tdone;
  input twiddle_rsc_0_3_tr_write_done;
  input twiddle_rsc_0_3_RREADY;
  output twiddle_rsc_0_3_RVALID;
  output twiddle_rsc_0_3_RUSER;
  output twiddle_rsc_0_3_RLAST;
  output [1:0] twiddle_rsc_0_3_RRESP;
  output [31:0] twiddle_rsc_0_3_RDATA;
  output twiddle_rsc_0_3_RID;
  output twiddle_rsc_0_3_ARREADY;
  input twiddle_rsc_0_3_ARVALID;
  input twiddle_rsc_0_3_ARUSER;
  input [3:0] twiddle_rsc_0_3_ARREGION;
  input [3:0] twiddle_rsc_0_3_ARQOS;
  input [2:0] twiddle_rsc_0_3_ARPROT;
  input [3:0] twiddle_rsc_0_3_ARCACHE;
  input twiddle_rsc_0_3_ARLOCK;
  input [1:0] twiddle_rsc_0_3_ARBURST;
  input [2:0] twiddle_rsc_0_3_ARSIZE;
  input [7:0] twiddle_rsc_0_3_ARLEN;
  input [11:0] twiddle_rsc_0_3_ARADDR;
  input twiddle_rsc_0_3_ARID;
  input twiddle_rsc_0_3_BREADY;
  output twiddle_rsc_0_3_BVALID;
  output twiddle_rsc_0_3_BUSER;
  output [1:0] twiddle_rsc_0_3_BRESP;
  output twiddle_rsc_0_3_BID;
  output twiddle_rsc_0_3_WREADY;
  input twiddle_rsc_0_3_WVALID;
  input twiddle_rsc_0_3_WUSER;
  input twiddle_rsc_0_3_WLAST;
  input [3:0] twiddle_rsc_0_3_WSTRB;
  input [31:0] twiddle_rsc_0_3_WDATA;
  output twiddle_rsc_0_3_AWREADY;
  input twiddle_rsc_0_3_AWVALID;
  input twiddle_rsc_0_3_AWUSER;
  input [3:0] twiddle_rsc_0_3_AWREGION;
  input [3:0] twiddle_rsc_0_3_AWQOS;
  input [2:0] twiddle_rsc_0_3_AWPROT;
  input [3:0] twiddle_rsc_0_3_AWCACHE;
  input twiddle_rsc_0_3_AWLOCK;
  input [1:0] twiddle_rsc_0_3_AWBURST;
  input [2:0] twiddle_rsc_0_3_AWSIZE;
  input [7:0] twiddle_rsc_0_3_AWLEN;
  input [11:0] twiddle_rsc_0_3_AWADDR;
  input twiddle_rsc_0_3_AWID;
  output twiddle_rsc_triosy_0_3_lz;
  input twiddle_h_rsc_0_0_s_tdone;
  input twiddle_h_rsc_0_0_tr_write_done;
  input twiddle_h_rsc_0_0_RREADY;
  output twiddle_h_rsc_0_0_RVALID;
  output twiddle_h_rsc_0_0_RUSER;
  output twiddle_h_rsc_0_0_RLAST;
  output [1:0] twiddle_h_rsc_0_0_RRESP;
  output [31:0] twiddle_h_rsc_0_0_RDATA;
  output twiddle_h_rsc_0_0_RID;
  output twiddle_h_rsc_0_0_ARREADY;
  input twiddle_h_rsc_0_0_ARVALID;
  input twiddle_h_rsc_0_0_ARUSER;
  input [3:0] twiddle_h_rsc_0_0_ARREGION;
  input [3:0] twiddle_h_rsc_0_0_ARQOS;
  input [2:0] twiddle_h_rsc_0_0_ARPROT;
  input [3:0] twiddle_h_rsc_0_0_ARCACHE;
  input twiddle_h_rsc_0_0_ARLOCK;
  input [1:0] twiddle_h_rsc_0_0_ARBURST;
  input [2:0] twiddle_h_rsc_0_0_ARSIZE;
  input [7:0] twiddle_h_rsc_0_0_ARLEN;
  input [11:0] twiddle_h_rsc_0_0_ARADDR;
  input twiddle_h_rsc_0_0_ARID;
  input twiddle_h_rsc_0_0_BREADY;
  output twiddle_h_rsc_0_0_BVALID;
  output twiddle_h_rsc_0_0_BUSER;
  output [1:0] twiddle_h_rsc_0_0_BRESP;
  output twiddle_h_rsc_0_0_BID;
  output twiddle_h_rsc_0_0_WREADY;
  input twiddle_h_rsc_0_0_WVALID;
  input twiddle_h_rsc_0_0_WUSER;
  input twiddle_h_rsc_0_0_WLAST;
  input [3:0] twiddle_h_rsc_0_0_WSTRB;
  input [31:0] twiddle_h_rsc_0_0_WDATA;
  output twiddle_h_rsc_0_0_AWREADY;
  input twiddle_h_rsc_0_0_AWVALID;
  input twiddle_h_rsc_0_0_AWUSER;
  input [3:0] twiddle_h_rsc_0_0_AWREGION;
  input [3:0] twiddle_h_rsc_0_0_AWQOS;
  input [2:0] twiddle_h_rsc_0_0_AWPROT;
  input [3:0] twiddle_h_rsc_0_0_AWCACHE;
  input twiddle_h_rsc_0_0_AWLOCK;
  input [1:0] twiddle_h_rsc_0_0_AWBURST;
  input [2:0] twiddle_h_rsc_0_0_AWSIZE;
  input [7:0] twiddle_h_rsc_0_0_AWLEN;
  input [11:0] twiddle_h_rsc_0_0_AWADDR;
  input twiddle_h_rsc_0_0_AWID;
  output twiddle_h_rsc_triosy_0_0_lz;
  input twiddle_h_rsc_0_1_s_tdone;
  input twiddle_h_rsc_0_1_tr_write_done;
  input twiddle_h_rsc_0_1_RREADY;
  output twiddle_h_rsc_0_1_RVALID;
  output twiddle_h_rsc_0_1_RUSER;
  output twiddle_h_rsc_0_1_RLAST;
  output [1:0] twiddle_h_rsc_0_1_RRESP;
  output [31:0] twiddle_h_rsc_0_1_RDATA;
  output twiddle_h_rsc_0_1_RID;
  output twiddle_h_rsc_0_1_ARREADY;
  input twiddle_h_rsc_0_1_ARVALID;
  input twiddle_h_rsc_0_1_ARUSER;
  input [3:0] twiddle_h_rsc_0_1_ARREGION;
  input [3:0] twiddle_h_rsc_0_1_ARQOS;
  input [2:0] twiddle_h_rsc_0_1_ARPROT;
  input [3:0] twiddle_h_rsc_0_1_ARCACHE;
  input twiddle_h_rsc_0_1_ARLOCK;
  input [1:0] twiddle_h_rsc_0_1_ARBURST;
  input [2:0] twiddle_h_rsc_0_1_ARSIZE;
  input [7:0] twiddle_h_rsc_0_1_ARLEN;
  input [11:0] twiddle_h_rsc_0_1_ARADDR;
  input twiddle_h_rsc_0_1_ARID;
  input twiddle_h_rsc_0_1_BREADY;
  output twiddle_h_rsc_0_1_BVALID;
  output twiddle_h_rsc_0_1_BUSER;
  output [1:0] twiddle_h_rsc_0_1_BRESP;
  output twiddle_h_rsc_0_1_BID;
  output twiddle_h_rsc_0_1_WREADY;
  input twiddle_h_rsc_0_1_WVALID;
  input twiddle_h_rsc_0_1_WUSER;
  input twiddle_h_rsc_0_1_WLAST;
  input [3:0] twiddle_h_rsc_0_1_WSTRB;
  input [31:0] twiddle_h_rsc_0_1_WDATA;
  output twiddle_h_rsc_0_1_AWREADY;
  input twiddle_h_rsc_0_1_AWVALID;
  input twiddle_h_rsc_0_1_AWUSER;
  input [3:0] twiddle_h_rsc_0_1_AWREGION;
  input [3:0] twiddle_h_rsc_0_1_AWQOS;
  input [2:0] twiddle_h_rsc_0_1_AWPROT;
  input [3:0] twiddle_h_rsc_0_1_AWCACHE;
  input twiddle_h_rsc_0_1_AWLOCK;
  input [1:0] twiddle_h_rsc_0_1_AWBURST;
  input [2:0] twiddle_h_rsc_0_1_AWSIZE;
  input [7:0] twiddle_h_rsc_0_1_AWLEN;
  input [11:0] twiddle_h_rsc_0_1_AWADDR;
  input twiddle_h_rsc_0_1_AWID;
  output twiddle_h_rsc_triosy_0_1_lz;
  input twiddle_h_rsc_0_2_s_tdone;
  input twiddle_h_rsc_0_2_tr_write_done;
  input twiddle_h_rsc_0_2_RREADY;
  output twiddle_h_rsc_0_2_RVALID;
  output twiddle_h_rsc_0_2_RUSER;
  output twiddle_h_rsc_0_2_RLAST;
  output [1:0] twiddle_h_rsc_0_2_RRESP;
  output [31:0] twiddle_h_rsc_0_2_RDATA;
  output twiddle_h_rsc_0_2_RID;
  output twiddle_h_rsc_0_2_ARREADY;
  input twiddle_h_rsc_0_2_ARVALID;
  input twiddle_h_rsc_0_2_ARUSER;
  input [3:0] twiddle_h_rsc_0_2_ARREGION;
  input [3:0] twiddle_h_rsc_0_2_ARQOS;
  input [2:0] twiddle_h_rsc_0_2_ARPROT;
  input [3:0] twiddle_h_rsc_0_2_ARCACHE;
  input twiddle_h_rsc_0_2_ARLOCK;
  input [1:0] twiddle_h_rsc_0_2_ARBURST;
  input [2:0] twiddle_h_rsc_0_2_ARSIZE;
  input [7:0] twiddle_h_rsc_0_2_ARLEN;
  input [11:0] twiddle_h_rsc_0_2_ARADDR;
  input twiddle_h_rsc_0_2_ARID;
  input twiddle_h_rsc_0_2_BREADY;
  output twiddle_h_rsc_0_2_BVALID;
  output twiddle_h_rsc_0_2_BUSER;
  output [1:0] twiddle_h_rsc_0_2_BRESP;
  output twiddle_h_rsc_0_2_BID;
  output twiddle_h_rsc_0_2_WREADY;
  input twiddle_h_rsc_0_2_WVALID;
  input twiddle_h_rsc_0_2_WUSER;
  input twiddle_h_rsc_0_2_WLAST;
  input [3:0] twiddle_h_rsc_0_2_WSTRB;
  input [31:0] twiddle_h_rsc_0_2_WDATA;
  output twiddle_h_rsc_0_2_AWREADY;
  input twiddle_h_rsc_0_2_AWVALID;
  input twiddle_h_rsc_0_2_AWUSER;
  input [3:0] twiddle_h_rsc_0_2_AWREGION;
  input [3:0] twiddle_h_rsc_0_2_AWQOS;
  input [2:0] twiddle_h_rsc_0_2_AWPROT;
  input [3:0] twiddle_h_rsc_0_2_AWCACHE;
  input twiddle_h_rsc_0_2_AWLOCK;
  input [1:0] twiddle_h_rsc_0_2_AWBURST;
  input [2:0] twiddle_h_rsc_0_2_AWSIZE;
  input [7:0] twiddle_h_rsc_0_2_AWLEN;
  input [11:0] twiddle_h_rsc_0_2_AWADDR;
  input twiddle_h_rsc_0_2_AWID;
  output twiddle_h_rsc_triosy_0_2_lz;
  input twiddle_h_rsc_0_3_s_tdone;
  input twiddle_h_rsc_0_3_tr_write_done;
  input twiddle_h_rsc_0_3_RREADY;
  output twiddle_h_rsc_0_3_RVALID;
  output twiddle_h_rsc_0_3_RUSER;
  output twiddle_h_rsc_0_3_RLAST;
  output [1:0] twiddle_h_rsc_0_3_RRESP;
  output [31:0] twiddle_h_rsc_0_3_RDATA;
  output twiddle_h_rsc_0_3_RID;
  output twiddle_h_rsc_0_3_ARREADY;
  input twiddle_h_rsc_0_3_ARVALID;
  input twiddle_h_rsc_0_3_ARUSER;
  input [3:0] twiddle_h_rsc_0_3_ARREGION;
  input [3:0] twiddle_h_rsc_0_3_ARQOS;
  input [2:0] twiddle_h_rsc_0_3_ARPROT;
  input [3:0] twiddle_h_rsc_0_3_ARCACHE;
  input twiddle_h_rsc_0_3_ARLOCK;
  input [1:0] twiddle_h_rsc_0_3_ARBURST;
  input [2:0] twiddle_h_rsc_0_3_ARSIZE;
  input [7:0] twiddle_h_rsc_0_3_ARLEN;
  input [11:0] twiddle_h_rsc_0_3_ARADDR;
  input twiddle_h_rsc_0_3_ARID;
  input twiddle_h_rsc_0_3_BREADY;
  output twiddle_h_rsc_0_3_BVALID;
  output twiddle_h_rsc_0_3_BUSER;
  output [1:0] twiddle_h_rsc_0_3_BRESP;
  output twiddle_h_rsc_0_3_BID;
  output twiddle_h_rsc_0_3_WREADY;
  input twiddle_h_rsc_0_3_WVALID;
  input twiddle_h_rsc_0_3_WUSER;
  input twiddle_h_rsc_0_3_WLAST;
  input [3:0] twiddle_h_rsc_0_3_WSTRB;
  input [31:0] twiddle_h_rsc_0_3_WDATA;
  output twiddle_h_rsc_0_3_AWREADY;
  input twiddle_h_rsc_0_3_AWVALID;
  input twiddle_h_rsc_0_3_AWUSER;
  input [3:0] twiddle_h_rsc_0_3_AWREGION;
  input [3:0] twiddle_h_rsc_0_3_AWQOS;
  input [2:0] twiddle_h_rsc_0_3_AWPROT;
  input [3:0] twiddle_h_rsc_0_3_AWCACHE;
  input twiddle_h_rsc_0_3_AWLOCK;
  input [1:0] twiddle_h_rsc_0_3_AWBURST;
  input [2:0] twiddle_h_rsc_0_3_AWSIZE;
  input [7:0] twiddle_h_rsc_0_3_AWLEN;
  input [11:0] twiddle_h_rsc_0_3_AWADDR;
  input twiddle_h_rsc_0_3_AWID;
  output twiddle_h_rsc_triosy_0_3_lz;
  output yt_rsc_0_0_i_clken_d;
  input [31:0] yt_rsc_0_0_i_q_d;
  input [31:0] yt_rsc_0_1_i_q_d;
  input [31:0] yt_rsc_0_2_i_q_d;
  input [31:0] yt_rsc_0_3_i_q_d;
  output yt_rsc_0_4_i_clken_d;
  input [31:0] yt_rsc_0_4_i_q_d;
  input [31:0] yt_rsc_0_5_i_q_d;
  input [31:0] yt_rsc_0_6_i_q_d;
  input [31:0] yt_rsc_0_7_i_q_d;
  output yt_rsc_1_0_i_clken_d;
  input [31:0] yt_rsc_1_0_i_q_d;
  input [31:0] yt_rsc_1_1_i_q_d;
  input [31:0] yt_rsc_1_2_i_q_d;
  input [31:0] yt_rsc_1_3_i_q_d;
  output yt_rsc_1_4_i_clken_d;
  input [31:0] yt_rsc_1_4_i_q_d;
  input [31:0] yt_rsc_1_5_i_q_d;
  input [31:0] yt_rsc_1_6_i_q_d;
  input [31:0] yt_rsc_1_7_i_q_d;
  output [6:0] xt_rsc_0_0_i_adra_d;
  output [31:0] xt_rsc_0_0_i_da_d;
  input [63:0] xt_rsc_0_0_i_qa_d;
  output [1:0] xt_rsc_0_0_i_wea_d;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [6:0] xt_rsc_0_1_i_adra_d;
  output [31:0] xt_rsc_0_1_i_da_d;
  input [63:0] xt_rsc_0_1_i_qa_d;
  output [1:0] xt_rsc_0_1_i_wea_d;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [6:0] xt_rsc_0_2_i_adra_d;
  output [31:0] xt_rsc_0_2_i_da_d;
  input [63:0] xt_rsc_0_2_i_qa_d;
  output [1:0] xt_rsc_0_2_i_wea_d;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [6:0] xt_rsc_0_3_i_adra_d;
  output [31:0] xt_rsc_0_3_i_da_d;
  input [63:0] xt_rsc_0_3_i_qa_d;
  output [1:0] xt_rsc_0_3_i_wea_d;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [6:0] xt_rsc_0_4_i_adra_d;
  output [31:0] xt_rsc_0_4_i_da_d;
  input [63:0] xt_rsc_0_4_i_qa_d;
  output [1:0] xt_rsc_0_4_i_wea_d;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [6:0] xt_rsc_0_5_i_adra_d;
  output [31:0] xt_rsc_0_5_i_da_d;
  input [63:0] xt_rsc_0_5_i_qa_d;
  output [1:0] xt_rsc_0_5_i_wea_d;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [6:0] xt_rsc_0_6_i_adra_d;
  output [31:0] xt_rsc_0_6_i_da_d;
  input [63:0] xt_rsc_0_6_i_qa_d;
  output [1:0] xt_rsc_0_6_i_wea_d;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [6:0] xt_rsc_0_7_i_adra_d;
  output [31:0] xt_rsc_0_7_i_da_d;
  input [63:0] xt_rsc_0_7_i_qa_d;
  output [1:0] xt_rsc_0_7_i_wea_d;
  output [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [31:0] yt_rsc_0_0_i_d_d_pff;
  output [5:0] yt_rsc_0_0_i_radr_d_pff;
  output [5:0] yt_rsc_0_0_i_wadr_d_pff;
  output yt_rsc_0_0_i_we_d_pff;
  output yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output [31:0] yt_rsc_0_1_i_d_d_pff;
  output [31:0] yt_rsc_0_2_i_d_d_pff;
  output [31:0] yt_rsc_0_3_i_d_d_pff;
  output [5:0] yt_rsc_0_4_i_wadr_d_pff;
  output yt_rsc_0_4_i_we_d_pff;
  output [31:0] yt_rsc_1_0_i_d_d_pff;
  output yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff;
  output [31:0] yt_rsc_1_1_i_d_d_pff;
  output [31:0] yt_rsc_1_2_i_d_d_pff;
  output [31:0] yt_rsc_1_3_i_d_d_pff;


  // Interconnect Declarations
  wire core_wen;
  wire [31:0] p_rsci_idat;
  wire core_wten;
  wire [31:0] xt_rsc_0_0_i_qa_d_mxwt;
  wire [31:0] xt_rsc_0_1_i_qa_d_mxwt;
  wire [31:0] xt_rsc_0_2_i_qa_d_mxwt;
  wire [31:0] xt_rsc_0_3_i_qa_d_mxwt;
  wire [31:0] xt_rsc_0_4_i_qa_d_mxwt;
  wire [31:0] xt_rsc_0_5_i_qa_d_mxwt;
  wire [31:0] xt_rsc_0_6_i_qa_d_mxwt;
  wire [31:0] xt_rsc_0_7_i_qa_d_mxwt;
  wire twiddle_rsc_0_0_i_wen_comp;
  wire [31:0] twiddle_rsc_0_0_i_s_din_mxwt;
  wire twiddle_rsc_0_1_i_wen_comp;
  wire [31:0] twiddle_rsc_0_1_i_s_din_mxwt;
  wire twiddle_rsc_0_2_i_wen_comp;
  wire [31:0] twiddle_rsc_0_2_i_s_din_mxwt;
  wire twiddle_rsc_0_3_i_wen_comp;
  wire [31:0] twiddle_rsc_0_3_i_s_din_mxwt;
  wire twiddle_h_rsc_0_0_i_wen_comp;
  wire [31:0] twiddle_h_rsc_0_0_i_s_din_mxwt;
  wire twiddle_h_rsc_0_1_i_wen_comp;
  wire [31:0] twiddle_h_rsc_0_1_i_s_din_mxwt;
  wire twiddle_h_rsc_0_2_i_wen_comp;
  wire [31:0] twiddle_h_rsc_0_2_i_s_din_mxwt;
  wire twiddle_h_rsc_0_3_i_wen_comp;
  wire [31:0] twiddle_h_rsc_0_3_i_s_din_mxwt;
  wire mult_t_mul_cmp_en;
  wire [51:0] mult_t_mul_cmp_z;
  wire [51:0] mult_t_mul_cmp_1_z;
  wire [51:0] mult_t_mul_cmp_2_z;
  wire [51:0] mult_t_mul_cmp_3_z;
  wire [31:0] mult_z_mul_cmp_z;
  wire mult_z_mul_cmp_1_en;
  wire [31:0] mult_z_mul_cmp_1_z;
  wire [31:0] mult_z_mul_cmp_2_z;
  wire [31:0] mult_z_mul_cmp_3_z;
  wire [31:0] mult_z_mul_cmp_4_z;
  wire [31:0] mult_z_mul_cmp_5_z;
  wire [31:0] mult_z_mul_cmp_6_z;
  wire [31:0] mult_z_mul_cmp_7_z;
  wire [5:0] fsm_output;
  wire INNER_LOOP_nor_tmp;
  wire and_dcpl_35;
  wire and_dcpl_37;
  wire and_dcpl_39;
  wire and_dcpl_41;
  wire and_dcpl_43;
  wire or_tmp_215;
  wire or_tmp_222;
  wire and_61_cse;
  wire and_63_cse;
  wire and_201_cse;
  wire and_134_cse;
  wire and_337_cse;
  reg [6:0] cpyVec_for_i_10_3_sva_6_0;
  reg [8:0] operator_33_true_return_8_0_sva;
  reg [6:0] INNER_LOOP_r_9_2_sva_6_0;
  reg [31:0] tmp_14_sva_8;
  wire [31:0] mult_3_res_lpi_3_dfm_mx0;
  reg [31:0] tmp_12_sva_8;
  wire [31:0] mult_2_res_lpi_3_dfm_mx0;
  reg [31:0] tmp_10_sva_8;
  wire [31:0] mult_1_res_lpi_3_dfm_mx0;
  reg [31:0] tmp_8_sva_8;
  wire [31:0] mult_res_lpi_3_dfm_mx0;
  reg INNER_LOOP_stage_0_11;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_9;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_8;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_7;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_6;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_5;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_4;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_3;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_2;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_1;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm;
  reg cpyVec_for_stage_0_2;
  reg cpyVec_for_stage_0;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_11;
  reg INNER_LOOP_stage_0_12;
  reg INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_10;
  reg INNER_LOOP_stage_0_10;
  reg INNER_LOOP_stage_0;
  reg INNER_LOOP_stage_0_3;
  reg INNER_LOOP_stage_0_4;
  reg INNER_LOOP_stage_0_5;
  reg INNER_LOOP_stage_0_6;
  reg INNER_LOOP_stage_0_7;
  reg [31:0] modulo_sub_base_sva_1;
  wire [32:0] nl_modulo_sub_base_sva_1;
  reg [31:0] modulo_sub_base_1_sva_1;
  wire [32:0] nl_modulo_sub_base_1_sva_1;
  reg [31:0] modulo_sub_base_2_sva_1;
  wire [32:0] nl_modulo_sub_base_2_sva_1;
  reg [31:0] modulo_sub_base_3_sva_1;
  wire [32:0] nl_modulo_sub_base_3_sva_1;
  reg mult_3_slc_32_svs_st_1;
  reg mult_2_slc_32_svs_st_1;
  reg mult_1_slc_32_svs_st_1;
  reg mult_slc_32_svs_st_1;
  reg [31:0] modulo_add_base_3_sva_1;
  wire [32:0] nl_modulo_add_base_3_sva_1;
  reg [31:0] modulo_add_base_2_sva_1;
  wire [32:0] nl_modulo_add_base_2_sva_1;
  reg [31:0] modulo_add_base_1_sva_1;
  wire [32:0] nl_modulo_add_base_1_sva_1;
  reg [31:0] modulo_add_base_sva_1;
  wire [32:0] nl_modulo_add_base_sva_1;
  wire [31:0] mult_3_res_sva_2;
  wire [32:0] nl_mult_3_res_sva_2;
  wire [31:0] mult_2_res_sva_2;
  wire [32:0] nl_mult_2_res_sva_2;
  wire [31:0] mult_1_res_sva_2;
  wire [32:0] nl_mult_1_res_sva_2;
  wire [31:0] mult_res_sva_2;
  wire [32:0] nl_mult_res_sva_2;
  reg [31:0] p_sva;
  reg reg_yt_rsc_0_0_cgo_cse;
  reg reg_yt_rsc_0_4_cgo_cse;
  reg reg_yt_rsc_1_0_cgo_cse;
  reg reg_yt_rsc_1_4_cgo_cse;
  reg reg_xt_rsc_0_0_i_oswt_cse;
  reg reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse;
  reg reg_twiddle_rsc_0_1_i_oswt_cse;
  reg [6:0] reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse;
  reg reg_twiddle_rsc_0_2_i_oswt_cse;
  reg reg_twiddle_rsc_0_3_i_oswt_cse;
  reg reg_xt_rsc_triosy_0_7_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_5_cse;
  wire mult_3_t_and_cse;
  wire mult_3_t_and_1_cse;
  wire mult_3_t_and_2_cse;
  wire mult_3_t_and_3_cse;
  wire cpyVec_for_cpyVec_for_and_cse;
  wire or_25_rmff;
  wire or_60_rmff;
  wire or_94_rmff;
  wire or_128_rmff;
  wire [6:0] xt_rsc_0_0_i_adra_d_reg;
  wire [31:0] xt_rsc_0_0_i_da_d_reg;
  wire [1:0] xt_rsc_0_0_i_wea_d_reg;
  wire or_161_rmff;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [6:0] xt_rsc_0_1_i_adra_d_reg;
  wire [31:0] xt_rsc_0_1_i_da_d_reg;
  wire [1:0] xt_rsc_0_1_i_wea_d_reg;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [6:0] xt_rsc_0_2_i_adra_d_reg;
  wire [31:0] xt_rsc_0_2_i_da_d_reg;
  wire [1:0] xt_rsc_0_2_i_wea_d_reg;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [6:0] xt_rsc_0_3_i_adra_d_reg;
  wire [31:0] xt_rsc_0_3_i_da_d_reg;
  wire [1:0] xt_rsc_0_3_i_wea_d_reg;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [6:0] xt_rsc_0_4_i_adra_d_reg;
  wire [31:0] xt_rsc_0_4_i_da_d_reg;
  wire [1:0] xt_rsc_0_4_i_wea_d_reg;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [6:0] xt_rsc_0_5_i_adra_d_reg;
  wire [31:0] xt_rsc_0_5_i_da_d_reg;
  wire [1:0] xt_rsc_0_5_i_wea_d_reg;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [6:0] xt_rsc_0_6_i_adra_d_reg;
  wire [31:0] xt_rsc_0_6_i_da_d_reg;
  wire [1:0] xt_rsc_0_6_i_wea_d_reg;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [6:0] xt_rsc_0_7_i_adra_d_reg;
  wire [31:0] xt_rsc_0_7_i_da_d_reg;
  wire [1:0] xt_rsc_0_7_i_wea_d_reg;
  wire [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire and_449_rmff;
  wire and_515_rmff;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_29_itm_10;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_33_itm_10;
  wire [8:0] operator_33_true_lshift_itm;
  wire [4:0] z_out;
  wire [5:0] nl_z_out;
  wire [7:0] z_out_1;
  wire [8:0] nl_z_out_1;
  reg [3:0] STAGE_LOOP_c_3_0_sva;
  reg INNER_LOOP_stage_0_8;
  reg INNER_LOOP_stage_0_9;
  reg [31:0] tmp_8_sva_1;
  reg [31:0] tmp_8_sva_2;
  reg [31:0] tmp_8_sva_3;
  reg [31:0] tmp_8_sva_4;
  reg [31:0] tmp_8_sva_5;
  reg [31:0] tmp_8_sva_6;
  reg [31:0] tmp_8_sva_7;
  reg [31:0] mult_res_sva_1;
  reg [31:0] tmp_10_sva_1;
  reg [31:0] tmp_10_sva_2;
  reg [31:0] tmp_10_sva_3;
  reg [31:0] tmp_10_sva_4;
  reg [31:0] tmp_10_sva_5;
  reg [31:0] tmp_10_sva_6;
  reg [31:0] tmp_10_sva_7;
  reg [31:0] mult_1_res_sva_1;
  reg [31:0] tmp_12_sva_1;
  reg [31:0] tmp_12_sva_2;
  reg [31:0] tmp_12_sva_3;
  reg [31:0] tmp_12_sva_4;
  reg [31:0] tmp_12_sva_5;
  reg [31:0] tmp_12_sva_6;
  reg [31:0] tmp_12_sva_7;
  reg [31:0] mult_2_res_sva_1;
  reg [31:0] tmp_14_sva_1;
  reg [31:0] tmp_14_sva_2;
  reg [31:0] tmp_14_sva_3;
  reg [31:0] tmp_14_sva_4;
  reg [31:0] tmp_14_sva_5;
  reg [31:0] tmp_14_sva_6;
  reg [31:0] tmp_14_sva_7;
  reg [31:0] mult_3_res_sva_1;
  reg [31:0] mult_z_asn_itm_1;
  reg [31:0] mult_z_asn_itm_2;
  reg [31:0] mult_z_asn_itm_3;
  reg [31:0] mult_z_asn_itm_4;
  reg [31:0] mult_z_asn_itm_1_1;
  reg [31:0] mult_1_z_asn_itm_1;
  reg [31:0] mult_1_z_asn_itm_2;
  reg [31:0] mult_1_z_asn_itm_3;
  reg [31:0] mult_1_z_asn_itm_4;
  reg [31:0] mult_1_z_asn_itm_1_1;
  reg [31:0] mult_2_z_asn_itm_1;
  reg [31:0] mult_2_z_asn_itm_2;
  reg [31:0] mult_2_z_asn_itm_3;
  reg [31:0] mult_2_z_asn_itm_4;
  reg [31:0] mult_2_z_asn_itm_1_1;
  reg [31:0] mult_3_z_asn_itm_1;
  reg [31:0] mult_3_z_asn_itm_2;
  reg [31:0] mult_3_z_asn_itm_3;
  reg [31:0] mult_3_z_asn_itm_4;
  reg [31:0] mult_3_z_asn_itm_1_1;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_1;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_2;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_3;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_4;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_5;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_6;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_7;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_8;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_9;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_1;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_2;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_3;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_4;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_5;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_6;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_7;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_8;
  reg [5:0] INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_9;
  reg cpyVec_for_i_slc_cpyVec_for_i_10_3_6_0_168_itm;
  wire butterFly_and_cse;
  wire mult_3_if_and_cse;
  wire mult_3_z_and_cse;
  wire mult_3_z_and_4_cse;
  wire mult_3_z_and_5_cse;
  wire mult_3_z_and_6_cse;
  wire INNER_LOOP_r_and_19_cse;
  wire INNER_LOOP_r_and_22_cse;
  wire INNER_LOOP_r_and_25_cse;
  wire INNER_LOOP_nand_cse;
  wire INNER_LOOP_INNER_LOOP_and_12_cse;

  wire[32:0] mult_3_if_acc_1_nl;
  wire[33:0] nl_mult_3_if_acc_1_nl;
  wire[32:0] mult_2_if_acc_1_nl;
  wire[33:0] nl_mult_2_if_acc_1_nl;
  wire[32:0] mult_1_if_acc_1_nl;
  wire[33:0] nl_mult_1_if_acc_1_nl;
  wire[32:0] mult_if_acc_1_nl;
  wire[33:0] nl_mult_if_acc_1_nl;
  wire[6:0] INNER_LOOP_r_mux_nl;
  wire[0:0] not_163_nl;
  wire[0:0] INNER_LOOP_mux_14_nl;
  wire[0:0] INNER_LOOP_mux_13_nl;
  wire[31:0] mult_3_if_acc_nl;
  wire[32:0] nl_mult_3_if_acc_nl;
  wire[31:0] mult_2_if_acc_nl;
  wire[32:0] nl_mult_2_if_acc_nl;
  wire[31:0] mult_1_if_acc_nl;
  wire[32:0] nl_mult_1_if_acc_nl;
  wire[31:0] mult_if_acc_nl;
  wire[32:0] nl_mult_if_acc_nl;
  wire[31:0] modulo_add_qif_acc_nl;
  wire[32:0] nl_modulo_add_qif_acc_nl;
  wire[32:0] modulo_add_acc_1_nl;
  wire[33:0] nl_modulo_add_acc_1_nl;
  wire[31:0] modulo_add_1_qif_acc_nl;
  wire[32:0] nl_modulo_add_1_qif_acc_nl;
  wire[32:0] modulo_add_1_acc_1_nl;
  wire[33:0] nl_modulo_add_1_acc_1_nl;
  wire[31:0] modulo_add_2_qif_acc_nl;
  wire[32:0] nl_modulo_add_2_qif_acc_nl;
  wire[32:0] modulo_add_2_acc_1_nl;
  wire[33:0] nl_modulo_add_2_acc_1_nl;
  wire[31:0] modulo_add_3_qif_acc_nl;
  wire[32:0] nl_modulo_add_3_qif_acc_nl;
  wire[32:0] modulo_add_3_acc_1_nl;
  wire[33:0] nl_modulo_add_3_acc_1_nl;
  wire[31:0] modulo_sub_qif_acc_nl;
  wire[32:0] nl_modulo_sub_qif_acc_nl;
  wire[31:0] modulo_sub_1_qif_acc_nl;
  wire[32:0] nl_modulo_sub_1_qif_acc_nl;
  wire[31:0] modulo_sub_2_qif_acc_nl;
  wire[32:0] nl_modulo_sub_2_qif_acc_nl;
  wire[31:0] modulo_sub_3_qif_acc_nl;
  wire[32:0] nl_modulo_sub_3_qif_acc_nl;
  wire[6:0] operator_20_false_mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_mult_t_mul_cmp_1_b;
  assign nl_mult_t_mul_cmp_1_b = MUX1HOT_v_32_4_2(twiddle_h_rsc_0_0_i_s_din_mxwt,
      twiddle_h_rsc_0_1_i_s_din_mxwt, twiddle_h_rsc_0_2_i_s_din_mxwt, twiddle_h_rsc_0_3_i_s_din_mxwt,
      {mult_3_t_and_cse , mult_3_t_and_1_cse , mult_3_t_and_2_cse , mult_3_t_and_3_cse});
  wire [31:0] nl_mult_t_mul_cmp_2_b;
  assign nl_mult_t_mul_cmp_2_b = MUX_v_32_2_2(twiddle_h_rsc_0_2_i_s_din_mxwt, twiddle_h_rsc_0_0_i_s_din_mxwt,
      or_tmp_215);
  wire [31:0] nl_mult_t_mul_cmp_3_b;
  assign nl_mult_t_mul_cmp_3_b = MUX_v_32_2_2(twiddle_h_rsc_0_1_i_s_din_mxwt, twiddle_h_rsc_0_0_i_s_din_mxwt,
      or_tmp_222);
  wire [31:0] nl_mult_z_mul_cmp_1_a;
  assign nl_mult_z_mul_cmp_1_a = mult_t_mul_cmp_1_z[51:20];
  wire [31:0] nl_mult_z_mul_cmp_1_b;
  assign nl_mult_z_mul_cmp_1_b = p_sva;
  wire [31:0] nl_mult_z_mul_cmp_2_b;
  assign nl_mult_z_mul_cmp_2_b = MUX1HOT_v_32_4_2(twiddle_rsc_0_0_i_s_din_mxwt, twiddle_rsc_0_1_i_s_din_mxwt,
      twiddle_rsc_0_2_i_s_din_mxwt, twiddle_rsc_0_3_i_s_din_mxwt, {mult_3_t_and_cse
      , mult_3_t_and_1_cse , mult_3_t_and_2_cse , mult_3_t_and_3_cse});
  wire [31:0] nl_mult_z_mul_cmp_3_a;
  assign nl_mult_z_mul_cmp_3_a = mult_t_mul_cmp_2_z[51:20];
  wire [31:0] nl_mult_z_mul_cmp_3_b;
  assign nl_mult_z_mul_cmp_3_b = p_sva;
  wire [31:0] nl_mult_z_mul_cmp_4_b;
  assign nl_mult_z_mul_cmp_4_b = MUX_v_32_2_2(twiddle_rsc_0_2_i_s_din_mxwt, twiddle_rsc_0_0_i_s_din_mxwt,
      or_tmp_215);
  wire [31:0] nl_mult_z_mul_cmp_5_a;
  assign nl_mult_z_mul_cmp_5_a = mult_t_mul_cmp_3_z[51:20];
  wire [31:0] nl_mult_z_mul_cmp_5_b;
  assign nl_mult_z_mul_cmp_5_b = p_sva;
  wire [31:0] nl_mult_z_mul_cmp_6_b;
  assign nl_mult_z_mul_cmp_6_b = MUX_v_32_2_2(twiddle_rsc_0_1_i_s_din_mxwt, twiddle_rsc_0_0_i_s_din_mxwt,
      or_tmp_222);
  wire [31:0] nl_mult_z_mul_cmp_7_a;
  assign nl_mult_z_mul_cmp_7_a = mult_t_mul_cmp_z[51:20];
  wire [31:0] nl_mult_z_mul_cmp_7_b;
  assign nl_mult_z_mul_cmp_7_b = p_sva;
  wire [3:0] nl_operator_33_true_lshift_rg_s;
  assign nl_operator_33_true_lshift_rg_s = z_out[3:0];
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_adra_d_core = {7'b0000000
      , INNER_LOOP_r_9_2_sva_6_0};
  wire[31:0] butterFly_mux_29_nl;
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_da_d_core;
  assign butterFly_mux_29_nl = MUX_v_32_2_2(yt_rsc_0_0_i_q_d, yt_rsc_1_0_i_q_d, INNER_LOOP_stage_0_10);
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_da_d_core = {32'b00000000000000000000000000000000
      , butterFly_mux_29_nl};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_wea_d_core_psct = {1'b0
      , and_337_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , INNER_LOOP_INNER_LOOP_and_12_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , and_337_cse};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_adra_d_core = {7'b0000000
      , INNER_LOOP_r_9_2_sva_6_0};
  wire[31:0] butterFly_1_mux_4_nl;
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_da_d_core;
  assign butterFly_1_mux_4_nl = MUX_v_32_2_2(yt_rsc_0_1_i_q_d, yt_rsc_1_1_i_q_d,
      INNER_LOOP_stage_0_10);
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_da_d_core = {32'b00000000000000000000000000000000
      , butterFly_1_mux_4_nl};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_wea_d_core_psct = {1'b0
      , and_337_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , INNER_LOOP_INNER_LOOP_and_12_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , and_337_cse};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_adra_d_core = {7'b0000000
      , INNER_LOOP_r_9_2_sva_6_0};
  wire[31:0] butterFly_2_mux_4_nl;
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_da_d_core;
  assign butterFly_2_mux_4_nl = MUX_v_32_2_2(yt_rsc_0_2_i_q_d, yt_rsc_1_2_i_q_d,
      INNER_LOOP_stage_0_10);
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_da_d_core = {32'b00000000000000000000000000000000
      , butterFly_2_mux_4_nl};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_wea_d_core_psct = {1'b0
      , and_337_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , INNER_LOOP_INNER_LOOP_and_12_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , and_337_cse};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_adra_d_core = {7'b0000000
      , INNER_LOOP_r_9_2_sva_6_0};
  wire[31:0] butterFly_3_mux_4_nl;
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_da_d_core;
  assign butterFly_3_mux_4_nl = MUX_v_32_2_2(yt_rsc_0_3_i_q_d, yt_rsc_1_3_i_q_d,
      INNER_LOOP_stage_0_10);
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_da_d_core = {32'b00000000000000000000000000000000
      , butterFly_3_mux_4_nl};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_wea_d_core_psct = {1'b0
      , and_337_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , INNER_LOOP_INNER_LOOP_and_12_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , and_337_cse};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_adra_d_core = {7'b0000000
      , INNER_LOOP_r_9_2_sva_6_0};
  wire[31:0] butterFly_mux_30_nl;
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_da_d_core;
  assign butterFly_mux_30_nl = MUX_v_32_2_2(yt_rsc_0_4_i_q_d, yt_rsc_1_4_i_q_d, INNER_LOOP_stage_0_10);
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_da_d_core = {32'b00000000000000000000000000000000
      , butterFly_mux_30_nl};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_wea_d_core_psct = {1'b0
      , and_337_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , INNER_LOOP_INNER_LOOP_and_12_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , and_337_cse};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_adra_d_core = {7'b0000000
      , INNER_LOOP_r_9_2_sva_6_0};
  wire[31:0] butterFly_1_mux_5_nl;
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_da_d_core;
  assign butterFly_1_mux_5_nl = MUX_v_32_2_2(yt_rsc_0_5_i_q_d, yt_rsc_1_5_i_q_d,
      INNER_LOOP_stage_0_10);
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_da_d_core = {32'b00000000000000000000000000000000
      , butterFly_1_mux_5_nl};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_wea_d_core_psct = {1'b0
      , and_337_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , INNER_LOOP_INNER_LOOP_and_12_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , and_337_cse};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_adra_d_core = {7'b0000000
      , INNER_LOOP_r_9_2_sva_6_0};
  wire[31:0] butterFly_2_mux_5_nl;
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_da_d_core;
  assign butterFly_2_mux_5_nl = MUX_v_32_2_2(yt_rsc_0_6_i_q_d, yt_rsc_1_6_i_q_d,
      INNER_LOOP_stage_0_10);
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_da_d_core = {32'b00000000000000000000000000000000
      , butterFly_2_mux_5_nl};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_wea_d_core_psct = {1'b0
      , and_337_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , INNER_LOOP_INNER_LOOP_and_12_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , and_337_cse};
  wire [13:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_adra_d_core;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_adra_d_core = {7'b0000000
      , INNER_LOOP_r_9_2_sva_6_0};
  wire[31:0] butterFly_3_mux_5_nl;
  wire [63:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_da_d_core;
  assign butterFly_3_mux_5_nl = MUX_v_32_2_2(yt_rsc_0_7_i_q_d, yt_rsc_1_7_i_q_d,
      INNER_LOOP_stage_0_10);
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_da_d_core = {32'b00000000000000000000000000000000
      , butterFly_3_mux_5_nl};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_wea_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_wea_d_core_psct = {1'b0
      , and_337_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , INNER_LOOP_INNER_LOOP_and_12_cse};
  wire [1:0] nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , and_337_cse};
  wire [7:0] nl_peaseNTT_core_twiddle_rsc_0_0_i_inst_twiddle_rsc_0_0_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsc_0_0_i_inst_twiddle_rsc_0_0_i_s_raddr_core =
      {1'b0, reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse};
  wire [7:0] nl_peaseNTT_core_twiddle_rsc_0_1_i_inst_twiddle_rsc_0_1_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsc_0_1_i_inst_twiddle_rsc_0_1_i_s_raddr_core =
      {1'b0, reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse};
  wire [7:0] nl_peaseNTT_core_twiddle_rsc_0_2_i_inst_twiddle_rsc_0_2_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsc_0_2_i_inst_twiddle_rsc_0_2_i_s_raddr_core =
      {1'b0, reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse};
  wire [7:0] nl_peaseNTT_core_twiddle_rsc_0_3_i_inst_twiddle_rsc_0_3_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsc_0_3_i_inst_twiddle_rsc_0_3_i_s_raddr_core =
      {1'b0, reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse};
  wire [7:0] nl_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_twiddle_h_rsc_0_0_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_twiddle_h_rsc_0_0_i_s_raddr_core
      = {1'b0, reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse};
  wire [7:0] nl_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_twiddle_h_rsc_0_1_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_twiddle_h_rsc_0_1_i_s_raddr_core
      = {1'b0, reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse};
  wire [7:0] nl_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_twiddle_h_rsc_0_2_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_twiddle_h_rsc_0_2_i_s_raddr_core
      = {1'b0, reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse};
  wire [7:0] nl_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_twiddle_h_rsc_0_3_i_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_twiddle_h_rsc_0_3_i_s_raddr_core
      = {1'b0, reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse};
  wire [0:0] nl_peaseNTT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0;
  assign nl_peaseNTT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0 = z_out[4];
  wire [0:0] nl_peaseNTT_core_core_fsm_inst_cpyVec_for_C_0_tr0;
  assign nl_peaseNTT_core_core_fsm_inst_cpyVec_for_C_0_tr0 = ~(cpyVec_for_stage_0
      | cpyVec_for_stage_0_2);
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
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
      .a(xt_rsc_0_1_i_qa_d_mxwt),
      .b(twiddle_h_rsc_0_0_i_s_din_mxwt),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_t_mul_cmp_z)
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
  .n_inreg(32'sd2)) mult_t_mul_cmp_1 (
      .a(xt_rsc_0_7_i_qa_d_mxwt),
      .b(nl_mult_t_mul_cmp_1_b[31:0]),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_t_mul_cmp_1_z)
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
  .n_inreg(32'sd2)) mult_t_mul_cmp_2 (
      .a(xt_rsc_0_5_i_qa_d_mxwt),
      .b(nl_mult_t_mul_cmp_2_b[31:0]),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_t_mul_cmp_2_z)
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
  .n_inreg(32'sd2)) mult_t_mul_cmp_3 (
      .a(xt_rsc_0_3_i_qa_d_mxwt),
      .b(nl_mult_t_mul_cmp_3_b[31:0]),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_t_mul_cmp_3_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp (
      .a(xt_rsc_0_1_i_qa_d_mxwt),
      .b(twiddle_rsc_0_0_i_s_din_mxwt),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp_1 (
      .a(nl_mult_z_mul_cmp_1_a[31:0]),
      .b(nl_mult_z_mul_cmp_1_b[31:0]),
      .clk(clk),
      .en(mult_z_mul_cmp_1_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_1_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp_2 (
      .a(xt_rsc_0_7_i_qa_d_mxwt),
      .b(nl_mult_z_mul_cmp_2_b[31:0]),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_2_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp_3 (
      .a(nl_mult_z_mul_cmp_3_a[31:0]),
      .b(nl_mult_z_mul_cmp_3_b[31:0]),
      .clk(clk),
      .en(mult_z_mul_cmp_1_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_3_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp_4 (
      .a(xt_rsc_0_5_i_qa_d_mxwt),
      .b(nl_mult_z_mul_cmp_4_b[31:0]),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_4_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp_5 (
      .a(nl_mult_z_mul_cmp_5_a[31:0]),
      .b(nl_mult_z_mul_cmp_5_b[31:0]),
      .clk(clk),
      .en(mult_z_mul_cmp_1_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_5_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp_6 (
      .a(xt_rsc_0_3_i_qa_d_mxwt),
      .b(nl_mult_z_mul_cmp_6_b[31:0]),
      .clk(clk),
      .en(mult_t_mul_cmp_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_6_z)
    );
  mgc_mul_pipe #(.width_a(32'sd32),
  .signd_a(32'sd0),
  .width_b(32'sd32),
  .signd_b(32'sd0),
  .width_z(32'sd32),
  .clock_edge(32'sd1),
  .enable_active(32'sd1),
  .a_rst_active(32'sd0),
  .s_rst_active(32'sd1),
  .stages(32'sd2),
  .n_inreg(32'sd2)) mult_z_mul_cmp_7 (
      .a(nl_mult_z_mul_cmp_7_a[31:0]),
      .b(nl_mult_z_mul_cmp_7_b[31:0]),
      .clk(clk),
      .en(mult_z_mul_cmp_1_en),
      .a_rst(1'b1),
      .s_rst(rst),
      .z(mult_z_mul_cmp_7_z)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd1),
  .width_s(32'sd4),
  .width_z(32'sd9)) operator_33_true_lshift_rg (
      .a(1'b1),
      .s(nl_operator_33_true_lshift_rg_s[3:0]),
      .z(operator_33_true_lshift_itm)
    );
  peaseNTT_core_wait_dp peaseNTT_core_wait_dp_inst (
      .yt_rsc_0_0_cgo_iro(or_25_rmff),
      .yt_rsc_0_0_i_clken_d(yt_rsc_0_0_i_clken_d),
      .yt_rsc_0_4_cgo_iro(or_60_rmff),
      .yt_rsc_0_4_i_clken_d(yt_rsc_0_4_i_clken_d),
      .yt_rsc_1_0_cgo_iro(or_94_rmff),
      .yt_rsc_1_0_i_clken_d(yt_rsc_1_0_i_clken_d),
      .yt_rsc_1_4_cgo_iro(or_128_rmff),
      .yt_rsc_1_4_i_clken_d(yt_rsc_1_4_i_clken_d),
      .ensig_cgo_iro(and_449_rmff),
      .ensig_cgo_iro_5(and_515_rmff),
      .core_wen(core_wen),
      .yt_rsc_0_0_cgo(reg_yt_rsc_0_0_cgo_cse),
      .yt_rsc_0_4_cgo(reg_yt_rsc_0_4_cgo_cse),
      .yt_rsc_1_0_cgo(reg_yt_rsc_1_0_cgo_cse),
      .yt_rsc_1_4_cgo(reg_yt_rsc_1_4_cgo_cse),
      .ensig_cgo(reg_ensig_cgo_cse),
      .mult_t_mul_cmp_en(mult_t_mul_cmp_en),
      .ensig_cgo_5(reg_ensig_cgo_5_cse),
      .mult_z_mul_cmp_1_en(mult_z_mul_cmp_1_en)
    );
  peaseNTT_core_xt_rsc_0_0_i_1 peaseNTT_core_xt_rsc_0_0_i_1_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_0_i_adra_d(xt_rsc_0_0_i_adra_d_reg),
      .xt_rsc_0_0_i_da_d(xt_rsc_0_0_i_da_d_reg),
      .xt_rsc_0_0_i_qa_d(xt_rsc_0_0_i_qa_d),
      .xt_rsc_0_0_i_wea_d(xt_rsc_0_0_i_wea_d_reg),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(core_wen),
      .xt_rsc_0_0_i_oswt(reg_xt_rsc_0_0_i_oswt_cse),
      .core_wten(core_wten),
      .xt_rsc_0_0_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_adra_d_core[13:0]),
      .xt_rsc_0_0_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_da_d_core[63:0]),
      .xt_rsc_0_0_i_qa_d_mxwt(xt_rsc_0_0_i_qa_d_mxwt),
      .xt_rsc_0_0_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_0_i_1_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_0_i_oswt_pff(or_161_rmff)
    );
  peaseNTT_core_xt_rsc_0_1_i_1 peaseNTT_core_xt_rsc_0_1_i_1_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_1_i_adra_d(xt_rsc_0_1_i_adra_d_reg),
      .xt_rsc_0_1_i_da_d(xt_rsc_0_1_i_da_d_reg),
      .xt_rsc_0_1_i_qa_d(xt_rsc_0_1_i_qa_d),
      .xt_rsc_0_1_i_wea_d(xt_rsc_0_1_i_wea_d_reg),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_1_i_oswt(reg_xt_rsc_0_0_i_oswt_cse),
      .xt_rsc_0_1_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_adra_d_core[13:0]),
      .xt_rsc_0_1_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_da_d_core[63:0]),
      .xt_rsc_0_1_i_qa_d_mxwt(xt_rsc_0_1_i_qa_d_mxwt),
      .xt_rsc_0_1_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_1_i_1_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_1_i_oswt_pff(or_161_rmff)
    );
  peaseNTT_core_xt_rsc_0_2_i_1 peaseNTT_core_xt_rsc_0_2_i_1_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_2_i_adra_d(xt_rsc_0_2_i_adra_d_reg),
      .xt_rsc_0_2_i_da_d(xt_rsc_0_2_i_da_d_reg),
      .xt_rsc_0_2_i_qa_d(xt_rsc_0_2_i_qa_d),
      .xt_rsc_0_2_i_wea_d(xt_rsc_0_2_i_wea_d_reg),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_2_i_oswt(reg_xt_rsc_0_0_i_oswt_cse),
      .xt_rsc_0_2_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_adra_d_core[13:0]),
      .xt_rsc_0_2_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_da_d_core[63:0]),
      .xt_rsc_0_2_i_qa_d_mxwt(xt_rsc_0_2_i_qa_d_mxwt),
      .xt_rsc_0_2_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_2_i_1_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_2_i_oswt_pff(or_161_rmff)
    );
  peaseNTT_core_xt_rsc_0_3_i_1 peaseNTT_core_xt_rsc_0_3_i_1_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_3_i_adra_d(xt_rsc_0_3_i_adra_d_reg),
      .xt_rsc_0_3_i_da_d(xt_rsc_0_3_i_da_d_reg),
      .xt_rsc_0_3_i_qa_d(xt_rsc_0_3_i_qa_d),
      .xt_rsc_0_3_i_wea_d(xt_rsc_0_3_i_wea_d_reg),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_3_i_oswt(reg_xt_rsc_0_0_i_oswt_cse),
      .xt_rsc_0_3_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_adra_d_core[13:0]),
      .xt_rsc_0_3_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_da_d_core[63:0]),
      .xt_rsc_0_3_i_qa_d_mxwt(xt_rsc_0_3_i_qa_d_mxwt),
      .xt_rsc_0_3_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_3_i_1_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_3_i_oswt_pff(or_161_rmff)
    );
  peaseNTT_core_xt_rsc_0_4_i_1 peaseNTT_core_xt_rsc_0_4_i_1_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_4_i_adra_d(xt_rsc_0_4_i_adra_d_reg),
      .xt_rsc_0_4_i_da_d(xt_rsc_0_4_i_da_d_reg),
      .xt_rsc_0_4_i_qa_d(xt_rsc_0_4_i_qa_d),
      .xt_rsc_0_4_i_wea_d(xt_rsc_0_4_i_wea_d_reg),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_4_i_oswt(reg_xt_rsc_0_0_i_oswt_cse),
      .xt_rsc_0_4_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_adra_d_core[13:0]),
      .xt_rsc_0_4_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_da_d_core[63:0]),
      .xt_rsc_0_4_i_qa_d_mxwt(xt_rsc_0_4_i_qa_d_mxwt),
      .xt_rsc_0_4_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_4_i_1_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_4_i_oswt_pff(or_161_rmff)
    );
  peaseNTT_core_xt_rsc_0_5_i_1 peaseNTT_core_xt_rsc_0_5_i_1_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_5_i_adra_d(xt_rsc_0_5_i_adra_d_reg),
      .xt_rsc_0_5_i_da_d(xt_rsc_0_5_i_da_d_reg),
      .xt_rsc_0_5_i_qa_d(xt_rsc_0_5_i_qa_d),
      .xt_rsc_0_5_i_wea_d(xt_rsc_0_5_i_wea_d_reg),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_5_i_oswt(reg_xt_rsc_0_0_i_oswt_cse),
      .xt_rsc_0_5_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_adra_d_core[13:0]),
      .xt_rsc_0_5_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_da_d_core[63:0]),
      .xt_rsc_0_5_i_qa_d_mxwt(xt_rsc_0_5_i_qa_d_mxwt),
      .xt_rsc_0_5_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_5_i_1_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_5_i_oswt_pff(or_161_rmff)
    );
  peaseNTT_core_xt_rsc_0_6_i_1 peaseNTT_core_xt_rsc_0_6_i_1_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_6_i_adra_d(xt_rsc_0_6_i_adra_d_reg),
      .xt_rsc_0_6_i_da_d(xt_rsc_0_6_i_da_d_reg),
      .xt_rsc_0_6_i_qa_d(xt_rsc_0_6_i_qa_d),
      .xt_rsc_0_6_i_wea_d(xt_rsc_0_6_i_wea_d_reg),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_6_i_oswt(reg_xt_rsc_0_0_i_oswt_cse),
      .xt_rsc_0_6_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_adra_d_core[13:0]),
      .xt_rsc_0_6_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_da_d_core[63:0]),
      .xt_rsc_0_6_i_qa_d_mxwt(xt_rsc_0_6_i_qa_d_mxwt),
      .xt_rsc_0_6_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_6_i_1_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_6_i_oswt_pff(or_161_rmff)
    );
  peaseNTT_core_xt_rsc_0_7_i_1 peaseNTT_core_xt_rsc_0_7_i_1_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_0_7_i_adra_d(xt_rsc_0_7_i_adra_d_reg),
      .xt_rsc_0_7_i_da_d(xt_rsc_0_7_i_da_d_reg),
      .xt_rsc_0_7_i_qa_d(xt_rsc_0_7_i_qa_d),
      .xt_rsc_0_7_i_wea_d(xt_rsc_0_7_i_wea_d_reg),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsc_0_7_i_oswt(reg_xt_rsc_0_0_i_oswt_cse),
      .xt_rsc_0_7_i_adra_d_core(nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_adra_d_core[13:0]),
      .xt_rsc_0_7_i_da_d_core(nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_da_d_core[63:0]),
      .xt_rsc_0_7_i_qa_d_mxwt(xt_rsc_0_7_i_qa_d_mxwt),
      .xt_rsc_0_7_i_wea_d_core_psct(nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_wea_d_core_psct[1:0]),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_peaseNTT_core_xt_rsc_0_7_i_1_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .xt_rsc_0_7_i_oswt_pff(or_161_rmff)
    );
  peaseNTT_core_twiddle_rsc_0_0_i peaseNTT_core_twiddle_rsc_0_0_i_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_0_s_tdone(twiddle_rsc_0_0_s_tdone),
      .twiddle_rsc_0_0_tr_write_done(twiddle_rsc_0_0_tr_write_done),
      .twiddle_rsc_0_0_RREADY(twiddle_rsc_0_0_RREADY),
      .twiddle_rsc_0_0_RVALID(twiddle_rsc_0_0_RVALID),
      .twiddle_rsc_0_0_RUSER(twiddle_rsc_0_0_RUSER),
      .twiddle_rsc_0_0_RLAST(twiddle_rsc_0_0_RLAST),
      .twiddle_rsc_0_0_RRESP(twiddle_rsc_0_0_RRESP),
      .twiddle_rsc_0_0_RDATA(twiddle_rsc_0_0_RDATA),
      .twiddle_rsc_0_0_RID(twiddle_rsc_0_0_RID),
      .twiddle_rsc_0_0_ARREADY(twiddle_rsc_0_0_ARREADY),
      .twiddle_rsc_0_0_ARVALID(twiddle_rsc_0_0_ARVALID),
      .twiddle_rsc_0_0_ARUSER(twiddle_rsc_0_0_ARUSER),
      .twiddle_rsc_0_0_ARREGION(twiddle_rsc_0_0_ARREGION),
      .twiddle_rsc_0_0_ARQOS(twiddle_rsc_0_0_ARQOS),
      .twiddle_rsc_0_0_ARPROT(twiddle_rsc_0_0_ARPROT),
      .twiddle_rsc_0_0_ARCACHE(twiddle_rsc_0_0_ARCACHE),
      .twiddle_rsc_0_0_ARLOCK(twiddle_rsc_0_0_ARLOCK),
      .twiddle_rsc_0_0_ARBURST(twiddle_rsc_0_0_ARBURST),
      .twiddle_rsc_0_0_ARSIZE(twiddle_rsc_0_0_ARSIZE),
      .twiddle_rsc_0_0_ARLEN(twiddle_rsc_0_0_ARLEN),
      .twiddle_rsc_0_0_ARADDR(twiddle_rsc_0_0_ARADDR),
      .twiddle_rsc_0_0_ARID(twiddle_rsc_0_0_ARID),
      .twiddle_rsc_0_0_BREADY(twiddle_rsc_0_0_BREADY),
      .twiddle_rsc_0_0_BVALID(twiddle_rsc_0_0_BVALID),
      .twiddle_rsc_0_0_BUSER(twiddle_rsc_0_0_BUSER),
      .twiddle_rsc_0_0_BRESP(twiddle_rsc_0_0_BRESP),
      .twiddle_rsc_0_0_BID(twiddle_rsc_0_0_BID),
      .twiddle_rsc_0_0_WREADY(twiddle_rsc_0_0_WREADY),
      .twiddle_rsc_0_0_WVALID(twiddle_rsc_0_0_WVALID),
      .twiddle_rsc_0_0_WUSER(twiddle_rsc_0_0_WUSER),
      .twiddle_rsc_0_0_WLAST(twiddle_rsc_0_0_WLAST),
      .twiddle_rsc_0_0_WSTRB(twiddle_rsc_0_0_WSTRB),
      .twiddle_rsc_0_0_WDATA(twiddle_rsc_0_0_WDATA),
      .twiddle_rsc_0_0_AWREADY(twiddle_rsc_0_0_AWREADY),
      .twiddle_rsc_0_0_AWVALID(twiddle_rsc_0_0_AWVALID),
      .twiddle_rsc_0_0_AWUSER(twiddle_rsc_0_0_AWUSER),
      .twiddle_rsc_0_0_AWREGION(twiddle_rsc_0_0_AWREGION),
      .twiddle_rsc_0_0_AWQOS(twiddle_rsc_0_0_AWQOS),
      .twiddle_rsc_0_0_AWPROT(twiddle_rsc_0_0_AWPROT),
      .twiddle_rsc_0_0_AWCACHE(twiddle_rsc_0_0_AWCACHE),
      .twiddle_rsc_0_0_AWLOCK(twiddle_rsc_0_0_AWLOCK),
      .twiddle_rsc_0_0_AWBURST(twiddle_rsc_0_0_AWBURST),
      .twiddle_rsc_0_0_AWSIZE(twiddle_rsc_0_0_AWSIZE),
      .twiddle_rsc_0_0_AWLEN(twiddle_rsc_0_0_AWLEN),
      .twiddle_rsc_0_0_AWADDR(twiddle_rsc_0_0_AWADDR),
      .twiddle_rsc_0_0_AWID(twiddle_rsc_0_0_AWID),
      .core_wen(core_wen),
      .twiddle_rsc_0_0_i_oswt(reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse),
      .twiddle_rsc_0_0_i_wen_comp(twiddle_rsc_0_0_i_wen_comp),
      .twiddle_rsc_0_0_i_s_raddr_core(nl_peaseNTT_core_twiddle_rsc_0_0_i_inst_twiddle_rsc_0_0_i_s_raddr_core[7:0]),
      .twiddle_rsc_0_0_i_s_din_mxwt(twiddle_rsc_0_0_i_s_din_mxwt)
    );
  peaseNTT_core_twiddle_rsc_0_1_i peaseNTT_core_twiddle_rsc_0_1_i_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_1_s_tdone(twiddle_rsc_0_1_s_tdone),
      .twiddle_rsc_0_1_tr_write_done(twiddle_rsc_0_1_tr_write_done),
      .twiddle_rsc_0_1_RREADY(twiddle_rsc_0_1_RREADY),
      .twiddle_rsc_0_1_RVALID(twiddle_rsc_0_1_RVALID),
      .twiddle_rsc_0_1_RUSER(twiddle_rsc_0_1_RUSER),
      .twiddle_rsc_0_1_RLAST(twiddle_rsc_0_1_RLAST),
      .twiddle_rsc_0_1_RRESP(twiddle_rsc_0_1_RRESP),
      .twiddle_rsc_0_1_RDATA(twiddle_rsc_0_1_RDATA),
      .twiddle_rsc_0_1_RID(twiddle_rsc_0_1_RID),
      .twiddle_rsc_0_1_ARREADY(twiddle_rsc_0_1_ARREADY),
      .twiddle_rsc_0_1_ARVALID(twiddle_rsc_0_1_ARVALID),
      .twiddle_rsc_0_1_ARUSER(twiddle_rsc_0_1_ARUSER),
      .twiddle_rsc_0_1_ARREGION(twiddle_rsc_0_1_ARREGION),
      .twiddle_rsc_0_1_ARQOS(twiddle_rsc_0_1_ARQOS),
      .twiddle_rsc_0_1_ARPROT(twiddle_rsc_0_1_ARPROT),
      .twiddle_rsc_0_1_ARCACHE(twiddle_rsc_0_1_ARCACHE),
      .twiddle_rsc_0_1_ARLOCK(twiddle_rsc_0_1_ARLOCK),
      .twiddle_rsc_0_1_ARBURST(twiddle_rsc_0_1_ARBURST),
      .twiddle_rsc_0_1_ARSIZE(twiddle_rsc_0_1_ARSIZE),
      .twiddle_rsc_0_1_ARLEN(twiddle_rsc_0_1_ARLEN),
      .twiddle_rsc_0_1_ARADDR(twiddle_rsc_0_1_ARADDR),
      .twiddle_rsc_0_1_ARID(twiddle_rsc_0_1_ARID),
      .twiddle_rsc_0_1_BREADY(twiddle_rsc_0_1_BREADY),
      .twiddle_rsc_0_1_BVALID(twiddle_rsc_0_1_BVALID),
      .twiddle_rsc_0_1_BUSER(twiddle_rsc_0_1_BUSER),
      .twiddle_rsc_0_1_BRESP(twiddle_rsc_0_1_BRESP),
      .twiddle_rsc_0_1_BID(twiddle_rsc_0_1_BID),
      .twiddle_rsc_0_1_WREADY(twiddle_rsc_0_1_WREADY),
      .twiddle_rsc_0_1_WVALID(twiddle_rsc_0_1_WVALID),
      .twiddle_rsc_0_1_WUSER(twiddle_rsc_0_1_WUSER),
      .twiddle_rsc_0_1_WLAST(twiddle_rsc_0_1_WLAST),
      .twiddle_rsc_0_1_WSTRB(twiddle_rsc_0_1_WSTRB),
      .twiddle_rsc_0_1_WDATA(twiddle_rsc_0_1_WDATA),
      .twiddle_rsc_0_1_AWREADY(twiddle_rsc_0_1_AWREADY),
      .twiddle_rsc_0_1_AWVALID(twiddle_rsc_0_1_AWVALID),
      .twiddle_rsc_0_1_AWUSER(twiddle_rsc_0_1_AWUSER),
      .twiddle_rsc_0_1_AWREGION(twiddle_rsc_0_1_AWREGION),
      .twiddle_rsc_0_1_AWQOS(twiddle_rsc_0_1_AWQOS),
      .twiddle_rsc_0_1_AWPROT(twiddle_rsc_0_1_AWPROT),
      .twiddle_rsc_0_1_AWCACHE(twiddle_rsc_0_1_AWCACHE),
      .twiddle_rsc_0_1_AWLOCK(twiddle_rsc_0_1_AWLOCK),
      .twiddle_rsc_0_1_AWBURST(twiddle_rsc_0_1_AWBURST),
      .twiddle_rsc_0_1_AWSIZE(twiddle_rsc_0_1_AWSIZE),
      .twiddle_rsc_0_1_AWLEN(twiddle_rsc_0_1_AWLEN),
      .twiddle_rsc_0_1_AWADDR(twiddle_rsc_0_1_AWADDR),
      .twiddle_rsc_0_1_AWID(twiddle_rsc_0_1_AWID),
      .core_wen(core_wen),
      .twiddle_rsc_0_1_i_oswt(reg_twiddle_rsc_0_1_i_oswt_cse),
      .twiddle_rsc_0_1_i_wen_comp(twiddle_rsc_0_1_i_wen_comp),
      .twiddle_rsc_0_1_i_s_raddr_core(nl_peaseNTT_core_twiddle_rsc_0_1_i_inst_twiddle_rsc_0_1_i_s_raddr_core[7:0]),
      .twiddle_rsc_0_1_i_s_din_mxwt(twiddle_rsc_0_1_i_s_din_mxwt)
    );
  peaseNTT_core_twiddle_rsc_0_2_i peaseNTT_core_twiddle_rsc_0_2_i_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_2_s_tdone(twiddle_rsc_0_2_s_tdone),
      .twiddle_rsc_0_2_tr_write_done(twiddle_rsc_0_2_tr_write_done),
      .twiddle_rsc_0_2_RREADY(twiddle_rsc_0_2_RREADY),
      .twiddle_rsc_0_2_RVALID(twiddle_rsc_0_2_RVALID),
      .twiddle_rsc_0_2_RUSER(twiddle_rsc_0_2_RUSER),
      .twiddle_rsc_0_2_RLAST(twiddle_rsc_0_2_RLAST),
      .twiddle_rsc_0_2_RRESP(twiddle_rsc_0_2_RRESP),
      .twiddle_rsc_0_2_RDATA(twiddle_rsc_0_2_RDATA),
      .twiddle_rsc_0_2_RID(twiddle_rsc_0_2_RID),
      .twiddle_rsc_0_2_ARREADY(twiddle_rsc_0_2_ARREADY),
      .twiddle_rsc_0_2_ARVALID(twiddle_rsc_0_2_ARVALID),
      .twiddle_rsc_0_2_ARUSER(twiddle_rsc_0_2_ARUSER),
      .twiddle_rsc_0_2_ARREGION(twiddle_rsc_0_2_ARREGION),
      .twiddle_rsc_0_2_ARQOS(twiddle_rsc_0_2_ARQOS),
      .twiddle_rsc_0_2_ARPROT(twiddle_rsc_0_2_ARPROT),
      .twiddle_rsc_0_2_ARCACHE(twiddle_rsc_0_2_ARCACHE),
      .twiddle_rsc_0_2_ARLOCK(twiddle_rsc_0_2_ARLOCK),
      .twiddle_rsc_0_2_ARBURST(twiddle_rsc_0_2_ARBURST),
      .twiddle_rsc_0_2_ARSIZE(twiddle_rsc_0_2_ARSIZE),
      .twiddle_rsc_0_2_ARLEN(twiddle_rsc_0_2_ARLEN),
      .twiddle_rsc_0_2_ARADDR(twiddle_rsc_0_2_ARADDR),
      .twiddle_rsc_0_2_ARID(twiddle_rsc_0_2_ARID),
      .twiddle_rsc_0_2_BREADY(twiddle_rsc_0_2_BREADY),
      .twiddle_rsc_0_2_BVALID(twiddle_rsc_0_2_BVALID),
      .twiddle_rsc_0_2_BUSER(twiddle_rsc_0_2_BUSER),
      .twiddle_rsc_0_2_BRESP(twiddle_rsc_0_2_BRESP),
      .twiddle_rsc_0_2_BID(twiddle_rsc_0_2_BID),
      .twiddle_rsc_0_2_WREADY(twiddle_rsc_0_2_WREADY),
      .twiddle_rsc_0_2_WVALID(twiddle_rsc_0_2_WVALID),
      .twiddle_rsc_0_2_WUSER(twiddle_rsc_0_2_WUSER),
      .twiddle_rsc_0_2_WLAST(twiddle_rsc_0_2_WLAST),
      .twiddle_rsc_0_2_WSTRB(twiddle_rsc_0_2_WSTRB),
      .twiddle_rsc_0_2_WDATA(twiddle_rsc_0_2_WDATA),
      .twiddle_rsc_0_2_AWREADY(twiddle_rsc_0_2_AWREADY),
      .twiddle_rsc_0_2_AWVALID(twiddle_rsc_0_2_AWVALID),
      .twiddle_rsc_0_2_AWUSER(twiddle_rsc_0_2_AWUSER),
      .twiddle_rsc_0_2_AWREGION(twiddle_rsc_0_2_AWREGION),
      .twiddle_rsc_0_2_AWQOS(twiddle_rsc_0_2_AWQOS),
      .twiddle_rsc_0_2_AWPROT(twiddle_rsc_0_2_AWPROT),
      .twiddle_rsc_0_2_AWCACHE(twiddle_rsc_0_2_AWCACHE),
      .twiddle_rsc_0_2_AWLOCK(twiddle_rsc_0_2_AWLOCK),
      .twiddle_rsc_0_2_AWBURST(twiddle_rsc_0_2_AWBURST),
      .twiddle_rsc_0_2_AWSIZE(twiddle_rsc_0_2_AWSIZE),
      .twiddle_rsc_0_2_AWLEN(twiddle_rsc_0_2_AWLEN),
      .twiddle_rsc_0_2_AWADDR(twiddle_rsc_0_2_AWADDR),
      .twiddle_rsc_0_2_AWID(twiddle_rsc_0_2_AWID),
      .core_wen(core_wen),
      .twiddle_rsc_0_2_i_oswt(reg_twiddle_rsc_0_2_i_oswt_cse),
      .twiddle_rsc_0_2_i_wen_comp(twiddle_rsc_0_2_i_wen_comp),
      .twiddle_rsc_0_2_i_s_raddr_core(nl_peaseNTT_core_twiddle_rsc_0_2_i_inst_twiddle_rsc_0_2_i_s_raddr_core[7:0]),
      .twiddle_rsc_0_2_i_s_din_mxwt(twiddle_rsc_0_2_i_s_din_mxwt)
    );
  peaseNTT_core_twiddle_rsc_0_3_i peaseNTT_core_twiddle_rsc_0_3_i_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_3_s_tdone(twiddle_rsc_0_3_s_tdone),
      .twiddle_rsc_0_3_tr_write_done(twiddle_rsc_0_3_tr_write_done),
      .twiddle_rsc_0_3_RREADY(twiddle_rsc_0_3_RREADY),
      .twiddle_rsc_0_3_RVALID(twiddle_rsc_0_3_RVALID),
      .twiddle_rsc_0_3_RUSER(twiddle_rsc_0_3_RUSER),
      .twiddle_rsc_0_3_RLAST(twiddle_rsc_0_3_RLAST),
      .twiddle_rsc_0_3_RRESP(twiddle_rsc_0_3_RRESP),
      .twiddle_rsc_0_3_RDATA(twiddle_rsc_0_3_RDATA),
      .twiddle_rsc_0_3_RID(twiddle_rsc_0_3_RID),
      .twiddle_rsc_0_3_ARREADY(twiddle_rsc_0_3_ARREADY),
      .twiddle_rsc_0_3_ARVALID(twiddle_rsc_0_3_ARVALID),
      .twiddle_rsc_0_3_ARUSER(twiddle_rsc_0_3_ARUSER),
      .twiddle_rsc_0_3_ARREGION(twiddle_rsc_0_3_ARREGION),
      .twiddle_rsc_0_3_ARQOS(twiddle_rsc_0_3_ARQOS),
      .twiddle_rsc_0_3_ARPROT(twiddle_rsc_0_3_ARPROT),
      .twiddle_rsc_0_3_ARCACHE(twiddle_rsc_0_3_ARCACHE),
      .twiddle_rsc_0_3_ARLOCK(twiddle_rsc_0_3_ARLOCK),
      .twiddle_rsc_0_3_ARBURST(twiddle_rsc_0_3_ARBURST),
      .twiddle_rsc_0_3_ARSIZE(twiddle_rsc_0_3_ARSIZE),
      .twiddle_rsc_0_3_ARLEN(twiddle_rsc_0_3_ARLEN),
      .twiddle_rsc_0_3_ARADDR(twiddle_rsc_0_3_ARADDR),
      .twiddle_rsc_0_3_ARID(twiddle_rsc_0_3_ARID),
      .twiddle_rsc_0_3_BREADY(twiddle_rsc_0_3_BREADY),
      .twiddle_rsc_0_3_BVALID(twiddle_rsc_0_3_BVALID),
      .twiddle_rsc_0_3_BUSER(twiddle_rsc_0_3_BUSER),
      .twiddle_rsc_0_3_BRESP(twiddle_rsc_0_3_BRESP),
      .twiddle_rsc_0_3_BID(twiddle_rsc_0_3_BID),
      .twiddle_rsc_0_3_WREADY(twiddle_rsc_0_3_WREADY),
      .twiddle_rsc_0_3_WVALID(twiddle_rsc_0_3_WVALID),
      .twiddle_rsc_0_3_WUSER(twiddle_rsc_0_3_WUSER),
      .twiddle_rsc_0_3_WLAST(twiddle_rsc_0_3_WLAST),
      .twiddle_rsc_0_3_WSTRB(twiddle_rsc_0_3_WSTRB),
      .twiddle_rsc_0_3_WDATA(twiddle_rsc_0_3_WDATA),
      .twiddle_rsc_0_3_AWREADY(twiddle_rsc_0_3_AWREADY),
      .twiddle_rsc_0_3_AWVALID(twiddle_rsc_0_3_AWVALID),
      .twiddle_rsc_0_3_AWUSER(twiddle_rsc_0_3_AWUSER),
      .twiddle_rsc_0_3_AWREGION(twiddle_rsc_0_3_AWREGION),
      .twiddle_rsc_0_3_AWQOS(twiddle_rsc_0_3_AWQOS),
      .twiddle_rsc_0_3_AWPROT(twiddle_rsc_0_3_AWPROT),
      .twiddle_rsc_0_3_AWCACHE(twiddle_rsc_0_3_AWCACHE),
      .twiddle_rsc_0_3_AWLOCK(twiddle_rsc_0_3_AWLOCK),
      .twiddle_rsc_0_3_AWBURST(twiddle_rsc_0_3_AWBURST),
      .twiddle_rsc_0_3_AWSIZE(twiddle_rsc_0_3_AWSIZE),
      .twiddle_rsc_0_3_AWLEN(twiddle_rsc_0_3_AWLEN),
      .twiddle_rsc_0_3_AWADDR(twiddle_rsc_0_3_AWADDR),
      .twiddle_rsc_0_3_AWID(twiddle_rsc_0_3_AWID),
      .core_wen(core_wen),
      .twiddle_rsc_0_3_i_oswt(reg_twiddle_rsc_0_3_i_oswt_cse),
      .twiddle_rsc_0_3_i_wen_comp(twiddle_rsc_0_3_i_wen_comp),
      .twiddle_rsc_0_3_i_s_raddr_core(nl_peaseNTT_core_twiddle_rsc_0_3_i_inst_twiddle_rsc_0_3_i_s_raddr_core[7:0]),
      .twiddle_rsc_0_3_i_s_din_mxwt(twiddle_rsc_0_3_i_s_din_mxwt)
    );
  peaseNTT_core_twiddle_h_rsc_0_0_i peaseNTT_core_twiddle_h_rsc_0_0_i_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_0_s_tdone(twiddle_h_rsc_0_0_s_tdone),
      .twiddle_h_rsc_0_0_tr_write_done(twiddle_h_rsc_0_0_tr_write_done),
      .twiddle_h_rsc_0_0_RREADY(twiddle_h_rsc_0_0_RREADY),
      .twiddle_h_rsc_0_0_RVALID(twiddle_h_rsc_0_0_RVALID),
      .twiddle_h_rsc_0_0_RUSER(twiddle_h_rsc_0_0_RUSER),
      .twiddle_h_rsc_0_0_RLAST(twiddle_h_rsc_0_0_RLAST),
      .twiddle_h_rsc_0_0_RRESP(twiddle_h_rsc_0_0_RRESP),
      .twiddle_h_rsc_0_0_RDATA(twiddle_h_rsc_0_0_RDATA),
      .twiddle_h_rsc_0_0_RID(twiddle_h_rsc_0_0_RID),
      .twiddle_h_rsc_0_0_ARREADY(twiddle_h_rsc_0_0_ARREADY),
      .twiddle_h_rsc_0_0_ARVALID(twiddle_h_rsc_0_0_ARVALID),
      .twiddle_h_rsc_0_0_ARUSER(twiddle_h_rsc_0_0_ARUSER),
      .twiddle_h_rsc_0_0_ARREGION(twiddle_h_rsc_0_0_ARREGION),
      .twiddle_h_rsc_0_0_ARQOS(twiddle_h_rsc_0_0_ARQOS),
      .twiddle_h_rsc_0_0_ARPROT(twiddle_h_rsc_0_0_ARPROT),
      .twiddle_h_rsc_0_0_ARCACHE(twiddle_h_rsc_0_0_ARCACHE),
      .twiddle_h_rsc_0_0_ARLOCK(twiddle_h_rsc_0_0_ARLOCK),
      .twiddle_h_rsc_0_0_ARBURST(twiddle_h_rsc_0_0_ARBURST),
      .twiddle_h_rsc_0_0_ARSIZE(twiddle_h_rsc_0_0_ARSIZE),
      .twiddle_h_rsc_0_0_ARLEN(twiddle_h_rsc_0_0_ARLEN),
      .twiddle_h_rsc_0_0_ARADDR(twiddle_h_rsc_0_0_ARADDR),
      .twiddle_h_rsc_0_0_ARID(twiddle_h_rsc_0_0_ARID),
      .twiddle_h_rsc_0_0_BREADY(twiddle_h_rsc_0_0_BREADY),
      .twiddle_h_rsc_0_0_BVALID(twiddle_h_rsc_0_0_BVALID),
      .twiddle_h_rsc_0_0_BUSER(twiddle_h_rsc_0_0_BUSER),
      .twiddle_h_rsc_0_0_BRESP(twiddle_h_rsc_0_0_BRESP),
      .twiddle_h_rsc_0_0_BID(twiddle_h_rsc_0_0_BID),
      .twiddle_h_rsc_0_0_WREADY(twiddle_h_rsc_0_0_WREADY),
      .twiddle_h_rsc_0_0_WVALID(twiddle_h_rsc_0_0_WVALID),
      .twiddle_h_rsc_0_0_WUSER(twiddle_h_rsc_0_0_WUSER),
      .twiddle_h_rsc_0_0_WLAST(twiddle_h_rsc_0_0_WLAST),
      .twiddle_h_rsc_0_0_WSTRB(twiddle_h_rsc_0_0_WSTRB),
      .twiddle_h_rsc_0_0_WDATA(twiddle_h_rsc_0_0_WDATA),
      .twiddle_h_rsc_0_0_AWREADY(twiddle_h_rsc_0_0_AWREADY),
      .twiddle_h_rsc_0_0_AWVALID(twiddle_h_rsc_0_0_AWVALID),
      .twiddle_h_rsc_0_0_AWUSER(twiddle_h_rsc_0_0_AWUSER),
      .twiddle_h_rsc_0_0_AWREGION(twiddle_h_rsc_0_0_AWREGION),
      .twiddle_h_rsc_0_0_AWQOS(twiddle_h_rsc_0_0_AWQOS),
      .twiddle_h_rsc_0_0_AWPROT(twiddle_h_rsc_0_0_AWPROT),
      .twiddle_h_rsc_0_0_AWCACHE(twiddle_h_rsc_0_0_AWCACHE),
      .twiddle_h_rsc_0_0_AWLOCK(twiddle_h_rsc_0_0_AWLOCK),
      .twiddle_h_rsc_0_0_AWBURST(twiddle_h_rsc_0_0_AWBURST),
      .twiddle_h_rsc_0_0_AWSIZE(twiddle_h_rsc_0_0_AWSIZE),
      .twiddle_h_rsc_0_0_AWLEN(twiddle_h_rsc_0_0_AWLEN),
      .twiddle_h_rsc_0_0_AWADDR(twiddle_h_rsc_0_0_AWADDR),
      .twiddle_h_rsc_0_0_AWID(twiddle_h_rsc_0_0_AWID),
      .core_wen(core_wen),
      .twiddle_h_rsc_0_0_i_oswt(reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse),
      .twiddle_h_rsc_0_0_i_wen_comp(twiddle_h_rsc_0_0_i_wen_comp),
      .twiddle_h_rsc_0_0_i_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsc_0_0_i_inst_twiddle_h_rsc_0_0_i_s_raddr_core[7:0]),
      .twiddle_h_rsc_0_0_i_s_din_mxwt(twiddle_h_rsc_0_0_i_s_din_mxwt)
    );
  peaseNTT_core_twiddle_h_rsc_0_1_i peaseNTT_core_twiddle_h_rsc_0_1_i_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_1_s_tdone(twiddle_h_rsc_0_1_s_tdone),
      .twiddle_h_rsc_0_1_tr_write_done(twiddle_h_rsc_0_1_tr_write_done),
      .twiddle_h_rsc_0_1_RREADY(twiddle_h_rsc_0_1_RREADY),
      .twiddle_h_rsc_0_1_RVALID(twiddle_h_rsc_0_1_RVALID),
      .twiddle_h_rsc_0_1_RUSER(twiddle_h_rsc_0_1_RUSER),
      .twiddle_h_rsc_0_1_RLAST(twiddle_h_rsc_0_1_RLAST),
      .twiddle_h_rsc_0_1_RRESP(twiddle_h_rsc_0_1_RRESP),
      .twiddle_h_rsc_0_1_RDATA(twiddle_h_rsc_0_1_RDATA),
      .twiddle_h_rsc_0_1_RID(twiddle_h_rsc_0_1_RID),
      .twiddle_h_rsc_0_1_ARREADY(twiddle_h_rsc_0_1_ARREADY),
      .twiddle_h_rsc_0_1_ARVALID(twiddle_h_rsc_0_1_ARVALID),
      .twiddle_h_rsc_0_1_ARUSER(twiddle_h_rsc_0_1_ARUSER),
      .twiddle_h_rsc_0_1_ARREGION(twiddle_h_rsc_0_1_ARREGION),
      .twiddle_h_rsc_0_1_ARQOS(twiddle_h_rsc_0_1_ARQOS),
      .twiddle_h_rsc_0_1_ARPROT(twiddle_h_rsc_0_1_ARPROT),
      .twiddle_h_rsc_0_1_ARCACHE(twiddle_h_rsc_0_1_ARCACHE),
      .twiddle_h_rsc_0_1_ARLOCK(twiddle_h_rsc_0_1_ARLOCK),
      .twiddle_h_rsc_0_1_ARBURST(twiddle_h_rsc_0_1_ARBURST),
      .twiddle_h_rsc_0_1_ARSIZE(twiddle_h_rsc_0_1_ARSIZE),
      .twiddle_h_rsc_0_1_ARLEN(twiddle_h_rsc_0_1_ARLEN),
      .twiddle_h_rsc_0_1_ARADDR(twiddle_h_rsc_0_1_ARADDR),
      .twiddle_h_rsc_0_1_ARID(twiddle_h_rsc_0_1_ARID),
      .twiddle_h_rsc_0_1_BREADY(twiddle_h_rsc_0_1_BREADY),
      .twiddle_h_rsc_0_1_BVALID(twiddle_h_rsc_0_1_BVALID),
      .twiddle_h_rsc_0_1_BUSER(twiddle_h_rsc_0_1_BUSER),
      .twiddle_h_rsc_0_1_BRESP(twiddle_h_rsc_0_1_BRESP),
      .twiddle_h_rsc_0_1_BID(twiddle_h_rsc_0_1_BID),
      .twiddle_h_rsc_0_1_WREADY(twiddle_h_rsc_0_1_WREADY),
      .twiddle_h_rsc_0_1_WVALID(twiddle_h_rsc_0_1_WVALID),
      .twiddle_h_rsc_0_1_WUSER(twiddle_h_rsc_0_1_WUSER),
      .twiddle_h_rsc_0_1_WLAST(twiddle_h_rsc_0_1_WLAST),
      .twiddle_h_rsc_0_1_WSTRB(twiddle_h_rsc_0_1_WSTRB),
      .twiddle_h_rsc_0_1_WDATA(twiddle_h_rsc_0_1_WDATA),
      .twiddle_h_rsc_0_1_AWREADY(twiddle_h_rsc_0_1_AWREADY),
      .twiddle_h_rsc_0_1_AWVALID(twiddle_h_rsc_0_1_AWVALID),
      .twiddle_h_rsc_0_1_AWUSER(twiddle_h_rsc_0_1_AWUSER),
      .twiddle_h_rsc_0_1_AWREGION(twiddle_h_rsc_0_1_AWREGION),
      .twiddle_h_rsc_0_1_AWQOS(twiddle_h_rsc_0_1_AWQOS),
      .twiddle_h_rsc_0_1_AWPROT(twiddle_h_rsc_0_1_AWPROT),
      .twiddle_h_rsc_0_1_AWCACHE(twiddle_h_rsc_0_1_AWCACHE),
      .twiddle_h_rsc_0_1_AWLOCK(twiddle_h_rsc_0_1_AWLOCK),
      .twiddle_h_rsc_0_1_AWBURST(twiddle_h_rsc_0_1_AWBURST),
      .twiddle_h_rsc_0_1_AWSIZE(twiddle_h_rsc_0_1_AWSIZE),
      .twiddle_h_rsc_0_1_AWLEN(twiddle_h_rsc_0_1_AWLEN),
      .twiddle_h_rsc_0_1_AWADDR(twiddle_h_rsc_0_1_AWADDR),
      .twiddle_h_rsc_0_1_AWID(twiddle_h_rsc_0_1_AWID),
      .core_wen(core_wen),
      .twiddle_h_rsc_0_1_i_oswt(reg_twiddle_rsc_0_1_i_oswt_cse),
      .twiddle_h_rsc_0_1_i_wen_comp(twiddle_h_rsc_0_1_i_wen_comp),
      .twiddle_h_rsc_0_1_i_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsc_0_1_i_inst_twiddle_h_rsc_0_1_i_s_raddr_core[7:0]),
      .twiddle_h_rsc_0_1_i_s_din_mxwt(twiddle_h_rsc_0_1_i_s_din_mxwt)
    );
  peaseNTT_core_twiddle_h_rsc_0_2_i peaseNTT_core_twiddle_h_rsc_0_2_i_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_2_s_tdone(twiddle_h_rsc_0_2_s_tdone),
      .twiddle_h_rsc_0_2_tr_write_done(twiddle_h_rsc_0_2_tr_write_done),
      .twiddle_h_rsc_0_2_RREADY(twiddle_h_rsc_0_2_RREADY),
      .twiddle_h_rsc_0_2_RVALID(twiddle_h_rsc_0_2_RVALID),
      .twiddle_h_rsc_0_2_RUSER(twiddle_h_rsc_0_2_RUSER),
      .twiddle_h_rsc_0_2_RLAST(twiddle_h_rsc_0_2_RLAST),
      .twiddle_h_rsc_0_2_RRESP(twiddle_h_rsc_0_2_RRESP),
      .twiddle_h_rsc_0_2_RDATA(twiddle_h_rsc_0_2_RDATA),
      .twiddle_h_rsc_0_2_RID(twiddle_h_rsc_0_2_RID),
      .twiddle_h_rsc_0_2_ARREADY(twiddle_h_rsc_0_2_ARREADY),
      .twiddle_h_rsc_0_2_ARVALID(twiddle_h_rsc_0_2_ARVALID),
      .twiddle_h_rsc_0_2_ARUSER(twiddle_h_rsc_0_2_ARUSER),
      .twiddle_h_rsc_0_2_ARREGION(twiddle_h_rsc_0_2_ARREGION),
      .twiddle_h_rsc_0_2_ARQOS(twiddle_h_rsc_0_2_ARQOS),
      .twiddle_h_rsc_0_2_ARPROT(twiddle_h_rsc_0_2_ARPROT),
      .twiddle_h_rsc_0_2_ARCACHE(twiddle_h_rsc_0_2_ARCACHE),
      .twiddle_h_rsc_0_2_ARLOCK(twiddle_h_rsc_0_2_ARLOCK),
      .twiddle_h_rsc_0_2_ARBURST(twiddle_h_rsc_0_2_ARBURST),
      .twiddle_h_rsc_0_2_ARSIZE(twiddle_h_rsc_0_2_ARSIZE),
      .twiddle_h_rsc_0_2_ARLEN(twiddle_h_rsc_0_2_ARLEN),
      .twiddle_h_rsc_0_2_ARADDR(twiddle_h_rsc_0_2_ARADDR),
      .twiddle_h_rsc_0_2_ARID(twiddle_h_rsc_0_2_ARID),
      .twiddle_h_rsc_0_2_BREADY(twiddle_h_rsc_0_2_BREADY),
      .twiddle_h_rsc_0_2_BVALID(twiddle_h_rsc_0_2_BVALID),
      .twiddle_h_rsc_0_2_BUSER(twiddle_h_rsc_0_2_BUSER),
      .twiddle_h_rsc_0_2_BRESP(twiddle_h_rsc_0_2_BRESP),
      .twiddle_h_rsc_0_2_BID(twiddle_h_rsc_0_2_BID),
      .twiddle_h_rsc_0_2_WREADY(twiddle_h_rsc_0_2_WREADY),
      .twiddle_h_rsc_0_2_WVALID(twiddle_h_rsc_0_2_WVALID),
      .twiddle_h_rsc_0_2_WUSER(twiddle_h_rsc_0_2_WUSER),
      .twiddle_h_rsc_0_2_WLAST(twiddle_h_rsc_0_2_WLAST),
      .twiddle_h_rsc_0_2_WSTRB(twiddle_h_rsc_0_2_WSTRB),
      .twiddle_h_rsc_0_2_WDATA(twiddle_h_rsc_0_2_WDATA),
      .twiddle_h_rsc_0_2_AWREADY(twiddle_h_rsc_0_2_AWREADY),
      .twiddle_h_rsc_0_2_AWVALID(twiddle_h_rsc_0_2_AWVALID),
      .twiddle_h_rsc_0_2_AWUSER(twiddle_h_rsc_0_2_AWUSER),
      .twiddle_h_rsc_0_2_AWREGION(twiddle_h_rsc_0_2_AWREGION),
      .twiddle_h_rsc_0_2_AWQOS(twiddle_h_rsc_0_2_AWQOS),
      .twiddle_h_rsc_0_2_AWPROT(twiddle_h_rsc_0_2_AWPROT),
      .twiddle_h_rsc_0_2_AWCACHE(twiddle_h_rsc_0_2_AWCACHE),
      .twiddle_h_rsc_0_2_AWLOCK(twiddle_h_rsc_0_2_AWLOCK),
      .twiddle_h_rsc_0_2_AWBURST(twiddle_h_rsc_0_2_AWBURST),
      .twiddle_h_rsc_0_2_AWSIZE(twiddle_h_rsc_0_2_AWSIZE),
      .twiddle_h_rsc_0_2_AWLEN(twiddle_h_rsc_0_2_AWLEN),
      .twiddle_h_rsc_0_2_AWADDR(twiddle_h_rsc_0_2_AWADDR),
      .twiddle_h_rsc_0_2_AWID(twiddle_h_rsc_0_2_AWID),
      .core_wen(core_wen),
      .twiddle_h_rsc_0_2_i_oswt(reg_twiddle_rsc_0_2_i_oswt_cse),
      .twiddle_h_rsc_0_2_i_wen_comp(twiddle_h_rsc_0_2_i_wen_comp),
      .twiddle_h_rsc_0_2_i_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsc_0_2_i_inst_twiddle_h_rsc_0_2_i_s_raddr_core[7:0]),
      .twiddle_h_rsc_0_2_i_s_din_mxwt(twiddle_h_rsc_0_2_i_s_din_mxwt)
    );
  peaseNTT_core_twiddle_h_rsc_0_3_i peaseNTT_core_twiddle_h_rsc_0_3_i_inst (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_3_s_tdone(twiddle_h_rsc_0_3_s_tdone),
      .twiddle_h_rsc_0_3_tr_write_done(twiddle_h_rsc_0_3_tr_write_done),
      .twiddle_h_rsc_0_3_RREADY(twiddle_h_rsc_0_3_RREADY),
      .twiddle_h_rsc_0_3_RVALID(twiddle_h_rsc_0_3_RVALID),
      .twiddle_h_rsc_0_3_RUSER(twiddle_h_rsc_0_3_RUSER),
      .twiddle_h_rsc_0_3_RLAST(twiddle_h_rsc_0_3_RLAST),
      .twiddle_h_rsc_0_3_RRESP(twiddle_h_rsc_0_3_RRESP),
      .twiddle_h_rsc_0_3_RDATA(twiddle_h_rsc_0_3_RDATA),
      .twiddle_h_rsc_0_3_RID(twiddle_h_rsc_0_3_RID),
      .twiddle_h_rsc_0_3_ARREADY(twiddle_h_rsc_0_3_ARREADY),
      .twiddle_h_rsc_0_3_ARVALID(twiddle_h_rsc_0_3_ARVALID),
      .twiddle_h_rsc_0_3_ARUSER(twiddle_h_rsc_0_3_ARUSER),
      .twiddle_h_rsc_0_3_ARREGION(twiddle_h_rsc_0_3_ARREGION),
      .twiddle_h_rsc_0_3_ARQOS(twiddle_h_rsc_0_3_ARQOS),
      .twiddle_h_rsc_0_3_ARPROT(twiddle_h_rsc_0_3_ARPROT),
      .twiddle_h_rsc_0_3_ARCACHE(twiddle_h_rsc_0_3_ARCACHE),
      .twiddle_h_rsc_0_3_ARLOCK(twiddle_h_rsc_0_3_ARLOCK),
      .twiddle_h_rsc_0_3_ARBURST(twiddle_h_rsc_0_3_ARBURST),
      .twiddle_h_rsc_0_3_ARSIZE(twiddle_h_rsc_0_3_ARSIZE),
      .twiddle_h_rsc_0_3_ARLEN(twiddle_h_rsc_0_3_ARLEN),
      .twiddle_h_rsc_0_3_ARADDR(twiddle_h_rsc_0_3_ARADDR),
      .twiddle_h_rsc_0_3_ARID(twiddle_h_rsc_0_3_ARID),
      .twiddle_h_rsc_0_3_BREADY(twiddle_h_rsc_0_3_BREADY),
      .twiddle_h_rsc_0_3_BVALID(twiddle_h_rsc_0_3_BVALID),
      .twiddle_h_rsc_0_3_BUSER(twiddle_h_rsc_0_3_BUSER),
      .twiddle_h_rsc_0_3_BRESP(twiddle_h_rsc_0_3_BRESP),
      .twiddle_h_rsc_0_3_BID(twiddle_h_rsc_0_3_BID),
      .twiddle_h_rsc_0_3_WREADY(twiddle_h_rsc_0_3_WREADY),
      .twiddle_h_rsc_0_3_WVALID(twiddle_h_rsc_0_3_WVALID),
      .twiddle_h_rsc_0_3_WUSER(twiddle_h_rsc_0_3_WUSER),
      .twiddle_h_rsc_0_3_WLAST(twiddle_h_rsc_0_3_WLAST),
      .twiddle_h_rsc_0_3_WSTRB(twiddle_h_rsc_0_3_WSTRB),
      .twiddle_h_rsc_0_3_WDATA(twiddle_h_rsc_0_3_WDATA),
      .twiddle_h_rsc_0_3_AWREADY(twiddle_h_rsc_0_3_AWREADY),
      .twiddle_h_rsc_0_3_AWVALID(twiddle_h_rsc_0_3_AWVALID),
      .twiddle_h_rsc_0_3_AWUSER(twiddle_h_rsc_0_3_AWUSER),
      .twiddle_h_rsc_0_3_AWREGION(twiddle_h_rsc_0_3_AWREGION),
      .twiddle_h_rsc_0_3_AWQOS(twiddle_h_rsc_0_3_AWQOS),
      .twiddle_h_rsc_0_3_AWPROT(twiddle_h_rsc_0_3_AWPROT),
      .twiddle_h_rsc_0_3_AWCACHE(twiddle_h_rsc_0_3_AWCACHE),
      .twiddle_h_rsc_0_3_AWLOCK(twiddle_h_rsc_0_3_AWLOCK),
      .twiddle_h_rsc_0_3_AWBURST(twiddle_h_rsc_0_3_AWBURST),
      .twiddle_h_rsc_0_3_AWSIZE(twiddle_h_rsc_0_3_AWSIZE),
      .twiddle_h_rsc_0_3_AWLEN(twiddle_h_rsc_0_3_AWLEN),
      .twiddle_h_rsc_0_3_AWADDR(twiddle_h_rsc_0_3_AWADDR),
      .twiddle_h_rsc_0_3_AWID(twiddle_h_rsc_0_3_AWID),
      .core_wen(core_wen),
      .twiddle_h_rsc_0_3_i_oswt(reg_twiddle_rsc_0_3_i_oswt_cse),
      .twiddle_h_rsc_0_3_i_wen_comp(twiddle_h_rsc_0_3_i_wen_comp),
      .twiddle_h_rsc_0_3_i_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsc_0_3_i_inst_twiddle_h_rsc_0_3_i_s_raddr_core[7:0]),
      .twiddle_h_rsc_0_3_i_s_din_mxwt(twiddle_h_rsc_0_3_i_s_din_mxwt)
    );
  peaseNTT_core_xt_rsc_triosy_0_7_obj peaseNTT_core_xt_rsc_triosy_0_7_obj_inst (
      .xt_rsc_triosy_0_7_lz(xt_rsc_triosy_0_7_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_0_7_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_xt_rsc_triosy_0_6_obj peaseNTT_core_xt_rsc_triosy_0_6_obj_inst (
      .xt_rsc_triosy_0_6_lz(xt_rsc_triosy_0_6_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_0_6_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_xt_rsc_triosy_0_5_obj peaseNTT_core_xt_rsc_triosy_0_5_obj_inst (
      .xt_rsc_triosy_0_5_lz(xt_rsc_triosy_0_5_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_0_5_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_xt_rsc_triosy_0_4_obj peaseNTT_core_xt_rsc_triosy_0_4_obj_inst (
      .xt_rsc_triosy_0_4_lz(xt_rsc_triosy_0_4_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_0_4_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_xt_rsc_triosy_0_3_obj peaseNTT_core_xt_rsc_triosy_0_3_obj_inst (
      .xt_rsc_triosy_0_3_lz(xt_rsc_triosy_0_3_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_0_3_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_xt_rsc_triosy_0_2_obj peaseNTT_core_xt_rsc_triosy_0_2_obj_inst (
      .xt_rsc_triosy_0_2_lz(xt_rsc_triosy_0_2_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_0_2_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_xt_rsc_triosy_0_1_obj peaseNTT_core_xt_rsc_triosy_0_1_obj_inst (
      .xt_rsc_triosy_0_1_lz(xt_rsc_triosy_0_1_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_0_1_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_xt_rsc_triosy_0_0_obj peaseNTT_core_xt_rsc_triosy_0_0_obj_inst (
      .xt_rsc_triosy_0_0_lz(xt_rsc_triosy_0_0_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_0_0_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_p_rsc_triosy_obj peaseNTT_core_p_rsc_triosy_obj_inst (
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_r_rsc_triosy_obj peaseNTT_core_r_rsc_triosy_obj_inst (
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_rsc_triosy_0_3_obj peaseNTT_core_twiddle_rsc_triosy_0_3_obj_inst
      (
      .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_3_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_rsc_triosy_0_2_obj peaseNTT_core_twiddle_rsc_triosy_0_2_obj_inst
      (
      .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_2_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_rsc_triosy_0_1_obj peaseNTT_core_twiddle_rsc_triosy_0_1_obj_inst
      (
      .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_1_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_rsc_triosy_0_0_obj peaseNTT_core_twiddle_rsc_triosy_0_0_obj_inst
      (
      .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_0_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_0_3_obj peaseNTT_core_twiddle_h_rsc_triosy_0_3_obj_inst
      (
      .twiddle_h_rsc_triosy_0_3_lz(twiddle_h_rsc_triosy_0_3_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_3_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_0_2_obj peaseNTT_core_twiddle_h_rsc_triosy_0_2_obj_inst
      (
      .twiddle_h_rsc_triosy_0_2_lz(twiddle_h_rsc_triosy_0_2_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_2_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_0_1_obj peaseNTT_core_twiddle_h_rsc_triosy_0_1_obj_inst
      (
      .twiddle_h_rsc_triosy_0_1_lz(twiddle_h_rsc_triosy_0_1_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_1_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_0_0_obj peaseNTT_core_twiddle_h_rsc_triosy_0_0_obj_inst
      (
      .twiddle_h_rsc_triosy_0_0_lz(twiddle_h_rsc_triosy_0_0_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_0_obj_iswt0(reg_xt_rsc_triosy_0_7_obj_iswt0_cse)
    );
  peaseNTT_core_staller peaseNTT_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsc_0_0_i_wen_comp(twiddle_rsc_0_0_i_wen_comp),
      .twiddle_rsc_0_1_i_wen_comp(twiddle_rsc_0_1_i_wen_comp),
      .twiddle_rsc_0_2_i_wen_comp(twiddle_rsc_0_2_i_wen_comp),
      .twiddle_rsc_0_3_i_wen_comp(twiddle_rsc_0_3_i_wen_comp),
      .twiddle_h_rsc_0_0_i_wen_comp(twiddle_h_rsc_0_0_i_wen_comp),
      .twiddle_h_rsc_0_1_i_wen_comp(twiddle_h_rsc_0_1_i_wen_comp),
      .twiddle_h_rsc_0_2_i_wen_comp(twiddle_h_rsc_0_2_i_wen_comp),
      .twiddle_h_rsc_0_3_i_wen_comp(twiddle_h_rsc_0_3_i_wen_comp)
    );
  peaseNTT_core_core_fsm peaseNTT_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output),
      .STAGE_LOOP_C_0_tr0(nl_peaseNTT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0[0:0]),
      .INNER_LOOP_C_0_tr0(INNER_LOOP_nor_tmp),
      .cpyVec_for_C_0_tr0(nl_peaseNTT_core_core_fsm_inst_cpyVec_for_C_0_tr0[0:0])
    );
  assign or_25_rmff = and_61_cse | and_63_cse;
  assign or_60_rmff = and_61_cse | and_134_cse;
  assign or_94_rmff = and_201_cse | and_63_cse;
  assign or_128_rmff = and_201_cse | and_134_cse;
  assign or_161_rmff = and_337_cse | INNER_LOOP_INNER_LOOP_and_12_cse;
  assign and_449_rmff = (reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse
      | INNER_LOOP_stage_0_3 | INNER_LOOP_stage_0_4) & (fsm_output[2]);
  assign mult_3_t_and_cse = (operator_33_true_return_8_0_sva[1:0]==2'b00) & (fsm_output[2]);
  assign mult_3_t_and_1_cse = (operator_33_true_return_8_0_sva[1:0]==2'b01) & (fsm_output[2]);
  assign mult_3_t_and_2_cse = (operator_33_true_return_8_0_sva[1:0]==2'b10) & (fsm_output[2]);
  assign mult_3_t_and_3_cse = (operator_33_true_return_8_0_sva[1:0]==2'b11) & (fsm_output[2]);
  assign and_515_rmff = (INNER_LOOP_stage_0_5 | INNER_LOOP_stage_0_6 | INNER_LOOP_stage_0_7)
      & (fsm_output[2]);
  assign butterFly_and_cse = core_wen & INNER_LOOP_stage_0_10;
  assign mult_3_if_and_cse = core_wen & INNER_LOOP_stage_0_9;
  assign INNER_LOOP_nand_cse = ~(INNER_LOOP_stage_0 & (~ (z_out_1[7])));
  assign INNER_LOOP_INNER_LOOP_and_12_cse = INNER_LOOP_stage_0 & (fsm_output[2]);
  assign mult_3_z_and_cse = core_wen & INNER_LOOP_stage_0_8;
  assign mult_3_z_and_4_cse = core_wen & INNER_LOOP_stage_0_7;
  assign mult_3_z_and_5_cse = core_wen & INNER_LOOP_stage_0_6;
  assign mult_3_z_and_6_cse = core_wen & INNER_LOOP_stage_0_5;
  assign INNER_LOOP_r_and_19_cse = core_wen & INNER_LOOP_stage_0_4;
  assign INNER_LOOP_r_and_22_cse = core_wen & INNER_LOOP_stage_0_3;
  assign INNER_LOOP_r_and_25_cse = core_wen & reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse;
  assign cpyVec_for_cpyVec_for_and_cse = cpyVec_for_stage_0 & (~ (z_out_1[7]));
  assign nl_mult_res_sva_2 = mult_z_asn_itm_4 - mult_z_asn_itm_1_1;
  assign mult_res_sva_2 = nl_mult_res_sva_2[31:0];
  assign nl_mult_1_res_sva_2 = mult_1_z_asn_itm_4 - mult_1_z_asn_itm_1_1;
  assign mult_1_res_sva_2 = nl_mult_1_res_sva_2[31:0];
  assign nl_mult_2_res_sva_2 = mult_2_z_asn_itm_4 - mult_2_z_asn_itm_1_1;
  assign mult_2_res_sva_2 = nl_mult_2_res_sva_2[31:0];
  assign nl_mult_3_res_sva_2 = mult_3_z_asn_itm_4 - mult_3_z_asn_itm_1_1;
  assign mult_3_res_sva_2 = nl_mult_3_res_sva_2[31:0];
  assign nl_mult_3_if_acc_nl = mult_3_res_sva_1 - p_sva;
  assign mult_3_if_acc_nl = nl_mult_3_if_acc_nl[31:0];
  assign mult_3_res_lpi_3_dfm_mx0 = MUX_v_32_2_2(mult_3_if_acc_nl, mult_3_res_sva_1,
      mult_3_slc_32_svs_st_1);
  assign nl_mult_2_if_acc_nl = mult_2_res_sva_1 - p_sva;
  assign mult_2_if_acc_nl = nl_mult_2_if_acc_nl[31:0];
  assign mult_2_res_lpi_3_dfm_mx0 = MUX_v_32_2_2(mult_2_if_acc_nl, mult_2_res_sva_1,
      mult_2_slc_32_svs_st_1);
  assign nl_mult_1_if_acc_nl = mult_1_res_sva_1 - p_sva;
  assign mult_1_if_acc_nl = nl_mult_1_if_acc_nl[31:0];
  assign mult_1_res_lpi_3_dfm_mx0 = MUX_v_32_2_2(mult_1_if_acc_nl, mult_1_res_sva_1,
      mult_1_slc_32_svs_st_1);
  assign nl_mult_if_acc_nl = mult_res_sva_1 - p_sva;
  assign mult_if_acc_nl = nl_mult_if_acc_nl[31:0];
  assign mult_res_lpi_3_dfm_mx0 = MUX_v_32_2_2(mult_if_acc_nl, mult_res_sva_1, mult_slc_32_svs_st_1);
  assign INNER_LOOP_nor_tmp = ~(INNER_LOOP_stage_0 | reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse
      | INNER_LOOP_stage_0_3 | INNER_LOOP_stage_0_4 | INNER_LOOP_stage_0_5 | INNER_LOOP_stage_0_6
      | INNER_LOOP_stage_0_7 | INNER_LOOP_stage_0_8 | INNER_LOOP_stage_0_9 | INNER_LOOP_stage_0_10
      | INNER_LOOP_stage_0_11);
  assign and_dcpl_35 = cpyVec_for_stage_0 & (~ (cpyVec_for_i_10_3_sva_6_0[6]));
  assign and_dcpl_37 = INNER_LOOP_stage_0_11 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_10);
  assign and_dcpl_39 = INNER_LOOP_stage_0_11 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_10;
  assign and_dcpl_41 = cpyVec_for_stage_0 & (cpyVec_for_i_10_3_sva_6_0[6]);
  assign and_dcpl_43 = INNER_LOOP_stage_0 & (operator_33_true_return_8_0_sva[1]);
  assign and_61_cse = (and_dcpl_35 | ((~ INNER_LOOP_stage_0_11) & cpyVec_for_stage_0_2))
      & (fsm_output[3]);
  assign and_63_cse = (and_dcpl_37 | ((~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_11)
      & INNER_LOOP_stage_0_12)) & (fsm_output[2]);
  assign and_134_cse = (and_dcpl_39 | (INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_11
      & INNER_LOOP_stage_0_12)) & (fsm_output[2]);
  assign and_201_cse = (and_dcpl_41 | (INNER_LOOP_stage_0_11 & cpyVec_for_stage_0_2))
      & (fsm_output[3]);
  assign and_337_cse = cpyVec_for_stage_0_2 & (fsm_output[3]);
  assign or_tmp_215 = (~ (operator_33_true_return_8_0_sva[1])) & (fsm_output[2]);
  assign or_tmp_222 = (~ (operator_33_true_return_8_0_sva[0])) & (fsm_output[2]);
  assign nl_modulo_add_qif_acc_nl = modulo_add_base_sva_1 - p_sva;
  assign modulo_add_qif_acc_nl = nl_modulo_add_qif_acc_nl[31:0];
  assign nl_modulo_add_acc_1_nl = ({1'b1 , p_sva}) + conv_u2u_32_33(~ modulo_add_base_sva_1)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_acc_1_nl = nl_modulo_add_acc_1_nl[32:0];
  assign yt_rsc_0_0_i_d_d_pff = MUX_v_32_2_2(modulo_add_base_sva_1, modulo_add_qif_acc_nl,
      readslicef_33_1_32(modulo_add_acc_1_nl));
  assign yt_rsc_0_0_i_radr_d_pff = cpyVec_for_i_10_3_sva_6_0[5:0];
  assign yt_rsc_0_0_i_wadr_d_pff = INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_29_itm_10;
  assign yt_rsc_0_0_i_we_d_pff = and_dcpl_37 & (fsm_output[2]);
  assign yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff = and_dcpl_35 & (fsm_output[3]);
  assign nl_modulo_add_1_qif_acc_nl = modulo_add_base_1_sva_1 - p_sva;
  assign modulo_add_1_qif_acc_nl = nl_modulo_add_1_qif_acc_nl[31:0];
  assign nl_modulo_add_1_acc_1_nl = ({1'b1 , p_sva}) + conv_u2u_32_33(~ modulo_add_base_1_sva_1)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_1_acc_1_nl = nl_modulo_add_1_acc_1_nl[32:0];
  assign yt_rsc_0_1_i_d_d_pff = MUX_v_32_2_2(modulo_add_base_1_sva_1, modulo_add_1_qif_acc_nl,
      readslicef_33_1_32(modulo_add_1_acc_1_nl));
  assign nl_modulo_add_2_qif_acc_nl = modulo_add_base_2_sva_1 - p_sva;
  assign modulo_add_2_qif_acc_nl = nl_modulo_add_2_qif_acc_nl[31:0];
  assign nl_modulo_add_2_acc_1_nl = ({1'b1 , p_sva}) + conv_u2u_32_33(~ modulo_add_base_2_sva_1)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_2_acc_1_nl = nl_modulo_add_2_acc_1_nl[32:0];
  assign yt_rsc_0_2_i_d_d_pff = MUX_v_32_2_2(modulo_add_base_2_sva_1, modulo_add_2_qif_acc_nl,
      readslicef_33_1_32(modulo_add_2_acc_1_nl));
  assign nl_modulo_add_3_qif_acc_nl = modulo_add_base_3_sva_1 - p_sva;
  assign modulo_add_3_qif_acc_nl = nl_modulo_add_3_qif_acc_nl[31:0];
  assign nl_modulo_add_3_acc_1_nl = ({1'b1 , p_sva}) + conv_u2u_32_33(~ modulo_add_base_3_sva_1)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_3_acc_1_nl = nl_modulo_add_3_acc_1_nl[32:0];
  assign yt_rsc_0_3_i_d_d_pff = MUX_v_32_2_2(modulo_add_base_3_sva_1, modulo_add_3_qif_acc_nl,
      readslicef_33_1_32(modulo_add_3_acc_1_nl));
  assign yt_rsc_0_4_i_wadr_d_pff = INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_33_itm_10;
  assign yt_rsc_0_4_i_we_d_pff = and_dcpl_39 & (fsm_output[2]);
  assign nl_modulo_sub_qif_acc_nl = ({1'b1 , (modulo_sub_base_sva_1[30:0])}) + p_sva;
  assign modulo_sub_qif_acc_nl = nl_modulo_sub_qif_acc_nl[31:0];
  assign yt_rsc_1_0_i_d_d_pff = MUX_v_32_2_2(({1'b0 , (modulo_sub_base_sva_1[30:0])}),
      modulo_sub_qif_acc_nl, modulo_sub_base_sva_1[31]);
  assign yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff = and_dcpl_41 & (fsm_output[3]);
  assign nl_modulo_sub_1_qif_acc_nl = ({1'b1 , (modulo_sub_base_1_sva_1[30:0])})
      + p_sva;
  assign modulo_sub_1_qif_acc_nl = nl_modulo_sub_1_qif_acc_nl[31:0];
  assign yt_rsc_1_1_i_d_d_pff = MUX_v_32_2_2(({1'b0 , (modulo_sub_base_1_sva_1[30:0])}),
      modulo_sub_1_qif_acc_nl, modulo_sub_base_1_sva_1[31]);
  assign nl_modulo_sub_2_qif_acc_nl = ({1'b1 , (modulo_sub_base_2_sva_1[30:0])})
      + p_sva;
  assign modulo_sub_2_qif_acc_nl = nl_modulo_sub_2_qif_acc_nl[31:0];
  assign yt_rsc_1_2_i_d_d_pff = MUX_v_32_2_2(({1'b0 , (modulo_sub_base_2_sva_1[30:0])}),
      modulo_sub_2_qif_acc_nl, modulo_sub_base_2_sva_1[31]);
  assign nl_modulo_sub_3_qif_acc_nl = ({1'b1 , (modulo_sub_base_3_sva_1[30:0])})
      + p_sva;
  assign modulo_sub_3_qif_acc_nl = nl_modulo_sub_3_qif_acc_nl[31:0];
  assign yt_rsc_1_3_i_d_d_pff = MUX_v_32_2_2(({1'b0 , (modulo_sub_base_3_sva_1[30:0])}),
      modulo_sub_3_qif_acc_nl, modulo_sub_base_3_sva_1[31]);
  assign xt_rsc_0_0_i_wea_d = xt_rsc_0_0_i_wea_d_reg;
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign xt_rsc_0_1_i_wea_d = xt_rsc_0_1_i_wea_d_reg;
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign xt_rsc_0_2_i_wea_d = xt_rsc_0_2_i_wea_d_reg;
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign xt_rsc_0_3_i_wea_d = xt_rsc_0_3_i_wea_d_reg;
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign xt_rsc_0_4_i_wea_d = xt_rsc_0_4_i_wea_d_reg;
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign xt_rsc_0_5_i_wea_d = xt_rsc_0_5_i_wea_d_reg;
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign xt_rsc_0_6_i_wea_d = xt_rsc_0_6_i_wea_d_reg;
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign xt_rsc_0_7_i_wea_d = xt_rsc_0_7_i_wea_d_reg;
  assign xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d = xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d = xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign xt_rsc_0_0_i_adra_d = xt_rsc_0_0_i_adra_d_reg;
  assign xt_rsc_0_0_i_da_d = xt_rsc_0_0_i_da_d_reg;
  assign xt_rsc_0_1_i_adra_d = xt_rsc_0_1_i_adra_d_reg;
  assign xt_rsc_0_1_i_da_d = xt_rsc_0_1_i_da_d_reg;
  assign xt_rsc_0_2_i_adra_d = xt_rsc_0_2_i_adra_d_reg;
  assign xt_rsc_0_2_i_da_d = xt_rsc_0_2_i_da_d_reg;
  assign xt_rsc_0_3_i_adra_d = xt_rsc_0_3_i_adra_d_reg;
  assign xt_rsc_0_3_i_da_d = xt_rsc_0_3_i_da_d_reg;
  assign xt_rsc_0_4_i_adra_d = xt_rsc_0_4_i_adra_d_reg;
  assign xt_rsc_0_4_i_da_d = xt_rsc_0_4_i_da_d_reg;
  assign xt_rsc_0_5_i_adra_d = xt_rsc_0_5_i_adra_d_reg;
  assign xt_rsc_0_5_i_da_d = xt_rsc_0_5_i_da_d_reg;
  assign xt_rsc_0_6_i_adra_d = xt_rsc_0_6_i_adra_d_reg;
  assign xt_rsc_0_6_i_da_d = xt_rsc_0_6_i_da_d_reg;
  assign xt_rsc_0_7_i_adra_d = xt_rsc_0_7_i_adra_d_reg;
  assign xt_rsc_0_7_i_da_d = xt_rsc_0_7_i_da_d_reg;
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[5]) | (fsm_output[0]) | (fsm_output[4])) ) begin
      STAGE_LOOP_c_3_0_sva <= MUX_v_4_2_2(4'b1010, (z_out[3:0]), fsm_output[4]);
    end
  end
  always @(posedge clk) begin
    if ( core_wen ) begin
      reg_twiddle_rsc_0_0_i_s_raddr_core_6_0_cse <= (operator_33_true_return_8_0_sva[8:2])
          & INNER_LOOP_r_9_2_sva_6_0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_yt_rsc_0_0_cgo_cse <= 1'b0;
      reg_yt_rsc_0_4_cgo_cse <= 1'b0;
      reg_yt_rsc_1_0_cgo_cse <= 1'b0;
      reg_yt_rsc_1_4_cgo_cse <= 1'b0;
      reg_xt_rsc_0_0_i_oswt_cse <= 1'b0;
      reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse <= 1'b0;
      reg_twiddle_rsc_0_1_i_oswt_cse <= 1'b0;
      reg_twiddle_rsc_0_2_i_oswt_cse <= 1'b0;
      reg_twiddle_rsc_0_3_i_oswt_cse <= 1'b0;
      reg_xt_rsc_triosy_0_7_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_ensig_cgo_5_cse <= 1'b0;
      INNER_LOOP_stage_0 <= 1'b0;
      INNER_LOOP_r_9_2_sva_6_0 <= 7'b0000000;
      INNER_LOOP_stage_0_3 <= 1'b0;
      INNER_LOOP_stage_0_4 <= 1'b0;
      INNER_LOOP_stage_0_5 <= 1'b0;
      INNER_LOOP_stage_0_6 <= 1'b0;
      INNER_LOOP_stage_0_7 <= 1'b0;
      INNER_LOOP_stage_0_8 <= 1'b0;
      INNER_LOOP_stage_0_9 <= 1'b0;
      INNER_LOOP_stage_0_10 <= 1'b0;
      INNER_LOOP_stage_0_11 <= 1'b0;
      INNER_LOOP_stage_0_12 <= 1'b0;
      cpyVec_for_stage_0 <= 1'b0;
      cpyVec_for_i_10_3_sva_6_0 <= 7'b0000000;
      cpyVec_for_stage_0_2 <= 1'b0;
    end
    else if ( core_wen ) begin
      reg_yt_rsc_0_0_cgo_cse <= or_25_rmff;
      reg_yt_rsc_0_4_cgo_cse <= or_60_rmff;
      reg_yt_rsc_1_0_cgo_cse <= or_94_rmff;
      reg_yt_rsc_1_4_cgo_cse <= or_128_rmff;
      reg_xt_rsc_0_0_i_oswt_cse <= or_161_rmff;
      reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse <= INNER_LOOP_INNER_LOOP_and_12_cse;
      reg_twiddle_rsc_0_1_i_oswt_cse <= INNER_LOOP_stage_0 & (operator_33_true_return_8_0_sva[0])
          & (fsm_output[2]);
      reg_twiddle_rsc_0_2_i_oswt_cse <= and_dcpl_43 & (fsm_output[2]);
      reg_twiddle_rsc_0_3_i_oswt_cse <= and_dcpl_43 & (operator_33_true_return_8_0_sva[0])
          & (fsm_output[2]);
      reg_xt_rsc_triosy_0_7_obj_iswt0_cse <= (z_out[4]) & (fsm_output[1]);
      reg_ensig_cgo_cse <= and_449_rmff;
      reg_ensig_cgo_5_cse <= and_515_rmff;
      INNER_LOOP_stage_0 <= ~(INNER_LOOP_nand_cse & (fsm_output[2]));
      INNER_LOOP_r_9_2_sva_6_0 <= MUX_v_7_2_2(7'b0000000, INNER_LOOP_r_mux_nl, not_163_nl);
      INNER_LOOP_stage_0_3 <= reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse
          & (fsm_output[2]);
      INNER_LOOP_stage_0_4 <= INNER_LOOP_stage_0_3 & (fsm_output[2]);
      INNER_LOOP_stage_0_5 <= INNER_LOOP_stage_0_4 & (fsm_output[2]);
      INNER_LOOP_stage_0_6 <= INNER_LOOP_stage_0_5 & (fsm_output[2]);
      INNER_LOOP_stage_0_7 <= INNER_LOOP_stage_0_6 & (fsm_output[2]);
      INNER_LOOP_stage_0_8 <= INNER_LOOP_stage_0_7 & (fsm_output[2]);
      INNER_LOOP_stage_0_9 <= INNER_LOOP_stage_0_8 & (fsm_output[2]);
      INNER_LOOP_stage_0_10 <= INNER_LOOP_mux_14_nl & (~ (fsm_output[1]));
      INNER_LOOP_stage_0_11 <= INNER_LOOP_mux_13_nl & (~ (fsm_output[1]));
      INNER_LOOP_stage_0_12 <= INNER_LOOP_stage_0_11 & (fsm_output[2]);
      cpyVec_for_stage_0 <= cpyVec_for_cpyVec_for_and_cse | (~ (fsm_output[3]));
      cpyVec_for_i_10_3_sva_6_0 <= MUX_v_7_2_2(7'b0000000, (z_out_1[6:0]), (fsm_output[3]));
      cpyVec_for_stage_0_2 <= cpyVec_for_stage_0 & (fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[5]) | (fsm_output[0])) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_11 <= 1'b0;
    end
    else if ( core_wen & INNER_LOOP_stage_0_11 ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_11 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_10;
    end
  end
  always @(posedge clk) begin
    if ( butterFly_and_cse ) begin
      modulo_add_base_sva_1 <= nl_modulo_add_base_sva_1[31:0];
      modulo_add_base_1_sva_1 <= nl_modulo_add_base_1_sva_1[31:0];
      modulo_add_base_2_sva_1 <= nl_modulo_add_base_2_sva_1[31:0];
      modulo_add_base_3_sva_1 <= nl_modulo_add_base_3_sva_1[31:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modulo_sub_base_sva_1 <= 32'b00000000000000000000000000000000;
      modulo_sub_base_1_sva_1 <= 32'b00000000000000000000000000000000;
      modulo_sub_base_2_sva_1 <= 32'b00000000000000000000000000000000;
      modulo_sub_base_3_sva_1 <= 32'b00000000000000000000000000000000;
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_10 <= 1'b0;
    end
    else if ( butterFly_and_cse ) begin
      modulo_sub_base_sva_1 <= nl_modulo_sub_base_sva_1[31:0];
      modulo_sub_base_1_sva_1 <= nl_modulo_sub_base_1_sva_1[31:0];
      modulo_sub_base_2_sva_1 <= nl_modulo_sub_base_2_sva_1[31:0];
      modulo_sub_base_3_sva_1 <= nl_modulo_sub_base_3_sva_1[31:0];
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_10 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_9;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_10 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_9)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_29_itm_10 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_9;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_10 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_9
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_33_itm_10 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_9;
    end
  end
  always @(posedge clk) begin
    if ( mult_3_if_and_cse ) begin
      mult_res_sva_1 <= mult_res_sva_2;
      mult_1_res_sva_1 <= mult_1_res_sva_2;
      mult_2_res_sva_1 <= mult_2_res_sva_2;
      mult_3_res_sva_1 <= mult_3_res_sva_2;
      tmp_14_sva_8 <= tmp_14_sva_7;
      tmp_12_sva_8 <= tmp_12_sva_7;
      tmp_10_sva_8 <= tmp_10_sva_7;
      tmp_8_sva_8 <= tmp_8_sva_7;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      mult_3_slc_32_svs_st_1 <= 1'b0;
      mult_2_slc_32_svs_st_1 <= 1'b0;
      mult_1_slc_32_svs_st_1 <= 1'b0;
      mult_slc_32_svs_st_1 <= 1'b0;
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_9 <= 1'b0;
    end
    else if ( mult_3_if_and_cse ) begin
      mult_3_slc_32_svs_st_1 <= readslicef_33_1_32(mult_3_if_acc_1_nl);
      mult_2_slc_32_svs_st_1 <= readslicef_33_1_32(mult_2_if_acc_1_nl);
      mult_1_slc_32_svs_st_1 <= readslicef_33_1_32(mult_1_if_acc_1_nl);
      mult_slc_32_svs_st_1 <= readslicef_33_1_32(mult_if_acc_1_nl);
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_9 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_8;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      operator_33_true_return_8_0_sva <= 9'b000000000;
    end
    else if ( core_wen & (~ (fsm_output[2])) ) begin
      operator_33_true_return_8_0_sva <= operator_33_true_lshift_itm;
    end
  end
  always @(posedge clk) begin
    if ( mult_3_z_and_cse ) begin
      mult_3_z_asn_itm_4 <= mult_3_z_asn_itm_3;
      mult_3_z_asn_itm_1_1 <= mult_z_mul_cmp_1_z;
      mult_2_z_asn_itm_4 <= mult_2_z_asn_itm_3;
      mult_2_z_asn_itm_1_1 <= mult_z_mul_cmp_3_z;
      mult_1_z_asn_itm_4 <= mult_1_z_asn_itm_3;
      mult_1_z_asn_itm_1_1 <= mult_z_mul_cmp_5_z;
      mult_z_asn_itm_4 <= mult_z_asn_itm_3;
      mult_z_asn_itm_1_1 <= mult_z_mul_cmp_7_z;
      tmp_14_sva_7 <= tmp_14_sva_6;
      tmp_12_sva_7 <= tmp_12_sva_6;
      tmp_10_sva_7 <= tmp_10_sva_6;
      tmp_8_sva_7 <= tmp_8_sva_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_8 <= 1'b0;
    end
    else if ( mult_3_z_and_cse ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_8 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_7;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_9 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_8
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_9 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_8;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_9 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_8)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_9 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_8;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_8 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_7
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_8 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_7;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_8 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_7)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_8 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_7;
    end
  end
  always @(posedge clk) begin
    if ( mult_3_z_and_4_cse ) begin
      mult_3_z_asn_itm_3 <= mult_3_z_asn_itm_2;
      mult_2_z_asn_itm_3 <= mult_2_z_asn_itm_2;
      mult_1_z_asn_itm_3 <= mult_1_z_asn_itm_2;
      mult_z_asn_itm_3 <= mult_z_asn_itm_2;
      tmp_14_sva_6 <= tmp_14_sva_5;
      tmp_12_sva_6 <= tmp_12_sva_5;
      tmp_10_sva_6 <= tmp_10_sva_5;
      tmp_8_sva_6 <= tmp_8_sva_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_7 <= 1'b0;
    end
    else if ( mult_3_z_and_4_cse ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_7 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_6;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_7 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_6
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_7 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_6;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_7 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_6)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_7 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_6;
    end
  end
  always @(posedge clk) begin
    if ( mult_3_z_and_5_cse ) begin
      mult_3_z_asn_itm_2 <= mult_3_z_asn_itm_1;
      mult_2_z_asn_itm_2 <= mult_2_z_asn_itm_1;
      mult_1_z_asn_itm_2 <= mult_1_z_asn_itm_1;
      mult_z_asn_itm_2 <= mult_z_asn_itm_1;
      tmp_14_sva_5 <= tmp_14_sva_4;
      tmp_12_sva_5 <= tmp_12_sva_4;
      tmp_10_sva_5 <= tmp_10_sva_4;
      tmp_8_sva_5 <= tmp_8_sva_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_6 <= 1'b0;
    end
    else if ( mult_3_z_and_5_cse ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_6 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_5;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_6 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_5
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_6 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_5;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_6 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_5)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_6 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_5;
    end
  end
  always @(posedge clk) begin
    if ( mult_3_z_and_6_cse ) begin
      mult_3_z_asn_itm_1 <= mult_z_mul_cmp_2_z;
      mult_2_z_asn_itm_1 <= mult_z_mul_cmp_4_z;
      mult_1_z_asn_itm_1 <= mult_z_mul_cmp_6_z;
      mult_z_asn_itm_1 <= mult_z_mul_cmp_z;
      tmp_14_sva_4 <= tmp_14_sva_3;
      tmp_12_sva_4 <= tmp_12_sva_3;
      tmp_10_sva_4 <= tmp_10_sva_3;
      tmp_8_sva_4 <= tmp_8_sva_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_5 <= 1'b0;
    end
    else if ( mult_3_z_and_6_cse ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_5 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_5 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_4
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_5 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_5 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_4)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_5 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( INNER_LOOP_r_and_19_cse ) begin
      tmp_14_sva_3 <= tmp_14_sva_2;
      tmp_12_sva_3 <= tmp_12_sva_2;
      tmp_10_sva_3 <= tmp_10_sva_2;
      tmp_8_sva_3 <= tmp_8_sva_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_4 <= 1'b0;
    end
    else if ( INNER_LOOP_r_and_19_cse ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_4 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_4 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_3
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_4 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_4 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_3)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_4 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( INNER_LOOP_r_and_22_cse ) begin
      tmp_14_sva_2 <= tmp_14_sva_1;
      tmp_12_sva_2 <= tmp_12_sva_1;
      tmp_10_sva_2 <= tmp_10_sva_1;
      tmp_8_sva_2 <= tmp_8_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_3 <= 1'b0;
    end
    else if ( INNER_LOOP_r_and_22_cse ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_3 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_3 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_2
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_3 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0_3 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_2)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_3 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( INNER_LOOP_r_and_25_cse ) begin
      tmp_14_sva_1 <= xt_rsc_0_6_i_qa_d_mxwt;
      tmp_12_sva_1 <= xt_rsc_0_4_i_qa_d_mxwt;
      tmp_10_sva_1 <= xt_rsc_0_2_i_qa_d_mxwt;
      tmp_8_sva_1 <= xt_rsc_0_0_i_qa_d_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_2 <= 1'b0;
    end
    else if ( INNER_LOOP_r_and_25_cse ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_2 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse
        & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_1 ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_2 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & reg_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct_0_cse
        & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_1) ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_2 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_1 <= 1'b0;
    end
    else if ( core_wen & INNER_LOOP_stage_0 ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm_1 <= INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0 & INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_8_itm_1 <= INNER_LOOP_r_9_2_sva_6_0[6:1];
    end
  end
  always @(posedge clk) begin
    if ( core_wen & INNER_LOOP_stage_0 & (~ INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm)
        ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_145_itm_1 <= INNER_LOOP_r_9_2_sva_6_0[6:1];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm <= 1'b0;
    end
    else if ( core_wen & (~(INNER_LOOP_nand_cse & (z_out[4]))) ) begin
      INNER_LOOP_r_slc_INNER_LOOP_r_9_2_6_0_28_itm <= (z_out_1[0]) & (fsm_output[2]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      cpyVec_for_i_slc_cpyVec_for_i_10_3_6_0_168_itm <= 1'b0;
    end
    else if ( core_wen & (cpyVec_for_cpyVec_for_and_cse | INNER_LOOP_nor_tmp) ) begin
      cpyVec_for_i_slc_cpyVec_for_i_10_3_6_0_168_itm <= (z_out_1[6]) & (fsm_output[3]);
    end
  end
  assign INNER_LOOP_r_mux_nl = MUX_v_7_2_2((z_out_1[6:0]), cpyVec_for_i_10_3_sva_6_0,
      fsm_output[3]);
  assign not_163_nl = ~ (fsm_output[1]);
  assign INNER_LOOP_mux_14_nl = MUX_s_1_2_2(INNER_LOOP_stage_0_9, (cpyVec_for_i_10_3_sva_6_0[6]),
      fsm_output[3]);
  assign INNER_LOOP_mux_13_nl = MUX_s_1_2_2(INNER_LOOP_stage_0_10, cpyVec_for_i_slc_cpyVec_for_i_10_3_6_0_168_itm,
      fsm_output[3]);
  assign nl_modulo_add_base_sva_1  = tmp_8_sva_8 + mult_res_lpi_3_dfm_mx0;
  assign nl_modulo_sub_base_sva_1  = tmp_8_sva_8 - mult_res_lpi_3_dfm_mx0;
  assign nl_modulo_add_base_1_sva_1  = tmp_10_sva_8 + mult_1_res_lpi_3_dfm_mx0;
  assign nl_modulo_sub_base_1_sva_1  = tmp_10_sva_8 - mult_1_res_lpi_3_dfm_mx0;
  assign nl_modulo_add_base_2_sva_1  = tmp_12_sva_8 + mult_2_res_lpi_3_dfm_mx0;
  assign nl_modulo_sub_base_2_sva_1  = tmp_12_sva_8 - mult_2_res_lpi_3_dfm_mx0;
  assign nl_modulo_add_base_3_sva_1  = tmp_14_sva_8 + mult_3_res_lpi_3_dfm_mx0;
  assign nl_modulo_sub_base_3_sva_1  = tmp_14_sva_8 - mult_3_res_lpi_3_dfm_mx0;
  assign nl_mult_3_if_acc_1_nl = ({1'b1 , mult_3_res_sva_2}) + conv_u2u_32_33(~ p_sva)
      + 33'b000000000000000000000000000000001;
  assign mult_3_if_acc_1_nl = nl_mult_3_if_acc_1_nl[32:0];
  assign nl_mult_2_if_acc_1_nl = ({1'b1 , mult_2_res_sva_2}) + conv_u2u_32_33(~ p_sva)
      + 33'b000000000000000000000000000000001;
  assign mult_2_if_acc_1_nl = nl_mult_2_if_acc_1_nl[32:0];
  assign nl_mult_1_if_acc_1_nl = ({1'b1 , mult_1_res_sva_2}) + conv_u2u_32_33(~ p_sva)
      + 33'b000000000000000000000000000000001;
  assign mult_1_if_acc_1_nl = nl_mult_1_if_acc_1_nl[32:0];
  assign nl_mult_if_acc_1_nl = ({1'b1 , mult_res_sva_2}) + conv_u2u_32_33(~ p_sva)
      + 33'b000000000000000000000000000000001;
  assign mult_if_acc_1_nl = nl_mult_if_acc_1_nl[32:0];
  assign nl_z_out = conv_u2u_4_5(STAGE_LOOP_c_3_0_sva) + 5'b11111;
  assign z_out = nl_z_out[4:0];
  assign operator_20_false_mux_2_nl = MUX_v_7_2_2(INNER_LOOP_r_9_2_sva_6_0, cpyVec_for_i_10_3_sva_6_0,
      fsm_output[3]);
  assign nl_z_out_1 = conv_u2u_7_8(operator_20_false_mux_2_nl) + 8'b00000001;
  assign z_out_1 = nl_z_out_1[7:0];

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


  function automatic [0:0] readslicef_33_1_32;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_33_1_32 = tmp[0:0];
  end
  endfunction


  function automatic [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
  end
  endfunction


  function automatic [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function automatic [32:0] conv_u2u_32_33 ;
    input [31:0]  vector ;
  begin
    conv_u2u_32_33 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT
// ------------------------------------------------------------------


module peaseNTT (
  clk, rst, xt_rsc_0_0_adra, xt_rsc_0_0_da, xt_rsc_0_0_wea, xt_rsc_0_0_qa, xt_rsc_0_0_adrb,
      xt_rsc_0_0_db, xt_rsc_0_0_web, xt_rsc_0_0_qb, xt_rsc_triosy_0_0_lz, xt_rsc_0_1_adra,
      xt_rsc_0_1_da, xt_rsc_0_1_wea, xt_rsc_0_1_qa, xt_rsc_0_1_adrb, xt_rsc_0_1_db,
      xt_rsc_0_1_web, xt_rsc_0_1_qb, xt_rsc_triosy_0_1_lz, xt_rsc_0_2_adra, xt_rsc_0_2_da,
      xt_rsc_0_2_wea, xt_rsc_0_2_qa, xt_rsc_0_2_adrb, xt_rsc_0_2_db, xt_rsc_0_2_web,
      xt_rsc_0_2_qb, xt_rsc_triosy_0_2_lz, xt_rsc_0_3_adra, xt_rsc_0_3_da, xt_rsc_0_3_wea,
      xt_rsc_0_3_qa, xt_rsc_0_3_adrb, xt_rsc_0_3_db, xt_rsc_0_3_web, xt_rsc_0_3_qb,
      xt_rsc_triosy_0_3_lz, xt_rsc_0_4_adra, xt_rsc_0_4_da, xt_rsc_0_4_wea, xt_rsc_0_4_qa,
      xt_rsc_0_4_adrb, xt_rsc_0_4_db, xt_rsc_0_4_web, xt_rsc_0_4_qb, xt_rsc_triosy_0_4_lz,
      xt_rsc_0_5_adra, xt_rsc_0_5_da, xt_rsc_0_5_wea, xt_rsc_0_5_qa, xt_rsc_0_5_adrb,
      xt_rsc_0_5_db, xt_rsc_0_5_web, xt_rsc_0_5_qb, xt_rsc_triosy_0_5_lz, xt_rsc_0_6_adra,
      xt_rsc_0_6_da, xt_rsc_0_6_wea, xt_rsc_0_6_qa, xt_rsc_0_6_adrb, xt_rsc_0_6_db,
      xt_rsc_0_6_web, xt_rsc_0_6_qb, xt_rsc_triosy_0_6_lz, xt_rsc_0_7_adra, xt_rsc_0_7_da,
      xt_rsc_0_7_wea, xt_rsc_0_7_qa, xt_rsc_0_7_adrb, xt_rsc_0_7_db, xt_rsc_0_7_web,
      xt_rsc_0_7_qb, xt_rsc_triosy_0_7_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat,
      r_rsc_triosy_lz, twiddle_rsc_0_0_s_tdone, twiddle_rsc_0_0_tr_write_done, twiddle_rsc_0_0_RREADY,
      twiddle_rsc_0_0_RVALID, twiddle_rsc_0_0_RUSER, twiddle_rsc_0_0_RLAST, twiddle_rsc_0_0_RRESP,
      twiddle_rsc_0_0_RDATA, twiddle_rsc_0_0_RID, twiddle_rsc_0_0_ARREADY, twiddle_rsc_0_0_ARVALID,
      twiddle_rsc_0_0_ARUSER, twiddle_rsc_0_0_ARREGION, twiddle_rsc_0_0_ARQOS, twiddle_rsc_0_0_ARPROT,
      twiddle_rsc_0_0_ARCACHE, twiddle_rsc_0_0_ARLOCK, twiddle_rsc_0_0_ARBURST, twiddle_rsc_0_0_ARSIZE,
      twiddle_rsc_0_0_ARLEN, twiddle_rsc_0_0_ARADDR, twiddle_rsc_0_0_ARID, twiddle_rsc_0_0_BREADY,
      twiddle_rsc_0_0_BVALID, twiddle_rsc_0_0_BUSER, twiddle_rsc_0_0_BRESP, twiddle_rsc_0_0_BID,
      twiddle_rsc_0_0_WREADY, twiddle_rsc_0_0_WVALID, twiddle_rsc_0_0_WUSER, twiddle_rsc_0_0_WLAST,
      twiddle_rsc_0_0_WSTRB, twiddle_rsc_0_0_WDATA, twiddle_rsc_0_0_AWREADY, twiddle_rsc_0_0_AWVALID,
      twiddle_rsc_0_0_AWUSER, twiddle_rsc_0_0_AWREGION, twiddle_rsc_0_0_AWQOS, twiddle_rsc_0_0_AWPROT,
      twiddle_rsc_0_0_AWCACHE, twiddle_rsc_0_0_AWLOCK, twiddle_rsc_0_0_AWBURST, twiddle_rsc_0_0_AWSIZE,
      twiddle_rsc_0_0_AWLEN, twiddle_rsc_0_0_AWADDR, twiddle_rsc_0_0_AWID, twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_0_1_s_tdone, twiddle_rsc_0_1_tr_write_done, twiddle_rsc_0_1_RREADY,
      twiddle_rsc_0_1_RVALID, twiddle_rsc_0_1_RUSER, twiddle_rsc_0_1_RLAST, twiddle_rsc_0_1_RRESP,
      twiddle_rsc_0_1_RDATA, twiddle_rsc_0_1_RID, twiddle_rsc_0_1_ARREADY, twiddle_rsc_0_1_ARVALID,
      twiddle_rsc_0_1_ARUSER, twiddle_rsc_0_1_ARREGION, twiddle_rsc_0_1_ARQOS, twiddle_rsc_0_1_ARPROT,
      twiddle_rsc_0_1_ARCACHE, twiddle_rsc_0_1_ARLOCK, twiddle_rsc_0_1_ARBURST, twiddle_rsc_0_1_ARSIZE,
      twiddle_rsc_0_1_ARLEN, twiddle_rsc_0_1_ARADDR, twiddle_rsc_0_1_ARID, twiddle_rsc_0_1_BREADY,
      twiddle_rsc_0_1_BVALID, twiddle_rsc_0_1_BUSER, twiddle_rsc_0_1_BRESP, twiddle_rsc_0_1_BID,
      twiddle_rsc_0_1_WREADY, twiddle_rsc_0_1_WVALID, twiddle_rsc_0_1_WUSER, twiddle_rsc_0_1_WLAST,
      twiddle_rsc_0_1_WSTRB, twiddle_rsc_0_1_WDATA, twiddle_rsc_0_1_AWREADY, twiddle_rsc_0_1_AWVALID,
      twiddle_rsc_0_1_AWUSER, twiddle_rsc_0_1_AWREGION, twiddle_rsc_0_1_AWQOS, twiddle_rsc_0_1_AWPROT,
      twiddle_rsc_0_1_AWCACHE, twiddle_rsc_0_1_AWLOCK, twiddle_rsc_0_1_AWBURST, twiddle_rsc_0_1_AWSIZE,
      twiddle_rsc_0_1_AWLEN, twiddle_rsc_0_1_AWADDR, twiddle_rsc_0_1_AWID, twiddle_rsc_triosy_0_1_lz,
      twiddle_rsc_0_2_s_tdone, twiddle_rsc_0_2_tr_write_done, twiddle_rsc_0_2_RREADY,
      twiddle_rsc_0_2_RVALID, twiddle_rsc_0_2_RUSER, twiddle_rsc_0_2_RLAST, twiddle_rsc_0_2_RRESP,
      twiddle_rsc_0_2_RDATA, twiddle_rsc_0_2_RID, twiddle_rsc_0_2_ARREADY, twiddle_rsc_0_2_ARVALID,
      twiddle_rsc_0_2_ARUSER, twiddle_rsc_0_2_ARREGION, twiddle_rsc_0_2_ARQOS, twiddle_rsc_0_2_ARPROT,
      twiddle_rsc_0_2_ARCACHE, twiddle_rsc_0_2_ARLOCK, twiddle_rsc_0_2_ARBURST, twiddle_rsc_0_2_ARSIZE,
      twiddle_rsc_0_2_ARLEN, twiddle_rsc_0_2_ARADDR, twiddle_rsc_0_2_ARID, twiddle_rsc_0_2_BREADY,
      twiddle_rsc_0_2_BVALID, twiddle_rsc_0_2_BUSER, twiddle_rsc_0_2_BRESP, twiddle_rsc_0_2_BID,
      twiddle_rsc_0_2_WREADY, twiddle_rsc_0_2_WVALID, twiddle_rsc_0_2_WUSER, twiddle_rsc_0_2_WLAST,
      twiddle_rsc_0_2_WSTRB, twiddle_rsc_0_2_WDATA, twiddle_rsc_0_2_AWREADY, twiddle_rsc_0_2_AWVALID,
      twiddle_rsc_0_2_AWUSER, twiddle_rsc_0_2_AWREGION, twiddle_rsc_0_2_AWQOS, twiddle_rsc_0_2_AWPROT,
      twiddle_rsc_0_2_AWCACHE, twiddle_rsc_0_2_AWLOCK, twiddle_rsc_0_2_AWBURST, twiddle_rsc_0_2_AWSIZE,
      twiddle_rsc_0_2_AWLEN, twiddle_rsc_0_2_AWADDR, twiddle_rsc_0_2_AWID, twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_0_3_s_tdone, twiddle_rsc_0_3_tr_write_done, twiddle_rsc_0_3_RREADY,
      twiddle_rsc_0_3_RVALID, twiddle_rsc_0_3_RUSER, twiddle_rsc_0_3_RLAST, twiddle_rsc_0_3_RRESP,
      twiddle_rsc_0_3_RDATA, twiddle_rsc_0_3_RID, twiddle_rsc_0_3_ARREADY, twiddle_rsc_0_3_ARVALID,
      twiddle_rsc_0_3_ARUSER, twiddle_rsc_0_3_ARREGION, twiddle_rsc_0_3_ARQOS, twiddle_rsc_0_3_ARPROT,
      twiddle_rsc_0_3_ARCACHE, twiddle_rsc_0_3_ARLOCK, twiddle_rsc_0_3_ARBURST, twiddle_rsc_0_3_ARSIZE,
      twiddle_rsc_0_3_ARLEN, twiddle_rsc_0_3_ARADDR, twiddle_rsc_0_3_ARID, twiddle_rsc_0_3_BREADY,
      twiddle_rsc_0_3_BVALID, twiddle_rsc_0_3_BUSER, twiddle_rsc_0_3_BRESP, twiddle_rsc_0_3_BID,
      twiddle_rsc_0_3_WREADY, twiddle_rsc_0_3_WVALID, twiddle_rsc_0_3_WUSER, twiddle_rsc_0_3_WLAST,
      twiddle_rsc_0_3_WSTRB, twiddle_rsc_0_3_WDATA, twiddle_rsc_0_3_AWREADY, twiddle_rsc_0_3_AWVALID,
      twiddle_rsc_0_3_AWUSER, twiddle_rsc_0_3_AWREGION, twiddle_rsc_0_3_AWQOS, twiddle_rsc_0_3_AWPROT,
      twiddle_rsc_0_3_AWCACHE, twiddle_rsc_0_3_AWLOCK, twiddle_rsc_0_3_AWBURST, twiddle_rsc_0_3_AWSIZE,
      twiddle_rsc_0_3_AWLEN, twiddle_rsc_0_3_AWADDR, twiddle_rsc_0_3_AWID, twiddle_rsc_triosy_0_3_lz,
      twiddle_h_rsc_0_0_s_tdone, twiddle_h_rsc_0_0_tr_write_done, twiddle_h_rsc_0_0_RREADY,
      twiddle_h_rsc_0_0_RVALID, twiddle_h_rsc_0_0_RUSER, twiddle_h_rsc_0_0_RLAST,
      twiddle_h_rsc_0_0_RRESP, twiddle_h_rsc_0_0_RDATA, twiddle_h_rsc_0_0_RID, twiddle_h_rsc_0_0_ARREADY,
      twiddle_h_rsc_0_0_ARVALID, twiddle_h_rsc_0_0_ARUSER, twiddle_h_rsc_0_0_ARREGION,
      twiddle_h_rsc_0_0_ARQOS, twiddle_h_rsc_0_0_ARPROT, twiddle_h_rsc_0_0_ARCACHE,
      twiddle_h_rsc_0_0_ARLOCK, twiddle_h_rsc_0_0_ARBURST, twiddle_h_rsc_0_0_ARSIZE,
      twiddle_h_rsc_0_0_ARLEN, twiddle_h_rsc_0_0_ARADDR, twiddle_h_rsc_0_0_ARID,
      twiddle_h_rsc_0_0_BREADY, twiddle_h_rsc_0_0_BVALID, twiddle_h_rsc_0_0_BUSER,
      twiddle_h_rsc_0_0_BRESP, twiddle_h_rsc_0_0_BID, twiddle_h_rsc_0_0_WREADY, twiddle_h_rsc_0_0_WVALID,
      twiddle_h_rsc_0_0_WUSER, twiddle_h_rsc_0_0_WLAST, twiddle_h_rsc_0_0_WSTRB,
      twiddle_h_rsc_0_0_WDATA, twiddle_h_rsc_0_0_AWREADY, twiddle_h_rsc_0_0_AWVALID,
      twiddle_h_rsc_0_0_AWUSER, twiddle_h_rsc_0_0_AWREGION, twiddle_h_rsc_0_0_AWQOS,
      twiddle_h_rsc_0_0_AWPROT, twiddle_h_rsc_0_0_AWCACHE, twiddle_h_rsc_0_0_AWLOCK,
      twiddle_h_rsc_0_0_AWBURST, twiddle_h_rsc_0_0_AWSIZE, twiddle_h_rsc_0_0_AWLEN,
      twiddle_h_rsc_0_0_AWADDR, twiddle_h_rsc_0_0_AWID, twiddle_h_rsc_triosy_0_0_lz,
      twiddle_h_rsc_0_1_s_tdone, twiddle_h_rsc_0_1_tr_write_done, twiddle_h_rsc_0_1_RREADY,
      twiddle_h_rsc_0_1_RVALID, twiddle_h_rsc_0_1_RUSER, twiddle_h_rsc_0_1_RLAST,
      twiddle_h_rsc_0_1_RRESP, twiddle_h_rsc_0_1_RDATA, twiddle_h_rsc_0_1_RID, twiddle_h_rsc_0_1_ARREADY,
      twiddle_h_rsc_0_1_ARVALID, twiddle_h_rsc_0_1_ARUSER, twiddle_h_rsc_0_1_ARREGION,
      twiddle_h_rsc_0_1_ARQOS, twiddle_h_rsc_0_1_ARPROT, twiddle_h_rsc_0_1_ARCACHE,
      twiddle_h_rsc_0_1_ARLOCK, twiddle_h_rsc_0_1_ARBURST, twiddle_h_rsc_0_1_ARSIZE,
      twiddle_h_rsc_0_1_ARLEN, twiddle_h_rsc_0_1_ARADDR, twiddle_h_rsc_0_1_ARID,
      twiddle_h_rsc_0_1_BREADY, twiddle_h_rsc_0_1_BVALID, twiddle_h_rsc_0_1_BUSER,
      twiddle_h_rsc_0_1_BRESP, twiddle_h_rsc_0_1_BID, twiddle_h_rsc_0_1_WREADY, twiddle_h_rsc_0_1_WVALID,
      twiddle_h_rsc_0_1_WUSER, twiddle_h_rsc_0_1_WLAST, twiddle_h_rsc_0_1_WSTRB,
      twiddle_h_rsc_0_1_WDATA, twiddle_h_rsc_0_1_AWREADY, twiddle_h_rsc_0_1_AWVALID,
      twiddle_h_rsc_0_1_AWUSER, twiddle_h_rsc_0_1_AWREGION, twiddle_h_rsc_0_1_AWQOS,
      twiddle_h_rsc_0_1_AWPROT, twiddle_h_rsc_0_1_AWCACHE, twiddle_h_rsc_0_1_AWLOCK,
      twiddle_h_rsc_0_1_AWBURST, twiddle_h_rsc_0_1_AWSIZE, twiddle_h_rsc_0_1_AWLEN,
      twiddle_h_rsc_0_1_AWADDR, twiddle_h_rsc_0_1_AWID, twiddle_h_rsc_triosy_0_1_lz,
      twiddle_h_rsc_0_2_s_tdone, twiddle_h_rsc_0_2_tr_write_done, twiddle_h_rsc_0_2_RREADY,
      twiddle_h_rsc_0_2_RVALID, twiddle_h_rsc_0_2_RUSER, twiddle_h_rsc_0_2_RLAST,
      twiddle_h_rsc_0_2_RRESP, twiddle_h_rsc_0_2_RDATA, twiddle_h_rsc_0_2_RID, twiddle_h_rsc_0_2_ARREADY,
      twiddle_h_rsc_0_2_ARVALID, twiddle_h_rsc_0_2_ARUSER, twiddle_h_rsc_0_2_ARREGION,
      twiddle_h_rsc_0_2_ARQOS, twiddle_h_rsc_0_2_ARPROT, twiddle_h_rsc_0_2_ARCACHE,
      twiddle_h_rsc_0_2_ARLOCK, twiddle_h_rsc_0_2_ARBURST, twiddle_h_rsc_0_2_ARSIZE,
      twiddle_h_rsc_0_2_ARLEN, twiddle_h_rsc_0_2_ARADDR, twiddle_h_rsc_0_2_ARID,
      twiddle_h_rsc_0_2_BREADY, twiddle_h_rsc_0_2_BVALID, twiddle_h_rsc_0_2_BUSER,
      twiddle_h_rsc_0_2_BRESP, twiddle_h_rsc_0_2_BID, twiddle_h_rsc_0_2_WREADY, twiddle_h_rsc_0_2_WVALID,
      twiddle_h_rsc_0_2_WUSER, twiddle_h_rsc_0_2_WLAST, twiddle_h_rsc_0_2_WSTRB,
      twiddle_h_rsc_0_2_WDATA, twiddle_h_rsc_0_2_AWREADY, twiddle_h_rsc_0_2_AWVALID,
      twiddle_h_rsc_0_2_AWUSER, twiddle_h_rsc_0_2_AWREGION, twiddle_h_rsc_0_2_AWQOS,
      twiddle_h_rsc_0_2_AWPROT, twiddle_h_rsc_0_2_AWCACHE, twiddle_h_rsc_0_2_AWLOCK,
      twiddle_h_rsc_0_2_AWBURST, twiddle_h_rsc_0_2_AWSIZE, twiddle_h_rsc_0_2_AWLEN,
      twiddle_h_rsc_0_2_AWADDR, twiddle_h_rsc_0_2_AWID, twiddle_h_rsc_triosy_0_2_lz,
      twiddle_h_rsc_0_3_s_tdone, twiddle_h_rsc_0_3_tr_write_done, twiddle_h_rsc_0_3_RREADY,
      twiddle_h_rsc_0_3_RVALID, twiddle_h_rsc_0_3_RUSER, twiddle_h_rsc_0_3_RLAST,
      twiddle_h_rsc_0_3_RRESP, twiddle_h_rsc_0_3_RDATA, twiddle_h_rsc_0_3_RID, twiddle_h_rsc_0_3_ARREADY,
      twiddle_h_rsc_0_3_ARVALID, twiddle_h_rsc_0_3_ARUSER, twiddle_h_rsc_0_3_ARREGION,
      twiddle_h_rsc_0_3_ARQOS, twiddle_h_rsc_0_3_ARPROT, twiddle_h_rsc_0_3_ARCACHE,
      twiddle_h_rsc_0_3_ARLOCK, twiddle_h_rsc_0_3_ARBURST, twiddle_h_rsc_0_3_ARSIZE,
      twiddle_h_rsc_0_3_ARLEN, twiddle_h_rsc_0_3_ARADDR, twiddle_h_rsc_0_3_ARID,
      twiddle_h_rsc_0_3_BREADY, twiddle_h_rsc_0_3_BVALID, twiddle_h_rsc_0_3_BUSER,
      twiddle_h_rsc_0_3_BRESP, twiddle_h_rsc_0_3_BID, twiddle_h_rsc_0_3_WREADY, twiddle_h_rsc_0_3_WVALID,
      twiddle_h_rsc_0_3_WUSER, twiddle_h_rsc_0_3_WLAST, twiddle_h_rsc_0_3_WSTRB,
      twiddle_h_rsc_0_3_WDATA, twiddle_h_rsc_0_3_AWREADY, twiddle_h_rsc_0_3_AWVALID,
      twiddle_h_rsc_0_3_AWUSER, twiddle_h_rsc_0_3_AWREGION, twiddle_h_rsc_0_3_AWQOS,
      twiddle_h_rsc_0_3_AWPROT, twiddle_h_rsc_0_3_AWCACHE, twiddle_h_rsc_0_3_AWLOCK,
      twiddle_h_rsc_0_3_AWBURST, twiddle_h_rsc_0_3_AWSIZE, twiddle_h_rsc_0_3_AWLEN,
      twiddle_h_rsc_0_3_AWADDR, twiddle_h_rsc_0_3_AWID, twiddle_h_rsc_triosy_0_3_lz
);
  input clk;
  input rst;
  output [6:0] xt_rsc_0_0_adra;
  output [31:0] xt_rsc_0_0_da;
  output xt_rsc_0_0_wea;
  input [31:0] xt_rsc_0_0_qa;
  output [6:0] xt_rsc_0_0_adrb;
  output [31:0] xt_rsc_0_0_db;
  output xt_rsc_0_0_web;
  input [31:0] xt_rsc_0_0_qb;
  output xt_rsc_triosy_0_0_lz;
  output [6:0] xt_rsc_0_1_adra;
  output [31:0] xt_rsc_0_1_da;
  output xt_rsc_0_1_wea;
  input [31:0] xt_rsc_0_1_qa;
  output [6:0] xt_rsc_0_1_adrb;
  output [31:0] xt_rsc_0_1_db;
  output xt_rsc_0_1_web;
  input [31:0] xt_rsc_0_1_qb;
  output xt_rsc_triosy_0_1_lz;
  output [6:0] xt_rsc_0_2_adra;
  output [31:0] xt_rsc_0_2_da;
  output xt_rsc_0_2_wea;
  input [31:0] xt_rsc_0_2_qa;
  output [6:0] xt_rsc_0_2_adrb;
  output [31:0] xt_rsc_0_2_db;
  output xt_rsc_0_2_web;
  input [31:0] xt_rsc_0_2_qb;
  output xt_rsc_triosy_0_2_lz;
  output [6:0] xt_rsc_0_3_adra;
  output [31:0] xt_rsc_0_3_da;
  output xt_rsc_0_3_wea;
  input [31:0] xt_rsc_0_3_qa;
  output [6:0] xt_rsc_0_3_adrb;
  output [31:0] xt_rsc_0_3_db;
  output xt_rsc_0_3_web;
  input [31:0] xt_rsc_0_3_qb;
  output xt_rsc_triosy_0_3_lz;
  output [6:0] xt_rsc_0_4_adra;
  output [31:0] xt_rsc_0_4_da;
  output xt_rsc_0_4_wea;
  input [31:0] xt_rsc_0_4_qa;
  output [6:0] xt_rsc_0_4_adrb;
  output [31:0] xt_rsc_0_4_db;
  output xt_rsc_0_4_web;
  input [31:0] xt_rsc_0_4_qb;
  output xt_rsc_triosy_0_4_lz;
  output [6:0] xt_rsc_0_5_adra;
  output [31:0] xt_rsc_0_5_da;
  output xt_rsc_0_5_wea;
  input [31:0] xt_rsc_0_5_qa;
  output [6:0] xt_rsc_0_5_adrb;
  output [31:0] xt_rsc_0_5_db;
  output xt_rsc_0_5_web;
  input [31:0] xt_rsc_0_5_qb;
  output xt_rsc_triosy_0_5_lz;
  output [6:0] xt_rsc_0_6_adra;
  output [31:0] xt_rsc_0_6_da;
  output xt_rsc_0_6_wea;
  input [31:0] xt_rsc_0_6_qa;
  output [6:0] xt_rsc_0_6_adrb;
  output [31:0] xt_rsc_0_6_db;
  output xt_rsc_0_6_web;
  input [31:0] xt_rsc_0_6_qb;
  output xt_rsc_triosy_0_6_lz;
  output [6:0] xt_rsc_0_7_adra;
  output [31:0] xt_rsc_0_7_da;
  output xt_rsc_0_7_wea;
  input [31:0] xt_rsc_0_7_qa;
  output [6:0] xt_rsc_0_7_adrb;
  output [31:0] xt_rsc_0_7_db;
  output xt_rsc_0_7_web;
  input [31:0] xt_rsc_0_7_qb;
  output xt_rsc_triosy_0_7_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  input twiddle_rsc_0_0_s_tdone;
  input twiddle_rsc_0_0_tr_write_done;
  input twiddle_rsc_0_0_RREADY;
  output twiddle_rsc_0_0_RVALID;
  output twiddle_rsc_0_0_RUSER;
  output twiddle_rsc_0_0_RLAST;
  output [1:0] twiddle_rsc_0_0_RRESP;
  output [31:0] twiddle_rsc_0_0_RDATA;
  output twiddle_rsc_0_0_RID;
  output twiddle_rsc_0_0_ARREADY;
  input twiddle_rsc_0_0_ARVALID;
  input twiddle_rsc_0_0_ARUSER;
  input [3:0] twiddle_rsc_0_0_ARREGION;
  input [3:0] twiddle_rsc_0_0_ARQOS;
  input [2:0] twiddle_rsc_0_0_ARPROT;
  input [3:0] twiddle_rsc_0_0_ARCACHE;
  input twiddle_rsc_0_0_ARLOCK;
  input [1:0] twiddle_rsc_0_0_ARBURST;
  input [2:0] twiddle_rsc_0_0_ARSIZE;
  input [7:0] twiddle_rsc_0_0_ARLEN;
  input [11:0] twiddle_rsc_0_0_ARADDR;
  input twiddle_rsc_0_0_ARID;
  input twiddle_rsc_0_0_BREADY;
  output twiddle_rsc_0_0_BVALID;
  output twiddle_rsc_0_0_BUSER;
  output [1:0] twiddle_rsc_0_0_BRESP;
  output twiddle_rsc_0_0_BID;
  output twiddle_rsc_0_0_WREADY;
  input twiddle_rsc_0_0_WVALID;
  input twiddle_rsc_0_0_WUSER;
  input twiddle_rsc_0_0_WLAST;
  input [3:0] twiddle_rsc_0_0_WSTRB;
  input [31:0] twiddle_rsc_0_0_WDATA;
  output twiddle_rsc_0_0_AWREADY;
  input twiddle_rsc_0_0_AWVALID;
  input twiddle_rsc_0_0_AWUSER;
  input [3:0] twiddle_rsc_0_0_AWREGION;
  input [3:0] twiddle_rsc_0_0_AWQOS;
  input [2:0] twiddle_rsc_0_0_AWPROT;
  input [3:0] twiddle_rsc_0_0_AWCACHE;
  input twiddle_rsc_0_0_AWLOCK;
  input [1:0] twiddle_rsc_0_0_AWBURST;
  input [2:0] twiddle_rsc_0_0_AWSIZE;
  input [7:0] twiddle_rsc_0_0_AWLEN;
  input [11:0] twiddle_rsc_0_0_AWADDR;
  input twiddle_rsc_0_0_AWID;
  output twiddle_rsc_triosy_0_0_lz;
  input twiddle_rsc_0_1_s_tdone;
  input twiddle_rsc_0_1_tr_write_done;
  input twiddle_rsc_0_1_RREADY;
  output twiddle_rsc_0_1_RVALID;
  output twiddle_rsc_0_1_RUSER;
  output twiddle_rsc_0_1_RLAST;
  output [1:0] twiddle_rsc_0_1_RRESP;
  output [31:0] twiddle_rsc_0_1_RDATA;
  output twiddle_rsc_0_1_RID;
  output twiddle_rsc_0_1_ARREADY;
  input twiddle_rsc_0_1_ARVALID;
  input twiddle_rsc_0_1_ARUSER;
  input [3:0] twiddle_rsc_0_1_ARREGION;
  input [3:0] twiddle_rsc_0_1_ARQOS;
  input [2:0] twiddle_rsc_0_1_ARPROT;
  input [3:0] twiddle_rsc_0_1_ARCACHE;
  input twiddle_rsc_0_1_ARLOCK;
  input [1:0] twiddle_rsc_0_1_ARBURST;
  input [2:0] twiddle_rsc_0_1_ARSIZE;
  input [7:0] twiddle_rsc_0_1_ARLEN;
  input [11:0] twiddle_rsc_0_1_ARADDR;
  input twiddle_rsc_0_1_ARID;
  input twiddle_rsc_0_1_BREADY;
  output twiddle_rsc_0_1_BVALID;
  output twiddle_rsc_0_1_BUSER;
  output [1:0] twiddle_rsc_0_1_BRESP;
  output twiddle_rsc_0_1_BID;
  output twiddle_rsc_0_1_WREADY;
  input twiddle_rsc_0_1_WVALID;
  input twiddle_rsc_0_1_WUSER;
  input twiddle_rsc_0_1_WLAST;
  input [3:0] twiddle_rsc_0_1_WSTRB;
  input [31:0] twiddle_rsc_0_1_WDATA;
  output twiddle_rsc_0_1_AWREADY;
  input twiddle_rsc_0_1_AWVALID;
  input twiddle_rsc_0_1_AWUSER;
  input [3:0] twiddle_rsc_0_1_AWREGION;
  input [3:0] twiddle_rsc_0_1_AWQOS;
  input [2:0] twiddle_rsc_0_1_AWPROT;
  input [3:0] twiddle_rsc_0_1_AWCACHE;
  input twiddle_rsc_0_1_AWLOCK;
  input [1:0] twiddle_rsc_0_1_AWBURST;
  input [2:0] twiddle_rsc_0_1_AWSIZE;
  input [7:0] twiddle_rsc_0_1_AWLEN;
  input [11:0] twiddle_rsc_0_1_AWADDR;
  input twiddle_rsc_0_1_AWID;
  output twiddle_rsc_triosy_0_1_lz;
  input twiddle_rsc_0_2_s_tdone;
  input twiddle_rsc_0_2_tr_write_done;
  input twiddle_rsc_0_2_RREADY;
  output twiddle_rsc_0_2_RVALID;
  output twiddle_rsc_0_2_RUSER;
  output twiddle_rsc_0_2_RLAST;
  output [1:0] twiddle_rsc_0_2_RRESP;
  output [31:0] twiddle_rsc_0_2_RDATA;
  output twiddle_rsc_0_2_RID;
  output twiddle_rsc_0_2_ARREADY;
  input twiddle_rsc_0_2_ARVALID;
  input twiddle_rsc_0_2_ARUSER;
  input [3:0] twiddle_rsc_0_2_ARREGION;
  input [3:0] twiddle_rsc_0_2_ARQOS;
  input [2:0] twiddle_rsc_0_2_ARPROT;
  input [3:0] twiddle_rsc_0_2_ARCACHE;
  input twiddle_rsc_0_2_ARLOCK;
  input [1:0] twiddle_rsc_0_2_ARBURST;
  input [2:0] twiddle_rsc_0_2_ARSIZE;
  input [7:0] twiddle_rsc_0_2_ARLEN;
  input [11:0] twiddle_rsc_0_2_ARADDR;
  input twiddle_rsc_0_2_ARID;
  input twiddle_rsc_0_2_BREADY;
  output twiddle_rsc_0_2_BVALID;
  output twiddle_rsc_0_2_BUSER;
  output [1:0] twiddle_rsc_0_2_BRESP;
  output twiddle_rsc_0_2_BID;
  output twiddle_rsc_0_2_WREADY;
  input twiddle_rsc_0_2_WVALID;
  input twiddle_rsc_0_2_WUSER;
  input twiddle_rsc_0_2_WLAST;
  input [3:0] twiddle_rsc_0_2_WSTRB;
  input [31:0] twiddle_rsc_0_2_WDATA;
  output twiddle_rsc_0_2_AWREADY;
  input twiddle_rsc_0_2_AWVALID;
  input twiddle_rsc_0_2_AWUSER;
  input [3:0] twiddle_rsc_0_2_AWREGION;
  input [3:0] twiddle_rsc_0_2_AWQOS;
  input [2:0] twiddle_rsc_0_2_AWPROT;
  input [3:0] twiddle_rsc_0_2_AWCACHE;
  input twiddle_rsc_0_2_AWLOCK;
  input [1:0] twiddle_rsc_0_2_AWBURST;
  input [2:0] twiddle_rsc_0_2_AWSIZE;
  input [7:0] twiddle_rsc_0_2_AWLEN;
  input [11:0] twiddle_rsc_0_2_AWADDR;
  input twiddle_rsc_0_2_AWID;
  output twiddle_rsc_triosy_0_2_lz;
  input twiddle_rsc_0_3_s_tdone;
  input twiddle_rsc_0_3_tr_write_done;
  input twiddle_rsc_0_3_RREADY;
  output twiddle_rsc_0_3_RVALID;
  output twiddle_rsc_0_3_RUSER;
  output twiddle_rsc_0_3_RLAST;
  output [1:0] twiddle_rsc_0_3_RRESP;
  output [31:0] twiddle_rsc_0_3_RDATA;
  output twiddle_rsc_0_3_RID;
  output twiddle_rsc_0_3_ARREADY;
  input twiddle_rsc_0_3_ARVALID;
  input twiddle_rsc_0_3_ARUSER;
  input [3:0] twiddle_rsc_0_3_ARREGION;
  input [3:0] twiddle_rsc_0_3_ARQOS;
  input [2:0] twiddle_rsc_0_3_ARPROT;
  input [3:0] twiddle_rsc_0_3_ARCACHE;
  input twiddle_rsc_0_3_ARLOCK;
  input [1:0] twiddle_rsc_0_3_ARBURST;
  input [2:0] twiddle_rsc_0_3_ARSIZE;
  input [7:0] twiddle_rsc_0_3_ARLEN;
  input [11:0] twiddle_rsc_0_3_ARADDR;
  input twiddle_rsc_0_3_ARID;
  input twiddle_rsc_0_3_BREADY;
  output twiddle_rsc_0_3_BVALID;
  output twiddle_rsc_0_3_BUSER;
  output [1:0] twiddle_rsc_0_3_BRESP;
  output twiddle_rsc_0_3_BID;
  output twiddle_rsc_0_3_WREADY;
  input twiddle_rsc_0_3_WVALID;
  input twiddle_rsc_0_3_WUSER;
  input twiddle_rsc_0_3_WLAST;
  input [3:0] twiddle_rsc_0_3_WSTRB;
  input [31:0] twiddle_rsc_0_3_WDATA;
  output twiddle_rsc_0_3_AWREADY;
  input twiddle_rsc_0_3_AWVALID;
  input twiddle_rsc_0_3_AWUSER;
  input [3:0] twiddle_rsc_0_3_AWREGION;
  input [3:0] twiddle_rsc_0_3_AWQOS;
  input [2:0] twiddle_rsc_0_3_AWPROT;
  input [3:0] twiddle_rsc_0_3_AWCACHE;
  input twiddle_rsc_0_3_AWLOCK;
  input [1:0] twiddle_rsc_0_3_AWBURST;
  input [2:0] twiddle_rsc_0_3_AWSIZE;
  input [7:0] twiddle_rsc_0_3_AWLEN;
  input [11:0] twiddle_rsc_0_3_AWADDR;
  input twiddle_rsc_0_3_AWID;
  output twiddle_rsc_triosy_0_3_lz;
  input twiddle_h_rsc_0_0_s_tdone;
  input twiddle_h_rsc_0_0_tr_write_done;
  input twiddle_h_rsc_0_0_RREADY;
  output twiddle_h_rsc_0_0_RVALID;
  output twiddle_h_rsc_0_0_RUSER;
  output twiddle_h_rsc_0_0_RLAST;
  output [1:0] twiddle_h_rsc_0_0_RRESP;
  output [31:0] twiddle_h_rsc_0_0_RDATA;
  output twiddle_h_rsc_0_0_RID;
  output twiddle_h_rsc_0_0_ARREADY;
  input twiddle_h_rsc_0_0_ARVALID;
  input twiddle_h_rsc_0_0_ARUSER;
  input [3:0] twiddle_h_rsc_0_0_ARREGION;
  input [3:0] twiddle_h_rsc_0_0_ARQOS;
  input [2:0] twiddle_h_rsc_0_0_ARPROT;
  input [3:0] twiddle_h_rsc_0_0_ARCACHE;
  input twiddle_h_rsc_0_0_ARLOCK;
  input [1:0] twiddle_h_rsc_0_0_ARBURST;
  input [2:0] twiddle_h_rsc_0_0_ARSIZE;
  input [7:0] twiddle_h_rsc_0_0_ARLEN;
  input [11:0] twiddle_h_rsc_0_0_ARADDR;
  input twiddle_h_rsc_0_0_ARID;
  input twiddle_h_rsc_0_0_BREADY;
  output twiddle_h_rsc_0_0_BVALID;
  output twiddle_h_rsc_0_0_BUSER;
  output [1:0] twiddle_h_rsc_0_0_BRESP;
  output twiddle_h_rsc_0_0_BID;
  output twiddle_h_rsc_0_0_WREADY;
  input twiddle_h_rsc_0_0_WVALID;
  input twiddle_h_rsc_0_0_WUSER;
  input twiddle_h_rsc_0_0_WLAST;
  input [3:0] twiddle_h_rsc_0_0_WSTRB;
  input [31:0] twiddle_h_rsc_0_0_WDATA;
  output twiddle_h_rsc_0_0_AWREADY;
  input twiddle_h_rsc_0_0_AWVALID;
  input twiddle_h_rsc_0_0_AWUSER;
  input [3:0] twiddle_h_rsc_0_0_AWREGION;
  input [3:0] twiddle_h_rsc_0_0_AWQOS;
  input [2:0] twiddle_h_rsc_0_0_AWPROT;
  input [3:0] twiddle_h_rsc_0_0_AWCACHE;
  input twiddle_h_rsc_0_0_AWLOCK;
  input [1:0] twiddle_h_rsc_0_0_AWBURST;
  input [2:0] twiddle_h_rsc_0_0_AWSIZE;
  input [7:0] twiddle_h_rsc_0_0_AWLEN;
  input [11:0] twiddle_h_rsc_0_0_AWADDR;
  input twiddle_h_rsc_0_0_AWID;
  output twiddle_h_rsc_triosy_0_0_lz;
  input twiddle_h_rsc_0_1_s_tdone;
  input twiddle_h_rsc_0_1_tr_write_done;
  input twiddle_h_rsc_0_1_RREADY;
  output twiddle_h_rsc_0_1_RVALID;
  output twiddle_h_rsc_0_1_RUSER;
  output twiddle_h_rsc_0_1_RLAST;
  output [1:0] twiddle_h_rsc_0_1_RRESP;
  output [31:0] twiddle_h_rsc_0_1_RDATA;
  output twiddle_h_rsc_0_1_RID;
  output twiddle_h_rsc_0_1_ARREADY;
  input twiddle_h_rsc_0_1_ARVALID;
  input twiddle_h_rsc_0_1_ARUSER;
  input [3:0] twiddle_h_rsc_0_1_ARREGION;
  input [3:0] twiddle_h_rsc_0_1_ARQOS;
  input [2:0] twiddle_h_rsc_0_1_ARPROT;
  input [3:0] twiddle_h_rsc_0_1_ARCACHE;
  input twiddle_h_rsc_0_1_ARLOCK;
  input [1:0] twiddle_h_rsc_0_1_ARBURST;
  input [2:0] twiddle_h_rsc_0_1_ARSIZE;
  input [7:0] twiddle_h_rsc_0_1_ARLEN;
  input [11:0] twiddle_h_rsc_0_1_ARADDR;
  input twiddle_h_rsc_0_1_ARID;
  input twiddle_h_rsc_0_1_BREADY;
  output twiddle_h_rsc_0_1_BVALID;
  output twiddle_h_rsc_0_1_BUSER;
  output [1:0] twiddle_h_rsc_0_1_BRESP;
  output twiddle_h_rsc_0_1_BID;
  output twiddle_h_rsc_0_1_WREADY;
  input twiddle_h_rsc_0_1_WVALID;
  input twiddle_h_rsc_0_1_WUSER;
  input twiddle_h_rsc_0_1_WLAST;
  input [3:0] twiddle_h_rsc_0_1_WSTRB;
  input [31:0] twiddle_h_rsc_0_1_WDATA;
  output twiddle_h_rsc_0_1_AWREADY;
  input twiddle_h_rsc_0_1_AWVALID;
  input twiddle_h_rsc_0_1_AWUSER;
  input [3:0] twiddle_h_rsc_0_1_AWREGION;
  input [3:0] twiddle_h_rsc_0_1_AWQOS;
  input [2:0] twiddle_h_rsc_0_1_AWPROT;
  input [3:0] twiddle_h_rsc_0_1_AWCACHE;
  input twiddle_h_rsc_0_1_AWLOCK;
  input [1:0] twiddle_h_rsc_0_1_AWBURST;
  input [2:0] twiddle_h_rsc_0_1_AWSIZE;
  input [7:0] twiddle_h_rsc_0_1_AWLEN;
  input [11:0] twiddle_h_rsc_0_1_AWADDR;
  input twiddle_h_rsc_0_1_AWID;
  output twiddle_h_rsc_triosy_0_1_lz;
  input twiddle_h_rsc_0_2_s_tdone;
  input twiddle_h_rsc_0_2_tr_write_done;
  input twiddle_h_rsc_0_2_RREADY;
  output twiddle_h_rsc_0_2_RVALID;
  output twiddle_h_rsc_0_2_RUSER;
  output twiddle_h_rsc_0_2_RLAST;
  output [1:0] twiddle_h_rsc_0_2_RRESP;
  output [31:0] twiddle_h_rsc_0_2_RDATA;
  output twiddle_h_rsc_0_2_RID;
  output twiddle_h_rsc_0_2_ARREADY;
  input twiddle_h_rsc_0_2_ARVALID;
  input twiddle_h_rsc_0_2_ARUSER;
  input [3:0] twiddle_h_rsc_0_2_ARREGION;
  input [3:0] twiddle_h_rsc_0_2_ARQOS;
  input [2:0] twiddle_h_rsc_0_2_ARPROT;
  input [3:0] twiddle_h_rsc_0_2_ARCACHE;
  input twiddle_h_rsc_0_2_ARLOCK;
  input [1:0] twiddle_h_rsc_0_2_ARBURST;
  input [2:0] twiddle_h_rsc_0_2_ARSIZE;
  input [7:0] twiddle_h_rsc_0_2_ARLEN;
  input [11:0] twiddle_h_rsc_0_2_ARADDR;
  input twiddle_h_rsc_0_2_ARID;
  input twiddle_h_rsc_0_2_BREADY;
  output twiddle_h_rsc_0_2_BVALID;
  output twiddle_h_rsc_0_2_BUSER;
  output [1:0] twiddle_h_rsc_0_2_BRESP;
  output twiddle_h_rsc_0_2_BID;
  output twiddle_h_rsc_0_2_WREADY;
  input twiddle_h_rsc_0_2_WVALID;
  input twiddle_h_rsc_0_2_WUSER;
  input twiddle_h_rsc_0_2_WLAST;
  input [3:0] twiddle_h_rsc_0_2_WSTRB;
  input [31:0] twiddle_h_rsc_0_2_WDATA;
  output twiddle_h_rsc_0_2_AWREADY;
  input twiddle_h_rsc_0_2_AWVALID;
  input twiddle_h_rsc_0_2_AWUSER;
  input [3:0] twiddle_h_rsc_0_2_AWREGION;
  input [3:0] twiddle_h_rsc_0_2_AWQOS;
  input [2:0] twiddle_h_rsc_0_2_AWPROT;
  input [3:0] twiddle_h_rsc_0_2_AWCACHE;
  input twiddle_h_rsc_0_2_AWLOCK;
  input [1:0] twiddle_h_rsc_0_2_AWBURST;
  input [2:0] twiddle_h_rsc_0_2_AWSIZE;
  input [7:0] twiddle_h_rsc_0_2_AWLEN;
  input [11:0] twiddle_h_rsc_0_2_AWADDR;
  input twiddle_h_rsc_0_2_AWID;
  output twiddle_h_rsc_triosy_0_2_lz;
  input twiddle_h_rsc_0_3_s_tdone;
  input twiddle_h_rsc_0_3_tr_write_done;
  input twiddle_h_rsc_0_3_RREADY;
  output twiddle_h_rsc_0_3_RVALID;
  output twiddle_h_rsc_0_3_RUSER;
  output twiddle_h_rsc_0_3_RLAST;
  output [1:0] twiddle_h_rsc_0_3_RRESP;
  output [31:0] twiddle_h_rsc_0_3_RDATA;
  output twiddle_h_rsc_0_3_RID;
  output twiddle_h_rsc_0_3_ARREADY;
  input twiddle_h_rsc_0_3_ARVALID;
  input twiddle_h_rsc_0_3_ARUSER;
  input [3:0] twiddle_h_rsc_0_3_ARREGION;
  input [3:0] twiddle_h_rsc_0_3_ARQOS;
  input [2:0] twiddle_h_rsc_0_3_ARPROT;
  input [3:0] twiddle_h_rsc_0_3_ARCACHE;
  input twiddle_h_rsc_0_3_ARLOCK;
  input [1:0] twiddle_h_rsc_0_3_ARBURST;
  input [2:0] twiddle_h_rsc_0_3_ARSIZE;
  input [7:0] twiddle_h_rsc_0_3_ARLEN;
  input [11:0] twiddle_h_rsc_0_3_ARADDR;
  input twiddle_h_rsc_0_3_ARID;
  input twiddle_h_rsc_0_3_BREADY;
  output twiddle_h_rsc_0_3_BVALID;
  output twiddle_h_rsc_0_3_BUSER;
  output [1:0] twiddle_h_rsc_0_3_BRESP;
  output twiddle_h_rsc_0_3_BID;
  output twiddle_h_rsc_0_3_WREADY;
  input twiddle_h_rsc_0_3_WVALID;
  input twiddle_h_rsc_0_3_WUSER;
  input twiddle_h_rsc_0_3_WLAST;
  input [3:0] twiddle_h_rsc_0_3_WSTRB;
  input [31:0] twiddle_h_rsc_0_3_WDATA;
  output twiddle_h_rsc_0_3_AWREADY;
  input twiddle_h_rsc_0_3_AWVALID;
  input twiddle_h_rsc_0_3_AWUSER;
  input [3:0] twiddle_h_rsc_0_3_AWREGION;
  input [3:0] twiddle_h_rsc_0_3_AWQOS;
  input [2:0] twiddle_h_rsc_0_3_AWPROT;
  input [3:0] twiddle_h_rsc_0_3_AWCACHE;
  input twiddle_h_rsc_0_3_AWLOCK;
  input [1:0] twiddle_h_rsc_0_3_AWBURST;
  input [2:0] twiddle_h_rsc_0_3_AWSIZE;
  input [7:0] twiddle_h_rsc_0_3_AWLEN;
  input [11:0] twiddle_h_rsc_0_3_AWADDR;
  input twiddle_h_rsc_0_3_AWID;
  output twiddle_h_rsc_triosy_0_3_lz;


  // Interconnect Declarations
  wire yt_rsc_0_0_i_clken_d;
  wire [31:0] yt_rsc_0_0_i_q_d;
  wire [31:0] yt_rsc_0_1_i_q_d;
  wire [31:0] yt_rsc_0_2_i_q_d;
  wire [31:0] yt_rsc_0_3_i_q_d;
  wire yt_rsc_0_4_i_clken_d;
  wire [31:0] yt_rsc_0_4_i_q_d;
  wire [31:0] yt_rsc_0_5_i_q_d;
  wire [31:0] yt_rsc_0_6_i_q_d;
  wire [31:0] yt_rsc_0_7_i_q_d;
  wire yt_rsc_1_0_i_clken_d;
  wire [31:0] yt_rsc_1_0_i_q_d;
  wire [31:0] yt_rsc_1_1_i_q_d;
  wire [31:0] yt_rsc_1_2_i_q_d;
  wire [31:0] yt_rsc_1_3_i_q_d;
  wire yt_rsc_1_4_i_clken_d;
  wire [31:0] yt_rsc_1_4_i_q_d;
  wire [31:0] yt_rsc_1_5_i_q_d;
  wire [31:0] yt_rsc_1_6_i_q_d;
  wire [31:0] yt_rsc_1_7_i_q_d;
  wire [6:0] xt_rsc_0_0_i_adra_d;
  wire [31:0] xt_rsc_0_0_i_da_d;
  wire [63:0] xt_rsc_0_0_i_qa_d;
  wire [1:0] xt_rsc_0_0_i_wea_d;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [6:0] xt_rsc_0_1_i_adra_d;
  wire [31:0] xt_rsc_0_1_i_da_d;
  wire [63:0] xt_rsc_0_1_i_qa_d;
  wire [1:0] xt_rsc_0_1_i_wea_d;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [6:0] xt_rsc_0_2_i_adra_d;
  wire [31:0] xt_rsc_0_2_i_da_d;
  wire [63:0] xt_rsc_0_2_i_qa_d;
  wire [1:0] xt_rsc_0_2_i_wea_d;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [6:0] xt_rsc_0_3_i_adra_d;
  wire [31:0] xt_rsc_0_3_i_da_d;
  wire [63:0] xt_rsc_0_3_i_qa_d;
  wire [1:0] xt_rsc_0_3_i_wea_d;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [6:0] xt_rsc_0_4_i_adra_d;
  wire [31:0] xt_rsc_0_4_i_da_d;
  wire [63:0] xt_rsc_0_4_i_qa_d;
  wire [1:0] xt_rsc_0_4_i_wea_d;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [6:0] xt_rsc_0_5_i_adra_d;
  wire [31:0] xt_rsc_0_5_i_da_d;
  wire [63:0] xt_rsc_0_5_i_qa_d;
  wire [1:0] xt_rsc_0_5_i_wea_d;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [6:0] xt_rsc_0_6_i_adra_d;
  wire [31:0] xt_rsc_0_6_i_da_d;
  wire [63:0] xt_rsc_0_6_i_qa_d;
  wire [1:0] xt_rsc_0_6_i_wea_d;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [6:0] xt_rsc_0_7_i_adra_d;
  wire [31:0] xt_rsc_0_7_i_da_d;
  wire [63:0] xt_rsc_0_7_i_qa_d;
  wire [1:0] xt_rsc_0_7_i_wea_d;
  wire [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire yt_rsc_0_0_clken;
  wire [31:0] yt_rsc_0_0_q;
  wire [5:0] yt_rsc_0_0_radr;
  wire yt_rsc_0_0_we;
  wire [31:0] yt_rsc_0_0_d;
  wire [5:0] yt_rsc_0_0_wadr;
  wire yt_rsc_0_1_clken;
  wire [31:0] yt_rsc_0_1_q;
  wire [5:0] yt_rsc_0_1_radr;
  wire yt_rsc_0_1_we;
  wire [31:0] yt_rsc_0_1_d;
  wire [5:0] yt_rsc_0_1_wadr;
  wire yt_rsc_0_2_clken;
  wire [31:0] yt_rsc_0_2_q;
  wire [5:0] yt_rsc_0_2_radr;
  wire yt_rsc_0_2_we;
  wire [31:0] yt_rsc_0_2_d;
  wire [5:0] yt_rsc_0_2_wadr;
  wire yt_rsc_0_3_clken;
  wire [31:0] yt_rsc_0_3_q;
  wire [5:0] yt_rsc_0_3_radr;
  wire yt_rsc_0_3_we;
  wire [31:0] yt_rsc_0_3_d;
  wire [5:0] yt_rsc_0_3_wadr;
  wire yt_rsc_0_4_clken;
  wire [31:0] yt_rsc_0_4_q;
  wire [5:0] yt_rsc_0_4_radr;
  wire yt_rsc_0_4_we;
  wire [31:0] yt_rsc_0_4_d;
  wire [5:0] yt_rsc_0_4_wadr;
  wire yt_rsc_0_5_clken;
  wire [31:0] yt_rsc_0_5_q;
  wire [5:0] yt_rsc_0_5_radr;
  wire yt_rsc_0_5_we;
  wire [31:0] yt_rsc_0_5_d;
  wire [5:0] yt_rsc_0_5_wadr;
  wire yt_rsc_0_6_clken;
  wire [31:0] yt_rsc_0_6_q;
  wire [5:0] yt_rsc_0_6_radr;
  wire yt_rsc_0_6_we;
  wire [31:0] yt_rsc_0_6_d;
  wire [5:0] yt_rsc_0_6_wadr;
  wire yt_rsc_0_7_clken;
  wire [31:0] yt_rsc_0_7_q;
  wire [5:0] yt_rsc_0_7_radr;
  wire yt_rsc_0_7_we;
  wire [31:0] yt_rsc_0_7_d;
  wire [5:0] yt_rsc_0_7_wadr;
  wire yt_rsc_1_0_clken;
  wire [31:0] yt_rsc_1_0_q;
  wire [5:0] yt_rsc_1_0_radr;
  wire yt_rsc_1_0_we;
  wire [31:0] yt_rsc_1_0_d;
  wire [5:0] yt_rsc_1_0_wadr;
  wire yt_rsc_1_1_clken;
  wire [31:0] yt_rsc_1_1_q;
  wire [5:0] yt_rsc_1_1_radr;
  wire yt_rsc_1_1_we;
  wire [31:0] yt_rsc_1_1_d;
  wire [5:0] yt_rsc_1_1_wadr;
  wire yt_rsc_1_2_clken;
  wire [31:0] yt_rsc_1_2_q;
  wire [5:0] yt_rsc_1_2_radr;
  wire yt_rsc_1_2_we;
  wire [31:0] yt_rsc_1_2_d;
  wire [5:0] yt_rsc_1_2_wadr;
  wire yt_rsc_1_3_clken;
  wire [31:0] yt_rsc_1_3_q;
  wire [5:0] yt_rsc_1_3_radr;
  wire yt_rsc_1_3_we;
  wire [31:0] yt_rsc_1_3_d;
  wire [5:0] yt_rsc_1_3_wadr;
  wire yt_rsc_1_4_clken;
  wire [31:0] yt_rsc_1_4_q;
  wire [5:0] yt_rsc_1_4_radr;
  wire yt_rsc_1_4_we;
  wire [31:0] yt_rsc_1_4_d;
  wire [5:0] yt_rsc_1_4_wadr;
  wire yt_rsc_1_5_clken;
  wire [31:0] yt_rsc_1_5_q;
  wire [5:0] yt_rsc_1_5_radr;
  wire yt_rsc_1_5_we;
  wire [31:0] yt_rsc_1_5_d;
  wire [5:0] yt_rsc_1_5_wadr;
  wire yt_rsc_1_6_clken;
  wire [31:0] yt_rsc_1_6_q;
  wire [5:0] yt_rsc_1_6_radr;
  wire yt_rsc_1_6_we;
  wire [31:0] yt_rsc_1_6_d;
  wire [5:0] yt_rsc_1_6_wadr;
  wire yt_rsc_1_7_clken;
  wire [31:0] yt_rsc_1_7_q;
  wire [5:0] yt_rsc_1_7_radr;
  wire yt_rsc_1_7_we;
  wire [31:0] yt_rsc_1_7_d;
  wire [5:0] yt_rsc_1_7_wadr;
  wire [31:0] yt_rsc_0_0_i_d_d_iff;
  wire [5:0] yt_rsc_0_0_i_radr_d_iff;
  wire [5:0] yt_rsc_0_0_i_wadr_d_iff;
  wire yt_rsc_0_0_i_we_d_iff;
  wire yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire [31:0] yt_rsc_0_1_i_d_d_iff;
  wire [31:0] yt_rsc_0_2_i_d_d_iff;
  wire [31:0] yt_rsc_0_3_i_d_d_iff;
  wire [5:0] yt_rsc_0_4_i_wadr_d_iff;
  wire yt_rsc_0_4_i_we_d_iff;
  wire [31:0] yt_rsc_1_0_i_d_d_iff;
  wire yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff;
  wire [31:0] yt_rsc_1_1_i_d_d_iff;
  wire [31:0] yt_rsc_1_2_i_d_d_iff;
  wire [31:0] yt_rsc_1_3_i_d_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [13:0] nl_xt_rsc_0_0_i_adra_d;
  assign nl_xt_rsc_0_0_i_adra_d = {7'b0000000 , xt_rsc_0_0_i_adra_d};
  wire [63:0] nl_xt_rsc_0_0_i_da_d;
  assign nl_xt_rsc_0_0_i_da_d = {32'b00000000000000000000000000000000 , xt_rsc_0_0_i_da_d};
  wire [13:0] nl_xt_rsc_0_1_i_adra_d;
  assign nl_xt_rsc_0_1_i_adra_d = {7'b0000000 , xt_rsc_0_1_i_adra_d};
  wire [63:0] nl_xt_rsc_0_1_i_da_d;
  assign nl_xt_rsc_0_1_i_da_d = {32'b00000000000000000000000000000000 , xt_rsc_0_1_i_da_d};
  wire [13:0] nl_xt_rsc_0_2_i_adra_d;
  assign nl_xt_rsc_0_2_i_adra_d = {7'b0000000 , xt_rsc_0_2_i_adra_d};
  wire [63:0] nl_xt_rsc_0_2_i_da_d;
  assign nl_xt_rsc_0_2_i_da_d = {32'b00000000000000000000000000000000 , xt_rsc_0_2_i_da_d};
  wire [13:0] nl_xt_rsc_0_3_i_adra_d;
  assign nl_xt_rsc_0_3_i_adra_d = {7'b0000000 , xt_rsc_0_3_i_adra_d};
  wire [63:0] nl_xt_rsc_0_3_i_da_d;
  assign nl_xt_rsc_0_3_i_da_d = {32'b00000000000000000000000000000000 , xt_rsc_0_3_i_da_d};
  wire [13:0] nl_xt_rsc_0_4_i_adra_d;
  assign nl_xt_rsc_0_4_i_adra_d = {7'b0000000 , xt_rsc_0_4_i_adra_d};
  wire [63:0] nl_xt_rsc_0_4_i_da_d;
  assign nl_xt_rsc_0_4_i_da_d = {32'b00000000000000000000000000000000 , xt_rsc_0_4_i_da_d};
  wire [13:0] nl_xt_rsc_0_5_i_adra_d;
  assign nl_xt_rsc_0_5_i_adra_d = {7'b0000000 , xt_rsc_0_5_i_adra_d};
  wire [63:0] nl_xt_rsc_0_5_i_da_d;
  assign nl_xt_rsc_0_5_i_da_d = {32'b00000000000000000000000000000000 , xt_rsc_0_5_i_da_d};
  wire [13:0] nl_xt_rsc_0_6_i_adra_d;
  assign nl_xt_rsc_0_6_i_adra_d = {7'b0000000 , xt_rsc_0_6_i_adra_d};
  wire [63:0] nl_xt_rsc_0_6_i_da_d;
  assign nl_xt_rsc_0_6_i_da_d = {32'b00000000000000000000000000000000 , xt_rsc_0_6_i_da_d};
  wire [13:0] nl_xt_rsc_0_7_i_adra_d;
  assign nl_xt_rsc_0_7_i_adra_d = {7'b0000000 , xt_rsc_0_7_i_adra_d};
  wire [63:0] nl_xt_rsc_0_7_i_da_d;
  assign nl_xt_rsc_0_7_i_da_d = {32'b00000000000000000000000000000000 , xt_rsc_0_7_i_da_d};
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_0_0_comp (
      .clk(clk),
      .clken(yt_rsc_0_0_clken),
      .d(yt_rsc_0_0_d),
      .q(yt_rsc_0_0_q),
      .radr(yt_rsc_0_0_radr),
      .wadr(yt_rsc_0_0_wadr),
      .we(yt_rsc_0_0_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_0_1_comp (
      .clk(clk),
      .clken(yt_rsc_0_1_clken),
      .d(yt_rsc_0_1_d),
      .q(yt_rsc_0_1_q),
      .radr(yt_rsc_0_1_radr),
      .wadr(yt_rsc_0_1_wadr),
      .we(yt_rsc_0_1_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_0_2_comp (
      .clk(clk),
      .clken(yt_rsc_0_2_clken),
      .d(yt_rsc_0_2_d),
      .q(yt_rsc_0_2_q),
      .radr(yt_rsc_0_2_radr),
      .wadr(yt_rsc_0_2_wadr),
      .we(yt_rsc_0_2_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_0_3_comp (
      .clk(clk),
      .clken(yt_rsc_0_3_clken),
      .d(yt_rsc_0_3_d),
      .q(yt_rsc_0_3_q),
      .radr(yt_rsc_0_3_radr),
      .wadr(yt_rsc_0_3_wadr),
      .we(yt_rsc_0_3_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_0_4_comp (
      .clk(clk),
      .clken(yt_rsc_0_4_clken),
      .d(yt_rsc_0_4_d),
      .q(yt_rsc_0_4_q),
      .radr(yt_rsc_0_4_radr),
      .wadr(yt_rsc_0_4_wadr),
      .we(yt_rsc_0_4_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_0_5_comp (
      .clk(clk),
      .clken(yt_rsc_0_5_clken),
      .d(yt_rsc_0_5_d),
      .q(yt_rsc_0_5_q),
      .radr(yt_rsc_0_5_radr),
      .wadr(yt_rsc_0_5_wadr),
      .we(yt_rsc_0_5_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_0_6_comp (
      .clk(clk),
      .clken(yt_rsc_0_6_clken),
      .d(yt_rsc_0_6_d),
      .q(yt_rsc_0_6_q),
      .radr(yt_rsc_0_6_radr),
      .wadr(yt_rsc_0_6_wadr),
      .we(yt_rsc_0_6_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_0_7_comp (
      .clk(clk),
      .clken(yt_rsc_0_7_clken),
      .d(yt_rsc_0_7_d),
      .q(yt_rsc_0_7_q),
      .radr(yt_rsc_0_7_radr),
      .wadr(yt_rsc_0_7_wadr),
      .we(yt_rsc_0_7_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_1_0_comp (
      .clk(clk),
      .clken(yt_rsc_1_0_clken),
      .d(yt_rsc_1_0_d),
      .q(yt_rsc_1_0_q),
      .radr(yt_rsc_1_0_radr),
      .wadr(yt_rsc_1_0_wadr),
      .we(yt_rsc_1_0_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_1_1_comp (
      .clk(clk),
      .clken(yt_rsc_1_1_clken),
      .d(yt_rsc_1_1_d),
      .q(yt_rsc_1_1_q),
      .radr(yt_rsc_1_1_radr),
      .wadr(yt_rsc_1_1_wadr),
      .we(yt_rsc_1_1_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_1_2_comp (
      .clk(clk),
      .clken(yt_rsc_1_2_clken),
      .d(yt_rsc_1_2_d),
      .q(yt_rsc_1_2_q),
      .radr(yt_rsc_1_2_radr),
      .wadr(yt_rsc_1_2_wadr),
      .we(yt_rsc_1_2_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_1_3_comp (
      .clk(clk),
      .clken(yt_rsc_1_3_clken),
      .d(yt_rsc_1_3_d),
      .q(yt_rsc_1_3_q),
      .radr(yt_rsc_1_3_radr),
      .wadr(yt_rsc_1_3_wadr),
      .we(yt_rsc_1_3_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_1_4_comp (
      .clk(clk),
      .clken(yt_rsc_1_4_clken),
      .d(yt_rsc_1_4_d),
      .q(yt_rsc_1_4_q),
      .radr(yt_rsc_1_4_radr),
      .wadr(yt_rsc_1_4_wadr),
      .we(yt_rsc_1_4_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_1_5_comp (
      .clk(clk),
      .clken(yt_rsc_1_5_clken),
      .d(yt_rsc_1_5_d),
      .q(yt_rsc_1_5_q),
      .radr(yt_rsc_1_5_radr),
      .wadr(yt_rsc_1_5_wadr),
      .we(yt_rsc_1_5_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_1_6_comp (
      .clk(clk),
      .clken(yt_rsc_1_6_clken),
      .d(yt_rsc_1_6_d),
      .q(yt_rsc_1_6_q),
      .radr(yt_rsc_1_6_radr),
      .wadr(yt_rsc_1_6_wadr),
      .we(yt_rsc_1_6_we)
    );
  BLOCK_1R1W_RBW #(.addr_width(32'sd6),
  .data_width(32'sd32),
  .depth(32'sd64),
  .latency(32'sd1)) yt_rsc_1_7_comp (
      .clk(clk),
      .clken(yt_rsc_1_7_clken),
      .d(yt_rsc_1_7_d),
      .q(yt_rsc_1_7_q),
      .radr(yt_rsc_1_7_radr),
      .wadr(yt_rsc_1_7_wadr),
      .we(yt_rsc_1_7_we)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_6_32_64_64_32_1_gen yt_rsc_0_0_i
      (
      .clken(yt_rsc_0_0_clken),
      .q(yt_rsc_0_0_q),
      .radr(yt_rsc_0_0_radr),
      .we(yt_rsc_0_0_we),
      .d(yt_rsc_0_0_d),
      .wadr(yt_rsc_0_0_wadr),
      .clken_d(yt_rsc_0_0_i_clken_d),
      .d_d(yt_rsc_0_0_i_d_d_iff),
      .q_d(yt_rsc_0_0_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_0_i_wadr_d_iff),
      .we_d(yt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_6_32_64_64_32_1_gen yt_rsc_0_1_i
      (
      .clken(yt_rsc_0_1_clken),
      .q(yt_rsc_0_1_q),
      .radr(yt_rsc_0_1_radr),
      .we(yt_rsc_0_1_we),
      .d(yt_rsc_0_1_d),
      .wadr(yt_rsc_0_1_wadr),
      .clken_d(yt_rsc_0_0_i_clken_d),
      .d_d(yt_rsc_0_1_i_d_d_iff),
      .q_d(yt_rsc_0_1_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_0_i_wadr_d_iff),
      .we_d(yt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_6_32_64_64_32_1_gen yt_rsc_0_2_i
      (
      .clken(yt_rsc_0_2_clken),
      .q(yt_rsc_0_2_q),
      .radr(yt_rsc_0_2_radr),
      .we(yt_rsc_0_2_we),
      .d(yt_rsc_0_2_d),
      .wadr(yt_rsc_0_2_wadr),
      .clken_d(yt_rsc_0_0_i_clken_d),
      .d_d(yt_rsc_0_2_i_d_d_iff),
      .q_d(yt_rsc_0_2_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_0_i_wadr_d_iff),
      .we_d(yt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_6_32_64_64_32_1_gen yt_rsc_0_3_i
      (
      .clken(yt_rsc_0_3_clken),
      .q(yt_rsc_0_3_q),
      .radr(yt_rsc_0_3_radr),
      .we(yt_rsc_0_3_we),
      .d(yt_rsc_0_3_d),
      .wadr(yt_rsc_0_3_wadr),
      .clken_d(yt_rsc_0_0_i_clken_d),
      .d_d(yt_rsc_0_3_i_d_d_iff),
      .q_d(yt_rsc_0_3_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_0_i_wadr_d_iff),
      .we_d(yt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_6_32_64_64_32_1_gen yt_rsc_0_4_i
      (
      .clken(yt_rsc_0_4_clken),
      .q(yt_rsc_0_4_q),
      .radr(yt_rsc_0_4_radr),
      .we(yt_rsc_0_4_we),
      .d(yt_rsc_0_4_d),
      .wadr(yt_rsc_0_4_wadr),
      .clken_d(yt_rsc_0_4_i_clken_d),
      .d_d(yt_rsc_0_0_i_d_d_iff),
      .q_d(yt_rsc_0_4_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_4_i_wadr_d_iff),
      .we_d(yt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_6_32_64_64_32_1_gen yt_rsc_0_5_i
      (
      .clken(yt_rsc_0_5_clken),
      .q(yt_rsc_0_5_q),
      .radr(yt_rsc_0_5_radr),
      .we(yt_rsc_0_5_we),
      .d(yt_rsc_0_5_d),
      .wadr(yt_rsc_0_5_wadr),
      .clken_d(yt_rsc_0_4_i_clken_d),
      .d_d(yt_rsc_0_1_i_d_d_iff),
      .q_d(yt_rsc_0_5_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_4_i_wadr_d_iff),
      .we_d(yt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_6_32_64_64_32_1_gen yt_rsc_0_6_i
      (
      .clken(yt_rsc_0_6_clken),
      .q(yt_rsc_0_6_q),
      .radr(yt_rsc_0_6_radr),
      .we(yt_rsc_0_6_we),
      .d(yt_rsc_0_6_d),
      .wadr(yt_rsc_0_6_wadr),
      .clken_d(yt_rsc_0_4_i_clken_d),
      .d_d(yt_rsc_0_2_i_d_d_iff),
      .q_d(yt_rsc_0_6_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_4_i_wadr_d_iff),
      .we_d(yt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_6_32_64_64_32_1_gen yt_rsc_0_7_i
      (
      .clken(yt_rsc_0_7_clken),
      .q(yt_rsc_0_7_q),
      .radr(yt_rsc_0_7_radr),
      .we(yt_rsc_0_7_we),
      .d(yt_rsc_0_7_d),
      .wadr(yt_rsc_0_7_wadr),
      .clken_d(yt_rsc_0_4_i_clken_d),
      .d_d(yt_rsc_0_3_i_d_d_iff),
      .q_d(yt_rsc_0_7_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_4_i_wadr_d_iff),
      .we_d(yt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_15_6_32_64_64_32_1_gen yt_rsc_1_0_i
      (
      .clken(yt_rsc_1_0_clken),
      .q(yt_rsc_1_0_q),
      .radr(yt_rsc_1_0_radr),
      .we(yt_rsc_1_0_we),
      .d(yt_rsc_1_0_d),
      .wadr(yt_rsc_1_0_wadr),
      .clken_d(yt_rsc_1_0_i_clken_d),
      .d_d(yt_rsc_1_0_i_d_d_iff),
      .q_d(yt_rsc_1_0_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_0_i_wadr_d_iff),
      .we_d(yt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_16_6_32_64_64_32_1_gen yt_rsc_1_1_i
      (
      .clken(yt_rsc_1_1_clken),
      .q(yt_rsc_1_1_q),
      .radr(yt_rsc_1_1_radr),
      .we(yt_rsc_1_1_we),
      .d(yt_rsc_1_1_d),
      .wadr(yt_rsc_1_1_wadr),
      .clken_d(yt_rsc_1_0_i_clken_d),
      .d_d(yt_rsc_1_1_i_d_d_iff),
      .q_d(yt_rsc_1_1_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_0_i_wadr_d_iff),
      .we_d(yt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_17_6_32_64_64_32_1_gen yt_rsc_1_2_i
      (
      .clken(yt_rsc_1_2_clken),
      .q(yt_rsc_1_2_q),
      .radr(yt_rsc_1_2_radr),
      .we(yt_rsc_1_2_we),
      .d(yt_rsc_1_2_d),
      .wadr(yt_rsc_1_2_wadr),
      .clken_d(yt_rsc_1_0_i_clken_d),
      .d_d(yt_rsc_1_2_i_d_d_iff),
      .q_d(yt_rsc_1_2_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_0_i_wadr_d_iff),
      .we_d(yt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_18_6_32_64_64_32_1_gen yt_rsc_1_3_i
      (
      .clken(yt_rsc_1_3_clken),
      .q(yt_rsc_1_3_q),
      .radr(yt_rsc_1_3_radr),
      .we(yt_rsc_1_3_we),
      .d(yt_rsc_1_3_d),
      .wadr(yt_rsc_1_3_wadr),
      .clken_d(yt_rsc_1_0_i_clken_d),
      .d_d(yt_rsc_1_3_i_d_d_iff),
      .q_d(yt_rsc_1_3_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_0_i_wadr_d_iff),
      .we_d(yt_rsc_0_0_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_19_6_32_64_64_32_1_gen yt_rsc_1_4_i
      (
      .clken(yt_rsc_1_4_clken),
      .q(yt_rsc_1_4_q),
      .radr(yt_rsc_1_4_radr),
      .we(yt_rsc_1_4_we),
      .d(yt_rsc_1_4_d),
      .wadr(yt_rsc_1_4_wadr),
      .clken_d(yt_rsc_1_4_i_clken_d),
      .d_d(yt_rsc_1_0_i_d_d_iff),
      .q_d(yt_rsc_1_4_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_4_i_wadr_d_iff),
      .we_d(yt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_20_6_32_64_64_32_1_gen yt_rsc_1_5_i
      (
      .clken(yt_rsc_1_5_clken),
      .q(yt_rsc_1_5_q),
      .radr(yt_rsc_1_5_radr),
      .we(yt_rsc_1_5_we),
      .d(yt_rsc_1_5_d),
      .wadr(yt_rsc_1_5_wadr),
      .clken_d(yt_rsc_1_4_i_clken_d),
      .d_d(yt_rsc_1_1_i_d_d_iff),
      .q_d(yt_rsc_1_5_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_4_i_wadr_d_iff),
      .we_d(yt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_21_6_32_64_64_32_1_gen yt_rsc_1_6_i
      (
      .clken(yt_rsc_1_6_clken),
      .q(yt_rsc_1_6_q),
      .radr(yt_rsc_1_6_radr),
      .we(yt_rsc_1_6_we),
      .d(yt_rsc_1_6_d),
      .wadr(yt_rsc_1_6_wadr),
      .clken_d(yt_rsc_1_4_i_clken_d),
      .d_d(yt_rsc_1_2_i_d_d_iff),
      .q_d(yt_rsc_1_6_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_4_i_wadr_d_iff),
      .we_d(yt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_22_6_32_64_64_32_1_gen yt_rsc_1_7_i
      (
      .clken(yt_rsc_1_7_clken),
      .q(yt_rsc_1_7_q),
      .radr(yt_rsc_1_7_radr),
      .we(yt_rsc_1_7_we),
      .d(yt_rsc_1_7_d),
      .wadr(yt_rsc_1_7_wadr),
      .clken_d(yt_rsc_1_4_i_clken_d),
      .d_d(yt_rsc_1_3_i_d_d_iff),
      .q_d(yt_rsc_1_7_i_q_d),
      .radr_d(yt_rsc_0_0_i_radr_d_iff),
      .wadr_d(yt_rsc_0_4_i_wadr_d_iff),
      .we_d(yt_rsc_0_4_i_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_23_7_32_128_128_32_1_gen xt_rsc_0_0_i
      (
      .qb(xt_rsc_0_0_qb),
      .web(xt_rsc_0_0_web),
      .db(xt_rsc_0_0_db),
      .adrb(xt_rsc_0_0_adrb),
      .qa(xt_rsc_0_0_qa),
      .wea(xt_rsc_0_0_wea),
      .da(xt_rsc_0_0_da),
      .adra(xt_rsc_0_0_adra),
      .adra_d(nl_xt_rsc_0_0_i_adra_d[13:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_xt_rsc_0_0_i_da_d[63:0]),
      .qa_d(xt_rsc_0_0_i_qa_d),
      .wea_d(xt_rsc_0_0_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_24_7_32_128_128_32_1_gen xt_rsc_0_1_i
      (
      .qb(xt_rsc_0_1_qb),
      .web(xt_rsc_0_1_web),
      .db(xt_rsc_0_1_db),
      .adrb(xt_rsc_0_1_adrb),
      .qa(xt_rsc_0_1_qa),
      .wea(xt_rsc_0_1_wea),
      .da(xt_rsc_0_1_da),
      .adra(xt_rsc_0_1_adra),
      .adra_d(nl_xt_rsc_0_1_i_adra_d[13:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_xt_rsc_0_1_i_da_d[63:0]),
      .qa_d(xt_rsc_0_1_i_qa_d),
      .wea_d(xt_rsc_0_1_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_25_7_32_128_128_32_1_gen xt_rsc_0_2_i
      (
      .qb(xt_rsc_0_2_qb),
      .web(xt_rsc_0_2_web),
      .db(xt_rsc_0_2_db),
      .adrb(xt_rsc_0_2_adrb),
      .qa(xt_rsc_0_2_qa),
      .wea(xt_rsc_0_2_wea),
      .da(xt_rsc_0_2_da),
      .adra(xt_rsc_0_2_adra),
      .adra_d(nl_xt_rsc_0_2_i_adra_d[13:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_xt_rsc_0_2_i_da_d[63:0]),
      .qa_d(xt_rsc_0_2_i_qa_d),
      .wea_d(xt_rsc_0_2_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_26_7_32_128_128_32_1_gen xt_rsc_0_3_i
      (
      .qb(xt_rsc_0_3_qb),
      .web(xt_rsc_0_3_web),
      .db(xt_rsc_0_3_db),
      .adrb(xt_rsc_0_3_adrb),
      .qa(xt_rsc_0_3_qa),
      .wea(xt_rsc_0_3_wea),
      .da(xt_rsc_0_3_da),
      .adra(xt_rsc_0_3_adra),
      .adra_d(nl_xt_rsc_0_3_i_adra_d[13:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_xt_rsc_0_3_i_da_d[63:0]),
      .qa_d(xt_rsc_0_3_i_qa_d),
      .wea_d(xt_rsc_0_3_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_27_7_32_128_128_32_1_gen xt_rsc_0_4_i
      (
      .qb(xt_rsc_0_4_qb),
      .web(xt_rsc_0_4_web),
      .db(xt_rsc_0_4_db),
      .adrb(xt_rsc_0_4_adrb),
      .qa(xt_rsc_0_4_qa),
      .wea(xt_rsc_0_4_wea),
      .da(xt_rsc_0_4_da),
      .adra(xt_rsc_0_4_adra),
      .adra_d(nl_xt_rsc_0_4_i_adra_d[13:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_xt_rsc_0_4_i_da_d[63:0]),
      .qa_d(xt_rsc_0_4_i_qa_d),
      .wea_d(xt_rsc_0_4_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_28_7_32_128_128_32_1_gen xt_rsc_0_5_i
      (
      .qb(xt_rsc_0_5_qb),
      .web(xt_rsc_0_5_web),
      .db(xt_rsc_0_5_db),
      .adrb(xt_rsc_0_5_adrb),
      .qa(xt_rsc_0_5_qa),
      .wea(xt_rsc_0_5_wea),
      .da(xt_rsc_0_5_da),
      .adra(xt_rsc_0_5_adra),
      .adra_d(nl_xt_rsc_0_5_i_adra_d[13:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_xt_rsc_0_5_i_da_d[63:0]),
      .qa_d(xt_rsc_0_5_i_qa_d),
      .wea_d(xt_rsc_0_5_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_29_7_32_128_128_32_1_gen xt_rsc_0_6_i
      (
      .qb(xt_rsc_0_6_qb),
      .web(xt_rsc_0_6_web),
      .db(xt_rsc_0_6_db),
      .adrb(xt_rsc_0_6_adrb),
      .qa(xt_rsc_0_6_qa),
      .wea(xt_rsc_0_6_wea),
      .da(xt_rsc_0_6_da),
      .adra(xt_rsc_0_6_adra),
      .adra_d(nl_xt_rsc_0_6_i_adra_d[13:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_xt_rsc_0_6_i_da_d[63:0]),
      .qa_d(xt_rsc_0_6_i_qa_d),
      .wea_d(xt_rsc_0_6_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_30_7_32_128_128_32_1_gen xt_rsc_0_7_i
      (
      .qb(xt_rsc_0_7_qb),
      .web(xt_rsc_0_7_web),
      .db(xt_rsc_0_7_db),
      .adrb(xt_rsc_0_7_adrb),
      .qa(xt_rsc_0_7_qa),
      .wea(xt_rsc_0_7_wea),
      .da(xt_rsc_0_7_da),
      .adra(xt_rsc_0_7_adra),
      .adra_d(nl_xt_rsc_0_7_i_adra_d[13:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_xt_rsc_0_7_i_da_d[63:0]),
      .qa_d(xt_rsc_0_7_i_qa_d),
      .wea_d(xt_rsc_0_7_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  peaseNTT_core peaseNTT_core_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_triosy_0_0_lz(xt_rsc_triosy_0_0_lz),
      .xt_rsc_triosy_0_1_lz(xt_rsc_triosy_0_1_lz),
      .xt_rsc_triosy_0_2_lz(xt_rsc_triosy_0_2_lz),
      .xt_rsc_triosy_0_3_lz(xt_rsc_triosy_0_3_lz),
      .xt_rsc_triosy_0_4_lz(xt_rsc_triosy_0_4_lz),
      .xt_rsc_triosy_0_5_lz(xt_rsc_triosy_0_5_lz),
      .xt_rsc_triosy_0_6_lz(xt_rsc_triosy_0_6_lz),
      .xt_rsc_triosy_0_7_lz(xt_rsc_triosy_0_7_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_0_0_s_tdone(twiddle_rsc_0_0_s_tdone),
      .twiddle_rsc_0_0_tr_write_done(twiddle_rsc_0_0_tr_write_done),
      .twiddle_rsc_0_0_RREADY(twiddle_rsc_0_0_RREADY),
      .twiddle_rsc_0_0_RVALID(twiddle_rsc_0_0_RVALID),
      .twiddle_rsc_0_0_RUSER(twiddle_rsc_0_0_RUSER),
      .twiddle_rsc_0_0_RLAST(twiddle_rsc_0_0_RLAST),
      .twiddle_rsc_0_0_RRESP(twiddle_rsc_0_0_RRESP),
      .twiddle_rsc_0_0_RDATA(twiddle_rsc_0_0_RDATA),
      .twiddle_rsc_0_0_RID(twiddle_rsc_0_0_RID),
      .twiddle_rsc_0_0_ARREADY(twiddle_rsc_0_0_ARREADY),
      .twiddle_rsc_0_0_ARVALID(twiddle_rsc_0_0_ARVALID),
      .twiddle_rsc_0_0_ARUSER(twiddle_rsc_0_0_ARUSER),
      .twiddle_rsc_0_0_ARREGION(twiddle_rsc_0_0_ARREGION),
      .twiddle_rsc_0_0_ARQOS(twiddle_rsc_0_0_ARQOS),
      .twiddle_rsc_0_0_ARPROT(twiddle_rsc_0_0_ARPROT),
      .twiddle_rsc_0_0_ARCACHE(twiddle_rsc_0_0_ARCACHE),
      .twiddle_rsc_0_0_ARLOCK(twiddle_rsc_0_0_ARLOCK),
      .twiddle_rsc_0_0_ARBURST(twiddle_rsc_0_0_ARBURST),
      .twiddle_rsc_0_0_ARSIZE(twiddle_rsc_0_0_ARSIZE),
      .twiddle_rsc_0_0_ARLEN(twiddle_rsc_0_0_ARLEN),
      .twiddle_rsc_0_0_ARADDR(twiddle_rsc_0_0_ARADDR),
      .twiddle_rsc_0_0_ARID(twiddle_rsc_0_0_ARID),
      .twiddle_rsc_0_0_BREADY(twiddle_rsc_0_0_BREADY),
      .twiddle_rsc_0_0_BVALID(twiddle_rsc_0_0_BVALID),
      .twiddle_rsc_0_0_BUSER(twiddle_rsc_0_0_BUSER),
      .twiddle_rsc_0_0_BRESP(twiddle_rsc_0_0_BRESP),
      .twiddle_rsc_0_0_BID(twiddle_rsc_0_0_BID),
      .twiddle_rsc_0_0_WREADY(twiddle_rsc_0_0_WREADY),
      .twiddle_rsc_0_0_WVALID(twiddle_rsc_0_0_WVALID),
      .twiddle_rsc_0_0_WUSER(twiddle_rsc_0_0_WUSER),
      .twiddle_rsc_0_0_WLAST(twiddle_rsc_0_0_WLAST),
      .twiddle_rsc_0_0_WSTRB(twiddle_rsc_0_0_WSTRB),
      .twiddle_rsc_0_0_WDATA(twiddle_rsc_0_0_WDATA),
      .twiddle_rsc_0_0_AWREADY(twiddle_rsc_0_0_AWREADY),
      .twiddle_rsc_0_0_AWVALID(twiddle_rsc_0_0_AWVALID),
      .twiddle_rsc_0_0_AWUSER(twiddle_rsc_0_0_AWUSER),
      .twiddle_rsc_0_0_AWREGION(twiddle_rsc_0_0_AWREGION),
      .twiddle_rsc_0_0_AWQOS(twiddle_rsc_0_0_AWQOS),
      .twiddle_rsc_0_0_AWPROT(twiddle_rsc_0_0_AWPROT),
      .twiddle_rsc_0_0_AWCACHE(twiddle_rsc_0_0_AWCACHE),
      .twiddle_rsc_0_0_AWLOCK(twiddle_rsc_0_0_AWLOCK),
      .twiddle_rsc_0_0_AWBURST(twiddle_rsc_0_0_AWBURST),
      .twiddle_rsc_0_0_AWSIZE(twiddle_rsc_0_0_AWSIZE),
      .twiddle_rsc_0_0_AWLEN(twiddle_rsc_0_0_AWLEN),
      .twiddle_rsc_0_0_AWADDR(twiddle_rsc_0_0_AWADDR),
      .twiddle_rsc_0_0_AWID(twiddle_rsc_0_0_AWID),
      .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
      .twiddle_rsc_0_1_s_tdone(twiddle_rsc_0_1_s_tdone),
      .twiddle_rsc_0_1_tr_write_done(twiddle_rsc_0_1_tr_write_done),
      .twiddle_rsc_0_1_RREADY(twiddle_rsc_0_1_RREADY),
      .twiddle_rsc_0_1_RVALID(twiddle_rsc_0_1_RVALID),
      .twiddle_rsc_0_1_RUSER(twiddle_rsc_0_1_RUSER),
      .twiddle_rsc_0_1_RLAST(twiddle_rsc_0_1_RLAST),
      .twiddle_rsc_0_1_RRESP(twiddle_rsc_0_1_RRESP),
      .twiddle_rsc_0_1_RDATA(twiddle_rsc_0_1_RDATA),
      .twiddle_rsc_0_1_RID(twiddle_rsc_0_1_RID),
      .twiddle_rsc_0_1_ARREADY(twiddle_rsc_0_1_ARREADY),
      .twiddle_rsc_0_1_ARVALID(twiddle_rsc_0_1_ARVALID),
      .twiddle_rsc_0_1_ARUSER(twiddle_rsc_0_1_ARUSER),
      .twiddle_rsc_0_1_ARREGION(twiddle_rsc_0_1_ARREGION),
      .twiddle_rsc_0_1_ARQOS(twiddle_rsc_0_1_ARQOS),
      .twiddle_rsc_0_1_ARPROT(twiddle_rsc_0_1_ARPROT),
      .twiddle_rsc_0_1_ARCACHE(twiddle_rsc_0_1_ARCACHE),
      .twiddle_rsc_0_1_ARLOCK(twiddle_rsc_0_1_ARLOCK),
      .twiddle_rsc_0_1_ARBURST(twiddle_rsc_0_1_ARBURST),
      .twiddle_rsc_0_1_ARSIZE(twiddle_rsc_0_1_ARSIZE),
      .twiddle_rsc_0_1_ARLEN(twiddle_rsc_0_1_ARLEN),
      .twiddle_rsc_0_1_ARADDR(twiddle_rsc_0_1_ARADDR),
      .twiddle_rsc_0_1_ARID(twiddle_rsc_0_1_ARID),
      .twiddle_rsc_0_1_BREADY(twiddle_rsc_0_1_BREADY),
      .twiddle_rsc_0_1_BVALID(twiddle_rsc_0_1_BVALID),
      .twiddle_rsc_0_1_BUSER(twiddle_rsc_0_1_BUSER),
      .twiddle_rsc_0_1_BRESP(twiddle_rsc_0_1_BRESP),
      .twiddle_rsc_0_1_BID(twiddle_rsc_0_1_BID),
      .twiddle_rsc_0_1_WREADY(twiddle_rsc_0_1_WREADY),
      .twiddle_rsc_0_1_WVALID(twiddle_rsc_0_1_WVALID),
      .twiddle_rsc_0_1_WUSER(twiddle_rsc_0_1_WUSER),
      .twiddle_rsc_0_1_WLAST(twiddle_rsc_0_1_WLAST),
      .twiddle_rsc_0_1_WSTRB(twiddle_rsc_0_1_WSTRB),
      .twiddle_rsc_0_1_WDATA(twiddle_rsc_0_1_WDATA),
      .twiddle_rsc_0_1_AWREADY(twiddle_rsc_0_1_AWREADY),
      .twiddle_rsc_0_1_AWVALID(twiddle_rsc_0_1_AWVALID),
      .twiddle_rsc_0_1_AWUSER(twiddle_rsc_0_1_AWUSER),
      .twiddle_rsc_0_1_AWREGION(twiddle_rsc_0_1_AWREGION),
      .twiddle_rsc_0_1_AWQOS(twiddle_rsc_0_1_AWQOS),
      .twiddle_rsc_0_1_AWPROT(twiddle_rsc_0_1_AWPROT),
      .twiddle_rsc_0_1_AWCACHE(twiddle_rsc_0_1_AWCACHE),
      .twiddle_rsc_0_1_AWLOCK(twiddle_rsc_0_1_AWLOCK),
      .twiddle_rsc_0_1_AWBURST(twiddle_rsc_0_1_AWBURST),
      .twiddle_rsc_0_1_AWSIZE(twiddle_rsc_0_1_AWSIZE),
      .twiddle_rsc_0_1_AWLEN(twiddle_rsc_0_1_AWLEN),
      .twiddle_rsc_0_1_AWADDR(twiddle_rsc_0_1_AWADDR),
      .twiddle_rsc_0_1_AWID(twiddle_rsc_0_1_AWID),
      .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
      .twiddle_rsc_0_2_s_tdone(twiddle_rsc_0_2_s_tdone),
      .twiddle_rsc_0_2_tr_write_done(twiddle_rsc_0_2_tr_write_done),
      .twiddle_rsc_0_2_RREADY(twiddle_rsc_0_2_RREADY),
      .twiddle_rsc_0_2_RVALID(twiddle_rsc_0_2_RVALID),
      .twiddle_rsc_0_2_RUSER(twiddle_rsc_0_2_RUSER),
      .twiddle_rsc_0_2_RLAST(twiddle_rsc_0_2_RLAST),
      .twiddle_rsc_0_2_RRESP(twiddle_rsc_0_2_RRESP),
      .twiddle_rsc_0_2_RDATA(twiddle_rsc_0_2_RDATA),
      .twiddle_rsc_0_2_RID(twiddle_rsc_0_2_RID),
      .twiddle_rsc_0_2_ARREADY(twiddle_rsc_0_2_ARREADY),
      .twiddle_rsc_0_2_ARVALID(twiddle_rsc_0_2_ARVALID),
      .twiddle_rsc_0_2_ARUSER(twiddle_rsc_0_2_ARUSER),
      .twiddle_rsc_0_2_ARREGION(twiddle_rsc_0_2_ARREGION),
      .twiddle_rsc_0_2_ARQOS(twiddle_rsc_0_2_ARQOS),
      .twiddle_rsc_0_2_ARPROT(twiddle_rsc_0_2_ARPROT),
      .twiddle_rsc_0_2_ARCACHE(twiddle_rsc_0_2_ARCACHE),
      .twiddle_rsc_0_2_ARLOCK(twiddle_rsc_0_2_ARLOCK),
      .twiddle_rsc_0_2_ARBURST(twiddle_rsc_0_2_ARBURST),
      .twiddle_rsc_0_2_ARSIZE(twiddle_rsc_0_2_ARSIZE),
      .twiddle_rsc_0_2_ARLEN(twiddle_rsc_0_2_ARLEN),
      .twiddle_rsc_0_2_ARADDR(twiddle_rsc_0_2_ARADDR),
      .twiddle_rsc_0_2_ARID(twiddle_rsc_0_2_ARID),
      .twiddle_rsc_0_2_BREADY(twiddle_rsc_0_2_BREADY),
      .twiddle_rsc_0_2_BVALID(twiddle_rsc_0_2_BVALID),
      .twiddle_rsc_0_2_BUSER(twiddle_rsc_0_2_BUSER),
      .twiddle_rsc_0_2_BRESP(twiddle_rsc_0_2_BRESP),
      .twiddle_rsc_0_2_BID(twiddle_rsc_0_2_BID),
      .twiddle_rsc_0_2_WREADY(twiddle_rsc_0_2_WREADY),
      .twiddle_rsc_0_2_WVALID(twiddle_rsc_0_2_WVALID),
      .twiddle_rsc_0_2_WUSER(twiddle_rsc_0_2_WUSER),
      .twiddle_rsc_0_2_WLAST(twiddle_rsc_0_2_WLAST),
      .twiddle_rsc_0_2_WSTRB(twiddle_rsc_0_2_WSTRB),
      .twiddle_rsc_0_2_WDATA(twiddle_rsc_0_2_WDATA),
      .twiddle_rsc_0_2_AWREADY(twiddle_rsc_0_2_AWREADY),
      .twiddle_rsc_0_2_AWVALID(twiddle_rsc_0_2_AWVALID),
      .twiddle_rsc_0_2_AWUSER(twiddle_rsc_0_2_AWUSER),
      .twiddle_rsc_0_2_AWREGION(twiddle_rsc_0_2_AWREGION),
      .twiddle_rsc_0_2_AWQOS(twiddle_rsc_0_2_AWQOS),
      .twiddle_rsc_0_2_AWPROT(twiddle_rsc_0_2_AWPROT),
      .twiddle_rsc_0_2_AWCACHE(twiddle_rsc_0_2_AWCACHE),
      .twiddle_rsc_0_2_AWLOCK(twiddle_rsc_0_2_AWLOCK),
      .twiddle_rsc_0_2_AWBURST(twiddle_rsc_0_2_AWBURST),
      .twiddle_rsc_0_2_AWSIZE(twiddle_rsc_0_2_AWSIZE),
      .twiddle_rsc_0_2_AWLEN(twiddle_rsc_0_2_AWLEN),
      .twiddle_rsc_0_2_AWADDR(twiddle_rsc_0_2_AWADDR),
      .twiddle_rsc_0_2_AWID(twiddle_rsc_0_2_AWID),
      .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
      .twiddle_rsc_0_3_s_tdone(twiddle_rsc_0_3_s_tdone),
      .twiddle_rsc_0_3_tr_write_done(twiddle_rsc_0_3_tr_write_done),
      .twiddle_rsc_0_3_RREADY(twiddle_rsc_0_3_RREADY),
      .twiddle_rsc_0_3_RVALID(twiddle_rsc_0_3_RVALID),
      .twiddle_rsc_0_3_RUSER(twiddle_rsc_0_3_RUSER),
      .twiddle_rsc_0_3_RLAST(twiddle_rsc_0_3_RLAST),
      .twiddle_rsc_0_3_RRESP(twiddle_rsc_0_3_RRESP),
      .twiddle_rsc_0_3_RDATA(twiddle_rsc_0_3_RDATA),
      .twiddle_rsc_0_3_RID(twiddle_rsc_0_3_RID),
      .twiddle_rsc_0_3_ARREADY(twiddle_rsc_0_3_ARREADY),
      .twiddle_rsc_0_3_ARVALID(twiddle_rsc_0_3_ARVALID),
      .twiddle_rsc_0_3_ARUSER(twiddle_rsc_0_3_ARUSER),
      .twiddle_rsc_0_3_ARREGION(twiddle_rsc_0_3_ARREGION),
      .twiddle_rsc_0_3_ARQOS(twiddle_rsc_0_3_ARQOS),
      .twiddle_rsc_0_3_ARPROT(twiddle_rsc_0_3_ARPROT),
      .twiddle_rsc_0_3_ARCACHE(twiddle_rsc_0_3_ARCACHE),
      .twiddle_rsc_0_3_ARLOCK(twiddle_rsc_0_3_ARLOCK),
      .twiddle_rsc_0_3_ARBURST(twiddle_rsc_0_3_ARBURST),
      .twiddle_rsc_0_3_ARSIZE(twiddle_rsc_0_3_ARSIZE),
      .twiddle_rsc_0_3_ARLEN(twiddle_rsc_0_3_ARLEN),
      .twiddle_rsc_0_3_ARADDR(twiddle_rsc_0_3_ARADDR),
      .twiddle_rsc_0_3_ARID(twiddle_rsc_0_3_ARID),
      .twiddle_rsc_0_3_BREADY(twiddle_rsc_0_3_BREADY),
      .twiddle_rsc_0_3_BVALID(twiddle_rsc_0_3_BVALID),
      .twiddle_rsc_0_3_BUSER(twiddle_rsc_0_3_BUSER),
      .twiddle_rsc_0_3_BRESP(twiddle_rsc_0_3_BRESP),
      .twiddle_rsc_0_3_BID(twiddle_rsc_0_3_BID),
      .twiddle_rsc_0_3_WREADY(twiddle_rsc_0_3_WREADY),
      .twiddle_rsc_0_3_WVALID(twiddle_rsc_0_3_WVALID),
      .twiddle_rsc_0_3_WUSER(twiddle_rsc_0_3_WUSER),
      .twiddle_rsc_0_3_WLAST(twiddle_rsc_0_3_WLAST),
      .twiddle_rsc_0_3_WSTRB(twiddle_rsc_0_3_WSTRB),
      .twiddle_rsc_0_3_WDATA(twiddle_rsc_0_3_WDATA),
      .twiddle_rsc_0_3_AWREADY(twiddle_rsc_0_3_AWREADY),
      .twiddle_rsc_0_3_AWVALID(twiddle_rsc_0_3_AWVALID),
      .twiddle_rsc_0_3_AWUSER(twiddle_rsc_0_3_AWUSER),
      .twiddle_rsc_0_3_AWREGION(twiddle_rsc_0_3_AWREGION),
      .twiddle_rsc_0_3_AWQOS(twiddle_rsc_0_3_AWQOS),
      .twiddle_rsc_0_3_AWPROT(twiddle_rsc_0_3_AWPROT),
      .twiddle_rsc_0_3_AWCACHE(twiddle_rsc_0_3_AWCACHE),
      .twiddle_rsc_0_3_AWLOCK(twiddle_rsc_0_3_AWLOCK),
      .twiddle_rsc_0_3_AWBURST(twiddle_rsc_0_3_AWBURST),
      .twiddle_rsc_0_3_AWSIZE(twiddle_rsc_0_3_AWSIZE),
      .twiddle_rsc_0_3_AWLEN(twiddle_rsc_0_3_AWLEN),
      .twiddle_rsc_0_3_AWADDR(twiddle_rsc_0_3_AWADDR),
      .twiddle_rsc_0_3_AWID(twiddle_rsc_0_3_AWID),
      .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
      .twiddle_h_rsc_0_0_s_tdone(twiddle_h_rsc_0_0_s_tdone),
      .twiddle_h_rsc_0_0_tr_write_done(twiddle_h_rsc_0_0_tr_write_done),
      .twiddle_h_rsc_0_0_RREADY(twiddle_h_rsc_0_0_RREADY),
      .twiddle_h_rsc_0_0_RVALID(twiddle_h_rsc_0_0_RVALID),
      .twiddle_h_rsc_0_0_RUSER(twiddle_h_rsc_0_0_RUSER),
      .twiddle_h_rsc_0_0_RLAST(twiddle_h_rsc_0_0_RLAST),
      .twiddle_h_rsc_0_0_RRESP(twiddle_h_rsc_0_0_RRESP),
      .twiddle_h_rsc_0_0_RDATA(twiddle_h_rsc_0_0_RDATA),
      .twiddle_h_rsc_0_0_RID(twiddle_h_rsc_0_0_RID),
      .twiddle_h_rsc_0_0_ARREADY(twiddle_h_rsc_0_0_ARREADY),
      .twiddle_h_rsc_0_0_ARVALID(twiddle_h_rsc_0_0_ARVALID),
      .twiddle_h_rsc_0_0_ARUSER(twiddle_h_rsc_0_0_ARUSER),
      .twiddle_h_rsc_0_0_ARREGION(twiddle_h_rsc_0_0_ARREGION),
      .twiddle_h_rsc_0_0_ARQOS(twiddle_h_rsc_0_0_ARQOS),
      .twiddle_h_rsc_0_0_ARPROT(twiddle_h_rsc_0_0_ARPROT),
      .twiddle_h_rsc_0_0_ARCACHE(twiddle_h_rsc_0_0_ARCACHE),
      .twiddle_h_rsc_0_0_ARLOCK(twiddle_h_rsc_0_0_ARLOCK),
      .twiddle_h_rsc_0_0_ARBURST(twiddle_h_rsc_0_0_ARBURST),
      .twiddle_h_rsc_0_0_ARSIZE(twiddle_h_rsc_0_0_ARSIZE),
      .twiddle_h_rsc_0_0_ARLEN(twiddle_h_rsc_0_0_ARLEN),
      .twiddle_h_rsc_0_0_ARADDR(twiddle_h_rsc_0_0_ARADDR),
      .twiddle_h_rsc_0_0_ARID(twiddle_h_rsc_0_0_ARID),
      .twiddle_h_rsc_0_0_BREADY(twiddle_h_rsc_0_0_BREADY),
      .twiddle_h_rsc_0_0_BVALID(twiddle_h_rsc_0_0_BVALID),
      .twiddle_h_rsc_0_0_BUSER(twiddle_h_rsc_0_0_BUSER),
      .twiddle_h_rsc_0_0_BRESP(twiddle_h_rsc_0_0_BRESP),
      .twiddle_h_rsc_0_0_BID(twiddle_h_rsc_0_0_BID),
      .twiddle_h_rsc_0_0_WREADY(twiddle_h_rsc_0_0_WREADY),
      .twiddle_h_rsc_0_0_WVALID(twiddle_h_rsc_0_0_WVALID),
      .twiddle_h_rsc_0_0_WUSER(twiddle_h_rsc_0_0_WUSER),
      .twiddle_h_rsc_0_0_WLAST(twiddle_h_rsc_0_0_WLAST),
      .twiddle_h_rsc_0_0_WSTRB(twiddle_h_rsc_0_0_WSTRB),
      .twiddle_h_rsc_0_0_WDATA(twiddle_h_rsc_0_0_WDATA),
      .twiddle_h_rsc_0_0_AWREADY(twiddle_h_rsc_0_0_AWREADY),
      .twiddle_h_rsc_0_0_AWVALID(twiddle_h_rsc_0_0_AWVALID),
      .twiddle_h_rsc_0_0_AWUSER(twiddle_h_rsc_0_0_AWUSER),
      .twiddle_h_rsc_0_0_AWREGION(twiddle_h_rsc_0_0_AWREGION),
      .twiddle_h_rsc_0_0_AWQOS(twiddle_h_rsc_0_0_AWQOS),
      .twiddle_h_rsc_0_0_AWPROT(twiddle_h_rsc_0_0_AWPROT),
      .twiddle_h_rsc_0_0_AWCACHE(twiddle_h_rsc_0_0_AWCACHE),
      .twiddle_h_rsc_0_0_AWLOCK(twiddle_h_rsc_0_0_AWLOCK),
      .twiddle_h_rsc_0_0_AWBURST(twiddle_h_rsc_0_0_AWBURST),
      .twiddle_h_rsc_0_0_AWSIZE(twiddle_h_rsc_0_0_AWSIZE),
      .twiddle_h_rsc_0_0_AWLEN(twiddle_h_rsc_0_0_AWLEN),
      .twiddle_h_rsc_0_0_AWADDR(twiddle_h_rsc_0_0_AWADDR),
      .twiddle_h_rsc_0_0_AWID(twiddle_h_rsc_0_0_AWID),
      .twiddle_h_rsc_triosy_0_0_lz(twiddle_h_rsc_triosy_0_0_lz),
      .twiddle_h_rsc_0_1_s_tdone(twiddle_h_rsc_0_1_s_tdone),
      .twiddle_h_rsc_0_1_tr_write_done(twiddle_h_rsc_0_1_tr_write_done),
      .twiddle_h_rsc_0_1_RREADY(twiddle_h_rsc_0_1_RREADY),
      .twiddle_h_rsc_0_1_RVALID(twiddle_h_rsc_0_1_RVALID),
      .twiddle_h_rsc_0_1_RUSER(twiddle_h_rsc_0_1_RUSER),
      .twiddle_h_rsc_0_1_RLAST(twiddle_h_rsc_0_1_RLAST),
      .twiddle_h_rsc_0_1_RRESP(twiddle_h_rsc_0_1_RRESP),
      .twiddle_h_rsc_0_1_RDATA(twiddle_h_rsc_0_1_RDATA),
      .twiddle_h_rsc_0_1_RID(twiddle_h_rsc_0_1_RID),
      .twiddle_h_rsc_0_1_ARREADY(twiddle_h_rsc_0_1_ARREADY),
      .twiddle_h_rsc_0_1_ARVALID(twiddle_h_rsc_0_1_ARVALID),
      .twiddle_h_rsc_0_1_ARUSER(twiddle_h_rsc_0_1_ARUSER),
      .twiddle_h_rsc_0_1_ARREGION(twiddle_h_rsc_0_1_ARREGION),
      .twiddle_h_rsc_0_1_ARQOS(twiddle_h_rsc_0_1_ARQOS),
      .twiddle_h_rsc_0_1_ARPROT(twiddle_h_rsc_0_1_ARPROT),
      .twiddle_h_rsc_0_1_ARCACHE(twiddle_h_rsc_0_1_ARCACHE),
      .twiddle_h_rsc_0_1_ARLOCK(twiddle_h_rsc_0_1_ARLOCK),
      .twiddle_h_rsc_0_1_ARBURST(twiddle_h_rsc_0_1_ARBURST),
      .twiddle_h_rsc_0_1_ARSIZE(twiddle_h_rsc_0_1_ARSIZE),
      .twiddle_h_rsc_0_1_ARLEN(twiddle_h_rsc_0_1_ARLEN),
      .twiddle_h_rsc_0_1_ARADDR(twiddle_h_rsc_0_1_ARADDR),
      .twiddle_h_rsc_0_1_ARID(twiddle_h_rsc_0_1_ARID),
      .twiddle_h_rsc_0_1_BREADY(twiddle_h_rsc_0_1_BREADY),
      .twiddle_h_rsc_0_1_BVALID(twiddle_h_rsc_0_1_BVALID),
      .twiddle_h_rsc_0_1_BUSER(twiddle_h_rsc_0_1_BUSER),
      .twiddle_h_rsc_0_1_BRESP(twiddle_h_rsc_0_1_BRESP),
      .twiddle_h_rsc_0_1_BID(twiddle_h_rsc_0_1_BID),
      .twiddle_h_rsc_0_1_WREADY(twiddle_h_rsc_0_1_WREADY),
      .twiddle_h_rsc_0_1_WVALID(twiddle_h_rsc_0_1_WVALID),
      .twiddle_h_rsc_0_1_WUSER(twiddle_h_rsc_0_1_WUSER),
      .twiddle_h_rsc_0_1_WLAST(twiddle_h_rsc_0_1_WLAST),
      .twiddle_h_rsc_0_1_WSTRB(twiddle_h_rsc_0_1_WSTRB),
      .twiddle_h_rsc_0_1_WDATA(twiddle_h_rsc_0_1_WDATA),
      .twiddle_h_rsc_0_1_AWREADY(twiddle_h_rsc_0_1_AWREADY),
      .twiddle_h_rsc_0_1_AWVALID(twiddle_h_rsc_0_1_AWVALID),
      .twiddle_h_rsc_0_1_AWUSER(twiddle_h_rsc_0_1_AWUSER),
      .twiddle_h_rsc_0_1_AWREGION(twiddle_h_rsc_0_1_AWREGION),
      .twiddle_h_rsc_0_1_AWQOS(twiddle_h_rsc_0_1_AWQOS),
      .twiddle_h_rsc_0_1_AWPROT(twiddle_h_rsc_0_1_AWPROT),
      .twiddle_h_rsc_0_1_AWCACHE(twiddle_h_rsc_0_1_AWCACHE),
      .twiddle_h_rsc_0_1_AWLOCK(twiddle_h_rsc_0_1_AWLOCK),
      .twiddle_h_rsc_0_1_AWBURST(twiddle_h_rsc_0_1_AWBURST),
      .twiddle_h_rsc_0_1_AWSIZE(twiddle_h_rsc_0_1_AWSIZE),
      .twiddle_h_rsc_0_1_AWLEN(twiddle_h_rsc_0_1_AWLEN),
      .twiddle_h_rsc_0_1_AWADDR(twiddle_h_rsc_0_1_AWADDR),
      .twiddle_h_rsc_0_1_AWID(twiddle_h_rsc_0_1_AWID),
      .twiddle_h_rsc_triosy_0_1_lz(twiddle_h_rsc_triosy_0_1_lz),
      .twiddle_h_rsc_0_2_s_tdone(twiddle_h_rsc_0_2_s_tdone),
      .twiddle_h_rsc_0_2_tr_write_done(twiddle_h_rsc_0_2_tr_write_done),
      .twiddle_h_rsc_0_2_RREADY(twiddle_h_rsc_0_2_RREADY),
      .twiddle_h_rsc_0_2_RVALID(twiddle_h_rsc_0_2_RVALID),
      .twiddle_h_rsc_0_2_RUSER(twiddle_h_rsc_0_2_RUSER),
      .twiddle_h_rsc_0_2_RLAST(twiddle_h_rsc_0_2_RLAST),
      .twiddle_h_rsc_0_2_RRESP(twiddle_h_rsc_0_2_RRESP),
      .twiddle_h_rsc_0_2_RDATA(twiddle_h_rsc_0_2_RDATA),
      .twiddle_h_rsc_0_2_RID(twiddle_h_rsc_0_2_RID),
      .twiddle_h_rsc_0_2_ARREADY(twiddle_h_rsc_0_2_ARREADY),
      .twiddle_h_rsc_0_2_ARVALID(twiddle_h_rsc_0_2_ARVALID),
      .twiddle_h_rsc_0_2_ARUSER(twiddle_h_rsc_0_2_ARUSER),
      .twiddle_h_rsc_0_2_ARREGION(twiddle_h_rsc_0_2_ARREGION),
      .twiddle_h_rsc_0_2_ARQOS(twiddle_h_rsc_0_2_ARQOS),
      .twiddle_h_rsc_0_2_ARPROT(twiddle_h_rsc_0_2_ARPROT),
      .twiddle_h_rsc_0_2_ARCACHE(twiddle_h_rsc_0_2_ARCACHE),
      .twiddle_h_rsc_0_2_ARLOCK(twiddle_h_rsc_0_2_ARLOCK),
      .twiddle_h_rsc_0_2_ARBURST(twiddle_h_rsc_0_2_ARBURST),
      .twiddle_h_rsc_0_2_ARSIZE(twiddle_h_rsc_0_2_ARSIZE),
      .twiddle_h_rsc_0_2_ARLEN(twiddle_h_rsc_0_2_ARLEN),
      .twiddle_h_rsc_0_2_ARADDR(twiddle_h_rsc_0_2_ARADDR),
      .twiddle_h_rsc_0_2_ARID(twiddle_h_rsc_0_2_ARID),
      .twiddle_h_rsc_0_2_BREADY(twiddle_h_rsc_0_2_BREADY),
      .twiddle_h_rsc_0_2_BVALID(twiddle_h_rsc_0_2_BVALID),
      .twiddle_h_rsc_0_2_BUSER(twiddle_h_rsc_0_2_BUSER),
      .twiddle_h_rsc_0_2_BRESP(twiddle_h_rsc_0_2_BRESP),
      .twiddle_h_rsc_0_2_BID(twiddle_h_rsc_0_2_BID),
      .twiddle_h_rsc_0_2_WREADY(twiddle_h_rsc_0_2_WREADY),
      .twiddle_h_rsc_0_2_WVALID(twiddle_h_rsc_0_2_WVALID),
      .twiddle_h_rsc_0_2_WUSER(twiddle_h_rsc_0_2_WUSER),
      .twiddle_h_rsc_0_2_WLAST(twiddle_h_rsc_0_2_WLAST),
      .twiddle_h_rsc_0_2_WSTRB(twiddle_h_rsc_0_2_WSTRB),
      .twiddle_h_rsc_0_2_WDATA(twiddle_h_rsc_0_2_WDATA),
      .twiddle_h_rsc_0_2_AWREADY(twiddle_h_rsc_0_2_AWREADY),
      .twiddle_h_rsc_0_2_AWVALID(twiddle_h_rsc_0_2_AWVALID),
      .twiddle_h_rsc_0_2_AWUSER(twiddle_h_rsc_0_2_AWUSER),
      .twiddle_h_rsc_0_2_AWREGION(twiddle_h_rsc_0_2_AWREGION),
      .twiddle_h_rsc_0_2_AWQOS(twiddle_h_rsc_0_2_AWQOS),
      .twiddle_h_rsc_0_2_AWPROT(twiddle_h_rsc_0_2_AWPROT),
      .twiddle_h_rsc_0_2_AWCACHE(twiddle_h_rsc_0_2_AWCACHE),
      .twiddle_h_rsc_0_2_AWLOCK(twiddle_h_rsc_0_2_AWLOCK),
      .twiddle_h_rsc_0_2_AWBURST(twiddle_h_rsc_0_2_AWBURST),
      .twiddle_h_rsc_0_2_AWSIZE(twiddle_h_rsc_0_2_AWSIZE),
      .twiddle_h_rsc_0_2_AWLEN(twiddle_h_rsc_0_2_AWLEN),
      .twiddle_h_rsc_0_2_AWADDR(twiddle_h_rsc_0_2_AWADDR),
      .twiddle_h_rsc_0_2_AWID(twiddle_h_rsc_0_2_AWID),
      .twiddle_h_rsc_triosy_0_2_lz(twiddle_h_rsc_triosy_0_2_lz),
      .twiddle_h_rsc_0_3_s_tdone(twiddle_h_rsc_0_3_s_tdone),
      .twiddle_h_rsc_0_3_tr_write_done(twiddle_h_rsc_0_3_tr_write_done),
      .twiddle_h_rsc_0_3_RREADY(twiddle_h_rsc_0_3_RREADY),
      .twiddle_h_rsc_0_3_RVALID(twiddle_h_rsc_0_3_RVALID),
      .twiddle_h_rsc_0_3_RUSER(twiddle_h_rsc_0_3_RUSER),
      .twiddle_h_rsc_0_3_RLAST(twiddle_h_rsc_0_3_RLAST),
      .twiddle_h_rsc_0_3_RRESP(twiddle_h_rsc_0_3_RRESP),
      .twiddle_h_rsc_0_3_RDATA(twiddle_h_rsc_0_3_RDATA),
      .twiddle_h_rsc_0_3_RID(twiddle_h_rsc_0_3_RID),
      .twiddle_h_rsc_0_3_ARREADY(twiddle_h_rsc_0_3_ARREADY),
      .twiddle_h_rsc_0_3_ARVALID(twiddle_h_rsc_0_3_ARVALID),
      .twiddle_h_rsc_0_3_ARUSER(twiddle_h_rsc_0_3_ARUSER),
      .twiddle_h_rsc_0_3_ARREGION(twiddle_h_rsc_0_3_ARREGION),
      .twiddle_h_rsc_0_3_ARQOS(twiddle_h_rsc_0_3_ARQOS),
      .twiddle_h_rsc_0_3_ARPROT(twiddle_h_rsc_0_3_ARPROT),
      .twiddle_h_rsc_0_3_ARCACHE(twiddle_h_rsc_0_3_ARCACHE),
      .twiddle_h_rsc_0_3_ARLOCK(twiddle_h_rsc_0_3_ARLOCK),
      .twiddle_h_rsc_0_3_ARBURST(twiddle_h_rsc_0_3_ARBURST),
      .twiddle_h_rsc_0_3_ARSIZE(twiddle_h_rsc_0_3_ARSIZE),
      .twiddle_h_rsc_0_3_ARLEN(twiddle_h_rsc_0_3_ARLEN),
      .twiddle_h_rsc_0_3_ARADDR(twiddle_h_rsc_0_3_ARADDR),
      .twiddle_h_rsc_0_3_ARID(twiddle_h_rsc_0_3_ARID),
      .twiddle_h_rsc_0_3_BREADY(twiddle_h_rsc_0_3_BREADY),
      .twiddle_h_rsc_0_3_BVALID(twiddle_h_rsc_0_3_BVALID),
      .twiddle_h_rsc_0_3_BUSER(twiddle_h_rsc_0_3_BUSER),
      .twiddle_h_rsc_0_3_BRESP(twiddle_h_rsc_0_3_BRESP),
      .twiddle_h_rsc_0_3_BID(twiddle_h_rsc_0_3_BID),
      .twiddle_h_rsc_0_3_WREADY(twiddle_h_rsc_0_3_WREADY),
      .twiddle_h_rsc_0_3_WVALID(twiddle_h_rsc_0_3_WVALID),
      .twiddle_h_rsc_0_3_WUSER(twiddle_h_rsc_0_3_WUSER),
      .twiddle_h_rsc_0_3_WLAST(twiddle_h_rsc_0_3_WLAST),
      .twiddle_h_rsc_0_3_WSTRB(twiddle_h_rsc_0_3_WSTRB),
      .twiddle_h_rsc_0_3_WDATA(twiddle_h_rsc_0_3_WDATA),
      .twiddle_h_rsc_0_3_AWREADY(twiddle_h_rsc_0_3_AWREADY),
      .twiddle_h_rsc_0_3_AWVALID(twiddle_h_rsc_0_3_AWVALID),
      .twiddle_h_rsc_0_3_AWUSER(twiddle_h_rsc_0_3_AWUSER),
      .twiddle_h_rsc_0_3_AWREGION(twiddle_h_rsc_0_3_AWREGION),
      .twiddle_h_rsc_0_3_AWQOS(twiddle_h_rsc_0_3_AWQOS),
      .twiddle_h_rsc_0_3_AWPROT(twiddle_h_rsc_0_3_AWPROT),
      .twiddle_h_rsc_0_3_AWCACHE(twiddle_h_rsc_0_3_AWCACHE),
      .twiddle_h_rsc_0_3_AWLOCK(twiddle_h_rsc_0_3_AWLOCK),
      .twiddle_h_rsc_0_3_AWBURST(twiddle_h_rsc_0_3_AWBURST),
      .twiddle_h_rsc_0_3_AWSIZE(twiddle_h_rsc_0_3_AWSIZE),
      .twiddle_h_rsc_0_3_AWLEN(twiddle_h_rsc_0_3_AWLEN),
      .twiddle_h_rsc_0_3_AWADDR(twiddle_h_rsc_0_3_AWADDR),
      .twiddle_h_rsc_0_3_AWID(twiddle_h_rsc_0_3_AWID),
      .twiddle_h_rsc_triosy_0_3_lz(twiddle_h_rsc_triosy_0_3_lz),
      .yt_rsc_0_0_i_clken_d(yt_rsc_0_0_i_clken_d),
      .yt_rsc_0_0_i_q_d(yt_rsc_0_0_i_q_d),
      .yt_rsc_0_1_i_q_d(yt_rsc_0_1_i_q_d),
      .yt_rsc_0_2_i_q_d(yt_rsc_0_2_i_q_d),
      .yt_rsc_0_3_i_q_d(yt_rsc_0_3_i_q_d),
      .yt_rsc_0_4_i_clken_d(yt_rsc_0_4_i_clken_d),
      .yt_rsc_0_4_i_q_d(yt_rsc_0_4_i_q_d),
      .yt_rsc_0_5_i_q_d(yt_rsc_0_5_i_q_d),
      .yt_rsc_0_6_i_q_d(yt_rsc_0_6_i_q_d),
      .yt_rsc_0_7_i_q_d(yt_rsc_0_7_i_q_d),
      .yt_rsc_1_0_i_clken_d(yt_rsc_1_0_i_clken_d),
      .yt_rsc_1_0_i_q_d(yt_rsc_1_0_i_q_d),
      .yt_rsc_1_1_i_q_d(yt_rsc_1_1_i_q_d),
      .yt_rsc_1_2_i_q_d(yt_rsc_1_2_i_q_d),
      .yt_rsc_1_3_i_q_d(yt_rsc_1_3_i_q_d),
      .yt_rsc_1_4_i_clken_d(yt_rsc_1_4_i_clken_d),
      .yt_rsc_1_4_i_q_d(yt_rsc_1_4_i_q_d),
      .yt_rsc_1_5_i_q_d(yt_rsc_1_5_i_q_d),
      .yt_rsc_1_6_i_q_d(yt_rsc_1_6_i_q_d),
      .yt_rsc_1_7_i_q_d(yt_rsc_1_7_i_q_d),
      .xt_rsc_0_0_i_adra_d(xt_rsc_0_0_i_adra_d),
      .xt_rsc_0_0_i_da_d(xt_rsc_0_0_i_da_d),
      .xt_rsc_0_0_i_qa_d(xt_rsc_0_0_i_qa_d),
      .xt_rsc_0_0_i_wea_d(xt_rsc_0_0_i_wea_d),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_1_i_adra_d(xt_rsc_0_1_i_adra_d),
      .xt_rsc_0_1_i_da_d(xt_rsc_0_1_i_da_d),
      .xt_rsc_0_1_i_qa_d(xt_rsc_0_1_i_qa_d),
      .xt_rsc_0_1_i_wea_d(xt_rsc_0_1_i_wea_d),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_2_i_adra_d(xt_rsc_0_2_i_adra_d),
      .xt_rsc_0_2_i_da_d(xt_rsc_0_2_i_da_d),
      .xt_rsc_0_2_i_qa_d(xt_rsc_0_2_i_qa_d),
      .xt_rsc_0_2_i_wea_d(xt_rsc_0_2_i_wea_d),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_3_i_adra_d(xt_rsc_0_3_i_adra_d),
      .xt_rsc_0_3_i_da_d(xt_rsc_0_3_i_da_d),
      .xt_rsc_0_3_i_qa_d(xt_rsc_0_3_i_qa_d),
      .xt_rsc_0_3_i_wea_d(xt_rsc_0_3_i_wea_d),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_4_i_adra_d(xt_rsc_0_4_i_adra_d),
      .xt_rsc_0_4_i_da_d(xt_rsc_0_4_i_da_d),
      .xt_rsc_0_4_i_qa_d(xt_rsc_0_4_i_qa_d),
      .xt_rsc_0_4_i_wea_d(xt_rsc_0_4_i_wea_d),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_5_i_adra_d(xt_rsc_0_5_i_adra_d),
      .xt_rsc_0_5_i_da_d(xt_rsc_0_5_i_da_d),
      .xt_rsc_0_5_i_qa_d(xt_rsc_0_5_i_qa_d),
      .xt_rsc_0_5_i_wea_d(xt_rsc_0_5_i_wea_d),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_6_i_adra_d(xt_rsc_0_6_i_adra_d),
      .xt_rsc_0_6_i_da_d(xt_rsc_0_6_i_da_d),
      .xt_rsc_0_6_i_qa_d(xt_rsc_0_6_i_qa_d),
      .xt_rsc_0_6_i_wea_d(xt_rsc_0_6_i_wea_d),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_7_i_adra_d(xt_rsc_0_7_i_adra_d),
      .xt_rsc_0_7_i_da_d(xt_rsc_0_7_i_da_d),
      .xt_rsc_0_7_i_qa_d(xt_rsc_0_7_i_qa_d),
      .xt_rsc_0_7_i_wea_d(xt_rsc_0_7_i_wea_d),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .yt_rsc_0_0_i_d_d_pff(yt_rsc_0_0_i_d_d_iff),
      .yt_rsc_0_0_i_radr_d_pff(yt_rsc_0_0_i_radr_d_iff),
      .yt_rsc_0_0_i_wadr_d_pff(yt_rsc_0_0_i_wadr_d_iff),
      .yt_rsc_0_0_i_we_d_pff(yt_rsc_0_0_i_we_d_iff),
      .yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff(yt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .yt_rsc_0_1_i_d_d_pff(yt_rsc_0_1_i_d_d_iff),
      .yt_rsc_0_2_i_d_d_pff(yt_rsc_0_2_i_d_d_iff),
      .yt_rsc_0_3_i_d_d_pff(yt_rsc_0_3_i_d_d_iff),
      .yt_rsc_0_4_i_wadr_d_pff(yt_rsc_0_4_i_wadr_d_iff),
      .yt_rsc_0_4_i_we_d_pff(yt_rsc_0_4_i_we_d_iff),
      .yt_rsc_1_0_i_d_d_pff(yt_rsc_1_0_i_d_d_iff),
      .yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff(yt_rsc_1_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff),
      .yt_rsc_1_1_i_d_d_pff(yt_rsc_1_1_i_d_d_iff),
      .yt_rsc_1_2_i_d_d_pff(yt_rsc_1_2_i_d_d_iff),
      .yt_rsc_1_3_i_d_d_pff(yt_rsc_1_3_i_d_d_iff)
    );
endmodule



