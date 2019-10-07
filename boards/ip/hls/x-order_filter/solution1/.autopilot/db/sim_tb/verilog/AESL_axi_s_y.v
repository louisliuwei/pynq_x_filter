// ==============================================================
// File generated on Mon Oct 07 02:00:09 +0800 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

`define TV_OUT_y_TDATA "./impl_rtl.x_order_fir.autotvout_y_data.dat"
`define TV_OUT_y_TUSER "./impl_rtl.x_order_fir.autotvout_y_user_V.dat"
`define TV_OUT_y_TLAST "./impl_rtl.x_order_fir.autotvout_y_last_V.dat"

`define AUTOTB_TRANSACTION_NUM 600

module AESL_axi_s_y (
    input clk,
    input reset,
    input [32 - 1:0] TRAN_y_TDATA,
    input TRAN_y_TUSER,
    input TRAN_y_TLAST,
    input TRAN_y_TVALID,
    output TRAN_y_TREADY,
    input ready,
    input done,
    output [31:0] transaction);

    wire TRAN_y_TVALID_temp;
    wire y_TDATA_full;
    wire y_TDATA_empty;
    reg y_TDATA_write_en;
    reg [32 - 1:0] y_TDATA_write_data;
    reg y_TDATA_read_en;
    wire [32 - 1:0] y_TDATA_read_data;
    
    fifo #(1, 32) fifo_y_TDATA (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(y_TDATA_write_en),
        .write_data(y_TDATA_write_data),
        .read_clock(clk),
        .read_en(y_TDATA_read_en),
        .read_data(y_TDATA_read_data),
        .full(y_TDATA_full),
        .empty(y_TDATA_empty));
    
    always @ (*) begin
        y_TDATA_write_en <= TRAN_y_TVALID;
        y_TDATA_write_data <= TRAN_y_TDATA;
        y_TDATA_read_en <= 0;
    end
    wire y_TUSER_full;
    wire y_TUSER_empty;
    reg y_TUSER_write_en;
    reg [1 - 1:0] y_TUSER_write_data;
    reg y_TUSER_read_en;
    wire [1 - 1:0] y_TUSER_read_data;
    
    fifo #(1, 1) fifo_y_TUSER (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(y_TUSER_write_en),
        .write_data(y_TUSER_write_data),
        .read_clock(clk),
        .read_en(y_TUSER_read_en),
        .read_data(y_TUSER_read_data),
        .full(y_TUSER_full),
        .empty(y_TUSER_empty));
    
    always @ (*) begin
        y_TUSER_write_en <= TRAN_y_TVALID;
        y_TUSER_write_data <= TRAN_y_TUSER;
        y_TUSER_read_en <= 0;
    end
    wire y_TLAST_full;
    wire y_TLAST_empty;
    reg y_TLAST_write_en;
    reg [1 - 1:0] y_TLAST_write_data;
    reg y_TLAST_read_en;
    wire [1 - 1:0] y_TLAST_read_data;
    
    fifo #(1, 1) fifo_y_TLAST (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(y_TLAST_write_en),
        .write_data(y_TLAST_write_data),
        .read_clock(clk),
        .read_en(y_TLAST_read_en),
        .read_data(y_TLAST_read_data),
        .full(y_TLAST_full),
        .empty(y_TLAST_empty));
    
    always @ (*) begin
        y_TLAST_write_en <= TRAN_y_TVALID;
        y_TLAST_write_data <= TRAN_y_TLAST;
        y_TLAST_read_en <= 0;
    end
    assign TRAN_y_TVALID = TRAN_y_TVALID_temp;

    
    assign TRAN_y_TREADY = ~(y_TDATA_full || y_TUSER_full || y_TLAST_full);
    
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
    
    reg done_1;
    
    always @ (posedge clk or reset) begin
        if (~reset) begin
            done_1 <= 0;
        end else begin
            done_1 <= done;
        end
    end
    
    reg [31:0] transaction_save_y_TDATA;
    
    assign transaction = transaction_save_y_TDATA;
    
    initial begin : AXI_stream_receiver_y_TDATA
        integer fp;
        reg [32 - 1:0] data;
        reg [8 * 5:1] str;
        
        transaction_save_y_TDATA = 0;
        fifo_y_TDATA.clear();
        wait (reset === 1);
        forever begin
            @ (negedge clk);
            if (done_1 == 1) begin
                fp = $fopen(`TV_OUT_y_TDATA, "a");
                if (fp == 0) begin // Failed to open file
                    $display("ERROR: Failed to open file \"%s\"!", `TV_OUT_y_TDATA);
                    $finish;
                end
                $fdisplay(fp, "[[transaction]] %d", transaction_save_y_TDATA);
                while (~fifo_y_TDATA.empty) begin
                    fifo_y_TDATA.pop(data);
                    $fdisplay(fp, "0x%x", data);
                end
                $fdisplay(fp, "[[/transaction]]");
                transaction_save_y_TDATA = transaction_save_y_TDATA + 1;
                fifo_y_TDATA.clear();
                $fclose(fp);
            end
        end
    end
    
    reg [31:0] transaction_save_y_TUSER;
    
    initial begin : AXI_stream_receiver_y_TUSER
        integer fp;
        reg [1 - 1:0] data;
        reg [8 * 5:1] str;
        
        transaction_save_y_TUSER = 0;
        fifo_y_TUSER.clear();
        wait (reset === 1);
        forever begin
            @ (negedge clk);
            if (done_1 == 1) begin
                fp = $fopen(`TV_OUT_y_TUSER, "a");
                if (fp == 0) begin // Failed to open file
                    $display("ERROR: Failed to open file \"%s\"!", `TV_OUT_y_TUSER);
                    $finish;
                end
                $fdisplay(fp, "[[transaction]] %d", transaction_save_y_TUSER);
                while (~fifo_y_TUSER.empty) begin
                    fifo_y_TUSER.pop(data);
                    $fdisplay(fp, "0x%x", data);
                end
                $fdisplay(fp, "[[/transaction]]");
                transaction_save_y_TUSER = transaction_save_y_TUSER + 1;
                fifo_y_TUSER.clear();
                $fclose(fp);
            end
        end
    end
    
    reg [31:0] transaction_save_y_TLAST;
    
    initial begin : AXI_stream_receiver_y_TLAST
        integer fp;
        reg [1 - 1:0] data;
        reg [8 * 5:1] str;
        
        transaction_save_y_TLAST = 0;
        fifo_y_TLAST.clear();
        wait (reset === 1);
        forever begin
            @ (negedge clk);
            if (done_1 == 1) begin
                fp = $fopen(`TV_OUT_y_TLAST, "a");
                if (fp == 0) begin // Failed to open file
                    $display("ERROR: Failed to open file \"%s\"!", `TV_OUT_y_TLAST);
                    $finish;
                end
                $fdisplay(fp, "[[transaction]] %d", transaction_save_y_TLAST);
                while (~fifo_y_TLAST.empty) begin
                    fifo_y_TLAST.pop(data);
                    $fdisplay(fp, "0x%x", data);
                end
                $fdisplay(fp, "[[/transaction]]");
                transaction_save_y_TLAST = transaction_save_y_TLAST + 1;
                fifo_y_TLAST.clear();
                $fclose(fp);
            end
        end
    end

endmodule
