/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Sep 10 15:31:22 2019
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   media;

  DFFSR media_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(media) );
  DFFSR sync_out_reg ( .D(media), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule

