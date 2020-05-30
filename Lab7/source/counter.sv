// $Id: $
// File name:   counter.sv
// Created:     10/6/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: counter

module counter
(
	input wire clk, 
	input wire n_rst,
	input wire cnt_up,
	input wire clear,
	output wire one_k_samples
);

flex_counter #(10) COUNTER (.clk(clk),
				.n_rst(n_rst),
				.clear(clear),
				.count_enable(cnt_up),
				.rollover_val(10'b1111101000),
				.rollover_flag(one_k_samples));

endmodule

