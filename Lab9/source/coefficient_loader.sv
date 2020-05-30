// $Id: $
// File name:   coefficient_loader.sv
// Created:     10/19/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Coefficient Loader

module coefficient_loader
(
	input wire clk,
	input wire n_reset,
	input wire new_coefficient_set,
	input wire modwait,
	output reg load_coeff,
	output reg [1:0] coefficient_num
);
	reg [2:0] state;
	reg [2:0] next_state;

typedef enum bit [2:0] {IDLE,
			LOAD1,
			WAIT1,
			LOAD2,
			WAIT2,
			LOAD3,
			WAIT3,
			LOAD4} stateType;

always_comb begin: COEFF_LOADER_CONTROLLER
	next_state = state;
	case(state)
		IDLE: next_state = (!modwait & new_coefficient_set) ? LOAD1 : IDLE;
		LOAD1: next_state = WAIT1;
		WAIT1: next_state = (!modwait) ? LOAD2 : WAIT1;
		LOAD2: next_state = WAIT2;
		WAIT2: next_state = (!modwait) ? LOAD3 : WAIT2;
		LOAD3: next_state = WAIT3;
		WAIT3: next_state = (!modwait) ? LOAD4 : WAIT3;
		LOAD4: next_state = IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_reset) begin: FF
	if(!n_reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

always_comb begin: CONTROLLER_OUTPUT
	load_coeff = 1;
	coefficient_num = 0;
	case(state)
		IDLE: load_coeff = 0;
		LOAD1: coefficient_num = 2'b00;
		WAIT1: begin
			coefficient_num = 2'b00;
			load_coeff = 0;
		end
		LOAD2: coefficient_num = 2'b01;
		WAIT2: begin
			coefficient_num = 2'b01;
			load_coeff = 0;
		end
		LOAD3: coefficient_num = 2'b10;
		WAIT3: begin
			coefficient_num = 2'b10;
			load_coeff = 0;
		end
		LOAD4: coefficient_num = 2'b11;
	endcase
end






endmodule