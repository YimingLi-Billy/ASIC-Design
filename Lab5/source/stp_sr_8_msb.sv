// $Id: $
// File name:   stp_sr_8_msb.sv
// Created:     9/14/2018
// Author:      Tim Pritchett
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: 4-bit LSB Serial to Parallel shift register 
//              (Default direction, Non-default size for Flex StP SR)

module stp_sr_8_msb
(
  input wire clk,
  input wire n_rst,
  input wire serial_in,
  input wire shift_enable,
  output wire [7:0] parallel_out 
);

  flex_stp_sr #(
    .NUM_BITS(8)
  )
  CORE(
    .clk(clk),
    .n_rst(n_rst),
    .serial_in(serial_in),
    .shift_enable(shift_enable),
    .parallel_out(parallel_out)
  );

endmodule
