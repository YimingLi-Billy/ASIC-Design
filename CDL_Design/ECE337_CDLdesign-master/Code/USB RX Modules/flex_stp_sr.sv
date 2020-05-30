// $Id: $
// File name:   flex_stp_sr.sv
// Created:     9/17/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Flex Serial to Parallel Code
module flex_stp_sr#(parameter NUM_BITS = 9,parameter SHIFT_MSB = 0)(input wire clk, n_rst, shift_enable, serial_in, output reg [(NUM_BITS -1):0] parallel_out);

reg[(NUM_BITS -1):0] next_data;
reg[(NUM_BITS -1):0] data;

always_ff @ (posedge clk, negedge n_rst)
begin
   if(n_rst == 1'b0) begin
     parallel_out <= '1;
   end
   else begin
     parallel_out <= next_data;
   end
end

always_comb 
begin
  next_data = parallel_out;
  if (shift_enable == 1'b1) begin
    if(SHIFT_MSB == 1) begin
       next_data = {next_data[(NUM_BITS - 2):0],serial_in};
    end
    else begin
      next_data = {serial_in,next_data[(NUM_BITS - 1):1]};
    end
  end
  else begin
     next_data = parallel_out;
  end

end

endmodule