// $Id: $
// File name:   CDL_CRC_16GENERATOR.sv
// Created:     11/12/2019
// Author:      Xinlue LIu
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 16 bit rx crc generator

module CDL_CRC_5
(
	input wire clk,
	input wire n_rst,
	input wire input_data, //orginal data + 16 bit 0's
	input wire reset_crc, 
	output reg [4:0] inverted_crc
);

typedef enum bit {IDLE, CRC} stateType;

stateType STATE;
stateType NXT_STATE;
reg [4:0] next_crc;
reg [4:0] crc;

always_ff @ (negedge n_rst, posedge clk)
	begin: REG_LOGIC
	if (!n_rst) begin
		STATE <= IDLE;
		crc <= 4'hFFFF;
	end else begin
		STATE <= NXT_STATE;
		crc <= next_crc;
	end
end

always_comb
	begin: STATE_LOGIC
	NXT_STATE = STATE;
	case(STATE)
	IDLE: begin
		if (reset_crc == 1) begin
			NXT_STATE = IDLE;
		end else begin
			NXT_STATE = CRC;
		end
	end
	CRC: begin
		if (reset_crc == 1) begin
			NXT_STATE = IDLE;
		end else begin
			NXT_STATE = CRC;
		end
	end
	endcase
end
	
always_comb 
	begin: CRC_LOGIC
	next_crc = crc;
	if (STATE == IDLE) begin
		next_crc = 16'hFFFF;
	end else begin
		next_crc[0] =  next_crc[4] ^ input_data;
    		next_crc[1] =  next_crc[0];
		next_crc[2] =  next_crc[1] ^ next_crc[4];
		next_crc[3] =  next_crc[2];
		next_crc[4] =  next_crc[3] ^ next_crc[4];
	end
end

always_comb
	begin: Invertion
	inverted_crc = ~crc;
	end
endmodule 