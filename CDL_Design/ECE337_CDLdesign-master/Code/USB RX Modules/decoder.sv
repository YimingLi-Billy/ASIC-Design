// $Id: $
// File name:   decoder.sv
// Created:     11/11/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decoder Module for USB RX
module decoder(input wire clk,
               input wire n_rst,
               input wire d_plus_sync,
               input wire shift_enable,
               output reg d_orig);
reg next_d_plus_sync;
reg next_d_orig;

always_ff @ (posedge clk, negedge n_rst) 
begin
  if(n_rst == 1'b0) begin
    next_d_plus_sync <= 1'b1;
    d_orig <= 1'b1;
  end
  else begin
    next_d_plus_sync <= d_plus_sync;
    d_orig <= next_d_orig;
  end
end

always_comb 
begin
  next_d_orig = d_orig;
  if(next_d_plus_sync == d_plus_sync) begin
     next_d_orig = 1'b1;
  end
  else begin
    next_d_orig = 1'b0;
  end
end
endmodule