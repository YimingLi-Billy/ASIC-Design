// $Id: $
// File name:   rx_data_buffer.sv
// Created:     11/11/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: RX Data Buffer
module rx_data_buffer(input wire clk,
                      input wire n_rst,
                      input wire byte_complete,
                      input wire [7:0] Packet_Data,
                      input wire clear,
                      input wire load_data,
                      input wire load_sync, 
                      input wire load_pid,
                      input wire load_error, // responsible for rx_packet_outputs
                      input wire load_done, // responsible for rx_packet_outputs
                      input wire check_sync, // once the data is in it needs to be checked
                      input wire check_pid, // once the pid is in it needs to be checked
                      input wire crc_check_5, // once the pid is in it needs to be checked.
                      input wire crc_check_16,
                      input wire [4:0] crc_5bit,
                      input wire [15:0] crc_16bit,
                      output reg [1:0] sync_status,
                      output reg [2:0] pid_status,
                      output reg [1:0] crc_status,
                      output reg [2:0] rx_packet,
                      output reg [7:0] rx_packet_data,
                      output reg store_rx_packet_data);
// This is the hub where all data is sent and verified before being sent out to the external modules. Everything from the sync byte, the pid, the crc, and so on are checked here
// and then a proper output is determined based on this response. This module is largely not resposible for knowing how the process works, but receives inputs from the rcu and the
// timer to determine what needs to be checked and when. It also reports back to the rcu so that the rcu can respond appropriately.
localparam IDLE = 3'b000;
localparam IN = 3'b001;
localparam OUT = 3'b010;
localparam ACK = 3'b011;
localparam ERROR = 3'b100;
localparam DONE = 3'b101;
localparam NACK = 3'b110;

reg [7:0] next_pid; 
reg [7:0] temp_pid;
reg [7:0] pid;
reg [7:0] sync_byte;
reg [7:0] next_rx_packet_data;
reg next_store_rx_packet_data;
reg [2:0] next_rx_packet;

always_ff @ (posedge clk, negedge n_rst) 
begin
  if(n_rst == 1'b0) begin
    pid <= 8'b0;
    rx_packet_data <= 8'b0;
    rx_packet <= IDLE;
  end
  else begin
    pid <= next_pid;
    rx_packet_data <= next_rx_packet_data;
    store_rx_packet_data <= next_store_rx_packet_data;
    rx_packet <= next_rx_packet;
  end
end


always_comb 
begin : PACKET_DATA_LOGIC
  next_pid = pid;
  temp_pid = pid;
  sync_byte = 8'b0;
  next_rx_packet_data = rx_packet_data;
  if(byte_complete && load_pid) begin
    next_pid = Packet_Data;
    temp_pid = Packet_Data;  
  end
  if(byte_complete && load_data) begin
    next_rx_packet_data = Packet_Data;
    next_store_rx_packet_data = 1'b1;
  end
  else begin
    next_store_rx_packet_data = 1'b0;    
  end
  if(load_sync && byte_complete) begin
      sync_byte = Packet_Data;
  end
end

always_comb 
begin : ERROR_CHECKING_LOGIC
 if(check_pid) begin
    if(temp_pid[0] != !temp_pid[4] || temp_pid[1] != !temp_pid[5] || temp_pid[2] != !temp_pid[6] || temp_pid[3] != !temp_pid[7]) begin
       pid_status = 3'b100;
    end
    else if((temp_pid[7:4] == 4'b0001) || (temp_pid == 4'b1001)) begin   
       pid_status = 3'b001;
    end
    else if((temp_pid[7:4] == 4'b0011) || (temp_pid == 4'b1011)) begin
       pid_status = 3'b010;
    end
    else if((temp_pid[7:4] == 4'b0010) || (temp_pid[7:4] == 4'b1010) || (temp_pid[7:4] == 4'b1110)) begin
      pid_status = 3'b011;
    end
    else begin
      pid_status = 3'b000;
    end
 end
 else begin
    pid_status = 3'b000;
 end
 if(check_sync) begin
    if(sync_byte == 8'b10000000) begin
       sync_status = 2'b01;
    end
    else begin
      sync_status = 2'b10;
    end
 end
 else begin
    sync_status = 2'b0;
 end

 if(crc_check_5) begin
     if(crc_5bit == 5'b01100) begin
       crc_status = 2'b01;
     end
     else begin
       crc_status = 2'b0;
     end
 end
 else if(crc_check_16) begin
   if(crc_16bit == 16'hFFFF) begin
     crc_status = 2'b0;      
   end 
   else if(crc_16bit == 16'b1000000000001101) begin
    crc_status = 2'b01;
   end
   else begin
    crc_status = 2'b01;
   end
 end
 else begin
   crc_status = 2'b0;
 end
end

always_comb 
begin : RX_PACKET_LOGIC
  next_rx_packet = rx_packet;
  if(pid[7:4] == 4'b1001) begin
     next_rx_packet = IN;
  end
  else if(pid[7:4] == 4'b0001) begin
     next_rx_packet = OUT;
  end
  else if(load_error) begin
    next_rx_packet = ERROR;
  end
  else if(pid[7:4] == 4'b0010) begin
    next_rx_packet = ACK;
  end
  else if(pid[7:4] == 4'b1010) begin
    next_rx_packet = NACK;
  end
  else if(load_done) begin
    next_rx_packet = DONE;
  end
end
endmodule