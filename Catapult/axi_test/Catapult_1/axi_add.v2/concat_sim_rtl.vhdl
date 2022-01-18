
--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_in_wait_v1.vhd 
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

PACKAGE ccs_sync_in_wait_pkg_v1 IS

COMPONENT ccs_sync_in_wait_v1 
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    rdy : OUT   std_logic;
    vld : IN    std_logic;
    irdy : IN    std_logic;
    ivld : OUT   std_logic
  );
END COMPONENT;

END ccs_sync_in_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_sync_in_wait_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    rdy : OUT   std_logic;
    vld : IN    std_logic;
    irdy : IN    std_logic;
    ivld : OUT   std_logic
  );
END ccs_sync_in_wait_v1;

ARCHITECTURE beh OF ccs_sync_in_wait_v1 IS
BEGIN
   rdy <= irdy;
   ivld <= vld;
END beh; 

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


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master_read_core.vhd 
--//////////////////////////////////////////////////////////////////////////////
-- Catapult Synthesis - Custom Interfaces
--
-- Copyright (c) 2018 Mentor Graphics Corp.
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
-- DESIGN UNIT:        ccs_axi4_master_read_core
--
-- DESCRIPTION:
--   This model implements the read channel(s) of AXI-4 Master memory interface for use in 
--   Interface Synthesis in Catapult. The model has the following behavior:
--
--   The AXI bus has priority over the Catapult block when writing to
--   the internal memory.
--
--   AXI Base address and burst size configured dynamically through input pins
--
--   Limitations listed in the datasheet
--
--   Addressing and burst sizes discussed in the _core component
--
-- CHANGE LOG:
--   05/16/2019 - Added timeout feature and port
--   04/02/2019 - Renamed to _core
--   01/28/2019 - Refactored read and write channel behaviors
-- --------------------------------------------------------------------------

LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;       
  -- USE ieee.std_logic_arith.all;
  -- USE ieee.std_logic_unsigned.all;
  -- USE ieee.STD_LOGIC_UNSIGNED.CONV_INTEGER;

  USE std.textio.all;
  USE ieee.std_logic_textio.all;
  USE ieee.math_real.all;


USE work.amba_comps.all;

ENTITY ccs_axi4_master_read_core IS
    GENERIC(
      rscid           : integer                 := 1;     -- Resource ID
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
      m_rburst  : IN   std_logic_vector(31 downto 0);                   -- Read Burst length (constant 0 for now, future enhancement driven by operator)
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic                                        -- The component is idle. The next clk can be suppressed
    );

END ccs_axi4_master_read_core;

ARCHITECTURE rtl of ccs_axi4_master_read_core IS
  -- Signals for current and next state values
  TYPE   read_state_t  IS (axi4r_idle, axi4r_read, axi4r_wait_ack, axi4r_reburst);
  SIGNAL read_state       : read_state_t;

  TYPE   mem_t         IS ARRAY (255 downto 0) of std_logic_vector(cwidth-1 downto 0);
  SIGNAL data_buf_rd      : mem_t;

  -- In/out connections and constant outputs  
  SIGNAL ARADDR_reg  : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL ARVALID_reg : std_logic;
  SIGNAL ARLEN_reg   : std_logic_vector(7 downto 0);
  
  SIGNAL RREADY_reg  : std_logic;

  SIGNAL  m_din_reg   : std_logic_vector(cwidth-1 downto 0);
  SIGNAL  m_rrdy_reg  : std_logic;    

  SIGNAL catReadIdle  : std_logic;    
  
  -- Offset into AXI space from Catapult space
  SIGNAL base_addr     : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL timeoutMax    : std_logic_vector(31 downto 0) := x"00000000";
  
  SIGNAL Rburst_in    : std_logic_vector(8 downto 0);
  SIGNAL Rburst_out   : std_logic_vector(8 downto 0);
  SIGNAL Rburst_used  : integer;  
  SIGNAL LastRburst_used  : integer;  
  SIGNAL Rstart_addr  : std_logic_vector(addr_w-1 downto 0);
  SIGNAL Rflushing    : std_logic;
  SIGNAL ROutOfOrder  : std_logic;
  SIGNAL ROutOfOrderAsync  : std_logic;
  
  SIGNAL crBurstSize : std_logic_vector(31 downto 0);
  SIGNAL addrShift : integer;

  SIGNAL int_ARESETn: std_logic;
  
  function adjustReadBeats (startAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
                            inBeats   : std_logic_vector(31 downto 0))
    return std_logic_vector is
  
    variable endAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable tmpAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);

    variable bigMask : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable smallMask : std_logic_vector(ADDR_WIDTH-1 downto 0);

    variable addr13Mask : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable retVal : std_logic_vector(7 downto 0);
  
  begin
    if (ADDR_WIDTH <= 12) then
      retVal := inBeats(7 downto 0);
    else
      bigMask := (others => '0');
      bigMask(ADDR_WIDTH-1 downto 12) := (others => '1');
      smallMask := (others => '1');
      smallMask(ADDR_WIDTH-1 downto 12) := (others => '0');
      endAddr := std_logic_vector(resize(unsigned(startAddr) + (unsigned(inBeats) * (DATA_WIDTH/8)), ADDR_WIDTH));
      
      if ((startAddr and bigMask) /= (endAddr and bigMask)) then
        -- Crosses 4k boundary
        addr13Mask := (others => '0');
        addr13Mask(12) := '1';
        tmpAddr := std_logic_vector(resize(unsigned(addr13Mask) - unsigned(startAddr and smallMask), ADDR_WIDTH));
        tmpAddr := std_logic_vector( resize(unsigned( unsigned(tmpAddr) / (DATA_WIDTH/8)) - 1, ADDR_WIDTH));
        retVal := tmpAddr(7 downto 0);
      else
        retVal := inBeats(7 downto 0);
      end if;
    end if;   
    return retVal;
  end function adjustReadBeats;

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
  -- pragma translate_off
  -- error checks.  Keep consistent with ccs_axi4_master_write.v
  -- all data widths the same
  errChk: process
  variable nBytes : std_logic_vector(31 downto 0);
  variable nBytes2 : std_logic_vector(31 downto 0);
  variable bigNum : unsigned(63 downto 0);
  begin  -- process errChk
    nBytes := std_logic_vector(to_unsigned(DATA_WIDTH/8, 32));
    -- Catapult width must be <= AXI data width
    if (cwidth > DATA_WIDTH) then
      report  "Catapult(cwidth=" & integer'image(cwidth) & ") cannot be greater than AXI(DATA_BUS="
      & integer'image(DATA_WIDTH) & ")."
        severity error;
    end if;
    -- Data width #bits is byte-based
    if ( (DATA_WIDTH mod 8) /= 0) then
      report  "Data bus width(DATA_WIDTH=" & integer'image(DATA_WIDTH) & ") not a discrete number of bytes."
        severity error;
    end if;
    -- And #bytes is >=1
    if (to_integer(unsigned(nBytes)) = 0) then 
      report  "Data bus width(DATA_WIDTH=" & integer'image(DATA_WIDTH) & ") must be at least 1 byte."
        severity error;
    end if;
    -- Must also be power-of-2 #bytes
    nBytes2 := std_logic_vector(to_unsigned((DATA_WIDTH/8) - 1, 32));
    nBytes2 := nBytes  and nBytes2;
    if ( to_integer(unsigned(nBytes2)) /= 0) then
      report  "Data bus width must be power-of-2 number of bytes(DATA_WIDTH/8=" & integer'image(DATA_WIDTH/8) & ")"
        severity error;
    end if;
    --  Slaves must support 4K bytes at least
    if (ADDR_WIDTH < 12) then
      report  "AXI bus address width(ADDR_WIDTH=" & integer'image(ADDR_WIDTH) & ") must be at least 12 to address 4K memory space."
        severity error;
    end if;

    --bigNum := to_unsigned(2**ADDR_WIDTH, 64);
    --if ((base_addr_mode = 0) and (to_unsigned(BASE_ADDRESS,64) >= bigNum)) then 
    --  report "AXI BASE_ADDRESS(" & slv2hex(BASE_ADDRESS) & ") exceeds what ADDR_WIDTH("
    --    & integer'image(ADDR_WIDTH) & ") allows.  Max #Bytes="  & slv2hex(std_logic_vector(bigNum)) & "."
    --    severity error;
    --end if;     
  
    wait;
  end process errChk;
  -- pragma translate_on

  int_ARESETn <= ARESETn when (rst_ph = 0) else (not ARESETn);
  
  base_addr   <= cfgBaseAddress;
  crBurstSize <= cfgBurstSize;

  -- We dont really do any timeout processing now.  We just read the whole
  -- axi burst then let catapult read it when they want.  Out of order processing
  -- handles all the issues
  timeoutMax <= x"FFFFFFFF" when (cfgTimeout = x"00000000")
                else cfgTimeout;
  
  addrShift <= 0 when (DATA_WIDTH/8 <= 1)   else 
               1 when (DATA_WIDTH/8 <= 2)   else
               2 when (DATA_WIDTH/8 <= 4)   else
               3 when (DATA_WIDTH/8 <= 8)   else
               4 when (DATA_WIDTH/8 <= 16)  else
               5 when (DATA_WIDTH/8 <= 32)  else
               6 when (DATA_WIDTH/8 <= 64)  else
               7 when (DATA_WIDTH/8 <= 128) else 0;

  -- Read address
  ARADDR <= ARADDR_reg;
  ARVALID <= ARVALID_reg;
  ARLEN <= ARLEN_reg;

  ARSIZE <= AXI4_AxSIZE_128_BYTE when (DATA_WIDTH >= 1024) else  
            AXI4_AxSIZE_064_BYTE when (DATA_WIDTH >= 512)  else 
            AXI4_AxSIZE_032_BYTE when (DATA_WIDTH >= 256)  else 
            AXI4_AxSIZE_016_BYTE when (DATA_WIDTH >= 128)  else 
            AXI4_AxSIZE_008_BYTE when (DATA_WIDTH >=  64)  else 
            AXI4_AxSIZE_004_BYTE when (DATA_WIDTH >=  32)  else 
            AXI4_AxSIZE_002_BYTE when (DATA_WIDTH >=  16)  else AXI4_AxSIZE_001_BYTE;
  
  ARID <= (others => '0');
  ARBURST <= AXI4_AxBURST_INCR;
  ARLOCK  <= AXI4_AxLOCK_NORMAL;
  ARCACHE <=  AXI4_ARCACHE_NORM_NCB;
  ARPROT(0)<= AXI4_AxPROT_b0_UNPRIV;
  ARPROT(1) <= AXI4_AxPROT_b1_SECURE;
  ARPROT(2) <= AXI4_AxPROT_b2_DATA;
  ARQOS <= AXI4_AxQOS_NONE;
  ARREGION <= "0000";
  ARUSER <= (others => '0');

  -- Read data
  RREADY <=  RREADY_reg;

  -- Catapult ifc
  m_din <= m_din_reg;
  m_rrdy <= '1' when ((m_rrdy_reg = '1') and (ROutOfOrder = '0') and (Rflushing = '0'))
            else '0';

  catReadIdle  <= '1' when (read_state    = axi4r_idle) and (m_re /= '1')       else '0';
  is_idle <= '1' when (catReadIdle = '1') and (int_ARESETn = '1')
             else '0';

   ROutOfOrderAsync <=  '1' when ((m_re = '1') and
                                (m_rrdy_reg = '1') and
                                (int_ARESETn = '1') and
                                ((read_state = axi4r_read) or (read_state = axi4r_wait_ack) or (read_state = axi4r_reburst)) and 
                                (to_integer(unsigned(ARLEN_reg)) /= 0) and
                                (to_integer(unsigned(extCatAddr(m_raddr)))+1 /= to_integer(unsigned(extCatAddr(Rstart_addr)))+LastRburst_used))
                      else '0';

  ROutOfOrder <= '1' when (Rflushing = '1') or
                          ( ROutOfOrderAsync = '1') else '0';

  -- Catapult read cycle processing
  catread :process(ACLK, int_ARESETn)
    --variable buf : line;
    variable RtmpAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
  begin
    if (int_ARESETn = '0') then 
      read_state <= axi4r_idle;
      ARVALID_reg <= '0';
      ARLEN_reg <= (others => '0');
      RREADY_reg <= '0';
      m_rrdy_reg <= '0';
      Rburst_in <= (others => '0');
      Rburst_out <= (others => '0');
      Rburst_used <= 0;
      LastRburst_used <= 0;
      Rstart_addr <= (others => '0');
      Rflushing <= '0';        
      --ARADDR_reg <= (others => 'X');
      ARADDR_reg <= (others => '0');
      m_din_reg <= (others => '0');
    elsif rising_edge(ACLK) then
      --write(buf, string'("T="));
      --write(buf, now);
      --writeline(output, buf);
      --write(buf, string'("  ARLEN_reg="));
      --write(buf, slv2bin(ARLEN_reg));
      --writeline(output, buf);
      --write(buf, string'("  m_raddr="));
      --write(buf, slv2bin(m_raddr));
      --writeline(output, buf);
      --write(buf, string'("  Rstart_addr="));        
      --write(buf, slv2bin(Rstart_addr));
      --writeline(output, buf);
      --write(buf, string'("  Rburst_in="));        
      --write(buf, slv2bin(Rburst_in));
      --writeline(output, buf);
      --write(buf, string'("  Rburst_out="));        
      --write(buf, slv2bin(Rburst_out));
      --writeline(output, buf);
      if (read_state = axi4r_wait_ack) then
        --  We sent data - need to see re to know it was received
        if (m_re = '1') then
          read_state <= axi4r_idle;
          m_rrdy_reg <= '0';
          LastRburst_used <= 0;
        else
          if (ROutOfOrder = '1') then
            Rflushing <= '1';
          end if; 
        end if;
      elsif ((read_state = axi4r_idle) and (m_re /= '1')) then 
        m_rrdy_reg <= '0';   
      elsif (((read_state = axi4r_idle) and (m_re = '1')) or (read_state = axi4r_reburst)) then 
        m_rrdy_reg <= '0';
        if (read_state = axi4r_reburst) then
          RtmpAddr := std_logic_vector(resize(unsigned(base_addr) + unsigned(shift_left(unsigned(unsigned(extCatAddr(Rstart_addr))+Rburst_used), addrShift)), ADDR_WIDTH));
          ARADDR_reg <= RtmpAddr;
          if ((unsigned(crBurstSize) - Rburst_used) > 255) then
            ARLEN_reg <= adjustReadBeats(RtmpAddr, std_logic_vector(to_unsigned(255, 32)));
          else
            ARLEN_reg <= adjustReadBeats(RtmpAddr, std_logic_vector(unsigned(crBurstSize) - Rburst_used));
          end if;
        else
          RtmpAddr := std_logic_vector(resize(unsigned(base_addr) + unsigned(shift_left(unsigned(extCatAddr(m_raddr)), addrShift)), ADDR_WIDTH));
          ARADDR_reg <= RtmpAddr;
          Rstart_addr <= m_raddr;
          if ((unsigned(crBurstSize) - Rburst_used) > 255) then 
            ARLEN_reg <= adjustReadBeats(RtmpAddr, std_logic_vector(to_unsigned(255, 32)));
          else 
            ARLEN_reg <= adjustReadBeats(RtmpAddr, std_logic_vector(unsigned(crBurstSize) - Rburst_used));
          end if;
        end if;
        ARVALID_reg <= '1';
        RREADY_reg <= '1';
        read_state <= axi4r_read;
        Rburst_in <= (others => '0');
        Rburst_out <= (others => '0');
        Rflushing <= '0';
      elsif (read_state = axi4r_read) then
        if (ROutOfOrder = '1') then
          Rflushing <= '1';
        end if; 
        if (ARREADY = '1') then
          --ARADDR_reg <= (others => 'X');
          ARVALID_reg <= '0';        
        end if;
        if (RVALID = '1') then
          data_buf_rd(to_integer(unsigned(Rburst_in))) <= RDATA(cwidth-1 downto 0);
          Rburst_in <= std_logic_vector(unsigned(Rburst_in) + 1);
          if (RLAST = '1') then
            RREADY_reg <= '0';
          end if;
        end if;
        
        if (m_re = '1') then -- only burst-mode is conditional on m_re
          if (Rburst_in = Rburst_out) then
            if (RVALID = '1') then
              if (ROutOfOrder = '1') then
                --m_din_reg <= (others => 'X');
                m_rrdy_reg <= '0';
              else
                m_din_reg <= RDATA(cwidth-1 downto 0);
                m_rrdy_reg <= '1';
              end if;
              Rburst_out <= std_logic_vector(unsigned(Rburst_out) + 1);
              Rburst_used <= Rburst_used + 1;
              LastRburst_used <= LastRburst_used + 1;
              if ((RLAST = '1') and (unsigned(ARLEN_reg) = unsigned(Rburst_out))) then
                if ((ROutOfOrder = '1') or (Rburst_used >= unsigned(crBurstSize))) then
                  if (ROutOfOrder = '0') then
                    read_state <= axi4r_wait_ack;
                  else
                    read_state <= axi4r_idle;
                    LastRburst_used <= 0;
                  end if;
                  Rburst_used <= 0;
                else
                  read_state <= axi4r_reburst;
                end if;
              end if;
            else
              --m_din_reg <= (others => 'X');
              m_rrdy_reg <= '0';
            end if;
          elsif (unsigned(Rburst_out) < unsigned(Rburst_in)) then
            if (ROutOfOrder = '1') then
              --m_din_reg <= (others => 'X');
              m_rrdy_reg <= '0';
            else
              m_din_reg <= data_buf_rd(to_integer(unsigned(Rburst_out)));
              m_rrdy_reg <= '1';
            end if;
            Rburst_out <= std_logic_vector(unsigned(Rburst_out) + 1);
            Rburst_used <= Rburst_used + 1;
            LastRburst_used <= LastRburst_used + 1;
            if (((RLAST = '1') or (RREADY_reg = '0')) and (unsigned(ARLEN_reg) = unsigned(Rburst_out))) then
              if ((ROutOfOrder = '1') or (Rburst_used >= unsigned(crBurstSize))) then
                if ((unsigned(ARLEN_reg) = 0) or (ROutOfOrder = '1')) then
                  read_state <= axi4r_idle;
                  LastRburst_used <= 0;
                else
                  read_state <= axi4r_wait_ack;
                end if;
                Rburst_used <= 0;
              else 
                read_state <= axi4r_reburst;
              end if;
            end if;
          else
            --m_din_reg <= (others => 'X');
            m_rrdy_reg <= '0';
          end if;
        end if;
        -- Look for an error and make sure no deadlock...
        if ((RRESP = AXI4_xRESP_SLVERR) or (RRESP = AXI4_xRESP_DECERR )) then
          -- have to finish the burst....
        end if;
      end if; 
    end if;   
  end process;  -- catread process
  
END rtl;


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master_write_core.vhd 
--//////////////////////////////////////////////////////////////////////////////
-- Catapult Synthesis - Custom Interfaces
--
-- Copyright (c) 2018 Mentor Graphics Corp.
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
-- DESIGN UNIT:        ccs_axi4_master_write_core
--
-- DESCRIPTION:
--   This model implements the write channel(s) of an AXI-4 Master memory interface for use in 
--   Interface Synthesis in Catapult. The model has the following behavior:
--
--   The AXI bus has priority over the Catapult block when writing to
--   the internal memory.
--
--   AXI Base address and burst size configured dynamically through input pins
--
--   Limitations listed in the datasheet
--
--   Addressing and burst sizes discussed in the _core component
--
-- CHANGE LOG:
--   05/16/2019 - Added timeout feature and port
--   04/02/2019 - Renamed to _core
--   01/28/2019 - Refactored read and write channel behaviors
-- --------------------------------------------------------------------------

LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;       
  -- USE ieee.std_logic_arith.all;
  -- USE ieee.std_logic_unsigned.all;
  -- USE ieee.STD_LOGIC_UNSIGNED.CONV_INTEGER;

  USE std.textio.all;
  USE ieee.std_logic_textio.all;
  USE ieee.math_real.all;


USE work.amba_comps.all;

ENTITY ccs_axi4_master_write_core IS
    GENERIC(
      rscid           : integer;                           -- Resource ID
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
      REGION_MAP_SIZE : integer range 1 to 15   := 1;     -- AXI4 Region Map (ignored in this model)
      xburstsize      : integer                 := 0;     -- Burst size for scverify transactor
      xBASE_ADDRESS   : integer                 := 0;     -- Base address for scverify transactor
      xBASE_ADDRESSU  : integer                 := 0      -- Upper word for 64-bit Base address for scverify transactor

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
      m_wburst  : IN   std_logic_vector(31 downto 0);                   -- Write Burst length (constant 0 for now, future enhancement driven by operator)
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp : OUT  std_logic;                                     -- wburst_in == wburst_out
      m_wstate    : OUT  std_logic_vector(2 downto 0)                   -- write_state of master
    );

END ccs_axi4_master_write_core;

ARCHITECTURE rtl of ccs_axi4_master_write_core IS
  -- Signals for current and next state values
  TYPE   write_state_t IS (axi4w_idle, axi4w_write, axi4w_write_a0, axi4w_write_a1, axi4w_write_a2, axi4w_write_a3, axi4w_write_bad, axi4w_reburst);

  SIGNAL write_state      : write_state_t;

  TYPE   mem_t         IS ARRAY (255 downto 0) of std_logic_vector(cwidth-1 downto 0);
  SIGNAL data_buf_wr      : mem_t;

  -- In/out connections and constant outputs  
  SIGNAL AWADDR_reg  : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL AWVALID_reg : std_logic;
  SIGNAL AWLEN_reg   : std_logic_vector(7 downto 0);
  
  SIGNAL WDATA_reg   : std_logic_vector(DATA_WIDTH-1 downto 0);
  SIGNAL WSTRB_reg   : std_logic_vector((DATA_WIDTH/8)-1 downto 0);
  SIGNAL WLAST_reg   : std_logic;
  SIGNAL WVALID_reg  : std_logic;
  
  SIGNAL BREADY_reg  : std_logic;

  SIGNAL  m_wrdy_reg  : std_logic;

  SIGNAL catWriteIdle : std_logic;    
  
  -- Offset into AXI space from Catapult space
  SIGNAL base_addr     : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL timeoutMax    : std_logic_vector(31 downto 0) := x"00000000";
  SIGNAL timeoutCnt    : std_logic_vector(31 downto 0) := x"00000000";

  SIGNAL Wburst_in        : std_logic_vector(8 downto 0);
  SIGNAL Wburst_out       : std_logic_vector(8 downto 0);
  SIGNAL Wburst_outTotal  : integer;
  SIGNAL Wburst_used      : integer;
  SIGNAL Wstart_addr      : std_logic_vector(addr_w-1 downto 0);
  SIGNAL WnotOOO_addr     : std_logic_vector(addr_w-1 downto 0);
  SIGNAL Wflushing        : std_logic;
  SIGNAL WOutOfOrder      : std_logic;
  SIGNAL WOutOfOrderAsync : std_logic;
  SIGNAL WTimedOut        : std_logic;
  SIGNAL m_we_int         : std_logic;
  SIGNAL m_waddr_int      : std_logic_vector(addr_w-1 downto 0);

  SIGNAL cwBurstSize : std_logic_vector(31 downto 0);
  SIGNAL addrShift : integer;

  SIGNAL int_ARESETn: std_logic;

  function adjustWriteBeats (startAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
                             inBeats   : std_logic_vector(31 downto 0))
    return std_logic_vector is
  
    variable endAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable tmpAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);

    variable bigMask : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable smallMask : std_logic_vector(ADDR_WIDTH-1 downto 0);

    variable addr13Mask : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable retVal     : std_logic_vector(7 downto 0);
  
  begin
    if (ADDR_WIDTH <= 12) then
      retVal := inBeats(7 downto 0);
    else
      bigMask := (others => '0');
      bigMask(ADDR_WIDTH-1 downto 12) := (others => '1');
      smallMask := (others => '1');
      smallMask(ADDR_WIDTH-1 downto 12) := (others => '0');
      endAddr := std_logic_vector(resize(unsigned(startAddr) + (unsigned(inBeats) * (DATA_WIDTH/8)), ADDR_WIDTH));
      if ((startAddr and bigMask) /= (endAddr and bigMask)) then
        -- Crosses 4k boundary
        addr13Mask := (others => '0');
        addr13Mask(12) := '1';
        tmpAddr := std_logic_vector(resize(unsigned(addr13Mask) - unsigned(startAddr and smallMask), ADDR_WIDTH));
        tmpAddr := std_logic_vector( resize(unsigned( unsigned(tmpAddr) / (DATA_WIDTH/8)) - 1, ADDR_WIDTH));
        retVal := tmpAddr(7 downto 0);
      else
        retVal := inBeats(7 downto 0);
      end if;
    end if;   
    return retVal;
  end function adjustWriteBeats;

-- catapult address sizes are smaller and cause problems used with axi address sizes
  function extCatAddr(catAddr : std_logic_vector(addr_w -1 downto 0))
    return std_logic_vector is
  
    variable axiAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
  
  begin
    axiAddr := (others => '0');
    axiAddr(addr_w -1 downto 0) := catAddr;
    return axiAddr;
  end function extCatAddr;


  function wstate2slv(wstate : write_state_t)
    return std_logic_vector is
    variable  wVal : std_logic_vector(2 downto 0);
    
  begin
    wVal := (others => '0');
    if    (wstate = axi4w_idle) then
      wVal := "000";
    elsif (wstate = axi4w_write) then
      wVal := "001";
    elsif (wstate = axi4w_write_a0) then
      wVal := "010";
    elsif (wstate = axi4w_write_a1) then
      wVal := "011";
    elsif (wstate = axi4w_write_a2) then
      wVal := "100";
    elsif (wstate = axi4w_write_a3) then
      wVal := "101";
    elsif (wstate = axi4w_write_bad) then
      wVal := "110";
    elsif (wstate = axi4w_reburst) then
      wVal := "111";
    else
      wVal := "110";
    end if;
    return wVal;
  end function wstate2slv;

BEGIN
  
  -- pragma translate_off
  -- error checks.  Keep consistent with ccs_axi4_master_core.v
  -- all data widths the same
  errChk: process
  variable nBytes : std_logic_vector(31 downto 0);
  variable nBytes2 : std_logic_vector(31 downto 0);
  variable bigNum : unsigned(63 downto 0);
  begin  -- process errChk
    nBytes := std_logic_vector(to_unsigned(DATA_WIDTH/8, 32));
    -- Catapult width must be <= AXI data width
    if (cwidth > DATA_WIDTH) then
      report  "Catapult(cwidth=" & integer'image(cwidth) & ") cannot be greater than AXI(DATA_BUS="
      & integer'image(DATA_WIDTH) & ")."
        severity error;
    end if;
    -- Data width #bits is byte-based
    if ( (DATA_WIDTH mod 8) /= 0) then
      report  "Data bus width(DATA_WIDTH=" & integer'image(DATA_WIDTH) & ") not a discrete number of bytes."
        severity error;
    end if;
    -- And #bytes is >=1
    if (to_integer(unsigned(nBytes)) = 0) then 
      report  "Data bus width(DATA_WIDTH=" & integer'image(DATA_WIDTH) & ") must be at least 1 byte."
        severity error;
    end if;
    -- Must also be power-of-2 #bytes
    nBytes2 := std_logic_vector(to_unsigned((DATA_WIDTH/8) - 1, 32));
    nBytes2 := nBytes  and nBytes2;
    if ( to_integer(unsigned(nBytes2)) /= 0) then
      report  "Data bus width must be power-of-2 number of bytes(DATA_WIDTH/8=" & integer'image(DATA_WIDTH/8) & ")"
        severity error;
    end if;
    --  Slaves must support 4K bytes at least
    if (ADDR_WIDTH < 12) then
      report  "AXI bus address width(ADDR_WIDTH=" & integer'image(ADDR_WIDTH) & ") must be at least 12 to address 4K memory space."
        severity error;
    end if;

    --bigNum := to_unsigned(2**ADDR_WIDTH, 64);
    --if ((base_addr_mode = 0) and (to_unsigned(BASE_ADDRESS,64) >= bigNum)) then 
    --  report "AXI BASE_ADDRESS(" & slv2hex(BASE_ADDRESS) & ") exceeds what ADDR_WIDTH("
    --    & integer'image(ADDR_WIDTH) & ") allows.  Max #Bytes="  & slv2hex(std_logic_vector(bigNum)) & "."
    --    severity error;
    --end if;     
  
    wait;
  end process errChk;
  -- pragma translate_on
  
  int_ARESETn <= ARESETn when (rst_ph = 0) else (not ARESETn);
  base_addr   <= cfgBaseAddress;
  cwBurstSize <= cfgBurstSize;
  timeoutMax <= x"FFFFFFFF" when (cfgTimeout = x"00000000")
                else cfgTimeout;

  addrShift <= 0 when (DATA_WIDTH/8 <= 1)   else 
               1 when (DATA_WIDTH/8 <= 2)   else
               2 when (DATA_WIDTH/8 <= 4)   else
               3 when (DATA_WIDTH/8 <= 8)   else
               4 when (DATA_WIDTH/8 <= 16)  else
               5 when (DATA_WIDTH/8 <= 32)  else
               6 when (DATA_WIDTH/8 <= 64)  else
               7 when (DATA_WIDTH/8 <= 128) else 0;

  -- Write Address
  AWADDR <= AWADDR_reg;
  AWVALID <= AWVALID_reg;
  AWLEN <= AWLEN_reg;
  AWSIZE <= AXI4_AxSIZE_128_BYTE when (DATA_WIDTH >= 1024) else  
            AXI4_AxSIZE_064_BYTE when (DATA_WIDTH >= 512)  else 
            AXI4_AxSIZE_032_BYTE when (DATA_WIDTH >= 256)  else 
            AXI4_AxSIZE_016_BYTE when (DATA_WIDTH >= 128)  else 
            AXI4_AxSIZE_008_BYTE when (DATA_WIDTH >=  64)  else 
            AXI4_AxSIZE_004_BYTE when (DATA_WIDTH >=  32)  else 
            AXI4_AxSIZE_002_BYTE when (DATA_WIDTH >=  16)  else AXI4_AxSIZE_001_BYTE;

  AWID <= (others => '0');
  AWBURST <= AXI4_AxBURST_INCR;
  AWLOCK  <= AXI4_AxLOCK_NORMAL;
  AWCACHE <= AXI4_AWCACHE_NORM_NCB;
  AWPROT(0) <= AXI4_AxPROT_b0_UNPRIV;
  AWPROT(1) <= AXI4_AxPROT_b1_SECURE;
  AWPROT(2) <= AXI4_AxPROT_b2_DATA;
  AWQOS <= AXI4_AxQOS_NONE;
  AWREGION <= "0000";
  AWUSER <= (others => '0');
  
  -- Write data
  WDATA <= WDATA_reg;
  WSTRB <= WSTRB_reg;
  WLAST <= WLAST_reg;
  WVALID <= WVALID_reg;
  
  WUSER <= (others => '0');
  
  -- Write response
  BREADY <= BREADY_reg;   

  -- Catapult ifc
  m_wrdy <= '1' when ((m_wrdy_reg = '1') and (WOutOfOrder = '0') and (Wflushing = '0'))
            else '0';

  catWriteIdle <= '1' when (write_state   = axi4w_idle) and (m_we_int /= '1')       else '0';

  is_idle <= '1' when (catWriteIdle = '1') and (int_ARESETn = '1')
             else '0';

  -- transactor interface
  m_wCaughtUp <= '1' when (Wburst_in = Wburst_out)  else '0';
  m_wstate <= wstate2slv(write_state);

    
  WOutOfOrderAsync <=  '1' when ((m_we_int = '1') and
                                 (m_wrdy_reg = '1') and
                                 (int_ARESETn = '1') and
                                 ((write_state = axi4w_write) or (write_state = axi4w_reburst))and
                                 (to_integer(unsigned(AWLEN_reg)) /= 0) and
                                 (to_integer(unsigned(extCatAddr(m_waddr_int))) /= to_integer(unsigned(extCatAddr(Wstart_addr)))+Wburst_used))
                       else '0';

  WTimedOut <= '1' when (unsigned(timeoutCnt) > unsigned(timeoutMax))
              else '0';

  m_we_int    <= '1' when (WTimedOut = '1') else m_we;
  m_waddr_int <= (others => '0') when (WTimedOut = '1') else m_waddr;
                 
  WOutOfOrder <= '1' when (Wflushing = '1') or
                          (WTimedOut = '1') or 
                          ( WOutOfOrderAsync = '1') else '0';
  

--    Catapult write processing 
  catwrite : process(ACLK,  int_ARESETn)
    --variable buf : line;
    variable WtmpAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
    variable wTempLen : std_logic_vector(7 downto 0);
  begin
    if (int_ARESETn = '0') then
      write_state <= axi4w_idle;
      AWVALID_reg <= '0';
      AWLEN_reg <= (others => '0');
      WLAST_reg <= '0';         
      WVALID_reg <= '0';
      BREADY_reg <= '0';         
      m_wrdy_reg <= '1';
      Wburst_in <= (others => '0');
      Wburst_out <= (others => '0');
      Wburst_outTotal <= 0;
      Wburst_used <= 0;
      Wstart_addr <= (others => '0');
      WnotOOO_addr <= (others => '0');
      Wflushing <= '0';
      WSTRB_reg <= (others => '1');
      AWADDR_reg <= (others => '0');
      WDATA_reg <= (others => '0');
      timeoutCnt <= (others => '0');
      --AWADDR_reg <= (others => 'X');
      --WDATA_reg <= (others => 'X');
    elsif rising_edge(ACLK) then
      --write(buf, string'("T="));
      --write(buf, now);
      --writeline(output, buf);
      --write(buf, string'("  AWLEN_reg="));
      --write(buf, slv2bin(AWLEN_reg));
      --writeline(output, buf);
      --write(buf, string'("  m_waddr_int="));
      --write(buf, slv2bin(m_waddr_int));
      --writeline(output, buf);
      --write(buf, string'("  Wstart_addr="));        
      --write(buf, slv2bin(Wstart_addr));
      --writeline(output, buf);
      --write(buf, string'("  Wburst_in="));        
      --write(buf, slv2bin(Wburst_in));
      --writeline(output, buf);
      --write(buf, string'("  Wburst_out="));        
      --write(buf, slv2bin(Wburst_out));
      --writeline(output, buf);
      if ((write_state = axi4w_idle) and (m_we_int = '0')) then
        --write(buf, string'("In write IDLE state.  flushing="));
        --write(buf,  Wflushing);
        --write(buf, string'(" T="));
        --write(buf, now);
        --writeline(output, buf);
        timeoutCnt <= (others => '0');
        if (Wflushing = '0') then
          m_wrdy_reg <= '1';
        end if;
      elsif ((write_state = axi4w_reburst) and (m_we_int = '1')) then
        timeoutCnt <= (others => '0');
        write_state <= axi4w_write;
        WtmpAddr := std_logic_vector(resize(unsigned(base_addr) + unsigned(shift_left(unsigned(unsigned(extCatAddr(Wstart_addr))+Wburst_used), addrShift)), ADDR_WIDTH));
        AWADDR_reg <= WtmpAddr;
        AWVALID_reg <= '1';
        if ((unsigned(cwBurstSize) - Wburst_used) > 255) then
          wTempLen := adjustWriteBeats(WtmpAddr, std_logic_vector(to_unsigned(255, 32)));
        else
          wTempLen := adjustWriteBeats(WtmpAddr,  std_logic_vector((unsigned(cwBurstSize) - Wburst_used)));
        end if;
        AWLEN_reg <= wTempLen;
        if (unsigned(wTempLen) = 0) then
          m_wrdy_reg <= '0';
          WLAST_reg <= '1';
        else
          WLAST_reg <= '0';
        end if;
        WDATA_reg <= std_logic_vector(resize(unsigned(m_dout), WDATA_reg'length));
        WVALID_reg <= '1';            
        BREADY_reg <= '1';
        Wburst_in  <= B"000000001";
        Wburst_out <= B"000000001";
        Wburst_outTotal <= Wburst_outTotal + 1;
        Wburst_used <=  Wburst_used + 1;
        data_buf_wr(0) <= m_dout;
        write_state <= axi4w_write;
        WnotOOO_addr <= m_waddr_int;
        --write(buf, string'("In write REBURST state.  Len="));
        --write(buf,  to_integer(unsigned(wTempLen)));
        --write(buf, string'("  StartAddr="));
        --write(buf,  slv2hex(WtmpAddr));      
        --write(buf, string'(" T="));
        --write(buf, now);
        --writeline(output, buf);
      elsif ((write_state = axi4w_idle) and (m_we_int = '1')) then
        timeoutCnt <= (others => '0');
        write_state <= axi4w_write;
        WtmpAddr := std_logic_vector(resize(unsigned(base_addr) + unsigned(shift_left(unsigned(extCatAddr(m_waddr_int)), addrShift)), ADDR_WIDTH));
        AWADDR_reg <= WtmpAddr;
        Wstart_addr <= m_waddr_int;
        WnotOOO_addr <= m_waddr_int;
        AWVALID_reg <= '1';        
        if (unsigned(cwBurstSize) > 255) then
          wTempLen := adjustWriteBeats(WtmpAddr, std_logic_vector(to_unsigned(255, 32)));
        else
          wTempLen := adjustWriteBeats(WtmpAddr, cwBurstSize);
        end if;
        AWLEN_reg <= wTempLen;
        if (unsigned(wTempLen) = 0) then
          m_wrdy_reg <= '0';
          WLAST_reg <= '1';
        else
          WLAST_reg <= '0';
        end if;
        WDATA_reg <= std_logic_vector(resize(unsigned(m_dout), WDATA_reg'length));
        WVALID_reg <= '1';
        BREADY_reg <= '1';
        Wburst_in  <= B"000000001";
        Wburst_out <= B"000000001";
        Wburst_outTotal <= 1;
        Wburst_used <= 1;
        Wflushing <= '0';
        WSTRB_reg <= (others => '1');
        data_buf_wr(0) <= m_dout;
        --write(buf, string'("In write IDLE state2. Addr="));
        --write(buf,  slv2hex(WtmpAddr));
        --write(buf, string'(" CatAddr="));
        --write(buf,  slv2bin(m_waddr_int));
        --write(buf, string'(" shift="));
        --write(buf,  addrShift);
        --write(buf, string'(" Len="));
        --write(buf,  to_integer(unsigned(wTempLen)));
        --write(buf, string'(" Data="));
        --write(buf,  slv2hex(m_dout));
        --write(buf, string'(" T="));
        --write(buf, now);
        --writeline(output, buf);
      elsif (write_state = axi4w_write) then
        --write(buf, string'("In write WRITE state.  burst_in="));
        --write(buf,  to_integer(unsigned(Wburst_in)));
        --write(buf, string'("  burst_out="));
        --write(buf, to_integer(unsigned(Wburst_out)));
        --write(buf, string'("  burst_used="));
        --write(buf, Wburst_used);
        --write(buf, string'("  OOO="));
        --write(buf, WOutOfOrder);
        --write(buf, string'("  WSTRB="));
        --write(buf, slv2bin(WSTRB_reg));
        --write(buf, string'(" T="));
        --write(buf, now);        
        --writeline(output, buf);
        if (m_we = '1') then  -- We really look at external m_we here
          timeoutCnt <= (others => '0'); 
        else
          timeoutCnt <= std_logic_vector(unsigned(timeoutCnt) + 1);
        end if;

        if (WOutOfOrder = '1') then
          Wflushing <= '1';
          if ((WREADY = '1') and (unsigned(extCatAddr(WnotOOO_addr)) < (unsigned(extCatAddr(Wstart_addr))+Wburst_outTotal))) then
            WSTRB_reg <= (others => '0');
          end if;
        elsif (m_we_int = '1') then
          WnotOOO_addr <= m_waddr_int;
        end if;
        
        if (AWREADY = '1') then
          --AWADDR_reg <= (others => 'X');
          AWVALID_reg <= '0';
        end if;

        if ((unsigned(AWLEN_reg) > 0) and (m_we_int = '1') and (unsigned(Wburst_in) <= unsigned(AWLEN_reg)))  then
          data_buf_wr(to_integer(unsigned(Wburst_in))) <= m_dout;
          --write(buf, string'("Que up data("));
          --write(buf,  to_integer(unsigned(Wburst_in)));
          --write(buf, string'(")="));
          --write(buf, string'(slv2hex(m_dout)));
          --writeline(output, buf);
          
          if (unsigned(Wburst_in) = unsigned(AWLEN_reg)) then
            m_wrdy_reg <= '0';
          else
            m_wrdy_reg <= '1';
          end if;
          Wburst_in <= std_logic_vector(unsigned(Wburst_in)+1);
          Wburst_used <=  Wburst_used + 1;
        end if;
        
        if (WREADY = '1') then
          --write(buf, string'("Seen WREADY"));
          --write(buf, string'(" burst_in="));
          --write(buf,  to_integer(unsigned(Wburst_in)));
          --write(buf, string'("  burst_out="));
          --write(buf, to_integer(unsigned(Wburst_out)));
          --writeline(output, buf);

          if (Wburst_out = Wburst_in) then
            if (unsigned(Wburst_out) > unsigned(AWLEN_reg)) then  -- len is 0-based
              WVALID_reg <= '0';
              --WDATA_reg <= (others => 'X');
              WLAST_reg <= '0';
              --write(buf, string'("Finished burst"));
              --writeline(output, buf);
            else
              if (m_we_int = '1') then
                WVALID_reg <= '1';                        
                --write(buf, string'("Continue burst"));
                --writeline(output, buf);
                if ((WOutOfOrder = '1') and (unsigned(extCatAddr(WnotOOO_addr)) < (unsigned(extCatAddr(Wstart_addr))+Wburst_outTotal))) then
                  --WDATA_reg  <= (others => 'X');
                  --write(buf, string'(" OOO"));
                else
                  WDATA_reg <= std_logic_vector(resize(unsigned(m_dout), WDATA_reg'length));
                  --write(buf, string'(" Data="));
                  --write(buf, string'(slv2hex(m_dout)));
                end if;
                
                if (unsigned(Wburst_out) = unsigned(AWLEN_reg)) then
                  WLAST_reg <= '1';
                  --write(buf, string'(" LAST"));
                else
                  WLAST_reg <= '0';         
                  --write(buf, string'(" NOT LAST"));
                end if;
                if (unsigned(AWLEN_reg) = 0) then
                  Wburst_in <= std_logic_vector(unsigned(Wburst_in) + 1);
                  Wburst_used <=  Wburst_used + 1;
                end if;
                Wburst_out <= std_logic_vector(unsigned(Wburst_out) + 1);
                Wburst_outTotal <= Wburst_outTotal + 1;
                --writeline(output, buf);
              else
                WVALID_reg <= '0';                        
                --WDATA_reg <= (others => 'X');
                WLAST_reg <= '0';
                --write(buf, string'("Empty que"));
                --writeline(output, buf);
              end if;
            end if;
          elsif (unsigned(Wburst_out) < unsigned(Wburst_in)) then
            WVALID_reg <= '1';
            --write(buf, string'("Use Que data("));
            --write(buf,  to_integer(unsigned(Wburst_out)));
            --write(buf, string'(")="));
            --write(buf, string'(slv2hex(data_buf_wr(to_integer(unsigned(Wburst_out))))));
            --writeline(output, buf);
            if ((WOutOfOrder = '1') and (unsigned(extCatAddr(WnotOOO_addr)) < (unsigned(extCatAddr(Wstart_addr))+Wburst_outTotal))) then
              --WDATA_reg  <= (others => 'X');
              --write(buf, string'(" OOO"));
              --writeline(output, buf);              
            else
              WDATA_reg <= std_logic_vector(resize(unsigned(data_buf_wr(to_integer(unsigned(Wburst_out)))), WDATA_reg'length));
            end if;

            if (unsigned(Wburst_out) = unsigned(AWLEN_reg)) then
              WLAST_reg <= '1';         
              --write(buf, string'(" LAST"));
              --writeline(output, buf);              
            else
              WLAST_reg <= '0';         
              --write(buf, string'(" NOT LAST"));
              --writeline(output, buf);              
            end if;
            Wburst_out <= std_logic_vector(unsigned(Wburst_out)+1);
            Wburst_outTotal <= Wburst_outTotal + 1;
          else
            WVALID_reg <= '0';                  
            --WDATA_reg <= (others => 'X');
          end if;
        end if;
        -- Look for an error and make sure no deadlock...
        if (BVALID = '1') then               
          if ((BRESP = AXI4_xRESP_SLVERR) or (BRESP = AXI4_xRESP_DECERR )) then
            -- but need to finish the axi burst
          end if;
          if ((Wburst_used <= unsigned(cwBurstSize)) and (WOutOfOrder = '0')) then
            write_state <= axi4w_reburst;               
          else
            write_state <= axi4w_idle;               
          end if;
          timeoutCnt <= (others => '0');           
          Wflushing <= '0';
          m_wrdy_reg <= '1';
          BREADY_reg <= '0';
        end if;
      else
        timeoutCnt <= (others => '0');
      end if; 
    end if;   
  end process;     -- catwrite

END rtl;


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master_core.vhd 
--//////////////////////////////////////////////////////////////////////////////
-- Catapult Synthesis - Custom Interfaces
--
-- Copyright (c) 2018 Mentor Graphics Corp.
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
-- DESIGN UNIT:        ccs_axi4_master_core
--
-- DESCRIPTION:
--   This model implements an AXI-4 Master memory interface for use in 
--   Interface Synthesis in Catapult. Burst sizes and base address are
--   configured dynamically through input ports which are externalized
--   to be driven at the external system level.
--
--   Implements AXI-4 Master
--     limitations:  (see comments section of the verilog ccs_axi4_master_core.v)
--
--
-- CHANGE LOG:
--   05/16/2019 - Added timeout feature and port
--   04/02/2019 - Change read/write to read_core and write_core
--   01/29/2019 - Add read/write base address options.  Create separate read/write channel components
--   01/20/2019 - Refactored into 3 components
--   06/20/2018 -Initial implementation
--
-- --------------------------------------------------------------------------

LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;       
  -- USE ieee.std_logic_arith.all;
  -- USE ieee.std_logic_unsigned.all;
  -- USE ieee.STD_LOGIC_UNSIGNED.CONV_INTEGER;

  USE std.textio.all;
  USE ieee.std_logic_textio.all;
  USE ieee.math_real.all;


USE work.amba_comps.all;

ENTITY ccs_axi4_master_core IS
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
      ID_WIDTH        : integer range 1 to 16   := 1;      -- AXI4 ID field width (ignored in this model)
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
      m_wburst  : IN   std_logic_vector(31 downto 0);                   -- Write Burst length (constant 0 for now, future enhancement driven by operator)
      m_rburst  : IN   std_logic_vector(31 downto 0);                   -- Read Burst length (constant 0 for now, future enhancement driven by operator)
      m_din     : OUT  std_logic_vector(cwidth-1 downto 0);             -- Data into catapult block through this interface (read request)
      m_dout    : IN   std_logic_vector(cwidth-1 downto 0);             -- Data out to bus from catapult (write request)
      m_wrdy    : OUT  std_logic;                                       -- Bus memory ready for write access by Catapult (1=ready)
      m_rrdy    : OUT  std_logic;                                       -- Bus memory ready for read access by Catapult (1=ready)
      is_idle   : OUT  std_logic;                                       -- The component is idle. The next clk can be suppressed
      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp : OUT  std_logic;                                     -- wburst_in == wburst_out
      m_wstate    : OUT  std_logic_vector(2 downto 0)                   -- write_state of master
    );

END ccs_axi4_master_core;

ARCHITECTURE rtl of ccs_axi4_master_core IS
  SIGNAL read_is_idle     : std_logic;
  SIGNAL write_is_idle    : std_logic;

BEGIN
  is_idle <= '1' when (read_is_idle = '1') and (write_is_idle = '1') else '0';

    -- Instantiate ccs_axi4_master_read|write
  MASTER_READ: entity work.ccs_axi4_master_read_core
    GENERIC MAP (
      rscid           => rscid,
      depth           => depth,
      op_width        => op_width,
      cwidth          => cwidth,
      addr_w          => addr_w,
      rst_ph          => rst_ph,
      ADDR_WIDTH      => ADDR_WIDTH,
      DATA_WIDTH      => DATA_WIDTH,
      ID_WIDTH        => ID_WIDTH,
      USER_WIDTH      => USER_WIDTH,
      REGION_MAP_SIZE => REGION_MAP_SIZE
    )
    PORT MAP (
      ACLK       => ACLK,
      ARESETn    => ARESETn,

      -- ============== AXI4 Read Address Channel Signals
      ARID       => ARID,
      ARADDR     => ARADDR,
      ARLEN      => ARLEN,
      ARSIZE     => ARSIZE,
      ARBURST    => ARBURST,
      ARLOCK     => ARLOCK,
      ARCACHE    => ARCACHE,
      ARPROT     => ARPROT,
      ARQOS      => ARQOS,
      ARREGION   => ARREGION,
      ARUSER     => ARUSER,
      ARVALID    => ARVALID,
      ARREADY    => ARREADY,

      -- ============== AXI4 Read Data Channel Signals
      RID        => RID,
      RDATA      => RDATA,
      RRESP      => RRESP,
      RLAST      => RLAST,
      RUSER      => RUSER,
      RVALID     => RVALID,
      RREADY     => RREADY,

      -- Configuration Interface 
      cfgBaseAddress => cfgrBaseAddress,
      cfgBurstSize  => cfgrBurstSize,
      cfgTimeout => cfgTimeout,
      
      -- Catapult interface
      m_re      => m_re,
      m_raddr   => m_raddr,
      m_rburst  => m_rburst,
      m_din     => m_din,
      m_rrdy    => m_rrdy,
      is_idle   => read_is_idle
    );

  MASTER_WRITE: entity work.ccs_axi4_master_write_core
    GENERIC MAP (
      rscid           => rscid,
      depth           => depth,
      op_width        => op_width,
      cwidth          => cwidth,
      addr_w          => addr_w,
      rst_ph          => rst_ph,
      ADDR_WIDTH      => ADDR_WIDTH,
      DATA_WIDTH      => DATA_WIDTH,
      ID_WIDTH        => ID_WIDTH,
      USER_WIDTH      => USER_WIDTH,
      REGION_MAP_SIZE => REGION_MAP_SIZE
    )
    PORT MAP (
      ACLK       => ACLK,
      ARESETn    => ARESETn,

      -- ============== AXI4 Write Address Channel Signals
      AWID       => AWID,
      AWADDR     => AWADDR,
      AWLEN      => AWLEN,
      AWSIZE     => AWSIZE,
      AWBURST    => AWBURST,
      AWLOCK     => AWLOCK,
      AWCACHE    => AWCACHE,
      AWPROT     => AWPROT,
      AWQOS      => AWQOS,
      AWREGION   => AWREGION,
      AWUSER     => AWUSER,
      AWVALID    => AWVALID,
      AWREADY    => AWREADY,

      -- ============== AXI4 Write Data Channel
      WDATA      => WDATA,
      WSTRB      => WSTRB,
      WLAST      => WLAST,
      WUSER      => WUSER,
      WVALID     => WVALID,
      WREADY     => WREADY,

      -- ============== AXI4 Write Response Channel Signals
      BID        => BID,
      BRESP      => BRESP,
      BUSER      => BUSER,
      BVALID     => BVALID,
      BREADY     => BREADY,

      -- Configuration Interface (from slave or direct wired)
      cfgBaseAddress => cfgwBaseAddress,
      cfgBurstSize  => cfgwBurstSize,
      cfgTimeout => cfgTimeout,

      -- Catapult interface
      m_we      => m_we,
      m_waddr   => m_waddr,
      m_wburst  => m_wburst,
      m_dout    => m_dout,
      m_wrdy    => m_wrdy,
      is_idle   => write_is_idle,

      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp => m_wCaughtUp,
      m_wstate    => m_wstate
    );
  
  
END rtl;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_libs/interfaces/amba/ccs_axi4_master.vhd 
--//////////////////////////////////////////////////////////////////////////////
-- Catapult Synthesis - Custom Interfaces
--
-- Copyright (c) 2018 Mentor Graphics Corp.
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
--
-- DESIGN UNIT:        ccs_axi4_master
--
-- DESCRIPTION:
--   This model implements an AXI-4 Master memory interface for use in 
--   Interface Synthesis in Catapult.  Burst sizes and base address
--   configured with generics at compile-time
--
-- CHANGE LOG:
--   05/16/2019 - Added timeout feature and port
--   01/29/2019 - Add read/write base address options
--   01/20/2019 - Refactored into 3 components
--   06/20/2018 - Initial implementation
--
-- --------------------------------------------------------------------------

LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;       
  -- USE ieee.std_logic_arith.all;
  -- USE ieee.std_logic_unsigned.all;
  -- USE ieee.STD_LOGIC_UNSIGNED.CONV_INTEGER;

  USE std.textio.all;
  USE ieee.std_logic_textio.all;
  USE ieee.math_real.all;


USE work.amba_comps.all;

ENTITY ccs_axi4_master IS
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
      rBASE_ADDRESS    : integer                := 0;      -- AXI4 read channel base addressable
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
END ccs_axi4_master;

ARCHITECTURE rtl of ccs_axi4_master IS

  SIGNAL cfgwBaseAddress : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL cfgrBaseAddress : std_logic_vector(ADDR_WIDTH-1 downto 0);
  SIGNAL cfgwBurstSize   : std_logic_vector(31 downto 0);
  SIGNAL cfgrBurstSize   : std_logic_vector(31 downto 0);
  SIGNAL cfgTimeout      : std_logic_vector(31 downto 0);
  SIGNAL tmpAddr         : std_logic_vector(63 downto 0);
  SIGNAL tmpAddr2        : std_logic_vector(63 downto 0);
  
BEGIN
  tmpAddr <= std_logic_vector(to_unsigned(wBASE_ADDRESSU,32)) & std_logic_vector(to_unsigned(wBASE_ADDRESS,32));
  cfgwBaseAddress <= tmpAddr(ADDR_WIDTH-1 downto 0);

  tmpAddr2 <= std_logic_vector(to_unsigned(rBASE_ADDRESSU,32)) & std_logic_vector(to_unsigned(rBASE_ADDRESS,32));
  cfgrBaseAddress <= tmpAddr2(ADDR_WIDTH-1 downto 0);

  cfgwBurstSize  <= std_logic_vector(to_unsigned(wburstsize,    cfgwBurstSize'length));
  cfgrBurstSize  <= std_logic_vector(to_unsigned(rburstsize,    cfgrBurstSize'length));
  cfgTimeout <= std_logic_vector(to_unsigned(timeout,    cfgTimeout'length));
  
  -- Instantiate ccs_axi4_master_core
  MASTER_CORE: entity work.ccs_axi4_master_core
    GENERIC MAP (
      rscid           => rscid,
      depth           => depth,
      op_width        => op_width,
      cwidth          => cwidth,
      addr_w          => addr_w,
      rst_ph          => rst_ph,
      ADDR_WIDTH      => ADDR_WIDTH,
      DATA_WIDTH      => DATA_WIDTH,
      ID_WIDTH        => ID_WIDTH,
      USER_WIDTH      => USER_WIDTH,
      REGION_MAP_SIZE => REGION_MAP_SIZE
    )
    PORT MAP (
      ACLK       => ACLK,
      ARESETn    => ARESETn,
      -- ============== AXI4 Write Address Channel Signals
      AWID       => AWID,
      AWADDR     => AWADDR,
      AWLEN      => AWLEN,
      AWSIZE     => AWSIZE,
      AWBURST    => AWBURST,
      AWLOCK     => AWLOCK,
      AWCACHE    => AWCACHE,
      AWPROT     => AWPROT,
      AWQOS      => AWQOS,
      AWREGION   => AWREGION,
      AWUSER     => AWUSER,
      AWVALID    => AWVALID,
      AWREADY    => AWREADY,
      -- ============== AXI4 Write Data Channel
      WDATA      => WDATA,
      WSTRB      => WSTRB,
      WLAST      => WLAST,
      WUSER      => WUSER,
      WVALID     => WVALID,
      WREADY     => WREADY,
      -- ============== AXI4 Write Response Channel Signals
      BID        => BID,
      BRESP      => BRESP,
      BUSER      => BUSER,
      BVALID     => BVALID,
      BREADY     => BREADY,
      -- ============== AXI4 Read Address Channel Signals
      ARID       => ARID,
      ARADDR     => ARADDR,
      ARLEN      => ARLEN,
      ARSIZE     => ARSIZE,
      ARBURST    => ARBURST,
      ARLOCK     => ARLOCK,
      ARCACHE    => ARCACHE,
      ARPROT     => ARPROT,
      ARQOS      => ARQOS,
      ARREGION   => ARREGION,
      ARUSER     => ARUSER,
      ARVALID    => ARVALID,
      ARREADY    => ARREADY,
      -- ============== AXI4 Read Data Channel Signals
      RID        => RID,
      RDATA      => RDATA,
      RRESP      => RRESP,
      RLAST      => RLAST,
      RUSER      => RUSER,
      RVALID     => RVALID,
      RREADY     => RREADY,
      -- Configuration Interface (from slave or direct wired)
      cfgwBaseAddress => cfgwBaseAddress,
      cfgrBaseAddress => cfgrBaseAddress,
      cfgwBurstSize  => cfgwBurstSize,
      cfgrBurstSize  => cfgrBurstSize,
      cfgTimeout => cfgTimeout,
      -- Catapult interface
      m_re      => m_re,
      m_we      => m_we,
      m_waddr   => m_waddr,
      m_raddr   => m_raddr,
      m_wburst  => m_wburst,
      m_rburst  => m_rburst,
      m_din     => m_din,
      m_dout    => m_dout,
      m_wrdy    => m_wrdy,
      m_rrdy    => m_rrdy,
      is_idle   => is_idle,
      -- Transactor resource interface (for SCVerify simulation only)
      m_wCaughtUp => m_wCaughtUp,
      m_wstate    => m_wstate
    );

END rtl;


--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_out_wait_v1.vhd 
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

PACKAGE ccs_sync_out_wait_pkg_v1 IS

COMPONENT ccs_sync_out_wait_v1
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ivld : IN    std_logic;
    irdy : OUT   std_logic;
    vld : OUT   std_logic;
    rdy : IN    std_logic
  );
END COMPONENT;

END ccs_sync_out_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_sync_out_wait_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ivld : IN    std_logic;
    irdy : OUT   std_logic;
    vld : OUT   std_logic;
    rdy : IN    std_logic
  );
END ccs_sync_out_wait_v1;

ARCHITECTURE beh OF ccs_sync_out_wait_v1 IS
BEGIN
   irdy <= rdy;
   vld <= ivld;
END beh; 

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


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Sun Jan  2 17:33:09 2022
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    main_C_0_tr0 : IN STD_LOGIC;
    ADD_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END axi_add_core_core_fsm;

ARCHITECTURE v2 OF axi_add_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for axi_add_core_core_fsm_1
  TYPE axi_add_core_core_fsm_1_ST IS (core_rlp_C_0, main_C_0, ADD_LOOP_C_0, ADD_LOOP_C_1,
      main_C_1, main_C_2);

  SIGNAL state_var : axi_add_core_core_fsm_1_ST;
  SIGNAL state_var_NS : axi_add_core_core_fsm_1_ST;

BEGIN
  axi_add_core_core_fsm_1 : PROCESS (main_C_0_tr0, ADD_LOOP_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010");
        IF ( main_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= ADD_LOOP_C_0;
        END IF;
      WHEN ADD_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100");
        state_var_NS <= ADD_LOOP_C_1;
      WHEN ADD_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000");
        IF ( ADD_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= ADD_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000");
        state_var_NS <= main_C_0;
      -- core_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS axi_add_core_core_fsm_1;

  axi_add_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= core_rlp_C_0;
      ELSE
        IF ( core_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS axi_add_core_core_fsm_1_REG;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : OUT STD_LOGIC;
    core_wten : OUT STD_LOGIC;
    a_rsci_wen_comp : IN STD_LOGIC;
    b_rsci_wen_comp : IN STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC
  );
END axi_add_core_staller;

ARCHITECTURE v2 OF axi_add_core_staller IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL core_wen_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  core_wen <= core_wen_drv;

  core_wen_drv <= a_rsci_wen_comp AND b_rsci_wen_comp AND complete_rsci_wen_comp;
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
--  Design Unit:    axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    b_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    b_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  b_rsc_triosy_obj_ld_core_sct <= b_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    a_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    a_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl;

ARCHITECTURE v2 OF axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  a_rsc_triosy_obj_ld_core_sct <= a_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_complete_rsci_complete_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_complete_rsci_complete_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC;
    complete_rsci_biwt : IN STD_LOGIC;
    complete_rsci_bdwt : IN STD_LOGIC;
    complete_rsci_bcwt : OUT STD_LOGIC
  );
END axi_add_core_complete_rsci_complete_wait_dp;

ARCHITECTURE v2 OF axi_add_core_complete_rsci_complete_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL complete_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  complete_rsci_bcwt <= complete_rsci_bcwt_drv;

  complete_rsci_wen_comp <= (NOT complete_rsci_oswt) OR complete_rsci_biwt OR complete_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        complete_rsci_bcwt_drv <= '0';
      ELSE
        complete_rsci_bcwt_drv <= NOT((NOT(complete_rsci_bcwt_drv OR complete_rsci_biwt))
            OR complete_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_complete_rsci_complete_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_complete_rsci_complete_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_biwt : OUT STD_LOGIC;
    complete_rsci_bdwt : OUT STD_LOGIC;
    complete_rsci_bcwt : IN STD_LOGIC;
    complete_rsci_ivld_core_sct : OUT STD_LOGIC;
    complete_rsci_irdy : IN STD_LOGIC
  );
END axi_add_core_complete_rsci_complete_wait_ctrl;

ARCHITECTURE v2 OF axi_add_core_complete_rsci_complete_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_ogwt : STD_LOGIC;

BEGIN
  complete_rsci_bdwt <= complete_rsci_oswt AND core_wen;
  complete_rsci_biwt <= complete_rsci_ogwt AND complete_rsci_irdy;
  complete_rsci_ogwt <= complete_rsci_oswt AND (NOT complete_rsci_bcwt);
  complete_rsci_ivld_core_sct <= complete_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_b_rsci_b_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_b_rsci_b_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    b_rsci_oswt : IN STD_LOGIC;
    b_rsci_biwt : OUT STD_LOGIC;
    b_rsci_bdwt : OUT STD_LOGIC;
    b_rsci_bcwt : IN STD_LOGIC;
    b_rsci_m_we_core_sct : OUT STD_LOGIC;
    b_rsci_m_wrdy : IN STD_LOGIC
  );
END axi_add_core_b_rsci_b_rsc_wait_ctrl;

ARCHITECTURE v2 OF axi_add_core_b_rsci_b_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL b_rsci_ogwt : STD_LOGIC;

BEGIN
  b_rsci_bdwt <= b_rsci_oswt AND core_wen;
  b_rsci_biwt <= b_rsci_ogwt AND b_rsci_m_wrdy;
  b_rsci_ogwt <= b_rsci_oswt AND (NOT b_rsci_bcwt);
  b_rsci_m_we_core_sct <= b_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_b_rsci_b_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_b_rsci_b_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    b_rsci_oswt : IN STD_LOGIC;
    b_rsci_wen_comp : OUT STD_LOGIC;
    b_rsci_m_waddr_core : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsci_m_dout_core : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsci_biwt : IN STD_LOGIC;
    b_rsci_bdwt : IN STD_LOGIC;
    b_rsci_bcwt : OUT STD_LOGIC;
    b_rsci_m_waddr : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsci_m_waddr_core_sct : IN STD_LOGIC;
    b_rsci_m_dout : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END axi_add_core_b_rsci_b_rsc_wait_dp;

ARCHITECTURE v2 OF axi_add_core_b_rsci_b_rsc_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL b_rsci_bcwt_drv : STD_LOGIC;

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
  b_rsci_bcwt <= b_rsci_bcwt_drv;

  b_rsci_wen_comp <= (NOT b_rsci_oswt) OR b_rsci_biwt OR b_rsci_bcwt_drv;
  b_rsci_m_waddr <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), b_rsci_m_waddr_core, b_rsci_m_waddr_core_sct);
  b_rsci_m_dout <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
      b_rsci_m_dout_core, b_rsci_m_waddr_core_sct);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_rsci_bcwt_drv <= '0';
      ELSE
        b_rsci_bcwt_drv <= NOT((NOT(b_rsci_bcwt_drv OR b_rsci_biwt)) OR b_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_a_rsci_a_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_a_rsci_a_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_rsci_oswt : IN STD_LOGIC;
    a_rsci_wen_comp : OUT STD_LOGIC;
    a_rsci_m_raddr_core : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsci_m_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsci_biwt : IN STD_LOGIC;
    a_rsci_bdwt : IN STD_LOGIC;
    a_rsci_bcwt : OUT STD_LOGIC;
    a_rsci_m_raddr : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsci_m_raddr_core_sct : IN STD_LOGIC;
    a_rsci_m_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END axi_add_core_a_rsci_a_rsc_wait_dp;

ARCHITECTURE v2 OF axi_add_core_a_rsci_a_rsc_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL a_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL a_rsci_m_din_bfwt : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  a_rsci_bcwt <= a_rsci_bcwt_drv;

  a_rsci_wen_comp <= (NOT a_rsci_oswt) OR a_rsci_biwt OR a_rsci_bcwt_drv;
  a_rsci_m_raddr <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), a_rsci_m_raddr_core, a_rsci_m_raddr_core_sct);
  a_rsci_m_din_mxwt <= MUX_v_32_2_2(a_rsci_m_din, a_rsci_m_din_bfwt, a_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        a_rsci_bcwt_drv <= '0';
      ELSE
        a_rsci_bcwt_drv <= NOT((NOT(a_rsci_bcwt_drv OR a_rsci_biwt)) OR a_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( a_rsci_biwt = '1' ) THEN
        a_rsci_m_din_bfwt <= a_rsci_m_din;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_a_rsci_a_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_a_rsci_a_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    a_rsci_oswt : IN STD_LOGIC;
    a_rsci_biwt : OUT STD_LOGIC;
    a_rsci_bdwt : OUT STD_LOGIC;
    a_rsci_bcwt : IN STD_LOGIC;
    a_rsci_m_re_core_sct : OUT STD_LOGIC;
    a_rsci_m_rrdy : IN STD_LOGIC
  );
END axi_add_core_a_rsci_a_rsc_wait_ctrl;

ARCHITECTURE v2 OF axi_add_core_a_rsci_a_rsc_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL a_rsci_ogwt : STD_LOGIC;

BEGIN
  a_rsci_bdwt <= a_rsci_oswt AND core_wen;
  a_rsci_biwt <= a_rsci_ogwt AND a_rsci_m_rrdy;
  a_rsci_ogwt <= a_rsci_oswt AND (NOT a_rsci_bcwt);
  a_rsci_m_re_core_sct <= a_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_run_rsci_run_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_run_rsci_run_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsci_ivld_mxwt : OUT STD_LOGIC;
    run_rsci_ivld : IN STD_LOGIC;
    run_rsci_biwt : IN STD_LOGIC;
    run_rsci_bdwt : IN STD_LOGIC
  );
END axi_add_core_run_rsci_run_wait_dp;

ARCHITECTURE v2 OF axi_add_core_run_rsci_run_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_rsci_bcwt : STD_LOGIC;
  SIGNAL run_rsci_ivld_bfwt : STD_LOGIC;

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

BEGIN
  run_rsci_ivld_mxwt <= MUX_s_1_2_2(run_rsci_ivld, run_rsci_ivld_bfwt, run_rsci_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_rsci_bcwt <= '0';
      ELSE
        run_rsci_bcwt <= NOT((NOT(run_rsci_bcwt OR run_rsci_biwt)) OR run_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( run_rsci_biwt = '1' ) THEN
        run_rsci_ivld_bfwt <= run_rsci_ivld;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_run_rsci_run_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_run_rsci_run_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    run_rsci_oswt : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    run_rsci_biwt : OUT STD_LOGIC;
    run_rsci_bdwt : OUT STD_LOGIC
  );
END axi_add_core_run_rsci_run_wait_ctrl;

ARCHITECTURE v2 OF axi_add_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_b_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_b_rsc_triosy_obj IS
  PORT(
    b_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    b_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END axi_add_core_b_rsc_triosy_obj;

ARCHITECTURE v2 OF axi_add_core_b_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL b_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      b_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      b_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  b_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => b_rsc_triosy_obj_ld_core_sct,
      lz => b_rsc_triosy_lz
    );
  axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl_inst : axi_add_core_b_rsc_triosy_obj_b_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      b_rsc_triosy_obj_iswt0 => b_rsc_triosy_obj_iswt0,
      b_rsc_triosy_obj_ld_core_sct => b_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_a_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_a_rsc_triosy_obj IS
  PORT(
    a_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    a_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END axi_add_core_a_rsc_triosy_obj;

ARCHITECTURE v2 OF axi_add_core_a_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL a_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      a_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      a_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  a_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => a_rsc_triosy_obj_ld_core_sct,
      lz => a_rsc_triosy_lz
    );
  axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl_inst : axi_add_core_a_rsc_triosy_obj_a_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      a_rsc_triosy_obj_iswt0 => a_rsc_triosy_obj_iswt0,
      a_rsc_triosy_obj_ld_core_sct => a_rsc_triosy_obj_ld_core_sct
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_complete_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_complete_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC
  );
END axi_add_core_complete_rsci;

ARCHITECTURE v2 OF axi_add_core_complete_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_biwt : STD_LOGIC;
  SIGNAL complete_rsci_bdwt : STD_LOGIC;
  SIGNAL complete_rsci_bcwt : STD_LOGIC;
  SIGNAL complete_rsci_ivld_core_sct : STD_LOGIC;
  SIGNAL complete_rsci_irdy : STD_LOGIC;

  COMPONENT axi_add_core_complete_rsci_complete_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      complete_rsci_oswt : IN STD_LOGIC;
      complete_rsci_biwt : OUT STD_LOGIC;
      complete_rsci_bdwt : OUT STD_LOGIC;
      complete_rsci_bcwt : IN STD_LOGIC;
      complete_rsci_ivld_core_sct : OUT STD_LOGIC;
      complete_rsci_irdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_complete_rsci_complete_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      complete_rsci_oswt : IN STD_LOGIC;
      complete_rsci_wen_comp : OUT STD_LOGIC;
      complete_rsci_biwt : IN STD_LOGIC;
      complete_rsci_bdwt : IN STD_LOGIC;
      complete_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  complete_rsci : work.ccs_sync_out_wait_pkg_v1.ccs_sync_out_wait_v1
    GENERIC MAP(
      rscid => 4
      )
    PORT MAP(
      vld => complete_rsc_vld,
      rdy => complete_rsc_rdy,
      ivld => complete_rsci_ivld_core_sct,
      irdy => complete_rsci_irdy
    );
  axi_add_core_complete_rsci_complete_wait_ctrl_inst : axi_add_core_complete_rsci_complete_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt,
      complete_rsci_ivld_core_sct => complete_rsci_ivld_core_sct,
      complete_rsci_irdy => complete_rsci_irdy
    );
  axi_add_core_complete_rsci_complete_wait_dp_inst : axi_add_core_complete_rsci_complete_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_b_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_b_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    b_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_m_wCaughtUp : OUT STD_LOGIC;
    b_rsc_RREADY : OUT STD_LOGIC;
    b_rsc_RVALID : IN STD_LOGIC;
    b_rsc_RUSER : IN STD_LOGIC;
    b_rsc_RLAST : IN STD_LOGIC;
    b_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_RID : IN STD_LOGIC;
    b_rsc_ARREADY : IN STD_LOGIC;
    b_rsc_ARVALID : OUT STD_LOGIC;
    b_rsc_ARUSER : OUT STD_LOGIC;
    b_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARLOCK : OUT STD_LOGIC;
    b_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    b_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_ARID : OUT STD_LOGIC;
    b_rsc_BREADY : OUT STD_LOGIC;
    b_rsc_BVALID : IN STD_LOGIC;
    b_rsc_BUSER : IN STD_LOGIC;
    b_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_BID : IN STD_LOGIC;
    b_rsc_WREADY : IN STD_LOGIC;
    b_rsc_WVALID : OUT STD_LOGIC;
    b_rsc_WUSER : OUT STD_LOGIC;
    b_rsc_WLAST : OUT STD_LOGIC;
    b_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_AWREADY : IN STD_LOGIC;
    b_rsc_AWVALID : OUT STD_LOGIC;
    b_rsc_AWUSER : OUT STD_LOGIC;
    b_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWLOCK : OUT STD_LOGIC;
    b_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    b_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_AWID : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    b_rsci_oswt : IN STD_LOGIC;
    b_rsci_wen_comp : OUT STD_LOGIC;
    b_rsci_m_waddr_core : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsci_m_dout_core : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END axi_add_core_b_rsci;

ARCHITECTURE v2 OF axi_add_core_b_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL b_rsci_biwt : STD_LOGIC;
  SIGNAL b_rsci_bdwt : STD_LOGIC;
  SIGNAL b_rsci_bcwt : STD_LOGIC;
  SIGNAL b_rsci_m_we_core_sct : STD_LOGIC;
  SIGNAL b_rsci_m_waddr : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_m_din : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_m_dout : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_m_wrdy : STD_LOGIC;
  SIGNAL b_rsci_m_rrdy : STD_LOGIC;
  SIGNAL b_rsc_is_idle : STD_LOGIC;

  SIGNAL b_rsci_AWID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_AWADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL b_rsci_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL b_rsci_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL b_rsci_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_AWUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_WUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_BID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_BUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_ARID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_ARADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL b_rsci_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL b_rsci_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL b_rsci_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_ARUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_RID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL b_rsci_RUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL b_rsci_m_waddr_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_m_raddr : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL b_rsci_m_wburst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_m_rburst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_m_din_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_m_dout_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_m_wstate : STD_LOGIC_VECTOR (2 DOWNTO 0);

  COMPONENT axi_add_core_b_rsci_b_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      b_rsci_oswt : IN STD_LOGIC;
      b_rsci_wen_comp : OUT STD_LOGIC;
      b_rsci_m_waddr_core : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsci_m_dout_core : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsci_biwt : IN STD_LOGIC;
      b_rsci_bdwt : IN STD_LOGIC;
      b_rsci_bcwt : OUT STD_LOGIC;
      b_rsci_m_waddr : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsci_m_waddr_core_sct : IN STD_LOGIC;
      b_rsci_m_dout : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_waddr_core : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_dout_core : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_waddr : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_dout : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

  COMPONENT axi_add_core_b_rsci_b_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      b_rsci_oswt : IN STD_LOGIC;
      b_rsci_biwt : OUT STD_LOGIC;
      b_rsci_bdwt : OUT STD_LOGIC;
      b_rsci_bcwt : IN STD_LOGIC;
      b_rsci_m_we_core_sct : OUT STD_LOGIC;
      b_rsci_m_wrdy : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  b_rsci : work.amba_comps.ccs_axi4_master
    GENERIC MAP(
      rscid => 0,
      depth => 16,
      op_width => 32,
      cwidth => 32,
      addr_w => 4,
      wburstsize => 0,
      rburstsize => 0,
      rst_ph => 0,
      timeout => 0,
      ADDR_WIDTH => 32,
      DATA_WIDTH => 32,
      ID_WIDTH => 1,
      USER_WIDTH => 1,
      REGION_MAP_SIZE => 1,
      wBASE_ADDRESS => 0,
      rBASE_ADDRESS => 0,
      wBASE_ADDRESSU => 0,
      rBASE_ADDRESSU => 0
      )
    PORT MAP(
      ACLK => clk,
      ARESETn => '1',
      AWID => b_rsci_AWID,
      AWADDR => b_rsci_AWADDR,
      AWLEN => b_rsci_AWLEN,
      AWSIZE => b_rsci_AWSIZE,
      AWBURST => b_rsci_AWBURST,
      AWLOCK => b_rsc_AWLOCK,
      AWCACHE => b_rsci_AWCACHE,
      AWPROT => b_rsci_AWPROT,
      AWQOS => b_rsci_AWQOS,
      AWREGION => b_rsci_AWREGION,
      AWUSER => b_rsci_AWUSER,
      AWVALID => b_rsc_AWVALID,
      AWREADY => b_rsc_AWREADY,
      WDATA => b_rsci_WDATA,
      WSTRB => b_rsci_WSTRB,
      WLAST => b_rsc_WLAST,
      WUSER => b_rsci_WUSER,
      WVALID => b_rsc_WVALID,
      WREADY => b_rsc_WREADY,
      BID => b_rsci_BID,
      BRESP => b_rsci_BRESP,
      BUSER => b_rsci_BUSER,
      BVALID => b_rsc_BVALID,
      BREADY => b_rsc_BREADY,
      ARID => b_rsci_ARID,
      ARADDR => b_rsci_ARADDR,
      ARLEN => b_rsci_ARLEN,
      ARSIZE => b_rsci_ARSIZE,
      ARBURST => b_rsci_ARBURST,
      ARLOCK => b_rsc_ARLOCK,
      ARCACHE => b_rsci_ARCACHE,
      ARPROT => b_rsci_ARPROT,
      ARQOS => b_rsci_ARQOS,
      ARREGION => b_rsci_ARREGION,
      ARUSER => b_rsci_ARUSER,
      ARVALID => b_rsc_ARVALID,
      ARREADY => b_rsc_ARREADY,
      RID => b_rsci_RID,
      RDATA => b_rsci_RDATA,
      RRESP => b_rsci_RRESP,
      RLAST => b_rsc_RLAST,
      RUSER => b_rsci_RUSER,
      RVALID => b_rsc_RVALID,
      RREADY => b_rsc_RREADY,
      m_re => '0',
      m_we => b_rsci_m_we_core_sct,
      m_waddr => b_rsci_m_waddr_1,
      m_raddr => b_rsci_m_raddr,
      m_wburst => b_rsci_m_wburst,
      m_rburst => b_rsci_m_rburst,
      m_din => b_rsci_m_din_1,
      m_dout => b_rsci_m_dout_1,
      m_wrdy => b_rsci_m_wrdy,
      m_rrdy => b_rsci_m_rrdy,
      is_idle => b_rsc_is_idle,
      m_wCaughtUp => b_rsc_m_wCaughtUp,
      m_wstate => b_rsci_m_wstate
    );
  b_rsc_AWID <= b_rsci_AWID(0);
  b_rsc_AWADDR <= b_rsci_AWADDR;
  b_rsc_AWLEN <= b_rsci_AWLEN;
  b_rsc_AWSIZE <= b_rsci_AWSIZE;
  b_rsc_AWBURST <= b_rsci_AWBURST;
  b_rsc_AWCACHE <= b_rsci_AWCACHE;
  b_rsc_AWPROT <= b_rsci_AWPROT;
  b_rsc_AWQOS <= b_rsci_AWQOS;
  b_rsc_AWREGION <= b_rsci_AWREGION;
  b_rsc_AWUSER <= b_rsci_AWUSER(0);
  b_rsc_WDATA <= b_rsci_WDATA;
  b_rsc_WSTRB <= b_rsci_WSTRB;
  b_rsc_WUSER <= b_rsci_WUSER(0);
  b_rsci_BID(0) <= b_rsc_BID;
  b_rsci_BRESP <= b_rsc_BRESP;
  b_rsci_BUSER(0) <= b_rsc_BUSER;
  b_rsc_ARID <= b_rsci_ARID(0);
  b_rsc_ARADDR <= b_rsci_ARADDR;
  b_rsc_ARLEN <= b_rsci_ARLEN;
  b_rsc_ARSIZE <= b_rsci_ARSIZE;
  b_rsc_ARBURST <= b_rsci_ARBURST;
  b_rsc_ARCACHE <= b_rsci_ARCACHE;
  b_rsc_ARPROT <= b_rsci_ARPROT;
  b_rsc_ARQOS <= b_rsci_ARQOS;
  b_rsc_ARREGION <= b_rsci_ARREGION;
  b_rsc_ARUSER <= b_rsci_ARUSER(0);
  b_rsci_RID(0) <= b_rsc_RID;
  b_rsci_RDATA <= b_rsc_RDATA;
  b_rsci_RRESP <= b_rsc_RRESP;
  b_rsci_RUSER(0) <= b_rsc_RUSER;
  b_rsci_m_waddr_1 <= b_rsci_m_waddr;
  b_rsci_m_raddr <= STD_LOGIC_VECTOR'( "0000");
  b_rsci_m_wburst <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
  b_rsci_m_rburst <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
  b_rsci_m_din <= b_rsci_m_din_1;
  b_rsci_m_dout_1 <= b_rsci_m_dout;
  b_rsc_m_wstate <= b_rsci_m_wstate;

  axi_add_core_b_rsci_b_rsc_wait_dp_inst : axi_add_core_b_rsci_b_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      b_rsci_oswt => b_rsci_oswt,
      b_rsci_wen_comp => b_rsci_wen_comp,
      b_rsci_m_waddr_core => axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_waddr_core,
      b_rsci_m_dout_core => axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_dout_core,
      b_rsci_biwt => b_rsci_biwt,
      b_rsci_bdwt => b_rsci_bdwt,
      b_rsci_bcwt => b_rsci_bcwt,
      b_rsci_m_waddr => axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_waddr,
      b_rsci_m_waddr_core_sct => b_rsci_m_we_core_sct,
      b_rsci_m_dout => axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_dout
    );
  axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_waddr_core <= b_rsci_m_waddr_core;
  axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_dout_core <= b_rsci_m_dout_core;
  b_rsci_m_waddr <= axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_waddr;
  b_rsci_m_dout <= axi_add_core_b_rsci_b_rsc_wait_dp_inst_b_rsci_m_dout;

  axi_add_core_b_rsci_b_rsc_wait_ctrl_inst : axi_add_core_b_rsci_b_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      b_rsci_oswt => b_rsci_oswt,
      b_rsci_biwt => b_rsci_biwt,
      b_rsci_bdwt => b_rsci_bdwt,
      b_rsci_bcwt => b_rsci_bcwt,
      b_rsci_m_we_core_sct => b_rsci_m_we_core_sct,
      b_rsci_m_wrdy => b_rsci_m_wrdy
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_a_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_a_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_m_wCaughtUp : OUT STD_LOGIC;
    a_rsc_RREADY : OUT STD_LOGIC;
    a_rsc_RVALID : IN STD_LOGIC;
    a_rsc_RUSER : IN STD_LOGIC;
    a_rsc_RLAST : IN STD_LOGIC;
    a_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_RID : IN STD_LOGIC;
    a_rsc_ARREADY : IN STD_LOGIC;
    a_rsc_ARVALID : OUT STD_LOGIC;
    a_rsc_ARUSER : OUT STD_LOGIC;
    a_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARLOCK : OUT STD_LOGIC;
    a_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    a_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_ARID : OUT STD_LOGIC;
    a_rsc_BREADY : OUT STD_LOGIC;
    a_rsc_BVALID : IN STD_LOGIC;
    a_rsc_BUSER : IN STD_LOGIC;
    a_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_BID : IN STD_LOGIC;
    a_rsc_WREADY : IN STD_LOGIC;
    a_rsc_WVALID : OUT STD_LOGIC;
    a_rsc_WUSER : OUT STD_LOGIC;
    a_rsc_WLAST : OUT STD_LOGIC;
    a_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_AWREADY : IN STD_LOGIC;
    a_rsc_AWVALID : OUT STD_LOGIC;
    a_rsc_AWUSER : OUT STD_LOGIC;
    a_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWLOCK : OUT STD_LOGIC;
    a_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    a_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_AWID : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    a_rsci_oswt : IN STD_LOGIC;
    a_rsci_wen_comp : OUT STD_LOGIC;
    a_rsci_m_raddr_core : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsci_m_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END axi_add_core_a_rsci;

ARCHITECTURE v2 OF axi_add_core_a_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL a_rsci_biwt : STD_LOGIC;
  SIGNAL a_rsci_bdwt : STD_LOGIC;
  SIGNAL a_rsci_bcwt : STD_LOGIC;
  SIGNAL a_rsci_m_re_core_sct : STD_LOGIC;
  SIGNAL a_rsci_m_raddr : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_m_din : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_m_wrdy : STD_LOGIC;
  SIGNAL a_rsci_m_rrdy : STD_LOGIC;
  SIGNAL a_rsc_is_idle : STD_LOGIC;

  SIGNAL a_rsci_AWID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_AWADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL a_rsci_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL a_rsci_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL a_rsci_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL a_rsci_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_AWUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_WUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_BID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL a_rsci_BUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_ARID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_ARADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL a_rsci_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL a_rsci_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL a_rsci_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL a_rsci_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_ARUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_RID : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL a_rsci_RUSER : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL a_rsci_m_waddr : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_m_raddr_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_m_wburst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_m_rburst : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_m_din_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_m_dout : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL a_rsci_m_wstate : STD_LOGIC_VECTOR (2 DOWNTO 0);

  COMPONENT axi_add_core_a_rsci_a_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      a_rsci_oswt : IN STD_LOGIC;
      a_rsci_biwt : OUT STD_LOGIC;
      a_rsci_bdwt : OUT STD_LOGIC;
      a_rsci_bcwt : IN STD_LOGIC;
      a_rsci_m_re_core_sct : OUT STD_LOGIC;
      a_rsci_m_rrdy : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_a_rsci_a_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      a_rsci_oswt : IN STD_LOGIC;
      a_rsci_wen_comp : OUT STD_LOGIC;
      a_rsci_m_raddr_core : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsci_m_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsci_biwt : IN STD_LOGIC;
      a_rsci_bdwt : IN STD_LOGIC;
      a_rsci_bcwt : OUT STD_LOGIC;
      a_rsci_m_raddr : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsci_m_raddr_core_sct : IN STD_LOGIC;
      a_rsci_m_din : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_raddr_core : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_din_mxwt : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_raddr : STD_LOGIC_VECTOR
      (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_din : STD_LOGIC_VECTOR (31
      DOWNTO 0);

BEGIN
  a_rsci : work.amba_comps.ccs_axi4_master
    GENERIC MAP(
      rscid => 0,
      depth => 16,
      op_width => 32,
      cwidth => 32,
      addr_w => 4,
      wburstsize => 0,
      rburstsize => 0,
      rst_ph => 0,
      timeout => 0,
      ADDR_WIDTH => 32,
      DATA_WIDTH => 32,
      ID_WIDTH => 1,
      USER_WIDTH => 1,
      REGION_MAP_SIZE => 1,
      wBASE_ADDRESS => 0,
      rBASE_ADDRESS => 0,
      wBASE_ADDRESSU => 0,
      rBASE_ADDRESSU => 0
      )
    PORT MAP(
      ACLK => clk,
      ARESETn => '1',
      AWID => a_rsci_AWID,
      AWADDR => a_rsci_AWADDR,
      AWLEN => a_rsci_AWLEN,
      AWSIZE => a_rsci_AWSIZE,
      AWBURST => a_rsci_AWBURST,
      AWLOCK => a_rsc_AWLOCK,
      AWCACHE => a_rsci_AWCACHE,
      AWPROT => a_rsci_AWPROT,
      AWQOS => a_rsci_AWQOS,
      AWREGION => a_rsci_AWREGION,
      AWUSER => a_rsci_AWUSER,
      AWVALID => a_rsc_AWVALID,
      AWREADY => a_rsc_AWREADY,
      WDATA => a_rsci_WDATA,
      WSTRB => a_rsci_WSTRB,
      WLAST => a_rsc_WLAST,
      WUSER => a_rsci_WUSER,
      WVALID => a_rsc_WVALID,
      WREADY => a_rsc_WREADY,
      BID => a_rsci_BID,
      BRESP => a_rsci_BRESP,
      BUSER => a_rsci_BUSER,
      BVALID => a_rsc_BVALID,
      BREADY => a_rsc_BREADY,
      ARID => a_rsci_ARID,
      ARADDR => a_rsci_ARADDR,
      ARLEN => a_rsci_ARLEN,
      ARSIZE => a_rsci_ARSIZE,
      ARBURST => a_rsci_ARBURST,
      ARLOCK => a_rsc_ARLOCK,
      ARCACHE => a_rsci_ARCACHE,
      ARPROT => a_rsci_ARPROT,
      ARQOS => a_rsci_ARQOS,
      ARREGION => a_rsci_ARREGION,
      ARUSER => a_rsci_ARUSER,
      ARVALID => a_rsc_ARVALID,
      ARREADY => a_rsc_ARREADY,
      RID => a_rsci_RID,
      RDATA => a_rsci_RDATA,
      RRESP => a_rsci_RRESP,
      RLAST => a_rsc_RLAST,
      RUSER => a_rsci_RUSER,
      RVALID => a_rsc_RVALID,
      RREADY => a_rsc_RREADY,
      m_re => a_rsci_m_re_core_sct,
      m_we => '0',
      m_waddr => a_rsci_m_waddr,
      m_raddr => a_rsci_m_raddr_1,
      m_wburst => a_rsci_m_wburst,
      m_rburst => a_rsci_m_rburst,
      m_din => a_rsci_m_din_1,
      m_dout => a_rsci_m_dout,
      m_wrdy => a_rsci_m_wrdy,
      m_rrdy => a_rsci_m_rrdy,
      is_idle => a_rsc_is_idle,
      m_wCaughtUp => a_rsc_m_wCaughtUp,
      m_wstate => a_rsci_m_wstate
    );
  a_rsc_AWID <= a_rsci_AWID(0);
  a_rsc_AWADDR <= a_rsci_AWADDR;
  a_rsc_AWLEN <= a_rsci_AWLEN;
  a_rsc_AWSIZE <= a_rsci_AWSIZE;
  a_rsc_AWBURST <= a_rsci_AWBURST;
  a_rsc_AWCACHE <= a_rsci_AWCACHE;
  a_rsc_AWPROT <= a_rsci_AWPROT;
  a_rsc_AWQOS <= a_rsci_AWQOS;
  a_rsc_AWREGION <= a_rsci_AWREGION;
  a_rsc_AWUSER <= a_rsci_AWUSER(0);
  a_rsc_WDATA <= a_rsci_WDATA;
  a_rsc_WSTRB <= a_rsci_WSTRB;
  a_rsc_WUSER <= a_rsci_WUSER(0);
  a_rsci_BID(0) <= a_rsc_BID;
  a_rsci_BRESP <= a_rsc_BRESP;
  a_rsci_BUSER(0) <= a_rsc_BUSER;
  a_rsc_ARID <= a_rsci_ARID(0);
  a_rsc_ARADDR <= a_rsci_ARADDR;
  a_rsc_ARLEN <= a_rsci_ARLEN;
  a_rsc_ARSIZE <= a_rsci_ARSIZE;
  a_rsc_ARBURST <= a_rsci_ARBURST;
  a_rsc_ARCACHE <= a_rsci_ARCACHE;
  a_rsc_ARPROT <= a_rsci_ARPROT;
  a_rsc_ARQOS <= a_rsci_ARQOS;
  a_rsc_ARREGION <= a_rsci_ARREGION;
  a_rsc_ARUSER <= a_rsci_ARUSER(0);
  a_rsci_RID(0) <= a_rsc_RID;
  a_rsci_RDATA <= a_rsc_RDATA;
  a_rsci_RRESP <= a_rsc_RRESP;
  a_rsci_RUSER(0) <= a_rsc_RUSER;
  a_rsci_m_waddr <= STD_LOGIC_VECTOR'( "0000");
  a_rsci_m_raddr_1 <= a_rsci_m_raddr;
  a_rsci_m_wburst <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
  a_rsci_m_rburst <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
  a_rsci_m_din <= a_rsci_m_din_1;
  a_rsci_m_dout <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
  a_rsc_m_wstate <= a_rsci_m_wstate;

  axi_add_core_a_rsci_a_rsc_wait_ctrl_inst : axi_add_core_a_rsci_a_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      a_rsci_oswt => a_rsci_oswt,
      a_rsci_biwt => a_rsci_biwt,
      a_rsci_bdwt => a_rsci_bdwt,
      a_rsci_bcwt => a_rsci_bcwt,
      a_rsci_m_re_core_sct => a_rsci_m_re_core_sct,
      a_rsci_m_rrdy => a_rsci_m_rrdy
    );
  axi_add_core_a_rsci_a_rsc_wait_dp_inst : axi_add_core_a_rsci_a_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      a_rsci_oswt => a_rsci_oswt,
      a_rsci_wen_comp => a_rsci_wen_comp,
      a_rsci_m_raddr_core => axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_raddr_core,
      a_rsci_m_din_mxwt => axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_din_mxwt,
      a_rsci_biwt => a_rsci_biwt,
      a_rsci_bdwt => a_rsci_bdwt,
      a_rsci_bcwt => a_rsci_bcwt,
      a_rsci_m_raddr => axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_raddr,
      a_rsci_m_raddr_core_sct => a_rsci_m_re_core_sct,
      a_rsci_m_din => axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_din
    );
  axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_raddr_core <= a_rsci_m_raddr_core;
  a_rsci_m_din_mxwt <= axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_din_mxwt;
  a_rsci_m_raddr <= axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_raddr;
  axi_add_core_a_rsci_a_rsc_wait_dp_inst_a_rsci_m_din <= a_rsci_m_din;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core_run_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core_run_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    run_rsci_oswt : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    run_rsci_ivld_mxwt : OUT STD_LOGIC
  );
END axi_add_core_run_rsci;

ARCHITECTURE v2 OF axi_add_core_run_rsci IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL run_rsci_ivld : STD_LOGIC;
  SIGNAL run_rsci_biwt : STD_LOGIC;
  SIGNAL run_rsci_bdwt : STD_LOGIC;

  COMPONENT axi_add_core_run_rsci_run_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      run_rsci_oswt : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      run_rsci_biwt : OUT STD_LOGIC;
      run_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_run_rsci_run_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_rsci_ivld_mxwt : OUT STD_LOGIC;
      run_rsci_ivld : IN STD_LOGIC;
      run_rsci_biwt : IN STD_LOGIC;
      run_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  run_rsci : work.ccs_sync_in_wait_pkg_v1.ccs_sync_in_wait_v1
    GENERIC MAP(
      rscid => 1
      )
    PORT MAP(
      vld => run_rsc_vld,
      rdy => run_rsc_rdy,
      ivld => run_rsci_ivld,
      irdy => run_rsci_biwt
    );
  axi_add_core_run_rsci_run_wait_ctrl_inst : axi_add_core_run_rsci_run_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      run_rsci_oswt => run_rsci_oswt,
      core_wten => core_wten,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
  axi_add_core_run_rsci_run_wait_dp_inst : axi_add_core_run_rsci_run_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsci_ivld_mxwt => run_rsci_ivld_mxwt,
      run_rsci_ivld => run_rsci_ivld,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    a_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_m_wCaughtUp : OUT STD_LOGIC;
    a_rsc_RREADY : OUT STD_LOGIC;
    a_rsc_RVALID : IN STD_LOGIC;
    a_rsc_RUSER : IN STD_LOGIC;
    a_rsc_RLAST : IN STD_LOGIC;
    a_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_RID : IN STD_LOGIC;
    a_rsc_ARREADY : IN STD_LOGIC;
    a_rsc_ARVALID : OUT STD_LOGIC;
    a_rsc_ARUSER : OUT STD_LOGIC;
    a_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARLOCK : OUT STD_LOGIC;
    a_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    a_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_ARID : OUT STD_LOGIC;
    a_rsc_BREADY : OUT STD_LOGIC;
    a_rsc_BVALID : IN STD_LOGIC;
    a_rsc_BUSER : IN STD_LOGIC;
    a_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_BID : IN STD_LOGIC;
    a_rsc_WREADY : IN STD_LOGIC;
    a_rsc_WVALID : OUT STD_LOGIC;
    a_rsc_WUSER : OUT STD_LOGIC;
    a_rsc_WLAST : OUT STD_LOGIC;
    a_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_AWREADY : IN STD_LOGIC;
    a_rsc_AWVALID : OUT STD_LOGIC;
    a_rsc_AWUSER : OUT STD_LOGIC;
    a_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWLOCK : OUT STD_LOGIC;
    a_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    a_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_AWID : OUT STD_LOGIC;
    a_rsc_triosy_lz : OUT STD_LOGIC;
    b_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_m_wCaughtUp : OUT STD_LOGIC;
    b_rsc_RREADY : OUT STD_LOGIC;
    b_rsc_RVALID : IN STD_LOGIC;
    b_rsc_RUSER : IN STD_LOGIC;
    b_rsc_RLAST : IN STD_LOGIC;
    b_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_RID : IN STD_LOGIC;
    b_rsc_ARREADY : IN STD_LOGIC;
    b_rsc_ARVALID : OUT STD_LOGIC;
    b_rsc_ARUSER : OUT STD_LOGIC;
    b_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARLOCK : OUT STD_LOGIC;
    b_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    b_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_ARID : OUT STD_LOGIC;
    b_rsc_BREADY : OUT STD_LOGIC;
    b_rsc_BVALID : IN STD_LOGIC;
    b_rsc_BUSER : IN STD_LOGIC;
    b_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_BID : IN STD_LOGIC;
    b_rsc_WREADY : IN STD_LOGIC;
    b_rsc_WVALID : OUT STD_LOGIC;
    b_rsc_WUSER : OUT STD_LOGIC;
    b_rsc_WLAST : OUT STD_LOGIC;
    b_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_AWREADY : IN STD_LOGIC;
    b_rsc_AWVALID : OUT STD_LOGIC;
    b_rsc_AWUSER : OUT STD_LOGIC;
    b_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWLOCK : OUT STD_LOGIC;
    b_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    b_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_AWID : OUT STD_LOGIC;
    b_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END axi_add_core;

ARCHITECTURE v2 OF axi_add_core IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL core_wen : STD_LOGIC;
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL run_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL a_rsci_wen_comp : STD_LOGIC;
  SIGNAL a_rsci_m_raddr_core : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL a_rsci_m_din_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL b_rsci_wen_comp : STD_LOGIC;
  SIGNAL b_rsci_m_waddr_core : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL complete_rsci_wen_comp : STD_LOGIC;
  SIGNAL b_rsci_m_dout_core_31_2 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL b_rsci_m_dout_core_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL ADD_LOOP_i_4_0_sva_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL run_ac_sync_tmp_dobj_sva : STD_LOGIC;
  SIGNAL reg_run_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_a_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_b_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_a_rsc_triosy_obj_iswt0_cse : STD_LOGIC;

  COMPONENT axi_add_core_run_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_rsc_rdy : OUT STD_LOGIC;
      run_rsc_vld : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      run_rsci_oswt : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      run_rsci_ivld_mxwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_a_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      a_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_m_wCaughtUp : OUT STD_LOGIC;
      a_rsc_RREADY : OUT STD_LOGIC;
      a_rsc_RVALID : IN STD_LOGIC;
      a_rsc_RUSER : IN STD_LOGIC;
      a_rsc_RLAST : IN STD_LOGIC;
      a_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      a_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsc_RID : IN STD_LOGIC;
      a_rsc_ARREADY : IN STD_LOGIC;
      a_rsc_ARVALID : OUT STD_LOGIC;
      a_rsc_ARUSER : OUT STD_LOGIC;
      a_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_ARLOCK : OUT STD_LOGIC;
      a_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      a_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      a_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsc_ARID : OUT STD_LOGIC;
      a_rsc_BREADY : OUT STD_LOGIC;
      a_rsc_BVALID : IN STD_LOGIC;
      a_rsc_BUSER : IN STD_LOGIC;
      a_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      a_rsc_BID : IN STD_LOGIC;
      a_rsc_WREADY : IN STD_LOGIC;
      a_rsc_WVALID : OUT STD_LOGIC;
      a_rsc_WUSER : OUT STD_LOGIC;
      a_rsc_WLAST : OUT STD_LOGIC;
      a_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsc_AWREADY : IN STD_LOGIC;
      a_rsc_AWVALID : OUT STD_LOGIC;
      a_rsc_AWUSER : OUT STD_LOGIC;
      a_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_AWLOCK : OUT STD_LOGIC;
      a_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      a_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      a_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsc_AWID : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      a_rsci_oswt : IN STD_LOGIC;
      a_rsci_wen_comp : OUT STD_LOGIC;
      a_rsci_m_raddr_core : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsci_m_din_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_m_wstate : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_ARADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsc_AWADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsci_m_raddr_core : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL axi_add_core_a_rsci_inst_a_rsci_m_din_mxwt : STD_LOGIC_VECTOR (31 DOWNTO
      0);

  COMPONENT axi_add_core_b_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      b_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_m_wCaughtUp : OUT STD_LOGIC;
      b_rsc_RREADY : OUT STD_LOGIC;
      b_rsc_RVALID : IN STD_LOGIC;
      b_rsc_RUSER : IN STD_LOGIC;
      b_rsc_RLAST : IN STD_LOGIC;
      b_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      b_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsc_RID : IN STD_LOGIC;
      b_rsc_ARREADY : IN STD_LOGIC;
      b_rsc_ARVALID : OUT STD_LOGIC;
      b_rsc_ARUSER : OUT STD_LOGIC;
      b_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_ARLOCK : OUT STD_LOGIC;
      b_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      b_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      b_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsc_ARID : OUT STD_LOGIC;
      b_rsc_BREADY : OUT STD_LOGIC;
      b_rsc_BVALID : IN STD_LOGIC;
      b_rsc_BUSER : IN STD_LOGIC;
      b_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      b_rsc_BID : IN STD_LOGIC;
      b_rsc_WREADY : IN STD_LOGIC;
      b_rsc_WVALID : OUT STD_LOGIC;
      b_rsc_WUSER : OUT STD_LOGIC;
      b_rsc_WLAST : OUT STD_LOGIC;
      b_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsc_AWREADY : IN STD_LOGIC;
      b_rsc_AWVALID : OUT STD_LOGIC;
      b_rsc_AWUSER : OUT STD_LOGIC;
      b_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_AWLOCK : OUT STD_LOGIC;
      b_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      b_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      b_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsc_AWID : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      b_rsci_oswt : IN STD_LOGIC;
      b_rsci_wen_comp : OUT STD_LOGIC;
      b_rsci_m_waddr_core : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsci_m_dout_core : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_m_wstate : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_ARADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsc_AWADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsci_m_waddr_core : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL axi_add_core_b_rsci_inst_b_rsci_m_dout_core : STD_LOGIC_VECTOR (31 DOWNTO
      0);

  COMPONENT axi_add_core_complete_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      complete_rsc_rdy : IN STD_LOGIC;
      complete_rsc_vld : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      complete_rsci_oswt : IN STD_LOGIC;
      complete_rsci_wen_comp : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_a_rsc_triosy_obj
    PORT(
      a_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      a_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_b_rsc_triosy_obj
    PORT(
      b_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      b_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : OUT STD_LOGIC;
      core_wten : OUT STD_LOGIC;
      a_rsci_wen_comp : IN STD_LOGIC;
      b_rsci_wen_comp : IN STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT axi_add_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      main_C_0_tr0 : IN STD_LOGIC;
      ADD_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL axi_add_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL axi_add_core_core_fsm_inst_main_C_0_tr0 : STD_LOGIC;
  SIGNAL axi_add_core_core_fsm_inst_ADD_LOOP_C_1_tr0 : STD_LOGIC;

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
  axi_add_core_run_rsci_inst : axi_add_core_run_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsc_rdy => run_rsc_rdy,
      run_rsc_vld => run_rsc_vld,
      core_wen => core_wen,
      run_rsci_oswt => reg_run_rsci_oswt_cse,
      core_wten => core_wten,
      run_rsci_ivld_mxwt => run_rsci_ivld_mxwt
    );
  axi_add_core_a_rsci_inst : axi_add_core_a_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      a_rsc_m_wstate => axi_add_core_a_rsci_inst_a_rsc_m_wstate,
      a_rsc_m_wCaughtUp => a_rsc_m_wCaughtUp,
      a_rsc_RREADY => a_rsc_RREADY,
      a_rsc_RVALID => a_rsc_RVALID,
      a_rsc_RUSER => a_rsc_RUSER,
      a_rsc_RLAST => a_rsc_RLAST,
      a_rsc_RRESP => axi_add_core_a_rsci_inst_a_rsc_RRESP,
      a_rsc_RDATA => axi_add_core_a_rsci_inst_a_rsc_RDATA,
      a_rsc_RID => a_rsc_RID,
      a_rsc_ARREADY => a_rsc_ARREADY,
      a_rsc_ARVALID => a_rsc_ARVALID,
      a_rsc_ARUSER => a_rsc_ARUSER,
      a_rsc_ARREGION => axi_add_core_a_rsci_inst_a_rsc_ARREGION,
      a_rsc_ARQOS => axi_add_core_a_rsci_inst_a_rsc_ARQOS,
      a_rsc_ARPROT => axi_add_core_a_rsci_inst_a_rsc_ARPROT,
      a_rsc_ARCACHE => axi_add_core_a_rsci_inst_a_rsc_ARCACHE,
      a_rsc_ARLOCK => a_rsc_ARLOCK,
      a_rsc_ARBURST => axi_add_core_a_rsci_inst_a_rsc_ARBURST,
      a_rsc_ARSIZE => axi_add_core_a_rsci_inst_a_rsc_ARSIZE,
      a_rsc_ARLEN => axi_add_core_a_rsci_inst_a_rsc_ARLEN,
      a_rsc_ARADDR => axi_add_core_a_rsci_inst_a_rsc_ARADDR,
      a_rsc_ARID => a_rsc_ARID,
      a_rsc_BREADY => a_rsc_BREADY,
      a_rsc_BVALID => a_rsc_BVALID,
      a_rsc_BUSER => a_rsc_BUSER,
      a_rsc_BRESP => axi_add_core_a_rsci_inst_a_rsc_BRESP,
      a_rsc_BID => a_rsc_BID,
      a_rsc_WREADY => a_rsc_WREADY,
      a_rsc_WVALID => a_rsc_WVALID,
      a_rsc_WUSER => a_rsc_WUSER,
      a_rsc_WLAST => a_rsc_WLAST,
      a_rsc_WSTRB => axi_add_core_a_rsci_inst_a_rsc_WSTRB,
      a_rsc_WDATA => axi_add_core_a_rsci_inst_a_rsc_WDATA,
      a_rsc_AWREADY => a_rsc_AWREADY,
      a_rsc_AWVALID => a_rsc_AWVALID,
      a_rsc_AWUSER => a_rsc_AWUSER,
      a_rsc_AWREGION => axi_add_core_a_rsci_inst_a_rsc_AWREGION,
      a_rsc_AWQOS => axi_add_core_a_rsci_inst_a_rsc_AWQOS,
      a_rsc_AWPROT => axi_add_core_a_rsci_inst_a_rsc_AWPROT,
      a_rsc_AWCACHE => axi_add_core_a_rsci_inst_a_rsc_AWCACHE,
      a_rsc_AWLOCK => a_rsc_AWLOCK,
      a_rsc_AWBURST => axi_add_core_a_rsci_inst_a_rsc_AWBURST,
      a_rsc_AWSIZE => axi_add_core_a_rsci_inst_a_rsc_AWSIZE,
      a_rsc_AWLEN => axi_add_core_a_rsci_inst_a_rsc_AWLEN,
      a_rsc_AWADDR => axi_add_core_a_rsci_inst_a_rsc_AWADDR,
      a_rsc_AWID => a_rsc_AWID,
      core_wen => core_wen,
      a_rsci_oswt => reg_a_rsci_oswt_cse,
      a_rsci_wen_comp => a_rsci_wen_comp,
      a_rsci_m_raddr_core => axi_add_core_a_rsci_inst_a_rsci_m_raddr_core,
      a_rsci_m_din_mxwt => axi_add_core_a_rsci_inst_a_rsci_m_din_mxwt
    );
  a_rsc_m_wstate <= axi_add_core_a_rsci_inst_a_rsc_m_wstate;
  axi_add_core_a_rsci_inst_a_rsc_RRESP <= a_rsc_RRESP;
  axi_add_core_a_rsci_inst_a_rsc_RDATA <= a_rsc_RDATA;
  a_rsc_ARREGION <= axi_add_core_a_rsci_inst_a_rsc_ARREGION;
  a_rsc_ARQOS <= axi_add_core_a_rsci_inst_a_rsc_ARQOS;
  a_rsc_ARPROT <= axi_add_core_a_rsci_inst_a_rsc_ARPROT;
  a_rsc_ARCACHE <= axi_add_core_a_rsci_inst_a_rsc_ARCACHE;
  a_rsc_ARBURST <= axi_add_core_a_rsci_inst_a_rsc_ARBURST;
  a_rsc_ARSIZE <= axi_add_core_a_rsci_inst_a_rsc_ARSIZE;
  a_rsc_ARLEN <= axi_add_core_a_rsci_inst_a_rsc_ARLEN;
  a_rsc_ARADDR <= axi_add_core_a_rsci_inst_a_rsc_ARADDR;
  axi_add_core_a_rsci_inst_a_rsc_BRESP <= a_rsc_BRESP;
  a_rsc_WSTRB <= axi_add_core_a_rsci_inst_a_rsc_WSTRB;
  a_rsc_WDATA <= axi_add_core_a_rsci_inst_a_rsc_WDATA;
  a_rsc_AWREGION <= axi_add_core_a_rsci_inst_a_rsc_AWREGION;
  a_rsc_AWQOS <= axi_add_core_a_rsci_inst_a_rsc_AWQOS;
  a_rsc_AWPROT <= axi_add_core_a_rsci_inst_a_rsc_AWPROT;
  a_rsc_AWCACHE <= axi_add_core_a_rsci_inst_a_rsc_AWCACHE;
  a_rsc_AWBURST <= axi_add_core_a_rsci_inst_a_rsc_AWBURST;
  a_rsc_AWSIZE <= axi_add_core_a_rsci_inst_a_rsc_AWSIZE;
  a_rsc_AWLEN <= axi_add_core_a_rsci_inst_a_rsc_AWLEN;
  a_rsc_AWADDR <= axi_add_core_a_rsci_inst_a_rsc_AWADDR;
  axi_add_core_a_rsci_inst_a_rsci_m_raddr_core <= a_rsci_m_raddr_core;
  a_rsci_m_din_mxwt <= axi_add_core_a_rsci_inst_a_rsci_m_din_mxwt;

  axi_add_core_b_rsci_inst : axi_add_core_b_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      b_rsc_m_wstate => axi_add_core_b_rsci_inst_b_rsc_m_wstate,
      b_rsc_m_wCaughtUp => b_rsc_m_wCaughtUp,
      b_rsc_RREADY => b_rsc_RREADY,
      b_rsc_RVALID => b_rsc_RVALID,
      b_rsc_RUSER => b_rsc_RUSER,
      b_rsc_RLAST => b_rsc_RLAST,
      b_rsc_RRESP => axi_add_core_b_rsci_inst_b_rsc_RRESP,
      b_rsc_RDATA => axi_add_core_b_rsci_inst_b_rsc_RDATA,
      b_rsc_RID => b_rsc_RID,
      b_rsc_ARREADY => b_rsc_ARREADY,
      b_rsc_ARVALID => b_rsc_ARVALID,
      b_rsc_ARUSER => b_rsc_ARUSER,
      b_rsc_ARREGION => axi_add_core_b_rsci_inst_b_rsc_ARREGION,
      b_rsc_ARQOS => axi_add_core_b_rsci_inst_b_rsc_ARQOS,
      b_rsc_ARPROT => axi_add_core_b_rsci_inst_b_rsc_ARPROT,
      b_rsc_ARCACHE => axi_add_core_b_rsci_inst_b_rsc_ARCACHE,
      b_rsc_ARLOCK => b_rsc_ARLOCK,
      b_rsc_ARBURST => axi_add_core_b_rsci_inst_b_rsc_ARBURST,
      b_rsc_ARSIZE => axi_add_core_b_rsci_inst_b_rsc_ARSIZE,
      b_rsc_ARLEN => axi_add_core_b_rsci_inst_b_rsc_ARLEN,
      b_rsc_ARADDR => axi_add_core_b_rsci_inst_b_rsc_ARADDR,
      b_rsc_ARID => b_rsc_ARID,
      b_rsc_BREADY => b_rsc_BREADY,
      b_rsc_BVALID => b_rsc_BVALID,
      b_rsc_BUSER => b_rsc_BUSER,
      b_rsc_BRESP => axi_add_core_b_rsci_inst_b_rsc_BRESP,
      b_rsc_BID => b_rsc_BID,
      b_rsc_WREADY => b_rsc_WREADY,
      b_rsc_WVALID => b_rsc_WVALID,
      b_rsc_WUSER => b_rsc_WUSER,
      b_rsc_WLAST => b_rsc_WLAST,
      b_rsc_WSTRB => axi_add_core_b_rsci_inst_b_rsc_WSTRB,
      b_rsc_WDATA => axi_add_core_b_rsci_inst_b_rsc_WDATA,
      b_rsc_AWREADY => b_rsc_AWREADY,
      b_rsc_AWVALID => b_rsc_AWVALID,
      b_rsc_AWUSER => b_rsc_AWUSER,
      b_rsc_AWREGION => axi_add_core_b_rsci_inst_b_rsc_AWREGION,
      b_rsc_AWQOS => axi_add_core_b_rsci_inst_b_rsc_AWQOS,
      b_rsc_AWPROT => axi_add_core_b_rsci_inst_b_rsc_AWPROT,
      b_rsc_AWCACHE => axi_add_core_b_rsci_inst_b_rsc_AWCACHE,
      b_rsc_AWLOCK => b_rsc_AWLOCK,
      b_rsc_AWBURST => axi_add_core_b_rsci_inst_b_rsc_AWBURST,
      b_rsc_AWSIZE => axi_add_core_b_rsci_inst_b_rsc_AWSIZE,
      b_rsc_AWLEN => axi_add_core_b_rsci_inst_b_rsc_AWLEN,
      b_rsc_AWADDR => axi_add_core_b_rsci_inst_b_rsc_AWADDR,
      b_rsc_AWID => b_rsc_AWID,
      core_wen => core_wen,
      b_rsci_oswt => reg_b_rsci_oswt_cse,
      b_rsci_wen_comp => b_rsci_wen_comp,
      b_rsci_m_waddr_core => axi_add_core_b_rsci_inst_b_rsci_m_waddr_core,
      b_rsci_m_dout_core => axi_add_core_b_rsci_inst_b_rsci_m_dout_core
    );
  b_rsc_m_wstate <= axi_add_core_b_rsci_inst_b_rsc_m_wstate;
  axi_add_core_b_rsci_inst_b_rsc_RRESP <= b_rsc_RRESP;
  axi_add_core_b_rsci_inst_b_rsc_RDATA <= b_rsc_RDATA;
  b_rsc_ARREGION <= axi_add_core_b_rsci_inst_b_rsc_ARREGION;
  b_rsc_ARQOS <= axi_add_core_b_rsci_inst_b_rsc_ARQOS;
  b_rsc_ARPROT <= axi_add_core_b_rsci_inst_b_rsc_ARPROT;
  b_rsc_ARCACHE <= axi_add_core_b_rsci_inst_b_rsc_ARCACHE;
  b_rsc_ARBURST <= axi_add_core_b_rsci_inst_b_rsc_ARBURST;
  b_rsc_ARSIZE <= axi_add_core_b_rsci_inst_b_rsc_ARSIZE;
  b_rsc_ARLEN <= axi_add_core_b_rsci_inst_b_rsc_ARLEN;
  b_rsc_ARADDR <= axi_add_core_b_rsci_inst_b_rsc_ARADDR;
  axi_add_core_b_rsci_inst_b_rsc_BRESP <= b_rsc_BRESP;
  b_rsc_WSTRB <= axi_add_core_b_rsci_inst_b_rsc_WSTRB;
  b_rsc_WDATA <= axi_add_core_b_rsci_inst_b_rsc_WDATA;
  b_rsc_AWREGION <= axi_add_core_b_rsci_inst_b_rsc_AWREGION;
  b_rsc_AWQOS <= axi_add_core_b_rsci_inst_b_rsc_AWQOS;
  b_rsc_AWPROT <= axi_add_core_b_rsci_inst_b_rsc_AWPROT;
  b_rsc_AWCACHE <= axi_add_core_b_rsci_inst_b_rsc_AWCACHE;
  b_rsc_AWBURST <= axi_add_core_b_rsci_inst_b_rsc_AWBURST;
  b_rsc_AWSIZE <= axi_add_core_b_rsci_inst_b_rsc_AWSIZE;
  b_rsc_AWLEN <= axi_add_core_b_rsci_inst_b_rsc_AWLEN;
  b_rsc_AWADDR <= axi_add_core_b_rsci_inst_b_rsc_AWADDR;
  axi_add_core_b_rsci_inst_b_rsci_m_waddr_core <= b_rsci_m_waddr_core;
  axi_add_core_b_rsci_inst_b_rsci_m_dout_core <= b_rsci_m_dout_core_31_2 & b_rsci_m_dout_core_1_0;

  axi_add_core_complete_rsci_inst : axi_add_core_complete_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld,
      core_wen => core_wen,
      complete_rsci_oswt => reg_complete_rsci_oswt_cse,
      complete_rsci_wen_comp => complete_rsci_wen_comp
    );
  axi_add_core_a_rsc_triosy_obj_inst : axi_add_core_a_rsc_triosy_obj
    PORT MAP(
      a_rsc_triosy_lz => a_rsc_triosy_lz,
      core_wten => core_wten,
      a_rsc_triosy_obj_iswt0 => reg_a_rsc_triosy_obj_iswt0_cse
    );
  axi_add_core_b_rsc_triosy_obj_inst : axi_add_core_b_rsc_triosy_obj
    PORT MAP(
      b_rsc_triosy_lz => b_rsc_triosy_lz,
      core_wten => core_wten,
      b_rsc_triosy_obj_iswt0 => reg_a_rsc_triosy_obj_iswt0_cse
    );
  axi_add_core_staller_inst : axi_add_core_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen,
      core_wten => core_wten,
      a_rsci_wen_comp => a_rsci_wen_comp,
      b_rsci_wen_comp => b_rsci_wen_comp,
      complete_rsci_wen_comp => complete_rsci_wen_comp
    );
  axi_add_core_core_fsm_inst : axi_add_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen,
      fsm_output => axi_add_core_core_fsm_inst_fsm_output,
      main_C_0_tr0 => axi_add_core_core_fsm_inst_main_C_0_tr0,
      ADD_LOOP_C_1_tr0 => axi_add_core_core_fsm_inst_ADD_LOOP_C_1_tr0
    );
  fsm_output <= axi_add_core_core_fsm_inst_fsm_output;
  axi_add_core_core_fsm_inst_main_C_0_tr0 <= NOT run_ac_sync_tmp_dobj_sva;
  axi_add_core_core_fsm_inst_ADD_LOOP_C_1_tr0 <= ADD_LOOP_i_4_0_sva_1(4);

  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( core_wen = '1' ) THEN
        a_rsci_m_raddr_core <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), (ADD_LOOP_i_4_0_sva_1(3
            DOWNTO 0)), (fsm_output(3)));
        b_rsci_m_waddr_core <= a_rsci_m_raddr_core;
        b_rsci_m_dout_core_1_0 <= a_rsci_m_din_mxwt(1 DOWNTO 0);
        b_rsci_m_dout_core_31_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(a_rsci_m_din_mxwt(31
            DOWNTO 2)) + UNSIGNED'( "000000000000000000000000011001"), 30));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_run_rsci_oswt_cse <= '0';
        reg_a_rsci_oswt_cse <= '0';
        reg_b_rsci_oswt_cse <= '0';
        reg_complete_rsci_oswt_cse <= '0';
        reg_a_rsc_triosy_obj_iswt0_cse <= '0';
        ADD_LOOP_i_4_0_sva_1 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( core_wen = '1' ) THEN
        reg_run_rsci_oswt_cse <= (fsm_output(0)) OR (fsm_output(5));
        reg_a_rsci_oswt_cse <= ((NOT (ADD_LOOP_i_4_0_sva_1(4))) AND (fsm_output(3)))
            OR (run_ac_sync_tmp_dobj_sva AND (fsm_output(1)));
        reg_b_rsci_oswt_cse <= fsm_output(2);
        reg_complete_rsci_oswt_cse <= ((ADD_LOOP_i_4_0_sva_1(4)) AND (fsm_output(3)))
            OR ((NOT run_ac_sync_tmp_dobj_sva) AND (fsm_output(1)));
        reg_a_rsc_triosy_obj_iswt0_cse <= fsm_output(4);
        ADD_LOOP_i_4_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(a_rsci_m_raddr_core),
            4), 5) + UNSIGNED'( "00001"), 5));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_ac_sync_tmp_dobj_sva <= '0';
      ELSIF ( (core_wen AND (fsm_output(1))) = '1' ) THEN
        run_ac_sync_tmp_dobj_sva <= run_rsci_ivld_mxwt;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    axi_add
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;

USE work.amba_comps.ALL;


ENTITY axi_add IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    a_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_m_wCaughtUp : OUT STD_LOGIC;
    a_rsc_RREADY : OUT STD_LOGIC;
    a_rsc_RVALID : IN STD_LOGIC;
    a_rsc_RUSER : IN STD_LOGIC;
    a_rsc_RLAST : IN STD_LOGIC;
    a_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_RID : IN STD_LOGIC;
    a_rsc_ARREADY : IN STD_LOGIC;
    a_rsc_ARVALID : OUT STD_LOGIC;
    a_rsc_ARUSER : OUT STD_LOGIC;
    a_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_ARLOCK : OUT STD_LOGIC;
    a_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    a_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_ARID : OUT STD_LOGIC;
    a_rsc_BREADY : OUT STD_LOGIC;
    a_rsc_BVALID : IN STD_LOGIC;
    a_rsc_BUSER : IN STD_LOGIC;
    a_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_BID : IN STD_LOGIC;
    a_rsc_WREADY : IN STD_LOGIC;
    a_rsc_WVALID : OUT STD_LOGIC;
    a_rsc_WUSER : OUT STD_LOGIC;
    a_rsc_WLAST : OUT STD_LOGIC;
    a_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_AWREADY : IN STD_LOGIC;
    a_rsc_AWVALID : OUT STD_LOGIC;
    a_rsc_AWUSER : OUT STD_LOGIC;
    a_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    a_rsc_AWLOCK : OUT STD_LOGIC;
    a_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    a_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    a_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    a_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    a_rsc_AWID : OUT STD_LOGIC;
    a_rsc_triosy_lz : OUT STD_LOGIC;
    b_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_m_wCaughtUp : OUT STD_LOGIC;
    b_rsc_RREADY : OUT STD_LOGIC;
    b_rsc_RVALID : IN STD_LOGIC;
    b_rsc_RUSER : IN STD_LOGIC;
    b_rsc_RLAST : IN STD_LOGIC;
    b_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_RID : IN STD_LOGIC;
    b_rsc_ARREADY : IN STD_LOGIC;
    b_rsc_ARVALID : OUT STD_LOGIC;
    b_rsc_ARUSER : OUT STD_LOGIC;
    b_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_ARLOCK : OUT STD_LOGIC;
    b_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    b_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_ARID : OUT STD_LOGIC;
    b_rsc_BREADY : OUT STD_LOGIC;
    b_rsc_BVALID : IN STD_LOGIC;
    b_rsc_BUSER : IN STD_LOGIC;
    b_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_BID : IN STD_LOGIC;
    b_rsc_WREADY : IN STD_LOGIC;
    b_rsc_WVALID : OUT STD_LOGIC;
    b_rsc_WUSER : OUT STD_LOGIC;
    b_rsc_WLAST : OUT STD_LOGIC;
    b_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_AWREADY : IN STD_LOGIC;
    b_rsc_AWVALID : OUT STD_LOGIC;
    b_rsc_AWUSER : OUT STD_LOGIC;
    b_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    b_rsc_AWLOCK : OUT STD_LOGIC;
    b_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    b_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    b_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    b_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_rsc_AWID : OUT STD_LOGIC;
    b_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END axi_add;

ARCHITECTURE v2 OF axi_add IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  COMPONENT axi_add_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_rsc_rdy : OUT STD_LOGIC;
      run_rsc_vld : IN STD_LOGIC;
      a_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_m_wCaughtUp : OUT STD_LOGIC;
      a_rsc_RREADY : OUT STD_LOGIC;
      a_rsc_RVALID : IN STD_LOGIC;
      a_rsc_RUSER : IN STD_LOGIC;
      a_rsc_RLAST : IN STD_LOGIC;
      a_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      a_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsc_RID : IN STD_LOGIC;
      a_rsc_ARREADY : IN STD_LOGIC;
      a_rsc_ARVALID : OUT STD_LOGIC;
      a_rsc_ARUSER : OUT STD_LOGIC;
      a_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_ARLOCK : OUT STD_LOGIC;
      a_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      a_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      a_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsc_ARID : OUT STD_LOGIC;
      a_rsc_BREADY : OUT STD_LOGIC;
      a_rsc_BVALID : IN STD_LOGIC;
      a_rsc_BUSER : IN STD_LOGIC;
      a_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      a_rsc_BID : IN STD_LOGIC;
      a_rsc_WREADY : IN STD_LOGIC;
      a_rsc_WVALID : OUT STD_LOGIC;
      a_rsc_WUSER : OUT STD_LOGIC;
      a_rsc_WLAST : OUT STD_LOGIC;
      a_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsc_AWREADY : IN STD_LOGIC;
      a_rsc_AWVALID : OUT STD_LOGIC;
      a_rsc_AWUSER : OUT STD_LOGIC;
      a_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      a_rsc_AWLOCK : OUT STD_LOGIC;
      a_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      a_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      a_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      a_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      a_rsc_AWID : OUT STD_LOGIC;
      a_rsc_triosy_lz : OUT STD_LOGIC;
      b_rsc_m_wstate : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_m_wCaughtUp : OUT STD_LOGIC;
      b_rsc_RREADY : OUT STD_LOGIC;
      b_rsc_RVALID : IN STD_LOGIC;
      b_rsc_RUSER : IN STD_LOGIC;
      b_rsc_RLAST : IN STD_LOGIC;
      b_rsc_RRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      b_rsc_RDATA : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsc_RID : IN STD_LOGIC;
      b_rsc_ARREADY : IN STD_LOGIC;
      b_rsc_ARVALID : OUT STD_LOGIC;
      b_rsc_ARUSER : OUT STD_LOGIC;
      b_rsc_ARREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_ARQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_ARPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_ARCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_ARLOCK : OUT STD_LOGIC;
      b_rsc_ARBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      b_rsc_ARSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_ARLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      b_rsc_ARADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsc_ARID : OUT STD_LOGIC;
      b_rsc_BREADY : OUT STD_LOGIC;
      b_rsc_BVALID : IN STD_LOGIC;
      b_rsc_BUSER : IN STD_LOGIC;
      b_rsc_BRESP : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      b_rsc_BID : IN STD_LOGIC;
      b_rsc_WREADY : IN STD_LOGIC;
      b_rsc_WVALID : OUT STD_LOGIC;
      b_rsc_WUSER : OUT STD_LOGIC;
      b_rsc_WLAST : OUT STD_LOGIC;
      b_rsc_WSTRB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_WDATA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsc_AWREADY : IN STD_LOGIC;
      b_rsc_AWVALID : OUT STD_LOGIC;
      b_rsc_AWUSER : OUT STD_LOGIC;
      b_rsc_AWREGION : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_AWQOS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_AWPROT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_AWCACHE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      b_rsc_AWLOCK : OUT STD_LOGIC;
      b_rsc_AWBURST : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      b_rsc_AWSIZE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      b_rsc_AWLEN : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      b_rsc_AWADDR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_rsc_AWID : OUT STD_LOGIC;
      b_rsc_triosy_lz : OUT STD_LOGIC;
      complete_rsc_rdy : IN STD_LOGIC;
      complete_rsc_vld : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL axi_add_core_inst_a_rsc_m_wstate : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_ARADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL axi_add_core_inst_a_rsc_AWADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_m_wstate : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_RRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_RDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_ARREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_ARQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_ARPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_ARCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_ARBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_ARSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_ARLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_ARADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_BRESP : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_WSTRB : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_WDATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_AWREGION : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_AWQOS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_AWPROT : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_AWCACHE : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_AWBURST : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_AWSIZE : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_AWLEN : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL axi_add_core_inst_b_rsc_AWADDR : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  axi_add_core_inst : axi_add_core
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsc_rdy => run_rsc_rdy,
      run_rsc_vld => run_rsc_vld,
      a_rsc_m_wstate => axi_add_core_inst_a_rsc_m_wstate,
      a_rsc_m_wCaughtUp => a_rsc_m_wCaughtUp,
      a_rsc_RREADY => a_rsc_RREADY,
      a_rsc_RVALID => a_rsc_RVALID,
      a_rsc_RUSER => a_rsc_RUSER,
      a_rsc_RLAST => a_rsc_RLAST,
      a_rsc_RRESP => axi_add_core_inst_a_rsc_RRESP,
      a_rsc_RDATA => axi_add_core_inst_a_rsc_RDATA,
      a_rsc_RID => a_rsc_RID,
      a_rsc_ARREADY => a_rsc_ARREADY,
      a_rsc_ARVALID => a_rsc_ARVALID,
      a_rsc_ARUSER => a_rsc_ARUSER,
      a_rsc_ARREGION => axi_add_core_inst_a_rsc_ARREGION,
      a_rsc_ARQOS => axi_add_core_inst_a_rsc_ARQOS,
      a_rsc_ARPROT => axi_add_core_inst_a_rsc_ARPROT,
      a_rsc_ARCACHE => axi_add_core_inst_a_rsc_ARCACHE,
      a_rsc_ARLOCK => a_rsc_ARLOCK,
      a_rsc_ARBURST => axi_add_core_inst_a_rsc_ARBURST,
      a_rsc_ARSIZE => axi_add_core_inst_a_rsc_ARSIZE,
      a_rsc_ARLEN => axi_add_core_inst_a_rsc_ARLEN,
      a_rsc_ARADDR => axi_add_core_inst_a_rsc_ARADDR,
      a_rsc_ARID => a_rsc_ARID,
      a_rsc_BREADY => a_rsc_BREADY,
      a_rsc_BVALID => a_rsc_BVALID,
      a_rsc_BUSER => a_rsc_BUSER,
      a_rsc_BRESP => axi_add_core_inst_a_rsc_BRESP,
      a_rsc_BID => a_rsc_BID,
      a_rsc_WREADY => a_rsc_WREADY,
      a_rsc_WVALID => a_rsc_WVALID,
      a_rsc_WUSER => a_rsc_WUSER,
      a_rsc_WLAST => a_rsc_WLAST,
      a_rsc_WSTRB => axi_add_core_inst_a_rsc_WSTRB,
      a_rsc_WDATA => axi_add_core_inst_a_rsc_WDATA,
      a_rsc_AWREADY => a_rsc_AWREADY,
      a_rsc_AWVALID => a_rsc_AWVALID,
      a_rsc_AWUSER => a_rsc_AWUSER,
      a_rsc_AWREGION => axi_add_core_inst_a_rsc_AWREGION,
      a_rsc_AWQOS => axi_add_core_inst_a_rsc_AWQOS,
      a_rsc_AWPROT => axi_add_core_inst_a_rsc_AWPROT,
      a_rsc_AWCACHE => axi_add_core_inst_a_rsc_AWCACHE,
      a_rsc_AWLOCK => a_rsc_AWLOCK,
      a_rsc_AWBURST => axi_add_core_inst_a_rsc_AWBURST,
      a_rsc_AWSIZE => axi_add_core_inst_a_rsc_AWSIZE,
      a_rsc_AWLEN => axi_add_core_inst_a_rsc_AWLEN,
      a_rsc_AWADDR => axi_add_core_inst_a_rsc_AWADDR,
      a_rsc_AWID => a_rsc_AWID,
      a_rsc_triosy_lz => a_rsc_triosy_lz,
      b_rsc_m_wstate => axi_add_core_inst_b_rsc_m_wstate,
      b_rsc_m_wCaughtUp => b_rsc_m_wCaughtUp,
      b_rsc_RREADY => b_rsc_RREADY,
      b_rsc_RVALID => b_rsc_RVALID,
      b_rsc_RUSER => b_rsc_RUSER,
      b_rsc_RLAST => b_rsc_RLAST,
      b_rsc_RRESP => axi_add_core_inst_b_rsc_RRESP,
      b_rsc_RDATA => axi_add_core_inst_b_rsc_RDATA,
      b_rsc_RID => b_rsc_RID,
      b_rsc_ARREADY => b_rsc_ARREADY,
      b_rsc_ARVALID => b_rsc_ARVALID,
      b_rsc_ARUSER => b_rsc_ARUSER,
      b_rsc_ARREGION => axi_add_core_inst_b_rsc_ARREGION,
      b_rsc_ARQOS => axi_add_core_inst_b_rsc_ARQOS,
      b_rsc_ARPROT => axi_add_core_inst_b_rsc_ARPROT,
      b_rsc_ARCACHE => axi_add_core_inst_b_rsc_ARCACHE,
      b_rsc_ARLOCK => b_rsc_ARLOCK,
      b_rsc_ARBURST => axi_add_core_inst_b_rsc_ARBURST,
      b_rsc_ARSIZE => axi_add_core_inst_b_rsc_ARSIZE,
      b_rsc_ARLEN => axi_add_core_inst_b_rsc_ARLEN,
      b_rsc_ARADDR => axi_add_core_inst_b_rsc_ARADDR,
      b_rsc_ARID => b_rsc_ARID,
      b_rsc_BREADY => b_rsc_BREADY,
      b_rsc_BVALID => b_rsc_BVALID,
      b_rsc_BUSER => b_rsc_BUSER,
      b_rsc_BRESP => axi_add_core_inst_b_rsc_BRESP,
      b_rsc_BID => b_rsc_BID,
      b_rsc_WREADY => b_rsc_WREADY,
      b_rsc_WVALID => b_rsc_WVALID,
      b_rsc_WUSER => b_rsc_WUSER,
      b_rsc_WLAST => b_rsc_WLAST,
      b_rsc_WSTRB => axi_add_core_inst_b_rsc_WSTRB,
      b_rsc_WDATA => axi_add_core_inst_b_rsc_WDATA,
      b_rsc_AWREADY => b_rsc_AWREADY,
      b_rsc_AWVALID => b_rsc_AWVALID,
      b_rsc_AWUSER => b_rsc_AWUSER,
      b_rsc_AWREGION => axi_add_core_inst_b_rsc_AWREGION,
      b_rsc_AWQOS => axi_add_core_inst_b_rsc_AWQOS,
      b_rsc_AWPROT => axi_add_core_inst_b_rsc_AWPROT,
      b_rsc_AWCACHE => axi_add_core_inst_b_rsc_AWCACHE,
      b_rsc_AWLOCK => b_rsc_AWLOCK,
      b_rsc_AWBURST => axi_add_core_inst_b_rsc_AWBURST,
      b_rsc_AWSIZE => axi_add_core_inst_b_rsc_AWSIZE,
      b_rsc_AWLEN => axi_add_core_inst_b_rsc_AWLEN,
      b_rsc_AWADDR => axi_add_core_inst_b_rsc_AWADDR,
      b_rsc_AWID => b_rsc_AWID,
      b_rsc_triosy_lz => b_rsc_triosy_lz,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld
    );
  a_rsc_m_wstate <= axi_add_core_inst_a_rsc_m_wstate;
  axi_add_core_inst_a_rsc_RRESP <= a_rsc_RRESP;
  axi_add_core_inst_a_rsc_RDATA <= a_rsc_RDATA;
  a_rsc_ARREGION <= axi_add_core_inst_a_rsc_ARREGION;
  a_rsc_ARQOS <= axi_add_core_inst_a_rsc_ARQOS;
  a_rsc_ARPROT <= axi_add_core_inst_a_rsc_ARPROT;
  a_rsc_ARCACHE <= axi_add_core_inst_a_rsc_ARCACHE;
  a_rsc_ARBURST <= axi_add_core_inst_a_rsc_ARBURST;
  a_rsc_ARSIZE <= axi_add_core_inst_a_rsc_ARSIZE;
  a_rsc_ARLEN <= axi_add_core_inst_a_rsc_ARLEN;
  a_rsc_ARADDR <= axi_add_core_inst_a_rsc_ARADDR;
  axi_add_core_inst_a_rsc_BRESP <= a_rsc_BRESP;
  a_rsc_WSTRB <= axi_add_core_inst_a_rsc_WSTRB;
  a_rsc_WDATA <= axi_add_core_inst_a_rsc_WDATA;
  a_rsc_AWREGION <= axi_add_core_inst_a_rsc_AWREGION;
  a_rsc_AWQOS <= axi_add_core_inst_a_rsc_AWQOS;
  a_rsc_AWPROT <= axi_add_core_inst_a_rsc_AWPROT;
  a_rsc_AWCACHE <= axi_add_core_inst_a_rsc_AWCACHE;
  a_rsc_AWBURST <= axi_add_core_inst_a_rsc_AWBURST;
  a_rsc_AWSIZE <= axi_add_core_inst_a_rsc_AWSIZE;
  a_rsc_AWLEN <= axi_add_core_inst_a_rsc_AWLEN;
  a_rsc_AWADDR <= axi_add_core_inst_a_rsc_AWADDR;
  b_rsc_m_wstate <= axi_add_core_inst_b_rsc_m_wstate;
  axi_add_core_inst_b_rsc_RRESP <= b_rsc_RRESP;
  axi_add_core_inst_b_rsc_RDATA <= b_rsc_RDATA;
  b_rsc_ARREGION <= axi_add_core_inst_b_rsc_ARREGION;
  b_rsc_ARQOS <= axi_add_core_inst_b_rsc_ARQOS;
  b_rsc_ARPROT <= axi_add_core_inst_b_rsc_ARPROT;
  b_rsc_ARCACHE <= axi_add_core_inst_b_rsc_ARCACHE;
  b_rsc_ARBURST <= axi_add_core_inst_b_rsc_ARBURST;
  b_rsc_ARSIZE <= axi_add_core_inst_b_rsc_ARSIZE;
  b_rsc_ARLEN <= axi_add_core_inst_b_rsc_ARLEN;
  b_rsc_ARADDR <= axi_add_core_inst_b_rsc_ARADDR;
  axi_add_core_inst_b_rsc_BRESP <= b_rsc_BRESP;
  b_rsc_WSTRB <= axi_add_core_inst_b_rsc_WSTRB;
  b_rsc_WDATA <= axi_add_core_inst_b_rsc_WDATA;
  b_rsc_AWREGION <= axi_add_core_inst_b_rsc_AWREGION;
  b_rsc_AWQOS <= axi_add_core_inst_b_rsc_AWQOS;
  b_rsc_AWPROT <= axi_add_core_inst_b_rsc_AWPROT;
  b_rsc_AWCACHE <= axi_add_core_inst_b_rsc_AWCACHE;
  b_rsc_AWBURST <= axi_add_core_inst_b_rsc_AWBURST;
  b_rsc_AWSIZE <= axi_add_core_inst_b_rsc_AWSIZE;
  b_rsc_AWLEN <= axi_add_core_inst_b_rsc_AWLEN;
  b_rsc_AWADDR <= axi_add_core_inst_b_rsc_AWADDR;

END v2;



