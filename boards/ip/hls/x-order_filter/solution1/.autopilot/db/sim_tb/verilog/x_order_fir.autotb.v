// ==============================================================
// File generated on Mon Oct 07 02:00:09 +0800 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      x_order_fir
`define AUTOTB_DUT_INST AESL_inst_x_order_fir
`define AUTOTB_TOP      apatb_x_order_fir_top
`define AUTOTB_LAT_RESULT_FILE "x_order_fir.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "x_order_fir.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_x_order_fir_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_DEPTH_gmem 1
`define AESL_DEPTH_y_data 1
`define AESL_DEPTH_y_user_V 1
`define AESL_DEPTH_y_last_V 1
`define AESL_DEPTH_x_data 1
`define AESL_DEPTH_x_user_V 1
`define AESL_DEPTH_x_last_V 1
`define AESL_DEPTH_coe 1
`define AESL_DEPTH_ctrl 1
`define AUTOTB_TVIN_gmem  "./c.x_order_fir.autotvin_gmem.dat"
`define AUTOTB_TVIN_y_data  "./c.x_order_fir.autotvin_y_data.dat"
`define AUTOTB_TVIN_y_user_V  "./c.x_order_fir.autotvin_y_user_V.dat"
`define AUTOTB_TVIN_y_last_V  "./c.x_order_fir.autotvin_y_last_V.dat"
`define AUTOTB_TVIN_x_data  "./c.x_order_fir.autotvin_x_data.dat"
`define AUTOTB_TVIN_x_user_V  "./c.x_order_fir.autotvin_x_user_V.dat"
`define AUTOTB_TVIN_x_last_V  "./c.x_order_fir.autotvin_x_last_V.dat"
`define AUTOTB_TVIN_coe  "./c.x_order_fir.autotvin_coe.dat"
`define AUTOTB_TVIN_ctrl  "./c.x_order_fir.autotvin_ctrl.dat"
`define AUTOTB_TVIN_gmem_out_wrapc  "./rtl.x_order_fir.autotvin_gmem.dat"
`define AUTOTB_TVIN_y_data_out_wrapc  "./rtl.x_order_fir.autotvin_y_data.dat"
`define AUTOTB_TVIN_y_user_V_out_wrapc  "./rtl.x_order_fir.autotvin_y_user_V.dat"
`define AUTOTB_TVIN_y_last_V_out_wrapc  "./rtl.x_order_fir.autotvin_y_last_V.dat"
`define AUTOTB_TVIN_x_data_out_wrapc  "./rtl.x_order_fir.autotvin_x_data.dat"
`define AUTOTB_TVIN_x_user_V_out_wrapc  "./rtl.x_order_fir.autotvin_x_user_V.dat"
`define AUTOTB_TVIN_x_last_V_out_wrapc  "./rtl.x_order_fir.autotvin_x_last_V.dat"
`define AUTOTB_TVIN_coe_out_wrapc  "./rtl.x_order_fir.autotvin_coe.dat"
`define AUTOTB_TVIN_ctrl_out_wrapc  "./rtl.x_order_fir.autotvin_ctrl.dat"
`define AUTOTB_TVOUT_y_data  "./c.x_order_fir.autotvout_y_data.dat"
`define AUTOTB_TVOUT_y_user_V  "./c.x_order_fir.autotvout_y_user_V.dat"
`define AUTOTB_TVOUT_y_last_V  "./c.x_order_fir.autotvout_y_last_V.dat"
`define AUTOTB_TVOUT_y_data_out_wrapc  "./impl_rtl.x_order_fir.autotvout_y_data.dat"
`define AUTOTB_TVOUT_y_user_V_out_wrapc  "./impl_rtl.x_order_fir.autotvout_y_user_V.dat"
`define AUTOTB_TVOUT_y_last_V_out_wrapc  "./impl_rtl.x_order_fir.autotvout_y_last_V.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 600;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = -1;
parameter LENGTH_gmem = 1280;
parameter LENGTH_y_data = 1;
parameter LENGTH_y_user_V = 1;
parameter LENGTH_y_last_V = 1;
parameter LENGTH_x_data = 1;
parameter LENGTH_x_user_V = 1;
parameter LENGTH_x_last_V = 1;
parameter LENGTH_coe = 1;
parameter LENGTH_ctrl = 1;

task read_token;
    input integer fp;
    output reg [199 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

task post_check;
    input integer fp1;
    input integer fp2;
    reg [199 : 0] token1;
    reg [199 : 0] token2;
    reg [199 : 0] golden;
    reg [199 : 0] result;
    integer ret;
    begin
        read_token(fp1, token1);
        read_token(fp2, token2);
        if (token1 != "[[[runtime]]]" || token2 != "[[[runtime]]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
            $finish;
        end
        read_token(fp1, token1);
        read_token(fp2, token2);
        while (token1 != "[[[/runtime]]]" && token2 != "[[[/runtime]]]") begin
            if (token1 != "[[transaction]]" || token2 != "[[transaction]]") begin
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
            end
            read_token(fp1, token1);  // skip transaction number
            read_token(fp2, token2);  // skip transaction number
              read_token(fp1, token1);
              read_token(fp2, token2);
            while(token1 != "[[/transaction]]" && token2 != "[[/transaction]]") begin
                ret = $sscanf(token1, "0x%x", golden);
                  if (ret != 1) begin
                      $display("Failed to parse token!");
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                  end
                ret = $sscanf(token2, "0x%x", result);
                  if (ret != 1) begin
                      $display("Failed to parse token!");
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                  end
                if(golden != result) begin
                      $display("%x (expected) vs. %x (actual) - mismatch", golden, result);
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                end
                  read_token(fp1, token1);
                  read_token(fp2, token2);
            end
              read_token(fp1, token1);
              read_token(fp2, token2);
        end
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire [4 : 0] AXILiteS_AWADDR;
wire  AXILiteS_AWVALID;
wire  AXILiteS_AWREADY;
wire  AXILiteS_WVALID;
wire  AXILiteS_WREADY;
wire [31 : 0] AXILiteS_WDATA;
wire [3 : 0] AXILiteS_WSTRB;
wire [4 : 0] AXILiteS_ARADDR;
wire  AXILiteS_ARVALID;
wire  AXILiteS_ARREADY;
wire  AXILiteS_RVALID;
wire  AXILiteS_RREADY;
wire [31 : 0] AXILiteS_RDATA;
wire [1 : 0] AXILiteS_RRESP;
wire  AXILiteS_BVALID;
wire  AXILiteS_BREADY;
wire [1 : 0] AXILiteS_BRESP;
wire  AXILiteS_INTERRUPT;
wire  gmem_AWVALID;
wire  gmem_AWREADY;
wire [31 : 0] gmem_AWADDR;
wire [0 : 0] gmem_AWID;
wire [7 : 0] gmem_AWLEN;
wire [2 : 0] gmem_AWSIZE;
wire [1 : 0] gmem_AWBURST;
wire [1 : 0] gmem_AWLOCK;
wire [3 : 0] gmem_AWCACHE;
wire [2 : 0] gmem_AWPROT;
wire [3 : 0] gmem_AWQOS;
wire [3 : 0] gmem_AWREGION;
wire [0 : 0] gmem_AWUSER;
wire  gmem_WVALID;
wire  gmem_WREADY;
wire [31 : 0] gmem_WDATA;
wire [3 : 0] gmem_WSTRB;
wire  gmem_WLAST;
wire [0 : 0] gmem_WID;
wire [0 : 0] gmem_WUSER;
wire  gmem_ARVALID;
wire  gmem_ARREADY;
wire [31 : 0] gmem_ARADDR;
wire [0 : 0] gmem_ARID;
wire [7 : 0] gmem_ARLEN;
wire [2 : 0] gmem_ARSIZE;
wire [1 : 0] gmem_ARBURST;
wire [1 : 0] gmem_ARLOCK;
wire [3 : 0] gmem_ARCACHE;
wire [2 : 0] gmem_ARPROT;
wire [3 : 0] gmem_ARQOS;
wire [3 : 0] gmem_ARREGION;
wire [0 : 0] gmem_ARUSER;
wire  gmem_RVALID;
wire  gmem_RREADY;
wire [31 : 0] gmem_RDATA;
wire  gmem_RLAST;
wire [0 : 0] gmem_RID;
wire [0 : 0] gmem_RUSER;
wire [1 : 0] gmem_RRESP;
wire  gmem_BVALID;
wire  gmem_BREADY;
wire [1 : 0] gmem_BRESP;
wire [0 : 0] gmem_BID;
wire [0 : 0] gmem_BUSER;
wire [31 : 0] y_TDATA;
wire  y_TVALID;
wire  y_TREADY;
wire [0 : 0] y_TUSER;
wire [0 : 0] y_TLAST;
wire [31 : 0] x_TDATA;
wire  x_TVALID;
wire  x_TREADY;
wire [0 : 0] x_TUSER;
wire [0 : 0] x_TLAST;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;
wire AXILiteS_write_data_finish;
wire AESL_slave_start;
reg AESL_slave_start_lock = 0;
wire AESL_slave_write_start_in;
wire AESL_slave_write_start_finish;
reg AESL_slave_ready;
wire AESL_slave_output_done;
wire AESL_slave_done;
reg ready_rise = 0;
reg start_rise = 0;
reg slave_start_status = 0;
reg slave_done_status = 0;
reg ap_done_lock = 0;

wire ap_clk;
wire ap_rst_n;
wire ap_rst_n_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .s_axi_AXILiteS_AWADDR(AXILiteS_AWADDR),
    .s_axi_AXILiteS_AWVALID(AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWREADY(AXILiteS_AWREADY),
    .s_axi_AXILiteS_WVALID(AXILiteS_WVALID),
    .s_axi_AXILiteS_WREADY(AXILiteS_WREADY),
    .s_axi_AXILiteS_WDATA(AXILiteS_WDATA),
    .s_axi_AXILiteS_WSTRB(AXILiteS_WSTRB),
    .s_axi_AXILiteS_ARADDR(AXILiteS_ARADDR),
    .s_axi_AXILiteS_ARVALID(AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(AXILiteS_ARREADY),
    .s_axi_AXILiteS_RVALID(AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(AXILiteS_RREADY),
    .s_axi_AXILiteS_RDATA(AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(AXILiteS_RRESP),
    .s_axi_AXILiteS_BVALID(AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(AXILiteS_BREADY),
    .s_axi_AXILiteS_BRESP(AXILiteS_BRESP),
    .interrupt(AXILiteS_INTERRUPT),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .m_axi_gmem_AWVALID(gmem_AWVALID),
    .m_axi_gmem_AWREADY(gmem_AWREADY),
    .m_axi_gmem_AWADDR(gmem_AWADDR),
    .m_axi_gmem_AWID(gmem_AWID),
    .m_axi_gmem_AWLEN(gmem_AWLEN),
    .m_axi_gmem_AWSIZE(gmem_AWSIZE),
    .m_axi_gmem_AWBURST(gmem_AWBURST),
    .m_axi_gmem_AWLOCK(gmem_AWLOCK),
    .m_axi_gmem_AWCACHE(gmem_AWCACHE),
    .m_axi_gmem_AWPROT(gmem_AWPROT),
    .m_axi_gmem_AWQOS(gmem_AWQOS),
    .m_axi_gmem_AWREGION(gmem_AWREGION),
    .m_axi_gmem_AWUSER(gmem_AWUSER),
    .m_axi_gmem_WVALID(gmem_WVALID),
    .m_axi_gmem_WREADY(gmem_WREADY),
    .m_axi_gmem_WDATA(gmem_WDATA),
    .m_axi_gmem_WSTRB(gmem_WSTRB),
    .m_axi_gmem_WLAST(gmem_WLAST),
    .m_axi_gmem_WID(gmem_WID),
    .m_axi_gmem_WUSER(gmem_WUSER),
    .m_axi_gmem_ARVALID(gmem_ARVALID),
    .m_axi_gmem_ARREADY(gmem_ARREADY),
    .m_axi_gmem_ARADDR(gmem_ARADDR),
    .m_axi_gmem_ARID(gmem_ARID),
    .m_axi_gmem_ARLEN(gmem_ARLEN),
    .m_axi_gmem_ARSIZE(gmem_ARSIZE),
    .m_axi_gmem_ARBURST(gmem_ARBURST),
    .m_axi_gmem_ARLOCK(gmem_ARLOCK),
    .m_axi_gmem_ARCACHE(gmem_ARCACHE),
    .m_axi_gmem_ARPROT(gmem_ARPROT),
    .m_axi_gmem_ARQOS(gmem_ARQOS),
    .m_axi_gmem_ARREGION(gmem_ARREGION),
    .m_axi_gmem_ARUSER(gmem_ARUSER),
    .m_axi_gmem_RVALID(gmem_RVALID),
    .m_axi_gmem_RREADY(gmem_RREADY),
    .m_axi_gmem_RDATA(gmem_RDATA),
    .m_axi_gmem_RLAST(gmem_RLAST),
    .m_axi_gmem_RID(gmem_RID),
    .m_axi_gmem_RUSER(gmem_RUSER),
    .m_axi_gmem_RRESP(gmem_RRESP),
    .m_axi_gmem_BVALID(gmem_BVALID),
    .m_axi_gmem_BREADY(gmem_BREADY),
    .m_axi_gmem_BRESP(gmem_BRESP),
    .m_axi_gmem_BID(gmem_BID),
    .m_axi_gmem_BUSER(gmem_BUSER),
    .y_TDATA(y_TDATA),
    .y_TVALID(y_TVALID),
    .y_TREADY(y_TREADY),
    .y_TUSER(y_TUSER),
    .y_TLAST(y_TLAST),
    .x_TDATA(x_TDATA),
    .x_TVALID(x_TVALID),
    .x_TREADY(x_TREADY),
    .x_TUSER(x_TUSER),
    .x_TLAST(x_TLAST));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst_n = AESL_reset;
assign ap_rst_n_n = ~AESL_reset;
assign AESL_reset = rst;
assign AESL_start = start;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
  assign AESL_slave_write_start_in = slave_start_status  & AXILiteS_write_data_finish;
  assign AESL_slave_start = AESL_slave_write_start_finish;
  assign AESL_done = slave_done_status ;

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        slave_start_status <= 1;
    end
    else begin
        if (AESL_start == 1 ) begin
            start_rise = 1;
        end
        if (start_rise == 1 && AESL_done == 1 ) begin
            slave_start_status <= 1;
        end
        if (AESL_slave_write_start_in == 1 && AESL_done == 0) begin 
            slave_start_status <= 0;
            start_rise = 0;
        end
    end
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        AESL_slave_ready <= 0;
        ready_rise = 0;
    end
    else begin
        if (AESL_ready == 1 ) begin
            ready_rise = 1;
        end
        if (ready_rise == 1 && AESL_done_delay == 1 ) begin
            AESL_slave_ready <= 1;
        end
        if (AESL_slave_ready == 1) begin 
            AESL_slave_ready <= 0;
            ready_rise = 0;
        end
    end
end

always @ (posedge AESL_clock)
begin
    if (AESL_done == 1) begin
        slave_done_status <= 0;
    end
    else if (AESL_slave_output_done == 1 ) begin
        slave_done_status <= 1;
    end
end









reg [31:0] ap_c_n_tvin_trans_num_y_data;

reg y_ready_reg; // for self-sync

wire y_ready;
wire y_done;
wire [31:0] y_transaction;
wire axi_s_y_TVALID;
wire axi_s_y_TREADY;

AESL_axi_s_y AESL_AXI_S_y(
    .clk(AESL_clock),
    .reset(AESL_reset),
    .TRAN_y_TDATA(y_TDATA),
    .TRAN_y_TUSER(y_TUSER),
    .TRAN_y_TLAST(y_TLAST),
    .TRAN_y_TVALID(axi_s_y_TVALID),
    .TRAN_y_TREADY(axi_s_y_TREADY),
    .ready(y_ready),
    .done(y_done),
    .transaction(y_transaction));

assign y_ready = 0;
assign y_done = AESL_done;

assign axi_s_y_TVALID = y_TVALID;

reg reg_y_TREADY;
initial begin : gen_reg_y_TREADY_process
    integer proc_rand;
    reg_y_TREADY = axi_s_y_TREADY;
    while(1)
    begin
        @(axi_s_y_TREADY);
        reg_y_TREADY = axi_s_y_TREADY;
    end
end


assign y_TREADY = reg_y_TREADY;
reg [31:0] ap_c_n_tvin_trans_num_x_data;

reg x_ready_reg; // for self-sync

wire x_ready;
wire x_done;
wire [31:0] x_transaction;
wire axi_s_x_TVALID;
wire axi_s_x_TREADY;

AESL_axi_s_x AESL_AXI_S_x(
    .clk(AESL_clock),
    .reset(AESL_reset),
    .TRAN_x_TDATA(x_TDATA),
    .TRAN_x_TUSER(x_TUSER),
    .TRAN_x_TLAST(x_TLAST),
    .TRAN_x_TVALID(axi_s_x_TVALID),
    .TRAN_x_TREADY(axi_s_x_TREADY),
    .ready(x_ready),
    .done(x_done),
    .transaction(x_transaction));

assign x_ready = ready;
assign x_done = 0;

assign x_TVALID = axi_s_x_TVALID;

assign axi_s_x_TREADY = x_TREADY;

wire    AESL_axi_master_gmem_ready;
wire    AESL_axi_master_gmem_done;
wire [32 - 1:0] coe;
wire [32 - 1:0] ctrl;
AESL_axi_master_gmem AESL_AXI_MASTER_gmem(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_gmem_AWVALID (gmem_AWVALID),
    .TRAN_gmem_AWREADY (gmem_AWREADY),
    .TRAN_gmem_AWADDR (gmem_AWADDR),
    .TRAN_gmem_AWID (gmem_AWID),
    .TRAN_gmem_AWLEN (gmem_AWLEN),
    .TRAN_gmem_AWSIZE (gmem_AWSIZE),
    .TRAN_gmem_AWBURST (gmem_AWBURST),
    .TRAN_gmem_AWLOCK (gmem_AWLOCK),
    .TRAN_gmem_AWCACHE (gmem_AWCACHE),
    .TRAN_gmem_AWPROT (gmem_AWPROT),
    .TRAN_gmem_AWQOS (gmem_AWQOS),
    .TRAN_gmem_AWREGION (gmem_AWREGION),
    .TRAN_gmem_AWUSER (gmem_AWUSER),
    .TRAN_gmem_WVALID (gmem_WVALID),
    .TRAN_gmem_WREADY (gmem_WREADY),
    .TRAN_gmem_WDATA (gmem_WDATA),
    .TRAN_gmem_WSTRB (gmem_WSTRB),
    .TRAN_gmem_WLAST (gmem_WLAST),
    .TRAN_gmem_WID (gmem_WID),
    .TRAN_gmem_WUSER (gmem_WUSER),
    .TRAN_gmem_ARVALID (gmem_ARVALID),
    .TRAN_gmem_ARREADY (gmem_ARREADY),
    .TRAN_gmem_ARADDR (gmem_ARADDR),
    .TRAN_gmem_ARID (gmem_ARID),
    .TRAN_gmem_ARLEN (gmem_ARLEN),
    .TRAN_gmem_ARSIZE (gmem_ARSIZE),
    .TRAN_gmem_ARBURST (gmem_ARBURST),
    .TRAN_gmem_ARLOCK (gmem_ARLOCK),
    .TRAN_gmem_ARCACHE (gmem_ARCACHE),
    .TRAN_gmem_ARPROT (gmem_ARPROT),
    .TRAN_gmem_ARQOS (gmem_ARQOS),
    .TRAN_gmem_ARREGION (gmem_ARREGION),
    .TRAN_gmem_ARUSER (gmem_ARUSER),
    .TRAN_gmem_RVALID (gmem_RVALID),
    .TRAN_gmem_RREADY (gmem_RREADY),
    .TRAN_gmem_RDATA (gmem_RDATA),
    .TRAN_gmem_RLAST (gmem_RLAST),
    .TRAN_gmem_RID (gmem_RID),
    .TRAN_gmem_RUSER (gmem_RUSER),
    .TRAN_gmem_RRESP (gmem_RRESP),
    .TRAN_gmem_BVALID (gmem_BVALID),
    .TRAN_gmem_BREADY (gmem_BREADY),
    .TRAN_gmem_BRESP (gmem_BRESP),
    .TRAN_gmem_BID (gmem_BID),
    .TRAN_gmem_BUSER (gmem_BUSER),
    .TRAN_gmem_coe (coe),
    .TRAN_gmem_ctrl (ctrl),
    .ready (AESL_axi_master_gmem_ready),
    .done  (AESL_axi_master_gmem_done)
);
assign    AESL_axi_master_gmem_ready    =   ready;
assign    AESL_axi_master_gmem_done    =   AESL_done_delay;

AESL_axi_slave_AXILiteS AESL_AXI_SLAVE_AXILiteS(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_s_axi_AXILiteS_AWADDR (AXILiteS_AWADDR),
    .TRAN_s_axi_AXILiteS_AWVALID (AXILiteS_AWVALID),
    .TRAN_s_axi_AXILiteS_AWREADY (AXILiteS_AWREADY),
    .TRAN_s_axi_AXILiteS_WVALID (AXILiteS_WVALID),
    .TRAN_s_axi_AXILiteS_WREADY (AXILiteS_WREADY),
    .TRAN_s_axi_AXILiteS_WDATA (AXILiteS_WDATA),
    .TRAN_s_axi_AXILiteS_WSTRB (AXILiteS_WSTRB),
    .TRAN_s_axi_AXILiteS_ARADDR (AXILiteS_ARADDR),
    .TRAN_s_axi_AXILiteS_ARVALID (AXILiteS_ARVALID),
    .TRAN_s_axi_AXILiteS_ARREADY (AXILiteS_ARREADY),
    .TRAN_s_axi_AXILiteS_RVALID (AXILiteS_RVALID),
    .TRAN_s_axi_AXILiteS_RREADY (AXILiteS_RREADY),
    .TRAN_s_axi_AXILiteS_RDATA (AXILiteS_RDATA),
    .TRAN_s_axi_AXILiteS_RRESP (AXILiteS_RRESP),
    .TRAN_s_axi_AXILiteS_BVALID (AXILiteS_BVALID),
    .TRAN_s_axi_AXILiteS_BREADY (AXILiteS_BREADY),
    .TRAN_s_axi_AXILiteS_BRESP (AXILiteS_BRESP),
    .TRAN_AXILiteS_interrupt (AXILiteS_INTERRUPT),
    .TRAN_coe (coe),
    .TRAN_ctrl (ctrl),
    .TRAN_AXILiteS_write_data_finish(AXILiteS_write_data_finish),
    .TRAN_AXILiteS_ready_out (AESL_ready),
    .TRAN_AXILiteS_ready_in (AESL_slave_ready),
    .TRAN_AXILiteS_done_out (AESL_slave_output_done),
    .TRAN_AXILiteS_idle_out (AESL_idle),
    .TRAN_AXILiteS_write_start_in     (AESL_slave_write_start_in),
    .TRAN_AXILiteS_write_start_finish (AESL_slave_write_start_finish),
    .TRAN_AXILiteS_transaction_done_in (AESL_done_delay),
    .TRAN_AXILiteS_start_in  (AESL_slave_start)
);

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 1);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (~AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        integer fp1;
        integer fp2;
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
    fp1 = $fopen("./rtl.x_order_fir.autotvout_y_data.dat", "r");
    fp2 = $fopen("./impl_rtl.x_order_fir.autotvout_y_data.dat", "r");
    if(fp1 == 0)        // Failed to open file
        $display("Failed to open file \"./rtl.x_order_fir.autotvout_y_data.dat\"!");
    else if(fp2 == 0)
        $display("Failed to open file \"./impl_rtl.x_order_fir.autotvout_y_data.dat\"!");
    else begin
        $display("Comparing rtl.x_order_fir.autotvout_y_data.dat with impl_rtl.x_order_fir.autotvout_y_data.dat");
        post_check(fp1, fp2);
    end
    $fclose(fp1);
    $fclose(fp2);
    fp1 = $fopen("./rtl.x_order_fir.autotvout_y_user_V.dat", "r");
    fp2 = $fopen("./impl_rtl.x_order_fir.autotvout_y_user_V.dat", "r");
    if(fp1 == 0)        // Failed to open file
        $display("Failed to open file \"./rtl.x_order_fir.autotvout_y_user_V.dat\"!");
    else if(fp2 == 0)
        $display("Failed to open file \"./impl_rtl.x_order_fir.autotvout_y_user_V.dat\"!");
    else begin
        $display("Comparing rtl.x_order_fir.autotvout_y_user_V.dat with impl_rtl.x_order_fir.autotvout_y_user_V.dat");
        post_check(fp1, fp2);
    end
    $fclose(fp1);
    $fclose(fp2);
    fp1 = $fopen("./rtl.x_order_fir.autotvout_y_last_V.dat", "r");
    fp2 = $fopen("./impl_rtl.x_order_fir.autotvout_y_last_V.dat", "r");
    if(fp1 == 0)        // Failed to open file
        $display("Failed to open file \"./rtl.x_order_fir.autotvout_y_last_V.dat\"!");
    else if(fp2 == 0)
        $display("Failed to open file \"./impl_rtl.x_order_fir.autotvout_y_last_V.dat\"!");
    else begin
        $display("Comparing rtl.x_order_fir.autotvout_y_last_V.dat with impl_rtl.x_order_fir.autotvout_y_last_V.dat");
        post_check(fp1, fp2);
    end
    $fclose(fp1);
    $fclose(fp2);
        $display("Simulation Passed.");
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_gmem;
reg [31:0] size_gmem;
reg [31:0] size_gmem_backup;
reg end_y_data;
reg [31:0] size_y_data;
reg [31:0] size_y_data_backup;
reg end_y_user_V;
reg [31:0] size_y_user_V;
reg [31:0] size_y_user_V_backup;
reg end_y_last_V;
reg [31:0] size_y_last_V;
reg [31:0] size_y_last_V_backup;
reg end_x_data;
reg [31:0] size_x_data;
reg [31:0] size_x_data_backup;
reg end_x_user_V;
reg [31:0] size_x_user_V;
reg [31:0] size_x_user_V_backup;
reg end_x_last_V;
reg [31:0] size_x_last_V;
reg [31:0] size_x_last_V_backup;
reg end_coe;
reg [31:0] size_coe;
reg [31:0] size_coe_backup;
reg end_ctrl;
reg [31:0] size_ctrl;
reg [31:0] size_ctrl_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 0;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    rst = 1;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 1);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt >= AUTOTB_TRANSACTION_NUM) begin
            // keep pushing garbage in
            #0 start = 1;
        end
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
    
    initial begin : proc_gen_axis_internal_ready_x
        x_ready_reg = 0;
        @ (posedge ready_initial);
        forever begin
            @ (ap_c_n_tvin_trans_num_x_data or x_transaction);
            if (ap_c_n_tvin_trans_num_x_data > x_transaction) begin
                x_ready_reg = 1;
            end else begin
                x_ready_reg = 0;
            end
        end
    end
    
    `define STREAM_SIZE_IN_x_data "./stream_size_in_x_data.dat"
    
    initial begin : gen_ap_c_n_tvin_trans_num_x_data
        integer fp_x_data;
        reg [127:0] token_x_data;
        integer ret;
        
        ap_c_n_tvin_trans_num_x_data = 0;
        end_x_data = 0;
        wait (AESL_reset === 1);
        
        fp_x_data = $fopen(`AUTOTB_TVIN_x_data, "r");
        if(fp_x_data == 0) begin
            $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_x_data);
            $finish;
        end
        read_token(fp_x_data, token_x_data); // should be [[[runtime]]]
        if (token_x_data != "[[[runtime]]]") begin
            $display("ERROR: token_x_data != \"[[[runtime]]]\"");
            $finish;
        end
        ap_c_n_tvin_trans_num_x_data = ap_c_n_tvin_trans_num_x_data + 1;
        read_token(fp_x_data, token_x_data); // should be [[transaction]] or [[[/runtime]]]
        if (token_x_data == "[[[/runtime]]]") begin
            $fclose(fp_x_data);
            end_x_data = 1;
        end else begin
            end_x_data = 0;
            read_token(fp_x_data, token_x_data); // should be transaction number
            read_token(fp_x_data, token_x_data);
        end
        while (token_x_data == "[[/transaction]]" && end_x_data == 0) begin
            ap_c_n_tvin_trans_num_x_data = ap_c_n_tvin_trans_num_x_data + 1;
            read_token(fp_x_data, token_x_data); // should be [[transaction]] or [[[/runtime]]]
            if (token_x_data == "[[[/runtime]]]") begin
                $fclose(fp_x_data);
                end_x_data = 1;
            end else begin
                end_x_data = 0;
                read_token(fp_x_data, token_x_data); // should be transaction number
                read_token(fp_x_data, token_x_data);
            end
        end
        forever begin
            @ (posedge AESL_clock);
            if (end_x_data == 0) begin
                if ((x_TREADY & x_TVALID) == 1) begin
                    read_token(fp_x_data, token_x_data);
                    while (token_x_data == "[[/transaction]]" && end_x_data == 0) begin
                        ap_c_n_tvin_trans_num_x_data = ap_c_n_tvin_trans_num_x_data + 1;
                        read_token(fp_x_data, token_x_data); // should be [[transaction]] or [[[/runtime]]]
                        if (token_x_data == "[[[/runtime]]]") begin
                            $fclose(fp_x_data);
                            end_x_data = 1;
                        end else begin
                            end_x_data = 0;
                            read_token(fp_x_data, token_x_data); // should be transaction number
                            read_token(fp_x_data, token_x_data);
                        end
                    end
                end
            end else begin
                ap_c_n_tvin_trans_num_x_data = ap_c_n_tvin_trans_num_x_data + 1;
            end
        end
    end
    

reg dump_tvout_finish_y_data;

initial begin : dump_tvout_runtime_sign_y_data
    integer fp;
    dump_tvout_finish_y_data = 0;
    fp = $fopen(`AUTOTB_TVOUT_y_data_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_data_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_y_data_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_data_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_y_data = 1;
end


reg dump_tvout_finish_y_user_V;

initial begin : dump_tvout_runtime_sign_y_user_V
    integer fp;
    dump_tvout_finish_y_user_V = 0;
    fp = $fopen(`AUTOTB_TVOUT_y_user_V_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_user_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_y_user_V_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_user_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_y_user_V = 1;
end


reg dump_tvout_finish_y_last_V;

initial begin : dump_tvout_runtime_sign_y_last_V
    integer fp;
    dump_tvout_finish_y_last_V = 0;
    fp = $fopen(`AUTOTB_TVOUT_y_last_V_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_last_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_y_last_V_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_last_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_y_last_V = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    clk_cnt <= clk_cnt + 1;
    AESL_ready_p1 <= AESL_ready;
    AESL_start_p1 <= AESL_start;
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
event report_progress;

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 1);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 1);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = finish_timestamp[i] - start_timestamp[i]+1;
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif

endmodule
