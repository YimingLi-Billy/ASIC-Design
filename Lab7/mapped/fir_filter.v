/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct  8 20:39:27 2019
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   media;

  DFFSR media_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(media) );
  DFFSR sync_out_reg ( .D(media), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   media;

  DFFSR media_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(media) );
  DFFSR sync_out_reg ( .D(media), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   next_modwait, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152;
  wire   [4:0] next_state;
  wire   [4:0] state;
  assign src1[3] = 1'b0;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(state[3]) );
  DFFSR modwait_reg ( .D(next_modwait), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        modwait) );
  AND2X2 U9 ( .A(n35), .B(n139), .Y(n141) );
  INVX1 U10 ( .A(overflow), .Y(n91) );
  INVX2 U11 ( .A(n48), .Y(n24) );
  INVX1 U12 ( .A(n91), .Y(n7) );
  NAND2X1 U13 ( .A(n24), .B(n54), .Y(n8) );
  NAND2X1 U14 ( .A(n104), .B(n9), .Y(n140) );
  INVX1 U15 ( .A(n8), .Y(n9) );
  NAND2X1 U16 ( .A(n24), .B(n54), .Y(n10) );
  NAND2X1 U17 ( .A(n27), .B(n11), .Y(n135) );
  INVX2 U18 ( .A(n10), .Y(n11) );
  NAND2X1 U19 ( .A(n149), .B(n115), .Y(n12) );
  NAND2X1 U20 ( .A(n71), .B(n13), .Y(next_state[4]) );
  INVX2 U21 ( .A(n12), .Y(n13) );
  NAND2X1 U22 ( .A(n128), .B(n24), .Y(n14) );
  NAND2X1 U23 ( .A(n46), .B(n15), .Y(n69) );
  INVX2 U24 ( .A(n14), .Y(n15) );
  OR2X2 U25 ( .A(n93), .B(n92), .Y(next_state[2]) );
  AND2X1 U26 ( .A(n70), .B(n69), .Y(n126) );
  AND2X2 U27 ( .A(n96), .B(n54), .Y(n16) );
  INVX2 U28 ( .A(state[3]), .Y(n37) );
  AND2X2 U29 ( .A(n128), .B(n47), .Y(n17) );
  AND2X2 U30 ( .A(n145), .B(n144), .Y(n18) );
  INVX4 U31 ( .A(n19), .Y(src2[2]) );
  INVX1 U32 ( .A(state[1]), .Y(n96) );
  INVX1 U33 ( .A(n115), .Y(n116) );
  AND2X2 U34 ( .A(n140), .B(n137), .Y(n19) );
  AND2X1 U35 ( .A(n142), .B(n135), .Y(n40) );
  INVX1 U36 ( .A(n58), .Y(n20) );
  INVX1 U37 ( .A(n20), .Y(n21) );
  INVX2 U38 ( .A(n47), .Y(n25) );
  INVX1 U39 ( .A(n61), .Y(n22) );
  INVX1 U40 ( .A(n61), .Y(n83) );
  INVX2 U41 ( .A(state[4]), .Y(n58) );
  INVX1 U42 ( .A(n146), .Y(n68) );
  BUFX2 U43 ( .A(n34), .Y(n23) );
  BUFX2 U44 ( .A(n129), .Y(n26) );
  AND2X2 U45 ( .A(n29), .B(n32), .Y(n27) );
  NAND2X1 U46 ( .A(n53), .B(n17), .Y(n143) );
  NAND2X1 U47 ( .A(n104), .B(n16), .Y(n35) );
  NAND2X1 U48 ( .A(n126), .B(n28), .Y(next_state[0]) );
  NOR2X1 U49 ( .A(n127), .B(n50), .Y(n28) );
  INVX2 U50 ( .A(n58), .Y(n29) );
  INVX2 U51 ( .A(n124), .Y(n30) );
  INVX1 U52 ( .A(n138), .Y(n124) );
  BUFX2 U53 ( .A(state[1]), .Y(n48) );
  INVX2 U54 ( .A(src2[2]), .Y(n31) );
  AND2X2 U55 ( .A(n47), .B(n37), .Y(n32) );
  INVX2 U56 ( .A(n38), .Y(n33) );
  INVX1 U57 ( .A(n47), .Y(n34) );
  INVX2 U58 ( .A(n55), .Y(n104) );
  BUFX2 U59 ( .A(n35), .Y(n36) );
  INVX2 U60 ( .A(n37), .Y(n38) );
  INVX4 U61 ( .A(n54), .Y(n128) );
  AND2X2 U62 ( .A(state[1]), .B(n58), .Y(n39) );
  INVX2 U63 ( .A(n39), .Y(n95) );
  AND2X1 U64 ( .A(n47), .B(n54), .Y(n43) );
  AND2X1 U65 ( .A(n48), .B(n54), .Y(n44) );
  AND2X2 U66 ( .A(n128), .B(n34), .Y(n41) );
  OR2X1 U67 ( .A(n150), .B(n130), .Y(dest[1]) );
  AND2X2 U68 ( .A(n52), .B(n128), .Y(n45) );
  BUFX4 U69 ( .A(state[0]), .Y(n54) );
  AND2X2 U70 ( .A(n29), .B(n32), .Y(n46) );
  BUFX4 U71 ( .A(state[2]), .Y(n47) );
  INVX1 U72 ( .A(n152), .Y(n49) );
  NAND2X1 U73 ( .A(n144), .B(n125), .Y(n50) );
  AND2X2 U74 ( .A(n99), .B(n69), .Y(n51) );
  AND2X2 U75 ( .A(n39), .B(n38), .Y(n52) );
  AND2X2 U76 ( .A(n38), .B(n22), .Y(n53) );
  INVX1 U77 ( .A(src1[2]), .Y(n105) );
  NAND3X1 U78 ( .A(n29), .B(n37), .C(n25), .Y(n55) );
  NAND2X1 U79 ( .A(n52), .B(n43), .Y(n137) );
  NAND2X1 U80 ( .A(n44), .B(n104), .Y(n142) );
  NAND2X1 U81 ( .A(n47), .B(n37), .Y(n60) );
  NAND3X1 U82 ( .A(n128), .B(n48), .C(n46), .Y(n146) );
  NAND2X1 U83 ( .A(n104), .B(n128), .Y(n115) );
  NAND3X1 U84 ( .A(n146), .B(n115), .C(n69), .Y(n98) );
  INVX2 U85 ( .A(n98), .Y(n152) );
  NAND2X1 U86 ( .A(n40), .B(n152), .Y(src2[3]) );
  INVX2 U87 ( .A(src2[2]), .Y(n136) );
  INVX2 U88 ( .A(src2[3]), .Y(n56) );
  NAND2X1 U89 ( .A(n45), .B(n23), .Y(n121) );
  NAND3X1 U90 ( .A(n31), .B(n56), .C(n121), .Y(op[2]) );
  NAND3X1 U91 ( .A(n39), .B(n25), .C(n54), .Y(n57) );
  INVX2 U92 ( .A(n57), .Y(n63) );
  NAND2X1 U93 ( .A(n63), .B(n38), .Y(n139) );
  NAND2X1 U94 ( .A(n96), .B(n21), .Y(n61) );
  NAND2X1 U95 ( .A(n43), .B(n53), .Y(n129) );
  NAND2X1 U96 ( .A(n139), .B(n26), .Y(n75) );
  INVX2 U97 ( .A(n75), .Y(n145) );
  NAND3X1 U98 ( .A(n83), .B(n33), .C(n41), .Y(n133) );
  NAND2X1 U99 ( .A(n32), .B(n128), .Y(n94) );
  INVX2 U100 ( .A(n94), .Y(n81) );
  NAND3X1 U101 ( .A(n53), .B(n54), .C(n34), .Y(n147) );
  INVX2 U102 ( .A(n147), .Y(cnt_up) );
  AOI21X1 U103 ( .A(n81), .B(n83), .C(cnt_up), .Y(n59) );
  NAND3X1 U104 ( .A(n145), .B(n133), .C(n59), .Y(dest[0]) );
  NAND2X1 U105 ( .A(n40), .B(n31), .Y(n150) );
  INVX2 U106 ( .A(n150), .Y(n149) );
  NAND2X1 U107 ( .A(n53), .B(n128), .Y(n114) );
  NAND3X1 U108 ( .A(n39), .B(n33), .C(n41), .Y(n134) );
  NAND3X1 U109 ( .A(n114), .B(n60), .C(n134), .Y(n67) );
  NOR2X1 U110 ( .A(n34), .B(n33), .Y(n62) );
  NAND2X1 U111 ( .A(n95), .B(n61), .Y(n80) );
  NAND3X1 U112 ( .A(n62), .B(n128), .C(n80), .Y(n138) );
  INVX2 U113 ( .A(op[2]), .Y(n65) );
  NAND2X1 U114 ( .A(n63), .B(n33), .Y(n101) );
  NAND3X1 U115 ( .A(n83), .B(n54), .C(n33), .Y(n100) );
  NAND2X1 U116 ( .A(n101), .B(n100), .Y(n111) );
  NOR2X1 U117 ( .A(dest[0]), .B(n111), .Y(n64) );
  NAND3X1 U118 ( .A(n30), .B(n65), .C(n64), .Y(n66) );
  OR2X1 U119 ( .A(n67), .B(n66), .Y(n120) );
  INVX2 U120 ( .A(n120), .Y(n89) );
  INVX2 U121 ( .A(dr), .Y(n113) );
  AOI22X1 U122 ( .A(cnt_up), .B(n113), .C(overflow), .D(n68), .Y(n70) );
  NAND2X1 U123 ( .A(n44), .B(n27), .Y(n125) );
  INVX2 U124 ( .A(n125), .Y(err) );
  NAND2X1 U125 ( .A(err), .B(n113), .Y(n99) );
  NAND2X1 U126 ( .A(n51), .B(n70), .Y(n93) );
  NOR2X1 U127 ( .A(n89), .B(n93), .Y(n71) );
  AND2X2 U128 ( .A(n121), .B(n120), .Y(n78) );
  OAI22X1 U129 ( .A(overflow), .B(n146), .C(lc), .D(n114), .Y(n74) );
  NAND2X1 U130 ( .A(n32), .B(n54), .Y(n79) );
  OAI21X1 U131 ( .A(cnt_up), .B(err), .C(dr), .Y(n72) );
  OAI21X1 U132 ( .A(n95), .B(n79), .C(n72), .Y(n73) );
  NOR2X1 U133 ( .A(n74), .B(n73), .Y(n77) );
  NOR2X1 U134 ( .A(n124), .B(n75), .Y(n76) );
  NAND3X1 U135 ( .A(n78), .B(n77), .C(n76), .Y(next_state[3]) );
  INVX2 U136 ( .A(lc), .Y(n117) );
  INVX2 U137 ( .A(n79), .Y(n84) );
  NAND2X1 U138 ( .A(n81), .B(n80), .Y(n131) );
  INVX2 U139 ( .A(n131), .Y(n82) );
  AOI21X1 U140 ( .A(n84), .B(n83), .C(n82), .Y(n85) );
  OAI21X1 U141 ( .A(n101), .B(n117), .C(n85), .Y(n86) );
  NOR2X1 U142 ( .A(n124), .B(n86), .Y(n87) );
  NAND3X1 U143 ( .A(n40), .B(n145), .C(n87), .Y(n88) );
  AOI21X1 U144 ( .A(n89), .B(n47), .C(n88), .Y(n90) );
  OAI21X1 U145 ( .A(n91), .B(n115), .C(n90), .Y(n92) );
  NAND2X1 U146 ( .A(n45), .B(n47), .Y(n132) );
  NAND3X1 U147 ( .A(n132), .B(n135), .C(n129), .Y(src1[2]) );
  OAI22X1 U148 ( .A(n24), .B(n120), .C(n95), .D(n94), .Y(n97) );
  AOI21X1 U149 ( .A(n7), .B(n49), .C(n97), .Y(n110) );
  INVX2 U150 ( .A(n99), .Y(n103) );
  MUX2X1 U151 ( .B(n101), .A(n100), .S(lc), .Y(n102) );
  NOR2X1 U152 ( .A(n103), .B(n102), .Y(n109) );
  NAND3X1 U153 ( .A(n147), .B(n121), .C(n36), .Y(n107) );
  NAND3X1 U154 ( .A(n104), .B(n48), .C(n128), .Y(n122) );
  NAND3X1 U155 ( .A(n134), .B(n105), .C(n122), .Y(n106) );
  NOR2X1 U156 ( .A(n107), .B(n106), .Y(n108) );
  NAND3X1 U157 ( .A(n110), .B(n109), .C(n108), .Y(next_state[1]) );
  NAND3X1 U158 ( .A(n131), .B(n134), .C(n133), .Y(clear) );
  INVX2 U159 ( .A(n111), .Y(n112) );
  OAI21X1 U160 ( .A(n114), .B(n113), .C(n112), .Y(n118) );
  AOI21X1 U161 ( .A(n118), .B(n117), .C(n116), .Y(n119) );
  OAI21X1 U162 ( .A(n128), .B(n120), .C(n119), .Y(n127) );
  INVX2 U163 ( .A(clear), .Y(n148) );
  NAND3X1 U164 ( .A(n122), .B(n121), .C(n148), .Y(n123) );
  NOR2X1 U165 ( .A(n124), .B(n123), .Y(n144) );
  NAND3X1 U166 ( .A(n26), .B(n143), .C(n131), .Y(n130) );
  NAND3X1 U167 ( .A(n132), .B(n131), .C(n147), .Y(dest[2]) );
  NAND3X1 U168 ( .A(n149), .B(n134), .C(n133), .Y(dest[3]) );
  NAND2X1 U169 ( .A(n135), .B(n36), .Y(src2[0]) );
  NAND2X1 U170 ( .A(n136), .B(n152), .Y(src2[1]) );
  NAND3X1 U171 ( .A(n138), .B(n142), .C(n137), .Y(src1[0]) );
  NAND3X1 U172 ( .A(n143), .B(n142), .C(n141), .Y(src1[1]) );
  NAND2X1 U173 ( .A(n18), .B(n146), .Y(op[0]) );
  NAND3X1 U174 ( .A(n149), .B(n148), .C(n147), .Y(op[1]) );
  NOR2X1 U175 ( .A(cnt_up), .B(n150), .Y(n151) );
  NAND3X1 U176 ( .A(n18), .B(n152), .C(n151), .Y(next_modwait) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n103, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173;

  FAX1 U2 ( .A(n103), .B(B[16]), .C(n16), .YC(n15), .YS(DIFF[16]) );
  FAX1 U3 ( .A(A[15]), .B(n87), .C(n17), .YC(n16), .YS(DIFF[15]) );
  XOR2X1 U4 ( .A(n20), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n165), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n165), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  XOR2X1 U18 ( .A(n168), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  XNOR2X1 U24 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n164), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n164), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n36), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n163), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n163), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n44), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n49), .B(n171), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n171), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n169), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n172), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n162), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n162), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n167), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n63), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(n99), .Y(n63) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n170), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n173), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U102 ( .A(A[0]), .B(n173), .Y(n72) );
  INVX1 U123 ( .A(B[12]), .Y(n90) );
  INVX1 U124 ( .A(B[0]), .Y(n173) );
  OR2X2 U125 ( .A(A[5]), .B(n97), .Y(n162) );
  OR2X2 U126 ( .A(A[9]), .B(n93), .Y(n163) );
  OR2X2 U127 ( .A(A[11]), .B(n91), .Y(n164) );
  OR2X2 U128 ( .A(A[13]), .B(n89), .Y(n165) );
  INVX1 U129 ( .A(B[13]), .Y(n89) );
  INVX1 U130 ( .A(n60), .Y(n166) );
  INVX2 U131 ( .A(n166), .Y(n167) );
  BUFX2 U132 ( .A(n28), .Y(n168) );
  BUFX2 U133 ( .A(n52), .Y(n169) );
  INVX1 U134 ( .A(n69), .Y(n68) );
  INVX1 U135 ( .A(B[8]), .Y(n94) );
  INVX1 U136 ( .A(n66), .Y(n85) );
  INVX1 U137 ( .A(B[10]), .Y(n92) );
  INVX1 U138 ( .A(B[9]), .Y(n93) );
  INVX1 U139 ( .A(B[5]), .Y(n97) );
  NOR2X1 U140 ( .A(A[0]), .B(n173), .Y(n170) );
  OR2X2 U141 ( .A(A[7]), .B(n95), .Y(n171) );
  INVX1 U142 ( .A(B[14]), .Y(n88) );
  INVX1 U143 ( .A(B[1]), .Y(n101) );
  BUFX2 U144 ( .A(n57), .Y(n172) );
  INVX1 U145 ( .A(B[3]), .Y(n99) );
  INVX1 U146 ( .A(B[6]), .Y(n96) );
  INVX1 U147 ( .A(n63), .Y(n84) );
  INVX2 U148 ( .A(B[4]), .Y(n98) );
  INVX2 U149 ( .A(B[7]), .Y(n95) );
  INVX2 U150 ( .A(B[11]), .Y(n91) );
  INVX2 U151 ( .A(B[15]), .Y(n87) );
  INVX2 U152 ( .A(n70), .Y(n86) );
  INVX2 U153 ( .A(n58), .Y(n83) );
  INVX2 U154 ( .A(n50), .Y(n81) );
  INVX2 U155 ( .A(n42), .Y(n79) );
  INVX2 U156 ( .A(n34), .Y(n77) );
  INVX2 U157 ( .A(n26), .Y(n75) );
  INVX2 U158 ( .A(n18), .Y(n73) );
  INVX2 U159 ( .A(n56), .Y(n54) );
  INVX2 U160 ( .A(n48), .Y(n46) );
  INVX2 U161 ( .A(n40), .Y(n38) );
  INVX2 U162 ( .A(n32), .Y(n30) );
  INVX2 U163 ( .A(n24), .Y(n22) );
  INVX2 U164 ( .A(A[17]), .Y(n103) );
  INVX2 U165 ( .A(B[2]), .Y(n100) );
  INVX2 U166 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171;

  XNOR2X1 U5 ( .A(n23), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n170), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n170), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(B[14]), .Y(n22) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n24) );
  NAND2X1 U18 ( .A(A[13]), .B(B[13]), .Y(n25) );
  AOI21X1 U20 ( .A(n169), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n169), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(B[12]), .Y(n30) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2X1 U32 ( .A(A[11]), .B(B[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n168), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n168), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(B[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n154), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n40) );
  NAND2X1 U46 ( .A(A[9]), .B(B[9]), .Y(n41) );
  AOI21X1 U48 ( .A(n166), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n166), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(B[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n50), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2X1 U60 ( .A(A[7]), .B(B[7]), .Y(n49) );
  AOI21X1 U62 ( .A(n167), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n167), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(B[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n58), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n56) );
  NAND2X1 U74 ( .A(A[5]), .B(B[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n63), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n164), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n164), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(B[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n66), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U88 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n71), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n165), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n165), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(B[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n14), .B(n163), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U102 ( .A(B[1]), .B(A[1]), .Y(n73) );
  NAND2X1 U107 ( .A(A[0]), .B(B[0]), .Y(n75) );
  OR2X1 U113 ( .A(A[12]), .B(B[12]), .Y(n169) );
  OR2X2 U114 ( .A(A[0]), .B(B[0]), .Y(n171) );
  INVX1 U115 ( .A(n72), .Y(n90) );
  AND2X2 U116 ( .A(n163), .B(n171), .Y(SUM[0]) );
  OR2X2 U117 ( .A(A[10]), .B(B[10]), .Y(n168) );
  OR2X2 U118 ( .A(A[4]), .B(B[4]), .Y(n164) );
  INVX1 U119 ( .A(n42), .Y(n153) );
  INVX2 U120 ( .A(n153), .Y(n154) );
  XOR2X1 U121 ( .A(A[15]), .B(B[15]), .Y(n155) );
  XOR2X1 U122 ( .A(n155), .B(n76), .Y(SUM[15]) );
  NAND2X1 U123 ( .A(A[15]), .B(B[15]), .Y(n156) );
  NAND2X1 U124 ( .A(A[15]), .B(n76), .Y(n157) );
  NAND2X1 U125 ( .A(B[15]), .B(n76), .Y(n158) );
  NAND3X1 U126 ( .A(n156), .B(n157), .C(n158), .Y(n17) );
  XOR2X1 U127 ( .A(n93), .B(n92), .Y(n159) );
  XOR2X1 U128 ( .A(n159), .B(n17), .Y(SUM[16]) );
  NAND2X1 U129 ( .A(n93), .B(n92), .Y(n160) );
  NAND2X1 U130 ( .A(n17), .B(n93), .Y(n161) );
  NAND2X1 U131 ( .A(n92), .B(n17), .Y(n162) );
  NAND3X1 U132 ( .A(n160), .B(n161), .C(n162), .Y(n16) );
  OR2X1 U133 ( .A(A[8]), .B(B[8]), .Y(n166) );
  NAND2X1 U134 ( .A(A[0]), .B(B[0]), .Y(n163) );
  OR2X1 U135 ( .A(A[14]), .B(B[14]), .Y(n170) );
  XOR2X1 U136 ( .A(n34), .B(n4), .Y(SUM[11]) );
  XNOR2X1 U137 ( .A(n31), .B(n3), .Y(SUM[12]) );
  XOR2X1 U138 ( .A(n26), .B(n2), .Y(SUM[13]) );
  XNOR2X1 U139 ( .A(n47), .B(n7), .Y(SUM[8]) );
  XNOR2X1 U140 ( .A(n55), .B(n9), .Y(SUM[6]) );
  OR2X2 U141 ( .A(A[2]), .B(B[2]), .Y(n165) );
  OR2X1 U142 ( .A(A[6]), .B(B[6]), .Y(n167) );
  INVX2 U143 ( .A(A[17]), .Y(n93) );
  INVX2 U144 ( .A(B[17]), .Y(n92) );
  INVX2 U145 ( .A(n64), .Y(n88) );
  INVX2 U146 ( .A(n56), .Y(n86) );
  INVX2 U147 ( .A(n48), .Y(n84) );
  INVX2 U148 ( .A(n40), .Y(n82) );
  INVX2 U149 ( .A(n32), .Y(n80) );
  INVX2 U150 ( .A(n24), .Y(n78) );
  INVX2 U151 ( .A(n18), .Y(n76) );
  INVX2 U152 ( .A(n70), .Y(n68) );
  INVX2 U153 ( .A(n62), .Y(n60) );
  INVX2 U154 ( .A(n54), .Y(n52) );
  INVX2 U155 ( .A(n46), .Y(n44) );
  INVX2 U156 ( .A(n38), .Y(n36) );
  INVX2 U157 ( .A(n30), .Y(n28) );
  INVX2 U158 ( .A(n22), .Y(n20) );
  INVX2 U159 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n9, n12, n13, n16, n19, n22, n24, n25, n31, n37, n42, n48,
         n49, n51, n52, n53, n54, n57, n58, n60, n63, n65, n66, n67, n68, n69,
         n70, n72, n73, n74, n75, n77, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n109, n111, n112, n113,
         n114, n115, n116, n120, n121, n122, n123, n124, n125, n127, n128,
         n129, n130, n133, n134, n135, n136, n137, n140, n142, n144, n145,
         n146, n147, n148, n149, n151, n154, n155, n156, n159, n160, n161,
         n162, n163, n164, n165, n166, n169, n170, n171, n172, n173, n174,
         n177, n178, n179, n181, n182, n183, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n197, n198, n199, n200, n201, n202,
         n205, n206, n207, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n248, n249, n250,
         n251, n256, n257, n258, n259, n264, n265, n266, n267, n275, n278,
         n279, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n545, n548, n551,
         n552, n554, n555, n557, n560, n563, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n727,
         n729, n731, n736, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
         n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n893, n894, n895, n896, n897, n898, n899, n900, n917, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046,
         n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206,
         n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216,
         n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226,
         n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236,
         n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246,
         n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256,
         n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266,
         n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276,
         n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286,
         n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296,
         n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306,
         n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316,
         n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326,
         n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336,
         n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  XOR2X1 U54 ( .A(n73), .B(n54), .Y(product[46]) );
  NAND2X1 U55 ( .A(n72), .B(n1036), .Y(n54) );
  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1297), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1212), .B(n1235), .Y(n74) );
  OAI21X1 U62 ( .A(n1237), .B(n1212), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1297), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1236), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1237), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1297), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1236), .Y(n96) );
  OAI21X1 U90 ( .A(n1237), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1234), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1217), .B(n278), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1217), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1217), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1297), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1236), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1238), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n278), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n278), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n278), .Y(n58) );
  NOR2X1 U119 ( .A(n308), .B(n313), .Y(n121) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  AOI21X1 U122 ( .A(n1297), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n1124), .B(n1236), .Y(n124) );
  OAI21X1 U124 ( .A(n1238), .B(n1124), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n1234), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1297), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1234), .B(n1235), .Y(n135) );
  OAI21X1 U138 ( .A(n1238), .B(n1234), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1213), .B(n1200), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1213), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1213), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  AOI21X1 U150 ( .A(n1297), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1236), .Y(n146) );
  OAI21X1 U152 ( .A(n1238), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  AOI21X1 U162 ( .A(n155), .B(n1297), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n349), .B(n340), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n164), .B(n1297), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1209), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1209), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  AOI21X1 U184 ( .A(n1297), .B(n171), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n1143), .B(n183), .C(n178), .Y(n172) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1297), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1297), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n199), .B(n187), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n189), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n996), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1006), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n194), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n1081), .B(n1119), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n996), .C(n1169), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n416), .B(n429), .Y(n205) );
  NAND2X1 U234 ( .A(n1155), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n996), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n996), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n1171), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1220), .B(n1214), .Y(n223) );
  AOI21X1 U258 ( .A(n1219), .B(n1214), .C(n1215), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1218), .B(n248), .C(n1221), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1223), .C(n1226), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1224), .C(n1228), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1229), .B(n1225), .C(n1227), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n587), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n603), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n605), .C(n637), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n621), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U335 ( .A(n591), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n1208), .B(n577), .C(n623), .YC(n347), .YS(n348) );
  FAX1 U338 ( .A(n354), .B(n352), .C(n363), .YC(n349), .YS(n350) );
  FAX1 U339 ( .A(n356), .B(n367), .C(n365), .YC(n351), .YS(n352) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n360), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U344 ( .A(n366), .B(n375), .C(n364), .YC(n361), .YS(n362) );
  FAX1 U345 ( .A(n368), .B(n379), .C(n377), .YC(n363), .YS(n364) );
  FAX1 U350 ( .A(n378), .B(n376), .C(n389), .YC(n373), .YS(n374) );
  FAX1 U355 ( .A(n1031), .B(n594), .C(n674), .YC(n383), .YS(n384) );
  FAX1 U361 ( .A(n675), .B(n659), .C(n1079), .YC(n395), .YS(n396) );
  FAX1 U363 ( .A(n579), .B(n595), .C(n643), .YC(n399), .YS(n400) );
  FAX1 U366 ( .A(n423), .B(n410), .C(n412), .YC(n405), .YS(n406) );
  FAX1 U370 ( .A(n563), .B(n580), .C(n692), .YC(n413), .YS(n414) );
  FAX1 U374 ( .A(n1076), .B(n428), .C(n437), .YC(n421), .YS(n422) );
  FAX1 U375 ( .A(n661), .B(n613), .C(n645), .YC(n423), .YS(n424) );
  FAX1 U377 ( .A(n563), .B(n581), .C(n693), .YC(n427), .YS(n428) );
  FAX1 U381 ( .A(n455), .B(n453), .C(n451), .YC(n435), .YS(n436) );
  FAX1 U383 ( .A(n678), .B(n598), .C(n614), .YC(n439), .YS(n440) );
  FAX1 U389 ( .A(n679), .B(n631), .C(n565), .YC(n451), .YS(n452) );
  FAX1 U390 ( .A(n647), .B(n695), .C(n599), .YC(n453), .YS(n454) );
  HAX1 U391 ( .A(n615), .B(n711), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U395 ( .A(n696), .B(n680), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n712), .B(n648), .C(n664), .YC(n465), .YS(n466) );
  FAX1 U400 ( .A(n999), .B(n489), .C(n480), .YC(n473), .YS(n474) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U406 ( .A(n698), .B(n499), .C(n497), .YC(n485), .YS(n486) );
  FAX1 U407 ( .A(n714), .B(n666), .C(n682), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n618), .B(n634), .C(n650), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U412 ( .A(n667), .B(n683), .C(n635), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n716), .B(n684), .C(n700), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n636), .B(n652), .C(n668), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n718), .B(n702), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n670), .C(n686), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n720), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n688), .C(n704), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n706), .C(n722), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n1211), .B(n1326), .Y(n573) );
  NOR2X1 U435 ( .A(n1211), .B(n727), .Y(n295) );
  NOR2X1 U436 ( .A(n1211), .B(n1322), .Y(n574) );
  NOR2X1 U437 ( .A(n1211), .B(n729), .Y(n305) );
  NOR2X1 U438 ( .A(n1211), .B(n1318), .Y(n575) );
  NOR2X1 U439 ( .A(n1211), .B(n731), .Y(n319) );
  NOR2X1 U440 ( .A(n1211), .B(n1314), .Y(n576) );
  NOR2X1 U441 ( .A(n1211), .B(n1312), .Y(n337) );
  NOR2X1 U442 ( .A(n1211), .B(n1310), .Y(n577) );
  NOR2X1 U443 ( .A(n1211), .B(n1308), .Y(n359) );
  NOR2X1 U444 ( .A(n1211), .B(n736), .Y(n578) );
  NOR2X1 U446 ( .A(n1211), .B(n1302), .Y(n579) );
  NOR2X1 U447 ( .A(n1211), .B(n1300), .Y(n580) );
  NOR2X1 U448 ( .A(n1211), .B(n1298), .Y(n581) );
  AND2X1 U449 ( .A(n1331), .B(n1329), .Y(n582) );
  OAI22X1 U466 ( .A(n1211), .B(n1295), .C(n1247), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n1211), .B(n1247), .C(n1294), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1294), .B(n742), .C(n1291), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1294), .B(n743), .C(n1247), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1294), .B(n744), .C(n1291), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1294), .B(n745), .C(n1247), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1294), .B(n746), .C(n1291), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1294), .B(n747), .C(n1247), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1294), .B(n748), .C(n1247), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1294), .B(n749), .C(n1291), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1295), .B(n750), .C(n1247), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n1295), .B(n751), .C(n1291), .D(n750), .Y(n594) );
  OAI22X1 U481 ( .A(n1294), .B(n753), .C(n1247), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n1294), .B(n754), .C(n1247), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1295), .B(n755), .C(n1247), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1247), .B(n755), .C(n1295), .D(n756), .Y(n599) );
  XNOR2X1 U487 ( .A(n1327), .B(n1178), .Y(n741) );
  XNOR2X1 U488 ( .A(n1325), .B(n1178), .Y(n742) );
  XNOR2X1 U489 ( .A(n1323), .B(n1329), .Y(n743) );
  XNOR2X1 U490 ( .A(n1321), .B(n1329), .Y(n744) );
  XNOR2X1 U491 ( .A(n1319), .B(n1329), .Y(n745) );
  XNOR2X1 U492 ( .A(n1317), .B(n1329), .Y(n746) );
  XNOR2X1 U493 ( .A(n1315), .B(n1329), .Y(n747) );
  XNOR2X1 U494 ( .A(n1313), .B(n1177), .Y(n748) );
  XNOR2X1 U495 ( .A(n1311), .B(n1178), .Y(n749) );
  XNOR2X1 U496 ( .A(n1309), .B(n1178), .Y(n750) );
  XNOR2X1 U497 ( .A(n1307), .B(n1176), .Y(n751) );
  XNOR2X1 U498 ( .A(n1305), .B(n1176), .Y(n752) );
  XNOR2X1 U499 ( .A(n1303), .B(n1177), .Y(n753) );
  XNOR2X1 U500 ( .A(n1301), .B(n1178), .Y(n754) );
  XNOR2X1 U501 ( .A(n1299), .B(n1177), .Y(n755) );
  XNOR2X1 U502 ( .A(n1330), .B(n1177), .Y(n756) );
  OR2X1 U503 ( .A(n1330), .B(n1211), .Y(n757) );
  OAI22X1 U505 ( .A(n1345), .B(n1290), .C(n1288), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1345), .B(n1288), .C(n1290), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1290), .B(n759), .C(n1288), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1290), .B(n760), .C(n1174), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1290), .B(n761), .C(n1174), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n1290), .B(n762), .C(n1174), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1290), .B(n763), .C(n1288), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1290), .B(n764), .C(n1174), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1241), .B(n765), .C(n1288), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n1241), .B(n766), .C(n1174), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1290), .B(n767), .C(n1174), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1290), .B(n768), .C(n1288), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1290), .B(n769), .C(n1174), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1290), .B(n770), .C(n1174), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1290), .B(n771), .C(n1288), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1290), .B(n772), .C(n1174), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1288), .B(n772), .C(n1290), .D(n773), .Y(n617) );
  AND2X1 U524 ( .A(n1331), .B(n1231), .Y(n618) );
  XNOR2X1 U526 ( .A(n1327), .B(n998), .Y(n758) );
  XNOR2X1 U527 ( .A(n1325), .B(n1248), .Y(n759) );
  XNOR2X1 U528 ( .A(n1323), .B(n998), .Y(n760) );
  XNOR2X1 U529 ( .A(n1321), .B(n998), .Y(n761) );
  XNOR2X1 U530 ( .A(n1319), .B(n1248), .Y(n762) );
  XNOR2X1 U531 ( .A(n1317), .B(n1248), .Y(n763) );
  XNOR2X1 U532 ( .A(n1315), .B(n1248), .Y(n764) );
  XNOR2X1 U533 ( .A(n1313), .B(n1248), .Y(n765) );
  XNOR2X1 U534 ( .A(n1311), .B(n998), .Y(n766) );
  XNOR2X1 U535 ( .A(n1309), .B(n998), .Y(n767) );
  XNOR2X1 U536 ( .A(n1307), .B(n998), .Y(n768) );
  XNOR2X1 U537 ( .A(n1305), .B(n1248), .Y(n769) );
  XNOR2X1 U538 ( .A(n1303), .B(n1248), .Y(n770) );
  XNOR2X1 U539 ( .A(n1301), .B(n998), .Y(n771) );
  XNOR2X1 U540 ( .A(n1299), .B(n1248), .Y(n772) );
  XNOR2X1 U541 ( .A(n1330), .B(n998), .Y(n773) );
  OR2X1 U542 ( .A(n1330), .B(n1345), .Y(n774) );
  OAI22X1 U544 ( .A(n1152), .B(n1287), .C(n995), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1152), .B(n1286), .C(n1287), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1287), .B(n776), .C(n1286), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1287), .B(n777), .C(n995), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1042), .B(n778), .C(n1286), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1287), .B(n779), .C(n995), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1287), .B(n780), .C(n1286), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1287), .B(n781), .C(n995), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1042), .B(n782), .C(n1286), .D(n781), .Y(n627) );
  OAI22X1 U555 ( .A(n1042), .B(n783), .C(n995), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1287), .B(n784), .C(n1286), .D(n783), .Y(n629) );
  OAI22X1 U557 ( .A(n1287), .B(n785), .C(n995), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1041), .B(n786), .C(n1286), .D(n785), .Y(n631) );
  OAI22X1 U561 ( .A(n1041), .B(n789), .C(n995), .D(n788), .Y(n634) );
  OAI22X1 U562 ( .A(n1286), .B(n789), .C(n1042), .D(n790), .Y(n635) );
  AND2X1 U563 ( .A(n1331), .B(n1230), .Y(n636) );
  XNOR2X1 U565 ( .A(n1327), .B(n1342), .Y(n775) );
  XNOR2X1 U566 ( .A(n1325), .B(n1342), .Y(n776) );
  XNOR2X1 U567 ( .A(n1323), .B(n1342), .Y(n777) );
  XNOR2X1 U568 ( .A(n1321), .B(n1342), .Y(n778) );
  XNOR2X1 U569 ( .A(n1319), .B(n1342), .Y(n779) );
  XNOR2X1 U570 ( .A(n1317), .B(n1342), .Y(n780) );
  XNOR2X1 U571 ( .A(n1315), .B(n1342), .Y(n781) );
  XNOR2X1 U572 ( .A(n1313), .B(n1342), .Y(n782) );
  XNOR2X1 U573 ( .A(n1311), .B(n1342), .Y(n783) );
  XNOR2X1 U574 ( .A(n1309), .B(n1342), .Y(n784) );
  XNOR2X1 U575 ( .A(n1307), .B(n1342), .Y(n785) );
  XNOR2X1 U576 ( .A(n1305), .B(n1342), .Y(n786) );
  XNOR2X1 U577 ( .A(n1303), .B(n1342), .Y(n787) );
  XNOR2X1 U578 ( .A(n1301), .B(n1342), .Y(n788) );
  XNOR2X1 U579 ( .A(n1299), .B(n1342), .Y(n789) );
  XNOR2X1 U580 ( .A(n1330), .B(n1342), .Y(n790) );
  OR2X1 U581 ( .A(n1330), .B(n1152), .Y(n791) );
  OAI22X1 U583 ( .A(n1003), .B(n1284), .C(n1000), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1004), .B(n1282), .C(n1243), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1243), .B(n793), .C(n1000), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1284), .B(n794), .C(n1000), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1243), .B(n795), .C(n1000), .D(n794), .Y(n641) );
  OAI22X1 U591 ( .A(n797), .B(n1243), .C(n1000), .D(n796), .Y(n643) );
  OAI22X1 U592 ( .A(n1284), .B(n798), .C(n1000), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1284), .B(n799), .C(n1000), .D(n798), .Y(n645) );
  OAI22X1 U594 ( .A(n1243), .B(n800), .C(n1000), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n801), .B(n1284), .C(n1000), .D(n800), .Y(n647) );
  OAI22X1 U596 ( .A(n1243), .B(n802), .C(n1282), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1284), .B(n803), .C(n1000), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1243), .B(n804), .C(n1282), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1284), .B(n805), .C(n1000), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1243), .B(n806), .C(n1000), .D(n805), .Y(n652) );
  OAI22X1 U601 ( .A(n1000), .B(n806), .C(n1284), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1331), .B(n552), .Y(n654) );
  XNOR2X1 U604 ( .A(n1327), .B(n1175), .Y(n792) );
  XNOR2X1 U605 ( .A(n1325), .B(n1175), .Y(n793) );
  XNOR2X1 U606 ( .A(n1323), .B(n1175), .Y(n794) );
  XNOR2X1 U607 ( .A(n1321), .B(n1175), .Y(n795) );
  XNOR2X1 U608 ( .A(n1319), .B(n1175), .Y(n796) );
  XNOR2X1 U609 ( .A(n1317), .B(n1175), .Y(n797) );
  XNOR2X1 U610 ( .A(n1315), .B(n1175), .Y(n798) );
  XNOR2X1 U611 ( .A(n1313), .B(n1175), .Y(n799) );
  XNOR2X1 U612 ( .A(n1311), .B(n1175), .Y(n800) );
  XNOR2X1 U613 ( .A(n1309), .B(n1175), .Y(n801) );
  XNOR2X1 U614 ( .A(n1307), .B(n1175), .Y(n802) );
  XNOR2X1 U615 ( .A(n1305), .B(n1175), .Y(n803) );
  XNOR2X1 U616 ( .A(n1303), .B(n1175), .Y(n804) );
  XNOR2X1 U617 ( .A(n1301), .B(n1175), .Y(n805) );
  XNOR2X1 U618 ( .A(n1299), .B(n1175), .Y(n806) );
  XNOR2X1 U619 ( .A(n1330), .B(n1175), .Y(n807) );
  OR2X1 U620 ( .A(n1330), .B(n1004), .Y(n808) );
  OAI22X1 U622 ( .A(n1261), .B(n1281), .C(n1278), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1261), .B(n1279), .C(n1281), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1281), .B(n810), .C(n1279), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1281), .B(n811), .C(n1278), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1281), .B(n812), .C(n1279), .D(n811), .Y(n659) );
  OAI22X1 U629 ( .A(n1281), .B(n813), .C(n1278), .D(n812), .Y(n660) );
  OAI22X1 U630 ( .A(n1281), .B(n814), .C(n1279), .D(n813), .Y(n661) );
  OAI22X1 U631 ( .A(n1281), .B(n815), .C(n1278), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1281), .B(n816), .C(n1279), .D(n815), .Y(n663) );
  OAI22X1 U633 ( .A(n1281), .B(n817), .C(n1278), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1281), .B(n818), .C(n1279), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n1281), .B(n819), .C(n1278), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1281), .B(n820), .C(n1279), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n1281), .B(n821), .C(n1278), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1281), .B(n822), .C(n1279), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1281), .B(n823), .C(n1278), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1279), .B(n823), .C(n1281), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1331), .B(n555), .Y(n672) );
  XNOR2X1 U643 ( .A(n1327), .B(n1339), .Y(n809) );
  XNOR2X1 U644 ( .A(n1325), .B(n1239), .Y(n810) );
  XNOR2X1 U645 ( .A(n1323), .B(n1239), .Y(n811) );
  XNOR2X1 U646 ( .A(n1321), .B(n1339), .Y(n812) );
  XNOR2X1 U647 ( .A(n1319), .B(n1339), .Y(n813) );
  XNOR2X1 U648 ( .A(n1317), .B(n1339), .Y(n814) );
  XNOR2X1 U649 ( .A(n1315), .B(n1339), .Y(n815) );
  XNOR2X1 U650 ( .A(n1313), .B(n1339), .Y(n816) );
  XNOR2X1 U651 ( .A(n1311), .B(n1339), .Y(n817) );
  XNOR2X1 U652 ( .A(n1309), .B(n1339), .Y(n818) );
  XNOR2X1 U653 ( .A(n1307), .B(n1339), .Y(n819) );
  XNOR2X1 U654 ( .A(n1305), .B(n1339), .Y(n820) );
  XNOR2X1 U655 ( .A(n1303), .B(n1339), .Y(n821) );
  XNOR2X1 U656 ( .A(n1301), .B(n1339), .Y(n822) );
  XNOR2X1 U657 ( .A(n1299), .B(n1339), .Y(n823) );
  XNOR2X1 U658 ( .A(n1330), .B(n1339), .Y(n824) );
  OR2X1 U659 ( .A(n1330), .B(n1261), .Y(n825) );
  OAI22X1 U661 ( .A(n1338), .B(n1276), .C(n1029), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1338), .B(n1028), .C(n1276), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1276), .B(n827), .C(n1028), .D(n826), .Y(n675) );
  OAI22X1 U667 ( .A(n1276), .B(n829), .C(n1028), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n1276), .B(n830), .C(n1028), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1276), .B(n831), .C(n1029), .D(n830), .Y(n679) );
  OAI22X1 U670 ( .A(n1276), .B(n832), .C(n1028), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1276), .B(n833), .C(n1028), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n1276), .B(n834), .C(n1029), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1276), .B(n835), .C(n1029), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1276), .B(n836), .C(n1028), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1276), .B(n837), .C(n1029), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1276), .B(n838), .C(n1029), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1276), .B(n839), .C(n1029), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1276), .B(n840), .C(n1028), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1028), .B(n840), .C(n1276), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1331), .B(n1103), .Y(n690) );
  XNOR2X1 U682 ( .A(n1327), .B(n1337), .Y(n826) );
  XNOR2X1 U683 ( .A(n1325), .B(n1337), .Y(n827) );
  XNOR2X1 U684 ( .A(n1323), .B(n1337), .Y(n828) );
  XNOR2X1 U685 ( .A(n1321), .B(n1337), .Y(n829) );
  XNOR2X1 U686 ( .A(n1319), .B(n1337), .Y(n830) );
  XNOR2X1 U687 ( .A(n1317), .B(n1337), .Y(n831) );
  XNOR2X1 U688 ( .A(n1315), .B(n1337), .Y(n832) );
  XNOR2X1 U689 ( .A(n1313), .B(n1337), .Y(n833) );
  XNOR2X1 U690 ( .A(n1311), .B(n1337), .Y(n834) );
  XNOR2X1 U691 ( .A(n1309), .B(n1337), .Y(n835) );
  XNOR2X1 U692 ( .A(n1307), .B(n1337), .Y(n836) );
  XNOR2X1 U693 ( .A(n1305), .B(n1337), .Y(n837) );
  XNOR2X1 U694 ( .A(n1303), .B(n1337), .Y(n838) );
  XNOR2X1 U695 ( .A(n1301), .B(n1337), .Y(n839) );
  XNOR2X1 U696 ( .A(n1299), .B(n1337), .Y(n840) );
  XNOR2X1 U697 ( .A(n1330), .B(n1337), .Y(n841) );
  OR2X1 U698 ( .A(n1330), .B(n1338), .Y(n842) );
  OAI22X1 U700 ( .A(n1336), .B(n1273), .C(n1271), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1336), .B(n1271), .C(n1246), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n844), .B(n1246), .C(n9), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1240), .B(n845), .C(n1271), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1240), .B(n846), .C(n1271), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1273), .B(n847), .C(n1271), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1273), .B(n848), .C(n1271), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n1273), .B(n849), .C(n1271), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1273), .B(n850), .C(n1271), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1273), .B(n851), .C(n1271), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1273), .B(n852), .C(n1271), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1273), .B(n853), .C(n1271), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1273), .B(n854), .C(n1271), .D(n853), .Y(n703) );
  OAI22X1 U715 ( .A(n1273), .B(n855), .C(n1271), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1273), .B(n856), .C(n1271), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1273), .B(n857), .C(n1271), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1271), .B(n857), .C(n1273), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1331), .B(n1270), .Y(n708) );
  XNOR2X1 U721 ( .A(n1327), .B(n1335), .Y(n843) );
  XNOR2X1 U722 ( .A(n1325), .B(n1335), .Y(n844) );
  XNOR2X1 U723 ( .A(n1323), .B(n1335), .Y(n845) );
  XNOR2X1 U724 ( .A(n1321), .B(n1334), .Y(n846) );
  XNOR2X1 U725 ( .A(n1319), .B(n1334), .Y(n847) );
  XNOR2X1 U726 ( .A(n1317), .B(n1334), .Y(n848) );
  XNOR2X1 U727 ( .A(n1315), .B(n1334), .Y(n849) );
  XNOR2X1 U728 ( .A(n1313), .B(n1334), .Y(n850) );
  XNOR2X1 U729 ( .A(n1311), .B(n1334), .Y(n851) );
  XNOR2X1 U730 ( .A(n1309), .B(n1334), .Y(n852) );
  XNOR2X1 U731 ( .A(n1307), .B(n1334), .Y(n853) );
  XNOR2X1 U732 ( .A(n1305), .B(n1334), .Y(n854) );
  XNOR2X1 U733 ( .A(n1303), .B(n1334), .Y(n855) );
  XNOR2X1 U734 ( .A(n1301), .B(n1334), .Y(n856) );
  XNOR2X1 U735 ( .A(n1299), .B(n1334), .Y(n857) );
  XNOR2X1 U736 ( .A(n1330), .B(n1334), .Y(n858) );
  OR2X1 U737 ( .A(n1330), .B(n1336), .Y(n859) );
  OAI22X1 U739 ( .A(n1333), .B(n1245), .C(n917), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n1333), .C(n1245), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1245), .B(n861), .C(n917), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1245), .B(n862), .C(n917), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1245), .B(n863), .C(n917), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1245), .B(n864), .C(n917), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1245), .B(n865), .C(n917), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1245), .B(n866), .C(n917), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1245), .B(n867), .C(n917), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1245), .B(n868), .C(n917), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1245), .B(n869), .C(n917), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1245), .B(n870), .C(n917), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1245), .B(n871), .C(n917), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1245), .B(n872), .C(n917), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1245), .B(n873), .C(n917), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1245), .B(n874), .C(n917), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1245), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n1327), .B(n1172), .Y(n860) );
  XNOR2X1 U759 ( .A(n1325), .B(n1172), .Y(n861) );
  XNOR2X1 U760 ( .A(n1323), .B(n1), .Y(n862) );
  XNOR2X1 U761 ( .A(n1321), .B(n1172), .Y(n863) );
  XNOR2X1 U762 ( .A(n1319), .B(n1172), .Y(n864) );
  XNOR2X1 U763 ( .A(n1317), .B(n1172), .Y(n865) );
  XNOR2X1 U764 ( .A(n1315), .B(n1172), .Y(n866) );
  XNOR2X1 U765 ( .A(n1313), .B(n1173), .Y(n867) );
  XNOR2X1 U766 ( .A(n1311), .B(n1173), .Y(n868) );
  XNOR2X1 U767 ( .A(n1309), .B(n1173), .Y(n869) );
  XNOR2X1 U768 ( .A(n1307), .B(n1173), .Y(n870) );
  XNOR2X1 U769 ( .A(n1305), .B(n1173), .Y(n871) );
  XNOR2X1 U770 ( .A(n1303), .B(n1173), .Y(n872) );
  XNOR2X1 U771 ( .A(n1301), .B(n1173), .Y(n873) );
  XNOR2X1 U772 ( .A(n1299), .B(n1173), .Y(n874) );
  XNOR2X1 U773 ( .A(n1330), .B(n1173), .Y(n875) );
  OR2X1 U774 ( .A(n1330), .B(n1333), .Y(n876) );
  NAND2X1 U801 ( .A(n1292), .B(n893), .Y(n48) );
  XOR2X1 U802 ( .A(n1329), .B(a[29]), .Y(n893) );
  NAND2X1 U804 ( .A(n894), .B(n1168), .Y(n42) );
  XOR2X1 U805 ( .A(n1249), .B(a[27]), .Y(n894) );
  XOR2X1 U808 ( .A(n1342), .B(a[25]), .Y(n895) );
  NAND2X1 U813 ( .A(n897), .B(n1279), .Y(n24) );
  XOR2X1 U814 ( .A(n19), .B(a[21]), .Y(n897) );
  XNOR2X1 U815 ( .A(n13), .B(a[21]), .Y(n22) );
  XOR2X1 U817 ( .A(n13), .B(a[19]), .Y(n898) );
  NAND2X1 U819 ( .A(n9), .B(n899), .Y(n12) );
  XOR2X1 U820 ( .A(n1335), .B(a[17]), .Y(n899) );
  XNOR2X1 U821 ( .A(n1), .B(a[17]), .Y(n9) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  XOR2X1 U823 ( .A(n1), .B(a[15]), .Y(n900) );
  BUFX2 U828 ( .A(n1285), .Y(n995) );
  BUFX2 U829 ( .A(n212), .Y(n996) );
  INVX8 U830 ( .A(n1318), .Y(n1319) );
  INVX8 U831 ( .A(n1304), .Y(n1305) );
  INVX8 U832 ( .A(n1322), .Y(n1323) );
  INVX2 U833 ( .A(n1344), .Y(n997) );
  INVX8 U834 ( .A(n997), .Y(n998) );
  INVX1 U835 ( .A(n1345), .Y(n1344) );
  BUFX2 U836 ( .A(n487), .Y(n999) );
  INVX8 U837 ( .A(n1312), .Y(n1313) );
  BUFX4 U838 ( .A(n1242), .Y(n1000) );
  INVX1 U839 ( .A(n1233), .Y(n1242) );
  BUFX4 U840 ( .A(n1052), .Y(n1243) );
  INVX8 U841 ( .A(n1310), .Y(n1311) );
  INVX8 U842 ( .A(n1332), .Y(n1330) );
  INVX4 U843 ( .A(n1341), .Y(n1001) );
  INVX2 U844 ( .A(n1001), .Y(n1002) );
  INVX4 U845 ( .A(n1001), .Y(n1003) );
  INVX1 U846 ( .A(n1001), .Y(n1004) );
  INVX8 U847 ( .A(n1314), .Y(n1315) );
  INVX4 U848 ( .A(n883), .Y(n1314) );
  INVX8 U849 ( .A(n1308), .Y(n1309) );
  INVX4 U850 ( .A(n886), .Y(n1308) );
  INVX8 U851 ( .A(n1306), .Y(n1307) );
  INVX4 U852 ( .A(n887), .Y(n1306) );
  INVX4 U853 ( .A(n13), .Y(n1338) );
  INVX8 U854 ( .A(n1338), .Y(n1337) );
  INVX8 U855 ( .A(n1328), .Y(n1329) );
  INVX8 U856 ( .A(n541), .Y(n1328) );
  INVX2 U857 ( .A(n882), .Y(n1316) );
  INVX2 U858 ( .A(n24), .Y(n1280) );
  BUFX2 U859 ( .A(n1), .Y(n1173) );
  INVX2 U860 ( .A(n16), .Y(n1274) );
  INVX4 U861 ( .A(n31), .Y(n1343) );
  INVX4 U862 ( .A(n1336), .Y(n1335) );
  INVX2 U863 ( .A(n1075), .Y(n1076) );
  BUFX2 U864 ( .A(n1210), .Y(n1177) );
  BUFX2 U865 ( .A(n1), .Y(n1172) );
  INVX2 U866 ( .A(n1258), .Y(n595) );
  INVX2 U867 ( .A(n25), .Y(n1341) );
  INVX4 U868 ( .A(n1320), .Y(n1321) );
  INVX4 U869 ( .A(n1289), .Y(n1290) );
  INVX4 U870 ( .A(n1326), .Y(n1327) );
  INVX2 U871 ( .A(n878), .Y(n1324) );
  BUFX2 U872 ( .A(n137), .Y(n1234) );
  BUFX2 U873 ( .A(n53), .Y(n1236) );
  BUFX2 U874 ( .A(n52), .Y(n1238) );
  BUFX2 U875 ( .A(n630), .Y(n1005) );
  INVX2 U876 ( .A(n287), .Y(n1006) );
  XOR2X1 U877 ( .A(n426), .B(n439), .Y(n1007) );
  XOR2X1 U878 ( .A(n1179), .B(n1007), .Y(n420) );
  NAND2X1 U879 ( .A(n1179), .B(n426), .Y(n1008) );
  NAND2X1 U880 ( .A(n1179), .B(n439), .Y(n1009) );
  NAND2X1 U881 ( .A(n426), .B(n439), .Y(n1010) );
  NAND3X1 U882 ( .A(n1009), .B(n1008), .C(n1010), .Y(n419) );
  BUFX2 U883 ( .A(n424), .Y(n1179) );
  XOR2X1 U884 ( .A(n459), .B(n448), .Y(n1011) );
  XOR2X1 U885 ( .A(n446), .B(n1011), .Y(n444) );
  NAND2X1 U886 ( .A(n446), .B(n459), .Y(n1012) );
  NAND2X1 U887 ( .A(n446), .B(n448), .Y(n1013) );
  NAND2X1 U888 ( .A(n459), .B(n448), .Y(n1014) );
  NAND3X1 U889 ( .A(n1013), .B(n1012), .C(n1014), .Y(n443) );
  XOR2X1 U890 ( .A(n582), .B(n694), .Y(n1015) );
  XOR2X1 U891 ( .A(n710), .B(n1015), .Y(n442) );
  NAND2X1 U892 ( .A(n710), .B(n582), .Y(n1016) );
  NAND2X1 U893 ( .A(n710), .B(n694), .Y(n1017) );
  NAND2X1 U894 ( .A(n582), .B(n694), .Y(n1018) );
  NAND3X1 U895 ( .A(n1017), .B(n1016), .C(n1018), .Y(n441) );
  XOR2X1 U896 ( .A(n490), .B(n488), .Y(n1019) );
  XOR2X1 U897 ( .A(n495), .B(n1019), .Y(n484) );
  NAND2X1 U898 ( .A(n495), .B(n490), .Y(n1020) );
  NAND2X1 U899 ( .A(n495), .B(n488), .Y(n1021) );
  NAND2X1 U900 ( .A(n490), .B(n488), .Y(n1022) );
  NAND3X1 U901 ( .A(n1021), .B(n1020), .C(n1022), .Y(n483) );
  XOR2X1 U902 ( .A(n465), .B(n454), .Y(n1023) );
  XOR2X1 U903 ( .A(n1078), .B(n1023), .Y(n448) );
  NAND2X1 U904 ( .A(n1078), .B(n465), .Y(n1024) );
  NAND2X1 U905 ( .A(n1078), .B(n454), .Y(n1025) );
  NAND2X1 U906 ( .A(n465), .B(n454), .Y(n1026) );
  NAND3X1 U907 ( .A(n1025), .B(n1024), .C(n1026), .Y(n447) );
  INVX2 U908 ( .A(n1077), .Y(n1078) );
  INVX2 U909 ( .A(n49), .Y(n1332) );
  INVX1 U910 ( .A(n891), .Y(n1298) );
  BUFX2 U911 ( .A(n1275), .Y(n1027) );
  BUFX2 U912 ( .A(n1275), .Y(n1028) );
  BUFX2 U913 ( .A(n1275), .Y(n1029) );
  INVX4 U914 ( .A(n1274), .Y(n1275) );
  AND2X2 U915 ( .A(n898), .B(n1027), .Y(n1030) );
  OR2X1 U916 ( .A(n1211), .B(n1304), .Y(n1031) );
  AND2X2 U917 ( .A(n896), .B(n1283), .Y(n1032) );
  INVX2 U918 ( .A(n1), .Y(n1333) );
  INVX1 U919 ( .A(n1230), .Y(n1285) );
  INVX2 U920 ( .A(n6), .Y(n1269) );
  INVX4 U921 ( .A(n1269), .Y(n1245) );
  INVX2 U922 ( .A(n563), .Y(n1079) );
  AND2X2 U923 ( .A(n149), .B(n1200), .Y(n1033) );
  AND2X2 U924 ( .A(n162), .B(n282), .Y(n1034) );
  AND2X2 U925 ( .A(n178), .B(n284), .Y(n1035) );
  INVX4 U926 ( .A(n1300), .Y(n1301) );
  INVX2 U927 ( .A(n879), .Y(n1322) );
  INVX2 U928 ( .A(n884), .Y(n1312) );
  INVX4 U929 ( .A(n1298), .Y(n1299) );
  OR2X2 U930 ( .A(n292), .B(n293), .Y(n1036) );
  XOR2X1 U931 ( .A(n464), .B(n468), .Y(n1037) );
  XOR2X1 U932 ( .A(n473), .B(n1037), .Y(n460) );
  NAND2X1 U933 ( .A(n473), .B(n464), .Y(n1038) );
  NAND2X1 U934 ( .A(n473), .B(n468), .Y(n1039) );
  NAND2X1 U935 ( .A(n464), .B(n468), .Y(n1040) );
  NAND3X1 U936 ( .A(n1039), .B(n1038), .C(n1040), .Y(n459) );
  NAND2X1 U937 ( .A(n895), .B(n1286), .Y(n1041) );
  NAND2X1 U938 ( .A(n895), .B(n1286), .Y(n1042) );
  OR2X2 U939 ( .A(n1041), .B(n787), .Y(n1112) );
  OR2X2 U940 ( .A(n1042), .B(n788), .Y(n1061) );
  INVX1 U941 ( .A(n1247), .Y(n543) );
  INVX2 U942 ( .A(n9), .Y(n1270) );
  INVX2 U943 ( .A(n1232), .Y(n1247) );
  INVX2 U944 ( .A(n889), .Y(n1302) );
  XNOR2X1 U945 ( .A(n1002), .B(a[23]), .Y(n896) );
  INVX1 U946 ( .A(n1325), .Y(n727) );
  XNOR2X1 U947 ( .A(n1043), .B(n461), .Y(n446) );
  XNOR2X1 U948 ( .A(n463), .B(n450), .Y(n1043) );
  XOR2X1 U949 ( .A(n609), .B(n593), .Y(n1044) );
  XOR2X1 U950 ( .A(n1044), .B(n673), .Y(n370) );
  XOR2X1 U951 ( .A(n383), .B(n381), .Y(n1045) );
  XOR2X1 U952 ( .A(n1045), .B(n370), .Y(n366) );
  NAND2X1 U953 ( .A(n609), .B(n593), .Y(n1046) );
  NAND2X1 U954 ( .A(n609), .B(n673), .Y(n1047) );
  NAND2X1 U955 ( .A(n593), .B(n673), .Y(n1048) );
  NAND3X1 U956 ( .A(n1046), .B(n1047), .C(n1048), .Y(n369) );
  NAND2X1 U957 ( .A(n383), .B(n381), .Y(n1049) );
  NAND2X1 U958 ( .A(n383), .B(n370), .Y(n1050) );
  NAND2X1 U959 ( .A(n381), .B(n370), .Y(n1051) );
  NAND3X1 U960 ( .A(n1049), .B(n1050), .C(n1051), .Y(n365) );
  NAND2X1 U961 ( .A(n896), .B(n1283), .Y(n1052) );
  AND2X1 U962 ( .A(n895), .B(n1286), .Y(n1053) );
  INVX4 U963 ( .A(n1293), .Y(n1295) );
  INVX1 U964 ( .A(n1233), .Y(n1282) );
  INVX1 U965 ( .A(n1233), .Y(n1283) );
  XOR2X1 U966 ( .A(n477), .B(n475), .Y(n1054) );
  XOR2X1 U967 ( .A(n1054), .B(n466), .Y(n462) );
  NAND2X1 U968 ( .A(n477), .B(n475), .Y(n1055) );
  NAND2X1 U969 ( .A(n477), .B(n466), .Y(n1056) );
  NAND2X1 U970 ( .A(n475), .B(n466), .Y(n1057) );
  NAND3X1 U971 ( .A(n1055), .B(n1056), .C(n1057), .Y(n461) );
  NAND2X1 U972 ( .A(n463), .B(n450), .Y(n1058) );
  NAND2X1 U973 ( .A(n463), .B(n461), .Y(n1059) );
  NAND2X1 U974 ( .A(n450), .B(n461), .Y(n1060) );
  NAND3X1 U975 ( .A(n1058), .B(n1059), .C(n1060), .Y(n445) );
  OR2X2 U976 ( .A(n1286), .B(n787), .Y(n1062) );
  NAND2X1 U977 ( .A(n1061), .B(n1062), .Y(n633) );
  XOR2X1 U978 ( .A(n658), .B(n610), .Y(n1063) );
  XOR2X1 U979 ( .A(n1063), .B(n1244), .Y(n382) );
  XOR2X1 U980 ( .A(n395), .B(n384), .Y(n1064) );
  XOR2X1 U981 ( .A(n1064), .B(n382), .Y(n378) );
  NAND2X1 U982 ( .A(n658), .B(n610), .Y(n1065) );
  NAND2X1 U983 ( .A(n658), .B(n1244), .Y(n1066) );
  NAND2X1 U984 ( .A(n610), .B(n1244), .Y(n1067) );
  NAND3X1 U985 ( .A(n1065), .B(n1066), .C(n1067), .Y(n381) );
  NAND2X1 U986 ( .A(n395), .B(n384), .Y(n1068) );
  NAND2X1 U987 ( .A(n395), .B(n382), .Y(n1069) );
  NAND2X1 U988 ( .A(n384), .B(n382), .Y(n1070) );
  NAND3X1 U989 ( .A(n1068), .B(n1069), .C(n1070), .Y(n377) );
  XOR2X1 U990 ( .A(n611), .B(n691), .Y(n1071) );
  XOR2X1 U991 ( .A(n627), .B(n1071), .Y(n398) );
  NAND2X1 U992 ( .A(n627), .B(n611), .Y(n1072) );
  NAND2X1 U993 ( .A(n627), .B(n691), .Y(n1073) );
  NAND2X1 U994 ( .A(n611), .B(n691), .Y(n1074) );
  NAND3X1 U995 ( .A(n1073), .B(n1072), .C(n1074), .Y(n397) );
  INVX2 U996 ( .A(n441), .Y(n1075) );
  INVX2 U997 ( .A(n452), .Y(n1077) );
  INVX1 U998 ( .A(n415), .Y(n1080) );
  INVX1 U999 ( .A(n1080), .Y(n1081) );
  INVX4 U1000 ( .A(n1293), .Y(n1294) );
  XOR2X1 U1001 ( .A(n476), .B(n478), .Y(n1082) );
  XOR2X1 U1002 ( .A(n1082), .B(n485), .Y(n472) );
  XOR2X1 U1003 ( .A(n474), .B(n483), .Y(n1083) );
  XOR2X1 U1004 ( .A(n1083), .B(n472), .Y(n470) );
  NAND2X1 U1005 ( .A(n476), .B(n478), .Y(n1084) );
  NAND2X1 U1006 ( .A(n476), .B(n485), .Y(n1085) );
  NAND2X1 U1007 ( .A(n478), .B(n485), .Y(n1086) );
  NAND3X1 U1008 ( .A(n1084), .B(n1085), .C(n1086), .Y(n471) );
  NAND2X1 U1009 ( .A(n474), .B(n483), .Y(n1087) );
  NAND2X1 U1010 ( .A(n474), .B(n472), .Y(n1088) );
  NAND2X1 U1011 ( .A(n483), .B(n472), .Y(n1089) );
  NAND3X1 U1012 ( .A(n1087), .B(n1088), .C(n1089), .Y(n469) );
  XOR2X1 U1013 ( .A(n408), .B(n421), .Y(n1090) );
  XOR2X1 U1014 ( .A(n419), .B(n1090), .Y(n404) );
  NAND2X1 U1015 ( .A(n419), .B(n408), .Y(n1091) );
  NAND2X1 U1016 ( .A(n419), .B(n421), .Y(n1092) );
  NAND2X1 U1017 ( .A(n408), .B(n421), .Y(n1093) );
  NAND3X1 U1018 ( .A(n1092), .B(n1091), .C(n1093), .Y(n403) );
  XNOR2X1 U1019 ( .A(n1094), .B(n390), .Y(n388) );
  XNOR2X1 U1020 ( .A(n392), .B(n403), .Y(n1094) );
  XOR2X1 U1021 ( .A(n371), .B(n369), .Y(n1095) );
  XOR2X1 U1022 ( .A(n1095), .B(n358), .Y(n354) );
  NAND2X1 U1023 ( .A(n371), .B(n369), .Y(n1096) );
  NAND2X1 U1024 ( .A(n371), .B(n358), .Y(n1097) );
  NAND2X1 U1025 ( .A(n369), .B(n358), .Y(n1098) );
  NAND3X1 U1026 ( .A(n1096), .B(n1097), .C(n1098), .Y(n353) );
  XOR2X1 U1027 ( .A(n355), .B(n346), .Y(n1099) );
  XOR2X1 U1028 ( .A(n1099), .B(n353), .Y(n342) );
  NAND2X1 U1029 ( .A(n355), .B(n346), .Y(n1100) );
  NAND2X1 U1030 ( .A(n355), .B(n353), .Y(n1101) );
  NAND2X1 U1031 ( .A(n346), .B(n353), .Y(n1102) );
  NAND3X1 U1032 ( .A(n1100), .B(n1101), .C(n1102), .Y(n341) );
  BUFX2 U1033 ( .A(n1274), .Y(n1103) );
  XOR2X1 U1034 ( .A(n600), .B(n616), .Y(n1104) );
  XOR2X1 U1035 ( .A(n1104), .B(n632), .Y(n468) );
  NAND2X1 U1036 ( .A(n600), .B(n616), .Y(n1105) );
  NAND2X1 U1037 ( .A(n600), .B(n632), .Y(n1106) );
  NAND2X1 U1038 ( .A(n616), .B(n632), .Y(n1107) );
  NAND3X1 U1039 ( .A(n1105), .B(n1106), .C(n1107), .Y(n467) );
  XOR2X1 U1040 ( .A(n456), .B(n663), .Y(n1108) );
  XOR2X1 U1041 ( .A(n1108), .B(n467), .Y(n450) );
  NAND2X1 U1042 ( .A(n663), .B(n456), .Y(n1109) );
  NAND2X1 U1043 ( .A(n663), .B(n467), .Y(n1110) );
  NAND2X1 U1044 ( .A(n456), .B(n467), .Y(n1111) );
  NAND3X1 U1045 ( .A(n1109), .B(n1110), .C(n1111), .Y(n449) );
  OR2X1 U1046 ( .A(n995), .B(n786), .Y(n1113) );
  NAND2X1 U1047 ( .A(n1112), .B(n1113), .Y(n632) );
  XOR2X1 U1048 ( .A(n431), .B(n420), .Y(n1114) );
  XOR2X1 U1049 ( .A(n418), .B(n1114), .Y(n416) );
  NAND2X1 U1050 ( .A(n418), .B(n431), .Y(n1115) );
  NAND2X1 U1051 ( .A(n418), .B(n420), .Y(n1116) );
  NAND2X1 U1052 ( .A(n431), .B(n420), .Y(n1117) );
  NAND3X1 U1053 ( .A(n1117), .B(n1115), .C(n1116), .Y(n415) );
  INVX1 U1054 ( .A(n402), .Y(n1118) );
  INVX1 U1055 ( .A(n1118), .Y(n1119) );
  XOR2X1 U1056 ( .A(n662), .B(n646), .Y(n1120) );
  XOR2X1 U1057 ( .A(n1005), .B(n1120), .Y(n438) );
  NAND2X1 U1058 ( .A(n630), .B(n662), .Y(n1121) );
  NAND2X1 U1059 ( .A(n630), .B(n646), .Y(n1122) );
  NAND2X1 U1060 ( .A(n662), .B(n646), .Y(n1123) );
  NAND3X1 U1061 ( .A(n1122), .B(n1121), .C(n1123), .Y(n437) );
  OR2X2 U1062 ( .A(n130), .B(n1234), .Y(n1124) );
  XOR2X1 U1063 ( .A(n622), .B(n606), .Y(n1125) );
  XOR2X1 U1064 ( .A(n1125), .B(n347), .Y(n334) );
  XOR2X1 U1065 ( .A(n345), .B(n336), .Y(n1126) );
  XOR2X1 U1066 ( .A(n1126), .B(n334), .Y(n332) );
  NAND2X1 U1067 ( .A(n622), .B(n606), .Y(n1127) );
  NAND2X1 U1068 ( .A(n622), .B(n347), .Y(n1128) );
  NAND2X1 U1069 ( .A(n606), .B(n347), .Y(n1129) );
  NAND3X1 U1070 ( .A(n1127), .B(n1128), .C(n1129), .Y(n333) );
  NAND2X1 U1071 ( .A(n345), .B(n336), .Y(n1130) );
  NAND2X1 U1072 ( .A(n345), .B(n334), .Y(n1131) );
  NAND2X1 U1073 ( .A(n336), .B(n334), .Y(n1132) );
  NAND3X1 U1074 ( .A(n1130), .B(n1131), .C(n1132), .Y(n331) );
  INVX1 U1075 ( .A(n12), .Y(n1272) );
  BUFX2 U1076 ( .A(n12), .Y(n1240) );
  AND2X2 U1077 ( .A(n1331), .B(n543), .Y(n600) );
  XOR2X1 U1078 ( .A(n407), .B(n394), .Y(n1133) );
  XOR2X1 U1079 ( .A(n1133), .B(n405), .Y(n390) );
  NAND2X1 U1080 ( .A(n407), .B(n394), .Y(n1134) );
  NAND2X1 U1081 ( .A(n407), .B(n405), .Y(n1135) );
  NAND2X1 U1082 ( .A(n394), .B(n405), .Y(n1136) );
  NAND3X1 U1083 ( .A(n1134), .B(n1135), .C(n1136), .Y(n389) );
  NAND2X1 U1084 ( .A(n392), .B(n403), .Y(n1137) );
  NAND2X1 U1085 ( .A(n392), .B(n390), .Y(n1138) );
  NAND2X1 U1086 ( .A(n403), .B(n390), .Y(n1139) );
  NAND3X1 U1087 ( .A(n1137), .B(n1138), .C(n1139), .Y(n387) );
  NAND2X1 U1088 ( .A(n1207), .B(n1206), .Y(n1140) );
  NAND2X1 U1089 ( .A(n1207), .B(n1206), .Y(n1141) );
  OR2X2 U1090 ( .A(n1276), .B(n828), .Y(n1206) );
  XNOR2X1 U1091 ( .A(n95), .B(n1142), .Y(product[44]) );
  AND2X2 U1092 ( .A(n94), .B(n91), .Y(n1142) );
  NOR2X1 U1093 ( .A(n373), .B(n362), .Y(n1143) );
  XOR2X1 U1094 ( .A(n397), .B(n626), .Y(n1144) );
  XOR2X1 U1095 ( .A(n399), .B(n1144), .Y(n380) );
  NAND2X1 U1096 ( .A(n399), .B(n397), .Y(n1145) );
  NAND2X1 U1097 ( .A(n399), .B(n626), .Y(n1146) );
  NAND2X1 U1098 ( .A(n397), .B(n626), .Y(n1147) );
  NAND3X1 U1099 ( .A(n1146), .B(n1145), .C(n1147), .Y(n379) );
  XOR2X1 U1100 ( .A(n417), .B(n406), .Y(n1148) );
  XOR2X1 U1101 ( .A(n404), .B(n1148), .Y(n402) );
  NAND2X1 U1102 ( .A(n404), .B(n417), .Y(n1149) );
  NAND2X1 U1103 ( .A(n404), .B(n406), .Y(n1150) );
  NAND2X1 U1104 ( .A(n417), .B(n406), .Y(n1151) );
  NAND3X1 U1105 ( .A(n1150), .B(n1149), .C(n1151), .Y(n401) );
  INVX1 U1106 ( .A(n1278), .Y(n555) );
  INVX1 U1107 ( .A(n1232), .Y(n1291) );
  INVX1 U1108 ( .A(n1342), .Y(n1152) );
  INVX1 U1109 ( .A(n100), .Y(n98) );
  XNOR2X1 U1110 ( .A(n134), .B(n1153), .Y(product[41]) );
  AND2X2 U1111 ( .A(n133), .B(n279), .Y(n1153) );
  INVX1 U1112 ( .A(n429), .Y(n1154) );
  INVX1 U1113 ( .A(n1154), .Y(n1155) );
  INVX4 U1114 ( .A(n1270), .Y(n1271) );
  XOR2X1 U1115 ( .A(n440), .B(n442), .Y(n1156) );
  XOR2X1 U1116 ( .A(n438), .B(n1156), .Y(n434) );
  NAND2X1 U1117 ( .A(n438), .B(n440), .Y(n1157) );
  NAND2X1 U1118 ( .A(n438), .B(n442), .Y(n1158) );
  NAND2X1 U1119 ( .A(n440), .B(n442), .Y(n1159) );
  NAND3X1 U1120 ( .A(n1158), .B(n1157), .C(n1159), .Y(n433) );
  XOR2X1 U1121 ( .A(n445), .B(n434), .Y(n1160) );
  XOR2X1 U1122 ( .A(n1160), .B(n432), .Y(n430) );
  NAND2X1 U1123 ( .A(n445), .B(n432), .Y(n1161) );
  NAND2X1 U1124 ( .A(n432), .B(n434), .Y(n1162) );
  NAND2X1 U1125 ( .A(n445), .B(n434), .Y(n1163) );
  NAND3X1 U1126 ( .A(n1162), .B(n1163), .C(n1161), .Y(n429) );
  XOR2X1 U1127 ( .A(n447), .B(n449), .Y(n1164) );
  XOR2X1 U1128 ( .A(n436), .B(n1164), .Y(n432) );
  NAND2X1 U1129 ( .A(n436), .B(n447), .Y(n1165) );
  NAND2X1 U1130 ( .A(n436), .B(n449), .Y(n1166) );
  NAND2X1 U1131 ( .A(n447), .B(n449), .Y(n1167) );
  NAND3X1 U1132 ( .A(n1166), .B(n1165), .C(n1167), .Y(n431) );
  XOR2X1 U1133 ( .A(n1343), .B(a[27]), .Y(n1168) );
  INVX1 U1134 ( .A(n1168), .Y(n1231) );
  BUFX2 U1135 ( .A(n200), .Y(n1169) );
  XNOR2X1 U1136 ( .A(n179), .B(n1035), .Y(product[36]) );
  XNOR2X1 U1137 ( .A(n154), .B(n1033), .Y(product[39]) );
  XNOR2X1 U1138 ( .A(n163), .B(n1034), .Y(product[38]) );
  INVX1 U1139 ( .A(n444), .Y(n1170) );
  INVX1 U1140 ( .A(n1170), .Y(n1171) );
  BUFX2 U1141 ( .A(n1168), .Y(n1174) );
  INVX8 U1142 ( .A(n1003), .Y(n1175) );
  BUFX2 U1143 ( .A(n1210), .Y(n1176) );
  BUFX4 U1144 ( .A(n1210), .Y(n1178) );
  XOR2X1 U1145 ( .A(n629), .B(n677), .Y(n1180) );
  XOR2X1 U1146 ( .A(n1180), .B(n597), .Y(n426) );
  NAND2X1 U1147 ( .A(n597), .B(n629), .Y(n1181) );
  NAND2X1 U1148 ( .A(n597), .B(n677), .Y(n1182) );
  NAND2X1 U1149 ( .A(n629), .B(n677), .Y(n1183) );
  NAND3X1 U1150 ( .A(n1182), .B(n1181), .C(n1183), .Y(n425) );
  XOR2X1 U1151 ( .A(n425), .B(n427), .Y(n1184) );
  XOR2X1 U1152 ( .A(n414), .B(n1184), .Y(n408) );
  NAND2X1 U1153 ( .A(n414), .B(n425), .Y(n1185) );
  NAND2X1 U1154 ( .A(n414), .B(n427), .Y(n1186) );
  NAND2X1 U1155 ( .A(n425), .B(n427), .Y(n1187) );
  NAND3X1 U1156 ( .A(n1186), .B(n1185), .C(n1187), .Y(n407) );
  XOR2X1 U1157 ( .A(n660), .B(n644), .Y(n1188) );
  XOR2X1 U1158 ( .A(n1188), .B(n612), .Y(n410) );
  NAND2X1 U1159 ( .A(n660), .B(n644), .Y(n1189) );
  NAND2X1 U1160 ( .A(n660), .B(n612), .Y(n1190) );
  NAND2X1 U1161 ( .A(n644), .B(n612), .Y(n1191) );
  NAND3X1 U1162 ( .A(n1189), .B(n1190), .C(n1191), .Y(n409) );
  XOR2X1 U1163 ( .A(n413), .B(n411), .Y(n1192) );
  XOR2X1 U1164 ( .A(n1192), .B(n409), .Y(n394) );
  NAND2X1 U1165 ( .A(n413), .B(n411), .Y(n1193) );
  NAND2X1 U1166 ( .A(n413), .B(n409), .Y(n1194) );
  NAND2X1 U1167 ( .A(n411), .B(n409), .Y(n1195) );
  NAND3X1 U1168 ( .A(n1193), .B(n1194), .C(n1195), .Y(n393) );
  XOR2X1 U1169 ( .A(n433), .B(n435), .Y(n1196) );
  XOR2X1 U1170 ( .A(n422), .B(n1196), .Y(n418) );
  NAND2X1 U1171 ( .A(n422), .B(n433), .Y(n1197) );
  NAND2X1 U1172 ( .A(n435), .B(n422), .Y(n1198) );
  NAND2X1 U1173 ( .A(n433), .B(n435), .Y(n1199) );
  NAND3X1 U1174 ( .A(n1198), .B(n1197), .C(n1199), .Y(n417) );
  OR2X2 U1175 ( .A(n339), .B(n330), .Y(n1200) );
  INVX1 U1176 ( .A(n1200), .Y(n148) );
  INVX2 U1177 ( .A(n1332), .Y(n1331) );
  NOR2X1 U1178 ( .A(n1211), .B(n1304), .Y(n1201) );
  BUFX2 U1179 ( .A(n359), .Y(n1208) );
  INVX1 U1180 ( .A(n1345), .Y(n1249) );
  XOR2X1 U1181 ( .A(n596), .B(n628), .Y(n1202) );
  XOR2X1 U1182 ( .A(n1141), .B(n1202), .Y(n412) );
  NAND2X1 U1183 ( .A(n1140), .B(n596), .Y(n1203) );
  NAND2X1 U1184 ( .A(n676), .B(n628), .Y(n1204) );
  NAND2X1 U1185 ( .A(n596), .B(n628), .Y(n1205) );
  NAND3X1 U1186 ( .A(n1204), .B(n1203), .C(n1205), .Y(n411) );
  OR2X1 U1187 ( .A(n1029), .B(n827), .Y(n1207) );
  NAND2X1 U1188 ( .A(n1207), .B(n1206), .Y(n676) );
  BUFX2 U1189 ( .A(n541), .Y(n1210) );
  INVX2 U1190 ( .A(n283), .Y(n1209) );
  BUFX4 U1191 ( .A(n1328), .Y(n1211) );
  OR2X2 U1192 ( .A(n481), .B(n470), .Y(n1214) );
  OR2X2 U1193 ( .A(n1234), .B(n80), .Y(n1212) );
  INVX4 U1194 ( .A(n1230), .Y(n1286) );
  OR2X2 U1195 ( .A(n322), .B(n329), .Y(n1213) );
  AND2X1 U1196 ( .A(n572), .B(n725), .Y(n1229) );
  INVX4 U1197 ( .A(n37), .Y(n1345) );
  OR2X2 U1198 ( .A(n302), .B(n307), .Y(n1217) );
  INVX2 U1199 ( .A(n880), .Y(n1320) );
  INVX2 U1200 ( .A(n885), .Y(n1310) );
  INVX2 U1201 ( .A(n877), .Y(n1326) );
  AND2X2 U1202 ( .A(n481), .B(n470), .Y(n1215) );
  XOR2X1 U1203 ( .A(n86), .B(n1216), .Y(product[45]) );
  NAND2X1 U1204 ( .A(n85), .B(n275), .Y(n1216) );
  OR2X1 U1205 ( .A(n523), .B(n518), .Y(n1218) );
  AND2X2 U1206 ( .A(n491), .B(n482), .Y(n1219) );
  OR2X1 U1207 ( .A(n491), .B(n482), .Y(n1220) );
  AND2X2 U1208 ( .A(n523), .B(n518), .Y(n1221) );
  INVX2 U1209 ( .A(n554), .Y(n655) );
  XNOR2X1 U1210 ( .A(n1222), .B(n641), .Y(n372) );
  XNOR2X1 U1211 ( .A(n1201), .B(n578), .Y(n1222) );
  INVX2 U1212 ( .A(n560), .Y(n691) );
  INVX2 U1213 ( .A(n551), .Y(n637) );
  INVX2 U1214 ( .A(n557), .Y(n673) );
  OR2X1 U1215 ( .A(n533), .B(n530), .Y(n1223) );
  OR2X1 U1216 ( .A(n539), .B(n538), .Y(n1224) );
  OR2X1 U1217 ( .A(n708), .B(n724), .Y(n1225) );
  AND2X2 U1218 ( .A(n533), .B(n530), .Y(n1226) );
  AND2X2 U1219 ( .A(n708), .B(n724), .Y(n1227) );
  AND2X2 U1220 ( .A(n539), .B(n538), .Y(n1228) );
  XNOR2X1 U1221 ( .A(n542), .B(n573), .Y(n291) );
  INVX4 U1222 ( .A(n1336), .Y(n1334) );
  INVX2 U1223 ( .A(n548), .Y(n619) );
  INVX2 U1224 ( .A(n1345), .Y(n1248) );
  INVX2 U1225 ( .A(n545), .Y(n601) );
  INVX2 U1226 ( .A(n1277), .Y(n1278) );
  INVX4 U1227 ( .A(n1302), .Y(n1303) );
  INVX2 U1228 ( .A(n890), .Y(n1300) );
  INVX2 U1229 ( .A(n888), .Y(n1304) );
  INVX2 U1230 ( .A(n881), .Y(n1318) );
  XOR2X1 U1231 ( .A(a[25]), .B(n25), .Y(n1230) );
  XNOR2X1 U1232 ( .A(n1345), .B(a[29]), .Y(n1232) );
  XOR2X1 U1233 ( .A(n19), .B(a[23]), .Y(n1233) );
  INVX1 U1234 ( .A(n213), .Y(n212) );
  INVX2 U1235 ( .A(n19), .Y(n1340) );
  INVX8 U1236 ( .A(n1340), .Y(n1339) );
  BUFX2 U1237 ( .A(n53), .Y(n1235) );
  BUFX2 U1238 ( .A(n52), .Y(n1237) );
  INVX2 U1239 ( .A(n1261), .Y(n1239) );
  INVX2 U1240 ( .A(n19), .Y(n1261) );
  BUFX2 U1241 ( .A(n12), .Y(n1246) );
  INVX1 U1242 ( .A(n216), .Y(n290) );
  BUFX2 U1243 ( .A(n42), .Y(n1241) );
  INVX2 U1244 ( .A(n42), .Y(n1289) );
  INVX2 U1245 ( .A(n751), .Y(n1260) );
  INVX2 U1246 ( .A(n752), .Y(n1259) );
  OAI22X1 U1247 ( .A(n1243), .B(n796), .C(n1000), .D(n795), .Y(n1244) );
  INVX1 U1248 ( .A(n1282), .Y(n552) );
  INVX1 U1249 ( .A(n183), .Y(n181) );
  INVX1 U1250 ( .A(n182), .Y(n285) );
  XNOR2X1 U1251 ( .A(n7), .B(a[19]), .Y(n16) );
  INVX4 U1252 ( .A(n7), .Y(n1336) );
  INVX2 U1253 ( .A(n1232), .Y(n1292) );
  INVX4 U1254 ( .A(n51), .Y(n1296) );
  INVX1 U1255 ( .A(n189), .Y(n286) );
  INVX4 U1256 ( .A(n1032), .Y(n1284) );
  XOR2X1 U1257 ( .A(n400), .B(n396), .Y(n1250) );
  XOR2X1 U1258 ( .A(n1250), .B(n398), .Y(n392) );
  NAND2X1 U1259 ( .A(n400), .B(n396), .Y(n1251) );
  NAND2X1 U1260 ( .A(n400), .B(n398), .Y(n1252) );
  NAND2X1 U1261 ( .A(n396), .B(n398), .Y(n1253) );
  NAND3X1 U1262 ( .A(n1251), .B(n1252), .C(n1253), .Y(n391) );
  XOR2X1 U1263 ( .A(n380), .B(n393), .Y(n1254) );
  XOR2X1 U1264 ( .A(n1254), .B(n391), .Y(n376) );
  NAND2X1 U1265 ( .A(n393), .B(n380), .Y(n1255) );
  NAND2X1 U1266 ( .A(n393), .B(n391), .Y(n1256) );
  NAND2X1 U1267 ( .A(n380), .B(n391), .Y(n1257) );
  NAND3X1 U1268 ( .A(n1255), .B(n1256), .C(n1257), .Y(n375) );
  INVX1 U1269 ( .A(n200), .Y(n202) );
  INVX4 U1270 ( .A(n1272), .Y(n1273) );
  INVX4 U1271 ( .A(n1053), .Y(n1287) );
  INVX1 U1272 ( .A(n205), .Y(n288) );
  INVX1 U1273 ( .A(n199), .Y(n201) );
  INVX2 U1274 ( .A(n1231), .Y(n1288) );
  INVX1 U1275 ( .A(n172), .Y(n174) );
  INVX1 U1276 ( .A(n171), .Y(n173) );
  AOI22X1 U1277 ( .A(n1293), .B(n1259), .C(n1232), .D(n1260), .Y(n1258) );
  XOR2X1 U1278 ( .A(n657), .B(n625), .Y(n1262) );
  XOR2X1 U1279 ( .A(n1262), .B(n372), .Y(n368) );
  NAND2X1 U1280 ( .A(n1201), .B(n578), .Y(n1263) );
  NAND2X1 U1281 ( .A(n1201), .B(n641), .Y(n1264) );
  NAND2X1 U1282 ( .A(n578), .B(n641), .Y(n1265) );
  NAND3X1 U1283 ( .A(n1263), .B(n1264), .C(n1265), .Y(n371) );
  NAND2X1 U1284 ( .A(n657), .B(n625), .Y(n1266) );
  NAND2X1 U1285 ( .A(n657), .B(n372), .Y(n1267) );
  NAND2X1 U1286 ( .A(n625), .B(n372), .Y(n1268) );
  NAND3X1 U1287 ( .A(n1266), .B(n1267), .C(n1268), .Y(n367) );
  INVX1 U1288 ( .A(n1143), .Y(n284) );
  INVX1 U1289 ( .A(n166), .Y(n283) );
  INVX4 U1290 ( .A(n22), .Y(n1277) );
  INVX1 U1291 ( .A(n161), .Y(n282) );
  INVX1 U1292 ( .A(n194), .Y(n287) );
  INVX1 U1293 ( .A(n1238), .Y(n156) );
  INVX1 U1294 ( .A(n1236), .Y(n155) );
  INVX4 U1295 ( .A(n48), .Y(n1293) );
  INVX8 U1296 ( .A(a[15]), .Y(n917) );
  INVX8 U1297 ( .A(n1030), .Y(n1276) );
  INVX8 U1298 ( .A(n1277), .Y(n1279) );
  INVX8 U1299 ( .A(n1280), .Y(n1281) );
  INVX8 U1300 ( .A(n1296), .Y(n1297) );
  INVX8 U1301 ( .A(n1316), .Y(n1317) );
  INVX8 U1302 ( .A(n1324), .Y(n1325) );
  INVX8 U1303 ( .A(n1343), .Y(n1342) );
  INVX2 U1304 ( .A(n101), .Y(n99) );
  INVX2 U1305 ( .A(n94), .Y(n92) );
  INVX2 U1306 ( .A(n79), .Y(n77) );
  INVX2 U1307 ( .A(n1307), .Y(n736) );
  INVX2 U1308 ( .A(n1317), .Y(n731) );
  INVX2 U1309 ( .A(n1321), .Y(n729) );
  OAI22X1 U1310 ( .A(n917), .B(n1333), .C(n1333), .D(n6), .Y(n563) );
  OAI22X1 U1311 ( .A(n1271), .B(n1336), .C(n1240), .D(n1336), .Y(n560) );
  OAI22X1 U1312 ( .A(n1029), .B(n1338), .C(n1276), .D(n1338), .Y(n557) );
  OAI22X1 U1313 ( .A(n1278), .B(n1261), .C(n1281), .D(n1261), .Y(n554) );
  OAI22X1 U1314 ( .A(n1000), .B(n1003), .C(n1284), .D(n1004), .Y(n551) );
  OAI22X1 U1315 ( .A(n995), .B(n1152), .C(n1287), .D(n1152), .Y(n548) );
  OAI22X1 U1316 ( .A(n1288), .B(n1345), .C(n1290), .D(n1345), .Y(n545) );
  OAI22X1 U1317 ( .A(n1247), .B(n1211), .C(n1294), .D(n1211), .Y(n542) );
  INVX2 U1318 ( .A(n1208), .Y(n360) );
  INVX2 U1319 ( .A(n337), .Y(n338) );
  INVX2 U1320 ( .A(n319), .Y(n320) );
  INVX2 U1321 ( .A(n305), .Y(n306) );
  INVX2 U1322 ( .A(n295), .Y(n296) );
  INVX2 U1323 ( .A(n130), .Y(n279) );
  INVX2 U1324 ( .A(n93), .Y(n91) );
  INVX2 U1325 ( .A(n84), .Y(n275) );
  INVX2 U1326 ( .A(n222), .Y(n221) );
  INVX2 U1327 ( .A(n211), .Y(n209) );
  INVX2 U1328 ( .A(n210), .Y(n289) );
  INVX2 U1329 ( .A(n149), .Y(n151) );
  INVX2 U1330 ( .A(n144), .Y(n142) );
  INVX2 U1331 ( .A(n129), .Y(n127) );
  INVX2 U1332 ( .A(n122), .Y(n120) );
  INVX2 U1333 ( .A(n121), .Y(n278) );
  INVX2 U1334 ( .A(n111), .Y(n109) );
  INVX2 U1335 ( .A(n105), .Y(n103) );
  INVX2 U1336 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16:14], n20, 
        src1_data[12], n14, src1_data[10], n18, src1_data[8], n16, n8, 
        src1_data[5], n3, n4, src1_data[2:0]}), .B({src2_data[16], 
        src2_data[16], n12, src2_data[14:12], n15, src2_data[10:8], n2, 
        src2_data[6:5], n5, src2_data[3:0]}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16:14], n20, 
        src1_data[12], n14, src1_data[10], n18, src1_data[8], n16, n8, 
        src1_data[5], n3, n4, src1_data[2:0]}), .B({src2_data[16], 
        src2_data[16], n12, src2_data[14:12], n15, src2_data[10:8], n2, 
        src2_data[6:5], n5, src2_data[3:0]}), .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:8], n16, src1_data[6:0], 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .b(src2_data[15:0]), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  INVX2 U3 ( .A(src1_data[7]), .Y(n17) );
  XNOR2X1 U4 ( .A(n62), .B(large_sum[17]), .Y(n1) );
  BUFX2 U6 ( .A(src2_data[7]), .Y(n2) );
  BUFX2 U7 ( .A(src1_data[4]), .Y(n3) );
  BUFX2 U9 ( .A(src1_data[3]), .Y(n4) );
  BUFX2 U10 ( .A(src2_data[4]), .Y(n5) );
  NAND2X1 U11 ( .A(n1), .B(n58), .Y(n6) );
  NAND2X1 U12 ( .A(n6), .B(n23), .Y(overflow) );
  INVX1 U13 ( .A(src1_data[6]), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n8) );
  INVX2 U15 ( .A(n63), .Y(n58) );
  AND2X2 U16 ( .A(n25), .B(n24), .Y(n9) );
  AND2X2 U17 ( .A(alu_op[1]), .B(n24), .Y(n10) );
  AND2X2 U18 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n11) );
  INVX1 U19 ( .A(src1_data[9]), .Y(n19) );
  BUFX2 U20 ( .A(src2_data[15]), .Y(n12) );
  INVX1 U21 ( .A(src1_data[11]), .Y(n13) );
  INVX2 U22 ( .A(n13), .Y(n14) );
  INVX1 U23 ( .A(src1_data[13]), .Y(n21) );
  INVX2 U24 ( .A(n19), .Y(n18) );
  INVX2 U25 ( .A(n21), .Y(n20) );
  BUFX2 U26 ( .A(src2_data[11]), .Y(n15) );
  INVX8 U27 ( .A(n17), .Y(n16) );
  INVX2 U28 ( .A(large_sum[16]), .Y(n62) );
  INVX2 U29 ( .A(alu_op[1]), .Y(n25) );
  NAND2X1 U30 ( .A(alu_op[0]), .B(n25), .Y(n63) );
  INVX2 U31 ( .A(alu_op[0]), .Y(n24) );
  XOR2X1 U32 ( .A(large_dif[16]), .B(large_dif[17]), .Y(n22) );
  AOI22X1 U33 ( .A(N26), .B(n11), .C(n22), .D(n10), .Y(n23) );
  AOI22X1 U34 ( .A(src1_data[0]), .B(n9), .C(full_mult[30]), .D(n11), .Y(n29)
         );
  AOI22X1 U35 ( .A(large_dif[0]), .B(n10), .C(large_sum[0]), .D(n58), .Y(n26)
         );
  NAND2X1 U36 ( .A(n29), .B(n26), .Y(result[0]) );
  AOI22X1 U37 ( .A(src1_data[1]), .B(n9), .C(full_mult[31]), .D(n11), .Y(n31)
         );
  AOI22X1 U38 ( .A(large_dif[1]), .B(n10), .C(large_sum[1]), .D(n58), .Y(n30)
         );
  NAND2X1 U39 ( .A(n31), .B(n30), .Y(result[1]) );
  AOI22X1 U40 ( .A(src1_data[2]), .B(n9), .C(full_mult[32]), .D(n11), .Y(n33)
         );
  AOI22X1 U41 ( .A(large_dif[2]), .B(n10), .C(large_sum[2]), .D(n58), .Y(n32)
         );
  NAND2X1 U42 ( .A(n33), .B(n32), .Y(result[2]) );
  AOI22X1 U43 ( .A(n4), .B(n9), .C(full_mult[33]), .D(n11), .Y(n35) );
  AOI22X1 U44 ( .A(large_dif[3]), .B(n10), .C(large_sum[3]), .D(n58), .Y(n34)
         );
  NAND2X1 U45 ( .A(n35), .B(n34), .Y(result[3]) );
  AOI22X1 U46 ( .A(n3), .B(n9), .C(full_mult[34]), .D(n11), .Y(n37) );
  AOI22X1 U47 ( .A(large_dif[4]), .B(n10), .C(large_sum[4]), .D(n58), .Y(n36)
         );
  NAND2X1 U48 ( .A(n37), .B(n36), .Y(result[4]) );
  AOI22X1 U49 ( .A(src1_data[5]), .B(n9), .C(full_mult[35]), .D(n11), .Y(n39)
         );
  AOI22X1 U50 ( .A(large_dif[5]), .B(n10), .C(large_sum[5]), .D(n58), .Y(n38)
         );
  NAND2X1 U51 ( .A(n39), .B(n38), .Y(result[5]) );
  AOI22X1 U52 ( .A(n8), .B(n9), .C(full_mult[36]), .D(n11), .Y(n41) );
  AOI22X1 U53 ( .A(large_dif[6]), .B(n10), .C(large_sum[6]), .D(n58), .Y(n40)
         );
  NAND2X1 U54 ( .A(n41), .B(n40), .Y(result[6]) );
  AOI22X1 U55 ( .A(n16), .B(n9), .C(full_mult[37]), .D(n11), .Y(n43) );
  AOI22X1 U56 ( .A(large_dif[7]), .B(n10), .C(large_sum[7]), .D(n58), .Y(n42)
         );
  NAND2X1 U57 ( .A(n42), .B(n43), .Y(result[7]) );
  AOI22X1 U58 ( .A(src1_data[8]), .B(n9), .C(full_mult[38]), .D(n11), .Y(n45)
         );
  AOI22X1 U59 ( .A(large_dif[8]), .B(n10), .C(large_sum[8]), .D(n58), .Y(n44)
         );
  NAND2X1 U60 ( .A(n45), .B(n44), .Y(result[8]) );
  AOI22X1 U61 ( .A(n18), .B(n9), .C(full_mult[39]), .D(n11), .Y(n47) );
  AOI22X1 U62 ( .A(large_dif[9]), .B(n10), .C(large_sum[9]), .D(n58), .Y(n46)
         );
  NAND2X1 U63 ( .A(n47), .B(n46), .Y(result[9]) );
  AOI22X1 U64 ( .A(src1_data[10]), .B(n9), .C(full_mult[40]), .D(n11), .Y(n49)
         );
  AOI22X1 U65 ( .A(large_dif[10]), .B(n10), .C(large_sum[10]), .D(n58), .Y(n48) );
  NAND2X1 U66 ( .A(n49), .B(n48), .Y(result[10]) );
  AOI22X1 U67 ( .A(n14), .B(n9), .C(full_mult[41]), .D(n11), .Y(n51) );
  AOI22X1 U68 ( .A(large_dif[11]), .B(n10), .C(large_sum[11]), .D(n58), .Y(n50) );
  NAND2X1 U69 ( .A(n51), .B(n50), .Y(result[11]) );
  AOI22X1 U70 ( .A(src1_data[12]), .B(n9), .C(full_mult[42]), .D(n11), .Y(n53)
         );
  AOI22X1 U71 ( .A(large_dif[12]), .B(n10), .C(large_sum[12]), .D(n58), .Y(n52) );
  NAND2X1 U72 ( .A(n53), .B(n52), .Y(result[12]) );
  AOI22X1 U73 ( .A(n20), .B(n9), .C(full_mult[43]), .D(n11), .Y(n55) );
  AOI22X1 U74 ( .A(large_dif[13]), .B(n10), .C(large_sum[13]), .D(n58), .Y(n54) );
  NAND2X1 U75 ( .A(n55), .B(n54), .Y(result[13]) );
  AOI22X1 U76 ( .A(src1_data[14]), .B(n9), .C(full_mult[44]), .D(n11), .Y(n57)
         );
  AOI22X1 U77 ( .A(large_dif[14]), .B(n10), .C(large_sum[14]), .D(n58), .Y(n56) );
  NAND2X1 U78 ( .A(n56), .B(n57), .Y(result[14]) );
  AOI22X1 U79 ( .A(src1_data[15]), .B(n9), .C(full_mult[45]), .D(n11), .Y(n60)
         );
  AOI22X1 U80 ( .A(large_dif[15]), .B(n10), .C(large_sum[15]), .D(n58), .Y(n59) );
  NAND2X1 U81 ( .A(n59), .B(n60), .Y(result[15]) );
  AOI22X1 U82 ( .A(src1_data[16]), .B(n9), .C(large_dif[16]), .D(n10), .Y(n61)
         );
  OAI21X1 U83 ( .A(n63), .B(n62), .C(n61), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n9), .Y(n50) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n11), .Y(n46) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n14), .Y(n40) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n16), .Y(n36) );
  INVX1 U14 ( .A(n20), .Y(n30) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  INVX1 U16 ( .A(n22), .Y(n28) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n20), .Y(n30) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n13), .Y(n42) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n18), .Y(n32) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n20), .Y(n30) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n18), .Y(n32) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n20), .Y(n30) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n18), .Y(n32) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n20), .Y(n30) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n11), .Y(n46) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n20), .Y(n30) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n20), .Y(n30) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n18), .Y(n32) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n20), .Y(n30) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n11), .Y(n46) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n20), .Y(n30) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  INVX1 U14 ( .A(n14), .Y(n40) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n725, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n724), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n722), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n723), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n724), .Y(n10) );
  NOR2X1 U29 ( .A(n721), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n722), .B(n723), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n720), 
        .write_enable(write_enables[0]), .new_value({n710, n707, n705, n703, 
        n701, n699, n697, n695, n692, n689, n687, n684, n681, n678, n675, n672, 
        n669}), .current_value({n725, outreg_data[15:0]}) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n713), 
        .write_enable(write_enables[1]), .new_value({n709, n707, n705, n703, 
        n701, n699, n697, n694, n691, n689, n686, n683, n680, n677, n674, n671, 
        n669}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n713), 
        .write_enable(write_enables[2]), .new_value({n710, n707, n705, n703, 
        n701, n699, n697, n695, n692, n689, n687, n684, n681, n678, n675, n672, 
        w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n714), 
        .write_enable(write_enables[3]), .new_value({n709, n707, n705, n703, 
        n701, n699, n697, n694, n691, n689, n686, n683, n680, n677, n674, n671, 
        n669}), .current_value({\regs_matrix[3][16] , \regs_matrix[3][15] , 
        \regs_matrix[3][14] , \regs_matrix[3][13] , \regs_matrix[3][12] , 
        \regs_matrix[3][11] , \regs_matrix[3][10] , \regs_matrix[3][9] , 
        \regs_matrix[3][8] , \regs_matrix[3][7] , \regs_matrix[3][6] , 
        \regs_matrix[3][5] , \regs_matrix[3][4] , \regs_matrix[3][3] , 
        \regs_matrix[3][2] , \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n714), 
        .write_enable(write_enables[4]), .new_value({n710, n707, n705, n703, 
        n701, n699, n697, n695, n692, n689, n687, n684, n681, n678, n675, n672, 
        w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n715), 
        .write_enable(write_enables[5]), .new_value({n709, n707, n705, n703, 
        n701, n699, n697, n694, n691, n689, n686, n683, n680, n677, n674, n671, 
        n669}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n715), 
        .write_enable(write_enables[6]), .new_value({n710, n707, n705, n703, 
        n701, n699, n697, n695, n692, n689, n687, n684, n681, n678, n675, n672, 
        w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n716), 
        .write_enable(write_enables[7]), .new_value({n709, n707, n705, n703, 
        n701, n699, n697, n694, n691, n689, n686, n683, n680, n677, n674, n671, 
        n669}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n716), 
        .write_enable(write_enables[8]), .new_value({n710, n707, n705, n703, 
        n701, n699, n697, n695, n692, n689, n687, n684, n681, n678, n675, n672, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n717), 
        .write_enable(write_enables[9]), .new_value({n709, n707, n705, n703, 
        n701, n699, n697, n694, n691, n689, n686, n683, n680, n677, n674, n671, 
        n669}), .current_value({\regs_matrix[9][16] , \regs_matrix[9][15] , 
        \regs_matrix[9][14] , \regs_matrix[9][13] , \regs_matrix[9][12] , 
        \regs_matrix[9][11] , \regs_matrix[9][10] , \regs_matrix[9][9] , 
        \regs_matrix[9][8] , \regs_matrix[9][7] , \regs_matrix[9][6] , 
        \regs_matrix[9][5] , \regs_matrix[9][4] , \regs_matrix[9][3] , 
        \regs_matrix[9][2] , \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n717), 
        .write_enable(write_enables[10]), .new_value({n710, n707, n705, n703, 
        n701, n699, n697, n695, n692, n689, n687, n684, n681, n678, n675, n672, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n718), 
        .write_enable(write_enables[11]), .new_value({n709, n707, n705, n703, 
        n701, n699, n697, n694, n691, n689, n686, n683, n680, n677, n674, n671, 
        n669}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n718), 
        .write_enable(write_enables[12]), .new_value({n710, n707, n705, n703, 
        n701, n699, n697, n695, n692, n689, n687, n684, n681, n678, n675, n672, 
        w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n719), 
        .write_enable(write_enables[13]), .new_value({n709, n707, n705, n703, 
        n701, n699, n697, n694, n691, n689, n686, n683, n680, n677, n674, n671, 
        n669}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n719), 
        .write_enable(write_enables[14]), .new_value({n710, n707, n705, n703, 
        n701, n699, n697, n695, n692, n689, n687, n684, n681, n678, n675, n672, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n720), 
        .write_enable(write_enables[15]), .new_value({n709, n707, n705, n703, 
        n701, n699, n697, n694, n691, n689, n686, n683, n680, n677, n674, n671, 
        n669}), .current_value({\regs_matrix[15][16] , \regs_matrix[15][15] , 
        \regs_matrix[15][14] , \regs_matrix[15][13] , \regs_matrix[15][12] , 
        \regs_matrix[15][11] , \regs_matrix[15][10] , \regs_matrix[15][9] , 
        \regs_matrix[15][8] , \regs_matrix[15][7] , \regs_matrix[15][6] , 
        \regs_matrix[15][5] , \regs_matrix[15][4] , \regs_matrix[15][3] , 
        \regs_matrix[15][2] , \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  INVX4 U2 ( .A(n71), .Y(n361) );
  INVX2 U3 ( .A(n642), .Y(n643) );
  INVX4 U4 ( .A(n402), .Y(n656) );
  INVX4 U5 ( .A(n70), .Y(n358) );
  INVX4 U31 ( .A(n638), .Y(n1) );
  INVX2 U32 ( .A(n639), .Y(n2) );
  INVX2 U33 ( .A(n639), .Y(n3) );
  INVX2 U34 ( .A(n638), .Y(n639) );
  BUFX4 U35 ( .A(n635), .Y(n638) );
  INVX4 U36 ( .A(n398), .Y(n648) );
  INVX4 U37 ( .A(n310), .Y(r1_data[14]) );
  INVX4 U38 ( .A(n646), .Y(n45) );
  INVX2 U39 ( .A(n385), .Y(n384) );
  INVX4 U40 ( .A(n637), .Y(n640) );
  INVX2 U41 ( .A(n43), .Y(n44) );
  INVX2 U42 ( .A(n647), .Y(n43) );
  INVX4 U43 ( .A(n636), .Y(n641) );
  INVX2 U44 ( .A(n401), .Y(n652) );
  INVX2 U45 ( .A(n403), .Y(n660) );
  INVX2 U46 ( .A(n397), .Y(n642) );
  INVX2 U47 ( .A(n15), .Y(n16) );
  INVX2 U48 ( .A(n174), .Y(r1_data[6]) );
  INVX2 U49 ( .A(n374), .Y(n375) );
  INVX2 U50 ( .A(n106), .Y(r1_data[2]) );
  INVX2 U51 ( .A(n208), .Y(r1_data[8]) );
  INVX2 U52 ( .A(n276), .Y(r1_data[12]) );
  NAND2X1 U53 ( .A(n632), .B(n631), .Y(n4) );
  AND2X2 U54 ( .A(n14), .B(n630), .Y(n635) );
  INVX2 U55 ( .A(n4), .Y(n14) );
  AND2X1 U56 ( .A(N15), .B(N14), .Y(n35) );
  BUFX2 U57 ( .A(n635), .Y(n636) );
  INVX8 U58 ( .A(n643), .Y(n15) );
  INVX8 U59 ( .A(n15), .Y(n17) );
  AND2X1 U60 ( .A(N11), .B(N10), .Y(n56) );
  INVX2 U61 ( .A(n54), .Y(n18) );
  INVX1 U62 ( .A(n54), .Y(n19) );
  INVX1 U63 ( .A(n54), .Y(n20) );
  INVX1 U64 ( .A(n54), .Y(n21) );
  INVX1 U65 ( .A(n54), .Y(n22) );
  INVX1 U66 ( .A(n54), .Y(n23) );
  INVX1 U67 ( .A(n54), .Y(n24) );
  INVX1 U68 ( .A(n54), .Y(n25) );
  BUFX2 U69 ( .A(n18), .Y(n26) );
  BUFX2 U70 ( .A(n18), .Y(n27) );
  BUFX2 U71 ( .A(n18), .Y(n28) );
  BUFX2 U72 ( .A(n18), .Y(n29) );
  BUFX2 U73 ( .A(n18), .Y(n30) );
  BUFX2 U74 ( .A(n77), .Y(n31) );
  BUFX4 U75 ( .A(n77), .Y(n32) );
  BUFX4 U76 ( .A(n77), .Y(n33) );
  INVX2 U77 ( .A(n344), .Y(n77) );
  NAND3X1 U78 ( .A(N16), .B(n666), .C(n632), .Y(n34) );
  AND2X2 U79 ( .A(n632), .B(N16), .Y(n36) );
  INVX4 U80 ( .A(n358), .Y(n359) );
  INVX2 U81 ( .A(n355), .Y(n37) );
  INVX4 U82 ( .A(N10), .Y(n355) );
  INVX4 U83 ( .A(n656), .Y(n657) );
  INVX4 U84 ( .A(n648), .Y(n650) );
  INVX4 U85 ( .A(N14), .Y(n632) );
  BUFX4 U86 ( .A(n55), .Y(n380) );
  INVX2 U87 ( .A(n630), .Y(n666) );
  INVX8 U88 ( .A(n698), .Y(n699) );
  INVX8 U89 ( .A(n704), .Y(n705) );
  INVX8 U90 ( .A(n700), .Y(n701) );
  INVX8 U91 ( .A(n696), .Y(n697) );
  AND2X2 U92 ( .A(n36), .B(n630), .Y(n644) );
  BUFX2 U93 ( .A(n376), .Y(n38) );
  BUFX2 U94 ( .A(n372), .Y(n374) );
  INVX1 U95 ( .A(N12), .Y(n39) );
  INVX1 U96 ( .A(N12), .Y(n40) );
  INVX2 U97 ( .A(N12), .Y(n385) );
  INVX4 U98 ( .A(n679), .Y(n680) );
  INVX4 U99 ( .A(n679), .Y(n681) );
  INVX4 U100 ( .A(n367), .Y(n368) );
  BUFX2 U101 ( .A(N11), .Y(n41) );
  INVX4 U102 ( .A(n660), .Y(n661) );
  BUFX2 U103 ( .A(n366), .Y(n42) );
  INVX4 U104 ( .A(n242), .Y(r1_data[10]) );
  INVX2 U105 ( .A(n652), .Y(n52) );
  INVX4 U106 ( .A(n45), .Y(n46) );
  INVX4 U107 ( .A(n45), .Y(n47) );
  INVX4 U108 ( .A(n45), .Y(n48) );
  INVX2 U109 ( .A(n656), .Y(n49) );
  INVX2 U110 ( .A(n656), .Y(n50) );
  INVX2 U111 ( .A(n652), .Y(n53) );
  INVX1 U112 ( .A(n361), .Y(n51) );
  INVX1 U113 ( .A(n361), .Y(n362) );
  INVX8 U114 ( .A(n361), .Y(n363) );
  INVX8 U115 ( .A(n381), .Y(n382) );
  INVX8 U116 ( .A(n380), .Y(n383) );
  INVX4 U117 ( .A(n327), .Y(r1_data[15]) );
  BUFX4 U118 ( .A(n55), .Y(n381) );
  INVX2 U119 ( .A(N17), .Y(n665) );
  INVX2 U120 ( .A(w_data[16]), .Y(n708) );
  INVX2 U121 ( .A(w_data[4]), .Y(n679) );
  INVX2 U122 ( .A(w_data[3]), .Y(n676) );
  INVX2 U123 ( .A(w_data[2]), .Y(n673) );
  INVX2 U124 ( .A(w_data[5]), .Y(n682) );
  INVX2 U125 ( .A(w_data[1]), .Y(n670) );
  INVX2 U126 ( .A(w_data[0]), .Y(n668) );
  BUFX2 U127 ( .A(n635), .Y(n637) );
  INVX2 U128 ( .A(n665), .Y(n664) );
  INVX2 U129 ( .A(n665), .Y(n663) );
  AND2X2 U130 ( .A(n35), .B(n631), .Y(n54) );
  INVX2 U131 ( .A(n656), .Y(n659) );
  INVX2 U132 ( .A(n644), .Y(n647) );
  INVX2 U133 ( .A(n644), .Y(n646) );
  INVX2 U134 ( .A(n656), .Y(n658) );
  INVX2 U135 ( .A(n652), .Y(n655) );
  INVX2 U136 ( .A(n652), .Y(n654) );
  INVX2 U137 ( .A(n652), .Y(n653) );
  INVX4 U138 ( .A(n648), .Y(n651) );
  INVX2 U139 ( .A(n644), .Y(n645) );
  AND2X2 U140 ( .A(n56), .B(n39), .Y(n55) );
  INVX2 U141 ( .A(n708), .Y(n710) );
  INVX2 U142 ( .A(n708), .Y(n709) );
  INVX2 U143 ( .A(n293), .Y(r1_data[13]) );
  INVX4 U144 ( .A(n690), .Y(n691) );
  INVX4 U145 ( .A(n690), .Y(n692) );
  INVX4 U146 ( .A(n685), .Y(n686) );
  INVX4 U147 ( .A(n693), .Y(n694) );
  INVX4 U148 ( .A(n685), .Y(n687) );
  INVX4 U149 ( .A(n693), .Y(n695) );
  INVX2 U150 ( .A(n676), .Y(n678) );
  INVX2 U151 ( .A(n673), .Y(n675) );
  INVX2 U152 ( .A(n676), .Y(n677) );
  INVX2 U153 ( .A(n673), .Y(n674) );
  INVX2 U154 ( .A(n682), .Y(n684) );
  INVX2 U155 ( .A(n682), .Y(n683) );
  INVX2 U156 ( .A(n670), .Y(n672) );
  INVX2 U157 ( .A(n670), .Y(n671) );
  INVX2 U158 ( .A(n668), .Y(n669) );
  INVX2 U159 ( .A(n712), .Y(outreg_data[16]) );
  INVX2 U160 ( .A(n725), .Y(n712) );
  BUFX2 U161 ( .A(n_reset), .Y(n713) );
  BUFX2 U162 ( .A(n_reset), .Y(n714) );
  BUFX2 U163 ( .A(n_reset), .Y(n715) );
  BUFX2 U164 ( .A(n_reset), .Y(n716) );
  BUFX2 U165 ( .A(n_reset), .Y(n717) );
  BUFX2 U166 ( .A(n_reset), .Y(n718) );
  BUFX2 U167 ( .A(n_reset), .Y(n719) );
  BUFX2 U168 ( .A(n_reset), .Y(n720) );
  AOI22X1 U169 ( .A(n60), .B(n59), .C(n58), .D(n57), .Y(n61) );
  INVX2 U170 ( .A(N13), .Y(n62) );
  INVX2 U171 ( .A(n61), .Y(r1_data[16]) );
  AOI22X1 U172 ( .A(n64), .B(n65), .C(n66), .D(n67), .Y(n63) );
  NOR2X1 U173 ( .A(n68), .B(n69), .Y(n67) );
  OAI22X1 U174 ( .A(\regs_matrix[6][0] ), .B(n360), .C(outreg_data[0]), .D(
        n363), .Y(n69) );
  OAI21X1 U175 ( .A(\regs_matrix[4][0] ), .B(n365), .C(n62), .Y(n68) );
  NOR2X1 U176 ( .A(n73), .B(n74), .Y(n66) );
  OAI21X1 U177 ( .A(\regs_matrix[7][0] ), .B(n368), .C(n76), .Y(n74) );
  AOI22X1 U178 ( .A(n33), .B(n78), .C(n381), .D(n79), .Y(n76) );
  INVX2 U179 ( .A(\regs_matrix[3][0] ), .Y(n79) );
  INVX2 U180 ( .A(\regs_matrix[1][0] ), .Y(n78) );
  OAI22X1 U181 ( .A(\regs_matrix[2][0] ), .B(n375), .C(\regs_matrix[5][0] ), 
        .D(n379), .Y(n73) );
  NOR2X1 U182 ( .A(n82), .B(n83), .Y(n65) );
  OAI22X1 U183 ( .A(\regs_matrix[14][0] ), .B(n360), .C(\regs_matrix[8][0] ), 
        .D(n362), .Y(n83) );
  OAI21X1 U184 ( .A(\regs_matrix[12][0] ), .B(n42), .C(N13), .Y(n82) );
  NOR2X1 U185 ( .A(n84), .B(n85), .Y(n64) );
  OAI21X1 U186 ( .A(\regs_matrix[15][0] ), .B(n369), .C(n86), .Y(n85) );
  AOI22X1 U187 ( .A(n371), .B(n87), .C(n381), .D(n88), .Y(n86) );
  INVX2 U188 ( .A(\regs_matrix[11][0] ), .Y(n88) );
  INVX2 U189 ( .A(\regs_matrix[9][0] ), .Y(n87) );
  OAI22X1 U190 ( .A(\regs_matrix[10][0] ), .B(n38), .C(\regs_matrix[13][0] ), 
        .D(n379), .Y(n84) );
  AOI22X1 U191 ( .A(n90), .B(n91), .C(n92), .D(n93), .Y(n89) );
  NOR2X1 U192 ( .A(n94), .B(n95), .Y(n93) );
  OAI22X1 U193 ( .A(outreg_data[1]), .B(n363), .C(\regs_matrix[2][1] ), .D(
        n376), .Y(n95) );
  OAI22X1 U194 ( .A(\regs_matrix[4][1] ), .B(n366), .C(\regs_matrix[6][1] ), 
        .D(n360), .Y(n94) );
  NOR2X1 U195 ( .A(n96), .B(n97), .Y(n92) );
  OAI21X1 U196 ( .A(\regs_matrix[3][1] ), .B(n383), .C(n98), .Y(n97) );
  AOI21X1 U197 ( .A(n31), .B(n99), .C(N13), .Y(n98) );
  INVX2 U198 ( .A(\regs_matrix[1][1] ), .Y(n99) );
  OAI22X1 U199 ( .A(\regs_matrix[5][1] ), .B(n379), .C(\regs_matrix[7][1] ), 
        .D(n368), .Y(n96) );
  NOR2X1 U200 ( .A(n100), .B(n101), .Y(n91) );
  OAI22X1 U201 ( .A(\regs_matrix[8][1] ), .B(n362), .C(\regs_matrix[10][1] ), 
        .D(n38), .Y(n101) );
  OAI22X1 U202 ( .A(\regs_matrix[12][1] ), .B(n366), .C(\regs_matrix[14][1] ), 
        .D(n360), .Y(n100) );
  NOR2X1 U203 ( .A(n102), .B(n103), .Y(n90) );
  OAI21X1 U204 ( .A(\regs_matrix[11][1] ), .B(n383), .C(n104), .Y(n103) );
  AOI21X1 U205 ( .A(n371), .B(n105), .C(n62), .Y(n104) );
  INVX2 U206 ( .A(\regs_matrix[9][1] ), .Y(n105) );
  OAI22X1 U207 ( .A(\regs_matrix[13][1] ), .B(n379), .C(\regs_matrix[15][1] ), 
        .D(n369), .Y(n102) );
  AOI22X1 U208 ( .A(n107), .B(n108), .C(n109), .D(n110), .Y(n106) );
  NOR2X1 U209 ( .A(n111), .B(n112), .Y(n110) );
  OAI22X1 U210 ( .A(outreg_data[2]), .B(n363), .C(\regs_matrix[2][2] ), .D(
        n376), .Y(n112) );
  OAI22X1 U211 ( .A(\regs_matrix[4][2] ), .B(n365), .C(\regs_matrix[6][2] ), 
        .D(n360), .Y(n111) );
  NOR2X1 U212 ( .A(n113), .B(n114), .Y(n109) );
  OAI21X1 U213 ( .A(\regs_matrix[3][2] ), .B(n383), .C(n115), .Y(n114) );
  AOI21X1 U214 ( .A(n32), .B(n116), .C(N13), .Y(n115) );
  INVX2 U215 ( .A(\regs_matrix[1][2] ), .Y(n116) );
  OAI22X1 U216 ( .A(\regs_matrix[5][2] ), .B(n379), .C(\regs_matrix[7][2] ), 
        .D(n368), .Y(n113) );
  NOR2X1 U217 ( .A(n117), .B(n118), .Y(n108) );
  OAI22X1 U218 ( .A(\regs_matrix[8][2] ), .B(n51), .C(\regs_matrix[10][2] ), 
        .D(n38), .Y(n118) );
  OAI22X1 U219 ( .A(\regs_matrix[12][2] ), .B(n42), .C(\regs_matrix[14][2] ), 
        .D(n360), .Y(n117) );
  NOR2X1 U220 ( .A(n119), .B(n120), .Y(n107) );
  OAI21X1 U221 ( .A(\regs_matrix[11][2] ), .B(n382), .C(n121), .Y(n120) );
  AOI21X1 U222 ( .A(n371), .B(n122), .C(n62), .Y(n121) );
  INVX2 U223 ( .A(\regs_matrix[9][2] ), .Y(n122) );
  OAI22X1 U224 ( .A(\regs_matrix[13][2] ), .B(n379), .C(\regs_matrix[15][2] ), 
        .D(n369), .Y(n119) );
  INVX2 U225 ( .A(n123), .Y(r1_data[3]) );
  AOI22X1 U226 ( .A(n124), .B(n125), .C(n126), .D(n127), .Y(n123) );
  NOR2X1 U227 ( .A(n128), .B(n129), .Y(n127) );
  OAI22X1 U228 ( .A(outreg_data[3]), .B(n363), .C(\regs_matrix[2][3] ), .D(
        n376), .Y(n129) );
  OAI22X1 U229 ( .A(\regs_matrix[4][3] ), .B(n366), .C(\regs_matrix[6][3] ), 
        .D(n359), .Y(n128) );
  NOR2X1 U230 ( .A(n130), .B(n131), .Y(n126) );
  OAI21X1 U231 ( .A(\regs_matrix[3][3] ), .B(n383), .C(n132), .Y(n131) );
  AOI21X1 U232 ( .A(n33), .B(n133), .C(N13), .Y(n132) );
  INVX2 U233 ( .A(\regs_matrix[1][3] ), .Y(n133) );
  OAI22X1 U234 ( .A(\regs_matrix[5][3] ), .B(n379), .C(\regs_matrix[7][3] ), 
        .D(n368), .Y(n130) );
  NOR2X1 U235 ( .A(n134), .B(n135), .Y(n125) );
  OAI22X1 U236 ( .A(\regs_matrix[8][3] ), .B(n363), .C(\regs_matrix[10][3] ), 
        .D(n38), .Y(n135) );
  OAI22X1 U237 ( .A(\regs_matrix[12][3] ), .B(n42), .C(\regs_matrix[14][3] ), 
        .D(n360), .Y(n134) );
  NOR2X1 U238 ( .A(n136), .B(n137), .Y(n124) );
  OAI21X1 U239 ( .A(\regs_matrix[11][3] ), .B(n383), .C(n138), .Y(n137) );
  AOI21X1 U240 ( .A(n371), .B(n139), .C(n62), .Y(n138) );
  INVX2 U241 ( .A(\regs_matrix[9][3] ), .Y(n139) );
  OAI22X1 U242 ( .A(\regs_matrix[13][3] ), .B(n379), .C(\regs_matrix[15][3] ), 
        .D(n369), .Y(n136) );
  AOI22X1 U243 ( .A(n141), .B(n142), .C(n143), .D(n144), .Y(n140) );
  NOR2X1 U244 ( .A(n145), .B(n146), .Y(n144) );
  OAI22X1 U245 ( .A(outreg_data[4]), .B(n363), .C(\regs_matrix[2][4] ), .D(
        n376), .Y(n146) );
  OAI22X1 U246 ( .A(\regs_matrix[4][4] ), .B(n365), .C(\regs_matrix[6][4] ), 
        .D(n359), .Y(n145) );
  NOR2X1 U247 ( .A(n147), .B(n148), .Y(n143) );
  OAI21X1 U248 ( .A(\regs_matrix[3][4] ), .B(n383), .C(n149), .Y(n148) );
  AOI21X1 U249 ( .A(n33), .B(n150), .C(N13), .Y(n149) );
  INVX2 U250 ( .A(\regs_matrix[1][4] ), .Y(n150) );
  OAI22X1 U251 ( .A(\regs_matrix[5][4] ), .B(n378), .C(\regs_matrix[7][4] ), 
        .D(n369), .Y(n147) );
  NOR2X1 U252 ( .A(n151), .B(n152), .Y(n142) );
  OAI22X1 U253 ( .A(\regs_matrix[8][4] ), .B(n362), .C(\regs_matrix[10][4] ), 
        .D(n38), .Y(n152) );
  OAI22X1 U254 ( .A(\regs_matrix[12][4] ), .B(n42), .C(\regs_matrix[14][4] ), 
        .D(n360), .Y(n151) );
  NOR2X1 U255 ( .A(n153), .B(n154), .Y(n141) );
  OAI21X1 U256 ( .A(\regs_matrix[11][4] ), .B(n383), .C(n155), .Y(n154) );
  AOI21X1 U257 ( .A(n371), .B(n156), .C(n62), .Y(n155) );
  INVX2 U258 ( .A(\regs_matrix[9][4] ), .Y(n156) );
  OAI22X1 U259 ( .A(\regs_matrix[13][4] ), .B(n379), .C(\regs_matrix[15][4] ), 
        .D(n369), .Y(n153) );
  AOI22X1 U260 ( .A(n158), .B(n159), .C(n161), .D(n160), .Y(n157) );
  NOR2X1 U261 ( .A(n162), .B(n163), .Y(n161) );
  OAI22X1 U262 ( .A(outreg_data[5]), .B(n363), .C(\regs_matrix[2][5] ), .D(
        n376), .Y(n163) );
  OAI22X1 U263 ( .A(\regs_matrix[4][5] ), .B(n365), .C(\regs_matrix[6][5] ), 
        .D(n359), .Y(n162) );
  NOR2X1 U264 ( .A(n165), .B(n164), .Y(n160) );
  OAI21X1 U265 ( .A(\regs_matrix[3][5] ), .B(n382), .C(n166), .Y(n165) );
  AOI21X1 U266 ( .A(n31), .B(n167), .C(N13), .Y(n166) );
  INVX2 U267 ( .A(\regs_matrix[1][5] ), .Y(n167) );
  OAI22X1 U268 ( .A(\regs_matrix[5][5] ), .B(n379), .C(\regs_matrix[7][5] ), 
        .D(n368), .Y(n164) );
  NOR2X1 U269 ( .A(n168), .B(n169), .Y(n159) );
  OAI22X1 U270 ( .A(\regs_matrix[8][5] ), .B(n363), .C(\regs_matrix[10][5] ), 
        .D(n38), .Y(n169) );
  OAI22X1 U271 ( .A(\regs_matrix[12][5] ), .B(n42), .C(\regs_matrix[14][5] ), 
        .D(n360), .Y(n168) );
  NOR2X1 U272 ( .A(n170), .B(n171), .Y(n158) );
  OAI21X1 U273 ( .A(\regs_matrix[11][5] ), .B(n383), .C(n172), .Y(n171) );
  AOI21X1 U274 ( .A(n371), .B(n173), .C(n62), .Y(n172) );
  INVX2 U275 ( .A(\regs_matrix[9][5] ), .Y(n173) );
  OAI22X1 U276 ( .A(\regs_matrix[13][5] ), .B(n379), .C(\regs_matrix[15][5] ), 
        .D(n369), .Y(n170) );
  AOI22X1 U277 ( .A(n175), .B(n176), .C(n177), .D(n178), .Y(n174) );
  NOR2X1 U278 ( .A(n179), .B(n180), .Y(n178) );
  OAI22X1 U279 ( .A(outreg_data[6]), .B(n363), .C(\regs_matrix[2][6] ), .D(
        n376), .Y(n180) );
  OAI22X1 U280 ( .A(\regs_matrix[4][6] ), .B(n365), .C(\regs_matrix[6][6] ), 
        .D(n359), .Y(n179) );
  NOR2X1 U281 ( .A(n181), .B(n182), .Y(n177) );
  OAI21X1 U282 ( .A(\regs_matrix[3][6] ), .B(n383), .C(n183), .Y(n182) );
  AOI21X1 U283 ( .A(n33), .B(n184), .C(N13), .Y(n183) );
  INVX2 U284 ( .A(\regs_matrix[1][6] ), .Y(n184) );
  OAI22X1 U285 ( .A(\regs_matrix[5][6] ), .B(n378), .C(\regs_matrix[7][6] ), 
        .D(n369), .Y(n181) );
  NOR2X1 U286 ( .A(n185), .B(n186), .Y(n176) );
  OAI22X1 U287 ( .A(\regs_matrix[8][6] ), .B(n362), .C(\regs_matrix[10][6] ), 
        .D(n38), .Y(n186) );
  OAI22X1 U288 ( .A(\regs_matrix[12][6] ), .B(n366), .C(\regs_matrix[14][6] ), 
        .D(n360), .Y(n185) );
  NOR2X1 U289 ( .A(n187), .B(n188), .Y(n175) );
  OAI21X1 U290 ( .A(\regs_matrix[11][6] ), .B(n383), .C(n189), .Y(n188) );
  AOI21X1 U291 ( .A(n371), .B(n190), .C(n62), .Y(n189) );
  INVX2 U292 ( .A(\regs_matrix[9][6] ), .Y(n190) );
  OAI22X1 U293 ( .A(\regs_matrix[13][6] ), .B(n378), .C(\regs_matrix[15][6] ), 
        .D(n369), .Y(n187) );
  INVX2 U294 ( .A(n191), .Y(r1_data[7]) );
  AOI22X1 U295 ( .A(n192), .B(n193), .C(n195), .D(n194), .Y(n191) );
  NOR2X1 U296 ( .A(n196), .B(n197), .Y(n195) );
  OAI22X1 U297 ( .A(outreg_data[7]), .B(n363), .C(\regs_matrix[2][7] ), .D(
        n376), .Y(n197) );
  OAI22X1 U298 ( .A(\regs_matrix[4][7] ), .B(n366), .C(\regs_matrix[6][7] ), 
        .D(n359), .Y(n196) );
  NOR2X1 U299 ( .A(n198), .B(n199), .Y(n194) );
  OAI21X1 U300 ( .A(\regs_matrix[3][7] ), .B(n383), .C(n200), .Y(n199) );
  AOI21X1 U301 ( .A(n33), .B(n201), .C(N13), .Y(n200) );
  INVX2 U302 ( .A(\regs_matrix[1][7] ), .Y(n201) );
  OAI22X1 U303 ( .A(\regs_matrix[5][7] ), .B(n378), .C(\regs_matrix[7][7] ), 
        .D(n369), .Y(n198) );
  NOR2X1 U304 ( .A(n202), .B(n203), .Y(n193) );
  OAI22X1 U305 ( .A(\regs_matrix[8][7] ), .B(n51), .C(\regs_matrix[10][7] ), 
        .D(n38), .Y(n203) );
  OAI22X1 U306 ( .A(\regs_matrix[12][7] ), .B(n366), .C(\regs_matrix[14][7] ), 
        .D(n360), .Y(n202) );
  NOR2X1 U307 ( .A(n204), .B(n205), .Y(n192) );
  OAI21X1 U308 ( .A(\regs_matrix[11][7] ), .B(n383), .C(n206), .Y(n205) );
  AOI21X1 U309 ( .A(n371), .B(n207), .C(n62), .Y(n206) );
  INVX2 U310 ( .A(\regs_matrix[9][7] ), .Y(n207) );
  OAI22X1 U311 ( .A(\regs_matrix[13][7] ), .B(n378), .C(\regs_matrix[15][7] ), 
        .D(n369), .Y(n204) );
  AOI22X1 U312 ( .A(n209), .B(n210), .C(n211), .D(n212), .Y(n208) );
  NOR2X1 U313 ( .A(n213), .B(n214), .Y(n212) );
  OAI22X1 U314 ( .A(outreg_data[8]), .B(n363), .C(\regs_matrix[2][8] ), .D(
        n375), .Y(n214) );
  OAI22X1 U315 ( .A(\regs_matrix[4][8] ), .B(n365), .C(\regs_matrix[6][8] ), 
        .D(n360), .Y(n213) );
  NOR2X1 U316 ( .A(n215), .B(n216), .Y(n211) );
  OAI21X1 U317 ( .A(\regs_matrix[3][8] ), .B(n383), .C(n217), .Y(n216) );
  AOI21X1 U318 ( .A(n32), .B(n218), .C(N13), .Y(n217) );
  INVX2 U319 ( .A(\regs_matrix[1][8] ), .Y(n218) );
  OAI22X1 U320 ( .A(\regs_matrix[5][8] ), .B(n378), .C(\regs_matrix[7][8] ), 
        .D(n369), .Y(n215) );
  NOR2X1 U321 ( .A(n219), .B(n220), .Y(n210) );
  OAI22X1 U322 ( .A(\regs_matrix[8][8] ), .B(n363), .C(\regs_matrix[10][8] ), 
        .D(n38), .Y(n220) );
  OAI22X1 U323 ( .A(\regs_matrix[12][8] ), .B(n366), .C(\regs_matrix[14][8] ), 
        .D(n360), .Y(n219) );
  NOR2X1 U324 ( .A(n221), .B(n222), .Y(n209) );
  OAI21X1 U325 ( .A(\regs_matrix[11][8] ), .B(n383), .C(n223), .Y(n222) );
  AOI21X1 U326 ( .A(n371), .B(n224), .C(n62), .Y(n223) );
  INVX2 U327 ( .A(\regs_matrix[9][8] ), .Y(n224) );
  OAI22X1 U328 ( .A(\regs_matrix[13][8] ), .B(n378), .C(\regs_matrix[15][8] ), 
        .D(n369), .Y(n221) );
  AOI22X1 U329 ( .A(n226), .B(n227), .C(n228), .D(n229), .Y(n225) );
  NOR2X1 U330 ( .A(n230), .B(n231), .Y(n229) );
  OAI22X1 U331 ( .A(outreg_data[9]), .B(n363), .C(\regs_matrix[2][9] ), .D(
        n376), .Y(n231) );
  OAI22X1 U332 ( .A(\regs_matrix[4][9] ), .B(n365), .C(\regs_matrix[6][9] ), 
        .D(n359), .Y(n230) );
  NOR2X1 U333 ( .A(n232), .B(n233), .Y(n228) );
  OAI21X1 U334 ( .A(\regs_matrix[3][9] ), .B(n383), .C(n234), .Y(n233) );
  AOI21X1 U335 ( .A(n32), .B(n235), .C(N13), .Y(n234) );
  INVX2 U336 ( .A(\regs_matrix[1][9] ), .Y(n235) );
  OAI22X1 U337 ( .A(\regs_matrix[5][9] ), .B(n378), .C(\regs_matrix[7][9] ), 
        .D(n368), .Y(n232) );
  NOR2X1 U338 ( .A(n236), .B(n237), .Y(n227) );
  OAI22X1 U339 ( .A(\regs_matrix[8][9] ), .B(n362), .C(\regs_matrix[10][9] ), 
        .D(n38), .Y(n237) );
  OAI22X1 U340 ( .A(\regs_matrix[12][9] ), .B(n366), .C(\regs_matrix[14][9] ), 
        .D(n360), .Y(n236) );
  NOR2X1 U341 ( .A(n238), .B(n239), .Y(n226) );
  OAI21X1 U342 ( .A(\regs_matrix[11][9] ), .B(n383), .C(n240), .Y(n239) );
  AOI21X1 U343 ( .A(n371), .B(n241), .C(n62), .Y(n240) );
  INVX2 U344 ( .A(\regs_matrix[9][9] ), .Y(n241) );
  OAI22X1 U345 ( .A(\regs_matrix[13][9] ), .B(n378), .C(\regs_matrix[15][9] ), 
        .D(n369), .Y(n238) );
  AOI22X1 U346 ( .A(n243), .B(n244), .C(n245), .D(n246), .Y(n242) );
  NOR2X1 U347 ( .A(n247), .B(n248), .Y(n246) );
  OAI22X1 U348 ( .A(outreg_data[10]), .B(n363), .C(\regs_matrix[2][10] ), .D(
        n376), .Y(n248) );
  OAI22X1 U349 ( .A(\regs_matrix[4][10] ), .B(n366), .C(\regs_matrix[6][10] ), 
        .D(n359), .Y(n247) );
  NOR2X1 U350 ( .A(n250), .B(n249), .Y(n245) );
  OAI21X1 U351 ( .A(\regs_matrix[3][10] ), .B(n383), .C(n251), .Y(n250) );
  AOI21X1 U352 ( .A(n32), .B(n252), .C(N13), .Y(n251) );
  INVX2 U353 ( .A(\regs_matrix[1][10] ), .Y(n252) );
  OAI22X1 U354 ( .A(\regs_matrix[5][10] ), .B(n378), .C(\regs_matrix[7][10] ), 
        .D(n368), .Y(n249) );
  NOR2X1 U355 ( .A(n253), .B(n254), .Y(n244) );
  OAI22X1 U356 ( .A(\regs_matrix[8][10] ), .B(n51), .C(\regs_matrix[10][10] ), 
        .D(n38), .Y(n254) );
  OAI22X1 U357 ( .A(\regs_matrix[12][10] ), .B(n366), .C(\regs_matrix[14][10] ), .D(n360), .Y(n253) );
  NOR2X1 U358 ( .A(n255), .B(n256), .Y(n243) );
  OAI21X1 U359 ( .A(\regs_matrix[11][10] ), .B(n383), .C(n257), .Y(n256) );
  AOI21X1 U360 ( .A(n371), .B(n258), .C(n62), .Y(n257) );
  INVX2 U361 ( .A(\regs_matrix[9][10] ), .Y(n258) );
  OAI22X1 U362 ( .A(\regs_matrix[13][10] ), .B(n378), .C(\regs_matrix[15][10] ), .D(n369), .Y(n255) );
  AOI22X1 U363 ( .A(n260), .B(n261), .C(n262), .D(n263), .Y(n259) );
  NOR2X1 U364 ( .A(n264), .B(n265), .Y(n263) );
  OAI22X1 U365 ( .A(outreg_data[11]), .B(n363), .C(\regs_matrix[2][11] ), .D(
        n376), .Y(n265) );
  OAI22X1 U366 ( .A(\regs_matrix[4][11] ), .B(n365), .C(\regs_matrix[6][11] ), 
        .D(n359), .Y(n264) );
  NOR2X1 U367 ( .A(n266), .B(n267), .Y(n262) );
  OAI21X1 U368 ( .A(\regs_matrix[3][11] ), .B(n383), .C(n268), .Y(n267) );
  AOI21X1 U369 ( .A(n32), .B(n269), .C(N13), .Y(n268) );
  INVX2 U370 ( .A(\regs_matrix[1][11] ), .Y(n269) );
  OAI22X1 U371 ( .A(\regs_matrix[5][11] ), .B(n378), .C(\regs_matrix[7][11] ), 
        .D(n368), .Y(n266) );
  NOR2X1 U372 ( .A(n270), .B(n271), .Y(n261) );
  OAI22X1 U373 ( .A(\regs_matrix[8][11] ), .B(n51), .C(\regs_matrix[10][11] ), 
        .D(n38), .Y(n271) );
  OAI22X1 U374 ( .A(\regs_matrix[12][11] ), .B(n366), .C(\regs_matrix[14][11] ), .D(n360), .Y(n270) );
  NOR2X1 U375 ( .A(n272), .B(n273), .Y(n260) );
  OAI21X1 U376 ( .A(\regs_matrix[11][11] ), .B(n383), .C(n274), .Y(n273) );
  AOI21X1 U377 ( .A(n371), .B(n275), .C(n62), .Y(n274) );
  INVX2 U378 ( .A(\regs_matrix[9][11] ), .Y(n275) );
  OAI22X1 U379 ( .A(\regs_matrix[13][11] ), .B(n378), .C(\regs_matrix[15][11] ), .D(n369), .Y(n272) );
  AOI22X1 U380 ( .A(n277), .B(n278), .C(n279), .D(n280), .Y(n276) );
  NOR2X1 U381 ( .A(n281), .B(n282), .Y(n280) );
  OAI22X1 U382 ( .A(outreg_data[12]), .B(n363), .C(\regs_matrix[2][12] ), .D(
        n376), .Y(n282) );
  OAI22X1 U383 ( .A(\regs_matrix[4][12] ), .B(n365), .C(\regs_matrix[6][12] ), 
        .D(n360), .Y(n281) );
  NOR2X1 U384 ( .A(n283), .B(n284), .Y(n279) );
  OAI21X1 U385 ( .A(\regs_matrix[3][12] ), .B(n383), .C(n285), .Y(n284) );
  AOI21X1 U386 ( .A(n33), .B(n286), .C(N13), .Y(n285) );
  INVX2 U387 ( .A(\regs_matrix[1][12] ), .Y(n286) );
  OAI22X1 U388 ( .A(\regs_matrix[5][12] ), .B(n378), .C(\regs_matrix[7][12] ), 
        .D(n368), .Y(n283) );
  NOR2X1 U389 ( .A(n287), .B(n288), .Y(n278) );
  OAI22X1 U390 ( .A(\regs_matrix[8][12] ), .B(n363), .C(\regs_matrix[10][12] ), 
        .D(n38), .Y(n288) );
  OAI22X1 U391 ( .A(\regs_matrix[12][12] ), .B(n366), .C(\regs_matrix[14][12] ), .D(n360), .Y(n287) );
  NOR2X1 U392 ( .A(n289), .B(n290), .Y(n277) );
  OAI21X1 U393 ( .A(\regs_matrix[11][12] ), .B(n382), .C(n291), .Y(n290) );
  AOI21X1 U394 ( .A(n371), .B(n292), .C(n62), .Y(n291) );
  INVX2 U395 ( .A(\regs_matrix[9][12] ), .Y(n292) );
  OAI22X1 U396 ( .A(\regs_matrix[13][12] ), .B(n378), .C(\regs_matrix[15][12] ), .D(n369), .Y(n289) );
  AOI22X1 U397 ( .A(n294), .B(n295), .C(n296), .D(n297), .Y(n293) );
  NOR2X1 U398 ( .A(n298), .B(n299), .Y(n297) );
  OAI22X1 U399 ( .A(outreg_data[13]), .B(n363), .C(\regs_matrix[2][13] ), .D(
        n375), .Y(n299) );
  OAI22X1 U400 ( .A(\regs_matrix[4][13] ), .B(n366), .C(\regs_matrix[6][13] ), 
        .D(n359), .Y(n298) );
  NOR2X1 U401 ( .A(n301), .B(n300), .Y(n296) );
  OAI21X1 U402 ( .A(\regs_matrix[3][13] ), .B(n382), .C(n302), .Y(n301) );
  AOI21X1 U403 ( .A(n32), .B(n303), .C(N13), .Y(n302) );
  INVX2 U404 ( .A(\regs_matrix[1][13] ), .Y(n303) );
  OAI22X1 U405 ( .A(\regs_matrix[5][13] ), .B(n378), .C(\regs_matrix[7][13] ), 
        .D(n369), .Y(n300) );
  NOR2X1 U406 ( .A(n304), .B(n305), .Y(n295) );
  OAI22X1 U407 ( .A(\regs_matrix[8][13] ), .B(n362), .C(\regs_matrix[10][13] ), 
        .D(n38), .Y(n305) );
  OAI22X1 U408 ( .A(\regs_matrix[12][13] ), .B(n366), .C(\regs_matrix[14][13] ), .D(n360), .Y(n304) );
  NOR2X1 U409 ( .A(n306), .B(n307), .Y(n294) );
  OAI21X1 U410 ( .A(\regs_matrix[11][13] ), .B(n382), .C(n308), .Y(n307) );
  AOI21X1 U411 ( .A(n371), .B(n309), .C(n62), .Y(n308) );
  INVX2 U412 ( .A(\regs_matrix[9][13] ), .Y(n309) );
  OAI22X1 U413 ( .A(\regs_matrix[13][13] ), .B(n379), .C(\regs_matrix[15][13] ), .D(n369), .Y(n306) );
  AOI22X1 U414 ( .A(n311), .B(n312), .C(n313), .D(n314), .Y(n310) );
  NOR2X1 U415 ( .A(n315), .B(n316), .Y(n314) );
  OAI22X1 U416 ( .A(outreg_data[14]), .B(n71), .C(\regs_matrix[2][14] ), .D(
        n375), .Y(n316) );
  OAI22X1 U417 ( .A(\regs_matrix[4][14] ), .B(n365), .C(\regs_matrix[6][14] ), 
        .D(n360), .Y(n315) );
  NOR2X1 U418 ( .A(n317), .B(n318), .Y(n313) );
  OAI21X1 U419 ( .A(\regs_matrix[3][14] ), .B(n382), .C(n319), .Y(n318) );
  AOI21X1 U420 ( .A(n33), .B(n320), .C(N13), .Y(n319) );
  INVX2 U421 ( .A(\regs_matrix[1][14] ), .Y(n320) );
  OAI22X1 U422 ( .A(\regs_matrix[5][14] ), .B(n378), .C(\regs_matrix[7][14] ), 
        .D(n368), .Y(n317) );
  NOR2X1 U423 ( .A(n321), .B(n322), .Y(n312) );
  OAI22X1 U424 ( .A(\regs_matrix[8][14] ), .B(n51), .C(\regs_matrix[10][14] ), 
        .D(n38), .Y(n322) );
  OAI22X1 U425 ( .A(\regs_matrix[12][14] ), .B(n366), .C(\regs_matrix[14][14] ), .D(n360), .Y(n321) );
  NOR2X1 U426 ( .A(n323), .B(n324), .Y(n311) );
  OAI21X1 U427 ( .A(\regs_matrix[11][14] ), .B(n382), .C(n325), .Y(n324) );
  AOI21X1 U428 ( .A(n371), .B(n326), .C(n62), .Y(n325) );
  INVX2 U429 ( .A(\regs_matrix[9][14] ), .Y(n326) );
  OAI22X1 U430 ( .A(\regs_matrix[13][14] ), .B(n378), .C(\regs_matrix[15][14] ), .D(n369), .Y(n323) );
  AOI22X1 U431 ( .A(n328), .B(n329), .C(n330), .D(n331), .Y(n327) );
  NOR2X1 U432 ( .A(n332), .B(n333), .Y(n331) );
  OAI22X1 U433 ( .A(outreg_data[15]), .B(n363), .C(\regs_matrix[2][15] ), .D(
        n375), .Y(n333) );
  OAI22X1 U434 ( .A(\regs_matrix[4][15] ), .B(n365), .C(\regs_matrix[6][15] ), 
        .D(n359), .Y(n332) );
  NOR2X1 U435 ( .A(n334), .B(n335), .Y(n330) );
  OAI21X1 U436 ( .A(\regs_matrix[3][15] ), .B(n382), .C(n336), .Y(n335) );
  AOI21X1 U437 ( .A(n32), .B(n337), .C(N13), .Y(n336) );
  INVX2 U438 ( .A(\regs_matrix[1][15] ), .Y(n337) );
  OAI22X1 U439 ( .A(\regs_matrix[5][15] ), .B(n378), .C(\regs_matrix[7][15] ), 
        .D(n368), .Y(n334) );
  NOR2X1 U440 ( .A(n338), .B(n339), .Y(n329) );
  OAI22X1 U441 ( .A(\regs_matrix[8][15] ), .B(n363), .C(\regs_matrix[10][15] ), 
        .D(n38), .Y(n339) );
  OAI22X1 U442 ( .A(\regs_matrix[12][15] ), .B(n366), .C(\regs_matrix[14][15] ), .D(n360), .Y(n338) );
  NOR2X1 U443 ( .A(n340), .B(n341), .Y(n328) );
  OAI21X1 U444 ( .A(\regs_matrix[11][15] ), .B(n382), .C(n342), .Y(n341) );
  AOI21X1 U445 ( .A(n371), .B(n343), .C(n62), .Y(n342) );
  INVX2 U446 ( .A(\regs_matrix[9][15] ), .Y(n343) );
  OAI22X1 U447 ( .A(\regs_matrix[13][15] ), .B(n379), .C(\regs_matrix[15][15] ), .D(n369), .Y(n340) );
  NOR2X1 U448 ( .A(n345), .B(n346), .Y(n57) );
  OAI21X1 U449 ( .A(outreg_data[16]), .B(n363), .C(n347), .Y(n346) );
  AOI21X1 U450 ( .A(n374), .B(n348), .C(N13), .Y(n347) );
  INVX2 U451 ( .A(\regs_matrix[2][16] ), .Y(n348) );
  OAI22X1 U452 ( .A(\regs_matrix[4][16] ), .B(n365), .C(\regs_matrix[6][16] ), 
        .D(n360), .Y(n345) );
  NOR2X1 U453 ( .A(n349), .B(n350), .Y(n58) );
  OAI22X1 U454 ( .A(\regs_matrix[3][16] ), .B(n382), .C(\regs_matrix[1][16] ), 
        .D(n370), .Y(n350) );
  OAI22X1 U455 ( .A(\regs_matrix[5][16] ), .B(n379), .C(\regs_matrix[7][16] ), 
        .D(n368), .Y(n349) );
  NOR3X1 U456 ( .A(n351), .B(n352), .C(n353), .Y(n59) );
  OAI22X1 U457 ( .A(\regs_matrix[10][16] ), .B(n38), .C(\regs_matrix[8][16] ), 
        .D(n363), .Y(n353) );
  NAND3X1 U458 ( .A(n354), .B(n39), .C(n355), .Y(n71) );
  NAND3X1 U459 ( .A(n41), .B(n40), .C(n355), .Y(n80) );
  NOR2X1 U460 ( .A(\regs_matrix[12][16] ), .B(n365), .Y(n352) );
  NAND3X1 U461 ( .A(n384), .B(n354), .C(n355), .Y(n72) );
  OAI22X1 U462 ( .A(\regs_matrix[9][16] ), .B(n370), .C(\regs_matrix[14][16] ), 
        .D(n360), .Y(n351) );
  NAND3X1 U463 ( .A(n355), .B(n41), .C(n384), .Y(n70) );
  NAND3X1 U464 ( .A(n37), .B(n40), .C(n354), .Y(n344) );
  NOR2X1 U465 ( .A(n356), .B(n357), .Y(n60) );
  OAI21X1 U466 ( .A(\regs_matrix[11][16] ), .B(n382), .C(N13), .Y(n357) );
  OAI22X1 U467 ( .A(\regs_matrix[15][16] ), .B(n369), .C(\regs_matrix[13][16] ), .D(n379), .Y(n356) );
  NAND3X1 U468 ( .A(n384), .B(n37), .C(n354), .Y(n81) );
  INVX2 U469 ( .A(N11), .Y(n354) );
  NAND2X1 U470 ( .A(n384), .B(n56), .Y(n75) );
  INVX8 U471 ( .A(n358), .Y(n360) );
  INVX8 U472 ( .A(n364), .Y(n365) );
  INVX8 U473 ( .A(n364), .Y(n366) );
  INVX8 U474 ( .A(n367), .Y(n369) );
  BUFX4 U475 ( .A(n372), .Y(n373) );
  INVX8 U476 ( .A(n373), .Y(n376) );
  INVX8 U477 ( .A(n377), .Y(n378) );
  INVX8 U478 ( .A(n377), .Y(n379) );
  INVX4 U479 ( .A(n63), .Y(r1_data[0]) );
  INVX2 U480 ( .A(n80), .Y(n372) );
  INVX4 U481 ( .A(n89), .Y(r1_data[1]) );
  INVX4 U482 ( .A(n140), .Y(r1_data[4]) );
  INVX4 U483 ( .A(n225), .Y(r1_data[9]) );
  INVX4 U484 ( .A(n259), .Y(r1_data[11]) );
  INVX4 U485 ( .A(n157), .Y(r1_data[5]) );
  INVX2 U486 ( .A(n370), .Y(n371) );
  INVX1 U487 ( .A(n32), .Y(n370) );
  INVX4 U488 ( .A(n75), .Y(n367) );
  INVX4 U489 ( .A(n81), .Y(n377) );
  INVX4 U490 ( .A(n72), .Y(n364) );
  AOI22X1 U491 ( .A(n389), .B(n388), .C(n387), .D(n386), .Y(n390) );
  INVX2 U492 ( .A(n390), .Y(r2_data[16]) );
  MUX2X1 U493 ( .B(n391), .A(n392), .S(n663), .Y(r2_data[0]) );
  NAND2X1 U494 ( .A(n393), .B(n394), .Y(n392) );
  NOR2X1 U495 ( .A(n395), .B(n396), .Y(n394) );
  OAI22X1 U496 ( .A(\regs_matrix[8][0] ), .B(n1), .C(\regs_matrix[10][0] ), 
        .D(n16), .Y(n396) );
  OAI22X1 U497 ( .A(\regs_matrix[12][0] ), .B(n647), .C(\regs_matrix[14][0] ), 
        .D(n667), .Y(n395) );
  NOR2X1 U498 ( .A(n399), .B(n400), .Y(n393) );
  OAI22X1 U499 ( .A(\regs_matrix[11][0] ), .B(n22), .C(\regs_matrix[9][0] ), 
        .D(n653), .Y(n400) );
  OAI22X1 U500 ( .A(\regs_matrix[13][0] ), .B(n657), .C(\regs_matrix[15][0] ), 
        .D(n662), .Y(n399) );
  NAND2X1 U501 ( .A(n404), .B(n405), .Y(n391) );
  NOR2X1 U502 ( .A(n406), .B(n407), .Y(n405) );
  OAI22X1 U503 ( .A(outreg_data[0]), .B(n640), .C(\regs_matrix[2][0] ), .D(n16), .Y(n407) );
  OAI22X1 U504 ( .A(\regs_matrix[4][0] ), .B(n645), .C(\regs_matrix[6][0] ), 
        .D(n667), .Y(n406) );
  NOR2X1 U505 ( .A(n408), .B(n409), .Y(n404) );
  OAI22X1 U506 ( .A(\regs_matrix[3][0] ), .B(n20), .C(\regs_matrix[1][0] ), 
        .D(n655), .Y(n409) );
  OAI22X1 U507 ( .A(\regs_matrix[5][0] ), .B(n657), .C(\regs_matrix[7][0] ), 
        .D(n662), .Y(n408) );
  MUX2X1 U508 ( .B(n410), .A(n411), .S(n664), .Y(r2_data[1]) );
  NAND2X1 U509 ( .A(n412), .B(n413), .Y(n411) );
  NOR2X1 U510 ( .A(n414), .B(n415), .Y(n413) );
  OAI22X1 U511 ( .A(\regs_matrix[8][1] ), .B(n640), .C(\regs_matrix[10][1] ), 
        .D(n16), .Y(n415) );
  OAI22X1 U512 ( .A(\regs_matrix[12][1] ), .B(n645), .C(\regs_matrix[14][1] ), 
        .D(n34), .Y(n414) );
  NOR2X1 U513 ( .A(n416), .B(n417), .Y(n412) );
  OAI22X1 U514 ( .A(\regs_matrix[11][1] ), .B(n21), .C(\regs_matrix[9][1] ), 
        .D(n653), .Y(n417) );
  OAI22X1 U515 ( .A(\regs_matrix[13][1] ), .B(n657), .C(\regs_matrix[15][1] ), 
        .D(n662), .Y(n416) );
  NAND2X1 U516 ( .A(n418), .B(n419), .Y(n410) );
  NOR2X1 U517 ( .A(n420), .B(n421), .Y(n419) );
  OAI22X1 U518 ( .A(outreg_data[1]), .B(n640), .C(\regs_matrix[2][1] ), .D(n16), .Y(n421) );
  OAI22X1 U519 ( .A(\regs_matrix[4][1] ), .B(n645), .C(\regs_matrix[6][1] ), 
        .D(n34), .Y(n420) );
  NOR2X1 U520 ( .A(n422), .B(n423), .Y(n418) );
  OAI22X1 U521 ( .A(\regs_matrix[3][1] ), .B(n23), .C(\regs_matrix[1][1] ), 
        .D(n655), .Y(n423) );
  OAI22X1 U522 ( .A(\regs_matrix[5][1] ), .B(n657), .C(\regs_matrix[7][1] ), 
        .D(n662), .Y(n422) );
  MUX2X1 U523 ( .B(n424), .A(n425), .S(n663), .Y(r2_data[2]) );
  NAND2X1 U524 ( .A(n426), .B(n427), .Y(n425) );
  NOR2X1 U525 ( .A(n428), .B(n429), .Y(n427) );
  OAI22X1 U526 ( .A(\regs_matrix[8][2] ), .B(n640), .C(\regs_matrix[10][2] ), 
        .D(n16), .Y(n429) );
  OAI22X1 U527 ( .A(\regs_matrix[12][2] ), .B(n645), .C(\regs_matrix[14][2] ), 
        .D(n34), .Y(n428) );
  NOR2X1 U528 ( .A(n430), .B(n431), .Y(n426) );
  OAI22X1 U529 ( .A(\regs_matrix[11][2] ), .B(n30), .C(\regs_matrix[9][2] ), 
        .D(n52), .Y(n431) );
  OAI22X1 U530 ( .A(\regs_matrix[13][2] ), .B(n50), .C(\regs_matrix[15][2] ), 
        .D(n661), .Y(n430) );
  NAND2X1 U531 ( .A(n432), .B(n433), .Y(n424) );
  NOR2X1 U532 ( .A(n434), .B(n435), .Y(n433) );
  OAI22X1 U533 ( .A(outreg_data[2]), .B(n641), .C(\regs_matrix[2][2] ), .D(n16), .Y(n435) );
  OAI22X1 U534 ( .A(\regs_matrix[4][2] ), .B(n647), .C(\regs_matrix[6][2] ), 
        .D(n34), .Y(n434) );
  NOR2X1 U535 ( .A(n436), .B(n437), .Y(n432) );
  OAI22X1 U536 ( .A(\regs_matrix[3][2] ), .B(n19), .C(\regs_matrix[1][2] ), 
        .D(n655), .Y(n437) );
  OAI22X1 U537 ( .A(\regs_matrix[5][2] ), .B(n659), .C(\regs_matrix[7][2] ), 
        .D(n662), .Y(n436) );
  MUX2X1 U538 ( .B(n438), .A(n439), .S(n664), .Y(r2_data[3]) );
  NAND2X1 U539 ( .A(n440), .B(n441), .Y(n439) );
  NOR2X1 U540 ( .A(n442), .B(n443), .Y(n441) );
  OAI22X1 U541 ( .A(\regs_matrix[8][3] ), .B(n639), .C(\regs_matrix[10][3] ), 
        .D(n17), .Y(n443) );
  OAI22X1 U542 ( .A(\regs_matrix[12][3] ), .B(n647), .C(\regs_matrix[14][3] ), 
        .D(n649), .Y(n442) );
  NOR2X1 U543 ( .A(n444), .B(n445), .Y(n440) );
  OAI22X1 U544 ( .A(\regs_matrix[11][3] ), .B(n29), .C(\regs_matrix[9][3] ), 
        .D(n654), .Y(n445) );
  OAI22X1 U545 ( .A(\regs_matrix[13][3] ), .B(n49), .C(\regs_matrix[15][3] ), 
        .D(n662), .Y(n444) );
  NAND2X1 U546 ( .A(n446), .B(n447), .Y(n438) );
  NOR2X1 U547 ( .A(n448), .B(n449), .Y(n447) );
  OAI22X1 U548 ( .A(outreg_data[3]), .B(n1), .C(\regs_matrix[2][3] ), .D(n17), 
        .Y(n449) );
  OAI22X1 U549 ( .A(\regs_matrix[4][3] ), .B(n645), .C(\regs_matrix[6][3] ), 
        .D(n649), .Y(n448) );
  NOR2X1 U550 ( .A(n450), .B(n451), .Y(n446) );
  OAI22X1 U551 ( .A(\regs_matrix[3][3] ), .B(n25), .C(\regs_matrix[1][3] ), 
        .D(n53), .Y(n451) );
  OAI22X1 U552 ( .A(\regs_matrix[5][3] ), .B(n657), .C(\regs_matrix[7][3] ), 
        .D(n662), .Y(n450) );
  MUX2X1 U553 ( .B(n452), .A(n453), .S(n663), .Y(r2_data[4]) );
  NAND2X1 U554 ( .A(n454), .B(n455), .Y(n453) );
  NOR2X1 U555 ( .A(n456), .B(n457), .Y(n455) );
  OAI22X1 U556 ( .A(\regs_matrix[8][4] ), .B(n640), .C(\regs_matrix[10][4] ), 
        .D(n17), .Y(n457) );
  OAI22X1 U557 ( .A(\regs_matrix[12][4] ), .B(n48), .C(\regs_matrix[14][4] ), 
        .D(n651), .Y(n456) );
  NOR2X1 U558 ( .A(n458), .B(n459), .Y(n454) );
  OAI22X1 U559 ( .A(\regs_matrix[11][4] ), .B(n20), .C(\regs_matrix[9][4] ), 
        .D(n52), .Y(n459) );
  OAI22X1 U560 ( .A(\regs_matrix[13][4] ), .B(n658), .C(\regs_matrix[15][4] ), 
        .D(n661), .Y(n458) );
  NAND2X1 U561 ( .A(n460), .B(n461), .Y(n452) );
  NOR2X1 U562 ( .A(n462), .B(n463), .Y(n461) );
  OAI22X1 U563 ( .A(outreg_data[4]), .B(n1), .C(\regs_matrix[2][4] ), .D(n17), 
        .Y(n463) );
  OAI22X1 U564 ( .A(\regs_matrix[4][4] ), .B(n47), .C(\regs_matrix[6][4] ), 
        .D(n667), .Y(n462) );
  NOR2X1 U565 ( .A(n464), .B(n465), .Y(n460) );
  OAI22X1 U566 ( .A(\regs_matrix[3][4] ), .B(n22), .C(\regs_matrix[1][4] ), 
        .D(n654), .Y(n465) );
  OAI22X1 U567 ( .A(\regs_matrix[5][4] ), .B(n49), .C(\regs_matrix[7][4] ), 
        .D(n661), .Y(n464) );
  MUX2X1 U568 ( .B(n466), .A(n467), .S(n664), .Y(r2_data[5]) );
  NAND2X1 U569 ( .A(n468), .B(n469), .Y(n467) );
  NOR2X1 U570 ( .A(n470), .B(n471), .Y(n469) );
  OAI22X1 U571 ( .A(\regs_matrix[8][5] ), .B(n640), .C(\regs_matrix[10][5] ), 
        .D(n17), .Y(n471) );
  OAI22X1 U572 ( .A(\regs_matrix[12][5] ), .B(n47), .C(\regs_matrix[14][5] ), 
        .D(n650), .Y(n470) );
  NOR2X1 U573 ( .A(n472), .B(n473), .Y(n468) );
  OAI22X1 U574 ( .A(\regs_matrix[11][5] ), .B(n28), .C(\regs_matrix[9][5] ), 
        .D(n654), .Y(n473) );
  OAI22X1 U575 ( .A(\regs_matrix[13][5] ), .B(n50), .C(\regs_matrix[15][5] ), 
        .D(n662), .Y(n472) );
  NAND2X1 U576 ( .A(n474), .B(n475), .Y(n466) );
  NOR2X1 U577 ( .A(n476), .B(n477), .Y(n475) );
  OAI22X1 U578 ( .A(outreg_data[5]), .B(n1), .C(\regs_matrix[2][5] ), .D(n17), 
        .Y(n477) );
  OAI22X1 U579 ( .A(\regs_matrix[4][5] ), .B(n46), .C(\regs_matrix[6][5] ), 
        .D(n650), .Y(n476) );
  NOR2X1 U580 ( .A(n478), .B(n479), .Y(n474) );
  OAI22X1 U581 ( .A(\regs_matrix[3][5] ), .B(n24), .C(\regs_matrix[1][5] ), 
        .D(n52), .Y(n479) );
  OAI22X1 U582 ( .A(\regs_matrix[5][5] ), .B(n657), .C(\regs_matrix[7][5] ), 
        .D(n661), .Y(n478) );
  MUX2X1 U583 ( .B(n480), .A(n481), .S(n663), .Y(r2_data[6]) );
  NAND2X1 U584 ( .A(n482), .B(n483), .Y(n481) );
  NOR2X1 U585 ( .A(n484), .B(n485), .Y(n483) );
  OAI22X1 U586 ( .A(\regs_matrix[8][6] ), .B(n1), .C(\regs_matrix[10][6] ), 
        .D(n17), .Y(n485) );
  OAI22X1 U587 ( .A(\regs_matrix[12][6] ), .B(n48), .C(\regs_matrix[14][6] ), 
        .D(n651), .Y(n484) );
  NOR2X1 U588 ( .A(n486), .B(n487), .Y(n482) );
  OAI22X1 U589 ( .A(\regs_matrix[11][6] ), .B(n27), .C(\regs_matrix[9][6] ), 
        .D(n53), .Y(n487) );
  OAI22X1 U590 ( .A(\regs_matrix[13][6] ), .B(n659), .C(\regs_matrix[15][6] ), 
        .D(n661), .Y(n486) );
  NAND2X1 U591 ( .A(n488), .B(n489), .Y(n480) );
  NOR2X1 U592 ( .A(n490), .B(n491), .Y(n489) );
  OAI22X1 U593 ( .A(outreg_data[6]), .B(n1), .C(\regs_matrix[2][6] ), .D(n17), 
        .Y(n491) );
  OAI22X1 U594 ( .A(\regs_matrix[4][6] ), .B(n48), .C(\regs_matrix[6][6] ), 
        .D(n667), .Y(n490) );
  NOR2X1 U595 ( .A(n492), .B(n493), .Y(n488) );
  OAI22X1 U596 ( .A(\regs_matrix[3][6] ), .B(n24), .C(\regs_matrix[1][6] ), 
        .D(n53), .Y(n493) );
  OAI22X1 U597 ( .A(\regs_matrix[5][6] ), .B(n658), .C(\regs_matrix[7][6] ), 
        .D(n662), .Y(n492) );
  MUX2X1 U598 ( .B(n494), .A(n495), .S(n664), .Y(r2_data[7]) );
  NAND2X1 U599 ( .A(n496), .B(n497), .Y(n495) );
  NOR2X1 U600 ( .A(n498), .B(n499), .Y(n497) );
  OAI22X1 U601 ( .A(\regs_matrix[8][7] ), .B(n639), .C(\regs_matrix[10][7] ), 
        .D(n17), .Y(n499) );
  OAI22X1 U602 ( .A(\regs_matrix[12][7] ), .B(n44), .C(\regs_matrix[14][7] ), 
        .D(n651), .Y(n498) );
  NOR2X1 U603 ( .A(n500), .B(n501), .Y(n496) );
  OAI22X1 U604 ( .A(\regs_matrix[11][7] ), .B(n29), .C(\regs_matrix[9][7] ), 
        .D(n53), .Y(n501) );
  OAI22X1 U605 ( .A(\regs_matrix[13][7] ), .B(n659), .C(\regs_matrix[15][7] ), 
        .D(n661), .Y(n500) );
  NAND2X1 U606 ( .A(n502), .B(n503), .Y(n494) );
  NOR2X1 U607 ( .A(n504), .B(n505), .Y(n503) );
  OAI22X1 U608 ( .A(outreg_data[7]), .B(n639), .C(\regs_matrix[2][7] ), .D(n17), .Y(n505) );
  OAI22X1 U609 ( .A(\regs_matrix[4][7] ), .B(n44), .C(\regs_matrix[6][7] ), 
        .D(n667), .Y(n504) );
  NOR2X1 U610 ( .A(n506), .B(n507), .Y(n502) );
  OAI22X1 U611 ( .A(\regs_matrix[3][7] ), .B(n25), .C(\regs_matrix[1][7] ), 
        .D(n655), .Y(n507) );
  OAI22X1 U612 ( .A(\regs_matrix[5][7] ), .B(n50), .C(\regs_matrix[7][7] ), 
        .D(n661), .Y(n506) );
  MUX2X1 U613 ( .B(n508), .A(n509), .S(n663), .Y(r2_data[8]) );
  NAND2X1 U614 ( .A(n510), .B(n511), .Y(n509) );
  NOR2X1 U615 ( .A(n512), .B(n513), .Y(n511) );
  OAI22X1 U616 ( .A(\regs_matrix[8][8] ), .B(n641), .C(\regs_matrix[10][8] ), 
        .D(n17), .Y(n513) );
  OAI22X1 U617 ( .A(\regs_matrix[12][8] ), .B(n48), .C(\regs_matrix[14][8] ), 
        .D(n650), .Y(n512) );
  NOR2X1 U618 ( .A(n514), .B(n515), .Y(n510) );
  OAI22X1 U619 ( .A(\regs_matrix[11][8] ), .B(n20), .C(\regs_matrix[9][8] ), 
        .D(n653), .Y(n515) );
  OAI22X1 U620 ( .A(\regs_matrix[13][8] ), .B(n49), .C(\regs_matrix[15][8] ), 
        .D(n662), .Y(n514) );
  NAND2X1 U621 ( .A(n516), .B(n517), .Y(n508) );
  NOR2X1 U622 ( .A(n518), .B(n519), .Y(n517) );
  OAI22X1 U623 ( .A(outreg_data[8]), .B(n641), .C(\regs_matrix[2][8] ), .D(n17), .Y(n519) );
  OAI22X1 U624 ( .A(\regs_matrix[4][8] ), .B(n645), .C(\regs_matrix[6][8] ), 
        .D(n651), .Y(n518) );
  NOR2X1 U625 ( .A(n520), .B(n521), .Y(n516) );
  OAI22X1 U626 ( .A(\regs_matrix[3][8] ), .B(n27), .C(\regs_matrix[1][8] ), 
        .D(n654), .Y(n521) );
  OAI22X1 U627 ( .A(\regs_matrix[5][8] ), .B(n49), .C(\regs_matrix[7][8] ), 
        .D(n661), .Y(n520) );
  MUX2X1 U628 ( .B(n522), .A(n523), .S(n664), .Y(r2_data[9]) );
  NAND2X1 U629 ( .A(n524), .B(n525), .Y(n523) );
  NOR2X1 U630 ( .A(n526), .B(n527), .Y(n525) );
  OAI22X1 U631 ( .A(\regs_matrix[8][9] ), .B(n639), .C(\regs_matrix[10][9] ), 
        .D(n17), .Y(n527) );
  OAI22X1 U632 ( .A(\regs_matrix[12][9] ), .B(n44), .C(\regs_matrix[14][9] ), 
        .D(n650), .Y(n526) );
  NOR2X1 U633 ( .A(n528), .B(n529), .Y(n524) );
  OAI22X1 U634 ( .A(\regs_matrix[11][9] ), .B(n26), .C(\regs_matrix[9][9] ), 
        .D(n52), .Y(n529) );
  OAI22X1 U635 ( .A(\regs_matrix[13][9] ), .B(n658), .C(\regs_matrix[15][9] ), 
        .D(n661), .Y(n528) );
  NAND2X1 U636 ( .A(n530), .B(n531), .Y(n522) );
  NOR2X1 U637 ( .A(n532), .B(n533), .Y(n531) );
  OAI22X1 U638 ( .A(outreg_data[9]), .B(n639), .C(\regs_matrix[2][9] ), .D(n17), .Y(n533) );
  OAI22X1 U639 ( .A(\regs_matrix[4][9] ), .B(n47), .C(\regs_matrix[6][9] ), 
        .D(n649), .Y(n532) );
  NOR2X1 U640 ( .A(n534), .B(n535), .Y(n530) );
  OAI22X1 U641 ( .A(\regs_matrix[3][9] ), .B(n24), .C(\regs_matrix[1][9] ), 
        .D(n53), .Y(n535) );
  OAI22X1 U642 ( .A(\regs_matrix[5][9] ), .B(n50), .C(\regs_matrix[7][9] ), 
        .D(n662), .Y(n534) );
  MUX2X1 U643 ( .B(n536), .A(n537), .S(n663), .Y(r2_data[10]) );
  NAND2X1 U644 ( .A(n538), .B(n539), .Y(n537) );
  NOR2X1 U645 ( .A(n540), .B(n541), .Y(n539) );
  OAI22X1 U646 ( .A(\regs_matrix[8][10] ), .B(n1), .C(\regs_matrix[10][10] ), 
        .D(n17), .Y(n541) );
  OAI22X1 U647 ( .A(\regs_matrix[12][10] ), .B(n47), .C(\regs_matrix[14][10] ), 
        .D(n651), .Y(n540) );
  NOR2X1 U648 ( .A(n542), .B(n543), .Y(n538) );
  OAI22X1 U649 ( .A(\regs_matrix[11][10] ), .B(n26), .C(\regs_matrix[9][10] ), 
        .D(n655), .Y(n543) );
  OAI22X1 U650 ( .A(\regs_matrix[13][10] ), .B(n659), .C(\regs_matrix[15][10] ), .D(n662), .Y(n542) );
  NAND2X1 U651 ( .A(n544), .B(n545), .Y(n536) );
  NOR2X1 U652 ( .A(n546), .B(n547), .Y(n545) );
  OAI22X1 U653 ( .A(outreg_data[10]), .B(n640), .C(\regs_matrix[2][10] ), .D(
        n17), .Y(n547) );
  OAI22X1 U654 ( .A(\regs_matrix[4][10] ), .B(n46), .C(\regs_matrix[6][10] ), 
        .D(n651), .Y(n546) );
  NOR2X1 U655 ( .A(n548), .B(n549), .Y(n544) );
  OAI22X1 U656 ( .A(\regs_matrix[3][10] ), .B(n23), .C(\regs_matrix[1][10] ), 
        .D(n653), .Y(n549) );
  OAI22X1 U657 ( .A(\regs_matrix[5][10] ), .B(n657), .C(\regs_matrix[7][10] ), 
        .D(n662), .Y(n548) );
  MUX2X1 U658 ( .B(n550), .A(n551), .S(n664), .Y(r2_data[11]) );
  NAND2X1 U659 ( .A(n552), .B(n553), .Y(n551) );
  NOR2X1 U660 ( .A(n554), .B(n555), .Y(n553) );
  OAI22X1 U661 ( .A(\regs_matrix[8][11] ), .B(n639), .C(\regs_matrix[10][11] ), 
        .D(n17), .Y(n555) );
  OAI22X1 U662 ( .A(\regs_matrix[12][11] ), .B(n46), .C(\regs_matrix[14][11] ), 
        .D(n650), .Y(n554) );
  NOR2X1 U663 ( .A(n556), .B(n557), .Y(n552) );
  OAI22X1 U664 ( .A(\regs_matrix[11][11] ), .B(n23), .C(\regs_matrix[9][11] ), 
        .D(n653), .Y(n557) );
  OAI22X1 U665 ( .A(\regs_matrix[13][11] ), .B(n50), .C(\regs_matrix[15][11] ), 
        .D(n661), .Y(n556) );
  NAND2X1 U666 ( .A(n558), .B(n559), .Y(n550) );
  NOR2X1 U667 ( .A(n560), .B(n561), .Y(n559) );
  OAI22X1 U668 ( .A(outreg_data[11]), .B(n641), .C(\regs_matrix[2][11] ), .D(
        n17), .Y(n561) );
  OAI22X1 U669 ( .A(\regs_matrix[4][11] ), .B(n44), .C(\regs_matrix[6][11] ), 
        .D(n34), .Y(n560) );
  NOR2X1 U670 ( .A(n562), .B(n563), .Y(n558) );
  OAI22X1 U671 ( .A(\regs_matrix[3][11] ), .B(n22), .C(\regs_matrix[1][11] ), 
        .D(n655), .Y(n563) );
  OAI22X1 U672 ( .A(\regs_matrix[5][11] ), .B(n658), .C(\regs_matrix[7][11] ), 
        .D(n662), .Y(n562) );
  MUX2X1 U673 ( .B(n564), .A(n565), .S(n663), .Y(r2_data[12]) );
  NAND2X1 U674 ( .A(n566), .B(n567), .Y(n565) );
  NOR2X1 U675 ( .A(n568), .B(n569), .Y(n567) );
  OAI22X1 U676 ( .A(\regs_matrix[8][12] ), .B(n641), .C(\regs_matrix[10][12] ), 
        .D(n17), .Y(n569) );
  OAI22X1 U677 ( .A(\regs_matrix[12][12] ), .B(n47), .C(\regs_matrix[14][12] ), 
        .D(n650), .Y(n568) );
  NOR2X1 U678 ( .A(n570), .B(n571), .Y(n566) );
  OAI22X1 U679 ( .A(\regs_matrix[11][12] ), .B(n25), .C(\regs_matrix[9][12] ), 
        .D(n654), .Y(n571) );
  OAI22X1 U680 ( .A(\regs_matrix[13][12] ), .B(n659), .C(\regs_matrix[15][12] ), .D(n661), .Y(n570) );
  NAND2X1 U681 ( .A(n572), .B(n573), .Y(n564) );
  NOR2X1 U682 ( .A(n574), .B(n575), .Y(n573) );
  OAI22X1 U683 ( .A(outreg_data[12]), .B(n640), .C(\regs_matrix[2][12] ), .D(
        n17), .Y(n575) );
  OAI22X1 U684 ( .A(\regs_matrix[4][12] ), .B(n48), .C(\regs_matrix[6][12] ), 
        .D(n649), .Y(n574) );
  NOR2X1 U685 ( .A(n576), .B(n577), .Y(n572) );
  OAI22X1 U686 ( .A(\regs_matrix[3][12] ), .B(n19), .C(\regs_matrix[1][12] ), 
        .D(n653), .Y(n577) );
  OAI22X1 U687 ( .A(\regs_matrix[5][12] ), .B(n657), .C(\regs_matrix[7][12] ), 
        .D(n662), .Y(n576) );
  MUX2X1 U688 ( .B(n578), .A(n579), .S(n664), .Y(r2_data[13]) );
  NAND2X1 U689 ( .A(n580), .B(n581), .Y(n579) );
  NOR2X1 U690 ( .A(n582), .B(n583), .Y(n581) );
  OAI22X1 U691 ( .A(\regs_matrix[8][13] ), .B(n640), .C(\regs_matrix[10][13] ), 
        .D(n17), .Y(n583) );
  OAI22X1 U692 ( .A(\regs_matrix[12][13] ), .B(n647), .C(\regs_matrix[14][13] ), .D(n650), .Y(n582) );
  NOR2X1 U693 ( .A(n584), .B(n585), .Y(n580) );
  OAI22X1 U694 ( .A(\regs_matrix[11][13] ), .B(n26), .C(\regs_matrix[9][13] ), 
        .D(n53), .Y(n585) );
  OAI22X1 U695 ( .A(\regs_matrix[13][13] ), .B(n49), .C(\regs_matrix[15][13] ), 
        .D(n662), .Y(n584) );
  NAND2X1 U696 ( .A(n586), .B(n587), .Y(n578) );
  NOR2X1 U697 ( .A(n588), .B(n589), .Y(n587) );
  OAI22X1 U698 ( .A(outreg_data[13]), .B(n641), .C(\regs_matrix[2][13] ), .D(
        n17), .Y(n589) );
  OAI22X1 U699 ( .A(\regs_matrix[4][13] ), .B(n47), .C(\regs_matrix[6][13] ), 
        .D(n649), .Y(n588) );
  NOR2X1 U700 ( .A(n590), .B(n591), .Y(n586) );
  OAI22X1 U701 ( .A(\regs_matrix[3][13] ), .B(n30), .C(\regs_matrix[1][13] ), 
        .D(n653), .Y(n591) );
  OAI22X1 U702 ( .A(\regs_matrix[5][13] ), .B(n658), .C(\regs_matrix[7][13] ), 
        .D(n662), .Y(n590) );
  MUX2X1 U703 ( .B(n592), .A(n593), .S(n663), .Y(r2_data[14]) );
  NAND2X1 U704 ( .A(n594), .B(n595), .Y(n593) );
  NOR2X1 U705 ( .A(n596), .B(n597), .Y(n595) );
  OAI22X1 U706 ( .A(\regs_matrix[8][14] ), .B(n641), .C(\regs_matrix[10][14] ), 
        .D(n17), .Y(n597) );
  OAI22X1 U707 ( .A(\regs_matrix[12][14] ), .B(n645), .C(\regs_matrix[14][14] ), .D(n650), .Y(n596) );
  NOR2X1 U708 ( .A(n598), .B(n599), .Y(n594) );
  OAI22X1 U709 ( .A(\regs_matrix[11][14] ), .B(n21), .C(\regs_matrix[9][14] ), 
        .D(n655), .Y(n599) );
  OAI22X1 U710 ( .A(\regs_matrix[13][14] ), .B(n657), .C(\regs_matrix[15][14] ), .D(n662), .Y(n598) );
  NAND2X1 U711 ( .A(n600), .B(n601), .Y(n592) );
  NOR2X1 U712 ( .A(n602), .B(n603), .Y(n601) );
  OAI22X1 U713 ( .A(outreg_data[14]), .B(n641), .C(\regs_matrix[2][14] ), .D(
        n17), .Y(n603) );
  OAI22X1 U714 ( .A(\regs_matrix[4][14] ), .B(n647), .C(\regs_matrix[6][14] ), 
        .D(n650), .Y(n602) );
  NOR2X1 U715 ( .A(n604), .B(n605), .Y(n600) );
  OAI22X1 U716 ( .A(\regs_matrix[3][14] ), .B(n19), .C(\regs_matrix[1][14] ), 
        .D(n654), .Y(n605) );
  OAI22X1 U717 ( .A(\regs_matrix[5][14] ), .B(n657), .C(\regs_matrix[7][14] ), 
        .D(n662), .Y(n604) );
  MUX2X1 U718 ( .B(n606), .A(n607), .S(n664), .Y(r2_data[15]) );
  NAND2X1 U719 ( .A(n608), .B(n609), .Y(n607) );
  NOR2X1 U720 ( .A(n611), .B(n610), .Y(n609) );
  OAI22X1 U721 ( .A(\regs_matrix[8][15] ), .B(n641), .C(\regs_matrix[10][15] ), 
        .D(n17), .Y(n611) );
  OAI22X1 U722 ( .A(\regs_matrix[12][15] ), .B(n46), .C(\regs_matrix[14][15] ), 
        .D(n651), .Y(n610) );
  NOR2X1 U723 ( .A(n612), .B(n613), .Y(n608) );
  OAI22X1 U724 ( .A(\regs_matrix[11][15] ), .B(n28), .C(\regs_matrix[9][15] ), 
        .D(n53), .Y(n613) );
  OAI22X1 U725 ( .A(\regs_matrix[13][15] ), .B(n658), .C(\regs_matrix[15][15] ), .D(n661), .Y(n612) );
  NAND2X1 U726 ( .A(n614), .B(n615), .Y(n606) );
  NOR2X1 U727 ( .A(n616), .B(n617), .Y(n615) );
  OAI22X1 U728 ( .A(outreg_data[15]), .B(n641), .C(\regs_matrix[2][15] ), .D(
        n17), .Y(n617) );
  OAI22X1 U729 ( .A(\regs_matrix[4][15] ), .B(n46), .C(\regs_matrix[6][15] ), 
        .D(n649), .Y(n616) );
  NOR2X1 U730 ( .A(n618), .B(n619), .Y(n614) );
  OAI22X1 U731 ( .A(\regs_matrix[3][15] ), .B(n21), .C(\regs_matrix[1][15] ), 
        .D(n52), .Y(n619) );
  OAI22X1 U732 ( .A(\regs_matrix[5][15] ), .B(n50), .C(\regs_matrix[7][15] ), 
        .D(n661), .Y(n618) );
  NOR2X1 U733 ( .A(n620), .B(n621), .Y(n386) );
  OAI21X1 U734 ( .A(\regs_matrix[6][16] ), .B(n651), .C(n622), .Y(n621) );
  AOI22X1 U735 ( .A(n642), .B(n348), .C(n3), .D(n712), .Y(n622) );
  OAI21X1 U736 ( .A(\regs_matrix[4][16] ), .B(n46), .C(n665), .Y(n620) );
  NOR2X1 U737 ( .A(n623), .B(n624), .Y(n387) );
  OAI22X1 U738 ( .A(\regs_matrix[3][16] ), .B(n27), .C(\regs_matrix[1][16] ), 
        .D(n52), .Y(n624) );
  OAI22X1 U739 ( .A(\regs_matrix[5][16] ), .B(n49), .C(\regs_matrix[7][16] ), 
        .D(n661), .Y(n623) );
  NOR2X1 U740 ( .A(n625), .B(n626), .Y(n388) );
  OAI21X1 U741 ( .A(\regs_matrix[12][16] ), .B(n48), .C(n627), .Y(n626) );
  AOI22X1 U742 ( .A(n642), .B(n628), .C(n2), .D(n629), .Y(n627) );
  INVX2 U743 ( .A(\regs_matrix[8][16] ), .Y(n629) );
  INVX2 U744 ( .A(\regs_matrix[10][16] ), .Y(n628) );
  NAND3X1 U745 ( .A(N15), .B(n631), .C(n632), .Y(n397) );
  OAI22X1 U746 ( .A(\regs_matrix[9][16] ), .B(n654), .C(\regs_matrix[14][16] ), 
        .D(n649), .Y(n625) );
  NAND3X1 U747 ( .A(N16), .B(n666), .C(n632), .Y(n398) );
  NAND3X1 U748 ( .A(N14), .B(n631), .C(n630), .Y(n401) );
  NOR2X1 U749 ( .A(n633), .B(n634), .Y(n389) );
  OAI21X1 U750 ( .A(\regs_matrix[11][16] ), .B(n28), .C(n663), .Y(n634) );
  OAI22X1 U751 ( .A(\regs_matrix[15][16] ), .B(n662), .C(\regs_matrix[13][16] ), .D(n659), .Y(n633) );
  NAND3X1 U752 ( .A(N16), .B(N14), .C(n630), .Y(n402) );
  INVX2 U753 ( .A(N15), .Y(n630) );
  NAND2X1 U754 ( .A(N16), .B(n35), .Y(n403) );
  INVX8 U755 ( .A(n660), .Y(n662) );
  INVX1 U756 ( .A(N16), .Y(n631) );
  INVX4 U757 ( .A(n648), .Y(n649) );
  NAND3X1 U758 ( .A(N16), .B(n666), .C(n632), .Y(n667) );
  INVX4 U759 ( .A(w_data[8]), .Y(n690) );
  INVX4 U760 ( .A(w_data[7]), .Y(n688) );
  INVX4 U761 ( .A(w_data[6]), .Y(n685) );
  INVX4 U762 ( .A(w_data[9]), .Y(n693) );
  INVX4 U763 ( .A(w_data[12]), .Y(n700) );
  INVX4 U764 ( .A(w_data[11]), .Y(n698) );
  INVX4 U765 ( .A(w_data[10]), .Y(n696) );
  INVX4 U766 ( .A(w_data[14]), .Y(n704) );
  INVX4 U767 ( .A(w_data[13]), .Y(n702) );
  INVX4 U768 ( .A(w_data[15]), .Y(n706) );
  INVX8 U769 ( .A(n688), .Y(n689) );
  INVX8 U770 ( .A(n702), .Y(n703) );
  INVX8 U771 ( .A(n706), .Y(n707) );
  INVX2 U772 ( .A(w_en), .Y(n721) );
  INVX2 U773 ( .A(w_sel[1]), .Y(n722) );
  INVX2 U774 ( .A(w_sel[2]), .Y(n723) );
  INVX2 U775 ( .A(w_sel[3]), .Y(n724) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  AND2X2 U2 ( .A(n36), .B(n3), .Y(n1) );
  AND2X2 U3 ( .A(w_data_sel[0]), .B(n36), .Y(n2) );
  INVX2 U4 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N17, N20, N21, N22,
         N23, N24, N25, N26, N27, N28, N29, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118;

  DFFSR \count_out_reg[0]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(n76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  AND2X2 U17 ( .A(n34), .B(n49), .Y(n48) );
  OAI21X1 U30 ( .A(n117), .B(n34), .C(n35), .Y(n67) );
  NAND2X1 U31 ( .A(rollover_flag), .B(n36), .Y(n35) );
  OAI21X1 U32 ( .A(n116), .B(n118), .C(n37), .Y(n68) );
  NAND2X1 U33 ( .A(N29), .B(n38), .Y(n37) );
  OAI21X1 U34 ( .A(n103), .B(n118), .C(n39), .Y(n69) );
  NAND2X1 U35 ( .A(N28), .B(n38), .Y(n39) );
  OAI21X1 U36 ( .A(n115), .B(n118), .C(n40), .Y(n70) );
  NAND2X1 U37 ( .A(N27), .B(n38), .Y(n40) );
  OAI21X1 U38 ( .A(n105), .B(n118), .C(n41), .Y(n71) );
  NAND2X1 U39 ( .A(N26), .B(n38), .Y(n41) );
  OAI21X1 U40 ( .A(n114), .B(n118), .C(n42), .Y(n72) );
  NAND2X1 U41 ( .A(N25), .B(n38), .Y(n42) );
  OAI21X1 U42 ( .A(n107), .B(n118), .C(n43), .Y(n73) );
  NAND2X1 U43 ( .A(N24), .B(n38), .Y(n43) );
  OAI21X1 U44 ( .A(n113), .B(n118), .C(n44), .Y(n74) );
  NAND2X1 U45 ( .A(N23), .B(n38), .Y(n44) );
  OAI21X1 U46 ( .A(n112), .B(n118), .C(n45), .Y(n75) );
  NAND2X1 U47 ( .A(N22), .B(n38), .Y(n45) );
  OAI21X1 U48 ( .A(n111), .B(n118), .C(n46), .Y(n76) );
  NAND2X1 U49 ( .A(N21), .B(n38), .Y(n46) );
  OAI21X1 U50 ( .A(n110), .B(n118), .C(n47), .Y(n77) );
  AOI22X1 U51 ( .A(n48), .B(N17), .C(N20), .D(n38), .Y(n47) );
  AOI21X1 U52 ( .A(n34), .B(N17), .C(n117), .Y(n38) );
  NOR2X1 U53 ( .A(n36), .B(clear), .Y(n49) );
  NAND3X1 U54 ( .A(n50), .B(n51), .C(n52), .Y(n34) );
  NOR2X1 U55 ( .A(n53), .B(n54), .Y(n52) );
  NAND3X1 U56 ( .A(n55), .B(n56), .C(n57), .Y(n54) );
  XNOR2X1 U57 ( .A(count_out[3]), .B(N8), .Y(n57) );
  XNOR2X1 U58 ( .A(count_out[8]), .B(N13), .Y(n56) );
  XNOR2X1 U59 ( .A(count_out[5]), .B(N10), .Y(n55) );
  NAND2X1 U60 ( .A(n58), .B(n59), .Y(n53) );
  XNOR2X1 U61 ( .A(count_out[9]), .B(N14), .Y(n59) );
  NOR2X1 U62 ( .A(N15), .B(n60), .Y(n58) );
  XNOR2X1 U63 ( .A(n115), .B(N12), .Y(n60) );
  NOR2X1 U64 ( .A(n61), .B(n62), .Y(n51) );
  NAND2X1 U65 ( .A(n63), .B(n64), .Y(n62) );
  XNOR2X1 U66 ( .A(count_out[4]), .B(N9), .Y(n64) );
  XNOR2X1 U67 ( .A(count_out[6]), .B(N11), .Y(n63) );
  XNOR2X1 U68 ( .A(n112), .B(N7), .Y(n61) );
  NOR2X1 U69 ( .A(n65), .B(n66), .Y(n50) );
  XNOR2X1 U70 ( .A(n110), .B(N5), .Y(n66) );
  XNOR2X1 U71 ( .A(n111), .B(N6), .Y(n65) );
  NOR2X1 U72 ( .A(clear), .B(count_enable), .Y(n36) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 r305 ( .A(count_out), .SUM({N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20}) );
  INVX2 U5 ( .A(n36), .Y(n118) );
  NOR2X1 U6 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n2) );
  NAND2X1 U9 ( .A(n2), .B(n26), .Y(n3) );
  NOR2X1 U18 ( .A(n3), .B(rollover_val[3]), .Y(n5) );
  NAND2X1 U19 ( .A(n5), .B(n25), .Y(n6) );
  NOR2X1 U20 ( .A(n6), .B(rollover_val[5]), .Y(n8) );
  NAND2X1 U21 ( .A(n8), .B(n28), .Y(n9) );
  NOR2X1 U22 ( .A(n9), .B(rollover_val[7]), .Y(n22) );
  NAND2X1 U23 ( .A(n22), .B(n27), .Y(n23) );
  NOR2X1 U24 ( .A(n23), .B(rollover_val[9]), .Y(N15) );
  AOI21X1 U25 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n2), .Y(n1) );
  OAI21X1 U26 ( .A(n2), .B(n26), .C(n3), .Y(N7) );
  AOI21X1 U27 ( .A(n3), .B(rollover_val[3]), .C(n5), .Y(n4) );
  OAI21X1 U28 ( .A(n5), .B(n25), .C(n6), .Y(N9) );
  AOI21X1 U29 ( .A(n6), .B(rollover_val[5]), .C(n8), .Y(n7) );
  OAI21X1 U73 ( .A(n8), .B(n28), .C(n9), .Y(N11) );
  AOI21X1 U74 ( .A(n9), .B(rollover_val[7]), .C(n22), .Y(n10) );
  OAI21X1 U75 ( .A(n22), .B(n27), .C(n23), .Y(N13) );
  AOI21X1 U76 ( .A(n23), .B(rollover_val[9]), .C(N15), .Y(n24) );
  INVX2 U77 ( .A(rollover_val[4]), .Y(n25) );
  INVX2 U78 ( .A(rollover_val[2]), .Y(n26) );
  INVX2 U79 ( .A(rollover_val[0]), .Y(N5) );
  INVX2 U80 ( .A(n1), .Y(N6) );
  INVX2 U81 ( .A(rollover_val[8]), .Y(n27) );
  INVX2 U82 ( .A(rollover_val[6]), .Y(n28) );
  INVX2 U83 ( .A(n7), .Y(N10) );
  INVX2 U84 ( .A(n10), .Y(N12) );
  INVX2 U85 ( .A(n24), .Y(N14) );
  INVX2 U86 ( .A(n4), .Y(N8) );
  NAND2X1 U87 ( .A(count_out[9]), .B(n98), .Y(n92) );
  NAND3X1 U88 ( .A(n92), .B(n103), .C(rollover_val[8]), .Y(n29) );
  OAI21X1 U89 ( .A(count_out[9]), .B(n98), .C(n29), .Y(n96) );
  NAND2X1 U90 ( .A(count_out[3]), .B(n101), .Y(n31) );
  OAI21X1 U91 ( .A(n112), .B(rollover_val[2]), .C(n31), .Y(n30) );
  NAND3X1 U92 ( .A(n31), .B(n112), .C(rollover_val[2]), .Y(n32) );
  OAI21X1 U93 ( .A(count_out[3]), .B(n101), .C(n32), .Y(n82) );
  NAND2X1 U94 ( .A(count_out[5]), .B(n100), .Y(n85) );
  OAI21X1 U95 ( .A(n107), .B(rollover_val[4]), .C(n85), .Y(n33) );
  OAI21X1 U96 ( .A(n109), .B(n82), .C(n108), .Y(n91) );
  AOI21X1 U97 ( .A(count_out[1]), .B(n97), .C(count_out[0]), .Y(n78) );
  NAND2X1 U98 ( .A(n78), .B(rollover_val[0]), .Y(n79) );
  OAI21X1 U99 ( .A(count_out[1]), .B(n97), .C(n79), .Y(n81) );
  NAND2X1 U100 ( .A(count_out[7]), .B(n99), .Y(n83) );
  OAI21X1 U101 ( .A(rollover_val[6]), .B(n105), .C(n83), .Y(n80) );
  OAI21X1 U102 ( .A(n82), .B(n81), .C(n106), .Y(n90) );
  NAND3X1 U103 ( .A(n83), .B(n105), .C(rollover_val[6]), .Y(n84) );
  OAI21X1 U104 ( .A(count_out[7]), .B(n99), .C(n84), .Y(n88) );
  NAND3X1 U105 ( .A(n85), .B(n107), .C(rollover_val[4]), .Y(n86) );
  OAI21X1 U106 ( .A(count_out[5]), .B(n100), .C(n86), .Y(n87) );
  OAI22X1 U107 ( .A(n88), .B(n87), .C(n106), .D(n88), .Y(n89) );
  OAI21X1 U108 ( .A(n91), .B(n90), .C(n89), .Y(n95) );
  NOR2X1 U109 ( .A(rollover_val[8]), .B(n103), .Y(n93) );
  OAI21X1 U110 ( .A(n102), .B(n93), .C(n104), .Y(n94) );
  OAI21X1 U111 ( .A(n96), .B(n95), .C(n94), .Y(N17) );
  INVX2 U112 ( .A(rollover_val[1]), .Y(n97) );
  INVX2 U113 ( .A(rollover_val[9]), .Y(n98) );
  INVX2 U114 ( .A(rollover_val[7]), .Y(n99) );
  INVX2 U115 ( .A(rollover_val[5]), .Y(n100) );
  INVX2 U116 ( .A(rollover_val[3]), .Y(n101) );
  INVX2 U117 ( .A(n92), .Y(n102) );
  INVX2 U118 ( .A(count_out[8]), .Y(n103) );
  INVX2 U119 ( .A(n96), .Y(n104) );
  INVX2 U120 ( .A(count_out[6]), .Y(n105) );
  INVX2 U121 ( .A(n80), .Y(n106) );
  INVX2 U122 ( .A(count_out[4]), .Y(n107) );
  INVX2 U123 ( .A(n33), .Y(n108) );
  INVX2 U124 ( .A(n30), .Y(n109) );
  INVX2 U125 ( .A(count_out[0]), .Y(n110) );
  INVX2 U126 ( .A(count_out[1]), .Y(n111) );
  INVX2 U127 ( .A(count_out[2]), .Y(n112) );
  INVX2 U128 ( .A(count_out[3]), .Y(n113) );
  INVX2 U129 ( .A(count_out[5]), .Y(n114) );
  INVX2 U130 ( .A(count_out[7]), .Y(n115) );
  INVX2 U131 ( .A(count_out[9]), .Y(n116) );
  INVX2 U132 ( .A(n49), .Y(n117) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 COUNTER ( .clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module magnitude_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
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
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n33, n34;

  OAI21X1 U18 ( .A(n1), .B(n9), .C(n17), .Y(out[9]) );
  NAND2X1 U19 ( .A(in[16]), .B(N27), .Y(n17) );
  OAI21X1 U20 ( .A(n1), .B(n10), .C(n18), .Y(out[8]) );
  NAND2X1 U21 ( .A(N26), .B(in[16]), .Y(n18) );
  OAI21X1 U22 ( .A(n1), .B(n11), .C(n19), .Y(out[7]) );
  NAND2X1 U23 ( .A(N25), .B(in[16]), .Y(n19) );
  OAI21X1 U24 ( .A(n1), .B(n12), .C(n20), .Y(out[6]) );
  NAND2X1 U25 ( .A(N24), .B(in[16]), .Y(n20) );
  OAI21X1 U26 ( .A(n1), .B(n13), .C(n21), .Y(out[5]) );
  NAND2X1 U27 ( .A(N23), .B(in[16]), .Y(n21) );
  OAI21X1 U28 ( .A(n1), .B(n14), .C(n22), .Y(out[4]) );
  NAND2X1 U29 ( .A(N22), .B(in[16]), .Y(n22) );
  OAI21X1 U30 ( .A(n1), .B(n15), .C(n23), .Y(out[3]) );
  NAND2X1 U31 ( .A(N21), .B(in[16]), .Y(n23) );
  OAI21X1 U32 ( .A(n1), .B(n16), .C(n24), .Y(out[2]) );
  NAND2X1 U33 ( .A(N20), .B(n1), .Y(n24) );
  OAI21X1 U34 ( .A(n1), .B(n33), .C(n25), .Y(out[1]) );
  NAND2X1 U35 ( .A(N19), .B(n1), .Y(n25) );
  OAI21X1 U36 ( .A(n1), .B(n3), .C(n26), .Y(out[15]) );
  NAND2X1 U37 ( .A(N33), .B(in[16]), .Y(n26) );
  OAI21X1 U38 ( .A(n1), .B(n4), .C(n27), .Y(out[14]) );
  NAND2X1 U39 ( .A(N32), .B(n1), .Y(n27) );
  OAI21X1 U40 ( .A(n1), .B(n5), .C(n28), .Y(out[13]) );
  NAND2X1 U41 ( .A(N31), .B(in[16]), .Y(n28) );
  OAI21X1 U42 ( .A(n1), .B(n6), .C(n29), .Y(out[12]) );
  NAND2X1 U43 ( .A(N30), .B(in[16]), .Y(n29) );
  OAI21X1 U44 ( .A(in[16]), .B(n7), .C(n30), .Y(out[11]) );
  NAND2X1 U45 ( .A(N29), .B(in[16]), .Y(n30) );
  OAI21X1 U46 ( .A(in[16]), .B(n8), .C(n31), .Y(out[10]) );
  NAND2X1 U47 ( .A(N28), .B(in[16]), .Y(n31) );
  OAI21X1 U48 ( .A(in[16]), .B(n34), .C(n32), .Y(out[0]) );
  NAND2X1 U49 ( .A(N18), .B(in[16]), .Y(n32) );
  magnitude_DW01_inc_0 add_15 ( .A({n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, 
        n13, n14, n15, n16, n33, n34}), .SUM({N33, N32, N31, N30, N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20, N19, N18}) );
  INVX2 U2 ( .A(n2), .Y(n1) );
  INVX2 U3 ( .A(in[16]), .Y(n2) );
  INVX2 U4 ( .A(in[15]), .Y(n3) );
  INVX2 U5 ( .A(in[14]), .Y(n4) );
  INVX2 U6 ( .A(in[13]), .Y(n5) );
  INVX2 U7 ( .A(in[12]), .Y(n6) );
  INVX2 U8 ( .A(in[11]), .Y(n7) );
  INVX2 U9 ( .A(in[10]), .Y(n8) );
  INVX2 U10 ( .A(in[9]), .Y(n9) );
  INVX2 U11 ( .A(in[8]), .Y(n10) );
  INVX2 U12 ( .A(in[7]), .Y(n11) );
  INVX2 U13 ( .A(in[6]), .Y(n12) );
  INVX2 U14 ( .A(in[5]), .Y(n13) );
  INVX2 U15 ( .A(in[4]), .Y(n14) );
  INVX2 U16 ( .A(in[3]), .Y(n15) );
  INVX2 U17 ( .A(in[2]), .Y(n16) );
  INVX2 U50 ( .A(in[1]), .Y(n33) );
  INVX2 U51 ( .A(in[0]), .Y(n34) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   lc, dr, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] in;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_low_1 LC ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc) );
  sync_low_0 DR ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr) );
  controller CONTROL ( .clk(clk), .n_rst(n_reset), .dr(dr), .lc(lc), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), 
        .op(op), .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(src2), 
        .dest(dest), .err(err) );
  datapath DATAPATH ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, 
        src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(in), .overflow(overflow) );
  counter COUNT ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  magnitude MAG ( .in(in), .out(fir_out) );
endmodule

