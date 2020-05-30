// $Id: $
// File name:   mealy.sv
// Created:     9/21/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Mealy Machine '1101' Detector Design

// $Id: $
// File name:   moore.sv
// Created:     9/21/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Moore Machine '1101' Detector Design

module mealy
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

	reg [1:0] next_state;
	reg [1:0] state;

typedef enum bit [1:0] {IDLE, STATE_1, STATE_2, STATE_3} stateType;
	
always_comb begin: NXT_LOGIC
	next_state = state;
	case(state)
		IDLE: next_state = i ? STATE_1 : IDLE;
		STATE_1: next_state = i ? STATE_2 : IDLE;
		STATE_2: next_state = i ? STATE_2 : STATE_3;
		STATE_3: next_state = i ? STATE_1 : IDLE;
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
	if((state == STATE_3) & (i == 1))
		o = 1'b1;
end

endmodule