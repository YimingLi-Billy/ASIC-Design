// $Id: $
// File name:   sync_high.sv
// Created:     9/10/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic High Synchronizer

module sync_high
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);

reg media;

always_ff @(posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0) begin
		media <= 1'b1;
	end else begin
		media <= async_in;
	end
end

always_ff @(posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0) begin
		sync_out <= 1'b1;
	end else begin
		sync_out <= media;
	end
end

endmodule