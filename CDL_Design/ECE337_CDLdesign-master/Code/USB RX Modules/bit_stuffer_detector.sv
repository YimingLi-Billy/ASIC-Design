// $Id: $
// File name:   bit_stuffer_detector.sv
// Created:     11/11/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Bit Stuffed Detector 
module bit_stuffer_detector(input wire clk,
                            input wire n_rst,
                            input wire d_orig,
                            input wire shift_enable,
                            output reg invalid_bit);

reg next_invalid_bit;
reg enable;
reg clear;
reg [2:0] count_out;
reg rollover_flag;

always_ff @ (posedge clk, negedge n_rst) 
begin
  if(n_rst == 1'b0) begin
     invalid_bit <= 1'b0;
  end
  else begin
    invalid_bit <= next_invalid_bit;
  end
end

flex_counter #(.NUM_CNT_BITS(3)) FC1 (.clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(enable), .rollover_val(3'b110), .count_out(count_out), .rollover_flag(rollover_flag));
 

always_comb
begin : FLEX_CONTROL_LOGIC
  enable = 1'b0;
  clear = 1'b0;
  if(d_orig && shift_enable) begin // checks if d_orig is high. if continuously high, the counter continues to count up
     enable = 1'b1;
     clear = 1'b0;
  end
  else begin // if d_orig goes low, it shuts the timer down and resets 
    enable = 1'b0;
    clear = 1'b1; 
  end
end

always_comb 
begin : INVALID_BIT_LOGIC
 if(count_out == 3'b110) begin // since it is specifically the after 6 nontransitions that the next is invalid...
   next_invalid_bit = 1'b1;
 end
 else begin
   next_invalid_bit = 1'b0;
 end
end

endmodule