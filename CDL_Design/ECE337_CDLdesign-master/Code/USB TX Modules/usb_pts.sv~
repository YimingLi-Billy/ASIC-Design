module usb_pts(
input wire clk,
input wire n_rst,
input wire clk12,
input wire [7:0]data,
input wire en,
output reg serial_data,
output reg [7:0]prev_parallel);

reg [3:0]counter = 4'd1;

flex_pts_sr #(.NUM_BITS(8),.SHIFT_MSB(1'b0)) A(.clk(clk),.n_rst(n_rst),.parallel_in(data),.shift_enable(1'b1),.load_enable(en),.serial_out(serial_data),.par_out(prev_parallel));


	
endmodule
