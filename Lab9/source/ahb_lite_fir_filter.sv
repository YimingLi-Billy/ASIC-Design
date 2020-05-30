// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     10/19/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite FIR Filter Accelerator

module ahb_lite_fir_filter
(
	input wire clk,
	input wire n_rst,
	input wire hsel,
	input wire [3:0] haddr,
	input wire hsize,
	input wire [1:0] htrans,
	input wire hwrite,
	input wire [15:0] hwdata,
	output wire [15:0] hrdata,
	output wire hresp
);

	reg [15:0] fir_out;
	reg err;
	reg data_ready;
	reg [15:0] sample_data;
	reg modwait;
	reg new_coefficient_set;
	reg [1:0] coefficient_num;
	reg [15:0] fir_coefficient;
	reg load_coeff;

ahb_lite_slave AHB_LITE_SLAVE(.clk(clk),
				.n_rst(n_rst),
				.coefficient_num(coefficient_num),
				.modwait(modwait),
				.fir_out(fir_out),
				.err(err),
				.hsel(hsel),
				.haddr(haddr),
				.hsize(hsize),
				.htrans(htrans),
				.hwrite(hwrite),
				.hwdata(hwdata),
				.sample_data(sample_data),
				.data_ready(data_ready),
				.new_coefficient_set(new_coefficient_set),
				.fir_coefficient(fir_coefficient),
				.hrdata(hrdata),
				.hresp(hresp));

coefficient_loader COEFF_LOADER(.clk(clk),
				.n_reset(n_rst),
				.new_coefficient_set(new_coefficient_set),
				.modwait(modwait),
				.load_coeff(load_coeff),
				.coefficient_num(coefficient_num));

fir_filter FIR_FILTER(.clk(clk),
			.n_reset(n_rst),
			.sample_data(sample_data),
			.fir_coefficient(fir_coefficient),
			.load_coeff(load_coeff),
			.data_ready(data_ready),
			.modwait(modwait),
			.fir_out(fir_out),
			.err(err));


endmodule