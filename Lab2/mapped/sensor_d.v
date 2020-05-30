/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Aug 27 16:21:03 2019
/////////////////////////////////////////////////////////////


module sensor_d ( sensors, error );
  input [3:0] sensors;
  output error;
  wire   n3, n4;

  NAND2X1 U4 ( .A(n3), .B(n4), .Y(error) );
  OAI21X1 U5 ( .A(sensors[2]), .B(sensors[3]), .C(sensors[1]), .Y(n4) );
  INVX1 U6 ( .A(sensors[0]), .Y(n3) );
endmodule

