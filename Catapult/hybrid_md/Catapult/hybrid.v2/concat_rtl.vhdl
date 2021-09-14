
--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/amba_comps.vhd 
--//////////////////////////////////////////////////////////////////////////////
-- Catapult Synthesis - Custom Interfaces
--
-- Copyright (c) 2016 Mentor Graphics Corp.
--       All Rights Reserved
-- 
-- This document contains information that is proprietary to Mentor Graphics
-- Corp. The original recipient of this document may duplicate this  
-- document in whole or in part for internal business purposes only, provided  
-- that this entire notice appears in all copies. In duplicating any part of  
-- this document, the recipient agrees to make every reasonable effort to  
-- prevent the unauthorized use and distribution of the proprietary information.
-- 
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in prepartion for creating
-- their own custom interfaces. This design does not present a complete
-- implementation of the named protocol or standard.
--
-- NO WARRANTY.
-- MENTOR GRAPHICS CORP. EXPRESSLY DISCLAIMS ALL WARRANTY
-- FOR THE SOFTWARE. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE
-- LAW, THE SOFTWARE AND ANY RELATED DOCUMENTATION IS PROVIDED "AS IS"
-- AND WITH ALL FAULTS AND WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
-- PURPOSE, OR NONINFRINGEMENT. THE ENTIRE RISK ARISING OUT OF USE OR
-- DISTRIBUTION OF THE SOFTWARE REMAINS WITH YOU.
-- 
--//////////////////////////////////////////////////////////////////////////////

-- --------------------------------------------------------------------------
-- LIBRARY: amba
--
-- CONTENTS:
--    axi4stream_w_wire, axi4stream_r_wire, axi4svideo_w_wire, axi4svideo_r_wire
--      Catapult AXI-4 Stream bus definitions
--    ccs_axi4stream_in
--      AXI4-Streaming input interface
--    ccs_axi4stream_out
--      AXI4-Streaming output interface
--    ccs_axi4stream_pipe
--      AXI4-Streaming FIFO interconnect component
--    ccs_axi4svideo_in
--      AXI4-Streaming video input interface
--    ccs_axi4svideo_out
--      AXI4-Streaming video output interface
--    ccs_axi4svideo_pipe
--      AXI4-Streaming video FIFO interconnect component
--
--    axi4_busdef
--      Catapult AXI-4 bus definition
--
--    ccs_axi4_slave_mem
--      Catapult AXI-4 slave memory
---
--    ccs_axi4_master
--      Catapult AXI4 master interface for read/write data
--
--    apb_busdef
--      Catapult APB bus definition
--    apb_slave_mem
--      APB Slave Memory interface
--
-- CHANGE LOG:
--
--  10/01/16 - dgb - Initial implementation
--
-- --------------------------------------------------------------------------

-- --------------------------------------------------------------------------
-- PACKAGE:     amba_comps
--
-- DESCRIPTION:
--   Contains component declarations for all design units in this file.
--
-- CHANGE LOG:
--
--  10/01/16 - dgb - Initial implementation
--
-- --------------------------------------------------------------------------

LIBRARY ieee;

   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_arith.all;
   USE ieee.std_logic_unsigned.all;

PACKAGE amba_comps IS

  -- ==============================================================
  -- AXI-4 Stream Components
  -- ------------------------------ TSTRB/TKEEP controls --------------------
  --    TKEEP   TSTRB   Data Type         Description
  --    high    high    Data byte         Valid data byte (supported in these models)
  --    high    low     Position byte     Byte is position not data/null (not supported)
  --    low     low     Null byte         Byte is null (not supported)
  --    low     high    Reserved          Do not use (not supported)

  COMPONENT axi4stream_w_wire -- slave interface pin direction
    GENERIC(
      width            : INTEGER RANGE 3 TO 1026 := 33;           -- Catapult read/write operator width (includes data,last and user bits)
      AXI4_DATA_WIDTH  : INTEGER RANGE 8 TO 1024 := 16;           -- AXI4 Bus width
      AXI4_USER_WIDTH  : INTEGER RANGE 1 TO 8 := 1                -- AXI4 User data width
    );
    PORT(
      -- AXI-4 Stream interface                                          -- Src->Dst  Description
      TVALID    : IN   std_logic;                                        -- M->S      Indicates master is driving a valid transfer
      TREADY    : OUT  std_logic;                                        -- S->M      Indicates slave can accept a transfer
      TDATA     : IN   std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);     -- M->S      Primary payload (width-1 must be multiple of 8)
      TSTRB     : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 indicates data byte, 0 indicates position byte
      TKEEP     : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 valid byte, 0 indicates null byte
      TLAST     : IN   std_logic;                                        -- M->S      Indicates boundary of a packet
      TUSER     : IN   std_logic_vector(AXI4_USER_WIDTH-1 downto 0)      -- M->S      Optional user-defined sideband data
    );
  END COMPONENT;

  COMPONENT axi4stream_r_wire -- master interface pin direction
    GENERIC(
      width            : INTEGER RANGE 3 TO 1026 := 33;           -- Catapult read/write operator width (includes data,last and user bits)
      AXI4_DATA_WIDTH  : INTEGER RANGE 8 TO 1024 := 16;           -- AXI4 Bus width
      AXI4_USER_WIDTH  : INTEGER RANGE 1 TO 8 := 1                -- AXI4 User data width
    );
    PORT(
      -- AXI-4 Stream interface                                          -- Src->Dst  Description
      TVALID    : OUT  std_logic;                                        -- M->S      Indicates master is driving a valid transfer
      TREADY    : IN   std_logic;                                        -- S->M      Indicates slave can accept a transfer
      TDATA     : OUT  std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);     -- M->S      Primary payload (width-1 must be multiple of 8)
      TSTRB     : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 indicates data byte, 0 indicates position byte
      TKEEP     : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 valid byte, 0 indicates null byte
      TLAST     : OUT  std_logic;                                        -- M->S      Indicates boundary of a packet
      TUSER     : OUT  std_logic_vector(AXI4_USER_WIDTH-1 downto 0)      -- M->S      Optional user-defined sideband data
    );
  END COMPONENT;

  COMPONENT axi4svideo_w_wire -- slave interface pin direction
    GENERIC(
      width            : INTEGER RANGE 3 TO 1024 := 33;           -- Catapult read/write operator width
      AXI4_DATA_WIDTH  : INTEGER                 := 16            -- AXI4 Bus width
    );
    PORT(
      -- AXI-4 Stream interface                                          -- Src->Dst  Description
      TVALID    : IN   std_logic;                                        -- M->S      Indicates master is driving a valid transfer
      TREADY    : OUT  std_logic;                                        -- S->M      Indicates slave can accept a transfer
      TDATA     : IN   std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);     -- M->S      Primary payload (width-1 must be multiple of 8)
      TSTRB     : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 indicates data byte, 0 indicates position byte
      TKEEP     : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 valid byte, 0 indicates null byte
      TUSER     : IN   std_logic;                                        -- M->S      Start of Frame
      TLAST     : IN   std_logic                                         -- M->S      End of Line
    );
  END COMPONENT;

  COMPONENT axi4svideo_r_wire -- master interface pin direction
    GENERIC(
      width            : INTEGER RANGE 3 TO 1024 := 33;           -- Catapult read/write operator width
      AXI4_DATA_WIDTH  : INTEGER                 := 16            -- AXI4 Bus width
    );
    PORT(
      -- AXI-4 Stream interface                                          -- Src->Dst  Description
      TVALID    : OUT  std_logic;                                        -- M->S      Indicates master is driving a valid transfer
      TREADY    : IN   std_logic;                                        -- S->M      Indicates slave can accept a transfer
      TDATA     : OUT  std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);     -- M->S      Primary payload (width-1 must be multiple of 8)
      TSTRB     : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 indicates data byte, 0 indicates position byte
      TKEEP     : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 valid byte, 0 indicates null byte
      TUSER     : OUT  std_logic;                                        -- M->S      Start of Frame
      TLAST     : OUT  std_logic                                         -- M->S      End of Line
    );
  END COMPONENT;

  COMPONENT ccs_axi4stream_in
    GENERIC(
      width            : INTEGER RANGE 3 TO 1026 := 33;           -- Catapult read/write operator width (includes data,last and user bits)
      AXI4_DATA_WIDTH  : INTEGER RANGE 8 TO 1024 := 32;           -- AXI4 Bus width
      AXI4_USER_WIDTH  : INTEGER RANGE 1 TO 8 := 1                -- AXI4 User data width
    );
    PORT(
      -- AXI-4 Master Clock/Reset
      ACLK      : IN   std_logic;                                        -- clk src   Rising edge clock
      ARESETn   : IN   std_logic;                                        -- rst src   Active LOW synchronous reset
      -- AXI-4 Stream interface                                          -- Src->Dst  Description
      TVALID    : IN   std_logic;                                        -- M->S      Indicates master is driving a valid transfer
      TREADY    : OUT  std_logic;                                        -- S->M      Indicates slave can accept a transfer
      TDATA     : IN   std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);     -- M->S      Primary payload (width-1 must be multiple of 8)
      TSTRB     : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 indicates data byte, 0 indicates position byte
      TKEEP     : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 valid byte, 0 indicates null byte
      TLAST     : IN   std_logic;                                        -- M->S      Indicates boundary of a packet
      TUSER     : IN   std_logic_vector(AXI4_USER_WIDTH-1 downto 0);     -- M->S      Optional user-defined sideband data
      -- Catapult interface (equiv to mgc_in_wire_wait)
      d         : OUT  std_logic_vector(width-1 downto 0);               -- d  - msb TLAST TUSER(...) TDATA(...) lsb
      vd        : OUT  std_logic;                                        -- vd - TVALID
      ld        : IN   std_logic                                         -- ld - TREADY
    );
  END COMPONENT;

  COMPONENT ccs_axi4stream_out
    GENERIC(
      width            : INTEGER RANGE 3 TO 1026 := 33;           -- Catapult read/write operator width (includes data,last and user bits)
      AXI4_DATA_WIDTH  : INTEGER RANGE 8 TO 1024 := 32;           -- AXI4 Bus width
      AXI4_USER_WIDTH  : INTEGER RANGE 1 TO 8 := 1                -- AXI4 User data width
    );
    PORT(
      -- AXI-4 Master Clock/Reset
      ACLK      : IN   std_logic;                                        -- clk src   Rising edge clock
      ARESETn   : IN   std_logic;                                        -- rst src   Active LOW synchronous reset
      -- AXI-4 Stream interface                                          -- Src->Dst  Description
      TVALID    : OUT  std_logic;                                        -- M->S      Indicates master is driving a valid transfer
      TREADY    : IN   std_logic;                                        -- S->M      Indicates slave can accept a transfer
      TDATA     : OUT  std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);     -- M->S      Primary payload (width-1 must be multiple of 8)
      TSTRB     : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 indicates data byte, 0 indicates position byte
      TKEEP     : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 valid byte, 0 indicates null byte
      TLAST     : OUT  std_logic;                                        -- M->S      Indicates boundary of a packet
      TUSER     : OUT  std_logic_vector(AXI4_USER_WIDTH-1 downto 0);     -- M->S      Optional user-defined sideband data
      -- Catapult interface (equiv to mgc_out_stdreg_wait)
      d         : IN   std_logic_vector(width-1 downto 0);               -- d  - msb TLAST TUSER(...) TDATA(...) lsb
      vd        : OUT  std_logic;                                        -- vd - TREADY
      ld        : IN   std_logic                                         -- ld - TVALID
    );
  END COMPONENT;

  -- This implementation currently does not work - the 'width' parameter is not configured properly
  COMPONENT ccs_axi4stream_pipe
    GENERIC(
      rscid            : INTEGER := 1;                            -- Resource ID from Catapult
      width            : INTEGER RANGE 3 TO 1026 := 33;           -- Catapult read/write operator width (includes data,last and user bits)
      fifo_sz          : INTEGER RANGE 0 TO 128 := 0;            -- Fifo size
      AXI4_DATA_WIDTH  : INTEGER RANGE 8 TO 1024 := 32;           -- AXI4 Bus width
      AXI4_USER_WIDTH  : INTEGER RANGE 1 TO 8 := 1                -- AXI4 User data width
    );
    PORT(
      -- AXI-4 Master Clock/Reset
      ACLK      : IN   std_logic;                                          -- clk src   Rising edge clock
      ARESETn   : IN   std_logic;                                          -- rst src   Active LOW asynchronous reset
      -- AXI-4 Stream interface input                                      -- Src->Dst  Description
      sTVALID   : IN   std_logic;                                          -- M->S      Indicates master is driving a valid transfer
      sTREADY   : OUT  std_logic;                                          -- S->M      Indicates slave can accept a transfer
      sTDATA    : IN   std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);       -- M->S      Primary payload (width-1 must be multiple of 8)
      sTSTRB    : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0);   -- M->S      1 indicates data byte, 0 indicates position byte
      sTKEEP    : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0);   -- M->S      1 valid byte, 0 indicates null byte
      sTLAST    : IN   std_logic;                                          -- M->S      Indicates boundary of a packet
      sTUSER    : IN   std_logic_vector(AXI4_USER_WIDTH-1 downto 0);       -- M->S      Optional user-defined sideband data
      -- AXI-4 Stream interface output                                     -- Src->Dst  Description
      mTVALID   : OUT  std_logic;                                          -- M->S      Indicates master is driving a valid transfer
      mTREADY   : IN   std_logic;                                          -- S->M      Indicates slave can accept a transfer
      mTDATA    : OUT  std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);       -- M->S      Primary payload (width-1 must be multiple of 8)
      mTSTRB    : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0);   -- M->S      1 indicates data byte, 0 indicates position byte
      mTKEEP    : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0);   -- M->S      1 valid byte, 0 indicates null byte
      mTLAST    : OUT  std_logic;                                          -- M->S      Indicates boundary of a packet
      mTUSER    : OUT  std_logic_vector(AXI4_USER_WIDTH-1 downto 0)        -- M->S      Optional user-defined sideband data
    );
  END COMPONENT;

  COMPONENT ccs_axi4svideo_in
    GENERIC(
      width            : INTEGER RANGE 3 TO 1026 := 33;           -- Catapult read/write operator width (includes data,last and user bits)
      AXI4_DATA_WIDTH  : INTEGER RANGE 8 TO 1024 := 32            -- AXI4 Bus width
    );
    PORT(
      -- AXI-4 Master Clock/Reset
      ACLK      : IN   std_logic;                                        -- clk src   Rising edge clock
      ARESETn   : IN   std_logic;                                        -- rst src   Active LOW asynchronous reset
      -- AXI-4 Stream interface                                          -- Src->Dst  Description
      TVALID    : IN   std_logic;                                        -- M->S      Indicates master is driving a valid transfer
      TREADY    : OUT  std_logic;                                        -- S->M      Indicates slave can accept a transfer
      TDATA     : IN   std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);     -- M->S      Primary payload (width-1 must be multiple of 8)
      TSTRB     : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 indicates data byte, 0 indicates position byte
      TKEEP     : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 valid byte, 0 indicates null byte
      TLAST     : IN   std_logic;                                        -- M->S      End-of-line
      TUSER     : IN   std_logic;                                        -- M->S      Start-of-frame
      -- Catapult interface (equiv to mgc_in_wire_wait)
      d         : OUT  std_logic_vector(width-1 downto 0);               -- d  - msb TLAST TUSER TDATA(...) lsb
      vd        : OUT  std_logic;                                        -- vd - TVALID
      ld        : IN   std_logic                                         -- ld - TREADY
    );
  END COMPONENT;

  COMPONENT ccs_axi4svideo_out
    GENERIC(
      width            : INTEGER RANGE 3 TO 1026 := 33;           -- Catapult read/write operator width (includes data,last and user bits)
      AXI4_DATA_WIDTH  : INTEGER RANGE 8 TO 1024 := 32            -- AXI4 Bus width
    );
    PORT(
      -- AXI-4 Master Clock/Reset
      ACLK      : IN   std_logic;                                        -- clk src   Rising edge clock
      ARESETn   : IN   std_logic;                                        -- rst src   Active LOW asynchronous reset
      -- AXI-4 Stream interface                                          -- Src->Dst  Description
      TVALID    : OUT  std_logic;                                        -- M->S      Indicates master is driving a valid transfer
      TREADY    : IN   std_logic;                                        -- S->M      Indicates slave can accept a transfer
      TDATA     : OUT  std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);     -- M->S      Primary payload (width-1 must be multiple of 8)
      TSTRB     : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 indicates data byte, 0 indicates position byte
      TKEEP     : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0); -- M->S      1 valid byte, 0 indicates null byte
      TLAST     : OUT  std_logic;                                        -- M->S      End-of-line
      TUSER     : OUT  std_logic;                                        -- M->S      Start-of-frame
      -- Catapult interface (equiv to mgc_out_stdreg_wait)
      d         : IN   std_logic_vector(width-1 downto 0);               -- d  - msb TLAST TUSER TDATA(...) lsb
      vd        : OUT  std_logic;                                        -- vd - TREADY
      ld        : IN   std_logic                                         -- ld - TVALID
    );
  END COMPONENT;

  COMPONENT ccs_axi4svideo_pipe
    GENERIC(
      rscid            : INTEGER := 1;                                 -- Resource ID from Catapult
      width            : INTEGER RANGE 3 TO 1026 := 33;           -- Catapult read/write operator width (includes data,last and user bits)
      fifo_sz          : INTEGER RANGE 0 TO 128 := 0;            -- Fifo size
      AXI4_DATA_WIDTH  : INTEGER RANGE 8 TO 1024 := 32            -- AXI4 Bus width
    );
    PORT(
      -- AXI-4 Master Clock/Reset
      ACLK      : IN   std_logic;                                          -- clk src   Rising edge clock
      ARESETn   : IN   std_logic;                                          -- rst src   Active LOW asynchronous reset
      -- AXI-4 Stream interface input                                      -- Src->Dst  Description
      sTVALID   : IN   std_logic;                                          -- M->S      Indicates master is driving a valid transfer
      sTREADY   : OUT  std_logic;                                          -- S->M      Indicates slave can accept a transfer
      sTDATA    : IN   std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);       -- M->S      Primary payload (width-1 must be multiple of 8)
      sTSTRB    : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0);   -- M->S      1 indicates data byte, 0 indicates position byte
      sTKEEP    : IN   std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0);   -- M->S      1 valid byte, 0 indicates null byte
      sTLAST    : IN   std_logic;                                          -- M->S      End-of-line
      sTUSER    : IN   std_logic;                                          -- M->S      Start-of-frame
      -- AXI-4 Stream interface output                                     -- Src->Dst  Description
      mTVALID   : OUT  std_logic;                                          -- M->S      Indicates master is driving a valid transfer
      mTREADY   : IN   std_logic;                                          -- S->M      Indicates slave can accept a transfer
      mTDATA    : OUT  std_logic_vector(AXI4_DATA_WIDTH-1 downto 0);       -- M->S      Primary payload (width-1 must be multiple of 8)
      mTSTRB    : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0);   -- M->S      1 indicates data byte, 0 indicates position byte
      mTKEEP    : OUT  std_logic_vector((AXI4_DATA_WIDTH/8)-1 downto 0);   -- M->S      1 valid byte, 0 indicates null byte
      mTLAST    : OUT  std_logic;                                          -- M->S      End-of-line
      mTUSER    : OUT  std_logic                                           -- M->S      Start-of-frame
    );
  END COMPONENT;

  -- ==============================================================
  -- AXI-4 Bus Components

  -- Used to define the AXI-4 bus definition (direction of signals is from the slave's perspective)
    -- Pin directions are based on the usage of this busdef as a "master" driving an input slave.
    -- To use the bus in the reverse direction set the interface to "slave".
  COMPONENT axi4_busdef -- 
    GENERIC(   
      host_tidw      : INTEGER RANGE 1 TO 11 := 4;            -- Width of transaction ID fields
      host_userw     : INTEGER RANGE 1 TO 16 := 4;            -- Width of user-defined signals
      ADDR_WIDTH     : INTEGER RANGE 1 TO 64 := 32;           -- Host address width
      DATA_WIDTH     : INTEGER RANGE 8 TO 64 := 8             -- Host data width
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                 -- Rising edge clock
      ARESETn    : IN   std_logic;                                 -- Active LOW synchronous reset

      -- ============== AXI4 Write Address Channel Signals
      AWID       : OUT  std_logic_vector(host_tidw-1 downto 0);    -- Write address ID
      AWADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);      -- Write address
      AWLEN      : OUT  std_logic_vector(7 downto 0);              -- Write burst length    - must always be 0 in AXI4-Lite
      AWSIZE     : OUT  std_logic_vector(1 downto 0);              -- Write burst size      - must equal host_dw_bytes-2
      AWBURST    : OUT  std_logic_vector(1 downto 0);              -- Write burst mode      - must always be 0 (fixed mode) in AXI4-Lite
      AWLOCK     : OUT  std_logic;                                 -- Lock type             - must always be 0 (Normal access) in AXI4-Lite
      AWCACHE    : OUT  std_logic_vector(3 downto 0);              -- Memory type           - must always be 0 (Non-modifiable, Non-bufferable) in AXI4-Lite
      AWPROT     : OUT  std_logic_vector(2 downto 0);              -- Protection Type       - ignored in this model
      AWQOS      : OUT  std_logic_vector(3 downto 0);              -- Quality of Service
      AWREGION   : OUT  std_logic_vector(3 downto 0);              -- Region identifier
      AWUSER     : OUT  std_logic_vector(host_userw-1 downto 0);   -- User signal
      AWVALID    : OUT  std_logic;                                 -- Write address valid
      AWREADY    : IN   std_logic;                                 -- Write address ready (slave is ready to accept AWADDR)
      
      -- ============== AXI4 Write Data Channel
      WDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0); -- Write data
      WSTRB      : OUT  std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe (bytewise) - ignored in AXI-4 Lite
      WLAST      : OUT  std_logic;                                        -- Write last
      WUSER      : OUT  std_logic_vector(host_userw-1 downto 0);          -- User signal
      WVALID     : OUT  std_logic;                                        -- Write data is valid
      WREADY     : IN   std_logic;                                        -- Write ready (slave is ready to accept WDATA)
      
      -- ============== AXI4 Write Response Channel Signals
      BID        : IN   std_logic_vector(host_tidw-1 downto 0);    -- Response ID tag
      BRESP      : IN   std_logic_vector(1 downto 0);              -- Write response (of slave) - only OKAY, SLVERR, DECERR supported in AXI-4 Lite
      BUSER      : IN   std_logic_vector(host_userw-1 downto 0);   -- User signal
      BVALID     : IN   std_logic;                                 -- Write response valid (slave accepted WDATA)
      BREADY     : OUT  std_logic;                                 -- Response ready (master can accept slave's write response)
      
      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(host_tidw-1 downto 0);    -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);      -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);              -- Read burst length     - must always be 0 in AXI4-Lite
      ARSIZE     : OUT  std_logic_vector(1 downto 0);              -- Read burst size       - must equal host_dw_bytes-2
      ARBURST    : OUT  std_logic_vector(1 downto 0);              -- Read burst mode       - must always be 0 (fixed mode) in AXI4-Lite
      ARLOCK     : OUT  std_logic;                                 -- Lock type             - must always be 0 (Normal access) in AXI4-Lite
      ARCACHE    : OUT  std_logic_vector(3 downto 0);              -- Memory type           - must always be 0 (Non-modifiable, Non-bufferable) in AXI4-Lite
      ARPROT     : OUT  std_logic_vector(2 downto 0);              -- Protection Type       - ignored in this model
      ARQOS      : OUT  std_logic_vector(3 downto 0);              -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);              -- Region identifier
      ARUSER     : OUT  std_logic_vector(host_userw-1 downto 0);   -- User signal
      ARVALID    : OUT  std_logic;                                 -- Read address valid
      ARREADY    : IN   std_logic;                                 -- Read address ready (slave is ready to accept ARADDR)
      
      -- ============== AXI4 Read Data Channel Signals
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0); -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                      -- Read response (of slave) - only OKAY, SLVERR, DECERR supported in AXI-4 Lite
      RVALID     : IN   std_logic;                                         -- Read valid (slave providing RDATA)
      RREADY     : OUT  std_logic;                                         -- Read ready (master ready to receive RDATA)
      RID        : OUT  std_logic_vector(host_tidw-1 downto 0);            -- Read ID tag
      RLAST      : IN   std_logic;                                         -- Read last
      RUSER      : IN   std_logic_vector(host_userw-1 downto 0)            -- User signal
    );
  END COMPONENT;

  -- AXI4 Lite GPIO with CDC
  COMPONENT ccs_axi4_lite_slave_cdc
    GENERIC(
      rscid          : INTEGER               := 1;            -- Required resource ID parameter
      op_width       : INTEGER RANGE 1 TO 64 := 1;            -- Operator width (dummy parameter)
      cwidth         : INTEGER RANGE 1 TO 256 := 32;          -- Internal register width
      nopreload      : INTEGER RANGE 0 TO 1 := 0;             -- 1=disable required preload before Catapult can read
      ADDR_WIDTH     : INTEGER RANGE 12 TO 32 := 32;          -- AXI4-Lite host address width
      DATA_WIDTH     : INTEGER RANGE 32 TO 64 := 32           -- AXI4-Lite host data width (must be 32 or 64)
    );
    PORT(
      -- AXI-4 Lite Interface
      ACLK       : IN   std_logic;                                 -- AXI-4 Bus Clock - Rising edge
      ARESETn    : IN   std_logic;                                 -- Active LOW synchronous reset
      -- ============== AXI4-Lite Write Address Channel Signals
      AWADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);               -- Write address
      AWVALID    : IN   std_logic;                                          -- Write address valid
      AWREADY    : OUT  std_logic;                                          -- Write address ready (slave is ready to accept AWADDR)
      -- ============== AXI4-Lite Write Data Channel
      WDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0); -- Write data
      WSTRB      : IN   std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe (bytewise) - ignored in AXI-4 Lite
      WVALID     : IN   std_logic;                                          -- Write data is valid
      WREADY     : OUT  std_logic;                                          -- Write ready (slave is ready to accept WDATA)
      -- ============== AXI4-Lite Write Response Channel Signals
      BRESP      : OUT  std_logic_vector(1 downto 0);                       -- Write response (of slave) - only OKAY, SLVERR, DECERR supported in AXI-4 Lite
      BVALID     : OUT  std_logic;                                          -- Write response valid (slave accepted WDATA)
      BREADY     : IN   std_logic;                                          -- Response ready (master can accept slave's write response)
      -- ============== AXI4-Lite Read Address Channel Signals
      ARADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);               -- Read address
      ARVALID    : IN   std_logic;                                          -- Read address valid
      ARREADY    : OUT  std_logic;                                          -- Read address ready (slave is ready to accept ARADDR)
      -- ============== AXI4-Lite Read Data Channel Signals
      RDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0); -- Read data
      RRESP      : OUT  std_logic_vector(1 downto 0);                       -- Read response (of slave) - only OKAY, SLVERR, DECERR supported in AXI-4 Lite
      RVALID     : OUT  std_logic;                                          -- Read valid (slave providing RDATA)
      RREADY     : IN   std_logic;                                          -- Read ready (master ready to receive RDATA)

      -- Catapult interface assuming sidebyside packing 
      clk        : IN   std_logic;                                     -- Catapult Clock
      arst_n     : IN   std_logic;                                     -- Reset
--    d_from_ccs : IN   std_logic_vector(cwidth-1 downto 0);           -- Data out of Catapult block
--    d_from_vld : IN   std_logic;                                     -- Data out is valid
      d_to_ccs   : OUT  std_logic_vector(cwidth-1 downto 0)            -- Data into Catapult bloc
    );
  END COMPONENT;

  
  -- AXI4 Lite Slave Output
  COMPONENT ccs_axi4_lite_slave_out
    GENERIC(
      rscid          : INTEGER               := 1;            -- Required resource ID parameter
      op_width       : INTEGER RANGE 1 TO 64 := 1;            -- Operator width (dummy parameter)
      cwidth         : INTEGER RANGE 1 TO 256 := 32;          -- Internal register width
      nopreload      : INTEGER RANGE 0 TO 1 := 0;             -- 1=disable required preload before Catapult can read
      ADDR_WIDTH     : INTEGER RANGE 12 TO 32 := 32;          -- AXI4-Lite host address width
      DATA_WIDTH     : INTEGER RANGE 32 TO 64 := 32           -- AXI4-Lite host data width (must be 32 or 64)
    );
    PORT(
      -- AXI-4 Lite Interface
      ACLK       : IN   std_logic;                                     -- AXI-4 Bus Clock - Rising edge
      ARESETn    : IN   std_logic;                                     -- Active LOW synchronous reset
      -- ============== AXI4-Lite Write Address Channel Signals
      AWADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Write address
      AWVALID    : IN   std_logic;                                     -- Write address valid
      AWREADY    : OUT  std_logic;                                     -- Write address ready (slave is ready to accept AWADDR)
      --AWLEN      : IN   std_logic_vector(7 downto 0);                -- Write burst length    - must always be 0 in AXI4-Lite
      --AWSIZE     : IN   std_logic_vector(1 downto 0);                -- Write burst size      - must equal host_dw_bytes-2
      --AWBURST    : IN   std_logic_vector(1 downto 0);                -- Write burst mode      - must always be 0 (fixed mode) in AXI4-Lite
      --AWLOCK     : IN   std_logic;                                   -- Lock type             - must always be 0 (Normal access) in AXI4-Lite
      --AWCACHE    : IN   std_logic_vector(3 downto 0);                -- Memory type           - must always be 0 (Non-modifiable, Non-bufferable) in AXI4-Lite
      --AWPROT     : IN   std_logic_vector(2 downto 0);                -- Protection Type       - ignored in this model
      -- ============== AXI4-Lite Write Data Channel
      WDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);       -- Write data
      WSTRB      : IN   std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe (bytewise) - ignored in AXI-4 Lite
      WVALID     : IN   std_logic;                                     -- Write data is valid
      WREADY     : OUT  std_logic;                                     -- Write ready (slave is ready to accept WDATA)
      -- ============== AXI4-Lite Write Response Channel Signals
      BRESP      : OUT  std_logic_vector(1 downto 0);                  -- Write response (of slave) - only OKAY, SLVERR, DECERR supported in AXI-4 Lite
      BVALID     : OUT  std_logic;                                     -- Write response valid (slave accepted WDATA)
      BREADY     : IN   std_logic;                                     -- Response ready (master can accept slave's write response)
      -- ============== AXI4-Lite Read Address Channel Signals
      ARADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Read address
      ARVALID    : IN   std_logic;                                     -- Read address valid
      ARREADY    : OUT  std_logic;                                     -- Read address ready (slave is ready to accept ARADDR)
      --ARLEN      : IN   std_logic_vector(7 downto 0);                -- Read burst length     - must always be 0 in AXI4-Lite
      --ARSIZE     : IN   std_logic_vector(1 downto 0);                -- Read burst size       - must equal host_dw_bytes-2
      --ARBURST    : IN   std_logic_vector(1 downto 0);                -- Read burst mode       - must always be 0 (fixed mode) in AXI4-Lite
      --ARLOCK     : IN   std_logic;                                   -- Lock type             - must always be 0 (Normal access) in AXI4-Lite
      --ARCACHE    : IN   std_logic_vector(3 downto 0);                -- Memory type           - must always be 0 (Non-modifiable, Non-bufferable) in AXI4-Lite
      --ARPROT     : IN   std_logic_vector(2 downto 0);                -- Protection Type       - ignored in this model
      -- ============== AXI4-Lite Read Data Channel Signals
      RDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);       -- Read data
      RRESP      : OUT  std_logic_vector(1 downto 0);                  -- Read response (of slave) - only OKAY, SLVERR, DECERR supported in AXI-4 Lite
      RVALID     : OUT  std_logic;                                     -- Read valid (slave providing RDATA)
      RREADY     : IN   std_logic;                                     -- Read ready (master ready to receive RDATA)

      -- Catapult interface assuming sidebyside packing 
      d_from_ccs : IN   std_logic_vector(cwidth-1 downto 0);           -- Data out of Catapult block
      d_from_vld : IN   std_logic                                      -- Data out is valid
--    d_to_ccs   : OUT  std_logic_vector(cwidth-1 downto 0)            -- Data into Catapult bloc
    );
  END COMPONENT;

  COMPONENT ccs_axi4_slave_mem
    GENERIC(
      rscid           : integer                 := 1;    -- Resource ID
      -- Catapult Bus Configuration generics
      depth           : integer                 := 16;   -- Number of addressable elements (up to 20bit address)
      op_width        : integer range 1 to 1024 := 1;    -- dummy parameter for cwidth calculation
      cwidth          : integer range 1 to 1024 := 8;    -- Internal memory data width
      addr_w          : integer range 1 to 64   := 4;    -- Catapult address bus widths
      nopreload       : integer range 0 to 1    := 0;    -- 1= no preload before Catapult can read
      rst_ph          : integer range 0 to 1    := 0;    -- Reset phase.  1= Positive edge. Default is AXI negative edge
      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;   -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;   -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;    -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;    -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;    -- AXI4 Region Map (ignored in this model)
      wBASE_ADDRESS   : integer                 := 0;    -- AXI4 write channel base address alignment based on data bus width
      rBASE_ADDRESS   : integer                 := 0     -- AXI4 read channel base address alignment based on data bus width
     );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                     -- Rising edge clock
      ARESETn    : IN   std_logic;                                     -- Active LOW asynchronous reset

      -- ============== AXI4 Write Address Channel Signals
      AWID       : IN   std_logic_vector(ID_WIDTH-1 downto 0);         -- Write address ID
      AWADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Write address
      AWLEN      : IN   std_logic_vector(7 downto 0);                  -- Write burst length
      AWSIZE     : IN   std_logic_vector(2 downto 0);                  -- Write burst size
      AWBURST    : IN   std_logic_vector(1 downto 0);                  -- Write burst mode
      AWLOCK     : IN   std_logic;                                     -- Lock type
      AWCACHE    : IN   std_logic_vector(3 downto 0);                  -- Memory type
      AWPROT     : IN   std_logic_vector(2 downto 0);                  -- Protection Type
      AWQOS      : IN   std_logic_vector(3 downto 0);                  -- Quality of Service
      AWREGION   : IN   std_logic_vector(3 downto 0);                  -- Region identifier
      AWUSER     : IN   std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
      AWVALID    : IN   std_logic;                                     -- Write address valid
      AWREADY    : OUT  std_logic;                                     -- Write address ready (slave is ready to accept AWADDR)

      -- ============== AXI4 Write Data Channel
      WDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);       -- Write data
      WSTRB      : IN   std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe (bytewise)
      WLAST      : IN   std_logic;                                     -- Write last
      WUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
      WVALID     : IN   std_logic;                                     -- Write data is valid
      WREADY     : OUT  std_logic;                                     -- Write ready (slave is ready to accept WDATA)
      
      -- ============== AXI4 Write Response Channel Signals
      BID        : OUT  std_logic_vector(ID_WIDTH-1 downto 0);         -- Response ID tag
      BRESP      : OUT  std_logic_vector(1 downto 0);                  -- Write response (of slave)
      BUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
      BVALID     : OUT  std_logic;                                     -- Write response valid (slave accepted WDATA)
      BREADY     : IN   std_logic;                                     -- Response ready (master can accept slave's write response)
      
      -- ============== AXI4 Read Address Channel Signals
      ARID       : IN   std_logic_vector(ID_WIDTH-1 downto 0);         -- Read address ID
      ARADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Read address
      ARLEN      : IN   std_logic_vector(7 downto 0);                  -- Read burst length
      ARSIZE     : IN   std_logic_vector(2 downto 0);                  -- Read burst size
      ARBURST    : IN   std_logic_vector(1 downto 0);                  -- Read burst mode
      ARLOCK     : IN   std_logic;                                     -- Lock type
      ARCACHE    : IN   std_logic_vector(3 downto 0);                  -- Memory type
      ARPROT     : IN   std_logic_vector(2 downto 0);                  -- Protection Type
      ARQOS      : IN   std_logic_vector(3 downto 0);                  -- Quality of Service
      ARREGION   : IN   std_logic_vector(3 downto 0);                  -- Region identifier
      ARUSER     : IN   std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
      ARVALID    : IN   std_logic;                                     -- Read address valid
      ARREADY    : OUT  std_logic;                                     -- Read address ready (slave is ready to accept ARADDR)
      
      -- ============== AXI4 Read Data Channel Signals
      RID        : OUT  std_logic_vector(ID_WIDTH-1 downto 0);         -- Read ID tag
      RDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);       -- Read data
      RRESP      : OUT  std_logic_vector(1 downto 0);                  -- Read response (of slave)
      RLAST      : OUT  std_logic;                                     -- Read last
      RUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
      RVALID     : OUT  std_logic;                                     -- Read valid (slave providing RDATA)
      RREADY     : IN   std_logic;                                     -- Read ready (master ready to receive RDATA)
      
      -- Catapult interface
      s_re      : IN   std_logic;                                      -- Catapult attempting read of slave memory
      s_we      : IN   std_logic;                                      -- Catapult attempting write to slave memory
      s_raddr   : IN   std_logic_vector(addr_w-1 downto 0);            -- Catapult addressing into memory (axi_addr = base_addr + s_raddr)
      s_waddr   : IN   std_logic_vector(addr_w-1 downto 0);            -- Catapult addressing into memory (axi_addr = base_addr + s_waddr)
      s_din     : OUT  std_logic_vector(cwidth-1 downto 0);            -- Data into catapult block through this interface
      s_dout    : IN   std_logic_vector(cwidth-1 downto 0);            -- Data out to slave from catapult
      s_rrdy    : OUT  std_logic;                                      -- Read data is valid
      s_wrdy    : OUT  std_logic;                                      -- Slave memory ready for write by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                      -- component is idle - clock can be suppressed
      tr_write_done : IN std_logic;                                    -- transactor resource preload write done
      s_tdone   : IN   std_logic                                       -- Transaction_done in scverify
    );  
  END COMPONENT;

  COMPONENT ccs_axi4_master_read_core
    GENERIC(
      rscid           : integer                 := 1;      -- Resource ID
      -- Catapult Bus Configuration generics
      depth           : integer                 := 16;     -- Number of addressable elements (up to 20bit address)
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 1 to 64   := 4;      -- Catapult address bus width
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default

      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      xburstsize      : integer                 := 0;      -- Burst size for scverify transactor
      xBASE_ADDRESS   : integer                 := 0;      -- Base address for scverify transactor
      xBASE_ADDRESSU  : integer                 := 0       -- Upper word for 64-bit Base address for scverify transactor
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset
      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);                   -- Read burst length
      ARSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Read burst size
      ARBURST    : OUT  std_logic_vector(1 downto 0);                   -- Read burst mode
      ARLOCK     : OUT  std_logic;                                      -- Lock type
      ARCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      ARPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      ARQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      ARUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      ARVALID    : OUT  std_logic;                                      -- Read address valid
      ARREADY    : IN   std_logic;                                      -- Read address ready
      -- ============== AXI4 Read Data Channel Signals
      RID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Read ID tag
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);        -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                   -- Read response
      RLAST      : IN   std_logic;                                      -- Read last
      RUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      RVALID     : IN   std_logic;                                      -- Read valid
      RREADY     : OUT  std_logic;                                      -- Read ready

      -- Configuration interface
      cfgBaseAddress : IN  std_logic_vector(ADDR_WIDTH-1 downto 0);  
      cfgBurstSize   : IN  std_logic_vector(31 downto 0);            
      cfgTimeout     : IN  std_logic_vector(31 downto 0);            

      -- Catapult interface
      m_re      : IN   std_logic;                                       -- Catapult attempting read of memory over bus
      m_raddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for read request (axi_addr = base_addr + m_raddr)
      m_rburst  : IN   std_logic_vector(31 downto 0);                   -- Read Burst length (constant rburstsize for now, future enhancement driven by operator)
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic                                        -- The component is idle. The next clk can be suppressed
    );
  END COMPONENT;
  
  COMPONENT ccs_axi4_master_read
    GENERIC(
      rscid           : integer                 := 1;      -- Resource ID
      -- Catapult Bus Configuration generics
      depth           : integer                 := 16;     -- Number of addressable elements (up to 20bit address)
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 1 to 64   := 4;      -- Catapult address bus width
      burstsize       : integer                 := 0;      -- Catapult configuration option for Read burst size
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      timeout         : integer                 := 0;      --  #cycles timeout for burst stall

      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      BASE_ADDRESS    : integer                 := 0;      -- Base address 
      BASE_ADDRESSU   : integer                 := 0       -- Upper word for 64-bit Base address 
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset
      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);                   -- Read burst length
      ARSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Read burst size
      ARBURST    : OUT  std_logic_vector(1 downto 0);                   -- Read burst mode
      ARLOCK     : OUT  std_logic;                                      -- Lock type
      ARCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      ARPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      ARQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      ARUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      ARVALID    : OUT  std_logic;                                      -- Read address valid
      ARREADY    : IN   std_logic;                                      -- Read address ready
      -- ============== AXI4 Read Data Channel Signals
      RID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Read ID tag
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);        -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                   -- Read response
      RLAST      : IN   std_logic;                                      -- Read last
      RUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      RVALID     : IN   std_logic;                                      -- Read valid
      RREADY     : OUT  std_logic;                                      -- Read ready

      -- Catapult interface
      m_re      : IN   std_logic;                                       -- Catapult attempting read of memory over bus
      m_raddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for read request (axi_addr = base_addr + m_raddr)
      m_rburst  : IN   std_logic_vector(31 downto 0);                   -- Read Burst length (constant rburstsize for now, future enhancement driven by operator)
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic                                        -- The component is idle. The next clk can be suppressed
    );
  END COMPONENT;
  
  COMPONENT ccs_axi4_master_write_core
    GENERIC(
      rscid           : integer                 := 1;      -- Resource ID
      -- Catapult Bus Configuration generics
      depth           : integer                 := 16;     -- Number of addressable elements (up to 20bit address)
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 1 to 64   := 4;      -- Catapult address bus width
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default

      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      xburstsize      : integer                 := 0;      -- Burst size for scverify transactor
      xBASE_ADDRESS   : integer                 := 0;      -- Base address for scverify transactor
      xBASE_ADDRESSU  : integer                 := 0       -- Upper word for 64-bit Base address for scverify transactor
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset

      -- ============== AXI4 Write Address Channel Signals
      AWID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Write address ID
      AWADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Write address
      AWLEN      : OUT  std_logic_vector(7 downto 0);                   -- Write burst length
      AWSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Write burst size
      AWBURST    : OUT  std_logic_vector(1 downto 0);                   -- Write burst mode
      AWLOCK     : OUT  std_logic;                                      -- Lock type
      AWCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      AWPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      AWQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      AWREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      AWUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      AWVALID    : OUT  std_logic;                                      -- Write address valid
      AWREADY    : IN   std_logic;                                      -- Write address ready

      -- ============== AXI4 Write Data Channel
      WDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);        -- Write data
      WSTRB      : OUT  std_logic_vector((DATA_WIDTH/8)-1 downto 0);    -- Write strobe (bytewise)
      WLAST      : OUT  std_logic;                                      -- Write last
      WUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      WVALID     : OUT  std_logic;                                      -- Write data is valid
      WREADY     : IN   std_logic;                                      -- Write ready

      -- ============== AXI4 Write Response Channel Signals
      BID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Response ID tag
      BRESP      : IN   std_logic_vector(1 downto 0);                   -- Write response
      BUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      BVALID     : IN   std_logic;                                      -- Write response valid
      BREADY     : OUT  std_logic;                                      -- Response ready

      -- Configuration interface
      cfgBaseAddress : IN  std_logic_vector(ADDR_WIDTH-1 downto 0);  
      cfgBurstSize   : IN  std_logic_vector(31 downto 0);            
      cfgTimeout     : IN  std_logic_vector(31 downto 0);            

      -- Catapult interface
      m_we      : IN   std_logic;                                       -- Catapult attempting write to memory over bus
      m_waddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for write request (axi_addr = base_addr + m_waddr)
      m_wburst  : IN   std_logic_vector(31 downto 0);                   -- Write Burst length (constant wburstsize for now, future enhancement driven by operator)
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp : OUT  std_logic;                                     -- wburst_in == wburst_out
      m_wstate    : OUT  std_logic_vector(2 downto 0)                   -- write_state of master
    );
  END COMPONENT;
  
  COMPONENT ccs_axi4_master_write
    GENERIC(
      rscid           : integer                 := 1;      -- Resource ID
      -- Catapult Bus Configuration generics
      depth           : integer                 := 16;     -- Number of addressable elements (up to 20bit address)
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 1 to 64   := 4;      -- Catapult address bus width
      burstsize       : integer                 := 0;      -- Catapult configuration option for write burst size
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      timeout         : integer                 := 0;      --  #cycles timeout for burst stall

      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      BASE_ADDRESS    : integer                 := 0;      -- Base address
      BASE_ADDRESSU   : integer                 := 0       -- Upper word for 64-bit Base address
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset

      -- ============== AXI4 Write Address Channel Signals
      AWID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Write address ID
      AWADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Write address
      AWLEN      : OUT  std_logic_vector(7 downto 0);                   -- Write burst length
      AWSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Write burst size
      AWBURST    : OUT  std_logic_vector(1 downto 0);                   -- Write burst mode
      AWLOCK     : OUT  std_logic;                                      -- Lock type
      AWCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      AWPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      AWQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      AWREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      AWUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      AWVALID    : OUT  std_logic;                                      -- Write address valid
      AWREADY    : IN   std_logic;                                      -- Write address ready

      -- ============== AXI4 Write Data Channel
      WDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);        -- Write data
      WSTRB      : OUT  std_logic_vector((DATA_WIDTH/8)-1 downto 0);    -- Write strobe (bytewise)
      WLAST      : OUT  std_logic;                                      -- Write last
      WUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      WVALID     : OUT  std_logic;                                      -- Write data is valid
      WREADY     : IN   std_logic;                                      -- Write ready

      -- ============== AXI4 Write Response Channel Signals
      BID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Response ID tag
      BRESP      : IN   std_logic_vector(1 downto 0);                   -- Write response
      BUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      BVALID     : IN   std_logic;                                      -- Write response valid
      BREADY     : OUT  std_logic;                                      -- Response ready

      -- Catapult interface
      m_we      : IN   std_logic;                                       -- Catapult attempting write to memory over bus
      m_waddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for write request (axi_addr = base_addr + m_waddr)
      m_wburst  : IN   std_logic_vector(31 downto 0);                   -- Write Burst length (constant wburstsize for now, future enhancement driven by operator)
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp : OUT  std_logic;                                     -- wburst_in == wburst_out
      m_wstate    : OUT  std_logic_vector(2 downto 0)                   -- write_state of master
    );
  END COMPONENT;
  
  COMPONENT ccs_axi4_master_core
    GENERIC(
      rscid           : integer                 := 1;      -- Resource ID
      -- Catapult Bus Configuration generics
      depth           : integer                 := 16;     -- Number of addressable elements (up to 20bit address)
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 1 to 64   := 4;      -- Catapult address bus width
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      xwburstsize     : integer                 := 0;      -- wBurst size for scverify transactor
      xrburstsize     : integer                 := 0;      -- rBurst size for scverify transactor
      xwBASE_ADDRESS  : integer                 := 0;      -- wBase address for scverify transactor
      xrBASE_ADDRESS  : integer                 := 0;      -- rBase address for scverify transactor
      xwBASE_ADDRESSU : integer                 := 0;      -- Upper word for 64-bit wBase address for scverify transactor
      xrBASE_ADDRESSU : integer                 := 0       -- Upper word for 64-bit rBase address for scverify transactor
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset
      -- ============== AXI4 Write Address Channel Signals
      AWID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Write address ID
      AWADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Write address
      AWLEN      : OUT  std_logic_vector(7 downto 0);                   -- Write burst length
      AWSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Write burst size
      AWBURST    : OUT  std_logic_vector(1 downto 0);                   -- Write burst mode
      AWLOCK     : OUT  std_logic;                                      -- Lock type
      AWCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      AWPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      AWQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      AWREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      AWUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      AWVALID    : OUT  std_logic;                                      -- Write address valid
      AWREADY    : IN   std_logic;                                      -- Write address ready
      -- ============== AXI4 Write Data Channel
      WDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);        -- Write data
      WSTRB      : OUT  std_logic_vector((DATA_WIDTH/8)-1 downto 0);    -- Write strobe (bytewise)
      WLAST      : OUT  std_logic;                                      -- Write last
      WUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      WVALID     : OUT  std_logic;                                      -- Write data is valid
      WREADY     : IN   std_logic;                                      -- Write ready
      -- ============== AXI4 Write Response Channel Signals
      BID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Response ID tag
      BRESP      : IN   std_logic_vector(1 downto 0);                   -- Write response
      BUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      BVALID     : IN   std_logic;                                      -- Write response valid
      BREADY     : OUT  std_logic;                                      -- Response ready
      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);                   -- Read burst length
      ARSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Read burst size
      ARBURST    : OUT  std_logic_vector(1 downto 0);                   -- Read burst mode
      ARLOCK     : OUT  std_logic;                                      -- Lock type
      ARCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      ARPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      ARQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      ARUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      ARVALID    : OUT  std_logic;                                      -- Read address valid
      ARREADY    : IN   std_logic;                                      -- Read address ready
      -- ============== AXI4 Read Data Channel Signals
      RID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Read ID tag
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);        -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                   -- Read response
      RLAST      : IN   std_logic;                                      -- Read last
      RUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      RVALID     : IN   std_logic;                                      -- Read valid
      RREADY     : OUT  std_logic;                                      -- Read ready

      -- Configuration interface
      cfgwBaseAddress : IN  std_logic_vector(ADDR_WIDTH-1 downto 0);  
      cfgrBaseAddress : IN  std_logic_vector(ADDR_WIDTH-1 downto 0);  
      cfgwBurstSize  : IN  std_logic_vector(31 downto 0);            
      cfgrBurstSize  : IN  std_logic_vector(31 downto 0);            
      cfgTimeout     : IN  std_logic_vector(31 downto 0);

      -- Catapult interface
      m_re      : IN   std_logic;                                       -- Catapult attempting read of memory over bus
      m_we      : IN   std_logic;                                       -- Catapult attempting write to memory over bus
      m_waddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for write request (axi_addr = base_addr + m_waddr)
      m_raddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for read request (axi_addr = base_addr + m_raddr)
      m_wburst  : IN   std_logic_vector(31 downto 0);                   -- Write Burst length (constant wburstsize for now, future enhancement driven by operator)
      m_rburst  : IN   std_logic_vector(31 downto 0);                   -- Read Burst length (constant rburstsize for now, future enhancement driven by operator)
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp : OUT  std_logic;                                     -- wburst_in == wburst_out
      m_wstate    : OUT  std_logic_vector(2 downto 0)                   -- write_state of master
    );
  END COMPONENT;

  COMPONENT ccs_axi4_master_cfg
    GENERIC(
      rscid           : integer                 := 1;      -- Resource ID
      -- Catapult Bus Configuration generics
      depth           : integer                 := 16;     -- Number of addressable elements (up to 20bit address)
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 1 to 64   := 4;      -- Catapult address bus width
      cburst_mode     : integer range 0 to 2    := 0;      -- Burst mode (0==use w/rburstsize, 1==configuration port)
      wburstsize      : integer                 := 0;      -- Catapult configuration option for Write burst size
      rburstsize      : integer                 := 0;      -- Catapult configuration option for Read burst size
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      use_go          : integer range 0 to 1    := 0;      -- Use the cfgBus stop/go mechanism.  Default not.

      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      base_addr_mode  : integer range 0 to 2    := 0;      -- Where base address is specified (0=param, 1=cfg, 2=port)
      wBASE_ADDRESS   : integer                 := 0;      -- AXI4 write channel base address
      rBASE_ADDRESS   : integer                 := 0;      -- AXI4 read channel base address
      wBASE_ADDRESSU  : integer                 := 0;      -- Upper word of 64-bit AXI4 write channel base address
      rBASE_ADDRESSU  : integer                 := 0       -- Upper word of 64-bit AXI4 read channel base address
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset
      -- ============== AXI4 Write Address Channel Signals
      AWID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Write address ID
      AWADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Write address
      AWLEN      : OUT  std_logic_vector(7 downto 0);                   -- Write burst length
      AWSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Write burst size
      AWBURST    : OUT  std_logic_vector(1 downto 0);                   -- Write burst mode
      AWLOCK     : OUT  std_logic;                                      -- Lock type
      AWCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      AWPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      AWQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      AWREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      AWUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      AWVALID    : OUT  std_logic;                                      -- Write address valid
      AWREADY    : IN   std_logic;                                      -- Write address ready
      -- ============== AXI4 Write Data Channel
      WDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);        -- Write data
      WSTRB      : OUT  std_logic_vector((DATA_WIDTH/8)-1 downto 0);    -- Write strobe (bytewise)
      WLAST      : OUT  std_logic;                                      -- Write last
      WUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      WVALID     : OUT  std_logic;                                      -- Write data is valid
      WREADY     : IN   std_logic;                                      -- Write ready
      -- ============== AXI4 Write Response Channel Signals
      BID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Response ID tag
      BRESP      : IN   std_logic_vector(1 downto 0);                   -- Write response
      BUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      BVALID     : IN   std_logic;                                      -- Write response valid
      BREADY     : OUT  std_logic;                                      -- Response ready
      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);                   -- Read burst length
      ARSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Read burst size
      ARBURST    : OUT  std_logic_vector(1 downto 0);                   -- Read burst mode
      ARLOCK     : OUT  std_logic;                                      -- Lock type
      ARCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      ARPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      ARQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      ARUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      ARVALID    : OUT  std_logic;                                      -- Read address valid
      ARREADY    : IN   std_logic;                                      -- Read address ready
      -- ============== AXI4 Read Data Channel Signals
      RID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Read ID tag
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);        -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                   -- Read response
      RLAST      : IN   std_logic;                                      -- Read last
      RUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      RVALID     : IN   std_logic;                                      -- Read valid
      RREADY     : OUT  std_logic;                                      -- Read ready

      -- AXI-lite slave interface to program base_addr - address 0, 1, 2
      cfgAWADDR  : IN  std_logic_vector(31 downto 0);
      cfgAWVALID : IN  std_logic;
      cfgAWREADY : OUT std_logic;
      cfgWDATA   : IN  std_logic_vector(31 downto 0);
      cfgWSTRB   : IN  std_logic_vector(3 downto 0);
      cfgWVALID  : IN  std_logic;
      cfgWREADY  : OUT std_logic;
      cfgBRESP   : OUT std_logic_vector(1 downto 0);
      cfgBVALID  : OUT std_logic;
      cfgBREADY  : IN  std_logic;
      cfgARADDR  : IN  std_logic_vector(31 downto 0);
      cfgARVALID : IN  std_logic;
      cfgARREADY : OUT std_logic;
      cfgRDATA   : OUT std_logic_vector(31 downto 0);
      cfgRRESP   : OUT std_logic_vector(1 downto 0);
      cfgRVALID  : OUT std_logic;
      cfgRREADY  : IN  std_logic;

      -- Catapult interface
      m_re      : IN   std_logic;                                       -- Catapult attempting read of memory over bus
      m_we      : IN   std_logic;                                       -- Catapult attempting write to memory over bus
      m_waddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for write request (axi_addr = base_addr + m_waddr)
      m_raddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for read request (axi_addr = base_addr + m_raddr)
      m_wburst  : IN   std_logic_vector(31 downto 0);                   -- Write Burst length (constant wburstsize for now, future enhancement driven by operator)
      m_rburst  : IN   std_logic_vector(31 downto 0);                   -- Read Burst length (constant rburstsize for now, future enhancement driven by operator)
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp : OUT  std_logic;                                     -- wburst_in == wburst_out
      m_wstate    : OUT  std_logic_vector(2 downto 0)                   -- write_state of master
    );
  END COMPONENT;

  COMPONENT ccs_axi4_master
    GENERIC(
      rscid           : integer                 := 1;      -- Resource ID
      -- Catapult Bus Configuration generics
      depth           : integer                 := 16;     -- Number of addressable elements (up to 20bit address)
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 1 to 64   := 4;      -- Catapult address bus width
      wburstsize      : integer                 := 0;      -- Catapult configuration option for Write burst size
      rburstsize      : integer                 := 0;      -- Catapult configuration option for Read burst size
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      timeout         : integer                 := 0;      --  #cycles timeout for burst stall

      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      wBASE_ADDRESS    : integer                := 0;      -- AXI4 write channel base address
      rBASE_ADDRESS    : integer                := 0;      -- AXI4 read channel base address
      wBASE_ADDRESSU   : integer                := 0;      -- Upper word for 64-bit AXI4 write channel base address
      rBASE_ADDRESSU   : integer                := 0       -- Upper word for 64-bit AXI4 read channel base addressable
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset
      -- ============== AXI4 Write Address Channel Signals
      AWID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Write address ID
      AWADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Write address
      AWLEN      : OUT  std_logic_vector(7 downto 0);                   -- Write burst length
      AWSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Write burst size
      AWBURST    : OUT  std_logic_vector(1 downto 0);                   -- Write burst mode
      AWLOCK     : OUT  std_logic;                                      -- Lock type
      AWCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      AWPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      AWQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      AWREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      AWUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      AWVALID    : OUT  std_logic;                                      -- Write address valid
      AWREADY    : IN   std_logic;                                      -- Write address ready
      -- ============== AXI4 Write Data Channel
      WDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);        -- Write data
      WSTRB      : OUT  std_logic_vector((DATA_WIDTH/8)-1 downto 0);    -- Write strobe (bytewise)
      WLAST      : OUT  std_logic;                                      -- Write last
      WUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      WVALID     : OUT  std_logic;                                      -- Write data is valid
      WREADY     : IN   std_logic;                                      -- Write ready
      -- ============== AXI4 Write Response Channel Signals
      BID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Response ID tag
      BRESP      : IN   std_logic_vector(1 downto 0);                   -- Write response
      BUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      BVALID     : IN   std_logic;                                      -- Write response valid
      BREADY     : OUT  std_logic;                                      -- Response ready
      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);                   -- Read burst length
      ARSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Read burst size
      ARBURST    : OUT  std_logic_vector(1 downto 0);                   -- Read burst mode
      ARLOCK     : OUT  std_logic;                                      -- Lock type
      ARCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      ARPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      ARQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      ARUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      ARVALID    : OUT  std_logic;                                      -- Read address valid
      ARREADY    : IN   std_logic;                                      -- Read address ready
      -- ============== AXI4 Read Data Channel Signals
      RID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Read ID tag
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);        -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                   -- Read response
      RLAST      : IN   std_logic;                                      -- Read last
      RUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      RVALID     : IN   std_logic;                                      -- Read valid
      RREADY     : OUT  std_logic;                                      -- Read ready

      -- Catapult interface
      m_re      : IN   std_logic;                                       -- Catapult attempting read of memory over bus
      m_we      : IN   std_logic;                                       -- Catapult attempting write to memory over bus
      m_waddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for write request (axi_addr = base_addr + m_waddr)
      m_raddr   : IN   std_logic_vector(addr_w    -1 downto 0);         -- Address for read request (axi_addr = base_addr + m_raddr)
      m_wburst  : IN   std_logic_vector(31 downto 0);                   -- Write Burst length (constant wburstsize for now, future enhancement driven by operator)
      m_rburst  : IN   std_logic_vector(31 downto 0);                   -- Read Burst length (constant rburstsize for now, future enhancement driven by operator)
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp : OUT  std_logic;                                     -- wburst_in == wburst_out
      m_wstate    : OUT  std_logic_vector(2 downto 0)                   -- write_state of master
    );
  END COMPONENT;

COMPONENT ccs_axi4_master_instream_core
    GENERIC(
      rscid           : integer                 := 1;     -- Resource ID
      -- Catapult Bus Configuration generics
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 0 to 64   := 4;      -- Catapult address bus width
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      fpga            : integer range 0 to 1    := 0;      -- Choose the fpga better-route version
      
      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      xburstsize      : integer                 := 0;      -- Burst size for scverify transactor
      xframe_size      : integer                := 16;     -- Number of elements in the frame to be streamed
      xBASE_ADDRESS   : integer                 := 0;      -- Base address for scverify transactor
      xBASE_ADDRESSU  : integer                 := 0       -- Upper word for 64-bit Base address for scverify transactor
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset

      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);                   -- Read burst length
      ARSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Read burst size
      ARBURST    : OUT  std_logic_vector(1 downto 0);                   -- Read burst mode
      ARLOCK     : OUT  std_logic;                                      -- Lock type
      ARCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      ARPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      ARQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      ARUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      ARVALID    : OUT  std_logic;                                      -- Read address valid
      ARREADY    : IN   std_logic;                                      -- Read address ready

      -- ============== AXI4 Read Data Channel Signals
      RID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Read ID tag
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);        -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                   -- Read response
      RLAST      : IN   std_logic;                                      -- Read last
      RUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      RVALID     : IN   std_logic;                                      -- Read valid
      RREADY     : OUT  std_logic;                                      -- Read ready

      -- Configuration interface
      cfgBaseAddress : IN  std_logic_vector(ADDR_WIDTH-1 downto 0);  
      cfgBurstSize   : IN  std_logic_vector(31 downto 0);            
      cfgTimeout     : IN  std_logic_vector(31 downto 0);            
      cfgFrameSize   : IN  std_logic_vector(31 downto 0);            

      -- Catapult interface
      m_re      : IN   std_logic;                                       -- Catapult attempting read of memory over bus
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      rdy       : OUT  std_logic                                        -- For transactor
    );

END COMPONENT;

COMPONENT ccs_axi4_master_outstream_core
    GENERIC(
      rscid           : integer;                           -- Resource ID
      -- Catapult Bus Configuration generics
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 0 to 64   := 4;      -- Catapult address bus width
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default

      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16   := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      xburstsize       : integer                := 0;      -- Burst size for scverify transactor
      xframe_size      : integer                := 16;     -- Number of elements in the frame to be streamed
      xBASE_ADDRESS    : integer                := 0;      -- Base addess  for scverify transactor
      xBASE_ADDRESSU   : integer                := 0       -- Upper word for 64-bit Base addess  for scverify transactor
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset

      -- ============== AXI4 Write Address Channel Signals
      AWID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Write address ID
      AWADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Write address
      AWLEN      : OUT  std_logic_vector(7 downto 0);                   -- Write burst length
      AWSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Write burst size
      AWBURST    : OUT  std_logic_vector(1 downto 0);                   -- Write burst mode
      AWLOCK     : OUT  std_logic;                                      -- Lock type
      AWCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      AWPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      AWQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      AWREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      AWUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      AWVALID    : OUT  std_logic;                                      -- Write address valid
      AWREADY    : IN   std_logic;                                      -- Write address ready

      -- ============== AXI4 Write Data Channel
      WDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);        -- Write data
      WSTRB      : OUT  std_logic_vector((DATA_WIDTH/8)-1 downto 0);    -- Write strobe (bytewise)
      WLAST      : OUT  std_logic;                                      -- Write last
      WUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      WVALID     : OUT  std_logic;                                      -- Write data is valid
      WREADY     : IN   std_logic;                                      -- Write ready

      -- ============== AXI4 Write Response Channel Signals
      BID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Response ID tag
      BRESP      : IN   std_logic_vector(1 downto 0);                   -- Write response
      BUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      BVALID     : IN   std_logic;                                      -- Write response valid
      BREADY     : OUT  std_logic;                                      -- Response ready

      -- Catapult interface
      -- Configuration interface
      cfgBaseAddress : IN  std_logic_vector(ADDR_WIDTH-1 downto 0);  
      cfgBurstSize   : IN  std_logic_vector(31 downto 0);            
      cfgTimeout     : IN  std_logic_vector(31 downto 0);            
      cfgFrameSize   : IN  std_logic_vector(31 downto 0);            

      m_we      : IN   std_logic;                                       -- Catapult attempting write to memory over bus
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      vld       : OUT  std_logic                                        -- Core produced data.  Written into transactor "row"
    );

END COMPONENT;

COMPONENT ccs_axi4_master_instream
    GENERIC(
      rscid           : integer                 := 1;     -- Resource ID
      -- Catapult Bus Configuration generics
      frame_size      : integer                 := 16;     -- Number of elements in the frame to be streamed
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 0 to 64   := 4;      -- Catapult address bus width
      burstsize       : integer                 := 0;      -- Catapult configuration option for Read burst size
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      fpga            : integer range 0 to 1    := 0;      -- Choose the fpga better-route version
      timeout         : integer                 := 0;      --  #cycles timeout for burst stall
      
      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      BASE_ADDRESS    : integer                 := 0;      -- Base address 
      BASE_ADDRESSU   : integer                 := 0       -- Upper word for 64-bit Base address 
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset

      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);                   -- Read burst length
      ARSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Read burst size
      ARBURST    : OUT  std_logic_vector(1 downto 0);                   -- Read burst mode
      ARLOCK     : OUT  std_logic;                                      -- Lock type
      ARCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      ARPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      ARQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      ARUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      ARVALID    : OUT  std_logic;                                      -- Read address valid
      ARREADY    : IN   std_logic;                                      -- Read address ready

      -- ============== AXI4 Read Data Channel Signals
      RID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Read ID tag
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);        -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                   -- Read response
      RLAST      : IN   std_logic;                                      -- Read last
      RUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      RVALID     : IN   std_logic;                                      -- Read valid
      RREADY     : OUT  std_logic;                                      -- Read ready

      -- Catapult interface
      m_re      : IN   std_logic;                                       -- Catapult attempting read of memory over bus
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      rdy       : OUT  std_logic                                        -- For transactor
    );

END COMPONENT;

COMPONENT ccs_axi4_master_outstream
    GENERIC(
      rscid           : integer;                           -- Resource ID
      -- Catapult Bus Configuration generics
      frame_size      : integer                 := 16;     -- Number of elements in the frame to be streamed
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 0 to 64   := 4;      -- Catapult address bus width
      burstsize       : integer                 := 0;      -- Catapult configuration option for Write burst size
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      timeout         : integer                 := 0;      --  #cycles timeout for burst stall

      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16   := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;     -- AXI4 Region Map (ignored in this model)
      BASE_ADDRESS    : integer                := 0;      -- AXI4 write channel base address
      BASE_ADDRESSU   : integer                := 0       -- Upper word for 64-bit AXI4 write channel base address
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset

      -- ============== AXI4 Write Address Channel Signals
      AWID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Write address ID
      AWADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Write address
      AWLEN      : OUT  std_logic_vector(7 downto 0);                   -- Write burst length
      AWSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Write burst size
      AWBURST    : OUT  std_logic_vector(1 downto 0);                   -- Write burst mode
      AWLOCK     : OUT  std_logic;                                      -- Lock type
      AWCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      AWPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      AWQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      AWREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      AWUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      AWVALID    : OUT  std_logic;                                      -- Write address valid
      AWREADY    : IN   std_logic;                                      -- Write address ready

      -- ============== AXI4 Write Data Channel
      WDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);        -- Write data
      WSTRB      : OUT  std_logic_vector((DATA_WIDTH/8)-1 downto 0);    -- Write strobe (bytewise)
      WLAST      : OUT  std_logic;                                      -- Write last
      WUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      WVALID     : OUT  std_logic;                                      -- Write data is valid
      WREADY     : IN   std_logic;                                      -- Write ready

      -- ============== AXI4 Write Response Channel Signals
      BID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Response ID tag
      BRESP      : IN   std_logic_vector(1 downto 0);                   -- Write response
      BUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      BVALID     : IN   std_logic;                                      -- Write response valid
      BREADY     : OUT  std_logic;                                      -- Response ready

      -- Catapult interface
      m_we      : IN   std_logic;                                       -- Catapult attempting write to memory over bus
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      vld       : OUT  std_logic                                        -- Core produced data.  Written into transactor "row"
    );

END COMPONENT;

COMPONENT ccs_axi4_lite_slave_outreg
  GENERIC(
    rscid           : integer                 := 1;    -- Resource ID
    -- Catapult Bus Configuration generics
    op_width        : integer range 1 to 1024 := 1;    -- dummy parameter for cwidth calculation
    cwidth          : integer range 1 to 1024 := 8;    -- Internal memory data width
    rst_ph          : integer range 0 to 1    := 0;    -- Reset phase.  1= Positive edge. Default is AXI negative edge
    -- AXI-4 Bus Configuration generics
    ADDR_WIDTH      : integer range 12 to 64  := 32;   -- AXI4 bus address width
    DATA_WIDTH      : integer range 8 to 1024 := 32;   -- AXI4 read&write data bus width
    BASE_ADDRESS   : integer                  := 0     -- AXI4 Address that the register is seen at
    );
  PORT(
    -- AXI-4 Interface
    ACLK       : IN   std_logic;                                     -- Rising edge clock
    ARESETn    : IN   std_logic;                                     -- Active LOW asynchronous reset
    
    -- ============== AXI4 Read Address Channel Signals
    ARADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Read address
    ARVALID    : IN   std_logic;                                     -- Read address valid
    ARREADY    : OUT  std_logic;                                     -- Read address ready (slave is ready to accept ARADDR)
    
    -- ============== AXI4 Read Data Channel Signals
    RDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);       -- Read data
    RRESP      : OUT  std_logic_vector(1 downto 0);                  -- Read response (of slave)
    RVALID     : OUT  std_logic;                                     -- Read valid (slave providing RDATA)
    RREADY     : IN   std_logic;                                     -- Read ready (master ready to receive RDATA)
    
    -- Catapult interface
    ivld      : IN   std_logic;                                      -- Catapult data ready
    idat      : in   std_logic_vector(cwidth-1 downto 0);            -- Data from catapult

    -- External valid flag
    vld       : OUT  std_logic                                       -- Data valid for AXI read
    );

END COMPONENT;

COMPONENT ccs_axi4_lite_slave_inreg 
  GENERIC(
    rscid           : integer                 := 1;    -- Resource ID
    -- Catapult Bus Configuration generics
    op_width        : integer range 1 to 1024 := 1;    -- dummy parameter for cwidth calculation
    cwidth          : integer range 1 to 1024 := 8;    -- Internal memory data width
    rst_ph          : integer range 0 to 1    := 0;    -- Reset phase.  1= Positive edge. Default is AXI negative edge
    disable_vld     : integer range 0 to 1    := 0;    -- Disable use of vld signal to stall I/O
    -- AXI-4 Bus Configuration generics
    ADDR_WIDTH      : integer range 12 to 64  := 32;   -- AXI4 bus address width
    DATA_WIDTH      : integer range 8 to 1024 := 32;   -- AXI4 read&write data bus width
    BASE_ADDRESS    : integer                 := 0     -- AXI4 Address that the register is seen at
    );
  PORT(
    -- AXI-4 Interface
    ACLK       : IN   std_logic;                                     -- Rising edge clock
    ARESETn    : IN   std_logic;                                     -- Active LOW asynchronous reset
    -- ============== AXI4 Write Address Channel Signals
    AWADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Write address
    AWVALID    : IN   std_logic;                                     -- Write address valid
    AWREADY    : OUT  std_logic;                                     -- Write address ready (slave is ready to accept AWADDR)
    -- ============== AXI4 Write Data Channel
    WDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);       -- Write data
    WSTRB      : IN   std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe (bytewise)
    WVALID     : IN   std_logic;                                     -- Write data is valid
    WREADY     : OUT  std_logic;                                     -- Write ready (slave is ready to accept WDATA)
    
    -- ============== AXI4 Write Response Channel Signals
    BRESP      : OUT  std_logic_vector(1 downto 0);                  -- Write response (of slave)
    BVALID     : OUT  std_logic;                                     -- Write response valid (slave accepted WDATA)
    BREADY     : IN   std_logic;                                     -- Response ready (master can accept slave's write response)
    
    -- Catapult interface
    ivld      : OUT   std_logic;                                      -- Data valid.  Duration 1 cycle
    idat      : OUT   std_logic_vector(cwidth-1 downto 0)             -- Data into catapult block through this interface
    );
END COMPONENT;

COMPONENT ccs_axi4_lite_slave_indirect
  GENERIC(
    rscid           : integer                 := 1;    -- Resource ID
    -- Catapult Bus Configuration generics
    op_width        : integer range 1 to 1024 := 1;    -- dummy parameter for cwidth calculation
    cwidth          : integer range 1 to 1024 := 8;    -- Internal memory data width
    rst_ph          : integer range 0 to 1    := 0;    -- Reset phase.  1= Positive edge. Default is AXI negative edge
    -- AXI-4 Bus Configuration generics
    ADDR_WIDTH      : integer range 12 to 64  := 32;   -- AXI4 bus address width
    DATA_WIDTH      : integer range 8 to 1024 := 32;   -- AXI4 read&write data bus width
    BASE_ADDRESS    : integer                 := 0     -- AXI4 Address that the register is seen at
    );
  PORT(
    -- AXI-4 Interface
    ACLK       : IN   std_logic;                                     -- Rising edge clock
    ARESETn    : IN   std_logic;                                     -- Active LOW asynchronous reset
    -- ============== AXI4 Write Address Channel Signals
    AWADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Write address
    AWVALID    : IN   std_logic;                                     -- Write address valid
    AWREADY    : OUT  std_logic;                                     -- Write address ready (slave is ready to accept AWADDR)
    -- ============== AXI4 Write Data Channel
    WDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);       -- Write data
    WSTRB      : IN   std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe (bytewise)
    WVALID     : IN   std_logic;                                     -- Write data is valid
    WREADY     : OUT  std_logic;                                     -- Write ready (slave is ready to accept WDATA)
    
    -- ============== AXI4 Write Response Channel Signals
    BRESP      : OUT  std_logic_vector(1 downto 0);                  -- Write response (of slave)
    BVALID     : OUT  std_logic;                                     -- Write response valid (slave accepted WDATA)
    BREADY     : IN   std_logic;                                     -- Response ready (master can accept slave's write response)
    
    -- ============== AXI4 Read Address Channel Signals
    ARADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Read address
    ARVALID    : IN   std_logic;                                     -- Read address valid
    ARREADY    : OUT  std_logic;                                     -- Read address ready (slave is ready to accept ARADDR)
    
    -- ============== AXI4 Read Data Channel Signals
    RDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);       -- Read data
    RRESP      : OUT  std_logic_vector(1 downto 0);                  -- Read response (of slave)
    RVALID     : OUT  std_logic;                                     -- Read valid (slave providing RDATA)
    RREADY     : IN   std_logic;                                     -- Read ready (master ready to receive RDATA)
    
    -- Catapult interface
    idat      : OUT   std_logic_vector(cwidth-1 downto 0)             -- Data into catapult block through this interface
    );
END COMPONENT;

COMPONENT ccs_axi4_lite_slave_outsync
  GENERIC(
    rscid           : integer                 := 1;    -- Resource ID
    -- Catapult Bus Configuration generics
    rst_ph          : integer range 0 to 1    := 0;    -- Reset phase.  1= Positive edge. Default is AXI negative edge
    -- AXI-4 Bus Configuration generics
    ADDR_WIDTH      : integer range 12 to 32  := 32;   -- AXI4 bus address width
    DATA_WIDTH      : integer range 32 to 64  := 32;   -- AXI4 read&write data bus width
    BASE_ADDRESS   : integer                  := 0     -- AXI4 Address that the register is seen at
    );
  PORT(
    -- AXI-4 Interface
    ACLK       : IN   std_logic;                                     -- Rising edge clock
    ARESETn    : IN   std_logic;                                     -- Active LOW asynchronous reset
    
    -- ============== AXI4 Write Address Channel Signals
    AWADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Write address
    AWVALID    : IN   std_logic;                                     -- Write address valid
    AWREADY    : OUT  std_logic;                                     -- Write address ready (slave is ready to accept AWADDR)

    -- ============== AXI4 Write Data Channel
    WDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);       -- Write data
    WSTRB      : IN   std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe - not used in LITE
    WVALID     : IN   std_logic;                                     -- Write data is valid
    WREADY     : OUT  std_logic;                                     -- Write ready (slave is ready to accept WDATA)
    
    -- ============== AXI4 Write Response Channel Signals
    BRESP      : OUT  std_logic_vector(1 downto 0);                  -- Write response (of slave)
    BVALID     : OUT  std_logic;                                     -- Write response valid (slave accepted WDATA)
    BREADY     : IN   std_logic;                                     -- Response ready (master can accept slave's write response)
    
    -- ============== AXI4 Read Address Channel Signals
    ARADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Read address
    ARVALID    : IN   std_logic;                                     -- Read address valid
    ARREADY    : OUT  std_logic;                                     -- Read address ready (slave is ready to accept ARADDR)
    
    -- ============== AXI4 Read Data Channel Signals
    RDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);       -- Read data
    RRESP      : OUT  std_logic_vector(1 downto 0);                  -- Read response (of slave)
    RVALID     : OUT  std_logic;                                     -- Read valid (slave providing RDATA)
    RREADY     : IN   std_logic;                                     -- Read ready (master ready to receive RDATA)
    
    -- Catapult interface
    irdy      : OUT  std_logic;                                      -- Catapult data ready
    ivld      : IN   std_logic;                                      -- Catapult data ready
    triosy    : OUT  std_logic                                       -- Data from catapult
    );

END COMPONENT;

COMPONENT ccs_axi4_lite_slave_insync
  GENERIC(
    rscid           : integer                 := 1;    -- Resource ID
    -- Catapult Bus Configuration generics
    rst_ph          : integer range 0 to 1    := 0;    -- Reset phase.  1= Positive edge. Default is AXI negative edge
    -- AXI-4 Bus Configuration generics
    ADDR_WIDTH      : integer range 12 to 32  := 32;   -- AXI4 bus address width
    DATA_WIDTH      : integer range 32 to 64  := 32;   -- AXI4 read&write data bus width
    BASE_ADDRESS    : integer                 := 0     -- AXI4 Address that the register is seen at
    );
  PORT(
    -- AXI-4 Interface
    ACLK       : IN   std_logic;                                     -- Rising edge clock
    ARESETn    : IN   std_logic;                                     -- Active LOW asynchronous reset
    -- ============== AXI4 Write Address Channel Signals
    AWADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Write address
    AWVALID    : IN   std_logic;                                     -- Write address valid
    AWREADY    : OUT  std_logic;                                     -- Write address ready (slave is ready to accept AWADDR)
    -- ============== AXI4 Write Data Channel
    WDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);       -- Write data
    WSTRB      : IN   std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe (bytewise)
    WVALID     : IN   std_logic;                                     -- Write data is valid
    WREADY     : OUT  std_logic;                                     -- Write ready (slave is ready to accept WDATA)
    
    -- ============== AXI4 Write Response Channel Signals
    BRESP      : OUT  std_logic_vector(1 downto 0);                  -- Write response (of slave)
    BVALID     : OUT  std_logic;                                     -- Write response valid (slave accepted WDATA)
    BREADY     : IN   std_logic;                                     -- Response ready (master can accept slave's write response)
    
    -- ============== AXI4 Read Address Channel Signals
    ARADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Read address
    ARVALID    : IN   std_logic;                                     -- Read address valid
    ARREADY    : OUT  std_logic;                                     -- Read address ready (slave is ready to accept ARADDR)
    
    -- ============== AXI4 Read Data Channel Signals
    RDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);       -- Read data
    RRESP      : OUT  std_logic_vector(1 downto 0);                  -- Read response (of slave)
    RVALID     : OUT  std_logic;                                     -- Read valid (slave providing RDATA)
    RREADY     : IN   std_logic;                                     -- Read ready (master ready to receive RDATA)

    -- Catapult interface
    irdy      : IN    std_logic;
    ivld      : OUT   std_logic;
    triosy    : OUT   std_logic                                       -- // transactor uses 
    );
END COMPONENT;


  -- ==============================================================
  -- APB Components

  -- Used to define the APB bus definition (direction of signals is from the slave's perspective)
  COMPONENT apb_busdef
    GENERIC(
      width        : INTEGER RANGE 1 TO 32 := 32;           -- Number of bits in an element
      addr_width   : INTEGER RANGE 1 TO 32 := 1             -- Number of address bits to address 'words' elements
    );
    PORT(
      -- APB interface
      PCLK      : IN   std_logic;                           -- Rising edge clock
      PRESETn   : IN   std_logic;                           -- Active LOW synchronous reset
      PADDR     : IN   std_logic_vector(addr_width-1 downto 0);  -- APB Bridge driven address bus (32 bit max)
      PSELx     : IN   std_logic;                           -- APB Bridge driven select for this slave
      PWRITE    : IN   std_logic;                           -- APB Bridge driven read/write signal (0=read)
      PENABLE   : IN   std_logic;                           -- APB Bridge driven enable signal
      PWDATA    : IN   std_logic_vector(width-1 downto 0);  -- APB Bridge driven data to write to slave (32 bit max)
      PRDATA    : OUT  std_logic_vector(width-1 downto 0);  -- Slave driven data back to APB Bridge (32 bit max)
      PREADY    : OUT  std_logic;                           -- Slave driven signal to extend transfer cycles (1=ready)
      PSLVERR   : OUT  std_logic                            -- Slave driven signal indicating transfer failed (1=fail)
    );
  END COMPONENT;

  COMPONENT apb_master
    GENERIC(
      words        : INTEGER RANGE 1 TO 256 := 1;           -- Number of addressable elements
      width        : INTEGER RANGE 1 TO 32 := 32;           -- Number of bits in an element
      addr_width   : INTEGER RANGE 1 TO 32 := 1             -- Number of address bits to address 'words' elements
    );
    PORT(
      -- APB interface
      PCLK      : IN   std_logic;                           -- Rising edge clock
      PRESETn   : IN   std_logic;                           -- Active LOW synchronous reset
      PADDR     : OUT  std_logic_vector(30 downto 0);       -- APB Bridge driven address bus (32 bit max)
      PSELx     : OUT  std_logic;                           -- APB Bridge driven select for this slave
      PWRITE    : OUT  std_logic;                           -- APB Bridge driven read/write signal (0=read)
      PENABLE   : OUT  std_logic;                           -- APB Bridge driven enable signal
      PWDATA    : OUT  std_logic_vector(width-1 downto 0);  -- APB Bridge driven data to write to slave (32 bit max)
      PRDATA    : IN   std_logic_vector(width-1 downto 0);  -- Slave driven data back to APB Bridge (32 bit max)
      PREADY    : IN   std_logic;                           -- Slave driven signal to extend transfer cycles (1=ready)
      PSLVERR   : IN   std_logic;                           -- Slave driven signal indicating transfer failed (1=fail)
      -- Catapult interface
      m_rw      : IN   std_logic;                           -- read/write
      m_strobe  : IN   std_logic;                           -- initiate a bus transfer
      m_adr     : IN   std_logic_vector(addr_width-1 downto 0); -- target address
      m_din     : OUT  std_logic_vector(width-1 downto 0);  -- data in from slave
      m_dout    : IN   std_logic_vector(width-1 downto 0);  -- data out to slave
      m_rdy     : OUT  std_logic                            -- ready for transfer (1=ready)
    );
  END COMPONENT;

  -- APB slave memory
  COMPONENT apb_slave_mem
    GENERIC(
      words          : INTEGER RANGE 1 TO 256 := 1;            -- Number of addressable elements
      width          : INTEGER RANGE 1 TO 32 := 32;           -- Number of bits in an element
      addr_width     : INTEGER RANGE 1 TO 32 := 1;            -- Number of address bits to address 'words' elements
      num_rwports    : INTEGER RANGE 1 TO 100 := 1;           -- Number of register file "ports"
      nopreload      : INTEGER RANGE 0 TO 1 := 0              -- 1=disable required preload before Catapult can read
    );
    PORT(
      -- APB interface
      PCLK      : IN   std_logic;                           -- Rising edge clock
      PRESETn   : IN   std_logic;                           -- Active LOW synchronous reset
      PADDR     : IN   std_logic_vector(30 downto 0);       -- APB Bridge driven address bus (32 bit max)
      PSELx     : IN   std_logic;                           -- APB Bridge driven select for this slave
      PWRITE    : IN   std_logic;                           -- APB Bridge driven read/write signal (0=read)
      PENABLE   : IN   std_logic;                           -- APB Bridge driven enable signal
      PWDATA    : IN   std_logic_vector(width-1 downto 0);  -- APB Bridge driven data to write to slave (32 bit max)
      PRDATA    : OUT  std_logic_vector(width-1 downto 0);  -- Slave driven data back to APB Bridge (32 bit max)
      PREADY    : OUT  std_logic;                           -- Slave driven signal to extend transfer cycles (1=ready)
      PSLVERR   : OUT  std_logic;                           -- Slave driven signal indicating transfer failed (1=fail)
      -- Catapult interface
      s_rw      : IN   std_logic_vector(num_rwports-1 downto 0);            -- read/write
      s_strobe  : IN   std_logic_vector(num_rwports-1 downto 0);            -- Catapult attempting read of slave
      s_adr     : IN   std_logic_vector(num_rwports*addr_width-1 downto 0); -- Catapult addressing into memory
      s_din     : OUT  std_logic_vector(num_rwports*width-1 downto 0);      -- Data into catapult block through this interface
      s_dout    : IN   std_logic_vector(num_rwports*width-1 downto 0);      -- Data out to slave from catapult
      s_rdy     : OUT  std_logic_vector(num_rwports-1 downto 0)             -- Slave memory ready for read (1=ready)
    );
  END COMPONENT;

  -- ==============================================================
  -- Internally referenced components

  COMPONENT amba_generic_reg
    GENERIC (
      width    : INTEGER := 1;
      ph_en    : INTEGER RANGE 0 TO 1 := 1;
      has_en   : INTEGER RANGE 0 TO 1 := 1
    );
    PORT (
      clk     : IN  std_logic;
      en      : IN  std_logic;
      arst    : IN  std_logic;
      srst    : IN  std_logic;
      d       : IN  std_logic_vector(width-1 DOWNTO 0);
      z       : OUT std_logic_vector(width-1 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT amba_pipe_ctrl
    GENERIC (
      rscid    : INTEGER := 0;
      width    : INTEGER := 8;
      sz_width : INTEGER := 8;
      fifo_sz  : INTEGER RANGE 0 TO 128 := 8;
      ph_en    : INTEGER RANGE 0 TO 1 := 1
    );
    PORT (
      clk      : IN  std_logic;
      en       : IN  std_logic;
      arst     : IN  std_logic;
      srst     : IN  std_logic;
      din_vld  : IN  std_logic;
      din_rdy  : OUT std_logic;
      din      : IN  std_logic_vector(width-1 DOWNTO 0);
      dout_vld : OUT std_logic;
      dout_rdy : IN  std_logic;
      dout     : OUT std_logic_vector(width-1 DOWNTO 0);
      sd       : OUT std_logic_vector(sz_width-1 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT amba_pipe
    GENERIC (
      rscid    : INTEGER := 0;
      width    : INTEGER := 8;
      sz_width : INTEGER := 8;
      fifo_sz  : INTEGER RANGE 0 TO 128 := 8;
      ph_en    : INTEGER RANGE 0 TO 1 := 1
    );
    PORT (
      -- clock
      clk      : IN  std_logic;
      en       : IN  std_logic;
      arst     : IN  std_logic;
      srst     : IN  std_logic;
      -- writer
      din_rdy  : OUT std_logic;
      din_vld  : IN  std_logic;
      din      : IN  std_logic_vector(width-1 DOWNTO 0);
      -- reader
      dout_rdy : IN  std_logic;
      dout_vld : OUT std_logic;
      dout     : OUT std_logic_vector(width-1 DOWNTO 0);
      -- size
      sz       : OUT std_logic_vector(sz_width-1 DOWNTO 0);
      sz_req   : in  std_logic
    );
  END COMPONENT;

  COMPONENT amba_ctrl_in_buf_wait
    GENERIC (
      width    : INTEGER := 8
    );
    PORT (
      clk      : IN  std_logic;
      arst     : IN  std_logic;
      irdy   : IN  std_logic;
      ivld   : OUT std_logic;
      idat   : OUT std_logic_vector(width-1 DOWNTO 0);
      rdy    : OUT std_logic;
      vld    : IN  std_logic;
      dat    : IN  std_logic_vector(width-1 DOWNTO 0);
      is_idle : out std_logic
    );
  END COMPONENT;

  COMPONENT ML_amba_ctrl_in_buf_wait
    GENERIC (
      width    : INTEGER := 8
    );
    PORT (
      clk      : IN  std_logic;
      arst     : IN  std_logic;
      irdy   : IN  std_logic;
      ivld   : OUT std_logic;
      idat   : OUT std_logic_vector(width-1 DOWNTO 0);
      rdy    : OUT std_logic;
      vld    : IN  std_logic;
      dat    : IN  std_logic_vector(width-1 DOWNTO 0);
      is_idle : out std_logic
    );
  END COMPONENT;

COMPONENT ML_ccs_axi4_master_fpga_instream_core
    GENERIC(
      rscid           : integer                 := 1;     -- Resource ID
      -- Catapult Bus Configuration generics
      frame_size      : integer                 := 16;     -- Number of elements in the frame to be streamed
      op_width        : integer range 1 to 1024 := 1;      -- dummy parameter for cwidth calculation
      cwidth          : integer range 8 to 1024 := 32;     -- Catapult data bus width (multiples of 8)
      addr_w          : integer range 0 to 64   := 4;      -- Catapult address bus width
      rst_ph          : integer range 0 to 1    := 0;      -- Reset phase - negative default
      
      -- AXI-4 Bus Configuration generics
      ADDR_WIDTH      : integer range 12 to 64  := 32;     -- AXI4 bus address width
      DATA_WIDTH      : integer range 8 to 1024 := 32;     -- AXI4 read&write data bus width
      ID_WIDTH        : integer range 1 to 16    := 1;      -- AXI4 ID field width (ignored in this model)
      USER_WIDTH      : integer range 1 to 32   := 1;      -- AXI4 User field width (ignored in this model)
      REGION_MAP_SIZE : integer range 1 to 15   := 1;      -- AXI4 Region Map (ignored in this model)
      xburstsize      : integer                 := 0;      -- Burst size for scverify transactor
      xBASE_ADDRESS   : integer                 := 0;      -- Base address for scverify transactor
      xBASE_ADDRESSU  : integer                 := 0       -- Upper word for 64-bit Base address for scverify transactor
    );
    PORT(
      -- AXI-4 Interface
      ACLK       : IN   std_logic;                                      -- Rising edge clock
      ARESETn    : IN   std_logic;                                      -- Active LOW asynchronous reset

      -- ============== AXI4 Read Address Channel Signals
      ARID       : OUT  std_logic_vector(ID_WIDTH-1 downto 0);          -- Read address ID
      ARADDR     : OUT  std_logic_vector(ADDR_WIDTH-1 downto 0);        -- Read address
      ARLEN      : OUT  std_logic_vector(7 downto 0);                   -- Read burst length
      ARSIZE     : OUT  std_logic_vector(2 downto 0);                   -- Read burst size
      ARBURST    : OUT  std_logic_vector(1 downto 0);                   -- Read burst mode
      ARLOCK     : OUT  std_logic;                                      -- Lock type
      ARCACHE    : OUT  std_logic_vector(3 downto 0);                   -- Memory type
      ARPROT     : OUT  std_logic_vector(2 downto 0);                   -- Protection Type
      ARQOS      : OUT  std_logic_vector(3 downto 0);                   -- Quality of Service
      ARREGION   : OUT  std_logic_vector(3 downto 0);                   -- Region identifier
      ARUSER     : OUT  std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      ARVALID    : OUT  std_logic;                                      -- Read address valid
      ARREADY    : IN   std_logic;                                      -- Read address ready

      -- ============== AXI4 Read Data Channel Signals
      RID        : IN   std_logic_vector(ID_WIDTH-1 downto 0);          -- Read ID tag
      RDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);        -- Read data
      RRESP      : IN   std_logic_vector(1 downto 0);                   -- Read response
      RLAST      : IN   std_logic;                                      -- Read last
      RUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);        -- User signal
      RVALID     : IN   std_logic;                                      -- Read valid
      RREADY     : OUT  std_logic;                                      -- Read ready

      -- Configuration interface
      cfgBaseAddress : IN  std_logic_vector(ADDR_WIDTH-1 downto 0);  
      cfgBurstSize   : IN  std_logic_vector(31 downto 0);            
      cfgTimeout     : IN  std_logic_vector(31 downto 0);            

      -- Catapult interface
      m_re      : IN   std_logic;                                       -- Catapult attempting read of memory over bus
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      rdy       : OUT  std_logic                                        -- For transactor
    );
END COMPONENT;

  
  -- ==============================================================
  -- AMBA Protocol Constants

  -- AxBURST modes
  CONSTANT AXI4_AxBURST_FIXED    : std_logic_vector(1 downto 0) := "00";
  CONSTANT AXI4_AxBURST_INCR     : std_logic_vector(1 downto 0) := "01";
  CONSTANT AXI4_AxBURST_WRAP     : std_logic_vector(1 downto 0) := "10";
  CONSTANT AXI4_AxBURST_RESERVED : std_logic_vector(1 downto 0) := "11";
  -- AxLOCK modes
  CONSTANT AXI4_AxLOCK_NORMAL    : std_logic                    := '0';
  CONSTANT AXI4_AxLOCK_EXCLUSIVE : std_logic                    := '1';
  -- Memory types W and R mostly the xame
  CONSTANT AXI4_AWCACHE_NB        : std_logic_vector(3 downto 0) := "0000";
  CONSTANT AXI4_AWCACHE_B         : std_logic_vector(3 downto 0) := "0001";
  CONSTANT AXI4_AWCACHE_NORM_NCNB : std_logic_vector(3 downto 0) := "0010"; --
  CONSTANT AXI4_AWCACHE_NORM_NCB  : std_logic_vector(3 downto 0) := "0011" ;
  CONSTANT AXI4_AWCACHE_WTNA      : std_logic_vector(3 downto 0) := "0110";
  CONSTANT AXI4_AWCACHE_WTRA      : std_logic_vector(3 downto 0) := "0110";
  CONSTANT AXI4_AWCACHE_WTWA      : std_logic_vector(3 downto 0) := "1110";
  CONSTANT AXI4_AWCACHE_WTRWA     : std_logic_vector(3 downto 0) := "1110";
  CONSTANT AXI4_AWCACHE_WBNA      : std_logic_vector(3 downto 0) := "0111";
  CONSTANT AXI4_AWCACHE_WBRA      : std_logic_vector(3 downto 0) := "0111";
  CONSTANT AXI4_WACACHE_WBWA      : std_logic_vector(3 downto 0) := "1111";
  CONSTANT AXI4_AWCACHE_WBRWA     : std_logic_vector(3 downto 0) := "1111";
  CONSTANT AXI4_ARCACHE_NB        : std_logic_vector(3 downto 0) := "0000";
  CONSTANT AXI4_ARCACHE_B         : std_logic_vector(3 downto 0) := "0001";
  CONSTANT AXI4_ARCACHE_NORM_NCNB : std_logic_vector(3 downto 0) := "0010"; --
  CONSTANT AXI4_ARCACHE_NORM_NCB  : std_logic_vector(3 downto 0) := "0011" ;
  CONSTANT AXI4_ARCACHE_WTNA      : std_logic_vector(3 downto 0) := "1010";
  CONSTANT AXI4_ARCACHE_WTRA      : std_logic_vector(3 downto 0) := "1110";
  CONSTANT AXI4_ARCACHE_WTWA      : std_logic_vector(3 downto 0) := "1010";
  CONSTANT AXI4_ARCACHE_WTRWA     : std_logic_vector(3 downto 0) := "1110";
  CONSTANT AXI4_ARCACHE_WBNA      : std_logic_vector(3 downto 0) := "1011";
  CONSTANT AXI4_ARCACHE_WBRA      : std_logic_vector(3 downto 0) := "1111";
  CONSTANT AXI4_ARCACHE_WBWA      : std_logic_vector(3 downto 0) := "1011";
  CONSTANT AXI4_ARCACHE_WBRWA     : std_logic_vector(3 downto 0) := "1111";
  -- QOS pre-defines
  CONSTANT AXI4_AxQOS_NONE        : std_logic_vector(3 downto 0) := "0000";
  -- AxSIZE byte sizes
  CONSTANT AXI4_AxSIZE_001_BYTE  : std_logic_vector(2 downto 0) := "000";
  CONSTANT AXI4_AxSIZE_002_BYTE  : std_logic_vector(2 downto 0) := "001";
  CONSTANT AXI4_AxSIZE_004_BYTE  : std_logic_vector(2 downto 0) := "010";
  CONSTANT AXI4_AxSIZE_008_BYTE  : std_logic_vector(2 downto 0) := "011";
  CONSTANT AXI4_AxSIZE_016_BYTE  : std_logic_vector(2 downto 0) := "100";
  CONSTANT AXI4_AxSIZE_032_BYTE  : std_logic_vector(2 downto 0) := "101";
  CONSTANT AXI4_AxSIZE_064_BYTE  : std_logic_vector(2 downto 0) := "110";
  CONSTANT AXI4_AxSIZE_128_BYTE  : std_logic_vector(2 downto 0) := "111";
  -- AxPROT bit fields
  CONSTANT AXI4_AxPROT_b0_UNPRIV   : std_logic := '0';
  CONSTANT AXI4_AxPROT_b0_PRIV     : std_logic := '1';
  CONSTANT AXI4_AxPROT_b1_SECURE   : std_logic := '0';
  CONSTANT AXI4_AxPROT_b1_UNSECURE : std_logic := '1';
  CONSTANT AXI4_AxPROT_b2_DATA     : std_logic := '0';
  CONSTANT AXI4_AxPROT_b2_INSTR    : std_logic := '1';
  -- xRESP response codes
  CONSTANT AXI4_xRESP_OKAY         : std_logic_vector(1 downto 0) := "00";
  CONSTANT AXI4_xRESP_EXOKAY       : std_logic_vector(1 downto 0) := "01";
  CONSTANT AXI4_xRESP_SLVERR       : std_logic_vector(1 downto 0) := "10";
  CONSTANT AXI4_xRESP_DECERR       : std_logic_vector(1 downto 0) := "11";

  -- Utility function(s) to support debug needs
  FUNCTION bits ( size : INTEGER) RETURN INTEGER;
  FUNCTION slv2bin(vec: std_logic_vector) RETURN string;
  FUNCTION slv2hex(vec: std_logic_vector) RETURN string;

END PACKAGE amba_comps;

PACKAGE BODY amba_comps IS

   -- Find the number of bits required to represent an unsigned
   -- number less than size
  FUNCTION bits (size : integer) RETURN INTEGER IS
  BEGIN
    IF (size < 0) THEN RETURN 0;
    ELSIF (size = 0) THEN RETURN 1;
    ELSE
      FOR i IN 1 TO size LOOP
        IF (2**i >= size) THEN
          RETURN i;
        END IF;
      END LOOP;
      RETURN 0;
    END IF;
  END;

   -- Convert an std_logic_vector to a (hex)string for printing
   -- vec needs to be a multiple of 4 in size
  FUNCTION slv2hex(vec: std_logic_vector) RETURN string IS
      variable quad : std_logic_vector(3 downto 0);
      constant ne: integer := vec'length/4;
      variable s: string(1 to ne);
   BEGIN
      if vec'length mod 4 /= 0 then
         assert false
         report "slv2hex called with slv lenght that is not a multiple of 4";
         return s;
      end if;
      for i in 0 to ne-1 loop
         quad := vec(4*i+3 downto 4*i);
         case quad is
            when x"0" => s(ne-i) := '0';
            when x"1" => s(ne-i) := '1';
            when x"2" => s(ne-i) := '2';
            when x"3" => s(ne-i) := '3';
            when x"4" => s(ne-i) := '4';
            when x"5" => s(ne-i) := '5';
            when x"6" => s(ne-i) := '6';
            when x"7" => s(ne-i) := '7';
            when x"8" => s(ne-i) := '8';
            when x"9" => s(ne-i) := '9';
            when x"A" => s(ne-i) := 'A';
            when x"B" => s(ne-i) := 'B';
            when x"C" => s(ne-i) := 'C';
            when x"D" => s(ne-i) := 'D';
            when x"E" => s(ne-i) := 'E';
            when x"F" => s(ne-i) := 'F';
            when others => s(ne-i) := '-';
         end case;
      end loop;
      return s;
   END;

   -- Convert an std_logic_vector to a (binary)string for printing
   FUNCTION slv2bin(vec: std_logic_vector) RETURN string IS
      VARIABLE stmp: string(vec'left+1 downto 1);
   BEGIN
      FOR i in vec'reverse_range LOOP
         IF (vec(i) = 'U') THEN
            stmp(i+1) := 'U';
         ELSIF (vec(i) = 'X') THEN
            stmp(i+1) := 'X';
         ELSIF (vec(i) = '0') THEN
            stmp(i+1) := '0';
         ELSIF (vec(i) = '1') THEN
            stmp(i+1) := '1';
         ELSIF (vec(i) = 'Z') THEN
            stmp(i+1) := 'Z';
         ELSIF (vec(i) = 'W') THEN
            stmp(i+1) := 'W';
         ELSIF (vec(i) = 'L') THEN
            stmp(i+1) := 'L';
         ELSIF (vec(i) = 'H') THEN
            stmp(i+1) := 'H';
         ELSE
            stmp(i+1) := '-';
         END IF;
      END LOOP;
      RETURN stmp;
   END;

END amba_comps;


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_slave_mem.vhd 

-- --------------------------------------------------------------------------
-- DESIGN UNIT:        ccs_axi4_slave_mem
--
-- DESCRIPTION:
--   This model implements an AXI-4 Slave memory interface for use in 
--   Interface Synthesis in Catapult. The component details are described in the datasheet.
--
--   AXI/Catapult read/write to the same address in the same cycle is non-determinant
--
-- Notes:
--  1. This model implements a local memory of size {cwidth x depth}.
--     If the Catapult operation requires a memory width cwidth <= AXI bus width
--     this model will zero-pad the high end bits as necessary.
-- CHANGE LOG:
--  01/29/19 - Add reset phase and separate base address for read/write channels
--  11/26/18 - Add burst and other tweaks
--  02/28/18 - Initial implementation
--
-- -------------------------------------------------------------------------------
--  Memory Organization
--   This model is designed to provide storage for only the bits/elements that
--   the Catapult core actually interacts with.
--   The user supplies a base address for the AXI memory store via BASE_ADDRESS
--   parameter.  
-- Example:
--   C++ array declared as "ac_int<7,false>  coeffs[4];"
--   results in a Catapult operator width (op_width) of 7,
--   and cwidth=7 and addr_w=2 (addressing 4 element locations).
--   The library forces DATA_WIDTH to be big enough to hold
--   cwidth bits, rounded up to power-of-2 as needed.
--
--   The AXI address scheme addresses bytes and so increments
--   by number-of-bytes per data transaction, plus the BASE_ADDRESS. 
--   The top and left describe the AXI view of the memory. 
--   The bottom and right describe the Catapult view of the memory.
--
--      AXI-4 SIGNALS
--      ADDR_WIDTH=4        DATA_WIDTH=32
--        AxADDR               xDATA
--                    31                       0
--                    +------------+-----------+
--      BA+0000       |            |           |
--                    +------------+-----------+
--      BA+0000       |            |           |
--                    +------------+===========+
--      BA+1100       |            |  elem3    |    11
--                    +------------+===========+
--      BA+1000       |            |  elem2    |    10
--                    +------------+===========+
--      BA+0100       |            |  elem1    |    01
--                    +------------+===========+
--      BA+0000       |            |  elem0    |    00
--                    +------------+===========+
--                                 6           0
--                                   s_din/out     s_addr
--                                   cwidth=7      addr_w=2
--                                         CATAPULT SIGNALS
--
-- -------------------------------------------------------------------------------

LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;       
  USE std.textio.all;
  USE ieee.std_logic_textio.all;
  USE ieee.math_real.all;


USE work.amba_comps.all;

ENTITY ccs_axi4_slave_mem IS
  GENERIC(
    rscid           : integer                 := 1;    -- Resource ID
    -- Catapult Bus Configuration generics
    depth           : integer                 := 16;   -- Number of addressable elements (up to 20bit address)
    op_width        : integer range 1 to 1024 := 1;    -- dummy parameter for cwidth calculation
    cwidth          : integer range 1 to 1024 := 8;    -- Internal memory data width
    addr_w          : integer range 1 to 64   := 4;    -- Catapult address bus widths
    nopreload       : integer range 0 to 1    := 0;    -- 1= no preload before Catapult can read
    rst_ph          : integer range 0 to 1    := 0;    -- Reset phase.  1= Positive edge. Default is AXI negative edge
    -- AXI-4 Bus Configuration generics
    ADDR_WIDTH      : integer range 12 to 64  := 32;   -- AXI4 bus address width
    DATA_WIDTH      : integer range 8 to 1024 := 32;   -- AXI4 read&write data bus width
    ID_WIDTH        : integer range 1 to 16   := 1;    -- AXI4 ID field width (ignored in this model)
    USER_WIDTH      : integer range 1 to 32   := 1;    -- AXI4 User field width (ignored in this model)
    REGION_MAP_SIZE : integer range 1 to 15   := 1;    -- AXI4 Region Map (ignored in this model)
    wBASE_ADDRESS   : integer                 := 0;    -- AXI4 write channel base address alignment based on data bus width
    rBASE_ADDRESS   : integer                 := 0     -- AXI4 read channel base address alignment based on data bus width
    );
  PORT(
    -- AXI-4 Interface
    ACLK       : IN   std_logic;                                     -- Rising edge clock
    ARESETn    : IN   std_logic;                                     -- Active LOW asynchronous reset
    -- ============== AXI4 Write Address Channel Signals
    AWID       : IN   std_logic_vector(ID_WIDTH-1 downto 0);         -- Write address ID
    AWADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Write address
    AWLEN      : IN   std_logic_vector(7 downto 0);                  -- Write burst length
    AWSIZE     : IN   std_logic_vector(2 downto 0);                  -- Write burst size
    AWBURST    : IN   std_logic_vector(1 downto 0);                  -- Write burst mode
    AWLOCK     : IN   std_logic;                                     -- Lock type
    AWCACHE    : IN   std_logic_vector(3 downto 0);                  -- Memory type
    AWPROT     : IN   std_logic_vector(2 downto 0);                  -- Protection Type
    AWQOS      : IN   std_logic_vector(3 downto 0);                  -- Quality of Service
    AWREGION   : IN   std_logic_vector(3 downto 0);                  -- Region identifier
    AWUSER     : IN   std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
    AWVALID    : IN   std_logic;                                     -- Write address valid
    AWREADY    : OUT  std_logic;                                     -- Write address ready (slave is ready to accept AWADDR)
    -- ============== AXI4 Write Data Channel
    WDATA      : IN   std_logic_vector(DATA_WIDTH-1 downto 0);       -- Write data
    WSTRB      : IN   std_logic_vector((DATA_WIDTH/8)-1 downto 0);   -- Write strobe (bytewise)
    WLAST      : IN   std_logic;                                     -- Write last
    WUSER      : IN   std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
    WVALID     : IN   std_logic;                                     -- Write data is valid
    WREADY     : OUT  std_logic;                                     -- Write ready (slave is ready to accept WDATA)
    
    -- ============== AXI4 Write Response Channel Signals
    BID        : OUT  std_logic_vector(ID_WIDTH-1 downto 0);         -- Response ID tag
    BRESP      : OUT  std_logic_vector(1 downto 0);                  -- Write response (of slave)
    BUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
    BVALID     : OUT  std_logic;                                     -- Write response valid (slave accepted WDATA)
    BREADY     : IN   std_logic;                                     -- Response ready (master can accept slave's write response)
    
    -- ============== AXI4 Read Address Channel Signals
    ARID       : IN   std_logic_vector(ID_WIDTH-1 downto 0);         -- Read address ID
    ARADDR     : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);       -- Read address
    ARLEN      : IN   std_logic_vector(7 downto 0);                  -- Read burst length
    ARSIZE     : IN   std_logic_vector(2 downto 0);                  -- Read burst size
    ARBURST    : IN   std_logic_vector(1 downto 0);                  -- Read burst mode
    ARLOCK     : IN   std_logic;                                     -- Lock type
    ARCACHE    : IN   std_logic_vector(3 downto 0);                  -- Memory type
    ARPROT     : IN   std_logic_vector(2 downto 0);                  -- Protection Type
    ARQOS      : IN   std_logic_vector(3 downto 0);                  -- Quality of Service
    ARREGION   : IN   std_logic_vector(3 downto 0);                  -- Region identifier
    ARUSER     : IN   std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
    ARVALID    : IN   std_logic;                                     -- Read address valid
    ARREADY    : OUT  std_logic;                                     -- Read address ready (slave is ready to accept ARADDR)
    
    -- ============== AXI4 Read Data Channel Signals
    RID        : OUT  std_logic_vector(ID_WIDTH-1 downto 0);         -- Read ID tag
    RDATA      : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);       -- Read data
    RRESP      : OUT  std_logic_vector(1 downto 0);                  -- Read response (of slave)
    RLAST      : OUT  std_logic;                                     -- Read last
    RUSER      : OUT  std_logic_vector(USER_WIDTH-1 downto 0);       -- User signal
    RVALID     : OUT  std_logic;                                     -- Read valid (slave providing RDATA)
    RREADY     : IN   std_logic;                                     -- Read ready (master ready to receive RDATA)
    
    -- Catapult interface
    s_re      : IN   std_logic;                                      -- Catapult attempting read of slave memory
    s_we      : IN   std_logic;                                      -- Catapult attempting write to slave memory
    s_raddr   : IN   std_logic_vector(addr_w-1 downto 0);            -- Catapult addressing into memory (axi_addr = base_addr + s_raddr)
    s_waddr   : IN   std_logic_vector(addr_w-1 downto 0);            -- Catapult addressing into memory (axi_addr = base_addr + s_waddr)
    s_din     : OUT  std_logic_vector(cwidth-1 downto 0);            -- Data into catapult block through this interface
    s_dout    : IN   std_logic_vector(cwidth-1 downto 0);            -- Data out to slave from catapult
    s_rrdy    : OUT  std_logic;                                      -- Read data is valid
    s_wrdy    : OUT  std_logic;                                      -- Slave memory ready for write by Catapult (1=ready)
    is_idle   : OUT  std_logic;                                      -- component is idle - clock can be suppressed
    -- Transactor/scverify support
    tr_write_done : IN std_logic;                                    -- transactor resource preload write done
    s_tdone       : IN std_logic                                     -- Transaction_done in scverify
    );
  

    -- Always rule for checking component parameter values
    --  addr_w == bits(depth)
    --    used to ensure that the width of the address bus on the Catapult side
    --    is capable of addressing 'depth' number of elements. 'depth' will be
    --    determined by the array size operator parameter 'size'
    --    (see the PROP_MAP_size attribute)
    --  ADDR_WIDTH >= addr_w
    --    used to ensure that the address width of the Catapult side is
    --    large enough to accommodate the address width of the AXI-4 bus.
    --    (may need some work to align byte addresses)
    --  ADDR_WIDTH >= 32
    --    ensure that the minimum address space is 4k (AXI requirement)
    --  cwidth == 8 + (op_width>8)*8 + (op_width>16)*16 + (op_width>32)*32 + 
    --                (op_width>64)*64 + (op_width>128)*128 + (op_width>256)*256 +
    --                (op_width>512)*512
    --    used to "round up" the operator width 'op_width' to the next power
    --    of two value (8, 16, 32, 64, 128, 256, 512, 1024)
    --    (see the PROP_MAP_width attribute)
    --  DATA_WIDTH >= cwidth
    --    used to ensure that the Catapult data width is large enough to
    --    accommodate the data width of the AXI-4 bus.
    --    - must be power-of-2 bytes.
    --    - #bits must be some positive integer number of bytes.
    --     Note: user can override DATA_WIDTH from the MAP_TO_MODULE
    --     directive during interface synthesis. No checking is done
    --     to ensure that the override value is a power-of-2 bytes.

END ccs_axi4_slave_mem;

ARCHITECTURE rtl of ccs_axi4_slave_mem IS

  -- Signals for current and next state values
  TYPE   read_state_t IS (axi4r_idle, axi4r_read);
  TYPE   write_state_t IS (axi4w_idle, axi4w_write, axi4w_write_done,  axi4w_catwrite, axi4w_catwrite_done);
  SIGNAL read_state       : read_state_t;
  SIGNAL write_state      : write_state_t;

  -- Memory embedded in this slave
  TYPE   mem_type IS ARRAY (depth-1 downto 0) of std_logic_vector(cwidth-1 downto 0);
  SIGNAL mem                : mem_type;


  -- In/out connections and constant outputs  
  SIGNAL AWREADY_reg : std_logic;
  SIGNAL AWID_reg    : std_logic_vector(ID_WIDTH-1 downto 0);
  SIGNAL WREADY_reg  : std_logic;
  SIGNAL BRESP_reg   : std_logic_vector(1 downto 0);
  SIGNAL BVALID_reg  : std_logic;
  SIGNAL ARREADY_reg : std_logic;
  SIGNAL ARID_reg    : std_logic_vector(ID_WIDTH-1 downto 0);
  SIGNAL RDATA_reg   : std_logic_vector(DATA_WIDTH-1 downto 0);
  SIGNAL RRESP_reg   : std_logic_vector(1 downto 0);
  SIGNAL RLAST_reg   : std_logic;
  SIGNAL RVALID_reg  : std_logic;
  SIGNAL s_din_reg   : std_logic_vector(cwidth-1 downto 0);
  SIGNAL s_rrdy_reg  : std_logic;
  SIGNAL s_wrdy_reg  : std_logic;

  SIGNAL rCatOutOfOrder : std_logic;
  SIGNAL catIsReading   : std_logic;
  SIGNAL next_raddr     : integer;
  
  SIGNAL readBurstCnt: std_logic_vector(7 downto 0);   -- how many are left
  SIGNAL wbase_addr   : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL rbase_addr   : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL address     : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL addrShift : integer;
  SIGNAL readAddr : integer;
  SIGNAL writeAddr : integer;
  SIGNAL int_ARESETn : std_logic;
  
-- catapult address sizes are smaller and cause problems used with axi address sizes
  function extCatAddr(catAddr : std_logic_vector(addr_w -1 downto 0))
    return std_logic_vector is
  
    variable axiAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
  
  begin
    axiAddr := (others => '0');
    axiAddr(addr_w -1 downto 0) := catAddr;
    return axiAddr;
  end function extCatAddr;

BEGIN
  
  int_ARESETn <= ARESETn when (rst_ph = 0) else (not ARESETn);

  addrShift <= 0 when (DATA_WIDTH/8 <= 1)   else 
               1 when (DATA_WIDTH/8 <= 2)   else
               2 when (DATA_WIDTH/8 <= 4)   else
               3 when (DATA_WIDTH/8 <= 8)   else
               4 when (DATA_WIDTH/8 <= 16)  else
               5 when (DATA_WIDTH/8 <= 32)  else
               6 when (DATA_WIDTH/8 <= 64)  else
               7 when (DATA_WIDTH/8 <= 128) else
               0;

  -- unused outputs
  BUSER   <= (others => '0');
  RUSER   <= (others => '0');
  is_idle <= '0';
  
  AWREADY <= AWREADY_reg;
  WREADY  <= WREADY_reg ;
  BID     <= AWID_reg;
  BRESP   <= BRESP_reg  ;
  BVALID  <= BVALID_reg ;
  ARREADY <= ARREADY_reg;
  RID     <= ARID_reg;
  RDATA   <= RDATA_reg  ;
  RRESP   <= RRESP_reg  ;
  RLAST   <= RLAST_reg  ;
  RVALID  <= RVALID_reg ;
  s_din   <= s_din_reg  ;
  s_wrdy  <= s_wrdy_reg and (not s_tdone);
  s_rrdy  <= s_rrdy_reg and (not rCatOutOfOrder);

  wbase_addr <= std_logic_vector(to_unsigned(wBASE_ADDRESS, wbase_addr'length));
  rbase_addr <= std_logic_vector(to_unsigned(rBASE_ADDRESS, rbase_addr'length));
  
  -- pragma translate_off
  -- error checks.  Keep consistent with axi4_master.v/vhd
  -- all data widths the same
  errChk: process
    variable nBytes : std_logic_vector(31 downto 0);
    variable nBytes2 : std_logic_vector(31 downto 0);
  begin  -- process errChk
    nBytes := std_logic_vector(to_unsigned(DATA_WIDTH/8, 32));
    if (cwidth > DATA_WIDTH) then
      report  "Catapult(cwidth=" & integer'image(cwidth) & ") cannot be greater than AXI(DATA_BUS="
        & integer'image(DATA_WIDTH) & ")."
        severity error;
    end if;
    if ( (DATA_WIDTH mod 8) /= 0) then
      report  "Data bus width(DATA_WIDTH=" & integer'image(DATA_WIDTH) & ") not a discrete number of bytes."
        severity error;
    end if;
    if (to_integer(unsigned(nBytes)) = 0) then 
      report  "Data bus width(DATA_WIDTH=" & integer'image(DATA_WIDTH) & ") must be at least 1 byte."
        severity error;
    end if;
    nBytes2 := std_logic_vector(to_unsigned((DATA_WIDTH/8) - 1, 32));
    nBytes2 := nBytes  and nBytes2;
    if ( to_integer(unsigned(nBytes2)) /= 0) then
      report  "Data bus width must be power-of-2 number of bytes(DATA_WIDTH/8=" & integer'image(DATA_WIDTH/8) & ")"
        severity error;
    end if;
    if (ADDR_WIDTH < 12) then
      report  "AXI bus address width(ADDR_WIDTH=" & integer'image(ADDR_WIDTH) & ") must be at least 12 to address 4K memory space."
        severity error;
    end if;
    wait;
  end process errChk;
  -- pragma translate_on
  
  -- AXI4 Bus Read processing
  axiRead: process(ACLK, int_ARESETn)
    -- pragma translate_off
    variable buf : line;
    -- pragma translate_on
    variable useAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable useAddr2 : std_logic_vector(ADDR_WIDTH-1 downto 0);
  begin
    if (int_ARESETn = '0') then
      read_state <= axi4r_idle;
      ARREADY_reg <= '1';
      ARID_reg <= (others => '0');
      RDATA_reg <= (others => '0');
      RRESP_reg <= AXI4_xRESP_OKAY;
      RLAST_reg <= '0';
      RVALID_reg <= '0';
      readAddr <= 0;
      readBurstCnt <= (others => '0');
    elsif rising_edge(ACLK) then
      if ((read_state = axi4r_idle) and (ARVALID = '1')) then
        useAddr := std_logic_vector(shift_right(unsigned(ARADDR) - unsigned(rbase_addr), addrShift));
        -- Protect from out of range addressing
        if (unsigned(useAddr) < depth) then
          if (cwidth < DATA_WIDTH) then
            RDATA_reg(DATA_WIDTH-1 downto cwidth) <= (others => '0');
            RDATA_reg(cwidth-1 downto 0) <= mem(to_integer(unsigned(useAddr)));
          else
            RDATA_reg <= mem(to_integer(unsigned(useAddr)));
          end if;
          --write(buf, string'("Slave AXI1 read:mem[0x"));
          --write(buf,  slv2hex(useAddr));
          --write(buf, string'("]=0x"));
          --write(buf,  slv2hex(mem(to_integer(unsigned(useAddr)))));
          --write(buf, string'(" at T="));
          --write(buf, now);
          --writeline(output, buf);
        else
          -- pragma translate_off
          write(buf, string'("Error:  Out-of-range AXI memory read access:0x"));
          write(buf,  slv2hex(ARADDR));
          write(buf, string'(" at T="));
          write(buf, now);
          writeline(output, buf);
          -- pragma translate_on
        end if;
        RRESP_reg <= AXI4_xRESP_OKAY;
        readAddr <= to_integer(unsigned(useAddr));
        readBurstCnt <= ARLEN;
        if (unsigned(ARLEN) = 0) then
          ARREADY_reg <= '0';
          RLAST_reg <= '1';
        end if;
        RVALID_reg <= '1';
        ARID_reg <= ARID;
        read_state <= axi4r_read;
      elsif (read_state = axi4r_read) then
        if (RREADY = '1') then
          if (unsigned(readBurstCnt) = 0) then
            -- we already sent the last data
            ARREADY_reg <= '1';
            RRESP_reg <= AXI4_xRESP_OKAY;
            RLAST_reg <= '0';
            RVALID_reg <= '0';
            read_state <= axi4r_idle;               
          else
            useAddr2 := std_logic_vector(to_unsigned(readAddr + 1, useAddr2'length));
            readAddr <= readAddr + 1;
            -- Protect from out of range addressing
            if (unsigned(useAddr2) < depth) then
              if (cwidth < DATA_WIDTH) then
                RDATA_reg(DATA_WIDTH-1 downto cwidth) <= (others => '0');
                RDATA_reg(cwidth-1 downto 0) <=  mem(to_integer(unsigned(useAddr2)));
              else
                RDATA_reg <=  mem(to_integer(unsigned(useAddr2)));
              end if;
              --write(buf, string'("Slave AXI2 read:mem[0x"));
              --write(buf,  slv2hex(useAddr2));
              --write(buf, string'("]=0x"));
              --write(buf,  slv2hex(mem(to_integer(unsigned(useAddr2)))));
              --write(buf, string'(" at T="));
              --write(buf, now);
              --writeline(output, buf);
            else
              -- We bursted right off the end of the array
              -- pragma translate_off
              write(buf, string'("Error:  Out-of-range AXI memory read access:0x"));
              write(buf,  slv2hex(ARADDR));
              write(buf, string'(" at T="));
              write(buf, now);
              writeline(output, buf);
              -- pragma translate_on
            end if;
            readBurstCnt <= std_logic_vector(unsigned(readBurstCnt) - 1);
            if ((unsigned(readBurstCnt) - 1) = 0) then
              ARREADY_reg <= '0';        
              RRESP_reg <= AXI4_xRESP_OKAY;
              RLAST_reg <= '1';
            end if;
            RVALID_reg <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;  -- axiRead process

   -- AXI and catapult write processing.
   -- Catapult write is one-cycle long so basically a write can happen
   -- in any axi state.  AXI has precedence in that catapult write is processed
   -- first at each cycle
  axiWrite: process(ACLK, int_ARESETn)
    -- pragma translate_off
    variable buf : line;
    -- pragma translate_on
    variable i : integer;
    variable useAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable useAddr2 : std_logic_vector(ADDR_WIDTH-1 downto 0);
  begin
    if (int_ARESETn = '0') then
      AWREADY_reg <= '1';
      AWID_reg <= (others => '0');
      WREADY_reg <= '1';
      BRESP_reg <= AXI4_xRESP_OKAY;
      BVALID_reg <= '0';
      write_state <= axi4w_idle;
      writeAddr <= 0;
      s_wrdy_reg <= '0';
      -- pragma translate_off
      for i in 0 to depth-1 loop 
        mem(i) <= (others => '0');
      end loop;
      -- pragma translate_on
    elsif rising_edge(ACLK) then
      -- When in idle state, catapult and AXI can both initiate writes.
      -- If to the same address, then AXI wins... in this implementation
      if ((s_we = '1') and (write_state = axi4w_idle) and (s_tdone = '0')) then
        mem(to_integer(unsigned(s_waddr))) <= s_dout;
        --write(buf, string'("Slave CAT1 write:mem[0x"));
        --write(buf,  slv2hex(s_waddr));
        --write(buf, string'("]=0x"));
        --write(buf,  slv2hex(s_dout));
        --write(buf, string'(" at T="));
        --write(buf, now);
        --writeline(output, buf);
      end if;
      if ((write_state = axi4w_idle) and (AWVALID = '1')) then
        s_wrdy_reg <= '0';
        AWREADY_reg <= '0';
        AWID_reg <= AWID;
        useAddr := std_logic_vector(shift_right(unsigned(AWADDR) - unsigned(wbase_addr), addrShift));
        -- $display("AWADDR=%d base_address=%d addrShift=%d useAddr=%d at T=%t",
        -- AWADDR, base_address, addrShift, useAddr, $time);
        if (WVALID = '1') then
          -- allow for address and data to be presented in one cycle
          -- Check for the write to be masked
          if (unsigned(WSTRB) /= 0) then -- a byte at a time.  Watch for cwidth much less than DATA_WIDTH
            if (unsigned(useAddr) < depth) then
              for i in 0 to (DATA_WIDTH/8)-1 loop 
                if (WSTRB(i) = '1') then
                  if ((8*i) < cwidth) then
                    if (8*(i+1) <= cwidth) then
                      mem(to_integer(unsigned(useAddr))) (8*(i+1)-1 downto (8*i)) <= WDATA(8*(i+1)-1 downto (8*i));
                    else
                      mem(to_integer(unsigned(useAddr))) (cwidth-1 downto (8*i)) <= WDATA(cwidth-1 downto (8*i));
                    end if;
                  end if;
                end if;
              end loop;
              
              --write(buf, string'("Slave AXI1 write:mem[0x"));
              --write(buf,  slv2hex(useAddr));
              --write(buf, string'("]=0x"));
              --write(buf,  slv2hex(WDATA));
              --write(buf, string'(" at T="));
              --write(buf, now);
              --writeline(output, buf);
            else
              -- pragma translate_off
              write(buf, string'("Error:  Out-of-range AXI memory write access:0x"));
              write(buf,  slv2hex(AWADDR));
              write(buf, string'(" at T="));
              write(buf, now);
              writeline(output, buf);
              -- pragma translate_on
            end if;
          end if;
        end if;
        writeAddr <= to_integer(unsigned(useAddr));
        if ((WLAST = '1') and (WVALID = '1')) then
          write_state <= axi4w_write_done;
          WREADY_reg <= '0';
          BRESP_reg <= AXI4_xRESP_OKAY;
          BVALID_reg <= '1';
        else
          write_state <= axi4w_write;
        end if;
      elsif (write_state = axi4w_write) then
        if (WVALID = '1') then
          useAddr2 := std_logic_vector(to_unsigned(writeAddr+1, useAddr2'length));
          if (unsigned(WSTRB) /= 0) then
            if (unsigned(useAddr2) < depth) then
              for i in 0 to (DATA_WIDTH/8)-1 loop 
                if (WSTRB(i) = '1') then
                  if ((8*i) < cwidth) then
                    if (8*(i+1) <= cwidth) then
                      mem(to_integer(unsigned(useAddr2))) (8*(i+1)-1 downto (8*i)) <= WDATA(8*(i+1)-1 downto (8*i));
                    else
                      mem(to_integer(unsigned(useAddr2))) (cwidth-1 downto (8*i)) <= WDATA(cwidth-1 downto (8*i));
                    end if;
                  end if;
                end if;
              end loop;
              --write(buf, string'("Slave AXI2 write:mem[0x"));
              --write(buf,  slv2hex(useAddr2));
              --write(buf, string'("]=0x"));
              --write(buf,  slv2hex(WDATA));
              --write(buf, string'(" at T="));
              --write(buf, now);
              --writeline(output, buf);
            else 
              -- pragma translate_off
              write(buf, string'("Error:  Out-of-range AXI memory write access:0x"));
              write(buf,  slv2hex(AWADDR));
              write(buf, string'(" at T="));
              write(buf, now);
              writeline(output, buf);
              -- pragma translate_on
            end if;
          end if;
          writeAddr <= to_integer(unsigned(useAddr2));
          if (WLAST = '1') then
            write_state <= axi4w_write_done;
            WREADY_reg <= '0';
            BRESP_reg <= AXI4_xRESP_OKAY;
            BVALID_reg <= '1';
          end if;
        end if;
      elsif (write_state = axi4w_write_done) then
        if (BREADY = '1') then
          AWREADY_reg <= '1';
          WREADY_reg <= '1';
          BRESP_reg <= AXI4_xRESP_OKAY;
          BVALID_reg <= '0';
          write_state <= axi4w_idle;
          s_wrdy_reg <= '1';
        end if;
      else
        s_wrdy_reg <= '1';
      end if;
    end if;
  end process; -- axiWrite

  rCatOutOfOrder <= '1' when (s_re = '1') and
                             (s_rrdy_reg = '1') and
                             (catIsReading = '1') and
                             (next_raddr /= to_integer(unsigned(extCatAddr(s_raddr)))+1)
                  else '0';
  
  -- Catapult read processing
  catRead : process(ACLK, int_ARESETn)
    -- pragma translate_off
    variable buf : line;
    -- pragma translate_on
  begin
    if (int_ARESETn = '0') then
      s_din_reg <= (others => '0');
      s_rrdy_reg <= '0';
      catIsReading <= '0';
      next_raddr <= 0;
    elsif rising_edge(ACLK) then
      -- Catapult has read access to memory
      if (tr_write_done = '1') then
        if ( s_re = '1') then
          --$display("Slave CAT read.  Addr=%x Data=%d T=%t", s_raddr, mem[s_raddr], $time);
          --write(buf, string'("Slave CAT read.  Addr=0x"));
          --write(buf,  slv2hex(s_raddr));
          --write(buf, string'(" Data=0x"));
          --write(buf,  slv2hex(mem(to_integer(unsigned(s_raddr)))));
          --write(buf, string'(" T="));
          --write(buf, now);
          --writeline(output, buf);
          if ((catIsReading = '1') and (rCatOutOfOrder /= '1')) then
            -- Make sure next_addr hasnt incremented off the end
            if (next_raddr < depth) then 
              s_din_reg <= mem(next_raddr);
              next_raddr <= next_raddr+1;
            else
              s_rrdy_reg <= '0';
              catIsReading <= '0';
              next_raddr <= 0;                  
            end if;
          else
            s_din_reg <= mem(to_integer(unsigned(s_raddr)));
            s_rrdy_reg <= '1';
            next_raddr <= to_integer(unsigned(extCatAddr(s_raddr)))+1;
            if ((catIsReading = '1') and (rCatOutOfOrder = '1')) then
              catIsReading <= '0';
            else
              catIsReading <= '1';
            end if;
          end if;
        else
          s_rrdy_reg <= '0';
          catIsReading <= '0';
          next_raddr <= 0;
        end if;
      else
        s_rrdy_reg <= '0';
        catIsReading <= '0';
        next_raddr <= 0;
      end if;
    end if;
  end process;    -- catRead 
  
END rtl;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
PACKAGE mgc_io_sync_pkg_v2 IS

COMPONENT mgc_io_sync_v2
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

END mgc_io_sync_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_io_sync_v2 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_io_sync_v2;

ARCHITECTURE beh OF mgc_io_sync_v2 IS
BEGIN

  lz <= ld;

END beh;


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_in_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_pkg_v1 IS

COMPONENT ccs_in_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    dat    : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_in_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    dat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_in_v1;

ARCHITECTURE beh OF ccs_in_v1 IS
BEGIN

  idat <= dat;

END beh;


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/src/funcs.vhd 

-- a package of attributes that give verification tools a hint about
-- the function being implemented
PACKAGE attributes IS
  ATTRIBUTE CALYPTO_FUNC : string;
  ATTRIBUTE CALYPTO_DATA_ORDER : string;
end attributes;

-----------------------------------------------------------------------
-- Package that declares synthesizable functions needed for RTL output
-----------------------------------------------------------------------

LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

PACKAGE funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC;
--   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

   FUNCTION maximum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION minimum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER;
   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2 : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;
   
-----------------------------------------------------------------
-- logic functions
-----------------------------------------------------------------

   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION or_v (inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- mux functions
-----------------------------------------------------------------

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC_VECTOR;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- latch functions
-----------------------------------------------------------------
   FUNCTION lat_s(dinput: STD_LOGIC       ; clk: STD_LOGIC; doutput: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- tristate functions
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC       ; control: STD_LOGIC) RETURN STD_LOGIC;
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: SIGNED  ) RETURN STD_LOGIC;

   -- RETURN 2 bits (left => lt, right => eq)
   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED;
 
   FUNCTION fabs(arg1: SIGNED  ) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "**" (l, r: UNSIGNED) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "**" (l, r: SIGNED  ) RETURN SIGNED  ;

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-- *_stdar functions use shift functions from std_logic_arith
-----------------------------------------------------------------

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;

   -----------------------------------------------------------------
   -- *_stdar functions use shift functions from std_logic_arith
   -----------------------------------------------------------------
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC;
   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE;
   --FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR ;

   FUNCTION ceil_log2(size : NATURAL) return NATURAL;
   FUNCTION bits(size : NATURAL) return NATURAL;    

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   
END funcs;


--------------------------- B O D Y ----------------------------


PACKAGE BODY funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC IS
     BEGIN IF arg1 THEN RETURN '1'; ELSE RETURN '0'; END IF; END;
--   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
--     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;

   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
     VARIABLE result: STD_LOGIC_VECTOR(0 DOWNTO 0);
   BEGIN
     result := (0 => arg1);
     RETURN result;
   END;

   FUNCTION maximum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 > arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION minimum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 < arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;

   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := input1'LENGTH;
     ALIAS input1a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input1;
     ALIAS input2a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input2;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     --synopsys translate_off
     FOR i IN len-1 DOWNTO 0 LOOP
       result(i) := resolved(input1a(i) & input2a(i));
     END LOOP;
     --synopsys translate_on
     RETURN result;
   END;

   FUNCTION resolve_unsigned(input1: UNSIGNED; input2: UNSIGNED) RETURN UNSIGNED IS
   BEGIN RETURN UNSIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

   FUNCTION resolve_signed(input1: SIGNED; input2: SIGNED) RETURN SIGNED IS
   BEGIN RETURN SIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

-----------------------------------------------------------------
-- Logic Functions
-----------------------------------------------------------------

   FUNCTION "not"(arg1: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN UNSIGNED(not STD_LOGIC_VECTOR(arg1)); END;
   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(and_v(inputs, 1)); END;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(or_v(inputs, 1)); END;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(xor_v(inputs, 1)); END;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result AND inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

   FUNCTION or_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     -- this if is added as a quick fix for a bug in catapult evaluating the loop even if inputs'LENGTH==1
     -- see dts0100971279
     IF icnt2 > 1 THEN
       FOR i IN icnt2-1 DOWNTO 1 LOOP
         inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
         result := result OR inputsx(olenM1 DOWNTO 0);
       END LOOP;
     END IF;
     RETURN result;
   END;

   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result XOR inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

-----------------------------------------------------------------
-- Muxes
-----------------------------------------------------------------
   
   FUNCTION mux_sel2_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(1 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 4;
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector( size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "01" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "10" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "11" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel3_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(2 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 8;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "001" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "010" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "011" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN "100" =>
       result := inputs0(5*size-1 DOWNTO 4*size);
     WHEN "101" =>
       result := inputs0(6*size-1 DOWNTO 5*size);
     WHEN "110" =>
       result := inputs0(7*size-1 DOWNTO 6*size);
     WHEN "111" =>
       result := inputs0(8*size-1 DOWNTO 7*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel4_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(3 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 16;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "0000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "0001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "0010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "0011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "0100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "0101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "0110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "0111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "1000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "1001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "1010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "1011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "1100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "1101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "1110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "1111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel5_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(4 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 32;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0 );
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "00001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "00010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "00011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "00100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "00101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "00110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "00111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "01000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "01001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "01010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "01011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "01100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "01101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "01110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "01111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "10000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "10001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "10010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "10011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "10100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "10101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "10110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "10111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "11000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "11001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "11010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "11011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "11100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "11101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "11110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "11111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel6_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(5 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 64;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "000001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "000010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "000011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "000100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "000101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "000110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "000111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "001000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "001001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "001010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "001011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "001100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "001101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "001110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "001111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "010000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "010001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "010010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "010011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "010100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "010101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "010110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "010111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "011000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "011001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "011010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "011011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "011100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "011101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "011110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "011111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN "100000" =>
       result := inputs0( 33*size-1 DOWNTO 32*size);
     WHEN "100001" =>
       result := inputs0( 34*size-1 DOWNTO 33*size);
     WHEN "100010" =>
       result := inputs0( 35*size-1 DOWNTO 34*size);
     WHEN "100011" =>
       result := inputs0( 36*size-1 DOWNTO 35*size);
     WHEN "100100" =>
       result := inputs0( 37*size-1 DOWNTO 36*size);
     WHEN "100101" =>
       result := inputs0( 38*size-1 DOWNTO 37*size);
     WHEN "100110" =>
       result := inputs0( 39*size-1 DOWNTO 38*size);
     WHEN "100111" =>
       result := inputs0( 40*size-1 DOWNTO 39*size);
     WHEN "101000" =>
       result := inputs0( 41*size-1 DOWNTO 40*size);
     WHEN "101001" =>
       result := inputs0( 42*size-1 DOWNTO 41*size);
     WHEN "101010" =>
       result := inputs0( 43*size-1 DOWNTO 42*size);
     WHEN "101011" =>
       result := inputs0( 44*size-1 DOWNTO 43*size);
     WHEN "101100" =>
       result := inputs0( 45*size-1 DOWNTO 44*size);
     WHEN "101101" =>
       result := inputs0( 46*size-1 DOWNTO 45*size);
     WHEN "101110" =>
       result := inputs0( 47*size-1 DOWNTO 46*size);
     WHEN "101111" =>
       result := inputs0( 48*size-1 DOWNTO 47*size);
     WHEN "110000" =>
       result := inputs0( 49*size-1 DOWNTO 48*size);
     WHEN "110001" =>
       result := inputs0( 50*size-1 DOWNTO 49*size);
     WHEN "110010" =>
       result := inputs0( 51*size-1 DOWNTO 50*size);
     WHEN "110011" =>
       result := inputs0( 52*size-1 DOWNTO 51*size);
     WHEN "110100" =>
       result := inputs0( 53*size-1 DOWNTO 52*size);
     WHEN "110101" =>
       result := inputs0( 54*size-1 DOWNTO 53*size);
     WHEN "110110" =>
       result := inputs0( 55*size-1 DOWNTO 54*size);
     WHEN "110111" =>
       result := inputs0( 56*size-1 DOWNTO 55*size);
     WHEN "111000" =>
       result := inputs0( 57*size-1 DOWNTO 56*size);
     WHEN "111001" =>
       result := inputs0( 58*size-1 DOWNTO 57*size);
     WHEN "111010" =>
       result := inputs0( 59*size-1 DOWNTO 58*size);
     WHEN "111011" =>
       result := inputs0( 60*size-1 DOWNTO 59*size);
     WHEN "111100" =>
       result := inputs0( 61*size-1 DOWNTO 60*size);
     WHEN "111101" =>
       result := inputs0( 62*size-1 DOWNTO 61*size);
     WHEN "111110" =>
       result := inputs0( 63*size-1 DOWNTO 62*size);
     WHEN "111111" =>
       result := inputs0( 64*size-1 DOWNTO 63*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS  --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     CONSTANT size   : POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   : POSITIVE := inputs'LENGTH / 2;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT inputs'LENGTH = olen * 2 SEVERITY FAILURE;
     --synopsys translate_on
       CASE sel IS
       WHEN '1'
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
            =>
         result := inputs0( size-1 DOWNTO 0);
       WHEN '0' 
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
            =>
         result := inputs0(2*size-1  DOWNTO size);
       WHEN others =>
         --synopsys translate_off
         result := resolve_std_logic_vector(inputs0(size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
         --synopsys translate_on
       END CASE;
       RETURN result;
   END;
--   BEGIN RETURN mux_v(inputs, TO_STDLOGICVECTOR(sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     ALIAS    sel0   : STD_LOGIC_VECTOR( sel'LENGTH-1 DOWNTO 0 ) IS sel;

     VARIABLE sellen : INTEGER RANGE 2-sel'LENGTH TO sel'LENGTH;
     CONSTANT size   : POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   : POSITIVE := inputs'LENGTH / 2**sel'LENGTH;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
     TYPE inputs_array_type is array(natural range <>) of std_logic_vector( olen - 1 DOWNTO 0);
     VARIABLE inputs_array : inputs_array_type( 2**sel'LENGTH - 1 DOWNTO 0);
   BEGIN
     sellen := sel'LENGTH;
     --synopsys translate_off
     ASSERT inputs'LENGTH = olen * 2**sellen SEVERITY FAILURE;
     sellen := 2-sellen;
     --synopsys translate_on
     CASE sellen IS
     WHEN 1 =>
       CASE sel0(0) IS

       WHEN '1' 
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
            =>
         result := inputs0(  size-1 DOWNTO 0);
       WHEN '0' 
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
            =>
         result := inputs0(2*size-1 DOWNTO size);
       WHEN others =>
         --synopsys translate_off
         result := resolve_std_logic_vector(inputs0( size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
         --synopsys translate_on
       END CASE;
     WHEN 2 =>
       result := mux_sel2_v(inputs, not sel);
     WHEN 3 =>
       result := mux_sel3_v(inputs, not sel);
     WHEN 4 =>
       result := mux_sel4_v(inputs, not sel);
     WHEN 5 =>
       result := mux_sel5_v(inputs, not sel);
     WHEN 6 =>
       result := mux_sel6_v(inputs, not sel);
     WHEN others =>
       -- synopsys translate_off
       IF(Is_X(sel0)) THEN
         result := (others => 'X');
       ELSE
       -- synopsys translate_on
         FOR i in 0 to 2**sel'LENGTH - 1 LOOP
           inputs_array(i) := inputs0( ((i + 1) * olen) - 1  DOWNTO i*olen);
         END LOOP;
         result := inputs_array(CONV_INTEGER( (UNSIGNED(NOT sel0)) ));
       -- synopsys translate_off
       END IF;
       -- synopsys translate_on
     END CASE;
     RETURN result;
   END;

 
-----------------------------------------------------------------
-- Latches
-----------------------------------------------------------------

   FUNCTION lat_s(dinput: STD_LOGIC; clk: STD_LOGIC; doutput: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN mux_s(STD_LOGIC_VECTOR'(doutput & dinput), clk); END;

   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR ; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     --synopsys translate_off
     ASSERT dinput'LENGTH = doutput'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     RETURN mux_v(doutput & dinput, clk);
   END;

-----------------------------------------------------------------
-- Tri-States
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC; control: STD_LOGIC) RETURN STD_LOGIC IS
--   BEGIN RETURN TO_STDLOGIC(tri_v(TO_STDLOGICVECTOR(dinput), control)); END;
--
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR ; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
--     VARIABLE result: STD_LOGIC_VECTOR(dinput'range);
--   BEGIN
--     CASE control IS
--     WHEN '0' | 'L' =>
--       result := (others => 'Z');
--     WHEN '1' | 'H' =>
--       FOR i IN dinput'range LOOP
--         result(i) := to_UX01(dinput(i));
--       END LOOP;
--     WHEN others =>
--       -- synopsys translate_off
--       result := (others => 'X');
--       -- synopsys translate_on
--     END CASE;
--     RETURN result;
--   END;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;

   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     VARIABLE diff: UNSIGNED(l'LENGTH DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     diff := ('0'&l) - ('0'&r);
     RETURN diff(l'LENGTH);
   END;
   FUNCTION "<"(l, r: SIGNED  ) RETURN STD_LOGIC IS
   BEGIN
     RETURN (UNSIGNED(l) < UNSIGNED(r)) xor (l(l'LEFT) xor r(r'LEFT));
   END;

   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION "<=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">"(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;
   FUNCTION ">=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;

   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN
     --synopsys translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     RETURN not or_s(l xor r);
   END;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   --some functions to placate spyglass
   FUNCTION mult_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a*b;
   END mult_natural;

   FUNCTION div_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a/b;
   END div_natural;

   FUNCTION mod_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a mod b;
   END mod_natural;

   FUNCTION add_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a+b;
   END add_unsigned;

   FUNCTION sub_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a-b;
   END sub_unsigned;

   FUNCTION sub_int(a,b : INTEGER) RETURN INTEGER IS
   BEGIN
     return a-b;
   END sub_int;

   FUNCTION concat_0(b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return '0' & b;
   END concat_0;

   FUNCTION concat_uns(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a&b;
   END concat_uns;

   FUNCTION concat_vect(a,b : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     return a&b;
   END concat_vect;





   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED IS
     CONSTANT ninps : NATURAL := arg'LENGTH / width;
     ALIAS    arg0  : UNSIGNED(arg'LENGTH-1 DOWNTO 0) IS arg;
     VARIABLE result: UNSIGNED(width-1 DOWNTO 0);
     VARIABLE from  : INTEGER;
     VARIABLE dto   : INTEGER;
   BEGIN
     --synopsys translate_off
     ASSERT arg'LENGTH = width * ninps SEVERITY FAILURE;
     --synopsys translate_on
     result := (OTHERS => '0');
     FOR i IN ninps-1 DOWNTO 0 LOOP
       --result := result + arg0((i+1)*width-1 DOWNTO i*width);
       from := mult_natural((i+1), width)-1; --2.1.6.3
       dto  := mult_natural(i,width); --2.1.6.3
       result := add_unsigned(result , arg0(from DOWNTO dto) );
     END LOOP;
     RETURN result;
   END faccu;

   FUNCTION  fabs (arg1: SIGNED) RETURN UNSIGNED IS
   BEGIN
     CASE arg1(arg1'LEFT) IS
     WHEN '1'
     --synopsys translate_off
          | 'H'
     --synopsys translate_on
       =>
       RETURN UNSIGNED'("0") - UNSIGNED(arg1);
     WHEN '0'
     --synopsys translate_off
          | 'L'
     --synopsys translate_on
       =>
       RETURN UNSIGNED(arg1);
     WHEN others =>
       RETURN resolve_unsigned(UNSIGNED(arg1), UNSIGNED'("0") - UNSIGNED(arg1));
     END CASE;
   END;

   PROCEDURE divmod(l, r: UNSIGNED; rdiv, rmod: OUT UNSIGNED) IS
     CONSTANT llen: INTEGER := l'LENGTH;
     CONSTANT rlen: INTEGER := r'LENGTH;
     CONSTANT llen_plus_rlen: INTEGER := llen + rlen;
     VARIABLE lbuf: UNSIGNED(llen+rlen-1 DOWNTO 0);
     VARIABLE diff: UNSIGNED(rlen DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT rdiv'LENGTH = llen AND rmod'LENGTH = rlen SEVERITY FAILURE;
     --synopsys translate_on
     lbuf := (others => '0');
     lbuf(llen-1 DOWNTO 0) := l;
     FOR i IN rdiv'range LOOP
       diff := sub_unsigned(lbuf(llen_plus_rlen-1 DOWNTO llen-1) ,(concat_0(r)));
       rdiv(i) := not diff(rlen);
       IF diff(rlen) = '0' THEN
         lbuf(llen_plus_rlen-1 DOWNTO llen-1) := diff;
       END IF;
       lbuf(llen_plus_rlen-1 DOWNTO 1) := lbuf(llen_plus_rlen-2 DOWNTO 0);
     END LOOP;
     rmod := lbuf(llen_plus_rlen-1 DOWNTO llen);
   END divmod;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rdiv;
   END "/";

   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rmod;
   END;

   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN l MOD r; END;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rdiv := UNSIGNED'("0") - rdiv;
     END IF;
     RETURN SIGNED(rdiv); -- overflow problem "1000" / "11"
   END "/";

   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
     CONSTANT rnul: UNSIGNED(r'LENGTH-1 DOWNTO 0) := (others => '0');
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     IF rmod /= rnul AND to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rmod := UNSIGNED(r) + rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "MOD";

   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "REM";

   FUNCTION mult_unsigned(l,r : UNSIGNED) return UNSIGNED is
   BEGIN
     return l*r; 
   END mult_unsigned;

   FUNCTION "**" (l, r : UNSIGNED) RETURN UNSIGNED IS
     CONSTANT llen  : NATURAL := l'LENGTH;
     VARIABLE result: UNSIGNED(llen-1 DOWNTO 0);
     VARIABLE fak   : UNSIGNED(llen-1 DOWNTO 0);
   BEGIN
     fak := l;
     result := (others => '0'); result(0) := '1';
     FOR i IN r'reverse_range LOOP
       --was:result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(result & (result*fak)), r(i)));
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR( concat_uns(result , mult_unsigned(result,fak) )), r(i)));

       fak := mult_unsigned(fak , fak);
     END LOOP;
     RETURN result;
   END "**";

   FUNCTION "**" (l, r : SIGNED) RETURN SIGNED IS
     CONSTANT rlen  : NATURAL := r'LENGTH;
     ALIAS    r0    : SIGNED(0 TO r'LENGTH-1) IS r;
     VARIABLE result: SIGNED(l'range);
   BEGIN
     CASE r(r'LEFT) IS
     WHEN '0'
   --synopsys translate_off
          | 'L'
   --synopsys translate_on
     =>
       result := SIGNED(UNSIGNED(l) ** UNSIGNED(r0(1 TO r'LENGTH-1)));
     WHEN '1'
   --synopsys translate_off
          | 'H'
   --synopsys translate_on
     =>
       result := (others => '0');
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END "**";

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-----------------------------------------------------------------

   FUNCTION add_nat(arg1 : NATURAL; arg2 : NATURAL ) RETURN NATURAL IS
   BEGIN
     return (arg1 + arg2);
   END;
   
--   FUNCTION UNSIGNED_2_BIT_VECTOR(arg1 : NATURAL; arg2 : NATURAL ) RETURN BIT_VECTOR IS
--   BEGIN
--     return (arg1 + arg2);
--   END;
   
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(SIGNED(result), arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: SIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: SIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_signed(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
        =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
        =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_signed(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;


   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     --SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: NATURAL range 1 TO len;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => '0');
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         --was:temp(i2+sw) := result(i2);
         temp_idx := add_nat(i2,sw);
         temp(temp_idx) := result(i2);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: sw_range;
     VARIABLE result_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => sbit);
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         -- was: temp(i2) := result(i2+sw);
         result_idx := add_nat(i2,sw);
         temp(i2) := result(result_idx);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;


   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := arg1'LENGTH;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     VARIABLE temp: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     SUBTYPE sw_range IS NATURAL range 0 TO len-1;
     VARIABLE sw: sw_range;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     result := (others=>'0');
     result := arg1;
     sw := sdir MOD len;
     FOR i IN arg2'reverse_range LOOP
       EXIT WHEN sw = 0;
       IF signd2 AND i = arg2'LEFT THEN 
         sw := sub_int(len,sw); 
       END IF;
       -- temp := result(len-sw-1 DOWNTO 0) & result(len-1 DOWNTO len-sw)
       FOR i2 IN len-1 DOWNTO 0 LOOP
         --was: temp((i2+sw) MOD len) := result(i2);
         temp_idx := add_nat(i2,sw) MOD len;
         temp(temp_idx) := result(i2);
       END LOOP;
       result := mux_v(STD_LOGIC_VECTOR(concat_vect(result,temp)), arg2(i));
       sw := mod_natural(mult_natural(sw,2), len);
     END LOOP;
     RETURN result;
   END frot;

   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, -1); END;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, -1); END;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC IS
     CONSTANT len : INTEGER := vec'LENGTH;
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
   BEGIN
     IF index >= len OR index < 0 THEN
       RETURN 'X';
     END IF;
     RETURN vec0(index);
   END;

   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'LENGTH;
     CONSTANT indexPwidthM1 : INTEGER := index+width-1; --2.1.6.3
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
     CONSTANT xxx : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (others => 'X');
   BEGIN
     IF index+width > len OR index < 0 THEN
       RETURN xxx;
     END IF;
     RETURN vec0(indexPwidthM1 DOWNTO index);
   END;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'LENGTH;
     VARIABLE vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     CONSTANT xxx : STD_LOGIC_VECTOR(len-1 DOWNTO 0) := (others => 'X');
   BEGIN
     vec0 := vec;
     IF index >= len OR index < 0 THEN
       RETURN xxx;
     END IF;
     vec0(index) := dinput;
     RETURN vec0;
   END;

   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE IS
     VARIABLE n_b : POSITIVE;
     VARIABLE p_v : NATURAL;
   BEGIN
     p_v := p;
     FOR i IN 1 TO 32 LOOP
       p_v := div_natural(p_v,2);
       n_b := i;
       EXIT WHEN (p_v = 0);
     END LOOP;
     RETURN n_b;
   END;


--   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
--
--     CONSTANT vlen: INTEGER := vec'LENGTH;
--     CONSTANT ilen: INTEGER := dinput'LENGTH;
--     CONSTANT max_shift: INTEGER := vlen-ilen;
--     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
--     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => 'X');
--     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
--     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
--     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
--     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
--   BEGIN
--     inp := (others => '0');
--     mask := (others => '0');
--
--     IF index > max_shift OR index < 0 THEN
--       RETURN xxx;
--     END IF;
--
--     shift := CONV_UNSIGNED(index, shift'LENGTH);
--     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
--     mask(ilen-1 DOWNTO 0) := ones;
--     inp := fshl(inp, shift, vlen);
--     mask := fshl(mask, shift, vlen);
--     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
--     RETURN vec0;
--   END;

   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR IS

     type enable_matrix is array (0 to enable'LENGTH-1 ) of std_logic_vector(byte_width-1 downto 0);
     CONSTANT vlen: INTEGER := vec'LENGTH;
     CONSTANT ilen: INTEGER := dinput'LENGTH;
     CONSTANT max_shift: INTEGER := vlen-ilen;
     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => 'X');
     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask2: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE enables: enable_matrix;
     VARIABLE cat_enables: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0 );
     VARIABLE lsbi : INTEGER;
     VARIABLE msbi : INTEGER;

   BEGIN
     cat_enables := (others => '0');
     lsbi := 0;
     msbi := byte_width-1;
     inp := (others => '0');
     mask := (others => '0');

     IF index > max_shift OR index < 0 THEN
       RETURN xxx;
     END IF;

     --initialize enables
     for i in 0 TO (enable'LENGTH-1) loop
       enables(i)  := (others => enable(i));
       cat_enables(msbi downto lsbi) := enables(i) ;
       lsbi := msbi+1;
       msbi := msbi+byte_width;
     end loop;


     shift := CONV_UNSIGNED(index, shift'LENGTH);
     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
     mask(ilen-1 DOWNTO 0) := UNSIGNED((STD_LOGIC_VECTOR(ones) AND cat_enables));
     inp := fshl(inp, shift, vlen);
     mask := fshl(mask, shift, vlen);
     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
     RETURN vec0;
   END;


   FUNCTION ceil_log2(size : NATURAL) return NATURAL is
     VARIABLE cnt : NATURAL;
     VARIABLE res : NATURAL;
   begin
     cnt := 1;
     res := 0;
     while (cnt < size) loop
       res := res + 1;
       cnt := 2 * cnt;
     end loop;
     return res;
   END;
   
   FUNCTION bits(size : NATURAL) return NATURAL is
   begin
     return ceil_log2(size);
   END;

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR) IS
   BEGIN
     s    := conv_std_logic_vector(a, s'LENGTH) xor conv_std_logic_vector(b, s'LENGTH) xor conv_std_logic_vector(c, s'LENGTH);
     cout := ( (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(b, cout'LENGTH)) or (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(c, cout'LENGTH)) or (conv_std_logic_vector(b, cout'LENGTH) and conv_std_logic_vector(c, cout'LENGTH)) );
   END PROCEDURE csa;

   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR) IS
   BEGIN
     s    := conv_std_logic_vector(a, s'LENGTH) xor conv_std_logic_vector(b, s'LENGTH);
     cout := (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(b, cout'LENGTH));
   END PROCEDURE csha;

END funcs;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_comps.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;

PACKAGE mgc_comps IS
 
FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER;
FUNCTION ceil_log2(size : NATURAL) return NATURAL;
 

COMPONENT mgc_not
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_and
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_nand
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_or
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_nor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_xor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_xnor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mux
  GENERIC (
    width  :  NATURAL;
    ctrlw  :  NATURAL;
    p2ctrlw : NATURAL := 0
  );
  PORT (
    a: in  std_logic_vector(width*(2**ctrlw) - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw            - 1 DOWNTO 0);
    z: out std_logic_vector(width            - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mux1hot
  GENERIC (
    width  : NATURAL;
    ctrlw  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ctrlw - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw       - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_reg_pos
  GENERIC (
    width  : NATURAL;
    has_a_rst : NATURAL;  -- 0 to 1
    a_rst_on  : NATURAL;  -- 0 to 1
    has_s_rst : NATURAL;  -- 0 to 1
    s_rst_on  : NATURAL;  -- 0 to 1
    has_enable : NATURAL; -- 0 to 1
    enable_on  : NATURAL  -- 0 to 1
  );
  PORT (
    clk: in  std_logic;
    d  : in  std_logic_vector(width-1 DOWNTO 0);
    z  : out std_logic_vector(width-1 DOWNTO 0);
    sync_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    sync_rst : in std_logic;
    async_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    async_rst : in std_logic;
    en : in std_logic
  );
END COMPONENT;

COMPONENT mgc_reg_neg
  GENERIC (
    width  : NATURAL;
    has_a_rst : NATURAL;  -- 0 to 1
    a_rst_on  : NATURAL;  -- 0 to 1
    has_s_rst : NATURAL;  -- 0 to 1
    s_rst_on  : NATURAL;   -- 0 to 1
    has_enable : NATURAL; -- 0 to 1
    enable_on  : NATURAL -- 0 to 1
  );
  PORT (
    clk: in  std_logic;
    d  : in  std_logic_vector(width-1 DOWNTO 0);
    z  : out std_logic_vector(width-1 DOWNTO 0);
    sync_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    sync_rst : in std_logic;
    async_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    async_rst : in std_logic;
    en : in std_logic
  );
END COMPONENT;

COMPONENT mgc_generic_reg
  GENERIC(
   width: natural := 8;
   ph_clk: integer range 0 to 1 := 1; -- clock polarity, 1=rising_edge
   ph_en: integer range 0 to 1 := 1;
   ph_a_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   ph_s_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   a_rst_used: integer range 0 to 1 := 1;
   s_rst_used: integer range 0 to 1 := 0;
   en_used: integer range 0 to 1 := 1
  );
  PORT(
   d: std_logic_vector(width-1 downto 0);
   clk: in std_logic;
   en: in std_logic;
   a_rst: in std_logic;
   s_rst: in std_logic;
   q: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_equal
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a : in  std_logic_vector(width-1 DOWNTO 0);
    b : in  std_logic_vector(width-1 DOWNTO 0);
    eq: out std_logic;
    ne: out std_logic
  );
END COMPONENT;

COMPONENT mgc_shift_l
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_r
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_bl
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_br
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_rot
  GENERIC (
    width  : NATURAL;
    width_s: NATURAL;
    signd_s: NATURAL;      -- 0:unsigned 1:signed
    sleft  : NATURAL;      -- 0:right 1:left;
    log2w  : NATURAL := 0; -- LOG2(width)
    l2wp2  : NATURAL := 0  --2**LOG2(width)
  );
  PORT (
    a : in  std_logic_vector(width  -1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width  -1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_sub
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add_ci
  GENERIC (
    width_a : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width_a, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width_a, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width_a,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width_a,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_addc
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add3
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_c : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_c : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(ifeqsel(width_c,0,width,width_c)-1 DOWNTO 0);
    d: in  std_logic_vector(0 DOWNTO 0);
    e: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_sub_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_addc_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     c: in std_logic_vector(0 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_addsub
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    add: in  std_logic;
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_accu
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_abs
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_z : NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul_fast
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_z : NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul_pipe
  GENERIC (
    width_a       : NATURAL;
    signd_a       : NATURAL;
    width_b       : NATURAL;
    signd_b       : NATURAL;
    width_z       : NATURAL; -- <= width_a + width_b
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 

  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul2add1
  GENERIC (
    gentype : NATURAL;
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_b2 : NATURAL;
    signd_b2 : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_d2 : NATURAL;
    signd_d2 : NATURAL;
    width_e : NATURAL;
    signd_e : NATURAL;
    width_z : NATURAL;   -- <= max(width_a + width_b, width_c + width_d)+1
    isadd   : NATURAL;
    add_b2  : NATURAL;
    add_d2  : NATURAL
  );
  PORT (
    a   : in  std_logic_vector(width_a-1 DOWNTO 0);
    b   : in  std_logic_vector(width_b-1 DOWNTO 0);
    b2  : in  std_logic_vector(width_b2-1 DOWNTO 0);
    c   : in  std_logic_vector(width_c-1 DOWNTO 0);
    d   : in  std_logic_vector(width_d-1 DOWNTO 0);
    d2  : in  std_logic_vector(width_d2-1 DOWNTO 0);
    cst : in  std_logic_vector(width_e-1 DOWNTO 0);
    z   : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul2add1_pipe
  GENERIC (
    gentype : NATURAL;
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_b2 : NATURAL;
    signd_b2 : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_d2 : NATURAL;
    signd_d2 : NATURAL;
    width_e : NATURAL;
    signd_e : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c + width_d)+1
    isadd   : NATURAL;
    add_b2   : NATURAL;
    add_d2   : NATURAL;
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 
  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    b2     : in  std_logic_vector(width_b2-1 DOWNTO 0);
    c     : in  std_logic_vector(width_c-1 DOWNTO 0);
    d     : in  std_logic_vector(width_d-1 DOWNTO 0);
    d2     : in  std_logic_vector(width_d2-1 DOWNTO 0);
    cst   : in  std_logic_vector(width_e-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_muladd1
  -- operation is z = a * (b + d) + c + cst
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_cst : NATURAL;
    signd_cst : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c, width_cst)+1
    add_axb : NATURAL;
    add_c   : NATURAL;
    add_d   : NATURAL
  );
  PORT (
    a:   in  std_logic_vector(width_a-1 DOWNTO 0);
    b:   in  std_logic_vector(width_b-1 DOWNTO 0);
    c:   in  std_logic_vector(width_c-1 DOWNTO 0);
    cst: in  std_logic_vector(width_cst-1 DOWNTO 0);
    d:   in  std_logic_vector(width_d-1 DOWNTO 0);
    z:   out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_muladd1_pipe
  -- operation is z = a * (b + d) + c + cst
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_cst : NATURAL;
    signd_cst : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c, width_cst)+1
    add_axb : NATURAL;
    add_c   : NATURAL;
    add_d   : NATURAL;
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 
  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    c     : in  std_logic_vector(width_c-1 DOWNTO 0);
    cst   : in  std_logic_vector(width_cst-1 DOWNTO 0);
    d     : in  std_logic_vector(width_d-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mulacc_pipe
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c)+1
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 
  );
  PORT (
    a         : in  std_logic_vector(width_a-1 DOWNTO 0);
    b         : in  std_logic_vector(width_b-1 DOWNTO 0);
    c         : in  std_logic_vector(width_c-1 DOWNTO 0);
    load      : in  std_logic;
    datavalid : in  std_logic;
    clk       : in  std_logic;
    en        : in  std_logic;
    a_rst     : in  std_logic;
    s_rst     : in  std_logic;
    z         : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul2acc_pipe
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_e : NATURAL;
    signd_e : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c)+1
    add_cxd : NATURAL;
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 
  );
  PORT (
    a         : in  std_logic_vector(width_a-1 DOWNTO 0);
    b         : in  std_logic_vector(width_b-1 DOWNTO 0);
    c         : in  std_logic_vector(width_c-1 DOWNTO 0);
    d         : in  std_logic_vector(width_d-1 DOWNTO 0);
    e         : in  std_logic_vector(width_e-1 DOWNTO 0);
    load      : in  std_logic;
    datavalid : in  std_logic;
    clk       : in  std_logic;
    en        : in  std_logic;
    a_rst     : in  std_logic;
    s_rst     : in  std_logic;
    z         : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_div
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_a-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mod
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_rem
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_csa
  GENERIC (
     width : NATURAL
  );
  PORT (
     a: in std_logic_vector(width-1 downto 0);
     b: in std_logic_vector(width-1 downto 0);
     c: in std_logic_vector(width-1 downto 0);
     s: out std_logic_vector(width-1 downto 0);
     cout: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_csha
  GENERIC (
     width : NATURAL
  );
  PORT (
     a: in std_logic_vector(width-1 downto 0);
     b: in std_logic_vector(width-1 downto 0);
     s: out std_logic_vector(width-1 downto 0);
     cout: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_rom
    GENERIC (
      rom_id : natural := 1;
      size : natural := 33;
      width : natural := 32
      );
    PORT (
      data_in : std_logic_vector((size*width)-1 downto 0);
      addr : std_logic_vector(ceil_log2(size)-1 downto 0);
      data_out : out std_logic_vector(width-1 downto 0)
    );
END COMPONENT;

END mgc_comps;

PACKAGE BODY mgc_comps IS
 
   FUNCTION ceil_log2(size : NATURAL) return NATURAL is
     VARIABLE cnt : NATURAL;
     VARIABLE res : NATURAL;
   begin
     cnt := 1;
     res := 0;
     while (cnt < size) loop
       res := res + 1;
       cnt := 2 * cnt;
     end loop;
     return res;
   END;

   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;
 
END mgc_comps;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_mul_pipe_beh.vhd 

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_mul_pipe IS
  GENERIC (
    width_a       : NATURAL;
    signd_a       : NATURAL;
    width_b       : NATURAL;
    signd_b       : NATURAL;
    width_z       : NATURAL; -- <= width_a + width_b
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 

  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END mgc_mul_pipe;

LIBRARY IEEE;

USE ieee.std_logic_arith.all;

ARCHITECTURE beh OF mgc_mul_pipe IS
  TYPE reg_array_type is array(natural range<>) of std_logic_vector(width_z-1 DOWNTO 0); 
  SIGNAL xz : std_logic_vector(width_a+width_b DOWNTO 0);

--MF Added pipelined input
    signal a_f     : STD_LOGIC_VECTOR(width_a-1 downto 0); 
    signal b_f     : STD_LOGIC_VECTOR(width_b-1 downto 0);
   type a_array is array (natural range <>) of STD_LOGIC_VECTOR(width_a-1 downto 0);
   type b_array is array (natural range <>) of STD_LOGIC_VECTOR(width_b-1 downto 0);
BEGIN
  n_inreg_gt_0: if n_inreg > 0 generate
    GENPOS_INREG: IF clock_edge = 1 GENERATE
     I0: process(clk)
        variable a_in_reg: a_array(n_inreg-1 downto 0);
        variable b_in_reg: b_array(n_inreg-1 downto 0);
      begin
        if (clk'event and clk = '1' ) then
          if (conv_integer(en) = enable_active) then
            for i in n_inreg - 2 downto 0 loop
              a_in_reg(i+1) := a_in_reg(i);
              b_in_reg(i+1) := b_in_reg(i);
            end loop;                                                                                                                             
            a_in_reg(0) := a;
            b_in_reg(0) := b;

            a_f <= a_in_reg(n_inreg-1);             
            b_f <= b_in_reg(n_inreg-1);    
                                                   
          end if;
        end if;
      end process;
    END GENERATE;
  
   GENNEG_INREG: IF clock_edge = 0 GENERATE
     I0: process(clk)
        variable a_in_reg: a_array(n_inreg-1 downto 0);
        variable b_in_reg: b_array(n_inreg-1 downto 0);
      begin
        if (clk'event and clk = '0' ) then
          if (conv_integer(en) = enable_active) then
            for i in n_inreg - 2 downto 0 loop
              a_in_reg(i+1) := a_in_reg(i);
              b_in_reg(i+1) := b_in_reg(i);
            end loop;                                                                                                                             
            a_in_reg(0) := a;
            b_in_reg(0) := b;            
                                 
            a_f <= a_in_reg(n_inreg-1);             
            b_f <= b_in_reg(n_inreg-1);
                                                        
          end if;
        end if;
      end process;
    END GENERATE;
  END GENERATE;

  n_inreg_eq_0: if n_inreg = 0 generate
    a_f <= a;
    b_f <= b;
  end generate n_inreg_eq_0;

  xz <= '0'&(unsigned(a_f) * unsigned(b_f)) WHEN signd_a = 0 AND signd_b = 0 ELSE
            (  signed(a_f) * unsigned(b_f)) WHEN signd_a = 1 AND signd_b = 0 ELSE
            (unsigned(a_f) *   signed(b_f)) WHEN signd_a = 0 AND signd_b = 1 ELSE
        '0'&(  signed(a_f) *   signed(b_f));

  GENPOS: IF clock_edge = 1 GENERATE
    PROCESS (clk)
    VARIABLE reg_array: reg_array_type(stages-2 DOWNTO 0);
    BEGIN
      IF ( clk'EVENT AND clk = '1') THEN
        IF ( conv_integer(en) = enable_active) THEN
          FOR I IN stages-2 DOWNTO 1 LOOP
            reg_array(I) := reg_array(I-1);
          END LOOP;
          reg_array(0) := xz(width_z-1 DOWNTO 0);
          z <= reg_array(stages-2);
        END IF;
      END IF;
    END PROCESS;
  END GENERATE;

  GENNEG: IF clock_edge = 0 GENERATE
    PROCESS (clk)
    VARIABLE reg_array: reg_array_type(stages-2 DOWNTO 0);
    BEGIN
      IF ( clk'EVENT AND clk = '0') THEN
        IF ( conv_integer(en) = enable_active) THEN
          FOR I IN stages-2 DOWNTO 1 LOOP
            reg_array(I) := reg_array(I-1);
          END LOOP;
          reg_array(0) := xz(width_z-1 DOWNTO 0);
          z <= reg_array(stages-2);
        END IF;
      END IF;
    END PROCESS;
  END GENERATE;
END beh;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_comps_v5.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;

PACKAGE mgc_shift_comps_v5 IS

COMPONENT mgc_shift_l_v5
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_r_v5
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_bl_v5
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_br_v5
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

END mgc_shift_comps_v5;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_bl_beh_v5.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_shift_bl_v5 IS
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END mgc_shift_bl_v5;

LIBRARY ieee;

USE ieee.std_logic_arith.all;

ARCHITECTURE beh OF mgc_shift_bl_v5 IS

  FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
    CONSTANT len: INTEGER := input1'LENGTH;
    ALIAS input1a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input1;
    ALIAS input2a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input2;
    VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
  BEGIN
    result := (others => '0');
    --synopsys translate_off
    FOR i IN len-1 DOWNTO 0 LOOP
      result(i) := resolved(input1a(i) & input2a(i));
    END LOOP;
    --synopsys translate_on
    RETURN result;
  END;

  FUNCTION resolve_unsigned(input1: UNSIGNED; input2: UNSIGNED)
  RETURN UNSIGNED IS
  BEGIN
    RETURN UNSIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1),
                                             STD_LOGIC_VECTOR(input2)));
  END;

  FUNCTION resolve_signed(input1: SIGNED; input2: SIGNED)
  RETURN SIGNED IS
  BEGIN
    RETURN SIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1),
                                           STD_LOGIC_VECTOR(input2)));
  END;

  FUNCTION "not"(arg1: UNSIGNED) RETURN UNSIGNED IS
    BEGIN RETURN UNSIGNED(not STD_LOGIC_VECTOR(arg1)); END;

  FUNCTION maximum (arg1,arg2: INTEGER) RETURN INTEGER IS
  BEGIN
    IF(arg1 > arg2) THEN
      RETURN(arg1) ;
    ELSE
      RETURN(arg2) ;
    END IF;
  END;

  FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
    CONSTANT ilen: INTEGER := arg1'LENGTH;
    CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
    CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
    CONSTANT len: INTEGER := maximum(ilen, olen);
    VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
  BEGIN
    result := (others => sbit);
    result(ilenub DOWNTO 0) := arg1;
    result := shl(result, arg2);
    RETURN result(olenM1 DOWNTO 0);
  END;

  FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
    CONSTANT ilen: INTEGER := arg1'LENGTH;
    CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
    CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
    CONSTANT len: INTEGER := maximum(ilen, olen);
    VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
  BEGIN
    result := (others => sbit);
    result(ilenub DOWNTO 0) := arg1;
    result := shr(result, arg2);
    RETURN result(olenM1 DOWNTO 0);
  END;

  FUNCTION fshl_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
    CONSTANT ilen: INTEGER := arg1'LENGTH;
    CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
    CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
    CONSTANT len: INTEGER := maximum(ilen, olen);
    VARIABLE result: SIGNED(len-1 DOWNTO 0);
  BEGIN
    result := (others => sbit);
    result(ilenub DOWNTO 0) := arg1;
    result := shl(SIGNED(result), arg2);
    RETURN result(olenM1 DOWNTO 0);
  END;

  FUNCTION fshr_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
    CONSTANT ilen: INTEGER := arg1'LENGTH;
    CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
    CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
    CONSTANT len: INTEGER := maximum(ilen, olen);
    VARIABLE result: SIGNED(len-1 DOWNTO 0);
  BEGIN
    result := (others => sbit);
    result(ilenub DOWNTO 0) := arg1;
    result := shr(result, arg2);
    RETURN result(olenM1 DOWNTO 0);
  END;

 FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
    CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
    ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
    CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
    ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
    VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
    VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
  BEGIN
    result := (others=>'0');
    arg1x_pad(arg1l+1) := sbit;
    arg1x_pad(arg1l downto 0) := arg1x;
    IF arg2l = 0 THEN
      RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
    -- ELSIF arg1l = 0 THEN
    --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
    ELSE
      CASE arg2x(arg2l) IS
      WHEN '0'
    --synopsys translate_off
           | 'L'
    --synopsys translate_on
      =>
        RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
      WHEN '1'
    --synopsys translate_off
           | 'H'
    --synopsys translate_on
      =>
        RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
      WHEN others =>
        --synopsys translate_off
        result := resolve_unsigned(
          fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
          fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
        );
        --synopsys translate_on
        RETURN result;
      END CASE;
    END IF;
  END;

  FUNCTION fshl_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
    CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
    ALIAS    arg1x: SIGNED(arg1l DOWNTO 0) IS arg1;
    CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
    ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
    VARIABLE arg1x_pad: SIGNED(arg1l+1 DOWNTO 0);
    VARIABLE result: SIGNED(olen-1 DOWNTO 0);
  BEGIN
    result := (others=>'0');
    arg1x_pad(arg1l+1) := sbit;
    arg1x_pad(arg1l downto 0) := arg1x;
    IF arg2l = 0 THEN
      RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
    -- ELSIF arg1l = 0 THEN
    --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
    ELSE
      CASE arg2x(arg2l) IS
      WHEN '0'
      --synopsys translate_off
           | 'L'
      --synopsys translate_on
      =>
        RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
      WHEN '1'
      --synopsys translate_off
           | 'H'
      --synopsys translate_on
      =>
        RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
      WHEN others =>
        --synopsys translate_off
        result := resolve_signed(
          fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
          fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
        );
        --synopsys translate_on
        RETURN result;
      END CASE;
    END IF;
  END;

  FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE)
  RETURN UNSIGNED IS
  BEGIN
    RETURN fshl_stdar(arg1, arg2, '0', olen);
  END;

  FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE)
  RETURN SIGNED IS
  BEGIN
    RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen);
  END;

BEGIN
UNSGNED:  IF signd_a = 0 GENERATE
    z <= std_logic_vector(fshl_stdar(unsigned(a), signed(s), width_z));
  END GENERATE;
SGNED:  IF signd_a /= 0 GENERATE
    z <= std_logic_vector(fshl_stdar(  signed(a), signed(s), width_z));
  END GENERATE;
END beh;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW.vhd 
-- Memory Type:            BLOCK
-- Operating Mode:         Simple Dual Port (2-Port)
-- Clock Mode:             Single Clock
-- 
-- RTL Code RW Resolution: RBW
-- Catapult RW Resolution: RBW
-- 
-- HDL Work Library:       Xilinx_RAMS_lib
-- Component Name:         BLOCK_1R1W_RBW
-- Latency = 1:            RAM with no registers on inputs or outputs
--         = 2:            adds embedded register on RAM output
--         = 3:            adds fabric registers to non-clock input RAM pins
--         = 4:            adds fabric register to output (driven by embedded register from latency=2)

LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;
PACKAGE BLOCK_1R1W_RBW_pkg IS
  COMPONENT BLOCK_1R1W_RBW IS
  GENERIC (
    addr_width : integer := 8 ;
    data_width : integer := 7 ;
    depth : integer := 256 ;
    latency : integer := 1 
    
  );
  PORT (
    clk : in std_logic ;
    clken : in std_logic ;
    d : in std_logic_vector(data_width-1 downto 0) ;
    q : out std_logic_vector(data_width-1 downto 0) ;
    radr : in std_logic_vector(addr_width-1 downto 0) ;
    wadr : in std_logic_vector(addr_width-1 downto 0) ;
    we : in std_logic 
    
  );
  END COMPONENT;
END BLOCK_1R1W_RBW_pkg;
LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;
ENTITY BLOCK_1R1W_RBW IS
  GENERIC (
    addr_width : integer := 8 ;
    data_width : integer := 7 ;
    depth : integer := 256 ;
    latency : integer := 1 
    
  );
  PORT (
    clk : in std_logic ;
    clken : in std_logic ;
    d : in std_logic_vector(data_width-1 downto 0) ;
    q : out std_logic_vector(data_width-1 downto 0) ;
    radr : in std_logic_vector(addr_width-1 downto 0) ;
    wadr : in std_logic_vector(addr_width-1 downto 0) ;
    we : in std_logic 
    
  );
 END BLOCK_1R1W_RBW;
ARCHITECTURE rtl OF BLOCK_1R1W_RBW IS
  TYPE ram_t IS ARRAY (depth-1 DOWNTO 0) OF std_logic_vector(data_width-1 DOWNTO 0);
  SIGNAL mem : ram_t := (OTHERS => (OTHERS => '0'));
  ATTRIBUTE ram_style: STRING;
  ATTRIBUTE ram_style OF mem : SIGNAL IS "block";
  ATTRIBUTE syn_ramstyle: STRING;
  ATTRIBUTE syn_ramstyle OF mem : SIGNAL IS "block";
  
  SIGNAL ramq : std_logic_vector(data_width-1 downto 0);
  
BEGIN
-- Port Map
-- readA :: CLOCK clk ENABLE clken DATA_OUT q ADDRESS radr
-- writeA :: CLOCK clk ENABLE clken DATA_IN d ADDRESS wadr WRITE_ENABLE we

-- Access memory with non-registered inputs (latency = 1||2)
  IN_PIN :  IF latency < 3 GENERATE
  BEGIN
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
         IF (clken = '1') THEN
          -- workaround for simulation when read address out-of-range during inactive cycle
          --pragma translate_off
          IF (to_integer(unsigned(radr)) < depth) THEN
          --pragma translate_on
          ramq <= mem(to_integer(unsigned(radr)));
          --pragma translate_off
          END IF;
          --pragma translate_on
          IF (we = '1') THEN
            mem(to_integer(unsigned(wadr))) <= d;
          END IF;
        END IF;
      END IF;
    END PROCESS;
    
  END GENERATE IN_PIN; 

-- Register all non-clock inputs (latency = 3||4)
  IN_REG :  IF latency > 2 GENERATE
    SIGNAL radr_reg : std_logic_vector(addr_width-1 downto 0);
    SIGNAL d_reg : std_logic_vector(data_width-1 downto 0);
    SIGNAL wadr_reg : std_logic_vector(addr_width-1 downto 0);
    SIGNAL we_reg : std_logic;
    
  BEGIN
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          radr_reg <= radr;
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          d_reg <= d;
          wadr_reg <= wadr;
          we_reg <= we;
        END IF;
      END IF;
    END PROCESS;
    
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
         IF (clken = '1') THEN
          -- workaround for simulation when read address out-of-range during inactive cycle
          --pragma translate_off
          IF (to_integer(unsigned(radr_reg)) < depth) THEN
          --pragma translate_on
          ramq <= mem(to_integer(unsigned(radr_reg)));
          --pragma translate_off
          END IF;
          --pragma translate_on
          IF (we_reg = '1') THEN
            mem(to_integer(unsigned(wadr_reg))) <= d_reg;
          END IF;
        END IF;
      END IF;
    END PROCESS;
    
  END GENERATE IN_REG;

  out_ram : IF latency = 1 GENERATE
  BEGIN
    q <= ramq;
    
  END GENERATE out_ram;

  out_reg1 : IF ((latency = 2) OR (latency = 3)) GENERATE
    SIGNAL tmpq : std_logic_vector(data_width-1 downto 0);
    
  BEGIN
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          tmpq <= ramq;
        END IF;
      END IF;
    END PROCESS;
    
    q <= tmpq;
    
  END GENERATE out_reg1;

  out_reg2 : IF latency = 4 GENERATE
    SIGNAL tmp1q : std_logic_vector(data_width-1 downto 0);
    
    SIGNAL tmp2q : std_logic_vector(data_width-1 downto 0);
    
  BEGIN
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          tmp1q <= ramq;
        END IF;
      END IF;
    END PROCESS;
    
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          tmp2q <= tmp1q;
        END IF;
      END IF;
    END PROCESS;
    
    q <= tmp2q;
    
  END GENERATE out_reg2;


END rtl;

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   jd4691@newnano.poly.edu
--  Generated date: Mon Sep 13 22:55:17 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen;

ARCHITECTURE v2 OF hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen;

ARCHITECTURE v2 OF hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    S1_OUTER_LOOP_for_C_4_tr0 : IN STD_LOGIC;
    S1_OUTER_LOOP_C_0_tr0 : IN STD_LOGIC;
    S2_COPY_LOOP_for_C_3_tr0 : IN STD_LOGIC;
    S2_COPY_LOOP_C_0_tr0 : IN STD_LOGIC;
    S2_INNER_LOOP1_for_C_24_tr0 : IN STD_LOGIC;
    S2_INNER_LOOP1_C_0_tr0 : IN STD_LOGIC;
    S2_INNER_LOOP2_for_C_23_tr0 : IN STD_LOGIC;
    S2_INNER_LOOP2_C_0_tr0 : IN STD_LOGIC;
    S2_INNER_LOOP2_C_0_tr1 : IN STD_LOGIC;
    S2_INNER_LOOP3_for_C_23_tr0 : IN STD_LOGIC;
    S2_INNER_LOOP3_C_0_tr0 : IN STD_LOGIC;
    S34_OUTER_LOOP_for_C_12_tr0 : IN STD_LOGIC;
    S34_OUTER_LOOP_C_0_tr0 : IN STD_LOGIC;
    S5_COPY_LOOP_for_C_3_tr0 : IN STD_LOGIC;
    S5_COPY_LOOP_C_0_tr0 : IN STD_LOGIC;
    S5_INNER_LOOP1_for_C_24_tr0 : IN STD_LOGIC;
    S5_INNER_LOOP1_C_0_tr0 : IN STD_LOGIC;
    S5_INNER_LOOP2_for_C_23_tr0 : IN STD_LOGIC;
    S5_INNER_LOOP2_C_0_tr0 : IN STD_LOGIC;
    S5_INNER_LOOP2_C_0_tr1 : IN STD_LOGIC;
    S5_INNER_LOOP3_for_C_23_tr0 : IN STD_LOGIC;
    S5_INNER_LOOP3_C_0_tr0 : IN STD_LOGIC;
    S6_OUTER_LOOP_for_C_3_tr0 : IN STD_LOGIC;
    S6_OUTER_LOOP_C_0_tr0 : IN STD_LOGIC
  );
END hybrid_core_core_fsm;

ARCHITECTURE v2 OF hybrid_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for hybrid_core_core_fsm_1
  TYPE hybrid_core_core_fsm_1_ST IS (main_C_0, S1_OUTER_LOOP_for_C_0, S1_OUTER_LOOP_for_C_1,
      S1_OUTER_LOOP_for_C_2, S1_OUTER_LOOP_for_C_3, S1_OUTER_LOOP_for_C_4, S1_OUTER_LOOP_C_0,
      S2_COPY_LOOP_for_C_0, S2_COPY_LOOP_for_C_1, S2_COPY_LOOP_for_C_2, S2_COPY_LOOP_for_C_3,
      S2_COPY_LOOP_C_0, S2_OUTER_LOOP_C_0, S2_INNER_LOOP1_for_C_0, S2_INNER_LOOP1_for_C_1,
      S2_INNER_LOOP1_for_C_2, S2_INNER_LOOP1_for_C_3, S2_INNER_LOOP1_for_C_4, S2_INNER_LOOP1_for_C_5,
      S2_INNER_LOOP1_for_C_6, S2_INNER_LOOP1_for_C_7, S2_INNER_LOOP1_for_C_8, S2_INNER_LOOP1_for_C_9,
      S2_INNER_LOOP1_for_C_10, S2_INNER_LOOP1_for_C_11, S2_INNER_LOOP1_for_C_12,
      S2_INNER_LOOP1_for_C_13, S2_INNER_LOOP1_for_C_14, S2_INNER_LOOP1_for_C_15,
      S2_INNER_LOOP1_for_C_16, S2_INNER_LOOP1_for_C_17, S2_INNER_LOOP1_for_C_18,
      S2_INNER_LOOP1_for_C_19, S2_INNER_LOOP1_for_C_20, S2_INNER_LOOP1_for_C_21,
      S2_INNER_LOOP1_for_C_22, S2_INNER_LOOP1_for_C_23, S2_INNER_LOOP1_for_C_24,
      S2_INNER_LOOP1_C_0, S2_OUTER_LOOP_C_1, S2_INNER_LOOP2_for_C_0, S2_INNER_LOOP2_for_C_1,
      S2_INNER_LOOP2_for_C_2, S2_INNER_LOOP2_for_C_3, S2_INNER_LOOP2_for_C_4, S2_INNER_LOOP2_for_C_5,
      S2_INNER_LOOP2_for_C_6, S2_INNER_LOOP2_for_C_7, S2_INNER_LOOP2_for_C_8, S2_INNER_LOOP2_for_C_9,
      S2_INNER_LOOP2_for_C_10, S2_INNER_LOOP2_for_C_11, S2_INNER_LOOP2_for_C_12,
      S2_INNER_LOOP2_for_C_13, S2_INNER_LOOP2_for_C_14, S2_INNER_LOOP2_for_C_15,
      S2_INNER_LOOP2_for_C_16, S2_INNER_LOOP2_for_C_17, S2_INNER_LOOP2_for_C_18,
      S2_INNER_LOOP2_for_C_19, S2_INNER_LOOP2_for_C_20, S2_INNER_LOOP2_for_C_21,
      S2_INNER_LOOP2_for_C_22, S2_INNER_LOOP2_for_C_23, S2_INNER_LOOP2_C_0, S2_INNER_LOOP3_for_C_0,
      S2_INNER_LOOP3_for_C_1, S2_INNER_LOOP3_for_C_2, S2_INNER_LOOP3_for_C_3, S2_INNER_LOOP3_for_C_4,
      S2_INNER_LOOP3_for_C_5, S2_INNER_LOOP3_for_C_6, S2_INNER_LOOP3_for_C_7, S2_INNER_LOOP3_for_C_8,
      S2_INNER_LOOP3_for_C_9, S2_INNER_LOOP3_for_C_10, S2_INNER_LOOP3_for_C_11, S2_INNER_LOOP3_for_C_12,
      S2_INNER_LOOP3_for_C_13, S2_INNER_LOOP3_for_C_14, S2_INNER_LOOP3_for_C_15,
      S2_INNER_LOOP3_for_C_16, S2_INNER_LOOP3_for_C_17, S2_INNER_LOOP3_for_C_18,
      S2_INNER_LOOP3_for_C_19, S2_INNER_LOOP3_for_C_20, S2_INNER_LOOP3_for_C_21,
      S2_INNER_LOOP3_for_C_22, S2_INNER_LOOP3_for_C_23, S2_INNER_LOOP3_C_0, S34_OUTER_LOOP_for_C_0,
      S34_OUTER_LOOP_for_C_1, S34_OUTER_LOOP_for_C_2, S34_OUTER_LOOP_for_C_3, S34_OUTER_LOOP_for_C_4,
      S34_OUTER_LOOP_for_C_5, S34_OUTER_LOOP_for_C_6, S34_OUTER_LOOP_for_C_7, S34_OUTER_LOOP_for_C_8,
      S34_OUTER_LOOP_for_C_9, S34_OUTER_LOOP_for_C_10, S34_OUTER_LOOP_for_C_11, S34_OUTER_LOOP_for_C_12,
      S34_OUTER_LOOP_C_0, S5_COPY_LOOP_for_C_0, S5_COPY_LOOP_for_C_1, S5_COPY_LOOP_for_C_2,
      S5_COPY_LOOP_for_C_3, S5_COPY_LOOP_C_0, S5_OUTER_LOOP_C_0, S5_INNER_LOOP1_for_C_0,
      S5_INNER_LOOP1_for_C_1, S5_INNER_LOOP1_for_C_2, S5_INNER_LOOP1_for_C_3, S5_INNER_LOOP1_for_C_4,
      S5_INNER_LOOP1_for_C_5, S5_INNER_LOOP1_for_C_6, S5_INNER_LOOP1_for_C_7, S5_INNER_LOOP1_for_C_8,
      S5_INNER_LOOP1_for_C_9, S5_INNER_LOOP1_for_C_10, S5_INNER_LOOP1_for_C_11, S5_INNER_LOOP1_for_C_12,
      S5_INNER_LOOP1_for_C_13, S5_INNER_LOOP1_for_C_14, S5_INNER_LOOP1_for_C_15,
      S5_INNER_LOOP1_for_C_16, S5_INNER_LOOP1_for_C_17, S5_INNER_LOOP1_for_C_18,
      S5_INNER_LOOP1_for_C_19, S5_INNER_LOOP1_for_C_20, S5_INNER_LOOP1_for_C_21,
      S5_INNER_LOOP1_for_C_22, S5_INNER_LOOP1_for_C_23, S5_INNER_LOOP1_for_C_24,
      S5_INNER_LOOP1_C_0, S5_OUTER_LOOP_C_1, S5_INNER_LOOP2_for_C_0, S5_INNER_LOOP2_for_C_1,
      S5_INNER_LOOP2_for_C_2, S5_INNER_LOOP2_for_C_3, S5_INNER_LOOP2_for_C_4, S5_INNER_LOOP2_for_C_5,
      S5_INNER_LOOP2_for_C_6, S5_INNER_LOOP2_for_C_7, S5_INNER_LOOP2_for_C_8, S5_INNER_LOOP2_for_C_9,
      S5_INNER_LOOP2_for_C_10, S5_INNER_LOOP2_for_C_11, S5_INNER_LOOP2_for_C_12,
      S5_INNER_LOOP2_for_C_13, S5_INNER_LOOP2_for_C_14, S5_INNER_LOOP2_for_C_15,
      S5_INNER_LOOP2_for_C_16, S5_INNER_LOOP2_for_C_17, S5_INNER_LOOP2_for_C_18,
      S5_INNER_LOOP2_for_C_19, S5_INNER_LOOP2_for_C_20, S5_INNER_LOOP2_for_C_21,
      S5_INNER_LOOP2_for_C_22, S5_INNER_LOOP2_for_C_23, S5_INNER_LOOP2_C_0, S5_INNER_LOOP3_for_C_0,
      S5_INNER_LOOP3_for_C_1, S5_INNER_LOOP3_for_C_2, S5_INNER_LOOP3_for_C_3, S5_INNER_LOOP3_for_C_4,
      S5_INNER_LOOP3_for_C_5, S5_INNER_LOOP3_for_C_6, S5_INNER_LOOP3_for_C_7, S5_INNER_LOOP3_for_C_8,
      S5_INNER_LOOP3_for_C_9, S5_INNER_LOOP3_for_C_10, S5_INNER_LOOP3_for_C_11, S5_INNER_LOOP3_for_C_12,
      S5_INNER_LOOP3_for_C_13, S5_INNER_LOOP3_for_C_14, S5_INNER_LOOP3_for_C_15,
      S5_INNER_LOOP3_for_C_16, S5_INNER_LOOP3_for_C_17, S5_INNER_LOOP3_for_C_18,
      S5_INNER_LOOP3_for_C_19, S5_INNER_LOOP3_for_C_20, S5_INNER_LOOP3_for_C_21,
      S5_INNER_LOOP3_for_C_22, S5_INNER_LOOP3_for_C_23, S5_INNER_LOOP3_C_0, S6_OUTER_LOOP_for_C_0,
      S6_OUTER_LOOP_for_C_1, S6_OUTER_LOOP_for_C_2, S6_OUTER_LOOP_for_C_3, S6_OUTER_LOOP_C_0,
      main_C_1);

  SIGNAL state_var : hybrid_core_core_fsm_1_ST;
  SIGNAL state_var_NS : hybrid_core_core_fsm_1_ST;

BEGIN
  hybrid_core_core_fsm_1 : PROCESS (S1_OUTER_LOOP_for_C_4_tr0, S1_OUTER_LOOP_C_0_tr0,
      S2_COPY_LOOP_for_C_3_tr0, S2_COPY_LOOP_C_0_tr0, S2_INNER_LOOP1_for_C_24_tr0,
      S2_INNER_LOOP1_C_0_tr0, S2_INNER_LOOP2_for_C_23_tr0, S2_INNER_LOOP2_C_0_tr0,
      S2_INNER_LOOP2_C_0_tr1, S2_INNER_LOOP3_for_C_23_tr0, S2_INNER_LOOP3_C_0_tr0,
      S34_OUTER_LOOP_for_C_12_tr0, S34_OUTER_LOOP_C_0_tr0, S5_COPY_LOOP_for_C_3_tr0,
      S5_COPY_LOOP_C_0_tr0, S5_INNER_LOOP1_for_C_24_tr0, S5_INNER_LOOP1_C_0_tr0,
      S5_INNER_LOOP2_for_C_23_tr0, S5_INNER_LOOP2_C_0_tr0, S5_INNER_LOOP2_C_0_tr1,
      S5_INNER_LOOP3_for_C_23_tr0, S5_INNER_LOOP3_C_0_tr0, S6_OUTER_LOOP_for_C_3_tr0,
      S6_OUTER_LOOP_C_0_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN S1_OUTER_LOOP_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001");
        state_var_NS <= S1_OUTER_LOOP_for_C_1;
      WHEN S1_OUTER_LOOP_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010");
        state_var_NS <= S1_OUTER_LOOP_for_C_2;
      WHEN S1_OUTER_LOOP_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000011");
        state_var_NS <= S1_OUTER_LOOP_for_C_3;
      WHEN S1_OUTER_LOOP_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= S1_OUTER_LOOP_for_C_4;
      WHEN S1_OUTER_LOOP_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000101");
        IF ( S1_OUTER_LOOP_for_C_4_tr0 = '1' ) THEN
          state_var_NS <= S1_OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= S1_OUTER_LOOP_for_C_0;
        END IF;
      WHEN S1_OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000110");
        IF ( S1_OUTER_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= S2_COPY_LOOP_for_C_0;
        ELSE
          state_var_NS <= S1_OUTER_LOOP_for_C_0;
        END IF;
      WHEN S2_COPY_LOOP_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000111");
        state_var_NS <= S2_COPY_LOOP_for_C_1;
      WHEN S2_COPY_LOOP_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= S2_COPY_LOOP_for_C_2;
      WHEN S2_COPY_LOOP_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001001");
        state_var_NS <= S2_COPY_LOOP_for_C_3;
      WHEN S2_COPY_LOOP_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001010");
        IF ( S2_COPY_LOOP_for_C_3_tr0 = '1' ) THEN
          state_var_NS <= S2_COPY_LOOP_C_0;
        ELSE
          state_var_NS <= S2_COPY_LOOP_for_C_0;
        END IF;
      WHEN S2_COPY_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001011");
        IF ( S2_COPY_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= S2_OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= S2_COPY_LOOP_for_C_0;
        END IF;
      WHEN S2_OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001100");
        state_var_NS <= S2_INNER_LOOP1_for_C_0;
      WHEN S2_INNER_LOOP1_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001101");
        state_var_NS <= S2_INNER_LOOP1_for_C_1;
      WHEN S2_INNER_LOOP1_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001110");
        state_var_NS <= S2_INNER_LOOP1_for_C_2;
      WHEN S2_INNER_LOOP1_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001111");
        state_var_NS <= S2_INNER_LOOP1_for_C_3;
      WHEN S2_INNER_LOOP1_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= S2_INNER_LOOP1_for_C_4;
      WHEN S2_INNER_LOOP1_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010001");
        state_var_NS <= S2_INNER_LOOP1_for_C_5;
      WHEN S2_INNER_LOOP1_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010010");
        state_var_NS <= S2_INNER_LOOP1_for_C_6;
      WHEN S2_INNER_LOOP1_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010011");
        state_var_NS <= S2_INNER_LOOP1_for_C_7;
      WHEN S2_INNER_LOOP1_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010100");
        state_var_NS <= S2_INNER_LOOP1_for_C_8;
      WHEN S2_INNER_LOOP1_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010101");
        state_var_NS <= S2_INNER_LOOP1_for_C_9;
      WHEN S2_INNER_LOOP1_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010110");
        state_var_NS <= S2_INNER_LOOP1_for_C_10;
      WHEN S2_INNER_LOOP1_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010111");
        state_var_NS <= S2_INNER_LOOP1_for_C_11;
      WHEN S2_INNER_LOOP1_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011000");
        state_var_NS <= S2_INNER_LOOP1_for_C_12;
      WHEN S2_INNER_LOOP1_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011001");
        state_var_NS <= S2_INNER_LOOP1_for_C_13;
      WHEN S2_INNER_LOOP1_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011010");
        state_var_NS <= S2_INNER_LOOP1_for_C_14;
      WHEN S2_INNER_LOOP1_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011011");
        state_var_NS <= S2_INNER_LOOP1_for_C_15;
      WHEN S2_INNER_LOOP1_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011100");
        state_var_NS <= S2_INNER_LOOP1_for_C_16;
      WHEN S2_INNER_LOOP1_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011101");
        state_var_NS <= S2_INNER_LOOP1_for_C_17;
      WHEN S2_INNER_LOOP1_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011110");
        state_var_NS <= S2_INNER_LOOP1_for_C_18;
      WHEN S2_INNER_LOOP1_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011111");
        state_var_NS <= S2_INNER_LOOP1_for_C_19;
      WHEN S2_INNER_LOOP1_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        state_var_NS <= S2_INNER_LOOP1_for_C_20;
      WHEN S2_INNER_LOOP1_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100001");
        state_var_NS <= S2_INNER_LOOP1_for_C_21;
      WHEN S2_INNER_LOOP1_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100010");
        state_var_NS <= S2_INNER_LOOP1_for_C_22;
      WHEN S2_INNER_LOOP1_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100011");
        state_var_NS <= S2_INNER_LOOP1_for_C_23;
      WHEN S2_INNER_LOOP1_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100100");
        state_var_NS <= S2_INNER_LOOP1_for_C_24;
      WHEN S2_INNER_LOOP1_for_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        IF ( S2_INNER_LOOP1_for_C_24_tr0 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP1_C_0;
        ELSE
          state_var_NS <= S2_INNER_LOOP1_for_C_0;
        END IF;
      WHEN S2_INNER_LOOP1_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        IF ( S2_INNER_LOOP1_C_0_tr0 = '1' ) THEN
          state_var_NS <= S2_OUTER_LOOP_C_1;
        ELSE
          state_var_NS <= S2_INNER_LOOP1_for_C_0;
        END IF;
      WHEN S2_OUTER_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= S2_INNER_LOOP2_for_C_0;
      WHEN S2_INNER_LOOP2_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= S2_INNER_LOOP2_for_C_1;
      WHEN S2_INNER_LOOP2_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= S2_INNER_LOOP2_for_C_2;
      WHEN S2_INNER_LOOP2_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        state_var_NS <= S2_INNER_LOOP2_for_C_3;
      WHEN S2_INNER_LOOP2_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        state_var_NS <= S2_INNER_LOOP2_for_C_4;
      WHEN S2_INNER_LOOP2_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= S2_INNER_LOOP2_for_C_5;
      WHEN S2_INNER_LOOP2_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= S2_INNER_LOOP2_for_C_6;
      WHEN S2_INNER_LOOP2_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= S2_INNER_LOOP2_for_C_7;
      WHEN S2_INNER_LOOP2_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= S2_INNER_LOOP2_for_C_8;
      WHEN S2_INNER_LOOP2_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        state_var_NS <= S2_INNER_LOOP2_for_C_9;
      WHEN S2_INNER_LOOP2_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= S2_INNER_LOOP2_for_C_10;
      WHEN S2_INNER_LOOP2_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        state_var_NS <= S2_INNER_LOOP2_for_C_11;
      WHEN S2_INNER_LOOP2_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= S2_INNER_LOOP2_for_C_12;
      WHEN S2_INNER_LOOP2_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        state_var_NS <= S2_INNER_LOOP2_for_C_13;
      WHEN S2_INNER_LOOP2_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        state_var_NS <= S2_INNER_LOOP2_for_C_14;
      WHEN S2_INNER_LOOP2_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= S2_INNER_LOOP2_for_C_15;
      WHEN S2_INNER_LOOP2_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= S2_INNER_LOOP2_for_C_16;
      WHEN S2_INNER_LOOP2_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= S2_INNER_LOOP2_for_C_17;
      WHEN S2_INNER_LOOP2_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        state_var_NS <= S2_INNER_LOOP2_for_C_18;
      WHEN S2_INNER_LOOP2_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        state_var_NS <= S2_INNER_LOOP2_for_C_19;
      WHEN S2_INNER_LOOP2_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        state_var_NS <= S2_INNER_LOOP2_for_C_20;
      WHEN S2_INNER_LOOP2_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        state_var_NS <= S2_INNER_LOOP2_for_C_21;
      WHEN S2_INNER_LOOP2_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        state_var_NS <= S2_INNER_LOOP2_for_C_22;
      WHEN S2_INNER_LOOP2_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        state_var_NS <= S2_INNER_LOOP2_for_C_23;
      WHEN S2_INNER_LOOP2_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        IF ( S2_INNER_LOOP2_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP2_C_0;
        ELSE
          state_var_NS <= S2_INNER_LOOP2_for_C_0;
        END IF;
      WHEN S2_INNER_LOOP2_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        IF ( S2_INNER_LOOP2_C_0_tr0 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP3_for_C_0;
        ELSIF ( S2_INNER_LOOP2_C_0_tr1 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP2_for_C_0;
        ELSE
          state_var_NS <= S2_OUTER_LOOP_C_0;
        END IF;
      WHEN S2_INNER_LOOP3_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= S2_INNER_LOOP3_for_C_1;
      WHEN S2_INNER_LOOP3_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= S2_INNER_LOOP3_for_C_2;
      WHEN S2_INNER_LOOP3_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= S2_INNER_LOOP3_for_C_3;
      WHEN S2_INNER_LOOP3_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= S2_INNER_LOOP3_for_C_4;
      WHEN S2_INNER_LOOP3_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= S2_INNER_LOOP3_for_C_5;
      WHEN S2_INNER_LOOP3_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= S2_INNER_LOOP3_for_C_6;
      WHEN S2_INNER_LOOP3_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= S2_INNER_LOOP3_for_C_7;
      WHEN S2_INNER_LOOP3_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        state_var_NS <= S2_INNER_LOOP3_for_C_8;
      WHEN S2_INNER_LOOP3_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        state_var_NS <= S2_INNER_LOOP3_for_C_9;
      WHEN S2_INNER_LOOP3_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= S2_INNER_LOOP3_for_C_10;
      WHEN S2_INNER_LOOP3_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= S2_INNER_LOOP3_for_C_11;
      WHEN S2_INNER_LOOP3_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= S2_INNER_LOOP3_for_C_12;
      WHEN S2_INNER_LOOP3_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= S2_INNER_LOOP3_for_C_13;
      WHEN S2_INNER_LOOP3_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= S2_INNER_LOOP3_for_C_14;
      WHEN S2_INNER_LOOP3_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= S2_INNER_LOOP3_for_C_15;
      WHEN S2_INNER_LOOP3_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= S2_INNER_LOOP3_for_C_16;
      WHEN S2_INNER_LOOP3_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= S2_INNER_LOOP3_for_C_17;
      WHEN S2_INNER_LOOP3_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        state_var_NS <= S2_INNER_LOOP3_for_C_18;
      WHEN S2_INNER_LOOP3_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        state_var_NS <= S2_INNER_LOOP3_for_C_19;
      WHEN S2_INNER_LOOP3_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= S2_INNER_LOOP3_for_C_20;
      WHEN S2_INNER_LOOP3_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= S2_INNER_LOOP3_for_C_21;
      WHEN S2_INNER_LOOP3_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        state_var_NS <= S2_INNER_LOOP3_for_C_22;
      WHEN S2_INNER_LOOP3_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        state_var_NS <= S2_INNER_LOOP3_for_C_23;
      WHEN S2_INNER_LOOP3_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        IF ( S2_INNER_LOOP3_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP3_C_0;
        ELSE
          state_var_NS <= S2_INNER_LOOP3_for_C_0;
        END IF;
      WHEN S2_INNER_LOOP3_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        IF ( S2_INNER_LOOP3_C_0_tr0 = '1' ) THEN
          state_var_NS <= S34_OUTER_LOOP_for_C_0;
        ELSE
          state_var_NS <= S2_INNER_LOOP3_for_C_0;
        END IF;
      WHEN S34_OUTER_LOOP_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= S34_OUTER_LOOP_for_C_1;
      WHEN S34_OUTER_LOOP_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= S34_OUTER_LOOP_for_C_2;
      WHEN S34_OUTER_LOOP_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        state_var_NS <= S34_OUTER_LOOP_for_C_3;
      WHEN S34_OUTER_LOOP_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        state_var_NS <= S34_OUTER_LOOP_for_C_4;
      WHEN S34_OUTER_LOOP_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= S34_OUTER_LOOP_for_C_5;
      WHEN S34_OUTER_LOOP_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= S34_OUTER_LOOP_for_C_6;
      WHEN S34_OUTER_LOOP_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= S34_OUTER_LOOP_for_C_7;
      WHEN S34_OUTER_LOOP_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= S34_OUTER_LOOP_for_C_8;
      WHEN S34_OUTER_LOOP_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= S34_OUTER_LOOP_for_C_9;
      WHEN S34_OUTER_LOOP_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= S34_OUTER_LOOP_for_C_10;
      WHEN S34_OUTER_LOOP_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= S34_OUTER_LOOP_for_C_11;
      WHEN S34_OUTER_LOOP_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        state_var_NS <= S34_OUTER_LOOP_for_C_12;
      WHEN S34_OUTER_LOOP_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        IF ( S34_OUTER_LOOP_for_C_12_tr0 = '1' ) THEN
          state_var_NS <= S34_OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= S34_OUTER_LOOP_for_C_0;
        END IF;
      WHEN S34_OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        IF ( S34_OUTER_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= S5_COPY_LOOP_for_C_0;
        ELSE
          state_var_NS <= S34_OUTER_LOOP_for_C_0;
        END IF;
      WHEN S5_COPY_LOOP_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= S5_COPY_LOOP_for_C_1;
      WHEN S5_COPY_LOOP_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= S5_COPY_LOOP_for_C_2;
      WHEN S5_COPY_LOOP_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        state_var_NS <= S5_COPY_LOOP_for_C_3;
      WHEN S5_COPY_LOOP_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        IF ( S5_COPY_LOOP_for_C_3_tr0 = '1' ) THEN
          state_var_NS <= S5_COPY_LOOP_C_0;
        ELSE
          state_var_NS <= S5_COPY_LOOP_for_C_0;
        END IF;
      WHEN S5_COPY_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        IF ( S5_COPY_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= S5_OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= S5_COPY_LOOP_for_C_0;
        END IF;
      WHEN S5_OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        state_var_NS <= S5_INNER_LOOP1_for_C_0;
      WHEN S5_INNER_LOOP1_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= S5_INNER_LOOP1_for_C_1;
      WHEN S5_INNER_LOOP1_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= S5_INNER_LOOP1_for_C_2;
      WHEN S5_INNER_LOOP1_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        state_var_NS <= S5_INNER_LOOP1_for_C_3;
      WHEN S5_INNER_LOOP1_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        state_var_NS <= S5_INNER_LOOP1_for_C_4;
      WHEN S5_INNER_LOOP1_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        state_var_NS <= S5_INNER_LOOP1_for_C_5;
      WHEN S5_INNER_LOOP1_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= S5_INNER_LOOP1_for_C_6;
      WHEN S5_INNER_LOOP1_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= S5_INNER_LOOP1_for_C_7;
      WHEN S5_INNER_LOOP1_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= S5_INNER_LOOP1_for_C_8;
      WHEN S5_INNER_LOOP1_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= S5_INNER_LOOP1_for_C_9;
      WHEN S5_INNER_LOOP1_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        state_var_NS <= S5_INNER_LOOP1_for_C_10;
      WHEN S5_INNER_LOOP1_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= S5_INNER_LOOP1_for_C_11;
      WHEN S5_INNER_LOOP1_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= S5_INNER_LOOP1_for_C_12;
      WHEN S5_INNER_LOOP1_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        state_var_NS <= S5_INNER_LOOP1_for_C_13;
      WHEN S5_INNER_LOOP1_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        state_var_NS <= S5_INNER_LOOP1_for_C_14;
      WHEN S5_INNER_LOOP1_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= S5_INNER_LOOP1_for_C_15;
      WHEN S5_INNER_LOOP1_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= S5_INNER_LOOP1_for_C_16;
      WHEN S5_INNER_LOOP1_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= S5_INNER_LOOP1_for_C_17;
      WHEN S5_INNER_LOOP1_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= S5_INNER_LOOP1_for_C_18;
      WHEN S5_INNER_LOOP1_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= S5_INNER_LOOP1_for_C_19;
      WHEN S5_INNER_LOOP1_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= S5_INNER_LOOP1_for_C_20;
      WHEN S5_INNER_LOOP1_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= S5_INNER_LOOP1_for_C_21;
      WHEN S5_INNER_LOOP1_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= S5_INNER_LOOP1_for_C_22;
      WHEN S5_INNER_LOOP1_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        state_var_NS <= S5_INNER_LOOP1_for_C_23;
      WHEN S5_INNER_LOOP1_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        state_var_NS <= S5_INNER_LOOP1_for_C_24;
      WHEN S5_INNER_LOOP1_for_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        IF ( S5_INNER_LOOP1_for_C_24_tr0 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP1_C_0;
        ELSE
          state_var_NS <= S5_INNER_LOOP1_for_C_0;
        END IF;
      WHEN S5_INNER_LOOP1_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        IF ( S5_INNER_LOOP1_C_0_tr0 = '1' ) THEN
          state_var_NS <= S5_OUTER_LOOP_C_1;
        ELSE
          state_var_NS <= S5_INNER_LOOP1_for_C_0;
        END IF;
      WHEN S5_OUTER_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= S5_INNER_LOOP2_for_C_0;
      WHEN S5_INNER_LOOP2_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        state_var_NS <= S5_INNER_LOOP2_for_C_1;
      WHEN S5_INNER_LOOP2_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= S5_INNER_LOOP2_for_C_2;
      WHEN S5_INNER_LOOP2_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= S5_INNER_LOOP2_for_C_3;
      WHEN S5_INNER_LOOP2_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        state_var_NS <= S5_INNER_LOOP2_for_C_4;
      WHEN S5_INNER_LOOP2_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        state_var_NS <= S5_INNER_LOOP2_for_C_5;
      WHEN S5_INNER_LOOP2_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        state_var_NS <= S5_INNER_LOOP2_for_C_6;
      WHEN S5_INNER_LOOP2_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001111");
        state_var_NS <= S5_INNER_LOOP2_for_C_7;
      WHEN S5_INNER_LOOP2_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010000");
        state_var_NS <= S5_INNER_LOOP2_for_C_8;
      WHEN S5_INNER_LOOP2_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010001");
        state_var_NS <= S5_INNER_LOOP2_for_C_9;
      WHEN S5_INNER_LOOP2_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010010");
        state_var_NS <= S5_INNER_LOOP2_for_C_10;
      WHEN S5_INNER_LOOP2_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010011");
        state_var_NS <= S5_INNER_LOOP2_for_C_11;
      WHEN S5_INNER_LOOP2_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010100");
        state_var_NS <= S5_INNER_LOOP2_for_C_12;
      WHEN S5_INNER_LOOP2_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010101");
        state_var_NS <= S5_INNER_LOOP2_for_C_13;
      WHEN S5_INNER_LOOP2_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010110");
        state_var_NS <= S5_INNER_LOOP2_for_C_14;
      WHEN S5_INNER_LOOP2_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010111");
        state_var_NS <= S5_INNER_LOOP2_for_C_15;
      WHEN S5_INNER_LOOP2_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011000");
        state_var_NS <= S5_INNER_LOOP2_for_C_16;
      WHEN S5_INNER_LOOP2_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011001");
        state_var_NS <= S5_INNER_LOOP2_for_C_17;
      WHEN S5_INNER_LOOP2_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011010");
        state_var_NS <= S5_INNER_LOOP2_for_C_18;
      WHEN S5_INNER_LOOP2_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011011");
        state_var_NS <= S5_INNER_LOOP2_for_C_19;
      WHEN S5_INNER_LOOP2_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011100");
        state_var_NS <= S5_INNER_LOOP2_for_C_20;
      WHEN S5_INNER_LOOP2_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011101");
        state_var_NS <= S5_INNER_LOOP2_for_C_21;
      WHEN S5_INNER_LOOP2_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011110");
        state_var_NS <= S5_INNER_LOOP2_for_C_22;
      WHEN S5_INNER_LOOP2_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011111");
        state_var_NS <= S5_INNER_LOOP2_for_C_23;
      WHEN S5_INNER_LOOP2_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        IF ( S5_INNER_LOOP2_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP2_C_0;
        ELSE
          state_var_NS <= S5_INNER_LOOP2_for_C_0;
        END IF;
      WHEN S5_INNER_LOOP2_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        IF ( S5_INNER_LOOP2_C_0_tr0 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP3_for_C_0;
        ELSIF ( S5_INNER_LOOP2_C_0_tr1 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP2_for_C_0;
        ELSE
          state_var_NS <= S5_OUTER_LOOP_C_0;
        END IF;
      WHEN S5_INNER_LOOP3_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
        state_var_NS <= S5_INNER_LOOP3_for_C_1;
      WHEN S5_INNER_LOOP3_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100011");
        state_var_NS <= S5_INNER_LOOP3_for_C_2;
      WHEN S5_INNER_LOOP3_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100100");
        state_var_NS <= S5_INNER_LOOP3_for_C_3;
      WHEN S5_INNER_LOOP3_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100101");
        state_var_NS <= S5_INNER_LOOP3_for_C_4;
      WHEN S5_INNER_LOOP3_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100110");
        state_var_NS <= S5_INNER_LOOP3_for_C_5;
      WHEN S5_INNER_LOOP3_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100111");
        state_var_NS <= S5_INNER_LOOP3_for_C_6;
      WHEN S5_INNER_LOOP3_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101000");
        state_var_NS <= S5_INNER_LOOP3_for_C_7;
      WHEN S5_INNER_LOOP3_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101001");
        state_var_NS <= S5_INNER_LOOP3_for_C_8;
      WHEN S5_INNER_LOOP3_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101010");
        state_var_NS <= S5_INNER_LOOP3_for_C_9;
      WHEN S5_INNER_LOOP3_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101011");
        state_var_NS <= S5_INNER_LOOP3_for_C_10;
      WHEN S5_INNER_LOOP3_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101100");
        state_var_NS <= S5_INNER_LOOP3_for_C_11;
      WHEN S5_INNER_LOOP3_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101101");
        state_var_NS <= S5_INNER_LOOP3_for_C_12;
      WHEN S5_INNER_LOOP3_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101110");
        state_var_NS <= S5_INNER_LOOP3_for_C_13;
      WHEN S5_INNER_LOOP3_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101111");
        state_var_NS <= S5_INNER_LOOP3_for_C_14;
      WHEN S5_INNER_LOOP3_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110000");
        state_var_NS <= S5_INNER_LOOP3_for_C_15;
      WHEN S5_INNER_LOOP3_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110001");
        state_var_NS <= S5_INNER_LOOP3_for_C_16;
      WHEN S5_INNER_LOOP3_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110010");
        state_var_NS <= S5_INNER_LOOP3_for_C_17;
      WHEN S5_INNER_LOOP3_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110011");
        state_var_NS <= S5_INNER_LOOP3_for_C_18;
      WHEN S5_INNER_LOOP3_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110100");
        state_var_NS <= S5_INNER_LOOP3_for_C_19;
      WHEN S5_INNER_LOOP3_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110101");
        state_var_NS <= S5_INNER_LOOP3_for_C_20;
      WHEN S5_INNER_LOOP3_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110110");
        state_var_NS <= S5_INNER_LOOP3_for_C_21;
      WHEN S5_INNER_LOOP3_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110111");
        state_var_NS <= S5_INNER_LOOP3_for_C_22;
      WHEN S5_INNER_LOOP3_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111000");
        state_var_NS <= S5_INNER_LOOP3_for_C_23;
      WHEN S5_INNER_LOOP3_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111001");
        IF ( S5_INNER_LOOP3_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP3_C_0;
        ELSE
          state_var_NS <= S5_INNER_LOOP3_for_C_0;
        END IF;
      WHEN S5_INNER_LOOP3_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111010");
        IF ( S5_INNER_LOOP3_C_0_tr0 = '1' ) THEN
          state_var_NS <= S6_OUTER_LOOP_for_C_0;
        ELSE
          state_var_NS <= S5_INNER_LOOP3_for_C_0;
        END IF;
      WHEN S6_OUTER_LOOP_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111011");
        state_var_NS <= S6_OUTER_LOOP_for_C_1;
      WHEN S6_OUTER_LOOP_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111100");
        state_var_NS <= S6_OUTER_LOOP_for_C_2;
      WHEN S6_OUTER_LOOP_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111101");
        state_var_NS <= S6_OUTER_LOOP_for_C_3;
      WHEN S6_OUTER_LOOP_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111110");
        IF ( S6_OUTER_LOOP_for_C_3_tr0 = '1' ) THEN
          state_var_NS <= S6_OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= S6_OUTER_LOOP_for_C_0;
        END IF;
      WHEN S6_OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111111");
        IF ( S6_OUTER_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= S6_OUTER_LOOP_for_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000");
        state_var_NS <= S1_OUTER_LOOP_for_C_0;
    END CASE;
  END PROCESS hybrid_core_core_fsm_1;

  hybrid_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        IF ( core_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS hybrid_core_core_fsm_1_REG;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : OUT STD_LOGIC;
    core_wten : OUT STD_LOGIC;
    x_rsci_wen_comp : IN STD_LOGIC;
    x_rsci_wen_comp_1 : IN STD_LOGIC;
    twiddle_rsci_wen_comp : IN STD_LOGIC;
    twiddle_h_rsci_wen_comp : IN STD_LOGIC;
    revArr_rsci_wen_comp : IN STD_LOGIC;
    tw_rsci_wen_comp : IN STD_LOGIC;
    tw_h_rsci_wen_comp : IN STD_LOGIC
  );
END hybrid_core_staller;

ARCHITECTURE v2 OF hybrid_core_staller IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL core_wen_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  core_wen <= core_wen_drv;

  core_wen_drv <= x_rsci_wen_comp AND x_rsci_wen_comp_1 AND twiddle_rsci_wen_comp
      AND twiddle_h_rsci_wen_comp AND revArr_rsci_wen_comp AND tw_rsci_wen_comp AND
      tw_h_rsci_wen_comp;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        core_wten <= '0';
      ELSE
        core_wten <= NOT core_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    tw_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    tw_h_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  tw_h_rsc_triosy_obj_ld_core_sct <= tw_h_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    tw_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    tw_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  tw_rsc_triosy_obj_ld_core_sct <= tw_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    revArr_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    revArr_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  revArr_rsc_triosy_obj_ld_core_sct <= revArr_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsc_triosy_obj_ld_core_sct <= twiddle_h_rsc_triosy_obj_iswt0 AND (NOT
      core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsc_triosy_obj_ld_core_sct <= twiddle_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    m_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    m_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  m_rsc_triosy_obj_ld_core_sct <= m_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    x_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    x_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  x_rsc_triosy_obj_ld_core_sct <= x_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    tw_h_rsci_oswt : IN STD_LOGIC;
    tw_h_rsci_wen_comp : OUT STD_LOGIC;
    tw_h_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    tw_h_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    tw_h_rsci_biwt : IN STD_LOGIC;
    tw_h_rsci_bdwt : IN STD_LOGIC;
    tw_h_rsci_bcwt : OUT STD_LOGIC;
    tw_h_rsci_s_raddr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    tw_h_rsci_s_raddr_core_sct : IN STD_LOGIC;
    tw_h_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp;

ARCHITECTURE v2 OF hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL tw_h_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL tw_h_rsci_s_din_bfwt_19_0 : STD_LOGIC_VECTOR (19 DOWNTO 0);

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_20_2_2(input_0 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(19 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  tw_h_rsci_bcwt <= tw_h_rsci_bcwt_drv;

  tw_h_rsci_wen_comp <= (NOT tw_h_rsci_oswt) OR tw_h_rsci_biwt OR tw_h_rsci_bcwt_drv;
  tw_h_rsci_s_raddr <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"), tw_h_rsci_s_raddr_core,
      tw_h_rsci_s_raddr_core_sct);
  tw_h_rsci_s_din_mxwt <= MUX_v_20_2_2((tw_h_rsci_s_din(19 DOWNTO 0)), tw_h_rsci_s_din_bfwt_19_0,
      tw_h_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tw_h_rsci_bcwt_drv <= '0';
      ELSE
        tw_h_rsci_bcwt_drv <= NOT((NOT(tw_h_rsci_bcwt_drv OR tw_h_rsci_biwt)) OR
            tw_h_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( tw_h_rsci_biwt = '1' ) THEN
        tw_h_rsci_s_din_bfwt_19_0 <= tw_h_rsci_s_din(19 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    tw_h_rsci_oswt : IN STD_LOGIC;
    tw_h_rsci_biwt : OUT STD_LOGIC;
    tw_h_rsci_bdwt : OUT STD_LOGIC;
    tw_h_rsci_bcwt : IN STD_LOGIC;
    tw_h_rsci_s_re_core_sct : OUT STD_LOGIC;
    tw_h_rsci_s_rrdy : IN STD_LOGIC
  );
END hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL tw_h_rsci_ogwt : STD_LOGIC;

BEGIN
  tw_h_rsci_bdwt <= tw_h_rsci_oswt AND core_wen;
  tw_h_rsci_biwt <= tw_h_rsci_ogwt AND tw_h_rsci_s_rrdy;
  tw_h_rsci_ogwt <= tw_h_rsci_oswt AND (NOT tw_h_rsci_bcwt);
  tw_h_rsci_s_re_core_sct <= tw_h_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_rsci_tw_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_rsci_tw_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    tw_rsci_oswt : IN STD_LOGIC;
    tw_rsci_wen_comp : OUT STD_LOGIC;
    tw_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    tw_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    tw_rsci_biwt : IN STD_LOGIC;
    tw_rsci_bdwt : IN STD_LOGIC;
    tw_rsci_bcwt : OUT STD_LOGIC;
    tw_rsci_s_raddr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    tw_rsci_s_raddr_core_sct : IN STD_LOGIC;
    tw_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_tw_rsci_tw_rsc_wait_dp;

ARCHITECTURE v2 OF hybrid_core_tw_rsci_tw_rsc_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL tw_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL tw_rsci_s_din_bfwt_19_0 : STD_LOGIC_VECTOR (19 DOWNTO 0);

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_20_2_2(input_0 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(19 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  tw_rsci_bcwt <= tw_rsci_bcwt_drv;

  tw_rsci_wen_comp <= (NOT tw_rsci_oswt) OR tw_rsci_biwt OR tw_rsci_bcwt_drv;
  tw_rsci_s_raddr <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"), tw_rsci_s_raddr_core,
      tw_rsci_s_raddr_core_sct);
  tw_rsci_s_din_mxwt <= MUX_v_20_2_2((tw_rsci_s_din(19 DOWNTO 0)), tw_rsci_s_din_bfwt_19_0,
      tw_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tw_rsci_bcwt_drv <= '0';
      ELSE
        tw_rsci_bcwt_drv <= NOT((NOT(tw_rsci_bcwt_drv OR tw_rsci_biwt)) OR tw_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( tw_rsci_biwt = '1' ) THEN
        tw_rsci_s_din_bfwt_19_0 <= tw_rsci_s_din(19 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_rsci_tw_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_rsci_tw_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    tw_rsci_oswt : IN STD_LOGIC;
    tw_rsci_biwt : OUT STD_LOGIC;
    tw_rsci_bdwt : OUT STD_LOGIC;
    tw_rsci_bcwt : IN STD_LOGIC;
    tw_rsci_s_re_core_sct : OUT STD_LOGIC;
    tw_rsci_s_rrdy : IN STD_LOGIC
  );
END hybrid_core_tw_rsci_tw_rsc_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_tw_rsci_tw_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL tw_rsci_ogwt : STD_LOGIC;

BEGIN
  tw_rsci_bdwt <= tw_rsci_oswt AND core_wen;
  tw_rsci_biwt <= tw_rsci_ogwt AND tw_rsci_s_rrdy;
  tw_rsci_ogwt <= tw_rsci_oswt AND (NOT tw_rsci_bcwt);
  tw_rsci_s_re_core_sct <= tw_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_revArr_rsci_revArr_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_revArr_rsci_revArr_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    revArr_rsci_oswt : IN STD_LOGIC;
    revArr_rsci_wen_comp : OUT STD_LOGIC;
    revArr_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    revArr_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    revArr_rsci_biwt : IN STD_LOGIC;
    revArr_rsci_bdwt : IN STD_LOGIC;
    revArr_rsci_bcwt : OUT STD_LOGIC;
    revArr_rsci_s_raddr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    revArr_rsci_s_raddr_core_sct : IN STD_LOGIC;
    revArr_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_revArr_rsci_revArr_rsc_wait_dp;

ARCHITECTURE v2 OF hybrid_core_revArr_rsci_revArr_rsc_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL revArr_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL revArr_rsci_s_din_bfwt_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  revArr_rsci_bcwt <= revArr_rsci_bcwt_drv;

  revArr_rsci_wen_comp <= (NOT revArr_rsci_oswt) OR revArr_rsci_biwt OR revArr_rsci_bcwt_drv;
  revArr_rsci_s_raddr <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), revArr_rsci_s_raddr_core,
      revArr_rsci_s_raddr_core_sct);
  revArr_rsci_s_din_mxwt <= MUX_v_10_2_2((revArr_rsci_s_din(9 DOWNTO 0)), revArr_rsci_s_din_bfwt_9_0,
      revArr_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        revArr_rsci_bcwt_drv <= '0';
      ELSE
        revArr_rsci_bcwt_drv <= NOT((NOT(revArr_rsci_bcwt_drv OR revArr_rsci_biwt))
            OR revArr_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( revArr_rsci_biwt = '1' ) THEN
        revArr_rsci_s_din_bfwt_9_0 <= revArr_rsci_s_din(9 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    revArr_rsci_oswt : IN STD_LOGIC;
    revArr_rsci_biwt : OUT STD_LOGIC;
    revArr_rsci_bdwt : OUT STD_LOGIC;
    revArr_rsci_bcwt : IN STD_LOGIC;
    revArr_rsci_s_re_core_sct : OUT STD_LOGIC;
    revArr_rsci_s_rrdy : IN STD_LOGIC
  );
END hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL revArr_rsci_ogwt : STD_LOGIC;

BEGIN
  revArr_rsci_bdwt <= revArr_rsci_oswt AND core_wen;
  revArr_rsci_biwt <= revArr_rsci_ogwt AND revArr_rsci_s_rrdy;
  revArr_rsci_ogwt <= revArr_rsci_oswt AND (NOT revArr_rsci_bcwt);
  revArr_rsci_s_re_core_sct <= revArr_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_wen_comp : OUT STD_LOGIC;
    twiddle_h_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    twiddle_h_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_biwt : IN STD_LOGIC;
    twiddle_h_rsci_bdwt : IN STD_LOGIC;
    twiddle_h_rsci_bcwt : OUT STD_LOGIC;
    twiddle_h_rsci_s_raddr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    twiddle_h_rsci_s_raddr_core_sct : IN STD_LOGIC;
    twiddle_h_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp;

ARCHITECTURE v2 OF hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL twiddle_h_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_s_din_bfwt : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL butterFly_tw_h_butterFly_tw_h_and_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  FUNCTION MUX_v_32_2_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_2_2(input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  twiddle_h_rsci_bcwt <= twiddle_h_rsci_bcwt_drv;

  twiddle_h_rsci_wen_comp <= (NOT twiddle_h_rsci_oswt) OR twiddle_h_rsci_biwt OR
      twiddle_h_rsci_bcwt_drv;
  butterFly_tw_h_butterFly_tw_h_and_nl <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"),
      (twiddle_h_rsci_s_raddr_core(3 DOWNTO 0)), twiddle_h_rsci_s_raddr_core_sct);
  twiddle_h_rsci_s_raddr <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(butterFly_tw_h_butterFly_tw_h_and_nl));
  twiddle_h_rsci_s_din_mxwt <= MUX_v_32_2_2(twiddle_h_rsci_s_din, twiddle_h_rsci_s_din_bfwt,
      twiddle_h_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        twiddle_h_rsci_bcwt_drv <= '0';
      ELSE
        twiddle_h_rsci_bcwt_drv <= NOT((NOT(twiddle_h_rsci_bcwt_drv OR twiddle_h_rsci_biwt))
            OR twiddle_h_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( twiddle_h_rsci_biwt = '1' ) THEN
        twiddle_h_rsci_s_din_bfwt <= twiddle_h_rsci_s_din;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_biwt : OUT STD_LOGIC;
    twiddle_h_rsci_bdwt : OUT STD_LOGIC;
    twiddle_h_rsci_bcwt : IN STD_LOGIC;
    twiddle_h_rsci_s_re_core_sct : OUT STD_LOGIC;
    twiddle_h_rsci_s_rrdy : IN STD_LOGIC
  );
END hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_ogwt : STD_LOGIC;

BEGIN
  twiddle_h_rsci_bdwt <= twiddle_h_rsci_oswt AND core_wen;
  twiddle_h_rsci_biwt <= twiddle_h_rsci_ogwt AND twiddle_h_rsci_s_rrdy;
  twiddle_h_rsci_ogwt <= twiddle_h_rsci_oswt AND (NOT twiddle_h_rsci_bcwt);
  twiddle_h_rsci_s_re_core_sct <= twiddle_h_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_wen_comp : OUT STD_LOGIC;
    twiddle_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    twiddle_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_biwt : IN STD_LOGIC;
    twiddle_rsci_bdwt : IN STD_LOGIC;
    twiddle_rsci_bcwt : OUT STD_LOGIC;
    twiddle_rsci_s_raddr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    twiddle_rsci_s_raddr_core_sct : IN STD_LOGIC;
    twiddle_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp;

ARCHITECTURE v2 OF hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL twiddle_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_s_din_bfwt : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL butterFly_tw_butterFly_tw_and_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  FUNCTION MUX_v_32_2_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_2_2(input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  twiddle_rsci_bcwt <= twiddle_rsci_bcwt_drv;

  twiddle_rsci_wen_comp <= (NOT twiddle_rsci_oswt) OR twiddle_rsci_biwt OR twiddle_rsci_bcwt_drv;
  butterFly_tw_butterFly_tw_and_nl <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), (twiddle_rsci_s_raddr_core(3
      DOWNTO 0)), twiddle_rsci_s_raddr_core_sct);
  twiddle_rsci_s_raddr <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(butterFly_tw_butterFly_tw_and_nl));
  twiddle_rsci_s_din_mxwt <= MUX_v_32_2_2(twiddle_rsci_s_din, twiddle_rsci_s_din_bfwt,
      twiddle_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        twiddle_rsci_bcwt_drv <= '0';
      ELSE
        twiddle_rsci_bcwt_drv <= NOT((NOT(twiddle_rsci_bcwt_drv OR twiddle_rsci_biwt))
            OR twiddle_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( twiddle_rsci_biwt = '1' ) THEN
        twiddle_rsci_s_din_bfwt <= twiddle_rsci_s_din;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_biwt : OUT STD_LOGIC;
    twiddle_rsci_bdwt : OUT STD_LOGIC;
    twiddle_rsci_bcwt : IN STD_LOGIC;
    twiddle_rsci_s_re_core_sct : OUT STD_LOGIC;
    twiddle_rsci_s_rrdy : IN STD_LOGIC
  );
END hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_ogwt : STD_LOGIC;

BEGIN
  twiddle_rsci_bdwt <= twiddle_rsci_oswt AND core_wen;
  twiddle_rsci_biwt <= twiddle_rsci_ogwt AND twiddle_rsci_s_rrdy;
  twiddle_rsci_ogwt <= twiddle_rsci_oswt AND (NOT twiddle_rsci_bcwt);
  twiddle_rsci_s_re_core_sct <= twiddle_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_x_rsci_x_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_x_rsci_x_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    x_rsci_oswt : IN STD_LOGIC;
    x_rsci_wen_comp : OUT STD_LOGIC;
    x_rsci_oswt_1 : IN STD_LOGIC;
    x_rsci_wen_comp_1 : OUT STD_LOGIC;
    x_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    x_rsci_s_waddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    x_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsci_s_dout_core : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsci_biwt : IN STD_LOGIC;
    x_rsci_bdwt : IN STD_LOGIC;
    x_rsci_bcwt : OUT STD_LOGIC;
    x_rsci_biwt_1 : IN STD_LOGIC;
    x_rsci_bdwt_2 : IN STD_LOGIC;
    x_rsci_bcwt_1 : OUT STD_LOGIC;
    x_rsci_s_raddr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    x_rsci_s_raddr_core_sct : IN STD_LOGIC;
    x_rsci_s_waddr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    x_rsci_s_waddr_core_sct : IN STD_LOGIC;
    x_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsci_s_dout : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_x_rsci_x_rsc_wait_dp;

ARCHITECTURE v2 OF hybrid_core_x_rsci_x_rsc_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL x_rsci_bcwt_drv : STD_LOGIC;
  SIGNAL x_rsci_bcwt_1_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL x_rsci_s_din_bfwt : STD_LOGIC_VECTOR (31 DOWNTO 0);

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_32_2_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  x_rsci_bcwt <= x_rsci_bcwt_drv;
  x_rsci_bcwt_1 <= x_rsci_bcwt_1_drv;

  x_rsci_wen_comp <= (NOT x_rsci_oswt) OR x_rsci_biwt OR x_rsci_bcwt_drv;
  x_rsci_wen_comp_1 <= (NOT x_rsci_oswt_1) OR x_rsci_biwt_1 OR x_rsci_bcwt_1_drv;
  x_rsci_s_raddr <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"), x_rsci_s_raddr_core,
      x_rsci_s_raddr_core_sct);
  x_rsci_s_waddr <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"), x_rsci_s_waddr_core,
      x_rsci_s_waddr_core_sct);
  x_rsci_s_din_mxwt <= MUX_v_32_2_2(x_rsci_s_din, x_rsci_s_din_bfwt, x_rsci_bcwt_drv);
  x_rsci_s_dout <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
      x_rsci_s_dout_core, x_rsci_s_waddr_core_sct);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_rsci_bcwt_drv <= '0';
        x_rsci_bcwt_1_drv <= '0';
      ELSE
        x_rsci_bcwt_drv <= NOT((NOT(x_rsci_bcwt_drv OR x_rsci_biwt)) OR x_rsci_bdwt);
        x_rsci_bcwt_1_drv <= NOT((NOT(x_rsci_bcwt_1_drv OR x_rsci_biwt_1)) OR x_rsci_bdwt_2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( x_rsci_biwt = '1' ) THEN
        x_rsci_s_din_bfwt <= x_rsci_s_din;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_x_rsci_x_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_x_rsci_x_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    x_rsci_oswt : IN STD_LOGIC;
    x_rsci_oswt_1 : IN STD_LOGIC;
    x_rsci_biwt : OUT STD_LOGIC;
    x_rsci_bdwt : OUT STD_LOGIC;
    x_rsci_bcwt : IN STD_LOGIC;
    x_rsci_s_re_core_sct : OUT STD_LOGIC;
    x_rsci_biwt_1 : OUT STD_LOGIC;
    x_rsci_bdwt_2 : OUT STD_LOGIC;
    x_rsci_bcwt_1 : IN STD_LOGIC;
    x_rsci_s_we_core_sct : OUT STD_LOGIC;
    x_rsci_s_rrdy : IN STD_LOGIC;
    x_rsci_s_wrdy : IN STD_LOGIC
  );
END hybrid_core_x_rsci_x_rsc_wait_ctrl;

ARCHITECTURE v2 OF hybrid_core_x_rsci_x_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL x_rsci_ogwt : STD_LOGIC;
  SIGNAL x_rsci_ogwt_1 : STD_LOGIC;

BEGIN
  x_rsci_bdwt <= x_rsci_oswt AND core_wen;
  x_rsci_biwt <= x_rsci_ogwt AND x_rsci_s_rrdy;
  x_rsci_ogwt <= x_rsci_oswt AND (NOT x_rsci_bcwt);
  x_rsci_s_re_core_sct <= x_rsci_ogwt;
  x_rsci_bdwt_2 <= x_rsci_oswt_1 AND core_wen;
  x_rsci_biwt_1 <= x_rsci_ogwt_1 AND x_rsci_s_wrdy;
  x_rsci_ogwt_1 <= x_rsci_oswt_1 AND (NOT x_rsci_bcwt_1);
  x_rsci_s_we_core_sct <= x_rsci_ogwt_1;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    xx_rsc_cgo_iro : IN STD_LOGIC;
    xx_rsci_clken_d : OUT STD_LOGIC;
    yy_rsc_cgo_iro : IN STD_LOGIC;
    yy_rsci_clken_d : OUT STD_LOGIC;
    ensig_cgo_iro : IN STD_LOGIC;
    S34_OUTER_LOOP_for_tf_mul_cmp_z : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    ensig_cgo_iro_1 : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    xx_rsc_cgo : IN STD_LOGIC;
    yy_rsc_cgo : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    mult_12_z_mul_cmp_en : OUT STD_LOGIC;
    S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    ensig_cgo_1 : IN STD_LOGIC;
    mult_z_mul_cmp_en : OUT STD_LOGIC
  );
END hybrid_core_wait_dp;

ARCHITECTURE v2 OF hybrid_core_wait_dp IS
  -- Default Constants

BEGIN
  xx_rsci_clken_d <= core_wen AND (xx_rsc_cgo OR xx_rsc_cgo_iro);
  yy_rsci_clken_d <= core_wen AND (yy_rsc_cgo OR yy_rsc_cgo_iro);
  mult_12_z_mul_cmp_en <= core_wen AND (ensig_cgo OR ensig_cgo_iro);
  mult_z_mul_cmp_en <= core_wen AND (ensig_cgo_1 OR ensig_cgo_iro_1);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( core_wen = '1' ) THEN
        S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg <= S34_OUTER_LOOP_for_tf_mul_cmp_z;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_h_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_h_rsc_triosy_obj IS
  PORT(
    tw_h_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    tw_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END hybrid_core_tw_h_rsc_triosy_obj;

ARCHITECTURE v2 OF hybrid_core_tw_h_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL tw_h_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      tw_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      tw_h_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  tw_h_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => tw_h_rsc_triosy_obj_ld_core_sct,
      lz => tw_h_rsc_triosy_lz
    );
  hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl_inst : hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      tw_h_rsc_triosy_obj_iswt0 => tw_h_rsc_triosy_obj_iswt0,
      tw_h_rsc_triosy_obj_ld_core_sct => tw_h_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_rsc_triosy_obj IS
  PORT(
    tw_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    tw_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END hybrid_core_tw_rsc_triosy_obj;

ARCHITECTURE v2 OF hybrid_core_tw_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL tw_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      tw_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      tw_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  tw_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => tw_rsc_triosy_obj_ld_core_sct,
      lz => tw_rsc_triosy_lz
    );
  hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl_inst : hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      tw_rsc_triosy_obj_iswt0 => tw_rsc_triosy_obj_iswt0,
      tw_rsc_triosy_obj_ld_core_sct => tw_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_revArr_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_revArr_rsc_triosy_obj IS
  PORT(
    revArr_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    revArr_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END hybrid_core_revArr_rsc_triosy_obj;

ARCHITECTURE v2 OF hybrid_core_revArr_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL revArr_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      revArr_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      revArr_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  revArr_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => revArr_rsc_triosy_obj_ld_core_sct,
      lz => revArr_rsc_triosy_lz
    );
  hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl_inst : hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      revArr_rsc_triosy_obj_iswt0 => revArr_rsc_triosy_obj_iswt0,
      revArr_rsc_triosy_obj_ld_core_sct => revArr_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_h_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_h_rsc_triosy_obj IS
  PORT(
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END hybrid_core_twiddle_h_rsc_triosy_obj;

ARCHITECTURE v2 OF hybrid_core_twiddle_h_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      twiddle_h_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  twiddle_h_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => twiddle_h_rsc_triosy_obj_ld_core_sct,
      lz => twiddle_h_rsc_triosy_lz
    );
  hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl_inst : hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      twiddle_h_rsc_triosy_obj_iswt0 => twiddle_h_rsc_triosy_obj_iswt0,
      twiddle_h_rsc_triosy_obj_ld_core_sct => twiddle_h_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_rsc_triosy_obj IS
  PORT(
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END hybrid_core_twiddle_rsc_triosy_obj;

ARCHITECTURE v2 OF hybrid_core_twiddle_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      twiddle_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  twiddle_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => twiddle_rsc_triosy_obj_ld_core_sct,
      lz => twiddle_rsc_triosy_lz
    );
  hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst : hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      twiddle_rsc_triosy_obj_iswt0 => twiddle_rsc_triosy_obj_iswt0,
      twiddle_rsc_triosy_obj_ld_core_sct => twiddle_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_m_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_m_rsc_triosy_obj IS
  PORT(
    m_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    m_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END hybrid_core_m_rsc_triosy_obj;

ARCHITECTURE v2 OF hybrid_core_m_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL m_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      m_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      m_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  m_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => m_rsc_triosy_obj_ld_core_sct,
      lz => m_rsc_triosy_lz
    );
  hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl_inst : hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      m_rsc_triosy_obj_iswt0 => m_rsc_triosy_obj_iswt0,
      m_rsc_triosy_obj_ld_core_sct => m_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_x_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_x_rsc_triosy_obj IS
  PORT(
    x_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    x_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END hybrid_core_x_rsc_triosy_obj;

ARCHITECTURE v2 OF hybrid_core_x_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL x_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      x_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      x_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  x_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => x_rsc_triosy_obj_ld_core_sct,
      lz => x_rsc_triosy_lz
    );
  hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl_inst : hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      x_rsc_triosy_obj_iswt0 => x_rsc_triosy_obj_iswt0,
      x_rsc_triosy_obj_ld_core_sct => x_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_h_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_h_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    tw_h_rsc_s_tdone : IN STD_LOGIC;
    tw_h_rsc_tr_write_done : IN STD_LOGIC;
    tw_h_rsc_RREADY : IN STD_LOGIC;
    tw_h_rsc_RVALID : OUT STD_LOGIC;
    tw_h_rsc_RUSER : OUT STD_LOGIC;
    tw_h_rsc_RLAST : OUT STD_LOGIC;
    tw_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_h_rsc_RID : OUT STD_LOGIC;
    tw_h_rsc_ARREADY : OUT STD_LOGIC;
    tw_h_rsc_ARVALID : IN STD_LOGIC;
    tw_h_rsc_ARUSER : IN STD_LOGIC;
    tw_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARLOCK : IN STD_LOGIC;
    tw_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_h_rsc_ARID : IN STD_LOGIC;
    tw_h_rsc_BREADY : IN STD_LOGIC;
    tw_h_rsc_BVALID : OUT STD_LOGIC;
    tw_h_rsc_BUSER : OUT STD_LOGIC;
    tw_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_BID : OUT STD_LOGIC;
    tw_h_rsc_WREADY : OUT STD_LOGIC;
    tw_h_rsc_WVALID : IN STD_LOGIC;
    tw_h_rsc_WUSER : IN STD_LOGIC;
    tw_h_rsc_WLAST : IN STD_LOGIC;
    tw_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_h_rsc_AWREADY : OUT STD_LOGIC;
    tw_h_rsc_AWVALID : IN STD_LOGIC;
    tw_h_rsc_AWUSER : IN STD_LOGIC;
    tw_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWLOCK : IN STD_LOGIC;
    tw_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_h_rsc_AWID : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    tw_h_rsci_oswt : IN STD_LOGIC;
    tw_h_rsci_wen_comp : OUT STD_LOGIC;
    tw_h_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    tw_h_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (19 DOWNTO 0)
  );
END hybrid_core_tw_h_rsci;

ARCHITECTURE v2 OF hybrid_core_tw_h_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL tw_h_rsci_biwt : STD_LOGIC;
  SIGNAL tw_h_rsci_bdwt : STD_LOGIC;
  SIGNAL tw_h_rsci_bcwt : STD_LOGIC;
  SIGNAL tw_h_rsci_s_re_core_sct : STD_LOGIC;
  SIGNAL tw_h_rsci_s_raddr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL tw_h_rsci_s_din : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tw_h_rsci_s_rrdy : STD_LOGIC;
  SIGNAL tw_h_rsci_s_wrdy : STD_LOGIC;
  SIGNAL tw_h_rsc_is_idle : STD_LOGIC;
  SIGNAL tw_h_rsci_s_din_mxwt_pconst : STD_LOGIC_VECTOR (19 DOWNTO 0);

  SIGNAL tw_h_rsci_AWID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL tw_h_rsci_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL tw_h_rsci_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL tw_h_rsci_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL tw_h_rsci_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_h_rsci_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL tw_h_rsci_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_h_rsci_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_h_rsci_AWUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tw_h_rsci_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_h_rsci_WUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_BID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL tw_h_rsci_BUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_ARID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL tw_h_rsci_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL tw_h_rsci_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL tw_h_rsci_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL tw_h_rsci_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_h_rsci_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL tw_h_rsci_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_h_rsci_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_h_rsci_ARUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_RID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tw_h_rsci_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL tw_h_rsci_RUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_h_rsci_s_raddr_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL tw_h_rsci_s_waddr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL tw_h_rsci_s_din_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tw_h_rsci_s_dout : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      tw_h_rsci_oswt : IN STD_LOGIC;
      tw_h_rsci_biwt : OUT STD_LOGIC;
      tw_h_rsci_bdwt : OUT STD_LOGIC;
      tw_h_rsci_bcwt : IN STD_LOGIC;
      tw_h_rsci_s_re_core_sct : OUT STD_LOGIC;
      tw_h_rsci_s_rrdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      tw_h_rsci_oswt : IN STD_LOGIC;
      tw_h_rsci_wen_comp : OUT STD_LOGIC;
      tw_h_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      tw_h_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
      tw_h_rsci_biwt : IN STD_LOGIC;
      tw_h_rsci_bdwt : IN STD_LOGIC;
      tw_h_rsci_bcwt : OUT STD_LOGIC;
      tw_h_rsci_s_raddr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      tw_h_rsci_s_raddr_core_sct : IN STD_LOGIC;
      tw_h_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr_core : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_din_mxwt : STD_LOGIC_VECTOR
      (19 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_din : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

BEGIN
  tw_h_rsci : work.amba_comps.ccs_axi4_slave_mem
    GENERIC MAP(
      rscid => 0,
      depth => 1024,
      op_width => 32,
      cwidth => 32,
      addr_w => 10,
      nopreload => 0,
      rst_ph => 0,
      ADDR_WIDTH => 12,
      DATA_WIDTH => 32,
      ID_WIDTH => 1,
      USER_WIDTH => 1,
      REGION_MAP_SIZE => 1,
      wBASE_ADDRESS => 0,
      rBASE_ADDRESS => 0
      )
    PORT MAP(
      ACLK => clk,
      ARESETn => '1',
      AWID => tw_h_rsci_AWID,
      AWADDR => tw_h_rsci_AWADDR,
      AWLEN => tw_h_rsci_AWLEN,
      AWSIZE => tw_h_rsci_AWSIZE,
      AWBURST => tw_h_rsci_AWBURST,
      AWLOCK => tw_h_rsc_AWLOCK,
      AWCACHE => tw_h_rsci_AWCACHE,
      AWPROT => tw_h_rsci_AWPROT,
      AWQOS => tw_h_rsci_AWQOS,
      AWREGION => tw_h_rsci_AWREGION,
      AWUSER => tw_h_rsci_AWUSER,
      AWVALID => tw_h_rsc_AWVALID,
      AWREADY => tw_h_rsc_AWREADY,
      WDATA => tw_h_rsci_WDATA,
      WSTRB => tw_h_rsci_WSTRB,
      WLAST => tw_h_rsc_WLAST,
      WUSER => tw_h_rsci_WUSER,
      WVALID => tw_h_rsc_WVALID,
      WREADY => tw_h_rsc_WREADY,
      BID => tw_h_rsci_BID,
      BRESP => tw_h_rsci_BRESP,
      BUSER => tw_h_rsci_BUSER,
      BVALID => tw_h_rsc_BVALID,
      BREADY => tw_h_rsc_BREADY,
      ARID => tw_h_rsci_ARID,
      ARADDR => tw_h_rsci_ARADDR,
      ARLEN => tw_h_rsci_ARLEN,
      ARSIZE => tw_h_rsci_ARSIZE,
      ARBURST => tw_h_rsci_ARBURST,
      ARLOCK => tw_h_rsc_ARLOCK,
      ARCACHE => tw_h_rsci_ARCACHE,
      ARPROT => tw_h_rsci_ARPROT,
      ARQOS => tw_h_rsci_ARQOS,
      ARREGION => tw_h_rsci_ARREGION,
      ARUSER => tw_h_rsci_ARUSER,
      ARVALID => tw_h_rsc_ARVALID,
      ARREADY => tw_h_rsc_ARREADY,
      RID => tw_h_rsci_RID,
      RDATA => tw_h_rsci_RDATA,
      RRESP => tw_h_rsci_RRESP,
      RLAST => tw_h_rsc_RLAST,
      RUSER => tw_h_rsci_RUSER,
      RVALID => tw_h_rsc_RVALID,
      RREADY => tw_h_rsc_RREADY,
      s_re => tw_h_rsci_s_re_core_sct,
      s_we => '0',
      s_raddr => tw_h_rsci_s_raddr_1,
      s_waddr => tw_h_rsci_s_waddr,
      s_din => tw_h_rsci_s_din_1,
      s_dout => tw_h_rsci_s_dout,
      s_rrdy => tw_h_rsci_s_rrdy,
      s_wrdy => tw_h_rsci_s_wrdy,
      is_idle => tw_h_rsc_is_idle,
      tr_write_done => tw_h_rsc_tr_write_done,
      s_tdone => tw_h_rsc_s_tdone
    );
  tw_h_rsci_AWID(0) <= tw_h_rsc_AWID;
  tw_h_rsci_AWADDR <= tw_h_rsc_AWADDR;
  tw_h_rsci_AWLEN <= tw_h_rsc_AWLEN;
  tw_h_rsci_AWSIZE <= tw_h_rsc_AWSIZE;
  tw_h_rsci_AWBURST <= tw_h_rsc_AWBURST;
  tw_h_rsci_AWCACHE <= tw_h_rsc_AWCACHE;
  tw_h_rsci_AWPROT <= tw_h_rsc_AWPROT;
  tw_h_rsci_AWQOS <= tw_h_rsc_AWQOS;
  tw_h_rsci_AWREGION <= tw_h_rsc_AWREGION;
  tw_h_rsci_AWUSER(0) <= tw_h_rsc_AWUSER;
  tw_h_rsci_WDATA <= tw_h_rsc_WDATA;
  tw_h_rsci_WSTRB <= tw_h_rsc_WSTRB;
  tw_h_rsci_WUSER(0) <= tw_h_rsc_WUSER;
  tw_h_rsc_BID <= tw_h_rsci_BID(0);
  tw_h_rsc_BRESP <= tw_h_rsci_BRESP;
  tw_h_rsc_BUSER <= tw_h_rsci_BUSER(0);
  tw_h_rsci_ARID(0) <= tw_h_rsc_ARID;
  tw_h_rsci_ARADDR <= tw_h_rsc_ARADDR;
  tw_h_rsci_ARLEN <= tw_h_rsc_ARLEN;
  tw_h_rsci_ARSIZE <= tw_h_rsc_ARSIZE;
  tw_h_rsci_ARBURST <= tw_h_rsc_ARBURST;
  tw_h_rsci_ARCACHE <= tw_h_rsc_ARCACHE;
  tw_h_rsci_ARPROT <= tw_h_rsc_ARPROT;
  tw_h_rsci_ARQOS <= tw_h_rsc_ARQOS;
  tw_h_rsci_ARREGION <= tw_h_rsc_ARREGION;
  tw_h_rsci_ARUSER(0) <= tw_h_rsc_ARUSER;
  tw_h_rsc_RID <= tw_h_rsci_RID(0);
  tw_h_rsc_RDATA <= tw_h_rsci_RDATA;
  tw_h_rsc_RRESP <= tw_h_rsci_RRESP;
  tw_h_rsc_RUSER <= tw_h_rsci_RUSER(0);
  tw_h_rsci_s_raddr_1 <= tw_h_rsci_s_raddr;
  tw_h_rsci_s_waddr <= STD_LOGIC_VECTOR'( "0000000000");
  tw_h_rsci_s_din <= tw_h_rsci_s_din_1;
  tw_h_rsci_s_dout <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");

  hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl_inst : hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      tw_h_rsci_oswt => tw_h_rsci_oswt,
      tw_h_rsci_biwt => tw_h_rsci_biwt,
      tw_h_rsci_bdwt => tw_h_rsci_bdwt,
      tw_h_rsci_bcwt => tw_h_rsci_bcwt,
      tw_h_rsci_s_re_core_sct => tw_h_rsci_s_re_core_sct,
      tw_h_rsci_s_rrdy => tw_h_rsci_s_rrdy
    );
  hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst : hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      tw_h_rsci_oswt => tw_h_rsci_oswt,
      tw_h_rsci_wen_comp => tw_h_rsci_wen_comp,
      tw_h_rsci_s_raddr_core => hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr_core,
      tw_h_rsci_s_din_mxwt => hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_din_mxwt,
      tw_h_rsci_biwt => tw_h_rsci_biwt,
      tw_h_rsci_bdwt => tw_h_rsci_bdwt,
      tw_h_rsci_bcwt => tw_h_rsci_bcwt,
      tw_h_rsci_s_raddr => hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr,
      tw_h_rsci_s_raddr_core_sct => tw_h_rsci_s_re_core_sct,
      tw_h_rsci_s_din => hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_din
    );
  hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr_core <= tw_h_rsci_s_raddr_core;
  tw_h_rsci_s_din_mxwt_pconst <= hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_din_mxwt;
  tw_h_rsci_s_raddr <= hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_raddr;
  hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp_inst_tw_h_rsci_s_din <= tw_h_rsci_s_din;

  tw_h_rsci_s_din_mxwt <= tw_h_rsci_s_din_mxwt_pconst;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_tw_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_tw_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    tw_rsc_s_tdone : IN STD_LOGIC;
    tw_rsc_tr_write_done : IN STD_LOGIC;
    tw_rsc_RREADY : IN STD_LOGIC;
    tw_rsc_RVALID : OUT STD_LOGIC;
    tw_rsc_RUSER : OUT STD_LOGIC;
    tw_rsc_RLAST : OUT STD_LOGIC;
    tw_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_rsc_RID : OUT STD_LOGIC;
    tw_rsc_ARREADY : OUT STD_LOGIC;
    tw_rsc_ARVALID : IN STD_LOGIC;
    tw_rsc_ARUSER : IN STD_LOGIC;
    tw_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARLOCK : IN STD_LOGIC;
    tw_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_rsc_ARID : IN STD_LOGIC;
    tw_rsc_BREADY : IN STD_LOGIC;
    tw_rsc_BVALID : OUT STD_LOGIC;
    tw_rsc_BUSER : OUT STD_LOGIC;
    tw_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_BID : OUT STD_LOGIC;
    tw_rsc_WREADY : OUT STD_LOGIC;
    tw_rsc_WVALID : IN STD_LOGIC;
    tw_rsc_WUSER : IN STD_LOGIC;
    tw_rsc_WLAST : IN STD_LOGIC;
    tw_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_rsc_AWREADY : OUT STD_LOGIC;
    tw_rsc_AWVALID : IN STD_LOGIC;
    tw_rsc_AWUSER : IN STD_LOGIC;
    tw_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWLOCK : IN STD_LOGIC;
    tw_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_rsc_AWID : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    tw_rsci_oswt : IN STD_LOGIC;
    tw_rsci_wen_comp : OUT STD_LOGIC;
    tw_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    tw_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (19 DOWNTO 0)
  );
END hybrid_core_tw_rsci;

ARCHITECTURE v2 OF hybrid_core_tw_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL tw_rsci_biwt : STD_LOGIC;
  SIGNAL tw_rsci_bdwt : STD_LOGIC;
  SIGNAL tw_rsci_bcwt : STD_LOGIC;
  SIGNAL tw_rsci_s_re_core_sct : STD_LOGIC;
  SIGNAL tw_rsci_s_raddr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL tw_rsci_s_din : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tw_rsci_s_rrdy : STD_LOGIC;
  SIGNAL tw_rsci_s_wrdy : STD_LOGIC;
  SIGNAL tw_rsc_is_idle : STD_LOGIC;
  SIGNAL tw_rsci_s_din_mxwt_pconst : STD_LOGIC_VECTOR (19 DOWNTO 0);

  SIGNAL tw_rsci_AWID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL tw_rsci_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL tw_rsci_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL tw_rsci_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL tw_rsci_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_rsci_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL tw_rsci_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_rsci_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_rsci_AWUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tw_rsci_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_rsci_WUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_BID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL tw_rsci_BUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_ARID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL tw_rsci_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL tw_rsci_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL tw_rsci_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL tw_rsci_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_rsci_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL tw_rsci_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_rsci_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tw_rsci_ARUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_RID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tw_rsci_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL tw_rsci_RUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL tw_rsci_s_raddr_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL tw_rsci_s_waddr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL tw_rsci_s_din_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tw_rsci_s_dout : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT hybrid_core_tw_rsci_tw_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      tw_rsci_oswt : IN STD_LOGIC;
      tw_rsci_biwt : OUT STD_LOGIC;
      tw_rsci_bdwt : OUT STD_LOGIC;
      tw_rsci_bcwt : IN STD_LOGIC;
      tw_rsci_s_re_core_sct : OUT STD_LOGIC;
      tw_rsci_s_rrdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_tw_rsci_tw_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      tw_rsci_oswt : IN STD_LOGIC;
      tw_rsci_wen_comp : OUT STD_LOGIC;
      tw_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      tw_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
      tw_rsci_biwt : IN STD_LOGIC;
      tw_rsci_bdwt : IN STD_LOGIC;
      tw_rsci_bcwt : OUT STD_LOGIC;
      tw_rsci_s_raddr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      tw_rsci_s_raddr_core_sct : IN STD_LOGIC;
      tw_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr_core : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_din_mxwt : STD_LOGIC_VECTOR
      (19 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_din : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

BEGIN
  tw_rsci : work.amba_comps.ccs_axi4_slave_mem
    GENERIC MAP(
      rscid => 0,
      depth => 1024,
      op_width => 32,
      cwidth => 32,
      addr_w => 10,
      nopreload => 0,
      rst_ph => 0,
      ADDR_WIDTH => 12,
      DATA_WIDTH => 32,
      ID_WIDTH => 1,
      USER_WIDTH => 1,
      REGION_MAP_SIZE => 1,
      wBASE_ADDRESS => 0,
      rBASE_ADDRESS => 0
      )
    PORT MAP(
      ACLK => clk,
      ARESETn => '1',
      AWID => tw_rsci_AWID,
      AWADDR => tw_rsci_AWADDR,
      AWLEN => tw_rsci_AWLEN,
      AWSIZE => tw_rsci_AWSIZE,
      AWBURST => tw_rsci_AWBURST,
      AWLOCK => tw_rsc_AWLOCK,
      AWCACHE => tw_rsci_AWCACHE,
      AWPROT => tw_rsci_AWPROT,
      AWQOS => tw_rsci_AWQOS,
      AWREGION => tw_rsci_AWREGION,
      AWUSER => tw_rsci_AWUSER,
      AWVALID => tw_rsc_AWVALID,
      AWREADY => tw_rsc_AWREADY,
      WDATA => tw_rsci_WDATA,
      WSTRB => tw_rsci_WSTRB,
      WLAST => tw_rsc_WLAST,
      WUSER => tw_rsci_WUSER,
      WVALID => tw_rsc_WVALID,
      WREADY => tw_rsc_WREADY,
      BID => tw_rsci_BID,
      BRESP => tw_rsci_BRESP,
      BUSER => tw_rsci_BUSER,
      BVALID => tw_rsc_BVALID,
      BREADY => tw_rsc_BREADY,
      ARID => tw_rsci_ARID,
      ARADDR => tw_rsci_ARADDR,
      ARLEN => tw_rsci_ARLEN,
      ARSIZE => tw_rsci_ARSIZE,
      ARBURST => tw_rsci_ARBURST,
      ARLOCK => tw_rsc_ARLOCK,
      ARCACHE => tw_rsci_ARCACHE,
      ARPROT => tw_rsci_ARPROT,
      ARQOS => tw_rsci_ARQOS,
      ARREGION => tw_rsci_ARREGION,
      ARUSER => tw_rsci_ARUSER,
      ARVALID => tw_rsc_ARVALID,
      ARREADY => tw_rsc_ARREADY,
      RID => tw_rsci_RID,
      RDATA => tw_rsci_RDATA,
      RRESP => tw_rsci_RRESP,
      RLAST => tw_rsc_RLAST,
      RUSER => tw_rsci_RUSER,
      RVALID => tw_rsc_RVALID,
      RREADY => tw_rsc_RREADY,
      s_re => tw_rsci_s_re_core_sct,
      s_we => '0',
      s_raddr => tw_rsci_s_raddr_1,
      s_waddr => tw_rsci_s_waddr,
      s_din => tw_rsci_s_din_1,
      s_dout => tw_rsci_s_dout,
      s_rrdy => tw_rsci_s_rrdy,
      s_wrdy => tw_rsci_s_wrdy,
      is_idle => tw_rsc_is_idle,
      tr_write_done => tw_rsc_tr_write_done,
      s_tdone => tw_rsc_s_tdone
    );
  tw_rsci_AWID(0) <= tw_rsc_AWID;
  tw_rsci_AWADDR <= tw_rsc_AWADDR;
  tw_rsci_AWLEN <= tw_rsc_AWLEN;
  tw_rsci_AWSIZE <= tw_rsc_AWSIZE;
  tw_rsci_AWBURST <= tw_rsc_AWBURST;
  tw_rsci_AWCACHE <= tw_rsc_AWCACHE;
  tw_rsci_AWPROT <= tw_rsc_AWPROT;
  tw_rsci_AWQOS <= tw_rsc_AWQOS;
  tw_rsci_AWREGION <= tw_rsc_AWREGION;
  tw_rsci_AWUSER(0) <= tw_rsc_AWUSER;
  tw_rsci_WDATA <= tw_rsc_WDATA;
  tw_rsci_WSTRB <= tw_rsc_WSTRB;
  tw_rsci_WUSER(0) <= tw_rsc_WUSER;
  tw_rsc_BID <= tw_rsci_BID(0);
  tw_rsc_BRESP <= tw_rsci_BRESP;
  tw_rsc_BUSER <= tw_rsci_BUSER(0);
  tw_rsci_ARID(0) <= tw_rsc_ARID;
  tw_rsci_ARADDR <= tw_rsc_ARADDR;
  tw_rsci_ARLEN <= tw_rsc_ARLEN;
  tw_rsci_ARSIZE <= tw_rsc_ARSIZE;
  tw_rsci_ARBURST <= tw_rsc_ARBURST;
  tw_rsci_ARCACHE <= tw_rsc_ARCACHE;
  tw_rsci_ARPROT <= tw_rsc_ARPROT;
  tw_rsci_ARQOS <= tw_rsc_ARQOS;
  tw_rsci_ARREGION <= tw_rsc_ARREGION;
  tw_rsci_ARUSER(0) <= tw_rsc_ARUSER;
  tw_rsc_RID <= tw_rsci_RID(0);
  tw_rsc_RDATA <= tw_rsci_RDATA;
  tw_rsc_RRESP <= tw_rsci_RRESP;
  tw_rsc_RUSER <= tw_rsci_RUSER(0);
  tw_rsci_s_raddr_1 <= tw_rsci_s_raddr;
  tw_rsci_s_waddr <= STD_LOGIC_VECTOR'( "0000000000");
  tw_rsci_s_din <= tw_rsci_s_din_1;
  tw_rsci_s_dout <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");

  hybrid_core_tw_rsci_tw_rsc_wait_ctrl_inst : hybrid_core_tw_rsci_tw_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      tw_rsci_oswt => tw_rsci_oswt,
      tw_rsci_biwt => tw_rsci_biwt,
      tw_rsci_bdwt => tw_rsci_bdwt,
      tw_rsci_bcwt => tw_rsci_bcwt,
      tw_rsci_s_re_core_sct => tw_rsci_s_re_core_sct,
      tw_rsci_s_rrdy => tw_rsci_s_rrdy
    );
  hybrid_core_tw_rsci_tw_rsc_wait_dp_inst : hybrid_core_tw_rsci_tw_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      tw_rsci_oswt => tw_rsci_oswt,
      tw_rsci_wen_comp => tw_rsci_wen_comp,
      tw_rsci_s_raddr_core => hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr_core,
      tw_rsci_s_din_mxwt => hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_din_mxwt,
      tw_rsci_biwt => tw_rsci_biwt,
      tw_rsci_bdwt => tw_rsci_bdwt,
      tw_rsci_bcwt => tw_rsci_bcwt,
      tw_rsci_s_raddr => hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr,
      tw_rsci_s_raddr_core_sct => tw_rsci_s_re_core_sct,
      tw_rsci_s_din => hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_din
    );
  hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr_core <= tw_rsci_s_raddr_core;
  tw_rsci_s_din_mxwt_pconst <= hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_din_mxwt;
  tw_rsci_s_raddr <= hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_raddr;
  hybrid_core_tw_rsci_tw_rsc_wait_dp_inst_tw_rsci_s_din <= tw_rsci_s_din;

  tw_rsci_s_din_mxwt <= tw_rsci_s_din_mxwt_pconst;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_revArr_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_revArr_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    revArr_rsc_s_tdone : IN STD_LOGIC;
    revArr_rsc_tr_write_done : IN STD_LOGIC;
    revArr_rsc_RREADY : IN STD_LOGIC;
    revArr_rsc_RVALID : OUT STD_LOGIC;
    revArr_rsc_RUSER : OUT STD_LOGIC;
    revArr_rsc_RLAST : OUT STD_LOGIC;
    revArr_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    revArr_rsc_RID : OUT STD_LOGIC;
    revArr_rsc_ARREADY : OUT STD_LOGIC;
    revArr_rsc_ARVALID : IN STD_LOGIC;
    revArr_rsc_ARUSER : IN STD_LOGIC;
    revArr_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARLOCK : IN STD_LOGIC;
    revArr_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    revArr_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    revArr_rsc_ARID : IN STD_LOGIC;
    revArr_rsc_BREADY : IN STD_LOGIC;
    revArr_rsc_BVALID : OUT STD_LOGIC;
    revArr_rsc_BUSER : OUT STD_LOGIC;
    revArr_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_BID : OUT STD_LOGIC;
    revArr_rsc_WREADY : OUT STD_LOGIC;
    revArr_rsc_WVALID : IN STD_LOGIC;
    revArr_rsc_WUSER : IN STD_LOGIC;
    revArr_rsc_WLAST : IN STD_LOGIC;
    revArr_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    revArr_rsc_AWREADY : OUT STD_LOGIC;
    revArr_rsc_AWVALID : IN STD_LOGIC;
    revArr_rsc_AWUSER : IN STD_LOGIC;
    revArr_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWLOCK : IN STD_LOGIC;
    revArr_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    revArr_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    revArr_rsc_AWID : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    revArr_rsci_oswt : IN STD_LOGIC;
    revArr_rsci_wen_comp : OUT STD_LOGIC;
    revArr_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    revArr_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
  );
END hybrid_core_revArr_rsci;

ARCHITECTURE v2 OF hybrid_core_revArr_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL revArr_rsci_biwt : STD_LOGIC;
  SIGNAL revArr_rsci_bdwt : STD_LOGIC;
  SIGNAL revArr_rsci_bcwt : STD_LOGIC;
  SIGNAL revArr_rsci_s_re_core_sct : STD_LOGIC;
  SIGNAL revArr_rsci_s_raddr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL revArr_rsci_s_din : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL revArr_rsci_s_rrdy : STD_LOGIC;
  SIGNAL revArr_rsci_s_wrdy : STD_LOGIC;
  SIGNAL revArr_rsc_is_idle : STD_LOGIC;
  SIGNAL revArr_rsci_s_din_mxwt_pconst : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL revArr_rsci_AWID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL revArr_rsci_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL revArr_rsci_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL revArr_rsci_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL revArr_rsci_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL revArr_rsci_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL revArr_rsci_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL revArr_rsci_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL revArr_rsci_AWUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL revArr_rsci_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL revArr_rsci_WUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_BID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL revArr_rsci_BUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_ARID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL revArr_rsci_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL revArr_rsci_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL revArr_rsci_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL revArr_rsci_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL revArr_rsci_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL revArr_rsci_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL revArr_rsci_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL revArr_rsci_ARUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_RID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL revArr_rsci_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL revArr_rsci_RUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL revArr_rsci_s_raddr_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL revArr_rsci_s_waddr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL revArr_rsci_s_din_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL revArr_rsci_s_dout : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      revArr_rsci_oswt : IN STD_LOGIC;
      revArr_rsci_biwt : OUT STD_LOGIC;
      revArr_rsci_bdwt : OUT STD_LOGIC;
      revArr_rsci_bcwt : IN STD_LOGIC;
      revArr_rsci_s_re_core_sct : OUT STD_LOGIC;
      revArr_rsci_s_rrdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_revArr_rsci_revArr_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      revArr_rsci_oswt : IN STD_LOGIC;
      revArr_rsci_wen_comp : OUT STD_LOGIC;
      revArr_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      revArr_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      revArr_rsci_biwt : IN STD_LOGIC;
      revArr_rsci_bdwt : IN STD_LOGIC;
      revArr_rsci_bcwt : OUT STD_LOGIC;
      revArr_rsci_s_raddr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      revArr_rsci_s_raddr_core_sct : IN STD_LOGIC;
      revArr_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr_core
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_din_mxwt :
      STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_din : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

BEGIN
  revArr_rsci : work.amba_comps.ccs_axi4_slave_mem
    GENERIC MAP(
      rscid => 0,
      depth => 32,
      op_width => 20,
      cwidth => 32,
      addr_w => 5,
      nopreload => 0,
      rst_ph => 0,
      ADDR_WIDTH => 12,
      DATA_WIDTH => 32,
      ID_WIDTH => 1,
      USER_WIDTH => 1,
      REGION_MAP_SIZE => 1,
      wBASE_ADDRESS => 0,
      rBASE_ADDRESS => 0
      )
    PORT MAP(
      ACLK => clk,
      ARESETn => '1',
      AWID => revArr_rsci_AWID,
      AWADDR => revArr_rsci_AWADDR,
      AWLEN => revArr_rsci_AWLEN,
      AWSIZE => revArr_rsci_AWSIZE,
      AWBURST => revArr_rsci_AWBURST,
      AWLOCK => revArr_rsc_AWLOCK,
      AWCACHE => revArr_rsci_AWCACHE,
      AWPROT => revArr_rsci_AWPROT,
      AWQOS => revArr_rsci_AWQOS,
      AWREGION => revArr_rsci_AWREGION,
      AWUSER => revArr_rsci_AWUSER,
      AWVALID => revArr_rsc_AWVALID,
      AWREADY => revArr_rsc_AWREADY,
      WDATA => revArr_rsci_WDATA,
      WSTRB => revArr_rsci_WSTRB,
      WLAST => revArr_rsc_WLAST,
      WUSER => revArr_rsci_WUSER,
      WVALID => revArr_rsc_WVALID,
      WREADY => revArr_rsc_WREADY,
      BID => revArr_rsci_BID,
      BRESP => revArr_rsci_BRESP,
      BUSER => revArr_rsci_BUSER,
      BVALID => revArr_rsc_BVALID,
      BREADY => revArr_rsc_BREADY,
      ARID => revArr_rsci_ARID,
      ARADDR => revArr_rsci_ARADDR,
      ARLEN => revArr_rsci_ARLEN,
      ARSIZE => revArr_rsci_ARSIZE,
      ARBURST => revArr_rsci_ARBURST,
      ARLOCK => revArr_rsc_ARLOCK,
      ARCACHE => revArr_rsci_ARCACHE,
      ARPROT => revArr_rsci_ARPROT,
      ARQOS => revArr_rsci_ARQOS,
      ARREGION => revArr_rsci_ARREGION,
      ARUSER => revArr_rsci_ARUSER,
      ARVALID => revArr_rsc_ARVALID,
      ARREADY => revArr_rsc_ARREADY,
      RID => revArr_rsci_RID,
      RDATA => revArr_rsci_RDATA,
      RRESP => revArr_rsci_RRESP,
      RLAST => revArr_rsc_RLAST,
      RUSER => revArr_rsci_RUSER,
      RVALID => revArr_rsc_RVALID,
      RREADY => revArr_rsc_RREADY,
      s_re => revArr_rsci_s_re_core_sct,
      s_we => '0',
      s_raddr => revArr_rsci_s_raddr_1,
      s_waddr => revArr_rsci_s_waddr,
      s_din => revArr_rsci_s_din_1,
      s_dout => revArr_rsci_s_dout,
      s_rrdy => revArr_rsci_s_rrdy,
      s_wrdy => revArr_rsci_s_wrdy,
      is_idle => revArr_rsc_is_idle,
      tr_write_done => revArr_rsc_tr_write_done,
      s_tdone => revArr_rsc_s_tdone
    );
  revArr_rsci_AWID(0) <= revArr_rsc_AWID;
  revArr_rsci_AWADDR <= revArr_rsc_AWADDR;
  revArr_rsci_AWLEN <= revArr_rsc_AWLEN;
  revArr_rsci_AWSIZE <= revArr_rsc_AWSIZE;
  revArr_rsci_AWBURST <= revArr_rsc_AWBURST;
  revArr_rsci_AWCACHE <= revArr_rsc_AWCACHE;
  revArr_rsci_AWPROT <= revArr_rsc_AWPROT;
  revArr_rsci_AWQOS <= revArr_rsc_AWQOS;
  revArr_rsci_AWREGION <= revArr_rsc_AWREGION;
  revArr_rsci_AWUSER(0) <= revArr_rsc_AWUSER;
  revArr_rsci_WDATA <= revArr_rsc_WDATA;
  revArr_rsci_WSTRB <= revArr_rsc_WSTRB;
  revArr_rsci_WUSER(0) <= revArr_rsc_WUSER;
  revArr_rsc_BID <= revArr_rsci_BID(0);
  revArr_rsc_BRESP <= revArr_rsci_BRESP;
  revArr_rsc_BUSER <= revArr_rsci_BUSER(0);
  revArr_rsci_ARID(0) <= revArr_rsc_ARID;
  revArr_rsci_ARADDR <= revArr_rsc_ARADDR;
  revArr_rsci_ARLEN <= revArr_rsc_ARLEN;
  revArr_rsci_ARSIZE <= revArr_rsc_ARSIZE;
  revArr_rsci_ARBURST <= revArr_rsc_ARBURST;
  revArr_rsci_ARCACHE <= revArr_rsc_ARCACHE;
  revArr_rsci_ARPROT <= revArr_rsc_ARPROT;
  revArr_rsci_ARQOS <= revArr_rsc_ARQOS;
  revArr_rsci_ARREGION <= revArr_rsc_ARREGION;
  revArr_rsci_ARUSER(0) <= revArr_rsc_ARUSER;
  revArr_rsc_RID <= revArr_rsci_RID(0);
  revArr_rsc_RDATA <= revArr_rsci_RDATA;
  revArr_rsc_RRESP <= revArr_rsci_RRESP;
  revArr_rsc_RUSER <= revArr_rsci_RUSER(0);
  revArr_rsci_s_raddr_1 <= revArr_rsci_s_raddr;
  revArr_rsci_s_waddr <= STD_LOGIC_VECTOR'( "00000");
  revArr_rsci_s_din <= revArr_rsci_s_din_1;
  revArr_rsci_s_dout <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");

  hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl_inst : hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      revArr_rsci_oswt => revArr_rsci_oswt,
      revArr_rsci_biwt => revArr_rsci_biwt,
      revArr_rsci_bdwt => revArr_rsci_bdwt,
      revArr_rsci_bcwt => revArr_rsci_bcwt,
      revArr_rsci_s_re_core_sct => revArr_rsci_s_re_core_sct,
      revArr_rsci_s_rrdy => revArr_rsci_s_rrdy
    );
  hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst : hybrid_core_revArr_rsci_revArr_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      revArr_rsci_oswt => revArr_rsci_oswt,
      revArr_rsci_wen_comp => revArr_rsci_wen_comp,
      revArr_rsci_s_raddr_core => hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr_core,
      revArr_rsci_s_din_mxwt => hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_din_mxwt,
      revArr_rsci_biwt => revArr_rsci_biwt,
      revArr_rsci_bdwt => revArr_rsci_bdwt,
      revArr_rsci_bcwt => revArr_rsci_bcwt,
      revArr_rsci_s_raddr => hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr,
      revArr_rsci_s_raddr_core_sct => revArr_rsci_s_re_core_sct,
      revArr_rsci_s_din => hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_din
    );
  hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr_core <= revArr_rsci_s_raddr_core;
  revArr_rsci_s_din_mxwt_pconst <= hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_din_mxwt;
  revArr_rsci_s_raddr <= hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_raddr;
  hybrid_core_revArr_rsci_revArr_rsc_wait_dp_inst_revArr_rsci_s_din <= revArr_rsci_s_din;

  revArr_rsci_s_din_mxwt <= revArr_rsci_s_din_mxwt_pconst;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_h_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_h_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_h_rsc_s_tdone : IN STD_LOGIC;
    twiddle_h_rsc_tr_write_done : IN STD_LOGIC;
    twiddle_h_rsc_RREADY : IN STD_LOGIC;
    twiddle_h_rsc_RVALID : OUT STD_LOGIC;
    twiddle_h_rsc_RUSER : OUT STD_LOGIC;
    twiddle_h_rsc_RLAST : OUT STD_LOGIC;
    twiddle_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_RID : OUT STD_LOGIC;
    twiddle_h_rsc_ARREADY : OUT STD_LOGIC;
    twiddle_h_rsc_ARVALID : IN STD_LOGIC;
    twiddle_h_rsc_ARUSER : IN STD_LOGIC;
    twiddle_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARLOCK : IN STD_LOGIC;
    twiddle_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_ARID : IN STD_LOGIC;
    twiddle_h_rsc_BREADY : IN STD_LOGIC;
    twiddle_h_rsc_BVALID : OUT STD_LOGIC;
    twiddle_h_rsc_BUSER : OUT STD_LOGIC;
    twiddle_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_BID : OUT STD_LOGIC;
    twiddle_h_rsc_WREADY : OUT STD_LOGIC;
    twiddle_h_rsc_WVALID : IN STD_LOGIC;
    twiddle_h_rsc_WUSER : IN STD_LOGIC;
    twiddle_h_rsc_WLAST : IN STD_LOGIC;
    twiddle_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_AWREADY : OUT STD_LOGIC;
    twiddle_h_rsc_AWVALID : IN STD_LOGIC;
    twiddle_h_rsc_AWUSER : IN STD_LOGIC;
    twiddle_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWLOCK : IN STD_LOGIC;
    twiddle_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_AWID : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_wen_comp : OUT STD_LOGIC;
    twiddle_h_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    twiddle_h_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_twiddle_h_rsci;

ARCHITECTURE v2 OF hybrid_core_twiddle_h_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bcwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_s_re_core_sct : STD_LOGIC;
  SIGNAL twiddle_h_rsci_s_raddr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL twiddle_h_rsci_s_din : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_s_rrdy : STD_LOGIC;
  SIGNAL twiddle_h_rsci_s_wrdy : STD_LOGIC;
  SIGNAL twiddle_h_rsc_is_idle : STD_LOGIC;

  SIGNAL twiddle_h_rsci_AWID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_h_rsci_AWUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_h_rsci_WUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_BID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_BUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_h_rsci_ARUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_RID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_RUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_h_rsci_s_raddr_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL twiddle_h_rsci_s_waddr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL twiddle_h_rsci_s_din_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_s_dout : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_biwt : OUT STD_LOGIC;
      twiddle_h_rsci_bdwt : OUT STD_LOGIC;
      twiddle_h_rsci_bcwt : IN STD_LOGIC;
      twiddle_h_rsci_s_re_core_sct : OUT STD_LOGIC;
      twiddle_h_rsci_s_rrdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_wen_comp : OUT STD_LOGIC;
      twiddle_h_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      twiddle_h_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_biwt : IN STD_LOGIC;
      twiddle_h_rsci_bdwt : IN STD_LOGIC;
      twiddle_h_rsci_bcwt : OUT STD_LOGIC;
      twiddle_h_rsci_s_raddr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      twiddle_h_rsci_s_raddr_core_sct : IN STD_LOGIC;
      twiddle_h_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_din_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_din
      : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  twiddle_h_rsci : work.amba_comps.ccs_axi4_slave_mem
    GENERIC MAP(
      rscid => 0,
      depth => 32,
      op_width => 32,
      cwidth => 32,
      addr_w => 5,
      nopreload => 0,
      rst_ph => 0,
      ADDR_WIDTH => 12,
      DATA_WIDTH => 32,
      ID_WIDTH => 1,
      USER_WIDTH => 1,
      REGION_MAP_SIZE => 1,
      wBASE_ADDRESS => 0,
      rBASE_ADDRESS => 0
      )
    PORT MAP(
      ACLK => clk,
      ARESETn => '1',
      AWID => twiddle_h_rsci_AWID,
      AWADDR => twiddle_h_rsci_AWADDR,
      AWLEN => twiddle_h_rsci_AWLEN,
      AWSIZE => twiddle_h_rsci_AWSIZE,
      AWBURST => twiddle_h_rsci_AWBURST,
      AWLOCK => twiddle_h_rsc_AWLOCK,
      AWCACHE => twiddle_h_rsci_AWCACHE,
      AWPROT => twiddle_h_rsci_AWPROT,
      AWQOS => twiddle_h_rsci_AWQOS,
      AWREGION => twiddle_h_rsci_AWREGION,
      AWUSER => twiddle_h_rsci_AWUSER,
      AWVALID => twiddle_h_rsc_AWVALID,
      AWREADY => twiddle_h_rsc_AWREADY,
      WDATA => twiddle_h_rsci_WDATA,
      WSTRB => twiddle_h_rsci_WSTRB,
      WLAST => twiddle_h_rsc_WLAST,
      WUSER => twiddle_h_rsci_WUSER,
      WVALID => twiddle_h_rsc_WVALID,
      WREADY => twiddle_h_rsc_WREADY,
      BID => twiddle_h_rsci_BID,
      BRESP => twiddle_h_rsci_BRESP,
      BUSER => twiddle_h_rsci_BUSER,
      BVALID => twiddle_h_rsc_BVALID,
      BREADY => twiddle_h_rsc_BREADY,
      ARID => twiddle_h_rsci_ARID,
      ARADDR => twiddle_h_rsci_ARADDR,
      ARLEN => twiddle_h_rsci_ARLEN,
      ARSIZE => twiddle_h_rsci_ARSIZE,
      ARBURST => twiddle_h_rsci_ARBURST,
      ARLOCK => twiddle_h_rsc_ARLOCK,
      ARCACHE => twiddle_h_rsci_ARCACHE,
      ARPROT => twiddle_h_rsci_ARPROT,
      ARQOS => twiddle_h_rsci_ARQOS,
      ARREGION => twiddle_h_rsci_ARREGION,
      ARUSER => twiddle_h_rsci_ARUSER,
      ARVALID => twiddle_h_rsc_ARVALID,
      ARREADY => twiddle_h_rsc_ARREADY,
      RID => twiddle_h_rsci_RID,
      RDATA => twiddle_h_rsci_RDATA,
      RRESP => twiddle_h_rsci_RRESP,
      RLAST => twiddle_h_rsc_RLAST,
      RUSER => twiddle_h_rsci_RUSER,
      RVALID => twiddle_h_rsc_RVALID,
      RREADY => twiddle_h_rsc_RREADY,
      s_re => twiddle_h_rsci_s_re_core_sct,
      s_we => '0',
      s_raddr => twiddle_h_rsci_s_raddr_1,
      s_waddr => twiddle_h_rsci_s_waddr,
      s_din => twiddle_h_rsci_s_din_1,
      s_dout => twiddle_h_rsci_s_dout,
      s_rrdy => twiddle_h_rsci_s_rrdy,
      s_wrdy => twiddle_h_rsci_s_wrdy,
      is_idle => twiddle_h_rsc_is_idle,
      tr_write_done => twiddle_h_rsc_tr_write_done,
      s_tdone => twiddle_h_rsc_s_tdone
    );
  twiddle_h_rsci_AWID(0) <= twiddle_h_rsc_AWID;
  twiddle_h_rsci_AWADDR <= twiddle_h_rsc_AWADDR;
  twiddle_h_rsci_AWLEN <= twiddle_h_rsc_AWLEN;
  twiddle_h_rsci_AWSIZE <= twiddle_h_rsc_AWSIZE;
  twiddle_h_rsci_AWBURST <= twiddle_h_rsc_AWBURST;
  twiddle_h_rsci_AWCACHE <= twiddle_h_rsc_AWCACHE;
  twiddle_h_rsci_AWPROT <= twiddle_h_rsc_AWPROT;
  twiddle_h_rsci_AWQOS <= twiddle_h_rsc_AWQOS;
  twiddle_h_rsci_AWREGION <= twiddle_h_rsc_AWREGION;
  twiddle_h_rsci_AWUSER(0) <= twiddle_h_rsc_AWUSER;
  twiddle_h_rsci_WDATA <= twiddle_h_rsc_WDATA;
  twiddle_h_rsci_WSTRB <= twiddle_h_rsc_WSTRB;
  twiddle_h_rsci_WUSER(0) <= twiddle_h_rsc_WUSER;
  twiddle_h_rsc_BID <= twiddle_h_rsci_BID(0);
  twiddle_h_rsc_BRESP <= twiddle_h_rsci_BRESP;
  twiddle_h_rsc_BUSER <= twiddle_h_rsci_BUSER(0);
  twiddle_h_rsci_ARID(0) <= twiddle_h_rsc_ARID;
  twiddle_h_rsci_ARADDR <= twiddle_h_rsc_ARADDR;
  twiddle_h_rsci_ARLEN <= twiddle_h_rsc_ARLEN;
  twiddle_h_rsci_ARSIZE <= twiddle_h_rsc_ARSIZE;
  twiddle_h_rsci_ARBURST <= twiddle_h_rsc_ARBURST;
  twiddle_h_rsci_ARCACHE <= twiddle_h_rsc_ARCACHE;
  twiddle_h_rsci_ARPROT <= twiddle_h_rsc_ARPROT;
  twiddle_h_rsci_ARQOS <= twiddle_h_rsc_ARQOS;
  twiddle_h_rsci_ARREGION <= twiddle_h_rsc_ARREGION;
  twiddle_h_rsci_ARUSER(0) <= twiddle_h_rsc_ARUSER;
  twiddle_h_rsc_RID <= twiddle_h_rsci_RID(0);
  twiddle_h_rsc_RDATA <= twiddle_h_rsci_RDATA;
  twiddle_h_rsc_RRESP <= twiddle_h_rsci_RRESP;
  twiddle_h_rsc_RUSER <= twiddle_h_rsci_RUSER(0);
  twiddle_h_rsci_s_raddr_1 <= twiddle_h_rsci_s_raddr;
  twiddle_h_rsci_s_waddr <= STD_LOGIC_VECTOR'( "00000");
  twiddle_h_rsci_s_din <= twiddle_h_rsci_s_din_1;
  twiddle_h_rsci_s_dout <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");

  hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl_inst : hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      twiddle_h_rsci_oswt => twiddle_h_rsci_oswt,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt,
      twiddle_h_rsci_bcwt => twiddle_h_rsci_bcwt,
      twiddle_h_rsci_s_re_core_sct => twiddle_h_rsci_s_re_core_sct,
      twiddle_h_rsci_s_rrdy => twiddle_h_rsci_s_rrdy
    );
  hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst : hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsci_oswt => twiddle_h_rsci_oswt,
      twiddle_h_rsci_wen_comp => twiddle_h_rsci_wen_comp,
      twiddle_h_rsci_s_raddr_core => hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core,
      twiddle_h_rsci_s_din_mxwt => hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_din_mxwt,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt,
      twiddle_h_rsci_bcwt => twiddle_h_rsci_bcwt,
      twiddle_h_rsci_s_raddr => hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr,
      twiddle_h_rsci_s_raddr_core_sct => twiddle_h_rsci_s_re_core_sct,
      twiddle_h_rsci_s_din => hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_din
    );
  hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr_core
      <= '0' & (twiddle_h_rsci_s_raddr_core(3 DOWNTO 0));
  twiddle_h_rsci_s_din_mxwt <= hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_din_mxwt;
  twiddle_h_rsci_s_raddr <= hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_raddr;
  hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_s_din <= twiddle_h_rsci_s_din;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_twiddle_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_twiddle_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_rsc_s_tdone : IN STD_LOGIC;
    twiddle_rsc_tr_write_done : IN STD_LOGIC;
    twiddle_rsc_RREADY : IN STD_LOGIC;
    twiddle_rsc_RVALID : OUT STD_LOGIC;
    twiddle_rsc_RUSER : OUT STD_LOGIC;
    twiddle_rsc_RLAST : OUT STD_LOGIC;
    twiddle_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_RID : OUT STD_LOGIC;
    twiddle_rsc_ARREADY : OUT STD_LOGIC;
    twiddle_rsc_ARVALID : IN STD_LOGIC;
    twiddle_rsc_ARUSER : IN STD_LOGIC;
    twiddle_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARLOCK : IN STD_LOGIC;
    twiddle_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_ARID : IN STD_LOGIC;
    twiddle_rsc_BREADY : IN STD_LOGIC;
    twiddle_rsc_BVALID : OUT STD_LOGIC;
    twiddle_rsc_BUSER : OUT STD_LOGIC;
    twiddle_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_BID : OUT STD_LOGIC;
    twiddle_rsc_WREADY : OUT STD_LOGIC;
    twiddle_rsc_WVALID : IN STD_LOGIC;
    twiddle_rsc_WUSER : IN STD_LOGIC;
    twiddle_rsc_WLAST : IN STD_LOGIC;
    twiddle_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_AWREADY : OUT STD_LOGIC;
    twiddle_rsc_AWVALID : IN STD_LOGIC;
    twiddle_rsc_AWUSER : IN STD_LOGIC;
    twiddle_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWLOCK : IN STD_LOGIC;
    twiddle_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_AWID : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_wen_comp : OUT STD_LOGIC;
    twiddle_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    twiddle_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_twiddle_rsci;

ARCHITECTURE v2 OF hybrid_core_twiddle_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_rsci_bcwt : STD_LOGIC;
  SIGNAL twiddle_rsci_s_re_core_sct : STD_LOGIC;
  SIGNAL twiddle_rsci_s_raddr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL twiddle_rsci_s_din : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_s_rrdy : STD_LOGIC;
  SIGNAL twiddle_rsci_s_wrdy : STD_LOGIC;
  SIGNAL twiddle_rsc_is_idle : STD_LOGIC;

  SIGNAL twiddle_rsci_AWID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_rsci_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsci_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL twiddle_rsci_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_rsci_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL twiddle_rsci_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_rsci_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_rsci_AWUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_rsci_WUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_BID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_BUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_ARID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_rsci_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsci_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL twiddle_rsci_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_rsci_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL twiddle_rsci_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_rsci_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL twiddle_rsci_ARUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_RID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_RUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL twiddle_rsci_s_raddr_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL twiddle_rsci_s_waddr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL twiddle_rsci_s_din_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_s_dout : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_biwt : OUT STD_LOGIC;
      twiddle_rsci_bdwt : OUT STD_LOGIC;
      twiddle_rsci_bcwt : IN STD_LOGIC;
      twiddle_rsci_s_re_core_sct : OUT STD_LOGIC;
      twiddle_rsci_s_rrdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_wen_comp : OUT STD_LOGIC;
      twiddle_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      twiddle_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_biwt : IN STD_LOGIC;
      twiddle_rsci_bdwt : IN STD_LOGIC;
      twiddle_rsci_bcwt : OUT STD_LOGIC;
      twiddle_rsci_s_raddr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      twiddle_rsci_s_raddr_core_sct : IN STD_LOGIC;
      twiddle_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_din_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr :
      STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_din : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

BEGIN
  twiddle_rsci : work.amba_comps.ccs_axi4_slave_mem
    GENERIC MAP(
      rscid => 0,
      depth => 32,
      op_width => 32,
      cwidth => 32,
      addr_w => 5,
      nopreload => 0,
      rst_ph => 0,
      ADDR_WIDTH => 12,
      DATA_WIDTH => 32,
      ID_WIDTH => 1,
      USER_WIDTH => 1,
      REGION_MAP_SIZE => 1,
      wBASE_ADDRESS => 0,
      rBASE_ADDRESS => 0
      )
    PORT MAP(
      ACLK => clk,
      ARESETn => '1',
      AWID => twiddle_rsci_AWID,
      AWADDR => twiddle_rsci_AWADDR,
      AWLEN => twiddle_rsci_AWLEN,
      AWSIZE => twiddle_rsci_AWSIZE,
      AWBURST => twiddle_rsci_AWBURST,
      AWLOCK => twiddle_rsc_AWLOCK,
      AWCACHE => twiddle_rsci_AWCACHE,
      AWPROT => twiddle_rsci_AWPROT,
      AWQOS => twiddle_rsci_AWQOS,
      AWREGION => twiddle_rsci_AWREGION,
      AWUSER => twiddle_rsci_AWUSER,
      AWVALID => twiddle_rsc_AWVALID,
      AWREADY => twiddle_rsc_AWREADY,
      WDATA => twiddle_rsci_WDATA,
      WSTRB => twiddle_rsci_WSTRB,
      WLAST => twiddle_rsc_WLAST,
      WUSER => twiddle_rsci_WUSER,
      WVALID => twiddle_rsc_WVALID,
      WREADY => twiddle_rsc_WREADY,
      BID => twiddle_rsci_BID,
      BRESP => twiddle_rsci_BRESP,
      BUSER => twiddle_rsci_BUSER,
      BVALID => twiddle_rsc_BVALID,
      BREADY => twiddle_rsc_BREADY,
      ARID => twiddle_rsci_ARID,
      ARADDR => twiddle_rsci_ARADDR,
      ARLEN => twiddle_rsci_ARLEN,
      ARSIZE => twiddle_rsci_ARSIZE,
      ARBURST => twiddle_rsci_ARBURST,
      ARLOCK => twiddle_rsc_ARLOCK,
      ARCACHE => twiddle_rsci_ARCACHE,
      ARPROT => twiddle_rsci_ARPROT,
      ARQOS => twiddle_rsci_ARQOS,
      ARREGION => twiddle_rsci_ARREGION,
      ARUSER => twiddle_rsci_ARUSER,
      ARVALID => twiddle_rsc_ARVALID,
      ARREADY => twiddle_rsc_ARREADY,
      RID => twiddle_rsci_RID,
      RDATA => twiddle_rsci_RDATA,
      RRESP => twiddle_rsci_RRESP,
      RLAST => twiddle_rsc_RLAST,
      RUSER => twiddle_rsci_RUSER,
      RVALID => twiddle_rsc_RVALID,
      RREADY => twiddle_rsc_RREADY,
      s_re => twiddle_rsci_s_re_core_sct,
      s_we => '0',
      s_raddr => twiddle_rsci_s_raddr_1,
      s_waddr => twiddle_rsci_s_waddr,
      s_din => twiddle_rsci_s_din_1,
      s_dout => twiddle_rsci_s_dout,
      s_rrdy => twiddle_rsci_s_rrdy,
      s_wrdy => twiddle_rsci_s_wrdy,
      is_idle => twiddle_rsc_is_idle,
      tr_write_done => twiddle_rsc_tr_write_done,
      s_tdone => twiddle_rsc_s_tdone
    );
  twiddle_rsci_AWID(0) <= twiddle_rsc_AWID;
  twiddle_rsci_AWADDR <= twiddle_rsc_AWADDR;
  twiddle_rsci_AWLEN <= twiddle_rsc_AWLEN;
  twiddle_rsci_AWSIZE <= twiddle_rsc_AWSIZE;
  twiddle_rsci_AWBURST <= twiddle_rsc_AWBURST;
  twiddle_rsci_AWCACHE <= twiddle_rsc_AWCACHE;
  twiddle_rsci_AWPROT <= twiddle_rsc_AWPROT;
  twiddle_rsci_AWQOS <= twiddle_rsc_AWQOS;
  twiddle_rsci_AWREGION <= twiddle_rsc_AWREGION;
  twiddle_rsci_AWUSER(0) <= twiddle_rsc_AWUSER;
  twiddle_rsci_WDATA <= twiddle_rsc_WDATA;
  twiddle_rsci_WSTRB <= twiddle_rsc_WSTRB;
  twiddle_rsci_WUSER(0) <= twiddle_rsc_WUSER;
  twiddle_rsc_BID <= twiddle_rsci_BID(0);
  twiddle_rsc_BRESP <= twiddle_rsci_BRESP;
  twiddle_rsc_BUSER <= twiddle_rsci_BUSER(0);
  twiddle_rsci_ARID(0) <= twiddle_rsc_ARID;
  twiddle_rsci_ARADDR <= twiddle_rsc_ARADDR;
  twiddle_rsci_ARLEN <= twiddle_rsc_ARLEN;
  twiddle_rsci_ARSIZE <= twiddle_rsc_ARSIZE;
  twiddle_rsci_ARBURST <= twiddle_rsc_ARBURST;
  twiddle_rsci_ARCACHE <= twiddle_rsc_ARCACHE;
  twiddle_rsci_ARPROT <= twiddle_rsc_ARPROT;
  twiddle_rsci_ARQOS <= twiddle_rsc_ARQOS;
  twiddle_rsci_ARREGION <= twiddle_rsc_ARREGION;
  twiddle_rsci_ARUSER(0) <= twiddle_rsc_ARUSER;
  twiddle_rsc_RID <= twiddle_rsci_RID(0);
  twiddle_rsc_RDATA <= twiddle_rsci_RDATA;
  twiddle_rsc_RRESP <= twiddle_rsci_RRESP;
  twiddle_rsc_RUSER <= twiddle_rsci_RUSER(0);
  twiddle_rsci_s_raddr_1 <= twiddle_rsci_s_raddr;
  twiddle_rsci_s_waddr <= STD_LOGIC_VECTOR'( "00000");
  twiddle_rsci_s_din <= twiddle_rsci_s_din_1;
  twiddle_rsci_s_dout <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");

  hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl_inst : hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      twiddle_rsci_oswt => twiddle_rsci_oswt,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt,
      twiddle_rsci_bcwt => twiddle_rsci_bcwt,
      twiddle_rsci_s_re_core_sct => twiddle_rsci_s_re_core_sct,
      twiddle_rsci_s_rrdy => twiddle_rsci_s_rrdy
    );
  hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst : hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsci_oswt => twiddle_rsci_oswt,
      twiddle_rsci_wen_comp => twiddle_rsci_wen_comp,
      twiddle_rsci_s_raddr_core => hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core,
      twiddle_rsci_s_din_mxwt => hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_din_mxwt,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt,
      twiddle_rsci_bcwt => twiddle_rsci_bcwt,
      twiddle_rsci_s_raddr => hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr,
      twiddle_rsci_s_raddr_core_sct => twiddle_rsci_s_re_core_sct,
      twiddle_rsci_s_din => hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_din
    );
  hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr_core <=
      '0' & (twiddle_rsci_s_raddr_core(3 DOWNTO 0));
  twiddle_rsci_s_din_mxwt <= hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_din_mxwt;
  twiddle_rsci_s_raddr <= hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_raddr;
  hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp_inst_twiddle_rsci_s_din <= twiddle_rsci_s_din;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core_x_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core_x_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    x_rsc_s_tdone : IN STD_LOGIC;
    x_rsc_tr_write_done : IN STD_LOGIC;
    x_rsc_RREADY : IN STD_LOGIC;
    x_rsc_RVALID : OUT STD_LOGIC;
    x_rsc_RUSER : OUT STD_LOGIC;
    x_rsc_RLAST : OUT STD_LOGIC;
    x_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsc_RID : OUT STD_LOGIC;
    x_rsc_ARREADY : OUT STD_LOGIC;
    x_rsc_ARVALID : IN STD_LOGIC;
    x_rsc_ARUSER : IN STD_LOGIC;
    x_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARLOCK : IN STD_LOGIC;
    x_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    x_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    x_rsc_ARID : IN STD_LOGIC;
    x_rsc_BREADY : IN STD_LOGIC;
    x_rsc_BVALID : OUT STD_LOGIC;
    x_rsc_BUSER : OUT STD_LOGIC;
    x_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_BID : OUT STD_LOGIC;
    x_rsc_WREADY : OUT STD_LOGIC;
    x_rsc_WVALID : IN STD_LOGIC;
    x_rsc_WUSER : IN STD_LOGIC;
    x_rsc_WLAST : IN STD_LOGIC;
    x_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsc_AWREADY : OUT STD_LOGIC;
    x_rsc_AWVALID : IN STD_LOGIC;
    x_rsc_AWUSER : IN STD_LOGIC;
    x_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWLOCK : IN STD_LOGIC;
    x_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    x_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    x_rsc_AWID : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    x_rsci_oswt : IN STD_LOGIC;
    x_rsci_wen_comp : OUT STD_LOGIC;
    x_rsci_oswt_1 : IN STD_LOGIC;
    x_rsci_wen_comp_1 : OUT STD_LOGIC;
    x_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    x_rsci_s_waddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    x_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsci_s_dout_core : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END hybrid_core_x_rsci;

ARCHITECTURE v2 OF hybrid_core_x_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL x_rsci_biwt : STD_LOGIC;
  SIGNAL x_rsci_bdwt : STD_LOGIC;
  SIGNAL x_rsci_bcwt : STD_LOGIC;
  SIGNAL x_rsci_s_re_core_sct : STD_LOGIC;
  SIGNAL x_rsci_biwt_1 : STD_LOGIC;
  SIGNAL x_rsci_bdwt_2 : STD_LOGIC;
  SIGNAL x_rsci_bcwt_1 : STD_LOGIC;
  SIGNAL x_rsci_s_we_core_sct : STD_LOGIC;
  SIGNAL x_rsci_s_raddr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL x_rsci_s_waddr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL x_rsci_s_din : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL x_rsci_s_dout : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL x_rsci_s_rrdy : STD_LOGIC;
  SIGNAL x_rsci_s_wrdy : STD_LOGIC;
  SIGNAL x_rsc_is_idle_1 : STD_LOGIC;

  SIGNAL x_rsci_AWID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL x_rsci_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL x_rsci_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_rsci_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL x_rsci_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL x_rsci_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_rsci_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL x_rsci_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL x_rsci_AWUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL x_rsci_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL x_rsci_WUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_BID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL x_rsci_BUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_ARID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL x_rsci_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL x_rsci_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_rsci_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL x_rsci_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL x_rsci_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL x_rsci_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL x_rsci_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL x_rsci_ARUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_RID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL x_rsci_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL x_rsci_RUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL x_rsci_s_raddr_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL x_rsci_s_waddr_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL x_rsci_s_din_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL x_rsci_s_dout_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT hybrid_core_x_rsci_x_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      x_rsci_oswt : IN STD_LOGIC;
      x_rsci_oswt_1 : IN STD_LOGIC;
      x_rsci_biwt : OUT STD_LOGIC;
      x_rsci_bdwt : OUT STD_LOGIC;
      x_rsci_bcwt : IN STD_LOGIC;
      x_rsci_s_re_core_sct : OUT STD_LOGIC;
      x_rsci_biwt_1 : OUT STD_LOGIC;
      x_rsci_bdwt_2 : OUT STD_LOGIC;
      x_rsci_bcwt_1 : IN STD_LOGIC;
      x_rsci_s_we_core_sct : OUT STD_LOGIC;
      x_rsci_s_rrdy : IN STD_LOGIC;
      x_rsci_s_wrdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_x_rsci_x_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      x_rsci_oswt : IN STD_LOGIC;
      x_rsci_wen_comp : OUT STD_LOGIC;
      x_rsci_oswt_1 : IN STD_LOGIC;
      x_rsci_wen_comp_1 : OUT STD_LOGIC;
      x_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      x_rsci_s_waddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      x_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      x_rsci_s_dout_core : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      x_rsci_biwt : IN STD_LOGIC;
      x_rsci_bdwt : IN STD_LOGIC;
      x_rsci_bcwt : OUT STD_LOGIC;
      x_rsci_biwt_1 : IN STD_LOGIC;
      x_rsci_bdwt_2 : IN STD_LOGIC;
      x_rsci_bcwt_1 : OUT STD_LOGIC;
      x_rsci_s_raddr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      x_rsci_s_raddr_core_sct : IN STD_LOGIC;
      x_rsci_s_waddr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      x_rsci_s_waddr_core_sct : IN STD_LOGIC;
      x_rsci_s_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      x_rsci_s_dout : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_raddr_core : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_waddr_core : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_din_mxwt : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_dout_core : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_raddr : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_waddr : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_din : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_dout : STD_LOGIC_VECTOR (31
      DOWNTO 0);

BEGIN
  x_rsci : work.amba_comps.ccs_axi4_slave_mem
    GENERIC MAP(
      rscid => 0,
      depth => 1024,
      op_width => 32,
      cwidth => 32,
      addr_w => 10,
      nopreload => 0,
      rst_ph => 0,
      ADDR_WIDTH => 12,
      DATA_WIDTH => 32,
      ID_WIDTH => 1,
      USER_WIDTH => 1,
      REGION_MAP_SIZE => 1,
      wBASE_ADDRESS => 0,
      rBASE_ADDRESS => 0
      )
    PORT MAP(
      ACLK => clk,
      ARESETn => '1',
      AWID => x_rsci_AWID,
      AWADDR => x_rsci_AWADDR,
      AWLEN => x_rsci_AWLEN,
      AWSIZE => x_rsci_AWSIZE,
      AWBURST => x_rsci_AWBURST,
      AWLOCK => x_rsc_AWLOCK,
      AWCACHE => x_rsci_AWCACHE,
      AWPROT => x_rsci_AWPROT,
      AWQOS => x_rsci_AWQOS,
      AWREGION => x_rsci_AWREGION,
      AWUSER => x_rsci_AWUSER,
      AWVALID => x_rsc_AWVALID,
      AWREADY => x_rsc_AWREADY,
      WDATA => x_rsci_WDATA,
      WSTRB => x_rsci_WSTRB,
      WLAST => x_rsc_WLAST,
      WUSER => x_rsci_WUSER,
      WVALID => x_rsc_WVALID,
      WREADY => x_rsc_WREADY,
      BID => x_rsci_BID,
      BRESP => x_rsci_BRESP,
      BUSER => x_rsci_BUSER,
      BVALID => x_rsc_BVALID,
      BREADY => x_rsc_BREADY,
      ARID => x_rsci_ARID,
      ARADDR => x_rsci_ARADDR,
      ARLEN => x_rsci_ARLEN,
      ARSIZE => x_rsci_ARSIZE,
      ARBURST => x_rsci_ARBURST,
      ARLOCK => x_rsc_ARLOCK,
      ARCACHE => x_rsci_ARCACHE,
      ARPROT => x_rsci_ARPROT,
      ARQOS => x_rsci_ARQOS,
      ARREGION => x_rsci_ARREGION,
      ARUSER => x_rsci_ARUSER,
      ARVALID => x_rsc_ARVALID,
      ARREADY => x_rsc_ARREADY,
      RID => x_rsci_RID,
      RDATA => x_rsci_RDATA,
      RRESP => x_rsci_RRESP,
      RLAST => x_rsc_RLAST,
      RUSER => x_rsci_RUSER,
      RVALID => x_rsc_RVALID,
      RREADY => x_rsc_RREADY,
      s_re => x_rsci_s_re_core_sct,
      s_we => x_rsci_s_we_core_sct,
      s_raddr => x_rsci_s_raddr_1,
      s_waddr => x_rsci_s_waddr_1,
      s_din => x_rsci_s_din_1,
      s_dout => x_rsci_s_dout_1,
      s_rrdy => x_rsci_s_rrdy,
      s_wrdy => x_rsci_s_wrdy,
      is_idle => x_rsc_is_idle_1,
      tr_write_done => x_rsc_tr_write_done,
      s_tdone => x_rsc_s_tdone
    );
  x_rsci_AWID(0) <= x_rsc_AWID;
  x_rsci_AWADDR <= x_rsc_AWADDR;
  x_rsci_AWLEN <= x_rsc_AWLEN;
  x_rsci_AWSIZE <= x_rsc_AWSIZE;
  x_rsci_AWBURST <= x_rsc_AWBURST;
  x_rsci_AWCACHE <= x_rsc_AWCACHE;
  x_rsci_AWPROT <= x_rsc_AWPROT;
  x_rsci_AWQOS <= x_rsc_AWQOS;
  x_rsci_AWREGION <= x_rsc_AWREGION;
  x_rsci_AWUSER(0) <= x_rsc_AWUSER;
  x_rsci_WDATA <= x_rsc_WDATA;
  x_rsci_WSTRB <= x_rsc_WSTRB;
  x_rsci_WUSER(0) <= x_rsc_WUSER;
  x_rsc_BID <= x_rsci_BID(0);
  x_rsc_BRESP <= x_rsci_BRESP;
  x_rsc_BUSER <= x_rsci_BUSER(0);
  x_rsci_ARID(0) <= x_rsc_ARID;
  x_rsci_ARADDR <= x_rsc_ARADDR;
  x_rsci_ARLEN <= x_rsc_ARLEN;
  x_rsci_ARSIZE <= x_rsc_ARSIZE;
  x_rsci_ARBURST <= x_rsc_ARBURST;
  x_rsci_ARCACHE <= x_rsc_ARCACHE;
  x_rsci_ARPROT <= x_rsc_ARPROT;
  x_rsci_ARQOS <= x_rsc_ARQOS;
  x_rsci_ARREGION <= x_rsc_ARREGION;
  x_rsci_ARUSER(0) <= x_rsc_ARUSER;
  x_rsc_RID <= x_rsci_RID(0);
  x_rsc_RDATA <= x_rsci_RDATA;
  x_rsc_RRESP <= x_rsci_RRESP;
  x_rsc_RUSER <= x_rsci_RUSER(0);
  x_rsci_s_raddr_1 <= x_rsci_s_raddr;
  x_rsci_s_waddr_1 <= x_rsci_s_waddr;
  x_rsci_s_din <= x_rsci_s_din_1;
  x_rsci_s_dout_1 <= x_rsci_s_dout;

  hybrid_core_x_rsci_x_rsc_wait_ctrl_inst : hybrid_core_x_rsci_x_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      x_rsci_oswt => x_rsci_oswt,
      x_rsci_oswt_1 => x_rsci_oswt_1,
      x_rsci_biwt => x_rsci_biwt,
      x_rsci_bdwt => x_rsci_bdwt,
      x_rsci_bcwt => x_rsci_bcwt,
      x_rsci_s_re_core_sct => x_rsci_s_re_core_sct,
      x_rsci_biwt_1 => x_rsci_biwt_1,
      x_rsci_bdwt_2 => x_rsci_bdwt_2,
      x_rsci_bcwt_1 => x_rsci_bcwt_1,
      x_rsci_s_we_core_sct => x_rsci_s_we_core_sct,
      x_rsci_s_rrdy => x_rsci_s_rrdy,
      x_rsci_s_wrdy => x_rsci_s_wrdy
    );
  hybrid_core_x_rsci_x_rsc_wait_dp_inst : hybrid_core_x_rsci_x_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      x_rsci_oswt => x_rsci_oswt,
      x_rsci_wen_comp => x_rsci_wen_comp,
      x_rsci_oswt_1 => x_rsci_oswt_1,
      x_rsci_wen_comp_1 => x_rsci_wen_comp_1,
      x_rsci_s_raddr_core => hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_raddr_core,
      x_rsci_s_waddr_core => hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_waddr_core,
      x_rsci_s_din_mxwt => hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_din_mxwt,
      x_rsci_s_dout_core => hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_dout_core,
      x_rsci_biwt => x_rsci_biwt,
      x_rsci_bdwt => x_rsci_bdwt,
      x_rsci_bcwt => x_rsci_bcwt,
      x_rsci_biwt_1 => x_rsci_biwt_1,
      x_rsci_bdwt_2 => x_rsci_bdwt_2,
      x_rsci_bcwt_1 => x_rsci_bcwt_1,
      x_rsci_s_raddr => hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_raddr,
      x_rsci_s_raddr_core_sct => x_rsci_s_re_core_sct,
      x_rsci_s_waddr => hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_waddr,
      x_rsci_s_waddr_core_sct => x_rsci_s_we_core_sct,
      x_rsci_s_din => hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_din,
      x_rsci_s_dout => hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_dout
    );
  hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_raddr_core <= x_rsci_s_raddr_core;
  hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_waddr_core <= x_rsci_s_waddr_core;
  x_rsci_s_din_mxwt <= hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_din_mxwt;
  hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_dout_core <= x_rsci_s_dout_core;
  x_rsci_s_raddr <= hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_raddr;
  x_rsci_s_waddr <= hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_waddr;
  hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_din <= x_rsci_s_din;
  x_rsci_s_dout <= hybrid_core_x_rsci_x_rsc_wait_dp_inst_x_rsci_s_dout;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    x_rsc_s_tdone : IN STD_LOGIC;
    x_rsc_tr_write_done : IN STD_LOGIC;
    x_rsc_RREADY : IN STD_LOGIC;
    x_rsc_RVALID : OUT STD_LOGIC;
    x_rsc_RUSER : OUT STD_LOGIC;
    x_rsc_RLAST : OUT STD_LOGIC;
    x_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsc_RID : OUT STD_LOGIC;
    x_rsc_ARREADY : OUT STD_LOGIC;
    x_rsc_ARVALID : IN STD_LOGIC;
    x_rsc_ARUSER : IN STD_LOGIC;
    x_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARLOCK : IN STD_LOGIC;
    x_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    x_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    x_rsc_ARID : IN STD_LOGIC;
    x_rsc_BREADY : IN STD_LOGIC;
    x_rsc_BVALID : OUT STD_LOGIC;
    x_rsc_BUSER : OUT STD_LOGIC;
    x_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_BID : OUT STD_LOGIC;
    x_rsc_WREADY : OUT STD_LOGIC;
    x_rsc_WVALID : IN STD_LOGIC;
    x_rsc_WUSER : IN STD_LOGIC;
    x_rsc_WLAST : IN STD_LOGIC;
    x_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsc_AWREADY : OUT STD_LOGIC;
    x_rsc_AWVALID : IN STD_LOGIC;
    x_rsc_AWUSER : IN STD_LOGIC;
    x_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWLOCK : IN STD_LOGIC;
    x_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    x_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    x_rsc_AWID : IN STD_LOGIC;
    x_rsc_triosy_lz : OUT STD_LOGIC;
    m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    m_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_s_tdone : IN STD_LOGIC;
    twiddle_rsc_tr_write_done : IN STD_LOGIC;
    twiddle_rsc_RREADY : IN STD_LOGIC;
    twiddle_rsc_RVALID : OUT STD_LOGIC;
    twiddle_rsc_RUSER : OUT STD_LOGIC;
    twiddle_rsc_RLAST : OUT STD_LOGIC;
    twiddle_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_RID : OUT STD_LOGIC;
    twiddle_rsc_ARREADY : OUT STD_LOGIC;
    twiddle_rsc_ARVALID : IN STD_LOGIC;
    twiddle_rsc_ARUSER : IN STD_LOGIC;
    twiddle_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARLOCK : IN STD_LOGIC;
    twiddle_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_ARID : IN STD_LOGIC;
    twiddle_rsc_BREADY : IN STD_LOGIC;
    twiddle_rsc_BVALID : OUT STD_LOGIC;
    twiddle_rsc_BUSER : OUT STD_LOGIC;
    twiddle_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_BID : OUT STD_LOGIC;
    twiddle_rsc_WREADY : OUT STD_LOGIC;
    twiddle_rsc_WVALID : IN STD_LOGIC;
    twiddle_rsc_WUSER : IN STD_LOGIC;
    twiddle_rsc_WLAST : IN STD_LOGIC;
    twiddle_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_AWREADY : OUT STD_LOGIC;
    twiddle_rsc_AWVALID : IN STD_LOGIC;
    twiddle_rsc_AWUSER : IN STD_LOGIC;
    twiddle_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWLOCK : IN STD_LOGIC;
    twiddle_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_AWID : IN STD_LOGIC;
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_s_tdone : IN STD_LOGIC;
    twiddle_h_rsc_tr_write_done : IN STD_LOGIC;
    twiddle_h_rsc_RREADY : IN STD_LOGIC;
    twiddle_h_rsc_RVALID : OUT STD_LOGIC;
    twiddle_h_rsc_RUSER : OUT STD_LOGIC;
    twiddle_h_rsc_RLAST : OUT STD_LOGIC;
    twiddle_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_RID : OUT STD_LOGIC;
    twiddle_h_rsc_ARREADY : OUT STD_LOGIC;
    twiddle_h_rsc_ARVALID : IN STD_LOGIC;
    twiddle_h_rsc_ARUSER : IN STD_LOGIC;
    twiddle_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARLOCK : IN STD_LOGIC;
    twiddle_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_ARID : IN STD_LOGIC;
    twiddle_h_rsc_BREADY : IN STD_LOGIC;
    twiddle_h_rsc_BVALID : OUT STD_LOGIC;
    twiddle_h_rsc_BUSER : OUT STD_LOGIC;
    twiddle_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_BID : OUT STD_LOGIC;
    twiddle_h_rsc_WREADY : OUT STD_LOGIC;
    twiddle_h_rsc_WVALID : IN STD_LOGIC;
    twiddle_h_rsc_WUSER : IN STD_LOGIC;
    twiddle_h_rsc_WLAST : IN STD_LOGIC;
    twiddle_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_AWREADY : OUT STD_LOGIC;
    twiddle_h_rsc_AWVALID : IN STD_LOGIC;
    twiddle_h_rsc_AWUSER : IN STD_LOGIC;
    twiddle_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWLOCK : IN STD_LOGIC;
    twiddle_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_AWID : IN STD_LOGIC;
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    revArr_rsc_s_tdone : IN STD_LOGIC;
    revArr_rsc_tr_write_done : IN STD_LOGIC;
    revArr_rsc_RREADY : IN STD_LOGIC;
    revArr_rsc_RVALID : OUT STD_LOGIC;
    revArr_rsc_RUSER : OUT STD_LOGIC;
    revArr_rsc_RLAST : OUT STD_LOGIC;
    revArr_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    revArr_rsc_RID : OUT STD_LOGIC;
    revArr_rsc_ARREADY : OUT STD_LOGIC;
    revArr_rsc_ARVALID : IN STD_LOGIC;
    revArr_rsc_ARUSER : IN STD_LOGIC;
    revArr_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARLOCK : IN STD_LOGIC;
    revArr_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    revArr_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    revArr_rsc_ARID : IN STD_LOGIC;
    revArr_rsc_BREADY : IN STD_LOGIC;
    revArr_rsc_BVALID : OUT STD_LOGIC;
    revArr_rsc_BUSER : OUT STD_LOGIC;
    revArr_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_BID : OUT STD_LOGIC;
    revArr_rsc_WREADY : OUT STD_LOGIC;
    revArr_rsc_WVALID : IN STD_LOGIC;
    revArr_rsc_WUSER : IN STD_LOGIC;
    revArr_rsc_WLAST : IN STD_LOGIC;
    revArr_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    revArr_rsc_AWREADY : OUT STD_LOGIC;
    revArr_rsc_AWVALID : IN STD_LOGIC;
    revArr_rsc_AWUSER : IN STD_LOGIC;
    revArr_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWLOCK : IN STD_LOGIC;
    revArr_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    revArr_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    revArr_rsc_AWID : IN STD_LOGIC;
    revArr_rsc_triosy_lz : OUT STD_LOGIC;
    tw_rsc_s_tdone : IN STD_LOGIC;
    tw_rsc_tr_write_done : IN STD_LOGIC;
    tw_rsc_RREADY : IN STD_LOGIC;
    tw_rsc_RVALID : OUT STD_LOGIC;
    tw_rsc_RUSER : OUT STD_LOGIC;
    tw_rsc_RLAST : OUT STD_LOGIC;
    tw_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_rsc_RID : OUT STD_LOGIC;
    tw_rsc_ARREADY : OUT STD_LOGIC;
    tw_rsc_ARVALID : IN STD_LOGIC;
    tw_rsc_ARUSER : IN STD_LOGIC;
    tw_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARLOCK : IN STD_LOGIC;
    tw_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_rsc_ARID : IN STD_LOGIC;
    tw_rsc_BREADY : IN STD_LOGIC;
    tw_rsc_BVALID : OUT STD_LOGIC;
    tw_rsc_BUSER : OUT STD_LOGIC;
    tw_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_BID : OUT STD_LOGIC;
    tw_rsc_WREADY : OUT STD_LOGIC;
    tw_rsc_WVALID : IN STD_LOGIC;
    tw_rsc_WUSER : IN STD_LOGIC;
    tw_rsc_WLAST : IN STD_LOGIC;
    tw_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_rsc_AWREADY : OUT STD_LOGIC;
    tw_rsc_AWVALID : IN STD_LOGIC;
    tw_rsc_AWUSER : IN STD_LOGIC;
    tw_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWLOCK : IN STD_LOGIC;
    tw_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_rsc_AWID : IN STD_LOGIC;
    tw_rsc_triosy_lz : OUT STD_LOGIC;
    tw_h_rsc_s_tdone : IN STD_LOGIC;
    tw_h_rsc_tr_write_done : IN STD_LOGIC;
    tw_h_rsc_RREADY : IN STD_LOGIC;
    tw_h_rsc_RVALID : OUT STD_LOGIC;
    tw_h_rsc_RUSER : OUT STD_LOGIC;
    tw_h_rsc_RLAST : OUT STD_LOGIC;
    tw_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_h_rsc_RID : OUT STD_LOGIC;
    tw_h_rsc_ARREADY : OUT STD_LOGIC;
    tw_h_rsc_ARVALID : IN STD_LOGIC;
    tw_h_rsc_ARUSER : IN STD_LOGIC;
    tw_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARLOCK : IN STD_LOGIC;
    tw_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_h_rsc_ARID : IN STD_LOGIC;
    tw_h_rsc_BREADY : IN STD_LOGIC;
    tw_h_rsc_BVALID : OUT STD_LOGIC;
    tw_h_rsc_BUSER : OUT STD_LOGIC;
    tw_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_BID : OUT STD_LOGIC;
    tw_h_rsc_WREADY : OUT STD_LOGIC;
    tw_h_rsc_WVALID : IN STD_LOGIC;
    tw_h_rsc_WUSER : IN STD_LOGIC;
    tw_h_rsc_WLAST : IN STD_LOGIC;
    tw_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_h_rsc_AWREADY : OUT STD_LOGIC;
    tw_h_rsc_AWVALID : IN STD_LOGIC;
    tw_h_rsc_AWUSER : IN STD_LOGIC;
    tw_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWLOCK : IN STD_LOGIC;
    tw_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_h_rsc_AWID : IN STD_LOGIC;
    tw_h_rsc_triosy_lz : OUT STD_LOGIC;
    xx_rsci_clken_d : OUT STD_LOGIC;
    xx_rsci_d_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xx_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xx_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xx_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xx_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    yy_rsci_clken_d : OUT STD_LOGIC;
    yy_rsci_d_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    yy_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    yy_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    yy_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    yy_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    S34_OUTER_LOOP_for_tf_mul_cmp_a : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    S34_OUTER_LOOP_for_tf_mul_cmp_b : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    S34_OUTER_LOOP_for_tf_mul_cmp_z : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    xx_rsci_we_d_pff : OUT STD_LOGIC;
    yy_rsci_we_d_pff : OUT STD_LOGIC
  );
END hybrid_core;

ARCHITECTURE v2 OF hybrid_core IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL core_wen : STD_LOGIC;
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL x_rsci_wen_comp : STD_LOGIC;
  SIGNAL x_rsci_wen_comp_1 : STD_LOGIC;
  SIGNAL x_rsci_s_din_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL x_rsci_s_dout_core : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_wen_comp : STD_LOGIC;
  SIGNAL twiddle_rsci_s_din_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_wen_comp : STD_LOGIC;
  SIGNAL twiddle_h_rsci_s_din_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL revArr_rsci_wen_comp : STD_LOGIC;
  SIGNAL revArr_rsci_s_raddr_core : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL revArr_rsci_s_din_mxwt : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL tw_rsci_wen_comp : STD_LOGIC;
  SIGNAL tw_rsci_s_din_mxwt : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL tw_h_rsci_wen_comp : STD_LOGIC;
  SIGNAL tw_h_rsci_s_din_mxwt : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL mult_12_z_mul_cmp_en : STD_LOGIC;
  SIGNAL mult_12_z_mul_cmp_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_en : STD_LOGIC;
  SIGNAL mult_z_mul_cmp_z : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL x_rsci_s_raddr_core_9_5 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL x_rsci_s_raddr_core_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL x_rsci_s_waddr_core_9_5 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL x_rsci_s_waddr_core_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S34_OUTER_LOOP_for_k_slc_S34_OUTER_LOOP_for_k_sva_19_5_4_0_1 : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL S34_OUTER_LOOP_for_k_sva_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_tmp_19 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL nor_tmp_9 : STD_LOGIC;
  SIGNAL mux_tmp_37 : STD_LOGIC;
  SIGNAL or_tmp_29 : STD_LOGIC;
  SIGNAL or_tmp_52 : STD_LOGIC;
  SIGNAL nor_tmp_14 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_22 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL mux_tmp_57 : STD_LOGIC;
  SIGNAL mux_tmp_66 : STD_LOGIC;
  SIGNAL mux_tmp_70 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL or_tmp_77 : STD_LOGIC;
  SIGNAL or_tmp_82 : STD_LOGIC;
  SIGNAL mux_tmp_79 : STD_LOGIC;
  SIGNAL mux_tmp_80 : STD_LOGIC;
  SIGNAL or_tmp_83 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL or_tmp_87 : STD_LOGIC;
  SIGNAL mux_tmp_84 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_69 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL or_tmp_112 : STD_LOGIC;
  SIGNAL mux_tmp_106 : STD_LOGIC;
  SIGNAL nor_tmp_27 : STD_LOGIC;
  SIGNAL not_tmp_90 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL not_tmp_95 : STD_LOGIC;
  SIGNAL or_tmp_122 : STD_LOGIC;
  SIGNAL or_tmp_124 : STD_LOGIC;
  SIGNAL or_tmp_127 : STD_LOGIC;
  SIGNAL or_tmp_130 : STD_LOGIC;
  SIGNAL mux_tmp_135 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL and_dcpl_96 : STD_LOGIC;
  SIGNAL and_dcpl_97 : STD_LOGIC;
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL or_tmp_140 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL mux_tmp_147 : STD_LOGIC;
  SIGNAL mux_tmp_164 : STD_LOGIC;
  SIGNAL mux_tmp_165 : STD_LOGIC;
  SIGNAL or_tmp_173 : STD_LOGIC;
  SIGNAL or_tmp_188 : STD_LOGIC;
  SIGNAL or_tmp_197 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL mux_tmp_188 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL and_dcpl_141 : STD_LOGIC;
  SIGNAL mux_tmp_192 : STD_LOGIC;
  SIGNAL and_dcpl_143 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL and_dcpl_145 : STD_LOGIC;
  SIGNAL and_dcpl_146 : STD_LOGIC;
  SIGNAL and_dcpl_148 : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL and_dcpl_151 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL and_dcpl_156 : STD_LOGIC;
  SIGNAL and_dcpl_161 : STD_LOGIC;
  SIGNAL mux_tmp_196 : STD_LOGIC;
  SIGNAL and_dcpl_162 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_167 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL and_dcpl_169 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL or_tmp_220 : STD_LOGIC;
  SIGNAL or_tmp_222 : STD_LOGIC;
  SIGNAL mux_tmp_201 : STD_LOGIC;
  SIGNAL not_tmp_135 : STD_LOGIC;
  SIGNAL or_tmp_236 : STD_LOGIC;
  SIGNAL mux_tmp_208 : STD_LOGIC;
  SIGNAL and_tmp_6 : STD_LOGIC;
  SIGNAL and_dcpl_184 : STD_LOGIC;
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_188 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_194 : STD_LOGIC;
  SIGNAL and_dcpl_195 : STD_LOGIC;
  SIGNAL or_tmp_253 : STD_LOGIC;
  SIGNAL nand_tmp_20 : STD_LOGIC;
  SIGNAL not_tmp_150 : STD_LOGIC;
  SIGNAL or_tmp_264 : STD_LOGIC;
  SIGNAL or_tmp_275 : STD_LOGIC;
  SIGNAL or_tmp_295 : STD_LOGIC;
  SIGNAL mux_tmp_263 : STD_LOGIC;
  SIGNAL or_tmp_301 : STD_LOGIC;
  SIGNAL mux_tmp_273 : STD_LOGIC;
  SIGNAL not_tmp_173 : STD_LOGIC;
  SIGNAL or_tmp_334 : STD_LOGIC;
  SIGNAL or_tmp_349 : STD_LOGIC;
  SIGNAL or_tmp_352 : STD_LOGIC;
  SIGNAL not_tmp_188 : STD_LOGIC;
  SIGNAL or_tmp_369 : STD_LOGIC;
  SIGNAL mux_tmp_327 : STD_LOGIC;
  SIGNAL mux_tmp_328 : STD_LOGIC;
  SIGNAL mux_tmp_330 : STD_LOGIC;
  SIGNAL nor_tmp_58 : STD_LOGIC;
  SIGNAL or_tmp_465 : STD_LOGIC;
  SIGNAL or_tmp_466 : STD_LOGIC;
  SIGNAL nor_tmp_65 : STD_LOGIC;
  SIGNAL mux_tmp_403 : STD_LOGIC;
  SIGNAL or_dcpl_15 : STD_LOGIC;
  SIGNAL or_tmp_503 : STD_LOGIC;
  SIGNAL and_dcpl_210 : STD_LOGIC;
  SIGNAL mux_tmp_462 : STD_LOGIC;
  SIGNAL and_dcpl_216 : STD_LOGIC;
  SIGNAL or_tmp_619 : STD_LOGIC;
  SIGNAL or_tmp_622 : STD_LOGIC;
  SIGNAL or_tmp_624 : STD_LOGIC;
  SIGNAL or_tmp_627 : STD_LOGIC;
  SIGNAL or_tmp_728 : STD_LOGIC;
  SIGNAL or_tmp_765 : STD_LOGIC;
  SIGNAL or_tmp_773 : STD_LOGIC;
  SIGNAL or_tmp_811 : STD_LOGIC;
  SIGNAL or_tmp_847 : STD_LOGIC;
  SIGNAL or_tmp_868 : STD_LOGIC;
  SIGNAL or_tmp_871 : STD_LOGIC;
  SIGNAL or_tmp_872 : STD_LOGIC;
  SIGNAL or_tmp_873 : STD_LOGIC;
  SIGNAL and_dcpl_253 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_255 : STD_LOGIC;
  SIGNAL and_dcpl_262 : STD_LOGIC;
  SIGNAL and_dcpl_270 : STD_LOGIC;
  SIGNAL and_dcpl_271 : STD_LOGIC;
  SIGNAL and_dcpl_278 : STD_LOGIC;
  SIGNAL and_dcpl_284 : STD_LOGIC;
  SIGNAL and_dcpl_286 : STD_LOGIC;
  SIGNAL and_dcpl_293 : STD_LOGIC;
  SIGNAL and_dcpl_301 : STD_LOGIC;
  SIGNAL and_dcpl_309 : STD_LOGIC;
  SIGNAL and_dcpl_310 : STD_LOGIC;
  SIGNAL and_dcpl_317 : STD_LOGIC;
  SIGNAL and_dcpl_324 : STD_LOGIC;
  SIGNAL and_dcpl_331 : STD_LOGIC;
  SIGNAL operator_20_true_15_slc_operator_20_true_15_acc_14_itm : STD_LOGIC;
  SIGNAL operator_20_true_8_slc_operator_20_true_8_acc_14_itm : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_k_5_0_sva_2 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_20_true_1_slc_operator_20_true_1_acc_14_itm : STD_LOGIC;
  SIGNAL S2_OUTER_LOOP_c_1_sva : STD_LOGIC;
  SIGNAL modulo_add_19_slc_32_svs_st : STD_LOGIC;
  SIGNAL modulo_add_base_22_sva_mx0w24 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_21_sva_mx0w23 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_20_sva_mx0w22 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_23_sva_mx0w21 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_18_sva_mx0w20 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_17_sva_mx0w19 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_16_sva_mx0w18 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_19_sva_mx0w17 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_14_sva_mx0w16 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_13_sva_mx0w15 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_12_sva_mx0w14 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_15_sva_mx0w13 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_10_sva_mx0w12 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_9_sva_mx0w11 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_8_sva_mx0w10 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_11_sva_mx0w9 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_6_sva_mx0w8 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_5_sva_mx0w7 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_4_sva_mx0w6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_7_sva_mx0w5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_2_sva_mx0w4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_2_res_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_1_sva_mx0w3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_sva_mx0w2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_3_sva_mx0w1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_3_res_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_x_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_x_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_s_raddr_core_1_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_s_raddr_core_2_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_s_raddr_core_0_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_s_raddr_core_3_cse : STD_LOGIC;
  SIGNAL reg_revArr_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_tw_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_tw_rsci_s_raddr_core_cse : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL reg_xx_rsc_cgo_cse : STD_LOGIC;
  SIGNAL reg_yy_rsc_cgo_cse : STD_LOGIC;
  SIGNAL reg_x_rsc_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_1_cse : STD_LOGIC;
  SIGNAL nand_95_cse : STD_LOGIC;
  SIGNAL or_335_cse : STD_LOGIC;
  SIGNAL nor_242_cse : STD_LOGIC;
  SIGNAL or_35_cse : STD_LOGIC;
  SIGNAL and_357_cse : STD_LOGIC;
  SIGNAL or_442_cse : STD_LOGIC;
  SIGNAL or_392_cse : STD_LOGIC;
  SIGNAL or_467_cse : STD_LOGIC;
  SIGNAL or_22_cse : STD_LOGIC;
  SIGNAL or_533_cse : STD_LOGIC;
  SIGNAL or_889_cse : STD_LOGIC;
  SIGNAL reg_drf_revArr_ptr_smx_9_0_cse : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL nand_96_cse : STD_LOGIC;
  SIGNAL or_845_cse : STD_LOGIC;
  SIGNAL or_325_cse : STD_LOGIC;
  SIGNAL nor_131_cse : STD_LOGIC;
  SIGNAL nor_248_cse : STD_LOGIC;
  SIGNAL or_401_cse : STD_LOGIC;
  SIGNAL and_422_cse : STD_LOGIC;
  SIGNAL or_829_cse : STD_LOGIC;
  SIGNAL or_900_cse : STD_LOGIC;
  SIGNAL or_403_cse : STD_LOGIC;
  SIGNAL nor_304_cse : STD_LOGIC;
  SIGNAL or_28_cse : STD_LOGIC;
  SIGNAL and_425_cse : STD_LOGIC;
  SIGNAL or_1041_cse : STD_LOGIC;
  SIGNAL or_210_cse : STD_LOGIC;
  SIGNAL or_587_cse : STD_LOGIC;
  SIGNAL or_125_cse : STD_LOGIC;
  SIGNAL and_403_cse : STD_LOGIC;
  SIGNAL mux_320_cse : STD_LOGIC;
  SIGNAL and_385_cse : STD_LOGIC;
  SIGNAL or_81_cse : STD_LOGIC;
  SIGNAL nand_124_cse : STD_LOGIC;
  SIGNAL or_888_cse : STD_LOGIC;
  SIGNAL or_964_cse : STD_LOGIC;
  SIGNAL or_179_cse : STD_LOGIC;
  SIGNAL nand_111_cse : STD_LOGIC;
  SIGNAL or_585_cse : STD_LOGIC;
  SIGNAL nand_83_cse : STD_LOGIC;
  SIGNAL nand_72_cse : STD_LOGIC;
  SIGNAL or_351_cse : STD_LOGIC;
  SIGNAL or_348_cse : STD_LOGIC;
  SIGNAL nor_109_cse : STD_LOGIC;
  SIGNAL mux_325_cse : STD_LOGIC;
  SIGNAL mux_127_rmff : STD_LOGIC;
  SIGNAL mux_185_rmff : STD_LOGIC;
  SIGNAL and_200_rmff : STD_LOGIC;
  SIGNAL S34_OUTER_LOOP_for_tf_sva : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL mult_x_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_x_16_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_x_15_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm :
      STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm :
      STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_10_tw_asn_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_14_tw_h_asn_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_10_tw_h_asn_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_13_tw_h_asn_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL S34_OUTER_LOOP_for_tf_h_sva : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL yy_rsci_wadr_d_mx0c1 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c0 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c10 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c4 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c5 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c7 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c2 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c3 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c6 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c8 : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_4_2_sva_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yy_rsci_radr_d_mx0c0 : STD_LOGIC;
  SIGNAL yy_rsci_radr_d_mx0c1 : STD_LOGIC;
  SIGNAL yy_rsci_radr_d_mx0c2 : STD_LOGIC;
  SIGNAL yy_rsci_radr_d_mx0c5 : STD_LOGIC;
  SIGNAL yy_rsci_radr_d_mx0c9 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c3 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c4 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c6 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c1 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c2 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c5 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c7 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c0 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c10 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c1 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c2 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c3 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c4 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c5 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c6 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c7 : STD_LOGIC;
  SIGNAL xx_rsci_radr_d_mx0c8 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_7_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_4_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_5_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_6_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_15_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_12_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_13_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_14_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_23_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_20_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_21_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_22_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_3_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_1_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_2_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_11_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_8_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_9_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_10_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_19_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_16_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_17_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_18_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_235_itm : STD_LOGIC;
  SIGNAL mux_138_itm : STD_LOGIC;
  SIGNAL mux_140_itm : STD_LOGIC;
  SIGNAL mux_148_itm : STD_LOGIC;
  SIGNAL mux_193_itm : STD_LOGIC;
  SIGNAL mux_195_itm : STD_LOGIC;
  SIGNAL mux_197_itm : STD_LOGIC;
  SIGNAL mux_199_itm : STD_LOGIC;
  SIGNAL mux_200_itm : STD_LOGIC;
  SIGNAL mux_202_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL not_tmp_396 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL or_tmp_975 : STD_LOGIC;
  SIGNAL or_tmp_983 : STD_LOGIC;
  SIGNAL and_dcpl_358 : STD_LOGIC;
  SIGNAL and_dcpl_360 : STD_LOGIC;
  SIGNAL and_dcpl_370 : STD_LOGIC;
  SIGNAL and_dcpl_382 : STD_LOGIC;
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_dcpl_406 : STD_LOGIC;
  SIGNAL and_dcpl_425 : STD_LOGIC;
  SIGNAL and_dcpl_441 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_dcpl_628 : STD_LOGIC;
  SIGNAL and_dcpl_731 : STD_LOGIC;
  SIGNAL and_dcpl_737 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_p_sva_1 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL modulo_add_base_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_11_f1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_14_f1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_15_f1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_p_sva_1_mx0c1 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva_mx0c1 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c0 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c1 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c2 : STD_LOGIC;
  SIGNAL S2_OUTER_LOOP_c_1_sva_mx0c1 : STD_LOGIC;
  SIGNAL S2_OUTER_LOOP_c_1_sva_mx0c2 : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2 : STD_LOGIC;
  SIGNAL modulo_add_3_mux_itm_mx0w1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_10_tw_asn_itm_mx0c0 : STD_LOGIC;
  SIGNAL butterFly_10_tw_asn_itm_mx0c2 : STD_LOGIC;
  SIGNAL butterFly_13_tw_h_asn_itm_mx0c0 : STD_LOGIC;
  SIGNAL butterFly_13_tw_h_asn_itm_mx0c1 : STD_LOGIC;
  SIGNAL butterFly_13_tw_h_asn_itm_mx0c2 : STD_LOGIC;
  SIGNAL butterFly_10_tw_h_asn_itm_mx0c1 : STD_LOGIC;
  SIGNAL butterFly_10_tw_h_asn_itm_mx0c2 : STD_LOGIC;
  SIGNAL butterFly_10_tw_h_asn_itm_mx0c3 : STD_LOGIC;
  SIGNAL butterFly_10_tw_h_asn_itm_mx0c4 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c0 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c1 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c4 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c5 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c8 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c9 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c12 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c13 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c16 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c17 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c20 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c21 : STD_LOGIC;
  SIGNAL modulo_add_base_1_sva_mx0c24 : STD_LOGIC;
  SIGNAL modulo_sub_1_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_2_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_5_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_6_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_9_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_10_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_13_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_14_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_17_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_18_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_21_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_22_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL and_441_ssc : STD_LOGIC;
  SIGNAL reg_modulo_add_3_slc_32_svs_st_cse : STD_LOGIC;
  SIGNAL reg_mult_res_lpi_4_dfm_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_1_res_lpi_4_dfm_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_2_res_lpi_4_dfm_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_3_res_lpi_4_dfm_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_modulo_add_4_slc_32_svs_st_cse : STD_LOGIC;
  SIGNAL reg_modulo_add_6_slc_32_svs_st_cse : STD_LOGIC;
  SIGNAL reg_modulo_add_7_slc_32_svs_st_cse : STD_LOGIC;
  SIGNAL reg_modulo_add_slc_32_svs_st_cse : STD_LOGIC;
  SIGNAL reg_modulo_add_1_slc_32_svs_st_cse : STD_LOGIC;
  SIGNAL reg_modulo_add_11_slc_32_svs_st_cse : STD_LOGIC;
  SIGNAL or_107_cse : STD_LOGIC;
  SIGNAL nand_116_cse : STD_LOGIC;
  SIGNAL or_1031_cse : STD_LOGIC;
  SIGNAL nor_425_cse : STD_LOGIC;
  SIGNAL or_697_cse : STD_LOGIC;
  SIGNAL or_702_cse : STD_LOGIC;
  SIGNAL or_715_cse : STD_LOGIC;
  SIGNAL or_727_cse : STD_LOGIC;
  SIGNAL mux_467_cse : STD_LOGIC;
  SIGNAL nor_159_cse : STD_LOGIC;
  SIGNAL and_715_cse_1 : STD_LOGIC;
  SIGNAL or_tmp_1011 : STD_LOGIC;
  SIGNAL mux_tmp_788 : STD_LOGIC;
  SIGNAL or_tmp_1036 : STD_LOGIC;
  SIGNAL nor_tmp_102 : STD_LOGIC;
  SIGNAL or_tmp_1052 : STD_LOGIC;
  SIGNAL or_tmp_1056 : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt : STD_LOGIC_VECTOR (5 DOWNTO
      0);
  SIGNAL S2_COPY_LOOP_for_i_5_0_sva_1_5 : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_i_5_0_sva_1_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL butterFly_12_tw_and_cse_3_2_sva_1 : STD_LOGIC;
  SIGNAL butterFly_12_tw_and_cse_3_2_sva_0 : STD_LOGIC;
  SIGNAL reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg : STD_LOGIC;
  SIGNAL reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg : STD_LOGIC;
  SIGNAL reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL mux_351_ssc : STD_LOGIC;
  SIGNAL mux_359_seb : STD_LOGIC;
  SIGNAL and_953_cse : STD_LOGIC;
  SIGNAL or_46_cse : STD_LOGIC;
  SIGNAL nor_217_cse : STD_LOGIC;
  SIGNAL mux_829_cse : STD_LOGIC;
  SIGNAL nor_488_cse : STD_LOGIC;
  SIGNAL nor_494_cse : STD_LOGIC;
  SIGNAL nor_487_cse : STD_LOGIC;
  SIGNAL and_950_cse : STD_LOGIC;
  SIGNAL butterFly_tw_and_1_cse : STD_LOGIC;
  SIGNAL or_1016_cse : STD_LOGIC;
  SIGNAL mux_513_itm : STD_LOGIC;
  SIGNAL mux_554_itm : STD_LOGIC;
  SIGNAL mux_623_itm : STD_LOGIC;
  SIGNAL mux_676_itm : STD_LOGIC;
  SIGNAL operator_20_true_1_acc_1_itm_14 : STD_LOGIC;
  SIGNAL z_out_14_32 : STD_LOGIC;
  SIGNAL z_out_16_32 : STD_LOGIC;
  SIGNAL acc_6_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_7_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_8_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_5_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL mux_42_nl : STD_LOGIC;
  SIGNAL mux_41_nl : STD_LOGIC;
  SIGNAL mux_40_nl : STD_LOGIC;
  SIGNAL or_39_nl : STD_LOGIC;
  SIGNAL mux_39_nl : STD_LOGIC;
  SIGNAL and_416_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL and_417_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL mux_63_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL and_409_nl : STD_LOGIC;
  SIGNAL nor_294_nl : STD_LOGIC;
  SIGNAL and_410_nl : STD_LOGIC;
  SIGNAL mux_61_nl : STD_LOGIC;
  SIGNAL nor_296_nl : STD_LOGIC;
  SIGNAL nor_297_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL mux_59_nl : STD_LOGIC;
  SIGNAL nor_298_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL nor_299_nl : STD_LOGIC;
  SIGNAL mux_76_nl : STD_LOGIC;
  SIGNAL or_87_nl : STD_LOGIC;
  SIGNAL mux_75_nl : STD_LOGIC;
  SIGNAL nand_10_nl : STD_LOGIC;
  SIGNAL mux_74_nl : STD_LOGIC;
  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL or_86_nl : STD_LOGIC;
  SIGNAL or_85_nl : STD_LOGIC;
  SIGNAL mux_72_nl : STD_LOGIC;
  SIGNAL mux_71_nl : STD_LOGIC;
  SIGNAL or_84_nl : STD_LOGIC;
  SIGNAL mux_69_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL butterFly_tw_h_or_2_nl : STD_LOGIC;
  SIGNAL mux_86_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL or_92_nl : STD_LOGIC;
  SIGNAL and_53_nl : STD_LOGIC;
  SIGNAL mux_77_nl : STD_LOGIC;
  SIGNAL mux_99_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL and_428_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL and_405_nl : STD_LOGIC;
  SIGNAL nor_291_nl : STD_LOGIC;
  SIGNAL nor_353_nl : STD_LOGIC;
  SIGNAL mux_95_nl : STD_LOGIC;
  SIGNAL nor_354_nl : STD_LOGIC;
  SIGNAL nor_355_nl : STD_LOGIC;
  SIGNAL nor_356_nl : STD_LOGIC;
  SIGNAL mux_94_nl : STD_LOGIC;
  SIGNAL or_110_nl : STD_LOGIC;
  SIGNAL mux_93_nl : STD_LOGIC;
  SIGNAL or_109_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL or_106_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL or_117_nl : STD_LOGIC;
  SIGNAL and_69_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL nor_289_nl : STD_LOGIC;
  SIGNAL nor_290_nl : STD_LOGIC;
  SIGNAL mux_126_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL mux_121_nl : STD_LOGIC;
  SIGNAL or_131_nl : STD_LOGIC;
  SIGNAL or_130_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL and_400_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL nor_30_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL or_488_nl : STD_LOGIC;
  SIGNAL and_401_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL nor_286_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL nand_114_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL nor_287_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL mux_184_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL nor_270_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL nor_272_nl : STD_LOGIC;
  SIGNAL mux_180_nl : STD_LOGIC;
  SIGNAL or_201_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL nor_274_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL nor_275_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL or_1014_nl : STD_LOGIC;
  SIGNAL mux_175_nl : STD_LOGIC;
  SIGNAL nor_276_nl : STD_LOGIC;
  SIGNAL nor_277_nl : STD_LOGIC;
  SIGNAL nor_278_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL and_391_nl : STD_LOGIC;
  SIGNAL or_189_nl : STD_LOGIC;
  SIGNAL S34_OUTER_LOOP_for_tf_mux_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL not_1496_nl : STD_LOGIC;
  SIGNAL S34_OUTER_LOOP_for_k_mux_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL not_1732_nl : STD_LOGIC;
  SIGNAL and_203_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL mux_232_nl : STD_LOGIC;
  SIGNAL mux_231_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL or_267_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL nor_251_nl : STD_LOGIC;
  SIGNAL or_265_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL mux_219_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL nor_132_nl : STD_LOGIC;
  SIGNAL nor_213_nl : STD_LOGIC;
  SIGNAL nor_214_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL nor_215_nl : STD_LOGIC;
  SIGNAL nor_216_nl : STD_LOGIC;
  SIGNAL or_1171_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL or_1011_nl : STD_LOGIC;
  SIGNAL nand_87_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL nor_209_nl : STD_LOGIC;
  SIGNAL nand_151_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL nor_210_nl : STD_LOGIC;
  SIGNAL nor_211_nl : STD_LOGIC;
  SIGNAL mux_785_nl : STD_LOGIC;
  SIGNAL mux_784_nl : STD_LOGIC;
  SIGNAL mux_783_nl : STD_LOGIC;
  SIGNAL or_1104_nl : STD_LOGIC;
  SIGNAL mux_782_nl : STD_LOGIC;
  SIGNAL nor_476_nl : STD_LOGIC;
  SIGNAL mux_781_nl : STD_LOGIC;
  SIGNAL mux_780_nl : STD_LOGIC;
  SIGNAL nor_477_nl : STD_LOGIC;
  SIGNAL mux_779_nl : STD_LOGIC;
  SIGNAL or_1100_nl : STD_LOGIC;
  SIGNAL mux_778_nl : STD_LOGIC;
  SIGNAL nor_479_nl : STD_LOGIC;
  SIGNAL nor_480_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nor_481_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl : STD_LOGIC;
  SIGNAL mux_798_nl : STD_LOGIC;
  SIGNAL mux_797_nl : STD_LOGIC;
  SIGNAL mux_796_nl : STD_LOGIC;
  SIGNAL mux_795_nl : STD_LOGIC;
  SIGNAL mux_794_nl : STD_LOGIC;
  SIGNAL mux_793_nl : STD_LOGIC;
  SIGNAL or_1114_nl : STD_LOGIC;
  SIGNAL mux_792_nl : STD_LOGIC;
  SIGNAL or_1170_nl : STD_LOGIC;
  SIGNAL nor_482_nl : STD_LOGIC;
  SIGNAL mux_791_nl : STD_LOGIC;
  SIGNAL nor_483_nl : STD_LOGIC;
  SIGNAL nor_484_nl : STD_LOGIC;
  SIGNAL mux_790_nl : STD_LOGIC;
  SIGNAL or_1109_nl : STD_LOGIC;
  SIGNAL nand_143_nl : STD_LOGIC;
  SIGNAL mux_788_nl : STD_LOGIC;
  SIGNAL mux_787_nl : STD_LOGIC;
  SIGNAL nand_142_nl : STD_LOGIC;
  SIGNAL mux_786_nl : STD_LOGIC;
  SIGNAL nand_150_nl : STD_LOGIC;
  SIGNAL nor_485_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_p_or_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL or_426_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL or_423_nl : STD_LOGIC;
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL or_420_nl : STD_LOGIC;
  SIGNAL mux_807_nl : STD_LOGIC;
  SIGNAL mux_806_nl : STD_LOGIC;
  SIGNAL nor_486_nl : STD_LOGIC;
  SIGNAL mux_805_nl : STD_LOGIC;
  SIGNAL mux_804_nl : STD_LOGIC;
  SIGNAL mux_803_nl : STD_LOGIC;
  SIGNAL nor_489_nl : STD_LOGIC;
  SIGNAL nor_490_nl : STD_LOGIC;
  SIGNAL mux_802_nl : STD_LOGIC;
  SIGNAL mux_801_nl : STD_LOGIC;
  SIGNAL nor_491_nl : STD_LOGIC;
  SIGNAL nor_492_nl : STD_LOGIC;
  SIGNAL mux_800_nl : STD_LOGIC;
  SIGNAL nor_493_nl : STD_LOGIC;
  SIGNAL mux_799_nl : STD_LOGIC;
  SIGNAL and_955_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_k_or_nl : STD_LOGIC;
  SIGNAL mux_56_nl : STD_LOGIC;
  SIGNAL nor_301_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL or_1018_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL nand_109_nl : STD_LOGIC;
  SIGNAL and_435_nl : STD_LOGIC;
  SIGNAL mux_45_nl : STD_LOGIC;
  SIGNAL nor_303_nl : STD_LOGIC;
  SIGNAL nor_309_nl : STD_LOGIC;
  SIGNAL mux_44_nl : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_for_acc_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL nor_325_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL mux_379_nl : STD_LOGIC;
  SIGNAL or_1032_nl : STD_LOGIC;
  SIGNAL or_1033_nl : STD_LOGIC;
  SIGNAL nand_119_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL nor_197_nl : STD_LOGIC;
  SIGNAL nor_198_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL or_1034_nl : STD_LOGIC;
  SIGNAL or_1035_nl : STD_LOGIC;
  SIGNAL mux_817_nl : STD_LOGIC;
  SIGNAL mux_816_nl : STD_LOGIC;
  SIGNAL mux_815_nl : STD_LOGIC;
  SIGNAL nor_466_nl : STD_LOGIC;
  SIGNAL mux_814_nl : STD_LOGIC;
  SIGNAL nor_467_nl : STD_LOGIC;
  SIGNAL or_1142_nl : STD_LOGIC;
  SIGNAL mux_813_nl : STD_LOGIC;
  SIGNAL and_948_nl : STD_LOGIC;
  SIGNAL nor_468_nl : STD_LOGIC;
  SIGNAL mux_812_nl : STD_LOGIC;
  SIGNAL mux_811_nl : STD_LOGIC;
  SIGNAL nor_469_nl : STD_LOGIC;
  SIGNAL nor_470_nl : STD_LOGIC;
  SIGNAL nor_471_nl : STD_LOGIC;
  SIGNAL mux_810_nl : STD_LOGIC;
  SIGNAL mux_809_nl : STD_LOGIC;
  SIGNAL or_1134_nl : STD_LOGIC;
  SIGNAL and_949_nl : STD_LOGIC;
  SIGNAL mux_808_nl : STD_LOGIC;
  SIGNAL nor_472_nl : STD_LOGIC;
  SIGNAL nor_473_nl : STD_LOGIC;
  SIGNAL mux_828_nl : STD_LOGIC;
  SIGNAL mux_827_nl : STD_LOGIC;
  SIGNAL mux_826_nl : STD_LOGIC;
  SIGNAL mux_825_nl : STD_LOGIC;
  SIGNAL mux_824_nl : STD_LOGIC;
  SIGNAL or_1159_nl : STD_LOGIC;
  SIGNAL or_1158_nl : STD_LOGIC;
  SIGNAL mux_823_nl : STD_LOGIC;
  SIGNAL nor_464_nl : STD_LOGIC;
  SIGNAL mux_822_nl : STD_LOGIC;
  SIGNAL mux_821_nl : STD_LOGIC;
  SIGNAL or_1155_nl : STD_LOGIC;
  SIGNAL or_1154_nl : STD_LOGIC;
  SIGNAL or_1153_nl : STD_LOGIC;
  SIGNAL mux_820_nl : STD_LOGIC;
  SIGNAL or_1151_nl : STD_LOGIC;
  SIGNAL nand_145_nl : STD_LOGIC;
  SIGNAL mux_819_nl : STD_LOGIC;
  SIGNAL mux_818_nl : STD_LOGIC;
  SIGNAL or_1149_nl : STD_LOGIC;
  SIGNAL or_1146_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl : STD_LOGIC_VECTOR (14 DOWNTO
      0);
  SIGNAL and_18_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL or_62_nl : STD_LOGIC;
  SIGNAL or_60_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL nand_40_nl : STD_LOGIC;
  SIGNAL mux_400_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_3_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_mux_15_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_956_nl : STD_LOGIC;
  SIGNAL mux_837_nl : STD_LOGIC;
  SIGNAL or_1172_nl : STD_LOGIC;
  SIGNAL nand_152_nl : STD_LOGIC;
  SIGNAL S6_OUTER_LOOP_for_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_not_4_nl : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_mux_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_OUTER_LOOP_c_nor_nl : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_not_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL or_1028_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL or_1029_nl : STD_LOGIC;
  SIGNAL or_1030_nl : STD_LOGIC;
  SIGNAL nor_462_nl : STD_LOGIC;
  SIGNAL nor_463_nl : STD_LOGIC;
  SIGNAL mux_833_nl : STD_LOGIC;
  SIGNAL nor_461_nl : STD_LOGIC;
  SIGNAL mux_832_nl : STD_LOGIC;
  SIGNAL mux_831_nl : STD_LOGIC;
  SIGNAL nand_146_nl : STD_LOGIC;
  SIGNAL mux_830_nl : STD_LOGIC;
  SIGNAL or_1162_nl : STD_LOGIC;
  SIGNAL mux_836_nl : STD_LOGIC;
  SIGNAL nor_458_nl : STD_LOGIC;
  SIGNAL mux_835_nl : STD_LOGIC;
  SIGNAL or_1168_nl : STD_LOGIC;
  SIGNAL or_1167_nl : STD_LOGIC;
  SIGNAL mux_506_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL mux_504_nl : STD_LOGIC;
  SIGNAL or_644_nl : STD_LOGIC;
  SIGNAL mux_503_nl : STD_LOGIC;
  SIGNAL or_640_nl : STD_LOGIC;
  SIGNAL mux_592_nl : STD_LOGIC;
  SIGNAL mux_591_nl : STD_LOGIC;
  SIGNAL mux_655_nl : STD_LOGIC;
  SIGNAL mux_654_nl : STD_LOGIC;
  SIGNAL or_833_nl : STD_LOGIC;
  SIGNAL mux_662_nl : STD_LOGIC;
  SIGNAL mux_661_nl : STD_LOGIC;
  SIGNAL or_844_nl : STD_LOGIC;
  SIGNAL mux_672_nl : STD_LOGIC;
  SIGNAL mux_671_nl : STD_LOGIC;
  SIGNAL nor_110_nl : STD_LOGIC;
  SIGNAL mux_579_nl : STD_LOGIC;
  SIGNAL nor_111_nl : STD_LOGIC;
  SIGNAL mux_669_nl : STD_LOGIC;
  SIGNAL or_861_nl : STD_LOGIC;
  SIGNAL or_860_nl : STD_LOGIC;
  SIGNAL mux_668_nl : STD_LOGIC;
  SIGNAL or_743_nl : STD_LOGIC;
  SIGNAL mux_697_nl : STD_LOGIC;
  SIGNAL mux_696_nl : STD_LOGIC;
  SIGNAL mux_695_nl : STD_LOGIC;
  SIGNAL mux_694_nl : STD_LOGIC;
  SIGNAL or_901_nl : STD_LOGIC;
  SIGNAL mux_693_nl : STD_LOGIC;
  SIGNAL mux_692_nl : STD_LOGIC;
  SIGNAL mux_690_nl : STD_LOGIC;
  SIGNAL mux_689_nl : STD_LOGIC;
  SIGNAL mux_688_nl : STD_LOGIC;
  SIGNAL mux_687_nl : STD_LOGIC;
  SIGNAL or_892_nl : STD_LOGIC;
  SIGNAL mux_686_nl : STD_LOGIC;
  SIGNAL or_890_nl : STD_LOGIC;
  SIGNAL mux_685_nl : STD_LOGIC;
  SIGNAL mux_699_nl : STD_LOGIC;
  SIGNAL mux_698_nl : STD_LOGIC;
  SIGNAL or_1037_nl : STD_LOGIC;
  SIGNAL or_1038_nl : STD_LOGIC;
  SIGNAL or_1039_nl : STD_LOGIC;
  SIGNAL mux_706_nl : STD_LOGIC;
  SIGNAL or_918_nl : STD_LOGIC;
  SIGNAL mux_705_nl : STD_LOGIC;
  SIGNAL or_917_nl : STD_LOGIC;
  SIGNAL mux_743_nl : STD_LOGIC;
  SIGNAL mux_742_nl : STD_LOGIC;
  SIGNAL and_429_nl : STD_LOGIC;
  SIGNAL mux_741_nl : STD_LOGIC;
  SIGNAL nor_90_nl : STD_LOGIC;
  SIGNAL mux_740_nl : STD_LOGIC;
  SIGNAL nor_357_nl : STD_LOGIC;
  SIGNAL mux_739_nl : STD_LOGIC;
  SIGNAL nor_358_nl : STD_LOGIC;
  SIGNAL mux_738_nl : STD_LOGIC;
  SIGNAL mux_737_nl : STD_LOGIC;
  SIGNAL and_430_nl : STD_LOGIC;
  SIGNAL mux_736_nl : STD_LOGIC;
  SIGNAL nor_359_nl : STD_LOGIC;
  SIGNAL and_431_nl : STD_LOGIC;
  SIGNAL mux_735_nl : STD_LOGIC;
  SIGNAL nor_93_nl : STD_LOGIC;
  SIGNAL nor_94_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_3_res_mux1h_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_838_nl : STD_LOGIC;
  SIGNAL and_957_nl : STD_LOGIC;
  SIGNAL mux_839_nl : STD_LOGIC;
  SIGNAL nor_498_nl : STD_LOGIC;
  SIGNAL mux_840_nl : STD_LOGIC;
  SIGNAL or_1173_nl : STD_LOGIC;
  SIGNAL mux_841_nl : STD_LOGIC;
  SIGNAL or_1174_nl : STD_LOGIC;
  SIGNAL mux_842_nl : STD_LOGIC;
  SIGNAL mux_843_nl : STD_LOGIC;
  SIGNAL nor_499_nl : STD_LOGIC;
  SIGNAL mux_844_nl : STD_LOGIC;
  SIGNAL and_958_nl : STD_LOGIC;
  SIGNAL mux_845_nl : STD_LOGIC;
  SIGNAL and_959_nl : STD_LOGIC;
  SIGNAL mux_846_nl : STD_LOGIC;
  SIGNAL nor_500_nl : STD_LOGIC;
  SIGNAL mux_847_nl : STD_LOGIC;
  SIGNAL mux_848_nl : STD_LOGIC;
  SIGNAL and_960_nl : STD_LOGIC;
  SIGNAL mux_849_nl : STD_LOGIC;
  SIGNAL nor_501_nl : STD_LOGIC;
  SIGNAL and_961_nl : STD_LOGIC;
  SIGNAL mux_850_nl : STD_LOGIC;
  SIGNAL mux_851_nl : STD_LOGIC;
  SIGNAL mux_852_nl : STD_LOGIC;
  SIGNAL mux_853_nl : STD_LOGIC;
  SIGNAL nor_502_nl : STD_LOGIC;
  SIGNAL nor_503_nl : STD_LOGIC;
  SIGNAL nor_504_nl : STD_LOGIC;
  SIGNAL nor_505_nl : STD_LOGIC;
  SIGNAL nor_506_nl : STD_LOGIC;
  SIGNAL modulo_sub_3_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_14_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_3_mux1h_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_969_nl : STD_LOGIC;
  SIGNAL modulo_sub_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_16_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_mux1h_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_1_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_18_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_1_mux1h_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_981_nl : STD_LOGIC;
  SIGNAL and_982_nl : STD_LOGIC;
  SIGNAL and_983_nl : STD_LOGIC;
  SIGNAL modulo_sub_2_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_7_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_19_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_7_mux1h_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_984_nl : STD_LOGIC;
  SIGNAL and_985_nl : STD_LOGIC;
  SIGNAL and_986_nl : STD_LOGIC;
  SIGNAL and_987_nl : STD_LOGIC;
  SIGNAL modulo_sub_4_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_17_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_4_mux1h_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_977_nl : STD_LOGIC;
  SIGNAL and_978_nl : STD_LOGIC;
  SIGNAL and_979_nl : STD_LOGIC;
  SIGNAL and_980_nl : STD_LOGIC;
  SIGNAL modulo_sub_5_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_6_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_21_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_6_mux1h_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_988_nl : STD_LOGIC;
  SIGNAL and_989_nl : STD_LOGIC;
  SIGNAL and_990_nl : STD_LOGIC;
  SIGNAL modulo_sub_11_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_20_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_11_mux1h_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_8_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_9_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_10_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_15_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_12_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_13_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_14_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_19_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_19_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_sub_16_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_17_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_18_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_23_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_20_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_21_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_22_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL operator_20_true_1_acc_1_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL or_97_nl : STD_LOGIC;
  SIGNAL or_96_nl : STD_LOGIC;
  SIGNAL nand_9_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL nor_379_nl : STD_LOGIC;
  SIGNAL nor_380_nl : STD_LOGIC;
  SIGNAL mux_88_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL or_99_nl : STD_LOGIC;
  SIGNAL or_142_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL or_144_nl : STD_LOGIC;
  SIGNAL or_163_nl : STD_LOGIC;
  SIGNAL or_162_nl : STD_LOGIC;
  SIGNAL or_183_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL or_832_nl : STD_LOGIC;
  SIGNAL or_211_nl : STD_LOGIC;
  SIGNAL or_216_nl : STD_LOGIC;
  SIGNAL or_215_nl : STD_LOGIC;
  SIGNAL or_218_nl : STD_LOGIC;
  SIGNAL mux_719_nl : STD_LOGIC;
  SIGNAL or_773_nl : STD_LOGIC;
  SIGNAL nand_123_nl : STD_LOGIC;
  SIGNAL or_784_nl : STD_LOGIC;
  SIGNAL or_223_nl : STD_LOGIC;
  SIGNAL or_669_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL or_657_nl : STD_LOGIC;
  SIGNAL nor_262_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL nor_263_nl : STD_LOGIC;
  SIGNAL nor_264_nl : STD_LOGIC;
  SIGNAL or_307_nl : STD_LOGIC;
  SIGNAL or_318_nl : STD_LOGIC;
  SIGNAL or_316_nl : STD_LOGIC;
  SIGNAL or_395_nl : STD_LOGIC;
  SIGNAL nor_192_nl : STD_LOGIC;
  SIGNAL or_572_nl : STD_LOGIC;
  SIGNAL or_571_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL nor_285_nl : STD_LOGIC;
  SIGNAL and_399_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL or_155_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL nor_283_nl : STD_LOGIC;
  SIGNAL nor_284_nl : STD_LOGIC;
  SIGNAL and_398_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL or_165_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL nand_120_nl : STD_LOGIC;
  SIGNAL or_1036_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL or_168_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL nor_265_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL nor_266_nl : STD_LOGIC;
  SIGNAL nor_260_nl : STD_LOGIC;
  SIGNAL nor_261_nl : STD_LOGIC;
  SIGNAL mux_406_nl : STD_LOGIC;
  SIGNAL nor_188_nl : STD_LOGIC;
  SIGNAL mux_405_nl : STD_LOGIC;
  SIGNAL mux_404_nl : STD_LOGIC;
  SIGNAL nor_189_nl : STD_LOGIC;
  SIGNAL mux_402_nl : STD_LOGIC;
  SIGNAL nor_190_nl : STD_LOGIC;
  SIGNAL nor_191_nl : STD_LOGIC;
  SIGNAL mux_413_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL or_1023_nl : STD_LOGIC;
  SIGNAL nor_179_nl : STD_LOGIC;
  SIGNAL mux_423_nl : STD_LOGIC;
  SIGNAL mux_422_nl : STD_LOGIC;
  SIGNAL or_513_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL nand_42_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL mux_418_nl : STD_LOGIC;
  SIGNAL nor_180_nl : STD_LOGIC;
  SIGNAL mux_417_nl : STD_LOGIC;
  SIGNAL mux_8_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL and_365_nl : STD_LOGIC;
  SIGNAL nor_181_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL nor_182_nl : STD_LOGIC;
  SIGNAL nor_183_nl : STD_LOGIC;
  SIGNAL mux_29_nl : STD_LOGIC;
  SIGNAL nor_311_nl : STD_LOGIC;
  SIGNAL mux_431_nl : STD_LOGIC;
  SIGNAL nor_174_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL or_525_nl : STD_LOGIC;
  SIGNAL or_523_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL nor_175_nl : STD_LOGIC;
  SIGNAL and_363_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL or_519_nl : STD_LOGIC;
  SIGNAL and_364_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL nor_176_nl : STD_LOGIC;
  SIGNAL nor_177_nl : STD_LOGIC;
  SIGNAL mux_450_nl : STD_LOGIC;
  SIGNAL mux_449_nl : STD_LOGIC;
  SIGNAL mux_448_nl : STD_LOGIC;
  SIGNAL or_552_nl : STD_LOGIC;
  SIGNAL or_550_nl : STD_LOGIC;
  SIGNAL or_548_nl : STD_LOGIC;
  SIGNAL and_361_nl : STD_LOGIC;
  SIGNAL mux_452_nl : STD_LOGIC;
  SIGNAL nor_169_nl : STD_LOGIC;
  SIGNAL nor_170_nl : STD_LOGIC;
  SIGNAL nor_171_nl : STD_LOGIC;
  SIGNAL mux_451_nl : STD_LOGIC;
  SIGNAL or_554_nl : STD_LOGIC;
  SIGNAL or_553_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL mux_472_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL nand_118_nl : STD_LOGIC;
  SIGNAL mux_470_nl : STD_LOGIC;
  SIGNAL nor_160_nl : STD_LOGIC;
  SIGNAL nor_161_nl : STD_LOGIC;
  SIGNAL or_1025_nl : STD_LOGIC;
  SIGNAL or_1026_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL or_1027_nl : STD_LOGIC;
  SIGNAL mux_474_nl : STD_LOGIC;
  SIGNAL or_598_nl : STD_LOGIC;
  SIGNAL nor_156_nl : STD_LOGIC;
  SIGNAL mux_477_nl : STD_LOGIC;
  SIGNAL or_608_nl : STD_LOGIC;
  SIGNAL mux_7_nl : STD_LOGIC;
  SIGNAL or_1042_nl : STD_LOGIC;
  SIGNAL nand_47_nl : STD_LOGIC;
  SIGNAL mux_475_nl : STD_LOGIC;
  SIGNAL nor_157_nl : STD_LOGIC;
  SIGNAL nor_158_nl : STD_LOGIC;
  SIGNAL mux_512_nl : STD_LOGIC;
  SIGNAL or_654_nl : STD_LOGIC;
  SIGNAL mux_511_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL or_652_nl : STD_LOGIC;
  SIGNAL mux_509_nl : STD_LOGIC;
  SIGNAL mux_508_nl : STD_LOGIC;
  SIGNAL mux_507_nl : STD_LOGIC;
  SIGNAL or_649_nl : STD_LOGIC;
  SIGNAL or_646_nl : STD_LOGIC;
  SIGNAL mux_532_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL mux_530_nl : STD_LOGIC;
  SIGNAL nor_145_nl : STD_LOGIC;
  SIGNAL nor_146_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL nor_147_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL nor_148_nl : STD_LOGIC;
  SIGNAL nor_149_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL nor_150_nl : STD_LOGIC;
  SIGNAL nor_151_nl : STD_LOGIC;
  SIGNAL nor_152_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL or_675_nl : STD_LOGIC;
  SIGNAL or_674_nl : STD_LOGIC;
  SIGNAL mux_553_nl : STD_LOGIC;
  SIGNAL or_704_nl : STD_LOGIC;
  SIGNAL mux_552_nl : STD_LOGIC;
  SIGNAL mux_551_nl : STD_LOGIC;
  SIGNAL or_703_nl : STD_LOGIC;
  SIGNAL mux_550_nl : STD_LOGIC;
  SIGNAL mux_549_nl : STD_LOGIC;
  SIGNAL mux_548_nl : STD_LOGIC;
  SIGNAL nand_75_nl : STD_LOGIC;
  SIGNAL mux_547_nl : STD_LOGIC;
  SIGNAL and_354_nl : STD_LOGIC;
  SIGNAL and_355_nl : STD_LOGIC;
  SIGNAL or_699_nl : STD_LOGIC;
  SIGNAL mux_546_nl : STD_LOGIC;
  SIGNAL mux_545_nl : STD_LOGIC;
  SIGNAL mux_544_nl : STD_LOGIC;
  SIGNAL mux_543_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL mux_541_nl : STD_LOGIC;
  SIGNAL mux_540_nl : STD_LOGIC;
  SIGNAL or_695_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL nand_50_nl : STD_LOGIC;
  SIGNAL mux_537_nl : STD_LOGIC;
  SIGNAL nor_142_nl : STD_LOGIC;
  SIGNAL nor_143_nl : STD_LOGIC;
  SIGNAL nand_49_nl : STD_LOGIC;
  SIGNAL mux_536_nl : STD_LOGIC;
  SIGNAL nor_144_nl : STD_LOGIC;
  SIGNAL mux_535_nl : STD_LOGIC;
  SIGNAL or_688_nl : STD_LOGIC;
  SIGNAL mux_534_nl : STD_LOGIC;
  SIGNAL or_687_nl : STD_LOGIC;
  SIGNAL or_686_nl : STD_LOGIC;
  SIGNAL and_356_nl : STD_LOGIC;
  SIGNAL mux_574_nl : STD_LOGIC;
  SIGNAL nor_133_nl : STD_LOGIC;
  SIGNAL mux_573_nl : STD_LOGIC;
  SIGNAL mux_572_nl : STD_LOGIC;
  SIGNAL mux_571_nl : STD_LOGIC;
  SIGNAL or_728_nl : STD_LOGIC;
  SIGNAL mux_570_nl : STD_LOGIC;
  SIGNAL mux_569_nl : STD_LOGIC;
  SIGNAL nor_134_nl : STD_LOGIC;
  SIGNAL nor_135_nl : STD_LOGIC;
  SIGNAL nor_136_nl : STD_LOGIC;
  SIGNAL mux_568_nl : STD_LOGIC;
  SIGNAL mux_567_nl : STD_LOGIC;
  SIGNAL or_720_nl : STD_LOGIC;
  SIGNAL or_719_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL or_718_nl : STD_LOGIC;
  SIGNAL or_717_nl : STD_LOGIC;
  SIGNAL and_353_nl : STD_LOGIC;
  SIGNAL mux_565_nl : STD_LOGIC;
  SIGNAL nor_137_nl : STD_LOGIC;
  SIGNAL mux_564_nl : STD_LOGIC;
  SIGNAL mux_563_nl : STD_LOGIC;
  SIGNAL mux_562_nl : STD_LOGIC;
  SIGNAL mux_561_nl : STD_LOGIC;
  SIGNAL nor_138_nl : STD_LOGIC;
  SIGNAL mux_560_nl : STD_LOGIC;
  SIGNAL mux_559_nl : STD_LOGIC;
  SIGNAL mux_558_nl : STD_LOGIC;
  SIGNAL or_710_nl : STD_LOGIC;
  SIGNAL mux_556_nl : STD_LOGIC;
  SIGNAL mux_555_nl : STD_LOGIC;
  SIGNAL nor_139_nl : STD_LOGIC;
  SIGNAL nor_140_nl : STD_LOGIC;
  SIGNAL nor_141_nl : STD_LOGIC;
  SIGNAL mux_601_nl : STD_LOGIC;
  SIGNAL nor_128_nl : STD_LOGIC;
  SIGNAL nor_129_nl : STD_LOGIC;
  SIGNAL mux_600_nl : STD_LOGIC;
  SIGNAL or_757_nl : STD_LOGIC;
  SIGNAL nor_130_nl : STD_LOGIC;
  SIGNAL mux_599_nl : STD_LOGIC;
  SIGNAL or_754_nl : STD_LOGIC;
  SIGNAL or_753_nl : STD_LOGIC;
  SIGNAL mux_598_nl : STD_LOGIC;
  SIGNAL or_752_nl : STD_LOGIC;
  SIGNAL mux_606_nl : STD_LOGIC;
  SIGNAL mux_605_nl : STD_LOGIC;
  SIGNAL nor_124_nl : STD_LOGIC;
  SIGNAL nor_125_nl : STD_LOGIC;
  SIGNAL nor_127_nl : STD_LOGIC;
  SIGNAL mux_604_nl : STD_LOGIC;
  SIGNAL mux_603_nl : STD_LOGIC;
  SIGNAL or_772_nl : STD_LOGIC;
  SIGNAL or_777_nl : STD_LOGIC;
  SIGNAL or_762_nl : STD_LOGIC;
  SIGNAL nand_54_nl : STD_LOGIC;
  SIGNAL mux_622_nl : STD_LOGIC;
  SIGNAL or_792_nl : STD_LOGIC;
  SIGNAL mux_621_nl : STD_LOGIC;
  SIGNAL mux_620_nl : STD_LOGIC;
  SIGNAL or_791_nl : STD_LOGIC;
  SIGNAL mux_619_nl : STD_LOGIC;
  SIGNAL or_790_nl : STD_LOGIC;
  SIGNAL or_789_nl : STD_LOGIC;
  SIGNAL or_787_nl : STD_LOGIC;
  SIGNAL nor_122_nl : STD_LOGIC;
  SIGNAL mux_627_nl : STD_LOGIC;
  SIGNAL or_799_nl : STD_LOGIC;
  SIGNAL mux_626_nl : STD_LOGIC;
  SIGNAL or_545_nl : STD_LOGIC;
  SIGNAL nor_123_nl : STD_LOGIC;
  SIGNAL mux_625_nl : STD_LOGIC;
  SIGNAL mux_624_nl : STD_LOGIC;
  SIGNAL or_541_nl : STD_LOGIC;
  SIGNAL or_794_nl : STD_LOGIC;
  SIGNAL mux_633_nl : STD_LOGIC;
  SIGNAL nor_118_nl : STD_LOGIC;
  SIGNAL mux_632_nl : STD_LOGIC;
  SIGNAL mux_631_nl : STD_LOGIC;
  SIGNAL or_807_nl : STD_LOGIC;
  SIGNAL or_805_nl : STD_LOGIC;
  SIGNAL or_804_nl : STD_LOGIC;
  SIGNAL mux_630_nl : STD_LOGIC;
  SIGNAL nor_119_nl : STD_LOGIC;
  SIGNAL and_352_nl : STD_LOGIC;
  SIGNAL mux_629_nl : STD_LOGIC;
  SIGNAL nor_120_nl : STD_LOGIC;
  SIGNAL nor_121_nl : STD_LOGIC;
  SIGNAL mux_638_nl : STD_LOGIC;
  SIGNAL nor_114_nl : STD_LOGIC;
  SIGNAL mux_637_nl : STD_LOGIC;
  SIGNAL mux_636_nl : STD_LOGIC;
  SIGNAL or_816_nl : STD_LOGIC;
  SIGNAL or_814_nl : STD_LOGIC;
  SIGNAL or_813_nl : STD_LOGIC;
  SIGNAL mux_635_nl : STD_LOGIC;
  SIGNAL nor_115_nl : STD_LOGIC;
  SIGNAL and_351_nl : STD_LOGIC;
  SIGNAL mux_634_nl : STD_LOGIC;
  SIGNAL nor_116_nl : STD_LOGIC;
  SIGNAL nor_117_nl : STD_LOGIC;
  SIGNAL mux_675_nl : STD_LOGIC;
  SIGNAL mux_674_nl : STD_LOGIC;
  SIGNAL or_874_nl : STD_LOGIC;
  SIGNAL or_872_nl : STD_LOGIC;
  SIGNAL nand_61_nl : STD_LOGIC;
  SIGNAL mux_673_nl : STD_LOGIC;
  SIGNAL or_871_nl : STD_LOGIC;
  SIGNAL mux_716_nl : STD_LOGIC;
  SIGNAL mux_715_nl : STD_LOGIC;
  SIGNAL nor_95_nl : STD_LOGIC;
  SIGNAL nor_96_nl : STD_LOGIC;
  SIGNAL mux_714_nl : STD_LOGIC;
  SIGNAL mux_713_nl : STD_LOGIC;
  SIGNAL mux_712_nl : STD_LOGIC;
  SIGNAL nor_97_nl : STD_LOGIC;
  SIGNAL nor_98_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL nor_100_nl : STD_LOGIC;
  SIGNAL nor_332_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL or_139_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL nand_103_nl : STD_LOGIC;
  SIGNAL mux_130_nl : STD_LOGIC;
  SIGNAL mux_129_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL or_136_nl : STD_LOGIC;
  SIGNAL and_85_nl : STD_LOGIC;
  SIGNAL and_86_nl : STD_LOGIC;
  SIGNAL and_98_nl : STD_LOGIC;
  SIGNAL and_99_nl : STD_LOGIC;
  SIGNAL and_103_nl : STD_LOGIC;
  SIGNAL and_104_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_mux1h_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_or_7_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_mux1h_8_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_or_8_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_or_5_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_and_2_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_mux1h_9_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_not_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_6_nl : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL S2_COPY_LOOP_for_or_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_mux1h_10_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_mux1h_11_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_or_9_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_or_1_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_and_1_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_mux1h_12_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_or_2_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_or_3_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_nor_1_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_or_4_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL nor_279_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL or_176_nl : STD_LOGIC;
  SIGNAL or_175_nl : STD_LOGIC;
  SIGNAL or_174_nl : STD_LOGIC;
  SIGNAL and_393_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL and_394_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL or_172_nl : STD_LOGIC;
  SIGNAL and_396_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL nor_280_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL or_188_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL or_187_nl : STD_LOGIC;
  SIGNAL nand_102_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL or_178_nl : STD_LOGIC;
  SIGNAL and_140_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL and_388_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL or_207_nl : STD_LOGIC;
  SIGNAL nor_269_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL nor_267_nl : STD_LOGIC;
  SIGNAL nor_268_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL nand_19_nl : STD_LOGIC;
  SIGNAL nand_18_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL and_145_nl : STD_LOGIC;
  SIGNAL and_147_nl : STD_LOGIC;
  SIGNAL and_152_nl : STD_LOGIC;
  SIGNAL and_154_nl : STD_LOGIC;
  SIGNAL and_158_nl : STD_LOGIC;
  SIGNAL and_159_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_8_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_5_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_10_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_or_6_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_and_3_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_mux1h_6_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_not_5_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL S1_OUTER_LOOP_for_or_1_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_7_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_8_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_9_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_or_2_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_and_2_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_mux1h_9_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_3_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_or_4_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_nor_1_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_or_5_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL nor_257_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL or_252_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL and_387_nl : STD_LOGIC;
  SIGNAL nor_258_nl : STD_LOGIC;
  SIGNAL nor_259_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL or_248_nl : STD_LOGIC;
  SIGNAL or_246_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL nor_252_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL nor_253_nl : STD_LOGIC;
  SIGNAL nor_254_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL nor_255_nl : STD_LOGIC;
  SIGNAL nor_256_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL or_254_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL mux_759_nl : STD_LOGIC;
  SIGNAL or_1063_nl : STD_LOGIC;
  SIGNAL nand_136_nl : STD_LOGIC;
  SIGNAL mux_757_nl : STD_LOGIC;
  SIGNAL or_1059_nl : STD_LOGIC;
  SIGNAL mux_751_nl : STD_LOGIC;
  SIGNAL nor_430_nl : STD_LOGIC;
  SIGNAL nor_431_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl : STD_LOGIC_VECTOR (14 DOWNTO
      0);
  SIGNAL not_1929_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL not_1930_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux_16_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL acc_3_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_4_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_if_mux_1_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_if_or_2_nl : STD_LOGIC;
  SIGNAL acc_5_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_6_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_7_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_8_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_13_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL acc_15_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_1_if_mult_1_if_mux_1_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_1_if_or_2_nl : STD_LOGIC;
  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL mult_12_z_mul_cmp_a : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL mult_12_z_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_12_z_mul_cmp_z_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL mult_z_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_z_1 : STD_LOGIC_VECTOR (51 DOWNTO 0);

  SIGNAL operator_33_true_1_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL operator_33_true_1_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_33_true_1_lshift_rg_z : STD_LOGIC_VECTOR (3 DOWNTO 0);

  COMPONENT hybrid_core_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      xx_rsc_cgo_iro : IN STD_LOGIC;
      xx_rsci_clken_d : OUT STD_LOGIC;
      yy_rsc_cgo_iro : IN STD_LOGIC;
      yy_rsci_clken_d : OUT STD_LOGIC;
      ensig_cgo_iro : IN STD_LOGIC;
      S34_OUTER_LOOP_for_tf_mul_cmp_z : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      ensig_cgo_iro_1 : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      xx_rsc_cgo : IN STD_LOGIC;
      yy_rsc_cgo : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      mult_12_z_mul_cmp_en : OUT STD_LOGIC;
      S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      ensig_cgo_1 : IN STD_LOGIC;
      mult_z_mul_cmp_en : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL hybrid_core_wait_dp_inst_ensig_cgo_iro_1 : STD_LOGIC;
  SIGNAL hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg : STD_LOGIC_VECTOR
      (9 DOWNTO 0);

  COMPONENT hybrid_core_x_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      x_rsc_s_tdone : IN STD_LOGIC;
      x_rsc_tr_write_done : IN STD_LOGIC;
      x_rsc_RREADY : IN STD_LOGIC;
      x_rsc_RVALID : OUT STD_LOGIC;
      x_rsc_RUSER : OUT STD_LOGIC;
      x_rsc_RLAST : OUT STD_LOGIC;
      x_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      x_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      x_rsc_RID : OUT STD_LOGIC;
      x_rsc_ARREADY : OUT STD_LOGIC;
      x_rsc_ARVALID : IN STD_LOGIC;
      x_rsc_ARUSER : IN STD_LOGIC;
      x_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      x_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_ARLOCK : IN STD_LOGIC;
      x_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      x_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      x_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      x_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      x_rsc_ARID : IN STD_LOGIC;
      x_rsc_BREADY : IN STD_LOGIC;
      x_rsc_BVALID : OUT STD_LOGIC;
      x_rsc_BUSER : OUT STD_LOGIC;
      x_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      x_rsc_BID : OUT STD_LOGIC;
      x_rsc_WREADY : OUT STD_LOGIC;
      x_rsc_WVALID : IN STD_LOGIC;
      x_rsc_WUSER : IN STD_LOGIC;
      x_rsc_WLAST : IN STD_LOGIC;
      x_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      x_rsc_AWREADY : OUT STD_LOGIC;
      x_rsc_AWVALID : IN STD_LOGIC;
      x_rsc_AWUSER : IN STD_LOGIC;
      x_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      x_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_AWLOCK : IN STD_LOGIC;
      x_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      x_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      x_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      x_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      x_rsc_AWID : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      x_rsci_oswt : IN STD_LOGIC;
      x_rsci_wen_comp : OUT STD_LOGIC;
      x_rsci_oswt_1 : IN STD_LOGIC;
      x_rsci_wen_comp_1 : OUT STD_LOGIC;
      x_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      x_rsci_s_waddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      x_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      x_rsci_s_dout_core : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsci_s_raddr_core : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsci_s_waddr_core : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsci_s_din_mxwt : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL hybrid_core_x_rsci_inst_x_rsci_s_dout_core : STD_LOGIC_VECTOR (31 DOWNTO
      0);

  COMPONENT hybrid_core_twiddle_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_rsc_s_tdone : IN STD_LOGIC;
      twiddle_rsc_tr_write_done : IN STD_LOGIC;
      twiddle_rsc_RREADY : IN STD_LOGIC;
      twiddle_rsc_RVALID : OUT STD_LOGIC;
      twiddle_rsc_RUSER : OUT STD_LOGIC;
      twiddle_rsc_RLAST : OUT STD_LOGIC;
      twiddle_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_RID : OUT STD_LOGIC;
      twiddle_rsc_ARREADY : OUT STD_LOGIC;
      twiddle_rsc_ARVALID : IN STD_LOGIC;
      twiddle_rsc_ARUSER : IN STD_LOGIC;
      twiddle_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_ARLOCK : IN STD_LOGIC;
      twiddle_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      twiddle_rsc_ARID : IN STD_LOGIC;
      twiddle_rsc_BREADY : IN STD_LOGIC;
      twiddle_rsc_BVALID : OUT STD_LOGIC;
      twiddle_rsc_BUSER : OUT STD_LOGIC;
      twiddle_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsc_BID : OUT STD_LOGIC;
      twiddle_rsc_WREADY : OUT STD_LOGIC;
      twiddle_rsc_WVALID : IN STD_LOGIC;
      twiddle_rsc_WUSER : IN STD_LOGIC;
      twiddle_rsc_WLAST : IN STD_LOGIC;
      twiddle_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_AWREADY : OUT STD_LOGIC;
      twiddle_rsc_AWVALID : IN STD_LOGIC;
      twiddle_rsc_AWUSER : IN STD_LOGIC;
      twiddle_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_AWLOCK : IN STD_LOGIC;
      twiddle_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      twiddle_rsc_AWID : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_wen_comp : OUT STD_LOGIC;
      twiddle_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      twiddle_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARREGION : STD_LOGIC_VECTOR (3
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARCACHE : STD_LOGIC_VECTOR (3
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARBURST : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARADDR : STD_LOGIC_VECTOR (11
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWREGION : STD_LOGIC_VECTOR (3
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWCACHE : STD_LOGIC_VECTOR (3
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWBURST : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWADDR : STD_LOGIC_VECTOR (11
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_din_mxwt : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

  COMPONENT hybrid_core_twiddle_h_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsc_s_tdone : IN STD_LOGIC;
      twiddle_h_rsc_tr_write_done : IN STD_LOGIC;
      twiddle_h_rsc_RREADY : IN STD_LOGIC;
      twiddle_h_rsc_RVALID : OUT STD_LOGIC;
      twiddle_h_rsc_RUSER : OUT STD_LOGIC;
      twiddle_h_rsc_RLAST : OUT STD_LOGIC;
      twiddle_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsc_RID : OUT STD_LOGIC;
      twiddle_h_rsc_ARREADY : OUT STD_LOGIC;
      twiddle_h_rsc_ARVALID : IN STD_LOGIC;
      twiddle_h_rsc_ARUSER : IN STD_LOGIC;
      twiddle_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_ARLOCK : IN STD_LOGIC;
      twiddle_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      twiddle_h_rsc_ARID : IN STD_LOGIC;
      twiddle_h_rsc_BREADY : IN STD_LOGIC;
      twiddle_h_rsc_BVALID : OUT STD_LOGIC;
      twiddle_h_rsc_BUSER : OUT STD_LOGIC;
      twiddle_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsc_BID : OUT STD_LOGIC;
      twiddle_h_rsc_WREADY : OUT STD_LOGIC;
      twiddle_h_rsc_WVALID : IN STD_LOGIC;
      twiddle_h_rsc_WUSER : IN STD_LOGIC;
      twiddle_h_rsc_WLAST : IN STD_LOGIC;
      twiddle_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsc_AWREADY : OUT STD_LOGIC;
      twiddle_h_rsc_AWVALID : IN STD_LOGIC;
      twiddle_h_rsc_AWUSER : IN STD_LOGIC;
      twiddle_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_AWLOCK : IN STD_LOGIC;
      twiddle_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      twiddle_h_rsc_AWID : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_wen_comp : OUT STD_LOGIC;
      twiddle_h_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      twiddle_h_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_RRESP : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_RDATA : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARREGION : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARQOS : STD_LOGIC_VECTOR (3
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARPROT : STD_LOGIC_VECTOR
      (2 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARCACHE : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARBURST : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARSIZE : STD_LOGIC_VECTOR
      (2 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARLEN : STD_LOGIC_VECTOR (7
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARADDR : STD_LOGIC_VECTOR
      (11 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_BRESP : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_WSTRB : STD_LOGIC_VECTOR (3
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_WDATA : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWREGION : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWQOS : STD_LOGIC_VECTOR (3
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWPROT : STD_LOGIC_VECTOR
      (2 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWCACHE : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWBURST : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWSIZE : STD_LOGIC_VECTOR
      (2 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWLEN : STD_LOGIC_VECTOR (7
      DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWADDR : STD_LOGIC_VECTOR
      (11 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_din_mxwt : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

  COMPONENT hybrid_core_revArr_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      revArr_rsc_s_tdone : IN STD_LOGIC;
      revArr_rsc_tr_write_done : IN STD_LOGIC;
      revArr_rsc_RREADY : IN STD_LOGIC;
      revArr_rsc_RVALID : OUT STD_LOGIC;
      revArr_rsc_RUSER : OUT STD_LOGIC;
      revArr_rsc_RLAST : OUT STD_LOGIC;
      revArr_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      revArr_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      revArr_rsc_RID : OUT STD_LOGIC;
      revArr_rsc_ARREADY : OUT STD_LOGIC;
      revArr_rsc_ARVALID : IN STD_LOGIC;
      revArr_rsc_ARUSER : IN STD_LOGIC;
      revArr_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      revArr_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_ARLOCK : IN STD_LOGIC;
      revArr_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      revArr_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      revArr_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      revArr_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      revArr_rsc_ARID : IN STD_LOGIC;
      revArr_rsc_BREADY : IN STD_LOGIC;
      revArr_rsc_BVALID : OUT STD_LOGIC;
      revArr_rsc_BUSER : OUT STD_LOGIC;
      revArr_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      revArr_rsc_BID : OUT STD_LOGIC;
      revArr_rsc_WREADY : OUT STD_LOGIC;
      revArr_rsc_WVALID : IN STD_LOGIC;
      revArr_rsc_WUSER : IN STD_LOGIC;
      revArr_rsc_WLAST : IN STD_LOGIC;
      revArr_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      revArr_rsc_AWREADY : OUT STD_LOGIC;
      revArr_rsc_AWVALID : IN STD_LOGIC;
      revArr_rsc_AWUSER : IN STD_LOGIC;
      revArr_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      revArr_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_AWLOCK : IN STD_LOGIC;
      revArr_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      revArr_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      revArr_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      revArr_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      revArr_rsc_AWID : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      revArr_rsci_oswt : IN STD_LOGIC;
      revArr_rsci_wen_comp : OUT STD_LOGIC;
      revArr_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      revArr_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO
      0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsci_s_raddr_core : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL hybrid_core_revArr_rsci_inst_revArr_rsci_s_din_mxwt : STD_LOGIC_VECTOR (9
      DOWNTO 0);

  COMPONENT hybrid_core_tw_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      tw_rsc_s_tdone : IN STD_LOGIC;
      tw_rsc_tr_write_done : IN STD_LOGIC;
      tw_rsc_RREADY : IN STD_LOGIC;
      tw_rsc_RVALID : OUT STD_LOGIC;
      tw_rsc_RUSER : OUT STD_LOGIC;
      tw_rsc_RLAST : OUT STD_LOGIC;
      tw_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      tw_rsc_RID : OUT STD_LOGIC;
      tw_rsc_ARREADY : OUT STD_LOGIC;
      tw_rsc_ARVALID : IN STD_LOGIC;
      tw_rsc_ARUSER : IN STD_LOGIC;
      tw_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_ARLOCK : IN STD_LOGIC;
      tw_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      tw_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      tw_rsc_ARID : IN STD_LOGIC;
      tw_rsc_BREADY : IN STD_LOGIC;
      tw_rsc_BVALID : OUT STD_LOGIC;
      tw_rsc_BUSER : OUT STD_LOGIC;
      tw_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_rsc_BID : OUT STD_LOGIC;
      tw_rsc_WREADY : OUT STD_LOGIC;
      tw_rsc_WVALID : IN STD_LOGIC;
      tw_rsc_WUSER : IN STD_LOGIC;
      tw_rsc_WLAST : IN STD_LOGIC;
      tw_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      tw_rsc_AWREADY : OUT STD_LOGIC;
      tw_rsc_AWVALID : IN STD_LOGIC;
      tw_rsc_AWUSER : IN STD_LOGIC;
      tw_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_AWLOCK : IN STD_LOGIC;
      tw_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      tw_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      tw_rsc_AWID : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      tw_rsci_oswt : IN STD_LOGIC;
      tw_rsci_wen_comp : OUT STD_LOGIC;
      tw_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      tw_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (19 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsci_s_raddr_core : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL hybrid_core_tw_rsci_inst_tw_rsci_s_din_mxwt : STD_LOGIC_VECTOR (19 DOWNTO
      0);

  COMPONENT hybrid_core_tw_h_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      tw_h_rsc_s_tdone : IN STD_LOGIC;
      tw_h_rsc_tr_write_done : IN STD_LOGIC;
      tw_h_rsc_RREADY : IN STD_LOGIC;
      tw_h_rsc_RVALID : OUT STD_LOGIC;
      tw_h_rsc_RUSER : OUT STD_LOGIC;
      tw_h_rsc_RLAST : OUT STD_LOGIC;
      tw_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      tw_h_rsc_RID : OUT STD_LOGIC;
      tw_h_rsc_ARREADY : OUT STD_LOGIC;
      tw_h_rsc_ARVALID : IN STD_LOGIC;
      tw_h_rsc_ARUSER : IN STD_LOGIC;
      tw_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_ARLOCK : IN STD_LOGIC;
      tw_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      tw_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      tw_h_rsc_ARID : IN STD_LOGIC;
      tw_h_rsc_BREADY : IN STD_LOGIC;
      tw_h_rsc_BVALID : OUT STD_LOGIC;
      tw_h_rsc_BUSER : OUT STD_LOGIC;
      tw_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_h_rsc_BID : OUT STD_LOGIC;
      tw_h_rsc_WREADY : OUT STD_LOGIC;
      tw_h_rsc_WVALID : IN STD_LOGIC;
      tw_h_rsc_WUSER : IN STD_LOGIC;
      tw_h_rsc_WLAST : IN STD_LOGIC;
      tw_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      tw_h_rsc_AWREADY : OUT STD_LOGIC;
      tw_h_rsc_AWVALID : IN STD_LOGIC;
      tw_h_rsc_AWUSER : IN STD_LOGIC;
      tw_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_AWLOCK : IN STD_LOGIC;
      tw_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      tw_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      tw_h_rsc_AWID : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      tw_h_rsci_oswt : IN STD_LOGIC;
      tw_h_rsci_wen_comp : OUT STD_LOGIC;
      tw_h_rsci_s_raddr_core : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      tw_h_rsci_s_din_mxwt : OUT STD_LOGIC_VECTOR (19 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO
      0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsci_s_raddr_core : STD_LOGIC_VECTOR (9
      DOWNTO 0);
  SIGNAL hybrid_core_tw_h_rsci_inst_tw_h_rsci_s_din_mxwt : STD_LOGIC_VECTOR (19 DOWNTO
      0);

  COMPONENT hybrid_core_x_rsc_triosy_obj
    PORT(
      x_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      x_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_m_rsc_triosy_obj
    PORT(
      m_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      m_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_twiddle_rsc_triosy_obj
    PORT(
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_twiddle_h_rsc_triosy_obj
    PORT(
      twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_revArr_rsc_triosy_obj
    PORT(
      revArr_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      revArr_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_tw_rsc_triosy_obj
    PORT(
      tw_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      tw_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_tw_h_rsc_triosy_obj
    PORT(
      tw_h_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      tw_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : OUT STD_LOGIC;
      core_wten : OUT STD_LOGIC;
      x_rsci_wen_comp : IN STD_LOGIC;
      x_rsci_wen_comp_1 : IN STD_LOGIC;
      twiddle_rsci_wen_comp : IN STD_LOGIC;
      twiddle_h_rsci_wen_comp : IN STD_LOGIC;
      revArr_rsci_wen_comp : IN STD_LOGIC;
      tw_rsci_wen_comp : IN STD_LOGIC;
      tw_h_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT hybrid_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      S1_OUTER_LOOP_for_C_4_tr0 : IN STD_LOGIC;
      S1_OUTER_LOOP_C_0_tr0 : IN STD_LOGIC;
      S2_COPY_LOOP_for_C_3_tr0 : IN STD_LOGIC;
      S2_COPY_LOOP_C_0_tr0 : IN STD_LOGIC;
      S2_INNER_LOOP1_for_C_24_tr0 : IN STD_LOGIC;
      S2_INNER_LOOP1_C_0_tr0 : IN STD_LOGIC;
      S2_INNER_LOOP2_for_C_23_tr0 : IN STD_LOGIC;
      S2_INNER_LOOP2_C_0_tr0 : IN STD_LOGIC;
      S2_INNER_LOOP2_C_0_tr1 : IN STD_LOGIC;
      S2_INNER_LOOP3_for_C_23_tr0 : IN STD_LOGIC;
      S2_INNER_LOOP3_C_0_tr0 : IN STD_LOGIC;
      S34_OUTER_LOOP_for_C_12_tr0 : IN STD_LOGIC;
      S34_OUTER_LOOP_C_0_tr0 : IN STD_LOGIC;
      S5_COPY_LOOP_for_C_3_tr0 : IN STD_LOGIC;
      S5_COPY_LOOP_C_0_tr0 : IN STD_LOGIC;
      S5_INNER_LOOP1_for_C_24_tr0 : IN STD_LOGIC;
      S5_INNER_LOOP1_C_0_tr0 : IN STD_LOGIC;
      S5_INNER_LOOP2_for_C_23_tr0 : IN STD_LOGIC;
      S5_INNER_LOOP2_C_0_tr0 : IN STD_LOGIC;
      S5_INNER_LOOP2_C_0_tr1 : IN STD_LOGIC;
      S5_INNER_LOOP3_for_C_23_tr0 : IN STD_LOGIC;
      S5_INNER_LOOP3_C_0_tr0 : IN STD_LOGIC;
      S6_OUTER_LOOP_for_C_3_tr0 : IN STD_LOGIC;
      S6_OUTER_LOOP_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL hybrid_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_4_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_24_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_23_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_23_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_12_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_24_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_23_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_23_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0 : STD_LOGIC;
  SIGNAL hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_s_1_3_2(input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_4_2(input_3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_5_2(input_4 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_15_2(input_14 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(14 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
      tmp := (OTHERS=>sel( 9));
      result := result or ( input_9 and tmp);
      tmp := (OTHERS=>sel( 10));
      result := result or ( input_10 and tmp);
      tmp := (OTHERS=>sel( 11));
      result := result or ( input_11 and tmp);
      tmp := (OTHERS=>sel( 12));
      result := result or ( input_12 and tmp);
      tmp := (OTHERS=>sel( 13));
      result := result or ( input_13 and tmp);
      tmp := (OTHERS=>sel( 14));
      result := result or ( input_14 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_17_2(input_16 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(16 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
      tmp := (OTHERS=>sel( 9));
      result := result or ( input_9 and tmp);
      tmp := (OTHERS=>sel( 10));
      result := result or ( input_10 and tmp);
      tmp := (OTHERS=>sel( 11));
      result := result or ( input_11 and tmp);
      tmp := (OTHERS=>sel( 12));
      result := result or ( input_12 and tmp);
      tmp := (OTHERS=>sel( 13));
      result := result or ( input_13 and tmp);
      tmp := (OTHERS=>sel( 14));
      result := result or ( input_14 and tmp);
      tmp := (OTHERS=>sel( 15));
      result := result or ( input_15 and tmp);
      tmp := (OTHERS=>sel( 16));
      result := result or ( input_16 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_25_2(input_24 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(24 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
      tmp := (OTHERS=>sel( 9));
      result := result or ( input_9 and tmp);
      tmp := (OTHERS=>sel( 10));
      result := result or ( input_10 and tmp);
      tmp := (OTHERS=>sel( 11));
      result := result or ( input_11 and tmp);
      tmp := (OTHERS=>sel( 12));
      result := result or ( input_12 and tmp);
      tmp := (OTHERS=>sel( 13));
      result := result or ( input_13 and tmp);
      tmp := (OTHERS=>sel( 14));
      result := result or ( input_14 and tmp);
      tmp := (OTHERS=>sel( 15));
      result := result or ( input_15 and tmp);
      tmp := (OTHERS=>sel( 16));
      result := result or ( input_16 and tmp);
      tmp := (OTHERS=>sel( 17));
      result := result or ( input_17 and tmp);
      tmp := (OTHERS=>sel( 18));
      result := result or ( input_18 and tmp);
      tmp := (OTHERS=>sel( 19));
      result := result or ( input_19 and tmp);
      tmp := (OTHERS=>sel( 20));
      result := result or ( input_20 and tmp);
      tmp := (OTHERS=>sel( 21));
      result := result or ( input_21 and tmp);
      tmp := (OTHERS=>sel( 22));
      result := result or ( input_22 and tmp);
      tmp := (OTHERS=>sel( 23));
      result := result or ( input_23 and tmp);
      tmp := (OTHERS=>sel( 24));
      result := result or ( input_24 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_3_2(input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_4_2(input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_5_2(input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_8_2(input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_9_2(input_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_3_9_2(input_8 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_3_2(input_2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_15_2_2(input_0 : STD_LOGIC_VECTOR(14 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(14 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(14 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_20_2_2(input_0 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(19 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_2_2_2(input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_32_2_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_3_2_2(input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_6_2_2(input_0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(5 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  m_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 32
      )
    PORT MAP(
      dat => m_rsci_dat,
      idat => m_rsci_idat_1
    );
  m_rsci_dat <= m_rsc_dat;
  m_rsci_idat <= m_rsci_idat_1;

  mult_12_z_mul_cmp : work.mgc_comps.mgc_mul_pipe
    GENERIC MAP(
      width_a => 20,
      signd_a => 1,
      width_b => 32,
      signd_b => 0,
      width_z => 32,
      clock_edge => 1,
      enable_active => 1,
      a_rst_active => 0,
      s_rst_active => 1,
      stages => 2,
      n_inreg => 2
      )
    PORT MAP(
      a => mult_12_z_mul_cmp_a,
      b => mult_12_z_mul_cmp_b,
      clk => clk,
      en => mult_12_z_mul_cmp_en,
      a_rst => '1',
      s_rst => rst,
      z => mult_12_z_mul_cmp_z_1
    );
  mult_12_z_mul_cmp_a <= MUX_v_20_2_2(tw_rsci_s_din_mxwt, S34_OUTER_LOOP_for_tf_sva,
      and_dcpl_194);
  mult_12_z_mul_cmp_b <= mult_x_1_sva;
  mult_12_z_mul_cmp_z <= mult_12_z_mul_cmp_z_1;

  mult_z_mul_cmp : work.mgc_comps.mgc_mul_pipe
    GENERIC MAP(
      width_a => 32,
      signd_a => 0,
      width_b => 32,
      signd_b => 0,
      width_z => 52,
      clock_edge => 1,
      enable_active => 1,
      a_rst_active => 0,
      s_rst_active => 1,
      stages => 2,
      n_inreg => 2
      )
    PORT MAP(
      a => mult_z_mul_cmp_a,
      b => mult_z_mul_cmp_b,
      clk => clk,
      en => mult_z_mul_cmp_en,
      a_rst => '1',
      s_rst => rst,
      z => mult_z_mul_cmp_z_1
    );
  mult_z_mul_cmp_a <= MUX1HOT_v_32_8_2(mult_x_1_sva, mult_x_16_sva, mult_x_15_sva,
      operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm, operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm,
      yy_rsci_q_d, xx_rsci_q_d, (mult_z_mul_cmp_z(51 DOWNTO 20)), STD_LOGIC_VECTOR'(
      (NOT (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(4)) AND (NOT (MUX_s_1_2_2(((fsm_output(1))
      OR (fsm_output(5))), or_tmp_264, fsm_output(0)))))), ((fsm_output(4)) OR (MUX_s_1_2_2(((NOT
      (fsm_output(1))) OR (fsm_output(2)) OR (NOT (fsm_output(5)))), (MUX_s_1_2_2(not_tmp_150,
      ((NOT (fsm_output(2))) OR (fsm_output(5))), fsm_output(1))), fsm_output(0)))),
      fsm_output(3))), (MUX_s_1_2_2((MUX_s_1_2_2(((NOT (fsm_output(0))) OR (NOT (fsm_output(1)))
      OR (fsm_output(2)) OR (fsm_output(5))), (MUX_s_1_2_2(((fsm_output(1)) OR (NOT
      (fsm_output(5)))), ((fsm_output(2)) OR (NOT (fsm_output(5)))), fsm_output(0))),
      fsm_output(4))), (MUX_s_1_2_2(or_tmp_264, ((fsm_output(1)) OR (NOT (fsm_output(2)))
      OR (fsm_output(5))), fsm_output(4))), fsm_output(3))), fsm_output(6))), ((fsm_output(6))
      OR (MUX_s_1_2_2(((fsm_output(4)) OR (MUX_s_1_2_2(((fsm_output(1)) OR not_tmp_150),
      (NOT((fsm_output(1)) AND (fsm_output(2)) AND (fsm_output(5)))), fsm_output(0)))),
      ((fsm_output(4)) OR (MUX_s_1_2_2(((NOT (fsm_output(1))) OR (NOT (fsm_output(2)))
      OR (fsm_output(5))), ((NOT (fsm_output(1))) OR (fsm_output(2)) OR (fsm_output(5))),
      fsm_output(0)))), fsm_output(3)))), fsm_output(7)))) & (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((NOT(CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("01")) OR nand_124_cse)), (NOT((fsm_output(6))
      OR (MUX_s_1_2_2(or_tmp_275, or_35_cse, fsm_output(7))))), fsm_output(4))),
      ((fsm_output(4)) AND (MUX_s_1_2_2(nor_248_cse, (NOT((fsm_output(7)) OR nand_96_cse)),
      fsm_output(6)))), fsm_output(5))), (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("010"))
      OR (MUX_s_1_2_2(nand_124_cse, (MUX_s_1_2_2(or_tmp_275, or_35_cse, fsm_output(0))),
      fsm_output(7))))), fsm_output(3))) & (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(1))
      AND (fsm_output(5)) AND (fsm_output(6)) AND (fsm_output(4)) AND (NOT (fsm_output(3)))),
      (NOT((fsm_output(1)) OR (NOT (fsm_output(5))) OR (fsm_output(6)) OR (fsm_output(4))
      OR (NOT (fsm_output(3))))), fsm_output(7))), ((NOT((fsm_output(7)) OR (NOT
      (fsm_output(1))))) AND (MUX_s_1_2_2((MUX_s_1_2_2((NOT(CONV_SL_1_1(fsm_output(4
      DOWNTO 3)/=STD_LOGIC_VECTOR'("10")))), nor_242_cse, fsm_output(6))), (NOT((fsm_output(6))
      OR (fsm_output(4)) OR (NOT (fsm_output(3))))), fsm_output(5)))), fsm_output(2))),
      ((fsm_output(2)) AND (MUX_s_1_2_2((NOT((fsm_output(1)) OR (MUX_s_1_2_2(((fsm_output(6))
      OR (NOT (fsm_output(4))) OR (fsm_output(3))), ((NOT (fsm_output(6))) OR (NOT
      (fsm_output(4))) OR (fsm_output(3))), fsm_output(5))))), (NOT((NOT (fsm_output(1)))
      OR (fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(4)) OR (NOT (fsm_output(3))))),
      fsm_output(7)))), fsm_output(0))) & (NOT (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(5))
      AND (NOT mux_tmp_263))), ((fsm_output(5)) OR (MUX_s_1_2_2((NOT((fsm_output(1))
      AND (MUX_s_1_2_2((fsm_output(6)), (NOT (fsm_output(6))), fsm_output(4))))),
      or_tmp_301, fsm_output(2)))), fsm_output(3))), (MUX_s_1_2_2(((fsm_output(5))
      OR (NOT (fsm_output(2))) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(4)))
      OR (fsm_output(6))), (MUX_s_1_2_2((MUX_s_1_2_2(or_tmp_295, or_tmp_301, fsm_output(2))),
      ((fsm_output(2)) OR nand_95_cse), fsm_output(5))), fsm_output(3))), fsm_output(0))),
      (MUX_s_1_2_2((CONV_SL_1_1(fsm_output(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("01011"))),
      ((fsm_output(3)) OR (fsm_output(5)) OR mux_tmp_263), fsm_output(0))), fsm_output(7))))
      & (MUX_s_1_2_2(((fsm_output(4)) AND (NOT (MUX_s_1_2_2((MUX_s_1_2_2(mux_tmp_273,
      ((fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(2))),
      fsm_output(3))), ((NOT (fsm_output(3))) OR (fsm_output(7)) OR (NOT (fsm_output(6)))
      OR (fsm_output(2))), fsm_output(5))))), (MUX_s_1_2_2((MUX_s_1_2_2((NOT((NOT
      (fsm_output(3))) OR (NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(6)))
      OR (fsm_output(2)))), ((fsm_output(3)) AND (NOT mux_tmp_273)), fsm_output(5))),
      (NOT((NOT (fsm_output(5))) OR (fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(6))
      OR (fsm_output(2)))), fsm_output(4))), fsm_output(0))) & (NOT((MUX_s_1_2_2((MUX_s_1_2_2(((NOT
      (fsm_output(3))) OR (NOT (fsm_output(0))) OR (fsm_output(7))), (MUX_s_1_2_2(not_tmp_173,
      or_325_cse, fsm_output(3))), fsm_output(1))), (MUX_s_1_2_2((MUX_s_1_2_2(not_tmp_173,
      ((fsm_output(0)) OR (fsm_output(7))), fsm_output(3))), ((fsm_output(3)) OR
      (fsm_output(0)) OR (NOT (fsm_output(7)))), fsm_output(1))), fsm_output(2)))
      OR CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("010")))) & ((MUX_s_1_2_2(((fsm_output(1))
      AND (NOT mux_tmp_201)), (NOT((fsm_output(1)) OR mux_tmp_137)), fsm_output(2)))
      AND and_dcpl_101) & ((MUX_s_1_2_2((NOT((fsm_output(1)) OR (fsm_output(3)) OR
      (fsm_output(0)) OR (fsm_output(4)) OR (NOT (fsm_output(5))))), ((fsm_output(1))
      AND (fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(4)) AND (NOT (fsm_output(5)))),
      fsm_output(2))) AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01")))));
  mult_z_mul_cmp_b <= MUX1HOT_v_32_9_2(twiddle_h_rsci_s_din_mxwt, butterFly_10_tw_asn_itm,
      twiddle_rsci_s_din_mxwt, butterFly_14_tw_h_asn_itm, butterFly_10_tw_h_asn_itm,
      butterFly_13_tw_h_asn_itm, m_sva, STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tw_h_rsci_s_din_mxwt),32)),
      STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(S34_OUTER_LOOP_for_tf_h_sva),32)), STD_LOGIC_VECTOR'(
      (MUX_s_1_2_2(((NOT((fsm_output(2)) OR (NOT (fsm_output(5))))) AND (MUX_s_1_2_2((NOT((fsm_output(7))
      OR (NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(3)))), (NOT((fsm_output(7))
      OR (fsm_output(4)) OR (fsm_output(6)) OR (NOT (fsm_output(3))))), fsm_output(0)))),
      (MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(0)) OR (MUX_s_1_2_2(((fsm_output(4))
      OR (NOT (fsm_output(6))) OR (fsm_output(3))), or_335_cse, fsm_output(7))))),
      (NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(7))) OR (fsm_output(4)) OR (fsm_output(6))
      OR (fsm_output(3)))), fsm_output(5))), (NOT((fsm_output(5)) OR (NOT (fsm_output(0)))
      OR (fsm_output(7)) OR (fsm_output(4)) OR (fsm_output(6)) OR (NOT (fsm_output(3))))),
      fsm_output(2))), fsm_output(1))) & (NOT (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(1))
      OR (NOT (fsm_output(7))) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(5)))
      OR (fsm_output(6))), ((NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(2))
      OR (fsm_output(5)) OR (NOT (fsm_output(6)))), fsm_output(0))), (MUX_s_1_2_2((MUX_s_1_2_2(or_351_cse,
      ((fsm_output(7)) OR (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(6))),
      fsm_output(1))), (MUX_s_1_2_2(or_348_cse, (MUX_s_1_2_2(((NOT (fsm_output(2)))
      OR (NOT (fsm_output(5))) OR (fsm_output(6))), or_tmp_334, fsm_output(7))),
      fsm_output(1))), fsm_output(0))), fsm_output(3))), ((fsm_output(3)) OR (MUX_s_1_2_2((MUX_s_1_2_2(or_tmp_334,
      ((fsm_output(7)) OR (NOT((fsm_output(2)) AND (fsm_output(5)) AND (fsm_output(6))))),
      fsm_output(1))), ((fsm_output(1)) OR (fsm_output(7)) OR (MUX_s_1_2_2((NOT(CONV_SL_1_1(fsm_output(6
      DOWNTO 5)=STD_LOGIC_VECTOR'("11")))), (CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"))),
      fsm_output(2)))), fsm_output(0)))), fsm_output(4)))) & (NOT (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(2))
      AND (NOT (MUX_s_1_2_2(or_tmp_352, ((fsm_output(7)) OR (NOT (fsm_output(3)))
      OR (fsm_output(4))), fsm_output(5)))))), (MUX_s_1_2_2(or_tmp_349, (MUX_s_1_2_2(or_tmp_352,
      ((NOT (fsm_output(7))) OR (fsm_output(3)) OR (fsm_output(4))), fsm_output(5))),
      fsm_output(2))), fsm_output(0))), ((NOT (fsm_output(2))) OR (fsm_output(5))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(4))), fsm_output(6))),
      (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(or_tmp_349, ((NOT (fsm_output(5))) OR
      (NOT (fsm_output(7))) OR (fsm_output(3)) OR (fsm_output(4))), fsm_output(2))),
      ((fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR (NOT (fsm_output(3)))
      OR (fsm_output(4))), fsm_output(0))), ((fsm_output(2)) OR (NOT (fsm_output(5)))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (NOT (fsm_output(4)))), fsm_output(6))),
      fsm_output(1)))) & (MUX_s_1_2_2((MUX_s_1_2_2((NOT((NOT (fsm_output(0))) OR
      (fsm_output(5)) OR (fsm_output(7)) OR not_tmp_188)), (NOT((fsm_output(0)) OR
      (NOT (fsm_output(5))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(1))) OR
      (fsm_output(2)) OR (fsm_output(6)))), fsm_output(3))), (NOT((fsm_output(3))
      OR (MUX_s_1_2_2(((NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(1))
      OR (fsm_output(2)) OR (fsm_output(6))), (MUX_s_1_2_2((MUX_s_1_2_2(((NOT (fsm_output(1)))
      OR (fsm_output(2)) OR (fsm_output(6))), ((fsm_output(1)) OR (fsm_output(2))
      OR (fsm_output(6))), fsm_output(7))), ((fsm_output(7)) OR not_tmp_188), fsm_output(5))),
      fsm_output(0))))), fsm_output(4))) & (MUX_s_1_2_2((NOT((fsm_output(7)) OR (MUX_s_1_2_2((NOT((fsm_output(0))
      AND (fsm_output(3)) AND (NOT (MUX_s_1_2_2(((NOT (fsm_output(6))) OR (fsm_output(2))),
      or_tmp_369, fsm_output(5)))))), ((fsm_output(0)) OR (fsm_output(3)) OR (MUX_s_1_2_2(or_tmp_369,
      (NOT((fsm_output(6)) AND (fsm_output(2)))), fsm_output(5)))), fsm_output(4))))),
      (NOT((NOT (fsm_output(7))) OR (fsm_output(4)) OR (MUX_s_1_2_2(((NOT (fsm_output(3)))
      OR (fsm_output(5)) OR (fsm_output(6)) OR (NOT (fsm_output(2)))), ((fsm_output(3))
      OR (NOT (fsm_output(5))) OR (fsm_output(6)) OR (NOT (fsm_output(2)))), fsm_output(0))))),
      fsm_output(1))) & (MUX_s_1_2_2((MUX_s_1_2_2((NOT((NOT (fsm_output(7))) OR (fsm_output(0))
      OR (NOT (fsm_output(5))) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR (fsm_output(6)))),
      (NOT((fsm_output(7)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(5))) OR (fsm_output(3))
      OR nand_95_cse)), fsm_output(2))), ((fsm_output(2)) AND (MUX_s_1_2_2((NOT((fsm_output(0))
      OR (MUX_s_1_2_2(((fsm_output(3)) OR mux_320_cse), or_335_cse, fsm_output(5))))),
      (NOT((NOT (fsm_output(0))) OR (fsm_output(5)) OR (NOT (fsm_output(3))) OR (fsm_output(4))
      OR (fsm_output(6)))), fsm_output(7)))), fsm_output(1))) & (NOT (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(((NOT
      (fsm_output(3))) OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(6))),
      mux_tmp_330, fsm_output(2))), (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(or_900_cse,
      or_888_cse, fsm_output(3))), (MUX_s_1_2_2(or_889_cse, or_403_cse, fsm_output(3))),
      fsm_output(2))), mux_tmp_328, fsm_output(0))), fsm_output(5))), (MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(2))
      OR (MUX_s_1_2_2(or_964_cse, (MUX_s_1_2_2(or_467_cse, or_401_cse, fsm_output(4))),
      fsm_output(3)))), (MUX_s_1_2_2(mux_tmp_330, mux_tmp_327, fsm_output(2))), fsm_output(0))),
      (MUX_s_1_2_2(mux_tmp_328, ((fsm_output(2)) OR (MUX_s_1_2_2(or_889_cse, mux_325_cse,
      fsm_output(3)))), fsm_output(0))), fsm_output(5))), fsm_output(1)))) & (and_dcpl_70
      AND and_dcpl_123) & and_dcpl_194));
  mult_z_mul_cmp_z <= mult_z_mul_cmp_z_1;

  operator_33_true_1_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_bl_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 1,
      width_s => 4,
      width_z => 4
      )
    PORT MAP(
      a => operator_33_true_1_lshift_rg_a,
      s => operator_33_true_1_lshift_rg_s,
      z => operator_33_true_1_lshift_rg_z
    );
  operator_33_true_1_lshift_rg_a(0) <= '1';
  operator_33_true_1_lshift_rg_s <= STD_LOGIC_VECTOR'( '0' & ((S2_INNER_LOOP1_r_4_2_sva_1_0(0))
      AND (NOT and_441_ssc)) & (MUX_s_1_2_2(S2_OUTER_LOOP_c_1_sva, (NOT S2_OUTER_LOOP_c_1_sva),
      and_441_ssc)) & and_441_ssc);
  z_out <= operator_33_true_1_lshift_rg_z;

  hybrid_core_wait_dp_inst : hybrid_core_wait_dp
    PORT MAP(
      clk => clk,
      xx_rsc_cgo_iro => mux_127_rmff,
      xx_rsci_clken_d => xx_rsci_clken_d,
      yy_rsc_cgo_iro => mux_185_rmff,
      yy_rsci_clken_d => yy_rsci_clken_d,
      ensig_cgo_iro => and_200_rmff,
      S34_OUTER_LOOP_for_tf_mul_cmp_z => hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z,
      ensig_cgo_iro_1 => hybrid_core_wait_dp_inst_ensig_cgo_iro_1,
      core_wen => core_wen,
      xx_rsc_cgo => reg_xx_rsc_cgo_cse,
      yy_rsc_cgo => reg_yy_rsc_cgo_cse,
      ensig_cgo => reg_ensig_cgo_cse,
      mult_12_z_mul_cmp_en => mult_12_z_mul_cmp_en,
      S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg => hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg,
      ensig_cgo_1 => reg_ensig_cgo_1_cse,
      mult_z_mul_cmp_en => mult_z_mul_cmp_en
    );
  hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z <= S34_OUTER_LOOP_for_tf_mul_cmp_z;
  hybrid_core_wait_dp_inst_ensig_cgo_iro_1 <= NOT mux_235_itm;
  S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg <= hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg;

  hybrid_core_x_rsci_inst : hybrid_core_x_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      x_rsc_s_tdone => x_rsc_s_tdone,
      x_rsc_tr_write_done => x_rsc_tr_write_done,
      x_rsc_RREADY => x_rsc_RREADY,
      x_rsc_RVALID => x_rsc_RVALID,
      x_rsc_RUSER => x_rsc_RUSER,
      x_rsc_RLAST => x_rsc_RLAST,
      x_rsc_RRESP => hybrid_core_x_rsci_inst_x_rsc_RRESP,
      x_rsc_RDATA => hybrid_core_x_rsci_inst_x_rsc_RDATA,
      x_rsc_RID => x_rsc_RID,
      x_rsc_ARREADY => x_rsc_ARREADY,
      x_rsc_ARVALID => x_rsc_ARVALID,
      x_rsc_ARUSER => x_rsc_ARUSER,
      x_rsc_ARREGION => hybrid_core_x_rsci_inst_x_rsc_ARREGION,
      x_rsc_ARQOS => hybrid_core_x_rsci_inst_x_rsc_ARQOS,
      x_rsc_ARPROT => hybrid_core_x_rsci_inst_x_rsc_ARPROT,
      x_rsc_ARCACHE => hybrid_core_x_rsci_inst_x_rsc_ARCACHE,
      x_rsc_ARLOCK => x_rsc_ARLOCK,
      x_rsc_ARBURST => hybrid_core_x_rsci_inst_x_rsc_ARBURST,
      x_rsc_ARSIZE => hybrid_core_x_rsci_inst_x_rsc_ARSIZE,
      x_rsc_ARLEN => hybrid_core_x_rsci_inst_x_rsc_ARLEN,
      x_rsc_ARADDR => hybrid_core_x_rsci_inst_x_rsc_ARADDR,
      x_rsc_ARID => x_rsc_ARID,
      x_rsc_BREADY => x_rsc_BREADY,
      x_rsc_BVALID => x_rsc_BVALID,
      x_rsc_BUSER => x_rsc_BUSER,
      x_rsc_BRESP => hybrid_core_x_rsci_inst_x_rsc_BRESP,
      x_rsc_BID => x_rsc_BID,
      x_rsc_WREADY => x_rsc_WREADY,
      x_rsc_WVALID => x_rsc_WVALID,
      x_rsc_WUSER => x_rsc_WUSER,
      x_rsc_WLAST => x_rsc_WLAST,
      x_rsc_WSTRB => hybrid_core_x_rsci_inst_x_rsc_WSTRB,
      x_rsc_WDATA => hybrid_core_x_rsci_inst_x_rsc_WDATA,
      x_rsc_AWREADY => x_rsc_AWREADY,
      x_rsc_AWVALID => x_rsc_AWVALID,
      x_rsc_AWUSER => x_rsc_AWUSER,
      x_rsc_AWREGION => hybrid_core_x_rsci_inst_x_rsc_AWREGION,
      x_rsc_AWQOS => hybrid_core_x_rsci_inst_x_rsc_AWQOS,
      x_rsc_AWPROT => hybrid_core_x_rsci_inst_x_rsc_AWPROT,
      x_rsc_AWCACHE => hybrid_core_x_rsci_inst_x_rsc_AWCACHE,
      x_rsc_AWLOCK => x_rsc_AWLOCK,
      x_rsc_AWBURST => hybrid_core_x_rsci_inst_x_rsc_AWBURST,
      x_rsc_AWSIZE => hybrid_core_x_rsci_inst_x_rsc_AWSIZE,
      x_rsc_AWLEN => hybrid_core_x_rsci_inst_x_rsc_AWLEN,
      x_rsc_AWADDR => hybrid_core_x_rsci_inst_x_rsc_AWADDR,
      x_rsc_AWID => x_rsc_AWID,
      core_wen => core_wen,
      x_rsci_oswt => reg_x_rsci_oswt_cse,
      x_rsci_wen_comp => x_rsci_wen_comp,
      x_rsci_oswt_1 => reg_x_rsci_oswt_1_cse,
      x_rsci_wen_comp_1 => x_rsci_wen_comp_1,
      x_rsci_s_raddr_core => hybrid_core_x_rsci_inst_x_rsci_s_raddr_core,
      x_rsci_s_waddr_core => hybrid_core_x_rsci_inst_x_rsci_s_waddr_core,
      x_rsci_s_din_mxwt => hybrid_core_x_rsci_inst_x_rsci_s_din_mxwt,
      x_rsci_s_dout_core => hybrid_core_x_rsci_inst_x_rsci_s_dout_core
    );
  x_rsc_RRESP <= hybrid_core_x_rsci_inst_x_rsc_RRESP;
  x_rsc_RDATA <= hybrid_core_x_rsci_inst_x_rsc_RDATA;
  hybrid_core_x_rsci_inst_x_rsc_ARREGION <= x_rsc_ARREGION;
  hybrid_core_x_rsci_inst_x_rsc_ARQOS <= x_rsc_ARQOS;
  hybrid_core_x_rsci_inst_x_rsc_ARPROT <= x_rsc_ARPROT;
  hybrid_core_x_rsci_inst_x_rsc_ARCACHE <= x_rsc_ARCACHE;
  hybrid_core_x_rsci_inst_x_rsc_ARBURST <= x_rsc_ARBURST;
  hybrid_core_x_rsci_inst_x_rsc_ARSIZE <= x_rsc_ARSIZE;
  hybrid_core_x_rsci_inst_x_rsc_ARLEN <= x_rsc_ARLEN;
  hybrid_core_x_rsci_inst_x_rsc_ARADDR <= x_rsc_ARADDR;
  x_rsc_BRESP <= hybrid_core_x_rsci_inst_x_rsc_BRESP;
  hybrid_core_x_rsci_inst_x_rsc_WSTRB <= x_rsc_WSTRB;
  hybrid_core_x_rsci_inst_x_rsc_WDATA <= x_rsc_WDATA;
  hybrid_core_x_rsci_inst_x_rsc_AWREGION <= x_rsc_AWREGION;
  hybrid_core_x_rsci_inst_x_rsc_AWQOS <= x_rsc_AWQOS;
  hybrid_core_x_rsci_inst_x_rsc_AWPROT <= x_rsc_AWPROT;
  hybrid_core_x_rsci_inst_x_rsc_AWCACHE <= x_rsc_AWCACHE;
  hybrid_core_x_rsci_inst_x_rsc_AWBURST <= x_rsc_AWBURST;
  hybrid_core_x_rsci_inst_x_rsc_AWSIZE <= x_rsc_AWSIZE;
  hybrid_core_x_rsci_inst_x_rsc_AWLEN <= x_rsc_AWLEN;
  hybrid_core_x_rsci_inst_x_rsc_AWADDR <= x_rsc_AWADDR;
  hybrid_core_x_rsci_inst_x_rsci_s_raddr_core <= x_rsci_s_raddr_core_9_5 & x_rsci_s_raddr_core_4_0;
  hybrid_core_x_rsci_inst_x_rsci_s_waddr_core <= x_rsci_s_waddr_core_9_5 & x_rsci_s_waddr_core_4_0;
  x_rsci_s_din_mxwt <= hybrid_core_x_rsci_inst_x_rsci_s_din_mxwt;
  hybrid_core_x_rsci_inst_x_rsci_s_dout_core <= x_rsci_s_dout_core;

  hybrid_core_twiddle_rsci_inst : hybrid_core_twiddle_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsc_s_tdone => twiddle_rsc_s_tdone,
      twiddle_rsc_tr_write_done => twiddle_rsc_tr_write_done,
      twiddle_rsc_RREADY => twiddle_rsc_RREADY,
      twiddle_rsc_RVALID => twiddle_rsc_RVALID,
      twiddle_rsc_RUSER => twiddle_rsc_RUSER,
      twiddle_rsc_RLAST => twiddle_rsc_RLAST,
      twiddle_rsc_RRESP => hybrid_core_twiddle_rsci_inst_twiddle_rsc_RRESP,
      twiddle_rsc_RDATA => hybrid_core_twiddle_rsci_inst_twiddle_rsc_RDATA,
      twiddle_rsc_RID => twiddle_rsc_RID,
      twiddle_rsc_ARREADY => twiddle_rsc_ARREADY,
      twiddle_rsc_ARVALID => twiddle_rsc_ARVALID,
      twiddle_rsc_ARUSER => twiddle_rsc_ARUSER,
      twiddle_rsc_ARREGION => hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARREGION,
      twiddle_rsc_ARQOS => hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARQOS,
      twiddle_rsc_ARPROT => hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARPROT,
      twiddle_rsc_ARCACHE => hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARCACHE,
      twiddle_rsc_ARLOCK => twiddle_rsc_ARLOCK,
      twiddle_rsc_ARBURST => hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARBURST,
      twiddle_rsc_ARSIZE => hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARSIZE,
      twiddle_rsc_ARLEN => hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARLEN,
      twiddle_rsc_ARADDR => hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARADDR,
      twiddle_rsc_ARID => twiddle_rsc_ARID,
      twiddle_rsc_BREADY => twiddle_rsc_BREADY,
      twiddle_rsc_BVALID => twiddle_rsc_BVALID,
      twiddle_rsc_BUSER => twiddle_rsc_BUSER,
      twiddle_rsc_BRESP => hybrid_core_twiddle_rsci_inst_twiddle_rsc_BRESP,
      twiddle_rsc_BID => twiddle_rsc_BID,
      twiddle_rsc_WREADY => twiddle_rsc_WREADY,
      twiddle_rsc_WVALID => twiddle_rsc_WVALID,
      twiddle_rsc_WUSER => twiddle_rsc_WUSER,
      twiddle_rsc_WLAST => twiddle_rsc_WLAST,
      twiddle_rsc_WSTRB => hybrid_core_twiddle_rsci_inst_twiddle_rsc_WSTRB,
      twiddle_rsc_WDATA => hybrid_core_twiddle_rsci_inst_twiddle_rsc_WDATA,
      twiddle_rsc_AWREADY => twiddle_rsc_AWREADY,
      twiddle_rsc_AWVALID => twiddle_rsc_AWVALID,
      twiddle_rsc_AWUSER => twiddle_rsc_AWUSER,
      twiddle_rsc_AWREGION => hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWREGION,
      twiddle_rsc_AWQOS => hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWQOS,
      twiddle_rsc_AWPROT => hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWPROT,
      twiddle_rsc_AWCACHE => hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWCACHE,
      twiddle_rsc_AWLOCK => twiddle_rsc_AWLOCK,
      twiddle_rsc_AWBURST => hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWBURST,
      twiddle_rsc_AWSIZE => hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWSIZE,
      twiddle_rsc_AWLEN => hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWLEN,
      twiddle_rsc_AWADDR => hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWADDR,
      twiddle_rsc_AWID => twiddle_rsc_AWID,
      core_wen => core_wen,
      twiddle_rsci_oswt => reg_twiddle_rsci_oswt_cse,
      twiddle_rsci_wen_comp => twiddle_rsci_wen_comp,
      twiddle_rsci_s_raddr_core => hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core,
      twiddle_rsci_s_din_mxwt => hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_din_mxwt
    );
  twiddle_rsc_RRESP <= hybrid_core_twiddle_rsci_inst_twiddle_rsc_RRESP;
  twiddle_rsc_RDATA <= hybrid_core_twiddle_rsci_inst_twiddle_rsc_RDATA;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARREGION <= twiddle_rsc_ARREGION;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARQOS <= twiddle_rsc_ARQOS;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARPROT <= twiddle_rsc_ARPROT;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARCACHE <= twiddle_rsc_ARCACHE;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARBURST <= twiddle_rsc_ARBURST;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARSIZE <= twiddle_rsc_ARSIZE;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARLEN <= twiddle_rsc_ARLEN;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_ARADDR <= twiddle_rsc_ARADDR;
  twiddle_rsc_BRESP <= hybrid_core_twiddle_rsci_inst_twiddle_rsc_BRESP;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_WSTRB <= twiddle_rsc_WSTRB;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_WDATA <= twiddle_rsc_WDATA;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWREGION <= twiddle_rsc_AWREGION;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWQOS <= twiddle_rsc_AWQOS;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWPROT <= twiddle_rsc_AWPROT;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWCACHE <= twiddle_rsc_AWCACHE;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWBURST <= twiddle_rsc_AWBURST;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWSIZE <= twiddle_rsc_AWSIZE;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWLEN <= twiddle_rsc_AWLEN;
  hybrid_core_twiddle_rsci_inst_twiddle_rsc_AWADDR <= twiddle_rsc_AWADDR;
  hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_raddr_core <= STD_LOGIC_VECTOR'( '0'
      & reg_twiddle_rsci_s_raddr_core_3_cse & reg_twiddle_rsci_s_raddr_core_2_cse
      & reg_twiddle_rsci_s_raddr_core_1_cse & reg_twiddle_rsci_s_raddr_core_0_cse);
  twiddle_rsci_s_din_mxwt <= hybrid_core_twiddle_rsci_inst_twiddle_rsci_s_din_mxwt;

  hybrid_core_twiddle_h_rsci_inst : hybrid_core_twiddle_h_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsc_s_tdone => twiddle_h_rsc_s_tdone,
      twiddle_h_rsc_tr_write_done => twiddle_h_rsc_tr_write_done,
      twiddle_h_rsc_RREADY => twiddle_h_rsc_RREADY,
      twiddle_h_rsc_RVALID => twiddle_h_rsc_RVALID,
      twiddle_h_rsc_RUSER => twiddle_h_rsc_RUSER,
      twiddle_h_rsc_RLAST => twiddle_h_rsc_RLAST,
      twiddle_h_rsc_RRESP => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_RRESP,
      twiddle_h_rsc_RDATA => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_RDATA,
      twiddle_h_rsc_RID => twiddle_h_rsc_RID,
      twiddle_h_rsc_ARREADY => twiddle_h_rsc_ARREADY,
      twiddle_h_rsc_ARVALID => twiddle_h_rsc_ARVALID,
      twiddle_h_rsc_ARUSER => twiddle_h_rsc_ARUSER,
      twiddle_h_rsc_ARREGION => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARREGION,
      twiddle_h_rsc_ARQOS => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARQOS,
      twiddle_h_rsc_ARPROT => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARPROT,
      twiddle_h_rsc_ARCACHE => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARCACHE,
      twiddle_h_rsc_ARLOCK => twiddle_h_rsc_ARLOCK,
      twiddle_h_rsc_ARBURST => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARBURST,
      twiddle_h_rsc_ARSIZE => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARSIZE,
      twiddle_h_rsc_ARLEN => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARLEN,
      twiddle_h_rsc_ARADDR => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARADDR,
      twiddle_h_rsc_ARID => twiddle_h_rsc_ARID,
      twiddle_h_rsc_BREADY => twiddle_h_rsc_BREADY,
      twiddle_h_rsc_BVALID => twiddle_h_rsc_BVALID,
      twiddle_h_rsc_BUSER => twiddle_h_rsc_BUSER,
      twiddle_h_rsc_BRESP => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_BRESP,
      twiddle_h_rsc_BID => twiddle_h_rsc_BID,
      twiddle_h_rsc_WREADY => twiddle_h_rsc_WREADY,
      twiddle_h_rsc_WVALID => twiddle_h_rsc_WVALID,
      twiddle_h_rsc_WUSER => twiddle_h_rsc_WUSER,
      twiddle_h_rsc_WLAST => twiddle_h_rsc_WLAST,
      twiddle_h_rsc_WSTRB => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_WSTRB,
      twiddle_h_rsc_WDATA => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_WDATA,
      twiddle_h_rsc_AWREADY => twiddle_h_rsc_AWREADY,
      twiddle_h_rsc_AWVALID => twiddle_h_rsc_AWVALID,
      twiddle_h_rsc_AWUSER => twiddle_h_rsc_AWUSER,
      twiddle_h_rsc_AWREGION => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWREGION,
      twiddle_h_rsc_AWQOS => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWQOS,
      twiddle_h_rsc_AWPROT => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWPROT,
      twiddle_h_rsc_AWCACHE => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWCACHE,
      twiddle_h_rsc_AWLOCK => twiddle_h_rsc_AWLOCK,
      twiddle_h_rsc_AWBURST => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWBURST,
      twiddle_h_rsc_AWSIZE => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWSIZE,
      twiddle_h_rsc_AWLEN => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWLEN,
      twiddle_h_rsc_AWADDR => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWADDR,
      twiddle_h_rsc_AWID => twiddle_h_rsc_AWID,
      core_wen => core_wen,
      twiddle_h_rsci_oswt => reg_twiddle_rsci_oswt_cse,
      twiddle_h_rsci_wen_comp => twiddle_h_rsci_wen_comp,
      twiddle_h_rsci_s_raddr_core => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core,
      twiddle_h_rsci_s_din_mxwt => hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_din_mxwt
    );
  twiddle_h_rsc_RRESP <= hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_RRESP;
  twiddle_h_rsc_RDATA <= hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_RDATA;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARREGION <= twiddle_h_rsc_ARREGION;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARQOS <= twiddle_h_rsc_ARQOS;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARPROT <= twiddle_h_rsc_ARPROT;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARCACHE <= twiddle_h_rsc_ARCACHE;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARBURST <= twiddle_h_rsc_ARBURST;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARSIZE <= twiddle_h_rsc_ARSIZE;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARLEN <= twiddle_h_rsc_ARLEN;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_ARADDR <= twiddle_h_rsc_ARADDR;
  twiddle_h_rsc_BRESP <= hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_BRESP;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_WSTRB <= twiddle_h_rsc_WSTRB;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_WDATA <= twiddle_h_rsc_WDATA;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWREGION <= twiddle_h_rsc_AWREGION;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWQOS <= twiddle_h_rsc_AWQOS;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWPROT <= twiddle_h_rsc_AWPROT;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWCACHE <= twiddle_h_rsc_AWCACHE;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWBURST <= twiddle_h_rsc_AWBURST;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWSIZE <= twiddle_h_rsc_AWSIZE;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWLEN <= twiddle_h_rsc_AWLEN;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsc_AWADDR <= twiddle_h_rsc_AWADDR;
  hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_raddr_core <= STD_LOGIC_VECTOR'(
      '0' & reg_twiddle_rsci_s_raddr_core_3_cse & reg_twiddle_rsci_s_raddr_core_2_cse
      & reg_twiddle_rsci_s_raddr_core_1_cse & reg_twiddle_rsci_s_raddr_core_0_cse);
  twiddle_h_rsci_s_din_mxwt <= hybrid_core_twiddle_h_rsci_inst_twiddle_h_rsci_s_din_mxwt;

  hybrid_core_revArr_rsci_inst : hybrid_core_revArr_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      revArr_rsc_s_tdone => revArr_rsc_s_tdone,
      revArr_rsc_tr_write_done => revArr_rsc_tr_write_done,
      revArr_rsc_RREADY => revArr_rsc_RREADY,
      revArr_rsc_RVALID => revArr_rsc_RVALID,
      revArr_rsc_RUSER => revArr_rsc_RUSER,
      revArr_rsc_RLAST => revArr_rsc_RLAST,
      revArr_rsc_RRESP => hybrid_core_revArr_rsci_inst_revArr_rsc_RRESP,
      revArr_rsc_RDATA => hybrid_core_revArr_rsci_inst_revArr_rsc_RDATA,
      revArr_rsc_RID => revArr_rsc_RID,
      revArr_rsc_ARREADY => revArr_rsc_ARREADY,
      revArr_rsc_ARVALID => revArr_rsc_ARVALID,
      revArr_rsc_ARUSER => revArr_rsc_ARUSER,
      revArr_rsc_ARREGION => hybrid_core_revArr_rsci_inst_revArr_rsc_ARREGION,
      revArr_rsc_ARQOS => hybrid_core_revArr_rsci_inst_revArr_rsc_ARQOS,
      revArr_rsc_ARPROT => hybrid_core_revArr_rsci_inst_revArr_rsc_ARPROT,
      revArr_rsc_ARCACHE => hybrid_core_revArr_rsci_inst_revArr_rsc_ARCACHE,
      revArr_rsc_ARLOCK => revArr_rsc_ARLOCK,
      revArr_rsc_ARBURST => hybrid_core_revArr_rsci_inst_revArr_rsc_ARBURST,
      revArr_rsc_ARSIZE => hybrid_core_revArr_rsci_inst_revArr_rsc_ARSIZE,
      revArr_rsc_ARLEN => hybrid_core_revArr_rsci_inst_revArr_rsc_ARLEN,
      revArr_rsc_ARADDR => hybrid_core_revArr_rsci_inst_revArr_rsc_ARADDR,
      revArr_rsc_ARID => revArr_rsc_ARID,
      revArr_rsc_BREADY => revArr_rsc_BREADY,
      revArr_rsc_BVALID => revArr_rsc_BVALID,
      revArr_rsc_BUSER => revArr_rsc_BUSER,
      revArr_rsc_BRESP => hybrid_core_revArr_rsci_inst_revArr_rsc_BRESP,
      revArr_rsc_BID => revArr_rsc_BID,
      revArr_rsc_WREADY => revArr_rsc_WREADY,
      revArr_rsc_WVALID => revArr_rsc_WVALID,
      revArr_rsc_WUSER => revArr_rsc_WUSER,
      revArr_rsc_WLAST => revArr_rsc_WLAST,
      revArr_rsc_WSTRB => hybrid_core_revArr_rsci_inst_revArr_rsc_WSTRB,
      revArr_rsc_WDATA => hybrid_core_revArr_rsci_inst_revArr_rsc_WDATA,
      revArr_rsc_AWREADY => revArr_rsc_AWREADY,
      revArr_rsc_AWVALID => revArr_rsc_AWVALID,
      revArr_rsc_AWUSER => revArr_rsc_AWUSER,
      revArr_rsc_AWREGION => hybrid_core_revArr_rsci_inst_revArr_rsc_AWREGION,
      revArr_rsc_AWQOS => hybrid_core_revArr_rsci_inst_revArr_rsc_AWQOS,
      revArr_rsc_AWPROT => hybrid_core_revArr_rsci_inst_revArr_rsc_AWPROT,
      revArr_rsc_AWCACHE => hybrid_core_revArr_rsci_inst_revArr_rsc_AWCACHE,
      revArr_rsc_AWLOCK => revArr_rsc_AWLOCK,
      revArr_rsc_AWBURST => hybrid_core_revArr_rsci_inst_revArr_rsc_AWBURST,
      revArr_rsc_AWSIZE => hybrid_core_revArr_rsci_inst_revArr_rsc_AWSIZE,
      revArr_rsc_AWLEN => hybrid_core_revArr_rsci_inst_revArr_rsc_AWLEN,
      revArr_rsc_AWADDR => hybrid_core_revArr_rsci_inst_revArr_rsc_AWADDR,
      revArr_rsc_AWID => revArr_rsc_AWID,
      core_wen => core_wen,
      revArr_rsci_oswt => reg_revArr_rsci_oswt_cse,
      revArr_rsci_wen_comp => revArr_rsci_wen_comp,
      revArr_rsci_s_raddr_core => hybrid_core_revArr_rsci_inst_revArr_rsci_s_raddr_core,
      revArr_rsci_s_din_mxwt => hybrid_core_revArr_rsci_inst_revArr_rsci_s_din_mxwt
    );
  revArr_rsc_RRESP <= hybrid_core_revArr_rsci_inst_revArr_rsc_RRESP;
  revArr_rsc_RDATA <= hybrid_core_revArr_rsci_inst_revArr_rsc_RDATA;
  hybrid_core_revArr_rsci_inst_revArr_rsc_ARREGION <= revArr_rsc_ARREGION;
  hybrid_core_revArr_rsci_inst_revArr_rsc_ARQOS <= revArr_rsc_ARQOS;
  hybrid_core_revArr_rsci_inst_revArr_rsc_ARPROT <= revArr_rsc_ARPROT;
  hybrid_core_revArr_rsci_inst_revArr_rsc_ARCACHE <= revArr_rsc_ARCACHE;
  hybrid_core_revArr_rsci_inst_revArr_rsc_ARBURST <= revArr_rsc_ARBURST;
  hybrid_core_revArr_rsci_inst_revArr_rsc_ARSIZE <= revArr_rsc_ARSIZE;
  hybrid_core_revArr_rsci_inst_revArr_rsc_ARLEN <= revArr_rsc_ARLEN;
  hybrid_core_revArr_rsci_inst_revArr_rsc_ARADDR <= revArr_rsc_ARADDR;
  revArr_rsc_BRESP <= hybrid_core_revArr_rsci_inst_revArr_rsc_BRESP;
  hybrid_core_revArr_rsci_inst_revArr_rsc_WSTRB <= revArr_rsc_WSTRB;
  hybrid_core_revArr_rsci_inst_revArr_rsc_WDATA <= revArr_rsc_WDATA;
  hybrid_core_revArr_rsci_inst_revArr_rsc_AWREGION <= revArr_rsc_AWREGION;
  hybrid_core_revArr_rsci_inst_revArr_rsc_AWQOS <= revArr_rsc_AWQOS;
  hybrid_core_revArr_rsci_inst_revArr_rsc_AWPROT <= revArr_rsc_AWPROT;
  hybrid_core_revArr_rsci_inst_revArr_rsc_AWCACHE <= revArr_rsc_AWCACHE;
  hybrid_core_revArr_rsci_inst_revArr_rsc_AWBURST <= revArr_rsc_AWBURST;
  hybrid_core_revArr_rsci_inst_revArr_rsc_AWSIZE <= revArr_rsc_AWSIZE;
  hybrid_core_revArr_rsci_inst_revArr_rsc_AWLEN <= revArr_rsc_AWLEN;
  hybrid_core_revArr_rsci_inst_revArr_rsc_AWADDR <= revArr_rsc_AWADDR;
  hybrid_core_revArr_rsci_inst_revArr_rsci_s_raddr_core <= revArr_rsci_s_raddr_core;
  revArr_rsci_s_din_mxwt <= hybrid_core_revArr_rsci_inst_revArr_rsci_s_din_mxwt;

  hybrid_core_tw_rsci_inst : hybrid_core_tw_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      tw_rsc_s_tdone => tw_rsc_s_tdone,
      tw_rsc_tr_write_done => tw_rsc_tr_write_done,
      tw_rsc_RREADY => tw_rsc_RREADY,
      tw_rsc_RVALID => tw_rsc_RVALID,
      tw_rsc_RUSER => tw_rsc_RUSER,
      tw_rsc_RLAST => tw_rsc_RLAST,
      tw_rsc_RRESP => hybrid_core_tw_rsci_inst_tw_rsc_RRESP,
      tw_rsc_RDATA => hybrid_core_tw_rsci_inst_tw_rsc_RDATA,
      tw_rsc_RID => tw_rsc_RID,
      tw_rsc_ARREADY => tw_rsc_ARREADY,
      tw_rsc_ARVALID => tw_rsc_ARVALID,
      tw_rsc_ARUSER => tw_rsc_ARUSER,
      tw_rsc_ARREGION => hybrid_core_tw_rsci_inst_tw_rsc_ARREGION,
      tw_rsc_ARQOS => hybrid_core_tw_rsci_inst_tw_rsc_ARQOS,
      tw_rsc_ARPROT => hybrid_core_tw_rsci_inst_tw_rsc_ARPROT,
      tw_rsc_ARCACHE => hybrid_core_tw_rsci_inst_tw_rsc_ARCACHE,
      tw_rsc_ARLOCK => tw_rsc_ARLOCK,
      tw_rsc_ARBURST => hybrid_core_tw_rsci_inst_tw_rsc_ARBURST,
      tw_rsc_ARSIZE => hybrid_core_tw_rsci_inst_tw_rsc_ARSIZE,
      tw_rsc_ARLEN => hybrid_core_tw_rsci_inst_tw_rsc_ARLEN,
      tw_rsc_ARADDR => hybrid_core_tw_rsci_inst_tw_rsc_ARADDR,
      tw_rsc_ARID => tw_rsc_ARID,
      tw_rsc_BREADY => tw_rsc_BREADY,
      tw_rsc_BVALID => tw_rsc_BVALID,
      tw_rsc_BUSER => tw_rsc_BUSER,
      tw_rsc_BRESP => hybrid_core_tw_rsci_inst_tw_rsc_BRESP,
      tw_rsc_BID => tw_rsc_BID,
      tw_rsc_WREADY => tw_rsc_WREADY,
      tw_rsc_WVALID => tw_rsc_WVALID,
      tw_rsc_WUSER => tw_rsc_WUSER,
      tw_rsc_WLAST => tw_rsc_WLAST,
      tw_rsc_WSTRB => hybrid_core_tw_rsci_inst_tw_rsc_WSTRB,
      tw_rsc_WDATA => hybrid_core_tw_rsci_inst_tw_rsc_WDATA,
      tw_rsc_AWREADY => tw_rsc_AWREADY,
      tw_rsc_AWVALID => tw_rsc_AWVALID,
      tw_rsc_AWUSER => tw_rsc_AWUSER,
      tw_rsc_AWREGION => hybrid_core_tw_rsci_inst_tw_rsc_AWREGION,
      tw_rsc_AWQOS => hybrid_core_tw_rsci_inst_tw_rsc_AWQOS,
      tw_rsc_AWPROT => hybrid_core_tw_rsci_inst_tw_rsc_AWPROT,
      tw_rsc_AWCACHE => hybrid_core_tw_rsci_inst_tw_rsc_AWCACHE,
      tw_rsc_AWLOCK => tw_rsc_AWLOCK,
      tw_rsc_AWBURST => hybrid_core_tw_rsci_inst_tw_rsc_AWBURST,
      tw_rsc_AWSIZE => hybrid_core_tw_rsci_inst_tw_rsc_AWSIZE,
      tw_rsc_AWLEN => hybrid_core_tw_rsci_inst_tw_rsc_AWLEN,
      tw_rsc_AWADDR => hybrid_core_tw_rsci_inst_tw_rsc_AWADDR,
      tw_rsc_AWID => tw_rsc_AWID,
      core_wen => core_wen,
      tw_rsci_oswt => reg_tw_rsci_oswt_cse,
      tw_rsci_wen_comp => tw_rsci_wen_comp,
      tw_rsci_s_raddr_core => hybrid_core_tw_rsci_inst_tw_rsci_s_raddr_core,
      tw_rsci_s_din_mxwt => hybrid_core_tw_rsci_inst_tw_rsci_s_din_mxwt
    );
  tw_rsc_RRESP <= hybrid_core_tw_rsci_inst_tw_rsc_RRESP;
  tw_rsc_RDATA <= hybrid_core_tw_rsci_inst_tw_rsc_RDATA;
  hybrid_core_tw_rsci_inst_tw_rsc_ARREGION <= tw_rsc_ARREGION;
  hybrid_core_tw_rsci_inst_tw_rsc_ARQOS <= tw_rsc_ARQOS;
  hybrid_core_tw_rsci_inst_tw_rsc_ARPROT <= tw_rsc_ARPROT;
  hybrid_core_tw_rsci_inst_tw_rsc_ARCACHE <= tw_rsc_ARCACHE;
  hybrid_core_tw_rsci_inst_tw_rsc_ARBURST <= tw_rsc_ARBURST;
  hybrid_core_tw_rsci_inst_tw_rsc_ARSIZE <= tw_rsc_ARSIZE;
  hybrid_core_tw_rsci_inst_tw_rsc_ARLEN <= tw_rsc_ARLEN;
  hybrid_core_tw_rsci_inst_tw_rsc_ARADDR <= tw_rsc_ARADDR;
  tw_rsc_BRESP <= hybrid_core_tw_rsci_inst_tw_rsc_BRESP;
  hybrid_core_tw_rsci_inst_tw_rsc_WSTRB <= tw_rsc_WSTRB;
  hybrid_core_tw_rsci_inst_tw_rsc_WDATA <= tw_rsc_WDATA;
  hybrid_core_tw_rsci_inst_tw_rsc_AWREGION <= tw_rsc_AWREGION;
  hybrid_core_tw_rsci_inst_tw_rsc_AWQOS <= tw_rsc_AWQOS;
  hybrid_core_tw_rsci_inst_tw_rsc_AWPROT <= tw_rsc_AWPROT;
  hybrid_core_tw_rsci_inst_tw_rsc_AWCACHE <= tw_rsc_AWCACHE;
  hybrid_core_tw_rsci_inst_tw_rsc_AWBURST <= tw_rsc_AWBURST;
  hybrid_core_tw_rsci_inst_tw_rsc_AWSIZE <= tw_rsc_AWSIZE;
  hybrid_core_tw_rsci_inst_tw_rsc_AWLEN <= tw_rsc_AWLEN;
  hybrid_core_tw_rsci_inst_tw_rsc_AWADDR <= tw_rsc_AWADDR;
  hybrid_core_tw_rsci_inst_tw_rsci_s_raddr_core <= reg_tw_rsci_s_raddr_core_cse;
  tw_rsci_s_din_mxwt <= hybrid_core_tw_rsci_inst_tw_rsci_s_din_mxwt;

  hybrid_core_tw_h_rsci_inst : hybrid_core_tw_h_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      tw_h_rsc_s_tdone => tw_h_rsc_s_tdone,
      tw_h_rsc_tr_write_done => tw_h_rsc_tr_write_done,
      tw_h_rsc_RREADY => tw_h_rsc_RREADY,
      tw_h_rsc_RVALID => tw_h_rsc_RVALID,
      tw_h_rsc_RUSER => tw_h_rsc_RUSER,
      tw_h_rsc_RLAST => tw_h_rsc_RLAST,
      tw_h_rsc_RRESP => hybrid_core_tw_h_rsci_inst_tw_h_rsc_RRESP,
      tw_h_rsc_RDATA => hybrid_core_tw_h_rsci_inst_tw_h_rsc_RDATA,
      tw_h_rsc_RID => tw_h_rsc_RID,
      tw_h_rsc_ARREADY => tw_h_rsc_ARREADY,
      tw_h_rsc_ARVALID => tw_h_rsc_ARVALID,
      tw_h_rsc_ARUSER => tw_h_rsc_ARUSER,
      tw_h_rsc_ARREGION => hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARREGION,
      tw_h_rsc_ARQOS => hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARQOS,
      tw_h_rsc_ARPROT => hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARPROT,
      tw_h_rsc_ARCACHE => hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARCACHE,
      tw_h_rsc_ARLOCK => tw_h_rsc_ARLOCK,
      tw_h_rsc_ARBURST => hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARBURST,
      tw_h_rsc_ARSIZE => hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARSIZE,
      tw_h_rsc_ARLEN => hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARLEN,
      tw_h_rsc_ARADDR => hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARADDR,
      tw_h_rsc_ARID => tw_h_rsc_ARID,
      tw_h_rsc_BREADY => tw_h_rsc_BREADY,
      tw_h_rsc_BVALID => tw_h_rsc_BVALID,
      tw_h_rsc_BUSER => tw_h_rsc_BUSER,
      tw_h_rsc_BRESP => hybrid_core_tw_h_rsci_inst_tw_h_rsc_BRESP,
      tw_h_rsc_BID => tw_h_rsc_BID,
      tw_h_rsc_WREADY => tw_h_rsc_WREADY,
      tw_h_rsc_WVALID => tw_h_rsc_WVALID,
      tw_h_rsc_WUSER => tw_h_rsc_WUSER,
      tw_h_rsc_WLAST => tw_h_rsc_WLAST,
      tw_h_rsc_WSTRB => hybrid_core_tw_h_rsci_inst_tw_h_rsc_WSTRB,
      tw_h_rsc_WDATA => hybrid_core_tw_h_rsci_inst_tw_h_rsc_WDATA,
      tw_h_rsc_AWREADY => tw_h_rsc_AWREADY,
      tw_h_rsc_AWVALID => tw_h_rsc_AWVALID,
      tw_h_rsc_AWUSER => tw_h_rsc_AWUSER,
      tw_h_rsc_AWREGION => hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWREGION,
      tw_h_rsc_AWQOS => hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWQOS,
      tw_h_rsc_AWPROT => hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWPROT,
      tw_h_rsc_AWCACHE => hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWCACHE,
      tw_h_rsc_AWLOCK => tw_h_rsc_AWLOCK,
      tw_h_rsc_AWBURST => hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWBURST,
      tw_h_rsc_AWSIZE => hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWSIZE,
      tw_h_rsc_AWLEN => hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWLEN,
      tw_h_rsc_AWADDR => hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWADDR,
      tw_h_rsc_AWID => tw_h_rsc_AWID,
      core_wen => core_wen,
      tw_h_rsci_oswt => reg_tw_rsci_oswt_cse,
      tw_h_rsci_wen_comp => tw_h_rsci_wen_comp,
      tw_h_rsci_s_raddr_core => hybrid_core_tw_h_rsci_inst_tw_h_rsci_s_raddr_core,
      tw_h_rsci_s_din_mxwt => hybrid_core_tw_h_rsci_inst_tw_h_rsci_s_din_mxwt
    );
  tw_h_rsc_RRESP <= hybrid_core_tw_h_rsci_inst_tw_h_rsc_RRESP;
  tw_h_rsc_RDATA <= hybrid_core_tw_h_rsci_inst_tw_h_rsc_RDATA;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARREGION <= tw_h_rsc_ARREGION;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARQOS <= tw_h_rsc_ARQOS;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARPROT <= tw_h_rsc_ARPROT;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARCACHE <= tw_h_rsc_ARCACHE;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARBURST <= tw_h_rsc_ARBURST;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARSIZE <= tw_h_rsc_ARSIZE;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARLEN <= tw_h_rsc_ARLEN;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_ARADDR <= tw_h_rsc_ARADDR;
  tw_h_rsc_BRESP <= hybrid_core_tw_h_rsci_inst_tw_h_rsc_BRESP;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_WSTRB <= tw_h_rsc_WSTRB;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_WDATA <= tw_h_rsc_WDATA;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWREGION <= tw_h_rsc_AWREGION;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWQOS <= tw_h_rsc_AWQOS;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWPROT <= tw_h_rsc_AWPROT;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWCACHE <= tw_h_rsc_AWCACHE;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWBURST <= tw_h_rsc_AWBURST;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWSIZE <= tw_h_rsc_AWSIZE;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWLEN <= tw_h_rsc_AWLEN;
  hybrid_core_tw_h_rsci_inst_tw_h_rsc_AWADDR <= tw_h_rsc_AWADDR;
  hybrid_core_tw_h_rsci_inst_tw_h_rsci_s_raddr_core <= reg_tw_rsci_s_raddr_core_cse;
  tw_h_rsci_s_din_mxwt <= hybrid_core_tw_h_rsci_inst_tw_h_rsci_s_din_mxwt;

  hybrid_core_x_rsc_triosy_obj_inst : hybrid_core_x_rsc_triosy_obj
    PORT MAP(
      x_rsc_triosy_lz => x_rsc_triosy_lz,
      core_wten => core_wten,
      x_rsc_triosy_obj_iswt0 => reg_x_rsc_triosy_obj_iswt0_cse
    );
  hybrid_core_m_rsc_triosy_obj_inst : hybrid_core_m_rsc_triosy_obj
    PORT MAP(
      m_rsc_triosy_lz => m_rsc_triosy_lz,
      core_wten => core_wten,
      m_rsc_triosy_obj_iswt0 => reg_x_rsc_triosy_obj_iswt0_cse
    );
  hybrid_core_twiddle_rsc_triosy_obj_inst : hybrid_core_twiddle_rsc_triosy_obj
    PORT MAP(
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      core_wten => core_wten,
      twiddle_rsc_triosy_obj_iswt0 => reg_x_rsc_triosy_obj_iswt0_cse
    );
  hybrid_core_twiddle_h_rsc_triosy_obj_inst : hybrid_core_twiddle_h_rsc_triosy_obj
    PORT MAP(
      twiddle_h_rsc_triosy_lz => twiddle_h_rsc_triosy_lz,
      core_wten => core_wten,
      twiddle_h_rsc_triosy_obj_iswt0 => reg_x_rsc_triosy_obj_iswt0_cse
    );
  hybrid_core_revArr_rsc_triosy_obj_inst : hybrid_core_revArr_rsc_triosy_obj
    PORT MAP(
      revArr_rsc_triosy_lz => revArr_rsc_triosy_lz,
      core_wten => core_wten,
      revArr_rsc_triosy_obj_iswt0 => reg_x_rsc_triosy_obj_iswt0_cse
    );
  hybrid_core_tw_rsc_triosy_obj_inst : hybrid_core_tw_rsc_triosy_obj
    PORT MAP(
      tw_rsc_triosy_lz => tw_rsc_triosy_lz,
      core_wten => core_wten,
      tw_rsc_triosy_obj_iswt0 => reg_x_rsc_triosy_obj_iswt0_cse
    );
  hybrid_core_tw_h_rsc_triosy_obj_inst : hybrid_core_tw_h_rsc_triosy_obj
    PORT MAP(
      tw_h_rsc_triosy_lz => tw_h_rsc_triosy_lz,
      core_wten => core_wten,
      tw_h_rsc_triosy_obj_iswt0 => reg_x_rsc_triosy_obj_iswt0_cse
    );
  hybrid_core_staller_inst : hybrid_core_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen,
      core_wten => core_wten,
      x_rsci_wen_comp => x_rsci_wen_comp,
      x_rsci_wen_comp_1 => x_rsci_wen_comp_1,
      twiddle_rsci_wen_comp => twiddle_rsci_wen_comp,
      twiddle_h_rsci_wen_comp => twiddle_h_rsci_wen_comp,
      revArr_rsci_wen_comp => revArr_rsci_wen_comp,
      tw_rsci_wen_comp => tw_rsci_wen_comp,
      tw_h_rsci_wen_comp => tw_h_rsci_wen_comp
    );
  hybrid_core_core_fsm_inst : hybrid_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen,
      fsm_output => hybrid_core_core_fsm_inst_fsm_output,
      S1_OUTER_LOOP_for_C_4_tr0 => hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_4_tr0,
      S1_OUTER_LOOP_C_0_tr0 => hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0,
      S2_COPY_LOOP_for_C_3_tr0 => hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0,
      S2_COPY_LOOP_C_0_tr0 => hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0,
      S2_INNER_LOOP1_for_C_24_tr0 => hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_24_tr0,
      S2_INNER_LOOP1_C_0_tr0 => hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0,
      S2_INNER_LOOP2_for_C_23_tr0 => hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_23_tr0,
      S2_INNER_LOOP2_C_0_tr0 => hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0,
      S2_INNER_LOOP2_C_0_tr1 => hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1,
      S2_INNER_LOOP3_for_C_23_tr0 => hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_23_tr0,
      S2_INNER_LOOP3_C_0_tr0 => hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0,
      S34_OUTER_LOOP_for_C_12_tr0 => hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_12_tr0,
      S34_OUTER_LOOP_C_0_tr0 => hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0,
      S5_COPY_LOOP_for_C_3_tr0 => hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0,
      S5_COPY_LOOP_C_0_tr0 => hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0,
      S5_INNER_LOOP1_for_C_24_tr0 => hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_24_tr0,
      S5_INNER_LOOP1_C_0_tr0 => hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0,
      S5_INNER_LOOP2_for_C_23_tr0 => hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_23_tr0,
      S5_INNER_LOOP2_C_0_tr0 => hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0,
      S5_INNER_LOOP2_C_0_tr1 => hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1,
      S5_INNER_LOOP3_for_C_23_tr0 => hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_23_tr0,
      S5_INNER_LOOP3_C_0_tr0 => hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0,
      S6_OUTER_LOOP_for_C_3_tr0 => hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0,
      S6_OUTER_LOOP_C_0_tr0 => hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0
    );
  fsm_output <= hybrid_core_core_fsm_inst_fsm_output;
  hybrid_core_core_fsm_inst_S1_OUTER_LOOP_for_C_4_tr0 <= NOT operator_20_true_1_slc_operator_20_true_1_acc_14_itm;
  hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0 <= S1_OUTER_LOOP_k_5_0_sva_2(5);
  hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0 <= S1_OUTER_LOOP_k_5_0_sva_2(5);
  hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_24_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0 <= z_out_2(2);
  hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0 <= and_dcpl_14;
  hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1 <= NOT (z_out_2(2));
  hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0 <= z_out_2(2);
  hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_12_tr0 <= NOT operator_20_true_8_slc_operator_20_true_8_acc_14_itm;
  hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0 <= S1_OUTER_LOOP_k_5_0_sva_2(5);
  hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0 <= S1_OUTER_LOOP_k_5_0_sva_2(5);
  hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_24_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0 <= z_out_2(2);
  hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0 <= and_dcpl_14;
  hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1 <= NOT (z_out_2(2));
  hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0 <= z_out_2(2);
  hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0 <= NOT operator_20_true_15_slc_operator_20_true_15_acc_14_itm;
  hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0 <= S1_OUTER_LOOP_k_5_0_sva_2(5);

  S34_OUTER_LOOP_for_tf_mul_cmp_b <= S34_OUTER_LOOP_for_k_slc_S34_OUTER_LOOP_for_k_sva_19_5_4_0_1
      & S34_OUTER_LOOP_for_k_sva_4_0;
  or_35_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_107_cse <= (fsm_output(7)) OR (fsm_output(2));
  nand_116_cse <= NOT((fsm_output(5)) AND (fsm_output(1)) AND (NOT (fsm_output(7)))
      AND (fsm_output(2)));
  mux_123_nl <= MUX_s_1_2_2(nor_tmp_27, mux_tmp_106, fsm_output(0));
  mux_124_nl <= MUX_s_1_2_2(not_tmp_90, mux_123_nl, fsm_output(3));
  or_131_nl <= (NOT (fsm_output(0))) OR (fsm_output(4)) OR (fsm_output(5));
  mux_121_nl <= MUX_s_1_2_2(or_131_nl, (fsm_output(4)), fsm_output(2));
  or_130_nl <= (fsm_output(2)) OR (fsm_output(4));
  mux_122_nl <= MUX_s_1_2_2(mux_121_nl, or_130_nl, fsm_output(3));
  mux_125_nl <= MUX_s_1_2_2(mux_124_nl, (NOT mux_122_nl), fsm_output(6));
  and_400_nl <= (fsm_output(0)) AND (fsm_output(4)) AND (fsm_output(5));
  mux_118_nl <= MUX_s_1_2_2(not_tmp_90, and_400_nl, fsm_output(2));
  nor_30_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(0))));
  mux_117_nl <= MUX_s_1_2_2(mux_tmp_106, nor_tmp_27, nor_30_nl);
  mux_119_nl <= MUX_s_1_2_2(mux_118_nl, mux_117_nl, fsm_output(3));
  or_488_nl <= (NOT (fsm_output(2))) OR (fsm_output(0));
  mux_115_nl <= MUX_s_1_2_2((fsm_output(4)), or_tmp_112, or_488_nl);
  and_401_nl <= (fsm_output(2)) AND (fsm_output(4)) AND (fsm_output(5));
  mux_116_nl <= MUX_s_1_2_2((NOT mux_115_nl), and_401_nl, fsm_output(3));
  mux_120_nl <= MUX_s_1_2_2(mux_119_nl, mux_116_nl, fsm_output(6));
  mux_126_nl <= MUX_s_1_2_2(mux_125_nl, mux_120_nl, fsm_output(1));
  nand_114_nl <= NOT((NOT((fsm_output(0)) AND (fsm_output(4)))) AND (fsm_output(5)));
  mux_112_nl <= MUX_s_1_2_2(nand_114_nl, mux_tmp_106, fsm_output(2));
  mux_111_nl <= MUX_s_1_2_2(nor_tmp_27, mux_tmp_106, or_125_cse);
  mux_113_nl <= MUX_s_1_2_2(mux_112_nl, mux_111_nl, fsm_output(3));
  nor_286_nl <= NOT((fsm_output(6)) OR (NOT mux_113_nl));
  mux_109_nl <= MUX_s_1_2_2(mux_tmp_106, nor_tmp_27, and_403_cse);
  mux_107_nl <= MUX_s_1_2_2(or_tmp_112, (NOT mux_tmp_106), fsm_output(0));
  mux_108_nl <= MUX_s_1_2_2(mux_107_nl, or_tmp_112, fsm_output(2));
  mux_110_nl <= MUX_s_1_2_2((NOT mux_109_nl), mux_108_nl, fsm_output(3));
  nor_287_nl <= NOT((fsm_output(6)) OR mux_110_nl);
  mux_114_nl <= MUX_s_1_2_2(nor_286_nl, nor_287_nl, fsm_output(1));
  mux_127_rmff <= MUX_s_1_2_2(mux_126_nl, mux_114_nl, fsm_output(7));
  or_1016_cse <= and_950_cse OR (fsm_output(2));
  mux_182_nl <= MUX_s_1_2_2(or_tmp_188, or_325_cse, fsm_output(1));
  nor_270_nl <= NOT((fsm_output(6)) OR mux_182_nl);
  mux_183_nl <= MUX_s_1_2_2(nor_270_nl, nor_131_cse, fsm_output(4));
  or_201_nl <= (NOT (fsm_output(0))) OR (fsm_output(2)) OR (NOT (fsm_output(7)));
  mux_180_nl <= MUX_s_1_2_2(or_201_nl, or_tmp_188, fsm_output(1));
  nor_272_nl <= NOT((fsm_output(6)) OR (NOT mux_180_nl));
  nor_274_nl <= NOT(and_357_cse OR (fsm_output(7)));
  mux_179_nl <= MUX_s_1_2_2(nor_248_cse, nor_274_nl, fsm_output(6));
  mux_181_nl <= MUX_s_1_2_2(nor_272_nl, mux_179_nl, fsm_output(4));
  mux_184_nl <= MUX_s_1_2_2(mux_183_nl, mux_181_nl, fsm_output(5));
  nor_275_nl <= NOT((fsm_output(6)) OR (fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(2))
      OR (fsm_output(7)));
  or_1014_nl <= (or_442_cse AND (fsm_output(2))) OR (fsm_output(7));
  nor_276_nl <= NOT((fsm_output(0)) OR (fsm_output(7)));
  nor_277_nl <= NOT((fsm_output(2)) OR (fsm_output(7)));
  mux_175_nl <= MUX_s_1_2_2(nor_276_nl, nor_277_nl, fsm_output(1));
  mux_176_nl <= MUX_s_1_2_2(or_1014_nl, mux_175_nl, fsm_output(6));
  mux_177_nl <= MUX_s_1_2_2(nor_275_nl, mux_176_nl, fsm_output(4));
  and_391_nl <= or_1016_cse AND (fsm_output(7));
  or_189_nl <= (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_174_nl <= MUX_s_1_2_2(and_391_nl, or_189_nl, fsm_output(6));
  nor_278_nl <= NOT((fsm_output(4)) OR mux_174_nl);
  mux_178_nl <= MUX_s_1_2_2(mux_177_nl, nor_278_nl, fsm_output(5));
  mux_185_rmff <= MUX_s_1_2_2(mux_184_nl, mux_178_nl, fsm_output(3));
  or_210_cse <= (fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(3)));
  and_200_rmff <= and_dcpl_192 AND CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  mux_232_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), nand_tmp_20, and_385_cse);
  mux_229_nl <= MUX_s_1_2_2(nand_96_cse, (fsm_output(2)), fsm_output(4));
  mux_230_nl <= MUX_s_1_2_2(nand_tmp_20, mux_229_nl, fsm_output(0));
  mux_228_nl <= MUX_s_1_2_2(or_tmp_253, (fsm_output(4)), fsm_output(0));
  mux_231_nl <= MUX_s_1_2_2(mux_230_nl, mux_228_nl, fsm_output(5));
  mux_233_nl <= MUX_s_1_2_2(mux_232_nl, mux_231_nl, fsm_output(3));
  or_267_nl <= (fsm_output(4)) OR (NOT (fsm_output(2)));
  mux_225_nl <= MUX_s_1_2_2(or_267_nl, or_tmp_253, fsm_output(0));
  mux_226_nl <= MUX_s_1_2_2(or_tmp_253, (NOT mux_225_nl), fsm_output(5));
  nor_251_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(2)));
  mux_224_nl <= MUX_s_1_2_2(nor_251_nl, nand_tmp_20, fsm_output(5));
  mux_227_nl <= MUX_s_1_2_2(mux_226_nl, mux_224_nl, fsm_output(3));
  mux_234_nl <= MUX_s_1_2_2(mux_233_nl, mux_227_nl, fsm_output(6));
  mux_220_nl <= MUX_s_1_2_2((NOT (fsm_output(2))), or_35_cse, fsm_output(4));
  mux_221_nl <= MUX_s_1_2_2(mux_220_nl, or_tmp_253, fsm_output(0));
  mux_222_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), mux_221_nl, fsm_output(5));
  mux_219_nl <= MUX_s_1_2_2(or_tmp_253, (fsm_output(4)), fsm_output(5));
  mux_223_nl <= MUX_s_1_2_2(mux_222_nl, mux_219_nl, fsm_output(3));
  or_265_nl <= (fsm_output(6)) OR mux_223_nl;
  mux_235_itm <= MUX_s_1_2_2(mux_234_nl, or_265_nl, fsm_output(7));
  nand_95_cse <= NOT((fsm_output(4)) AND (fsm_output(6)));
  nor_242_cse <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  nand_96_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")));
  or_325_cse <= (NOT (fsm_output(0))) OR (fsm_output(7));
  nor_248_cse <= NOT((fsm_output(7)) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(2)));
  or_335_cse <= (fsm_output(4)) OR (fsm_output(6)) OR (NOT (fsm_output(3)));
  or_392_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  or_401_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_403_cse <= (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_320_cse <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(4));
  or_351_cse <= (fsm_output(7)) OR (fsm_output(2)) OR (fsm_output(5)) OR (NOT (fsm_output(6)));
  or_348_cse <= (NOT (fsm_output(7))) OR (fsm_output(2)) OR (NOT (fsm_output(5)))
      OR (fsm_output(6));
  mux_325_cse <= MUX_s_1_2_2(or_392_cse, or_467_cse, fsm_output(4));
  and_357_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  or_442_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_22_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("100"));
  or_28_cse <= (NOT (fsm_output(5))) OR (fsm_output(7));
  nand_111_cse <= NOT((fsm_output(5)) AND (fsm_output(7)));
  nor_217_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  nor_132_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")));
  nor_213_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(6)));
  mux_349_nl <= MUX_s_1_2_2(nor_132_nl, nor_213_nl, fsm_output(3));
  nor_214_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  mux_350_nl <= MUX_s_1_2_2(mux_349_nl, nor_214_nl, fsm_output(4));
  nor_215_nl <= NOT(and_357_cse OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  nor_216_nl <= NOT(nor_217_cse OR (NOT (fsm_output(2))) OR (fsm_output(7)) OR (NOT
      (fsm_output(6))));
  mux_347_nl <= MUX_s_1_2_2(nor_215_nl, nor_216_nl, fsm_output(3));
  mux_348_nl <= MUX_s_1_2_2(mux_347_nl, nor_131_cse, fsm_output(4));
  mux_351_ssc <= MUX_s_1_2_2(mux_350_nl, mux_348_nl, fsm_output(5));
  or_1011_nl <= (fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(0)) OR (fsm_output(6));
  nor_209_nl <= NOT((fsm_output(0)) OR (fsm_output(6)));
  mux_357_nl <= MUX_s_1_2_2(nor_209_nl, nor_tmp_58, fsm_output(5));
  nand_87_nl <= NOT((S1_OUTER_LOOP_k_5_0_sva_2(5)) AND (fsm_output(2)) AND mux_357_nl);
  mux_358_nl <= MUX_s_1_2_2(or_1011_nl, nand_87_nl, fsm_output(1));
  or_1171_nl <= (fsm_output(4)) OR (fsm_output(7)) OR mux_358_nl;
  nor_210_nl <= NOT((fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(5)) OR (NOT
      nor_tmp_58));
  nor_211_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(2)) OR (NOT (fsm_output(5)))
      OR (fsm_output(0)) OR (fsm_output(6)));
  mux_356_nl <= MUX_s_1_2_2(nor_210_nl, nor_211_nl, fsm_output(7));
  nand_151_nl <= NOT((fsm_output(4)) AND mux_356_nl);
  mux_359_seb <= MUX_s_1_2_2(or_1171_nl, nand_151_nl, fsm_output(3));
  and_953_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_950_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  nor_488_cse <= NOT((NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(7)));
  nor_494_cse <= NOT((fsm_output(4)) OR (NOT (fsm_output(6))) OR (fsm_output(7)));
  nor_487_cse <= NOT((fsm_output(4)) OR (fsm_output(6)) OR (NOT (fsm_output(7))));
  nor_304_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  or_467_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  or_46_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"));
  nor_301_nl <= NOT((fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(7)) OR (fsm_output(5)));
  mux_56_nl <= MUX_s_1_2_2(nor_301_nl, nor_tmp_14, fsm_output(3));
  S1_OUTER_LOOP_k_or_nl <= (mux_56_nl AND (NOT (fsm_output(6))) AND (fsm_output(1))
      AND (fsm_output(2))) OR and_dcpl_25;
  S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl <= MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1(4
      DOWNTO 0)), (S1_OUTER_LOOP_k_5_0_sva_2(4 DOWNTO 0)), S1_OUTER_LOOP_k_or_nl);
  mux_46_nl <= MUX_s_1_2_2((NOT (fsm_output(1))), and_953_cse, fsm_output(0));
  or_1018_nl <= (fsm_output(5)) OR mux_46_nl;
  nand_109_nl <= NOT((fsm_output(5)) AND or_46_cse);
  mux_47_nl <= MUX_s_1_2_2(or_1018_nl, nand_109_nl, fsm_output(6));
  nor_nl <= NOT((fsm_output(4)) OR (fsm_output(7)) OR mux_47_nl);
  nor_303_nl <= NOT(nor_304_cse OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10")));
  mux_44_nl <= MUX_s_1_2_2((fsm_output(2)), (fsm_output(1)), fsm_output(0));
  nor_309_nl <= NOT((fsm_output(6)) OR (NOT((fsm_output(5)) AND mux_44_nl)));
  mux_45_nl <= MUX_s_1_2_2(nor_303_nl, nor_309_nl, fsm_output(7));
  and_435_nl <= (fsm_output(4)) AND mux_45_nl;
  mux_48_nl <= MUX_s_1_2_2(nor_nl, and_435_nl, fsm_output(3));
  S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl <=
      MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl,
      mux_48_nl);
  S2_INNER_LOOP1_for_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(S1_OUTER_LOOP_for_acc_cse_sva),
      5), 6) + SIGNED'( "000001"), 6));
  or_1032_nl <= (fsm_output(0)) OR (NOT (fsm_output(5)));
  mux_379_nl <= MUX_s_1_2_2(or_1031_cse, or_1032_nl, fsm_output(3));
  or_1033_nl <= (NOT (fsm_output(3))) OR (fsm_output(6)) OR (NOT (fsm_output(0)))
      OR (fsm_output(5));
  mux_380_nl <= MUX_s_1_2_2(mux_379_nl, or_1033_nl, fsm_output(2));
  nor_197_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(0))) OR (fsm_output(5)));
  nor_198_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(0)) OR (NOT (fsm_output(5))));
  mux_378_nl <= MUX_s_1_2_2(nor_197_nl, nor_198_nl, fsm_output(3));
  nand_119_nl <= NOT((fsm_output(2)) AND mux_378_nl);
  mux_381_nl <= MUX_s_1_2_2(mux_380_nl, nand_119_nl, fsm_output(1));
  or_1034_nl <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (NOT
      (fsm_output(0))) OR (fsm_output(5));
  or_1035_nl <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (NOT (fsm_output(5)));
  mux_377_nl <= MUX_s_1_2_2(or_1034_nl, or_1035_nl, fsm_output(1));
  mux_382_nl <= MUX_s_1_2_2(mux_381_nl, mux_377_nl, fsm_output(7));
  nor_325_nl <= NOT(mux_382_nl OR (fsm_output(4)));
  S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt <= MUX_v_6_2_2(('0' & S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl),
      STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(S2_INNER_LOOP1_for_acc_nl), 6)), nor_325_nl);
  nand_83_cse <= NOT((fsm_output(5)) AND (fsm_output(1)));
  or_533_cse <= (NOT (fsm_output(0))) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  or_1041_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("010"));
  or_587_cse <= (fsm_output(7)) OR (fsm_output(0)) OR (NOT (fsm_output(6)));
  or_585_cse <= (NOT (fsm_output(7))) OR (NOT (fsm_output(0))) OR (fsm_output(6));
  mux_467_cse <= MUX_s_1_2_2(or_587_cse, or_585_cse, fsm_output(5));
  butterFly_tw_and_1_cse <= (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(2)) AND (S2_INNER_LOOP1_r_4_2_sva_1_0(0));
  nor_462_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(5)) OR (fsm_output(1)) OR
      (fsm_output(7)));
  nor_463_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(1)))
      OR (fsm_output(7)));
  mux_829_cse <= MUX_s_1_2_2(nor_462_nl, nor_463_nl, fsm_output(6));
  nor_131_cse <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01")));
  or_829_cse <= (fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(3))) OR (fsm_output(6));
  or_845_cse <= (NOT (fsm_output(3))) OR (NOT (fsm_output(0))) OR (fsm_output(4))
      OR (NOT (fsm_output(6))) OR (fsm_output(7));
  nor_109_cse <= NOT((fsm_output(3)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(0)))
      OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR (NOT (fsm_output(6))));
  or_889_cse <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(6));
  or_900_cse <= (fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  or_888_cse <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  or_964_cse <= (NOT (fsm_output(4))) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  nand_124_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111")));
  or_81_cse <= (fsm_output(3)) OR (NOT (fsm_output(7))) OR (fsm_output(6)) OR (fsm_output(4));
  or_125_cse <= (fsm_output(2)) OR (fsm_output(0));
  and_403_cse <= (fsm_output(2)) AND (fsm_output(0));
  and_425_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"));
  and_385_cse <= (fsm_output(5)) AND (fsm_output(0));
  S1_OUTER_LOOP_k_5_0_sva_2 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg),
      5), 6) + SIGNED'( "000001"), 6));
  modulo_add_3_mux_itm_mx0w1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_base_1_sva)
      - UNSIGNED(m_sva), 32));
  modulo_add_base_3_sva_mx0w1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva)
      + UNSIGNED(reg_mult_3_res_lpi_4_dfm_cse), 32));
  modulo_add_base_sva_mx0w2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva)
      + UNSIGNED(reg_mult_res_lpi_4_dfm_cse), 32));
  modulo_add_base_1_sva_mx0w3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva)
      + UNSIGNED(reg_mult_1_res_lpi_4_dfm_cse), 32));
  modulo_add_base_2_sva_mx0w4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva)
      + UNSIGNED(reg_mult_2_res_lpi_4_dfm_cse), 32));
  modulo_add_base_7_sva_mx0w5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva)
      + UNSIGNED(reg_mult_res_lpi_4_dfm_cse), 32));
  modulo_add_base_4_sva_mx0w6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva)
      + UNSIGNED(reg_mult_1_res_lpi_4_dfm_cse), 32));
  modulo_add_base_5_sva_mx0w7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva)
      + UNSIGNED(reg_mult_2_res_lpi_4_dfm_cse), 32));
  modulo_add_base_6_sva_mx0w8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva)
      + UNSIGNED(reg_mult_3_res_lpi_4_dfm_cse), 32));
  modulo_add_base_11_sva_mx0w9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva)
      + UNSIGNED(reg_mult_2_res_lpi_4_dfm_cse), 32));
  modulo_add_base_8_sva_mx0w10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva)
      + UNSIGNED(reg_mult_3_res_lpi_4_dfm_cse), 32));
  modulo_add_base_9_sva_mx0w11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva)
      + UNSIGNED(reg_mult_res_lpi_4_dfm_cse), 32));
  modulo_add_base_10_sva_mx0w12 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva)
      + UNSIGNED(reg_mult_1_res_lpi_4_dfm_cse), 32));
  modulo_add_base_15_sva_mx0w13 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva)
      + UNSIGNED(reg_mult_res_lpi_4_dfm_cse), 32));
  modulo_add_base_12_sva_mx0w14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva)
      + UNSIGNED(reg_mult_1_res_lpi_4_dfm_cse), 32));
  modulo_add_base_13_sva_mx0w15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva)
      + UNSIGNED(reg_mult_2_res_lpi_4_dfm_cse), 32));
  modulo_add_base_14_sva_mx0w16 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva)
      + UNSIGNED(reg_mult_3_res_lpi_4_dfm_cse), 32));
  modulo_add_base_19_sva_mx0w17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva)
      + UNSIGNED(reg_mult_res_lpi_4_dfm_cse), 32));
  modulo_add_base_16_sva_mx0w18 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva)
      + UNSIGNED(reg_mult_1_res_lpi_4_dfm_cse), 32));
  modulo_add_base_17_sva_mx0w19 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva)
      + UNSIGNED(reg_mult_2_res_lpi_4_dfm_cse), 32));
  modulo_add_base_18_sva_mx0w20 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva)
      + UNSIGNED(reg_mult_3_res_lpi_4_dfm_cse), 32));
  modulo_add_base_23_sva_mx0w21 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva)
      + UNSIGNED(reg_mult_res_lpi_4_dfm_cse), 32));
  modulo_add_base_20_sva_mx0w22 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva)
      + UNSIGNED(reg_mult_1_res_lpi_4_dfm_cse), 32));
  modulo_add_base_21_sva_mx0w23 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva)
      + UNSIGNED(reg_mult_2_res_lpi_4_dfm_cse), 32));
  modulo_add_base_22_sva_mx0w24 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva)
      + UNSIGNED(reg_mult_3_res_lpi_4_dfm_cse), 32));
  operator_20_true_1_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_2(19 DOWNTO
      5)) + SIGNED'( "111111111111111"), 15));
  operator_20_true_1_acc_1_itm_14 <= operator_20_true_1_acc_1_nl(14);
  mux_tmp_19 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(5));
  and_422_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_14 <= (z_out_2(2)) AND S2_OUTER_LOOP_c_1_sva;
  nor_tmp_9 <= (fsm_output(7)) AND (fsm_output(5));
  mux_tmp_37 <= MUX_s_1_2_2(nor_tmp_9, (fsm_output(7)), fsm_output(6));
  or_tmp_29 <= (fsm_output(7)) OR (fsm_output(5));
  or_tmp_52 <= (fsm_output(3)) OR (NOT (fsm_output(0))) OR (fsm_output(4)) OR (fsm_output(6))
      OR (fsm_output(7)) OR (fsm_output(5));
  nor_tmp_14 <= (fsm_output(0)) AND (fsm_output(4)) AND (fsm_output(7)) AND (fsm_output(5));
  and_dcpl_20 <= (fsm_output(0)) AND (NOT (fsm_output(3)));
  and_dcpl_21 <= and_dcpl_20 AND and_953_cse;
  and_dcpl_22 <= (fsm_output(6)) AND (NOT (fsm_output(4)));
  and_dcpl_23 <= (fsm_output(5)) AND (NOT (fsm_output(7)));
  and_dcpl_24 <= and_dcpl_23 AND and_dcpl_22;
  and_dcpl_25 <= and_dcpl_24 AND and_dcpl_21;
  and_dcpl_27 <= NOT((fsm_output(6)) OR (fsm_output(4)));
  and_dcpl_31 <= (fsm_output(3)) AND (NOT (fsm_output(1)));
  and_dcpl_33 <= (NOT (fsm_output(6))) AND (fsm_output(4));
  and_dcpl_34 <= nor_tmp_9 AND and_dcpl_33;
  and_dcpl_36 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_37 <= NOT((fsm_output(0)) OR (fsm_output(3)));
  and_dcpl_38 <= and_dcpl_37 AND and_dcpl_36;
  and_dcpl_39 <= (NOT or_tmp_29) AND and_dcpl_27;
  and_dcpl_40 <= and_dcpl_39 AND and_dcpl_38;
  and_dcpl_41 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_42 <= (fsm_output(0)) AND (fsm_output(3));
  and_dcpl_43 <= and_dcpl_42 AND and_dcpl_41;
  and_dcpl_44 <= and_dcpl_34 AND and_dcpl_43;
  mux_tmp_57 <= MUX_s_1_2_2((NOT (fsm_output(2))), (fsm_output(2)), or_442_cse);
  mux_tmp_66 <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(6));
  mux_tmp_70 <= MUX_s_1_2_2(or_900_cse, or_403_cse, fsm_output(3));
  and_dcpl_48 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("01")) AND
      nor_304_cse;
  or_tmp_77 <= (NOT (fsm_output(7))) OR (fsm_output(5));
  or_tmp_82 <= (fsm_output(6)) OR (NOT nor_tmp_9);
  mux_tmp_79 <= MUX_s_1_2_2((NOT nor_tmp_9), or_tmp_29, fsm_output(6));
  mux_tmp_80 <= MUX_s_1_2_2(mux_tmp_79, or_tmp_82, fsm_output(0));
  or_tmp_83 <= (NOT (fsm_output(0))) OR (NOT (fsm_output(6))) OR (fsm_output(7))
      OR (fsm_output(5));
  or_97_nl <= (fsm_output(3)) OR (NOT((fsm_output(4)) AND mux_tmp_66));
  or_96_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (NOT(CONV_SL_1_1(fsm_output(6
      DOWNTO 4)=STD_LOGIC_VECTOR'("111"))));
  mux_82_nl <= MUX_s_1_2_2(or_97_nl, or_96_nl, fsm_output(1));
  nor_379_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000")));
  nor_380_nl <= NOT((fsm_output(4)) OR (NOT mux_tmp_66));
  mux_67_nl <= MUX_s_1_2_2(nor_379_nl, nor_380_nl, fsm_output(0));
  nand_9_nl <= NOT((fsm_output(1)) AND (fsm_output(3)) AND mux_67_nl);
  mux_83_nl <= MUX_s_1_2_2(mux_82_nl, nand_9_nl, fsm_output(2));
  and_dcpl_57 <= NOT(mux_83_nl OR (fsm_output(7)));
  and_dcpl_58 <= and_dcpl_27 AND (fsm_output(3));
  or_tmp_87 <= (fsm_output(1)) OR (fsm_output(0)) OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_tmp_84 <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(7));
  mux_87_nl <= MUX_s_1_2_2(or_tmp_83, mux_tmp_79, fsm_output(1));
  or_99_nl <= (fsm_output(1)) OR mux_tmp_80;
  mux_88_nl <= MUX_s_1_2_2(mux_87_nl, or_99_nl, fsm_output(2));
  and_dcpl_60 <= (NOT mux_88_nl) AND nor_242_cse;
  and_dcpl_66 <= NOT((fsm_output(7)) OR (fsm_output(4)));
  and_dcpl_68 <= and_dcpl_42 AND and_dcpl_36;
  and_dcpl_69 <= (fsm_output(6)) AND (fsm_output(4));
  and_dcpl_70 <= (NOT or_tmp_29) AND and_dcpl_69;
  and_dcpl_71 <= and_dcpl_70 AND and_dcpl_68;
  or_tmp_112 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_106 <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(4));
  nor_tmp_27 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  not_tmp_90 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")));
  and_dcpl_72 <= and_dcpl_42 AND nor_304_cse;
  and_dcpl_73 <= and_dcpl_39 AND and_dcpl_72;
  and_dcpl_74 <= and_dcpl_23 AND and_dcpl_33;
  and_dcpl_75 <= and_dcpl_74 AND and_dcpl_21;
  and_dcpl_76 <= (NOT (fsm_output(0))) AND (fsm_output(3));
  and_dcpl_77 <= and_dcpl_76 AND nor_304_cse;
  and_dcpl_78 <= and_dcpl_74 AND and_dcpl_77;
  not_tmp_95 <= NOT((fsm_output(4)) AND (fsm_output(7)) AND (fsm_output(5)));
  or_tmp_122 <= (fsm_output(3)) OR (fsm_output(0)) OR not_tmp_95;
  or_tmp_124 <= (fsm_output(0)) OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR (NOT
      (fsm_output(5)));
  or_tmp_127 <= NOT((fsm_output(0)) AND (fsm_output(4)) AND (NOT (fsm_output(7)))
      AND (fsm_output(5)));
  or_tmp_130 <= (NOT (fsm_output(3))) OR (fsm_output(0)) OR (NOT (fsm_output(4)))
      OR (fsm_output(7)) OR (NOT (fsm_output(5)));
  or_142_nl <= (fsm_output(3)) OR (NOT (fsm_output(0))) OR (fsm_output(4)) OR (NOT
      (fsm_output(7))) OR (fsm_output(5));
  mux_tmp_135 <= MUX_s_1_2_2(or_142_nl, or_tmp_130, fsm_output(1));
  or_144_nl <= (fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(0)) OR not_tmp_95;
  mux_136_nl <= MUX_s_1_2_2(or_144_nl, mux_tmp_135, fsm_output(2));
  and_dcpl_82 <= NOT(mux_136_nl OR (fsm_output(6)));
  and_dcpl_83 <= and_dcpl_37 AND and_dcpl_41;
  and_dcpl_84 <= and_dcpl_24 AND and_dcpl_83;
  and_dcpl_85 <= and_dcpl_20 AND and_dcpl_41;
  and_dcpl_86 <= and_dcpl_24 AND and_dcpl_85;
  and_dcpl_87 <= and_dcpl_76 AND and_953_cse;
  and_dcpl_88 <= and_dcpl_23 AND and_dcpl_69;
  and_dcpl_89 <= and_dcpl_88 AND and_dcpl_87;
  and_dcpl_90 <= and_dcpl_42 AND and_953_cse;
  and_dcpl_91 <= and_dcpl_88 AND and_dcpl_90;
  and_dcpl_92 <= (NOT or_tmp_77) AND and_dcpl_27;
  and_dcpl_95 <= and_dcpl_20 AND nor_304_cse;
  and_dcpl_96 <= and_dcpl_34 AND and_dcpl_95;
  and_dcpl_97 <= and_dcpl_34 AND and_dcpl_38;
  and_dcpl_101 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  mux_tmp_137 <= MUX_s_1_2_2(or_467_cse, or_392_cse, fsm_output(3));
  mux_138_itm <= MUX_s_1_2_2(mux_tmp_137, or_210_cse, fsm_output(2));
  and_dcpl_110 <= NOT((fsm_output(5)) OR (fsm_output(0)));
  and_dcpl_111 <= and_dcpl_110 AND (NOT (fsm_output(1)));
  or_tmp_140 <= (fsm_output(3)) OR (NOT (fsm_output(4))) OR (fsm_output(6)) OR (fsm_output(7));
  mux_140_itm <= MUX_s_1_2_2(or_tmp_140, mux_tmp_70, fsm_output(2));
  and_dcpl_113 <= (NOT (fsm_output(5))) AND (fsm_output(0));
  and_dcpl_122 <= and_dcpl_34 AND and_dcpl_68;
  and_dcpl_123 <= and_dcpl_76 AND and_dcpl_41;
  or_163_nl <= (fsm_output(0)) OR (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_tmp_147 <= MUX_s_1_2_2(or_163_nl, or_tmp_127, fsm_output(3));
  or_162_nl <= (fsm_output(3)) OR (NOT nor_tmp_14);
  mux_148_itm <= MUX_s_1_2_2(mux_tmp_147, or_162_nl, fsm_output(1));
  or_183_nl <= (fsm_output(7)) OR mux_320_cse;
  mux_tmp_164 <= MUX_s_1_2_2(or_183_nl, or_403_cse, fsm_output(3));
  or_179_cse <= (fsm_output(4)) OR (fsm_output(6));
  mux_162_nl <= MUX_s_1_2_2(or_900_cse, or_179_cse, fsm_output(3));
  mux_tmp_165 <= MUX_s_1_2_2(mux_tmp_164, mux_162_nl, fsm_output(2));
  or_tmp_173 <= (fsm_output(5)) OR mux_tmp_165;
  or_tmp_188 <= (NOT (fsm_output(2))) OR (fsm_output(7));
  or_tmp_197 <= (NOT (fsm_output(0))) OR (fsm_output(6)) OR (fsm_output(5));
  and_dcpl_136 <= (NOT or_tmp_29) AND and_dcpl_33;
  and_dcpl_137 <= and_dcpl_136 AND and_dcpl_43;
  and_dcpl_138 <= and_dcpl_136 AND and_dcpl_87;
  or_832_nl <= (fsm_output(3)) OR (NOT (fsm_output(6)));
  or_211_nl <= (fsm_output(6)) OR (NOT (fsm_output(3)));
  mux_tmp_188 <= MUX_s_1_2_2(or_832_nl, or_211_nl, fsm_output(7));
  and_dcpl_139 <= and_dcpl_23 AND and_dcpl_27;
  and_dcpl_141 <= and_dcpl_20 AND and_dcpl_36;
  or_216_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(6)))
      OR (fsm_output(7)) OR (fsm_output(5));
  or_215_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(4))) OR (fsm_output(6))
      OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_tmp_192 <= MUX_s_1_2_2(or_216_nl, or_215_nl, fsm_output(3));
  or_218_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(6))
      OR (fsm_output(7)) OR (NOT (fsm_output(5)));
  mux_193_itm <= MUX_s_1_2_2(or_218_nl, mux_tmp_192, fsm_output(1));
  and_dcpl_143 <= (NOT mux_193_itm) AND (fsm_output(2));
  and_dcpl_144 <= and_dcpl_37 AND nor_304_cse;
  and_dcpl_145 <= and_dcpl_70 AND and_dcpl_144;
  and_dcpl_146 <= and_dcpl_70 AND and_dcpl_95;
  and_dcpl_148 <= and_dcpl_37 AND and_953_cse;
  and_dcpl_150 <= (NOT or_tmp_77) AND and_dcpl_33;
  and_dcpl_151 <= and_dcpl_150 AND and_dcpl_77;
  and_dcpl_152 <= and_dcpl_150 AND and_dcpl_72;
  and_dcpl_156 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  or_773_nl <= (fsm_output(3)) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_719_nl <= MUX_s_1_2_2(or_210_cse, or_773_nl, fsm_output(1));
  nand_123_nl <= NOT((fsm_output(3)) AND (fsm_output(1)) AND (NOT (fsm_output(7)))
      AND (fsm_output(6)));
  mux_195_itm <= MUX_s_1_2_2(mux_719_nl, nand_123_nl, fsm_output(2));
  and_dcpl_161 <= (fsm_output(5)) AND (NOT (fsm_output(0)));
  or_784_nl <= (NOT (fsm_output(4))) OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT
      (fsm_output(6)));
  mux_tmp_196 <= MUX_s_1_2_2(or_784_nl, or_829_cse, fsm_output(1));
  or_223_nl <= (fsm_output(1)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(6))
      OR (NOT (fsm_output(7)));
  mux_197_itm <= MUX_s_1_2_2(mux_tmp_196, or_223_nl, fsm_output(2));
  and_dcpl_162 <= (NOT mux_197_itm) AND and_dcpl_161;
  and_dcpl_164 <= (NOT mux_197_itm) AND and_385_cse;
  or_669_nl <= (NOT (fsm_output(4))) OR (fsm_output(3)) OR (NOT (fsm_output(1)))
      OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_198_nl <= MUX_s_1_2_2(or_829_cse, or_81_cse, fsm_output(1));
  mux_199_itm <= MUX_s_1_2_2(or_669_nl, mux_198_nl, fsm_output(2));
  and_dcpl_166 <= (NOT mux_199_itm) AND and_385_cse;
  or_657_nl <= (fsm_output(4)) OR (NOT (fsm_output(3))) OR (fsm_output(1)) OR (NOT
      (fsm_output(7))) OR (fsm_output(6));
  mux_200_itm <= MUX_s_1_2_2(or_657_nl, mux_tmp_196, fsm_output(2));
  and_dcpl_167 <= (NOT mux_200_itm) AND and_dcpl_161;
  and_dcpl_168 <= (NOT mux_200_itm) AND and_385_cse;
  and_dcpl_169 <= and_dcpl_76 AND and_dcpl_36;
  and_dcpl_173 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  or_tmp_220 <= (NOT (fsm_output(3))) OR (NOT (fsm_output(0))) OR (fsm_output(6))
      OR (fsm_output(7));
  or_tmp_222 <= (fsm_output(0)) OR (fsm_output(6)) OR (NOT (fsm_output(7)));
  mux_tmp_201 <= MUX_s_1_2_2(or_587_cse, or_tmp_222, fsm_output(3));
  mux_202_itm <= MUX_s_1_2_2(mux_tmp_201, or_tmp_220, fsm_output(2));
  nor_262_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(0))) OR (fsm_output(4)) OR
      (fsm_output(6)) OR (fsm_output(7)) OR (NOT (fsm_output(5))));
  nor_263_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(6)))
      OR (fsm_output(7)) OR (fsm_output(5)));
  nor_264_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(4))) OR (fsm_output(6)) OR
      (NOT (fsm_output(7))) OR (fsm_output(5)));
  mux_205_nl <= MUX_s_1_2_2(nor_263_nl, nor_264_nl, fsm_output(3));
  not_tmp_135 <= MUX_s_1_2_2(nor_262_nl, mux_205_nl, fsm_output(2));
  or_tmp_236 <= (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(7));
  mux_tmp_208 <= MUX_s_1_2_2((fsm_output(7)), or_tmp_236, fsm_output(2));
  and_tmp_6 <= (fsm_output(7)) AND or_35_cse;
  and_dcpl_184 <= (fsm_output(3)) AND (fsm_output(1));
  and_dcpl_186 <= (fsm_output(4)) AND (fsm_output(0));
  and_dcpl_187 <= nor_tmp_9 AND (NOT (fsm_output(6)));
  and_dcpl_188 <= and_dcpl_187 AND and_dcpl_186;
  and_dcpl_192 <= (NOT or_tmp_29) AND (fsm_output(6));
  and_dcpl_194 <= and_dcpl_70 AND and_dcpl_43;
  and_dcpl_195 <= and_dcpl_70 AND and_dcpl_72;
  or_tmp_253 <= (fsm_output(4)) OR (NOT or_35_cse);
  nand_tmp_20 <= NOT((fsm_output(4)) AND nand_96_cse);
  not_tmp_150 <= NOT((fsm_output(2)) AND (fsm_output(5)));
  or_tmp_264 <= (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(5));
  or_tmp_275 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_295 <= (fsm_output(1)) OR (NOT (fsm_output(4))) OR (fsm_output(6));
  or_307_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(4))) OR (fsm_output(6));
  mux_tmp_263 <= MUX_s_1_2_2(or_307_nl, or_tmp_295, fsm_output(2));
  or_tmp_301 <= (fsm_output(1)) OR (fsm_output(4)) OR (NOT (fsm_output(6)));
  or_318_nl <= (NOT (fsm_output(7))) OR (fsm_output(6)) OR (NOT (fsm_output(2)));
  or_316_nl <= (NOT (fsm_output(7))) OR (fsm_output(6)) OR (fsm_output(2));
  mux_tmp_273 <= MUX_s_1_2_2(or_318_nl, or_316_nl, fsm_output(1));
  not_tmp_173 <= NOT((fsm_output(0)) AND (fsm_output(7)));
  or_tmp_334 <= (fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(6));
  or_tmp_349 <= (fsm_output(5)) OR (fsm_output(7)) OR (fsm_output(3)) OR (NOT (fsm_output(4)));
  or_tmp_352 <= (NOT (fsm_output(7))) OR (NOT (fsm_output(3))) OR (fsm_output(4));
  not_tmp_188 <= NOT((fsm_output(1)) AND (fsm_output(2)) AND (fsm_output(6)));
  or_tmp_369 <= (fsm_output(6)) OR (NOT (fsm_output(2)));
  mux_tmp_327 <= MUX_s_1_2_2(or_889_cse, or_888_cse, fsm_output(3));
  or_395_nl <= (NOT (fsm_output(3))) OR (fsm_output(4)) OR (NOT (fsm_output(7)))
      OR (fsm_output(6));
  mux_tmp_328 <= MUX_s_1_2_2(mux_tmp_327, or_395_nl, fsm_output(2));
  mux_tmp_330 <= MUX_s_1_2_2(or_964_cse, or_900_cse, fsm_output(3));
  nor_tmp_58 <= (fsm_output(0)) AND (fsm_output(6));
  or_tmp_465 <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT nor_tmp_9);
  or_tmp_466 <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0101"));
  nor_tmp_65 <= (fsm_output(1)) AND (fsm_output(7)) AND (fsm_output(3)) AND (fsm_output(4));
  nor_192_nl <= NOT((fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(4)));
  mux_tmp_403 <= MUX_s_1_2_2(nor_192_nl, nor_tmp_65, fsm_output(5));
  or_dcpl_15 <= or_tmp_29 OR or_179_cse;
  or_tmp_503 <= (NOT (fsm_output(7))) OR (NOT (fsm_output(5))) OR (fsm_output(2));
  and_dcpl_210 <= (NOT (fsm_output(3))) AND (fsm_output(1));
  or_572_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(0))) OR (fsm_output(6))
      OR (fsm_output(5));
  or_571_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      and_425_cse);
  mux_tmp_462 <= MUX_s_1_2_2(or_572_nl, or_571_nl, fsm_output(2));
  and_dcpl_216 <= (NOT or_tmp_29) AND and_dcpl_22;
  or_tmp_619 <= (NOT (fsm_output(3))) OR (NOT (fsm_output(0))) OR (fsm_output(4))
      OR (fsm_output(6)) OR (NOT (fsm_output(7)));
  or_tmp_622 <= (fsm_output(3)) OR (fsm_output(0)) OR (NOT (fsm_output(4))) OR (fsm_output(6))
      OR (fsm_output(7));
  or_tmp_624 <= (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(4));
  or_tmp_627 <= (NOT (fsm_output(5))) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(7)))
      OR (fsm_output(6)) OR (fsm_output(4));
  or_tmp_728 <= (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(1));
  nand_72_cse <= NOT((fsm_output(1)) AND (fsm_output(6)));
  or_tmp_765 <= (NOT (fsm_output(2))) OR (fsm_output(4)) OR (NOT (fsm_output(3)))
      OR (fsm_output(1)) OR (fsm_output(6));
  or_tmp_773 <= (fsm_output(7)) OR nand_72_cse;
  or_tmp_811 <= (fsm_output(3)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(4)))
      OR (fsm_output(6)) OR (fsm_output(7));
  or_tmp_847 <= (fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(2)) OR (fsm_output(1))
      OR (NOT (fsm_output(3)));
  or_tmp_868 <= CONV_SL_1_1(fsm_output(7 DOWNTO 3)/=STD_LOGIC_VECTOR'("00110"));
  or_tmp_871 <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0100"));
  or_tmp_872 <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0001"));
  or_tmp_873 <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("1001"));
  and_dcpl_253 <= (fsm_output(4)) AND (NOT (fsm_output(0)));
  and_dcpl_254 <= NOT(or_tmp_29 OR (fsm_output(6)));
  and_dcpl_255 <= and_dcpl_254 AND and_dcpl_253;
  and_dcpl_262 <= and_dcpl_254 AND and_dcpl_186;
  and_dcpl_270 <= and_dcpl_23 AND (NOT (fsm_output(6)));
  and_dcpl_271 <= and_dcpl_270 AND and_dcpl_253;
  and_dcpl_278 <= and_dcpl_270 AND and_dcpl_186;
  and_dcpl_284 <= NOT((fsm_output(3)) OR (fsm_output(1)));
  and_dcpl_286 <= and_dcpl_192 AND and_dcpl_186;
  and_dcpl_293 <= and_dcpl_192 AND and_dcpl_253;
  and_dcpl_301 <= and_dcpl_23 AND (fsm_output(6)) AND and_dcpl_186;
  and_dcpl_309 <= NOT(or_tmp_77 OR (fsm_output(6)));
  and_dcpl_310 <= and_dcpl_309 AND (NOT (fsm_output(4))) AND (NOT (fsm_output(0)));
  and_dcpl_317 <= and_dcpl_309 AND and_dcpl_186;
  and_dcpl_324 <= and_dcpl_309 AND and_dcpl_253;
  and_dcpl_331 <= and_dcpl_187 AND and_dcpl_253;
  xx_rsci_radr_d_mx0c0 <= (NOT mux_138_itm) AND and_dcpl_101 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  xx_rsci_radr_d_mx0c1 <= (NOT mux_138_itm) AND and_dcpl_101 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  xx_rsci_radr_d_mx0c2 <= (NOT mux_138_itm) AND and_dcpl_101 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  xx_rsci_radr_d_mx0c3 <= (NOT mux_140_itm) AND and_dcpl_111;
  xx_rsci_radr_d_mx0c4 <= (NOT mux_140_itm) AND and_dcpl_113 AND (NOT (fsm_output(1)));
  xx_rsci_radr_d_mx0c5 <= (NOT mux_140_itm) AND and_dcpl_110 AND (fsm_output(1));
  xx_rsci_radr_d_mx0c6 <= (NOT mux_140_itm) AND and_dcpl_113 AND (fsm_output(1));
  mux_142_nl <= MUX_s_1_2_2(mux_tmp_330, or_tmp_140, fsm_output(2));
  xx_rsci_radr_d_mx0c7 <= (NOT mux_142_nl) AND and_dcpl_111;
  xx_rsci_radr_d_mx0c8 <= and_dcpl_24 AND and_dcpl_77;
  xx_rsci_radr_d_mx0c10 <= and_dcpl_34 AND and_dcpl_123;
  nor_285_nl <= NOT((fsm_output(1)) OR (fsm_output(3)) OR (NOT (fsm_output(0))) OR
      (fsm_output(6)) OR (NOT (fsm_output(7))));
  or_155_nl <= (NOT (fsm_output(0))) OR (fsm_output(6)) OR (fsm_output(7));
  mux_143_nl <= MUX_s_1_2_2(or_155_nl, or_587_cse, fsm_output(3));
  and_399_nl <= (fsm_output(1)) AND (NOT mux_143_nl);
  mux_144_nl <= MUX_s_1_2_2(nor_285_nl, and_399_nl, fsm_output(2));
  xx_rsci_wadr_d_mx0c1 <= mux_144_nl AND nor_tmp_27;
  nor_283_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(0)) OR (fsm_output(6)) OR
      (fsm_output(7)));
  nor_284_nl <= NOT((fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(6)) OR (NOT
      (fsm_output(7))));
  mux_145_nl <= MUX_s_1_2_2(nor_283_nl, nor_284_nl, fsm_output(1));
  and_398_nl <= (fsm_output(1)) AND (fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(6))
      AND (NOT (fsm_output(7)));
  mux_146_nl <= MUX_s_1_2_2(mux_145_nl, and_398_nl, fsm_output(2));
  xx_rsci_wadr_d_mx0c2 <= mux_146_nl AND nor_tmp_27;
  xx_rsci_wadr_d_mx0c3 <= NOT(mux_148_itm OR (fsm_output(6)) OR (fsm_output(2)));
  or_165_nl <= (fsm_output(1)) OR (fsm_output(3)) OR (fsm_output(0)) OR not_tmp_95;
  mux_149_nl <= MUX_s_1_2_2(mux_tmp_135, or_165_nl, fsm_output(2));
  xx_rsci_wadr_d_mx0c4 <= NOT(mux_149_nl OR (fsm_output(6)));
  nand_120_nl <= NOT((fsm_output(1)) AND (NOT mux_tmp_147));
  or_1036_nl <= (fsm_output(1)) OR (fsm_output(3)) OR (NOT nor_tmp_14);
  mux_150_nl <= MUX_s_1_2_2(nand_120_nl, or_1036_nl, fsm_output(2));
  xx_rsci_wadr_d_mx0c5 <= NOT(mux_150_nl OR (fsm_output(6)));
  or_168_nl <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR (NOT (fsm_output(0)))
      OR (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_151_nl <= MUX_s_1_2_2(or_tmp_130, or_tmp_122, fsm_output(1));
  mux_152_nl <= MUX_s_1_2_2(or_168_nl, mux_151_nl, fsm_output(2));
  xx_rsci_wadr_d_mx0c6 <= NOT(mux_152_nl OR (fsm_output(6)));
  xx_rsci_wadr_d_mx0c7 <= (NOT mux_148_itm) AND (NOT (fsm_output(6))) AND (fsm_output(2));
  yy_rsci_radr_d_mx0c0 <= and_dcpl_39 AND and_dcpl_21;
  yy_rsci_radr_d_mx0c1 <= (NOT mux_195_itm) AND and_dcpl_156 AND (NOT (fsm_output(0)));
  yy_rsci_radr_d_mx0c2 <= (NOT mux_195_itm) AND and_dcpl_156 AND (fsm_output(0));
  yy_rsci_radr_d_mx0c5 <= (NOT mux_199_itm) AND and_dcpl_161;
  yy_rsci_radr_d_mx0c9 <= and_dcpl_70 AND and_dcpl_169;
  yy_rsci_wadr_d_mx0c0 <= and_dcpl_39 AND and_dcpl_141;
  yy_rsci_wadr_d_mx0c1 <= and_dcpl_39 AND and_dcpl_83;
  yy_rsci_wadr_d_mx0c2 <= (NOT mux_202_itm) AND and_dcpl_173 AND (NOT (fsm_output(1)));
  mux_203_nl <= MUX_s_1_2_2(or_533_cse, or_585_cse, fsm_output(3));
  nor_265_nl <= NOT((fsm_output(1)) OR mux_203_nl);
  nor_266_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(3))) OR (fsm_output(0))
      OR (fsm_output(6)) OR (fsm_output(7)));
  mux_204_nl <= MUX_s_1_2_2(nor_265_nl, nor_266_nl, fsm_output(2));
  yy_rsci_wadr_d_mx0c3 <= mux_204_nl AND and_dcpl_173;
  yy_rsci_wadr_d_mx0c4 <= (NOT mux_202_itm) AND and_dcpl_173 AND (fsm_output(1));
  yy_rsci_wadr_d_mx0c5 <= NOT(mux_193_itm OR (fsm_output(2)));
  yy_rsci_wadr_d_mx0c6 <= not_tmp_135 AND (NOT (fsm_output(1)));
  nor_260_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(0)) OR
      (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(7)) OR (NOT (fsm_output(5))));
  nor_261_nl <= NOT((fsm_output(1)) OR mux_tmp_192);
  yy_rsci_wadr_d_mx0c7 <= MUX_s_1_2_2(nor_260_nl, nor_261_nl, fsm_output(2));
  yy_rsci_wadr_d_mx0c8 <= not_tmp_135 AND (fsm_output(1));
  yy_rsci_wadr_d_mx0c10 <= and_dcpl_24 AND and_dcpl_169;
  or_1031_cse <= (NOT (fsm_output(6))) OR (NOT (fsm_output(0))) OR (fsm_output(5));
  nor_188_nl <= NOT((fsm_output(0)) OR (NOT mux_tmp_403));
  nor_189_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(3)) OR
      (fsm_output(4)));
  mux_404_nl <= MUX_s_1_2_2(nor_189_nl, nor_tmp_65, fsm_output(5));
  mux_405_nl <= MUX_s_1_2_2(mux_404_nl, mux_tmp_403, fsm_output(0));
  mux_406_nl <= MUX_s_1_2_2(nor_188_nl, mux_405_nl, fsm_output(2));
  nor_190_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(5)) OR (fsm_output(1)) OR
      (fsm_output(7)) OR (NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11")))));
  nor_191_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(1))) OR (fsm_output(7))
      OR (fsm_output(3)) OR (fsm_output(4)));
  mux_402_nl <= MUX_s_1_2_2(nor_190_nl, nor_191_nl, fsm_output(2));
  S1_OUTER_LOOP_for_p_sva_1_mx0c1 <= MUX_s_1_2_2(mux_406_nl, mux_402_nl, fsm_output(6));
  or_nl <= (fsm_output(3)) OR (NOT (fsm_output(0))) OR (fsm_output(4)) OR (fsm_output(6));
  or_1023_nl <= (NOT (fsm_output(3))) OR (fsm_output(0)) OR (NOT and_dcpl_69);
  mux_413_nl <= MUX_s_1_2_2(or_nl, or_1023_nl, fsm_output(1));
  S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 <= NOT(mux_413_nl OR or_tmp_29 OR (fsm_output(2)));
  or_513_nl <= (NOT (fsm_output(2))) OR (fsm_output(6)) OR (fsm_output(7));
  mux_422_nl <= MUX_s_1_2_2(or_351_cse, or_513_nl, fsm_output(1));
  mux_420_nl <= MUX_s_1_2_2(or_392_cse, (fsm_output(7)), fsm_output(5));
  nand_42_nl <= NOT((fsm_output(2)) AND (NOT mux_420_nl));
  mux_421_nl <= MUX_s_1_2_2(or_348_cse, nand_42_nl, fsm_output(1));
  mux_423_nl <= MUX_s_1_2_2(mux_422_nl, mux_421_nl, fsm_output(0));
  nor_179_nl <= NOT((fsm_output(4)) OR mux_423_nl);
  mux_8_nl <= MUX_s_1_2_2(or_401_cse, or_467_cse, fsm_output(5));
  mux_417_nl <= MUX_s_1_2_2(or_22_cse, mux_8_nl, fsm_output(2));
  nor_180_nl <= NOT((fsm_output(1)) OR mux_417_nl);
  and_365_nl <= (fsm_output(2)) AND (fsm_output(5)) AND (fsm_output(6)) AND (NOT
      (fsm_output(7)));
  nor_181_nl <= NOT((fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(7)));
  mux_415_nl <= MUX_s_1_2_2(and_365_nl, nor_181_nl, fsm_output(1));
  mux_418_nl <= MUX_s_1_2_2(nor_180_nl, mux_415_nl, fsm_output(0));
  nor_182_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(2)) OR (NOT (fsm_output(5)))
      OR (fsm_output(6)) OR (NOT (fsm_output(7))));
  nor_183_nl <= NOT((fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(5)) OR (NOT
      (fsm_output(6))) OR (fsm_output(7)));
  mux_414_nl <= MUX_s_1_2_2(nor_182_nl, nor_183_nl, fsm_output(0));
  mux_419_nl <= MUX_s_1_2_2(mux_418_nl, mux_414_nl, fsm_output(4));
  S1_OUTER_LOOP_for_acc_cse_sva_mx0c1 <= MUX_s_1_2_2(nor_179_nl, mux_419_nl, fsm_output(3));
  nor_311_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  mux_29_nl <= MUX_s_1_2_2(nor_311_nl, and_425_cse, fsm_output(0));
  S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 <= mux_29_nl AND (NOT (fsm_output(7))) AND
      and_dcpl_48;
  or_525_nl <= (NOT (fsm_output(7))) OR (fsm_output(5)) OR (NOT (fsm_output(2)));
  mux_429_nl <= MUX_s_1_2_2(or_tmp_503, or_525_nl, fsm_output(1));
  or_523_nl <= (fsm_output(1)) OR (fsm_output(7)) OR not_tmp_150;
  mux_430_nl <= MUX_s_1_2_2(mux_429_nl, or_523_nl, fsm_output(0));
  nor_174_nl <= NOT((fsm_output(4)) OR mux_430_nl);
  nor_175_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(1))) OR (fsm_output(7)) OR
      (fsm_output(5)) OR (fsm_output(2)));
  or_519_nl <= (fsm_output(7)) OR not_tmp_150;
  mux_427_nl <= MUX_s_1_2_2(or_tmp_503, or_519_nl, fsm_output(1));
  and_363_nl <= (fsm_output(0)) AND (NOT mux_427_nl);
  mux_428_nl <= MUX_s_1_2_2(nor_175_nl, and_363_nl, fsm_output(4));
  mux_431_nl <= MUX_s_1_2_2(nor_174_nl, mux_428_nl, fsm_output(3));
  nor_176_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(1))) OR (fsm_output(7))
      OR (NOT (fsm_output(5))) OR (fsm_output(2)));
  nor_177_nl <= NOT((fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(5))
      OR (fsm_output(2)));
  mux_426_nl <= MUX_s_1_2_2(nor_176_nl, nor_177_nl, fsm_output(4));
  and_364_nl <= (fsm_output(3)) AND mux_426_nl;
  S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 <= MUX_s_1_2_2(mux_431_nl, and_364_nl, fsm_output(6));
  butterFly_10_f1_sva_mx0c0 <= and_dcpl_39 AND and_dcpl_210 AND (NOT (fsm_output(2)));
  or_552_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0011"));
  mux_448_nl <= MUX_s_1_2_2(or_552_nl, or_dcpl_15, fsm_output(3));
  or_550_nl <= (NOT (fsm_output(3))) OR (fsm_output(4)) OR (fsm_output(6)) OR (NOT
      nor_tmp_9);
  mux_449_nl <= MUX_s_1_2_2(mux_448_nl, or_550_nl, fsm_output(1));
  or_548_nl <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR (NOT (fsm_output(4)))
      OR (NOT (fsm_output(6))) OR (fsm_output(7)) OR (NOT (fsm_output(5)));
  mux_450_nl <= MUX_s_1_2_2(mux_449_nl, or_548_nl, fsm_output(2));
  butterFly_10_f1_sva_mx0c1 <= NOT(mux_450_nl OR (fsm_output(0)));
  nor_169_nl <= NOT((fsm_output(2)) OR (NOT((fsm_output(3)) AND (fsm_output(5)))));
  nor_170_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(5)));
  mux_452_nl <= MUX_s_1_2_2(nor_169_nl, nor_170_nl, fsm_output(1));
  and_361_nl <= (NOT((NOT (fsm_output(6))) OR (fsm_output(7)) OR (NOT (fsm_output(0)))))
      AND mux_452_nl;
  or_554_nl <= (fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(2))) OR (fsm_output(3))
      OR (fsm_output(5));
  or_553_nl <= (NOT (fsm_output(0))) OR (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(3))
      OR (fsm_output(5));
  mux_451_nl <= MUX_s_1_2_2(or_554_nl, or_553_nl, fsm_output(7));
  nor_171_nl <= NOT((fsm_output(6)) OR mux_451_nl);
  butterFly_10_f1_sva_mx0c2 <= MUX_s_1_2_2(and_361_nl, nor_171_nl, fsm_output(4));
  S2_OUTER_LOOP_c_1_sva_mx0c1 <= and_dcpl_216 AND and_dcpl_144;
  S2_OUTER_LOOP_c_1_sva_mx0c2 <= nor_tmp_9 AND and_dcpl_27 AND and_dcpl_95;
  nor_160_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(0)) OR (fsm_output(5)));
  nor_161_nl <= NOT((fsm_output(6)) OR (NOT and_385_cse));
  mux_470_nl <= MUX_s_1_2_2(nor_160_nl, nor_161_nl, fsm_output(7));
  nand_118_nl <= NOT(S2_OUTER_LOOP_c_1_sva AND (z_out_2(2)) AND mux_470_nl);
  or_1025_nl <= (NOT (fsm_output(7))) OR (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(5));
  mux_471_nl <= MUX_s_1_2_2(nand_118_nl, or_1025_nl, fsm_output(3));
  mux_469_nl <= MUX_s_1_2_2(and_dcpl_110, and_385_cse, fsm_output(6));
  or_1026_nl <= (NOT (fsm_output(3))) OR (fsm_output(7)) OR (NOT mux_469_nl);
  mux_472_nl <= MUX_s_1_2_2(mux_471_nl, or_1026_nl, fsm_output(2));
  or_1027_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(6))
      OR (NOT and_385_cse);
  mux_473_nl <= MUX_s_1_2_2(mux_472_nl, or_1027_nl, fsm_output(1));
  S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 <= NOT(mux_473_nl OR (fsm_output(4)));
  or_598_nl <= (fsm_output(0)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(5)))
      OR (fsm_output(6));
  mux_474_nl <= MUX_s_1_2_2(or_tmp_83, or_598_nl, fsm_output(1));
  nor_159_cse <= NOT((NOT (fsm_output(4))) OR (fsm_output(2)) OR mux_474_nl);
  or_1042_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("101"));
  mux_7_nl <= MUX_s_1_2_2(or_1041_cse, or_1042_nl, fsm_output(0));
  or_608_nl <= (z_out_2(2)) OR (fsm_output(1)) OR mux_7_nl;
  nor_157_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("001")));
  nor_158_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("100")));
  mux_475_nl <= MUX_s_1_2_2(nor_157_nl, nor_158_nl, fsm_output(0));
  nand_47_nl <= NOT((fsm_output(1)) AND mux_475_nl);
  mux_477_nl <= MUX_s_1_2_2(or_608_nl, nand_47_nl, fsm_output(2));
  nor_156_nl <= NOT((fsm_output(4)) OR mux_477_nl);
  S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2 <= MUX_s_1_2_2(nor_156_nl, nor_159_cse, fsm_output(3));
  or_654_nl <= (fsm_output(3)) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(1)))
      OR (fsm_output(7)) OR nand_95_cse;
  or_652_nl <= (fsm_output(1)) OR (fsm_output(7)) OR nand_95_cse;
  mux_510_nl <= MUX_s_1_2_2(or_652_nl, or_tmp_624, fsm_output(5));
  mux_511_nl <= MUX_s_1_2_2(or_tmp_627, mux_510_nl, fsm_output(3));
  mux_512_nl <= MUX_s_1_2_2(or_654_nl, mux_511_nl, fsm_output(2));
  or_649_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR nand_95_cse;
  mux_507_nl <= MUX_s_1_2_2(or_649_nl, or_tmp_624, fsm_output(5));
  mux_508_nl <= MUX_s_1_2_2(or_tmp_627, mux_507_nl, fsm_output(3));
  or_646_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(1)))
      OR (fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  mux_509_nl <= MUX_s_1_2_2(mux_508_nl, or_646_nl, fsm_output(2));
  mux_513_itm <= MUX_s_1_2_2(mux_512_nl, mux_509_nl, fsm_output(0));
  nor_145_nl <= NOT((fsm_output(0)) OR (fsm_output(7)) OR (fsm_output(3)) OR (NOT
      (fsm_output(4))));
  nor_146_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(3))) OR (fsm_output(4)));
  mux_530_nl <= MUX_s_1_2_2(nor_145_nl, nor_146_nl, fsm_output(1));
  nor_147_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(7)) OR (NOT (fsm_output(3)))
      OR (fsm_output(4)));
  nor_148_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(3))) OR (fsm_output(4)));
  nor_149_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(3)) OR (fsm_output(4)));
  mux_528_nl <= MUX_s_1_2_2(nor_148_nl, nor_149_nl, fsm_output(0));
  mux_529_nl <= MUX_s_1_2_2(nor_147_nl, mux_528_nl, fsm_output(1));
  mux_531_nl <= MUX_s_1_2_2(mux_530_nl, mux_529_nl, fsm_output(5));
  nor_150_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(0))) OR (fsm_output(7))
      OR (NOT (fsm_output(3))) OR (fsm_output(4)));
  nor_151_nl <= NOT((fsm_output(1)) OR (fsm_output(0)) OR (NOT (fsm_output(7))) OR
      (fsm_output(3)) OR (fsm_output(4)));
  mux_527_nl <= MUX_s_1_2_2(nor_150_nl, nor_151_nl, fsm_output(5));
  mux_532_nl <= MUX_s_1_2_2(mux_531_nl, mux_527_nl, fsm_output(2));
  or_675_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(4));
  or_674_nl <= (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(3)) OR (NOT (fsm_output(4)));
  mux_526_nl <= MUX_s_1_2_2(or_675_nl, or_674_nl, fsm_output(5));
  nor_152_nl <= NOT((fsm_output(2)) OR mux_526_nl);
  butterFly_10_tw_asn_itm_mx0c0 <= MUX_s_1_2_2(mux_532_nl, nor_152_nl, fsm_output(6));
  or_697_cse <= (NOT reg_modulo_add_4_slc_32_svs_st_cse) OR (NOT (fsm_output(5)))
      OR (fsm_output(7));
  or_702_cse <= (NOT reg_modulo_add_1_slc_32_svs_st_cse) OR (fsm_output(5)) OR (NOT
      (fsm_output(7)));
  or_703_nl <= (NOT reg_modulo_add_3_slc_32_svs_st_cse) OR (NOT (fsm_output(5)))
      OR (fsm_output(7));
  mux_550_nl <= MUX_s_1_2_2(or_tmp_77, mux_tmp_19, reg_modulo_add_3_slc_32_svs_st_cse);
  mux_551_nl <= MUX_s_1_2_2(or_703_nl, mux_550_nl, reg_modulo_add_4_slc_32_svs_st_cse);
  mux_552_nl <= MUX_s_1_2_2(mux_551_nl, or_702_cse, fsm_output(0));
  or_704_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000")) OR mux_552_nl;
  and_354_nl <= reg_modulo_add_7_slc_32_svs_st_cse AND (fsm_output(5)) AND (fsm_output(7));
  and_355_nl <= reg_modulo_add_11_slc_32_svs_st_cse AND (fsm_output(5)) AND (fsm_output(7));
  mux_547_nl <= MUX_s_1_2_2(and_354_nl, and_355_nl, fsm_output(0));
  nand_75_nl <= NOT((fsm_output(1)) AND mux_547_nl);
  or_699_nl <= (NOT reg_modulo_add_3_slc_32_svs_st_cse) OR CONV_SL_1_1(fsm_output(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR nand_111_cse;
  mux_548_nl <= MUX_s_1_2_2(nand_75_nl, or_699_nl, fsm_output(2));
  mux_542_nl <= MUX_s_1_2_2(or_tmp_77, mux_tmp_19, reg_modulo_add_4_slc_32_svs_st_cse);
  mux_543_nl <= MUX_s_1_2_2(or_697_cse, mux_542_nl, reg_modulo_add_7_slc_32_svs_st_cse);
  mux_544_nl <= MUX_s_1_2_2(or_697_cse, mux_543_nl, fsm_output(0));
  or_695_nl <= (NOT reg_modulo_add_6_slc_32_svs_st_cse) OR (NOT (fsm_output(5)))
      OR (fsm_output(7));
  mux_539_nl <= MUX_s_1_2_2(or_tmp_77, mux_tmp_19, reg_modulo_add_6_slc_32_svs_st_cse);
  mux_540_nl <= MUX_s_1_2_2(or_695_nl, mux_539_nl, reg_modulo_add_11_slc_32_svs_st_cse);
  mux_541_nl <= MUX_s_1_2_2(mux_540_nl, or_702_cse, fsm_output(0));
  mux_545_nl <= MUX_s_1_2_2(mux_544_nl, mux_541_nl, fsm_output(1));
  nor_142_nl <= NOT((NOT reg_modulo_add_slc_32_svs_st_cse) OR (fsm_output(5)) OR
      (fsm_output(7)));
  nor_143_nl <= NOT((NOT reg_modulo_add_1_slc_32_svs_st_cse) OR (fsm_output(5)) OR
      (fsm_output(7)));
  mux_537_nl <= MUX_s_1_2_2(nor_142_nl, nor_143_nl, fsm_output(0));
  nand_50_nl <= NOT((fsm_output(1)) AND mux_537_nl);
  mux_546_nl <= MUX_s_1_2_2(mux_545_nl, nand_50_nl, fsm_output(2));
  mux_549_nl <= MUX_s_1_2_2(mux_548_nl, mux_546_nl, fsm_output(3));
  mux_553_nl <= MUX_s_1_2_2(or_704_nl, mux_549_nl, fsm_output(4));
  or_688_nl <= (NOT reg_modulo_add_6_slc_32_svs_st_cse) OR (NOT (fsm_output(0)))
      OR (fsm_output(5)) OR (fsm_output(7));
  or_687_nl <= (NOT reg_modulo_add_7_slc_32_svs_st_cse) OR (fsm_output(5)) OR (fsm_output(7));
  or_686_nl <= (NOT reg_modulo_add_6_slc_32_svs_st_cse) OR (fsm_output(5)) OR (fsm_output(7));
  mux_534_nl <= MUX_s_1_2_2(or_687_nl, or_686_nl, fsm_output(0));
  mux_535_nl <= MUX_s_1_2_2(or_688_nl, mux_534_nl, fsm_output(1));
  nor_144_nl <= NOT((fsm_output(2)) OR mux_535_nl);
  and_356_nl <= reg_modulo_add_4_slc_32_svs_st_cse AND (fsm_output(2)) AND (fsm_output(1))
      AND (fsm_output(0)) AND (fsm_output(5)) AND (NOT (fsm_output(7)));
  mux_536_nl <= MUX_s_1_2_2(nor_144_nl, and_356_nl, fsm_output(3));
  nand_49_nl <= NOT((fsm_output(4)) AND mux_536_nl);
  mux_554_itm <= MUX_s_1_2_2(mux_553_nl, nand_49_nl, fsm_output(6));
  or_715_cse <= reg_modulo_add_4_slc_32_svs_st_cse OR (NOT (fsm_output(5))) OR (fsm_output(7));
  or_727_cse <= reg_modulo_add_1_slc_32_svs_st_cse OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_571_nl <= MUX_s_1_2_2(mux_tmp_19, or_tmp_77, reg_modulo_add_3_slc_32_svs_st_cse);
  or_728_nl <= reg_modulo_add_3_slc_32_svs_st_cse OR (NOT (fsm_output(5))) OR (fsm_output(7));
  mux_572_nl <= MUX_s_1_2_2(mux_571_nl, or_728_nl, reg_modulo_add_4_slc_32_svs_st_cse);
  mux_573_nl <= MUX_s_1_2_2(mux_572_nl, or_727_cse, fsm_output(0));
  nor_133_nl <= NOT((fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(6)) OR mux_573_nl);
  nor_134_nl <= NOT(reg_modulo_add_6_slc_32_svs_st_cse OR (NOT (fsm_output(6))) OR
      (NOT (fsm_output(0))) OR (fsm_output(5)) OR (fsm_output(7)));
  nor_135_nl <= NOT(reg_modulo_add_3_slc_32_svs_st_cse OR (fsm_output(6)) OR (fsm_output(0))
      OR nand_111_cse);
  mux_569_nl <= MUX_s_1_2_2(nor_134_nl, nor_135_nl, fsm_output(2));
  or_720_nl <= reg_modulo_add_7_slc_32_svs_st_cse OR nand_111_cse;
  or_719_nl <= reg_modulo_add_11_slc_32_svs_st_cse OR nand_111_cse;
  mux_567_nl <= MUX_s_1_2_2(or_720_nl, or_719_nl, fsm_output(0));
  or_718_nl <= reg_modulo_add_7_slc_32_svs_st_cse OR (fsm_output(5)) OR (fsm_output(7));
  or_717_nl <= reg_modulo_add_6_slc_32_svs_st_cse OR (fsm_output(5)) OR (fsm_output(7));
  mux_566_nl <= MUX_s_1_2_2(or_718_nl, or_717_nl, fsm_output(0));
  mux_568_nl <= MUX_s_1_2_2(mux_567_nl, mux_566_nl, fsm_output(6));
  nor_136_nl <= NOT((fsm_output(2)) OR mux_568_nl);
  mux_570_nl <= MUX_s_1_2_2(mux_569_nl, nor_136_nl, fsm_output(1));
  mux_574_nl <= MUX_s_1_2_2(nor_133_nl, mux_570_nl, fsm_output(4));
  mux_562_nl <= MUX_s_1_2_2(mux_tmp_19, or_tmp_77, reg_modulo_add_4_slc_32_svs_st_cse);
  mux_563_nl <= MUX_s_1_2_2(mux_562_nl, or_715_cse, reg_modulo_add_7_slc_32_svs_st_cse);
  mux_564_nl <= MUX_s_1_2_2(or_715_cse, mux_563_nl, fsm_output(0));
  nor_137_nl <= NOT((fsm_output(2)) OR (fsm_output(6)) OR mux_564_nl);
  mux_558_nl <= MUX_s_1_2_2(mux_tmp_19, or_tmp_77, reg_modulo_add_6_slc_32_svs_st_cse);
  or_710_nl <= reg_modulo_add_6_slc_32_svs_st_cse OR (NOT (fsm_output(5))) OR (fsm_output(7));
  mux_559_nl <= MUX_s_1_2_2(mux_558_nl, or_710_nl, reg_modulo_add_11_slc_32_svs_st_cse);
  mux_560_nl <= MUX_s_1_2_2(mux_559_nl, or_727_cse, fsm_output(0));
  nor_138_nl <= NOT((fsm_output(6)) OR mux_560_nl);
  nor_139_nl <= NOT(reg_modulo_add_slc_32_svs_st_cse OR (fsm_output(5)) OR (fsm_output(7)));
  nor_140_nl <= NOT(reg_modulo_add_1_slc_32_svs_st_cse OR (fsm_output(5)) OR (fsm_output(7)));
  mux_555_nl <= MUX_s_1_2_2(nor_139_nl, nor_140_nl, fsm_output(0));
  nor_141_nl <= NOT(reg_modulo_add_4_slc_32_svs_st_cse OR (NOT (fsm_output(0))) OR
      (NOT (fsm_output(5))) OR (fsm_output(7)));
  mux_556_nl <= MUX_s_1_2_2(mux_555_nl, nor_141_nl, fsm_output(6));
  mux_561_nl <= MUX_s_1_2_2(nor_138_nl, mux_556_nl, fsm_output(2));
  mux_565_nl <= MUX_s_1_2_2(nor_137_nl, mux_561_nl, fsm_output(1));
  and_353_nl <= (fsm_output(4)) AND mux_565_nl;
  butterFly_10_tw_asn_itm_mx0c2 <= MUX_s_1_2_2(mux_574_nl, and_353_nl, fsm_output(3));
  nor_128_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(3))) OR (fsm_output(6))
      OR (fsm_output(7)) OR nand_83_cse);
  or_757_nl <= (fsm_output(7)) OR nand_83_cse;
  mux_600_nl <= MUX_s_1_2_2(or_tmp_728, or_757_nl, fsm_output(6));
  nor_129_nl <= NOT((fsm_output(0)) OR (fsm_output(3)) OR mux_600_nl);
  mux_601_nl <= MUX_s_1_2_2(nor_128_nl, nor_129_nl, fsm_output(4));
  or_754_nl <= (NOT (fsm_output(3))) OR (fsm_output(6)) OR (NOT (fsm_output(7)))
      OR (fsm_output(5)) OR (fsm_output(1));
  or_752_nl <= (NOT (fsm_output(7))) OR (NOT (fsm_output(5))) OR (fsm_output(1));
  mux_598_nl <= MUX_s_1_2_2(or_752_nl, or_tmp_728, fsm_output(6));
  or_753_nl <= (fsm_output(3)) OR mux_598_nl;
  mux_599_nl <= MUX_s_1_2_2(or_754_nl, or_753_nl, fsm_output(0));
  nor_130_nl <= NOT((fsm_output(4)) OR mux_599_nl);
  butterFly_13_tw_h_asn_itm_mx0c0 <= MUX_s_1_2_2(mux_601_nl, nor_130_nl, fsm_output(2));
  nor_124_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(0)) OR (NOT (fsm_output(7)))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)));
  nor_125_nl <= NOT((fsm_output(5)) OR (fsm_output(0)) OR (fsm_output(7)) OR (NOT
      (fsm_output(3))) OR (fsm_output(6)));
  mux_605_nl <= MUX_s_1_2_2(nor_124_nl, nor_125_nl, fsm_output(4));
  mux_606_nl <= MUX_s_1_2_2(mux_605_nl, nor_109_cse, fsm_output(2));
  or_772_nl <= (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  or_777_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_603_nl <= MUX_s_1_2_2(or_772_nl, or_777_nl, fsm_output(0));
  or_762_nl <= (fsm_output(0)) OR (fsm_output(7)) OR (NOT (fsm_output(3))) OR (fsm_output(6));
  mux_604_nl <= MUX_s_1_2_2(mux_603_nl, or_762_nl, fsm_output(5));
  nor_127_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR mux_604_nl);
  butterFly_13_tw_h_asn_itm_mx0c1 <= MUX_s_1_2_2(mux_606_nl, nor_127_nl, fsm_output(1));
  butterFly_13_tw_h_asn_itm_mx0c2 <= and_dcpl_70 AND and_dcpl_90;
  or_792_nl <= (NOT (fsm_output(2))) OR (fsm_output(4)) OR (fsm_output(3)) OR (NOT
      (fsm_output(1))) OR (fsm_output(6));
  mux_622_nl <= MUX_s_1_2_2(or_tmp_765, or_792_nl, fsm_output(7));
  nand_54_nl <= NOT((fsm_output(5)) AND (NOT mux_622_nl));
  or_790_nl <= (fsm_output(3)) OR nand_72_cse;
  or_789_nl <= (fsm_output(3)) OR (fsm_output(1)) OR (fsm_output(6));
  mux_619_nl <= MUX_s_1_2_2(or_790_nl, or_789_nl, fsm_output(4));
  or_791_nl <= (fsm_output(2)) OR mux_619_nl;
  mux_620_nl <= MUX_s_1_2_2(or_791_nl, or_tmp_765, fsm_output(7));
  or_787_nl <= (fsm_output(7)) OR (fsm_output(2)) OR (NOT (fsm_output(4))) OR (fsm_output(3))
      OR nand_72_cse;
  mux_621_nl <= MUX_s_1_2_2(mux_620_nl, or_787_nl, fsm_output(5));
  mux_623_itm <= MUX_s_1_2_2(nand_54_nl, mux_621_nl, fsm_output(0));
  or_799_nl <= (fsm_output(5)) OR (NOT (fsm_output(7))) OR (fsm_output(1)) OR (fsm_output(6));
  or_545_nl <= (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(6));
  mux_626_nl <= MUX_s_1_2_2(or_545_nl, or_tmp_773, fsm_output(5));
  mux_627_nl <= MUX_s_1_2_2(or_799_nl, mux_626_nl, fsm_output(2));
  nor_122_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("10"))
      OR mux_627_nl);
  or_541_nl <= (NOT (fsm_output(7))) OR (fsm_output(1)) OR (fsm_output(6));
  mux_624_nl <= MUX_s_1_2_2(or_tmp_773, or_541_nl, fsm_output(5));
  or_794_nl <= (NOT (fsm_output(5))) OR (fsm_output(7)) OR (NOT (fsm_output(1)))
      OR (fsm_output(6));
  mux_625_nl <= MUX_s_1_2_2(mux_624_nl, or_794_nl, fsm_output(2));
  nor_123_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01"))
      OR mux_625_nl);
  butterFly_10_tw_h_asn_itm_mx0c1 <= MUX_s_1_2_2(nor_122_nl, nor_123_nl, fsm_output(0));
  or_807_nl <= (fsm_output(0)) OR (NOT reg_modulo_add_11_slc_32_svs_st_cse) OR CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  or_805_nl <= (fsm_output(0)) OR (NOT modulo_add_19_slc_32_svs_st) OR CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_631_nl <= MUX_s_1_2_2(or_807_nl, or_805_nl, fsm_output(3));
  or_804_nl <= (fsm_output(3)) OR (NOT (fsm_output(0))) OR (NOT reg_modulo_add_slc_32_svs_st_cse)
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_632_nl <= MUX_s_1_2_2(mux_631_nl, or_804_nl, fsm_output(5));
  nor_118_nl <= NOT((fsm_output(1)) OR mux_632_nl);
  nor_119_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(0)))
      OR (NOT reg_modulo_add_3_slc_32_svs_st_cse) OR CONV_SL_1_1(fsm_output(7 DOWNTO
      6)/=STD_LOGIC_VECTOR'("00")));
  nor_120_nl <= NOT((NOT (fsm_output(0))) OR (NOT reg_modulo_add_7_slc_32_svs_st_cse)
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  nor_121_nl <= NOT((fsm_output(0)) OR (NOT reg_modulo_add_slc_32_svs_st_cse) OR
      CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01")));
  mux_629_nl <= MUX_s_1_2_2(nor_120_nl, nor_121_nl, fsm_output(3));
  and_352_nl <= (fsm_output(5)) AND mux_629_nl;
  mux_630_nl <= MUX_s_1_2_2(nor_119_nl, and_352_nl, fsm_output(1));
  mux_633_nl <= MUX_s_1_2_2(nor_118_nl, mux_630_nl, fsm_output(2));
  butterFly_10_tw_h_asn_itm_mx0c2 <= mux_633_nl AND (fsm_output(4));
  or_816_nl <= (fsm_output(0)) OR reg_modulo_add_11_slc_32_svs_st_cse OR CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  or_814_nl <= (fsm_output(0)) OR modulo_add_19_slc_32_svs_st OR CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_636_nl <= MUX_s_1_2_2(or_816_nl, or_814_nl, fsm_output(3));
  or_813_nl <= (fsm_output(3)) OR (NOT (fsm_output(0))) OR reg_modulo_add_slc_32_svs_st_cse
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_637_nl <= MUX_s_1_2_2(mux_636_nl, or_813_nl, fsm_output(5));
  nor_114_nl <= NOT((fsm_output(1)) OR mux_637_nl);
  nor_115_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(0)))
      OR reg_modulo_add_3_slc_32_svs_st_cse OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  nor_116_nl <= NOT((NOT (fsm_output(0))) OR reg_modulo_add_7_slc_32_svs_st_cse OR
      CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  nor_117_nl <= NOT((fsm_output(0)) OR reg_modulo_add_slc_32_svs_st_cse OR CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("01")));
  mux_634_nl <= MUX_s_1_2_2(nor_116_nl, nor_117_nl, fsm_output(3));
  and_351_nl <= (fsm_output(5)) AND mux_634_nl;
  mux_635_nl <= MUX_s_1_2_2(nor_115_nl, and_351_nl, fsm_output(1));
  mux_638_nl <= MUX_s_1_2_2(nor_114_nl, mux_635_nl, fsm_output(2));
  butterFly_10_tw_h_asn_itm_mx0c3 <= mux_638_nl AND (fsm_output(4));
  butterFly_10_tw_h_asn_itm_mx0c4 <= and_dcpl_24 AND and_dcpl_144;
  or_874_nl <= (NOT (fsm_output(7))) OR (fsm_output(6)) OR (NOT (fsm_output(2)))
      OR (fsm_output(1)) OR (NOT (fsm_output(3)));
  mux_674_nl <= MUX_s_1_2_2(or_tmp_847, or_874_nl, fsm_output(5));
  or_872_nl <= (NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(3));
  mux_675_nl <= MUX_s_1_2_2(mux_674_nl, or_872_nl, fsm_output(4));
  or_871_nl <= (fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(1))) OR (fsm_output(3));
  mux_673_nl <= MUX_s_1_2_2(or_871_nl, or_tmp_847, fsm_output(5));
  nand_61_nl <= NOT((fsm_output(4)) AND (NOT mux_673_nl));
  mux_676_itm <= MUX_s_1_2_2(mux_675_nl, nand_61_nl, fsm_output(0));
  nor_95_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(4))) OR (fsm_output(1))
      OR (fsm_output(7)) OR (NOT (fsm_output(6))));
  nor_96_nl <= NOT((fsm_output(5)) OR (fsm_output(4)) OR (NOT (fsm_output(1))) OR
      (NOT (fsm_output(7))) OR (fsm_output(6)));
  mux_715_nl <= MUX_s_1_2_2(nor_95_nl, nor_96_nl, fsm_output(3));
  nor_97_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(6))));
  nor_98_nl <= NOT((fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(6)));
  mux_712_nl <= MUX_s_1_2_2(nor_97_nl, nor_98_nl, fsm_output(4));
  nor_99_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(7)))
      OR (fsm_output(6)));
  mux_713_nl <= MUX_s_1_2_2(mux_712_nl, nor_99_nl, fsm_output(5));
  nor_100_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(4)) OR (fsm_output(1)) OR
      (fsm_output(7)) OR (fsm_output(6)));
  mux_714_nl <= MUX_s_1_2_2(mux_713_nl, nor_100_nl, fsm_output(3));
  mux_716_nl <= MUX_s_1_2_2(mux_715_nl, mux_714_nl, fsm_output(0));
  modulo_add_base_1_sva_mx0c0 <= mux_716_nl AND (fsm_output(2));
  modulo_add_base_1_sva_mx0c1 <= and_dcpl_136 AND and_dcpl_123;
  modulo_add_base_1_sva_mx0c4 <= and_dcpl_136 AND and_dcpl_90;
  modulo_add_base_1_sva_mx0c5 <= and_dcpl_74 AND and_dcpl_148;
  modulo_add_base_1_sva_mx0c8 <= and_dcpl_74 AND and_dcpl_72;
  modulo_add_base_1_sva_mx0c9 <= and_dcpl_216 AND and_dcpl_90;
  modulo_add_base_1_sva_mx0c12 <= and_dcpl_70 AND and_dcpl_38;
  modulo_add_base_1_sva_mx0c13 <= and_dcpl_88 AND and_dcpl_43;
  modulo_add_base_1_sva_mx0c16 <= and_dcpl_92 AND and_dcpl_144;
  modulo_add_base_1_sva_mx0c17 <= and_dcpl_150 AND and_dcpl_21;
  modulo_add_base_1_sva_mx0c20 <= and_dcpl_150 AND and_dcpl_169;
  modulo_add_base_1_sva_mx0c21 <= and_dcpl_34 AND and_dcpl_144;
  modulo_add_base_1_sva_mx0c24 <= and_dcpl_34 AND and_dcpl_141;
  modulo_sub_1_mux_itm_mx0c1 <= and_dcpl_255 AND and_dcpl_184 AND (fsm_output(2))
      AND (NOT (acc_7_cse_32_1(31)));
  modulo_sub_2_mux_itm_mx0c1 <= and_dcpl_262 AND and_dcpl_184 AND (fsm_output(2))
      AND (NOT (acc_5_cse_32_1(31)));
  modulo_sub_5_mux_itm_mx0c1 <= and_dcpl_271 AND and_dcpl_31 AND (NOT (fsm_output(2)))
      AND (NOT (acc_5_cse_32_1(31)));
  modulo_sub_6_mux_itm_mx0c1 <= and_dcpl_278 AND and_dcpl_31 AND (NOT (fsm_output(2)))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_9_mux_itm_mx0c1 <= and_dcpl_286 AND and_dcpl_284 AND (NOT (fsm_output(2)))
      AND (NOT (acc_6_cse_32_1(31)));
  modulo_sub_10_mux_itm_mx0c1 <= and_dcpl_293 AND and_dcpl_210 AND (NOT (fsm_output(2)))
      AND (NOT (acc_7_cse_32_1(31)));
  modulo_sub_13_mux_itm_mx0c1 <= and_dcpl_301 AND and_dcpl_184 AND (fsm_output(2))
      AND (NOT (acc_5_cse_32_1(31)));
  modulo_sub_14_mux_itm_mx0c1 <= and_dcpl_310 AND and_dcpl_284 AND (NOT (fsm_output(2)))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_17_mux_itm_mx0c1 <= and_dcpl_317 AND and_dcpl_31 AND (NOT (fsm_output(2)))
      AND (NOT (acc_5_cse_32_1(31)));
  modulo_sub_18_mux_itm_mx0c1 <= and_dcpl_324 AND and_dcpl_184 AND (NOT (fsm_output(2)))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_21_mux_itm_mx0c1 <= and_dcpl_331 AND and_dcpl_210 AND (NOT (fsm_output(2)))
      AND (NOT (acc_5_cse_32_1(31)));
  modulo_sub_22_mux_itm_mx0c1 <= and_dcpl_188 AND and_dcpl_210 AND (NOT (fsm_output(2)))
      AND (NOT (acc_8_cse_32_1(31)));
  or_139_nl <= (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_132_nl <= MUX_s_1_2_2(or_139_nl, or_tmp_127, fsm_output(3));
  mux_130_nl <= MUX_s_1_2_2((NOT or_tmp_77), nor_tmp_9, fsm_output(4));
  nand_103_nl <= NOT((fsm_output(0)) AND mux_130_nl);
  mux_131_nl <= MUX_s_1_2_2(nand_103_nl, or_tmp_124, fsm_output(3));
  mux_133_nl <= MUX_s_1_2_2(mux_132_nl, mux_131_nl, fsm_output(1));
  or_136_nl <= (fsm_output(0)) OR not_tmp_95;
  mux_128_nl <= MUX_s_1_2_2(or_136_nl, or_tmp_124, fsm_output(3));
  mux_129_nl <= MUX_s_1_2_2(mux_128_nl, or_tmp_122, fsm_output(1));
  mux_134_nl <= MUX_s_1_2_2(mux_133_nl, mux_129_nl, fsm_output(2));
  nor_332_nl <= NOT(mux_134_nl OR (fsm_output(6)));
  and_85_nl <= and_dcpl_74 AND and_dcpl_68;
  and_86_nl <= and_dcpl_74 AND and_dcpl_43;
  and_98_nl <= and_dcpl_92 AND and_dcpl_38;
  and_99_nl <= and_dcpl_92 AND and_dcpl_83;
  and_103_nl <= and_dcpl_34 AND and_dcpl_85;
  and_104_nl <= and_dcpl_34 AND and_dcpl_21;
  xx_rsci_d_d <= MUX1HOT_v_32_17_2(butterFly_10_f1_sva, modulo_sub_7_mux_itm, modulo_sub_4_mux_itm,
      butterFly_10_tw_asn_itm, modulo_sub_5_mux_itm, modulo_sub_6_mux_itm, butterFly_10_tw_h_asn_itm,
      reg_mult_2_res_lpi_4_dfm_cse, reg_mult_1_res_lpi_4_dfm_cse, modulo_sub_15_mux_itm,
      modulo_sub_12_mux_itm, modulo_sub_13_mux_itm, modulo_sub_14_mux_itm, modulo_sub_23_mux_itm,
      modulo_sub_20_mux_itm, modulo_sub_21_mux_itm, modulo_sub_22_mux_itm, STD_LOGIC_VECTOR'(
      and_dcpl_73 & and_dcpl_75 & and_dcpl_78 & nor_332_nl & and_85_nl & and_86_nl
      & and_dcpl_82 & and_dcpl_84 & and_dcpl_86 & and_dcpl_89 & and_dcpl_91 & and_98_nl
      & and_99_nl & and_dcpl_96 & and_dcpl_97 & and_103_nl & and_104_nl));
  S2_COPY_LOOP_for_or_7_nl <= xx_rsci_radr_d_mx0c0 OR xx_rsci_radr_d_mx0c10 OR xx_rsci_radr_d_mx0c1
      OR xx_rsci_radr_d_mx0c2 OR xx_rsci_radr_d_mx0c3 OR xx_rsci_radr_d_mx0c4 OR
      xx_rsci_radr_d_mx0c5 OR xx_rsci_radr_d_mx0c6 OR xx_rsci_radr_d_mx0c7;
  S2_COPY_LOOP_for_mux1h_nl <= MUX1HOT_v_5_3_2(S1_OUTER_LOOP_for_acc_cse_sva, (reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg),
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, STD_LOGIC_VECTOR'( S2_COPY_LOOP_for_or_7_nl
      & xx_rsci_radr_d_mx0c8 & and_dcpl_122));
  S2_COPY_LOOP_for_or_8_nl <= xx_rsci_radr_d_mx0c0 OR xx_rsci_radr_d_mx0c1 OR xx_rsci_radr_d_mx0c2
      OR xx_rsci_radr_d_mx0c3 OR xx_rsci_radr_d_mx0c4 OR xx_rsci_radr_d_mx0c5 OR
      xx_rsci_radr_d_mx0c6 OR xx_rsci_radr_d_mx0c7;
  S2_COPY_LOOP_for_mux1h_8_nl <= MUX1HOT_v_2_4_2(S2_INNER_LOOP1_r_4_2_sva_1_0, (S1_OUTER_LOOP_for_acc_cse_sva(4
      DOWNTO 3)), STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4 DOWNTO 3)), STD_LOGIC_VECTOR'( S2_COPY_LOOP_for_or_8_nl
      & xx_rsci_radr_d_mx0c8 & and_dcpl_122 & xx_rsci_radr_d_mx0c10));
  S2_COPY_LOOP_for_mux1h_9_nl <= MUX1HOT_v_3_9_2(STD_LOGIC_VECTOR'( "101"), STD_LOGIC_VECTOR'(
      "011"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "110"), STD_LOGIC_VECTOR'(
      "100"), STD_LOGIC_VECTOR'( "010"), (S1_OUTER_LOOP_for_acc_cse_sva(2 DOWNTO
      0)), reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(2
      DOWNTO 0)), STD_LOGIC_VECTOR'( xx_rsci_radr_d_mx0c1 & xx_rsci_radr_d_mx0c2
      & xx_rsci_radr_d_mx0c3 & xx_rsci_radr_d_mx0c4 & xx_rsci_radr_d_mx0c5 & xx_rsci_radr_d_mx0c6
      & xx_rsci_radr_d_mx0c8 & and_dcpl_122 & xx_rsci_radr_d_mx0c10));
  S2_COPY_LOOP_for_not_nl <= NOT xx_rsci_radr_d_mx0c7;
  S2_COPY_LOOP_for_and_2_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"), S2_COPY_LOOP_for_mux1h_9_nl,
      S2_COPY_LOOP_for_not_nl);
  S2_COPY_LOOP_for_or_5_nl <= MUX_v_3_2_2(S2_COPY_LOOP_for_and_2_nl, STD_LOGIC_VECTOR'("111"),
      xx_rsci_radr_d_mx0c0);
  xx_rsci_radr_d <= S2_COPY_LOOP_for_mux1h_nl & S2_COPY_LOOP_for_mux1h_8_nl & S2_COPY_LOOP_for_or_5_nl;
  S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_6_nl <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, and_dcpl_86);
  S2_COPY_LOOP_for_mux1h_10_nl <= MUX1HOT_s_1_3_2((reg_drf_revArr_ptr_smx_9_0_cse(4)),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4)), reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg,
      STD_LOGIC_VECTOR'( and_dcpl_73 & and_dcpl_84 & and_dcpl_86));
  S2_COPY_LOOP_for_or_nl <= (S2_COPY_LOOP_for_mux1h_10_nl AND (NOT(xx_rsci_wadr_d_mx0c3
      OR xx_rsci_wadr_d_mx0c4 OR xx_rsci_wadr_d_mx0c6 OR and_dcpl_82))) OR xx_rsci_wadr_d_mx0c1
      OR xx_rsci_wadr_d_mx0c2 OR xx_rsci_wadr_d_mx0c5 OR xx_rsci_wadr_d_mx0c7;
  S2_COPY_LOOP_for_or_9_nl <= xx_rsci_wadr_d_mx0c1 OR xx_rsci_wadr_d_mx0c2 OR xx_rsci_wadr_d_mx0c3
      OR xx_rsci_wadr_d_mx0c4 OR xx_rsci_wadr_d_mx0c5 OR xx_rsci_wadr_d_mx0c6 OR
      xx_rsci_wadr_d_mx0c7 OR and_dcpl_82;
  S2_COPY_LOOP_for_mux1h_11_nl <= MUX1HOT_v_2_4_2((reg_drf_revArr_ptr_smx_9_0_cse(3
      DOWNTO 2)), S2_INNER_LOOP1_r_4_2_sva_1_0, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(3
      DOWNTO 2)), STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(2))),
      STD_LOGIC_VECTOR'( and_dcpl_73 & S2_COPY_LOOP_for_or_9_nl & and_dcpl_84 & and_dcpl_86));
  S2_COPY_LOOP_for_or_2_nl <= xx_rsci_wadr_d_mx0c4 OR xx_rsci_wadr_d_mx0c5;
  S2_COPY_LOOP_for_or_3_nl <= xx_rsci_wadr_d_mx0c6 OR xx_rsci_wadr_d_mx0c7;
  S2_COPY_LOOP_for_mux1h_12_nl <= MUX1HOT_v_2_5_2((reg_drf_revArr_ptr_smx_9_0_cse(1
      DOWNTO 0)), STD_LOGIC_VECTOR'( "01"), STD_LOGIC_VECTOR'( "10"), (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(1
      DOWNTO 0)), (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(1 DOWNTO 0)), STD_LOGIC_VECTOR'(
      and_dcpl_73 & S2_COPY_LOOP_for_or_2_nl & S2_COPY_LOOP_for_or_3_nl & and_dcpl_84
      & and_dcpl_86));
  S2_COPY_LOOP_for_nor_1_nl <= NOT(xx_rsci_wadr_d_mx0c2 OR xx_rsci_wadr_d_mx0c3);
  S2_COPY_LOOP_for_and_1_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), S2_COPY_LOOP_for_mux1h_12_nl,
      S2_COPY_LOOP_for_nor_1_nl);
  S2_COPY_LOOP_for_or_4_nl <= xx_rsci_wadr_d_mx0c1 OR and_dcpl_82;
  S2_COPY_LOOP_for_or_1_nl <= MUX_v_2_2_2(S2_COPY_LOOP_for_and_1_nl, STD_LOGIC_VECTOR'("11"),
      S2_COPY_LOOP_for_or_4_nl);
  xx_rsci_wadr_d <= S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_6_nl & S2_COPY_LOOP_for_or_nl
      & S2_COPY_LOOP_for_mux1h_11_nl & S2_COPY_LOOP_for_or_1_nl;
  mux_157_nl <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), fsm_output(7));
  or_176_nl <= (NOT (fsm_output(7))) OR (fsm_output(3));
  or_175_nl <= (NOT (fsm_output(0))) OR (fsm_output(2));
  mux_158_nl <= MUX_s_1_2_2(mux_157_nl, or_176_nl, or_175_nl);
  or_174_nl <= (fsm_output(2)) OR (NOT (fsm_output(7))) OR (fsm_output(3));
  mux_159_nl <= MUX_s_1_2_2(mux_158_nl, or_174_nl, fsm_output(1));
  nor_279_nl <= NOT((fsm_output(4)) OR mux_159_nl);
  and_394_nl <= or_125_cse AND (fsm_output(7));
  mux_155_nl <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), and_394_nl);
  or_172_nl <= and_403_cse OR (fsm_output(7));
  mux_154_nl <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), or_172_nl);
  mux_156_nl <= MUX_s_1_2_2(mux_155_nl, mux_154_nl, fsm_output(1));
  and_393_nl <= (fsm_output(4)) AND (NOT mux_156_nl);
  mux_160_nl <= MUX_s_1_2_2(nor_279_nl, and_393_nl, fsm_output(5));
  nor_280_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(2))) OR (fsm_output(7)) OR
      (fsm_output(3)));
  and_nl <= (fsm_output(1)) AND (fsm_output(2)) AND (NOT (fsm_output(7))) AND (fsm_output(3));
  mux_153_nl <= MUX_s_1_2_2(nor_280_nl, and_nl, fsm_output(4));
  and_396_nl <= (fsm_output(5)) AND mux_153_nl;
  xx_rsci_we_d_pff <= MUX_s_1_2_2(mux_160_nl, and_396_nl, fsm_output(6));
  or_188_nl <= (NOT (fsm_output(4))) OR (fsm_output(6));
  mux_169_nl <= MUX_s_1_2_2(or_188_nl, or_900_cse, fsm_output(3));
  mux_170_nl <= MUX_s_1_2_2(mux_169_nl, mux_tmp_164, fsm_output(2));
  or_187_nl <= (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT
      (fsm_output(6)));
  nand_102_nl <= NOT((fsm_output(3)) AND (fsm_output(7)) AND (fsm_output(4)) AND
      (NOT (fsm_output(6))));
  mux_168_nl <= MUX_s_1_2_2(or_187_nl, nand_102_nl, fsm_output(2));
  mux_171_nl <= MUX_s_1_2_2(mux_170_nl, mux_168_nl, fsm_output(5));
  mux_172_nl <= MUX_s_1_2_2(mux_171_nl, or_tmp_173, fsm_output(1));
  or_178_nl <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(7)))
      OR (NOT (fsm_output(4))) OR (fsm_output(6));
  mux_166_nl <= MUX_s_1_2_2(mux_tmp_165, or_178_nl, fsm_output(5));
  mux_167_nl <= MUX_s_1_2_2(or_tmp_173, mux_166_nl, fsm_output(1));
  mux_173_nl <= MUX_s_1_2_2(mux_172_nl, mux_167_nl, fsm_output(0));
  xx_rsci_readA_r_ram_ir_internal_RMASK_B_d <= NOT mux_173_nl;
  or_207_nl <= (fsm_output(0)) OR (NOT and_425_cse);
  mux_186_nl <= MUX_s_1_2_2(or_tmp_197, or_207_nl, fsm_output(3));
  and_388_nl <= (fsm_output(1)) AND (NOT mux_186_nl);
  nor_269_nl <= NOT((fsm_output(1)) OR (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(6))
      OR (fsm_output(5)));
  mux_187_nl <= MUX_s_1_2_2(and_388_nl, nor_269_nl, fsm_output(2));
  and_140_nl <= mux_187_nl AND and_dcpl_66;
  nor_267_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(0)) OR
      (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(3)));
  nand_19_nl <= NOT((fsm_output(1)) AND (NOT mux_tmp_188));
  mux_189_nl <= MUX_s_1_2_2(mux_tmp_188, or_210_cse, fsm_output(1));
  nand_18_nl <= NOT((fsm_output(0)) AND (NOT mux_189_nl));
  mux_190_nl <= MUX_s_1_2_2(nand_19_nl, nand_18_nl, fsm_output(2));
  nor_268_nl <= NOT((fsm_output(5)) OR mux_190_nl);
  mux_191_nl <= MUX_s_1_2_2(nor_267_nl, nor_268_nl, fsm_output(4));
  and_145_nl <= and_dcpl_139 AND and_dcpl_95;
  and_147_nl <= and_dcpl_139 AND and_dcpl_141;
  and_152_nl <= and_dcpl_70 AND and_dcpl_83;
  and_154_nl <= and_dcpl_70 AND and_dcpl_148;
  and_158_nl <= and_dcpl_150 AND and_dcpl_123;
  and_159_nl <= and_dcpl_150 AND and_dcpl_87;
  yy_rsci_d_d <= MUX1HOT_v_32_15_2(butterFly_10_f1_sva, modulo_sub_3_mux_itm, modulo_sub_mux_itm,
      butterFly_10_tw_asn_itm, modulo_sub_1_mux_itm, modulo_sub_2_mux_itm, butterFly_10_tw_h_asn_itm,
      modulo_sub_11_mux_itm, modulo_sub_8_mux_itm, modulo_sub_9_mux_itm, modulo_sub_10_mux_itm,
      modulo_sub_19_mux_itm, modulo_sub_16_mux_itm, modulo_sub_17_mux_itm, modulo_sub_18_mux_itm,
      STD_LOGIC_VECTOR'( and_140_nl & and_dcpl_137 & and_dcpl_138 & mux_191_nl &
      and_145_nl & and_147_nl & and_dcpl_143 & and_dcpl_145 & and_dcpl_146 & and_152_nl
      & and_154_nl & and_dcpl_151 & and_dcpl_152 & and_158_nl & and_159_nl));
  S1_OUTER_LOOP_for_or_8_nl <= yy_rsci_radr_d_mx0c1 OR and_dcpl_71 OR yy_rsci_radr_d_mx0c2
      OR and_dcpl_162 OR and_dcpl_164 OR yy_rsci_radr_d_mx0c5 OR and_dcpl_166 OR
      and_dcpl_167 OR and_dcpl_168;
  S1_OUTER_LOOP_for_mux1h_nl <= MUX1HOT_v_5_3_2((reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg),
      S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0, STD_LOGIC_VECTOR'(
      yy_rsci_radr_d_mx0c0 & S1_OUTER_LOOP_for_or_8_nl & yy_rsci_radr_d_mx0c9));
  S1_OUTER_LOOP_for_or_10_nl <= yy_rsci_radr_d_mx0c1 OR yy_rsci_radr_d_mx0c2 OR and_dcpl_162
      OR and_dcpl_164 OR yy_rsci_radr_d_mx0c5 OR and_dcpl_166 OR and_dcpl_167 OR
      and_dcpl_168;
  S1_OUTER_LOOP_for_mux1h_5_nl <= MUX1HOT_v_2_4_2((S1_OUTER_LOOP_for_acc_cse_sva(4
      DOWNTO 3)), S2_INNER_LOOP1_r_4_2_sva_1_0, STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg), (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4
      DOWNTO 3)), STD_LOGIC_VECTOR'( yy_rsci_radr_d_mx0c0 & S1_OUTER_LOOP_for_or_10_nl
      & yy_rsci_radr_d_mx0c9 & and_dcpl_71));
  S1_OUTER_LOOP_for_mux1h_6_nl <= MUX1HOT_v_3_9_2((S1_OUTER_LOOP_for_acc_cse_sva(2
      DOWNTO 0)), STD_LOGIC_VECTOR'( "101"), STD_LOGIC_VECTOR'( "011"), STD_LOGIC_VECTOR'(
      "001"), STD_LOGIC_VECTOR'( "110"), STD_LOGIC_VECTOR'( "100"), STD_LOGIC_VECTOR'(
      "010"), reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(2
      DOWNTO 0)), STD_LOGIC_VECTOR'( yy_rsci_radr_d_mx0c0 & yy_rsci_radr_d_mx0c2
      & and_dcpl_162 & and_dcpl_164 & yy_rsci_radr_d_mx0c5 & and_dcpl_166 & and_dcpl_167
      & yy_rsci_radr_d_mx0c9 & and_dcpl_71));
  S1_OUTER_LOOP_for_not_5_nl <= NOT and_dcpl_168;
  S1_OUTER_LOOP_for_and_3_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"), S1_OUTER_LOOP_for_mux1h_6_nl,
      S1_OUTER_LOOP_for_not_5_nl);
  S1_OUTER_LOOP_for_or_6_nl <= MUX_v_3_2_2(S1_OUTER_LOOP_for_and_3_nl, STD_LOGIC_VECTOR'("111"),
      yy_rsci_radr_d_mx0c1);
  yy_rsci_radr_d <= S1_OUTER_LOOP_for_mux1h_nl & S1_OUTER_LOOP_for_mux1h_5_nl & S1_OUTER_LOOP_for_or_6_nl;
  S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, yy_rsci_wadr_d_mx0c1);
  S1_OUTER_LOOP_for_mux1h_7_nl <= MUX1HOT_s_1_3_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4)),
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg, (reg_drf_revArr_ptr_smx_9_0_cse(4)), STD_LOGIC_VECTOR'(
      yy_rsci_wadr_d_mx0c0 & yy_rsci_wadr_d_mx0c1 & yy_rsci_wadr_d_mx0c10));
  S1_OUTER_LOOP_for_or_1_nl <= (S1_OUTER_LOOP_for_mux1h_7_nl AND (NOT(yy_rsci_wadr_d_mx0c4
      OR yy_rsci_wadr_d_mx0c5 OR yy_rsci_wadr_d_mx0c7 OR and_dcpl_143))) OR yy_rsci_wadr_d_mx0c2
      OR yy_rsci_wadr_d_mx0c3 OR yy_rsci_wadr_d_mx0c6 OR yy_rsci_wadr_d_mx0c8;
  S1_OUTER_LOOP_for_or_9_nl <= yy_rsci_wadr_d_mx0c2 OR yy_rsci_wadr_d_mx0c3 OR yy_rsci_wadr_d_mx0c4
      OR yy_rsci_wadr_d_mx0c5 OR yy_rsci_wadr_d_mx0c6 OR yy_rsci_wadr_d_mx0c7 OR
      yy_rsci_wadr_d_mx0c8 OR and_dcpl_143;
  S1_OUTER_LOOP_for_mux1h_8_nl <= MUX1HOT_v_2_4_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0(3
      DOWNTO 2)), STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(2))),
      S2_INNER_LOOP1_r_4_2_sva_1_0, (reg_drf_revArr_ptr_smx_9_0_cse(3 DOWNTO 2)),
      STD_LOGIC_VECTOR'( yy_rsci_wadr_d_mx0c0 & yy_rsci_wadr_d_mx0c1 & S1_OUTER_LOOP_for_or_9_nl
      & yy_rsci_wadr_d_mx0c10));
  S1_OUTER_LOOP_for_or_3_nl <= yy_rsci_wadr_d_mx0c5 OR yy_rsci_wadr_d_mx0c6;
  S1_OUTER_LOOP_for_or_4_nl <= yy_rsci_wadr_d_mx0c7 OR yy_rsci_wadr_d_mx0c8;
  S1_OUTER_LOOP_for_mux1h_9_nl <= MUX1HOT_v_2_5_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0(1
      DOWNTO 0)), (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(1 DOWNTO 0)), STD_LOGIC_VECTOR'(
      "01"), STD_LOGIC_VECTOR'( "10"), (reg_drf_revArr_ptr_smx_9_0_cse(1 DOWNTO 0)),
      STD_LOGIC_VECTOR'( yy_rsci_wadr_d_mx0c0 & yy_rsci_wadr_d_mx0c1 & S1_OUTER_LOOP_for_or_3_nl
      & S1_OUTER_LOOP_for_or_4_nl & yy_rsci_wadr_d_mx0c10));
  S1_OUTER_LOOP_for_nor_1_nl <= NOT(yy_rsci_wadr_d_mx0c3 OR yy_rsci_wadr_d_mx0c4);
  S1_OUTER_LOOP_for_and_2_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), S1_OUTER_LOOP_for_mux1h_9_nl,
      S1_OUTER_LOOP_for_nor_1_nl);
  S1_OUTER_LOOP_for_or_5_nl <= yy_rsci_wadr_d_mx0c2 OR and_dcpl_143;
  S1_OUTER_LOOP_for_or_2_nl <= MUX_v_2_2_2(S1_OUTER_LOOP_for_and_2_nl, STD_LOGIC_VECTOR'("11"),
      S1_OUTER_LOOP_for_or_5_nl);
  yy_rsci_wadr_d <= S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl & S1_OUTER_LOOP_for_or_1_nl
      & S1_OUTER_LOOP_for_mux1h_8_nl & S1_OUTER_LOOP_for_or_2_nl;
  or_252_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_211_nl <= MUX_s_1_2_2(or_252_nl, or_tmp_236, fsm_output(2));
  nor_257_nl <= NOT((fsm_output(6)) OR (fsm_output(3)) OR mux_211_nl);
  and_387_nl <= (fsm_output(3)) AND mux_tmp_208;
  nor_258_nl <= NOT((fsm_output(3)) OR (fsm_output(7)));
  mux_210_nl <= MUX_s_1_2_2(and_387_nl, nor_258_nl, fsm_output(6));
  mux_212_nl <= MUX_s_1_2_2(nor_257_nl, mux_210_nl, fsm_output(4));
  or_248_nl <= (fsm_output(3)) OR mux_tmp_208;
  or_246_nl <= (NOT (fsm_output(3))) OR (fsm_output(2)) OR (fsm_output(0)) OR (NOT
      (fsm_output(1))) OR (fsm_output(7));
  mux_209_nl <= MUX_s_1_2_2(or_248_nl, or_246_nl, fsm_output(6));
  nor_259_nl <= NOT((fsm_output(4)) OR mux_209_nl);
  yy_rsci_we_d_pff <= MUX_s_1_2_2(mux_212_nl, nor_259_nl, fsm_output(5));
  nor_252_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(4)) OR (fsm_output(6)) OR
      (fsm_output(7)) OR (NOT and_953_cse));
  nor_253_nl <= NOT((fsm_output(6)) OR (NOT and_tmp_6));
  nor_254_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"))
      OR and_953_cse);
  mux_216_nl <= MUX_s_1_2_2(nor_253_nl, nor_254_nl, fsm_output(4));
  mux_217_nl <= MUX_s_1_2_2(nor_252_nl, mux_216_nl, fsm_output(5));
  nor_255_nl <= NOT((NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(7))
      OR (NOT (fsm_output(1))) OR (fsm_output(2)));
  or_254_nl <= (fsm_output(7)) OR (NOT and_953_cse);
  mux_214_nl <= MUX_s_1_2_2(and_tmp_6, or_254_nl, fsm_output(6));
  nor_256_nl <= NOT((fsm_output(4)) OR mux_214_nl);
  mux_215_nl <= MUX_s_1_2_2(nor_255_nl, nor_256_nl, fsm_output(5));
  yy_rsci_readA_r_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(mux_217_nl, mux_215_nl,
      fsm_output(3));
  or_1063_nl <= (fsm_output(1)) OR mux_467_cse;
  or_1059_nl <= (fsm_output(0)) OR (fsm_output(7)) OR (fsm_output(6));
  mux_757_nl <= MUX_s_1_2_2(or_585_cse, or_1059_nl, fsm_output(5));
  nand_136_nl <= NOT((fsm_output(1)) AND (NOT mux_757_nl));
  mux_759_nl <= MUX_s_1_2_2(or_1063_nl, nand_136_nl, fsm_output(2));
  nor_406_nl <= NOT((fsm_output(4)) OR mux_759_nl);
  not_tmp_396 <= MUX_s_1_2_2(nor_406_nl, nor_159_cse, fsm_output(3));
  or_tmp_975 <= (NOT (fsm_output(7))) OR (fsm_output(2));
  or_tmp_983 <= (fsm_output(0)) OR (NOT (fsm_output(5))) OR (fsm_output(6));
  and_dcpl_358 <= NOT((fsm_output(7)) OR (fsm_output(5)));
  and_dcpl_360 <= (fsm_output(3)) AND (NOT (fsm_output(6)));
  and_dcpl_370 <= NOT((fsm_output(3)) OR (fsm_output(6)));
  and_dcpl_382 <= (NOT (fsm_output(3))) AND (fsm_output(6));
  and_dcpl_406 <= (fsm_output(2)) AND (NOT (fsm_output(6)));
  and_dcpl_425 <= and_dcpl_184 AND (fsm_output(2)) AND (fsm_output(6));
  and_dcpl_441 <= NOT((fsm_output(2)) OR (fsm_output(6)));
  nor_425_cse <= NOT((fsm_output(7)) OR (fsm_output(5)) OR (NOT (fsm_output(4)))
      OR (fsm_output(0)));
  and_715_cse_1 <= and_953_cse AND (fsm_output(3)) AND (fsm_output(6));
  and_dcpl_628 <= (fsm_output(7)) AND (NOT (fsm_output(5)));
  and_dcpl_731 <= and_dcpl_23 AND (fsm_output(4)) AND (fsm_output(0));
  and_dcpl_737 <= and_dcpl_23 AND (fsm_output(4)) AND (NOT (fsm_output(0)));
  nor_430_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(3)))
      OR (fsm_output(2)) OR (fsm_output(1)));
  nor_431_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(3)) OR
      nand_96_cse);
  mux_751_nl <= MUX_s_1_2_2(nor_430_nl, nor_431_nl, fsm_output(0));
  and_441_ssc <= mux_751_nl AND and_dcpl_27;
  or_tmp_1011 <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("101"));
  mux_tmp_788 <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), fsm_output(1));
  or_tmp_1036 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  nor_tmp_102 <= (fsm_output(5)) AND (fsm_output(1));
  or_tmp_1052 <= (fsm_output(6)) OR (NOT (fsm_output(5))) OR (fsm_output(0)) OR (NOT
      (fsm_output(1)));
  or_tmp_1056 <= (fsm_output(5)) OR (NOT (fsm_output(0))) OR (fsm_output(1));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND mux_43_nl) = '1' ) THEN
        m_sva <= m_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( core_wen = '1' ) THEN
        x_rsci_s_raddr_core_4_0 <= MUX_v_5_2_2((reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
            & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg),
            S2_COPY_LOOP_for_i_5_0_sva_1_4_0, and_dcpl_40);
        x_rsci_s_raddr_core_9_5 <= MUX_v_5_2_2(S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
            S1_OUTER_LOOP_for_acc_cse_sva, and_dcpl_40);
        x_rsci_s_waddr_core_4_0 <= MUX_v_5_2_2(S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
            (reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
            & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg), and_dcpl_44);
        x_rsci_s_waddr_core_9_5 <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
            and_dcpl_44);
        x_rsci_s_dout_core <= xx_rsci_q_d;
        reg_twiddle_rsci_s_raddr_core_1_cse <= ((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(1))
            AND (NOT mux_76_nl)) OR ((NOT mux_81_nl) AND nor_242_cse AND (NOT (fsm_output(2))));
        reg_twiddle_rsci_s_raddr_core_2_cse <= MUX1HOT_s_1_3_2(butterFly_12_tw_and_cse_3_2_sva_0,
            butterFly_tw_and_1_cse, (S2_INNER_LOOP1_r_4_2_sva_1_0(0)), STD_LOGIC_VECTOR'(
            butterFly_tw_h_or_2_nl & and_53_nl & and_dcpl_60));
        reg_twiddle_rsci_s_raddr_core_0_cse <= ((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(0))
            AND mux_99_nl) OR ((NOT mux_102_nl) AND nor_242_cse);
        reg_twiddle_rsci_s_raddr_core_3_cse <= MUX1HOT_s_1_3_2(butterFly_12_tw_and_cse_3_2_sva_1,
            (S2_INNER_LOOP1_r_4_2_sva_1_0(1)), (S2_INNER_LOOP1_r_4_2_sva_1_0(1)),
            STD_LOGIC_VECTOR'( and_dcpl_57 & and_69_nl & and_dcpl_60));
        revArr_rsci_s_raddr_core <= S1_OUTER_LOOP_for_acc_cse_sva;
        reg_tw_rsci_s_raddr_core_cse <= S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg;
        S34_OUTER_LOOP_for_tf_mul_cmp_a <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"),
            S34_OUTER_LOOP_for_tf_mux_1_nl, not_1496_nl);
        S34_OUTER_LOOP_for_k_sva_4_0 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), S34_OUTER_LOOP_for_k_mux_nl,
            not_1732_nl);
        reg_drf_revArr_ptr_smx_9_0_cse <= revArr_rsci_s_din_mxwt(4 DOWNTO 0);
        mult_3_res_sva <= acc_2_nl(32 DOWNTO 1);
        reg_mult_3_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_4, mult_3_res_sva, z_out_14_32);
        reg_mult_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_5, mult_3_res_sva, z_out_14_32);
        modulo_sub_3_mux_itm <= MUX_v_32_2_2(('0' & (acc_8_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_3_qif_acc_nl), 32)),
            acc_8_cse_32_1(31));
        modulo_sub_mux_itm <= MUX_v_32_2_2(('0' & (acc_6_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_qif_acc_nl), 32)),
            acc_6_cse_32_1(31));
        reg_mult_1_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_4, mult_3_res_sva, z_out_16_32);
        mult_2_res_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_13_tw_h_asn_itm)
            - UNSIGNED(mult_z_mul_cmp_z(31 DOWNTO 0)), 32));
        reg_mult_2_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_5, mult_2_res_sva, z_out_16_32);
        modulo_sub_7_mux_itm <= MUX_v_32_2_2(('0' & (acc_6_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_7_qif_acc_nl), 32)),
            acc_6_cse_32_1(31));
        modulo_sub_4_mux_itm <= MUX_v_32_2_2(('0' & (acc_7_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_4_qif_acc_nl), 32)),
            acc_7_cse_32_1(31));
        modulo_sub_11_mux_itm <= MUX_v_32_2_2(('0' & (acc_5_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_11_qif_acc_nl), 32)),
            acc_5_cse_32_1(31));
        modulo_sub_8_mux_itm <= MUX_v_32_2_2(('0' & (acc_8_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_8_qif_acc_nl), 32)),
            acc_8_cse_32_1(31));
        S34_OUTER_LOOP_for_tf_h_sva <= tw_h_rsci_s_din_mxwt;
        S34_OUTER_LOOP_for_tf_sva <= tw_rsci_s_din_mxwt;
        modulo_sub_15_mux_itm <= MUX_v_32_2_2(('0' & (acc_6_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_15_qif_acc_nl), 32)),
            acc_6_cse_32_1(31));
        modulo_sub_12_mux_itm <= MUX_v_32_2_2(('0' & (acc_7_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_12_qif_acc_nl), 32)),
            acc_7_cse_32_1(31));
        modulo_sub_19_mux_itm <= MUX_v_32_2_2(('0' & (acc_6_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_19_qif_acc_nl), 32)),
            acc_6_cse_32_1(31));
        modulo_sub_16_mux_itm <= MUX_v_32_2_2(('0' & (acc_7_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_16_qif_acc_nl), 32)),
            acc_7_cse_32_1(31));
        modulo_sub_23_mux_itm <= MUX_v_32_2_2(('0' & (acc_6_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_23_qif_acc_nl), 32)),
            acc_6_cse_32_1(31));
        modulo_sub_20_mux_itm <= MUX_v_32_2_2(('0' & (acc_7_cse_32_1(30 DOWNTO 0))),
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_20_qif_acc_nl), 32)),
            acc_7_cse_32_1(31));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_x_rsci_oswt_cse <= '0';
        reg_x_rsci_oswt_1_cse <= '0';
        reg_twiddle_rsci_oswt_cse <= '0';
        reg_revArr_rsci_oswt_cse <= '0';
        reg_tw_rsci_oswt_cse <= '0';
        reg_xx_rsc_cgo_cse <= '0';
        reg_yy_rsc_cgo_cse <= '0';
        reg_x_rsc_triosy_obj_iswt0_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        reg_ensig_cgo_1_cse <= '0';
        reg_modulo_add_3_slc_32_svs_st_cse <= '0';
        reg_modulo_add_slc_32_svs_st_cse <= '0';
        reg_modulo_add_1_slc_32_svs_st_cse <= '0';
        reg_modulo_add_7_slc_32_svs_st_cse <= '0';
        reg_modulo_add_4_slc_32_svs_st_cse <= '0';
        reg_modulo_add_6_slc_32_svs_st_cse <= '0';
        reg_modulo_add_11_slc_32_svs_st_cse <= '0';
        modulo_add_19_slc_32_svs_st <= '0';
      ELSIF ( core_wen = '1' ) THEN
        reg_x_rsci_oswt_cse <= (NOT(or_tmp_29 OR (NOT((fsm_output(0)) XOR (fsm_output(1))))))
            AND and_dcpl_27 AND CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00"));
        reg_x_rsci_oswt_1_cse <= and_dcpl_34 AND and_dcpl_31 AND (fsm_output(2));
        reg_twiddle_rsci_oswt_cse <= MUX_s_1_2_2(mux_64_nl, mux_59_nl, fsm_output(7));
        reg_revArr_rsci_oswt_cse <= mux_105_nl AND and_dcpl_66;
        reg_tw_rsci_oswt_cse <= and_dcpl_71;
        reg_xx_rsc_cgo_cse <= mux_127_rmff;
        reg_yy_rsc_cgo_cse <= mux_185_rmff;
        reg_x_rsc_triosy_obj_iswt0_cse <= and_dcpl_188 AND and_dcpl_184 AND (fsm_output(2))
            AND (S1_OUTER_LOOP_k_5_0_sva_2(5));
        reg_ensig_cgo_cse <= and_200_rmff;
        reg_ensig_cgo_1_cse <= NOT mux_235_itm;
        reg_modulo_add_3_slc_32_svs_st_cse <= acc_14_nl(33);
        reg_modulo_add_slc_32_svs_st_cse <= acc_16_nl(33);
        reg_modulo_add_1_slc_32_svs_st_cse <= acc_18_nl(33);
        reg_modulo_add_7_slc_32_svs_st_cse <= acc_19_nl(33);
        reg_modulo_add_4_slc_32_svs_st_cse <= acc_17_nl(33);
        reg_modulo_add_6_slc_32_svs_st_cse <= acc_21_nl(33);
        reg_modulo_add_11_slc_32_svs_st_cse <= acc_20_nl(33);
        modulo_add_19_slc_32_svs_st <= modulo_add_19_acc_1_nl(32);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((z_out_2(2)) OR (NOT (S1_OUTER_LOOP_k_5_0_sva_2(5))) OR
          operator_20_true_8_slc_operator_20_true_8_acc_14_itm)) = '1' ) THEN
        S34_OUTER_LOOP_for_k_slc_S34_OUTER_LOOP_for_k_sva_19_5_4_0_1 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"),
            (S1_OUTER_LOOP_for_p_sva_1(9 DOWNTO 5)), and_203_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_785_nl AND core_wen) = '1' ) THEN
        reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg <= (S1_OUTER_LOOP_k_5_0_sva_2(4)) AND
            mux_359_seb;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_798_nl AND core_wen) = '1' ) THEN
        reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg <= S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl
            AND mux_359_seb;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_807_nl AND core_wen) = '1' ) THEN
        reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"),
            S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl, mux_359_seb);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        S2_COPY_LOOP_for_i_5_0_sva_1_5 <= '0';
      ELSIF ( (mux_817_nl AND core_wen) = '1' ) THEN
        S2_COPY_LOOP_for_i_5_0_sva_1_5 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt(5);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( ((NOT mux_828_nl) AND core_wen) = '1' ) THEN
        S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt(4
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT(mux_401_nl OR (fsm_output(2)))) OR S1_OUTER_LOOP_for_p_sva_1_mx0c1))
          = '1' ) THEN
        S1_OUTER_LOOP_for_p_sva_1 <= MUX_v_20_2_2(z_out_2, (STD_LOGIC_VECTOR'( "00000")
            & S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl), S1_OUTER_LOOP_for_p_sva_1_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT(or_dcpl_15 OR (NOT (fsm_output(0))) OR (fsm_output(3))
          OR or_35_cse))) = '1' ) THEN
        operator_20_true_1_slc_operator_20_true_1_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 OR S1_OUTER_LOOP_for_acc_cse_sva_mx0c1
          OR S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 OR S1_OUTER_LOOP_for_acc_cse_sva_mx0c3
          OR and_dcpl_122)) = '1' ) THEN
        S1_OUTER_LOOP_for_acc_cse_sva <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"),
            S1_OUTER_LOOP_for_mux1h_3_nl, S1_OUTER_LOOP_for_not_4_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (butterFly_10_f1_sva_mx0c0 OR butterFly_10_f1_sva_mx0c1
          OR butterFly_10_f1_sva_mx0c2)) = '1' ) THEN
        butterFly_10_f1_sva <= MUX1HOT_v_32_3_2(x_rsci_s_din_mxwt, yy_rsci_q_d, xx_rsci_q_d,
            STD_LOGIC_VECTOR'( butterFly_10_f1_sva_mx0c0 & butterFly_10_f1_sva_mx0c1
            & butterFly_10_f1_sva_mx0c2));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        S2_OUTER_LOOP_c_1_sva <= '0';
      ELSIF ( (core_wen AND (((NOT mux_tmp_462) AND and_dcpl_66 AND (fsm_output(3)))
          OR S2_OUTER_LOOP_c_1_sva_mx0c1 OR S2_OUTER_LOOP_c_1_sva_mx0c2)) = '1' )
          THEN
        S2_OUTER_LOOP_c_1_sva <= (S2_OUTER_LOOP_c_1_sva OR (z_out_2(2))) AND (S2_OUTER_LOOP_c_1_sva_mx0c1
            OR S2_OUTER_LOOP_c_1_sva_mx0c2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT(mux_468_nl OR (fsm_output(4)))) OR S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1
          OR S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2)) = '1' ) THEN
        S2_INNER_LOOP1_r_4_2_sva_1_0 <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), S2_INNER_LOOP1_r_mux_nl,
            S2_INNER_LOOP1_r_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_833_nl AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("01"))
          AND core_wen) = '1' ) THEN
        butterFly_12_tw_and_cse_3_2_sva_1 <= reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
            AND (S2_INNER_LOOP1_r_4_2_sva_1_0(1));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_836_nl AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("01"))
          AND core_wen) = '1' ) THEN
        butterFly_12_tw_and_cse_3_2_sva_0 <= butterFly_tw_and_1_cse;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT((mux_506_nl OR (fsm_output(5))) AND mux_513_itm)))
          = '1' ) THEN
        mult_x_1_sva <= MUX_v_32_2_2(yy_rsci_q_d, xx_rsci_q_d, mux_513_itm);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (butterFly_10_tw_asn_itm_mx0c0 OR (NOT mux_554_itm) OR butterFly_10_tw_asn_itm_mx0c2))
          = '1' ) THEN
        butterFly_10_tw_asn_itm <= MUX1HOT_v_32_3_2(twiddle_rsci_s_din_mxwt, modulo_add_3_mux_itm_mx0w1,
            modulo_add_base_1_sva, STD_LOGIC_VECTOR'( butterFly_10_tw_asn_itm_mx0c0
            & (NOT mux_554_itm) & butterFly_10_tw_asn_itm_mx0c2));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (((NOT mux_592_nl) AND and_dcpl_101 AND (fsm_output(2)))
          OR and_dcpl_164)) = '1' ) THEN
        mult_x_15_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_164);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (butterFly_13_tw_h_asn_itm_mx0c0 OR butterFly_13_tw_h_asn_itm_mx0c1
          OR butterFly_13_tw_h_asn_itm_mx0c2)) = '1' ) THEN
        butterFly_13_tw_h_asn_itm <= MUX1HOT_v_32_3_2(twiddle_h_rsci_s_din_mxwt,
            (mult_z_mul_cmp_z(31 DOWNTO 0)), mult_12_z_mul_cmp_z, STD_LOGIC_VECTOR'(
            butterFly_13_tw_h_asn_itm_mx0c0 & butterFly_13_tw_h_asn_itm_mx0c1 & butterFly_13_tw_h_asn_itm_mx0c2));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT mux_623_itm) OR butterFly_10_tw_h_asn_itm_mx0c1 OR
          butterFly_10_tw_h_asn_itm_mx0c2 OR butterFly_10_tw_h_asn_itm_mx0c3 OR butterFly_10_tw_h_asn_itm_mx0c4))
          = '1' ) THEN
        butterFly_10_tw_h_asn_itm <= MUX1HOT_v_32_5_2(twiddle_h_rsci_s_din_mxwt,
            (mult_z_mul_cmp_z(31 DOWNTO 0)), modulo_add_3_mux_itm_mx0w1, modulo_add_base_1_sva,
            mult_12_z_mul_cmp_z, STD_LOGIC_VECTOR'( (NOT mux_623_itm) & butterFly_10_tw_h_asn_itm_mx0c1
            & butterFly_10_tw_h_asn_itm_mx0c2 & butterFly_10_tw_h_asn_itm_mx0c3 &
            butterFly_10_tw_h_asn_itm_mx0c4));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT(mux_655_nl OR (fsm_output(5)))) OR and_dcpl_162))
          = '1' ) THEN
        mult_x_16_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_162);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT(mux_662_nl OR (fsm_output(5)))) OR and_dcpl_167))
          = '1' ) THEN
        butterFly_14_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_167);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (mux_672_nl OR (NOT mux_676_itm))) = '1' ) THEN
        butterFly_14_tw_h_asn_itm <= MUX_v_32_2_2((mult_z_mul_cmp_z(31 DOWNTO 0)),
            twiddle_h_rsci_s_din_mxwt, mux_676_itm);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT mux_697_nl)) = '1' ) THEN
        operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm <=
            mult_z_mul_cmp_z(51 DOWNTO 20);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT(mux_699_nl OR (fsm_output(5)) OR (fsm_output(3))))
          OR and_dcpl_168)) = '1' ) THEN
        butterFly_11_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_168);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT(mux_706_nl OR (fsm_output(5)))) OR and_dcpl_166))
          = '1' ) THEN
        butterFly_15_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_166);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (modulo_add_base_1_sva_mx0c0 OR modulo_add_base_1_sva_mx0c1
          OR and_dcpl_137 OR and_dcpl_138 OR modulo_add_base_1_sva_mx0c4 OR modulo_add_base_1_sva_mx0c5
          OR and_dcpl_75 OR and_dcpl_78 OR modulo_add_base_1_sva_mx0c8 OR modulo_add_base_1_sva_mx0c9
          OR and_dcpl_145 OR and_dcpl_146 OR modulo_add_base_1_sva_mx0c12 OR modulo_add_base_1_sva_mx0c13
          OR and_dcpl_89 OR and_dcpl_91 OR modulo_add_base_1_sva_mx0c16 OR modulo_add_base_1_sva_mx0c17
          OR and_dcpl_151 OR and_dcpl_152 OR modulo_add_base_1_sva_mx0c20 OR modulo_add_base_1_sva_mx0c21
          OR and_dcpl_96 OR and_dcpl_97 OR modulo_add_base_1_sva_mx0c24)) = '1' )
          THEN
        modulo_add_base_1_sva <= MUX1HOT_v_32_25_2((mult_z_mul_cmp_z(31 DOWNTO 0)),
            modulo_add_base_3_sva_mx0w1, modulo_add_base_sva_mx0w2, modulo_add_base_1_sva_mx0w3,
            modulo_add_base_2_sva_mx0w4, modulo_add_base_7_sva_mx0w5, modulo_add_base_4_sva_mx0w6,
            modulo_add_base_5_sva_mx0w7, modulo_add_base_6_sva_mx0w8, modulo_add_base_11_sva_mx0w9,
            modulo_add_base_8_sva_mx0w10, modulo_add_base_9_sva_mx0w11, modulo_add_base_10_sva_mx0w12,
            modulo_add_base_15_sva_mx0w13, modulo_add_base_12_sva_mx0w14, modulo_add_base_13_sva_mx0w15,
            modulo_add_base_14_sva_mx0w16, modulo_add_base_19_sva_mx0w17, modulo_add_base_16_sva_mx0w18,
            modulo_add_base_17_sva_mx0w19, modulo_add_base_18_sva_mx0w20, modulo_add_base_23_sva_mx0w21,
            modulo_add_base_20_sva_mx0w22, modulo_add_base_21_sva_mx0w23, modulo_add_base_22_sva_mx0w24,
            STD_LOGIC_VECTOR'( modulo_add_base_1_sva_mx0c0 & modulo_add_base_1_sva_mx0c1
            & and_dcpl_137 & and_dcpl_138 & modulo_add_base_1_sva_mx0c4 & modulo_add_base_1_sva_mx0c5
            & and_dcpl_75 & and_dcpl_78 & modulo_add_base_1_sva_mx0c8 & modulo_add_base_1_sva_mx0c9
            & and_dcpl_145 & and_dcpl_146 & modulo_add_base_1_sva_mx0c12 & modulo_add_base_1_sva_mx0c13
            & and_dcpl_89 & and_dcpl_91 & modulo_add_base_1_sva_mx0c16 & modulo_add_base_1_sva_mx0c17
            & and_dcpl_151 & and_dcpl_152 & modulo_add_base_1_sva_mx0c20 & modulo_add_base_1_sva_mx0c21
            & and_dcpl_96 & and_dcpl_97 & modulo_add_base_1_sva_mx0c24));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND mux_743_nl) = '1' ) THEN
        operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm <=
            mult_z_mul_cmp_z(51 DOWNTO 20);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_255 AND and_dcpl_184 AND (fsm_output(2)) AND
          (acc_7_cse_32_1(31))) OR modulo_sub_1_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_1_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_1_qif_acc_nl),
            32)), ('0' & (acc_7_cse_32_1(30 DOWNTO 0))), modulo_sub_1_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_262 AND and_dcpl_184 AND (fsm_output(2)) AND
          (acc_5_cse_32_1(31))) OR modulo_sub_2_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_2_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_2_qif_acc_nl),
            32)), ('0' & (acc_5_cse_32_1(30 DOWNTO 0))), modulo_sub_2_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_271 AND and_dcpl_31 AND (NOT (fsm_output(2)))
          AND (acc_5_cse_32_1(31))) OR modulo_sub_5_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_5_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_5_qif_acc_nl),
            32)), ('0' & (acc_5_cse_32_1(30 DOWNTO 0))), modulo_sub_5_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_278 AND and_dcpl_31 AND (NOT (fsm_output(2)))
          AND (acc_8_cse_32_1(31))) OR modulo_sub_6_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_6_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_6_qif_acc_nl),
            32)), ('0' & (acc_8_cse_32_1(30 DOWNTO 0))), modulo_sub_6_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_286 AND and_dcpl_284 AND (NOT (fsm_output(2)))
          AND (acc_6_cse_32_1(31))) OR modulo_sub_9_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_9_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_9_qif_acc_nl),
            32)), ('0' & (acc_6_cse_32_1(30 DOWNTO 0))), modulo_sub_9_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_293 AND and_dcpl_210 AND (NOT (fsm_output(2)))
          AND (acc_7_cse_32_1(31))) OR modulo_sub_10_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_10_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_10_qif_acc_nl),
            32)), ('0' & (acc_7_cse_32_1(30 DOWNTO 0))), modulo_sub_10_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT(or_tmp_466 OR (fsm_output(0)) OR (NOT (fsm_output(3)))
          OR or_tmp_275))) = '1' ) THEN
        operator_20_true_8_slc_operator_20_true_8_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_301 AND and_dcpl_184 AND (fsm_output(2)) AND
          (acc_5_cse_32_1(31))) OR modulo_sub_13_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_13_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_13_qif_acc_nl),
            32)), ('0' & (acc_5_cse_32_1(30 DOWNTO 0))), modulo_sub_13_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_310 AND and_dcpl_284 AND (NOT (fsm_output(2)))
          AND (acc_8_cse_32_1(31))) OR modulo_sub_14_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_14_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_14_qif_acc_nl),
            32)), ('0' & (acc_8_cse_32_1(30 DOWNTO 0))), modulo_sub_14_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_317 AND and_dcpl_31 AND (NOT (fsm_output(2)))
          AND (acc_5_cse_32_1(31))) OR modulo_sub_17_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_17_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_17_qif_acc_nl),
            32)), ('0' & (acc_5_cse_32_1(30 DOWNTO 0))), modulo_sub_17_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_324 AND and_dcpl_184 AND (NOT (fsm_output(2)))
          AND (acc_8_cse_32_1(31))) OR modulo_sub_18_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_18_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_18_qif_acc_nl),
            32)), ('0' & (acc_8_cse_32_1(30 DOWNTO 0))), modulo_sub_18_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_331 AND and_dcpl_210 AND (NOT (fsm_output(2)))
          AND (acc_5_cse_32_1(31))) OR modulo_sub_21_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_21_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_21_qif_acc_nl),
            32)), ('0' & (acc_5_cse_32_1(30 DOWNTO 0))), modulo_sub_21_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_188 AND and_dcpl_210 AND (NOT (fsm_output(2)))
          AND (acc_8_cse_32_1(31))) OR modulo_sub_22_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_22_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_22_qif_acc_nl),
            32)), ('0' & (acc_8_cse_32_1(30 DOWNTO 0))), modulo_sub_22_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT(or_tmp_465 OR (NOT((fsm_output(0)) AND (fsm_output(3))))
          OR or_tmp_275))) = '1' ) THEN
        operator_20_true_15_slc_operator_20_true_15_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
      END IF;
    END IF;
  END PROCESS;
  mux_40_nl <= MUX_s_1_2_2((NOT or_tmp_29), (fsm_output(7)), fsm_output(6));
  or_39_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(4));
  mux_41_nl <= MUX_s_1_2_2(mux_40_nl, and_422_cse, or_39_nl);
  and_416_nl <= (fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(4));
  mux_39_nl <= MUX_s_1_2_2(and_422_cse, mux_tmp_37, and_416_nl);
  mux_42_nl <= MUX_s_1_2_2(mux_41_nl, mux_39_nl, fsm_output(1));
  and_417_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  mux_38_nl <= MUX_s_1_2_2(and_422_cse, mux_tmp_37, and_417_nl);
  mux_43_nl <= MUX_s_1_2_2(mux_42_nl, mux_38_nl, fsm_output(2));
  and_409_nl <= (fsm_output(6)) AND (NOT mux_tmp_57);
  nor_294_nl <= NOT((fsm_output(6)) OR (fsm_output(1)) OR (fsm_output(2)));
  mux_62_nl <= MUX_s_1_2_2(and_409_nl, nor_294_nl, fsm_output(4));
  and_410_nl <= (fsm_output(4)) AND (fsm_output(6)) AND (NOT(and_950_cse OR (fsm_output(2))));
  mux_63_nl <= MUX_s_1_2_2(mux_62_nl, and_410_nl, fsm_output(5));
  nor_296_nl <= NOT((fsm_output(4)) OR (fsm_output(6)) OR nand_96_cse);
  mux_60_nl <= MUX_s_1_2_2((fsm_output(2)), nand_124_cse, fsm_output(6));
  nor_297_nl <= NOT((fsm_output(4)) OR mux_60_nl);
  mux_61_nl <= MUX_s_1_2_2(nor_296_nl, nor_297_nl, fsm_output(5));
  mux_64_nl <= MUX_s_1_2_2(mux_63_nl, mux_61_nl, fsm_output(3));
  mux_58_nl <= MUX_s_1_2_2((NOT (fsm_output(2))), (fsm_output(2)), fsm_output(1));
  nor_298_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("010"))
      OR mux_58_nl);
  nor_299_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"))
      OR mux_tmp_57);
  mux_59_nl <= MUX_s_1_2_2(nor_298_nl, nor_299_nl, fsm_output(3));
  nand_10_nl <= NOT((fsm_output(0)) AND (NOT mux_tmp_70));
  or_86_nl <= (fsm_output(7)) OR nand_95_cse;
  or_85_nl <= (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(4));
  mux_73_nl <= MUX_s_1_2_2(or_86_nl, or_85_nl, fsm_output(3));
  mux_74_nl <= MUX_s_1_2_2(mux_73_nl, or_829_cse, fsm_output(0));
  mux_75_nl <= MUX_s_1_2_2(nand_10_nl, mux_74_nl, fsm_output(5));
  or_87_nl <= (fsm_output(2)) OR mux_75_nl;
  or_84_nl <= (fsm_output(0)) OR mux_tmp_70;
  mux_71_nl <= MUX_s_1_2_2(or_84_nl, or_81_cse, fsm_output(5));
  mux_69_nl <= MUX_s_1_2_2(or_829_cse, or_845_cse, fsm_output(5));
  mux_72_nl <= MUX_s_1_2_2(mux_71_nl, mux_69_nl, fsm_output(2));
  mux_76_nl <= MUX_s_1_2_2(or_87_nl, mux_72_nl, fsm_output(1));
  mux_81_nl <= MUX_s_1_2_2(or_tmp_83, mux_tmp_80, fsm_output(1));
  or_92_nl <= (NOT (fsm_output(0))) OR (fsm_output(7)) OR (NOT (fsm_output(5)));
  mux_85_nl <= MUX_s_1_2_2(or_92_nl, mux_tmp_84, fsm_output(1));
  mux_86_nl <= MUX_s_1_2_2(mux_85_nl, or_tmp_87, fsm_output(2));
  butterFly_tw_h_or_2_nl <= and_dcpl_57 OR ((NOT mux_86_nl) AND and_dcpl_58);
  mux_77_nl <= MUX_s_1_2_2(or_28_cse, or_tmp_77, fsm_output(0));
  and_53_nl <= (NOT(mux_77_nl OR (fsm_output(6)))) AND and_dcpl_48;
  and_405_nl <= (fsm_output(7)) AND (fsm_output(2));
  nor_291_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(2)));
  mux_96_nl <= MUX_s_1_2_2(and_405_nl, nor_291_nl, fsm_output(1));
  and_428_nl <= (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))))
      AND mux_96_nl;
  nor_353_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(5)) OR (fsm_output(7)) OR
      (fsm_output(2)));
  mux_97_nl <= MUX_s_1_2_2(and_428_nl, nor_353_nl, fsm_output(0));
  nor_354_nl <= NOT((fsm_output(6)) OR (fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(7))
      OR (fsm_output(2)));
  nor_355_nl <= NOT((NOT (fsm_output(6))) OR (NOT (fsm_output(5))) OR (fsm_output(1))
      OR (fsm_output(7)) OR (fsm_output(2)));
  mux_95_nl <= MUX_s_1_2_2(nor_354_nl, nor_355_nl, fsm_output(0));
  mux_98_nl <= MUX_s_1_2_2(mux_97_nl, mux_95_nl, fsm_output(4));
  or_109_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(2)));
  mux_93_nl <= MUX_s_1_2_2(or_109_nl, or_107_cse, fsm_output(5));
  or_110_nl <= (fsm_output(6)) OR mux_93_nl;
  or_106_nl <= (fsm_output(5)) OR (NOT (fsm_output(7))) OR (fsm_output(2));
  mux_92_nl <= MUX_s_1_2_2(or_106_nl, nand_116_cse, fsm_output(6));
  mux_94_nl <= MUX_s_1_2_2(or_110_nl, mux_92_nl, fsm_output(0));
  nor_356_nl <= NOT((fsm_output(4)) OR mux_94_nl);
  mux_99_nl <= MUX_s_1_2_2(mux_98_nl, nor_356_nl, fsm_output(3));
  mux_100_nl <= MUX_s_1_2_2(or_tmp_82, or_1041_cse, fsm_output(0));
  mux_101_nl <= MUX_s_1_2_2(or_tmp_83, mux_100_nl, fsm_output(1));
  or_117_nl <= (fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(6)) OR (NOT nor_tmp_9);
  mux_102_nl <= MUX_s_1_2_2(mux_101_nl, or_117_nl, fsm_output(2));
  mux_103_nl <= MUX_s_1_2_2(or_28_cse, mux_tmp_84, or_442_cse);
  mux_104_nl <= MUX_s_1_2_2(mux_103_nl, or_tmp_87, fsm_output(2));
  and_69_nl <= (NOT mux_104_nl) AND and_dcpl_58;
  nor_289_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(0)) OR
      (NOT and_425_cse));
  nor_290_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(3)) OR (NOT (fsm_output(0)))
      OR (fsm_output(6)) OR (fsm_output(5)));
  mux_105_nl <= MUX_s_1_2_2(nor_289_nl, nor_290_nl, fsm_output(2));
  S34_OUTER_LOOP_for_tf_mux_1_nl <= MUX_v_5_2_2((reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg),
      (S1_OUTER_LOOP_k_5_0_sva_2(4 DOWNTO 0)), and_dcpl_25);
  not_1496_nl <= NOT and_dcpl_195;
  S34_OUTER_LOOP_for_k_mux_nl <= MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1(4 DOWNTO
      0)), (S1_OUTER_LOOP_k_5_0_sva_2(4 DOWNTO 0)), and_dcpl_25);
  not_1732_nl <= NOT and_dcpl_195;
  mux_839_nl <= MUX_s_1_2_2(or_tmp_975, or_tmp_188, fsm_output(1));
  and_957_nl <= (fsm_output(0)) AND (fsm_output(4)) AND (NOT (fsm_output(6))) AND
      (fsm_output(5)) AND (NOT mux_839_nl);
  or_1173_nl <= (NOT (fsm_output(6))) OR (fsm_output(5)) OR (NOT (fsm_output(1)))
      OR (fsm_output(7)) OR (NOT (fsm_output(2)));
  mux_842_nl <= MUX_s_1_2_2(or_tmp_975, or_107_cse, fsm_output(1));
  or_1174_nl <= (fsm_output(5)) OR mux_842_nl;
  mux_841_nl <= MUX_s_1_2_2(or_1174_nl, nand_116_cse, fsm_output(6));
  mux_840_nl <= MUX_s_1_2_2(or_1173_nl, mux_841_nl, fsm_output(4));
  nor_498_nl <= NOT((fsm_output(0)) OR mux_840_nl);
  mux_838_nl <= MUX_s_1_2_2(and_957_nl, nor_498_nl, fsm_output(3));
  mux_844_nl <= MUX_s_1_2_2(or_tmp_983, or_tmp_197, fsm_output(7));
  nor_499_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("101"))
      OR mux_844_nl);
  mux_846_nl <= MUX_s_1_2_2(or_1031_cse, or_tmp_983, fsm_output(7));
  and_959_nl <= (fsm_output(2)) AND (NOT mux_846_nl);
  mux_847_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(5));
  nor_500_nl <= NOT((fsm_output(2)) OR (fsm_output(7)) OR (NOT((fsm_output(0)) AND
      mux_847_nl)));
  mux_845_nl <= MUX_s_1_2_2(and_959_nl, nor_500_nl, fsm_output(4));
  and_958_nl <= (fsm_output(3)) AND mux_845_nl;
  mux_843_nl <= MUX_s_1_2_2(nor_499_nl, and_958_nl, fsm_output(1));
  nor_501_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(6)))
      OR (fsm_output(2)));
  and_961_nl <= (fsm_output(1)) AND (fsm_output(7)) AND (NOT (fsm_output(6))) AND
      (fsm_output(2));
  mux_849_nl <= MUX_s_1_2_2(nor_501_nl, and_961_nl, fsm_output(3));
  and_960_nl <= (fsm_output(0)) AND (fsm_output(5)) AND mux_849_nl;
  nor_502_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(2)));
  nor_503_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(6)) OR (NOT (fsm_output(2))));
  mux_853_nl <= MUX_s_1_2_2(nor_502_nl, nor_503_nl, fsm_output(1));
  nor_504_nl <= NOT((fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(6)) OR (NOT
      (fsm_output(2))));
  mux_852_nl <= MUX_s_1_2_2(mux_853_nl, nor_504_nl, fsm_output(3));
  nor_505_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(1)) OR (fsm_output(7)) OR
      (NOT((fsm_output(6)) AND (fsm_output(2)))));
  mux_851_nl <= MUX_s_1_2_2(mux_852_nl, nor_505_nl, fsm_output(5));
  nor_506_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(3)) OR (fsm_output(1)) OR
      (fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(2))));
  mux_850_nl <= MUX_s_1_2_2(mux_851_nl, nor_506_nl, fsm_output(0));
  mux_848_nl <= MUX_s_1_2_2(and_960_nl, mux_850_nl, fsm_output(4));
  mult_3_res_mux1h_2_nl <= MUX1HOT_v_32_3_2(butterFly_14_tw_h_asn_itm, modulo_add_base_1_sva,
      butterFly_10_tw_h_asn_itm, STD_LOGIC_VECTOR'( mux_838_nl & mux_843_nl & mux_848_nl));
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_3_res_mux1h_2_nl & '1')
      + UNSIGNED((NOT (mult_z_mul_cmp_z(31 DOWNTO 0))) & '1'), 33));
  modulo_sub_3_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  and_969_nl <= (fsm_output(1)) AND (fsm_output(3)) AND and_dcpl_406 AND and_dcpl_358
      AND and_dcpl_186;
  modulo_add_3_mux1h_3_nl <= MUX1HOT_v_32_3_2((NOT modulo_add_base_3_sva_mx0w1),
      (NOT modulo_add_base_2_sva_mx0w4), (NOT modulo_add_base_22_sva_mx0w24), STD_LOGIC_VECTOR'(
      (NOT (fsm_output(1))) & and_969_nl & (NOT (fsm_output(3)))));
  acc_14_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_3_mux1h_3_nl
      & '1'), 33), 34), 34));
  modulo_sub_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_6_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_add_mux1h_3_nl <= MUX1HOT_v_32_3_2((NOT modulo_add_base_sva_mx0w2), (NOT
      modulo_add_base_15_sva_mx0w13), (NOT modulo_add_base_23_sva_mx0w21), STD_LOGIC_VECTOR'(
      (NOT (fsm_output(5))) & (fsm_output(6)) & (fsm_output(7))));
  acc_16_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_mux1h_3_nl
      & '1'), 33), 34), 34));
  and_981_nl <= and_dcpl_184 AND (fsm_output(2)) AND (NOT (fsm_output(6))) AND (NOT
      (fsm_output(7))) AND (NOT (fsm_output(5))) AND and_dcpl_253;
  and_982_nl <= and_dcpl_284 AND and_dcpl_441 AND and_dcpl_628 AND (NOT (fsm_output(4)))
      AND (NOT (fsm_output(0)));
  and_983_nl <= and_dcpl_184 AND and_dcpl_441 AND and_dcpl_628 AND and_dcpl_253;
  modulo_add_1_mux1h_3_nl <= MUX1HOT_v_32_3_2((NOT modulo_add_base_1_sva_mx0w3),
      (NOT modulo_add_base_14_sva_mx0w16), (NOT modulo_add_base_18_sva_mx0w20), STD_LOGIC_VECTOR'(
      and_981_nl & and_982_nl & and_983_nl));
  acc_18_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_1_mux1h_3_nl
      & '1'), 33), 34), 34));
  modulo_sub_7_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_6_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  and_984_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND and_dcpl_370
      AND (NOT (fsm_output(7))) AND (fsm_output(5)) AND and_dcpl_253;
  and_985_nl <= nor_304_cse AND (NOT (fsm_output(3))) AND (fsm_output(6)) AND (NOT
      (fsm_output(7))) AND (NOT (fsm_output(5))) AND and_dcpl_186;
  and_986_nl <= nor_304_cse AND (fsm_output(3)) AND (NOT (fsm_output(6))) AND (fsm_output(7))
      AND (NOT (fsm_output(5))) AND and_dcpl_253;
  and_987_nl <= nor_304_cse AND and_dcpl_370 AND (fsm_output(7)) AND (fsm_output(5))
      AND and_dcpl_186;
  modulo_add_7_mux1h_3_nl <= MUX1HOT_v_32_4_2((NOT modulo_add_base_7_sva_mx0w5),
      (NOT modulo_add_base_9_sva_mx0w11), (NOT modulo_add_base_16_sva_mx0w18), (NOT
      modulo_add_base_20_sva_mx0w22), STD_LOGIC_VECTOR'( and_984_nl & and_985_nl
      & and_986_nl & and_987_nl));
  acc_19_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_7_mux1h_3_nl
      & '1'), 33), 34), 34));
  modulo_sub_4_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_7_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  and_977_nl <= and_953_cse AND (NOT (fsm_output(3))) AND (NOT (fsm_output(6))) AND
      and_dcpl_731;
  and_978_nl <= nor_304_cse AND (fsm_output(3)) AND (NOT (fsm_output(6))) AND and_dcpl_737;
  and_979_nl <= and_715_cse_1 AND and_dcpl_737;
  and_980_nl <= and_715_cse_1 AND and_dcpl_731;
  modulo_add_4_mux1h_3_nl <= MUX1HOT_v_32_4_2((NOT modulo_add_base_4_sva_mx0w6),
      (NOT modulo_add_base_5_sva_mx0w7), (NOT modulo_add_base_12_sva_mx0w14), (NOT
      modulo_add_base_13_sva_mx0w15), STD_LOGIC_VECTOR'( and_977_nl & and_978_nl
      & and_979_nl & and_980_nl));
  acc_17_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_4_mux1h_3_nl
      & '1'), 33), 34), 34));
  and_988_nl <= nor_304_cse AND (fsm_output(3)) AND (NOT (fsm_output(6))) AND (NOT
      (fsm_output(7))) AND (fsm_output(5)) AND (fsm_output(4)) AND (fsm_output(0));
  and_989_nl <= nor_304_cse AND and_dcpl_382 AND nor_425_cse;
  and_990_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01")) AND and_dcpl_382
      AND nor_425_cse;
  modulo_add_6_mux1h_3_nl <= MUX1HOT_v_32_3_2((NOT modulo_add_base_6_sva_mx0w8),
      (NOT modulo_add_base_8_sva_mx0w10), (NOT modulo_add_base_10_sva_mx0w12), STD_LOGIC_VECTOR'(
      and_988_nl & and_989_nl & and_990_nl));
  acc_21_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_6_mux1h_3_nl
      & '1'), 33), 34), 34));
  modulo_sub_11_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_5_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_add_11_mux1h_3_nl <= MUX1HOT_v_32_3_2((NOT modulo_add_base_11_sva_mx0w9),
      (NOT modulo_add_base_17_sva_mx0w19), (NOT modulo_add_base_21_sva_mx0w23), STD_LOGIC_VECTOR'(
      (NOT (fsm_output(7))) & (NOT (fsm_output(1))) & (fsm_output(5))));
  acc_20_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_11_mux1h_3_nl
      & '1'), 33), 34), 34));
  modulo_sub_8_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_15_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_6_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_12_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_7_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_19_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_6_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_add_19_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT modulo_add_base_19_sva_mx0w17),
      32), 33) + UNSIGNED'( "000000000000000000000000000000001"), 33));
  modulo_sub_16_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_7_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_23_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_6_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_20_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_7_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  and_203_nl <= and_dcpl_24 AND and_dcpl_148;
  mux_781_nl <= MUX_s_1_2_2((fsm_output(2)), (NOT (fsm_output(2))), fsm_output(1));
  nor_476_nl <= NOT((fsm_output(0)) OR mux_781_nl);
  mux_782_nl <= MUX_s_1_2_2(nor_476_nl, or_1016_cse, fsm_output(3));
  or_1104_nl <= (fsm_output(5)) OR mux_782_nl;
  nor_477_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
  mux_779_nl <= MUX_s_1_2_2(and_357_cse, (fsm_output(2)), fsm_output(3));
  mux_780_nl <= MUX_s_1_2_2(nor_477_nl, mux_779_nl, fsm_output(5));
  mux_783_nl <= MUX_s_1_2_2(or_1104_nl, mux_780_nl, fsm_output(6));
  or_1100_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10")) OR (NOT(CONV_SL_1_1(fsm_output(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))));
  mux_784_nl <= MUX_s_1_2_2(mux_783_nl, or_1100_nl, fsm_output(4));
  nor_479_nl <= NOT((fsm_output(6)) OR ((fsm_output(5)) AND (CONV_SL_1_1(fsm_output(3
      DOWNTO 1)/=STD_LOGIC_VECTOR'("000")))));
  nor_481_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")));
  mux_nl <= MUX_s_1_2_2(nor_481_nl, and_953_cse, fsm_output(0));
  nor_480_nl <= NOT((fsm_output(6)) OR ((fsm_output(5)) AND (NOT((fsm_output(3))
      AND mux_nl))));
  mux_778_nl <= MUX_s_1_2_2(nor_479_nl, nor_480_nl, fsm_output(4));
  mux_785_nl <= MUX_s_1_2_2(mux_784_nl, mux_778_nl, fsm_output(7));
  S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl <= MUX_s_1_2_2((S1_OUTER_LOOP_k_5_0_sva_2(3)),
      (z_out(3)), mux_351_ssc);
  or_1114_nl <= (fsm_output(1)) OR (fsm_output(3));
  mux_793_nl <= MUX_s_1_2_2(or_1114_nl, mux_tmp_788, fsm_output(2));
  mux_794_nl <= MUX_s_1_2_2(mux_793_nl, or_tmp_1011, fsm_output(0));
  mux_795_nl <= MUX_s_1_2_2((NOT mux_794_nl), (fsm_output(3)), fsm_output(7));
  or_1170_nl <= and_357_cse OR (fsm_output(3));
  nor_482_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
  mux_792_nl <= MUX_s_1_2_2(or_1170_nl, nor_482_nl, fsm_output(7));
  mux_796_nl <= MUX_s_1_2_2(mux_795_nl, mux_792_nl, fsm_output(5));
  nor_483_nl <= NOT((fsm_output(7)) OR (fsm_output(0)) OR (fsm_output(2)) OR (fsm_output(1))
      OR (fsm_output(3)));
  or_1109_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("110"));
  nand_143_nl <= NOT((fsm_output(2)) AND (NOT mux_tmp_788));
  mux_790_nl <= MUX_s_1_2_2(or_1109_nl, nand_143_nl, fsm_output(0));
  nor_484_nl <= NOT((fsm_output(7)) OR mux_790_nl);
  mux_791_nl <= MUX_s_1_2_2(nor_483_nl, nor_484_nl, fsm_output(5));
  mux_797_nl <= MUX_s_1_2_2(mux_796_nl, mux_791_nl, fsm_output(6));
  nand_150_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111")));
  mux_786_nl <= MUX_s_1_2_2(or_tmp_1011, nand_150_nl, fsm_output(0));
  nand_142_nl <= NOT((fsm_output(7)) AND mux_786_nl);
  mux_787_nl <= MUX_s_1_2_2((fsm_output(7)), nand_142_nl, fsm_output(5));
  nor_485_nl <= NOT((fsm_output(5)) OR (fsm_output(7)) OR (NOT (fsm_output(0))) OR
      (fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(3))));
  mux_788_nl <= MUX_s_1_2_2(mux_787_nl, nor_485_nl, fsm_output(6));
  mux_798_nl <= MUX_s_1_2_2(mux_797_nl, mux_788_nl, fsm_output(4));
  mux_353_nl <= MUX_s_1_2_2(or_587_cse, or_392_cse, fsm_output(5));
  or_426_nl <= (fsm_output(2)) OR mux_353_nl;
  or_423_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(0)))
      OR (fsm_output(7)) OR (fsm_output(6));
  mux_354_nl <= MUX_s_1_2_2(or_426_nl, or_423_nl, fsm_output(1));
  mux_13_nl <= MUX_s_1_2_2(or_392_cse, or_401_cse, fsm_output(5));
  or_420_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_355_nl <= MUX_s_1_2_2(mux_354_nl, mux_13_nl, or_420_nl);
  S2_COPY_LOOP_p_or_nl <= mux_351_ssc OR (NOT mux_355_nl);
  S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl <= MUX_v_3_2_2((S1_OUTER_LOOP_k_5_0_sva_2(2
      DOWNTO 0)), (z_out(2 DOWNTO 0)), S2_COPY_LOOP_p_or_nl);
  nor_486_nl <= NOT((fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(4))
      OR (fsm_output(6)) OR (fsm_output(7)));
  mux_803_nl <= MUX_s_1_2_2(nor_487_cse, nor_488_cse, fsm_output(0));
  nor_489_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(4)) OR (fsm_output(6)) OR
      (fsm_output(7)));
  mux_804_nl <= MUX_s_1_2_2(mux_803_nl, nor_489_nl, fsm_output(1));
  nor_490_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(0)) OR (NOT (fsm_output(4)))
      OR (fsm_output(6)) OR (NOT (fsm_output(7))));
  mux_805_nl <= MUX_s_1_2_2(mux_804_nl, nor_490_nl, fsm_output(5));
  mux_806_nl <= MUX_s_1_2_2(nor_486_nl, mux_805_nl, fsm_output(3));
  nor_491_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(0)) OR (fsm_output(4)) OR
      (fsm_output(6)) OR (fsm_output(7)));
  nor_492_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(0))) OR (fsm_output(4))
      OR (fsm_output(7)));
  mux_801_nl <= MUX_s_1_2_2(nor_491_nl, nor_492_nl, fsm_output(5));
  nor_493_nl <= NOT((fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(6))
      OR (fsm_output(7)));
  and_955_nl <= (fsm_output(0)) AND (fsm_output(4)) AND (NOT (fsm_output(6))) AND
      (fsm_output(7));
  mux_799_nl <= MUX_s_1_2_2(nor_494_cse, and_955_nl, fsm_output(1));
  mux_800_nl <= MUX_s_1_2_2(nor_493_nl, mux_799_nl, fsm_output(5));
  mux_802_nl <= MUX_s_1_2_2(mux_801_nl, mux_800_nl, fsm_output(3));
  mux_807_nl <= MUX_s_1_2_2(mux_806_nl, mux_802_nl, fsm_output(2));
  nor_467_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100")));
  or_1142_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_814_nl <= MUX_s_1_2_2(nor_467_nl, or_1142_nl, fsm_output(6));
  nor_466_nl <= NOT((fsm_output(7)) OR mux_814_nl);
  and_948_nl <= (fsm_output(6)) AND or_46_cse;
  nor_468_nl <= NOT((fsm_output(6)) OR (fsm_output(2)) OR (fsm_output(0)) OR (NOT
      (fsm_output(1))));
  mux_813_nl <= MUX_s_1_2_2(and_948_nl, nor_468_nl, fsm_output(7));
  mux_815_nl <= MUX_s_1_2_2(nor_466_nl, mux_813_nl, fsm_output(5));
  nor_469_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(0)))
      OR (fsm_output(1)));
  nor_470_nl <= NOT((fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(0))) OR
      (fsm_output(1)));
  mux_811_nl <= MUX_s_1_2_2(nor_469_nl, nor_470_nl, fsm_output(7));
  or_1134_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  mux_809_nl <= MUX_s_1_2_2(or_442_cse, or_1134_nl, fsm_output(2));
  mux_810_nl <= MUX_s_1_2_2(or_tmp_1036, mux_809_nl, fsm_output(6));
  nor_471_nl <= NOT((fsm_output(7)) OR mux_810_nl);
  mux_812_nl <= MUX_s_1_2_2(mux_811_nl, nor_471_nl, fsm_output(5));
  mux_816_nl <= MUX_s_1_2_2(mux_815_nl, mux_812_nl, fsm_output(3));
  nor_472_nl <= NOT((fsm_output(7)) OR (NOT((fsm_output(6)) AND or_tmp_1036)));
  nor_473_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT((NOT((NOT (fsm_output(2))) OR (fsm_output(0)))) OR (fsm_output(1)))));
  mux_808_nl <= MUX_s_1_2_2(nor_472_nl, nor_473_nl, fsm_output(5));
  and_949_nl <= (fsm_output(3)) AND mux_808_nl;
  mux_817_nl <= MUX_s_1_2_2(mux_816_nl, and_949_nl, fsm_output(4));
  or_1159_nl <= (fsm_output(5)) OR (fsm_output(0)) OR (fsm_output(1));
  mux_824_nl <= MUX_s_1_2_2(or_1159_nl, or_tmp_1056, fsm_output(6));
  mux_825_nl <= MUX_s_1_2_2(mux_824_nl, or_tmp_1052, fsm_output(7));
  nor_464_nl <= NOT((fsm_output(5)) OR nor_217_cse);
  mux_823_nl <= MUX_s_1_2_2(nor_464_nl, nor_tmp_102, fsm_output(6));
  or_1158_nl <= (fsm_output(7)) OR (NOT mux_823_nl);
  mux_826_nl <= MUX_s_1_2_2(mux_825_nl, or_1158_nl, fsm_output(2));
  or_1155_nl <= (NOT (fsm_output(5))) OR (fsm_output(0)) OR (fsm_output(1));
  or_1154_nl <= (fsm_output(6)) OR (fsm_output(5)) OR (NOT (fsm_output(0))) OR (fsm_output(1));
  mux_821_nl <= MUX_s_1_2_2(or_1155_nl, or_1154_nl, fsm_output(7));
  or_1151_nl <= (NOT (fsm_output(5))) OR (fsm_output(0)) OR (NOT (fsm_output(1)));
  mux_820_nl <= MUX_s_1_2_2(or_tmp_1056, or_1151_nl, fsm_output(6));
  or_1153_nl <= (fsm_output(7)) OR mux_820_nl;
  mux_822_nl <= MUX_s_1_2_2(mux_821_nl, or_1153_nl, fsm_output(2));
  mux_827_nl <= MUX_s_1_2_2(mux_826_nl, mux_822_nl, fsm_output(3));
  or_1149_nl <= (NOT (fsm_output(6))) OR (fsm_output(5)) OR (NOT (fsm_output(0)))
      OR (fsm_output(1));
  mux_818_nl <= MUX_s_1_2_2(or_1149_nl, or_tmp_1052, fsm_output(7));
  or_1146_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")) OR (NOT
      nor_tmp_102);
  mux_819_nl <= MUX_s_1_2_2(mux_818_nl, or_1146_nl, fsm_output(2));
  nand_145_nl <= NOT((fsm_output(3)) AND (NOT mux_819_nl));
  mux_828_nl <= MUX_s_1_2_2(mux_827_nl, nand_145_nl, fsm_output(4));
  or_62_nl <= (fsm_output(0)) OR (fsm_output(4)) OR (NOT (fsm_output(6))) OR (fsm_output(7))
      OR (NOT (fsm_output(5)));
  or_60_nl <= (fsm_output(0)) OR (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT
      nor_tmp_9);
  mux_54_nl <= MUX_s_1_2_2(or_62_nl, or_60_nl, fsm_output(3));
  mux_55_nl <= MUX_s_1_2_2(or_tmp_52, mux_54_nl, fsm_output(1));
  and_18_nl <= (NOT mux_55_nl) AND (fsm_output(2));
  S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl <= MUX_v_15_2_2(STD_LOGIC_VECTOR'("000000000000000"),
      (S1_OUTER_LOOP_for_p_sva_1(19 DOWNTO 5)), and_18_nl);
  mux_400_nl <= MUX_s_1_2_2(or_tmp_466, or_tmp_465, fsm_output(0));
  nand_40_nl <= NOT((fsm_output(3)) AND (NOT mux_400_nl));
  mux_401_nl <= MUX_s_1_2_2(or_tmp_52, nand_40_nl, fsm_output(1));
  or_1172_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  nand_152_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")));
  mux_837_nl <= MUX_s_1_2_2(or_1172_nl, nand_152_nl, fsm_output(0));
  and_956_nl <= (NOT(mux_837_nl OR (fsm_output(1)))) AND CONV_SL_1_1(fsm_output(3
      DOWNTO 2)=STD_LOGIC_VECTOR'("10")) AND and_dcpl_66;
  S1_OUTER_LOOP_for_mux_15_nl <= MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1(4 DOWNTO
      0)), (revArr_rsci_s_din_mxwt(9 DOWNTO 5)), and_956_nl);
  S1_OUTER_LOOP_for_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg)
      + UNSIGNED(S1_OUTER_LOOP_for_mux_15_nl), 5));
  S6_OUTER_LOOP_for_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(S1_OUTER_LOOP_for_p_sva_1(4
      DOWNTO 0)) + UNSIGNED(reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg), 5));
  S1_OUTER_LOOP_for_or_nl <= S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 OR S1_OUTER_LOOP_for_acc_cse_sva_mx0c2;
  S1_OUTER_LOOP_for_mux1h_3_nl <= MUX1HOT_v_5_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(S1_OUTER_LOOP_for_acc_nl),
      5)), S2_COPY_LOOP_for_i_5_0_sva_1_4_0, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(S6_OUTER_LOOP_for_acc_nl),
      5)), STD_LOGIC_VECTOR'( S1_OUTER_LOOP_for_or_nl & S1_OUTER_LOOP_for_acc_cse_sva_mx0c3
      & and_dcpl_122));
  S1_OUTER_LOOP_for_not_4_nl <= NOT S1_OUTER_LOOP_for_acc_cse_sva_mx0c1;
  S2_OUTER_LOOP_c_nor_nl <= NOT(mux_tmp_462 OR (fsm_output(7)) OR (fsm_output(4))
      OR (NOT (fsm_output(3))));
  S2_INNER_LOOP1_r_mux_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'( '0' & S2_OUTER_LOOP_c_nor_nl),
      (z_out_2(1 DOWNTO 0)), S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2);
  S2_INNER_LOOP1_r_not_nl <= NOT S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1;
  or_1028_nl <= S2_OUTER_LOOP_c_1_sva OR (NOT (z_out_2(2))) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR mux_467_cse;
  or_1029_nl <= (NOT (fsm_output(1))) OR (fsm_output(5)) OR (fsm_output(7)) OR (NOT
      (fsm_output(0))) OR (fsm_output(6));
  or_1030_nl <= (fsm_output(1)) OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(0))
      OR (NOT (fsm_output(6)));
  mux_466_nl <= MUX_s_1_2_2(or_1029_nl, or_1030_nl, fsm_output(2));
  mux_468_nl <= MUX_s_1_2_2(or_1028_nl, mux_466_nl, fsm_output(3));
  nand_146_nl <= NOT((fsm_output(1)) AND (fsm_output(7)));
  mux_831_nl <= MUX_s_1_2_2(nand_146_nl, (fsm_output(7)), fsm_output(5));
  or_1162_nl <= (fsm_output(1)) OR (fsm_output(7));
  mux_830_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), or_1162_nl, fsm_output(5));
  mux_832_nl <= MUX_s_1_2_2(mux_831_nl, mux_830_nl, fsm_output(0));
  nor_461_nl <= NOT((fsm_output(6)) OR mux_832_nl);
  mux_833_nl <= MUX_s_1_2_2(nor_461_nl, mux_829_cse, fsm_output(2));
  or_1168_nl <= (NOT (fsm_output(5))) OR (fsm_output(1)) OR (fsm_output(7));
  or_1167_nl <= (fsm_output(5)) OR (fsm_output(1)) OR (NOT (fsm_output(7)));
  mux_835_nl <= MUX_s_1_2_2(or_1168_nl, or_1167_nl, fsm_output(0));
  nor_458_nl <= NOT((fsm_output(6)) OR mux_835_nl);
  mux_836_nl <= MUX_s_1_2_2(nor_458_nl, mux_829_cse, fsm_output(2));
  or_644_nl <= (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(6)) OR (NOT (fsm_output(7)));
  mux_504_nl <= MUX_s_1_2_2(or_900_cse, or_644_nl, fsm_output(3));
  mux_505_nl <= MUX_s_1_2_2(or_tmp_622, mux_504_nl, fsm_output(1));
  or_640_nl <= (NOT (fsm_output(3))) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(6))
      OR (fsm_output(7));
  mux_503_nl <= MUX_s_1_2_2(or_tmp_619, or_640_nl, fsm_output(1));
  mux_506_nl <= MUX_s_1_2_2(mux_505_nl, mux_503_nl, fsm_output(2));
  mux_591_nl <= MUX_s_1_2_2(or_533_cse, or_tmp_222, fsm_output(3));
  mux_592_nl <= MUX_s_1_2_2(mux_591_nl, or_tmp_220, fsm_output(1));
  mux_654_nl <= MUX_s_1_2_2(or_tmp_811, or_tmp_619, fsm_output(1));
  or_833_nl <= (fsm_output(1)) OR (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(4))
      OR (NOT (fsm_output(6))) OR (fsm_output(7));
  mux_655_nl <= MUX_s_1_2_2(mux_654_nl, or_833_nl, fsm_output(2));
  mux_661_nl <= MUX_s_1_2_2(or_845_cse, or_tmp_622, fsm_output(1));
  or_844_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(0)))
      OR (fsm_output(4)) OR (fsm_output(6)) OR (NOT (fsm_output(7)));
  mux_662_nl <= MUX_s_1_2_2(mux_661_nl, or_844_nl, fsm_output(2));
  mux_579_nl <= MUX_s_1_2_2(or_467_cse, or_392_cse, fsm_output(5));
  nor_110_nl <= NOT((fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(0)) OR mux_579_nl);
  mux_671_nl <= MUX_s_1_2_2(nor_109_cse, nor_110_nl, fsm_output(2));
  or_861_nl <= (NOT (fsm_output(4))) OR (fsm_output(0)) OR (fsm_output(5)) OR (fsm_output(7))
      OR (fsm_output(6));
  or_743_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("001"));
  mux_668_nl <= MUX_s_1_2_2(or_743_nl, or_22_cse, fsm_output(0));
  or_860_nl <= (fsm_output(4)) OR mux_668_nl;
  mux_669_nl <= MUX_s_1_2_2(or_861_nl, or_860_nl, fsm_output(3));
  nor_111_nl <= NOT((fsm_output(2)) OR mux_669_nl);
  mux_672_nl <= MUX_s_1_2_2(mux_671_nl, nor_111_nl, fsm_output(1));
  mux_694_nl <= MUX_s_1_2_2(or_tmp_873, or_tmp_871, fsm_output(3));
  mux_695_nl <= MUX_s_1_2_2(or_tmp_868, mux_694_nl, fsm_output(2));
  mux_692_nl <= MUX_s_1_2_2(or_900_cse, mux_325_cse, fsm_output(5));
  mux_693_nl <= MUX_s_1_2_2(or_tmp_872, mux_692_nl, fsm_output(3));
  or_901_nl <= (fsm_output(2)) OR mux_693_nl;
  mux_696_nl <= MUX_s_1_2_2(mux_695_nl, or_901_nl, fsm_output(1));
  mux_688_nl <= MUX_s_1_2_2(or_tmp_873, or_tmp_872, fsm_output(3));
  or_892_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("1010"));
  mux_687_nl <= MUX_s_1_2_2(or_tmp_871, or_892_nl, fsm_output(3));
  mux_689_nl <= MUX_s_1_2_2(mux_688_nl, mux_687_nl, fsm_output(2));
  mux_685_nl <= MUX_s_1_2_2(or_889_cse, or_888_cse, fsm_output(5));
  or_890_nl <= (fsm_output(3)) OR mux_685_nl;
  mux_686_nl <= MUX_s_1_2_2(or_tmp_868, or_890_nl, fsm_output(2));
  mux_690_nl <= MUX_s_1_2_2(mux_689_nl, mux_686_nl, fsm_output(1));
  mux_697_nl <= MUX_s_1_2_2(mux_696_nl, mux_690_nl, fsm_output(0));
  or_1037_nl <= (fsm_output(0)) OR (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT
      (fsm_output(7)));
  or_1038_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(4))) OR (fsm_output(6))
      OR (fsm_output(7));
  mux_698_nl <= MUX_s_1_2_2(or_1037_nl, or_1038_nl, fsm_output(1));
  or_1039_nl <= (NOT (fsm_output(1))) OR (fsm_output(0)) OR (fsm_output(4)) OR (NOT
      (fsm_output(6))) OR (fsm_output(7));
  mux_699_nl <= MUX_s_1_2_2(mux_698_nl, or_1039_nl, fsm_output(2));
  or_918_nl <= (fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(0)) OR (fsm_output(4))
      OR (NOT (fsm_output(6))) OR (fsm_output(7));
  or_917_nl <= (NOT (fsm_output(3))) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(6))
      OR (NOT (fsm_output(7)));
  mux_705_nl <= MUX_s_1_2_2(or_tmp_811, or_917_nl, fsm_output(1));
  mux_706_nl <= MUX_s_1_2_2(or_918_nl, mux_705_nl, fsm_output(2));
  nor_90_nl <= NOT((fsm_output(4)) OR (fsm_output(7)) OR (fsm_output(6)));
  mux_741_nl <= MUX_s_1_2_2(nor_488_cse, nor_90_nl, fsm_output(2));
  and_429_nl <= (fsm_output(5)) AND (fsm_output(3)) AND mux_741_nl;
  mux_739_nl <= MUX_s_1_2_2(or_964_cse, or_889_cse, fsm_output(2));
  nor_357_nl <= NOT((fsm_output(3)) OR mux_739_nl);
  nor_358_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(2))) OR (fsm_output(4)) OR
      (NOT (fsm_output(7))) OR (fsm_output(6)));
  mux_740_nl <= MUX_s_1_2_2(nor_357_nl, nor_358_nl, fsm_output(5));
  mux_742_nl <= MUX_s_1_2_2(and_429_nl, mux_740_nl, fsm_output(1));
  mux_736_nl <= MUX_s_1_2_2(nor_494_cse, nor_487_cse, fsm_output(2));
  and_430_nl <= (fsm_output(3)) AND mux_736_nl;
  nor_359_nl <= NOT((fsm_output(3)) OR (fsm_output(2)) OR (NOT (fsm_output(4))) OR
      (fsm_output(7)) OR (fsm_output(6)));
  mux_737_nl <= MUX_s_1_2_2(and_430_nl, nor_359_nl, fsm_output(5));
  nor_93_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR
      (NOT (fsm_output(6))));
  nor_94_nl <= NOT((fsm_output(2)) OR (fsm_output(4)) OR (NOT (fsm_output(7))) OR
      (fsm_output(6)));
  mux_735_nl <= MUX_s_1_2_2(nor_93_nl, nor_94_nl, fsm_output(3));
  and_431_nl <= (fsm_output(5)) AND mux_735_nl;
  mux_738_nl <= MUX_s_1_2_2(mux_737_nl, and_431_nl, fsm_output(1));
  mux_743_nl <= MUX_s_1_2_2(mux_742_nl, mux_738_nl, fsm_output(0));
  modulo_sub_1_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_7_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_2_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_5_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_5_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_5_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_6_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_9_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_6_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_10_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_7_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_13_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_5_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_14_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_17_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_5_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_18_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_21_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_5_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_22_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  not_1929_nl <= NOT not_tmp_396;
  S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl <= MUX_v_15_2_2(STD_LOGIC_VECTOR'("000000000000000"),
      (S1_OUTER_LOOP_for_p_sva_1(14 DOWNTO 0)), not_1929_nl);
  not_1930_nl <= NOT not_tmp_396;
  S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4 DOWNTO 2)), not_1930_nl);
  S1_OUTER_LOOP_for_mux_16_nl <= MUX_v_2_2_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0(1
      DOWNTO 0)), S2_INNER_LOOP1_r_4_2_sva_1_0, not_tmp_396);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl
      & S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl & S1_OUTER_LOOP_for_mux_16_nl)
      + UNSIGNED'( "00000000000000000001"), 20));
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_3_res_sva & '1') + UNSIGNED((NOT
      m_sva) & '1'), 33));
  z_out_4 <= acc_3_nl(32 DOWNTO 1);
  mult_if_or_2_nl <= (and_dcpl_184 AND and_dcpl_406 AND and_dcpl_358 AND and_dcpl_253)
      OR (and_dcpl_210 AND and_dcpl_406 AND and_dcpl_23 AND and_dcpl_186) OR (and_dcpl_425
      AND and_dcpl_358 AND (NOT (fsm_output(4))) AND (NOT (fsm_output(0)))) OR (and_dcpl_210
      AND (NOT (fsm_output(2))) AND (fsm_output(6)) AND and_dcpl_23 AND (NOT (fsm_output(4)))
      AND (fsm_output(0))) OR (and_dcpl_425 AND and_dcpl_23 AND and_dcpl_253) OR
      (and_dcpl_31 AND and_dcpl_441 AND (fsm_output(7)) AND (NOT (fsm_output(5)))
      AND and_dcpl_253) OR (and_dcpl_284 AND and_dcpl_441 AND nor_tmp_9 AND and_dcpl_186);
  mult_if_mux_1_nl <= MUX_v_32_2_2(mult_3_res_sva, mult_2_res_sva, mult_if_or_2_nl);
  acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_if_mux_1_nl & '1') + UNSIGNED((NOT
      m_sva) & '1'), 33));
  z_out_5 <= acc_4_nl(32 DOWNTO 1);
  acc_5_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva & '1')
      + UNSIGNED((NOT reg_mult_2_res_lpi_4_dfm_cse) & '1'), 33));
  acc_5_cse_32_1 <= acc_5_nl(32 DOWNTO 1);
  acc_6_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva & '1')
      + UNSIGNED((NOT reg_mult_res_lpi_4_dfm_cse) & '1'), 33));
  acc_6_cse_32_1 <= acc_6_nl(32 DOWNTO 1);
  acc_7_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva & '1')
      + UNSIGNED((NOT reg_mult_1_res_lpi_4_dfm_cse) & '1'), 33));
  acc_7_cse_32_1 <= acc_7_nl(32 DOWNTO 1);
  acc_8_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva & '1')
      + UNSIGNED((NOT reg_mult_3_res_lpi_4_dfm_cse) & '1'), 33));
  acc_8_cse_32_1 <= acc_8_nl(32 DOWNTO 1);
  acc_13_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_3_res_sva & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT m_sva) & '1'), 33), 34), 34));
  z_out_14_32 <= acc_13_nl(33);
  mult_1_if_or_2_nl <= (and_953_cse AND and_dcpl_360 AND and_dcpl_358 AND and_dcpl_253)
      OR (and_953_cse AND and_dcpl_370 AND and_dcpl_23 AND and_dcpl_186) OR (and_715_cse_1
      AND and_dcpl_358 AND (NOT((fsm_output(4)) OR (fsm_output(0))))) OR (CONV_SL_1_1(fsm_output(2
      DOWNTO 1)=STD_LOGIC_VECTOR'("01")) AND and_dcpl_382 AND and_dcpl_23 AND (NOT
      (fsm_output(4))) AND (fsm_output(0))) OR (and_715_cse_1 AND and_dcpl_23 AND
      and_dcpl_253) OR (nor_304_cse AND and_dcpl_360 AND and_dcpl_628 AND and_dcpl_253)
      OR (nor_304_cse AND and_dcpl_370 AND nor_tmp_9 AND and_dcpl_186);
  mult_1_if_mult_1_if_mux_1_nl <= MUX_v_32_2_2(mult_3_res_sva, mult_2_res_sva, mult_1_if_or_2_nl);
  acc_15_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_1_if_mult_1_if_mux_1_nl
      & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT m_sva) & '1'), 33), 34),
      34));
  z_out_16_32 <= acc_15_nl(33);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    hybrid
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.amba_comps.ALL;

USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY hybrid IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    x_rsc_s_tdone : IN STD_LOGIC;
    x_rsc_tr_write_done : IN STD_LOGIC;
    x_rsc_RREADY : IN STD_LOGIC;
    x_rsc_RVALID : OUT STD_LOGIC;
    x_rsc_RUSER : OUT STD_LOGIC;
    x_rsc_RLAST : OUT STD_LOGIC;
    x_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsc_RID : OUT STD_LOGIC;
    x_rsc_ARREADY : OUT STD_LOGIC;
    x_rsc_ARVALID : IN STD_LOGIC;
    x_rsc_ARUSER : IN STD_LOGIC;
    x_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_ARLOCK : IN STD_LOGIC;
    x_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    x_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    x_rsc_ARID : IN STD_LOGIC;
    x_rsc_BREADY : IN STD_LOGIC;
    x_rsc_BVALID : OUT STD_LOGIC;
    x_rsc_BUSER : OUT STD_LOGIC;
    x_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_BID : OUT STD_LOGIC;
    x_rsc_WREADY : OUT STD_LOGIC;
    x_rsc_WVALID : IN STD_LOGIC;
    x_rsc_WUSER : IN STD_LOGIC;
    x_rsc_WLAST : IN STD_LOGIC;
    x_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    x_rsc_AWREADY : OUT STD_LOGIC;
    x_rsc_AWVALID : IN STD_LOGIC;
    x_rsc_AWUSER : IN STD_LOGIC;
    x_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    x_rsc_AWLOCK : IN STD_LOGIC;
    x_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    x_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    x_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    x_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    x_rsc_AWID : IN STD_LOGIC;
    x_rsc_triosy_lz : OUT STD_LOGIC;
    m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    m_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_s_tdone : IN STD_LOGIC;
    twiddle_rsc_tr_write_done : IN STD_LOGIC;
    twiddle_rsc_RREADY : IN STD_LOGIC;
    twiddle_rsc_RVALID : OUT STD_LOGIC;
    twiddle_rsc_RUSER : OUT STD_LOGIC;
    twiddle_rsc_RLAST : OUT STD_LOGIC;
    twiddle_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_RID : OUT STD_LOGIC;
    twiddle_rsc_ARREADY : OUT STD_LOGIC;
    twiddle_rsc_ARVALID : IN STD_LOGIC;
    twiddle_rsc_ARUSER : IN STD_LOGIC;
    twiddle_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_ARLOCK : IN STD_LOGIC;
    twiddle_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_ARID : IN STD_LOGIC;
    twiddle_rsc_BREADY : IN STD_LOGIC;
    twiddle_rsc_BVALID : OUT STD_LOGIC;
    twiddle_rsc_BUSER : OUT STD_LOGIC;
    twiddle_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_BID : OUT STD_LOGIC;
    twiddle_rsc_WREADY : OUT STD_LOGIC;
    twiddle_rsc_WVALID : IN STD_LOGIC;
    twiddle_rsc_WUSER : IN STD_LOGIC;
    twiddle_rsc_WLAST : IN STD_LOGIC;
    twiddle_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_AWREADY : OUT STD_LOGIC;
    twiddle_rsc_AWVALID : IN STD_LOGIC;
    twiddle_rsc_AWUSER : IN STD_LOGIC;
    twiddle_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_rsc_AWLOCK : IN STD_LOGIC;
    twiddle_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_AWID : IN STD_LOGIC;
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_s_tdone : IN STD_LOGIC;
    twiddle_h_rsc_tr_write_done : IN STD_LOGIC;
    twiddle_h_rsc_RREADY : IN STD_LOGIC;
    twiddle_h_rsc_RVALID : OUT STD_LOGIC;
    twiddle_h_rsc_RUSER : OUT STD_LOGIC;
    twiddle_h_rsc_RLAST : OUT STD_LOGIC;
    twiddle_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_RID : OUT STD_LOGIC;
    twiddle_h_rsc_ARREADY : OUT STD_LOGIC;
    twiddle_h_rsc_ARVALID : IN STD_LOGIC;
    twiddle_h_rsc_ARUSER : IN STD_LOGIC;
    twiddle_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_ARLOCK : IN STD_LOGIC;
    twiddle_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_ARID : IN STD_LOGIC;
    twiddle_h_rsc_BREADY : IN STD_LOGIC;
    twiddle_h_rsc_BVALID : OUT STD_LOGIC;
    twiddle_h_rsc_BUSER : OUT STD_LOGIC;
    twiddle_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_BID : OUT STD_LOGIC;
    twiddle_h_rsc_WREADY : OUT STD_LOGIC;
    twiddle_h_rsc_WVALID : IN STD_LOGIC;
    twiddle_h_rsc_WUSER : IN STD_LOGIC;
    twiddle_h_rsc_WLAST : IN STD_LOGIC;
    twiddle_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_AWREADY : OUT STD_LOGIC;
    twiddle_h_rsc_AWVALID : IN STD_LOGIC;
    twiddle_h_rsc_AWUSER : IN STD_LOGIC;
    twiddle_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    twiddle_h_rsc_AWLOCK : IN STD_LOGIC;
    twiddle_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    twiddle_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_AWID : IN STD_LOGIC;
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    revArr_rsc_s_tdone : IN STD_LOGIC;
    revArr_rsc_tr_write_done : IN STD_LOGIC;
    revArr_rsc_RREADY : IN STD_LOGIC;
    revArr_rsc_RVALID : OUT STD_LOGIC;
    revArr_rsc_RUSER : OUT STD_LOGIC;
    revArr_rsc_RLAST : OUT STD_LOGIC;
    revArr_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    revArr_rsc_RID : OUT STD_LOGIC;
    revArr_rsc_ARREADY : OUT STD_LOGIC;
    revArr_rsc_ARVALID : IN STD_LOGIC;
    revArr_rsc_ARUSER : IN STD_LOGIC;
    revArr_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_ARLOCK : IN STD_LOGIC;
    revArr_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    revArr_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    revArr_rsc_ARID : IN STD_LOGIC;
    revArr_rsc_BREADY : IN STD_LOGIC;
    revArr_rsc_BVALID : OUT STD_LOGIC;
    revArr_rsc_BUSER : OUT STD_LOGIC;
    revArr_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_BID : OUT STD_LOGIC;
    revArr_rsc_WREADY : OUT STD_LOGIC;
    revArr_rsc_WVALID : IN STD_LOGIC;
    revArr_rsc_WUSER : IN STD_LOGIC;
    revArr_rsc_WLAST : IN STD_LOGIC;
    revArr_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    revArr_rsc_AWREADY : OUT STD_LOGIC;
    revArr_rsc_AWVALID : IN STD_LOGIC;
    revArr_rsc_AWUSER : IN STD_LOGIC;
    revArr_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    revArr_rsc_AWLOCK : IN STD_LOGIC;
    revArr_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    revArr_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    revArr_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    revArr_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    revArr_rsc_AWID : IN STD_LOGIC;
    revArr_rsc_triosy_lz : OUT STD_LOGIC;
    tw_rsc_s_tdone : IN STD_LOGIC;
    tw_rsc_tr_write_done : IN STD_LOGIC;
    tw_rsc_RREADY : IN STD_LOGIC;
    tw_rsc_RVALID : OUT STD_LOGIC;
    tw_rsc_RUSER : OUT STD_LOGIC;
    tw_rsc_RLAST : OUT STD_LOGIC;
    tw_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_rsc_RID : OUT STD_LOGIC;
    tw_rsc_ARREADY : OUT STD_LOGIC;
    tw_rsc_ARVALID : IN STD_LOGIC;
    tw_rsc_ARUSER : IN STD_LOGIC;
    tw_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_ARLOCK : IN STD_LOGIC;
    tw_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_rsc_ARID : IN STD_LOGIC;
    tw_rsc_BREADY : IN STD_LOGIC;
    tw_rsc_BVALID : OUT STD_LOGIC;
    tw_rsc_BUSER : OUT STD_LOGIC;
    tw_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_BID : OUT STD_LOGIC;
    tw_rsc_WREADY : OUT STD_LOGIC;
    tw_rsc_WVALID : IN STD_LOGIC;
    tw_rsc_WUSER : IN STD_LOGIC;
    tw_rsc_WLAST : IN STD_LOGIC;
    tw_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_rsc_AWREADY : OUT STD_LOGIC;
    tw_rsc_AWVALID : IN STD_LOGIC;
    tw_rsc_AWUSER : IN STD_LOGIC;
    tw_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_rsc_AWLOCK : IN STD_LOGIC;
    tw_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_rsc_AWID : IN STD_LOGIC;
    tw_rsc_triosy_lz : OUT STD_LOGIC;
    tw_h_rsc_s_tdone : IN STD_LOGIC;
    tw_h_rsc_tr_write_done : IN STD_LOGIC;
    tw_h_rsc_RREADY : IN STD_LOGIC;
    tw_h_rsc_RVALID : OUT STD_LOGIC;
    tw_h_rsc_RUSER : OUT STD_LOGIC;
    tw_h_rsc_RLAST : OUT STD_LOGIC;
    tw_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_h_rsc_RID : OUT STD_LOGIC;
    tw_h_rsc_ARREADY : OUT STD_LOGIC;
    tw_h_rsc_ARVALID : IN STD_LOGIC;
    tw_h_rsc_ARUSER : IN STD_LOGIC;
    tw_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_ARLOCK : IN STD_LOGIC;
    tw_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_h_rsc_ARID : IN STD_LOGIC;
    tw_h_rsc_BREADY : IN STD_LOGIC;
    tw_h_rsc_BVALID : OUT STD_LOGIC;
    tw_h_rsc_BUSER : OUT STD_LOGIC;
    tw_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_BID : OUT STD_LOGIC;
    tw_h_rsc_WREADY : OUT STD_LOGIC;
    tw_h_rsc_WVALID : IN STD_LOGIC;
    tw_h_rsc_WUSER : IN STD_LOGIC;
    tw_h_rsc_WLAST : IN STD_LOGIC;
    tw_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    tw_h_rsc_AWREADY : OUT STD_LOGIC;
    tw_h_rsc_AWVALID : IN STD_LOGIC;
    tw_h_rsc_AWUSER : IN STD_LOGIC;
    tw_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    tw_h_rsc_AWLOCK : IN STD_LOGIC;
    tw_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    tw_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    tw_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    tw_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    tw_h_rsc_AWID : IN STD_LOGIC;
    tw_h_rsc_triosy_lz : OUT STD_LOGIC
  );
END hybrid;

ARCHITECTURE v2 OF hybrid IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL xx_rsci_clken_d : STD_LOGIC;
  SIGNAL xx_rsci_d_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL yy_rsci_clken_d : STD_LOGIC;
  SIGNAL yy_rsci_d_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yy_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yy_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL S34_OUTER_LOOP_for_tf_mul_cmp_a : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S34_OUTER_LOOP_for_tf_mul_cmp_b : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsc_clken : STD_LOGIC;
  SIGNAL xx_rsc_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsc_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsc_we : STD_LOGIC;
  SIGNAL xx_rsc_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsc_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yy_rsc_clken : STD_LOGIC;
  SIGNAL yy_rsc_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsc_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yy_rsc_we : STD_LOGIC;
  SIGNAL yy_rsc_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsc_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsci_we_d_iff : STD_LOGIC;
  SIGNAL yy_rsci_we_d_iff : STD_LOGIC;

  SIGNAL xx_rsc_comp_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsc_comp_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsc_comp_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsc_comp_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL yy_rsc_comp_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsc_comp_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsc_comp_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yy_rsc_comp_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xx_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsci_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsci_d_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xx_rsci_radr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xx_rsci_wadr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL yy_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yy_rsci_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yy_rsci_d_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yy_rsci_radr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yy_rsci_wadr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT hybrid_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      x_rsc_s_tdone : IN STD_LOGIC;
      x_rsc_tr_write_done : IN STD_LOGIC;
      x_rsc_RREADY : IN STD_LOGIC;
      x_rsc_RVALID : OUT STD_LOGIC;
      x_rsc_RUSER : OUT STD_LOGIC;
      x_rsc_RLAST : OUT STD_LOGIC;
      x_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      x_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      x_rsc_RID : OUT STD_LOGIC;
      x_rsc_ARREADY : OUT STD_LOGIC;
      x_rsc_ARVALID : IN STD_LOGIC;
      x_rsc_ARUSER : IN STD_LOGIC;
      x_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      x_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_ARLOCK : IN STD_LOGIC;
      x_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      x_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      x_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      x_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      x_rsc_ARID : IN STD_LOGIC;
      x_rsc_BREADY : IN STD_LOGIC;
      x_rsc_BVALID : OUT STD_LOGIC;
      x_rsc_BUSER : OUT STD_LOGIC;
      x_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      x_rsc_BID : OUT STD_LOGIC;
      x_rsc_WREADY : OUT STD_LOGIC;
      x_rsc_WVALID : IN STD_LOGIC;
      x_rsc_WUSER : IN STD_LOGIC;
      x_rsc_WLAST : IN STD_LOGIC;
      x_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      x_rsc_AWREADY : OUT STD_LOGIC;
      x_rsc_AWVALID : IN STD_LOGIC;
      x_rsc_AWUSER : IN STD_LOGIC;
      x_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      x_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      x_rsc_AWLOCK : IN STD_LOGIC;
      x_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      x_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      x_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      x_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      x_rsc_AWID : IN STD_LOGIC;
      x_rsc_triosy_lz : OUT STD_LOGIC;
      m_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      m_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_s_tdone : IN STD_LOGIC;
      twiddle_rsc_tr_write_done : IN STD_LOGIC;
      twiddle_rsc_RREADY : IN STD_LOGIC;
      twiddle_rsc_RVALID : OUT STD_LOGIC;
      twiddle_rsc_RUSER : OUT STD_LOGIC;
      twiddle_rsc_RLAST : OUT STD_LOGIC;
      twiddle_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_RID : OUT STD_LOGIC;
      twiddle_rsc_ARREADY : OUT STD_LOGIC;
      twiddle_rsc_ARVALID : IN STD_LOGIC;
      twiddle_rsc_ARUSER : IN STD_LOGIC;
      twiddle_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_ARLOCK : IN STD_LOGIC;
      twiddle_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      twiddle_rsc_ARID : IN STD_LOGIC;
      twiddle_rsc_BREADY : IN STD_LOGIC;
      twiddle_rsc_BVALID : OUT STD_LOGIC;
      twiddle_rsc_BUSER : OUT STD_LOGIC;
      twiddle_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsc_BID : OUT STD_LOGIC;
      twiddle_rsc_WREADY : OUT STD_LOGIC;
      twiddle_rsc_WVALID : IN STD_LOGIC;
      twiddle_rsc_WUSER : IN STD_LOGIC;
      twiddle_rsc_WLAST : IN STD_LOGIC;
      twiddle_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_AWREADY : OUT STD_LOGIC;
      twiddle_rsc_AWVALID : IN STD_LOGIC;
      twiddle_rsc_AWUSER : IN STD_LOGIC;
      twiddle_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_rsc_AWLOCK : IN STD_LOGIC;
      twiddle_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      twiddle_rsc_AWID : IN STD_LOGIC;
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_h_rsc_s_tdone : IN STD_LOGIC;
      twiddle_h_rsc_tr_write_done : IN STD_LOGIC;
      twiddle_h_rsc_RREADY : IN STD_LOGIC;
      twiddle_h_rsc_RVALID : OUT STD_LOGIC;
      twiddle_h_rsc_RUSER : OUT STD_LOGIC;
      twiddle_h_rsc_RLAST : OUT STD_LOGIC;
      twiddle_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsc_RID : OUT STD_LOGIC;
      twiddle_h_rsc_ARREADY : OUT STD_LOGIC;
      twiddle_h_rsc_ARVALID : IN STD_LOGIC;
      twiddle_h_rsc_ARUSER : IN STD_LOGIC;
      twiddle_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_ARLOCK : IN STD_LOGIC;
      twiddle_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      twiddle_h_rsc_ARID : IN STD_LOGIC;
      twiddle_h_rsc_BREADY : IN STD_LOGIC;
      twiddle_h_rsc_BVALID : OUT STD_LOGIC;
      twiddle_h_rsc_BUSER : OUT STD_LOGIC;
      twiddle_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsc_BID : OUT STD_LOGIC;
      twiddle_h_rsc_WREADY : OUT STD_LOGIC;
      twiddle_h_rsc_WVALID : IN STD_LOGIC;
      twiddle_h_rsc_WUSER : IN STD_LOGIC;
      twiddle_h_rsc_WLAST : IN STD_LOGIC;
      twiddle_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsc_AWREADY : OUT STD_LOGIC;
      twiddle_h_rsc_AWVALID : IN STD_LOGIC;
      twiddle_h_rsc_AWUSER : IN STD_LOGIC;
      twiddle_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      twiddle_h_rsc_AWLOCK : IN STD_LOGIC;
      twiddle_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      twiddle_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      twiddle_h_rsc_AWID : IN STD_LOGIC;
      twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
      revArr_rsc_s_tdone : IN STD_LOGIC;
      revArr_rsc_tr_write_done : IN STD_LOGIC;
      revArr_rsc_RREADY : IN STD_LOGIC;
      revArr_rsc_RVALID : OUT STD_LOGIC;
      revArr_rsc_RUSER : OUT STD_LOGIC;
      revArr_rsc_RLAST : OUT STD_LOGIC;
      revArr_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      revArr_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      revArr_rsc_RID : OUT STD_LOGIC;
      revArr_rsc_ARREADY : OUT STD_LOGIC;
      revArr_rsc_ARVALID : IN STD_LOGIC;
      revArr_rsc_ARUSER : IN STD_LOGIC;
      revArr_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      revArr_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_ARLOCK : IN STD_LOGIC;
      revArr_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      revArr_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      revArr_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      revArr_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      revArr_rsc_ARID : IN STD_LOGIC;
      revArr_rsc_BREADY : IN STD_LOGIC;
      revArr_rsc_BVALID : OUT STD_LOGIC;
      revArr_rsc_BUSER : OUT STD_LOGIC;
      revArr_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      revArr_rsc_BID : OUT STD_LOGIC;
      revArr_rsc_WREADY : OUT STD_LOGIC;
      revArr_rsc_WVALID : IN STD_LOGIC;
      revArr_rsc_WUSER : IN STD_LOGIC;
      revArr_rsc_WLAST : IN STD_LOGIC;
      revArr_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      revArr_rsc_AWREADY : OUT STD_LOGIC;
      revArr_rsc_AWVALID : IN STD_LOGIC;
      revArr_rsc_AWUSER : IN STD_LOGIC;
      revArr_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      revArr_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      revArr_rsc_AWLOCK : IN STD_LOGIC;
      revArr_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      revArr_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      revArr_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      revArr_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      revArr_rsc_AWID : IN STD_LOGIC;
      revArr_rsc_triosy_lz : OUT STD_LOGIC;
      tw_rsc_s_tdone : IN STD_LOGIC;
      tw_rsc_tr_write_done : IN STD_LOGIC;
      tw_rsc_RREADY : IN STD_LOGIC;
      tw_rsc_RVALID : OUT STD_LOGIC;
      tw_rsc_RUSER : OUT STD_LOGIC;
      tw_rsc_RLAST : OUT STD_LOGIC;
      tw_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      tw_rsc_RID : OUT STD_LOGIC;
      tw_rsc_ARREADY : OUT STD_LOGIC;
      tw_rsc_ARVALID : IN STD_LOGIC;
      tw_rsc_ARUSER : IN STD_LOGIC;
      tw_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_ARLOCK : IN STD_LOGIC;
      tw_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      tw_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      tw_rsc_ARID : IN STD_LOGIC;
      tw_rsc_BREADY : IN STD_LOGIC;
      tw_rsc_BVALID : OUT STD_LOGIC;
      tw_rsc_BUSER : OUT STD_LOGIC;
      tw_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_rsc_BID : OUT STD_LOGIC;
      tw_rsc_WREADY : OUT STD_LOGIC;
      tw_rsc_WVALID : IN STD_LOGIC;
      tw_rsc_WUSER : IN STD_LOGIC;
      tw_rsc_WLAST : IN STD_LOGIC;
      tw_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      tw_rsc_AWREADY : OUT STD_LOGIC;
      tw_rsc_AWVALID : IN STD_LOGIC;
      tw_rsc_AWUSER : IN STD_LOGIC;
      tw_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_rsc_AWLOCK : IN STD_LOGIC;
      tw_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      tw_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      tw_rsc_AWID : IN STD_LOGIC;
      tw_rsc_triosy_lz : OUT STD_LOGIC;
      tw_h_rsc_s_tdone : IN STD_LOGIC;
      tw_h_rsc_tr_write_done : IN STD_LOGIC;
      tw_h_rsc_RREADY : IN STD_LOGIC;
      tw_h_rsc_RVALID : OUT STD_LOGIC;
      tw_h_rsc_RUSER : OUT STD_LOGIC;
      tw_h_rsc_RLAST : OUT STD_LOGIC;
      tw_h_rsc_RRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_h_rsc_RDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      tw_h_rsc_RID : OUT STD_LOGIC;
      tw_h_rsc_ARREADY : OUT STD_LOGIC;
      tw_h_rsc_ARVALID : IN STD_LOGIC;
      tw_h_rsc_ARUSER : IN STD_LOGIC;
      tw_h_rsc_ARREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_ARQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_ARPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_h_rsc_ARCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_ARLOCK : IN STD_LOGIC;
      tw_h_rsc_ARBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_h_rsc_ARSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_h_rsc_ARLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      tw_h_rsc_ARADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      tw_h_rsc_ARID : IN STD_LOGIC;
      tw_h_rsc_BREADY : IN STD_LOGIC;
      tw_h_rsc_BVALID : OUT STD_LOGIC;
      tw_h_rsc_BUSER : OUT STD_LOGIC;
      tw_h_rsc_BRESP : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_h_rsc_BID : OUT STD_LOGIC;
      tw_h_rsc_WREADY : OUT STD_LOGIC;
      tw_h_rsc_WVALID : IN STD_LOGIC;
      tw_h_rsc_WUSER : IN STD_LOGIC;
      tw_h_rsc_WLAST : IN STD_LOGIC;
      tw_h_rsc_WSTRB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_WDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      tw_h_rsc_AWREADY : OUT STD_LOGIC;
      tw_h_rsc_AWVALID : IN STD_LOGIC;
      tw_h_rsc_AWUSER : IN STD_LOGIC;
      tw_h_rsc_AWREGION : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_AWQOS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_AWPROT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_h_rsc_AWCACHE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      tw_h_rsc_AWLOCK : IN STD_LOGIC;
      tw_h_rsc_AWBURST : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      tw_h_rsc_AWSIZE : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      tw_h_rsc_AWLEN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      tw_h_rsc_AWADDR : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      tw_h_rsc_AWID : IN STD_LOGIC;
      tw_h_rsc_triosy_lz : OUT STD_LOGIC;
      xx_rsci_clken_d : OUT STD_LOGIC;
      xx_rsci_d_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      xx_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      xx_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      xx_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      xx_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      yy_rsci_clken_d : OUT STD_LOGIC;
      yy_rsci_d_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      yy_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      yy_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      yy_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      yy_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      S34_OUTER_LOOP_for_tf_mul_cmp_a : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      S34_OUTER_LOOP_for_tf_mul_cmp_b : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      S34_OUTER_LOOP_for_tf_mul_cmp_z : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      xx_rsci_we_d_pff : OUT STD_LOGIC;
      yy_rsci_we_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL hybrid_core_inst_x_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_x_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_m_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_twiddle_h_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_revArr_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_ARADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL hybrid_core_inst_tw_h_rsc_AWADDR : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL hybrid_core_inst_xx_rsci_d_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_xx_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_xx_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL hybrid_core_inst_xx_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL hybrid_core_inst_yy_rsci_d_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_yy_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL hybrid_core_inst_yy_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL hybrid_core_inst_yy_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_a : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_b : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z : STD_LOGIC_VECTOR (9 DOWNTO
      0);

BEGIN
  xx_rsc_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 10,
      data_width => 32,
      depth => 1024,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xx_rsc_clken,
      d => xx_rsc_comp_d,
      q => xx_rsc_comp_q,
      radr => xx_rsc_comp_radr,
      wadr => xx_rsc_comp_wadr,
      we => xx_rsc_we
    );
  xx_rsc_comp_d <= xx_rsc_d;
  xx_rsc_q <= xx_rsc_comp_q;
  xx_rsc_comp_radr <= xx_rsc_radr;
  xx_rsc_comp_wadr <= xx_rsc_wadr;

  yy_rsc_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 10,
      data_width => 32,
      depth => 1024,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => yy_rsc_clken,
      d => yy_rsc_comp_d,
      q => yy_rsc_comp_q,
      radr => yy_rsc_comp_radr,
      wadr => yy_rsc_comp_wadr,
      we => yy_rsc_we
    );
  yy_rsc_comp_d <= yy_rsc_d;
  yy_rsc_q <= yy_rsc_comp_q;
  yy_rsc_comp_radr <= yy_rsc_radr;
  yy_rsc_comp_wadr <= yy_rsc_wadr;

  xx_rsci : hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen
    PORT MAP(
      clken => xx_rsc_clken,
      q => xx_rsci_q,
      radr => xx_rsci_radr,
      we => xx_rsc_we,
      d => xx_rsci_d,
      wadr => xx_rsci_wadr,
      clken_d => xx_rsci_clken_d,
      d_d => xx_rsci_d_d_1,
      q_d => xx_rsci_q_d_1,
      radr_d => xx_rsci_radr_d_1,
      wadr_d => xx_rsci_wadr_d_1,
      we_d => xx_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xx_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xx_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  xx_rsci_q <= xx_rsc_q;
  xx_rsc_radr <= xx_rsci_radr;
  xx_rsc_d <= xx_rsci_d;
  xx_rsc_wadr <= xx_rsci_wadr;
  xx_rsci_d_d_1 <= xx_rsci_d_d;
  xx_rsci_q_d <= xx_rsci_q_d_1;
  xx_rsci_radr_d_1 <= xx_rsci_radr_d;
  xx_rsci_wadr_d_1 <= xx_rsci_wadr_d;

  yy_rsci : hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen
    PORT MAP(
      clken => yy_rsc_clken,
      q => yy_rsci_q,
      radr => yy_rsci_radr,
      we => yy_rsc_we,
      d => yy_rsci_d,
      wadr => yy_rsci_wadr,
      clken_d => yy_rsci_clken_d,
      d_d => yy_rsci_d_d_1,
      q_d => yy_rsci_q_d_1,
      radr_d => yy_rsci_radr_d_1,
      wadr_d => yy_rsci_wadr_d_1,
      we_d => yy_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => yy_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => yy_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  yy_rsci_q <= yy_rsc_q;
  yy_rsc_radr <= yy_rsci_radr;
  yy_rsc_d <= yy_rsci_d;
  yy_rsc_wadr <= yy_rsci_wadr;
  yy_rsci_d_d_1 <= yy_rsci_d_d;
  yy_rsci_q_d <= yy_rsci_q_d_1;
  yy_rsci_radr_d_1 <= yy_rsci_radr_d;
  yy_rsci_wadr_d_1 <= yy_rsci_wadr_d;

  hybrid_core_inst : hybrid_core
    PORT MAP(
      clk => clk,
      rst => rst,
      x_rsc_s_tdone => x_rsc_s_tdone,
      x_rsc_tr_write_done => x_rsc_tr_write_done,
      x_rsc_RREADY => x_rsc_RREADY,
      x_rsc_RVALID => x_rsc_RVALID,
      x_rsc_RUSER => x_rsc_RUSER,
      x_rsc_RLAST => x_rsc_RLAST,
      x_rsc_RRESP => hybrid_core_inst_x_rsc_RRESP,
      x_rsc_RDATA => hybrid_core_inst_x_rsc_RDATA,
      x_rsc_RID => x_rsc_RID,
      x_rsc_ARREADY => x_rsc_ARREADY,
      x_rsc_ARVALID => x_rsc_ARVALID,
      x_rsc_ARUSER => x_rsc_ARUSER,
      x_rsc_ARREGION => hybrid_core_inst_x_rsc_ARREGION,
      x_rsc_ARQOS => hybrid_core_inst_x_rsc_ARQOS,
      x_rsc_ARPROT => hybrid_core_inst_x_rsc_ARPROT,
      x_rsc_ARCACHE => hybrid_core_inst_x_rsc_ARCACHE,
      x_rsc_ARLOCK => x_rsc_ARLOCK,
      x_rsc_ARBURST => hybrid_core_inst_x_rsc_ARBURST,
      x_rsc_ARSIZE => hybrid_core_inst_x_rsc_ARSIZE,
      x_rsc_ARLEN => hybrid_core_inst_x_rsc_ARLEN,
      x_rsc_ARADDR => hybrid_core_inst_x_rsc_ARADDR,
      x_rsc_ARID => x_rsc_ARID,
      x_rsc_BREADY => x_rsc_BREADY,
      x_rsc_BVALID => x_rsc_BVALID,
      x_rsc_BUSER => x_rsc_BUSER,
      x_rsc_BRESP => hybrid_core_inst_x_rsc_BRESP,
      x_rsc_BID => x_rsc_BID,
      x_rsc_WREADY => x_rsc_WREADY,
      x_rsc_WVALID => x_rsc_WVALID,
      x_rsc_WUSER => x_rsc_WUSER,
      x_rsc_WLAST => x_rsc_WLAST,
      x_rsc_WSTRB => hybrid_core_inst_x_rsc_WSTRB,
      x_rsc_WDATA => hybrid_core_inst_x_rsc_WDATA,
      x_rsc_AWREADY => x_rsc_AWREADY,
      x_rsc_AWVALID => x_rsc_AWVALID,
      x_rsc_AWUSER => x_rsc_AWUSER,
      x_rsc_AWREGION => hybrid_core_inst_x_rsc_AWREGION,
      x_rsc_AWQOS => hybrid_core_inst_x_rsc_AWQOS,
      x_rsc_AWPROT => hybrid_core_inst_x_rsc_AWPROT,
      x_rsc_AWCACHE => hybrid_core_inst_x_rsc_AWCACHE,
      x_rsc_AWLOCK => x_rsc_AWLOCK,
      x_rsc_AWBURST => hybrid_core_inst_x_rsc_AWBURST,
      x_rsc_AWSIZE => hybrid_core_inst_x_rsc_AWSIZE,
      x_rsc_AWLEN => hybrid_core_inst_x_rsc_AWLEN,
      x_rsc_AWADDR => hybrid_core_inst_x_rsc_AWADDR,
      x_rsc_AWID => x_rsc_AWID,
      x_rsc_triosy_lz => x_rsc_triosy_lz,
      m_rsc_dat => hybrid_core_inst_m_rsc_dat,
      m_rsc_triosy_lz => m_rsc_triosy_lz,
      twiddle_rsc_s_tdone => twiddle_rsc_s_tdone,
      twiddle_rsc_tr_write_done => twiddle_rsc_tr_write_done,
      twiddle_rsc_RREADY => twiddle_rsc_RREADY,
      twiddle_rsc_RVALID => twiddle_rsc_RVALID,
      twiddle_rsc_RUSER => twiddle_rsc_RUSER,
      twiddle_rsc_RLAST => twiddle_rsc_RLAST,
      twiddle_rsc_RRESP => hybrid_core_inst_twiddle_rsc_RRESP,
      twiddle_rsc_RDATA => hybrid_core_inst_twiddle_rsc_RDATA,
      twiddle_rsc_RID => twiddle_rsc_RID,
      twiddle_rsc_ARREADY => twiddle_rsc_ARREADY,
      twiddle_rsc_ARVALID => twiddle_rsc_ARVALID,
      twiddle_rsc_ARUSER => twiddle_rsc_ARUSER,
      twiddle_rsc_ARREGION => hybrid_core_inst_twiddle_rsc_ARREGION,
      twiddle_rsc_ARQOS => hybrid_core_inst_twiddle_rsc_ARQOS,
      twiddle_rsc_ARPROT => hybrid_core_inst_twiddle_rsc_ARPROT,
      twiddle_rsc_ARCACHE => hybrid_core_inst_twiddle_rsc_ARCACHE,
      twiddle_rsc_ARLOCK => twiddle_rsc_ARLOCK,
      twiddle_rsc_ARBURST => hybrid_core_inst_twiddle_rsc_ARBURST,
      twiddle_rsc_ARSIZE => hybrid_core_inst_twiddle_rsc_ARSIZE,
      twiddle_rsc_ARLEN => hybrid_core_inst_twiddle_rsc_ARLEN,
      twiddle_rsc_ARADDR => hybrid_core_inst_twiddle_rsc_ARADDR,
      twiddle_rsc_ARID => twiddle_rsc_ARID,
      twiddle_rsc_BREADY => twiddle_rsc_BREADY,
      twiddle_rsc_BVALID => twiddle_rsc_BVALID,
      twiddle_rsc_BUSER => twiddle_rsc_BUSER,
      twiddle_rsc_BRESP => hybrid_core_inst_twiddle_rsc_BRESP,
      twiddle_rsc_BID => twiddle_rsc_BID,
      twiddle_rsc_WREADY => twiddle_rsc_WREADY,
      twiddle_rsc_WVALID => twiddle_rsc_WVALID,
      twiddle_rsc_WUSER => twiddle_rsc_WUSER,
      twiddle_rsc_WLAST => twiddle_rsc_WLAST,
      twiddle_rsc_WSTRB => hybrid_core_inst_twiddle_rsc_WSTRB,
      twiddle_rsc_WDATA => hybrid_core_inst_twiddle_rsc_WDATA,
      twiddle_rsc_AWREADY => twiddle_rsc_AWREADY,
      twiddle_rsc_AWVALID => twiddle_rsc_AWVALID,
      twiddle_rsc_AWUSER => twiddle_rsc_AWUSER,
      twiddle_rsc_AWREGION => hybrid_core_inst_twiddle_rsc_AWREGION,
      twiddle_rsc_AWQOS => hybrid_core_inst_twiddle_rsc_AWQOS,
      twiddle_rsc_AWPROT => hybrid_core_inst_twiddle_rsc_AWPROT,
      twiddle_rsc_AWCACHE => hybrid_core_inst_twiddle_rsc_AWCACHE,
      twiddle_rsc_AWLOCK => twiddle_rsc_AWLOCK,
      twiddle_rsc_AWBURST => hybrid_core_inst_twiddle_rsc_AWBURST,
      twiddle_rsc_AWSIZE => hybrid_core_inst_twiddle_rsc_AWSIZE,
      twiddle_rsc_AWLEN => hybrid_core_inst_twiddle_rsc_AWLEN,
      twiddle_rsc_AWADDR => hybrid_core_inst_twiddle_rsc_AWADDR,
      twiddle_rsc_AWID => twiddle_rsc_AWID,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      twiddle_h_rsc_s_tdone => twiddle_h_rsc_s_tdone,
      twiddle_h_rsc_tr_write_done => twiddle_h_rsc_tr_write_done,
      twiddle_h_rsc_RREADY => twiddle_h_rsc_RREADY,
      twiddle_h_rsc_RVALID => twiddle_h_rsc_RVALID,
      twiddle_h_rsc_RUSER => twiddle_h_rsc_RUSER,
      twiddle_h_rsc_RLAST => twiddle_h_rsc_RLAST,
      twiddle_h_rsc_RRESP => hybrid_core_inst_twiddle_h_rsc_RRESP,
      twiddle_h_rsc_RDATA => hybrid_core_inst_twiddle_h_rsc_RDATA,
      twiddle_h_rsc_RID => twiddle_h_rsc_RID,
      twiddle_h_rsc_ARREADY => twiddle_h_rsc_ARREADY,
      twiddle_h_rsc_ARVALID => twiddle_h_rsc_ARVALID,
      twiddle_h_rsc_ARUSER => twiddle_h_rsc_ARUSER,
      twiddle_h_rsc_ARREGION => hybrid_core_inst_twiddle_h_rsc_ARREGION,
      twiddle_h_rsc_ARQOS => hybrid_core_inst_twiddle_h_rsc_ARQOS,
      twiddle_h_rsc_ARPROT => hybrid_core_inst_twiddle_h_rsc_ARPROT,
      twiddle_h_rsc_ARCACHE => hybrid_core_inst_twiddle_h_rsc_ARCACHE,
      twiddle_h_rsc_ARLOCK => twiddle_h_rsc_ARLOCK,
      twiddle_h_rsc_ARBURST => hybrid_core_inst_twiddle_h_rsc_ARBURST,
      twiddle_h_rsc_ARSIZE => hybrid_core_inst_twiddle_h_rsc_ARSIZE,
      twiddle_h_rsc_ARLEN => hybrid_core_inst_twiddle_h_rsc_ARLEN,
      twiddle_h_rsc_ARADDR => hybrid_core_inst_twiddle_h_rsc_ARADDR,
      twiddle_h_rsc_ARID => twiddle_h_rsc_ARID,
      twiddle_h_rsc_BREADY => twiddle_h_rsc_BREADY,
      twiddle_h_rsc_BVALID => twiddle_h_rsc_BVALID,
      twiddle_h_rsc_BUSER => twiddle_h_rsc_BUSER,
      twiddle_h_rsc_BRESP => hybrid_core_inst_twiddle_h_rsc_BRESP,
      twiddle_h_rsc_BID => twiddle_h_rsc_BID,
      twiddle_h_rsc_WREADY => twiddle_h_rsc_WREADY,
      twiddle_h_rsc_WVALID => twiddle_h_rsc_WVALID,
      twiddle_h_rsc_WUSER => twiddle_h_rsc_WUSER,
      twiddle_h_rsc_WLAST => twiddle_h_rsc_WLAST,
      twiddle_h_rsc_WSTRB => hybrid_core_inst_twiddle_h_rsc_WSTRB,
      twiddle_h_rsc_WDATA => hybrid_core_inst_twiddle_h_rsc_WDATA,
      twiddle_h_rsc_AWREADY => twiddle_h_rsc_AWREADY,
      twiddle_h_rsc_AWVALID => twiddle_h_rsc_AWVALID,
      twiddle_h_rsc_AWUSER => twiddle_h_rsc_AWUSER,
      twiddle_h_rsc_AWREGION => hybrid_core_inst_twiddle_h_rsc_AWREGION,
      twiddle_h_rsc_AWQOS => hybrid_core_inst_twiddle_h_rsc_AWQOS,
      twiddle_h_rsc_AWPROT => hybrid_core_inst_twiddle_h_rsc_AWPROT,
      twiddle_h_rsc_AWCACHE => hybrid_core_inst_twiddle_h_rsc_AWCACHE,
      twiddle_h_rsc_AWLOCK => twiddle_h_rsc_AWLOCK,
      twiddle_h_rsc_AWBURST => hybrid_core_inst_twiddle_h_rsc_AWBURST,
      twiddle_h_rsc_AWSIZE => hybrid_core_inst_twiddle_h_rsc_AWSIZE,
      twiddle_h_rsc_AWLEN => hybrid_core_inst_twiddle_h_rsc_AWLEN,
      twiddle_h_rsc_AWADDR => hybrid_core_inst_twiddle_h_rsc_AWADDR,
      twiddle_h_rsc_AWID => twiddle_h_rsc_AWID,
      twiddle_h_rsc_triosy_lz => twiddle_h_rsc_triosy_lz,
      revArr_rsc_s_tdone => revArr_rsc_s_tdone,
      revArr_rsc_tr_write_done => revArr_rsc_tr_write_done,
      revArr_rsc_RREADY => revArr_rsc_RREADY,
      revArr_rsc_RVALID => revArr_rsc_RVALID,
      revArr_rsc_RUSER => revArr_rsc_RUSER,
      revArr_rsc_RLAST => revArr_rsc_RLAST,
      revArr_rsc_RRESP => hybrid_core_inst_revArr_rsc_RRESP,
      revArr_rsc_RDATA => hybrid_core_inst_revArr_rsc_RDATA,
      revArr_rsc_RID => revArr_rsc_RID,
      revArr_rsc_ARREADY => revArr_rsc_ARREADY,
      revArr_rsc_ARVALID => revArr_rsc_ARVALID,
      revArr_rsc_ARUSER => revArr_rsc_ARUSER,
      revArr_rsc_ARREGION => hybrid_core_inst_revArr_rsc_ARREGION,
      revArr_rsc_ARQOS => hybrid_core_inst_revArr_rsc_ARQOS,
      revArr_rsc_ARPROT => hybrid_core_inst_revArr_rsc_ARPROT,
      revArr_rsc_ARCACHE => hybrid_core_inst_revArr_rsc_ARCACHE,
      revArr_rsc_ARLOCK => revArr_rsc_ARLOCK,
      revArr_rsc_ARBURST => hybrid_core_inst_revArr_rsc_ARBURST,
      revArr_rsc_ARSIZE => hybrid_core_inst_revArr_rsc_ARSIZE,
      revArr_rsc_ARLEN => hybrid_core_inst_revArr_rsc_ARLEN,
      revArr_rsc_ARADDR => hybrid_core_inst_revArr_rsc_ARADDR,
      revArr_rsc_ARID => revArr_rsc_ARID,
      revArr_rsc_BREADY => revArr_rsc_BREADY,
      revArr_rsc_BVALID => revArr_rsc_BVALID,
      revArr_rsc_BUSER => revArr_rsc_BUSER,
      revArr_rsc_BRESP => hybrid_core_inst_revArr_rsc_BRESP,
      revArr_rsc_BID => revArr_rsc_BID,
      revArr_rsc_WREADY => revArr_rsc_WREADY,
      revArr_rsc_WVALID => revArr_rsc_WVALID,
      revArr_rsc_WUSER => revArr_rsc_WUSER,
      revArr_rsc_WLAST => revArr_rsc_WLAST,
      revArr_rsc_WSTRB => hybrid_core_inst_revArr_rsc_WSTRB,
      revArr_rsc_WDATA => hybrid_core_inst_revArr_rsc_WDATA,
      revArr_rsc_AWREADY => revArr_rsc_AWREADY,
      revArr_rsc_AWVALID => revArr_rsc_AWVALID,
      revArr_rsc_AWUSER => revArr_rsc_AWUSER,
      revArr_rsc_AWREGION => hybrid_core_inst_revArr_rsc_AWREGION,
      revArr_rsc_AWQOS => hybrid_core_inst_revArr_rsc_AWQOS,
      revArr_rsc_AWPROT => hybrid_core_inst_revArr_rsc_AWPROT,
      revArr_rsc_AWCACHE => hybrid_core_inst_revArr_rsc_AWCACHE,
      revArr_rsc_AWLOCK => revArr_rsc_AWLOCK,
      revArr_rsc_AWBURST => hybrid_core_inst_revArr_rsc_AWBURST,
      revArr_rsc_AWSIZE => hybrid_core_inst_revArr_rsc_AWSIZE,
      revArr_rsc_AWLEN => hybrid_core_inst_revArr_rsc_AWLEN,
      revArr_rsc_AWADDR => hybrid_core_inst_revArr_rsc_AWADDR,
      revArr_rsc_AWID => revArr_rsc_AWID,
      revArr_rsc_triosy_lz => revArr_rsc_triosy_lz,
      tw_rsc_s_tdone => tw_rsc_s_tdone,
      tw_rsc_tr_write_done => tw_rsc_tr_write_done,
      tw_rsc_RREADY => tw_rsc_RREADY,
      tw_rsc_RVALID => tw_rsc_RVALID,
      tw_rsc_RUSER => tw_rsc_RUSER,
      tw_rsc_RLAST => tw_rsc_RLAST,
      tw_rsc_RRESP => hybrid_core_inst_tw_rsc_RRESP,
      tw_rsc_RDATA => hybrid_core_inst_tw_rsc_RDATA,
      tw_rsc_RID => tw_rsc_RID,
      tw_rsc_ARREADY => tw_rsc_ARREADY,
      tw_rsc_ARVALID => tw_rsc_ARVALID,
      tw_rsc_ARUSER => tw_rsc_ARUSER,
      tw_rsc_ARREGION => hybrid_core_inst_tw_rsc_ARREGION,
      tw_rsc_ARQOS => hybrid_core_inst_tw_rsc_ARQOS,
      tw_rsc_ARPROT => hybrid_core_inst_tw_rsc_ARPROT,
      tw_rsc_ARCACHE => hybrid_core_inst_tw_rsc_ARCACHE,
      tw_rsc_ARLOCK => tw_rsc_ARLOCK,
      tw_rsc_ARBURST => hybrid_core_inst_tw_rsc_ARBURST,
      tw_rsc_ARSIZE => hybrid_core_inst_tw_rsc_ARSIZE,
      tw_rsc_ARLEN => hybrid_core_inst_tw_rsc_ARLEN,
      tw_rsc_ARADDR => hybrid_core_inst_tw_rsc_ARADDR,
      tw_rsc_ARID => tw_rsc_ARID,
      tw_rsc_BREADY => tw_rsc_BREADY,
      tw_rsc_BVALID => tw_rsc_BVALID,
      tw_rsc_BUSER => tw_rsc_BUSER,
      tw_rsc_BRESP => hybrid_core_inst_tw_rsc_BRESP,
      tw_rsc_BID => tw_rsc_BID,
      tw_rsc_WREADY => tw_rsc_WREADY,
      tw_rsc_WVALID => tw_rsc_WVALID,
      tw_rsc_WUSER => tw_rsc_WUSER,
      tw_rsc_WLAST => tw_rsc_WLAST,
      tw_rsc_WSTRB => hybrid_core_inst_tw_rsc_WSTRB,
      tw_rsc_WDATA => hybrid_core_inst_tw_rsc_WDATA,
      tw_rsc_AWREADY => tw_rsc_AWREADY,
      tw_rsc_AWVALID => tw_rsc_AWVALID,
      tw_rsc_AWUSER => tw_rsc_AWUSER,
      tw_rsc_AWREGION => hybrid_core_inst_tw_rsc_AWREGION,
      tw_rsc_AWQOS => hybrid_core_inst_tw_rsc_AWQOS,
      tw_rsc_AWPROT => hybrid_core_inst_tw_rsc_AWPROT,
      tw_rsc_AWCACHE => hybrid_core_inst_tw_rsc_AWCACHE,
      tw_rsc_AWLOCK => tw_rsc_AWLOCK,
      tw_rsc_AWBURST => hybrid_core_inst_tw_rsc_AWBURST,
      tw_rsc_AWSIZE => hybrid_core_inst_tw_rsc_AWSIZE,
      tw_rsc_AWLEN => hybrid_core_inst_tw_rsc_AWLEN,
      tw_rsc_AWADDR => hybrid_core_inst_tw_rsc_AWADDR,
      tw_rsc_AWID => tw_rsc_AWID,
      tw_rsc_triosy_lz => tw_rsc_triosy_lz,
      tw_h_rsc_s_tdone => tw_h_rsc_s_tdone,
      tw_h_rsc_tr_write_done => tw_h_rsc_tr_write_done,
      tw_h_rsc_RREADY => tw_h_rsc_RREADY,
      tw_h_rsc_RVALID => tw_h_rsc_RVALID,
      tw_h_rsc_RUSER => tw_h_rsc_RUSER,
      tw_h_rsc_RLAST => tw_h_rsc_RLAST,
      tw_h_rsc_RRESP => hybrid_core_inst_tw_h_rsc_RRESP,
      tw_h_rsc_RDATA => hybrid_core_inst_tw_h_rsc_RDATA,
      tw_h_rsc_RID => tw_h_rsc_RID,
      tw_h_rsc_ARREADY => tw_h_rsc_ARREADY,
      tw_h_rsc_ARVALID => tw_h_rsc_ARVALID,
      tw_h_rsc_ARUSER => tw_h_rsc_ARUSER,
      tw_h_rsc_ARREGION => hybrid_core_inst_tw_h_rsc_ARREGION,
      tw_h_rsc_ARQOS => hybrid_core_inst_tw_h_rsc_ARQOS,
      tw_h_rsc_ARPROT => hybrid_core_inst_tw_h_rsc_ARPROT,
      tw_h_rsc_ARCACHE => hybrid_core_inst_tw_h_rsc_ARCACHE,
      tw_h_rsc_ARLOCK => tw_h_rsc_ARLOCK,
      tw_h_rsc_ARBURST => hybrid_core_inst_tw_h_rsc_ARBURST,
      tw_h_rsc_ARSIZE => hybrid_core_inst_tw_h_rsc_ARSIZE,
      tw_h_rsc_ARLEN => hybrid_core_inst_tw_h_rsc_ARLEN,
      tw_h_rsc_ARADDR => hybrid_core_inst_tw_h_rsc_ARADDR,
      tw_h_rsc_ARID => tw_h_rsc_ARID,
      tw_h_rsc_BREADY => tw_h_rsc_BREADY,
      tw_h_rsc_BVALID => tw_h_rsc_BVALID,
      tw_h_rsc_BUSER => tw_h_rsc_BUSER,
      tw_h_rsc_BRESP => hybrid_core_inst_tw_h_rsc_BRESP,
      tw_h_rsc_BID => tw_h_rsc_BID,
      tw_h_rsc_WREADY => tw_h_rsc_WREADY,
      tw_h_rsc_WVALID => tw_h_rsc_WVALID,
      tw_h_rsc_WUSER => tw_h_rsc_WUSER,
      tw_h_rsc_WLAST => tw_h_rsc_WLAST,
      tw_h_rsc_WSTRB => hybrid_core_inst_tw_h_rsc_WSTRB,
      tw_h_rsc_WDATA => hybrid_core_inst_tw_h_rsc_WDATA,
      tw_h_rsc_AWREADY => tw_h_rsc_AWREADY,
      tw_h_rsc_AWVALID => tw_h_rsc_AWVALID,
      tw_h_rsc_AWUSER => tw_h_rsc_AWUSER,
      tw_h_rsc_AWREGION => hybrid_core_inst_tw_h_rsc_AWREGION,
      tw_h_rsc_AWQOS => hybrid_core_inst_tw_h_rsc_AWQOS,
      tw_h_rsc_AWPROT => hybrid_core_inst_tw_h_rsc_AWPROT,
      tw_h_rsc_AWCACHE => hybrid_core_inst_tw_h_rsc_AWCACHE,
      tw_h_rsc_AWLOCK => tw_h_rsc_AWLOCK,
      tw_h_rsc_AWBURST => hybrid_core_inst_tw_h_rsc_AWBURST,
      tw_h_rsc_AWSIZE => hybrid_core_inst_tw_h_rsc_AWSIZE,
      tw_h_rsc_AWLEN => hybrid_core_inst_tw_h_rsc_AWLEN,
      tw_h_rsc_AWADDR => hybrid_core_inst_tw_h_rsc_AWADDR,
      tw_h_rsc_AWID => tw_h_rsc_AWID,
      tw_h_rsc_triosy_lz => tw_h_rsc_triosy_lz,
      xx_rsci_clken_d => xx_rsci_clken_d,
      xx_rsci_d_d => hybrid_core_inst_xx_rsci_d_d,
      xx_rsci_q_d => hybrid_core_inst_xx_rsci_q_d,
      xx_rsci_radr_d => hybrid_core_inst_xx_rsci_radr_d,
      xx_rsci_wadr_d => hybrid_core_inst_xx_rsci_wadr_d,
      xx_rsci_readA_r_ram_ir_internal_RMASK_B_d => xx_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      yy_rsci_clken_d => yy_rsci_clken_d,
      yy_rsci_d_d => hybrid_core_inst_yy_rsci_d_d,
      yy_rsci_q_d => hybrid_core_inst_yy_rsci_q_d,
      yy_rsci_radr_d => hybrid_core_inst_yy_rsci_radr_d,
      yy_rsci_wadr_d => hybrid_core_inst_yy_rsci_wadr_d,
      yy_rsci_readA_r_ram_ir_internal_RMASK_B_d => yy_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      S34_OUTER_LOOP_for_tf_mul_cmp_a => hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_a,
      S34_OUTER_LOOP_for_tf_mul_cmp_b => hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_b,
      S34_OUTER_LOOP_for_tf_mul_cmp_z => hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z,
      xx_rsci_we_d_pff => xx_rsci_we_d_iff,
      yy_rsci_we_d_pff => yy_rsci_we_d_iff
    );
  x_rsc_RRESP <= hybrid_core_inst_x_rsc_RRESP;
  x_rsc_RDATA <= hybrid_core_inst_x_rsc_RDATA;
  hybrid_core_inst_x_rsc_ARREGION <= x_rsc_ARREGION;
  hybrid_core_inst_x_rsc_ARQOS <= x_rsc_ARQOS;
  hybrid_core_inst_x_rsc_ARPROT <= x_rsc_ARPROT;
  hybrid_core_inst_x_rsc_ARCACHE <= x_rsc_ARCACHE;
  hybrid_core_inst_x_rsc_ARBURST <= x_rsc_ARBURST;
  hybrid_core_inst_x_rsc_ARSIZE <= x_rsc_ARSIZE;
  hybrid_core_inst_x_rsc_ARLEN <= x_rsc_ARLEN;
  hybrid_core_inst_x_rsc_ARADDR <= x_rsc_ARADDR;
  x_rsc_BRESP <= hybrid_core_inst_x_rsc_BRESP;
  hybrid_core_inst_x_rsc_WSTRB <= x_rsc_WSTRB;
  hybrid_core_inst_x_rsc_WDATA <= x_rsc_WDATA;
  hybrid_core_inst_x_rsc_AWREGION <= x_rsc_AWREGION;
  hybrid_core_inst_x_rsc_AWQOS <= x_rsc_AWQOS;
  hybrid_core_inst_x_rsc_AWPROT <= x_rsc_AWPROT;
  hybrid_core_inst_x_rsc_AWCACHE <= x_rsc_AWCACHE;
  hybrid_core_inst_x_rsc_AWBURST <= x_rsc_AWBURST;
  hybrid_core_inst_x_rsc_AWSIZE <= x_rsc_AWSIZE;
  hybrid_core_inst_x_rsc_AWLEN <= x_rsc_AWLEN;
  hybrid_core_inst_x_rsc_AWADDR <= x_rsc_AWADDR;
  hybrid_core_inst_m_rsc_dat <= m_rsc_dat;
  twiddle_rsc_RRESP <= hybrid_core_inst_twiddle_rsc_RRESP;
  twiddle_rsc_RDATA <= hybrid_core_inst_twiddle_rsc_RDATA;
  hybrid_core_inst_twiddle_rsc_ARREGION <= twiddle_rsc_ARREGION;
  hybrid_core_inst_twiddle_rsc_ARQOS <= twiddle_rsc_ARQOS;
  hybrid_core_inst_twiddle_rsc_ARPROT <= twiddle_rsc_ARPROT;
  hybrid_core_inst_twiddle_rsc_ARCACHE <= twiddle_rsc_ARCACHE;
  hybrid_core_inst_twiddle_rsc_ARBURST <= twiddle_rsc_ARBURST;
  hybrid_core_inst_twiddle_rsc_ARSIZE <= twiddle_rsc_ARSIZE;
  hybrid_core_inst_twiddle_rsc_ARLEN <= twiddle_rsc_ARLEN;
  hybrid_core_inst_twiddle_rsc_ARADDR <= twiddle_rsc_ARADDR;
  twiddle_rsc_BRESP <= hybrid_core_inst_twiddle_rsc_BRESP;
  hybrid_core_inst_twiddle_rsc_WSTRB <= twiddle_rsc_WSTRB;
  hybrid_core_inst_twiddle_rsc_WDATA <= twiddle_rsc_WDATA;
  hybrid_core_inst_twiddle_rsc_AWREGION <= twiddle_rsc_AWREGION;
  hybrid_core_inst_twiddle_rsc_AWQOS <= twiddle_rsc_AWQOS;
  hybrid_core_inst_twiddle_rsc_AWPROT <= twiddle_rsc_AWPROT;
  hybrid_core_inst_twiddle_rsc_AWCACHE <= twiddle_rsc_AWCACHE;
  hybrid_core_inst_twiddle_rsc_AWBURST <= twiddle_rsc_AWBURST;
  hybrid_core_inst_twiddle_rsc_AWSIZE <= twiddle_rsc_AWSIZE;
  hybrid_core_inst_twiddle_rsc_AWLEN <= twiddle_rsc_AWLEN;
  hybrid_core_inst_twiddle_rsc_AWADDR <= twiddle_rsc_AWADDR;
  twiddle_h_rsc_RRESP <= hybrid_core_inst_twiddle_h_rsc_RRESP;
  twiddle_h_rsc_RDATA <= hybrid_core_inst_twiddle_h_rsc_RDATA;
  hybrid_core_inst_twiddle_h_rsc_ARREGION <= twiddle_h_rsc_ARREGION;
  hybrid_core_inst_twiddle_h_rsc_ARQOS <= twiddle_h_rsc_ARQOS;
  hybrid_core_inst_twiddle_h_rsc_ARPROT <= twiddle_h_rsc_ARPROT;
  hybrid_core_inst_twiddle_h_rsc_ARCACHE <= twiddle_h_rsc_ARCACHE;
  hybrid_core_inst_twiddle_h_rsc_ARBURST <= twiddle_h_rsc_ARBURST;
  hybrid_core_inst_twiddle_h_rsc_ARSIZE <= twiddle_h_rsc_ARSIZE;
  hybrid_core_inst_twiddle_h_rsc_ARLEN <= twiddle_h_rsc_ARLEN;
  hybrid_core_inst_twiddle_h_rsc_ARADDR <= twiddle_h_rsc_ARADDR;
  twiddle_h_rsc_BRESP <= hybrid_core_inst_twiddle_h_rsc_BRESP;
  hybrid_core_inst_twiddle_h_rsc_WSTRB <= twiddle_h_rsc_WSTRB;
  hybrid_core_inst_twiddle_h_rsc_WDATA <= twiddle_h_rsc_WDATA;
  hybrid_core_inst_twiddle_h_rsc_AWREGION <= twiddle_h_rsc_AWREGION;
  hybrid_core_inst_twiddle_h_rsc_AWQOS <= twiddle_h_rsc_AWQOS;
  hybrid_core_inst_twiddle_h_rsc_AWPROT <= twiddle_h_rsc_AWPROT;
  hybrid_core_inst_twiddle_h_rsc_AWCACHE <= twiddle_h_rsc_AWCACHE;
  hybrid_core_inst_twiddle_h_rsc_AWBURST <= twiddle_h_rsc_AWBURST;
  hybrid_core_inst_twiddle_h_rsc_AWSIZE <= twiddle_h_rsc_AWSIZE;
  hybrid_core_inst_twiddle_h_rsc_AWLEN <= twiddle_h_rsc_AWLEN;
  hybrid_core_inst_twiddle_h_rsc_AWADDR <= twiddle_h_rsc_AWADDR;
  revArr_rsc_RRESP <= hybrid_core_inst_revArr_rsc_RRESP;
  revArr_rsc_RDATA <= hybrid_core_inst_revArr_rsc_RDATA;
  hybrid_core_inst_revArr_rsc_ARREGION <= revArr_rsc_ARREGION;
  hybrid_core_inst_revArr_rsc_ARQOS <= revArr_rsc_ARQOS;
  hybrid_core_inst_revArr_rsc_ARPROT <= revArr_rsc_ARPROT;
  hybrid_core_inst_revArr_rsc_ARCACHE <= revArr_rsc_ARCACHE;
  hybrid_core_inst_revArr_rsc_ARBURST <= revArr_rsc_ARBURST;
  hybrid_core_inst_revArr_rsc_ARSIZE <= revArr_rsc_ARSIZE;
  hybrid_core_inst_revArr_rsc_ARLEN <= revArr_rsc_ARLEN;
  hybrid_core_inst_revArr_rsc_ARADDR <= revArr_rsc_ARADDR;
  revArr_rsc_BRESP <= hybrid_core_inst_revArr_rsc_BRESP;
  hybrid_core_inst_revArr_rsc_WSTRB <= revArr_rsc_WSTRB;
  hybrid_core_inst_revArr_rsc_WDATA <= revArr_rsc_WDATA;
  hybrid_core_inst_revArr_rsc_AWREGION <= revArr_rsc_AWREGION;
  hybrid_core_inst_revArr_rsc_AWQOS <= revArr_rsc_AWQOS;
  hybrid_core_inst_revArr_rsc_AWPROT <= revArr_rsc_AWPROT;
  hybrid_core_inst_revArr_rsc_AWCACHE <= revArr_rsc_AWCACHE;
  hybrid_core_inst_revArr_rsc_AWBURST <= revArr_rsc_AWBURST;
  hybrid_core_inst_revArr_rsc_AWSIZE <= revArr_rsc_AWSIZE;
  hybrid_core_inst_revArr_rsc_AWLEN <= revArr_rsc_AWLEN;
  hybrid_core_inst_revArr_rsc_AWADDR <= revArr_rsc_AWADDR;
  tw_rsc_RRESP <= hybrid_core_inst_tw_rsc_RRESP;
  tw_rsc_RDATA <= hybrid_core_inst_tw_rsc_RDATA;
  hybrid_core_inst_tw_rsc_ARREGION <= tw_rsc_ARREGION;
  hybrid_core_inst_tw_rsc_ARQOS <= tw_rsc_ARQOS;
  hybrid_core_inst_tw_rsc_ARPROT <= tw_rsc_ARPROT;
  hybrid_core_inst_tw_rsc_ARCACHE <= tw_rsc_ARCACHE;
  hybrid_core_inst_tw_rsc_ARBURST <= tw_rsc_ARBURST;
  hybrid_core_inst_tw_rsc_ARSIZE <= tw_rsc_ARSIZE;
  hybrid_core_inst_tw_rsc_ARLEN <= tw_rsc_ARLEN;
  hybrid_core_inst_tw_rsc_ARADDR <= tw_rsc_ARADDR;
  tw_rsc_BRESP <= hybrid_core_inst_tw_rsc_BRESP;
  hybrid_core_inst_tw_rsc_WSTRB <= tw_rsc_WSTRB;
  hybrid_core_inst_tw_rsc_WDATA <= tw_rsc_WDATA;
  hybrid_core_inst_tw_rsc_AWREGION <= tw_rsc_AWREGION;
  hybrid_core_inst_tw_rsc_AWQOS <= tw_rsc_AWQOS;
  hybrid_core_inst_tw_rsc_AWPROT <= tw_rsc_AWPROT;
  hybrid_core_inst_tw_rsc_AWCACHE <= tw_rsc_AWCACHE;
  hybrid_core_inst_tw_rsc_AWBURST <= tw_rsc_AWBURST;
  hybrid_core_inst_tw_rsc_AWSIZE <= tw_rsc_AWSIZE;
  hybrid_core_inst_tw_rsc_AWLEN <= tw_rsc_AWLEN;
  hybrid_core_inst_tw_rsc_AWADDR <= tw_rsc_AWADDR;
  tw_h_rsc_RRESP <= hybrid_core_inst_tw_h_rsc_RRESP;
  tw_h_rsc_RDATA <= hybrid_core_inst_tw_h_rsc_RDATA;
  hybrid_core_inst_tw_h_rsc_ARREGION <= tw_h_rsc_ARREGION;
  hybrid_core_inst_tw_h_rsc_ARQOS <= tw_h_rsc_ARQOS;
  hybrid_core_inst_tw_h_rsc_ARPROT <= tw_h_rsc_ARPROT;
  hybrid_core_inst_tw_h_rsc_ARCACHE <= tw_h_rsc_ARCACHE;
  hybrid_core_inst_tw_h_rsc_ARBURST <= tw_h_rsc_ARBURST;
  hybrid_core_inst_tw_h_rsc_ARSIZE <= tw_h_rsc_ARSIZE;
  hybrid_core_inst_tw_h_rsc_ARLEN <= tw_h_rsc_ARLEN;
  hybrid_core_inst_tw_h_rsc_ARADDR <= tw_h_rsc_ARADDR;
  tw_h_rsc_BRESP <= hybrid_core_inst_tw_h_rsc_BRESP;
  hybrid_core_inst_tw_h_rsc_WSTRB <= tw_h_rsc_WSTRB;
  hybrid_core_inst_tw_h_rsc_WDATA <= tw_h_rsc_WDATA;
  hybrid_core_inst_tw_h_rsc_AWREGION <= tw_h_rsc_AWREGION;
  hybrid_core_inst_tw_h_rsc_AWQOS <= tw_h_rsc_AWQOS;
  hybrid_core_inst_tw_h_rsc_AWPROT <= tw_h_rsc_AWPROT;
  hybrid_core_inst_tw_h_rsc_AWCACHE <= tw_h_rsc_AWCACHE;
  hybrid_core_inst_tw_h_rsc_AWBURST <= tw_h_rsc_AWBURST;
  hybrid_core_inst_tw_h_rsc_AWSIZE <= tw_h_rsc_AWSIZE;
  hybrid_core_inst_tw_h_rsc_AWLEN <= tw_h_rsc_AWLEN;
  hybrid_core_inst_tw_h_rsc_AWADDR <= tw_h_rsc_AWADDR;
  xx_rsci_d_d <= hybrid_core_inst_xx_rsci_d_d;
  hybrid_core_inst_xx_rsci_q_d <= xx_rsci_q_d;
  xx_rsci_radr_d <= hybrid_core_inst_xx_rsci_radr_d;
  xx_rsci_wadr_d <= hybrid_core_inst_xx_rsci_wadr_d;
  yy_rsci_d_d <= hybrid_core_inst_yy_rsci_d_d;
  hybrid_core_inst_yy_rsci_q_d <= yy_rsci_q_d;
  yy_rsci_radr_d <= hybrid_core_inst_yy_rsci_radr_d;
  yy_rsci_wadr_d <= hybrid_core_inst_yy_rsci_wadr_d;
  S34_OUTER_LOOP_for_tf_mul_cmp_a <= hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_a;
  S34_OUTER_LOOP_for_tf_mul_cmp_b <= hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_b;
  hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(S34_OUTER_LOOP_for_tf_mul_cmp_a) * UNSIGNED(S34_OUTER_LOOP_for_tf_mul_cmp_b)),
      10));

END v2;



