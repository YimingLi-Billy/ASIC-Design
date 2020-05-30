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
	genvar i;
	generate
	for(i = 0; i < NUM_BITS; i++) begin
		always @(a, b, carry_in)
		begin
			assert((a[i] == 1'b1) || (a[i] == 1'b0))
			else $error("Input 'a' of component is not a digital logic value");
			assert((b[i] == 1'b1) || (b[i] == 1'b0))
			else $error("Input 'b' of component is not a digital logic value");
			assert((carry_in == 1'b1) || (carry_in == 1'b0))
			else $error("Input 'carry_in' of component is not a digital logic value");
		end
	end
	endgenerate
	

	wire [NUM_BITS:0] carrys;
	genvar j;
	
	assign carrys[0] = carry_in;
	generate
	for(j = 0; j <= (NUM_BITS - 1); j = j + 1)
		begin
			adder_1bit IX (.a(a[j]), .b(b[j]), .carry_in(carrys[j]), .sum(sum[j]), .carry_out(carrys[j+1]));
		end
	endgenerate
	assign overflow = carrys[NUM_BITS];

endmodule