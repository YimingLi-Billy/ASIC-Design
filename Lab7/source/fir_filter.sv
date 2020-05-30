// $Id: $
// File name:   fir_filter.sv
// Created:     10/6/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: fir_filter

module fir_filter
(
	input wire clk,
	input wire n_reset,
	input wire [15:0] sample_data,
	input wire [15:0] fir_coefficient,
	input wire load_coeff,
	input wire data_ready,
	output reg one_k_samples,
	output reg modwait,
	output reg [15:0] fir_out,
	output reg err
);

	reg lc;
	reg dr;
	reg overflow;
	reg cnt_up;
	reg clear;
	reg [2:0] op;
	reg [3:0] src1;
	reg [3:0] src2;
	reg [3:0] dest;
	reg [16:0] in;

sync_low LC (.clk(clk),
		.n_rst(n_reset),
		.async_in(load_coeff),
		.sync_out(lc));

sync_low DR (.clk(clk),
		.n_rst(n_reset),
		.async_in(data_ready),
		.sync_out(dr));

controller CONTROL (.clk(clk),
		.n_rst(n_reset),
		.dr(dr),
		.lc(lc),
		.overflow(overflow),
		.cnt_up(cnt_up),
		.clear(clear),
		.modwait(modwait),
		.op(op),
		.src1(src1),
		.src2(src2),
		.dest(dest),
		.err(err));

datapath DATAPATH(.clk(clk),
		.n_reset(n_reset),
		.op(op),
		.src1(src1),
		.src2(src2),
		.dest(dest),
		.ext_data1(sample_data),
		.ext_data2(fir_coefficient),
		.outreg_data(in),
		.overflow(overflow));

counter COUNT (.clk(clk),
		.n_rst(n_reset),
		.cnt_up(cnt_up),
		.clear(clear),
		.one_k_samples(one_k_samples));

magnitude MAG (.in(in),
		.out(fir_out));


endmodule
















