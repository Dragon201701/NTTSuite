
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
--  Generated date: Mon Sep 13 23:04:35 2021
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

ARCHITECTURE v5 OF hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v5;

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

ARCHITECTURE v5 OF hybrid_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v5;

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
    S2_INNER_LOOP1_for_C_23_tr0 : IN STD_LOGIC;
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
    S5_INNER_LOOP1_for_C_23_tr0 : IN STD_LOGIC;
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

ARCHITECTURE v5 OF hybrid_core_core_fsm IS
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
      S2_INNER_LOOP1_for_C_22, S2_INNER_LOOP1_for_C_23, S2_INNER_LOOP1_C_0, S2_OUTER_LOOP_C_1,
      S2_INNER_LOOP2_for_C_0, S2_INNER_LOOP2_for_C_1, S2_INNER_LOOP2_for_C_2, S2_INNER_LOOP2_for_C_3,
      S2_INNER_LOOP2_for_C_4, S2_INNER_LOOP2_for_C_5, S2_INNER_LOOP2_for_C_6, S2_INNER_LOOP2_for_C_7,
      S2_INNER_LOOP2_for_C_8, S2_INNER_LOOP2_for_C_9, S2_INNER_LOOP2_for_C_10, S2_INNER_LOOP2_for_C_11,
      S2_INNER_LOOP2_for_C_12, S2_INNER_LOOP2_for_C_13, S2_INNER_LOOP2_for_C_14,
      S2_INNER_LOOP2_for_C_15, S2_INNER_LOOP2_for_C_16, S2_INNER_LOOP2_for_C_17,
      S2_INNER_LOOP2_for_C_18, S2_INNER_LOOP2_for_C_19, S2_INNER_LOOP2_for_C_20,
      S2_INNER_LOOP2_for_C_21, S2_INNER_LOOP2_for_C_22, S2_INNER_LOOP2_for_C_23,
      S2_INNER_LOOP2_C_0, S2_INNER_LOOP3_for_C_0, S2_INNER_LOOP3_for_C_1, S2_INNER_LOOP3_for_C_2,
      S2_INNER_LOOP3_for_C_3, S2_INNER_LOOP3_for_C_4, S2_INNER_LOOP3_for_C_5, S2_INNER_LOOP3_for_C_6,
      S2_INNER_LOOP3_for_C_7, S2_INNER_LOOP3_for_C_8, S2_INNER_LOOP3_for_C_9, S2_INNER_LOOP3_for_C_10,
      S2_INNER_LOOP3_for_C_11, S2_INNER_LOOP3_for_C_12, S2_INNER_LOOP3_for_C_13,
      S2_INNER_LOOP3_for_C_14, S2_INNER_LOOP3_for_C_15, S2_INNER_LOOP3_for_C_16,
      S2_INNER_LOOP3_for_C_17, S2_INNER_LOOP3_for_C_18, S2_INNER_LOOP3_for_C_19,
      S2_INNER_LOOP3_for_C_20, S2_INNER_LOOP3_for_C_21, S2_INNER_LOOP3_for_C_22,
      S2_INNER_LOOP3_for_C_23, S2_INNER_LOOP3_C_0, S34_OUTER_LOOP_for_C_0, S34_OUTER_LOOP_for_C_1,
      S34_OUTER_LOOP_for_C_2, S34_OUTER_LOOP_for_C_3, S34_OUTER_LOOP_for_C_4, S34_OUTER_LOOP_for_C_5,
      S34_OUTER_LOOP_for_C_6, S34_OUTER_LOOP_for_C_7, S34_OUTER_LOOP_for_C_8, S34_OUTER_LOOP_for_C_9,
      S34_OUTER_LOOP_for_C_10, S34_OUTER_LOOP_for_C_11, S34_OUTER_LOOP_for_C_12,
      S34_OUTER_LOOP_C_0, S5_COPY_LOOP_for_C_0, S5_COPY_LOOP_for_C_1, S5_COPY_LOOP_for_C_2,
      S5_COPY_LOOP_for_C_3, S5_COPY_LOOP_C_0, S5_OUTER_LOOP_C_0, S5_INNER_LOOP1_for_C_0,
      S5_INNER_LOOP1_for_C_1, S5_INNER_LOOP1_for_C_2, S5_INNER_LOOP1_for_C_3, S5_INNER_LOOP1_for_C_4,
      S5_INNER_LOOP1_for_C_5, S5_INNER_LOOP1_for_C_6, S5_INNER_LOOP1_for_C_7, S5_INNER_LOOP1_for_C_8,
      S5_INNER_LOOP1_for_C_9, S5_INNER_LOOP1_for_C_10, S5_INNER_LOOP1_for_C_11, S5_INNER_LOOP1_for_C_12,
      S5_INNER_LOOP1_for_C_13, S5_INNER_LOOP1_for_C_14, S5_INNER_LOOP1_for_C_15,
      S5_INNER_LOOP1_for_C_16, S5_INNER_LOOP1_for_C_17, S5_INNER_LOOP1_for_C_18,
      S5_INNER_LOOP1_for_C_19, S5_INNER_LOOP1_for_C_20, S5_INNER_LOOP1_for_C_21,
      S5_INNER_LOOP1_for_C_22, S5_INNER_LOOP1_for_C_23, S5_INNER_LOOP1_C_0, S5_OUTER_LOOP_C_1,
      S5_INNER_LOOP2_for_C_0, S5_INNER_LOOP2_for_C_1, S5_INNER_LOOP2_for_C_2, S5_INNER_LOOP2_for_C_3,
      S5_INNER_LOOP2_for_C_4, S5_INNER_LOOP2_for_C_5, S5_INNER_LOOP2_for_C_6, S5_INNER_LOOP2_for_C_7,
      S5_INNER_LOOP2_for_C_8, S5_INNER_LOOP2_for_C_9, S5_INNER_LOOP2_for_C_10, S5_INNER_LOOP2_for_C_11,
      S5_INNER_LOOP2_for_C_12, S5_INNER_LOOP2_for_C_13, S5_INNER_LOOP2_for_C_14,
      S5_INNER_LOOP2_for_C_15, S5_INNER_LOOP2_for_C_16, S5_INNER_LOOP2_for_C_17,
      S5_INNER_LOOP2_for_C_18, S5_INNER_LOOP2_for_C_19, S5_INNER_LOOP2_for_C_20,
      S5_INNER_LOOP2_for_C_21, S5_INNER_LOOP2_for_C_22, S5_INNER_LOOP2_for_C_23,
      S5_INNER_LOOP2_C_0, S5_INNER_LOOP3_for_C_0, S5_INNER_LOOP3_for_C_1, S5_INNER_LOOP3_for_C_2,
      S5_INNER_LOOP3_for_C_3, S5_INNER_LOOP3_for_C_4, S5_INNER_LOOP3_for_C_5, S5_INNER_LOOP3_for_C_6,
      S5_INNER_LOOP3_for_C_7, S5_INNER_LOOP3_for_C_8, S5_INNER_LOOP3_for_C_9, S5_INNER_LOOP3_for_C_10,
      S5_INNER_LOOP3_for_C_11, S5_INNER_LOOP3_for_C_12, S5_INNER_LOOP3_for_C_13,
      S5_INNER_LOOP3_for_C_14, S5_INNER_LOOP3_for_C_15, S5_INNER_LOOP3_for_C_16,
      S5_INNER_LOOP3_for_C_17, S5_INNER_LOOP3_for_C_18, S5_INNER_LOOP3_for_C_19,
      S5_INNER_LOOP3_for_C_20, S5_INNER_LOOP3_for_C_21, S5_INNER_LOOP3_for_C_22,
      S5_INNER_LOOP3_for_C_23, S5_INNER_LOOP3_C_0, S6_OUTER_LOOP_for_C_0, S6_OUTER_LOOP_for_C_1,
      S6_OUTER_LOOP_for_C_2, S6_OUTER_LOOP_for_C_3, S6_OUTER_LOOP_C_0, main_C_1);

  SIGNAL state_var : hybrid_core_core_fsm_1_ST;
  SIGNAL state_var_NS : hybrid_core_core_fsm_1_ST;

BEGIN
  hybrid_core_core_fsm_1 : PROCESS (S1_OUTER_LOOP_for_C_4_tr0, S1_OUTER_LOOP_C_0_tr0,
      S2_COPY_LOOP_for_C_3_tr0, S2_COPY_LOOP_C_0_tr0, S2_INNER_LOOP1_for_C_23_tr0,
      S2_INNER_LOOP1_C_0_tr0, S2_INNER_LOOP2_for_C_23_tr0, S2_INNER_LOOP2_C_0_tr0,
      S2_INNER_LOOP2_C_0_tr1, S2_INNER_LOOP3_for_C_23_tr0, S2_INNER_LOOP3_C_0_tr0,
      S34_OUTER_LOOP_for_C_12_tr0, S34_OUTER_LOOP_C_0_tr0, S5_COPY_LOOP_for_C_3_tr0,
      S5_COPY_LOOP_C_0_tr0, S5_INNER_LOOP1_for_C_23_tr0, S5_INNER_LOOP1_C_0_tr0,
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
        IF ( S2_INNER_LOOP1_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP1_C_0;
        ELSE
          state_var_NS <= S2_INNER_LOOP1_for_C_0;
        END IF;
      WHEN S2_INNER_LOOP1_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        IF ( S2_INNER_LOOP1_C_0_tr0 = '1' ) THEN
          state_var_NS <= S2_OUTER_LOOP_C_1;
        ELSE
          state_var_NS <= S2_INNER_LOOP1_for_C_0;
        END IF;
      WHEN S2_OUTER_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        state_var_NS <= S2_INNER_LOOP2_for_C_0;
      WHEN S2_INNER_LOOP2_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= S2_INNER_LOOP2_for_C_1;
      WHEN S2_INNER_LOOP2_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= S2_INNER_LOOP2_for_C_2;
      WHEN S2_INNER_LOOP2_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= S2_INNER_LOOP2_for_C_3;
      WHEN S2_INNER_LOOP2_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        state_var_NS <= S2_INNER_LOOP2_for_C_4;
      WHEN S2_INNER_LOOP2_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        state_var_NS <= S2_INNER_LOOP2_for_C_5;
      WHEN S2_INNER_LOOP2_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= S2_INNER_LOOP2_for_C_6;
      WHEN S2_INNER_LOOP2_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= S2_INNER_LOOP2_for_C_7;
      WHEN S2_INNER_LOOP2_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= S2_INNER_LOOP2_for_C_8;
      WHEN S2_INNER_LOOP2_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= S2_INNER_LOOP2_for_C_9;
      WHEN S2_INNER_LOOP2_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        state_var_NS <= S2_INNER_LOOP2_for_C_10;
      WHEN S2_INNER_LOOP2_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= S2_INNER_LOOP2_for_C_11;
      WHEN S2_INNER_LOOP2_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        state_var_NS <= S2_INNER_LOOP2_for_C_12;
      WHEN S2_INNER_LOOP2_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= S2_INNER_LOOP2_for_C_13;
      WHEN S2_INNER_LOOP2_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        state_var_NS <= S2_INNER_LOOP2_for_C_14;
      WHEN S2_INNER_LOOP2_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        state_var_NS <= S2_INNER_LOOP2_for_C_15;
      WHEN S2_INNER_LOOP2_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= S2_INNER_LOOP2_for_C_16;
      WHEN S2_INNER_LOOP2_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= S2_INNER_LOOP2_for_C_17;
      WHEN S2_INNER_LOOP2_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= S2_INNER_LOOP2_for_C_18;
      WHEN S2_INNER_LOOP2_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        state_var_NS <= S2_INNER_LOOP2_for_C_19;
      WHEN S2_INNER_LOOP2_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        state_var_NS <= S2_INNER_LOOP2_for_C_20;
      WHEN S2_INNER_LOOP2_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        state_var_NS <= S2_INNER_LOOP2_for_C_21;
      WHEN S2_INNER_LOOP2_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        state_var_NS <= S2_INNER_LOOP2_for_C_22;
      WHEN S2_INNER_LOOP2_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        state_var_NS <= S2_INNER_LOOP2_for_C_23;
      WHEN S2_INNER_LOOP2_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        IF ( S2_INNER_LOOP2_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP2_C_0;
        ELSE
          state_var_NS <= S2_INNER_LOOP2_for_C_0;
        END IF;
      WHEN S2_INNER_LOOP2_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        IF ( S2_INNER_LOOP2_C_0_tr0 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP3_for_C_0;
        ELSIF ( S2_INNER_LOOP2_C_0_tr1 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP2_for_C_0;
        ELSE
          state_var_NS <= S2_OUTER_LOOP_C_0;
        END IF;
      WHEN S2_INNER_LOOP3_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= S2_INNER_LOOP3_for_C_1;
      WHEN S2_INNER_LOOP3_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= S2_INNER_LOOP3_for_C_2;
      WHEN S2_INNER_LOOP3_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= S2_INNER_LOOP3_for_C_3;
      WHEN S2_INNER_LOOP3_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= S2_INNER_LOOP3_for_C_4;
      WHEN S2_INNER_LOOP3_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= S2_INNER_LOOP3_for_C_5;
      WHEN S2_INNER_LOOP3_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= S2_INNER_LOOP3_for_C_6;
      WHEN S2_INNER_LOOP3_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= S2_INNER_LOOP3_for_C_7;
      WHEN S2_INNER_LOOP3_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= S2_INNER_LOOP3_for_C_8;
      WHEN S2_INNER_LOOP3_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        state_var_NS <= S2_INNER_LOOP3_for_C_9;
      WHEN S2_INNER_LOOP3_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        state_var_NS <= S2_INNER_LOOP3_for_C_10;
      WHEN S2_INNER_LOOP3_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= S2_INNER_LOOP3_for_C_11;
      WHEN S2_INNER_LOOP3_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= S2_INNER_LOOP3_for_C_12;
      WHEN S2_INNER_LOOP3_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= S2_INNER_LOOP3_for_C_13;
      WHEN S2_INNER_LOOP3_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= S2_INNER_LOOP3_for_C_14;
      WHEN S2_INNER_LOOP3_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= S2_INNER_LOOP3_for_C_15;
      WHEN S2_INNER_LOOP3_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= S2_INNER_LOOP3_for_C_16;
      WHEN S2_INNER_LOOP3_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= S2_INNER_LOOP3_for_C_17;
      WHEN S2_INNER_LOOP3_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= S2_INNER_LOOP3_for_C_18;
      WHEN S2_INNER_LOOP3_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        state_var_NS <= S2_INNER_LOOP3_for_C_19;
      WHEN S2_INNER_LOOP3_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        state_var_NS <= S2_INNER_LOOP3_for_C_20;
      WHEN S2_INNER_LOOP3_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= S2_INNER_LOOP3_for_C_21;
      WHEN S2_INNER_LOOP3_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= S2_INNER_LOOP3_for_C_22;
      WHEN S2_INNER_LOOP3_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        state_var_NS <= S2_INNER_LOOP3_for_C_23;
      WHEN S2_INNER_LOOP3_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        IF ( S2_INNER_LOOP3_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S2_INNER_LOOP3_C_0;
        ELSE
          state_var_NS <= S2_INNER_LOOP3_for_C_0;
        END IF;
      WHEN S2_INNER_LOOP3_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        IF ( S2_INNER_LOOP3_C_0_tr0 = '1' ) THEN
          state_var_NS <= S34_OUTER_LOOP_for_C_0;
        ELSE
          state_var_NS <= S2_INNER_LOOP3_for_C_0;
        END IF;
      WHEN S34_OUTER_LOOP_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        state_var_NS <= S34_OUTER_LOOP_for_C_1;
      WHEN S34_OUTER_LOOP_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= S34_OUTER_LOOP_for_C_2;
      WHEN S34_OUTER_LOOP_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= S34_OUTER_LOOP_for_C_3;
      WHEN S34_OUTER_LOOP_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        state_var_NS <= S34_OUTER_LOOP_for_C_4;
      WHEN S34_OUTER_LOOP_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        state_var_NS <= S34_OUTER_LOOP_for_C_5;
      WHEN S34_OUTER_LOOP_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= S34_OUTER_LOOP_for_C_6;
      WHEN S34_OUTER_LOOP_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= S34_OUTER_LOOP_for_C_7;
      WHEN S34_OUTER_LOOP_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= S34_OUTER_LOOP_for_C_8;
      WHEN S34_OUTER_LOOP_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= S34_OUTER_LOOP_for_C_9;
      WHEN S34_OUTER_LOOP_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= S34_OUTER_LOOP_for_C_10;
      WHEN S34_OUTER_LOOP_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= S34_OUTER_LOOP_for_C_11;
      WHEN S34_OUTER_LOOP_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= S34_OUTER_LOOP_for_C_12;
      WHEN S34_OUTER_LOOP_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        IF ( S34_OUTER_LOOP_for_C_12_tr0 = '1' ) THEN
          state_var_NS <= S34_OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= S34_OUTER_LOOP_for_C_0;
        END IF;
      WHEN S34_OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        IF ( S34_OUTER_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= S5_COPY_LOOP_for_C_0;
        ELSE
          state_var_NS <= S34_OUTER_LOOP_for_C_0;
        END IF;
      WHEN S5_COPY_LOOP_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        state_var_NS <= S5_COPY_LOOP_for_C_1;
      WHEN S5_COPY_LOOP_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= S5_COPY_LOOP_for_C_2;
      WHEN S5_COPY_LOOP_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= S5_COPY_LOOP_for_C_3;
      WHEN S5_COPY_LOOP_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        IF ( S5_COPY_LOOP_for_C_3_tr0 = '1' ) THEN
          state_var_NS <= S5_COPY_LOOP_C_0;
        ELSE
          state_var_NS <= S5_COPY_LOOP_for_C_0;
        END IF;
      WHEN S5_COPY_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        IF ( S5_COPY_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= S5_OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= S5_COPY_LOOP_for_C_0;
        END IF;
      WHEN S5_OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        state_var_NS <= S5_INNER_LOOP1_for_C_0;
      WHEN S5_INNER_LOOP1_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        state_var_NS <= S5_INNER_LOOP1_for_C_1;
      WHEN S5_INNER_LOOP1_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= S5_INNER_LOOP1_for_C_2;
      WHEN S5_INNER_LOOP1_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= S5_INNER_LOOP1_for_C_3;
      WHEN S5_INNER_LOOP1_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        state_var_NS <= S5_INNER_LOOP1_for_C_4;
      WHEN S5_INNER_LOOP1_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        state_var_NS <= S5_INNER_LOOP1_for_C_5;
      WHEN S5_INNER_LOOP1_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        state_var_NS <= S5_INNER_LOOP1_for_C_6;
      WHEN S5_INNER_LOOP1_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= S5_INNER_LOOP1_for_C_7;
      WHEN S5_INNER_LOOP1_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= S5_INNER_LOOP1_for_C_8;
      WHEN S5_INNER_LOOP1_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= S5_INNER_LOOP1_for_C_9;
      WHEN S5_INNER_LOOP1_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= S5_INNER_LOOP1_for_C_10;
      WHEN S5_INNER_LOOP1_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        state_var_NS <= S5_INNER_LOOP1_for_C_11;
      WHEN S5_INNER_LOOP1_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= S5_INNER_LOOP1_for_C_12;
      WHEN S5_INNER_LOOP1_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= S5_INNER_LOOP1_for_C_13;
      WHEN S5_INNER_LOOP1_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        state_var_NS <= S5_INNER_LOOP1_for_C_14;
      WHEN S5_INNER_LOOP1_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        state_var_NS <= S5_INNER_LOOP1_for_C_15;
      WHEN S5_INNER_LOOP1_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= S5_INNER_LOOP1_for_C_16;
      WHEN S5_INNER_LOOP1_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= S5_INNER_LOOP1_for_C_17;
      WHEN S5_INNER_LOOP1_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= S5_INNER_LOOP1_for_C_18;
      WHEN S5_INNER_LOOP1_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= S5_INNER_LOOP1_for_C_19;
      WHEN S5_INNER_LOOP1_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= S5_INNER_LOOP1_for_C_20;
      WHEN S5_INNER_LOOP1_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= S5_INNER_LOOP1_for_C_21;
      WHEN S5_INNER_LOOP1_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= S5_INNER_LOOP1_for_C_22;
      WHEN S5_INNER_LOOP1_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= S5_INNER_LOOP1_for_C_23;
      WHEN S5_INNER_LOOP1_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        IF ( S5_INNER_LOOP1_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP1_C_0;
        ELSE
          state_var_NS <= S5_INNER_LOOP1_for_C_0;
        END IF;
      WHEN S5_INNER_LOOP1_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        IF ( S5_INNER_LOOP1_C_0_tr0 = '1' ) THEN
          state_var_NS <= S5_OUTER_LOOP_C_1;
        ELSE
          state_var_NS <= S5_INNER_LOOP1_for_C_0;
        END IF;
      WHEN S5_OUTER_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        state_var_NS <= S5_INNER_LOOP2_for_C_0;
      WHEN S5_INNER_LOOP2_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        state_var_NS <= S5_INNER_LOOP2_for_C_1;
      WHEN S5_INNER_LOOP2_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= S5_INNER_LOOP2_for_C_2;
      WHEN S5_INNER_LOOP2_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        state_var_NS <= S5_INNER_LOOP2_for_C_3;
      WHEN S5_INNER_LOOP2_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= S5_INNER_LOOP2_for_C_4;
      WHEN S5_INNER_LOOP2_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= S5_INNER_LOOP2_for_C_5;
      WHEN S5_INNER_LOOP2_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        state_var_NS <= S5_INNER_LOOP2_for_C_6;
      WHEN S5_INNER_LOOP2_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        state_var_NS <= S5_INNER_LOOP2_for_C_7;
      WHEN S5_INNER_LOOP2_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        state_var_NS <= S5_INNER_LOOP2_for_C_8;
      WHEN S5_INNER_LOOP2_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001111");
        state_var_NS <= S5_INNER_LOOP2_for_C_9;
      WHEN S5_INNER_LOOP2_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010000");
        state_var_NS <= S5_INNER_LOOP2_for_C_10;
      WHEN S5_INNER_LOOP2_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010001");
        state_var_NS <= S5_INNER_LOOP2_for_C_11;
      WHEN S5_INNER_LOOP2_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010010");
        state_var_NS <= S5_INNER_LOOP2_for_C_12;
      WHEN S5_INNER_LOOP2_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010011");
        state_var_NS <= S5_INNER_LOOP2_for_C_13;
      WHEN S5_INNER_LOOP2_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010100");
        state_var_NS <= S5_INNER_LOOP2_for_C_14;
      WHEN S5_INNER_LOOP2_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010101");
        state_var_NS <= S5_INNER_LOOP2_for_C_15;
      WHEN S5_INNER_LOOP2_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010110");
        state_var_NS <= S5_INNER_LOOP2_for_C_16;
      WHEN S5_INNER_LOOP2_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010111");
        state_var_NS <= S5_INNER_LOOP2_for_C_17;
      WHEN S5_INNER_LOOP2_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011000");
        state_var_NS <= S5_INNER_LOOP2_for_C_18;
      WHEN S5_INNER_LOOP2_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011001");
        state_var_NS <= S5_INNER_LOOP2_for_C_19;
      WHEN S5_INNER_LOOP2_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011010");
        state_var_NS <= S5_INNER_LOOP2_for_C_20;
      WHEN S5_INNER_LOOP2_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011011");
        state_var_NS <= S5_INNER_LOOP2_for_C_21;
      WHEN S5_INNER_LOOP2_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011100");
        state_var_NS <= S5_INNER_LOOP2_for_C_22;
      WHEN S5_INNER_LOOP2_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011101");
        state_var_NS <= S5_INNER_LOOP2_for_C_23;
      WHEN S5_INNER_LOOP2_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011110");
        IF ( S5_INNER_LOOP2_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP2_C_0;
        ELSE
          state_var_NS <= S5_INNER_LOOP2_for_C_0;
        END IF;
      WHEN S5_INNER_LOOP2_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011111");
        IF ( S5_INNER_LOOP2_C_0_tr0 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP3_for_C_0;
        ELSIF ( S5_INNER_LOOP2_C_0_tr1 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP2_for_C_0;
        ELSE
          state_var_NS <= S5_OUTER_LOOP_C_0;
        END IF;
      WHEN S5_INNER_LOOP3_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        state_var_NS <= S5_INNER_LOOP3_for_C_1;
      WHEN S5_INNER_LOOP3_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        state_var_NS <= S5_INNER_LOOP3_for_C_2;
      WHEN S5_INNER_LOOP3_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
        state_var_NS <= S5_INNER_LOOP3_for_C_3;
      WHEN S5_INNER_LOOP3_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100011");
        state_var_NS <= S5_INNER_LOOP3_for_C_4;
      WHEN S5_INNER_LOOP3_for_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100100");
        state_var_NS <= S5_INNER_LOOP3_for_C_5;
      WHEN S5_INNER_LOOP3_for_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100101");
        state_var_NS <= S5_INNER_LOOP3_for_C_6;
      WHEN S5_INNER_LOOP3_for_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100110");
        state_var_NS <= S5_INNER_LOOP3_for_C_7;
      WHEN S5_INNER_LOOP3_for_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100111");
        state_var_NS <= S5_INNER_LOOP3_for_C_8;
      WHEN S5_INNER_LOOP3_for_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101000");
        state_var_NS <= S5_INNER_LOOP3_for_C_9;
      WHEN S5_INNER_LOOP3_for_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101001");
        state_var_NS <= S5_INNER_LOOP3_for_C_10;
      WHEN S5_INNER_LOOP3_for_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101010");
        state_var_NS <= S5_INNER_LOOP3_for_C_11;
      WHEN S5_INNER_LOOP3_for_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101011");
        state_var_NS <= S5_INNER_LOOP3_for_C_12;
      WHEN S5_INNER_LOOP3_for_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101100");
        state_var_NS <= S5_INNER_LOOP3_for_C_13;
      WHEN S5_INNER_LOOP3_for_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101101");
        state_var_NS <= S5_INNER_LOOP3_for_C_14;
      WHEN S5_INNER_LOOP3_for_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101110");
        state_var_NS <= S5_INNER_LOOP3_for_C_15;
      WHEN S5_INNER_LOOP3_for_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101111");
        state_var_NS <= S5_INNER_LOOP3_for_C_16;
      WHEN S5_INNER_LOOP3_for_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110000");
        state_var_NS <= S5_INNER_LOOP3_for_C_17;
      WHEN S5_INNER_LOOP3_for_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110001");
        state_var_NS <= S5_INNER_LOOP3_for_C_18;
      WHEN S5_INNER_LOOP3_for_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110010");
        state_var_NS <= S5_INNER_LOOP3_for_C_19;
      WHEN S5_INNER_LOOP3_for_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110011");
        state_var_NS <= S5_INNER_LOOP3_for_C_20;
      WHEN S5_INNER_LOOP3_for_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110100");
        state_var_NS <= S5_INNER_LOOP3_for_C_21;
      WHEN S5_INNER_LOOP3_for_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110101");
        state_var_NS <= S5_INNER_LOOP3_for_C_22;
      WHEN S5_INNER_LOOP3_for_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110110");
        state_var_NS <= S5_INNER_LOOP3_for_C_23;
      WHEN S5_INNER_LOOP3_for_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110111");
        IF ( S5_INNER_LOOP3_for_C_23_tr0 = '1' ) THEN
          state_var_NS <= S5_INNER_LOOP3_C_0;
        ELSE
          state_var_NS <= S5_INNER_LOOP3_for_C_0;
        END IF;
      WHEN S5_INNER_LOOP3_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111000");
        IF ( S5_INNER_LOOP3_C_0_tr0 = '1' ) THEN
          state_var_NS <= S6_OUTER_LOOP_for_C_0;
        ELSE
          state_var_NS <= S5_INNER_LOOP3_for_C_0;
        END IF;
      WHEN S6_OUTER_LOOP_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111001");
        state_var_NS <= S6_OUTER_LOOP_for_C_1;
      WHEN S6_OUTER_LOOP_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111010");
        state_var_NS <= S6_OUTER_LOOP_for_C_2;
      WHEN S6_OUTER_LOOP_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111011");
        state_var_NS <= S6_OUTER_LOOP_for_C_3;
      WHEN S6_OUTER_LOOP_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111100");
        IF ( S6_OUTER_LOOP_for_C_3_tr0 = '1' ) THEN
          state_var_NS <= S6_OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= S6_OUTER_LOOP_for_C_0;
        END IF;
      WHEN S6_OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111101");
        IF ( S6_OUTER_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= S6_OUTER_LOOP_for_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111110");
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

END v5;

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

ARCHITECTURE v5 OF hybrid_core_staller IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_h_rsc_triosy_obj_tw_h_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  tw_h_rsc_triosy_obj_ld_core_sct <= tw_h_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_rsc_triosy_obj_tw_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  tw_rsc_triosy_obj_ld_core_sct <= tw_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

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

ARCHITECTURE v5 OF hybrid_core_revArr_rsc_triosy_obj_revArr_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  revArr_rsc_triosy_obj_ld_core_sct <= revArr_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsc_triosy_obj_ld_core_sct <= twiddle_h_rsc_triosy_obj_iswt0 AND (NOT
      core_wten);
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsc_triosy_obj_ld_core_sct <= twiddle_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

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

ARCHITECTURE v5 OF hybrid_core_m_rsc_triosy_obj_m_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  m_rsc_triosy_obj_ld_core_sct <= m_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

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

ARCHITECTURE v5 OF hybrid_core_x_rsc_triosy_obj_x_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  x_rsc_triosy_obj_ld_core_sct <= x_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_h_rsci_tw_h_rsc_wait_dp IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_h_rsci_tw_h_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL tw_h_rsci_ogwt : STD_LOGIC;

BEGIN
  tw_h_rsci_bdwt <= tw_h_rsci_oswt AND core_wen;
  tw_h_rsci_biwt <= tw_h_rsci_ogwt AND tw_h_rsci_s_rrdy;
  tw_h_rsci_ogwt <= tw_h_rsci_oswt AND (NOT tw_h_rsci_bcwt);
  tw_h_rsci_s_re_core_sct <= tw_h_rsci_ogwt;
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_rsci_tw_rsc_wait_dp IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_rsci_tw_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL tw_rsci_ogwt : STD_LOGIC;

BEGIN
  tw_rsci_bdwt <= tw_rsci_oswt AND core_wen;
  tw_rsci_biwt <= tw_rsci_ogwt AND tw_rsci_s_rrdy;
  tw_rsci_ogwt <= tw_rsci_oswt AND (NOT tw_rsci_bcwt);
  tw_rsci_s_re_core_sct <= tw_rsci_ogwt;
END v5;

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

ARCHITECTURE v5 OF hybrid_core_revArr_rsci_revArr_rsc_wait_dp IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_revArr_rsci_revArr_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL revArr_rsci_ogwt : STD_LOGIC;

BEGIN
  revArr_rsci_bdwt <= revArr_rsci_oswt AND core_wen;
  revArr_rsci_biwt <= revArr_rsci_ogwt AND revArr_rsci_s_rrdy;
  revArr_rsci_ogwt <= revArr_rsci_oswt AND (NOT revArr_rsci_bcwt);
  revArr_rsci_s_re_core_sct <= revArr_rsci_ogwt;
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_dp IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_h_rsci_twiddle_h_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_ogwt : STD_LOGIC;

BEGIN
  twiddle_h_rsci_bdwt <= twiddle_h_rsci_oswt AND core_wen;
  twiddle_h_rsci_biwt <= twiddle_h_rsci_ogwt AND twiddle_h_rsci_s_rrdy;
  twiddle_h_rsci_ogwt <= twiddle_h_rsci_oswt AND (NOT twiddle_h_rsci_bcwt);
  twiddle_h_rsci_s_re_core_sct <= twiddle_h_rsci_ogwt;
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_rsci_twiddle_rsc_wait_dp IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_rsci_twiddle_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_ogwt : STD_LOGIC;

BEGIN
  twiddle_rsci_bdwt <= twiddle_rsci_oswt AND core_wen;
  twiddle_rsci_biwt <= twiddle_rsci_ogwt AND twiddle_rsci_s_rrdy;
  twiddle_rsci_ogwt <= twiddle_rsci_oswt AND (NOT twiddle_rsci_bcwt);
  twiddle_rsci_s_re_core_sct <= twiddle_rsci_ogwt;
END v5;

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

ARCHITECTURE v5 OF hybrid_core_x_rsci_x_rsc_wait_dp IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_x_rsci_x_rsc_wait_ctrl IS
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
END v5;

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
    S34_OUTER_LOOP_for_tf_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    ensig_cgo_iro : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    xx_rsc_cgo : IN STD_LOGIC;
    yy_rsc_cgo : IN STD_LOGIC;
    S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    ensig_cgo : IN STD_LOGIC;
    mult_z_mul_cmp_en : OUT STD_LOGIC
  );
END hybrid_core_wait_dp;

ARCHITECTURE v5 OF hybrid_core_wait_dp IS
  -- Default Constants

BEGIN
  xx_rsci_clken_d <= core_wen AND (xx_rsc_cgo OR xx_rsc_cgo_iro);
  yy_rsci_clken_d <= core_wen AND (yy_rsc_cgo OR yy_rsc_cgo_iro);
  mult_z_mul_cmp_en <= core_wen AND (ensig_cgo OR ensig_cgo_iro);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( core_wen = '1' ) THEN
        S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg <= S34_OUTER_LOOP_for_tf_mul_cmp_z;
      END IF;
    END IF;
  END PROCESS;
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_h_rsc_triosy_obj IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_rsc_triosy_obj IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_revArr_rsc_triosy_obj IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_h_rsc_triosy_obj IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_rsc_triosy_obj IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_m_rsc_triosy_obj IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_x_rsc_triosy_obj IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_h_rsci IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_tw_rsci IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_revArr_rsci IS
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
END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_h_rsci IS
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

END v5;

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

ARCHITECTURE v5 OF hybrid_core_twiddle_rsci IS
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

END v5;

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

ARCHITECTURE v5 OF hybrid_core_x_rsci IS
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

END v5;

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
    S34_OUTER_LOOP_for_tf_mul_cmp_a : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    S34_OUTER_LOOP_for_tf_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    S34_OUTER_LOOP_for_tf_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xx_rsci_we_d_pff : OUT STD_LOGIC;
    yy_rsci_we_d_pff : OUT STD_LOGIC
  );
END hybrid_core;

ARCHITECTURE v5 OF hybrid_core IS
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
  SIGNAL S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_en : STD_LOGIC;
  SIGNAL mult_z_mul_cmp_z : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL x_rsci_s_raddr_core_9_5 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL x_rsci_s_raddr_core_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL x_rsci_s_waddr_core_9_5 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL x_rsci_s_waddr_core_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_tmp_1 : STD_LOGIC;
  SIGNAL xor_dcpl : STD_LOGIC;
  SIGNAL mux_tmp_11 : STD_LOGIC;
  SIGNAL nor_tmp_8 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL xor_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL nand_tmp_10 : STD_LOGIC;
  SIGNAL mux_tmp_56 : STD_LOGIC;
  SIGNAL nand_tmp_11 : STD_LOGIC;
  SIGNAL mux_tmp_59 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL or_dcpl_12 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL or_tmp_64 : STD_LOGIC;
  SIGNAL or_tmp_65 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL or_tmp_85 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL mux_tmp_93 : STD_LOGIC;
  SIGNAL or_tmp_96 : STD_LOGIC;
  SIGNAL or_tmp_97 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL and_dcpl_97 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_103 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL and_dcpl_107 : STD_LOGIC;
  SIGNAL and_dcpl_108 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL and_dcpl_115 : STD_LOGIC;
  SIGNAL and_dcpl_116 : STD_LOGIC;
  SIGNAL and_dcpl_117 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL and_dcpl_124 : STD_LOGIC;
  SIGNAL and_dcpl_126 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL and_dcpl_131 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL or_tmp_99 : STD_LOGIC;
  SIGNAL or_tmp_101 : STD_LOGIC;
  SIGNAL or_tmp_102 : STD_LOGIC;
  SIGNAL mux_tmp_100 : STD_LOGIC;
  SIGNAL or_tmp_108 : STD_LOGIC;
  SIGNAL or_tmp_109 : STD_LOGIC;
  SIGNAL or_tmp_110 : STD_LOGIC;
  SIGNAL or_tmp_112 : STD_LOGIC;
  SIGNAL mux_tmp_107 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL and_dcpl_147 : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL or_tmp_119 : STD_LOGIC;
  SIGNAL or_tmp_120 : STD_LOGIC;
  SIGNAL mux_tmp_114 : STD_LOGIC;
  SIGNAL not_tmp_113 : STD_LOGIC;
  SIGNAL or_tmp_130 : STD_LOGIC;
  SIGNAL or_tmp_132 : STD_LOGIC;
  SIGNAL mux_tmp_121 : STD_LOGIC;
  SIGNAL or_tmp_147 : STD_LOGIC;
  SIGNAL or_tmp_151 : STD_LOGIC;
  SIGNAL mux_tmp_136 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL mux_tmp_142 : STD_LOGIC;
  SIGNAL or_tmp_157 : STD_LOGIC;
  SIGNAL or_tmp_158 : STD_LOGIC;
  SIGNAL mux_tmp_151 : STD_LOGIC;
  SIGNAL and_dcpl_161 : STD_LOGIC;
  SIGNAL or_tmp_186 : STD_LOGIC;
  SIGNAL or_tmp_188 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_167 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL and_dcpl_172 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_177 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL and_dcpl_182 : STD_LOGIC;
  SIGNAL and_dcpl_185 : STD_LOGIC;
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_193 : STD_LOGIC;
  SIGNAL or_tmp_190 : STD_LOGIC;
  SIGNAL and_dcpl_195 : STD_LOGIC;
  SIGNAL or_tmp_193 : STD_LOGIC;
  SIGNAL or_tmp_194 : STD_LOGIC;
  SIGNAL mux_tmp_183 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL or_tmp_204 : STD_LOGIC;
  SIGNAL or_tmp_206 : STD_LOGIC;
  SIGNAL mux_tmp_192 : STD_LOGIC;
  SIGNAL or_tmp_210 : STD_LOGIC;
  SIGNAL nor_tmp_32 : STD_LOGIC;
  SIGNAL or_tmp_222 : STD_LOGIC;
  SIGNAL mux_tmp_205 : STD_LOGIC;
  SIGNAL mux_tmp_208 : STD_LOGIC;
  SIGNAL and_dcpl_214 : STD_LOGIC;
  SIGNAL nor_tmp_35 : STD_LOGIC;
  SIGNAL mux_tmp_219 : STD_LOGIC;
  SIGNAL or_tmp_239 : STD_LOGIC;
  SIGNAL or_tmp_249 : STD_LOGIC;
  SIGNAL or_tmp_252 : STD_LOGIC;
  SIGNAL or_tmp_260 : STD_LOGIC;
  SIGNAL or_tmp_286 : STD_LOGIC;
  SIGNAL or_tmp_297 : STD_LOGIC;
  SIGNAL not_tmp_184 : STD_LOGIC;
  SIGNAL or_tmp_314 : STD_LOGIC;
  SIGNAL nand_tmp_25 : STD_LOGIC;
  SIGNAL or_dcpl_17 : STD_LOGIC;
  SIGNAL or_tmp_421 : STD_LOGIC;
  SIGNAL and_dcpl_240 : STD_LOGIC;
  SIGNAL and_dcpl_242 : STD_LOGIC;
  SIGNAL and_dcpl_245 : STD_LOGIC;
  SIGNAL and_dcpl_246 : STD_LOGIC;
  SIGNAL and_dcpl_250 : STD_LOGIC;
  SIGNAL and_dcpl_256 : STD_LOGIC;
  SIGNAL or_tmp_477 : STD_LOGIC;
  SIGNAL mux_tmp_441 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL and_dcpl_267 : STD_LOGIC;
  SIGNAL and_dcpl_268 : STD_LOGIC;
  SIGNAL and_dcpl_269 : STD_LOGIC;
  SIGNAL and_dcpl_270 : STD_LOGIC;
  SIGNAL and_dcpl_271 : STD_LOGIC;
  SIGNAL and_dcpl_272 : STD_LOGIC;
  SIGNAL and_dcpl_273 : STD_LOGIC;
  SIGNAL and_dcpl_274 : STD_LOGIC;
  SIGNAL and_dcpl_275 : STD_LOGIC;
  SIGNAL and_dcpl_276 : STD_LOGIC;
  SIGNAL and_dcpl_277 : STD_LOGIC;
  SIGNAL and_dcpl_278 : STD_LOGIC;
  SIGNAL and_dcpl_279 : STD_LOGIC;
  SIGNAL and_dcpl_280 : STD_LOGIC;
  SIGNAL and_dcpl_281 : STD_LOGIC;
  SIGNAL and_dcpl_282 : STD_LOGIC;
  SIGNAL and_dcpl_283 : STD_LOGIC;
  SIGNAL and_dcpl_284 : STD_LOGIC;
  SIGNAL and_dcpl_285 : STD_LOGIC;
  SIGNAL or_tmp_522 : STD_LOGIC;
  SIGNAL or_tmp_524 : STD_LOGIC;
  SIGNAL or_tmp_553 : STD_LOGIC;
  SIGNAL or_tmp_621 : STD_LOGIC;
  SIGNAL or_tmp_639 : STD_LOGIC;
  SIGNAL mux_tmp_579 : STD_LOGIC;
  SIGNAL or_dcpl_26 : STD_LOGIC;
  SIGNAL or_dcpl_59 : STD_LOGIC;
  SIGNAL or_dcpl_61 : STD_LOGIC;
  SIGNAL or_dcpl_62 : STD_LOGIC;
  SIGNAL operator_20_true_15_slc_operator_20_true_15_acc_14_itm : STD_LOGIC;
  SIGNAL operator_20_true_8_slc_operator_20_true_8_acc_14_itm : STD_LOGIC;
  SIGNAL operator_20_true_1_slc_operator_20_true_1_acc_14_itm : STD_LOGIC;
  SIGNAL S2_OUTER_LOOP_c_1_sva : STD_LOGIC;
  SIGNAL mult_3_res_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_327_tmp : STD_LOGIC;
  SIGNAL butterFly_12_tw_and_ssc : STD_LOGIC;
  SIGNAL reg_butterFly_12_tw_and_cse_3_2_ftd : STD_LOGIC;
  SIGNAL reg_butterFly_12_tw_and_cse_3_2_ftd_1 : STD_LOGIC;
  SIGNAL or_31_cse : STD_LOGIC;
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
  SIGNAL or_160_cse : STD_LOGIC;
  SIGNAL or_273_cse : STD_LOGIC;
  SIGNAL or_237_cse : STD_LOGIC;
  SIGNAL and_454_cse : STD_LOGIC;
  SIGNAL or_788_cse : STD_LOGIC;
  SIGNAL or_358_cse : STD_LOGIC;
  SIGNAL or_42_cse : STD_LOGIC;
  SIGNAL and_471_cse : STD_LOGIC;
  SIGNAL or_799_cse : STD_LOGIC;
  SIGNAL nand_119_cse : STD_LOGIC;
  SIGNAL reg_drf_revArr_ptr_smx_9_0_cse : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_499_cse : STD_LOGIC;
  SIGNAL and_468_cse : STD_LOGIC;
  SIGNAL nor_59_cse : STD_LOGIC;
  SIGNAL or_304_cse : STD_LOGIC;
  SIGNAL nand_117_cse : STD_LOGIC;
  SIGNAL or_484_cse : STD_LOGIC;
  SIGNAL nand_129_cse : STD_LOGIC;
  SIGNAL or_360_cse : STD_LOGIC;
  SIGNAL or_361_cse : STD_LOGIC;
  SIGNAL nor_235_cse : STD_LOGIC;
  SIGNAL and_506_cse : STD_LOGIC;
  SIGNAL and_473_cse : STD_LOGIC;
  SIGNAL nor_208_cse : STD_LOGIC;
  SIGNAL or_188_cse : STD_LOGIC;
  SIGNAL or_691_cse : STD_LOGIC;
  SIGNAL or_414_cse : STD_LOGIC;
  SIGNAL or_176_cse : STD_LOGIC;
  SIGNAL nand_137_cse : STD_LOGIC;
  SIGNAL or_800_cse : STD_LOGIC;
  SIGNAL or_256_cse : STD_LOGIC;
  SIGNAL and_19_cse : STD_LOGIC;
  SIGNAL nand_98_cse : STD_LOGIC;
  SIGNAL nor_210_cse : STD_LOGIC;
  SIGNAL or_239_cse : STD_LOGIC;
  SIGNAL mux_295_cse : STD_LOGIC;
  SIGNAL mux_50_cse : STD_LOGIC;
  SIGNAL mux_298_cse : STD_LOGIC;
  SIGNAL mux_5_cse : STD_LOGIC;
  SIGNAL mux_381_cse : STD_LOGIC;
  SIGNAL mux_543_cse : STD_LOGIC;
  SIGNAL nand_13_cse : STD_LOGIC;
  SIGNAL or_333_cse : STD_LOGIC;
  SIGNAL or_362_cse : STD_LOGIC;
  SIGNAL nand_93_cse : STD_LOGIC;
  SIGNAL butterFly_12_tw_and_cse_3_2_sva_mx0c2 : STD_LOGIC;
  SIGNAL mux_86_rmff : STD_LOGIC;
  SIGNAL mult_x_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_x_15_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm :
      STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm :
      STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_10_tw_asn_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_10_f1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_10_tw_h_asn_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_13_tw_h_asn_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL S34_OUTER_LOOP_for_tf_h_sva : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL yy_rsci_wadr_d_mx0c1 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c0 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c10 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c2 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c3 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c5 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c4 : STD_LOGIC;
  SIGNAL yy_rsci_wadr_d_mx0c6 : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_4_2_sva_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yy_rsci_radr_d_mx0c0 : STD_LOGIC;
  SIGNAL yy_rsci_radr_d_mx0c1 : STD_LOGIC;
  SIGNAL yy_rsci_radr_d_mx0c2 : STD_LOGIC;
  SIGNAL yy_rsci_radr_d_mx0c5 : STD_LOGIC;
  SIGNAL yy_rsci_radr_d_mx0c9 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c0 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c1 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c2 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c4 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c6 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c3 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c5 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c7 : STD_LOGIC;
  SIGNAL xx_rsci_wadr_d_mx0c8 : STD_LOGIC;
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
  SIGNAL modulo_add_7_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_4_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_4_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_5_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_6_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_7_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_15_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_12_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_12_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_13_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_14_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_15_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_23_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_20_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_20_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_21_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_22_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_23_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_3_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_1_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_2_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_3_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_11_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_8_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_8_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_9_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_10_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_11_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_19_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_16_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_16_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_17_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_18_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_19_mux_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_p_sva_1 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL mux_166_itm : STD_LOGIC;
  SIGNAL mux_235_itm : STD_LOGIC;
  SIGNAL mux_99_itm : STD_LOGIC;
  SIGNAL mux_101_itm : STD_LOGIC;
  SIGNAL mux_102_itm : STD_LOGIC;
  SIGNAL mux_104_itm : STD_LOGIC;
  SIGNAL mux_113_itm : STD_LOGIC;
  SIGNAL mux_115_itm : STD_LOGIC;
  SIGNAL mux_116_itm : STD_LOGIC;
  SIGNAL mux_180_itm : STD_LOGIC;
  SIGNAL mux_420_itm : STD_LOGIC;
  SIGNAL mux_191_itm : STD_LOGIC;
  SIGNAL mux_193_itm : STD_LOGIC;
  SIGNAL mux_194_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL not_tmp_388 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL or_tmp_750 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_7 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_11 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_18 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_19 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_21 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_22 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_1_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_2_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_5_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_6_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_9_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_10_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_11_f1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_13_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_14_f1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_14_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_15_f1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_17_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_18_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_21_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_22_qr_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_17_z_slc_mult_z_mul_cmp_z_31_0_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_4_tw_and_cse_2_sva_mx0w2 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_p_sva_1_mx0c1 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva_mx0c1 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c0 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c1 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c2 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c3 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c4 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c5 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c6 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c7 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c8 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c9 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c10 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c11 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c12 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c13 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c14 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c15 : STD_LOGIC;
  SIGNAL butterFly_10_f1_sva_mx0c16 : STD_LOGIC;
  SIGNAL S2_OUTER_LOOP_c_1_sva_mx0c1 : STD_LOGIC;
  SIGNAL S2_OUTER_LOOP_c_1_sva_mx0c2 : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2 : STD_LOGIC;
  SIGNAL butterFly_tw_and_cse_3_2_sva_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL butterFly_10_tw_asn_itm_mx0c0 : STD_LOGIC;
  SIGNAL butterFly_13_tw_h_asn_itm_mx0c1 : STD_LOGIC;
  SIGNAL butterFly_13_tw_h_asn_itm_mx0c2 : STD_LOGIC;
  SIGNAL butterFly_10_tw_h_asn_itm_mx0c0 : STD_LOGIC;
  SIGNAL butterFly_10_tw_h_asn_itm_mx0c1 : STD_LOGIC;
  SIGNAL butterFly_10_tw_h_asn_itm_mx0c2 : STD_LOGIC;
  SIGNAL mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c0 : STD_LOGIC;
  SIGNAL mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_3_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_1_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_2_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_7_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_4_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_5_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_6_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_11_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_8_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_9_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_10_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_15_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_12_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_13_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_14_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_19_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_16_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_17_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_18_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_23_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_20_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_21_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL modulo_sub_22_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL and_532_ssc : STD_LOGIC;
  SIGNAL reg_mult_3_res_lpi_4_dfm_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL nand_144_cse : STD_LOGIC;
  SIGNAL nor_323_cse : STD_LOGIC;
  SIGNAL nor_296_cse : STD_LOGIC;
  SIGNAL not_tmp_587 : STD_LOGIC;
  SIGNAL mux_tmp_672 : STD_LOGIC;
  SIGNAL nand_tmp_102 : STD_LOGIC;
  SIGNAL or_tmp_786 : STD_LOGIC;
  SIGNAL or_tmp_788 : STD_LOGIC;
  SIGNAL mux_tmp_697 : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt : STD_LOGIC_VECTOR (5 DOWNTO
      0);
  SIGNAL S2_COPY_LOOP_for_i_5_0_sva_1_5 : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_i_5_0_sva_1_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg : STD_LOGIC;
  SIGNAL reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg : STD_LOGIC;
  SIGNAL reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_p_or_1_seb : STD_LOGIC;
  SIGNAL mux_689_cse : STD_LOGIC;
  SIGNAL nand_175_cse : STD_LOGIC;
  SIGNAL or_891_cse : STD_LOGIC;
  SIGNAL nor_253_cse : STD_LOGIC;
  SIGNAL mux_708_cse : STD_LOGIC;
  SIGNAL mux_705_cse : STD_LOGIC;
  SIGNAL mux_692_cse : STD_LOGIC;
  SIGNAL nand_6_cse : STD_LOGIC;
  SIGNAL nand_62_cse : STD_LOGIC;
  SIGNAL mux_333_itm : STD_LOGIC;
  SIGNAL mux_505_itm : STD_LOGIC;
  SIGNAL modulo_add_3_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_1_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_2_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_7_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_4_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_5_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_6_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_11_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_8_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_9_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_10_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_15_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_12_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_13_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_14_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_19_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_16_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_17_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_18_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_23_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_20_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_21_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL modulo_add_22_acc_1_itm_32_1 : STD_LOGIC;
  SIGNAL operator_20_true_1_acc_1_itm_14 : STD_LOGIC;
  SIGNAL acc_8_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_9_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_14_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_15_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_11_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_19_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_16_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_22_cse_32_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_29_cse_33 : STD_LOGIC;
  SIGNAL reg_mult_res_lpi_4_dfm_cse_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL mux_30_nl : STD_LOGIC;
  SIGNAL mux_29_nl : STD_LOGIC;
  SIGNAL mux_28_nl : STD_LOGIC;
  SIGNAL mux_27_nl : STD_LOGIC;
  SIGNAL and_503_nl : STD_LOGIC;
  SIGNAL or_30_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL mux_51_nl : STD_LOGIC;
  SIGNAL or_63_nl : STD_LOGIC;
  SIGNAL or_62_nl : STD_LOGIC;
  SIGNAL or_60_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL nand_9_nl : STD_LOGIC;
  SIGNAL or_793_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL mux_57_nl : STD_LOGIC;
  SIGNAL or_66_nl : STD_LOGIC;
  SIGNAL butterFly_tw_h_or_2_nl : STD_LOGIC;
  SIGNAL and_56_nl : STD_LOGIC;
  SIGNAL mux_66_nl : STD_LOGIC;
  SIGNAL or_76_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL nand_12_nl : STD_LOGIC;
  SIGNAL mux_63_nl : STD_LOGIC;
  SIGNAL and_80_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL nor_219_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL nor_220_nl : STD_LOGIC;
  SIGNAL and_513_nl : STD_LOGIC;
  SIGNAL mux_80_nl : STD_LOGIC;
  SIGNAL nor_223_nl : STD_LOGIC;
  SIGNAL mux_79_nl : STD_LOGIC;
  SIGNAL mux_78_nl : STD_LOGIC;
  SIGNAL nor_224_nl : STD_LOGIC;
  SIGNAL nor_225_nl : STD_LOGIC;
  SIGNAL mux_77_nl : STD_LOGIC;
  SIGNAL mux_76_nl : STD_LOGIC;
  SIGNAL mux_75_nl : STD_LOGIC;
  SIGNAL nor_226_nl : STD_LOGIC;
  SIGNAL mux_74_nl : STD_LOGIC;
  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL mux_72_nl : STD_LOGIC;
  SIGNAL mux_71_nl : STD_LOGIC;
  SIGNAL nor_227_nl : STD_LOGIC;
  SIGNAL mux_70_nl : STD_LOGIC;
  SIGNAL and_514_nl : STD_LOGIC;
  SIGNAL nor_229_nl : STD_LOGIC;
  SIGNAL mux_69_nl : STD_LOGIC;
  SIGNAL nor_230_nl : STD_LOGIC;
  SIGNAL mux_68_nl : STD_LOGIC;
  SIGNAL and_515_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL mux_164_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL or_182_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL nor_209_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL or_178_nl : STD_LOGIC;
  SIGNAL nand_136_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL or_175_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL or_174_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL nand_18_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_and_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_k_mux_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL not_1236_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL nor_298_nl : STD_LOGIC;
  SIGNAL nor_299_nl : STD_LOGIC;
  SIGNAL nor_300_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_1_nl : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL and_376_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_and_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_k_mux_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL not_1235_nl : STD_LOGIC;
  SIGNAL and_221_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL nor_192_nl : STD_LOGIC;
  SIGNAL nor_193_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL mux_232_nl : STD_LOGIC;
  SIGNAL mux_231_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL or_250_nl : STD_LOGIC;
  SIGNAL mux_14_nl : STD_LOGIC;
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL mux_12_nl : STD_LOGIC;
  SIGNAL or_806_nl : STD_LOGIC;
  SIGNAL mux_336_nl : STD_LOGIC;
  SIGNAL or_803_nl : STD_LOGIC;
  SIGNAL mux_335_nl : STD_LOGIC;
  SIGNAL or_804_nl : STD_LOGIC;
  SIGNAL or_805_nl : STD_LOGIC;
  SIGNAL mux_666_nl : STD_LOGIC;
  SIGNAL mux_665_nl : STD_LOGIC;
  SIGNAL mux_664_nl : STD_LOGIC;
  SIGNAL mux_663_nl : STD_LOGIC;
  SIGNAL mux_662_nl : STD_LOGIC;
  SIGNAL nand_174_nl : STD_LOGIC;
  SIGNAL or_873_nl : STD_LOGIC;
  SIGNAL mux_661_nl : STD_LOGIC;
  SIGNAL mux_660_nl : STD_LOGIC;
  SIGNAL or_872_nl : STD_LOGIC;
  SIGNAL nor_380_nl : STD_LOGIC;
  SIGNAL mux_659_nl : STD_LOGIC;
  SIGNAL mux_658_nl : STD_LOGIC;
  SIGNAL or_868_nl : STD_LOGIC;
  SIGNAL nor_381_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl : STD_LOGIC;
  SIGNAL mux_686_nl : STD_LOGIC;
  SIGNAL mux_685_nl : STD_LOGIC;
  SIGNAL mux_684_nl : STD_LOGIC;
  SIGNAL mux_683_nl : STD_LOGIC;
  SIGNAL mux_682_nl : STD_LOGIC;
  SIGNAL or_879_nl : STD_LOGIC;
  SIGNAL mux_681_nl : STD_LOGIC;
  SIGNAL mux_680_nl : STD_LOGIC;
  SIGNAL mux_679_nl : STD_LOGIC;
  SIGNAL mux_678_nl : STD_LOGIC;
  SIGNAL mux_677_nl : STD_LOGIC;
  SIGNAL mux_676_nl : STD_LOGIC;
  SIGNAL mux_675_nl : STD_LOGIC;
  SIGNAL mux_671_nl : STD_LOGIC;
  SIGNAL mux_670_nl : STD_LOGIC;
  SIGNAL mux_669_nl : STD_LOGIC;
  SIGNAL mux_668_nl : STD_LOGIC;
  SIGNAL nand_169_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_p_S2_COPY_LOOP_p_nand_nl : STD_LOGIC;
  SIGNAL mux_694_nl : STD_LOGIC;
  SIGNAL mux_693_nl : STD_LOGIC;
  SIGNAL nor_382_nl : STD_LOGIC;
  SIGNAL mux_690_nl : STD_LOGIC;
  SIGNAL nor_383_nl : STD_LOGIC;
  SIGNAL nor_384_nl : STD_LOGIC;
  SIGNAL mux_688_nl : STD_LOGIC;
  SIGNAL nor_385_nl : STD_LOGIC;
  SIGNAL nor_386_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_k_or_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL nor_236_nl : STD_LOGIC;
  SIGNAL nor_237_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL nor_294_nl : STD_LOGIC;
  SIGNAL mux_37_nl : STD_LOGIC;
  SIGNAL mux_36_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL or_38_nl : STD_LOGIC;
  SIGNAL and_521_nl : STD_LOGIC;
  SIGNAL mux_33_nl : STD_LOGIC;
  SIGNAL nand_4_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL or_34_nl : STD_LOGIC;
  SIGNAL nor_246_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL or_407_nl : STD_LOGIC;
  SIGNAL mux_704_nl : STD_LOGIC;
  SIGNAL mux_703_nl : STD_LOGIC;
  SIGNAL mux_702_nl : STD_LOGIC;
  SIGNAL mux_701_nl : STD_LOGIC;
  SIGNAL mux_700_nl : STD_LOGIC;
  SIGNAL or_899_nl : STD_LOGIC;
  SIGNAL mux_697_nl : STD_LOGIC;
  SIGNAL mux_696_nl : STD_LOGIC;
  SIGNAL or_895_nl : STD_LOGIC;
  SIGNAL or_911_nl : STD_LOGIC;
  SIGNAL mux_695_nl : STD_LOGIC;
  SIGNAL or_893_nl : STD_LOGIC;
  SIGNAL mux_715_nl : STD_LOGIC;
  SIGNAL mux_714_nl : STD_LOGIC;
  SIGNAL mux_713_nl : STD_LOGIC;
  SIGNAL or_910_nl : STD_LOGIC;
  SIGNAL mux_712_nl : STD_LOGIC;
  SIGNAL mux_711_nl : STD_LOGIC;
  SIGNAL mux_710_nl : STD_LOGIC;
  SIGNAL mux_709_nl : STD_LOGIC;
  SIGNAL or_908_nl : STD_LOGIC;
  SIGNAL nand_171_nl : STD_LOGIC;
  SIGNAL mux_706_nl : STD_LOGIC;
  SIGNAL nor_377_nl : STD_LOGIC;
  SIGNAL nor_378_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl : STD_LOGIC_VECTOR (14 DOWNTO
      0);
  SIGNAL and_21_nl : STD_LOGIC;
  SIGNAL mux_45_nl : STD_LOGIC;
  SIGNAL and_500_nl : STD_LOGIC;
  SIGNAL nor_238_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_4_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_mux_15_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_1131_nl : STD_LOGIC;
  SIGNAL S6_OUTER_LOOP_for_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_not_4_nl : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_mux_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_OUTER_LOOP_c_nor_nl : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_r_not_nl : STD_LOGIC;
  SIGNAL mux_440_nl : STD_LOGIC;
  SIGNAL or_505_nl : STD_LOGIC;
  SIGNAL mux_450_nl : STD_LOGIC;
  SIGNAL nor_61_nl : STD_LOGIC;
  SIGNAL butterFly_tw_or_nl : STD_LOGIC;
  SIGNAL butterFly_tw_or_1_nl : STD_LOGIC;
  SIGNAL butterFly_tw_or_2_nl : STD_LOGIC;
  SIGNAL butterFly_tw_or_3_nl : STD_LOGIC;
  SIGNAL mux_499_nl : STD_LOGIC;
  SIGNAL mux_498_nl : STD_LOGIC;
  SIGNAL or_549_nl : STD_LOGIC;
  SIGNAL mux_497_nl : STD_LOGIC;
  SIGNAL mux_496_nl : STD_LOGIC;
  SIGNAL or_546_nl : STD_LOGIC;
  SIGNAL nor_285_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL or_29_nl : STD_LOGIC;
  SIGNAL nor_286_nl : STD_LOGIC;
  SIGNAL mux_541_nl : STD_LOGIC;
  SIGNAL nand_84_nl : STD_LOGIC;
  SIGNAL mux_540_nl : STD_LOGIC;
  SIGNAL nor_109_nl : STD_LOGIC;
  SIGNAL nor_110_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL or_604_nl : STD_LOGIC;
  SIGNAL or_603_nl : STD_LOGIC;
  SIGNAL mux_538_nl : STD_LOGIC;
  SIGNAL mux_537_nl : STD_LOGIC;
  SIGNAL or_602_nl : STD_LOGIC;
  SIGNAL or_600_nl : STD_LOGIC;
  SIGNAL mux_588_nl : STD_LOGIC;
  SIGNAL mux_587_nl : STD_LOGIC;
  SIGNAL mux_586_nl : STD_LOGIC;
  SIGNAL or_675_nl : STD_LOGIC;
  SIGNAL or_673_nl : STD_LOGIC;
  SIGNAL mux_585_nl : STD_LOGIC;
  SIGNAL mux_584_nl : STD_LOGIC;
  SIGNAL or_672_nl : STD_LOGIC;
  SIGNAL mux_583_nl : STD_LOGIC;
  SIGNAL or_671_nl : STD_LOGIC;
  SIGNAL mux_582_nl : STD_LOGIC;
  SIGNAL nand_89_nl : STD_LOGIC;
  SIGNAL mux_581_nl : STD_LOGIC;
  SIGNAL mux_580_nl : STD_LOGIC;
  SIGNAL or_666_nl : STD_LOGIC;
  SIGNAL mux_578_nl : STD_LOGIC;
  SIGNAL or_664_nl : STD_LOGIC;
  SIGNAL mux_590_nl : STD_LOGIC;
  SIGNAL mux_589_nl : STD_LOGIC;
  SIGNAL or_678_nl : STD_LOGIC;
  SIGNAL or_676_nl : STD_LOGIC;
  SIGNAL mux_597_nl : STD_LOGIC;
  SIGNAL or_689_nl : STD_LOGIC;
  SIGNAL mux_596_nl : STD_LOGIC;
  SIGNAL or_688_nl : STD_LOGIC;
  SIGNAL mux_607_nl : STD_LOGIC;
  SIGNAL nor_277_nl : STD_LOGIC;
  SIGNAL mux_606_nl : STD_LOGIC;
  SIGNAL mux_605_nl : STD_LOGIC;
  SIGNAL mux_604_nl : STD_LOGIC;
  SIGNAL nand_95_nl : STD_LOGIC;
  SIGNAL or_704_nl : STD_LOGIC;
  SIGNAL or_703_nl : STD_LOGIC;
  SIGNAL or_701_nl : STD_LOGIC;
  SIGNAL mux_603_nl : STD_LOGIC;
  SIGNAL nor_278_nl : STD_LOGIC;
  SIGNAL nor_279_nl : STD_LOGIC;
  SIGNAL mux_609_nl : STD_LOGIC;
  SIGNAL or_706_nl : STD_LOGIC;
  SIGNAL mux_608_nl : STD_LOGIC;
  SIGNAL mux_622_nl : STD_LOGIC;
  SIGNAL mux_621_nl : STD_LOGIC;
  SIGNAL nor_271_nl : STD_LOGIC;
  SIGNAL nor_272_nl : STD_LOGIC;
  SIGNAL mux_620_nl : STD_LOGIC;
  SIGNAL mux_619_nl : STD_LOGIC;
  SIGNAL or_724_nl : STD_LOGIC;
  SIGNAL nor_273_nl : STD_LOGIC;
  SIGNAL mux_618_nl : STD_LOGIC;
  SIGNAL or_722_nl : STD_LOGIC;
  SIGNAL mux_617_nl : STD_LOGIC;
  SIGNAL mux_615_nl : STD_LOGIC;
  SIGNAL or_717_nl : STD_LOGIC;
  SIGNAL or_716_nl : STD_LOGIC;
  SIGNAL acc_3_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_3_res_mux1h_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_718_nl : STD_LOGIC;
  SIGNAL and_1132_nl : STD_LOGIC;
  SIGNAL mux_719_nl : STD_LOGIC;
  SIGNAL nor_392_nl : STD_LOGIC;
  SIGNAL mux_720_nl : STD_LOGIC;
  SIGNAL or_913_nl : STD_LOGIC;
  SIGNAL mux_721_nl : STD_LOGIC;
  SIGNAL nor_393_nl : STD_LOGIC;
  SIGNAL nor_394_nl : STD_LOGIC;
  SIGNAL mux_722_nl : STD_LOGIC;
  SIGNAL nand_176_nl : STD_LOGIC;
  SIGNAL or_914_nl : STD_LOGIC;
  SIGNAL mux_723_nl : STD_LOGIC;
  SIGNAL and_1133_nl : STD_LOGIC;
  SIGNAL mux_724_nl : STD_LOGIC;
  SIGNAL nor_395_nl : STD_LOGIC;
  SIGNAL mux_725_nl : STD_LOGIC;
  SIGNAL and_1134_nl : STD_LOGIC;
  SIGNAL mux_726_nl : STD_LOGIC;
  SIGNAL nor_397_nl : STD_LOGIC;
  SIGNAL mux_727_nl : STD_LOGIC;
  SIGNAL or_915_nl : STD_LOGIC;
  SIGNAL or_916_nl : STD_LOGIC;
  SIGNAL mux_728_nl : STD_LOGIC;
  SIGNAL nor_398_nl : STD_LOGIC;
  SIGNAL mux_729_nl : STD_LOGIC;
  SIGNAL or_917_nl : STD_LOGIC;
  SIGNAL mux_730_nl : STD_LOGIC;
  SIGNAL or_918_nl : STD_LOGIC;
  SIGNAL or_919_nl : STD_LOGIC;
  SIGNAL mux_731_nl : STD_LOGIC;
  SIGNAL nor_399_nl : STD_LOGIC;
  SIGNAL mux_732_nl : STD_LOGIC;
  SIGNAL nor_400_nl : STD_LOGIC;
  SIGNAL mux_733_nl : STD_LOGIC;
  SIGNAL nor_401_nl : STD_LOGIC;
  SIGNAL nor_402_nl : STD_LOGIC;
  SIGNAL mux_734_nl : STD_LOGIC;
  SIGNAL nor_403_nl : STD_LOGIC;
  SIGNAL mux_735_nl : STD_LOGIC;
  SIGNAL or_920_nl : STD_LOGIC;
  SIGNAL nand_177_nl : STD_LOGIC;
  SIGNAL mux_736_nl : STD_LOGIC;
  SIGNAL or_921_nl : STD_LOGIC;
  SIGNAL mux_737_nl : STD_LOGIC;
  SIGNAL nor_404_nl : STD_LOGIC;
  SIGNAL mux_738_nl : STD_LOGIC;
  SIGNAL or_922_nl : STD_LOGIC;
  SIGNAL and_1135_nl : STD_LOGIC;
  SIGNAL mux_739_nl : STD_LOGIC;
  SIGNAL nor_405_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL modulo_sub_3_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_2_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_7_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_4_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_5_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_6_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_10_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_15_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_12_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_16_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_17_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_18_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_23_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_21_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_22_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_3_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_1_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_2_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_7_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_4_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_5_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_6_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_11_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_8_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_9_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_10_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_15_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_12_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_13_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_14_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_19_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_16_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_17_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_18_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_23_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_20_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_21_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_22_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL operator_20_true_1_acc_1_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL nand_3_nl : STD_LOGIC;
  SIGNAL or_68_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL mux_61_nl : STD_LOGIC;
  SIGNAL nor_232_nl : STD_LOGIC;
  SIGNAL nor_233_nl : STD_LOGIC;
  SIGNAL and_498_nl : STD_LOGIC;
  SIGNAL or_105_nl : STD_LOGIC;
  SIGNAL or_104_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL or_112_nl : STD_LOGIC;
  SIGNAL or_118_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL or_121_nl : STD_LOGIC;
  SIGNAL or_120_nl : STD_LOGIC;
  SIGNAL or_127_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL or_131_nl : STD_LOGIC;
  SIGNAL or_135_nl : STD_LOGIC;
  SIGNAL or_136_nl : STD_LOGIC;
  SIGNAL nand_123_nl : STD_LOGIC;
  SIGNAL or_167_nl : STD_LOGIC;
  SIGNAL or_630_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL or_169_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL or_168_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL or_203_nl : STD_LOGIC;
  SIGNAL or_209_nl : STD_LOGIC;
  SIGNAL mux_184_nl : STD_LOGIC;
  SIGNAL mux_185_nl : STD_LOGIC;
  SIGNAL or_210_nl : STD_LOGIC;
  SIGNAL or_221_nl : STD_LOGIC;
  SIGNAL nand_20_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL nor_34_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL nand_120_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL or_509_nl : STD_LOGIC;
  SIGNAL or_507_nl : STD_LOGIC;
  SIGNAL mux_106_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL or_129_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL or_130_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL or_811_nl : STD_LOGIC;
  SIGNAL nand_153_nl : STD_LOGIC;
  SIGNAL or_812_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL or_142_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL or_149_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL or_205_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL or_212_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL or_807_nl : STD_LOGIC;
  SIGNAL or_808_nl : STD_LOGIC;
  SIGNAL or_809_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL or_217_nl : STD_LOGIC;
  SIGNAL or_223_nl : STD_LOGIC;
  SIGNAL nor_136_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL or_424_nl : STD_LOGIC;
  SIGNAL nand_42_nl : STD_LOGIC;
  SIGNAL nand_41_nl : STD_LOGIC;
  SIGNAL nor_137_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL or_420_nl : STD_LOGIC;
  SIGNAL or_419_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL and_466_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL and_464_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL nand_47_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL nor_131_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL nor_132_nl : STD_LOGIC;
  SIGNAL and_465_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL nand_45_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL and_461_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL nor_130_nl : STD_LOGIC;
  SIGNAL and_462_nl : STD_LOGIC;
  SIGNAL and_463_nl : STD_LOGIC;
  SIGNAL nor_127_nl : STD_LOGIC;
  SIGNAL mux_409_nl : STD_LOGIC;
  SIGNAL mux_408_nl : STD_LOGIC;
  SIGNAL nor_128_nl : STD_LOGIC;
  SIGNAL nor_129_nl : STD_LOGIC;
  SIGNAL nor_124_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL nor_125_nl : STD_LOGIC;
  SIGNAL mux_413_nl : STD_LOGIC;
  SIGNAL or_474_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL or_471_nl : STD_LOGIC;
  SIGNAL nor_126_nl : STD_LOGIC;
  SIGNAL mux_411_nl : STD_LOGIC;
  SIGNAL or_468_nl : STD_LOGIC;
  SIGNAL nor_122_nl : STD_LOGIC;
  SIGNAL nor_123_nl : STD_LOGIC;
  SIGNAL mux_417_nl : STD_LOGIC;
  SIGNAL or_480_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL or_478_nl : STD_LOGIC;
  SIGNAL or_477_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL or_510_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL nand_58_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL and_456_nl : STD_LOGIC;
  SIGNAL mux_446_nl : STD_LOGIC;
  SIGNAL nor_121_nl : STD_LOGIC;
  SIGNAL nor_295_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL or_528_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL or_557_nl : STD_LOGIC;
  SIGNAL mux_504_nl : STD_LOGIC;
  SIGNAL mux_503_nl : STD_LOGIC;
  SIGNAL or_555_nl : STD_LOGIC;
  SIGNAL mux_502_nl : STD_LOGIC;
  SIGNAL or_554_nl : STD_LOGIC;
  SIGNAL or_553_nl : STD_LOGIC;
  SIGNAL mux_501_nl : STD_LOGIC;
  SIGNAL mux_500_nl : STD_LOGIC;
  SIGNAL or_552_nl : STD_LOGIC;
  SIGNAL or_551_nl : STD_LOGIC;
  SIGNAL nor_113_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL nor_114_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL nand_81_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL and_452_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL or_577_nl : STD_LOGIC;
  SIGNAL mux_547_nl : STD_LOGIC;
  SIGNAL nor_106_nl : STD_LOGIC;
  SIGNAL nor_107_nl : STD_LOGIC;
  SIGNAL mux_591_nl : STD_LOGIC;
  SIGNAL or_680_nl : STD_LOGIC;
  SIGNAL or_679_nl : STD_LOGIC;
  SIGNAL nor_108_nl : STD_LOGIC;
  SIGNAL mux_545_nl : STD_LOGIC;
  SIGNAL or_614_nl : STD_LOGIC;
  SIGNAL or_613_nl : STD_LOGIC;
  SIGNAL mux_544_nl : STD_LOGIC;
  SIGNAL or_612_nl : STD_LOGIC;
  SIGNAL or_611_nl : STD_LOGIC;
  SIGNAL mux_552_nl : STD_LOGIC;
  SIGNAL nor_102_nl : STD_LOGIC;
  SIGNAL and_450_nl : STD_LOGIC;
  SIGNAL mux_551_nl : STD_LOGIC;
  SIGNAL nor_103_nl : STD_LOGIC;
  SIGNAL mux_550_nl : STD_LOGIC;
  SIGNAL or_625_nl : STD_LOGIC;
  SIGNAL nor_104_nl : STD_LOGIC;
  SIGNAL nor_105_nl : STD_LOGIC;
  SIGNAL mux_549_nl : STD_LOGIC;
  SIGNAL or_622_nl : STD_LOGIC;
  SIGNAL mux_564_nl : STD_LOGIC;
  SIGNAL nor_98_nl : STD_LOGIC;
  SIGNAL mux_568_nl : STD_LOGIC;
  SIGNAL nand_87_nl : STD_LOGIC;
  SIGNAL mux_567_nl : STD_LOGIC;
  SIGNAL or_649_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL mux_565_nl : STD_LOGIC;
  SIGNAL or_690_nl : STD_LOGIC;
  SIGNAL mux_467_nl : STD_LOGIC;
  SIGNAL nand_69_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL nand_68_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL nand_67_nl : STD_LOGIC;
  SIGNAL mux_462_nl : STD_LOGIC;
  SIGNAL mux_461_nl : STD_LOGIC;
  SIGNAL mux_460_nl : STD_LOGIC;
  SIGNAL or_524_nl : STD_LOGIC;
  SIGNAL butterFly_tw_and_25_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL and_492_nl : STD_LOGIC;
  SIGNAL mux_91_nl : STD_LOGIC;
  SIGNAL and_493_nl : STD_LOGIC;
  SIGNAL mux_90_nl : STD_LOGIC;
  SIGNAL or_103_nl : STD_LOGIC;
  SIGNAL nor_216_nl : STD_LOGIC;
  SIGNAL nor_217_nl : STD_LOGIC;
  SIGNAL mux_89_nl : STD_LOGIC;
  SIGNAL nor_218_nl : STD_LOGIC;
  SIGNAL and_86_nl : STD_LOGIC;
  SIGNAL mux_88_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL and_94_nl : STD_LOGIC;
  SIGNAL and_96_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL mux_95_nl : STD_LOGIC;
  SIGNAL or_108_nl : STD_LOGIC;
  SIGNAL mux_94_nl : STD_LOGIC;
  SIGNAL nand_140_nl : STD_LOGIC;
  SIGNAL nand_16_nl : STD_LOGIC;
  SIGNAL and_99_nl : STD_LOGIC;
  SIGNAL and_102_nl : STD_LOGIC;
  SIGNAL and_104_nl : STD_LOGIC;
  SIGNAL and_105_nl : STD_LOGIC;
  SIGNAL and_114_nl : STD_LOGIC;
  SIGNAL and_116_nl : STD_LOGIC;
  SIGNAL and_122_nl : STD_LOGIC;
  SIGNAL and_123_nl : STD_LOGIC;
  SIGNAL and_124_nl : STD_LOGIC;
  SIGNAL and_128_nl : STD_LOGIC;
  SIGNAL and_132_nl : STD_LOGIC;
  SIGNAL and_135_nl : STD_LOGIC;
  SIGNAL and_137_nl : STD_LOGIC;
  SIGNAL and_138_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_mux1h_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_or_7_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_mux1h_9_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_or_9_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_or_5_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_and_2_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_mux1h_10_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_not_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_5_nl : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL S2_COPY_LOOP_for_or_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_mux1h_11_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_mux1h_12_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_or_8_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_or_1_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_and_1_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_mux1h_13_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S2_COPY_LOOP_for_or_2_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_or_3_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_nor_1_nl : STD_LOGIC;
  SIGNAL S2_COPY_LOOP_for_or_4_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL or_159_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL or_158_nl : STD_LOGIC;
  SIGNAL mux_130_nl : STD_LOGIC;
  SIGNAL or_157_nl : STD_LOGIC;
  SIGNAL mux_129_nl : STD_LOGIC;
  SIGNAL or_155_nl : STD_LOGIC;
  SIGNAL nand_17_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL nor_212_nl : STD_LOGIC;
  SIGNAL and_489_nl : STD_LOGIC;
  SIGNAL mux_126_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL nor_213_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL or_163_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL and_486_nl : STD_LOGIC;
  SIGNAL nor_204_nl : STD_LOGIC;
  SIGNAL nor_205_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL nor_206_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL or_189_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL or_187_nl : STD_LOGIC;
  SIGNAL nand_135_nl : STD_LOGIC;
  SIGNAL nor_207_nl : STD_LOGIC;
  SIGNAL and_165_nl : STD_LOGIC;
  SIGNAL nor_257_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL or_199_nl : STD_LOGIC;
  SIGNAL mux_175_nl : STD_LOGIC;
  SIGNAL or_198_nl : STD_LOGIC;
  SIGNAL nand_19_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL nor_202_nl : STD_LOGIC;
  SIGNAL nor_203_nl : STD_LOGIC;
  SIGNAL and_168_nl : STD_LOGIC;
  SIGNAL and_172_nl : STD_LOGIC;
  SIGNAL and_173_nl : STD_LOGIC;
  SIGNAL and_174_nl : STD_LOGIC;
  SIGNAL and_177_nl : STD_LOGIC;
  SIGNAL and_179_nl : STD_LOGIC;
  SIGNAL and_181_nl : STD_LOGIC;
  SIGNAL and_182_nl : STD_LOGIC;
  SIGNAL and_183_nl : STD_LOGIC;
  SIGNAL and_186_nl : STD_LOGIC;
  SIGNAL and_187_nl : STD_LOGIC;
  SIGNAL and_190_nl : STD_LOGIC;
  SIGNAL and_191_nl : STD_LOGIC;
  SIGNAL and_192_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_9_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_6_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_10_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_or_6_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_and_3_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_mux1h_7_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_not_5_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL S1_OUTER_LOOP_for_or_1_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_8_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux1h_9_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_8_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_or_2_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_and_2_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_mux1h_10_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL S1_OUTER_LOOP_for_or_3_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_nand_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_nor_1_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_or_5_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL mux_201_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL nor_194_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL nor_195_nl : STD_LOGIC;
  SIGNAL nor_196_nl : STD_LOGIC;
  SIGNAL nor_197_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL nor_198_nl : STD_LOGIC;
  SIGNAL nand_143_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL or_226_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL mux_206_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL or_235_nl : STD_LOGIC;
  SIGNAL nor_335_nl : STD_LOGIC;
  SIGNAL mux_632_nl : STD_LOGIC;
  SIGNAL and_1115_nl : STD_LOGIC;
  SIGNAL mux_673_nl : STD_LOGIC;
  SIGNAL mux_698_nl : STD_LOGIC;
  SIGNAL or_900_nl : STD_LOGIC;
  SIGNAL S2_INNER_LOOP1_for_mux_6_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux_716_nl : STD_LOGIC;
  SIGNAL nor_388_nl : STD_LOGIC;
  SIGNAL mux_717_nl : STD_LOGIC;
  SIGNAL and_1130_nl : STD_LOGIC;
  SIGNAL nor_389_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl : STD_LOGIC_VECTOR (14 DOWNTO
      0);
  SIGNAL not_1682_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL not_1683_nl : STD_LOGIC;
  SIGNAL S1_OUTER_LOOP_for_mux_14_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL acc_4_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_3_if_mult_3_if_mux_1_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_1136_nl : STD_LOGIC;
  SIGNAL acc_5_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_if_mult_if_mux_1_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_1137_nl : STD_LOGIC;
  SIGNAL acc_6_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_3_qif_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_1138_nl : STD_LOGIC;
  SIGNAL acc_7_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_16_qif_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_1139_nl : STD_LOGIC;
  SIGNAL acc_8_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_9_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_11_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_20_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_9_qif_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_1140_nl : STD_LOGIC;
  SIGNAL acc_22_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL acc_29_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
      S34_OUTER_LOOP_for_tf_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      ensig_cgo_iro : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      xx_rsc_cgo : IN STD_LOGIC;
      yy_rsc_cgo : IN STD_LOGIC;
      S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      ensig_cgo : IN STD_LOGIC;
      mult_z_mul_cmp_en : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL hybrid_core_wait_dp_inst_yy_rsc_cgo_iro : STD_LOGIC;
  SIGNAL hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL hybrid_core_wait_dp_inst_ensig_cgo_iro : STD_LOGIC;
  SIGNAL hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

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
      S2_INNER_LOOP1_for_C_23_tr0 : IN STD_LOGIC;
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
      S5_INNER_LOOP1_for_C_23_tr0 : IN STD_LOGIC;
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
  SIGNAL hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_23_tr0 : STD_LOGIC;
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
  SIGNAL hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_23_tr0 : STD_LOGIC;
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

  FUNCTION MUX1HOT_s_1_26_2(input_25 : STD_LOGIC;
  input_24 : STD_LOGIC;
  input_23 : STD_LOGIC;
  input_22 : STD_LOGIC;
  input_21 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_18 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(25 DOWNTO 0))
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
      tmp := sel(3);
      result := result or ( input_3 and tmp);
      tmp := sel(4);
      result := result or ( input_4 and tmp);
      tmp := sel(5);
      result := result or ( input_5 and tmp);
      tmp := sel(6);
      result := result or ( input_6 and tmp);
      tmp := sel(7);
      result := result or ( input_7 and tmp);
      tmp := sel(8);
      result := result or ( input_8 and tmp);
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
      tmp := sel(11);
      result := result or ( input_11 and tmp);
      tmp := sel(12);
      result := result or ( input_12 and tmp);
      tmp := sel(13);
      result := result or ( input_13 and tmp);
      tmp := sel(14);
      result := result or ( input_14 and tmp);
      tmp := sel(15);
      result := result or ( input_15 and tmp);
      tmp := sel(16);
      result := result or ( input_16 and tmp);
      tmp := sel(17);
      result := result or ( input_17 and tmp);
      tmp := sel(18);
      result := result or ( input_18 and tmp);
      tmp := sel(19);
      result := result or ( input_19 and tmp);
      tmp := sel(20);
      result := result or ( input_20 and tmp);
      tmp := sel(21);
      result := result or ( input_21 and tmp);
      tmp := sel(22);
      result := result or ( input_22 and tmp);
      tmp := sel(23);
      result := result or ( input_23 and tmp);
      tmp := sel(24);
      result := result or ( input_24 and tmp);
      tmp := sel(25);
      result := result or ( input_25 and tmp);
    RETURN result;
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

  FUNCTION MUX1HOT_s_1_4_2(input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
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
      tmp := sel(3);
      result := result or ( input_3 and tmp);
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

  FUNCTION MUX1HOT_v_32_20_2(input_19 : STD_LOGIC_VECTOR(31 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(19 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_22_2(input_21 : STD_LOGIC_VECTOR(31 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(21 DOWNTO 0))
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
  mult_z_mul_cmp_a <= MUX1HOT_v_32_8_2(xx_rsci_q_d, mult_x_1_sva, mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm,
      mult_x_15_sva, operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm,
      operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm, yy_rsci_q_d,
      (mult_z_mul_cmp_z(51 DOWNTO 20)), STD_LOGIC_VECTOR'( (NOT((MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(((NOT
      (fsm_output(3))) OR (NOT (fsm_output(7))) OR (fsm_output(6))), (MUX_s_1_2_2(or_799_cse,
      or_800_cse, fsm_output(3))), fsm_output(0))), ((fsm_output(3)) OR (fsm_output(1))
      OR (fsm_output(7)) OR (fsm_output(6))), fsm_output(4))), ((fsm_output(4)) OR
      (fsm_output(0)) OR (MUX_s_1_2_2(((fsm_output(1)) OR (fsm_output(7)) OR (NOT
      (fsm_output(6)))), or_256_cse, fsm_output(3)))), fsm_output(2))) OR (fsm_output(5))))
      & (NOT (MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(4)) OR (MUX_s_1_2_2(((NOT (fsm_output(6)))
      OR (fsm_output(5)) OR (fsm_output(7)) OR (NOT (fsm_output(3)))), or_tmp_260,
      fsm_output(0)))), (MUX_s_1_2_2((MUX_s_1_2_2(or_tmp_260, ((fsm_output(6)) OR
      (NOT (fsm_output(5))) OR (NOT (fsm_output(7))) OR (fsm_output(3))), fsm_output(0))),
      or_273_cse, fsm_output(4))), fsm_output(2))), (MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(0))
      OR (MUX_s_1_2_2(((NOT (fsm_output(5))) OR (NOT (fsm_output(7))) OR (fsm_output(3))),
      or_tmp_151, fsm_output(6)))), (MUX_s_1_2_2(((NOT (fsm_output(6))) OR (NOT (fsm_output(5)))
      OR (fsm_output(7)) OR (fsm_output(3))), (MUX_s_1_2_2(or_tmp_151, or_tmp_252,
      fsm_output(6))), fsm_output(0))), fsm_output(4))), ((fsm_output(4)) OR (NOT
      (fsm_output(0))) OR (MUX_s_1_2_2(or_tmp_252, (MUX_s_1_2_2(or_160_cse, or_tmp_249,
      fsm_output(5))), fsm_output(6)))), fsm_output(2))), fsm_output(1)))) & (MUX_s_1_2_2((MUX_s_1_2_2((NOT((NOT
      (fsm_output(5))) OR (NOT (fsm_output(3))) OR (fsm_output(0)) OR (fsm_output(2))
      OR (NOT (fsm_output(7))) OR (fsm_output(4)))), (NOT((NOT (fsm_output(5))) OR
      (fsm_output(3)) OR (NOT (fsm_output(2))) OR (fsm_output(7)) OR (NOT (fsm_output(4))))),
      fsm_output(6))), (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(0))
      OR (fsm_output(2)) OR (fsm_output(7)) OR (NOT (fsm_output(4))))), (NOT((NOT
      (fsm_output(2))) OR (NOT (fsm_output(7))) OR (fsm_output(4)))), fsm_output(3))),
      (MUX_s_1_2_2(((fsm_output(0)) AND (fsm_output(2)) AND (fsm_output(7)) AND (NOT
      (fsm_output(4)))), (NOT((NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(4)))),
      fsm_output(3))), fsm_output(5))), (NOT((fsm_output(5)) OR (fsm_output(3)) OR
      (fsm_output(0)) OR (NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(4)))),
      fsm_output(6))), fsm_output(1))) & (MUX_s_1_2_2(((fsm_output(2)) AND (MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(7))
      AND (fsm_output(1)) AND (NOT (fsm_output(3))) AND (fsm_output(5))), (MUX_s_1_2_2((NOT((fsm_output(1))
      OR nand_119_cse)), (NOT((fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(5)))),
      fsm_output(7))), fsm_output(0))), (NOT((fsm_output(7)) OR (fsm_output(1)) OR
      (fsm_output(3)) OR (fsm_output(5)))), fsm_output(4)))), (MUX_s_1_2_2((NOT((NOT
      (fsm_output(4))) OR (NOT (fsm_output(0))) OR (fsm_output(7)) OR (NOT (fsm_output(1)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))))), (NOT((fsm_output(4)) OR (NOT
      (fsm_output(0))) OR (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(3)) OR
      (fsm_output(5)))), fsm_output(2))), fsm_output(6))) & (NOT (MUX_s_1_2_2((NOT((fsm_output(3))
      AND (MUX_s_1_2_2((NOT((NOT (fsm_output(5))) OR (fsm_output(0)) OR (MUX_s_1_2_2(nand_117_cse,
      or_tmp_286, fsm_output(1))))), (NOT((fsm_output(5)) OR (MUX_s_1_2_2(((fsm_output(1))
      OR (fsm_output(7)) OR (NOT (fsm_output(2)))), or_304_cse, fsm_output(0))))),
      fsm_output(6))))), (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(((NOT
      (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(2)))), or_tmp_286,
      fsm_output(0))), ((NOT (fsm_output(0))) OR (fsm_output(7)) OR (fsm_output(2))),
      fsm_output(5))), (NOT((fsm_output(5)) AND (fsm_output(0)) AND (fsm_output(1))
      AND (NOT (fsm_output(7))) AND (fsm_output(2)))), fsm_output(6))), (MUX_s_1_2_2(((fsm_output(5))
      OR (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(2))), ((NOT (fsm_output(5)))
      OR (NOT (fsm_output(0))) OR (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(2))),
      fsm_output(6))), fsm_output(3))), fsm_output(4)))) & (MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(3))
      AND (NOT (MUX_s_1_2_2(or_tmp_297, ((NOT (fsm_output(7))) OR (NOT (fsm_output(0)))
      OR (fsm_output(6))), fsm_output(5))))), (MUX_s_1_2_2((MUX_s_1_2_2((NOT((NOT
      (fsm_output(7))) OR (fsm_output(0)) OR (fsm_output(6)))), (NOT((fsm_output(7))
      OR (fsm_output(0)) OR (fsm_output(6)))), fsm_output(5))), (NOT((NOT (fsm_output(5)))
      OR (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(0)) OR (NOT (fsm_output(6))))),
      fsm_output(3))), fsm_output(4))), (NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("10"))
      OR (MUX_s_1_2_2(((NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(0)))
      OR (fsm_output(6))), or_tmp_297, fsm_output(5))))), fsm_output(2))) & ((MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(6))
      OR (fsm_output(7)) OR (NOT (fsm_output(3))))), (NOT((fsm_output(6)) OR (MUX_s_1_2_2(not_tmp_184,
      (fsm_output(3)), fsm_output(7))))), fsm_output(0))), (NOT((NOT (fsm_output(6)))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(1)))), fsm_output(4))),
      (NOT((fsm_output(4)) OR (fsm_output(0)) OR (MUX_s_1_2_2(((NOT (fsm_output(7)))
      OR (fsm_output(3)) OR (fsm_output(1))), ((fsm_output(7)) OR not_tmp_184), fsm_output(6))))),
      fsm_output(2))) AND (fsm_output(5))) & (and_dcpl_83 AND and_473_cse AND (fsm_output(1)))));
  mult_z_mul_cmp_b <= MUX1HOT_v_32_9_2(twiddle_h_rsci_s_din_mxwt, butterFly_10_tw_asn_itm,
      twiddle_rsci_s_din_mxwt, butterFly_10_f1_sva, butterFly_10_tw_h_asn_itm, butterFly_13_tw_h_asn_itm,
      m_sva, STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tw_h_rsci_s_din_mxwt),32)), STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(S34_OUTER_LOOP_for_tf_h_sva),32)),
      STD_LOGIC_VECTOR'( (NOT((MUX_s_1_2_2((MUX_s_1_2_2(nand_tmp_25, nand_tmp_11,
      fsm_output(1))), or_tmp_314, fsm_output(0))) OR (fsm_output(4)))) & (MUX_s_1_2_2((MUX_s_1_2_2((NOT((NOT
      (fsm_output(0))) OR (fsm_output(2)) OR (NOT (fsm_output(3))) OR mux_295_cse)),
      (NOT((fsm_output(0)) OR (NOT (fsm_output(2))) OR (fsm_output(3)) OR mux_298_cse)),
      fsm_output(4))), (NOT((fsm_output(4)) OR (MUX_s_1_2_2((MUX_s_1_2_2(or_333_cse,
      nand_13_cse, fsm_output(2))), (NOT((fsm_output(2)) AND (NOT (MUX_s_1_2_2(mux_50_cse,
      mux_298_cse, fsm_output(3)))))), fsm_output(0))))), fsm_output(1))) & (MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(3))
      OR (fsm_output(0)) OR (NOT (fsm_output(2))) OR mux_50_cse)), (NOT(CONV_SL_1_1(fsm_output(3
      DOWNTO 2)/=STD_LOGIC_VECTOR'("00")) OR mux_298_cse)), fsm_output(4))), (NOT((fsm_output(4))
      OR (MUX_s_1_2_2(((NOT (fsm_output(0))) OR (fsm_output(2)) OR mux_50_cse), ((fsm_output(2))
      OR mux_295_cse), fsm_output(3))))), fsm_output(1))) & (MUX_s_1_2_2((MUX_s_1_2_2((NOT((NOT
      (fsm_output(6))) OR (NOT (fsm_output(2))) OR (fsm_output(0)) OR (fsm_output(7))
      OR (NOT (fsm_output(1))) OR (fsm_output(5)))), (NOT((fsm_output(6)) OR (MUX_s_1_2_2(((fsm_output(0))
      OR (NOT (fsm_output(7))) OR (fsm_output(1)) OR (NOT (fsm_output(5)))), (NOT((fsm_output(0))
      AND (MUX_s_1_2_2(((fsm_output(1)) AND (fsm_output(5))), (NOT((NOT (fsm_output(1)))
      OR (fsm_output(5)))), fsm_output(7))))), fsm_output(2))))), fsm_output(3))),
      (NOT((fsm_output(3)) OR (MUX_s_1_2_2(((fsm_output(2)) OR (fsm_output(0)) OR
      (fsm_output(7)) OR (NOT (fsm_output(1))) OR (fsm_output(5))), ((NOT (fsm_output(2)))
      OR (NOT (fsm_output(0))) OR (fsm_output(7)) OR (fsm_output(1)) OR (NOT (fsm_output(5)))),
      fsm_output(6))))), fsm_output(4))) & (MUX_s_1_2_2((NOT((fsm_output(4)) OR (MUX_s_1_2_2(or_273_cse,
      (MUX_s_1_2_2((NOT((fsm_output(0)) AND (fsm_output(5)) AND (fsm_output(7)) AND
      (NOT (fsm_output(6))))), or_362_cse, fsm_output(3))), fsm_output(2))))), (NOT(CONV_SL_1_1(fsm_output(4
      DOWNTO 2)/=STD_LOGIC_VECTOR'("100")) OR (MUX_s_1_2_2(or_358_cse, (CONV_SL_1_1(fsm_output(7
      DOWNTO 5)/=STD_LOGIC_VECTOR'("000"))), fsm_output(0))))), fsm_output(1))) &
      (MUX_s_1_2_2((NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("1010011")))),
      (MUX_s_1_2_2(((fsm_output(2)) AND (MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(5))
      OR (MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(4))))),
      (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("010")))), fsm_output(3))),
      (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0001")))), fsm_output(7)))),
      (NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("011100")))), fsm_output(1))),
      fsm_output(0))) & (NOT (MUX_s_1_2_2((NOT((fsm_output(3)) AND (MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(1))
      AND (NOT mux_50_cse)), (NOT((fsm_output(1)) OR mux_50_cse)), fsm_output(2))),
      (NOT((fsm_output(2)) OR mux_50_cse)), fsm_output(0))))), (MUX_s_1_2_2((MUX_s_1_2_2(mux_295_cse,
      (NOT((fsm_output(1)) AND (NOT mux_298_cse))), fsm_output(2))), (MUX_s_1_2_2(((fsm_output(1))
      OR mux_298_cse), ((NOT (fsm_output(1))) OR (fsm_output(5)) OR (fsm_output(7))
      OR (NOT (fsm_output(6)))), fsm_output(2))), fsm_output(3))), fsm_output(4))))
      & and_dcpl_214 & (and_dcpl_83 AND and_dcpl_100)));
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
      AND (NOT and_532_ssc)) & (MUX_s_1_2_2(S2_OUTER_LOOP_c_1_sva, (NOT S2_OUTER_LOOP_c_1_sva),
      and_532_ssc)) & and_532_ssc);
  z_out <= operator_33_true_1_lshift_rg_z;

  hybrid_core_wait_dp_inst : hybrid_core_wait_dp
    PORT MAP(
      clk => clk,
      xx_rsc_cgo_iro => mux_86_rmff,
      xx_rsci_clken_d => xx_rsci_clken_d,
      yy_rsc_cgo_iro => hybrid_core_wait_dp_inst_yy_rsc_cgo_iro,
      yy_rsci_clken_d => yy_rsci_clken_d,
      S34_OUTER_LOOP_for_tf_mul_cmp_z => hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z,
      ensig_cgo_iro => hybrid_core_wait_dp_inst_ensig_cgo_iro,
      core_wen => core_wen,
      xx_rsc_cgo => reg_xx_rsc_cgo_cse,
      yy_rsc_cgo => reg_yy_rsc_cgo_cse,
      S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg => hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg,
      ensig_cgo => reg_ensig_cgo_cse,
      mult_z_mul_cmp_en => mult_z_mul_cmp_en
    );
  hybrid_core_wait_dp_inst_yy_rsc_cgo_iro <= NOT mux_166_itm;
  hybrid_core_wait_dp_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z <= S34_OUTER_LOOP_for_tf_mul_cmp_z;
  hybrid_core_wait_dp_inst_ensig_cgo_iro <= NOT mux_235_itm;
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
      S2_INNER_LOOP1_for_C_23_tr0 => hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_23_tr0,
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
      S5_INNER_LOOP1_for_C_23_tr0 => hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_23_tr0,
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
  hybrid_core_core_fsm_inst_S1_OUTER_LOOP_C_0_tr0 <= z_out_1(5);
  hybrid_core_core_fsm_inst_S2_COPY_LOOP_for_C_3_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S2_COPY_LOOP_C_0_tr0 <= z_out_1(5);
  hybrid_core_core_fsm_inst_S2_INNER_LOOP1_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S2_INNER_LOOP1_C_0_tr0 <= z_out_2(2);
  hybrid_core_core_fsm_inst_S2_INNER_LOOP2_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr0 <= and_19_cse;
  hybrid_core_core_fsm_inst_S2_INNER_LOOP2_C_0_tr1 <= NOT (z_out_2(2));
  hybrid_core_core_fsm_inst_S2_INNER_LOOP3_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S2_INNER_LOOP3_C_0_tr0 <= z_out_2(2);
  hybrid_core_core_fsm_inst_S34_OUTER_LOOP_for_C_12_tr0 <= NOT operator_20_true_8_slc_operator_20_true_8_acc_14_itm;
  hybrid_core_core_fsm_inst_S34_OUTER_LOOP_C_0_tr0 <= z_out_1(5);
  hybrid_core_core_fsm_inst_S5_COPY_LOOP_for_C_3_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S5_COPY_LOOP_C_0_tr0 <= z_out_1(5);
  hybrid_core_core_fsm_inst_S5_INNER_LOOP1_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S5_INNER_LOOP1_C_0_tr0 <= z_out_2(2);
  hybrid_core_core_fsm_inst_S5_INNER_LOOP2_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr0 <= and_19_cse;
  hybrid_core_core_fsm_inst_S5_INNER_LOOP2_C_0_tr1 <= NOT (z_out_2(2));
  hybrid_core_core_fsm_inst_S5_INNER_LOOP3_for_C_23_tr0 <= S2_COPY_LOOP_for_i_5_0_sva_1_5;
  hybrid_core_core_fsm_inst_S5_INNER_LOOP3_C_0_tr0 <= z_out_2(2);
  hybrid_core_core_fsm_inst_S6_OUTER_LOOP_for_C_3_tr0 <= NOT operator_20_true_15_slc_operator_20_true_15_acc_14_itm;
  hybrid_core_core_fsm_inst_S6_OUTER_LOOP_C_0_tr0 <= z_out_1(5);

  or_31_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000"));
  and_506_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  mux_50_cse <= MUX_s_1_2_2(or_799_cse, or_361_cse, fsm_output(5));
  nand_13_cse <= NOT((fsm_output(3)) AND (NOT mux_295_cse));
  nor_219_nl <= NOT(and_468_cse OR (NOT (fsm_output(7))) OR (fsm_output(5)));
  mux_82_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(7));
  mux_83_nl <= MUX_s_1_2_2(nor_219_nl, mux_82_nl, fsm_output(4));
  nor_220_nl <= NOT((NOT((fsm_output(0)) OR (fsm_output(7)))) OR (fsm_output(5)));
  and_513_nl <= (NOT(((NOT (fsm_output(0))) OR (fsm_output(2))) AND (fsm_output(7))))
      AND (fsm_output(5));
  mux_81_nl <= MUX_s_1_2_2(nor_220_nl, and_513_nl, fsm_output(4));
  mux_84_nl <= MUX_s_1_2_2(mux_83_nl, mux_81_nl, fsm_output(3));
  mux_79_nl <= MUX_s_1_2_2(or_484_cse, (fsm_output(7)), fsm_output(2));
  nor_223_nl <= NOT((fsm_output(4)) OR mux_79_nl);
  nor_224_nl <= NOT((fsm_output(0)) OR (fsm_output(2)) OR (fsm_output(7)));
  nor_225_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(7)) OR (NOT (fsm_output(5))));
  mux_78_nl <= MUX_s_1_2_2(nor_224_nl, nor_225_nl, fsm_output(4));
  mux_80_nl <= MUX_s_1_2_2(nor_223_nl, mux_78_nl, fsm_output(3));
  mux_85_nl <= MUX_s_1_2_2(mux_84_nl, mux_80_nl, fsm_output(6));
  nor_226_nl <= NOT(nor_59_cse OR (NOT (fsm_output(7))) OR (fsm_output(5)));
  mux_74_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), or_304_cse);
  mux_75_nl <= MUX_s_1_2_2(nor_226_nl, mux_74_nl, fsm_output(4));
  nor_227_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(5)));
  mux_71_nl <= MUX_s_1_2_2(nor_227_nl, or_788_cse, fsm_output(2));
  mux_72_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), mux_71_nl, fsm_output(0));
  and_514_nl <= nand_117_cse AND (fsm_output(5));
  nor_229_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(5))));
  mux_70_nl <= MUX_s_1_2_2(and_514_nl, nor_229_nl, fsm_output(0));
  mux_73_nl <= MUX_s_1_2_2(mux_72_nl, mux_70_nl, fsm_output(4));
  mux_76_nl <= MUX_s_1_2_2(mux_75_nl, mux_73_nl, fsm_output(3));
  mux_68_nl <= MUX_s_1_2_2(or_484_cse, (fsm_output(7)), fsm_output(0));
  nor_230_nl <= NOT((fsm_output(4)) OR mux_68_nl);
  and_515_nl <= (fsm_output(4)) AND (fsm_output(2)) AND (NOT (fsm_output(7))) AND
      (fsm_output(5));
  mux_69_nl <= MUX_s_1_2_2(nor_230_nl, and_515_nl, fsm_output(3));
  mux_77_nl <= MUX_s_1_2_2(mux_76_nl, mux_69_nl, fsm_output(6));
  mux_86_rmff <= MUX_s_1_2_2(mux_85_nl, mux_77_nl, fsm_output(1));
  or_160_cse <= (fsm_output(7)) OR (fsm_output(3));
  or_182_nl <= nor_208_cse OR (fsm_output(6));
  mux_161_nl <= MUX_s_1_2_2(or_tmp_158, or_414_cse, fsm_output(2));
  mux_162_nl <= MUX_s_1_2_2(or_182_nl, mux_161_nl, fsm_output(0));
  mux_163_nl <= MUX_s_1_2_2(mux_162_nl, (NOT (fsm_output(6))), fsm_output(4));
  nor_209_nl <= NOT(nor_210_cse OR (fsm_output(6)));
  mux_159_nl <= MUX_s_1_2_2(nor_209_nl, (fsm_output(5)), fsm_output(0));
  mux_158_nl <= MUX_s_1_2_2(or_tmp_157, mux_tmp_151, fsm_output(0));
  mux_160_nl <= MUX_s_1_2_2((NOT mux_159_nl), mux_158_nl, fsm_output(4));
  mux_164_nl <= MUX_s_1_2_2(mux_163_nl, mux_160_nl, fsm_output(3));
  or_178_nl <= (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(6));
  mux_155_nl <= MUX_s_1_2_2(or_178_nl, (fsm_output(6)), fsm_output(0));
  nand_136_nl <= NOT(nand_137_cse AND (fsm_output(6)));
  mux_156_nl <= MUX_s_1_2_2(mux_155_nl, nand_136_nl, fsm_output(4));
  mux_152_nl <= MUX_s_1_2_2((NOT or_tmp_158), or_414_cse, fsm_output(2));
  mux_153_nl <= MUX_s_1_2_2((fsm_output(5)), mux_152_nl, fsm_output(0));
  mux_154_nl <= MUX_s_1_2_2((NOT mux_153_nl), mux_tmp_151, fsm_output(4));
  mux_157_nl <= MUX_s_1_2_2(mux_156_nl, mux_154_nl, fsm_output(3));
  mux_165_nl <= MUX_s_1_2_2(mux_164_nl, mux_157_nl, fsm_output(1));
  or_175_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("010"));
  or_174_nl <= (fsm_output(0)) OR (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(6));
  mux_148_nl <= MUX_s_1_2_2(or_174_nl, or_414_cse, fsm_output(4));
  mux_149_nl <= MUX_s_1_2_2(or_175_nl, mux_148_nl, fsm_output(3));
  mux_146_nl <= MUX_s_1_2_2(or_tmp_158, or_tmp_157, fsm_output(4));
  nand_18_nl <= NOT((fsm_output(4)) AND (NOT(and_468_cse OR CONV_SL_1_1(fsm_output(6
      DOWNTO 5)/=STD_LOGIC_VECTOR'("00")))));
  mux_147_nl <= MUX_s_1_2_2(mux_146_nl, nand_18_nl, fsm_output(3));
  mux_150_nl <= MUX_s_1_2_2(mux_149_nl, mux_147_nl, fsm_output(1));
  mux_166_itm <= MUX_s_1_2_2(mux_165_nl, mux_150_nl, fsm_output(7));
  or_188_cse <= (fsm_output(6)) OR (fsm_output(3));
  or_237_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_231_nl <= MUX_s_1_2_2((NOT nor_tmp_35), or_tmp_239, fsm_output(6));
  mux_232_nl <= MUX_s_1_2_2(mux_231_nl, mux_705_cse, fsm_output(1));
  mux_233_nl <= MUX_s_1_2_2(mux_232_nl, mux_708_cse, fsm_output(4));
  mux_228_nl <= MUX_s_1_2_2(or_484_cse, or_tmp_239, fsm_output(6));
  mux_229_nl <= MUX_s_1_2_2(mux_5_cse, mux_228_nl, fsm_output(1));
  mux_230_nl <= MUX_s_1_2_2(mux_tmp_219, mux_229_nl, fsm_output(4));
  mux_234_nl <= MUX_s_1_2_2(mux_233_nl, mux_230_nl, fsm_output(3));
  mux_224_nl <= MUX_s_1_2_2(mux_708_cse, mux_5_cse, fsm_output(1));
  mux_226_nl <= MUX_s_1_2_2(mux_705_cse, mux_224_nl, fsm_output(4));
  or_250_nl <= (NOT((NOT (fsm_output(0))) OR (fsm_output(5)))) OR (fsm_output(7));
  mux_218_nl <= MUX_s_1_2_2(nor_tmp_35, or_250_nl, fsm_output(6));
  mux_220_nl <= MUX_s_1_2_2(mux_tmp_219, mux_218_nl, fsm_output(1));
  mux_221_nl <= MUX_s_1_2_2(mux_220_nl, or_42_cse, fsm_output(4));
  mux_227_nl <= MUX_s_1_2_2(mux_226_nl, mux_221_nl, fsm_output(3));
  mux_235_itm <= MUX_s_1_2_2(mux_234_nl, mux_227_nl, fsm_output(2));
  or_273_cse <= (fsm_output(0)) OR (NOT (fsm_output(6))) OR (fsm_output(5)) OR (fsm_output(7))
      OR (NOT (fsm_output(3)));
  or_799_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  nand_119_cse <= NOT((fsm_output(3)) AND (fsm_output(5)));
  or_304_cse <= (fsm_output(7)) OR (fsm_output(2));
  nand_117_cse <= NOT((fsm_output(7)) AND (fsm_output(2)));
  or_800_cse <= (NOT (fsm_output(1))) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  or_256_cse <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(6));
  or_358_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("011"));
  or_360_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_361_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_295_cse <= MUX_s_1_2_2(or_361_cse, or_360_cse, fsm_output(5));
  mux_298_cse <= MUX_s_1_2_2(or_360_cse, or_799_cse, fsm_output(5));
  or_333_cse <= (fsm_output(3)) OR mux_50_cse;
  or_362_cse <= (fsm_output(0)) OR mux_295_cse;
  and_454_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_788_cse <= (NOT (fsm_output(5))) OR (fsm_output(7));
  and_471_cse <= (fsm_output(5)) AND (fsm_output(7));
  and_473_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  nor_253_cse <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  mux_13_nl <= MUX_s_1_2_2(mux_295_cse, mux_298_cse, or_237_cse);
  mux_14_nl <= MUX_s_1_2_2(mux_tmp_11, mux_13_nl, fsm_output(2));
  or_806_nl <= nor_253_cse OR mux_298_cse;
  mux_12_nl <= MUX_s_1_2_2(mux_tmp_11, or_806_nl, fsm_output(2));
  mux_333_itm <= MUX_s_1_2_2(mux_14_nl, mux_12_nl, fsm_output(1));
  or_803_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR mux_692_cse;
  or_804_nl <= (fsm_output(2)) OR mux_692_cse;
  or_805_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("001")) OR mux_298_cse;
  mux_335_nl <= MUX_s_1_2_2(or_804_nl, or_805_nl, fsm_output(1));
  mux_336_nl <= MUX_s_1_2_2(or_803_nl, mux_335_nl, z_out_1(5));
  S2_COPY_LOOP_p_or_1_seb <= mux_336_nl OR (fsm_output(0));
  nand_175_cse <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")));
  mux_689_cse <= MUX_s_1_2_2((fsm_output(6)), (fsm_output(7)), fsm_output(5));
  or_891_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0000"));
  nand_169_nl <= NOT((fsm_output(4)) AND (NOT mux_50_cse));
  mux_692_cse <= MUX_s_1_2_2(or_891_cse, nand_169_nl, fsm_output(3));
  or_42_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("010"));
  and_468_cse <= (fsm_output(0)) AND (fsm_output(2));
  nand_129_cse <= NOT((fsm_output(7)) AND (fsm_output(5)));
  or_414_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  mux_5_cse <= MUX_s_1_2_2(or_484_cse, or_788_cse, fsm_output(6));
  nand_6_cse <= NOT((fsm_output(1)) AND (NOT mux_5_cse));
  nor_236_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(4)) OR
      (fsm_output(5)) OR (fsm_output(7)));
  nor_237_nl <= NOT((fsm_output(1)) OR (NOT((fsm_output(3)) AND (fsm_output(4)) AND
      (fsm_output(5)) AND (fsm_output(7)))));
  mux_46_nl <= MUX_s_1_2_2(nor_236_nl, nor_237_nl, fsm_output(0));
  S1_OUTER_LOOP_k_or_nl <= (mux_46_nl AND (NOT (fsm_output(6))) AND (fsm_output(2)))
      OR and_dcpl_29;
  S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl <= MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1(4
      DOWNTO 0)), (z_out_1(4 DOWNTO 0)), S1_OUTER_LOOP_k_or_nl);
  mux_35_nl <= MUX_s_1_2_2(or_358_cse, mux_5_cse, fsm_output(1));
  mux_36_nl <= MUX_s_1_2_2(mux_35_nl, nand_6_cse, fsm_output(2));
  or_38_nl <= and_454_cse OR mux_5_cse;
  mux_37_nl <= MUX_s_1_2_2(mux_36_nl, or_38_nl, fsm_output(0));
  nor_294_nl <= NOT((fsm_output(4)) OR mux_37_nl);
  nand_4_nl <= NOT((fsm_output(1)) AND (NOT mux_tmp_1));
  mux_32_nl <= MUX_s_1_2_2(mux_tmp_1, or_42_cse, fsm_output(1));
  or_34_nl <= (fsm_output(0)) OR (fsm_output(2));
  mux_33_nl <= MUX_s_1_2_2(nand_4_nl, mux_32_nl, or_34_nl);
  and_521_nl <= (fsm_output(4)) AND (NOT mux_33_nl);
  mux_38_nl <= MUX_s_1_2_2(nor_294_nl, and_521_nl, fsm_output(3));
  S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl <=
      MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_mux_nl,
      mux_38_nl);
  or_407_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")) OR mux_689_cse;
  mux_355_nl <= MUX_s_1_2_2(nand_tmp_11, or_407_nl, fsm_output(1));
  mux_356_nl <= MUX_s_1_2_2(or_tmp_314, mux_355_nl, fsm_output(0));
  nor_246_nl <= NOT(mux_356_nl OR (fsm_output(4)));
  S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt <= MUX_v_6_2_2(('0' & S1_OUTER_LOOP_for_p_asn_S2_COPY_LOOP_for_i_5_0_sva_2_4_S1_OUTER_LOOP_k_and_nl),
      z_out_1, nor_246_nl);
  mux_708_cse <= MUX_s_1_2_2(and_471_cse, or_788_cse, fsm_output(6));
  mux_705_cse <= MUX_s_1_2_2((NOT and_471_cse), or_484_cse, fsm_output(6));
  nor_59_cse <= NOT((fsm_output(0)) OR (NOT (fsm_output(2))));
  or_484_cse <= (fsm_output(7)) OR (fsm_output(5));
  nand_62_cse <= NOT((fsm_output(4)) AND (NOT mux_295_cse));
  or_29_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  mux_542_nl <= MUX_s_1_2_2(nand_175_cse, or_29_nl, fsm_output(2));
  nor_285_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(0)) OR (fsm_output(3)) OR
      (fsm_output(7)) OR mux_542_nl);
  nor_109_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(4)));
  nor_110_nl <= NOT((fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(4)));
  mux_540_nl <= MUX_s_1_2_2(nor_109_nl, nor_110_nl, fsm_output(7));
  nand_84_nl <= NOT((fsm_output(3)) AND mux_540_nl);
  or_604_nl <= (NOT (fsm_output(7))) OR (fsm_output(2)) OR (NOT (fsm_output(5)))
      OR (fsm_output(4));
  or_603_nl <= (fsm_output(7)) OR (NOT (fsm_output(2))) OR (fsm_output(5)) OR (fsm_output(4));
  mux_539_nl <= MUX_s_1_2_2(or_604_nl, or_603_nl, fsm_output(3));
  mux_541_nl <= MUX_s_1_2_2(nand_84_nl, mux_539_nl, fsm_output(0));
  nor_286_nl <= NOT((fsm_output(6)) OR mux_541_nl);
  mux_543_cse <= MUX_s_1_2_2(nor_285_nl, nor_286_nl, fsm_output(1));
  nand_98_cse <= NOT((fsm_output(5)) AND (fsm_output(7)) AND (fsm_output(2)));
  or_691_cse <= (NOT (fsm_output(3))) OR (fsm_output(5));
  nand_93_cse <= NOT((fsm_output(0)) AND (NOT mux_295_cse));
  and_499_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  nor_235_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  butterFly_4_tw_and_cse_2_sva_mx0w2 <= (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(2))
      AND (S2_INNER_LOOP1_r_4_2_sva_1_0(0));
  nor_208_cse <= NOT((fsm_output(2)) OR (fsm_output(5)));
  nand_137_cse <= NOT((fsm_output(2)) AND (fsm_output(5)));
  nor_210_cse <= NOT((NOT (fsm_output(2))) OR (fsm_output(5)));
  butterFly_tw_and_cse_3_2_sva_1 <= STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      & (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(2))) AND S2_INNER_LOOP1_r_4_2_sva_1_0;
  modulo_add_3_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_15_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_3_acc_1_itm_32_1 <= modulo_add_3_acc_1_nl(32);
  modulo_add_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT
      acc_16_cse_32_1), 32), 33) + UNSIGNED'( "000000000000000000000000000000001"),
      33));
  modulo_add_acc_1_itm_32_1 <= modulo_add_acc_1_nl(32);
  modulo_add_1_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_14_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_1_acc_1_itm_32_1 <= modulo_add_1_acc_1_nl(32);
  modulo_add_2_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_19_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_2_acc_1_itm_32_1 <= modulo_add_2_acc_1_nl(32);
  modulo_add_7_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_16_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_7_acc_1_itm_32_1 <= modulo_add_7_acc_1_nl(32);
  modulo_add_4_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_14_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_4_acc_1_itm_32_1 <= modulo_add_4_acc_1_nl(32);
  modulo_add_5_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_19_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_5_acc_1_itm_32_1 <= modulo_add_5_acc_1_nl(32);
  modulo_add_6_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_15_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_6_acc_1_itm_32_1 <= modulo_add_6_acc_1_nl(32);
  modulo_add_11_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_19_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_11_acc_1_itm_32_1 <= modulo_add_11_acc_1_nl(32);
  modulo_add_8_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_15_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_8_acc_1_itm_32_1 <= modulo_add_8_acc_1_nl(32);
  modulo_add_9_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_16_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_9_acc_1_itm_32_1 <= modulo_add_9_acc_1_nl(32);
  modulo_add_10_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_14_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_10_acc_1_itm_32_1 <= modulo_add_10_acc_1_nl(32);
  modulo_add_15_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_16_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_15_acc_1_itm_32_1 <= modulo_add_15_acc_1_nl(32);
  modulo_add_12_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_14_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_12_acc_1_itm_32_1 <= modulo_add_12_acc_1_nl(32);
  modulo_add_13_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_19_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_13_acc_1_itm_32_1 <= modulo_add_13_acc_1_nl(32);
  modulo_add_14_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_15_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_14_acc_1_itm_32_1 <= modulo_add_14_acc_1_nl(32);
  modulo_add_19_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_16_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_19_acc_1_itm_32_1 <= modulo_add_19_acc_1_nl(32);
  modulo_add_16_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_14_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_16_acc_1_itm_32_1 <= modulo_add_16_acc_1_nl(32);
  modulo_add_17_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_19_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_17_acc_1_itm_32_1 <= modulo_add_17_acc_1_nl(32);
  modulo_add_18_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_15_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_18_acc_1_itm_32_1 <= modulo_add_18_acc_1_nl(32);
  modulo_add_23_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_16_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_23_acc_1_itm_32_1 <= modulo_add_23_acc_1_nl(32);
  modulo_add_20_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_14_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_20_acc_1_itm_32_1 <= modulo_add_20_acc_1_nl(32);
  modulo_add_21_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_19_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_21_acc_1_itm_32_1 <= modulo_add_21_acc_1_nl(32);
  modulo_add_22_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & m_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT acc_15_cse_32_1), 32), 33) + UNSIGNED'(
      "000000000000000000000000000000001"), 33));
  modulo_add_22_acc_1_itm_32_1 <= modulo_add_22_acc_1_nl(32);
  operator_20_true_1_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_2(19 DOWNTO
      5)) + SIGNED'( "111111111111111"), 15));
  operator_20_true_1_acc_1_itm_14 <= operator_20_true_1_acc_1_nl(14);
  mux_tmp_1 <= MUX_s_1_2_2(nand_129_cse, or_484_cse, fsm_output(6));
  xor_dcpl <= (fsm_output(7)) XOR (fsm_output(5));
  mux_10_nl <= MUX_s_1_2_2(mux_295_cse, mux_298_cse, fsm_output(4));
  nand_3_nl <= NOT((fsm_output(4)) AND (NOT mux_298_cse));
  mux_tmp_11 <= MUX_s_1_2_2(mux_10_nl, nand_3_nl, fsm_output(3));
  nor_tmp_8 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  and_19_cse <= (z_out_2(2)) AND S2_OUTER_LOOP_c_1_sva;
  and_dcpl_19 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_23 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_24 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_25 <= and_dcpl_24 AND and_dcpl_23;
  and_dcpl_26 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_27 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_28 <= and_dcpl_27 AND and_dcpl_26;
  and_dcpl_29 <= and_dcpl_28 AND and_dcpl_25;
  and_dcpl_30 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_32 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_33 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_34 <= and_dcpl_33 AND and_dcpl_32;
  and_dcpl_36 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_39 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_40 <= and_dcpl_39 AND and_506_cse;
  and_dcpl_42 <= and_dcpl_30 AND and_dcpl_23;
  and_dcpl_43 <= and_dcpl_34 AND and_dcpl_42;
  and_dcpl_45 <= and_dcpl_36 AND and_499_cse;
  and_dcpl_46 <= and_dcpl_40 AND and_dcpl_45;
  and_dcpl_50 <= xor_dcpl_2 AND (NOT (fsm_output(7))) AND (NOT (fsm_output(4)));
  nand_tmp_10 <= NOT((fsm_output(3)) AND (NOT mux_298_cse));
  mux_tmp_56 <= MUX_s_1_2_2(or_333_cse, nand_tmp_10, fsm_output(2));
  nand_tmp_11 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"))
      AND (NOT mux_298_cse));
  mux_58_nl <= MUX_s_1_2_2(mux_50_cse, mux_295_cse, fsm_output(3));
  or_68_nl <= (fsm_output(2)) OR mux_58_nl;
  mux_tmp_59 <= MUX_s_1_2_2(or_68_nl, nand_tmp_11, fsm_output(1));
  and_dcpl_52 <= and_dcpl_24 AND and_499_cse;
  and_dcpl_53 <= NOT((fsm_output(6)) OR (fsm_output(4)));
  and_dcpl_54 <= xor_dcpl AND and_dcpl_53;
  and_dcpl_57 <= and_dcpl_36 AND nor_235_cse;
  and_dcpl_60 <= NOT(mux_50_cse OR (fsm_output(4)));
  and_dcpl_62 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_63 <= and_473_cse AND and_dcpl_62;
  and_dcpl_64 <= and_dcpl_50 AND and_dcpl_63;
  nor_232_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("100")));
  nor_233_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("011")));
  mux_61_nl <= MUX_s_1_2_2(nor_232_nl, nor_233_nl, fsm_output(1));
  and_498_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)=STD_LOGIC_VECTOR'("0111"));
  mux_62_nl <= MUX_s_1_2_2(mux_61_nl, and_498_nl, fsm_output(0));
  and_dcpl_66 <= mux_62_nl AND (NOT (fsm_output(7))) AND xor_dcpl_2;
  or_dcpl_12 <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  and_dcpl_71 <= NOT(mux_50_cse OR CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000")));
  and_dcpl_74 <= and_dcpl_36 AND and_dcpl_62;
  or_tmp_64 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_65 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  and_dcpl_81 <= and_dcpl_36 AND and_dcpl_23;
  and_dcpl_82 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_83 <= and_dcpl_27 AND and_dcpl_82;
  and_dcpl_84 <= and_dcpl_83 AND and_dcpl_81;
  or_tmp_85 <= (fsm_output(2)) OR (fsm_output(6));
  and_dcpl_85 <= (NOT (fsm_output(0))) AND reg_butterFly_12_tw_and_cse_3_2_ftd_1;
  and_dcpl_87 <= and_454_cse AND and_dcpl_85;
  and_dcpl_88 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_89 <= and_dcpl_33 AND (fsm_output(5));
  and_dcpl_90 <= and_dcpl_89 AND and_dcpl_88;
  or_105_nl <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(6));
  or_104_nl <= (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_tmp_93 <= MUX_s_1_2_2(or_105_nl, or_104_nl, fsm_output(3));
  or_tmp_96 <= NOT((fsm_output(3)) AND (fsm_output(4)) AND (NOT (fsm_output(7)))
      AND (fsm_output(6)));
  or_tmp_97 <= (fsm_output(3)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(7)))
      OR (fsm_output(6));
  and_dcpl_94 <= (fsm_output(0)) AND reg_butterFly_12_tw_and_cse_3_2_ftd_1;
  and_dcpl_95 <= and_454_cse AND and_dcpl_94;
  and_dcpl_97 <= and_dcpl_33 AND and_506_cse;
  and_dcpl_98 <= and_dcpl_97 AND and_dcpl_57;
  and_dcpl_100 <= and_473_cse AND nor_235_cse;
  and_dcpl_103 <= and_dcpl_30 AND and_499_cse;
  and_dcpl_104 <= and_dcpl_28 AND and_dcpl_103;
  and_dcpl_105 <= and_dcpl_24 AND nor_235_cse;
  and_dcpl_106 <= and_dcpl_28 AND and_dcpl_105;
  and_dcpl_107 <= and_dcpl_19 AND and_dcpl_85;
  and_dcpl_108 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_110 <= and_dcpl_27 AND (fsm_output(5)) AND and_dcpl_108;
  and_dcpl_112 <= and_dcpl_19 AND and_dcpl_94;
  and_dcpl_114 <= and_473_cse AND and_dcpl_23;
  and_dcpl_115 <= and_dcpl_27 AND and_506_cse;
  and_dcpl_116 <= and_dcpl_115 AND and_dcpl_114;
  and_dcpl_117 <= and_dcpl_30 AND nor_235_cse;
  and_dcpl_118 <= and_dcpl_39 AND and_dcpl_32;
  and_dcpl_122 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_123 <= and_dcpl_39 AND (fsm_output(5));
  and_dcpl_124 <= and_dcpl_123 AND and_dcpl_122;
  and_dcpl_126 <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_127 <= and_dcpl_126 AND and_dcpl_85;
  and_dcpl_128 <= and_dcpl_123 AND and_dcpl_88;
  and_dcpl_130 <= and_dcpl_30 AND and_dcpl_62;
  and_dcpl_131 <= and_dcpl_40 AND and_dcpl_130;
  and_dcpl_133 <= and_dcpl_24 AND and_dcpl_62;
  or_tmp_99 <= (NOT (fsm_output(2))) OR (NOT (fsm_output(3))) OR (fsm_output(7))
      OR (fsm_output(6));
  or_tmp_101 <= (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(7))
      OR (NOT (fsm_output(6)));
  or_112_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (NOT (fsm_output(7)))
      OR (fsm_output(6));
  mux_98_nl <= MUX_s_1_2_2(or_tmp_99, or_112_nl, fsm_output(1));
  mux_99_itm <= MUX_s_1_2_2(or_tmp_101, mux_98_nl, fsm_output(0));
  or_tmp_102 <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(7)))
      OR (fsm_output(6));
  mux_tmp_100 <= MUX_s_1_2_2(or_tmp_102, or_tmp_99, fsm_output(1));
  mux_101_itm <= MUX_s_1_2_2(mux_tmp_100, or_tmp_101, fsm_output(0));
  or_118_nl <= (NOT (fsm_output(1))) OR (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(7))
      OR (NOT (fsm_output(6)));
  mux_102_itm <= MUX_s_1_2_2(or_118_nl, mux_tmp_100, fsm_output(0));
  or_tmp_108 <= (fsm_output(3)) OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(6));
  or_121_nl <= (NOT (fsm_output(3))) OR (fsm_output(4)) OR (NOT (fsm_output(7)))
      OR (fsm_output(6));
  mux_103_nl <= MUX_s_1_2_2(or_tmp_108, or_121_nl, fsm_output(1));
  or_120_nl <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(7))
      OR (NOT (fsm_output(6)));
  mux_104_itm <= MUX_s_1_2_2(mux_103_nl, or_120_nl, fsm_output(0));
  or_tmp_109 <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR (NOT
      (fsm_output(7))) OR (fsm_output(6));
  or_tmp_110 <= (fsm_output(2)) OR (fsm_output(3)) OR (NOT (fsm_output(4))) OR (fsm_output(7))
      OR (fsm_output(6));
  or_tmp_112 <= (fsm_output(1)) OR (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(4))
      OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  or_127_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(3))) OR (fsm_output(4))
      OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_tmp_107 <= MUX_s_1_2_2(or_127_nl, or_tmp_110, fsm_output(1));
  and_dcpl_144 <= (NOT (fsm_output(5))) AND (fsm_output(2));
  and_dcpl_147 <= and_dcpl_40 AND and_dcpl_74;
  and_dcpl_150 <= (fsm_output(5)) AND (fsm_output(2));
  or_tmp_119 <= NOT((fsm_output(2)) AND (fsm_output(3)) AND (NOT (fsm_output(7)))
      AND (fsm_output(6)));
  or_tmp_120 <= (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(3)) OR (NOT (fsm_output(7)))
      OR (fsm_output(6));
  or_131_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(6));
  mux_112_nl <= MUX_s_1_2_2(or_tmp_119, or_131_nl, fsm_output(1));
  mux_113_itm <= MUX_s_1_2_2(or_tmp_120, mux_112_nl, fsm_output(0));
  or_135_nl <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(6));
  mux_tmp_114 <= MUX_s_1_2_2(or_135_nl, or_tmp_119, fsm_output(1));
  mux_115_itm <= MUX_s_1_2_2(mux_tmp_114, or_tmp_120, fsm_output(0));
  or_136_nl <= (NOT (fsm_output(1))) OR (fsm_output(2)) OR (fsm_output(3)) OR (NOT
      (fsm_output(7))) OR (fsm_output(6));
  mux_116_itm <= MUX_s_1_2_2(or_136_nl, mux_tmp_114, fsm_output(0));
  not_tmp_113 <= NOT((fsm_output(4)) AND (fsm_output(5)) AND (fsm_output(7)));
  or_tmp_130 <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(5))
      OR (NOT (fsm_output(7)));
  or_tmp_132 <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010")) OR
      not_tmp_113;
  nand_123_nl <= NOT((fsm_output(2)) AND (fsm_output(3)) AND (fsm_output(4)) AND
      (fsm_output(5)) AND (NOT (fsm_output(7))));
  mux_tmp_121 <= MUX_s_1_2_2(nand_123_nl, or_tmp_130, fsm_output(1));
  or_tmp_147 <= (fsm_output(5)) OR (fsm_output(3));
  or_tmp_151 <= (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(3));
  or_167_nl <= (NOT (fsm_output(7))) OR (fsm_output(5)) OR (NOT (fsm_output(3)));
  mux_tmp_136 <= MUX_s_1_2_2(or_167_nl, or_tmp_151, fsm_output(6));
  or_630_nl <= (fsm_output(3)) OR (fsm_output(5)) OR (fsm_output(7)) OR (fsm_output(6));
  mux_tmp_137 <= MUX_s_1_2_2(mux_tmp_136, or_630_nl, fsm_output(4));
  mux_140_nl <= MUX_s_1_2_2(or_tmp_147, nand_119_cse, fsm_output(7));
  or_169_nl <= (fsm_output(6)) OR mux_140_nl;
  mux_141_nl <= MUX_s_1_2_2(mux_tmp_136, or_169_nl, fsm_output(4));
  mux_139_nl <= MUX_s_1_2_2(or_691_cse, or_tmp_151, fsm_output(6));
  or_168_nl <= (fsm_output(4)) OR mux_139_nl;
  mux_tmp_142 <= MUX_s_1_2_2(mux_141_nl, or_168_nl, fsm_output(2));
  or_tmp_157 <= (NOT (fsm_output(2))) OR (fsm_output(5)) OR (fsm_output(6));
  or_tmp_158 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  or_176_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_151 <= MUX_s_1_2_2(or_176_cse, or_414_cse, fsm_output(2));
  and_dcpl_161 <= and_dcpl_33 AND (NOT (fsm_output(5))) AND and_dcpl_108;
  or_tmp_186 <= (NOT (fsm_output(3))) OR (NOT (fsm_output(4))) OR (fsm_output(7))
      OR (fsm_output(6));
  or_tmp_188 <= (fsm_output(3)) OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR (NOT
      (fsm_output(6)));
  and_dcpl_166 <= and_dcpl_33 AND and_dcpl_82;
  and_dcpl_167 <= and_dcpl_166 AND and_dcpl_114;
  and_dcpl_168 <= and_dcpl_33 AND and_dcpl_26;
  and_dcpl_172 <= and_dcpl_27 AND (NOT (fsm_output(5)));
  and_dcpl_173 <= and_dcpl_172 AND and_dcpl_122;
  and_dcpl_175 <= and_dcpl_172 AND and_dcpl_88;
  and_dcpl_177 <= and_dcpl_83 AND and_dcpl_130;
  and_dcpl_181 <= and_dcpl_39 AND (NOT (fsm_output(5)));
  and_dcpl_182 <= and_dcpl_181 AND and_dcpl_88;
  and_dcpl_185 <= and_dcpl_39 AND and_dcpl_82;
  and_dcpl_186 <= and_dcpl_185 AND and_dcpl_57;
  and_dcpl_193 <= (NOT mux_116_itm) AND and_dcpl_26;
  or_tmp_190 <= (NOT (fsm_output(3))) OR (fsm_output(4)) OR (fsm_output(7)) OR (fsm_output(6));
  mux_179_nl <= MUX_s_1_2_2(or_tmp_188, or_tmp_190, fsm_output(1));
  or_203_nl <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(4)) OR (NOT
      (fsm_output(7))) OR (fsm_output(6));
  mux_180_itm <= MUX_s_1_2_2(mux_179_nl, or_203_nl, fsm_output(0));
  and_dcpl_195 <= (NOT mux_180_itm) AND (fsm_output(5)) AND (NOT (fsm_output(2)));
  or_tmp_193 <= (fsm_output(2)) OR (fsm_output(3)) OR (NOT (fsm_output(4))) OR (fsm_output(7))
      OR (NOT (fsm_output(6)));
  or_tmp_194 <= (fsm_output(1)) OR (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(4))
      OR (NOT (fsm_output(7))) OR (fsm_output(6));
  or_209_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(3))) OR (fsm_output(4))
      OR (fsm_output(7)) OR (fsm_output(6));
  mux_tmp_183 <= MUX_s_1_2_2(or_209_nl, or_tmp_193, fsm_output(1));
  mux_184_nl <= MUX_s_1_2_2(mux_tmp_183, or_tmp_194, fsm_output(0));
  and_dcpl_197 <= (NOT mux_184_nl) AND (fsm_output(5));
  or_210_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(2))) OR (fsm_output(3))
      OR (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_185_nl <= MUX_s_1_2_2(or_210_nl, mux_tmp_183, fsm_output(0));
  and_dcpl_198 <= (NOT mux_185_nl) AND (fsm_output(5));
  and_dcpl_199 <= (NOT mux_180_itm) AND and_dcpl_150;
  or_tmp_204 <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("001000"));
  or_tmp_206 <= CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0101010"));
  or_221_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("100111"));
  mux_tmp_192 <= MUX_s_1_2_2(or_221_nl, or_tmp_204, fsm_output(1));
  or_tmp_210 <= (NOT (fsm_output(1))) OR (NOT (fsm_output(0))) OR (fsm_output(7))
      OR (fsm_output(4));
  nor_tmp_32 <= (fsm_output(7)) AND (fsm_output(4));
  or_tmp_222 <= (fsm_output(4)) OR nand_119_cse;
  or_239_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("110"));
  mux_tmp_205 <= MUX_s_1_2_2(or_tmp_222, or_239_cse, fsm_output(6));
  mux_207_nl <= MUX_s_1_2_2((fsm_output(5)), (NOT (fsm_output(5))), fsm_output(3));
  nand_20_nl <= NOT((fsm_output(4)) AND mux_207_nl);
  nor_34_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(6))));
  mux_tmp_208 <= MUX_s_1_2_2(or_tmp_222, nand_20_nl, nor_34_nl);
  and_dcpl_214 <= and_dcpl_83 AND and_dcpl_45;
  nor_tmp_35 <= (fsm_output(0)) AND (fsm_output(5)) AND (fsm_output(7));
  mux_tmp_219 <= MUX_s_1_2_2((NOT or_484_cse), or_484_cse, fsm_output(6));
  or_tmp_239 <= (NOT((fsm_output(0)) OR (fsm_output(5)))) OR (fsm_output(7));
  or_tmp_249 <= (fsm_output(7)) OR (NOT (fsm_output(3)));
  or_tmp_252 <= (fsm_output(5)) OR (fsm_output(7)) OR (NOT (fsm_output(3)));
  nand_120_nl <= NOT((fsm_output(7)) AND (fsm_output(3)));
  mux_248_nl <= MUX_s_1_2_2(nand_120_nl, or_tmp_249, fsm_output(5));
  or_tmp_260 <= (fsm_output(6)) OR mux_248_nl;
  or_tmp_286 <= (NOT (fsm_output(7))) OR (fsm_output(2));
  or_tmp_297 <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(0)) OR (NOT
      (fsm_output(6)));
  not_tmp_184 <= NOT((fsm_output(3)) AND (fsm_output(1)));
  or_tmp_314 <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000")) OR
      mux_50_cse;
  nand_tmp_25 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")) OR
      mux_295_cse;
  or_dcpl_17 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  mux_381_cse <= MUX_s_1_2_2(or_tmp_158, or_414_cse, fsm_output(7));
  mux_360_nl <= MUX_s_1_2_2((fsm_output(5)), (NOT (fsm_output(5))), fsm_output(6));
  or_tmp_421 <= (fsm_output(4)) OR (fsm_output(7)) OR mux_360_nl;
  mux_419_nl <= MUX_s_1_2_2(nand_tmp_25, mux_tmp_56, fsm_output(1));
  mux_420_itm <= MUX_s_1_2_2(mux_419_nl, mux_tmp_59, fsm_output(0));
  and_dcpl_240 <= and_dcpl_89 AND and_dcpl_108;
  and_dcpl_242 <= and_dcpl_126 AND and_dcpl_94;
  and_dcpl_245 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_246 <= and_dcpl_245 AND and_dcpl_85;
  and_dcpl_250 <= and_dcpl_181 AND and_dcpl_108;
  and_dcpl_256 <= and_473_cse AND and_499_cse;
  or_tmp_477 <= (fsm_output(4)) OR mux_298_cse;
  or_509_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01")) OR mux_298_cse;
  or_507_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")) OR mux_295_cse;
  mux_tmp_441 <= MUX_s_1_2_2(or_509_nl, or_507_nl, fsm_output(1));
  and_dcpl_266 <= and_dcpl_166 AND and_dcpl_45;
  and_dcpl_267 <= and_dcpl_166 AND and_dcpl_100;
  and_dcpl_268 <= and_dcpl_166 AND and_dcpl_63;
  and_dcpl_269 <= and_dcpl_97 AND and_dcpl_133;
  and_dcpl_270 <= and_dcpl_97 AND and_dcpl_25;
  and_dcpl_271 <= and_dcpl_97 AND and_dcpl_52;
  and_dcpl_272 <= and_dcpl_27 AND and_dcpl_32;
  and_dcpl_273 <= and_dcpl_272 AND and_dcpl_114;
  and_dcpl_274 <= and_dcpl_272 AND and_dcpl_256;
  and_dcpl_275 <= and_dcpl_83 AND and_dcpl_117;
  and_dcpl_276 <= and_dcpl_115 AND and_dcpl_45;
  and_dcpl_277 <= and_dcpl_115 AND and_dcpl_100;
  and_dcpl_278 <= and_dcpl_115 AND and_dcpl_63;
  and_dcpl_279 <= and_dcpl_185 AND and_dcpl_133;
  and_dcpl_280 <= and_dcpl_185 AND and_dcpl_25;
  and_dcpl_281 <= and_dcpl_185 AND and_dcpl_52;
  and_dcpl_282 <= and_dcpl_39 AND and_dcpl_26;
  and_dcpl_283 <= and_dcpl_282 AND and_dcpl_114;
  and_dcpl_284 <= and_dcpl_282 AND and_dcpl_256;
  and_dcpl_285 <= and_dcpl_40 AND and_dcpl_117;
  or_tmp_522 <= (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  or_tmp_524 <= (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(1));
  or_tmp_553 <= (fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(5)) OR (NOT (fsm_output(2)));
  or_tmp_621 <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("010"));
  or_tmp_639 <= (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(6));
  mux_tmp_579 <= MUX_s_1_2_2(or_800_cse, or_256_cse, fsm_output(2));
  or_dcpl_26 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_59 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_61 <= or_799_cse OR or_dcpl_59 OR or_tmp_64 OR (NOT((fsm_output(1)) XOR
      (fsm_output(0))));
  or_dcpl_62 <= or_tmp_65 OR or_dcpl_17;
  xx_rsci_radr_d_mx0c0 <= (NOT mux_99_itm) AND and_dcpl_32;
  xx_rsci_radr_d_mx0c1 <= (NOT mux_101_itm) AND and_dcpl_32;
  xx_rsci_radr_d_mx0c2 <= (NOT mux_102_itm) AND and_dcpl_32;
  xx_rsci_radr_d_mx0c3 <= (NOT mux_104_itm) AND nor_208_cse;
  mux_105_nl <= MUX_s_1_2_2(or_tmp_110, or_tmp_109, fsm_output(1));
  mux_106_nl <= MUX_s_1_2_2(or_tmp_112, mux_105_nl, fsm_output(0));
  xx_rsci_radr_d_mx0c4 <= NOT(mux_106_nl OR (fsm_output(5)));
  mux_108_nl <= MUX_s_1_2_2(mux_tmp_107, or_tmp_112, fsm_output(0));
  xx_rsci_radr_d_mx0c5 <= NOT(mux_108_nl OR (fsm_output(5)));
  or_129_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(2))) OR (fsm_output(3))
      OR (fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_109_nl <= MUX_s_1_2_2(or_129_nl, mux_tmp_107, fsm_output(0));
  xx_rsci_radr_d_mx0c6 <= NOT(mux_109_nl OR (fsm_output(5)));
  xx_rsci_radr_d_mx0c7 <= (NOT mux_104_itm) AND and_dcpl_144;
  xx_rsci_radr_d_mx0c8 <= and_dcpl_28 AND and_dcpl_52;
  xx_rsci_radr_d_mx0c10 <= and_dcpl_40 AND and_dcpl_81;
  xx_rsci_wadr_d_mx0c0 <= and_dcpl_34 AND and_dcpl_74;
  mux_110_nl <= MUX_s_1_2_2(or_tmp_96, or_tmp_108, fsm_output(1));
  or_130_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(3))) OR (fsm_output(4))
      OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_111_nl <= MUX_s_1_2_2(mux_110_nl, or_130_nl, fsm_output(0));
  xx_rsci_wadr_d_mx0c1 <= (NOT mux_111_nl) AND and_dcpl_150;
  xx_rsci_wadr_d_mx0c2 <= (NOT mux_113_itm) AND and_506_cse;
  xx_rsci_wadr_d_mx0c3 <= (NOT mux_115_itm) AND and_506_cse;
  xx_rsci_wadr_d_mx0c4 <= (NOT mux_116_itm) AND and_506_cse;
  or_811_nl <= (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  nand_153_nl <= NOT((fsm_output(3)) AND (fsm_output(4)) AND (fsm_output(5)) AND
      (NOT (fsm_output(7))));
  mux_117_nl <= MUX_s_1_2_2(or_811_nl, nand_153_nl, fsm_output(1));
  or_812_nl <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR not_tmp_113;
  mux_118_nl <= MUX_s_1_2_2(mux_117_nl, or_812_nl, fsm_output(0));
  xx_rsci_wadr_d_mx0c5 <= NOT(mux_118_nl OR (fsm_output(6)) OR (fsm_output(2)));
  or_142_nl <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(4)))
      OR (NOT (fsm_output(5))) OR (fsm_output(7));
  mux_119_nl <= MUX_s_1_2_2(or_tmp_130, or_142_nl, fsm_output(1));
  mux_120_nl <= MUX_s_1_2_2(or_tmp_132, mux_119_nl, fsm_output(0));
  xx_rsci_wadr_d_mx0c6 <= NOT(mux_120_nl OR (fsm_output(6)));
  mux_122_nl <= MUX_s_1_2_2(mux_tmp_121, or_tmp_132, fsm_output(0));
  xx_rsci_wadr_d_mx0c7 <= NOT(mux_122_nl OR (fsm_output(6)));
  or_149_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("011")) OR not_tmp_113;
  mux_123_nl <= MUX_s_1_2_2(or_149_nl, mux_tmp_121, fsm_output(0));
  xx_rsci_wadr_d_mx0c8 <= NOT(mux_123_nl OR (fsm_output(6)));
  yy_rsci_radr_d_mx0c0 <= and_dcpl_34 AND and_dcpl_52;
  yy_rsci_radr_d_mx0c1 <= (NOT mux_113_itm) AND and_dcpl_26;
  yy_rsci_radr_d_mx0c2 <= (NOT mux_115_itm) AND and_dcpl_26;
  or_205_nl <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR (fsm_output(7))
      OR (fsm_output(6));
  mux_181_nl <= MUX_s_1_2_2(or_tmp_193, or_205_nl, fsm_output(1));
  mux_182_nl <= MUX_s_1_2_2(or_tmp_194, mux_181_nl, fsm_output(0));
  yy_rsci_radr_d_mx0c5 <= (NOT mux_182_nl) AND (fsm_output(5));
  yy_rsci_radr_d_mx0c9 <= and_dcpl_83 AND and_dcpl_74;
  yy_rsci_wadr_d_mx0c0 <= and_dcpl_34 AND and_dcpl_103;
  yy_rsci_wadr_d_mx0c1 <= and_dcpl_34 AND and_dcpl_105;
  mux_186_nl <= MUX_s_1_2_2(or_tmp_186, or_tmp_97, fsm_output(1));
  or_212_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(3))) OR (fsm_output(4))
      OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_187_nl <= MUX_s_1_2_2(mux_186_nl, or_212_nl, fsm_output(0));
  yy_rsci_wadr_d_mx0c2 <= (NOT mux_187_nl) AND and_dcpl_144;
  yy_rsci_wadr_d_mx0c3 <= (NOT mux_99_itm) AND and_dcpl_82;
  yy_rsci_wadr_d_mx0c4 <= (NOT mux_101_itm) AND and_dcpl_82;
  yy_rsci_wadr_d_mx0c5 <= (NOT mux_102_itm) AND and_dcpl_82;
  or_807_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 3)/=STD_LOGIC_VECTOR'("00100"));
  or_808_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 3)/=STD_LOGIC_VECTOR'("10011"));
  mux_188_nl <= MUX_s_1_2_2(or_807_nl, or_808_nl, fsm_output(1));
  or_809_nl <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR (NOT (fsm_output(4)))
      OR (fsm_output(5)) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_189_nl <= MUX_s_1_2_2(mux_188_nl, or_809_nl, fsm_output(0));
  yy_rsci_wadr_d_mx0c6 <= NOT(mux_189_nl OR (fsm_output(2)));
  or_217_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("100110"));
  mux_190_nl <= MUX_s_1_2_2(or_tmp_204, or_217_nl, fsm_output(1));
  mux_191_itm <= MUX_s_1_2_2(or_tmp_206, mux_190_nl, fsm_output(0));
  mux_193_itm <= MUX_s_1_2_2(mux_tmp_192, or_tmp_206, fsm_output(0));
  or_223_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0101011"));
  mux_194_itm <= MUX_s_1_2_2(or_223_nl, mux_tmp_192, fsm_output(0));
  yy_rsci_wadr_d_mx0c10 <= and_dcpl_28 AND and_dcpl_74;
  or_424_nl <= (fsm_output(2)) OR (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(5));
  nand_42_nl <= NOT((fsm_output(2)) AND (NOT mux_5_cse));
  mux_372_nl <= MUX_s_1_2_2(or_424_nl, nand_42_nl, fsm_output(0));
  nand_41_nl <= NOT(nor_59_cse AND (NOT mux_5_cse));
  mux_373_nl <= MUX_s_1_2_2(mux_372_nl, nand_41_nl, fsm_output(1));
  nor_136_nl <= NOT((fsm_output(4)) OR mux_373_nl);
  or_420_nl <= (fsm_output(6)) OR nand_129_cse;
  mux_369_nl <= MUX_s_1_2_2(mux_tmp_1, or_420_nl, fsm_output(2));
  or_419_nl <= (NOT (fsm_output(2))) OR (fsm_output(6)) OR nand_129_cse;
  mux_370_nl <= MUX_s_1_2_2(mux_369_nl, or_419_nl, fsm_output(0));
  nor_137_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(1)) OR mux_370_nl);
  S1_OUTER_LOOP_for_p_sva_1_mx0c1 <= MUX_s_1_2_2(nor_136_nl, nor_137_nl, fsm_output(3));
  and_466_nl <= (fsm_output(4)) AND (fsm_output(6));
  mux_380_nl <= MUX_s_1_2_2(and_dcpl_53, and_466_nl, fsm_output(3));
  S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 <= mux_380_nl AND (NOT (fsm_output(7))) AND
      nor_208_cse AND and_dcpl_62;
  mux_357_nl <= MUX_s_1_2_2(or_176_cse, or_tmp_158, fsm_output(7));
  nand_47_nl <= NOT((fsm_output(4)) AND (NOT mux_357_nl));
  mux_387_nl <= MUX_s_1_2_2(nand_47_nl, or_tmp_421, fsm_output(2));
  and_464_nl <= (fsm_output(3)) AND (NOT mux_387_nl);
  mux_361_nl <= MUX_s_1_2_2((NOT or_176_cse), or_414_cse, fsm_output(7));
  nor_131_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("001"))
      OR mux_361_nl);
  mux_388_nl <= MUX_s_1_2_2(and_464_nl, nor_131_nl, fsm_output(1));
  nor_132_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("001"))
      OR mux_381_cse);
  nand_45_nl <= NOT((fsm_output(4)) AND (NOT mux_381_cse));
  mux_383_nl <= MUX_s_1_2_2(or_tmp_421, nand_45_nl, fsm_output(2));
  and_465_nl <= (fsm_output(3)) AND (NOT mux_383_nl);
  mux_384_nl <= MUX_s_1_2_2(nor_132_nl, and_465_nl, fsm_output(1));
  S1_OUTER_LOOP_for_acc_cse_sva_mx0c1 <= MUX_s_1_2_2(mux_388_nl, mux_384_nl, fsm_output(0));
  S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 <= and_dcpl_50 AND and_dcpl_57;
  nor_296_cse <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("001"))
      OR mux_295_cse);
  nor_130_nl <= NOT((fsm_output(2)) OR mux_298_cse);
  and_462_nl <= (fsm_output(2)) AND (NOT mux_295_cse);
  mux_393_nl <= MUX_s_1_2_2(nor_130_nl, and_462_nl, fsm_output(4));
  and_461_nl <= (fsm_output(3)) AND mux_393_nl;
  mux_394_nl <= MUX_s_1_2_2(nor_296_cse, and_461_nl, fsm_output(1));
  and_463_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1011")) AND
      (NOT mux_50_cse);
  S1_OUTER_LOOP_for_acc_cse_sva_mx0c3 <= MUX_s_1_2_2(mux_394_nl, and_463_nl, fsm_output(0));
  butterFly_10_f1_sva_mx0c0 <= and_dcpl_34 AND and_dcpl_30 AND (fsm_output(1));
  mux_409_nl <= MUX_s_1_2_2(or_360_cse, or_361_cse, fsm_output(5));
  nor_127_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0100"))
      OR mux_409_nl);
  nor_128_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("011101")));
  nor_129_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("001011")));
  mux_408_nl <= MUX_s_1_2_2(nor_128_nl, nor_129_nl, fsm_output(1));
  butterFly_10_f1_sva_mx0c1 <= MUX_s_1_2_2(nor_127_nl, mux_408_nl, fsm_output(0));
  nor_124_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("1010001")));
  mux_412_nl <= MUX_s_1_2_2(or_dcpl_26, or_dcpl_59, fsm_output(3));
  or_474_nl <= (fsm_output(2)) OR mux_412_nl;
  or_471_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0010"));
  mux_413_nl <= MUX_s_1_2_2(or_474_nl, or_471_nl, fsm_output(7));
  nor_125_nl <= NOT((fsm_output(6)) OR mux_413_nl);
  or_468_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("101"));
  mux_411_nl <= MUX_s_1_2_2(or_31_cse, or_468_nl, fsm_output(2));
  nor_126_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"))
      OR mux_411_nl);
  mux_414_nl <= MUX_s_1_2_2(nor_125_nl, nor_126_nl, fsm_output(1));
  butterFly_10_f1_sva_mx0c2 <= MUX_s_1_2_2(nor_124_nl, mux_414_nl, fsm_output(0));
  nor_122_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(1)) OR (NOT (fsm_output(3)))
      OR (fsm_output(0)) OR (fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(4)));
  or_480_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(7)) OR (fsm_output(6))
      OR (NOT (fsm_output(4)));
  or_478_nl <= (fsm_output(0)) OR (fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_477_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(7))) OR (fsm_output(6))
      OR (fsm_output(4));
  mux_416_nl <= MUX_s_1_2_2(or_478_nl, or_477_nl, fsm_output(3));
  mux_417_nl <= MUX_s_1_2_2(or_480_nl, mux_416_nl, fsm_output(1));
  nor_123_nl <= NOT((fsm_output(5)) OR mux_417_nl);
  butterFly_10_f1_sva_mx0c3 <= MUX_s_1_2_2(nor_122_nl, nor_123_nl, fsm_output(2));
  butterFly_10_f1_sva_mx0c4 <= and_dcpl_161 AND and_dcpl_87;
  butterFly_10_f1_sva_mx0c5 <= (NOT mux_420_itm) AND (fsm_output(4)) AND (NOT reg_butterFly_12_tw_and_cse_3_2_ftd_1);
  butterFly_10_f1_sva_mx0c6 <= and_dcpl_161 AND and_dcpl_95;
  butterFly_10_f1_sva_mx0c7 <= and_dcpl_240 AND and_dcpl_127;
  butterFly_10_f1_sva_mx0c8 <= and_dcpl_240 AND and_dcpl_242;
  butterFly_10_f1_sva_mx0c9 <= and_dcpl_175 AND and_dcpl_242;
  butterFly_10_f1_sva_mx0c10 <= and_dcpl_175 AND and_dcpl_246;
  butterFly_10_f1_sva_mx0c11 <= and_dcpl_110 AND and_dcpl_87;
  butterFly_10_f1_sva_mx0c12 <= and_dcpl_110 AND and_dcpl_95;
  butterFly_10_f1_sva_mx0c13 <= and_dcpl_250 AND and_dcpl_127;
  butterFly_10_f1_sva_mx0c14 <= and_dcpl_250 AND and_dcpl_242;
  butterFly_10_f1_sva_mx0c15 <= and_dcpl_128 AND and_dcpl_242;
  butterFly_10_f1_sva_mx0c16 <= and_dcpl_128 AND and_dcpl_246;
  S2_OUTER_LOOP_c_1_sva_mx0c1 <= and_dcpl_97 AND and_dcpl_256;
  S2_OUTER_LOOP_c_1_sva_mx0c2 <= and_dcpl_185 AND and_dcpl_256;
  or_510_nl <= (fsm_output(0)) OR mux_tmp_441;
  nand_58_nl <= NOT((fsm_output(1)) AND (fsm_output(3)) AND (fsm_output(4)) AND (NOT
      mux_295_cse));
  mux_442_nl <= MUX_s_1_2_2(mux_tmp_441, nand_58_nl, fsm_output(0));
  mux_443_nl <= MUX_s_1_2_2(or_510_nl, mux_442_nl, and_19_cse);
  S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 <= (NOT mux_443_nl) AND (fsm_output(2));
  nor_nl <= NOT((fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(0))) OR (NOT
      (fsm_output(2))) OR mux_295_cse);
  nor_121_nl <= NOT((fsm_output(0)) OR (fsm_output(2)) OR mux_50_cse);
  nor_295_nl <= NOT((z_out_2(2)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(2)))
      OR mux_295_cse);
  mux_446_nl <= MUX_s_1_2_2(nor_121_nl, nor_295_nl, fsm_output(1));
  and_456_nl <= (fsm_output(4)) AND mux_446_nl;
  S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2 <= MUX_s_1_2_2(nor_nl, and_456_nl, fsm_output(3));
  or_528_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("100"));
  mux_468_nl <= MUX_s_1_2_2(or_tmp_65, or_tmp_64, fsm_output(1));
  mux_469_nl <= MUX_s_1_2_2(or_528_nl, mux_468_nl, fsm_output(0));
  butterFly_12_tw_and_cse_3_2_sva_mx0c2 <= (NOT mux_469_nl) AND xor_dcpl AND and_dcpl_53;
  butterFly_10_tw_asn_itm_mx0c0 <= NOT(mux_420_itm OR (fsm_output(4)));
  or_557_nl <= (fsm_output(2)) OR (fsm_output(7)) OR (NOT((fsm_output(4)) AND (fsm_output(6))
      AND (fsm_output(3)) AND (fsm_output(1))));
  or_555_nl <= (fsm_output(7)) OR (fsm_output(4)) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(1));
  or_554_nl <= (fsm_output(4)) OR (NOT((fsm_output(6)) AND (fsm_output(3)) AND (fsm_output(1))));
  mux_502_nl <= MUX_s_1_2_2(or_554_nl, or_tmp_524, fsm_output(7));
  mux_503_nl <= MUX_s_1_2_2(or_555_nl, mux_502_nl, fsm_output(2));
  or_552_nl <= (fsm_output(6)) OR not_tmp_184;
  or_551_nl <= (NOT (fsm_output(6))) OR (fsm_output(3)) OR (fsm_output(1));
  mux_500_nl <= MUX_s_1_2_2(or_552_nl, or_551_nl, fsm_output(4));
  mux_501_nl <= MUX_s_1_2_2(mux_500_nl, or_tmp_524, fsm_output(7));
  or_553_nl <= (fsm_output(2)) OR mux_501_nl;
  mux_504_nl <= MUX_s_1_2_2(mux_503_nl, or_553_nl, fsm_output(0));
  mux_505_itm <= MUX_s_1_2_2(or_557_nl, mux_504_nl, fsm_output(5));
  nor_113_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(4)) OR (fsm_output(6)) OR
      (fsm_output(3)) OR nand_98_cse);
  mux_523_nl <= MUX_s_1_2_2(and_dcpl_150, nor_210_cse, fsm_output(7));
  nand_81_nl <= NOT((fsm_output(3)) AND mux_523_nl);
  mux_524_nl <= MUX_s_1_2_2(nand_81_nl, or_tmp_553, fsm_output(6));
  nor_114_nl <= NOT((fsm_output(4)) OR mux_524_nl);
  or_577_nl <= (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(5))) OR (fsm_output(2));
  mux_522_nl <= MUX_s_1_2_2(or_tmp_553, or_577_nl, fsm_output(6));
  and_452_nl <= (fsm_output(4)) AND (NOT mux_522_nl);
  mux_525_nl <= MUX_s_1_2_2(nor_114_nl, and_452_nl, fsm_output(1));
  butterFly_13_tw_h_asn_itm_mx0c1 <= MUX_s_1_2_2(nor_113_nl, mux_525_nl, fsm_output(0));
  butterFly_13_tw_h_asn_itm_mx0c2 <= and_dcpl_83 AND and_dcpl_63;
  nor_106_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR (NOT (fsm_output(7))) OR
      (fsm_output(0)) OR nand_137_cse);
  or_680_nl <= (fsm_output(0)) OR (fsm_output(5)) OR (fsm_output(7)) OR (fsm_output(2));
  or_679_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(5))) OR (fsm_output(7))
      OR (fsm_output(2));
  mux_591_nl <= MUX_s_1_2_2(or_680_nl, or_679_nl, fsm_output(6));
  nor_107_nl <= NOT((fsm_output(3)) OR mux_591_nl);
  mux_547_nl <= MUX_s_1_2_2(nor_106_nl, nor_107_nl, fsm_output(4));
  or_614_nl <= (NOT (fsm_output(6))) OR (fsm_output(7)) OR (fsm_output(0)) OR (fsm_output(5))
      OR (fsm_output(2));
  or_612_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(5))) OR (fsm_output(2));
  or_611_nl <= (NOT (fsm_output(0))) OR (fsm_output(5)) OR (fsm_output(2));
  mux_544_nl <= MUX_s_1_2_2(or_612_nl, or_611_nl, fsm_output(7));
  or_613_nl <= (fsm_output(6)) OR mux_544_nl;
  mux_545_nl <= MUX_s_1_2_2(or_614_nl, or_613_nl, fsm_output(3));
  nor_108_nl <= NOT((fsm_output(4)) OR mux_545_nl);
  butterFly_10_tw_h_asn_itm_mx0c0 <= MUX_s_1_2_2(mux_547_nl, nor_108_nl, fsm_output(1));
  nor_102_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(6))) OR (NOT (fsm_output(4)))
      OR (fsm_output(7)) OR nand_137_cse);
  or_625_nl <= (NOT (fsm_output(2))) OR (fsm_output(5));
  mux_550_nl <= MUX_s_1_2_2(nand_137_cse, or_625_nl, fsm_output(7));
  nor_103_nl <= NOT((fsm_output(4)) OR mux_550_nl);
  nor_104_nl <= NOT((fsm_output(4)) OR (fsm_output(7)) OR (fsm_output(2)) OR (fsm_output(5)));
  mux_551_nl <= MUX_s_1_2_2(nor_103_nl, nor_104_nl, fsm_output(6));
  and_450_nl <= (fsm_output(3)) AND mux_551_nl;
  mux_552_nl <= MUX_s_1_2_2(nor_102_nl, and_450_nl, fsm_output(1));
  or_622_nl <= (fsm_output(7)) OR (fsm_output(2)) OR (fsm_output(5));
  mux_549_nl <= MUX_s_1_2_2(nand_98_cse, or_622_nl, fsm_output(4));
  nor_105_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(6)) OR
      mux_549_nl);
  butterFly_10_tw_h_asn_itm_mx0c1 <= MUX_s_1_2_2(mux_552_nl, nor_105_nl, fsm_output(0));
  butterFly_10_tw_h_asn_itm_mx0c2 <= and_dcpl_83 AND and_dcpl_114;
  mux_564_nl <= MUX_s_1_2_2(mux_tmp_93, or_tmp_522, fsm_output(1));
  mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c0 <= (NOT mux_564_nl) AND nor_208_cse
      AND (fsm_output(0));
  mux_567_nl <= MUX_s_1_2_2(or_tmp_621, or_tmp_222, fsm_output(7));
  nand_87_nl <= NOT((fsm_output(1)) AND (NOT mux_567_nl));
  mux_566_nl <= MUX_s_1_2_2(or_239_cse, or_tmp_621, fsm_output(7));
  or_649_nl <= (fsm_output(1)) OR mux_566_nl;
  mux_568_nl <= MUX_s_1_2_2(nand_87_nl, or_649_nl, fsm_output(0));
  nor_98_nl <= NOT((fsm_output(6)) OR mux_568_nl);
  or_690_nl <= (fsm_output(3)) OR (NOT (fsm_output(5)));
  mux_565_nl <= MUX_s_1_2_2(or_tmp_147, or_690_nl, fsm_output(4));
  nor_99_nl <= NOT((NOT((fsm_output(6)) AND (fsm_output(0)) AND (fsm_output(1)) AND
      (NOT (fsm_output(7))))) OR mux_565_nl);
  mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c1 <= MUX_s_1_2_2(nor_98_nl, nor_99_nl,
      fsm_output(2));
  modulo_sub_3_mux_itm_mx0c1 <= and_dcpl_161 AND and_dcpl_245 AND (fsm_output(0))
      AND (NOT (acc_9_cse_32_1(31)));
  modulo_sub_mux_itm_mx0c1 <= and_dcpl_161 AND and_dcpl_19 AND (NOT (fsm_output(0)))
      AND (NOT (acc_11_cse_32_1(31)));
  modulo_sub_1_mux_itm_mx0c1 <= and_dcpl_161 AND and_dcpl_19 AND (fsm_output(0))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_2_mux_itm_mx0c1 <= and_dcpl_161 AND and_454_cse AND (NOT (fsm_output(0)))
      AND (NOT (acc_22_cse_32_1(31)));
  modulo_sub_7_mux_itm_mx0c1 <= and_dcpl_90 AND and_dcpl_19 AND (fsm_output(0)) AND
      (NOT (acc_11_cse_32_1(31)));
  modulo_sub_4_mux_itm_mx0c1 <= and_dcpl_90 AND and_454_cse AND (NOT (fsm_output(0)))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_5_mux_itm_mx0c1 <= and_dcpl_90 AND and_454_cse AND (fsm_output(0)) AND
      (NOT (acc_22_cse_32_1(31)));
  modulo_sub_6_mux_itm_mx0c1 <= and_dcpl_240 AND and_dcpl_126 AND (NOT (fsm_output(0)))
      AND (NOT (acc_9_cse_32_1(31)));
  modulo_sub_11_mux_itm_mx0c1 <= and_dcpl_173 AND and_454_cse AND (NOT (fsm_output(0)))
      AND (NOT (acc_22_cse_32_1(31)));
  modulo_sub_8_mux_itm_mx0c1 <= and_dcpl_173 AND and_454_cse AND (fsm_output(0))
      AND (NOT (acc_9_cse_32_1(31)));
  modulo_sub_9_mux_itm_mx0c1 <= and_dcpl_175 AND and_dcpl_126 AND (NOT (fsm_output(0)))
      AND (NOT (acc_11_cse_32_1(31)));
  modulo_sub_10_mux_itm_mx0c1 <= and_dcpl_175 AND and_dcpl_126 AND (fsm_output(0))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_15_mux_itm_mx0c1 <= and_dcpl_110 AND and_dcpl_245 AND (fsm_output(0))
      AND (NOT (acc_11_cse_32_1(31)));
  modulo_sub_12_mux_itm_mx0c1 <= and_dcpl_110 AND and_dcpl_19 AND (NOT (fsm_output(0)))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_13_mux_itm_mx0c1 <= and_dcpl_110 AND and_dcpl_19 AND (fsm_output(0))
      AND (NOT (acc_22_cse_32_1(31)));
  modulo_sub_14_mux_itm_mx0c1 <= and_dcpl_110 AND and_454_cse AND (NOT (fsm_output(0)))
      AND (NOT (acc_9_cse_32_1(31)));
  modulo_sub_19_mux_itm_mx0c1 <= and_dcpl_182 AND and_dcpl_19 AND (fsm_output(0))
      AND (NOT (acc_11_cse_32_1(31)));
  modulo_sub_16_mux_itm_mx0c1 <= and_dcpl_182 AND and_454_cse AND (NOT (fsm_output(0)))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_17_mux_itm_mx0c1 <= and_dcpl_182 AND and_454_cse AND (fsm_output(0))
      AND (NOT (acc_22_cse_32_1(31)));
  modulo_sub_18_mux_itm_mx0c1 <= and_dcpl_250 AND and_dcpl_126 AND (NOT (fsm_output(0)))
      AND (NOT (acc_9_cse_32_1(31)));
  modulo_sub_23_mux_itm_mx0c1 <= and_dcpl_124 AND and_454_cse AND (NOT (fsm_output(0)))
      AND (NOT (acc_11_cse_32_1(31)));
  modulo_sub_20_mux_itm_mx0c1 <= and_dcpl_124 AND and_454_cse AND (fsm_output(0))
      AND (NOT (acc_8_cse_32_1(31)));
  modulo_sub_21_mux_itm_mx0c1 <= and_dcpl_128 AND and_dcpl_126 AND (NOT (fsm_output(0)))
      AND (NOT (acc_22_cse_32_1(31)));
  modulo_sub_22_mux_itm_mx0c1 <= and_dcpl_128 AND and_dcpl_126 AND (fsm_output(0))
      AND (NOT (acc_9_cse_32_1(31)));
  xor_dcpl_2 <= NOT((fsm_output(6)) XOR (fsm_output(5)));
  and_327_tmp <= and_dcpl_54 AND and_dcpl_36 AND (NOT (fsm_output(1)));
  mux_465_nl <= MUX_s_1_2_2(mux_50_cse, or_362_cse, fsm_output(3));
  nand_68_nl <= NOT((fsm_output(3)) AND (fsm_output(0)) AND (NOT mux_298_cse));
  mux_466_nl <= MUX_s_1_2_2(mux_465_nl, nand_68_nl, fsm_output(1));
  nand_69_nl <= NOT((fsm_output(4)) AND (NOT mux_466_nl));
  nand_67_nl <= NOT((fsm_output(1)) AND (fsm_output(3)) AND (NOT mux_50_cse));
  mux_461_nl <= MUX_s_1_2_2(nand_93_cse, mux_298_cse, fsm_output(3));
  or_524_nl <= (fsm_output(0)) OR mux_298_cse;
  mux_460_nl <= MUX_s_1_2_2(mux_295_cse, or_524_nl, fsm_output(3));
  mux_462_nl <= MUX_s_1_2_2(mux_461_nl, mux_460_nl, fsm_output(1));
  mux_464_nl <= MUX_s_1_2_2(nand_67_nl, mux_462_nl, fsm_output(4));
  mux_467_nl <= MUX_s_1_2_2(nand_69_nl, mux_464_nl, fsm_output(2));
  butterFly_12_tw_and_ssc <= core_wen AND (and_dcpl_64 OR (NOT mux_467_nl) OR butterFly_12_tw_and_cse_3_2_sva_mx0c2);
  or_103_nl <= (NOT (fsm_output(2))) OR (fsm_output(6));
  mux_90_nl <= MUX_s_1_2_2(or_103_nl, or_tmp_85, fsm_output(1));
  and_493_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND (NOT
      mux_90_nl);
  nor_216_nl <= NOT((fsm_output(4)) OR (fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(2))
      OR (fsm_output(6)));
  mux_91_nl <= MUX_s_1_2_2(and_493_nl, nor_216_nl, fsm_output(0));
  and_492_nl <= (fsm_output(7)) AND mux_91_nl;
  nor_218_nl <= NOT((fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(6)));
  mux_87_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(2));
  mux_88_nl <= MUX_s_1_2_2((NOT or_tmp_85), mux_87_nl, fsm_output(1));
  and_86_nl <= (fsm_output(5)) AND mux_88_nl;
  mux_89_nl <= MUX_s_1_2_2(nor_218_nl, and_86_nl, fsm_output(4));
  nor_217_nl <= NOT((fsm_output(7)) OR (NOT((fsm_output(0)) AND mux_89_nl)));
  mux_92_nl <= MUX_s_1_2_2(and_492_nl, nor_217_nl, fsm_output(3));
  and_94_nl <= and_dcpl_90 AND and_dcpl_87;
  mux_95_nl <= MUX_s_1_2_2(or_tmp_97, or_tmp_96, fsm_output(2));
  or_108_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (NOT (fsm_output(4)))
      OR (fsm_output(7)) OR (fsm_output(6));
  mux_96_nl <= MUX_s_1_2_2(mux_95_nl, or_108_nl, fsm_output(1));
  nand_140_nl <= NOT((fsm_output(2)) AND (fsm_output(3)) AND (fsm_output(4)) AND
      (NOT (fsm_output(7))) AND (fsm_output(6)));
  nand_16_nl <= NOT((fsm_output(2)) AND (NOT mux_tmp_93));
  mux_94_nl <= MUX_s_1_2_2(nand_140_nl, nand_16_nl, fsm_output(1));
  mux_97_nl <= MUX_s_1_2_2(mux_96_nl, mux_94_nl, fsm_output(0));
  and_96_nl <= (NOT mux_97_nl) AND (fsm_output(5)) AND (NOT reg_butterFly_12_tw_and_cse_3_2_ftd_1);
  and_99_nl <= and_dcpl_90 AND and_dcpl_95;
  and_102_nl <= and_dcpl_97 AND and_dcpl_81;
  and_104_nl <= and_dcpl_97 AND and_dcpl_100;
  and_105_nl <= and_dcpl_97 AND and_dcpl_63;
  and_114_nl <= and_dcpl_110 AND and_dcpl_107;
  and_116_nl <= and_dcpl_110 AND and_dcpl_112;
  and_122_nl <= and_dcpl_118 AND and_dcpl_117;
  and_123_nl <= and_dcpl_118 AND and_dcpl_42;
  and_124_nl <= and_dcpl_118 AND and_dcpl_103;
  and_128_nl <= and_dcpl_124 AND and_dcpl_95;
  and_132_nl <= and_dcpl_128 AND and_dcpl_127;
  and_135_nl <= and_dcpl_40 AND and_dcpl_103;
  and_137_nl <= and_dcpl_40 AND and_dcpl_133;
  and_138_nl <= and_dcpl_40 AND and_dcpl_25;
  xx_rsci_d_d <= MUX1HOT_v_32_22_2(butterFly_10_f1_sva, modulo_add_7_qr_sva, butterFly_10_tw_asn_itm,
      modulo_add_4_qr_sva, modulo_sub_4_mux_itm, modulo_sub_5_mux_itm, modulo_sub_6_mux_itm,
      modulo_sub_7_mux_itm, reg_mult_res_lpi_4_dfm_cse_1, reg_mult_3_res_lpi_4_dfm_cse,
      modulo_add_15_qr_sva, modulo_add_12_qr_sva, modulo_sub_12_mux_itm, modulo_sub_13_mux_itm,
      modulo_sub_14_mux_itm, modulo_sub_15_mux_itm, modulo_add_23_qr_sva, modulo_add_20_qr_sva,
      modulo_sub_20_mux_itm, modulo_sub_21_mux_itm, modulo_sub_22_mux_itm, modulo_sub_23_mux_itm,
      STD_LOGIC_VECTOR'( mux_92_nl & and_94_nl & and_96_nl & and_99_nl & and_dcpl_98
      & and_102_nl & and_104_nl & and_105_nl & and_dcpl_104 & and_dcpl_106 & and_114_nl
      & and_116_nl & and_dcpl_116 & and_122_nl & and_123_nl & and_124_nl & and_128_nl
      & and_132_nl & and_dcpl_131 & and_135_nl & and_137_nl & and_138_nl));
  S2_COPY_LOOP_for_or_7_nl <= xx_rsci_radr_d_mx0c0 OR xx_rsci_radr_d_mx0c10 OR xx_rsci_radr_d_mx0c1
      OR xx_rsci_radr_d_mx0c2 OR xx_rsci_radr_d_mx0c3 OR xx_rsci_radr_d_mx0c4 OR
      xx_rsci_radr_d_mx0c5 OR xx_rsci_radr_d_mx0c6 OR xx_rsci_radr_d_mx0c7;
  S2_COPY_LOOP_for_mux1h_nl <= MUX1HOT_v_5_3_2(S1_OUTER_LOOP_for_acc_cse_sva, (reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg),
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, STD_LOGIC_VECTOR'( S2_COPY_LOOP_for_or_7_nl
      & xx_rsci_radr_d_mx0c8 & and_dcpl_147));
  S2_COPY_LOOP_for_or_9_nl <= xx_rsci_radr_d_mx0c0 OR xx_rsci_radr_d_mx0c1 OR xx_rsci_radr_d_mx0c2
      OR xx_rsci_radr_d_mx0c3 OR xx_rsci_radr_d_mx0c4 OR xx_rsci_radr_d_mx0c5 OR
      xx_rsci_radr_d_mx0c6 OR xx_rsci_radr_d_mx0c7;
  S2_COPY_LOOP_for_mux1h_9_nl <= MUX1HOT_v_2_4_2(S2_INNER_LOOP1_r_4_2_sva_1_0, (S1_OUTER_LOOP_for_acc_cse_sva(4
      DOWNTO 3)), STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4 DOWNTO 3)), STD_LOGIC_VECTOR'( S2_COPY_LOOP_for_or_9_nl
      & xx_rsci_radr_d_mx0c8 & and_dcpl_147 & xx_rsci_radr_d_mx0c10));
  S2_COPY_LOOP_for_mux1h_10_nl <= MUX1HOT_v_3_9_2(STD_LOGIC_VECTOR'( "101"), STD_LOGIC_VECTOR'(
      "011"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "110"), STD_LOGIC_VECTOR'(
      "100"), STD_LOGIC_VECTOR'( "010"), (S1_OUTER_LOOP_for_acc_cse_sva(2 DOWNTO
      0)), reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(2
      DOWNTO 0)), STD_LOGIC_VECTOR'( xx_rsci_radr_d_mx0c1 & xx_rsci_radr_d_mx0c2
      & xx_rsci_radr_d_mx0c3 & xx_rsci_radr_d_mx0c4 & xx_rsci_radr_d_mx0c5 & xx_rsci_radr_d_mx0c6
      & xx_rsci_radr_d_mx0c8 & and_dcpl_147 & xx_rsci_radr_d_mx0c10));
  S2_COPY_LOOP_for_not_nl <= NOT xx_rsci_radr_d_mx0c7;
  S2_COPY_LOOP_for_and_2_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"), S2_COPY_LOOP_for_mux1h_10_nl,
      S2_COPY_LOOP_for_not_nl);
  S2_COPY_LOOP_for_or_5_nl <= MUX_v_3_2_2(S2_COPY_LOOP_for_and_2_nl, STD_LOGIC_VECTOR'("111"),
      xx_rsci_radr_d_mx0c0);
  xx_rsci_radr_d <= S2_COPY_LOOP_for_mux1h_nl & S2_COPY_LOOP_for_mux1h_9_nl & S2_COPY_LOOP_for_or_5_nl;
  S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_5_nl <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, and_dcpl_106);
  S2_COPY_LOOP_for_mux1h_11_nl <= MUX1HOT_s_1_3_2((reg_drf_revArr_ptr_smx_9_0_cse(4)),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4)), reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg,
      STD_LOGIC_VECTOR'( xx_rsci_wadr_d_mx0c0 & and_dcpl_104 & and_dcpl_106));
  S2_COPY_LOOP_for_or_nl <= (S2_COPY_LOOP_for_mux1h_11_nl AND (NOT(xx_rsci_wadr_d_mx0c1
      OR xx_rsci_wadr_d_mx0c2 OR xx_rsci_wadr_d_mx0c4 OR xx_rsci_wadr_d_mx0c6)))
      OR xx_rsci_wadr_d_mx0c3 OR xx_rsci_wadr_d_mx0c5 OR xx_rsci_wadr_d_mx0c7 OR
      xx_rsci_wadr_d_mx0c8;
  S2_COPY_LOOP_for_or_8_nl <= xx_rsci_wadr_d_mx0c1 OR xx_rsci_wadr_d_mx0c2 OR xx_rsci_wadr_d_mx0c3
      OR xx_rsci_wadr_d_mx0c4 OR xx_rsci_wadr_d_mx0c5 OR xx_rsci_wadr_d_mx0c6 OR
      xx_rsci_wadr_d_mx0c7 OR xx_rsci_wadr_d_mx0c8;
  S2_COPY_LOOP_for_mux1h_12_nl <= MUX1HOT_v_2_4_2((reg_drf_revArr_ptr_smx_9_0_cse(3
      DOWNTO 2)), S2_INNER_LOOP1_r_4_2_sva_1_0, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(3
      DOWNTO 2)), STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(2))),
      STD_LOGIC_VECTOR'( xx_rsci_wadr_d_mx0c0 & S2_COPY_LOOP_for_or_8_nl & and_dcpl_104
      & and_dcpl_106));
  S2_COPY_LOOP_for_or_2_nl <= xx_rsci_wadr_d_mx0c4 OR xx_rsci_wadr_d_mx0c5;
  S2_COPY_LOOP_for_or_3_nl <= xx_rsci_wadr_d_mx0c6 OR xx_rsci_wadr_d_mx0c7;
  S2_COPY_LOOP_for_mux1h_13_nl <= MUX1HOT_v_2_5_2((reg_drf_revArr_ptr_smx_9_0_cse(1
      DOWNTO 0)), STD_LOGIC_VECTOR'( "01"), STD_LOGIC_VECTOR'( "10"), (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(1
      DOWNTO 0)), (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(1 DOWNTO 0)), STD_LOGIC_VECTOR'(
      xx_rsci_wadr_d_mx0c0 & S2_COPY_LOOP_for_or_2_nl & S2_COPY_LOOP_for_or_3_nl
      & and_dcpl_104 & and_dcpl_106));
  S2_COPY_LOOP_for_nor_1_nl <= NOT(xx_rsci_wadr_d_mx0c2 OR xx_rsci_wadr_d_mx0c3);
  S2_COPY_LOOP_for_and_1_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), S2_COPY_LOOP_for_mux1h_13_nl,
      S2_COPY_LOOP_for_nor_1_nl);
  S2_COPY_LOOP_for_or_4_nl <= xx_rsci_wadr_d_mx0c1 OR xx_rsci_wadr_d_mx0c8;
  S2_COPY_LOOP_for_or_1_nl <= MUX_v_2_2_2(S2_COPY_LOOP_for_and_1_nl, STD_LOGIC_VECTOR'("11"),
      S2_COPY_LOOP_for_or_4_nl);
  xx_rsci_wadr_d <= S2_COPY_LOOP_for_S2_COPY_LOOP_for_mux_5_nl & S2_COPY_LOOP_for_or_nl
      & S2_COPY_LOOP_for_mux1h_12_nl & S2_COPY_LOOP_for_or_1_nl;
  or_158_nl <= (fsm_output(1)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(3)))
      OR (fsm_output(6));
  mux_131_nl <= MUX_s_1_2_2(or_158_nl, or_188_cse, fsm_output(7));
  or_159_nl <= (fsm_output(4)) OR mux_131_nl;
  or_157_nl <= (fsm_output(7)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(0)))
      OR (fsm_output(3)) OR (NOT (fsm_output(6)));
  or_155_nl <= (NOT (fsm_output(3))) OR (fsm_output(6));
  mux_129_nl <= MUX_s_1_2_2(or_155_nl, or_188_cse, fsm_output(7));
  mux_130_nl <= MUX_s_1_2_2(or_157_nl, mux_129_nl, fsm_output(4));
  mux_132_nl <= MUX_s_1_2_2(or_159_nl, mux_130_nl, fsm_output(5));
  nor_212_nl <= NOT((fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(3)) OR (NOT
      (fsm_output(6))));
  and_489_nl <= (fsm_output(1)) AND (fsm_output(0)) AND (fsm_output(3)) AND (NOT
      (fsm_output(6)));
  mux_127_nl <= MUX_s_1_2_2(nor_212_nl, and_489_nl, fsm_output(7));
  mux_124_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(3));
  mux_125_nl <= MUX_s_1_2_2((fsm_output(3)), mux_124_nl, fsm_output(1));
  nor_213_nl <= NOT(and_499_cse OR (fsm_output(3)) OR (fsm_output(6)));
  mux_126_nl <= MUX_s_1_2_2(mux_125_nl, nor_213_nl, fsm_output(7));
  mux_128_nl <= MUX_s_1_2_2(mux_127_nl, mux_126_nl, fsm_output(4));
  nand_17_nl <= NOT((fsm_output(5)) AND mux_128_nl);
  mux_133_nl <= MUX_s_1_2_2(mux_132_nl, nand_17_nl, fsm_output(2));
  xx_rsci_we_d_pff <= NOT mux_133_nl;
  mux_144_nl <= MUX_s_1_2_2(mux_tmp_137, mux_tmp_142, fsm_output(1));
  mux_134_nl <= MUX_s_1_2_2(or_691_cse, or_tmp_147, fsm_output(7));
  mux_135_nl <= MUX_s_1_2_2(mux_134_nl, or_160_cse, fsm_output(6));
  or_163_nl <= (fsm_output(4)) OR mux_135_nl;
  mux_138_nl <= MUX_s_1_2_2(mux_tmp_137, or_163_nl, fsm_output(2));
  mux_143_nl <= MUX_s_1_2_2(mux_tmp_142, mux_138_nl, fsm_output(1));
  mux_145_nl <= MUX_s_1_2_2(mux_144_nl, mux_143_nl, fsm_output(0));
  xx_rsci_readA_r_ram_ir_internal_RMASK_B_d <= NOT mux_145_nl;
  and_486_nl <= (fsm_output(1)) AND (fsm_output(4)) AND (fsm_output(6)) AND (NOT
      (fsm_output(3)));
  nor_204_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(4)) OR (fsm_output(6)) OR
      (fsm_output(3)));
  mux_170_nl <= MUX_s_1_2_2(and_486_nl, nor_204_nl, fsm_output(0));
  mux_169_nl <= MUX_s_1_2_2((fsm_output(3)), (NOT (fsm_output(3))), fsm_output(6));
  nor_205_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(1)) OR (fsm_output(4)) OR
      mux_169_nl);
  mux_171_nl <= MUX_s_1_2_2(mux_170_nl, nor_205_nl, fsm_output(5));
  or_187_nl <= (NOT (fsm_output(6))) OR (fsm_output(3));
  mux_167_nl <= MUX_s_1_2_2(or_188_cse, or_187_nl, fsm_output(4));
  or_189_nl <= (fsm_output(1)) OR mux_167_nl;
  nand_135_nl <= NOT((fsm_output(1)) AND (fsm_output(4)) AND (NOT (fsm_output(6)))
      AND (fsm_output(3)));
  mux_168_nl <= MUX_s_1_2_2(or_189_nl, nand_135_nl, fsm_output(0));
  nor_206_nl <= NOT((fsm_output(5)) OR mux_168_nl);
  mux_172_nl <= MUX_s_1_2_2(mux_171_nl, nor_206_nl, fsm_output(2));
  nor_207_nl <= NOT((fsm_output(2)) OR (fsm_output(5)) OR (NOT (fsm_output(0))) OR
      (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(3))));
  mux_173_nl <= MUX_s_1_2_2(mux_172_nl, nor_207_nl, fsm_output(7));
  and_165_nl <= and_dcpl_161 AND and_dcpl_107;
  mux_176_nl <= MUX_s_1_2_2(or_tmp_188, or_tmp_186, fsm_output(2));
  or_199_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (NOT (fsm_output(4)))
      OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_177_nl <= MUX_s_1_2_2(mux_176_nl, or_199_nl, fsm_output(1));
  or_198_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(4)))
      OR (fsm_output(7)) OR (fsm_output(6));
  nor_202_nl <= NOT((NOT (fsm_output(4))) OR (NOT (fsm_output(7))) OR (fsm_output(6)));
  nor_203_nl <= NOT((fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(6))));
  mux_174_nl <= MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output(3));
  nand_19_nl <= NOT((fsm_output(2)) AND mux_174_nl);
  mux_175_nl <= MUX_s_1_2_2(or_198_nl, nand_19_nl, fsm_output(1));
  mux_178_nl <= MUX_s_1_2_2(mux_177_nl, mux_175_nl, fsm_output(0));
  nor_257_nl <= NOT(mux_178_nl OR (fsm_output(5)) OR reg_butterFly_12_tw_and_cse_3_2_ftd_1);
  and_168_nl <= and_dcpl_161 AND and_dcpl_112;
  and_172_nl <= and_dcpl_168 AND and_dcpl_117;
  and_173_nl <= and_dcpl_168 AND and_dcpl_42;
  and_174_nl <= and_dcpl_168 AND and_dcpl_103;
  and_177_nl <= and_dcpl_173 AND and_dcpl_95;
  and_179_nl <= and_dcpl_175 AND and_dcpl_127;
  and_181_nl <= and_dcpl_83 AND and_dcpl_103;
  and_182_nl <= and_dcpl_83 AND and_dcpl_133;
  and_183_nl <= and_dcpl_83 AND and_dcpl_25;
  and_186_nl <= and_dcpl_182 AND and_dcpl_87;
  and_187_nl <= and_dcpl_182 AND and_dcpl_95;
  and_190_nl <= and_dcpl_185 AND and_dcpl_81;
  and_191_nl <= and_dcpl_185 AND and_dcpl_100;
  and_192_nl <= and_dcpl_185 AND and_dcpl_63;
  yy_rsci_d_d <= MUX1HOT_v_32_20_2(butterFly_10_f1_sva, modulo_add_3_qr_sva, butterFly_10_tw_asn_itm,
      modulo_add_qr_sva, modulo_sub_mux_itm, modulo_sub_1_mux_itm, modulo_sub_2_mux_itm,
      modulo_sub_3_mux_itm, modulo_add_11_qr_sva, modulo_add_8_qr_sva, modulo_sub_8_mux_itm,
      modulo_sub_9_mux_itm, modulo_sub_10_mux_itm, modulo_sub_11_mux_itm, modulo_add_19_qr_sva,
      modulo_add_16_qr_sva, modulo_sub_16_mux_itm, modulo_sub_17_mux_itm, modulo_sub_18_mux_itm,
      modulo_sub_19_mux_itm, STD_LOGIC_VECTOR'( mux_173_nl & and_165_nl & nor_257_nl
      & and_168_nl & and_dcpl_167 & and_172_nl & and_173_nl & and_174_nl & and_177_nl
      & and_179_nl & and_dcpl_177 & and_181_nl & and_182_nl & and_183_nl & and_186_nl
      & and_187_nl & and_dcpl_186 & and_190_nl & and_191_nl & and_192_nl));
  S1_OUTER_LOOP_for_or_9_nl <= yy_rsci_radr_d_mx0c1 OR and_dcpl_84 OR yy_rsci_radr_d_mx0c2
      OR and_dcpl_193 OR and_dcpl_195 OR yy_rsci_radr_d_mx0c5 OR and_dcpl_197 OR
      and_dcpl_198 OR and_dcpl_199;
  S1_OUTER_LOOP_for_mux1h_nl <= MUX1HOT_v_5_3_2((reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg),
      S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0, STD_LOGIC_VECTOR'(
      yy_rsci_radr_d_mx0c0 & S1_OUTER_LOOP_for_or_9_nl & yy_rsci_radr_d_mx0c9));
  S1_OUTER_LOOP_for_or_10_nl <= yy_rsci_radr_d_mx0c1 OR yy_rsci_radr_d_mx0c2 OR and_dcpl_193
      OR and_dcpl_195 OR yy_rsci_radr_d_mx0c5 OR and_dcpl_197 OR and_dcpl_198 OR
      and_dcpl_199;
  S1_OUTER_LOOP_for_mux1h_6_nl <= MUX1HOT_v_2_4_2((S1_OUTER_LOOP_for_acc_cse_sva(4
      DOWNTO 3)), S2_INNER_LOOP1_r_4_2_sva_1_0, STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg), (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4
      DOWNTO 3)), STD_LOGIC_VECTOR'( yy_rsci_radr_d_mx0c0 & S1_OUTER_LOOP_for_or_10_nl
      & yy_rsci_radr_d_mx0c9 & and_dcpl_84));
  S1_OUTER_LOOP_for_mux1h_7_nl <= MUX1HOT_v_3_9_2((S1_OUTER_LOOP_for_acc_cse_sva(2
      DOWNTO 0)), STD_LOGIC_VECTOR'( "101"), STD_LOGIC_VECTOR'( "011"), STD_LOGIC_VECTOR'(
      "001"), STD_LOGIC_VECTOR'( "110"), STD_LOGIC_VECTOR'( "100"), STD_LOGIC_VECTOR'(
      "010"), reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg, (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(2
      DOWNTO 0)), STD_LOGIC_VECTOR'( yy_rsci_radr_d_mx0c0 & yy_rsci_radr_d_mx0c2
      & and_dcpl_193 & and_dcpl_195 & yy_rsci_radr_d_mx0c5 & and_dcpl_197 & and_dcpl_198
      & yy_rsci_radr_d_mx0c9 & and_dcpl_84));
  S1_OUTER_LOOP_for_not_5_nl <= NOT and_dcpl_199;
  S1_OUTER_LOOP_for_and_3_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"), S1_OUTER_LOOP_for_mux1h_7_nl,
      S1_OUTER_LOOP_for_not_5_nl);
  S1_OUTER_LOOP_for_or_6_nl <= MUX_v_3_2_2(S1_OUTER_LOOP_for_and_3_nl, STD_LOGIC_VECTOR'("111"),
      yy_rsci_radr_d_mx0c1);
  yy_rsci_radr_d <= S1_OUTER_LOOP_for_mux1h_nl & S1_OUTER_LOOP_for_mux1h_6_nl & S1_OUTER_LOOP_for_or_6_nl;
  S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva,
      S2_COPY_LOOP_for_i_5_0_sva_1_4_0, yy_rsci_wadr_d_mx0c1);
  S1_OUTER_LOOP_for_mux1h_8_nl <= MUX1HOT_s_1_3_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4)),
      reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg, (reg_drf_revArr_ptr_smx_9_0_cse(4)), STD_LOGIC_VECTOR'(
      yy_rsci_wadr_d_mx0c0 & yy_rsci_wadr_d_mx0c1 & yy_rsci_wadr_d_mx0c10));
  S1_OUTER_LOOP_for_or_1_nl <= (S1_OUTER_LOOP_for_mux1h_8_nl AND (NOT(yy_rsci_wadr_d_mx0c2
      OR yy_rsci_wadr_d_mx0c3 OR yy_rsci_wadr_d_mx0c5 OR (NOT mux_191_itm)))) OR
      yy_rsci_wadr_d_mx0c4 OR yy_rsci_wadr_d_mx0c6 OR (NOT mux_193_itm) OR (NOT mux_194_itm);
  S1_OUTER_LOOP_for_or_8_nl <= yy_rsci_wadr_d_mx0c2 OR yy_rsci_wadr_d_mx0c3 OR yy_rsci_wadr_d_mx0c4
      OR yy_rsci_wadr_d_mx0c5 OR yy_rsci_wadr_d_mx0c6 OR (NOT mux_191_itm) OR (NOT
      mux_193_itm) OR (NOT mux_194_itm);
  S1_OUTER_LOOP_for_mux1h_9_nl <= MUX1HOT_v_2_4_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0(3
      DOWNTO 2)), STD_LOGIC_VECTOR'( reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(2))),
      S2_INNER_LOOP1_r_4_2_sva_1_0, (reg_drf_revArr_ptr_smx_9_0_cse(3 DOWNTO 2)),
      STD_LOGIC_VECTOR'( yy_rsci_wadr_d_mx0c0 & yy_rsci_wadr_d_mx0c1 & S1_OUTER_LOOP_for_or_8_nl
      & yy_rsci_wadr_d_mx0c10));
  S1_OUTER_LOOP_for_or_3_nl <= yy_rsci_wadr_d_mx0c5 OR yy_rsci_wadr_d_mx0c6;
  S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_nand_nl <= NOT(mux_191_itm AND mux_193_itm);
  S1_OUTER_LOOP_for_mux1h_10_nl <= MUX1HOT_v_2_5_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0(1
      DOWNTO 0)), (reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(1 DOWNTO 0)), STD_LOGIC_VECTOR'(
      "01"), STD_LOGIC_VECTOR'( "10"), (reg_drf_revArr_ptr_smx_9_0_cse(1 DOWNTO 0)),
      STD_LOGIC_VECTOR'( yy_rsci_wadr_d_mx0c0 & yy_rsci_wadr_d_mx0c1 & S1_OUTER_LOOP_for_or_3_nl
      & S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_nand_nl & yy_rsci_wadr_d_mx0c10));
  S1_OUTER_LOOP_for_nor_1_nl <= NOT(yy_rsci_wadr_d_mx0c3 OR yy_rsci_wadr_d_mx0c4);
  S1_OUTER_LOOP_for_and_2_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), S1_OUTER_LOOP_for_mux1h_10_nl,
      S1_OUTER_LOOP_for_nor_1_nl);
  S1_OUTER_LOOP_for_or_5_nl <= yy_rsci_wadr_d_mx0c2 OR (NOT mux_194_itm);
  S1_OUTER_LOOP_for_or_2_nl <= MUX_v_2_2_2(S1_OUTER_LOOP_for_and_2_nl, STD_LOGIC_VECTOR'("11"),
      S1_OUTER_LOOP_for_or_5_nl);
  yy_rsci_wadr_d <= S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_mux_nl & S1_OUTER_LOOP_for_or_1_nl
      & S1_OUTER_LOOP_for_mux1h_9_nl & S1_OUTER_LOOP_for_or_2_nl;
  nand_144_cse <= NOT((fsm_output(1)) AND (fsm_output(7)));
  mux_200_nl <= MUX_s_1_2_2((NOT or_tmp_210), nor_tmp_32, fsm_output(3));
  nor_194_nl <= NOT((fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(4))));
  mux_201_nl <= MUX_s_1_2_2(mux_200_nl, nor_194_nl, fsm_output(6));
  nor_195_nl <= NOT((fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(4)));
  nor_196_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(1)) OR (NOT (fsm_output(0)))
      OR (fsm_output(7)) OR (fsm_output(4)));
  mux_199_nl <= MUX_s_1_2_2(nor_195_nl, nor_196_nl, fsm_output(6));
  mux_202_nl <= MUX_s_1_2_2(mux_201_nl, mux_199_nl, fsm_output(5));
  nor_198_nl <= NOT((fsm_output(0)) OR (fsm_output(7)) OR (fsm_output(4)));
  mux_196_nl <= MUX_s_1_2_2(nor_198_nl, nor_tmp_32, fsm_output(1));
  nand_143_nl <= NOT(nand_144_cse AND (fsm_output(4)));
  mux_197_nl <= MUX_s_1_2_2((NOT mux_196_nl), nand_143_nl, fsm_output(3));
  or_226_nl <= and_499_cse OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  mux_195_nl <= MUX_s_1_2_2(or_226_nl, or_tmp_210, fsm_output(3));
  mux_198_nl <= MUX_s_1_2_2(mux_197_nl, mux_195_nl, fsm_output(6));
  nor_197_nl <= NOT((fsm_output(5)) OR mux_198_nl);
  yy_rsci_we_d_pff <= MUX_s_1_2_2(mux_202_nl, nor_197_nl, fsm_output(2));
  mux_210_nl <= MUX_s_1_2_2(mux_tmp_205, mux_tmp_208, fsm_output(1));
  mux_204_nl <= MUX_s_1_2_2(or_237_cse, or_tmp_222, fsm_output(6));
  mux_206_nl <= MUX_s_1_2_2(mux_tmp_205, mux_204_nl, fsm_output(2));
  mux_209_nl <= MUX_s_1_2_2(mux_tmp_208, mux_206_nl, fsm_output(1));
  mux_211_nl <= MUX_s_1_2_2(mux_210_nl, mux_209_nl, fsm_output(0));
  or_235_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0100"));
  mux_212_nl <= MUX_s_1_2_2(mux_211_nl, or_235_nl, fsm_output(7));
  yy_rsci_readA_r_ram_ir_internal_RMASK_B_d <= NOT mux_212_nl;
  nor_335_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("1100"))
      OR mux_50_cse);
  and_1115_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111")) AND
      (NOT mux_295_cse);
  mux_632_nl <= MUX_s_1_2_2(nor_296_cse, and_1115_nl, fsm_output(1));
  not_tmp_388 <= MUX_s_1_2_2(nor_335_nl, mux_632_nl, fsm_output(0));
  nor_323_cse <= NOT((NOT (fsm_output(3))) OR (NOT (fsm_output(5))) OR (fsm_output(1))
      OR (fsm_output(7)));
  or_tmp_750 <= (fsm_output(6)) OR (fsm_output(7)) OR (NOT (fsm_output(2)));
  and_532_ssc <= xor_dcpl AND and_dcpl_53 AND CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
  not_tmp_587 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01")));
  mux_673_nl <= MUX_s_1_2_2(mux_689_cse, mux_295_cse, fsm_output(4));
  mux_tmp_672 <= MUX_s_1_2_2(nand_62_cse, mux_673_nl, fsm_output(3));
  nand_tmp_102 <= nor_253_cse OR mux_295_cse;
  or_tmp_786 <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"));
  or_tmp_788 <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR (NOT and_468_cse);
  or_900_nl <= (fsm_output(0)) OR (NOT (fsm_output(2)));
  mux_698_nl <= MUX_s_1_2_2(or_900_nl, and_468_cse, fsm_output(3));
  mux_tmp_697 <= MUX_s_1_2_2((NOT mux_698_nl), (fsm_output(3)), fsm_output(1));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND mux_30_nl) = '1' ) THEN
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
            S2_COPY_LOOP_for_i_5_0_sva_1_4_0, and_dcpl_43);
        x_rsci_s_raddr_core_9_5 <= MUX_v_5_2_2(S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
            S1_OUTER_LOOP_for_acc_cse_sva, and_dcpl_43);
        x_rsci_s_waddr_core_4_0 <= MUX_v_5_2_2(S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
            (reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
            & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg), and_dcpl_46);
        x_rsci_s_waddr_core_9_5 <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva, S2_COPY_LOOP_for_i_5_0_sva_1_4_0,
            and_dcpl_46);
        x_rsci_s_dout_core <= xx_rsci_q_d;
        reg_twiddle_rsci_s_raddr_core_1_cse <= ((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(1))
            AND (NOT(mux_60_nl OR (fsm_output(4))))) OR (and_dcpl_60 AND and_dcpl_30
            AND (NOT (fsm_output(1))));
        reg_twiddle_rsci_s_raddr_core_2_cse <= MUX1HOT_s_1_4_2((butterFly_tw_and_cse_3_2_sva_1(0)),
            reg_butterFly_12_tw_and_cse_3_2_ftd_1, butterFly_4_tw_and_cse_2_sva_mx0w2,
            (S2_INNER_LOOP1_r_4_2_sva_1_0(0)), STD_LOGIC_VECTOR'( and_dcpl_64 & butterFly_tw_h_or_2_nl
            & and_56_nl & and_dcpl_71));
        reg_twiddle_rsci_s_raddr_core_0_cse <= ((reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg(0))
            AND (NOT(mux_66_nl OR (fsm_output(4))))) OR (and_dcpl_60 AND and_dcpl_30
            AND (NOT (fsm_output(0))));
        reg_twiddle_rsci_s_raddr_core_3_cse <= MUX1HOT_s_1_4_2((butterFly_tw_and_cse_3_2_sva_1(1)),
            reg_butterFly_12_tw_and_cse_3_2_ftd, (S2_INNER_LOOP1_r_4_2_sva_1_0(1)),
            (S2_INNER_LOOP1_r_4_2_sva_1_0(1)), STD_LOGIC_VECTOR'( and_dcpl_64 & and_dcpl_66
            & and_80_nl & and_dcpl_71));
        revArr_rsci_s_raddr_core <= S1_OUTER_LOOP_for_acc_cse_sva;
        reg_tw_rsci_s_raddr_core_cse <= S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg(9 DOWNTO
            0);
        S34_OUTER_LOOP_for_tf_mul_cmp_b <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_1_nl
            & S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_and_nl),32)), mult_x_1_sva, and_221_nl);
        reg_drf_revArr_ptr_smx_9_0_cse <= revArr_rsci_s_din_mxwt(4 DOWNTO 0);
        mult_3_res_sva <= acc_3_nl(32 DOWNTO 1);
        reg_mult_3_res_lpi_4_dfm_cse <= MUX_v_32_2_2(z_out_5, mult_3_res_sva, acc_29_cse_33);
        reg_mult_res_lpi_4_dfm_cse_1 <= MUX_v_32_2_2(z_out_6, mult_3_res_sva, acc_29_cse_33);
        S34_OUTER_LOOP_for_tf_h_sva <= tw_h_rsci_s_din_mxwt;
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
      ELSIF ( core_wen = '1' ) THEN
        reg_x_rsci_oswt_cse <= and_dcpl_34 AND and_dcpl_30 AND ((fsm_output(1)) XOR
            (fsm_output(0)));
        reg_x_rsci_oswt_1_cse <= and_dcpl_40 AND and_dcpl_36 AND (fsm_output(1));
        reg_twiddle_rsci_oswt_cse <= NOT mux_53_nl;
        reg_revArr_rsci_oswt_cse <= and_dcpl_50 AND and_dcpl_52;
        reg_tw_rsci_oswt_cse <= and_dcpl_84;
        reg_xx_rsc_cgo_cse <= mux_86_rmff;
        reg_yy_rsc_cgo_cse <= NOT mux_166_itm;
        reg_x_rsc_triosy_obj_iswt0_cse <= and_dcpl_123 AND and_dcpl_108 AND and_dcpl_19
            AND (fsm_output(0)) AND (z_out_1(5));
        reg_ensig_cgo_cse <= NOT mux_235_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((mux_214_nl AND and_dcpl_27) OR and_dcpl_214)) = '1' )
          THEN
        S34_OUTER_LOOP_for_tf_mul_cmp_a <= MUX_v_20_2_2((STD_LOGIC_VECTOR'( "000000000000000")
            & S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_and_1_nl), tw_rsci_s_din_mxwt, and_dcpl_214);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_666_nl AND core_wen) = '1' ) THEN
        reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg <= (z_out_1(4)) AND S2_COPY_LOOP_p_or_1_seb;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_686_nl) AND core_wen) = '1' ) THEN
        reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg <= S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl
            AND S2_COPY_LOOP_p_or_1_seb;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_694_nl AND core_wen) = '1' ) THEN
        reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"),
            S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl, S2_COPY_LOOP_p_or_1_seb);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        S2_COPY_LOOP_for_i_5_0_sva_1_5 <= '0';
      ELSIF ( ((NOT mux_704_nl) AND core_wen) = '1' ) THEN
        S2_COPY_LOOP_for_i_5_0_sva_1_5 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt(5);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( ((NOT mux_715_nl) AND core_wen) = '1' ) THEN
        S2_COPY_LOOP_for_i_5_0_sva_1_4_0 <= S2_COPY_LOOP_for_i_S2_COPY_LOOP_for_i_mux_rgt(4
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (((NOT mux_692_cse) AND and_dcpl_126 AND (fsm_output(0)))
          OR S1_OUTER_LOOP_for_p_sva_1_mx0c1)) = '1' ) THEN
        S1_OUTER_LOOP_for_p_sva_1 <= MUX_v_20_2_2(z_out_2, (STD_LOGIC_VECTOR'( "00000")
            & S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl), S1_OUTER_LOOP_for_p_sva_1_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT(or_891_cse OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"))
          OR or_dcpl_17))) = '1' ) THEN
        operator_20_true_1_slc_operator_20_true_1_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 OR S1_OUTER_LOOP_for_acc_cse_sva_mx0c1
          OR S1_OUTER_LOOP_for_acc_cse_sva_mx0c2 OR S1_OUTER_LOOP_for_acc_cse_sva_mx0c3
          OR and_dcpl_147)) = '1' ) THEN
        S1_OUTER_LOOP_for_acc_cse_sva <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"),
            S1_OUTER_LOOP_for_mux1h_4_nl, S1_OUTER_LOOP_for_not_4_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (butterFly_10_f1_sva_mx0c0 OR butterFly_10_f1_sva_mx0c1
          OR butterFly_10_f1_sva_mx0c2 OR butterFly_10_f1_sva_mx0c3 OR butterFly_10_f1_sva_mx0c4
          OR butterFly_10_f1_sva_mx0c5 OR butterFly_10_f1_sva_mx0c6 OR butterFly_10_f1_sva_mx0c7
          OR butterFly_10_f1_sva_mx0c8 OR butterFly_10_f1_sva_mx0c9 OR butterFly_10_f1_sva_mx0c10
          OR butterFly_10_f1_sva_mx0c11 OR butterFly_10_f1_sva_mx0c12 OR butterFly_10_f1_sva_mx0c13
          OR butterFly_10_f1_sva_mx0c14 OR butterFly_10_f1_sva_mx0c15 OR butterFly_10_f1_sva_mx0c16))
          = '1' ) THEN
        butterFly_10_f1_sva <= MUX1HOT_v_32_17_2(x_rsci_s_din_mxwt, yy_rsci_q_d,
            twiddle_h_rsci_s_din_mxwt, xx_rsci_q_d, modulo_add_1_qr_sva, butterFly_10_tw_asn_itm,
            modulo_add_2_qr_sva, modulo_add_5_qr_sva, modulo_add_6_qr_sva, modulo_add_9_qr_sva,
            modulo_add_10_qr_sva, modulo_add_13_qr_sva, modulo_add_14_qr_sva, modulo_add_17_qr_sva,
            modulo_add_18_qr_sva, modulo_add_21_qr_sva, modulo_add_22_qr_sva, STD_LOGIC_VECTOR'(
            butterFly_10_f1_sva_mx0c0 & butterFly_10_f1_sva_mx0c1 & butterFly_10_f1_sva_mx0c2
            & butterFly_10_f1_sva_mx0c3 & butterFly_10_f1_sva_mx0c4 & butterFly_10_f1_sva_mx0c5
            & butterFly_10_f1_sva_mx0c6 & butterFly_10_f1_sva_mx0c7 & butterFly_10_f1_sva_mx0c8
            & butterFly_10_f1_sva_mx0c9 & butterFly_10_f1_sva_mx0c10 & butterFly_10_f1_sva_mx0c11
            & butterFly_10_f1_sva_mx0c12 & butterFly_10_f1_sva_mx0c13 & butterFly_10_f1_sva_mx0c14
            & butterFly_10_f1_sva_mx0c15 & butterFly_10_f1_sva_mx0c16));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        S2_OUTER_LOOP_c_1_sva <= '0';
      ELSIF ( (core_wen AND ((and_dcpl_50 AND and_dcpl_45) OR S2_OUTER_LOOP_c_1_sva_mx0c1
          OR S2_OUTER_LOOP_c_1_sva_mx0c2)) = '1' ) THEN
        S2_OUTER_LOOP_c_1_sva <= (S2_OUTER_LOOP_c_1_sva OR (z_out_2(2))) AND (S2_OUTER_LOOP_c_1_sva_mx0c1
            OR S2_OUTER_LOOP_c_1_sva_mx0c2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (((NOT mux_440_nl) AND (fsm_output(3)) AND (fsm_output(1))
          AND (fsm_output(0))) OR S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1 OR S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2))
          = '1' ) THEN
        S2_INNER_LOOP1_r_4_2_sva_1_0 <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), S2_INNER_LOOP1_r_mux_nl,
            S2_INNER_LOOP1_r_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (butterFly_10_tw_asn_itm_mx0c0 OR and_dcpl_266 OR and_dcpl_267
          OR and_dcpl_268 OR and_dcpl_167 OR and_dcpl_269 OR and_dcpl_270 OR and_dcpl_271
          OR and_dcpl_98 OR and_dcpl_273 OR and_dcpl_274 OR and_dcpl_275 OR and_dcpl_177
          OR and_dcpl_276 OR and_dcpl_277 OR and_dcpl_278 OR and_dcpl_116 OR and_dcpl_279
          OR and_dcpl_280 OR and_dcpl_281 OR and_dcpl_186 OR and_dcpl_283 OR and_dcpl_284
          OR and_dcpl_285 OR and_dcpl_131)) = '1' ) THEN
        butterFly_10_tw_asn_itm <= MUX1HOT_v_32_5_2(twiddle_rsci_s_din_mxwt, acc_15_cse_32_1,
            acc_16_cse_32_1, acc_14_cse_32_1, acc_19_cse_32_1, STD_LOGIC_VECTOR'(
            butterFly_10_tw_asn_itm_mx0c0 & butterFly_tw_or_nl & butterFly_tw_or_1_nl
            & butterFly_tw_or_2_nl & butterFly_tw_or_3_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT((mux_499_nl OR (fsm_output(5))) AND mux_505_itm)))
          = '1' ) THEN
        mult_x_1_sva <= MUX_v_32_2_2(yy_rsci_q_d, xx_rsci_q_d, mux_505_itm);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (mux_543_cse OR butterFly_13_tw_h_asn_itm_mx0c1 OR butterFly_13_tw_h_asn_itm_mx0c2))
          = '1' ) THEN
        butterFly_13_tw_h_asn_itm <= MUX1HOT_v_32_3_2(twiddle_h_rsci_s_din_mxwt,
            (mult_z_mul_cmp_z(31 DOWNTO 0)), S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg,
            STD_LOGIC_VECTOR'( mux_543_cse & butterFly_13_tw_h_asn_itm_mx0c1 & butterFly_13_tw_h_asn_itm_mx0c2));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (((NOT mux_538_nl) AND and_dcpl_32) OR and_dcpl_195)) =
          '1' ) THEN
        mult_x_15_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_195);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (butterFly_10_tw_h_asn_itm_mx0c0 OR butterFly_10_tw_h_asn_itm_mx0c1
          OR butterFly_10_tw_h_asn_itm_mx0c2)) = '1' ) THEN
        butterFly_10_tw_h_asn_itm <= MUX1HOT_v_32_3_2(twiddle_h_rsci_s_din_mxwt,
            (mult_z_mul_cmp_z(31 DOWNTO 0)), S34_OUTER_LOOP_for_tf_mul_cmp_z_oreg,
            STD_LOGIC_VECTOR'( butterFly_10_tw_h_asn_itm_mx0c0 & butterFly_10_tw_h_asn_itm_mx0c1
            & butterFly_10_tw_h_asn_itm_mx0c2));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c0 OR mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c1
          OR and_dcpl_193)) = '1' ) THEN
        mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm <= MUX1HOT_v_32_3_2(xx_rsci_q_d,
            (mult_z_mul_cmp_z(31 DOWNTO 0)), yy_rsci_q_d, STD_LOGIC_VECTOR'( mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c0
            & mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm_mx0c1 & and_dcpl_193));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT mux_588_nl)) = '1' ) THEN
        operator_96_false_10_operator_96_false_10_slc_mult_10_t_mul_51_20_itm <=
            mult_z_mul_cmp_z(51 DOWNTO 20);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT(mux_590_nl OR (fsm_output(5)))) OR and_dcpl_198))
          = '1' ) THEN
        butterFly_14_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_198);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((NOT(mux_597_nl OR (fsm_output(5)))) OR and_dcpl_199))
          = '1' ) THEN
        butterFly_11_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_199);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND mux_607_nl) = '1' ) THEN
        mult_17_z_slc_mult_z_mul_cmp_z_31_0_itm <= mult_z_mul_cmp_z(31 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (((NOT mux_609_nl) AND and_dcpl_144) OR and_dcpl_197)) =
          '1' ) THEN
        butterFly_15_f1_sva <= MUX_v_32_2_2(xx_rsci_q_d, yy_rsci_q_d, and_dcpl_197);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND mux_622_nl) = '1' ) THEN
        operator_96_false_15_operator_96_false_15_slc_mult_15_t_mul_51_20_itm <=
            mult_z_mul_cmp_z(51 DOWNTO 20);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_3_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_3_qr_sva <= z_out_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_161 AND and_dcpl_245 AND (fsm_output(0)) AND
          (acc_9_cse_32_1(31))) OR modulo_sub_3_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_3_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_3_qif_acc_nl),
            32)), ('0' & (acc_9_cse_32_1(30 DOWNTO 0))), modulo_sub_3_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_16_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_161 AND and_dcpl_19 AND (NOT (fsm_output(0)))
          AND (acc_11_cse_32_1(31))) OR modulo_sub_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_qif_acc_nl),
            32)), ('0' & (acc_11_cse_32_1(30 DOWNTO 0))), modulo_sub_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_1_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_1_qr_sva <= z_out_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_161 AND and_dcpl_19 AND (fsm_output(0)) AND (acc_8_cse_32_1(31)))
          OR modulo_sub_1_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_1_mux_itm <= MUX_v_32_2_2(z_out_11, ('0' & (acc_8_cse_32_1(30
            DOWNTO 0))), modulo_sub_1_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_2_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_2_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_19_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_161 AND and_454_cse AND (NOT (fsm_output(0)))
          AND (acc_22_cse_32_1(31))) OR modulo_sub_2_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_2_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_2_qif_acc_nl),
            32)), ('0' & (acc_22_cse_32_1(30 DOWNTO 0))), modulo_sub_2_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_7_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_7_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_16_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_90 AND and_dcpl_19 AND (fsm_output(0)) AND (acc_11_cse_32_1(31)))
          OR modulo_sub_7_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_7_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_7_qif_acc_nl),
            32)), ('0' & (acc_11_cse_32_1(30 DOWNTO 0))), modulo_sub_7_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_4_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_4_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_14_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_90 AND and_454_cse AND (NOT (fsm_output(0)))
          AND (acc_8_cse_32_1(31))) OR modulo_sub_4_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_4_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_4_qif_acc_nl),
            32)), ('0' & (acc_8_cse_32_1(30 DOWNTO 0))), modulo_sub_4_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_5_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_5_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_19_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_90 AND and_454_cse AND (fsm_output(0)) AND (acc_22_cse_32_1(31)))
          OR modulo_sub_5_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_5_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_5_qif_acc_nl),
            32)), ('0' & (acc_22_cse_32_1(30 DOWNTO 0))), modulo_sub_5_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_6_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_6_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_15_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_240 AND and_dcpl_126 AND (NOT (fsm_output(0)))
          AND (acc_9_cse_32_1(31))) OR modulo_sub_6_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_6_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_6_qif_acc_nl),
            32)), ('0' & (acc_9_cse_32_1(30 DOWNTO 0))), modulo_sub_6_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_11_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_11_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_19_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_173 AND and_454_cse AND (NOT (fsm_output(0)))
          AND (acc_22_cse_32_1(31))) OR modulo_sub_11_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_11_mux_itm <= MUX_v_32_2_2(z_out_18, ('0' & (acc_22_cse_32_1(30
            DOWNTO 0))), modulo_sub_11_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_8_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_8_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_15_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_173 AND and_454_cse AND (fsm_output(0)) AND (acc_9_cse_32_1(31)))
          OR modulo_sub_8_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_8_mux_itm <= MUX_v_32_2_2(z_out_19, ('0' & (acc_9_cse_32_1(30
            DOWNTO 0))), modulo_sub_8_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_9_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_9_qr_sva <= z_out_21;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_175 AND and_dcpl_126 AND (NOT (fsm_output(0)))
          AND (acc_11_cse_32_1(31))) OR modulo_sub_9_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_9_mux_itm <= MUX_v_32_2_2(z_out_22, ('0' & (acc_11_cse_32_1(30
            DOWNTO 0))), modulo_sub_9_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_10_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_10_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_14_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_175 AND and_dcpl_126 AND (fsm_output(0)) AND
          (acc_8_cse_32_1(31))) OR modulo_sub_10_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_10_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_10_qif_acc_nl),
            32)), ('0' & (acc_8_cse_32_1(30 DOWNTO 0))), modulo_sub_10_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT(or_799_cse OR or_dcpl_26 OR or_dcpl_62))) = '1' ) THEN
        operator_20_true_8_slc_operator_20_true_8_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_15_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_15_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_16_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_110 AND and_dcpl_245 AND (fsm_output(0)) AND
          (acc_11_cse_32_1(31))) OR modulo_sub_15_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_15_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_15_qif_acc_nl),
            32)), ('0' & (acc_11_cse_32_1(30 DOWNTO 0))), modulo_sub_15_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_12_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_12_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_14_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_110 AND and_dcpl_19 AND (NOT (fsm_output(0)))
          AND (acc_8_cse_32_1(31))) OR modulo_sub_12_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_12_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_12_qif_acc_nl),
            32)), ('0' & (acc_8_cse_32_1(30 DOWNTO 0))), modulo_sub_12_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_13_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_13_qr_sva <= z_out_21;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_110 AND and_dcpl_19 AND (fsm_output(0)) AND (acc_22_cse_32_1(31)))
          OR modulo_sub_13_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_13_mux_itm <= MUX_v_32_2_2(z_out_18, ('0' & (acc_22_cse_32_1(30
            DOWNTO 0))), modulo_sub_13_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_14_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_14_qr_sva <= z_out_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_110 AND and_454_cse AND (NOT (fsm_output(0)))
          AND (acc_9_cse_32_1(31))) OR modulo_sub_14_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_14_mux_itm <= MUX_v_32_2_2(z_out_19, ('0' & (acc_9_cse_32_1(30
            DOWNTO 0))), modulo_sub_14_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_19_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_19_qr_sva <= z_out_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_182 AND and_dcpl_19 AND (fsm_output(0)) AND (acc_11_cse_32_1(31)))
          OR modulo_sub_19_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_19_mux_itm <= MUX_v_32_2_2(z_out_22, ('0' & (acc_11_cse_32_1(30
            DOWNTO 0))), modulo_sub_19_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_16_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_16_qr_sva <= z_out_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_182 AND and_454_cse AND (NOT (fsm_output(0)))
          AND (acc_8_cse_32_1(31))) OR modulo_sub_16_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_16_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_16_qif_acc_nl),
            32)), ('0' & (acc_8_cse_32_1(30 DOWNTO 0))), modulo_sub_16_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_17_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_17_qr_sva <= z_out_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_182 AND and_454_cse AND (fsm_output(0)) AND (acc_22_cse_32_1(31)))
          OR modulo_sub_17_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_17_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_17_qif_acc_nl),
            32)), ('0' & (acc_22_cse_32_1(30 DOWNTO 0))), modulo_sub_17_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_18_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_18_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_15_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_250 AND and_dcpl_126 AND (NOT (fsm_output(0)))
          AND (acc_9_cse_32_1(31))) OR modulo_sub_18_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_18_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_18_qif_acc_nl),
            32)), ('0' & (acc_9_cse_32_1(30 DOWNTO 0))), modulo_sub_18_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_23_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_23_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_16_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_124 AND and_454_cse AND (NOT (fsm_output(0)))
          AND (acc_11_cse_32_1(31))) OR modulo_sub_23_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_23_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_23_qif_acc_nl),
            32)), ('0' & (acc_11_cse_32_1(30 DOWNTO 0))), modulo_sub_23_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_20_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_20_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_14_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_124 AND and_454_cse AND (fsm_output(0)) AND (acc_8_cse_32_1(31)))
          OR modulo_sub_20_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_20_mux_itm <= MUX_v_32_2_2(z_out_11, ('0' & (acc_8_cse_32_1(30
            DOWNTO 0))), modulo_sub_20_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_21_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_21_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_19_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_128 AND and_dcpl_126 AND (NOT (fsm_output(0)))
          AND (acc_22_cse_32_1(31))) OR modulo_sub_21_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_21_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_21_qif_acc_nl),
            32)), ('0' & (acc_22_cse_32_1(30 DOWNTO 0))), modulo_sub_21_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND modulo_add_22_acc_1_itm_32_1) = '1' ) THEN
        modulo_add_22_qr_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_15_cse_32_1)
            - UNSIGNED(m_sva), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND ((and_dcpl_128 AND and_dcpl_126 AND (fsm_output(0)) AND
          (acc_9_cse_32_1(31))) OR modulo_sub_22_mux_itm_mx0c1)) = '1' ) THEN
        modulo_sub_22_mux_itm <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_22_qif_acc_nl),
            32)), ('0' & (acc_9_cse_32_1(30 DOWNTO 0))), modulo_sub_22_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (core_wen AND (NOT(or_361_cse OR nand_175_cse OR or_dcpl_62))) = '1' )
          THEN
        operator_20_true_15_slc_operator_20_true_15_acc_14_itm <= operator_20_true_1_acc_1_itm_14;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_butterFly_12_tw_and_cse_3_2_ftd <= '0';
      ELSIF ( butterFly_12_tw_and_ssc = '1' ) THEN
        reg_butterFly_12_tw_and_cse_3_2_ftd <= butterFly_tw_and_cse_3_2_sva_1(1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_butterFly_12_tw_and_cse_3_2_ftd_1 <= '0';
      ELSIF ( (butterFly_12_tw_and_ssc AND (NOT and_327_tmp)) = '1' ) THEN
        reg_butterFly_12_tw_and_cse_3_2_ftd_1 <= MUX1HOT_s_1_26_2((butterFly_tw_and_cse_3_2_sva_1(0)),
            modulo_add_3_acc_1_itm_32_1, modulo_add_acc_1_itm_32_1, modulo_add_1_acc_1_itm_32_1,
            modulo_add_2_acc_1_itm_32_1, modulo_add_7_acc_1_itm_32_1, modulo_add_4_acc_1_itm_32_1,
            modulo_add_5_acc_1_itm_32_1, modulo_add_6_acc_1_itm_32_1, modulo_add_11_acc_1_itm_32_1,
            modulo_add_8_acc_1_itm_32_1, modulo_add_9_acc_1_itm_32_1, modulo_add_10_acc_1_itm_32_1,
            modulo_add_15_acc_1_itm_32_1, modulo_add_12_acc_1_itm_32_1, modulo_add_13_acc_1_itm_32_1,
            modulo_add_14_acc_1_itm_32_1, modulo_add_19_acc_1_itm_32_1, modulo_add_16_acc_1_itm_32_1,
            modulo_add_17_acc_1_itm_32_1, modulo_add_18_acc_1_itm_32_1, modulo_add_23_acc_1_itm_32_1,
            modulo_add_20_acc_1_itm_32_1, modulo_add_21_acc_1_itm_32_1, modulo_add_22_acc_1_itm_32_1,
            butterFly_4_tw_and_cse_2_sva_mx0w2, STD_LOGIC_VECTOR'( and_dcpl_64 &
            and_dcpl_266 & and_dcpl_267 & and_dcpl_268 & and_dcpl_167 & and_dcpl_269
            & and_dcpl_270 & and_dcpl_271 & and_dcpl_98 & and_dcpl_273 & and_dcpl_274
            & and_dcpl_275 & and_dcpl_177 & and_dcpl_276 & and_dcpl_277 & and_dcpl_278
            & and_dcpl_116 & and_dcpl_279 & and_dcpl_280 & and_dcpl_281 & and_dcpl_186
            & and_dcpl_283 & and_dcpl_284 & and_dcpl_285 & and_dcpl_131 & butterFly_tw_and_25_nl));
      END IF;
    END IF;
  END PROCESS;
  mux_28_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(7));
  mux_29_nl <= MUX_s_1_2_2(mux_28_nl, nor_tmp_8, or_31_cse);
  and_503_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111"));
  mux_27_nl <= MUX_s_1_2_2(nor_tmp_8, (fsm_output(7)), and_503_nl);
  or_30_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_30_nl <= MUX_s_1_2_2(mux_29_nl, mux_27_nl, or_30_nl);
  or_63_nl <= and_499_cse OR mux_295_cse;
  mux_51_nl <= MUX_s_1_2_2(mux_50_cse, or_63_nl, fsm_output(3));
  or_62_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(1)) OR mux_298_cse;
  mux_52_nl <= MUX_s_1_2_2(mux_51_nl, or_62_nl, fsm_output(4));
  nand_9_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND
      (NOT mux_295_cse));
  or_793_nl <= nor_235_cse OR mux_298_cse;
  mux_49_nl <= MUX_s_1_2_2(nand_9_nl, or_793_nl, fsm_output(3));
  or_60_nl <= (fsm_output(4)) OR mux_49_nl;
  mux_53_nl <= MUX_s_1_2_2(mux_52_nl, or_60_nl, fsm_output(2));
  or_66_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")) OR mux_295_cse;
  mux_57_nl <= MUX_s_1_2_2(mux_tmp_56, or_66_nl, fsm_output(1));
  mux_60_nl <= MUX_s_1_2_2(mux_tmp_59, mux_57_nl, fsm_output(0));
  butterFly_tw_h_or_2_nl <= and_dcpl_66 OR (and_dcpl_54 AND and_dcpl_36 AND or_dcpl_12);
  and_56_nl <= and_dcpl_54 AND and_dcpl_52;
  or_76_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")) OR mux_50_cse;
  mux_64_nl <= MUX_s_1_2_2(nand_13_cse, nand_tmp_10, fsm_output(2));
  mux_63_nl <= MUX_s_1_2_2(mux_295_cse, mux_298_cse, fsm_output(3));
  nand_12_nl <= NOT((fsm_output(2)) AND (NOT mux_63_nl));
  mux_65_nl <= MUX_s_1_2_2(mux_64_nl, nand_12_nl, fsm_output(1));
  mux_66_nl <= MUX_s_1_2_2(or_76_nl, mux_65_nl, fsm_output(0));
  mux_67_nl <= MUX_s_1_2_2(or_tmp_65, or_tmp_64, and_499_cse);
  and_80_nl <= (NOT mux_67_nl) AND xor_dcpl AND and_dcpl_53;
  and_376_nl <= and_dcpl_28 AND and_dcpl_133;
  S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_1_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"),
      (S1_OUTER_LOOP_for_p_sva_1(9 DOWNTO 5)), and_376_nl);
  S1_OUTER_LOOP_k_mux_nl <= MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1(4 DOWNTO 0)),
      (z_out_1(4 DOWNTO 0)), and_dcpl_29);
  not_1235_nl <= NOT or_dcpl_61;
  S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_and_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"),
      S1_OUTER_LOOP_k_mux_nl, not_1235_nl);
  nor_192_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")));
  nor_193_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")));
  mux_217_nl <= MUX_s_1_2_2(nor_192_nl, nor_193_nl, fsm_output(0));
  and_221_nl <= mux_217_nl AND CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("010"))
      AND and_dcpl_108;
  or_913_nl <= (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_720_nl <= MUX_s_1_2_2(nand_144_cse, or_913_nl, fsm_output(5));
  nor_392_nl <= NOT((fsm_output(3)) OR mux_720_nl);
  mux_719_nl <= MUX_s_1_2_2(nor_392_nl, nor_323_cse, fsm_output(6));
  and_1132_nl <= (fsm_output(2)) AND (fsm_output(4)) AND mux_719_nl;
  nor_393_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(7)));
  nand_176_nl <= NOT((fsm_output(3)) AND (fsm_output(5)) AND (fsm_output(1)) AND
      (fsm_output(7)));
  or_914_nl <= (NOT (fsm_output(3))) OR (fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(7));
  mux_722_nl <= MUX_s_1_2_2(nand_176_nl, or_914_nl, fsm_output(6));
  nor_394_nl <= NOT((fsm_output(4)) OR mux_722_nl);
  mux_721_nl <= MUX_s_1_2_2(nor_393_nl, nor_394_nl, fsm_output(2));
  mux_718_nl <= MUX_s_1_2_2(and_1132_nl, mux_721_nl, fsm_output(0));
  nor_395_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(1)))
      OR (fsm_output(5)) OR (fsm_output(7)));
  mux_726_nl <= MUX_s_1_2_2((fsm_output(7)), (NOT (fsm_output(7))), fsm_output(5));
  and_1134_nl <= (NOT((fsm_output(3)) OR (NOT (fsm_output(1))))) AND mux_726_nl;
  mux_725_nl <= MUX_s_1_2_2(and_1134_nl, nor_323_cse, fsm_output(6));
  mux_724_nl <= MUX_s_1_2_2(nor_395_nl, mux_725_nl, fsm_output(0));
  and_1133_nl <= (fsm_output(4)) AND mux_724_nl;
  or_915_nl <= (NOT (fsm_output(3))) OR (fsm_output(1)) OR nand_129_cse;
  or_916_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(1))) OR (fsm_output(5))
      OR (fsm_output(7));
  mux_727_nl <= MUX_s_1_2_2(or_915_nl, or_916_nl, fsm_output(6));
  nor_397_nl <= NOT((fsm_output(4)) OR (fsm_output(0)) OR mux_727_nl);
  mux_723_nl <= MUX_s_1_2_2(and_1133_nl, nor_397_nl, fsm_output(2));
  or_917_nl <= (NOT (fsm_output(5))) OR (fsm_output(4)) OR (NOT (fsm_output(6)))
      OR (NOT (fsm_output(1))) OR (fsm_output(7));
  or_918_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (fsm_output(1)) OR (NOT
      (fsm_output(7)));
  or_919_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (fsm_output(1)) OR (fsm_output(7));
  mux_730_nl <= MUX_s_1_2_2(or_918_nl, or_919_nl, fsm_output(5));
  mux_729_nl <= MUX_s_1_2_2(or_917_nl, mux_730_nl, fsm_output(2));
  nor_398_nl <= NOT((fsm_output(0)) OR mux_729_nl);
  nor_399_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(4)))
      OR (NOT (fsm_output(6))) OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  nor_400_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(4))) OR (fsm_output(6)) OR
      (NOT (fsm_output(1))) OR (fsm_output(7)));
  nor_401_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(6))) OR (NOT (fsm_output(1)))
      OR (fsm_output(7)));
  nor_402_nl <= NOT((fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(1)) OR (NOT
      (fsm_output(7))));
  mux_733_nl <= MUX_s_1_2_2(nor_401_nl, nor_402_nl, fsm_output(5));
  mux_732_nl <= MUX_s_1_2_2(nor_400_nl, mux_733_nl, fsm_output(2));
  mux_731_nl <= MUX_s_1_2_2(nor_399_nl, mux_732_nl, fsm_output(0));
  mux_728_nl <= MUX_s_1_2_2(nor_398_nl, mux_731_nl, fsm_output(3));
  or_920_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(4))) OR (fsm_output(6))
      OR nand_117_cse;
  or_921_nl <= (NOT (fsm_output(6))) OR (fsm_output(7)) OR (fsm_output(2));
  mux_736_nl <= MUX_s_1_2_2(or_921_nl, or_tmp_750, fsm_output(4));
  nand_177_nl <= NOT((fsm_output(0)) AND (NOT mux_736_nl));
  mux_735_nl <= MUX_s_1_2_2(or_920_nl, nand_177_nl, fsm_output(5));
  nor_403_nl <= NOT((fsm_output(1)) OR mux_735_nl);
  or_922_nl <= (NOT (fsm_output(6))) OR (fsm_output(7)) OR (NOT (fsm_output(2)));
  mux_738_nl <= MUX_s_1_2_2(or_922_nl, or_tmp_750, fsm_output(4));
  nor_404_nl <= NOT((fsm_output(5)) OR (fsm_output(0)) OR mux_738_nl);
  nor_405_nl <= NOT((fsm_output(4)) OR (fsm_output(6)) OR nand_117_cse);
  nor_406_nl <= NOT((NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(7))
      OR (fsm_output(2)));
  mux_739_nl <= MUX_s_1_2_2(nor_405_nl, nor_406_nl, fsm_output(0));
  and_1135_nl <= (fsm_output(5)) AND mux_739_nl;
  mux_737_nl <= MUX_s_1_2_2(nor_404_nl, and_1135_nl, fsm_output(1));
  mux_734_nl <= MUX_s_1_2_2(nor_403_nl, mux_737_nl, fsm_output(3));
  mult_3_res_mux1h_2_nl <= MUX1HOT_v_32_4_2(mult_16_z_slc_mult_z_mul_cmp_z_31_0_itm,
      mult_17_z_slc_mult_z_mul_cmp_z_31_0_itm, butterFly_10_tw_h_asn_itm, butterFly_13_tw_h_asn_itm,
      STD_LOGIC_VECTOR'( mux_718_nl & mux_723_nl & mux_728_nl & mux_734_nl));
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_3_res_mux1h_2_nl & '1')
      + UNSIGNED((NOT (mult_z_mul_cmp_z(31 DOWNTO 0))) & '1'), 33));
  S1_OUTER_LOOP_k_mux_1_nl <= MUX_v_5_2_2((reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg), (z_out_1(4 DOWNTO 0)), and_dcpl_29);
  not_1236_nl <= NOT or_dcpl_61;
  S1_OUTER_LOOP_k_S1_OUTER_LOOP_k_and_1_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"),
      S1_OUTER_LOOP_k_mux_1_nl, not_1236_nl);
  nor_298_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0110")));
  nor_299_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("1001")));
  mux_213_nl <= MUX_s_1_2_2(nor_298_nl, nor_299_nl, fsm_output(1));
  nor_300_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("10010")));
  mux_214_nl <= MUX_s_1_2_2(mux_213_nl, nor_300_nl, fsm_output(0));
  nand_174_nl <= NOT(nand_175_cse AND (fsm_output(6)));
  or_873_nl <= (fsm_output(4)) OR not_tmp_587;
  mux_662_nl <= MUX_s_1_2_2(nand_174_nl, or_873_nl, fsm_output(3));
  mux_661_nl <= MUX_s_1_2_2(not_tmp_587, or_176_cse, fsm_output(4));
  mux_663_nl <= MUX_s_1_2_2(mux_662_nl, mux_661_nl, fsm_output(1));
  or_872_nl <= ((fsm_output(1)) AND (fsm_output(3))) OR (fsm_output(4));
  mux_660_nl <= MUX_s_1_2_2(not_tmp_587, or_176_cse, or_872_nl);
  mux_664_nl <= MUX_s_1_2_2(mux_663_nl, mux_660_nl, fsm_output(0));
  nor_380_nl <= NOT((((fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(3)))
      OR (NOT (fsm_output(4)))) AND (fsm_output(5))) OR (fsm_output(6)));
  mux_665_nl <= MUX_s_1_2_2(mux_664_nl, nor_380_nl, fsm_output(7));
  or_868_nl <= (NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))))
      OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_658_nl <= MUX_s_1_2_2(not_tmp_587, or_176_cse, or_868_nl);
  nor_381_nl <= NOT(((NOT((fsm_output(0)) AND (NOT (fsm_output(1))) AND (fsm_output(3))
      AND (fsm_output(4)))) AND (fsm_output(5))) OR (fsm_output(6)));
  mux_659_nl <= MUX_s_1_2_2(mux_658_nl, nor_381_nl, fsm_output(7));
  mux_666_nl <= MUX_s_1_2_2(mux_665_nl, mux_659_nl, fsm_output(2));
  S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_nl <= MUX_s_1_2_2((z_out(3)), (z_out_1(3)), mux_333_itm);
  or_879_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"));
  mux_682_nl <= MUX_s_1_2_2(or_879_nl, mux_295_cse, fsm_output(4));
  mux_679_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(6));
  mux_680_nl <= MUX_s_1_2_2(mux_679_nl, (fsm_output(6)), fsm_output(5));
  mux_681_nl <= MUX_s_1_2_2(mux_295_cse, mux_680_nl, fsm_output(4));
  mux_683_nl <= MUX_s_1_2_2(mux_682_nl, mux_681_nl, fsm_output(3));
  mux_684_nl <= MUX_s_1_2_2(mux_683_nl, nand_tmp_102, fsm_output(1));
  mux_677_nl <= MUX_s_1_2_2(mux_689_cse, mux_295_cse, or_237_cse);
  mux_678_nl <= MUX_s_1_2_2(mux_tmp_672, mux_677_nl, fsm_output(1));
  mux_685_nl <= MUX_s_1_2_2(mux_684_nl, mux_678_nl, fsm_output(2));
  mux_675_nl <= MUX_s_1_2_2(nand_tmp_102, mux_tmp_672, fsm_output(1));
  mux_668_nl <= MUX_s_1_2_2(or_361_cse, (fsm_output(6)), fsm_output(5));
  mux_669_nl <= MUX_s_1_2_2(mux_295_cse, mux_668_nl, fsm_output(4));
  mux_670_nl <= MUX_s_1_2_2(nand_62_cse, mux_669_nl, fsm_output(3));
  mux_671_nl <= MUX_s_1_2_2(mux_670_nl, mux_295_cse, fsm_output(1));
  mux_676_nl <= MUX_s_1_2_2(mux_675_nl, mux_671_nl, fsm_output(2));
  mux_686_nl <= MUX_s_1_2_2(mux_685_nl, mux_676_nl, fsm_output(0));
  S2_COPY_LOOP_p_S2_COPY_LOOP_p_nand_nl <= NOT(mux_333_itm AND ((NOT(or_237_cse OR
      and_454_cse)) OR mux_295_cse));
  S2_COPY_LOOP_p_S2_COPY_LOOP_p_mux_1_nl <= MUX_v_3_2_2((z_out_1(2 DOWNTO 0)), (z_out(2
      DOWNTO 0)), S2_COPY_LOOP_p_S2_COPY_LOOP_p_nand_nl);
  nor_382_nl <= NOT((fsm_output(1)) OR mux_692_cse);
  nor_383_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01"))
      OR mux_298_cse);
  nor_384_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))
      OR mux_689_cse);
  mux_690_nl <= MUX_s_1_2_2(nor_383_nl, nor_384_nl, fsm_output(1));
  mux_693_nl <= MUX_s_1_2_2(nor_382_nl, mux_690_nl, fsm_output(2));
  nor_385_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(3))) OR (fsm_output(4))
      OR mux_298_cse);
  nor_386_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(4)))
      OR (NOT (fsm_output(5))) OR (fsm_output(6)) OR (NOT (fsm_output(7))));
  mux_688_nl <= MUX_s_1_2_2(nor_385_nl, nor_386_nl, fsm_output(2));
  mux_694_nl <= MUX_s_1_2_2(mux_693_nl, mux_688_nl, fsm_output(0));
  mux_701_nl <= MUX_s_1_2_2(mux_tmp_697, or_tmp_788, fsm_output(5));
  mux_700_nl <= MUX_s_1_2_2(or_tmp_786, mux_tmp_697, fsm_output(5));
  mux_702_nl <= MUX_s_1_2_2(mux_701_nl, mux_700_nl, fsm_output(6));
  mux_697_nl <= MUX_s_1_2_2(or_tmp_788, or_tmp_786, fsm_output(5));
  or_899_nl <= (fsm_output(6)) OR mux_697_nl;
  mux_703_nl <= MUX_s_1_2_2(mux_702_nl, or_899_nl, fsm_output(7));
  or_895_nl <= (NOT (fsm_output(6))) OR (fsm_output(5)) OR (NOT (fsm_output(3)));
  or_893_nl <= (NOT (fsm_output(3))) OR (fsm_output(0)) OR (fsm_output(2));
  mux_695_nl <= MUX_s_1_2_2((NOT (fsm_output(3))), or_893_nl, fsm_output(1));
  or_911_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01")) OR mux_695_nl;
  mux_696_nl <= MUX_s_1_2_2(or_895_nl, or_911_nl, fsm_output(7));
  mux_704_nl <= MUX_s_1_2_2(mux_703_nl, mux_696_nl, fsm_output(4));
  mux_711_nl <= MUX_s_1_2_2((fsm_output(5)), (NOT (fsm_output(5))), fsm_output(7));
  mux_712_nl <= MUX_s_1_2_2(mux_711_nl, or_484_cse, fsm_output(6));
  or_910_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR mux_712_nl;
  mux_709_nl <= MUX_s_1_2_2(mux_5_cse, mux_708_cse, fsm_output(1));
  mux_710_nl <= MUX_s_1_2_2(nand_6_cse, mux_709_nl, fsm_output(0));
  mux_713_nl <= MUX_s_1_2_2(or_910_nl, mux_710_nl, fsm_output(2));
  or_908_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101")) OR mux_5_cse;
  mux_714_nl <= MUX_s_1_2_2(mux_713_nl, or_908_nl, fsm_output(3));
  nor_377_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR mux_705_cse);
  nor_378_nl <= NOT((fsm_output(1)) OR (fsm_output(6)) OR (NOT and_471_cse));
  mux_706_nl <= MUX_s_1_2_2(nor_377_nl, nor_378_nl, fsm_output(2));
  nand_171_nl <= NOT((fsm_output(3)) AND mux_706_nl);
  mux_715_nl <= MUX_s_1_2_2(mux_714_nl, nand_171_nl, fsm_output(4));
  and_500_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 3)=STD_LOGIC_VECTOR'("10111"));
  nor_238_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))
      OR mux_298_cse);
  mux_45_nl <= MUX_s_1_2_2(and_500_nl, nor_238_nl, fsm_output(0));
  and_21_nl <= mux_45_nl AND and_dcpl_19;
  S1_OUTER_LOOP_for_p_S1_OUTER_LOOP_for_p_and_nl <= MUX_v_15_2_2(STD_LOGIC_VECTOR'("000000000000000"),
      (S1_OUTER_LOOP_for_p_sva_1(19 DOWNTO 5)), and_21_nl);
  and_1131_nl <= xor_dcpl_2 AND (NOT((fsm_output(7)) OR (fsm_output(4)))) AND (fsm_output(3))
      AND (NOT (fsm_output(2))) AND nor_235_cse;
  S1_OUTER_LOOP_for_mux_15_nl <= MUX_v_5_2_2((S1_OUTER_LOOP_for_p_sva_1(4 DOWNTO
      0)), (revArr_rsci_s_din_mxwt(9 DOWNTO 5)), and_1131_nl);
  S1_OUTER_LOOP_for_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg)
      + UNSIGNED(S1_OUTER_LOOP_for_mux_15_nl), 5));
  S6_OUTER_LOOP_for_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(S1_OUTER_LOOP_for_p_sva_1(4
      DOWNTO 0)) + UNSIGNED(reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg), 5));
  S1_OUTER_LOOP_for_or_nl <= S1_OUTER_LOOP_for_acc_cse_sva_mx0c0 OR S1_OUTER_LOOP_for_acc_cse_sva_mx0c2;
  S1_OUTER_LOOP_for_mux1h_4_nl <= MUX1HOT_v_5_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(S1_OUTER_LOOP_for_acc_nl),
      5)), S2_COPY_LOOP_for_i_5_0_sva_1_4_0, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(S6_OUTER_LOOP_for_acc_nl),
      5)), STD_LOGIC_VECTOR'( S1_OUTER_LOOP_for_or_nl & S1_OUTER_LOOP_for_acc_cse_sva_mx0c3
      & and_dcpl_147));
  S1_OUTER_LOOP_for_not_4_nl <= NOT S1_OUTER_LOOP_for_acc_cse_sva_mx0c1;
  S2_OUTER_LOOP_c_nor_nl <= NOT(or_tmp_477 OR or_tmp_65 OR or_dcpl_12);
  S2_INNER_LOOP1_r_mux_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'( '0' & S2_OUTER_LOOP_c_nor_nl),
      (z_out_2(1 DOWNTO 0)), S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c2);
  S2_INNER_LOOP1_r_not_nl <= NOT S2_INNER_LOOP1_r_4_2_sva_1_0_mx0c1;
  or_505_nl <= (fsm_output(2)) OR (fsm_output(4)) OR mux_298_cse;
  mux_450_nl <= MUX_s_1_2_2(or_tmp_477, nand_62_cse, fsm_output(2));
  nor_61_nl <= NOT(S2_OUTER_LOOP_c_1_sva OR (NOT (z_out_2(2))));
  mux_440_nl <= MUX_s_1_2_2(or_505_nl, mux_450_nl, nor_61_nl);
  butterFly_tw_or_nl <= and_dcpl_266 OR and_dcpl_116 OR and_dcpl_98 OR and_dcpl_274
      OR and_dcpl_186 OR and_dcpl_131;
  butterFly_tw_or_1_nl <= and_dcpl_267 OR and_dcpl_269 OR and_dcpl_276 OR and_dcpl_283
      OR and_dcpl_275 OR and_dcpl_279;
  butterFly_tw_or_2_nl <= and_dcpl_268 OR and_dcpl_280 OR and_dcpl_270 OR and_dcpl_177
      OR and_dcpl_277 OR and_dcpl_284;
  butterFly_tw_or_3_nl <= and_dcpl_167 OR and_dcpl_271 OR and_dcpl_273 OR and_dcpl_285
      OR and_dcpl_278 OR and_dcpl_281;
  or_549_nl <= (fsm_output(2)) OR mux_tmp_93;
  mux_497_nl <= MUX_s_1_2_2(or_tmp_522, or_tmp_190, fsm_output(2));
  mux_498_nl <= MUX_s_1_2_2(or_549_nl, mux_497_nl, fsm_output(1));
  or_546_nl <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(7))
      OR (NOT (fsm_output(6)));
  mux_496_nl <= MUX_s_1_2_2(or_546_nl, or_tmp_109, fsm_output(1));
  mux_499_nl <= MUX_s_1_2_2(mux_498_nl, mux_496_nl, fsm_output(0));
  or_602_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT
      (fsm_output(6)));
  mux_537_nl <= MUX_s_1_2_2(or_602_nl, or_tmp_102, fsm_output(1));
  or_600_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(3)))
      OR (fsm_output(7)) OR (fsm_output(6));
  mux_538_nl <= MUX_s_1_2_2(mux_537_nl, or_600_nl, fsm_output(0));
  or_675_nl <= (fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(1)) OR (fsm_output(7))
      OR (NOT (fsm_output(6)));
  or_673_nl <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(1)) OR (NOT
      (fsm_output(7))) OR (fsm_output(6));
  mux_586_nl <= MUX_s_1_2_2(or_675_nl, or_673_nl, fsm_output(3));
  or_672_nl <= (fsm_output(2)) OR (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(6));
  mux_584_nl <= MUX_s_1_2_2(mux_tmp_579, or_672_nl, fsm_output(5));
  or_671_nl <= (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_583_nl <= MUX_s_1_2_2(or_tmp_639, or_671_nl, fsm_output(5));
  mux_585_nl <= MUX_s_1_2_2(mux_584_nl, mux_583_nl, fsm_output(3));
  mux_587_nl <= MUX_s_1_2_2(mux_586_nl, mux_585_nl, fsm_output(4));
  mux_580_nl <= MUX_s_1_2_2(or_799_cse, or_800_cse, fsm_output(2));
  mux_581_nl <= MUX_s_1_2_2(mux_580_nl, mux_tmp_579, fsm_output(5));
  nand_89_nl <= NOT((fsm_output(3)) AND (NOT mux_581_nl));
  or_664_nl <= (NOT (fsm_output(2))) OR (fsm_output(1)) OR (fsm_output(7)) OR (NOT
      (fsm_output(6)));
  mux_578_nl <= MUX_s_1_2_2(or_tmp_639, or_664_nl, fsm_output(5));
  or_666_nl <= (fsm_output(3)) OR mux_578_nl;
  mux_582_nl <= MUX_s_1_2_2(nand_89_nl, or_666_nl, fsm_output(4));
  mux_588_nl <= MUX_s_1_2_2(mux_587_nl, mux_582_nl, fsm_output(0));
  or_678_nl <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR (fsm_output(7))
      OR (NOT (fsm_output(6)));
  mux_589_nl <= MUX_s_1_2_2(or_678_nl, or_tmp_110, fsm_output(1));
  or_676_nl <= (fsm_output(1)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(3)))
      OR (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_590_nl <= MUX_s_1_2_2(mux_589_nl, or_676_nl, fsm_output(0));
  or_689_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(3)))
      OR (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  or_688_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(7))
      OR (NOT (fsm_output(6)));
  mux_596_nl <= MUX_s_1_2_2(or_688_nl, or_tmp_110, fsm_output(1));
  mux_597_nl <= MUX_s_1_2_2(or_689_nl, mux_596_nl, fsm_output(0));
  nand_95_nl <= NOT((fsm_output(2)) AND (fsm_output(1)) AND (fsm_output(6)));
  or_704_nl <= (NOT (fsm_output(2))) OR (fsm_output(1)) OR (fsm_output(6));
  mux_604_nl <= MUX_s_1_2_2(nand_95_nl, or_704_nl, fsm_output(4));
  or_703_nl <= (NOT (fsm_output(4))) OR (fsm_output(2)) OR (NOT((fsm_output(1)) AND
      (fsm_output(6))));
  mux_605_nl <= MUX_s_1_2_2(mux_604_nl, or_703_nl, fsm_output(5));
  or_701_nl <= (NOT (fsm_output(5))) OR (fsm_output(4)) OR (NOT (fsm_output(2)))
      OR (fsm_output(1)) OR (fsm_output(6));
  mux_606_nl <= MUX_s_1_2_2(mux_605_nl, or_701_nl, fsm_output(3));
  nor_277_nl <= NOT((fsm_output(0)) OR mux_606_nl);
  nor_278_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 1)/=STD_LOGIC_VECTOR'("000110")));
  nor_279_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 1)/=STD_LOGIC_VECTOR'("010010")));
  mux_603_nl <= MUX_s_1_2_2(nor_278_nl, nor_279_nl, fsm_output(0));
  mux_607_nl <= MUX_s_1_2_2(nor_277_nl, mux_603_nl, fsm_output(7));
  or_706_nl <= (fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR (NOT
      (fsm_output(7))) OR (fsm_output(6));
  mux_608_nl <= MUX_s_1_2_2(or_tmp_108, or_tmp_522, fsm_output(1));
  mux_609_nl <= MUX_s_1_2_2(or_706_nl, mux_608_nl, fsm_output(0));
  nor_271_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(1)) OR (fsm_output(0)) OR
      (NOT (fsm_output(5))) OR (NOT (fsm_output(7))) OR (fsm_output(6)));
  or_724_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("101"));
  mux_619_nl <= MUX_s_1_2_2(or_42_cse, or_724_nl, fsm_output(0));
  mux_620_nl <= MUX_s_1_2_2(mux_619_nl, nand_93_cse, fsm_output(1));
  nor_272_nl <= NOT((fsm_output(2)) OR mux_620_nl);
  mux_621_nl <= MUX_s_1_2_2(nor_271_nl, nor_272_nl, fsm_output(3));
  mux_617_nl <= MUX_s_1_2_2(mux_295_cse, or_358_cse, fsm_output(0));
  or_722_nl <= (fsm_output(1)) OR mux_617_nl;
  or_717_nl <= (NOT (fsm_output(0))) OR (fsm_output(5)) OR (fsm_output(7)) OR (fsm_output(6));
  or_716_nl <= (fsm_output(0)) OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR (NOT
      (fsm_output(6)));
  mux_615_nl <= MUX_s_1_2_2(or_717_nl, or_716_nl, fsm_output(1));
  mux_618_nl <= MUX_s_1_2_2(or_722_nl, mux_615_nl, fsm_output(2));
  nor_273_nl <= NOT((fsm_output(3)) OR mux_618_nl);
  mux_622_nl <= MUX_s_1_2_2(mux_621_nl, nor_273_nl, fsm_output(4));
  modulo_sub_3_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_9_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_11_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_2_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_22_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_7_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_11_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_4_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_5_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_22_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_6_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_9_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_10_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_15_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_11_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_12_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_16_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_17_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_22_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_18_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_9_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_23_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_11_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_21_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_22_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  modulo_sub_22_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_9_cse_32_1(30
      DOWNTO 0))) + UNSIGNED(m_sva), 32));
  butterFly_tw_and_25_nl <= (NOT and_327_tmp) AND butterFly_12_tw_and_cse_3_2_sva_mx0c2;
  nor_388_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0011"))
      OR mux_298_cse);
  and_1130_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)=STD_LOGIC_VECTOR'("101111"));
  nor_389_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("010"))
      OR mux_298_cse);
  mux_717_nl <= MUX_s_1_2_2(and_1130_nl, nor_389_nl, fsm_output(1));
  mux_716_nl <= MUX_s_1_2_2(nor_388_nl, mux_717_nl, fsm_output(0));
  S2_INNER_LOOP1_for_mux_6_nl <= MUX_v_5_2_2(S1_OUTER_LOOP_for_acc_cse_sva, (reg_S2_COPY_LOOP_p_5_0_sva_4_0_reg
      & reg_S2_COPY_LOOP_p_5_0_sva_4_0_1_reg & reg_S2_COPY_LOOP_p_5_0_sva_4_0_2_reg),
      mux_716_nl);
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(S2_INNER_LOOP1_for_mux_6_nl),
      6) + UNSIGNED'( "000001"), 6));
  not_1682_nl <= NOT not_tmp_388;
  S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl <= MUX_v_15_2_2(STD_LOGIC_VECTOR'("000000000000000"),
      (S1_OUTER_LOOP_for_p_sva_1(14 DOWNTO 0)), not_1682_nl);
  not_1683_nl <= NOT not_tmp_388;
  S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"),
      (S2_COPY_LOOP_for_i_5_0_sva_1_4_0(4 DOWNTO 2)), not_1683_nl);
  S1_OUTER_LOOP_for_mux_14_nl <= MUX_v_2_2_2((S2_COPY_LOOP_for_i_5_0_sva_1_4_0(1
      DOWNTO 0)), S2_INNER_LOOP1_r_4_2_sva_1_0, not_tmp_388);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_2_nl
      & S1_OUTER_LOOP_for_S1_OUTER_LOOP_for_and_3_nl & S1_OUTER_LOOP_for_mux_14_nl)
      + UNSIGNED'( "00000000000000000001"), 20));
  and_1136_nl <= and_dcpl_33 AND and_dcpl_82 AND and_473_cse AND and_dcpl_62;
  mult_3_if_mult_3_if_mux_1_nl <= MUX_v_32_2_2(mult_3_res_sva, acc_14_cse_32_1, and_1136_nl);
  acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_3_if_mult_3_if_mux_1_nl
      & '1') + UNSIGNED((NOT m_sva) & '1'), 33));
  z_out_5 <= acc_4_nl(32 DOWNTO 1);
  and_1137_nl <= and_dcpl_27 AND and_506_cse AND and_473_cse AND and_dcpl_23;
  mult_if_mult_if_mux_1_nl <= MUX_v_32_2_2(mult_3_res_sva, acc_15_cse_32_1, and_1137_nl);
  acc_5_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_if_mult_if_mux_1_nl &
      '1') + UNSIGNED((NOT m_sva) & '1'), 33));
  z_out_6 <= acc_5_nl(32 DOWNTO 1);
  and_1138_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("10010101"));
  modulo_add_3_qif_mux_2_nl <= MUX_v_32_2_2(acc_15_cse_32_1, acc_16_cse_32_1, and_1138_nl);
  acc_6_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_3_qif_mux_2_nl &
      '1') + UNSIGNED((NOT m_sva) & '1'), 33));
  z_out_7 <= acc_6_nl(32 DOWNTO 1);
  and_1139_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("10010111"));
  modulo_add_16_qif_mux_2_nl <= MUX_v_32_2_2(acc_14_cse_32_1, acc_19_cse_32_1, and_1139_nl);
  acc_7_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_16_qif_mux_2_nl
      & '1') + UNSIGNED((NOT m_sva) & '1'), 33));
  z_out_8 <= acc_7_nl(32 DOWNTO 1);
  acc_8_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva & '1')
      + UNSIGNED((NOT reg_mult_3_res_lpi_4_dfm_cse) & '1'), 33));
  acc_8_cse_32_1 <= acc_8_nl(32 DOWNTO 1);
  acc_9_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva & '1')
      + UNSIGNED((NOT reg_mult_3_res_lpi_4_dfm_cse) & '1'), 33));
  acc_9_cse_32_1 <= acc_9_nl(32 DOWNTO 1);
  z_out_11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_8_cse_32_1(30 DOWNTO
      0))) + UNSIGNED(m_sva), 32));
  acc_11_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva & '1')
      + UNSIGNED((NOT reg_mult_res_lpi_4_dfm_cse_1) & '1'), 33));
  acc_11_cse_32_1 <= acc_11_nl(32 DOWNTO 1);
  acc_14_cse_32_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_10_f1_sva)
      + UNSIGNED(reg_mult_3_res_lpi_4_dfm_cse), 32));
  acc_15_cse_32_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_14_f1_sva)
      + UNSIGNED(reg_mult_3_res_lpi_4_dfm_cse), 32));
  acc_16_cse_32_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_15_f1_sva)
      + UNSIGNED(reg_mult_res_lpi_4_dfm_cse_1), 32));
  z_out_18 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_22_cse_32_1(30 DOWNTO
      0))) + UNSIGNED(m_sva), 32));
  z_out_19 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_9_cse_32_1(30 DOWNTO
      0))) + UNSIGNED(m_sva), 32));
  acc_19_cse_32_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva)
      + UNSIGNED(reg_mult_res_lpi_4_dfm_cse_1), 32));
  and_1140_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("01111101"));
  modulo_add_9_qif_mux_2_nl <= MUX_v_32_2_2(acc_16_cse_32_1, acc_19_cse_32_1, and_1140_nl);
  acc_20_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_9_qif_mux_2_nl
      & '1') + UNSIGNED((NOT m_sva) & '1'), 33));
  z_out_21 <= acc_20_nl(32 DOWNTO 1);
  z_out_22 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (acc_11_cse_32_1(30 DOWNTO
      0))) + UNSIGNED(m_sva), 32));
  acc_22_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_11_f1_sva & '1')
      + UNSIGNED((NOT reg_mult_res_lpi_4_dfm_cse_1) & '1'), 33));
  acc_22_cse_32_1 <= acc_22_nl(32 DOWNTO 1);
  acc_29_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_3_res_sva & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT m_sva) & '1'), 33), 34), 34));
  acc_29_cse_33 <= acc_29_nl(33);
END v5;

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

ARCHITECTURE v5 OF hybrid IS
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
  SIGNAL S34_OUTER_LOOP_for_tf_mul_cmp_a : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL S34_OUTER_LOOP_for_tf_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
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
      S34_OUTER_LOOP_for_tf_mul_cmp_a : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
      S34_OUTER_LOOP_for_tf_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      S34_OUTER_LOOP_for_tf_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
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
  SIGNAL hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_a : STD_LOGIC_VECTOR (19
      DOWNTO 0);
  SIGNAL hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_b : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z : STD_LOGIC_VECTOR (31
      DOWNTO 0);

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
  hybrid_core_inst_S34_OUTER_LOOP_for_tf_mul_cmp_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(SIGNED'(
      SIGNED(S34_OUTER_LOOP_for_tf_mul_cmp_a) * SIGNED(S34_OUTER_LOOP_for_tf_mul_cmp_b)),
      32));

END v5;



