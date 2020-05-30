/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Sep 23 19:38:23 2019
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;
  wire   [2:0] next_state;
  wire   [2:0] state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  NOR2X1 U23 ( .A(n18), .B(n19), .Y(o) );
  NAND2X1 U24 ( .A(n20), .B(n21), .Y(n19) );
  INVX1 U25 ( .A(state[2]), .Y(n18) );
  OAI21X1 U26 ( .A(n21), .B(n22), .C(n23), .Y(next_state[2]) );
  OAI21X1 U27 ( .A(state[0]), .B(state[1]), .C(state[2]), .Y(n23) );
  NAND2X1 U28 ( .A(state[0]), .B(i), .Y(n22) );
  OAI21X1 U29 ( .A(state[0]), .B(n21), .C(n24), .Y(next_state[1]) );
  MUX2X1 U30 ( .B(n25), .A(n26), .S(state[2]), .Y(n24) );
  OAI21X1 U31 ( .A(state[0]), .B(n27), .C(n21), .Y(n26) );
  INVX1 U32 ( .A(i), .Y(n27) );
  NOR2X1 U33 ( .A(n20), .B(n28), .Y(n25) );
  NAND2X1 U34 ( .A(i), .B(n21), .Y(n28) );
  INVX1 U35 ( .A(state[1]), .Y(n21) );
  MUX2X1 U36 ( .B(n29), .A(n20), .S(state[2]), .Y(next_state[0]) );
  NAND2X1 U37 ( .A(n30), .B(n20), .Y(n29) );
  INVX1 U38 ( .A(state[0]), .Y(n20) );
  XOR2X1 U39 ( .A(state[1]), .B(i), .Y(n30) );
endmodule

