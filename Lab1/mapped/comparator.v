/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Aug 20 17:16:42 2019
/////////////////////////////////////////////////////////////


module comparator_DW01_cmp6_0 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [15:0] A;
  input [15:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98;

  INVX2 U1 ( .A(n30), .Y(n1) );
  INVX2 U2 ( .A(n29), .Y(n2) );
  INVX2 U3 ( .A(A[15]), .Y(n3) );
  INVX2 U4 ( .A(n31), .Y(n4) );
  INVX2 U5 ( .A(n71), .Y(n5) );
  INVX2 U6 ( .A(n36), .Y(n6) );
  INVX2 U7 ( .A(A[12]), .Y(n7) );
  INVX2 U8 ( .A(n39), .Y(n8) );
  INVX2 U9 ( .A(A[10]), .Y(n9) );
  INVX2 U10 ( .A(n45), .Y(n10) );
  INVX2 U11 ( .A(A[8]), .Y(n11) );
  INVX2 U12 ( .A(n51), .Y(n12) );
  INVX2 U13 ( .A(A[6]), .Y(n13) );
  INVX2 U14 ( .A(n57), .Y(n14) );
  INVX2 U15 ( .A(A[4]), .Y(n15) );
  INVX2 U16 ( .A(n63), .Y(n16) );
  INVX2 U17 ( .A(A[2]), .Y(n17) );
  INVX2 U18 ( .A(n70), .Y(n18) );
  INVX2 U19 ( .A(A[1]), .Y(n19) );
  INVX2 U20 ( .A(n98), .Y(n20) );
  INVX2 U21 ( .A(B[14]), .Y(n21) );
  INVX2 U22 ( .A(B[13]), .Y(n22) );
  INVX2 U23 ( .A(B[11]), .Y(n23) );
  INVX2 U24 ( .A(B[9]), .Y(n24) );
  INVX2 U25 ( .A(B[7]), .Y(n25) );
  INVX2 U26 ( .A(B[5]), .Y(n26) );
  INVX2 U27 ( .A(B[3]), .Y(n27) );
  INVX2 U28 ( .A(B[0]), .Y(n28) );
  OAI21X1 U29 ( .A(n29), .B(n4), .C(n30), .Y(LT) );
  OAI22X1 U30 ( .A(n5), .B(n32), .C(A[14]), .D(n21), .Y(n31) );
  OAI21X1 U31 ( .A(n33), .B(n34), .C(n35), .Y(n32) );
  OAI21X1 U32 ( .A(n36), .B(n37), .C(n38), .Y(n34) );
  OAI21X1 U33 ( .A(n39), .B(n40), .C(n41), .Y(n37) );
  OAI21X1 U34 ( .A(n42), .B(n43), .C(n44), .Y(n40) );
  OAI21X1 U35 ( .A(n45), .B(n46), .C(n47), .Y(n43) );
  OAI21X1 U36 ( .A(n48), .B(n49), .C(n50), .Y(n46) );
  OAI21X1 U37 ( .A(n51), .B(n52), .C(n53), .Y(n49) );
  OAI21X1 U38 ( .A(n54), .B(n55), .C(n56), .Y(n52) );
  OAI21X1 U39 ( .A(n57), .B(n58), .C(n59), .Y(n55) );
  OAI21X1 U40 ( .A(n60), .B(n61), .C(n62), .Y(n58) );
  OAI21X1 U41 ( .A(n63), .B(n64), .C(n65), .Y(n61) );
  OAI21X1 U42 ( .A(n66), .B(n67), .C(n68), .Y(n64) );
  OAI21X1 U43 ( .A(n69), .B(n19), .C(n18), .Y(n67) );
  AOI21X1 U44 ( .A(n19), .B(n69), .C(B[1]), .Y(n70) );
  NOR2X1 U45 ( .A(n28), .B(A[0]), .Y(n69) );
  OAI21X1 U46 ( .A(n1), .B(n72), .C(n2), .Y(GT) );
  NOR2X1 U47 ( .A(n3), .B(B[15]), .Y(n29) );
  AOI22X1 U48 ( .A(A[14]), .B(n21), .C(n73), .D(n71), .Y(n72) );
  XOR2X1 U49 ( .A(A[14]), .B(n21), .Y(n71) );
  AOI21X1 U50 ( .A(n74), .B(n75), .C(n33), .Y(n73) );
  NOR2X1 U51 ( .A(n22), .B(A[13]), .Y(n33) );
  NAND3X1 U52 ( .A(n76), .B(n8), .C(n6), .Y(n75) );
  NAND2X1 U53 ( .A(n77), .B(n38), .Y(n36) );
  NAND2X1 U54 ( .A(B[12]), .B(n7), .Y(n38) );
  NOR2X1 U55 ( .A(n23), .B(A[11]), .Y(n39) );
  OAI21X1 U56 ( .A(n42), .B(n78), .C(n79), .Y(n76) );
  AND2X1 U57 ( .A(n80), .B(n41), .Y(n79) );
  NAND2X1 U58 ( .A(A[11]), .B(n23), .Y(n41) );
  NAND2X1 U59 ( .A(n81), .B(n10), .Y(n78) );
  NOR2X1 U60 ( .A(n24), .B(A[9]), .Y(n45) );
  OAI21X1 U61 ( .A(n48), .B(n82), .C(n83), .Y(n81) );
  AND2X1 U62 ( .A(n84), .B(n47), .Y(n83) );
  NAND2X1 U63 ( .A(A[9]), .B(n24), .Y(n47) );
  NAND2X1 U64 ( .A(n85), .B(n12), .Y(n82) );
  NOR2X1 U65 ( .A(n25), .B(A[7]), .Y(n51) );
  OAI21X1 U66 ( .A(n54), .B(n86), .C(n87), .Y(n85) );
  AND2X1 U67 ( .A(n88), .B(n53), .Y(n87) );
  NAND2X1 U68 ( .A(A[7]), .B(n25), .Y(n53) );
  NAND2X1 U69 ( .A(n89), .B(n14), .Y(n86) );
  NOR2X1 U70 ( .A(n26), .B(A[5]), .Y(n57) );
  OAI21X1 U71 ( .A(n60), .B(n90), .C(n91), .Y(n89) );
  AND2X1 U72 ( .A(n92), .B(n59), .Y(n91) );
  NAND2X1 U73 ( .A(A[5]), .B(n26), .Y(n59) );
  NAND2X1 U74 ( .A(n93), .B(n16), .Y(n90) );
  NOR2X1 U75 ( .A(n27), .B(A[3]), .Y(n63) );
  OAI21X1 U76 ( .A(n66), .B(n94), .C(n95), .Y(n93) );
  AND2X1 U77 ( .A(n96), .B(n65), .Y(n95) );
  NAND2X1 U78 ( .A(A[3]), .B(n27), .Y(n65) );
  OAI21X1 U79 ( .A(A[1]), .B(n20), .C(n97), .Y(n94) );
  OAI21X1 U80 ( .A(n19), .B(n98), .C(B[1]), .Y(n97) );
  NAND2X1 U81 ( .A(A[0]), .B(n28), .Y(n98) );
  NAND2X1 U82 ( .A(n96), .B(n68), .Y(n66) );
  NAND2X1 U83 ( .A(B[2]), .B(n17), .Y(n68) );
  OR2X1 U84 ( .A(n17), .B(B[2]), .Y(n96) );
  NAND2X1 U85 ( .A(n92), .B(n62), .Y(n60) );
  NAND2X1 U86 ( .A(B[4]), .B(n15), .Y(n62) );
  OR2X1 U87 ( .A(n15), .B(B[4]), .Y(n92) );
  NAND2X1 U88 ( .A(n88), .B(n56), .Y(n54) );
  NAND2X1 U89 ( .A(B[6]), .B(n13), .Y(n56) );
  OR2X1 U90 ( .A(n13), .B(B[6]), .Y(n88) );
  NAND2X1 U91 ( .A(n84), .B(n50), .Y(n48) );
  NAND2X1 U92 ( .A(B[8]), .B(n11), .Y(n50) );
  OR2X1 U93 ( .A(n11), .B(B[8]), .Y(n84) );
  NAND2X1 U94 ( .A(n80), .B(n44), .Y(n42) );
  NAND2X1 U95 ( .A(B[10]), .B(n9), .Y(n44) );
  OR2X1 U96 ( .A(n9), .B(B[10]), .Y(n80) );
  AND2X1 U97 ( .A(n77), .B(n35), .Y(n74) );
  NAND2X1 U98 ( .A(A[13]), .B(n22), .Y(n35) );
  OR2X1 U99 ( .A(n7), .B(B[12]), .Y(n77) );
  NAND2X1 U100 ( .A(B[15]), .B(n3), .Y(n30) );
endmodule


module comparator ( a, b, gt, lt, eq );
  input [15:0] a;
  input [15:0] b;
  output gt, lt, eq;
  wire   N3, n8;

  comparator_DW01_cmp6_0 r299 ( .A(a), .B(b), .TC(1'b0), .LT(N3), .GT(gt) );
  NOR2X1 U8 ( .A(gt), .B(n8), .Y(lt) );
  INVX1 U9 ( .A(N3), .Y(n8) );
  NOR2X1 U10 ( .A(gt), .B(N3), .Y(eq) );
endmodule

