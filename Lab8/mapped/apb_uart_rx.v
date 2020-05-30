/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct 15 17:22:18 2019
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, psel, paddr, penable, pwrite, pwdata, data_read, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   \Memory[6][7] , \Memory[6][6] , \Memory[6][5] , \Memory[6][4] ,
         \Memory[6][3] , \Memory[6][2] , \Memory[6][1] , \Memory[6][0] ,
         \Memory[5][7] , \Memory[5][6] , \Memory[5][5] , \Memory[5][4] ,
         \Memory[5][3] , \Memory[5][2] , \Memory[5][1] , \Memory[5][0] ,
         \Memory[4][7] , \Memory[4][6] , \Memory[4][5] , \Memory[4][4] ,
         \Memory[3][7] , \Memory[3][6] , \Memory[1][7] , \Memory[1][6] ,
         \Memory[1][5] , \Memory[1][4] , \Memory[1][3] , \Memory[1][2] ,
         \Memory[1][1] , \Memory[1][0] , \Memory[0][7] , \Memory[0][6] ,
         \Memory[0][5] , \Memory[0][4] , \Memory[0][3] , \Memory[0][2] ,
         \Memory[0][1] , \Memory[0][0] , N103, \next_Memory[6][7] ,
         \next_Memory[6][6] , \next_Memory[6][5] , \next_Memory[6][4] ,
         \next_Memory[6][3] , \next_Memory[6][2] , \next_Memory[6][1] ,
         \next_Memory[6][0] , \next_Memory[5][7] , \next_Memory[5][6] ,
         \next_Memory[5][5] , \next_Memory[5][4] , \next_Memory[5][3] ,
         \next_Memory[5][2] , \next_Memory[5][1] , \next_Memory[5][0] ,
         \next_Memory[1][7] , \next_Memory[1][6] , \next_Memory[1][5] ,
         \next_Memory[1][4] , \next_Memory[1][3] , \next_Memory[1][2] ,
         \next_Memory[1][1] , \next_Memory[1][0] , \next_Memory[0][7] ,
         \next_Memory[0][6] , \next_Memory[0][5] , \next_Memory[0][4] ,
         \next_Memory[0][3] , \next_Memory[0][2] , \next_Memory[0][1] ,
         \next_Memory[0][0] , N145, N146, N147, N148, N149, N150, N151, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236;
  wire   [1:0] state;

  DFFSR \state_reg[0]  ( .D(n235), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(n236), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \Memory_reg[6][7]  ( .D(\next_Memory[6][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[6][7] ) );
  DFFSR \Memory_reg[6][6]  ( .D(\next_Memory[6][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[6][6] ) );
  DFFSR \Memory_reg[6][5]  ( .D(\next_Memory[6][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[6][5] ) );
  DFFSR \Memory_reg[6][4]  ( .D(\next_Memory[6][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[6][4] ) );
  DFFSR \Memory_reg[6][3]  ( .D(\next_Memory[6][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[6][3] ) );
  DFFSR \Memory_reg[6][2]  ( .D(\next_Memory[6][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[6][2] ) );
  DFFSR \Memory_reg[6][1]  ( .D(\next_Memory[6][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[6][1] ) );
  DFFSR \Memory_reg[6][0]  ( .D(\next_Memory[6][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[6][0] ) );
  DFFSR \Memory_reg[5][7]  ( .D(\next_Memory[5][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[5][7] ) );
  DFFSR \Memory_reg[5][6]  ( .D(\next_Memory[5][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[5][6] ) );
  DFFSR \Memory_reg[5][5]  ( .D(\next_Memory[5][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[5][5] ) );
  DFFSR \Memory_reg[5][4]  ( .D(\next_Memory[5][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[5][4] ) );
  DFFSR \Memory_reg[5][3]  ( .D(\next_Memory[5][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[5][3] ) );
  DFFSR \Memory_reg[5][2]  ( .D(\next_Memory[5][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[5][2] ) );
  DFFSR \Memory_reg[5][1]  ( .D(\next_Memory[5][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[5][1] ) );
  DFFSR \Memory_reg[5][0]  ( .D(\next_Memory[5][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[5][0] ) );
  DFFSR \Memory_reg[4][7]  ( .D(n216), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \Memory[4][7] ) );
  DFFSR \Memory_reg[4][6]  ( .D(n215), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \Memory[4][6] ) );
  DFFSR \Memory_reg[4][5]  ( .D(n214), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \Memory[4][5] ) );
  DFFSR \Memory_reg[4][4]  ( .D(n213), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \Memory[4][4] ) );
  DFFSR \Memory_reg[4][3]  ( .D(n212), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \Memory_reg[4][2]  ( .D(n211), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \Memory_reg[4][1]  ( .D(n210), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[1]) );
  DFFSR \Memory_reg[4][0]  ( .D(n209), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[0]) );
  DFFSR \Memory_reg[3][7]  ( .D(n208), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \Memory[3][7] ) );
  DFFSR \Memory_reg[3][6]  ( .D(n207), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \Memory[3][6] ) );
  DFFSR \Memory_reg[3][5]  ( .D(n206), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[13]) );
  DFFSR \Memory_reg[3][4]  ( .D(n205), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[12]) );
  DFFSR \Memory_reg[3][3]  ( .D(n204), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[11]) );
  DFFSR \Memory_reg[3][2]  ( .D(n203), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[10]) );
  DFFSR \Memory_reg[3][1]  ( .D(n202), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[9]) );
  DFFSR \Memory_reg[3][0]  ( .D(n201), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[8]) );
  DFFSR \Memory_reg[2][7]  ( .D(n200), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[7]) );
  DFFSR \Memory_reg[2][6]  ( .D(n199), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[6]) );
  DFFSR \Memory_reg[2][5]  ( .D(n198), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[5]) );
  DFFSR \Memory_reg[2][4]  ( .D(n197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[4]) );
  DFFSR \Memory_reg[2][3]  ( .D(n196), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[3]) );
  DFFSR \Memory_reg[2][2]  ( .D(n195), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[2]) );
  DFFSR \Memory_reg[2][1]  ( .D(n194), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[1]) );
  DFFSR \Memory_reg[2][0]  ( .D(n193), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[0]) );
  DFFSR \Memory_reg[1][7]  ( .D(\next_Memory[1][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[1][7] ) );
  DFFSR \Memory_reg[1][6]  ( .D(\next_Memory[1][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[1][6] ) );
  DFFSR \Memory_reg[1][5]  ( .D(\next_Memory[1][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[1][5] ) );
  DFFSR \Memory_reg[1][4]  ( .D(\next_Memory[1][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[1][4] ) );
  DFFSR \Memory_reg[1][3]  ( .D(\next_Memory[1][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[1][3] ) );
  DFFSR \Memory_reg[1][2]  ( .D(\next_Memory[1][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[1][2] ) );
  DFFSR \Memory_reg[1][1]  ( .D(\next_Memory[1][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[1][1] ) );
  DFFSR \Memory_reg[1][0]  ( .D(\next_Memory[1][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[1][0] ) );
  DFFSR \Memory_reg[0][7]  ( .D(\next_Memory[0][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[0][7] ) );
  DFFSR \Memory_reg[0][6]  ( .D(\next_Memory[0][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[0][6] ) );
  DFFSR \Memory_reg[0][5]  ( .D(\next_Memory[0][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[0][5] ) );
  DFFSR \Memory_reg[0][4]  ( .D(\next_Memory[0][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[0][4] ) );
  DFFSR \Memory_reg[0][3]  ( .D(\next_Memory[0][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[0][3] ) );
  DFFSR \Memory_reg[0][2]  ( .D(\next_Memory[0][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[0][2] ) );
  DFFSR \Memory_reg[0][1]  ( .D(\next_Memory[0][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[0][1] ) );
  DFFSR \Memory_reg[0][0]  ( .D(\next_Memory[0][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\Memory[0][0] ) );
  AND2X2 U4 ( .A(paddr[2]), .B(n172), .Y(n97) );
  BUFX2 U62 ( .A(n98), .Y(n59) );
  NOR2X1 U63 ( .A(n172), .B(paddr[2]), .Y(n96) );
  NOR2X1 U64 ( .A(paddr[2]), .B(paddr[1]), .Y(n98) );
  AOI22X1 U65 ( .A(\Memory[1][0] ), .B(n59), .C(\Memory[5][0] ), .D(n97), .Y(
        n60) );
  AOI21X1 U66 ( .A(bit_period[8]), .B(n96), .C(n106), .Y(n64) );
  AND2X1 U67 ( .A(paddr[2]), .B(paddr[1]), .Y(n101) );
  AOI22X1 U68 ( .A(\Memory[0][0] ), .B(n59), .C(data_size[0]), .D(n97), .Y(n61) );
  OAI21X1 U69 ( .A(n105), .B(n234), .C(n61), .Y(n62) );
  AOI22X1 U70 ( .A(\Memory[6][0] ), .B(n101), .C(n62), .D(n104), .Y(n63) );
  OAI21X1 U71 ( .A(n104), .B(n64), .C(n63), .Y(N151) );
  AOI22X1 U72 ( .A(\Memory[1][1] ), .B(n59), .C(\Memory[5][1] ), .D(n97), .Y(
        n65) );
  AOI21X1 U73 ( .A(bit_period[9]), .B(n96), .C(n107), .Y(n69) );
  AOI22X1 U74 ( .A(\Memory[0][1] ), .B(n59), .C(data_size[1]), .D(n97), .Y(n66) );
  OAI21X1 U75 ( .A(n105), .B(n233), .C(n66), .Y(n67) );
  AOI22X1 U76 ( .A(\Memory[6][1] ), .B(n101), .C(n67), .D(n104), .Y(n68) );
  OAI21X1 U77 ( .A(n104), .B(n69), .C(n68), .Y(N150) );
  AOI22X1 U78 ( .A(\Memory[1][2] ), .B(n59), .C(\Memory[5][2] ), .D(n97), .Y(
        n70) );
  AOI21X1 U79 ( .A(bit_period[10]), .B(n96), .C(n108), .Y(n74) );
  AOI22X1 U80 ( .A(\Memory[0][2] ), .B(n59), .C(data_size[2]), .D(n97), .Y(n71) );
  OAI21X1 U81 ( .A(n105), .B(n232), .C(n71), .Y(n72) );
  AOI22X1 U82 ( .A(\Memory[6][2] ), .B(n101), .C(n72), .D(n104), .Y(n73) );
  OAI21X1 U83 ( .A(n104), .B(n74), .C(n73), .Y(N149) );
  AOI22X1 U84 ( .A(\Memory[1][3] ), .B(n59), .C(\Memory[5][3] ), .D(n97), .Y(
        n75) );
  AOI21X1 U85 ( .A(bit_period[11]), .B(n96), .C(n109), .Y(n79) );
  AOI22X1 U86 ( .A(\Memory[0][3] ), .B(n59), .C(data_size[3]), .D(n97), .Y(n76) );
  OAI21X1 U87 ( .A(n105), .B(n231), .C(n76), .Y(n77) );
  AOI22X1 U88 ( .A(\Memory[6][3] ), .B(n101), .C(n77), .D(n104), .Y(n78) );
  OAI21X1 U89 ( .A(n104), .B(n79), .C(n78), .Y(N148) );
  AOI22X1 U90 ( .A(\Memory[1][4] ), .B(n59), .C(\Memory[5][4] ), .D(n97), .Y(
        n80) );
  AOI21X1 U91 ( .A(bit_period[12]), .B(n96), .C(n110), .Y(n84) );
  AOI22X1 U92 ( .A(\Memory[0][4] ), .B(n59), .C(\Memory[4][4] ), .D(n97), .Y(
        n81) );
  OAI21X1 U93 ( .A(n105), .B(n230), .C(n81), .Y(n82) );
  AOI22X1 U94 ( .A(\Memory[6][4] ), .B(n101), .C(n82), .D(n104), .Y(n83) );
  OAI21X1 U95 ( .A(n104), .B(n84), .C(n83), .Y(N147) );
  AOI22X1 U96 ( .A(\Memory[1][5] ), .B(n59), .C(\Memory[5][5] ), .D(n97), .Y(
        n85) );
  AOI21X1 U97 ( .A(bit_period[13]), .B(n96), .C(n111), .Y(n89) );
  AOI22X1 U98 ( .A(\Memory[0][5] ), .B(n59), .C(\Memory[4][5] ), .D(n97), .Y(
        n86) );
  OAI21X1 U99 ( .A(n105), .B(n229), .C(n86), .Y(n87) );
  AOI22X1 U100 ( .A(\Memory[6][5] ), .B(n101), .C(n87), .D(n104), .Y(n88) );
  OAI21X1 U101 ( .A(n104), .B(n89), .C(n88), .Y(N146) );
  AOI22X1 U102 ( .A(\Memory[1][6] ), .B(n59), .C(\Memory[5][6] ), .D(n97), .Y(
        n90) );
  AOI21X1 U103 ( .A(\Memory[3][6] ), .B(n96), .C(n112), .Y(n94) );
  AOI22X1 U104 ( .A(\Memory[0][6] ), .B(n59), .C(\Memory[4][6] ), .D(n97), .Y(
        n91) );
  OAI21X1 U105 ( .A(n105), .B(n228), .C(n91), .Y(n92) );
  AOI22X1 U106 ( .A(\Memory[6][6] ), .B(n101), .C(n92), .D(n104), .Y(n93) );
  OAI21X1 U107 ( .A(n104), .B(n94), .C(n93), .Y(N145) );
  AOI22X1 U108 ( .A(\Memory[1][7] ), .B(n59), .C(\Memory[5][7] ), .D(n97), .Y(
        n95) );
  AOI21X1 U109 ( .A(\Memory[3][7] ), .B(n96), .C(n113), .Y(n103) );
  AOI22X1 U110 ( .A(\Memory[0][7] ), .B(n59), .C(\Memory[4][7] ), .D(n97), .Y(
        n99) );
  OAI21X1 U111 ( .A(n105), .B(n226), .C(n99), .Y(n100) );
  AOI22X1 U112 ( .A(\Memory[6][7] ), .B(n101), .C(n100), .D(n104), .Y(n102) );
  OAI21X1 U113 ( .A(n103), .B(n104), .C(n102), .Y(N103) );
  INVX2 U114 ( .A(paddr[0]), .Y(n104) );
  INVX2 U115 ( .A(n96), .Y(n105) );
  INVX2 U116 ( .A(n60), .Y(n106) );
  INVX2 U117 ( .A(n65), .Y(n107) );
  INVX2 U118 ( .A(n70), .Y(n108) );
  INVX2 U119 ( .A(n75), .Y(n109) );
  INVX2 U120 ( .A(n80), .Y(n110) );
  INVX2 U121 ( .A(n85), .Y(n111) );
  INVX2 U122 ( .A(n90), .Y(n112) );
  INVX2 U123 ( .A(n95), .Y(n113) );
  NOR2X1 U124 ( .A(n114), .B(n115), .Y(pslverr) );
  INVX1 U125 ( .A(n116), .Y(prdata[7]) );
  AOI22X1 U126 ( .A(n117), .B(N103), .C(n118), .D(\Memory[6][7] ), .Y(n116) );
  OAI21X1 U127 ( .A(n119), .B(n120), .C(n121), .Y(prdata[6]) );
  AOI22X1 U128 ( .A(\Memory[6][6] ), .B(n118), .C(n122), .D(\Memory[6][7] ), 
        .Y(n121) );
  INVX1 U129 ( .A(N145), .Y(n120) );
  OAI21X1 U130 ( .A(n119), .B(n123), .C(n124), .Y(prdata[5]) );
  AOI22X1 U131 ( .A(\Memory[6][5] ), .B(n118), .C(n122), .D(\Memory[6][6] ), 
        .Y(n124) );
  INVX1 U132 ( .A(N146), .Y(n123) );
  INVX1 U133 ( .A(n117), .Y(n119) );
  NAND2X1 U134 ( .A(n125), .B(n126), .Y(prdata[4]) );
  AOI22X1 U135 ( .A(n127), .B(\Memory[6][7] ), .C(\Memory[6][4] ), .D(n118), 
        .Y(n126) );
  AOI22X1 U136 ( .A(\Memory[6][5] ), .B(n122), .C(N147), .D(n117), .Y(n125) );
  NAND2X1 U137 ( .A(n128), .B(n129), .Y(prdata[3]) );
  AOI22X1 U138 ( .A(n127), .B(\Memory[6][6] ), .C(\Memory[6][3] ), .D(n118), 
        .Y(n129) );
  AOI22X1 U139 ( .A(\Memory[6][4] ), .B(n122), .C(N148), .D(n117), .Y(n128) );
  NAND2X1 U140 ( .A(n130), .B(n131), .Y(prdata[2]) );
  AOI22X1 U141 ( .A(n127), .B(\Memory[6][5] ), .C(\Memory[6][2] ), .D(n118), 
        .Y(n131) );
  AOI22X1 U142 ( .A(\Memory[6][3] ), .B(n122), .C(N149), .D(n117), .Y(n130) );
  NAND2X1 U143 ( .A(n132), .B(n133), .Y(prdata[1]) );
  AOI22X1 U144 ( .A(\Memory[6][4] ), .B(n127), .C(\Memory[6][1] ), .D(n118), 
        .Y(n133) );
  AOI22X1 U145 ( .A(\Memory[6][2] ), .B(n122), .C(N150), .D(n117), .Y(n132) );
  NAND2X1 U146 ( .A(n134), .B(n135), .Y(prdata[0]) );
  AOI22X1 U147 ( .A(\Memory[6][3] ), .B(n127), .C(\Memory[6][0] ), .D(n118), 
        .Y(n135) );
  NOR2X1 U148 ( .A(n136), .B(n137), .Y(n118) );
  INVX1 U149 ( .A(data_read), .Y(n136) );
  INVX1 U150 ( .A(n138), .Y(n127) );
  NAND3X1 U151 ( .A(data_read), .B(n139), .C(n137), .Y(n138) );
  AOI22X1 U152 ( .A(\Memory[6][1] ), .B(n122), .C(N151), .D(n117), .Y(n134) );
  NOR2X1 U153 ( .A(n140), .B(n141), .Y(n117) );
  INVX1 U154 ( .A(n142), .Y(n122) );
  NAND3X1 U155 ( .A(n137), .B(data_read), .C(data_size[1]), .Y(n142) );
  NOR2X1 U156 ( .A(n143), .B(n144), .Y(n137) );
  NAND3X1 U157 ( .A(data_size[0]), .B(n145), .C(data_size[2]), .Y(n144) );
  NAND3X1 U158 ( .A(n146), .B(n147), .C(n148), .Y(n143) );
  NOR2X1 U159 ( .A(data_size[3]), .B(\Memory[4][7] ), .Y(n148) );
  MUX2X1 U160 ( .B(n149), .A(n150), .S(n151), .Y(\next_Memory[6][7] ) );
  INVX1 U161 ( .A(rx_data[7]), .Y(n149) );
  MUX2X1 U162 ( .B(n152), .A(n153), .S(n151), .Y(\next_Memory[6][6] ) );
  INVX1 U163 ( .A(rx_data[6]), .Y(n152) );
  MUX2X1 U164 ( .B(n154), .A(n155), .S(n151), .Y(\next_Memory[6][5] ) );
  INVX1 U165 ( .A(rx_data[5]), .Y(n154) );
  MUX2X1 U166 ( .B(n156), .A(n157), .S(n151), .Y(\next_Memory[6][4] ) );
  INVX1 U167 ( .A(rx_data[4]), .Y(n156) );
  MUX2X1 U168 ( .B(n158), .A(n159), .S(n151), .Y(\next_Memory[6][3] ) );
  INVX1 U169 ( .A(rx_data[3]), .Y(n158) );
  MUX2X1 U170 ( .B(n160), .A(n161), .S(n151), .Y(\next_Memory[6][2] ) );
  INVX1 U171 ( .A(rx_data[2]), .Y(n160) );
  MUX2X1 U172 ( .B(n162), .A(n163), .S(n151), .Y(\next_Memory[6][1] ) );
  INVX1 U173 ( .A(rx_data[1]), .Y(n162) );
  MUX2X1 U174 ( .B(n164), .A(n165), .S(n151), .Y(\next_Memory[6][0] ) );
  AND2X1 U175 ( .A(n166), .B(n141), .Y(n151) );
  INVX1 U176 ( .A(rx_data[0]), .Y(n164) );
  NOR2X1 U177 ( .A(n150), .B(n167), .Y(\next_Memory[5][7] ) );
  NOR2X1 U178 ( .A(n153), .B(n167), .Y(\next_Memory[5][6] ) );
  NOR2X1 U179 ( .A(n155), .B(n167), .Y(\next_Memory[5][5] ) );
  NOR2X1 U180 ( .A(n157), .B(n167), .Y(\next_Memory[5][4] ) );
  NOR2X1 U181 ( .A(n159), .B(n167), .Y(\next_Memory[5][3] ) );
  NOR2X1 U182 ( .A(n161), .B(n167), .Y(\next_Memory[5][2] ) );
  NOR2X1 U183 ( .A(n163), .B(n167), .Y(\next_Memory[5][1] ) );
  NOR2X1 U184 ( .A(n165), .B(n167), .Y(\next_Memory[5][0] ) );
  OR2X1 U185 ( .A(n104), .B(n168), .Y(n167) );
  NOR2X1 U186 ( .A(n150), .B(n169), .Y(\next_Memory[1][7] ) );
  NOR2X1 U187 ( .A(n153), .B(n169), .Y(\next_Memory[1][6] ) );
  NOR2X1 U188 ( .A(n155), .B(n169), .Y(\next_Memory[1][5] ) );
  NOR2X1 U189 ( .A(n157), .B(n169), .Y(\next_Memory[1][4] ) );
  NOR2X1 U190 ( .A(n159), .B(n169), .Y(\next_Memory[1][3] ) );
  NOR2X1 U191 ( .A(n161), .B(n169), .Y(\next_Memory[1][2] ) );
  MUX2X1 U192 ( .B(n163), .A(n170), .S(n169), .Y(\next_Memory[1][1] ) );
  MUX2X1 U193 ( .B(n165), .A(n171), .S(n169), .Y(\next_Memory[1][0] ) );
  NAND3X1 U194 ( .A(paddr[0]), .B(n172), .C(n173), .Y(n169) );
  NAND2X1 U195 ( .A(framing_error), .B(n170), .Y(n171) );
  INVX1 U196 ( .A(overrun_error), .Y(n170) );
  NOR2X1 U197 ( .A(n150), .B(n174), .Y(\next_Memory[0][7] ) );
  NOR2X1 U198 ( .A(n153), .B(n174), .Y(\next_Memory[0][6] ) );
  NOR2X1 U199 ( .A(n155), .B(n174), .Y(\next_Memory[0][5] ) );
  NOR2X1 U200 ( .A(n157), .B(n174), .Y(\next_Memory[0][4] ) );
  NOR2X1 U201 ( .A(n159), .B(n174), .Y(\next_Memory[0][3] ) );
  NOR2X1 U202 ( .A(n161), .B(n174), .Y(\next_Memory[0][2] ) );
  NOR2X1 U203 ( .A(n163), .B(n174), .Y(\next_Memory[0][1] ) );
  MUX2X1 U204 ( .B(n165), .A(n175), .S(n174), .Y(\next_Memory[0][0] ) );
  NAND3X1 U205 ( .A(n104), .B(n172), .C(n173), .Y(n174) );
  INVX1 U206 ( .A(data_ready), .Y(n175) );
  INVX1 U207 ( .A(n176), .Y(n235) );
  NAND3X1 U208 ( .A(n114), .B(n115), .C(n177), .Y(n176) );
  OAI21X1 U209 ( .A(n178), .B(n179), .C(n180), .Y(n177) );
  INVX1 U210 ( .A(n181), .Y(n236) );
  NAND3X1 U211 ( .A(n114), .B(n115), .C(n182), .Y(n181) );
  OAI21X1 U212 ( .A(pwrite), .B(n178), .C(n180), .Y(n182) );
  NAND3X1 U213 ( .A(psel), .B(n183), .C(n184), .Y(n180) );
  MUX2X1 U214 ( .B(n185), .A(n186), .S(paddr[1]), .Y(n184) );
  NOR2X1 U215 ( .A(paddr[0]), .B(n186), .Y(n185) );
  OAI21X1 U216 ( .A(n141), .B(n172), .C(n179), .Y(n183) );
  INVX1 U217 ( .A(pwrite), .Y(n179) );
  INVX1 U218 ( .A(n187), .Y(n141) );
  INVX1 U219 ( .A(psel), .Y(n178) );
  INVX1 U220 ( .A(state[1]), .Y(n115) );
  NOR2X1 U221 ( .A(n187), .B(n140), .Y(data_read) );
  NAND3X1 U222 ( .A(state[1]), .B(n114), .C(penable), .Y(n140) );
  NAND3X1 U223 ( .A(paddr[1]), .B(n104), .C(paddr[2]), .Y(n187) );
  MUX2X1 U224 ( .B(n188), .A(n150), .S(n189), .Y(n216) );
  INVX1 U225 ( .A(\Memory[4][7] ), .Y(n188) );
  MUX2X1 U226 ( .B(n147), .A(n153), .S(n189), .Y(n215) );
  INVX1 U227 ( .A(\Memory[4][6] ), .Y(n147) );
  MUX2X1 U228 ( .B(n146), .A(n155), .S(n189), .Y(n214) );
  INVX1 U229 ( .A(\Memory[4][5] ), .Y(n146) );
  MUX2X1 U230 ( .B(n145), .A(n157), .S(n189), .Y(n213) );
  INVX1 U231 ( .A(\Memory[4][4] ), .Y(n145) );
  MUX2X1 U232 ( .B(n190), .A(n159), .S(n189), .Y(n212) );
  INVX1 U233 ( .A(data_size[3]), .Y(n190) );
  MUX2X1 U234 ( .B(n191), .A(n161), .S(n189), .Y(n211) );
  INVX1 U235 ( .A(data_size[2]), .Y(n191) );
  MUX2X1 U236 ( .B(n139), .A(n163), .S(n189), .Y(n210) );
  INVX1 U237 ( .A(data_size[1]), .Y(n139) );
  MUX2X1 U238 ( .B(n192), .A(n165), .S(n189), .Y(n209) );
  NOR2X1 U239 ( .A(n168), .B(paddr[0]), .Y(n189) );
  NAND3X1 U240 ( .A(paddr[2]), .B(n172), .C(n166), .Y(n168) );
  INVX1 U241 ( .A(paddr[1]), .Y(n172) );
  INVX1 U242 ( .A(data_size[0]), .Y(n192) );
  MUX2X1 U243 ( .B(n150), .A(n217), .S(n218), .Y(n208) );
  INVX1 U244 ( .A(\Memory[3][7] ), .Y(n217) );
  MUX2X1 U245 ( .B(n153), .A(n219), .S(n218), .Y(n207) );
  INVX1 U246 ( .A(\Memory[3][6] ), .Y(n219) );
  MUX2X1 U247 ( .B(n155), .A(n220), .S(n218), .Y(n206) );
  INVX1 U248 ( .A(bit_period[13]), .Y(n220) );
  MUX2X1 U249 ( .B(n157), .A(n221), .S(n218), .Y(n205) );
  INVX1 U250 ( .A(bit_period[12]), .Y(n221) );
  MUX2X1 U251 ( .B(n159), .A(n222), .S(n218), .Y(n204) );
  INVX1 U252 ( .A(bit_period[11]), .Y(n222) );
  MUX2X1 U253 ( .B(n161), .A(n223), .S(n218), .Y(n203) );
  INVX1 U254 ( .A(bit_period[10]), .Y(n223) );
  MUX2X1 U255 ( .B(n163), .A(n224), .S(n218), .Y(n202) );
  INVX1 U256 ( .A(bit_period[9]), .Y(n224) );
  MUX2X1 U257 ( .B(n165), .A(n225), .S(n218), .Y(n201) );
  NAND3X1 U258 ( .A(paddr[0]), .B(paddr[1]), .C(n173), .Y(n218) );
  INVX1 U259 ( .A(bit_period[8]), .Y(n225) );
  MUX2X1 U260 ( .B(n150), .A(n226), .S(n227), .Y(n200) );
  INVX1 U261 ( .A(bit_period[7]), .Y(n226) );
  MUX2X1 U262 ( .B(N103), .A(pwdata[7]), .S(penable), .Y(n150) );
  MUX2X1 U263 ( .B(n153), .A(n228), .S(n227), .Y(n199) );
  INVX1 U264 ( .A(bit_period[6]), .Y(n228) );
  MUX2X1 U265 ( .B(N145), .A(pwdata[6]), .S(penable), .Y(n153) );
  MUX2X1 U266 ( .B(n155), .A(n229), .S(n227), .Y(n198) );
  INVX1 U267 ( .A(bit_period[5]), .Y(n229) );
  MUX2X1 U268 ( .B(N146), .A(pwdata[5]), .S(penable), .Y(n155) );
  MUX2X1 U269 ( .B(n157), .A(n230), .S(n227), .Y(n197) );
  INVX1 U270 ( .A(bit_period[4]), .Y(n230) );
  MUX2X1 U271 ( .B(N147), .A(pwdata[4]), .S(penable), .Y(n157) );
  MUX2X1 U272 ( .B(n159), .A(n231), .S(n227), .Y(n196) );
  INVX1 U273 ( .A(bit_period[3]), .Y(n231) );
  MUX2X1 U274 ( .B(N148), .A(pwdata[3]), .S(penable), .Y(n159) );
  MUX2X1 U275 ( .B(n161), .A(n232), .S(n227), .Y(n195) );
  INVX1 U276 ( .A(bit_period[2]), .Y(n232) );
  MUX2X1 U277 ( .B(N149), .A(pwdata[2]), .S(penable), .Y(n161) );
  MUX2X1 U278 ( .B(n163), .A(n233), .S(n227), .Y(n194) );
  INVX1 U279 ( .A(bit_period[1]), .Y(n233) );
  MUX2X1 U280 ( .B(N150), .A(pwdata[1]), .S(penable), .Y(n163) );
  MUX2X1 U281 ( .B(n165), .A(n234), .S(n227), .Y(n193) );
  NAND3X1 U282 ( .A(paddr[1]), .B(n104), .C(n173), .Y(n227) );
  AND2X1 U283 ( .A(n166), .B(n186), .Y(n173) );
  INVX1 U284 ( .A(paddr[2]), .Y(n186) );
  NOR2X1 U285 ( .A(n114), .B(state[1]), .Y(n166) );
  INVX1 U286 ( .A(state[0]), .Y(n114) );
  INVX1 U287 ( .A(bit_period[0]), .Y(n234) );
  MUX2X1 U288 ( .B(N151), .A(pwdata[0]), .S(penable), .Y(n165) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n33, n34, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n23;
  wire   [3:0] state;

  DFFSR \state_reg[0]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  INVX1 U6 ( .A(n4), .Y(sbc_enable) );
  OAI21X1 U7 ( .A(state[0]), .B(n5), .C(n6), .Y(n4) );
  OAI21X1 U8 ( .A(state[0]), .B(n7), .C(n8), .Y(n6) );
  INVX1 U9 ( .A(n9), .Y(enable_timer) );
  OAI21X1 U10 ( .A(n5), .B(n10), .C(n11), .Y(n23) );
  INVX1 U11 ( .A(n11), .Y(sbc_clear) );
  NOR2X1 U12 ( .A(n12), .B(n13), .Y(load_buffer) );
  OR2X1 U13 ( .A(n14), .B(n15), .Y(n34) );
  OAI21X1 U14 ( .A(n9), .B(n16), .C(n17), .Y(n15) );
  INVX1 U15 ( .A(packet_done), .Y(n16) );
  NAND3X1 U16 ( .A(n12), .B(n7), .C(state[1]), .Y(n9) );
  MUX2X1 U17 ( .B(n10), .A(n18), .S(n12), .Y(n14) );
  INVX1 U18 ( .A(state[0]), .Y(n12) );
  NAND3X1 U19 ( .A(n5), .B(n7), .C(start_bit_detected), .Y(n18) );
  OAI21X1 U20 ( .A(n7), .B(n10), .C(n19), .Y(n33) );
  AND2X1 U21 ( .A(n17), .B(n8), .Y(n19) );
  NAND2X1 U22 ( .A(n20), .B(n21), .Y(n17) );
  NOR2X1 U23 ( .A(state[0]), .B(framing_error), .Y(n20) );
  NAND3X1 U24 ( .A(n11), .B(n8), .C(n13), .Y(n10) );
  INVX1 U25 ( .A(n21), .Y(n13) );
  NOR2X1 U26 ( .A(n7), .B(state[1]), .Y(n21) );
  NAND3X1 U27 ( .A(state[0]), .B(n7), .C(state[1]), .Y(n8) );
  NAND3X1 U28 ( .A(n5), .B(n7), .C(state[0]), .Y(n11) );
  INVX1 U29 ( .A(state[1]), .Y(n5) );
  INVX1 U30 ( .A(state[2]), .Y(n7) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_dec_0 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;
  wire   n2, n4, n6, n8, n10, n12, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;

  INVX2 U1 ( .A(n29), .Y(SUM[13]) );
  INVX2 U2 ( .A(A[12]), .Y(n2) );
  INVX2 U3 ( .A(n32), .Y(SUM[11]) );
  INVX2 U4 ( .A(A[10]), .Y(n4) );
  INVX2 U5 ( .A(n15), .Y(SUM[9]) );
  INVX2 U6 ( .A(A[8]), .Y(n6) );
  INVX2 U7 ( .A(n19), .Y(SUM[7]) );
  INVX2 U8 ( .A(A[6]), .Y(n8) );
  INVX2 U9 ( .A(n22), .Y(SUM[5]) );
  INVX2 U10 ( .A(A[4]), .Y(n10) );
  INVX2 U11 ( .A(n25), .Y(SUM[3]) );
  INVX2 U12 ( .A(A[2]), .Y(n12) );
  INVX2 U13 ( .A(n28), .Y(SUM[1]) );
  INVX2 U14 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U15 ( .A(n16), .B(A[9]), .C(n17), .Y(n15) );
  OAI21X1 U16 ( .A(n18), .B(n6), .C(n16), .Y(SUM[8]) );
  AOI21X1 U17 ( .A(n20), .B(A[7]), .C(n18), .Y(n19) );
  OAI21X1 U18 ( .A(n21), .B(n8), .C(n20), .Y(SUM[6]) );
  AOI21X1 U19 ( .A(n23), .B(A[5]), .C(n21), .Y(n22) );
  OAI21X1 U20 ( .A(n24), .B(n10), .C(n23), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n26), .B(A[3]), .C(n24), .Y(n25) );
  OAI21X1 U22 ( .A(n27), .B(n12), .C(n26), .Y(SUM[2]) );
  AOI21X1 U23 ( .A(A[0]), .B(A[1]), .C(n27), .Y(n28) );
  AOI21X1 U24 ( .A(n30), .B(A[13]), .C(SUM[14]), .Y(n29) );
  NOR2X1 U25 ( .A(n30), .B(A[13]), .Y(SUM[14]) );
  OAI21X1 U26 ( .A(n31), .B(n2), .C(n30), .Y(SUM[12]) );
  NAND2X1 U27 ( .A(n31), .B(n2), .Y(n30) );
  AOI21X1 U28 ( .A(n33), .B(A[11]), .C(n31), .Y(n32) );
  NOR2X1 U29 ( .A(n33), .B(A[11]), .Y(n31) );
  OAI21X1 U30 ( .A(n17), .B(n4), .C(n33), .Y(SUM[10]) );
  NAND2X1 U31 ( .A(n17), .B(n4), .Y(n33) );
  NOR2X1 U32 ( .A(n16), .B(A[9]), .Y(n17) );
  NAND2X1 U33 ( .A(n18), .B(n6), .Y(n16) );
  NOR2X1 U34 ( .A(n20), .B(A[7]), .Y(n18) );
  NAND2X1 U35 ( .A(n21), .B(n8), .Y(n20) );
  NOR2X1 U36 ( .A(n23), .B(A[5]), .Y(n21) );
  NAND2X1 U37 ( .A(n24), .B(n10), .Y(n23) );
  NOR2X1 U38 ( .A(n26), .B(A[3]), .Y(n24) );
  NAND2X1 U39 ( .A(n27), .B(n12), .Y(n26) );
  NOR2X1 U40 ( .A(A[1]), .B(A[0]), .Y(n27) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n1, n2, n4, n5, n6, n7, n8, n9, n10, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128;

  DFFSR \count_out_reg[0]  ( .D(n99), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[11]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[1]  ( .D(n98), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n97), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n96), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n95), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n93), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n92), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n90), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[10]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[12]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[13]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 r315 ( .A(count_out), .SUM({N37, N36, 
        N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24}) );
  flex_counter_NUM_CNT_BITS14_DW01_dec_0 sub_31 ( .A({1'b0, rollover_val}), 
        .SUM({N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, 
        N5}) );
  INVX2 U8 ( .A(n104), .Y(n2) );
  OAI21X1 U9 ( .A(n1), .B(n2), .C(n4), .Y(n99) );
  AOI22X1 U21 ( .A(n5), .B(n6), .C(N24), .D(n7), .Y(n4) );
  OAI21X1 U22 ( .A(n8), .B(n2), .C(n9), .Y(n98) );
  NAND2X1 U23 ( .A(N25), .B(n7), .Y(n9) );
  OAI21X1 U24 ( .A(n10), .B(n2), .C(n26), .Y(n97) );
  NAND2X1 U25 ( .A(N26), .B(n7), .Y(n26) );
  OAI21X1 U26 ( .A(n27), .B(n2), .C(n28), .Y(n96) );
  NAND2X1 U27 ( .A(N27), .B(n7), .Y(n28) );
  OAI21X1 U28 ( .A(n29), .B(n2), .C(n30), .Y(n95) );
  NAND2X1 U29 ( .A(N28), .B(n7), .Y(n30) );
  OAI21X1 U30 ( .A(n31), .B(n2), .C(n32), .Y(n94) );
  NAND2X1 U31 ( .A(N29), .B(n7), .Y(n32) );
  OAI21X1 U32 ( .A(n33), .B(n2), .C(n34), .Y(n93) );
  NAND2X1 U33 ( .A(N30), .B(n7), .Y(n34) );
  OAI21X1 U34 ( .A(n35), .B(n2), .C(n36), .Y(n92) );
  NAND2X1 U35 ( .A(N31), .B(n7), .Y(n36) );
  OAI21X1 U36 ( .A(n37), .B(n2), .C(n38), .Y(n91) );
  NAND2X1 U37 ( .A(N32), .B(n7), .Y(n38) );
  OAI21X1 U38 ( .A(n39), .B(n2), .C(n40), .Y(n90) );
  NAND2X1 U39 ( .A(N33), .B(n7), .Y(n40) );
  OAI21X1 U40 ( .A(n41), .B(n2), .C(n42), .Y(n89) );
  NAND2X1 U41 ( .A(N34), .B(n7), .Y(n42) );
  OAI21X1 U42 ( .A(n43), .B(n2), .C(n44), .Y(n88) );
  NAND2X1 U43 ( .A(N35), .B(n7), .Y(n44) );
  OAI21X1 U44 ( .A(n45), .B(n2), .C(n46), .Y(n87) );
  NAND2X1 U45 ( .A(N36), .B(n7), .Y(n46) );
  OAI21X1 U46 ( .A(n47), .B(n2), .C(n48), .Y(n86) );
  NAND2X1 U47 ( .A(N37), .B(n7), .Y(n48) );
  NOR2X1 U48 ( .A(n49), .B(n6), .Y(n7) );
  AND2X1 U49 ( .A(n50), .B(n51), .Y(n6) );
  OAI21X1 U50 ( .A(rollover_val[13]), .B(n47), .C(n52), .Y(n51) );
  OAI21X1 U51 ( .A(count_out[13]), .B(n53), .C(n54), .Y(n52) );
  OAI21X1 U52 ( .A(rollover_val[12]), .B(n45), .C(n55), .Y(n54) );
  OAI21X1 U53 ( .A(count_out[12]), .B(n56), .C(n57), .Y(n55) );
  AOI22X1 U54 ( .A(rollover_val[11]), .B(n58), .C(n59), .D(n43), .Y(n57) );
  INVX1 U55 ( .A(n60), .Y(n59) );
  NAND2X1 U56 ( .A(count_out[11]), .B(n60), .Y(n58) );
  OAI21X1 U57 ( .A(rollover_val[10]), .B(n41), .C(n61), .Y(n60) );
  OAI21X1 U58 ( .A(count_out[10]), .B(n62), .C(n63), .Y(n61) );
  AOI22X1 U59 ( .A(rollover_val[9]), .B(n64), .C(n65), .D(n39), .Y(n63) );
  INVX1 U60 ( .A(count_out[9]), .Y(n39) );
  INVX1 U61 ( .A(n66), .Y(n65) );
  NAND2X1 U62 ( .A(count_out[9]), .B(n66), .Y(n64) );
  OAI21X1 U63 ( .A(rollover_val[8]), .B(n37), .C(n67), .Y(n66) );
  OAI21X1 U64 ( .A(count_out[8]), .B(n68), .C(n69), .Y(n67) );
  AOI22X1 U65 ( .A(rollover_val[7]), .B(n70), .C(n71), .D(n35), .Y(n69) );
  INVX1 U66 ( .A(n72), .Y(n71) );
  NAND2X1 U67 ( .A(count_out[7]), .B(n72), .Y(n70) );
  OAI21X1 U68 ( .A(rollover_val[6]), .B(n33), .C(n73), .Y(n72) );
  OAI21X1 U69 ( .A(count_out[6]), .B(n74), .C(n75), .Y(n73) );
  AOI22X1 U70 ( .A(rollover_val[5]), .B(n76), .C(n77), .D(n31), .Y(n75) );
  INVX1 U71 ( .A(count_out[5]), .Y(n31) );
  INVX1 U72 ( .A(n78), .Y(n77) );
  NAND2X1 U73 ( .A(count_out[5]), .B(n78), .Y(n76) );
  OAI22X1 U74 ( .A(n79), .B(n80), .C(rollover_val[4]), .D(n29), .Y(n78) );
  OAI21X1 U75 ( .A(count_out[3]), .B(n81), .C(n82), .Y(n80) );
  OAI21X1 U76 ( .A(n83), .B(n27), .C(rollover_val[3]), .Y(n82) );
  INVX1 U77 ( .A(n81), .Y(n83) );
  OAI21X1 U78 ( .A(rollover_val[2]), .B(n10), .C(n84), .Y(n81) );
  OAI21X1 U79 ( .A(count_out[2]), .B(n100), .C(n101), .Y(n84) );
  AOI22X1 U80 ( .A(n102), .B(rollover_val[0]), .C(rollover_val[1]), .D(n8), 
        .Y(n101) );
  INVX1 U81 ( .A(n103), .Y(n102) );
  OAI21X1 U82 ( .A(n8), .B(rollover_val[1]), .C(n1), .Y(n103) );
  INVX1 U83 ( .A(rollover_val[2]), .Y(n100) );
  AND2X1 U84 ( .A(n29), .B(rollover_val[4]), .Y(n79) );
  INVX1 U85 ( .A(rollover_val[6]), .Y(n74) );
  INVX1 U86 ( .A(rollover_val[8]), .Y(n68) );
  INVX1 U87 ( .A(count_out[8]), .Y(n37) );
  INVX1 U88 ( .A(rollover_val[10]), .Y(n62) );
  INVX1 U89 ( .A(rollover_val[12]), .Y(n56) );
  INVX1 U90 ( .A(count_out[12]), .Y(n45) );
  INVX1 U91 ( .A(rollover_val[13]), .Y(n53) );
  INVX1 U92 ( .A(count_out[13]), .Y(n47) );
  OAI21X1 U93 ( .A(n49), .B(n50), .C(n105), .Y(n85) );
  NAND2X1 U94 ( .A(rollover_flag), .B(n104), .Y(n105) );
  NAND2X1 U95 ( .A(n106), .B(n107), .Y(n50) );
  NOR2X1 U96 ( .A(n108), .B(n109), .Y(n107) );
  NAND3X1 U97 ( .A(n110), .B(n111), .C(n112), .Y(n109) );
  NOR2X1 U98 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U99 ( .A(count_out[9]), .B(N14), .Y(n114) );
  XOR2X1 U100 ( .A(count_out[8]), .B(N13), .Y(n113) );
  XOR2X1 U101 ( .A(n41), .B(N15), .Y(n111) );
  INVX1 U102 ( .A(count_out[10]), .Y(n41) );
  XOR2X1 U103 ( .A(n43), .B(N16), .Y(n110) );
  INVX1 U104 ( .A(count_out[11]), .Y(n43) );
  NAND3X1 U105 ( .A(n115), .B(n116), .C(n117), .Y(n108) );
  NOR2X1 U106 ( .A(N19), .B(n118), .Y(n117) );
  XOR2X1 U107 ( .A(count_out[5]), .B(N10), .Y(n118) );
  XOR2X1 U108 ( .A(n33), .B(N11), .Y(n116) );
  INVX1 U109 ( .A(count_out[6]), .Y(n33) );
  XOR2X1 U110 ( .A(n35), .B(N12), .Y(n115) );
  INVX1 U111 ( .A(count_out[7]), .Y(n35) );
  NOR2X1 U112 ( .A(n119), .B(n120), .Y(n106) );
  NAND3X1 U113 ( .A(n121), .B(n122), .C(n123), .Y(n120) );
  XOR2X1 U114 ( .A(n27), .B(N8), .Y(n123) );
  INVX1 U115 ( .A(count_out[3]), .Y(n27) );
  XOR2X1 U116 ( .A(n29), .B(N9), .Y(n122) );
  INVX1 U117 ( .A(count_out[4]), .Y(n29) );
  XOR2X1 U118 ( .A(n10), .B(N7), .Y(n121) );
  INVX1 U119 ( .A(count_out[2]), .Y(n10) );
  NAND3X1 U120 ( .A(n124), .B(n125), .C(n126), .Y(n119) );
  NOR2X1 U121 ( .A(n127), .B(n128), .Y(n126) );
  XOR2X1 U122 ( .A(count_out[13]), .B(N18), .Y(n128) );
  XOR2X1 U123 ( .A(count_out[12]), .B(N17), .Y(n127) );
  XOR2X1 U124 ( .A(n1), .B(N5), .Y(n125) );
  INVX1 U125 ( .A(count_out[0]), .Y(n1) );
  XOR2X1 U126 ( .A(n8), .B(N6), .Y(n124) );
  INVX1 U127 ( .A(count_out[1]), .Y(n8) );
  INVX1 U128 ( .A(n5), .Y(n49) );
  NOR2X1 U129 ( .A(n104), .B(clear), .Y(n5) );
  NOR2X1 U130 ( .A(count_enable), .B(clear), .Y(n104) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n53, n54, n55, n56, n57, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48;

  DFFSR \count_out_reg[0]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U7 ( .A(n1), .B(n2), .C(n3), .Y(n57) );
  OAI21X1 U9 ( .A(n4), .B(n1), .C(n5), .Y(n3) );
  INVX1 U10 ( .A(n6), .Y(n2) );
  MUX2X1 U11 ( .B(n7), .A(n8), .S(count_out[1]), .Y(n56) );
  NAND2X1 U12 ( .A(n9), .B(count_out[0]), .Y(n7) );
  MUX2X1 U13 ( .B(n10), .A(n16), .S(count_out[2]), .Y(n55) );
  INVX1 U14 ( .A(n17), .Y(n16) );
  OAI21X1 U15 ( .A(n18), .B(n10), .C(n19), .Y(n54) );
  OAI21X1 U16 ( .A(n9), .B(n17), .C(count_out[3]), .Y(n19) );
  OAI21X1 U17 ( .A(count_out[1]), .B(n20), .C(n8), .Y(n17) );
  AOI21X1 U18 ( .A(n1), .B(n9), .C(n6), .Y(n8) );
  NAND3X1 U19 ( .A(count_out[0]), .B(count_out[1]), .C(n9), .Y(n10) );
  INVX1 U20 ( .A(n20), .Y(n9) );
  NAND2X1 U21 ( .A(n5), .B(n21), .Y(n20) );
  INVX1 U22 ( .A(n4), .Y(n21) );
  OAI21X1 U23 ( .A(rollover_val[3]), .B(n22), .C(n23), .Y(n4) );
  OAI21X1 U24 ( .A(count_out[3]), .B(n24), .C(n25), .Y(n23) );
  OAI21X1 U25 ( .A(rollover_val[2]), .B(n18), .C(n26), .Y(n25) );
  OAI21X1 U26 ( .A(count_out[2]), .B(n27), .C(n28), .Y(n26) );
  AOI22X1 U27 ( .A(n29), .B(rollover_val[0]), .C(rollover_val[1]), .D(n30), 
        .Y(n28) );
  AND2X1 U28 ( .A(n1), .B(n31), .Y(n29) );
  INVX1 U29 ( .A(rollover_val[2]), .Y(n27) );
  INVX1 U30 ( .A(rollover_val[3]), .Y(n24) );
  INVX1 U31 ( .A(count_out[3]), .Y(n22) );
  OAI21X1 U32 ( .A(n32), .B(n33), .C(n34), .Y(n53) );
  NAND2X1 U33 ( .A(rollover_flag), .B(n6), .Y(n34) );
  NAND2X1 U34 ( .A(n35), .B(n36), .Y(n33) );
  MUX2X1 U35 ( .B(n37), .A(n38), .S(n39), .Y(n36) );
  NOR2X1 U36 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n38) );
  OR2X1 U37 ( .A(n40), .B(n41), .Y(n37) );
  OAI21X1 U38 ( .A(rollover_val[0]), .B(n30), .C(n31), .Y(n41) );
  NAND2X1 U39 ( .A(count_out[1]), .B(n42), .Y(n31) );
  XOR2X1 U40 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n40) );
  MUX2X1 U41 ( .B(n1), .A(n43), .S(rollover_val[0]), .Y(n35) );
  OAI21X1 U42 ( .A(count_out[1]), .B(n42), .C(n1), .Y(n43) );
  INVX1 U43 ( .A(rollover_val[1]), .Y(n42) );
  INVX1 U44 ( .A(count_out[0]), .Y(n1) );
  NAND3X1 U45 ( .A(n44), .B(n45), .C(n5), .Y(n32) );
  NOR2X1 U46 ( .A(n6), .B(clear), .Y(n5) );
  NOR2X1 U47 ( .A(count_enable), .B(clear), .Y(n6) );
  OAI21X1 U48 ( .A(n46), .B(n30), .C(n39), .Y(n45) );
  INVX1 U49 ( .A(count_out[1]), .Y(n30) );
  XOR2X1 U50 ( .A(n18), .B(rollover_val[2]), .Y(n46) );
  INVX1 U51 ( .A(count_out[2]), .Y(n18) );
  XOR2X1 U52 ( .A(n47), .B(count_out[3]), .Y(n44) );
  OAI21X1 U53 ( .A(rollover_val[2]), .B(n48), .C(rollover_val[3]), .Y(n47) );
  INVX1 U54 ( .A(n39), .Y(n48) );
  NOR2X1 U55 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n39) );
endmodule


module timer ( clk, n_rst, enable_timer, data_size, bit_period, shift_enable, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   _1_net_, \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n1, n2, n3, n4, n5
;

  flex_counter_NUM_CNT_BITS14 CT1 ( .clk(clk), .n_rst(n_rst), .clear(_1_net_), 
        .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4 CT2 ( .clk(clk), .n_rst(n_rst), .clear(_1_net_), 
        .count_enable(shift_enable), .rollover_val({\_2_net_[3] , \_2_net_[2] , 
        \_2_net_[1] , n5}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(data_size[0]), .Y(n5) );
  XOR2X1 U3 ( .A(data_size[3]), .B(n1), .Y(\_2_net_[3] ) );
  NOR2X1 U4 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U5 ( .A(n3), .B(n2), .Y(\_2_net_[2] ) );
  NAND2X1 U6 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U7 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U8 ( .A(data_size[1]), .B(data_size[0]), .Y(\_2_net_[1] ) );
  NAND2X1 U9 ( .A(enable_timer), .B(n4), .Y(_1_net_) );
  INVX1 U10 ( .A(packet_done), .Y(n4) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 SR_9 ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, data_read, serial_in, data_size, bit_period, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
  output [7:0] rx_data;
  input clk, n_rst, data_read, serial_in;
  output data_ready, overrun_error, framing_error;
  wire   start_bit_detected, packet_done, sbc_clear, sbc_enable, load_buffer,
         enable_timer, shift_enable, stop_bit;
  wire   [7:0] packet_data;

  start_bit_det START_BIT_DETECTOR ( .clk(clk), .n_rst(n_rst), .serial_in(
        serial_in), .start_bit_detected(start_bit_detected) );
  rcu RCU ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  timer TIMING_CONTROLLER ( .clk(clk), .n_rst(n_rst), .enable_timer(
        enable_timer), .data_size(data_size), .bit_period(bit_period), 
        .shift_enable(shift_enable), .packet_done(packet_done) );
  sr_9bit SHIFT_REGISTER ( .clk(clk), .n_rst(n_rst), .shift_strobe(
        shift_enable), .serial_in(serial_in), .packet_data(packet_data), 
        .stop_bit(stop_bit) );
  stop_bit_chk STOP_BIT_CHECK ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(framing_error)
         );
  rx_data_buff RX_DATA_BUFFER ( .clk(clk), .n_rst(n_rst), .load_buffer(
        load_buffer), .packet_data(packet_data), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, paddr, penable, pwrite, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave APB_SLAVE ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error), 
        .framing_error(framing_error), .psel(psel), .paddr(paddr), .penable(
        penable), .pwrite(pwrite), .pwdata(pwdata), .data_read(data_read), 
        .prdata(prdata), .pslverr(pslverr), .data_size(data_size), 
        .bit_period(bit_period) );
  rcv_block RCV_BLOCK ( .clk(clk), .n_rst(n_rst), .data_read(data_read), 
        .serial_in(serial_in), .data_size(data_size), .bit_period(bit_period), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
endmodule

