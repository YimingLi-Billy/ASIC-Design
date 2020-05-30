// $Id: $
// File name:   rcu.sv
// Created:     9/26/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit

module rcu
(
	input wire clk,
	input wire n_rst,
	input wire start_bit_detected,
	input wire packet_done,
	input wire framing_error,
	output reg sbc_clear,
	output reg sbc_enable,
	output reg load_buffer,
	output reg enable_timer
);

	reg [3:0] next_state;
	reg [3:0] state;

typedef enum bit [3:0] {IDLE, 
			WAIT_CYCLE1, 
			//WAIT_CYCLE2, 
			//WAIT_CYCLE3, 
			//WAIT_CYCLE4, 
			//WAIT_CYCLE5, 
			COUNT, 
			STOP_BIT_CHECK, 
			WAIT_ERROR, 
			LOAD_BUFFER} stateType;

always_comb begin: NEXT_LOGIC
	next_state = state;
	case(state)
		IDLE		: next_state = start_bit_detected ?     WAIT_CYCLE1 : IDLE;
		WAIT_CYCLE1	: next_state = COUNT;//WAIT_CYCLE2;
		//WAIT_CYCLE2	: next_state = WAIT_CYCLE3;
		//WAIT_CYCLE3	: next_state = WAIT_CYCLE4;
		//WAIT_CYCLE4	: next_state = WAIT_CYCLE5;
		//WAIT_CYCLE5	: next_state = COUNT;
		COUNT		: next_state = packet_done 	  ? STOP_BIT_CHECK : COUNT;	
		STOP_BIT_CHECK	: next_state = WAIT_ERROR;
		WAIT_ERROR	: next_state = framing_error 	  ?           IDLE : LOAD_BUFFER;
		LOAD_BUFFER	: next_state = IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_rst) begin: REG_LOGIC
	if(!n_rst)
		state <= IDLE;
	else
		state <= next_state;
end

always_comb begin: OUTPUT_LOGIC
	enable_timer = 0;
	load_buffer = 0;
	sbc_clear = 0;
	sbc_enable = 0;

	case(state)
		WAIT_CYCLE1:
		  begin
			enable_timer = 0;
			load_buffer = 0;
			sbc_clear = 1;
			sbc_enable = 0;
		  end
		COUNT:
		  begin
			enable_timer = 1;
			load_buffer = 0;
			sbc_clear = 0;
			sbc_enable = 0;
		  end

		STOP_BIT_CHECK:
		  begin
			enable_timer = 0;
			load_buffer = 0;
			sbc_clear = 0;
			sbc_enable = 1;
		  end

		WAIT_ERROR:
		  begin
			enable_timer = 0;
			load_buffer = 0;
			sbc_clear = 0;
			sbc_enable = 1;
		  end

		LOAD_BUFFER:
		  begin
			enable_timer = 0;
			load_buffer = 1;
			sbc_clear = 0;
			sbc_enable = 0;
		  end
	endcase
end
endmodule







