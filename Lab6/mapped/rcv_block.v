/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Sep 30 20:09:25 2019
/////////////////////////////////////////////////////////////


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
  NOR2X1 U7 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX2 U6 ( .A(old_sample), .Y(n4) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n33, n34, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n26;
  wire   [3:0] state;

  DFFSR \state_reg[0]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  INVX2 U6 ( .A(n8), .Y(n18) );
  AND2X2 U7 ( .A(n8), .B(n10), .Y(n4) );
  INVX2 U8 ( .A(n9), .Y(n10) );
  INVX1 U9 ( .A(enable_timer), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n6) );
  INVX2 U11 ( .A(state[1]), .Y(n7) );
  INVX4 U12 ( .A(n7), .Y(n8) );
  INVX2 U13 ( .A(state[0]), .Y(n9) );
  INVX2 U14 ( .A(state[2]), .Y(n21) );
  NAND2X1 U15 ( .A(state[2]), .B(n18), .Y(n19) );
  NAND2X1 U16 ( .A(n4), .B(n21), .Y(n20) );
  NAND3X1 U17 ( .A(n10), .B(n18), .C(n21), .Y(n24) );
  NAND3X1 U18 ( .A(n19), .B(n20), .C(n24), .Y(n17) );
  INVX2 U19 ( .A(n20), .Y(n11) );
  NOR3X1 U20 ( .A(n10), .B(framing_error), .C(n19), .Y(n14) );
  NOR2X1 U21 ( .A(n11), .B(n14), .Y(n12) );
  OAI21X1 U22 ( .A(n21), .B(n17), .C(n12), .Y(n33) );
  AOI21X1 U23 ( .A(start_bit_detected), .B(n18), .C(n10), .Y(n16) );
  NAND3X1 U24 ( .A(n8), .B(n9), .C(n21), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(enable_timer) );
  AOI21X1 U26 ( .A(packet_done), .B(n6), .C(n14), .Y(n15) );
  OAI21X1 U27 ( .A(n16), .B(n17), .C(n15), .Y(n34) );
  OAI21X1 U28 ( .A(n18), .B(n17), .C(n24), .Y(n26) );
  NOR2X1 U29 ( .A(n9), .B(n19), .Y(load_buffer) );
  XOR2X1 U30 ( .A(n9), .B(n8), .Y(n23) );
  OAI21X1 U31 ( .A(n4), .B(n21), .C(n20), .Y(n22) );
  AND2X2 U32 ( .A(n23), .B(n22), .Y(sbc_enable) );
  INVX2 U33 ( .A(n24), .Y(sbc_clear) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n63, n64, n65, N7, N9, n48, n53, n54, n55, n56, n57, n58, n2, n3, n4,
         n5, n8, n9, n10, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n49, n50, n51, n52, n59, n60,
         n61, n62;

  DFFSR \count_out_reg[0]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n64)
         );
  DFFSR \count_out_reg[1]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n63)
         );
  DFFSR \count_out_reg[2]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n65)
         );
  NOR2X1 U49 ( .A(N9), .B(n53), .Y(n48) );
  BUFX2 U8 ( .A(n65), .Y(rollover_flag) );
  AND2X2 U9 ( .A(n63), .B(n64), .Y(n2) );
  XNOR2X1 U10 ( .A(n59), .B(count_out[3]), .Y(n21) );
  XNOR2X1 U11 ( .A(n50), .B(n63), .Y(n22) );
  XNOR2X1 U12 ( .A(n64), .B(rollover_val[0]), .Y(n53) );
  INVX1 U13 ( .A(n29), .Y(n3) );
  INVX2 U14 ( .A(n3), .Y(n4) );
  MUX2X1 U15 ( .B(n33), .A(n34), .S(n20), .Y(n55) );
  OR2X2 U16 ( .A(count_enable), .B(clear), .Y(n37) );
  BUFX2 U17 ( .A(n37), .Y(n5) );
  INVX2 U18 ( .A(n38), .Y(count_out[0]) );
  INVX1 U19 ( .A(n64), .Y(n38) );
  INVX2 U20 ( .A(n9), .Y(count_out[1]) );
  INVX1 U21 ( .A(n63), .Y(n9) );
  INVX2 U22 ( .A(n32), .Y(n8) );
  INVX2 U23 ( .A(n30), .Y(n32) );
  NAND2X1 U24 ( .A(n32), .B(n2), .Y(n42) );
  INVX1 U25 ( .A(n40), .Y(n41) );
  INVX1 U26 ( .A(clear), .Y(n44) );
  INVX2 U27 ( .A(count_out[3]), .Y(n20) );
  NOR2X1 U28 ( .A(n61), .B(n63), .Y(n17) );
  OAI21X1 U29 ( .A(rollover_val[1]), .B(n9), .C(rollover_val[0]), .Y(n10) );
  OAI22X1 U30 ( .A(n60), .B(count_out[2]), .C(count_out[0]), .D(n10), .Y(n16)
         );
  INVX2 U31 ( .A(count_out[2]), .Y(n31) );
  OAI22X1 U32 ( .A(n17), .B(n16), .C(rollover_val[2]), .D(n31), .Y(n18) );
  OAI21X1 U33 ( .A(n62), .B(count_out[3]), .C(n18), .Y(n19) );
  OAI21X1 U34 ( .A(rollover_val[3]), .B(n20), .C(n19), .Y(n25) );
  XOR2X1 U35 ( .A(n31), .B(N7), .Y(n24) );
  NOR2X1 U36 ( .A(n22), .B(n21), .Y(n23) );
  NAND3X1 U37 ( .A(n48), .B(n24), .C(n23), .Y(n43) );
  NAND2X1 U38 ( .A(n25), .B(n43), .Y(n35) );
  NAND3X1 U39 ( .A(n35), .B(n44), .C(n37), .Y(n30) );
  NAND2X1 U40 ( .A(n32), .B(count_out[0]), .Y(n27) );
  OAI21X1 U41 ( .A(n64), .B(n30), .C(n5), .Y(n26) );
  INVX2 U42 ( .A(n26), .Y(n29) );
  MUX2X1 U43 ( .B(n27), .A(n4), .S(count_out[1]), .Y(n57) );
  INVX2 U44 ( .A(n42), .Y(n28) );
  NAND2X1 U45 ( .A(n28), .B(count_out[2]), .Y(n34) );
  OAI21X1 U46 ( .A(count_out[1]), .B(n8), .C(n29), .Y(n40) );
  AOI21X1 U47 ( .A(n32), .B(n31), .C(n40), .Y(n33) );
  INVX2 U48 ( .A(n35), .Y(n36) );
  OAI21X1 U50 ( .A(n36), .B(n38), .C(n44), .Y(n39) );
  INVX2 U51 ( .A(n5), .Y(n46) );
  MUX2X1 U52 ( .B(n39), .A(n38), .S(n46), .Y(n58) );
  MUX2X1 U53 ( .B(n42), .A(n41), .S(count_out[2]), .Y(n56) );
  INVX2 U54 ( .A(n43), .Y(n45) );
  NAND2X1 U55 ( .A(n45), .B(n44), .Y(n49) );
  INVX2 U56 ( .A(rollover_flag), .Y(n47) );
  MUX2X1 U57 ( .B(n49), .A(n47), .S(n46), .Y(n54) );
  NOR2X1 U58 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n51) );
  AOI21X1 U59 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n51), .Y(n50) );
  NAND2X1 U60 ( .A(n51), .B(n60), .Y(n52) );
  OAI21X1 U61 ( .A(n51), .B(n60), .C(n52), .Y(N7) );
  NOR2X1 U62 ( .A(n52), .B(rollover_val[3]), .Y(N9) );
  AOI21X1 U63 ( .A(n52), .B(rollover_val[3]), .C(N9), .Y(n59) );
  INVX2 U64 ( .A(rollover_val[2]), .Y(n60) );
  INVX2 U65 ( .A(rollover_val[1]), .Y(n61) );
  INVX2 U66 ( .A(rollover_val[3]), .Y(n62) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n71, n72, N7, N9, n1, n2, n3, n4, n6, n8, n9, n10, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n49, n50, n51, n52, n59, n60, n61, n62, n63, n64, n65;

  DFFSR \count_out_reg[0]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n72)
         );
  DFFSR \count_out_reg[1]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n71)
         );
  DFFSR \count_out_reg[2]  ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U49 ( .A(N9), .B(n64), .Y(n65) );
  INVX1 U8 ( .A(n71), .Y(n4) );
  INVX2 U9 ( .A(clear), .Y(n42) );
  AND2X2 U10 ( .A(n3), .B(n25), .Y(n1) );
  INVX1 U11 ( .A(n41), .Y(n2) );
  INVX2 U12 ( .A(n6), .Y(count_out[0]) );
  XNOR2X1 U13 ( .A(n50), .B(count_out[3]), .Y(n20) );
  XNOR2X1 U14 ( .A(n46), .B(n71), .Y(n21) );
  XNOR2X1 U15 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n64) );
  INVX2 U16 ( .A(count_out[0]), .Y(n36) );
  MUX2X1 U17 ( .B(n32), .A(n33), .S(n19), .Y(n62) );
  INVX1 U18 ( .A(count_out[3]), .Y(n19) );
  AND2X2 U19 ( .A(n34), .B(n42), .Y(n3) );
  INVX1 U20 ( .A(n34), .Y(n35) );
  INVX1 U21 ( .A(n4), .Y(count_out[1]) );
  INVX2 U22 ( .A(n72), .Y(n6) );
  OR2X2 U23 ( .A(count_enable), .B(clear), .Y(n25) );
  INVX2 U24 ( .A(rollover_val[1]), .Y(n9) );
  NAND2X1 U25 ( .A(rollover_val[0]), .B(n6), .Y(n8) );
  AOI21X1 U26 ( .A(n71), .B(n9), .C(n8), .Y(n16) );
  OAI22X1 U27 ( .A(n9), .B(count_out[1]), .C(n52), .D(count_out[2]), .Y(n10)
         );
  INVX2 U28 ( .A(count_out[2]), .Y(n31) );
  OAI22X1 U29 ( .A(n16), .B(n10), .C(rollover_val[2]), .D(n31), .Y(n17) );
  OAI21X1 U30 ( .A(n51), .B(count_out[3]), .C(n17), .Y(n18) );
  OAI21X1 U31 ( .A(rollover_val[3]), .B(n19), .C(n18), .Y(n24) );
  XOR2X1 U32 ( .A(n31), .B(N7), .Y(n23) );
  NOR2X1 U33 ( .A(n21), .B(n20), .Y(n22) );
  NAND3X1 U34 ( .A(n65), .B(n23), .C(n22), .Y(n41) );
  NAND2X1 U35 ( .A(n24), .B(n41), .Y(n34) );
  NAND2X1 U36 ( .A(n3), .B(n25), .Y(n30) );
  NAND2X1 U37 ( .A(n1), .B(count_out[0]), .Y(n27) );
  INVX2 U38 ( .A(n25), .Y(n43) );
  AOI21X1 U39 ( .A(n1), .B(n36), .C(n43), .Y(n26) );
  MUX2X1 U40 ( .B(n27), .A(n26), .S(count_out[1]), .Y(n60) );
  NAND3X1 U41 ( .A(count_out[0]), .B(count_out[1]), .C(n1), .Y(n40) );
  INVX2 U42 ( .A(n40), .Y(n28) );
  NAND2X1 U43 ( .A(n28), .B(count_out[2]), .Y(n33) );
  AOI21X1 U44 ( .A(n3), .B(n36), .C(n43), .Y(n29) );
  OAI21X1 U45 ( .A(count_out[1]), .B(n30), .C(n29), .Y(n38) );
  AOI21X1 U46 ( .A(n1), .B(n31), .C(n38), .Y(n32) );
  OAI21X1 U47 ( .A(n35), .B(n36), .C(n42), .Y(n37) );
  MUX2X1 U48 ( .B(n37), .A(n36), .S(n43), .Y(n59) );
  INVX2 U50 ( .A(n38), .Y(n39) );
  MUX2X1 U51 ( .B(n40), .A(n39), .S(count_out[2]), .Y(n61) );
  NAND2X1 U52 ( .A(n2), .B(n42), .Y(n45) );
  INVX2 U53 ( .A(rollover_flag), .Y(n44) );
  MUX2X1 U54 ( .B(n45), .A(n44), .S(n43), .Y(n63) );
  NOR2X1 U55 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n47) );
  AOI21X1 U56 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n47), .Y(n46) );
  NAND2X1 U57 ( .A(n47), .B(n52), .Y(n49) );
  OAI21X1 U58 ( .A(n47), .B(n52), .C(n49), .Y(N7) );
  NOR2X1 U59 ( .A(n49), .B(rollover_val[3]), .Y(N9) );
  AOI21X1 U60 ( .A(n49), .B(rollover_val[3]), .C(N9), .Y(n50) );
  INVX2 U61 ( .A(rollover_val[3]), .Y(n51) );
  INVX2 U62 ( .A(rollover_val[2]), .Y(n52) );
endmodule


module timer_NUM_CNT_BITS4 ( clk, n_rst, enable_timer, shift_enable, 
        packet_done );
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   _2_net_, n1, n2, n3, n4;

  flex_counter_NUM_CNT_BITS4_1 CT1 ( .clk(clk), .n_rst(n_rst), .clear(n3), 
        .count_enable(n2), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4_0 CT2 ( .clk(clk), .n_rst(n_rst), .clear(_2_net_), 
        .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
  INVX1 U3 ( .A(enable_timer), .Y(n1) );
  INVX1 U4 ( .A(n1), .Y(n2) );
  NAND2X1 U5 ( .A(enable_timer), .B(n4), .Y(n3) );
  INVX2 U6 ( .A(packet_done), .Y(n4) );
  NAND2X1 U7 ( .A(n4), .B(enable_timer), .Y(_2_net_) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n3, n11, n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n4, n5,
         n6, n7, n8, n9, n10;

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
  OAI21X1 U2 ( .A(n10), .B(n1), .C(n3), .Y(n13) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n1), .Y(n3) );
  OAI22X1 U4 ( .A(n1), .B(n9), .C(shift_enable), .D(n10), .Y(n15) );
  OAI22X1 U6 ( .A(n1), .B(n8), .C(shift_enable), .D(n9), .Y(n17) );
  OAI22X1 U8 ( .A(n1), .B(n7), .C(shift_enable), .D(n8), .Y(n19) );
  OAI22X1 U10 ( .A(n1), .B(n6), .C(shift_enable), .D(n7), .Y(n21) );
  OAI22X1 U12 ( .A(n1), .B(n5), .C(shift_enable), .D(n6), .Y(n23) );
  OAI22X1 U14 ( .A(n1), .B(n4), .C(shift_enable), .D(n5), .Y(n25) );
  OAI22X1 U16 ( .A(n1), .B(n2), .C(shift_enable), .D(n4), .Y(n27) );
  OAI21X1 U19 ( .A(shift_enable), .B(n2), .C(n11), .Y(n29) );
  NAND2X1 U20 ( .A(serial_in), .B(shift_enable), .Y(n11) );
  INVX1 U5 ( .A(shift_enable), .Y(n1) );
  INVX2 U7 ( .A(parallel_out[8]), .Y(n2) );
  INVX2 U9 ( .A(parallel_out[7]), .Y(n4) );
  INVX2 U11 ( .A(parallel_out[6]), .Y(n5) );
  INVX2 U13 ( .A(parallel_out[5]), .Y(n6) );
  INVX2 U15 ( .A(parallel_out[4]), .Y(n7) );
  INVX2 U17 ( .A(parallel_out[3]), .Y(n8) );
  INVX2 U18 ( .A(parallel_out[2]), .Y(n9) );
  INVX2 U21 ( .A(parallel_out[1]), .Y(n10) );
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
  wire   n4, n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U5 ( .A(sbc_clear), .B(n4), .Y(n5) );
  AOI22X1 U6 ( .A(framing_error), .B(n3), .C(sbc_enable), .D(n2), .Y(n4) );
  INVX2 U3 ( .A(stop_bit), .Y(n2) );
  INVX2 U4 ( .A(sbc_enable), .Y(n3) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n30, n31, n2, n11, n15, n17, n19,
         n21, n23, n25, n27, n29, n32;

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
  AOI22X1 U4 ( .A(rx_data[0]), .B(n2), .C(packet_data[0]), .D(n11), .Y(n1) );
  AOI22X1 U6 ( .A(rx_data[1]), .B(n2), .C(packet_data[1]), .D(n11), .Y(n3) );
  AOI22X1 U8 ( .A(rx_data[2]), .B(n2), .C(packet_data[2]), .D(n11), .Y(n4) );
  AOI22X1 U10 ( .A(rx_data[3]), .B(n2), .C(packet_data[3]), .D(n11), .Y(n5) );
  AOI22X1 U12 ( .A(rx_data[4]), .B(n2), .C(packet_data[4]), .D(n11), .Y(n6) );
  AOI22X1 U14 ( .A(rx_data[5]), .B(n2), .C(packet_data[5]), .D(n11), .Y(n7) );
  AOI22X1 U16 ( .A(rx_data[6]), .B(n2), .C(packet_data[6]), .D(n11), .Y(n8) );
  AOI22X1 U18 ( .A(rx_data[7]), .B(n2), .C(packet_data[7]), .D(n11), .Y(n9) );
  NOR2X1 U19 ( .A(data_read), .B(n10), .Y(n30) );
  AOI21X1 U20 ( .A(data_ready), .B(n11), .C(overrun_error), .Y(n10) );
  OAI21X1 U21 ( .A(data_read), .B(n32), .C(n2), .Y(n31) );
  INVX2 U3 ( .A(n2), .Y(n11) );
  INVX2 U5 ( .A(load_buffer), .Y(n2) );
  INVX2 U7 ( .A(n9), .Y(n15) );
  INVX2 U9 ( .A(n8), .Y(n17) );
  INVX2 U11 ( .A(n7), .Y(n19) );
  INVX2 U13 ( .A(n6), .Y(n21) );
  INVX2 U15 ( .A(n5), .Y(n23) );
  INVX2 U17 ( .A(n4), .Y(n25) );
  INVX2 U22 ( .A(n3), .Y(n27) );
  INVX2 U23 ( .A(n1), .Y(n29) );
  INVX2 U34 ( .A(data_ready), .Y(n32) );
endmodule


module rcv_block ( clk, n_rst, data_read, serial_in, rx_data, data_ready, 
        overrun_error, framing_error );
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
  timer_NUM_CNT_BITS4 TIMING_CONTROLLER ( .clk(clk), .n_rst(n_rst), 
        .enable_timer(enable_timer), .shift_enable(shift_enable), 
        .packet_done(packet_done) );
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

