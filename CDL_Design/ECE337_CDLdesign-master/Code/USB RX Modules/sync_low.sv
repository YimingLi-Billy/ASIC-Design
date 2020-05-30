// $Id: $
// File name:   sync_low.sv
// Created:     9/10/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic Low Synchronizer
module sync_low(input wire clk, n_rst, async_in, output reg sync_out);

reg data;

always_ff @ (negedge n_rst, posedge clk) 
begin : REG_LOGIC1
   if(1'b0 == n_rst) begin
     data <= 1'b0;
   end
   else begin
     data <= async_in;
   end 
end

always_ff @ (negedge n_rst, posedge clk)
begin : REG_LOGIC2
    if(1'b0 == n_rst) begin
      sync_out <= 1'b0;
    end
    else begin
       sync_out <= data;
    end
end

endmodule
