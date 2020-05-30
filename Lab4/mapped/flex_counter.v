/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Sep 17 14:43:02 2019
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [4:0] rollover_val;
  output [4:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103;

  DFFSR \count_out_reg[0]  ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  OAI21X1 U44 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  OAI21X1 U45 ( .A(n52), .B(n49), .C(n53), .Y(n51) );
  INVX1 U46 ( .A(count_out[0]), .Y(n49) );
  MUX2X1 U47 ( .B(n54), .A(n55), .S(count_out[1]), .Y(n47) );
  INVX1 U48 ( .A(n56), .Y(n55) );
  NAND2X1 U49 ( .A(n57), .B(count_out[0]), .Y(n54) );
  MUX2X1 U50 ( .B(n58), .A(n59), .S(count_out[2]), .Y(n46) );
  AOI21X1 U51 ( .A(n57), .B(n60), .C(n56), .Y(n59) );
  OAI21X1 U52 ( .A(count_out[0]), .B(n61), .C(n50), .Y(n56) );
  NAND3X1 U53 ( .A(count_out[0]), .B(count_out[1]), .C(n57), .Y(n58) );
  MUX2X1 U54 ( .B(n62), .A(n63), .S(count_out[3]), .Y(n45) );
  INVX1 U55 ( .A(n64), .Y(n63) );
  NAND2X1 U56 ( .A(n65), .B(n57), .Y(n62) );
  OAI21X1 U57 ( .A(n66), .B(n67), .C(n68), .Y(n44) );
  OAI21X1 U58 ( .A(n57), .B(n64), .C(count_out[4]), .Y(n68) );
  OAI21X1 U59 ( .A(n65), .B(n61), .C(n50), .Y(n64) );
  INVX1 U60 ( .A(n69), .Y(n50) );
  INVX1 U61 ( .A(n66), .Y(n65) );
  NAND2X1 U62 ( .A(n57), .B(count_out[3]), .Y(n67) );
  INVX1 U63 ( .A(n61), .Y(n57) );
  NAND2X1 U64 ( .A(n53), .B(n70), .Y(n61) );
  INVX1 U65 ( .A(n52), .Y(n70) );
  OAI22X1 U66 ( .A(rollover_val[4]), .B(n71), .C(n72), .D(n73), .Y(n52) );
  OAI21X1 U67 ( .A(count_out[3]), .B(n74), .C(n75), .Y(n73) );
  INVX1 U68 ( .A(n76), .Y(n75) );
  AOI21X1 U69 ( .A(n74), .B(count_out[3]), .C(n77), .Y(n76) );
  OAI21X1 U70 ( .A(rollover_val[2]), .B(n78), .C(n79), .Y(n74) );
  OAI21X1 U71 ( .A(count_out[2]), .B(n80), .C(n81), .Y(n79) );
  AOI22X1 U72 ( .A(n82), .B(rollover_val[0]), .C(rollover_val[1]), .D(n60), 
        .Y(n81) );
  AOI21X1 U73 ( .A(count_out[1]), .B(n83), .C(count_out[0]), .Y(n82) );
  INVX1 U74 ( .A(rollover_val[2]), .Y(n80) );
  AND2X1 U75 ( .A(n71), .B(rollover_val[4]), .Y(n72) );
  NAND3X1 U76 ( .A(count_out[1]), .B(count_out[2]), .C(count_out[0]), .Y(n66)
         );
  OAI21X1 U77 ( .A(n84), .B(n85), .C(n86), .Y(n43) );
  NAND2X1 U78 ( .A(rollover_flag), .B(n69), .Y(n86) );
  NAND3X1 U79 ( .A(n87), .B(n53), .C(n88), .Y(n85) );
  MUX2X1 U80 ( .B(n89), .A(n90), .S(n91), .Y(n88) );
  NAND2X1 U81 ( .A(n92), .B(count_out[2]), .Y(n90) );
  MUX2X1 U82 ( .B(n93), .A(count_out[3]), .S(rollover_val[3]), .Y(n92) );
  NAND2X1 U83 ( .A(rollover_val[4]), .B(count_out[3]), .Y(n93) );
  OAI21X1 U84 ( .A(n94), .B(n78), .C(n95), .Y(n89) );
  XOR2X1 U85 ( .A(n77), .B(count_out[3]), .Y(n95) );
  AND2X1 U86 ( .A(n96), .B(rollover_val[2]), .Y(n94) );
  NOR2X1 U87 ( .A(n69), .B(clear), .Y(n53) );
  NOR2X1 U88 ( .A(count_enable), .B(clear), .Y(n69) );
  XOR2X1 U89 ( .A(n97), .B(n98), .Y(n87) );
  AND2X1 U90 ( .A(n77), .B(n91), .Y(n98) );
  NOR2X1 U91 ( .A(n96), .B(rollover_val[2]), .Y(n91) );
  INVX1 U92 ( .A(rollover_val[3]), .Y(n77) );
  XOR2X1 U93 ( .A(n71), .B(rollover_val[4]), .Y(n97) );
  INVX1 U94 ( .A(count_out[4]), .Y(n71) );
  NAND3X1 U95 ( .A(n99), .B(n100), .C(n101), .Y(n84) );
  XOR2X1 U96 ( .A(n60), .B(n102), .Y(n101) );
  OAI21X1 U97 ( .A(n103), .B(n83), .C(n96), .Y(n102) );
  INVX1 U98 ( .A(count_out[1]), .Y(n60) );
  NAND3X1 U99 ( .A(n96), .B(n78), .C(rollover_val[2]), .Y(n100) );
  INVX1 U100 ( .A(count_out[2]), .Y(n78) );
  NAND2X1 U101 ( .A(n103), .B(n83), .Y(n96) );
  INVX1 U102 ( .A(rollover_val[1]), .Y(n83) );
  INVX1 U103 ( .A(rollover_val[0]), .Y(n103) );
  XOR2X1 U104 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n99) );
endmodule

