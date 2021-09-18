// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Wed Sep 15 23:45:00 2021
// Host        : DESKTOP-5VIDJ10 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [3:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [3:0]addra;
  wire [3:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]doutb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_douta_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.8747 mW" *) 
  (* C_FAMILY = "virtex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "12" *) 
  (* C_READ_DEPTH_B = "12" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "12" *) 
  (* C_WRITE_DEPTH_B = "12" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[31:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19904)
`pragma protect data_block
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
Muo+mOMXq/Dybcs=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
