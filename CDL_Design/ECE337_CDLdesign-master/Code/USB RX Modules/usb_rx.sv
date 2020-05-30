// $Id: $
// File name:   usb_rx.sv
// Created:     11/12/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: USB Receiver (RX) Module
module usb_rx(input wire clk,
              input wire n_rst,
              input wire d_plus,
              input wire d_minus,
              output reg [2:0] rx_packet,
              output reg [7:0] rx_packet_data,
              output reg store_rx_packet_data);
reg d_plus_sync;
reg d_minus_sync;
reg d_orig;
reg enable_timer;
reg shift_enable;
reg shift_enable_const;
reg invalid_bit;
reg eop;
reg byte_complete;
reg [7:0] Packet_Data;
reg [1:0] sync_status;
reg [2:0] pid_status;
reg [1:0] crc_status;
reg check_sync;
reg check_pid;
reg load_sync;
reg load_pid;
reg load_error;
reg load_done;
reg crc_check_5;
reg crc_check_16;
reg d_edge;
reg [4:0] crc_5bit;
reg [15:0] crc_16bit;


sync_high sh1 (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));

sync_low sl1 (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));

start_bit_det SBD (.clk(clk), .n_rst(n_rst), .serial_in(d_plus_sync), .start_bit_detected(d_edge));

rcu R1 (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .pid(pid), .byte_complete(byte_complete), .eop(eop), .crc_check_5(check_crc_5), 
        .crc_check_16(check_crc_16), .sync_status(sync_status), .pid_status(pid_status), .crc_status(crc_status), .enable_timer(enable_timer), .check_pid(check_pid), .check_sync(check_sync), 
        .load_sync(load_sync), .load_pid(load_pid), .load_data(load_data), .load_error(load_error), .load_done(load_done));

rx_data_buffer RDB (.clk(clk), .n_rst(n_rst), .byte_complete(byte_complete), .Packet_Data(Packet_Data), .clear(1'b0), .load_data(load_data), 
                    .load_sync(load_sync), .load_pid(load_pid), .load_error(load_error), .load_done(load_done), 
                    .check_sync(check_sync), .check_pid(check_pid), .crc_check_5(crc_check_5), .crc_check_16(crc_check_16),   
                     .crc_5bit(crc_5bit), .crc_16bit(crc_16bit), .sync_status(sync_status), .pid_status(pid_status), .rx_packet(rx_packet), 
                    .rx_packet_data(rx_packet_data), .store_rx_packet_data(store_rx_packet_data));

decoder D1 (.clk(clk), .n_rst(n_rst), .d_plus_sync(d_plus_sync), .shift_enable(shift_enable_const), .d_orig(d_orig));

bit_stuffer_detector BSD (.clk(clk), .n_rst(n_rst), .d_orig(d_orig), .shift_enable(shift_enable), .invalid_bit(invalid_bit));

sr_8bit SR8 (.clk(clk), .n_rst(n_rst), .d_orig(d_orig), .shift_enable(shift_enable), .Packet_Data(Packet_Data));

timer T1 (.clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .invalid_bit(invalid_bit), .shift_enable(shift_enable), 
          .shift_enable_const(shift_enable_const), .byte_complete(byte_complete));

eop_detector ED1 (.clk(clk), .n_rst(n_rst), .d_plus_sync(d_plus_sync), .d_minus_sync(d_minus_sync), .shift_enable(shift_enable), .eop(eop));

CDL_CRC_16 C16 (.clk(clk), .n_rst(n_rst), .input_data(d_orig), .reset_crc(1'b0), .inverted_crc(crc_16bit));

CDL_CRC_5 C5 (.clk(clk), .n_rst(n_rst), .input_data(d_orig), .reset_crc(1'b0), .inverted_crc(crc_5bit));


endmodule
