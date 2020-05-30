// $Id: $
// File name:   controller.sv
// Created:     10/6/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: controller

module controller
(
	input wire clk,
	input wire n_rst,
	input wire dr,
	input wire lc,
	input wire overflow,
	output reg cnt_up,
	output reg clear,
	output reg modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);

typedef enum bit [4:0] {
			STORE_COEFF1, DEASSERT_MODWAIT1, 
			STORE_COEFF2, DEASSERT_MODWAIT2, 
			STORE_COEFF3, DEASSERT_MODWAIT3, 
			STORE_COEFF4, DEASSERT_MODWAIT4, 
			IDLE,
			STORE,
			ZERO,
			SORT1, SORT2, SORT3, SORT4, 
			MUL1, ADD1, 
			MUL2, SUB1, 
			MUL3, ADD2, 
			MUL4, SUB2, 
			EIDLE} stateType;

	stateType next_state;
	stateType state;

always_comb begin: NEXT_LOGIC
	next_state = state;
	case(state)
		//STANDBY		: next_state = lc ? STORE_COEFF1 : STANDBY;
		STORE_COEFF1	: next_state = DEASSERT_MODWAIT1;
		DEASSERT_MODWAIT1: next_state = lc ? STORE_COEFF2 : DEASSERT_MODWAIT1;
		STORE_COEFF2	: next_state = DEASSERT_MODWAIT2;
		DEASSERT_MODWAIT2: next_state = lc ? STORE_COEFF3 : DEASSERT_MODWAIT2;
		STORE_COEFF3	: next_state = DEASSERT_MODWAIT3;
		DEASSERT_MODWAIT3: next_state = lc ? STORE_COEFF4 : DEASSERT_MODWAIT3;
		STORE_COEFF4	: next_state = DEASSERT_MODWAIT4;
		DEASSERT_MODWAIT4: next_state = IDLE;
		IDLE		: begin
			if(lc)
				next_state = STORE_COEFF1;
			else if(dr)
				next_state = STORE;
			else
				next_state = IDLE;
		end
		STORE		: next_state = dr ? ZERO : EIDLE;
		ZERO		: next_state = SORT1;
		SORT1		: next_state = SORT2;
		SORT2		: next_state = SORT3;
		SORT3		: next_state = SORT4;
		SORT4		: next_state = MUL1;
		MUL1		: next_state = ADD1;
		ADD1		: next_state = overflow ? EIDLE : MUL2;
		MUL2		: next_state = SUB1;
		SUB1		: next_state = overflow ? EIDLE : MUL3;
		MUL3		: next_state = ADD2;
		ADD2		: next_state = overflow ? EIDLE : MUL4;
		MUL4		: next_state = SUB2;
		SUB2		: next_state = overflow ? EIDLE : IDLE;
		EIDLE		: next_state = dr ? STORE : EIDLE;
	endcase
end

always_ff @(posedge clk, negedge n_rst) begin: REG_LOGIC
	if(!n_rst) begin
		state <= IDLE;
		//modwait <= 0;
	end
	else begin
		state <= next_state;
		//modwait <= next_modwait;
	end
end

always_comb begin: OUTPUT_LOGIC
	cnt_up = 0;
	clear = 0;
	modwait = 0;
	err = 0;
	op = '0;
	src1 = '0;
	src2 = '0;
	dest = '0;

	case(state)
		STORE_COEFF1	: begin
			dest = 4'b1001; //9, F0
			op = 3'b011;
			modwait = 1;
			clear = 1;
		end
		STORE_COEFF2	: begin
			dest = 4'b1000; //8 F1
			op = 3'b011;
			modwait = 1;
			clear = 1;
		end
		STORE_COEFF3	: begin
			dest = 4'b0111; //7 F2
			op = 3'b011;
			modwait = 1;
			clear = 1;
		end
		STORE_COEFF4	: begin
			dest = 4'b0110; //6 F3
			op = 3'b011;
			modwait = 1;
			clear = 1;
		end
		STORE		: begin
			dest = 4'b0101; //5 D
			op = 3'b010;
			cnt_up = 1;
			modwait = 1;
			cnt_up = 1;
		end
		ZERO		: begin
			dest = '0;
			op = 3'b101;
			modwait = 1;
		end
		SORT1		: begin
			src1 = 4'b0010;
			dest = 4'b0001;
			op = 3'b001;
			modwait = 1;
		end
		SORT2		: begin
			src1 = 4'b0011;
			dest = 4'b0010;
			op = 3'b001;
			modwait = 1;
		end
		SORT3		: begin
			src1 = 4'b0100;
			dest = 4'b0011;
			op = 3'b001;
			modwait = 1;
		end
		SORT4		: begin
			src1 = 4'b0101;
			dest = 4'b0100;
			op = 3'b001;
			modwait = 1;
		end
		MUL1		: begin
			src1 = 4'b0001;
			src2 = 4'b0110;
			dest = 4'b1010;
			op = 3'b110;
			modwait = 1;
		end
		ADD1		: begin
			src1 = 4'b0000;
			src2 = 4'b1010;
			dest = 4'b0000;
			op = 3'b100;
			modwait = 1;
		end
		MUL2		: begin
			src1 = 4'b0010;
			src2 = 4'b0111;
			dest = 4'b1010;
			op = 3'b110;
			modwait = 1;
		end
		SUB1		: begin
			src1 = 4'b0000;
			src2 = 4'b1010;
			dest = 4'b0000;
			op = 3'b101;
			modwait = 1;
		end
		MUL3		: begin
			src1 = 4'b0011;
			src2 = 4'b1000;
			dest = 4'b1010;
			op = 3'b110;
			modwait = 1;
		end
		ADD2		: begin
			src1 = 4'b0000;
			src2 = 4'b1010;
			dest = 4'b0000;
			op = 3'b100;
			modwait = 1;
		end
		MUL4		: begin
			src1 = 4'b0100;
			src2 = 4'b1001;
			dest = 4'b1010;
			op = 3'b110;
			modwait = 1;
		end
		SUB2		: begin
			src1 = 4'b0000;
			src2 = 4'b1010;
			dest = 4'b0000;
			op = 3'b101;
			modwait = 1;
		end
		EIDLE		: err = 1;
	endcase
end
endmodule














































