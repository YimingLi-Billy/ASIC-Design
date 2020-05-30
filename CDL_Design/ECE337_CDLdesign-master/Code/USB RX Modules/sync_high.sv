// $Id: $
// File name:   sync_high.sv
// Created:     9/10/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic High Synchronizer
module sync_high(input wire clk, n_rst, async_in, output reg sync_out);
reg data;

always_ff @ (negedge n_rst, posedge clk) 
begin : REG_LOGIC3
   if(1'b0 == n_rst) begin
      data <= 1'b1;
   end
   else begin
      data <= async_in;
   end
end

always_ff @ (negedge n_rst, posedge clk) 
begin : REG_LOGIC4
   if(1'b0 == n_rst) begin
     sync_out <= 1'b1;
   end
   else begin
     sync_out <= data;
   end
end


endmodule