// $Id: $
// File name:   apb_slave.sv
// Created:     10/10/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: APB-Slave Interface

module apb_slave
(
	input wire clk,
	input wire n_rst,
	input wire [7:0] rx_data,
	input wire data_ready,
	input wire overrun_error,
	input wire framing_error,
	input wire psel,
	input wire [2:0] paddr,
	input wire penable,
	input wire pwrite,
	input wire [7:0] pwdata,
	output reg data_read,
	output reg [7:0] prdata,
	output reg pslverr,
	output reg [3:0] data_size,
	output reg [13:0] bit_period
);

	reg [1:0] state;
	reg [1:0] next_state;
	reg [6:0][7:0] Memory;
	reg [6:0][7:0] next_Memory;
	//reg [3:0] next_data_size;
	//reg [13:0] next_bit_period;
	//reg next_data_read;

typedef enum bit [1:0] {IDLE,
			WRITE,
			READ,
			ERROR} stateType;
			
always_comb begin: CONTROLLER_STATE_LOGIC
	next_state = state;
	case(state)
		IDLE: next_state = ((psel && pwrite && !((paddr == 2) | (paddr == 3) | (paddr == 4))) | (psel && !pwrite && !((paddr == 0) | (paddr == 1) | (paddr == 2) | (paddr == 3) | (paddr == 4) | (paddr == 5) | (paddr == 6)))) ? ERROR :
				   (psel && pwrite) ? WRITE :
				   (psel && !pwrite) ? READ :
				   IDLE;
		WRITE: next_state = IDLE;
		READ: next_state = IDLE;
		ERROR: next_state = IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_rst) begin: CONTROLLER_FF
	if(!n_rst)
		state <= IDLE;
	else
		state <= next_state;
end

always_comb begin: CONTROLLER_OUTPUT
	prdata = 0;
	pslverr = 0;
	case(state)
		READ: begin
			if (penable) begin
				if (paddr == 6) begin
					case(Memory[4])
						8'd5: prdata = {3'b000, Memory[6][7:3]};
						8'd7: prdata = {1'b0, Memory[6][7:1]};
						default: prdata = Memory[6];
					endcase
				end
				else begin
					prdata = Memory[paddr];
				end
			end
		end
		ERROR: pslverr = 1;
	endcase
end

always_comb begin: APB_SLAVE_STATE_LOGIC
	//next_data_read = 0;
	//next_data_size = 0;
	//next_bit_period = 0;
	data_read = 0;
	next_Memory = Memory;
	
	next_Memory[0] = data_ready;
	next_Memory[1] = overrun_error ? 2 :
			 framing_error ? 1 : 0;
	next_Memory[5] = '0;
	next_Memory[6] = rx_data;
	
	case(state)
		WRITE: next_Memory[paddr] = penable ? pwdata : Memory[paddr];
		READ: begin
			if (penable) begin
				if (paddr == 6) begin
					data_read = 1;
				end
			end
		end
	endcase
	
	data_size = Memory[4];
	bit_period = {Memory[3], Memory[2]};
end

always_ff @(posedge clk, negedge n_rst) begin: APB_SLAVE_FF
	if (!n_rst) begin
		//data_read <= 0;
		//data_size = 0;	
		//bit_period = 0;
		Memory <= 0;
	end
	else begin
		//data_read <= next_data_read;
		//data_size = next_data_size;	
		//bit_period = next_bit_period;
		Memory <= next_Memory;
	end
end


endmodule

















