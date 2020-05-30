/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct 15 17:23:20 2019
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
         n216, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n443;
  wire   [1:0] state;

  DFFSR \state_reg[0]  ( .D(n440), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(n441), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
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
  AND2X2 U333 ( .A(paddr[2]), .B(n401), .Y(n327) );
  BUFX2 U334 ( .A(n328), .Y(n289) );
  INVX2 U335 ( .A(paddr[0]), .Y(n443) );
  NOR2X1 U336 ( .A(n401), .B(paddr[2]), .Y(n326) );
  NOR2X1 U337 ( .A(paddr[2]), .B(paddr[1]), .Y(n328) );
  AOI22X1 U338 ( .A(\Memory[1][0] ), .B(n289), .C(\Memory[5][0] ), .D(n327), 
        .Y(n290) );
  AOI21X1 U339 ( .A(bit_period[8]), .B(n326), .C(n342), .Y(n294) );
  AND2X1 U340 ( .A(paddr[2]), .B(paddr[1]), .Y(n331) );
  AOI22X1 U341 ( .A(\Memory[0][0] ), .B(n289), .C(data_size[0]), .D(n327), .Y(
        n291) );
  OAI21X1 U342 ( .A(n334), .B(n439), .C(n291), .Y(n292) );
  AOI22X1 U343 ( .A(\Memory[6][0] ), .B(n331), .C(n292), .D(n443), .Y(n293) );
  OAI21X1 U344 ( .A(n443), .B(n294), .C(n293), .Y(N151) );
  AOI22X1 U345 ( .A(\Memory[1][1] ), .B(n289), .C(\Memory[5][1] ), .D(n327), 
        .Y(n295) );
  AOI21X1 U346 ( .A(bit_period[9]), .B(n326), .C(n341), .Y(n299) );
  AOI22X1 U347 ( .A(\Memory[0][1] ), .B(n289), .C(data_size[1]), .D(n327), .Y(
        n296) );
  OAI21X1 U348 ( .A(n334), .B(n438), .C(n296), .Y(n297) );
  AOI22X1 U349 ( .A(\Memory[6][1] ), .B(n331), .C(n297), .D(n443), .Y(n298) );
  OAI21X1 U350 ( .A(n443), .B(n299), .C(n298), .Y(N150) );
  AOI22X1 U351 ( .A(\Memory[1][2] ), .B(n289), .C(\Memory[5][2] ), .D(n327), 
        .Y(n300) );
  AOI21X1 U352 ( .A(bit_period[10]), .B(n326), .C(n340), .Y(n304) );
  AOI22X1 U353 ( .A(\Memory[0][2] ), .B(n289), .C(data_size[2]), .D(n327), .Y(
        n301) );
  OAI21X1 U354 ( .A(n334), .B(n437), .C(n301), .Y(n302) );
  AOI22X1 U355 ( .A(\Memory[6][2] ), .B(n331), .C(n302), .D(n443), .Y(n303) );
  OAI21X1 U356 ( .A(n443), .B(n304), .C(n303), .Y(N149) );
  AOI22X1 U357 ( .A(\Memory[1][3] ), .B(n289), .C(\Memory[5][3] ), .D(n327), 
        .Y(n305) );
  AOI21X1 U358 ( .A(bit_period[11]), .B(n326), .C(n339), .Y(n309) );
  AOI22X1 U359 ( .A(\Memory[0][3] ), .B(n289), .C(data_size[3]), .D(n327), .Y(
        n306) );
  OAI21X1 U360 ( .A(n334), .B(n436), .C(n306), .Y(n307) );
  AOI22X1 U361 ( .A(\Memory[6][3] ), .B(n331), .C(n307), .D(n443), .Y(n308) );
  OAI21X1 U362 ( .A(n443), .B(n309), .C(n308), .Y(N148) );
  AOI22X1 U363 ( .A(\Memory[1][4] ), .B(n289), .C(\Memory[5][4] ), .D(n327), 
        .Y(n310) );
  AOI21X1 U364 ( .A(bit_period[12]), .B(n326), .C(n338), .Y(n314) );
  AOI22X1 U365 ( .A(\Memory[0][4] ), .B(n289), .C(\Memory[4][4] ), .D(n327), 
        .Y(n311) );
  OAI21X1 U366 ( .A(n334), .B(n435), .C(n311), .Y(n312) );
  AOI22X1 U367 ( .A(\Memory[6][4] ), .B(n331), .C(n312), .D(n443), .Y(n313) );
  OAI21X1 U368 ( .A(n443), .B(n314), .C(n313), .Y(N147) );
  AOI22X1 U369 ( .A(\Memory[1][5] ), .B(n289), .C(\Memory[5][5] ), .D(n327), 
        .Y(n315) );
  AOI21X1 U370 ( .A(bit_period[13]), .B(n326), .C(n337), .Y(n319) );
  AOI22X1 U371 ( .A(\Memory[0][5] ), .B(n289), .C(\Memory[4][5] ), .D(n327), 
        .Y(n316) );
  OAI21X1 U372 ( .A(n334), .B(n434), .C(n316), .Y(n317) );
  AOI22X1 U373 ( .A(\Memory[6][5] ), .B(n331), .C(n317), .D(n443), .Y(n318) );
  OAI21X1 U374 ( .A(n443), .B(n319), .C(n318), .Y(N146) );
  AOI22X1 U375 ( .A(\Memory[1][6] ), .B(n289), .C(\Memory[5][6] ), .D(n327), 
        .Y(n320) );
  AOI21X1 U376 ( .A(\Memory[3][6] ), .B(n326), .C(n336), .Y(n324) );
  AOI22X1 U377 ( .A(\Memory[0][6] ), .B(n289), .C(\Memory[4][6] ), .D(n327), 
        .Y(n321) );
  OAI21X1 U378 ( .A(n334), .B(n433), .C(n321), .Y(n322) );
  AOI22X1 U379 ( .A(\Memory[6][6] ), .B(n331), .C(n322), .D(n443), .Y(n323) );
  OAI21X1 U380 ( .A(n443), .B(n324), .C(n323), .Y(N145) );
  AOI22X1 U381 ( .A(\Memory[1][7] ), .B(n289), .C(\Memory[5][7] ), .D(n327), 
        .Y(n325) );
  AOI21X1 U382 ( .A(\Memory[3][7] ), .B(n326), .C(n335), .Y(n333) );
  AOI22X1 U383 ( .A(\Memory[0][7] ), .B(n289), .C(\Memory[4][7] ), .D(n327), 
        .Y(n329) );
  OAI21X1 U384 ( .A(n334), .B(n431), .C(n329), .Y(n330) );
  AOI22X1 U385 ( .A(\Memory[6][7] ), .B(n331), .C(n330), .D(n443), .Y(n332) );
  OAI21X1 U386 ( .A(n333), .B(n443), .C(n332), .Y(N103) );
  INVX2 U387 ( .A(n326), .Y(n334) );
  INVX2 U388 ( .A(n325), .Y(n335) );
  INVX2 U389 ( .A(n320), .Y(n336) );
  INVX2 U390 ( .A(n315), .Y(n337) );
  INVX2 U391 ( .A(n310), .Y(n338) );
  INVX2 U392 ( .A(n305), .Y(n339) );
  INVX2 U393 ( .A(n300), .Y(n340) );
  INVX2 U394 ( .A(n295), .Y(n341) );
  INVX2 U395 ( .A(n290), .Y(n342) );
  NOR2X1 U396 ( .A(n343), .B(n344), .Y(pslverr) );
  INVX1 U397 ( .A(n345), .Y(prdata[7]) );
  AOI22X1 U398 ( .A(n346), .B(N103), .C(n347), .D(\Memory[6][7] ), .Y(n345) );
  OAI21X1 U399 ( .A(n348), .B(n349), .C(n350), .Y(prdata[6]) );
  AOI22X1 U400 ( .A(\Memory[6][6] ), .B(n347), .C(n351), .D(\Memory[6][7] ), 
        .Y(n350) );
  INVX1 U401 ( .A(N145), .Y(n349) );
  OAI21X1 U402 ( .A(n348), .B(n352), .C(n353), .Y(prdata[5]) );
  AOI22X1 U403 ( .A(\Memory[6][5] ), .B(n347), .C(n351), .D(\Memory[6][6] ), 
        .Y(n353) );
  INVX1 U404 ( .A(N146), .Y(n352) );
  INVX1 U405 ( .A(n346), .Y(n348) );
  NAND2X1 U406 ( .A(n354), .B(n355), .Y(prdata[4]) );
  AOI22X1 U407 ( .A(n356), .B(\Memory[6][7] ), .C(\Memory[6][4] ), .D(n347), 
        .Y(n355) );
  AOI22X1 U408 ( .A(\Memory[6][5] ), .B(n351), .C(N147), .D(n346), .Y(n354) );
  NAND2X1 U409 ( .A(n357), .B(n358), .Y(prdata[3]) );
  AOI22X1 U410 ( .A(n356), .B(\Memory[6][6] ), .C(\Memory[6][3] ), .D(n347), 
        .Y(n358) );
  AOI22X1 U411 ( .A(\Memory[6][4] ), .B(n351), .C(N148), .D(n346), .Y(n357) );
  NAND2X1 U412 ( .A(n359), .B(n360), .Y(prdata[2]) );
  AOI22X1 U413 ( .A(n356), .B(\Memory[6][5] ), .C(\Memory[6][2] ), .D(n347), 
        .Y(n360) );
  AOI22X1 U414 ( .A(\Memory[6][3] ), .B(n351), .C(N149), .D(n346), .Y(n359) );
  NAND2X1 U415 ( .A(n361), .B(n362), .Y(prdata[1]) );
  AOI22X1 U416 ( .A(\Memory[6][4] ), .B(n356), .C(\Memory[6][1] ), .D(n347), 
        .Y(n362) );
  AOI22X1 U417 ( .A(\Memory[6][2] ), .B(n351), .C(N150), .D(n346), .Y(n361) );
  NAND2X1 U418 ( .A(n363), .B(n364), .Y(prdata[0]) );
  AOI22X1 U419 ( .A(\Memory[6][3] ), .B(n356), .C(\Memory[6][0] ), .D(n347), 
        .Y(n364) );
  NOR2X1 U420 ( .A(n365), .B(n366), .Y(n347) );
  INVX1 U421 ( .A(data_read), .Y(n365) );
  INVX1 U422 ( .A(n367), .Y(n356) );
  NAND3X1 U423 ( .A(data_read), .B(n368), .C(n366), .Y(n367) );
  AOI22X1 U424 ( .A(\Memory[6][1] ), .B(n351), .C(N151), .D(n346), .Y(n363) );
  NOR2X1 U425 ( .A(n369), .B(n370), .Y(n346) );
  INVX1 U426 ( .A(n371), .Y(n351) );
  NAND3X1 U427 ( .A(n366), .B(data_read), .C(data_size[1]), .Y(n371) );
  NOR2X1 U428 ( .A(n372), .B(n373), .Y(n366) );
  NAND3X1 U429 ( .A(data_size[0]), .B(n374), .C(data_size[2]), .Y(n373) );
  NAND3X1 U430 ( .A(n375), .B(n376), .C(n377), .Y(n372) );
  NOR2X1 U431 ( .A(data_size[3]), .B(\Memory[4][7] ), .Y(n377) );
  MUX2X1 U432 ( .B(n378), .A(n379), .S(n380), .Y(\next_Memory[6][7] ) );
  INVX1 U433 ( .A(rx_data[7]), .Y(n378) );
  MUX2X1 U434 ( .B(n381), .A(n382), .S(n380), .Y(\next_Memory[6][6] ) );
  INVX1 U435 ( .A(rx_data[6]), .Y(n381) );
  MUX2X1 U436 ( .B(n383), .A(n384), .S(n380), .Y(\next_Memory[6][5] ) );
  INVX1 U437 ( .A(rx_data[5]), .Y(n383) );
  MUX2X1 U438 ( .B(n385), .A(n386), .S(n380), .Y(\next_Memory[6][4] ) );
  INVX1 U439 ( .A(rx_data[4]), .Y(n385) );
  MUX2X1 U440 ( .B(n387), .A(n388), .S(n380), .Y(\next_Memory[6][3] ) );
  INVX1 U441 ( .A(rx_data[3]), .Y(n387) );
  MUX2X1 U442 ( .B(n389), .A(n390), .S(n380), .Y(\next_Memory[6][2] ) );
  INVX1 U443 ( .A(rx_data[2]), .Y(n389) );
  MUX2X1 U444 ( .B(n391), .A(n392), .S(n380), .Y(\next_Memory[6][1] ) );
  INVX1 U445 ( .A(rx_data[1]), .Y(n391) );
  MUX2X1 U446 ( .B(n393), .A(n394), .S(n380), .Y(\next_Memory[6][0] ) );
  AND2X1 U447 ( .A(n395), .B(n370), .Y(n380) );
  INVX1 U448 ( .A(rx_data[0]), .Y(n393) );
  NOR2X1 U449 ( .A(n379), .B(n396), .Y(\next_Memory[5][7] ) );
  NOR2X1 U450 ( .A(n382), .B(n396), .Y(\next_Memory[5][6] ) );
  NOR2X1 U451 ( .A(n384), .B(n396), .Y(\next_Memory[5][5] ) );
  NOR2X1 U452 ( .A(n386), .B(n396), .Y(\next_Memory[5][4] ) );
  NOR2X1 U453 ( .A(n388), .B(n396), .Y(\next_Memory[5][3] ) );
  NOR2X1 U454 ( .A(n390), .B(n396), .Y(\next_Memory[5][2] ) );
  NOR2X1 U455 ( .A(n392), .B(n396), .Y(\next_Memory[5][1] ) );
  NOR2X1 U456 ( .A(n394), .B(n396), .Y(\next_Memory[5][0] ) );
  OR2X1 U457 ( .A(n397), .B(n443), .Y(n396) );
  NOR2X1 U458 ( .A(n379), .B(n398), .Y(\next_Memory[1][7] ) );
  NOR2X1 U459 ( .A(n382), .B(n398), .Y(\next_Memory[1][6] ) );
  NOR2X1 U460 ( .A(n384), .B(n398), .Y(\next_Memory[1][5] ) );
  NOR2X1 U461 ( .A(n386), .B(n398), .Y(\next_Memory[1][4] ) );
  NOR2X1 U462 ( .A(n388), .B(n398), .Y(\next_Memory[1][3] ) );
  NOR2X1 U463 ( .A(n390), .B(n398), .Y(\next_Memory[1][2] ) );
  MUX2X1 U464 ( .B(n392), .A(n399), .S(n398), .Y(\next_Memory[1][1] ) );
  MUX2X1 U465 ( .B(n394), .A(n400), .S(n398), .Y(\next_Memory[1][0] ) );
  NAND3X1 U466 ( .A(paddr[0]), .B(n401), .C(n402), .Y(n398) );
  NAND2X1 U467 ( .A(framing_error), .B(n399), .Y(n400) );
  INVX1 U468 ( .A(overrun_error), .Y(n399) );
  NOR2X1 U469 ( .A(n379), .B(n403), .Y(\next_Memory[0][7] ) );
  NOR2X1 U470 ( .A(n382), .B(n403), .Y(\next_Memory[0][6] ) );
  NOR2X1 U471 ( .A(n384), .B(n403), .Y(\next_Memory[0][5] ) );
  NOR2X1 U472 ( .A(n386), .B(n403), .Y(\next_Memory[0][4] ) );
  NOR2X1 U473 ( .A(n388), .B(n403), .Y(\next_Memory[0][3] ) );
  NOR2X1 U474 ( .A(n390), .B(n403), .Y(\next_Memory[0][2] ) );
  NOR2X1 U475 ( .A(n392), .B(n403), .Y(\next_Memory[0][1] ) );
  MUX2X1 U476 ( .B(n394), .A(n404), .S(n403), .Y(\next_Memory[0][0] ) );
  NAND3X1 U477 ( .A(n443), .B(n401), .C(n402), .Y(n403) );
  INVX1 U478 ( .A(data_ready), .Y(n404) );
  INVX1 U479 ( .A(n405), .Y(n440) );
  NAND3X1 U480 ( .A(n343), .B(n344), .C(n406), .Y(n405) );
  OAI21X1 U481 ( .A(n407), .B(n408), .C(n409), .Y(n406) );
  INVX1 U482 ( .A(n410), .Y(n441) );
  NAND3X1 U483 ( .A(n343), .B(n344), .C(n411), .Y(n410) );
  OAI21X1 U484 ( .A(pwrite), .B(n407), .C(n409), .Y(n411) );
  NAND3X1 U485 ( .A(psel), .B(n412), .C(n413), .Y(n409) );
  MUX2X1 U486 ( .B(n414), .A(n415), .S(paddr[1]), .Y(n413) );
  NOR2X1 U487 ( .A(paddr[0]), .B(n415), .Y(n414) );
  OAI21X1 U488 ( .A(n370), .B(n401), .C(n408), .Y(n412) );
  INVX1 U489 ( .A(pwrite), .Y(n408) );
  INVX1 U490 ( .A(n416), .Y(n370) );
  INVX1 U491 ( .A(psel), .Y(n407) );
  INVX1 U492 ( .A(state[1]), .Y(n344) );
  NOR2X1 U493 ( .A(n416), .B(n369), .Y(data_read) );
  NAND3X1 U494 ( .A(state[1]), .B(n343), .C(penable), .Y(n369) );
  NAND3X1 U495 ( .A(paddr[1]), .B(n443), .C(paddr[2]), .Y(n416) );
  MUX2X1 U496 ( .B(n417), .A(n379), .S(n418), .Y(n216) );
  INVX1 U497 ( .A(\Memory[4][7] ), .Y(n417) );
  MUX2X1 U498 ( .B(n376), .A(n382), .S(n418), .Y(n215) );
  INVX1 U499 ( .A(\Memory[4][6] ), .Y(n376) );
  MUX2X1 U500 ( .B(n375), .A(n384), .S(n418), .Y(n214) );
  INVX1 U501 ( .A(\Memory[4][5] ), .Y(n375) );
  MUX2X1 U502 ( .B(n374), .A(n386), .S(n418), .Y(n213) );
  INVX1 U503 ( .A(\Memory[4][4] ), .Y(n374) );
  MUX2X1 U504 ( .B(n419), .A(n388), .S(n418), .Y(n212) );
  INVX1 U505 ( .A(data_size[3]), .Y(n419) );
  MUX2X1 U506 ( .B(n420), .A(n390), .S(n418), .Y(n211) );
  INVX1 U507 ( .A(data_size[2]), .Y(n420) );
  MUX2X1 U508 ( .B(n368), .A(n392), .S(n418), .Y(n210) );
  INVX1 U509 ( .A(data_size[1]), .Y(n368) );
  MUX2X1 U510 ( .B(n421), .A(n394), .S(n418), .Y(n209) );
  NOR2X1 U511 ( .A(n397), .B(paddr[0]), .Y(n418) );
  NAND3X1 U512 ( .A(paddr[2]), .B(n401), .C(n395), .Y(n397) );
  INVX1 U513 ( .A(paddr[1]), .Y(n401) );
  INVX1 U514 ( .A(data_size[0]), .Y(n421) );
  MUX2X1 U515 ( .B(n379), .A(n422), .S(n423), .Y(n208) );
  INVX1 U516 ( .A(\Memory[3][7] ), .Y(n422) );
  MUX2X1 U517 ( .B(n382), .A(n424), .S(n423), .Y(n207) );
  INVX1 U518 ( .A(\Memory[3][6] ), .Y(n424) );
  MUX2X1 U519 ( .B(n384), .A(n425), .S(n423), .Y(n206) );
  INVX1 U520 ( .A(bit_period[13]), .Y(n425) );
  MUX2X1 U521 ( .B(n386), .A(n426), .S(n423), .Y(n205) );
  INVX1 U522 ( .A(bit_period[12]), .Y(n426) );
  MUX2X1 U523 ( .B(n388), .A(n427), .S(n423), .Y(n204) );
  INVX1 U524 ( .A(bit_period[11]), .Y(n427) );
  MUX2X1 U525 ( .B(n390), .A(n428), .S(n423), .Y(n203) );
  INVX1 U526 ( .A(bit_period[10]), .Y(n428) );
  MUX2X1 U527 ( .B(n392), .A(n429), .S(n423), .Y(n202) );
  INVX1 U528 ( .A(bit_period[9]), .Y(n429) );
  MUX2X1 U529 ( .B(n394), .A(n430), .S(n423), .Y(n201) );
  NAND3X1 U530 ( .A(paddr[1]), .B(paddr[0]), .C(n402), .Y(n423) );
  INVX1 U531 ( .A(bit_period[8]), .Y(n430) );
  MUX2X1 U532 ( .B(n379), .A(n431), .S(n432), .Y(n200) );
  INVX1 U533 ( .A(bit_period[7]), .Y(n431) );
  MUX2X1 U534 ( .B(N103), .A(pwdata[7]), .S(penable), .Y(n379) );
  MUX2X1 U535 ( .B(n382), .A(n433), .S(n432), .Y(n199) );
  INVX1 U536 ( .A(bit_period[6]), .Y(n433) );
  MUX2X1 U537 ( .B(N145), .A(pwdata[6]), .S(penable), .Y(n382) );
  MUX2X1 U538 ( .B(n384), .A(n434), .S(n432), .Y(n198) );
  INVX1 U539 ( .A(bit_period[5]), .Y(n434) );
  MUX2X1 U540 ( .B(N146), .A(pwdata[5]), .S(penable), .Y(n384) );
  MUX2X1 U541 ( .B(n386), .A(n435), .S(n432), .Y(n197) );
  INVX1 U542 ( .A(bit_period[4]), .Y(n435) );
  MUX2X1 U543 ( .B(N147), .A(pwdata[4]), .S(penable), .Y(n386) );
  MUX2X1 U544 ( .B(n388), .A(n436), .S(n432), .Y(n196) );
  INVX1 U545 ( .A(bit_period[3]), .Y(n436) );
  MUX2X1 U546 ( .B(N148), .A(pwdata[3]), .S(penable), .Y(n388) );
  MUX2X1 U547 ( .B(n390), .A(n437), .S(n432), .Y(n195) );
  INVX1 U548 ( .A(bit_period[2]), .Y(n437) );
  MUX2X1 U549 ( .B(N149), .A(pwdata[2]), .S(penable), .Y(n390) );
  MUX2X1 U550 ( .B(n392), .A(n438), .S(n432), .Y(n194) );
  INVX1 U551 ( .A(bit_period[1]), .Y(n438) );
  MUX2X1 U552 ( .B(N150), .A(pwdata[1]), .S(penable), .Y(n392) );
  MUX2X1 U553 ( .B(n394), .A(n439), .S(n432), .Y(n193) );
  NAND3X1 U554 ( .A(paddr[1]), .B(n443), .C(n402), .Y(n432) );
  AND2X1 U555 ( .A(n395), .B(n415), .Y(n402) );
  INVX1 U556 ( .A(paddr[2]), .Y(n415) );
  NOR2X1 U557 ( .A(n343), .B(state[1]), .Y(n395) );
  INVX1 U558 ( .A(state[0]), .Y(n343) );
  INVX1 U559 ( .A(bit_period[0]), .Y(n439) );
  MUX2X1 U560 ( .B(N151), .A(pwdata[0]), .S(penable), .Y(n394) );
endmodule

