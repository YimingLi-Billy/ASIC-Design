// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     10/17/2019
// Author:      Xinlue LIu
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: ahb_lite_slave interface

module ahb_lite_slave
(
	input wire clk,
	input wire n_rst,
	output reg [15:0]sample_data,
	output reg data_ready,
	output reg new_coefficient_set,
	input wire [1:0]coefficient_num,
	output reg [15:0]fir_coefficient,
	input wire modwait,
	input wire [15:0]fir_out,
	input wire err,
	input wire hsel,
	input wire [3:0]haddr,
	input wire hsize,
	input wire [1:0]htrans,
	input wire hwrite,
	input wire [15:0]hwdata,
	output reg [15:0]hrdata,
	output reg hresp
);

typedef enum bit[1:0] {IDLE, READ, WRITE, ERROR} stateType;

reg [1:0] STATE;
reg [1:0] NXT_STATE;
reg [15:0][7:0] next_address_mapping;
reg [15:0][7:0] address_mapping;
reg [3:0] next_haddr;
reg next_data_ready;
reg next_hsize;

always_ff @ (negedge n_rst, posedge clk)
	begin: REG_LOGIC
	if(!n_rst) begin
		STATE <= IDLE;
		address_mapping <= '0;
		next_haddr <= '0;
		data_ready <= 0;
		next_hsize <= '0;
	end else begin
		STATE <= NXT_STATE;
		address_mapping <= next_address_mapping;
		next_haddr <= haddr;
		data_ready <= next_data_ready;
		next_hsize <= hsize;
	end
end

always_comb
	begin: NXT_LOGIC_CONTROLLER
	NXT_STATE = STATE;
	case(STATE)
	IDLE: begin
		if ((hsel) && ((hwrite) && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15)))
		           | ((!hwrite) && (haddr == 15))) begin
			NXT_STATE = ERROR;
		end else if ((hsel) && (!hwrite) && (htrans != 0)) begin
			NXT_STATE = READ;
		end else if ((hsel) && (hwrite) && (htrans != 0)) begin
			NXT_STATE = WRITE;
		end else begin
			NXT_STATE = IDLE;
		end
	end
	READ: begin
		if ((hsel) && ((hwrite) && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15)))
		           | ((!hwrite) && (haddr == 15))) begin
			NXT_STATE = ERROR;
		end else if ((hsel) && (htrans != 0) && (!hwrite)) begin
			  NXT_STATE = READ;
		end else if ((hsel) && (htrans != 0) && (hwrite)) begin
			NXT_STATE = WRITE;
		end else begin
			NXT_STATE = IDLE;
		end
	end
	WRITE: begin
		if ((hsel) && ((hwrite) && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15)))
		           | ((!hwrite) && (haddr == 15))) begin
			NXT_STATE = ERROR;
		end else if ((hsel) && (htrans != 0) && (!hwrite)) begin
			NXT_STATE = READ;
		end else if ((hsel) && (htrans != 0) && (hwrite)) begin
			NXT_STATE = WRITE;
		end else begin
			NXT_STATE = IDLE;
		end
	end
	ERROR: begin
		if ((hsel) && ((hwrite) && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15)))
		           | ((!hwrite) && (haddr == 15))) begin
			NXT_STATE = ERROR;
		end else if ((hsel) && (htrans != 0) && (!hwrite)) begin
			NXT_STATE = READ;
		end else if ((hsel) && (htrans != 0) && (hwrite)) begin
			NXT_STATE = WRITE;
		end else begin
			NXT_STATE = IDLE;
		end
	end
	endcase
end

always_comb
	begin: ERROR_LOGIC
	hresp = 0;
	
	if ((hsel) && ((hwrite) && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15)))
		           | ((!hwrite) && (haddr == 15))) begin
		hresp = 1;
	end
	end

always_comb
	begin: OUTPUT_LOGIC_INTERMEDIATE
	next_address_mapping = address_mapping;
	next_address_mapping[15] = '0;
	next_data_ready = data_ready;

	sample_data = {address_mapping[5], address_mapping[4]};

	new_coefficient_set = address_mapping[14];

	if (coefficient_num == 3) begin
		 next_address_mapping[14] = 0;
	end 

	if (coefficient_num == 0) begin
		fir_coefficient = {address_mapping[7], address_mapping[6]};
	end else if (coefficient_num == 1) begin
		fir_coefficient = {address_mapping[9], address_mapping[8]};
	end else if (coefficient_num == 2) begin
		fir_coefficient = {address_mapping[11], address_mapping[10]};
	end else if (coefficient_num == 3) begin
		fir_coefficient = {address_mapping[13], address_mapping[12]};
	end

	if (new_coefficient_set == 1) begin
		next_address_mapping[0] = 1;
		next_address_mapping[1] = 0;
	end else if (modwait == 1) begin
		next_address_mapping[0] = 1;
		next_address_mapping[1] = 0;
	end else if (err == 1) begin
		next_address_mapping[0] = 0;
		next_address_mapping[1] = 1;
	end else begin
		next_address_mapping[0] = 0;
		next_address_mapping[1] = 0;
	end

	next_address_mapping[3] = fir_out[15:8];
	next_address_mapping[2] = fir_out[7:0];

	if (STATE == WRITE) begin
		if (next_hsize == 1) begin
			if ((next_haddr == 4'd14) | (next_haddr == 4'd15)) begin
				next_address_mapping[14] = hwdata[7:0];
			end else if ((next_haddr % 2 == 0) && (next_haddr != 4'd14))begin
				next_address_mapping[next_haddr + 1] = hwdata[15:8];
				next_address_mapping[next_haddr] = hwdata[7:0];
			end else if ((next_haddr % 2 == 1) && (next_haddr != 4'd15)) begin
				next_address_mapping[next_haddr] = hwdata[15:8];
				next_address_mapping[next_haddr - 1] = hwdata[7:0];
			end
		end else if (next_hsize == 0) begin
			if (next_haddr % 2 == 0) begin
				next_address_mapping[next_haddr] = hwdata[7:0];
			end else if (next_haddr % 2 == 1) begin
				next_address_mapping[next_haddr] = hwdata[15:8];
			end
		end
		if ((next_haddr == 4) | (next_haddr == 5)) begin
			next_data_ready = 1;
		end
	end

	if (modwait) begin
		next_data_ready = 0;
	end
end

always_comb
	begin: FINAL_LOGIC_OUTPUT
	hrdata = '0;

	case(STATE)
	READ: begin
		if (next_hsize == 0) begin
			if (next_haddr % 2 == 0) begin
				hrdata = {8'b0, address_mapping[next_haddr]};
			end else if (next_haddr % 2 == 1) begin
				hrdata = {address_mapping[next_haddr],8'b0};
			end
		end
		if (next_hsize == 1) begin
			if ((next_haddr == 4'd14) | (next_haddr == 4'd15)) begin
				hrdata = {8'b0, address_mapping[14]};
			end else if ((next_haddr % 2 == 0) && (next_haddr != 4'd14)) begin
				hrdata = {address_mapping[next_haddr + 1], address_mapping[next_haddr]};
			end else if ((next_haddr % 2 == 1) && (next_haddr != 4'd15)) begin
				hrdata = {address_mapping[next_haddr], address_mapping[next_haddr - 1]};
			end
		end
		end
	endcase
end
endmodule 
