/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct 29 13:18:54 2019
/////////////////////////////////////////////////////////////


module layout_lab_usb_out_ctrl ( clk, n_rst, d_plus, d_minus, bus_mode, 
        tx_value );
  input [1:0] bus_mode;
  input clk, n_rst, tx_value;
  output d_plus, d_minus;
  wire   n5, n6, n7, n8, n9, n10, n11, n3, n4;

  DFFSR d_minus_reg_reg ( .D(n11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d_minus)
         );
  DFFSR d_plus_reg_reg ( .D(n10), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_plus)
         );
  OAI21X1 U7 ( .A(n5), .B(n6), .C(n7), .Y(n10) );
  NAND2X1 U8 ( .A(d_plus), .B(n5), .Y(n7) );
  AOI22X1 U9 ( .A(n4), .B(n3), .C(tx_value), .D(bus_mode[0]), .Y(n6) );
  OAI21X1 U10 ( .A(n4), .B(n8), .C(n9), .Y(n11) );
  NAND2X1 U11 ( .A(d_minus), .B(n5), .Y(n9) );
  OR2X1 U12 ( .A(n5), .B(tx_value), .Y(n8) );
  NOR2X1 U13 ( .A(n3), .B(n4), .Y(n5) );
  INVX2 U5 ( .A(bus_mode[1]), .Y(n3) );
  INVX2 U6 ( .A(bus_mode[0]), .Y(n4) );
endmodule


module layout_lab_usb_encoder ( clk, n_rst, tx_bit, shift_enable, tx_value );
  input clk, n_rst, tx_bit, shift_enable;
  output tx_value;
  wire   last_bit, n1, n2, n4;

  DFFSR last_bit_reg ( .D(n2), .CLK(clk), .R(1'b1), .S(n_rst), .Q(last_bit) );
  AOI22X1 U3 ( .A(shift_enable), .B(tx_bit), .C(n4), .D(last_bit), .Y(n1) );
  XNOR2X1 U5 ( .A(last_bit), .B(tx_bit), .Y(tx_value) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(shift_enable), .Y(n4) );
endmodule


module layout_lab_usb_tx_sr_1 ( clk, n_rst, shift_enable, tx_enable, tx_data, 
        load_data, tx_out );
  input [7:0] tx_data;
  input clk, n_rst, shift_enable, tx_enable, load_data;
  output tx_out;
  wire   n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n37, n38;
  wire   [7:1] curr_val;

  DFFSR \curr_val_reg[7]  ( .D(n30), .CLK(clk), .R(n9), .S(1'b1), .Q(
        curr_val[7]) );
  DFFSR \curr_val_reg[6]  ( .D(n31), .CLK(clk), .R(n9), .S(1'b1), .Q(
        curr_val[6]) );
  DFFSR \curr_val_reg[5]  ( .D(n32), .CLK(clk), .R(n9), .S(1'b1), .Q(
        curr_val[5]) );
  DFFSR \curr_val_reg[4]  ( .D(n33), .CLK(clk), .R(n9), .S(1'b1), .Q(
        curr_val[4]) );
  DFFSR \curr_val_reg[3]  ( .D(n34), .CLK(clk), .R(n9), .S(1'b1), .Q(
        curr_val[3]) );
  DFFSR \curr_val_reg[2]  ( .D(n35), .CLK(clk), .R(n9), .S(1'b1), .Q(
        curr_val[2]) );
  DFFSR \curr_val_reg[1]  ( .D(n36), .CLK(clk), .R(n9), .S(1'b1), .Q(
        curr_val[1]) );
  DFFSR \curr_val_reg[0]  ( .D(n29), .CLK(clk), .R(n9), .S(1'b1), .Q(tx_out)
         );
  AND2X2 U11 ( .A(tx_enable), .B(shift_enable), .Y(n28) );
  OAI21X1 U21 ( .A(n12), .B(n38), .C(n18), .Y(n29) );
  AOI22X1 U22 ( .A(tx_data[0]), .B(load_data), .C(curr_val[1]), .D(n19), .Y(
        n18) );
  OAI21X1 U23 ( .A(n20), .B(n11), .C(n21), .Y(n30) );
  AOI21X1 U24 ( .A(curr_val[7]), .B(n20), .C(n19), .Y(n21) );
  OAI21X1 U25 ( .A(n12), .B(n13), .C(n22), .Y(n31) );
  AOI22X1 U26 ( .A(tx_data[6]), .B(load_data), .C(curr_val[7]), .D(n19), .Y(
        n22) );
  OAI21X1 U27 ( .A(n12), .B(n14), .C(n23), .Y(n32) );
  AOI22X1 U28 ( .A(tx_data[5]), .B(load_data), .C(curr_val[6]), .D(n19), .Y(
        n23) );
  OAI21X1 U29 ( .A(n12), .B(n15), .C(n24), .Y(n33) );
  AOI22X1 U30 ( .A(tx_data[4]), .B(load_data), .C(curr_val[5]), .D(n19), .Y(
        n24) );
  OAI21X1 U31 ( .A(n12), .B(n16), .C(n25), .Y(n34) );
  AOI22X1 U32 ( .A(tx_data[3]), .B(load_data), .C(curr_val[4]), .D(n19), .Y(
        n25) );
  OAI21X1 U33 ( .A(n12), .B(n17), .C(n26), .Y(n35) );
  AOI22X1 U34 ( .A(tx_data[2]), .B(load_data), .C(curr_val[3]), .D(n19), .Y(
        n26) );
  OAI21X1 U35 ( .A(n37), .B(n12), .C(n27), .Y(n36) );
  AOI22X1 U36 ( .A(tx_data[1]), .B(load_data), .C(curr_val[2]), .D(n19), .Y(
        n27) );
  NOR2X1 U37 ( .A(n20), .B(load_data), .Y(n19) );
  NOR2X1 U38 ( .A(load_data), .B(n28), .Y(n20) );
  INVX2 U12 ( .A(n10), .Y(n9) );
  INVX2 U13 ( .A(n_rst), .Y(n10) );
  INVX2 U14 ( .A(tx_data[7]), .Y(n11) );
  INVX2 U15 ( .A(n20), .Y(n12) );
  INVX2 U16 ( .A(curr_val[6]), .Y(n13) );
  INVX2 U17 ( .A(curr_val[5]), .Y(n14) );
  INVX2 U18 ( .A(curr_val[4]), .Y(n15) );
  INVX2 U19 ( .A(curr_val[3]), .Y(n16) );
  INVX2 U20 ( .A(curr_val[2]), .Y(n17) );
  INVX2 U39 ( .A(curr_val[1]), .Y(n37) );
  INVX2 U40 ( .A(tx_out), .Y(n38) );
endmodule


module layout_lab_usb_tx_sr_0 ( clk, n_rst, shift_enable, tx_enable, tx_data, 
        load_data, tx_out );
  input [7:0] tx_data;
  input clk, n_rst, shift_enable, tx_enable, load_data;
  output tx_out;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59;
  wire   [7:1] curr_val;

  DFFSR \curr_val_reg[7]  ( .D(n47), .CLK(clk), .R(n11), .S(1'b1), .Q(
        curr_val[7]) );
  DFFSR \curr_val_reg[6]  ( .D(n46), .CLK(clk), .R(n11), .S(1'b1), .Q(
        curr_val[6]) );
  DFFSR \curr_val_reg[5]  ( .D(n45), .CLK(clk), .R(n11), .S(1'b1), .Q(
        curr_val[5]) );
  DFFSR \curr_val_reg[4]  ( .D(n44), .CLK(clk), .R(n11), .S(1'b1), .Q(
        curr_val[4]) );
  DFFSR \curr_val_reg[3]  ( .D(n43), .CLK(clk), .R(n11), .S(1'b1), .Q(
        curr_val[3]) );
  DFFSR \curr_val_reg[2]  ( .D(n42), .CLK(clk), .R(n11), .S(1'b1), .Q(
        curr_val[2]) );
  DFFSR \curr_val_reg[1]  ( .D(n41), .CLK(clk), .R(n11), .S(1'b1), .Q(
        curr_val[1]) );
  DFFSR \curr_val_reg[0]  ( .D(n48), .CLK(clk), .R(n11), .S(1'b1), .Q(tx_out)
         );
  AND2X2 U11 ( .A(tx_enable), .B(shift_enable), .Y(n49) );
  OAI21X1 U21 ( .A(n40), .B(n38), .C(n59), .Y(n48) );
  AOI22X1 U22 ( .A(tx_data[0]), .B(n10), .C(curr_val[1]), .D(n58), .Y(n59) );
  OAI21X1 U23 ( .A(n57), .B(n39), .C(n56), .Y(n47) );
  AOI21X1 U24 ( .A(curr_val[7]), .B(n57), .C(n58), .Y(n56) );
  OAI21X1 U25 ( .A(n40), .B(n13), .C(n55), .Y(n46) );
  AOI22X1 U26 ( .A(tx_data[6]), .B(n10), .C(curr_val[7]), .D(n58), .Y(n55) );
  OAI21X1 U27 ( .A(n40), .B(n14), .C(n54), .Y(n45) );
  AOI22X1 U28 ( .A(tx_data[5]), .B(n10), .C(curr_val[6]), .D(n58), .Y(n54) );
  OAI21X1 U29 ( .A(n40), .B(n15), .C(n53), .Y(n44) );
  AOI22X1 U30 ( .A(tx_data[4]), .B(n10), .C(curr_val[5]), .D(n58), .Y(n53) );
  OAI21X1 U31 ( .A(n40), .B(n16), .C(n52), .Y(n43) );
  AOI22X1 U32 ( .A(tx_data[3]), .B(n10), .C(curr_val[4]), .D(n58), .Y(n52) );
  OAI21X1 U33 ( .A(n40), .B(n17), .C(n51), .Y(n42) );
  AOI22X1 U34 ( .A(tx_data[2]), .B(n10), .C(curr_val[3]), .D(n58), .Y(n51) );
  OAI21X1 U35 ( .A(n37), .B(n40), .C(n50), .Y(n41) );
  AOI22X1 U36 ( .A(tx_data[1]), .B(n10), .C(curr_val[2]), .D(n58), .Y(n50) );
  NOR2X1 U37 ( .A(n57), .B(n10), .Y(n58) );
  NOR2X1 U38 ( .A(n10), .B(n49), .Y(n57) );
  INVX2 U12 ( .A(n9), .Y(n10) );
  INVX2 U13 ( .A(n12), .Y(n11) );
  INVX2 U14 ( .A(n_rst), .Y(n12) );
  INVX2 U15 ( .A(load_data), .Y(n9) );
  INVX2 U16 ( .A(curr_val[6]), .Y(n13) );
  INVX2 U17 ( .A(curr_val[5]), .Y(n14) );
  INVX2 U18 ( .A(curr_val[4]), .Y(n15) );
  INVX2 U19 ( .A(curr_val[3]), .Y(n16) );
  INVX2 U20 ( .A(curr_val[2]), .Y(n17) );
  INVX2 U39 ( .A(curr_val[1]), .Y(n37) );
  INVX2 U40 ( .A(tx_out), .Y(n38) );
  INVX2 U41 ( .A(tx_data[7]), .Y(n39) );
  INVX2 U42 ( .A(n57), .Y(n40) );
endmodule


module fiforam ( wclk, wenable, waddr, raddr, wdata, rdata );
  input [2:0] waddr;
  input [2:0] raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wenable;
  wire   N10, N11, N12, N13, N14, N15, \fiforeg[0][7] , \fiforeg[0][6] ,
         \fiforeg[0][5] , \fiforeg[0][4] , \fiforeg[0][3] , \fiforeg[0][2] ,
         \fiforeg[0][1] , \fiforeg[0][0] , \fiforeg[1][7] , \fiforeg[1][6] ,
         \fiforeg[1][5] , \fiforeg[1][4] , \fiforeg[1][3] , \fiforeg[1][2] ,
         \fiforeg[1][1] , \fiforeg[1][0] , \fiforeg[2][7] , \fiforeg[2][6] ,
         \fiforeg[2][5] , \fiforeg[2][4] , \fiforeg[2][3] , \fiforeg[2][2] ,
         \fiforeg[2][1] , \fiforeg[2][0] , \fiforeg[3][7] , \fiforeg[3][6] ,
         \fiforeg[3][5] , \fiforeg[3][4] , \fiforeg[3][3] , \fiforeg[3][2] ,
         \fiforeg[3][1] , \fiforeg[3][0] , \fiforeg[4][7] , \fiforeg[4][6] ,
         \fiforeg[4][5] , \fiforeg[4][4] , \fiforeg[4][3] , \fiforeg[4][2] ,
         \fiforeg[4][1] , \fiforeg[4][0] , \fiforeg[5][7] , \fiforeg[5][6] ,
         \fiforeg[5][5] , \fiforeg[5][4] , \fiforeg[5][3] , \fiforeg[5][2] ,
         \fiforeg[5][1] , \fiforeg[5][0] , \fiforeg[6][7] , \fiforeg[6][6] ,
         \fiforeg[6][5] , \fiforeg[6][4] , \fiforeg[6][3] , \fiforeg[6][2] ,
         \fiforeg[6][1] , \fiforeg[6][0] , \fiforeg[7][7] , \fiforeg[7][6] ,
         \fiforeg[7][5] , \fiforeg[7][4] , \fiforeg[7][3] , \fiforeg[7][2] ,
         \fiforeg[7][1] , \fiforeg[7][0] , N17, N18, N19, N20, N21, N22, N23,
         N24, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n28, n29, n30, n81, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign N13 = waddr[0];
  assign N14 = waddr[1];
  assign N15 = waddr[2];

  DFFPOSX1 \fiforeg_reg[0][7]  ( .D(n152), .CLK(wclk), .Q(\fiforeg[0][7] ) );
  DFFPOSX1 \fiforeg_reg[0][6]  ( .D(n151), .CLK(wclk), .Q(\fiforeg[0][6] ) );
  DFFPOSX1 \fiforeg_reg[0][5]  ( .D(n150), .CLK(wclk), .Q(\fiforeg[0][5] ) );
  DFFPOSX1 \fiforeg_reg[0][4]  ( .D(n149), .CLK(wclk), .Q(\fiforeg[0][4] ) );
  DFFPOSX1 \fiforeg_reg[0][3]  ( .D(n148), .CLK(wclk), .Q(\fiforeg[0][3] ) );
  DFFPOSX1 \fiforeg_reg[0][2]  ( .D(n147), .CLK(wclk), .Q(\fiforeg[0][2] ) );
  DFFPOSX1 \fiforeg_reg[0][1]  ( .D(n146), .CLK(wclk), .Q(\fiforeg[0][1] ) );
  DFFPOSX1 \fiforeg_reg[0][0]  ( .D(n145), .CLK(wclk), .Q(\fiforeg[0][0] ) );
  DFFPOSX1 \fiforeg_reg[1][7]  ( .D(n144), .CLK(wclk), .Q(\fiforeg[1][7] ) );
  DFFPOSX1 \fiforeg_reg[1][6]  ( .D(n143), .CLK(wclk), .Q(\fiforeg[1][6] ) );
  DFFPOSX1 \fiforeg_reg[1][5]  ( .D(n142), .CLK(wclk), .Q(\fiforeg[1][5] ) );
  DFFPOSX1 \fiforeg_reg[1][4]  ( .D(n141), .CLK(wclk), .Q(\fiforeg[1][4] ) );
  DFFPOSX1 \fiforeg_reg[1][3]  ( .D(n140), .CLK(wclk), .Q(\fiforeg[1][3] ) );
  DFFPOSX1 \fiforeg_reg[1][2]  ( .D(n139), .CLK(wclk), .Q(\fiforeg[1][2] ) );
  DFFPOSX1 \fiforeg_reg[1][1]  ( .D(n138), .CLK(wclk), .Q(\fiforeg[1][1] ) );
  DFFPOSX1 \fiforeg_reg[1][0]  ( .D(n137), .CLK(wclk), .Q(\fiforeg[1][0] ) );
  DFFPOSX1 \fiforeg_reg[2][7]  ( .D(n136), .CLK(wclk), .Q(\fiforeg[2][7] ) );
  DFFPOSX1 \fiforeg_reg[2][6]  ( .D(n135), .CLK(wclk), .Q(\fiforeg[2][6] ) );
  DFFPOSX1 \fiforeg_reg[2][5]  ( .D(n134), .CLK(wclk), .Q(\fiforeg[2][5] ) );
  DFFPOSX1 \fiforeg_reg[2][4]  ( .D(n133), .CLK(wclk), .Q(\fiforeg[2][4] ) );
  DFFPOSX1 \fiforeg_reg[2][3]  ( .D(n132), .CLK(wclk), .Q(\fiforeg[2][3] ) );
  DFFPOSX1 \fiforeg_reg[2][2]  ( .D(n131), .CLK(wclk), .Q(\fiforeg[2][2] ) );
  DFFPOSX1 \fiforeg_reg[2][1]  ( .D(n130), .CLK(wclk), .Q(\fiforeg[2][1] ) );
  DFFPOSX1 \fiforeg_reg[2][0]  ( .D(n129), .CLK(wclk), .Q(\fiforeg[2][0] ) );
  DFFPOSX1 \fiforeg_reg[3][7]  ( .D(n128), .CLK(wclk), .Q(\fiforeg[3][7] ) );
  DFFPOSX1 \fiforeg_reg[3][6]  ( .D(n127), .CLK(wclk), .Q(\fiforeg[3][6] ) );
  DFFPOSX1 \fiforeg_reg[3][5]  ( .D(n126), .CLK(wclk), .Q(\fiforeg[3][5] ) );
  DFFPOSX1 \fiforeg_reg[3][4]  ( .D(n125), .CLK(wclk), .Q(\fiforeg[3][4] ) );
  DFFPOSX1 \fiforeg_reg[3][3]  ( .D(n124), .CLK(wclk), .Q(\fiforeg[3][3] ) );
  DFFPOSX1 \fiforeg_reg[3][2]  ( .D(n123), .CLK(wclk), .Q(\fiforeg[3][2] ) );
  DFFPOSX1 \fiforeg_reg[3][1]  ( .D(n122), .CLK(wclk), .Q(\fiforeg[3][1] ) );
  DFFPOSX1 \fiforeg_reg[3][0]  ( .D(n121), .CLK(wclk), .Q(\fiforeg[3][0] ) );
  DFFPOSX1 \fiforeg_reg[4][7]  ( .D(n120), .CLK(wclk), .Q(\fiforeg[4][7] ) );
  DFFPOSX1 \fiforeg_reg[4][6]  ( .D(n119), .CLK(wclk), .Q(\fiforeg[4][6] ) );
  DFFPOSX1 \fiforeg_reg[4][5]  ( .D(n118), .CLK(wclk), .Q(\fiforeg[4][5] ) );
  DFFPOSX1 \fiforeg_reg[4][4]  ( .D(n117), .CLK(wclk), .Q(\fiforeg[4][4] ) );
  DFFPOSX1 \fiforeg_reg[4][3]  ( .D(n116), .CLK(wclk), .Q(\fiforeg[4][3] ) );
  DFFPOSX1 \fiforeg_reg[4][2]  ( .D(n115), .CLK(wclk), .Q(\fiforeg[4][2] ) );
  DFFPOSX1 \fiforeg_reg[4][1]  ( .D(n114), .CLK(wclk), .Q(\fiforeg[4][1] ) );
  DFFPOSX1 \fiforeg_reg[4][0]  ( .D(n113), .CLK(wclk), .Q(\fiforeg[4][0] ) );
  DFFPOSX1 \fiforeg_reg[5][7]  ( .D(n112), .CLK(wclk), .Q(\fiforeg[5][7] ) );
  DFFPOSX1 \fiforeg_reg[5][6]  ( .D(n111), .CLK(wclk), .Q(\fiforeg[5][6] ) );
  DFFPOSX1 \fiforeg_reg[5][5]  ( .D(n110), .CLK(wclk), .Q(\fiforeg[5][5] ) );
  DFFPOSX1 \fiforeg_reg[5][4]  ( .D(n109), .CLK(wclk), .Q(\fiforeg[5][4] ) );
  DFFPOSX1 \fiforeg_reg[5][3]  ( .D(n108), .CLK(wclk), .Q(\fiforeg[5][3] ) );
  DFFPOSX1 \fiforeg_reg[5][2]  ( .D(n107), .CLK(wclk), .Q(\fiforeg[5][2] ) );
  DFFPOSX1 \fiforeg_reg[5][1]  ( .D(n106), .CLK(wclk), .Q(\fiforeg[5][1] ) );
  DFFPOSX1 \fiforeg_reg[5][0]  ( .D(n105), .CLK(wclk), .Q(\fiforeg[5][0] ) );
  DFFPOSX1 \fiforeg_reg[6][7]  ( .D(n104), .CLK(wclk), .Q(\fiforeg[6][7] ) );
  DFFPOSX1 \fiforeg_reg[6][6]  ( .D(n103), .CLK(wclk), .Q(\fiforeg[6][6] ) );
  DFFPOSX1 \fiforeg_reg[6][5]  ( .D(n102), .CLK(wclk), .Q(\fiforeg[6][5] ) );
  DFFPOSX1 \fiforeg_reg[6][4]  ( .D(n101), .CLK(wclk), .Q(\fiforeg[6][4] ) );
  DFFPOSX1 \fiforeg_reg[6][3]  ( .D(n100), .CLK(wclk), .Q(\fiforeg[6][3] ) );
  DFFPOSX1 \fiforeg_reg[6][2]  ( .D(n99), .CLK(wclk), .Q(\fiforeg[6][2] ) );
  DFFPOSX1 \fiforeg_reg[6][1]  ( .D(n98), .CLK(wclk), .Q(\fiforeg[6][1] ) );
  DFFPOSX1 \fiforeg_reg[6][0]  ( .D(n97), .CLK(wclk), .Q(\fiforeg[6][0] ) );
  DFFPOSX1 \fiforeg_reg[7][7]  ( .D(n96), .CLK(wclk), .Q(\fiforeg[7][7] ) );
  DFFPOSX1 \fiforeg_reg[7][6]  ( .D(n95), .CLK(wclk), .Q(\fiforeg[7][6] ) );
  DFFPOSX1 \fiforeg_reg[7][5]  ( .D(n94), .CLK(wclk), .Q(\fiforeg[7][5] ) );
  DFFPOSX1 \fiforeg_reg[7][4]  ( .D(n93), .CLK(wclk), .Q(\fiforeg[7][4] ) );
  DFFPOSX1 \fiforeg_reg[7][3]  ( .D(n92), .CLK(wclk), .Q(\fiforeg[7][3] ) );
  DFFPOSX1 \fiforeg_reg[7][2]  ( .D(n91), .CLK(wclk), .Q(\fiforeg[7][2] ) );
  DFFPOSX1 \fiforeg_reg[7][1]  ( .D(n90), .CLK(wclk), .Q(\fiforeg[7][1] ) );
  DFFPOSX1 \fiforeg_reg[7][0]  ( .D(n89), .CLK(wclk), .Q(\fiforeg[7][0] ) );
  OAI21X1 U2 ( .A(n1), .B(n2), .C(n3), .Y(n89) );
  NAND2X1 U3 ( .A(\fiforeg[7][0] ), .B(n2), .Y(n3) );
  OAI21X1 U4 ( .A(n4), .B(n2), .C(n5), .Y(n90) );
  NAND2X1 U5 ( .A(\fiforeg[7][1] ), .B(n2), .Y(n5) );
  OAI21X1 U6 ( .A(n6), .B(n2), .C(n7), .Y(n91) );
  NAND2X1 U7 ( .A(\fiforeg[7][2] ), .B(n2), .Y(n7) );
  OAI21X1 U8 ( .A(n8), .B(n2), .C(n9), .Y(n92) );
  NAND2X1 U9 ( .A(\fiforeg[7][3] ), .B(n2), .Y(n9) );
  OAI21X1 U10 ( .A(n10), .B(n2), .C(n11), .Y(n93) );
  NAND2X1 U11 ( .A(\fiforeg[7][4] ), .B(n2), .Y(n11) );
  OAI21X1 U12 ( .A(n12), .B(n2), .C(n13), .Y(n94) );
  NAND2X1 U13 ( .A(\fiforeg[7][5] ), .B(n2), .Y(n13) );
  OAI21X1 U14 ( .A(n14), .B(n2), .C(n15), .Y(n95) );
  NAND2X1 U15 ( .A(\fiforeg[7][6] ), .B(n2), .Y(n15) );
  OAI21X1 U16 ( .A(n16), .B(n2), .C(n17), .Y(n96) );
  NAND2X1 U17 ( .A(\fiforeg[7][7] ), .B(n2), .Y(n17) );
  NAND2X1 U18 ( .A(N13), .B(n18), .Y(n2) );
  OAI21X1 U19 ( .A(n1), .B(n19), .C(n20), .Y(n97) );
  NAND2X1 U20 ( .A(\fiforeg[6][0] ), .B(n19), .Y(n20) );
  OAI21X1 U21 ( .A(n4), .B(n19), .C(n21), .Y(n98) );
  NAND2X1 U22 ( .A(\fiforeg[6][1] ), .B(n19), .Y(n21) );
  OAI21X1 U23 ( .A(n6), .B(n19), .C(n22), .Y(n99) );
  NAND2X1 U24 ( .A(\fiforeg[6][2] ), .B(n19), .Y(n22) );
  OAI21X1 U25 ( .A(n8), .B(n19), .C(n23), .Y(n100) );
  NAND2X1 U26 ( .A(\fiforeg[6][3] ), .B(n19), .Y(n23) );
  OAI21X1 U27 ( .A(n10), .B(n19), .C(n24), .Y(n101) );
  NAND2X1 U28 ( .A(\fiforeg[6][4] ), .B(n19), .Y(n24) );
  OAI21X1 U29 ( .A(n12), .B(n19), .C(n25), .Y(n102) );
  NAND2X1 U30 ( .A(\fiforeg[6][5] ), .B(n19), .Y(n25) );
  OAI21X1 U31 ( .A(n14), .B(n19), .C(n26), .Y(n103) );
  NAND2X1 U32 ( .A(\fiforeg[6][6] ), .B(n19), .Y(n26) );
  OAI21X1 U33 ( .A(n16), .B(n19), .C(n27), .Y(n104) );
  NAND2X1 U34 ( .A(\fiforeg[6][7] ), .B(n19), .Y(n27) );
  NAND2X1 U35 ( .A(n18), .B(n261), .Y(n19) );
  NOR2X1 U36 ( .A(n262), .B(n265), .Y(n18) );
  OAI21X1 U37 ( .A(n1), .B(n31), .C(n32), .Y(n105) );
  NAND2X1 U38 ( .A(\fiforeg[5][0] ), .B(n31), .Y(n32) );
  OAI21X1 U39 ( .A(n4), .B(n31), .C(n33), .Y(n106) );
  NAND2X1 U40 ( .A(\fiforeg[5][1] ), .B(n31), .Y(n33) );
  OAI21X1 U41 ( .A(n6), .B(n31), .C(n34), .Y(n107) );
  NAND2X1 U42 ( .A(\fiforeg[5][2] ), .B(n31), .Y(n34) );
  OAI21X1 U43 ( .A(n8), .B(n31), .C(n35), .Y(n108) );
  NAND2X1 U44 ( .A(\fiforeg[5][3] ), .B(n31), .Y(n35) );
  OAI21X1 U45 ( .A(n10), .B(n31), .C(n36), .Y(n109) );
  NAND2X1 U46 ( .A(\fiforeg[5][4] ), .B(n31), .Y(n36) );
  OAI21X1 U47 ( .A(n12), .B(n31), .C(n37), .Y(n110) );
  NAND2X1 U48 ( .A(\fiforeg[5][5] ), .B(n31), .Y(n37) );
  OAI21X1 U49 ( .A(n14), .B(n31), .C(n38), .Y(n111) );
  NAND2X1 U50 ( .A(\fiforeg[5][6] ), .B(n31), .Y(n38) );
  OAI21X1 U51 ( .A(n16), .B(n31), .C(n39), .Y(n112) );
  NAND2X1 U52 ( .A(\fiforeg[5][7] ), .B(n31), .Y(n39) );
  NAND2X1 U53 ( .A(n40), .B(N13), .Y(n31) );
  OAI21X1 U54 ( .A(n1), .B(n41), .C(n42), .Y(n113) );
  NAND2X1 U55 ( .A(\fiforeg[4][0] ), .B(n41), .Y(n42) );
  OAI21X1 U56 ( .A(n4), .B(n41), .C(n43), .Y(n114) );
  NAND2X1 U57 ( .A(\fiforeg[4][1] ), .B(n41), .Y(n43) );
  OAI21X1 U58 ( .A(n6), .B(n41), .C(n44), .Y(n115) );
  NAND2X1 U59 ( .A(\fiforeg[4][2] ), .B(n41), .Y(n44) );
  OAI21X1 U60 ( .A(n8), .B(n41), .C(n45), .Y(n116) );
  NAND2X1 U61 ( .A(\fiforeg[4][3] ), .B(n41), .Y(n45) );
  OAI21X1 U62 ( .A(n10), .B(n41), .C(n46), .Y(n117) );
  NAND2X1 U63 ( .A(\fiforeg[4][4] ), .B(n41), .Y(n46) );
  OAI21X1 U64 ( .A(n12), .B(n41), .C(n47), .Y(n118) );
  NAND2X1 U65 ( .A(\fiforeg[4][5] ), .B(n41), .Y(n47) );
  OAI21X1 U66 ( .A(n14), .B(n41), .C(n48), .Y(n119) );
  NAND2X1 U67 ( .A(\fiforeg[4][6] ), .B(n41), .Y(n48) );
  OAI21X1 U68 ( .A(n16), .B(n41), .C(n49), .Y(n120) );
  NAND2X1 U69 ( .A(\fiforeg[4][7] ), .B(n41), .Y(n49) );
  NAND2X1 U70 ( .A(n40), .B(n261), .Y(n41) );
  NOR2X1 U71 ( .A(n262), .B(N14), .Y(n40) );
  OAI21X1 U73 ( .A(n1), .B(n50), .C(n51), .Y(n121) );
  NAND2X1 U74 ( .A(\fiforeg[3][0] ), .B(n50), .Y(n51) );
  OAI21X1 U75 ( .A(n4), .B(n50), .C(n52), .Y(n122) );
  NAND2X1 U76 ( .A(\fiforeg[3][1] ), .B(n50), .Y(n52) );
  OAI21X1 U77 ( .A(n6), .B(n50), .C(n53), .Y(n123) );
  NAND2X1 U78 ( .A(\fiforeg[3][2] ), .B(n50), .Y(n53) );
  OAI21X1 U79 ( .A(n8), .B(n50), .C(n54), .Y(n124) );
  NAND2X1 U80 ( .A(\fiforeg[3][3] ), .B(n50), .Y(n54) );
  OAI21X1 U81 ( .A(n10), .B(n50), .C(n55), .Y(n125) );
  NAND2X1 U82 ( .A(\fiforeg[3][4] ), .B(n50), .Y(n55) );
  OAI21X1 U83 ( .A(n12), .B(n50), .C(n56), .Y(n126) );
  NAND2X1 U84 ( .A(\fiforeg[3][5] ), .B(n50), .Y(n56) );
  OAI21X1 U85 ( .A(n14), .B(n50), .C(n57), .Y(n127) );
  NAND2X1 U86 ( .A(\fiforeg[3][6] ), .B(n50), .Y(n57) );
  OAI21X1 U87 ( .A(n16), .B(n50), .C(n58), .Y(n128) );
  NAND2X1 U88 ( .A(\fiforeg[3][7] ), .B(n50), .Y(n58) );
  NAND2X1 U89 ( .A(n59), .B(N13), .Y(n50) );
  OAI21X1 U90 ( .A(n1), .B(n60), .C(n61), .Y(n129) );
  NAND2X1 U91 ( .A(\fiforeg[2][0] ), .B(n60), .Y(n61) );
  OAI21X1 U92 ( .A(n4), .B(n60), .C(n62), .Y(n130) );
  NAND2X1 U93 ( .A(\fiforeg[2][1] ), .B(n60), .Y(n62) );
  OAI21X1 U94 ( .A(n6), .B(n60), .C(n63), .Y(n131) );
  NAND2X1 U95 ( .A(\fiforeg[2][2] ), .B(n60), .Y(n63) );
  OAI21X1 U96 ( .A(n8), .B(n60), .C(n64), .Y(n132) );
  NAND2X1 U97 ( .A(\fiforeg[2][3] ), .B(n60), .Y(n64) );
  OAI21X1 U98 ( .A(n10), .B(n60), .C(n65), .Y(n133) );
  NAND2X1 U99 ( .A(\fiforeg[2][4] ), .B(n60), .Y(n65) );
  OAI21X1 U100 ( .A(n12), .B(n60), .C(n66), .Y(n134) );
  NAND2X1 U101 ( .A(\fiforeg[2][5] ), .B(n60), .Y(n66) );
  OAI21X1 U102 ( .A(n14), .B(n60), .C(n67), .Y(n135) );
  NAND2X1 U103 ( .A(\fiforeg[2][6] ), .B(n60), .Y(n67) );
  OAI21X1 U104 ( .A(n16), .B(n60), .C(n68), .Y(n136) );
  NAND2X1 U105 ( .A(\fiforeg[2][7] ), .B(n60), .Y(n68) );
  NAND2X1 U106 ( .A(n59), .B(n261), .Y(n60) );
  NOR2X1 U107 ( .A(n265), .B(N15), .Y(n59) );
  OAI21X1 U109 ( .A(n1), .B(n69), .C(n70), .Y(n137) );
  NAND2X1 U110 ( .A(\fiforeg[1][0] ), .B(n69), .Y(n70) );
  OAI21X1 U111 ( .A(n4), .B(n69), .C(n71), .Y(n138) );
  NAND2X1 U112 ( .A(\fiforeg[1][1] ), .B(n69), .Y(n71) );
  OAI21X1 U113 ( .A(n6), .B(n69), .C(n72), .Y(n139) );
  NAND2X1 U114 ( .A(\fiforeg[1][2] ), .B(n69), .Y(n72) );
  OAI21X1 U115 ( .A(n8), .B(n69), .C(n73), .Y(n140) );
  NAND2X1 U116 ( .A(\fiforeg[1][3] ), .B(n69), .Y(n73) );
  OAI21X1 U117 ( .A(n10), .B(n69), .C(n74), .Y(n141) );
  NAND2X1 U118 ( .A(\fiforeg[1][4] ), .B(n69), .Y(n74) );
  OAI21X1 U119 ( .A(n12), .B(n69), .C(n75), .Y(n142) );
  NAND2X1 U120 ( .A(\fiforeg[1][5] ), .B(n69), .Y(n75) );
  OAI21X1 U121 ( .A(n14), .B(n69), .C(n76), .Y(n143) );
  NAND2X1 U122 ( .A(\fiforeg[1][6] ), .B(n69), .Y(n76) );
  OAI21X1 U123 ( .A(n16), .B(n69), .C(n77), .Y(n144) );
  NAND2X1 U124 ( .A(\fiforeg[1][7] ), .B(n69), .Y(n77) );
  NAND2X1 U125 ( .A(n78), .B(N13), .Y(n69) );
  OAI21X1 U126 ( .A(n1), .B(n79), .C(n80), .Y(n145) );
  NAND2X1 U127 ( .A(\fiforeg[0][0] ), .B(n79), .Y(n80) );
  AOI22X1 U128 ( .A(N24), .B(n264), .C(wenable), .D(wdata[0]), .Y(n1) );
  OAI21X1 U129 ( .A(n4), .B(n79), .C(n82), .Y(n146) );
  NAND2X1 U130 ( .A(\fiforeg[0][1] ), .B(n79), .Y(n82) );
  AOI22X1 U131 ( .A(N23), .B(n264), .C(wdata[1]), .D(wenable), .Y(n4) );
  OAI21X1 U132 ( .A(n6), .B(n79), .C(n83), .Y(n147) );
  NAND2X1 U133 ( .A(\fiforeg[0][2] ), .B(n79), .Y(n83) );
  AOI22X1 U134 ( .A(N22), .B(n264), .C(wdata[2]), .D(wenable), .Y(n6) );
  OAI21X1 U135 ( .A(n8), .B(n79), .C(n84), .Y(n148) );
  NAND2X1 U136 ( .A(\fiforeg[0][3] ), .B(n79), .Y(n84) );
  AOI22X1 U137 ( .A(N21), .B(n264), .C(wdata[3]), .D(wenable), .Y(n8) );
  OAI21X1 U138 ( .A(n10), .B(n79), .C(n85), .Y(n149) );
  NAND2X1 U139 ( .A(\fiforeg[0][4] ), .B(n79), .Y(n85) );
  AOI22X1 U140 ( .A(N20), .B(n264), .C(wdata[4]), .D(wenable), .Y(n10) );
  OAI21X1 U141 ( .A(n12), .B(n79), .C(n86), .Y(n150) );
  NAND2X1 U142 ( .A(\fiforeg[0][5] ), .B(n79), .Y(n86) );
  AOI22X1 U143 ( .A(N19), .B(n264), .C(wdata[5]), .D(wenable), .Y(n12) );
  OAI21X1 U144 ( .A(n14), .B(n79), .C(n87), .Y(n151) );
  NAND2X1 U145 ( .A(\fiforeg[0][6] ), .B(n79), .Y(n87) );
  AOI22X1 U146 ( .A(N18), .B(n264), .C(wdata[6]), .D(wenable), .Y(n14) );
  OAI21X1 U147 ( .A(n16), .B(n79), .C(n88), .Y(n152) );
  NAND2X1 U148 ( .A(\fiforeg[0][7] ), .B(n79), .Y(n88) );
  NAND2X1 U149 ( .A(n78), .B(n261), .Y(n79) );
  NOR2X1 U151 ( .A(N15), .B(N14), .Y(n78) );
  AOI22X1 U152 ( .A(N17), .B(n264), .C(wdata[7]), .D(wenable), .Y(n16) );
  NOR2X1 U72 ( .A(n262), .B(n265), .Y(n28) );
  NOR2X1 U108 ( .A(n262), .B(N14), .Y(n29) );
  NOR2X1 U150 ( .A(n265), .B(N15), .Y(n30) );
  INVX2 U153 ( .A(n81), .Y(n210) );
  INVX2 U154 ( .A(n153), .Y(n263) );
  OR2X1 U155 ( .A(n207), .B(n206), .Y(n81) );
  INVX2 U156 ( .A(wenable), .Y(n264) );
  INVX2 U157 ( .A(n156), .Y(n212) );
  INVX2 U158 ( .A(n154), .Y(n211) );
  INVX2 U159 ( .A(n155), .Y(n209) );
  OR2X1 U160 ( .A(N14), .B(N15), .Y(n153) );
  OR2X1 U161 ( .A(N11), .B(N12), .Y(n154) );
  OR2X1 U162 ( .A(n207), .B(N11), .Y(n155) );
  OR2X1 U163 ( .A(n206), .B(N12), .Y(n156) );
  BUFX2 U164 ( .A(N10), .Y(n208) );
  AOI22X1 U165 ( .A(\fiforeg[4][0] ), .B(n209), .C(\fiforeg[6][0] ), .D(n210), 
        .Y(n158) );
  AOI22X1 U166 ( .A(\fiforeg[0][0] ), .B(n211), .C(\fiforeg[2][0] ), .D(n212), 
        .Y(n157) );
  AOI21X1 U167 ( .A(n158), .B(n157), .C(n208), .Y(n162) );
  AOI22X1 U168 ( .A(\fiforeg[5][0] ), .B(n209), .C(\fiforeg[7][0] ), .D(n210), 
        .Y(n160) );
  AOI22X1 U169 ( .A(\fiforeg[1][0] ), .B(n211), .C(\fiforeg[3][0] ), .D(n212), 
        .Y(n159) );
  AOI21X1 U170 ( .A(n160), .B(n159), .C(n205), .Y(n161) );
  OR2X1 U171 ( .A(n162), .B(n161), .Y(rdata[0]) );
  AOI22X1 U172 ( .A(\fiforeg[4][1] ), .B(n209), .C(\fiforeg[6][1] ), .D(n210), 
        .Y(n164) );
  AOI22X1 U173 ( .A(\fiforeg[0][1] ), .B(n211), .C(\fiforeg[2][1] ), .D(n212), 
        .Y(n163) );
  AOI21X1 U174 ( .A(n164), .B(n163), .C(n208), .Y(n168) );
  AOI22X1 U175 ( .A(\fiforeg[5][1] ), .B(n209), .C(\fiforeg[7][1] ), .D(n210), 
        .Y(n166) );
  AOI22X1 U176 ( .A(\fiforeg[1][1] ), .B(n211), .C(\fiforeg[3][1] ), .D(n212), 
        .Y(n165) );
  AOI21X1 U177 ( .A(n166), .B(n165), .C(n205), .Y(n167) );
  OR2X1 U178 ( .A(n168), .B(n167), .Y(rdata[1]) );
  AOI22X1 U179 ( .A(\fiforeg[4][2] ), .B(n209), .C(\fiforeg[6][2] ), .D(n210), 
        .Y(n170) );
  AOI22X1 U180 ( .A(\fiforeg[0][2] ), .B(n211), .C(\fiforeg[2][2] ), .D(n212), 
        .Y(n169) );
  AOI21X1 U181 ( .A(n170), .B(n169), .C(n208), .Y(n174) );
  AOI22X1 U182 ( .A(\fiforeg[5][2] ), .B(n209), .C(\fiforeg[7][2] ), .D(n210), 
        .Y(n172) );
  AOI22X1 U183 ( .A(\fiforeg[1][2] ), .B(n211), .C(\fiforeg[3][2] ), .D(n212), 
        .Y(n171) );
  AOI21X1 U184 ( .A(n172), .B(n171), .C(n205), .Y(n173) );
  OR2X1 U185 ( .A(n174), .B(n173), .Y(rdata[2]) );
  AOI22X1 U186 ( .A(\fiforeg[4][3] ), .B(n209), .C(\fiforeg[6][3] ), .D(n210), 
        .Y(n176) );
  AOI22X1 U187 ( .A(\fiforeg[0][3] ), .B(n211), .C(\fiforeg[2][3] ), .D(n212), 
        .Y(n175) );
  AOI21X1 U188 ( .A(n176), .B(n175), .C(n208), .Y(n180) );
  AOI22X1 U189 ( .A(\fiforeg[5][3] ), .B(n209), .C(\fiforeg[7][3] ), .D(n210), 
        .Y(n178) );
  AOI22X1 U190 ( .A(\fiforeg[1][3] ), .B(n211), .C(\fiforeg[3][3] ), .D(n212), 
        .Y(n177) );
  AOI21X1 U191 ( .A(n178), .B(n177), .C(n205), .Y(n179) );
  OR2X1 U192 ( .A(n180), .B(n179), .Y(rdata[3]) );
  AOI22X1 U193 ( .A(\fiforeg[4][4] ), .B(n209), .C(\fiforeg[6][4] ), .D(n210), 
        .Y(n182) );
  AOI22X1 U194 ( .A(\fiforeg[0][4] ), .B(n211), .C(\fiforeg[2][4] ), .D(n212), 
        .Y(n181) );
  AOI21X1 U195 ( .A(n182), .B(n181), .C(n208), .Y(n186) );
  AOI22X1 U196 ( .A(\fiforeg[5][4] ), .B(n209), .C(\fiforeg[7][4] ), .D(n210), 
        .Y(n184) );
  AOI22X1 U197 ( .A(\fiforeg[1][4] ), .B(n211), .C(\fiforeg[3][4] ), .D(n212), 
        .Y(n183) );
  AOI21X1 U198 ( .A(n184), .B(n183), .C(n205), .Y(n185) );
  OR2X1 U199 ( .A(n186), .B(n185), .Y(rdata[4]) );
  AOI22X1 U200 ( .A(\fiforeg[4][5] ), .B(n209), .C(\fiforeg[6][5] ), .D(n210), 
        .Y(n188) );
  AOI22X1 U201 ( .A(\fiforeg[0][5] ), .B(n211), .C(\fiforeg[2][5] ), .D(n212), 
        .Y(n187) );
  AOI21X1 U202 ( .A(n188), .B(n187), .C(n208), .Y(n192) );
  AOI22X1 U203 ( .A(\fiforeg[5][5] ), .B(n209), .C(\fiforeg[7][5] ), .D(n210), 
        .Y(n190) );
  AOI22X1 U204 ( .A(\fiforeg[1][5] ), .B(n211), .C(\fiforeg[3][5] ), .D(n212), 
        .Y(n189) );
  AOI21X1 U205 ( .A(n190), .B(n189), .C(n205), .Y(n191) );
  OR2X1 U206 ( .A(n192), .B(n191), .Y(rdata[5]) );
  AOI22X1 U207 ( .A(\fiforeg[4][6] ), .B(n209), .C(\fiforeg[6][6] ), .D(n210), 
        .Y(n194) );
  AOI22X1 U208 ( .A(\fiforeg[0][6] ), .B(n211), .C(\fiforeg[2][6] ), .D(n212), 
        .Y(n193) );
  AOI21X1 U209 ( .A(n194), .B(n193), .C(n208), .Y(n198) );
  AOI22X1 U210 ( .A(\fiforeg[5][6] ), .B(n209), .C(\fiforeg[7][6] ), .D(n210), 
        .Y(n196) );
  AOI22X1 U211 ( .A(\fiforeg[1][6] ), .B(n211), .C(\fiforeg[3][6] ), .D(n212), 
        .Y(n195) );
  AOI21X1 U212 ( .A(n196), .B(n195), .C(n205), .Y(n197) );
  OR2X1 U213 ( .A(n198), .B(n197), .Y(rdata[6]) );
  AOI22X1 U214 ( .A(\fiforeg[4][7] ), .B(n209), .C(\fiforeg[6][7] ), .D(n210), 
        .Y(n200) );
  AOI22X1 U215 ( .A(\fiforeg[0][7] ), .B(n211), .C(\fiforeg[2][7] ), .D(n212), 
        .Y(n199) );
  AOI21X1 U216 ( .A(n200), .B(n199), .C(n208), .Y(n204) );
  AOI22X1 U217 ( .A(\fiforeg[5][7] ), .B(n209), .C(\fiforeg[7][7] ), .D(n210), 
        .Y(n202) );
  AOI22X1 U218 ( .A(\fiforeg[1][7] ), .B(n211), .C(\fiforeg[3][7] ), .D(n212), 
        .Y(n201) );
  AOI21X1 U219 ( .A(n202), .B(n201), .C(n205), .Y(n203) );
  OR2X1 U220 ( .A(n204), .B(n203), .Y(rdata[7]) );
  INVX2 U221 ( .A(n208), .Y(n205) );
  INVX2 U222 ( .A(N11), .Y(n206) );
  INVX2 U223 ( .A(N12), .Y(n207) );
  AOI22X1 U224 ( .A(\fiforeg[4][0] ), .B(n29), .C(\fiforeg[6][0] ), .D(n28), 
        .Y(n214) );
  AOI22X1 U225 ( .A(\fiforeg[0][0] ), .B(n263), .C(\fiforeg[2][0] ), .D(n30), 
        .Y(n213) );
  AOI21X1 U226 ( .A(n214), .B(n213), .C(N13), .Y(n218) );
  AOI22X1 U227 ( .A(\fiforeg[5][0] ), .B(n29), .C(\fiforeg[7][0] ), .D(n28), 
        .Y(n216) );
  AOI22X1 U228 ( .A(\fiforeg[1][0] ), .B(n263), .C(\fiforeg[3][0] ), .D(n30), 
        .Y(n215) );
  AOI21X1 U229 ( .A(n216), .B(n215), .C(n261), .Y(n217) );
  OR2X1 U230 ( .A(n218), .B(n217), .Y(N24) );
  AOI22X1 U231 ( .A(\fiforeg[4][1] ), .B(n29), .C(\fiforeg[6][1] ), .D(n18), 
        .Y(n220) );
  AOI22X1 U232 ( .A(\fiforeg[0][1] ), .B(n263), .C(\fiforeg[2][1] ), .D(n30), 
        .Y(n219) );
  AOI21X1 U233 ( .A(n220), .B(n219), .C(N13), .Y(n224) );
  AOI22X1 U234 ( .A(\fiforeg[5][1] ), .B(n29), .C(\fiforeg[7][1] ), .D(n28), 
        .Y(n222) );
  AOI22X1 U235 ( .A(\fiforeg[1][1] ), .B(n263), .C(\fiforeg[3][1] ), .D(n30), 
        .Y(n221) );
  AOI21X1 U236 ( .A(n222), .B(n221), .C(n261), .Y(n223) );
  OR2X1 U237 ( .A(n224), .B(n223), .Y(N23) );
  AOI22X1 U238 ( .A(\fiforeg[4][2] ), .B(n29), .C(\fiforeg[6][2] ), .D(n28), 
        .Y(n226) );
  AOI22X1 U239 ( .A(\fiforeg[0][2] ), .B(n263), .C(\fiforeg[2][2] ), .D(n30), 
        .Y(n225) );
  AOI21X1 U240 ( .A(n226), .B(n225), .C(N13), .Y(n230) );
  AOI22X1 U241 ( .A(\fiforeg[5][2] ), .B(n29), .C(\fiforeg[7][2] ), .D(n28), 
        .Y(n228) );
  AOI22X1 U242 ( .A(\fiforeg[1][2] ), .B(n263), .C(\fiforeg[3][2] ), .D(n59), 
        .Y(n227) );
  AOI21X1 U243 ( .A(n228), .B(n227), .C(n261), .Y(n229) );
  OR2X1 U244 ( .A(n230), .B(n229), .Y(N22) );
  AOI22X1 U245 ( .A(\fiforeg[4][3] ), .B(n29), .C(\fiforeg[6][3] ), .D(n28), 
        .Y(n232) );
  AOI22X1 U246 ( .A(\fiforeg[0][3] ), .B(n263), .C(\fiforeg[2][3] ), .D(n30), 
        .Y(n231) );
  AOI21X1 U247 ( .A(n232), .B(n231), .C(N13), .Y(n236) );
  AOI22X1 U248 ( .A(\fiforeg[5][3] ), .B(n40), .C(\fiforeg[7][3] ), .D(n28), 
        .Y(n234) );
  AOI22X1 U249 ( .A(\fiforeg[1][3] ), .B(n263), .C(\fiforeg[3][3] ), .D(n59), 
        .Y(n233) );
  AOI21X1 U250 ( .A(n234), .B(n233), .C(n261), .Y(n235) );
  OR2X1 U251 ( .A(n236), .B(n235), .Y(N21) );
  AOI22X1 U252 ( .A(\fiforeg[4][4] ), .B(n29), .C(\fiforeg[6][4] ), .D(n18), 
        .Y(n238) );
  AOI22X1 U253 ( .A(\fiforeg[0][4] ), .B(n263), .C(\fiforeg[2][4] ), .D(n30), 
        .Y(n237) );
  AOI21X1 U254 ( .A(n238), .B(n237), .C(N13), .Y(n242) );
  AOI22X1 U255 ( .A(\fiforeg[5][4] ), .B(n40), .C(\fiforeg[7][4] ), .D(n28), 
        .Y(n240) );
  AOI22X1 U256 ( .A(\fiforeg[1][4] ), .B(n263), .C(\fiforeg[3][4] ), .D(n59), 
        .Y(n239) );
  AOI21X1 U257 ( .A(n240), .B(n239), .C(n261), .Y(n241) );
  OR2X1 U258 ( .A(n242), .B(n241), .Y(N20) );
  AOI22X1 U259 ( .A(\fiforeg[4][5] ), .B(n29), .C(\fiforeg[6][5] ), .D(n18), 
        .Y(n244) );
  AOI22X1 U260 ( .A(\fiforeg[0][5] ), .B(n263), .C(\fiforeg[2][5] ), .D(n30), 
        .Y(n243) );
  AOI21X1 U261 ( .A(n244), .B(n243), .C(N13), .Y(n248) );
  AOI22X1 U262 ( .A(\fiforeg[5][5] ), .B(n40), .C(\fiforeg[7][5] ), .D(n28), 
        .Y(n246) );
  AOI22X1 U263 ( .A(\fiforeg[1][5] ), .B(n263), .C(\fiforeg[3][5] ), .D(n59), 
        .Y(n245) );
  AOI21X1 U264 ( .A(n246), .B(n245), .C(n261), .Y(n247) );
  OR2X1 U265 ( .A(n248), .B(n247), .Y(N19) );
  AOI22X1 U266 ( .A(\fiforeg[4][6] ), .B(n29), .C(\fiforeg[6][6] ), .D(n18), 
        .Y(n250) );
  AOI22X1 U267 ( .A(\fiforeg[0][6] ), .B(n263), .C(\fiforeg[2][6] ), .D(n30), 
        .Y(n249) );
  AOI21X1 U268 ( .A(n250), .B(n249), .C(N13), .Y(n254) );
  AOI22X1 U269 ( .A(\fiforeg[5][6] ), .B(n40), .C(\fiforeg[7][6] ), .D(n28), 
        .Y(n252) );
  AOI22X1 U270 ( .A(\fiforeg[1][6] ), .B(n263), .C(\fiforeg[3][6] ), .D(n59), 
        .Y(n251) );
  AOI21X1 U271 ( .A(n252), .B(n251), .C(n261), .Y(n253) );
  OR2X1 U272 ( .A(n254), .B(n253), .Y(N18) );
  AOI22X1 U273 ( .A(\fiforeg[4][7] ), .B(n29), .C(\fiforeg[6][7] ), .D(n18), 
        .Y(n256) );
  AOI22X1 U274 ( .A(\fiforeg[0][7] ), .B(n263), .C(\fiforeg[2][7] ), .D(n30), 
        .Y(n255) );
  AOI21X1 U275 ( .A(n256), .B(n255), .C(N13), .Y(n260) );
  AOI22X1 U276 ( .A(\fiforeg[5][7] ), .B(n40), .C(\fiforeg[7][7] ), .D(n28), 
        .Y(n258) );
  AOI22X1 U277 ( .A(\fiforeg[1][7] ), .B(n263), .C(\fiforeg[3][7] ), .D(n59), 
        .Y(n257) );
  AOI21X1 U278 ( .A(n258), .B(n257), .C(n261), .Y(n259) );
  OR2X1 U279 ( .A(n260), .B(n259), .Y(N17) );
  INVX2 U280 ( .A(N13), .Y(n261) );
  INVX2 U281 ( .A(N15), .Y(n262) );
  INVX2 U282 ( .A(N14), .Y(n265) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   n10, n11, n12, n9;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  XOR2X1 U12 ( .A(wptr_nxt[3]), .B(binary_nxt[2]), .Y(wptr_nxt[2]) );
  XNOR2X1 U13 ( .A(n10), .B(binary_r[3]), .Y(wptr_nxt[3]) );
  NAND2X1 U14 ( .A(binary_r[2]), .B(n11), .Y(n10) );
  XOR2X1 U15 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(wptr_nxt[1]) );
  XOR2X1 U16 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(wptr_nxt[0]) );
  XOR2X1 U17 ( .A(binary_r[2]), .B(n11), .Y(binary_nxt[2]) );
  NOR2X1 U18 ( .A(n9), .B(n12), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(wenable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(wenable), .Y(binary_nxt[0]) );
  INVX2 U11 ( .A(binary_r[1]), .Y(n9) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   \gray_wptr[2] , N5, n18, n19, n20, n21, n22, n23, n24, n1;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;

  DFFSR \wrptr_r1_reg[3]  ( .D(rptr[3]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[3]) );
  DFFSR \wrptr_r1_reg[2]  ( .D(rptr[2]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[2]) );
  DFFSR \wrptr_r1_reg[1]  ( .D(rptr[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[1]) );
  DFFSR \wrptr_r1_reg[0]  ( .D(rptr[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[0]) );
  DFFSR \wrptr_r2_reg[3]  ( .D(wrptr_r1[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[3]) );
  DFFSR \wrptr_r2_reg[2]  ( .D(wrptr_r1[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[2]) );
  DFFSR \wrptr_r2_reg[1]  ( .D(wrptr_r1[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[1]) );
  DFFSR \wrptr_r2_reg[0]  ( .D(wrptr_r1[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[0]) );
  DFFSR full_flag_r_reg ( .D(N5), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        full_flag) );
  DFFSR \waddr_reg[2]  ( .D(\gray_wptr[2] ), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(waddr[2]) );
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[1]) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[0]) );
  NOR2X1 U16 ( .A(full_flag), .B(n1), .Y(wenable_fifo) );
  NOR2X1 U17 ( .A(n18), .B(n19), .Y(N5) );
  NAND2X1 U18 ( .A(n20), .B(n21), .Y(n19) );
  XOR2X1 U19 ( .A(n22), .B(\gray_wptr[2] ), .Y(n21) );
  XOR2X1 U20 ( .A(wptr_nxt[3]), .B(wptr_nxt[2]), .Y(\gray_wptr[2] ) );
  XNOR2X1 U21 ( .A(wrptr_r2[3]), .B(wrptr_r2[2]), .Y(n22) );
  XNOR2X1 U22 ( .A(wrptr_r2[1]), .B(wptr_nxt[1]), .Y(n20) );
  NAND2X1 U23 ( .A(n23), .B(n24), .Y(n18) );
  XOR2X1 U24 ( .A(wrptr_r2[3]), .B(wptr_nxt[3]), .Y(n24) );
  XNOR2X1 U25 ( .A(wrptr_r2[0]), .B(wptr_nxt[0]), .Y(n23) );
  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(wenable_fifo), .wptr(
        wptr), .wptr_nxt(wptr_nxt) );
  INVX2 U15 ( .A(wenable), .Y(n1) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   n10, n11, n12, n9;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  XOR2X1 U12 ( .A(rptr_nxt[3]), .B(binary_nxt[2]), .Y(rptr_nxt[2]) );
  XNOR2X1 U13 ( .A(n10), .B(binary_r[3]), .Y(rptr_nxt[3]) );
  NAND2X1 U14 ( .A(binary_r[2]), .B(n11), .Y(n10) );
  XOR2X1 U15 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(rptr_nxt[1]) );
  XOR2X1 U16 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(rptr_nxt[0]) );
  XOR2X1 U17 ( .A(binary_r[2]), .B(n11), .Y(binary_nxt[2]) );
  NOR2X1 U18 ( .A(n9), .B(n12), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(renable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(renable), .Y(binary_nxt[0]) );
  INVX2 U11 ( .A(binary_r[1]), .Y(n9) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n18, n19, n20, n21, n22, n23, n24, n1
;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  DFFSR \rwptr_r1_reg[3]  ( .D(wptr[3]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[3]) );
  DFFSR \rwptr_r1_reg[2]  ( .D(wptr[2]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[2]) );
  DFFSR \rwptr_r1_reg[1]  ( .D(wptr[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[1]) );
  DFFSR \rwptr_r1_reg[0]  ( .D(wptr[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[0]) );
  DFFSR \rwptr_r2_reg[3]  ( .D(rwptr_r1[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[3]) );
  DFFSR \rwptr_r2_reg[2]  ( .D(rwptr_r1[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[2]) );
  DFFSR \rwptr_r2_reg[1]  ( .D(rwptr_r1[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[1]) );
  DFFSR \rwptr_r2_reg[0]  ( .D(rwptr_r1[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[0]) );
  DFFSR empty_flag_r_reg ( .D(N3), .CLK(rclk), .R(1'b1), .S(rst_n), .Q(
        empty_flag) );
  DFFSR \raddr_reg[2]  ( .D(\gray_rptr[2] ), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(raddr[2]) );
  DFFSR \raddr_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[1]) );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  NOR2X1 U16 ( .A(empty_flag), .B(n1), .Y(renable_p2) );
  NOR2X1 U17 ( .A(n18), .B(n19), .Y(N3) );
  NAND2X1 U18 ( .A(n20), .B(n21), .Y(n19) );
  XOR2X1 U19 ( .A(n22), .B(\gray_rptr[2] ), .Y(n21) );
  XOR2X1 U20 ( .A(rptr_nxt[3]), .B(rptr_nxt[2]), .Y(\gray_rptr[2] ) );
  XNOR2X1 U21 ( .A(rwptr_r2[3]), .B(rwptr_r2[2]), .Y(n22) );
  XNOR2X1 U22 ( .A(rwptr_r2[1]), .B(rptr_nxt[1]), .Y(n20) );
  NAND2X1 U23 ( .A(n23), .B(n24), .Y(n18) );
  XNOR2X1 U24 ( .A(rptr_nxt[3]), .B(rwptr_r2[3]), .Y(n24) );
  XNOR2X1 U25 ( .A(rwptr_r2[0]), .B(rptr_nxt[0]), .Y(n23) );
  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
  INVX2 U15 ( .A(renable), .Y(n1) );
endmodule


module fifo ( r_clk, w_clk, n_rst, r_enable, w_enable, w_data, r_data, empty, 
        full );
  input [7:0] w_data;
  output [7:0] r_data;
  input r_clk, w_clk, n_rst, r_enable, w_enable;
  output empty, full;
  wire   wenable_fifo;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wptr;

  fiforam UFIFORAM ( .wclk(w_clk), .wenable(wenable_fifo), .waddr(waddr), 
        .raddr(raddr), .wdata(w_data), .rdata(r_data) );
  write_fifo_ctrl UWFC ( .wclk(w_clk), .rst_n(n_rst), .wenable(w_enable), 
        .rptr(rptr), .wenable_fifo(wenable_fifo), .wptr(wptr), .waddr(waddr), 
        .full_flag(full) );
  read_fifo_ctrl URFC ( .rclk(r_clk), .rst_n(n_rst), .renable(r_enable), 
        .wptr(wptr), .rptr(rptr), .raddr(raddr), .empty_flag(empty) );
endmodule


module layout_lab_usb_tx_fifo ( clk, n_rst, read_done, read_data, fifo_empty, 
        fifo_full, write_enable, write_data );
  output [7:0] read_data;
  input [7:0] write_data;
  input clk, n_rst, read_done, write_enable;
  output fifo_empty, fifo_full;


  fifo IP_FIFO ( .r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(read_done), 
        .w_enable(write_enable), .w_data(write_data), .r_data(read_data), 
        .empty(fifo_empty), .full(fifo_full) );
endmodule


module layout_lab_usb_timer ( clk, n_rst, start, stop, shift_enable, bit_done
 );
  input clk, n_rst, start, stop;
  output shift_enable, bit_done;
  wire   N73, N82, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n1, n2, n3, n4, n5, n6, n7;
  wire   [1:0] curr_state;
  wire   [2:0] clk_cnt;
  wire   [2:0] nxt_clk_cnt;
  assign shift_enable = N73;
  assign bit_done = N82;

  DFFSR \curr_state_reg[0]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[0]) );
  DFFSR \curr_state_reg[1]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[1]) );
  DFFSR \clk_cnt_reg[0]  ( .D(nxt_clk_cnt[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(clk_cnt[0]) );
  DFFSR \clk_cnt_reg[1]  ( .D(nxt_clk_cnt[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(clk_cnt[1]) );
  DFFSR \clk_cnt_reg[2]  ( .D(nxt_clk_cnt[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(clk_cnt[2]) );
  NOR2X1 U15 ( .A(n4), .B(n21), .Y(nxt_clk_cnt[2]) );
  OAI22X1 U16 ( .A(n23), .B(n24), .C(n7), .D(n5), .Y(n22) );
  NOR2X1 U17 ( .A(n25), .B(n21), .Y(nxt_clk_cnt[1]) );
  NOR2X1 U18 ( .A(clk_cnt[0]), .B(n21), .Y(nxt_clk_cnt[0]) );
  OAI21X1 U19 ( .A(n1), .B(n26), .C(n27), .Y(n33) );
  OAI21X1 U20 ( .A(n2), .B(n28), .C(curr_state[1]), .Y(n27) );
  NAND3X1 U21 ( .A(n29), .B(n30), .C(n31), .Y(n34) );
  AOI22X1 U22 ( .A(n21), .B(start), .C(n32), .D(curr_state[1]), .Y(n31) );
  NOR2X1 U23 ( .A(n5), .B(n24), .Y(n32) );
  NOR2X1 U24 ( .A(curr_state[1]), .B(curr_state[0]), .Y(n21) );
  NAND3X1 U25 ( .A(n3), .B(n1), .C(curr_state[0]), .Y(n30) );
  NAND3X1 U26 ( .A(curr_state[0]), .B(n28), .C(curr_state[1]), .Y(n29) );
  NAND2X1 U27 ( .A(n5), .B(n24), .Y(n28) );
  NAND2X1 U28 ( .A(n25), .B(n7), .Y(n24) );
  XNOR2X1 U29 ( .A(clk_cnt[0]), .B(clk_cnt[1]), .Y(n25) );
  NOR2X1 U30 ( .A(n6), .B(n26), .Y(N73) );
  NAND2X1 U31 ( .A(curr_state[0]), .B(n3), .Y(n26) );
  NOR2X1 U32 ( .A(n7), .B(n23), .Y(N82) );
  NAND2X1 U33 ( .A(clk_cnt[1]), .B(clk_cnt[0]), .Y(n23) );
  INVX2 U8 ( .A(stop), .Y(n1) );
  INVX2 U9 ( .A(curr_state[0]), .Y(n2) );
  INVX2 U10 ( .A(curr_state[1]), .Y(n3) );
  INVX2 U11 ( .A(n22), .Y(n4) );
  INVX2 U12 ( .A(n23), .Y(n5) );
  INVX2 U13 ( .A(N82), .Y(n6) );
  INVX2 U14 ( .A(clk_cnt[2]), .Y(n7) );
endmodule


module layout_lab_usb_tcu ( clk, n_rst, transmit, bit_done, bus_mode, stop, 
        start, sync, read_done, tx_sel, tx_enable_0, load_data_0, tx_enable_1, 
        load_data_1 );
  output [1:0] bus_mode;
  input clk, n_rst, transmit, bit_done;
  output stop, start, sync, read_done, tx_sel, tx_enable_0, load_data_0,
         tx_enable_1, load_data_1;
  wire   tx_sel, n8, n9, n10, n11, n13, n15, n16, n17, n18, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n31, n34, n35, n36, n37, n38, n40, n41,
         n44, n45, n46, n47, n49, n51, n52, n53, n54, n56, n57, n58, n59, n60,
         n61, n62, n65, n66, n67, n69, n73, n74, n76, n77, n78, n79, n81, n87,
         n89, n91, n94, n95, n96, n97, n1, n2, n3, n4, n7, n12, n14, n19, n30,
         n32, n33, n39, n42, n43, n50, n55, n63, n64, n68, n70, n71, n72, n75,
         n80;
  wire   [3:0] curr_state;
  wire   [2:0] bit_cnt;
  assign tx_enable_1 = tx_sel;

  DFFSR \bit_cnt_reg[0]  ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_cnt[0]) );
  DFFSR \bit_cnt_reg[1]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_cnt[1]) );
  DFFSR \bit_cnt_reg[2]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_cnt[2]) );
  DFFSR \curr_state_reg[0]  ( .D(n97), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[0]) );
  DFFSR \curr_state_reg[2]  ( .D(n95), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[2]) );
  DFFSR \curr_state_reg[1]  ( .D(n96), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[1]) );
  DFFSR \curr_state_reg[3]  ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[3]) );
  NAND3X1 U3 ( .A(n50), .B(n39), .C(n19), .Y(tx_sel) );
  OAI21X1 U5 ( .A(n9), .B(n10), .C(n11), .Y(n8) );
  OAI21X1 U6 ( .A(n1), .B(n71), .C(n13), .Y(tx_enable_0) );
  AOI21X1 U7 ( .A(n70), .B(n9), .C(n15), .Y(n13) );
  XOR2X1 U9 ( .A(bit_cnt[2]), .B(n17), .Y(n87) );
  NOR2X1 U10 ( .A(n18), .B(n4), .Y(n17) );
  XOR2X1 U11 ( .A(n4), .B(n18), .Y(n89) );
  NAND2X1 U12 ( .A(bit_done), .B(bit_cnt[0]), .Y(n18) );
  XOR2X1 U14 ( .A(bit_done), .B(bit_cnt[0]), .Y(n91) );
  NAND3X1 U16 ( .A(n21), .B(n22), .C(n23), .Y(n94) );
  AOI21X1 U17 ( .A(curr_state[3]), .B(n24), .C(n25), .Y(n23) );
  OAI21X1 U18 ( .A(n26), .B(n27), .C(n28), .Y(n25) );
  NAND2X1 U19 ( .A(n29), .B(n80), .Y(n27) );
  NOR2X1 U20 ( .A(stop), .B(n31), .Y(n22) );
  NOR2X1 U21 ( .A(n14), .B(n63), .Y(n21) );
  OAI21X1 U22 ( .A(n34), .B(n24), .C(n35), .Y(n95) );
  OAI21X1 U24 ( .A(n38), .B(n24), .C(n1), .Y(n36) );
  AOI21X1 U25 ( .A(n2), .B(n40), .C(n41), .Y(n34) );
  OAI21X1 U26 ( .A(transmit), .B(n28), .C(n43), .Y(n40) );
  OAI21X1 U27 ( .A(n7), .B(n71), .C(n44), .Y(n96) );
  OAI21X1 U29 ( .A(n46), .B(n47), .C(n7), .Y(n45) );
  OAI21X1 U30 ( .A(n2), .B(n43), .C(n12), .Y(n47) );
  NAND2X1 U33 ( .A(n50), .B(n49), .Y(n38) );
  OAI21X1 U34 ( .A(n3), .B(n80), .C(n51), .Y(n46) );
  NOR2X1 U35 ( .A(sync), .B(n63), .Y(n51) );
  OAI21X1 U39 ( .A(n28), .B(n26), .C(n50), .Y(n54) );
  OAI21X1 U41 ( .A(n7), .B(n42), .C(n56), .Y(n97) );
  OAI21X1 U42 ( .A(n57), .B(n58), .C(n7), .Y(n56) );
  OAI21X1 U43 ( .A(n59), .B(n60), .C(n61), .Y(n58) );
  AOI21X1 U44 ( .A(n2), .B(n29), .C(n62), .Y(n61) );
  AOI21X1 U45 ( .A(n28), .B(n49), .C(n2), .Y(n62) );
  NAND3X1 U46 ( .A(curr_state[0]), .B(curr_state[1]), .C(n64), .Y(n49) );
  NAND2X1 U47 ( .A(n15), .B(n71), .Y(n28) );
  NAND3X1 U49 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .C(bit_cnt[2]), .Y(n26) );
  NAND3X1 U50 ( .A(n32), .B(n16), .C(n11), .Y(n57) );
  NAND3X1 U51 ( .A(curr_state[1]), .B(n42), .C(n64), .Y(n16) );
  OAI21X1 U53 ( .A(n60), .B(n65), .C(n66), .Y(n24) );
  OAI21X1 U54 ( .A(n41), .B(n67), .C(n75), .Y(n66) );
  NAND2X1 U56 ( .A(n11), .B(n20), .Y(n67) );
  NAND3X1 U57 ( .A(curr_state[1]), .B(n42), .C(n69), .Y(n20) );
  NOR2X1 U58 ( .A(n68), .B(n72), .Y(n69) );
  OAI21X1 U59 ( .A(n71), .B(n55), .C(n73), .Y(n41) );
  AOI21X1 U60 ( .A(n70), .B(curr_state[0]), .C(stop), .Y(n73) );
  OAI21X1 U61 ( .A(n10), .B(n9), .C(n74), .Y(stop) );
  NAND3X1 U62 ( .A(n33), .B(n1), .C(curr_state[3]), .Y(n74) );
  NAND2X1 U64 ( .A(n33), .B(n80), .Y(n65) );
  NAND2X1 U66 ( .A(n53), .B(n39), .Y(load_data_0) );
  NAND3X1 U67 ( .A(curr_state[0]), .B(n71), .C(n64), .Y(n53) );
  OR2X1 U69 ( .A(n76), .B(n77), .Y(bus_mode[0]) );
  OAI21X1 U70 ( .A(n71), .B(n60), .C(n78), .Y(n77) );
  NOR2X1 U71 ( .A(n29), .B(n14), .Y(n78) );
  NAND3X1 U73 ( .A(n33), .B(n68), .C(curr_state[3]), .Y(n11) );
  NOR2X1 U74 ( .A(n79), .B(curr_state[0]), .Y(n29) );
  NAND2X1 U75 ( .A(n68), .B(n72), .Y(n60) );
  NAND3X1 U77 ( .A(n10), .B(n30), .C(n55), .Y(n76) );
  NOR2X1 U79 ( .A(n9), .B(n1), .Y(n15) );
  NAND2X1 U80 ( .A(curr_state[3]), .B(curr_state[0]), .Y(n9) );
  NAND2X1 U82 ( .A(n39), .B(n32), .Y(read_done) );
  NAND2X1 U84 ( .A(n52), .B(n37), .Y(load_data_1) );
  NAND3X1 U85 ( .A(n1), .B(n72), .C(n33), .Y(n37) );
  NAND2X1 U87 ( .A(n42), .B(n71), .Y(n59) );
  NAND3X1 U88 ( .A(curr_state[3]), .B(curr_state[1]), .C(n81), .Y(n52) );
  NOR2X1 U89 ( .A(n1), .B(curr_state[0]), .Y(n81) );
  NOR2X1 U91 ( .A(n42), .B(n79), .Y(n31) );
  NAND3X1 U92 ( .A(curr_state[1]), .B(n72), .C(n1), .Y(n79) );
  NAND2X1 U95 ( .A(n1), .B(n71), .Y(n10) );
  AND2X2 U23 ( .A(n36), .B(n37), .Y(n35) );
  AND2X2 U28 ( .A(n45), .B(n16), .Y(n44) );
  INVX2 U4 ( .A(curr_state[1]), .Y(n71) );
  BUFX2 U8 ( .A(curr_state[2]), .Y(n1) );
  INVX2 U13 ( .A(n26), .Y(n2) );
  INVX2 U15 ( .A(n54), .Y(n3) );
  INVX2 U31 ( .A(bit_cnt[1]), .Y(n4) );
  INVX2 U32 ( .A(n16), .Y(start) );
  INVX2 U36 ( .A(n20), .Y(bus_mode[1]) );
  INVX2 U37 ( .A(n24), .Y(n7) );
  INVX2 U38 ( .A(n41), .Y(n12) );
  INVX2 U40 ( .A(n11), .Y(n14) );
  INVX2 U48 ( .A(n8), .Y(n19) );
  INVX2 U52 ( .A(read_done), .Y(n30) );
  INVX2 U55 ( .A(load_data_1), .Y(n32) );
  INVX2 U63 ( .A(n59), .Y(n33) );
  INVX2 U65 ( .A(n31), .Y(n39) );
  INVX2 U68 ( .A(curr_state[0]), .Y(n42) );
  INVX2 U72 ( .A(n38), .Y(n43) );
  INVX2 U76 ( .A(n53), .Y(sync) );
  INVX2 U78 ( .A(n29), .Y(n50) );
  INVX2 U81 ( .A(n15), .Y(n55) );
  INVX2 U83 ( .A(n52), .Y(n63) );
  INVX2 U86 ( .A(n60), .Y(n64) );
  INVX2 U90 ( .A(n1), .Y(n68) );
  INVX2 U93 ( .A(n10), .Y(n70) );
  INVX2 U94 ( .A(curr_state[3]), .Y(n72) );
  INVX2 U96 ( .A(bit_done), .Y(n75) );
  INVX2 U104 ( .A(transmit), .Y(n80) );
endmodule


module layout_lab_usb_transmitter ( clk, n_rst, d_plus, d_minus, transmit, 
        write_enable, write_data, fifo_empty, fifo_full );
  input [7:0] write_data;
  input clk, n_rst, transmit, write_enable;
  output d_plus, d_minus, fifo_empty, fifo_full;
  wire   tx_sel_int, tx_out_0_int, tx_out_1_int, sync_int, tx_value_int,
         shift_enable_int, tx_enable_0_int, load_data_0_int, tx_enable_1_int,
         load_data_1_int, read_done_int, start_int, stop_int, bit_done_int, n4,
         n1, n2, n3;
  wire   [7:0] tx_data_int;
  wire   [7:0] read_data_int;
  wire   [1:0] bus_mode_int;

  AND2X2 U3 ( .A(read_data_int[6]), .B(n3), .Y(tx_data_int[6]) );
  AND2X2 U4 ( .A(read_data_int[5]), .B(n3), .Y(tx_data_int[5]) );
  AND2X2 U5 ( .A(read_data_int[4]), .B(n3), .Y(tx_data_int[4]) );
  AND2X2 U6 ( .A(read_data_int[3]), .B(n3), .Y(tx_data_int[3]) );
  AND2X2 U7 ( .A(read_data_int[2]), .B(n3), .Y(tx_data_int[2]) );
  AND2X2 U8 ( .A(read_data_int[1]), .B(n3), .Y(tx_data_int[1]) );
  AND2X2 U9 ( .A(read_data_int[0]), .B(n3), .Y(tx_data_int[0]) );
  OR2X1 U13 ( .A(sync_int), .B(read_data_int[7]), .Y(tx_data_int[7]) );
  AOI22X1 U14 ( .A(tx_out_0_int), .B(n2), .C(tx_sel_int), .D(tx_out_1_int), 
        .Y(n4) );
  layout_lab_usb_out_ctrl OCTRL ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus), 
        .d_minus(d_minus), .bus_mode(bus_mode_int), .tx_value(tx_value_int) );
  layout_lab_usb_encoder ENC ( .clk(clk), .n_rst(n_rst), .tx_bit(n1), 
        .shift_enable(shift_enable_int), .tx_value(tx_value_int) );
  layout_lab_usb_tx_sr_1 T_SR_0 ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable_int), .tx_enable(tx_enable_0_int), .tx_data(tx_data_int), 
        .load_data(load_data_0_int), .tx_out(tx_out_0_int) );
  layout_lab_usb_tx_sr_0 T_SR_1 ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable_int), .tx_enable(tx_enable_1_int), .tx_data(tx_data_int), 
        .load_data(load_data_1_int), .tx_out(tx_out_1_int) );
  layout_lab_usb_tx_fifo T_FIFO ( .clk(clk), .n_rst(n_rst), .read_done(
        read_done_int), .read_data(read_data_int), .fifo_empty(fifo_empty), 
        .fifo_full(fifo_full), .write_enable(write_enable), .write_data(
        write_data) );
  layout_lab_usb_timer TIM ( .clk(clk), .n_rst(n_rst), .start(start_int), 
        .stop(stop_int), .shift_enable(shift_enable_int), .bit_done(
        bit_done_int) );
  layout_lab_usb_tcu CTRL ( .clk(clk), .n_rst(n_rst), .transmit(transmit), 
        .bit_done(bit_done_int), .bus_mode(bus_mode_int), .stop(stop_int), 
        .start(start_int), .sync(sync_int), .read_done(read_done_int), 
        .tx_sel(tx_sel_int), .tx_enable_0(tx_enable_0_int), .load_data_0(
        load_data_0_int), .tx_enable_1(tx_enable_1_int), .load_data_1(
        load_data_1_int) );
  INVX2 U10 ( .A(n4), .Y(n1) );
  INVX2 U11 ( .A(tx_sel_int), .Y(n2) );
  INVX2 U12 ( .A(sync_int), .Y(n3) );
endmodule


module layout_lab_design_t ( clk, n_rst, d_plus, d_minus, transmit, write_enable, 
        write_data, fifo_empty, fifo_full );
  input [7:0] write_data;
  input clk, n_rst, transmit, write_enable;
  output d_plus, d_minus, fifo_empty, fifo_full;


  layout_lab_usb_transmitter LD ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus), 
        .d_minus(d_minus), .transmit(transmit), .write_enable(write_enable), 
        .write_data(write_data), .fifo_empty(fifo_empty), .fifo_full(fifo_full) );
endmodule

module  layout_lab_design ( clk, n_rst, d_plus, d_minus, transmit, write_enable, 
	write_data, fifo_empty, fifo_full );

input   [7:0] write_data;
input   clk, n_rst, transmit, write_enable;
output  d_plus, d_minus, fifo_empty, fifo_full;
wire	nclk, nn_rst, ntransmit, nwrite_enable, nd_plus, nd_minus, nfifo_empty, nfifo_full;

wire	[7:0] nwrite_data;
        layout_lab_design_t I0 ( .clk(nclk), .n_rst(nn_rst), .d_plus(nd_plus), .d_minus(nd_minus), 
	.transmit(ntransmit), .write_enable(nwrite_enable), .write_data(nwrite_data), .fifo_empty(nfifo_empty), 
	.fifo_full(nfifo_full) );

PADOUT U1 ( .DO(nd_minus), .YPAD(d_minus) );
PADOUT U2 ( .DO(nd_plus), .YPAD(d_plus) );
PADOUT U3 ( .DO(nfifo_empty), .YPAD(fifo_empty) );
PADOUT U4 ( .DO(nfifo_full), .YPAD(fifo_full) );
PADINC U5 ( .DI(nclk), .YPAD(clk) );
PADINC U6 ( .DI(nn_rst), .YPAD(n_rst) );
PADINC U7 ( .DI(ntransmit), .YPAD(transmit) );
PADINC U8 ( .DI(nwrite_data[0]), .YPAD(write_data[0]) );
PADINC U9 ( .DI(nwrite_data[1]), .YPAD(write_data[1]) );
PADINC U10 ( .DI(nwrite_data[2]), .YPAD(write_data[2]) );
PADINC U11 ( .DI(nwrite_data[3]), .YPAD(write_data[3]) );
PADINC U12 ( .DI(nwrite_data[4]), .YPAD(write_data[4]) );
PADINC U13 ( .DI(nwrite_data[5]), .YPAD(write_data[5]) );
PADINC U14 ( .DI(nwrite_data[6]), .YPAD(write_data[6]) );
PADINC U15 ( .DI(nwrite_data[7]), .YPAD(write_data[7]) );
PADINC U16 ( .DI(nwrite_enable), .YPAD(write_enable) );

endmodule
