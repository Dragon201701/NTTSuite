
//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_in_wait_v1.v 
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

module ccs_sync_in_wait_v1 (rdy, vld, irdy, ivld);
  parameter integer rscid = 1;

  output rdy;
  input  vld;
  input  irdy;
  output ivld;

  wire   ivld;
  wire   rdy;

  assign ivld = vld;
  assign rdy = irdy;
endmodule

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master_read_core.v 
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
// DESIGN UNIT:        ccs_axi4_master_read_core
//
// DESCRIPTION:
//   This model implements the read channel(s) of AXI-4 Master memory interface for use in 
//   Interface Synthesis in Catapult. The model has the following behavior:
//
//   The AXI bus has priority over the Catapult block when writing to
//   the internal memory.
//
//   AXI Base address and burst size configured dynamically through input pins
//
//   Limitations listed in the datasheet
//
//   Addressing and burst sizes discussed in the _core component
//
// CHANGE LOG:
//   05/16/2019 - Added timeout feature and port
//   04/02/2019 - Renamed to _core
//   01/28/2019 - Refactored read and write channel behaviors
//
// --------------------------------------------------------------------------

// Uncomment this for lots of messages
//`define MASTER_DBG_READ 1

// Uncomment this to cause invalid busses to X-Out for better debug
//`define MASTER_DBG_VLD 1

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
  
module ccs_axi4_master_read_core (ACLK, ARESETn, 
  ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARQOS, ARREGION, ARUSER, ARVALID, ARREADY,
  RID, RDATA, RRESP, RLAST, RUSER, RVALID, RREADY,
  cfgBaseAddress, cfgBurstSize, cfgTimeout,
  m_re, m_raddr, m_rburst, m_din, m_rrdy, is_idle);
   
   // Catapult Bus Configuration generics
   parameter rscid = 1;                   // Resource ID
   parameter depth = 16;                  // Number of addressable elements (up to 20bit address)
   parameter op_width = 1;                // dummy parameter for cwidth calculation
   parameter cwidth = 32;                 // Catapult data bus width (multiples of 8)
   parameter addr_w = 4;                  // Catapult address bus width
   parameter rst_ph = 0;                  // Reset phase - negative default

   // AXI-4 Bus Configuration generics
   parameter ADDR_WIDTH  = 32;            // AXI4 bus address width 
   parameter DATA_WIDTH = 32;             // AXI4 read&write bus data width 
   parameter ID_WIDTH    = 1;             // AXI4 ID field width (ignored in this model)
   parameter USER_WIDTH  = 1;             // AXI4 User field width (ignored in this model)
   parameter REGION_MAP_SIZE = 1;         // AXI4 Region Map (ignored in this model)
   parameter xburstsize = 0;              // Burst size for scverify transactor
   parameter xBASE_ADDRESS = 0;           // Base address for scverify transactor
   parameter xBASE_ADDRESSU = 0;          // upper word for 64-bit Base address for scverify transactor
   
   // AXI-4 Global Signals 
   input                               ACLK;                           // Rising edge clock
   input                               ARESETn;                        // Active LOW asynchronous reset

   wire                                int_ARESETn;
   assign int_ARESETn = rst_ph ? ~ARESETn : ARESETn;

   // ============== AXI4 Read Address Channel Signals
   output [ID_WIDTH-1:0]               ARID;                           // Read Transaction ID
   output [ADDR_WIDTH-1:0]             ARADDR;                         // Read address
   output [7:0]                        ARLEN;                          // Read burst length in beats
   output [2:0]                        ARSIZE;                         // Read burst size - encoding(above)
   output [1:0]                        ARBURST;                        // Read burst mode
   output                              ARLOCK;                         // Lock type
   output [3:0]                        ARCACHE;                        // Memory type
   output [2:0]                        ARPROT;                         // Protection Type
   output [3:0]                        ARQOS;                          // Quality of Service
   output [3:0]                        ARREGION;                       // Region identifier
   output [USER_WIDTH-1:0]             ARUSER;                         // User signal
   output                              ARVALID;                        // Read address valid
   input                               ARREADY;                        // Read address ready

   reg [ADDR_WIDTH-1:0]                ARADDR_reg;    
   assign ARADDR = ARADDR_reg;
   reg                                 ARVALID_reg;
   assign ARVALID = ARVALID_reg;
   reg [7:0]                           ARLEN_reg;
   assign ARLEN = ARLEN_reg;
   
   assign ARSIZE = (DATA_WIDTH >= 1024) ? `AXI4_AxSIZE_128_BYTE :
                   (DATA_WIDTH >= 512)  ? `AXI4_AxSIZE_064_BYTE :
                   (DATA_WIDTH >= 256)  ? `AXI4_AxSIZE_032_BYTE :
                   (DATA_WIDTH >= 128)  ? `AXI4_AxSIZE_016_BYTE :
                   (DATA_WIDTH >=  64)  ? `AXI4_AxSIZE_008_BYTE :
                   (DATA_WIDTH >=  32)  ? `AXI4_AxSIZE_004_BYTE :
                   (DATA_WIDTH >=  16)  ? `AXI4_AxSIZE_002_BYTE : `AXI4_AxSIZE_001_BYTE;

   assign ARID = 0;
   assign ARBURST = `AXI4_AxBURST_INCR;
   assign ARLOCK  = `AXI4_AxLOCK_NORMAL;
   assign ARCACHE = `AXI4_ARCACHE_NORM_NCB;
   assign ARPROT[0] = `AXI4_AxPROT_b0_UNPRIV;
   assign ARPROT[1] = `AXI4_AxPROT_b1_SECURE;
   assign ARPROT[2] = `AXI4_AxPROT_b2_DATA;
   assign ARQOS = `AXI4_AxQOS_NONE;
   assign ARREGION = 'h0;
   assign ARUSER = 0;

   // ============== AXI-4 Read Data Channel Signals
   input [ID_WIDTH-1:0]                RID;                            // Read Transaction ID tag
   input [DATA_WIDTH-1:0]              RDATA;                          // Read data
   input [1:0]                         RRESP;                          // Read response
   input                               RLAST;                          // Read last
   input [USER_WIDTH-1:0]              RUSER;                          // User signal
   input                               RVALID;                         // Read valid
   output                              RREADY;                         // Read ready
   
   reg                                 RREADY_reg;
   assign RREADY =  RREADY_reg;

   // Configuration interface
   input [ADDR_WIDTH-1:0]                cfgBaseAddress;
   input [31:0]                          cfgBurstSize; 
   input [31:0]                          cfgTimeout;  // Read doesnt have to worry much about axi timeout.
                                                      // Our internal buffer can hold the whole burst, so will never timeout
   
   // Catapult interface
   input                               m_re;      // Catapult requests read 
   input  [addr_w-1:0]                 m_raddr;   // Address for read request (axi_addr = base_addr + m_addr)
   input [31:0]                        m_rburst;  // Read Burst length (constant rburstsize for now, future enhancement driven by operator)
   output [cwidth-1:0]                 m_din;     // Data into catapult block through this interface (read request)
   output                              m_rrdy;    // Master read-data is ready
   output                              is_idle;   // the component is idle.  The next clk can be suppressed
                     
   reg [cwidth-1:0]            m_din_reg;
   assign m_din = m_din_reg;
   reg                                 m_rrdy_reg;
   
   // Statemachine for read and write operations are separate
   localparam [2:0] axi4r_idle=0, axi4r_read=1, axi4r_wait_ack=2, axi4r_reburst=3;   
   localparam addrShift = `CLOG2(DATA_WIDTH/8);
   
   reg [2:0]                           read_state;
   
   wire [ADDR_WIDTH-1:0]                base_addr;
   assign base_addr = cfgBaseAddress;

   // We dont really do any timeout processing now.  We just read the whole
   // axi burst then let catapult read it when they want.  Out of order processing
   // handles all the issues
   wire [31:0]                          timeoutMax;
   assign timeoutMax = (cfgTimeout == 0) ? 32'hFFFFFFFF : cfgTimeout;

   
   reg [8:0]                           Rburst_in;
   reg [8:0]                           Rburst_out;
   integer                             Rburst_used;
   integer                             LastRburst_used;

   reg [addr_w-1:0]                    Rstart_addr;
   reg                                 Rflushing;
   wire                                ROutOfOrder;
   
   reg [cwidth-1:0]                    data_buf_rd[255:0];

   wire [31:0]                         crBurstSize;
   assign crBurstSize = cfgBurstSize;
   
   assign m_rrdy = m_rrdy_reg && !ROutOfOrder && !Rflushing;
   
   // synopsys translate_off
   // check parameters for what we support
   reg                                 isErr;
   reg [63:0]                          bigNum;
   initial begin
      isErr = 0;
      
      // - Catapult width must be <= AXI data width
      if (cwidth > DATA_WIDTH) begin
         $display("Error: Catapult(cwidth=%d) cannot be greater than AXI(DATA_BUS=%d) data bus width.", cwidth, DATA_WIDTH);
         isErr = 1;
      end
      // Data width #bits is byte-based
      if ( (DATA_WIDTH%8) != 0) begin
         $display("Error: Data bus width(DATA_WIDTH=%d) not a discrete number of bytes.", DATA_WIDTH);
         isErr = 1;
      end
      // And #bytes is >=1
      if (DATA_WIDTH/8 == 0) begin
         $display("Error: Data bus width(DATA_WIDTH=%d) must be at least 1 byte.", DATA_WIDTH);
         isErr = 1;
      end
      // Must also be power-of-2 #bytes
      if ( (DATA_WIDTH/8) & (((DATA_WIDTH/8)) - 1) != 0) begin
         $display("Error: Data bus width must be power-of-2 number of bytes(DATA_WIDTH/8=%d).", DATA_WIDTH/8);
         isErr = 1;
      end
      // Slaves must support 4K bytes at least
      if (ADDR_WIDTH < 12) begin
         $display("Error: AXI bus address width(ADDR_WIDTH=%d) must be at least 12 to address 4K memory space.", ADDR_WIDTH);
         isErr = 1;
      end
      // Base_addr width corresponds with width of AXI address bus specs.
      bigNum = 2**ADDR_WIDTH;
      if (base_addr >= bigNum) begin
         $display("Error: AXI BASE_ADDRESS(%h) exceeds what ADDR_WIDTH(%d) allows.  Max #Bytes=%d.", 
                  base_addr, ADDR_WIDTH, bigNum-1);
         isErr = 1;
      end
      
      if (isErr) begin
         $display("Error: Fatal axi4_master configuration errors must be corrected.");
         $finish;
      end
   end
   // synopsys translate_on
   
   // We "synch up" at end of each axi burst.  Thus a 256 word buffer doesnt overflow.
   // 
   // Read processing
   
   function [7:0] adjustReadBeats;
      input [ADDR_WIDTH-1:0] startAddr;
      input [31:0]           inBeats;
      reg [ADDR_WIDTH-1:0]   endAddr;
      begin 
         endAddr = startAddr + ((DATA_WIDTH/8) * inBeats);
         if ((startAddr&'hFFFFF000) != (endAddr&'hFFFFF000)) begin
            // Crosses 4k boundary
            adjustReadBeats = (('h000001000 - (startAddr&'h00000FFF))  / (DATA_WIDTH/8))-1;
            //$display("Adjust read beats with start=%x from(%d) to(%d) at t=%t\n", startAddr, inBeats, 
            //         (('h000001000 - (startAddr&'h00000FFF))  / (DATA_WIDTH/8))-1, $time);
         end else begin
            adjustReadBeats = inBeats;
         end
      end
   endfunction
   
   wire catReadIdle;
   
   assign catReadIdle = (read_state == axi4r_idle) && !m_re;
   assign is_idle = catReadIdle && int_ARESETn;

   assign ROutOfOrder =  Rflushing || 
                         (m_re && 
                           ((read_state == axi4r_read) || (read_state == axi4r_wait_ack) || (read_state == axi4r_reburst))&& 
                           (ARLEN_reg != 0) && 
                           (m_rrdy_reg == 1) && 
                           int_ARESETn && 
                           (m_raddr+1 != Rstart_addr+LastRburst_used)
                         );
   
   
   always @(posedge ACLK or negedge int_ARESETn) begin
      if (~int_ARESETn) begin
         read_state <= axi4r_idle;
         ARVALID_reg <= 0;
         ARLEN_reg <= 0;         
         RREADY_reg <= 0;
         m_rrdy_reg <= 0;
         Rburst_in <= 0;
         Rburst_out <= 0;
         Rburst_used <= 0;  // wrt catapult perspective (Rburst_out)        
         LastRburst_used <= 0;
         Rstart_addr <= 0;
         Rflushing <= 0;
`ifdef MASTER_DBG_VLD
         ARADDR_reg <= 'hx;
         m_din_reg <= 'hx;
`else
         ARADDR_reg <= 0;
         m_din_reg <= 0;
`endif
      end else begin // if (~int_ARESETn)
         if (read_state == axi4r_wait_ack) begin
            // We sent data - need to see re to know it was received
`ifdef MASTER_DBG_READ
            $display("Handle Read state: wait_ack.  m_re=%b at T=%t\n", m_re, $time);
`endif            
            if (m_re) begin
               // start the next burst
               read_state <= axi4r_idle;
               m_rrdy_reg <= 0;
               LastRburst_used <= 0;               
            end else begin               
               if (ROutOfOrder) Rflushing <= 1;
            end
         end else if ((read_state == axi4r_idle) && (m_re != 1'b1)) begin
            m_rrdy_reg <= 0;
`ifdef MASTER_DBG_READ
            $display("Handle Read state: idle m_re not 1 at T=%t\n", $time);
`endif            
         end else if (((read_state == axi4r_idle) && (m_re == 1'b1)) || (read_state == axi4r_reburst)) begin
            m_rrdy_reg <= 0;
            if (read_state == axi4r_reburst) begin
               ARADDR_reg <= base_addr + ((Rstart_addr+Rburst_used) << addrShift);
               if ((crBurstSize - Rburst_used) > 255) begin
                  ARLEN_reg <= adjustReadBeats(base_addr + ((Rstart_addr+Rburst_used) << addrShift), 255);
               end else begin
                  ARLEN_reg <= adjustReadBeats(base_addr + ((Rstart_addr+Rburst_used) << addrShift), crBurstSize - Rburst_used);
               end
            end else begin
               ARADDR_reg <= base_addr + (m_raddr << addrShift);
               Rstart_addr <= m_raddr;
               if ((crBurstSize - Rburst_used) > 255) begin  // 255 beats
                  ARLEN_reg <= adjustReadBeats(base_addr + (m_raddr << addrShift), 255);
               end else begin  // (crBurstSize - Rburst_used) beats
                  ARLEN_reg <= adjustReadBeats(base_addr + (m_raddr << addrShift), crBurstSize - Rburst_used);
               end
            end
            ARVALID_reg <= 1;
            RREADY_reg <= 1;
            read_state <= axi4r_read;
            Rburst_in <= 0;
            Rburst_out <= 0;
            Rflushing <= 0;            
`ifdef MASTER_DBG_READ
            $display("Read(B=%d) with addr=%x initiated at T=%t\n", crBurstSize, m_raddr, $time);
`endif            
         end else if (read_state == axi4r_read) begin 
`ifdef MASTER_DBG_READ
            $display("Read state. burst_in=%d burst_out=%d burst_used=%d re=%b at T=%t",
                     Rburst_in, Rburst_out, Rburst_used, m_re, $time);
`endif                     
            if (ROutOfOrder) Rflushing <= 1;
            if (ARREADY == 1) begin
               ARVALID_reg <= 0;
`ifdef MASTER_DBG_VLD
               ARADDR_reg <= 'hx;
`endif
            end
            // Slurp data from AXI
            if (RVALID == 1) begin
               data_buf_rd[Rburst_in] <= RDATA[cwidth-1:0];
               Rburst_in <= Rburst_in+1;
`ifdef MASTER_DBG_READ
               $display("Push %x on queue[%d] at T=%t\n", RDATA, Rburst_in, $time);
`endif               
               if (RLAST == 1) begin
                  RREADY_reg <= 0;
               end
            end

            // If we get this far, addr info for axi was already sent.
            // Check if it is accepted (m_re) and send new data
            // if the burst isnt done.
            // We sequence outputs, and check for out-of-order if len>0
            if (m_re) begin
               if (Rburst_in == Rburst_out) begin
                  if (RVALID == 1) begin
                     if (ROutOfOrder) begin
                        m_rrdy_reg <= 0;
`ifdef MASTER_DBG_VLD
                        m_din_reg <= 'hx;
`endif
                     end else begin
                        m_din_reg <= RDATA[cwidth-1:0];
                        m_rrdy_reg <= 1;
                     end
                     Rburst_out <= Rburst_out + 1;
                     Rburst_used <= Rburst_used + 1;
                     LastRburst_used <= LastRburst_used + 1;
`ifdef MASTER_DBG_READ
                     $display("Use Current AXI Data for C=%x at T=%t\n", RDATA, $time);
`endif                     
                     if ((RLAST == 1) && (ARLEN_reg == Rburst_out)) begin
                        if (ROutOfOrder || (Rburst_used >= crBurstSize)) begin
                           // really done...
                           if (! ROutOfOrder ) begin
`ifdef MASTER_DBG_READ
                              $display("Go back to wait_ack read state(1).  in=%d out=%d\n", Rburst_in, Rburst_out);
`endif                              
                              read_state <= axi4r_wait_ack;
                           end else begin
`ifdef MASTER_DBG_READ
                              $display("Go back to idle read state(ROutOfOrder).  in=%d out=%d\n", Rburst_in, Rburst_out);
`endif                              
                              read_state <= axi4r_idle;   // initiate the next burst straight away
                              LastRburst_used <= 0;
                           end
                           Rburst_used <= 0;
                        end else begin
                           read_state <= axi4r_reburst;
`ifdef MASTER_DBG_READ
                           $display("Go back to reburst state(1).  in=%d out=%d used=%d\n", Rburst_in, Rburst_out, Rburst_used);
`endif                           
                        end
                     end
                  end else begin
`ifdef MASTER_DBG_READ
                     $display("Stalling Catapult at T=%t\n", $time);
`endif                     
`ifdef MASTER_DBG_VLD
                     m_din_reg <= 'hx;
`endif
                     m_rrdy_reg <= 0;
                  end
               end else if (Rburst_out < Rburst_in) begin
                  if (ROutOfOrder) begin
`ifdef MASTER_DBG_VLD
                     m_din_reg <= 'hx;
`endif
                     m_rrdy_reg <= 0;
                  end else begin
                     m_din_reg <= data_buf_rd[Rburst_out];
                     m_rrdy_reg <= 1;
                  end
                  Rburst_out <= Rburst_out + 1;                  
                  Rburst_used <= Rburst_used + 1;
                  LastRburst_used <= LastRburst_used + 1;
`ifdef MASTER_DBG_READ
                  $display("DeQue(%d) C=%x at T=%t\n", Rburst_out, RDATA, $time);
`endif                  
                  if (((RLAST == 1) || (RREADY_reg == 0)) && (ARLEN_reg == Rburst_out)) begin
                     if (ROutOfOrder || (Rburst_used >= crBurstSize)) begin
                        // really done....
                        if ((ARLEN_reg == 0) || ROutOfOrder) begin
`ifdef MASTER_DBG_READ
                           $display("Go back to idle read state.  in=%d out=%d\n", Rburst_in, Rburst_out);
`endif                           
                           read_state <= axi4r_idle;
                           LastRburst_used <= 0;
                        end else begin
`ifdef MASTER_DBG_READ
                           $display("Go back to wait_ack read state(2).  in=%d out=%d\n", Rburst_in, Rburst_out);
`endif                           
                           read_state <= axi4r_wait_ack;
                        end
                        Rburst_used <= 0;
                     end else begin
                        // need to start another aBurst
                        read_state <= axi4r_reburst;
`ifdef MASTER_DBG_READ
                        $display("Go back to reburst state(2).  in=%d out=%d used=%d\n", Rburst_in, Rburst_out, Rburst_used);
`endif                           
                     end
                  end
               end else begin
                  // how can this happen?
`ifdef MASTER_DBG_READ
                  $display("Error:  Protocol error for end of read burst processing.\n");
`endif                  
`ifdef MASTER_DBG_VLD
                  m_din_reg <= 'hx;
`endif
                  m_rrdy_reg <= 0;                  
               end
            end 
            
            // Look for an error and make sure no deadlock...
            if ((RRESP == `AXI4_xRESP_SLVERR) || (RRESP == `AXI4_xRESP_DECERR )) begin
               // we have to finish the burst though...
            end 
         end         
      end 
   end 

endmodule


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master_write_core.v 
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
// DESIGN UNIT:        ccs_axi4_master_write_core
//
// DESCRIPTION:
//   This model implements the write channel(s) of an AXI-4 Master memory interface for use in 
//   Interface Synthesis in Catapult. The model has the following behavior:
//
//   The AXI bus has priority over the Catapult block when writing to
//   the internal memory.
//
//   AXI Base address and burst size configured dynamically through input pins
//
//   Limitations listed in the datasheet
//
//   Addressing and burst sizes discussed in the _core component
//
// CHANGE LOG:
//   05/16/2019 - Added timeout feature and port
//   04/02/2019 - Renamed to _core
//   01/28/2019 - Refactored read and write channel behaviors
// --------------------------------------------------------------------------

// Uncomment this for lots of messages
//`define MASTER_DBG_WRITE 1

// Uncomment this to cause invalid busses to X-Out for better debug
//`define MASTER_DBG_VLD 1

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
  
module ccs_axi4_master_write_core (ACLK, ARESETn, 
  AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWQOS, AWREGION, AWUSER, AWVALID, AWREADY,
  WDATA, WSTRB, WLAST, WUSER, WVALID, WREADY,
  BID, BRESP, BUSER, BVALID, BREADY,
  cfgBaseAddress, cfgBurstSize, cfgTimeout,
  m_we, m_waddr, m_wburst, m_dout, m_wrdy,  is_idle,
  m_wCaughtUp, m_wstate);

   // Catapult Bus Configuration generics
   parameter rscid = 1;                   // Resource ID
   parameter depth = 16;                  // Number of addressable elements (up to 20bit address)
   parameter op_width = 1;                // dummy parameter for cwidth calculation
   parameter cwidth = 32;                 // Catapult data bus width (multiples of 8)
   parameter addr_w = 4;                  // Catapult address bus width
   parameter rst_ph = 0;                  // Reset phase - negative default

   // AXI-4 Bus Configuration generics
   parameter ADDR_WIDTH  = 32;            // AXI4 bus address width 
   parameter DATA_WIDTH = 32;             // AXI4 read&write bus data width 
   parameter ID_WIDTH    = 1;             // AXI4 ID field width (ignored in this model)
   parameter USER_WIDTH  = 1;             // AXI4 User field width (ignored in this model)
   parameter REGION_MAP_SIZE = 1;         // AXI4 Region Map (ignored in this model)
   parameter xburstsize = 0;              // Burst size for scverify transactor
   parameter xBASE_ADDRESS = 0;           // Base addess  for scverify transactor
   parameter xBASE_ADDRESSU = 0;          // Upper word for 64-bit Base addess  for scverify transactor
   
   // AXI-4 Global Signals 
   input                               ACLK;                           // Rising edge clock
   input                               ARESETn;                        // Active LOW asynchronous reset
   wire                                int_ARESETn = rst_ph ? ~ARESETn : ARESETn;

   // ============== AXI-4 Write Address Channel Signals
   output [ID_WIDTH-1:0]               AWID;                           // Write Transaction ID
   output [ADDR_WIDTH-1:0]             AWADDR;                         // Write address
   output [7:0]                        AWLEN;                          // Write burst length in beats
   output [2:0]                        AWSIZE;                         // Write burst size - encoding(above)
   output [1:0]                        AWBURST;                        // Write burst mode
   output                              AWLOCK;                         // Lock type
   output [3:0]                        AWCACHE;                        // Memory type
   output [2:0]                        AWPROT;                         // Protection Type
   output [3:0]                        AWQOS;                          // Quality of Service
   output [3:0]                        AWREGION;                       // Region identifier
   output [USER_WIDTH-1:0]             AWUSER;                         // User signal
   output                              AWVALID;                        // Write address valid
   input                               AWREADY;                        // Write address ready
   
   reg [ADDR_WIDTH-1:0]                AWADDR_reg;    
   assign AWADDR = AWADDR_reg;
   reg                                 AWVALID_reg;
   assign AWVALID = AWVALID_reg;
   reg [7:0]                           AWLEN_reg;                      // Write burst length in beats
   assign AWLEN = AWLEN_reg;

   
   assign AWSIZE = (DATA_WIDTH >= 1024) ?  `AXI4_AxSIZE_128_BYTE :
                   (DATA_WIDTH >= 512)  ? `AXI4_AxSIZE_064_BYTE :
                   (DATA_WIDTH >= 256)  ? `AXI4_AxSIZE_032_BYTE :
                   (DATA_WIDTH >= 128)  ? `AXI4_AxSIZE_016_BYTE :
                   (DATA_WIDTH >=  64)  ? `AXI4_AxSIZE_008_BYTE :
                   (DATA_WIDTH >=  32)  ? `AXI4_AxSIZE_004_BYTE :
                   (DATA_WIDTH >=  16)  ? `AXI4_AxSIZE_002_BYTE : `AXI4_AxSIZE_001_BYTE;
   
   assign AWID = 0;
   assign AWBURST = `AXI4_AxBURST_INCR;
   assign AWLOCK  = `AXI4_AxLOCK_NORMAL;
   assign AWCACHE = `AXI4_AWCACHE_NORM_NCB;
   assign AWPROT[0] = `AXI4_AxPROT_b0_UNPRIV;
   assign AWPROT[1] = `AXI4_AxPROT_b1_SECURE;
   assign AWPROT[2] = `AXI4_AxPROT_b2_DATA;
   assign AWQOS = `AXI4_AxQOS_NONE;
   assign AWREGION = 'h0;   
   assign AWUSER = 0;
   
   // ============== AXI4 Write Data Channel
   //output [ID_WIDTH-1:0]               WID;                           // Read Transaction ID - only axi3
   output [DATA_WIDTH-1:0]             WDATA;                          // Write data
   output [DATA_WIDTH/8-1:0]           WSTRB;                          // Write strobe (bytewise)
   output                              WLAST;                          // Write last
   output [USER_WIDTH-1:0]             WUSER;                          // User signal
   output                              WVALID;                         // Write data is valid
   input                               WREADY;                         // Write ready
   
   reg [DATA_WIDTH-1:0]                WDATA_reg;
   assign  WDATA = WDATA_reg;
   reg                                 WLAST_reg;
   assign WLAST = WLAST_reg;
   reg                                 WVALID_reg;
   assign WVALID = WVALID_reg;
   reg [DATA_WIDTH/8-1:0]              WSTRB_reg;
   assign WSTRB =  WSTRB_reg;
   assign WUSER = 0;
   
   // ============== AXI4 Write Response Channel Signals
   input [ID_WIDTH-1:0]                BID;                            // Response Transaction ID tag
   input [1:0]                         BRESP;                          // Write response (of slave)
   input [USER_WIDTH-1:0]              BUSER;                          // User signal
   input                               BVALID;                         // Write response valid
   output                              BREADY;                         // Response ready
   
   reg                                 BREADY_reg;
   assign BREADY = BREADY_reg;      

   // Configuration interface
   input [ADDR_WIDTH-1:0]                cfgBaseAddress;
   input [31:0]                          cfgBurstSize; 
   input [31:0]                          cfgTimeout;  // If Catapult stalls a burst for longer than this, just flush it  

   // Catapult interface
   input                               m_we;      // Catapult requests write 
   input  [addr_w-1:0]                 m_waddr;   // Address for write request (axi_addr = base_addr + m_addr)
   input [31:0]                        m_wburst;  // Write Burst length (constant wburstsize for now, future enhancement driven by operator)
   input  [cwidth-1:0]                 m_dout;    // Data out to slave
   output                              m_wrdy;    // Master ready for write
   output                              is_idle;   // the component is idle.  The next clk can be suppressed
                     
   // Transactor resource interface (for SCVerify simulation only)
   output                              m_wCaughtUp;
   output [2:0]                        m_wstate;

   reg                                 m_wrdy_reg;
   reg                                 m_rrdy_reg;
   
   // Statemachine for read and write operations are separate
   localparam [2:0] axi4w_idle=0, axi4w_write=1, axi4w_write_a0=2, axi4w_write_a1=3, 
     axi4w_write_a2=4, axi4w_write_a3=5, axi4w_write_bad=6, axi4w_reburst=7;
   localparam addrShift = `CLOG2(DATA_WIDTH/8);
   
   reg [2:0]                           write_state;
   
   wire [31:0]                          timeoutMax;
   assign timeoutMax = (cfgTimeout == 0) ? 32'hFFFFFFFF : cfgTimeout;
   reg [31:0]                           timeoutCnt;
   wire                                 WTimedOut;
   
   wire [ADDR_WIDTH-1:0]                base_addr;
   assign base_addr = cfgBaseAddress;
   
   reg [8:0]                           Wburst_in;
   reg [8:0]                           Wburst_out;
   integer                             Wburst_outTotal;
   integer                             Wburst_used;
   reg [addr_w-1:0]                    Wstart_addr;
   reg [addr_w-1:0]                    WnotOOO_addr;
   reg                                 Wflushing;
   wire                                WOutOfOrder;

   reg [cwidth-1:0]                    data_buf_wr[255:0];

   wire [31:0]                         cwBurstSize;
   assign cwBurstSize = cfgBurstSize;
   
   reg [7:0]                           wTempLen;

   // Transactor access
   assign m_wstate = write_state;
   assign m_wCaughtUp = (Wburst_in == Wburst_out) ? 1 : 0;
   
   assign m_wrdy = m_wrdy_reg && !WOutOfOrder && !Wflushing;

   wire                                m_we_int;
   wire [addr_w-1:0]                   m_waddr_int;

   // when we timeout, need to finish any in-progress axi burst
   // Use the out-of-order mechanism for this by forcing an out-of-order 
   assign WTimedOut = (timeoutCnt > timeoutMax);
   assign m_we_int = WTimedOut ? 1 : m_we;
   assign m_waddr_int =  WTimedOut ? 0 : m_waddr;
        
   // synopsys translate_off
   // check parameters for what we support
   reg                                 isErr;
   reg [63:0]                          bigNum;
   initial begin
      isErr = 0;
      
      // - Catapult width must be <= AXI data width
      if (cwidth > DATA_WIDTH) begin
         $display("Error: Catapult(cwidth=%d) cannot be greater than AXI(DATA_BUS=%d) data bus width.", cwidth, DATA_WIDTH);
         isErr = 1;
      end
      // Data width #bits is byte-based
      if ( (DATA_WIDTH%8) != 0) begin
         $display("Error: Data bus width(DATA_WIDTH=%d) not a discrete number of bytes.", DATA_WIDTH);
         isErr = 1;
      end
      // And #bytes is >=1
      if (DATA_WIDTH/8 == 0) begin
         $display("Error: Data bus width(DATA_WIDTH=%d) must be at least 1 byte.", DATA_WIDTH);
         isErr = 1;
      end
      // Must also be power-of-2 #bytes
      if ( (DATA_WIDTH/8) & (((DATA_WIDTH/8)) - 1) != 0) begin
         $display("Error: Data bus width must be power-of-2 number of bytes(DATA_WIDTH/8=%d).", DATA_WIDTH/8);
         isErr = 1;
      end
      // Slaves must support 4K bytes at least
      if (ADDR_WIDTH < 12) begin
         $display("Error: AXI bus address width(ADDR_WIDTH=%d) must be at least 12 to address 4K memory space.", ADDR_WIDTH);
         isErr = 1;
      end
      // Base_addr width corresponds with width of AXI address bus specs.
      bigNum = 2**ADDR_WIDTH;
      if (base_addr >= bigNum) begin
         $display("Error: AXI BASE_ADDRESS(%h) exceeds what ADDR_WIDTH(%d) allows.  Max #Bytes=%d.", 
                  base_addr, ADDR_WIDTH, bigNum-1);
         isErr = 1;
      end
      
      if (isErr) begin
         $display("Error: Fatal axi4_master configuration errors must be corrected.");
         $finish;
      end
   end
   // synopsys translate_on

   
   wire catWriteIdle;
   assign catWriteIdle = (write_state == axi4w_idle) && !m_we_int;
   assign is_idle = catWriteIdle && int_ARESETn;
   
   // We "synch up" at end of each axi burst.  Thus a 256 word buffer doesnt overflow.
   // Write processing 
   function [7:0] adjustWriteBeats;
      input [ADDR_WIDTH-1:0] startAddr;
      input [31:0]           inBeats;
      reg [ADDR_WIDTH-1:0]   endAddr;
      begin 
         endAddr = startAddr + ((DATA_WIDTH/8) * inBeats);
         if ((startAddr&'hFFFFF000) != (endAddr&'hFFFFF000)) begin
            // Crosses 4k boundary
            adjustWriteBeats = (('h000001000 - (startAddr&'h00000FFF))  / (DATA_WIDTH/8))-1;
            //$display("Adjust write beats with start=%x from(%d) to(%d) at t=%t\n", startAddr, inBeats, 
            //         (('h000001000 - (startAddr&'h00000FFF))  / (DATA_WIDTH/8))-1, $time);
         end else begin
            adjustWriteBeats = inBeats;
         end
      end
   endfunction

   assign WOutOfOrder = Wflushing ||
                        WTimedOut ||
                        (m_we_int && 
                          ((write_state == axi4w_write) || (write_state == axi4w_reburst)) && 
                          (AWLEN_reg != 0) && 
                          (m_wrdy_reg == 1) && 
                          int_ARESETn && 
                          (m_waddr != Wstart_addr+Wburst_used)
                         );

   always @(posedge ACLK or negedge int_ARESETn) begin
      if (~int_ARESETn) begin
         write_state <= axi4w_idle;
         AWVALID_reg <= 0;
         AWLEN_reg <= 0;         
         WLAST_reg <= 0;         
         WVALID_reg <= 0;
         BREADY_reg <= 0;         
         m_wrdy_reg <= 0;  
         Wburst_in <= 0;
         Wburst_out <= 0;
         Wburst_outTotal <= 0;
         Wburst_used <= 0;  // relative to catapult consumption.  1-based
         Wstart_addr <= 0;
         WnotOOO_addr <= 0;
         Wflushing <= 0;
         WSTRB_reg <= ~0;
`ifdef MASTER_DBG_VLD
         AWADDR_reg <= 'hx;
         WDATA_reg  <= 'hx;
`else
         AWADDR_reg <= 0;
         WDATA_reg  <= 0;
`endif
         timeoutCnt <= 0;
      end else begin
`ifdef MASTER_DBG_WRITE
         $display("Write at T=%t", $time);
         $display("  WOutOfOrder=%b Wflushing=%b write_state=%d m_we=%b m_we_int=%b AWLEN_reg=%d m_wrdy_reg=%b m_waddr=%h Wstart_addr=%h Wburst_used=%h",
                  WOutOfOrder, Wflushing, write_state, m_we, m_we_int, AWLEN_reg, m_wrdy_reg, m_waddr, Wstart_addr, Wburst_used);
`endif
         if ((write_state == axi4w_idle) && (m_we_int == 1'b0)) begin
            timeoutCnt <= 0;
            if (!Wflushing) m_wrdy_reg <= 1;   // dont actually need this check of flushing (?)
         end else if ((write_state == axi4w_reburst) && (m_we_int == 1'b1)) begin
            timeoutCnt <= 0;
            write_state <= axi4w_write;
            AWADDR_reg <= base_addr + ((Wstart_addr+Wburst_used) << addrShift);
            AWVALID_reg <= 1;
            if ((cwBurstSize - Wburst_used) > 255) begin
               wTempLen = adjustWriteBeats(base_addr + ((Wstart_addr+Wburst_used) << addrShift),  255);
            end else begin
               wTempLen = adjustWriteBeats(base_addr + ((Wstart_addr+Wburst_used) << addrShift),  (cwBurstSize - Wburst_used));
            end
            AWLEN_reg <= wTempLen;

            if (wTempLen == 0) begin
               m_wrdy_reg <= 0;  // Cat has to wait until this is done
               WLAST_reg <= 1;
            end else begin
               WLAST_reg <= 0;
            end
            WDATA_reg <= m_dout;
            WVALID_reg <= 1;            
            BREADY_reg <= 1;
            Wburst_in <= 1;
            Wburst_out <= 1;
            Wburst_outTotal <= Wburst_outTotal + 1;
            Wburst_used <=  Wburst_used + 1;
            data_buf_wr[0] <= m_dout;
            write_state <= axi4w_write;
            WnotOOO_addr <= m_waddr;
         end else if ((write_state == axi4w_idle) && (m_we_int == 1'b1)) begin
            timeoutCnt <= 0;
            write_state <= axi4w_write;
            AWADDR_reg <= base_addr + (m_waddr << addrShift);
            Wstart_addr <= m_waddr;
            WnotOOO_addr <= m_waddr;
            AWVALID_reg <= 1;
            if (cwBurstSize > 255) begin
               wTempLen = adjustWriteBeats(base_addr + (m_waddr << addrShift), 255);
            end else begin
               wTempLen = adjustWriteBeats(base_addr + (m_waddr << addrShift), cwBurstSize);
            end
            AWLEN_reg <= wTempLen;
            if (wTempLen == 0) begin
               m_wrdy_reg <= 0;  // Cat has to wait until this is done
               WLAST_reg <= 1;
            end else begin
               WLAST_reg <= 0;
            end

            WDATA_reg <= m_dout;
            WVALID_reg <= 1;
            BREADY_reg <= 1;
            Wburst_in <= 1;
            Wburst_out <= 1;
            Wburst_outTotal <= 1;
            Wburst_used <= 1;
            Wflushing <= 0;
            WSTRB_reg <= ~0;
            data_buf_wr[0] <= m_dout;
`ifdef MASTER_DBG_WRITE
            $display("Write of %x with addr=%x initiated at T=%t\n", m_dout, m_waddr, $time);
`endif            
            
         end else if (write_state == axi4w_write) begin 
            if (m_we) begin  // We really look at external m_we here
               timeoutCnt <= 0;
            end else begin
               timeoutCnt <= timeoutCnt+1;
            end
            if (WOutOfOrder) begin
`ifdef MASTER_DBG_WRITE
               $display("WOutOfOrder detected, burst_in=%d burst_out=%d burst_outTotal=%d burst_used=%d notOOOaddr=%x at T=%t",
                        Wburst_in, Wburst_out, Wburst_outTotal, Wburst_used, WnotOOO_addr, $time);
`endif                        
               Wflushing <= 1;
               if (WREADY && (WnotOOO_addr < (Wstart_addr+Wburst_outTotal))) begin
`ifdef MASTER_DBG_WRITE
                  $display("  Starting flush");
`endif                  
                  WSTRB_reg <= 0;
               end
            end else if (m_we_int) begin
               WnotOOO_addr <= m_waddr;  // always the last "good" address
            end
            if (AWREADY == 1) begin
`ifdef MASTER_DBG_VLD
               AWADDR_reg <= 'hx;
`endif
               AWVALID_reg <= 0;
            end
            // When bursting, grab/que the data here...Non-burst was already handled above
            if ((AWLEN_reg > 0) && (m_we_int == 1) && (Wburst_in < (AWLEN_reg+1))) begin
               data_buf_wr[Wburst_in] <= m_dout;
`ifdef MASTER_DBG_WRITE
               $display("Push %x on queue[%d] at T=%t\n", m_dout, Wburst_in, $time);
`endif               
               if (Wburst_in == AWLEN_reg) begin
                  // Done slurping the burst data.  Need to pause catapult until axi done shipping it
                  m_wrdy_reg <= 0;
               end else begin
                  m_wrdy_reg <= 1;
               end
               Wburst_in <= Wburst_in+1;
               Wburst_used <=  Wburst_used + 1;
            end
            
            if (WREADY == 1) begin  // cant move on until we see this...
`ifdef MASTER_DBG_WRITE
               $display("Seen WREADY.  state=%d wburst_out=%d wburst_in=%d at T=%t\n", write_state, Wburst_out, Wburst_in, $time);
`endif               
               if (Wburst_out == Wburst_in) begin
                  // Caught up - continue on if requested, or shut down the last burst
                  if (Wburst_out == (AWLEN_reg+1)) begin
                     // Just finished a burst - need to look for response data (below)
                     // counts are 1-based, len is 0-based
                     WVALID_reg <= 0;
                     WLAST_reg <= 0;
`ifdef MASTER_DBG_VLD
                     WDATA_reg <= 'hx;
`endif
`ifdef MASTER_DBG_WRITE
                     $display("Finished Burst (out=%d, AWLEN=%d) at T=%t\n", Wburst_out, AWLEN_reg, $time);
`endif                     
                  end else begin
                     // Continue on... a burst
                     if (m_we_int == 1) begin
                        WVALID_reg <= 1;
                        if (WOutOfOrder && (WnotOOO_addr < (Wstart_addr+Wburst_outTotal))) begin
`ifdef MASTER_DBG_VLD
                           WDATA_reg  <= 'hx;
`endif
                        end else begin
                           WDATA_reg <= m_dout;
                        end
`ifdef MASTER_DBG_WRITE
                        $display("Drive WDATA=%x from m_dout at T=%t\n", m_dout, $time);
`endif                        
                        if (Wburst_out == AWLEN_reg) begin
                           WLAST_reg <= 1;         
                        end else begin
                           WLAST_reg <= 0;         
                        end
                        if (AWLEN_reg == 0) begin
                           Wburst_in <= Wburst_in + 1;  // Otherwise accounted for above
                           Wburst_used <=  Wburst_used + 1;
                        end
                        Wburst_out <= Wburst_out + 1;
                        Wburst_outTotal <= Wburst_outTotal + 1;
                     end else begin
                        // nothing on the que to send.  Need to wait...
`ifdef MASTER_DBG_WRITE
                        $display("Queue empty at T=%t\n", $time);
`endif                        
                        WVALID_reg <= 0;                        
                        WLAST_reg <= 0;         
`ifdef MASTER_DBG_VLD
                        WDATA_reg <= 'hx;                     
`endif
                     end
                  end
               end else if (Wburst_out < Wburst_in) begin // pull one off the que
                  WVALID_reg <= 1;
                  if (WOutOfOrder && (WnotOOO_addr < (Wstart_addr+Wburst_outTotal))) begin
`ifdef MASTER_DBG_VLD
                     WDATA_reg  <= 'hx;
`endif
                  end else begin
                     WDATA_reg <= data_buf_wr[Wburst_out];
                  end
`ifdef MASTER_DBG_WRITE
                  $display("WDATA gets que[%d] data %x at T=%t\n", Wburst_out, data_buf_wr[Wburst_out], $time);
`endif                  
                  if (Wburst_out == AWLEN_reg) begin
                     WLAST_reg <= 1;         
                  end else begin
                     WLAST_reg <= 0;         
                  end
                  Wburst_out <= Wburst_out+1;
                  Wburst_outTotal <= Wburst_outTotal+1;
               end else begin
                  // cant really get here (?).  More outs than ins?
`ifdef MASTER_DBG_WRITE
                  $display("CANT GET HERE.  Burst_in=%d out=%d  at T=%t\n", Wburst_in, Wburst_out, $time);
`endif                  
                  WVALID_reg <= 0;                  
`ifdef MASTER_DBG_VLD
                  WDATA_reg <= 'hx;                     
`endif
               end
            end
            if (BVALID == 1) begin               
               // Look for an error and make sure no deadlock...
               if ((BRESP == `AXI4_xRESP_SLVERR) || (BRESP == `AXI4_xRESP_DECERR )) begin
                  // Need to finish the axi burst anyway....
               end
               if ((Wburst_used <= cwBurstSize) && !WOutOfOrder) begin
                  write_state <= axi4w_reburst;               
               end else begin
                  write_state <= axi4w_idle;               
               end
               timeoutCnt <= 0;
               Wflushing <= 0;
               m_wrdy_reg <= 1;
               BREADY_reg <= 0;
`ifdef MASTER_DBG_WRITE
               $display("Burst write finishes at T=%t\n", $time);
`endif               
            end
         end else begin
            timeoutCnt <= 0;
         end
      end
   end

   
endmodule


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master_core.v 
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
// DESIGN UNIT:        ccs_axi4_master_core
//
// DESCRIPTION:
// This model implements an AXI-4 Master memory interface for use in 
// Interface Synthesis in Catapult. The model has the following behavior:
//
//   The AXI bus has priority over the Catapult block when writing to
//   the internal memory.
//
//   AXI Base address and burst sizes configured dynamically through input pins
//
//   Limitations listed in the datasheet
//
// Catapult addressing (m_waddr and m_raddr) are in terms of an integral array of 
//     datawidth in width (starting at 0)- not byte addresses as AXI uses.  Assume 
//     nBytes is number bytes in datawidth.  Then:
//     axiAddr = base_addr + (nBytes * catAddr).  And since data width is 
//     power of 2, axiAddr = base_addr + (catAddr << logbase2(catAddr))
//
// A note on "Catapult Burst" vs "AXI Burst".
//   - AXI supports burst size ("#beats") as max of 256.  But core catapult cant 
//       be expected to carve up a data needed into 256 beat chunks.  
//       So that is done here.  So all "Burst Size" configuration is in terms
//       of catapult algorithm needs - NOT AXI size - that is computed as needed.
//   - Additionally, AXI does not allow a burst to cross 4K address boundaries. 
//       That is managed here also.
//   - Sometimes Catapult would like to do large data access, but due 
//       to algorithm issues, needs to stop partway, or data addresses become
//       discontinuous.  So we deal withthat here.  If a burst is initiated
//       and catapult addresses dont proceed consecutively, then we (here)
//       must finish/flush the AXI Burst before initiating a new AXI burst for the 
//       address requested.
//    - So we have the notion henceforth of cBurst and aBurst.  aBurst is often
//       (below) just "burst".
//   - And, burst sizes are all 0 based.  Thus a burst size of 255 really 
//       means you are getting 256 "beats".
//
//  Always rule for checking component parameter values
//   addr_w == bits(depth)
//     used to ensure that the width of the address bus on the Catapult side
//     is capable of addressing 'depth' number of elements. 'depth' will be
//     determined by the array size operator parameter 'size'
//     (see the PROP_MAP_size attribute)
//   ADDR_WIDTH >= 12, default 32.  Set by the user via parameter/generic
//
//   cwidth == 8 + (op_width>8)*8 + (op_width>16)*16 + (op_width>32)*32 + 
//                 (op_width>64)*64 + (op_width>128)*128 + (op_width>256)*256 +
//                 (op_width>512)*512
//     used to "round up" the operator width 'op_width' to the next power
//     of two value (8, 16, 32, 64, 128, 256, 512, 1024)
//     (see the PROP_MAP_width attribute)
//
// //   DATA_WIDTH >= cwidth
//     used to ensure that the Catapult data width is large enough to
//     accommodate the data width of the AXI-4 bus.
//     - must be power-of-2 bytes.
//     - #bits must be some positive integer number of bytes.
//      Note: user can/should override DATA_WIDTH from the MAP_TO_MODULE
//      directive during interface synthesis.
//
// CHANGE LOG:
//   05/16/2019 - Added timeout feature and port
//   04/02/2019 - Change read/write to read_core and write_core
//   01/29/2019 - Add read/write base address options.  Create separate read/write channel components
//   01/20/2019 - Refactored into 3 components
//   06/15/2018 - Initial implementation
//
// --------------------------------------------------------------------------

module ccs_axi4_master_core (ACLK, ARESETn, 
  AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWQOS, AWREGION, AWUSER, AWVALID, AWREADY,
  WDATA, WSTRB, WLAST, WUSER, WVALID, WREADY,
  BID, BRESP, BUSER, BVALID, BREADY,
  ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARQOS, ARREGION, ARUSER, ARVALID, ARREADY,
  RID, RDATA, RRESP, RLAST, RUSER, RVALID, RREADY,
  cfgwBaseAddress, cfgrBaseAddress,
  cfgwBurstSize, cfgrBurstSize, cfgTimeout,                             
  m_re, m_we, m_waddr, m_raddr, m_wburst, m_rburst , m_din, m_dout, m_wrdy,  m_rrdy, is_idle,
  m_wCaughtUp, m_wstate);

   // Catapult Bus Configuration generics
   parameter rscid = 1;                   // Resource ID
   parameter depth = 16;                  // Number of addressable elements (up to 20bit address)
   parameter op_width = 1;                // dummy parameter for cwidth calculation
   parameter cwidth = 32;                 // Catapult data bus width (multiples of 8)
   parameter addr_w = 4;                  // Catapult address bus width
   parameter rst_ph = 0;                  // Reset phase - negative default

   // AXI-4 Bus Configuration generics
   parameter ADDR_WIDTH  = 32;            // AXI4 bus address width 
   parameter DATA_WIDTH = 32;             // AXI4 read&write bus data width 
   parameter ID_WIDTH    = 1;             // AXI4 ID field width (ignored in this model)
   parameter USER_WIDTH  = 1;             // AXI4 User field width (ignored in this model)
   parameter REGION_MAP_SIZE = 1;         // AXI4 Region Map (ignored in this model)
   parameter xwburstsize = 0;             // wBurst size for scverify transactor
   parameter xrburstsize = 0;             // rBurst size for scverify transactor
   parameter xwBASE_ADDRESS = 0;          // wBase address for scverify transactor
   parameter xrBASE_ADDRESS = 0;          // rBase address for scverify transactor
   parameter xwBASE_ADDRESSU = 0;          // upper word for 64-bit wBase address for scverify transactor
   parameter xrBASE_ADDRESSU = 0;          // upper word for 64-bit rBase address for scverify transactor
                              
   // AXI-4 Global Signals 
   input                               ACLK;                           // Rising edge clock
   input                               ARESETn;                        // Active LOW asynchronous reset

   // ============== AXI-4 Write Address Channel Signals
   output [ID_WIDTH-1:0]               AWID;                           // Write Transaction ID
   output [ADDR_WIDTH-1:0]             AWADDR;                         // Write address
   output [7:0]                        AWLEN;                          // Write burst length in beats
   output [2:0]                        AWSIZE;                         // Write burst size - encoding(above)
   output [1:0]                        AWBURST;                        // Write burst mode
   output                              AWLOCK;                         // Lock type
   output [3:0]                        AWCACHE;                        // Memory type
   output [2:0]                        AWPROT;                         // Protection Type
   output [3:0]                        AWQOS;                          // Quality of Service
   output [3:0]                        AWREGION;                       // Region identifier
   output [USER_WIDTH-1:0]             AWUSER;                         // User signal
   output                              AWVALID;                        // Write address valid
   input                               AWREADY;                        // Write address ready
   
   // ============== AXI4 Write Data Channel
   output [DATA_WIDTH-1:0]             WDATA;                          // Write data
   output [DATA_WIDTH/8-1:0]           WSTRB;                          // Write strobe (bytewise)
   output                              WLAST;                          // Write last
   output [USER_WIDTH-1:0]             WUSER;                          // User signal
   output                              WVALID;                         // Write data is valid
   input                               WREADY;                         // Write ready
   
   // ============== AXI4 Write Response Channel Signals
   input [ID_WIDTH-1:0]                BID;                            // Response Transaction ID tag
   input [1:0]                         BRESP;                          // Write response (of slave)
   input [USER_WIDTH-1:0]              BUSER;                          // User signal
   input                               BVALID;                         // Write response valid
   output                              BREADY;                         // Response ready
   
   // ============== AXI4 Read Address Channel Signals
   output [ID_WIDTH-1:0]               ARID;                           // Read Transaction ID
   output [ADDR_WIDTH-1:0]             ARADDR;                         // Read address
   output [7:0]                        ARLEN;                          // Read burst length in beats
   output [2:0]                        ARSIZE;                         // Read burst size - encoding(above)
   output [1:0]                        ARBURST;                        // Read burst mode
   output                              ARLOCK;                         // Lock type
   output [3:0]                        ARCACHE;                        // Memory type
   output [2:0]                        ARPROT;                         // Protection Type
   output [3:0]                        ARQOS;                          // Quality of Service
   output [3:0]                        ARREGION;                       // Region identifier
   output [USER_WIDTH-1:0]             ARUSER;                         // User signal
   output                              ARVALID;                        // Read address valid
   input                               ARREADY;                        // Read address ready

   // ============== AXI-4 Read Data Channel Signals
   input [ID_WIDTH-1:0]                RID;                            // Read Transaction ID tag
   input [DATA_WIDTH-1:0]              RDATA;                          // Read data
   input [1:0]                         RRESP;                          // Read response
   input                               RLAST;                          // Read last
   input [USER_WIDTH-1:0]              RUSER;                          // User signal
   input                               RVALID;                         // Read valid
   output                              RREADY;                         // Read ready
   
   // Configuration interface
   input [ADDR_WIDTH-1:0]                cfgwBaseAddress;
   input [ADDR_WIDTH-1:0]                cfgrBaseAddress;
   input [31:0]                          cfgwBurstSize; 
   input [31:0]                          cfgrBurstSize; 
   input [31:0]                          cfgTimeout; 
   
   // Catapult interface
   input                               m_re;      // Catapult requests read 
   input                               m_we;      // Catapult requests write 
   input  [addr_w-1:0]                 m_waddr;   // Address for write request (axi_addr = base_addr + m_addr)
   input  [addr_w-1:0]                 m_raddr;   // Address for read request (axi_addr = base_addr + m_addr)
   input [31:0]                        m_wburst;  // Write Burst length (constant wburstsize for now, future enhancement driven by operator)
   input [31:0]                        m_rburst;  // Read Burst length (constant rburstsize for now, future enhancement driven by operator)
   output [cwidth-1:0]                 m_din;     // Data into catapult block through this interface (read request)
   input  [cwidth-1:0]                 m_dout;    // Data out to slave
   output                              m_wrdy;    // Master ready for write
   output                              m_rrdy;    // Master read-data is ready
   output                              is_idle;   // the component is idle.  The next clk can be suppressed
                     
   // Transactor resource interface (for SCVerify simulation only)
   output                              m_wCaughtUp;
   output [2:0]                        m_wstate;

   wire                                read_is_idle;
   wire                                write_is_idle;
   assign is_idle = read_is_idle && write_is_idle;

   ccs_axi4_master_read_core #(
                          .rscid(rscid), .depth(depth), .op_width(op_width), .cwidth(cwidth), .addr_w(addr_w), .rst_ph(rst_ph),
                          .ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH), .ID_WIDTH(ID_WIDTH),
                          .USER_WIDTH(USER_WIDTH), .REGION_MAP_SIZE(REGION_MAP_SIZE)
                          )
   MASTER_READ(
               .ACLK(ACLK), .ARESETn(ARESETn), 
               .ARID(ARID), .ARADDR(ARADDR), .ARLEN(ARLEN), .ARSIZE(ARSIZE), .ARBURST(ARBURST), .ARLOCK(ARLOCK), .ARCACHE(ARCACHE),
               .ARPROT(ARPROT), .ARQOS(ARQOS), .ARREGION(ARREGION), .ARUSER(ARUSER), .ARVALID(ARVALID), .ARREADY(ARREADY),
               .RID(RID), .RDATA(RDATA), .RRESP(RRESP), .RLAST(RLAST), .RUSER(RUSER), .RVALID(RVALID), .RREADY(RREADY),
               .cfgBaseAddress(cfgrBaseAddress), .cfgBurstSize(cfgrBurstSize), .cfgTimeout(cfgTimeout),
               .m_re(m_re), .m_raddr(m_raddr), .m_rburst(m_rburst),
               .m_din(m_din), .m_rrdy(m_rrdy), .is_idle(read_is_idle));
   
   
   ccs_axi4_master_write_core #(
                           .rscid(rscid), .depth(depth), .op_width(op_width), .cwidth(cwidth), .addr_w(addr_w), .rst_ph(rst_ph),
                           .ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH), .ID_WIDTH(ID_WIDTH),
                           .USER_WIDTH(USER_WIDTH), .REGION_MAP_SIZE(REGION_MAP_SIZE)
                           )
   MASTER_WRITE(
                .ACLK(ACLK), .ARESETn(ARESETn), 
                .AWID(AWID), .AWADDR(AWADDR), .AWLEN(AWLEN), .AWSIZE(AWSIZE), .AWBURST(AWBURST), .AWLOCK(AWLOCK), .AWCACHE(AWCACHE), 
                .AWPROT(AWPROT), .AWQOS(AWQOS), .AWREGION(AWREGION), .AWUSER(AWUSER), .AWVALID(AWVALID), .AWREADY(AWREADY),
                .WDATA(WDATA), .WSTRB(WSTRB), .WLAST(WLAST), .WUSER(WUSER), .WVALID(WVALID), .WREADY(WREADY), .BID(BID),
                .BRESP(BRESP), .BUSER(BUSER), .BVALID(BVALID), .BREADY(BREADY),
                .cfgBaseAddress(cfgwBaseAddress), .cfgBurstSize(cfgwBurstSize), .cfgTimeout(cfgTimeout),
                .m_we(m_we), .m_waddr(m_waddr), .m_wburst(m_wburst), .m_dout(m_dout), .m_wrdy(m_wrdy),
                .is_idle(write_is_idle), .m_wCaughtUp(m_wCaughtUp), .m_wstate(m_wstate));

endmodule


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master.v 
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
// DESIGN UNIT:        ccs_axi4_master
//
// DESCRIPTION:
//   This model implements an AXI-4 Master memory interface for use in 
// Interface Synthesis in Catapult.  Burst sizes and base address
// configured with parameters at compile-time
//
// CHANGE LOG:
//  05/16/2019 - Added timeout feature and port
//  01/29/2019 - Add read/write base address options
//  01/20/2019 - Refactored into 3 components
//  06/15/2018 - Initial implementation
//
// --------------------------------------------------------------------------


module ccs_axi4_master (ACLK, ARESETn, 
  AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWQOS, AWREGION, AWUSER, AWVALID, AWREADY,
  WDATA, WSTRB, WLAST, WUSER, WVALID, WREADY,
  BID, BRESP, BUSER, BVALID, BREADY,
  ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARQOS, ARREGION, ARUSER, ARVALID, ARREADY,
  RID, RDATA, RRESP, RLAST, RUSER, RVALID, RREADY,
  m_re, m_we, m_waddr, m_raddr, m_wburst, m_rburst , m_din, m_dout, m_wrdy,  m_rrdy, is_idle,
  m_wCaughtUp, m_wstate);

   // All flavors of the axi4_master have the same parameters for consistency.
   // In some cases a param may or may not be needed.

   // Catapult Bus Configuration generics
   parameter rscid = 1;                   // Resource ID
   parameter depth = 16;                  // Number of addressable elements (up to 20bit address)
   parameter op_width = 1;                // dummy parameter for cwidth calculation
   parameter cwidth = 32;                 // Catapult data bus width (multiples of 8)
   parameter addr_w = 4;                  // Catapult address bus width
   parameter wburstsize = 0;              // Catapult configuration option for Write burst size
   parameter rburstsize = 0;              // Catapult configuration option for Read burst size
   parameter rst_ph = 0;                  // Reset phase - negative default
   parameter timeout = 0;                 // #cycles timeout for burst stall

   // AXI-4 Bus Configuration generics
   parameter ADDR_WIDTH  = 32;            // AXI4 bus address width 
   parameter DATA_WIDTH = 32;             // AXI4 read&write bus data width 
   parameter ID_WIDTH    = 1;             // AXI4 ID field width (ignored in this model)
   parameter USER_WIDTH  = 1;             // AXI4 User field width (ignored in this model)
   parameter REGION_MAP_SIZE = 1;         // AXI4 Region Map (ignored in this model)
   parameter wBASE_ADDRESS = 0;           // AXI4 write channel base address
   parameter rBASE_ADDRESS = 0;           // AXI4 read channel base address
   parameter wBASE_ADDRESSU = 0;          // Upper word of 64-bit AXI4 write channel base address
   parameter rBASE_ADDRESSU = 0;          // Upper word of 64-bit AXI4 read channel base address
   
   // AXI-4 Global Signals 
   input                               ACLK;                           // Rising edge clock
   input                               ARESETn;                        // Active LOW asynchronous reset
   // ============== AXI-4 Write Address Channel Signals
   output [ID_WIDTH-1:0]               AWID;                           // Write Transaction ID
   output [ADDR_WIDTH-1:0]             AWADDR;                         // Write address
   output [7:0]                        AWLEN;                          // Write burst length in beats
   output [2:0]                        AWSIZE;                         // Write burst size - encoding(above)
   output [1:0]                        AWBURST;                        // Write burst mode
   output                              AWLOCK;                         // Lock type
   output [3:0]                        AWCACHE;                        // Memory type
   output [2:0]                        AWPROT;                         // Protection Type
   output [3:0]                        AWQOS;                          // Quality of Service
   output [3:0]                        AWREGION;                       // Region identifier
   output [USER_WIDTH-1:0]             AWUSER;                         // User signal
   output                              AWVALID;                        // Write address valid
   input                               AWREADY;                        // Write address ready
   // ============== AXI4 Write Data Channel
   //output [ID_WIDTH-1:0]               WID;                           // Read Transaction ID - only axi3
   output [DATA_WIDTH-1:0]             WDATA;                          // Write data
   output [DATA_WIDTH/8-1:0]           WSTRB;                          // Write strobe (bytewise)
   output                              WLAST;                          // Write last
   output [USER_WIDTH-1:0]             WUSER;                          // User signal
   output                              WVALID;                         // Write data is valid
   input                               WREADY;                         // Write ready
   // ============== AXI4 Write Response Channel Signals
   input [ID_WIDTH-1:0]                BID;                            // Response Transaction ID tag
   input [1:0]                         BRESP;                          // Write response (of slave)
   input [USER_WIDTH-1:0]              BUSER;                          // User signal
   input                               BVALID;                         // Write response valid
   output                              BREADY;                         // Response ready
   // ============== AXI4 Read Address Channel Signals
   output [ID_WIDTH-1:0]               ARID;                           // Read Transaction ID
   output [ADDR_WIDTH-1:0]             ARADDR;                         // Read address
   output [7:0]                        ARLEN;                          // Read burst length in beats
   output [2:0]                        ARSIZE;                         // Read burst size - encoding(above)
   output [1:0]                        ARBURST;                        // Read burst mode
   output                              ARLOCK;                         // Lock type
   output [3:0]                        ARCACHE;                        // Memory type
   output [2:0]                        ARPROT;                         // Protection Type
   output [3:0]                        ARQOS;                          // Quality of Service
   output [3:0]                        ARREGION;                       // Region identifier
   output [USER_WIDTH-1:0]             ARUSER;                         // User signal
   output                              ARVALID;                        // Read address valid
   input                               ARREADY;                        // Read address ready
   // ============== AXI-4 Read Data Channel Signals
   input [ID_WIDTH-1:0]                RID;                            // Read Transaction ID tag
   input [DATA_WIDTH-1:0]              RDATA;                          // Read data
   input [1:0]                         RRESP;                          // Read response
   input                               RLAST;                          // Read last
   input [USER_WIDTH-1:0]              RUSER;                          // User signal
   input                               RVALID;                         // Read valid
   output                              RREADY;                         // Read ready

   // Catapult interface
   input                               m_re;      // Catapult requests read 
   input                               m_we;      // Catapult requests write 
   input  [addr_w-1:0]                 m_waddr;   // Address for write request (axi_addr = base_addr + m_addr)
   input  [addr_w-1:0]                 m_raddr;   // Address for read request (axi_addr = base_addr + m_addr)
   input [31:0]                        m_wburst;  // Write Burst length (constant wburstsize for now, future enhancement driven by operator)
   input [31:0]                        m_rburst;  // Read Burst length (constant rburstsize for now, future enhancement driven by operator)
   output [cwidth-1:0]                 m_din;     // Data into catapult block through this interface (read request)
   input  [cwidth-1:0]                 m_dout;    // Data out to slave
   output                              m_wrdy;    // Master ready for write
   output                              m_rrdy;    // Master read-data is ready
   output                              is_idle;   // the component is idle.  The next clk can be suppressed

   // Transactor resource interface (for SCVerify simulation only)
   output                              m_wCaughtUp;
   output [2:0]                        m_wstate;
   
   wire [ADDR_WIDTH-1:0]               cfgwBaseAddress;
   wire [ADDR_WIDTH-1:0]               cfgrBaseAddress;
   wire [31:0]                         cfgwBurstSize; 
   wire [31:0]                         cfgrBurstSize; 
   wire [31:0]                         cfgTimeout;
   
   assign cfgwBaseAddress = {wBASE_ADDRESSU,wBASE_ADDRESS};
   assign cfgrBaseAddress = {rBASE_ADDRESSU,rBASE_ADDRESS};
   assign cfgwBurstSize  = wburstsize;
   assign cfgrBurstSize  = rburstsize;
   assign cfgTimeout = timeout;
     
   ccs_axi4_master_core #(
                          .rscid(rscid), .depth(depth), .op_width(op_width), .cwidth(cwidth), .addr_w(addr_w), .rst_ph(rst_ph),
                          .ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH), .ID_WIDTH(ID_WIDTH),
                          .USER_WIDTH(USER_WIDTH), .REGION_MAP_SIZE(REGION_MAP_SIZE)
                          )
   MASTER_CORE(
               .ACLK(ACLK), .ARESETn(ARESETn), 
               .AWID(AWID), .AWADDR(AWADDR), .AWLEN(AWLEN), .AWSIZE(AWSIZE), .AWBURST(AWBURST), .AWLOCK(AWLOCK), .AWCACHE(AWCACHE), 
               .AWPROT(AWPROT), .AWQOS(AWQOS), .AWREGION(AWREGION), .AWUSER(AWUSER), .AWVALID(AWVALID), .AWREADY(AWREADY),
               .WDATA(WDATA), .WSTRB(WSTRB), .WLAST(WLAST), .WUSER(WUSER), .WVALID(WVALID), .WREADY(WREADY), .BID(BID),
               .BRESP(BRESP), .BUSER(BUSER), .BVALID(BVALID), .BREADY(BREADY),
               .ARID(ARID), .ARADDR(ARADDR), .ARLEN(ARLEN), .ARSIZE(ARSIZE), .ARBURST(ARBURST), .ARLOCK(ARLOCK), .ARCACHE(ARCACHE),
               .ARPROT(ARPROT), .ARQOS(ARQOS), .ARREGION(ARREGION), .ARUSER(ARUSER), .ARVALID(ARVALID), .ARREADY(ARREADY),
               .RID(RID), .RDATA(RDATA), .RRESP(RRESP), .RLAST(RLAST), .RUSER(RUSER), .RVALID(RVALID), .RREADY(RREADY),
               .cfgwBaseAddress(cfgwBaseAddress), .cfgrBaseAddress(cfgrBaseAddress),
               .cfgwBurstSize(cfgwBurstSize), .cfgrBurstSize(cfgrBurstSize),
               .cfgTimeout(cfgTimeout),
               .m_re(m_re), .m_we(m_we), .m_waddr(m_waddr), .m_raddr(m_raddr), .m_wburst(m_wburst), .m_rburst(m_rburst),
               .m_din(m_din), .m_dout(m_dout), .m_wrdy(m_wrdy), .m_rrdy(m_rrdy),
               .is_idle(is_idle),
               .m_wCaughtUp(m_wCaughtUp), .m_wstate(m_wstate) 
               );
endmodule


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_out_wait_v1.v 
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

module ccs_sync_out_wait_v1 (vld, irdy, ivld, rdy);
  parameter integer rscid = 1;

  input  ivld;
  output irdy;
  output vld;
  input  rdy;

  wire   irdy;
  wire   vld;

  assign vld = ivld;
  assign irdy = rdy;
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


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_out_dreg_v2.v 
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


module mgc_out_dreg_v2 (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input    [width-1:0] d;
  output   [width-1:0] z;

  wire     [width-1:0] z;

  assign z = d;

endmodule

//------> ../td_ccore_solutions/mult_f73ea71ea7ffbd1e4fbfa712b6b85de770f1_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 20:51:33 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    mult_core
// ------------------------------------------------------------------


module mult_core (
  x_rsc_dat, y_rsc_dat, y_rsc_dat_1, p_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat,
      ccs_ccore_clk, ccs_ccore_srst, ccs_ccore_en
);
  input [31:0] x_rsc_dat;
  input [31:0] y_rsc_dat;
  input [31:0] y_rsc_dat_1;
  input [31:0] p_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;


  // Interconnect Declarations
  wire [31:0] x_rsci_idat;
  wire [31:0] y_rsci_idat;
  wire [31:0] y_rsci_idat_1;
  wire [31:0] p_rsci_idat;
  reg [31:0] return_rsci_d;
  wire ccs_ccore_start_rsci_idat;
  wire and_dcpl;
  reg slc_32_svs_1;
  reg main_stage_0_2;
  reg [31:0] p_buf_sva_1;
  reg [31:0] p_buf_sva_2;
  reg [31:0] res_sva_1;
  reg [31:0] z_mul_itm_1;
  wire [63:0] nl_z_mul_itm_1;
  reg [31:0] operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1;
  reg VEC_LOOP_asn_itm_1;
  wire [31:0] res_sva_3;
  wire [32:0] nl_res_sva_3;
  wire res_and_cse;
  wire p_and_1_cse;
  wire if_acc_1_itm_32_1;

  wire[31:0] if_acc_nl;
  wire[32:0] nl_if_acc_nl;
  wire[63:0] t_mul_nl;
  wire[31:0] z_mul_nl;
  wire[63:0] nl_z_mul_nl;
  wire[32:0] if_acc_1_nl;
  wire[33:0] nl_if_acc_1_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd7),
  .width(32'sd32)) x_rsci (
      .dat(x_rsc_dat),
      .idat(x_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd8),
  .width(32'sd32)) y_rsci (
      .dat(y_rsc_dat),
      .idat(y_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd9),
  .width(32'sd32)) y_rsci_1 (
      .dat(y_rsc_dat_1),
      .idat(y_rsci_idat_1)
    );
  ccs_in_v1 #(.rscid(32'sd10),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd11),
  .width(32'sd32)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  ccs_in_v1 #(.rscid(32'sd19),
  .width(32'sd1)) ccs_ccore_start_rsci (
      .dat(ccs_ccore_start_rsc_dat),
      .idat(ccs_ccore_start_rsci_idat)
    );
  assign res_and_cse = ccs_ccore_en & and_dcpl;
  assign p_and_1_cse = ccs_ccore_en & ccs_ccore_start_rsci_idat;
  assign nl_z_mul_nl = operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1
      * p_buf_sva_1;
  assign z_mul_nl = nl_z_mul_nl[31:0];
  assign nl_res_sva_3 = z_mul_itm_1 - z_mul_nl;
  assign res_sva_3 = nl_res_sva_3[31:0];
  assign nl_if_acc_1_nl = ({1'b1 , res_sva_3}) + conv_u2u_32_33(~ p_buf_sva_1) +
      33'b000000000000000000000000000000001;
  assign if_acc_1_nl = nl_if_acc_1_nl[32:0];
  assign if_acc_1_itm_32_1 = readslicef_33_1_32(if_acc_1_nl);
  assign and_dcpl = main_stage_0_2 & VEC_LOOP_asn_itm_1;
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(if_acc_nl, res_sva_1, slc_32_svs_1);
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      VEC_LOOP_asn_itm_1 <= 1'b0;
      main_stage_0_2 <= 1'b0;
    end
    else if ( ccs_ccore_en ) begin
      VEC_LOOP_asn_itm_1 <= ccs_ccore_start_rsci_idat;
      main_stage_0_2 <= 1'b1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( res_and_cse ) begin
      res_sva_1 <= res_sva_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      slc_32_svs_1 <= 1'b0;
    end
    else if ( res_and_cse ) begin
      slc_32_svs_1 <= if_acc_1_itm_32_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & and_dcpl & (~ if_acc_1_itm_32_1) ) begin
      p_buf_sva_2 <= p_buf_sva_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( p_and_1_cse ) begin
      p_buf_sva_1 <= p_rsci_idat;
      z_mul_itm_1 <= nl_z_mul_itm_1[31:0];
      operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1 <= readslicef_64_32_32(t_mul_nl);
    end
  end
  assign nl_if_acc_nl = res_sva_1 - p_buf_sva_2;
  assign if_acc_nl = nl_if_acc_nl[31:0];
  assign nl_z_mul_itm_1  = x_rsci_idat * y_rsci_idat;
  assign t_mul_nl = conv_u2u_64_64(x_rsci_idat * y_rsci_idat_1);

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


  function automatic [0:0] readslicef_33_1_32;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_33_1_32 = tmp[0:0];
  end
  endfunction


  function automatic [31:0] readslicef_64_32_32;
    input [63:0] vector;
    reg [63:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_64_32_32 = tmp[31:0];
  end
  endfunction


  function automatic [32:0] conv_u2u_32_33 ;
    input [31:0]  vector ;
  begin
    conv_u2u_32_33 = {1'b0, vector};
  end
  endfunction


  function automatic [63:0] conv_u2u_64_64 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_64 = vector;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    mult
// ------------------------------------------------------------------


module mult (
  x_rsc_dat, y_rsc_dat, y_rsc_dat_1, p_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat,
      ccs_ccore_clk, ccs_ccore_srst, ccs_ccore_en
);
  input [31:0] x_rsc_dat;
  input [31:0] y_rsc_dat;
  input [31:0] y_rsc_dat_1;
  input [31:0] p_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  mult_core mult_core_inst (
      .x_rsc_dat(x_rsc_dat),
      .y_rsc_dat(y_rsc_dat),
      .y_rsc_dat_1(y_rsc_dat_1),
      .p_rsc_dat(p_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_start_rsc_dat(ccs_ccore_start_rsc_dat),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_srst(ccs_ccore_srst),
      .ccs_ccore_en(ccs_ccore_en)
    );
endmodule




//------> ../td_ccore_solutions/modulo_sub_07838c82f6990156c8a5816c10673c6c6382_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 20:51:35 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    modulo_sub_core
// ------------------------------------------------------------------


module modulo_sub_core (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_clk, ccs_ccore_en
);
  input [31:0] base_rsc_dat;
  input [31:0] m_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_clk;
  input ccs_ccore_en;


  // Interconnect Declarations
  wire [31:0] base_rsci_idat;
  wire [31:0] m_rsci_idat;
  reg [31:0] return_rsci_d;

  wire[31:0] qif_acc_nl;
  wire[32:0] nl_qif_acc_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd4),
  .width(32'sd32)) base_rsci (
      .dat(base_rsc_dat),
      .idat(base_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd5),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd6),
  .width(32'sd32)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(({1'b0 , (base_rsci_idat[30:0])}), qif_acc_nl,
          base_rsci_idat[31]);
    end
  end
  assign nl_qif_acc_nl = ({1'b1 , (base_rsci_idat[30:0])}) + m_rsci_idat;
  assign qif_acc_nl = nl_qif_acc_nl[31:0];

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
//  Design Unit:    modulo_sub
// ------------------------------------------------------------------


module modulo_sub (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat, ccs_ccore_clk,
      ccs_ccore_srst, ccs_ccore_en
);
  input [31:0] base_rsc_dat;
  input [31:0] m_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  modulo_sub_core modulo_sub_core_inst (
      .base_rsc_dat(base_rsc_dat),
      .m_rsc_dat(m_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_en(ccs_ccore_en)
    );
endmodule




//------> ../td_ccore_solutions/modulo_add_47661927f6b7de2843654159756fee1660f9_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 20:51:36 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    modulo_add_core
// ------------------------------------------------------------------


module modulo_add_core (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_clk, ccs_ccore_en
);
  input [31:0] base_rsc_dat;
  input [31:0] m_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_clk;
  input ccs_ccore_en;


  // Interconnect Declarations
  wire [31:0] base_rsci_idat;
  wire [31:0] m_rsci_idat;
  reg [31:0] return_rsci_d;

  wire[31:0] qif_acc_nl;
  wire[32:0] nl_qif_acc_nl;
  wire[33:0] acc_nl;
  wire[34:0] nl_acc_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd1),
  .width(32'sd32)) base_rsci (
      .dat(base_rsc_dat),
      .idat(base_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd3),
  .width(32'sd32)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(base_rsci_idat, qif_acc_nl, readslicef_34_1_33(acc_nl));
    end
  end
  assign nl_qif_acc_nl = base_rsci_idat - m_rsci_idat;
  assign qif_acc_nl = nl_qif_acc_nl[31:0];
  assign nl_acc_nl = conv_u2u_32_34(m_rsci_idat) - conv_s2u_32_34(base_rsci_idat);
  assign acc_nl = nl_acc_nl[33:0];

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


  function automatic [0:0] readslicef_34_1_33;
    input [33:0] vector;
    reg [33:0] tmp;
  begin
    tmp = vector >> 33;
    readslicef_34_1_33 = tmp[0:0];
  end
  endfunction


  function automatic [33:0] conv_s2u_32_34 ;
    input [31:0]  vector ;
  begin
    conv_s2u_32_34 = {{2{vector[31]}}, vector};
  end
  endfunction


  function automatic [33:0] conv_u2u_32_34 ;
    input [31:0]  vector ;
  begin
    conv_u2u_32_34 = {{2{1'b0}}, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    modulo_add
// ------------------------------------------------------------------


module modulo_add (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat, ccs_ccore_clk,
      ccs_ccore_srst, ccs_ccore_en
);
  input [31:0] base_rsc_dat;
  input [31:0] m_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  modulo_add_core modulo_add_core_inst (
      .base_rsc_dat(base_rsc_dat),
      .m_rsc_dat(m_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_en(ccs_ccore_en)
    );
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
//  Generated date: Mon Sep 13 20:51:52 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_17_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_17_10_32_1024_1024_32_1_gen
    (
  qb, adrb, adrb_d, qb_d, readB_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] qb;
  output [9:0] adrb;
  input [9:0] adrb_d;
  output [31:0] qb_d;
  input readB_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qb_d = qb;
  assign adrb = (adrb_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_16_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_16_10_32_1024_1024_32_1_gen
    (
  qb, adrb, adrb_d, qb_d, readB_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] qb;
  output [9:0] adrb;
  input [9:0] adrb_d;
  output [31:0] qb_d;
  input readB_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qb_d = qb;
  assign adrb = (adrb_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_core_fsm (
  clk, rst, core_wen, fsm_output, main_C_0_tr0, VEC_LOOP_C_7_tr0, COMP_LOOP_C_2_tr0,
      STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input core_wen;
  output [15:0] fsm_output;
  reg [15:0] fsm_output;
  input main_C_0_tr0;
  input VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_2_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIF_precomp_core_core_fsm_1
  parameter
    main_C_0 = 4'd0,
    STAGE_LOOP_C_0 = 4'd1,
    COMP_LOOP_C_0 = 4'd2,
    COMP_LOOP_C_1 = 4'd3,
    VEC_LOOP_C_0 = 4'd4,
    VEC_LOOP_C_1 = 4'd5,
    VEC_LOOP_C_2 = 4'd6,
    VEC_LOOP_C_3 = 4'd7,
    VEC_LOOP_C_4 = 4'd8,
    VEC_LOOP_C_5 = 4'd9,
    VEC_LOOP_C_6 = 4'd10,
    VEC_LOOP_C_7 = 4'd11,
    COMP_LOOP_C_2 = 4'd12,
    STAGE_LOOP_C_1 = 4'd13,
    main_C_1 = 4'd14,
    main_C_2 = 4'd15;

  reg [3:0] state_var;
  reg [3:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIF_precomp_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 16'b0000000000000010;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 16'b0000000000000100;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 16'b0000000000001000;
        state_var_NS = VEC_LOOP_C_0;
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 16'b0000000000010000;
        state_var_NS = VEC_LOOP_C_1;
      end
      VEC_LOOP_C_1 : begin
        fsm_output = 16'b0000000000100000;
        state_var_NS = VEC_LOOP_C_2;
      end
      VEC_LOOP_C_2 : begin
        fsm_output = 16'b0000000001000000;
        state_var_NS = VEC_LOOP_C_3;
      end
      VEC_LOOP_C_3 : begin
        fsm_output = 16'b0000000010000000;
        state_var_NS = VEC_LOOP_C_4;
      end
      VEC_LOOP_C_4 : begin
        fsm_output = 16'b0000000100000000;
        state_var_NS = VEC_LOOP_C_5;
      end
      VEC_LOOP_C_5 : begin
        fsm_output = 16'b0000001000000000;
        state_var_NS = VEC_LOOP_C_6;
      end
      VEC_LOOP_C_6 : begin
        fsm_output = 16'b0000010000000000;
        state_var_NS = VEC_LOOP_C_7;
      end
      VEC_LOOP_C_7 : begin
        fsm_output = 16'b0000100000000000;
        if ( VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 16'b0001000000000000;
        if ( COMP_LOOP_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 16'b0010000000000000;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 16'b0100000000000000;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 16'b1000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 16'b0000000000000001;
        if ( main_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_staller
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_staller (
  clk, rst, core_wen, core_wten, vec_rsci_wen_comp, vec_rsci_wen_comp_1, complete_rsci_wen_comp
);
  input clk;
  input rst;
  output core_wen;
  output core_wten;
  input vec_rsci_wen_comp;
  input vec_rsci_wen_comp_1;
  input complete_rsci_wen_comp;


  // Interconnect Declarations
  reg core_wten_reg;


  // Interconnect Declarations for Component Instantiations 
  assign core_wen = vec_rsci_wen_comp & vec_rsci_wen_comp_1 & complete_rsci_wen_comp;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl (
  core_wten, r_rsc_triosy_obj_iswt0, r_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input r_rsc_triosy_obj_iswt0;
  output r_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign r_rsc_triosy_obj_ld_core_sct = r_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl (
  core_wten, p_rsc_triosy_obj_iswt0, p_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input p_rsc_triosy_obj_iswt0;
  output p_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign p_rsc_triosy_obj_ld_core_sct = p_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl (
  core_wten, vec_rsc_triosy_obj_iswt0, vec_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_obj_iswt0;
  output vec_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_obj_ld_core_sct = vec_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp (
  clk, rst, twiddle_h_rsci_qb_d, twiddle_h_rsci_qb_d_mxwt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt
);
  input clk;
  input rst;
  input [31:0] twiddle_h_rsci_qb_d;
  output [31:0] twiddle_h_rsci_qb_d_mxwt;
  input twiddle_h_rsci_biwt;
  input twiddle_h_rsci_bdwt;


  // Interconnect Declarations
  reg twiddle_h_rsci_bcwt;
  reg [31:0] twiddle_h_rsci_qb_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_qb_d_mxwt = MUX_v_32_2_2(twiddle_h_rsci_qb_d, twiddle_h_rsci_qb_d_bfwt,
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
      twiddle_h_rsci_qb_d_bfwt <= twiddle_h_rsci_qb_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl (
  core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt,
      twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct, twiddle_h_rsci_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  output twiddle_h_rsci_biwt;
  output twiddle_h_rsci_bdwt;
  output twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;
  input twiddle_h_rsci_oswt_pff;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_bdwt = twiddle_h_rsci_oswt & core_wen;
  assign twiddle_h_rsci_biwt = (~ core_wten) & twiddle_h_rsci_oswt;
  assign twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct = twiddle_h_rsci_oswt_pff
      & core_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_qb_d, twiddle_rsci_qb_d_mxwt, twiddle_rsci_biwt, twiddle_rsci_bdwt
);
  input clk;
  input rst;
  input [31:0] twiddle_rsci_qb_d;
  output [31:0] twiddle_rsci_qb_d_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;


  // Interconnect Declarations
  reg twiddle_rsci_bcwt;
  reg [31:0] twiddle_rsci_qb_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_qb_d_mxwt = MUX_v_32_2_2(twiddle_rsci_qb_d, twiddle_rsci_qb_d_bfwt,
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
      twiddle_rsci_qb_d_bfwt <= twiddle_rsci_qb_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl (
  core_wen, core_wten, twiddle_rsci_oswt, twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct,
      twiddle_rsci_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  output twiddle_rsci_biwt;
  output twiddle_rsci_bdwt;
  output twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;
  input twiddle_rsci_oswt_pff;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_bdwt = twiddle_rsci_oswt & core_wen;
  assign twiddle_rsci_biwt = (~ core_wten) & twiddle_rsci_oswt;
  assign twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct = twiddle_rsci_oswt_pff
      & core_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp (
  clk, rst, vec_rsci_oswt, vec_rsci_wen_comp, vec_rsci_oswt_1, vec_rsci_wen_comp_1,
      vec_rsci_m_waddr_core, vec_rsci_m_raddr_core, vec_rsci_m_din_mxwt, vec_rsci_m_dout_core,
      vec_rsci_biwt, vec_rsci_bdwt, vec_rsci_bcwt, vec_rsci_biwt_1, vec_rsci_bdwt_2,
      vec_rsci_bcwt_1, vec_rsci_m_waddr, vec_rsci_m_waddr_core_sct, vec_rsci_m_raddr,
      vec_rsci_m_raddr_core_sct, vec_rsci_m_din, vec_rsci_m_dout
);
  input clk;
  input rst;
  input vec_rsci_oswt;
  output vec_rsci_wen_comp;
  input vec_rsci_oswt_1;
  output vec_rsci_wen_comp_1;
  input [9:0] vec_rsci_m_waddr_core;
  input [9:0] vec_rsci_m_raddr_core;
  output [31:0] vec_rsci_m_din_mxwt;
  input [31:0] vec_rsci_m_dout_core;
  input vec_rsci_biwt;
  input vec_rsci_bdwt;
  output vec_rsci_bcwt;
  reg vec_rsci_bcwt;
  input vec_rsci_biwt_1;
  input vec_rsci_bdwt_2;
  output vec_rsci_bcwt_1;
  reg vec_rsci_bcwt_1;
  output [9:0] vec_rsci_m_waddr;
  input vec_rsci_m_waddr_core_sct;
  output [9:0] vec_rsci_m_raddr;
  input vec_rsci_m_raddr_core_sct;
  input [31:0] vec_rsci_m_din;
  output [31:0] vec_rsci_m_dout;


  // Interconnect Declarations
  reg [31:0] vec_rsci_m_din_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsci_wen_comp = (~ vec_rsci_oswt) | vec_rsci_biwt | vec_rsci_bcwt;
  assign vec_rsci_wen_comp_1 = (~ vec_rsci_oswt_1) | vec_rsci_biwt_1 | vec_rsci_bcwt_1;
  assign vec_rsci_m_waddr = MUX_v_10_2_2(10'b0000000000, vec_rsci_m_waddr_core, vec_rsci_m_waddr_core_sct);
  assign vec_rsci_m_raddr = MUX_v_10_2_2(10'b0000000000, vec_rsci_m_raddr_core, vec_rsci_m_raddr_core_sct);
  assign vec_rsci_m_din_mxwt = MUX_v_32_2_2(vec_rsci_m_din, vec_rsci_m_din_bfwt,
      vec_rsci_bcwt);
  assign vec_rsci_m_dout = MUX_v_32_2_2(32'b00000000000000000000000000000000, vec_rsci_m_dout_core,
      vec_rsci_m_waddr_core_sct);
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
      vec_rsci_m_din_bfwt <= vec_rsci_m_din;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl (
  core_wen, vec_rsci_oswt, vec_rsci_oswt_1, vec_rsci_biwt, vec_rsci_bdwt, vec_rsci_bcwt,
      vec_rsci_m_re_core_sct, vec_rsci_biwt_1, vec_rsci_bdwt_2, vec_rsci_bcwt_1,
      vec_rsci_m_we_core_sct, vec_rsci_m_wrdy, vec_rsci_m_rrdy
);
  input core_wen;
  input vec_rsci_oswt;
  input vec_rsci_oswt_1;
  output vec_rsci_biwt;
  output vec_rsci_bdwt;
  input vec_rsci_bcwt;
  output vec_rsci_m_re_core_sct;
  output vec_rsci_biwt_1;
  output vec_rsci_bdwt_2;
  input vec_rsci_bcwt_1;
  output vec_rsci_m_we_core_sct;
  input vec_rsci_m_wrdy;
  input vec_rsci_m_rrdy;


  // Interconnect Declarations
  wire vec_rsci_ogwt;
  wire vec_rsci_ogwt_1;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsci_bdwt = vec_rsci_oswt & core_wen;
  assign vec_rsci_biwt = vec_rsci_ogwt & vec_rsci_m_rrdy;
  assign vec_rsci_ogwt = vec_rsci_oswt & (~ vec_rsci_bcwt);
  assign vec_rsci_m_re_core_sct = vec_rsci_ogwt;
  assign vec_rsci_bdwt_2 = vec_rsci_oswt_1 & core_wen;
  assign vec_rsci_biwt_1 = vec_rsci_ogwt_1 & vec_rsci_m_wrdy;
  assign vec_rsci_ogwt_1 = vec_rsci_oswt_1 & (~ vec_rsci_bcwt_1);
  assign vec_rsci_m_we_core_sct = vec_rsci_ogwt_1;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_wait_dp (
  ensig_cgo_iro, ensig_cgo_iro_1, core_wen, ensig_cgo, mult_cmp_ccs_ccore_en, ensig_cgo_1,
      modulo_sub_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo_iro_1;
  input core_wen;
  input ensig_cgo;
  output mult_cmp_ccs_ccore_en;
  input ensig_cgo_1;
  output modulo_sub_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign mult_cmp_ccs_ccore_en = core_wen & (ensig_cgo | ensig_cgo_iro);
  assign modulo_sub_cmp_ccs_ccore_en = core_wen & (ensig_cgo_1 | ensig_cgo_iro_1);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(twiddle_h_rsc_triosy_obj_iswt0),
      .twiddle_h_rsc_triosy_obj_ld_core_sct(twiddle_h_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(twiddle_rsc_triosy_obj_iswt0),
      .twiddle_rsc_triosy_obj_ld_core_sct(twiddle_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(r_rsc_triosy_obj_iswt0),
      .r_rsc_triosy_obj_ld_core_sct(r_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(p_rsc_triosy_obj_iswt0),
      .p_rsc_triosy_obj_ld_core_sct(p_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_obj_iswt0(vec_rsc_triosy_obj_iswt0),
      .vec_rsc_triosy_obj_ld_core_sct(vec_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_complete_rsci (
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
  ccs_sync_out_wait_v1 #(.rscid(32'sd18)) complete_rsci (
      .vld(complete_rsc_vld),
      .rdy(complete_rsc_rdy),
      .ivld(complete_rsci_ivld_core_sct),
      .irdy(complete_rsci_irdy)
    );
  inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .complete_rsci_oswt(complete_rsci_oswt),
      .complete_rsci_biwt(complete_rsci_biwt),
      .complete_rsci_bdwt(complete_rsci_bdwt),
      .complete_rsci_bcwt(complete_rsci_bcwt),
      .complete_rsci_ivld_core_sct(complete_rsci_ivld_core_sct),
      .complete_rsci_irdy(complete_rsci_irdy)
    );
  inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp_inst
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1 (
  clk, rst, twiddle_h_rsci_qb_d, twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_qb_d_mxwt, twiddle_h_rsci_oswt_pff
);
  input clk;
  input rst;
  input [31:0] twiddle_h_rsci_qb_d;
  output twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  output [31:0] twiddle_h_rsci_qb_d_mxwt;
  input twiddle_h_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsci_biwt;
  wire twiddle_h_rsci_bdwt;
  wire twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct),
      .twiddle_h_rsci_oswt_pff(twiddle_h_rsci_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_qb_d(twiddle_h_rsci_qb_d),
      .twiddle_h_rsci_qb_d_mxwt(twiddle_h_rsci_qb_d_mxwt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt)
    );
  assign twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 (
  clk, rst, twiddle_rsci_qb_d, twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, twiddle_rsci_oswt, twiddle_rsci_qb_d_mxwt, twiddle_rsci_oswt_pff
);
  input clk;
  input rst;
  input [31:0] twiddle_rsci_qb_d;
  output twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  output [31:0] twiddle_rsci_qb_d_mxwt;
  input twiddle_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct),
      .twiddle_rsci_oswt_pff(twiddle_rsci_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_qb_d(twiddle_rsci_qb_d),
      .twiddle_rsci_qb_d_mxwt(twiddle_rsci_qb_d_mxwt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt)
    );
  assign twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d = twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsci (
  clk, rst, vec_rsc_m_wstate, vec_rsc_m_wCaughtUp, vec_rsc_RREADY, vec_rsc_RVALID,
      vec_rsc_RUSER, vec_rsc_RLAST, vec_rsc_RRESP, vec_rsc_RDATA, vec_rsc_RID, vec_rsc_ARREADY,
      vec_rsc_ARVALID, vec_rsc_ARUSER, vec_rsc_ARREGION, vec_rsc_ARQOS, vec_rsc_ARPROT,
      vec_rsc_ARCACHE, vec_rsc_ARLOCK, vec_rsc_ARBURST, vec_rsc_ARSIZE, vec_rsc_ARLEN,
      vec_rsc_ARADDR, vec_rsc_ARID, vec_rsc_BREADY, vec_rsc_BVALID, vec_rsc_BUSER,
      vec_rsc_BRESP, vec_rsc_BID, vec_rsc_WREADY, vec_rsc_WVALID, vec_rsc_WUSER,
      vec_rsc_WLAST, vec_rsc_WSTRB, vec_rsc_WDATA, vec_rsc_AWREADY, vec_rsc_AWVALID,
      vec_rsc_AWUSER, vec_rsc_AWREGION, vec_rsc_AWQOS, vec_rsc_AWPROT, vec_rsc_AWCACHE,
      vec_rsc_AWLOCK, vec_rsc_AWBURST, vec_rsc_AWSIZE, vec_rsc_AWLEN, vec_rsc_AWADDR,
      vec_rsc_AWID, core_wen, vec_rsci_oswt, vec_rsci_wen_comp, vec_rsci_oswt_1,
      vec_rsci_wen_comp_1, vec_rsci_m_waddr_core, vec_rsci_m_raddr_core, vec_rsci_m_din_mxwt,
      vec_rsci_m_dout_core
);
  input clk;
  input rst;
  output [2:0] vec_rsc_m_wstate;
  output vec_rsc_m_wCaughtUp;
  output vec_rsc_RREADY;
  input vec_rsc_RVALID;
  input vec_rsc_RUSER;
  input vec_rsc_RLAST;
  input [1:0] vec_rsc_RRESP;
  input [31:0] vec_rsc_RDATA;
  input vec_rsc_RID;
  input vec_rsc_ARREADY;
  output vec_rsc_ARVALID;
  output vec_rsc_ARUSER;
  output [3:0] vec_rsc_ARREGION;
  output [3:0] vec_rsc_ARQOS;
  output [2:0] vec_rsc_ARPROT;
  output [3:0] vec_rsc_ARCACHE;
  output vec_rsc_ARLOCK;
  output [1:0] vec_rsc_ARBURST;
  output [2:0] vec_rsc_ARSIZE;
  output [7:0] vec_rsc_ARLEN;
  output [31:0] vec_rsc_ARADDR;
  output vec_rsc_ARID;
  output vec_rsc_BREADY;
  input vec_rsc_BVALID;
  input vec_rsc_BUSER;
  input [1:0] vec_rsc_BRESP;
  input vec_rsc_BID;
  input vec_rsc_WREADY;
  output vec_rsc_WVALID;
  output vec_rsc_WUSER;
  output vec_rsc_WLAST;
  output [3:0] vec_rsc_WSTRB;
  output [31:0] vec_rsc_WDATA;
  input vec_rsc_AWREADY;
  output vec_rsc_AWVALID;
  output vec_rsc_AWUSER;
  output [3:0] vec_rsc_AWREGION;
  output [3:0] vec_rsc_AWQOS;
  output [2:0] vec_rsc_AWPROT;
  output [3:0] vec_rsc_AWCACHE;
  output vec_rsc_AWLOCK;
  output [1:0] vec_rsc_AWBURST;
  output [2:0] vec_rsc_AWSIZE;
  output [7:0] vec_rsc_AWLEN;
  output [31:0] vec_rsc_AWADDR;
  output vec_rsc_AWID;
  input core_wen;
  input vec_rsci_oswt;
  output vec_rsci_wen_comp;
  input vec_rsci_oswt_1;
  output vec_rsci_wen_comp_1;
  input [9:0] vec_rsci_m_waddr_core;
  input [9:0] vec_rsci_m_raddr_core;
  output [31:0] vec_rsci_m_din_mxwt;
  input [31:0] vec_rsci_m_dout_core;


  // Interconnect Declarations
  wire vec_rsci_biwt;
  wire vec_rsci_bdwt;
  wire vec_rsci_bcwt;
  wire vec_rsci_m_re_core_sct;
  wire vec_rsci_biwt_1;
  wire vec_rsci_bdwt_2;
  wire vec_rsci_bcwt_1;
  wire vec_rsci_m_we_core_sct;
  wire [9:0] vec_rsci_m_waddr;
  wire [9:0] vec_rsci_m_raddr;
  wire [31:0] vec_rsci_m_din;
  wire [31:0] vec_rsci_m_dout;
  wire vec_rsci_m_wrdy;
  wire vec_rsci_m_rrdy;
  wire vec_rsc_is_idle_1;


  // Interconnect Declarations for Component Instantiations 
  ccs_axi4_master #(.rscid(32'sd0),
  .depth(32'sd1024),
  .op_width(32'sd32),
  .cwidth(32'sd32),
  .addr_w(32'sd10),
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
  .rBASE_ADDRESSU(32'sd0)) vec_rsci (
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
      .m_re(vec_rsci_m_re_core_sct),
      .m_we(vec_rsci_m_we_core_sct),
      .m_waddr(vec_rsci_m_waddr),
      .m_raddr(vec_rsci_m_raddr),
      .m_wburst(32'b00000000000000000000000000000000),
      .m_rburst(32'b00000000000000000000000000000000),
      .m_din(vec_rsci_m_din),
      .m_dout(vec_rsci_m_dout),
      .m_wrdy(vec_rsci_m_wrdy),
      .m_rrdy(vec_rsci_m_rrdy),
      .is_idle(vec_rsc_is_idle_1),
      .m_wCaughtUp(vec_rsc_m_wCaughtUp),
      .m_wstate(vec_rsc_m_wstate)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .vec_rsci_oswt(vec_rsci_oswt),
      .vec_rsci_oswt_1(vec_rsci_oswt_1),
      .vec_rsci_biwt(vec_rsci_biwt),
      .vec_rsci_bdwt(vec_rsci_bdwt),
      .vec_rsci_bcwt(vec_rsci_bcwt),
      .vec_rsci_m_re_core_sct(vec_rsci_m_re_core_sct),
      .vec_rsci_biwt_1(vec_rsci_biwt_1),
      .vec_rsci_bdwt_2(vec_rsci_bdwt_2),
      .vec_rsci_bcwt_1(vec_rsci_bcwt_1),
      .vec_rsci_m_we_core_sct(vec_rsci_m_we_core_sct),
      .vec_rsci_m_wrdy(vec_rsci_m_wrdy),
      .vec_rsci_m_rrdy(vec_rsci_m_rrdy)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsci_vec_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsci_oswt(vec_rsci_oswt),
      .vec_rsci_wen_comp(vec_rsci_wen_comp),
      .vec_rsci_oswt_1(vec_rsci_oswt_1),
      .vec_rsci_wen_comp_1(vec_rsci_wen_comp_1),
      .vec_rsci_m_waddr_core(vec_rsci_m_waddr_core),
      .vec_rsci_m_raddr_core(vec_rsci_m_raddr_core),
      .vec_rsci_m_din_mxwt(vec_rsci_m_din_mxwt),
      .vec_rsci_m_dout_core(vec_rsci_m_dout_core),
      .vec_rsci_biwt(vec_rsci_biwt),
      .vec_rsci_bdwt(vec_rsci_bdwt),
      .vec_rsci_bcwt(vec_rsci_bcwt),
      .vec_rsci_biwt_1(vec_rsci_biwt_1),
      .vec_rsci_bdwt_2(vec_rsci_bdwt_2),
      .vec_rsci_bcwt_1(vec_rsci_bcwt_1),
      .vec_rsci_m_waddr(vec_rsci_m_waddr),
      .vec_rsci_m_waddr_core_sct(vec_rsci_m_we_core_sct),
      .vec_rsci_m_raddr(vec_rsci_m_raddr),
      .vec_rsci_m_raddr_core_sct(vec_rsci_m_re_core_sct),
      .vec_rsci_m_din(vec_rsci_m_din),
      .vec_rsci_m_dout(vec_rsci_m_dout)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_run_rsci (
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
  ccs_sync_in_wait_v1 #(.rscid(32'sd12)) run_rsci (
      .vld(run_rsc_vld),
      .rdy(run_rsc_rdy),
      .ivld(run_rsci_ivld),
      .irdy(run_rsci_biwt)
    );
  inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .run_rsci_oswt(run_rsci_oswt),
      .core_wten(core_wten),
      .run_rsci_biwt(run_rsci_biwt),
      .run_rsci_bdwt(run_rsci_bdwt)
    );
  inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .run_rsci_ivld_mxwt(run_rsci_ivld_mxwt),
      .run_rsci_ivld(run_rsci_ivld),
      .run_rsci_biwt(run_rsci_biwt),
      .run_rsci_bdwt(run_rsci_bdwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core (
  clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_m_wstate, vec_rsc_m_wCaughtUp, vec_rsc_RREADY,
      vec_rsc_RVALID, vec_rsc_RUSER, vec_rsc_RLAST, vec_rsc_RRESP, vec_rsc_RDATA,
      vec_rsc_RID, vec_rsc_ARREADY, vec_rsc_ARVALID, vec_rsc_ARUSER, vec_rsc_ARREGION,
      vec_rsc_ARQOS, vec_rsc_ARPROT, vec_rsc_ARCACHE, vec_rsc_ARLOCK, vec_rsc_ARBURST,
      vec_rsc_ARSIZE, vec_rsc_ARLEN, vec_rsc_ARADDR, vec_rsc_ARID, vec_rsc_BREADY,
      vec_rsc_BVALID, vec_rsc_BUSER, vec_rsc_BRESP, vec_rsc_BID, vec_rsc_WREADY,
      vec_rsc_WVALID, vec_rsc_WUSER, vec_rsc_WLAST, vec_rsc_WSTRB, vec_rsc_WDATA,
      vec_rsc_AWREADY, vec_rsc_AWVALID, vec_rsc_AWUSER, vec_rsc_AWREGION, vec_rsc_AWQOS,
      vec_rsc_AWPROT, vec_rsc_AWCACHE, vec_rsc_AWLOCK, vec_rsc_AWBURST, vec_rsc_AWSIZE,
      vec_rsc_AWLEN, vec_rsc_AWADDR, vec_rsc_AWID, vec_rsc_triosy_lz, p_rsc_dat,
      p_rsc_triosy_lz, r_rsc_triosy_lz, twiddle_rsc_triosy_lz, twiddle_h_rsc_triosy_lz,
      complete_rsc_rdy, complete_rsc_vld, twiddle_rsci_qb_d, twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsci_qb_d, twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d, twiddle_rsci_adrb_d_pff
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [2:0] vec_rsc_m_wstate;
  output vec_rsc_m_wCaughtUp;
  output vec_rsc_RREADY;
  input vec_rsc_RVALID;
  input vec_rsc_RUSER;
  input vec_rsc_RLAST;
  input [1:0] vec_rsc_RRESP;
  input [31:0] vec_rsc_RDATA;
  input vec_rsc_RID;
  input vec_rsc_ARREADY;
  output vec_rsc_ARVALID;
  output vec_rsc_ARUSER;
  output [3:0] vec_rsc_ARREGION;
  output [3:0] vec_rsc_ARQOS;
  output [2:0] vec_rsc_ARPROT;
  output [3:0] vec_rsc_ARCACHE;
  output vec_rsc_ARLOCK;
  output [1:0] vec_rsc_ARBURST;
  output [2:0] vec_rsc_ARSIZE;
  output [7:0] vec_rsc_ARLEN;
  output [31:0] vec_rsc_ARADDR;
  output vec_rsc_ARID;
  output vec_rsc_BREADY;
  input vec_rsc_BVALID;
  input vec_rsc_BUSER;
  input [1:0] vec_rsc_BRESP;
  input vec_rsc_BID;
  input vec_rsc_WREADY;
  output vec_rsc_WVALID;
  output vec_rsc_WUSER;
  output vec_rsc_WLAST;
  output [3:0] vec_rsc_WSTRB;
  output [31:0] vec_rsc_WDATA;
  input vec_rsc_AWREADY;
  output vec_rsc_AWVALID;
  output vec_rsc_AWUSER;
  output [3:0] vec_rsc_AWREGION;
  output [3:0] vec_rsc_AWQOS;
  output [2:0] vec_rsc_AWPROT;
  output [3:0] vec_rsc_AWCACHE;
  output vec_rsc_AWLOCK;
  output [1:0] vec_rsc_AWBURST;
  output [2:0] vec_rsc_AWSIZE;
  output [7:0] vec_rsc_AWLEN;
  output [31:0] vec_rsc_AWADDR;
  output vec_rsc_AWID;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;
  input [31:0] twiddle_rsci_qb_d;
  output twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  input [31:0] twiddle_h_rsci_qb_d;
  output twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  output [9:0] twiddle_rsci_adrb_d_pff;
  wire [19:0] nl_twiddle_rsci_adrb_d_pff;


  // Interconnect Declarations
  wire core_wen;
  wire core_wten;
  wire run_rsci_ivld_mxwt;
  wire vec_rsci_wen_comp;
  wire vec_rsci_wen_comp_1;
  reg [9:0] vec_rsci_m_waddr_core;
  reg [9:0] vec_rsci_m_raddr_core;
  wire [31:0] vec_rsci_m_din_mxwt;
  reg [31:0] vec_rsci_m_dout_core;
  wire [31:0] p_rsci_idat;
  wire [31:0] twiddle_rsci_qb_d_mxwt;
  wire [31:0] twiddle_h_rsci_qb_d_mxwt;
  wire complete_rsci_wen_comp;
  wire [31:0] mult_cmp_return_rsc_z;
  wire mult_cmp_ccs_ccore_en;
  wire [31:0] modulo_sub_cmp_return_rsc_z;
  wire modulo_sub_cmp_ccs_ccore_en;
  wire [31:0] modulo_add_cmp_return_rsc_z;
  wire [15:0] fsm_output;
  wire or_dcpl_4;
  wire or_dcpl_6;
  reg [9:0] VEC_LOOP_acc_1_cse_sva;
  reg [10:0] STAGE_LOOP_lshift_psp_sva;
  reg [10:0] VEC_LOOP_j_10_0_sva_1;
  reg run_ac_sync_tmp_dobj_sva;
  reg reg_run_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_1_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_vec_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_1_cse;
  wire VEC_LOOP_j_and_cse;
  wire twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg;
  wire twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg;
  wire or_25_rmff;
  reg [31:0] COMP_LOOP_twiddle_f_sva;
  reg [31:0] COMP_LOOP_twiddle_help_sva;
  reg [31:0] factor2_sva;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] COMP_LOOP_k_10_0_sva_9_0;
  reg [31:0] p_sva;
  wire [10:0] z_out;
  wire [10:0] z_out_1;
  wire [10:0] z_out_2;
  wire [11:0] nl_z_out_2;
  reg [9:0] VEC_LOOP_acc_10_cse_sva;
  wire [9:0] VEC_LOOP_acc_10_cse_sva_mx0w0;
  wire [11:0] nl_VEC_LOOP_acc_10_cse_sva_mx0w0;
  wire COMP_LOOP_twiddle_help_and_cse;
  wire STAGE_LOOP_acc_itm_4_1;

  wire[0:0] COMP_LOOP_k_not_1_nl;
  wire[9:0] COMP_LOOP_k_mux_nl;
  wire[9:0] VEC_LOOP_acc_1_nl;
  wire[10:0] nl_VEC_LOOP_acc_1_nl;
  wire[0:0] VEC_LOOP_not_1_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[11:0] acc_nl;
  wire[12:0] nl_acc_nl;
  wire[10:0] VEC_LOOP_mux_15_nl;
  wire[0:0] VEC_LOOP_or_2_nl;
  wire[10:0] VEC_LOOP_mux_16_nl;
  wire[9:0] STAGE_LOOP_mux_4_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_mult_cmp_y_rsc_dat;
  assign nl_mult_cmp_y_rsc_dat = COMP_LOOP_twiddle_f_sva;
  wire [31:0] nl_mult_cmp_y_rsc_dat_1;
  assign nl_mult_cmp_y_rsc_dat_1 = COMP_LOOP_twiddle_help_sva;
  wire [31:0] nl_mult_cmp_p_rsc_dat;
  assign nl_mult_cmp_p_rsc_dat = p_sva;
  wire [0:0] nl_mult_cmp_ccs_ccore_start_rsc_dat;
  assign nl_mult_cmp_ccs_ccore_start_rsc_dat = fsm_output[7];
  wire [31:0] nl_modulo_sub_cmp_base_rsc_dat;
  assign nl_modulo_sub_cmp_base_rsc_dat = vec_rsci_m_din_mxwt - factor2_sva;
  wire [31:0] nl_modulo_sub_cmp_m_rsc_dat;
  assign nl_modulo_sub_cmp_m_rsc_dat = p_sva;
  wire [0:0] nl_modulo_sub_cmp_ccs_ccore_start_rsc_dat;
  assign nl_modulo_sub_cmp_ccs_ccore_start_rsc_dat = fsm_output[6];
  wire [31:0] nl_modulo_add_cmp_base_rsc_dat;
  assign nl_modulo_add_cmp_base_rsc_dat = vec_rsci_m_din_mxwt + factor2_sva;
  wire [31:0] nl_modulo_add_cmp_m_rsc_dat;
  assign nl_modulo_add_cmp_m_rsc_dat = p_sva;
  wire [0:0] nl_modulo_add_cmp_ccs_ccore_start_rsc_dat;
  assign nl_modulo_add_cmp_ccs_ccore_start_rsc_dat = fsm_output[6];
  wire[3:0] COMP_LOOP_twiddle_f_acc_nl;
  wire[4:0] nl_COMP_LOOP_twiddle_f_acc_nl;
  wire [3:0] nl_COMP_LOOP_twiddle_f_lshift_rg_s;
  assign nl_COMP_LOOP_twiddle_f_acc_nl = (~ STAGE_LOOP_i_3_0_sva) + 4'b1011;
  assign COMP_LOOP_twiddle_f_acc_nl = nl_COMP_LOOP_twiddle_f_acc_nl[3:0];
  assign nl_COMP_LOOP_twiddle_f_lshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, COMP_LOOP_twiddle_f_acc_nl,
      fsm_output[2]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_oswt_pff
      = fsm_output[2];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_oswt_pff
      = fsm_output[2];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0 = ~ run_ac_sync_tmp_dobj_sva;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_VEC_LOOP_C_7_tr0 = VEC_LOOP_j_10_0_sva_1[10];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0 = ~ (z_out_1[10]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = ~ STAGE_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd14),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mult  mult_cmp (
      .x_rsc_dat(modulo_sub_cmp_return_rsc_z),
      .y_rsc_dat(nl_mult_cmp_y_rsc_dat[31:0]),
      .y_rsc_dat_1(nl_mult_cmp_y_rsc_dat_1[31:0]),
      .p_rsc_dat(nl_mult_cmp_p_rsc_dat[31:0]),
      .return_rsc_z(mult_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_mult_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(mult_cmp_ccs_ccore_en)
    );
  modulo_sub  modulo_sub_cmp (
      .base_rsc_dat(nl_modulo_sub_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_modulo_sub_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(modulo_sub_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_modulo_sub_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(modulo_sub_cmp_ccs_ccore_en)
    );
  modulo_add  modulo_add_cmp (
      .base_rsc_dat(nl_modulo_add_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_modulo_add_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(modulo_add_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_modulo_add_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(modulo_sub_cmp_ccs_ccore_en)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd11)) COMP_LOOP_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out)
    );
  inPlaceNTT_DIF_precomp_core_run_rsci inPlaceNTT_DIF_precomp_core_run_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .run_rsc_rdy(run_rsc_rdy),
      .run_rsc_vld(run_rsc_vld),
      .core_wen(core_wen),
      .run_rsci_oswt(reg_run_rsci_oswt_cse),
      .core_wten(core_wten),
      .run_rsci_ivld_mxwt(run_rsci_ivld_mxwt)
    );
  inPlaceNTT_DIF_precomp_core_wait_dp inPlaceNTT_DIF_precomp_core_wait_dp_inst (
      .ensig_cgo_iro(or_25_rmff),
      .ensig_cgo_iro_1(or_dcpl_6),
      .core_wen(core_wen),
      .ensig_cgo(reg_ensig_cgo_cse),
      .mult_cmp_ccs_ccore_en(mult_cmp_ccs_ccore_en),
      .ensig_cgo_1(reg_ensig_cgo_1_cse),
      .modulo_sub_cmp_ccs_ccore_en(modulo_sub_cmp_ccs_ccore_en)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsci inPlaceNTT_DIF_precomp_core_vec_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_m_wstate(vec_rsc_m_wstate),
      .vec_rsc_m_wCaughtUp(vec_rsc_m_wCaughtUp),
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
      .vec_rsci_m_waddr_core(vec_rsci_m_waddr_core),
      .vec_rsci_m_raddr_core(vec_rsci_m_raddr_core),
      .vec_rsci_m_din_mxwt(vec_rsci_m_din_mxwt),
      .vec_rsci_m_dout_core(vec_rsci_m_dout_core)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_qb_d(twiddle_rsci_qb_d),
      .twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_rsci_qb_d_mxwt(twiddle_rsci_qb_d_mxwt),
      .twiddle_rsci_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1 inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_qb_d(twiddle_h_rsci_qb_d),
      .twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_h_rsci_qb_d_mxwt(twiddle_h_rsci_qb_d_mxwt),
      .twiddle_h_rsci_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_complete_rsci inPlaceNTT_DIF_precomp_core_complete_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .complete_rsc_rdy(complete_rsc_rdy),
      .complete_rsc_vld(complete_rsc_vld),
      .core_wen(core_wen),
      .complete_rsci_oswt(reg_complete_rsci_oswt_cse),
      .complete_rsci_wen_comp(complete_rsci_wen_comp)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_inst
      (
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_inst
      (
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_inst
      (
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_inst
      (
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_inst
      (
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_staller inPlaceNTT_DIF_precomp_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsci_wen_comp(vec_rsci_wen_comp),
      .vec_rsci_wen_comp_1(vec_rsci_wen_comp_1),
      .complete_rsci_wen_comp(complete_rsci_wen_comp)
    );
  inPlaceNTT_DIF_precomp_core_core_fsm inPlaceNTT_DIF_precomp_core_core_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output),
      .main_C_0_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0[0:0]),
      .VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_2_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_25_rmff = or_dcpl_4 | (fsm_output[7]);
  assign COMP_LOOP_twiddle_help_and_cse = core_wen & (~(or_dcpl_4 | (fsm_output[5])
      | (fsm_output[10]) | (fsm_output[11]) | (fsm_output[4]) | or_dcpl_6));
  assign VEC_LOOP_j_and_cse = core_wen & (fsm_output[4]);
  assign nl_VEC_LOOP_acc_10_cse_sva_mx0w0 = VEC_LOOP_acc_1_cse_sva + COMP_LOOP_k_10_0_sva_9_0
      + (STAGE_LOOP_lshift_psp_sva[10:1]);
  assign VEC_LOOP_acc_10_cse_sva_mx0w0 = nl_VEC_LOOP_acc_10_cse_sva_mx0w0[9:0];
  assign or_dcpl_4 = (fsm_output[9:8]!=2'b00);
  assign or_dcpl_6 = (fsm_output[7:6]!=2'b00);
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ (z_out_2[3:0]))}) + 5'b00001;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign nl_twiddle_rsci_adrb_d_pff = (z_out[9:0]) * COMP_LOOP_k_10_0_sva_9_0;
  assign twiddle_rsci_adrb_d_pff = nl_twiddle_rsci_adrb_d_pff[9:0];
  assign twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d = twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d_reg;
  always @(posedge clk) begin
    if ( core_wen ) begin
      vec_rsci_m_waddr_core <= MUX_v_10_2_2(VEC_LOOP_acc_1_cse_sva, VEC_LOOP_acc_10_cse_sva,
          fsm_output[10]);
      vec_rsci_m_raddr_core <= MUX_v_10_2_2(VEC_LOOP_acc_10_cse_sva_mx0w0, VEC_LOOP_acc_1_cse_sva,
          fsm_output[5]);
      vec_rsci_m_dout_core <= MUX_v_32_2_2(modulo_add_cmp_return_rsc_z, mult_cmp_return_rsc_z,
          fsm_output[10]);
      factor2_sva <= vec_rsci_m_din_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_run_rsci_oswt_cse <= 1'b0;
      reg_vec_rsci_oswt_cse <= 1'b0;
      reg_vec_rsci_oswt_1_cse <= 1'b0;
      reg_twiddle_rsci_oswt_cse <= 1'b0;
      reg_complete_rsci_oswt_cse <= 1'b0;
      reg_vec_rsc_triosy_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_ensig_cgo_1_cse <= 1'b0;
    end
    else if ( core_wen ) begin
      reg_run_rsci_oswt_cse <= fsm_output[0];
      reg_vec_rsci_oswt_cse <= (fsm_output[5:4]!=2'b00);
      reg_vec_rsci_oswt_1_cse <= (fsm_output[10]) | (fsm_output[7]);
      reg_twiddle_rsci_oswt_cse <= fsm_output[2];
      reg_complete_rsci_oswt_cse <= (~ STAGE_LOOP_acc_itm_4_1) & (fsm_output[13]);
      reg_vec_rsc_triosy_obj_iswt0_cse <= fsm_output[14];
      reg_ensig_cgo_cse <= or_25_rmff;
      reg_ensig_cgo_1_cse <= or_dcpl_6;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[0]) | (fsm_output[13])) ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1010, (z_out_2[3:0]), fsm_output[13]);
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[15]) | (fsm_output[14]) | (fsm_output[0])) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      run_ac_sync_tmp_dobj_sva <= 1'b0;
    end
    else if ( core_wen & (fsm_output[14]) ) begin
      run_ac_sync_tmp_dobj_sva <= run_rsci_ivld_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[1]) | (fsm_output[15]) | (fsm_output[14]) | (fsm_output[0])
        | (fsm_output[13])) ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[1]) | (fsm_output[12])) ) begin
      COMP_LOOP_k_10_0_sva_9_0 <= MUX_v_10_2_2(10'b0000000000, (z_out_2[9:0]), COMP_LOOP_k_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_twiddle_help_and_cse ) begin
      COMP_LOOP_twiddle_help_sva <= twiddle_h_rsci_qb_d_mxwt;
      COMP_LOOP_twiddle_f_sva <= twiddle_rsci_qb_d_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( core_wen & ((fsm_output[11]) | (fsm_output[3]) | (fsm_output[4])) ) begin
      VEC_LOOP_acc_1_cse_sva <= MUX_v_10_2_2(10'b0000000000, COMP_LOOP_k_mux_nl,
          VEC_LOOP_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( VEC_LOOP_j_and_cse ) begin
      VEC_LOOP_acc_10_cse_sva <= VEC_LOOP_acc_10_cse_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_0_sva_1 <= 11'b00000000000;
    end
    else if ( VEC_LOOP_j_and_cse ) begin
      VEC_LOOP_j_10_0_sva_1 <= z_out_1;
    end
  end
  assign COMP_LOOP_k_not_1_nl = ~ (fsm_output[1]);
  assign nl_VEC_LOOP_acc_1_nl = VEC_LOOP_acc_1_cse_sva + COMP_LOOP_k_10_0_sva_9_0;
  assign VEC_LOOP_acc_1_nl = nl_VEC_LOOP_acc_1_nl[9:0];
  assign COMP_LOOP_k_mux_nl = MUX_v_10_2_2(VEC_LOOP_acc_1_nl, (VEC_LOOP_j_10_0_sva_1[9:0]),
      fsm_output[11]);
  assign VEC_LOOP_not_1_nl = ~ (fsm_output[3]);
  assign VEC_LOOP_mux_15_nl = MUX_v_11_2_2(({1'b0 , VEC_LOOP_acc_1_cse_sva}), z_out_2,
      fsm_output[12]);
  assign VEC_LOOP_or_2_nl = (~ (fsm_output[4])) | (fsm_output[12]);
  assign VEC_LOOP_mux_16_nl = MUX_v_11_2_2(STAGE_LOOP_lshift_psp_sva, ({1'b1 , (~
      (STAGE_LOOP_lshift_psp_sva[10:1]))}), fsm_output[12]);
  assign nl_acc_nl = ({VEC_LOOP_mux_15_nl , VEC_LOOP_or_2_nl}) + ({VEC_LOOP_mux_16_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[11:0];
  assign z_out_1 = readslicef_12_11_1(acc_nl);
  assign STAGE_LOOP_mux_4_nl = MUX_v_10_2_2(({6'b000000 , STAGE_LOOP_i_3_0_sva}),
      COMP_LOOP_k_10_0_sva_9_0, fsm_output[12]);
  assign nl_z_out_2 = conv_u2u_10_11(STAGE_LOOP_mux_4_nl) + conv_s2u_2_11({(~ (fsm_output[12]))
      , 1'b1});
  assign z_out_2 = nl_z_out_2[10:0];

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


  function automatic [10:0] MUX_v_11_2_2;
    input [10:0] input_0;
    input [10:0] input_1;
    input [0:0] sel;
    reg [10:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_11_2_2 = result;
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


  function automatic [10:0] readslicef_12_11_1;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_12_11_1 = tmp[10:0];
  end
  endfunction


  function automatic [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
  end
  endfunction


  function automatic [10:0] conv_s2u_2_11 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_11 = {{9{vector[1]}}, vector};
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
//  Design Unit:    inPlaceNTT_DIF_precomp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp (
  clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_m_wstate, vec_rsc_m_wCaughtUp, vec_rsc_RREADY,
      vec_rsc_RVALID, vec_rsc_RUSER, vec_rsc_RLAST, vec_rsc_RRESP, vec_rsc_RDATA,
      vec_rsc_RID, vec_rsc_ARREADY, vec_rsc_ARVALID, vec_rsc_ARUSER, vec_rsc_ARREGION,
      vec_rsc_ARQOS, vec_rsc_ARPROT, vec_rsc_ARCACHE, vec_rsc_ARLOCK, vec_rsc_ARBURST,
      vec_rsc_ARSIZE, vec_rsc_ARLEN, vec_rsc_ARADDR, vec_rsc_ARID, vec_rsc_BREADY,
      vec_rsc_BVALID, vec_rsc_BUSER, vec_rsc_BRESP, vec_rsc_BID, vec_rsc_WREADY,
      vec_rsc_WVALID, vec_rsc_WUSER, vec_rsc_WLAST, vec_rsc_WSTRB, vec_rsc_WDATA,
      vec_rsc_AWREADY, vec_rsc_AWVALID, vec_rsc_AWUSER, vec_rsc_AWREGION, vec_rsc_AWQOS,
      vec_rsc_AWPROT, vec_rsc_AWCACHE, vec_rsc_AWLOCK, vec_rsc_AWBURST, vec_rsc_AWSIZE,
      vec_rsc_AWLEN, vec_rsc_AWADDR, vec_rsc_AWID, vec_rsc_triosy_lz, p_rsc_dat,
      p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_adrb, twiddle_rsc_qb,
      twiddle_rsc_triosy_lz, twiddle_h_rsc_adrb, twiddle_h_rsc_qb, twiddle_h_rsc_triosy_lz,
      complete_rsc_rdy, complete_rsc_vld
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [2:0] vec_rsc_m_wstate;
  output vec_rsc_m_wCaughtUp;
  output vec_rsc_RREADY;
  input vec_rsc_RVALID;
  input vec_rsc_RUSER;
  input vec_rsc_RLAST;
  input [1:0] vec_rsc_RRESP;
  input [31:0] vec_rsc_RDATA;
  input vec_rsc_RID;
  input vec_rsc_ARREADY;
  output vec_rsc_ARVALID;
  output vec_rsc_ARUSER;
  output [3:0] vec_rsc_ARREGION;
  output [3:0] vec_rsc_ARQOS;
  output [2:0] vec_rsc_ARPROT;
  output [3:0] vec_rsc_ARCACHE;
  output vec_rsc_ARLOCK;
  output [1:0] vec_rsc_ARBURST;
  output [2:0] vec_rsc_ARSIZE;
  output [7:0] vec_rsc_ARLEN;
  output [31:0] vec_rsc_ARADDR;
  output vec_rsc_ARID;
  output vec_rsc_BREADY;
  input vec_rsc_BVALID;
  input vec_rsc_BUSER;
  input [1:0] vec_rsc_BRESP;
  input vec_rsc_BID;
  input vec_rsc_WREADY;
  output vec_rsc_WVALID;
  output vec_rsc_WUSER;
  output vec_rsc_WLAST;
  output [3:0] vec_rsc_WSTRB;
  output [31:0] vec_rsc_WDATA;
  input vec_rsc_AWREADY;
  output vec_rsc_AWVALID;
  output vec_rsc_AWUSER;
  output [3:0] vec_rsc_AWREGION;
  output [3:0] vec_rsc_AWQOS;
  output [2:0] vec_rsc_AWPROT;
  output [3:0] vec_rsc_AWCACHE;
  output vec_rsc_AWLOCK;
  output [1:0] vec_rsc_AWBURST;
  output [2:0] vec_rsc_AWSIZE;
  output [7:0] vec_rsc_AWLEN;
  output [31:0] vec_rsc_AWADDR;
  output vec_rsc_AWID;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [9:0] twiddle_rsc_adrb;
  input [31:0] twiddle_rsc_qb;
  output twiddle_rsc_triosy_lz;
  output [9:0] twiddle_h_rsc_adrb;
  input [31:0] twiddle_h_rsc_qb;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;


  // Interconnect Declarations
  wire [31:0] twiddle_rsci_qb_d;
  wire twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  wire [31:0] twiddle_h_rsci_qb_d;
  wire twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d;
  wire [9:0] twiddle_rsci_adrb_d_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_16_10_32_1024_1024_32_1_gen
      twiddle_rsci (
      .qb(twiddle_rsc_qb),
      .adrb(twiddle_rsc_adrb),
      .adrb_d(twiddle_rsci_adrb_d_iff),
      .qb_d(twiddle_rsci_qb_d),
      .readB_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_17_10_32_1024_1024_32_1_gen
      twiddle_h_rsci (
      .qb(twiddle_h_rsc_qb),
      .adrb(twiddle_h_rsc_adrb),
      .adrb_d(twiddle_rsci_adrb_d_iff),
      .qb_d(twiddle_h_rsci_qb_d),
      .readB_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_core inPlaceNTT_DIF_precomp_core_inst (
      .clk(clk),
      .rst(rst),
      .run_rsc_rdy(run_rsc_rdy),
      .run_rsc_vld(run_rsc_vld),
      .vec_rsc_m_wstate(vec_rsc_m_wstate),
      .vec_rsc_m_wCaughtUp(vec_rsc_m_wCaughtUp),
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
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .complete_rsc_rdy(complete_rsc_rdy),
      .complete_rsc_vld(complete_rsc_vld),
      .twiddle_rsci_qb_d(twiddle_rsci_qb_d),
      .twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsci_qb_d(twiddle_h_rsci_qb_d),
      .twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readB_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsci_adrb_d_pff(twiddle_rsci_adrb_d_iff)
    );
endmodule



