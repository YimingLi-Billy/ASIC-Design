module usb_tx(
input wire [7:0] tx_packet_data,
input wire [6:0] tx_packet_size,
input wire [1:0] tx_packet,
input wire n_rst,
input wire clk,
output reg dplus_out,
output reg dminus_out,
output reg get_tx_packet_data
);
reg byteccomplete;
reg clk12,serial_out;
reg [15:0]CRC;
reg [7:0] prev_parallel,data_out;
usb_controller A(.clk(clk),
		.n_rst(n_rst),
		.clk12(clk12),
		.tx_packet_data(tx_packet_data),
		.tx_packet(tx_packet),
		.tx_packet_data_size(tx_packet_size),
		.CRC(CRC),
		.prev_parallel(prev_parallel),
		.bit_stuff_en(bit_stuff_en),
		.bytecomplete(bytecomplete),
		.en(en_pts),
		.enc_en(enc_en),
		.timer_en(timer_en),
		.CRC_en(crc_en),		
		.get_tx_packet_data(get_tx_packet_data),
		.data(data_out));
	
usb_bit_stuffer B(.clk(clk),
		.clk12(clk12),
		.n_rst(n_rst),
		.serial_in(serial_out),
		.bit_stuff_en(bit_stuff_en));

usb_pts C(	.clk(clk),
		.n_rst(n_rst),
		.clk12(clk12),
		.data(data_out),
		.en(en_pts),
		.serial_data(serial_out),
		.prev_parallel(prev_parallel));
usb_encoder D(	.clk(clk),
		.n_rst(n_rst),
		.clk12(clk12),
		.en(en_enc),
		.serial_out(serial_out),
		.stuff_bit_en(bit_stuff_en),
		.bytecomplete(bytecomplete),
		.dminus_out(dminus_out),
		.dplus_out(dplus_out));

CDL_CRC_16 E(	.clk(clk),
		.n_rst(n_rst),
		.clk12(clk12),
		.reset_crc(!crc_en),
		.input_data(serial_out),
		.inverted_crc(CRC));
usb_timer F(	.clk(clk),
		.n_rst(n_rst),
		.serial_out(serial_out),
		.clk12(clk12),
		.bytecomplete(bytecomplete));

endmodule
