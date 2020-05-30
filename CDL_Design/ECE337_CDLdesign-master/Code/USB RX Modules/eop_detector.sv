// $Id: $
// File name:   eop_detector.sv
// Created:     9/16/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: End of Packet (EOP) Detector 
module eop_detector(input wire clk,
                    input wire n_rst,
                    input wire d_plus_sync,
                    input wire d_minus_sync,
                    input wire shift_enable,
                    output reg eop);

typedef enum bit [3:0] {IDLE, START, MID, FINISH} stateType;
stateType state;
stateType next_state;


always_ff @(posedge clk, negedge n_rst) 
begin
  if(n_rst == 1'b0) begin
    state <= IDLE;
  end
  else begin
    state <= next_state;
  end
end

always_comb 
begin
  case(state)
  IDLE:
  begin
    if(!d_plus_sync && !d_minus_sync && shift_enable) begin // the first instance of both d_plus and d_minus being low
      next_state = START;
    end
    else begin
      next_state = IDLE;
    end
  end
  START:
  begin
    if(!d_plus_sync && !d_minus_sync && shift_enable) begin // the second instance of both d_plus and d_minus being low
      next_state = MID;
    end
    else begin
      next_state = IDLE;
    end
  end
  MID:
  begin
    if(d_plus_sync && !d_minus_sync && shift_enable) begin // the signals must return to idle to complete the sequence.
      next_state = FINISH;
    end
    else begin
      next_state = IDLE;
    end
  end
  FINISH:
  begin
     next_state = IDLE;
  end
  endcase
end

always_comb
begin : OUTPUT_LOGIC
  eop = 1'b0;
  if(state == FINISH) begin // if one full eop sequence is complete, assert eop
    eop = 1'b1; 
  end
  else begin // otherwise do not assert
    eop = 1'b0;
  end
end


endmodule