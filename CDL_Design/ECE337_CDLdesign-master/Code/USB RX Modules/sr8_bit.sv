// $Id: $
// File name:   sr8_bit.sv
// Created:     11/17/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 8-bit shift register USB RX

module sr8_bit
(
  input wire clk,
  input wire n_rst,
  input wire d_orig,
  input wire shift_enable,
  output wire [7:0] Packet_Data 
);

  flex_stp_sr #(.NUM_CNT_BITS(8))
  CORE(
    .clk(clk),
    .n_rst(n_rst),
    .serial_in(d_orig),
    .shift_enable(shift_enable),
    .parallel_out(Packet_Data)
  );

endmodule