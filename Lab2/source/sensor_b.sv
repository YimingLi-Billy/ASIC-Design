// $Id: $
// File name:   sensor_d.sv
// Created:     8/27/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Dataflow Coding of Sensor Error Detector

module sensor_b
(
	input wire [3:0] sensors,
	output reg error 
);

	always_comb begin
		error = sensors[0] | (sensors[1] & sensors[2]) | (sensors[1] & sensors[3]);
	end

endmodule