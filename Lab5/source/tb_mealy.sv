// $Id: $
// File name:   tb_moore.sv
// Created:     9/21/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Moore Machine

`timescale 1ns / 10ps

module tb_mealy();
  // Define parameters
  // Common parameters
  localparam CLK_PERIOD        = 2.5;
  localparam PROPAGATION_DELAY = 0.8; // Allow for 800 ps for FF propagation delay
  localparam  RESET_OUTPUT_VALUE = 1'b0;

  // Declare Test Case Signals
  integer tb_test_num;
  int     tb_bit_num;
  string  tb_test_case;
  string  tb_stream_check_tag;
  //int     tb_bit_num;
  //logic   tb_mismatch;
  //logic   tb_check;

  // Declare the Test Bench Signals for Expected Results
  logic tb_expected_o;
  logic tb_test_data [];
  logic tb_expected_o_array [];

  // Declare DUT Connection Signals
  logic                tb_clk;
  logic                tb_n_rst;
  logic                tb_i;
  logic		       tb_o;

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

    tb_i = 1'b0;
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  // Task to cleanly and consistently check DUT output values
  task check_output;
    input tb_expected_o;
    input string check_tag;
  begin
    if(tb_expected_o == tb_o) begin // Check passed
      $info("Correct output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect output %s during %s test case (expected / actual = %d / %d)", check_tag, tb_test_case, tb_expected_o, tb_o);
    end

    // Wait some small amount of time so check pulse timing is visible on waves
    #(0.1);
    //tb_check =1'b0;
  end
  endtask

  // Task to manage the timing of sending one bit through the shift register
  task send_bit;
    input logic bit_to_send;
  begin
    // Synchronize to the negative edge of clock to prevent timing errors
    @(negedge tb_clk);
    
    // Set the value of the bit
    tb_i = bit_to_send;

    // Wait for the value to have been shifted in on the rising clock edge
    //@(negedge tb_clk);
    #(PROPAGATION_DELAY);

  end
  endtask

  // Task to contiguosly send a stream of bits through the shift register
  task send_stream;
    input logic bit_stream [];
  begin
    // Coniguously stream out all of the bits in the provided input vector
    for(tb_bit_num = 0; tb_bit_num < bit_stream.size(); tb_bit_num++) begin
      // Send the current bit
      send_bit(bit_stream[tb_bit_num]);
    end
  end
  endtask

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

  // DUT Portmap
  mealy DUT (.clk(tb_clk), .n_rst(tb_n_rst), 
                    .i(tb_i), 
                    .o(tb_o));


  // Test bench main process
  initial begin
    // Initialize all of the test inputs
    tb_n_rst            = 1'b1; // Initialize to be inactive
    tb_i                = 1'b0; // Initialize to inactive value
    tb_test_num         = 0;    // Initialize test case counter
    tb_test_case        = "Test bench initializaton";
    tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);

    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_i = 1'b0;
    tb_n_rst     = 1'b0;

    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_output(RESET_OUTPUT_VALUE, "after reset applied");

    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output(RESET_OUTPUT_VALUE, "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(negedge tb_clk);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    // Check that internal state was correctly keep after reset release
    #(PROPAGATION_DELAY);
    check_output(RESET_OUTPUT_VALUE, "after reset was released");

    // ************************************************************************
    // Test Case 2: 1101 Sequence Check
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "1101 Sequence Check";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{1, 1, 0, 1};

    // Contiguously stream enough zeros to fill the shift register
    send_stream(tb_test_data);

    // Check the result of the full stream
    check_output(1, "after 1101 fed");

    // ************************************************************************
    // Test Case 3: Overlap Sequence Check
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Overlap Sequence Check";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{1, 1, 0, 1, 1, 0, 1};
    tb_expected_o_array = '{0, 0, 0, 1, 0, 0, 1};

    // Disconiguously stream out all of the bits in the provided input vector
    for(tb_bit_num = 0; tb_bit_num < tb_test_data.size(); tb_bit_num++) begin
      // Send the current bit
      send_bit(tb_test_data[tb_bit_num]);

      // Check that the current bit got pulled in
      $sformat(tb_stream_check_tag, "for bit %0d", tb_bit_num);
      check_output(tb_expected_o_array[tb_bit_num], tb_stream_check_tag);

      // Add some spacing between the check and the start of the next bit
      //#(0.25 * CLK_PERIOD);
    end

    // STUDENT TODO: Add more test cases here

    // ************************************************************************
    // Test Case 4: Random Check 1
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Random Check 1";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{1, 1, 1, 1, 1, 1, 1};
    tb_expected_o_array = '{0, 0, 0, 0, 0, 0, 0};

    // Disconiguously stream out all of the bits in the provided input vector
    for(tb_bit_num = 0; tb_bit_num < tb_test_data.size(); tb_bit_num++) begin
      // Send the current bit
      send_bit(tb_test_data[tb_bit_num]);

      // Check that the current bit got pulled in
      $sformat(tb_stream_check_tag, "for bit %0d", tb_bit_num);
      check_output(tb_expected_o_array[tb_bit_num], tb_stream_check_tag);

      // Add some spacing between the check and the start of the next bit
      //#(0.25 * CLK_PERIOD);
    end

    // ************************************************************************
    // Test Case 5: Random Check 2
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Random Check 2";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{0, 0, 0, 0, 0, 0, 0};
    tb_expected_o_array = '{0, 0, 0, 0, 0, 0, 0};

    // Disconiguously stream out all of the bits in the provided input vector
    for(tb_bit_num = 0; tb_bit_num < tb_test_data.size(); tb_bit_num++) begin
      // Send the current bit
      send_bit(tb_test_data[tb_bit_num]);

      // Check that the current bit got pulled in
      $sformat(tb_stream_check_tag, "for bit %0d", tb_bit_num);
      check_output(tb_expected_o_array[tb_bit_num], tb_stream_check_tag);

      // Add some spacing between the check and the start of the next bit
      //#(0.25 * CLK_PERIOD);
    end

    // ************************************************************************
    // Test Case 6: Random Check 3
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Random Check 3";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{1, 0, 1, 0, 1, 0, 1};
    tb_expected_o_array = '{0, 0, 0, 0, 0, 0, 0};

    // Disconiguously stream out all of the bits in the provided input vector
    for(tb_bit_num = 0; tb_bit_num < tb_test_data.size(); tb_bit_num++) begin
      // Send the current bit
      send_bit(tb_test_data[tb_bit_num]);

      // Check that the current bit got pulled in
      $sformat(tb_stream_check_tag, "for bit %0d", tb_bit_num);
      check_output(tb_expected_o_array[tb_bit_num], tb_stream_check_tag);

      // Add some spacing between the check and the start of the next bit
      //#(0.25 * CLK_PERIOD);
    end

    // ************************************************************************
    // Test Case 7: Random Check 4
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Random Check 4";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{0, 1, 0, 1, 0, 1, 0};
    tb_expected_o_array = '{0, 0, 0, 0, 0, 0, 0};

    // Disconiguously stream out all of the bits in the provided input vector
    for(tb_bit_num = 0; tb_bit_num < tb_test_data.size(); tb_bit_num++) begin
      // Send the current bit
      send_bit(tb_test_data[tb_bit_num]);

      // Check that the current bit got pulled in
      $sformat(tb_stream_check_tag, "for bit %0d", tb_bit_num);
      check_output(tb_expected_o_array[tb_bit_num], tb_stream_check_tag);

      // Add some spacing between the check and the start of the next bit
      //#(0.25 * CLK_PERIOD);
    end

    // ************************************************************************
    // Test Case 8: 1100 Sequence Check
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "1100 Sequence Check";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{1, 1, 0, 0};

    // Contiguously stream enough zeros to fill the shift register
    send_stream(tb_test_data);

    // Check the result of the full stream
    check_output(0, "after 1101 fed");

  end
endmodule
  