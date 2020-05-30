// $Id: $
// File name:   protocol_controller.sv
// Created:     11/12/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: tb protocol controller

module protocol_controller
(
	input wire clk,
	input wire n_rst,
	input wire Buffer_Occupancy,
	input wire [6:0] TX_Packet_Data_Size,
	input wire Buffer_Reserved,
	input wire [2:0] RX_Packet,
	output reg RX_Error,
	output reg RX_Transfer_Active,
	output reg RX_Data_Ready,
	output reg TX_Transfer_Active,
	output reg TX_Error,
	output reg D_Mode,
	output reg [1:0] TX_Packet, 
	output reg clear
);

typedef enum bit [3:0] {IDLE,
			RESERVED,
			IN_WAIT,
			IN_NAK,
			IN_MODE,
			OUT_WAIT,
			OUT_NAK,
			OUT_MODE,
			OUT_ACK} stateType;

	stateType state;
	stateType next_state;

typedef enum bit [2:0] {RX_IDLE = 3'b000,
			RX_IN = 3'b001,
			RX_OUT = 3'b010,
			RX_ACK = 3'b011,
			RX_ERROR = 3'b100,
			RX_DONE = 3'b101,
			RX_NCK = 3'b110} RX_Packet_Type;

typedef enum bit [1:0] {TX_IDLE = 2'b00,
			TX_SEND_DATA = 2'b01,
			TX_NAK = 2'b10,
			TX_ACK = 2'b11} TX_Packet_Type;

always_comb begin: PROTOCOL_CONTROLLER_NEXT_STATE_LOGIC
	next_state = state;
	case(state)
		IDLE: begin
			if (RX_Packet == RX_IN)
				next_state = IN_NAK;
			else if (Buffer_Reserved)
				next_state = RESERVED;
			else if (RX_Packet == RX_OUT & Buffer_Occupancy)
				next_state = OUT_WAIT;
			else if (RX_Packet == RX_OUT & !Buffer_Occupancy)
				next_state = OUT_MODE;
		end
		RESERVED: begin
			if (RX_Packet == RX_IN)
				next_state = IN_NAK;
			else if (Buffer_Occupancy == TX_Packet_Data_Size)
				next_state = IN_WAIT;
		end
		IN_WAIT: next_state = (RX_Packet == RX_IN) ? IN_MODE : IN_WAIT;
		IN_MODE: next_state = (RX_Packet == RX_ACK) ? IDLE : IN_MODE;
		IN_NAK: next_state = IDLE;
		OUT_WAIT: next_state = (RX_Packet == RX_DONE) ? OUT_NAK : OUT_WAIT;
		OUT_MODE: begin
			if (Buffer_Occupancy > 64 | RX_Packet == RX_ERROR)
				next_state = OUT_WAIT;
			else if (RX_Packet == RX_DONE)
				next_state = OUT_ACK;
		end
		OUT_ACK: begin
			if (RX_Packet == RX_IN)
				next_state = IN_NAK;
			else if (RX_Packet == RX_OUT)
				next_state = OUT_NAK;
			else if (!Buffer_Occupancy)
				next_state = IDLE;
		end
		OUT_NAK: next_state = IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_rst) begin: PROTOCOL_CONTROLLER_FF
	if(!n_rst) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

always_comb begin: PROTOCOL_CONTROLLER_OUTPUT
	// Default
	RX_Data_Ready = 0;
	RX_Transfer_Active = 0;
	RX_Error = 0;
	TX_Transfer_Active = 0;
	TX_Error = 0;
	TX_Packet = 0;
	clear = 0;
	D_Mode = 0;

	case(state)
		IN_MODE: begin
			D_Mode = 0;
			TX_Transfer_Active = 1;
			TX_Packet = TX_SEND_DATA;
		end
		IN_NAK:	begin
			TX_Packet = TX_NAK;
			clear = 1;
			TX_Error = 1; // ??? up for one clock period
		end
		OUT_MODE: begin
			D_Mode = 1; // Host to Endpoint
			RX_Transfer_Active = 1;	
		end
		OUT_WAIT: begin
			D_Mode = 1; // Host to Endpoint
			RX_Transfer_Active = 1;	
			clear = 1;
		end
		OUT_ACK: begin
			TX_Packet = TX_ACK;
			RX_Data_Ready = 1;
		end
		OUT_NAK: begin
			TX_Packet = TX_NAK;
			RX_Transfer_Active = 0;
			clear = 1;
 			RX_Error = 1;
		end
	endcase
end

endmodule