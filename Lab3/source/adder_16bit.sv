// File name:   adder_16.sv
// Created:     1/19/2015
// Author:      Tim Pritchett
// Version:     1.0  Initial Design Entry
// Description: 16 bit adder design wrapper for synthesis optimization seciton of Lab 2

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);

	genvar i;
	generate
	for(i = 0; i < 16; i++) begin
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
	
	assign sum = ((a + b + carry_in) % (2 **16));
	assign overflow = ((a + b + carry_in) / (2 ** 16));

endmodule
