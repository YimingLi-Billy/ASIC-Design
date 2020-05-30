// $Id: $
// File name:   magnitude.sv
// Created:     10/6/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: magnitude

module magnitude
(
	input wire [16:0] in,
	output reg [15:0] out
);

assign out = in[16] ? (~in[15:0] + 1) : in[15:0];

endmodule

