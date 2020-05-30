// $Id: $
// File name:   timer.sv
// Created:     9/26/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Lab6 Timer

module timer
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire enable_timer,
	output reg shift_enable,
	output reg packet_done
);


	flex_counter #(4) CT1 (
				.clk(clk),
				.n_rst(n_rst),
				.clear(!enable_timer | packet_done),
				.count_enable(enable_timer),
				.rollover_val(4'b1010),
				.rollover_flag(shift_enable));
	
	flex_counter #(4) CT2 (
				.clk(clk),
				.n_rst(n_rst),
				.clear(!enable_timer | packet_done),
				.count_enable(shift_enable),
				.rollover_val(4'b1001),
				.rollover_flag(packet_done));

endmodule