// $Id: $
// File name:   tb_usb_tx.sv
// Created:     11/24/2019
// Author:      Yiming Li
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: Starter bus model based test bench for the AHB-Lite-slave module

`timescale 1ns / 10ps

module tb_usb_tx();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay
// Preset Values
localparam [7:0] SYNC_BYTE = 8'b00000001;
localparam [7:0] ACK_BYTE = 8'b00101101;
localparam [7:0] NAK_BYTE = 8'b10100101;
localparam [1:0] TX_IDLE = 2'b00;
localparam [1:0] TX_SEND_DATA = 2'b01;
localparam [1:0] TX_NAK = 2'b10;
localparam [1:0] TX_ACK = 2'b11;

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing control signal(s)
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;
integer                i;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// USB_tx side Signals
//*****************************************************************************
logic			[7:0] tb_tx_packet_data;
logic			[6:0] tb_tx_packet_data_size;
logic			[1:0] tb_tx_packet;
logic			tb_dplus_out;
logic			tb_dminus_out;
logic		 	tb_get_tx_packet_data;
// Expected value check signals
logic		 	tb_expected_dplus_out;
logic 		tb_expected_dminus_out;
logic 		tb_expected_get_tx_packet_data;
// Test Values
logic     [63:0][7:0] result_list;
logic     prev_dplus;

//*****************************************************************************
// Clock Generation Block
//*****************************************************************************
// Clock generation block
always begin
  // Start with clock low to avoid false rising edge events at t=0
  tb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
  tb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
end

//*****************************************************************************
// DUT Instance
//****************************************************************************
usb_tx main (.clk(tb_clk), .n_rst(tb_n_rst),
            // USB TX Signls
            .tx_packet_data(tb_tx_packet_data),
            .tx_packet_size(tb_tx_packet_data_size),
            .tx_packet(tb_tx_packet),
            .dplus_out(tb_dplus_out),
            .dminus_out(tb_dminus_out),
            .tx_transfer_active(tb_tx_tranfer_active),
            .tx_error(tb_tx_error),
            .get_tx_packet_data(tb_get_tx_packet_data),
            .hresp(tb_hresp));

//*****************************************************************************
// DUT Related TB Tasks
//*****************************************************************************
// Task for standard DUT reset procedure
task reset_dut;
begin
  // Activate the reset
  tb_n_rst = 1'b0;

  // Maintain the reset for more than one cyclediuo
  @(posedge tb_clk);
  @(posedge tb_clk);

  // Wait until safely away from rising edge of the clock before releasing
  @(negedge tb_clk);
  tb_n_rst = 1'b1;

  // Leave out of reset for a couple cycles before allowing other stimulus
  // Wait for negative clock edges, 
  // since inputs to DUT should normally be applied away from rising clock edges
  @(negedge tb_clk);
  @(negedge tb_clk);
end
endtask

// Task to cleanly and consistently check DUT output values
task check_outputs;
  input string check_tag;
begin
  tb_mismatch = 1'b0;
  if(tb_expected_dplus_out != tb_dplus_out) begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'dplus' output %s during %s test case", check_tag, tb_test_case);
  end
  if(tb_expected_dminus_out != tb_dminus_out) begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'dminus' output %s during %s test case", check_tag, tb_test_case);
  end
  if(tb_expected_get_tx_packet_data != tb_get_tx_packet_data) begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'get_tx_packet_data' output %s during %s test case", check_tag, tb_test_case);
  end
end
endtask

task test_steam;
  input [7:0] expected_result;
  integer i;
  logic [7:0] expected_dplus;
begin
  for(i = 0; i < 7; i++) begin
    if(expected_result[i] == 0) begin
      expected_dplus[i] = !prev_dplus;
      prev_dplus = expected_dplus[i];
    end else if (expected_result[i] == 1)
      expected_dplus[i] = prev_dplus;
  end
  for(i = 7; i > -1; i--) begin
    tb_expected_dplus_out = expected_dplus[i];
    tb_expected_dminus_out = !expected_dplus[i];
    tb_expected_get_tx_packet_data = 0;
    check_outputs("during test_stream");
    #(CLK_PERIOD);
  end
end
endtask

// Task to clear/initialize all FIR-side inputs
task init_expected_outs;
begin
  tb_expected_dplus_out = 1'b1; 
  tb_expected_dminus_out = 1'b0;
  tb_expected_get_tx_packet_data = 1'b0;
  
end
endtask

//*****************************************************************************
//*****************************************************************************
// Main TB Process
//****************************************************************************
always_comb begin
  if (tb_get_tx_packet_data) 
    tb_tx_packet_data = ~tb_tx_packet_data;
end
initial begin
  // Initialize Test Case Navigation Signals
  tb_test_case       = "Initilization";
  tb_test_case_num   = -1;
  // Wait some time before starting first test case
  init_expected_outs();
  #(0.1);

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_dut();

  // Check outputs for reset state
  check_outputs("after DUT reset");

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);

  //*****************************************************************************
  // NAK
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Send NAK";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_dut();
  prev_dplus = tb_dplus_out;

  tb_tx_packet = TX_NAK;
  #(CLK_PERIOD);
  test_stream(NAK_BYTE);

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);

  //*****************************************************************************
  // ACK
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Send ACK";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_dut();
  prev_dplus = tb_dplus_out;

  tb_tx_packet = TX_ACK;
  #(CLK_PERIOD);
  test_stream(ACK_BYTE);

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);

  //*****************************************************************************
  // SEND_DATA
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Send DATA";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_dut();
  prev_dplus = tb_dplus_out;
  tb_tx_packet_data = 8'b11110000; 
  tb_tx_packet_data_size = 7'b2;
  result_list[0] = tb_tx_packet_data;
  for(i = 1; i < tb_tx_packet_data_size; i++) begin
    result_list[i] = ~result_list[i-1];
  end

  tb_tx_packet = TX_SEND_DATA;
  #(CLK_PERIOD * (tb_tx_packet_data_size + 2))
  for(i = 0; i < tb_tx_packet_data_size; i++) begin
    test_steam(result_list[i]);
  end

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);

  //*****************************************************************************
  // Bit Stuffing
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Bit Stuffing";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_dut();
  prev_dplus = tb_dplus_out;
  tb_tx_packet_data = 8'b11111110; 
  tb_tx_packet_data_size = 7'b1;
  result_list[0] = 8'b11111101; // 0 in the next bit 111111010

  tb_tx_packet = TX_SEND_DATA;
  #(CLK_PERIOD * (tb_tx_packet_data_size + 2))
  test_steam(result_list[i]);
  tb_expected_dplus_out = !prev_dplus;
  tb_expected_dminus_out = prev_dplus;
  tb_expected_get_tx_packet_data = 0;
  check_outputs("during test_stream"); // checking if the next one is 0

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);

 end
endmodule
