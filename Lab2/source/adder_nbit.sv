// $Id: $
// File name:   adder_nbit.sv
// Created:     9/2/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: N_bit Adder


module adder_nbit
#(
	parameter NUM_BITS = 4
)
(
	input wire [(NUM_BITS - 1):0]a,
	input wire [(NUM_BITS - 1):0]b,
	input wire carry_in,
	output wire [(NUM_BITS - 1):0]sum,
	output wire overflow
);

	wire [NUM_BITS:0] carrys;
	genvar i;
	
	assign carrys[0] = carry_in;
	generate
	for(i = 0; i <= (NUM_BITS - 1); i = i + 1)
		begin
			adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
		end
	endgenerate
	assign overflow = carrys[NUM_BITS];

endmodule