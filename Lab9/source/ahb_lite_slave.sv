// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     10/19/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite-Slave Interface

module ahb_lite_slave
(
	input wire clk,
	input wire n_rst,
	input wire [1:0] coefficient_num,
	input wire modwait,
	input wire [15:0] fir_out,
	input wire err,
	input wire hsel,
	input wire [3:0] haddr,
	input wire hsize,
	input wire [1:0] htrans,
	input wire hwrite,
	input wire [15:0] hwdata,
	output reg [15:0] sample_data,
	output reg data_ready,
	output reg new_coefficient_set,
	output reg [15:0] fir_coefficient,
	output reg [15:0] hrdata,
	output reg hresp
);

	reg [1:0] state;
	reg [1:0] next_state;
	reg [15:0][7:0] Memory;
	reg [15:0][7:0] next_Memory;
	reg next_data_ready;
	reg [3:0] haddr_buff;
	reg hsize_buff;

typedef enum bit [1:0] {IDLE,
			WRITE,
			READ,
			ERROR} stateType;

always_comb begin: CONTROLLER_STATE_LOGIC
	next_state = state;
	case(state)
		IDLE: next_state  = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? ERROR :
				   (hsel && hwrite && (htrans != 0)) ? WRITE :
				   (hsel && !hwrite && (htrans != 0)) ? READ :
				   IDLE;
		WRITE: next_state = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? ERROR :
				   (hsel && hwrite && (htrans != 0)) ? WRITE :
				   (hsel && !hwrite && (htrans != 0)) ? READ :
				   IDLE;
		READ: next_state  = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? ERROR :
				   (hsel && hwrite && (htrans != 0)) ? WRITE :
				   (hsel && !hwrite && (htrans != 0)) ? READ :
				   IDLE;
		ERROR: next_state = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? ERROR :
				   (hsel && hwrite && (htrans != 0)) ? WRITE :
				   (hsel && !hwrite && (htrans != 0)) ? READ :
				   IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_rst) begin: CONTROLLER_FF
	if(!n_rst) begin
		state <= IDLE;
		data_ready <= 0;
		Memory <= 0;
		haddr_buff <= 0; //
		hsize_buff <= 0; 
	end
	else begin
		state <= next_state;
		data_ready <= next_data_ready;
		Memory <= next_Memory;
		haddr_buff <= haddr;
		hsize_buff <= hsize;
	end
end

always_comb begin: CONTROLLER_OUTPUT
	hrdata = 0;
	//hresp = 0;
	hresp = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? 1 : 0;
	case(state)
		READ: begin
			if (hsize_buff == 1)
				if (haddr_buff % 2 == 1)
					hrdata = {Memory[haddr_buff], Memory[haddr_buff - 1'b1]};
				else
					hrdata = {Memory[haddr_buff + 1'b1], Memory[haddr_buff]};
			else
				if (haddr_buff % 2 == 1)
					hrdata = {Memory[haddr_buff], 8'b0};
				else
					hrdata = {8'b0, Memory[haddr_buff]};

			if (haddr_buff == 4'd14) hrdata = {8'b0, Memory[14]};
		end
	endcase
end

always_comb begin: APB_SLAVE_STATE_LOGIC
	next_Memory = Memory;
	next_data_ready = data_ready;
	
	if(err) begin
		next_Memory[1] = 1;
		next_Memory[0] = 0;
	end
	else if(new_coefficient_set) begin
		next_Memory[0] = 1;
		next_Memory[1] = 0;
	end
	else if(modwait) begin
		next_Memory[0] = 1;
		next_Memory[1] = 0;
	end
	else begin
		next_Memory[0] = 0;
		next_Memory[1] = 0;
	end

	next_Memory[2] = fir_out[7:0];
	next_Memory[3] = fir_out[15:8];
	next_Memory[15] = '0;

	if (coefficient_num == 3) begin
		next_Memory[14] = 0;
		//new_coefficient_set = 0;
	end
	new_coefficient_set = Memory[14];

	sample_data = {Memory[5], Memory[4]};
	fir_coefficient = {Memory[coefficient_num * 2 + 7], Memory[coefficient_num * 2 + 6]};
	
	case(state)
		WRITE: begin
			if(hsize_buff == 1)
				if(haddr % 2 == 1) begin
					next_Memory[haddr_buff - 1'b1] = hwdata[7:0];
					next_Memory[haddr_buff] = hwdata[15:8];
				end
				else begin
					next_Memory[haddr_buff] = hwdata[7:0];
					next_Memory[haddr_buff + 1'b1] = hwdata[15:8];
				end
			else
				if(haddr % 2 == 1)
					next_Memory[haddr_buff] = hwdata[15:8];
				else
					next_Memory[haddr_buff] = hwdata[7:0];
			
			if(haddr_buff == 4 | haddr_buff == 5)
				next_data_ready = 1;
		end
	endcase
	
	if (modwait) next_data_ready = 0;
end


endmodule