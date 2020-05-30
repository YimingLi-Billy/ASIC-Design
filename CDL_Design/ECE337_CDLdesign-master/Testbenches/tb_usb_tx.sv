// $Id: $
// File name:   tb_usb_tx.sv
// Created:     11/17/2019
// Author:      Karan Oberoi
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: Starter bus model based test bench for the AHB-Lite-slave module

`timescale 1ns / 10ps

module tb_usb_tx();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay


//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing setup signals
logic                      tb_enqueue_transaction;
logic                      tb_transaction_write;
logic                      tb_transaction_fake;
logic [ADDR_MAX_BIT:0]     tb_transaction_addr;
logic [DATA_MAX_BIT:0]     tb_transaction_data;
logic                      tb_transaction_error;
logic [2:0]                tb_transaction_size;
// Testing control signal(s)
logic    tb_enable_transactions;
integer  tb_current_transaction_num;
logic    tb_current_transaction_error;
logic    tb_model_reset;
string   tb_test_case;
integer  tb_test_case_num;
logic [DATA_MAX_BIT:0] tb_test_data;
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// USB_tx side Signals
//*****************************************************************************
logic			[7:0] tb_tx_packet_data;
logic			[6:0] tb_tx_packet_size;
logic			[2:0] tb_tx_packet;
logic			tb_dplus_out;
logic			tb_dminus_out;
logic			tb_tx_transfer_active;
logic			tb_tx_error;
logic		 	tb_get_tx_packet_data;
// Expected value check signals
logic		 	tb_expected_dplus_out;
logic 			tb_expected_dminus_out;
logic			tb_expected_tx_transfer_active;
logic 			tb_expected_tx_error;
logic 			tb_expected_get_tx_packet_data;

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
// Bus Model Instance
//*****************************************************************************
ahb_lite_bus BFM (.clk(tb_clk),
                  // Testing setup signals
                  .enqueue_transaction(tb_enqueue_transaction),
                  .transaction_write(tb_transaction_write),
                  .transaction_fake(tb_transaction_fake),
                  .transaction_addr(tb_transaction_addr),
                  .transaction_data(tb_transaction_data),
                  .transaction_error(tb_transaction_error),
                  .transaction_size(tb_transaction_size),
                  // Testing controls
                  .model_reset(tb_model_reset),
                  .enable_transactions(tb_enable_transactions),
                  .current_transaction_num(tb_current_transaction_num),
                  .current_transaction_error(tb_current_transaction_error),
                  // AHB-Lite-Slave Side
                  .hsel(tb_hsel),
                  .htrans(tb_htrans),
                  .haddr(tb_haddr),
                  .hsize(tb_hsize),
                  .hwrite(tb_hwrite),
                  .hwdata(tb_hwdata),
                  .hrdata(tb_hrdata),
                  .hresp(tb_hresp));


//*****************************************************************************
// DUT Instance
//****************************************************************************
usb_tx main (.clk(tb_clk), .n_rst(tb_n_rst),
                    // USB TX Signls
                    .tx_packet_data(tb_tx_packet_data),
		   			.tx_packet_size(tb_tx_packet_size),
					.tx_packet(tb_tx_packet),
					.dplus_out(tb_dplus_out),
					.dminus_out(tb_dminus_out),
					.tx_transfer_active(tb_tx_tranfer_active),.
					.tx_error(tb_tx_error),
					.get_tx_packet_	data(tb_get_tx_packet_data)
                    .hresp(tb_hresp));

//*****************************************************************************
// DUT Related TB Tasks
//*****************************************************************************
// Task for standard DUT reset procedure
task reset_dut;
begin
  // Activate the reset
  tb_n_rst = 1'b0;

  // Maintain the reset for more than one cycle
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
  tb_check    = 1'b1;
  if(tb_expected_dplus_out == tb_dplus_out) begin // Check passed
    $info("Correct 'dplus' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'dplus' output %s during %s test case", check_tag, tb_test_case);
  end
  if(tb_expected_dminus_out == tb_dminus_out) begin // Check passed
    $info("Correct 'dminus' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'dminus' output %s during %s test case", check_tag, tb_test_case);
  end
 if(tb_expected_tx_transfer_active == tb_tx_transfer_active) begin // Check passed
    $info("Correct 'transfer_active' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'transfer_active' output %s during %s test case", check_tag, tb_test_case);
  end
 if(tb_expected_tx_error == tb_tx_error) begin // Check passed
    $info("Correct 'error' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'error' output %s during %s test case", check_tag, tb_test_case);
  end  
 if(tb_expected_get_tx_packet_data == tb_get_tx_packet_data) begin // Check passed
    $info("Correct 'get_packet_data' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'get_packet data' output %s during %s test case", check_tag, tb_test_case);
  end
// Wait some small amount of time so check pulse timing is visible on waves
  #(0.1);
  tb_check =1'b0;
end
endtask

=

// Task to clear/initialize all FIR-side inputs
/*task init_fir_side;
begin
  tb_fir_out   = '0;
  tb_modwait   = 1'b0;
  tb_err       = 1'b0;
  tb_coeff_num = 2'd0;
end
endtask
*/
// Task to clear/initialize all FIR-side inputs
task init_expected_outs;
begin
  tb_expected_dplus_out = 1'b0; 
  tb_expected_dminus_out = 1'b0;
  tb_expected_tx_error = 1'b0;
  tb_expected_get_tx_packet_data = 1'b0;
  tb_expected_tx_transfer_active = 1'b0;
  
end
endtask

//*****************************************************************************
//*****************************************************************************
// Main TB Process
//****************************************************************************

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_dut();

  // Check outputs for reset state
  init_expected_outs();
  check_outputs("after DUT reset");

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);

 // Student TODO: Add more test cases here
  // Update Navigation Info
  tb_test_case     = "Sending a sample!";
  tb_test_case_num = tb_test_case_num + 1;
  init_expected_outs();
 end
endmodule
