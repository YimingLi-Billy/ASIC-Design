// $Id: $
// File name:   sensor_s.sv
// Created:     8/27/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Structural Coding of Sensor Error Detector.

module sensor_s
(
	input wire [3:0]sensors,
	output wire error
);
	
	wire and1;
	wire and2;
	wire or1;

	AND2X1 A1 (.Y(and1), .A(sensors[2]), .B(sensors[1]));
	AND2X1 A2 (.Y(and2), .A(sensors[3]), .B(sensors[1]));
	OR2X1 O1 (.Y(or1), .A(sensors[0]), .B(and1));
	OR2X1 O2 (.Y(error), .A(or1), .B(and2));

endmodule