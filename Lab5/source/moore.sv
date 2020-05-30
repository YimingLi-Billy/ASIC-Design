// $Id: $
// File name:   moore.sv
// Created:     9/21/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Moore Machine '1101' Detector Design

module moore
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

	reg [2:0] next_state;
	reg [2:0] state;

typedef enum bit [2:0] {IDLE, STATE_1, STATE_2, STATE_3, SUCCESS} stateType;
	
always_comb begin: NXT_LOGIC
	next_state = state;
	case(state)
		IDLE: next_state = i ? STATE_1 : IDLE;
		STATE_1: next_state = i ? STATE_2 : IDLE;
		STATE_2: next_state = i ? STATE_2 : STATE_3;
		STATE_3: next_state = i ? SUCCESS : IDLE;
		SUCCESS: next_state = i ? STATE_2 : IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_rst) begin: REG_LOGIC
	if(!n_rst)
		state <= IDLE;
	else
		state <= next_state;
end

always_comb begin: OUT_LOGIC
	o = 1'b0;
	if(state == SUCCESS)
		o = 1'b1;
end

endmodule
