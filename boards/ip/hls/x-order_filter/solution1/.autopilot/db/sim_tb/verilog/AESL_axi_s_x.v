// ==============================================================
// File generated on Mon Oct 07 02:00:09 +0800 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

`define TV_IN_x_TDATA "./c.x_order_fir.autotvin_x_data.dat"
`define TV_IN_x_TUSER "./c.x_order_fir.autotvin_x_user_V.dat"
`define TV_IN_x_TLAST "./c.x_order_fir.autotvin_x_last_V.dat"

`define AUTOTB_TRANSACTION_NUM 600

module AESL_axi_s_x (
    input clk,
    input reset,
    output [32 - 1:0] TRAN_x_TDATA,
    output TRAN_x_TUSER,
    output TRAN_x_TLAST,
    output TRAN_x_TVALID,
    input TRAN_x_TREADY,
    input ready,
    input done,
    output [31:0] transaction);

    wire TRAN_x_TVALID_temp;
    wire x_TDATA_full;
    wire x_TDATA_empty;
    reg x_TDATA_write_en;
    reg [32 - 1:0] x_TDATA_write_data;
    reg x_TDATA_read_en;
    wire [32 - 1:0] x_TDATA_read_data;
    
    fifo #(1, 32) fifo_x_TDATA (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(x_TDATA_write_en),
        .write_data(x_TDATA_write_data),
        .read_clock(clk),
        .read_en(x_TDATA_read_en),
        .read_data(x_TDATA_read_data),
        .full(x_TDATA_full),
        .empty(x_TDATA_empty));
    
    always @ (*) begin
        x_TDATA_write_en <= 0;
        x_TDATA_read_en <= TRAN_x_TREADY & TRAN_x_TVALID;
    end
    
    assign TRAN_x_TDATA = x_TDATA_read_data;
    wire x_TUSER_full;
    wire x_TUSER_empty;
    reg x_TUSER_write_en;
    reg [1 - 1:0] x_TUSER_write_data;
    reg x_TUSER_read_en;
    wire [1 - 1:0] x_TUSER_read_data;
    
    fifo #(1, 1) fifo_x_TUSER (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(x_TUSER_write_en),
        .write_data(x_TUSER_write_data),
        .read_clock(clk),
        .read_en(x_TUSER_read_en),
        .read_data(x_TUSER_read_data),
        .full(x_TUSER_full),
        .empty(x_TUSER_empty));
    
    always @ (*) begin
        x_TUSER_write_en <= 0;
        x_TUSER_read_en <= TRAN_x_TREADY & TRAN_x_TVALID;
    end
    
    assign TRAN_x_TUSER = x_TUSER_read_data;
    wire x_TLAST_full;
    wire x_TLAST_empty;
    reg x_TLAST_write_en;
    reg [1 - 1:0] x_TLAST_write_data;
    reg x_TLAST_read_en;
    wire [1 - 1:0] x_TLAST_read_data;
    
    fifo #(1, 1) fifo_x_TLAST (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(x_TLAST_write_en),
        .write_data(x_TLAST_write_data),
        .read_clock(clk),
        .read_en(x_TLAST_read_en),
        .read_data(x_TLAST_read_data),
        .full(x_TLAST_full),
        .empty(x_TLAST_empty));
    
    always @ (*) begin
        x_TLAST_write_en <= 0;
        x_TLAST_read_en <= TRAN_x_TREADY & TRAN_x_TVALID;
    end
    
    assign TRAN_x_TLAST = x_TLAST_read_data;
    assign TRAN_x_TVALID = TRAN_x_TVALID_temp;

    
    assign TRAN_x_TVALID_temp = ~(x_TDATA_empty || x_TUSER_empty || x_TLAST_empty);
    
    function is_blank_char(input [7:0] in_char);
        if (in_char == " " || in_char == "\011" || in_char == "\012" || in_char == "\015") begin
            is_blank_char = 1;
        end else begin
            is_blank_char = 0;
        end
    endfunction
    
    function [199:0] read_token(input integer fp);
        integer ret;
        begin
            read_token = "";
                    ret = 0;
                    ret = $fscanf(fp,"%s",read_token);
        end
    endfunction
    
    function [199:0] rm_0x(input [199:0] token);
        reg [199:0] token_tmp;
        integer i;
        begin
            token_tmp = "";
            for (i = 0; token[15:0] != "0x"; token = token >> 8) begin
                token_tmp = (token[7:0] << (8 * i)) | token_tmp;
                i = i + 1;
            end
            rm_0x = token_tmp;
        end
    endfunction
    
    reg [31:0] transaction_load_x_TDATA;
    
    assign transaction = transaction_load_x_TDATA;
    
    initial begin : AXI_stream_driver_x_TDATA
        integer fp;
        reg [199:0] token;
        reg [32 - 1:0] data;
        reg [199:0] data_integer;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_x_TDATA = 0;
        fifo_x_TDATA.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_x_TDATA, "r");
        if (fp == 0) begin
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_x_TDATA);
            $finish;
        end
        token = read_token(fp);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    fifo_x_TDATA.clear();
                    token = read_token(fp);
                    while (token != "[[/transaction]]") begin
                        if (fifo_x_TDATA.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_x_TDATA.push(data);
                        token = read_token(fp);
                    end
                    token = read_token(fp);
                    fifo_x_TDATA.snapshot();
                end else begin
                    fifo_x_TDATA.restore();
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                end
                transaction_load_x_TDATA = transaction_load_x_TDATA + 1;
            end
        end
    end
    
    reg [31:0] transaction_load_x_TUSER;
    
    initial begin : AXI_stream_driver_x_TUSER
        integer fp;
        reg [199:0] token;
        reg [1 - 1:0] data;
        reg [199:0] data_integer;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_x_TUSER = 0;
        fifo_x_TUSER.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_x_TUSER, "r");
        if (fp == 0) begin
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_x_TUSER);
            $finish;
        end
        token = read_token(fp);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    fifo_x_TUSER.clear();
                    token = read_token(fp);
                    while (token != "[[/transaction]]") begin
                        if (fifo_x_TUSER.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_x_TUSER.push(data);
                        token = read_token(fp);
                    end
                    token = read_token(fp);
                    fifo_x_TUSER.snapshot();
                end else begin
                    fifo_x_TUSER.restore();
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                end
                transaction_load_x_TUSER = transaction_load_x_TUSER + 1;
            end
        end
    end
    
    reg [31:0] transaction_load_x_TLAST;
    
    initial begin : AXI_stream_driver_x_TLAST
        integer fp;
        reg [199:0] token;
        reg [1 - 1:0] data;
        reg [199:0] data_integer;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_x_TLAST = 0;
        fifo_x_TLAST.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_x_TLAST, "r");
        if (fp == 0) begin
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_x_TLAST);
            $finish;
        end
        token = read_token(fp);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    fifo_x_TLAST.clear();
                    token = read_token(fp);
                    while (token != "[[/transaction]]") begin
                        if (fifo_x_TLAST.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_x_TLAST.push(data);
                        token = read_token(fp);
                    end
                    token = read_token(fp);
                    fifo_x_TLAST.snapshot();
                end else begin
                    fifo_x_TLAST.restore();
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                end
                transaction_load_x_TLAST = transaction_load_x_TLAST + 1;
            end
        end
    end

endmodule
