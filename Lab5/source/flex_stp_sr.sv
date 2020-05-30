// $Id: $
// File name:   flex_stp_sr.sv
// Created:     9/17/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: flexable serial to parallel

module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1'b1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output reg [NUM_BITS - 1:0] parallel_out
);

	reg [NUM_BITS - 1 :0] next_out;
always_comb begin
	if(shift_enable) begin
		case(SHIFT_MSB)
			1'b1: next_out = {parallel_out[(NUM_BITS - 2):0], serial_in};
			1'b0: next_out = {serial_in, parallel_out[NUM_BITS - 1:1]};
		endcase
	end else
		next_out = parallel_out;
end

always_ff @(posedge clk, negedge n_rst) begin
	if(!n_rst)
		parallel_out <= '1;
	else
		parallel_out <= next_out;
end
		
endmodule