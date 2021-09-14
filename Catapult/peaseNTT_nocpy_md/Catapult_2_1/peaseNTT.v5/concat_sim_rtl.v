
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
//  Generated date: Sun Sep 12 00:12:45 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_32_1024_1024_32_1_gen (
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
//  Design Unit:    peaseNTT_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module peaseNTT_core_core_fsm (
  clk, rst, core_wen, fsm_output, INNER_LOOP1_C_12_tr0, INNER_LOOP2_C_12_tr0, INNER_LOOP2_C_12_tr1,
      INNER_LOOP3_C_12_tr0, INNER_LOOP4_C_12_tr0, INNER_LOOP4_C_12_tr1
);
  input clk;
  input rst;
  input core_wen;
  output [57:0] fsm_output;
  reg [57:0] fsm_output;
  input INNER_LOOP1_C_12_tr0;
  input INNER_LOOP2_C_12_tr0;
  input INNER_LOOP2_C_12_tr1;
  input INNER_LOOP3_C_12_tr0;
  input INNER_LOOP4_C_12_tr0;
  input INNER_LOOP4_C_12_tr1;


  // FSM State Type Declaration for peaseNTT_core_core_fsm_1
  parameter
    main_C_0 = 6'd0,
    STAGE_LOOP_C_0 = 6'd1,
    INNER_LOOP1_C_0 = 6'd2,
    INNER_LOOP1_C_1 = 6'd3,
    INNER_LOOP1_C_2 = 6'd4,
    INNER_LOOP1_C_3 = 6'd5,
    INNER_LOOP1_C_4 = 6'd6,
    INNER_LOOP1_C_5 = 6'd7,
    INNER_LOOP1_C_6 = 6'd8,
    INNER_LOOP1_C_7 = 6'd9,
    INNER_LOOP1_C_8 = 6'd10,
    INNER_LOOP1_C_9 = 6'd11,
    INNER_LOOP1_C_10 = 6'd12,
    INNER_LOOP1_C_11 = 6'd13,
    INNER_LOOP1_C_12 = 6'd14,
    STAGE_LOOP_C_1 = 6'd15,
    INNER_LOOP2_C_0 = 6'd16,
    INNER_LOOP2_C_1 = 6'd17,
    INNER_LOOP2_C_2 = 6'd18,
    INNER_LOOP2_C_3 = 6'd19,
    INNER_LOOP2_C_4 = 6'd20,
    INNER_LOOP2_C_5 = 6'd21,
    INNER_LOOP2_C_6 = 6'd22,
    INNER_LOOP2_C_7 = 6'd23,
    INNER_LOOP2_C_8 = 6'd24,
    INNER_LOOP2_C_9 = 6'd25,
    INNER_LOOP2_C_10 = 6'd26,
    INNER_LOOP2_C_11 = 6'd27,
    INNER_LOOP2_C_12 = 6'd28,
    STAGE_LOOP1_C_0 = 6'd29,
    INNER_LOOP3_C_0 = 6'd30,
    INNER_LOOP3_C_1 = 6'd31,
    INNER_LOOP3_C_2 = 6'd32,
    INNER_LOOP3_C_3 = 6'd33,
    INNER_LOOP3_C_4 = 6'd34,
    INNER_LOOP3_C_5 = 6'd35,
    INNER_LOOP3_C_6 = 6'd36,
    INNER_LOOP3_C_7 = 6'd37,
    INNER_LOOP3_C_8 = 6'd38,
    INNER_LOOP3_C_9 = 6'd39,
    INNER_LOOP3_C_10 = 6'd40,
    INNER_LOOP3_C_11 = 6'd41,
    INNER_LOOP3_C_12 = 6'd42,
    STAGE_LOOP1_C_1 = 6'd43,
    INNER_LOOP4_C_0 = 6'd44,
    INNER_LOOP4_C_1 = 6'd45,
    INNER_LOOP4_C_2 = 6'd46,
    INNER_LOOP4_C_3 = 6'd47,
    INNER_LOOP4_C_4 = 6'd48,
    INNER_LOOP4_C_5 = 6'd49,
    INNER_LOOP4_C_6 = 6'd50,
    INNER_LOOP4_C_7 = 6'd51,
    INNER_LOOP4_C_8 = 6'd52,
    INNER_LOOP4_C_9 = 6'd53,
    INNER_LOOP4_C_10 = 6'd54,
    INNER_LOOP4_C_11 = 6'd55,
    INNER_LOOP4_C_12 = 6'd56,
    main_C_1 = 6'd57;

  reg [5:0] state_var;
  reg [5:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : peaseNTT_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000000000010;
        state_var_NS = INNER_LOOP1_C_0;
      end
      INNER_LOOP1_C_0 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000000000100;
        state_var_NS = INNER_LOOP1_C_1;
      end
      INNER_LOOP1_C_1 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000000001000;
        state_var_NS = INNER_LOOP1_C_2;
      end
      INNER_LOOP1_C_2 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000000010000;
        state_var_NS = INNER_LOOP1_C_3;
      end
      INNER_LOOP1_C_3 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000000100000;
        state_var_NS = INNER_LOOP1_C_4;
      end
      INNER_LOOP1_C_4 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000001000000;
        state_var_NS = INNER_LOOP1_C_5;
      end
      INNER_LOOP1_C_5 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000010000000;
        state_var_NS = INNER_LOOP1_C_6;
      end
      INNER_LOOP1_C_6 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000100000000;
        state_var_NS = INNER_LOOP1_C_7;
      end
      INNER_LOOP1_C_7 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000001000000000;
        state_var_NS = INNER_LOOP1_C_8;
      end
      INNER_LOOP1_C_8 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000010000000000;
        state_var_NS = INNER_LOOP1_C_9;
      end
      INNER_LOOP1_C_9 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000100000000000;
        state_var_NS = INNER_LOOP1_C_10;
      end
      INNER_LOOP1_C_10 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000001000000000000;
        state_var_NS = INNER_LOOP1_C_11;
      end
      INNER_LOOP1_C_11 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000010000000000000;
        state_var_NS = INNER_LOOP1_C_12;
      end
      INNER_LOOP1_C_12 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000100000000000000;
        if ( INNER_LOOP1_C_12_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = INNER_LOOP1_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000001000000000000000;
        state_var_NS = INNER_LOOP2_C_0;
      end
      INNER_LOOP2_C_0 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000010000000000000000;
        state_var_NS = INNER_LOOP2_C_1;
      end
      INNER_LOOP2_C_1 : begin
        fsm_output = 58'b0000000000000000000000000000000000000000100000000000000000;
        state_var_NS = INNER_LOOP2_C_2;
      end
      INNER_LOOP2_C_2 : begin
        fsm_output = 58'b0000000000000000000000000000000000000001000000000000000000;
        state_var_NS = INNER_LOOP2_C_3;
      end
      INNER_LOOP2_C_3 : begin
        fsm_output = 58'b0000000000000000000000000000000000000010000000000000000000;
        state_var_NS = INNER_LOOP2_C_4;
      end
      INNER_LOOP2_C_4 : begin
        fsm_output = 58'b0000000000000000000000000000000000000100000000000000000000;
        state_var_NS = INNER_LOOP2_C_5;
      end
      INNER_LOOP2_C_5 : begin
        fsm_output = 58'b0000000000000000000000000000000000001000000000000000000000;
        state_var_NS = INNER_LOOP2_C_6;
      end
      INNER_LOOP2_C_6 : begin
        fsm_output = 58'b0000000000000000000000000000000000010000000000000000000000;
        state_var_NS = INNER_LOOP2_C_7;
      end
      INNER_LOOP2_C_7 : begin
        fsm_output = 58'b0000000000000000000000000000000000100000000000000000000000;
        state_var_NS = INNER_LOOP2_C_8;
      end
      INNER_LOOP2_C_8 : begin
        fsm_output = 58'b0000000000000000000000000000000001000000000000000000000000;
        state_var_NS = INNER_LOOP2_C_9;
      end
      INNER_LOOP2_C_9 : begin
        fsm_output = 58'b0000000000000000000000000000000010000000000000000000000000;
        state_var_NS = INNER_LOOP2_C_10;
      end
      INNER_LOOP2_C_10 : begin
        fsm_output = 58'b0000000000000000000000000000000100000000000000000000000000;
        state_var_NS = INNER_LOOP2_C_11;
      end
      INNER_LOOP2_C_11 : begin
        fsm_output = 58'b0000000000000000000000000000001000000000000000000000000000;
        state_var_NS = INNER_LOOP2_C_12;
      end
      INNER_LOOP2_C_12 : begin
        fsm_output = 58'b0000000000000000000000000000010000000000000000000000000000;
        if ( INNER_LOOP2_C_12_tr0 ) begin
          state_var_NS = STAGE_LOOP1_C_0;
        end
        else if ( INNER_LOOP2_C_12_tr1 ) begin
          state_var_NS = INNER_LOOP2_C_0;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      STAGE_LOOP1_C_0 : begin
        fsm_output = 58'b0000000000000000000000000000100000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_0;
      end
      INNER_LOOP3_C_0 : begin
        fsm_output = 58'b0000000000000000000000000001000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_1;
      end
      INNER_LOOP3_C_1 : begin
        fsm_output = 58'b0000000000000000000000000010000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_2;
      end
      INNER_LOOP3_C_2 : begin
        fsm_output = 58'b0000000000000000000000000100000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_3;
      end
      INNER_LOOP3_C_3 : begin
        fsm_output = 58'b0000000000000000000000001000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_4;
      end
      INNER_LOOP3_C_4 : begin
        fsm_output = 58'b0000000000000000000000010000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_5;
      end
      INNER_LOOP3_C_5 : begin
        fsm_output = 58'b0000000000000000000000100000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_6;
      end
      INNER_LOOP3_C_6 : begin
        fsm_output = 58'b0000000000000000000001000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_7;
      end
      INNER_LOOP3_C_7 : begin
        fsm_output = 58'b0000000000000000000010000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_8;
      end
      INNER_LOOP3_C_8 : begin
        fsm_output = 58'b0000000000000000000100000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_9;
      end
      INNER_LOOP3_C_9 : begin
        fsm_output = 58'b0000000000000000001000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_10;
      end
      INNER_LOOP3_C_10 : begin
        fsm_output = 58'b0000000000000000010000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_11;
      end
      INNER_LOOP3_C_11 : begin
        fsm_output = 58'b0000000000000000100000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP3_C_12;
      end
      INNER_LOOP3_C_12 : begin
        fsm_output = 58'b0000000000000001000000000000000000000000000000000000000000;
        if ( INNER_LOOP3_C_12_tr0 ) begin
          state_var_NS = STAGE_LOOP1_C_1;
        end
        else begin
          state_var_NS = INNER_LOOP3_C_0;
        end
      end
      STAGE_LOOP1_C_1 : begin
        fsm_output = 58'b0000000000000010000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_0;
      end
      INNER_LOOP4_C_0 : begin
        fsm_output = 58'b0000000000000100000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_1;
      end
      INNER_LOOP4_C_1 : begin
        fsm_output = 58'b0000000000001000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_2;
      end
      INNER_LOOP4_C_2 : begin
        fsm_output = 58'b0000000000010000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_3;
      end
      INNER_LOOP4_C_3 : begin
        fsm_output = 58'b0000000000100000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_4;
      end
      INNER_LOOP4_C_4 : begin
        fsm_output = 58'b0000000001000000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_5;
      end
      INNER_LOOP4_C_5 : begin
        fsm_output = 58'b0000000010000000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_6;
      end
      INNER_LOOP4_C_6 : begin
        fsm_output = 58'b0000000100000000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_7;
      end
      INNER_LOOP4_C_7 : begin
        fsm_output = 58'b0000001000000000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_8;
      end
      INNER_LOOP4_C_8 : begin
        fsm_output = 58'b0000010000000000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_9;
      end
      INNER_LOOP4_C_9 : begin
        fsm_output = 58'b0000100000000000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_10;
      end
      INNER_LOOP4_C_10 : begin
        fsm_output = 58'b0001000000000000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_11;
      end
      INNER_LOOP4_C_11 : begin
        fsm_output = 58'b0010000000000000000000000000000000000000000000000000000000;
        state_var_NS = INNER_LOOP4_C_12;
      end
      INNER_LOOP4_C_12 : begin
        fsm_output = 58'b0100000000000000000000000000000000000000000000000000000000;
        if ( INNER_LOOP4_C_12_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else if ( INNER_LOOP4_C_12_tr1 ) begin
          state_var_NS = INNER_LOOP4_C_0;
        end
        else begin
          state_var_NS = STAGE_LOOP1_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 58'b1000000000000000000000000000000000000000000000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 58'b0000000000000000000000000000000000000000000000000000000001;
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
  clk, rst, core_wen, core_wten, xt_rsci_wen_comp, xt_rsci_wen_comp_1, twiddle_rsci_wen_comp,
      twiddle_h_rsci_wen_comp
);
  input clk;
  input rst;
  output core_wen;
  output core_wten;
  reg core_wten;
  input xt_rsci_wen_comp;
  input xt_rsci_wen_comp_1;
  input twiddle_rsci_wen_comp;
  input twiddle_h_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign core_wen = xt_rsci_wen_comp & xt_rsci_wen_comp_1 & twiddle_rsci_wen_comp
      & twiddle_h_rsci_wen_comp;
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
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl (
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
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl (
  core_wten, twiddle_rsc_triosy_obj_iswt0, twiddle_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_obj_iswt0;
  output twiddle_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_obj_ld_core_sct = twiddle_rsc_triosy_obj_iswt0 & (~ core_wten);
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
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_obj_xt_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_obj_xt_rsc_triosy_wait_ctrl (
  core_wten, xt_rsc_triosy_obj_iswt0, xt_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input xt_rsc_triosy_obj_iswt0;
  output xt_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign xt_rsc_triosy_obj_ld_core_sct = xt_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp (
  clk, rst, twiddle_h_rsci_oswt, twiddle_h_rsci_wen_comp, twiddle_h_rsci_s_raddr_core,
      twiddle_h_rsci_s_din_mxwt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt, twiddle_h_rsci_bcwt,
      twiddle_h_rsci_s_raddr, twiddle_h_rsci_s_raddr_core_sct, twiddle_h_rsci_s_din
);
  input clk;
  input rst;
  input twiddle_h_rsci_oswt;
  output twiddle_h_rsci_wen_comp;
  input [9:0] twiddle_h_rsci_s_raddr_core;
  output [31:0] twiddle_h_rsci_s_din_mxwt;
  input twiddle_h_rsci_biwt;
  input twiddle_h_rsci_bdwt;
  output twiddle_h_rsci_bcwt;
  reg twiddle_h_rsci_bcwt;
  output [9:0] twiddle_h_rsci_s_raddr;
  input twiddle_h_rsci_s_raddr_core_sct;
  input [31:0] twiddle_h_rsci_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_h_rsci_s_din_bfwt;

  wire[8:0] INNER_LOOP1_tw_h_INNER_LOOP1_tw_h_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_wen_comp = (~ twiddle_h_rsci_oswt) | twiddle_h_rsci_biwt
      | twiddle_h_rsci_bcwt;
  assign INNER_LOOP1_tw_h_INNER_LOOP1_tw_h_and_nl = MUX_v_9_2_2(9'b000000000, (twiddle_h_rsci_s_raddr_core[8:0]),
      twiddle_h_rsci_s_raddr_core_sct);
  assign twiddle_h_rsci_s_raddr = {1'b0, INNER_LOOP1_tw_h_INNER_LOOP1_tw_h_and_nl};
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl (
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
//  Design Unit:    peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_oswt, twiddle_rsci_wen_comp, twiddle_rsci_s_raddr_core,
      twiddle_rsci_s_din_mxwt, twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_bcwt,
      twiddle_rsci_s_raddr, twiddle_rsci_s_raddr_core_sct, twiddle_rsci_s_din
);
  input clk;
  input rst;
  input twiddle_rsci_oswt;
  output twiddle_rsci_wen_comp;
  input [9:0] twiddle_rsci_s_raddr_core;
  output [31:0] twiddle_rsci_s_din_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;
  output twiddle_rsci_bcwt;
  reg twiddle_rsci_bcwt;
  output [9:0] twiddle_rsci_s_raddr;
  input twiddle_rsci_s_raddr_core_sct;
  input [31:0] twiddle_rsci_s_din;


  // Interconnect Declarations
  reg [31:0] twiddle_rsci_s_din_bfwt;

  wire[8:0] INNER_LOOP1_tw_INNER_LOOP1_tw_and_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_wen_comp = (~ twiddle_rsci_oswt) | twiddle_rsci_biwt | twiddle_rsci_bcwt;
  assign INNER_LOOP1_tw_INNER_LOOP1_tw_and_nl = MUX_v_9_2_2(9'b000000000, (twiddle_rsci_s_raddr_core[8:0]),
      twiddle_rsci_s_raddr_core_sct);
  assign twiddle_rsci_s_raddr = {1'b0, INNER_LOOP1_tw_INNER_LOOP1_tw_and_nl};
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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_ctrl (
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
//  Design Unit:    peaseNTT_core_xt_rsci_xt_rsc_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsci_xt_rsc_wait_dp (
  clk, rst, xt_rsci_oswt, xt_rsci_wen_comp, xt_rsci_oswt_1, xt_rsci_wen_comp_1, xt_rsci_s_raddr_core,
      xt_rsci_s_waddr_core, xt_rsci_s_din_mxwt, xt_rsci_s_dout_core, xt_rsci_biwt,
      xt_rsci_bdwt, xt_rsci_bcwt, xt_rsci_biwt_1, xt_rsci_bdwt_2, xt_rsci_bcwt_1,
      xt_rsci_s_raddr, xt_rsci_s_raddr_core_sct, xt_rsci_s_waddr, xt_rsci_s_waddr_core_sct,
      xt_rsci_s_din, xt_rsci_s_dout
);
  input clk;
  input rst;
  input xt_rsci_oswt;
  output xt_rsci_wen_comp;
  input xt_rsci_oswt_1;
  output xt_rsci_wen_comp_1;
  input [9:0] xt_rsci_s_raddr_core;
  input [9:0] xt_rsci_s_waddr_core;
  output [31:0] xt_rsci_s_din_mxwt;
  input [31:0] xt_rsci_s_dout_core;
  input xt_rsci_biwt;
  input xt_rsci_bdwt;
  output xt_rsci_bcwt;
  reg xt_rsci_bcwt;
  input xt_rsci_biwt_1;
  input xt_rsci_bdwt_2;
  output xt_rsci_bcwt_1;
  reg xt_rsci_bcwt_1;
  output [9:0] xt_rsci_s_raddr;
  input xt_rsci_s_raddr_core_sct;
  output [9:0] xt_rsci_s_waddr;
  input xt_rsci_s_waddr_core_sct;
  input [31:0] xt_rsci_s_din;
  output [31:0] xt_rsci_s_dout;


  // Interconnect Declarations
  reg [31:0] xt_rsci_s_din_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsci_wen_comp = (~ xt_rsci_oswt) | xt_rsci_biwt | xt_rsci_bcwt;
  assign xt_rsci_wen_comp_1 = (~ xt_rsci_oswt_1) | xt_rsci_biwt_1 | xt_rsci_bcwt_1;
  assign xt_rsci_s_raddr = MUX_v_10_2_2(10'b0000000000, xt_rsci_s_raddr_core, xt_rsci_s_raddr_core_sct);
  assign xt_rsci_s_waddr = MUX_v_10_2_2(10'b0000000000, xt_rsci_s_waddr_core, xt_rsci_s_waddr_core_sct);
  assign xt_rsci_s_din_mxwt = MUX_v_32_2_2(xt_rsci_s_din, xt_rsci_s_din_bfwt, xt_rsci_bcwt);
  assign xt_rsci_s_dout = MUX_v_32_2_2(32'b00000000000000000000000000000000, xt_rsci_s_dout_core,
      xt_rsci_s_waddr_core_sct);
  always @(posedge clk) begin
    if ( rst ) begin
      xt_rsci_bcwt <= 1'b0;
      xt_rsci_bcwt_1 <= 1'b0;
    end
    else begin
      xt_rsci_bcwt <= ~((~(xt_rsci_bcwt | xt_rsci_biwt)) | xt_rsci_bdwt);
      xt_rsci_bcwt_1 <= ~((~(xt_rsci_bcwt_1 | xt_rsci_biwt_1)) | xt_rsci_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( xt_rsci_biwt ) begin
      xt_rsci_s_din_bfwt <= xt_rsci_s_din;
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
//  Design Unit:    peaseNTT_core_xt_rsci_xt_rsc_wait_ctrl
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsci_xt_rsc_wait_ctrl (
  core_wen, xt_rsci_oswt, xt_rsci_oswt_1, xt_rsci_biwt, xt_rsci_bdwt, xt_rsci_bcwt,
      xt_rsci_s_re_core_sct, xt_rsci_biwt_1, xt_rsci_bdwt_2, xt_rsci_bcwt_1, xt_rsci_s_we_core_sct,
      xt_rsci_s_rrdy, xt_rsci_s_wrdy
);
  input core_wen;
  input xt_rsci_oswt;
  input xt_rsci_oswt_1;
  output xt_rsci_biwt;
  output xt_rsci_bdwt;
  input xt_rsci_bcwt;
  output xt_rsci_s_re_core_sct;
  output xt_rsci_biwt_1;
  output xt_rsci_bdwt_2;
  input xt_rsci_bcwt_1;
  output xt_rsci_s_we_core_sct;
  input xt_rsci_s_rrdy;
  input xt_rsci_s_wrdy;


  // Interconnect Declarations
  wire xt_rsci_ogwt;
  wire xt_rsci_ogwt_1;


  // Interconnect Declarations for Component Instantiations 
  assign xt_rsci_bdwt = xt_rsci_oswt & core_wen;
  assign xt_rsci_biwt = xt_rsci_ogwt & xt_rsci_s_rrdy;
  assign xt_rsci_ogwt = xt_rsci_oswt & (~ xt_rsci_bcwt);
  assign xt_rsci_s_re_core_sct = xt_rsci_ogwt;
  assign xt_rsci_bdwt_2 = xt_rsci_oswt_1 & core_wen;
  assign xt_rsci_biwt_1 = xt_rsci_ogwt_1 & xt_rsci_s_wrdy;
  assign xt_rsci_ogwt_1 = xt_rsci_oswt_1 & (~ xt_rsci_bcwt_1);
  assign xt_rsci_s_we_core_sct = xt_rsci_ogwt_1;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_wait_dp
// ------------------------------------------------------------------


module peaseNTT_core_wait_dp (
  yt_rsc_cgo_iro, yt_rsci_clken_d, ensig_cgo_iro, core_wen, yt_rsc_cgo, ensig_cgo,
      mult_z_mul_cmp_en
);
  input yt_rsc_cgo_iro;
  output yt_rsci_clken_d;
  input ensig_cgo_iro;
  input core_wen;
  input yt_rsc_cgo;
  input ensig_cgo;
  output mult_z_mul_cmp_en;



  // Interconnect Declarations for Component Instantiations 
  assign yt_rsci_clken_d = core_wen & (yt_rsc_cgo | yt_rsc_cgo_iro);
  assign mult_z_mul_cmp_en = core_wen & (ensig_cgo | ensig_cgo_iro);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsc_triosy_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsc_triosy_obj (
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
  peaseNTT_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl peaseNTT_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(twiddle_h_rsc_triosy_obj_iswt0),
      .twiddle_h_rsc_triosy_obj_ld_core_sct(twiddle_h_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_rsc_triosy_obj
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsc_triosy_obj (
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
  peaseNTT_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl peaseNTT_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(twiddle_rsc_triosy_obj_iswt0),
      .twiddle_rsc_triosy_obj_ld_core_sct(twiddle_rsc_triosy_obj_ld_core_sct)
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
//  Design Unit:    peaseNTT_core_xt_rsc_triosy_obj
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsc_triosy_obj (
  xt_rsc_triosy_lz, core_wten, xt_rsc_triosy_obj_iswt0
);
  output xt_rsc_triosy_lz;
  input core_wten;
  input xt_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire xt_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_obj (
      .ld(xt_rsc_triosy_obj_ld_core_sct),
      .lz(xt_rsc_triosy_lz)
    );
  peaseNTT_core_xt_rsc_triosy_obj_xt_rsc_triosy_wait_ctrl peaseNTT_core_xt_rsc_triosy_obj_xt_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .xt_rsc_triosy_obj_iswt0(xt_rsc_triosy_obj_iswt0),
      .xt_rsc_triosy_obj_ld_core_sct(xt_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core_twiddle_h_rsci
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_h_rsci (
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
  input [9:0] twiddle_h_rsci_s_raddr_core;
  output [31:0] twiddle_h_rsci_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_h_rsci_biwt;
  wire twiddle_h_rsci_bdwt;
  wire twiddle_h_rsci_bcwt;
  wire twiddle_h_rsci_s_re_core_sct;
  wire [9:0] twiddle_h_rsci_s_raddr;
  wire [31:0] twiddle_h_rsci_s_din;
  wire twiddle_h_rsci_s_rrdy;
  wire twiddle_h_rsci_s_wrdy;
  wire twiddle_h_rsc_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [9:0] nl_peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core
      = {1'b0 , (twiddle_h_rsci_s_raddr_core[8:0])};
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
      .s_waddr(10'b0000000000),
      .s_din(twiddle_h_rsci_s_din),
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_h_rsci_s_rrdy),
      .s_wrdy(twiddle_h_rsci_s_wrdy),
      .is_idle(twiddle_h_rsc_is_idle),
      .tr_write_done(twiddle_h_rsc_tr_write_done),
      .s_tdone(twiddle_h_rsc_s_tdone)
    );
  peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_bcwt(twiddle_h_rsci_bcwt),
      .twiddle_h_rsci_s_re_core_sct(twiddle_h_rsci_s_re_core_sct),
      .twiddle_h_rsci_s_rrdy(twiddle_h_rsci_s_rrdy)
    );
  peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_wen_comp(twiddle_h_rsci_wen_comp),
      .twiddle_h_rsci_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core[9:0]),
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
//  Design Unit:    peaseNTT_core_twiddle_rsci
// ------------------------------------------------------------------


module peaseNTT_core_twiddle_rsci (
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
  input [9:0] twiddle_rsci_s_raddr_core;
  output [31:0] twiddle_rsci_s_din_mxwt;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire twiddle_rsci_bcwt;
  wire twiddle_rsci_s_re_core_sct;
  wire [9:0] twiddle_rsci_s_raddr;
  wire [31:0] twiddle_rsci_s_din;
  wire twiddle_rsci_s_rrdy;
  wire twiddle_rsci_s_wrdy;
  wire twiddle_rsc_is_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [9:0] nl_peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core
      = {1'b0 , (twiddle_rsci_s_raddr_core[8:0])};
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
      .s_dout(32'b00000000000000000000000000000000),
      .s_rrdy(twiddle_rsci_s_rrdy),
      .s_wrdy(twiddle_rsci_s_wrdy),
      .is_idle(twiddle_rsc_is_idle),
      .tr_write_done(twiddle_rsc_tr_write_done),
      .s_tdone(twiddle_rsc_s_tdone)
    );
  peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_ctrl peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_bcwt(twiddle_rsci_bcwt),
      .twiddle_rsci_s_re_core_sct(twiddle_rsci_s_re_core_sct),
      .twiddle_rsci_s_rrdy(twiddle_rsci_s_rrdy)
    );
  peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_dp peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_wen_comp(twiddle_rsci_wen_comp),
      .twiddle_rsci_s_raddr_core(nl_peaseNTT_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core[9:0]),
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
//  Design Unit:    peaseNTT_core_xt_rsci
// ------------------------------------------------------------------


module peaseNTT_core_xt_rsci (
  clk, rst, xt_rsc_s_tdone, xt_rsc_tr_write_done, xt_rsc_RREADY, xt_rsc_RVALID, xt_rsc_RUSER,
      xt_rsc_RLAST, xt_rsc_RRESP, xt_rsc_RDATA, xt_rsc_RID, xt_rsc_ARREADY, xt_rsc_ARVALID,
      xt_rsc_ARUSER, xt_rsc_ARREGION, xt_rsc_ARQOS, xt_rsc_ARPROT, xt_rsc_ARCACHE,
      xt_rsc_ARLOCK, xt_rsc_ARBURST, xt_rsc_ARSIZE, xt_rsc_ARLEN, xt_rsc_ARADDR,
      xt_rsc_ARID, xt_rsc_BREADY, xt_rsc_BVALID, xt_rsc_BUSER, xt_rsc_BRESP, xt_rsc_BID,
      xt_rsc_WREADY, xt_rsc_WVALID, xt_rsc_WUSER, xt_rsc_WLAST, xt_rsc_WSTRB, xt_rsc_WDATA,
      xt_rsc_AWREADY, xt_rsc_AWVALID, xt_rsc_AWUSER, xt_rsc_AWREGION, xt_rsc_AWQOS,
      xt_rsc_AWPROT, xt_rsc_AWCACHE, xt_rsc_AWLOCK, xt_rsc_AWBURST, xt_rsc_AWSIZE,
      xt_rsc_AWLEN, xt_rsc_AWADDR, xt_rsc_AWID, core_wen, xt_rsci_oswt, xt_rsci_wen_comp,
      xt_rsci_oswt_1, xt_rsci_wen_comp_1, xt_rsci_s_raddr_core, xt_rsci_s_waddr_core,
      xt_rsci_s_din_mxwt, xt_rsci_s_dout_core
);
  input clk;
  input rst;
  input xt_rsc_s_tdone;
  input xt_rsc_tr_write_done;
  input xt_rsc_RREADY;
  output xt_rsc_RVALID;
  output xt_rsc_RUSER;
  output xt_rsc_RLAST;
  output [1:0] xt_rsc_RRESP;
  output [31:0] xt_rsc_RDATA;
  output xt_rsc_RID;
  output xt_rsc_ARREADY;
  input xt_rsc_ARVALID;
  input xt_rsc_ARUSER;
  input [3:0] xt_rsc_ARREGION;
  input [3:0] xt_rsc_ARQOS;
  input [2:0] xt_rsc_ARPROT;
  input [3:0] xt_rsc_ARCACHE;
  input xt_rsc_ARLOCK;
  input [1:0] xt_rsc_ARBURST;
  input [2:0] xt_rsc_ARSIZE;
  input [7:0] xt_rsc_ARLEN;
  input [11:0] xt_rsc_ARADDR;
  input xt_rsc_ARID;
  input xt_rsc_BREADY;
  output xt_rsc_BVALID;
  output xt_rsc_BUSER;
  output [1:0] xt_rsc_BRESP;
  output xt_rsc_BID;
  output xt_rsc_WREADY;
  input xt_rsc_WVALID;
  input xt_rsc_WUSER;
  input xt_rsc_WLAST;
  input [3:0] xt_rsc_WSTRB;
  input [31:0] xt_rsc_WDATA;
  output xt_rsc_AWREADY;
  input xt_rsc_AWVALID;
  input xt_rsc_AWUSER;
  input [3:0] xt_rsc_AWREGION;
  input [3:0] xt_rsc_AWQOS;
  input [2:0] xt_rsc_AWPROT;
  input [3:0] xt_rsc_AWCACHE;
  input xt_rsc_AWLOCK;
  input [1:0] xt_rsc_AWBURST;
  input [2:0] xt_rsc_AWSIZE;
  input [7:0] xt_rsc_AWLEN;
  input [11:0] xt_rsc_AWADDR;
  input xt_rsc_AWID;
  input core_wen;
  input xt_rsci_oswt;
  output xt_rsci_wen_comp;
  input xt_rsci_oswt_1;
  output xt_rsci_wen_comp_1;
  input [9:0] xt_rsci_s_raddr_core;
  input [9:0] xt_rsci_s_waddr_core;
  output [31:0] xt_rsci_s_din_mxwt;
  input [31:0] xt_rsci_s_dout_core;


  // Interconnect Declarations
  wire xt_rsci_biwt;
  wire xt_rsci_bdwt;
  wire xt_rsci_bcwt;
  wire xt_rsci_s_re_core_sct;
  wire xt_rsci_biwt_1;
  wire xt_rsci_bdwt_2;
  wire xt_rsci_bcwt_1;
  wire xt_rsci_s_we_core_sct;
  wire [9:0] xt_rsci_s_raddr;
  wire [9:0] xt_rsci_s_waddr;
  wire [31:0] xt_rsci_s_din;
  wire [31:0] xt_rsci_s_dout;
  wire xt_rsci_s_rrdy;
  wire xt_rsci_s_wrdy;
  wire xt_rsc_is_idle_1;


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
  .rBASE_ADDRESS(32'sd0)) xt_rsci (
      .ACLK(clk),
      .ARESETn(1'b1),
      .AWID(xt_rsc_AWID),
      .AWADDR(xt_rsc_AWADDR),
      .AWLEN(xt_rsc_AWLEN),
      .AWSIZE(xt_rsc_AWSIZE),
      .AWBURST(xt_rsc_AWBURST),
      .AWLOCK(xt_rsc_AWLOCK),
      .AWCACHE(xt_rsc_AWCACHE),
      .AWPROT(xt_rsc_AWPROT),
      .AWQOS(xt_rsc_AWQOS),
      .AWREGION(xt_rsc_AWREGION),
      .AWUSER(xt_rsc_AWUSER),
      .AWVALID(xt_rsc_AWVALID),
      .AWREADY(xt_rsc_AWREADY),
      .WDATA(xt_rsc_WDATA),
      .WSTRB(xt_rsc_WSTRB),
      .WLAST(xt_rsc_WLAST),
      .WUSER(xt_rsc_WUSER),
      .WVALID(xt_rsc_WVALID),
      .WREADY(xt_rsc_WREADY),
      .BID(xt_rsc_BID),
      .BRESP(xt_rsc_BRESP),
      .BUSER(xt_rsc_BUSER),
      .BVALID(xt_rsc_BVALID),
      .BREADY(xt_rsc_BREADY),
      .ARID(xt_rsc_ARID),
      .ARADDR(xt_rsc_ARADDR),
      .ARLEN(xt_rsc_ARLEN),
      .ARSIZE(xt_rsc_ARSIZE),
      .ARBURST(xt_rsc_ARBURST),
      .ARLOCK(xt_rsc_ARLOCK),
      .ARCACHE(xt_rsc_ARCACHE),
      .ARPROT(xt_rsc_ARPROT),
      .ARQOS(xt_rsc_ARQOS),
      .ARREGION(xt_rsc_ARREGION),
      .ARUSER(xt_rsc_ARUSER),
      .ARVALID(xt_rsc_ARVALID),
      .ARREADY(xt_rsc_ARREADY),
      .RID(xt_rsc_RID),
      .RDATA(xt_rsc_RDATA),
      .RRESP(xt_rsc_RRESP),
      .RLAST(xt_rsc_RLAST),
      .RUSER(xt_rsc_RUSER),
      .RVALID(xt_rsc_RVALID),
      .RREADY(xt_rsc_RREADY),
      .s_re(xt_rsci_s_re_core_sct),
      .s_we(xt_rsci_s_we_core_sct),
      .s_raddr(xt_rsci_s_raddr),
      .s_waddr(xt_rsci_s_waddr),
      .s_din(xt_rsci_s_din),
      .s_dout(xt_rsci_s_dout),
      .s_rrdy(xt_rsci_s_rrdy),
      .s_wrdy(xt_rsci_s_wrdy),
      .is_idle(xt_rsc_is_idle_1),
      .tr_write_done(xt_rsc_tr_write_done),
      .s_tdone(xt_rsc_s_tdone)
    );
  peaseNTT_core_xt_rsci_xt_rsc_wait_ctrl peaseNTT_core_xt_rsci_xt_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .xt_rsci_oswt(xt_rsci_oswt),
      .xt_rsci_oswt_1(xt_rsci_oswt_1),
      .xt_rsci_biwt(xt_rsci_biwt),
      .xt_rsci_bdwt(xt_rsci_bdwt),
      .xt_rsci_bcwt(xt_rsci_bcwt),
      .xt_rsci_s_re_core_sct(xt_rsci_s_re_core_sct),
      .xt_rsci_biwt_1(xt_rsci_biwt_1),
      .xt_rsci_bdwt_2(xt_rsci_bdwt_2),
      .xt_rsci_bcwt_1(xt_rsci_bcwt_1),
      .xt_rsci_s_we_core_sct(xt_rsci_s_we_core_sct),
      .xt_rsci_s_rrdy(xt_rsci_s_rrdy),
      .xt_rsci_s_wrdy(xt_rsci_s_wrdy)
    );
  peaseNTT_core_xt_rsci_xt_rsc_wait_dp peaseNTT_core_xt_rsci_xt_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .xt_rsci_oswt(xt_rsci_oswt),
      .xt_rsci_wen_comp(xt_rsci_wen_comp),
      .xt_rsci_oswt_1(xt_rsci_oswt_1),
      .xt_rsci_wen_comp_1(xt_rsci_wen_comp_1),
      .xt_rsci_s_raddr_core(xt_rsci_s_raddr_core),
      .xt_rsci_s_waddr_core(xt_rsci_s_waddr_core),
      .xt_rsci_s_din_mxwt(xt_rsci_s_din_mxwt),
      .xt_rsci_s_dout_core(xt_rsci_s_dout_core),
      .xt_rsci_biwt(xt_rsci_biwt),
      .xt_rsci_bdwt(xt_rsci_bdwt),
      .xt_rsci_bcwt(xt_rsci_bcwt),
      .xt_rsci_biwt_1(xt_rsci_biwt_1),
      .xt_rsci_bdwt_2(xt_rsci_bdwt_2),
      .xt_rsci_bcwt_1(xt_rsci_bcwt_1),
      .xt_rsci_s_raddr(xt_rsci_s_raddr),
      .xt_rsci_s_raddr_core_sct(xt_rsci_s_re_core_sct),
      .xt_rsci_s_waddr(xt_rsci_s_waddr),
      .xt_rsci_s_waddr_core_sct(xt_rsci_s_we_core_sct),
      .xt_rsci_s_din(xt_rsci_s_din),
      .xt_rsci_s_dout(xt_rsci_s_dout)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    peaseNTT_core
// ------------------------------------------------------------------


module peaseNTT_core (
  clk, rst, xt_rsc_s_tdone, xt_rsc_tr_write_done, xt_rsc_RREADY, xt_rsc_RVALID, xt_rsc_RUSER,
      xt_rsc_RLAST, xt_rsc_RRESP, xt_rsc_RDATA, xt_rsc_RID, xt_rsc_ARREADY, xt_rsc_ARVALID,
      xt_rsc_ARUSER, xt_rsc_ARREGION, xt_rsc_ARQOS, xt_rsc_ARPROT, xt_rsc_ARCACHE,
      xt_rsc_ARLOCK, xt_rsc_ARBURST, xt_rsc_ARSIZE, xt_rsc_ARLEN, xt_rsc_ARADDR,
      xt_rsc_ARID, xt_rsc_BREADY, xt_rsc_BVALID, xt_rsc_BUSER, xt_rsc_BRESP, xt_rsc_BID,
      xt_rsc_WREADY, xt_rsc_WVALID, xt_rsc_WUSER, xt_rsc_WLAST, xt_rsc_WSTRB, xt_rsc_WDATA,
      xt_rsc_AWREADY, xt_rsc_AWVALID, xt_rsc_AWUSER, xt_rsc_AWREGION, xt_rsc_AWQOS,
      xt_rsc_AWPROT, xt_rsc_AWCACHE, xt_rsc_AWLOCK, xt_rsc_AWBURST, xt_rsc_AWSIZE,
      xt_rsc_AWLEN, xt_rsc_AWADDR, xt_rsc_AWID, xt_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_triosy_lz, twiddle_rsc_s_tdone, twiddle_rsc_tr_write_done, twiddle_rsc_RREADY,
      twiddle_rsc_RVALID, twiddle_rsc_RUSER, twiddle_rsc_RLAST, twiddle_rsc_RRESP,
      twiddle_rsc_RDATA, twiddle_rsc_RID, twiddle_rsc_ARREADY, twiddle_rsc_ARVALID,
      twiddle_rsc_ARUSER, twiddle_rsc_ARREGION, twiddle_rsc_ARQOS, twiddle_rsc_ARPROT,
      twiddle_rsc_ARCACHE, twiddle_rsc_ARLOCK, twiddle_rsc_ARBURST, twiddle_rsc_ARSIZE,
      twiddle_rsc_ARLEN, twiddle_rsc_ARADDR, twiddle_rsc_ARID, twiddle_rsc_BREADY,
      twiddle_rsc_BVALID, twiddle_rsc_BUSER, twiddle_rsc_BRESP, twiddle_rsc_BID,
      twiddle_rsc_WREADY, twiddle_rsc_WVALID, twiddle_rsc_WUSER, twiddle_rsc_WLAST,
      twiddle_rsc_WSTRB, twiddle_rsc_WDATA, twiddle_rsc_AWREADY, twiddle_rsc_AWVALID,
      twiddle_rsc_AWUSER, twiddle_rsc_AWREGION, twiddle_rsc_AWQOS, twiddle_rsc_AWPROT,
      twiddle_rsc_AWCACHE, twiddle_rsc_AWLOCK, twiddle_rsc_AWBURST, twiddle_rsc_AWSIZE,
      twiddle_rsc_AWLEN, twiddle_rsc_AWADDR, twiddle_rsc_AWID, twiddle_rsc_triosy_lz,
      twiddle_h_rsc_s_tdone, twiddle_h_rsc_tr_write_done, twiddle_h_rsc_RREADY, twiddle_h_rsc_RVALID,
      twiddle_h_rsc_RUSER, twiddle_h_rsc_RLAST, twiddle_h_rsc_RRESP, twiddle_h_rsc_RDATA,
      twiddle_h_rsc_RID, twiddle_h_rsc_ARREADY, twiddle_h_rsc_ARVALID, twiddle_h_rsc_ARUSER,
      twiddle_h_rsc_ARREGION, twiddle_h_rsc_ARQOS, twiddle_h_rsc_ARPROT, twiddle_h_rsc_ARCACHE,
      twiddle_h_rsc_ARLOCK, twiddle_h_rsc_ARBURST, twiddle_h_rsc_ARSIZE, twiddle_h_rsc_ARLEN,
      twiddle_h_rsc_ARADDR, twiddle_h_rsc_ARID, twiddle_h_rsc_BREADY, twiddle_h_rsc_BVALID,
      twiddle_h_rsc_BUSER, twiddle_h_rsc_BRESP, twiddle_h_rsc_BID, twiddle_h_rsc_WREADY,
      twiddle_h_rsc_WVALID, twiddle_h_rsc_WUSER, twiddle_h_rsc_WLAST, twiddle_h_rsc_WSTRB,
      twiddle_h_rsc_WDATA, twiddle_h_rsc_AWREADY, twiddle_h_rsc_AWVALID, twiddle_h_rsc_AWUSER,
      twiddle_h_rsc_AWREGION, twiddle_h_rsc_AWQOS, twiddle_h_rsc_AWPROT, twiddle_h_rsc_AWCACHE,
      twiddle_h_rsc_AWLOCK, twiddle_h_rsc_AWBURST, twiddle_h_rsc_AWSIZE, twiddle_h_rsc_AWLEN,
      twiddle_h_rsc_AWADDR, twiddle_h_rsc_AWID, twiddle_h_rsc_triosy_lz, yt_rsci_clken_d,
      yt_rsci_d_d, yt_rsci_q_d, yt_rsci_radr_d, yt_rsci_wadr_d, yt_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      yt_rsci_we_d_pff
);
  input clk;
  input rst;
  input xt_rsc_s_tdone;
  input xt_rsc_tr_write_done;
  input xt_rsc_RREADY;
  output xt_rsc_RVALID;
  output xt_rsc_RUSER;
  output xt_rsc_RLAST;
  output [1:0] xt_rsc_RRESP;
  output [31:0] xt_rsc_RDATA;
  output xt_rsc_RID;
  output xt_rsc_ARREADY;
  input xt_rsc_ARVALID;
  input xt_rsc_ARUSER;
  input [3:0] xt_rsc_ARREGION;
  input [3:0] xt_rsc_ARQOS;
  input [2:0] xt_rsc_ARPROT;
  input [3:0] xt_rsc_ARCACHE;
  input xt_rsc_ARLOCK;
  input [1:0] xt_rsc_ARBURST;
  input [2:0] xt_rsc_ARSIZE;
  input [7:0] xt_rsc_ARLEN;
  input [11:0] xt_rsc_ARADDR;
  input xt_rsc_ARID;
  input xt_rsc_BREADY;
  output xt_rsc_BVALID;
  output xt_rsc_BUSER;
  output [1:0] xt_rsc_BRESP;
  output xt_rsc_BID;
  output xt_rsc_WREADY;
  input xt_rsc_WVALID;
  input xt_rsc_WUSER;
  input xt_rsc_WLAST;
  input [3:0] xt_rsc_WSTRB;
  input [31:0] xt_rsc_WDATA;
  output xt_rsc_AWREADY;
  input xt_rsc_AWVALID;
  input xt_rsc_AWUSER;
  input [3:0] xt_rsc_AWREGION;
  input [3:0] xt_rsc_AWQOS;
  input [2:0] xt_rsc_AWPROT;
  input [3:0] xt_rsc_AWCACHE;
  input xt_rsc_AWLOCK;
  input [1:0] xt_rsc_AWBURST;
  input [2:0] xt_rsc_AWSIZE;
  input [7:0] xt_rsc_AWLEN;
  input [11:0] xt_rsc_AWADDR;
  input xt_rsc_AWID;
  output xt_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
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
  output yt_rsci_clken_d;
  output [31:0] yt_rsci_d_d;
  input [31:0] yt_rsci_q_d;
  output [9:0] yt_rsci_radr_d;
  output [9:0] yt_rsci_wadr_d;
  output yt_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output yt_rsci_we_d_pff;


  // Interconnect Declarations
  wire core_wen;
  wire core_wten;
  wire xt_rsci_wen_comp;
  wire xt_rsci_wen_comp_1;
  wire [31:0] xt_rsci_s_din_mxwt;
  reg [31:0] xt_rsci_s_dout_core;
  wire [31:0] p_rsci_idat;
  wire twiddle_rsci_wen_comp;
  wire [31:0] twiddle_rsci_s_din_mxwt;
  wire twiddle_h_rsci_wen_comp;
  wire [31:0] twiddle_h_rsci_s_din_mxwt;
  wire mult_z_mul_cmp_en;
  wire [51:0] mult_z_mul_cmp_z;
  reg xt_rsci_s_raddr_core_0;
  reg xt_rsci_s_waddr_core_9;
  wire [57:0] fsm_output;
  wire and_dcpl_6;
  wire and_dcpl_8;
  wire and_dcpl_11;
  wire and_dcpl_18;
  wire or_dcpl_31;
  wire or_dcpl_36;
  wire or_dcpl_40;
  wire or_dcpl_43;
  wire or_dcpl_44;
  wire or_dcpl_47;
  wire and_dcpl_24;
  wire or_dcpl_49;
  wire or_dcpl_51;
  wire or_dcpl_55;
  wire or_dcpl_64;
  wire or_dcpl_65;
  wire or_dcpl_69;
  wire or_dcpl_91;
  wire or_tmp_45;
  wire or_tmp_46;
  wire or_tmp_48;
  reg c_1_sva;
  reg [9:0] INNER_LOOP1_r_9_0_sva_1;
  reg modulo_add_3_slc_32_svs_st;
  wire [31:0] modulo_add_base_2_sva_mx0w6;
  wire [32:0] nl_modulo_add_base_2_sva_mx0w6;
  wire [31:0] modulo_add_base_1_sva_mx0w5;
  wire [32:0] nl_modulo_add_base_1_sva_mx0w5;
  wire [31:0] modulo_add_base_sva_mx0w2;
  wire [32:0] nl_modulo_add_base_sva_mx0w2;
  reg [31:0] mult_res_sva;
  reg [31:0] p_sva;
  reg reg_xt_rsci_oswt_cse;
  reg reg_xt_rsci_oswt_1_cse;
  reg [8:0] reg_xt_rsci_s_raddr_core_9_1_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_twiddle_rsci_s_raddr_core_2_cse;
  reg [4:0] reg_twiddle_rsci_s_raddr_core_7_3_cse;
  reg [1:0] reg_twiddle_rsci_s_raddr_core_1_0_cse;
  reg reg_twiddle_rsci_s_raddr_core_8_cse;
  reg reg_yt_rsc_cgo_cse;
  reg reg_xt_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  wire or_174_rmff;
  wire or_184_rmff;
  reg [31:0] mult_1_z_slc_mult_z_mul_cmp_z_31_0_itm;
  reg [31:0] butterFly1_1_f1_sva;
  reg [31:0] modulo_sub_mux_itm;
  reg [8:0] INNER_LOOP1_r_9_0_sva_8_0;
  wire [2:0] operator_33_true_2_lshift_itm;
  wire [1:0] operator_33_true_3_lshift_itm;
  wire [8:0] z_out;
  wire [31:0] z_out_1;
  wire [31:0] z_out_2;
  wire [31:0] z_out_4;
  wire or_tmp_98;
  wire [9:0] z_out_7;
  wire [10:0] nl_z_out_7;
  reg [31:0] modulo_sub_1_mux_itm;
  reg [31:0] modulo_sub_3_mux_itm;
  wire INNER_LOOP1_r_9_0_sva_8_0_mx0c0;
  wire [8:0] INNER_LOOP1_tw_and_psp_sva_1;
  wire [31:0] modulo_add_base_3_sva_mx0w7;
  wire [32:0] nl_modulo_add_base_3_sva_mx0w7;
  wire butterFly1_1_f1_sva_mx0c3;
  wire mult_1_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c1;
  wire [7:0] INNER_LOOP2_tw_and_psp_7_0_sva_1;
  wire [2:0] butterFly2_tw_and_psp_2_0_sva_1;
  reg [31:0] reg_mult_res_lpi_3_dfm_cse;
  reg reg_modulo_add_slc_32_svs_st_cse;
  wire operator_20_false_and_2_ssc;
  reg reg_operator_20_false_acc_ftd;
  reg [1:0] reg_operator_20_false_acc_ftd_1;
  wire operator_20_false_or_m1c;
  reg operator_33_true_return_8_0_sva_8;
  reg [7:0] operator_33_true_return_8_0_sva_7_0;
  wire and_290_cse;
  wire mult_res_or_2_cse;

  wire[0:0] c_mux_1_nl;
  wire[0:0] c_c_or_1_nl;
  wire[1:0] butterFly2_1_tw_and_nl;
  wire[0:0] or_173_nl;
  wire[0:0] operator_20_false_and_3_nl;
  wire[0:0] operator_20_false_and_4_nl;
  wire[0:0] INNER_LOOP1_r_not_4_nl;
  wire[33:0] acc_4_nl;
  wire[34:0] nl_acc_4_nl;
  wire[31:0] modulo_sub_qif_acc_nl;
  wire[32:0] nl_modulo_sub_qif_acc_nl;
  wire[33:0] acc_5_nl;
  wire[34:0] nl_acc_5_nl;
  wire[31:0] modulo_add_mux1h_3_nl;
  wire[31:0] modulo_sub_1_qif_acc_nl;
  wire[32:0] nl_modulo_sub_1_qif_acc_nl;
  wire[31:0] modulo_sub_3_qif_acc_nl;
  wire[32:0] nl_modulo_sub_3_qif_acc_nl;
  wire[32:0] modulo_add_3_acc_1_nl;
  wire[33:0] nl_modulo_add_3_acc_1_nl;
  wire[32:0] acc_nl;
  wire[33:0] nl_acc_nl;
  wire[31:0] modulo_add_qif_modulo_add_qif_mux_1_nl;
  wire[0:0] modulo_add_qif_or_1_nl;
  wire[32:0] acc_1_nl;
  wire[33:0] nl_acc_1_nl;
  wire[31:0] mult_res_mux_2_nl;
  wire[31:0] mult_res_mult_res_mux_1_nl;
  wire[32:0] acc_3_nl;
  wire[33:0] nl_acc_3_nl;
  wire[8:0] operator_20_false_mux_3_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_mult_z_mul_cmp_a;
  assign nl_mult_z_mul_cmp_a = MUX1HOT_v_32_4_2(xt_rsci_s_din_mxwt, mult_1_z_slc_mult_z_mul_cmp_z_31_0_itm,
      (mult_z_mul_cmp_z[51:20]), yt_rsci_q_d, {or_dcpl_44 , or_tmp_45 , or_tmp_46
      , or_dcpl_65});
  wire [31:0] nl_mult_z_mul_cmp_b;
  assign nl_mult_z_mul_cmp_b = MUX1HOT_v_32_3_2(twiddle_h_rsci_s_din_mxwt, butterFly1_1_f1_sva,
      p_sva, {or_tmp_48 , or_tmp_45 , or_tmp_46});
  wire [2:0] nl_operator_33_true_2_lshift_rg_s;
  assign nl_operator_33_true_2_lshift_rg_s = {1'b0 , (~ c_1_sva) , 1'b1};
  wire [2:0] nl_operator_33_true_3_lshift_rg_s;
  assign nl_operator_33_true_3_lshift_rg_s = {1'b0 , (~ c_1_sva) , 1'b0};
  wire[2:0] operator_33_true_mux_nl;
  wire [3:0] nl_operator_33_true_1_lshift_rg_s;
  assign operator_33_true_mux_nl = MUX_v_3_2_2((z_out_7[2:0]), ({reg_operator_20_false_acc_ftd
      , reg_operator_20_false_acc_ftd_1}), fsm_output[15]);
  assign nl_operator_33_true_1_lshift_rg_s = {operator_33_true_mux_nl , (~ (fsm_output[15]))};
  wire [9:0] nl_peaseNTT_core_xt_rsci_inst_xt_rsci_s_raddr_core;
  assign nl_peaseNTT_core_xt_rsci_inst_xt_rsci_s_raddr_core = {reg_xt_rsci_s_raddr_core_9_1_cse
      , xt_rsci_s_raddr_core_0};
  wire [9:0] nl_peaseNTT_core_xt_rsci_inst_xt_rsci_s_waddr_core;
  assign nl_peaseNTT_core_xt_rsci_inst_xt_rsci_s_waddr_core = {xt_rsci_s_waddr_core_9
      , reg_xt_rsci_s_raddr_core_9_1_cse};
  wire [9:0] nl_peaseNTT_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core = {1'b0 , reg_twiddle_rsci_s_raddr_core_8_cse
      , reg_twiddle_rsci_s_raddr_core_7_3_cse , reg_twiddle_rsci_s_raddr_core_2_cse
      , reg_twiddle_rsci_s_raddr_core_1_0_cse};
  wire [9:0] nl_peaseNTT_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core;
  assign nl_peaseNTT_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core = {1'b0
      , reg_twiddle_rsci_s_raddr_core_8_cse , reg_twiddle_rsci_s_raddr_core_7_3_cse
      , reg_twiddle_rsci_s_raddr_core_2_cse , reg_twiddle_rsci_s_raddr_core_1_0_cse};
  wire [0:0] nl_peaseNTT_core_core_fsm_inst_INNER_LOOP1_C_12_tr0;
  assign nl_peaseNTT_core_core_fsm_inst_INNER_LOOP1_C_12_tr0 = INNER_LOOP1_r_9_0_sva_1[9];
  wire [0:0] nl_peaseNTT_core_core_fsm_inst_INNER_LOOP2_C_12_tr0;
  assign nl_peaseNTT_core_core_fsm_inst_INNER_LOOP2_C_12_tr0 = ((reg_operator_20_false_acc_ftd_1[0])
      ^ (reg_operator_20_false_acc_ftd_1[1])) & (INNER_LOOP1_r_9_0_sva_1[9]);
  wire [0:0] nl_peaseNTT_core_core_fsm_inst_INNER_LOOP2_C_12_tr1;
  assign nl_peaseNTT_core_core_fsm_inst_INNER_LOOP2_C_12_tr1 = ~ (INNER_LOOP1_r_9_0_sva_1[9]);
  wire [0:0] nl_peaseNTT_core_core_fsm_inst_INNER_LOOP3_C_12_tr0;
  assign nl_peaseNTT_core_core_fsm_inst_INNER_LOOP3_C_12_tr0 = INNER_LOOP1_r_9_0_sva_1[9];
  wire [0:0] nl_peaseNTT_core_core_fsm_inst_INNER_LOOP4_C_12_tr0;
  assign nl_peaseNTT_core_core_fsm_inst_INNER_LOOP4_C_12_tr0 = and_dcpl_6;
  wire [0:0] nl_peaseNTT_core_core_fsm_inst_INNER_LOOP4_C_12_tr1;
  assign nl_peaseNTT_core_core_fsm_inst_INNER_LOOP4_C_12_tr1 = ~ (INNER_LOOP1_r_9_0_sva_1[9]);
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
  .width_s(32'sd3),
  .width_z(32'sd3)) operator_33_true_2_lshift_rg (
      .a(1'b1),
      .s(nl_operator_33_true_2_lshift_rg_s[2:0]),
      .z(operator_33_true_2_lshift_itm)
    );
  mgc_shift_bl_v5 #(.width_a(32'sd1),
  .signd_a(32'sd1),
  .width_s(32'sd3),
  .width_z(32'sd2)) operator_33_true_3_lshift_rg (
      .a(1'b1),
      .s(nl_operator_33_true_3_lshift_rg_s[2:0]),
      .z(operator_33_true_3_lshift_itm)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd1),
  .width_s(32'sd4),
  .width_z(32'sd9)) operator_33_true_1_lshift_rg (
      .a(1'b1),
      .s(nl_operator_33_true_1_lshift_rg_s[3:0]),
      .z(z_out)
    );
  peaseNTT_core_wait_dp peaseNTT_core_wait_dp_inst (
      .yt_rsc_cgo_iro(or_174_rmff),
      .yt_rsci_clken_d(yt_rsci_clken_d),
      .ensig_cgo_iro(or_184_rmff),
      .core_wen(core_wen),
      .yt_rsc_cgo(reg_yt_rsc_cgo_cse),
      .ensig_cgo(reg_ensig_cgo_cse),
      .mult_z_mul_cmp_en(mult_z_mul_cmp_en)
    );
  peaseNTT_core_xt_rsci peaseNTT_core_xt_rsci_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_s_tdone(xt_rsc_s_tdone),
      .xt_rsc_tr_write_done(xt_rsc_tr_write_done),
      .xt_rsc_RREADY(xt_rsc_RREADY),
      .xt_rsc_RVALID(xt_rsc_RVALID),
      .xt_rsc_RUSER(xt_rsc_RUSER),
      .xt_rsc_RLAST(xt_rsc_RLAST),
      .xt_rsc_RRESP(xt_rsc_RRESP),
      .xt_rsc_RDATA(xt_rsc_RDATA),
      .xt_rsc_RID(xt_rsc_RID),
      .xt_rsc_ARREADY(xt_rsc_ARREADY),
      .xt_rsc_ARVALID(xt_rsc_ARVALID),
      .xt_rsc_ARUSER(xt_rsc_ARUSER),
      .xt_rsc_ARREGION(xt_rsc_ARREGION),
      .xt_rsc_ARQOS(xt_rsc_ARQOS),
      .xt_rsc_ARPROT(xt_rsc_ARPROT),
      .xt_rsc_ARCACHE(xt_rsc_ARCACHE),
      .xt_rsc_ARLOCK(xt_rsc_ARLOCK),
      .xt_rsc_ARBURST(xt_rsc_ARBURST),
      .xt_rsc_ARSIZE(xt_rsc_ARSIZE),
      .xt_rsc_ARLEN(xt_rsc_ARLEN),
      .xt_rsc_ARADDR(xt_rsc_ARADDR),
      .xt_rsc_ARID(xt_rsc_ARID),
      .xt_rsc_BREADY(xt_rsc_BREADY),
      .xt_rsc_BVALID(xt_rsc_BVALID),
      .xt_rsc_BUSER(xt_rsc_BUSER),
      .xt_rsc_BRESP(xt_rsc_BRESP),
      .xt_rsc_BID(xt_rsc_BID),
      .xt_rsc_WREADY(xt_rsc_WREADY),
      .xt_rsc_WVALID(xt_rsc_WVALID),
      .xt_rsc_WUSER(xt_rsc_WUSER),
      .xt_rsc_WLAST(xt_rsc_WLAST),
      .xt_rsc_WSTRB(xt_rsc_WSTRB),
      .xt_rsc_WDATA(xt_rsc_WDATA),
      .xt_rsc_AWREADY(xt_rsc_AWREADY),
      .xt_rsc_AWVALID(xt_rsc_AWVALID),
      .xt_rsc_AWUSER(xt_rsc_AWUSER),
      .xt_rsc_AWREGION(xt_rsc_AWREGION),
      .xt_rsc_AWQOS(xt_rsc_AWQOS),
      .xt_rsc_AWPROT(xt_rsc_AWPROT),
      .xt_rsc_AWCACHE(xt_rsc_AWCACHE),
      .xt_rsc_AWLOCK(xt_rsc_AWLOCK),
      .xt_rsc_AWBURST(xt_rsc_AWBURST),
      .xt_rsc_AWSIZE(xt_rsc_AWSIZE),
      .xt_rsc_AWLEN(xt_rsc_AWLEN),
      .xt_rsc_AWADDR(xt_rsc_AWADDR),
      .xt_rsc_AWID(xt_rsc_AWID),
      .core_wen(core_wen),
      .xt_rsci_oswt(reg_xt_rsci_oswt_cse),
      .xt_rsci_wen_comp(xt_rsci_wen_comp),
      .xt_rsci_oswt_1(reg_xt_rsci_oswt_1_cse),
      .xt_rsci_wen_comp_1(xt_rsci_wen_comp_1),
      .xt_rsci_s_raddr_core(nl_peaseNTT_core_xt_rsci_inst_xt_rsci_s_raddr_core[9:0]),
      .xt_rsci_s_waddr_core(nl_peaseNTT_core_xt_rsci_inst_xt_rsci_s_waddr_core[9:0]),
      .xt_rsci_s_din_mxwt(xt_rsci_s_din_mxwt),
      .xt_rsci_s_dout_core(xt_rsci_s_dout_core)
    );
  peaseNTT_core_twiddle_rsci peaseNTT_core_twiddle_rsci_inst (
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
      .twiddle_rsci_s_raddr_core(nl_peaseNTT_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core[9:0]),
      .twiddle_rsci_s_din_mxwt(twiddle_rsci_s_din_mxwt)
    );
  peaseNTT_core_twiddle_h_rsci peaseNTT_core_twiddle_h_rsci_inst (
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
      .twiddle_h_rsci_s_raddr_core(nl_peaseNTT_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core[9:0]),
      .twiddle_h_rsci_s_din_mxwt(twiddle_h_rsci_s_din_mxwt)
    );
  peaseNTT_core_xt_rsc_triosy_obj peaseNTT_core_xt_rsc_triosy_obj_inst (
      .xt_rsc_triosy_lz(xt_rsc_triosy_lz),
      .core_wten(core_wten),
      .xt_rsc_triosy_obj_iswt0(reg_xt_rsc_triosy_obj_iswt0_cse)
    );
  peaseNTT_core_p_rsc_triosy_obj peaseNTT_core_p_rsc_triosy_obj_inst (
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(reg_xt_rsc_triosy_obj_iswt0_cse)
    );
  peaseNTT_core_r_rsc_triosy_obj peaseNTT_core_r_rsc_triosy_obj_inst (
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(reg_xt_rsc_triosy_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_rsc_triosy_obj peaseNTT_core_twiddle_rsc_triosy_obj_inst
      (
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(reg_xt_rsc_triosy_obj_iswt0_cse)
    );
  peaseNTT_core_twiddle_h_rsc_triosy_obj peaseNTT_core_twiddle_h_rsc_triosy_obj_inst
      (
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(reg_xt_rsc_triosy_obj_iswt0_cse)
    );
  peaseNTT_core_staller peaseNTT_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .xt_rsci_wen_comp(xt_rsci_wen_comp),
      .xt_rsci_wen_comp_1(xt_rsci_wen_comp_1),
      .twiddle_rsci_wen_comp(twiddle_rsci_wen_comp),
      .twiddle_h_rsci_wen_comp(twiddle_h_rsci_wen_comp)
    );
  peaseNTT_core_core_fsm peaseNTT_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output),
      .INNER_LOOP1_C_12_tr0(nl_peaseNTT_core_core_fsm_inst_INNER_LOOP1_C_12_tr0[0:0]),
      .INNER_LOOP2_C_12_tr0(nl_peaseNTT_core_core_fsm_inst_INNER_LOOP2_C_12_tr0[0:0]),
      .INNER_LOOP2_C_12_tr1(nl_peaseNTT_core_core_fsm_inst_INNER_LOOP2_C_12_tr1[0:0]),
      .INNER_LOOP3_C_12_tr0(nl_peaseNTT_core_core_fsm_inst_INNER_LOOP3_C_12_tr0[0:0]),
      .INNER_LOOP4_C_12_tr0(nl_peaseNTT_core_core_fsm_inst_INNER_LOOP4_C_12_tr0[0:0]),
      .INNER_LOOP4_C_12_tr1(nl_peaseNTT_core_core_fsm_inst_INNER_LOOP4_C_12_tr1[0:0])
    );
  assign or_174_rmff = (fsm_output[41]) | (fsm_output[42]) | (fsm_output[18]) | (fsm_output[14])
      | (fsm_output[13]) | (fsm_output[17]) | or_dcpl_55 | (fsm_output[40]) | (fsm_output[12])
      | (fsm_output[44]) | (fsm_output[16]);
  assign or_184_rmff = (fsm_output[36]) | (fsm_output[33]) | (fsm_output[50]) | (fsm_output[47])
      | (fsm_output[35]) | (fsm_output[49]) | (fsm_output[22]) | (fsm_output[21])
      | (fsm_output[20]) | (fsm_output[34]) | (fsm_output[48]) | (fsm_output[19])
      | (fsm_output[18]) | (fsm_output[8]) | (fsm_output[7]) | or_dcpl_65 | (fsm_output[46])
      | (fsm_output[6]) | (fsm_output[5]) | (fsm_output[31]) | or_dcpl_69 | (fsm_output[3]);
  assign operator_20_false_and_2_ssc = core_wen & ((~(((~ (INNER_LOOP1_r_9_0_sva_1[9]))
      & (fsm_output[28])) | (~((~ and_dcpl_18) | (fsm_output[52]) | (fsm_output[51])
      | (fsm_output[49]) | (fsm_output[48]) | (fsm_output[45]) | (fsm_output[46])
      | (~ and_dcpl_11) | (fsm_output[57]) | (fsm_output[53]) | (fsm_output[54])
      | (~ and_dcpl_8) | (fsm_output[0]) | (fsm_output[44]))))) | (fsm_output[1])
      | (fsm_output[29]));
  assign operator_20_false_or_m1c = ((INNER_LOOP1_r_9_0_sva_1[9]) & (fsm_output[28]))
      | or_dcpl_40 | or_dcpl_36 | or_dcpl_55 | (fsm_output[56:55]!=2'b00) | or_dcpl_31
      | (fsm_output[43]) | (fsm_output[0]) | (fsm_output[44]);
  assign and_290_cse = (fsm_output[14:2]==13'b0000000000000);
  assign INNER_LOOP1_tw_and_psp_sva_1 = ({operator_33_true_return_8_0_sva_8 , operator_33_true_return_8_0_sva_7_0})
      & INNER_LOOP1_r_9_0_sva_8_0;
  assign nl_modulo_add_base_sva_mx0w2 = butterFly1_1_f1_sva + reg_mult_res_lpi_3_dfm_cse;
  assign modulo_add_base_sva_mx0w2 = nl_modulo_add_base_sva_mx0w2[31:0];
  assign nl_modulo_add_base_1_sva_mx0w5 = butterFly1_1_f1_sva + reg_mult_res_lpi_3_dfm_cse;
  assign modulo_add_base_1_sva_mx0w5 = nl_modulo_add_base_1_sva_mx0w5[31:0];
  assign nl_modulo_add_base_2_sva_mx0w6 = butterFly1_1_f1_sva + reg_mult_res_lpi_3_dfm_cse;
  assign modulo_add_base_2_sva_mx0w6 = nl_modulo_add_base_2_sva_mx0w6[31:0];
  assign nl_modulo_add_base_3_sva_mx0w7 = butterFly1_1_f1_sva + reg_mult_res_lpi_3_dfm_cse;
  assign modulo_add_base_3_sva_mx0w7 = nl_modulo_add_base_3_sva_mx0w7[31:0];
  assign INNER_LOOP2_tw_and_psp_7_0_sva_1 = operator_33_true_return_8_0_sva_7_0 &
      (INNER_LOOP1_r_9_0_sva_8_0[7:0]);
  assign butterFly2_tw_and_psp_2_0_sva_1 = ({reg_operator_20_false_acc_ftd , reg_operator_20_false_acc_ftd_1})
      & (INNER_LOOP1_r_9_0_sva_8_0[2:0]);
  assign and_dcpl_6 = c_1_sva & (INNER_LOOP1_r_9_0_sva_1[9]);
  assign and_dcpl_8 = ~((fsm_output[43]) | (fsm_output[28]));
  assign and_dcpl_11 = ~((fsm_output[56:55]!=2'b00));
  assign and_dcpl_18 = ~((fsm_output[50]) | (fsm_output[47]));
  assign or_dcpl_31 = (fsm_output[54:53]!=2'b00);
  assign or_dcpl_36 = (fsm_output[49:48]!=2'b00);
  assign or_dcpl_40 = (fsm_output[50]) | (fsm_output[47]) | (fsm_output[52]) | (fsm_output[51]);
  assign or_dcpl_43 = (fsm_output[2]) | (fsm_output[30]);
  assign or_dcpl_44 = (fsm_output[31]) | (fsm_output[3]);
  assign or_dcpl_47 = (fsm_output[27]) | (fsm_output[55]);
  assign and_dcpl_24 = ~((fsm_output[2]) | (fsm_output[30]));
  assign or_dcpl_49 = (fsm_output[44]) | (fsm_output[16]);
  assign or_dcpl_51 = (fsm_output[30]) | (fsm_output[44]);
  assign or_dcpl_55 = (fsm_output[46:45]!=2'b00);
  assign or_dcpl_64 = (fsm_output[41]) | (fsm_output[13]);
  assign or_dcpl_65 = (fsm_output[17]) | (fsm_output[45]);
  assign or_dcpl_69 = (fsm_output[32]) | (fsm_output[4]);
  assign or_dcpl_91 = (fsm_output[18]) | (fsm_output[46]);
  assign or_tmp_45 = or_dcpl_91 | or_dcpl_69;
  assign or_tmp_46 = (fsm_output[20]) | (fsm_output[34]) | (fsm_output[48]) | (fsm_output[6]);
  assign or_tmp_48 = or_dcpl_65 | or_dcpl_44;
  assign INNER_LOOP1_r_9_0_sva_8_0_mx0c0 = (fsm_output[29]) | (fsm_output[1]) | (fsm_output[43])
      | (fsm_output[15]);
  assign butterFly1_1_f1_sva_mx0c3 = (modulo_add_3_slc_32_svs_st & (fsm_output[54]))
      | (reg_modulo_add_slc_32_svs_st_cse & (fsm_output[26])) | (reg_modulo_add_slc_32_svs_st_cse
      & (fsm_output[12])) | (reg_modulo_add_slc_32_svs_st_cse & (fsm_output[40]));
  assign mult_1_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c1 = (fsm_output[35]) | (fsm_output[49])
      | (fsm_output[21]) | (fsm_output[7]);
  assign yt_rsci_d_d = MUX1HOT_v_32_3_2(modulo_sub_mux_itm, butterFly1_1_f1_sva,
      modulo_sub_1_mux_itm, {(fsm_output[12]) , or_dcpl_64 , (fsm_output[40])});
  assign yt_rsci_radr_d = {INNER_LOOP1_r_9_0_sva_8_0 , (~ or_dcpl_65)};
  assign yt_rsci_wadr_d = {(~ or_dcpl_64) , INNER_LOOP1_r_9_0_sva_8_0};
  assign yt_rsci_we_d_pff = or_dcpl_64 | (fsm_output[40]) | (fsm_output[12]);
  assign yt_rsci_readA_r_ram_ir_internal_RMASK_B_d = or_dcpl_65 | or_dcpl_49;
  assign or_tmp_98 = (fsm_output[44]) | (fsm_output[30]) | (fsm_output[16]) | (fsm_output[2]);
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[57]) | (fsm_output[0])) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      c_1_sva <= 1'b0;
    end
    else if ( core_wen & ((fsm_output[56]) | (fsm_output[28]) | (fsm_output[0]))
        ) begin
      c_1_sva <= c_mux_1_nl | (fsm_output[0]);
    end
  end
  always @(posedge clk) begin
    if ( core_wen ) begin
      xt_rsci_s_raddr_core_0 <= ~ and_dcpl_24;
      reg_xt_rsci_s_raddr_core_9_1_cse <= INNER_LOOP1_r_9_0_sva_8_0;
      xt_rsci_s_waddr_core_9 <= (fsm_output[54]) | (fsm_output[26]);
      xt_rsci_s_dout_core <= MUX1HOT_v_32_3_2(modulo_sub_1_mux_itm, butterFly1_1_f1_sva,
          modulo_sub_3_mux_itm, {(fsm_output[26]) , or_dcpl_47 , (fsm_output[54])});
      reg_twiddle_rsci_s_raddr_core_2_cse <= MUX1HOT_s_1_4_2((INNER_LOOP1_tw_and_psp_sva_1[2]),
          (INNER_LOOP2_tw_and_psp_7_0_sva_1[2]), (butterFly2_tw_and_psp_2_0_sva_1[2]),
          (INNER_LOOP1_r_9_0_sva_8_0[2]), {(fsm_output[2]) , (fsm_output[16]) , (fsm_output[30])
          , (fsm_output[44])});
      reg_twiddle_rsci_s_raddr_core_7_3_cse <= MUX1HOT_v_5_3_2((INNER_LOOP1_tw_and_psp_sva_1[7:3]),
          (INNER_LOOP2_tw_and_psp_7_0_sva_1[7:3]), (INNER_LOOP1_r_9_0_sva_8_0[7:3]),
          {(fsm_output[2]) , (fsm_output[16]) , or_dcpl_51});
      reg_twiddle_rsci_s_raddr_core_1_0_cse <= MUX1HOT_v_2_4_2((INNER_LOOP1_tw_and_psp_sva_1[1:0]),
          (INNER_LOOP2_tw_and_psp_7_0_sva_1[1:0]), (butterFly2_tw_and_psp_2_0_sva_1[1:0]),
          butterFly2_1_tw_and_nl, {(fsm_output[2]) , (fsm_output[16]) , (fsm_output[30])
          , (fsm_output[44])});
      reg_twiddle_rsci_s_raddr_core_8_cse <= MUX_s_1_2_2((INNER_LOOP1_tw_and_psp_sva_1[8]),
          (INNER_LOOP1_r_9_0_sva_8_0[8]), or_173_nl);
      mult_res_sva <= z_out_2;
      reg_mult_res_lpi_3_dfm_cse <= MUX_v_32_2_2(z_out_2, mult_res_sva, readslicef_34_1_33(acc_4_nl));
      modulo_sub_mux_itm <= MUX_v_32_2_2(({1'b0 , (z_out_1[30:0])}), modulo_sub_qif_acc_nl,
          z_out_1[31]);
      modulo_sub_1_mux_itm <= MUX_v_32_2_2(({1'b0 , (z_out_4[30:0])}), modulo_sub_1_qif_acc_nl,
          z_out_4[31]);
      modulo_sub_3_mux_itm <= MUX_v_32_2_2(({1'b0 , (z_out_1[30:0])}), modulo_sub_3_qif_acc_nl,
          z_out_1[31]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_xt_rsci_oswt_cse <= 1'b0;
      reg_xt_rsci_oswt_1_cse <= 1'b0;
      reg_twiddle_rsci_oswt_cse <= 1'b0;
      reg_yt_rsc_cgo_cse <= 1'b0;
      reg_xt_rsc_triosy_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_modulo_add_slc_32_svs_st_cse <= 1'b0;
      modulo_add_3_slc_32_svs_st <= 1'b0;
    end
    else if ( core_wen ) begin
      reg_xt_rsci_oswt_cse <= or_dcpl_44 | or_dcpl_43;
      reg_xt_rsci_oswt_1_cse <= or_dcpl_47 | (fsm_output[54]) | (fsm_output[26]);
      reg_twiddle_rsci_oswt_cse <= or_dcpl_43 | or_dcpl_49;
      reg_yt_rsc_cgo_cse <= or_174_rmff;
      reg_xt_rsc_triosy_obj_iswt0_cse <= and_dcpl_6 & (fsm_output[56]);
      reg_ensig_cgo_cse <= or_184_rmff;
      reg_modulo_add_slc_32_svs_st_cse <= readslicef_34_1_33(acc_5_nl);
      modulo_add_3_slc_32_svs_st <= readslicef_33_1_32(modulo_add_3_acc_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_operator_20_false_acc_ftd <= 1'b0;
    end
    else if ( operator_20_false_and_2_ssc ) begin
      reg_operator_20_false_acc_ftd <= MUX_s_1_2_2((z_out_7[2]), (operator_33_true_2_lshift_itm[2]),
          fsm_output[29]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_operator_20_false_acc_ftd_1 <= 2'b00;
    end
    else if ( operator_20_false_and_2_ssc & (~(or_dcpl_40 | or_dcpl_36 | (fsm_output[45])
        | (fsm_output[46]) | (fsm_output[56]) | (fsm_output[55]) | or_dcpl_31 | (fsm_output[44])))
        ) begin
      reg_operator_20_false_acc_ftd_1 <= MUX1HOT_v_2_5_2((z_out_7[1:0]), 2'b10, ({reg_operator_20_false_acc_ftd
          , (reg_operator_20_false_acc_ftd_1[1])}), operator_33_true_3_lshift_itm,
          (operator_33_true_2_lshift_itm[1:0]), {(fsm_output[1]) , operator_20_false_and_3_nl
          , operator_20_false_and_4_nl , (fsm_output[43]) , (fsm_output[29])});
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (INNER_LOOP1_r_9_0_sva_8_0_mx0c0 | (fsm_output[42]) | (fsm_output[14])
        | (fsm_output[56]) | (fsm_output[28])) ) begin
      INNER_LOOP1_r_9_0_sva_8_0 <= MUX_v_9_2_2(9'b000000000, (INNER_LOOP1_r_9_0_sva_1[8:0]),
          INNER_LOOP1_r_not_4_nl);
    end
  end
  always @(posedge clk) begin
    if ( and_290_cse & core_wen ) begin
      operator_33_true_return_8_0_sva_8 <= z_out[8];
    end
  end
  always @(posedge clk) begin
    if ( and_290_cse & (fsm_output[28:16]==13'b0000000000000) & core_wen ) begin
      operator_33_true_return_8_0_sva_7_0 <= z_out[7:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      INNER_LOOP1_r_9_0_sva_1 <= 10'b0000000000;
    end
    else if ( core_wen & (~(and_dcpl_24 & (~ (fsm_output[44])) & (~ (fsm_output[16]))))
        ) begin
      INNER_LOOP1_r_9_0_sva_1 <= z_out_7;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (or_tmp_48 | or_dcpl_69 | (fsm_output[11]) | butterFly1_1_f1_sva_mx0c3
        | or_dcpl_91 | (fsm_output[25]) | (fsm_output[39]) | (fsm_output[53])) )
        begin
      butterFly1_1_f1_sva <= MUX1HOT_v_32_8_2(twiddle_rsci_s_din_mxwt, xt_rsci_s_din_mxwt,
          modulo_add_base_sva_mx0w2, z_out_1, yt_rsci_q_d, modulo_add_base_1_sva_mx0w5,
          modulo_add_base_2_sva_mx0w6, modulo_add_base_3_sva_mx0w7, {or_tmp_48 ,
          or_dcpl_69 , (fsm_output[11]) , butterFly1_1_f1_sva_mx0c3 , or_dcpl_91
          , (fsm_output[25]) , (fsm_output[39]) , (fsm_output[53])});
    end
  end
  always @(posedge clk) begin
    if ( core_wen & (or_dcpl_44 | mult_1_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c1 |
        or_dcpl_65) ) begin
      mult_1_z_slc_mult_z_mul_cmp_z_31_0_itm <= MUX1HOT_v_32_3_2(xt_rsci_s_din_mxwt,
          (mult_z_mul_cmp_z[31:0]), yt_rsci_q_d, {or_dcpl_44 , mult_1_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c1
          , or_dcpl_65});
    end
  end
  assign c_c_or_1_nl = c_1_sva | (INNER_LOOP1_r_9_0_sva_1[9]);
  assign c_mux_1_nl = MUX_s_1_2_2((reg_operator_20_false_acc_ftd_1[0]), c_c_or_1_nl,
      fsm_output[56]);
  assign butterFly2_1_tw_and_nl = reg_operator_20_false_acc_ftd_1 & (INNER_LOOP1_r_9_0_sva_8_0[1:0]);
  assign or_173_nl = or_dcpl_51 | (fsm_output[16]);
  assign nl_acc_4_nl = ({1'b1 , mult_res_sva , 1'b1}) + conv_u2u_33_34({(~ p_sva)
      , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[33:0];
  assign nl_modulo_sub_qif_acc_nl = ({1'b1 , (z_out_1[30:0])}) + p_sva;
  assign modulo_sub_qif_acc_nl = nl_modulo_sub_qif_acc_nl[31:0];
  assign modulo_add_mux1h_3_nl = MUX1HOT_v_32_3_2((~ modulo_add_base_sva_mx0w2),
      (~ modulo_add_base_1_sva_mx0w5), (~ modulo_add_base_2_sva_mx0w6), {(fsm_output[11])
      , (fsm_output[25]) , (fsm_output[39])});
  assign nl_acc_5_nl = ({1'b1 , p_sva , 1'b1}) + conv_u2u_33_34({modulo_add_mux1h_3_nl
      , 1'b1});
  assign acc_5_nl = nl_acc_5_nl[33:0];
  assign nl_modulo_sub_1_qif_acc_nl = ({1'b1 , (z_out_4[30:0])}) + p_sva;
  assign modulo_sub_1_qif_acc_nl = nl_modulo_sub_1_qif_acc_nl[31:0];
  assign nl_modulo_sub_3_qif_acc_nl = ({1'b1 , (z_out_1[30:0])}) + p_sva;
  assign modulo_sub_3_qif_acc_nl = nl_modulo_sub_3_qif_acc_nl[31:0];
  assign nl_modulo_add_3_acc_1_nl = ({1'b1 , p_sva}) + conv_u2u_32_33(~ modulo_add_base_3_sva_mx0w7)
      + 33'b000000000000000000000000000000001;
  assign modulo_add_3_acc_1_nl = nl_modulo_add_3_acc_1_nl[32:0];
  assign operator_20_false_and_3_nl = (~((~ and_dcpl_18) | (fsm_output[52]) | (fsm_output[51])
      | (fsm_output[49]) | (fsm_output[48]) | (fsm_output[45]) | (fsm_output[46])
      | (~ and_dcpl_11) | (fsm_output[54:53]!=2'b00) | (~ and_dcpl_8) | (fsm_output[44])))
      & operator_20_false_or_m1c;
  assign operator_20_false_and_4_nl = (fsm_output[28]) & operator_20_false_or_m1c;
  assign INNER_LOOP1_r_not_4_nl = ~ INNER_LOOP1_r_9_0_sva_8_0_mx0c0;
  assign modulo_add_qif_or_1_nl = (fsm_output[11]) | (fsm_output[53]);
  assign modulo_add_qif_modulo_add_qif_mux_1_nl = MUX_v_32_2_2((~ p_sva), (~ reg_mult_res_lpi_3_dfm_cse),
      modulo_add_qif_or_1_nl);
  assign nl_acc_nl = ({butterFly1_1_f1_sva , 1'b1}) + ({modulo_add_qif_modulo_add_qif_mux_1_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[32:0];
  assign z_out_1 = readslicef_33_32_1(acc_nl);
  assign mult_res_or_2_cse = (fsm_output[10]) | (fsm_output[24]) | (fsm_output[38])
      | (fsm_output[52]);
  assign mult_res_mux_2_nl = MUX_v_32_2_2(mult_1_z_slc_mult_z_mul_cmp_z_31_0_itm,
      mult_res_sva, mult_res_or_2_cse);
  assign mult_res_mult_res_mux_1_nl = MUX_v_32_2_2((~ (mult_z_mul_cmp_z[31:0])),
      (~ p_sva), mult_res_or_2_cse);
  assign nl_acc_1_nl = ({mult_res_mux_2_nl , 1'b1}) + ({mult_res_mult_res_mux_1_nl
      , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[32:0];
  assign z_out_2 = readslicef_33_32_1(acc_1_nl);
  assign nl_acc_3_nl = ({butterFly1_1_f1_sva , 1'b1}) + ({(~ reg_mult_res_lpi_3_dfm_cse)
      , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[32:0];
  assign z_out_4 = readslicef_33_32_1(acc_3_nl);
  assign operator_20_false_mux_3_nl = MUX_v_9_2_2(({6'b000000 , reg_operator_20_false_acc_ftd_1
      , c_1_sva}), INNER_LOOP1_r_9_0_sva_8_0, or_tmp_98);
  assign nl_z_out_7 = conv_u2u_9_10(operator_20_false_mux_3_nl) + conv_s2u_2_10({(~
      or_tmp_98) , 1'b1});
  assign z_out_7 = nl_z_out_7[9:0];

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


  function automatic [9:0] conv_s2u_2_10 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_10 = {{8{vector[1]}}, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
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
//  Design Unit:    peaseNTT
// ------------------------------------------------------------------


module peaseNTT (
  clk, rst, xt_rsc_s_tdone, xt_rsc_tr_write_done, xt_rsc_RREADY, xt_rsc_RVALID, xt_rsc_RUSER,
      xt_rsc_RLAST, xt_rsc_RRESP, xt_rsc_RDATA, xt_rsc_RID, xt_rsc_ARREADY, xt_rsc_ARVALID,
      xt_rsc_ARUSER, xt_rsc_ARREGION, xt_rsc_ARQOS, xt_rsc_ARPROT, xt_rsc_ARCACHE,
      xt_rsc_ARLOCK, xt_rsc_ARBURST, xt_rsc_ARSIZE, xt_rsc_ARLEN, xt_rsc_ARADDR,
      xt_rsc_ARID, xt_rsc_BREADY, xt_rsc_BVALID, xt_rsc_BUSER, xt_rsc_BRESP, xt_rsc_BID,
      xt_rsc_WREADY, xt_rsc_WVALID, xt_rsc_WUSER, xt_rsc_WLAST, xt_rsc_WSTRB, xt_rsc_WDATA,
      xt_rsc_AWREADY, xt_rsc_AWVALID, xt_rsc_AWUSER, xt_rsc_AWREGION, xt_rsc_AWQOS,
      xt_rsc_AWPROT, xt_rsc_AWCACHE, xt_rsc_AWLOCK, xt_rsc_AWBURST, xt_rsc_AWSIZE,
      xt_rsc_AWLEN, xt_rsc_AWADDR, xt_rsc_AWID, xt_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_s_tdone, twiddle_rsc_tr_write_done,
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
      twiddle_h_rsc_triosy_lz
);
  input clk;
  input rst;
  input xt_rsc_s_tdone;
  input xt_rsc_tr_write_done;
  input xt_rsc_RREADY;
  output xt_rsc_RVALID;
  output xt_rsc_RUSER;
  output xt_rsc_RLAST;
  output [1:0] xt_rsc_RRESP;
  output [31:0] xt_rsc_RDATA;
  output xt_rsc_RID;
  output xt_rsc_ARREADY;
  input xt_rsc_ARVALID;
  input xt_rsc_ARUSER;
  input [3:0] xt_rsc_ARREGION;
  input [3:0] xt_rsc_ARQOS;
  input [2:0] xt_rsc_ARPROT;
  input [3:0] xt_rsc_ARCACHE;
  input xt_rsc_ARLOCK;
  input [1:0] xt_rsc_ARBURST;
  input [2:0] xt_rsc_ARSIZE;
  input [7:0] xt_rsc_ARLEN;
  input [11:0] xt_rsc_ARADDR;
  input xt_rsc_ARID;
  input xt_rsc_BREADY;
  output xt_rsc_BVALID;
  output xt_rsc_BUSER;
  output [1:0] xt_rsc_BRESP;
  output xt_rsc_BID;
  output xt_rsc_WREADY;
  input xt_rsc_WVALID;
  input xt_rsc_WUSER;
  input xt_rsc_WLAST;
  input [3:0] xt_rsc_WSTRB;
  input [31:0] xt_rsc_WDATA;
  output xt_rsc_AWREADY;
  input xt_rsc_AWVALID;
  input xt_rsc_AWUSER;
  input [3:0] xt_rsc_AWREGION;
  input [3:0] xt_rsc_AWQOS;
  input [2:0] xt_rsc_AWPROT;
  input [3:0] xt_rsc_AWCACHE;
  input xt_rsc_AWLOCK;
  input [1:0] xt_rsc_AWBURST;
  input [2:0] xt_rsc_AWSIZE;
  input [7:0] xt_rsc_AWLEN;
  input [11:0] xt_rsc_AWADDR;
  input xt_rsc_AWID;
  output xt_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
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


  // Interconnect Declarations
  wire yt_rsci_clken_d;
  wire [31:0] yt_rsci_d_d;
  wire [31:0] yt_rsci_q_d;
  wire [9:0] yt_rsci_radr_d;
  wire [9:0] yt_rsci_wadr_d;
  wire yt_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire yt_rsc_clken;
  wire [31:0] yt_rsc_q;
  wire [9:0] yt_rsc_radr;
  wire yt_rsc_we;
  wire [31:0] yt_rsc_d;
  wire [9:0] yt_rsc_wadr;
  wire yt_rsci_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  BLOCK_1R1W_RBW #(.addr_width(32'sd10),
  .data_width(32'sd32),
  .depth(32'sd1024),
  .latency(32'sd1)) yt_rsc_comp (
      .clk(clk),
      .clken(yt_rsc_clken),
      .d(yt_rsc_d),
      .q(yt_rsc_q),
      .radr(yt_rsc_radr),
      .wadr(yt_rsc_wadr),
      .we(yt_rsc_we)
    );
  peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_32_1024_1024_32_1_gen yt_rsci
      (
      .clken(yt_rsc_clken),
      .q(yt_rsc_q),
      .radr(yt_rsc_radr),
      .we(yt_rsc_we),
      .d(yt_rsc_d),
      .wadr(yt_rsc_wadr),
      .clken_d(yt_rsci_clken_d),
      .d_d(yt_rsci_d_d),
      .q_d(yt_rsci_q_d),
      .radr_d(yt_rsci_radr_d),
      .wadr_d(yt_rsci_wadr_d),
      .we_d(yt_rsci_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(yt_rsci_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(yt_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  peaseNTT_core peaseNTT_core_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_s_tdone(xt_rsc_s_tdone),
      .xt_rsc_tr_write_done(xt_rsc_tr_write_done),
      .xt_rsc_RREADY(xt_rsc_RREADY),
      .xt_rsc_RVALID(xt_rsc_RVALID),
      .xt_rsc_RUSER(xt_rsc_RUSER),
      .xt_rsc_RLAST(xt_rsc_RLAST),
      .xt_rsc_RRESP(xt_rsc_RRESP),
      .xt_rsc_RDATA(xt_rsc_RDATA),
      .xt_rsc_RID(xt_rsc_RID),
      .xt_rsc_ARREADY(xt_rsc_ARREADY),
      .xt_rsc_ARVALID(xt_rsc_ARVALID),
      .xt_rsc_ARUSER(xt_rsc_ARUSER),
      .xt_rsc_ARREGION(xt_rsc_ARREGION),
      .xt_rsc_ARQOS(xt_rsc_ARQOS),
      .xt_rsc_ARPROT(xt_rsc_ARPROT),
      .xt_rsc_ARCACHE(xt_rsc_ARCACHE),
      .xt_rsc_ARLOCK(xt_rsc_ARLOCK),
      .xt_rsc_ARBURST(xt_rsc_ARBURST),
      .xt_rsc_ARSIZE(xt_rsc_ARSIZE),
      .xt_rsc_ARLEN(xt_rsc_ARLEN),
      .xt_rsc_ARADDR(xt_rsc_ARADDR),
      .xt_rsc_ARID(xt_rsc_ARID),
      .xt_rsc_BREADY(xt_rsc_BREADY),
      .xt_rsc_BVALID(xt_rsc_BVALID),
      .xt_rsc_BUSER(xt_rsc_BUSER),
      .xt_rsc_BRESP(xt_rsc_BRESP),
      .xt_rsc_BID(xt_rsc_BID),
      .xt_rsc_WREADY(xt_rsc_WREADY),
      .xt_rsc_WVALID(xt_rsc_WVALID),
      .xt_rsc_WUSER(xt_rsc_WUSER),
      .xt_rsc_WLAST(xt_rsc_WLAST),
      .xt_rsc_WSTRB(xt_rsc_WSTRB),
      .xt_rsc_WDATA(xt_rsc_WDATA),
      .xt_rsc_AWREADY(xt_rsc_AWREADY),
      .xt_rsc_AWVALID(xt_rsc_AWVALID),
      .xt_rsc_AWUSER(xt_rsc_AWUSER),
      .xt_rsc_AWREGION(xt_rsc_AWREGION),
      .xt_rsc_AWQOS(xt_rsc_AWQOS),
      .xt_rsc_AWPROT(xt_rsc_AWPROT),
      .xt_rsc_AWCACHE(xt_rsc_AWCACHE),
      .xt_rsc_AWLOCK(xt_rsc_AWLOCK),
      .xt_rsc_AWBURST(xt_rsc_AWBURST),
      .xt_rsc_AWSIZE(xt_rsc_AWSIZE),
      .xt_rsc_AWLEN(xt_rsc_AWLEN),
      .xt_rsc_AWADDR(xt_rsc_AWADDR),
      .xt_rsc_AWID(xt_rsc_AWID),
      .xt_rsc_triosy_lz(xt_rsc_triosy_lz),
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
      .yt_rsci_clken_d(yt_rsci_clken_d),
      .yt_rsci_d_d(yt_rsci_d_d),
      .yt_rsci_q_d(yt_rsci_q_d),
      .yt_rsci_radr_d(yt_rsci_radr_d),
      .yt_rsci_wadr_d(yt_rsci_wadr_d),
      .yt_rsci_readA_r_ram_ir_internal_RMASK_B_d(yt_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .yt_rsci_we_d_pff(yt_rsci_we_d_iff)
    );
endmodule



