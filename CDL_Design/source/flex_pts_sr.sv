// $Id: $
// File name:   flex_pts_sr.sv
// Created:     9/17/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Flexible Parallel to Serial Shift Register

module flex_pts_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1'b1
)
(
	input wire clk,
	input wire n_rst,
	input wire load_enable,
	input wire shift_enable,
	input wire [NUM_BITS - 1:0] parallel_in,
	output reg serial_out
);

	reg [NUM_BITS - 1:0] next_Q;
	reg [NUM_BITS - 1:0] Q;

always_comb begin
	if(load_enable)
		next_Q = parallel_in;
	else if(shift_enable) begin
		case(SHIFT_MSB)
			1'b1: next_Q = {Q[(NUM_BITS - 2):0], 1'b1};
			1'b0: next_Q = {1'b1, Q[NUM_BITS - 1:1]};
		endcase
	end else 
		next_Q = Q;
end

assign serial_out = SHIFT_MSB ? Q[NUM_BITS - 1] : Q[0];

always_ff @(posedge clk, negedge n_rst) begin
	if(!n_rst)
		Q <= '1;
	else
		Q <= next_Q;
end
endmodule
