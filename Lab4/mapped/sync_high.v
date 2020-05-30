/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Sep 10 15:35:41 2019
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   media;

  DFFSR media_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(media) );
  DFFSR sync_out_reg ( .D(media), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out)
         );
endmodule

