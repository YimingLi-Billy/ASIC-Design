// $Id: $
// File name:   apb_uart_rx.sv
// Created:     10/13/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: APB-UART Receiver Peripheral

module apb_uart_rx
(
	input wire clk,
	input wire n_rst,
	input wire serial_in,
	input wire psel,
	input wire [2:0] paddr,
	input wire penable,
	input wire pwrite,
	input wire [7:0] pwdata,
	output reg [7:0] prdata,
	output reg pslverr
);

	reg [7:0] rx_data;
	reg data_ready;
	reg overrun_error;
	reg framing_error;
	reg data_read;
	reg [3:0] data_size;
	reg [13:0] bit_period;

apb_slave APB_SLAVE(.clk(clk),
		.n_rst(n_rst),
		.rx_data(rx_data),
		.data_ready(data_ready),
		.overrun_error(overrun_error),
		.framing_error(framing_error),
		.psel(psel),
		.paddr(paddr),
		.penable(penable),
		.pwrite(pwrite),
		.pwdata(pwdata),
		.data_read(data_read),
		.prdata(prdata),
		.pslverr(pslverr),
		.data_size(data_size),
		.bit_period(bit_period));

rcv_block RCV_BLOCK(.clk(clk),
		.n_rst(n_rst),
		.data_read(data_read),
		.serial_in(serial_in),
		.data_size(data_size),
		.bit_period(bit_period),
		.rx_data(rx_data),
		.data_ready(data_ready),
		.overrun_error(overrun_error),
		.framing_error(framing_error));



endmodule